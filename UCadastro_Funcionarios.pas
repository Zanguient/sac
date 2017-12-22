unit UCadastro_Funcionarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls, DBClient, Menus;

type
  TFrmCadastro_Funcionarios = class(TForm)
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
    EdtNome: TEdit;
    BBtnPesquisar: TToolButton;
    GroupBox1: TGroupBox;
    LblRG: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    EdtRG: TEdit;
    EdtOrgao_Expedidor: TEdit;
    EdtData_Emissao: TMaskEdit;
    EdtCPF: TMaskEdit;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    EdtSalario: TEdit;
    Label14: TLabel;
    EdtComissao_Produto: TEdit;
    ImageList1: TImageList;
    Label15: TLabel;
    EdtDesconto: TEdit;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    LblNumero: TLabel;
    Label13: TLabel;
    LblUF: TLabel;
    Label23: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LblEmail: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    Label47: TLabel;
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
    EdtCargo: TEdit;
    EdtCodigo_Cargo: TEdit;
    CmbEstado_Civil: TComboBox;
    MEdtTelefone: TMaskEdit;
    MEdtCelular: TMaskEdit;
    EdtContato: TEdit;
    MEdtTelefone_Contato: TMaskEdit;
    EdtDepartamento: TEdit;
    EdtCodigo_Departamento: TEdit;
    MmoObservacoes: TMemo;
    TabSheet3: TTabSheet;
    Label17: TLabel;
    Label18: TLabel;
    Label22: TLabel;
    EdtLogin: TEdit;
    EdtSenha: TEdit;
    EdtPerfil: TEdit;
    EdtCodigo_Perfil: TEdit;
    CBADM: TCheckBox;
    CBAtualiza_Preco_Orcamento: TCheckBox;
    TabSheet4: TTabSheet;
    GroupBox4: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    EdtCTPS_N: TEdit;
    EdtCTPS_Serie: TEdit;
    GroupBox5: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    EdtTitulo_N: TEdit;
    EdtTitulo_Cidade: TEdit;
    Label29: TLabel;
    EdtTitulo_Zona: TEdit;
    Label30: TLabel;
    EdtTitulo_Secao: TEdit;
    GroupBox6: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    EdtCertificado_Militar_N: TEdit;
    EdtCertificado_Militar_Serie: TEdit;
    Label33: TLabel;
    EdtCertificado_Militar_Categoria: TEdit;
    GroupBox7: TGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    EdtCNH_N: TEdit;
    EdtCNH_Categoria: TEdit;
    EdtCNH_Cidade: TEdit;
    GroupBox8: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    EdtPIS_N: TEdit;
    EdtPIS_Codigo_Banco: TEdit;
    EdtPIS_Banco: TEdit;
    MEdtPIS_Cadastro: TMaskEdit;
    Label40: TLabel;
    Label41: TLabel;
    EdtPIS_Codigo_Agencia: TEdit;
    Label42: TLabel;
    EdtPIS_Endereco_Agencia: TEdit;
    GroupBox9: TGroupBox;
    Label43: TLabel;
    EdtNome_Pai: TEdit;
    Label44: TLabel;
    EdtNome_Mae: TEdit;
    Label45: TLabel;
    EdtNaturalidade: TEdit;
    Label46: TLabel;
    EdtNacionalidade: TEdit;
    Label48: TLabel;
    EdtNome_Conjuge: TEdit;
    Label49: TLabel;
    EdtGrau_Instrucao: TEdit;
    GroupBox3: TGroupBox;
    Label16: TLabel;
    Label24: TLabel;
    LblData_Cadastro: TLabel;
    LblData_Nasc: TLabel;
    MEdtData_Admissao: TMaskEdit;
    MEdtData_Demissao: TMaskEdit;
    MEdtData_Cadastro: TMaskEdit;
    MEdtData_Nascimento: TMaskEdit;
    TabSheet5: TTabSheet;
    PageControl3: TPageControl;
    TabSheet6: TTabSheet;
    DBGrid1: TDBGrid;
    qryalteracao_salarial: TADOQuery;
    DataSource4: TDataSource;
    qryalteracao_salarialCodigo: TIntegerField;
    qryalteracao_salarialData: TDateTimeField;
    qryalteracao_salarialSalario: TFloatField;
    TabSheet7: TTabSheet;
    DBGrid2: TDBGrid;
    qryalteracao_cargo: TADOQuery;
    DataSource1: TDataSource;
    qryalteracao_cargoCodigo_Registro: TAutoIncField;
    qryalteracao_cargoCodigo: TIntegerField;
    qryalteracao_cargoData: TDateTimeField;
    qryalteracao_cargoCodigo_Cargo: TIntegerField;
    qryalteracao_cargoCargo: TStringField;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    DBGrid3: TDBGrid;
    qryferias: TADOQuery;
    DataSource2: TDataSource;
    qryferiasCodigo_Registro: TAutoIncField;
    qryferiasCodigo: TIntegerField;
    qryferiasFerias_De: TDateTimeField;
    qryferiasFerias_Ate: TDateTimeField;
    qryferiasPeriodo_De: TDateTimeField;
    qryferiasPeriodo_Ate: TDateTimeField;
    DBGrid4: TDBGrid;
    qryocorrencia: TADOQuery;
    DataSource3: TDataSource;
    qryocorrenciaCodigo: TAutoIncField;
    qryocorrenciaObservacao: TStringField;
    qryocorrenciaData_Ocorrencia: TDateTimeField;
    qryocorrenciaData_Cadastro: TDateTimeField;
    qryocorrenciaTipo_Ocorrencia: TStringField;
    qryocorrenciaCodigo_Funcionario: TIntegerField;
    qryocorrenciaCodigo_Tipo_Ocorrencia: TIntegerField;
    DBGrid5: TDBGrid;
    qrycontribuicao_social: TADOQuery;
    DataSource5: TDataSource;
    qrycontribuicao_socialCodigo_Registro: TAutoIncField;
    qrycontribuicao_socialCodigo: TIntegerField;
    qrycontribuicao_socialN_Guia: TStringField;
    qrycontribuicao_socialData: TDateTimeField;
    qrycontribuicao_socialSindicato: TStringField;
    BBtnImprimir: TToolButton;
    Label50: TLabel;
    EdtComissao_Servico: TEdit;
    BBtnNovo: TToolButton;
    GBCaixa: TGroupBox;
    Label12: TLabel;
    EdtSaldo_Atual: TEdit;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure MmoObservacoesKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_EnderecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtRGKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_SetorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_CidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_CargoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtData_EmissaoExit(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
    procedure EdtCPFExit(Sender: TObject);
    procedure MEdtData_NascimentoExit(Sender: TObject);
    procedure EdtSalarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtComissao_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_DepartamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtSalarioExit(Sender: TObject);
    procedure EdtComissao_ProdutoExit(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure TreeView1Collapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure TreeView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure EdtCodigo_EnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTipo_LogradouroKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_SetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CargoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCargoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_DepartamentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDepartamentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtUFKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_PerfilKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPerfilKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_PerfilKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_PerfilDblClick(Sender: TObject);
    procedure EdtCodigo_EnderecoDblClick(Sender: TObject);
    procedure EdtCodigo_SetorDblClick(Sender: TObject);
    procedure EdtCodigo_CidadeDblClick(Sender: TObject);
    procedure EdtCodigo_CargoDblClick(Sender: TObject);
    procedure EdtCodigo_DepartamentoDblClick(Sender: TObject);
    procedure MEdtData_AdmissaoExit(Sender: TObject);
    procedure MEdtData_DemissaoExit(Sender: TObject);
    procedure MEdtPIS_CadastroExit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qryalteracao_salarialAfterScroll(DataSet: TDataSet);
    procedure qryalteracao_cargoAfterScroll(DataSet: TDataSet);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qryferiasAfterScroll(DataSet: TDataSet);
    procedure qryocorrenciaBeforePost(DataSet: TDataSet);
    procedure qryocorrenciaAfterScroll(DataSet: TDataSet);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qrycontribuicao_socialAfterScroll(DataSet: TDataSet);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure BBtnNovoClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    Funcionario: URegistro.TFuncionario;
    Funcionario_Outros: URegistro.TFuncionario_Outros;
    Funcionario_Alteracao_Salarial: URegistro.TFuncionario_Alteracao_Salarial;
    Funcionario_Alteracao_Cargo: URegistro.TFuncionario_Alteracao_Cargo;
    Funcionario_Ferias: URegistro.TFuncionario_Ferias;
    Funcionario_Ocorrencia: URegistro.TFuncionario_Ocorrencia;
    Usuar: URegistro.TCadastro_Usuario;
    Util: TUtil;

    procedure Gera_Codigo;
    procedure Inicia_Transacao;
    procedure Inicia_Query_Conexao(Conexao: TADOConnection);
  public
    ativo, achei: boolean;
    Conexao: TADOConnection;

    procedure Pega_Alteracao_Salarial;
    procedure Pega_Alteracao_Cargo;
    procedure Pega_Ferias;
    procedure Pega_Ocorrencias;
    procedure Pega_Contribuicao;
    procedure Cria_Conexao;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Funcionarios: TFrmCadastro_Funcionarios;
  qAux: TADOQuery;
implementation

uses UDM, UChama_Logradouro, UChama_Setor, UChama_Cidade, UChama_Cargo,
  UChama_Departamento, UChama_Funcionario, UMenu_Geral, UDeclaracao,
  UChama_Perfil_Usuario, URel_Ficha_Funcionario, Conexao.TConexao,
  Util.Mensagens, Util.TLog;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Funcionarios.BBtnCancelarClick(Sender: TObject);
begin
  TConexao.CancelaConexao(Conexao);
  Util.Limpa_Campos(FrmCadastro_Funcionarios);
  Util.Desabilita_Campos(FrmCadastro_Funcionarios);
  //Conexao.RollbackTrans;
  //Conexao.Close;
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmCadastro_Funcionarios.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  BEGIN
    try
      Funcionario_Outros.Excluir(Conexao);
      Funcionario_Alteracao_Salarial.Excluir(Conexao);
      Funcionario_Alteracao_Cargo.Excluir(Conexao);
      Funcionario_Ferias.Excluir(Conexao);
      Funcionario_Ocorrencia.Excluir(Conexao);
      Funcionario.Excluir(Funcionario, Conexao);

      UDeclaracao.Insere_Historico(usuario, 'EXCLUIU FUNCIONÁRIO ' + EdtNome.Text + '.', TimeToStr(time), exclusao, date);
      TConexao.ConfirmaConexao(Conexao);
      BBtnSalvar.Enabled:= false;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= true;
      BBtnCancelar.Enabled:= false;
      BBtnImprimir.Enabled:= false;
      BBtnNovo.Enabled:= true;
      Util.Desabilita_Campos(FrmCadastro_Funcionarios);
    except on E:Exception do
    begin
      TMensagens.MensagemErro('Erro ao excluir Funcionário: '+e.Message);
      TLog.Error('Método BBtnExcluirClick Funcionário: '+e.Message);
      TConexao.CancelaConexao(Conexao);
    end;
    end;
  END;
end;

procedure TFrmCadastro_Funcionarios.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Funcionarios.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Ficha_Funcionario:= TFrmRel_Ficha_Funcionario.create(self);
  FrmRel_Ficha_Funcionario.Release;
  FrmRel_Ficha_Funcionario:= Nil;
end;

procedure TFrmCadastro_Funcionarios.BBtnNovoClick(Sender: TObject);
begin
  PageControl2.TabIndex:= 0;
  PageControl3.TabIndex:= 0;
  Util.Habilita_Campos(FrmCadastro_Funcionarios);
  Util.Limpa_Campos(FrmCadastro_Funcionarios);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= False;
  BBtnImprimir.Enabled:= false;
  achei:= false;

  Conexao:= TConexao.NovaConexao(Conexao);
  TConexao.IniciaQuerys([qryalteracao_salarial, qryalteracao_cargo, qryferias, qryocorrencia, qrycontribuicao_social], Conexao);

  qryalteracao_salarial.Close;
  qryalteracao_cargo.Close;
  qryferias.Close;
  qryocorrencia.Close;
  qrycontribuicao_social.Close;
  //Cria_Conexao;

  Consulta.Chama_Cargo_LookUp(Conexao);
  Consulta.Chama_Tipo_Ocorrencia_LookUp(Conexao);
  Consulta.Chama_Funcionario_LookUp(Conexao);

  Gera_Codigo;
  EdtComissao_Produto.Text:= '0,00';
  EdtComissao_Servico.Text:= '0,00';
  EdtSalario.Text:= '0,00';
  EdtDesconto.Text:= '0,00';
  EdtSaldo_Atual.Text:= '0,00';
  Pega_Alteracao_Salarial;
  Pega_Alteracao_Cargo;
  Pega_Ferias;
  Pega_Ocorrencias;
  Pega_Contribuicao;
  MEdtData_Cadastro.Text:= DateToStr(date);
  EdtNome.SetFocus;
end;

procedure TFrmCadastro_Funcionarios.BBtnSalvarClick(Sender: TObject);
begin
  try
    if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Funcionario.Inserir(Funcionario, Conexao);
        Funcionario.Inserir_Outros(Conexao);
        Usuar.Inserir(Usuar, Conexao);
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU FUNCIONÁRIO ' + EdtNome.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Funcionario.Alterar(Funcionario, Conexao);
        Funcionario.Alterar_Outros(Conexao);
        Usuar.Alterar(Usuar, Conexao);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU FUNCIONÁRIO ' + EdtNome.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    TConexao.ConfirmaConexao(Conexao);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnImprimir.Enabled:= true;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Funcionarios);

  except on E:Exception do
  begin
    TMensagens.MensagemErro('Erro ao gravar Funcionário: '+e.Message);
    TLog.Error('Método BBtnSalvarClick Funcionário: '+e.Message);
    TConexao.CancelaConexao(Conexao);
  end;
  end;

end;

procedure TFrmCadastro_Funcionarios.Button1Click(Sender: TObject);
begin
  Centraliza_Form(FrmCadastro_Funcionarios);
end;

procedure TFrmCadastro_Funcionarios.Gera_Codigo;
var
  qAux: TADOQuery;
  codigo: integer;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('select max(Codigo) as Codigo from Funcionario ');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

function TFrmCadastro_Funcionarios.Confira: boolean;
begin
  Confira:= false;
  if EdtNome.Text = '' then
    begin
      PageControl2.TabIndex:= 0;
      Mensagem_Falta_Dados;
      EdtNome.SetFocus;
      exit;
    end;

  if (EdtSalario.Text) = '' then
    begin
      PageControl2.TabIndex:= 0;
      Mensagem_Falta_Dados;
      EdtSalario.SetFocus;
      exit;
    end;

  if (EdtComissao_Produto.Text) = '' then
    begin
      PageControl2.TabIndex:= 0;
      Mensagem_Falta_Dados;
      EdtComissao_Produto.SetFocus;
      exit;
    end;

  if (EdtDesconto.Text) = '' then
    begin
      PageControl2.TabIndex:= 0;
      Mensagem_Falta_Dados;
      EdtDesconto.SetFocus;
      exit;
    end;

  if (EdtSaldo_Atual.Text) = '' then
    begin
      PageControl2.TabIndex:= 3;
      Mensagem_Falta_Dados;
      EdtSaldo_Atual.SetFocus;
      exit;
    end;

  {if (EdtLogin.Text) = '' then
    begin
      PageControl2.TabIndex:= 1;
      Mensagem_Falta_Dados;
      EdtLogin.SetFocus;
      abort;
    end;

  if (EdtSenha.Text) = '' then
    begin
      PageControl2.TabIndex:= 1;
      Mensagem_Falta_Dados;
      EdtSenha.SetFocus;
      abort;
    end;

  if (EdtCodigo_Perfil.Text) = '' then
    begin
      PageControl2.TabIndex:= 1;
      Mensagem_Falta_Dados;
      EdtCodigo_Perfil.SetFocus;
      abort;
    end;}

  Confira:= true;
end;

procedure TFrmCadastro_Funcionarios.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid1 do
  begin
    if Odd( DataSource.DataSet.RecNo) then
      Canvas.Brush.Color := clMenu
    else
      Canvas.Brush.Color := clWindow;

    Canvas.FillRect(Rect);
    TDbGrid(Sender).Canvas.font.Color:= clBlack;

    if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color:= clSilver;
      FillRect(Rect);
    end;

    DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TFrmCadastro_Funcionarios.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_DELETE) then
  begin
    if (Confirma_Exclusao) then
    begin
      qryalteracao_salarial.Delete;
      qryalteracao_salarial.Refresh;
    end;
  end;
end;

procedure TFrmCadastro_Funcionarios.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid2 do
  begin
    if Odd( DataSource.DataSet.RecNo) then
      Canvas.Brush.Color := clMenu
    else
      Canvas.Brush.Color := clWindow;

    Canvas.FillRect(Rect);
    TDbGrid(Sender).Canvas.font.Color:= clBlack;

    if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color:= clSilver;
      FillRect(Rect);
    end;

    DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TFrmCadastro_Funcionarios.DBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_DELETE) then
  begin
    if (Confirma_Exclusao) then
    begin
      qryalteracao_cargo.Delete;
      qryalteracao_cargo.Refresh;
    end;
  end;
