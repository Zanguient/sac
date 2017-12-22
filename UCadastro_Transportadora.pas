unit UCadastro_Transportadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls;

type
  TFrmCadastro_Transportadora = class(TForm)
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
    BBtnPesquisar: TToolButton;
    LblNumero: TLabel;
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
    EdtCEP: TEdit;
    EdtSetor: TEdit;
    EdtCidade: TEdit;
    EdtUF: TEdit;
    EdtReferencia: TEdit;
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
    GroupBox2: TGroupBox;
    LblRG: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    EdtRG: TEdit;
    EdtOrgao_Expedidor: TEdit;
    EdtData_Emissao: TMaskEdit;
    EdtCPF: TMaskEdit;
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
    procedure EdtCPFExit(Sender: TObject);
    procedure EdtCodigo_EnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_SetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTipo_LogradouroKeyPress(Sender: TObject; var Key: Char);
    procedure EdtUFKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_EnderecoDblClick(Sender: TObject);
    procedure EdtCodigo_SetorDblClick(Sender: TObject);
    procedure EdtCodigo_CidadeDblClick(Sender: TObject);
    procedure BbtnNovoClick(Sender: TObject);
  private
    Transportadora: URegistro.TTransportadora;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Transportadora: TFrmCadastro_Transportadora;
implementation

uses UDM, UChama_Logradouro, UChama_Setor, UChama_Cidade, UDeclaracao, UChama_Transportadora;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Transportadora.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Transportadora);
  Util.Desabilita_Campos(FrmCadastro_Transportadora);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= True;
end;

procedure TFrmCadastro_Transportadora.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  BEGIN
    Transportadora.Excluir(Transportadora);
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU TRANSPORTADORA ' + EdtNome.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= True;
    Util.Desabilita_Campos(FrmCadastro_Transportadora);
  END;
end;

procedure TFrmCadastro_Transportadora.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Transportadora.BbtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Transportadora);
  Util.Limpa_Campos(FrmCadastro_Transportadora);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BbtnNovo.Enabled:= false;
  achei:= false;
  EdtNome.SetFocus;
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);
end;

procedure TFrmCadastro_Transportadora.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Transportadora.Inserir(Transportadora);
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU TRANSPORTADORA ' + EdtNome.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Transportadora.Alterar(Transportadora);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU TRANSPORTADORA ' + EdtNome.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= True;
    Util.Desabilita_Campos(FrmCadastro_Transportadora);
end;

function TFrmCadastro_Transportadora.Confira: boolean;
begin
    Confira:= false;
    if EdtNome.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtNome.SetFocus;
        abort;
      end;

      Confira:= true;
end;

procedure TFrmCadastro_Transportadora.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Transportadora.EdtCNPJExit(Sender: TObject);
begin
  if (EdtCNPJ.Text = '') then
    exit
  else
  if Util.Valida_CGC(EdtCNPJ.Text) <> True then
    begin
      Application.MessageBox('CNPJ inválido', 'Erro', MB_OK+MB_ICONHAND);
      EdtCNPJ.Clear;
      EdtCNPJ.SetFocus;
    end;
end;

procedure TFrmCadastro_Transportadora.EdtCodigo_CidadeDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Cidade, FrmChama_Cidade);
  FrmChama_Cidade.ShowModal;
  FrmChama_Cidade.Free;
end;

procedure TFrmCadastro_Transportadora.EdtCodigo_CidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Cidade, FrmChama_Cidade);
      FrmChama_Cidade.ShowModal;
      FrmChama_Cidade.Free;
    end;
end;

procedure TFrmCadastro_Transportadora.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Transportadora.EdtCodigo_EnderecoDblClick(
  Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Logradouro, FrmChama_Logradouro);
  FrmChama_Logradouro.ShowModal;
  FrmChama_Logradouro.Free;
end;

procedure TFrmCadastro_Transportadora.EdtCodigo_EnderecoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Logradouro, FrmChama_Logradouro);
      FrmChama_Logradouro.ShowModal;
      FrmChama_Logradouro.Free;
    end;
end;

procedure TFrmCadastro_Transportadora.EdtCodigo_EnderecoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Transportadora.EdtCodigo_SetorDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Setor, FrmChama_Setor);
  FrmChama_Setor.ShowModal;
  FrmChama_Setor.Free;
end;

procedure TFrmCadastro_Transportadora.EdtCodigo_SetorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Setor, FrmChama_Setor);
      FrmChama_Setor.ShowModal;
      FrmChama_Setor.Free;
    end;
end;

procedure TFrmCadastro_Transportadora.EdtCodigo_SetorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Transportadora.EdtCPFExit(Sender: TObject);
begin
  if (EdtCPF.Text = '') then
    exit
  else
  if Util.Valida_CPF(EdtCPF.Text) <> True then
    begin
      Application.MessageBox('CPF inválido', 'Erro', MB_OK+MB_ICONHAND);
      EdtCPF.Clear;
      EdtCPF.SetFocus;
    end;
end;

procedure TFrmCadastro_Transportadora.EdtInsc_Estadual_MunicipalKeyPress(
  Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', '.',#08]) then
    key := #0
end;

procedure TFrmCadastro_Transportadora.EdtSetorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Transportadora.EdtTipo_LogradouroKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Transportadora.EdtUFKeyPress(Sender: TObject;
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

procedure TFrmCadastro_Transportadora.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Transportadora.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Transportadora.Free;
        FrmCadastro_Transportadora:= Nil;
      end;
end;

procedure TFrmCadastro_Transportadora.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Transportadora);
  Util.Limpa_Campos(FrmCadastro_Transportadora);
  Util.Desabilita_Campos(FrmCadastro_Transportadora);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Transportadora.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Transportadora.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin

    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Transportadora.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Transportadora.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Transportadora.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Transportadora.MmoObservacoesKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];
end;

procedure TFrmCadastro_Transportadora.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Transportadora, FrmChama_Transportadora);
  FrmChama_Transportadora.ShowModal;
  FrmChama_Transportadora.Release;
end;

end.
