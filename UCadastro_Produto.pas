unit UCadastro_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids,
  DBGrids, UGeral, URegistro,
  ExtCtrls, Provider, DBClient, Buttons, ExtDlgs, jpeg, TLoggerUnit,
  Util.Configs;

type
  TFrmCadastro_Produto = class(TForm)
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
    LblCodigo_Produto: TLabel;
    Label36: TLabel;
    LblNome_Produto: TLabel;
    EdtDescricao: TEdit;
    EdtCodigo_Produto: TEdit;
    EdtCodigo_Original: TEdit;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    EdtFornecedor: TEdit;
    Label2: TLabel;
    EdtCodigo_Fornecedor: TEdit;
    Label1: TLabel;
    EdtCodigo_Fabricante: TEdit;
    Label3: TLabel;
    EdtMarca: TEdit;
    EdtCodigo_Marca: TEdit;
    Label4: TLabel;
    EdtUnidade: TEdit;
    EdtCodigo_Unidade: TEdit;
    Label5: TLabel;
    EdtUnidade_Volume: TEdit;
    EdtCodigo_Unidade_Volume: TEdit;
    EdtFabricante: TEdit;
    Label6: TLabel;
    EdtGrupo: TEdit;
    EdtCodigo_Grupo: TEdit;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    LblQtde_Maxima: TLabel;
    LblQtde_Minima: TLabel;
    EdtEstoque_Maximo: TEdit;
    EdtEstoque_Minimo: TEdit;
    LblQtde_Estoque: TLabel;
    EdtEstoque: TEdit;
    Label10: TLabel;
    EdtVolume: TEdit;
    Label11: TLabel;
    EdtVolume_Total: TEdit;
    GroupBox3: TGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    CmbEstoque_Minimo: TComboBox;
    CmbEstoque_Maximo: TComboBox;
    Label13: TLabel;
    EdtLocal: TEdit;
    EdtCodigo_Local: TEdit;
    GroupBox5: TGroupBox;
    CBAceita_Devolucao: TCheckBox;
    CBGera_Comissao: TCheckBox;
    CBAtivo: TCheckBox;
    CBTrun_Ar: TCheckBox;
    TabSheet4: TTabSheet;
    CBServico: TCheckBox;
    PageControl3: TPageControl;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    PageControl4: TPageControl;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    PageControl5: TPageControl;
    TabSheet15: TTabSheet;
    TabSheet16: TTabSheet;
    PageControl6: TPageControl;
    TabSheet19: TTabSheet;
    TabSheet20: TTabSheet;
    PageControl7: TPageControl;
    TabSheet23: TTabSheet;
    TabSheet24: TTabSheet;
    PageControl9: TPageControl;
    TabSheet30: TTabSheet;
    TabSheet31: TTabSheet;
    TabSheet32: TTabSheet;
    PageControl10: TPageControl;
    TabSheet33: TTabSheet;
    TabSheet34: TTabSheet;
    TabSheet35: TTabSheet;
    PageControl11: TPageControl;
    TabSheet36: TTabSheet;
    TabSheet37: TTabSheet;
    TabSheet38: TTabSheet;
    PageControl12: TPageControl;
    TabSheet39: TTabSheet;
    TabSheet40: TTabSheet;
    TabSheet41: TTabSheet;
    PageControl13: TPageControl;
    TabSheet42: TTabSheet;
    TabSheet43: TTabSheet;
    TabSheet44: TTabSheet;
    PageControl14: TPageControl;
    TabSheet45: TTabSheet;
    TabSheet46: TTabSheet;
    TabSheet47: TTabSheet;
    PageControl15: TPageControl;
    TabSheet48: TTabSheet;
    TabSheet49: TTabSheet;
    TabSheet50: TTabSheet;
    PageControl16: TPageControl;
    TabSheet51: TTabSheet;
    TabSheet52: TTabSheet;
    TabSheet53: TTabSheet;
    Label15: TLabel;
    EdtCodigo_Grupo_Tributacao_ISSQN: TEdit;
    EdtGrupo_Tributacao_ISSQN: TEdit;
    Label19: TLabel;
    EdtCodigo_Grupo_Tributacao: TEdit;
    EdtGrupo_Tributacao: TEdit;
    DBGrid2: TDBGrid;
    qryicms_ent_en: TADOQuery;
    DataSource1: TDataSource;
    qryicms_ent_epp: TADOQuery;
    DataSource2: TDataSource;
    qryicms_ent_enOrigem: TStringField;
    qryicms_ent_enDestino: TStringField;
    qryicms_ent_enDescricao_ICMS: TStringField;
    qryicms_ent_enAliquota_ICMS: TStringField;
    qryicms_ent_enTipo_Recolhimento_ICMS: TStringField;
    qryicms_ent_enBase_Reduzida_ICMS: TStringField;
    qryicms_ent_enPercentual_BC_Reduzida_ICMS: TStringField;
    qryicms_ent_enBase_Acrescida_ICMS: TStringField;
    qryicms_ent_enPercentual_BC_Acrescida_ICMS: TStringField;
    qryicms_ent_enCodigo_ST_ICMS: TStringField;
    qryicms_ent_enDescricao_ST_ICMS: TStringField;
    qryicms_ent_me: TADOQuery;
    DataSource3: TDataSource;
    qryicms_ent_meOrigem: TStringField;
    qryicms_ent_meDestino: TStringField;
    qryicms_ent_meDescricao_ICMS: TStringField;
    qryicms_ent_meAliquota_ICMS: TStringField;
    qryicms_ent_meTipo_Recolhimento_ICMS: TStringField;
    qryicms_ent_meBase_Reduzida_ICMS: TStringField;
    qryicms_ent_mePercentual_BC_Reduzida_ICMS: TStringField;
    qryicms_ent_meBase_Acrescida_ICMS: TStringField;
    qryicms_ent_mePercentual_BC_Acrescida_ICMS: TStringField;
    qryicms_ent_meCodigo_ST_ICMS: TStringField;
    qryicms_ent_meDescricao_ST_ICMS: TStringField;
    qryicms_sai_en: TADOQuery;
    DataSource4: TDataSource;
    qryicms_sai_enOrigem: TStringField;
    qryicms_sai_enDestino: TStringField;
    qryicms_sai_enDescricao_ICMS: TStringField;
    qryicms_sai_enAliquota_ICMS: TStringField;
    qryicms_sai_enTipo_Recolhimento_ICMS: TStringField;
    qryicms_sai_enBase_Reduzida_ICMS: TStringField;
    qryicms_sai_enPercentual_BC_Reduzida_ICMS: TStringField;
    qryicms_sai_enBase_Acrescida_ICMS: TStringField;
    qryicms_sai_enPercentual_BC_Acrescida_ICMS: TStringField;
    qryicms_sai_enCodigo_ST_ICMS: TStringField;
    qryicms_sai_enDescricao_ST_ICMS: TStringField;
    qryicms_sai_epp: TADOQuery;
    DataSource5: TDataSource;
    qryicms_sai_eppOrigem: TStringField;
    qryicms_sai_eppDestino: TStringField;
    qryicms_sai_eppDescricao_ICMS: TStringField;
    qryicms_sai_eppAliquota_ICMS: TStringField;
    qryicms_sai_eppTipo_Recolhimento_ICMS: TStringField;
    qryicms_sai_eppBase_Reduzida_ICMS: TStringField;
    qryicms_sai_eppPercentual_BC_Reduzida_ICMS: TStringField;
    qryicms_sai_eppBase_Acrescida_ICMS: TStringField;
    qryicms_sai_eppPercentual_BC_Acrescida_ICMS: TStringField;
    qryicms_sai_eppCodigo_ST_ICMS: TStringField;
    qryicms_sai_eppDescricao_ST_ICMS: TStringField;
    qryicms_sai_me: TADOQuery;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    DataSource6: TDataSource;
    qryicms_nc: TADOQuery;
    StringField27: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    StringField34: TStringField;
    StringField35: TStringField;
    StringField36: TStringField;
    StringField37: TStringField;
    DataSource7: TDataSource;
    qryicms_ent_eppOrigem: TStringField;
    qryicms_ent_eppDestino: TStringField;
    qryicms_ent_eppDescricao_ICMS: TStringField;
    qryicms_ent_eppAliquota_ICMS: TStringField;
    qryicms_ent_eppTipo_Recolhimento_ICMS: TStringField;
    qryicms_ent_eppBase_Reduzida_ICMS: TStringField;
    qryicms_ent_eppPercentual_BC_Reduzida_ICMS: TStringField;
    qryicms_ent_eppBase_Acrescida_ICMS: TStringField;
    qryicms_ent_eppPercentual_BC_Acrescida_ICMS: TStringField;
    qryicms_ent_eppCodigo_ST_ICMS: TStringField;
    qryicms_ent_eppDescricao_ST_ICMS: TStringField;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    DBGrid6: TDBGrid;
    DBGrid7: TDBGrid;
    DBGrid8: TDBGrid;
    Label16: TLabel;
    EdtCodigo_Grupo_Tributacao_IPI: TEdit;
    EdtGrupo_Tributacao_IPI: TEdit;
    qryipi_ent_en: TADOQuery;
    DataSource8: TDataSource;
    DBGrid9: TDBGrid;
    qryipi_ent_enDescricao_IPI: TStringField;
    qryipi_ent_enAliquota_IPI: TStringField;
    qryipi_ent_enTipo_Recolhimento_IPI: TStringField;
    qryipi_ent_enBase_Reduzida_IPI: TStringField;
    qryipi_ent_enPercentual_BC_Reduzida_IPI: TStringField;
    qryipi_ent_enBase_Acrescida_IPI: TStringField;
    qryipi_ent_enPercentual_BC_Acrescida_IPI: TStringField;
    qryipi_ent_enCodigo_ST_IPI: TStringField;
    qryipi_ent_enDescricao_ST_IPI: TStringField;
    qryipi_ent_epp: TADOQuery;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    DataSource9: TDataSource;
    DBGrid10: TDBGrid;
    DBGrid11: TDBGrid;
    qryipi_ent_me: TADOQuery;
    StringField42: TStringField;
    StringField43: TStringField;
    StringField46: TStringField;
    StringField47: TStringField;
    StringField48: TStringField;
    StringField49: TStringField;
    StringField50: TStringField;
    StringField51: TStringField;
    StringField52: TStringField;
    DataSource10: TDataSource;
    qryipi_sai_en: TADOQuery;
    StringField55: TStringField;
    StringField56: TStringField;
    StringField59: TStringField;
    StringField60: TStringField;
    StringField61: TStringField;
    StringField62: TStringField;
    StringField63: TStringField;
    StringField64: TStringField;
    StringField65: TStringField;
    DataSource11: TDataSource;
    DBGrid12: TDBGrid;
    qryipi_sai_epp: TADOQuery;
    StringField68: TStringField;
    StringField69: TStringField;
    StringField72: TStringField;
    StringField73: TStringField;
    StringField74: TStringField;
    StringField75: TStringField;
    StringField76: TStringField;
    StringField77: TStringField;
    StringField78: TStringField;
    DataSource12: TDataSource;
    DBGrid13: TDBGrid;
    DBGrid14: TDBGrid;
    qryipi_sai_me: TADOQuery;
    StringField81: TStringField;
    StringField82: TStringField;
    StringField85: TStringField;
    StringField86: TStringField;
    StringField87: TStringField;
    StringField88: TStringField;
    StringField89: TStringField;
    StringField90: TStringField;
    StringField91: TStringField;
    DataSource13: TDataSource;
    Label24: TLabel;
    EdtCodigo_Grupo_Tributacao_PIS: TEdit;
    EdtGrupo_Tributacao_PIS: TEdit;
    DBGrid16: TDBGrid;
    qrypis_ent_en: TADOQuery;
    DataSource15: TDataSource;
    qrypis_ent_enDescricao_PIS: TStringField;
    qrypis_ent_enAliquota_PIS: TStringField;
    qrypis_ent_enTipo_Recolhimento_PIS: TStringField;
    qrypis_ent_enBase_Reduzida_PIS: TStringField;
    qrypis_ent_enPercentual_BC_Reduzida_PIS: TStringField;
    qrypis_ent_enBase_Acrescida_PIS: TStringField;
    qrypis_ent_enPercentual_BC_Acrescida_PIS: TStringField;
    qrypis_ent_enCodigo_ST_PIS: TStringField;
    qrypis_ent_enDescricao_ST_PIS: TStringField;
    DBGrid17: TDBGrid;
    qrypis_ent_epp: TADOQuery;
    StringField107: TStringField;
    StringField108: TStringField;
    StringField109: TStringField;
    StringField110: TStringField;
    StringField111: TStringField;
    StringField112: TStringField;
    StringField113: TStringField;
    StringField114: TStringField;
    StringField115: TStringField;
    DataSource16: TDataSource;
    DBGrid18: TDBGrid;
    qrypis_ent_me: TADOQuery;
    StringField118: TStringField;
    StringField119: TStringField;
    StringField120: TStringField;
    StringField121: TStringField;
    StringField122: TStringField;
    StringField123: TStringField;
    StringField124: TStringField;
    StringField125: TStringField;
    StringField126: TStringField;
    DataSource17: TDataSource;
    DBGrid19: TDBGrid;
    qrypis_sai_en: TADOQuery;
    StringField129: TStringField;
    StringField130: TStringField;
    StringField131: TStringField;
    StringField132: TStringField;
    StringField133: TStringField;
    StringField134: TStringField;
    StringField135: TStringField;
    StringField136: TStringField;
    StringField137: TStringField;
    DataSource18: TDataSource;
    DBGrid20: TDBGrid;
    qrypis_sai_epp: TADOQuery;
    StringField140: TStringField;
    StringField141: TStringField;
    StringField142: TStringField;
    StringField143: TStringField;
    StringField144: TStringField;
    StringField145: TStringField;
    StringField146: TStringField;
    StringField147: TStringField;
    StringField148: TStringField;
    DataSource19: TDataSource;
    DBGrid21: TDBGrid;
    qrypis_sai_me: TADOQuery;
    StringField151: TStringField;
    StringField152: TStringField;
    StringField153: TStringField;
    StringField154: TStringField;
    StringField155: TStringField;
    StringField156: TStringField;
    StringField157: TStringField;
    StringField158: TStringField;
    StringField159: TStringField;
    DataSource20: TDataSource;
    Label25: TLabel;
    EdtCodigo_Grupo_Tributacao_COFINS: TEdit;
    EdtGrupo_Tributacao_COFINS: TEdit;
    DBGrid23: TDBGrid;
    qrycofins_ent_en: TADOQuery;
    DataSource22: TDataSource;
    qrycofins_ent_enDescricao_COFINS: TStringField;
    qrycofins_ent_enAliquota_COFINS: TStringField;
    qrycofins_ent_enTipo_Recolhimento_COFINS: TStringField;
    qrycofins_ent_enBase_Reduzida_COFINS: TStringField;
    qrycofins_ent_enPercentual_BC_Reduzida_COFINS: TStringField;
    qrycofins_ent_enBase_Acrescida_COFINS: TStringField;
    qrycofins_ent_enPercentual_BC_Acrescida_COFINS: TStringField;
    qrycofins_ent_enCodigo_ST_COFINS: TStringField;
    qrycofins_ent_enDescricao_ST_COFINS: TStringField;
    DBGrid24: TDBGrid;
    qrycofins_ent_epp: TADOQuery;
    StringField173: TStringField;
    StringField174: TStringField;
    StringField175: TStringField;
    StringField176: TStringField;
    StringField177: TStringField;
    StringField178: TStringField;
    StringField179: TStringField;
    StringField180: TStringField;
    StringField181: TStringField;
    DataSource23: TDataSource;
    DBGrid25: TDBGrid;
    qrycofins_ent_me: TADOQuery;
    StringField184: TStringField;
    StringField185: TStringField;
    StringField186: TStringField;
    StringField187: TStringField;
    StringField188: TStringField;
    StringField189: TStringField;
    StringField190: TStringField;
    StringField191: TStringField;
    StringField192: TStringField;
    DataSource24: TDataSource;
    DBGrid26: TDBGrid;
    qrycofins_sai_en: TADOQuery;
    StringField195: TStringField;
    StringField196: TStringField;
    StringField197: TStringField;
    StringField198: TStringField;
    StringField199: TStringField;
    StringField200: TStringField;
    StringField201: TStringField;
    StringField202: TStringField;
    StringField203: TStringField;
    DataSource25: TDataSource;
    DBGrid27: TDBGrid;
    qrycofins_sai_epp: TADOQuery;
    StringField206: TStringField;
    StringField207: TStringField;
    StringField208: TStringField;
    StringField209: TStringField;
    StringField210: TStringField;
    StringField211: TStringField;
    StringField212: TStringField;
    StringField213: TStringField;
    StringField214: TStringField;
    DataSource26: TDataSource;
    DBGrid28: TDBGrid;
    qrycofins_sai_me: TADOQuery;
    StringField217: TStringField;
    StringField218: TStringField;
    StringField219: TStringField;
    StringField220: TStringField;
    StringField221: TStringField;
    StringField222: TStringField;
    StringField223: TStringField;
    StringField224: TStringField;
    StringField225: TStringField;
    DataSource27: TDataSource;
    DBGrid30: TDBGrid;
    qryregra_issqn: TADOQuery;
    DataSource29: TDataSource;
    qryregra_issqnCodigo: TAutoIncField;
    qryregra_issqnData_Cadastro: TDateTimeField;
    qryregra_issqnDescricao: TStringField;
    qryregra_issqnAliquota: TStringField;
    qryregra_issqnTributacao: TStringField;
    qryregra_issqnBase_Reduzida: TStringField;
    qryregra_issqnPercentual_BC_Reduzida: TStringField;
    qryregra_issqnBase_Acrescida: TStringField;
    qryregra_issqnPercentual_BC_Acrescida: TStringField;
    GroupBox4: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    MEdtData_Validade: TMaskEdit;
    MEdtData_Fabricacao: TMaskEdit;
    MEdtUltima_Compra: TMaskEdit;
    MEdtUltima_Venda: TMaskEdit;
    MEdtData_Atualizacao_Estoque: TMaskEdit;
    qrypreco: TADOQuery;
    DataSource30: TDataSource;
    CBProducao_Propria: TCheckBox;
    qryprecoCodigo: TIntegerField;
    qryprecoCodigo_Empresa: TIntegerField;
    qryprecoDescricao: TStringField;
    qryprecoData_Cadastro: TDateTimeField;
    qryprecoData_Validade: TDateTimeField;
    qryprecoTipo: TStringField;
    qryprecoCodigo_1: TIntegerField;
    qryprecoCodigo_Produto: TIntegerField;
    qryprecoPreco_Vista: TFloatField;
    qryprecoPreco_Prazo: TFloatField;
    qryprecoPercentual_Desconto_Vista: TFloatField;
    qryprecoPercentual_Desconto_Prazo: TFloatField;
    qryprecoCodigo_Registro: TAutoIncField;
    qryprecoPercentual_Lucro_Vista: TFloatField;
    qryprecoPercentual_Lucro_Prazo: TFloatField;
    Label18: TLabel;
    EdtEstoque_Reservado: TEdit;
    TabSheet13: TTabSheet;
    DBGrid15: TDBGrid;
    qrypreco_fornecedor: TADOQuery;
    DataSource14: TDataSource;
    qrypreco_fornecedorNome_Fantasia: TStringField;
    qrypreco_fornecedorValor_Unitario: TFloatField;
    qrypreco_fornecedorCusto_Unitario: TFloatField;
    qrypreco_fornecedorData_Entrada: TDateTimeField;
    TabSheet14: TTabSheet;
    PageControl8: TPageControl;
    TabSheet17: TTabSheet;
    TabSheet18: TTabSheet;
    TabSheet21: TTabSheet;
    Img1: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    SpeedButton3: TSpeedButton;
    Img2: TImage;
    SpeedButton1: TSpeedButton;
    Img3: TImage;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    qrypreco_fornecedorValor_Vista: TFloatField;
    qrypreco_fornecedorValor_Prazo: TFloatField;
    MMOAplicacao: TMemo;
    Image1: TImage;
    BBtnCopiar_Produto: TToolButton;
    TabSheet22: TTabSheet;
    Label26: TLabel;
    MEdtData_Inicial: TMaskEdit;
    MEdtData_Final: TMaskEdit;
    Label27: TLabel;
    DBGrid1: TDBGrid;
    qryhistorico_produto: TADOQuery;
    DataSource21: TDataSource;
    qryhistorico_produtoValor_Unitario: TFloatField;
    qryhistorico_produtoQtde: TFloatField;
    qryhistorico_produtoSub_Total: TFloatField;
    qryhistorico_produtoData_Venda: TDateTimeField;
    qryhistorico_produtoN_Pedido: TStringField;
    qryhistorico_produtoNome_Nome_Fantasia: TStringField;
    Label28: TLabel;
    EdtValor_Total_Historico: TEdit;
    qryhistorico_produtoTotal_Geral: TFloatField;
    TabSheet25: TTabSheet;
    DBGrid22: TDBGrid;
    qrycodigo_fornecedor: TADOQuery;
    DataSource28: TDataSource;
    qrycodigo_fornecedorCodigo_Produto_Fornecedor: TStringField;
    qrycodigo_fornecedorNome_Fantasia: TStringField;
    Label22: TLabel;
    EdtCodigo_Similar: TEdit;
    GroupBox7: TGroupBox;
    LblValor_Compra: TLabel;
    Label23: TLabel;
    EdtValor_Compra: TEdit;
    EdtValor_Compra_Unitario: TEdit;
    GroupBox8: TGroupBox;
    Label32: TLabel;
    Label29: TLabel;
    EdtValor_Ultima_Compra: TEdit;
    EdtValor_Ultima_Compra_Unitario: TEdit;
    TabSheet26: TTabSheet;
    DBGrid29: TDBGrid;
    qryhistorico_movimentacao: TADOQuery;
    DataSource31: TDataSource;
    qryhistorico_movimentacaoCodigo: TIntegerField;
    qryhistorico_movimentacaoDescricao: TStringField;
    qryhistorico_movimentacaoQuantidade: TFloatField;
    qryhistorico_movimentacaoQtde_Estoque_Atual: TFloatField;
    qryhistorico_movimentacaoData: TDateTimeField;
    qryhistorico_movimentacaoTipo: TStringField;
    qryhistorico_movimentacaoNome: TStringField;
    qryhistorico_movimentacaoCliForn: TStringField;
    qryhistorico_movimentacaoCodigo_Reg: TIntegerField;
    qryhistorico_movimentacaoQtd: TFloatField;
    Label12: TLabel;
    EdtNCM: TEdit;
    GroupBox9: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    EdtPreco_Prazo: TEdit;
    EdtPreco_Vista: TEdit;
    BBtnNovo: TToolButton;
    Label33: TLabel;
    EdtPercentual_Desconto_Vista: TEdit;
    Label37: TLabel;
    EdtPercentual_Desconto_Prazo: TEdit;
    Label38: TLabel;
    EdtPercentual_Lucro_Vista: TEdit;
    Label39: TLabel;
    EdtPercentual_Lucro_Prazo: TEdit;
    Label17: TLabel;
    EdtValor_Medio: TEdit;
    EdtSaldo_Estoque: TEdit;
    Label7: TLabel;
    Label40: TLabel;
    EdtPercentual_Comissao_Vista: TEdit;
    Label41: TLabel;
    EdtPercentual_Comissao_Prazo: TEdit;
    dbgrd1: TDBGrid;
    qrylocal: TADOQuery;
    ds1: TDataSource;
    ADOCodigo: TAutoIncField;
    qrylocalLocal: TStringField;
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
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtValor_CompraExit(Sender: TObject);
    procedure EdtValor_MedioExit(Sender: TObject);
    procedure EdtValor_Ultima_CompraExit(Sender: TObject);
    procedure EdtEstoque_MaximoExit(Sender: TObject);
    procedure EdtEstoque_MinimoExit(Sender: TObject);
    procedure EdtEstoqueExit(Sender: TObject);
    procedure EdtVolumeExit(Sender: TObject);
    procedure EdtVolume_TotalExit(Sender: TObject);
    procedure Habilita_Check;
    procedure EdtCodigo_FornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_FabricanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_MarcaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_UnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Unidade_VolumeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_GrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtVolume_TotalEnter(Sender: TObject);
    procedure MEdtData_FabricacaoExit(Sender: TObject);
    procedure MEdtData_ValidadeExit(Sender: TObject);
    procedure MEdtUltima_CompraExit(Sender: TObject);
    procedure MEdtUltima_VendaExit(Sender: TObject);
    procedure EdtImpostosEnter(Sender: TObject);
    procedure EdtCodigo_Situacao_TributariaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Grupo_Tributacao_IPIKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtICMSKeyPress(Sender: TObject; var Key: Char);
    procedure EdtIPIKeyPress(Sender: TObject; var Key: Char);
    procedure EdtISSKeyPress(Sender: TObject; var Key: Char);
    procedure EdtEstoque_MaximoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtEstoque_MinimoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtEstoqueKeyPress(Sender: TObject; var Key: Char);
    procedure EdtVolumeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtVolume_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_CompraKeyPress(Sender: TObject; var Key: Char);
    procedure EdtImpostosKeyPress(Sender: TObject; var Key: Char);
    procedure EdtMargem_LucroKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAcrecimoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_VendaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_MedioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_Ultima_CompraKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Grupo_TributacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Grupo_Tributacao_ISSQNKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_FornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtFornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_FabricanteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtFabricanteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_MarcaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtMarcaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_UnidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtUnidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Unidade_VolumeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtUnidade_VolumeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_GrupoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtGrupoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_LocalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtLocalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Grupo_TributacaoKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtGrupo_TributacaoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Grupo_Tributacao_IPIKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtGrupo_Tributacao_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure EdtGrupo_Tributacao_PISKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Grupo_Tributacao_PISKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtCodigo_Grupo_Tributacao_COFINSKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtGrupo_Tributacao_COFINSKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtCodigo_Grupo_Tributacao_ISSQNKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtGrupo_Tributacao_ISSQNKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid6DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid7DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid8DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid9DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid10DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid11DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid12DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid13DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid14DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid15DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid16DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid17DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid18DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid19DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid20DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid21DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid22DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid23DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid24DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid25DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid26DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid27DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid28DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid29DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid30DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_Grupo_Tributacao_PISKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Grupo_Tributacao_COFINSKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtSaldo_EstoqueEnter(Sender: TObject);
    procedure EdtCodigo_LocalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DataSetProvider1GetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: WideString);
    procedure EdtEstoque_ReservadoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtEstoque_ReservadoExit(Sender: TObject);
    procedure EdtCodigo_OriginalChange(Sender: TObject);
    procedure EdtCodigo_OriginalExit(Sender: TObject);
    procedure EdtCodigo_ProdutoChange(Sender: TObject);
    procedure EdtCodigo_ProdutoExit(Sender: TObject);
    procedure EdtCodigo_FornecedorDblClick(Sender: TObject);
    procedure EdtCodigo_FabricanteDblClick(Sender: TObject);
    procedure EdtCodigo_MarcaDblClick(Sender: TObject);
    procedure EdtCodigo_UnidadeDblClick(Sender: TObject);
    procedure EdtCodigo_Unidade_VolumeDblClick(Sender: TObject);
    procedure EdtCodigo_GrupoDblClick(Sender: TObject);
    procedure EdtCodigo_LocalDblClick(Sender: TObject);
    procedure EdtCodigo_Grupo_Tributacao_IPIDblClick(Sender: TObject);
    procedure EdtCodigo_Grupo_TributacaoDblClick(Sender: TObject);
    procedure EdtCodigo_Grupo_Tributacao_PISDblClick(Sender: TObject);
    procedure EdtCodigo_Grupo_Tributacao_COFINSDblClick(Sender: TObject);
    procedure EdtCodigo_Grupo_Tributacao_ISSQNDblClick(Sender: TObject);
    procedure EdtCodigo_UnidadeExit(Sender: TObject);
    procedure EdtCodigo_Unidade_VolumeExit(Sender: TObject);
    procedure EdtCodigo_GrupoExit(Sender: TObject);
    procedure EdtCodigo_FornecedorExit(Sender: TObject);
    procedure EdtCodigo_MarcaExit(Sender: TObject);
    procedure EdtCodigo_LocalExit(Sender: TObject);
    procedure EdtCodigo_Grupo_TributacaoExit(Sender: TObject);
    procedure EdtCodigo_Grupo_Tributacao_IPIExit(Sender: TObject);
    procedure EdtCodigo_Grupo_Tributacao_PISExit(Sender: TObject);
    procedure EdtCodigo_Grupo_Tributacao_COFINSExit(Sender: TObject);
    procedure EdtCodigo_Grupo_Tributacao_ISSQNExit(Sender: TObject);
    procedure EdtCodigo_FabricanteExit(Sender: TObject);
    procedure EdtDescricaoExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure BBtnCopiar_ProdutoClick(Sender: TObject);
    procedure MEdtData_InicialExit(Sender: TObject);
    procedure MEdtData_FinalExit(Sender: TObject);
    procedure MEdtData_InicialEnter(Sender: TObject);
    procedure MEdtData_FinalEnter(Sender: TObject);
    procedure EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_Compra_UnitarioExit(Sender: TObject);
    procedure EdtValor_Compra_UnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSaldo_EstoqueExit(Sender: TObject);
    procedure EdtValor_Ultima_Compra_UnitarioExit(Sender: TObject);
    procedure EdtPreco_VistaEnter(Sender: TObject);
    procedure EdtPreco_VistaExit(Sender: TObject);
    procedure EdtPreco_PrazoExit(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
    procedure BBtnNovoClick(Sender: TObject);
    procedure EdtPreco_PrazoEnter(Sender: TObject);
    procedure EdtPercentual_Desconto_VistaExit(Sender: TObject);
    procedure EdtPercentual_Desconto_PrazoExit(Sender: TObject);
    procedure EdtPercentual_Comissao_VistaExit(Sender: TObject);
    procedure EdtPercentual_Comissao_PrazoExit(Sender: TObject);
    procedure EdtPercentual_Lucro_VistaExit(Sender: TObject);
    procedure EdtPercentual_Lucro_PrazoExit(Sender: TObject);
    procedure EdtLocalChange(Sender: TObject);
    procedure EdtLocalEnter(Sender: TObject);
    procedure dbgrd1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_FornecedorEnter(Sender: TObject);
    procedure dbgrd1DblClick(Sender: TObject);
    procedure EdtLocalExit(Sender: TObject);
    procedure TlbFerramentasClick(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure EdtCodigo_LocalClick(Sender: TObject);
    procedure EdtCodigo_LocalEnter(Sender: TObject);
    procedure EdtCodigo_LocalChange(Sender: TObject);
  private
    Produto: URegistro.TProduto;
    CTP: URegistro.TCadastro_Tabela_Preco;
    Util: TUtil;
    iniciado, achou_local: Boolean;
    cod_local, descLocal: string;
    nome_imagem1, nome_imagem2, nome_imagem3: AnsiString;

    procedure Inicia_Pages;
    procedure Verifica_Tributacao;
    procedure Gera_Codigo;
    procedure Verifica_Descricao_Produto_Cadastrado;
    procedure Verifica_Codigo_Produto_Cadastrado;
    procedure Insere_Preco_Tabela;
    procedure Altera_Preco_Tabela;
    procedure Renomeia_Imagens;
    procedure Limpa_Nome_Imagem;
    procedure Pega_Historico_Produto;
    procedure Verifica_Codigo_Venda;
    procedure Calcula_Preco_Vista;
    procedure Calcula_Preco_Prazo;
    procedure Pega_Percentual_Tabela_Preco;
    procedure Grava_Local;
  public
    ativo, unidade, unidade_volume, achei, libera_exclusao,
      copiar_prod: Boolean;
    p_vista, p_prazo, p_des_vista, p_des_prazo, p_vista_T, p_prazo_T,
      p_des_vista_T, p_des_prazo_T, qtde_est: double;
    procedure Pega_Preco_Tabela;
    procedure Chama_Imagens;
    procedure Atualiza_Preco_Fornecedor;
    procedure Atualiza_Codigo_Fornecedor;
    procedure Copia_Produto(Produto: Integer);
    procedure Copia_Produto_Tabela(Produto: Integer);
    procedure Atualiza_Historico_Movimentacao;
  protected
    function Confira: Boolean; virtual;
  end;

var
  FrmCadastro_Produto: TFrmCadastro_Produto;

implementation

uses UDM, UChama_Fornecedor, UChama_Grupo_Produto, UChama_Marca, UChama_Unidade,
  UChama_Fabricante, UCadastro_Grupo_Produto, UChama_Produto,
  UChama_Situacao_Tributaria, UChama_NCM, UDeclaracao, UChama_Regra_ISSQN,
  UChama_Local_Produto, UChama_Tratamento_ICMS, UChama_Tratamento_IPI,
  UChama_Tratamento_PIS, UChama_Tratamento_COFINS, USenha_ADM,
  UAjuda_Cadastro_Produto, Util.Mensagens, Util.TLog;

{$R *.dfm}
{ TFrmPadrao }

procedure TFrmCadastro_Produto.Calcula_Preco_Prazo;
var
  qAux2: TADOQuery;
  perc, perc_prazo, valor1_prazo, valor2, calculo_perc: double;
begin
  qAux2 := TADOQuery.Create(nil);
  try
    with qAux2, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('select TP.Tipo_Calculo, TP.Codigo');
      add('from Tabela_Preco TP');
      add('where TP.Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_padrao;
      open;
    end;
    valor1_prazo := StrToFloat(EdtValor_Compra.Text);
    perc_prazo := StrToFloat(EdtPercentual_Lucro_Prazo.Text);

    if (qAux2.FieldByName('Tipo_Calculo').AsString = 'MARGEM BRUTA') then
    begin
      perc := perc_prazo / 100;
      valor2 := valor1_prazo * perc;
      valor1_prazo := valor1_prazo + valor2;
      valor1_prazo := Calcula_Valor(FloatToStr(valor1_prazo));
    end
    else
    begin
      calculo_perc := (100 - perc_prazo) / 100;
      valor1_prazo := valor1_prazo / calculo_perc;
      valor1_prazo := Calcula_Valor(FloatToStr(valor1_prazo));
    end;

    Util.FormataFloat(2, EdtPreco_Prazo, valor1_prazo);
  finally
    FreeAndNil(qAux2);
  end;
end;

procedure TFrmCadastro_Produto.Calcula_Preco_Vista;
var
  qAux2: TADOQuery;
  perc, perc_vista, valor1_vista, valor2, calculo_perc: double;
begin
  qAux2 := TADOQuery.Create(nil);
  try
    with qAux2, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('select TP.Tipo_Calculo, TP.Codigo');
      add('from Tabela_Preco TP');
      add('where TP.Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_padrao;
      open;
    end;
    valor1_vista := StrToFloat(EdtValor_Compra.Text);
    perc_vista := StrToFloat(EdtPercentual_Lucro_Vista.Text);

    if (qAux2.FieldByName('Tipo_Calculo').AsString = 'MARGEM BRUTA') then
    begin
      perc := perc_vista / 100;
      valor2 := valor1_vista * perc;
      valor1_vista := valor1_vista + valor2;
      valor1_vista := Calcula_Valor(FloatToStr(valor1_vista));
    end
    else
    begin
      calculo_perc := (100 - perc_vista) / 100;
      valor1_vista := valor1_vista / calculo_perc;
      valor1_vista := Calcula_Valor(FloatToStr(valor1_vista));
    end;

    Util.FormataFloat(2, EdtPreco_Vista, valor1_vista);
  finally
    FreeAndNil(qAux2);
  end;

end;

procedure TFrmCadastro_Produto.Insere_Preco_Tabela;
var
  qAux, qAux2: TADOQuery;
  perc, perc_vista, perc_prazo, perc_des_vista, perc_des_prazo: double;
begin
  qAux := TADOQuery.Create(nil);
  qAux2 := TADOQuery.Create(nil);
  try
    try
      { with qAux2, sql do
        begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('select TP.Percentual_Vista, TP.Percentual_Prazo, TP.Codigo');
        add('from Tabela_Preco TP');
        add('where TP.Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_padrao;
        open;
        end; }

      { if (qAux2.FieldByName('Percentual_Vista').AsFloat <> 0) then
        perc_vista:= qAux2.FieldByName('Percentual_Vista').AsFloat
        else if (p_vista <> 0) then
        perc_vista:= p_vista
        else if (p_vista_T <> 0) then
        perc_vista:= p_vista_T
        else
        perc_vista:= 0;

        if (qAux2.FieldByName('Percentual_Prazo').AsFloat <> 0) then
        perc_prazo:= qAux2.FieldByName('Percentual_Prazo').AsFloat
        else if (p_prazo <> 0) then
        perc_prazo:= p_prazo
        else if (p_prazo_T <> 0) then
        perc_prazo:= p_prazo_T
        else
        perc_prazo:= 0; }

      if (achei = false) then
      begin
        try
          with qAux, sql do
          begin
            close;
            Connection := dm.ADOConnection1;
            clear;
            add('insert into Itens_Tabela_Preco (Codigo, Codigo_Produto, Preco_Vista, Preco_Prazo, Percentual_Desconto_Vista, Percentual_Desconto_Prazo, ');
            add('Percentual_Lucro_Vista, Percentual_Lucro_Prazo, Percentual_Comissao_Vista, Percentual_Comissao_Prazo) values ');
            add('(:Codigo, :Codigo_Produto, :Preco_Vista, :Preco_Prazo, :Percentual_Desconto_Vista, :Percentual_Desconto_Prazo, ');
            add(':Percentual_Lucro_Vista, :Percentual_Lucro_Prazo, :Percentual_Comissao_Vista, :Percentual_Comissao_Prazo)');
            Parameters.ParamByName('Codigo').Value :=
              codigo_tabela_preco_padrao;
            Parameters.ParamByName('Codigo_Produto').Value :=
              StrToInt(EdtCodigo.Text);
            Parameters.ParamByName('Preco_Vista').Value :=
              StrToFloat(EdtPreco_Vista.Text);
            Parameters.ParamByName('Preco_Prazo').Value :=
              StrToFloat(EdtPreco_Prazo.Text);
            Parameters.ParamByName('Percentual_Desconto_Vista').Value :=
              StrToFloat(EdtPercentual_Desconto_Vista.Text);;
            Parameters.ParamByName('Percentual_Desconto_Prazo').Value :=
              StrToFloat(EdtPercentual_Desconto_Prazo.Text);;
            Parameters.ParamByName('Percentual_Lucro_Vista').Value :=
              StrToFloat(EdtPercentual_Lucro_Vista.Text);
            Parameters.ParamByName('Percentual_Lucro_Prazo').Value :=
              StrToFloat(EdtPercentual_Lucro_Prazo.Text);
            Parameters.ParamByName('Percentual_Comissao_Vista').Value :=
              StrToFloat(EdtPercentual_Comissao_Vista.Text);
            Parameters.ParamByName('Percentual_Comissao_Prazo').Value :=
              StrToFloat(EdtPercentual_Comissao_Prazo.Text);
            ExecSQL;
          end;
        finally
          FreeAndNil(qAux);
        end;
      end
      else
      begin
        try
          with qAux, sql do
          begin
            close;
            Connection := dm.ADOConnection1;
            clear;
            add('Update Itens_Tabela_Preco set Preco_Vista = :Preco_Vista, Preco_Prazo = :Preco_Prazo,');
            add('Percentual_Lucro_Vista = :Percentual_Lucro_Vista, Percentual_Lucro_Prazo = :Percentual_Lucro_Prazo, ');
            add('Percentual_Desconto_Vista = :Percentual_Desconto_Vista, Percentual_Desconto_Prazo = :Percentual_Desconto_Prazo,');
            add('Percentual_Comissao_Vista = :Percentual_Comissao_Vista, Percentual_Comissao_Prazo = :Percentual_Comissao_Prazo');
            add('where Codigo = :Codigo and Codigo_Produto = :Codigo_Produto');

            Parameters.ParamByName('Codigo').Value :=
              codigo_tabela_preco_padrao;
            Parameters.ParamByName('Codigo_Produto').Value :=
              StrToInt(EdtCodigo.Text);
            Parameters.ParamByName('Preco_Vista').Value :=
              StrToFloat(EdtPreco_Vista.Text);
            Parameters.ParamByName('Preco_Prazo').Value :=
              StrToFloat(EdtPreco_Prazo.Text);
            Parameters.ParamByName('Percentual_Lucro_Vista').Value :=
              StrToFloat(EdtPercentual_Lucro_Vista.Text);
            Parameters.ParamByName('Percentual_Lucro_Prazo').Value :=
              StrToFloat(EdtPercentual_Lucro_Prazo.Text);
            Parameters.ParamByName('Percentual_Desconto_Vista').Value :=
              StrToFloat(EdtPercentual_Desconto_Vista.Text);;
            Parameters.ParamByName('Percentual_Desconto_Prazo').Value :=
              StrToFloat(EdtPercentual_Desconto_Prazo.Text);;
            Parameters.ParamByName('Percentual_Comissao_Vista').Value :=
              StrToFloat(EdtPercentual_Comissao_Vista.Text);
            Parameters.ParamByName('Percentual_Comissao_Prazo').Value :=
              StrToFloat(EdtPercentual_Comissao_Prazo.Text);
            ExecSQL;
          end;
        finally
          FreeAndNil(qAux);
        end;
      end;
    except
      on E: Exception do
      begin
        TLog.Error('Erro ao gravar preços na tabela de preço: ' + E.Message);
        TMensagens.MensagemErro('Erro ao gravar preços na tabela de preço: ' +
          E.Message);
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Produto.Limpa_Nome_Imagem;
begin
  nome_imagem1 := '';
  nome_imagem2 := '';
  nome_imagem3 := '';
end;

procedure TFrmCadastro_Produto.Altera_Preco_Tabela;
var
  qAux, qAux2: TADOQuery;
  perc, perc_vista, perc_prazo, valor1_vista, valor1_prazo, valor2,
    calculo_perc: double;
begin
  qAux := TADOQuery.Create(nil);
  qAux2 := TADOQuery.Create(nil);
  try
    with qAux2, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('select TP.Tipo_Calculo, ITP.* from Tabela_Preco TP');
      add('left join Itens_Tabela_Preco ITP on (TP.Codigo = ITP.Codigo)');
      add('where TP.Codigo = :Codigo and ITP.Codigo_Produto = :Codigo_Produto');
      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_padrao;
      Parameters.ParamByName('Codigo_Produto').Value :=
        StrToInt(EdtCodigo.Text);
      open;
    end;
    valor1_vista := StrToFloat(EdtValor_Compra.Text);
    valor1_prazo := StrToFloat(EdtValor_Compra.Text);

    if (qAux2.FieldByName('Percentual_Vista').AsFloat <> 0) then
      perc_vista := qAux2.FieldByName('Percentual_Vista').AsFloat
    else if (p_vista <> 0) then
      perc_vista := p_vista
    else
      perc_vista := 0;

    if (qAux2.FieldByName('Percentual_Prazo').AsFloat <> 0) then
      perc_prazo := qAux2.FieldByName('Percentual_Prazo').AsFloat
    else if (p_prazo <> 0) then
      perc_prazo := p_prazo
    else
      perc_prazo := 0;

    if (qAux2.FieldByName('Tipo_Calculo').AsString = 'MARGEM BRUTA') then
    begin
      perc := perc_vista / 100;
      valor2 := valor1_vista * perc;
      valor1_vista := valor1_vista + valor2;
      valor1_vista := Calcula_Valor(FloatToStr(valor1_vista));
    end
    else
    begin
      calculo_perc := (100 - perc_vista) / 100;
      valor1_vista := valor1_vista / calculo_perc;
      valor1_vista := Calcula_Valor(FloatToStr(valor1_vista));
    end;

    if (qAux2.FieldByName('Tipo_Calculo').AsString = 'MARGEM BRUTA') then
    begin
      perc := perc_prazo / 100;
      valor2 := valor1_prazo * perc;
      valor1_prazo := valor1_prazo + valor2;
      valor1_prazo := Calcula_Valor(FloatToStr(valor1_prazo));
    end
    else
    begin
      calculo_perc := (100 - perc_prazo) / 100;
      valor1_prazo := valor1_prazo / calculo_perc;
      valor1_prazo := Calcula_Valor(FloatToStr(valor1_prazo));
    end;

    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('Update Itens_Tabela_Preco set Preco_Vista = :Preco_Vista, Preco_Prazo = :Preco_Prazo,');
      add('Percentual_Lucro_Vista = :Percentual_Lucro_Vista, Percentual_Lucro_Prazo = :Percentual_Lucro_Prazo ');
      add('where Codigo = :Codigo and Codigo_Produto = :Codigo_Produto');

      Parameters.ParamByName('Codigo').Value := qAux2.FieldByName('Codigo')
        .AsInteger;
      Parameters.ParamByName('Codigo_Produto').Value :=
        StrToInt(EdtCodigo.Text);
      Parameters.ParamByName('Preco_Vista').Value := valor1_vista;
      Parameters.ParamByName('Preco_Prazo').Value := valor1_prazo;
      Parameters.ParamByName('Percentual_Lucro_Vista').Value := perc_vista;
      Parameters.ParamByName('Percentual_Lucro_Prazo').Value := perc_prazo;
      ExecSQL;
    end;

    { with qAux, sql do
      begin
      close;
      Connection := dm.ADOConnectionLocal;
      clear;
      add('Update Itens_Tabela_Preco set Preco_Vista = :Preco_Vista, Preco_Prazo = :Preco_Prazo');
      add('where Codigo = :Codigo and Codigo_Produto = :Codigo_Produto');

      Parameters.ParamByName('Codigo').Value := qAux2.FieldByName('Codigo').AsInteger;
      Parameters.ParamByName('Codigo_Produto').Value := StrToInt(EdtCodigo.Text);
      Parameters.ParamByName('Preco_Vista').Value := valor1_vista;
      Parameters.ParamByName('Preco_Prazo').Value := valor1_prazo;
      ExecSQL;
      end; }

    Processo_Concluido;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Produto.Atualiza_Codigo_Fornecedor;
begin
  with qrycodigo_fornecedor, sql do
  begin
    close;
    clear;
    add('select PCF.Codigo_Produto_Fornecedor, F.Nome_Fantasia from Produto_Codigo_Fornecedor PCF');
    add('left join Fornecedor F on (PCF.Codigo_Fornecedor = F.Codigo)');
    add('where Codigo_Produto_Inteiro = :Codigo');
    Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmCadastro_Produto.Atualiza_Preco_Fornecedor;
begin
  with qrypreco_fornecedor, sql do
  begin
    close;
    clear;
    add('select top 5 F.Nome_Fantasia, IE.Valor_Unitario, IE.Custo_Unitario,');
    add('IE.Valor_Vista, IE.Valor_Prazo, EP.Data_Entrada');
    add('from Entrada_Produtos EP');
    add('left join Itens_Entrada IE on (EP.Codigo = IE.Codigo)');
    add('left join Fornecedor F on (EP.Codigo_Fornecedor = F.Codigo)');
    add('where IE.Codigo_Produto = :Codigo');
    add('order by Data_Entrada desc');
    Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmCadastro_Produto.Atualiza_Historico_Movimentacao;
begin
  with qryhistorico_movimentacao, sql do
  begin
    close;
    sql.clear;
    sql.add('select Codigo_Reg, Codigo, Descricao, Quantidade, Qtde_Estoque_Atual, Data, Tipo, Nome, CliForn, Qtd from');
    sql.add('( select IE.Codigo as Codigo_Reg, P.Codigo, P.Descricao, (IE.Quantidade) as Quantidade, ');
    sql.add('(IE.Qtde_Estoque_Atual + IE.Quantidade) as Qtd, IE.Qtde_Estoque_Atual, EP.Data_Entrada as Data, '
      + quotedstr('ENTRADA') + ' as Tipo, ');
    sql.add('F.Nome, Fo.Nome_Fantasia as CliForn from Itens_Entrada IE');
    sql.add('left join Produto P on (IE.Codigo_Produto = P.Codigo)');
    sql.add('left join Entrada_Produtos EP on (EP.Codigo = IE.Codigo)');
    sql.add('left join Fornecedor Fo on (EP.Codigo_Fornecedor = Fo.Codigo)');
    sql.add('left join Funcionario F on (EP.Codigo_Funcionario = F.Codigo)');
    sql.add('where P.Codigo = :Codigo1');

    sql.add('Union');

    sql.add('select IP.Codigo as Codigo_Reg, IP.Codigo_Produto, IP.Descricao, (IP.Qtde) as Qtde, ');
    sql.add('(IP.Qtde_Estoque_Atual - IP.Qtde) as Qtd, IP.Qtde_Estoque_Atual, P.Data_Venda as Data, '
      + quotedstr('SAÍDA') + ' as Tipo,');
    sql.add('F.Nome, Cli.Nome_Nome_Fantasia as CliForn from Itens_Pedido IP');
    sql.add('left join Pedido P on (IP.Codigo = P.Codigo) ');
    sql.add('left join Funcionario F on (P.Codigo_Funcionario = F.Codigo)');
    sql.add('left join Cliente Cli on (P.Codigo_Cliente = Cli.Codigo)');
    sql.add('where IP.Codigo_Produto = :Codigo2 and P.Status = :Status2 ');

    sql.add('Union');

    sql.add('select ME.Codigo_Registro as Codigo_Reg, ME.Codigo_Produto, ME.Descricao, ME.Quantidade as Qtde, ');

    sql.add('Qtd = case when (ME.Natureza = ' + quotedstr('ENTRADA MANUAL') +
      ') then');
    sql.add('    (ME.Estoque_Atual + ME.Quantidade)');
    sql.add('    when (ME.Natureza = ' + quotedstr('SAÍDA MANUAL') + ') then');
    sql.add('    (ME.Estoque_Atual - ME.Quantidade) end,');

    sql.add('ME.Estoque_Atual, ME.Data, ME.Natureza,');
    sql.add('F.Nome, F2.Nome from Movimentacao_Estoque ME');
    sql.add('left join Funcionario F on (ME.Codigo_Funcionario = F.Codigo)');
    sql.add('left join Funcionario F2 on (ME.Codigo_Funcionario = F2.Codigo) ');
    sql.add('where ME.Codigo_Produto = :Codigo3) X order by Codigo_Reg desc');

    Parameters.ParamByName('Codigo1').Value := StrToInt(EdtCodigo.Text);
    Parameters.ParamByName('Codigo2').Value := StrToInt(EdtCodigo.Text);
    Parameters.ParamByName('Codigo3').Value := StrToInt(EdtCodigo.Text);
    // Parameters.ParamByName('Codigo3').Value := StrToInt(FrmConsulta_Historico_Movimentacao.EdtCodigo_Produto.Text);
    // Parameters.ParamByName('DI1').Value := StrToDateTime(FrmConsulta_Historico_Movimentacao.MEdtData_Inicial.Text);
    // Parameters.ParamByName('DF1').Value := StrToDateTime(FrmConsulta_Historico_Movimentacao.MEdtData_Final.Text);
    // Parameters.ParamByName('DI2').Value := StrToDateTime(FrmConsulta_Historico_Movimentacao.MEdtData_Inicial.Text);
    // Parameters.ParamByName('DF2').Value := StrToDateTime(FrmConsulta_Historico_Movimentacao.MEdtData_Final.Text);
    // Parameters.ParamByName('DI3').Value := StrToDateTime(FrmConsulta_Historico_Movimentacao.MEdtData_Inicial.Text);
    // Parameters.ParamByName('DF3').Value := StrToDateTime(FrmConsulta_Historico_Movimentacao.MEdtData_Final.Text);
    // Parameters.ParamByName('Status1').Value := 'PAGO';
    Parameters.ParamByName('Status2').Value := 'PAGO';
    // Parameters.ParamByName('Status3').Value := 'PAGO';
    open;
  end;
end;

procedure TFrmCadastro_Produto.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Produto);
  Util.Desabilita_Campos(FrmCadastro_Produto);
  iniciado := false;
  Limpa_Nome_Imagem;
  qrypreco_fornecedor.close;
  BBtnSalvar.Enabled := false;
  BBtnExcluir.Enabled := false;
  BBtnPesquisar.Enabled := true;
  BBtnCancelar.Enabled := false;
  BBtnNovo.Enabled := true;
  BBtnCopiar_Produto.Enabled := true;
  dbgrd1.Visible := false;
end;

procedure TFrmCadastro_Produto.BBtnCopiar_ProdutoClick(Sender: TObject);
begin
  copiar_prod := true;
  Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
  FrmChama_Produto.ShowModal;
  FrmChama_Produto.Free;
end;

procedure TFrmCadastro_Produto.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  BEGIN
    Application.CreateForm(TFrmSenha_ADM, FrmSenha_ADM);
    FrmSenha_ADM.ShowModal;
    FrmSenha_ADM.Free;

    if (libera_exclusao) then
    begin
      try
        Produto.Excluir(Produto);
        CTP.Excluir_Produto_Tabela(CTP, dm.ADOConnection1);

        //Atualizar o registro na tabela PAFQuantidadeRegistros
        AtualizarQuantidadeRegistro('Produto','QtdeProduto');

        Cria_Arquivo_Atualiza_Dados('DProd');
        Cria_Arquivo_Atualiza_Dados('DITPr');

        UDeclaracao.Insere_Historico(usuario, 'EXCLUIU PRODUTO ' +
          EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
        Processo_Concluido;
        BBtnSalvar.Enabled := false;
        BBtnExcluir.Enabled := false;
        BBtnPesquisar.Enabled := true;
        BBtnCancelar.Enabled := false;
        BBtnNovo.Enabled := true;
        BBtnCopiar_Produto.Enabled := true;
        libera_exclusao := false;
        Util.Desabilita_Campos(FrmCadastro_Produto);
      except
        on E: Exception do
        begin
          TLogger.GetInstance.Error('Botão Excluir Produto: ' + E.Message + '. '
            + DateTimeToStr(now));
          Application.MessageBox(PChar('Não é possível excluir o produto ' +
            EdtDescricao.Text +
            '. Certifique-se de que já foi realizada alguma movimentação com o mesmo.'),
            'Não é possível excluir o produto selecionado',
            +MB_OK + MB_ICONHAND);
        end;
      end;
    end;
  END;
end;

procedure TFrmCadastro_Produto.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Produto.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Produto);
  Util.Limpa_Campos(FrmCadastro_Produto);
  BBtnSalvar.Enabled := true;
  BBtnExcluir.Enabled := false;
  BBtnPesquisar.Enabled := false;
  BBtnCancelar.Enabled := true;
  BBtnNovo.Enabled := false;
  BBtnCopiar_Produto.Enabled := false;
  achei := false;
  EdtCodigo_Original.SetFocus;
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);
  Inicia_Pages;
  Limpa_Nome_Imagem;
  EdtValor_Compra.Text := '0,00';
  EdtValor_Medio.Text := '0,00';
  EdtSaldo_Estoque.Text := '0,00';
  EdtValor_Ultima_Compra.Text := '0,00';
  EdtEstoque_Maximo.Text := '0,00';
  EdtEstoque_Minimo.Text := '0,00';
  EdtEstoque.Text := '0';
  EdtEstoque_Reservado.Text := '0';
  EdtVolume.Text := '0,00';
  EdtVolume_Total.Text := '0,00';
  EdtValor_Total_Historico.Text := '0,00';
  EdtValor_Compra_Unitario.Text := '0,00';
  EdtValor_Ultima_Compra_Unitario.Text := '0,00';
  EdtPreco_Prazo.Text := '0,00';
  EdtPreco_Vista.Text := '0,00';
  EdtPercentual_Desconto_Vista.Text := '0,00';
  EdtPercentual_Desconto_Prazo.Text := '0,00';
  EdtPercentual_Lucro_Vista.Text := '0,00';
  EdtPercentual_Lucro_Prazo.Text := '0,00';
  EdtPercentual_Comissao_Vista.Text := '0,00';
  EdtPercentual_Comissao_Prazo.Text := '0,00';

  p_vista := 0;
  p_prazo := 0;
  p_des_vista := 0;
  p_des_prazo := 0;
  p_vista_T := 0;
  p_prazo_T := 0;
  p_des_vista_T := 0;
  p_des_prazo_T := 0;
  qtde_est := 0;

  iniciado := true;
  qrypreco_fornecedor.close;
  qrypreco.close;
  qryhistorico_produto.close;
  qrycodigo_fornecedor.close;
  qryhistorico_movimentacao.close;

  if (busca_parametro_calculo_preco = 0) then
  begin
    Pega_Percentual_Tabela_Preco;
  end;

  // if (cod_local <> '') and (descLocal <> '') then
  // begin
  EdtCodigo_Local.Text := cod_local;
  EdtLocal.Text := descLocal;
  // end;

  MEdtData_Atualizacao_Estoque.Text := DateToStr(date);
  libera_exclusao := false;
  Habilita_Check;

  if (usu_adm = 'SIM') then
  begin
    EdtEstoque.ReadOnly:= false;
  end
  else
  begin
    EdtEstoque.ReadOnly:= true;
  end;
end;

procedure TFrmCadastro_Produto.Verifica_Codigo_Produto_Cadastrado;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(self);
  try
    if (EdtCodigo_Produto.Text <> '') and
      (EdtCodigo_Produto.Text <> '0000000000000') then
    begin
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('select P.Codigo_Venda from Produto P');
        add('where P.Codigo_Venda = :Codigo_Venda');
        Parameters.ParamByName('Codigo_Venda').Value := EdtCodigo_Produto.Text;
        open;

        if (IsEmpty = false) then
        begin
          Application.MessageBox
            ('Código de venda do produto já cadastrado. Por favor, verifique',
            'Produto já cadastrado', MB_OK + MB_ICONHAND);
          EdtCodigo_Produto.SetFocus;
          abort;
        end;
      end;
    end;

    if (EdtCodigo_Original.Text <> '') then
    begin
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('select P.Codigo_Original from Produto P');
        add('where P.Codigo_Original = :Codigo_Original');
        Parameters.ParamByName('Codigo_Original').Value :=
          EdtCodigo_Original.Text;
        open;

        if (IsEmpty = false) then
        begin
          Application.MessageBox
            ('Código original do produto já cadastrado. Por favor, verifique',
            'Produto já cadastrado', MB_OK + MB_ICONHAND);
        end;
      end;
    end;

    if (EdtCodigo_Similar.Text <> '') then
    begin
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('select P.Codigo_Similar from Produto P');
        add('where P.Codigo_Similar = :Codigo_Similar');
        Parameters.ParamByName('Codigo_Similar').Value :=
          EdtCodigo_Similar.Text;
        open;

        if (IsEmpty = false) then
        begin
          Application.MessageBox
            ('Código similar do produto já cadastrado. Por favor, verifique',
            'Produto já cadastrado', MB_OK + MB_ICONHAND);
        end;
      end;
    end;

  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Produto.Verifica_Codigo_Venda;
var
  aux, aux2, aux3: AnsiString;
begin
  if (gera_codigo_ean = 0) and (Length(EdtCodigo_Produto.Text) <> 13) then
  begin
    if (EdtCodigo_Produto.Text = '') then
    begin
      aux := EdtCodigo.Text;
    end
    else
    begin
      aux := EdtCodigo_Produto.Text
    end;

    aux2 := StringOfChar('0', 12 - Length(aux)) + aux;
    aux3 := CalculaDigEAN13(aux2);
    EdtCodigo_Produto.Text := aux2 + aux3;
  end;
end;

procedure TFrmCadastro_Produto.BBtnSalvarClick(Sender: TObject);
var
  est_at: double;
  codLocalTabela, codProdutoGeraMD5: Integer;
  camposGeraHash, MD5Gerado, codigoDeVenda : AnsiString;
begin
  try
    Verifica_Tributacao;


    if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Gera_Codigo;
        Verifica_Codigo_Venda;
        Produto.Inserir(Produto);
        Insere_Preco_Tabela;

        // codProdutoGeraMD5 := RetornaUltimoIdProduto();

        Cria_Arquivo_Atualiza_Dados('IITPr');
        Cria_Arquivo_Atualiza_Dados('IProd');

        UDeclaracao.Insere_Historico(usuario, 'CADASTROU PRODUTO ' +
          EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        Exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        est_at := StrToFloat(EdtEstoque.Text);

        Verifica_Codigo_Venda;
        Produto.Alterar(Produto);

        // if (EdtValor_Compra.Text <> '0') and (EdtValor_Compra.Text <> '0,00') and (EdtValor_Compra.Text <> '') then
        Insere_Preco_Tabela;

        if (est_at > qtde_est) then
        begin
          Insere_Movimentacao_Estoque(codigo_empresa, StrToInt(EdtCodigo.Text),
            EdtCodigo_Produto.Text, EdtDescricao.Text, 'ENTRADA MANUAL', date,
            qtde_est, (est_at - qtde_est), 0, 0, 0, 0, 0, codigo_usu);
        end
        else if (est_at < qtde_est) then
        begin
          Insere_Movimentacao_Estoque(codigo_empresa, StrToInt(EdtCodigo.Text),
            EdtCodigo_Produto.Text, EdtDescricao.Text, 'SAÍDA MANUAL', date,
            qtde_est, (qtde_est - est_at), 0, 0, 0, 0, 0, codigo_usu);
        end;

        Cria_Arquivo_Atualiza_Dados('AITPr');
        Cria_Arquivo_Atualiza_Dados('AProd');

        UDeclaracao.Insere_Historico(usuario, 'ALTEROU PRODUTO ' +
          EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        Exit;
    end;

    // MD51    //representa o arquivo E2
    MD5Gerado := GeraMD5([EdtCodigo_Produto.Text, EdtDescricao.Text,
      EdtEstoque.Text]);

    AtualizaMD51(StrToInt(EdtCodigo.Text), MD5Gerado);

    // MD52    //representa o arquivo P2
    MD5Gerado := GeraMD5([EdtCodigo_Produto.Text, EdtDescricao.Text,
      dm.qrychama_produtoTipo_Recolhimento.AsString,
      dm.qrychama_produtoAliquota.AsString,
      dm.qrychama_produtoPreco_Vista.AsString]);

    AtualizarMD52(StrToInt(EdtCodigo.Text), MD5Gerado);

    // Atualiza na tabela PAFQuantidadeRegistros
    AtualizarQuantidadeRegistro('Produto', 'QtdeProduto');
    AtualizarQuantidadeRegistro('Produto', 'QtdeProdutoEstoque');

    if (tipo_local = '0202') then
    begin
      Atualiza_Produto(4, '');
    end;

    Renomeia_Imagens;
    qtde_est := 0;
    est_at := 0;
    iniciado := false;
    Processo_Concluido;
    BBtnSalvar.Enabled := false;
    BBtnExcluir.Enabled := false;
    BBtnPesquisar.Enabled := true;
    BBtnCancelar.Enabled := false;
    BBtnNovo.Enabled := true;
    BBtnCopiar_Produto.Enabled := true;
    Util.Desabilita_Campos(FrmCadastro_Produto);
  except
    on E: Exception do
    begin
      TLogger.GetInstance.Error('Botão Salvar Produto: ' + E.Message + '. ' +
        DateTimeToStr(now));
      Operacao_Nao_Completada(E.Message);
    end;
  end;
end;

procedure TFrmCadastro_Produto.Gera_Codigo;
var
  qAux: TADOQuery;
  codigo: Integer;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      // add('select max(Codigo) as Codigo from Produto ');
      add('select IDENT_CURRENT(' + quotedstr('Produto') +
        ') as Codigo from Produto');
      open;
    end;
    codigo := qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text := IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Produto.Grava_Local;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  with qAux, sql do
  begin
    close;
    Connection := dm.ADOConnection1;
    clear;
    add('insert into Localidade_Produto (Codigo_Empresa, Local,  Data_Cadastro) values ');
    add('(:Codigo_Empresa, :Local, :Data_Cadastro)');
//    Parameters.ParamByName('Codigo').Value:= EdtCodigo_Local.Text;
    Parameters.ParamByName('Codigo_Empresa').Value :=
      UDeclaracao.codigo_empresa;
    Parameters.ParamByName('Local').Value := EdtLocal.Text;
    // Parameters.ParamByName('Detalhe').Value := '';
    Parameters.ParamByName('Data_Cadastro').Value := date;
    ExecSQL;
  end;
end;

procedure TFrmCadastro_Produto.Chama_Imagens;
begin
  Limpa_Nome_Imagem;

  if FileExists(caminho_servidor + 'Imagens\Produtos\' + EdtCodigo.Text +
    '-1.jpg') then
  begin
    Img1.Picture.LoadFromFile(caminho_servidor + 'Imagens\Produtos\' +
      EdtCodigo.Text + '-1.jpg');
    nome_imagem1 := caminho_servidor + 'Imagens\Produtos\' + EdtCodigo.Text
      + '-1.jpg';
  end
  else
  begin
    Img1.Picture.LoadFromFile('');
  end;

  if FileExists(caminho_servidor + 'Imagens\Produtos\' + EdtCodigo.Text +
    '-2.jpg') then
  begin
    Img2.Picture.LoadFromFile(caminho_servidor + 'Imagens\Produtos\' +
      EdtCodigo.Text + '-2.jpg');
    nome_imagem2 := caminho_servidor + 'Imagens\Produtos\' + EdtCodigo.Text
      + '-2.jpg';
  end
  else
  begin
    Img2.Picture.LoadFromFile('');
  end;

  if FileExists(caminho_servidor + 'Imagens\Produtos\' + EdtCodigo.Text +
    '-3.jpg') then
  begin
    Img3.Picture.LoadFromFile(caminho_servidor + 'Imagens\Produtos\' +
      EdtCodigo.Text + '-3.jpg');
    nome_imagem3 := caminho_servidor + 'Imagens\Produtos\' + EdtCodigo.Text
      + '-3.jpg';
  end
  else
  begin
    Img3.Picture.LoadFromFile('');
  end;

end;

function TFrmCadastro_Produto.Confira: Boolean;
begin
  if (CBServico.Checked = false) then
  begin
    Confira := false;
    if (gera_codigo_ean = 1) then
    begin
      if EdtCodigo_Produto.Text = '' then
      begin
        Mensagem_Falta_Dados;
        PageControl2.TabIndex := 0;
        EdtCodigo_Produto.SetFocus;
        exit;
      end;
    end;

    if EdtDescricao.Text = '' then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 0;
      EdtDescricao.SetFocus;
      exit;
    end;

    if EdtEstoque_Maximo.Text = '' then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 2;
      EdtEstoque_Maximo.SetFocus;
      exit;
    end;

    if EdtEstoque_Minimo.Text = '' then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 2;
      EdtEstoque_Minimo.SetFocus;
      exit;
    end;

    if EdtEstoque.Text = '' then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 2;
      EdtEstoque.SetFocus;
      exit;
    end;

    if EdtEstoque_Reservado.Text = '' then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 2;
      EdtEstoque_Reservado.SetFocus;
      exit;
    end;

    if EdtVolume.Text = '' then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 2;
      EdtVolume.SetFocus;
      exit;
    end;

    if EdtVolume_Total.Text = '' then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 2;
      EdtVolume_Total.SetFocus;
      exit;
    end;

    if EdtCodigo_Unidade.Text = '' then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 0;
      EdtCodigo_Unidade.SetFocus;
      exit;
    end;

    if EdtCodigo_Unidade_Volume.Text = '' then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 0;
      EdtCodigo_Unidade_Volume.SetFocus;
      exit;
    end;

    if (EdtCodigo_Grupo_Tributacao.Text = '') then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 1;
      PageControl3.TabIndex := 0;
      EdtCodigo_Grupo_Tributacao.SetFocus;
      exit;
    end;

    if (EdtCodigo_Grupo_Tributacao_IPI.Text = '') then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 1;
      PageControl3.TabIndex := 1;
      EdtCodigo_Grupo_Tributacao_IPI.SetFocus;
      exit;
    end;

    if (EdtCodigo_Grupo_Tributacao_PIS.Text = '') then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 1;
      PageControl3.TabIndex := 2;
      EdtCodigo_Grupo_Tributacao_PIS.SetFocus;
      exit;
    end;

    if (EdtCodigo_Grupo_Tributacao_COFINS.Text = '') then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 1;
      PageControl3.TabIndex := 3;
      EdtCodigo_Grupo_Tributacao_COFINS.SetFocus;
      exit;
    end;

    if (EdtValor_Compra.Text = '') or (EdtValor_Compra.Text < '0') then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 2;
      EdtValor_Compra.SetFocus;
      exit;
    end;

    if (EdtValor_Compra_Unitario.Text = '') or
      (EdtValor_Compra_Unitario.Text < '0') then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 2;
      EdtValor_Compra_Unitario.SetFocus;
      exit;
    end;

    if (EdtValor_Medio.Text = '') or (EdtValor_Medio.Text < '0') then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 2;
      EdtValor_Medio.SetFocus;
      exit;
    end;

    if (EdtValor_Ultima_Compra.Text = '') or (EdtValor_Ultima_Compra.Text < '0')
    then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 2;
      EdtValor_Ultima_Compra.SetFocus;
      exit;
    end;

    if (EdtValor_Ultima_Compra_Unitario.Text = '') or
      (EdtValor_Ultima_Compra_Unitario.Text < '0') then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 2;
      EdtValor_Ultima_Compra_Unitario.SetFocus;
      exit;
    end;

  end
  else
  begin
    Confira := false;
    if EdtCodigo_Unidade.Text = '' then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 0;
      EdtCodigo_Unidade.SetFocus;
      exit;
    end;

    { if EdtCodigo_Produto.Text = '' then
      begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex:= 0;
      EdtCodigo_Produto.SetFocus;
      abort;
      end; }

    if EdtDescricao.Text = '' then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 0;
      EdtDescricao.SetFocus;
      exit;
    end;

    { if (EdtCodigo_Grupo_Tributacao_ISSQN.Text = '') then
      begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex:= 1;
      PageControl3.TabIndex:= 4;
      EdtCodigo_Grupo_Tributacao_ISSQN.SetFocus;
      abort;
      end; }
  end;

  Confira := true;
end;

procedure TFrmCadastro_Produto.Copia_Produto(Produto: Integer);
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('Insert Into Produto ');
      add('      (Tipo');
      add('      ,Codigo_Empresa');
      add('      ,Status');
      add('      ,Gera_Comissao');
      add('      ,Aceita_Devolucao');
      add('      ,Arred_Trunc');
      add('      ,Producao_Propria');
      add('      ,Codigo_Original');
      add('      ,Codigo_Venda');
      add('      ,Descricao');
      add('      ,Codigo_Barra');
      add('      ,Codigo_Fornecedor');
      add('      ,Codigo_Fabricante');
      add('      ,Codigo_Marca');
      add('      ,Codigo_Unidade_Medida');
      add('      ,Codigo_Unidade_Volume');
      add('      ,Codigo_Grupo');
      add('      ,Codigo_Grupo_Tributacao');
      add('      ,Codigo_Grupo_Tributacao_IPI');
      add('      ,Codigo_Grupo_Tributacao_PIS');
      add('      ,Codigo_Grupo_Tributacao_COFINS');
      add('      ,Codigo_Grupo_Tributacao_ISSQN');
      add('      ,Codigo_Local');
      add('      ,Data_Fabricacao');
      add('      ,Data_Validade');
      add('      ,Ultima_Compra');
      add('      ,Ultima_Venda');
      add('      ,Valor_Compra');
      add('      ,Valor_Medio');
      add('      ,Saldo_Estoque');
      add('      ,Valor_Ultima_Compra');
      add('      ,Estoque_Maximo');
      add('      ,Estoque_Minimo');
      add('      ,Estoque');
      add('      ,Estoque_Reservado');
      add('      ,Volume');
      add('      ,Volume_Total');
      add('      ,Em_Estoque_Maximo');
      add('      ,Em_Estoque_Minimo');
      add('      ,Data_Cadastro');
      add('      ,Data_Atualizacao_Estoque');
      add('      ,Status_Estoque_Data');
      add('      ,NCM');
      add('      ,Aplicacao');
      add('      ,Codigo_Similar');
      add('      ,Valor_Compra_Unitario');
      add('      ,Valor_Ultima_Compra_Unitario)');

      add('  Select');

      add('      Tipo');
      add('      ,Codigo_Empresa');
      add('      ,Status');
      add('      ,Gera_Comissao');
      add('      ,Aceita_Devolucao');
      add('      ,Arred_Trunc');
      add('      ,Producao_Propria');
      add('      ,Codigo_Original');
      add('      ,Codigo_Venda');
      add('      ,Descricao');
      add('      ,Codigo_Barra');
      add('      ,Codigo_Fornecedor');
      add('      ,Codigo_Fabricante');
      add('      ,Codigo_Marca');
      add('      ,Codigo_Unidade_Medida');
      add('      ,Codigo_Unidade_Volume');
      add('      ,Codigo_Grupo');
      add('      ,Codigo_Grupo_Tributacao');
      add('      ,Codigo_Grupo_Tributacao_IPI');
      add('      ,Codigo_Grupo_Tributacao_PIS');
      add('      ,Codigo_Grupo_Tributacao_COFINS');
      add('      ,Codigo_Grupo_Tributacao_ISSQN');
      add('      ,Codigo_Local');
      add('      ,Data_Fabricacao');
      add('      ,Data_Validade');
      add('      ,NULL');
      add('      ,NULL');
      add('      ,(0)');
      add('      ,(0)');
      add('      ,(0)');
      add('      ,(0)');
      add('      ,(0)');
      add('      ,(0)');
      add('      ,(0)');
      add('      ,(0)');
      add('      ,(0)');
      add('      ,(0)');
      add('      ,Em_Estoque_Maximo');
      add('      ,Em_Estoque_Minimo');
      add('      ,( convert( varchar(30),getdate(),103) )');
      add('      ,Null');
      add('      ,Status_Estoque_Data');
      add('      ,NCM');
      add('      ,Aplicacao');
      add('      ,Codigo_Similar');
      add('      ,Valor_Compra_Unitario');
      add('      ,Valor_Ultima_Compra_Unitario)');

      add('      From Produto');
      add('WHERE Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value := Produto;
      ExecSQL;
    end;

    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('Insert Into Produto_Aux ');
      add('      (Tipo');
      add('      ,Codigo_Empresa');
      add('      ,Status');
      add('      ,Gera_Comissao');
      add('      ,Aceita_Devolucao');
      add('      ,Arred_Trunc');
      add('      ,Producao_Propria');
      add('      ,Codigo_Original');
      add('      ,Codigo_Venda');
      add('      ,Descricao');
      add('      ,Codigo_Barra');
      add('      ,Codigo_Fornecedor');
      add('      ,Codigo_Fabricante');
      add('      ,Codigo_Marca');
      add('      ,Codigo_Unidade_Medida');
      add('      ,Codigo_Unidade_Volume');
      add('      ,Codigo_Grupo');
      add('      ,Codigo_Grupo_Tributacao');
      add('      ,Codigo_Grupo_Tributacao_IPI');
      add('      ,Codigo_Grupo_Tributacao_PIS');
      add('      ,Codigo_Grupo_Tributacao_COFINS');
      add('      ,Codigo_Grupo_Tributacao_ISSQN');
      add('      ,Codigo_Local');
      add('      ,Data_Fabricacao');
      add('      ,Data_Validade');
      add('      ,Ultima_Compra');
      add('      ,Ultima_Venda');
      add('      ,Valor_Compra');
      add('      ,Valor_Medio');
      add('      ,Saldo_Estoque');
      add('      ,Valor_Ultima_Compra');
      add('      ,Estoque_Maximo');
      add('      ,Estoque_Minimo');
      add('      ,Estoque');
      add('      ,Estoque_Reservado');
      add('      ,Volume');
      add('      ,Volume_Total');
      add('      ,Em_Estoque_Maximo');
      add('      ,Em_Estoque_Minimo');
      add('      ,Data_Cadastro');
      add('      ,Data_Atualizacao_Estoque');
      add('      ,Status_Estoque_Data');
      add('      ,NCM');
      add('      ,Aplicacao');
      add('      ,Codigo_Similar');
      add('      ,Valor_Compra_Unitario');
      add('      ,Valor_Ultima_Compra_Unitario)');
      add('  Select');

      add('      Tipo');
      add('      ,Codigo_Empresa');
      add('      ,Status');
      add('      ,Gera_Comissao');
      add('      ,Aceita_Devolucao');
      add('      ,Arred_Trunc');
      add('      ,Producao_Propria');
      add('      ,Codigo_Original');
      add('      ,Codigo_Venda');
      add('      ,Descricao');
      add('      ,Codigo_Barra');
      add('      ,Codigo_Fornecedor');
      add('      ,Codigo_Fabricante');
      add('      ,Codigo_Marca');
      add('      ,Codigo_Unidade_Medida');
      add('      ,Codigo_Unidade_Volume');
      add('      ,Codigo_Grupo');
      add('      ,Codigo_Grupo_Tributacao');
      add('      ,Codigo_Grupo_Tributacao_IPI');
      add('      ,Codigo_Grupo_Tributacao_PIS');
      add('      ,Codigo_Grupo_Tributacao_COFINS');
      add('      ,Codigo_Grupo_Tributacao_ISSQN');
      add('      ,Codigo_Local');
      add('      ,Data_Fabricacao');
      add('      ,Data_Validade');
      add('      ,NULL');
      add('      ,NULL');
      add('      ,(0)');
      add('      ,(0)');
      add('      ,(0)');
      add('      ,(0)');
      add('      ,(0)');
      add('      ,(0)');
      add('      ,(0)');
      add('      ,(0)');
      add('      ,(0)');
      add('      ,(0)');
      add('      ,Em_Estoque_Maximo');
      add('      ,Em_Estoque_Minimo');
      add('      ,( convert( varchar(30),getdate(),103) )');
      add('      ,Null');
      add('      ,Status_Estoque_Data');
      add('      ,NCM');
      add('      ,Aplicacao');
      add('      ,Codigo_Similar');
      add('      ,Valor_Compra_Unitario');
      add('      ,Valor_Ultima_Compra_Unitario)');

      add('      From Produto');
      add('WHERE Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value := Produto;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Produto.Copia_Produto_Tabela(Produto: Integer);
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('Insert Into Itens_Tabela_Preco ');
      add('      (Codigo');
      add('      ,Codigo_Produto');
      add('      ,Preco_Vista');
      add('      ,Preco_Prazo');
      add('      ,Percentual_Desconto_Vista');
      add('      ,Percentual_Desconto_Prazo');
      add('      ,Percentual_Lucro_Vista');
      add('      ,Percentual_Lucro_Prazo)');
      add('  Select');

      add('      Codigo');
      add('      ,(select max(Codigo) as Codigo from Produto)');
      add('      ,Preco_Vista');
      add('      ,Preco_Prazo');
      add('      ,Percentual_Desconto_Vista');
      add('      ,Percentual_Desconto_Prazo');
      add('      ,Percentual_Lucro_Vista');
      add('      ,Percentual_Lucro_Prazo');

      add('      From Itens_Tabela_Preco');
      add('WHERE Codigo_Produto = :Codigo');
      Parameters.ParamByName('Codigo').Value := Produto;
      ExecSQL;
    end;

    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('Insert Into Itens_Tabela_Preco_Aux ');
      add('      (Codigo');
      add('      ,Codigo_Produto');
      add('      ,Preco_Vista');
      add('      ,Preco_Prazo');
      add('      ,Percentual_Desconto_Vista');
      add('      ,Percentual_Desconto_Prazo');
      add('      ,Percentual_Lucro_Vista');
      add('      ,Percentual_Lucro_Prazo)');
      add('  Select');

      add('      Codigo');
      add('      ,(select max(Codigo) as Codigo from Produto)');
      add('      ,Preco_Vista');
      add('      ,Preco_Prazo');
      add('      ,Percentual_Desconto_Vista');
      add('      ,Percentual_Desconto_Prazo');
      add('      ,Percentual_Lucro_Vista');
      add('      ,Percentual_Lucro_Prazo');

      add('      From Itens_Tabela_Preco');
      add('WHERE Codigo_Produto = :Codigo');
      Parameters.ParamByName('Codigo').Value := Produto;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Produto.DataSetProvider1GetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: WideString);
begin
  TableName := 'Itens_Tabela_Preco';
end;

procedure TFrmCadastro_Produto.dbgrd1DblClick(Sender: TObject);
begin
  TLog.Info('DUPLO CLIQUE DBGRID');
  TLog.Debug('Código do local escolhido: ' + ADOCodigo.AsString);
  TLog.Debug('Local escolhido: ' + qrylocalLocal.AsString);
  EdtCodigo_Local.Text := ADOCodigo.AsString;
  EdtLocal.Text := qrylocalLocal.AsString;
  dbgrd1.Visible := false;
  TLog.Info('FIM DUPLO CLIQUE DBGRID');
end;

procedure TFrmCadastro_Produto.dbgrd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    EdtCodigo_Local.Text := ADOCodigo.AsString;
    EdtLocal.Text := qrylocalLocal.AsString;
    dbgrd1.Visible := false;
  end;
end;

procedure TFrmCadastro_Produto.DBGrid10DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)

end;

procedure TFrmCadastro_Produto.DBGrid11DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid12DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid13DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid14DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid15DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid16DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid17DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid18DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid19DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid20DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid21DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid22DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid23DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid24DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid25DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid26DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid27DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid28DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid29DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State);

  if (qryhistorico_movimentacaoTipo.Value = 'ENTRADA') or
    (qryhistorico_movimentacaoTipo.Value = 'ENTRADA MANUAL') then
  begin
    DBGrid29.Canvas.font.Color := clBlue;
    DBGrid29.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end
  else if (qryhistorico_movimentacaoTipo.Value = 'SAÍDA') or
    (qryhistorico_movimentacaoTipo.Value = 'SAÍDA MANUAL') then
  begin
    DBGrid29.Canvas.font.Color := clRed;
    DBGrid29.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

end;

procedure TFrmCadastro_Produto.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid30DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid5DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid6DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid7DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid8DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.DBGrid9DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Produto.EdtAcrecimoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmCadastro_Produto.EdtCodigo_FabricanteDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Fabricante, FrmChama_Fabricante);
  FrmChama_Fabricante.ShowModal;
  FrmChama_Fabricante.Free;
end;

procedure TFrmCadastro_Produto.EdtCodigo_FabricanteExit(Sender: TObject);
begin
  Busca_Cadastro(EdtCodigo_Fabricante, EdtFabricante, 2, 'Fornecedor');
end;

procedure TFrmCadastro_Produto.EdtCodigo_FabricanteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Fabricante, FrmChama_Fabricante);
    FrmChama_Fabricante.ShowModal;
    FrmChama_Fabricante.Free;
  end;
end;

procedure TFrmCadastro_Produto.EdtCodigo_FabricanteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(Key);
end;

procedure TFrmCadastro_Produto.EdtCodigo_FornecedorDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Fornecedor, FrmChama_Fornecedor);
  FrmChama_Fornecedor.ShowModal;
  FrmChama_Fornecedor.Free;
end;

procedure TFrmCadastro_Produto.EdtCodigo_FornecedorEnter(Sender: TObject);
begin
  dbgrd1.Visible := false;
end;

procedure TFrmCadastro_Produto.EdtCodigo_FornecedorExit(Sender: TObject);
begin
  Busca_Cadastro(EdtCodigo_Fornecedor, EdtFornecedor, 2, 'Fornecedor');
end;

procedure TFrmCadastro_Produto.EdtCodigo_FornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Fornecedor, FrmChama_Fornecedor);
    FrmChama_Fornecedor.ShowModal;
    FrmChama_Fornecedor.Free;
  end;