end;

procedure TFrmCadastro_Funcionarios.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid3 do
  begin
    if Odd( DataSource.DataSet.RecNo) then
      Canvas.Brush.Color := clMenu
    else
      Canvas.Brush.Color := clWindow;

    Canvas.FillRect(Rect);
    TDbGrid(Sender).Canvas.font.Color:= clBlack;

    if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color:= clSilver;
      FillRect(Rect);
    end;

    DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TFrmCadastro_Funcionarios.DBGrid3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_DELETE) then
  begin
    if (Confirma_Exclusao) then
    begin
      qryferias.Delete;
      qryferias.Refresh;
    end;
  end;
end;

procedure TFrmCadastro_Funcionarios.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid4 do
  begin
    if Odd( DataSource.DataSet.RecNo) then
      Canvas.Brush.Color := clMenu
    else
      Canvas.Brush.Color := clWindow;

    Canvas.FillRect(Rect);
    TDbGrid(Sender).Canvas.font.Color:= clBlack;

    if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color:= clSilver;
      FillRect(Rect);
    end;

    DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TFrmCadastro_Funcionarios.DBGrid4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_DELETE) then
  begin
    if (Confirma_Exclusao) then
    begin
      qryocorrencia.Delete;
      qryocorrencia.Refresh;
    end;
  end;
