unit UChama_Configuracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, Modelo.Entidade.TConfiguracoesECFEntidade,
  Modelo.Dominio.TConfiguracoesECFDominio, System.Generics.Collections;

type
  TFrmChama_Configuracao = class(TForm)
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qrychama_configuracao: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
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
    qrychama_configuracaoCodigo_Empresa: TIntegerField;
    qrychama_configuracaoCaminho_ECF: TStringField;
    qrychama_configuracaoMensagem_Cupom: TStringField;
    qrychama_configuracaoPorta_Comunicacao: TStringField;
    qrychama_configuracaoPerfil_Arquivo_Fiscal: TStringField;
    qrychama_configuracaoVersao_EFD: TStringField;
    qrychama_configuracaoCodigo_Tipo_Atividade: TStringField;
    qrychama_configuracaoTipo_Atividade: TStringField;
    qrychama_configuracaoAmbiente: TStringField;
    qrychama_configuracaoTipo_Impressao: TStringField;
    qrychama_configuracaoTipo_Emissao: TStringField;
    qrychama_configuracaoLogomarca: TStringField;
    qrychama_configuracaoSalvar_XML: TStringField;
    qrychama_configuracaoCodigo_Tabela_Preco_Padrao: TIntegerField;
    qrychama_configuracaoAvisa_Tabela_Preco: TStringField;
    qrychama_configuracaoAvisa_Lancamento_Financeiro: TStringField;
    qrychama_configuracaoAvisa_Cheque: TStringField;
    qrychama_configuracaoAvisa_Pedido_Compra_Pendente: TStringField;
    qrychama_configuracaoAvisa_Aniversario_Cliente: TStringField;
    qrychama_configuracaoAvisa_Aniversario_Funcionario: TStringField;
    qrychama_configuracaoAvisa_Produto_Vencido: TStringField;
    qrychama_configuracaoFazer_Backup: TStringField;
    qrychama_configuracaoAvisa_Conta_Fixa: TStringField;
    qrychama_configuracaoAvisa_Cotacao_Preco: TStringField;
    qrychama_configuracaoDias_Aviso: TIntegerField;
    qrychama_configuracaoTempo_Atualizacao: TIntegerField;
    qrychama_configuracaoISSQN: TStringField;
    qrychama_configuracaoCodigo_Tipo_Documento: TIntegerField;
    qrychama_configuracaoCodigo_Departamento: TIntegerField;
    qrychama_configuracaoCodigo_Plano_Financeiro: TIntegerField;
    qrychama_configuracaoHistorico: TStringField;
    qrychama_configuracaoCodigo_Tipo_Documento_Pagar: TIntegerField;
    qrychama_configuracaoCodigo_Departamento_Pagar: TIntegerField;
    qrychama_configuracaoCodigo_Plano_Financeiro_Pagar: TIntegerField;
    qrychama_configuracaoHistorico_Pagar: TStringField;
    qrychama_configuracaoN_Certificado: TStringField;
    qrychama_configuracaoSenha_Certificado: TStringField;
    qrychama_configuracaoCaminho_Schema: TStringField;
    qrychama_configuracaoEAN_Balanca: TIntegerField;
    qrychama_configuracaoGerar_Financeiro: TIntegerField;
    qrychama_configuracaoDias_Orcamento_Vencido: TIntegerField;
    qrychama_configuracaoFechar_Caixa: TIntegerField;
    qrychama_configuracaoCalcula_Juro: TIntegerField;
    qrychama_configuracaoAtualiza_Orcamento_Vencido: TIntegerField;
    qrychama_configuracaoConsulta_Padrao_Produto: TIntegerField;
    qrychama_configuracaoTipo_Desc_Acr_Padrao: TIntegerField;
    qrychama_configuracaoGerar_Estoque: TIntegerField;
    qrychama_configuracaoOb_Cliente_Nome: TIntegerField;
    qrychama_configuracaoOb_Cliente_Razao_Social: TIntegerField;
    qrychama_configuracaoOb_Cliente_CPF: TIntegerField;
    qrychama_configuracaoOb_Cliente_RG: TIntegerField;
    qrychama_configuracaoOb_Cliente_CNPJ: TIntegerField;
    qrychama_configuracaoOb_Cliente_Insc_Estadual: TIntegerField;
    qrychama_configuracaoOb_Cliente_Endereco: TIntegerField;
    qrychama_configuracaoOb_Cliente_Numero: TIntegerField;
    qrychama_configuracaoOb_Cliente_Setor: TIntegerField;
    qrychama_configuracaoOb_Cliente_Email: TIntegerField;
    qrychama_configuracaoOb_Cliente_Cidade: TIntegerField;
    qrychama_configuracaoOb_Cliente_Data_Nascimento: TIntegerField;
    qrychama_configuracaoOb_Cliente_Telefone: TIntegerField;
    qrychama_configuracaoBloqueia_Cliente: TStringField;
    qrychama_configuracaoTipo_Impressao_Pedido: TIntegerField;
    qrychama_configuracaoCaminho_PDF_Pedido: TStringField;
    qrychama_configuracaoUsar_Comissao: TIntegerField;
    qrychama_configuracaoTamanho_Impressao: TIntegerField;
    qrychama_configuracaoQtde_Copias: TIntegerField;
    qrychama_configuracaoCaminho_PDF_Carne: TStringField;
    qrychama_configuracaoObservacoes_Carne: TStringField;
    qrychama_configuracaoTipo_Dias: TIntegerField;
    qrychama_configuracaoDescricao: TStringField;
    qrychama_configuracaoTipo_Documento: TStringField;
    qrychama_configuracaoDepartamento: TStringField;
    qrychama_configuracaoPlano: TStringField;
    qrychama_configuracaoTipo_Documento_1: TStringField;
    qrychama_configuracaoDepartamento_1: TStringField;
    qrychama_configuracaoPlano_1: TStringField;
    qryECF: TADOQuery;
    qryECFCodigo: TAutoIncField;
    qryECFCodigo_Empresa: TIntegerField;
    qryECFN_Fabricacao: TStringField;
    qryECFGT: TFloatField;
    qryECFPorta: TStringField;
    qryECFMarca: TStringField;
    qryECFCIECF: TStringField;
    qryECFMD5: TStringField;
    qryECFData_Ativacao: TDateTimeField;
    qrychama_configuracaoGera_Pre_Venda: TStringField;
    qrychama_configuracaoGera_OS: TStringField;
    qrychama_configuracaoGera_DAV: TStringField;
    qrychama_configuracaoGera_NFE: TStringField;
    qrychama_configuracaoQtde_Maq: TIntegerField;
    qrychama_configuracaoTipo_OS: TIntegerField;
    qrychama_configuracaoModelo_Etiqueta: TIntegerField;
    qrychama_configuracaoDPI_Impressora_Etiqueta: TIntegerField;
    qrychama_configuracaoAvanco_Impressora_Etiqueta: TIntegerField;
    qrychama_configuracaoPorta_Impressora_Etiqueta: TStringField;
    qrychama_configuracaoLimpar_Memoria_Impressora_Etiqueta: TIntegerField;
    qrychama_configuracaoTemperatura_Impressora_Etiqueta: TIntegerField;
    qrychama_configuracaoOpcao_Servico_Padrao: TIntegerField;
    qrychama_configuracaoDesbloqueia_Cliente: TStringField;
    qrychama_configuracaoControla_Credito_Cliente: TIntegerField;
    qrychama_configuracaoBusca_Parametro_Calculo_Preco: TIntegerField;
    qrychama_configuracaoGera_Cupom_Fiscal: TStringField;
    qrychama_configuracaoGera_Codigo_EAN_Valido: TIntegerField;
    qrychama_configuracaoCodigo_CFOP_Padrao: TIntegerField;
    qrychama_configuracaoCFOP: TStringField;
    qrychama_configuracaoTrazer_Somente_Cond_Pag_ECF: TIntegerField;
    qrychama_configuracaoIdCSC: TStringField;
    qrychama_configuracaoNumeroCSC: TStringField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    oConfigECF: TConfiguracoesECFEntidade;
    oConfigECFLista: TObjectList<TConfiguracoesECFEntidade>;
    oConfigECFDominio: TConfiguracoesECFDominio;
    procedure Pega_WebService;
  public
    { Public declarations }
  end;

