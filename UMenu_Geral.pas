unit UMenu_Geral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Menus, ActnList, ComCtrls, URegistro,
  ADODB, ImgList, ToolWin, ActnMan, ActnCtrls, Ribbon, RibbonLunaStyleActnCtrls,
  PlatformDefaultStyleActnCtrls, ActnMenus, RibbonActnMenus,
  RibbonObsidianStyleActnCtrls, RibbonSilverStyleActnCtrls, DB, DBClient, DateUtils,
  Provider, Grids, DBGrids, RSPrint, Math, IdBaseComponent, IdComponent,
  IdRawBase, IdRawClient, IdIcmpClient, Gauges, ShellAPI, TLoggerUnit, cxLocalization,
  Vcl.Buttons, cxClasses;

type

  TFrmMenu_Geral = class(TForm)
    StbStatus: TStatusBar;
    Timer1: TTimer;
    ActionManager1: TActionManager;
    acCadastro_Empresa: TAction;
    ImageList1: TImageList;
    acCadastro_Produtos: TAction;
    acCadastro_Grupo_Produto: TAction;
    acCadastro_Marca: TAction;
    acCadastro_Unidade_Medida: TAction;
    acCadastro_Fornecedor: TAction;
    acCadastro_Local_Produto: TAction;
    acCadastro_Cliente: TAction;
    acCadastro_Grupo_Cliente: TAction;
    acCadastro_Funcionario: TAction;
    acCadastro_Cargo: TAction;
    acCadastro_Departamento: TAction;
    acFinanceiro: TAction;
    acCadastro_Tipo_Documento: TAction;
    acCadastro_Plano_Financeiro: TAction;
    acCadastro_Caixa: TAction;
    acCadastro_Banco: TAction;
    acCadastro_Conta_Corrente: TAction;
    acCadastro_Operacao_Bancaria: TAction;
    acCadastro_Condicao_Pagamento: TAction;
    acCadastro_Cheque: TAction;
    acCadastro_Itens_Folha_Pagamento: TAction;
    acGeral: TAction;
    acCadastro_Cidade: TAction;
    acCadastro_Setor: TAction;
    acCadastro_Logradouro: TAction;
    acCompra: TAction;
    acEntrada_Produtos: TAction;
    acPDV: TAction;
    acAlterar_Simbolo_Moeda: TAction;
    acHorario_Verao: TAction;
    acAdicao_Aliquota_Tributaria: TAction;
    acPrograma_Arredondamento: TAction;
    acPrograma_Truncamento: TAction;
    acLeitura_X: TAction;
    acReducao_Z: TAction;
    acRegistros_ECF: TAction;
    acSuprimento: TAction;
    acSangria: TAction;
    acIdentificacao_PAF_ECF: TAction;
    acTabela_Produtos: TAction;
    acParametros_Configuracao: TAction;
    acMovimento_ECF: TAction;
    acVendas_Periodo: TAction;
    acLancamento_Financeiro: TAction;
    acBaixar_Titulos: TAction;
    acLancamento_Bancario: TAction;
    acConciliacao_Bancaria: TAction;
    acCadastro_Cheque2: TAction;
    acBaixar_Cheque: TAction;
    acFolha_Pagamento: TAction;
    acContas_Fixas: TAction;
    acContas: TAction;
    acConsulta_Cheque: TAction;
    acConsulta_Lancamento_Bancario: TAction;
    acConsulta_Saldo_Bancario: TAction;
    acSair: TAction;
    acVenda_Orcamento: TAction;
    acAcompanhamento_Venda_Orcamento: TAction;
    acGera_Ordem_Entrega: TAction;
    acSugestao_Compra: TAction;
    acRecebimento_Caixa: TAction;
    acConciliacao_Produtos: TAction;
    acConfiguracao_Sistema: TAction;
    acCadastro_NCM: TAction;
    acCadastro_CFOP: TAction;
    acCadastro_Situacao_Tributaria: TAction;
    acCadastro_Pais: TAction;
    acLancamento_Manual: TAction;
    acCadastro_Veiculo: TAction;
    acFechamento_Estoque: TAction;
    BBtnReconectar: TButton;
    SaveDialog1: TSaveDialog;
    acAbertura_Caixa: TAction;
    ImgImagem: TImage;
    Ribbon1: TRibbon;
    RPMenu_Geral: TRibbonPage;
    RPCadastro: TRibbonPage;
    RibbonGroup5: TRibbonGroup;
    RibbonGroup6: TRibbonGroup;
    RibbonGroup7: TRibbonGroup;
    RibbonGroup8: TRibbonGroup;
    RibbonGroup9: TRibbonGroup;
    RibbonGroup10: TRibbonGroup;
    RibbonGroup11: TRibbonGroup;
    RibbonGroup12: TRibbonGroup;
    RPMovimentacao: TRibbonPage;
    RibbonGroup14: TRibbonGroup;
    RibbonGroup15: TRibbonGroup;
    RPFinanceiro: TRibbonPage;
    RibbonGroup16: TRibbonGroup;
    RibbonGroup17: TRibbonGroup;
    RibbonGroup18: TRibbonGroup;
    RPRelatorio: TRibbonPage;
    RPFuncao_PAF_ECF: TRibbonPage;
    RibbonGroup1: TRibbonGroup;
    RibbonGroup2: TRibbonGroup;
    RibbonGroup4: TRibbonGroup;
    acNFE: TAction;
    acConsulta_Custo_Empresa: TAction;
    RibbonGroup21: TRibbonGroup;
    acConsulta_Lancamentos_Financeiros: TAction;
    acConsulta_Folha_Pagamento: TAction;
    acConsulta_Compra: TAction;
    acConsulta_Entrada: TAction;
    acCadastro_Transportadora: TAction;
    RPCaixa: TRibbonPage;
    RibbonGroup20: TRibbonGroup;
    RibbonGroup3: TRibbonGroup;
    acConsulta_Ordem_Servico: TAction;
    acReimpressao_DAV: TAction;
    acRegra_ICMS: TAction;
    acTratamento_ICMS: TAction;
    acCadastro_Observacao_Fiscal: TAction;
    acICMS: TAction;
    acPIS: TAction;
    acRegra_PIS: TAction;
    acTratamento_PIS: TAction;
    acCOFINS: TAction;
    acRegra_COFINS: TAction;
    acTratamento_COFINS: TAction;
    acIPI: TAction;
    acRegra_IPI: TAction;
    acTratamento_IPI: TAction;
    acISSQN: TAction;
    acRegra_ISSQN: TAction;
    RibbonPage1: TRibbonPage;
    RibbonGroup23: TRibbonGroup;
    acCadastro_Usuario: TAction;
    acFechamento_Caixa: TAction;
    RibbonGroup25: TRibbonGroup;
    acConsulta_Acerto_Caixa: TAction;
    acCadastro_Tabela_Preco: TAction;
    acTabela_Preco: TAction;
    acConsulta_Preco_Anterior: TAction;
    acConsulta_PreVenda_DAV: TAction;
    acConsulta_Compras_Pendentes: TAction;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    ADOQuery1: TADOQuery;
    RibbonGroup27: TRibbonGroup;
    acConsulta_Produtos: TAction;
    acConsulta_Grupo_Tributacao: TAction;
    DataSource1: TDataSource;
    acCotacao_Preco_Produto: TAction;
    acConsulta_Cotacao_Preco_Produto: TAction;
    acRetorno_Cotacao: TAction;
    RibbonGroup29: TRibbonGroup;
    acConsulta_Retorno_Cotacao: TAction;
    acConsulta_Recompor_Estoque: TAction;
    acConsulta_Comparativo_Preco_Cotacao: TAction;
    acConsulta_Curva_ABC_Produto: TAction;
    acConsulta_Posicao_Estoque: TAction;
    acLeitura_Memoria_Fiscal_Simples: TAction;
    acArquivo_MFD: TAction;
    acConsulta_Historico_Log: TAction;
    Timer2: TTimer;
    acFabricacao_Propria: TAction;
    acTabela_Indice_Tecnico_Producao: TAction;
    acCadastro_Receita: TAction;
    acConsulta_Saldo_Estoque: TAction;
    IMGPequeno: TImageList;
    RibbonApplicationMenuBar1: TRibbonApplicationMenuBar;
    acConsulta_Comparativo_Custo_Venda: TAction;
    RibbonGroup13: TRibbonGroup;
    acCadastro_Perfil_Usuario: TAction;
    acRevalidar_Sistema: TAction;
    acAcerto_Caixa: TAction;
    acAltera_Caixa: TAction;
    acConsulta_Fechamento_Caixa: TAction;
    PopupMenu1: TPopupMenu;
    Produtos1: TMenuItem;
    acChama_Produto: TAction;
    RibbonGroup24: TRibbonGroup;
    acConsulta_Lucro_Produto: TAction;
    acConsulta_Lucro_Grupo: TAction;
    acConsulta_Lucro_Marca: TAction;
    acMapa_Resumo: TAction;
    acConsulta_Preco: TAction;
    acChama_Cliente: TAction;
    Clientes1: TMenuItem;
    acCadastro_Etiqueta: TAction;
    acGera_Etiqueta_Produto: TAction;
    acGera_Etiqueta_Cliente: TAction;
    Timer3: TTimer;
    Timer4: TTimer;
    acConsulta_Comissao: TAction;
    acInventario_Estoque: TAction;
    acEnvia_SMS: TAction;
    ADOQuery2: TADOQuery;
    ADOQueryP: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    ADOQuery4Desconto: TFloatField;
    ADOQuery2Data_Movimento: TDateTimeField;
    ADOQuery2Totalizador_Parcial: TStringField;
    ADOQuery2valor_venda: TFloatField;
    ADOQuery3Data_Movimento: TDateTimeField;
    ADOQuery3Totalizador_Parcial: TStringField;
    ADOQuery3valor_venda: TFloatField;
    ADOQuery3iss: TFloatField;
    ADOQuery3DT: TFloatField;
    ADOQuery3DS: TFloatField;
    ADOQueryPDatamov: TDateTimeField;
    ADOQueryPCaixa: TStringField;
    ADOQueryPCRZ: TStringField;
    ADOQueryPCOO: TStringField;
    ADOQuery3venda_bruta: TFloatField;
    ADOQuery3Cant: TFloatField;
    ADOQuery3Cans: TFloatField;
    acNFe_ADM: TAction;
    acPedido_Venda_Extra: TAction;
    acAgenda_Telefonica: TAction;
    acContagem_Estoque: TAction;
    acAlteracao_Produto: TAction;
    N1: TMenuItem;
    OcultaExibeMenu1: TMenuItem;
    N2: TMenuItem;
    CupomFiscal1: TMenuItem;
    acConfigura_FTP: TAction;
    Image1: TImage;
    acConsulta_Historico_Movimentacao: TAction;
    acCadastro_Status: TAction;
    acCadastro_Tipo_Ocorrencia: TAction;
    acRegistro_Ocorrencia: TAction;
    acConsulta_Ocorrencia: TAction;
    acCadastro_Tipo_Bem_Patrimonial: TAction;
    RibbonGroup22: TRibbonGroup;
    acCadastro_Patrimonio: TAction;
    acPatrimonio: TAction;
    RibbonGroup26: TRibbonGroup;
    acConsulta_Patrimonio: TAction;
    acConsulta_Ficha_Funcionario: TAction;
    acConsulta_Ficha_Cliente: TAction;
    Action1: TAction;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBGrid1: TDBGrid;
    ds_teste: TDataSource;
    cxLocalizer1: TcxLocalizer;
    acLancamento_Caixa: TAction;
    acConsulta_Extrato_Caixa: TAction;
    acOcorrencia_Cobranca: TAction;
    acArq_MF: TAction;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;


    LblLocalGravacao: TLabel;
    Timer5: TTimer;
    btnAtualizador: TBitBtn;
    actAtualiza: TAction;
    rs: TRSPrinter;


    procedure Timer1Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure acSairExecute(Sender: TObject);
    procedure acLogradouroExecute(Sender: TObject);
    procedure acUnidade_MedidaExecute(Sender: TObject);
    procedure acCidadeExecute(Sender: TObject);
    procedure acSetorExecute(Sender: TObject);
    procedure acCargoExecute(Sender: TObject);
    procedure acDepartamentoExecute(Sender: TObject);
    procedure acGrupo_ClienteExecute(Sender: TObject);
    procedure acClienteExecute(Sender: TObject);
    procedure acFuncionarioExecute(Sender: TObject);
    procedure acFornecedorExecute(Sender: TObject);
    procedure acGrupo_ProdutoExecute(Sender: TObject);
    procedure acMarcaExecute(Sender: TObject);
    procedure acProdutoExecute(Sender: TObject);
    procedure acTipo_DocumentoExecute(Sender: TObject);
    procedure acCondicao_PagamentoExecute(Sender: TObject);
    procedure acPlano_FinanceiroExecute(Sender: TObject);
    procedure acEmpresaExecute(Sender: TObject);
    procedure ac123Execute(Sender: TObject);
    procedure acCaixaExecute(Sender: TObject);
    procedure acBancoExecute(Sender: TObject);
    procedure acOperacao_BancariaExecute(Sender: TObject);
    procedure acConta_CorrenteExecute(Sender: TObject);
    procedure acItens_Folha_PagamentoExecute(Sender: TObject);
    procedure acChequeExecute(Sender: TObject);
    procedure acLocal_ProdutoExecute(Sender: TObject);
    procedure ac3Execute(Sender: TObject);
    procedure ac4Execute(Sender: TObject);
    procedure ac5Execute(Sender: TObject);
    procedure acECFExecute(Sender: TObject);
    procedure acReducao_ZExecute(Sender: TObject);
    procedure acSuprimentoExecute(Sender: TObject);
    procedure acSangriaExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Atualiza_EXE;
    procedure acCadastro_Grupo_ProdutoExecute(Sender: TObject);
    procedure acCadastro_ProdutosExecute(Sender: TObject);
    procedure acCadastro_FornecedorExecute(Sender: TObject);
    procedure acCadastro_Unidade_MedidaExecute(Sender: TObject);
    procedure acCadastro_MarcaExecute(Sender: TObject);
    procedure acCadastro_Local_ProdutoExecute(Sender: TObject);
    procedure acCadastro_EmpresaExecute(Sender: TObject);
    procedure acCadastro_ClienteExecute(Sender: TObject);
    procedure acCadastro_Grupo_ClienteExecute(Sender: TObject);
    procedure acCadastro_FuncionarioExecute(Sender: TObject);
    procedure acCadastro_CargoExecute(Sender: TObject);
    procedure acCadastro_DepartamentoExecute(Sender: TObject);
    procedure acCadastro_Tipo_DocumentoExecute(Sender: TObject);
    procedure acCadastro_Plano_FinanceiroExecute(Sender: TObject);
    procedure acCadastro_CaixaExecute(Sender: TObject);
    procedure acCadastro_BancoExecute(Sender: TObject);
    procedure acCadastro_Conta_CorrenteExecute(Sender: TObject);
    procedure acCadastro_Operacao_BancariaExecute(Sender: TObject);
    procedure acCadastro_Condicao_PagamentoExecute(Sender: TObject);
    procedure acCadastro_ChequeExecute(Sender: TObject);
    procedure acCadastro_Itens_Folha_PagamentoExecute(Sender: TObject);
    procedure acFinanceiroExecute(Sender: TObject);
    procedure acGeralExecute(Sender: TObject);
    procedure acCadastro_CidadeExecute(Sender: TObject);
    procedure acCadastro_SetorExecute(Sender: TObject);
    procedure acCadastro_LogradouroExecute(Sender: TObject);
    procedure acPDVExecute(Sender: TObject);
    procedure acAlterar_Simbolo_MoedaExecute(Sender: TObject);
    procedure acHorario_VeraoExecute(Sender: TObject);
    procedure acAdicao_Aliquota_TributariaExecute(Sender: TObject);
    procedure acPrograma_ArredondamentoExecute(Sender: TObject);
    procedure acPrograma_TruncamentoExecute(Sender: TObject);
    procedure acLeitura_XExecute(Sender: TObject);
    procedure acLeitura_Memoria_FiscalExecute(Sender: TObject);
    procedure acRegistros_ECFExecute(Sender: TObject);
    procedure acIdentificacao_PAF_ECFExecute(Sender: TObject);
    procedure acTabela_ProdutosExecute(Sender: TObject);
    procedure acParametros_ConfiguracaoExecute(Sender: TObject);
    procedure acMovimento_ECFExecute(Sender: TObject);
    procedure acMovimentacao_SaidaExecute(Sender: TObject);
    procedure acMeio_PagamentoExecute(Sender: TObject);
    procedure acLancamento_FinanceiroExecute(Sender: TObject);
    procedure acBaixar_TitulosExecute(Sender: TObject);
    procedure acLancamento_BancarioExecute(Sender: TObject);
    procedure acConciliacao_BancariaExecute(Sender: TObject);
    procedure acCadastro_Cheque2Execute(Sender: TObject);
    procedure acBaixar_ChequeExecute(Sender: TObject);
    procedure acContasExecute(Sender: TObject);
    procedure acConsulta_ChequeExecute(Sender: TObject);
    procedure acConsulta_Lancamento_BancarioExecute(Sender: TObject);
    procedure acConsulta_Saldo_BancarioExecute(Sender: TObject);
    procedure acVenda_OrcamentoExecute(Sender: TObject);
    procedure acRecebimento_CaixaExecute(Sender: TObject);
    procedure acDAV_EmitidosExecute(Sender: TObject);
    procedure acEntrada_ProdutosExecute(Sender: TObject);
    procedure acCompraExecute(Sender: TObject);
    procedure acConciliacao_ProdutosExecute(Sender: TObject);
    procedure acGera_Ordem_EntregaExecute(Sender: TObject);
    procedure acSugestao_CompraExecute(Sender: TObject);
    procedure acConfiguracao_SistemaExecute(Sender: TObject);
    procedure acCadastro_NCMExecute(Sender: TObject);
    procedure acCadastro_CFOPExecute(Sender: TObject);
    procedure acCadastro_Situacao_TributariaExecute(Sender: TObject);
    procedure acCadastro_PaisExecute(Sender: TObject);
    procedure acLancamento_ManualExecute(Sender: TObject);
    procedure acCadastro_VeiculoExecute(Sender: TObject);
    procedure acFechamento_EstoqueExecute(Sender: TObject);
    procedure acVendas_PeriodoExecute(Sender: TObject);
    procedure Movimento_ECF;
    procedure MovimentacaoECF(NomeArquivo:AnsiString; Data: TDate);
    procedure Cria01(Data: TDate);
    procedure Cria02(Data: TDate);
    procedure Cria03(Data: TDate);
    procedure Cria04(Data: TDate);
    procedure Cria05(Data: TDate);
    procedure Cria06(Data: TDate);
    procedure Cria07(Data: TDate);
    procedure acAbertura_CaixaExecute(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure acOrdem_ServicoExecute(Sender: TObject);
    procedure acPre_VendaExecute(Sender: TObject);
    procedure acFolha_PagamentoExecute(Sender: TObject);
    procedure acContas_FixasExecute(Sender: TObject);
    procedure acConsulta_Custo_EmpresaExecute(Sender: TObject);
    procedure acConsulta_Lancamentos_FinanceirosExecute(Sender: TObject);
    procedure acConsulta_Folha_PagamentoExecute(Sender: TObject);
    procedure acConsulta_CompraExecute(Sender: TObject);
    procedure acConsulta_EntradaExecute(Sender: TObject);
    procedure acCadastro_TransportadoraExecute(Sender: TObject);
    procedure acConsulta_Ordem_ServicoExecute(Sender: TObject);
    procedure acRegra_ICMSExecute(Sender: TObject);
    procedure acTratamento_ICMSExecute(Sender: TObject);
    procedure acCadastro_Observacao_FiscalExecute(Sender: TObject);
    procedure acCadastro_Grupo_Tributacao_ProdutoExecute(Sender: TObject);
    procedure acRegra_PISExecute(Sender: TObject);
    procedure acTratamento_PISExecute(Sender: TObject);
    procedure acICMSExecute(Sender: TObject);
    procedure acCOFINSExecute(Sender: TObject);
    procedure acPISExecute(Sender: TObject);
    procedure acCadastro_Grupo_Tributacao_Produto_PISExecute(Sender: TObject);
    procedure acRegra_COFINSExecute(Sender: TObject);
    procedure acTratamento_COFINSExecute(Sender: TObject);
    procedure acCadastro_Grupo_Tributacao_COFINSExecute(Sender: TObject);
    procedure acIPIExecute(Sender: TObject);
    procedure acRegra_IPIExecute(Sender: TObject);
    procedure acTratamento_IPIExecute(Sender: TObject);
    procedure acCadastro_Grupo_Tributacao_IPIExecute(Sender: TObject);
    procedure acISSQNExecute(Sender: TObject);
    procedure acRegra_ISSQNExecute(Sender: TObject);
    procedure acCadastro_UsuarioExecute(Sender: TObject);
    procedure acFechamento_CaixaExecute(Sender: TObject);
    procedure acConsulta_Acerto_CaixaExecute(Sender: TObject);
    procedure acCadastro_Tabela_PrecoExecute(Sender: TObject);
    procedure acTabela_PrecoExecute(Sender: TObject);
    procedure acConsulta_PreVenda_DAVExecute(Sender: TObject);
    procedure acConsulta_Preco_AnteriorExecute(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure acCotacao_Preco_ProdutoExecute(Sender: TObject);
    procedure acRetorno_CotacaoExecute(Sender: TObject);
    procedure acConsulta_Cotacao_Preco_ProdutoExecute(Sender: TObject);
    procedure acConsulta_Retorno_CotacaoExecute(Sender: TObject);
    procedure acConsulta_Comparativo_Preco_CotacaoExecute(Sender: TObject);
    procedure acConsulta_Curva_ABC_ProdutoExecute(Sender: TObject);
    procedure acConsulta_Recompor_EstoqueExecute(Sender: TObject);
    procedure acConsulta_Posicao_EstoqueExecute(Sender: TObject);
    procedure acLeitura_Memoria_Fiscal_SimplesExecute(Sender: TObject);
    procedure acArquivo_MFDExecute(Sender: TObject);
    procedure acConsulta_Historico_LogExecute(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure acFabricacao_PropriaExecute(Sender: TObject);
    procedure acTabela_Indice_Tecnico_ProducaoExecute(Sender: TObject);
    procedure acCadastro_ReceitaExecute(Sender: TObject);
    procedure acConsulta_Saldo_EstoqueExecute(Sender: TObject);
    procedure acConsulta_Comparativo_Custo_VendaExecute(Sender: TObject);
    procedure acCadastro_Perfil_UsuarioExecute(Sender: TObject);
    procedure acRevalidar_SistemaExecute(Sender: TObject);
    procedure acAcerto_CaixaExecute(Sender: TObject);
    procedure acAltera_CaixaExecute(Sender: TObject);
    procedure acConsulta_Fechamento_CaixaExecute(Sender: TObject);
    procedure BBtnReconectarClick(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure acConsulta_Lucro_ProdutoExecute(Sender: TObject);
    procedure acConsulta_Lucro_GrupoExecute(Sender: TObject);
    procedure acConsulta_Lucro_MarcaExecute(Sender: TObject);
    procedure acReimpressao_DAVExecute(Sender: TObject);
    procedure acMapa_ResumoExecute(Sender: TObject);
    procedure acConsulta_PrecoExecute(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure acChama_ClienteExecute(Sender: TObject);
    procedure acCadastro_EtiquetaExecute(Sender: TObject);
    procedure acGera_Etiqueta_ProdutoExecute(Sender: TObject);
    procedure acGera_Etiqueta_ClienteExecute(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Ribbon1TabChange(Sender: TObject; const NewIndex,
      OldIndex: Integer; var AllowChange: Boolean);
    procedure Timer4Timer(Sender: TObject);
    procedure acConsulta_ComissaoExecute(Sender: TObject);
    procedure acConsulta_ProdutosExecute(Sender: TObject);
    procedure acInventario_EstoqueExecute(Sender: TObject);
    procedure acEnvia_SMSExecute(Sender: TObject);
    procedure acNFEExecute(Sender: TObject);
    procedure acNFe_ADMExecute(Sender: TObject);
    procedure acAgenda_TelefonicaExecute(Sender: TObject);
    procedure acContagem_EstoqueExecute(Sender: TObject);
    procedure acAlteracao_ProdutoExecute(Sender: TObject);
    procedure OcultaExibeMenu1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure acConfigura_FTPExecute(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure acConsulta_Historico_MovimentacaoExecute(Sender: TObject);
    procedure acCadastro_StatusExecute(Sender: TObject);
    procedure acCadastro_Tipo_OcorrenciaExecute(Sender: TObject);
    procedure acRegistro_OcorrenciaExecute(Sender: TObject);
    procedure acConsulta_OcorrenciaExecute(Sender: TObject);
    procedure acCadastro_Tipo_Bem_PatrimonialExecute(Sender: TObject);
    procedure acCadastro_PatrimonioExecute(Sender: TObject);
    procedure acPatrimonioExecute(Sender: TObject);
    procedure acConsulta_PatrimonioExecute(Sender: TObject);
    procedure acConsulta_Ficha_FuncionarioExecute(Sender: TObject);
    procedure acConsulta_Ficha_ClienteExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure acLancamento_CaixaExecute(Sender: TObject);
    procedure acConsulta_Extrato_CaixaExecute(Sender: TObject);
    procedure acOcorrencia_CobrancaExecute(Sender: TObject);

    procedure Button1Click(Sender: TObject);
    procedure acArq_MFExecute(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);

    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);

    procedure Timer5Timer(Sender: TObject);
    procedure btnAtualizadorClick(Sender: TObject);
    procedure actAtualizaExecute(Sender: TObject);

  private
    var
    cnie, caminho, caix: Ansistring;
    sArquivo: TextFile;
    iConta: integer;
    loArquivo: TextFile;
    qAux: TADOQuery;
    d, m, a, data: string;
    iaux, iaux2: integer;
    dataa: TDate;
    R02: TR02;
    R03: TR03;
    Tempo, ContaTempo: integer;

    procedure DAV_Emitidos;
    procedure Verifica_Arq_Temp;
    //procedure Cancela_Pre_Venda;
    procedure Data_Pre_Venda_Cancelada(Dias: integer);
    procedure Verifica_Rede;
    procedure Fecha_Movimento;
    { Private declarations }
  public
    produto_filtrar, produto_escolhido: AnsiString;
    iRetorno: integer;
    procedure Promissoria(Data_Vencimento, Data_Atual: TDate; Valor: Double; Cliente, CPFCNPJ, Endereco: AnsiString);
    procedure MapaResumo;
    //function ValidaGT: Boolean;
    //function ValidaSN: Boolean;
    procedure ApplicationEventsMessage(var Msg: tagMSG;var Handled: Boolean);
    { Public declarations }
  end;

var
  FrmMenu_Geral: TFrmMenu_Geral;

implementation

uses UCadastro_Logradouro, UCadastro_Unidade_Medida, UCadastro_Cidade,
  UCadastro_Setor, UCadastro_Cargo, UCadastro_Departamento,
  UCadastro_Grupo_Cliente, UCadastro_Cliente, UCadastro_Funcionarios,
  UCadastro_Grupo_Produto, UCadastro_Marca, UCadastro_Forn_Fab,
  UCadastro_Produto, UCadastro_Tipo_Documento, UCadastro_Condicao_Pagamento,
  UCadastro_Plano_Financeiro, UCadastro_Empresa, ULancamento_Financeiro,
  UChama_Lancamentos_Financeiros, UCadastro_Caixa, UCadastro_Banco,
  UCadastro_Operacao_Bancaria, UCadastro_Conta_Corrente,
  UCadastro_Itens_Folha_Pagamento, UCadastro_Cheque, UChama_Empresa_Inicial,
  UCadastro_Local_Produto, UBaixar_Cheque, ULancamento_Banco,
  UConciliacao_Bancaria, UConsulta_Cheque, UConsulta_Lancamento_Banco,
  UConsulta_Saldo_Bancario, UPDV, UAdicao_Aliquota, UAltera_Simbolo_Moeda,
  UMemoria_Fiscal_Faixa_Data_Reducao, UMemoria_Fita_Detalhe, USuprimento,
  USangria, UTabela_Produto, UMovimentacao_Saida, UEstoque_Produto,
  UIdentificacao_PAF_ECF, UDeclaracao, UMovimento_ECF, UMeios_Pagamento,
  UDM, UPedido_Venda, UCarrega_Pedido_Caixa, UDAV_Emitidos,
  UEntrada_Produtos, UCompra, UConciliacao_Compra, UGera_Ordem_Entrega,
  USugestao_Compra, UConfiguracao_Sistema, UCadastro_NCM, UCadastro_CFOP,
  UCadastro_Situacao_Tributaria, UCadastro_Pais, UMovimentacao_Manual,
  UCadastro_Veiculo, UFechamento_Inventario, UVendas_Periodo, UGeral,
  UAbertura_Caixa, MD5, UOS, UPre_Venda, UFolha_Pagamento, UConta_Fixa,
  UConsulta_Conta_Fixa, UConsulta_Lancamentos_Financeiros,
  UConsulta_Folha_Pagamento, UConsulta_Compra, UConsulta_Entrada,
  UCadastro_Transportadora, UConsulta_OS, URegra_ICMS, UTratamento_ICMS,
  UCadastro_Observacao_Fiscal, UCadastro_Grupo_Produto_Tributacao, URegra_PIS,
  UTratamento_PIS, UCadastro_Grupo_Produto_Tributacao_PIS, URegra_COFINS,
  UTratamento_COFINS, UCadastro_Grupo_Produto_Tributacao_COFINS, URegra_IPI,
  UCadastro_Grupo_Produto_Tributacao_IPI, URegra_ISSQN, UTratamento_IPI,
  UCadastro_Usuario, UFechamento_Caixa, UConsulta_Fechamento_Caixa,
  UCadastro_Tabela_Preco, UConsulta_Preco_Produto, UConsulta_Tabela_Preco,
  UConsulta_Venda, UMensagem_Sistema, UCotacao_Preco_Produto, URetorno_Cotacao,
  UConsulta_Cotacao_Preco_Produto, UConsulta_Retorno_Cotacao_Preco,
  UConsulta_Comparativo_Preco_Cotacao, UConsulta_Curva_ABC_Produto,
  UConsulta_Reposicao_Estoque, UConsulta_Posicao_Estoque,
  UMemoria_Fiscal_Faixa_Data_Reducao_Completa,
  UChama_Produto, UConsulta_Historico_Log, UFabricacao, UReceita,
  UConsulta_Saldo_Estoque, UTabela_Indice_Tecnico_Producao,
  UConsulta_Custo_Venda, UCadastro_Perfil_Usuario, URevalida_Sistema,
  UAcerto_Caixa, UAltera_Caixa, UConsulta_Acerto_Caixa,
  UConsulta_Lucratividade_Produto, UConsulta_Lucratividade_Grupo,
  UConsulta_Lucratividade_Marca, UInforma_DAV, UMapa_Resumo, UChama_Cliente,
  UCadastro_Etiqueta, UGera_Etiqueta_Produto, UGera_Etiqueta_Cliente,
  UConsulta_Comissao, UConsulta_Produto_Cadastrado, UConsulta_Inventario, USMS,
  URel_Mapa_Resumo2, UNFE, UNFE_Adm, UGera_Etiqueta_Produto_2, UAgenda_Telefonica, URel_Contagem_Estoque,
  UAlteracao_Produto, UConsulta_Contagem_Estoque, UControle_Acesso,
  UConsulta_Custo_Empresa, UBematech, UAtualizacao_Configuracao, UAjuda_Geral,
  UConsulta_Historico_Movimentacao, UCadastro_Status, UCadastro_Tipo_Ocorrencia,
  UOcorrencia, UConsulta_Ocorrencia, UChama_Tipo_Bem_Patrimonial,
  UCadastro_Tipo_Bem_Patrimonial, UCadastro_Patrimonio, UConsulta_Patrimonio,
  UConsulta_Ficha_Funcionario, UConsulta_Ficha_Cliente, URel_Carne,
  Util.Mensagens, Modelo.Dominio.TConfiguracoesECFDominio, Util.TLog,
  ACBrDevice, UGera_Etiqueta_Impressora_Etiqueta, Conexao.TPoll,
  Conexao.TTransacao, Modelo.Entidade.ComandosSQL, Modelo.Dominio.ComandosSQL,
  ULancamento_Caixa, UConsulta_Lancamento_Caixa, UCadastro_Ocorrencia_Cobranca,

  UPAFECF_Arq_MF, UPAFECF_Arq_MFD,
  UPAFECF_Parametros_Configuracao, UPAFECF_Registros_PAF, UGeraSped,
  ACBrPosPrinter;

{$R *.dfm}

procedure TFrmMenu_Geral.acAbertura_CaixaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmAbertura_Caixa);

  {if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;}

  if (UDeclaracao.codigo_caixa <> 0) then
  begin
    Mensagem_Operacao_Nao_Permitida;
    abort;
  end;

  if (dm.ACBrECF1.Estado = estBloqueada) then
  begin
    TMensagens.MensagemErro('Já houve redução Z no dia atual. ');
    abort;
  end;

  {if (tipo_local = '0101') then
  begin
    //Captura_Data_Movimento;
    ECF.Pega_Data_Movimento;
    if (dataf <> '00/00/0000') then
    begin
      UDeclaracao.Mensagem_Erro;
      abort;
    end;
  end;}

  //if (Habilitado) then
  //begin
    Application.CreateForm(TFrmAbertura_Caixa, FrmAbertura_Caixa);
    FrmAbertura_Caixa.Show;
    Centraliza_Form(FrmAbertura_Caixa);
  //end
  //else
    //UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acAcerto_CaixaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmAcerto_Caixa);

  if (UDeclaracao.codigo_caixa = 0) then
  begin
    Mensagem_Operacao_Nao_Permitida;
    abort;
  end;

  if (tipo_local = '0101') then
  begin
    ECF.Pega_Data_Movimento;
    if (dataf = '00/00/0000') then
    begin
      UDeclaracao.Mensagem_Erro;
      abort;
    end;
  end;

  Application.CreateForm(TFrmAcerto_Caixa, FrmAcerto_Caixa);
  FrmAcerto_Caixa.Show;
  Centraliza_Form(FrmAcerto_Caixa);
end;

procedure TFrmMenu_Geral.acAdicao_Aliquota_TributariaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmAdicao_Aliquota);
  if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;

  //Captura_Data_Movimento;
  ECF.Pega_Data_Movimento;
  if (dataf = '00/00/0000') then
  begin
    Application.CreateForm(TFrmAdicao_Aliquota, FrmAdicao_Aliquota);
    FrmAdicao_Aliquota.Show;
    Centraliza_Form(FrmAdicao_Aliquota);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acAgenda_TelefonicaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmAgenda_Telefonica);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmAgenda_Telefonica, FrmAgenda_Telefonica);
    FrmAgenda_Telefonica.Show;
    Centraliza_Form(FrmAgenda_Telefonica);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acAlteracao_ProdutoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmAlteracao_Produto);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmAlteracao_Produto, FrmAlteracao_Produto);
    FrmAlteracao_Produto.Show;
    Centraliza_Form(FrmAlteracao_Produto);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acAlterar_Simbolo_MoedaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmAltera_Simbolo_Moeda);
  if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;

  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmAltera_Simbolo_Moeda, FrmAltera_Simbolo_Moeda);
    FrmAltera_Simbolo_Moeda.Show;
    Centraliza_Form(FrmAltera_Simbolo_Moeda);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acAltera_CaixaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmAltera_Caixa);

  if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;

  if (UDeclaracao.codigo_caixa <> 0) then
  begin
    Mensagem_Operacao_Nao_Permitida;
    abort;
  end;

  //Captura_Data_Movimento;
  ECF.Pega_Data_Movimento;
  if (dataf = '00/00/0000') then
  begin
    UDeclaracao.Mensagem_Erro;
    abort;
  end;

  //if (Habilitado) then
  //begin
    Application.CreateForm(TFrmAltera_Caixa, FrmAltera_Caixa);
    FrmAltera_Caixa.Show;
    Centraliza_Form(FrmAltera_Caixa);
  //end
  //else
    //UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acArquivo_MFDExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmPAFECF_Arq_MFD);
  if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;

  if (Habilitado) then
  begin
    Application.CreateForm(TFrmPAFECF_Arq_MFD, FrmPAFECF_Arq_MFD);
    FrmPAFECF_Arq_MFD.Show;
    Centraliza_Form(FrmPAFECF_Arq_MFD);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acArq_MFExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmPAFECF_Arq_MF);
  if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;

  if (Habilitado) then
  begin
    Application.CreateForm(TFrmPAFECF_Arq_MF, FrmPAFECF_Arq_MF);
    FrmPAFECF_Arq_MF.Show;
    Centraliza_Form(FrmPAFECF_Arq_MF);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.ac3Execute(Sender: TObject);
