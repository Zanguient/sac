unit UCadastro_Plano_Financeiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls;

type
  TFrmCadastro_Plano_Financeiro = class(TForm)
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
    RGTipo: TRadioGroup;
    Label1: TLabel;
    EdtSubnivel: TEdit;
    EdtCodigo_SubNivel: TEdit;
    Label11: TLabel;
    EdtSub_Grupo: TEdit;
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
    procedure EdtCodigo_SubNivelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtSubnivelKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_SubNivelKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_SubNivelDblClick(Sender: TObject);
    procedure EdtSub_GrupoEnter(Sender: TObject);
    procedure BBtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
  private
    Plano_Financeiro: URegistro.TPlano_Financeiro;
    Util: TUtil;
    procedure Gera_Codigo;
  public
    ativo, edit, achei: boolean;
    codigo_pai: integer;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Plano_Financeiro: TFrmCadastro_Plano_Financeiro;
implementation

uses UDM, UChama_Plano_Financeiro, UDeclaracao;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Plano_Financeiro.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Plano_Financeiro);
  Util.Desabilita_Campos(FrmCadastro_Plano_Financeiro);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmCadastro_Plano_Financeiro.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  BEGIN
    Plano_Financeiro.Excluir(Plano_Financeiro);
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU PLANO FINANCEIRO ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Plano_Financeiro);
  END;
end;

procedure TFrmCadastro_Plano_Financeiro.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Plano_Financeiro.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Plano_Financeiro);
  Util.Limpa_Campos(FrmCadastro_Plano_Financeiro);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  achei:= false;
  codigo_pai:= 0;
  RGTipo.ItemIndex:= 1;
  EdtCodigo.Text:= IntToStr(Gera_Codigo_Indetity('Plano_Financeiro'));
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);
  EdtDescricao.SetFocus;

end;

procedure TFrmCadastro_Plano_Financeiro.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Plano_Financeiro.Inserir(Plano_Financeiro);
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU PLANO FINANCEIRO ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Plano_Financeiro.Alterar(Plano_Financeiro);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU PLANO FINANCEIRO ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Plano_Financeiro);
end;

function TFrmCadastro_Plano_Financeiro.Confira: boolean;
begin
    Confira:= false;
    if EdtDescricao.Text = '' then
    begin
      Mensagem_Falta_Dados;
      EdtDescricao.SetFocus;
      abort;
    end;

      Confira:= true;
end;

procedure TFrmCadastro_Plano_Financeiro.EdtCodigo_SubNivelDblClick(
  Sender: TObject);
begin
  edit:= true;
  Application.CreateForm(TFrmChama_Plano_Financeiro, FrmChama_Plano_Financeiro);
  FrmChama_Plano_Financeiro.ShowModal;
  FrmChama_Plano_Financeiro.Free;
end;

procedure TFrmCadastro_Plano_Financeiro.EdtCodigo_SubNivelKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      edit:= true;
      Application.CreateForm(TFrmChama_Plano_Financeiro, FrmChama_Plano_Financeiro);
      FrmChama_Plano_Financeiro.ShowModal;
      FrmChama_Plano_Financeiro.Free;
    end;
end;

procedure TFrmCadastro_Plano_Financeiro.Gera_Codigo;
var
  qAux: TADOQuery;
  codigo: integer;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select IDENT_CURRENT('+QuotedStr('Plano_Financeiro')+') as tipo');
      open;
    end;
    codigo:= qAux.FieldByName('tipo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Plano_Financeiro.EdtCodigo_SubNivelKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Plano_Financeiro.EdtSubnivelKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Plano_Financeiro.EdtSub_GrupoEnter(Sender: TObject);
begin
  if (EdtSub_Grupo.Text = '') then
  begin
    EdtSub_Grupo.Text:= EdtCodigo.Text;
  end;
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Plano_Financeiro.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Plano_Financeiro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Plano_Financeiro.Free;
        FrmCadastro_Plano_Financeiro:= Nil;
      end;
end;

procedure TFrmCadastro_Plano_Financeiro.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Plano_Financeiro);
  Util.Limpa_Campos(FrmCadastro_Plano_Financeiro);
  Util.Desabilita_Campos(FrmCadastro_Plano_Financeiro);
  edit:= false;
  codigo_pai:= 0;
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Plano_Financeiro.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Plano_Financeiro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Plano_Financeiro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Plano_Financeiro.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Plano_Financeiro.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Plano_Financeiro.BBtnPesquisarClick(Sender: TObject);
begin
  edit:= false;
  Application.CreateForm(TFrmChama_Plano_Financeiro, FrmChama_Plano_Financeiro);
  FrmChama_Plano_Financeiro.ShowModal;
  FrmChama_Plano_Financeiro.Free;
end;

end.
