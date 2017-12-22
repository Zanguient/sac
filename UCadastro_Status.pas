unit UCadastro_Status;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro;

type
  TFrmCadastro_Status = class(TForm)
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
    BBtnNovo: TToolButton;
    CBEncerrado: TCheckBox;
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
    procedure BBtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
  private
    Status: URegistro.TCadastro_Status;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Status: TFrmCadastro_Status;
implementation

uses UDM, UDeclaracao, UChama_Status;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Status.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Status);
  Util.Desabilita_Campos(FrmCadastro_Status);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmCadastro_Status.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    Status.Excluir;
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU STATUS ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Status);
  end;
end;

procedure TFrmCadastro_Status.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Status.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Status);
  Util.Limpa_Campos(FrmCadastro_Status);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  achei:= false;
  MEdtData_Cadastro.Text:= DateToStr(date);
  EdtDescricao.SetFocus;
end;

procedure TFrmCadastro_Status.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Status.Inserir;
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU STATUS ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      end
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      begin
        Status.Alterar;
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU STATUS ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      end
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Status);
end;

function TFrmCadastro_Status.Confira: boolean;
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

procedure TFrmCadastro_Status.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Status.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Status.Free;
        FrmCadastro_Status:= Nil;
      end;
end;

procedure TFrmCadastro_Status.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Status);
  Util.Limpa_Campos(FrmCadastro_Status);
  Util.Desabilita_Campos(FrmCadastro_Status);
end;

procedure TFrmCadastro_Status.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Status.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
    end;  
  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Status.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Status.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Status.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Status.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Status, FrmChama_Status);
  FrmChama_Status.ShowModal;
  FrmChama_Status.Release;
end;

end.