begin
  Application.CreateForm(TFrmBaixar_Cheque, FrmBaixar_Cheque);
  FrmBaixar_Cheque.Show;
end;

procedure TFrmMenu_Geral.acBancoExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Banco, FrmCadastro_Banco);
  FrmCadastro_Banco.Show;
end;

procedure TFrmMenu_Geral.acCadastro_BancoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Banco);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Banco, FrmCadastro_Banco);
    FrmCadastro_Banco.Show;
    Centraliza_Form(FrmCadastro_Banco);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_CaixaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Caixa);
  if (sem_rede = true) then
    Verifica_Rede;

  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Caixa, FrmCadastro_Caixa);
    FrmCadastro_Caixa.Show;
    Centraliza_Form(FrmCadastro_Caixa);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_CargoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Cargo);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Cargo, FrmCadastro_Cargo);
    FrmCadastro_Cargo.Show;
    Centraliza_Form(FrmCadastro_Cargo);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_CFOPExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_CFOP);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_CFOP, FrmCadastro_CFOP);
    FrmCadastro_CFOP.Show;
    Centraliza_Form(FrmCadastro_CFOP);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_Cheque2Execute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Cheque);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Cheque, FrmCadastro_Cheque);
    FrmCadastro_Cheque.Show;
    Centraliza_Form(FrmCadastro_Cheque);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_ChequeExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Cheque);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Cheque, FrmCadastro_Cheque);
    FrmCadastro_Cheque.Show;
    Centraliza_Form(FrmCadastro_Cheque);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_CidadeExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Cidade);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Cidade, FrmCadastro_Cidade);
    FrmCadastro_Cidade.Show;
    Centraliza_Form(FrmCadastro_Cidade);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_ClienteExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Cliente);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Cliente, FrmCadastro_Cliente);
    FrmCadastro_Cliente.Show;
    Centraliza_Form(FrmCadastro_Cliente);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_Condicao_PagamentoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Condicao_Pagamento);
  if (sem_rede = true) then
    Verifica_Rede;
  //if (Habilitado = true) then
  //begin
    Application.CreateForm(TFrmCadastro_Condicao_Pagamento, FrmCadastro_Condicao_Pagamento);
    FrmCadastro_Condicao_Pagamento.Show;
    Centraliza_Form(FrmCadastro_Condicao_Pagamento);
  //end
  //else
    //UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_Conta_CorrenteExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Conta_Corrente);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Conta_Corrente, FrmCadastro_Conta_Corrente);
    FrmCadastro_Conta_Corrente.Show;
    Centraliza_Form(FrmCadastro_Conta_Corrente);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_DepartamentoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Departamento);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Departamento, FrmCadastro_Departamento);
    FrmCadastro_Departamento.Show;
    Centraliza_Form(FrmCadastro_Departamento);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_EmpresaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Empresa);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Empresa, FrmCadastro_Empresa);
    FrmCadastro_Empresa.Show;
    Centraliza_Form(FrmCadastro_Empresa);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_EtiquetaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Etiqueta);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Etiqueta, FrmCadastro_Etiqueta);
    FrmCadastro_Etiqueta.Show;
    Centraliza_Form(FrmCadastro_Etiqueta);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_FornecedorExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Forn_Fab);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Forn_Fab, FrmCadastro_Forn_Fab);
    FrmCadastro_Forn_Fab.Show;
    Centraliza_Form(FrmCadastro_Forn_Fab);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_FuncionarioExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Funcionarios);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Funcionarios, FrmCadastro_Funcionarios);
    FrmCadastro_Funcionarios.Show;
    Centraliza_Form(FrmCadastro_Funcionarios);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_Grupo_ClienteExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Grupo_Cliente);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Grupo_Cliente, FrmCadastro_Grupo_Cliente);
    FrmCadastro_Grupo_Cliente.Show;
    Centraliza_Form(FrmCadastro_Grupo_Cliente);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_Grupo_ProdutoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Grupo_Produto);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Grupo_Produto, FrmCadastro_Grupo_Produto);
    FrmCadastro_Grupo_Produto.Show;
    Centraliza_Form(FrmCadastro_Grupo_Produto);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_Grupo_Tributacao_ProdutoExecute(
  Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Grupo_Produto_Tributacao);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Grupo_Produto_Tributacao, FrmCadastro_Grupo_Produto_Tributacao);
    FrmCadastro_Grupo_Produto_Tributacao.Show;
    Centraliza_Form(FrmCadastro_Grupo_Produto_Tributacao);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_Grupo_Tributacao_Produto_PISExecute(
  Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Grupo_Produto_Tributacao_PIS);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Grupo_Produto_Tributacao_PIS, FrmCadastro_Grupo_Produto_Tributacao_PIS);
    FrmCadastro_Grupo_Produto_Tributacao_PIS.Show;
    Centraliza_Form(FrmCadastro_Grupo_Produto_Tributacao_PIS);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_Itens_Folha_PagamentoExecute
  (Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Itens_Folha_Pagamento);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Itens_Folha_Pagamento, FrmCadastro_Itens_Folha_Pagamento);
    FrmCadastro_Itens_Folha_Pagamento.Show;
    Centraliza_Form(FrmCadastro_Itens_Folha_Pagamento);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_Local_ProdutoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Local_Produto);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Local_Produto, FrmCadastro_Local_Produto);
    FrmCadastro_Local_Produto.Show;
    Centraliza_Form(FrmCadastro_Local_Produto);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_LogradouroExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Logradouro);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Logradouro, FrmCadastro_Logradouro);
    FrmCadastro_Logradouro.Show;
    Centraliza_Form(FrmCadastro_Logradouro);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_MarcaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Marca);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Marca, FrmCadastro_Marca);
    FrmCadastro_Marca.Show;
    Centraliza_Form(FrmCadastro_Marca);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_NCMExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_NCM);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_NCM, FrmCadastro_NCM);
    FrmCadastro_NCM.Show;
    Centraliza_Form(FrmCadastro_NCM);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_Observacao_FiscalExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Observacao_Fiscal);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Observacao_Fiscal, FrmCadastro_Observacao_Fiscal);
    FrmCadastro_Observacao_Fiscal.Show;
    Centraliza_Form(FrmCadastro_Observacao_Fiscal);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_Operacao_BancariaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Operacao_Bancaria);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Operacao_Bancaria, FrmCadastro_Operacao_Bancaria);
    FrmCadastro_Operacao_Bancaria.Show;
    Centraliza_Form(FrmCadastro_Operacao_Bancaria);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_PaisExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Pais);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Pais, FrmCadastro_Pais);
    FrmCadastro_Pais.Show;
    Centraliza_Form(FrmCadastro_Pais);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_PatrimonioExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Patrimonio);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Patrimonio, FrmCadastro_Patrimonio);
    FrmCadastro_Patrimonio.Show;
    Centraliza_Form(FrmCadastro_Patrimonio);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_Perfil_UsuarioExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Perfil_Usuario);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Perfil_Usuario, FrmCadastro_Perfil_Usuario);
    FrmCadastro_Perfil_Usuario.Show;
    Centraliza_Form(FrmCadastro_Perfil_Usuario);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_Plano_FinanceiroExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Plano_Financeiro);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Plano_Financeiro, FrmCadastro_Plano_Financeiro);
    FrmCadastro_Plano_Financeiro.Show;
    Centraliza_Form(FrmCadastro_Plano_Financeiro);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_ProdutosExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Produto);

  {if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin}
    Application.CreateForm(TFrmCadastro_Produto, FrmCadastro_Produto);
    FrmCadastro_Produto.Show;
    Centraliza_Form(FrmCadastro_Produto);
  {end
  else
    UDeclaracao.Mensagem_Erro;}