end;

procedure TFrmCadastro_Produto.EdtCodigo_FornecedorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(Key);
end;

procedure TFrmCadastro_Produto.EdtCodigo_GrupoDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Grupo_Produto, FrmChama_Grupo_Produto);
  FrmChama_Grupo_Produto.ShowModal;
  FrmChama_Grupo_Produto.Free;
end;

procedure TFrmCadastro_Produto.EdtCodigo_GrupoExit(Sender: TObject);
begin
  Busca_Cadastro_Grupo(EdtCodigo_Grupo, EdtGrupo, EdtCodigo_Grupo_Tributacao,
    EdtGrupo_Tributacao, EdtCodigo_Grupo_Tributacao_IPI,
    EdtGrupo_Tributacao_IPI, EdtCodigo_Grupo_Tributacao_PIS,
    EdtGrupo_Tributacao_PIS, EdtCodigo_Grupo_Tributacao_COFINS,
    EdtGrupo_Tributacao_COFINS, EdtPercentual_Desconto_Vista,
    EdtPercentual_Desconto_Prazo, EdtPercentual_Comissao_Vista,
    EdtPercentual_Comissao_Prazo);
end;

procedure TFrmCadastro_Produto.EdtCodigo_GrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Grupo_Produto, FrmChama_Grupo_Produto);
    FrmChama_Grupo_Produto.ShowModal;
    FrmChama_Grupo_Produto.Free;
  end;
