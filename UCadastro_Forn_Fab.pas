unit UCadastro_Forn_Fab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls;

type
  TFrmCadastro_Forn_Fab = class(TForm)
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
    procedure EdtEnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTipo_LogradouroKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCEPKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_SetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_EnderecoDblClick(Sender: TObject);
    procedure EdtCodigo_SetorDblClick(Sender: TObject);
    procedure EdtCodigo_CidadeDblClick(Sender: TObject);
    procedure EdtSetorExit(Sender: TObject);
    procedure EdtSetorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtCidadeExit(Sender: TObject);
    procedure EdtCidadeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtEnderecoExit(Sender: TObject);
    procedure EdtEnderecoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtUFKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnNovoClick(Sender: TObject);
    procedure EdtRazao_SocialEnter(Sender: TObject);
    procedure EdtData_EmissaoExit(Sender: TObject);
  private
    Fornecedor: URegistro.TFornecedor;
    Util: TUtil;
  public
    ativo, achei, achou_endereco, achou_setor, achou_cidade: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Forn_Fab: TFrmCadastro_Forn_Fab;
implementation

uses UDM, UChama_Logradouro, UChama_Setor, UChama_Cidade, UChama_Cargo,
  UChama_Departamento, UChama_Fornecedor, UDeclaracao, Util.Mensagens,
  Util.TLog;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Forn_Fab.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Forn_Fab);
  Util.Desabilita_Campos(FrmCadastro_Forn_Fab);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmCadastro_Forn_Fab.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  BEGIN
    try
      Fornecedor.Excluir(Fornecedor);
      Cria_Arquivo_Atualiza_Dados('DForn');
      UDeclaracao.Insere_Historico(usuario, 'EXCLUIU FORNECEDOR ' + EdtNome.Text + '.', TimeToStr(time), exclusao, date);
      BBtnSalvar.Enabled:= false;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= true;
      BBtnCancelar.Enabled:= false;
      BBtnNovo.Enabled:= true;
      Util.Desabilita_Campos(FrmCadastro_Forn_Fab);
    except on E:Exception do
    begin
      TMensagens.MensagemErro('Erro ao gravar Fornecedor: '+e.Message);
      TLog.Error('Método BBtnSalvarClick Fornecedor: '+e.Message);
    end;
    end;
  END;
end;

procedure TFrmCadastro_Forn_Fab.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Forn_Fab.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Forn_Fab);
  Util.Limpa_Campos(FrmCadastro_Forn_Fab);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  achei:= false;
  achou_setor:= false;
  achou_cidade:= false;
  achou_endereco:= false;
  MEdtData_Cadastro.Text:= DateToStr(date);
  EdtNome.SetFocus;
end;

procedure TFrmCadastro_Forn_Fab.BBtnSalvarClick(Sender: TObject);
begin
  try
    if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Fornecedor.Inserir(Fornecedor);
        Cria_Arquivo_Atualiza_Dados('IForn');
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU FORNECEDOR ' + EdtNome.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Fornecedor.Alterar(Fornecedor);
        Cria_Arquivo_Atualiza_Dados('AForn');
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU FORNECEDOR ' + EdtNome.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Forn_Fab);
  except on E:Exception do
  begin
    TMensagens.MensagemErro('Erro ao gravar Fornecedor: '+e.Message);
    TLog.Error('Método BBtnSalvarClick Fornecedor: '+e.Message);
  end;
  end;

end;

function TFrmCadastro_Forn_Fab.Confira: boolean;
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

procedure TFrmCadastro_Forn_Fab.EdtCEPKeyPress(Sender: TObject; var Key: Char);
begin
//  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Forn_Fab.EdtCidadeExit(Sender: TObject);
begin
  if (qAux_Cidade <> Nil) and (qAux_Cidade.IsEmpty = false) and (EdtCidade.Text <> '') then
  begin
    EdtCodigo_Cidade.Text:= qAux_Cidade.FieldByName('Codigo').AsString;
    EdtCidade.Text:= qAux_Cidade.FieldByName('Descricao').AsString;
    EdtUF.Text:= qAux_Cidade.FieldByName('UF').AsString;
    achou_cidade:= true;
  end
  else
  begin
    achou_cidade:= false;

    if (EdtCidade.Text <> '') then
    begin
      EdtCodigo_Cidade.Text:= IntToStr(Gera_Codigo_Cadastro('Cidade'));
    end
    else
    begin
      EdtCodigo_Cidade.Text:= '';
      EdtCidade.Text:= '';
      EdtUF.Text:= '';
    end;
  end;
end;

procedure TFrmCadastro_Forn_Fab.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
//  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Forn_Fab.EdtCidadeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not ( (key = 08) or (key = 46) ) and (EdtCidade.Text <> '')then
    Pega_Cidade(EdtCidade);
end;

procedure TFrmCadastro_Forn_Fab.EdtCNPJExit(Sender: TObject);
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

procedure TFrmCadastro_Forn_Fab.EdtCodigo_CidadeDblClick(Sender: TObject);
begin
  {Application.CreateForm(TFrmChama_Cidade, FrmChama_Cidade);
  FrmChama_Cidade.ShowModal;
  FrmChama_Cidade.Free;}
end;

procedure TFrmCadastro_Forn_Fab.EdtCodigo_CidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Cidade, FrmChama_Cidade);
      FrmChama_Cidade.ShowModal;
      FrmChama_Cidade.Free;
    end;
end;

procedure TFrmCadastro_Forn_Fab.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Forn_Fab.EdtCodigo_EnderecoDblClick(Sender: TObject);
begin
  {Application.CreateForm(TFrmChama_Logradouro, FrmChama_Logradouro);
  FrmChama_Logradouro.ShowModal;
  FrmChama_Logradouro.Free; }
