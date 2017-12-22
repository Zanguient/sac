unit UCadastro_Situacao_Tributaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls;

type
  TFrmCadastro_Situacao_Tributaria = class(TForm)
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
    LblCargo: TLabel;
    Label1: TLabel;
    EdtCodigo_Situacao: TEdit;
    Label2: TLabel;
    EdtOrigem: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EdtDescricao_CSOSN: TEdit;
    EdtCSOSN: TEdit;
    Label16: TLabel;
    EdtCodigo_Observacao_Fiscal: TEdit;
    EdtObservacao_Fiscal: TEdit;
    BBtnNovo: TToolButton;
    RGPermite_Credito: TRadioGroup;
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
    procedure EdtCodigo_Observacao_FiscalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdtData_CadastroExit(Sender: TObject);
    procedure BBtnNovoClick(Sender: TObject);
    procedure EdtCodigo_Observacao_FiscalKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtObservacao_FiscalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtOrigemKeyPress(Sender: TObject; var Key: Char);
  private
    Codigo_Sit: URegistro.TCadastro_Situacao_Tributaria;
    Util: TUtil;
    procedure Gera_Codigo;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Situacao_Tributaria: TFrmCadastro_Situacao_Tributaria;
implementation

uses UDM, UDeclaracao, UChama_Situacao_Tributaria, UChama_Observacao_Fiscal;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Situacao_Tributaria.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Situacao_Tributaria);
  Util.Desabilita_Campos(FrmCadastro_Situacao_Tributaria);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmCadastro_Situacao_Tributaria.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  BEGIN
    Codigo_Sit.Excluir(Codigo_Sit);
    Cria_Arquivo_Atualiza_Dados('DCST');
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU SITUAÇÃO TRIBUTÁRIA ' + EdtCodigo_Situacao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Situacao_Tributaria);
  END;
end;

procedure TFrmCadastro_Situacao_Tributaria.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Situacao_Tributaria.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Situacao_Tributaria);
  Util.Limpa_Campos(FrmCadastro_Situacao_Tributaria);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  achei:= false;
  EdtOrigem.SetFocus;
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);
end;

procedure TFrmCadastro_Situacao_Tributaria.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        //Gera_Codigo;
        Codigo_Sit.Inserir(Codigo_Sit);
        Cria_Arquivo_Atualiza_Dados('ICST');
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU SITUAÇÃO TRIBUTÁRIA ' + EdtCodigo_Situacao.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Codigo_Sit.Alterar(Codigo_Sit);
        Cria_Arquivo_Atualiza_Dados('ACST');
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU SITUAÇÃO TRIBUTÁRIA ' + EdtCodigo_Situacao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Situacao_Tributaria);
end;

procedure TFrmCadastro_Situacao_Tributaria.Gera_Codigo;
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
      add('select max(Codigo) as Codigo from Cadastro_Situacao_Tributaria ');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

function TFrmCadastro_Situacao_Tributaria.Confira: boolean;
begin
    Confira:= false;
    if EdtDescricao.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtDescricao.SetFocus;
        abort;
      end;

    if EdtOrigem.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtOrigem.SetFocus;
        abort;
      end;

    if EdtCodigo_Situacao.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Situacao.SetFocus;
        abort;
      end;

      Confira:= true;
end;

procedure TFrmCadastro_Situacao_Tributaria.EdtCodigo_Observacao_FiscalKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Observacao_Fiscal, FrmChama_Observacao_Fiscal);
    FrmChama_Observacao_Fiscal.ShowModal;
    FrmChama_Observacao_Fiscal.Free;
  end;
end;

procedure TFrmCadastro_Situacao_Tributaria.EdtCodigo_Observacao_FiscalKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Situacao_Tributaria.EdtObservacao_FiscalKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Situacao_Tributaria.EdtOrigemKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmCadastro_Situacao_Tributaria.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Situacao_Tributaria.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Situacao_Tributaria.Free;
        FrmCadastro_Situacao_Tributaria:= Nil;
      end;
end;

procedure TFrmCadastro_Situacao_Tributaria.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Situacao_Tributaria);
  Util.Limpa_Campos(FrmCadastro_Situacao_Tributaria);
  Util.Desabilita_Campos(FrmCadastro_Situacao_Tributaria);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Situacao_Tributaria.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Situacao_Tributaria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
    end;  
  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Situacao_Tributaria.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Situacao_Tributaria.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = False) then
    MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Situacao_Tributaria.MEdtData_CadastroExit(
  Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Situacao_Tributaria.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Situacao_Tributaria, FrmChama_Situacao_Tributaria);
  FrmChama_Situacao_Tributaria.ShowModal;
  FrmChama_Situacao_Tributaria.Release;
end;

end.
