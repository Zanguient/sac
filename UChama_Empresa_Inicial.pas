unit UChama_Empresa_Inicial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta;

type
  TFrmChama_Empresa_Inicial = class(TForm)
    DBGrid1: TDBGrid;
    qrychama_empresa: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_empresaCodigo: TAutoIncField;
    qrychama_empresaNome_Fantasia: TStringField;
    qrychama_empresaRazao_Social: TStringField;
    qrychama_empresaProprietario: TStringField;
    qrychama_empresaCNPJ: TStringField;
    qrychama_empresaInsc_Estadual: TStringField;
    qrychama_empresaInsc_Municipal: TStringField;
    qrychama_empresaTelefone: TStringField;
    qrychama_empresaDescricao: TStringField;
    qrychama_empresaTipo_Logradouro: TStringField;
    qrychama_empresaNumero: TStringField;
    qrychama_empresaDescricao_1: TStringField;
    qrychama_empresaUF: TStringField;
    qrychama_empresaComplemento: TStringField;
    qrychama_empresaContato: TStringField;
    qrychama_empresaTelefone_Contato: TStringField;
    qrychama_empresaCEP: TStringField;
    qrychama_empresaDescricao_2: TStringField;
    qrychama_empresaEMail: TStringField;
    qrychama_empresaCodigo_Municipio: TStringField;
    qrychama_empresaSuframa: TStringField;
    qrychama_empresaEnquadramento: TStringField;
    qrychama_empresaAliquota: TStringField;
    qrychama_empresaRegime_Tributario: TIntegerField;
    qrychama_empresaCNAE: TStringField;
    qrychama_webservice_1_producao: TADOQuery;
    qrychama_webservice_1_producaoCodigo: TIntegerField;
    qrychama_webservice_1_producaoWebService_UF: TStringField;
    qrychama_webservice_1_producaoRecepcao: TStringField;
    qrychama_webservice_1_producaoRetorno: TStringField;
    qrychama_webservice_1_producaoStatus: TStringField;
    qrychama_webservice_1_producaoCancelamento: TStringField;
    qrychama_webservice_1_producaoInutilizacao: TStringField;
    qrychama_webservice_1_producaoConsulta: TStringField;
    qrychama_webservice_1_producaoConsulta_Cadastro: TStringField;
    qrychama_webservice_2_producao: TADOQuery;
    qrychama_webservice_2_producaoCodigo: TIntegerField;
    qrychama_webservice_2_producaoWebService_UF: TStringField;
    qrychama_webservice_2_producaoRecepcao: TStringField;
    qrychama_webservice_2_producaoRetorno: TStringField;
    qrychama_webservice_2_producaoStatus: TStringField;
    qrychama_webservice_2_producaoCancelamento: TStringField;
    qrychama_webservice_2_producaoInutilizacao: TStringField;
    qrychama_webservice_2_producaoConsulta: TStringField;
    qrychama_webservice_2_producaoConsulta_Cadastro: TStringField;
    qrychama_webservice_1_homologacao: TADOQuery;
    qrychama_webservice_1_homologacaoCodigo: TIntegerField;
    qrychama_webservice_1_homologacaoWebService_UF: TStringField;
    qrychama_webservice_1_homologacaoRecepcao: TStringField;
    qrychama_webservice_1_homologacaoRetorno: TStringField;
    qrychama_webservice_1_homologacaoStatus: TStringField;
    qrychama_webservice_1_homologacaoCancelamento: TStringField;
    qrychama_webservice_1_homologacaoInutilizacao: TStringField;
    qrychama_webservice_1_homologacaoConsulta: TStringField;
    qrychama_webservice_1_homologacaoConsulta_Cadastro: TStringField;
    qrychama_webservice_2_homologacao: TADOQuery;
    qrychama_webservice_2_homologacaoCodigo: TIntegerField;
    qrychama_webservice_2_homologacaoWebService_UF: TStringField;
    qrychama_webservice_2_homologacaoRecepcao: TStringField;
    qrychama_webservice_2_homologacaoRetorno: TStringField;
    qrychama_webservice_2_homologacaoStatus: TStringField;
    qrychama_webservice_2_homologacaoCancelamento: TStringField;
    qrychama_webservice_2_homologacaoInutilizacao: TStringField;
    qrychama_webservice_2_homologacaoConsulta: TStringField;
    qrychama_webservice_2_homologacaoConsulta_Cadastro: TStringField;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Atribui_Variaveis;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure Verifica_Rede;
    procedure Habilita_Timer;
    procedure Chama_WebService;
    procedure Pega_WebService;
  public
    { Public declarations }
  end;

