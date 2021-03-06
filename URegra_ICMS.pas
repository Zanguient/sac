unit URegra_ICMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls;

type
  TFrmRegra_ICMS = class(TForm)
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
    EdtAliquota: TEdit;
    BBtnPesquisar: TToolButton;
    LblCargo: TLabel;
    RGTipo_Recolhimento: TRadioGroup;
    RGBase_Reduzida: TRadioGroup;
    Label1: TLabel;
    EdtPercentual_Base_Calculo_Reduzida: TEdit;
    RGBase_Acrescida: TRadioGroup;
    Label2: TLabel;
    EdtPercentual_Base_Calculo_Acrescida: TEdit;
    Label15: TLabel;
    EdtCodigo_Situacao_Tributaria: TEdit;
    EdtSituacao_Tributaria: TEdit;
    Label5: TLabel;
    EdtDescricao: TEdit;
    Label21: TLabel;
    CBModalidade_BC_ICMS: TComboBox;
    Label6: TLabel;
    CBModalidade_BC_ICMS_ST: TComboBox;
    Label53: TLabel;
    Label54: TLabel;
    EdtCFOP_V_D: TEdit;
    EdtCFOP_V_F: TEdit;
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
    procedure EdtCodigo_Situacao_TributariaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Observacao_FiscalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtSituacao_TributariaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtObservacao_FiscalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Observacao_FiscalKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtCodigo_Situacao_TributariaKeyPress(Sender: TObject;
      var Key: Char);
    procedure RGTipo_RecolhimentoClick(Sender: TObject);
    procedure EdtCodigo_Situacao_TributariaDblClick(Sender: TObject);
    procedure BBtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
  private
    Regra_ICMS: URegistro.TRegra_ICMS;
    Util: TUtil;

    procedure Verifica_Lancamento;
  public
    ativo, achei: boolean;
    codigo_situacao: AnsiString;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmRegra_ICMS: TFrmRegra_ICMS;
implementation

uses UDM, UChama_Situacao_Tributaria, UDeclaracao, UChama_Observacao_Fiscal,
  UChama_Regra_ICMS;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmRegra_ICMS.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmRegra_ICMS);
  Util.Desabilita_Campos(FrmRegra_ICMS);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmRegra_ICMS.BBtnExcluirClick(Sender: TObject);
begin
  if (CONFIRMA_EXCLUSAO) then
  BEGIN
    Regra_ICMS.Excluir(Regra_ICMS);
    Cria_Arquivo_Atualiza_Dados('DRICMS');
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU REGRA DE ICMS ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmRegra_ICMS);
  END;
end;

procedure TFrmRegra_ICMS.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmRegra_ICMS.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmRegra_ICMS);
  Util.Limpa_Campos(FrmRegra_ICMS);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  achei:= false;
  codigo_situacao:= '';
  MEdtData_Cadastro.Text:= DateToStr(date);
  EdtDescricao.SetFocus;
end;

procedure TFrmRegra_ICMS.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Regra_ICMS.Inserir(Regra_ICMS);
        Cria_Arquivo_Atualiza_Dados('IRICMS');
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU REGRA DE ICMS ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Regra_ICMS.Alterar(Regra_ICMS);
        Cria_Arquivo_Atualiza_Dados('ARICMS');
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU REGRA DE ICMS ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmRegra_ICMS);
end;

function TFrmRegra_ICMS.Confira: boolean;
begin
    Confira:= false;
    if EdtAliquota.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtAliquota.SetFocus;
        abort;
      end;

    if EdtPercentual_Base_Calculo_Reduzida.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtPercentual_Base_Calculo_Reduzida.SetFocus;
        abort;
      end;

    if EdtPercentual_Base_Calculo_Acrescida.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtPercentual_Base_Calculo_Acrescida.SetFocus;
        abort;
      end;

    if EdtCodigo_Situacao_Tributaria.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Situacao_Tributaria.SetFocus;
        abort;
      end;

      Confira:= true;
