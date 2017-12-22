unit UTratamento_ISSQN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls;

type
  TFrmTratamento_ISSQN = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ImgImagens_Comandos: TImageList;
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
    LblCargo: TLabel;
    Label1: TLabel;
    CmbOrigem: TComboBox;
    CmbDestino: TComboBox;
    Label2: TLabel;
    Label9: TLabel;
    EdtDescricao: TEdit;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    GroupBox1: TGroupBox;
    EdtRegra_ICMS_EN_Entrada: TEdit;
    EdtCodigo_Regra_ICMS_EN_Entrada: TEdit;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    EdtRegra_ICMS_EPP_Entrada: TEdit;
    EdtCodigo_Regra_ICMS_EPP_Entrada: TEdit;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    EdtRegra_ICMS_ME_Entrada: TEdit;
    EdtCodigo_Regra_ICMS_ME_Entrada: TEdit;
    Label5: TLabel;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label6: TLabel;
    EdtCodigo_Regra_ICMS_EN_Saida: TEdit;
    EdtRegra_ICMS_EN_Saida: TEdit;
    Label7: TLabel;
    EdtCodigo_Regra_ICMS_EPP_Saida: TEdit;
    EdtRegra_ICMS_EPP_Saida: TEdit;
    Label8: TLabel;
    EdtCodigo_Regra_ICMS_ME_Saida: TEdit;
    EdtRegra_ICMS_ME_Saida: TEdit;
    GroupBox7: TGroupBox;
    Label10: TLabel;
    EdtCodigo_Regra_ICMS_Nao_Contribuinte: TEdit;
    EdtRegra_ICMS_Nao_Contribuinte: TEdit;
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
    procedure EdtCodigo_Regra_ICMS_EN_EntradaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Regra_ICMS_EPP_EntradaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Regra_ICMS_ME_EntradaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Regra_ICMS_EN_SaidaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Regra_ICMS_EPP_SaidaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Regra_ICMS_ME_SaidaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Regra_ICMS_Nao_ContribuinteKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
  private
    Tratamento_ISSQN: URegistro.TTratamento_ISSQN;
    Util: TUtil;
  public
    ativo, achei: boolean;
    regra: integer;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmTratamento_ISSQN: TFrmTratamento_ISSQN;
implementation

uses UDM, UDeclaracao, UChama_Regra_ISSQN, UChama_Tratamento_ISSQN;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmTratamento_ISSQN.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmTratamento_ISSQN);
  Util.Desabilita_Campos(FrmTratamento_ISSQN);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmTratamento_ISSQN.BBtnExcluirClick(Sender: TObject);
begin
  Tratamento_ISSQN.Excluir(Tratamento_ISSQN);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  Util.Desabilita_Campos(FrmTratamento_ISSQN);
end;

procedure TFrmTratamento_ISSQN.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmTratamento_ISSQN.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
        Tratamento_ISSQN.Inserir(Tratamento_ISSQN)
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
        Tratamento_ISSQN.Alterar(Tratamento_ISSQN)
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmTratamento_ISSQN);
end;

function TFrmTratamento_ISSQN.Confira: boolean;
begin
    Confira:= false;
    if CmbOrigem.Text = '' then
      begin
        Mensagem_Falta_Dados;
        CmbOrigem.SetFocus;
        abort;
      end;

    if CmbDestino.Text = '' then
      begin
        Mensagem_Falta_Dados;
        CmbDestino.SetFocus;
        abort;
      end;

    if EdtCodigo_Regra_ICMS_EN_Entrada.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Regra_ICMS_EN_Entrada.SetFocus;
        abort;
      end;

    if EdtCodigo_Regra_ICMS_EPP_Entrada.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Regra_ICMS_EPP_Entrada.SetFocus;
        abort;
      end;

    if EdtCodigo_Regra_ICMS_ME_Entrada.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Regra_ICMS_ME_Entrada.SetFocus;
        abort;
      end;

    if EdtCodigo_Regra_ICMS_EN_Saida.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Regra_ICMS_EN_Saida.SetFocus;
        abort;
      end;

    if EdtCodigo_Regra_ICMS_EPP_Saida.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Regra_ICMS_EPP_Saida.SetFocus;
        abort;
      end;

    if EdtCodigo_Regra_ICMS_ME_Saida.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Regra_ICMS_ME_Saida.SetFocus;
        abort;
      end;

    if EdtCodigo_Regra_ICMS_Nao_Contribuinte.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Regra_ICMS_Nao_Contribuinte.SetFocus;
        abort;
      end;

      Confira:= true;
