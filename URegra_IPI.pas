unit URegra_IPI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls;

type
  TFrmRegra_IPI = class(TForm)
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
    Label84: TLabel;
    CBTipo_Calculo: TComboBox;
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
    procedure EdtCodigo_NCMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_NCMKeyPress(Sender: TObject; var Key: Char);
    procedure EdtNCMKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Situacao_TributariaKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtSituacao_TributariaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Situacao_TributariaDblClick(Sender: TObject);
    procedure BBtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
  private
    Regra_IPI: URegistro.TRegra_IPI;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmRegra_IPI: TFrmRegra_IPI;
implementation

uses UDM, UChama_Situacao_Tributaria, UDeclaracao, UChama_NCM, UChama_Regra_IPI;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmRegra_IPI.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmRegra_IPI);
  Util.Desabilita_Campos(FrmRegra_IPI);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmRegra_IPI.BBtnExcluirClick(Sender: TObject);
begin
  if (CONFIRMA_EXCLUSAO) then
  BEGIN
    Regra_IPI.Excluir(Regra_IPI);
    Cria_Arquivo_Atualiza_Dados('DRIPI');
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU REGRA DE IPI ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmRegra_IPI);
  END;
end;

procedure TFrmRegra_IPI.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmRegra_IPI.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmRegra_IPI);
  Util.Limpa_Campos(FrmRegra_IPI);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= False;
  achei:= false;
  MEdtData_Cadastro.Text:= DateToStr(date);
  EdtDescricao.SetFocus;
end;

procedure TFrmRegra_IPI.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Regra_IPI.Inserir(Regra_IPI);
        Cria_Arquivo_Atualiza_Dados('IRIPI');
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU REGRA DE IPI ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Regra_IPI.Alterar(Regra_IPI);
        Cria_Arquivo_Atualiza_Dados('ARIPI');
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU REGRA DE IPI ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmRegra_IPI);
end;

function TFrmRegra_IPI.Confira: boolean;
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

procedure TFrmRegra_IPI.EdtCodigo_NCMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_NCM, FrmChama_NCM);
      FrmChama_NCM.ShowModal;
      FrmChama_NCM.Free;
    end;
end;

procedure TFrmRegra_IPI.EdtCodigo_NCMKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmRegra_IPI.EdtCodigo_Situacao_TributariaDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Situacao_Tributaria, FrmChama_Situacao_Tributaria);
  FrmChama_Situacao_Tributaria.ShowModal;
  FrmChama_Situacao_Tributaria.Free;
end;

procedure TFrmRegra_IPI.EdtCodigo_Situacao_TributariaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Situacao_Tributaria, FrmChama_Situacao_Tributaria);
      FrmChama_Situacao_Tributaria.ShowModal;
      FrmChama_Situacao_Tributaria.Free;
    end;
end;

procedure TFrmRegra_IPI.EdtCodigo_Situacao_TributariaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmRegra_IPI.EdtNCMKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmRegra_IPI.EdtSituacao_TributariaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmRegra_IPI.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmRegra_IPI.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmRegra_IPI.Free;
        FrmRegra_IPI:= Nil;
      end;
end;

procedure TFrmRegra_IPI.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmRegra_IPI);
  Util.Limpa_Campos(FrmRegra_IPI);
  Util.Desabilita_Campos(FrmRegra_IPI);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmRegra_IPI.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmRegra_IPI.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
    end;  
  if (key = vk_escape) then
    close;
end;

procedure TFrmRegra_IPI.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmRegra_IPI.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = False) then
    MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmRegra_IPI.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmRegra_IPI.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Regra_IPI, FrmChama_Regra_IPI);
  FrmChama_Regra_IPI.ShowModal;
  FrmChama_Regra_IPI.Release;
end;

end.