end;

procedure TFrmMenu_Geral.acCadastro_ReceitaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Receita);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Receita, FrmCadastro_Receita);
    FrmCadastro_Receita.Show;
    Centraliza_Form(FrmCadastro_Receita);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_SetorExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Setor);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Setor, FrmCadastro_Setor);
    FrmCadastro_Setor.Show;
    Centraliza_Form(FrmCadastro_Setor);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_Situacao_TributariaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Situacao_Tributaria);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Situacao_Tributaria, FrmCadastro_Situacao_Tributaria);
    FrmCadastro_Situacao_Tributaria.Show;
    Centraliza_Form(FrmCadastro_Situacao_Tributaria);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_StatusExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Status);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Status, FrmCadastro_Status);
    FrmCadastro_Status.Show;
    Centraliza_Form(FrmCadastro_Status);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_Tabela_PrecoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Tabela_Preco);

  {if (FrmPedido_Venda <> nil) then
  begin
    Application.MessageBox('TEMPORARIAMENTE, não é permitido abrir a janela de TABELA DE PREÇOS com a janela de GERA VENDA aberta.', 'Não pode abrir', MB_OK+MB_ICONHAND);
    abort;
  end;}

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Tabela_Preco, FrmCadastro_Tabela_Preco);
    FrmCadastro_Tabela_Preco.Show;
    Centraliza_Form(FrmCadastro_Tabela_Preco);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_Tipo_DocumentoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Tipo_Documento);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Tipo_Documento,FrmCadastro_Tipo_Documento);
    FrmCadastro_Tipo_Documento.Show;
    Centraliza_Form(FrmCadastro_Tipo_Documento);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_Tipo_OcorrenciaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Tipo_Ocorrencia);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Tipo_Ocorrencia, FrmCadastro_Tipo_Ocorrencia);
    FrmCadastro_Tipo_Ocorrencia.Show;
    Centraliza_Form(FrmCadastro_Tipo_Ocorrencia);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_TransportadoraExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Transportadora);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Transportadora, FrmCadastro_Transportadora);
    FrmCadastro_Transportadora.Show;
    Centraliza_Form(FrmCadastro_Transportadora);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_Unidade_MedidaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Unidade_Medida);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Unidade_Medida, FrmCadastro_Unidade_Medida);
    FrmCadastro_Unidade_Medida.Show;
    Centraliza_Form(FrmCadastro_Unidade_Medida);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_UsuarioExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Usuario);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Usuario, FrmCadastro_Usuario);
    FrmCadastro_Usuario.Show;
    Centraliza_Form(FrmCadastro_Usuario);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_VeiculoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Veiculo);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Veiculo, FrmCadastro_Veiculo);
    FrmCadastro_Veiculo.Show;
    Centraliza_Form(FrmCadastro_Veiculo);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCaixaExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Caixa, FrmCadastro_Caixa);
  FrmCadastro_Caixa.Show;
end;

procedure TFrmMenu_Geral.acCargoExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Cargo, FrmCadastro_Cargo);
  FrmCadastro_Cargo.Show;
end;

procedure TFrmMenu_Geral.acChama_ClienteExecute(Sender: TObject);
begin
 // Verifica_Form_Aberto(TFrmChama_Cliente);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acChequeExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Cheque, FrmCadastro_Cheque);
  FrmCadastro_Cheque.Show;
end;

procedure TFrmMenu_Geral.acCidadeExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Cidade, FrmCadastro_Cidade);
  FrmCadastro_Cidade.Show;
end;

procedure TFrmMenu_Geral.acClienteExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Cliente, FrmCadastro_Cliente);
  FrmCadastro_Cliente.Show;
end;

procedure TFrmMenu_Geral.acCOFINSExecute(Sender: TObject);
begin
  acCOFINS.Enabled := true;
end;

procedure TFrmMenu_Geral.ac5Execute(Sender: TObject);
begin
  Application.CreateForm(TFrmConciliacao_Bancaria, FrmConciliacao_Bancaria);
  FrmConciliacao_Bancaria.Show;
end;

procedure TFrmMenu_Geral.acCompraExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCompra);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCompra, FrmCompra);
    FrmCompra.Show;
    Centraliza_Form(FrmCompra);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConciliacao_BancariaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConciliacao_Bancaria);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConciliacao_Bancaria, FrmConciliacao_Bancaria);
    FrmConciliacao_Bancaria.Show;
    Centraliza_Form(FrmConciliacao_Bancaria);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConciliacao_ProdutosExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConciliacao_Compra);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConciliacao_Compra, FrmConciliacao_Compra);
    FrmConciliacao_Compra.Show;
    Centraliza_Form(FrmConciliacao_Compra);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCondicao_PagamentoExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Condicao_Pagamento, FrmCadastro_Condicao_Pagamento);
  FrmCadastro_Condicao_Pagamento.Show;
end;

procedure TFrmMenu_Geral.acConfiguracao_SistemaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConfiguracao_Sistema);
  //if (sem_rede = true) then
    //Verifica_Rede;
  //if (Habilitado = true) then
  //begin
    Application.CreateForm(TFrmConfiguracao_Sistema, FrmConfiguracao_Sistema);
    FrmConfiguracao_Sistema.Show;
    Centraliza_Form(FrmConfiguracao_Sistema);
  //end
  //else
    //UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConfigura_FTPExecute(Sender: TObject);
begin
  Application.CreateForm(Tfrmconfiguracao, frmconfiguracao);
  frmconfiguracao.Show;
  Centraliza_Form(frmconfiguracao);
end;

procedure TFrmMenu_Geral.acConsulta_Acerto_CaixaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Acerto_Caixa);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Acerto_Caixa, FrmConsulta_Acerto_Caixa);
    FrmConsulta_Acerto_Caixa.Show;
    Centraliza_Form(FrmConsulta_Acerto_Caixa);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_ChequeExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Cheque);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Cheque, FrmConsulta_Cheque);
    FrmConsulta_Cheque.Show;
    Centraliza_Form(FrmConsulta_Cheque);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_ComissaoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Comissao);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Comissao, FrmConsulta_Comissao);
    FrmConsulta_Comissao.Show;
    Centraliza_Form(FrmConsulta_Comissao);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Comparativo_Custo_VendaExecute(
  Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Custo_Venda);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Custo_Venda, FrmConsulta_Custo_Venda);
    FrmConsulta_Custo_Venda.Show;
    Centraliza_Form(FrmConsulta_Custo_Venda);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Comparativo_Preco_CotacaoExecute(
  Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Comparativo_Preco_Cotacao);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Comparativo_Preco_Cotacao, FrmConsulta_Comparativo_Preco_Cotacao);
    FrmConsulta_Comparativo_Preco_Cotacao.Show;
    Centraliza_Form(FrmConsulta_Comparativo_Preco_Cotacao);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_CompraExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Compra);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Compra, FrmConsulta_Compra);
    FrmConsulta_Compra.Show;
    Centraliza_Form(FrmConsulta_Compra);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Custo_EmpresaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Custo_Empresa);
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Custo_Empresa, FrmConsulta_Custo_Empresa);
    FrmConsulta_Custo_Empresa.Show;
    Centraliza_Form(FrmConsulta_Custo_Empresa);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Cotacao_Preco_ProdutoExecute(
  Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Cotacao_Preco_Produto);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Cotacao_Preco_Produto, FrmConsulta_Cotacao_Preco_Produto);
    FrmConsulta_Cotacao_Preco_Produto.Show;
    Centraliza_Form(FrmConsulta_Cotacao_Preco_Produto);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Curva_ABC_ProdutoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Curva_ABC_Produto);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Curva_ABC_Produto, FrmConsulta_Curva_ABC_Produto);
    FrmConsulta_Curva_ABC_Produto.Show;
    Centraliza_Form(FrmConsulta_Curva_ABC_Produto);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_EntradaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Entrada);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Entrada, FrmConsulta_Entrada);
    FrmConsulta_Entrada.Show;
    Centraliza_Form(FrmConsulta_Entrada);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Extrato_CaixaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Lancamento_Caixa);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Lancamento_Caixa, FrmConsulta_Lancamento_Caixa);
    FrmConsulta_Lancamento_Caixa.Show;
    Centraliza_Form(FrmConsulta_Lancamento_Caixa);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Fechamento_CaixaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Fechamento_Caixa);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Fechamento_Caixa, FrmConsulta_Fechamento_Caixa);
    FrmConsulta_Fechamento_Caixa.Show;
    Centraliza_Form(FrmConsulta_Fechamento_Caixa);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Ficha_ClienteExecute(Sender: TObject);
begin
    Verifica_Form_Aberto(FrmConsulta_Ficha_Cliente);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Ficha_Cliente, FrmConsulta_Ficha_Cliente);
    FrmConsulta_Ficha_Cliente.Show;
    Centraliza_Form(FrmConsulta_Ficha_Cliente);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Ficha_FuncionarioExecute(Sender: TObject);
begin
    Verifica_Form_Aberto(FrmConsulta_Ficha_Funcionario);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Ficha_Funcionario, FrmConsulta_Ficha_Funcionario);
    FrmConsulta_Ficha_Funcionario.Show;
    Centraliza_Form(FrmConsulta_Ficha_Funcionario);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Folha_PagamentoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Folha_Pagamento);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Folha_Pagamento, FrmConsulta_Folha_Pagamento);
    FrmConsulta_Folha_Pagamento.Show;
    Centraliza_Form(FrmConsulta_Folha_Pagamento);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Historico_LogExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Historico_Log);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Historico_Log, FrmConsulta_Historico_Log);
    FrmConsulta_Historico_Log.Show;
    Centraliza_Form(FrmConsulta_Historico_Log);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Lancamentos_FinanceirosExecute(
  Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Lancamentos_Financeiros);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Lancamentos_Financeiros, FrmConsulta_Lancamentos_Financeiros);
    FrmConsulta_Lancamentos_Financeiros.Show;
    Centraliza_Form(FrmConsulta_Lancamentos_Financeiros);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Lancamento_BancarioExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Lancamento_Banco);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Lancamento_Banco, FrmConsulta_Lancamento_Banco);
    FrmConsulta_Lancamento_Banco.Show;
    Centraliza_Form(FrmConsulta_Lancamento_Banco);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Lucro_ProdutoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Lucratividade_Produto);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Lucratividade_Produto, FrmConsulta_Lucratividade_Produto);
    FrmConsulta_Lucratividade_Produto.Show;
    Centraliza_Form(FrmConsulta_Lucratividade_Produto);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_OcorrenciaExecute(Sender: TObject);
begin
    Verifica_Form_Aberto(FrmConsulta_Ocorrencia);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Ocorrencia, FrmConsulta_Ocorrencia);
    FrmConsulta_Ocorrencia.Show;
    Centraliza_Form(FrmConsulta_Ocorrencia);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Ordem_ServicoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_OS);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_OS, FrmConsulta_OS);
    FrmConsulta_OS.Show;
    Centraliza_Form(FrmConsulta_OS);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_PatrimonioExecute(Sender: TObject);
begin
    Verifica_Form_Aberto(FrmConsulta_Patrimonio);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Patrimonio, FrmConsulta_Patrimonio);
    FrmConsulta_Patrimonio.Show;
    Centraliza_Form(FrmConsulta_Patrimonio);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Posicao_EstoqueExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Posicao_Estoque);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Posicao_Estoque, FrmConsulta_Posicao_Estoque);
    FrmConsulta_Posicao_Estoque.Show;
    Centraliza_Form(FrmConsulta_Posicao_Estoque);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_PrecoExecute(Sender: TObject);
begin
  //Verifica_Form_Aberto(TFrmChama_Produto);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free;
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Preco_AnteriorExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Preco_Produto);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Preco_Produto, FrmConsulta_Preco_Produto);
    FrmConsulta_Preco_Produto.Show;
    Centraliza_Form(FrmConsulta_Preco_Produto);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_PreVenda_DAVExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Venda);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    FrmConsulta_Venda:= TFrmConsulta_Venda.Create(self);
    Centraliza_Form(FrmConsulta_Venda);
    FrmConsulta_Venda.Show;
    //FrmConsulta_Venda.Release;
    //FrmConsulta_Venda:= Nil;
    //Application.CreateForm(TFrmConsulta_Venda, FrmConsulta_Venda);
    //FrmConsulta_Venda.Show;
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_ProdutosExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Produto_Cadastrado);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Produto_Cadastrado, FrmConsulta_Produto_Cadastrado);
    FrmConsulta_Produto_Cadastrado.Show;
    Centraliza_Form(FrmConsulta_Produto_Cadastrado);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Recompor_EstoqueExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Reposicao_Estoque);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Reposicao_Estoque, FrmConsulta_Reposicao_Estoque);
    FrmConsulta_Reposicao_Estoque.Show;
    Centraliza_Form(FrmConsulta_Reposicao_Estoque);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Retorno_CotacaoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Retorno_Cotacao_Preco);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Retorno_Cotacao_Preco, FrmConsulta_Retorno_Cotacao_Preco);
    FrmConsulta_Retorno_Cotacao_Preco.Show;
    Centraliza_Form(FrmConsulta_Retorno_Cotacao_Preco);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConta_CorrenteExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Conta_Corrente, FrmCadastro_Conta_Corrente);
  FrmCadastro_Conta_Corrente.Show;
end;

procedure TFrmMenu_Geral.acCotacao_Preco_ProdutoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCotacao_Preco_Produto);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCotacao_Preco_Produto, FrmCotacao_Preco_Produto);
    FrmCotacao_Preco_Produto.Show;
    Centraliza_Form(FrmCotacao_Preco_Produto);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acDAV_EmitidosExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmDAV_Emitidos);
  if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;

  Verifica_Rede;
  if (Habilitado) then
  begin
    if (sem_rede = false) then
    begin
      Application.CreateForm(TFrmDAV_Emitidos, FrmDAV_Emitidos);
      FrmDAV_Emitidos.Show;
      Centraliza_Form(FrmDAV_Emitidos);
    end
    else
      Mensagem_Erro_Rede;
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acDepartamentoExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Departamento, FrmCadastro_Departamento);
  FrmCadastro_Departamento.Show;
end;

procedure TFrmMenu_Geral.acECFExecute(Sender: TObject);
begin
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmPDV, FrmPDV);
    FrmPDV.Show;
    Centraliza_Form(FrmPDV);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acEmpresaExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Empresa, FrmCadastro_Empresa);
  FrmCadastro_Empresa.Show;
end;

