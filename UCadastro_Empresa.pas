unit UCadastro_Empresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls;

type
  TFrmCadastro_Empresa = class(TForm)
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
    LblMarca: TLabel;
    Label15: TLabel;
    EdtNome: TEdit;
    EdtRazao_Social: TEdit;
    GroupBox1: TGroupBox;
    Label22: TLabel;
    Label16: TLabel;
    EdtInsc_Estadual: TEdit;
    EdtCNPJ: TMaskEdit;
    EdtProprietario: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    EdtInsc_Municipal: TEdit;
    Label14: TLabel;
    EdtSuframa: TEdit;
    Label32: TLabel;
    EdtCNAE: TEdit;
    RGRegime_Tributario: TRadioGroup;
    RGEnquadramento: TRadioGroup;
    Label33: TLabel;
    EdtAliquota: TEdit;
    Label34: TLabel;
    EdtCusto_OP: TEdit;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    Label11: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label47: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    LblEmail: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    LblUF: TLabel;
    Label13: TLabel;
    LblNumero: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    MmoObservacoes: TMemo;
    MEdtTelefone_Contato: TMaskEdit;
    EdtContato: TEdit;
    EdtComplemento: TEdit;
    EdtSite: TEdit;
    MEdtFax: TMaskEdit;
    MEdtTelefone: TMaskEdit;
    EdtEmail: TEdit;
    EdtCodigo_Cidade: TEdit;
    EdtCodigo_Setor: TEdit;
    EdtUF: TEdit;
    EdtCidade: TEdit;
    EdtSetor: TEdit;
    EdtCEP: TEdit;
    EdtNumero: TEdit;
    EdtEndereco: TEdit;
    EdtSenha: TEdit;
    EdtSMTP: TEdit;
    EdtPorta: TEdit;
    TabSheet3: TTabSheet;
    Label17: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    EdtNome_Contador: TEdit;
    GroupBox2: TGroupBox;
    Label18: TLabel;
    Label21: TLabel;
    Label19: TLabel;
    MEdtCNPJ_Contador: TMaskEdit;
    MEdtCPF_Contador: TMaskEdit;
    EdtCRC: TEdit;
    EdtComplemento_Contador: TEdit;
    EdtCEP_Contador: TEdit;
    EdtNumero_Contador: TEdit;
    EdtEndereco_Contador: TEdit;
    MEdtTelefone_Contador: TMaskEdit;
    EdtEmail_Contador: TEdit;
    EdtCodigo_Setor_Contador: TEdit;
    EdtSetor_Contador: TEdit;
    EdtCodigo_Cidade_Contador: TEdit;
    EdtCidade_Contador: TEdit;
    EdtUF_Contador: TEdit;
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
    procedure EdtInsc_EstadualKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtCodigo_SetorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_CidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdtData_CadastroExit(Sender: TObject);
    procedure EdtCNPJExit(Sender: TObject);
    procedure EdtInsc_MunicipalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Endereco_ContadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Setor_ContadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Cidade_ContadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_EnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTipo_LogradouroKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_SetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Endereco_ContadorKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtTipo_Logradouro_ContadorKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtCodigo_Setor_ContadorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSetor_ContadorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Cidade_ContadorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCidade_ContadorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtUF_ContadorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtUFKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCusto_OPKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAliquotaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_EnderecoDblClick(Sender: TObject);
    procedure EdtCodigo_SetorDblClick(Sender: TObject);
    procedure EdtCodigo_CidadeDblClick(Sender: TObject);
    procedure EdtCodigo_Endereco_ContadorDblClick(Sender: TObject);
    procedure EdtCodigo_Setor_ContadorDblClick(Sender: TObject);
    procedure EdtCodigo_Cidade_ContadorDblClick(Sender: TObject);
    procedure BBtnNovoClick(Sender: TObject);
  private
    Empresa: URegistro.TEmpresa;
    Contador: URegistro.TContabilista;
    Util: TUtil;
    procedure Gera_Codigo;
  public
    ativo, achei: boolean;
    contabilista: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Empresa: TFrmCadastro_Empresa;
implementation

uses UDM, UChama_Logradouro, UChama_Setor, UChama_Cidade, UChama_Empresa,
  UDeclaracao;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Empresa.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Empresa);
  Util.Desabilita_Campos(FrmCadastro_Empresa);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmCadastro_Empresa.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  BEGIN
    Empresa.Excluir(Empresa);
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU EMPRESA ' + EdtNome.Text + '.', TimeToStr(time), exclusao, date);
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU CONTADOR ' + EdtNome_Contador.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Empresa);
  END;
