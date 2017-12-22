unit UCadastro_Fornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls;

type
  TFrmCadastro_Fornecedor = class(TForm)
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
    LblNumero: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    LblUF: TLabel;
    Label23: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LblEmail: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EdtEndereco: TEdit;
    EdtNumero: TEdit;
    EdtTipo_Logradouro: TEdit;
    EdtCEP: TEdit;
    EdtSetor: TEdit;
    EdtCidade: TEdit;
    EdtUF: TEdit;
    EdtReferencia: TEdit;
    EdtCodigo_Endereco: TEdit;
    EdtCodigo_Setor: TEdit;
    EdtCodigo_Cidade: TEdit;
    EdtEmail: TEdit;
    MEdtTelefone: TMaskEdit;
    MEdtCelular: TMaskEdit;
    Panel1: TPanel;
    Label47: TLabel;
    MmoObservacoes: TMemo;
    LblMarca: TLabel;
    Label15: TLabel;
    EdtNome: TEdit;
    EdtRazao_Social: TEdit;
    GroupBox1: TGroupBox;
    Label22: TLabel;
    Label16: TLabel;
    EdtInsc_Estadual_Municipal: TEdit;
    EdtCNPJ: TMaskEdit;
    Label6: TLabel;
    EdtSite: TEdit;
    RGOpcao: TRadioGroup;
    GroupBox2: TGroupBox;
    LblRG: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    EdtRG: TEdit;
    EdtOrgao_Expedidor: TEdit;
    EdtData_Emissao: TMaskEdit;
    EdtCPF: TMaskEdit;
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
    procedure MmoObservacoesKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_EnderecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtInsc_Estadual_MunicipalKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtCodigo_SetorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_CidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdtData_CadastroExit(Sender: TObject);
    procedure EdtCNPJExit(Sender: TObject);
  private
    Fornecedor: URegistro.TFornecedor;
    Util: TUtil;
  public
    ativo: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Fornecedor: TFrmCadastro_Fornecedor;
implementation

uses UDM, UChama_Logradouro, UChama_Setor, UChama_Cidade, UChama_Cargo,
  UChama_Departamento, UChama_Fornecedor;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Fornecedor.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Fornecedor);
  Util.Desabilita_Campos(FrmCadastro_Fornecedor);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCadastro_Fornecedor.BBtnExcluirClick(Sender: TObject);
begin
  Fornecedor.Excluir(Fornecedor);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  Util.Desabilita_Campos(FrmCadastro_Fornecedor);
end;

procedure TFrmCadastro_Fornecedor.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Fornecedor.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
        Fornecedor.Inserir(Fornecedor)
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
        Fornecedor.Alterar(Fornecedor)
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Fornecedor);
end;

function TFrmCadastro_Fornecedor.Confira: boolean;
begin
    Confira:= false;
    if EdtNome_Fantasia.Text = '' then
      begin
        Application.MessageBox('Há dados incorretos que não foram preenchidos.', 'Erro', MB_OK+MB_ICONHAND);
        EdtNome_Fantasia.SetFocus;
        abort;
      end;

      Confira:= true;
end;

procedure TFrmCadastro_Fornecedor.EdtCNPJExit(Sender: TObject);
begin
  if (EdtCNPJ.Text = '') then
    abort
  else
  if Util.Valida_CGC(EdtCNPJ.Text) <> True then
    begin
      Application.MessageBox('CNPJ inválido', 'Erro', MB_OK+MB_ICONHAND);
      EdtCNPJ.Clear;
      EdtCNPJ.SetFocus;
    end;
end;

procedure TFrmCadastro_Fornecedor.EdtCodigo_CidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Cidade, FrmChama_Cidade);
      FrmChama_Cidade.ShowModal;
      FrmChama_Cidade.Free;
    end;
end;

procedure TFrmCadastro_Fornecedor.EdtCodigo_EnderecoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Logradouro, FrmChama_Logradouro);
      FrmChama_Logradouro.ShowModal;
      FrmChama_Logradouro.Free;
    end;
end;

procedure TFrmCadastro_Fornecedor.EdtCodigo_SetorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Setor, FrmChama_Setor);
      FrmChama_Setor.ShowModal;
      FrmChama_Setor.Free;
    end;
end;

procedure TFrmCadastro_Fornecedor.EdtInsc_Estadual_MunicipalKeyPress(
  Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', '.',#08]) then
    key := #0
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Fornecedor.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Fornecedor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Application.MessageBox('Há uma operação em andamento. Por favor, Salve ou Cancele a operação para fechar a janela', 'Impossível Fechar', MB_ICONHAND+MB_OK);
      Abort;
    end
    else
      begin
        FrmCadastro_Fornecedor.Free;
        FrmCadastro_Fornecedor:= Nil;
      end;
end;

procedure TFrmCadastro_Fornecedor.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Fornecedor);
  Util.Limpa_Campos(FrmCadastro_Fornecedor);
  Util.Desabilita_Campos(FrmCadastro_Fornecedor);
end;

procedure TFrmCadastro_Fornecedor.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Fornecedor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Fornecedor);
      Util.Limpa_Campos(FrmCadastro_Fornecedor);
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

procedure TFrmCadastro_Fornecedor.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Fornecedor.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Fornecedor.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Fornecedor.MmoObservacoesKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];
end;

procedure TFrmCadastro_Fornecedor.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Fornecedor, FrmChama_Fornecedor);
  FrmChama_Fornecedor.ShowModal;
  FrmChama_Fornecedor.Release;
end;

end.
