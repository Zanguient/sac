unit UCadastro_Ocorrencia_Cobranca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  Vcl.ExtCtrls;

type
  TFrmCadastro_Ocorrencia_Cobranca = class(TForm)
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
    EdtResponsavel: TEdit;
    BBtnPesquisar: TToolButton;
    BBtnNovo: TToolButton;
    Label1: TLabel;
    MEdtData_Cobranca: TMaskEdit;
    RGOrigem: TRadioGroup;
    MmoObservacoes: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    EdtCodigo_Lancamento: TEdit;
    EdtN_Documento: TEdit;
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
    procedure MEdtData_CadastroExit(Sender: TObject);
    procedure MEdtData_CadastroEnter(Sender: TObject);
    procedure EdtLancamentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_LancamentoKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtData_CobrancaExit(Sender: TObject);
    procedure MEdtData_CobrancaEnter(Sender: TObject);
  private
    OcorrenciaCobranca: URegistro.TLancamento_Financeiro_Ocorrencia_Cobranca;
    Util: TUtil;
    NDocumento, CodigoLancamentoFinanceiro: integer;
  public
    ativo, achei: boolean;
    constructor Create(Sender: TObject; CodigoLancamentoFinanceiro, NDocumento: Integer); overload;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Ocorrencia_Cobranca: TFrmCadastro_Ocorrencia_Cobranca;
implementation

uses UDM, UDeclaracao, UChama_Ocorrencia_Cobranca;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Ocorrencia_Cobranca.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Ocorrencia_Cobranca);
  Util.Desabilita_Campos(FrmCadastro_Ocorrencia_Cobranca);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= True;
end;

procedure TFrmCadastro_Ocorrencia_Cobranca.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    OcorrenciaCobranca.Excluir;
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU OCORRÊNCIA DE COBRANÇA ' + EdtResponsavel.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Ocorrencia_Cobranca);
  end;
end;

procedure TFrmCadastro_Ocorrencia_Cobranca.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Ocorrencia_Cobranca.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Ocorrencia_Cobranca);
  Util.Limpa_Campos(FrmCadastro_Ocorrencia_Cobranca);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= False;
  achei:= false;
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);
  MEdtData_Cobranca.Text:= DateTimeToStr(now);
  EdtCodigo_Lancamento.Text:= IntToStr(CodigoLancamentoFinanceiro);
  EdtN_Documento.Text:= IntToStr(NDocumento);
  MEdtData_Cobranca.SetFocus;
end;


procedure TFrmCadastro_Ocorrencia_Cobranca.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        OcorrenciaCobranca.Inserir();
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU OCORRÊNCIA DE COBRANÇA ' + EdtResponsavel.Text + '.', TimeToStr(time), insercao, date);
      end
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      begin
        OcorrenciaCobranca.Alterar();
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU OCORRÊNCIA DE COBRANÇA ' + EdtResponsavel.Text + '.', TimeToStr(time), alteracao, date);
      end
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= True;
    Util.Desabilita_Campos(FrmCadastro_Ocorrencia_Cobranca);
end;

function TFrmCadastro_Ocorrencia_Cobranca.Confira: boolean;
begin
  Confira:= false;
  if (EdtResponsavel.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtResponsavel.SetFocus;
    abort;
  end;

  if (EdtCodigo_Lancamento.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Lancamento.SetFocus;
    abort;
  end;

  if (MmoObservacoes.Text = '') then
  begin
    Mensagem_Falta_Dados;
    MmoObservacoes.SetFocus;
    abort;
  end;

  if (MEdtData_Cobranca.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    MEdtData_Cobranca.SetFocus;
    abort;
  end;

  Confira:= true;
end;

constructor TFrmCadastro_Ocorrencia_Cobranca.Create(Sender: TObject;
  CodigoLancamentoFinanceiro, NDocumento: Integer);
begin
  //BBtnNovoClick(nil);
  //FrmCadastro_Ocorrencia_Cobranca:= TFrmCadastro_Ocorrencia_Cobranca.Create(Self);
  Self.CodigoLancamentoFinanceiro:= CodigoLancamentoFinanceiro;
  Self.NDocumento:= NDocumento;
  //inherited Create(FrmCadastro_Ocorrencia_Cobranca);
end;

procedure TFrmCadastro_Ocorrencia_Cobranca.EdtCodigo_LancamentoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Ocorrencia_Cobranca.EdtLancamentoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Ocorrencia_Cobranca.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Ocorrencia_Cobranca.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Ocorrencia_Cobranca.Free;
        FrmCadastro_Ocorrencia_Cobranca:= Nil;
      end;
end;

procedure TFrmCadastro_Ocorrencia_Cobranca.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Ocorrencia_Cobranca);
  Util.Limpa_Campos(FrmCadastro_Ocorrencia_Cobranca);
  Util.Desabilita_Campos(FrmCadastro_Ocorrencia_Cobranca);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Ocorrencia_Cobranca.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Ocorrencia_Cobranca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Ocorrencia_Cobranca.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Ocorrencia_Cobranca.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Ocorrencia_Cobranca.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Ocorrencia_Cobranca.MEdtData_CobrancaEnter(
  Sender: TObject);
begin
  MEdtData_Cobranca.Text:= DateTimeToStr(now);
end;

procedure TFrmCadastro_Ocorrencia_Cobranca.MEdtData_CobrancaExit(
  Sender: TObject);
begin
  if not(Util.VerificaDataHoraValida(MEdtData_Cobranca)) then
  begin
    Mensagem_Falta_Dados;
    MEdtData_Cobranca.SetFocus;
  end;
end;

procedure TFrmCadastro_Ocorrencia_Cobranca.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Ocorrencia_Cobranca, FrmChama_Ocorrencia_Cobranca);
  FrmChama_Ocorrencia_Cobranca.ShowModal;
  FrmChama_Ocorrencia_Cobranca.Release;
end;

end.
