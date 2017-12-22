unit UCadastro_Observacao_Fiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro;

type
  TFrmCadastro_Observacao_Fiscal = class(TForm)
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
    Obs_Fiscal: URegistro.TCadastro_Observacao_Fiscal;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Observacao_Fiscal: TFrmCadastro_Observacao_Fiscal;
implementation

uses UDM, UDeclaracao, UChama_Observacao_Fiscal;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Observacao_Fiscal.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Observacao_Fiscal);
  Util.Desabilita_Campos(FrmCadastro_Observacao_Fiscal);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BbtnNovo.Enabled:= true;
end;

procedure TFrmCadastro_Observacao_Fiscal.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  BEGIN
    Obs_Fiscal.Excluir(Obs_Fiscal);
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU OBS. FISCAL ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BbtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Observacao_Fiscal);
  END;
end;

procedure TFrmCadastro_Observacao_Fiscal.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Observacao_Fiscal.BbtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Observacao_Fiscal);
  Util.Limpa_Campos(FrmCadastro_Observacao_Fiscal);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BbtnNovo.Enabled:= false;
  achei:= false;
  EdtDescricao.SetFocus;
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);
end;

procedure TFrmCadastro_Observacao_Fiscal.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Obs_Fiscal.Inserir(Obs_Fiscal);
        //UDeclaracao.Insere_Historico(usuario, 'CADASTROU OBS. FISCAL ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Obs_Fiscal.Alterar(Obs_Fiscal);
        //UDeclaracao.Insere_Historico(usuario, 'ALTEROU OBS. FISCAL ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BbtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Observacao_Fiscal);
end;

function TFrmCadastro_Observacao_Fiscal.Confira: boolean;
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

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Observacao_Fiscal.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Observacao_Fiscal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Observacao_Fiscal.Free;
        FrmCadastro_Observacao_Fiscal:= Nil;
      end;
end;

procedure TFrmCadastro_Observacao_Fiscal.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Observacao_Fiscal);
  Util.Limpa_Campos(FrmCadastro_Observacao_Fiscal);
  Util.Desabilita_Campos(FrmCadastro_Observacao_Fiscal);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Observacao_Fiscal.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Observacao_Fiscal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin

    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Observacao_Fiscal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Observacao_Fiscal.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Observacao_Fiscal.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Observacao_Fiscal.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Observacao_Fiscal, FrmChama_Observacao_Fiscal);
  FrmChama_Observacao_Fiscal.ShowModal;
  FrmChama_Observacao_Fiscal.Release;
end;

end.
