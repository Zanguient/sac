unit URegra_COFINS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls;

type
  TFrmRegra_COFINS = class(TForm)
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
    CBTipo_Calculo: TComboBox;
    Label84: TLabel;
    BbtnNovo: TToolButton;
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
    procedure EdtCodigo_Situacao_TributariaKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtSituacao_TributariaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Situacao_TributariaDblClick(Sender: TObject);
    procedure BbtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
  private
    Regra_COFINS: URegistro.TRegra_COFINS;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmRegra_COFINS: TFrmRegra_COFINS;
implementation

uses UDM, UChama_Situacao_Tributaria, UDeclaracao, UChama_Observacao_Fiscal,
  UChama_Regra_COFINS;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmRegra_COFINS.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmRegra_COFINS);
  Util.Desabilita_Campos(FrmRegra_COFINS);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmRegra_COFINS.BBtnExcluirClick(Sender: TObject);
begin
  if (CONFIRMA_EXCLUSAO) then
  BEGIN
    Regra_COFINS.Excluir(Regra_COFINS);
    Cria_Arquivo_Atualiza_Dados('DRCOFINS');
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU REGRA DE COFINS ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmRegra_COFINS);
  END;
end;

procedure TFrmRegra_COFINS.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmRegra_COFINS.BbtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmRegra_COFINS);
  Util.Limpa_Campos(FrmRegra_COFINS);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  achei:= false;
  MEdtData_Cadastro.Text:= DateToStr(date);
  EdtDescricao.SetFocus;
end;

procedure TFrmRegra_COFINS.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Regra_COFINS.Inserir(Regra_COFINS);
        Cria_Arquivo_Atualiza_Dados('IRCOFINS');
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU REGRA DE COFINS ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Regra_COFINS.Alterar(Regra_COFINS);
        Cria_Arquivo_Atualiza_Dados('ARCOFINS');
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU REGRA DE COFINS ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmRegra_COFINS);
end;

function TFrmRegra_COFINS.Confira: boolean;
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

procedure TFrmRegra_COFINS.EdtCodigo_Situacao_TributariaDblClick(
  Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Situacao_Tributaria, FrmChama_Situacao_Tributaria);
  FrmChama_Situacao_Tributaria.ShowModal;
  FrmChama_Situacao_Tributaria.Free;
end;

procedure TFrmRegra_COFINS.EdtCodigo_Situacao_TributariaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Situacao_Tributaria, FrmChama_Situacao_Tributaria);
      FrmChama_Situacao_Tributaria.ShowModal;
      FrmChama_Situacao_Tributaria.Free;
    end;
end;

procedure TFrmRegra_COFINS.EdtCodigo_Situacao_TributariaKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmRegra_COFINS.EdtSituacao_TributariaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmRegra_COFINS.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmRegra_COFINS.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmRegra_COFINS.Free;
        FrmRegra_COFINS:= Nil;
      end;
end;

procedure TFrmRegra_COFINS.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmRegra_COFINS);
  Util.Limpa_Campos(FrmRegra_COFINS);
  Util.Desabilita_Campos(FrmRegra_COFINS);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmRegra_COFINS.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmRegra_COFINS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin

    end;  
  if (key = vk_escape) then
    close;
end;

procedure TFrmRegra_COFINS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmRegra_COFINS.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmRegra_COFINS.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmRegra_COFINS.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Regra_Cofins, FrmChama_Regra_Cofins);
  FrmChama_Regra_Cofins.ShowModal;
  FrmChama_Regra_Cofins.Release;
end;

end.