procedure TFrmMenu_Geral.acEntrada_ProdutosExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmEntrada_Produtos);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmEntrada_Produtos, FrmEntrada_Produtos);
    FrmEntrada_Produtos.Show;
    Centraliza_Form(FrmEntrada_Produtos);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acEnvia_SMSExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmEnvia_SMS);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmEnvia_SMS, FrmEnvia_SMS);
    FrmEnvia_SMS.Show;
    Centraliza_Form(FrmEnvia_SMS);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acParametros_ConfiguracaoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmPAFECF_Parametros_Configuracao);
  if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;

  Verifica_Rede;
  if (sem_rede = false) then
  begin
    Application.CreateForm(TFrmPAFECF_Parametros_Configuracao, FrmPAFECF_Parametros_Configuracao);
    FrmPAFECF_Parametros_Configuracao.Show;
    Centraliza_Form(FrmPAFECF_Parametros_Configuracao);
  end
  else
    Mensagem_Erro_Rede;
end;

procedure TFrmMenu_Geral.acFolha_PagamentoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmFolha_Pagamento);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmFolha_Pagamento, FrmFolha_Pagamento);
    FrmFolha_Pagamento.Show;
    Centraliza_Form(FrmFolha_Pagamento);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acFornecedorExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Forn_Fab, FrmCadastro_Forn_Fab);
  FrmCadastro_Forn_Fab.Show;
end;

procedure TFrmMenu_Geral.acFuncionarioExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Funcionarios, FrmCadastro_Funcionarios);
  FrmCadastro_Funcionarios.Show;

end;

procedure TFrmMenu_Geral.acGeralExecute(Sender: TObject);
begin
  acGeral.Enabled := true;
end;

procedure TFrmMenu_Geral.acGera_Etiqueta_ClienteExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmGera_Etiqueta);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmGera_Etiqueta, FrmGera_Etiqueta);
    FrmGera_Etiqueta.Show;
    Centraliza_Form(FrmGera_Etiqueta);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acGera_Etiqueta_ProdutoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmGera_Etiqueta_Produto);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    {Application.CreateForm(TFrmGera_Etiqueta_Produto, FrmGera_Etiqueta_Produto);
    FrmGera_Etiqueta_Produto.Show;
    Centraliza_Form(FrmGera_Etiqueta_Produto); }

    Application.CreateForm(TFrmGera_Etiqueta_Produto, FrmGera_Etiqueta_Produto);
    FrmGera_Etiqueta_Produto.Show;
    Centraliza_Form(FrmGera_Etiqueta_Produto);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acGera_Ordem_EntregaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmGera_Ordem_Entrega);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmGera_Ordem_Entrega, FrmGera_Ordem_Entrega);
    FrmGera_Ordem_Entrega.Show;
    Centraliza_Form(FrmGera_Ordem_Entrega);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acGrupo_ClienteExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Grupo_Cliente, FrmCadastro_Grupo_Cliente);
  FrmCadastro_Grupo_Cliente.Show;
end;

procedure TFrmMenu_Geral.acGrupo_ProdutoExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Grupo_Produto, FrmCadastro_Grupo_Produto);
  FrmCadastro_Grupo_Produto.Show;
end;

procedure TFrmMenu_Geral.acCadastro_Grupo_Tributacao_IPIExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Grupo_Produto_Tributacao_IPI);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Grupo_Produto_Tributacao_IPI, FrmCadastro_Grupo_Produto_Tributacao_IPI);
    FrmCadastro_Grupo_Produto_Tributacao_IPI.Show;
    Centraliza_Form(FrmCadastro_Grupo_Produto_Tributacao_IPI);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acCadastro_Grupo_Tributacao_COFINSExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Grupo_Produto_Tributacao_COFINS);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Grupo_Produto_Tributacao_COFINS, FrmCadastro_Grupo_Produto_Tributacao_COFINS);
    FrmCadastro_Grupo_Produto_Tributacao_COFINS.Show;
    Centraliza_Form(FrmCadastro_Grupo_Produto_Tributacao_COFINS);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acHorario_VeraoExecute(Sender: TObject);
begin
  if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;

  //Captura_Data_Movimento;
  {ECF.Pega_Data_Movimento;
  if (dataf <> '00/00/0000') then
  begin
    UDeclaracao.Mensagem_Erro;
    abort;
  end;}

  //if (Habilitado = true) then
  //begin
    if Application.MessageBox('Deseja Entrar/Sair do Horário de Verão?', 'Pergunta do Sistema', Mb_YesNo + Mb_IconQuestion) = idyes then
    begin
      //Bematech_FI_ProgramaHorarioVerao;
      ECF.Horario_Verao;
    end;
  //end
  //else
    //UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acIdentificacao_PAF_ECFExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmIdentificacao_PAF_ECF);
  if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;

  if (Habilitado) then
  begin
    Application.CreateForm(TFrmIdentificacao_PAF_ECF, FrmIdentificacao_PAF_ECF);
    FrmIdentificacao_PAF_ECF.Show;
    Centraliza_Form(FrmIdentificacao_PAF_ECF);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acInventario_EstoqueExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Inventario);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Inventario, FrmConsulta_Inventario);
    FrmConsulta_Inventario.Show;
    Centraliza_Form(FrmConsulta_Inventario);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acIPIExecute(Sender: TObject);
begin
  acIPI.Enabled := true;
end;

procedure TFrmMenu_Geral.acISSQNExecute(Sender: TObject);
begin
  acISSQN.Enabled := true;
end;

procedure TFrmMenu_Geral.acItens_Folha_PagamentoExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Itens_Folha_Pagamento,
    FrmCadastro_Itens_Folha_Pagamento);
  FrmCadastro_Itens_Folha_Pagamento.Show;
end;

procedure TFrmMenu_Geral.ac4Execute(Sender: TObject);
begin
  Application.CreateForm(TFrmLancamento_Banco, FrmLancamento_Banco);
  FrmLancamento_Banco.Show;
end;

procedure TFrmMenu_Geral.ac123Execute(Sender: TObject);
begin
  Application.CreateForm(TFrmLancamento_Financeiro, FrmLancamento_Financeiro);
  FrmLancamento_Financeiro.Show;
end;

procedure TFrmMenu_Geral.acLocal_ProdutoExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Local_Produto, FrmCadastro_Local_Produto);
  FrmCadastro_Local_Produto.Show;
end;

procedure TFrmMenu_Geral.acLogradouroExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Logradouro, FrmCadastro_Logradouro);
  FrmCadastro_Logradouro.Show;
end;

procedure TFrmMenu_Geral.acMapa_ResumoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmMapa_Resumo);
  if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;

  //if (Habilitado) then
  //begin
    Application.CreateForm(TFrmMapa_Resumo, FrmMapa_Resumo);
    FrmMapa_Resumo.Show;
    Centraliza_Form(FrmMapa_Resumo);
  //end
  //else
    //UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acMarcaExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Marca, FrmCadastro_Marca);
  FrmCadastro_Marca.Show;
end;

procedure TFrmMenu_Geral.acLancamento_FinanceiroExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmLancamento_Financeiro);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmLancamento_Financeiro, FrmLancamento_Financeiro);
    FrmLancamento_Financeiro.Show;
    Centraliza_Form(FrmLancamento_Financeiro);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acLancamento_ManualExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmMovimentacao_Manual);

  if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;

  if (sem_rede = true) then
    Verifica_Rede;
  Application.CreateForm(TFrmMovimentacao_Manual, FrmMovimentacao_Manual);
  FrmMovimentacao_Manual.Show;
  Centraliza_Form(FrmMovimentacao_Manual);
end;

procedure TFrmMenu_Geral.acLeitura_Memoria_FiscalExecute(Sender: TObject);
begin
  if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;

  //Verifica_Rede;
  if (Habilitado) then
  begin
    Application.CreateForm(TFrmMemoria_Fiscal_Faixa_Data_Reducao, FrmMemoria_Fiscal_Faixa_Data_Reducao);
    FrmMemoria_Fiscal_Faixa_Data_Reducao.Show;
    Centraliza_Form(FrmMemoria_Fiscal_Faixa_Data_Reducao);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acLeitura_Memoria_Fiscal_SimplesExecute(
  Sender: TObject);
begin

  if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;

  if (Habilitado) then
  begin
    Application.CreateForm(TFrmMemoria_Fiscal_Faixa_Data_Reducao_Completa, FrmMemoria_Fiscal_Faixa_Data_Reducao_Completa);
    FrmMemoria_Fiscal_Faixa_Data_Reducao_Completa.Show;
    Centraliza_Form(FrmMemoria_Fiscal_Faixa_Data_Reducao_Completa);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acLeitura_XExecute(Sender: TObject);
begin

  {if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;
  if (Habilitado) then
  begin}
    if Application.MessageBox('Deseja realizar a LEITURA X agora?', 'Atenção', Mb_YesNo + Mb_IconQuestion) = idyes then
    begin
      //Bematech_FI_LeituraX;
      //Analisa_iRetorno;
      ECF.LeituraX;
    end;
  {end
  else
    UDeclaracao.Mensagem_Erro; }
end;

procedure TFrmMenu_Geral.acOcorrencia_CobrancaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Ocorrencia_Cobranca);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Ocorrencia_Cobranca, FrmCadastro_Ocorrencia_Cobranca);
    FrmCadastro_Ocorrencia_Cobranca.Show;
    Centraliza_Form(FrmCadastro_Ocorrencia_Cobranca);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acOperacao_BancariaExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Operacao_Bancaria,
    FrmCadastro_Operacao_Bancaria);
  FrmCadastro_Operacao_Bancaria.Show;
end;

procedure TFrmMenu_Geral.acPatrimonioExecute(Sender: TObject);
begin
  acPatrimonio.Enabled := true;
end;

procedure TFrmMenu_Geral.acPDVExecute(Sender: TObject);
begin
  //Verifica_Erros_Ao_Gerar_Cupom;
  Verifica_Form_Aberto(FrmPDV);

  if (FrmPedido_Venda <> nil) then
  begin
    Application.MessageBox('Não é permitido abrir essa janela com a janela de Gerar Venda aberta', 'Não pode abrir', MB_OK+MB_ICONHAND);
    abort;
  end;

  if (Habilitado = true) and (UDeclaracao.codigo_caixa <> 0) then
  begin
    Application.CreateForm(TFrmPDV, FrmPDV);
    FrmPDV.Show;
    Centraliza_Form_Full_Screen(FrmPDV);
  end
  else if (UDeclaracao.codigo_caixa = 0) then
  begin
    Application.MessageBox('Por favor, abra o caixa', 'Abra o caixa', MB_OK+MB_ICONEXCLAMATION);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acPISExecute(Sender: TObject);
begin
  acPIS.Enabled := true;
end;

procedure TFrmMenu_Geral.acICMSExecute(Sender: TObject);
begin
  acPIS.Enabled := true;
end;

procedure TFrmMenu_Geral.acPlano_FinanceiroExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Plano_Financeiro, FrmCadastro_Plano_Financeiro);
  FrmCadastro_Plano_Financeiro.Show;
end;

procedure TFrmMenu_Geral.acPre_VendaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmPre_Venda);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmPre_Venda, FrmPre_Venda);
    FrmPre_Venda.Show;
    Centraliza_Form(FrmPre_Venda);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acProdutoExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Produto, FrmCadastro_Produto);
  FrmCadastro_Produto.Show;
end;

procedure TFrmMenu_Geral.acRecebimento_CaixaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCarrega_Pedido_Caixa);

  if (FrmPDV <> nil) then
  begin
    Application.MessageBox('Não é permitido abrir essa janela com a janela de PDV aberta', 'Não pode abrir', MB_OK+MB_ICONHAND);
    abort;
  end;

  if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;

  //if (sem_rede = true) then
    //Verifica_Rede;

  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCarrega_Pedido_Caixa, FrmCarrega_Pedido_Caixa);
    FrmCarrega_Pedido_Caixa.Show;
    Centraliza_Form(FrmCarrega_Pedido_Caixa);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acReducao_ZExecute(Sender: TObject);
var
  data, tempo: AnsiString;
begin

  if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;
  if (Habilitado) then
  begin
    if Application.MessageBox('Deseja realizar a REDUÇÃO Z agora?', 'Atenção', Mb_YesNo + Mb_IconQuestion) = idyes then
    begin
      try
        if (gera_os = 'SIM') then
          DAV_Emitidos;

        //Cancela_Pre_Venda;
        issqn := '';
        //CapturaContadoresECF;
        ECF.Pega_Contadores;
        Busca_Dados_SoftwareHouse;
        //Captura_Data_Movimento;
        ECF.Pega_Data_Movimento;
        //Captura_Venda_Bruta;
        ECF.Pega_Venda_Bruta_Diaria;
        data:= DateToStr(date);
        tempo:= TimeToStr(time);
        iRetorno:= Bematech_FI_ReducaoZ(PAnsiChar(data), PAnsiChar(tempo));
        Analisa_iRetorno;
        { -------------------------------------R02 - RELAÇÃO RED. Z-------------------------------------- }

        //Captura_Data_Hora_Reducao;
        ECF.Pega_Data_Hora_Reducao;
        //Grande_Total;
        ECF.Pega_Grande_Total;
        //Data_Hora_GravacaoSWBasicoMFAdicional;
        ECF.Pega_Data_Hora_GravacaoSWBasicoMFAdicional;
        //COO_INI_FIN;
        ECF.Pega_COO_Inicial_Final;
        R02.Inserir(R02);

        { -------------------------------------R03 - DETALHES RED. Z-------------------------------------- }
        //UDeclaracao.Totalizador_Parcial;
        ECF.Pega_Totalizador_Parcial;
        //CapturaContadoresECF;
        ECF.Pega_Contadores;
        R03.Inserir(R03);

        Movimento_ECF;
        Habilitado:= false;
        Reducao := false;
        Processo_Concluido;
      except
        on E: Exception do
        begin
          ShowMessage('Erro');
        end;
      end;
    end;
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acRegistro_OcorrenciaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmOcorrencia);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmOcorrencia, FrmOcorrencia);
    FrmOcorrencia.Show;
    Centraliza_Form(FrmOcorrencia);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acRegra_COFINSExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmRegra_COFINS);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmRegra_COFINS, FrmRegra_COFINS);
    FrmRegra_COFINS.Show;
    Centraliza_Form(FrmRegra_COFINS);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acRegra_ICMSExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmRegra_ICMS);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmRegra_ICMS, FrmRegra_ICMS);
    FrmRegra_ICMS.Show;
    Centraliza_Form(FrmRegra_ICMS);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acRegra_IPIExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmRegra_IPI);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmRegra_IPI, FrmRegra_IPI);
    FrmRegra_IPI.Show;
    Centraliza_Form(FrmRegra_IPI);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acRegra_ISSQNExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmRegra_ISSQN);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmRegra_ISSQN, FrmRegra_ISSQN);
    FrmRegra_ISSQN.Show;
    Centraliza_Form(FrmRegra_ISSQN);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acRegra_PISExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmRegra_PIS);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmRegra_PIS, FrmRegra_PIS);
    FrmRegra_PIS.Show;
    Centraliza_Form(FrmRegra_PIS);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acReimpressao_DAVExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmInforma_DAV);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmInforma_DAV, FrmInforma_DAV);
    FrmInforma_DAV.Show;
    Centraliza_Form(FrmInforma_DAV);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acRetorno_CotacaoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmRetorno_Cotacao);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmRetorno_Cotacao, FrmRetorno_Cotacao);
    FrmRetorno_Cotacao.Show;
    Centraliza_Form(FrmRetorno_Cotacao);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acRevalidar_SistemaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmRevalida_Sistema);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmRevalida_Sistema, FrmRevalida_Sistema);
    FrmRevalida_Sistema.Show;
    Centraliza_Form(FrmRevalida_Sistema);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acSairExecute(Sender: TObject);
begin
  close;
end;

procedure TFrmMenu_Geral.acSangriaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmSangria);

  {if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;}
  //if (sem_rede = true) then
    //Verifica_Rede;

  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmSangria, FrmSangria);
    FrmSangria.Show;
    Centraliza_Form(FrmSangria);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acSetorExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Setor, FrmCadastro_Setor);
  FrmCadastro_Setor.Show;
end;

procedure TFrmMenu_Geral.acSugestao_CompraExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmSugestao_Compra);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmSugestao_Compra, FrmSugestao_Compra);
    FrmSugestao_Compra.Show;
    Centraliza_Form(FrmSugestao_Compra);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acSuprimentoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmSuprimento);

  {if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;}

  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmSuprimento, FrmSuprimento);
    FrmSuprimento.Show;
    Centraliza_Form(FrmSuprimento);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acPrograma_TruncamentoExecute(Sender: TObject);
begin

  if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;
  if (Habilitado = true) then
  begin
    if Application.MessageBox('Muda a impressora para o modo Truncamento?',
      'Atenção', Mb_YesNo + Mb_IconQuestion) = idyes then
    begin
      Bematech_FI_ProgramaTruncamento;
      Analisa_iRetorno;
      Retorno_Impressora;
    end;
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acTabela_Indice_Tecnico_ProducaoExecute(
  Sender: TObject);
begin
  Verifica_Form_Aberto(FrmTabela_Indice_Tecnico_Producao);
  {if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;}

  Verifica_Rede;
  if (sem_rede = false) then
  begin
    Application.CreateForm(TFrmTabela_Indice_Tecnico_Producao, FrmTabela_Indice_Tecnico_Producao);
    FrmTabela_Indice_Tecnico_Producao.Show;
    Centraliza_Form(FrmTabela_Indice_Tecnico_Producao);
  end
  else
    Mensagem_Erro_Rede;
end;

procedure TFrmMenu_Geral.acTabela_PrecoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Tabela_Preco);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Tabela_Preco, FrmConsulta_Tabela_Preco);
    FrmConsulta_Tabela_Preco.Show;
    Centraliza_Form(FrmConsulta_Tabela_Preco);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acTabela_ProdutosExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmTabela_Produto);
{  if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;  }

  Verifica_Rede;
  if (sem_rede = false) then
  begin
    Application.CreateForm(TFrmTabela_Produto, FrmTabela_Produto);
    FrmTabela_Produto.Show;
    Centraliza_Form(FrmTabela_Produto);
  end
  else
    Mensagem_Erro_Rede;
end;

procedure TFrmMenu_Geral.actAtualizaExecute(Sender: TObject);
var arquivo : string;
begin
if application.MessageBox('Deseja realmente atualizar agora?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION) = idyes then
  begin
    arquivo := ExtractFilePath(Application.ExeName) + 'atualizador.bat';
    ShellExecute(handle,'open',PChar(arquivo), '','',SW_SHOWNORMAL);
    Application.Terminate;
  end;

end;

procedure TFrmMenu_Geral.Action1Execute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmGera_Etiqueta_Impressora_Etiqueta);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmGera_Etiqueta_Impressora_Etiqueta, FrmGera_Etiqueta_Impressora_Etiqueta);
    FrmGera_Etiqueta_Impressora_Etiqueta.Show;
    Centraliza_Form(FrmGera_Etiqueta_Impressora_Etiqueta);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.Action2Execute(Sender: TObject);
begin
    Application.CreateForm(TFrmGerarSped, FrmGerarSped);
    FrmGerarSped.Show;
//    FrmGerarSped.Release;
//    Centraliza_Form(FrmGerarSped);
end;

procedure TFrmMenu_Geral.Action3Execute(Sender: TObject);
begin
 Application.createform(TFrmGerarSped, FrmGerarSped);
 FrmGerarSped.Show;
 Centraliza_Form(FrmGerarSped);

end;