end;

procedure TFrmCadastro_Funcionarios.DBGrid5DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid5 do
  begin
    if Odd( DataSource.DataSet.RecNo) then
      Canvas.Brush.Color := clMenu
    else
      Canvas.Brush.Color := clWindow;

    Canvas.FillRect(Rect);
    TDbGrid(Sender).Canvas.font.Color:= clBlack;

    if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color:= clSilver;
      FillRect(Rect);
    end;

    DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TFrmCadastro_Funcionarios.DBGrid5KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_DELETE) then
  begin
    if (Confirma_Exclusao) then
    begin
      qrycontribuicao_social.Delete;
      qrycontribuicao_social.Refresh;
    end;
  end;
end;

procedure TFrmCadastro_Funcionarios.Inicia_Transacao;
begin
  Conexao.BeginTrans;
end;

procedure TFrmCadastro_Funcionarios.Inicia_Query_Conexao(Conexao: TADOConnection);
begin
  qryalteracao_salarial.Connection:= FrmCadastro_Funcionarios.Conexao;
  qryalteracao_cargo.Connection:= FrmCadastro_Funcionarios.Conexao;
  qryferias.Connection:= FrmCadastro_Funcionarios.Conexao;
  qryocorrencia.Connection:= FrmCadastro_Funcionarios.Conexao;
  qrycontribuicao_social.Connection:= FrmCadastro_Funcionarios.Conexao;