end;

procedure TFrmCadastro_Empresa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Empresa.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Empresa);
  Util.Limpa_Campos(FrmCadastro_Empresa);
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled := false;
  achei:= false;
  MEdtData_Cadastro.SetFocus;
  Gera_Codigo;
  PageControl2.TabIndex:= 0;
  EdtNome.SetFocus;
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);


end;

procedure TFrmCadastro_Empresa.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Empresa.Inserir(Empresa);
        Contador.Inserir(Contador);
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU EMPRESA ' + EdtNome.Text + '.', TimeToStr(time), insercao, date);
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU CONTADOR ' + EdtNome_Contador.Text + '.', TimeToStr(time), insercao, date);
      end
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      begin
        Empresa.Alterar(Empresa);
        Contador.Alterar(Contador);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU EMPRESA ' + EdtNome.Text + '.', TimeToStr(time), alteracao, date);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU CONTADOR ' + EdtNome_Contador.Text + '.', TimeToStr(time), alteracao, date);
      end
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Empresa);
end;


function TFrmCadastro_Empresa.Confira: boolean;
begin
    Confira:= false;
    if EdtNome.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtNome.SetFocus;
        abort;
      end;

    if EdtRazao_Social.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtRazao_Social.SetFocus;
        abort;
      end;

    if EdtProprietario.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtProprietario.SetFocus;
        abort;
      end;

    if EdtCNPJ.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCNPJ.SetFocus;
        abort;
      end;

    if EdtInsc_Estadual.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtInsc_Estadual.SetFocus;
        abort;
      end;

    if EdtAliquota.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtAliquota.SetFocus;
        abort;
      end;

    if EdtCusto_OP.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCusto_OP.SetFocus;
        abort;
      end;

    if EdtCodigo_Cidade.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Cidade.SetFocus;
        abort;
      end;

    if EdtCodigo_Setor.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Setor.SetFocus;
        abort;
      end;

    if EdtEndereco.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtEndereco.SetFocus;
        abort;
      end;

    if EdtNome_Contador.Text = '' then
      begin
        Mensagem_Falta_Dados;
        PageControl2.TabIndex:= 1;
        EdtNome_Contador.SetFocus;
        abort;
      end;

    if MEdtCNPJ_Contador.Text = '' then
      begin
        Mensagem_Falta_Dados;
        PageControl2.TabIndex:= 1;
        MEdtCNPJ_Contador.SetFocus;
        abort;
      end;

    if MEdtCPF_Contador.Text = '' then
      begin
        Mensagem_Falta_Dados;
        PageControl2.TabIndex:= 1;
        MEdtCPF_Contador.SetFocus;
        abort;
      end;

      Confira:= true;
end;

procedure TFrmCadastro_Empresa.EdtAliquotaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Empresa.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Empresa.EdtCidade_ContadorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Empresa.EdtCNPJExit(Sender: TObject);
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

procedure TFrmCadastro_Empresa.EdtCodigo_CidadeDblClick(Sender: TObject);
begin
  contabilista:= false;
  Application.CreateForm(TFrmChama_Cidade, FrmChama_Cidade);
  FrmChama_Cidade.ShowModal;
  FrmChama_Cidade.Free;
end;

procedure TFrmCadastro_Empresa.EdtCodigo_CidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      contabilista:= false;
      Application.CreateForm(TFrmChama_Cidade, FrmChama_Cidade);
      FrmChama_Cidade.ShowModal;
      FrmChama_Cidade.Free;
    end;
end;

procedure TFrmCadastro_Empresa.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Empresa.EdtCodigo_Cidade_ContadorDblClick(
  Sender: TObject);
begin
  contabilista:= true;
  Application.CreateForm(TFrmChama_Cidade, FrmChama_Cidade);
  FrmChama_Cidade.ShowModal;
  FrmChama_Cidade.Free;
end;

procedure TFrmCadastro_Empresa.EdtCodigo_Cidade_ContadorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      contabilista:= true;
      Application.CreateForm(TFrmChama_Cidade, FrmChama_Cidade);
      FrmChama_Cidade.ShowModal;
      FrmChama_Cidade.Free;
    end;
end;