procedure TFrmMenu_Geral.acCadastro_Tipo_Bem_PatrimonialExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Tipo_Bem_Patrimonial);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmCadastro_Tipo_Bem_Patrimonial, FrmCadastro_Tipo_Bem_Patrimonial);
    FrmCadastro_Tipo_Bem_Patrimonial.Show;
    Centraliza_Form(FrmCadastro_Tipo_Bem_Patrimonial);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Historico_MovimentacaoExecute(Sender: TObject);
begin
    Verifica_Form_Aberto(FrmConsulta_Historico_Movimentacao);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Historico_Movimentacao, FrmConsulta_Historico_Movimentacao);
    FrmConsulta_Historico_Movimentacao.Show;
    Centraliza_Form(FrmConsulta_Historico_Movimentacao);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Lucro_GrupoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Lucratividade_Grupo);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Lucratividade_Grupo, FrmConsulta_Lucratividade_Grupo);
    FrmConsulta_Lucratividade_Grupo.Show;
    Centraliza_Form(FrmConsulta_Lucratividade_Grupo);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Lucro_MarcaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Lucratividade_Marca);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Lucratividade_Marca, FrmConsulta_Lucratividade_Marca);
    FrmConsulta_Lucratividade_Marca.Show;
    Centraliza_Form(FrmConsulta_Lucratividade_Marca);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acOrdem_ServicoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmOS);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmOS, FrmOS);
    FrmOS.Show;
    Centraliza_Form(FrmOS);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Saldo_BancarioExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Saldo_Bancario);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Saldo_Bancario, FrmConsulta_Saldo_Bancario);
    FrmConsulta_Saldo_Bancario.Show;
    Centraliza_Form(FrmConsulta_Saldo_Bancario);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acConsulta_Saldo_EstoqueExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConsulta_Saldo_Estoque);
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Saldo_Estoque, FrmConsulta_Saldo_Estoque);
    FrmConsulta_Saldo_Estoque.Show;
    Centraliza_Form(FrmConsulta_Saldo_Estoque);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acContagem_EstoqueExecute(Sender: TObject);
begin
  //Verifica_Form_Aberto(FrmConta_Fixa);
    Verifica_Form_Aberto(FrmConsulta_Contagem_Estoque);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConsulta_Contagem_Estoque, FrmConsulta_Contagem_Estoque);
    FrmConsulta_Contagem_Estoque.Show;
    Centraliza_Form(FrmConsulta_Contagem_Estoque);
  end
  else
    UDeclaracao.Mensagem_Erro;

  {FrmRel_Contagem_Estoque:= TFrmRel_Contagem_Estoque.create(self);
  FrmRel_Contagem_Estoque.Release;
  FrmRel_Contagem_Estoque:= Nil;}
end;

procedure TFrmMenu_Geral.acContasExecute(Sender: TObject);
begin
  acContas.Enabled:= true;
end;

procedure TFrmMenu_Geral.acContas_FixasExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmConta_Fixa);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmConta_Fixa, FrmConta_Fixa);
    FrmConta_Fixa.Show;
    Centraliza_Form(FrmConta_Fixa);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acBaixar_ChequeExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmBaixar_Cheque);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmBaixar_Cheque, FrmBaixar_Cheque);
    FrmBaixar_Cheque.Show;
    Centraliza_Form(FrmBaixar_Cheque);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acBaixar_TitulosExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmChama_Lancamentos_Financeiros);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmChama_Lancamentos_Financeiros, FrmChama_Lancamentos_Financeiros);
    FrmChama_Lancamentos_Financeiros.Show;
    Centraliza_Form(FrmChama_Lancamentos_Financeiros);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acLancamento_BancarioExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmLancamento_Banco);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmLancamento_Banco, FrmLancamento_Banco);
    FrmLancamento_Banco.Show;
    Centraliza_Form(FrmLancamento_Banco);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acLancamento_CaixaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmLancamento_Caixa);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmLancamento_Caixa, FrmLancamento_Caixa);
    FrmLancamento_Caixa.Show;
    Centraliza_Form(FrmLancamento_Caixa);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acMeio_PagamentoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmMeios_Pagamento);
  if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;

  Verifica_Rede;
  if (Habilitado) then
  begin
    if (sem_rede = false) then
    begin
      Application.CreateForm(TFrmMeios_Pagamento, FrmMeios_Pagamento);
      FrmMeios_Pagamento.Show;
      Centraliza_Form(FrmMeios_Pagamento);
    end
    else
      Mensagem_Erro_Rede;
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acMovimentacao_SaidaExecute(Sender: TObject);
begin
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmMovimentacao_Saida, FrmMovimentacao_Saida);
    FrmMovimentacao_Saida.Show;
    Centraliza_Form(FrmMovimentacao_Saida);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acMovimento_ECFExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmMovimento_ECF);
  if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;

  Verifica_Rede;
  if (sem_rede = false) then
  begin
    Application.CreateForm(TFrmMovimento_ECF, FrmMovimento_ECF);
    FrmMovimento_ECF.Show;
    Centraliza_Form(FrmMovimento_ECF);
  end
  else
    Mensagem_Erro_Rede;
  //end
  //else
    //UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acNFEExecute(Sender: TObject);
begin

  if (FrmPDV <> nil) then
  begin
    Application.MessageBox('Não é permitido abrir essa janela com a janela de Gerar Cupom aberta', 'Não pode abrir', MB_OK+MB_ICONHAND);
    abort;
  end;

  Verifica_Form_Aberto(FrmNFE);

  Application.CreateForm(TFrmNFE, FrmNFE);
  FrmNFE.Show;
  Centraliza_Form(FrmNFE);
end;

procedure TFrmMenu_Geral.acNFe_ADMExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmNFE_Adm);

  Application.CreateForm(TFrmNFE_Adm, FrmNFE_Adm);
  FrmNFE_Adm.Show;
  Centraliza_Form(FrmNFE_Adm);
end;

procedure TFrmMenu_Geral.acPrograma_ArredondamentoExecute(Sender: TObject);
begin

  if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;
  if (Habilitado = true) then
  begin
    if Application.MessageBox('Muda a impressora para o modo Arredondamento?',
      'Atenção', Mb_YesNo + Mb_IconQuestion) = idyes then
    begin
      Bematech_FI_ProgramaArredondamento;
      Analisa_iRetorno;
      Retorno_Impressora;
    end;
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acFabricacao_PropriaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmFabricacao_Propria);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmFabricacao_Propria, FrmFabricacao_Propria);
    FrmFabricacao_Propria.Show;
    Centraliza_Form(FrmFabricacao_Propria);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acFechamento_CaixaExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmFechamento_Caixa);

  if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;

  if (UDeclaracao.codigo_caixa <> 0) then
  begin
    Mensagem_Operacao_Nao_Permitida;
    abort;
  end;

  //Captura_Data_Movimento;
  ECF.Pega_Data_Movimento;
  if (dataf = '00/00/0000') then
  begin
    UDeclaracao.Mensagem_Erro;
    abort;
  end;

  //if (Habilitado) then
  //begin
    Application.CreateForm(TFrmFechamento_Caixa, FrmFechamento_Caixa);
    FrmFechamento_Caixa.Show;
    Centraliza_Form(FrmFechamento_Caixa);
  //end
  //else
    //UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acFechamento_EstoqueExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmFechamento_Inventario);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmFechamento_Inventario, FrmFechamento_Inventario);
    FrmFechamento_Inventario.Show;
    Centraliza_Form(FrmFechamento_Inventario);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acFinanceiroExecute(Sender: TObject);
begin
  acFinanceiro.Enabled := true;
end;

procedure TFrmMenu_Geral.acRegistros_ECFExecute(Sender: TObject);
begin
//  if (Carrega_Tipo_Local = 1) then
//  begin
//    Acesso_Nao_Permitido;
//    abort;
//  end;

  //Verifica_Rede;
  //if (Habilitado) then
  //begin
    Application.CreateForm(TFrmPAFECF_Registros_PAF, FrmPAFECF_Registros_PAF);
    FrmPAFECF_Registros_PAF.Show;
    Centraliza_Form(FrmPAFECF_Registros_PAF);
  //end
  //else
    //UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acTipo_DocumentoExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Tipo_Documento, FrmCadastro_Tipo_Documento);
  FrmCadastro_Tipo_Documento.Show;
end;

procedure TFrmMenu_Geral.acTratamento_COFINSExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmTratamento_COFINS);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmTratamento_COFINS, FrmTratamento_COFINS);
    FrmTratamento_COFINS.Show;
    Centraliza_Form(FrmTratamento_COFINS);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acTratamento_ICMSExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmTratamento_ICMS);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmTratamento_ICMS, FrmTratamento_ICMS);
    FrmTratamento_ICMS.Show;
    Centraliza_Form(FrmTratamento_ICMS);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acTratamento_IPIExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmTratamento_IPI);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmTratamento_IPI, FrmTratamento_IPI);
    FrmTratamento_IPI.Show;
    Centraliza_Form(FrmTratamento_IPI);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acTratamento_PISExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmTratamento_PIS);

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmTratamento_PIS, FrmTratamento_PIS);
    FrmTratamento_PIS.Show;
    Centraliza_Form(FrmTratamento_PIS);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acUnidade_MedidaExecute(Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Unidade_Medida, FrmCadastro_Unidade_Medida);
  FrmCadastro_Unidade_Medida.Show;
end;

procedure TFrmMenu_Geral.acVendas_PeriodoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmVendas_Periodo);
  {if (Carrega_Tipo_Local = 1) then
  begin
    Acesso_Nao_Permitido;
    abort;
  end;}

  Verifica_Rede;
  if (sem_rede = false) then
  begin
    Application.CreateForm(TFrmVendas_Periodo, FrmVendas_Periodo);
    FrmVendas_Periodo.Show;
    Centraliza_Form(FrmVendas_Periodo);
  end
  else
    Mensagem_Erro_Rede;
  //end
  //else
    //UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.acVenda_OrcamentoExecute(Sender: TObject);
begin
  Verifica_Form_Aberto(FrmPedido_Venda);

  if (FrmPDV <> nil) then
  begin
    Application.MessageBox('Não é permitido abrir essa janela com a janela de PDV aberta', 'Não pode abrir', MB_OK+MB_ICONHAND);
    abort;
  end;

  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmPedido_Venda, FrmPedido_Venda);
    FrmPedido_Venda.Show;
    Centraliza_Form(FrmPedido_Venda);
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.ApplicationEventsMessage(var Msg: tagMSG;
  var Handled: Boolean);
var
  i : SmallInt;
begin
  if Msg.message = WM_MOUSEWHEEL then
  begin
    Msg.message := WM_KEYDOWN;
    Msg.lParam := 0;
    i := HiWord(Msg.wParam);
    if i > 0 then
      Msg.wParam := VK_UP
    else
      Msg.wParam := VK_DOWN;

  Handled := False;
  end;
end;

procedure TFrmMenu_Geral.Atualiza_EXE;
var
  arquivo: TStringList;
  i, iConta: Integer;
  letra, Crip: string;
  arq: string;
begin
  arquivo := TStringList.Create;
  try
    arquivo.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Config.txt');
    for i := 0 to arquivo.Count - 1 do
      begin
        letra:= Copy((arquivo[i]), 1, 2);
        if letra = '13' then
        begin
          try
            Crip:= GeraMD5PAFECF;
          finally
            arquivo[i]:= '13. ' + Crip;
            arquivo.SaveToFile(ExtractFilePath(Application.ExeName) + 'Config.txt');
          end;
        end;
      end;
  finally
    FreeAndNil(arquivo);
  end;
end;

procedure TFrmMenu_Geral.BBtnReconectarClick(Sender: TObject);
var
  aux: TDate;
  i: integer;
  nao_conectou: boolean;
begin
  {aux:= StrToDate('31/03/2014');
  for i := 0 to 9 do
  begin
    aux:= IncMonth(aux, 1);
    ShowMessage(DateToStr(aux));
  end;}
  //Promissoria(IncDay(Date, 5), date, 150.00, 'Flávio Vilela', '011.755.281-02', 'Rua Teste X');
  //ShowMessage(nu_serie);
    //ShowMessage(BoolToStr( BlockInput(false)));
  nao_conectou:= false;
  if Abre_Conexao(dm.ADOConnection1) = false then
  begin
    Erro_Comunicacao_Servidor_2;
    nao_conectou:= true;
  end;

  if (tipo_local = '0101') then
  begin
    if Abre_Conexao_Local(dm.ADOConnectionLocal) = false then
    begin
      Erro_Comunicacao_Servidor_Local;
      nao_conectou:= true;
    end;
  end;

  if (nao_conectou) then
  begin
    BBtnReconectar.Visible:= true;
  end
  else
  begin
    Timer3.Enabled:= True;
    sem_rede:= false;
    if (tipo_local = '0101') then
    begin
      Inicializa_Dados_Principais_Movimentacao(5, dm.qryvenda);
      Inicializa_Dados_Principais_Movimentacao(6, dm.qryitens_venda);
      Inicializa_Dados_Principais_Movimentacao(9, dm.qrycontrola_codigo);
      Inicializa_Dados_Principais_Movimentacao(7, dm.qryr05);
      Inicializa_Dados_Principais_Movimentacao(11, dm.qryr04);
      Inicializa_Dados_Principais_Movimentacao(12, dm.qryr07);
      Inicializa_Dados_Principais_Movimentacao(13, dm.qryR06);
      Inicializa_Dados_Principais_Movimentacao(14, dm.qryfechamento_venda_aux);
    end;
    BBtnReconectar.Visible:= false;
  end;

end;