end;

procedure TFrmCadastro_Funcionarios.Cria_Conexao;
begin
  try
    UGeral.Abre_Conexao(FrmCadastro_Funcionarios.Conexao);
    Inicia_Transacao;
    SetUncommitted(FrmCadastro_Funcionarios.Conexao);
    Inicia_Query_Conexao(FrmCadastro_Funcionarios.Conexao);
  except on e:Exception do
  begin
    ShowMessage('Erro ao abrir conexão com banco de dados. '+e.Message);
    abort;
  end;
  end;
end;

procedure TFrmCadastro_Funcionarios.EdtCodigo_CidadeDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Cidade, FrmChama_Cidade);
  FrmChama_Cidade.ShowModal;
  FrmChama_Cidade.Free;
end;

procedure TFrmCadastro_Funcionarios.EdtCodigo_CidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Cidade, FrmChama_Cidade);
      FrmChama_Cidade.ShowModal;
      FrmChama_Cidade.Free;
    end;
end;

procedure TFrmCadastro_Funcionarios.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Funcionarios.EdtCodigo_DepartamentoDblClick(
  Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Departamento, FrmChama_Departamento);
  FrmChama_Departamento.ShowModal;
  FrmChama_Departamento.Free;
end;

procedure TFrmCadastro_Funcionarios.EdtCodigo_DepartamentoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Departamento, FrmChama_Departamento);
      FrmChama_Departamento.ShowModal;
      FrmChama_Departamento.Free;
    end;