end;

procedure TFrmCadastro_Produto.EdtCodigo_GrupoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(Key);
end;

procedure TFrmCadastro_Produto.EdtCodigo_MarcaDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Marca, FrmChama_Marca);
  FrmChama_Marca.ShowModal;
  FrmChama_Marca.Free;
end;

procedure TFrmCadastro_Produto.EdtCodigo_MarcaExit(Sender: TObject);
begin
  Busca_Cadastro(EdtCodigo_Marca, EdtMarca, 0, 'Marca');
end;

procedure TFrmCadastro_Produto.EdtCodigo_MarcaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Marca, FrmChama_Marca);
    FrmChama_Marca.ShowModal;
    FrmChama_Marca.Free;
  end;
end;

procedure TFrmCadastro_Produto.EdtCodigo_MarcaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(Key);
end;

procedure TFrmCadastro_Produto.EdtCodigo_OriginalChange(Sender: TObject);
var
  aux: AnsiString;
begin
  { if Length(EdtCodigo_Original.Text)=12 then
    begin
    aux:= CalculaDigEAN13(EdtCodigo_Original.Text);
    EdtCodigo_Original.Text:= EdtCodigo_Original.Text + aux;
    end; }
end;

procedure TFrmCadastro_Produto.EdtCodigo_OriginalExit(Sender: TObject);
var
  aux, aux2: AnsiString;