procedure TFrmMenu_Geral.btnAtualizadorClick(Sender: TObject);
var arquivo : string;
begin
  if application.MessageBox('Deseja realmente atualizar agora?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION) = idyes then
  begin
    arquivo := ExtractFilePath(Application.ExeName) + 'atualizador.bat';
    ShellExecute(handle,'open',PChar(arquivo), '','',SW_SHOWNORMAL);
    Application.Terminate;
  end;


end;

procedure TFrmMenu_Geral.Button1Click(Sender: TObject);
begin
  //Cancela_Pre_Venda;
  //ShowMessage(GeraMD5(['01032016', 'ABC', '123']));
  //Verifica_Permissao_Impressora;
  //ShowMessage('1');
  //GeraArquivoNPAFECF;
  ShowMessage(TimeToStr(dm.ACBrECF1.DataHora));
end;

procedure TFrmMenu_Geral.Button4Click(Sender: TObject);
begin
  ShowMessage(GeraMD5(['123', '11111111', 'ABC']));
end;

procedure TFrmMenu_Geral.Button5Click(Sender: TObject);
begin
  ShowMessage(GeraMD5(['123', '01032015', 'ABC']));
end;

procedure TFrmMenu_Geral.Button6Click(Sender: TObject);
begin
  ShowMessage(GeraMD5(['123', '01032016', 'ABC']));
end;

procedure TFrmMenu_Geral.Button2Click(Sender: TObject);
var
  Conexao: TADOConnection;
  FComandoSQL: TComandoSQLEntidade;
  FComandoSQLDominio: TComandoSQLDominio;
  comando: String;
begin
  comando:= 'update Pais set Codigo_Pais = :CPais, Descricao = :Desc, Data_Cadastro = :Data where Codigo = :Cod';
  FComandoSQL:= TComandoSQLEntidade.Create;
  FComandoSQLDominio:= TComandoSQLDominio.Create(FComandoSQL);

  Conexao:= TADOConnection.Create(self);
  Conexao:= TPool.getInstance.getConnection;
  TTransacao.Create(Conexao);
  TTransacao.iniciarTransacao(Conexao);
  SetUncommitted(Conexao);

  FComandoSQL.Conexao:= Conexao;
  FComandoSQL.ComandoSQL:= comando;
  FComandoSQL.Parametros.Add('CPais');
  FComandoSQL.Parametros.Add('Desc');
  FComandoSQL.Parametros.Add('Data');
  FComandoSQL.Parametros.Add('Cod');

  FComandoSQL.Valores.Add('5663');
  FComandoSQL.Valores.Add('Bulgaria');
  FComandoSQL.Valores.Add(date);
  FComandoSQL.Valores.Add(9);

  FComandoSQLDominio.ExecutaComandoSQLSalvarAlterarExcluir;
  TTransacao.confirmarTransacao(Conexao);
  TPool.getInstance.liberarConexao(Conexao);
end;

procedure TFrmMenu_Geral.Button3Click(Sender: TObject);
var
  Conexao: TADOConnection;
  FComandoSQL: TComandoSQLEntidade;
  FComandoSQLDominio: TComandoSQLDominio;
  comando: String;
  qAux: TADOQuery;
begin
  comando:= 'select * from Pais';
  FComandoSQL:= TComandoSQLEntidade.Create;

  Conexao:= TADOConnection.Create(self);
  Conexao:= TPool.getInstance.getConnection;
  TTransacao.Create(Conexao);
  TTransacao.iniciarTransacao(Conexao);
  SetUncommitted(Conexao);

  FComandoSQL.Conexao:= Conexao;
  FComandoSQL.ComandoSQL:= comando;
  {FComandoSQL.Parametros.Add('CPais');
  FComandoSQL.Parametros.Add('Desc');
  FComandoSQL.Parametros.Add('Data');
  FComandoSQL.Parametros.Add('Cod');

  FComandoSQL.Valores.Add('5663');
  FComandoSQL.Valores.Add('Bulgaria');
  FComandoSQL.Valores.Add(date);
  FComandoSQL.Valores.Add(9);}

  qAux:= TADOQuery.Create(nil);
  qAux.Connection:= Conexao;
  FComandoSQLDominio:= TComandoSQLDominio.Create(FComandoSQL);
  FComandoSQLDominio.ExecutaComandoSQLRetornaADOQuery(qAux);
  ds_teste.DataSet:= qAux;

  TTransacao.confirmarTransacao(Conexao);
  TPool.getInstance.liberarConexao(Conexao);
end;

{ procedure TFrmMenu_Geral.Button1Click(Sender: TObject);
  var
  d, m, a, data, dataf: string;
  iConta: integer;
  begin
  for iConta := 1 to 6 do DataMovimento := DataMovimento + ' ';
  iRetorno:= Bematech_FI_DataMovimento(DataMovimento);
  Analisa_iRetorno;
  d:= copy(DataMovimento, 1, 2);
  m:= copy(DataMovimento, 3, 2);
  a:= copy(DataMovimento, 5, 2);
  data:= d + '/' + m + '/' + a;
  dataf:= FormatDateTime('DD/MM/YYYY', StrToDate(data));
  showmessage(dataf);
  end; }

procedure TFrmMenu_Geral.Data_Pre_Venda_Cancelada(Dias: integer);
begin
  //Captura_Data_Movimento;
  ECF.Pega_Data_Movimento;
  dataa:= IncDay(StrToDateTime(dataf),dias);
end;

procedure TFrmMenu_Geral.DAV_Emitidos;
var
  qAux: TADOQuery;
  aux, cIndice, cDescricao: AnsiString;
begin
  qAux:= TADOQuery.Create(self);
  with qAux, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select P.N_Pedido, P.Data_Venda, P.Tipo, P.Total_Pedido, P.COO, P.COO_Vin from Pedido P');
    add('where P.Data_Venda = :DI and P.Tipo = :Tipo');
    Parameters.ParamByName('DI').Value:= date;
    Parameters.ParamByName('Tipo').Value:= 'OS';
    open;
  end;

    if (qAux.IsEmpty = false) then
    begin
      cIndice:= '4';
      cDescricao:= 'DAV-OS Emitidos';
      iRetorno:= Bematech_FI_NomeiaRelatorioGerencialMFD(PAnsiChar(cIndice), PAnsiChar(cDescricao));
      Analisa_iRetorno;

      iRetorno:= Bematech_FI_AbreRelatorioGerencialMFD(PAnsiChar(cIndice));
      Analisa_iRetorno;

      while not qAux.Eof do
      begin
        aux:= qAux.FieldByName('N_Pedido').AsString + ' ' + qAux.FieldByName('Data_Venda').AsString + ' ' +
              qAux.FieldByName('Tipo').AsString + ' ' + qAux.FieldByName('Total_Pedido').AsString + ' ' +
              qAux.FieldByName('COO').AsString + #13+#10;
        iRetorno:= Bematech_FI_RelatorioGerencial(aux);
        Analisa_iRetorno;
        qAux.Next;
      end;
      Bematech_FI_FechaRelatorioGerencial;
      den_op:= 'RG';
      Coleta_Dados_R06;
      R06.Inserir_Outros(R06);
      //Processo_Concluido;
    end;

end;

procedure TFrmMenu_Geral.Fecha_Movimento;
var
  data, tempo: AnsiString;
begin
  if Application.MessageBox('Deseja realizar o fechamento do caixa agora?', 'Atenção', Mb_YesNo + Mb_IconQuestion) = idyes then
  begin
  try
    if (gera_os = '0101') then
      //DAV_Emitidos;

    Cancela_Pre_Venda;
    issqn := '';
    ECF.Pega_Contadores;
    Busca_Dados_SoftwareHouse;
    ECF.Pega_Data_Movimento;
    ECF.Pega_Venda_Bruta_Diaria;

    data:= DateToStr(date);
    tempo:= TimeToStr(time);

    ECF.Pega_Data_Hora_Reducao;
    ECF.Pega_Grande_Total;
    ECF.Pega_Data_Hora_GravacaoSWBasicoMFAdicional;
    ECF.Pega_COO_Inicial_Final;

    if (R02.Inserir(R02)) then
    begin
      ECF.Pega_Totalizador_Parcial;
    end
    else
    begin
      Application.MessageBox('Não foi possível gravar os dados do movimento.', 'Impossível gravar dados', MB_OK+MB_ICONHAND);
      abort;
    end;

    ECF.Efetua_Reducao_Z(now);
    Atualiza_Abertura;
    Atualiza_Fechamento;

    Movimento_ECF;

    Habilitado:= false;
    Reducao := false;
    Houve_Reducao:= true;
    UDeclaracao.Insere_Historico(usuario, 'REALIZOU FECHAMENTO DE CAIXA.', TimeToStr(time), insercao, date);
    FrmMenu_Geral.acLancamento_Manual.Visible:= true;
  except
    on e: Exception do
    begin
      TLogger.GetInstance.Error(Self.ClassName + '. Finaliza movimento saindo do sistema. '+e.Message);
      Application.MessageBox('Não foi possível finalizar o movimento. Certifique-se de que já houve fechamento do caixa no dia ou se o ECF está conectado.', 'Impossível finalizar o movimento', MB_OK+MB_ICONHAND);
    end;
  end;
    //Processo_Concluido;
  end;
end;

procedure TFrmMenu_Geral.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  caminho: string;
begin
  if Application.MessageBox('Deseja sair do sistema?', 'Saindo...', Mb_YesNo + MB_ICONHAND) = idno then
  begin
    CanClose := false
  end
  else
  begin
    if (fechar_caixa_sair_sistema = 0) and (Houve_Reducao = false) then
    begin
      if (Carrega_Tipo_Local = 0) then
        Fecha_Movimento;
    end;

    if (fazer_backup = 'SIM') then
    begin
      caminho:= caminho_servidor+'Backup.exe';
      if (FileExists(caminho)) then
      begin
        ShellExecute(handle, 'open', PChar(caminho),'','',SW_SHOWNORMAL);
      end;
    end;

  end;
end;

procedure TFrmMenu_Geral.Verifica_Arq_Temp;
begin
  ArqTemp := ExtractFilePath(Application.ExeName)+'INTPOS.001';
  Pega_Bandeira_Pendente;
  if FileExists(ArqTemp) then
  begin
    NaoConfirmaTransacao;
    ApagaArquivosTEF;
    DeleteFile(ArqTemp);
  end
  else if FileExists(PathResp + 'INTPOS.001') then
  begin
    NaoConfirmaTransacao;
    ApagaArquivosTEF;
  end;
end;

procedure TFrmMenu_Geral.Verifica_Rede;
begin

  {if (Verifica_Status_Rede = false) then
    begin
      Mensagem_Erro_Rede;
      abort;
    end; }
end;

procedure TFrmMenu_Geral.FormCreate(Sender: TObject);
var
  ConfDominio: TConfiguracoesECFDominio;
begin
  Application.HintPause:= 500;
  Application.HintHidePause:= 10000;
  LblLocalGravacao.Visible:= true;
  LblLocalGravacao.Caption:= 'Local de gravação do arquivo MD5: '+ExtractFilePath(Application.ExeName)+'PAF_N.txt';

  if FileExists(ExtractFilePath(Application.ExeName)+'\TraducaoDev.ini') then {Verifica se existe o arquivo dentro da pasta}
  begin
    cxLocalizer1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\TraducaoDev.ini');
    cxLocalizer1.LanguageIndex := 1; {Muda o idioma / linguagem}
    cxLocalizer1.Active := TRUE;     {Ativa o componente / a tradução}
  end;

  StbStatus.Panels[4].Text:= maq+'/'+qtde_mac;
  ECF:= TBematech.Create;
  //TLogger.GetInstance.Debug('Tipo local: '+tipo_local+'. '+DateTimeToStr(now));
  {if (tipo_local = '0101') then
  begin
    Inicia_Impressora;
    //TLogger.GetInstance.Debug('Inicia impressora. '+DateTimeToStr(now));
    teste_ecf:= 0;
    ECF.Pega_Data_Movimento;
    //TLogger.GetInstance.Debug('Data do movimento: '+dataf+'. '+DateTimeToStr(now));
    if dataf <> '00/00/0000' then
      Pega_Caixa;
  end
  else
  begin}
    teste_ecf:= 1;
    dataf:= DateToStr(date);
    Pega_Caixa;
  //end;

  SetUncommitted(dm.ADOConnection1);
  {if (tipo_local = '0101') then
  begin
    SetUncommitted(dm.ADOConnectionLocal);
  end;}

  TLog.Debug('Carregando MD5 Principal.');
  CarregaMD5_Principal;

  //if (tipo_local = '0101') then
  //begin

    {ConfDominio:= TConfiguracoesECFDominio.Create(dm.ADOConnection1);
    if not (ConfDominio.verificaECFConfigurado(dm.ACBrECF1.NumSerie))then
    begin
      TMensagens.MensagemErro('ECF não cadastrado nas configurações do sistema.');
      TLog.Error('ECF não cadastrado nas configurações do sistema. Por favor, vá até nas Configurações do Sistema, aba Configurações FAV e configure o ECF.');
      //abort;
    end;}

    TLog.Debug('Verificando arquivos TEF.');
    Mensagens(FrmControle_Acesso, FrmControle_Acesso.StatusBar, 'Verificando Arquivos TEF');
    Verifica_Arq_Temp;
    TLog.Debug('Verificando cupom fiscal aberto.');
    //Mensagens(FrmControle_Acesso, FrmControle_Acesso.StatusBar, 'Verificado Cupom Fiscal Aberto');
    //ECF.Verifica_Cupom_Aberto;

    Habilitado:= true;
    GeraArqMD5;
    GeraArquivoNPAFECF;
    GeraMD5PAFECF;
    //ECF.Pega_Numero_Caixa;
    //ECF.Pega_Dados_Principais_ECF;
    TLog.Debug('Verificando MD5.');
    Altera_MD5_Arquivos(md5_alt);
    //ShowMessage(pMD5_Arquivos);
    TLog.Debug('Capturando chave.');
    Captura_Chave;
    TLog.Debug('Verificando permissão impressora');
    //Verifica_Permissao_Impressora;
    //ECF.Pega_Versao_Impressora;
    //ECF.Pega_Data_Hora_GravacaoSWBasicoMFAdicional;

    Houve_Reducao:= false;
    {Mensagens(FrmControle_Acesso, FrmControle_Acesso.StatusBar, 'Verificando estado de ECF livre');
    if ECF.Verifica_ECF_Livre then
    begin
      Mensagens(FrmControle_Acesso, FrmControle_Acesso.StatusBar, 'ECF OK!!!');
      Sleep(500);
    end;}

    {Mensagens(FrmControle_Acesso, FrmControle_Acesso.StatusBar, 'Verificando Requer X');
    if ECF.Verifica_Requer_X then
    begin
      TMensagens.MensagemInformacao('Impressora fiscal deve ser inicializada. Por favor, abra o caixa.');
    end;}

    {Mensagens(FrmControle_Acesso, FrmControle_Acesso.StatusBar, 'Verificando ECF Bloqueado');
    if ECF.Verifica_ECF_Bloqueado then
    begin
      Houve_Reducao:= true;
      TMensagens.MensagemErro('ECF Bloqueado. Só será permitida a utilização da impressora no próximo dia útil.');
    end;}

    {Mensagens(FrmControle_Acesso, FrmControle_Acesso.StatusBar, 'Verificado Redução Z Pendente');
    if ECF.Reducao_Z_Pendente then
    begin

      Mensagens(FrmControle_Acesso, FrmControle_Acesso.StatusBar, 'Verificando Caixa Pendente');
      Pega_Caixa_Pendente;

      Mensagens(FrmControle_Acesso, FrmControle_Acesso.StatusBar, 'Atualizando Caixa Pendente');
      Atualiza_Caixa_Movimento;

      TMensagens.MensagemErro('Por favor, faça a redução Z. Menu Caixa > Acerto de Caixa.');
      //abort;
    end;}

  //end
  //else
  //begin
  if (Imp_Fiscal_Escolhida = 'BEMATECH') then
  begin
    dm.ACBrPosPrinter1.Modelo:= ppEscBematech;
    TLog.Debug('Impressora fiscal escolhida: ' + Imp_Fiscal_Escolhida);
  end;

  if (Imp_Fiscal_Escolhida = 'DARUMA') then
  begin
    dm.ACBrPosPrinter1.Modelo:= ppEscDaruma;
    TLog.Debug('Impressora fiscal escolhida: ' + Imp_Fiscal_Escolhida);
  end;

  if (Imp_Fiscal_Escolhida = 'ELGIN') then
  begin
    dm.ACBrPosPrinter1.Modelo:= ppEscElgin;
    TLog.Debug('Impressora fiscal escolhida: ' + Imp_Fiscal_Escolhida);
  end;

  if (Imp_Fiscal_Escolhida = 'TEXTO') then
  begin
    dm.ACBrPosPrinter1.Modelo:= ppTexto;
    TLog.Debug('Impressora fiscal escolhida: ' + Imp_Fiscal_Escolhida);
  end;

  dm.ACBrPosPrinter1.Porta:= porta_ecf;
  Habilitado:= true;
  Reducao:= false;
  //end;
end;

procedure TFrmMenu_Geral.Image1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmAjuda_Geral, FrmAjuda_Geral);
  FrmAjuda_Geral.Show;
  Centraliza_Form(FrmAjuda_Geral);
end;

procedure TFrmMenu_Geral.Label2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmMensagem_Sistema, FrmMensagem_Sistema);
  FrmMensagem_Sistema.Show;
  Centraliza_Form(FrmMensagem_Sistema);
end;

procedure TFrmMenu_Geral.Label3Click(Sender: TObject);
begin
  threadFTP.Create(false);
end;

procedure TFrmMenu_Geral.MapaResumo;
var
  i, i2, aux: integer;
  titulo, empresa, cce, endemp, mun, uff, cnpjj,
  ecf, crz, coo, venda_bruta, candesc, totiss, venda_liquida, isento, subs, outros: string;
  valor_bruto, can, iss, valor_liquido: double;
begin
  ADOQueryP.Close;
  ADOQueryP.Open;
  ADOQueryP.First;
  ecf:= 'ECF  ';
  crz:= 'CRZ  ';
  coo:= 'COO    ';
  venda_bruta:= 'Venda Bruta ';
  candesc:= 'Canc./Desc. ';
  totiss:= 'Total. de ISS ';
  venda_liquida:= 'Valor Contábil | ';
  isento:= 'Isen./Não Trib. ';
  subs:= 'Subst. Tribut. ';
  outros:= 'Outros Rec. | ';

  while not ADOQueryP.Eof do
  begin
    rs.BeginDoc;
    i:= 0;
    i2:= 136;
    titulo:= 'MAPA RESUMO DO ECF';

    empresa:= ' Empresa: ' + razao_social;
    cce:= 'CCE: ' + insc_estadual;
    endemp:= 'Endereço: ' + UDeclaracao.endereco;
    mun:= 'Município: ' + UDeclaracao.cidade;
    uff:= 'UF: ' + uDeclaracao.uf;
    cnpjj:= 'CNPJ: ' + UDeclaracao.cnpj;

    rs.WriteFont(1, Alinha_Centro(titulo, i2), titulo, [bold]);
    rs.Write(1, 100, 'Data: ' + ADOQueryPDatamov.AsString);

    for i := 0 to i2 do
      rs.Write(2, i, '-');

    rs.Write(3, 0, empresa);
    rs.Write(3, 56, cce);

    rs.Write(4, 0, endemp);
    rs.Write(4, 50, mun);
    rs.Write(4, 90, uff);
    rs.Write(4, 105, cnpjj);

    for i := 0 to i2 do
      rs.Write(5, i, '-');

    {for i := 0 to i2 do
      rs.WriteFont(5, i, IntToStr(i), [Bold]); }

    //aux:= 0;
    //aux2:= 1;
    rs.WriteFont(6, 0, ecf, [Bold]);
    rs.WriteFont(6, Length(ecf) , crz, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz), coo, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz) + Length(coo) , venda_bruta, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz) + Length(coo) + Length(venda_bruta) , candesc, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz) + Length(coo) + Length(venda_bruta) + Length(candesc) , totiss, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz) + Length(coo) + Length(venda_bruta) + Length(candesc) + Length(totiss) , venda_liquida, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz) + Length(coo) + Length(venda_bruta) + Length(candesc) + Length(totiss) + Length(venda_liquida) , isento, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz) + Length(coo) + Length(venda_bruta) + Length(candesc) + Length(totiss) + Length(venda_liquida) + Length(isento) , subs, [Bold]);
    rs.WriteFont(6, Length(ecf) + Length(crz) + Length(coo) + Length(venda_bruta) + Length(candesc) + Length(totiss) + Length(venda_liquida) + Length(isento) + Length(subs) , outros, [Bold]);



    //pega as aliquotas Tributaveis e monta suas respectivas colunas
    ADOQuery2.Close;
    ADOQuery2.Parameters.ParamByName('D').Value:= ADOQueryPDatamov.AsDateTime;
    ADOQuery2.Open;
    ADOQuery2.First;
    aux:= 0;
    while not ADOQuery2.Eof do
    begin
      rs.WriteFont(6, Length(ecf) +
                      Length(crz) +
                      Length(coo) +
                      Length(venda_bruta) +
                      Length(candesc) +
                      Length(totiss) +
                      Length(venda_liquida) +
                      Length(isento) +
                      Length(subs) +
                      Length(outros) + aux, ADOQuery2Totalizador_Parcial.AsString, [Bold]);

      rs.Write(7, Alinha_Centro_Texto(FormatFloat('#0.0,0', ADOQuery2valor_venda.AsFloat),
                      Length(ecf) +
                      Length(crz) +
                      Length(coo) +
                      Length(venda_bruta) +
                      Length(candesc) +
                      Length(totiss) +
                      Length(venda_liquida) +
                      Length(isento) +
                      Length(subs) +
                      Length(outros) + aux, Length(FormatFloat('#0.0,0', ADOQuery2valor_venda.AsFloat))), FormatFloat('#0.0,0', ADOQuery2valor_venda.AsFloat));

      aux:= aux + 7;
      ADOQuery2.Next;
    end;

    //------- fim monta aliquotas tributaveis


    //pega os valores das aliquotas I, N ou F
    ADOQuery3.Close;
    ADOQuery3.Parameters.ParamByName('D1').Value:= ADOQueryPDatamov.AsDateTime;
    ADOQuery3.Parameters.ParamByName('D2').Value:= ADOQueryPDatamov.AsDateTime;
    ADOQuery3.Parameters.ParamByName('D3').Value:= ADOQueryPDatamov.AsDateTime;
    ADOQuery3.Parameters.ParamByName('D4').Value:= ADOQueryPDatamov.AsDateTime;
    ADOQuery3.Parameters.ParamByName('D5').Value:= ADOQueryPDatamov.AsDateTime;
    ADOQuery3.Open;
    ADOQuery3.First;

    while not ADOQuery3.Eof do
    begin
      if (ADOQuery3iss.AsString <> '') then
      begin
        iss:= ADOQuery3iss.AsFloat;
        rs.Write(7, Alinha_Centro_Texto(totiss,
                    Length(ecf) +
                    Length(crz) +
                    Length(coo) +
                    Length(venda_bruta) +
                    Length(candesc), Length(FormatFloat('#0.0,0', ADOQuery3iss.AsFloat))) , FormatFloat('#0.0,0', ADOQuery3iss.AsFloat));
      end;

      if (ADOQuery3Totalizador_Parcial.AsString = 'I1') then
        rs.Write(7, Alinha_Centro_Texto(isento,
                    Length(ecf) +
                    Length(crz) +
                    Length(coo) +
                    Length(venda_bruta) +
                    Length(candesc) +
                    Length(totiss) +
                    Length(venda_liquida), Length(FormatFloat('#0.0,0', ADOQuery3valor_venda.AsFloat))) , FormatFloat('#0.0,0', ADOQuery3valor_venda.AsFloat));

      if (ADOQuery3Totalizador_Parcial.AsString = 'F1') then
        rs.Write(7, Alinha_Centro_Texto(subs,
                    Length(ecf) +
                    Length(crz) +
                    Length(coo) +
                    Length(venda_bruta) +
                    Length(candesc) +
                    Length(totiss) +
                    Length(venda_liquida) +
                    Length(isento) , Length(FormatFloat('#0.0,0', ADOQuery3valor_venda.AsFloat))), FormatFloat('#0.0,0', ADOQuery3valor_venda.AsFloat));

      if (ADOQuery3Totalizador_Parcial.AsString = 'N1') then
        rs.Write(7, Alinha_Centro_Texto(outros,
                    Length(ecf) +
                    Length(crz) +
                    Length(coo) +
                    Length(venda_bruta) +
                    Length(candesc) +
                    Length(totiss) +
                    Length(venda_liquida) +
                    Length(isento) +
                    Length(subs) , Length(FormatFloat('#0.0,0', ADOQuery3valor_venda.AsFloat))), FormatFloat('#0.0,0', ADOQuery3valor_venda.AsFloat));

      ADOQuery3.Next;
    end;

    //----- fim pega aliquotas I, N ou F


    //----- pega os dados principais-----

    valor_bruto:= ADOQuery3venda_bruta.AsFloat;
    can:= ADOQuery3DT.AsFloat + ADOQuery3DS.AsFloat;
    valor_liquido:= valor_bruto - can - iss;

    rs.Write(7, 0, ADOQueryPCaixa.AsString);
    rs.Write(7, Length(ecf) , ADOQueryPCRZ.AsString);
    rs.Write(7, Length(ecf) + Length(crz) , ADOQueryPCOO.AsString);

    rs.Write(7, Alinha_Centro_Texto(venda_bruta,
                Length(ecf) +
                Length(crz) +
                Length(coo) , Length(FormatFloat('#0.0,0', valor_bruto))), FormatFloat('#0.0,0', valor_bruto));

    rs.Write(7, Alinha_Centro_Texto(candesc,
                Length(ecf) +
                Length(crz) +
                Length(coo) +
                Length(venda_bruta) , Length(FormatFloat('#0.0,0', can))), FormatFloat('#0.0,0', can));

    rs.Write(7, Alinha_Centro_Texto(venda_liquida,
                Length(ecf) +
                Length(crz) +
                Length(coo) +
                Length(venda_bruta) +
                Length(candesc) +
                Length(totiss) , Length(FormatFloat('#0.0,0', valor_liquido))), FormatFloat('#0.0,0', valor_liquido));


    // ------- fim ////
    for i := 0 to i2 do
      rs.Write(8, i, '-');

    rs.Write(10, 0, 'Observações');
    rs.Write(10, 60, 'Responsável pelo Estabelecimento');

    for i := 0 to 40 do
      rs.Write(12, i, '-');

    rs.Write(12, 60, '  Nome: ');
    rs.Write(14, 60, 'Função: ');

    for i := 68 to 100 do
      rs.Write(12, i, '-');

    for i := 68 to 100 do
      rs.Write(14, i, '-');

    ADOQueryP.Next;
    rs.Print;
  end;
