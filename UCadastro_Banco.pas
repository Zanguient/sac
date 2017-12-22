unit UCadastro_Banco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro;

type
  TFrmCadastro_Banco = class(TForm)
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
    BBtnPesquisar: TToolButton;
    LblNome: TLabel;
    LblBanco: TLabel;
    Label1: TLabel;
    LblContato: TLabel;
    EdtNumero: TEdit;
    EdtNome: TEdit;
    MEdtTelefone: TMaskEdit;
    EdtContato: TEdit;
    BBtnNovo: TToolButton;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroEnter(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
  private
    Banco: URegistro.TBanco;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Banco: TFrmCadastro_Banco;
implementation

uses UDM, UChama_Banco, UDeclaracao;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Banco.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Banco);
  Util.Desabilita_Campos(FrmCadastro_Banco);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmCadastro_Banco.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    Banco.Excluir(Banco);
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU BANCO ' + EdtNome.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Banco);
  end;
end;

procedure TFrmCadastro_Banco.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Banco.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Banco);
  Util.Limpa_Campos(FrmCadastro_Banco);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  achei:= false;
  MEdtData_Cadastro.Text:= DateToStr(date);
  EdtNumero.SetFocus;
end;

procedure TFrmCadastro_Banco.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Banco.Inserir(Banco);
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU BANCO ' + EdtNome.Text + '.', TimeToStr(time), insercao, date);
      end
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      begin
        Banco.Alterar(Banco);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU BANCO ' + EdtNome.Text + '.', TimeToStr(time), alteracao, date);
      end
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Banco);
end;

function TFrmCadastro_Banco.Confira: boolean;
begin
    Confira:= false;
    if EdtNumero.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtNumero.SetFocus;
        abort;
      end;

    if EdtNome.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtNome.SetFocus;
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

procedure TFrmCadastro_Banco.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Banco.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Banco.Free;
        FrmCadastro_Banco:= Nil;
      end;
end;

procedure TFrmCadastro_Banco.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Banco);
  Util.Limpa_Campos(FrmCadastro_Banco);
  Util.Desabilita_Campos(FrmCadastro_Banco);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Banco.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Banco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Banco.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Banco.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = False) then
    MEdtData_Cadastro.Text:= DateToStr(date);

end;

procedure TFrmCadastro_Banco.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Banco.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Banco, FrmChama_Banco);
  FrmChama_Banco.ShowModal;
  FrmChama_Banco.Release;
end;

end.