var
  FrmChama_Empresa_Inicial: TFrmChama_Empresa_Inicial;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UMenu_Geral, UDeclaracao;

{$R *.dfm}

procedure TFrmChama_Empresa_Inicial.DBGrid1DblClick(Sender: TObject);
begin
  codigo_empresa:= qrychama_empresaCodigo.AsInteger;
  nome_fantasia:= qrychama_empresaNome_Fantasia.AsString;
  razao_social:= qrychama_empresaRazao_Social.AsString;
  proprietario:= qrychama_empresaProprietario.AsString;
  cnae:= qrychama_empresaCNAE.AsString;
  aliquota_sn:= qrychama_empresaAliquota.AsString;
  regime_tributario_emitente:= qrychama_empresaRegime_Tributario.AsString;
  cnpj:= qrychama_empresaCNPJ.AsString;
  insc_estadual:= qrychama_empresaInsc_Estadual.AsString;
  insc_municipal:= qrychama_empresaInsc_Municipal.AsString;
  telefone:= qrychama_empresaTelefone.AsString;
  endereco:= qrychama_empresaDescricao.AsString;
  tipo_endereco:= qrychama_empresaTipo_Logradouro.AsString;
  numero:= qrychama_empresaNumero.AsString;
  cidade:= qrychama_empresaDescricao_1.AsString;
  complemento:= qrychama_empresaComplemento.AsString;
  contato:= qrychama_empresaContato.AsString;
  telefone_contato:= qrychama_empresaTelefone_Contato.AsString;
  cep:= qrychama_empresaCEP.AsString;
  uf:= qrychama_empresaUF.AsString;
  setor:= qrychama_empresaDescricao_2.AsString;
  email:= qrychama_empresaEMail.AsString;
  cod_municipio:= qrychama_empresaCodigo_Municipio.AsString;
  suframa:= qrychama_empresaSuframa.AsString;
  enquadramento_empresa:= qrychama_empresaEnquadramento.AsString;
  Atribui_Variaveis;
  Habilita_Timer;
  FrmMenu_Geral.StbStatus.Panels[0].Text:= 'Empresa.: ' + nome_fantasia;
  Verifica_Rede;
  //Inicializa_Dados_Principais_Movimentacao(16, FrmMenu_Geral.CDSChama_Produto, FrmMenu_Geral.qrychama_produto);
  FrmChama_Empresa_Inicial.Close;
end;

procedure TFrmChama_Empresa_Inicial.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State)
end;

procedure TFrmChama_Empresa_Inicial.Atribui_Variaveis;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select * from Configuracao_Sistema where Codigo_Empresa = :Codigo');
      Parameters.ParamByName('Codigo').Value:= UDeclaracao.codigo_empresa;
      open;
    end;

    mensagem:= qAux.FieldByName('Mensagem_Cupom').AsString;
    perfil_arquivo:= qAux.FieldByName('Perfil_Arquivo_Fiscal').AsString;
    versao_efd:= qAux.FieldByName('Versao_EFD').AsString;
    tipo_atividade:= qAux.FieldByName('Codigo_Tipo_Atividade').AsString;
    codigo_tabela_preco_padrao:= qAux.FieldByName('Codigo_Tabela_Preco_Padrao').AsInteger;
    codigo_tabela_preco_ativo:= qAux.FieldByName('Codigo_Tabela_Preco_Padrao').AsInteger;

    avisa_tabela_preco:= qAux.FieldByName('Avisa_Tabela_Preco').AsString;
    avisa_lancamento_financeiro:= qAux.FieldByName('Avisa_Lancamento_Financeiro').AsString;
    avisa_cheque:= qAux.FieldByName('Avisa_Cheque').AsString;
    avisa_pedido_compra:= qAux.FieldByName('Avisa_Pedido_Compra_Pendente').AsString;
    avisa_aniversario_cliente:= qAux.FieldByName('Avisa_Aniversario_Cliente').AsString;
    avisa_aniversario_funcionario:= qAux.FieldByName('Avisa_Aniversario_Funcionario').AsString;
    avisa_produto_vencido:= qAux.FieldByName('Avisa_Produto_Vencido').AsString;
    fazer_backup:= qAux.FieldByName('Fazer_Backup').AsString;
    avisa_conta_fixa:= qAux.FieldByName('Avisa_Conta_Fixa').AsString;
    avisa_cotacao_preco:= qAux.FieldByName('Avisa_Cotacao_Preco').AsString;
    dias_aviso:= qAux.FieldByName('Dias_Aviso').AsInteger;
    tempo_atualizacao:= qAux.FieldByName('Tempo_Atualizacao').AsInteger;
    issqnn:= qAux.FieldByName('ISSQN').AsString;
    codigo_tipo_documento:= qAux.FieldByName('Codigo_Tipo_Documento').AsInteger;
    codigo_departamento:= qAux.FieldByName('Codigo_Departamento').AsInteger;
    codigo_plano_financeiro:= qAux.FieldByName('Codigo_Plano_Financeiro').AsInteger;
    historico_conta:= qAux.FieldByName('Historico').AsString;

    codigo_tipo_documento_pagar:= qAux.FieldByName('Codigo_Tipo_Documento_Pagar').AsInteger;
    codigo_departamento_pagar:= qAux.FieldByName('Codigo_Departamento_Pagar').AsInteger;
    codigo_plano_financeiro_pagar:= qAux.FieldByName('Codigo_Plano_Financeiro_Pagar').AsInteger;
    historico_conta_pagar:= qAux.FieldByName('Historico_Pagar').AsString;

    ambiente:= qAux.FieldByName('Ambiente').AsString;
    impressao_danfe:= qAux.FieldByName('Tipo_Impressao').AsString;
    forma_emissao := qAux.FieldByName('Tipo_Emissao').AsString;
    salva_xml:= qAux.FieldByName('Salvar_XML').AsString;
    logomarca:= qAux.FieldByName('Logomarca').AsString;
    n_certificado:= qAux.FieldByName('N_Certificado').AsString;
    senha_certificado:= qAux.FieldByName('Senha_Certificado').AsString;

    Chama_Mensagem;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmChama_Empresa_Inicial.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_SPACE) then
    //DBGrid1DblClick(self);