end;

procedure TFrmMenu_Geral.MovimentacaoECF(NomeArquivo:AnsiString; Data: TDate);
var
  arq: string;
  serie, dataformatada: AnsiString;
begin
  setlength( registroEAD, 256 );
  SaveDialog1.InitialDir:= Local_Arquivo(14);
  serie:= Copy(nu_serie,2,15);
  dataformatada:= FormatDateTime('DDMMYYYY', StrToDateTime(dataf));
  NomeArquivo := Local_Arquivo(14) + CIECF + serie + dataformatada + '.txt';
  AssignFile(sArquivo, NomeArquivo);
  Rewrite(sArquivo);
  Cria01(Data);
  Cria02(Data);
  Cria03(Data);
  Cria04(Data);
  Cria05(Data);
  Cria06(Data);
  Cria07(Data);
  CloseFile(sArquivo);
  arq:= NomeArquivo;
  generateEAD(arq, cChavePublica, cChavePrivada, registroEAD, 1);
  Arquivo_Gerado(NomeArquivo);
end;

procedure TFrmMenu_Geral.Movimento_ECF;
begin
  //Captura_Numero_Caixa;
  ECF.Pega_Numero_Caixa;
  Caix:= sequencia;
  sequencia:= Copy(sequencia,2,3);
  MovimentacaoECF(NomeArquivo, StrTodateTime(dataf));
end;

procedure TFrmMenu_Geral.OcultaExibeMenu1Click(Sender: TObject);
begin
  if (Ribbon1.Enabled = false) then
  begin
    Ribbon1.Enabled:= true;
    Ribbon1.HideTabs:= false;
    //menu_ocultado:= false;
  end
  else
  begin
    Ribbon1.Enabled:= false;
    Ribbon1.HideTabs:= true;
    //menu_ocultado:= true;
  end;
end;

procedure TFrmMenu_Geral.Produtos1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
  FrmChama_Produto.ShowModal;
  FrmChama_Produto.Free;
end;

procedure TFrmMenu_Geral.Promissoria(Data_Vencimento, Data_Atual: TDate; Valor: Double; Cliente, CPFCNPJ, Endereco: AnsiString);
var
  i, i2, linha, conta: integer;
  vencimento, texto, val, val2, pagavel, cli, cli_cpf, cli_endereco, cli_so: AnsiString;
begin
  if (rs.Paginas = 0) then
    rs.BeginDoc;

  i:= 0;
  i2:= 136;
  linha:= 1;
  conta:= 0;

  vencimento:= 'VENCIMENTO, '+FormatDateTime('DD'+QuotedStr(' DE ')+'MMMM'+QuotedStr(' DE ')+'yyyy',Data_Vencimento); //colocar data do vencimento correto
  texto:= 'AOS '+IntToStr(DayOf(Data_Vencimento)) +' DIAS DO MÊS DE '+FormatDateTime('MMMM',Data_Vencimento)+' DO ANO DE '+IntToStr(YearOf(Data_Vencimento))+', PAGAREI POR ESTA ÚNICA VIA DE NOTA PROMISSÓRIA À ';
  val:= 'OU À SUA ORDEM A QUANTIA DE: *** '+NumeroParaExtenso(Valor)+'***';
  val2:= 'EM MOEDA CORRENTE NACIONAL.';
  pagavel:= 'PAGÁVEL EM: '+trim(Cidade)+'-'+trim(uf);
  cli:= 'EMITENTE: '+Cliente;
  cli_cpf:= 'CPF/CNPJ: '+CPFCNPJ;
  cli_endereco:= 'ENDEREÇO: '+Endereco;
  cli_so:= Cliente;

  rs.WriteFont(linha, Alinha_Centro(vencimento,i2),vencimento, [Bold] + [DobleWide]);
  inc(linha);
  inc(linha);
  rs.WriteFont(linha, 90,'VALOR R$ '+'***'+FormatFloat('#0.0,0',Valor)+'***', [Bold] + [DobleWide]);
  inc(linha);
  rs.WriteFont(linha, i, texto, [Bold] + [DobleWide]);
  inc(linha);
  inc(linha);
  rs.WriteFont(linha, i, razao_social, [Bold] + [DobleWide]);
  inc(linha);
  rs.WriteFont(linha, i, 'CNPJ.: '+CNPJ, [Bold] + [DobleWide]);
  inc(linha);
  inc(linha);
  rs.WriteFont(linha, i, val, [Bold] + [DobleWide]);
  inc(linha);
  rs.WriteFont(linha, i, val2, [Bold] + [DobleWide]);
  inc(linha);
  inc(linha);
  rs.WriteFont(linha, i, pagavel, [Bold] + [DobleWide]);
  inc(linha);
  inc(linha);
  rs.WriteFont(linha, i, cli, [Bold] + [DobleWide]);
  rs.WriteFont(linha, Length(cli)+20, trim(Cidade)+'-'+trim(uf)+', '+FormatDateTime('dd'+QuotedStr(' DE ')+'MMMM'+QuotedStr(' DE ')+'yyyy',Data_Atual), [Bold] + [DobleWide]);
  inc(linha);
  rs.WriteFont(linha, i, cli_cpf, [Bold] + [DobleWide]);
  inc(linha);
  rs.WriteFont(linha, i, cli_endereco, [Bold] + [DobleWide]);
  inc(linha);
  inc(linha);
  inc(linha);
  rs.WriteFont(linha, Alinha_Centro(cli_so,i2),cli_so, [Bold] + [DobleWide]);

  rs.Print;
end;

procedure TFrmMenu_Geral.Ribbon1TabChange(Sender: TObject; const NewIndex,
  OldIndex: Integer; var AllowChange: Boolean);
begin
  //Bloqueia_Funcoes;
end;

//procedure TFrmMenu_Geral.Cancela_Pre_Venda;
{var
  qAux, qAux2, qAux3, qAux4: TADOQuery;
  sCodigo, sDescricao, saliquota, sTipoQtde, sQtde, sValor, sTipo, sDesconto, tipo_desc, valor_desc, unid_med,
  sAcrecimo, cAcreDesc, cTipoAcreDesc, cValorAcreDesc: AnsiString;
  iConta: integer;
  estoque: double;}
