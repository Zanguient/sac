unit UPedido_Venda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids,
  DBGrids, UGeral, URegistro,
  ExtCtrls, Provider, DBClient, Buttons, StrUtils, Math, RSPrint, AppEvnts,
  DateUtils,
  DBCtrls, Modelo.Entidade.DocumentosFinanceiro.TListaSeparacaoEntidade,
  Modelo.Entidade.DocumentosFinanceiro.TListaSeparacaoLista,
  Modelo.Entidade.Cliente.TCliente, Modelo.Dominio.Cliente.TClienteDominio,
  Util.Configs,
  Modelo.Dominio.Tributacao.TTributacaoDominio,
  Modelo.Entidade.Tributacao.TTributacaoEntidade;

type
  // THack = class(TDBGrid);
  TFrmPedido_Venda = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ImgImagens_Comandos: TImageList;
    EdtCodigo: TEdit;
    LblNome: TLabel;
    EdtCodigo_Cliente: TEdit;
    EdtCliente: TEdit;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    EdtCodigo_Produto: TEdit;
    EdtProduto: TEdit;
    Label6: TLabel;
    EdtUnidade: TEdit;
    Label7: TLabel;
    EdtQuantidade: TEdit;
    Label8: TLabel;
    EdtValor_Unitario: TEdit;
    Label9: TLabel;
    EdtValor_Total: TEdit;
    Label11: TLabel;
    EdtN_Pedido: TEdit;
    TlbFerramentas: TToolBar;
    BBtnOrcamento: TToolButton;
    BBtnFechar: TToolButton;
    BalloonHint1: TBalloonHint;
    LblProduto: TLabel;
    qAux: TADOQuery;
    qAux2: TADOQuery;
    Label13: TLabel;
    EdtDesc_Acr: TEdit;
    LblCPF: TLabel;
    LblEndereco: TLabel;
    LblSetor: TLabel;
    LblTelefone: TLabel;
    LblCidade: TLabel;
    LblUF: TLabel;
    LblTipo_Logradouro: TLabel;
    LblNumero: TLabel;
    ds_itens_venda: TDataSource;
    qryitens_venda: TADOQuery;
    qryvenda: TADOQuery;
    qryvendaCodigo: TAutoIncField;
    qryvendaN_Pedido: TStringField;
    qryvendaCOO: TStringField;
    qryvendaCOO_Vin: TStringField;
    qryvendaCodigo_Cliente: TIntegerField;
    qryvendaCodigo_Condicao_Pagamento: TIntegerField;
    qryvendaCodigo_Empresa: TIntegerField;
    qryvendaOutras_Despesas: TFloatField;
    qryvendaTipo_Frete: TStringField;
    qryvendaValor_Frete: TFloatField;
    qryvendaData_Venda: TDateTimeField;
    qryvendaData_Previsao_Entrega: TDateTimeField;
    qryvendaHora_Entrega: TStringField;
    qryvendaQtde_Itens: TIntegerField;
    qryvendaTotal_Produtos: TFloatField;
    qryvendaPeso_Total: TFloatField;
    qryvendaDesconto: TFloatField;
    qryvendaTipo_Desconto: TStringField;
    qryvendaTotal_Pedido: TFloatField;
    qryvendaTipo: TStringField;
    qryvendaStatus: TStringField;
    qryvendaValor_Recebido: TFloatField;
    qryvendaTroco: TFloatField;
    qryvendaObservacoes: TStringField;
    qryvendaNome_Nome_Fantasia: TStringField;
    qryvendaCPF: TStringField;
    qryvendaDescricao: TStringField;
    DataSource1: TDataSource;
    qryitens_os: TADOQuery;
    qryvendaCCF: TStringField;
    qryvendaCodigo_Veiculo: TIntegerField;
    qryvendaTotal_Servicos: TFloatField;
    qryvendaQtde_Servicos: TIntegerField;
    qryvendaAcrecimo: TFloatField;
    qryvendaTipo_Acrecimo: TStringField;
    EdtST: TEdit;
    Label16: TLabel;
    qAux3: TADOQuery;
    qryvendaTotal_Desconto: TFloatField;
    qryvendaTotal_Acrecimo: TFloatField;
    BBtnConverter_Pre_Venda: TToolButton;
    LblBase_Reducao: TLabel;
    BBtnCopiar_DAV: TToolButton;
    LblTipo: TLabel;
    DBGrid2: TDBGrid;
    BBtnAnalisa_Venda: TToolButton;
    qryitens_vendaCodigo: TIntegerField;
    qryitens_vendaN_Item: TStringField;
    qryitens_vendaCodigo_Produto: TIntegerField;
    qryitens_vendaCodigo_Venda: TStringField;
    qryitens_vendaDescricao: TStringField;
    qryitens_vendaNCM: TStringField;
    qryitens_vendaOrigem: TStringField;
    qryitens_vendaCFOP: TStringField;
    qryitens_vendaUN: TStringField;
    qryitens_vendaTipo_Calculo_BC_ICMS: TStringField;
    qryitens_vendaTipo_Recolhimento: TStringField;
    qryitens_vendaICMS: TStringField;
    qryitens_vendaCST: TStringField;
    qryitens_vendaCSOSN: TStringField;
    qryitens_vendaBase_Reduzida: TStringField;
    qryitens_vendaBC: TStringField;
    qryitens_vendaValor_ICMS: TStringField;
    qryitens_vendaTipo_Calculo_BC_ICMS_ST: TStringField;
    qryitens_vendaMVAST: TStringField;
    qryitens_vendaICMS_ST: TStringField;
    qryitens_vendaCST_ST: TStringField;
    qryitens_vendaBase_Reduzida_ST: TStringField;
    qryitens_vendaBase_Acrescida_ST: TStringField;
    qryitens_vendaBC_ST: TStringField;
    qryitens_vendaAliquota_Calculo_Credito: TStringField;
    qryitens_vendaCredito_ICMS: TStringField;
    qryitens_vendaTipo_Calculo_IPI: TStringField;
    qryitens_vendaIPI: TStringField;
    qryitens_vendaCST_IPI: TStringField;
    qryitens_vendaBase_Reduzida_IPI: TStringField;
    qryitens_vendaBase_Acrescida_IPI: TStringField;
    qryitens_vendaBC_IPI: TStringField;
    qryitens_vendaValor_IPI: TFloatField;
    qryitens_vendaTipo_Calculo_PIS: TStringField;
    qryitens_vendaPIS: TStringField;
    qryitens_vendaCST_PIS: TStringField;
    qryitens_vendaBase_Reduzida_PIS: TStringField;
    qryitens_vendaBase_Acrescida_PIS: TStringField;
    qryitens_vendaBC_PIS: TStringField;
    qryitens_vendaValor_PIS: TFloatField;
    qryitens_vendaTipo_Calculo_COFINS: TStringField;
    qryitens_vendaCOFINS: TStringField;
    qryitens_vendaCST_COFINS: TStringField;
    qryitens_vendaBase_Reduzida_COFINS: TStringField;
    qryitens_vendaBase_Acrescida_COFINS: TStringField;
    qryitens_vendaBC_COFINS: TStringField;
    qryitens_vendaValor_COFINS: TFloatField;
    qryitens_vendaQtde: TFloatField;
    qryitens_vendaValor_Unitario: TFloatField;
    qryitens_vendaValor_Frete: TFloatField;
    qryitens_vendaValor_Seguro: TFloatField;
    qryitens_vendaOutras_Despesas: TFloatField;
    qryitens_vendaSub_Total: TFloatField;
    qryitens_vendaSub_Total_Liquido: TFloatField;
    qryitens_vendaCancelado: TStringField;
    qryitens_vendaIndica_Valor_Total: TStringField;
    LblNCM: TLabel;
    qryitens_vendaDesc_Acr: TFloatField;
    qryitens_vendaTipo_Desc_Acr: TStringField;
    qryitens_vendaCodigo_Registro: TAutoIncField;
    ApplicationEvents1: TApplicationEvents;
    Button1: TButton;
    qryitens_vendaMarca: TStringField;
    qryitens_vendaValor_Original: TFloatField;
    qryitens_vendaValor_Compra: TFloatField;
    EdtCusto_Total: TEdit;
    EdtVenda_Total: TEdit;
    EdtPerc_Total: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    qAux_Separacao: TADOQuery;
    qAux_SeparacaoCodigo_Registro: TAutoIncField;
    qAux_SeparacaoCodigo: TIntegerField;
    qAux_SeparacaoN_Item: TStringField;
    qAux_SeparacaoCodigo_Produto: TIntegerField;
    qAux_SeparacaoCodigo_Venda: TStringField;
    qAux_SeparacaoDescricao: TStringField;
    qAux_SeparacaoNCM: TStringField;
    qAux_SeparacaoOrigem: TStringField;
    qAux_SeparacaoCFOP: TStringField;
    qAux_SeparacaoUN: TStringField;
    qAux_SeparacaoTipo_Calculo_BC_ICMS: TStringField;
    qAux_SeparacaoTipo_Recolhimento: TStringField;
    qAux_SeparacaoICMS: TStringField;
    qAux_SeparacaoCST: TStringField;
    qAux_SeparacaoCSOSN: TStringField;
    qAux_SeparacaoBase_Reduzida: TStringField;
    qAux_SeparacaoBase_Acrescida: TStringField;
    qAux_SeparacaoBC: TStringField;
    qAux_SeparacaoValor_ICMS: TStringField;
    qAux_SeparacaoTipo_Calculo_BC_ICMS_ST: TStringField;
    qAux_SeparacaoMVAST: TStringField;
    qAux_SeparacaoICMS_ST: TStringField;
    qAux_SeparacaoCST_ST: TStringField;
    qAux_SeparacaoBase_Reduzida_ST: TStringField;
    qAux_SeparacaoBase_Acrescida_ST: TStringField;
    qAux_SeparacaoBC_ST: TStringField;
    qAux_SeparacaoValor_ICMS_ST: TStringField;
    qAux_SeparacaoAliquota_Calculo_Credito: TStringField;
    qAux_SeparacaoCredito_ICMS: TStringField;
    qAux_SeparacaoTipo_Calculo_IPI: TStringField;
    qAux_SeparacaoIPI: TStringField;
    qAux_SeparacaoCST_IPI: TStringField;
    qAux_SeparacaoBase_Reduzida_IPI: TStringField;
    qAux_SeparacaoBase_Acrescida_IPI: TStringField;
    qAux_SeparacaoBC_IPI: TStringField;
    qAux_SeparacaoValor_IPI: TFloatField;
    qAux_SeparacaoTipo_Calculo_PIS: TStringField;
    qAux_SeparacaoPIS: TStringField;
    qAux_SeparacaoCST_PIS: TStringField;
    qAux_SeparacaoBase_Reduzida_PIS: TStringField;
    qAux_SeparacaoBase_Acrescida_PIS: TStringField;
    qAux_SeparacaoBC_PIS: TStringField;
    qAux_SeparacaoValor_PIS: TFloatField;
    qAux_SeparacaoTipo_Calculo_COFINS: TStringField;
    qAux_SeparacaoCOFINS: TStringField;
    qAux_SeparacaoCST_COFINS: TStringField;
    qAux_SeparacaoBase_Reduzida_COFINS: TStringField;
    qAux_SeparacaoBase_Acrescida_COFINS: TStringField;
    qAux_SeparacaoBC_COFINS: TStringField;
    qAux_SeparacaoValor_COFINS: TFloatField;
    qAux_SeparacaoQtde: TFloatField;
    qAux_SeparacaoQtde_Entregue: TFloatField;
    qAux_SeparacaoQtde_Restante: TFloatField;
    qAux_SeparacaoValor_Compra: TFloatField;
    qAux_SeparacaoValor_Original: TFloatField;
    qAux_SeparacaoValor_Unitario: TFloatField;
    qAux_SeparacaoDesc_Acr: TFloatField;
    qAux_SeparacaoTipo_Desc_Acr: TStringField;
    qAux_SeparacaoValor_Frete: TFloatField;
    qAux_SeparacaoValor_Seguro: TFloatField;
    qAux_SeparacaoOutras_Despesas: TFloatField;
    qAux_SeparacaoSub_Total: TFloatField;
    qAux_SeparacaoSub_Total_Liquido: TFloatField;
    qAux_SeparacaoCancelado: TStringField;
    qAux_SeparacaoIndica_Valor_Total: TStringField;
    qAux_SeparacaoData_Entrega: TDateTimeField;
    qAux_SeparacaoTipo_Entrega: TStringField;
    qAux_SeparacaoMarca: TStringField;
    RGTipo_Venda: TRadioGroup;
    Label10: TLabel;
    EdtCodigo_Forma_Pagamento: TEdit;
    EdtForma_Pagamento: TEdit;
    qryitens_vendadOUa: TStringField;
    qryitens_vendaDesc_Acr_P: TFloatField;
    BBtnVoltar_Pedido: TToolButton;
    BBtnCancelar: TToolButton;
    qryitens_venda_aux: TADOQuery;
    qryitens_venda_auxCodigo_Registro: TAutoIncField;
    qryitens_venda_auxCodigo: TIntegerField;
    qryitens_venda_auxN_Item: TStringField;
    qryitens_venda_auxCodigo_Produto: TIntegerField;
    qryitens_venda_auxCodigo_Venda: TStringField;
    qryitens_venda_auxDescricao: TStringField;
    qryitens_venda_auxNCM: TStringField;
    qryitens_venda_auxOrigem: TStringField;
    qryitens_venda_auxCFOP: TStringField;
    qryitens_venda_auxUN: TStringField;
    qryitens_venda_auxTipo_Calculo_BC_ICMS: TStringField;
    qryitens_venda_auxTipo_Recolhimento: TStringField;
    qryitens_venda_auxICMS: TStringField;
    qryitens_venda_auxCST: TStringField;
    qryitens_venda_auxCSOSN: TStringField;
    qryitens_venda_auxBase_Reduzida: TStringField;
    qryitens_venda_auxBase_Acrescida: TStringField;
    qryitens_venda_auxBC: TStringField;
    qryitens_venda_auxValor_ICMS: TStringField;
    qryitens_venda_auxTipo_Calculo_BC_ICMS_ST: TStringField;
    qryitens_venda_auxMVAST: TStringField;
    qryitens_venda_auxICMS_ST: TStringField;
    qryitens_venda_auxCST_ST: TStringField;
    qryitens_venda_auxBase_Reduzida_ST: TStringField;
    qryitens_venda_auxBase_Acrescida_ST: TStringField;
    qryitens_venda_auxBC_ST: TStringField;
    qryitens_venda_auxValor_ICMS_ST: TStringField;
    qryitens_venda_auxAliquota_Calculo_Credito: TStringField;
    qryitens_venda_auxCredito_ICMS: TStringField;
    qryitens_venda_auxTipo_Calculo_IPI: TStringField;
    qryitens_venda_auxIPI: TStringField;
    qryitens_venda_auxCST_IPI: TStringField;
    qryitens_venda_auxBase_Reduzida_IPI: TStringField;
    qryitens_venda_auxBase_Acrescida_IPI: TStringField;
    qryitens_venda_auxBC_IPI: TStringField;
    qryitens_venda_auxValor_IPI: TFloatField;
    qryitens_venda_auxTipo_Calculo_PIS: TStringField;
    qryitens_venda_auxPIS: TStringField;
    qryitens_venda_auxCST_PIS: TStringField;
    qryitens_venda_auxBase_Reduzida_PIS: TStringField;
    qryitens_venda_auxBase_Acrescida_PIS: TStringField;
    qryitens_venda_auxBC_PIS: TStringField;
    qryitens_venda_auxValor_PIS: TFloatField;
    qryitens_venda_auxTipo_Calculo_COFINS: TStringField;
    qryitens_venda_auxCOFINS: TStringField;
    qryitens_venda_auxCST_COFINS: TStringField;
    qryitens_venda_auxBase_Reduzida_COFINS: TStringField;
    qryitens_venda_auxBase_Acrescida_COFINS: TStringField;
    qryitens_venda_auxBC_COFINS: TStringField;
    qryitens_venda_auxValor_COFINS: TFloatField;
    qryitens_venda_auxQtde: TFloatField;
    qryitens_venda_auxQtde_Entregue: TFloatField;
    qryitens_venda_auxQtde_Restante: TFloatField;
    qryitens_venda_auxQtde_S_Previsao: TFloatField;
    qryitens_venda_auxValor_Compra: TFloatField;
    qryitens_venda_auxValor_Original: TFloatField;
    qryitens_venda_auxValor_Unitario: TFloatField;
    qryitens_venda_auxDesc_Acr: TFloatField;
    qryitens_venda_auxDesc_Acr_P: TFloatField;
    qryitens_venda_auxTipo_Desc_Acr: TStringField;
    qryitens_venda_auxdOUa: TStringField;
    qryitens_venda_auxValor_Frete: TFloatField;
    qryitens_venda_auxValor_Seguro: TFloatField;
    qryitens_venda_auxOutras_Despesas: TFloatField;
    qryitens_venda_auxSub_Total: TFloatField;
    qryitens_venda_auxSub_Total_Liquido: TFloatField;
    qryitens_venda_auxCancelado: TStringField;
    qryitens_venda_auxIndica_Valor_Total: TStringField;
    qryitens_venda_auxData_Entrega: TDateTimeField;
    qryitens_venda_auxHora_Entrega: TStringField;
    qryitens_venda_auxTipo_Entrega: TStringField;
    qryitens_venda_auxMarca: TStringField;
    RGTipo_Entrega: TRadioGroup;
    qAux_SeparacaoTipo_Venda: TStringField;
    Label14: TLabel;
    EdtCFOP: TEdit;
    LblCEP: TLabel;
    LblCodigo_Municipio: TLabel;
    LblComplemento: TLabel;
    qrypedido_temporario: TADOQuery;
    DataSource2: TDataSource;
    rs: TRSPrinter;
    EdtLimite_Desconto_Vendedor: TEdit;
    EdtValor_Venda_Original: TEdit;
    EdtPercentual_Desconto_Pedido: TEdit;
    MmoObservacao: TMemo;
    qryitens_vendaQtde_Entregue: TFloatField;
    qryitens_vendaQtde_Restante: TFloatField;
    qryitens_vendaQtde_S_Previsao: TFloatField;
    qryitens_vendaData_Entrega: TDateTimeField;
    qryitens_vendaHora_Entrega: TStringField;
    qryitens_vendaTipo_Venda: TStringField;
    qryitens_vendaTipo_Entrega: TStringField;
    qryitens_vendaComissao: TFloatField;
    qryitens_vendaLocal: TStringField;
    qryitens_vendaPerc_Desc_Vista: TFloatField;
    qryitens_vendaPerc_Desc_Prazo: TFloatField;
    Edit2: TEdit;
    EdtQuantidade_Itens: TEdit;
    EdtTotal_Produtos: TEdit;
    Edit4: TEdit;
    EdtTotal_Desc_Acr: TEdit;
    Edit7: TEdit;
    EdtDesc_Acr_Total: TEdit;
    Edit8: TEdit;
    Edit5: TEdit;
    EdtTotal_Pedido: TEdit;
    EdtTeste_Pedido: TEdit;
    Label2: TLabel;
    LblData_Cadastro: TLabel;
    Label12: TLabel;
    Label4: TLabel;
    MEdtData_Vencimento: TMaskEdit;
    MEdtData_Venda: TMaskEdit;
    MEdtHora_Venda: TMaskEdit;
    LblData_Previsao_Entrega: TLabel;
    MEdtData_Previsao_Entrega: TMaskEdit;
    LblData_Entrega: TLabel;
    MEdtData_Entrega: TMaskEdit;
    GBOS: TGroupBox;
    EdtVeiculo: TEdit;
    Label19: TLabel;
    EdtKilometragem: TEdit;
    Label20: TLabel;
    EdtModelo: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    MMOProblema: TMemo;
    TbsServico: TTabSheet;
    CmbVeiculo: TDBLookupComboBox;
    Edit3: TEdit;
    DBGrid3: TDBGrid;
    qryitens_osCodigo: TIntegerField;
    qryitens_osCodigo_Servico: TIntegerField;
    qryitens_osValor_Unitario: TFloatField;
    qryitens_osDesconto: TFloatField;
    qryitens_osTipo_Desconto: TStringField;
    qryitens_osSub_Total: TFloatField;
    qryitens_osDescricao_Servico: TStringField;
    qryitens_osISS: TStringField;
    qryitens_osQtde: TIntegerField;
    qryitens_osServico: TStringField;
    qryitens_osCod_Serv: TIntegerField;
    qryitens_osCodigo_Registro: TAutoIncField;
    EdtTotal_Servicos: TEdit;
    Edit1: TEdit;
    EdtQuantidade_Servicos: TEdit;
    Label15: TLabel;
    EdtCodigo_Atendente: TEdit;
    EdtAtendente: TEdit;
    qrypedido_temporarioCodigo_Registro: TAutoIncField;
    qrypedido_temporarioCodigo: TIntegerField;
    qrypedido_temporarioCodigo_Produto: TIntegerField;
    qrypedido_temporarioValor_Original: TFloatField;
    qrypedido_temporarioValor_Compra: TFloatField;
    qrypedido_temporarioValor_Unitario: TFloatField;
    qrypedido_temporarioQuantidade: TFloatField;
    qrypedido_temporarioDesc_Acr: TFloatField;
    qrypedido_temporariodOUa: TStringField;
    qrypedido_temporarioSub_Total: TFloatField;
    qrypedido_temporarioPercetual: TFloatField;
    qrypedido_temporarioLucro_Vista: TFloatField;
    qrypedido_temporarioLucro_Prazo: TFloatField;
    qrypedido_temporarioCancelado: TStringField;
    qrypedido_temporarioProduto: TStringField;
    qryitens_osCodigo_Mecanico: TIntegerField;
    qryitens_osMecanico: TStringField;
    qryitens_osComissao: TFloatField;
    LblInscricao_Estadual: TLabel;
    CBImprimir_Lista: TCheckBox;
    Button2: TButton;
    cbVendaOrcamento: TCheckBox;
    Label24: TLabel;
    CmbStatus: TDBLookupComboBox;
    BBtnNovo: TToolButton;
    BitBtn1: TBitBtn;
    ADOQuery1: TADOQuery;
    EdtValor_Tabela: TEdit;
    Label17: TLabel;
    RGTipoDesc: TRadioGroup;
    BBtnExcluir: TToolButton;
    EdtTotal_Impostos: TEdit;
    Edit9: TEdit;
    qryitens_vendaValor_ICMS_ST: TFloatField;
    qryitens_vendaQtde_Estoque_Atual: TFloatField;
    procedure BBtnOrcamentoClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtData_VendaEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Escreve_Texto;
    procedure MEdtData_Previsao_EntregaEnter(Sender: TObject);
    procedure MEdtHora_VendaEnter(Sender: TObject);
    procedure EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Condicao_PagamentoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtValor_TotalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limpa_Menor;
    procedure AtualizaContadorItemPedido(contador, cod: integer);
    procedure AtualizaMd5ItemPedido(cod: integer; MD5: String);
    procedure Calcula_Total;
    procedure SalvaBancoItensPedidoLog(N_Pedido, Codigo_Registro,
      Codigo_Produto: integer; dtAlteracao, hrAlteracao: TTime;
      tipo_alteracao: string; Conexao: TADOConnection);
    procedure Calcula_Total_Deletado;
    procedure EdtValor_TotalEnter(Sender: TObject);
    procedure EdtValor_UnitarioExit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtN_PedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtDesc_AcrExit(Sender: TObject);
    procedure DAV_Modelo_1;
    procedure DAV_Modelo_2;
    procedure BBtnCopiar_PedidoClick(Sender: TObject);
    procedure EdtDesc_AcrEnter(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: integer; Column: TColumn; State: TGridDrawState);
    procedure EdtValor_UnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDesc_AcrKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnConverter_Pre_VendaClick(Sender: TObject);
    procedure EdtCodigo_ClienteKeyPress(Sender: TObject; var abobora: Char);
    procedure EdtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnCopiar_DAVClick(Sender: TObject);
    procedure EdtValor_TotalExit(Sender: TObject);
    procedure BBtnAnalisa_VendaClick(Sender: TObject);
    procedure EdtCFOPKeyPress(Sender: TObject; var Key: Char);
    procedure qryitens_vendaAfterEdit(DataSet: TDataSet);
    procedure EdtTotal_PedidoKeyPress(Sender: TObject; var Key: Char);
    procedure qryitens_vendaBeforeScroll(DataSet: TDataSet);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure qryitens_vendaAfterScroll(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: integer; Column: TColumn; State: TGridDrawState);
    procedure ClientDataSet1AfterEdit(DataSet: TDataSet);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure EdtVenda_TotalEnter(Sender: TObject);
    procedure EdtVenda_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDesc_Acr_TotalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EdtQuantidadeExit(Sender: TObject);
    procedure EdtForma_PagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Forma_PagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Forma_PagamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdtData_VencimentoEnter(Sender: TObject);
    procedure qrypedido_temporarioBeforeScroll(DataSet: TDataSet);
    procedure qrypedido_temporarioAfterEdit(DataSet: TDataSet);
    procedure EdtVenda_TotalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtDesc_Acr_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTotal_PedidoEnter(Sender: TObject);
    procedure EdtTotal_PedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnVoltar_PedidoClick(Sender: TObject);
    procedure EdtTotal_Desc_AcrKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTotal_Desc_AcrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtTotal_Desc_AcrExit(Sender: TObject);
    procedure EdtTotal_Desc_AcrEnter(Sender: TObject);
    procedure EdtProdutoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qrypedido_temporarioAfterScroll(DataSet: TDataSet);
    procedure EdtCodigo_ProdutoDblClick(Sender: TObject);
    procedure EdtCodigo_ClienteDblClick(Sender: TObject);
    procedure EdtCodigo_Forma_PagamentoDblClick(Sender: TObject);
    procedure EdtCodigo_Forma_PagamentoExit(Sender: TObject);
    procedure EdtCodigo_ClienteExit(Sender: TObject);
    procedure EdtCodigo_VeiculoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CmbVeiculoChange(Sender: TObject);
    procedure CmbVeiculoClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure MEdtData_EntregaEnter(Sender: TObject);
    procedure EdtKilometragemKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtData_VendaExit(Sender: TObject);
    procedure MEdtData_VencimentoExit(Sender: TObject);
    procedure MEdtData_Previsao_EntregaExit(Sender: TObject);
    procedure MEdtData_EntregaExit(Sender: TObject);
    procedure EdtKilometragemExit(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3ColExit(Sender: TObject);
    procedure DBGrid3ColEnter(Sender: TObject);
    procedure qryitens_osBeforePost(DataSet: TDataSet);
    procedure qryitens_osAfterPost(DataSet: TDataSet);
    procedure EdtCodigo_AtendenteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_AtendenteDblClick(Sender: TObject);
    procedure EdtCodigo_AtendenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_AtendenteExit(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qryitens_vendaBeforeInsert(DataSet: TDataSet);
    procedure qryitens_vendaAfterInsert(DataSet: TDataSet);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure BBtnNovoClick(Sender: TObject);
    procedure EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: integer; Column: TColumn; State: TGridDrawState);
    procedure EdtN_PedidoExit(Sender: TObject);
    procedure EdtValor_TabelaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_UnitarioEnter(Sender: TObject);
    procedure RGTipoDescExit(Sender: TObject);
    procedure Edit5DblClick(Sender: TObject);
    procedure RGTipoDescClick(Sender: TObject);
    procedure EdtValor_TabelaExit(Sender: TObject);
    procedure DBGrid3CellClick(Column: TColumn);
  private
    pode, altera, altera_analise: Boolean;
    Pedido: URegistro.TPedido;
    Itens_Pedido: URegistro.TItens_Pedido;
    Itens_Pedido_Aux: URegistro.TItens_Pedido;
    Itens_OS: URegistro.TItens_OS;
    Util: TUtil;
    qtde_itens, qtde_servicos: integer;
    R05: URegistro.TR05;
    local: AnsiString;
    val_un_ant, qtde_ant, desc_ant, acr_ant, sub_total_ant, sub_total_ant_br,
      bruto_ant, tot_ant, venda_atual, venda_total: double;
    dav, dav2, tipo_rel, rodape: string;
    cn, cp: string;
    linha, conta, i2, criado, aplicar_desconto, contadorNItem: integer;
    qAux_Tabela: TADOQuery;

    perc_fim, total, perc_aux, perc_pro, valor_venda_ant, desc_fim_ant,
      valor_venda_original, total_des, total_acr, valor_pedido_ant, pedido_aux,
      pedido2, pedido2_temporario, total_venda_temporario, desc_acr_total,
      desc_geral, total_pedido_calculado_pelo_sistema, qtde_produto_encontrado,
      credito_aux, sub_total_servico: double;
    pressionou_insert: Boolean;

    hora : TTime;

    oLS: TListaSeparacaoEntidade;
    oLSDominio: TListaSeparacaoLista;

    FCliente: TClienteEntidade;
    FClienteDom: TClienteDominio;

    FTributacaoDominio: TTributacaoDominio;
    FTributacaoEntidade: TTributacaoEntidade;

    procedure Atualiza_Dados(var Conexao: TADOConnection);
    procedure Atualiza_Dados_Separacao(var Conexao: TADOConnection);
    function Chama_Pedido(var Conexao: TADOConnection): Boolean;
    procedure Ver_Pedido(var Conexao: TADOConnection);

    procedure Atualiza_Itens(var Conexao: TADOConnection);
    procedure Verifica_Produto_Lancado;
    procedure Atualiza_Produto_Encontrado(var Conexao: TADOConnection);
    procedure Calcula_Imposto;
    procedure Verifica_Controla_Pedido(var Conexao: TADOConnection);
    procedure Verifica_Permissao;
    procedure Altera_Preco_DBGrid;
    procedure Altera_Preco_DBGrid_Analise;
    procedure Atualiza_Preco_Final;
    procedure Cabecalho_DAV;

    procedure Cabecalho_Lista_Separacao;
    procedure Imprime_Lista_Separacao;

    procedure Cabecalho_Comprovante_Entrega;
    procedure Imprime_Comprovante_Entrega;
    procedure Grava_Temporario(var Conexao: TADOConnection);
    procedure Grava_Pedido_Endereco_Cliente(var Conexao: TADOConnection);
    procedure Altera_Pedido_Endereco_Cliente(var Conexao: TADOConnection);
    procedure Grava_Temporario2(var Conexao: TADOConnection);
    procedure Atualiza_Pedido_Temporario(var Conexao: TADOConnection);
    procedure Deleta_Temporario(var Conexao: TADOConnection);
    procedure Deleta_Pedido_Temporario(var Conexao: TADOConnection);
    procedure Pega_Dados_Tabela_Preco(Codigo_Produto, Codigo_Tabela: integer;
      var Conexao: TADOConnection);
    procedure Pega_Dados_Anteriores;
    procedure Verifica_Tributacao;
    procedure Inicia_Text;
    procedure Habilita_Total;
    procedure Desabilita_Total;
    procedure Atualiza_Venda_Total;
    procedure Atualiza_Tipo;
    procedure Calcula_Total_Pedido_Temporario_Deletado;
    procedure Atualiza_Valores_Pedido_Pendente(Codigo, Produto: integer;
      Desc_Acr, Perc, Sub_Total, Valor_Unitario: double; dOUa: AnsiString;
      var Conexao: TADOConnection);
    procedure Atualiza_Valores_DBGrid_Analise(Codigo, Produto: integer;
      Valor_Unitario, Qtde, Desc_Acr, Sub_Total, Perc: double; dOUa: AnsiString;
      var Conexao: TADOConnection);
    procedure Calcula_Total_Analise(venda_total, P_Fim, Custo_Total,
      Total_Pedido: double);
    procedure Comprovante_Compra;
    procedure Copia_Dados(var Conexao: TADOConnection);
    procedure Copia_Dados_Salvar(var Conexao: TADOConnection);
    procedure Atualiza_Preco_Maior_Valor(var Conexao: TADOConnection);
    procedure Atualiza_Preco_Maior_Valor_Pedido_Temporario
      (var Conexao: TADOConnection);

    function Calcula_Valor_Original_Venda(var Conexao: TADOConnection): double;
    procedure Pega_Condicao_Codigo;
    procedure Pega_Cliente_Codigo;
    procedure Inicia_Itens;
    procedure Verifica_Credito_Cliente;
    procedure Atualiza_Credito_Cliente(Credito: double;
      var Conexao: TADOConnection);
    procedure Chama_Veiculo_Cliente(var Conexao: TADOConnection);
    procedure Pega_Status_OS(Codigo: integer; var Conexao: TADOConnection);
    procedure Pega_Veiculo(Codigo: integer; var Conexao: TADOConnection);
    procedure Oculta_Itens_OS;
    procedure Calcula_Total_Servico(Valor_Servico: double;
      var Conexao: TADOConnection; Tipo: AnsiString);
    procedure DAV_OS_Modelo_2;
    procedure Pega_Usuario(Codigo: integer; var Conexao: TADOConnection);
    procedure Inicia_Query_Conexao(var Conexao: TADOConnection);
    procedure Atualiza_Servicos(var Conexao: TADOConnection);
    procedure Fecha_Conexao;
    procedure Cria_Conexao;
    procedure Inicia_Transacao;
    procedure Habilita_DAV_PreVenda;
  public
    ativo, achei, iniciado, pode_fechar: Boolean;
    acre_item, indicador_cancelamento_item, casa_decimal_qtde,
      casa_decimal_val_un, cod_pro, desc_item, descri, IAT, IPPT, qtde_vendida,
      qtde_cancelada, unid, valor_cancelado, can_acre, valor_total_item,
      valor_unit, descricao_servico: AnsiString;
    cod_servico, cod_produto: integer;
    novo_valor_uni, total_limite, total_valor_uni, perc_desc, perc_desc_prazo,
      valor_compra, valor_compra_nota, perc_vista, perc_prazo, des_p, des_p_aux,
      des_p_ant, des_p_rodape, des_p_aux_rodape: double;
    tipo_pag, MD5D3, MD5D3Gerado: AnsiString;



    codigo_forma_pagamento, qtde_parcela, prazo,
      forma_pagamento_selecionado: integer;
    forma_pagamento, tipo_juro: AnsiString;
    taxa: double;

    dOUa, pOUr, numero_pedido: AnsiString;

    permissao, uso_tela_pedido: integer;
    Conexao: TADOConnection;
    Conexao_Local: TADOConnection;

    procedure Exclui_Forma_Pagamento(var Conexao: TADOConnection);
    procedure Exclui_Pedido_Endereco_Cliente(var Conexao: TADOConnection);
    procedure Grava_Forma_Pagamento(var Conexao: TADOConnection);
    procedure Altera_Forma_Pagamento(var Conexao: TADOConnection);
    procedure Atualiza_Dados_Pedido(var Conexao: TADOConnection);
    procedure Colega_Dados_R05(var Conexao: TADOConnection);
    procedure Atualiza_Preco_Forma_Pag;
    procedure Atualiza_Preco_Forma_Pag_Analise;
    procedure Atualiza_Preco_Original_Analise;
    procedure Atualiza_Dados_OS(var Conexao: TADOConnection);

    procedure Inicializa_Venda;
  protected
    tipodesc_acr: AnsiString;

    function Confira_Pedido: Boolean;
    function Confira_Itens_Pedido: Boolean;

  end;

var
  FrmPedido_Venda: TFrmPedido_Venda;

implementation

uses UDM, UChama_Produto, UChama_Cliente, UChama_Condicao_Pagamento,
  UDeclaracao, UChama_Pedido, UChama_Servico, UChama_Veiculo, UMenu_Geral,
  UEscolha_Tabela_Preco, UMescla_DAV, UInforma_Forma_Pagamento_Pre_Venda,
  UChama_CFOP, UChama_DAV_Converter, USenha_ADM, UInforma_Produto_Entrega,
  UInforma_DAV_Voltar, UChama_Usuario, URel_Impressao_DAV,
  URel_Impressao_DAV_OS, UChama_Funcionario, UDesconto_PDV,
  URel_Impressao_DAV_Meia_Pagina, URel_Impressao_DAV_OS_Meia_Pagina,
  URel_Lista_Separacao, Util.Mensagens, URel_Impressao_DAV_OS_Sem_Equipamento,
  URel_Impressao_DAV_OS_Meia_Pagina_Sem_Equipamento, Conexao.TTransacao,
  Conexao.TPoll, TypInfo, Conexao.TConexao, Util.TLog,
  Modelo.Dominio.Produto.TProdutoDominio;
{$R *.dfm}
{ TFrmPadrao }

procedure TFrmPedido_Venda.Altera_Preco_DBGrid_Analise;
var
  custo, valor_un, total, novo_valor, Qtde, total_valor_uni, Desc_Acr, desconto,
    desc, valor_tot, des_p_aux, des_p, Total_Pedido, total_produtos: double;

  formata_desc: AnsiString;
begin
  if (altera_analise) and (altera = false) then
  begin

    qrypedido_temporario.Edit;

    Qtde := qrypedido_temporarioQuantidade.AsFloat;
    novo_valor := qrypedido_temporarioValor_Unitario.AsFloat;
    valor_un := qrypedido_temporarioValor_Original.AsFloat;
    custo := qrypedido_temporarioValor_Compra.AsFloat;
    Desc_Acr := novo_valor - valor_un;
    desc := Abs(Desc_Acr);

    if (Qtde > qrypedido_temporarioQuantidade.AsFloat) then
    begin
      Valor_Invalido;
      exit;
    end;

    if (Desc_Acr < 0) then // if (desc_acr < 0) then             //D
    begin

      if (tipo_pag = 'A VISTA') then
        desconto := perc_desc
      else
        desconto := perc_desc_prazo;
    end;

    if (novo_valor <> val_un_ant) then
    begin

      if (Desc_Acr < 0) then // D
      begin
        valor_un := valor_un - desc;
      end
      else
      begin
        valor_un := valor_un + desc; // A
      end;

      valor_tot := Calcula_Valor(FloatToStr((valor_un * Qtde)));

      // desc:= desc * qtde;        //essa linha nñao tinha... coloquei

      formata_desc := FormatFloat('#0.0,0', Abs(desc));
      formata_desc := StringReplace(formata_desc, ThousandSeparator, '',
        [rfReplaceAll]);
      desc := StrToFloat(formata_desc);
    end
    else
    begin
      if (Desc_Acr < 0) then // D
      begin
        valor_un := valor_un - desc;
      end
      else
      begin
        valor_un := valor_un + desc;
      end;

      valor_tot := Calcula_Valor(FloatToStr((valor_un * Qtde)));
      // desc:= desc * qtde;        //essa linha nñao tinha... coloquei
    end;

    // calcula o percentual do produto
    des_p_aux := novo_valor - qrypedido_temporarioValor_Original.AsFloat;
    des_p := (des_p_aux / novo_valor);
    des_p := des_p * 100;
    des_p := Calcula_Valor(FloatToStr(des_p));

    if (des_p > 0) then
      des_p := des_p * -1
    else
      des_p := Abs(des_p);

    total_produtos := StrToFloat(EdtValor_Venda_Original.Text);
    // + ((qtde * qryitens_vendaValor_Original.AsFloat) - bruto_ant);
    Total_Pedido := StrToFloat(EdtVenda_Total.Text) +
      (valor_tot - sub_total_ant);

    des_p_aux_rodape := Total_Pedido - total_produtos;
    des_p_rodape := (des_p_aux_rodape / Total_Pedido);
    des_p_rodape := des_p_rodape * 100;
    des_p_rodape := Calcula_Valor(FloatToStr(des_p_rodape));

    EdtPercentual_Desconto_Pedido.Text := FloatToStr(des_p_rodape);

    // qrypedido_temporario.Edit;
    qrypedido_temporarioPercetual.AsFloat := des_p;
    qrypedido_temporarioDesc_Acr.AsFloat :=
      Calcula_Valor(FloatToStr(Abs(desc)));;
    // qryitens_vendaValor_Unitario.AsFloat:= valor_un;
    // qryitens_vendaValor_Unitario.AsFloat:= qryitens_vendaValor_Original.AsFloat;
    qrypedido_temporarioSub_Total.AsFloat := valor_tot;
    qrypedido_temporario.Post;

    // total_produtos:= StrToFloat(EdtTotal_Produtos.Text) + ((qtde * qrypedido_temporarioValor_Original.AsFloat) - bruto_ant);
    // total_pedido:= StrToFloat(EdtVenda_Total.Text) + (valor_tot - sub_total_ant);

    EdtVenda_Total.Text := FormatFloat('#0.0,0', Total_Pedido);
    EdtVenda_Total.Text := StringReplace(EdtVenda_Total.Text, ThousandSeparator,
      '', [rfReplaceAll]);

    perc_aux := StrToFloat(EdtVenda_Total.Text) -
      StrToFloat(EdtCusto_Total.Text);
    perc_fim := (perc_aux / StrToFloat(EdtVenda_Total.Text));
    perc_fim := perc_fim * 100;
    perc_fim := Calcula_Valor(FloatToStr(perc_fim));

    EdtPerc_Total.Text := FloatToStr(perc_fim);
    { custo:= qrypedido_temporarioValor_Compra_1.AsFloat;
      valor_un:= qrypedido_temporarioValor_Unitario.AsFloat;

      total:= ( valor_un - custo );
      total:= ( total / valor_un );
      total:= Calcula_Valor(FloatToStr(total * 100));

      //Atualiza_Valores_Pedido_Pendente(StrToInt(EdtCodigo.Text), qrypedido_temporarioCodigo_Produto.AsInteger, qrypedido_temporarioValor_Unitario.AsFloat, total);
      //Atualiza_Pedido_Temporario; }
    altera_analise := false;
    // Atualiza_Venda_Total;
  end;
end;

procedure TFrmPedido_Venda.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  // Application.OnMessage:= FrmMenu_Geral.ApplicationEventsMessage;
end;

procedure TFrmPedido_Venda.AtualizaContadorItemPedido(contador, cod: integer);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, sql do
    begin
      Close;
      Connection := Conexao;
      Clear;
      add('update Itens_Pedido set N_Item = :N_Item where Codigo_Registro = :codRegistro');
      Parameters.ParamByName('N_Item').Value := contador;
      Parameters.ParamByName('codRegistro').Value := cod;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;

end;

procedure TFrmPedido_Venda.AtualizaMd5ItemPedido(cod: integer; MD5: String);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, sql do
    begin
      Close;
      Connection := Conexao;
      Clear;
      add('update Itens_Pedido set MD5 = :MD5 where Codigo_Registro = :codRegistro');
      Parameters.ParamByName('MD5').Value := MD5;
      Parameters.ParamByName('codRegistro').Value := cod;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;

end;

procedure TFrmPedido_Venda.Atualiza_Credito_Cliente(Credito: double;
  var Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      Close;
      Connection := Conexao;
      Clear;
      add('update Cliente set Credito = :Credito');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Credito').Value := Credito;
      Parameters.ParamByName('Codigo').Value :=
        StrToInt(EdtCodigo_Cliente.Text);
      ExecSQL;
    end;
    Cria_Arquivo_Atualiza_Dados('ACli');
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmPedido_Venda.Atualiza_Dados(var Conexao: TADOConnection);
begin
  with qryitens_venda, sql do
  begin
    Close;
    Connection := Conexao;
    Clear;
    add('select IP.*, M.Descricao as Marca, LP.Local from Itens_Pedido IP');
    add('left join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
    add('left join Localidade_Produto LP on (P.Codigo_Local = LP.Codigo)');
    add('where IP.Codigo = :Codigo and IP.Cancelado = :N order by IP.Descricao');
    Parameters.ParamByName('Codigo').Value := EdtCodigo.Text;
    Parameters.ParamByName('N').Value := 'N';
    open;
    // ShowMessage(IntToStr(qryitens_venda.RecordCount));
  end;
end;

procedure TFrmPedido_Venda.Atualiza_Dados_OS(var Conexao: TADOConnection);
begin
  with qryitens_os, sql do
  begin
    Close;
    Connection := Conexao;
    Clear;
    add('select IOS.* from Itens_OS IOS');
    add('where IOS.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value := EdtCodigo.Text;
    open;
  end;
end;

procedure TFrmPedido_Venda.Atualiza_Dados_Pedido(var Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      Close;
      Connection := Conexao;
      Clear;
      add('update Pedido set N_Pre_Venda = :N_Pre_Venda, Tipo = :Tipo, Status = :Status, DAVC = :DAVC');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('N_Pre_Venda').Value := UDeclaracao.pre_venda;
      Parameters.ParamByName('Tipo').Value := 'PRÉ-VENDA';
      Parameters.ParamByName('Status').Value := 'PENDENTE';
      Parameters.ParamByName('DAVC').Value := 'SIM';
      Parameters.ParamByName('Codigo').Value := EdtCodigo.Text;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmPedido_Venda.Atualiza_Dados_Separacao
  (var Conexao: TADOConnection);
begin
  with qAux_Separacao, sql do
  begin
    Close;
    Connection := Conexao;
    Clear;
    add('select IP.*, M.Descricao as Marca from Itens_Pedido IP');
    add('left join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
    add('where IP.Codigo = :Codigo and IP.Tipo_Venda = :Tipo and IP.Cancelado = :N order by IP.Descricao');
    Parameters.ParamByName('Codigo').Value := EdtCodigo.Text;
    Parameters.ParamByName('Tipo').Value := 'A';
    Parameters.ParamByName('N').Value := 'N';
    open;
  end;
end;

procedure TFrmPedido_Venda.Grava_Temporario(var Conexao: TADOConnection);
var
  qAux: TADOQuery;
  perc_fim, perc_aux, pe, pe_aux, v_un: double;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, sql do
    begin
      Close;
      Connection := Conexao;
      Clear;
      add('INSERT INTO Pedido_Temporario');
      add('           (Codigo');
      add('           ,Codigo_Produto');
      add('           ,Valor_Original');
      add('           ,Valor_Compra');
      add('           ,Valor_Unitario');
      add('           ,Quantidade');
      add('           ,Desc_Acr');
      add('           ,dOUa');
      add('           ,Sub_Total');
      add('           ,Percetual');
      add('           ,Lucro_Vista');
      add('           ,Lucro_Prazo');
      add('           ,Cancelado)');
      add('     VALUES');
      add('           (:Codigo');
      add('           ,:Codigo_Produto');
      add('           ,:Valor_Original');
      add('           ,:Valor_Compra');
      add('           ,:Valor_Unitario');
      add('           ,:Quantidade');
      add('           ,:Desc_Acr');
      add('           ,:dOUa');
      add('           ,:Sub_Total');
      add('           ,:Percetual');
      add('           ,:Lucro_Vista');
      add('           ,:Lucro_Prazo');
      add('           ,:Cancelado)');

      Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
      Parameters.ParamByName('Codigo_Produto').Value :=
        StrToInt(LblProduto.Caption);
      Parameters.ParamByName('Valor_Original').Value :=
        StrToFloat(EdtValor_Tabela.Text);
      Parameters.ParamByName('Valor_Compra').Value := valor_compra;

      v_un := (StrToFloat(EdtValor_Unitario.Text) +
        StrToFloat(EdtDesc_Acr.Text));
      Parameters.ParamByName('Valor_Unitario').Value := v_un;

      Parameters.ParamByName('Quantidade').Value :=
        StrToFloat(EdtQuantidade.Text);
      Parameters.ParamByName('Desc_Acr').Value := StrToFloat(EdtDesc_Acr.Text);
      Parameters.ParamByName('dOUa').Value := 'D';
      Parameters.ParamByName('Sub_Total').Value :=
        StrToFloat(EdtValor_Total.Text);

      pe_aux := v_un - valor_compra;
      pe := (pe_aux / v_un);
      pe := pe * 100;
      pe := Calcula_Valor(FloatToStr(pe));

      Parameters.ParamByName('Percetual').Value := pe;
      Parameters.ParamByName('Lucro_Vista').Value := perc_vista;
      Parameters.ParamByName('Lucro_Prazo').Value := perc_prazo;
      Parameters.ParamByName('Cancelado').Value := 'N';
      ExecSQL;
    end;

  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;

  { EdtCusto_Total.Text:= FloatToStr( StrToFloat(EdtCusto_Total.Text) + ( valor_compra * StrToFloat(EdtQuantidade.Text)));
    EdtCusto_Total.Text:= FormatFloat('#0.0,0', StrToFloat(EdtCusto_Total.Text));
    EdtCusto_Total.Text:= StringReplace(EdtCusto_Total.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtVenda_Total.Text:= FloatToStr( StrToFloat(EdtVenda_Total.Text) + StrToFloat(EdtValor_Total.Text));
    EdtVenda_Total.Text:= FormatFloat('#0.0,0', StrToFloat(EdtVenda_Total.Text));
    EdtVenda_Total.Text:= StringReplace(EdtVenda_Total.Text, ThousandSeparator, '', [rfReplaceAll]);

    perc_aux:= StrToFloat(EdtVenda_Total.Text) - StrToFloat(EdtCusto_Total.Text);
    perc_fim:= ( perc_aux / StrToFloat(EdtVenda_Total.Text) );
    perc_fim:= perc_fim * 100;
    perc_fim:= Calcula_Valor(FloatToStr(perc_fim));

    EdtPerc_Total.Text:= FloatToStr(perc_fim); }

  // Atualiza_Pedido_Temporario(FrmPedido_Venda.Conexao);

  // EdtPerc_Total.Text:= FormatFloat('#0.0,0', StrToFloat(EdtPerc_Total.Text));
end;

procedure TFrmPedido_Venda.Grava_Temporario2;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      Close;
      Connection := dm.ADOConnection1;
      Clear;
      add('INSERT INTO Pedido_Temporario');
      add('           (Codigo');
      add('           ,Codigo_Produto');
      add('           ,Valor_Original');
      add('           ,Valor_Compra');
      add('           ,Valor_Unitario');
      add('           ,Quantidade');
      add('           ,Percetual');
      add('           ,Lucro_Vista');
      add('           ,Lucro_Prazo)');
      add('     VALUES');
      add('           (:Codigo');
      add('           ,:Codigo_Produto');
      add('           ,:Valor_Original');
      add('           ,:Valor_Compra');
      add('           ,:Valor_Unitario');
      add('           ,:Quantidade');
      add('           ,:Percetual');
      add('           ,:Lucro_Vista');
      add('           ,:Lucro_Prazo)');

      Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
      Parameters.ParamByName('Codigo_Produto').Value :=
        qryitens_vendaCodigo_Produto.AsInteger;
      Parameters.ParamByName('Valor_Original').Value :=
        qryitens_vendaValor_Original.AsFloat;
      Parameters.ParamByName('Valor_Compra').Value :=
        qryitens_vendaValor_Compra.AsFloat;
      Parameters.ParamByName('Valor_Unitario').Value :=
        qryitens_vendaValor_Unitario.AsFloat;
      Parameters.ParamByName('Quantidade').Value := qryitens_vendaQtde.AsFloat;
      Parameters.ParamByName('Percetual').Value :=
        (100 - (qryitens_vendaValor_Compra.AsFloat /
        qryitens_vendaValor_Unitario.AsFloat) * 100);
      Parameters.ParamByName('Lucro_Vista').Value := 0;
      Parameters.ParamByName('Lucro_Prazo').Value := 0;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
  { Atualiza_Pedido_Temporario;

    EdtCusto_Total.Text:= FloatToStr( StrToFloat(EdtCusto_Total.Text) + ( qryitens_vendaValor_Compra.AsFloat * qryitens_vendaQtde.AsFloat));
    EdtCusto_Total.Text:= FormatFloat('#0.0,0', StrToFloat(EdtCusto_Total.Text));
    EdtCusto_Total.Text:= StringReplace(EdtCusto_Total.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtVenda_Total.Text:= FloatToStr( StrToFloat(EdtVenda_Total.Text) + qryitens_vendaSub_Total.AsFloat);
    EdtVenda_Total.Text:= FormatFloat('#0.0,0', StrToFloat(EdtVenda_Total.Text));
    EdtVenda_Total.Text:= StringReplace(EdtVenda_Total.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtPerc_Total.Text:= FloatToStr((100 - ( StrToFloat(EdtCusto_Total.Text) / StrToFloat(EdtVenda_Total.Text) ) * 100));
    EdtPerc_Total.Text:= FormatFloat('#0.0,0', StrToFloat(EdtPerc_Total.Text)); }
end;

procedure TFrmPedido_Venda.Habilita_DAV_PreVenda;
begin
  if (gera_pre_venda = '0101') and (gera_dav = '0101') and (gera_nfe = '0101')
  then
  begin
    cbVendaOrcamento.Enabled := true;
    cbVendaOrcamento.Checked := true;
  end
  else if (gera_pre_venda = '0101') and (gera_dav = '0101') and
    (gera_nfe = '0202') then
  begin
    cbVendaOrcamento.Enabled := true;
    cbVendaOrcamento.Checked := true;
  end
  else if (gera_pre_venda = '0101') and (gera_dav = '0202') and
    (gera_nfe = '0202') then
  begin
    cbVendaOrcamento.Enabled := false;
    cbVendaOrcamento.Checked := false;
  end
  else if (gera_pre_venda = '0101') and (gera_dav = '0202') and
    (gera_nfe = '0101') then
  begin
    cbVendaOrcamento.Enabled := false;
    cbVendaOrcamento.Checked := false;
  end
  else

    if (gera_dav = '0101') and (gera_pre_venda = '0101') and (gera_nfe = '0101')
  then
  begin
    cbVendaOrcamento.Enabled := true;
    cbVendaOrcamento.Checked := true;
  end
  else if (gera_dav = '0101') and (gera_pre_venda = '0101') and
    (gera_nfe = '0202') then
  begin
    cbVendaOrcamento.Enabled := true;
    cbVendaOrcamento.Checked := true;
  end
  else if (gera_dav = '0101') and (gera_pre_venda = '0202') and
    (gera_nfe = '0202') then
  begin
    cbVendaOrcamento.Enabled := false;
    cbVendaOrcamento.Checked := true;
  end
  else if (gera_dav = '0101') and (gera_pre_venda = '0202') and
    (gera_nfe = '0101') then
  begin
    cbVendaOrcamento.Enabled := false;
    cbVendaOrcamento.Checked := true;
  end
  else

    if (gera_nfe = '0101') and (gera_pre_venda = '0101') and (gera_dav = '0101')
  then
  begin
    cbVendaOrcamento.Enabled := true;
    cbVendaOrcamento.Checked := true;
  end
  else if (gera_nfe = '0101') and (gera_pre_venda = '0101') and
    (gera_dav = '0202') then
  begin
    cbVendaOrcamento.Enabled := false;
    cbVendaOrcamento.Checked := false;
  end
  else if (gera_nfe = '0101') and (gera_pre_venda = '0202') and
    (gera_dav = '0202') then
  begin
    cbVendaOrcamento.Enabled := false;
    cbVendaOrcamento.Checked := true;
  end
  else if (gera_nfe = '0101') and (gera_pre_venda = '0202') and
    (gera_dav = '0101') then
  begin
    cbVendaOrcamento.Enabled := false;
    cbVendaOrcamento.Checked := true;
  end
  else if (gera_nfe = '0202') and (gera_pre_venda = '0202') and
    (gera_dav = '0202') then
  begin
    cbVendaOrcamento.Enabled := false;
    cbVendaOrcamento.Checked := true;
  end;

end;

procedure TFrmPedido_Venda.Habilita_Total;
begin
  // LblCusto_Total.Visible:= true;
  EdtCusto_Total.Visible := true;
  // LblVenda_Total.Visible:= true;
  EdtVenda_Total.Visible := true;
  // LblPerc_Total.Visible:= true;
  EdtPerc_Total.Visible := true;
  // EdtPerc_Pro.Visible:= true;
  EdtLimite_Desconto_Vendedor.Visible := true;
  EdtLimite_Desconto_Vendedor.Text := FloatToStr(limite_desc_ven);
  EdtPercentual_Desconto_Pedido.Text := '0';
  EdtPercentual_Desconto_Pedido.Visible := true;
  EdtValor_Venda_Original.Visible := true;
end;

procedure TFrmPedido_Venda.BBtnAnalisa_VendaClick(Sender: TObject);
begin
  uso_tela_pedido := 0;
  if (liberado_analise_venda = false) then
  begin
    permissao := 0;
    Application.CreateForm(TFrmSenha_ADM, FrmSenha_ADM);
    FrmSenha_ADM.ShowModal;
    FrmSenha_ADM.Free;
  end;

  if (liberado_analise_venda) then
  begin
    if (DBGrid2.Visible = false) then
    begin
      DBGrid2.Visible := true;
      Atualiza_Pedido_Temporario(Conexao);
      Atualiza_Preco_Original_Analise;
      Habilita_Total;
    end
    else
    begin
      DBGrid2.Visible := false;
      Desabilita_Total;
      liberado_analise_venda := false;
    end;
  end;
end;

procedure TFrmPedido_Venda.BBtnCancelarClick(Sender: TObject);
begin
  // Itens_Pedido.Excluir(Itens_Pedido);
  // Itens_OS.Excluir(Itens_OS);
  // R05.Excluir(R05);
  qryitens_venda.Close;
  qryitens_os.Close;
  Util.Limpa_Campos(FrmPedido_Venda);
  Escreve_Texto;

  { if (Conexao.InTransaction) then
    begin
    FrmPedido_Venda.Conexao.RollbackTrans;
    Fecha_Conexao;
    end; }

  // TTransacao.Create(Conexao);
  // TTransacao.desfazerTransacao(Conexao);
  // TPool.getInstance.liberarConexao(Conexao);

  codigo_tabela_preco_ativo := codigo_tabela_preco_padrao;
  pode_fechar := true;
  iniciado := false;
  TConexao.CancelaConexao(Conexao);
  BBtnOrcamento.Enabled := false;
  BBtnConverter_Pre_Venda.Enabled := false;
  BBtnCopiar_DAV.Enabled := false;
  BBtnAnalisa_Venda.Enabled := false;
  BBtnVoltar_Pedido.Enabled := true;
  BBtnCancelar.Enabled := false;
  BBtnNovo.Enabled := true;
  BBtnExcluir.Enabled := false;
  DBGrid2.Visible := false;
  Desabilita_Total;
  liberado_analise_venda := false;
  Limpa_Dados_N_Pedido;
  CmbVeiculo.KeyValue := NULL;
  CmbStatus.KeyValue := NULL;
  TlbFerramentas.SetFocus;
  Util.Desabilita_Campos(FrmPedido_Venda);
  BBtnCancelar.Enabled := false;
end;

procedure TFrmPedido_Venda.Grava_Forma_Pagamento(var Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, sql do
    begin
      Close;
      Connection := Conexao;
      Clear;
      add('INSERT INTO Pedido_Pagamento_DAV');
      add('           (Codigo');
      add('           ,N_Pedido');
      add('           ,Codigo_Forma_Pagamento_Selecionada');
      add('           ,Codigo_Forma_Pagamento');
      add('           ,Forma_Pagamento');
      add('           ,Qtde_Parcela');
      add('           ,Prazo');
      add('           ,Taxa');
      add('           ,Tipo_Pagamento)');
      add('     VALUES');
      add('           (:Codigo');
      add('           ,:N_Pedido');
      add('           ,:Codigo_Forma_Pagamento_Selecionada');
      add('           ,:Codigo_Forma_Pagamento');
      add('           ,:Forma_Pagamento');
      add('           ,:Qtde_Parcela');
      add('           ,:Prazo');
      add('           ,:Taxa');
      add('           ,:Tipo_Pagamento)');

      Parameters.ParamByName('Codigo').Value :=
        StrToInt(FrmPedido_Venda.EdtCodigo.Text);

      Parameters.ParamByName('N_Pedido').Value :=
        FrmPedido_Venda.EdtN_Pedido.Text;

      Parameters.ParamByName('Codigo_Forma_Pagamento_Selecionada').Value :=
        forma_pagamento_selecionado;
      Parameters.ParamByName('Codigo_Forma_Pagamento').Value :=
        StrToInt(EdtCodigo_Forma_Pagamento.Text);
      Parameters.ParamByName('Forma_Pagamento').Value :=
        EdtForma_Pagamento.Text;
      Parameters.ParamByName('Qtde_Parcela').Value := qtde_parcela;
      Parameters.ParamByName('Prazo').Value := prazo;
      Parameters.ParamByName('Taxa').Value := taxa;
      Parameters.ParamByName('Tipo_Pagamento').Value := tipo_pag;
      ExecSQL;
    end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

procedure TFrmPedido_Venda.Grava_Pedido_Endereco_Cliente
  (var Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, sql do
    begin
      Close;
      Connection := Conexao;
      Clear;
      add('INSERT INTO Pedido_Endereco_Cliente');
      add('           (Codigo');
      add('           ,N_Pedido');
      add('           ,Nome');
      add('           ,CPF_CNPJ');
      add('           ,Tipo_Endereco');
      add('           ,Endereco');
      add('           ,Numero');
      add('           ,Setor');
      add('           ,Cidade');
      add('           ,UF');
      add('           ,Telefone');
      add('           ,CEP');
      add('           ,Codigo_Municipio');
      add('           ,Complemento');
      add('           ,Inscricao_Estadual)');
      add('     VALUES');
      add('           (:Codigo');
      add('           ,:N_Pedido');
      add('           ,:Nome');
      add('           ,:CPF_CNPJ');
      add('           ,:Tipo_Endereco');
      add('           ,:Endereco');
      add('           ,:Numero');
      add('           ,:Setor');
      add('           ,:Cidade');
      add('           ,:UF');
      add('           ,:Telefone');
      add('           ,:CEP');
      add('           ,:Codigo_Municipio');
      add('           ,:Complemento');
      add('           ,:Inscricao_Estadual)');

      Parameters.ParamByName('Codigo').Value :=
        StrToInt(FrmPedido_Venda.EdtCodigo.Text);
      Parameters.ParamByName('N_Pedido').Value :=
        FrmPedido_Venda.EdtN_Pedido.Text;
      Parameters.ParamByName('Nome').Value := EdtCliente.Text;
      Parameters.ParamByName('CPF_CNPJ').Value := LblCPF.Caption;
      Parameters.ParamByName('Tipo_Endereco').Value :=
        LblTipo_Logradouro.Caption;
      Parameters.ParamByName('Endereco').Value := LblEndereco.Caption;
      Parameters.ParamByName('Numero').Value := LblNumero.Caption;
      Parameters.ParamByName('Setor').Value := LblSetor.Caption;
      Parameters.ParamByName('Cidade').Value := LblCidade.Caption;
      Parameters.ParamByName('UF').Value := LblUF.Caption;
      Parameters.ParamByName('Telefone').Value := LblTelefone.Caption;
      Parameters.ParamByName('CEP').Value := LblCEP.Caption;
      Parameters.ParamByName('Codigo_Municipio').Value :=
        LblCodigo_Municipio.Caption;
      Parameters.ParamByName('Complemento').Value := LblComplemento.Caption;
      Parameters.ParamByName('Inscricao_Estadual').Value :=
        LblInscricao_Estadual.Caption;

      ExecSQL;
    end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

procedure TFrmPedido_Venda.BBtnConverter_Pre_VendaClick(Sender: TObject);
var
  Total_Pedido: double;
begin
  if Confirma_Pre_Venda = true then
  begin
    try
      if (tipo_pag = 'A PRAZO') then
      begin
        Total_Pedido := StrToFloat(EdtTotal_Pedido.Text);
        // Verifica_Credito_Cliente(total_pedido);
      end;

      tipo_venda := 'PRÉ-VENDA';
      Verifica_Controla_Pedido(FrmPedido_Venda.Conexao);

      if (RGTipo_Venda.ItemIndex <> 0) then
      begin
        Application.CreateForm(TFrmInforma_Produto_Entrega,
          FrmInforma_Produto_Entrega);
        FrmInforma_Produto_Entrega.ShowModal;
        FrmInforma_Produto_Entrega.Free;
      end
      else
      begin

        // if (DM.ADOConnection1.InTransaction) then
        // begin
        // end;

        Gera_N_Pre_Venda(FrmPedido_Venda.Conexao);
        Atualiza_Dados_Pedido(FrmPedido_Venda.Conexao);
        Colega_Dados_R05(FrmPedido_Venda.Conexao);
        Limpa_Dados_N_Pedido;

        Conexao.CommitTrans;
        // Conexao.Close;

        Cria_Arquivo_Qualquer('TemCupom');

        if (separacao = '0101') then
          Imprime_Lista_Separacao;
      end;

    finally
      BBtnOrcamento.Enabled := false;
      BBtnConverter_Pre_Venda.Enabled := false;
      BBtnCopiar_DAV.Enabled := false;
      BBtnAnalisa_Venda.Enabled := false;
      BBtnVoltar_Pedido.Enabled := true;
      BBtnCancelar.Enabled := false;
      Util.Desabilita_Campos(FrmPedido_Venda);

      pode_fechar := true;
      iniciado := false;
    end;
  end;
end;

procedure TFrmPedido_Venda.BBtnCopiar_DAVClick(Sender: TObject);
begin
  Application.CreateForm(TFrmMescla_DAV, FrmMescla_DAV);
  FrmMescla_DAV.Show;
end;

procedure TFrmPedido_Venda.BBtnCopiar_PedidoClick(Sender: TObject);
begin
  { Application.CreateForm(TFrmChama_Pedido, FrmChama_Pedido);
    FrmChama_Pedido.ShowModal;
    FrmChama_Pedido.Free; }
end;

procedure TFrmPedido_Venda.BBtnExcluirClick(Sender: TObject);
begin
  try
    if (Application.MessageBox('Confirma a exclusão do pedido selecionado?',
      'Confirmação!', MB_YESNO + MB_ICONQUESTION)) = IDYES then
    begin
      Pedido.Excluir(Pedido, Conexao);
      Itens_Pedido.Excluir(StrToInt(EdtCodigo.Text), Conexao);
      Itens_OS.Excluir(Itens_OS, Conexao);
      Exclui_Forma_Pagamento(Conexao);
      Exclui_Pedido_Endereco_Cliente(Conexao);
      Deleta_Pedido_Temporario(Conexao);

      Atualiza_Codigo_Tabela_Padrao(codigo_tabela_preco_padrao);

      TConexao.ConfirmaConexao(Conexao);
      pode_fechar := true;
      iniciado := false;
      BBtnOrcamento.Enabled := false;
      BBtnConverter_Pre_Venda.Enabled := false;
      BBtnCopiar_DAV.Enabled := false;
      BBtnAnalisa_Venda.Enabled := false;
      BBtnVoltar_Pedido.Enabled := true;
      BBtnCancelar.Enabled := false;
      BBtnExcluir.Enabled := false;
      BBtnNovo.Enabled := true;
      DBGrid2.Visible := false;
      Desabilita_Total;
      liberado_analise_venda := false;
      Util.Desabilita_Campos(FrmPedido_Venda);
      Limpa_Dados_N_Pedido;
      TMensagens.MensagemInformacao('Pedido excluido.');
    end;
  except
    on E: Exception do
    begin
      TMensagens.MensagemErro('Erro ao excluir Pedido: ' + E.Message);
      TLog.Error('Erro ao excluir Pedido: ' + E.Message);
      TConexao.CancelaConexao(Conexao);
    end;

  end;
end;

procedure TFrmPedido_Venda.BBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPedido_Venda.BBtnNovoClick(Sender: TObject);
begin
  TLog.Info('CLICOU BOTÃO NOVO');
  Inicializa_Venda;
end;

procedure TFrmPedido_Venda.BBtnOrcamentoClick(Sender: TObject);
var
  vei: integer;
  status_os, tipo_venda: AnsiString;
  data_entrega, data_previsao: TDate;
  kilometragem: double;
  FProdutoDominio: TProdutoDominio;
begin
  TLog.Info('--- MÉTODO SALVAR ---');
  if (MEdtData_Entrega.Text = '  /  /    ') then
  begin
    data_entrega := 0
  end
  else
  begin
    data_entrega := StrToDateTime(MEdtData_Entrega.Text)
  end;

  if (MEdtData_Previsao_Entrega.Text = '  /  /    ') then
  begin
    data_previsao := 0
  end
  else
  begin
    data_previsao := StrToDateTime(MEdtData_Previsao_Entrega.Text)
  end;

  if (EdtKilometragem.Text = '') then
  begin
    kilometragem := 0;
  end
  else
  begin
    kilometragem := StrToFloat(EdtKilometragem.Text);
  end;

  if (CmbVeiculo.KeyValue = NULL) then
    vei := 0
  else
    vei := CmbVeiculo.KeyValue;

  if (CmbStatus.KeyValue = NULL) then
    status_os := '0'
  else
    status_os := CmbStatus.KeyValue;

  if (Confira_Pedido) then
  begin
    try
      if (cbVendaOrcamento.Checked) then
      begin
        if (gera_os = '0101') then
          tipo_venda := 'DAV-OS'
        else
          tipo_venda := 'DAV';

        //Colega_Dados_R05(FrmPedido_Venda.Conexao);
      end
      else
      begin
        Gera_N_Pre_Venda(Conexao);
        tipo_venda := 'PRÉ-VENDA';
        Cria_Arquivo_Qualquer('TemCupom');
        Colega_Dados_R05(FrmPedido_Venda.Conexao);
      end;

      if (achei = false) then
      begin
        // ShowMessage(LblEndereco.Caption);
        Pedido.Salva_Banco('S', 'I', StrToInt(FrmPedido_Venda.EdtCodigo.Text),
          UDeclaracao.Pedido, UDeclaracao.pre_venda, UDeclaracao.coo, '',
          UDeclaracao.ccf, StrToInt(FrmPedido_Venda.EdtCodigo_Cliente.Text),
          UDeclaracao.codigo_empresa, vei, StrToInt(EdtCodigo_Atendente.Text),
          codigo_tabela_preco_ativo,
          StrToInt(FrmPedido_Venda.EdtCodigo_Forma_Pagamento.Text),
          StrToDateTime(FrmPedido_Venda.MEdtData_Venda.Text),
          StrToDateTime(FrmPedido_Venda.MEdtData_Vencimento.Text),
          StrToInt(FrmPedido_Venda.EdtQuantidade_Itens.Text),
          StrToInt(FrmPedido_Venda.EdtQuantidade_Servicos.Text),
          StrToFloat(FrmPedido_Venda.EdtTotal_Produtos.Text),
          StrToFloat(FrmPedido_Venda.EdtTotal_Servicos.Text),
          StrToFloat(FrmPedido_Venda.EdtTotal_Desc_Acr.Text),
          StrToFloat(FrmPedido_Venda.EdtDesc_Acr_Total.Text), '$',
          StrToFloat(FrmPedido_Venda.EdtTotal_Pedido.Text), tipo_venda,
          'PENDENTE', status_os, 0, 0, 0, MMOProblema.Text, '', '', 'NÃO', '',
          '', '', 0, FrmPedido_Venda.MmoObservacao.Text,
          FrmPedido_Venda.MEdtHora_Venda.Text, 0, data_previsao, data_entrega,
          kilometragem, '', codigo_cfop_padrao,
          StrToFloat(FrmPedido_Venda.EdtTotal_Impostos.Text), 0, Conexao);

        // Insere_Pedido_Aux(EdtN_Pedido.Text, '', StrToDateTime(MEdtData_Venda.Text), StrToFloat(EdtTotal_Pedido.Text));
        Grava_Forma_Pagamento(Conexao);
        Grava_Pedido_Endereco_Cliente(Conexao);
        Pedido_Gerado;

        UDeclaracao.Insere_Historico(usuario, 'REALIZOU REGISTRO DE DAV ' +
          EdtN_Pedido.Text + '.', TimeToStr(time), insercao, date);
      end
      else
      begin
        Pedido.Salva_Banco('S', 'A', StrToInt(FrmPedido_Venda.EdtCodigo.Text),
          UDeclaracao.Pedido, UDeclaracao.pre_venda, UDeclaracao.coo, '',
          UDeclaracao.ccf, StrToInt(FrmPedido_Venda.EdtCodigo_Cliente.Text),
          UDeclaracao.codigo_empresa, vei, StrToInt(EdtCodigo_Atendente.Text),
          codigo_tabela_preco_ativo,
          StrToInt(FrmPedido_Venda.EdtCodigo_Forma_Pagamento.Text),
          StrToDateTime(FrmPedido_Venda.MEdtData_Venda.Text),
          StrToDateTime(FrmPedido_Venda.MEdtData_Vencimento.Text),
          StrToInt(FrmPedido_Venda.EdtQuantidade_Itens.Text),
          StrToInt(FrmPedido_Venda.EdtQuantidade_Servicos.Text),
          StrToFloat(FrmPedido_Venda.EdtTotal_Produtos.Text),
          StrToFloat(FrmPedido_Venda.EdtTotal_Servicos.Text),
          StrToFloat(FrmPedido_Venda.EdtTotal_Desc_Acr.Text),
          StrToFloat(FrmPedido_Venda.EdtDesc_Acr_Total.Text), '$',
          StrToFloat(FrmPedido_Venda.EdtTotal_Pedido.Text), tipo_venda,
          'PENDENTE', status_os, 0, 0, 0, MMOProblema.Text, '', '', 'NÃO', '',
          '', '', 0, FrmPedido_Venda.MmoObservacao.Text,
          FrmPedido_Venda.MEdtHora_Venda.Text, 0, data_previsao, data_entrega,
          kilometragem, '', codigo_cfop_padrao,
          StrToFloat(FrmPedido_Venda.EdtTotal_Impostos.Text), 0, Conexao);

        // Pedido.Alterar(Pedido);
        Altera_Forma_Pagamento(Conexao);
        Altera_Pedido_Endereco_Cliente(Conexao);
        // Copia_Dados_Salvar(FrmPedido_Venda.Conexao);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU DAV ' + EdtN_Pedido.Text
          + '.', TimeToStr(time), insercao, date);
      end;

      AtualizarQuantidadeRegistro('Pedido', 'QtdeDAV');
      AtualizarQuantidadeRegistro('Itens_Pedido', 'QtdeItensDAV');
      Atualiza_Codigo_Tabela_Padrao(codigo_tabela_preco_padrao);

     if not qryitens_venda.IsEmpty then
      begin



        qryitens_venda.First;
        contadorNItem := 1;
        while not qryitens_venda.Eof do
        begin
          AtualizaContadorItemPedido(contadorNItem,
            qryitens_vendaCodigo_Registro.AsInteger);
          // MD5D3 := qryitens_venda.FieldByName('MD52').AsString;
          MD5D3Gerado := GeraMD5([EdtN_Pedido.Text, MEdtData_Venda.Text,
            IntToStr(contadorNItem), qryitens_vendaCodigo_Produto.AsString,
            qryitens_vendaDescricao.AsString,
            qryitens_vendaQtde.AsString,
            qryitens_vendaUN.AsString,
            qryitens_vendaValor_Unitario.AsString,
            qryitens_vendaDesc_Acr.AsString,
            qryitens_vendaDesc_Acr.AsString,
            qryitens_vendaSub_Total.AsString,
            qryitens_vendaTipo_Recolhimento.AsString,
            qryitens_vendaICMS.AsString,
            qryitens_vendaCancelado.AsString]);

          contadorNItem := contadorNItem + 1;

          AtualizaMd5ItemPedido(qryitens_vendaCodigo_Registro.AsInteger, MD5D3Gerado);

          // um método para atualizar o número do item.
          // gerar MD5
          qryitens_venda.Next;
        end;

        if (gera_os = '0101') then // and (gerar_estoque = 1) then
        begin
          if (dm.qrystatusEncerrado.AsInteger = 0) then
          begin
            FProdutoDominio := TProdutoDominio.Create(Conexao);
            qryitens_venda.First;
            while not qryitens_venda.Eof do
            begin
              FProdutoDominio.AtualizaEstoque
                (qryitens_vendaCodigo_Produto.AsInteger,
                qryitens_vendaQtde.AsFloat, '-', 0);
              qryitens_venda.Next;
            end;
            Cria_Arquivo_Atualiza_Dados('AProd');
          end;
        end;
      end;

      TConexao.ConfirmaConexao(Conexao);
      pode_fechar := true;
      iniciado := false;
      BBtnOrcamento.Enabled := false;
      BBtnConverter_Pre_Venda.Enabled := false;
      BBtnCopiar_DAV.Enabled := false;
      BBtnAnalisa_Venda.Enabled := false;
      BBtnVoltar_Pedido.Enabled := true;
      BBtnCancelar.Enabled := false;
      BBtnExcluir.Enabled := false;
      BBtnNovo.Enabled := true;
      DBGrid2.Visible := false;
      Desabilita_Total;
      liberado_analise_venda := false;
      Util.Desabilita_Campos(FrmPedido_Venda);
      Limpa_Dados_N_Pedido;
      Cria_Arquivo_Qualquer('TemNota');

    except
      on E: Exception do
      begin
        TMensagens.MensagemErro('Erro ao gravar pedido: ' + E.Message);
        TLog.Error('Método BBtnSalvarClick Pedido: ' + E.Message);
        TConexao.CancelaConexao(Conexao);
      end;
    end;

    if (gera_os = '0101') then
    begin
      if (Application.MessageBox('Imprimir OS?', 'Confirmação',
        MB_ICONQUESTION + MB_YESNO)) = IDYES then
      begin
        if (tipo_impressao_pedido = 0) then
          DAV_OS_Modelo_2
        else
        begin
          if (tamanho_impressao = 0) then
          begin
            if (tipo_os = 0) then
            begin
              FrmRel_Impressao_DAV_OS := TFrmRel_Impressao_DAV_OS.Create(self);
              FrmRel_Impressao_DAV_OS.Release;
              FrmRel_Impressao_DAV_OS := Nil;
            end
            else if (tipo_os = 2) then
            begin
              FrmRel_Impressao_DAV_OS_Sem_Equipamento :=
                TFrmRel_Impressao_DAV_OS_Sem_Equipamento.Create(self);
              FrmRel_Impressao_DAV_OS_Sem_Equipamento.Release;
              FrmRel_Impressao_DAV_OS_Sem_Equipamento := Nil;
            end;
          end
          else
          begin
            if (tipo_os = 0) then
            begin
              FrmRel_Impressao_DAV_OS_Meia_Pagina :=
                TFrmRel_Impressao_DAV_OS_Meia_Pagina.Create(self);
              FrmRel_Impressao_DAV_OS_Meia_Pagina.Release;
              FrmRel_Impressao_DAV_OS_Meia_Pagina := Nil;
            end
            else if (tipo_os = 2) then
            begin
              FrmRel_Impressao_DAV_OS_Meia_Pagina_Sem_Equipamento :=
                TFrmRel_Impressao_DAV_OS_Meia_Pagina_Sem_Equipamento.
                Create(self);
              FrmRel_Impressao_DAV_OS_Meia_Pagina_Sem_Equipamento.Release;
              FrmRel_Impressao_DAV_OS_Meia_Pagina_Sem_Equipamento := Nil;
            end;
          end;
        end;
      end;
    end
    else
    begin
      if (cbVendaOrcamento.Checked) then
      begin
        if (gera_dav = '0101') then
        begin
          if (Application.MessageBox('Imprimir orçamento?', 'Confirmação',
            MB_ICONQUESTION + MB_YESNO)) = IDYES then
          begin
            if (tipo_impressao_pedido = 0) then
              DAV_Modelo_1
            else
            begin
              if (tamanho_impressao = 0) then
              begin
                FrmRel_Impressao_DAV := TFrmRel_Impressao_DAV.Create(self);
                FrmRel_Impressao_DAV.Release;
                FrmRel_Impressao_DAV := Nil;
              end
              else
              begin
                FrmRel_Impressao_DAV_Meia_Pagina :=
                  TFrmRel_Impressao_DAV_Meia_Pagina.Create(self);
                FrmRel_Impressao_DAV_Meia_Pagina.Release;
                FrmRel_Impressao_DAV_Meia_Pagina := Nil;
              end;
            end;
          end;
        end;
      end;
    end;

    if (CBImprimir_Lista.Checked) then
    begin
      FrmRel_Lista_Separacao := TFrmRel_Lista_Separacao.Create
        (StrToInt(EdtCodigo.Text), MmoObservacao.Text);
      FrmRel_Lista_Separacao.Release;
      FrmRel_Lista_Separacao := nil;
    end;
  end;

end;

procedure TFrmPedido_Venda.BBtnVoltar_PedidoClick(Sender: TObject);
begin
  Application.CreateForm(TFrmInforma_DAV_Voltar, FrmInforma_DAV_Voltar);
  FrmInforma_DAV_Voltar.ShowModal;
  FrmInforma_DAV_Voltar.Free;
end;

procedure TFrmPedido_Venda.BitBtn1Click(Sender: TObject);
var
  bc, bc2, ali: double;
  Total_Pedido, valor_total, comissao, totalST, total_produto: double;
begin
  Total_Pedido := StrToFloat(EdtTotal_Pedido.Text);
  valor_total := StrToFloat(EdtValor_Total.Text);

  if (usar_comissao = 0) then
    comissao := comissao_ven
  else
    comissao := comissao_produto;

  Verifica_Permissao;

  Verifica_Produto_Lancado;

  if (StrToFloat(EdtValor_Total.Text) < 0) then
  begin
    Valor_Invalido;
    exit;
  end;

  if (Verifica_Produto_Saida(StrToFloat(EdtQuantidade.Text)) = false) then
  begin
    Atualiza_Dados(Conexao);
    Limpa_Menor;
    EdtCodigo_Produto.SetFocus;
    exit;
  end;

  Verifica_Tributacao;

  if (Confira_Itens_Pedido = true) then
  begin
    Calcula_Total;

    // Atualiza_Impostos(StrToFloat(EdtValor_Total.Text));
    TLog.Info('--- CÁLCULAR IMPOSTOS ---');
    TLog.Debug('Iniciou objeto FTributacaoEntidade.');
    FTributacaoEntidade := TTributacaoEntidade.Create;
    TLog.Debug('Iniciou objeto FTributacaoDominio.');
    FTributacaoDominio := TTributacaoDominio.Create(Conexao);
    TLog.Debug('Vai calcular o ICMS.');
    FTributacaoEntidade := FTributacaoDominio.CalculaICMS
      (StrToFloat(EdtValor_Total.Text), StrToFloat(br_icms), StrToInt(icms), uf,
      LblUF.Caption);

    TLog.Debug('Tipo de recolhimento: ' + tipo_recolhimento_icms);
    TLog.Debug('UF Origem: ' + uf);
    TLog.Debug('UF Destino: ' + LblUF.Caption);

    if (tipo_recolhimento_icms = 'ST') and (uf <> LblUF.Caption) then
    begin
      TLog.Debug('Vai calcular o ICMS ST.');
      FTributacaoEntidade := FTributacaoDominio.CalculaICMSST
        (FTributacaoEntidade, LblNCM.Caption, uf, LblUF.Caption);
      Total_Pedido := StrToFloat(EdtTotal_Pedido.Text);
      total_produto := StrToFloat(EdtTotal_Produtos.Text);
      totalST := StrToFloat(EdtTotal_Impostos.Text);

      totalST := totalST + FTributacaoEntidade.ValorICMSST;
      Total_Pedido := Total_Pedido + FTributacaoEntidade.ValorICMSST;
      des_p := TConfigs.RetornaPercentual(Total_Pedido, total_produto);

      Util.FormataFloat(2, EdtTotal_Impostos, totalST);
      Util.FormataFloat(2, EdtTotal_Pedido, Total_Pedido);
      Util.FormataFloat(2, EdtTotal_Desc_Acr, des_p);
    end;

    FTributacaoEntidade := FTributacaoDominio.CalculaCreditoICMS
      (FTributacaoEntidade, csosn, StrToFloat(UDeclaracao.aliquota_sn));
    TLog.Info('--- FIM CÁLCULAR IMPOSTOS ---');
    Grava_Temporario(Conexao);

    Itens_Pedido.Salva_Banco(Conexao, 'S', 'I',
      StrToInt(FrmPedido_Venda.EdtCodigo.Text), UDeclaracao.n_item,
      StrToInt(FrmPedido_Venda.LblProduto.Caption),
      FrmPedido_Venda.EdtCodigo_Produto.Text, FrmPedido_Venda.EdtProduto.Text,
      FrmPedido_Venda.LblNCM.Caption, origem, FrmPedido_Venda.EdtCFOP.Text,
      FrmPedido_Venda.EdtUnidade.Text, tipo_calculo_bc_icms,
      tipo_recolhimento_icms, IntToStr(FTributacaoEntidade.AliquotaOperacao),
      cst_icms, csosn, FloatToStr(FTributacaoEntidade.PercBaseRed),
      FloatToStr(FTributacaoEntidade.BaseCalculo),
      FloatToStr(FTributacaoEntidade.ValorICMS), tipo_calculo_bc_icms_st,
      FloatToStr(FTributacaoEntidade.IVA),
      IntToStr(FTributacaoEntidade.AliquotaEstadoDestino), cst_icms_st, '0',
      '0', FloatToStr(FTributacaoEntidade.BaseCalculoST),
      FTributacaoEntidade.ValorICMSST, UDeclaracao.aliquota_sn,
      FloatToStr(FTributacaoEntidade.CreditoICMS), tipo_calculo_bc_pis, '0',
      cst_ipi, '0', '0', '0', 0, tipo_calculo_bc_pis, '0', cst_pis, '0', '0',
      '0', 0, tipo_calculo_bc_cofins, '0', cst_cofins, '0', '0', '0', 0,
      StrToFloat(FrmPedido_Venda.EdtQuantidade.Text),
      StrToFloat(FrmPedido_Venda.EdtQuantidade.Text), 0, 0,
      FrmPedido_Venda.valor_compra, StrToFloat(EdtValor_Tabela.Text),
      StrToFloat(FrmPedido_Venda.EdtValor_Unitario.Text),
      StrToFloat(EdtDesc_Acr.Text), FrmPedido_Venda.des_p, '$', 'D', 0, 0, 0,
      StrToFloat(FrmPedido_Venda.EdtValor_Total.Text), 0, 'N', 'S',
      StrToDateTime(MEdtData_Venda.Text), '', '', 'A', comissao, perc_desc,
      perc_desc_prazo, permite_credito, codigo_obs_fiscal, 0,
      valor_compra_nota); // qtde_estoque);

//      hora := FormatDateTime('hh:mm:ss', Now);

      hora := GetTime();





    oLS := TListaSeparacaoEntidade.Create;

    oLS.CodigoProduto := EdtCodigo_Produto.Text;
    oLS.DescricaoProduto := EdtProduto.Text;
    oLS.Quantidade := StrToFloat(EdtQuantidade.Text);
    oLS.Marca := '';
    oLS.LocalProduto := '';
    oLSDominio.adicionaProdutosLista(oLS);

    Atualiza_Dados(Conexao);
    Atualiza_Pedido_Temporario(Conexao);
    desc_acr_total := Pega_Total_Desconto
      (StrToInt(FrmPedido_Venda.EdtCodigo.Text), Conexao);
    Util.FormataFloat(2, EdtDesc_Acr_Total, desc_acr_total);
    //  //  //  LOG ITENS PEDIDO // // //
    SalvaBancoItensPedidoLog(StrToInt(FrmPedido_Venda.EdtCodigo.Text),
      qryitens_vendaCodigo_Registro.AsInteger,
      qryitens_vendaCodigo_Produto.AsInteger,
      StrToDateTime(MEdtData_Venda.Text), hora, 'I', Conexao);

    Limpa_Menor;
    BBtnOrcamento.Enabled := true;
    BBtnAnalisa_Venda.Enabled := true;
    Mensagem_Item_Inserido;
    EdtCodigo_Produto.SetFocus;
  end;

end;

procedure TFrmPedido_Venda.Button1Click(Sender: TObject);
begin
  ShowMessage(dm.qrystatusCodigo.AsString + ' - ' +
    dm.qrystatusEncerrado.AsString);
end;

procedure TFrmPedido_Venda.Button2Click(Sender: TObject);
var
  oTesteEntidade: TListaSeparacaoEntidade;
  i: integer;
begin
  { //ShowMessage(CmbVeiculo.ListSource.DataSet.FieldByName(CmbVeiculo.KeyField).Value);
    if (CmbVeiculo.KeyValue = NULL) then
    ShowMessage('Des')
    else
    ShowMessage('At');; }
  for i := 0 to oLSDominio.retornaProdutosLista.Count - 1 do
  begin
    oTesteEntidade := oLSDominio.retornaProdutosLista.Items[i];
    ShowMessage(oTesteEntidade.DescricaoProduto);
  end;
end;

procedure TFrmPedido_Venda.Calcula_Total;
var
  Sub_Total, total_produtos, desconto, Total_Pedido, total_servico, desc,
    Qtde: double;
begin
  Sub_Total := StrToFloat(EdtValor_Total.Text);
  total_servico := StrToFloat(EdtTotal_Servicos.Text);
  valor_venda_original := valor_venda_original +
    StrToFloat(EdtValor_Total.Text);
  // valor_unit:= StrToFloat(EdtValor_Unitario.Text);
  desc := StrToFloat(EdtDesc_Acr.Text);
  Qtde := StrToFloat(EdtQuantidade.Text);
  // desc_acr_total:= StrToFloat(EdtDesc_Acr_Total.Text);

  qtde_itens := StrToInt(EdtQuantidade_Itens.Text);

  { if (var_uni <> 0) then
    begin
    total_produtos:= ( StrToFloat(EdtQuantidade.Text) * var_uni) + StrToFloat(EdtTotal_Produtos.Text);
    end
    else
    begin
    total_produtos:= ( StrToFloat(EdtQuantidade.Text) * valor_unit) + StrToFloat(EdtTotal_Produtos.Text);
    end; }

  total_produtos := (StrToFloat(EdtQuantidade.Text) *
    StrToFloat(EdtValor_Tabela.Text)) + StrToFloat(EdtTotal_Produtos.Text);
  Total_Pedido := StrToFloat(EdtTotal_Pedido.Text) + Sub_Total;

  { des_p_aux:= total_pedido - total_produtos;
    des_p:= ( des_p_aux / total_pedido );
    des_p:= des_p * 100;
    des_p:= Calcula_Valor(FloatToStr(des_p));

    if (des_p > 0) then
    des_p:= des_p * -1
    else
    des_p:= Abs(des_p); }
  des_p := TConfigs.RetornaPercentual(Total_Pedido, total_produtos);

  if (des_p > limite_desc_ven) then
  begin
    TMensagens.MensagemDescontoFuncionario(des_p);
    // Application.MessageBox(PChar('O desconto de '+ QuotedStr(FloatToStr(des_p)) +'%, está acima do limite configurado para o vendedor '+usuario), 'Desconto não permitido', MB_OK+MB_ICONHAND);
    abort;
  end;

  EdtTotal_Produtos.Text := FormatFloat('#0.0,0', total_produtos);
  EdtTotal_Produtos.Text := StringReplace(EdtTotal_Produtos.Text,
    ThousandSeparator, '', [rfReplaceAll]);

  EdtTotal_Pedido.Text := FormatFloat('#0.0,0', Total_Pedido);
  EdtTotal_Pedido.Text := StringReplace(EdtTotal_Pedido.Text, ThousandSeparator,
    '', [rfReplaceAll]);

  Util.FormataFloat(2, EdtTotal_Desc_Acr, des_p);
  // EdtTotal_Desc_Acr.Text:= FloatToStr( des_p );

  Inc(qtde_itens);
  EdtQuantidade_Itens.Text := IntToStr(qtde_itens);

  // novo_valor_uni:= StrToFloat(EdtValor_Unitario.Text);
  // total_valor_uni:= novo_valor_uni - var_uni;

  des_p := StrToFloat(EdtValor_Unitario.Text) -
    StrToFloat(EdtValor_Tabela.Text);
  des_p := des_p / StrToFloat(EdtValor_Unitario.Text);
  // des_p:= ( total_valor_uni / novo_valor_uni );           ///valor original ou valor de compra???
  des_p := des_p * 100;
  des_p := Calcula_Valor(FloatToStr(des_p));

  if (des_p > 0) then
    des_p := des_p * -1
  else
    des_p := Abs(des_p);

  // desc_acr_total:= desc_acr_total + Abs(desc * qtde);
  // limite_compra_disponivel:= limite_compra - total_pedido;
end;

procedure TFrmPedido_Venda.Calcula_Total_Analise(venda_total, P_Fim,
  Custo_Total, Total_Pedido: double);
begin
  if (venda_total <> 0) then
  begin
    perc_fim := venda_total - Custo_Total;
    perc_fim := perc_fim / venda_total;
    perc_fim := perc_fim * 100;
    perc_fim := Calcula_Valor(FloatToStr(perc_fim));

    EdtPerc_Total.Text := FloatToStr(Calcula_Valor(FloatToStr(perc_fim)));

    EdtVenda_Total.Text := FormatFloat('#0.0,0', venda_total);
    EdtVenda_Total.Text := StringReplace(EdtVenda_Total.Text, ThousandSeparator,
      '', [rfReplaceAll]);

    EdtCusto_Total.Text := FormatFloat('#0.0,0', Custo_Total);
    EdtCusto_Total.Text := StringReplace(EdtCusto_Total.Text, ThousandSeparator,
      '', [rfReplaceAll]);
  end;

end;

procedure TFrmPedido_Venda.Calcula_Total_Deletado;
var
  Sub_Total, total_produtos, peso_total, desconto, Total_Pedido, limite_compra,
    limite_compra_disponivel, total_desc_acr, total_acrecimo, tot_des, tot_acre,
    limite_desconto, desconto_item, total_Geral, aux, aux2, tot_ped, tot_prod,
    imp_prod, tot_imp: double;
begin
  if (qryitens_venda.RecordCount <> 0) then
  begin
    Sub_Total := qryitens_vendaSub_Total.AsFloat;
    total_produtos := 0;
    Total_Pedido := 0;
    tot_imp := 0;
    imp_prod := 0;
    tot_ped := StrToFloat(EdtTotal_Pedido.Text);
    tot_prod := StrToFloat(EdtTotal_Produtos.Text);

    qtde_itens := StrToInt(EdtQuantidade_Itens.Text);
    Dec(qtde_itens);
    EdtQuantidade_Itens.Text := IntToStr(qtde_itens);

    total_produtos := tot_prod -
      (qryitens_vendaQtde.AsFloat * qryitens_vendaValor_Original.AsFloat);
    EdtTotal_Produtos.Text := FormatFloat('#0.0,0', total_produtos);
    EdtTotal_Produtos.Text := StringReplace(EdtTotal_Produtos.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    if (qryitens_vendaTipo_Recolhimento.AsString = 'ST') and
      (uf <> LblUF.Caption) then
    begin
      imp_prod := qryitens_vendaValor_ICMS_ST.AsFloat;
      tot_imp := StrToFloat(EdtTotal_Impostos.Text);
      tot_imp := tot_imp - imp_prod;
      Util.FormataFloat(2, EdtTotal_Impostos, tot_imp);
    end;

    Total_Pedido := tot_ped - Sub_Total - imp_prod;
    // ( StrToFloat(EdtTotal_Desc_Acr.Text ) + ( StrToFloat(EdtTotal_Desconto.Text )));

    EdtTotal_Pedido.Text := FormatFloat('#0.0,0', Total_Pedido);
    EdtTotal_Pedido.Text := StringReplace(EdtTotal_Pedido.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    if (Total_Pedido <> 0) then
    begin
      des_p := TConfigs.RetornaPercentual(Total_Pedido, total_produtos);

      Util.FormataFloat(2, EdtTotal_Desc_Acr, des_p);

      // desc_acr_total:= desc_acr_total - Abs(qryitens_vendaDesc_Acr.AsFloat * qryitens_vendaQtde.AsFloat);
      // Util.FormataFloat(2, EdtDesc_Acr_Total, desc_acr_total);
      // limite_compra_disponivel:= limite_compra + total_pedido;
    end
    else
    begin
      EdtTotal_Desc_Acr.Text := '0,00';
      // EdtDesc_Acr_Total.Text:= '0,00';
    end;

  end;
end;

procedure TFrmPedido_Venda.Calcula_Total_Pedido_Temporario_Deletado;
var
  total_ped: double;
begin
  total_ped := StrToFloat(EdtTotal_Pedido.Text);

  // if (total_ped <> 0) then
  Calcula_Total_Analise((StrToFloat(EdtVenda_Total.Text) -
    (qryitens_vendaSub_Total.AsFloat)), perc_fim,
    (StrToFloat(EdtCusto_Total.Text) - (qryitens_vendaValor_Compra.AsFloat *
    qryitens_vendaQtde.AsFloat)), total_ped);
end;

procedure TFrmPedido_Venda.Calcula_Total_Servico(Valor_Servico: double;
  var Conexao: TADOConnection; Tipo: AnsiString);
var
  Total_Pedido, total_servico: double;
  qAux: TADOQuery;
begin

  try
    qAux := TADOQuery.Create(self);
    with qAux, sql do
    begin
      Close;
      Connection := Conexao;
      Clear;
      add('select sum(Sub_Total) as Total_Servico from Itens_OS where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
      open;
    end;

    total_servico := qAux.FieldByName('Total_Servico').AsFloat;
    Total_Pedido := Pega_Total_Pedido(StrToInt(EdtCodigo.Text), Conexao);
    // StrToFloat(EdtTotal_Pedido.Text);

    if (Tipo = '+') then
      Total_Pedido := Total_Pedido + total_servico
    else
    begin
      Total_Pedido := (Total_Pedido + total_servico) - Valor_Servico;
      total_servico := total_servico - Valor_Servico;
    end;

    // Pega_Total_Pedido(StrToInt(EdtCodigo.Text));

    // EdtTotal_Servicos.Text:=  FloatToStr(Total_Servico);
    // EdtTotal_Pedido.Text:= FloatToStr(Total_Pedido);
    Util.FormataFloat(2, EdtTotal_Servicos, total_servico);
    Util.FormataFloat(2, EdtTotal_Pedido, Total_Pedido);

  finally
    FreeAndNil(qAux);
  end;

end;

function TFrmPedido_Venda.Calcula_Valor_Original_Venda
  (var Conexao: TADOConnection): double;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      Close;
      Connection := Conexao;
      Clear;
      add('select sum(IP.Valor_Original * IP.Qtde) as Total from Itens_Pedido IP');
      add('where IP.Codigo = :Codigo and IP.Cancelado = :N');
      Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
      Parameters.ParamByName('N').Value := 'N';
      open;
      Result := qAux.FieldByName('Total').AsFloat;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

function TFrmPedido_Venda.Chama_Pedido(var Conexao: TADOConnection): Boolean;
begin
  EdtN_Pedido.Text := StringOfChar('0', 12 - Length(EdtN_Pedido.Text)) +
    EdtN_Pedido.Text;
  with qAux, sql do
  begin
    Close;
    Connection := Conexao;
    Clear;
    add('Select P.*, Cli.Nome_Nome_Fantasia, Cli.Credito, Cli.Limite_Credito, Cli.Limite_Desconto, Cli.Acima_Limite_Credito, Cli.Insc_Estadual,');
    add('CP.Descricao as Cond_Pag, F.Nome as Usuario from Pedido P');
    add('left join Cliente Cli on (Cli.Codigo = P.Codigo_Cliente)');
    add('left join Condicao_Pagamento CP on (P.Codigo_Forma_Pag = CP.Codigo)');
    add('left join Funcionario F on (P.Codigo_Funcionario = F.Codigo)');
    add('where P.N_Pedido = :Pedido and P.Status = :Status');
    Parameters.ParamByName('Pedido').Value := EdtN_Pedido.Text;
    Parameters.ParamByName('Status').Value := 'PENDENTE';
    open;
  end;

  if (qAux.IsEmpty = false) then
  begin
    EdtCodigo.Text := qAux.FieldByName('Codigo').AsString;
    Result := true;
    // Atualiza_Dados;

    { qryitens_venda.First;

      while not qryitens_venda.Eof do
      begin
      if (qryitens_vendaCancelado.AsString = 'S') then
      qryitens_venda.Next
      else
      begin
      if (qryitens_vendaDesc_Acr.AsFloat > 0) then
      begin
      EdtTotal_Desc_Acr.Text:= FormatFloat('#0.0,0', StrToFloat(EdtTotal_Desc_Acr.Text) + qryitens_vendaDesc_Acr.AsFloat);
      EdtTotal_Desc_Acr.Text:= StringReplace(EdtTotal_Desc_Acr.Text, ThousandSeparator, '', [rfReplaceAll]);
      end;
      qryitens_venda.Next;
      end;
      end;
      qryitens_venda.First; }
  end
  else
    Result := false;
end;

procedure TFrmPedido_Venda.ClientDataSet1AfterEdit(DataSet: TDataSet);
begin
  altera_analise := true;
end;

procedure TFrmPedido_Venda.CmbVeiculoChange(Sender: TObject);
begin
  EdtVeiculo.Text := dm.qryveiculoVeiculo.AsString;
  EdtModelo.Text := dm.qryveiculoModelo.AsString;
end;

function TFrmPedido_Venda.Confira_Itens_Pedido: Boolean;
begin
  Confira_Itens_Pedido := false;

  if (EdtCodigo_Produto.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Produto.SetFocus;
    exit;
  end;

  if (EdtQuantidade.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtQuantidade.SetFocus;
    exit;
  end;

  if (EdtDesc_Acr.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtDesc_Acr.SetFocus;
    exit;
  end;

  if (EdtValor_Total.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtValor_Total.SetFocus;
    exit;
  end;

  Confira_Itens_Pedido := true;
end;

function TFrmPedido_Venda.Confira_Pedido: Boolean;
begin
  Confira_Pedido := false;

  if (EdtCodigo.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo.SetFocus;
    exit;
  end;

  if (EdtN_Pedido.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtN_Pedido.SetFocus;
    exit;
  end;

  if (EdtCodigo_Cliente.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Cliente.SetFocus;
    exit;
  end;

  if (EdtCodigo_Forma_Pagamento.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Forma_Pagamento.SetFocus;
    exit;
  end;

  if (MEdtData_Venda.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    MEdtData_Venda.SetFocus;
    exit;
  end;

  if (MEdtData_Vencimento.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    MEdtData_Vencimento.SetFocus;
    exit;
  end;

  if (gera_os = '0101') then
  begin
    if (CmbStatus.KeyValue = NULL) then
    begin
      TMensagens.MensagemErro('Escolha um status para a OS.');
      CmbStatus.SetFocus;
      exit;
    end;
  end;
  { if (qryitens_venda.RecordCount = 0) then
    begin
    Mensagem_Falta_Dados;
    abort;
    end; }

  { if (MEdtData_Previsao_Entrega.Text = '  /  /    ') then
    begin
    Mensagem_Falta_Dados;
    MEdtData_Previsao_Entrega.SetFocus;
    abort;
    end; }

  Confira_Pedido := true;
end;

procedure TFrmPedido_Venda.Copia_Dados;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(self);
  with qryitens_venda_aux, sql do
  begin
    Close;
    Clear;
    add('select IP.*, M.Descricao as Marca from Itens_Pedido_Aux IP');
    add('left join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
    add('where IP.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
    open;
  end;

  qryitens_venda_aux.First;
  while not qryitens_venda_aux.Eof do
  begin

    with qAux, sql do
    begin
      Close;
      Connection := dm.ADOConnection1;
      Clear;
      add('UPDATE Itens_Pedido');
      add('   SET N_Item = :N_Item');
      add('      ,UN = :UN');
      add('      ,Aliquota_Calculo_Credito = :Aliquota_Calculo_Credito');
      add('      ,Credito_ICMS = :Credito_ICMS');
      add('      ,Qtde = :Qtde');
      add('      ,Valor_Compra = :Valor_Compra');
      add('      ,Valor_Original = :Valor_Original');
      add('      ,Valor_Unitario = :Valor_Unitario');
      add('      ,Desc_Acr = :Desc_Acr');
      add('      ,Desc_Acr_P = :Desc_Acr_P');
      add('      ,Tipo_Desc_Acr = :Tipo_Desc_Acr');
      add('      ,dOUa = :dOUa');
      add('      ,Sub_Total = :Sub_Total');
      add('      ,Sub_Total_Liquido = :Sub_Total_Liquido');
      add('      ,Cancelado = :Cancelado');
      add('      ,Indica_Valor_Total = :Indica_Valor_Total');
      add('where Codigo_Produto = :Codigo_Produto');

      Parameters.ParamByName('Codigo_Produto').Value :=
        qryitens_venda_auxCodigo_Produto.AsInteger;
      Parameters.ParamByName('N_Item').Value :=
        qryitens_venda_auxN_Item.AsString;
      Parameters.ParamByName('UN').Value := qryitens_venda_auxUN.AsString;;

      Parameters.ParamByName('Aliquota_Calculo_Credito').Value :=
        qryitens_venda_auxAliquota_Calculo_Credito.AsString;
      Parameters.ParamByName('Credito_ICMS').Value :=
        qryitens_venda_auxCredito_ICMS.AsString;

      Parameters.ParamByName('Qtde').Value := qryitens_venda_auxQtde.AsString;
      Parameters.ParamByName('Valor_Compra').Value :=
        qryitens_venda_auxValor_Compra.AsString;;
      Parameters.ParamByName('Valor_Original').Value :=
        qryitens_venda_auxValor_Original.AsString;;
      Parameters.ParamByName('Valor_Unitario').Value :=
        qryitens_venda_auxValor_Unitario.AsString;;
      Parameters.ParamByName('Desc_Acr').Value :=
        qryitens_venda_auxDesc_Acr.AsString;;
      Parameters.ParamByName('Desc_Acr_P').Value :=
        qryitens_venda_auxDesc_Acr_P.AsString;;
      Parameters.ParamByName('Tipo_Desc_Acr').Value :=
        qryitens_venda_auxTipo_Desc_Acr.AsString;;
      Parameters.ParamByName('dOUa').Value := qryitens_venda_auxdOUa.AsString;;
      Parameters.ParamByName('Sub_Total').Value :=
        qryitens_venda_auxSub_Total.AsString;;
      Parameters.ParamByName('Sub_Total_Liquido').Value :=
        qryitens_venda_auxSub_Total_Liquido.AsString;;
      Parameters.ParamByName('Cancelado').Value :=
        qryitens_venda_auxCancelado.AsString;;
      Parameters.ParamByName('Indica_Valor_Total').Value :=
        qryitens_venda_auxIndica_Valor_Total.AsString;;
      ExecSQL;
    end;

    qryitens_venda_aux.Next;
  end;
end;

procedure TFrmPedido_Venda.Copia_Dados_Salvar(var Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(self);

  qryitens_venda.First;
  while not qryitens_venda.Eof do
  begin

    with qAux, sql do
    begin
      Close;
      Connection := Conexao;
      Clear;
      add('UPDATE Itens_Pedido_Aux');
      add('   SET N_Item = :N_Item');
      add('      ,UN = :UN');
      add('      ,Aliquota_Calculo_Credito = :Aliquota_Calculo_Credito');
      add('      ,Credito_ICMS = :Credito_ICMS');
      add('      ,Qtde = :Qtde');
      add('      ,Valor_Compra = :Valor_Compra');
      add('      ,Valor_Original = :Valor_Original');
      add('      ,Valor_Unitario = :Valor_Unitario');
      add('      ,Desc_Acr = :Desc_Acr');
      add('      ,Desc_Acr_P = :Desc_Acr_P');
      add('      ,Tipo_Desc_Acr = :Tipo_Desc_Acr');
      add('      ,dOUa = :dOUa');
      add('      ,Sub_Total = :Sub_Total');
      add('      ,Sub_Total_Liquido = :Sub_Total_Liquido');
      add('      ,Cancelado = :Cancelado');
      add('      ,Indica_Valor_Total = :Indica_Valor_Total');
      add('where Codigo_Produto = :Codigo_Produto');

      Parameters.ParamByName('Codigo_Produto').Value :=
        qryitens_vendaCodigo_Produto.AsInteger;
      Parameters.ParamByName('N_Item').Value := qryitens_vendaN_Item.AsString;
      Parameters.ParamByName('UN').Value := qryitens_vendaUN.AsString;;

      Parameters.ParamByName('Aliquota_Calculo_Credito').Value :=
        qryitens_vendaAliquota_Calculo_Credito.AsString;
      Parameters.ParamByName('Credito_ICMS').Value :=
        qryitens_vendaCredito_ICMS.AsString;

      Parameters.ParamByName('Qtde').Value := qryitens_vendaQtde.AsString;
      Parameters.ParamByName('Valor_Compra').Value :=
        qryitens_vendaValor_Compra.AsString;;
      Parameters.ParamByName('Valor_Original').Value :=
        qryitens_vendaValor_Original.AsString;;
      Parameters.ParamByName('Valor_Unitario').Value :=
        qryitens_vendaValor_Unitario.AsString;;
      Parameters.ParamByName('Desc_Acr').Value :=
        qryitens_vendaDesc_Acr.AsString;;
      Parameters.ParamByName('Desc_Acr_P').Value :=
        qryitens_vendaDesc_Acr_P.AsString;;
      Parameters.ParamByName('Tipo_Desc_Acr').Value :=
        qryitens_vendaTipo_Desc_Acr.AsString;;
      Parameters.ParamByName('dOUa').Value := qryitens_vendadOUa.AsString;;
      Parameters.ParamByName('Sub_Total').Value :=
        qryitens_vendaSub_Total.AsString;;
      Parameters.ParamByName('Sub_Total_Liquido').Value :=
        qryitens_vendaSub_Total_Liquido.AsString;;
      Parameters.ParamByName('Cancelado').Value :=
        qryitens_vendaCancelado.AsString;;
      Parameters.ParamByName('Indica_Valor_Total').Value :=
        qryitens_vendaIndica_Valor_Total.AsString;;
      ExecSQL;
    end;

    qryitens_venda.Next;
  end;

end;

procedure TFrmPedido_Venda.Cabecalho_Comprovante_Entrega;
var
  i: integer;
  lista: AnsiString;
begin
  if (rs.Paginas = 0) then
    rs.BeginDoc;
  i := 0;
  i2 := 136;
  linha := 0;
  conta := 0;

  lista := 'COMPROVANTE DE ENTREGA';

  Inc(linha);
  rs.WriteFont(linha, Alinha_Centro(lista, i2), lista, [Bold] + [DobleWide]);
  Inc(linha);

  for i := 0 to i2 do
    rs.Write(linha, i, '-');

  cn := Copy(cnpj, 1, 2) + '.' + Copy(cnpj, 3, 3) + '.' + Copy(cnpj, 6, 3) + '/'
    + Copy(cnpj, 9, 4) + '-' + Copy(cnpj, 13, 2);

  cp := Copy(LblCPF.Caption, 1, 3) + '.' + Copy(LblCPF.Caption, 4, 3) + '.' +
    Copy(LblCPF.Caption, 7, 3) + '-' + Copy(LblCPF.Caption, 10, 2);

  Inc(linha);
  rs.Write(linha, 0, 'Empresa');
  rs.Write(linha, 50, 'CNPJ');
  Inc(linha);
  rs.Write(linha, 0, nome_fantasia);
  rs.Write(linha, 50, cn);

  Inc(linha);
  i := 1;
  for i := 0 to i2 do
    rs.Write(linha, i, '-');

  Inc(linha);
  rs.Write(linha, 0, 'Destinatário');
  rs.Write(linha, 50, 'CPF/CNPJ');
  Inc(linha);
  rs.Write(linha, 0, EdtCliente.Text);
  rs.Write(linha, 50, cp);

  Inc(linha);
  i := 1;
  for i := 0 to i2 do
    rs.Write(linha, i, '-');

  linha := linha + 2;
  rs.WriteFont(linha, 0, 'Produtos', [Underline]);
  linha := linha + 2;
  rs.WriteFont(linha, 0, 'Código Produto', [Underline]);
  rs.WriteFont(linha, 16, 'Descrição', [Underline]);
  rs.WriteFont(linha, 70, 'Un.', [Underline]);
  rs.WriteFont(linha, 80, 'Qtde.', [Underline]);
  rs.WriteFont(linha, 90, 'Marca', [Underline]);
  linha := linha + 2;
end;

procedure TFrmPedido_Venda.Cabecalho_DAV;
var
  i: integer;
  endereco, endereco_empresa: AnsiString;
begin
  if (rs.Paginas = 0) then
    rs.BeginDoc;
  i := 0;
  i2 := 136;
  linha := 0;
  conta := 0;

  dav := 'NÃO É DOCUMENTO FISCAL - NÃO É VÁLIDO COMO RECIBO E COMO GARANTIA DE MERCADORIA - ';
  dav2 := 'NÃO COMPROVA PAGAMENTO';
  tipo_rel := 'DOCUMENTO AUXILIAR DE VENDA - ORÇAMENTO';

  Inc(linha);
  rs.WriteFont(linha, Alinha_Centro(tipo_rel, i2), tipo_rel, [Bold]);
  Inc(linha);
  rs.WriteFont(linha, Alinha_Centro(dav, i2), dav, [Bold]);
  Inc(linha);
  rs.WriteFont(linha, Alinha_Centro(dav2, i2), dav2, [Bold]);

  Inc(linha);
  for i := 0 to i2 do
    rs.Write(linha, i, '-');

  cn := Copy(cnpj, 1, 2) + '.' + Copy(cnpj, 3, 3) + '.' + Copy(cnpj, 6, 3) + '/'
    + Copy(cnpj, 9, 4) + '-' + Copy(cnpj, 13, 2);

  cp := Copy(LblCPF.Caption, 1, 3) + '.' + Copy(LblCPF.Caption, 4, 3) + '.' +
    Copy(LblCPF.Caption, 7, 3) + '-' + Copy(LblCPF.Caption, 10, 2);

  endereco := LblEndereco.Caption + ', Nº ' + LblNumero.Caption + ', Setor ' +
    LblSetor.Caption;
  endereco_empresa := UDeclaracao.endereco + ', Nº ' + UDeclaracao.numero +
    ', Setor ' + UDeclaracao.setor;

  Inc(linha);
  rs.Write(linha, 0, 'Empresa');
  rs.Write(linha, 50, 'Endereço');
  rs.Write(linha, 100, 'CNPJ');
  rs.Write(linha, 120, 'Telefone');
  // rs.Write(linha,130,'Data');
  Inc(linha);
  rs.Write(linha, 0, nome_fantasia);
  rs.Write(linha, 50, endereco_empresa);
  rs.Write(linha, 100, cn);
  rs.Write(linha, 120, telefone);
  // rs.Write(linha,130,MEdtData_Venda.Text);

  Inc(linha);
  i := 1;
  for i := 0 to i2 do
    rs.Write(linha, i, '-');

  Inc(linha);
  rs.Write(linha, 0, 'Destinatário');
  rs.Write(linha, 50, 'Endereço');
  rs.Write(linha, 100, 'CPF/CNPJ');
  rs.Write(linha, 115, 'Telefone');
  Inc(linha);
  rs.Write(linha, 0, EdtCliente.Text);
  rs.Write(linha, 50, Copy(endereco, 0, 50));
  rs.Write(linha, 100, LblCPF.Caption);
  rs.Write(linha, 115, LblTelefone.Caption);

  Inc(linha);
  i := 1;
  for i := 0 to i2 do
    rs.Write(linha, i, '-');

  Inc(linha);
  rs.Write(linha, 0, 'Número do Documento: ' + EdtN_Pedido.Text);
  rs.Write(linha, 40, 'Número do Documento Fiscal: ' + '');
  rs.Write(linha, 90, 'Página Nº: ' + IntToStr(rs.PageNo));
  rs.Write(linha, 115, 'Data: ' + MEdtData_Venda.Text);

  Inc(linha);
  i := 1;
  for i := 0 to i2 do
    rs.Write(linha, i, '-');

  linha := linha + 2;
  rs.WriteFont(linha, 0, 'Produtos', [Underline]);
  linha := linha + 2;
  rs.WriteFont(linha, 0, 'Cód. Sis.', [Underline]);
  rs.WriteFont(linha, 10, 'Código Produto', [Underline]);
  rs.WriteFont(linha, 25, 'Descrição', [Underline]);
  rs.WriteFont(linha, 65, 'Un.', [Underline]);
  rs.WriteFont(linha, 70, 'Qtde.', [Underline]);
  rs.WriteFont(linha, 76, 'Valor Tab.', [Underline]);
  rs.WriteFont(linha, 87, 'Desconto', [Underline]);
  rs.WriteFont(linha, 96, 'Valor Un.', [Underline]);
  rs.WriteFont(linha, 106, 'Valor Total', [Underline]);
  rs.WriteFont(linha, 118, 'Marca', [Underline]);
//  rs.WriteFont(linha, 121, 'Local', [Underline]);
  linha := linha + 2;

end;

procedure TFrmPedido_Venda.Cabecalho_Lista_Separacao;
var
  i: integer;
  lista: AnsiString;
begin
  if (rs.Paginas = 0) then
    rs.BeginDoc;
  i := 0;
  i2 := 136;
  linha := 0;
  conta := 0;

  lista := 'LISTA DE SEPARAÇÃO';

  Inc(linha);
  rs.WriteFont(linha, Alinha_Centro(lista, i2), lista, [Bold] + [DobleWide]);
  Inc(linha);

  for i := 0 to i2 do
    rs.Write(linha, i, '-');

  cn := Copy(cnpj, 1, 2) + '.' + Copy(cnpj, 3, 3) + '.' + Copy(cnpj, 6, 3) + '/'
    + Copy(cnpj, 9, 4) + '-' + Copy(cnpj, 13, 2);

  cp := Copy(LblCPF.Caption, 1, 3) + '.' + Copy(LblCPF.Caption, 4, 3) + '.' +
    Copy(LblCPF.Caption, 7, 3) + '-' + Copy(LblCPF.Caption, 10, 2);

  Inc(linha);
  rs.Write(linha, 0, 'Empresa');
  rs.Write(linha, 50, 'CNPJ');
  Inc(linha);
  rs.Write(linha, 0, nome_fantasia);
  rs.Write(linha, 50, cn);

  Inc(linha);
  i := 1;
  for i := 0 to i2 do
    rs.Write(linha, i, '-');

  Inc(linha);
  rs.Write(linha, 0, 'Destinatário');
  rs.Write(linha, 50, 'CPF/CNPJ');
  Inc(linha);
  rs.Write(linha, 0, EdtCliente.Text);
  rs.Write(linha, 50, cp);

  Inc(linha);
  i := 1;
  for i := 0 to i2 do
    rs.Write(linha, i, '-');

  linha := linha + 2;
  rs.WriteFont(linha, 0, 'Produtos', [Underline]);
  linha := linha + 2;
  rs.WriteFont(linha, 0, 'Código Produto', [Underline]);
  rs.WriteFont(linha, 16, 'Descrição', [Underline]);
  rs.WriteFont(linha, 70, 'Un.', [Underline]);
  rs.WriteFont(linha, 80, 'Qtde.', [Underline]);
  rs.WriteFont(linha, 90, 'Marca', [Underline]);
  rs.WriteFont(linha, 111, 'T. Ent.', [Underline]);
  linha := linha + 2;
end;

procedure TFrmPedido_Venda.DAV_Modelo_1;
var
  i: integer;
begin
  Cabecalho_DAV;
  i := 0;

  Atualiza_Dados(Conexao);
  qryitens_venda.First;

  { rs.WriteFont(linha, 0,'Cód. Sis.', [Underline]);
    rs.WriteFont(linha, 10,'Código Produto', [Underline]);
    rs.WriteFont(linha, 24, 'Descrição', [Underline]);
    rs.WriteFont(linha, 60, 'Un.', [Underline]);
    rs.WriteFont(linha, 65, 'Qtde.', [Underline]);
    rs.WriteFont(linha, 75, 'Valor Un.', [Underline]);
    rs.WriteFont(linha, 90, 'Valor Total', [Underline]);
    rs.WriteFont(linha, 105, 'Marca', [Underline]);
    rs.WriteFont(linha, 120, 'Local', [Underline]); }

  while not qryitens_venda.Eof do
  begin

    rs.Write(linha, 0, qryitens_vendaCodigo_Produto.AsString);
    rs.Write(linha, 10, qryitens_vendaCodigo_Venda.AsString);
    rs.Write(linha, 25, Copy(qryitens_vendaDescricao.AsString, 1, 35));
    rs.Write(linha, 65, qryitens_vendaUN.AsString); // 70
    rs.Write(linha, 70, FormatFloat('#0.0,0', qryitens_vendaQtde.AsFloat));
    // 75
    rs.Write(linha, 76, FormatFloat('#0.0,0',
      qryitens_vendaValor_Original.AsFloat)); // 85
    rs.Write(linha, 87, FormatFloat('#0.0,0', qryitens_vendaDesc_Acr.AsFloat));
    // 85
    rs.Write(linha, 96, FormatFloat('#0.0,0',
      qryitens_vendaValor_Unitario.AsFloat)); // 85
    rs.Write(linha, 106, FormatFloat('#0.0,0', qryitens_vendaSub_Total.AsFloat));
    // 100
    rs.Write(linha, 118, Copy(qryitens_vendaMarca.AsString, 1, 15)); // 115
//    rs.Write(linha, 121, qryitens_vendaLocal.AsString); // 115
    Inc(linha);

    if (linha = rs.Lines) then
    begin
      rs.NewPage;
      Cabecalho_DAV;
    end;

    qryitens_venda.Next;
  end;

  i := 1;
  for i := 0 to i2 do
    rs.Write(linha + 1, i, '-');

  if (linha <= rs.Lines - 5) then
  begin
    i := 1;
    rs.Write(linha + 2, i, 'Cond. Pag.........: ' + EdtForma_Pagamento.Text);
    rs.Write(linha + 3, i, 'Qtde. Itens.......: ' + EdtQuantidade_Itens.Text);
    rs.Write(linha + 4, i, 'Vendedor..........: ' + EdtAtendente.Text);
    rs.Write(linha + 5, i, 'Observação........: ' +
      Copy(MmoObservacao.Text, 1, 100));
    rs.Write(linha + 6, i, 'Total Bruto......: ' + EdtTotal_Produtos.Text);
    rs.Write(linha + 7, i, 'Total Descontos......: ' + EdtDesc_Acr_Total.Text);
    rs.WriteFont(linha + 8, i, 'Total Pedido......: ' +
      EdtTotal_Pedido.Text, [Bold]);
    linha := linha + 9;
  end
  else
  begin
    rs.NewPage;
    linha := 1;
    i := 1;
    rs.Write(linha, i, 'Cond. Pag.........: ' + EdtForma_Pagamento.Text);
    rs.Write(linha + 1, i, 'Qtde. Itens.......: ' + EdtQuantidade_Itens.Text);
    rs.Write(linha + 2, i, 'Vendedor..........: ' + EdtAtendente.Text);
    rs.Write(linha + 3, i, 'Observação........: ' +
      Copy(MmoObservacao.Text, 1, 100));
    rs.Write(linha + 4, i, 'Total Bruto......: ' + EdtTotal_Produtos.Text);
    rs.Write(linha + 5, i, 'Total Descontos......: ' + EdtDesc_Acr_Total.Text);
    rs.WriteFont(linha + 6, i, 'Total Pedido......: ' +
      EdtTotal_Pedido.Text, [Bold]);
    linha := linha + 9;
  end;

  rodape := 'É vedada a autenticação deste documento';

  if (linha < rs.Lines - 1) then
    rs.Write(linha + 1, Alinha_Centro(rodape, i2), rodape)
  else
  begin
    rs.NewPage;
    linha := 1;
    rs.Write(linha, Alinha_Centro(rodape, i2), rodape)
  end;
  rs.PreviewReal;
  rs.EndDoc;
end;

procedure TFrmPedido_Venda.Comprovante_Compra;
var
  i: integer;
begin
  Cabecalho_DAV;
  i := 0;

  Atualiza_Dados(Conexao);
  qryitens_venda.First;

  while not qryitens_venda.Eof do
  begin
    rs.Write(linha, 0, qryitens_vendaCodigo_Venda.AsString);
    rs.Write(linha, 16, qryitens_vendaDescricao.AsString);
    rs.Write(linha, 56, qryitens_vendaMarca.AsString);
    rs.Write(linha, 74, qryitens_vendaUN.AsString);
    rs.Write(linha, 80, FormatFloat('#0.0,0', qryitens_vendaQtde.AsFloat));
    rs.Write(linha, 88, FormatFloat('#0.0,0',
      qryitens_vendaValor_Unitario.AsFloat));
    rs.Write(linha, 105, FormatFloat('#0.0,0',
      qryitens_vendaSub_Total.AsFloat));
    rs.Write(linha, 124, qryitens_vendaCancelado.AsString);
    Inc(linha);

    if (linha = rs.Lines) then
    begin
      rs.NewPage;
      Cabecalho_DAV;
    end;

    qryitens_venda.Next;
  end;

  i := 1;
  for i := 0 to i2 do
    rs.Write(linha + 1, i, '-');

  if (linha <= rs.Lines - 3) then
  begin
    i := 1;
    rs.Write(linha + 2, i, 'Qtde. Itens.......: ' + EdtQuantidade_Itens.Text);
    rs.WriteFont(linha + 3, i, 'Total Pedido......: ' +
      EdtTotal_Pedido.Text, [Bold]);
  end
  else
  begin
    rs.NewPage;
    linha := 1;
    i := 1;
    rs.Write(linha, i, 'Qtde. Itens.......: ' + EdtQuantidade_Itens.Text);
    rs.WriteFont(linha + 1, i, 'Total Pedido......: ' + FormatFloat('#0.0,0',
      StrToFloat(EdtTotal_Pedido.Text)), [Bold]);
  end;

  rodape := 'É vedada a autenticação deste documento';

  if (linha <= rs.Lines - 1) then
    rs.Write(linha + 7, Alinha_Centro(rodape, i2), rodape)
  else
  begin
    rs.NewPage;
    linha := 1;
    rs.Write(linha, Alinha_Centro(rodape, i2), rodape)
  end;
  rs.Print;
  rs.EndDoc;
end;

procedure TFrmPedido_Venda.DAV_Modelo_2;
var
  i, i2, linha: integer;
  dav, dav2, tipo_rel, rodape: string;
  cn, cp: string;
begin
  rs.BeginDoc;
  i := 0;
  i2 := 136;

  dav := 'NÃO É DOCUMENTO FISCAL - NÃO É VÁLIDO COMO RECIBO E COMO GARANTIA DE MERCADORIA - ';
  dav2 := 'NÃO COMPROVA PAGAMENTO';
  tipo_rel := 'DOCUMENTO AUXILIAR DE VENDA - ORÇAMENTO';

  rs.WriteFont(1, Alinha_Centro(tipo_rel, i2), tipo_rel, [Bold] + [DobleWide]);
  rs.WriteFont(2, Alinha_Centro(dav, i2), dav, [Bold] + [DobleWide]);
  rs.WriteFont(3, Alinha_Centro(dav2, i2), dav2, [Bold] + [DobleWide]);

  for i := 0 to i2 do
    rs.Write(4, i, '-');

  cn := Copy(cnpj, 1, 2) + '.' + Copy(cnpj, 3, 3) + '.' + Copy(cnpj, 6, 3) + '/'
    + Copy(cnpj, 9, 4) + '-' + Copy(cnpj, 13, 2);

  cp := Copy(LblCPF.Caption, 1, 3) + '.' + Copy(LblCPF.Caption, 4, 3) + '.' +
    Copy(LblCPF.Caption, 7, 3) + '-' + Copy(LblCPF.Caption, 10, 2);

  rs.Write(5, 0, 'Empresa: ' + nome_fantasia);
  rs.Write(5, 60, 'Endereco: ' + tipo_endereco + ' ' + endereco + ', '
    + numero);

  rs.Write(6, 0, 'CNPJ: ' + cn);
  rs.Write(6, 30, 'Insc. Estadual: ' + insc_estadual);
  rs.Write(6, 60, 'Insc. Municipal: ' + insc_municipal);

  rs.Write(7, 0, 'Telefone: ' + telefone);

  i := 1;
  for i := 0 to i2 do
    rs.Write(8, i, '-');

  rs.Write(9, 0, 'Cliente: ' + EdtCliente.Text);
  rs.Write(9, 60, 'Endereço: ' + LblTipo_Logradouro.Caption + ' ' +
    LblEndereco.Caption + ', ' + LblNumero.Caption);

  rs.Write(10, 0, 'CPF/CNPJ: ' + cp);
  rs.Write(10, 30, 'Cidade: ' + LblCidade.Caption);
  rs.Write(10, 60, 'UF: ' + LblUF.Caption);

  rs.Write(11, 0, 'Setor: ' + LblSetor.Caption);
  rs.Write(11, 30, 'Telefone: ' + LblTelefone.Caption);

  i := 1;
  for i := 0 to i2 do
    rs.Write(12, i, '-');

  rs.Write(13, 0, 'Número do Documento: ' + EdtN_Pedido.Text);
  rs.Write(13, 40, 'Número do Documento Fiscal: ' + '');

  i := 1;
  for i := 0 to i2 do
    rs.Write(14, i, '-');

  rs.WriteFont(18, 0, 'Produtos', [Underline]);
  rs.WriteFont(18, 0, 'Código Produto', [Underline]);
  rs.WriteFont(18, 16, 'Descrição', [Underline]);
  rs.WriteFont(18, 60, 'Un.', [Underline]);
  rs.WriteFont(18, 66, 'Qtde.', [Underline]);
  rs.WriteFont(18, 74, 'Valor Un.', [Underline]);
  rs.WriteFont(18, 85, 'Desc.', [Underline]);
  rs.WriteFont(18, 92, 'Valor Total', [Underline]);

  with qryitens_venda, sql do
  begin
    Close;
    Clear;
    add('select IP.*, P.Codigo_Venda, P.Descricao, (100 - (P.Valor_Compra / IP.Valor_Unitario) * 100) as Percentual,');
    add('ITP.Percentual_Lucro from Itens_Pedido IP');
    add('left join Produto P on(IP.Codigo_Produto = P.Codigo)');
    add('left join Itens_Tabela_Preco ITP on (P.Codigo = ITP.Codigo_Produto)');
    add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
    add('where IP.Codigo = :Codigo and TP.Codigo = :Tabela');
    Parameters.ParamByName('Codigo').Value := EdtCodigo.Text;
    Parameters.ParamByName('Tabela').Value := codigo_tabela_preco_ativo;
    open;
    { close;
      clear;
      add('select IP.*, P.Codigo_Venda, P.Descricao, UM.Sigla as Unidade from Itens_Pedido IP');
      add('inner join Produto P on (IP.Codigo_Produto = P.Codigo)');
      add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
      add('where IP.Codigo = :Codigo and IP.Cancelado = :N');
      Parameters.ParamByName('Codigo').Value:= EdtCodigo.Text;
      Parameters.ParamByName('N').Value:= 'N';
      open;
      First; }
  end;

  linha := 21;
  while not qryitens_venda.Eof do
  begin
    rs.Write(linha, 0, qryitens_vendaCodigo_Venda.AsString);
    rs.Write(linha, 16, qryitens_vendaDescricao.AsString);
    rs.Write(linha, 60, qryitens_vendaUN.AsString);
    rs.Write(linha, 66, FormatFloat('#0.0,0', qryitens_vendaQtde.AsFloat));
    rs.Write(linha, 74, FormatFloat('#0.0,0',
      qryitens_vendaValor_Unitario.AsFloat));
    // rs.Write(linha, 85, FormatFloat('#0.0,0', qryitens_vendaDesconto.AsFloat));
    rs.Write(linha, 92, FormatFloat('#0.0,0', qryitens_vendaSub_Total.AsFloat));
    Inc(linha);
    qryitens_venda.Next;
  end;

  i := 1;
  for i := 0 to i2 do
    rs.Write(linha, i, '-');

  rs.Write(linha + 2, 0, 'Qtde. Itens:.....: ' + EdtQuantidade_Itens.Text);
  rs.Write(linha + 3, 0, 'Total de Produtos: ' + EdtTotal_Produtos.Text);
  // rs.Write(linha+4,0,'Peso Total.......: ' + EdtPeso_Total.Text);       rs.Write(linha+4,40,'Descontos......: ' + EdtDesc_Acr_Total.Text);
  rs.WriteFont(linha + 5, 40, 'Total do DAV: ' + EdtTotal_Pedido.Text,
    [Underline] + [Bold]);

  rodape := 'É vedada a autenticação deste documento';
  rs.Write(linha + 12, Alinha_Centro(rodape, i2), rodape);
  rs.Print;
end;

procedure TFrmPedido_Venda.DAV_OS_Modelo_2;
var
  i, i2, i3, iaux, linha, linhaaux: integer;
  dav, dav2, tipo_rel, rodape, texto, texto2: string;
  cn, cp: string;
begin
  rs.BeginDoc;
  i := 0;
  i2 := 135;

  dav := 'NÃO É DOCUMENTO FISCAL - NÃO É VÁLIDO COMO RECIBO E COMO GARANTIA DE MERCADORIA - ';
  dav2 := 'NÃO COMPROVA PAGAMENTO';
  tipo_rel := 'DOCUMENTO AUXILIAR DE VENDA - ORDEM DE SERVIÇO';

  rs.WriteFont(1, Alinha_Centro(tipo_rel, i2), tipo_rel, [Bold] + [DobleWide]);
  rs.WriteFont(2, Alinha_Centro(dav, i2), dav, [Bold] + [DobleWide]);
  rs.WriteFont(3, Alinha_Centro(dav2, i2), dav2, [Bold] + [DobleWide]);

  for i := 0 to i2 do
    rs.Write(4, i, '-');

  cn := Copy(cnpj, 1, 2) + '.' + Copy(cnpj, 3, 3) + '.' + Copy(cnpj, 6, 3) + '/'
    + Copy(cnpj, 9, 4) + '-' + Copy(cnpj, 13, 2);
  cp := Copy(LblCPF.Caption, 1, 3) + '.' + Copy(LblCPF.Caption, 4, 3) + '.' +
    Copy(LblCPF.Caption, 7, 3) + '-' + Copy(LblCPF.Caption, 10, 2);

  rs.Write(5, 0, 'Empresa: ' + nome_fantasia);
  rs.Write(5, 60, 'Endereço: ' + endereco + ', nº ' + numero);
  rs.Write(5, 115, 'Data: ' + MEdtData_Venda.Text);

  rs.Write(6, 0, 'CNPJ: ' + cn);
  rs.Write(6, 30, 'Insc. Estadual: ' + insc_estadual);
  rs.Write(6, 60, 'Insc. Municipal: ' + insc_municipal);
  rs.Write(6, 115, 'Hora: ' + MEdtHora_Venda.Text);

  rs.Write(7, 0, 'Telefone: ' + telefone);

  i := 1;
  for i := 0 to i2 do
    rs.Write(8, i, '-');

  rs.Write(9, 0, 'Cliente: ' + EdtCliente.Text);
  rs.Write(9, 60, 'Endereço: ' + LblEndereco.Caption + ', nº ' +
    LblNumero.Caption);

  rs.Write(10, 0, 'CPF/CNPJ: ' + cp);
  rs.Write(10, 30, 'Cidade: ' + LblCidade.Caption);
  rs.Write(10, 60, 'UF: ' + LblUF.Caption);

  rs.Write(11, 0, 'Setor: ' + LblSetor.Caption);
  rs.Write(11, 30, 'Telefone: ' + LblTelefone.Caption);

  i := 1;
  for i := 0 to i2 do
    rs.Write(12, i, '-');

  rs.Write(13, 0, 'Veículo: ' + dm.qryveiculoVeiculo.AsString);
  rs.Write(13, 60, 'Renavam: ' + dm.qryveiculoRenavam.AsString);

  rs.Write(13, 84, 'Problema');
  iaux := 84;
  linhaaux := 14;
  for i := 1 to Length(MMOProblema.Text) do
  begin
    texto := Copy(MMOProblema.Text, i, 1);
    texto2 := texto2 + texto;
    Inc(iaux);
    if (iaux <> i2) then
      rs.Write(linhaaux, 84, texto2)
    else
    begin
      // i3:= 84;
      linhaaux := linhaaux + 1;
      texto2 := '';
    end;
  end;

  rs.Write(14, 0, 'Marca: ' + dm.qryveiculoDescricao.AsString);
  rs.Write(14, 60, 'Modelo: ' + dm.qryveiculoModelo.AsString + ' - ' +
    dm.qryveiculoAno_Fabricacao.AsString);

  rs.Write(15, 0, 'Placa: ' + dm.qryveiculoPlaca.AsString);
  rs.Write(15, 60, 'KM: ' + EdtKilometragem.Text);

  i := 1;
  for i := 0 to i2 do
    rs.Write(16, i, '-');

  rs.Write(17, 0, 'Número do Documento: ' + EdtN_Pedido.Text);
  rs.Write(17, 40, 'Número do Documento Fiscal: ' + '');
  rs.Write(17, 84, 'Status: ' + CmbStatus.Text);

  i := 1;
  for i := 0 to i2 do
    rs.Write(18, i, '-');

  rs.WriteFont(19, 0, 'Produtos', [Underline]);

  { for i := 0 to 10 do
    rs.Write(20,i, '-'); }

  rs.WriteFont(21, 0, 'Código Produto', [Underline]);
  rs.WriteFont(21, 16, 'Descrição', [Underline]);
  rs.WriteFont(21, 60, 'Un.', [Underline]);
  rs.WriteFont(21, 66, 'Qtde.', [Underline]);
  rs.WriteFont(21, 74, 'Valor Un.', [Underline]);
  rs.WriteFont(21, 92, 'Valor Total', [Underline]);

  linha := 23;

  if (qryitens_venda.Active) then
  begin
    qryitens_venda.First;

    while not qryitens_venda.Eof do
    begin
      rs.Write(linha, 0, qryitens_vendaCodigo_Venda.AsString);
      rs.Write(linha, 16, qryitens_vendaDescricao.AsString);
      rs.Write(linha, 60, qryitens_vendaUN.AsString);
      rs.Write(linha, 66, FormatFloat('#0.0,0', qryitens_vendaQtde.AsFloat));
      rs.Write(linha, 74, FormatFloat('#0.0,0',
        qryitens_vendaValor_Unitario.AsFloat));
      rs.Write(linha, 92, FormatFloat('#0.0,0',
        qryitens_vendaSub_Total.AsFloat));
      Inc(linha);
      qryitens_venda.Next;
    end;
  end;

  i := 1;
  for i := 0 to i2 do
    rs.Write(linha, i, '-');

  linha := linha + 1;
  rs.WriteFont(linha, 0, 'Serviços', [Underline]);

  linha := linha + 2;
  rs.WriteFont(linha, 0, 'Código', [Underline]);
  rs.WriteFont(linha, 16, 'Serviço', [Underline]);
  rs.WriteFont(linha, 66, 'Qtde.', [Underline]);
  rs.WriteFont(linha, 74, 'Valor Un.', [Underline]);
  rs.WriteFont(linha, 92, 'Valor Total', [Underline]);

  linha := linha + 2;

  if (qryitens_os.Active) then
  begin
    qryitens_os.First;
    while not qryitens_os.Eof do
    begin
      rs.Write(linha, 0, qryitens_osCodigo_Servico.AsString);
      rs.Write(linha, 16, qryitens_osDescricao_Servico.AsString);
      rs.Write(linha, 66, qryitens_osQtde.AsString);
      rs.Write(linha, 74, FormatFloat('#0.0,0',
        qryitens_osValor_Unitario.AsFloat));
      rs.Write(linha, 92, FormatFloat('#0.0,0', qryitens_osSub_Total.AsFloat));
      Inc(linha);
      qryitens_os.Next;
    end;
  end;

  for i := 0 to i2 do
    rs.Write(linha, i, '-');

  rs.Write(linha + 2, 0, 'Qtde. Itens:.....: ' + EdtQuantidade_Itens.Text);
  rs.Write(linha + 3, 0, 'Qtde. Serviços...: ' + EdtQuantidade_Servicos.Text);
  rs.Write(linha + 4, 0, 'Total de Produtos: ' + EdtTotal_Produtos.Text);
  rs.Write(linha + 5, 0, 'Total de Serviços: ' + EdtTotal_Servicos.Text);
  rs.WriteFont(linha + 6, 0, 'Total do DAV-OS: ' + EdtTotal_Pedido.Text,
    [Underline] + [Bold]);

  rodape := 'É vedada a autenticação deste documento';
  rs.Write(linha + 12, Alinha_Centro(rodape, i2), rodape);
  rs.Print;
end;

procedure TFrmPedido_Venda.DBGrid1CellClick(Column: TColumn);
begin
  Pega_Dados_Anteriores;
end;

procedure TFrmPedido_Venda.DBGrid1DblClick(Sender: TObject);
begin
  // Atualiza_Tipo;
end;

procedure TFrmPedido_Venda.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid1 do
  begin
    if Odd(DataSource.DataSet.RecNo) then
      Canvas.Brush.Color := clMenu
    else
      Canvas.Brush.Color := clWindow;

    Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.font.Color := clBlack;

    if gdSelected in State then
      with (Sender as TDBGrid).Canvas do
      begin
        Brush.Color := clSilver;
        FillRect(Rect);
      end;

    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

  { if qryitens_vendaTipo_Entrega.AsString = 'A' then
    DBGrid1.Canvas.Font.Color:= clBlack
    else if qryitens_vendaTipo_Entrega.AsString = 'C' then
    DBGrid1.Canvas.Font.Color:= clGreen
    else if qryitens_vendaTipo_Entrega.AsString = 'S' then
    DBGrid1.Canvas.Font.Color:= clBlue; }

  { if (qryitens_vendaQtde_Entregue.AsFloat < qryitens_vendaQtde.AsFloat) and (qryitens_vendaQtde_Entregue.AsFloat > 0) and (qryitens_vendaData_Entrega.AsString = '') then
    begin
    DBGrid1.Canvas.Font.Color:= clBlue;
    end
    else if (qryitens_vendaQtde_Entregue.AsFloat < qryitens_vendaQtde.AsFloat) and (qryitens_vendaQtde_Entregue.AsFloat > 0) and (qryitens_vendaData_Entrega.AsString <> '') then
    begin
    DBGrid1.Canvas.Font.Color:= clGreen;
    end
    else if (qryitens_vendaQtde_Entregue.AsFloat = qryitens_vendaQtde.AsFloat) then//and (qryitens_vendaTipo_Entrega.AsString = 'A') then
    begin
    DBGrid1.Canvas.Font.Color:= clBlack;
    end
    else if (qryitens_vendaQtde_Entregue.AsFloat = 0) and (qryitens_vendaData_Entrega.AsString = '') then
    begin
    DBGrid1.Canvas.Font.Color:= clBlue;
    end
    else if (qryitens_vendaQtde_Entregue.AsFloat = 0) and (qryitens_vendaData_Entrega.AsString <> '') then
    begin
    DBGrid1.Canvas.Font.Color:= clGreen;
    end; }

  if qryitens_vendaCancelado.AsString = 'S' then
    DBGrid1.Canvas.font.Color := clRed;

  DBGrid1.DefaultDrawDataCell(Rect, DBGrid1.columns[DataCol].field, State);
end;

procedure TFrmPedido_Venda.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  desc, total: double;
begin
  if (Key = vk_delete) and (qryitens_venda.RecordCount <> 0) then
  begin
    if (Confirma_Delete = true) then
    begin

      // oLS:= TListaSeparacaoEntidade.Create;
      { oLS.CodigoProduto:= qryitens_vendaCodigo_Venda.AsString;
        oLS.DescricaoProduto:= qryitens_vendaDescricao.AsString;
        oLS.Quantidade:= qryitens_vendaQtde.AsFloat;
        oLS.Marca:= '';
        oLS.LocalProduto:= ''; }
      // oLSDominio.removerProdutoLista(oLS);

      Calcula_Total_Deletado;
      // Deleta_Temporario(FrmPedido_Venda.Conexao);
      Atualiza_Itens(Conexao);

       //  //  //  LOG ITENS PEDIDO // // //
    SalvaBancoItensPedidoLog(StrToInt(FrmPedido_Venda.EdtCodigo.Text),
      qryitens_vendaCodigo_Registro.AsInteger,
      qryitens_vendaCodigo_Produto.AsInteger,
      StrToDateTime(MEdtData_Venda.Text), hora, 'E', Conexao);


      desc_acr_total := Pega_Total_Desconto
        (StrToInt(FrmPedido_Venda.EdtCodigo.Text), Conexao);
      Util.FormataFloat(2, EdtDesc_Acr_Total, desc_acr_total);

      Atualiza_Dados(Conexao);
      Atualiza_Pedido_Temporario(Conexao);
    end;
  end;

  if (Key = VK_INSERT) then
  begin
    pressionou_insert := true;

    // qryitens_venda.Insert;
    // altera:= true;
    // qryitens_venda.Edit;
    // qryitens_vendaCodigo.AsInteger:= StrToInt(EdtCodigo.Text);
    // qryitens_vendaCancelado.AsString:= 'N';
    // qryitens_venda.Post;
    // Atualiza_Dados(FrmPedido_Venda.Conexao);
  end;

  { if (key = VK_RETURN) then
    begin
    EdtTotal_Produtos.Text:= '0,00';
    EdtTotal_Pedido.Text:= '0,00';
    EdtTotal_Desconto.Text:= '0,00';
    EdtTotal_Desc_Acr.Text:= '0,00';
    qryitens_venda.First;
    while not qryitens_venda.Eof do
    begin

    if (qryitens_vendaDesc_Acr.AsFloat > 0) then
    begin
    desc:= StrToFloat(EdtTotal_Desc_Acr.Text) + qryitens_vendaDesc_Acr.AsFloat;
    EdtTotal_Desc_Acr.Text:= FormatFloat('#0.0,0', desc);
    EdtTotal_Desc_Acr.Text:= StringReplace(EdtTotal_Desc_Acr.Text, ThousandSeparator, '', [rfReplaceAll]);
    end
    else
    begin
    desc:= StrToFloat(EdtTotal_Desconto.Text) + qryitens_vendaDesc_Acr.AsFloat;
    EdtTotal_Desconto.Text:= FormatFloat('#0.0,0', desc);
    EdtTotal_Desconto.Text:= StringReplace(EdtTotal_Desconto.Text, ThousandSeparator, '', [rfReplaceAll]);
    end;

    EdtTotal_Produtos.Text:= FloatToStr(StrToFloat(EdtTotal_Produtos.Text) + qryitens_vendaSub_Total.AsFloat);
    EdtTotal_Produtos.Text:= FormatFloat('#0.0,0', StrToFloat(EdtTotal_Produtos.Text));
    EdtTotal_Produtos.Text:= StringReplace(EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

    qryitens_venda.Next;
    end;
    DBGrid1.SetFocus;
    end; }


               //  //  //  LOG ITENS PEDIDO // // //
//    SalvaBancoItensPedidoLog(StrToInt(FrmPedido_Venda.EdtCodigo.Text),
//      qryitens_vendaCodigo_Registro.AsInteger,
//      StrToInt(FrmPedido_Venda.EdtCodigo_Produto.Text),
//      StrToDateTime(MEdtData_Venda.Text), hora, 'A', Conexao);

   
end;

procedure TFrmPedido_Venda.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid2 do
  begin
    if Odd(DataSource.DataSet.RecNo) then
      Canvas.Brush.Color := clMenu
    else
      Canvas.Brush.Color := clWindow;

    Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.font.Color := clBlack;

    if gdSelected in State then
      with (Sender as TDBGrid).Canvas do
      begin
        Brush.Color := clSilver;
        FillRect(Rect);
      end;

    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

  if (qrypedido_temporarioValor_Unitario.AsFloat <
    qrypedido_temporarioValor_Compra.AsFloat) then
    DBGrid2.Canvas.font.Color := clRed
  else
    DBGrid2.Canvas.font.Color := clGreen;

  { if (CBVerifica.Checked) then
    begin
    if ClientDataSet.FieldByName('Percentual').AsFloat < ClientDataSet.FieldByName('Lucro_Vista').AsFloat then
    DBGrid2.Canvas.Font.Color:= clRed
    else
    DBGrid2.Canvas.Font.Color:= clGreen;
    end
    else
    begin
    if ClientDataSet.FieldByName('Percentual').AsFloat < ClientDataSet.FieldByName('Lucro_Prazo').AsFloat then
    DBGrid2.Canvas.Font.Color:= clRed
    else
    DBGrid2.Canvas.Font.Color:= clGreen;
    end; }

  DBGrid2.DefaultDrawDataCell(Rect, DBGrid2.columns[DataCol].field, State);
end;

procedure TFrmPedido_Venda.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Key = VK_UP) or (Key = VK_DOWN)) then
  begin
    // Altera_Preco_DBGrid_Analise;
  end;
end;

procedure TFrmPedido_Venda.DBGrid3CellClick(Column: TColumn);
var
  Pt: TPoint;
begin
  if (DBGrid3.SelectedIndex = 1) then
  begin
    Keybd_Event(VK_F2, 0, 0, 0);
    Keybd_Event(VK_F2, 0, KEYEVENTF_KEYUP, 0);
    Keybd_Event(VK_MENU, 0, 0, 0);
    Keybd_Event(VK_DOWN, 0, 0, 0);
    Keybd_Event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);
    Keybd_Event(VK_MENU, 0, KEYEVENTF_KEYUP, 0); // Application.ProcessMessages;
    // DBGrid3.Columns[1].Grid.Perform(WM_LBUTTONUP, 0, 0);
    // DBGrid3.Perform(WM_LBUTTONDOWN, 0, 0); //Simula apertar o botão
    // DBGrid3.Perform(WM_LBUTTONUP, 0, 0); //Simula soltar o botão (claro)
    // Sleep(1000);
    // DBGrid3.Perform(VK_SPACE, 0, 0);
    // DBGrid3.Perform(VK_SPACE, 0, 0);
    // DBGrid3.Perform(WM_LBUTTONUP, 0, 0); //Simula soltar o botão (claro)
    { DBGrid3.Perform(WM_LBUTTONDOWN, 0, 0); //Simula apertar o botão
      DBGrid3.Perform(WM_LBUTTONUP, 0, 0); //Simula soltar o botão (claro) }
    // Sleep(1000);
    // Application.ProcessMessages;
    // GetCursorPos(pt);
    // Pt.x := DBGrid3.Left + (DBGrid3.Width div 2);
    // Pt.y := DBGrid3.Top + (DBGrid3.Height div 2);
    // Pt := ClientToScreen(Pt);
    // Pt.x := Round(Pt.x * (65535 / Screen.Width));
    // Pt.y := Round(Pt.y * (65535 / Screen.Height));
    // Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_MOVE, Pt.x, Pt.y, 0, 0);
    // Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTDOWN, Pt.x, Pt.y, 0, 0);
    // Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTUP, Pt.x, Pt.y, 0, 0);
    // Sleep(500);

    // Application.ProcessMessages;
    // GetCursorPos(pt);
    // Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTDOWN, Pt.x, Pt.y, 0, 0);
    // Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTUP, Pt.x, Pt.y, 0, 0);
    // h := FindWindow(nil, 'Janela que vai clicar');
    // SendMessage(FrmPedido_Venda.Handle, WM_LBUTTONDOWN, MK_LBUTTON, MAKELPARAM(Pt.x, Pt.y));
    // SendMessage(FrmPedido_Venda.Handle, WM_LBUTTONUP, MK_LBUTTON, MAKELPARAM(Pt.x, Pt.y));
  end
  else if (DBGrid3.SelectedIndex = 4) then
  begin
    Keybd_Event(VK_F2, 0, 0, 0);
    Keybd_Event(VK_F2, 0, KEYEVENTF_KEYUP, 0);
    Keybd_Event(VK_MENU, 0, 0, 0);
    Keybd_Event(VK_DOWN, 0, 0, 0);
    Keybd_Event(VK_DOWN, 0, KEYEVENTF_KEYUP, 0);
    Keybd_Event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
  end;
end;

procedure TFrmPedido_Venda.DBGrid3ColEnter(Sender: TObject);
begin
  if (DBGrid3.SelectedIndex = 9) and (DBGrid3.columns.Grid.Fields[3].Text <> '')
  then
  begin
    if (qryitens_os.State in [dsInsert, dsEdit]) then
    begin
      qryitens_osSub_Total.AsFloat :=
        ((qryitens_osValor_Unitario.AsFloat * qryitens_osQtde.AsInteger) -
        qryitens_osDesconto.AsFloat);
      sub_total_servico :=
        ((qryitens_osValor_Unitario.AsFloat * qryitens_osQtde.AsInteger) -
        qryitens_osDesconto.AsFloat);
    end;
  end;

  { if ( (DBGrid3.SelectedIndex = 1) or (DBGrid3.SelectedIndex = 3)) and (DBGrid3.Columns.Grid.Fields[3].Text <> '') then
    begin
    dm.qrychama_servico.Locate('Codigo', qryitens_osCodigo_Servico.AsInteger, []);
    end; }
end;

procedure TFrmPedido_Venda.DBGrid3ColExit(Sender: TObject);
begin
  if (DBGrid3.columns.Grid.Fields[1].Text <> '') and (DBGrid3.SelectedIndex = 1)
    and (qryitens_os.State in [dsEdit]) then
  begin
    qryitens_osComissao.AsFloat :=
      dm.qrychama_funcionarioComissao_Servico.AsFloat;
    qryitens_os.Post;
  end;

  if (DBGrid3.columns.Grid.Fields[1].Text <> '') and (DBGrid3.SelectedIndex = 1)
    and (qryitens_os.State in [dsInsert]) then
  begin
    qryitens_osComissao.AsFloat :=
      dm.qrychama_funcionarioComissao_Servico.AsFloat;
    // qryitens_os.Post;
  end;

  if (DBGrid3.SelectedIndex = 5) and (DBGrid3.columns.Grid.Fields[5].Text = '')
  then
  begin
    qryitens_osISS.AsFloat := 0;
    // qryitens_os.Post;
  end;

  if (DBGrid3.SelectedIndex = 4) and (DBGrid3.columns.Grid.Fields[4].Text <> '')
  then
  begin
    if (qryitens_os.State in [dsEdit]) then
    begin
      // qryitens_os.Edit;
      qryitens_osCodigo.AsInteger := StrToInt(EdtCodigo.Text);
      qryitens_osISS.AsString := dm.qrychama_servicoAliquota.AsString;
      qryitens_osValor_Unitario.AsFloat :=
        dm.qrychama_servicoPreco_Vista.AsFloat;
      qryitens_osDescricao_Servico.AsString :=
        dm.qrychama_servicoDescricao_Servico.AsString;

    end
    else if (qryitens_os.State in [dsInsert]) then
    begin
      qryitens_osCodigo.AsInteger := StrToInt(EdtCodigo.Text);
      qryitens_osISS.AsString := dm.qrychama_servicoAliquota.AsString;
      qryitens_osValor_Unitario.AsFloat :=
        dm.qrychama_servicoPreco_Vista.AsFloat;
      qryitens_osDescricao_Servico.AsString :=
        dm.qrychama_servicoDescricao_Servico.AsString;
      qryitens_osDesconto.AsFloat := 0;
      // qtde_servicos:= StrToInt(EdtQuantidade_Servicos.Text) + 1;
      // EdtQuantidade_Servicos.Text:= IntToStr(qtde_servicos);
    end;
  end;

  if (DBGrid3.SelectedIndex = 6) and (DBGrid3.columns.Grid.Fields[4].Text <> '')
    and (DBGrid3.columns.Grid.Fields[6].Text <> '') then
  begin
    if (qryitens_os.State in [dsInsert, dsEdit]) then
    begin
      // qryitens_os.Edit;
      qryitens_osSub_Total.AsFloat :=
        (qryitens_osValor_Unitario.AsFloat * qryitens_osQtde.AsInteger);
    end;
  end;

  if (DBGrid3.SelectedIndex = 7) and (DBGrid3.columns.Grid.Fields[4].Text <> '')
    and (DBGrid3.columns.Grid.Fields[7].Text <> '') then
  begin
    if (qryitens_os.State in [dsInsert, dsEdit]) then
    begin
      // qryitens_os.Edit;
      qryitens_osSub_Total.AsFloat :=
        (qryitens_osValor_Unitario.AsFloat * qryitens_osQtde.AsInteger);
    end;
  end;

  if (DBGrid3.SelectedIndex = 8) and (DBGrid3.columns.Grid.Fields[4].Text <> '')
    and (DBGrid3.columns.Grid.Fields[8].Text <> '') then
  begin
    if (qryitens_osDesconto.AsFloat > qryitens_osValor_Unitario.AsFloat) then
    begin
      Application.MessageBox('Valor do desconto é maior que o valor unitário.',
        'Valor inválido', MB_OK + MB_ICONHAND);
      abort;
    end;

    if (qryitens_os.State in [dsInsert, dsEdit]) then
    begin
      // qryitens_os.Edit;
      qryitens_osSub_Total.AsFloat :=
        ((qryitens_osValor_Unitario.AsFloat - qryitens_osDesconto.AsFloat) *
        qryitens_osQtde.AsInteger);
    end;
  end;
end;

procedure TFrmPedido_Venda.DBGrid3DblClick(Sender: TObject);
begin
  { if (DBGrid3.columns[2].Visible = false) then
    begin
    uso_tela_pedido := 3;
    Application.CreateForm(TFrmSenha_ADM, FrmSenha_ADM);
    FrmSenha_ADM.ShowModal;
    FrmSenha_ADM.Free;

    if (libera_visualizar_comissao_servico) then
    begin
    DBGrid3.columns[2].Visible := true;
    libera_visualizar_comissao_servico := false;
    end
    else
    begin
    Application.MessageBox
    ('Você não tem permissão para visualizar a comissão de serviço.',
    'Usuário não é administrador ou não encontrado', MB_ICONHAND + MB_OK);
    abort;
    end;

    end
    else
    begin
    DBGrid3.columns[2].Visible := false;
    end; }
end;

procedure TFrmPedido_Venda.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid3 do
  begin
    if Odd(DataSource.DataSet.RecNo) then
      Canvas.Brush.Color := clMenu
    else
      Canvas.Brush.Color := clWindow;

    Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.font.Color := clBlack;

    if gdSelected in State then
      with (Sender as TDBGrid).Canvas do
      begin
        Brush.Color := clSilver;
        FillRect(Rect);
      end;

    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFrmPedido_Venda.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DOWN) then
  begin
    if (qryitens_os.Eof) then
    begin
      Key := 0;
    end;
  end;

  if (Key = VK_RETURN) then
  begin
    Key := 0;
  end;

  if (Key = vk_delete) and (qryitens_os.RecordCount <> 0) then
  begin
    if (Application.MessageBox('Confirma a exclusão do serviço selecionado?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION)) = IDYES then
    begin
      sub_total_servico := qryitens_osSub_Total.AsFloat;
      Calcula_Total_Servico(sub_total_servico, Conexao, '-');
      qryitens_os.Delete;
      qtde_servicos := StrToInt(EdtQuantidade_Servicos.Text) - 1;
      EdtQuantidade_Servicos.Text := IntToStr(qtde_servicos);
    end;
  end;
  { if (Key = VK_TAB) then
    begin
    Key := 0;
    end; }

end;

procedure TFrmPedido_Venda.CmbVeiculoClick(Sender: TObject);
begin
  if (EdtCodigo_Cliente.Text = '') then
  begin
    TMensagens.MensagemErro
      ('Para escolher um veículo é necessário escolher um cliente. Por favor, escolha o cliente.');
    EdtCodigo_Cliente.SetFocus;
    exit;
  end;

  EdtVeiculo.Text := dm.qryveiculoVeiculo.AsString;
  EdtModelo.Text := dm.qryveiculoModelo.AsString;
end;

procedure TFrmPedido_Venda.Deleta_Pedido_Temporario
  (var Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      Close;
      Connection := Conexao;
      Clear;
      add('DELETE FROM Pedido_Temporario');
      add('where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
      // Parameters.ParamByName('Produto').Value := qryitens_vendaCodigo_Produto.AsInteger;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
  // Atualiza_Pedido_Temporario(Conexao);

  // Calcula_Total_Pedido_Temporario_Deletado;
end;

procedure TFrmPedido_Venda.Deleta_Temporario(var Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      Close;
      Connection := Conexao;
      Clear;
      add('DELETE FROM Pedido_Temporario');
      add('where Codigo = :Codigo and Codigo_Produto = :Produto');

      Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
      Parameters.ParamByName('Produto').Value :=
        qryitens_vendaCodigo_Produto.AsInteger;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
  Atualiza_Pedido_Temporario(Conexao);

  Calcula_Total_Pedido_Temporario_Deletado;
end;

procedure TFrmPedido_Venda.Desabilita_Total;
begin
  // LblCusto_Total.Visible:= false;
  EdtCusto_Total.Visible := false;
  // LblVenda_Total.Visible:= false;
  EdtVenda_Total.Visible := false;
  // LblPerc_Total.Visible:= false;
  EdtPerc_Total.Visible := false;
  // EdtPerc_Pro.Visible:= false;
  EdtLimite_Desconto_Vendedor.Visible := false;
  EdtLimite_Desconto_Vendedor.Text := '0';
  EdtPercentual_Desconto_Pedido.Text := '0';
  EdtPercentual_Desconto_Pedido.Visible := false;
  EdtValor_Venda_Original.Visible := false;
end;

procedure TFrmPedido_Venda.Atualiza_Itens(var Conexao: TADOConnection);
var
  total, sub1, sub2, valor_cancelado: double;
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, sql do
    begin
      Close;
      Connection := Conexao;
      Clear;
      add('update Itens_Pedido set Cancelado = :Cancelado');
      add('where Codigo_Registro = :Codigo');
      // Codigo_Produto = :Codigo_Produto and Codigo_Registro = :Codigo');
      Parameters.ParamByName('Cancelado').Value := 'S';
      // Parameters.ParamByName('Codigo_Produto').Value:= qryitens_vendaCodigo.AsInteger;
      Parameters.ParamByName('Codigo').Value :=
        qryitens_vendaCodigo_Registro.AsInteger;
      // Parameters.ParamByName('Codigo').Value:= qryitens_vendaCodigo_Registro.AsInteger;
      ExecSQL;
    end;

    altera := true;
    if (qrypedido_temporario.Locate('Codigo; Codigo_Produto',
      VarArrayOf([StrToInt(EdtCodigo.Text),
      qryitens_vendaCodigo_Produto.AsInteger]), [])) then
    begin
      qrypedido_temporario.Edit;
      qrypedido_temporarioCancelado.AsString := 'S';
      qrypedido_temporario.Post;
    end;
    altera := false;

    { with qAux, sql do
      begin
      close;
      Connection:= FrmPedido_Venda.Conexao;
      clear;
      add('update Pedido_Temporario set Cancelado = :Cancelado');
      add('where Codigo_Produto = :Codigo_Produto and Codigo = :Codigo');
      Parameters.ParamByName('Cancelado').Value:= 'S';
      Parameters.ParamByName('Codigo_Produto').Value:= qryitens_vendaCodigo_Produto.AsInteger;
      //Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
      Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
      ExecSQL;
      end; }

    with qAux, sql do
    begin
      Close;
      Connection := Conexao;
      Clear;
      add('update R05 set Cancelamento = :Cancelamento, Quantidade_Cancelada = :Qtde, Valor_Cancelado = :Valor');
      add('where Codigo_Produto_Inteiro = :Codigo and N_Pedido = :Pedido');
      Parameters.ParamByName('Cancelamento').Value := 'S';
      Parameters.ParamByName('Qtde').Value := qryitens_vendaQtde.AsString;
      valor_cancelado := qryitens_vendaQtde.AsFloat *
        qryitens_vendaValor_Unitario.AsFloat;
      Parameters.ParamByName('Valor').Value := FloatToStr(valor_cancelado);
      Parameters.ParamByName('Codigo').Value :=
        qryitens_vendaCodigo_Produto.AsInteger;
      Parameters.ParamByName('Pedido').Value := StrToInt(EdtCodigo.Text);
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
  // Atualiza_Dados(FrmPedido_Venda.Conexao);
end;

procedure TFrmPedido_Venda.Atualiza_Pedido_Temporario
  (var Conexao: TADOConnection);
begin
  with qrypedido_temporario, sql do
  begin
    Close;
    Connection := Conexao;
    Clear;
    add('select PT.*, P.Codigo_Venda + ' + QuotedStr(' - ') +
      '+P.Descricao as Produto from Pedido_Temporario PT');
    add('left join Produto P on (P.Codigo = PT.Codigo_Produto)');
    add('where PT.Codigo = :Codigo and PT.Cancelado = :N order by P.Descricao');
    Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
    Parameters.ParamByName('N').Value := 'N';
    open;
  end;
end;

procedure TFrmPedido_Venda.Atualiza_Preco_Final;
var
  valor_un, total_desc_acr, Qtde, Desc_Acr, desc, desc_aux, valor_tot,
    total_produtos, Total_Pedido, dif_desc, total_Geral, venda_original,
    valor_or, PercentualDesconto: double;
  ValorPedidoAnterior: AnsiString;
begin
  if (aplicar_desconto = 1) then
  begin
    if (pedido_aux <> 0) or (desc_fim_ant <> StrToFloat(EdtTotal_Desc_Acr.Text))
    then
    begin
      desc_acr_total := 0;
      Desc_Acr := StrToFloat(EdtTotal_Desc_Acr.Text);
      // % entre o valor total do pedido e o valor que eu quero
      total_pedido_calculado_pelo_sistema := 0;
      venda_original := StrToFloat(EdtTotal_Produtos.Text);
      Total_Pedido := StrToFloat(EdtTotal_Pedido.Text);
      // ValorPedidoAnterior:= FloatToStr(valor_pedido_ant);
      ValorPedidoAnterior := FormatFloat('#0.0,0', valor_pedido_ant);
      ValorPedidoAnterior := StringReplace(ValorPedidoAnterior,
        ThousandSeparator, '', [rfReplaceAll]);
      desc_geral := StrToFloat(ValorPedidoAnterior) - Total_Pedido;

      qryitens_venda.First;
      while not qryitens_venda.Eof do
      begin
        qryitens_venda.Edit;
        altera := false;

        Qtde := qryitens_vendaQtde.AsFloat;
        valor_or := qryitens_vendaValor_Original.AsFloat;

        // valor_un:= qryitens_vendaValor_Unitario.AsFloat;

        valor_tot := qryitens_vendaSub_Total.AsFloat;

        PercentualDesconto :=
          (desc_geral / StrToFloat(ValorPedidoAnterior)) * 100;
        PercentualDesconto := Calcula_Valor(FloatToStr(PercentualDesconto));

        // desc:= ( (valor_un / StrToFloat(ValorPedidoAnterior)) * desc_geral);
        desc := (valor_or * (PercentualDesconto / 100));
        desc := Calcula_Valor(FloatToStr(desc));

        valor_un := valor_or - desc;
        valor_un := Calcula_Valor(FloatToStr(valor_un));

        desc := Calcula_Valor(FloatToStr(desc));
        // verificar aqui, caso o cliente digite um valor
        desc := Abs(desc); // acima do original. Até agora, está funcionando,
        desc_acr_total := desc_acr_total + Abs(desc * Qtde);
        // com valor abaixo do original

        valor_tot := ((valor_un * Qtde));
        valor_tot := Calcula_Valor(FloatToStr(valor_tot));

        des_p_aux := valor_un - valor_or;
        des_p := (des_p_aux / valor_un);
        des_p := des_p * 100;
        des_p := Calcula_Valor(FloatToStr(des_p));

        if (des_p > 0) then
          des_p := des_p * -1
        else
          des_p := Abs(des_p);

        qryitens_vendaDesc_Acr_P.AsFloat := des_p; // não tinha essa linha
        qryitens_vendaValor_Unitario.AsFloat := valor_un;
        // não tinha essa linha
        qryitens_vendaDesc_Acr.AsFloat := desc; // 0;//Abs(desc);
        qryitens_vendaSub_Total.AsFloat := valor_tot;

        if (StrToFloat(EdtTotal_Desc_Acr.Text) > 0) then
          qryitens_vendadOUa.AsString := 'A'
        else
          qryitens_vendadOUa.AsString := 'D';

        total_pedido_calculado_pelo_sistema :=
          total_pedido_calculado_pelo_sistema + valor_tot;

        FTributacaoEntidade := TTributacaoEntidade.Create;
        FTributacaoDominio := TTributacaoDominio.Create(Conexao);
        FTributacaoEntidade := FTributacaoDominio.CalculaICMS(valor_tot,
          qryitens_vendaBase_Reduzida.AsFloat, qryitens_vendaICMS.AsInteger, uf,
          LblUF.Caption);
        qryitens_vendaBC.AsFloat := FTributacaoEntidade.BaseCalculo;
        qryitens_vendaValor_ICMS.AsFloat := FTributacaoEntidade.ValorICMS;

        if (qryitens_vendaTipo_Recolhimento.AsString = 'ST') and
          (uf <> LblUF.Caption) then
        begin
          FTributacaoEntidade := FTributacaoDominio.CalculaICMSST
            (FTributacaoEntidade, qryitens_vendaNCM.AsString, uf,
            LblUF.Caption);
          qryitens_vendaBC_ST.AsFloat := FTributacaoEntidade.BaseCalculoST;
          qryitens_vendaValor_ICMS_ST.AsFloat :=
            FTributacaoEntidade.ValorICMSST;
        end;

        qryitens_venda.Post;

        qryitens_venda.Next;
      end;
      total_pedido_calculado_pelo_sistema :=
        Calcula_Valor(FloatToStr(total_pedido_calculado_pelo_sistema));
      EdtTeste_Pedido.Text := FloatToStr(total_pedido_calculado_pelo_sistema);
      EdtDesc_Acr_Total.Text := FloatToStr(desc_acr_total);
      Atualiza_Preco_Maior_Valor(Conexao);
    end;
  end
  else
  begin
    desc_acr_total := 0;
    Desc_Acr := StrToFloat(EdtTotal_Desc_Acr.Text);
    // % entre o valor total do pedido e o valor que eu quero
    total_pedido_calculado_pelo_sistema := 0;
    venda_original := StrToFloat(EdtTotal_Produtos.Text);
    Total_Pedido := StrToFloat(EdtTotal_Pedido.Text);

    desc_geral := (Desc_Acr / 100);
    // desc_geral:= Calcula_Valor(FloatToStr(desc_geral));
    // desc_geral:= total_pedido - desc_geral;
    // valor_pedido_ant:= StrToFloat(EdtTotal_Pedido.Text);
    // EdtTotal_Pedido.Text:= FloatToStr(total_pedido - desc_geral);

    qryitens_venda.First;
    while not qryitens_venda.Eof do
    begin
      qryitens_venda.Edit;
      altera := false;

      Qtde := qryitens_vendaQtde.AsFloat;
      valor_or := qryitens_vendaValor_Original.AsFloat;

      valor_un := qryitens_vendaValor_Unitario.AsFloat;

      valor_tot := qryitens_vendaSub_Total.AsFloat;

      desc := (valor_un * desc_geral);

      valor_un := valor_un - desc;
      valor_un := Calcula_Valor(FloatToStr(valor_un));

      desc := Calcula_Valor(FloatToStr(desc));
      // verificar aqui, caso o cliente digite um valor
      desc := Abs(desc); // acima do original. Até agora, está funcionando,
      desc_acr_total := desc_acr_total + Abs(desc);
      // com valor abaixo do original

      valor_tot := ((valor_un * Qtde));
      valor_tot := Calcula_Valor(FloatToStr(valor_tot));

      des_p_aux := valor_un - valor_or;
      des_p := (des_p_aux / valor_un);
      des_p := des_p * 100;
      des_p := Calcula_Valor(FloatToStr(des_p));

      if (des_p > 0) then
        des_p := des_p * -1
      else
        des_p := Abs(des_p);

      qryitens_vendaDesc_Acr_P.AsFloat := des_p; // não tinha essa linha
      qryitens_vendaValor_Unitario.AsFloat := valor_un; // não tinha essa linha
      qryitens_vendaDesc_Acr.AsFloat := 0; // Abs(desc);
      qryitens_vendaSub_Total.AsFloat := valor_tot;

      if (StrToFloat(EdtTotal_Desc_Acr.Text) > 0) then
        qryitens_vendadOUa.AsString := 'A'
      else
        qryitens_vendadOUa.AsString := 'D';

      total_pedido_calculado_pelo_sistema := total_pedido_calculado_pelo_sistema
        + valor_tot;

      qryitens_venda.Post;

      qryitens_venda.Next;
    end;
    total_pedido_calculado_pelo_sistema :=
      Calcula_Valor(FloatToStr(total_pedido_calculado_pelo_sistema));
    // EdtTeste_Pedido.Text:= FloatToStr(total_teste);
    EdtTotal_Pedido.Text := FloatToStr(total_pedido_calculado_pelo_sistema);
    // Atualiza_Preco_Maior_Valor;
  end;
end;

procedure TFrmPedido_Venda.Atualiza_Preco_Maior_Valor
  (var Conexao: TADOConnection);
var
  qAux, qAux2: TADOQuery;
  Sub_Total, dif_desc, Desc_Acr, Qtde, Valor_Unitario, Total_Pedido,
    venda_original, DescontoTotal: double;
  sub_total_string, dif_desc_string: AnsiString;
begin
  Sub_Total := 0;
  dif_desc := 0;

  Total_Pedido := StrToFloat(EdtTotal_Pedido.Text);
  dif_desc := Total_Pedido - (total_pedido_calculado_pelo_sistema);
  // o que o usuário digitou - o que o sistema calculou no rateio
  DescontoTotal := StrToFloat(EdtDesc_Acr_Total.Text);
  // dif_desc:= Abs(dif_desc);

  if (dif_desc <> 0) then
  begin
    qAux := TADOQuery.Create(self);
    qAux2 := TADOQuery.Create(self);
    try
      with qAux, sql do
      begin
        Close;
        Connection := Conexao;
        Clear;
        add('select IP.Codigo_Produto, IP.Sub_Total, IP.Qtde, IP.Valor_Original, IP.Valor_Unitario, IP.Desc_Acr from Itens_Pedido IP where');
        add('IP.Sub_Total in (select max(IP.Sub_Total) as Maior from Itens_Pedido IP where IP.Codigo = :Codigo1 and IP.Cancelado = :N1) and');
        add('IP.Codigo = :Codigo2 and IP.Cancelado = :N2');
        Parameters.ParamByName('Codigo1').Value := StrToInt(EdtCodigo.Text);
        Parameters.ParamByName('Codigo2').Value := StrToInt(EdtCodigo.Text);
        Parameters.ParamByName('N1').Value := 'N';
        Parameters.ParamByName('N2').Value := 'N';
        open;
      end;

      // qtde:= qAux.FieldByName('Qtde').AsFloat;
      // desc_acr:= dif_desc / qtde;
      // desc_acr:= Calcula_Valor(FloatToStr(desc_acr));

      { if (total_teste > total_pedido) then
        valor_unitario:= qAux.FieldByName('Valor_Unitario').AsFloat - desc_acr
        else
        valor_unitario:= qAux.FieldByName('Valor_Unitario').AsFloat + desc_acr; }

      Sub_Total := qAux.FieldByName('Sub_Total').AsFloat;
      Sub_Total := (Sub_Total + dif_desc);

      sub_total_string := FormatFloat('#0.0,0', (Sub_Total));
      sub_total_string := StringReplace(sub_total_string, ThousandSeparator, '',
        [rfReplaceAll]);

      dif_desc_string := FormatFloat('#0.0,0', (dif_desc));
      dif_desc_string := StringReplace(dif_desc_string, ThousandSeparator, '',
        [rfReplaceAll]);
      // dif_desc_string:= FloatToStr(Abs(StrToFloat(dif_desc_string)));

      { if (dif_desc < 0) then
        begin
        DescontoTotal:= DescontoTotal + StrToFloat(dif_desc_string);
        end
        else
        begin }
      DescontoTotal := DescontoTotal - StrToFloat(dif_desc_string);
      // end;

      { des_p_aux:= (valor_unitario - qAux.FieldByName('Valor_Original').AsFloat);
        des_p:= ( des_p_aux / valor_unitario);
        des_p:= des_p * 100;
        des_p:= Calcula_Valor(FloatToStr(des_p));

        if (des_p > 0) then
        des_p:= des_p * -1
        else
        des_p:= Abs(des_p); }

      with qAux2, sql do
      begin
        Close;
        Connection := Conexao;
        Clear;
        add('update Itens_Pedido set ');
        add('Outras_Despesas = :Outras_Despesas, ');
        // add('dOUa = :dOUa, ');
        add('Sub_Total = :Sub_Total');
        add('from Itens_Pedido where Codigo = :Codigo and Codigo_Produto = :Codigo_Produto');
        Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
        Parameters.ParamByName('Codigo_Produto').Value :=
          qAux.FieldByName('Codigo_Produto').AsInteger;
        // Parameters.ParamByName('Valor_Unitario').Value:= valor_unitario;
        Parameters.ParamByName('Outras_Despesas').Value :=
          StrToFloat(dif_desc_string);
        // Parameters.ParamByName('dOUa').Value:= 'A';
        Parameters.ParamByName('Sub_Total').Value := sub_total_string;
        // Parameters.ParamByName('Desc_Acr_P').Value:= des_p;
        ExecSQL;
      end;

      with qAux, sql do
      begin
        Close;
        Connection := Conexao;
        Clear;
        add('select sum(IP.Sub_Total) as Sub_Total from Itens_Pedido IP');
        add('where IP.Codigo = :Codigo and IP.Cancelado = :N');
        Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
        Parameters.ParamByName('N').Value := 'N';
        open;
      end;

      EdtTotal_Pedido.Text := qAux.FieldByName('Sub_Total').AsString;
      EdtDesc_Acr_Total.Text := FloatToStr(DescontoTotal);
    finally
      FreeAndNil(qAux);
      FreeAndNil(qAux2);
    end;

  end;
end;

procedure TFrmPedido_Venda.Atualiza_Preco_Forma_Pag;
var
  valor_un, total_desc_acr, Qtde, Desc_Acr, juro, desc, valor_tot,
    total_produtos, Total_Pedido, total_Geral: double;
begin
  // desc_acr:= StrToFloat(EdtDesc_Acr_Total.Text);
  total_desc_acr := 0;
  // EdtTotal_Desc_Acr.Text:= '0';
  EdtTotal_Produtos.Text := '0';
  EdtTotal_Pedido.Text := '0';
  qryitens_venda.First;
  while not qryitens_venda.Eof do
  begin
    qryitens_venda.Edit;
    altera := false;

    Qtde := qryitens_vendaQtde.AsFloat;
    valor_un := qryitens_vendaValor_Original.AsFloat;

    if (tipo_juro = 'C') then
    begin
      juro := Calcula_Juro_Composto(valor_un, taxa / 100, qtde_parcela);
    end
    else
    begin
      juro := (100 - taxa) / 100;
      juro := valor_un / juro;
    end;

    if (juro > valor_un) then
      qryitens_vendadOUa.AsString := 'A'
    else if (juro < valor_un) then
      qryitens_vendadOUa.AsString := 'D';

    valor_un := Calcula_Valor(FloatToStr(juro));
    valor_tot := Calcula_Valor(FloatToStr((valor_un * Qtde)));
    desc := qryitens_vendaValor_Original.AsFloat - valor_un;

    perc_pro := valor_un - qryitens_vendaValor_Original.AsFloat;
    /// valor original ou valor de compra???
    perc_pro := perc_pro / valor_un;
    perc_pro := perc_pro * 100;
    perc_pro := Calcula_Valor(FloatToStr(perc_pro));

    if (perc_pro > 0) then
      perc_pro := perc_pro * -1
    else
      perc_pro := Abs(perc_pro);

    qryitens_vendaDesc_Acr_P.AsFloat := perc_pro;

    qryitens_vendaDesc_Acr.AsFloat :=
      StrToFloat(FormatFloat('#0.0,0', Abs(desc)));
    qryitens_vendaDesc_Acr.AsFloat :=
      StrToFloat(StringReplace(qryitens_vendaDesc_Acr.AsString,
      ThousandSeparator, '', [rfReplaceAll]));

    qryitens_vendaValor_Unitario.AsFloat := valor_un;
    qryitens_vendaSub_Total.AsFloat := valor_tot;

    qryitens_venda.Post;

    total_produtos := StrToFloat(EdtTotal_Produtos.Text) +
      ((Qtde * qryitens_vendaValor_Original.AsFloat)); // - bruto_ant);

    EdtTotal_Produtos.Text := FormatFloat('#0.0,0', total_produtos);
    EdtTotal_Produtos.Text := StringReplace(EdtTotal_Produtos.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    Total_Pedido := StrToFloat(EdtTotal_Pedido.Text) + (valor_tot);
    // - sub_total_ant);

    EdtTotal_Pedido.Text := FormatFloat('#0.0,0', Total_Pedido);
    EdtTotal_Pedido.Text := StringReplace(EdtTotal_Pedido.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    // total_produtos:= Pega_Total_Produto();//StrToFloat(EdtTotal_Produtos.Text) + (bruto_ant - valor_tot); //+ ((qtde * qryitens_vendaValor_Original.AsFloat) - bruto_ant);
    // total_pedido:= Pega_Total_Pedido();//StrToFloat(EdtTotal_Pedido.Text) + (valor_tot - sub_total_ant);

    des_p_aux_rodape := Total_Pedido - total_produtos;
    des_p_rodape := (des_p_aux_rodape / Total_Pedido);
    des_p_rodape := des_p_rodape * 100;
    des_p_rodape := Calcula_Valor(FloatToStr(des_p_rodape));

    if (des_p_rodape > 0) then
      des_p_rodape := des_p_rodape * -1
    else
      des_p_rodape := Abs(des_p_rodape);

    EdtTotal_Desc_Acr.Text := FormatFloat('#0.0,0', des_p_rodape);
    EdtTotal_Desc_Acr.Text := StringReplace(EdtTotal_Desc_Acr.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    qryitens_venda.Next;
  end;
end;

procedure TFrmPedido_Venda.Atualiza_Preco_Forma_Pag_Analise;
var
  valor_un, Qtde, juro, desc, valor_tot, total_produtos, Perc, perc_pro: double;
begin
  EdtVenda_Total.Text := '0';
  EdtPerc_Total.Text := '0';
  // Atualiza_Pedido_Temporario;
  qrypedido_temporario.First;
  while not qrypedido_temporario.Eof do
  begin
    qrypedido_temporario.Edit;
    altera := false;

    Qtde := qrypedido_temporarioQuantidade.AsFloat;
    valor_un := qrypedido_temporarioValor_Original.AsFloat;

    if (tipo_juro = 'C') then
    begin
      juro := Calcula_Juro_Composto(valor_un, taxa / 100, qtde_parcela);
    end
    else
    begin
      juro := (100 - taxa) / 100;
      juro := valor_un / juro;
    end;

    valor_un := Calcula_Valor(FloatToStr(juro));

    qrypedido_temporarioValor_Unitario.AsFloat := valor_un;

    perc_pro := valor_un - qrypedido_temporarioValor_Compra.AsFloat;
    perc_pro := perc_pro / valor_un;
    perc_pro := perc_pro * 100;
    perc_pro := Calcula_Valor(FloatToStr(perc_pro));
    qrypedido_temporarioPercetual.AsFloat := perc_pro;

    qrypedido_temporario.Post;

    total_produtos := StrToFloat(EdtVenda_Total.Text) + ((Qtde * valor_un));

    EdtVenda_Total.Text := FormatFloat('#0.0,0', total_produtos);
    EdtVenda_Total.Text := StringReplace(EdtVenda_Total.Text, ThousandSeparator,
      '', [rfReplaceAll]);

    Perc := StrToFloat(EdtVenda_Total.Text) - StrToFloat(EdtCusto_Total.Text);
    Perc := Perc / StrToFloat(EdtVenda_Total.Text);
    Perc := Perc * 100;
    Perc := Calcula_Valor(FloatToStr(Perc));

    EdtPerc_Total.Text := FloatToStr(Calcula_Valor(FloatToStr(Perc)));

    qrypedido_temporario.Next;
  end;
end;

procedure TFrmPedido_Venda.Atualiza_Preco_Original_Analise;
var
  valor_un, Qtde, juro, desc, valor_tot, total_produtos, Perc, perc_pro,
    valor_compra, Custo_Total, custo: double;
begin
  EdtVenda_Total.Text := '0';
  EdtPerc_Total.Text := '0';
  EdtCusto_Total.Text := '0';
  EdtValor_Venda_Original.Text := '0';
  altera := true;
  qrypedido_temporario.First;
  while not qrypedido_temporario.Eof do
  begin
    qrypedido_temporario.Edit;
    // altera:= false;

    Qtde := qrypedido_temporarioQuantidade.AsFloat;
    valor_un := qrypedido_temporarioValor_Original.AsFloat;
    valor_compra := qrypedido_temporarioValor_Compra.AsFloat;

    custo := Qtde * valor_compra;
    valor_tot := Qtde * valor_un;

    perc_pro := valor_un - valor_compra;
    perc_pro := perc_pro / valor_un;
    perc_pro := perc_pro * 100;
    // perc_pro:= Calcula_Valor(FloatToStr(perc_pro));

    qrypedido_temporarioPercetual.AsFloat := 0;
    qrypedido_temporarioSub_Total.AsFloat := valor_tot;
    qrypedido_temporarioValor_Unitario.AsFloat := valor_un;
    qrypedido_temporarioDesc_Acr.AsFloat := 0;

    total_produtos := StrToFloat(EdtVenda_Total.Text) + ((Qtde * valor_un));
    Custo_Total := StrToFloat(EdtCusto_Total.Text) + (custo);

    EdtCusto_Total.Text := FormatFloat('#0.0,0', Custo_Total);
    EdtCusto_Total.Text := StringReplace(EdtCusto_Total.Text, ThousandSeparator,
      '', [rfReplaceAll]);

    EdtVenda_Total.Text := FormatFloat('#0.0,0', total_produtos);
    EdtVenda_Total.Text := StringReplace(EdtVenda_Total.Text, ThousandSeparator,
      '', [rfReplaceAll]);

    EdtValor_Venda_Original.Text := FormatFloat('#0.0,0', total_produtos);
    EdtValor_Venda_Original.Text := StringReplace(EdtValor_Venda_Original.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    Perc := StrToFloat(EdtVenda_Total.Text) - StrToFloat(EdtCusto_Total.Text);
    Perc := Perc / StrToFloat(EdtVenda_Total.Text);
    Perc := Perc * 100;
    Perc := Calcula_Valor(FloatToStr(Perc));

    EdtPerc_Total.Text := FloatToStr(Calcula_Valor(FloatToStr(Perc)));

    // Atualiza_Valores_Pedido_Pendente( StrToInt(EdtCodigo.Text), qrypedido_temporarioCodigo_Produto.AsInteger, 0, 0, valor_tot, valor_un, '', Conexao);
    qrypedido_temporario.Post;
    qrypedido_temporario.Next;
  end;
  altera := false;
  Atualiza_Pedido_Temporario(Conexao);
  // Calcula_Total_Analise( StrToFloat(EdtVenda_Total.Text), perc_fim, StrToFloat(EdtCusto_Total.Text), StrToFloat(EdtTotal_Pedido.Text));
end;

procedure TFrmPedido_Venda.Atualiza_Produto_Encontrado
  (var Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      Close;
      Connection := Conexao;
      Clear;
      add('update Itens_Pedido set Qtde = :Qtde');
      add('where Codigo = :Codigo and Codigo_Produto = :Codigo_Produto');
      Parameters.ParamByName('Qtde').Value := StrToFloat(EdtQuantidade.Text) +
        qryitens_vendaQtde.AsFloat;
      Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
      Parameters.ParamByName('Codigo_Produto').Value :=
        qryitens_vendaCodigo_Produto.AsInteger;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmPedido_Venda.Atualiza_Servicos(var Conexao: TADOConnection);
begin
  with dm.qrychama_servico, sql do
  begin
    Close;
    Connection := Conexao;
    Clear;
    add('Select Pro.Codigo, Pro.Descricao as Descricao_Servico, R.Aliquota, ITP.Preco_Vista from Produto Pro');
    add('left join Itens_Tabela_Preco ITP on (Pro.Codigo = ITP.Codigo_Produto)');
    add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
    add('left join Regra_ISSQN R on (Pro.Codigo_Grupo_Tributacao_ISSQN = R.Codigo)');
    add('where Pro.Status = ' + QuotedStr('ATIVO') + ' and Pro.Tipo = ' +
      QuotedStr('1') + ' and TP.Codigo = :Tabela order by Pro.Descricao');
    Parameters.ParamByName('Tabela').Value := codigo_tabela_preco_ativo;
    open;
  end;
end;

procedure TFrmPedido_Venda.Atualiza_Tipo;
begin
  if (DBGrid1.columns[5].Visible = false) and
    (DBGrid1.columns[6].Visible = false) then
  begin
    DBGrid1.columns[5].Visible := true;
    DBGrid1.columns[6].Visible := true;
  end
  else
  begin
    DBGrid1.columns[5].Visible := false;
    DBGrid1.columns[6].Visible := false;
  end;
  { qryitens_venda.Edit;
    if (qryitens_vendaTipo_Entrega.AsString = 'A') then
    begin
    qryitens_vendaTipo_Entrega.AsString:= 'C';
    end
    else if (qryitens_vendaTipo_Entrega.AsString = 'C') then
    begin
    qryitens_vendaTipo_Entrega.AsString:= 'S';
    end
    else if (qryitens_vendaTipo_Entrega.AsString = 'S') then
    begin
    qryitens_vendaTipo_Entrega.AsString:= 'A';
    end;
    qryitens_venda.Post;


    if (qryitens_vendaTipo_Entrega.AsString = 'C') then
    EdtTotal_Pedido.Text:= FloatToStr(StrToFloat(EdtTotal_Pedido.Text) - qryitens_vendaSub_Total.AsFloat)
    else if (qryitens_vendaTipo_Entrega.AsString = 'A') then
    EdtTotal_Pedido.Text:= FloatToStr(StrToFloat(EdtTotal_Pedido.Text) + qryitens_vendaSub_Total.AsFloat); }
end;

procedure TFrmPedido_Venda.Atualiza_Valores_DBGrid_Analise(Codigo,
  Produto: integer; Valor_Unitario, Qtde, Desc_Acr, Sub_Total, Perc: double;
  dOUa: AnsiString; var Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(self);
  with qAux, sql do
  begin
    Close;
    Connection := Conexao;
    Clear;
    add('update Pedido_Temporario set ');
    add('Valor_Unitario = :Valor_Unitario, ');
    add('Quantidade = :Quantidade, ');
    add('Desc_Acr = :Desc_Acr, ');
    add('dOUa = :dOUa, ');
    add('Sub_Total = :Sub_Total, ');
    add('Percetual = :Percetual');
    add('where Codigo = :Codigo and Codigo_Produto = :Produto');

    Parameters.ParamByName('Codigo').Value := Codigo;
    Parameters.ParamByName('Produto').Value := Produto;
    Parameters.ParamByName('Valor_Unitario').Value := Valor_Unitario;
    Parameters.ParamByName('Quantidade').Value := Qtde;
    Parameters.ParamByName('Desc_Acr').Value := Desc_Acr;
    Parameters.ParamByName('dOUa').Value := dOUa;
    Parameters.ParamByName('Sub_Total').Value := Sub_Total;
    Parameters.ParamByName('Percetual').Value := Perc;
    ExecSQL;
  end;
end;

procedure TFrmPedido_Venda.Atualiza_Valores_Pedido_Pendente(Codigo,
  Produto: integer; Desc_Acr, Perc, Sub_Total, Valor_Unitario: double;
  dOUa: AnsiString; var Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(self);
  with qAux, sql do
  begin
    Close;
    Connection := Conexao;
    Clear;
    add('update Pedido_Temporario set ');
    add('Valor_Unitario = :Valor_Unitario, ');
    add('Desc_Acr = :Desc_Acr,');
    add('dOUa = :dOUa,');
    add('Sub_Total = :Sub_Total,');
    add('Percetual = :Percetual');

    add('where Codigo = :Codigo and Codigo_Produto = :Produto');

    Parameters.ParamByName('Codigo').Value := Codigo;
    Parameters.ParamByName('Produto').Value := Produto;
    Parameters.ParamByName('Valor_Unitario').Value := Valor_Unitario;
    Parameters.ParamByName('Desc_Acr').Value := Desc_Acr;
    Parameters.ParamByName('dOUa').Value := dOUa;
    Parameters.ParamByName('Sub_Total').Value := Sub_Total;
    Parameters.ParamByName('Percetual').Value := Perc;
    ExecSQL;
  end;
end;

procedure TFrmPedido_Venda.Atualiza_Venda_Total;
begin
  qrypedido_temporario.First;
  EdtVenda_Total.Text := '0';
  EdtCusto_Total.Text := '0';
  while not qrypedido_temporario.Eof do
  begin
    EdtVenda_Total.Text := FloatToStr(StrToFloat(EdtVenda_Total.Text) +
      (qrypedido_temporarioValor_Unitario.AsFloat *
      qrypedido_temporarioQuantidade.AsFloat));
    EdtCusto_Total.Text := FloatToStr(StrToFloat(EdtCusto_Total.Text) +
      (qrypedido_temporarioValor_Compra.AsFloat *
      qrypedido_temporarioQuantidade.AsFloat));
    qrypedido_temporario.Next;
  end;
  EdtVenda_Total.Text := FloatToStr(Calcula_Valor(EdtVenda_Total.Text));
  EdtCusto_Total.Text := FloatToStr(Calcula_Valor(EdtCusto_Total.Text));
  Calcula_Total_Analise(StrToFloat(EdtVenda_Total.Text), perc_fim,
    StrToFloat(EdtCusto_Total.Text), StrToFloat(EdtTotal_Produtos.Text));

end;

procedure TFrmPedido_Venda.Edit5DblClick(Sender: TObject);
begin
  if (EdtTotal_Produtos.Visible = false) then
  begin
    Edit4.Visible := true;
    EdtTotal_Produtos.Visible := true;
  end
  else
  begin
    Edit4.Visible := false;
    EdtTotal_Produtos.Visible := false;
  end;
end;

procedure TFrmPedido_Venda.EdtCFOPKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmPedido_Venda.EdtClienteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmPedido_Venda.EdtCodigo_AtendenteDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Usuario, FrmChama_Usuario);
  FrmChama_Usuario.ShowModal;
  FrmChama_Usuario.Free;
end;

procedure TFrmPedido_Venda.EdtCodigo_AtendenteExit(Sender: TObject);
begin
  Pega_Usuario(StrToInt(EdtCodigo_Atendente.Text), Conexao);
end;

procedure TFrmPedido_Venda.EdtCodigo_AtendenteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    uso_tela_pedido := 2;
    Application.CreateForm(TFrmSenha_ADM, FrmSenha_ADM);
    FrmSenha_ADM.ShowModal;
    FrmSenha_ADM.Free;

    if (libera_alterar_atendente_pedido) then
    begin
      libera_alterar_atendente_pedido := false;
      Application.CreateForm(TFrmChama_Funcionario, FrmChama_Funcionario);
      FrmChama_Funcionario.ShowModal;
      FrmChama_Funcionario.Free;
    end
    else
    begin
      Application.MessageBox
        ('Você não tem permissão para alterar o atendente atual.',
        'Usuário não é administrador ou não encontrado', MB_ICONHAND + MB_OK);
      abort;
    end;
  end;
end;

procedure TFrmPedido_Venda.EdtCodigo_AtendenteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(Key);
end;

procedure TFrmPedido_Venda.EdtCodigo_ClienteDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
  FrmChama_Cliente.ShowModal;
  FrmChama_Cliente.Free;
end;

procedure TFrmPedido_Venda.EdtCodigo_ClienteExit(Sender: TObject);
begin
  // Pega_Cliente_Codigo;
end;

procedure TFrmPedido_Venda.EdtCodigo_ClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;

    if (gera_os = '0101') and (tipo_os = 0) then
    begin
      // Consulta.Chama_Status_OS(Conexao);
      // Consulta.Chama_Funcionario_LookUp(Conexao);
      Chama_Veiculo_Cliente(Conexao);
      // Atualiza_Servicos(Conexao);
      CmbVeiculo.KeyValue := NULL;
      // CmbStatus.KeyValue:= NULL;
    end;

  end;
end;

procedure TFrmPedido_Venda.EdtCodigo_ClienteKeyPress(Sender: TObject;
  var abobora: Char);
begin
  Util.Somente_Apaga(abobora);
end;

procedure TFrmPedido_Venda.EdtCodigo_Condicao_PagamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Condicao_Pagamento,
      FrmChama_Condicao_Pagamento);
    FrmChama_Condicao_Pagamento.ShowModal;
    FrmChama_Condicao_Pagamento.Free;
  end;
end;

procedure TFrmPedido_Venda.EdtCodigo_Forma_PagamentoDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Condicao_Pagamento,
    FrmChama_Condicao_Pagamento);
  FrmChama_Condicao_Pagamento.ShowModal;
  FrmChama_Condicao_Pagamento.Free;
end;

procedure TFrmPedido_Venda.EdtCodigo_Forma_PagamentoExit(Sender: TObject);
begin
  // Pega_Condicao_Codigo;
end;

procedure TFrmPedido_Venda.EdtCodigo_Forma_PagamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Condicao_Pagamento,
      FrmChama_Condicao_Pagamento);
    FrmChama_Condicao_Pagamento.ShowModal;
    FrmChama_Condicao_Pagamento.Free;
  end;
end;

procedure TFrmPedido_Venda.Pega_Condicao_Codigo;
begin
  if (EdtCodigo_Forma_Pagamento.Text <> '') then
  begin
    if (dm.qrychama_condicao.Locate('Codigo',
      StrToInt(EdtCodigo_Forma_Pagamento.Text), [])) then
    begin
      FrmPedido_Venda.EdtCodigo_Forma_Pagamento.Text :=
        dm.qrychama_condicaoCodigo.AsString;
      FrmPedido_Venda.EdtForma_Pagamento.Text :=
        dm.qrychama_condicaoDescricao.AsString;
      FrmPedido_Venda.tipo_pag := dm.qrychama_condicaoTipo_Pagamento.AsString;
      FrmPedido_Venda.prazo := dm.qrychama_condicaoPrazo.AsInteger;
      FrmPedido_Venda.qtde_parcela := dm.qrychama_condicaoParcela.AsInteger;
      FrmPedido_Venda.taxa := dm.qrychama_condicaoTaxa.AsFloat;
      FrmPedido_Venda.forma_pagamento_selecionado := dm.qrychama_condicao.RecNo;
      FrmPedido_Venda.tipo_juro := dm.qrychama_condicaoTipo_Juro.AsString;

      if (FrmPedido_Venda.qryitens_venda.Active = true) then
      begin
        FrmPedido_Venda.Atualiza_Preco_Forma_Pag;
      end;
    end
    else
    begin
      Mensagem_Fim_Pesquisa;
      abort;
    end;
  end;
end;

procedure TFrmPedido_Venda.Pega_Usuario(Codigo: integer;
  var Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  if (EdtCodigo_Atendente.Text <> '') then
  begin
    try
      qAux := TADOQuery.Create(nil);
      with qAux, sql do
      begin
        Close;
        Connection := Conexao;
        Clear;
        add('select CU.Nome from Cadastro_Usuario CU where Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value := Codigo;
        open;

        if not(IsEmpty) then
        begin
          EdtAtendente.Text := qAux.FieldByName('Nome').AsString;
        end
        else
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
      end;
    finally
      FreeAndNil(qAux);
    end;
  end;
end;

procedure TFrmPedido_Venda.Pega_Cliente_Codigo;
begin
  if (EdtCodigo_Cliente.Text <> '') then
  begin
    if (dm.qrychama_cliente.Locate('Codigo',
      StrToInt(EdtCodigo_Cliente.Text), [])) then
    begin
      FrmPedido_Venda.EdtCodigo_Cliente.Text :=
        dm.qrychama_clienteCodigo.AsString;
      FrmPedido_Venda.EdtCliente.Text :=
        dm.qrychama_clienteNome_Nome_Fantasia.AsString;

      if (dm.qrychama_clienteBloqueado.AsString = 'SIM') then
      begin
        Mensagem_Cliente_Bloqueado;
        EdtCodigo_Cliente.SetFocus;
        abort;
      end;

      if (dm.qrychama_clienteCPF.AsString <> '') then
        FrmPedido_Venda.LblCPF.Caption := dm.qrychama_clienteCPF.AsString
      else if (dm.qrychama_clienteCNPJ.AsString <> '') then
        FrmPedido_Venda.LblCPF.Caption := dm.qrychama_clienteCNPJ.AsString
      else
        FrmPedido_Venda.LblCPF.Caption := '';

      FrmPedido_Venda.LblCidade.Caption := dm.qrychama_clienteCidade.AsString;
      FrmPedido_Venda.LblSetor.Caption := dm.qrychama_clienteSetor.AsString;
      FrmPedido_Venda.LblEndereco.Caption :=
        dm.qrychama_clienteEndereco.AsString;
      FrmPedido_Venda.LblUF.Caption := dm.qrychama_clienteUF.AsString;
      FrmPedido_Venda.LblTelefone.Caption :=
        dm.qrychama_clienteTelefone.AsString;
      FrmPedido_Venda.LblNumero.Caption := dm.qrychama_clienteNumero.AsString;
      FrmPedido_Venda.LblCEP.Caption := dm.qrychama_clienteCEP.AsString;
      FrmPedido_Venda.LblCodigo_Municipio.Caption :=
        dm.qrychama_clienteCodigo_Municipio.AsString;
      FrmPedido_Venda.LblComplemento.Caption :=
        dm.qrychama_clienteComplemento.AsString;

      permissao_desconto := dm.qrychama_clienteAcima_Limite_Desconto.AsString;

      limite_credito_cliente := dm.qrychama_clienteLimite_Credito.AsFloat;
      credito_cliente := dm.qrychama_clienteCredito.AsFloat;
      acima_limite_credito_cliente :=
        dm.qrychama_clienteAcima_Limite_Credito.AsString;

      if (dm.qrychama_clienteCodigo_Tabela_Preco.AsInteger <> 0) then
      begin
        Atualiza_Codigo_Tabela_Padrao
          (dm.qrychama_clienteCodigo_Tabela_Preco.AsInteger);
      end;

    end
    else
    begin
      Mensagem_Fim_Pesquisa;
      abort;
    end;
  end;
end;

procedure TFrmPedido_Venda.EdtCodigo_Forma_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmPedido_Venda.EdtCodigo_ProdutoDblClick(Sender: TObject);
begin
  if (EdtCodigo_Forma_Pagamento.Text = '') then
  begin
    EdtCodigo_Forma_Pagamento.SetFocus;
    Mensagem_Falta_Dados;
    abort;
  end;

  if (LblUF.Caption = '') then
  begin
    EdtCodigo_Cliente.SetFocus;
    Mensagem_Falta_Dados;
    abort;
  end;

  Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
  FrmChama_Produto.ShowModal;
  FrmChama_Produto.Free;
end;

procedure TFrmPedido_Venda.EdtCodigo_ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  ProdDominio: TProdutoDominio;
  ChamaProd: TFrmChama_Produto;
begin

  if (EdtCodigo_Forma_Pagamento.Text = '') then
  begin
    EdtCodigo_Forma_Pagamento.SetFocus;
    Mensagem_Falta_Dados;
    abort;
  end;

  if (LblUF.Caption = '') then
  begin
    EdtCodigo_Cliente.SetFocus;
    Application.MessageBox
      ('Por favor, coloque a UF do cliente. Menu Cadastro > Cliente. Caso o cliente já esteja com a cidade, informe a UF no cadastro de cidade. Menu Cadastro > Geral > Cidade.',
      'UF não encontrada', MB_OK + MB_ICONHAND);
    abort;
  end;

  if (Key = VK_RETURN) then
  begin
    ProdDominio := TProdutoDominio.Create(Conexao);
    ProdDominio.ProcuraProdutoCodigo(uf, LblUF.Caption,
      codigo_tabela_preco_ativo, consulta_padrao_produto,
      EdtCodigo_Produto.Text);
    ChamaProd.ProcuraProdutoCodigo;
  end;

  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free;
  end;

  { if (key = vk_return) then
    begin
    //if (EdtCodigo_Produto.Text <> '') then
    //begin
    Pega_Produto_Codigo;
    //end;
    end; }
end;

procedure TFrmPedido_Venda.EdtCodigo_ProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  // Util.Somente_Numero(Key);
end;

procedure TFrmPedido_Venda.EdtCodigo_VeiculoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Veiculo, FrmChama_Veiculo);
    FrmChama_Veiculo.ShowModal;
    FrmChama_Veiculo.Free;
  end;
end;

procedure TFrmPedido_Venda.EdtDesc_Acr_TotalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  val_un, valor_final, Total_Pedido: double;
begin
  { if (key = vk_return) then
    begin
    if (EdtDesc_Acr_Total.Text = '') then
    begin
    Valor_Invalido;
    EdtDesc_Acr_Total.SetFocus;
    abort;
    end;

    if (Application.MessageBox('Confirma a aplicação de desconto/acrescimo em todos os itens do orçamento?', 'Confirmação!', MB_YESNO+MB_ICONQUESTION)) = idyes then
    begin
    EdtTotal_Produtos.Text:= '0,00';
    EdtTotal_Pedido.Text:= '0,00';

    Atualiza_Preco_Final;

    Atualiza_Dados;
    EdtDesc_Acr_Total.SetFocus;
    end;
    end; }
end;

procedure TFrmPedido_Venda.EdtDesc_Acr_TotalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(Key);
end;

procedure TFrmPedido_Venda.EdtForma_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmPedido_Venda.EdtKilometragemExit(Sender: TObject);
begin
  if (EdtKilometragem.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtKilometragem.SetFocus;
    abort;
  end;
end;

procedure TFrmPedido_Venda.EdtKilometragemKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(Key);
end;

procedure TFrmPedido_Venda.Oculta_Itens_OS;
begin
  if (gera_os = '0101') then
  begin
    GBOS.Visible := true;
    LblData_Previsao_Entrega.Visible := true;
    LblData_Entrega.Visible := true;
    MEdtData_Previsao_Entrega.Visible := true;
    MEdtData_Entrega.Visible := true;
    PageControl2.Pages[1].TabVisible := true;
    Edit1.Visible := true;
    Edit3.Visible := true;
    EdtQuantidade_Servicos.Visible := true;
    Edit4.Visible := true;
    EdtTotal_Produtos.Visible := true;
    EdtTotal_Servicos.Visible := true;
    Label24.Visible := true;
    CmbStatus.Visible := true;
  end
  else
  begin
    GBOS.Visible := false;
    LblData_Previsao_Entrega.Visible := false;
    LblData_Entrega.Visible := false;
    MEdtData_Previsao_Entrega.Visible := false;
    MEdtData_Entrega.Visible := false;
    PageControl2.Pages[1].TabVisible := false;
    Edit1.Visible := false;
    Edit3.Visible := false;
    Edit4.Visible := false;
    EdtQuantidade_Servicos.Visible := false;
    EdtTotal_Produtos.Visible := false;
    EdtTotal_Servicos.Visible := false;
    Label24.Visible := false;
    CmbStatus.Visible := false;
  end;

  if (tipo_os = 0) then
  begin
    GBOS.Visible := true;
    MmoObservacao.Width := 156;
  end
  else
  begin
    GBOS.Visible := false;
    MmoObservacao.Width := 488;
  end;
end;

procedure TFrmPedido_Venda.EdtDesc_AcrEnter(Sender: TObject);
begin
  RGTipoDesc.Visible := true;
  // if (total_valor_uni < 0) then
  // begin
  // EdtDesc_Acr.Text:= FormatFloat('#0.0,0', Abs(total_valor_uni));//total_valor_uni);//Abs(total_valor_uni));
  // EdtDesc_Acr.Text:= StringReplace(EdtDesc_Acr.Text, ThousandSeparator, '', [rfReplaceAll]);
  { end
    else
    EdtDesc_Acr.Text:= '0,00'; }
end;

procedure TFrmPedido_Venda.EdtDesc_AcrExit(Sender: TObject);
var
  PercDesconto, DescontoDigitado, DescontoR, ValorTabela, DescontoP: double;
begin
  // Verifica_Valor_Negativo_Desconto(StrToFloat(EdtDesc_Acr.Text), EdtDesc_Acr);

  if (EdtDesc_Acr.Text = '') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtDesc_Acr.SetFocus;
    exit;
  end;
  Util.FormataFloat(2, EdtDesc_Acr, StrToFloat(EdtDesc_Acr.Text));

  if (tipo_pag = 'A VISTA') then
    PercDesconto := perc_desc
  else
    PercDesconto := perc_desc_prazo;

  DescontoDigitado := StrToFloat(EdtDesc_Acr.Text);
  ValorTabela := StrToFloat(EdtValor_Tabela.Text);

  if (RGTipoDesc.ItemIndex = 1) then
  begin
    DescontoP := Calcula_Valor_Porcentagem(DescontoDigitado, ValorTabela);
    DescontoP := Calcula_Valor(FloatToStr(DescontoP));

    if (DescontoP > PercDesconto) then
    begin
      TMensagens.MensagemDescontoProduto(DescontoP);
      EdtDesc_Acr.SetFocus;
      abort;
    end;
  end
  else
  begin
    if (Abs(DescontoDigitado) > PercDesconto) then
    begin
      TMensagens.MensagemDescontoProduto(DescontoDigitado);
      EdtDesc_Acr.SetFocus;
      abort;
    end
    else
    begin
      DescontoR := ValorTabela * (DescontoDigitado / 100);
      Util.FormataFloat(2, EdtDesc_Acr, DescontoR);
    end;
  end;
  Util.FormataFloat(2, EdtDesc_Acr, StrToFloat(EdtDesc_Acr.Text));
end;

procedure TFrmPedido_Venda.EdtDesc_AcrKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmPedido_Venda.EdtN_PedidoExit(Sender: TObject);
begin
  if (achei = false) and (iniciado) then
  begin
    if (EdtN_Pedido.Text <> '') then
    begin
      if (Chama_Pedido(Conexao) = true) then
      begin
        Ver_Pedido(Conexao);
        Atualiza_Dados(Conexao);

        achei := true;

        Atualiza_Pedido_Temporario(Conexao);
        // Inicia_Transacao;
        // Atualiza_Venda_Total;
        BBtnCancelar.Enabled := true;
        BBtnExcluir.Enabled := true;
        Util.Habilita_Campos(FrmPedido_Venda);
        EdtCliente.SetFocus;
      end
      else
      begin
        TMensagens.MensagemErro('Pedido não encontrado.');
        abort;
      end;
    end
    else
    begin
      UDeclaracao.pre_venda := '';
      UDeclaracao.Pedido := '';
      Gera_N_Pedido(Conexao);
      Gera_Codigo_Lancamento(Conexao);
      // Inicia_Transacao;
      EdtN_Pedido.Text := UDeclaracao.Pedido;
      numero_pedido := EdtN_Pedido.Text;
      EdtCodigo.Text := IntToStr(UDeclaracao.Codigo);
      BBtnCopiar_DAV.Enabled := true;
      BBtnCancelar.Enabled := true;
      achei := false;
      EdtCodigo_Cliente.SetFocus;
    end;

    if (gera_os = '0101') then
    begin
      Atualiza_Dados_OS(Conexao);
    end;
  end;
end;

procedure TFrmPedido_Venda.EdtN_PedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
  end;

  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_DAV_Converter, FrmChama_DAV_Converter);
    FrmChama_DAV_Converter.ShowModal;
    FrmChama_DAV_Converter.Free;
  end;
end;

procedure TFrmPedido_Venda.Pega_Status_OS(Codigo: integer;
  var Conexao: TADOConnection);
begin
  with dm.qrystatus, sql do
  begin
    Close;
    Connection := Conexao;
    Clear;
    add('select * from Cadastro_Status where Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value := Codigo;
    open;
  end;
end;

procedure TFrmPedido_Venda.Pega_Veiculo(Codigo: integer;
  var Conexao: TADOConnection);
begin
  with dm.qryveiculo, sql do
  begin
    Close;
    Connection := Conexao;
    Clear;
    add('select V.Codigo, V.Veiculo, Modelo, Ano_Fabricacao, Placa, M.Descricao from Veiculo V');
    add('left join Marca M on (V.Codigo_Marca = M.Codigo)');
    add('where V.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value := Codigo;
    open;
  end;
end;

procedure TFrmPedido_Venda.Chama_Veiculo_Cliente(var Conexao: TADOConnection);
begin
  with dm.qryveiculo, sql do
  begin
    Close;
    Connection := Conexao;
    Clear;
    add('select V.Codigo, V.Veiculo, Modelo, Ano_Fabricacao, Placa, Renavam, M.Descricao from Veiculo V');
    add('left join Marca M on (V.Codigo_Marca = M.Codigo)');
    add('where V.Codigo_Cliente = :Codigo_Cliente');
    Parameters.ParamByName('Codigo_Cliente').Value :=
      StrToInt(EdtCodigo_Cliente.Text);
    open;
    if (IsEmpty) then
    begin
      TMensagens.MensagemWarning
        ('Cliente sem veículo cadastrado. Para gerar uma OS é necessário pelo menos um veículo cadastrado.'
        + #10 + #13 +
        'Para cadastrar um veículo, vá em menu Cadastro > Geral > Veículo.' +
        #10 + #13 +
        'Após esse procedimento, volte nesta tela e escolha novamente o cliente para atualizar seus veículos.');
    end;
  end;

  { CmbVeiculo.Clear;
    while not(qryveiculo.EOF) do
    begin
    CmbVeiculo.Items.Add(qryveiculoPlaca.AsString + #10+#13);
    qryveiculo.Next;
    end;
    CmbVeiculo.Items.Add('SELECIONE UM VEÍCULO'); }
end;

procedure TFrmPedido_Venda.EdtProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmPedido_Venda.EdtProdutoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // if not ( (key = 08) or (key = 46) ) and (EdtProduto.Text <> '')  then
  // Consulta.Pega_Produto(EdtProduto);
end;

procedure TFrmPedido_Venda.EdtQuantidadeExit(Sender: TObject);
begin
  if (EdtQuantidade.Text = '') or (StrToFloat(EdtQuantidade.Text) < 0) then
  begin
    Valor_Invalido;
    EdtQuantidade.Clear;
    EdtQuantidade.SetFocus;
    abort;
  end
  else
  begin
    Verifica_Valor_Negativo(StrToFloat(EdtQuantidade.Text), EdtQuantidade);
    EdtQuantidade.Text := FormatFloat('#0.0,0', StrToFloat(EdtQuantidade.Text));
    EdtQuantidade.Text := StringReplace(EdtQuantidade.Text, ThousandSeparator,
      '', [rfReplaceAll]);
  end;
end;

procedure TFrmPedido_Venda.EdtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(Key);
end;

procedure TFrmPedido_Venda.EdtTotal_Desc_AcrEnter(Sender: TObject);
begin
  desc_fim_ant := StrToFloat(EdtTotal_Desc_Acr.Text);
  aplicar_desconto := 0;
end;

procedure TFrmPedido_Venda.EdtTotal_Desc_AcrExit(Sender: TObject);
var
  val_un, valor_final, Total_Pedido, Pedido: double;
begin
  if (EdtDesc_Acr_Total.Text = '') then
  begin
    Valor_Invalido;
    EdtDesc_Acr_Total.SetFocus;
    abort;
  end;

  if (Application.MessageBox
    ('Confirma a aplicação de desconto em todos os itens do orçamento?',
    'Confirmação!', MB_YESNO + MB_ICONQUESTION)) = IDYES then
  begin
    Atualiza_Preco_Final;

    Atualiza_Dados(Conexao); // atualiza dbgrid
    // EdtDesc_Acr_Total.SetFocus;
  end
  else
  begin
    if (pedido_aux <> 0) then
      Pedido := (StrToFloat(EdtTotal_Pedido.Text) - valor_pedido_ant)
    else
      Pedido := 0;

    EdtDesc_Acr_Total.Text := FormatFloat('#0.0,0', Pedido);
    EdtDesc_Acr_Total.Text := StringReplace(EdtDesc_Acr_Total.Text,
      ThousandSeparator, '', [rfReplaceAll]);
  end;
end;

procedure TFrmPedido_Venda.EdtTotal_Desc_AcrKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  val_un, valor_final, Total_Pedido: double;
begin
  { if (key = vk_return) then
    begin
    if (EdtDesc_Acr_Total.Text = '') then
    begin
    Valor_Invalido;
    EdtDesc_Acr_Total.SetFocus;
    abort;
    end;

    if (Application.MessageBox('Confirma a aplicação de desconto/acrescimo em todos os itens do orçamento?', 'Confirmação!', MB_YESNO+MB_ICONQUESTION)) = idyes then
    begin
    EdtTotal_Produtos.Text:= '0,00';
    EdtTotal_Pedido.Text:= '0,00';

    Atualiza_Preco_Final;

    Atualiza_Dados;
    EdtDesc_Acr_Total.SetFocus;
    end;
    end; }
end;

procedure TFrmPedido_Venda.EdtTotal_Desc_AcrKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', '-', #08]) then
    Key := #0
end;

procedure TFrmPedido_Venda.EdtTotal_PedidoEnter(Sender: TObject);
begin
  valor_pedido_ant := StrToFloat(EdtTotal_Pedido.Text);
  aplicar_desconto := 1;
end;

procedure TFrmPedido_Venda.EdtTotal_PedidoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  total_produtos, Total_Pedido, des_p_aux: double;
begin
  if (Key = VK_RETURN) then
  begin
    pedido2 := 0;
    pedido_aux := 0;

    pedido2 := StrToFloat(EdtTotal_Pedido.Text);
    pedido_aux := pedido2 - valor_pedido_ant;

    // EdtDesc_Acr_Total.Text:= FormatFloat('#0.0,0', pedido);
    // EdtDesc_Acr_Total.Text:= StringReplace(EdtDesc_Acr_Total.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtTotal_Pedido.Text := FormatFloat('#0.0,0',
      StrToFloat(EdtTotal_Pedido.Text));
    EdtTotal_Pedido.Text := StringReplace(EdtTotal_Pedido.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    total_produtos := StrToFloat(EdtTotal_Produtos.Text);
    Total_Pedido := StrToFloat(EdtTotal_Pedido.Text);

    if (pedido_aux <> 0) then
    begin
      des_p_aux := Total_Pedido - total_produtos;
      des_p := (des_p_aux / Total_Pedido);
      des_p := des_p * 100;
      des_p := Calcula_Valor(FloatToStr(des_p));

      { des_p_aux:= total_produtos - total_pedido;
        des_p:= ( des_p_aux / total_produtos );
        des_p:= des_p * 100;
        des_p:= Calcula_Valor(FloatToStr(des_p)); }

      if (des_p > 0) then
        des_p := des_p * -1
      else
        des_p := Abs(des_p);

      // EdtTotal_Desc_Acr.Text:= FloatToStr( des_p );
      Util.FormataFloat(2, EdtTotal_Desc_Acr, des_p);
      EdtTotal_Desc_AcrExit(self);
    end;
  end;
end;

procedure TFrmPedido_Venda.EdtTotal_PedidoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(Key);
end;

procedure TFrmPedido_Venda.EdtValor_TabelaExit(Sender: TObject);
begin
  if (EdtValor_Tabela.Text = '') or (EdtValor_Tabela.Text = '0') or
    (EdtValor_Tabela.Text = '0,00') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtValor_Tabela.SetFocus;
    exit;
  end;
  Util.FormataFloat(2, EdtValor_Tabela, StrToFloat(EdtValor_Tabela.Text));
end;

procedure TFrmPedido_Venda.EdtValor_TabelaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(Key);
end;

procedure TFrmPedido_Venda.EdtValor_TotalEnter(Sender: TObject);
var
  Qtde, tot_trun, total, Desc_Acr: double;
  valor_un, valor_tot, desc: double;
begin
  // RGDesconto_Item.Visible:= false;

  Qtde := StrToFloat(EdtQuantidade.Text);
  valor_un := StrToFloat(EdtValor_Unitario.Text);
  // valor_un:= var_uni;//StrToFloat(EdtValor_Unitario.Text);
  // desc:= StrToFloat(EdtDesc_Acr.Text);

  // tot_trun:= qtde * valor_un;
  // total:= Calcula_Valor(FloatToStr(tot_trun));

  { if (LbldOUa.Caption = 'D') then
    valor_un:= Calcula_Valor(FloatToStr(valor_un - desc))
    else
    valor_un:= Calcula_Valor(FloatToStr(valor_un + desc)); }

  valor_tot := Calcula_Valor(FloatToStr((valor_un * Qtde)));

  EdtValor_Total.Text := FormatFloat('#0.0,0', valor_tot);
  EdtValor_Total.Text := StringReplace(EdtValor_Total.Text, ThousandSeparator,
    '', [rfReplaceAll]);

end;

procedure TFrmPedido_Venda.EdtValor_TotalExit(Sender: TObject);
begin
  if (EdtValor_Total.Text <> '') then
  begin
    Verifica_Valor_Negativo(StrToFloat(EdtValor_Total.Text), EdtValor_Total);
  end;
end;

procedure TFrmPedido_Venda.EdtValor_TotalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  bc, bc2, ali: double;
  Total_Pedido, valor_total, comissao: double;
begin
  if (Key = VK_RETURN) then
  begin
  end;
end;

procedure TFrmPedido_Venda.Calcula_Imposto;
var
  bc, bc2, ali: double;
begin
  // -------------------icms acrescida ou reduzida----------------//

  // Calcula_ICMS;
  // --------------------fim icms--------------------------------//


  // -------------------ipi acrescida ou reduzida----------------//

  if (ipi = '') then
    ipi := '0';

  if (br_ipi <> '') then
  begin
    bc := (StrToFloat(br_ipi) / 100) * StrToFloat(EdtValor_Total.Text);
    bc2 := StrToFloat(EdtValor_Total.Text) - bc;
    // LblBC_IPI.Caption:= FloatToStr(bc2);     //base

    if (ipi = 'I') or (ipi = 'N') or (ipi = 'F') or (ipi = '0') then
    begin
      ali := 0 * bc2;
      valor_ipi := FloatToStr(ali);
    end
    else
    begin
      ali := (StrToFloat(ipi) / 100) * bc2;
      valor_ipi := FloatToStr(ali);
    end;
  end
  else if (ba_ipi <> '') then
  begin
    bc := (StrToFloat(ba_ipi) / 100) * StrToFloat(EdtValor_Total.Text);
    bc2 := StrToFloat(EdtValor_Total.Text) + bc;
    // LblBC_IPI.Caption:= FloatToStr(bc2);     //base

    if (ipi = 'I') or (ipi = 'N') or (ipi = 'F') or (ipi = '0') then
    begin
      ali := 0 * bc2;
      valor_ipi := FloatToStr(ali);
    end
    else
    begin
      ali := (StrToFloat(ipi) / 100) * bc2;
      valor_ipi := FloatToStr(ali);
    end;
  end
  else
  begin
    bc2 := StrToFloat(EdtValor_Total.Text);
    // LblBC_IPI.Caption:= FloatToStr(bc2);     //base

    if (ipi = 'I') or (ipi = 'N') or (ipi = 'F') or (ipi = '0') then
    begin
      ali := 0 * bc2;
      valor_ipi := FloatToStr(ali);
    end
    else
    begin
      ali := (StrToFloat(ipi) / 100) * bc2;
      valor_ipi := FloatToStr(ali);
    end;
  end;
  // --------------------fim ipi--------------------------------//

  // -------------------pis acrescida ou reduzida----------------//

  if (pis = '') then
    pis := '0';

  if (br_pis <> '') then
  begin
    bc := (StrToFloat(br_pis) / 100) * StrToFloat(EdtValor_Total.Text);
    bc2 := StrToFloat(EdtValor_Total.Text) - bc;
    bc_pis := FloatToStr(bc2); // base

    if (pis = 'I') or (pis = 'N') or (pis = 'F') or (pis = '0') then
    begin
      ali := 0 * bc2;
      valor_pis := FloatToStr(ali);
    end
    else
    begin
      ali := (StrToFloat(pis) / 100) * bc2;
      valor_pis := FloatToStr(ali);
    end;
  end
  else if (ba_pis <> '') then
  begin
    bc := (StrToFloat(ba_pis) / 100) * StrToFloat(EdtValor_Total.Text);
    bc2 := StrToFloat(EdtValor_Total.Text) + bc;
    bc_pis := FloatToStr(bc2); // base

    if (pis = 'I') or (pis = 'N') or (pis = 'F') or (pis = '0') then
    begin
      ali := 0 * bc2;
      valor_pis := FloatToStr(ali);
    end
    else
    begin
      ali := (StrToFloat(pis) / 100) * bc2;
      valor_pis := FloatToStr(ali);
    end;
  end
  else
  begin
    bc2 := StrToFloat(EdtValor_Total.Text);
    bc_pis := FloatToStr(bc2); // base

    if (pis = 'I') or (pis = 'N') or (pis = 'F') or (pis = '0') then
    begin
      ali := 0 * bc2;
      valor_pis := FloatToStr(ali);
    end
    else
    begin
      ali := (StrToFloat(pis) / 100) * bc2;
      valor_pis := FloatToStr(ali);
    end;
  end;
  // --------------------fim pis--------------------------------//

  // -------------------cofins acrescida ou reduzida----------------//

  if (cofins = '') then
    cofins := '0';

  if (br_cofins <> '') then
  begin
    bc := (StrToFloat(br_cofins) / 100) * StrToFloat(EdtValor_Total.Text);
    bc2 := StrToFloat(EdtValor_Total.Text) - bc;
    bc_cofins := FloatToStr(bc2); // base

    if (cofins = 'I') or (cofins = 'N') or (cofins = 'F') or (cofins = '0') then
    begin
      ali := 0 * bc2;
      valor_cofins := FloatToStr(ali);
    end
    else
    begin
      ali := (StrToFloat(cofins) / 100) * bc2;
      valor_cofins := FloatToStr(ali);
    end;
  end
  else if (ba_cofins <> '') then
  begin
    bc := (StrToFloat(ba_cofins) / 100) * StrToFloat(EdtValor_Total.Text);
    bc2 := StrToFloat(EdtValor_Total.Text) + bc;
    bc_cofins := FloatToStr(bc2); // base

    if (cofins = 'I') or (cofins = 'N') or (cofins = 'F') or (cofins = '0') then
    begin
      ali := 0 * bc2;
      valor_cofins := FloatToStr(ali);
    end
    else
    begin
      ali := (StrToFloat(cofins) / 100) * bc2;
      valor_cofins := FloatToStr(ali);
    end;
  end
  else
  begin
    bc2 := StrToFloat(EdtValor_Total.Text);
    bc_cofins := FloatToStr(bc2); // base

    if (cofins = 'I') or (cofins = 'N') or (cofins = 'F') or (cofins = '0') then
    begin
      ali := 0 * bc2;
      valor_cofins := FloatToStr(ali);
    end
    else
    begin
      ali := (StrToFloat(cofins) / 100) * bc2;
      valor_cofins := FloatToStr(ali);
    end;
  end;
  // --------------------fim cofins--------------------------------//

  sub_total_liquido := FloatToStr(StrToFloat(EdtValor_Total.Text) -
    StrToFloat(valor_icms) - StrToFloat(valor_cofins) - StrToFloat(valor_pis) -
    StrToFloat(valor_ipi));
end;

procedure TFrmPedido_Venda.EdtValor_TotalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(Key);
end;

procedure TFrmPedido_Venda.Colega_Dados_R05(var Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  {qAux := TADOQuery.Create(self);
  with qAux, sql do
  begin
    Close;
    Connection := Conexao;
    Clear;
    add('Delete from R05');
    add('where N_Pedido = :N_Pedido');
    Parameters.ParamByName('N_Pedido').Value := StrToInt(EdtCodigo.Text);
    ExecSQL;
  end;

  try
    qryitens_venda.First;
    while not qryitens_venda.Eof do
    begin
      with qAux, sql do
      begin
        Close;
        Connection := Conexao;
        Clear;
        add('select P.Codigo, P.Producao_Propria, P.Arred_Trunc from Produto P');
        add('where P.Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value :=
          qryitens_vendaCodigo_Produto.AsInteger;
        open;
      end;

      cod_pro := qryitens_vendaCodigo_Venda.AsString;
      descri := qryitens_vendaDescricao.AsString;
      qtde_vendida := qryitens_vendaQtde.AsString;
      unid := qryitens_vendaUN.AsString;
      valor_unit := qryitens_vendaValor_Unitario.AsString;

      if (qryitens_vendaDesc_Acr.AsFloat < 0) then
        desc_item := qryitens_vendaDesc_Acr.AsString
      else
        acre_item := qryitens_vendaDesc_Acr.AsString;

      valor_total_item := qryitens_vendaSub_Total.AsString;
      if (qryitens_vendaCancelado.AsString = 'S') then
      begin
        indicador_cancelamento_item := 'S';
        qtde_cancelada := qryitens_vendaQtde.AsString;
        valor_cancelado := FloatToStr(StrToFloat(qtde_cancelada) *
          qryitens_vendaValor_Unitario.AsFloat);
      end
      else
      begin
        indicador_cancelamento_item := 'N';
        qtde_cancelada := '';
        valor_cancelado := '';
      end;
      can_acre := '0';
      IAT := qAux.FieldByName('Arred_Trunc').AsString;
      IPPT := qAux.FieldByName('Producao_Propria').AsString;
      casa_decimal_qtde := '0';
      casa_decimal_val_un := '2';
      LblProduto.Caption := qryitens_vendaCodigo_Produto.AsString;

      R05.Salva_Banco(R05);
      // R05.Salva_Banco_Aux(R05);

      qryitens_venda.Next;
    end;
  finally
    FreeAndNil(qAux);
  end;}
end;

procedure TFrmPedido_Venda.EdtValor_UnitarioEnter(Sender: TObject);
var
  ValorTabela, desconto, ValorFinal: double;
begin
  RGTipoDesc.Visible := false;
  ValorTabela := StrToFloat(EdtValor_Tabela.Text);
  desconto := StrToFloat(EdtDesc_Acr.Text);
  ValorFinal := ValorTabela - desconto;
  Util.FormataFloat(2, EdtValor_Unitario, ValorFinal);
end;

procedure TFrmPedido_Venda.EdtValor_UnitarioExit(Sender: TObject);
var
  ValorTabela, ValorUnitario, desconto, DescontoP, PercDesconto,
    DescontoR: double;
begin
  if (EdtValor_Unitario.Text = '') or (EdtValor_Unitario.Text = '0') or
    (EdtValor_Unitario.Text = '0,00') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtValor_Unitario.SetFocus;
    exit;
  end;

  if (EdtValor_Tabela.Text <> EdtValor_Unitario.Text) then
  begin
    if (tipo_pag = 'A VISTA') then
      PercDesconto := perc_desc
    else
      PercDesconto := perc_desc_prazo;

    ValorTabela := StrToFloat(EdtValor_Tabela.Text);
    ValorUnitario := StrToFloat(EdtValor_Unitario.Text);
    desconto := ValorTabela - ValorUnitario;

    DescontoP := Calcula_Valor_Porcentagem(desconto, ValorTabela);
    DescontoP := Calcula_Valor(FloatToStr(DescontoP));
    Util.FormataFloat(2, EdtDesc_Acr, desconto);
    Util.FormataFloat(2, EdtValor_Unitario, ValorUnitario);

    if (DescontoP > PercDesconto) then
    begin
      TMensagens.MensagemDescontoProduto(DescontoP);
      EdtDesc_Acr.SetFocus;
      exit;
    end;
    { end
      else if ( (RGTipoDesc.ItemIndex = 1) and (EdtValor_Tabela.Text <> EdtValor_Unitario.Text)) then
      begin
      TMensagens.MensagemWarning('O desconto pelo valor unitário é permitido apenas para a opção R$ marcada.'+#10+#13+'Por favor, clique no campo Desconto, marque a opção R$ no campo Tipo que irá aparecer na tela e tente novamente.');
      EdtDesc_Acr.SetFocus;
      Exit; }
  end;

  { if (EdtValor_Unitario.Text = '') or (EdtValor_Unitario.Text = '0') or (StrToFloat(EdtValor_Unitario.Text) < 0) then
    begin
    Valor_Invalido;
    EdtValor_Unitario.SetFocus;
    abort;
    end
    else
    begin
    Verifica_Valor_Negativo(StrToFloat(EdtQuantidade.Text), EdtQuantidade);
    novo_valor_uni:= StrToFloat(EdtValor_Unitario.Text);
    total_valor_uni:= novo_valor_uni - var_uni;

    if (tipo_pag = 'A VISTA') then
    desconto:= perc_desc
    else
    desconto:= perc_desc_prazo;

    //calcula o percentual do produto
    des_p:= ( total_valor_uni / novo_valor_uni );
    des_p:= des_p * 100;
    des_p:= Calcula_Valor(FloatToStr(des_p));

    if (des_p > 0) then
    des_p:= des_p * -1
    else
    des_p:= Abs(des_p);

    if ( (des_p ) > desconto) then
    begin
    Application.MessageBox(PChar('O desconto de '+ QuotedStr(FloatToStr(des_p)) +'%, está acima do limite para esse produto'), 'Desconto não permitido', MB_OK+MB_ICONHAND);
    EdtValor_Unitario.Text:= FloatToStr(var_uni);
    EdtValor_Unitario.SetFocus;
    abort;
    end;

    if (total_valor_uni >= 0) then
    LbldOUa.Caption:= 'A'
    else
    LbldOUa.Caption:= 'D';

    if (total_valor_uni <> 0) then
    LblpOUr.Caption := 'R';

    //EdtValor_Unitario.Text:= FormatFloat('#0.0,0', var_uni);
    EdtValor_Unitario.Text:= FormatFloat('#0.0,0', novo_valor_uni);
    EdtValor_Unitario.Text:= StringReplace(EdtValor_Unitario.Text, ThousandSeparator, '', [rfReplaceAll]);
    end; }
end;

procedure TFrmPedido_Venda.EdtValor_UnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(Key);
end;

procedure TFrmPedido_Venda.EdtVenda_TotalEnter(Sender: TObject);
begin
  // venda_total:= StrToFloat(EdtVenda_Total.Text);
  valor_venda_ant := StrToFloat(EdtVenda_Total.Text);
end;

procedure TFrmPedido_Venda.EdtVenda_TotalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  per, perc_fim, valor, perc_aux, perc_aux2, total, total_ped, Custo_Total,
    venda_total, valor_un, Qtde, valor_tot, desc, venda_original, desc_geral,
    desc_aux, pedido2, valor_un_2, per_ven: double;

  valor_aux, dOUa: AnsiString;
begin
  if (Key = VK_RETURN) then
  begin
    per := 0;
    desc_acr_total := 0;
    total_venda_temporario := 0;
    pedido2 := StrToFloat(EdtVenda_Total.Text);

    if (EdtVenda_Total.Text = '') then
    begin
      EdtVenda_Total.SetFocus;
      Mensagem_Falta_Dados;
      abort;
    end;

    venda_original := StrToFloat(EdtValor_Venda_Original.Text);

    desc_geral := valor_venda_ant - StrToFloat(EdtVenda_Total.Text);

    // pedido2_temporario:= valor_venda_ant - pedido2;
    pedido2_temporario := StrToFloat(EdtVenda_Total.Text) - venda_original;

    // per:= ( pedido2_temporario / valor_venda_ant );
    per := (pedido2_temporario / StrToFloat(EdtVenda_Total.Text));
    per := per * 100;
    per := Calcula_Valor(FloatToStr(per));

    // per_ven:= StrToFloat(EdtPercentual_Desconto_Pedido.Text);
    // EdtPercentual_Desconto_Pedido.Text:= FloatToStr( per_ven + per );
    EdtPercentual_Desconto_Pedido.Text := FloatToStr(per);

    qrypedido_temporario.First;
    while not qrypedido_temporario.Eof do
    begin

      Custo_Total := (qrypedido_temporarioValor_Compra.AsFloat *
        qrypedido_temporarioQuantidade.AsFloat);

      Qtde := qrypedido_temporarioQuantidade.AsFloat;

      valor_un := qrypedido_temporarioValor_Original.AsFloat;

      valor_un_2 := qrypedido_temporarioValor_Unitario.AsFloat;

      valor_tot := qrypedido_temporarioSub_Total.AsFloat;

      // desc:= (valor_tot / venda_original) * desc_geral;
      // desc:= (valor_un_2 / venda_original) * desc_geral;
      desc := (valor_un_2 / valor_venda_ant) * desc_geral;

      valor_un_2 := valor_un_2 - desc;

      desc := Calcula_Valor(FloatToStr(desc));
      desc := Abs(desc);
      desc_acr_total := desc_acr_total + Abs(desc);

      if (per > 0) then
        dOUa := 'A'
      else
        dOUa := 'D';

      if (pedido2_temporario < 0) then
      begin
        // valor_tot:= ( (valor_un * qtde) - desc)
        valor_tot := ((valor_un_2 * Qtde))
      end
      else
      begin
        // valor_tot:= ( (valor_un * qtde) + desc);
        valor_tot := ((valor_un_2 * Qtde));
      end;

      // qrypedido_temporario.Edit;
      // qrypedido_temporarioDesc_Acr.AsFloat:= Abs(desc);
      // qrypedido_temporarioSub_Total.AsFloat:= valor_tot;
      // qrypedido_temporariodOUa.AsString:= dOUa;

      perc_aux2 := valor_tot - Custo_Total;
      perc_aux2 := (perc_aux2 / valor_tot);
      perc_aux2 := perc_aux2 * 100;
      perc_aux2 := Calcula_Valor(FloatToStr(perc_aux2));

      // qrypedido_temporarioPercetual.AsFloat:= perc_aux2;

      Atualiza_Valores_Pedido_Pendente(StrToInt(EdtCodigo.Text),
        qrypedido_temporarioCodigo_Produto.AsInteger, 0, perc_aux2, valor_tot,
        valor_un_2, dOUa, Conexao);

      // qrypedido_temporario.Post;

      qrypedido_temporario.Next;
    end;

    // Atualiza_Valores_Pedido_Pendente(StrToInt(EdtCodigo.Text), qrypedido_temporarioCodigo_Produto.AsInteger, Calcula_Valor(FloatToStr(desc)), perc_aux2, );

    total_ped := StrToFloat(EdtTotal_Pedido.Text);
    // Atualiza_Preco_Maior_Valor_Pedido_Temporario;

    total := StrToFloat(EdtVenda_Total.Text);
    Calcula_Total_Analise(total, perc_fim, StrToFloat(EdtCusto_Total.Text),
      total_ped);

    Atualiza_Pedido_Temporario(Conexao);
  end;
end;

procedure TFrmPedido_Venda.Atualiza_Preco_Maior_Valor_Pedido_Temporario;
var
  qAux, qAux2: TADOQuery;
  dif_desc, Qtde, Sub_Total, Valor_Unitario, Total_Pedido, desc: double;
begin
  Total_Pedido := total_venda_temporario;
  dif_desc := (pedido2_temporario - Total_Pedido);

  if (dif_desc <> 0) then
  begin
    qAux := TADOQuery.Create(self);
    qAux2 := TADOQuery.Create(self);
    try
      with qAux, sql do
      begin
        Close;
        Connection := Conexao;
        Clear;
        add('select PT.Codigo_Produto, PT.Quantidade, PT.Valor_Compra, PT.Valor_Original, PT.Valor_Unitario from Pedido_Temporario PT where');
        add('PT.Valor_Unitario in (select max(PT.Valor_Unitario) as Maior from Pedido_Temporario PT where PT.Codigo = :Codigo)');
        Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
        open;
      end;

      // sub_total:= qAux.FieldByName('Sub_Total').AsFloat;
      Qtde := qAux.FieldByName('Quantidade').AsFloat;
      Valor_Unitario := qAux.FieldByName('Valor_Unitario').AsFloat;

      if (dif_desc > 0) then
        Valor_Unitario := Valor_Unitario + dif_desc
      else
        Valor_Unitario := Valor_Unitario - dif_desc;

      // valor_unitario:= sub_total / qtde;
      // desc:= qAux.FieldByName('Valor_Original').AsFloat - valor_unitario;

      des_p_aux := (Valor_Unitario - qAux.FieldByName('Valor_Compra').AsFloat);
      des_p := (des_p_aux / Valor_Unitario);
      des_p := des_p * 100;
      des_p := Calcula_Valor(FloatToStr(des_p));

      { if (des_p > 0) then
        des_p:= des_p * -1
        else
        des_p:= Abs(des_p); }

      // qryitens_vendaDesc_Acr_P.AsFloat:= des_p;

      with qAux2, sql do
      begin
        Close;
        Connection := Conexao;
        Clear;
        add('update Pedido_Temporario set Valor_Unitario = :Valor_Unitario, Percetual = :Percetual from Pedido_Temporario where');
        add('Codigo = :Codigo and Codigo_Produto = :Codigo_Produto');
        Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
        Parameters.ParamByName('Codigo_Produto').Value :=
          qAux.FieldByName('Codigo_Produto').AsInteger;
        // Parameters.ParamByName('Sub_Total').Value:= sub_total;
        Parameters.ParamByName('Valor_Unitario').Value := Valor_Unitario;
        // Parameters.ParamByName('Desc_Acr').Value:= desc;
        Parameters.ParamByName('Percetual').Value := des_p;
        ExecSQL;
      end;

      with qAux, sql do
      begin
        Close;
        Connection := Conexao;
        Clear;
        add('select sum(PT.Quantidade * PT.Valor_Unitario) as Sub_Total from Pedido_Temporario PT');
        add('where PT.Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
        open;
      end;

      EdtVenda_Total.Text := FormatFloat('#0.0,0',
        qAux.FieldByName('Sub_Total').AsFloat);
      EdtVenda_Total.Text := StringReplace(EdtVenda_Total.Text,
        ThousandSeparator, '', [rfReplaceAll]);
    finally
      FreeAndNil(qAux);
      FreeAndNil(qAux2);
    end;

  end;
end;

procedure TFrmPedido_Venda.EdtVenda_TotalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(Key);
end;

procedure TFrmPedido_Venda.Escreve_Texto;
begin
  Edit1.Text := 'Qtde Serv';
  Edit2.Text := 'Qtde Itens';
  Edit4.Text := 'Total Produtos';
  Edit7.Text := 'Total %';
  Edit8.Text := 'Desconto Total';
  Edit5.Text := 'Total do Pedido';
  Edit3.Text := 'Total Serviços';
  Edit4.Text := 'Total Produtos';
  Edit9.Text := 'Impostos';
  EdtQuantidade_Itens.Text := '0';
  EdtQuantidade_Servicos.Text := '0';
  EdtTotal_Produtos.Text := '0,00';
  EdtTotal_Desc_Acr.Text := '0,00';
  EdtDesc_Acr_Total.Text := '0,00';
  EdtTotal_Pedido.Text := '0,00';
  EdtTotal_Produtos.Text := '0,00';
  EdtTotal_Servicos.Text := '0,00';
  EdtTotal_Impostos.Text := '0,00';
end;

procedure TFrmPedido_Venda.Exclui_Forma_Pagamento(var Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, sql do
    begin
      Close;
      Connection := Conexao;
      Clear;
      add('Delete from Pedido_Pagamento_DAV where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value :=
        StrToInt(FrmPedido_Venda.EdtCodigo.Text);
      ExecSQL;
    end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

procedure TFrmPedido_Venda.Exclui_Pedido_Endereco_Cliente
  (var Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, sql do
    begin
      Close;
      Connection := Conexao;
      Clear;
      add('Delete from Pedido_Endereco_Cliente where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value :=
        StrToInt(FrmPedido_Venda.EdtCodigo.Text);
      ExecSQL;
    end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

{ procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
  begin
  case llEstado of
  Inserir: Habilita_Botao([false, true, false, true]);
  //Alterar: Habilita_Botao([false, true, false, true]);
  Consultar: Habilita_Botao([false, true, true, true]);
  end;
  end; }

procedure TFrmPedido_Venda.FormActivate(Sender: TObject);
begin
  ativo := true;
end;

procedure TFrmPedido_Venda.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (pode_fechar = false) then
  begin
    Salve;
    abort;
  end
  else
  begin
    Fecha_Conexao;
    codigo_tabela_preco_ativo := codigo_tabela_preco_padrao;
    FrmPedido_Venda.Release;
    FrmPedido_Venda := Nil;
  end;
end;

procedure TFrmPedido_Venda.Fecha_Conexao;
begin
  if (Conexao <> nil) then
  begin
    // if (Conexao.InTransaction) then
    // begin
    Conexao.Close;
    // end;
  end;
end;

procedure TFrmPedido_Venda.Inicia_Itens();
begin
  qtde_itens := 0;
  credito_aux := 0;
  RGTipoDesc.Visible := false;
  Limpa_Tributos;
  Inicia_Text;
  Desabilita_Total;
  tipodesc_acr := '%';
  PageControl2.TabIndex := 0;
  UDeclaracao.n_item := '';
  criado := 0;
  total_des := 0;
  total_acr := 0;
  qryitens_venda.Close;
  achei := false;
  Escreve_Texto;
  altera := false;
  tipo_pag := '';
  valor_pedido_ant := 0;
  CBImprimir_Lista.Checked := false;
  DBGrid1.columns[5].Visible := false;
  DBGrid1.columns[6].Visible := false;
  MEdtData_Venda.Text := DateToStr(date);
  MEdtHora_Venda.Text := FormatDateTime('hh:mm', now);
  MEdtData_Vencimento.Text :=
    DateToStr(IncDay(StrToDateTime(MEdtData_Venda.Text),
    dias_orcamento_vencido));
  MEdtData_Previsao_Entrega.Text := DateToStr(date);
  MEdtData_Entrega.Text := DateToStr(date);
  CmbVeiculo.KeyValue := NULL;
  CmbStatus.KeyValue := NULL;
  EdtKilometragem.Text := '0';
  EdtQuantidade.Text := '1';
end;

procedure TFrmPedido_Venda.Inicia_Query_Conexao(var Conexao: TADOConnection);
begin
  qryitens_venda.Connection := Conexao;
  qryitens_os.Connection := Conexao;
  qrypedido_temporario.Connection := Conexao;
  // dm.qrychama_produto.Connection:= Conexao;
  // dm.qrychama_cliente.Connection:= Conexao;
end;

procedure TFrmPedido_Venda.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmPedido_Venda);
  Util.Limpa_Campos(FrmPedido_Venda);
  Util.Desabilita_Campos(FrmPedido_Venda);
  Centraliza_Form(FrmPedido_Venda);
  Oculta_Itens_OS;
  pode_fechar := true;
  BBtnCopiar_DAV.Enabled := false;
  BBtnVoltar_Pedido.Enabled := true;
  Inicia_Itens;

  local := 'C:\Pedido_Aux.xml';

  if (gera_pre_venda = '0101') then
  begin
    // BBtnConverter_Pre_Venda.Visible:= true;
    BBtnCopiar_DAV.Visible := true;
    BBtnVoltar_Pedido.Visible := true;
    BBtnAnalisa_Venda.Visible := true;
  end
  else
  begin
    // BBtnConverter_Pre_Venda.Visible:= false;
    BBtnCopiar_DAV.Visible := true;
    BBtnVoltar_Pedido.Visible := false;
    BBtnAnalisa_Venda.Visible := true;
  end;
  Habilita_DAV_PreVenda;
end;

procedure TFrmPedido_Venda.FormDeactivate(Sender: TObject);
begin
  ativo := false;
end;

procedure TFrmPedido_Venda.Verifica_Credito_Cliente;
var
  aux: Boolean;
  ValorTotal, TotalCompra, Credito: double;
begin
  TotalCompra := StrToFloat(EdtTotal_Pedido.Text);
  FCliente := TClienteEntidade.Create;
  FClienteDom := TClienteDominio.Create(Conexao);
  FCliente.Codigo := StrToInt(EdtCodigo.Text);
  FCliente.NomeFantasia := EdtCliente.Text;
  if not(FClienteDom.VerificaSeExisteLimiteDeCreditoDisponivel(FCliente,
    TotalCompra)) then
  begin
    abort;
  end;

  { uso_tela_pedido:= 1;
    credito_aux:= credito_cliente - Total_Pedido;

    if (credito_aux < 0) then
    aux:= true
    else
    begin
    aux:= false;
    Atualiza_Credito_Cliente(credito_aux, Conexao);
    end;

    if (aux) and (acima_limite_credito_cliente = 'PERMITIR VENDA') then
    begin
    Atualiza_Credito_Cliente(credito_aux, Conexao);
    end;

    if (aux) and (acima_limite_credito_cliente = 'BLOQUEAR VENDA') then
    begin
    Application.MessageBox('Cliente atingiu o limite de compras a prazo. Venda bloqueada.', 'Venda Bloqueada', MB_OK+MB_ICONHAND);
    abort;
    end;

    if (aux) and (acima_limite_credito_cliente = 'EXIBIR MENSAGEM DE ALERTA') then
    begin
    if (Application.MessageBox('Cliente atingiu o limite de compras a prazo. Deseja continuar?', 'Atingiu limite de crédito', MB_YESNO+MB_ICONHAND)) = IDNO then
    begin
    //Limpa_Menor;
    abort;
    end
    else
    begin
    Atualiza_Credito_Cliente(credito_aux, Conexao);
    UDeclaracao.Insere_Historico(usuario, 'FOI LIBERADO A VENDA Nº ' + FrmPedido_Venda.EdtN_Pedido.Text + ', PARA O CLIENTE '+FrmPedido_Venda.EdtCliente.Text+', ATRAVÉS DE ACEITAÇÃO NA MENSAGEM DE ALERTA.' , TimeToStr(time), insercao, date);
    end;
    end;

    if (aux) and (acima_limite_credito_cliente = 'SOLICITAR ADM.') then
    begin
    Application.MessageBox('Cliente atingiu o limite de compras a prazo. Por favor, chame o Administrador.', 'Venda Bloqueada Temporariamente', MB_OK+MB_ICONHAND);

    Application.CreateForm(TFrmSenha_ADM, FrmSenha_ADM);
    FrmSenha_ADM.ShowModal;
    FrmSenha_ADM.Free;

    if (liberado_cliente_acima_limite) then
    begin
    Atualiza_Credito_Cliente(credito_aux, Conexao);
    UDeclaracao.Insere_Historico(usuario, 'FOI LIBERADO A VENDA Nº ' + FrmPedido_Venda.EdtN_Pedido.Text + ', PARA O CLIENTE '+FrmPedido_Venda.EdtCliente.Text+', ATRAVÉS DA SENHA DO ADMINISTRADOR '+login+'.' , TimeToStr(time), insercao, date);
    end
    else
    begin
    abort;
    end;
    end; }

end;

procedure TFrmPedido_Venda.Inicia_Transacao;
begin
  // SetUncommitted(FrmPedido_Venda.Conexao);
  // SetUncommitted(dm.ADOConnection1);
  FrmPedido_Venda.Conexao.BeginTrans;
end;

procedure TFrmPedido_Venda.Cria_Conexao;
begin
  try
    Conexao := TADOConnection.Create(self);
    Conexao := TPool.getInstance.getConnection;
    TTransacao.Create(Conexao);
    TTransacao.iniciarTransacao(Conexao);
    SetUncommitted(Conexao);
    Inicia_Query_Conexao(Conexao);

    { Conexao:= TADOConnection.Create(self);
      UGeral.Abre_Conexao(FrmPedido_Venda.Conexao);
      SetUncommitted(FrmPedido_Venda.Conexao);
      Inicia_Transacao;
      //SetUncommitted(dm.ADOConnection1);
      Inicia_Query_Conexao(FrmPedido_Venda.Conexao); }
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao abrir conexão com banco de dados. ' + E.Message);
      abort;
    end;
  end;
end;

procedure TFrmPedido_Venda.Inicializa_Venda;
begin
  if (iniciado = true) then
  begin
    Mensagem_Venda_Andamento;
    abort;
  end;

  // Cria_Conexao;
  Conexao := TConexao.NovaConexao(Conexao);
  TConexao.IniciaQuerys([qryitens_venda, qryitens_os, qrypedido_temporario,
    qAux, qAux2, qAux3], Conexao);

  if (gera_os = '0101') then
  begin
    Consulta.Chama_Status_OS(Conexao);
    Consulta.Chama_Funcionario_LookUp(Conexao);
    // Chama_Veiculo_Cliente(Conexao);
    Atualiza_Servicos(Conexao);
    // CmbVeiculo.KeyValue:= NULL;
    CmbStatus.KeyValue := NULL;
  end;

  oLSDominio := TListaSeparacaoLista.Create;
  Util.Habilita_Campos(FrmPedido_Venda);
  Util.Limpa_Campos(FrmPedido_Venda);
  BBtnOrcamento.Enabled := true;
  BBtnAnalisa_Venda.Enabled := false;
  BBtnVoltar_Pedido.Enabled := false;
  BBtnCancelar.Enabled := true;
  BBtnNovo.Enabled := false;
  BBtnExcluir.Enabled := false;
  pode_fechar := false;
  iniciado := true;
  Inicia_Itens;
  Habilita_DAV_PreVenda;
  RGTipoDesc.ItemIndex := tipo_desc_acr_padrao;
  EdtN_Pedido.SetFocus;

  EdtCodigo_Atendente.Text := IntToStr(codigo_usu);
  EdtAtendente.Text := usuario;

end;

procedure TFrmPedido_Venda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F2) then
  begin
    // Inicializa_Venda;
  end;

  if (Key = vk_f6) then
  begin
    if (EdtValor_Unitario.Text <> '') and (EdtValor_Unitario.Text <> '0') and
      (EdtValor_Unitario.Text <> '0,00') then
    begin
      Application.CreateForm(TFrmDesconto_PDV, FrmDesconto_PDV);
      FrmDesconto_PDV.ShowModal;
      FrmDesconto_PDV.Free;
    end;
  end;

  if (Key = vk_f4) then
  begin
    Application.CreateForm(TFrmEscolha_Tabela_Preco, FrmEscolha_Tabela_Preco);
    FrmEscolha_Tabela_Preco.ShowModal;
    FrmEscolha_Tabela_Preco.Free;
  end;

  if (Key = vk_escape) then
    Close;
end;

procedure TFrmPedido_Venda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0; // anula todas as teclas
    SelectNext(ActiveControl, true, true);
  end;

  { if (Char(ORD(Key)) = 'D') OR (Char(ORD(Key)) = 'd') then
    LbldOUa.Caption:= 'D'
    else if (Char(ORD(Key)) = 'A') or (Char(ORD(Key)) = 'a') then
    LbldOUa.Caption:= 'A';

    if (Char(ORD(Key)) = 'P') OR (Char(ORD(Key)) = 'p') then
    LblpOUr.Caption:= 'P'
    else if (Char(ORD(Key)) = 'R') or (Char(ORD(Key)) = 'r') then
    LblpOUr.Caption:= 'R'; }
end;

procedure TFrmPedido_Venda.Imprime_Comprovante_Entrega;
var
  i: integer;
  assinatura: AnsiString;
begin
  assinatura := '';
  i := 0;
  Cabecalho_Comprovante_Entrega;

  Atualiza_Dados(Conexao);
  qryitens_venda.First;

  while not qryitens_venda.Eof do
  begin
    rs.Write(linha, 0, qryitens_vendaCodigo_Venda.AsString);
    rs.Write(linha, 16, qryitens_vendaDescricao.AsString);
    rs.Write(linha, 70, qryitens_vendaUN.AsString);
    rs.Write(linha, 80, FormatFloat('#0.0,0', qryitens_vendaQtde.AsFloat));
    rs.Write(linha, 90, qryitens_vendaMarca.AsString);
    Inc(linha);

    if (linha = rs.Lines) then
    begin
      rs.NewPage;
      Cabecalho_Comprovante_Entrega;
    end;

    qryitens_venda.Next;
  end;

  i := 1;
  for i := 0 to i2 do
    rs.Write(linha + 1, i, '-');

  assinatura := '____________________________________________________________';

  if (linha <= rs.Lines - 5) then
  begin
    i := 1;
    rs.Write(linha + 3, Alinha_Centro(assinatura, i2), assinatura);
    rs.Write(linha + 5, Alinha_Centro(EdtCliente.Text, i2), EdtCliente.Text);
  end
  else
  begin
    rs.NewPage;
    linha := 1;
    i := 1;
    rs.Write(linha + 4, Alinha_Centro(assinatura, i2), assinatura);
    rs.Write(linha + 6, Alinha_Centro(EdtCliente.Text, i2), EdtCliente.Text);
  end;

  // SetDefaultPrinter('HP LaserJet M1005');
  rs.Print;
  rs.EndDoc;
end;

procedure TFrmPedido_Venda.Imprime_Lista_Separacao;
var
  i: integer;
  assinatura: AnsiString;
begin
  assinatura := '';
  i := 0;
  Cabecalho_Lista_Separacao;
  Atualiza_Dados_Separacao(Conexao);
  qAux_Separacao.First;

  while not qAux_Separacao.Eof do
  begin
    if (qAux_SeparacaoCancelado.AsString = 'N') then
    begin
      rs.Write(linha, 0, qAux_SeparacaoCodigo_Venda.AsString);
      rs.Write(linha, 16, qAux_SeparacaoDescricao.AsString);
      rs.Write(linha, 70, qAux_SeparacaoUN.AsString);
      rs.Write(linha, 80, FormatFloat('#0.0,0',
        qAux_SeparacaoQtde_Entregue.AsFloat));
      rs.Write(linha, 90, qAux_SeparacaoMarca.AsString);
      rs.Write(linha, 111, qAux_SeparacaoTipo_Entrega.AsString);
      Inc(linha);

      if (linha = rs.Lines) then
      begin
        rs.NewPage;
        Cabecalho_Lista_Separacao;
      end;

      qAux_Separacao.Next;
    end
    else
      qAux_Separacao.Next;
  end;

  i := 1;
  for i := 0 to i2 do
    rs.Write(linha + 1, i, '-');

  assinatura := '____________________________________________________________';

  if (linha <= rs.Lines - 5) then
  begin
    i := 1;
    rs.Write(linha + 3, Alinha_Centro(assinatura, i2), assinatura);
    rs.Write(linha + 5, Alinha_Centro(EdtCliente.Text, i2), EdtCliente.Text);
  end
  else
  begin
    rs.NewPage;
    linha := 1;
    i := 1;
    rs.Write(linha + 4, Alinha_Centro(assinatura, i2), assinatura);
    rs.Write(linha + 6, Alinha_Centro(EdtCliente.Text, i2), EdtCliente.Text);
  end;

  // SetDefaultPrinter('HP LaserJet M1005');
  rs.Print;
  rs.EndDoc;
end;

procedure TFrmPedido_Venda.Inicia_Text;
begin
  EdtCusto_Total.Text := '0,00';
  EdtVenda_Total.Text := '0,00';
  EdtPerc_Total.Text := '0,00';
end;

procedure TFrmPedido_Venda.Limpa_Menor;
begin
  EdtCodigo_Produto.Clear;
  EdtProduto.Clear;
  EdtUnidade.Clear;
  EdtQuantidade.Text := '1';
  EdtValor_Unitario.Clear;
  EdtValor_Tabela.Clear;
  EdtValor_Total.Clear;
  EdtST.Clear;
  EdtDesc_Acr.Text := FloatToStr(desconto_cliente);

  if (desconto_cliente <> 0) then
    RGTipoDesc.ItemIndex := 0
  else
    RGTipoDesc.ItemIndex := tipo_desc_acr_padrao;

  // RGTipoDesc.Visible:= false;

  LblProduto.Caption := '';
  LblTipo.Caption := '';
  UDeclaracao.credito_icms := '';
  LblNCM.Caption := '';

  Limpa_Tributos;
  // EdtCodigo_Produto.SetFocus;
end;

procedure TFrmPedido_Venda.MEdtData_EntregaEnter(Sender: TObject);
begin
  // if (achei = false) then
  // MEdtData_Entrega.Text:= DateToStr(date);
end;

procedure TFrmPedido_Venda.MEdtData_EntregaExit(Sender: TObject);
begin
  Verifica_Data(MEdtData_Venda);
end;

procedure TFrmPedido_Venda.MEdtData_Previsao_EntregaEnter(Sender: TObject);
begin
  // if (achei = false) then
  // MEdtData_Previsao_Entrega.Text:= DateToStr(date);
end;

procedure TFrmPedido_Venda.MEdtData_Previsao_EntregaExit(Sender: TObject);
begin
  Verifica_Data(MEdtData_Venda);
end;

procedure TFrmPedido_Venda.MEdtData_VencimentoEnter(Sender: TObject);
begin
  { if (MEdtData_Venda.Text <> '  /  /    ') and (achei = false) then
    begin
    MEdtData_Vencimento.Text:= DateToStr( IncDay( StrToDateTime(MEdtData_Venda.Text), dias_orcamento_vencido));
    end; }
end;

procedure TFrmPedido_Venda.MEdtData_VencimentoExit(Sender: TObject);
begin
  Verifica_Data(MEdtData_Venda);
end;

procedure TFrmPedido_Venda.MEdtData_VendaEnter(Sender: TObject);
begin
  // if (achei = false) then
  // MEdtData_Venda.Text:= DateToStr(date);

end;

procedure TFrmPedido_Venda.MEdtData_VendaExit(Sender: TObject);
begin
  Verifica_Data(MEdtData_Venda);
end;

procedure TFrmPedido_Venda.MEdtHora_VendaEnter(Sender: TObject);
begin
  // if (achei = false) then
  // MEdtHora_Venda.Text:= FormatDateTime('hh:mm', now);
end;

procedure TFrmPedido_Venda.Pega_Dados_Anteriores;
begin
  val_un_ant := qryitens_vendaValor_Unitario.AsFloat;
  qtde_ant := qryitens_vendaQtde.AsFloat;
  sub_total_ant := qryitens_vendaSub_Total.AsFloat;
  sub_total_ant_br := (qryitens_vendaQtde.AsFloat *
    qryitens_vendaValor_Unitario.AsFloat);
  bruto_ant := (qryitens_vendaQtde.AsFloat *
    qryitens_vendaValor_Original.AsFloat);
  tot_ant := qryitens_vendaDesc_Acr.AsFloat;
  des_p_ant := qryitens_vendaDesc_Acr_P.AsFloat;

  { if (qryitens_vendaDesc_Acr.AsFloat < 0) then
    desc_ant:= qryitens_vendaDesc_Acr.AsFloat
    else
    acr_ant:= qryitens_vendaDesc_Acr.AsFloat; }
end;

procedure TFrmPedido_Venda.Pega_Dados_Tabela_Preco(Codigo_Produto,
  Codigo_Tabela: integer; var Conexao: TADOConnection);
begin
  try
    qAux_Tabela := TADOQuery.Create(self);
    with qAux_Tabela, sql do
    begin
      Close;
      Connection := Conexao;
      Clear;
      add('select ITP.Percentual_Lucro_Vista, ITP.Percentual_Lucro_Prazo from Itens_Tabela_Preco ITP');
      add('where Codigo = :Codigo and Codigo_Produto = :Codigo_Produto');
      Parameters.ParamByName('Codigo').Value := Codigo_Tabela;
      Parameters.ParamByName('Codigo_Produto').Value := Codigo_Produto;
      open;
    end;
  finally

  end;
end;

procedure TFrmPedido_Venda.qryitens_osAfterPost(DataSet: TDataSet);
var
  qtde_servicos: integer;
begin
  // if (qryitens_os.State in [dsEdit, dsInsert]) then
  // begin
  Calcula_Total_Servico(sub_total_servico, Conexao, '+');

  // end;
end;

procedure TFrmPedido_Venda.qryitens_osBeforePost(DataSet: TDataSet);
begin
  ValidaCampos(qryitens_os, DBGrid3);

  { if (qryitens_osISS.AsString = '') then
    begin
    Application.MessageBox('Campo ISS não pode ser vazio', 'Campo vazio', MB_OK+MB_ICONHAND);
    DBGrid3.SelectedIndex:= 4;
    abort;
    end; }

  if (qryitens_os.State in [dsInsert]) then
  begin
    qtde_servicos := StrToInt(EdtQuantidade_Servicos.Text) + 1;
    EdtQuantidade_Servicos.Text := IntToStr(qtde_servicos);
  end;

  { if (qryitens_os.State in [dsEdit, dsInsert]) then
    begin
    Calcula_Total_Servico(StrToFloat(EdtTotal_Produtos.Text));
    end; }
end;

procedure TFrmPedido_Venda.qryitens_vendaAfterEdit(DataSet: TDataSet);
begin
  if (DBGrid1.SelectedIndex <> 3) and (DBGrid1.SelectedIndex <> 4) and
    (DBGrid1.SelectedIndex <> 5) and (DBGrid1.SelectedIndex <> 6) and
    (DBGrid1.SelectedIndex <> 7) and (DBGrid1.SelectedIndex <> 8) then
    altera := true;
end;

procedure TFrmPedido_Venda.qryitens_vendaAfterInsert(DataSet: TDataSet);
begin
  if (pressionou_insert) then
  begin
    qryitens_venda.Edit;
    qryitens_vendaCodigo.AsInteger := StrToInt(EdtCodigo.Text);
    qryitens_vendaCancelado.AsString := 'N';
    qryitens_venda.Post;
  end;
end;

procedure TFrmPedido_Venda.qryitens_vendaAfterScroll(DataSet: TDataSet);
begin
  Pega_Dados_Anteriores;
  if (pressionou_insert) then
  begin
    pressionou_insert := false;
    altera := true;
  end;
end;

procedure TFrmPedido_Venda.qryitens_vendaBeforeInsert(DataSet: TDataSet);
begin
  { if (qryitens_venda.Eof) then
    begin
    Exit;
    end; }
end;

procedure TFrmPedido_Venda.qryitens_vendaBeforeScroll(DataSet: TDataSet);
begin
  Altera_Preco_DBGrid;
end;

procedure TFrmPedido_Venda.qrypedido_temporarioAfterEdit(DataSet: TDataSet);
begin
  altera_analise := true;
end;

procedure TFrmPedido_Venda.qrypedido_temporarioAfterScroll(DataSet: TDataSet);
begin
  sub_total_ant := qrypedido_temporarioSub_Total.AsFloat;
  bruto_ant := (qrypedido_temporarioQuantidade.AsFloat *
    qrypedido_temporarioValor_Original.AsFloat);
end;

procedure TFrmPedido_Venda.qrypedido_temporarioBeforeScroll(DataSet: TDataSet);
begin
  Altera_Preco_DBGrid_Analise;
end;

procedure TFrmPedido_Venda.RGTipoDescClick(Sender: TObject);
begin
  // EdtDesc_Acr.SetFocus;
end;

procedure TFrmPedido_Venda.RGTipoDescExit(Sender: TObject);
begin
  // RGTipoDesc.Visible:= false;
end;

procedure TFrmPedido_Venda.SalvaBancoItensPedidoLog(N_Pedido, Codigo_Registro,
  Codigo_Produto: integer; dtAlteracao, hrAlteracao: TTime;
  tipo_alteracao: string; Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, sql do
    begin
      Close;
      Connection := Conexao;
      Clear;
      add('Insert into LogItensPedido(N_Pedido, Codigo_Registro, 	Codigo_Produto, ');
      add('dtAlteracao, hrAlteracao,	tipo_alteracao) values (:N_Pedido, :Codigo_Registro, :Codigo_Produto, :dtAlteracao,');
      add(':hrAlteracao, :tipo_alteracao)');
      Parameters.ParamByName('N_Pedido').Value := N_Pedido;
      Parameters.ParamByName('Codigo_Registro').Value := Codigo_Registro;
      Parameters.ParamByName('Codigo_Produto').Value := Codigo_Produto;
      Parameters.ParamByName('dtAlteracao').Value := dtAlteracao;
      Parameters.ParamByName('hrAlteracao').Value := hrAlteracao;
      Parameters.ParamByName('tipo_alteracao').Value := tipo_alteracao;

      ExecSQL;
    end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;

end;

procedure TFrmPedido_Venda.Altera_Forma_Pagamento(var Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, sql do
    begin
      Close;
      Connection := Conexao;
      Clear;
      add('UPDATE Pedido_Pagamento_DAV');
      add('   SET Codigo_Forma_Pagamento_Selecionada = :Codigo_Forma_Pagamento_Selecionada');
      add('      ,Codigo_Forma_Pagamento = :Codigo_Forma_Pagamento');
      add('      ,Forma_Pagamento = :Forma_Pagamento');
      add('      ,Qtde_Parcela = :Qtde_Parcela');
      add('      ,Prazo = :Prazo');
      add('      ,Tipo_Pagamento = :Tipo_Pagamento');
      add('      ,Taxa = :Taxa');
      add('where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value :=
        StrToInt(FrmPedido_Venda.EdtCodigo.Text);

      // Parameters.ParamByName('N_Pedido').Value:= FrmPedido_Venda.EdtN_Pedido.Text;
      Parameters.ParamByName('Codigo_Forma_Pagamento_Selecionada').Value :=
        forma_pagamento_selecionado;
      Parameters.ParamByName('Codigo_Forma_Pagamento').Value :=
        StrToInt(EdtCodigo_Forma_Pagamento.Text);
      Parameters.ParamByName('Forma_Pagamento').Value :=
        EdtForma_Pagamento.Text;
      Parameters.ParamByName('Qtde_Parcela').Value := qtde_parcela;
      Parameters.ParamByName('Prazo').Value := prazo;
      Parameters.ParamByName('Tipo_Pagamento').Value := tipo_pag;
      Parameters.ParamByName('Taxa').Value := taxa;
      ExecSQL;
    end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

procedure TFrmPedido_Venda.Altera_Pedido_Endereco_Cliente
  (var Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, sql do
    begin
      Close;
      Connection := Conexao;
      Clear;
      add('UPDATE Pedido_Endereco_Cliente');
      add('   SET Nome = :Nome');
      add('      ,CPF_CNPJ = :CPF_CNPJ');
      add('      ,Tipo_Endereco = :Tipo_Endereco');
      add('      ,Endereco = :Endereco');
      add('      ,Numero = :Numero');
      add('      ,Setor = :Setor');
      add('      ,Cidade = :Cidade');
      add('      ,UF = :UF');
      add('      ,Telefone = :Telefone');
      add('      ,CEP = :CEP');
      add('      ,Codigo_Municipio = :Codigo_Municipio');
      add('      ,Complemento = :Complemento');
      add('      ,Inscricao_Estadual = :Inscricao_Estadual');
      add('where Codigo = :Codigo');

      Parameters.ParamByName('Codigo').Value :=
        StrToInt(FrmPedido_Venda.EdtCodigo.Text);
      // Parameters.ParamByName('N_Pedido').Value:= FrmPedido_Venda.EdtN_Pedido.Text;
      Parameters.ParamByName('Nome').Value := EdtCliente.Text;
      Parameters.ParamByName('CPF_CNPJ').Value := LblCPF.Caption;
      Parameters.ParamByName('Tipo_Endereco').Value :=
        LblTipo_Logradouro.Caption;
      Parameters.ParamByName('Endereco').Value := LblEndereco.Caption;
      Parameters.ParamByName('Numero').Value := LblNumero.Caption;
      Parameters.ParamByName('Setor').Value := LblSetor.Caption;
      Parameters.ParamByName('Cidade').Value := LblCidade.Caption;
      Parameters.ParamByName('UF').Value := LblUF.Caption;
      Parameters.ParamByName('Telefone').Value := LblTelefone.Caption;
      Parameters.ParamByName('CEP').Value := LblCEP.Caption;
      Parameters.ParamByName('Codigo_Municipio').Value :=
        LblCodigo_Municipio.Caption;
      Parameters.ParamByName('Complemento').Value := LblComplemento.Caption;
      Parameters.ParamByName('Inscricao_Estadual').Value :=
        LblInscricao_Estadual.Caption;
      ExecSQL;
    end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

procedure TFrmPedido_Venda.Altera_Preco_DBGrid;
var
  ValorDesc, ValorTabela, PercDesconto, ValorUnitario, Qtde, ValorTotal,
    total_produtos, Total_Pedido, total_impostos, tot, total_desc_acr,
    total_Geral, Perc, pe_aux, pe, total_servico, desc: double;

  formata_desc, dOUa, icms, icms_nf, valor_icms, valor_icms_st,
    bc_icms: AnsiString;

begin
  if (altera) and (qryitens_vendaCancelado.AsString = 'N') then
  begin
    if (tipo_pag = 'A VISTA') then
      PercDesconto := qryitens_vendaPerc_Desc_Vista.AsFloat
    else
      PercDesconto := qryitens_vendaPerc_Desc_Prazo.AsFloat;

    // desc_acr_total:= StrToFloat(EdtDesc_Acr_Total.Text);

    // desc:= StrToFloat(EdtDesc_Acr.Text);
    // qtde:= StrToFloat(EdtQuantidade.Text);
                                                        
    if (DBGrid1.SelectedIndex = 11) then // qtde
    begin
      Qtde := qryitens_vendaQtde.AsFloat;
      // ValorTabela:= qryitens_vendaValor_Original.AsFloat;
      ValorDesc := qryitens_vendaDesc_Acr.AsFloat;
      ValorUnitario := qryitens_vendaValor_Unitario.AsFloat;
      ValorTotal := Calcula_Valor(FloatToStr((ValorUnitario * Qtde)));

      qryitens_venda.Edit;
      qryitens_vendaSub_Total.AsFloat := ValorTotal;

      desc_acr_total := Pega_Total_Desconto
        (StrToInt(FrmPedido_Venda.EdtCodigo.Text), Conexao);
      Util.FormataFloat(2, EdtDesc_Acr_Total, desc_acr_total);

      // calcula percentual da venda
      total_produtos := Pega_Total_Produto
        (StrToInt(FrmPedido_Venda.EdtCodigo.Text), Conexao);
      // StrToFloat(EdtTotal_Produtos.Text) + (bruto_ant - valor_tot); //+ ((qtde * qryitens_vendaValor_Original.AsFloat) - bruto_ant);
      Total_Pedido := Pega_Total_Pedido
        (StrToInt(FrmPedido_Venda.EdtCodigo.Text), Conexao);
      // StrToFloat(EdtTotal_Pedido.Text) + (valor_tot - sub_total_ant);

      des_p_aux_rodape := Total_Pedido - total_produtos;
      des_p_rodape := (des_p_aux_rodape / Total_Pedido);
      des_p_rodape := des_p_rodape * 100;
      des_p_rodape := Calcula_Valor(FloatToStr(des_p_rodape));

      if (des_p_rodape > 0) then
        des_p_rodape := des_p_rodape * -1
      else
        des_p_rodape := Abs(des_p_rodape);

      FTributacaoEntidade := TTributacaoEntidade.Create;
      FTributacaoDominio := TTributacaoDominio.Create(Conexao);
      FTributacaoEntidade := FTributacaoDominio.CalculaICMS(ValorTotal,
        qryitens_vendaBase_Reduzida.AsFloat, qryitens_vendaICMS.AsInteger, uf,
        LblUF.Caption);
      qryitens_vendaBC.AsFloat := FTributacaoEntidade.BaseCalculo;
      qryitens_vendaValor_ICMS.AsFloat := FTributacaoEntidade.ValorICMS;

      if (qryitens_vendaTipo_Recolhimento.AsString = 'ST') and
        (uf <> LblUF.Caption) then
      begin
        FTributacaoEntidade := FTributacaoDominio.CalculaICMSST
          (FTributacaoEntidade, qryitens_vendaNCM.AsString, uf, LblUF.Caption);
        qryitens_vendaBC_ST.AsFloat := FTributacaoEntidade.BaseCalculoST;
        qryitens_vendaValor_ICMS_ST.AsFloat := FTributacaoEntidade.ValorICMSST;
      end;

      qryitens_venda.Post;
    end
    else if (DBGrid1.SelectedIndex = 13) then // valor tabela
    begin
      Qtde := qryitens_vendaQtde.AsFloat;
      ValorTabela := qryitens_vendaValor_Original.AsFloat;
      ValorDesc := qryitens_vendaDesc_Acr.AsFloat;
      ValorUnitario := ValorTabela - ValorDesc;
      ValorTotal := Calcula_Valor(FloatToStr((ValorUnitario * Qtde)));

      qryitens_venda.Edit;
      qryitens_vendaValor_Unitario.AsFloat := ValorUnitario;
      qryitens_vendaSub_Total.AsFloat := ValorTotal;

      FTributacaoEntidade := TTributacaoEntidade.Create;
      FTributacaoDominio := TTributacaoDominio.Create(Conexao);
      FTributacaoEntidade := FTributacaoDominio.CalculaICMS(ValorTotal,
        qryitens_vendaBase_Reduzida.AsFloat, qryitens_vendaICMS.AsInteger, uf,
        LblUF.Caption);
      qryitens_vendaBC.AsFloat := FTributacaoEntidade.BaseCalculo;
      qryitens_vendaValor_ICMS.AsFloat := FTributacaoEntidade.ValorICMS;

      if (qryitens_vendaTipo_Recolhimento.AsString = 'ST') and
        (uf <> LblUF.Caption) then
      begin
        FTributacaoEntidade := FTributacaoDominio.CalculaICMSST
          (FTributacaoEntidade, qryitens_vendaNCM.AsString, uf, LblUF.Caption);
        qryitens_vendaBC_ST.AsFloat := FTributacaoEntidade.BaseCalculoST;
        qryitens_vendaValor_ICMS_ST.AsFloat := FTributacaoEntidade.ValorICMSST;
      end;

      qryitens_venda.Post;
    end
    else if (DBGrid1.SelectedIndex = 14) then // desconto
    begin
      Qtde := qryitens_vendaQtde.AsFloat;
      ValorTabela := qryitens_vendaValor_Original.AsFloat;
      ValorDesc := qryitens_vendaDesc_Acr.AsFloat;
      ValorUnitario := ValorTabela - ValorDesc;
      ValorTotal := Calcula_Valor(FloatToStr((ValorUnitario * Qtde)));

      // calcula o percentual do produto
      des_p_aux := ValorUnitario - ValorTabela;
      des_p := (des_p_aux / ValorUnitario);
      des_p := des_p * 100;
      des_p := Calcula_Valor(FloatToStr(des_p));

      if (des_p > 0) then
        des_p := des_p * -1
      else
        des_p := Abs(des_p);

      if ((des_p) > PercDesconto) then
      begin
        TMensagens.MensagemDescontoProduto(des_p);
        qryitens_venda.Edit;
        qryitens_vendaDesc_Acr.AsFloat := 0;
        qryitens_venda.Post;
        // Application.MessageBox(PChar('O desconto de '+ QuotedStr(FloatToStr(des_p)) +'% está acima do limite para este produto. Para corrigir, acesse o menu Cadastro > Tabela de Preço e altere o percentual de desconto do produto.'), 'Desconto não permitido', MB_OK+MB_ICONHAND);
        exit;
      end;

      // calcula percentual da venda
      total_produtos := Pega_Total_Produto
        (StrToInt(FrmPedido_Venda.EdtCodigo.Text), Conexao);
      // StrToFloat(EdtTotal_Produtos.Text) + (bruto_ant - valor_tot); //+ ((qtde * qryitens_vendaValor_Original.AsFloat) - bruto_ant);
      Total_Pedido := Pega_Total_Pedido
        (StrToInt(FrmPedido_Venda.EdtCodigo.Text), Conexao);
      // StrToFloat(EdtTotal_Pedido.Text) + (valor_tot - sub_total_ant);

      des_p_aux_rodape := Total_Pedido - total_produtos;
      des_p_rodape := (des_p_aux_rodape / Total_Pedido);
      des_p_rodape := des_p_rodape * 100;
      des_p_rodape := Calcula_Valor(FloatToStr(des_p_rodape));

      if (des_p_rodape > 0) then
        des_p_rodape := des_p_rodape * -1
      else
        des_p_rodape := Abs(des_p_rodape);

      if ((des_p_rodape) > limite_desc_ven) then
      begin
        qryitens_venda.Edit;
        qryitens_vendaDesc_Acr.AsFloat := 0;
        qryitens_venda.Post;
        TMensagens.MensagemDescontoFuncionario(des_p_rodape);
        // Application.MessageBox(PChar('O desconto de '+ QuotedStr(FloatToStr(des_p_rodape)) +'% está acima do limite para este vendedor. Para corrigir, acesse o menu Cadastro > Funcionários e altere o percentual de desconto do funcionário. Após este procedimento, reinicie o sistema para que seja carregado o novo desconto do funcionário.'), 'Desconto não permitido', MB_OK+MB_ICONHAND);
        exit;
      end;

      qryitens_venda.Edit;
      qryitens_vendaValor_Unitario.AsFloat := ValorUnitario;
      qryitens_vendaSub_Total.AsFloat := ValorTotal;

      FTributacaoEntidade := TTributacaoEntidade.Create;
      FTributacaoDominio := TTributacaoDominio.Create(Conexao);
      FTributacaoEntidade := FTributacaoDominio.CalculaICMS(ValorTotal,
        qryitens_vendaBase_Reduzida.AsFloat, qryitens_vendaICMS.AsInteger, uf,
        LblUF.Caption);
      qryitens_vendaBC.AsFloat := FTributacaoEntidade.BaseCalculo;
      qryitens_vendaValor_ICMS.AsFloat := FTributacaoEntidade.ValorICMS;

      if (qryitens_vendaTipo_Recolhimento.AsString = 'ST') and
        (uf <> LblUF.Caption) then
      begin
        FTributacaoEntidade := FTributacaoDominio.CalculaICMSST
          (FTributacaoEntidade, qryitens_vendaNCM.AsString, uf, LblUF.Caption);
        qryitens_vendaBC_ST.AsFloat := FTributacaoEntidade.BaseCalculoST;
        qryitens_vendaValor_ICMS_ST.AsFloat := FTributacaoEntidade.ValorICMSST;
      end;

      qryitens_venda.Post;
      desc_acr_total := Pega_Total_Desconto
        (StrToInt(FrmPedido_Venda.EdtCodigo.Text), Conexao);
      // desc_acr_total:= desc_acr_total + Abs(qtde * ValorDesc);
      Util.FormataFloat(2, EdtDesc_Acr_Total, desc_acr_total);

    end
    else if (DBGrid1.SelectedIndex = 15) then // valor unitário
    begin
      Qtde := qryitens_vendaQtde.AsFloat;
      ValorTabela := qryitens_vendaValor_Original.AsFloat;
      ValorUnitario := qryitens_vendaValor_Unitario.AsFloat;
      ValorDesc := ValorTabela - ValorUnitario;
      ValorTotal := Calcula_Valor(FloatToStr((ValorUnitario * Qtde)));

      // calcula o percentual do produto
      des_p_aux := ValorUnitario - ValorTabela;
      des_p := (des_p_aux / ValorUnitario);
      des_p := des_p * 100;
      des_p := Calcula_Valor(FloatToStr(des_p));

      if (des_p > 0) then
        des_p := des_p * -1
      else
        des_p := Abs(des_p);

      if ((des_p) > PercDesconto) then
      begin
        qryitens_venda.Edit;
        qryitens_vendaDesc_Acr.AsFloat := 0;
        qryitens_venda.Post;
        TMensagens.MensagemDescontoProduto(des_p);
        // Application.MessageBox(PChar('O desconto de '+ QuotedStr(FloatToStr(des_p)) +'%, está acima do limite para esse produto'), 'Desconto não permitido', MB_OK+MB_ICONHAND);
        exit;
      end;

      // calcula percentual da venda
      total_produtos := Pega_Total_Produto
        (StrToInt(FrmPedido_Venda.EdtCodigo.Text), Conexao);
      // StrToFloat(EdtTotal_Produtos.Text) + (bruto_ant - valor_tot); //+ ((qtde * qryitens_vendaValor_Original.AsFloat) - bruto_ant);
      Total_Pedido := Pega_Total_Pedido
        (StrToInt(FrmPedido_Venda.EdtCodigo.Text), Conexao);
      // StrToFloat(EdtTotal_Pedido.Text) + (valor_tot - sub_total_ant);

      des_p_aux_rodape := Total_Pedido - total_produtos;
      des_p_rodape := (des_p_aux_rodape / Total_Pedido);
      des_p_rodape := des_p_rodape * 100;
      des_p_rodape := Calcula_Valor(FloatToStr(des_p_rodape));

      if (des_p_rodape > 0) then
        des_p_rodape := des_p_rodape * -1
      else
        des_p_rodape := Abs(des_p_rodape);

      if ((des_p_rodape) > limite_desc_ven) then
      begin
        qryitens_venda.Edit;
        qryitens_vendaDesc_Acr.AsFloat := 0;
        qryitens_venda.Post;
        TMensagens.MensagemDescontoFuncionario(des_p_rodape);
        // Application.MessageBox(PChar('O desconto de '+ QuotedStr(FloatToStr(des_p_rodape)) +'%, está acima do limite para este vendedor.'), 'Desconto não permitido', MB_OK+MB_ICONHAND);
        exit;
      end;

      qryitens_venda.Edit;
      qryitens_vendaValor_Unitario.AsFloat := ValorUnitario;
      qryitens_vendaDesc_Acr.AsFloat := ValorDesc;
      qryitens_vendaSub_Total.AsFloat := ValorTotal;

      FTributacaoEntidade := TTributacaoEntidade.Create;
      FTributacaoDominio := TTributacaoDominio.Create(Conexao);
      FTributacaoEntidade := FTributacaoDominio.CalculaICMS(ValorTotal,
        qryitens_vendaBase_Reduzida.AsFloat, qryitens_vendaICMS.AsInteger, uf,
        LblUF.Caption);
      qryitens_vendaBC.AsFloat := FTributacaoEntidade.BaseCalculo;
      qryitens_vendaValor_ICMS.AsFloat := FTributacaoEntidade.ValorICMS;

      if (qryitens_vendaTipo_Recolhimento.AsString = 'ST') and
        (uf <> LblUF.Caption) then
      begin
        FTributacaoEntidade := FTributacaoDominio.CalculaICMSST
          (FTributacaoEntidade, qryitens_vendaNCM.AsString, uf, LblUF.Caption);
        qryitens_vendaBC_ST.AsFloat := FTributacaoEntidade.BaseCalculoST;
        qryitens_vendaValor_ICMS_ST.AsFloat := FTributacaoEntidade.ValorICMSST;
      end;

      qryitens_venda.Post;
      desc_acr_total := Pega_Total_Desconto
        (StrToInt(FrmPedido_Venda.EdtCodigo.Text), Conexao);
      // desc_acr_total:= desc_acr_total + Abs(qtde * ValorDesc);
      Util.FormataFloat(2, EdtDesc_Acr_Total, desc_acr_total);
    end;

    // qryitens_venda.Post;

    total_servico := StrToFloat(EdtTotal_Servicos.Text);

    desc := Abs(ValorDesc);
    qryitens_venda.Edit;
    Util.FormataFloat(2, EdtTotal_Desc_Acr, des_p_rodape);

    qryitens_vendaValor_Unitario.AsFloat := ValorUnitario;
    qryitens_vendaDesc_Acr_P.AsFloat := des_p;
    qryitens_vendaDesc_Acr.AsFloat := Calcula_Valor(FloatToStr(desc));
    qryitens_vendaSub_Total.AsFloat := ValorTotal;
    qryitens_venda.Post;

    total_produtos := Pega_Total_Produto
      (StrToInt(FrmPedido_Venda.EdtCodigo.Text), Conexao);
    // StrToFloat(EdtTotal_Produtos.Text) + (bruto_ant - valor_tot); //+ ((qtde * qryitens_vendaValor_Original.AsFloat) - bruto_ant);
    Total_Pedido := Pega_Total_Pedido(StrToInt(FrmPedido_Venda.EdtCodigo.Text),
      Conexao); // StrToFloat(EdtTotal_Pedido.Text) + (valor_tot - sub_total_ant);
    total_impostos := Pega_Total_Impostos(StrToInt(EdtCodigo.Text), Conexao);

    Util.FormataFloat(2, EdtTotal_Impostos, total_impostos);
    Util.FormataFloat(2, EdtTotal_Produtos, total_produtos);
    Util.FormataFloat(2, EdtTotal_Pedido, Total_Pedido + total_servico +
      total_impostos);

    Perc := (ValorUnitario - qryitens_vendaValor_Compra.AsFloat);
    Perc := (Perc / ValorUnitario);
    Perc := Perc * 100;
    Perc := Calcula_Valor(FloatToStr(Perc));



    if (DBGrid2.Visible = false) then
    begin
      if (qrypedido_temporario.Locate('Codigo; Codigo_Produto',
        VarArrayOf([StrToInt(EdtCodigo.Text),
        qryitens_vendaCodigo_Produto.AsInteger]), [])) then
      begin
        qrypedido_temporario.Edit;
        qrypedido_temporarioValor_Unitario.AsFloat := ValorUnitario;
        qrypedido_temporarioQuantidade.AsFloat := qryitens_vendaQtde.AsFloat;
        qrypedido_temporarioDesc_Acr.AsFloat :=
          Calcula_Valor(FloatToStr(Abs(desc)));
        qrypedido_temporarioSub_Total.AsFloat := ValorTotal;
        qrypedido_temporarioPercetual.AsFloat := Perc;
        qrypedido_temporario.Post;
        Atualiza_Pedido_Temporario(Conexao);




      end;
    end;
    // Atualiza_Pedido_Temporario(FrmPedido_Venda.Conexao);
    // Atualiza_Venda_Total;

    desc_ant := 0;
    acr_ant := 0;
    bruto_ant := 0;
    val_un_ant := 0;
    sub_total_ant := 0;

    altera := false;
    // pressionou_insert:= false;  }

      //  //  //  LOG ITENS PEDIDO // // //
      SalvaBancoItensPedidoLog(StrToInt(FrmPedido_Venda.EdtCodigo.Text),
      qryitens_vendaCodigo_Registro.AsInteger,
      qryitens_vendaCodigo_Produto.AsInteger,
      StrToDateTime(MEdtData_Venda.Text), hora, 'A', Conexao);
  end;
end;

procedure TFrmPedido_Venda.Verifica_Controla_Pedido;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      Close;
      Connection := dm.ADOConnection1;
      Clear;
      add('select P.N_Pedido from Pedido P');
      add('where N_Pedido = :Pedido');
      Parameters.ParamByName('Pedido').Value := numero_pedido;
      open;
    end;

    if (qAux.IsEmpty = true) then
    begin
      with qAux, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        add('Delete from Controla_Pedido');
        add('where N_Pedido = :Pedido');
        Parameters.ParamByName('Pedido').Value := numero_pedido;
        ExecSQL;
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmPedido_Venda.Verifica_Permissao;
begin
  if (LblTipo.Caption = '1') then
  begin
    Application.MessageBox('Não é permitido lançar serviços no DAV.',
      'Operação não permitida', MB_OK + MB_ICONHAND);
    Limpa_Menor;
    abort;
  end;
end;

procedure TFrmPedido_Venda.Verifica_Produto_Lancado;
begin
  if not qryitens_venda.IsEmpty then
  begin
    if (qryitens_venda.Locate('Codigo;Codigo_Produto;Cancelado',
      VarArrayOf([StrToInt(EdtCodigo.Text), StrToInt(LblProduto.Caption), 'N']
      ), [])) then
    begin
      // Produto_Ja_Lancamento_Venda;
      // if (Application.MessageBox('Produto já lançado. Deseja agrupa-los?', 'Produto encontrado nesta venda', MB_YESNO+MB_ICONHAND)) = idyes then
      Application.MessageBox
        ('Produto já lançado. Por favor, acrescente a nova quantidade desejada no campo Qtde.',
        'Produto encontrado nesta venda', MB_OK + MB_ICONHAND);
      abort;
      // begin
      { Atualiza_Produto_Encontrado(Conexao); //soma a quantidade desejada, com a quantidade que já tem
        Atualiza_Dados(Conexao); //atualiza o dbgrid

        if ( qryitens_venda.Locate('Codigo;Codigo_Produto', VarArrayOf([StrToInt(EdtCodigo.Text), StrToInt(LblProduto.Caption)]), [])) then//localiza o produto
        begin
        altera:= true;
        Altera_Preco_DBGrid;
        Atualiza_Dados(Conexao);
        Limpa_Menor;
        abort;
        end; }
      { end
        else
        begin
        Limpa_Menor;
        abort;
        end; }
    end;
  end;
end;

procedure TFrmPedido_Venda.Verifica_Tributacao;
begin
  if (icms = '') then
  begin
    Application.MessageBox('ICMS do produto não informado',
      'ICMS não informado', MB_OK + MB_ICONHAND);
    abort;
  end;

  if (EdtST.Text = '') then
  begin
    Application.MessageBox('ICMS do produto não informado',
      'ICMS não informado', MB_OK + MB_ICONHAND);
    EdtST.SetFocus;
    abort;
  end;

end;

procedure TFrmPedido_Venda.Ver_Pedido(var Conexao: TADOConnection);
var
  qAux3: TADOQuery;
begin
  EdtCodigo.Text := qAux.FieldByName('Codigo').AsString;
  EdtCodigo_Cliente.Text := qAux.FieldByName('Codigo_Cliente').AsString;
  LblInscricao_Estadual.Caption := qAux.FieldByName('Insc_Estadual').AsString;
  EdtCliente.Text := qAux.FieldByName('Nome_Nome_Fantasia').AsString;
  EdtCodigo_Atendente.Text := qAux.FieldByName('Codigo_Funcionario').AsString;
  EdtAtendente.Text := qAux.FieldByName('Usuario').AsString;
  // EdtCliente.Text:= qAux.FieldByName('Nome_Nome_Fantasia').AsString;
  limite_credito_cliente := qAux.FieldByName('Limite_Credito').AsFloat;
  credito_cliente := qAux.FieldByName('Credito').AsFloat;
  acima_limite_credito_cliente :=
    qAux.FieldByName('Acima_Limite_Credito').AsString;
  desconto_cliente := qAux.FieldByName('Limite_Desconto').AsFloat;
  EdtDesc_Acr.Text := FloatToStr(desconto_cliente);

  if (desconto_cliente <> 0) then
    RGTipoDesc.ItemIndex := 0
  else
    RGTipoDesc.ItemIndex := tipo_desc_acr_padrao;

  EdtCodigo_Forma_Pagamento.Text :=
    qAux.FieldByName('Codigo_Forma_Pag').AsString;
  EdtForma_Pagamento.Text := qAux.FieldByName('Cond_Pag').AsString;

  EdtCodigo_Atendente.Text := qAux.FieldByName('Codigo_Funcionario').AsString;
  EdtAtendente.Text := qAux.FieldByName('Usuario').AsString;

  MEdtData_Venda.Text := qAux.FieldByName('Data_Venda').AsString;
  MEdtHora_Venda.Text := qAux.FieldByName('Hora_Venda').AsString;
  MEdtData_Vencimento.Text := qAux.FieldByName('Data_Vencimento').AsString;

  if (qAux.FieldByName('Data_Previsao_Entrega').AsString <> '30/12/1899') then
    MEdtData_Previsao_Entrega.Text :=
      qAux.FieldByName('Data_Previsao_Entrega').AsString;

  if (qAux.FieldByName('Data_Entrega').AsString <> '30/12/1899') then
    MEdtData_Entrega.Text := qAux.FieldByName('Data_Entrega').AsString;

  MMOProblema.Text := qAux.FieldByName('Problema_Reclamado').AsString;
  EdtKilometragem.Text := qAux.FieldByName('Kilometragem').AsString;

  if (qAux.FieldByName('Tipo').AsString = 'DAV') or (qAux.FieldByName('Tipo').AsString = 'DAV-OS')then
    cbVendaOrcamento.Checked := true
  else
    cbVendaOrcamento.Checked := false;

  if (gera_pre_venda = '0101') and (gera_dav = '0101') then
    cbVendaOrcamento.Enabled := true
  else
    cbVendaOrcamento.Enabled := false;

  EdtKilometragem.Text := qAux.FieldByName('Kilometragem').AsString;

  Consulta.Chama_Status_OS(Conexao);
  // if (qAux.FieldByName('Status_OS').AsString <> '0') or (qAux.FieldByName('Status_OS').AsString <> '') then
  // begin
  CmbStatus.KeyValue := qAux.FieldByName('Status_OS').AsString;
  // end;

  if (gera_os = '0101') and (tipo_os = 0) then
  begin
    Chama_Veiculo_Cliente(Conexao);
    if (qAux.FieldByName('Codigo_Veiculo').AsInteger <> 0) then
    begin
      CmbVeiculo.KeyValue := qAux.FieldByName('Codigo_Veiculo').AsInteger;
      EdtVeiculo.Text := dm.qryveiculoVeiculo.AsString;
      EdtModelo.Text := dm.qryveiculoModelo.AsString;
    end;
  end;

  MmoObservacao.Text := qAux.FieldByName('Observacao').AsString;
  // MEdtHora_Entrega.Text:= qAux.FieldByName('Hora_Entrega').AsString;

  EdtQuantidade_Itens.Text := qAux.FieldByName('Qtde_Itens').AsString;
  EdtQuantidade_Servicos.Text := qAux.FieldByName('Qtde_Servicos').AsString;

  EdtTotal_Produtos.Text := FormatFloat('#0.0,0',
    qAux.FieldByName('Total_Produtos').AsFloat);
  EdtTotal_Produtos.Text := StringReplace(EdtTotal_Produtos.Text,
    ThousandSeparator, '', [rfReplaceAll]);

  EdtTotal_Servicos.Text := FormatFloat('#0.0,0',
    qAux.FieldByName('Total_Servicos').AsFloat);
  EdtTotal_Servicos.Text := StringReplace(EdtTotal_Servicos.Text,
    ThousandSeparator, '', [rfReplaceAll]);

  EdtTotal_Desc_Acr.Text := FormatFloat('#0.0,0',
    qAux.FieldByName('Total_Desc_Acr').AsFloat);
  EdtTotal_Desc_Acr.Text := StringReplace(EdtTotal_Desc_Acr.Text,
    ThousandSeparator, '', [rfReplaceAll]);

  EdtDesc_Acr_Total.Text := FormatFloat('#0.0,0',
    qAux.FieldByName('Desc_Acr').AsFloat);
  EdtDesc_Acr_Total.Text := StringReplace(EdtDesc_Acr_Total.Text,
    ThousandSeparator, '', [rfReplaceAll]);

  EdtTotal_Pedido.Text := FormatFloat('#0.0,0',
    qAux.FieldByName('Total_Pedido').AsFloat);
  EdtTotal_Pedido.Text := StringReplace(EdtTotal_Pedido.Text, ThousandSeparator,
    '', [rfReplaceAll]);

  EdtTotal_Impostos.Text := FormatFloat('#0.0,0',
    qAux.FieldByName('Total_Impostos').AsFloat);
  EdtTotal_Impostos.Text := StringReplace(EdtTotal_Impostos.Text,
    ThousandSeparator, '', [rfReplaceAll]);

  { if (qAux.FieldByName('Tipo_Desc_Acr').AsString = '%') then
    LblpOUr.Caption := 'P'
    else
    LblpOUr.Caption := 'R'; }

  { with qAux2, sql do
    begin
    close;
    clear;
    add('select Cli.*, Ci.Descricao, Ci.UF, Se.Descricao, L.Descricao, L.Tipo_Logradouro from Cliente Cli');
    add('left join Cidade Ci on (Cli.Codigo_Cidade = Ci.Codigo)');
    add('left join Setor Se on (Cli.Codigo_Setor = Se.Codigo)');
    add('left join Logradouro L on (Cli.Codigo_Logradouro = L.Codigo)');
    add('where Cli.Codigo = :Cliente');
    Parameters.ParamByName('Cliente').Value:= StrToInt(EdtCodigo_Cliente.Text);
    open;
    end; }

  with qAux2, sql do
  begin
    Close;
    Connection := Conexao;
    Clear;
    add('select PEC.* from Pedido_Endereco_Cliente PEC');
    add('where PEC.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
    open;
  end;

  FrmPedido_Venda.LblCPF.Caption := qAux2.FieldByName('CPF_CNPJ').AsString;
  FrmPedido_Venda.LblCidade.Caption := qAux2.FieldByName('Cidade').AsString;
  FrmPedido_Venda.LblSetor.Caption := qAux2.FieldByName('Setor').AsString;
  FrmPedido_Venda.LblEndereco.Caption := qAux2.FieldByName('Endereco').AsString;
  FrmPedido_Venda.LblTipo_Logradouro.Caption :=
    qAux2.FieldByName('Tipo_Endereco').AsString;
  FrmPedido_Venda.LblUF.Caption := qAux2.FieldByName('UF').AsString;
  FrmPedido_Venda.LblTelefone.Caption := qAux2.FieldByName('Telefone').AsString;
  FrmPedido_Venda.LblNumero.Caption := qAux2.FieldByName('Numero').AsString;

  FrmPedido_Venda.LblCEP.Caption := qAux2.FieldByName('CEP').AsString;
  FrmPedido_Venda.LblCodigo_Municipio.Caption :=
    qAux2.FieldByName('Codigo_Municipio').AsString;
  FrmPedido_Venda.LblComplemento.Caption :=
    qAux2.FieldByName('Complemento').AsString;

  try
    qAux3 := TADOQuery.Create(self);
    with qAux3, sql do
    begin
      Close;
      Connection := Conexao;
      Clear;
      add('select PPD.* from Pedido_Pagamento_DAV PPD');
      add('where PPD.Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
      open;
    end;

    forma_pagamento_selecionado :=
      qAux3.FieldByName('Codigo_Forma_Pagamento_Selecionada').AsInteger;
    EdtCodigo_Forma_Pagamento.Text :=
      qAux3.FieldByName('Codigo_Forma_Pagamento').AsString;
    EdtForma_Pagamento.Text := qAux3.FieldByName('Forma_Pagamento').AsString;
    qtde_parcela := qAux3.FieldByName('Qtde_Parcela').AsInteger;
    prazo := qAux3.FieldByName('Prazo').AsInteger;
    taxa := qAux3.FieldByName('Taxa').AsFloat;
    tipo_pag := qAux3.FieldByName('Tipo_Pagamento').AsString;

  finally
    FreeAndNil(qAux3);
  end;

  BBtnOrcamento.Enabled := true;
  BBtnConverter_Pre_Venda.Enabled := true;
  BBtnCopiar_DAV.Enabled := false;
  BBtnVoltar_Pedido.Enabled := false;
  BBtnAnalisa_Venda.Enabled := true;
end;

end.