end;

procedure TFrmCadastro_Funcionarios.EdtCodigo_DepartamentoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Funcionarios.EdtCodigo_EnderecoDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Logradouro, FrmChama_Logradouro);
  FrmChama_Logradouro.ShowModal;
  FrmChama_Logradouro.Free;
end;

procedure TFrmCadastro_Funcionarios.EdtCodigo_EnderecoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Logradouro, FrmChama_Logradouro);
      FrmChama_Logradouro.ShowModal;
      FrmChama_Logradouro.Free;
    end;
end;

procedure TFrmCadastro_Funcionarios.EdtCodigo_EnderecoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Funcionarios.EdtCodigo_PerfilDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Perfil_Usuario, FrmChama_Perfil_Usuario);
  FrmChama_Perfil_Usuario.ShowModal;
  FrmChama_Perfil_Usuario.Free;
end;

procedure TFrmCadastro_Funcionarios.EdtCodigo_PerfilKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Perfil_Usuario, FrmChama_Perfil_Usuario);
    FrmChama_Perfil_Usuario.ShowModal;
    FrmChama_Perfil_Usuario.Free;
  end;
end;

procedure TFrmCadastro_Funcionarios.EdtCodigo_PerfilKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Funcionarios.EdtCargoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Funcionarios.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Funcionarios.EdtCodigo_CargoDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Cargo, FrmChama_Cargo);
  FrmChama_Cargo.ShowModal;
  FrmChama_Cargo.Free;