var
  FrmChama_Configuracao: TFrmChama_Configuracao;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UConfiguracao_Sistema;

{$R *.dfm}

procedure TFrmChama_Configuracao.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Configuracao.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Configuracao;
  Consulta.Chama_Configuracao_ECF;
end;

procedure TFrmChama_Configuracao.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmConfiguracao_Sistema <> NIl) and (FrmConfiguracao_Sistema.ativo = true) then
  begin
    //FrmConfiguracao_Sistema.EdtCaminho_ECF.Text:= qrychama_configuracaoCaminho_ECF.AsString;
    FrmConfiguracao_Sistema.EdtMensagem_Cupom.Text:= qrychama_configuracaoMensagem_Cupom.AsString;
    //FrmConfiguracao_Sistema.EdtPorta_Comunicacao.Text:= qrychama_configuracaoPorta_Comunicacao.AsString;
    FrmConfiguracao_Sistema.EdtPerfil.Text:= qrychama_configuracaoPerfil_Arquivo_Fiscal.AsString;
    FrmConfiguracao_Sistema.EdtVersao_EFD.Text:= qrychama_configuracaoVersao_EFD.AsString;
    FrmConfiguracao_Sistema.EdtCodigo_Tipo_Atividade.Text:= qrychama_configuracaoCodigo_Tipo_Atividade.AsString;
    FrmConfiguracao_Sistema.EdtTipo_Atividade.Text:= qrychama_configuracaoTipo_Atividade.AsString;

    if (qrychama_configuracaoAmbiente.AsString = 'PRODUÇÃO') then
      FrmConfiguracao_Sistema.RGAmbiente.ItemIndex:= 0
    else
      FrmConfiguracao_Sistema.RGAmbiente.ItemIndex:= 1;

    if (qrychama_configuracaoTipo_Impressao.AsString = 'RETRATO') then
      FrmConfiguracao_Sistema.RGDanfe.ItemIndex:= 0
    else
      FrmConfiguracao_Sistema.RGDanfe.ItemIndex:= 1;

    if (qrychama_configuracaoTipo_Emissao.AsString = 'NORMAL') then
      FrmConfiguracao_Sistema.RGForma_Emissao.ItemIndex:= 0
    else if (qrychama_configuracaoTipo_Emissao.AsString = 'CONTINGÊNCIA') then
      FrmConfiguracao_Sistema.RGForma_Emissao.ItemIndex:= 1
    else if (qrychama_configuracaoTipo_Emissao.AsString = 'SCAN') then
      FrmConfiguracao_Sistema.RGForma_Emissao.ItemIndex:= 2
    else if (qrychama_configuracaoTipo_Emissao.AsString = 'DPEC') then
      FrmConfiguracao_Sistema.RGForma_Emissao.ItemIndex:= 3
    else if (qrychama_configuracaoTipo_Emissao.AsString = 'FSDA') then
      FrmConfiguracao_Sistema.RGForma_Emissao.ItemIndex:= 4;

    FrmConfiguracao_Sistema.EdtSalva_XML.Text:= qrychama_configuracaoSalvar_XML.AsString;
    FrmConfiguracao_Sistema.EdtLogomarca.Text:= qrychama_configuracaoLogomarca.AsString;
    FrmConfiguracao_Sistema.EdtN_Certificado.Text:= qrychama_configuracaoN_Certificado.AsString;
    FrmConfiguracao_Sistema.EdtSenha_Certificado.Text:= qrychama_configuracaoSenha_Certificado.AsString;
    FrmConfiguracao_Sistema.EdtIdCSC.Text:= qrychama_configuracaoIdCSC.AsString;
    FrmConfiguracao_Sistema.EdtNumero_CSC.Text:= qrychama_configuracaoNumeroCSC.AsString;

    FrmConfiguracao_Sistema.EdtCodigo_Tabela_Preco.Text:= qrychama_configuracaoCodigo_Tabela_Preco_Padrao.AsString;
    FrmConfiguracao_Sistema.EdtTabela_Preco.Text:= qrychama_configuracaoDescricao.AsString;

    if (qrychama_configuracaoAvisa_Tabela_Preco.AsString = 'SIM') then
      FrmConfiguracao_Sistema.CBTabela_Preco.Checked:= true
    else
      FrmConfiguracao_Sistema.CBTabela_Preco.Checked:= false;

    if (qrychama_configuracaoAvisa_Lancamento_Financeiro.AsString = 'SIM') then
      FrmConfiguracao_Sistema.CBLancamento_Financeiro.Checked:= true
    else
      FrmConfiguracao_Sistema.CBLancamento_Financeiro.Checked:= false;

    if (qrychama_configuracaoAvisa_Cheque.AsString = 'SIM') then
      FrmConfiguracao_Sistema.CBCheque.Checked:= true
    else
      FrmConfiguracao_Sistema.CBCheque.Checked:= false;

    if (qrychama_configuracaoAvisa_Pedido_Compra_Pendente.AsString = 'SIM') then
      FrmConfiguracao_Sistema.CBPedido_Compra.Checked:= true
    else
      FrmConfiguracao_Sistema.CBPedido_Compra.Checked:= false;

    if (qrychama_configuracaoAvisa_Aniversario_Cliente.AsString = 'SIM') then
      FrmConfiguracao_Sistema.CBAniversario_Cliente.Checked:= true
    else
      FrmConfiguracao_Sistema.CBAniversario_Cliente.Checked:= false;

    if (qrychama_configuracaoAvisa_Aniversario_Funcionario.AsString = 'SIM') then
      FrmConfiguracao_Sistema.CBAniversario_Funcionario.Checked:= true
    else
      FrmConfiguracao_Sistema.CBAniversario_Funcionario.Checked:= false;

    if (qrychama_configuracaoAvisa_Produto_Vencido.AsString = 'SIM') then
      FrmConfiguracao_Sistema.CBProduto_Vencido.Checked:= true
    else
      FrmConfiguracao_Sistema.CBProduto_Vencido.Checked:= false;

    if (qrychama_configuracaoFazer_Backup.AsString = 'SIM') then
      FrmConfiguracao_Sistema.CBBackup.Checked:= true
    else
      FrmConfiguracao_Sistema.CBBackup.Checked:= false;

    if (qrychama_configuracaoAvisa_Conta_Fixa.AsString = 'SIM') then
      FrmConfiguracao_Sistema.CBConta_Fixa.Checked:= true
    else
      FrmConfiguracao_Sistema.CBConta_Fixa.Checked:= false;

    if (qrychama_configuracaoAvisa_Cotacao_Preco.AsString = 'SIM') then
      FrmConfiguracao_Sistema.CBCotacao_Preco.Checked:= true
    else
      FrmConfiguracao_Sistema.CBCotacao_Preco.Checked:= false;

    FrmConfiguracao_Sistema.EdtDias_Avisar.Text:= qrychama_configuracaoDias_Aviso.AsString;
    FrmConfiguracao_Sistema.EdtTempo_Atualizacao.Text:= qrychama_configuracaoTempo_Atualizacao.AsString;
    FrmConfiguracao_Sistema.EdtISSQN.Text:= qrychama_configuracaoISSQN.AsString;

    FrmConfiguracao_Sistema.EdtHistorico.Text:= qrychama_configuracaoHistorico.AsString;

    FrmConfiguracao_Sistema.EdtCodigo_Tipo_Documento.Text:= qrychama_configuracaoCodigo_Tipo_Documento.AsString;
    FrmConfiguracao_Sistema.EdtTipo_Documento.Text:= qrychama_configuracaoTipo_Documento.AsString;

    FrmConfiguracao_Sistema.EdtCodigo_Departamento.Text:= qrychama_configuracaoCodigo_Departamento.AsString;
    FrmConfiguracao_Sistema.EdtDepartamento.Text:= qrychama_configuracaoDepartamento.AsString;

    FrmConfiguracao_Sistema.EdtCodigo_Plano.Text:= qrychama_configuracaoCodigo_Plano_Financeiro.AsString;
    FrmConfiguracao_Sistema.EdtPlano.Text:= qrychama_configuracaoPlano.AsString;



    FrmConfiguracao_Sistema.EdtHistorico_Pagar.Text:= qrychama_configuracaoHistorico_Pagar.AsString;

    FrmConfiguracao_Sistema.EdtCodigo_Tipo_Documento_Pagar.Text:= qrychama_configuracaoCodigo_Tipo_Documento_Pagar.AsString;
    FrmConfiguracao_Sistema.EdtTipo_Documento_Pagar.Text:= qrychama_configuracaoTipo_Documento_1.AsString;

    FrmConfiguracao_Sistema.EdtCodigo_Departamento_Pagar.Text:= qrychama_configuracaoCodigo_Departamento_Pagar.AsString;
    FrmConfiguracao_Sistema.EdtDepartamento_Pagar.Text:= qrychama_configuracaoDepartamento_1.AsString;

    FrmConfiguracao_Sistema.EdtCodigo_Plano_Pagar.Text:= qrychama_configuracaoCodigo_Plano_Financeiro_Pagar.AsString;
    FrmConfiguracao_Sistema.EdtPlano_Pagar.Text:= qrychama_configuracaoPlano_1.AsString;
    FrmConfiguracao_Sistema.EdtCaminho_Schema.Text:= qrychama_configuracaoCaminho_Schema.AsString;

    FrmConfiguracao_Sistema.RGEAN.ItemIndex:= qrychama_configuracaoEAN_Balanca.AsInteger;
    FrmConfiguracao_Sistema.RGGerar_Financeiro.ItemIndex:= qrychama_configuracaoGerar_Financeiro.AsInteger;
    FrmConfiguracao_Sistema.EdtDias_Orcamento_Vencido.Text:= qrychama_configuracaoDias_Orcamento_Vencido.AsString;

    if (qrychama_configuracaoFechar_Caixa.AsInteger = 0) then
      FrmConfiguracao_Sistema.CBFechar_Caixa.Checked:= true
    else
      FrmConfiguracao_Sistema.CBFechar_Caixa.Checked:= false;

    if (qrychama_configuracaoCalcula_Juro.AsInteger = 0) then
      FrmConfiguracao_Sistema.CBCalcula_Juro.Checked:= true
    else
      FrmConfiguracao_Sistema.CBCalcula_Juro.Checked:= false;

    if (qrychama_configuracaoAtualiza_Orcamento_Vencido.AsInteger = 0) then
      FrmConfiguracao_Sistema.CBOrcamento_Vencido.Checked:= true
    else
      FrmConfiguracao_Sistema.CBOrcamento_Vencido.Checked:= false;

    FrmConfiguracao_Sistema.RGConsulta_Produto_Por.ItemIndex:= qrychama_configuracaoConsulta_Padrao_Produto.AsInteger;
    FrmConfiguracao_Sistema.RGTipoDesc_Acr_Fechamento.ItemIndex:= qrychama_configuracaoTipo_Desc_Acr_Padrao.AsInteger;
    FrmConfiguracao_Sistema.RGGerar_Estoque.ItemIndex:= qrychama_configuracaoGerar_Estoque.AsInteger;

    if (qrychama_configuracaoOb_Cliente_Nome.AsInteger = 0) then
      FrmConfiguracao_Sistema.CBCliente_Nome.Checked:= true
    else
      FrmConfiguracao_Sistema.CBCliente_Nome.Checked:= false;

    if (qrychama_configuracaoOb_Cliente_Razao_Social.AsInteger = 0) then
      FrmConfiguracao_Sistema.CBCliente_Razao_Social.Checked:= true
    else
      FrmConfiguracao_Sistema.CBCliente_Razao_Social.Checked:= false;

    if (qrychama_configuracaoOb_Cliente_CPF.AsInteger = 0) then
      FrmConfiguracao_Sistema.CBCliente_CPF.Checked:= true
    else
      FrmConfiguracao_Sistema.CBCliente_CPF.Checked:= false;

    if (qrychama_configuracaoOb_Cliente_RG.AsInteger = 0) then
      FrmConfiguracao_Sistema.CBCliente_RG.Checked:= true
    else
      FrmConfiguracao_Sistema.CBCliente_RG.Checked:= false;

    if (qrychama_configuracaoOb_Cliente_CNPJ.AsInteger = 0) then
      FrmConfiguracao_Sistema.CBCliente_CNPJ.Checked:= true
    else
      FrmConfiguracao_Sistema.CBCliente_CNPJ.Checked:= false;

    if (qrychama_configuracaoOb_Cliente_Insc_Estadual.AsInteger = 0) then
      FrmConfiguracao_Sistema.CBCliente_Insc_Estadual.Checked:= true
    else
      FrmConfiguracao_Sistema.CBCliente_Insc_Estadual.Checked:= false;

    if (qrychama_configuracaoOb_Cliente_Endereco.AsInteger = 0) then
      FrmConfiguracao_Sistema.CBCliente_Endereco.Checked:= true
    else
      FrmConfiguracao_Sistema.CBCliente_Endereco.Checked:= false;

    if (qrychama_configuracaoOb_Cliente_Numero.AsInteger = 0) then
      FrmConfiguracao_Sistema.CBCliente_Numero.Checked:= true
    else
      FrmConfiguracao_Sistema.CBCliente_Numero.Checked:= false;

    if (qrychama_configuracaoOb_Cliente_Setor.AsInteger = 0) then
      FrmConfiguracao_Sistema.CBCliente_Setor.Checked:= true
    else
      FrmConfiguracao_Sistema.CBCliente_Setor.Checked:= false;

    if (qrychama_configuracaoOb_Cliente_Email.AsInteger = 0) then
      FrmConfiguracao_Sistema.CBCliente_Email.Checked:= true
    else
      FrmConfiguracao_Sistema.CBCliente_Email.Checked:= false;

    if (qrychama_configuracaoOb_Cliente_Cidade.AsInteger = 0) then
      FrmConfiguracao_Sistema.CBCliente_Cidade.Checked:= true
    else
      FrmConfiguracao_Sistema.CBCliente_Cidade.Checked:= false;

    if (qrychama_configuracaoOb_Cliente_Data_Nascimento.AsInteger = 0) then
      FrmConfiguracao_Sistema.CBCliente_Data_Nascimento.Checked:= true
    else
      FrmConfiguracao_Sistema.CBCliente_Data_Nascimento.Checked:= false;

    if (qrychama_configuracaoOb_Cliente_Telefone.AsInteger = 0) then
      FrmConfiguracao_Sistema.CBCliente_Telefone.Checked:= true
    else
      FrmConfiguracao_Sistema.CBCliente_Telefone.Checked:= false;

    if (qrychama_configuracaoBloqueia_Cliente.AsString = 'SIM') then
      FrmConfiguracao_Sistema.CBBloqueia_Cliente.Checked:= true
    else
      FrmConfiguracao_Sistema.CBBloqueia_Cliente.Checked:= false;

    if (qrychama_configuracaoDesbloqueia_Cliente.AsString = 'SIM') then
      FrmConfiguracao_Sistema.CBDesbloqueia_Cliente.Checked:= true
    else
      FrmConfiguracao_Sistema.CBDesbloqueia_Cliente.Checked:= false;

    FrmConfiguracao_Sistema.EdtCaminho_PDF_Pedido.Text:= qrychama_configuracaoCaminho_PDF_Pedido.AsString;
    FrmConfiguracao_Sistema.RGImpressao_Pedido.ItemIndex:= qrychama_configuracaoTipo_Impressao_Pedido.AsInteger;
    FrmConfiguracao_Sistema.RGUsar_Comissao.ItemIndex:= qrychama_configuracaoUsar_Comissao.AsInteger;
    FrmConfiguracao_Sistema.RGTamanho_Impressao.ItemIndex:= qrychama_configuracaoTamanho_Impressao.AsInteger;
    FrmConfiguracao_Sistema.EdtQtde_Copias.Text:= qrychama_configuracaoQtde_Copias.AsString;
    FrmConfiguracao_Sistema.EdtCaminho_PDF_Carne.Text:= qrychama_configuracaoCaminho_PDF_Carne.AsString;
    FrmConfiguracao_Sistema.MmoObservacoes_Carne.Text:= qrychama_configuracaoObservacoes_Carne.AsString;
    FrmConfiguracao_Sistema.RGTipo_Dias.ItemIndex:= qrychama_configuracaoTipo_Dias.AsInteger;
    FrmConfiguracao_Sistema.RGTipo_OS.ItemIndex:= qrychama_configuracaoTipo_OS.AsInteger;

    if (qrychama_configuracaoGera_Pre_Venda.AsString = '0101') then
      FrmConfiguracao_Sistema.cbPre_Venda.Checked:= true
    else
      FrmConfiguracao_Sistema.cbPre_Venda.Checked:= false;

    if (qrychama_configuracaoGera_OS.AsString = '0101') then
    begin
      FrmConfiguracao_Sistema.cbOS.Checked:= true;
      FrmConfiguracao_Sistema.RGTipo_OS.Enabled:= true;
    end
    else
    begin
      FrmConfiguracao_Sistema.cbOS.Checked:= false;
      FrmConfiguracao_Sistema.RGTipo_OS.Enabled:= false;
    end;

    if (qrychama_configuracaoGera_DAV.AsString = '0101') then
      FrmConfiguracao_Sistema.cbDAV.Checked:= true
    else
      FrmConfiguracao_Sistema.cbDAV.Checked:= false;

    if (qrychama_configuracaoGera_NFE.AsString = '0101') then
      FrmConfiguracao_Sistema.cbNFe.Checked:= true
    else
      FrmConfiguracao_Sistema.cbNFe.Checked:= false;

    if (qrychama_configuracaoGera_Cupom_Fiscal.AsString = '0101') then
      FrmConfiguracao_Sistema.cbCupomFiscal.Checked:= true
    else
      FrmConfiguracao_Sistema.cbCupomFiscal.Checked:= false;

    FrmConfiguracao_Sistema.edtQuantidade_Maquinas.Text:= qrychama_configuracaoQtde_Maq.AsString;

    FrmConfiguracao_Sistema.CBModelo_Etiqueta.ItemIndex:= qrychama_configuracaoModelo_Etiqueta.AsInteger;
    FrmConfiguracao_Sistema.CBDPI_Impressora_Etiqueta.ItemIndex:= qrychama_configuracaoDPI_Impressora_Etiqueta.AsInteger;
    FrmConfiguracao_Sistema.EdtAvanco_Etiqueta.Text:= qrychama_configuracaoAvanco_Impressora_Etiqueta.AsString;
    FrmConfiguracao_Sistema.EdtPorta_Impressora_Etiqueta.Text:= qrychama_configuracaoPorta_Impressora_Etiqueta.AsString;
    FrmConfiguracao_Sistema.EdtTemperatura_Impressora_Etiqueta.Text:= qrychama_configuracaoTemperatura_Impressora_Etiqueta.AsString;

    if (qrychama_configuracaoLimpar_Memoria_Impressora_Etiqueta.AsInteger = 0) then
      FrmConfiguracao_Sistema.CBLimpar_Memoria.Checked:= True
    else
      FrmConfiguracao_Sistema.CBLimpar_Memoria.Checked:= false;