begin
  { if (Length(EdtCodigo_Original.Text) < 12) then
    begin
    aux := EdtCodigo_Original.Text;
    aux2 := StringOfChar('0', 12 - Length(aux)) + aux;

    EdtCodigo_Original.Text:= aux2;
    end; }
end;

procedure TFrmCadastro_Produto.EdtCodigo_ProdutoChange(Sender: TObject);
var
  aux: AnsiString;
begin
  if (gera_codigo_ean = 0) then
  begin
    if Length(EdtCodigo_Produto.Text) = 12 then
    begin
      if (TConfigs.VerificaSeTextoESomenteNumero(EdtCodigo_Produto.Text)) then
      begin
        aux := CalculaDigEAN13(EdtCodigo_Produto.Text);
        EdtCodigo_Produto.Text := EdtCodigo_Produto.Text + aux;
      end;
    end;
  end;
end;

procedure TFrmCadastro_Produto.EdtCodigo_ProdutoExit(Sender: TObject);
var
  aux, aux2: AnsiString;
  soNumero: Boolean;
begin
  if (gera_codigo_ean = 0) then
  begin
    soNumero := TConfigs.VerificaSeTextoESomenteNumero(EdtCodigo_Produto.Text);
    if (Length(EdtCodigo_Produto.Text) < 12) and (soNumero) then
    begin
      aux := EdtCodigo_Produto.Text;
      aux2 := StringOfChar('0', 12 - Length(aux)) + aux;

      EdtCodigo_Produto.Text := aux2;
    end;
  end;

  if (achei = false) then
    Verifica_Codigo_Produto_Cadastrado;
