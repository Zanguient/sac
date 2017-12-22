unit UCadastro_Tipo_Ocorrencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro;

type
  TFrmCadastro_Tipo_Ocorrencia = class(TForm)
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
    procedure BbtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
  private
    TOO: URegistro.TCadastro_Tipo_Ocorrencia;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Tipo_Ocorrencia: TFrmCadastro_Tipo_Ocorrencia;
implementation

uses UDM, UDeclaracao, UChama_Tipo_Ocorrencia;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Tipo_Ocorrencia.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Tipo_Ocorrencia);
  Util.Desabilita_Campos(FrmCadastro_Tipo_Ocorrencia);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmCadastro_Tipo_Ocorrencia.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    TOO.Excluir;
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU TIPO DE OCORRÊNCIA ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Tipo_Ocorrencia);
  end;
end;

procedure TFrmCadastro_Tipo_Ocorrencia.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Tipo_Ocorrencia.BbtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Tipo_Ocorrencia);
  Util.Limpa_Campos(FrmCadastro_Tipo_Ocorrencia);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  achei:= false;
  EdtDescricao.SetFocus;
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);
end;

procedure TFrmCadastro_Tipo_Ocorrencia.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        TOO.Inserir;
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU TIPO DE OCORRÊNCIA ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      end
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      begin
        TOO.Alterar;
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU TIPO DE OCORRÊNCIA ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      end
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Tipo_Ocorrencia);
end;

function TFrmCadastro_Tipo_Ocorrencia.Confira: boolean;
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

procedure TFrmCadastro_Tipo_Ocorrencia.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Tipo_Ocorrencia.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Tipo_Ocorrencia.Free;
        FrmCadastro_Tipo_Ocorrencia:= Nil;
      end;
end;

procedure TFrmCadastro_Tipo_Ocorrencia.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Tipo_Ocorrencia);
  Util.Limpa_Campos(FrmCadastro_Tipo_Ocorrencia);
  Util.Desabilita_Campos(FrmCadastro_Tipo_Ocorrencia);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Tipo_Ocorrencia.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Tipo_Ocorrencia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Tipo_Ocorrencia);
      Util.Limpa_Campos(FrmCadastro_Tipo_Ocorrencia);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      MEdtData_Cadastro.SetFocus;
    end;  
  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Tipo_Ocorrencia.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Tipo_Ocorrencia.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Tipo_Ocorrencia.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Tipo_Ocorrencia.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Tipo_Ocorrencia, FrmChama_Tipo_Ocorrencia);
  FrmChama_Tipo_Ocorrencia.ShowModal;
  FrmChama_Tipo_Ocorrencia.Release;
end;

end.