//    FrmConfiguracao_Sistema.CBOrientacao.ItemIndex:= qrychama_configuracaoOrientacao_Impressao_Texto_Etiqueta.AsInteger;

//    FrmConfiguracao_Sistema.EdtMultiplicador_H_Campo_1.Text:= qrychama_configuracaoMultiplicador_H_Texto_Etiqueta_Campo_1.AsString;
//    FrmConfiguracao_Sistema.EdtMultiplicador_V_Campo_1.Text:= qrychama_configuracaoMultiplicador_V_Texto_Etiqueta_Campo_1.AsString;
//    FrmConfiguracao_Sistema.EdtVertical_Texto_Campo_1.Text:= qrychama_configuracaoVertical_Texto_Etiqueta_Campo_1.AsString;
//    FrmConfiguracao_Sistema.EdtHorizontal_Texto_Campo_1.Text:= qrychama_configuracaoHorizontal_Texto_Etiqueta_Campo_1.AsString;
//    FrmConfiguracao_Sistema.EdtTamanho_Fonte_Etiqueta_Campo_1.Text:= qrychama_configuracaoTamanho_Fonte_Texto_Etiqueta_Campo_1.AsString;

//    FrmConfiguracao_Sistema.EdtMultiplicador_H_Campo_2.Text:= qrychama_configuracaoMultiplicador_H_Texto_Etiqueta_Campo_2.AsString;
//    FrmConfiguracao_Sistema.EdtMultiplicador_V_Campo_2.Text:= qrychama_configuracaoMultiplicador_V_Texto_Etiqueta_Campo_2.AsString;
//    FrmConfiguracao_Sistema.EdtVertical_Texto_Campo_2.Text:= qrychama_configuracaoVertical_Texto_Etiqueta_Campo_2.AsString;
//    FrmConfiguracao_Sistema.EdtHorizontal_Texto_Campo_2.Text:= qrychama_configuracaoHorizontal_Texto_Etiqueta_Campo_2.AsString;
//    FrmConfiguracao_Sistema.EdtTamanho_Fonte_Etiqueta_Campo_2.Text:= qrychama_configuracaoTamanho_Fonte_Texto_Etiqueta_Campo_2.AsString;
//    FrmConfiguracao_Sistema.EdtTipo_Barra.Text:= qrychama_configuracaoTipo_Barra_Etiqueta.AsString;
//    FrmConfiguracao_Sistema.EdtLargura_Barra_Larga.Text:= qrychama_configuracaoLargura_Barra_Larga.AsString;
//    FrmConfiguracao_Sistema.EdtLargura_Barra_Fina.Text:= qrychama_configuracaoLargura_Barra_Fina.AsString;
//    FrmConfiguracao_Sistema.EdtHorizontal_Barra.Text:= qrychama_configuracaoHorizontal_Barra_Etiqueta.AsString;
//    FrmConfiguracao_Sistema.EdtVertical_Barra.Text:= qrychama_configuracaoVertical_Barra_Etiqueta.AsString;
//    FrmConfiguracao_Sistema.EdtAltura_Codigo.Text:= qrychama_configuracaoAltura_Barra.AsString;
//
//    FrmConfiguracao_Sistema.EdtMultiplicador_H_Campo_3.Text:= qrychama_configuracaoMultiplicador_H_Texto_Etiqueta_Campo_3.AsString;
//    FrmConfiguracao_Sistema.EdtMultiplicador_V_Campo_3.Text:= qrychama_configuracaoMultiplicador_V_Texto_Etiqueta_Campo_3.AsString;
//    FrmConfiguracao_Sistema.EdtVertical_Texto_Campo_3.Text:= qrychama_configuracaoVertical_Texto_Etiqueta_Campo_3.AsString;
//    FrmConfiguracao_Sistema.EdtHorizontal_Texto_Campo_3.Text:= qrychama_configuracaoHorizontal_Texto_Etiqueta_Campo_3.AsString;
//    FrmConfiguracao_Sistema.EdtTamanho_Fonte_Etiqueta_Campo_3.Text:= qrychama_configuracaoTamanho_Fonte_Texto_Etiqueta_Campo_3.AsString;
//
//    FrmConfiguracao_Sistema.EdtMultiplicador_H_Campo_4.Text:= qrychama_configuracaoMultiplicador_H_Texto_Etiqueta_Campo_4.AsString;
//    FrmConfiguracao_Sistema.EdtMultiplicador_V_Campo_4.Text:= qrychama_configuracaoMultiplicador_V_Texto_Etiqueta_Campo_4.AsString;
//    FrmConfiguracao_Sistema.EdtVertical_Texto_Campo_4.Text:= qrychama_configuracaoVertical_Texto_Etiqueta_Campo_4.AsString;
//    FrmConfiguracao_Sistema.EdtHorizontal_Texto_Campo_4.Text:= qrychama_configuracaoHorizontal_Texto_Etiqueta_Campo_4.AsString;
//    FrmConfiguracao_Sistema.EdtTamanho_Fonte_Etiqueta_Campo_4.Text:= qrychama_configuracaoTamanho_Fonte_Texto_Etiqueta_Campo_4.AsString;
//
//    FrmConfiguracao_Sistema.EdtMultiplicador_H_Campo_5.Text:= qrychama_configuracaoMultiplicador_H_Texto_Etiqueta_Campo_5.AsString;
//    FrmConfiguracao_Sistema.EdtMultiplicador_V_Campo_5.Text:= qrychama_configuracaoMultiplicador_V_Texto_Etiqueta_Campo_5.AsString;
//    FrmConfiguracao_Sistema.EdtVertical_Texto_Campo_5.Text:= qrychama_configuracaoVertical_Texto_Etiqueta_Campo_5.AsString;
//    FrmConfiguracao_Sistema.EdtHorizontal_Texto_Campo_5.Text:= qrychama_configuracaoHorizontal_Texto_Etiqueta_Campo_5.AsString;
//    FrmConfiguracao_Sistema.EdtTamanho_Fonte_Etiqueta_Campo_5.Text:= qrychama_configuracaoTamanho_Fonte_Texto_Etiqueta_Campo_5.AsString;
//
//    FrmConfiguracao_Sistema.EdtDistancia_Horizontal.Text:= qrychama_configuracaoDistancia_Horizontal_Etiqueta.AsString;
//    FrmConfiguracao_Sistema.EdtDistancia_Vertical.Text:= qrychama_configuracaoDistancia_Vertical_Etiqueta.AsString;

    if (qrychama_configuracaoOpcao_Servico_Padrao.AsInteger = 0) then
      FrmConfiguracao_Sistema.CBOpcao_Servico_Marcada.Checked:= true
    else
      FrmConfiguracao_Sistema.CBOpcao_Servico_Marcada.Checked:= false;

    if (qrychama_configuracaoControla_Credito_Cliente.AsInteger = 0) then
      FrmConfiguracao_Sistema.CBControla_Credito.Checked:= true
    else
      FrmConfiguracao_Sistema.CBControla_Credito.Checked:= false;

    FrmConfiguracao_Sistema.RGBusca_Parametros_Calcular_Preco.ItemIndex:= qrychama_configuracaoBusca_Parametro_Calculo_Preco.AsInteger;

    if (qrychama_configuracaoGera_Codigo_EAN_Valido.AsInteger = 0) then
      FrmConfiguracao_Sistema.CBGera_Codigo_EAN.Checked:= true
    else
      FrmConfiguracao_Sistema.CBGera_Codigo_EAN.Checked:= false;

    FrmConfiguracao_Sistema.EdtCodigo_CFOP.Text:= qrychama_configuracaoCodigo_CFOP_Padrao.AsString;
    FrmConfiguracao_Sistema.EdtCFOP.Text:= qrychama_configuracaoCFOP.AsString;

    if (qrychama_configuracaoTrazer_Somente_Cond_Pag_ECF.AsInteger = 0) then
      FrmConfiguracao_Sistema.CBTrazer_Cond_Pag_ECF.Checked:= true
    else
      FrmConfiguracao_Sistema.CBTrazer_Cond_Pag_ECF.Checked:= false;

    {FrmConfiguracao_Sistema.cmbBalanca.ItemIndex:= qrychama_configuracaoBalanca_Modelo.AsInteger;
    FrmConfiguracao_Sistema.EdtPorta_Balanca.Text:= qrychama_configuracaoBalanca_Porta.AsString;
    FrmConfiguracao_Sistema.cmbBaudRate.Text:= qrychama_configuracaoBalanca_BaudRate.AsString;
    FrmConfiguracao_Sistema.cmbDataBits.Text:= qrychama_configuracaoBalanca_DataBits.AsString;
    FrmConfiguracao_Sistema.cmbParity.ItemIndex:= qrychama_configuracaoBalanca_Parity.AsInteger;
    FrmConfiguracao_Sistema.cmbStopBits.ItemIndex:= qrychama_configuracaoBalanca_StopBits.AsInteger;
    FrmConfiguracao_Sistema.cmbHandShaking.ItemIndex:= qrychama_configuracaoBalanca_Hand.AsInteger;
    FrmConfiguracao_Sistema.EdtTimeOut_Balanca.Text:= qrychama_configuracaoBalanca_TimeOut.AsString;}

    Consulta.Chama_Configuracao_ECF;
    {while not (qryECF.Eof) do
    begin
      oConfigECF.Codigo:= qryECFCodigo.AsInteger;
      oConfigECF.CodigoEmpresa:= qryECFCodigo_Empresa.AsInteger;
      oConfigECF.NFabricacao:= qryECFN_Fabricacao.AsString;
      oConfigECF.GT:= qryECFGT.AsFloat;
      oConfigECF.Porta:= qryECFPorta.AsString;
      oConfigECF.Marca:= qryECFMarca.AsString;
      oConfigECF.CIECF:= qryECFCIECF.AsString;
      oConfigECF.MD5:= qryECFMD5.AsString;
      oConfigECF.DataAtivacao:= qryECFData_Ativacao.AsDateTime;
      oConfigECFLista.Add(oConfigECF);
    end;}

    FrmChama_Configuracao.Close;
    FrmConfiguracao_Sistema.BBtnSalvar.Enabled:= true;
    FrmConfiguracao_Sistema.BBtnExcluir.Enabled:= true;
    FrmConfiguracao_Sistema.BBtnPesquisar.Enabled:= true;
    FrmConfiguracao_Sistema.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmConfiguracao_Sistema);
    FrmConfiguracao_Sistema.achei:= true;
    FrmConfiguracao_Sistema.Inicia_Page;
  end;