end;

procedure TFrmCadastro_Produto.EdtCodigo_ProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  // Util.Somente_Numero(key);
end;

procedure TFrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_COFINSDblClick
  (Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Tratamento_COFINS,
    FrmChama_Tratamento_COFINS);
  FrmChama_Tratamento_COFINS.ShowModal;
  FrmChama_Tratamento_COFINS.Free;
end;

procedure TFrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_COFINSExit
  (Sender: TObject);
begin
  Busca_Cadastro(EdtCodigo_Grupo_Tributacao_COFINS, EdtGrupo_Tributacao_COFINS,
    0, 'Tratamento_COFINS');
end;

procedure TFrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_COFINSKeyDown
  (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Tratamento_COFINS,
      FrmChama_Tratamento_COFINS);
    FrmChama_Tratamento_COFINS.ShowModal;
    FrmChama_Tratamento_COFINS.Free;
  end;
end;

procedure TFrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_COFINSKeyPress
  (Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero(Key);
end;

procedure TFrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_IPIDblClick
  (Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Tratamento_IPI, FrmChama_Tratamento_IPI);
  FrmChama_Tratamento_IPI.ShowModal;
  FrmChama_Tratamento_IPI.Free;
end;

procedure TFrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_IPIExit
  (Sender: TObject);
begin
  Busca_Cadastro(EdtCodigo_Grupo_Tributacao_IPI, EdtGrupo_Tributacao_IPI, 0,
    'Tratamento_IPI');
end;

procedure TFrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_IPIKeyDown
  (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Tratamento_IPI, FrmChama_Tratamento_IPI);
    FrmChama_Tratamento_IPI.ShowModal;
    FrmChama_Tratamento_IPI.Free;
  end;
end;

procedure TFrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_IPIKeyPress
  (Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero(Key);
end;

procedure TFrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_ISSQNDblClick
  (Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Regra_ISSQN, FrmChama_Regra_ISSQN);
  FrmChama_Regra_ISSQN.ShowModal;
  FrmChama_Regra_ISSQN.Free;
end;

procedure TFrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_ISSQNExit
  (Sender: TObject);
begin
  Busca_Cadastro(EdtCodigo_Grupo_Tributacao_ISSQN, EdtGrupo_Tributacao_ISSQN, 0,
    'Regra_ISSQN');
end;

procedure TFrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_ISSQNKeyDown
  (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Regra_ISSQN, FrmChama_Regra_ISSQN);
    FrmChama_Regra_ISSQN.ShowModal;
    FrmChama_Regra_ISSQN.Free;
  end;
end;

procedure TFrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_ISSQNKeyPress
  (Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero(Key);
end;

procedure TFrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_PISDblClick
  (Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Tratamento_PIS, FrmChama_Tratamento_PIS);
  FrmChama_Tratamento_PIS.ShowModal;
  FrmChama_Tratamento_PIS.Free;
end;

procedure TFrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_PISExit
  (Sender: TObject);
begin
  Busca_Cadastro(EdtCodigo_Grupo_Tributacao_PIS, EdtGrupo_Tributacao_PIS, 0,
    'Tratamento_PIS');
end;

procedure TFrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_PISKeyDown
  (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Tratamento_PIS, FrmChama_Tratamento_PIS);
    FrmChama_Tratamento_PIS.ShowModal;
    FrmChama_Tratamento_PIS.Free;
  end;
end;

procedure TFrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_PISKeyPress
  (Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero(Key);
end;

procedure TFrmCadastro_Produto.EdtCodigo_LocalChange(Sender: TObject);
begin
//  EdtLocal.Text := '';
//  with qrylocal, sql do
//  begin
//    close;
//    clear;
//    add('select LP.Codigo, LP.Local from Localidade_Produto LP');
//    add('where LP.Codigo like ''' + EdtCodigo_Local.Text + '%''');
//    open;
//  end;
end;

procedure TFrmCadastro_Produto.EdtCodigo_LocalClick(Sender: TObject);
begin
  dbgrd1.Visible := true;
end;

procedure TFrmCadastro_Produto.EdtCodigo_LocalDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Local_Produto, FrmChama_Local_Produto);
  FrmChama_Local_Produto.ShowModal;
  FrmChama_Local_Produto.Free;
end;

procedure TFrmCadastro_Produto.EdtCodigo_LocalEnter(Sender: TObject);
begin
  dbgrd1.Visible := true;
end;

procedure TFrmCadastro_Produto.EdtCodigo_LocalExit(Sender: TObject);
begin
  Busca_Cadastro(EdtCodigo_Local, EdtLocal, 3, 'Localidade_Produto');
end;

procedure TFrmCadastro_Produto.EdtCodigo_LocalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    EdtCodigo_Fornecedor.SetFocus;
  end;
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Local_Produto, FrmChama_Local_Produto);
    FrmChama_Local_Produto.ShowModal;
    FrmChama_Local_Produto.Free;
  end;

end;

procedure TFrmCadastro_Produto.EdtCodigo_LocalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(Key);
end;

procedure TFrmCadastro_Produto.EdtCodigo_Situacao_TributariaKeyDown
  (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Situacao_Tributaria,
      FrmChama_Situacao_Tributaria);
    FrmChama_Situacao_Tributaria.ShowModal;
    FrmChama_Situacao_Tributaria.Free;
  end;
end;

procedure TFrmCadastro_Produto.EdtCodigo_Grupo_TributacaoDblClick
  (Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Tratamento_ICMS, FrmChama_Tratamento_ICMS);
  FrmChama_Tratamento_ICMS.ShowModal;
  FrmChama_Tratamento_ICMS.Free;
end;

procedure TFrmCadastro_Produto.EdtCodigo_Grupo_TributacaoExit(Sender: TObject);
begin
  Busca_Cadastro(EdtCodigo_Grupo_Tributacao, EdtGrupo_Tributacao, 0,
    'Tratamento_ICMS');
end;

procedure TFrmCadastro_Produto.EdtCodigo_Grupo_TributacaoKeyDown
  (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Tratamento_ICMS, FrmChama_Tratamento_ICMS);
    FrmChama_Tratamento_ICMS.ShowModal;
    FrmChama_Tratamento_ICMS.Free;
  end;
end;

procedure TFrmCadastro_Produto.EdtCodigo_Grupo_TributacaoKeyPress
  (Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero(Key);
end;

procedure TFrmCadastro_Produto.EdtCodigo_UnidadeDblClick(Sender: TObject);
begin
  unidade := true;
  unidade_volume := false;
  Application.CreateForm(TFrmChama_Unidade, FrmChama_Unidade);
  FrmChama_Unidade.ShowModal;
  FrmChama_Unidade.Free;
end;

procedure TFrmCadastro_Produto.EdtCodigo_UnidadeExit(Sender: TObject);
begin
  Busca_Cadastro(EdtCodigo_Unidade, EdtUnidade, 0, 'Unidade_Medida');
end;

procedure TFrmCadastro_Produto.EdtCodigo_UnidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    unidade := true;
    unidade_volume := false;
    Application.CreateForm(TFrmChama_Unidade, FrmChama_Unidade);
    FrmChama_Unidade.ShowModal;
    FrmChama_Unidade.Free;
  end;
end;

procedure TFrmCadastro_Produto.EdtCodigo_UnidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(Key);
end;

procedure TFrmCadastro_Produto.EdtCodigo_Unidade_VolumeDblClick
  (Sender: TObject);
begin
  unidade := false;
  unidade_volume := true;
  Application.CreateForm(TFrmChama_Unidade, FrmChama_Unidade);
  FrmChama_Unidade.ShowModal;
  FrmChama_Unidade.Free;
end;

procedure TFrmCadastro_Produto.EdtCodigo_Unidade_VolumeExit(Sender: TObject);
begin
  Busca_Cadastro(EdtCodigo_Unidade_Volume, EdtUnidade_Volume, 0,
    'Unidade_Medida');
end;

procedure TFrmCadastro_Produto.EdtCodigo_Unidade_VolumeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    unidade := false;
    unidade_volume := true;
    Application.CreateForm(TFrmChama_Unidade, FrmChama_Unidade);
    FrmChama_Unidade.ShowModal;
    FrmChama_Unidade.Free;
  end;
end;

procedure TFrmCadastro_Produto.EdtCodigo_Unidade_VolumeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(Key);
end;

procedure TFrmCadastro_Produto.EdtDescricaoExit(Sender: TObject);
begin
  // if (achei = false) then
  Verifica_Descricao_Produto_Cadastrado;
end;

procedure TFrmCadastro_Produto.EdtEstoqueExit(Sender: TObject);
begin
  if (EdtEstoque.Text = '') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtEstoque.SetFocus;
    abort;
  end;

end;

procedure TFrmCadastro_Produto.EdtEstoqueKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(Key);
end;

procedure TFrmCadastro_Produto.EdtEstoque_MaximoExit(Sender: TObject);
begin
  if (EdtEstoque_Maximo.Text = '') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtEstoque_Maximo.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtEstoque_Maximo, StrToFloat(EdtEstoque_Maximo.Text));
end;

procedure TFrmCadastro_Produto.EdtEstoque_MaximoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(Key);
end;

procedure TFrmCadastro_Produto.EdtEstoque_MinimoExit(Sender: TObject);
begin
  if (EdtEstoque_Minimo.Text = '') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtEstoque_Minimo.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtEstoque_Minimo, StrToFloat(EdtEstoque_Minimo.Text));
end;

procedure TFrmCadastro_Produto.EdtEstoque_MinimoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(Key);
end;

procedure TFrmCadastro_Produto.EdtEstoque_ReservadoExit(Sender: TObject);
begin
  if (EdtEstoque_Reservado.Text = '') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtEstoque_Reservado.SetFocus;
    abort;
  end;
end;

procedure TFrmCadastro_Produto.EdtEstoque_ReservadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(Key);
end;

procedure TFrmCadastro_Produto.EdtFabricanteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Produto.EdtFornecedorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Produto.EdtGrupoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Produto.EdtGrupo_TributacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Produto.EdtGrupo_Tributacao_COFINSKeyPress
  (Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Produto.EdtGrupo_Tributacao_IPIKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Produto.EdtGrupo_Tributacao_ISSQNKeyPress
  (Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Produto.EdtGrupo_Tributacao_PISKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Produto.EdtICMSKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #08]) then
    Key := #0
end;

procedure TFrmCadastro_Produto.EdtImpostosEnter(Sender: TObject);
var
  icms, ipi, resul: Integer;
begin
  // icms:= StrToInt(EdtICMS.Text);
  // ipi:= StrToInt(EdtIPI.Text);
  // resul:= icms + ipi;
  // EdtImpostos.Text:= IntToStr(resul);
end;

procedure TFrmCadastro_Produto.EdtImpostosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', #08]) then
    Key := #0
end;

procedure TFrmCadastro_Produto.EdtIPIKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #08]) then
    Key := #0
end;

procedure TFrmCadastro_Produto.EdtISSKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #08]) then
    Key := #0
end;

procedure TFrmCadastro_Produto.EdtLocalChange(Sender: TObject);
begin
  with qrylocal, sql do
  begin
    close;
    clear;
    add('select LP.Codigo, LP.Local from Localidade_Produto LP');
    add('where LP.Local like ''' + EdtLocal.Text + '%''');
    open;
  end;

end;

procedure TFrmCadastro_Produto.EdtLocalEnter(Sender: TObject);
begin
  TLog.Info('ENTROU NO CAMPO LOCAL');
  EdtCodigo_Local.clear;
  EdtLocal.clear;
  dbgrd1.Visible := true;
end;

procedure TFrmCadastro_Produto.EdtLocalExit(Sender: TObject);
var
  pegaLocal, pegaCodLocal: string;
  qAux, qAux2: TADOQuery;
  Local: URegistro.TLocalidade_Produto;
  codLocalTabela: Integer;
begin
  TLog.Info('SAIU DO CAMPO LOCAL');
  TLog.Debug('Valor do campo local: ' + EdtLocal.Text);

  if (EdtLocal.Text = qrylocalLocal.AsString) then
  begin
    TLog.Info('COMPARAÇÃO DO MESMO DIGITADO NO CAMPO SER IGUAL AO DO GRID');
    TLog.Debug('Código do local escolhido: ' + ADOCodigo.AsString);
    TLog.Debug('Local escolhido: ' + qrylocalLocal.AsString);
    EdtCodigo_Local.Text := ADOCodigo.AsString;
    EdtLocal.Text := qrylocalLocal.AsString;
    dbgrd1.Visible := false;
    TLog.Info(
      'FIM DO COMPARAÇÃO DO MESMO DIGITADO NO CAMPO SER IGUAL AO DO GRID');
  end;
//  pegaCodLocal := EdtCodigo_Local.Text;
//  pegaLocal := EdtLocal.Text;
//  if (pegaLocal <> qrylocalLocal.AsString) then
//  begin
//    try
//      dm.ADOConnection1.BeginTrans;
//      try
//        qAux := TADOQuery.Create(nil);
//        qAux2 := TADOQuery.Create(nil);
//        with qAux, sql do
//        begin
//          close;
//          clear;
//          Connection := dm.ADOConnection1;
//          add('Insert Into Localidade_Produto (Codigo_Empresa, Local, Data_Cadastro) values ');
//          add('(:Codigo_Empresa, :Local, :Data_Cadastro)');
//          // Parameters.ParamByName('Codigo').Value:= Registro.Cod;
//          Parameters.ParamByName('Codigo_Empresa').Value := Local.Cod_Empresa;
//          Parameters.ParamByName('Local').Value := pegaLocal;
////          Parameters.ParamByName('Detalhe').Value := '';
//          Parameters.ParamByName('Data_Cadastro').Value := '2016-01-27'; //Local.Dat;
//          ExecSQL;
//          dm.ADOConnection1.CommitTrans;
//          lrControle := Insere;
//          UGeral.Mensagem_Padrao(lrControle);
//        end;
//      finally
//        qAux.close;
//        FreeAndNil(qAux);
//      end;
//
//    except
//      on E: Exception do
//      begin
//        dm.ADOConnection1.RollbackTrans;
//        Operacao_Nao_Completada(E.Message);
//      end;
//    end;
//  end;
//  dbgrd1.Visible := false;

//dbgrd1.Visible := false;
    if (EdtLocal.Text <> qrylocalLocal.AsString) then
    begin
      if (EdtCodigo_Local.Text = '') and (EdtLocal.Text <> '') and
        (Application.MessageBox(PChar('Confirma o cadastro?'#13 +
        'Atenção! Você estará cadastrando uma nova localidade. É Isso que deseja?'),
        'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES) then
      begin
        codLocalTabela := Gera_Codigo_Indetity('Localidade_Produto');
        EdtCodigo_Local.Text := IntToStr(codLocalTabela);
        Grava_Local;
        Cria_Arquivo_Atualiza_Dados('ILP');
      end
      else if (EdtCodigo_Local.Text = '') and (EdtLocal.Text <> '') then
      begin
        Exit;
      end;
    end;

  cod_local := EdtCodigo_Local.Text;
  descLocal := EdtLocal.Text;
end;

procedure TFrmCadastro_Produto.EdtLocalKeyPress(Sender: TObject; var Key: Char);
begin
  // Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Produto.EdtMarcaKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Produto.EdtMargem_LucroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', #08]) then
    Key := #0
end;

procedure TFrmCadastro_Produto.EdtPercentual_Comissao_PrazoExit
  (Sender: TObject);
begin
  if (EdtPercentual_Comissao_Prazo.Text = '') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtPercentual_Comissao_Prazo.SetFocus;
    exit;
  end;

  Util.FormataFloat(2, EdtPercentual_Comissao_Prazo,
    StrToFloat(EdtPercentual_Comissao_Prazo.Text));
end;

procedure TFrmCadastro_Produto.EdtPercentual_Comissao_VistaExit
  (Sender: TObject);
begin
  if (EdtPercentual_Comissao_Vista.Text = '') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtPercentual_Comissao_Vista.SetFocus;
    exit;
  end;

  Util.FormataFloat(2, EdtPercentual_Comissao_Vista,
    StrToFloat(EdtPercentual_Comissao_Vista.Text));
end;

procedure TFrmCadastro_Produto.EdtPercentual_Desconto_PrazoExit
  (Sender: TObject);
begin
  if (EdtPercentual_Desconto_Prazo.Text = '') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtPercentual_Desconto_Prazo.SetFocus;
    exit;
  end;

  Util.FormataFloat(2, EdtPercentual_Desconto_Prazo,
    StrToFloat(EdtPercentual_Desconto_Prazo.Text));
end;

procedure TFrmCadastro_Produto.EdtPercentual_Desconto_VistaExit
  (Sender: TObject);
begin
  if (EdtPercentual_Desconto_Vista.Text = '') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtPercentual_Desconto_Vista.SetFocus;
    exit;
  end;

  Util.FormataFloat(2, EdtPercentual_Desconto_Vista,
    StrToFloat(EdtPercentual_Desconto_Vista.Text));
end;

procedure TFrmCadastro_Produto.EdtPercentual_Lucro_PrazoExit(Sender: TObject);
begin
  if (EdtPercentual_Lucro_Prazo.Text = '') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtPercentual_Lucro_Prazo.SetFocus;
    exit;
  end;

  Util.FormataFloat(2, EdtPercentual_Lucro_Prazo,
    StrToFloat(EdtPercentual_Lucro_Prazo.Text));
end;

procedure TFrmCadastro_Produto.EdtPercentual_Lucro_VistaExit(Sender: TObject);
begin
  if (EdtPercentual_Lucro_Vista.Text = '') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtPercentual_Lucro_Vista.SetFocus;
    exit;
  end;

  Util.FormataFloat(2, EdtPercentual_Lucro_Vista,
    StrToFloat(EdtPercentual_Lucro_Vista.Text));
end;

procedure TFrmCadastro_Produto.EdtPreco_PrazoEnter(Sender: TObject);
begin
  Calcula_Preco_Prazo;
end;

procedure TFrmCadastro_Produto.EdtPreco_PrazoExit(Sender: TObject);
begin
  if (EdtPreco_Prazo.Text = '') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtPreco_Prazo.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtPreco_Prazo, StrToFloat(EdtPreco_Prazo.Text));
end;

procedure TFrmCadastro_Produto.EdtPreco_VistaEnter(Sender: TObject);
begin
  // if (EdtPreco_Vista.Text = '0') or (EdtPreco_Vista.Text = '0,00') or (EdtPreco_Vista.Text = '') then
  Calcula_Preco_Vista;
end;

procedure TFrmCadastro_Produto.EdtPreco_VistaExit(Sender: TObject);
begin
  if (EdtPreco_Vista.Text = '') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtPreco_Vista.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtPreco_Vista, StrToFloat(EdtPreco_Vista.Text));
end;

procedure TFrmCadastro_Produto.EdtSaldo_EstoqueEnter(Sender: TObject);
var
  estoque, custo, total: double;
begin
  estoque := StrToFloat(EdtEstoque.Text);
  custo := StrToFloat(EdtValor_Compra.Text);
  total := estoque * custo;
  EdtSaldo_Estoque.Text := FormatFloat('#0.0,0', total);
  EdtSaldo_Estoque.Text := StringReplace(EdtSaldo_Estoque.Text,
    ThousandSeparator, '', [rfReplaceAll]);

  Util.FormataFloat(2, EdtSaldo_Estoque, StrToFloat(EdtSaldo_Estoque.Text));
end;

procedure TFrmCadastro_Produto.EdtSaldo_EstoqueExit(Sender: TObject);
begin
  if (EdtSaldo_Estoque.Text = '') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtSaldo_Estoque.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtSaldo_Estoque, StrToFloat(EdtSaldo_Estoque.Text));
end;

procedure TFrmCadastro_Produto.EdtUnidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Produto.EdtUnidade_VolumeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Produto.EdtValor_CompraExit(Sender: TObject);
begin
  if (EdtValor_Compra.Text = '') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtValor_Compra.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtValor_Compra, StrToFloat(EdtValor_Compra.Text));
end;

procedure TFrmCadastro_Produto.EdtValor_CompraKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(Key);
end;

procedure TFrmCadastro_Produto.EdtValor_Compra_UnitarioExit(Sender: TObject);
begin
  if (EdtValor_Compra_Unitario.Text = '') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtValor_Compra_Unitario.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtValor_Compra_Unitario,
    StrToFloat(EdtValor_Compra_Unitario.Text));