end;

procedure TFrmCadastro_Funcionarios.EdtCodigo_CargoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Cargo, FrmChama_Cargo);
      FrmChama_Cargo.ShowModal;
      FrmChama_Cargo.Free;
    end;
end;

procedure TFrmCadastro_Funcionarios.EdtCodigo_CargoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Funcionarios.EdtCodigo_SetorDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Setor, FrmChama_Setor);
  FrmChama_Setor.ShowModal;
  FrmChama_Setor.Free;
end;

procedure TFrmCadastro_Funcionarios.EdtCodigo_SetorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Setor, FrmChama_Setor);
      FrmChama_Setor.ShowModal;
      FrmChama_Setor.Free;
    end;
end;

procedure TFrmCadastro_Funcionarios.EdtCodigo_SetorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Funcionarios.EdtComissao_ProdutoExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtComissao_Produto, StrToFloat(EdtComissao_Produto.Text));
end;

procedure TFrmCadastro_Funcionarios.EdtComissao_ProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', ',',#08]) then
    key := #0
end;

procedure TFrmCadastro_Funcionarios.EdtCPFExit(Sender: TObject);
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

procedure TFrmCadastro_Funcionarios.EdtData_EmissaoExit(Sender: TObject);
begin
  if (EdtData_Emissao.Text = '  /  /    ') then
    exit
  else
    Util.Verifica_Data(EdtData_Emissao);
end;

procedure TFrmCadastro_Funcionarios.EdtDepartamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Funcionarios.EdtPerfilKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Funcionarios.EdtRGKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', '.',#08]) then
    key := #0
end;

procedure TFrmCadastro_Funcionarios.EdtSalarioExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtSalario, StrToFloat(EdtSalario.Text));
end;

procedure TFrmCadastro_Funcionarios.EdtSalarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', ',',#08]) then
    key := #0
end;

