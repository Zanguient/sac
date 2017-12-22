unit URegra_ISSQN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls;

type
  TFrmRegra_ISSQN = class(TForm)
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
    RGTributacao: TRadioGroup;
    RGBase_Reduzida: TRadioGroup;
    Label1: TLabel;
    EdtPercentual_Base_Calculo_Reduzida: TEdit;
    RGBase_Acrescida: TRadioGroup;
    Label2: TLabel;
    EdtPercentual_Base_Calculo_Acrescida: TEdit;
    Label5: TLabel;
    EdtDescricao: TEdit;
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
    procedure BBtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
  private
    Regra_ISSQN: URegistro.TRegra_ISSQN;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmRegra_ISSQN: TFrmRegra_ISSQN;
implementation

uses UDM, UChama_Situacao_Tributaria, UDeclaracao, UChama_Regra_ISSQN;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmRegra_ISSQN.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmRegra_ISSQN);
  Util.Desabilita_Campos(FrmRegra_ISSQN);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmRegra_ISSQN.BBtnExcluirClick(Sender: TObject);
begin
  if (CONFIRMA_EXCLUSAO) then
  BEGIN
    Regra_ISSQN.Excluir(Regra_ISSQN);
    Cria_Arquivo_Atualiza_Dados('DRISS');
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU REGRA DE ISSQN ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmRegra_ISSQN);
  END;
end;

procedure TFrmRegra_ISSQN.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmRegra_ISSQN.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmRegra_ISSQN);
  Util.Limpa_Campos(FrmRegra_ISSQN);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  achei:= false;
  MEdtData_Cadastro.Text:= DateToStr(date);
  EdtDescricao.SetFocus;
end;

procedure TFrmRegra_ISSQN.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Regra_ISSQN.Inserir(Regra_ISSQN);
        Cria_Arquivo_Atualiza_Dados('IRISS');
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU REGRA DE ISSQN ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Regra_ISSQN.Alterar(Regra_ISSQN);
        Cria_Arquivo_Atualiza_Dados('ARISS');
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU REGRA DE ISSQN ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmRegra_ISSQN);
end;

function TFrmRegra_ISSQN.Confira: boolean;
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

      Confira:= true;
end;

procedure TFrmRegra_ISSQN.EdtCodigo_Situacao_TributariaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Situacao_Tributaria, FrmChama_Situacao_Tributaria);
      FrmChama_Situacao_Tributaria.ShowModal;
      FrmChama_Situacao_Tributaria.Free;
    end;
end;

procedure TFrmRegra_ISSQN.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmRegra_ISSQN.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmRegra_ISSQN.Free;
        FrmRegra_ISSQN:= Nil;
      end;
end;

procedure TFrmRegra_ISSQN.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmRegra_ISSQN);
  Util.Limpa_Campos(FrmRegra_ISSQN);
  Util.Desabilita_Campos(FrmRegra_ISSQN);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmRegra_ISSQN.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmRegra_ISSQN.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
    end;  
  if (key = vk_escape) then
    close;
end;

procedure TFrmRegra_ISSQN.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmRegra_ISSQN.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmRegra_ISSQN.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmRegra_ISSQN.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Regra_ISSQN, FrmChama_Regra_ISSQN);
  FrmChama_Regra_ISSQN.ShowModal;
  FrmChama_Regra_ISSQN.Release;
end;

end.
