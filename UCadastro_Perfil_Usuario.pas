unit UCadastro_Perfil_Usuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro;

type
  TFrmCadastro_Perfil_Usuario = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    LblMarca: TLabel;
    EdtPerfil: TEdit;
    BBtnPesquisar: TToolButton;
    TreeView1: TTreeView;
    ImageList1: TImageList;
    BBtnNovo: TToolButton;
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
    procedure EdtPerfilKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_PerfilKeyPress(Sender: TObject; var Key: Char);
    procedure TreeView1Click(Sender: TObject);
    procedure TreeView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnNovoClick(Sender: TObject);
  private
    Perfil: URegistro.TPerfil_Usuario;
    Util: TUtil;
    procedure ToggleTreeViewCheckBoxes(Node: TTreeNode; cUnChecked, cChecked: integer);
    procedure Gera_Codigo;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

const
  cFlatChecked = 1;
  cFlatUnCheck = 2;

var
  FrmCadastro_Perfil_Usuario: TFrmCadastro_Perfil_Usuario;
implementation

uses UDM, UDeclaracao, UChama_Perfil_Usuario;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Perfil_Usuario.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Perfil_Usuario);
  Util.Desabilita_Campos(FrmCadastro_Perfil_Usuario);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmCadastro_Perfil_Usuario.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    Perfil.Excluir;
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU PERFIL DE USUÁRIOS ' + EdtPerfil.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Perfil_Usuario);
  end;
end;

procedure TFrmCadastro_Perfil_Usuario.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Perfil_Usuario.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Perfil_Usuario);
  Util.Limpa_Campos(FrmCadastro_Perfil_Usuario);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  achei:= false;
  Gera_Codigo;
end;

procedure TFrmCadastro_Perfil_Usuario.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Perfil.Inserir;
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU PERFIL DE USUÁRIO ' + EdtPerfil.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Perfil.Alterar;
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU PERFIL DE USUÁRIO ' + EdtPerfil.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Perfil_Usuario);
end;

function TFrmCadastro_Perfil_Usuario.Confira: boolean;
begin
  Confira:= false;
  if (EdtPerfil.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtPerfil.SetFocus;
    Abort;
  end;
  Confira:= true;
end;

procedure TFrmCadastro_Perfil_Usuario.EdtCodigo_PerfilKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Perfil_Usuario.EdtPerfilKeyPress(Sender: TObject;
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

procedure TFrmCadastro_Perfil_Usuario.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Perfil_Usuario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Perfil_Usuario.Free;
        FrmCadastro_Perfil_Usuario:= Nil;
      end;
end;

procedure TFrmCadastro_Perfil_Usuario.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Perfil_Usuario);
  Util.Limpa_Campos(FrmCadastro_Perfil_Usuario);
  Util.Desabilita_Campos(FrmCadastro_Perfil_Usuario);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Perfil_Usuario.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Perfil_Usuario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Perfil_Usuario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Perfil_Usuario.Gera_Codigo;
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
      add('select max(Codigo) as Codigo from Perfil_Usuario ');
      open;
    end;
    EdtCodigo.Text:= IntToStr(qAux.FieldByName('Codigo').AsInteger + 1);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Perfil_Usuario.TreeView1Click(Sender: TObject);
var
  P:TPoint;
begin
  GetCursorPos(P);
  P := TreeView1.ScreenToClient(P);
  if (htOnStateIcon in TreeView1.GetHitTestInfoAt(P.X,P.Y)) then
    ToggleTreeViewCheckBoxes(TreeView1.Selected, cFlatUnCheck, cFlatChecked);
end;

procedure TFrmCadastro_Perfil_Usuario.TreeView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_SPACE) and Assigned(TreeView1.Selected) then
    ToggleTreeViewCheckBoxes(TreeView1.Selected, cFlatUnCheck, cFlatChecked);
end;

procedure TFrmCadastro_Perfil_Usuario.ToggleTreeViewCheckBoxes(Node :TTreeNode; cUnChecked, cChecked :integer);
begin
  if Assigned(Node) then
  begin
    if Node.StateIndex = cUnChecked then
      Node.StateIndex := cChecked
    else if Node.StateIndex = cChecked then
      Node.StateIndex := cUnChecked
  end;
end;

procedure TFrmCadastro_Perfil_Usuario.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Perfil_Usuario, FrmChama_Perfil_Usuario);
  FrmChama_Perfil_Usuario.ShowModal;
  FrmChama_Perfil_Usuario.Release;
end;

end.