end;

procedure TFrmChama_Empresa_Inicial.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Empresa_Inicial:= nil;
end;

procedure TFrmChama_Empresa_Inicial.FormCreate(Sender: TObject);
begin
  Consulta.Chama_Empresa_Inicial;
end;

procedure TFrmChama_Empresa_Inicial.Habilita_Timer;
begin
  FrmMenu_Geral.Timer3.Interval:= tempo_atualizacao;
  FrmMenu_Geral.Enabled:= true;
end;

procedure TFrmChama_Empresa_Inicial.Verifica_Rede;
begin
  {if (Verifica_Status_rede) then
  begin
    DeleteFile(Local_Arquivo(4));
    //inicializa dados para começar uma nova venda
    Inicializa_Dados_Principais_Movimentacao(0,dm.qrychama_produto);
    Inicializa_Dados_Principais_Movimentacao(1,dm.qrychama_cliente);
    Inicializa_Dados_Principais_Movimentacao(2,dm.qrychama_condicao);
    Inicializa_Dados_Principais_Movimentacao(5,dm.qryvenda);
    Inicializa_Dados_Principais_Movimentacao(6,dm.qryitens_venda);
    Inicializa_Dados_Principais_Movimentacao(7,dm.qryr05);
    Inicializa_Dados_Principais_Movimentacao(9,dm.qrycontrola_codigo);  //9 ou 17
    //Inicializa_Dados_Principais_Movimentacao(10,dm.CDSFechamento_Venda, dm.qryfechamento_venda);
    Inicializa_Dados_Principais_Movimentacao(11,dm.qryr04);
    Inicializa_Dados_Principais_Movimentacao(12,dm.qryr07);
    Inicializa_Dados_Principais_Movimentacao(13,dm.qryR06);
    Inicializa_Dados_Principais_Movimentacao(14,dm.qryfechamento_venda_aux);
    Inicializa_Dados_Principais_Movimentacao(15,dm.qryitens_venda_aux);
    Inicializa_Dados_Principais_Movimentacao(18,dm.qryicms);
    Inicializa_Dados_Principais_Movimentacao(19,dm.qryiss);
    Inicializa_Dados_Principais_Movimentacao(20,dm.qryipi);
    Inicializa_Dados_Principais_Movimentacao(21,dm.qrypis);
    Inicializa_Dados_Principais_Movimentacao(22,dm.qrycofins);
    //Gera_Codigo_Lancamento_Sem_Inserir;
  end
  else
    Mensagem_Erro_Rede;  }
end;