procedure TFrmCadastro_Empresa.EdtCodigo_Cidade_ContadorKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Empresa.EdtCodigo_EnderecoDblClick(Sender: TObject);
begin
  contabilista:= false;
  Application.CreateForm(TFrmChama_Logradouro, FrmChama_Logradouro);
  FrmChama_Logradouro.ShowModal;
  FrmChama_Logradouro.Free;
end;

procedure TFrmCadastro_Empresa.EdtCodigo_EnderecoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      contabilista:= false;
      Application.CreateForm(TFrmChama_Logradouro, FrmChama_Logradouro);
      FrmChama_Logradouro.ShowModal;
      FrmChama_Logradouro.Free;
    end;
end;

procedure TFrmCadastro_Empresa.EdtCodigo_EnderecoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Empresa.EdtCodigo_Endereco_ContadorDblClick(
  Sender: TObject);
begin
  contabilista:= true;
  Application.CreateForm(TFrmChama_Logradouro, FrmChama_Logradouro);
  FrmChama_Logradouro.ShowModal;
  FrmChama_Logradouro.Free;
end;

procedure TFrmCadastro_Empresa.EdtCodigo_Endereco_ContadorKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      contabilista:= true;
      Application.CreateForm(TFrmChama_Logradouro, FrmChama_Logradouro);
      FrmChama_Logradouro.ShowModal;
      FrmChama_Logradouro.Free;
    end;
end;

procedure TFrmCadastro_Empresa.EdtCodigo_Endereco_ContadorKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Empresa.EdtCodigo_SetorDblClick(Sender: TObject);
begin
  contabilista:= false;
  Application.CreateForm(TFrmChama_Setor, FrmChama_Setor);
  FrmChama_Setor.ShowModal;
  FrmChama_Setor.Free;
end;

procedure TFrmCadastro_Empresa.EdtCodigo_SetorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      contabilista:= false;
      Application.CreateForm(TFrmChama_Setor, FrmChama_Setor);
      FrmChama_Setor.ShowModal;
      FrmChama_Setor.Free;
    end;
end;

procedure TFrmCadastro_Empresa.EdtCodigo_SetorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Empresa.EdtCodigo_Setor_ContadorDblClick(
  Sender: TObject);
begin
  contabilista:= true;
  Application.CreateForm(TFrmChama_Setor, FrmChama_Setor);
  FrmChama_Setor.ShowModal;
  FrmChama_Setor.Free;
end;

procedure TFrmCadastro_Empresa.EdtCodigo_Setor_ContadorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      contabilista:= true;
      Application.CreateForm(TFrmChama_Setor, FrmChama_Setor);
      FrmChama_Setor.ShowModal;
      FrmChama_Setor.Free;
    end;
end;

procedure TFrmCadastro_Empresa.EdtCodigo_Setor_ContadorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Empresa.EdtCusto_OPKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmCadastro_Empresa.EdtInsc_EstadualKeyPress(
  Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', '.',#08]) then
    key := #0
end;

procedure TFrmCadastro_Empresa.EdtInsc_MunicipalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', '.',#08]) then
    key := #0
end;

procedure TFrmCadastro_Empresa.EdtSetorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Empresa.EdtSetor_ContadorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Empresa.EdtTipo_LogradouroKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Empresa.EdtTipo_Logradouro_ContadorKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Empresa.EdtUFKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Empresa.EdtUF_ContadorKeyPress(Sender: TObject;
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

procedure TFrmCadastro_Empresa.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Empresa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Empresa.Free;
        FrmCadastro_Empresa:= Nil;
      end;
end;

procedure TFrmCadastro_Empresa.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Empresa);
  Util.Limpa_Campos(FrmCadastro_Empresa);
  Util.Desabilita_Campos(FrmCadastro_Empresa);
  PageControl1.TabIndex:= 0;
  PageControl2.TabIndex:= 0;
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Empresa.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Empresa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin

    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Empresa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Empresa.Gera_Codigo;
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
      add('select max(Codigo) as Codigo from Empresa ');
      open;
    end;
    EdtCodigo.Text:= IntToStr(qAux.FieldByName('Codigo').AsInteger + 1);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Empresa.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Empresa.MEdtData_CadastroExit(Sender: TObject);
begin
  //if (MEdtData_Cadastro.Text = '  /  /    ') then
   // abort
  //else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Empresa.MmoObservacoesKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];
end;

procedure TFrmCadastro_Empresa.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Empresa, FrmChama_Empresa);
  FrmChama_Empresa.ShowModal;
  FrmChama_Empresa.Release;
end;

end.
