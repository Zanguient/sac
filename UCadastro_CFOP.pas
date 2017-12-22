unit UCadastro_CFOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls;

type
  TFrmCadastro_CFOP = class(TForm)
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
    MEdtCFOP: TMaskEdit;
    CBMostra_Imposto: TCheckBox;
    CBGera_Financeiro: TCheckBox;
    CBControla_Estoque: TCheckBox;
    RGEstoque: TRadioGroup;
    BBtnNovo: TToolButton;
    CBFatura: TCheckBox;
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
    CFOP: URegistro.TCadastro_CFOP;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_CFOP: TFrmCadastro_CFOP;
implementation

uses UDM, UDeclaracao, UChama_CFOP;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_CFOP.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_CFOP);
  Util.Desabilita_Campos(FrmCadastro_CFOP);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmCadastro_CFOP.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    CFOP.Excluir(CFOP);
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU CFOP ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_CFOP);
  end;
end;

procedure TFrmCadastro_CFOP.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_CFOP.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_CFOP);
  Util.Limpa_Campos(FrmCadastro_CFOP);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  achei:= false;
  MEdtData_Cadastro.Text:= DateToStr(date);
  MEdtCFOP.SetFocus;

end;

procedure TFrmCadastro_CFOP.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        CFOP.Inserir(CFOP);
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU CFOP ' + MEdtCFOP.Text + '.', TimeToStr(time), insercao, date);
      end
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      begin
        CFOP.Alterar(CFOP);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU CFOP ' + MEdtCFOP.Text + '.', TimeToStr(time), alteracao, date);
      end
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_CFOP);
end;

function TFrmCadastro_CFOP.Confira: boolean;
begin
    Confira:= false;
    if EdtDescricao.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtDescricao.SetFocus;
        abort;
      end;

    if MEdtCFOP.Text = '' then
      begin
        Mensagem_Falta_Dados;
        MEdtCFOP.SetFocus;
        abort;
      end;

      Confira:= true;
end;

procedure TFrmCadastro_CFOP.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_CFOP.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_CFOP.Free;
        FrmCadastro_CFOP:= Nil;
      end;
end;

procedure TFrmCadastro_CFOP.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_CFOP);
  Util.Limpa_Campos(FrmCadastro_CFOP);
  Util.Desabilita_Campos(FrmCadastro_CFOP);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_CFOP.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_CFOP.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
    end;  
  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_CFOP.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_CFOP.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = False) then
    MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_CFOP.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_CFOP.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_CFOP, FrmChama_CFOP);
  FrmChama_CFOP.ShowModal;
  FrmChama_CFOP.Release;
end;

end.