procedure TFrmChama_Empresa_Inicial.Chama_WebService;
begin
  with qrychama_webservice_1_producao do
    begin
      close;
      sql.clear;
      sql.add('select WebService_1_Producao.* from WebService_1_Producao');
      sql.add('where WebService_1_Producao.Codigo = :Codigo1');
      Parameters.ParamByName('Codigo1').Value:= qrychama_empresaCodigo.AsInteger;
      open;
    end;

  with qrychama_webservice_2_producao do
    begin
      close;
      sql.clear;
      sql.add('select WebService_2_Producao.* from WebService_2_Producao');
      sql.add('where WebService_2_Producao.Codigo = :Codigo1');
      Parameters.ParamByName('Codigo1').Value:= qrychama_empresaCodigo.AsInteger;
      open;
    end;

  with qrychama_webservice_1_homologacao do
    begin
      close;
      sql.clear;
      sql.add('select WebService_1_Homologacao.* from WebService_1_Homologacao');
      sql.add('where WebService_1_Homologacao.Codigo = :Codigo1');
      Parameters.ParamByName('Codigo1').Value:= qrychama_empresaCodigo.AsInteger;
      open;
    end;

  with qrychama_webservice_2_homologacao do
    begin
      close;
      sql.clear;
      sql.add('select WebService_2_Homologacao.* from WebService_2_Homologacao');
      sql.add('where WebService_2_Homologacao.Codigo = :Codigo1');
      Parameters.ParamByName('Codigo1').Value:= qrychama_empresaCodigo.AsInteger;
      open;
    end;
end;

procedure TFrmChama_Empresa_Inicial.Pega_WebService;
begin
  Chama_WebService;
  webservice_1_Homologacao:= qrychama_webservice_1_homologacaoWebService_UF.AsString;
  recepcao_1_Homologacao:= qrychama_webservice_1_homologacaoRecepcao.AsString;
  retorno_1_Homologacao:= qrychama_webservice_1_homologacaoRetorno.AsString;
  status_1_Homologacao:= qrychama_webservice_1_homologacaoStatus.AsString;
  cancelamento_1_Homologacao:= qrychama_webservice_1_homologacaoCancelamento.AsString;
  inutilizacao_1_Homologacao:= qrychama_webservice_1_homologacaoInutilizacao.AsString;
  consulta_1_Homologacao:= qrychama_webservice_1_homologacaoConsulta.AsString;
  consulta_cadastro_1_Homologacao:= qrychama_webservice_1_homologacaoConsulta_Cadastro.AsString;

  webservice_2_Homologacao:= qrychama_webservice_2_homologacaoWebService_UF.AsString;
  recepcao_2_Homologacao:= qrychama_webservice_2_homologacaoRecepcao.AsString;
  retorno_2_Homologacao:= qrychama_webservice_2_homologacaoRetorno.AsString;
  status_2_Homologacao:= qrychama_webservice_2_homologacaoStatus.AsString;
  cancelamento_2_Homologacao:= qrychama_webservice_2_homologacaoCancelamento.AsString;
  inutilizacao_2_Homologacao:= qrychama_webservice_2_homologacaoInutilizacao.AsString;
  consulta_2_Homologacao:= qrychama_webservice_2_homologacaoConsulta.AsString;
  consulta_cadastro_2_Homologacao:= qrychama_webservice_2_homologacaoConsulta_Cadastro.AsString;

  webservice_1_producao:= qrychama_webservice_1_producaoWebService_UF.AsString;
  recepcao_1_producao:= qrychama_webservice_1_producaoRecepcao.AsString;
  retorno_1_producao:= qrychama_webservice_1_producaoRetorno.AsString;
  status_1_producao:= qrychama_webservice_1_producaoStatus.AsString;
  cancelamento_1_producao:= qrychama_webservice_1_producaoCancelamento.AsString;
  inutilizacao_1_producao:= qrychama_webservice_1_producaoInutilizacao.AsString;
  consulta_1_producao:= qrychama_webservice_1_producaoConsulta.AsString;
  consulta_cadastro_1_producao:= qrychama_webservice_1_producaoConsulta_Cadastro.AsString;

  webservice_2_producao:= qrychama_webservice_2_producaoWebService_UF.AsString;
  recepcao_2_producao:= qrychama_webservice_2_producaoRecepcao.AsString;
  retorno_2_producao:= qrychama_webservice_2_producaoRetorno.AsString;
  status_2_producao:= qrychama_webservice_2_producaoStatus.AsString;
  cancelamento_2_producao:= qrychama_webservice_2_producaoCancelamento.AsString;
  inutilizacao_2_producao:= qrychama_webservice_2_producaoInutilizacao.AsString;
  consulta_2_producao:= qrychama_webservice_2_producaoConsulta.AsString;
  consulta_cadastro_2_producao:= qrychama_webservice_2_producaoConsulta_Cadastro.AsString;

end;

end.