end;

procedure TFrmTratamento_ISSQN.EdtCodigo_Regra_ICMS_EN_EntradaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    regra:= 1;
    Application.CreateForm(TFrmChama_Regra_ISSQN, FrmChama_Regra_ISSQN);
    FrmChama_Regra_ISSQN.ShowModal;
    FrmChama_Regra_ISSQN.Free;
  end;
end;

procedure TFrmTratamento_ISSQN.EdtCodigo_Regra_ICMS_EN_SaidaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    regra:= 4;
    Application.CreateForm(TFrmChama_Regra_ISSQN, FrmChama_Regra_ISSQN);
    FrmChama_Regra_ISSQN.ShowModal;
    FrmChama_Regra_ISSQN.Free;
  end;
end;

procedure TFrmTratamento_ISSQN.EdtCodigo_Regra_ICMS_EPP_EntradaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    regra:= 2;
    Application.CreateForm(TFrmChama_Regra_ISSQN, FrmChama_Regra_ISSQN);
    FrmChama_Regra_ISSQN.ShowModal;
    FrmChama_Regra_ISSQN.Free;
  end;
end;

procedure TFrmTratamento_ISSQN.EdtCodigo_Regra_ICMS_EPP_SaidaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    regra:= 5;
    Application.CreateForm(TFrmChama_Regra_ISSQN, FrmChama_Regra_ISSQN);
    FrmChama_Regra_ISSQN.ShowModal;
    FrmChama_Regra_ISSQN.Free;
  end;
end;

procedure TFrmTratamento_ISSQN.EdtCodigo_Regra_ICMS_ME_EntradaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    regra:= 3;
    Application.CreateForm(TFrmChama_Regra_ISSQN, FrmChama_Regra_ISSQN);
    FrmChama_Regra_ISSQN.ShowModal;
    FrmChama_Regra_ISSQN.Free;
  end;
end;

procedure TFrmTratamento_ISSQN.EdtCodigo_Regra_ICMS_ME_SaidaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    regra:= 6;
    Application.CreateForm(TFrmChama_Regra_ISSQN, FrmChama_Regra_ISSQN);
    FrmChama_Regra_ISSQN.ShowModal;
    FrmChama_Regra_ISSQN.Free;
  end;
end;

procedure TFrmTratamento_ISSQN.EdtCodigo_Regra_ICMS_Nao_ContribuinteKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    regra:= 7;
    Application.CreateForm(TFrmChama_Regra_ISSQN, FrmChama_Regra_ISSQN);
    FrmChama_Regra_ISSQN.ShowModal;
    FrmChama_Regra_ISSQN.Free;
  end;
end;

procedure TFrmTratamento_ISSQN.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmTratamento_ISSQN.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmTratamento_ISSQN.Free;
        FrmTratamento_ISSQN:= Nil;
      end;
end;

procedure TFrmTratamento_ISSQN.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmTratamento_ISSQN);
  Util.Limpa_Campos(FrmTratamento_ISSQN);
  Util.Desabilita_Campos(FrmTratamento_ISSQN);
  PageControl2.TabIndex:= 0;
end;

procedure TFrmTratamento_ISSQN.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmTratamento_ISSQN.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmTratamento_ISSQN);
      Util.Limpa_Campos(FrmTratamento_ISSQN);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      PageControl2.TabIndex:= 0;
      MEdtData_Cadastro.SetFocus;
    end;  
  if (key = vk_escape) then
    close;
end;

procedure TFrmTratamento_ISSQN.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmTratamento_ISSQN.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmTratamento_ISSQN.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Tratamento_ISSQN, FrmChama_Tratamento_ISSQN);
  FrmChama_Tratamento_ISSQN.ShowModal;
  FrmChama_Tratamento_ISSQN.Release;
end;

end.