end;

procedure TFrmCadastro_Produto.EdtValor_Compra_UnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(Key);
end;

procedure TFrmCadastro_Produto.EdtValor_MedioExit(Sender: TObject);
begin
  if (EdtValor_Medio.Text = '') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtValor_Medio.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtValor_Medio, StrToFloat(EdtValor_Medio.Text));
end;

procedure TFrmCadastro_Produto.EdtValor_MedioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(Key);
end;

procedure TFrmCadastro_Produto.EdtValor_Ultima_CompraExit(Sender: TObject);
begin
  if (EdtValor_Ultima_Compra.Text = '') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtValor_Ultima_Compra.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtValor_Ultima_Compra,
    StrToFloat(EdtValor_Ultima_Compra.Text));
end;

procedure TFrmCadastro_Produto.EdtValor_Ultima_CompraKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(Key);
end;

procedure TFrmCadastro_Produto.EdtValor_Ultima_Compra_UnitarioExit
  (Sender: TObject);
begin
  if (EdtValor_Ultima_Compra_Unitario.Text = '') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtValor_Ultima_Compra_Unitario.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtValor_Ultima_Compra_Unitario,
    StrToFloat(EdtValor_Ultima_Compra_Unitario.Text));
end;

procedure TFrmCadastro_Produto.EdtValor_VendaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmCadastro_Produto.EdtVolumeExit(Sender: TObject);
begin
  if (EdtVolume.Text = '') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtVolume.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtVolume, StrToFloat(EdtVolume.Text));