//begin
  {try
    Data_Pre_Venda_Cancelada(-1);
    qAux:= TADOQuery.Create(self);
    qAux2:= TADOQuery.Create(self);
    qAux3:= TADOQuery.Create(self);
    qAux4:= TADOQuery.Create(self);

    with qAux3, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select Ped.Codigo, Ped.N_Pre_Venda, Ped.Data_Venda from Pedido Ped');
      add('where Ped.Data_Venda = :Data and Ped.Tipo = :Pre and Ped.Status = :Status');
      Parameters.ParamByName('Data').Value:= dataa;
      Parameters.ParamByName('Pre').Value:= 'PRÉ-VENDA';
      Parameters.ParamByName('Status').Value:= 'PENDENTE';
      open;
    end;

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select P.Codigo, P.Codigo_Venda, P.Descricao, P.Estoque, P.Tipo,');
      add('P.Codigo_Grupo_Tributacao, P.Codigo_Grupo_Tributacao_ISSQN, P.Volume, P.Tipo_Tributacao from Produto P');
      open;
    end;

    if (qAux3.IsEmpty = false) then
    begin
      qAux3.First;
      while not qAux3.Eof do
      begin
        with qAux2, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('select IP.*, P.Codigo_Venda, P.Descricao, P.Tipo,');
          add('P.Codigo_Grupo_Tributacao, P.Codigo_Grupo_Tributacao_ISSQN from Itens_Pedido IP');
          add('inner join Produto P on (IP.Codigo_Produto = P.Codigo)');
          add('where IP.Codigo = :Codigo ');//and IP.Cancelado = :N');
          Parameters.ParamByName('Codigo').Value:= qAux3.FieldByName('Codigo').AsString;
          //Parameters.ParamByName('N').Value:= 'N';
          open;
        end;

        iRetorno:= Bematech_FI_AbreCupom('');
        Analisa_iRetorno;

        while not qAux2.Eof do
        begin
          qAux.Locate('Codigo', qAux2.FieldByName('Codigo_Produto').AsInteger, []);

          //Pega_ICMS_NC(qAux.FieldByName('Codigo_Grupo_Tributacao').AsInteger);
          //Pega_ISS(qAux.FieldByName('Codigo_Grupo_Tributacao_ISSQN').AsInteger);

          sCodigo    := qAux.FieldByName('Codigo_Venda').AsString;
          sDescricao := Copy(qAux.FieldByName('Descricao').AsString,1,29);

          if (qAux2.FieldByName('ICMS').AsString = 'I') then
            sAliquota:= 'I1'
          else if (qAux2.FieldByName('ICMS').AsString = 'N') then
            sAliquota:= 'N1'
          else if (qAux2.FieldByName('ICMS').AsString = 'F') then
            sAliquota:= 'F1'
          else
            sAliquota:= qAux2.FieldByName('ICMS').AsString;

          sTipoQtde  := 'I';
          sQtde      := FormatFloat('#0.0,00', qAux2.FieldByName('Qtde').AsFloat);
          sValor     := FormatFloat('#0.0,00', qAux2.FieldByName('Valor_Unitario').AsFloat);

          if (qAux2.FieldByName('Tipo_Desconto').AsString = '%') then
            sTipo:= '%'
          else
            sTipo:= '$';

          sDesconto  := FormatFloat('#0.0,0', qAux2.FieldByName('Desconto').AsFloat);
          sAcrecimo  := FormatFloat('#0.0,0', qAux2.FieldByName('Acrecimo').AsFloat);
          unid_med:= qAux2.FieldByName('UN').AsString;

          iRetorno:= Bematech_FI_VendeItemDepartamento(PAnsiChar(scodigo), PAnsiChar(sdescricao),
                                                       PAnsiChar(saliquota), PAnsiChar(svalor),
                                                       PAnsiChar(sqtde), PAnsiChar(sAcrecimo),
                                                       PAnsiChar(sdesconto), PAnsiChar('00'), PAnsiChar(unid_med));
          Analisa_iRetorno;

          if (iRetorno = 1) then
          begin
            if (qAux2.FieldByName('Cancelado').AsString = 'S') then
            begin
              iRetorno:= Bematech_FI_CancelaItemAnterior;
              Analisa_iRetorno;
            end;
          end;

          qAux2.Next;
        end;

        cTipoAcreDesc:= '$';
        cAcreDesc:= 'D';
        cValorAcreDesc:= '0,00';
        iRetorno:= Bematech_FI_IniciaFechamentoCupom(PAnsiChar(cAcreDesc), PAnsiChar(cTipoAcreDesc), PAnsiChar(cValorAcreDesc));
        Analisa_iRetorno;

        iRetorno:= Bematech_FI_TerminaFechamentoCupom(#13+#10 + pMD5_Arquivos +
                                                      #13+#10 + 'PV' + qAux3.FieldByName('N_Pre_Venda').AsString);
        if (iRetorno = 1) then
        begin
          den_op:= 'RV';
          Coleta_Dados_R06;
          R06.Inserir_Outros(R06);
          R06.Inserir_Outros_Aux(R06);
        end;

        //iRetorno:= Bematech_FI_CancelaCupom;

        //AlteraGT;

        with qAux4, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('update Pedido set Status = :Status');
          add('where N_Pre_Venda = :N_Pre_Venda');
          Parameters.ParamByName('Status').Value:= 'CANCELADO';
          Parameters.ParamByName('N_Pre_Venda').Value:= qAux3.FieldByName('N_Pre_Venda').AsString;
          ExecSQL;
        end;

        qAux3.Next;
      end;
    end;
  finally
    FreeAndNil(qAux);
    FreeAndNil(qAux2);
    FreeAndNil(qAux3);
    FreeAndNil(qAux4);
  end; }
//end;

procedure TFrmMenu_Geral.Clientes1Click(Sender: TObject);
begin
  if (sem_rede = true) then
    Verifica_Rede;
  if (Habilitado = true) then
  begin
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end
  else
    UDeclaracao.Mensagem_Erro;
end;

procedure TFrmMenu_Geral.Cria01(Data: TDate);
var
  hora, fdata, data2: Ansistring;
  data3: TDAte;
begin
    //Versao_Impressora;
    ECF.Pega_Versao_Impressora;
    Busca_Dados_SoftwareHouse;

    cnpj_usu:= StringReplace(cnpj, '.', '', [rfReplaceAll]);
    cnpj_usu:= StringReplace(cnpj, '/', '', [rfReplaceAll]);
    cnpj_usu:= StringReplace(cnpj, '-', '', [rfReplaceAll]);
    insc_est_usu:= StringReplace(insc_estadual, '-', '', [rfReplaceAll]);
    insc_est_usu:= StringReplace(insc_estadual, '.', '', [rfReplaceAll]);

    cnpj_des:= StringReplace(cnpj_des, '.', '', [rfReplaceAll]);
    cnpj_des:= StringReplace(cnpj_des, '\', '', [rfReplaceAll]);
    cnpj_des:= StringReplace(cnpj_des, '-', '', [rfReplaceAll]);
    insc_est_des:= StringReplace(insc_est_des, '-', '', [rfReplaceAll]);
    insc_est_des:= StringReplace(insc_est_des, '.', '', [rfReplaceAll]);
    insc_mun_des:= StringReplace(insc_mun_des, '-', '', [rfReplaceAll]);
    insc_mun_des:= StringReplace(insc_mun_des, '.', '', [rfReplaceAll]);

    versao_paf:= StringReplace(versao_paf, '.', '', [rfReplaceAll]);
    versao_er_paf:= StringReplace(versao_er_paf, '.', '', [rfReplaceAll]);

    fdata:= data_gra;
    //data2:= Copy(fdata, 1,10);
    //hora:= copy(fdata,12,8);
    //data3:= StrToDateTime(data2);

    data2:= FormatDateTime('YYYYMMDD', StrToDateTime(fdata));
    //hora:= FormatDateTime('HHMMSS', StrToTime(hora));
    hora:= '      ';

    d_ini:= FormatDateTime('YYYYMMDD', Data);
    d_fim:= FormatDateTime('YYYYMMDD', Data);

    writeln(sArquivo, 'R01' + nu_serie + StringOfChar(' ', 20-Length(nu_serie)) +
                              mf + StringOfChar(' ', 1-Length(mf)) +
                              tipo + StringOfChar(' ', 7-Length(tipo)) +
                              marca + StringOfChar(' ', 20-Length(marca)) +
                              smodelo + StringOfChar(' ', 20-Length(smodelo)) +
                              versao_sb + StringOfChar(' ', 10-Length(versao_sb)) +
                              data2 + StringOfChar(' ', 8-Length(data2)) +
                              hora + StringOfChar(' ', 6-Length(hora)) +
                              StringOfChar('0', 3-Length(sequencia)) + sequencia +
                              StringOfChar('0', 14-Length(cnpj_usu)) + cnpj_usu +
                              insc_est_usu + StringOfChar(' ', 14-Length(insc_est_usu)) +
                              StringOfChar('0', 14-Length(cnpj_des)) + cnpj_des +
                              StringOfChar('0', 14-Length(insc_est_des)) + insc_est_des +
                              StringOfChar('0', 14-Length(insc_mun_des)) + insc_mun_des +
                              deno_des + StringOfChar(' ', 40-Length(deno_des)) +
                              nome_paf + StringOfChar(' ', 40-Length(nome_paf)) +
                              versao_paf + StringOfChar(' ', 10-Length(versao_paf)) +
                              pMD5 + StringOfChar(' ', 32-Length(pMD5)) +
                              d_ini + StringOfChar(' ', 8-Length(d_ini)) +
                              d_fim + StringOfChar(' ', 8-Length(d_fim)) +
                              versao_er_paf + StringOfChar(' ', 4-Length(versao_er_paf)));
end;

procedure TFrmMenu_Geral.Cria02(Data: TDate);
var
  qAux: TADOQuery;
  fdata: TDate;
  data_red1, data_red2, data_red3, data_movimento: AnsiString;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select * from R02 where Data_Movimento = :D and Caixa = :Caixa');
      Parameters.ParamByName('D').Value:= Data;
      Parameters.ParamByName('Caixa').Value:= Caix;
      open;
    end;
    qAux.First;
    while not qAux.Eof do
    begin
      n_serie:= qAux.FieldByName('N_Fabricacao').AsString;
      mfad:= qAux.FieldByName('MF_Adicional').AsString;
      modeloecf:= qAux.FieldByName('Modelo_ECF').AsString;
      n_usu:= qAux.FieldByName('N_Usuario').AsString;
      crz:= qAux.FieldByName('CRZ').AsString;
      coo:= qAux.FieldByName('COO').AsString;
      cro:= qAux.FieldByName('CRO').AsString;

      data_movimento:= FormatDateTime('YYYYMMDD', qAux.FieldByName('Data_Movimento').AsDateTime);
      data_red1:= copy(qAux.FieldByName('Data_Emissao').Value, 1,2);
      data_red1:= data_red1 + '/';
      data_red2:= copy(qAux.FieldByName('Data_Emissao').Value, 3,2);
      data_red2:= data_red1 + data_red2 + '/';
      data_red3:= copy(qAux.FieldByName('Data_Emissao').Value, 5,2);
      data_red3:= data_red2 + data_red3;

      data_reducao:= FormatDateTime('YYYYMMDD', StrToDate(data_red3));
      hora_reducao:= qAux.FieldByName('Hora_Emissao').Value;
      venda_bruta_diaria:= qAux.FieldByName('Venda_Bruta_Diaria').AsString;
      venda_bruta_diaria:= copy(venda_bruta_diaria,5,14);
      issqn:= qAux.FieldByName('Parametro_ECF').AsString;

      writeln(sArquivo, 'R02' + n_serie + StringOfChar(' ', 20-Length(n_serie)) +
                                mfad + StringOfChar(' ', 1-Length(mfad)) +
                                modeloecf + StringOfChar(' ', 20-Length(modeloecf)) +
                                StringOfChar('0', 2-Length(n_usu)) + n_usu +
                                StringOfChar('0', 6-Length(crz)) + crz +
                                StringOfChar('0', 6-Length(coo)) + coo +
                                StringOfChar('0', 6-Length(cro)) + cro +
                                data_movimento + StringOfChar(' ', 8-Length(data_movimento)) +
                                data_reducao + StringOfChar(' ', 8-Length(data_reducao)) +
                                hora_reducao + StringOfChar(' ', 6-Length(hora_reducao)) +
                                StringOfChar('0', 14-Length(venda_bruta_diaria)) + venda_bruta_diaria +
                                issqn + StringOfChar(' ', 1-Length(issqn)));
        qAux.Next;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmMenu_Geral.Cria03(Data: TDate);
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
      add('select * from R03 where Data_Movimento = :D and Caixa = :Caixa');
      Parameters.ParamByName('D').Value:= Data;
      Parameters.ParamByName('Caixa').Value:= Caix;
      open;
    end;
    qAux.First;
    while not qAux.Eof do
    begin
      n_serie:= qAux.FieldByName('N_Fabricacao').AsString;
      mfad:= qAux.FieldByName('MF_Adicional').AsString;
      modeloecf:= qAux.FieldByName('Modelo_ECF').AsString;
      n_usu:= qAux.FieldByName('N_Usuario').AsString;
      crz:= qAux.FieldByName('CRZ').AsString;
      cBuffer:= qAux.FieldByName('Totalizador_Parcial').AsString;
      cTotalizador:= qAux.FieldByName('Valor_Acumulado').AsString;
      cTotalizador:= Copy(cTotalizador,2,13);
      writeln(sArquivo, 'R03' + n_serie + StringOfChar(' ', 20-Length(n_serie)) +
                                mfad + StringOfChar(' ', 1-Length(mfad)) +
                                modeloecf + StringOfChar(' ', 20-Length(modeloecf)) +
                                StringOfChar('0', 2-Length(n_usu)) + n_usu +
                                StringOfChar('0', 6-Length(crz)) + crz +
                                cBuffer + StringOfChar(' ', 7-Length(cBuffer)) +
                                StringOfChar('0', 13-Length(cTotalizador)) + cTotalizador);
      qAux.Next;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmMenu_Geral.Cria04(Data: TDate);
var
  qAux: TADOQuery;
  data_red1, data_red2, data_red3: AnsiString;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select * from R04 where Data_Movimento = :D and Caixa = :Caixa');
      Parameters.ParamByName('D').Value:= Data;
      Parameters.ParamByName('Caixa').Value:= Caix;
      open;
    end;
    qAux.First;

    while not qAux.Eof do
    begin
      n_serie:= qAux.FieldByName('N_Fabricacao').AsString;
      mfad:= qAux.FieldByName('MF_Adicional').AsString;
      modeloecf:= qAux.FieldByName('Modelo_ECF').AsString;
      n_usu:= qAux.FieldByName('N_Usuario').AsString;
      ccf:= qAux.FieldByName('CCF').AsString;
      coo:= qAux.FieldByName('COO').AsString;

      if (qAux.FieldByName('Data_Inicio_Emissao').Value = '') then
        data_emissao:= ''
      else
      begin
        data_red1:= copy(qAux.FieldByName('Data_Inicio_Emissao').Value, 1,2);
        data_red1:= data_red1 + '/';
        data_red2:= copy(qAux.FieldByName('Data_Inicio_Emissao').Value, 3,2);
        data_red2:= data_red1 + data_red2 + '/';
        data_red3:= copy(qAux.FieldByName('Data_Inicio_Emissao').Value, 5,2);
        data_red3:= data_red2 + data_red3;
        data_emissao:= FormatDateTime('YYYYMMDD', StrToDate(data_red3));
      end;

      subtotal:= StringReplace(qAux.FieldByName('Sub_Total_Documento').AsString, ',', '', [rfReplaceAll]);
      desconto_subtotal:= StringReplace(qAux.FieldByName('Desconto').AsString, ',', '', [rfReplaceAll]);
      indicador_tipo_desc:= qAux.FieldByName('Tipo_Desconto').AsString;
      acreci:= StringReplace(qAux.FieldByName('Acrecimo').AsString, ',', '', [rfReplaceAll]);
      indicador_tipo_acreci:= qAux.FieldByName('Tipo_Acrecimo').AsString;
      valor_total:= StringReplace(qAux.FieldByName('Valor_Total').AsString, ',','',[rfReplaceAll]);
      indicador_cancelamento:= qAux.FieldByName('Cancelamento').AsString;
      valor_can_acre:= StringReplace(qAux.FieldByName('Valor_Cancelamento_Acrecimo').AsString, ',','',[rfReplaceAll]);
      indicador_desc_acre:= qAux.FieldByName('Indicador_Acre_Desc').AsString;
      adquirente:= qAux.FieldByName('Adquirente').AsString;
      cnpj_adquirente:= qAux.FieldByName('CPF_CNPJ').AsString;

      writeln(sArquivo, 'R04' + n_serie + StringOfChar(' ', 20-Length(n_serie)) +
                                mfad + StringOfChar(' ', 1-Length(mfad)) +
                                modeloecf + StringOfChar(' ', 20-Length(modeloecf)) +
                                StringOfChar('0', 2-Length(n_usu)) + n_usu +
                                StringOfChar('0', 6-Length(ccf)) + ccf +
                                StringOfChar('0', 6-Length(coo)) + coo +
                                data_emissao + StringOfChar(' ', 8-Length(data_emissao)) +
                                StringOfChar('0', 14-Length(subtotal)) + subtotal +
                                StringOfChar('0', 13-Length(desconto_subtotal)) + desconto_subtotal +
                                indicador_tipo_desc + StringOfChar(' ', 1-Length(indicador_tipo_desc)) +
                                StringOfChar('0', 13-Length(acreci)) + acreci +
                                indicador_tipo_acreci + StringOfChar(' ', 1-Length(indicador_tipo_acreci)) +
                                StringOfChar('0', 14-Length(valor_total)) + valor_total +
                                indicador_cancelamento + StringOfChar(' ', 1-Length(indicador_cancelamento)) +
                                StringOfChar('0', 13-Length(valor_can_acre)) + valor_can_acre +
                                indicador_desc_acre + StringOfChar(' ', 1-Length(indicador_desc_acre)) +
                                adquirente + StringOfChar(' ', 40-Length(adquirente)) +
                                StringOfChar('0', 14-Length(cnpj_adquirente)) + cnpj_adquirente);
      qAux.Next;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmMenu_Geral.Cria05(Data: TDate);
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
      add('select * from R05 where Data_Movimento = :D and Caixa = :Caixa');
      Parameters.ParamByName('D').Value:= Data;
      Parameters.ParamByName('Caixa').Value:= Caix;
      open;
    end;
    qAux.First;
    while not qAux.Eof do
    begin
      n_serie:= qAux.FieldByName('N_Fabricacao').AsString;
      mfad:= qAux.FieldByName('MF_Adicional').AsString;
      modeloecf:= qAux.FieldByName('Modelo_ECF').AsString;
      n_usu:= qAux.FieldByName('N_Usuario').AsString;
      coo:= qAux.FieldByName('COO').AsString;
      ccf:= qAux.FieldByName('CCF').AsString;
      n_item:= qAux.FieldByName('N_Item').AsString;
      n_item:= Copy(n_item,2,3);
      cod_prod:= qAux.FieldByName('Codigo_Produto').AsString;
      descricao:= qAux.FieldByName('Descricao').AsString;
      qtde:= StringReplace(qAux.FieldByName('Quantidade').AsString, ',','',[rfReplaceAll]);
      unid:= qAux.FieldByName('Unidade').AsString;
      valor_un:= StringReplace(qAux.FieldByName('Valor_Unitario').AsString, ',','',[rfReplaceAll]);
      desc_item:= StringReplace(qAux.FieldByName('Desconto').AsString, ',','',[rfReplaceAll]);
      acre_item:= StringReplace(qAux.FieldByName('Acrecimo').AsString, ',','',[rfReplaceAll]);
      valor_total_item:= StringReplace(qAux.FieldByName('Valor_Total').AsString, ',','',[rfReplaceAll]);
      tot_par:= qAux.FieldByName('Totalizador_Parcial').AsString;
      indicador_cancelamento_item:= qAux.FieldByName('Cancelamento').AsString;
      qtde_cancelada:= StringReplace(qAux.FieldByName('Quantidade_Cancelada').AsString, ',','',[rfReplaceAll]);
      valor_cancelado:= StringReplace(qAux.FieldByName('Valor_Cancelado').AsString, ',','',[rfReplaceAll]);
      can_acre:= StringReplace(qAux.FieldByName('Valor_Cancelamento_Acrecimo').AsString, ',','',[rfReplaceAll]);
      IAT:= qAux.FieldByName('IAT').AsString;
      IPPT:= qAux.FieldByName('IPPT').AsString;
      casa_decimal_qtde:= qAux.FieldByName('Casas_Decimais_Qtde').AsString;
      casa_decimal_val_un:= qAux.FieldByName('Casas_Decimais_Valor_Unitario').AsString;

      writeln(sArquivo, 'R05' + n_serie + StringOfChar(' ', 20-Length(n_serie)) +
                                mfad + StringOfChar(' ', 1-Length(mfad)) +
                                modeloecf + StringOfChar(' ', 20-Length(modeloecf)) +
                                StringOfChar('0', 2-Length(n_usu)) + n_usu +
                                StringOfChar('0', 6-Length(coo)) + coo +
                                StringOfChar('0', 6-Length(ccf)) + ccf +
                                StringOfChar('0', 3-Length(n_item)) + n_item +
                                cod_prod + StringOfChar(' ', 14-Length(cod_prod)) +
                                descricao + StringOfChar(' ', 100-Length(descricao)) +
                                StringOfChar('0', 7-Length(qtde)) + qtde +
                                unid + StringOfChar(' ', 3-Length(unid)) +
                                StringOfChar('0', 8-Length(valor_un)) + valor_un +
                                StringOfChar('0', 8-Length(desc_item)) + desc_item +
                                StringOfChar('0', 8-Length(acre_item)) + acre_item +
                                StringOfChar('0', 14-Length(valor_total_item)) + valor_total_item +
                                tot_par + StringOfChar(' ', 7-Length(tot_par)) +
                                indicador_cancelamento_item + StringOfChar(' ', 1-Length(indicador_cancelamento_item)) +
                                StringOfChar('0', 7-Length(qtde_cancelada)) + qtde_cancelada +
                                StringOfChar('0', 13-Length(valor_cancelado)) + valor_cancelado +
                                StringOfChar('0', 13-Length(can_acre)) + can_acre +
                                IAT + StringOfChar(' ', 1-Length(IAT)) +
                                IPPT + StringOfChar(' ', 1-Length(IPPT)) +
                                StringOfChar('0', 1-Length(casa_decimal_qtde)) + casa_decimal_qtde +
                                StringOfChar('0', 1-Length(casa_decimal_val_un)) + casa_decimal_val_un);
      qAux.Next;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmMenu_Geral.Cria06(Data: TDate);
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
      add('select * from R06 where Data_Movimento = :D and Caixa = :Caixa');
      Parameters.ParamByName('D').Value:= Data;
      Parameters.ParamByName('Caixa').Value:= Caix;
      open;
    end;
    qAux.First;
    while not qAux.Eof do
    begin
      n_serie:= qAux.FieldByName('N_Fabricacao').AsString;
      mfad:= qAux.FieldByName('MF_Adicional').AsString;
      modeloecf:= qAux.FieldByName('Modelo_ECF').AsString;
      n_usu:= qAux.FieldByName('N_Usuario').AsString;
      coo:= qAux.FieldByName('COO').AsString;
      gnf:= qAux.FieldByName('GNF').AsString;
      grg:= qAux.FieldByName('GRG').AsString;
      cdc:= qAux.FieldByName('CDC').AsString;
      denominacao:= qAux.FieldByName('Denominacao').AsString;

      //ver data final emissão
      data_final_emissao:= FormatDateTime('YYYYMMDD', qAux.FieldByName('Data_Final_Emissao').Value);
      hora_final_emissao:= qAux.FieldByName('Hora_Final_Emissao').AsString;

      writeln(sArquivo, 'R06' + n_serie + StringOfChar(' ', 20-Length(n_serie)) +
                                mfad + StringOfChar(' ', 1-Length(mfad)) +
                                modeloecf + StringOfChar(' ', 20-Length(modeloecf)) +
                                StringOfChar('0', 2-Length(n_usu)) + n_usu +
                                StringOfChar('0', 6-Length(coo)) + coo +
                                StringOfChar('0', 6-Length(gnf)) + gnf +
                                StringOfChar('0', 6-Length(grg)) + grg +
                                StringOfChar('0', 4-Length(cdc)) + cdc +
                                denominacao + StringOfChar(' ', 2-Length(denominacao)) +
                                data_final_emissao + StringOfChar(' ', 8-Length(data_final_emissao)) +
                                hora_final_emissao + StringOfChar(' ', 6-Length(hora_final_emissao)));
      qAux.Next;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmMenu_Geral.Cria07(Data: TDate);
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
      add('select * from R07 where Data_Movimento = :D and Caixa = :Caixa');
      Parameters.ParamByName('D').Value:= Data;
      Parameters.ParamByName('Caixa').Value:= Caix;
      open;
    end;
    qAux.First;
    while not qAux.Eof do
    begin

      n_serie:= qAux.FieldByName('N_Fabricacao').AsString;
      mfad:= qAux.FieldByName('MF_Adicional').AsString;
      modeloecf:= qAux.FieldByName('Modelo_ECF').AsString;
      n_usu:= qAux.FieldByName('N_Usuario').AsString;
      coo:= qAux.FieldByName('COO').AsString;
      ccf:= qAux.FieldByName('CCF').AsString;
      gnf:= qAux.FieldByName('GNF').AsString;
      meio_pagamento:= qAux.FieldByName('Meio_Pagamento').AsString;
      valor_pago:= StringReplace(qAux.FieldByName('Valor_Pago').AsString, ',','',[rfReplaceAll]);
      estorno:= qAux.FieldByName('Estorno').AsString;
      valor_estornado:= StringReplace(qAux.FieldByName('Valor_Estorno').AsString, ',','',[rfReplaceAll]);

      writeln(sArquivo, 'R07' + n_serie + StringOfChar(' ', 20-Length(n_serie)) +
                                mfad + StringOfChar(' ', 1-Length(mfad)) +
                                modeloecf + StringOfChar(' ', 20-Length(modeloecf)) +
                                StringOfChar('0', 2-Length(n_usu)) + n_usu +
                                StringOfChar('0', 6-Length(coo)) + coo +
                                StringOfChar('0', 6-Length(ccf)) + ccf +
                                StringOfChar('0', 6-Length(gnf)) + gnf +
                                meio_pagamento + StringOfChar(' ', 15-Length(meio_pagamento)) +
                                StringOfChar('0', 13-Length(valor_pago)) + valor_pago +
                                estorno + StringOfChar(' ', 1-Length(estorno)) +
                                StringOfChar('0', 13-Length(valor_estornado)) + valor_estornado);
      qAux.Next;
    end;
    write(sArquivo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmMenu_Geral.Timer1Timer(Sender: TObject);
var
  hora: string;
begin
  //StbStatus.Panels[4].Text := TimeToStr(time);

  case DayOfWeek(date) of
    1:
      StbStatus.Panels[3].Text := 'Domingo, ' + DateToStr(date);
    2:
      StbStatus.Panels[3].Text := 'Segunda Feira, ' + DateToStr(date);
    3:
      StbStatus.Panels[3].Text := 'Terça Feira, ' + DateToStr(date);
    4:
      StbStatus.Panels[3].Text := 'Quarta Feira, ' + DateToStr(date);
    5:
      StbStatus.Panels[3].Text := 'Quinta Feira, ' + DateToStr(date);
    6:
      StbStatus.Panels[3].Text := 'Sexta Feira, ' + DateToStr(date);
    7:
      StbStatus.Panels[3].Text := 'Sábado, ' + DateToStr(date);
  end;

  hora := TimeToStr(time);
  delete(hora, 3, 6);

  if (StrToInt(hora) >= 0) and (StrToInt(hora) < 12) then
    StbStatus.Panels[2].Text := 'Bom Dia'
  else if (StrToInt(hora) >= 12) and (StrToInt(hora) < 18) then
    StbStatus.Panels[2].Text := 'Boa Tarde'
  else
    StbStatus.Panels[2].Text := 'Boa Noite';
end;

procedure TFrmMenu_Geral.Timer2Timer(Sender: TObject);
begin
  {if (dm.ACBrECF1.PoucoPapel) then
  begin
    FrmMenu_Geral.StbStatus.Panels[6].Text := 'Status da bobina: Pouco Papel';
  end
  else
  begin
    FrmMenu_Geral.StbStatus.Panels[6].Text := 'Status da bobina: Normal';
  end;}
  //Verifica_Erros_Ao_Gerar_Cupom;
end;

procedure TFrmMenu_Geral.Timer3Timer(Sender: TObject);
begin
  {if (FileExists(caminho_servidor + 'Prod' + maq + '.txt')) then
  begin
    Inicializa_Dados_Principais_Movimentacao(0, dm.qrychama_produto);
    DeleteFile(caminho_servidor + 'Prod' + maq + '.txt');
  end;

  if (FileExists(caminho_servidor + 'Cli' + maq + '.txt')) then
  begin
    Inicializa_Dados_Principais_Movimentacao(1, dm.qrychama_cliente);
    DeleteFile(caminho_servidor + 'Cli' + maq + '.txt');
  end;

  if (FileExists(caminho_servidor + 'CondPag' + maq + '.txt')) then
  begin
    Inicializa_Dados_Principais_Movimentacao(2, dm.qrychama_condicao);
    DeleteFile(caminho_servidor + 'CondPag' + maq + '.txt');
  end;}

  //if (Verifica_Status_Rede(ipservidor)) then
  //inc(ContaTempo);
  {if (tipo_local = '0101') then
  begin
    //if (Verifica_Status_Rede(ipservidor)) then
    //begin
      try
        Carrega_Dados_Servidor;
        BBtnReconectar.Visible:= false;
        sem_rede:= false;
      except on e:Exception do
      begin
        BBtnReconectar.Visible:= true;
        Timer3.Enabled:= False;
        sem_rede:= true;
        ShowMessage('Falha: '+e.Message);

        //if (tipo_local = '0101') then
        //begin
          if Abre_Conexao_Local(dm.ADOConnectionLocal) = false then
          begin
            Erro_Comunicacao_Servidor_Local;
            //nao_conectou:= true;
          end;

          Inicializa_Dados_Principais_Movimentacao(5, dm.qryvenda);
          Inicializa_Dados_Principais_Movimentacao(6, dm.qryitens_venda);
          Inicializa_Dados_Principais_Movimentacao(9, dm.qrycontrola_codigo);
          Inicializa_Dados_Principais_Movimentacao(7, dm.qryr05);
          Inicializa_Dados_Principais_Movimentacao(11, dm.qryr04);
          Inicializa_Dados_Principais_Movimentacao(12, dm.qryr07);
          Inicializa_Dados_Principais_Movimentacao(13, dm.qryR06);
          Inicializa_Dados_Principais_Movimentacao(14, dm.qryfechamento_venda_aux);
        //end;
      end;
      end;
    //end
    //else
    //begin
      //dm.qrychama_produto.Connection:= dm.ADOConnectionLocal;
      //Atualiza_Produto(4, '');
    //end;
  end;}

  //else
    //Application.MessageBox('Caiu a rede', 'Erro de rede', MB_OK+MB_ICONHAND);
  {if (FileExists(caminho_servidor + 'Cli.txt')) then
    Inicializa_Dados_Principais_Movimentacao(1, dm.CDSChama_Cliente, dm.qrychama_cliente);

  if (FileExists(caminho_servidor + 'CondPag.txt')) then
    Inicializa_Dados_Principais_Movimentacao(2, dm.CDSChama_Condicao, dm.qrychama_condicao)}
end;

procedure TFrmMenu_Geral.Timer4Timer(Sender: TObject);
begin
  Bloqueia_Funcoes;
end;

procedure TFrmMenu_Geral.Timer5Timer(Sender: TObject);
begin
  Inc(Tempo);
  if (Tempo = 20) then
  begin
    LblLocalGravacao.Caption:= '';
    Timer5.Enabled:= False;
  end;
end;

end.


