unit UCadastro_Usuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro;

type
  TFrmCadastro_Usuario = class(TForm)
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
    EdtNome: TEdit;
    BBtnPesquisar: TToolButton;
    Label1: TLabel;
    EdtLogin: TEdit;
    Label2: TLabel;
    EdtSenha: TEdit;
    Label3: TLabel;
    EdtPerfil: TEdit;
    EdtCodigo_Perfil: TEdit;
    CBADM: TCheckBox;
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
    procedure EdtPerfilKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_PerfilKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_PerfilKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_PerfilDblClick(Sender: TObject);
    procedure BbtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
  private
    Usuar: URegistro.TCadastro_Usuario;
    Util: TUtil;
    procedure Gera_Codigo;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Usuario: TFrmCadastro_Usuario;
implementation

uses UDM, UDeclaracao, UChama_Usuario, UChama_Perfil_Usuario;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Usuario.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Usuario);
  Util.Desabilita_Campos(FrmCadastro_Usuario);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmCadastro_Usuario.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    //Usuar.Excluir(Usuar);
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU USUÁRIO ' + EdtNome.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Usuario);
  end;
end;

procedure TFrmCadastro_Usuario.Gera_Codigo;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select max(Codigo) as Codigo from Cadastro_Usuario ');
      open;
    end;
    EdtCodigo.Text:= IntToStr(qAux.FieldByName('Codigo').AsInteger + 1);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Usuario.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Usuario.BbtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Usuario);
  Util.Limpa_Campos(FrmCadastro_Usuario);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  achei:= false;
  Gera_Codigo;
  CBADM.Checked:= true;
  EdtNome.SetFocus;
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);
end;

procedure TFrmCadastro_Usuario.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        //Usuar.Inserir(Usuar);
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU USUÁRIO ' + EdtNome.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        //Usuar.Alterar(Usuar);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU USUÁRIO ' + EdtNome.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Usuario);
end;

function TFrmCadastro_Usuario.Confira: boolean;
begin
    Confira:= false;
    if EdtNome.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtNome.SetFocus;
        abort;
      end;

    if EdtLogin.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtLogin.SetFocus;
        abort;
      end;

    if EdtSenha.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtSenha.SetFocus;
        abort;
      end;

    if EdtCodigo_Perfil.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Perfil.SetFocus;
        abort;
      end;

      Confira:= true;
end;

procedure TFrmCadastro_Usuario.EdtCodigo_PerfilDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Perfil_Usuario, FrmChama_Perfil_Usuario);
  FrmChama_Perfil_Usuario.ShowModal;
  FrmChama_Perfil_Usuario.Free;
end;

procedure TFrmCadastro_Usuario.EdtCodigo_PerfilKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Perfil_Usuario, FrmChama_Perfil_Usuario);
    FrmChama_Perfil_Usuario.ShowModal;
    FrmChama_Perfil_Usuario.Free;
  end;
end;

procedure TFrmCadastro_Usuario.EdtCodigo_PerfilKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Usuario.EdtPerfilKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Usuario.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Usuario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Usuario.Free;
        FrmCadastro_Usuario:= Nil;
      end;
end;

procedure TFrmCadastro_Usuario.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Usuario);
  Util.Limpa_Campos(FrmCadastro_Usuario);
  Util.Desabilita_Campos(FrmCadastro_Usuario);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Usuario.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Usuario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
  
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Usuario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Usuario.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Usuario.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Usuario.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Usuario, FrmChama_Usuario);
  FrmChama_Usuario.ShowModal;
  FrmChama_Usuario.Release;
end;

end.
