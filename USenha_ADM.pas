unit USenha_ADM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, Registry, ImgList, ADODB;

type
  TFrmSenha_ADM = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    EdtLogin: TEdit;
    EdtSenha: TEdit;
    btOK: TBitBtn;
    BalloonHint1: TBalloonHint;
    ImageList1: TImageList;
    procedure btOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtCancelaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    tentativas: integer;
    qAux: TADOQuery;
    procedure Chama_Usuario;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSenha_ADM: TFrmSenha_ADM;
implementation

uses UDM, UDeclaracao, UPedido_Venda, UAlteracao_Produto,
  UCadastro_Tabela_Preco, UCadastro_Produto, UPDV, ULancamento_Financeiro,
  UFechamento_Venda_PDV, UNFE, UCarrega_Pedido_Caixa, ULancamento_Caixa;

{$R *.dfm}

procedure TFrmSenha_ADM.BtCancelaClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmSenha_ADM.btOKClick(Sender: TObject);
var
  login, senha: AnsiString;
  perfil, i: integer;
begin
    //StatusBar.Panels[1].Text:= IntToStr(tentativas);
    login:= EdtLogin.Text;
    senha:= EdtSenha.Text;
    Chama_Usuario;
    if not qAux.Locate('Login;Senha;Administrador', VarArrayOf([login, senha, 'SIM']),[]) then
    begin
      Application.MessageBox('Usuário não encontrado ou não é um administrador.', 'Usuário inválido', MB_OK+MB_ICONHAND);
      EdtLogin.SetFocus;
      inc(tentativas);
      liberado_analise_venda:= false;
      libera_alterar_atendente_pedido:= false;
      liberado_cliente_acima_limite:= false;
      libera_alterar_usuario_caixa := false;
    end
    else
    begin
      if (FrmPedido_Venda <> nil) and (FrmPedido_Venda.ativo = true) and (FrmPedido_Venda.uso_tela_pedido = 0) then
      begin
        if (FrmPedido_Venda.permissao = 0) then
        begin
          liberado_analise_venda:= true;
          UDeclaracao.Insere_Historico(usuario, 'FOI LIBERADO A ANÁLISE DE VENDA DO PEDIDO Nº ' + FrmPedido_Venda.EdtN_Pedido.Text + ', ATRAVÉS DA SENHA DO ADMINISTRADOR ' + login + '.' , TimeToStr(time), insercao, date);
        end;
      end
      else if (FrmPedido_Venda <> nil) and (FrmPedido_Venda.ativo = true) and (FrmPedido_Venda.uso_tela_pedido = 1) then
      begin
        liberado_cliente_acima_limite:= true;
        UDeclaracao.Insere_Historico(usuario, 'FOI LIBERADO A VENDA Nº ' + FrmPedido_Venda.EdtN_Pedido.Text + ', PARA O CLIENTE '+FrmPedido_Venda.EdtCliente.Text+', ATRAVÉS DA SENHA DO ADMINISTRADOR ' + login + '.' , TimeToStr(time), insercao, date);
      end
      else if (FrmPedido_Venda <> nil) and (FrmPedido_Venda.ativo = true) and (FrmPedido_Venda.uso_tela_pedido = 2) then
      begin
        libera_alterar_atendente_pedido:= true;
        UDeclaracao.Insere_Historico(usuario, 'FOI LIBERADO A ALTERAÇÃO DO VENDEDOR ' + FrmPedido_Venda.EdtAtendente.Text + ', COM O NÚMERO DO PEDIDO '+FrmPedido_Venda.EdtN_Pedido.Text+', ATRAVÉS DA SENHA DO ADMINISTRADOR ' + login + '.' , TimeToStr(time), insercao, date);
      end
      else if (FrmPedido_Venda <> nil) and (FrmPedido_Venda.ativo = true) and (FrmPedido_Venda.uso_tela_pedido = 3) then
      begin
        libera_visualizar_comissao_servico:= true;
        UDeclaracao.Insere_Historico(usuario, 'FOI LIBERADA A VISUALIZAÇÃO DA COMISSÃO DE SERVIÇO NO PEDIDO ' + FrmPedido_Venda.EdtN_Pedido.Text + '.', TimeToStr(time), insercao, date);
      end
      else if (FrmAlteracao_Produto <> nil) and (FrmAlteracao_Produto.ativo = true) then
      begin
        FrmAlteracao_Produto.liberado:= true;
      end
      else if (FrmCadastro_Tabela_Preco <> nil) and (FrmCadastro_Tabela_Preco.ativo) then
      begin
        FrmCadastro_Tabela_Preco.liberado:= true;
      end
      else if (FrmCadastro_Produto <> nil) and (FrmCadastro_Produto.ativo) then
      begin
        FrmCadastro_Produto.libera_exclusao:= true;
      end
      else if (FrmPDV <> nil) and (FrmPDV.ativo) then
      begin
        FrmPDV.libera_cancelar_item:= true;
      end
      else if (FrmLancamento_Financeiro <> nil) and (FrmLancamento_Financeiro.ativo) then
      begin
        FrmLancamento_Financeiro.liberado:= true;
      end
      else if (FrmFechamento_Venda_PDV <> nil) then
      begin
        liberado_cliente_acima_limite:= true;
      end
      else if (FrmNFE <> nil) then
      begin
        liberado_cliente_acima_limite:= true;
      end
      else  if (FrmLancamento_Caixa <> nil) and (FrmLancamento_Caixa.ativo) then
      begin
        libera_alterar_usuario_caixa:= true;
      end
      else if (FrmCarrega_Pedido_Caixa <> nil) then
      begin
        liberado_cliente_acima_limite:= true;
      end;

      FrmSenha_ADM.Close;
    end;
end;

procedure TFrmSenha_ADM.Chama_Usuario;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select * from Cadastro_Usuario');
      open;
    end;
  finally

  end;
end;

procedure TFrmSenha_ADM.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  //FrmControle_Acesso.Free;
  FrmSenha_ADM:= nil;
end;

procedure TFrmSenha_ADM.FormCreate(Sender: TObject);
begin
  tentativas:= 0;
  liberado_analise_venda:= false;
  liberado_desconto:= false;
end;

procedure TFrmSenha_ADM.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_ESCAPE) then
    close;
end;

procedure TFrmSenha_ADM.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.