procedure TFrmCadastro_Funcionarios.EdtSetorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Funcionarios.EdtTipo_LogradouroKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Funcionarios.EdtUFKeyPress(Sender: TObject;
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

procedure TFrmCadastro_Funcionarios.FormActivate(Sender: TObject);
var
 i_i :integer;
 Node :TTreeNode;
 BoolResult:boolean;
 tn : TTreeNode;
begin
  {for i_i := 0 to FrmMenu_Geral.MainMenu1.Items.Count -1 do
    Util.AddItemMenuTree(FrmMenu_Geral.MainMenu1.Items[i_i], 0, node);

    if Assigned(TreeView1.Selected) then
      begin
        tn := TreeView1.Selected;
  //      BoolResult := tn.StateIndex in [cFlatChecked,cFlatRadioChecked];
//        Memo1.Text := tn.Text + #13#10 + 'Selected: ' + BoolToStr(BoolResult, True);
      end;} 

  {qAux:= TADOQuery.Create(self);
  with qAux, sql do
    begin
      close;
      Clear;
      Connection:= dm.ADOConnection1;
      add('select * from Permissao');
      open;
    end;
    TreeSeguranca1.pFormulario:= FrmMenu_Geral; }
    //AtivaTree;
    //TreeView1.FullExpand;
  //TreeView1
  ativo:= true;

end;

procedure TFrmCadastro_Funcionarios.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      exit;
    end
    else
      begin
        FrmCadastro_Funcionarios.Free;
        FrmCadastro_Funcionarios:= Nil;
        //FreeAndNil(qAux);
      end;
end;

procedure TFrmCadastro_Funcionarios.FormCreate(Sender: TObject);
begin
  PageControl2.TabIndex:= 0;
  PageControl3.TabIndex:= 0;
  Util.Habilita_Campos(FrmCadastro_Funcionarios);
  Util.Limpa_Campos(FrmCadastro_Funcionarios);
  Util.Desabilita_Campos(FrmCadastro_Funcionarios);
  EdtSalario.Text:= '0,00';
  EdtComissao_Produto.Text:= '0,00';
  EdtDesconto.Text:= '0,00';
  qryalteracao_salarial.Close;
  qryalteracao_cargo.Close;
  qryferias.Close;
  qryocorrencia.Close;
  //Conexao:= TADOConnection.Create(self);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Funcionarios.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Funcionarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      PageControl2.TabIndex:= 0;
      PageControl3.TabIndex:= 0;
      qryalteracao_salarial.Close;
      qryalteracao_cargo.Close;
      qryferias.Close;
      qryocorrencia.Close;
      Util.Habilita_Campos(FrmCadastro_Funcionarios);
      Util.Limpa_Campos(FrmCadastro_Funcionarios);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      BBtnImprimir.Enabled:= false;
      achei:= false;

      Cria_Conexao;

      Consulta.Chama_Cargo_LookUp(Conexao);
      Consulta.Chama_Tipo_Ocorrencia_LookUp(Conexao);
      Consulta.Chama_Funcionario_LookUp(Conexao);
      Gera_Codigo;
      EdtComissao_Produto.Text:= '0,00';
      EdtComissao_Servico.Text:= '0,00';
      EdtSalario.Text:= '0,00';
      EdtDesconto.Text:= '0,00';
      Pega_Alteracao_Salarial;
      Pega_Alteracao_Cargo;
      Pega_Ferias;
      Pega_Ocorrencias;
      Pega_Contribuicao;
      MEdtData_Cadastro.Text:= DateToStr(date);
      EdtNome.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Funcionarios.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Funcionarios.MEdtData_AdmissaoExit(Sender: TObject);
begin
  if (MEdtData_Admissao.Text = '  /  /    ') then
    exit
  else
    Util.Verifica_Data(MEdtData_Admissao);
end;

procedure TFrmCadastro_Funcionarios.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    exit
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Funcionarios.MEdtData_DemissaoExit(Sender: TObject);
begin
  if (MEdtData_Demissao.Text = '  /  /    ') then
    exit
  else
    Util.Verifica_Data(MEdtData_Demissao);
end;

procedure TFrmCadastro_Funcionarios.MEdtData_NascimentoExit(Sender: TObject);
begin
  if (MEdtData_Nascimento.Text = '  /  /    ') then
    exit
  else
    Util.Verifica_Data(MEdtData_Nascimento);
end;

procedure TFrmCadastro_Funcionarios.MEdtPIS_CadastroExit(Sender: TObject);
begin
  if (MEdtPIS_Cadastro.Text = '  /  /    ') then
    exit
  else
    Util.Verifica_Data(MEdtPIS_Cadastro);
end;

procedure TFrmCadastro_Funcionarios.MmoObservacoesKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];
end;