end;

procedure TFrmChama_Configuracao.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Configuracao.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Configuracao.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    BBtnFiltrarClick(self);
end;

procedure TFrmChama_Configuracao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Configuracao.Release;
end;

procedure TFrmChama_Configuracao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Configuracao.Pega_WebService;
begin
  {FrmConfiguracao_Sistema.EdtWebService_UF_1_Homologacao.Text:= qrychama_webservice_1_homologacaoWebService_UF.AsString;
  FrmConfiguracao_Sistema.EdtRecepcao_1_Homologacao.Text:= qrychama_webservice_1_homologacaoRecepcao.AsString;
  FrmConfiguracao_Sistema.EdtRetorno_1_Homologacao.Text:= qrychama_webservice_1_homologacaoRetorno.AsString;
  FrmConfiguracao_Sistema.EdtStatus_1_Homologacao.Text:= qrychama_webservice_1_homologacaoStatus.AsString;
  FrmConfiguracao_Sistema.EdtCancelamento_1_Homologacao.Text:= qrychama_webservice_1_homologacaoCancelamento.AsString;
  FrmConfiguracao_Sistema.EdtInutilizacao_1_Homologacao.Text:= qrychama_webservice_1_homologacaoInutilizacao.AsString;
  FrmConfiguracao_Sistema.EdtConsulta_1_Homologacao.Text:= qrychama_webservice_1_homologacaoConsulta.AsString;
  FrmConfiguracao_Sistema.EdtConsulta_Cadastro_1_Homologacao.Text:= qrychama_webservice_1_homologacaoConsulta_Cadastro.AsString;

  FrmConfiguracao_Sistema.EdtWebService_UF_1_Producao.Text:= qrychama_webservice_1_producaoWebService_UF.AsString;
  FrmConfiguracao_Sistema.EdtRecepcao_1_Producao.Text:= qrychama_webservice_1_producaoRecepcao.AsString;
  FrmConfiguracao_Sistema.EdtRetorno_1_Producao.Text:= qrychama_webservice_1_producaoRetorno.AsString;
  FrmConfiguracao_Sistema.EdtStatus_1_Producao.Text:= qrychama_webservice_1_producaoStatus.AsString;
  FrmConfiguracao_Sistema.EdtCancelamento_1_Producao.Text:= qrychama_webservice_1_producaoCancelamento.AsString;
  FrmConfiguracao_Sistema.EdtInutilizacao_1_Producao.Text:= qrychama_webservice_1_producaoInutilizacao.AsString;
  FrmConfiguracao_Sistema.EdtConsulta_1_Producao.Text:= qrychama_webservice_1_producaoConsulta.AsString;
  FrmConfiguracao_Sistema.EdtConsulta_Cadastro_1_Producao.Text:= qrychama_webservice_1_producaoConsulta_Cadastro.AsString;

  FrmConfiguracao_Sistema.EdtWebService_UF_2_Homologacao.Text:= qrychama_webservice_2_homologacaoWebService_UF.AsString;
  FrmConfiguracao_Sistema.EdtRecepcao_2_Homologacao.Text:= qrychama_webservice_2_homologacaoRecepcao.AsString;
  FrmConfiguracao_Sistema.EdtRetorno_2_Homologacao.Text:= qrychama_webservice_2_homologacaoRetorno.AsString;
  FrmConfiguracao_Sistema.EdtStatus_2_Homologacao.Text:= qrychama_webservice_2_homologacaoStatus.AsString;
  FrmConfiguracao_Sistema.EdtCancelamento_2_Homologacao.Text:= qrychama_webservice_2_homologacaoCancelamento.AsString;
  FrmConfiguracao_Sistema.EdtInutilizacao_2_Homologacao.Text:= qrychama_webservice_2_homologacaoInutilizacao.AsString;
  FrmConfiguracao_Sistema.EdtConsulta_2_Homologacao.Text:= qrychama_webservice_2_homologacaoConsulta.AsString;
  FrmConfiguracao_Sistema.EdtConsulta_Cadastro_2_Homologacao.Text:= qrychama_webservice_2_homologacaoConsulta_Cadastro.AsString;

  FrmConfiguracao_Sistema.EdtWebService_UF_2_Producao.Text:= qrychama_webservice_2_producaoWebService_UF.AsString;
  FrmConfiguracao_Sistema.EdtRecepcao_2_Producao.Text:= qrychama_webservice_2_producaoRecepcao.AsString;
  FrmConfiguracao_Sistema.EdtRetorno_2_Producao.Text:= qrychama_webservice_2_producaoRetorno.AsString;
  FrmConfiguracao_Sistema.EdtStatus_2_Producao.Text:= qrychama_webservice_2_producaoStatus.AsString;
  FrmConfiguracao_Sistema.EdtCancelamento_2_Producao.Text:= qrychama_webservice_2_producaoCancelamento.AsString;
  FrmConfiguracao_Sistema.EdtInutilizacao_2_Producao.Text:= qrychama_webservice_2_producaoInutilizacao.AsString;
  FrmConfiguracao_Sistema.EdtConsulta_2_Producao.Text:= qrychama_webservice_2_producaoConsulta.AsString;
  FrmConfiguracao_Sistema.EdtConsulta_Cadastro_2_Producao.Text:= qrychama_webservice_2_producaoConsulta_Cadastro.AsString;}

end;

end.