end;

procedure TFrmCadastro_Produto.EdtVolumeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(Key);
end;

procedure TFrmCadastro_Produto.EdtVolume_TotalEnter(Sender: TObject);
var
  estoque, volume, total: double;
begin
  estoque := StrToFloat(EdtEstoque.Text);
  volume := StrToFloat(EdtVolume.Text);
  total := estoque * volume;
  EdtVolume_Total.Text := FormatFloat('#0.0,0', total);
  EdtVolume_Total.Text := StringReplace(EdtVolume_Total.Text, ThousandSeparator,
    '', [rfReplaceAll]);

  Util.FormataFloat(2, EdtVolume_Total, StrToFloat(EdtVolume_Total.Text));
end;

procedure TFrmCadastro_Produto.EdtVolume_TotalExit(Sender: TObject);
begin
  if (EdtVolume_Total.Text = '') then
  begin
    TMensagens.MensagemErro(MensagemCampoNulo);
    EdtVolume_Total.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtVolume_Total, StrToFloat(EdtVolume_Total.Text));
end;

procedure TFrmCadastro_Produto.EdtVolume_TotalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(Key);
end;

{ procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
  begin
  case llEstado of
  Inserir: Habilita_Botao([false, true, false, true]);
  //Alterar: Habilita_Botao([false, true, false, true]);
  Consultar: Habilita_Botao([false, true, true, true]);
  end;
  end; }

procedure TFrmCadastro_Produto.FormActivate(Sender: TObject);
begin
  ativo := true;
end;

procedure TFrmCadastro_Produto.FormClick(Sender: TObject);
begin
  dbgrd1.Visible := false;
end;

procedure TFrmCadastro_Produto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
  begin
    Cancele;
    abort;
  end
  else
  begin
    FrmCadastro_Produto.Release;
    FrmCadastro_Produto := Nil;
  end;
end;

procedure TFrmCadastro_Produto.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Produto);
  Util.Limpa_Campos(FrmCadastro_Produto);
  Util.Desabilita_Campos(FrmCadastro_Produto);
  Inicia_Pages;
  iniciado := false;
  Limpa_Nome_Imagem;

  p_vista := 0;
  p_prazo := 0;
  p_des_vista := 0;
  p_des_prazo := 0;
  p_vista_T := 0;
  p_prazo_T := 0;
  p_des_vista_T := 0;
  p_des_prazo_T := 0;

  EdtValor_Compra.Text := '0,00';
  EdtValor_Medio.Text := '0,00';
  EdtSaldo_Estoque.Text := '0,00';
  EdtValor_Ultima_Compra.Text := '0,00';
  EdtEstoque_Maximo.Text := '0,00';
  EdtEstoque_Minimo.Text := '0,00';
  EdtEstoque.Text := '0';
  EdtEstoque_Reservado.Text := '0';
  EdtVolume.Text := '0,00';
  EdtVolume_Total.Text := '0,00';
  EdtValor_Total_Historico.Text := '0,00';
  EdtValor_Compra_Unitario.Text := '0,00';
  EdtValor_Ultima_Compra_Unitario.Text := '0,00';
  unidade := false;
  unidade_volume := false;
  libera_exclusao := false;
  qrypreco_fornecedor.close;
  qrypreco.close;
  SetUncommitted(dm.ADOConnection1);
  qryhistorico_produto.close;
  qrycodigo_fornecedor.close;
  qryhistorico_movimentacao.close;
  Habilita_Check;

  if (tipo_local = '0202') then
  begin
    Atualiza_Produto(4, '');
  end;

  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar,
    BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Produto.FormDeactivate(Sender: TObject);