procedure TFrmCadastro_Funcionarios.Pega_Alteracao_Cargo;
begin
  with qryalteracao_cargo, sql do
  begin
    close;
    clear;
    add('select * from Funcionario_Alteracao_Cargo where Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmCadastro_Funcionarios.Pega_Alteracao_Salarial;
begin
  with qryalteracao_salarial, sql do
  begin
    close;
    clear;
    add('select * from Funcionario_Alteracao_Salarial where Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmCadastro_Funcionarios.Pega_Contribuicao;
begin
  with qrycontribuicao_social, sql do
  begin
    close;
    clear;
    add('select * from Funcionario_Contribuicao_Social where Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmCadastro_Funcionarios.Pega_Ferias;
begin
  with qryferias, sql do
  begin
    close;
    clear;
    add('select * from Funcionario_Ferias where Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmCadastro_Funcionarios.Pega_Ocorrencias;
begin
  with qryocorrencia, sql do
  begin
    close;
    clear;
    add('select O.* from Ocorrencia O');
    add('where O.Codigo_Funcionario = :Codigo');
    Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmCadastro_Funcionarios.qryalteracao_cargoAfterScroll(
  DataSet: TDataSet);
begin
  if (qryalteracao_cargo.State in [dsBrowse]) then
  begin
    qryalteracao_cargo.Edit;
    qryalteracao_cargoCodigo.AsInteger:= StrToInt(EdtCodigo.Text);
    qryalteracao_cargo.Post;
  end;
end;

procedure TFrmCadastro_Funcionarios.qryalteracao_salarialAfterScroll(
  DataSet: TDataSet);
begin
  if (qryalteracao_salarial.State in [dsBrowse]) then
  begin
    qryalteracao_salarial.Edit;
    qryalteracao_salarialCodigo.AsInteger:= StrToInt(EdtCodigo.Text);
    qryalteracao_salarial.Post;
  end;
end;

procedure TFrmCadastro_Funcionarios.qrycontribuicao_socialAfterScroll(
  DataSet: TDataSet);
begin
  if (qrycontribuicao_social.State in [dsBrowse]) then
  begin
    qrycontribuicao_social.Edit;
    qrycontribuicao_socialCodigo.AsInteger:= StrToInt(EdtCodigo.Text);
    qrycontribuicao_social.Post;
  end;
end;

procedure TFrmCadastro_Funcionarios.qryferiasAfterScroll(DataSet: TDataSet);
begin
  if (qryferias.State in [dsBrowse]) then
  begin
    qryferias.Edit;
    qryferiasCodigo.AsInteger:= StrToInt(EdtCodigo.Text);
    qryferias.Post;
  end;
end;

procedure TFrmCadastro_Funcionarios.qryocorrenciaAfterScroll(DataSet: TDataSet);
begin
  if (qryocorrencia.State in [dsBrowse]) then
  begin
    qryocorrencia.Edit;
    qryocorrenciaCodigo_Funcionario.AsInteger:= StrToInt(EdtCodigo.Text);
    qryocorrenciaData_Cadastro.AsDateTime:= date;
    qryocorrencia.Post;
  end;
end;

procedure TFrmCadastro_Funcionarios.qryocorrenciaBeforePost(DataSet: TDataSet);
begin
  ValidaCampos(qryocorrencia, DBGrid4);
end;

procedure TFrmCadastro_Funcionarios.TreeView1Click(Sender: TObject);
var
  P: TPoint;
begin
  {TreeView1.Items.BeginUpdate;
  if TreeView1.Selected.ImageIndex = 1 then
    TreeView1.Selected.ImageIndex:= 0
  else
    TreeView1.Selected.ImageIndex:= 1;
  TreeView1.Items.EndUpdate;}
  //GetCursorPos(P);
  //P := TreeView1.ScreenToClient(P);
  //if (htOnStateIcon in TreeView1.GetHitTestInfoAt(P.X,P.Y)) then
  //  Util.ToggleTreeViewCheckBoxes(TreeView1.Selected, cFlatUnCheck, cFlatChecked);
end;

procedure TFrmCadastro_Funcionarios.TreeView1Collapsing(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
  //AllowCollapse:= true;
end;

procedure TFrmCadastro_Funcionarios.TreeView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  //if (Key = VK_SPACE) and Assigned(TreeView1.Selected) then
    //Util.ToggleTreeViewCheckBoxes(TreeView1.Selected,cFlatUnCheck,cFlatChecked);
end;

procedure TFrmCadastro_Funcionarios.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Funcionario, FrmChama_Funcionario);
  FrmChama_Funcionario.ShowModal;
  FrmChama_Funcionario.Release;
end;

end.
