unit UOcorrencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro;

type
  TFrmOcorrencia = class(TForm)
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
    BBtnPesquisar: TToolButton;
    LblCargo: TLabel;
    EdtTipo_Ocorrencia: TEdit;
    EdtCodigo_Tipo_Ocorrencia: TEdit;
    Label1: TLabel;
    MmoObservacoes: TMemo;
    Label2: TLabel;
    MEdtData_Ocorrencia: TMaskEdit;
    Label3: TLabel;
    EdtFuncionario: TEdit;
    EdtCodigo_Funcionario: TEdit;
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
    procedure EdtCodigo_Tipo_OcorrenciaDblClick(Sender: TObject);
    procedure EdtCodigo_Tipo_OcorrenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_FuncionarioDblClick(Sender: TObject);
    procedure MEdtData_OcorrenciaEnter(Sender: TObject);
    procedure MEdtData_OcorrenciaExit(Sender: TObject);
    procedure EdtCodigo_FuncionarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BbtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
    procedure EdtCodigo_FuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Tipo_OcorrenciaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTipo_OcorrenciaKeyPress(Sender: TObject; var Key: Char);
  private
    Oco: URegistro.TRegistro_Ocorrencia;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmOcorrencia: TFrmOcorrencia;
implementation

uses UDM, UDeclaracao, UChama_Tipo_Ocorrencia, UChama_Tipo_Documento,
  UChama_Funcionario, UChama_Ocorrencia;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmOcorrencia.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmOcorrencia);
  Util.Desabilita_Campos(FrmOcorrencia);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmOcorrencia.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    Oco.Excluir;
    UDeclaracao.Insere_Historico(usuario, 'REGISTROU OCORRÊNCIA ' + EdtTipo_Ocorrencia.Text + ' PARA O FUNCIONÁRIO '+EdtFuncionario.Text+'.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmOcorrencia);
  end;
end;

procedure TFrmOcorrencia.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmOcorrencia.BbtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmOcorrencia);
  Util.Limpa_Campos(FrmOcorrencia);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= False;
  achei:= false;
  EdtCodigo_Funcionario.SetFocus;
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Ocorrencia);
end;

procedure TFrmOcorrencia.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Oco.Inserir;
        UDeclaracao.Insere_Historico(usuario, 'REGISTROU OCORRÊNCIA ' + EdtTipo_Ocorrencia.Text + ' PARA O FUNCIONÁRIO '+EdtFuncionario.Text+'.', TimeToStr(time), insercao, date);
      end
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      begin
        Oco.Alterar;
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU OCORRÊNCIA ' + EdtTipo_Ocorrencia.Text + ' PARA O FUNCIONÁRIO '+EdtFuncionario.Text+'.', TimeToStr(time), alteracao, date);
      end
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmOcorrencia);
end;

function TFrmOcorrencia.Confira: boolean;
begin
  Confira:= false;
  if EdtCodigo_Funcionario.Text = '' then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Funcionario.SetFocus;
    abort;
  end;

  if EdtCodigo_Tipo_Ocorrencia.Text = '' then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Tipo_Ocorrencia.SetFocus;
    abort;
  end;

  if MEdtData_Ocorrencia.Text = '  /  /    ' then
  begin
    Mensagem_Falta_Dados;
    MEdtData_Ocorrencia.SetFocus;
    abort;
  end;

  Confira:= true;
end;

procedure TFrmOcorrencia.EdtCodigo_FuncionarioDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Funcionario, FrmChama_Funcionario);
  FrmChama_Funcionario.ShowModal;
  FrmChama_Funcionario.Release;
end;

procedure TFrmOcorrencia.EdtCodigo_FuncionarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Funcionario, FrmChama_Funcionario);
    FrmChama_Funcionario.ShowModal;
    FrmChama_Funcionario.Release;
  end;
end;

procedure TFrmOcorrencia.EdtCodigo_FuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOcorrencia.EdtCodigo_Tipo_OcorrenciaDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Tipo_Ocorrencia, FrmChama_Tipo_Ocorrencia);
  FrmChama_Tipo_Ocorrencia.ShowModal;
  FrmChama_Tipo_Ocorrencia.Release;
end;

procedure TFrmOcorrencia.EdtCodigo_Tipo_OcorrenciaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    Application.CreateForm(TFrmChama_Tipo_Ocorrencia, FrmChama_Tipo_Ocorrencia);
    FrmChama_Tipo_Ocorrencia.ShowModal;
    FrmChama_Tipo_Ocorrencia.Release;
  end;
end;

procedure TFrmOcorrencia.EdtCodigo_Tipo_OcorrenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOcorrencia.EdtFuncionarioKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOcorrencia.EdtTipo_OcorrenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOcorrencia.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmOcorrencia.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      cancele;
      Abort;
    end
    else
      begin
        FrmOcorrencia.Free;
        FrmOcorrencia:= Nil;
      end;
end;

procedure TFrmOcorrencia.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmOcorrencia);
  Util.Limpa_Campos(FrmOcorrencia);
  Util.Desabilita_Campos(FrmOcorrencia);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmOcorrencia.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmOcorrencia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmOcorrencia);
      Util.Limpa_Campos(FrmOcorrencia);
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

procedure TFrmOcorrencia.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmOcorrencia.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmOcorrencia.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmOcorrencia.MEdtData_OcorrenciaEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Ocorrencia.Text:= DateToStr(date);
end;

procedure TFrmOcorrencia.MEdtData_OcorrenciaExit(Sender: TObject);
begin
    Util.Verifica_Data(MEdtData_Ocorrencia);
end;

procedure TFrmOcorrencia.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Ocorrencia, FrmChama_Ocorrencia);
  FrmChama_Ocorrencia.ShowModal;
  FrmChama_Ocorrencia.Release;
end;

end.