end;

procedure TFrmRegra_ICMS.EdtCodigo_Observacao_FiscalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Observacao_Fiscal, FrmChama_Observacao_Fiscal);
      FrmChama_Observacao_Fiscal.ShowModal;
      FrmChama_Observacao_Fiscal.Free;
    end;
end;

procedure TFrmRegra_ICMS.EdtCodigo_Observacao_FiscalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmRegra_ICMS.EdtCodigo_Situacao_TributariaDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Situacao_Tributaria, FrmChama_Situacao_Tributaria);
  FrmChama_Situacao_Tributaria.ShowModal;
  FrmChama_Situacao_Tributaria.Free;
end;

procedure TFrmRegra_ICMS.EdtCodigo_Situacao_TributariaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Situacao_Tributaria, FrmChama_Situacao_Tributaria);
      FrmChama_Situacao_Tributaria.ShowModal;
      FrmChama_Situacao_Tributaria.Free;
    end;
end;

procedure TFrmRegra_ICMS.EdtCodigo_Situacao_TributariaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmRegra_ICMS.EdtObservacao_FiscalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmRegra_ICMS.EdtSituacao_TributariaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmRegra_ICMS.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmRegra_ICMS.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmRegra_ICMS.Free;
        FrmRegra_ICMS:= Nil;
      end;
end;

procedure TFrmRegra_ICMS.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmRegra_ICMS);
  Util.Limpa_Campos(FrmRegra_ICMS);
  Util.Desabilita_Campos(FrmRegra_ICMS);
  CBModalidade_BC_ICMS.Clear;
  CBModalidade_BC_ICMS.Items.Add('Margem Valor Agregado');
  CBModalidade_BC_ICMS.Items.Add('Paula (valor)');
  CBModalidade_BC_ICMS.Items.Add('Pre�o Tabelado M�x. (valor)');
  CBModalidade_BC_ICMS.Items.Add('Valor da Opera��o');
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmRegra_ICMS.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmRegra_ICMS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
    end;  
  if (key = vk_escape) then
    close;
end;

procedure TFrmRegra_ICMS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmRegra_ICMS.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = False) then
    MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmRegra_ICMS.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmRegra_ICMS.RGTipo_RecolhimentoClick(Sender: TObject);
begin
  {if (RGTipo_Recolhimento.ItemIndex = 0) then
  begin
    CBModalidade_BC_ICMS.Clear;
    CBModalidade_BC_ICMS.Items.Add('Margem Valor Agregado');
    CBModalidade_BC_ICMS.Items.Add('Paula (valor)');
    CBModalidade_BC_ICMS.Items.Add('Pre�o Tabelado M�x. (valor)');
    CBModalidade_BC_ICMS.Items.Add('Valor da Opera��o');
  end
  else
  begin
    CBModalidade_BC_ICMS.Clear;
    CBModalidade_BC_ICMS.Items.Add('Pre�o Tabelado ou M�ximo Sugerido');
    CBModalidade_BC_ICMS.Items.Add('Lista Negativa');
    CBModalidade_BC_ICMS.Items.Add('Lista Positiva');
    CBModalidade_BC_ICMS.Items.Add('Lista Neutra');
    CBModalidade_BC_ICMS.Items.Add('Margem Valor Agregado (%)');
    CBModalidade_BC_ICMS.Items.Add('Pauta(valor)');
  end;}
end;

procedure TFrmRegra_ICMS.Verifica_Lancamento;
begin
  //if (codigo_situacao = '00') or (codigo_situacao = '10') or (codigo_situacao = '10') then

end;

procedure TFrmRegra_ICMS.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Regra_ICMS, FrmChama_Regra_ICMS);
  FrmChama_Regra_ICMS.ShowModal;
  FrmChama_Regra_ICMS.Release;
end;

end.