end;

procedure TFrmCadastro_Forn_Fab.EdtCodigo_EnderecoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Logradouro, FrmChama_Logradouro);
      FrmChama_Logradouro.ShowModal;
      FrmChama_Logradouro.Free;
    end;
end;

procedure TFrmCadastro_Forn_Fab.EdtCodigo_EnderecoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Forn_Fab.EdtCodigo_SetorDblClick(Sender: TObject);
begin
  {Application.CreateForm(TFrmChama_Setor, FrmChama_Setor);
  FrmChama_Setor.ShowModal;
  FrmChama_Setor.Free;}
end;

procedure TFrmCadastro_Forn_Fab.EdtCodigo_SetorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Setor, FrmChama_Setor);
      FrmChama_Setor.ShowModal;
      FrmChama_Setor.Free;
    end;
end;

procedure TFrmCadastro_Forn_Fab.EdtCodigo_SetorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Forn_Fab.EdtCPFExit(Sender: TObject);
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

procedure TFrmCadastro_Forn_Fab.EdtData_EmissaoExit(Sender: TObject);
begin
  if (EdtData_Emissao.Text = '  /  /    ') then
    exit
  else
    Util.Verifica_Data(EdtData_Emissao);
end;

procedure TFrmCadastro_Forn_Fab.EdtEnderecoExit(Sender: TObject);
begin
  {if (qAux_Endereco <> Nil) and (qAux_Endereco.IsEmpty = false) and (EdtEndereco.Text <> '') then
  begin
    EdtCodigo_Endereco.Text:= qAux_Endereco.FieldByName('Codigo').AsString;
    EdtEndereco.Text:= qAux_Endereco.FieldByName('Descricao').AsString;
    EdtTipo_Logradouro.Text:= qAux_Endereco.FieldByName('Tipo_Logradouro').AsString;
    EdtCEP.Text:= qAux_Endereco.FieldByName('CEP').AsString;
    achou_endereco:= true;
  end
  else
  begin
    achou_endereco:= false;

    if (EdtEndereco.Text <> '') then
    begin
      EdtCodigo_Endereco.Text:= IntToStr(Gera_Codigo_Cadastro('Logradouro'));
    end
    else
    begin
      EdtCodigo_Endereco.Text:= '';
      EdtEndereco.Text:= '';
      EdtTipo_Logradouro.Text:= '';
      EdtCEP.Text:= '';
      EdtNumero.Text:= '';
    end;
  end;}
end;

procedure TFrmCadastro_Forn_Fab.EdtEnderecoKeyPress(Sender: TObject;
  var Key: Char);
begin
//  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Forn_Fab.EdtEnderecoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {if not ( (key = 08) or (key = 46) ) and (EdtEndereco.Text <> '')then
    Pega_Endereco(EdtEndereco);}
end;

procedure TFrmCadastro_Forn_Fab.EdtInsc_Estadual_MunicipalKeyPress(
  Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', '.',#08]) then
    key := #0
end;

procedure TFrmCadastro_Forn_Fab.EdtRazao_SocialEnter(Sender: TObject);
begin
  EdtRazao_Social.Text:= EdtNome.Text;
end;

procedure TFrmCadastro_Forn_Fab.EdtSetorExit(Sender: TObject);
begin
  if (qAux_Setor <> Nil) and (qAux_Setor.IsEmpty = false) and (EdtSetor.Text <> '') then
  begin
    EdtCodigo_Setor.Text:= qAux_Setor.FieldByName('Codigo').AsString;
    EdtSetor.Text:= qAux_Setor.FieldByName('Descricao').AsString;
    achou_setor:= true;
  end
  else
  begin
    achou_setor:= false;

    if (EdtSetor.Text <> '') then
    begin
      EdtCodigo_Setor.Text:= IntToStr(Gera_Codigo_Cadastro('Setor'));
    end
    else
    begin
      EdtCodigo_Setor.Text:= '';
      EdtSetor.Text:= '';
    end;
  end;
end;

procedure TFrmCadastro_Forn_Fab.EdtSetorKeyPress(Sender: TObject;
  var Key: Char);
begin
//  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Forn_Fab.EdtSetorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not ( (key = 08) or (key = 46) ) and (EdtSetor.Text <> '')then
    Pega_Setor(EdtSetor);
end;

procedure TFrmCadastro_Forn_Fab.EdtTipo_LogradouroKeyPress(Sender: TObject;
  var Key: Char);
begin
//  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Forn_Fab.EdtUFKeyPress(Sender: TObject; var Key: Char);
begin

end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Forn_Fab.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Forn_Fab.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Forn_Fab.Free;
        FrmCadastro_Forn_Fab:= Nil;
      end;
end;

procedure TFrmCadastro_Forn_Fab.FormCreate(Sender: TObject);
begin
  achou_setor:= false;
  achou_cidade:= false;
  achou_endereco:= false;
  Util.Habilita_Campos(FrmCadastro_Forn_Fab);
  Util.Limpa_Campos(FrmCadastro_Forn_Fab);
  Util.Desabilita_Campos(FrmCadastro_Forn_Fab);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Forn_Fab.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Forn_Fab.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Forn_Fab.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Forn_Fab.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Forn_Fab.MEdtData_CadastroExit(Sender: TObject);
begin
    Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Forn_Fab.MmoObservacoesKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];
end;

procedure TFrmCadastro_Forn_Fab.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Fornecedor, FrmChama_Fornecedor);
  FrmChama_Fornecedor.ShowModal;
  FrmChama_Fornecedor.Release;
end;

end.
