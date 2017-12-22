unit UCadastro_Itens_Folha_Pagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro;

type
  TFrmCadastro_Itens_Folha_Pagamento = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    MEdtData_Cadastro: TMaskEdit;
    LblData_Cadastro: TLabel;
    LblMarca: TLabel;
    EdtDescricao: TEdit;
    BBtnPesquisar: TToolButton;
    LblNome: TLabel;
    CmbNatureza: TComboBox;
    BBtnNovo: TToolButton;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtData_CadastroEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
    procedure BBtnNovoClick(Sender: TObject);
  private
    Itens_Folha: URegistro.TItens_Folha;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Itens_Folha_Pagamento: TFrmCadastro_Itens_Folha_Pagamento;
implementation

uses UDM, UChama_Itens_Folha, UDeclaracao;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Itens_Folha_Pagamento.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Itens_Folha_Pagamento);
  Util.Desabilita_Campos(FrmCadastro_Itens_Folha_Pagamento);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmCadastro_Itens_Folha_Pagamento.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  BEGIN
    Itens_Folha.Excluir(Itens_Folha);
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU ITEM DA FOLHA DE PAGAMENTO ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Itens_Folha_Pagamento);
  END;
end;

procedure TFrmCadastro_Itens_Folha_Pagamento.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Itens_Folha_Pagamento.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Itens_Folha_Pagamento);
  Util.Limpa_Campos(FrmCadastro_Itens_Folha_Pagamento);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  achei:= false;
  MEdtData_Cadastro.Text:= DateToStr(date);
  EdtDescricao.SetFocus;
end;

procedure TFrmCadastro_Itens_Folha_Pagamento.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Itens_Folha.Inserir(Itens_Folha);
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU ITEM DA FOLHA DE PAGAMENTO ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Itens_Folha.Alterar(Itens_Folha);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU ITEM DA FOLHA DE PAGAMENTO ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Itens_Folha_Pagamento);
end;

function TFrmCadastro_Itens_Folha_Pagamento.Confira: boolean;
begin
    Confira:= false;
    if EdtDescricao.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtDescricao.SetFocus;
        abort;
      end;

    if CmbNatureza.Text = '' then
      begin
        Mensagem_Falta_Dados;
        CmbNatureza.SetFocus;
        abort;
      end;

      Confira:= true;
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Itens_Folha_Pagamento.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Itens_Folha_Pagamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Itens_Folha_Pagamento.Free;
        FrmCadastro_Itens_Folha_Pagamento:= Nil;
      end;
end;

procedure TFrmCadastro_Itens_Folha_Pagamento.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Itens_Folha_Pagamento);
  Util.Limpa_Campos(FrmCadastro_Itens_Folha_Pagamento);
  Util.Desabilita_Campos(FrmCadastro_Itens_Folha_Pagamento);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Itens_Folha_Pagamento.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Itens_Folha_Pagamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Itens_Folha_Pagamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Itens_Folha_Pagamento.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Itens_Folha_Pagamento.MEdtData_CadastroExit(
  Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Itens_Folha_Pagamento.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Itens_Folha, FrmChama_Itens_Folha);
  FrmChama_Itens_Folha.ShowModal;
  FrmChama_Itens_Folha.Release;
end;

end.