begin
  ativo := false;
end;

procedure TFrmCadastro_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_f2) then
  begin
    if (iniciado = false) then
    begin
      Util.Habilita_Campos(FrmCadastro_Produto);
      Util.Limpa_Campos(FrmCadastro_Produto);
      BBtnSalvar.Enabled := true;
      BBtnExcluir.Enabled := false;
      BBtnPesquisar.Enabled := false;
      BBtnCancelar.Enabled := true;
      BBtnCopiar_Produto.Enabled := false;
      achei := false;
      MEdtData_Cadastro.SetFocus;
      Inicia_Pages;
      Limpa_Nome_Imagem;
      EdtValor_Compra.Text := '0,00';
      EdtValor_Medio.Text := '0,00';
      EdtSaldo_Estoque.Text := '0,00';
      EdtValor_Ultima_Compra.Text := '0,00';
      EdtEstoque_Maximo.Text := '0,00';
      EdtEstoque_Minimo.Text := '0,00';
      EdtEstoque.Text := '0';
      EdtEstoque_Reservado.Text := '0';
      EdtVolume.Text := '0,00';
      EdtVolume_Total.Text := '0,00';
      EdtValor_Total_Historico.Text := '0,00';
      EdtValor_Compra_Unitario.Text := '0,00';
      EdtValor_Ultima_Compra_Unitario.Text := '0,00';
      EdtPreco_Prazo.Text := '0,00';
      EdtPreco_Vista.Text := '0,00';

      p_vista := 0;
      p_prazo := 0;
      p_des_vista := 0;
      p_des_prazo := 0;
      p_vista_T := 0;
      p_prazo_T := 0;
      p_des_vista_T := 0;
      p_des_prazo_T := 0;
      qtde_est := 0;

      iniciado := true;
      qrypreco_fornecedor.close;
      qrypreco.close;
      qryhistorico_produto.close;
      qrycodigo_fornecedor.close;
      qryhistorico_movimentacao.close;

      MEdtData_Atualizacao_Estoque.Text := DateToStr(date);
      libera_exclusao := false;
      Habilita_Check;
    end;
  end;

  if (Key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Produto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0; // anula todas as teclas
    SelectNext(ActiveControl, true, true);
  end;
end;

procedure TFrmCadastro_Produto.Habilita_Check;
begin
  CBAceita_Devolucao.Checked := true;
  CBGera_Comissao.Checked := true;
  CBAtivo.Checked := true;
  CBTrun_Ar.Checked := false;
  CBProducao_Propria.Checked := false;

  if (opcao_servico_marcada = 0) then
  begin
    CBServico.Checked := true;
  end
  else
  begin
    CBServico.Checked := false;
  end;
end;

procedure TFrmCadastro_Produto.Image1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmAjuda_Cadastro_Produto, FrmAjuda_Cadastro_Produto);
  FrmAjuda_Cadastro_Produto.Show;
  Centraliza_Form(FrmAjuda_Cadastro_Produto);
end;

procedure TFrmCadastro_Produto.Inicia_Pages;
begin
  PageControl2.TabIndex := 0;
  PageControl3.TabIndex := 0;
  PageControl4.TabIndex := 0;
  PageControl5.TabIndex := 0;
  PageControl6.TabIndex := 0;
  PageControl7.TabIndex := 0;
  PageControl9.TabIndex := 0;
  PageControl10.TabIndex := 0;
  PageControl11.TabIndex := 0;
  PageControl12.TabIndex := 0;
  PageControl13.TabIndex := 0;
  PageControl14.TabIndex := 0;
  PageControl15.TabIndex := 0;
  PageControl16.TabIndex := 0;
  PageControl8.TabIndex := 0;
end;

procedure TFrmCadastro_Produto.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Cadastro.Text := DateToStr(date);
end;

procedure TFrmCadastro_Produto.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Produto.MEdtData_FabricacaoExit(Sender: TObject);
begin
  if (MEdtData_Fabricacao.Text = '  /  /    ') then
    exit
  else
    Util.Verifica_Data(MEdtData_Fabricacao);
end;

procedure TFrmCadastro_Produto.MEdtData_FinalEnter(Sender: TObject);
begin
  if (MEdtData_Final.Text = '  /  /    ') then
    MEdtData_Final.Text := DateToStr(date);
end;

procedure TFrmCadastro_Produto.MEdtData_FinalExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Final);

  if (achei = true) then
  begin
    Pega_Historico_Produto;
  end;
end;

procedure TFrmCadastro_Produto.MEdtData_InicialEnter(Sender: TObject);
begin
  if (MEdtData_Inicial.Text = '  /  /    ') then
    MEdtData_Inicial.Text := DateToStr(date);
end;

procedure TFrmCadastro_Produto.MEdtData_InicialExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Inicial);
end;

procedure TFrmCadastro_Produto.Pega_Historico_Produto;
begin
  with qryhistorico_produto, sql do
  begin
    close;
    clear;
    add('select P.Data_Venda, P.N_Pedido, IP.Valor_Unitario, IP.Qtde, IP.Sub_Total, ');
    add('C.Nome_Nome_Fantasia, ');
    add(' (select sum(IP.Sub_Total) from Itens_Pedido IP');
    add('left join Pedido P on(IP.Codigo = P.Codigo)');
    add('where P.Data_Venda between :DI1 and :DF1 and IP.Codigo_Produto = :Produto1 and IP.Cancelado = :N1) as Total_Geral');
    add('from Itens_Pedido IP');
    add('left join Pedido P on(IP.Codigo = P.Codigo)');
    add('left join Cliente C on(P.Codigo_Cliente = C.Codigo)');
    add('where P.Data_Venda between :DI and :DF and IP.Codigo_Produto = :Produto and IP.Cancelado = :N');
    add('order by P.Data_Venda');
    Parameters.ParamByName('DI1').Value := StrToDateTime(MEdtData_Inicial.Text);
    Parameters.ParamByName('DF1').Value := StrToDateTime(MEdtData_Final.Text);
    Parameters.ParamByName('Produto1').Value := StrToInt(EdtCodigo.Text);
    Parameters.ParamByName('N1').Value := 'N';

    Parameters.ParamByName('DI').Value := StrToDateTime(MEdtData_Inicial.Text);
    Parameters.ParamByName('DF').Value := StrToDateTime(MEdtData_Final.Text);
    Parameters.ParamByName('Produto').Value := StrToInt(EdtCodigo.Text);
    Parameters.ParamByName('N').Value := 'N';
    open;
    if (IsEmpty = false) then
    begin
      Util.FormataFloat(2, EdtValor_Total_Historico,
        qryhistorico_produtoTotal_Geral.AsFloat);
    end;
  end;
end;

procedure TFrmCadastro_Produto.MEdtData_ValidadeExit(Sender: TObject);
begin
  if (MEdtData_Validade.Text = '  /  /    ') then
    exit
  else
    Util.Verifica_Data(MEdtData_Validade);
end;

procedure TFrmCadastro_Produto.MEdtUltima_CompraExit(Sender: TObject);
begin
  if (MEdtUltima_Compra.Text = '  /  /    ') then
    exit
  else
    Util.Verifica_Data(MEdtUltima_Compra);
end;

procedure TFrmCadastro_Produto.MEdtUltima_VendaExit(Sender: TObject);
begin
  if (MEdtUltima_Venda.Text = '  /  /    ') then
    exit
  else
    Util.Verifica_Data(MEdtUltima_Venda);
end;

procedure TFrmCadastro_Produto.Pega_Preco_Tabela;
begin
  with qrypreco, sql do
  begin
    close;
    clear;
    add('select TP.*, ITP.* from Tabela_Preco TP');
    add('left join Itens_Tabela_Preco ITP on (TP.Codigo = ITP.Codigo)');
    add('where ITP.Codigo_Produto = :Codigo and TP.Data_Validade >= :Data');
    Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
    Parameters.ParamByName('Data').Value := date;
    open;
  end;
end;

procedure TFrmCadastro_Produto.Pega_Percentual_Tabela_Preco;
var
  qAux2: TADOQuery;
  perc, perc_vista, perc_prazo, perc_des_vista, perc_des_prazo, valor1_vista,
    valor1_prazo, valor2, calculo_perc: double;
begin
  qAux2 := TADOQuery.Create(nil);
  try
    with qAux2, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('select TP.Percentual_Vista, TP.Percentual_Prazo, TP.Tipo_Calculo, TP.Codigo');
      add('from Tabela_Preco TP');
      add('where TP.Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_padrao;
      open;
    end;
    EdtPercentual_Lucro_Vista.Text :=
      qAux2.FieldByName('Percentual_Vista').AsString;
    EdtPercentual_Lucro_Prazo.Text :=
      qAux2.FieldByName('Percentual_Prazo').AsString;
  finally
    FreeAndNil(qAux2);
  end;
end;

procedure TFrmCadastro_Produto.Renomeia_Imagens;
begin
  if (nome_imagem1 <> '') then
    RenameFile(nome_imagem1, caminho_servidor + 'Imagens\Produtos\' +
      EdtCodigo.Text + '-1.jpg');

  if (nome_imagem2 <> '') then
    RenameFile(nome_imagem2, caminho_servidor + 'Imagens\Produtos\' +
      EdtCodigo.Text + '-2.jpg');

  if (nome_imagem3 <> '') then
    RenameFile(nome_imagem3, caminho_servidor + 'Imagens\Produtos\' +
      EdtCodigo.Text + '-3.jpg');
end;

procedure TFrmCadastro_Produto.SpeedButton1Click(Sender: TObject);
begin
  OpenPictureDialog1.InitialDir := caminho_servidor + 'Imagens\Produtos';
  OpenPictureDialog1.Execute;
  nome_imagem2 := OpenPictureDialog1.FileName;
  Img2.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TFrmCadastro_Produto.SpeedButton2Click(Sender: TObject);
begin
  OpenPictureDialog1.InitialDir := caminho_servidor + 'Imagens\Produtos';
  OpenPictureDialog1.Execute;
  nome_imagem3 := OpenPictureDialog1.FileName;
  Img3.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TFrmCadastro_Produto.SpeedButton3Click(Sender: TObject);
begin
  OpenPictureDialog1.InitialDir := caminho_servidor + 'Imagens\Produtos';
  OpenPictureDialog1.Execute;
  nome_imagem1 := OpenPictureDialog1.FileName;
  Img1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TFrmCadastro_Produto.SpeedButton4Click(Sender: TObject);
begin
  if (Application.MessageBox(PChar('Confirma a exclusão da imagem?'#13 +
    'Obs.: A imagem não será excluida do computador; apenas do sistema.'),
    'Confirmação', MB_YESNO + MB_ICONQUESTION)) = IDYES then
  begin
    if (nome_imagem1 <> '') then
    begin
      RenameFile(nome_imagem1, caminho_servidor + 'Imagens\Produtos\' +
        EdtCodigo.Text + '-1-Excluida.jpg');
      nome_imagem1 := '';
      Img1.Picture.LoadFromFile('');
    end;
  end;
end;

procedure TFrmCadastro_Produto.SpeedButton5Click(Sender: TObject);
begin
  if (Application.MessageBox(PChar('Confirma a exclusão da imagem?'#13 +
    'Obs.: A imagem não será excluida do computador; apenas do sistema.'),
    'Confirmação', MB_YESNO + MB_ICONQUESTION)) = IDYES then
  begin
    if (nome_imagem2 <> '') then
    begin
      RenameFile(nome_imagem2, caminho_servidor + 'Imagens\Produtos\' +
        EdtCodigo.Text + '-2-Excluida.jpg');
      nome_imagem2 := '';
      Img2.Picture.LoadFromFile('');
    end;
  end;
end;

procedure TFrmCadastro_Produto.SpeedButton6Click(Sender: TObject);
begin
  if (Application.MessageBox(PChar('Confirma a exclusão da imagem?'#13 +
    'Obs.: A imagem não será excluida do computador; apenas do sistema.'),
    'Confirmação', MB_YESNO + MB_ICONQUESTION)) = IDYES then
  begin
    if (nome_imagem3 <> '') then
    begin
      RenameFile(nome_imagem3, caminho_servidor + 'Imagens\Produtos\' +
        EdtCodigo.Text + '-3-Excluida.jpg');
      nome_imagem3 := '';
      Img3.Picture.LoadFromFile('');
    end;
  end;
end;

procedure TFrmCadastro_Produto.TlbFerramentasClick(Sender: TObject);
begin
  dbgrd1.Visible := false;
end;

procedure TFrmCadastro_Produto.Verifica_Descricao_Produto_Cadastrado;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(self);
  try
    if (EdtDescricao.Text <> '') then
    begin
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('select P.Descricao from Produto P');
        add('where P.Descricao = :Descricao');
        Parameters.ParamByName('Descricao').Value := EdtDescricao.Text;
        // Parameters.ParamByName('Codigo_Original').Value:= EdtCodigo_Original.Text;
        // Parameters.ParamByName('Codigo_Venda').Value:= EdtCodigo_Produto.Text;
        open;

        if (IsEmpty = false) then
        begin
          Application.MessageBox
            ('Descrição de produto já cadastrado. Por favor, verifique.',
            'Produto já cadastrado', MB_OK + MB_ICONHAND);
          // EdtDescricao.SetFocus;
          // abort;
        end;
      end;
    end;

  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Produto.Verifica_Tributacao;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(self);
  try
    { if (EdtCodigo_Grupo_Tributacao.Text <> '') then
      begin
      with qAux, sql do
      begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select RICMS.Aliquota');

      add('from Produto Pro');

      add('inner join Grupo_Produto_Tributacao GPT on (GPT.Codigo = Pro.Codigo_Grupo_Tributacao)');
      add('inner join Tratamento_ICMS TICMS on (GPT.Codigo_Tratamento_ICMS = TICMS.Codigo)');
      add('inner join Itens_Tratamento_ICMS ITICMS on (TICMS.Codigo = ITICMS.Codigo and ITICMS.Origem = :UF1 and ITICMS.Destino = :UF2)');
      add('inner join Regra_ICMS RICMS on (ITICMS.Regra_Nao_Contribuinte = RICMS.Codigo)');
      add('where Pro.Codigo_Grupo_Tributacao = :CGT');

      Parameters.ParamByName('UF1').Value:= uf;
      Parameters.ParamByName('UF2').Value:= uf;
      Parameters.ParamByName('CGT').Value:= StrToInt(EdtCodigo_Grupo_Tributacao.Text);
      //Parameters.ParamByName('Pro').Value:= StrToInt(EdtCodigo.Text);
      open;
      end;

      if (qAux.FieldByName('Aliquota').AsString = 'I') and (CBServico.Checked = false) then
      begin
      if not (RGTipo_Tributacao.ItemIndex = 0) then
      begin
      Mensagem_Tributacao_Incorreta;
      abort;
      end;
      end
      else if (qAux.FieldByName('Aliquota').AsString = 'N') and (CBServico.Checked = false) then
      begin
      if not (RGTipo_Tributacao.ItemIndex = 1) then
      begin
      Mensagem_Tributacao_Incorreta;
      abort;
      end;
      end
      else if (qAux.FieldByName('Aliquota').AsString = 'F') and (CBServico.Checked = false) then
      begin
      if not (RGTipo_Tributacao.ItemIndex = 2) then
      begin
      Mensagem_Tributacao_Incorreta;
      abort;
      end;
      end;

      if (CBServico.Checked = true) then
      begin
      if not (RGTipo_Tributacao.ItemIndex = 4) then
      begin
      Mensagem_Tributacao_Incorreta;
      abort;
      end;
      end;

      if (qAux.FieldByName('Aliquota').AsString <> 'I') and (qAux.FieldByName('Aliquota').AsString <> 'N') and
      (qAux.FieldByName('Aliquota').AsString <> 'F') and (CBServico.Checked = false) then
      begin
      if not (RGTipo_Tributacao.ItemIndex = 3) then
      begin
      Mensagem_Tributacao_Incorreta;
      abort;
      end;
      end;
      end; }
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Produto.BBtnPesquisarClick(Sender: TObject);
begin
  copiar_prod := false;
  Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
  FrmChama_Produto.ShowModal;
  FrmChama_Produto.Free;
  dbgrd1.Visible := false;
end;

end.
