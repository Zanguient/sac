unit UCadastro_Logradouro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro;

type
  TFrmCadastro_Logradouro = class(TForm)
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
    EdtLogradouro: TEdit;
    BBtnPesquisar: TToolButton;
    Label1: TLabel;
    CmbTipo: TComboBox;
    Label2: TLabel;
    EdtCEP: TEdit;
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
    procedure BtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
  private
    Logradouro: URegistro.TLogradouro;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Logradouro: TFrmCadastro_Logradouro;
implementation

uses UChama_Logradouro, UDM, UDeclaracao;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Logradouro.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Logradouro);
  Util.Desabilita_Campos(FrmCadastro_Logradouro);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled := True;
end;

procedure TFrmCadastro_Logradouro.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  BEGIN
    Logradouro.Excluir(Logradouro);
    Cria_Arquivo_Atualiza_Dados('DLog');
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU LOGRADOURO ' + EdtLogradouro.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled := True;
    Util.Desabilita_Campos(FrmCadastro_Logradouro)
  END;
end;

procedure TFrmCadastro_Logradouro.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Logradouro.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
          Logradouro.Inserir(Logradouro);
          Cria_Arquivo_Atualiza_Dados('ILog');
          UDeclaracao.Insere_Historico(usuario, 'CADASTROU LOGRADOURO ' + EdtLogradouro.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
          Logradouro.Alterar(Logradouro);
          Cria_Arquivo_Atualiza_Dados('ALog');
          UDeclaracao.Insere_Historico(usuario, 'ALTEROU LOGRADOURO ' + EdtLogradouro.Text + '.', TimeToStr(time), alteracao, date);
      END
        else
          exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled := True;
    Util.Desabilita_Campos(FrmCadastro_Logradouro)
end;

procedure TFrmCadastro_Logradouro.BtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Logradouro);
  Util.Limpa_Campos(FrmCadastro_Logradouro);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= False;
  achei:= false;
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);
  CmbTipo.SetFocus;
end;

function TFrmCadastro_Logradouro.Confira: boolean;
begin
    Confira:= false;
    if CmbTipo.Text = '' then
      begin
        Mensagem_Falta_Dados;
        CmbTipo.SetFocus;
        abort;
      end;

    if EdtLogradouro.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtLogradouro.SetFocus;
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

procedure TFrmCadastro_Logradouro.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Logradouro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Logradouro.Free;
        FrmCadastro_Logradouro:= Nil;
      end;
end;

procedure TFrmCadastro_Logradouro.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Logradouro);
  Util.Limpa_Campos(FrmCadastro_Logradouro);
  Util.Desabilita_Campos(FrmCadastro_Logradouro);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Logradouro.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Logradouro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin

    end;  
  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Logradouro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Logradouro.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Logradouro.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Logradouro.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Logradouro, FrmChama_Logradouro);
  FrmChama_Logradouro.ShowModal;
  FrmChama_Logradouro.Release;
end;

end.
