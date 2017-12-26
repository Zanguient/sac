unit UNFE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids,
  DBGrids, UGeral, URegistro,
  ExtCtrls, StrUtils, OleCtrls, SHDocVw, ACBrNFe, pcnConversao,
  ACBrUtil, DateUtils, ACBrNFeDANFEClass, DBCtrls,
  Modelo.Visao.NFE.TConsultaNFParaReferencia, Modelo.Dominio.NFE.INFEDominio,
  pcnNFe,
  Modelo.Entidade.TLancamentoFinanceiroEntidade,
  Modelo.Entidade.TParcelasLancamentoFinanceiroEntidade,
  Modelo.Entidade.TCondicaoPagamentoEntidade,
  Modelo.Dominio.TCondicaoPagamentoDominio,
  Modelo.Entidade.Cliente.TCliente, Modelo.Dominio.Cliente.TClienteDominio,
  Datasnap.DBClient, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridDBTableView, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView, cxGrid,
  cxPropertiesStore, cxCheckBox, cxEditRepositoryItems, Vcl.Menus, cxButtons,
  ACBrMail, ACBrNFeDANFeRLClass, ACBrBase, ACBrDFe, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, cxNavigator, ACBrDANFCeFortesFr, DadosEmissaoNFE,
  DadosEmissaoNFEItens, DadosEmissaoNFEPagamento, DadosEmissaoNFERecebimento;

type
  TFrmNFE = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    MEdtData_Emissao: TMaskEdit;
    LblData_Cadastro: TLabel;
    LblMarca: TLabel;
    EdtN_Nota_Fiscal: TEdit;
    LblData_Compra: TLabel;
    MEdtData_Entrada_Saida: TMaskEdit;
    Label1: TLabel;
    EdtSerie: TEdit;
    Label2: TLabel;
    EdtCodigo_CFOP: TEdit;
    EdtCFOP: TEdit;
    MEdtHora_Entrada_Saida: TMaskEdit;
    Label11: TLabel;
    EdtModelo: TEdit;
    Label3: TLabel;
    EdtChave_Acesso: TEdit;
    RGTipo_Operacao: TRadioGroup;
    TabSheet2: TTabSheet;
    TabSheet6: TTabSheet;
    Label59: TLabel;
    EdtBase_Calculo_ICMS: TEdit;
    Label62: TLabel;
    EdtValor_ICMS: TEdit;
    Label63: TLabel;
    EdtBase_Calculo_ICMS_Substituicao: TEdit;
    Label64: TLabel;
    EdtValor_ICMS_Substituicao: TEdit;
    Label65: TLabel;
    EdtValor_Total_Produtos: TEdit;
    Label66: TLabel;
    EdtValor_Frete: TEdit;
    Label67: TLabel;
    EdtValor_Seguro: TEdit;
    Label68: TLabel;
    EdtOutras_Despesas: TEdit;
    Label69: TLabel;
    EdtValor_Total_IPI: TEdit;
    Label70: TLabel;
    EdtValor_Total_Nota: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Label71: TLabel;
    EdtTransportadora: TEdit;
    EdtCodigo_Transportadora: TEdit;
    RGFrete: TRadioGroup;
    Label72: TLabel;
    EdtVeiculo: TEdit;
    EdtCodigo_Veiculo: TEdit;
    EdtUF_Veiculo: TEdit;
    Label73: TLabel;
    EdtQuantidade_Transportada: TEdit;
    EdtEspecie: TEdit;
    Label74: TLabel;
    EdtMarca: TEdit;
    Label75: TLabel;
    EdtNumero_Transportado: TEdit;
    Label76: TLabel;
    EdtPeso_Bruto: TEdit;
    Label77: TLabel;
    EdtPeso_Liquido: TEdit;
    Label78: TLabel;
    Label4: TLabel;
    CmbForma_Pagamento: TComboBox;
    Label83: TLabel;
    CMBTipo_Nota: TComboBox;
    ADOQuery1: TADOQuery;
    ADOQuery1Codigo_Cliente: TIntegerField;
    ADOQuery1Codigo_Endereco: TIntegerField;
    ADOQuery1Numero: TStringField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Tipo_Logradouro: TStringField;
    ADOQuery1CEP: TStringField;
    ADOQuery1Tipo_Endereco: TStringField;
    ADOQuery1Complemento: TStringField;
    DataSource1: TDataSource;
    Label81: TLabel;
    EdtCodigo_Emitente: TEdit;
    EdtEmitente: TEdit;
    Label82: TLabel;
    EdtCodigo_Destinatario: TEdit;
    EdtDestinatario: TEdit;
    Panel3: TPanel;
    Label5: TLabel;
    EdtValor_Total_Servicos: TEdit;
    Label6: TLabel;
    EdtBase_Calculo_ISSQN: TEdit;
    Label7: TLabel;
    EdtValor_ISSQN: TEdit;
    Label8: TLabel;
    EdtInscricao_Municipal: TEdit;
    Label10: TLabel;
    EdtDesconto_Nota: TEdit;
    DataSource2: TDataSource;
    qryitens_nf: TADOQuery;
    Label29: TLabel;
    EdtValor_Total_PIS: TEdit;
    Label30: TLabel;
    EdtValor_Total_COFINS: TEdit;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOQuery3Codigo: TAutoIncField;
    ADOQuery3Data_Cadastro: TDateTimeField;
    ADOQuery3Descricao: TStringField;
    ADOQuery3Aliquota: TStringField;
    ADOQuery3Tipo_Recolhimento: TStringField;
    ADOQuery3Base_Reduzida: TStringField;
    ADOQuery3Percentual_BC_Reduzida: TStringField;
    ADOQuery3Base_Acrescida: TStringField;
    ADOQuery3Percentual_BC_Acrescida: TStringField;
    ADOQuery3Codigo_Situacao_Tributaria: TIntegerField;
    ADOQuery3Codigo_Observacao_Fiscal: TIntegerField;
    ADOQuery3Dispositivo_Legal: TStringField;
    ADOQuery3Codigo_Situacao: TStringField;
    ADOQuery3Descricao_1: TStringField;
    ADOQuery3Descricao_2: TStringField;
    ADOQuery3Origem: TIntegerField;
    ADOQuery2Codigo: TAutoIncField;
    ADOQuery2Aliquota: TStringField;
    ADOQuery2Base_Reduzida: TStringField;
    ADOQuery2Base_Acrescida: TStringField;
    ADOQuery2Percentual_BC_Reduzida: TStringField;
    ADOQuery2Percentual_BC_Acrescida: TStringField;
    ADOQuery2Codigo_1: TAutoIncField;
    ADOQuery2Aliquota_1: TStringField;
    ADOQuery2Base_Reduzida_1: TStringField;
    ADOQuery2Base_Acrescida_1: TStringField;
    ADOQuery2Percentual_BC_Reduzida_1: TStringField;
    ADOQuery2Percentual_BC_Acrescida_1: TStringField;
    ADOQuery2Codigo_2: TAutoIncField;
    ADOQuery2Aliquota_2: TStringField;
    ADOQuery2Base_Reduzida_2: TStringField;
    ADOQuery2Base_Acrescida_2: TStringField;
    ADOQuery2Percentual_BC_Reduzida_2: TStringField;
    ADOQuery2Percentual_BC_Acrescida_2: TStringField;
    ADOQuery2Codigo_3: TAutoIncField;
    ADOQuery2Aliquota_3: TStringField;
    ADOQuery2Base_Reduzida_3: TStringField;
    ADOQuery2Base_Acrescida_3: TStringField;
    ADOQuery2Percentual_BC_Reduzida_3: TStringField;
    ADOQuery2Percentual_BC_Acrescida_3: TStringField;
    ADOQuery2Codigo_4: TAutoIncField;
    ADOQuery2Aliquota_4: TStringField;
    ADOQuery2Base_Reduzida_4: TStringField;
    ADOQuery2Base_Acrescida_4: TStringField;
    ADOQuery2Percentual_BC_Reduzida_4: TStringField;
    ADOQuery2Percentual_BC_Acrescida_4: TStringField;
    ADOQuery2Codigo_5: TAutoIncField;
    ADOQuery2Aliquota_5: TStringField;
    ADOQuery2Base_Reduzida_5: TStringField;
    ADOQuery2Base_Acrescida_5: TStringField;
    ADOQuery2Percentual_BC_Reduzida_5: TStringField;
    ADOQuery2Percentual_BC_Acrescida_5: TStringField;
    ADOQuery2Codigo_6: TAutoIncField;
    ADOQuery2Aliquota_6: TStringField;
    ADOQuery2Base_Reduzida_6: TStringField;
    ADOQuery2Base_Acrescida_6: TStringField;
    ADOQuery2Percentual_BC_Reduzida_6: TStringField;
    ADOQuery2Percentual_BC_Acrescida_6: TStringField;
    ADOQuery2Codigo_7: TAutoIncField;
    ADOQuery2Descricao: TStringField;
    ADOQuery2Codigo_Tratamento_ICMS: TIntegerField;
    ADOQuery2Data_Cadastro: TDateTimeField;
    ADOQuery2Codigo_8: TIntegerField;
    ADOQuery2Descricao_1: TStringField;
    ADOQuery2Data_Cadastro_1: TDateTimeField;
    ADOQuery2Descricao_2: TStringField;
    ADOQuery2Descricao_3: TStringField;
    ADOQuery2Descricao_4: TStringField;
    ADOQuery2Descricao_5: TStringField;
    ADOQuery2Descricao_6: TStringField;
    ADOQuery2Descricao_7: TStringField;
    ADOQuery2Descricao_8: TStringField;
    ADOQuery2Codigo_Situacao: TStringField;
    ADOQuery2Codigo_Situacao_1: TStringField;
    ADOQuery2Codigo_Situacao_2: TStringField;
    ADOQuery2Codigo_Situacao_3: TStringField;
    ADOQuery2Codigo_Situacao_4: TStringField;
    ADOQuery2Codigo_Situacao_5: TStringField;
    ADOQuery2Codigo_Situacao_6: TStringField;
    ADOQuery2Codigo_Grupo_Tributacao: TIntegerField;
    ADOQuery4: TADOQuery;
    ADOQuery4Descricao_IPI_1: TStringField;
    ADOQuery4Aliquota_IPI_1: TStringField;
    ADOQuery4Codigo_NCM_1: TStringField;
    ADOQuery4Descricao_NCM_1: TStringField;
    ADOQuery4Tipo_Recolhimento_IPI_1: TStringField;
    ADOQuery4Base_Reduzida_IPI_1: TStringField;
    ADOQuery4Percentual_BC_Reduzida_IPI_1: TStringField;
    ADOQuery4Base_Acrescida_IPI_1: TStringField;
    ADOQuery4Percentual_BC_Acrescida_IPI_1: TStringField;
    ADOQuery4Codigo_ST_IPI2_1: TStringField;
    ADOQuery4Descricao_ST_IPI2_1: TStringField;
    ADOQuery4Descricao_IPI_2: TStringField;
    ADOQuery4Aliquota_IPI_2: TStringField;
    ADOQuery4Codigo_NCM_2: TStringField;
    ADOQuery4Descricao_NCM_2: TStringField;
    ADOQuery4Tipo_Recolhimento_IPI_2: TStringField;
    ADOQuery4Base_Reduzida_IPI_2: TStringField;
    ADOQuery4Percentual_BC_Reduzida_IPI_2: TStringField;
    ADOQuery4Base_Acrescida_IPI_2: TStringField;
    ADOQuery4Percentual_BC_Acrescida_IPI_2: TStringField;
    ADOQuery4Codigo_ST_IPI2_2: TStringField;
    ADOQuery4Descricao_ST_IPI2_2: TStringField;
    ADOQuery4Descricao_IPI_3: TStringField;
    ADOQuery4Aliquota_IPI_3: TStringField;
    ADOQuery4Codigo_NCM_3: TStringField;
    ADOQuery4Descricao_NCM_3: TStringField;
    ADOQuery4Tipo_Recolhimento_IPI_3: TStringField;
    ADOQuery4Base_Reduzida_IPI_3: TStringField;
    ADOQuery4Percentual_BC_Reduzida_IPI_3: TStringField;
    ADOQuery4Base_Acrescida_IPI_3: TStringField;
    ADOQuery4Percentual_BC_Acrescida_IPI_3: TStringField;
    ADOQuery4Codigo_ST_IPI2_3: TStringField;
    ADOQuery4Descricao_ST_IPI2_3: TStringField;
    ADOQuery4Descricao_IPI_4: TStringField;
    ADOQuery4Aliquota_IPI_4: TStringField;
    ADOQuery4Codigo_NCM_4: TStringField;
    ADOQuery4Descricao_NCM_4: TStringField;
    ADOQuery4Tipo_Recolhimento_IPI_4: TStringField;
    ADOQuery4Base_Reduzida_IPI_4: TStringField;
    ADOQuery4Percentual_BC_Reduzida_IPI_4: TStringField;
    ADOQuery4Base_Acrescida_IPI_4: TStringField;
    ADOQuery4Percentual_BC_Acrescida_IPI_4: TStringField;
    ADOQuery4Codigo_ST_IPI2_4: TStringField;
    ADOQuery4Descricao_ST_IPI2_4: TStringField;
    ADOQuery4Descricao_IPI_5: TStringField;
    ADOQuery4Aliquota_IPI_5: TStringField;
    ADOQuery4Codigo_NCM_5: TStringField;
    ADOQuery4Descricao_NCM_5: TStringField;
    ADOQuery4Tipo_Recolhimento_IPI_5: TStringField;
    ADOQuery4Base_Reduzida_IPI_5: TStringField;
    ADOQuery4Percentual_BC_Reduzida_IPI_5: TStringField;
    ADOQuery4Base_Acrescida_IPI_5: TStringField;
    ADOQuery4Percentual_BC_Acrescida_IPI_5: TStringField;
    ADOQuery4Codigo_ST_IPI2_5: TStringField;
    ADOQuery4Descricao_ST_IPI2_5: TStringField;
    ADOQuery4Descricao_IPI_6: TStringField;
    ADOQuery4Aliquota_IPI_6: TStringField;
    ADOQuery4Codigo_NCM_6: TStringField;
    ADOQuery4Descricao_NCM_6: TStringField;
    ADOQuery4Tipo_Recolhimento_IPI_6: TStringField;
    ADOQuery4Base_Reduzida_IPI_6: TStringField;
    ADOQuery4Percentual_BC_Reduzida_IPI_6: TStringField;
    ADOQuery4Base_Acrescida_IPI_6: TStringField;
    ADOQuery4Percentual_BC_Acrescida_IPI_6: TStringField;
    ADOQuery4Codigo_ST_IPI2_6: TStringField;
    ADOQuery4Descricao_ST_IPI2_6: TStringField;
    ADOQuery4Descricao_IPI_7: TStringField;
    ADOQuery4Aliquota_IPI_7: TStringField;
    ADOQuery4Codigo_NCM_7: TStringField;
    ADOQuery4Descricao_NCM_7: TStringField;
    ADOQuery4Tipo_Recolhimento_IPI_7: TStringField;
    ADOQuery4Base_Reduzida_IPI_7: TStringField;
    ADOQuery4Percentual_BC_Reduzida_IPI_7: TStringField;
    ADOQuery4Base_Acrescida_IPI_7: TStringField;
    ADOQuery4Percentual_BC_Acrescida_IPI_7: TStringField;
    ADOQuery4Codigo_ST_IPI2_7: TStringField;
    ADOQuery4Descricao_ST_IPI2_7: TStringField;
    ADOQuery5: TADOQuery;
    ADOQuery5Descricao_PIS1: TStringField;
    ADOQuery5Aliquota_PIS1: TStringField;
    ADOQuery5Tipo_Recolhimento_PIS1: TStringField;
    ADOQuery5Base_Reduzida_PIS1: TStringField;
    ADOQuery5Percentual_BC_Reduzida_PIS1: TStringField;
    ADOQuery5Base_Acrescida_PIS1: TStringField;
    ADOQuery5Percentual_BC_Acrescida_PIS1: TStringField;
    ADOQuery5Codigo_ST_PIS3_1: TStringField;
    ADOQuery5Descricao_ST_PIS3_1: TStringField;
    ADOQuery5Descricao_PIS2: TStringField;
    ADOQuery5Aliquota_PIS2: TStringField;
    ADOQuery5Tipo_Recolhimento_PIS2: TStringField;
    ADOQuery5Base_Reduzida_PIS2: TStringField;
    ADOQuery5Percentual_BC_Reduzida_PIS2: TStringField;
    ADOQuery5Base_Acrescida_PIS2: TStringField;
    ADOQuery5Percentual_BC_Acrescida_PIS2: TStringField;
    ADOQuery5Codigo_ST_PIS3_2: TStringField;
    ADOQuery5Descricao_ST_PIS3_2: TStringField;
    ADOQuery5Descricao_PIS3: TStringField;
    ADOQuery5Aliquota_PIS3: TStringField;
    ADOQuery5Tipo_Recolhimento_PIS3: TStringField;
    ADOQuery5Base_Reduzida_PIS3: TStringField;
    ADOQuery5Percentual_BC_Reduzida_PIS3: TStringField;
    ADOQuery5Base_Acrescida_PIS3: TStringField;
    ADOQuery5Percentual_BC_Acrescida_PIS3: TStringField;
    ADOQuery5Codigo_ST_PIS3_3: TStringField;
    ADOQuery5Descricao_ST_PIS3_3: TStringField;
    ADOQuery5Descricao_PIS4: TStringField;
    ADOQuery5Aliquota_PIS4: TStringField;
    ADOQuery5Tipo_Recolhimento_PIS4: TStringField;
    ADOQuery5Base_Reduzida_PIS4: TStringField;
    ADOQuery5Percentual_BC_Reduzida_PIS4: TStringField;
    ADOQuery5Base_Acrescida_PIS4: TStringField;
    ADOQuery5Percentual_BC_Acrescida_PIS4: TStringField;
    ADOQuery5Codigo_ST_PIS3_4: TStringField;
    ADOQuery5Descricao_ST_PIS3_4: TStringField;
    ADOQuery5Descricao_PIS5: TStringField;
    ADOQuery5Aliquota_PIS5: TStringField;
    ADOQuery5Tipo_Recolhimento_PIS5: TStringField;
    ADOQuery5Base_Reduzida_PIS5: TStringField;
    ADOQuery5Percentual_BC_Reduzida_PIS5: TStringField;
    ADOQuery5Base_Acrescida_PIS5: TStringField;
    ADOQuery5Percentual_BC_Acrescida_PIS5: TStringField;
    ADOQuery5Codigo_ST_PIS3_5: TStringField;
    ADOQuery5Descricao_ST_PIS3_5: TStringField;
    ADOQuery5Descricao_PIS6: TStringField;
    ADOQuery5Aliquota_PIS6: TStringField;
    ADOQuery5Tipo_Recolhimento_PIS6: TStringField;
    ADOQuery5Base_Reduzida_PIS6: TStringField;
    ADOQuery5Percentual_BC_Reduzida_PIS6: TStringField;
    ADOQuery5Base_Acrescida_PIS6: TStringField;
    ADOQuery5Percentual_BC_Acrescida_PIS6: TStringField;
    ADOQuery5Codigo_ST_PIS3_6: TStringField;
    ADOQuery5Descricao_ST_PIS3_6: TStringField;
    ADOQuery5Descricao_PIS7: TStringField;
    ADOQuery5Aliquota_PIS7: TStringField;
    ADOQuery5Tipo_Recolhimento_PIS7: TStringField;
    ADOQuery5Base_Reduzida_PIS7: TStringField;
    ADOQuery5Percentual_BC_Reduzida_PIS7: TStringField;
    ADOQuery5Base_Acrescida_PIS7: TStringField;
    ADOQuery5Percentual_BC_Acrescida_PIS7: TStringField;
    ADOQuery5Codigo_ST_PIS3_7: TStringField;
    ADOQuery5Descricao_ST_PIS3_7: TStringField;
    ADOQuery6: TADOQuery;
    ADOQuery6Descricao_COFINS1: TStringField;
    ADOQuery6Aliquota_COFINS1: TStringField;
    ADOQuery6Tipo_Recolhimento_COFINS1: TStringField;
    ADOQuery6Base_Reduzida_COFINS1: TStringField;
    ADOQuery6Percentual_BC_Reduzida_COFINS1: TStringField;
    ADOQuery6Base_Acrescida_COFINS1: TStringField;
    ADOQuery6Percentual_BC_Acrescida_COFINS1: TStringField;
    ADOQuery6Codigo_ST_COFINS1: TStringField;
    ADOQuery6Descricao_ST_COFINS1: TStringField;
    ADOQuery6Descricao_COFINS2: TStringField;
    ADOQuery6Aliquota_COFINS2: TStringField;
    ADOQuery6Tipo_Recolhimento_COFINS2: TStringField;
    ADOQuery6Base_Reduzida_COFINS2: TStringField;
    ADOQuery6Percentual_BC_Reduzida_COFINS2: TStringField;
    ADOQuery6Base_Acrescida_COFINS2: TStringField;
    ADOQuery6Percentual_BC_Acrescida_COFINS2: TStringField;
    ADOQuery6Codigo_ST_COFINS2: TStringField;
    ADOQuery6Descricao_ST_COFINS2: TStringField;
    ADOQuery6Descricao_COFINS3: TStringField;
    ADOQuery6Aliquota_COFINS3: TStringField;
    ADOQuery6Tipo_Recolhimento_COFINS3: TStringField;
    ADOQuery6Base_Reduzida_COFINS3: TStringField;
    ADOQuery6Percentual_BC_Reduzida_COFINS3: TStringField;
    ADOQuery6Base_Acrescida_COFINS3: TStringField;
    ADOQuery6Percentual_BC_Acrescida_COFINS3: TStringField;
    ADOQuery6Codigo_ST_COFINS3: TStringField;
    ADOQuery6Descricao_ST_COFINS3: TStringField;
    ADOQuery6Descricao_COFINS4: TStringField;
    ADOQuery6Aliquota_COFINS4: TStringField;
    ADOQuery6Tipo_Recolhimento_COFINS4: TStringField;
    ADOQuery6Base_Reduzida_COFINS4: TStringField;
    ADOQuery6Percentual_BC_Reduzida_COFINS4: TStringField;
    ADOQuery6Base_Acrescida_COFINS4: TStringField;
    ADOQuery6Percentual_BC_Acrescida_COFINS4: TStringField;
    ADOQuery6Codigo_ST_COFINS4: TStringField;
    ADOQuery6Descricao_ST_COFINS4: TStringField;
    ADOQuery6Descricao_COFINS5: TStringField;
    ADOQuery6Aliquota_COFINS5: TStringField;
    ADOQuery6Tipo_Recolhimento_COFINS5: TStringField;
    ADOQuery6Base_Reduzida_COFINS5: TStringField;
    ADOQuery6Percentual_BC_Reduzida_COFINS5: TStringField;
    ADOQuery6Base_Acrescida_COFINS5: TStringField;
    ADOQuery6Percentual_BC_Acrescida_COFINS5: TStringField;
    ADOQuery6Codigo_ST_COFINS5: TStringField;
    ADOQuery6Descricao_ST_COFINS5: TStringField;
    ADOQuery6Descricao_COFINS6: TStringField;
    ADOQuery6Aliquota_COFINS6: TStringField;
    ADOQuery6Tipo_Recolhimento_COFINS6: TStringField;
    ADOQuery6Base_Reduzida_COFINS6: TStringField;
    ADOQuery6Percentual_BC_Reduzida_COFINS6: TStringField;
    ADOQuery6Base_Acrescida_COFINS6: TStringField;
    ADOQuery6Percentual_BC_Acrescida_COFINS6: TStringField;
    ADOQuery6Codigo_ST_COFINS6: TStringField;
    ADOQuery6Descricao_ST_COFINS6: TStringField;
    ADOQuery6Descricao_COFINS7: TStringField;
    ADOQuery6Aliquota_COFINS7: TStringField;
    ADOQuery6Tipo_Recolhimento_COFINS7: TStringField;
    ADOQuery6Base_Reduzida_COFINS7: TStringField;
    ADOQuery6Percentual_BC_Reduzida_COFINS7: TStringField;
    ADOQuery6Base_Acrescida_COFINS7: TStringField;
    ADOQuery6Percentual_BC_Acrescida_COFINS7: TStringField;
    ADOQuery6Codigo_ST_COFINS7: TStringField;
    ADOQuery6Descricao_ST_COFINS7: TStringField;
    Label48: TLabel;
    EdtReboque: TEdit;
    EdtCodigo_Reboque: TEdit;
    EdtUF_Reboque: TEdit;
    TabSheet3: TTabSheet;
    MMOObservacao: TMemo;
    Label49: TLabel;
    TabSheet4: TTabSheet;
    PageControl2: TPageControl;
    TabSheet7: TTabSheet;
    MemoResp: TMemo;
    TabSheet8: TTabSheet;
    WBResposta: TWebBrowser;
    TabSheet9: TTabSheet;
    memoLog: TMemo;
    TabSheet10: TTabSheet;
    trvwNFe: TTreeView;
    TabSheet11: TTabSheet;
    memoRespWS: TMemo;
    Dados: TTabSheet;
    MemoDados: TMemo;
    BBtnImprimir_NFe: TToolButton;
    Label51: TLabel;
    EdtEmail: TEdit;
    ADOQuery2Origem: TIntegerField;
    BBtnEmail: TToolButton;
    OpenDialog1: TOpenDialog;
    ADOQuery1Codigo_Setor: TIntegerField;
    TabSheet5: TTabSheet;
    DBGrid1: TDBGrid;
    qryitens_nfCodigo_Registro: TAutoIncField;
    qryitens_nfCodigo: TIntegerField;
    qryitens_nfN_Item: TStringField;
    qryitens_nfCodigo_Produto: TIntegerField;
    qryitens_nfCodigo_Venda: TStringField;
    qryitens_nfNCM: TStringField;
    qryitens_nfOrigem: TStringField;
    qryitens_nfCFOP: TStringField;
    qryitens_nfUN: TStringField;
    qryitens_nfTipo_Calculo_BC_ICMS: TStringField;
    qryitens_nfTipo_Recolhimento: TStringField;
    qryitens_nfICMS: TStringField;
    qryitens_nfCST: TStringField;
    qryitens_nfBase_Reduzida: TStringField;
    qryitens_nfBC: TStringField;
    qryitens_nfValor_ICMS: TStringField;
    qryitens_nfTipo_Calculo_BC_ICMS_ST: TStringField;
    qryitens_nfMVAST: TStringField;
    qryitens_nfICMS_ST: TStringField;
    qryitens_nfCST_ST: TStringField;
    qryitens_nfBase_Reduzida_ST: TStringField;
    qryitens_nfBase_Acrescida_ST: TStringField;
    qryitens_nfBC_ST: TStringField;
    qryitens_nfAliquota_Calculo_Credito: TStringField;
    qryitens_nfCredito_ICMS: TStringField;
    qryitens_nfTipo_Calculo_IPI: TStringField;
    qryitens_nfIPI: TStringField;
    qryitens_nfCST_IPI: TStringField;
    qryitens_nfBase_Reduzida_IPI: TStringField;
    qryitens_nfBase_Acrescida_IPI: TStringField;
    qryitens_nfBC_IPI: TStringField;
    qryitens_nfValor_IPI: TFloatField;
    qryitens_nfTipo_Calculo_PIS: TStringField;
    qryitens_nfPIS: TStringField;
    qryitens_nfCST_PIS: TStringField;
    qryitens_nfBase_Reduzida_PIS: TStringField;
    qryitens_nfBase_Acrescida_PIS: TStringField;
    qryitens_nfBC_PIS: TStringField;
    qryitens_nfValor_PIS: TFloatField;
    qryitens_nfTipo_Calculo_COFINS: TStringField;
    qryitens_nfCOFINS: TStringField;
    qryitens_nfCST_COFINS: TStringField;
    qryitens_nfBase_Reduzida_COFINS: TStringField;
    qryitens_nfBase_Acrescida_COFINS: TStringField;
    qryitens_nfBC_COFINS: TStringField;
    qryitens_nfValor_COFINS: TFloatField;
    qryitens_nfQtde: TFloatField;
    qryitens_nfQtde_Entregue: TFloatField;
    qryitens_nfQtde_Restante: TFloatField;
    qryitens_nfQtde_S_Previsao: TFloatField;
    qryitens_nfValor_Original: TFloatField;
    qryitens_nfValor_Unitario: TFloatField;
    qryitens_nfDesc_Acr: TFloatField;
    qryitens_nfDesc_Acr_P: TFloatField;
    qryitens_nfTipo_Desc_Acr: TStringField;
    qryitens_nfdOUa: TStringField;
    qryitens_nfValor_Frete: TFloatField;
    qryitens_nfValor_Seguro: TFloatField;
    qryitens_nfOutras_Despesas: TFloatField;
    qryitens_nfSub_Total: TFloatField;
    qryitens_nfSub_Total_Liquido: TFloatField;
    qryitens_nfCancelado: TStringField;
    qryitens_nfIndica_Valor_Total: TStringField;
    qryitens_nfData_Entrega: TDateTimeField;
    qryitens_nfHora_Entrega: TStringField;
    qryitens_nfTipo_Venda: TStringField;
    qryitens_nfTipo_Entrega: TStringField;
    qryitens_nfComissao: TFloatField;
    qryitens_nfInsc_Municipal: TStringField;
    qryitens_nfEmail: TStringField;
    qryitens_nfSuframa: TStringField;
    qryitens_nfEnquadramento: TStringField;
    qryitens_nfCidade: TStringField;
    qryitens_nfUF: TStringField;
    qryitens_nfCodigo_Municipio: TStringField;
    qryitens_nfSetor: TStringField;
    qryitens_nfLog: TStringField;
    qryitens_nfCEP: TStringField;
    qryitens_nfNumero: TStringField;
    qryitens_nfComplemento: TStringField;
    qryitens_nfTelefone: TStringField;
    qryitens_nfForma_Pagamento: TStringField;
    qryitens_nfQtde_Parcela: TIntegerField;
    qryitens_nfPrazo: TIntegerField;
    qryitens_nfTaxa: TFloatField;
    qryitens_nfCodigo_Forma_Pagamento: TIntegerField;
    qryitens_nfForma_Pagamento_1: TStringField;
    qryitens_nfNome: TStringField;
    qryitens_nfCPF_CNPJ: TStringField;
    qryitens_nfCod_Cli: TIntegerField;
    qryitens_nfPerc_Desc_Vista: TFloatField;
    qryitens_nfPerc_Desc_Prazo: TFloatField;
    qryitens_nfPermite_Credito: TIntegerField;
    qryitens_nfCodigo_Obs_Fiscal: TIntegerField;
    qryitens_nfEstoque: TFloatField;
    qryitens_nfVolume: TFloatField;
    qrypedido_pendente: TADOQuery;
    DataSource3: TDataSource;
    Timer1: TTimer;
    qryitens_nfDescricao: TStringField;
    BBtnConsultar: TToolButton;
    LblStatus: TLabel;
    CmbStatus: TDBLookupComboBox;
    qryitens_nfQtde_Estoque_Atual: TFloatField;
    BBtnComprovante_Entrega: TToolButton;
    RGFinalidade: TRadioGroup;
    GroupBox1: TGroupBox;
    btnLocalizar: TButton;
    DBGridReferenciaDevolucao: TDBGrid;
    dtReferenciaDevolucao: TDataSource;
    BBtnGerar_Carne: TToolButton;
    Panel5: TPanel;
    MemoDadosSistema: TMemo;
    Panel4: TPanel;
    BBtnNovo: TToolButton;
    qryitens_nfValor_Compra_Nota: TFloatField;
    qryitens_nfFicha_Estoque_Codigo: TIntegerField;
    qryitens_nfTipo_Pagamento: TStringField;
    qrypedido_pendenteCodigo: TIntegerField;
    qrypedido_pendenteN_Pedido: TStringField;
    qrypedido_pendenteData_Venda: TDateTimeField;
    qrypedido_pendenteTotal_Pedido: TFloatField;
    qrypedido_pendenteCodCli: TIntegerField;
    qrypedido_pendenteNome_Nome_Fantasia: TStringField;
    qrypedido_pendenteRazao_Social: TStringField;
    qrypedido_pendenteEmail: TStringField;
    qrypedido_pendenteEndereco: TStringField;
    qrypedido_pendenteStatus: TStringField;
    qrypedido_pendenteTipo: TStringField;
    qrypedido_pendenteCPF: TStringField;
    qrypedido_pendenteCNPJ: TStringField;
    qrypedido_pendenteCodigo_Municipio: TStringField;
    qryitens_nfValor_Compra_Atual: TFloatField;
    BBtnGerarNFe: TToolButton;
    qrypedido_pendenteTotal_Produtos: TFloatField;
    qrypedido_pendenteDesc_Acr: TFloatField;
    cbVisualizarDANFE: TCheckBox;
    qryitens_nfValor_ICMS_ST: TFloatField;
    DataSource4: TDataSource;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1NDoc: TStringField;
    ClientDataSet1Data: TDateField;
    ClientDataSet1Valor: TFloatField;
    cxPropertiesStore1: TcxPropertiesStore;
    qryitens_nfCSOSN: TStringField;
    qryitens_nfInscricao_Estadual: TStringField;
    cxEditRepository1: TcxEditRepository;
    cxEditRepository1CheckBoxItem1: TcxEditRepositoryCheckBoxItem;
    qrypedido_pendenteTipoVenda: TStringField;
    qrypedido_pendenteCOO: TStringField;
    PageControl3: TPageControl;
    TabSheet12: TTabSheet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Codigo: TcxGridDBColumn;
    cxGrid1DBTableView1N_Pedido: TcxGridDBColumn;
    cxGrid1DBTableView1Data_Venda: TcxGridDBColumn;
    cxGrid1DBTableView1Total_Pedido: TcxGridDBColumn;
    cxGrid1DBTableView1CodCli: TcxGridDBColumn;
    cxGrid1DBTableView1Nome_Nome_Fantasia: TcxGridDBColumn;
    cxGrid1DBTableView1Razao_Social: TcxGridDBColumn;
    cxGrid1DBTableView1Email: TcxGridDBColumn;
    cxGrid1DBTableView1Endereco: TcxGridDBColumn;
    cxGrid1DBTableView1Status: TcxGridDBColumn;
    cxGrid1DBTableView1Tipo: TcxGridDBColumn;
    cxGrid1DBTableView1CPF: TcxGridDBColumn;
    cxGrid1DBTableView1CNPJ: TcxGridDBColumn;
    cxGrid1DBTableView1Codigo_Municipio: TcxGridDBColumn;
    cxGrid1DBTableView1Total_Produtos: TcxGridDBColumn;
    cxGrid1DBTableView1Desc_Acr: TcxGridDBColumn;
    cxGrid1DBTableView1TipoVenda: TcxGridDBColumn;
    cxGrid1DBTableView1COO: TcxGridDBColumn;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1Column1: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    TabSheet13: TTabSheet;
    Label9: TLabel;
    Label13: TLabel;
    EdtCodigo_Obs_Fiscal: TEdit;
    MMOPedido: TMemo;
    BtnConfirmar: TcxButton;
    DBGrid4: TDBGrid;
    BtnGerarParcela: TcxButton;
    BtnAnular: TcxButton;
    Memo1: TMemo;
    Label14: TLabel;
    MMOCOO: TMemo;
    BtnExcluirParcela: TcxButton;
    Label17: TLabel;
    ClientDataSet1Status: TStringField;
    ClientDataSet1ValorTeste: TAggregateField;
    LblValor: TLabel;
    lblValorParcelas: TLabel;
    ClientDataSet1DataPagamento: TDateField;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Label16: TLabel;
    MEdtData_Primeiro_Vencimento: TMaskEdit;
    EdtCodigo_Condicao_Pagamento: TEdit;
    EdtCondicao_Pagamento: TEdit;
    GBInformarPagamento: TGroupBox;
    BtnInformar_Pagamento: TButton;
    DBGrid2: TDBGrid;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtData_EmissaoEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtCodigo_EmitenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_CFOPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtN_Nota_FiscalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_Logradouro_RetiradaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Setor_RetiradaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Municipio_RetiradaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_DestinatarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_TransportadoraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_VeiculoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBRetiradaClick(Sender: TObject);
    procedure CBEntregaClick(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure EdtCodigo_NCMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_CFOP_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ToolButton1Click(Sender: TObject);
    procedure EdtCFOP_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtNumero_RetiradaExit(Sender: TObject);
    procedure EdtComplemento_RetiradaExit(Sender: TObject);
    procedure MEdtCNPJ_RetiradaExit(Sender: TObject);
    procedure EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_UnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_Frete_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_Seguro_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDesconto_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtOutras_Despesas_ProdutoKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtBC_ICMSKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_ICMS_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_IPI_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAliquota_ICMSKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAliquota_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure EdtBase_Calculo_ICMSKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_ICMSKeyPress(Sender: TObject; var Key: Char);
    procedure EdtBase_Calculo_ICMS_SubstituicaoKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtValor_ICMS_SubstituicaoKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtValor_Total_ProdutosKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_FreteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_SeguroKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDesconto_NotaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_Total_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_Total_PISKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_Total_COFINSKeyPress(Sender: TObject; var Key: Char);
    procedure EdtOutras_DespesasKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_Total_NotaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_Total_ServicosKeyPress(Sender: TObject; var Key: Char);
    procedure EdtBase_Calculo_ISSQNKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_ISSQNKeyPress(Sender: TObject; var Key: Char);
    procedure EdtQuantidade_TransportadaKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtPeso_BrutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPeso_LiquidoKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtValor_TotalEnter(Sender: TObject);
    procedure EdtValor_Frete_ProdutoExit(Sender: TObject);
    procedure EdtValor_Seguro_ProdutoExit(Sender: TObject);
    procedure EdtDesconto_ProdutoExit(Sender: TObject);
    procedure EdtOutras_Despesas_ProdutoExit(Sender: TObject);
    procedure EdtValor_UnitarioExit(Sender: TObject);
    procedure MEdtData_Entrada_SaidaEnter(Sender: TObject);
    procedure MEdtHora_Entrada_SaidaEnter(Sender: TObject);
    procedure EdtPeso_BrutoExit(Sender: TObject);
    procedure EdtPeso_LiquidoExit(Sender: TObject);
    procedure EdtValor_PIS_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_COFINS_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtBC_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure EdtBC_PISKeyPress(Sender: TObject; var Key: Char);
    procedure EdtBC_COFINSKeyPress(Sender: TObject; var Key: Char);
    procedure EdtOutras_Despesas_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtValor_ICMS_ProdutoExit(Sender: TObject);
    procedure EdtCodigo_ReboqueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_CFOPKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCFOPKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_EmitenteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtEmitenteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_DestinatarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDestinatarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnAssinarClick(Sender: TObject);
    procedure BBtnValidarClick(Sender: TObject);
    procedure BBtnEnviarClick(Sender: TObject);
    procedure BBtnImprimir_NFeClick(Sender: TObject);
    procedure EdtValor_Total_BrutoExit(Sender: TObject);
    procedure EdtValor_Total_BrutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_Total_BrutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_CSOSNKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCSOSNKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CSOSNKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure EdtCSTExit(Sender: TObject);
    procedure BtnVoltarClick(Sender: TObject);
    procedure BtnAvancarClick(Sender: TObject);
    procedure EdtPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnEmailClick(Sender: TObject);
    procedure EdtCodigo_Obs_FiscalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtN_Nota_FiscalKeyPress(Sender: TObject; var Key: Char);
    procedure Mensagem_Erro(Mensagem: String);
    procedure EdtCOOExit(Sender: TObject);
    procedure EdtCodigo_Obs_FiscalDblClick(Sender: TObject);
    procedure EdtCodigo_EmitenteDblClick(Sender: TObject);
    procedure EdtCodigo_DestinatarioDblClick(Sender: TObject);
    procedure EdtCodigo_Logradouro_RetiradaDblClick(Sender: TObject);
    procedure EdtCodigo_Setor_RetiradaDblClick(Sender: TObject);
    procedure EdtCodigo_Municipio_RetiradaDblClick(Sender: TObject);
    procedure EdtCodigo_TransportadoraDblClick(Sender: TObject);
    procedure EdtCodigo_VeiculoDblClick(Sender: TObject);
    procedure EdtCodigo_ReboqueDblClick(Sender: TObject);
    procedure EdtTransportadoraKeyPress(Sender: TObject; var Key: Char);
    procedure EdtVeiculoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtUF_VeiculoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtReboqueKeyPress(Sender: TObject; var Key: Char);
    procedure EdtUF_ReboqueKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Condicao_PagamentoDblClick(Sender: TObject);
    procedure EdtCodigo_Condicao_PagamentoExit(Sender: TObject);
    procedure EdtCodigo_Obs_FiscalExit(Sender: TObject);
    procedure qryitens_nfAfterEdit(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure BBtnConsultarClick(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure BBtnComprovante_EntregaClick(Sender: TObject);
    procedure MEdtHora_Entrada_SaidaDblClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGridReferenciaDevolucaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RGFinalidadeClick(Sender: TObject);
    procedure MEdtData_EmissaoExit(Sender: TObject);
    procedure BBtnGerar_CarneClick(Sender: TObject);
    procedure ACBrNFe1StatusChange(Sender: TObject);
    procedure DBGrid3TitleClick(Column: TColumn);
    procedure DBGrid3ColExit(Sender: TObject);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure BBtnNovoClick(Sender: TObject);
    procedure MEdtData_Entrada_SaidaExit(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BBtnGerarNFeClick(Sender: TObject);
    procedure BtnInformar_PagamentoClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure BtnAnularClick(Sender: TObject);
    procedure BtnGerarParcelaClick(Sender: TObject);
    procedure BtnExcluirParcelaClick(Sender: TObject);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1DataControllerFilterChanged(Sender: TObject);
    procedure EdtCodigo_Condicao_PagamentoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure ClientDataSet1AfterPost(DataSet: TDataSet);
    procedure ClientDataSet1DataPagamentoGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure ClientDataSet1BeforePost(DataSet: TDataSet);
    procedure CMBTipo_NotaChange(Sender: TObject);
  private
    // Itens_NF: URegistro.TItens_NFE;
    NF: URegistro.TNFE;
    Emitente: URegistro.TEmitente_NFE;
    Destinatario: URegistro.TDestinatario_NFE;
    Local_Entrega: URegistro.TLocal_Entrega_NFE;
    Local_Retirada: URegistro.TLocal_Retirada_NFE;
    Transporte: URegistro.TTransporte_NFE;
    Imposto_NF: URegistro.TImpostos_NFE;
    FFormConsultaNFParaReferencia: TformConsultaNFParaReferencia;
    // Imposto_ISSQN: URegistro.TImpostos_ISSQN_NFE;
    FPedidosWhere, FPedidosNormal, FCOO: String;
    Util: TUtil;
    qtde, item: Integer;
    qicms, qipi, qpis, qcofins, qAux, qAux2: TADOQuery;
    iniciado, exclui: Boolean;

    FReferenciaDevolucaoQuery: TADOQuery;
    FNFEDominio: INFEDominio;

    FDataEmissao: TDateTime;
    TemCreditoDisponivel: Boolean;

    FCliente: TClienteEntidade;
    FClienteDom: TClienteDominio;
    oLF: TLancamentoFinanceiroEntidade;
    oPLF: TParcelasLancamentoFinanceiroEntidade;
    oCli: TClienteEntidade;
    oCP: TCondicaoPagamentoEntidade;
    oCPDominio: TCondicaoPagamentoDominio;
    DadosEmissaoNFEItens: TDadosEmissaoNFEItens;
    DadosEmissaoNFEPagamento: TDadosEmissaoNFEPagamento;
    Impresso: boolean;

    procedure GeraNFe;

    procedure Verifica_Nota_Ja_Emitida;
    procedure Escreve_Produto;
    procedure Escreve_Imposto;
    procedure Atualiza_Produto;
    procedure Atualiza_Itens_NFe;
    procedure Calcula_Imposto_Final;
    procedure Pega_ICMS;
    procedure Pega_IPI;
    procedure Pega_PIS;
    procedure Pega_COFINS;
    function Confira: Boolean;
    function Confira_Itens: Boolean;

    procedure Pega_ICMS_Item;
    procedure Pega_IPI_Item;
    procedure Pega_PIS_Item;
    procedure Pega_COFINS_Item;
    procedure RetornoNFe;
    procedure Escreve_Alertas(Alerta: AnsiString);
    procedure Escreve_Alerta_Principal;
    procedure Escreve_Alerta_Geral;
    procedure Pega_Codigo_Forma_Pagamento(Forma: Integer);
    procedure Gera_Financeiro;
    procedure Gera_Parcelas;
    procedure Pega_Condicao_Codigo;
    procedure Pega_Obs_Codigo;
    procedure Pega_Dados_Destinatario;
    function Pega_Obs_Fiscal(Codigo_Obs: Integer): AnsiString;
    procedure Atualiza_Pedido_Pendente;
    procedure Atualiza_Dados_OS;
    procedure Atualiza_Status_OS;
    procedure Atualiza_CFOP_Pedido(Pedido, CFOP: Integer);
    procedure Calcula_Imposto_Lei;
    procedure Gera_Estoque;
    // procedure Gera_Financeiro;
    procedure adicionarFinalidade;
    procedure adicionarReferenciaDevolucaoACBR(NFref: TNFrefCollection);
    procedure habilitarReferenciaDevolucao(habilitar: Boolean);
    procedure salvarFichaEstoque;
    procedure Verifica_Credito_Cliente;
    procedure Atualiza_CFOP;
    function ImprimeVendaTEF: Boolean;
  public
    ativo, passa, enderec: Boolean;
    valor_compra, pis, cofins, valor_bc_red, valor_bc_acre, valor_bc_red_ipi,
      valor_bc_acre_ipi, valor_bc_red_pis, valor_bc_acre_pis,
      valor_bc_red_cofins, valor_bc_acre_cofins, valor_tributavel,
      taxaCondicaoPagamento: double;

    base_acre, base_red, base_acre_ipi, base_red_ipi, base_acre_pis,
      base_red_pis, base_acre_cofins, base_red_cofins, csosn, CFOP,
      codigoCondicaoPagamento, descricaoCondicaoPagamento: AnsiString;
    regra_icms, veiculo, gera_fi, mostra_imposto, controla_estoque, estoque,
      qtdeParcela, prazoPagamento: Integer;

    tipoPagamento: string;

    var_uni, novo_valor_uni, total_limite, total_valor_uni, perc_desc,
      perc_desc_prazo, perc_vista, perc_prazo, des_p, des_p_aux,
      des_p_ant: double;

    tipo_pag: AnsiString;

    cod_produto: Integer;
    cod_pro, descri, IAT, IPPT, unid: AnsiString;

    codigo_forma_pagamento, taxa_juro, qtde_parcela, prazo,
      forma_pagamento_selecionado: Integer;
    forma_pagamento, tipo_juro, tipo_pagamento: AnsiString;
    taxa: double;

    DadosEmissaoNFE: TDadosEmissaoNFE;
    DadosEmissaoNFERecebimento: TDadosEmissaoNFERecebimento;

    ETEF, ValorTEF: AnsiString;
    procedure Verifica_CSOSN;
    procedure Verifica_CST;
  end;

var
  FrmNFE: TFrmNFE;

implementation

uses UChama_Fornecedor, UChama_CFOP, UDeclaracao, UChama_Produto, UDM,
  UChama_Logradouro, UChama_Setor, UChama_Cidade, UChama_Empresa,
  UChama_Cliente, UChama_Veiculo, UChama_NCM,
  UChama_Transportadora, UChama_Situacao_Tributaria, UChama_Observacao_Fiscal,
  UChama_Condicao_Pagamento, UChama_DAV_Converter, URel_Comprovante_Entrega,
  Util.TLog, Modelo.Dominio.NFE.TNFEDominio,
  Modelo.Entidade.estoque.TFichaEstoque, URel_Carne, UStatus_NFE,
  Util.Mensagens,
  Util.GeradorDeCodigo, UGerar_Documentos, pcnConversaoNFe,
  UFechamento_Venda_PDV, UMensagem_Erro_Impressora_TEF;
{$R *.dfm}
{ TFrmPadrao }

procedure TFrmNFE.Atualiza_Produto;
var
  ped: AnsiString;
begin
  try
    TLog.Info('--- ENTROU DO MÉTODO Atualiza_Produto ---');
    // ped := StringOfChar('0', 12 - Length(EdtPedido.Text)) + EdtPedido.Text;
    // EdtPedido.Text := ped;

    Atualiza_Itens_NFe;
    Atualiza_CFOP;

    { if (qryitens_nf.IsEmpty) then begin
      Application.MessageBox('Número do pedido não encontrado. Por favor, verifique se o mesmo já foi faturado ou ainda não foi convertido em venda.', 'Pedido não encontrado', MB_OK+MB_ICONHAND);
      EdtPedido.SetFocus;
      passa:= false;
      abort;
      end else begin }
    passa := true;
    Calcula_Imposto_Final;
    Pega_Dados_Destinatario;
    // end;
  except
    on E: Exception do
      TLog.Error(Self.ClassName + ' - Atualiza_Produto - ' + E.Message);
  end;
end;

function TFrmNFE.ImprimeVendaTEF: Boolean;
begin
  try
    Impresso := false;
    den_op:= 'CC';
    Tipo_Rel:= 1;
    while not Impresso do
    begin
      //TLog.Debug('Vai abrir janela para mostrar mensagem: Imprimindo Cupom TEF.');
      //Application.CreateForm(TFrmMensagem_TEF, FrmMensagem_TEF);
      //FrmMensagem_TEF.Show;
      //TLog.Debug('Abriu janela para mostrar mensagem: Imprimindo Cupom TEF.');
      if not ImprimeTransacaoTEF(1, 2, ValorTEF, '', '') then
      begin
        //chama o form da mensagem
        Application.CreateForm(TFrmMensagem_Erro_Impressora_TEF, FrmMensagem_Erro_Impressora_TEF);
        FrmMensagem_Erro_Impressora_TEF.ShowModal;
        if (FrmMensagem_Erro_Impressora_TEF.confirma = false) then
        begin
          Result := false;
          NaoConfirmaTransacao;
          ApagaArquivosTEF;
          DeleteFile(ArqTemp);
          //Deleta_Bandeira_Pendente;
          Impresso := true;
          Aberto:= 0;
        end
        else
        begin
          BlockInput(true);
          TLog.Debug('Bloqueou teclado/mouse para imprimir o Relatório Gerencial.');
          Result := false;
          Impresso := false;
          den_op:= 'RG';
          Tipo_Rel:= 1;
          //Aberto:= 1;
        end;
      end
      else
      begin
        ConfirmaTransacao;
        ApagaArquivosTEF;
        //Deleta_Bandeira_Pendente;
        DeleteFile(ArqTemp);
        BlockInput(false);
        TLog.Debug('Desbloqueou mouse e teclado.');
        Aberto:= 0;
        Result := true;
        Impresso := true;

//        Coleta_Dados_R06;

//        R06.Inserir_Outros(R06);
        //R06.Inserir_Outros_Aux(R06);
      end;
    end;
  except on E:Exception do
  begin
    TLog.Error('Erro em ImprimeVendaTEF: '+e.Message);
  end;

  end;
end;

procedure TFrmNFE.Pega_Dados_Destinatario;
begin
  TLog.Info('--- ENTROU NO MÉTODO Pega_Dados_Destinatario :');
  FrmNFE.EdtCodigo_Destinatario.Text := qryitens_nfCod_Cli.AsString;
  FrmNFE.EdtDestinatario.Text := qryitens_nfNome.AsString;

  { EdtCodigo_Condicao_Pagamento.Text :=
    qryitens_nfCodigo_Forma_Pagamento.AsString;
    EdtCondicao_Pagamento.Text := qryitens_nfForma_Pagamento.AsString; }

  cnpj_destinatario := qryitens_nfCPF_CNPJ.AsString;

  razao_social_destinatario := qryitens_nfNome.AsString;
  endereco_destinatario := qryitens_nfLog.AsString;
  numero_destinatario := qryitens_nfNumero.AsString;
  complemento_destinatario := qryitens_nfComplemento.AsString;
  setor_destinatario := qryitens_nfSetor.AsString;
  codigo_municipio_destinatario :=
    Trim(qryitens_nfCodigo_Municipio.AsString);
  municipio_destinatario := qryitens_nfCidade.AsString;
  uf_destinatario := qryitens_nfUF.AsString;
  telefone_destinatario := qryitens_nfTelefone.AsString;
  ie_destinatario := qryitens_nfInscricao_Estadual.AsString;
  im_destinatario := qryitens_nfInsc_Municipal.AsString;
  cep_destinatario := qryitens_nfCEP.AsString;
  email_destinatario := qryitens_nfEmail.AsString;
  suframa_destinatario := qryitens_nfSuframa.AsString;
  enquadramento := qryitens_nfEnquadramento.AsString;
  TLog.Info('--- FIM DO MÉTODO Pega_Dados_Destinatario :');
end;

procedure TFrmNFE.BBtnAssinarClick(Sender: TObject);
begin
  {try
    try
      dm.ACBrNFe1.NotasFiscais.Assinar;
      ACBrNFe1.NotasFiscais.SaveToFile;
      ShowMessage('Arquivo gerado em: ' + ACBrNFe1.NotasFiscais.Items
        [0].NomeArq);
      MemoDados.Lines.Add('Arquivo gerado em: ' + ACBrNFe1.NotasFiscais.Items
        [0].NomeArq);
      MemoResp.Lines.LoadFromFile(ACBrNFe1.NotasFiscais.Items[0].NomeArq);
    except
      on E: Exception do
        TLog.Error(Self.ClassName + ' - BBtnAssinarClick - ' + E.Message);
    end;
  finally
    // BBtnEnviar.Enabled:= true;
    BBtnGerar_Carne.Enabled := false;
  end;}
end;

procedure TFrmNFE.BBtnCancelarClick(Sender: TObject);
begin
  // Itens_NF.Excluir_Tudo;
  Util.Limpa_Campos(FrmNFE);
  Util.Desabilita_Campos(FrmNFE);
  qryitens_nf.Close;
  BBtnSalvar.Enabled := false;
  // BBtnValidar.Enabled:= false;
  // BBtnAssinar.Enabled:= false;
  // BBtnEnviar.Enabled:= false;
  BBtnImprimir_NFe.Enabled := false;
  iniciado := false;
end;

procedure TFrmNFE.BBtnComprovante_EntregaClick(Sender: TObject);
begin
  try
    FrmRel_Comprovante_Entrega := TFrmRel_Comprovante_Entrega.create(Self);
    FrmRel_Comprovante_Entrega.Release;
    FrmRel_Comprovante_Entrega := Nil;
  except
    on E: Exception do
      TLog.Error(Self.ClassName + ' - BBtnComprovante_EntregaClick - ' +
        E.Message);
  end;
end;

procedure TFrmNFE.BBtnConsultarClick(Sender: TObject);
var
  estoque: double;
begin
  try
    OpenDialog1.Title := 'Selecione a NFE';
    OpenDialog1.DefaultExt := '*-nfe.XML';
    OpenDialog1.Filter :=
      'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
    OpenDialog1.InitialDir := dm.ACBrNFe1.Configuracoes.Arquivos.PathSalvar;
    if OpenDialog1.Execute then
    begin
      dm.ACBrNFe1.NotasFiscais.Clear;
      dm.ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);
      dm.ACBrNFe1.Consultar;

      if (dm.ACBrNFe1.WebServices.Consulta.cStat = 100) then
      begin
        if (CMBTipo_Nota.ItemIndex = 0) then
        begin
          Grava_N_NFe(StrToInt(EdtN_Nota_Fiscal.Text));
          EdtChave_Acesso.Text := dm.ACBrNFe1.WebServices.Consulta.NFeChave;
          Atualiza_NFe_Banco(EdtChave_Acesso.Text, '', EdtN_Nota_Fiscal.Text,
            'NFE', 'PAGO', qryitens_nfCodigo.AsInteger,
            StrToDateTime(MEdtData_Emissao.Text), dm.ADOConnection1);
        end
        else
        begin
          Grava_N_NFCe(StrToInt(EdtN_Nota_Fiscal.Text));
          EdtChave_Acesso.Text := dm.ACBrNFe1.WebServices.Consulta.NFeChave;
          Atualiza_NFCe_Banco(EdtChave_Acesso.Text, '', EdtN_Nota_Fiscal.Text,
            'NFCE', 'PAGO', qryitens_nfCodigo.AsInteger,
            StrToDateTime(MEdtData_Emissao.Text), dm.ADOConnection1);
        end;
        // Atualiza_Status_NFe(qryitens_nfCodigo.AsInteger, 'PAGO', 'NFE');

        BBtnSalvar.Enabled := false;
        // BBtnValidar.Enabled:= false;
        // BBtnAssinar.Enabled:= false;
        // BBtnEnviar.Enabled:= false;
        BBtnImprimir_NFe.Enabled := true;
        BBtnEmail.Enabled := true;
        BBtnConsultar.Enabled := false;
        iniciado := false;

        NF.Inserir;
        Destinatario.Inserir;
        Emitente.Inserir;
        Local_Entrega.Inserir;
        Local_Retirada.Inserir;
        Transporte.Inserir;
        Imposto_NF.Inserir;
        Atualiza_Pedido_Pendente;

        if (gerar_financeiro = 1) then
        begin
          if (EdtCodigo_Condicao_Pagamento.Text <> '') and
            (MEdtData_Primeiro_Vencimento.Text <> '  /  /    ') then
            Gera_Financeiro;
        end;

        if (gerar_estoque = 1) then
        begin
          qryitens_nf.First;
          while not qryitens_nf.Eof do
          begin
            Atualiza_Estoque_Itens_Pedido(qryitens_nfCodigo_Produto.AsInteger,
              qryitens_nfCodigo.AsInteger, qryitens_nfQtde.AsFloat,
              dm.ADOConnection1);

            estoque := qryitens_nfEstoque.AsFloat - qryitens_nfQtde.AsFloat;

            Atualiza_Saldo_Estoque(dm.ADOConnection1, qryitens_nfCodigo_Produto.AsInteger,
              qryitens_nfValor_Compra_Atual.AsFloat * estoque);
            Atualiza_Estoque(dm.ADOConnection1, estoque, qryitens_nfCodigo_Produto.AsInteger);
            Atualiza_Volume(dm.ADOConnection1, estoque * qryitens_nfVolume.AsFloat,
              qryitens_nfCodigo_Produto.AsInteger);
            qryitens_nf.next;
          end;

          Cria_Arquivo_Atualiza_Dados('AProd');
          Atualiza_Produto;
        end;

        RetornoNFe;
        Application.MessageBox(PChar('Processo concluido com sucesso.' + #10 +
          #13 + #10 + #13 + 'Código Status: ' +
          IntToStr(dm.ACBrNFe1.WebServices.Consulta.cStat) + #10 + #13 + 'Motivo: '
          + dm.ACBrNFe1.WebServices.Consulta.xMotivo + #10 + #13 +
          // 'Mensagem: '+ ACBrNFe1.WebServices.Consulta.xMsg + #10+#13 +
          'Protocolo: ' + dm.ACBrNFe1.WebServices.Consulta.Protocolo),
          'Mensagem da NFe', MB_OK + MB_ICONQUESTION);
      end
      else
      begin
        Application.MessageBox(PChar('Houve um erro na consulta da Nfe.' + #10 +
          #13 + #10 + #13 + 'Código Status: ' +
          IntToStr(dm.ACBrNFe1.WebServices.Consulta.cStat) + #10 + #13 + 'Motivo: '
          + dm.ACBrNFe1.WebServices.Consulta.xMotivo + #10 + #13 +
          // 'Mensagem: '+ ACBrNFe1.WebServices.Consulta.xMsg + #10+#13 +
          'Protocolo: ' + dm.ACBrNFe1.WebServices.Consulta.Protocolo),
          'Mensagem da NFe', MB_OK + MB_ICONHAND);
        RetornoNFe;
        BBtnSalvar.Enabled := true;
        // BBtnValidar.Enabled:= false;
        // BBtnAssinar.Enabled:= false;
        // BBtnEnviar.Enabled:= false;
        BBtnImprimir_NFe.Enabled := false;
        BBtnEmail.Enabled := false;
        BBtnConsultar.Enabled := false;
        iniciado := true;
      end;

    end;
  except
    on E: Exception do
      TLog.Error(Self.ClassName + ' - BBtnConsultarClick - ' + E.Message);

  end;
end;

procedure TFrmNFE.BBtnEmailClick(Sender: TObject);
var
  TextoEmail, Assunto: String;
  CC: Tstrings;
begin
  if (EdtEmail.Text = '') then
  begin
    TMensagens.MensagemErro('Por favor, informe o email para enviar.');
    PageControl1.TabIndex := 4;
    EdtEmail.SetFocus;
    abort;
  end;

  if not(InputQuery('Enviar Email', 'Assunto do Email', Assunto)) then
    exit;

  OpenDialog1.Title := 'Selecione a NFE';
  OpenDialog1.DefaultExt := '*-nfe.XML';
  OpenDialog1.Filter :=
    'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := dm.ACBrNFe1.Configuracoes.Arquivos.PathSalvar;
  if OpenDialog1.Execute then
  begin
    try
      dm.ACBrNFe1.NotasFiscais.Clear;
      dm.ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);
      CC := TstringList.create;
      // CC.Add('andrefmoraes@gmail.com'); //especifique um email vÃ¡lido
      // CC.Add('anfm@zipmail.com.br');    //especifique um email vÃ¡lido

      dm.ACBrMail1.Host := smtp;
      dm.ACBrMail1.Port := portasmtp;
      dm.ACBrMail1.Username := email;
      dm.ACBrMail1.Password := senhaemail;
      dm.ACBrMail1.From := email;
      dm.ACBrMail1.SetSSL := true; // SSL - ConexÃ£o Segura
      dm.ACBrMail1.SetTLS := false; // Auto TLS
      dm.ACBrMail1.ReadingConfirmation := false;
      // Pede confirmaÃ§Ã£o de leitura do email
      dm.ACBrMail1.UseThread := false; // Aguarda Envio do Email(nÃ£o usa thread)
      dm.ACBrMail1.FromName := email;

      dm.ACBrNFe1.NotasFiscais.Items[0].EnviarEmail(EdtEmail.Text, Assunto,
        Memo1.Lines, true // Enviar PDF junto
        , CC // Lista com emails que serÃ£o enviado cÃ³pias - TStrings
        , nil); // Lista de anexos - TStrings
      // ACBrNFe1.NotasFiscais.Items[0].EnviarEmail(smtp // edtSmtpHost.Text
      // , portasmtp // edtSmtpPort.Text
      // , email // edtSmtpUser.Text
      // , senhaemail // edtSmtpPass.Text
      // , email // edtSmtpUser.Text
      // , EdtEmail.Text, Assunto // edtEmailAssunto.Text
      // , Memo1.Lines
      // // MemoDados.Lines //'Segue em anexo o XML solicitado'//mmEmailMsg.Lines
      // , true // cbEmailSSL.Checked // SSL - Conexão Segura
      // , true // Enviar PDF junto
      // , CC // Lista com emails que serão enviado cópias - TStrings
      // , nil // Lista de anexos - TStrings
      // , false // Pede confirmação de leitura do email
      // , false // Aguarda Envio do Email(não usa thread)
      // , nome_fantasia // Nome do Rementente
      // , true); // cbEmailSSL.Checked ); // Auto TLS
      CC.Free;
      TMensagens.MensagemInformacao('Email enviado com sucesso');
    except
      on E: Exception do
      begin
        TLog.Error(Self.ClassName + ' - BBtnEmailClick - ' + E.Message);
        TMensagens.MensagemErro('Email NÃO enviado.');
      end;
    end;
  end;
end;

procedure TFrmNFE.RetornoNFe;
begin
  MemoDados.Clear;
  PageControl1.TabIndex := 5;
  PageControl2.TabIndex := 5;
  MemoDados.Lines.Add('');
  MemoDados.Lines.Add('Resultado da NFe');
  MemoDados.Lines.Add('Ambiente        : ' +
    TpAmbToStr(dm.ACBrNFe1.WebServices.Retorno.TpAmb));
  MemoDados.Lines.Add('Versão Aplicação: ' +
    dm.ACBrNFe1.WebServices.Retorno.verAplic);
  MemoDados.Lines.Add('Status          : ' +
    IntToStr(dm.ACBrNFe1.WebServices.Retorno.cStat));
  MemoDados.Lines.Add('UF              : ' +
    IntToStr(dm.ACBrNFe1.WebServices.Retorno.cUF));
  MemoDados.Lines.Add('Motivo          : ' +
    dm.ACBrNFe1.WebServices.Retorno.xMotivo);
  MemoDados.Lines.Add('cMsg            : ' +
    IntToStr(dm.ACBrNFe1.WebServices.Retorno.cMsg));
  MemoDados.Lines.Add('xMsg            : ' + dm.ACBrNFe1.WebServices.Retorno.xMsg);
  MemoDados.Lines.Add('Recibo          : ' +
    dm.ACBrNFe1.WebServices.Retorno.Recibo);
  MemoDados.Lines.Add('Protocolo       : ' +
    dm.ACBrNFe1.WebServices.Retorno.Protocolo);
end;

procedure TFrmNFE.RGFinalidadeClick(Sender: TObject);
begin
  try
    habilitarReferenciaDevolucao((RGFinalidade.ItemIndex = 3));
  except
    on E: Exception do
      TLog.Error(Self.ClassName + ' - RGFinalidadeClick - ' + E.Message);
  end;
end;

procedure TFrmNFE.salvarFichaEstoque;
var
  fichaEstoque: TFichaEstoque;
begin
  try
    try
      while not qryitens_nf.Eof do
      begin
        fichaEstoque := TFichaEstoque.create;
        fichaEstoque.DataLancamento := FDataEmissao;
        fichaEstoque.DataMovimentacao := FDataEmissao;
        fichaEstoque.TipoFichaEstoque := TipoFichaEstoqueEnum.SAIDA;
        fichaEstoque.TipoDocumento := NOTA_FISCAL_SAIDA;
        fichaEstoque.NumDocumento := Trim(EdtN_Nota_Fiscal.Text);
        fichaEstoque.ProdutoCodigo := qryitens_nf.FieldByName('Codigo_Produto')
          .AsInteger;
        fichaEstoque.Quantidade := qryitens_nf.FieldByName('Qtde').AsFloat;
        fichaEstoque.ValorUnitario := qryitens_nf.FieldByName
          ('Valor_Unitario').AsFloat;
        fichaEstoque.ValorUnitarioTotal :=
          qryitens_nf.FieldByName('Valor_Unitario').AsFloat *
          qryitens_nf.FieldByName('Qtde').AsFloat;
        fichaEstoque.PrecoVendaVista := qryitens_nf.FieldByName
          ('ValorUnitarioTotal').AsFloat;
        fichaEstoque.PrecoVendaPrazo := qryitens_nf.FieldByName
          ('ValorUnitarioTotal').AsFloat;
        FNFEDominio.salvarFichaEstoque(qrypedido_pendenteCodigo.AsInteger,
          fichaEstoque);
        qryitens_nf.next;
      end;
    except
      on E: Exception do
        TLog.Error(Self.ClassName + ' - salvarFichaEstoque - ' + E.Message);

    end;
  finally
    FreeAndNil(fichaEstoque);
  end;
end;

procedure TFrmNFE.BBtnEnviarClick(Sender: TObject);
var
  estoque: double;
begin
  try
    dm.ACBrNFe1.Enviar(EdtN_Nota_Fiscal.Text, false);

    //Grava_Nota;
    EdtChave_Acesso.Text := dm.ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.
      Items[0].chNFe;
    // Atualiza_NFe_Banco(EdtChave_Acesso.Text, '', EdtN_Nota_Fiscal.Text, EdtPedido.Text);
    // Atualiza_Status_NFe(qryitens_nfCodigo.AsInteger, 'PAGO', 'NFE');

    BBtnSalvar.Enabled := false;
    // BBtnValidar.Enabled:= false;
    // BBtnAssinar.Enabled:= false;
    // BBtnEnviar.Enabled:= false;
    BBtnImprimir_NFe.Enabled := true;
    BBtnEmail.Enabled := true;
    BBtnConsultar.Enabled := false;
    BBtnComprovante_Entrega.Enabled := true;

    NF.Inserir;
    Destinatario.Inserir;
    Emitente.Inserir;
    Local_Entrega.Inserir;
    Local_Retirada.Inserir;
    Transporte.Inserir;
    Imposto_NF.Inserir;
    Atualiza_Pedido_Pendente;
    iniciado := false;

    RetornoNFe;

    if (gera_os = '0101') and (CmbStatus.KeyValue <> null) then
    begin
      Atualiza_Status_OS;
    end;

    Gera_Estoque;

    Application.MessageBox(PChar('Processo concluido com sucesso.' + #10 + #13 +
      #10 + #13 + 'Código Status: ' +
      IntToStr(dm.ACBrNFe1.WebServices.Retorno.cStat) + #10 + #13 + 'Motivo: ' +
      dm.ACBrNFe1.WebServices.Retorno.xMotivo + #10 + #13 + 'Mensagem: ' +
      dm.ACBrNFe1.WebServices.Retorno.xMsg + #10 + #13 + 'Protocolo: ' +
      dm.ACBrNFe1.WebServices.Retorno.Protocolo), 'Mensagem da NFe',
      MB_OK + MB_ICONQUESTION);

  except
    on E: Exception do
    begin
      TLog.Error(Self.ClassName + ' - BBtnEnviarClick - ' + E.Message);
      if (dm.ACBrNFe1.WebServices.Retorno.cStat = 105) or
        (dm.ACBrNFe1.WebServices.Retorno.cStat = 104) or
        (dm.ACBrNFe1.WebServices.Retorno.cStat = 103) then
      begin
        Application.MessageBox(PChar('Houve um erro no envio da Nfe.' + #10 +
          #13 + #10 + #13 + 'A NFe ' + EdtN_Nota_Fiscal.Text +
          ' já está na base de dados do sefaz, mas por motivos técnicos, não foi autorizada o uso. '
          + #10 + #13 +
          'Por favor, clique no botão Consultar (do lado esquerdo da janela) para fazer a consulta pelo XML da nota emitida. '
          + #10#13 +
          'Caso for autorizado o uso, por favor, imprima a NFe, clicando no botão Imprimir NFe.'
          + #10 + #13 + #10 + #13 + 'Código Status: ' +
          IntToStr(dm.ACBrNFe1.WebServices.Retorno.cStat) + #10 + #13 + 'Motivo: '
          + dm.ACBrNFe1.WebServices.Retorno.xMotivo + #10 + #13 + 'Mensagem: ' +
          dm.ACBrNFe1.WebServices.Retorno.xMsg + #10 + #13 + 'Protocolo: ' +
          dm.ACBrNFe1.WebServices.Retorno.Protocolo), 'Mensagem da NFe',
          MB_OK + MB_ICONHAND);
        BBtnSalvar.Enabled := false;
        // BBtnValidar.Enabled:= false;
        // BBtnAssinar.Enabled:= false;
        // BBtnEnviar.Enabled:= false;
        BBtnImprimir_NFe.Enabled := false;
        BBtnEmail.Enabled := false;
        BBtnConsultar.Enabled := true;
        BBtnComprovante_Entrega.Enabled := false;
        iniciado := true;
      end
      else
      begin
        Application.MessageBox(PChar('Houve um erro no envio da Nfe.' + #10 +
          #13 + #10 + #13 + 'Código Status: ' +
          IntToStr(dm.ACBrNFe1.WebServices.Retorno.cStat) + #10 + #13 + 'Motivo: '
          + dm.ACBrNFe1.WebServices.Retorno.xMotivo + #10 + #13 + 'Mensagem: ' +
          dm.ACBrNFe1.WebServices.Retorno.xMsg + #10 + #13 + 'Protocolo: ' +
          dm.ACBrNFe1.WebServices.Retorno.Protocolo), 'Mensagem da NFe',
          MB_OK + MB_ICONHAND);
        BBtnSalvar.Enabled := true;
        // BBtnValidar.Enabled:= false;
        // BBtnAssinar.Enabled:= false;
        // BBtnEnviar.Enabled:= true;
        BBtnImprimir_NFe.Enabled := false;
        BBtnEmail.Enabled := false;
        BBtnConsultar.Enabled := false;
        BBtnComprovante_Entrega.Enabled := false;
        iniciado := true;
      end;
    end;
  end;

  RetornoNFe;

end;

procedure TFrmNFE.Gera_Estoque;
var
  qtdeEstoque: double;
begin
  try
    TLog.Info('--- MÉTODO GERA_ESTOQUE ---');
    TLog.Debug('Variável gerar_estoque: ' + IntToStr(gerar_estoque));
    TLog.Debug('Variável controla_estoque: ' + IntToStr(controla_estoque));
    TLog.Debug('Variável estoque: ' + IntToStr(estoque));
    if (gerar_estoque = 1) and (controla_estoque = 0) then
    // gerar_estoque é da config. sistema. controla_estoque é do cfop
    begin
      qryitens_nf.First;
      while not qryitens_nf.Eof do
      begin
        if (estoque = 1) then // variavel estoque vem do CFOP
          qtdeEstoque := qryitens_nfEstoque.AsFloat - qryitens_nfQtde.AsFloat
        else
          qtdeEstoque := qryitens_nfEstoque.AsFloat + qryitens_nfQtde.AsFloat;

        TLog.Debug('');
        TLog.Debug('Produto: ' + qryitens_nfDescricao.AsString);
        TLog.Debug('Estoque Atual: ' + qryitens_nfEstoque.AsString);
        TLog.Debug('Quantidade: ' + qryitens_nfQtde.AsString);
        TLog.Debug('Novo Estoque: ' + FloatToStr(qtdeEstoque));

        Atualiza_Saldo_Estoque(dm.ADOConnection1, qryitens_nfCodigo_Produto.AsInteger,
          qryitens_nfValor_Compra_Atual.AsFloat * qtdeEstoque);
        Atualiza_Estoque(dm.ADOConnection1, qtdeEstoque, qryitens_nfCodigo_Produto.AsInteger);
        Atualiza_Volume(dm.ADOConnection1, qtdeEstoque * qryitens_nfVolume.AsFloat,
          qryitens_nfCodigo_Produto.AsInteger);

       //******MD51
       AtualizaMD51(qryitens_nfCodigo_Produto.AsInteger,
           GeraMD5([BuscaCodigoProduto(qryitens_nfCodigo_Produto.AsInteger),
           qryitens_nfDescricao.AsAnsiString,
           FloatToStr(qtdeEstoque),
           qryitens_nfCodigo_Produto.AsAnsiString, cChavePrivada]));
           ///**fIM


        qryitens_nf.Edit;
        qryitens_nfQtde_Estoque_Atual.AsFloat := qryitens_nfEstoque.AsFloat;
        qryitens_nf.Post;

        qryitens_nf.next;
      end;

      Cria_Arquivo_Atualiza_Dados('AProd');
      UDeclaracao.Atualiza_Produto(4, '');
    end;
    TLog.Info('--- FIM MÉTODO GERA_ESTOQUE ---');
  except
    on E: Exception do
      TLog.Error(Self.ClassName + ' - Gera_Estoque - ' + E.Message);
  end;
end;

procedure TFrmNFE.BBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmNFE.Verifica_Credito_Cliente;
var
  aux: Boolean;
  ValorTotal, TotalCompra, Credito: double;
begin
  TLog.Info('--- ENTROU NO METODO Verifica_Credito_Cliente ---');
  TotalCompra := StrToFloat(EdtValor_Total_Nota.Text);
  FCliente := TClienteEntidade.create;
  FClienteDom := TClienteDominio.create(dm.ADOConnection1);
  FCliente.Codigo := StrToInt(EdtCodigo_Destinatario.Text);
  FCliente.NomeFantasia := EdtDestinatario.Text;

  if (FClienteDom.VerificaSeExisteLimiteDeCreditoDisponivel(FCliente,
    TotalCompra)) then
  begin
    TemCreditoDisponivel := true;
  end
  else
  begin
    TemCreditoDisponivel := false;
    abort;
  end;
  TLog.Info('--- FIM METODO Verifica_Credito_Cliente ---');
end;

procedure TFrmNFE.BBtnGerarNFeClick(Sender: TObject);
begin
  TLog.Info('--- CLICOU NO BOTÃO GERAR NFE ---');
  if (EdtCodigo_CFOP.Text = '') then
  begin
    Application.MessageBox('Por favor, informe um CFOP', 'CFOP não encontrado',
      MB_OK + MB_ICONHAND);
    PageControl1.TabIndex := 0;
    EdtCodigo_CFOP.SetFocus;
    exit;
  end;

  if (qryitens_nfUF.AsString <> uf) and (Copy(EdtCFOP.Text, 1, 1) = '5') then
  begin
    TMensagens.MensagemErro('Venda de ' + uf + ' para ' + qryitens_nfUF.AsString
      + ' com CFOP de venda interna.' + #10 + #13 +
      'O CFOP de venda externa inicia-se com o número 6.');
    EdtCFOP.SetFocus;
    exit;
  end;

  if (qryitens_nfUF.AsString = uf) and (Copy(EdtCFOP.Text, 1, 1) = '6') then
  begin
    TMensagens.MensagemErro('Venda de ' + uf + ' para ' + qryitens_nfUF.AsString
      + ' com CFOP de venda externa.' + #10 + #13 +
      'O CFOP de venda interna inicia-se com o número 5.');
    EdtCFOP.SetFocus;
    exit;
  end;

  if (CMBTipo_Nota.Text = '') then
  begin
    TMensagens.MensagemErro('Por favor, configure o tipo da operação, se é NFe ou NFCe.');
    CMBTipo_Nota.SetFocus;
    exit;
  end;

  if (gerar_financeiro = 1) and (gera_fi = 0) then
  // gera_financeiro é da config. sistema. gera_fi é do cfop
  begin
    if (EdtCodigo_Condicao_Pagamento.Text = '') then
    begin
      if (Application.MessageBox
        ('O financeiro está configurado para ser gerado na emissão da NFe. Entretanto, a condição de pagamento não foi informada. Deseja continuar?',
        'Atenção!', MB_YESNO + MB_ICONEXCLAMATION)) = IDNO then
      begin
        EdtCodigo_Condicao_Pagamento.SetFocus;
        exit;
      end;
    end;

    if (MEdtData_Primeiro_Vencimento.Text = '  /  /    ') then
    begin
      if (Application.MessageBox
        ('O financeiro está configurado para ser gerado na emissão da NFe. Entretanto, a data de vencimento base não foi informada. Deseja continuar?',
        'Atenção!', MB_YESNO + MB_ICONEXCLAMATION)) = IDNO then
      begin
        MEdtData_Primeiro_Vencimento.SetFocus;
        exit;
      end;
    end;

    if (EdtCodigo_Condicao_Pagamento.Text <> '') and
      (MEdtData_Primeiro_Vencimento.Text <> '  /  /    ') and
      (ClientDataSet1.IsEmpty) then
    begin
      Application.MessageBox
        ('O financeiro está configurado para ser gerado na emissão da NFe. A condição de pagamento e a data do primeiro vencimento foi informado. Entretanto, o botão GERAR PARCELAS não foi acionado.',
        'Atenção!', MB_OK + MB_ICONEXCLAMATION);
      begin
        BtnGerarParcela.SetFocus;
        exit;
      end;
    end;

    if (EdtCodigo_Condicao_Pagamento.Text <> '') and
      (MEdtData_Primeiro_Vencimento.Text <> '  /  /    ') and
      (ClientDataSet1.IsEmpty = false) then
    begin
      Gera_Financeiro;
    end;

  end;

  TemCreditoDisponivel := false;
  if (tipoPagamento = 'A PRAZO') and (controla_credito_cliente = 0) then
  begin
    Verifica_Credito_Cliente;
  end;

  encontrou_alertas := false;
  dm.ACBrNFe1.NotasFiscais.Clear;

  try
    MMOObservacao.Text:= MMOObservacao.Text + #10+#13 + #10+#13 + 'MD5:'+pMD5_Arquivos;
    TLog.Debug('Vai gerar a NFe.');
    GeraNFe;
    TLog.Debug('Gerou NFe no sistema.');
    dm.ACBrNFe1.NotasFiscais.GerarNFe;
    TLog.Debug('Gerou NFe no coomponente ACBr.');
    BBtnSalvar.Enabled := true;

    if (cbVisualizarDANFE.Checked) then
    begin
      dm.ACBrNFe1.NotasFiscais.Items[0].GravarXML;
      MemoResp.Lines.Text := dm.ACBrNFe1.NotasFiscais.Items[0].NomeArq;
      dm.ACBrNFe1.NotasFiscais.Items[0].Imprimir;
    end;
  except
    on E: Exception do
    begin
      TMensagens.MensagemErro('Erro ao Gerar NFe: ' + E.Message);
      TLog.Error('Erro ao Gerar NFe: ' + E.Message);
    end;
  end;
  TLog.Info('--- FIM DO BOTÃO GERAR NFE ---');
end;

procedure TFrmNFE.BBtnGerar_CarneClick(Sender: TObject);
begin
  // if (gerar_financeiro = 0) then
  // begin
  TLog.Info('--- BOTÃO GERAR CARNÊ ---');
  TLog.Debug('Código do cliente: ' + IntToStr(oCli.Codigo));
  TLog.Debug('Razão social: ' + oCli.RazaoSocial);
  TLog.Debug('Nome fantasia: ' + oCli.NomeFantasia);
  TLog.Debug('Código da condição de pagamento: ' + IntToStr(oCP.Codigo));
  TLog.Debug('Condição de pagamento: ' + oCP.Descricao);
  TLog.Debug('Código Lançamento: ' + IntToStr(oLF.Codigo));

  FrmGerar_Documentos := TFrmGerar_Documentos.create(Self, oLF, oPLF, oCP, oCli,
    qryitens_nfCodigo.AsInteger);
  TLog.Info('--- FIM BOTÃO GERAR CARNÊ ---');
  FrmGerar_Documentos.ShowModal;
  FrmGerar_Documentos.Free;
  // end;

  { FrmRel_Carne:= TFrmRel_Carne.create(self);
    FrmRel_Carne.Release;
    FrmRel_Carne:= Nil; }
end;

procedure TFrmNFE.Atualiza_CFOP_Pedido(Pedido, CFOP: Integer);
var
  qAux: TADOQuery;
begin
  try
    try
      qAux := TADOQuery.create(nil);
      with qAux, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('update Pedido set Codigo_CFOP = :Codigo_CFOP');
        Add('where Codigo = :Codigo');
        Parameters.ParamByName('Codigo_CFOP').Value := CFOP;
        Parameters.ParamByName('Codigo').Value := Pedido;
        ExecSQL;
      end;
    except
      on E: Exception do
        TLog.Error('Atualiza_CFOP - ' + E.Message);
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmNFE.BBtnSalvarClick(Sender: TObject);
var
  tipo: AnsiString;
begin
  try
    try
      TLog.Info('--- BOTÃO ENVIAR NFE ---');

      TLog.Debug('VAI ATUALIZAR O CFOP DA NFE.');
      Atualiza_CFOP_Pedido(qrypedido_pendenteCodigo.AsInteger,
        StrToInt(EdtCodigo_CFOP.Text));
      TLog.Debug('Atualizou o CFOP da NFe nº ' + EdtN_Nota_Fiscal.Text +
        ' para o código do CFOP ' + EdtCodigo_CFOP.Text);
      TLog.Debug('VAI ENVIAR NFE.');

//      dm.ACBrNFe1.Configuracoes.WebServices.AguardarConsultaRet := 30000;
//      dm.ACBrNFe1.Configuracoes.WebServices.AjustaAguardaConsultaRet := True;
//      dm.ACBrNFe1.Configuracoes.WebServices.IntervaloTentativas := 15000;
//      dm.ACBrNFe1.Configuracoes.WebServices.Tentativas := 10;

      dm.ACBrNFe1.Enviar(EdtN_Nota_Fiscal.Text, false);

      //se for NFe, grava o número da NFe para posteriormente gerar o próximo, senão grava o número da NFCe.
      if (CMBTipo_Nota.ItemIndex = 0) then
      begin
        TLog.Debug('VAI GRAVAR Nº DA NFE.');
        Grava_N_NFe(StrToInt(EdtN_Nota_Fiscal.Text));
        TLog.Debug('Gravou nº da NFE: ' + EdtN_Nota_Fiscal.Text);
      end
      else
      begin
        TLog.Debug('VAI GRAVAR Nº DA NFCE.');
        Grava_N_NFCe(StrToInt(EdtN_Nota_Fiscal.Text));
        TLog.Debug('Gravou nº da NFCE: ' + EdtN_Nota_Fiscal.Text);
      end;

      EdtChave_Acesso.Text := dm.ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.
        Items[0].chNFe;
      TLog.Debug('Chave NFe: ' + EdtChave_Acesso.Text);

      qryitens_nf.First;
      while not qryitens_nf.Eof do
      begin
        //Se for NFe, deve verificar se é um pedido novo (DAV ou DAV-OS) ou um pedido já existente (no caso, que já
        //foi emitido NFCE, pois se já foi emitido NFCE, o tipo do pedido será NFCE/NFE, senão será apenas NFE.
        if (CMBTipo_Nota.ItemIndex = 0) then
        begin
          tipo:= Retorna_Tipo_Pedido(qryitens_nfCodigo.AsInteger);
          if (tipo='DAV') or (tipo='DAV-OS') or (tipo='PDV') then
          begin
            Atualiza_NFe_Banco(EdtChave_Acesso.Text,
              dm.ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].nProt,
              EdtN_Nota_Fiscal.Text, 'NFE', 'PAGO', qryitens_nfCodigo.AsInteger,
              StrToDateTime(MEdtData_Emissao.Text), dm.ADOConnection1);
          end
          else if ((tipo='NFCE')) then
          begin
            Atualiza_NFe_Banco(EdtChave_Acesso.Text,
              dm.ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].nProt,
              EdtN_Nota_Fiscal.Text, 'NFCE/NFE', 'PAGO', qryitens_nfCodigo.AsInteger,
              StrToDateTime(MEdtData_Emissao.Text), dm.ADOConnection1);
          end;
        end
        else
        begin
          tipo:= Retorna_Tipo_Pedido(qryitens_nfCodigo.AsInteger);
          if (tipo='DAV') or (tipo='DAV-OS') or (tipo='PDV') then
          begin
            Atualiza_NFCe_Banco(EdtChave_Acesso.Text,
              dm.ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].nProt,
              EdtN_Nota_Fiscal.Text, 'NFCE', 'PAGO', qryitens_nfCodigo.AsInteger,
              StrToDateTime(MEdtData_Emissao.Text), dm.ADOConnection1);
          end
          else if ((tipo='NFE')) then
          begin
            Atualiza_NFCe_Banco(EdtChave_Acesso.Text,
              dm.ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].nProt,
              EdtN_Nota_Fiscal.Text, 'NFE/NFCE', 'PAGO', qryitens_nfCodigo.AsInteger,
              StrToDateTime(MEdtData_Emissao.Text), dm.ADOConnection1);
          end;
        end;

        qryitens_nf.next;
      end;
      TLog.Debug('');

      if (gerar_financeiro = 1) then
      begin
        BBtnGerar_Carne.Enabled := true;
        TLog.Debug('Variável gerar_financeiro = 1');
      end
      else
      begin
        TLog.Debug('Variável gerar_financeiro = 0');
        BBtnGerar_Carne.Enabled := false;
      end;
      {NF.Inserir;
      Destinatario.Inserir;
      Emitente.Inserir;
      Local_Entrega.Inserir;
      Local_Retirada.Inserir;
      Transporte.Inserir;
      Imposto_NF.Inserir;}
      iniciado := false;

      if (gera_os = '0101') and (CmbStatus.KeyValue <> null) then
      begin
        Atualiza_Status_OS;
        TLog.Debug('Atualizou status da OS');
      end;

      TLog.Debug('VAI EXECUTAR OS MÉTODOS PARA ATUALIZAR ESTOQUE E FINANCEIRO.');
      Gera_Estoque;
      // Gera_Financeiro;
      Atualiza_Pedido_Pendente;





      if (TemCreditoDisponivel) and
        (qryitens_nfTipo_Pagamento.AsString = 'A PRAZO') and
        (controla_credito_cliente = 0) then
      begin
        FClienteDom.AtualizaCreditoCliente(FCliente,
          StrToFloat(EdtValor_Total_Nota.Text));
        // Cria_Arquivo_Atualiza_Dados('ACli');
      end;

      BBtnNovo.Enabled := true;
      BBtnSalvar.Enabled := false;
      BBtnImprimir_NFe.Enabled := true;
      BBtnEmail.Enabled := true;
      BBtnConsultar.Enabled := false;
      BBtnComprovante_Entrega.Enabled := true;
      BBtnGerarNFe.Enabled := false;

      cnpj_destinatario := '';
      razao_social_destinatario := '';
      endereco_destinatario := '';
      numero_destinatario := '';
      complemento_destinatario := '';
      setor_destinatario := '';
      codigo_municipio_destinatario := '';
      municipio_destinatario := '';
      uf_destinatario := '';
      telefone_destinatario := '';
      ie_destinatario := '';
      im_destinatario := '';
      cep_destinatario := '';
      email_destinatario := '';
      suframa_destinatario := '';
      enquadramento := '';

      Application.MessageBox(PChar('Processo concluido com sucesso.' + #10 + #13
        + #10 + #13 + 'Código Status: ' +
        IntToStr(dm.ACBrNFe1.WebServices.Retorno.cStat) + #10 + #13 + 'Motivo: ' +
        dm.ACBrNFe1.WebServices.Retorno.xMotivo + #10 + #13 + 'Mensagem: ' +
        dm.ACBrNFe1.WebServices.Retorno.xMsg + #10 + #13 + 'Protocolo: ' +
        dm.ACBrNFe1.WebServices.Retorno.Protocolo), 'Mensagem da NFe',
        MB_OK + MB_ICONQUESTION);
      TLog.Debug('Status da NFe: ' +
        IntToStr(dm.ACBrNFe1.WebServices.Retorno.cStat));
      TLog.Debug('Mensagem da NFe: ' + dm.ACBrNFe1.WebServices.Retorno.xMsg);
      TLog.Debug('Motivo da NFe: ' + dm.ACBrNFe1.WebServices.Retorno.xMotivo);

      if (gerar_financeiro = 1) and (gera_fi = 0) and
        (ClientDataSet1.IsEmpty = false) then
      begin
        TLog.Info(
          '--- MÉTODO PARA GERAR DOCUMENTOS FOI CHAMADO AUTOMATICAMENTE ---');
        TLog.Debug('Código do cliente: ' + IntToStr(oCli.Codigo));
        TLog.Debug('Razão social: ' + oCli.RazaoSocial);
        TLog.Debug('Nome fantasia: ' + oCli.NomeFantasia);
        TLog.Debug('Código da condição de pagamento: ' + IntToStr(oCP.Codigo));
        TLog.Debug('Condição de pagamento: ' + oCP.Descricao);
        TLog.Debug('Código Lançamento: ' + IntToStr(oLF.Codigo));

        FrmGerar_Documentos := TFrmGerar_Documentos.create(Self, oLF, oPLF, oCP,
          oCli, qryitens_nfCodigo.AsInteger);
        TLog.Info(
          '--- MÉTODO PARA GERAR DOCUMENTOS(S) FOI CHAMADO AUTOMATICAMENTE ---');
        FrmGerar_Documentos.ShowModal;
        FrmGerar_Documentos.Free;
      end;

    except
      on E: Exception do
      begin
        TLog.Error(Self.ClassName + ' - BBtnEnviarClick - ' + E.Message);
        if (dm.ACBrNFe1.WebServices.Retorno.cStat = 105) or
          (dm.ACBrNFe1.WebServices.Retorno.cStat = 104) or
          (dm.ACBrNFe1.WebServices.Retorno.cStat = 103) then
        begin
          Application.MessageBox(PChar('Houve um erro no envio da Nfe.' + #10 +
            #13 + #10 + #13 + 'A NFe ' + EdtN_Nota_Fiscal.Text +
            ' já está na base de dados do sefaz, mas por motivos técnicos, não foi autorizada o uso. '
            + #10 + #13 +
            'Por favor, clique no botão Consultar (do lado esquerdo da janela) para fazer a consulta pelo XML da nota emitida. '
            + #10#13 +
            'Caso for autorizado o uso, por favor, imprima a NFe, clicando no botão Imprimir NFe.'
            + #10 + #13 + #10 + #13 + 'Código Status: ' +
            IntToStr(dm.ACBrNFe1.WebServices.Retorno.cStat) + #10 + #13 +
            'Motivo: ' + dm.ACBrNFe1.WebServices.Retorno.xMotivo + #10 + #13 +
            'Mensagem: ' + dm.ACBrNFe1.WebServices.Retorno.xMsg + #10 + #13 +
            'Protocolo: ' + dm.ACBrNFe1.WebServices.Retorno.Protocolo + #10 + #13 +
            #10 + #13 + 'Erro: ' + E.Message), 'Mensagem da NFe',
            MB_OK + MB_ICONHAND);

          TLog.Error('Status do erro da NFe: ' +
            IntToStr(dm.ACBrNFe1.WebServices.Retorno.cStat));
          TLog.Error('Mensagem de erro da NFe: ' +
            dm.ACBrNFe1.WebServices.Retorno.xMsg);
          TLog.Error('Motivo de erro da NFe: ' +
            dm.ACBrNFe1.WebServices.Retorno.xMotivo);
          BBtnSalvar.Enabled := false;
          // BBtnValidar.Enabled:= false;
          // BBtnAssinar.Enabled:= false;
          // BBtnEnviar.Enabled:= false;
          BBtnImprimir_NFe.Enabled := false;
          BBtnEmail.Enabled := false;
          BBtnConsultar.Enabled := true;
          BBtnComprovante_Entrega.Enabled := false;
          BBtnGerar_Carne.Enabled := false;
          iniciado := true;
        end
        else
        begin
          Application.MessageBox(PChar('Houve um erro no envio da Nfe.' + #10 +
            #13 + #10 + #13 + 'Código Status: ' +
            IntToStr(dm.ACBrNFe1.WebServices.Retorno.cStat) + #10 + #13 +
            'Motivo: ' + dm.ACBrNFe1.WebServices.Retorno.xMotivo + #10 + #13 +
            'Mensagem: ' + dm.ACBrNFe1.WebServices.Retorno.xMsg + #10 + #13 +
            'Protocolo: ' + dm.ACBrNFe1.WebServices.Retorno.Protocolo + #10 + #13 +
            #10 + #13 + 'Erro: ' + E.Message), 'Mensagem da NFe',
            MB_OK + MB_ICONHAND);

          TLog.Error('Status do erro da NFe: ' +
            IntToStr(dm.ACBrNFe1.WebServices.Retorno.cStat));
          TLog.Error('Mensagem de erro da NFe: ' +
            dm.ACBrNFe1.WebServices.Retorno.xMsg);
          TLog.Error('Motivo de erro da NFe: ' +
            dm.ACBrNFe1.WebServices.Retorno.xMotivo);
          BBtnSalvar.Enabled := false;
          // BBtnValidar.Enabled:= false;
          // BBtnAssinar.Enabled:= false;
          // BBtnEnviar.Enabled:= true;
          BBtnImprimir_NFe.Enabled := false;
          BBtnEmail.Enabled := false;
          BBtnConsultar.Enabled := true;
          BBtnComprovante_Entrega.Enabled := false;
          BBtnGerar_Carne.Enabled := false;
          iniciado := true;
        end;
        ClientDataSet1.Close;
        ClientDataSet1.CreateDataSet;
        Application.MessageBox('Por favor, gere as parcelas novamente.',
          'Atenção!', MB_OK + MB_ICONEXCLAMATION);
        PageControl3.TabIndex := 1;
        BtnGerarParcela.SetFocus;
      end;
    end;

    MemoResp.Lines.Text := UTF8Encode(dm.ACBrNFe1.WebServices.Retorno.RetWS);
    memoRespWS.Lines.Text := UTF8Encode(dm.ACBrNFe1.WebServices.Retorno.RetornoWS);
    RetornoNFe;
    TLog.Info('--- FIM DO MÉTODO DO BOTÃO ENVIAR NFE ---');
  except
    on E: Exception do
    begin
      TLog.Error(Self.ClassName + ' - BBtnSalvarClick - ' + E.Message);
      RetornoNFe;
    end;
  end;
end;

procedure TFrmNFE.Escreve_Alertas(Alerta: AnsiString);
begin
  MemoDadosSistema.Lines.Add(Alerta);
end;

procedure TFrmNFE.Escreve_Alerta_Geral;
begin
  MemoDadosSistema.Lines.Clear;
  MemoDadosSistema.Lines.Add('ALERTAS GERAIS');
  MemoDadosSistema.Lines.Add('');
end;

procedure TFrmNFE.Escreve_Alerta_Principal;
begin
  MemoDadosSistema.Lines.Add('');
  MemoDadosSistema.Lines.Add('');
  MemoDadosSistema.Lines.Add('ALERTAS DE PRODUTOS');
  MemoDadosSistema.Lines.Add('');
end;

procedure TFrmNFE.BBtnValidarClick(Sender: TObject);
begin
  try
    //dm.ACBrNFe1.NotasFiscais.Valida;
    RetornoNFe;
    // BBtnAssinar.Enabled:= true;
    BBtnGerar_Carne.Enabled := false;
  except
    on E: Exception do
    begin
      TLog.Error(Self.ClassName + ' - BBtnValidarClick - ' + E.Message);
      // BBtnAssinar.Enabled:= false;
      PageControl1.TabIndex := 5;
      MemoResp.Lines.Add('');
      MemoResp.Lines.Add('ALERTAS');
      MemoResp.Lines.Add('');
      MemoResp.Lines.Add(dm.ACBrNFe1.NotasFiscais.Items[0].Alertas);
      MemoResp.Lines.Text := UTF8Encode(dm.ACBrNFe1.WebServices.Retorno.RetWS);
      memoRespWS.Lines.Text :=
        UTF8Encode(dm.ACBrNFe1.WebServices.Retorno.RetornoWS);
      RetornoNFe;
    end;
  end;
end;

procedure TFrmNFE.BtnAnularClick(Sender: TObject);
begin
  TLog.Info('--- CLICOU NO BOTÃO ANULAR QUANDO SELECIONOU VÁRIAS NFE ---');
  if (Application.MessageBox(PChar('Confirma a anulação do pedido?' + #10 + #13
    + 'O pedido ' + qrypedido_pendenteN_Pedido.AsString +
    ' só deixará de ser visível nessa tela de NFe, ' +
    'mas NÃO será excluído ou cancelado do sistema.'), 'Aviso',
    MB_YESNO + MB_ICONEXCLAMATION)) = idyes then
  begin
    try
      qAux := TADOQuery.create(nil);
      with qAux, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('update Pedido set Status = :Status');
        Add('where Codigo = :Codigo');
        Parameters.ParamByName('Status').Value := 'ANULADO';
        Parameters.ParamByName('Codigo').Value :=
          qrypedido_pendenteCodigo.AsInteger;
        ExecSQL;
      end;
      Atualiza_Pedido_Pendente;
    finally
      FreeAndNil(qAux);
    end;
  end;
  TLog.Info('--- FIM DO BOTÃO ANULAR ---');
end;

procedure TFrmNFE.BtnAvancarClick(Sender: TObject);
begin
  if (passa) then
  begin
    if (PageControl1.TabIndex = 4) then
      abort;

    PageControl1.TabIndex := PageControl1.TabIndex + 1;
  end
  else
  begin
    Application.MessageBox
      ('Por favor, informe um número de pedido válido para avançar',
      'Pedido não encontrado', MB_OK + MB_ICONHAND);
    abort;
  end;
end;

procedure TFrmNFE.btnLocalizarClick(Sender: TObject);
begin
  try
    if qrypedido_pendenteTipo.AsString = 'FÍSICO' then
      FFormConsultaNFParaReferencia.Fornecedor := qrypedido_pendenteCPF.AsString
    else
      FFormConsultaNFParaReferencia.Fornecedor :=
        qrypedido_pendenteCNPJ.AsString;

    FFormConsultaNFParaReferencia.ShowModal;
    Centraliza_Form(FFormConsultaNFParaReferencia);

    if FFormConsultaNFParaReferencia.NotaSelecionada > 0 then
    begin
      FNFEDominio.gravarRefernciaDevolucao
        (FFormConsultaNFParaReferencia.NotaSelecionada,
        qrypedido_pendenteCodigo.AsInteger, FReferenciaDevolucaoQuery);
      DBGridReferenciaDevolucao.SetFocus;
    end;

  except
    on E: Exception do
      TLog.Error(Self.ClassName + ' - btnLocalizarClick - ' + E.Message);
  end;
end;

procedure TFrmNFE.BtnVoltarClick(Sender: TObject);
begin
  if (PageControl1.TabIndex = 0) then
    abort;

  PageControl1.TabIndex := PageControl1.TabIndex - 1;
end;

procedure TFrmNFE.Button1Click(Sender: TObject);
begin
  // FPedidos := FPedidos + ' OR ';
  { try
    ClientDataSet1.CreateDataSet;
    ClientDataSet1.Open;
    except
    on E : Exception do
    TLog.Error(Self.ClassName+' - Button1Click - '+E.Message);
    end; }
  ShowMessage(IntToStr(qrypedido_pendente.RecordCount));
end;

procedure TFrmNFE.Button2Click(Sender: TObject);
begin
  Atualiza_Status_OS;
end;

procedure TFrmNFE.BtnInformar_PagamentoClick(Sender: TObject);
begin
  // Atualiza_Status_OS;
  //ClientDataSet1.Append;
  //ClientDataSet1NDoc.Value := '1';
  //ClientDataSet1Data.Value := date;
  //ClientDataSet1Valor.Value := 50;
  // ClientDataSet1.Append;
  // ClientDataSet1.ApplyUpdates(0);
  // ClientDataSet1.close;
  // ClientDataSet1.Open;
  TLog.Debug('Clicou no botão Informar Pagamentos.');
  Application.CreateForm(TFrmFechamento_Venda_PDV, FrmFechamento_Venda_PDV);
  Centraliza_Form(FrmFechamento_Venda_PDV);
  FrmFechamento_Venda_PDV.Show;

end;

procedure TFrmNFE.Button5Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to cxGrid1DBTableView1.ViewData.RowCount - 1 do
  begin
    ShowMessage(cxGrid1DBTableView1.ViewData.Records[i].Values
      [cxGrid1DBTableView1N_Pedido.Index]);
  end;
end;

procedure TFrmNFE.BBtnImprimir_NFeClick(Sender: TObject);
var
  i: integer;
  TemAlerta: boolean;
  StatusImpressora, TentaAtivar: Boolean;
begin
  try
    ETEF:= 'NÃO';
    for i := 0 to DadosEmissaoNFE.Recebimentos.Count-1 do
    begin
      if (DadosEmissaoNFE.Recebimentos.Items[i].PosOuTEF = 'SIM') then
      begin
        ETEF:= 'SIM';
        ValorTEF:= FloatToStr(DadosEmissaoNFE.Recebimentos.Items[i].ValorRecebimento);
      end;
    end;

    dm.ACBrNFe1.NotasFiscais.Imprimir;
    dm.ACBrNFe1.NotasFiscais.ImprimirPDF;

    if (ETEF = 'SIM') then
    begin
      TentaAtivar:= false;
      while not TentaAtivar do
      begin
        try
          dm.ACBrPosPrinter1.Ativo:= true;
          TentaAtivar:= true;
        except
          TentaAtivar:= False;
        end;
      end;
    end;

    //Se for TEF, tem que ativar a porta da impressora não fiscal. Fica em loop até conseguir ativar.
    if (ETEF = 'SIM') then
    begin
      StatusImpressora:= false;
      while not StatusImpressora do
      begin
        Verifica_Status_Impressora_NF(StatusImpressora, porta_ecf);
        if (StatusImpressora = true) then
            ImprimeVendaTEF;
      end;
    end;

  except
    on E: Exception do
      TLog.Error(Self.ClassName + ' - BBtnImprimir_NFeClick - ' + E.Message);
  end;
end;

procedure TFrmNFE.BBtnNovoClick(Sender: TObject);
begin
  if (iniciado = false) then
  begin
    TMensagens.MensagemInformacao('Atenção!' + #10 + #13 +
      'Para gerar o FINANCEIRO, deve-se informar a data base para vencimento no campo Prim. Venc. e a condição de pagamento no campo Cond. Pag.'
      + #10 + #13 + #10 + #13 +
      'Para gerar ESTOQUE, o CFOP escolhido deve estar configurado para controlar estoque e, nas configurações do sistema, deve estar configurado para controlar estoque através da NFe.');
    Util.Habilita_Campos(FrmNFE);
    Util.Limpa_Campos(FrmNFE);
    BBtnSalvar.Enabled := false;
    BBtnEmail.Enabled := false;
    BBtnImprimir_NFe.Enabled := false;
    BBtnConsultar.Enabled := false;
    BBtnComprovante_Entrega.Enabled := false;
    BBtnGerar_Carne.Enabled := false;
    ClientDataSet1.Close;
    ClientDataSet1.CreateDataSet;
    LblValor.Caption := '';
    achei := false;
    qtde := 0;
    valor_tributavel := 0;
    iniciado := true;
    exclui := false;
    CFOP := '';
    encontrou_alertas := false;
    PageControl1.TabIndex := 0;
    PageControl3.TabIndex := 0;
    Escreve_Produto;
    Escreve_Imposto;
    placa_transportadora := '';
    telefone_transportadora := '';
    Atualiza_Pedido_Pendente;
    RGTipo_Operacao.ItemIndex := 1;
    CMBTipo_Nota.ItemIndex := -1;
    CmbForma_Pagamento.ItemIndex := 0;
    GBInformarPagamento.Visible:= false;
    qryitens_nf.Close;
    MEdtData_Emissao.Text := DateToStr(date);
    FDataEmissao := StrToDateTime(FormatDateTime('dd/mm/yyyy hh:mm', now));
    MEdtData_Entrada_Saida.Text := DateToStr(date);
    MEdtHora_Entrada_Saida.Text := FormatDateTime('hh:mm', now);
    Atualiza_Dados_OS;
    EdtCodigo_CFOP.SetFocus;
    EdtCodigo_Emitente.Text := IntToStr(codigo_empresa);
    EdtEmitente.Text := nome_fantasia;
    BBtnNovo.Enabled := false;
    TemCreditoDisponivel := false;
    cbVisualizarDANFE.Checked := false;
    MEdtData_Primeiro_Vencimento.Clear;
    EdtSerie.Text := '1';
    EdtModelo.Text:= '55';
    dm.ACBrNFe1.Configuracoes.Geral.ModeloDF:= moNFe;
    dm.ACBrNFe1.DANFE.ImprimeEmUmaLinha:= false;

    if (gerar_financeiro = 1) then
    begin
      BtnGerarParcela.Enabled := true;
      BtnExcluirParcela.Enabled := true;
    end
    else
    begin
      BtnGerarParcela.Enabled := false;
      BtnExcluirParcela.Enabled := false
    end;

    DadosEmissaoNFE:= TDadosEmissaoNFE.Create;
    DadosEmissaoNFERecebimento:= TDadosEmissaoNFERecebimento.Create;
    // oLF:= TLancamentoFinanceiroEntidade.Create;
    // oPLF:= TParcelasLancamentoFinanceiroEntidade.Create;
    // oCli:= TCliente.Create;
    // oCP:= TCondicaoPagamentoEntidade.Create;
    oCPDominio := TCondicaoPagamentoDominio.create(dm.ADOConnection1);
  end;
end;

procedure TFrmNFE.Calcula_Imposto_Final;
var
  base_total, valor_icms_total, base_total_st, valor_icms_total_st,
    valor_total_produtos, valor_frete, valor_seguro, outras_despesas, desconto,
    valor_ipi, valor_pis, valor_cofins, valot_total_nota, acr, tot_des_acr,
    valor_un, total_imposto, total_imposto_aux, total_nota: double;
  obs_permite_credito, obs_nao_permite_credito, i: Integer;
  vaux, observacao, observacao_aux: AnsiString;
begin
  try
    TLog.Info('--- ENTROU NO MÉTODO Calcula_Imposto_Final ---');
    base_total := 0;
    valor_icms_total := 0;
    valot_total_nota := 0;
    valor_total_produtos := 0;
    base_total_st := 0;
    valor_icms_total_st := 0;
    valor_frete := 0;
    valor_seguro := 0;
    desconto := 0;
    acr := 0;
    valor_ipi := 0;
    valor_pis := 0;
    valor_cofins := 0;
    outras_despesas := 0;
    total_imposto_aux := 0;
    total_imposto := 0;
    observacao := '';
    observacao_aux := '';
    obs_permite_credito := 0;
    obs_nao_permite_credito := 0;

    EdtBase_Calculo_ICMS.Text := '0,00';
    EdtValor_ICMS.Text := '0,00';
    EdtBase_Calculo_ICMS_Substituicao.Text := '0,00';
    EdtValor_ICMS_Substituicao.Text := '0,00';
    EdtValor_Total_Produtos.Text := '0,00';
    EdtValor_Frete.Text := '0,00';
    EdtValor_Seguro.Text := '0,00';
    EdtOutras_Despesas.Text := '0,00';
    EdtDesconto_Nota.Text := '0,00';
    EdtValor_Total_IPI.Text := '0,00';
    EdtValor_Total_PIS.Text := '0,00';
    EdtValor_Total_COFINS.Text := '0,00';
    EdtValor_Total_Nota.Text := '0,00';

    { if (regime_tributario_emitente <> '0') then
      begin
      qryitens_nf.First;
      while not qryitens_nf.Eof do
      begin

      if (qryitens_nfBC.AsString <> '') then
      begin
      base_total:= qryitens_nfBC.AsFloat + StrToFloat(EdtBase_Calculo_ICMS.Text);
      EdtBase_Calculo_ICMS.Text:= FloatToStr(Calcula_Valor(FloatToStr(base_total)));
      end;

      if (qryitens_nfValor_ICMS.AsString <> '') then
      begin
      valor_icms_total:= qryitens_nfValor_ICMS.AsFloat + StrToFloat(EdtValor_ICMS.Text);
      EdtValor_ICMS.Text:= FloatToStr(Calcula_Valor(FloatToStr(valor_icms_total)));
      end;

      //if (qryitens_nfSub_Total.AsString <> '') then
      //begin
      vaux:= StringReplace(qryitens_nfValor_Original.AsString, ThousandSeparator, '', [rfReplaceAll]);

      valor_un:= StrToFloat(vaux);

      valor_total_produtos:= (valor_un * qryitens_nfQtde.AsFloat) + valor_total_produtos;
      valor_total_produtos:= Calcula_Valor(FloatToStr(valor_total_produtos));

      //vaux:= StringReplace(qryitens_nfValor_Unitario.AsString, ThousandSeparator, '', [rfReplaceAll]);

      //valor_un:= StrToFloat(vaux);

      //valor_total_produtos:= (valor_un * qryitens_nfQtde.AsFloat) + StrToFloat(EdtValor_Total_Produtos.Text);
      //valor_total_produtos:= Calcula_Valor(FloatToStr(valor_total_produtos));
      EdtValor_Total_Produtos.Text:= FloatToStr(valor_total_produtos);
      //end;

      if (qryitens_nfValor_Frete.AsString <> '') then
      begin
      valor_frete:= qryitens_nfValor_Frete.AsFloat + StrToFloat(EdtValor_Frete.Text);
      EdtValor_Frete.Text:= FloatToStr(Calcula_Valor(FloatToStr(valor_frete)));
      end;

      if (qryitens_nfValor_Seguro.AsString <> '') then
      begin
      valor_seguro:= qryitens_nfValor_Seguro.AsFloat + StrToFloat(EdtValor_Seguro.Text);
      EdtValor_Seguro.Text:= FloatToStr(Calcula_Valor(FloatToStr(valor_seguro)));
      end;


      //if (qryitens_nfDesc_Acr.AsString <> '') then
      //begin
      //if (qryitens_nfdOUa.AsString = 'D') then              //comentei aqui, pois para ficar igual a impressao do DAV,
      //begin                                                 //que é Valor_Unitario * Qtde.
      //desconto:= desconto + qryitens_nfDesc_Acr.AsFloat;
      desconto:= desconto + ( (qryitens_nfDesc_Acr.AsFloat * qryitens_nfQtde.AsFloat) - qryitens_nfOutras_Despesas.AsFloat);
      //end
      //else
      //begin
      //acr:= acr + qryitens_nfDesc_Acr.AsFloat;
      //end;
      //end;

      if (qryitens_nfValor_IPI.AsString <> '') then
      begin
      valor_ipi:= qryitens_nfValor_IPI.AsFloat + StrToFloat(EdtValor_Total_IPI.Text);
      EdtValor_Total_IPI.Text:= FloatToStr(Calcula_Valor(FloatToStr(valor_ipi)));
      end;

      if (qryitens_nfValor_PIS.AsString <> '') then
      begin
      valor_pis:= qryitens_nfValor_PIS.AsFloat + StrToFloat(EdtValor_Total_PIS.Text);
      EdtValor_Total_PIS.Text:= FloatToStr(Calcula_Valor(FloatToStr(valor_pis)));
      end;

      if (qryitens_nfValor_COFINS.AsString <> '') then
      begin
      valor_cofins:= qryitens_nfValor_COFINS.AsFloat + StrToFloat(EdtValor_Total_COFINS.Text);
      EdtValor_Total_COFINS.Text:= FloatToStr(Calcula_Valor(FloatToStr(valor_cofins)));
      end;

      if (qryitens_nfEnquadramento.AsString = '0') then
      begin
      if (qryitens_nfTipo_Recolhimento.AsString = 'TRIBUTADO') then
      begin
      obs_permite_credito:= qryitens_nfCodigo_Obs_Fiscal.AsInteger;
      total_imposto_aux:= Calcula_Valor(qryitens_nfSub_Total.AsString);
      total_imposto:= total_imposto + total_imposto_aux;
      end
      else
      begin
      obs_nao_permite_credito:= qryitens_nfCodigo_Obs_Fiscal.AsInteger;
      end;
      end
      else
      begin
      obs_nao_permite_credito:= qryitens_nfCodigo_Obs_Fiscal.AsInteger;
      end;


      qryitens_nf.Next;
      end;
      end
      else
      begin }

    qryitens_nf.First;
    while not qryitens_nf.Eof do
    begin
      vaux := StringReplace(qryitens_nfValor_Original.AsString,
        ThousandSeparator, '', [rfReplaceAll]);
      TLog.Debug(' Valor da variável vaux :' + vaux);
      valor_un := StrToFloat(vaux);
      TLog.Debug(' Valor da variável valor_un :' + FloatToStr(valor_un));
      valor_total_produtos := (valor_un * qryitens_nfQtde.AsFloat) +
        valor_total_produtos;
      TLog.Debug(' Valor da variável valor_total_produtos :' +
        FloatToStr(valor_total_produtos));
      valor_total_produtos := Calcula_Valor(FloatToStr(valor_total_produtos));

      // if (qryitens_nfDesc_Acr.AsString <> '') then
      // begin
      // if (qryitens_nfdOUa.AsString = 'D') then              //comentei aqui, pois para ficar igual a impressao do DAV,
      // begin                                                 //que é Valor_Unitario * Qtde.
      desconto := desconto +
        ((qryitens_nfDesc_Acr.AsFloat * qryitens_nfQtde.AsFloat) -
        qryitens_nfOutras_Despesas.AsFloat);
      TLog.Debug(' Valor da variável desconto :' + FloatToStr(desconto));
      // end
      // else
      // begin
      // acr:= acr + qryitens_nfDesc_Acr.AsFloat;
      // end;
      // end;

      if (mostra_imposto = 0) then
      begin
        if (qryitens_nfBC.AsString <> '') then
        begin
          base_total := base_total + qryitens_nfBC.AsFloat;
          // EdtBase_Calculo_ICMS.Text:= FloatToStr(Calcula_Valor(FloatToStr(base_total)));
          TLog.Debug(' Valor da variável base_total :' +
            FloatToStr(base_total));
        end;

        if (qryitens_nfValor_ICMS.AsString <> '') then
        begin
          valor_icms_total := valor_icms_total + qryitens_nfValor_ICMS.AsFloat;
          TLog.Debug(' Valor da variável valor_icms_total :' +
            FloatToStr(valor_icms_total));
          // EdtValor_ICMS.Text:= FloatToStr(Calcula_Valor(FloatToStr(valor_icms_total)));
        end;
      end;

      if (qryitens_nfValor_IPI.AsString <> '') then
      begin
        // valor_ipi:= qryitens_nfValor_IPI.AsFloat + StrToFloat(EdtValor_Total_IPI.Text);
        EdtValor_Total_IPI.Text := '0,00';
      end;

      if (qryitens_nfBC_ST.AsString <> '') then
      begin
        base_total_st := base_total_st + qryitens_nfBC_ST.AsFloat;
        TLog.Debug(' Valor da variável base_total_st :' +
          FloatToStr(base_total_st));
        // EdtBase_Calculo_ICMS_Substituicao.Text:= FloatToStr(base_total_st);
      end;

      if (qryitens_nfValor_ICMS_ST.AsString <> '') then
      begin
        valor_icms_total_st := valor_icms_total_st +
          qryitens_nfValor_ICMS_ST.AsFloat;
        TLog.Debug(' Valor da variável valor_icms_total_st :' +
          FloatToStr(valor_icms_total_st));
        // EdtValor_ICMS_Substituicao.Text:= FloatToStr(valor_icms_total_st);
      end;

      if (qryitens_nfValor_PIS.AsString <> '') then
      begin
        // valor_pis:= qryitens_nfValor_PIS.AsFloat + StrToFloat(EdtValor_Total_PIS.Text);
        EdtValor_Total_PIS.Text := '0,00';
      end;

      if (qryitens_nfValor_COFINS.AsString <> '') then
      begin
        // valor_cofins:= qryitens_nfValor_COFINS.AsFloat + StrToFloat(EdtValor_Total_COFINS.Text);
        EdtValor_Total_COFINS.Text := '0,00';
      end;

      qryitens_nf.Edit;
      if (qryitens_nfEnquadramento.AsString = '0') and
        (qryitens_nfCST.AsString = '00') then
      begin
        qryitens_nfCSOSN.AsString := '101';
      end
      else if (qryitens_nfEnquadramento.AsString = '1') and
        (qryitens_nfCST.AsString = '00') then
      begin
        qryitens_nfCSOSN.AsString := '102';
      end
      else if (qryitens_nfEnquadramento.AsString = '0') and
        (qryitens_nfCST.AsString = '10') then
      begin
        qryitens_nfCSOSN.AsString := '201';
      end
      else if (qryitens_nfEnquadramento.AsString = '1') and
        (qryitens_nfCST.AsString = '10') then
      begin
        qryitens_nfCSOSN.AsString := '202';
      end
      else if (qryitens_nfCST.AsString = '60') then
      begin
        qryitens_nfCSOSN.AsString := '500';
      end;
      qryitens_nf.Post;

      if (qryitens_nfEnquadramento.AsString = '0') then
      begin
        if (qryitens_nfTipo_Recolhimento.AsString = 'TRIBUTADO') then
        begin
          obs_permite_credito := qryitens_nfCodigo_Obs_Fiscal.AsInteger;
          total_imposto_aux := Calcula_Valor(qryitens_nfSub_Total.AsString);
          total_imposto := total_imposto + total_imposto_aux;
        end
        else
        begin
          obs_nao_permite_credito := qryitens_nfCodigo_Obs_Fiscal.AsInteger;
        end;
      end
      else
      begin
        obs_nao_permite_credito := qryitens_nfCodigo_Obs_Fiscal.AsInteger;
      end;

      qryitens_nf.next;
    end;
    // end;

    if (obs_permite_credito <> 0) then
    begin
      total_imposto := (total_imposto * (StrToFloat(aliquota_sn) / 100));
      total_imposto := Calcula_Valor(FloatToStr(total_imposto));

      MMOObservacao.Text := Pega_Obs_Fiscal(obs_permite_credito);
      MMOObservacao.Text := StringReplace(MMOObservacao.Text, '**', aliquota_sn,
        [rfReplaceAll]);
      MMOObservacao.Text := StringReplace(MMOObservacao.Text, '*',
        FloatToStr(total_imposto), [rfReplaceAll]);
    end
    else
    begin
      MMOObservacao.Text := Pega_Obs_Fiscal(obs_nao_permite_credito);
    end;

    // EdtOutras_Despesas.Text:= FloatToStr(acr);    //já venha do Valor unitário.

    // valot_total_nota:= valor_total_produtos + valor_ipi - desconto;// + valor_icms_total_st + valor_ipi - desconto;// + valor_pis + valor_cofins;
    Util.FormataFloat(2, EdtBase_Calculo_ICMS, base_total);
    Util.FormataFloat(2, EdtValor_ICMS, valor_icms_total);

    Util.FormataFloat(2, EdtBase_Calculo_ICMS_Substituicao, base_total_st);
    Util.FormataFloat(2, EdtValor_ICMS_Substituicao, valor_icms_total_st);

    Util.FormataFloat(2, EdtValor_Total_Produtos, valor_total_produtos);
    Util.FormataFloat(2, EdtValor_Total_Nota,
      ((valor_total_produtos + valor_icms_total_st) - desconto));
    Util.FormataFloat(2, EdtDesconto_Nota, desconto);

    // EdtValor_Total_Produtos.Text:= qrypedido_pendenteTotal_Produtos.AsString;
    // EdtValor_Total_Nota.Text:= qrypedido_pendenteTotal_Pedido.AsString;
    // EdtDesconto_Nota.Text:= qrypedido_pendenteDesc_Acr.AsString; //comentei aqui também, para que o desconto
    Calcula_Imposto_Lei;
    //MMOObservacao.Text := MMOObservacao.Text + #10+#13+#10+#13+ 'MD-5: '+pMD5_Arquivos;
  except
    on E: Exception do
      TLog.Error(Self.ClassName + ' - Calcula_Imposto_Final - ' + E.Message);
  end;
  TLog.Info('--- SAIU DO MÉTODO Calcula_Imposto_Final ---');
end;

procedure TFrmNFE.Calcula_Imposto_Lei;
var
  aliquota, valor_unitario, total_nota, valor_imposto,
    perc_imposto_venda: double;
begin
  TLog.Info('--- ENTROU NO MÉTODO Calcula_Imposto_Lei ---');
  try
    aliquota := 0;
    valor_unitario := 0;
    valor_imposto := 0;
    total_nota := StrToFloat(EdtValor_Total_Nota.Text);
    TLog.Debug('Valor da variável aliquota :' + FloatToStr(aliquota));
    TLog.Debug('Valor da variável valor_unitario :' +
      FloatToStr(valor_unitario));
    TLog.Debug('Valor da variável valor_imposto :' + FloatToStr(valor_imposto));
    TLog.Debug('Valor da variável total_nota :' + FloatToStr(total_nota));
    TLog.Info('---LAÇO DE REPETIÇÃO qryitens_nf');
    qryitens_nf.First;
    while not(qryitens_nf.Eof) do
    begin
      valor_unitario := 0;
      aliquota := 0;

      aliquota := Retorna_Aliquota_NCM(qryitens_nfNCM.AsString,
        qryitens_nfOrigem.AsString, dm.ADOConnection1);
      valor_unitario := qryitens_nfValor_Unitario.AsFloat;

      valor_imposto := valor_imposto + (valor_unitario * (aliquota / 100));
      valor_imposto := Calcula_Valor(FloatToStr(valor_imposto));
      TLog.Debug('Valor da variável aliquota :' + FloatToStr(aliquota));
      TLog.Debug('Valor da variável valor_unitario :' +
        FloatToStr(valor_unitario));
      TLog.Debug('Valor da variável valor_imposto :' +
        FloatToStr(valor_imposto));
      TLog.Debug('Valor da variável total_nota :' + FloatToStr(total_nota));
      qryitens_nf.next;
    end;
    TLog.Info('--- fim LAÇO DE REPETIÇÃO qryitens_nf');

    valor_imposto := Calcula_Valor(FloatToStr(valor_imposto));
    perc_imposto_venda := ((valor_imposto / total_nota) * 100);
    perc_imposto_venda := Calcula_Valor(FloatToStr(perc_imposto_venda));

    MMOObservacao.Text := MMOObservacao.Text + #10 + #13 + #10 + #13
      + 'Val. Aprox. dos Tributos R$' + FloatToStr(valor_imposto) + '(' +
      FloatToStr(perc_imposto_venda) + '%) Fonte: IBPT';
  except
    on E: Exception do
      TLog.Error(Self.ClassName + ' - Calcula_Imposto_Lei - ' + E.Message);

  end;
  TLog.Debug('Valor da variável valor_imposto :' + FloatToStr(valor_imposto));
  TLog.Debug('Valor da variável perc_imposto_venda :' +
    FloatToStr(perc_imposto_venda));
  TLog.Info('--- SAIU DO MÉTODO Calcula_Imposto_Lei ---');
end;

function TFrmNFE.Pega_Obs_Fiscal(Codigo_Obs: Integer): AnsiString;
var
  qAux: TADOQuery;
begin
  try
    try
      qAux := TADOQuery.create(nil);
      with qAux, sql do
      begin
        Close;
        Connection := dm.ADOConnection1;
        Clear;
        Add('select COF.Descricao from Cadastro_Observacao_Fiscal COF');
        Add('where COF.Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value := Codigo_Obs;
        open;
        Result := qAux.FieldByName('Descricao').AsString;
      end;
    except
      on E: Exception do
        TLog.Error(Self.ClassName + ' - Pega_Obs_Fiscal - ' + E.Message);
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmNFE.CBEntregaClick(Sender: TObject);
begin
  { try
    if (CBEntrega.Checked = true) then
    GBEntrega.Visible := false
    else
    begin
    with ADOQuery1, sql do
    begin
    Close;
    Clear;
    Add('select EC.*, L.Descricao, L.Tipo_Logradouro, L.CEP from Endereco_Cliente EC');
    Add('inner join Logradouro L on (L.Codigo = EC.Codigo_Endereco)');
    Add('where EC.Codigo_Cliente = :Codigo');
    Parameters.ParamByName('Codigo').Value :=
    StrToInt(EdtCodigo_Destinatario.Text);
    open;
    GBEntrega.Visible := true;
    end;
    end;
    except
    on E: Exception do
    TLog.Error(Self.ClassName + ' - CBEntregaClick - ' + E.Message);
    end; }
end;

procedure TFrmNFE.CBRetiradaClick(Sender: TObject);
begin
  { if (CBRetirada.Checked = true) then
    GBRetirada.Visible := false
    else
    GBRetirada.Visible := true; }
end;

procedure TFrmNFE.ClientDataSet1AfterPost(DataSet: TDataSet);
begin
  TLog.Info('---DIGITOU DENTRO DA GRID DE PARCELAS EM NFE (AFTER POST)---');
  LblValor.Caption := FormatFloat('#0.0,0', ClientDataSet1ValorTeste.Value);
  LblValor.Caption := StringReplace(LblValor.Caption, ThousandSeparator, '',
    [rfReplaceAll]);
end;

procedure TFrmNFE.ClientDataSet1BeforePost(DataSet: TDataSet);
begin
  TLog.Info('---DIGITOU DENTRO DA GRID DE PARCELAS EM NFE (BEFORE POST)---');
  if (ClientDataSet1Status.Value = 'PAGO') AND
    (ClientDataSet1DataPagamento.Value = 0) then
  begin
    Application.MessageBox
      ('Status configurado como PAGO mas sem data de pagamento. Por favor, verifique.',
      'Verifique!', MB_OK + MB_ICONHAND);
    abort;
  end;

  if (ClientDataSet1Status.Value = 'PENDENTE') AND
    (ClientDataSet1DataPagamento.Value <> 0) then
  begin
    Application.MessageBox
      ('Status configurado como PENDENTE mas com data de pagamento. Por favor, verifique.',
      'Verifique!', MB_OK + MB_ICONHAND);
    abort;
  end;

  if (ClientDataSet1Data.Value = 0) then
  begin
    Application.MessageBox
      ('Data de vencimento não pode ser vazia. Por favor, verifique.',
      'Verifique!', MB_OK + MB_ICONHAND);
    abort;
  end;

  if (ClientDataSet1Valor.Value = 0) or (ClientDataSet1Valor.Value = null) then
  begin
    Application.MessageBox
      ('Valor não pode ser zerado ou nulo. Por favor, verifique.', 'Verifique!',
      MB_OK + MB_ICONHAND);
    abort;
  end;

end;

procedure TFrmNFE.ClientDataSet1DataPagamentoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '30/12/1899') then
  begin
    Text := ''
  end
  else
  begin
    Text := Sender.AsString;
  end;
end;

procedure TFrmNFE.CMBTipo_NotaChange(Sender: TObject);
begin
  //Ao escolher o tipo da operação, é verificado se já foi emitida a NFCe ou a NFe para o pedido.
  if (CMBTipo_Nota.ItemIndex = 0) then
  begin
    if (qrypedido_pendenteTipoVenda.AsString = 'NFE') then
    begin
      Application.MessageBox('Já foi emitida a NFe para este pedido, mas ainda não foi emitida a NFCe.', 'NFe já emitida.', mb_ok+MB_ICONQUESTION);
      CMBTipo_Nota.ItemIndex:= 1;
      EdtModelo.Text:= '65';
      dm.ACBrNFe1.Configuracoes.Geral.ModeloDF:= moNFCe;
      dm.ACBrNFe1.DANFE.ImprimeEmUmaLinha:= true;
      dm.ACBrNFe1.DANFE:= dm.ACBrNFeDANFCeFortes1;
      RGFrete.ItemIndex:= 3;
      BtnInformar_Pagamento.Visible:= true;
      EdtN_Nota_Fiscal.Text:= IntToStr(Gera_N_NFCe);
      GBInformarPagamento.Visible:= true;
      exit;
    end;

    EdtModelo.Text:= '55';
    dm.ACBrNFe1.Configuracoes.Geral.ModeloDF:= moNFe;
    dm.ACBrNFe1.DANFE.ImprimeEmUmaLinha:= false;
    dm.ACBrNFe1.DANFE:= dm.ACBrNFeDANFeRL1;
    RGFrete.ItemIndex:= 0;
    BtnInformar_Pagamento.Visible:= false;
    EdtN_Nota_Fiscal.Text:= IntToStr(Gera_N_NFe);
    GBInformarPagamento.Visible:= false;
  end
  else
  begin
    if (qrypedido_pendenteTipoVenda.AsString = 'NFCE') then
    begin
      Application.MessageBox('Já foi emitida a NFCe para este pedido, mas ainda não foi emitida a NFe.', 'NFCe já emitida.', mb_ok+MB_ICONQUESTION);
      CMBTipo_Nota.ItemIndex:= 0;
      EdtModelo.Text:= '55';
      dm.ACBrNFe1.Configuracoes.Geral.ModeloDF:= moNFe;
      dm.ACBrNFe1.DANFE.ImprimeEmUmaLinha:= false;
      dm.ACBrNFe1.DANFE:= dm.ACBrNFeDANFeRL1;
      RGFrete.ItemIndex:= 0;
      BtnInformar_Pagamento.Visible:= false;
      EdtN_Nota_Fiscal.Text:= IntToStr(Gera_N_NFe);
      GBInformarPagamento.Visible:= false;
      exit;
    end;

    EdtModelo.Text:= '65';
    dm.ACBrNFe1.Configuracoes.Geral.ModeloDF:= moNFCe;
    dm.ACBrNFe1.DANFE.ImprimeEmUmaLinha:= true;
    dm.ACBrNFe1.DANFE:= dm.ACBrNFeDANFCeFortes1;
    RGFrete.ItemIndex:= 3;
    BtnInformar_Pagamento.Visible:= true;
    EdtN_Nota_Fiscal.Text:= IntToStr(Gera_N_NFCe);
    GBInformarPagamento.Visible:= true;
  end;
end;

function TFrmNFE.Confira: Boolean;
begin
  Confira := false;

  if EdtN_Nota_Fiscal.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 0;
    EdtN_Nota_Fiscal.SetFocus;
    abort;
  end;

  if EdtModelo.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 0;
    EdtModelo.SetFocus;
    abort;
  end;

  if EdtSerie.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 0;
    EdtSerie.SetFocus;
    abort;
  end;

  if MEdtData_Emissao.Text = '  /  /    ' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 0;
    MEdtData_Emissao.SetFocus;
    abort;
  end;

  if MEdtData_Entrada_Saida.Text = '  /  /    ' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 0;
    MEdtData_Entrada_Saida.SetFocus;
    abort;
  end;

  if EdtCodigo_CFOP.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 0;
    EdtCodigo_CFOP.SetFocus;
    abort;
  end;

  if CMBTipo_Nota.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 0;
    CMBTipo_Nota.SetFocus;
    abort;
  end;

  if CmbForma_Pagamento.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 0;
    CmbForma_Pagamento.SetFocus;
    abort;
  end;

  if EdtCodigo_Emitente.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 1;
    EdtCodigo_Emitente.SetFocus;
    abort;
  end;

  if EdtCodigo_Destinatario.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 1;
    EdtCodigo_Destinatario.SetFocus;
    abort;
  end;

  if EdtBase_Calculo_ICMS.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 3;
    EdtBase_Calculo_ICMS.SetFocus;
    abort;
  end;

  if EdtValor_ICMS.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 3;
    EdtValor_ICMS.SetFocus;
    abort;
  end;

  if EdtBase_Calculo_ICMS_Substituicao.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 3;
    EdtBase_Calculo_ICMS_Substituicao.SetFocus;
    abort;
  end;

  if EdtValor_ICMS_Substituicao.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 3;
    EdtValor_ICMS_Substituicao.SetFocus;
    abort;
  end;

  if EdtValor_Total_Produtos.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 3;
    EdtValor_Total_Produtos.SetFocus;
    abort;
  end;

  if EdtValor_Frete.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 3;
    EdtValor_Frete.SetFocus;
    abort;
  end;

  if EdtValor_Seguro.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 3;
    EdtValor_Seguro.SetFocus;
    abort;
  end;

  if EdtDesconto_Nota.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 3;
    EdtDesconto_Nota.SetFocus;
    abort;
  end;

  if EdtValor_Total_IPI.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 3;
    EdtValor_Total_IPI.SetFocus;
    abort;
  end;

  if EdtValor_Total_PIS.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 3;
    EdtValor_Total_PIS.SetFocus;
    abort;
  end;

  if EdtValor_Total_COFINS.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 3;
    EdtValor_Total_COFINS.SetFocus;
    abort;
  end;

  if EdtOutras_Despesas.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 3;
    EdtOutras_Despesas.SetFocus;
    abort;
  end;

  if EdtValor_Total_Nota.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 3;
    EdtValor_Total_Nota.SetFocus;
    abort;
  end;

  if EdtValor_Total_Servicos.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 3;
    EdtValor_Total_Servicos.SetFocus;
    abort;
  end;

  if EdtBase_Calculo_ISSQN.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 3;
    EdtBase_Calculo_ISSQN.SetFocus;
    abort;
  end;

  if EdtValor_ISSQN.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 3;
    EdtValor_ISSQN.SetFocus;
    abort;
  end;

  if EdtQuantidade_Transportada.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 3;
    EdtQuantidade_Transportada.SetFocus;
    abort;
  end;

  if EdtPeso_Bruto.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 3;
    EdtPeso_Bruto.SetFocus;
    abort;
  end;

  if EdtPeso_Liquido.Text = '' then
  begin
    Mensagem_Falta_Dados;
    PageControl1.TabIndex := 3;
    EdtPeso_Liquido.SetFocus;
    abort;
  end;

  Confira := true;
end;

function TFrmNFE.Confira_Itens: Boolean;
begin
  Result := true;
end;

procedure TFrmNFE.BtnConfirmarClick(Sender: TObject);
var
  i, J: Integer;
  SelectedRowStr, pronta: string;
begin
  try
    TLog.Info(
      '--- CLICOU NO BOTÃO CONFIRMAR PEDIDO NA ESCOLHA DE PEDIDO DO CLIENTE PARA GERAR A NOTA ---');
    if (EdtCodigo_CFOP.Text = '') then
    begin
      TLog.Debug(' Vericando de CFOP está em branco ');
      Application.MessageBox
        (PWideChar('Deve-se escolher o CFOP, antes de informar o pedido.'),
        'Erro', MB_OK + MB_ICONHAND);
      EdtCodigo_CFOP.SetFocus;
      exit;
    end;

    if (Application.MessageBox
      ('Confirma a emissão da NFe com produtos dos pedidos selecionados?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION)) = idyes then
    begin
      FPedidosNormal := '';
      FPedidosWhere := '';
      FCOO := '';
      TLog.Debug(' Valor da variável FPedidosNormal : ' + FPedidosNormal);
      TLog.Debug(' Valor da variável FPedidosWhere : ' + FPedidosWhere);
      TLog.Debug(' Valor da variável FCOO : ' + FCOO);

      for i := 0 to cxGrid1DBTableView1.ViewData.RowCount - 1 do
      begin
        TLog.Debug(' Percorrendo cxGrid1DBTableView1 ');
        FPedidosWhere := FPedidosWhere + 'P.Codigo = ' +
          QuotedStr(cxGrid1DBTableView1.ViewData.Records[i].Values
          [cxGrid1DBTableView1Codigo.Index]) + ' OR ';

        TLog.Debug(' Valor da variável FPedidosWhere : ' + FPedidosWhere);

        if (cxGrid1DBTableView1.ViewData.Records[i].Values
          [cxGrid1DBTableView1N_Pedido.Index] <> '') then
          FPedidosNormal := FPedidosNormal +
            cxGrid1DBTableView1.ViewData.Records[i].Values
            [cxGrid1DBTableView1N_Pedido.Index] + ', ';
        TLog.Debug(' Valor da variável FPedidosNormal : ' + FPedidosNormal);

        if (cxGrid1DBTableView1.ViewData.Records[i].Values
          [cxGrid1DBTableView1COO.Index] <> '') then
          FCOO := FCOO + cxGrid1DBTableView1.ViewData.Records[i].Values
            [cxGrid1DBTableView1COO.Index] + ', ';
        TLog.Debug(' Valor da variável FCOO : ' + FCOO);
      end;
      TLog.Info('--- Percorreu toda a cxGrid1DBTableView1 --- ');

      FPedidosWhere := Copy(FPedidosWhere, 0, Length(FPedidosWhere) - 4);
      FPedidosNormal := Copy(FPedidosNormal, 0, Length(FPedidosNormal) - 2);
      FCOO := Copy(FCOO, 0, Length(FCOO) - 2);

      TLog.Debug(' Valor da variável FPedidosNormal : ' + FPedidosNormal);
      TLog.Debug(' Valor da variável FPedidosWhere : ' + FPedidosWhere);
      TLog.Debug(' Valor da variável FCOO : ' + FCOO);

      { for I := 0 to cxGrid1DBTableView1.Controller.SelectedRowCount - 1 do
        begin
        for J := 0 to cxGrid1DBTableView1.Controller.SelectedRows[I]
        .ValueCount - 1 do
        begin
        SelectedRowStr := SelectedRowStr +
        VarToStr(cxGrid1DBTableView1.Controller.SelectedRows[I].Values
        [J]) + ',';
        SelectedRowStr := Copy(SelectedRowStr, 1, Length(SelectedRowStr) - 1);
        end;
        pronta := pronta + 'P.N_Pedido = ' + Copy(SelectedRowStr, 6, 11) + ' OR ';
        SelectedRowStr := '';
        end; }

      // pronta := Copy(pronta, 1, Length(pronta) - 4);
      // FPedidos := pronta;

      // FPedidos := FPedidos + 'P.N_Pedido = ' + QuotedStr(qrypedido_pendenteN_Pedido.AsString);

      MMOPedido.Text := FPedidosNormal;
      MMOCOO.Text := FCOO;
      MEdtData_Primeiro_Vencimento.Text :=
        qrypedido_pendenteData_Venda.AsString;
      EdtEmail.Text := qrypedido_pendenteEmail.AsString;
      FNFEDominio.carregarReferenciaDevolucaoPorPedido
        (qrypedido_pendenteCodigo.AsInteger, FReferenciaDevolucaoQuery);
      habilitarReferenciaDevolucao(FReferenciaDevolucaoQuery.RecordCount > 0);
      BBtnGerarNFe.Enabled := true;
      TLog.Info('--- VAI ENTRAR NO MÉTODO Atualiza_Produto ---');

      Atualiza_Produto;
      TLog.Info('--- SAIU DO MÉTODO Atualiza_Produto ---');
      PageControl3.TabIndex := 1;
    end;
  except
    on E: Exception do
      TLog.Error(Self.ClassName + ' DBGrid3DblClick ' + E.Message);
  end;
  TLog.Info(
    '--- FIM DO BOTÃO CONFIRMAR PEDIDO NA ESCOLHA DE PEDIDO DO CLIENTE PARA GERAR A NOTA ---');
end;

procedure TFrmNFE.BtnGerarParcelaClick(Sender: TObject);
var
  valaux, valaux2: double;
  i: Integer;
  data: TDate;
  doc: Integer;
  data_vencim: TDate;
begin
  TLog.Info('---CLICOU NO BOTÃO GERAR PARCELAS---');
  if (MEdtData_Primeiro_Vencimento.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    MEdtData_Primeiro_Vencimento.SetFocus;
    exit;
  end;
  TLog.Debug('--- Verificou data em branco ---');

  if (EdtCodigo_Condicao_Pagamento.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Condicao_Pagamento.SetFocus;
    exit;
  end;
  TLog.Debug('--- Verificou Codigo_Condicao_Pagamento em branco ---');

  i := 0;
  ClientDataSet1.Close;
  ClientDataSet1.CreateDataSet;
  ClientDataSet1.open;
  TLog.Debug('--- Fechou. criou e abriu ClientDataSet1 ---');
  doc := StrToInt(EdtN_Nota_Fiscal.Text + '1');
  data_vencim := StrToDateTime(MEdtData_Primeiro_Vencimento.Text);

  TLog.Debug('--- Vai percorrer quantidade de parcelas no ClientDataSet1 ---');
  TLog.Debug('Quantidade de parcelas: '+IntToStr(qtdeParcela));
  for i := 1 to qtdeParcela do
  begin
    ClientDataSet1.Append;
    ClientDataSet1NDoc.Value := IntToStr(doc);
    ClientDataSet1Data.Value := data_vencim;

    TLog.Debug('--- Valor da variável doc : ---' + IntToStr(doc));

    if (tipoPagamento = 'A PRAZO') then
    begin
      TLog.Debug('--- Pagamento A PRAZO ---');
      ClientDataSet1Status.Value := 'PENDENTE';
      ClientDataSet1DataPagamento.Value := 0;
    end
    else
    begin
      TLog.Debug('--- Pagamento A vista ---');
      ClientDataSet1Status.Value := 'PAGO';
      ClientDataSet1DataPagamento.Value := date;
    end;

    valaux2 := StrToFloat(EdtValor_Total_Nota.Text);
    valaux2 := (valaux2 / qtdeParcela);
    ClientDataSet1Valor.Value := valaux2;

    TLog.Debug('--- Variável valaux2: ' + FloatToStr(valaux2));

    if (tipo_dias = 0) then
    begin
      data_vencim := IncDay(data_vencim, prazoPagamento);
      TLog.Debug('--- Variável data_vencim: ' + DateToStr(data_vencim));
    end
    else if (tipo_dias = 1) then
    begin
      data_vencim := data_vencim + prazoPagamento;
      TLog.Debug('--- Variável data_vencim: ' + DateToStr(data_vencim));
      TLog.Debug('--- Variável prazoPagamento: ' + IntToStr(prazoPagamento));

    end
    else if (tipo_dias = 2) then
    begin
      data_vencim := IncMonth(data_vencim, 1);
      TLog.Debug('--- Variável data_vencim: ' + DateToStr(data_vencim));
    end;

    Inc(doc);
    ClientDataSet1.Post;
  end;
  LblValor.Caption := FormatFloat('#0.0,0', ClientDataSet1ValorTeste.Value);
  LblValor.Caption := StringReplace(LblValor.Caption, ThousandSeparator, '',
    [rfReplaceAll]);
  TLog.Info('---FIM CLICOU NO BOTÃO GERAR PARCELAS---');
end;

procedure TFrmNFE.BtnExcluirParcelaClick(Sender: TObject);
begin
  // ClientDataSet1.Close;
  TLog.Info('--- CLICOU NO BOTAO EXCLUIR PARCELA ---');
  if (ClientDataSet1.Active) and not(ClientDataSet1.IsEmpty) then
  begin
    if (Confirma_Exclusao) then
    begin
      ClientDataSet1.Delete;
    end;
  end
  else
  begin
    ShowMessage('Sem parcela(s) para excluir.');
  end;
  TLog.Info('--- FIM DO BOTAO EXCLUIR PARCELA ---');
end;

procedure TFrmNFE.cxGrid1DBTableView1DataControllerFilterChanged
  (Sender: TObject);
begin
  if (cxGrid1DBTableView1Codigo.Filtered) or
    (cxGrid1DBTableView1N_Pedido.Filtered) or
    (cxGrid1DBTableView1Data_Venda.Filtered) or
    (cxGrid1DBTableView1Total_Pedido.Filtered) or
    (cxGrid1DBTableView1Nome_Nome_Fantasia.Filtered) or
    (cxGrid1DBTableView1Status.Filtered) or
    (cxGrid1DBTableView1TipoVenda.Filtered) or (cxGrid1DBTableView1COO.Filtered)
  then
    BtnConfirmar.Enabled := true
  else
    BtnConfirmar.Enabled := false;

end;

procedure TFrmNFE.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  TLog.Info('--- DEU DUPLO CLIQUE NA GRID DE GERAR NOTA ---');
  try
    if (EdtCodigo_CFOP.Text = '') then
    begin
      Application.MessageBox
        (PWideChar('Deve-se escolher o CFOP, antes de informar o pedido.'),
        'Erro', MB_OK + MB_ICONHAND);
      EdtCodigo_CFOP.SetFocus;
      exit;
    end;

    FPedidosWhere := '';
    FCOO := '';

    FPedidosWhere := 'P.Codigo = ' +
      QuotedStr(qrypedido_pendenteCodigo.AsString);

    if (qrypedido_pendenteCOO.AsString <> '') then
      FCOO := qrypedido_pendenteCOO.AsString;

    MMOPedido.Text := qrypedido_pendenteN_Pedido.AsString;
    MMOCOO.Text := qrypedido_pendenteCOO.AsString;
    TLog.Debug('VALOR VARIÁVEL FPedidosWhere: ' + FPedidosWhere);
    TLog.Debug('VALOR VARIÁVEL FCOO: ' + FCOO);
    // MEdtData_Primeiro_Vencimento.Text:= qrypedido_pendenteData_Venda.AsString;
    EdtEmail.Text := qrypedido_pendenteEmail.AsString;
    FNFEDominio.carregarReferenciaDevolucaoPorPedido
      (qrypedido_pendenteCodigo.AsInteger, FReferenciaDevolucaoQuery);
    habilitarReferenciaDevolucao(FReferenciaDevolucaoQuery.RecordCount > 0);
    BBtnGerarNFe.Enabled := true;
    Atualiza_Produto;
    PageControl3.TabIndex := 1;
  except
    on E: Exception do
      TLog.Error(Self.ClassName + ' DBGrid3DblClick ' + E.Message);
  end;
  TLog.Info('--- FIM DA GRID DE GERAR NOTA ---');
end;

procedure TFrmNFE.cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  qAux: TADOQuery;
begin
  try
    if (Key = vk_delete) then
    begin
    end;
  except
    on E: Exception do
      TLog.Error(Self.ClassName + ' - DBGrid3KeyDown - ' + E.Message);
  end;

  if (Key = VK_SPACE) then
  begin
    { qrypedido_pendente.Edit;
      if qrypedido_pendenteEmitido.AsString = 'X' then
      qrypedido_pendenteEmitido.AsString := ''
      else
      qrypedido_pendenteEmitido.AsString := 'X';
      qrypedido_pendente.Post }
  end;
end;

procedure TFrmNFE.DBCheckBox1Click(Sender: TObject);
begin
  { if DBCheckBox1.Checked then
    DBCheckBox1.Caption := DBCheckBox1.ValueChecked
    else
    DBCheckBox1.Caption := DBCheckBox1.ValueUnChecked; }
end;

procedure TFrmNFE.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

  { TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui é definida a cor da fonte
    if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
    end;

    TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State); }

  { if (gdFocused in State) then
    begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
    DBCheckBox1.Left := Rect.Left + DBGrid1.Left + 2;
    DBCheckBox1.Top := Rect.Top + DBGrid1.top + 2;
    DBCheckBox1.Width := Rect.Right - Rect.Left;
    DBCheckBox1.Height := Rect.Bottom - Rect.Top;
    DBCheckBox1.Visible := True;
    end
    end
    else
    begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
    DrawRect:=Rect;
    InflateRect(DrawRect,-1,-1);
    DrawState := ISChecked[Column.Field.AsBoolean];
    DBGrid1.Canvas.FillRect(Rect);
    DrawFrameControl(DBGrid1.Canvas.Handle, DrawRect,
    DFC_BUTTON, DrawState);
    end;
    end; }

  { if (Column.Field = qrypedido_pendenteStatus) then
    begin
    DBGrid3.Canvas.FillRect(Rect);
    ImageList1.Draw(DBGrid3.Canvas,Rect.Left+10,Rect.Top+10,0);
    if (qrypedido_pendenteStatus.AsString = 'PAGO') then
    ImageList1.Draw(DBGrid3.Canvas,Rect.Left+10,Rect.Top+10,1)
    else
    ImageList1.Draw(DBGrid3.Canvas,Rect.Left+10,Rect.Top+10,0);
    end; }

  { if Column.FieldName = 'Emitido' then
    begin
    DBGrid3.Canvas.FillRect(Rect);
    Check := 0;

    if qrypedido_pendenteEmitido.AsString = 'X' then
    Check := DFCS_CHECKED
    else
    Check := 0;

    R:=Rect;

    InflateRect(R,-2,-2); //Diminue o tamanho do CheckBox
    DrawFrameControl(DBGrid3.Canvas.Handle,R,DFC_BUTTON, DFCS_BUTTONCHECK or Check);
    end; }

  { If qrypedido_pendenteEmitido.AsString = 'X' then
    Dbgrid3.Canvas.Font.Color:= clMenu
    else
    Dbgrid3.Canvas.Font.Color:= clWindow;

    Dbgrid3.DefaultDrawDataCell(Rect, dbgrid3.columns[datacol].field, State); }

end;

procedure TFrmNFE.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_delete) then
  begin
    if (Confirma_Exclusao) then
    begin
      // Itens_NF.Excluir_Selecionado;
      Atualiza_Produto;
      Escreve_Produto;
      // EdtCodigo_Produto.SetFocus;
    end;
  end;
end;

procedure TFrmNFE.DBGrid2CellClick(Column: TColumn);
begin
  endereco_destinatario := ADOQuery1Descricao.AsString;
  numero_destinatario := ADOQuery1Numero.AsString;
  cep_destinatario := ADOQuery1CEP.AsString;
  complemento_destinatario := ADOQuery1Complemento.AsString;
end;

procedure TFrmNFE.DBGrid3CellClick(Column: TColumn);
begin
  { if Column.FieldName = 'STATUS' then
    begin
    if not ( Column.Field.DataSet.State in [dsInsert, dsEdit] ) then
    Column.Field.DataSet.Edit;

    if Column.Field.Value = True then
    Column.Field.Value := False
    else
    Column.Field.Value := True;
    end; }

  { if (Column.FieldName = qrypedido_pendenteStatus) then
    begin

    end; }

  { if (Column.Field = qrypedido_pendenteEmitido) then
    begin
    qrypedido_pendente.Edit;
    if qrypedido_pendenteEmitido.AsString = 'X' then
    qrypedido_pendenteEmitido.AsString := ''
    else
    qrypedido_pendenteEmitido.AsString := 'X';
    qrypedido_pendente.Post
    end; }
end;

procedure TFrmNFE.DBGrid3ColExit(Sender: TObject);
begin
  // if DBGrid1.SelectedField.FieldName = DBCheckBox1.DataField then
  // DBCheckBox1.Visible := False
end;

procedure TFrmNFE.DBGrid3DblClick(Sender: TObject);
begin
  try
    if (EdtCodigo_CFOP.Text = '') then
    begin
      Application.MessageBox
        (PWideChar('Deve-se escolher o CFOP, antes de informar o pedido.'),
        'Erro', MB_OK + MB_ICONHAND);
      EdtCodigo_CFOP.SetFocus;
      exit;
    end;

    // EdtPedido.Text := qrypedido_pendenteN_Pedido.AsString;
    // MEdtData_Primeiro_Vencimento.Text:= qrypedido_pendenteData_Venda.AsString;
    EdtEmail.Text := qrypedido_pendenteEmail.AsString;
    FNFEDominio.carregarReferenciaDevolucaoPorPedido
      (qrypedido_pendenteCodigo.AsInteger, FReferenciaDevolucaoQuery);
    habilitarReferenciaDevolucao(FReferenciaDevolucaoQuery.RecordCount > 0);
    BBtnGerarNFe.Enabled := true;
    Atualiza_Produto;
  except
    on E: Exception do
      TLog.Error(Self.ClassName + ' DBGrid3DblClick ' + E.Message);
  end;
end;

procedure TFrmNFE.DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  { with DBGrid3 do
    begin
    if Odd( DataSource.DataSet.RecNo) then
    Canvas.Brush.Color := clMenu
    else
    Canvas.Brush.Color := clWindow;

    Canvas.FillRect(Rect);
    TDbGrid(Sender).Canvas.font.Color:= clBlack;

    if gdSelected in State then
    begin
    with (Sender as TDBGrid).Canvas do
    begin
    Brush.Color:= clAqua;
    FillRect(Rect);
    end;
    end
    else if (gdFocused in State) then
    begin
    with (Sender as TDBGrid).Canvas do
    begin
    Brush.Color:= clMenu;
    FillRect(Rect);
    end;
    end;

    DefaultDrawColumnCell(Rect,DataCol,Column,State);
    end; }
end;

procedure TFrmNFE.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  qAux: TADOQuery;
begin
  try
    if (Key = vk_delete) then
    begin
      if (Application.MessageBox(PChar('Confirma a anulação do pedido?' + #10 +
        #13 + 'O pedido ' + qrypedido_pendenteN_Pedido.AsString +
        ' só deixará de ser visível nessa tela de NFe, ' +
        'mas NÃO será excluído ou cancelado do sistema.'), 'Aviso',
        MB_YESNO + MB_ICONEXCLAMATION)) = idyes then
      begin
        try
          qAux := TADOQuery.create(nil);
          with qAux, sql do
          begin
            Close;
            Connection := dm.ADOConnection1;
            Clear;
            Add('update Pedido set Status = :Status');
            Add('where Codigo = :Codigo');
            Parameters.ParamByName('Status').Value := 'ANULADO';
            Parameters.ParamByName('Codigo').Value :=
              qrypedido_pendenteCodigo.AsInteger;
            ExecSQL;
          end;
          Atualiza_Pedido_Pendente;
        finally
          FreeAndNil(qAux);
        end;
      end;
    end;
  except
    on E: Exception do
      TLog.Error(Self.ClassName + ' - DBGrid3KeyDown - ' + E.Message);
  end;

  if (Key = VK_SPACE) then
  begin
    { qrypedido_pendente.Edit;
      if qrypedido_pendenteEmitido.AsString = 'X' then
      qrypedido_pendenteEmitido.AsString := ''
      else
      qrypedido_pendenteEmitido.AsString := 'X';
      qrypedido_pendente.Post }
  end;
end;

procedure TFrmNFE.DBGrid3TitleClick(Column: TColumn);
begin
  Util.Ordena_Grid(qrypedido_pendente, Column);
end;

procedure TFrmNFE.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_delete) then
  begin
    { if (Confirma_Exclusao) then
      begin
      ClientDataSet1.Delete;
      end; }
  end;
end;

procedure TFrmNFE.DBGridReferenciaDevolucaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  try
    if (Key = vk_delete) and (FReferenciaDevolucaoQuery.RecordCount <> 0) then
    begin
      if Confirma_Delete = true then
      begin
        FNFEDominio.removerReferenciaDevolucao
          (FReferenciaDevolucaoQuery.FieldByName('Codigo').AsInteger,
          qrypedido_pendenteCodigo.AsInteger, FReferenciaDevolucaoQuery);
      end;
    end;
  except
    on E: Exception do
      TLog.Error(Self.ClassName + ' - DBGridReferenciaDevolucaoKeyDown - ' +
        E.Message);
  end;
end;

procedure TFrmNFE.EdtAliquota_ICMSKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtAliquota_IPIKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtBase_Calculo_ICMSKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtBase_Calculo_ICMS_SubstituicaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtBase_Calculo_ISSQNKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtBC_COFINSKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtBC_ICMSKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtBC_IPIKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtBC_PISKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtCFOPKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmNFE.EdtCFOP_ProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_CFOP, FrmChama_CFOP);
    FrmChama_CFOP.ShowModal;
    FrmChama_CFOP.Free;
  end;
end;

procedure TFrmNFE.EdtCodigo_CFOPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin

    { if (EdtPedido.Text = '') then
      begin
      Application.MessageBox(PWideChar('Deve-se selecionar um pedido, antes de informar o CFOP.'), 'Erro', MB_OK+MB_ICONHAND);
      abort;
      end; }

    Application.CreateForm(TFrmChama_CFOP, FrmChama_CFOP);
    FrmChama_CFOP.ShowModal;
    FrmChama_CFOP.Free;

    // Atualiza_CFOP;
  end;
end;

procedure TFrmNFE.EdtCodigo_CFOPKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero(Key);
end;

procedure TFrmNFE.EdtCodigo_CFOP_ProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_CFOP, FrmChama_CFOP);
    FrmChama_CFOP.ShowModal;
    FrmChama_CFOP.Free;
  end;
end;

procedure TFrmNFE.EdtCodigo_Condicao_PagamentoDblClick(Sender: TObject);
begin
  { Application.CreateForm(TFrmChama_Condicao_Pagamento,
    FrmChama_Condicao_Pagamento);
    FrmChama_Condicao_Pagamento.ShowModal;
    FrmChama_Condicao_Pagamento.Free; }
end;

procedure TFrmNFE.EdtCodigo_Condicao_PagamentoExit(Sender: TObject);
begin
  // Pega_Condicao_Codigo;
end;

procedure TFrmNFE.EdtCodigo_Condicao_PagamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // if (Key = vk_f3) then
  // begin
  // Application.CreateForm(TFrmChama_Condicao_Pagamento,
  // FrmChama_Condicao_Pagamento);
  // FrmChama_Condicao_Pagamento.ShowModal;
  // FrmChama_Condicao_Pagamento.Free;
  // end;
end;

procedure TFrmNFE.Pega_Condicao_Codigo;
begin
  if (EdtCodigo_Condicao_Pagamento.Text <> '') then
  begin
    if (dm.qrychama_condicao.Locate('Codigo',
      StrToInt(EdtCodigo_Condicao_Pagamento.Text), [])) then
    begin
      EdtCodigo_Condicao_Pagamento.Text := dm.qrychama_condicaoCodigo.AsString;
      EdtCondicao_Pagamento.Text := dm.qrychama_condicaoDescricao.AsString;
    end
    else
    begin
      Mensagem_Fim_Pesquisa;
      abort;
    end;
  end;
end;

procedure TFrmNFE.EdtCodigo_CSOSNKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Situacao_Tributaria,
      FrmChama_Situacao_Tributaria);
    FrmChama_Situacao_Tributaria.ShowModal;
    FrmChama_Situacao_Tributaria.Free;
  end;
end;

procedure TFrmNFE.EdtCodigo_CSOSNKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmNFE.EdtCodigo_DestinatarioDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
  FrmChama_Cliente.ShowModal;
  FrmChama_Cliente.Free;
end;

procedure TFrmNFE.EdtCodigo_DestinatarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;
end;

procedure TFrmNFE.EdtCodigo_DestinatarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmNFE.EdtCodigo_EmitenteDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Empresa, FrmChama_Empresa);
  FrmChama_Empresa.ShowModal;
  FrmChama_Empresa.Free;
end;

procedure TFrmNFE.EdtCodigo_EmitenteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Empresa, FrmChama_Empresa);
    FrmChama_Empresa.ShowModal;
    FrmChama_Empresa.Free;
  end;
end;

procedure TFrmNFE.EdtCodigo_EmitenteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmNFE.EdtCodigo_Logradouro_RetiradaDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Logradouro, FrmChama_Logradouro);
  FrmChama_Logradouro.ShowModal;
  FrmChama_Logradouro.Free;
end;

procedure TFrmNFE.EdtCodigo_Logradouro_RetiradaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Logradouro, FrmChama_Logradouro);
    FrmChama_Logradouro.ShowModal;
    FrmChama_Logradouro.Free;
  end;
end;

procedure TFrmNFE.EdtCodigo_Municipio_RetiradaDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Cidade, FrmChama_Cidade);
  FrmChama_Cidade.ShowModal;
  FrmChama_Cidade.Free;
end;

procedure TFrmNFE.EdtCodigo_Municipio_RetiradaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Cidade, FrmChama_Cidade);
    FrmChama_Cidade.ShowModal;
    FrmChama_Cidade.Free;
  end;
end;

procedure TFrmNFE.EdtCodigo_NCMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_NCM, FrmChama_NCM);
    FrmChama_NCM.ShowModal;
    FrmChama_NCM.Free;
  end;
end;

procedure TFrmNFE.EdtCodigo_Obs_FiscalDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Observacao_Fiscal,
    FrmChama_Observacao_Fiscal);
  FrmChama_Observacao_Fiscal.ShowModal;
  FrmChama_Observacao_Fiscal.Free;
end;

procedure TFrmNFE.EdtCodigo_Obs_FiscalExit(Sender: TObject);
begin
  Pega_Obs_Codigo;
end;

procedure TFrmNFE.EdtCodigo_Obs_FiscalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Observacao_Fiscal,
      FrmChama_Observacao_Fiscal);
    FrmChama_Observacao_Fiscal.ShowModal;
    FrmChama_Observacao_Fiscal.Free;
  end;
end;

procedure TFrmNFE.EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free;
  end;
end;

procedure TFrmNFE.EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmNFE.EdtCodigo_ReboqueDblClick(Sender: TObject);
begin
  veiculo := 2;
  Application.CreateForm(TFrmChama_Veiculo, FrmChama_Veiculo);
  FrmChama_Veiculo.ShowModal;
  FrmChama_Veiculo.Free;
end;

procedure TFrmNFE.EdtCodigo_ReboqueKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    veiculo := 2;
    Application.CreateForm(TFrmChama_Veiculo, FrmChama_Veiculo);
    FrmChama_Veiculo.ShowModal;
    FrmChama_Veiculo.Free;
  end;
end;

procedure TFrmNFE.EdtCodigo_Setor_RetiradaDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Setor, FrmChama_Setor);
  FrmChama_Setor.ShowModal;
  FrmChama_Setor.Free;
end;

procedure TFrmNFE.EdtCodigo_Setor_RetiradaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Setor, FrmChama_Setor);
    FrmChama_Setor.ShowModal;
    FrmChama_Setor.Free;
  end;
end;

procedure TFrmNFE.EdtCodigo_TransportadoraDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Transportadora, FrmChama_Transportadora);
  FrmChama_Transportadora.ShowModal;
  FrmChama_Transportadora.Free;
end;

procedure TFrmNFE.EdtCodigo_TransportadoraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Transportadora, FrmChama_Transportadora);
    FrmChama_Transportadora.ShowModal;
    FrmChama_Transportadora.Free;
  end;
end;

procedure TFrmNFE.EdtCodigo_VeiculoDblClick(Sender: TObject);
begin
  veiculo := 1;
  Application.CreateForm(TFrmChama_Veiculo, FrmChama_Veiculo);
  FrmChama_Veiculo.ShowModal;
  FrmChama_Veiculo.Free;
end;

procedure TFrmNFE.EdtCodigo_VeiculoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    veiculo := 1;
    Application.CreateForm(TFrmChama_Veiculo, FrmChama_Veiculo);
    FrmChama_Veiculo.ShowModal;
    FrmChama_Veiculo.Free;
  end;
end;

procedure TFrmNFE.EdtComplemento_RetiradaExit(Sender: TObject);
begin
  // complemento_emitente := EdtComplemento_Retirada.Text;
end;

procedure TFrmNFE.EdtCOOExit(Sender: TObject);
begin
  { if (EdtCOO.Text <> '') then
    begin
    EdtNECF.Text:= n_usuario;
    end; }
end;

procedure TFrmNFE.EdtCSOSNKeyPress(Sender: TObject; var Key: Char);
begin
  // Util.Somente_Apaga(key);
end;

procedure TFrmNFE.EdtCSTExit(Sender: TObject);
begin
  Verifica_CST;
end;

procedure TFrmNFE.EdtDesconto_NotaKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtDesconto_ProdutoExit(Sender: TObject);
begin
  // Util.FormataFloat(2, EdtDesconto_Produto, StrToFloat(EdtDesconto_Produto.Text));
end;

procedure TFrmNFE.EdtDesconto_ProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtDestinatarioKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmNFE.EdtEmitenteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmNFE.EdtNumero_RetiradaExit(Sender: TObject);
begin
  // numero_emitente := EdtNumero_Retirada.Text;
end;

procedure TFrmNFE.EdtN_Nota_FiscalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_return) then
  begin
    //
  end;
end;

procedure TFrmNFE.EdtN_Nota_FiscalKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero(Key);
end;

procedure TFrmNFE.EdtOutras_DespesasKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtOutras_Despesas_ProdutoExit(Sender: TObject);
begin
  // Util.FormataFloat(2, EdtOutras_Despesas_Produto, StrToFloat(EdtOutras_Despesas_Produto.Text));
end;

procedure TFrmNFE.EdtOutras_Despesas_ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  { if (key = vk_return) then
    begin
    if (Confira_Itens) then
    begin
    Calcula_Imposto;
    Itens_NF.Inserir;
    Atualiza_Produto;
    Escreve_Produto;
    EdtCodigo_Produto.SetFocus;
    valor_tributavel:= 0;
    BBtnCancelar.Enabled:= true;
    end;
    end; }
end;

procedure TFrmNFE.EdtOutras_Despesas_ProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtPedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  { if (key = vk_return) then
    begin
    Atualiza_Produto;
    end;

    if (key = vk_f3) then
    begin
    Application.CreateForm(TFrmChama_DAV_Converter, FrmChama_DAV_Converter);
    FrmChama_DAV_Converter.ShowModal;
    FrmChama_DAV_Converter.Free;
    end; }

end;

procedure TFrmNFE.EdtPeso_BrutoExit(Sender: TObject);
begin
  Util.FormataFloat(3, EdtPeso_Bruto, StrToFloat(EdtPeso_Bruto.Text));
end;

procedure TFrmNFE.EdtPeso_BrutoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtPeso_LiquidoExit(Sender: TObject);
begin
  Util.FormataFloat(3, EdtPeso_Liquido, StrToFloat(EdtPeso_Liquido.Text));
end;

procedure TFrmNFE.EdtPeso_LiquidoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmNFE.EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtQuantidade_TransportadaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtReboqueKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmNFE.EdtTransportadoraKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmNFE.EdtUF_ReboqueKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmNFE.EdtUF_VeiculoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmNFE.EdtValor_COFINS_ProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtValor_FreteKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtValor_Frete_ProdutoExit(Sender: TObject);
begin
  // Util.FormataFloat(2, EdtValor_Frete_Produto, StrToFloat(EdtValor_Frete_Produto.Text));
end;

procedure TFrmNFE.EdtValor_Frete_ProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtValor_ICMSKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtValor_ICMS_ProdutoExit(Sender: TObject);
begin
  // Util.FormataFloat(2, EdtValor_ICMS_Produto, StrToFloat(EdtValor_ICMS_Produto.Text));
end;

procedure TFrmNFE.EdtValor_ICMS_ProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtValor_ICMS_SubstituicaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtValor_IPI_ProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtValor_ISSQNKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtValor_PIS_ProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtValor_SeguroKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtValor_Seguro_ProdutoExit(Sender: TObject);
begin
  // Util.FormataFloat(2, EdtValor_Seguro_Produto, StrToFloat(EdtValor_Seguro_Produto.Text));
end;

procedure TFrmNFE.EdtValor_Seguro_ProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtValor_TotalEnter(Sender: TObject);
var
  qtde, total: double;
begin
  { qtde:= StrToFloat(EdtQuantidade.Text);
    total:= qtde * StrToFloat(EdtValor_Unitario.Text);
    Util.FormataFloat(2, EdtValor_Total, total); }
end;

procedure TFrmNFE.EdtValor_TotalKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtValor_Total_BrutoExit(Sender: TObject);
begin
  // Util.FormataFloat(2, EdtValor_Total_Bruto, StrToFloat(EdtValor_Total_Bruto.Text));
end;

procedure TFrmNFE.EdtValor_Total_BrutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  { if (key = vk_return) then
    begin
    if (Confira_Itens) then
    begin
    Calcula_Imposto;
    Itens_NF.Inserir;
    Atualiza_Produto;
    Escreve_Produto;
    EdtCodigo_Produto.SetFocus;
    valor_tributavel:= 0;
    BBtnCancelar.Enabled:= true;
    end;
    end; }
end;

procedure TFrmNFE.EdtValor_Total_BrutoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(Key);
end;

procedure TFrmNFE.EdtValor_Total_COFINSKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtValor_Total_IPIKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtValor_Total_NotaKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtValor_Total_PISKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtValor_Total_ProdutosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtValor_Total_ServicosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtValor_UnitarioExit(Sender: TObject);
begin
  // Util.FormataFloat(2, EdtValor_Unitario, StrToFloat(EdtValor_Unitario.Text));
end;

procedure TFrmNFE.EdtValor_UnitarioKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmNFE.EdtVeiculoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmNFE.Escreve_Imposto;
begin
  EdtBase_Calculo_ICMS.Text := '0,00';
  EdtValor_ICMS.Text := '0,00';
  EdtBase_Calculo_ICMS_Substituicao.Text := '0,00';
  EdtValor_ICMS_Substituicao.Text := '0,00';
  EdtValor_Total_Produtos.Text := '0,00';
  EdtValor_Frete.Text := '0,00';
  EdtValor_Seguro.Text := '0,00';
  EdtDesconto_Nota.Text := '0,00';
  EdtValor_Total_IPI.Text := '0,00';
  EdtValor_Total_PIS.Text := '0,00';
  EdtValor_Total_COFINS.Text := '0,00';
  EdtOutras_Despesas.Text := '0,00';
  EdtValor_Total_Nota.Text := '0,00';
  EdtValor_Total_Servicos.Text := '0,00';
  EdtBase_Calculo_ISSQN.Text := '0,00';
  EdtValor_ISSQN.Text := '0,00';
  EdtPeso_Bruto.Text := '0,00';
  EdtPeso_Liquido.Text := '0,00';
  EdtQuantidade_Transportada.Text := '0';
end;

procedure TFrmNFE.Escreve_Produto;
begin
  { EdtCodigo_Produto.Clear;
    EdtProduto.Clear;
    EdtNCM.Clear;
    EdtCST.Clear;
    EdtCST_IPI.Clear;
    EdtCST_PIS.Clear;
    EdtCST_COFINS.Clear;
    EdtUnidade.Clear;
    EdtQuantidade.Text:= '0';
    EdtValor_Unitario.Text:= '0,00';
    EdtValor_Total.Text:= '0,00';
    EdtValor_Frete_Produto.Text:= '0,00';
    EdtValor_Seguro_Produto.Text:= '0,00';
    EdtDesconto_Produto.Text:= '0,00';
    EdtOutras_Despesas_Produto.Text:= '0,00';
    EdtAliquota_ICMS.Text:= '0';
    EdtAliquota_IPI.Text:= '0';
    EdtAliquota_PIS.Text:= '0';
    EdtAliquota_COFINS.Text:= '0';
    EdtBC_ICMS.Text:= '0,00';
    EdtBC_IPI.Text:= '0,00';
    EdtBC_PIS.Text:= '0,00';
    EdtBC_COFINS.Text:= '0,00';
    EdtValor_ICMS_Produto.Text:= '0,00';
    EdtValor_IPI_Produto.Text:= '0,00';
    EdtValor_PIS_Produto.Text:= '0,00';
    EdtValor_COFINS_Produto.Text:= '0,00';
    EdtValor_Total_Bruto.Text:= '0,00'; }
end;

{ procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
  begin
  case llEstado of
  Inserir: Habilita_Botao([false, true, false, true]);
  //Alterar: Habilita_Botao([false, true, false, true]);
  Consultar: Habilita_Botao([false, true, true, true]);
  end;
  end; }

procedure TFrmNFE.FormActivate(Sender: TObject);
begin
  ativo := true;
end;

procedure TFrmNFE.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FrmNFE.Release;
  FrmNFE := Nil;
end;

procedure TFrmNFE.Atualiza_Status_OS;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.create(nil);
  try
    with qAux, sql do
    begin
      Close;
      Connection := dm.ADOConnection1;
      Clear;
      Add('update Pedido set Status_OS = :Status_OS where N_Pedido = :N_Pedido');

      Parameters.ParamByName('N_Pedido').Value := MMOPedido.Text;
      Parameters.ParamByName('Status_OS').Value := CmbStatus.KeyValue;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmNFE.ACBrNFe1StatusChange(Sender: TObject);
begin
  case dm.ACBrNFe1.Status of
    stIdle :
    begin
      if ( frmStatus <> nil ) then
        frmStatus.Hide;
    end;
    stNFeStatusServico :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Verificando Status do servico...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeRecepcao :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando dados da NFe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeRetRecepcao :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Recebendo dados da NFe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeConsulta :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Consultando NFe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeCancelamento :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando cancelamento de NFe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeInutilizacao :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando pedido de Inutilização...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeRecibo :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Consultando Recibo de Lote...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeCadastro :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Consultando Cadastro...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeEmail :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando Email...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeCCe :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando Carta de Correção...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeEvento :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando Evento...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
  end;
  Application.ProcessMessages;
end;

procedure TFrmNFE.adicionarFinalidade;
begin
  if (RGFinalidade.ItemIndex = 0) then
    finalidade := 'NORMAL'
  else if (RGFinalidade.ItemIndex = 1) then
    finalidade := 'COMPLEMENTAR'
  else if (RGFinalidade.ItemIndex = 2) then
    finalidade := 'AJUSTE'
  else if (RGFinalidade.ItemIndex = 3) then
    finalidade := 'DEVOLUÇÃO';

end;

procedure TFrmNFE.adicionarReferenciaDevolucaoACBR(NFref: TNFrefCollection);
begin
  try
    with NFref.Add do
    begin
      FReferenciaDevolucaoQuery.First;
      While not FReferenciaDevolucaoQuery.Eof do
      begin
        if (FReferenciaDevolucaoQuery.FieldByName('Modelo').AsInteger) = 55 then
        begin
          refNFe := FReferenciaDevolucaoQuery.FieldByName('Chave').AsString;
        end
        else if FReferenciaDevolucaoQuery.FieldByName('Modelo').AsInteger = 1
        then
        begin
          refNFe := 'asdasd';
          RefNF.CNPJ := qrypedido_pendenteCNPJ.AsString;
          RefNF.cUF :=
            StrToInt(LeftStr(qrypedido_pendenteCodigo_Municipio.AsString, 2));
          RefNF.Modelo := FReferenciaDevolucaoQuery.FieldByName('Modelo')
            .AsInteger;
          RefNF.serie := FReferenciaDevolucaoQuery.FieldByName('Serie')
            .AsInteger;
          RefNF.nNF := FReferenciaDevolucaoQuery.FieldByName('Numero')
            .AsInteger;
          RefNF.AAMM := ReplaceStr(FormatDateTime('YY/MM',
            FReferenciaDevolucaoQuery.FieldByName('Data_Emissao')
            .AsDateTime), '/', '');

        end
        else if (FReferenciaDevolucaoQuery.FieldByName('Modelo').AsInteger) = 2
        then
        begin

          if UpperCase(FReferenciaDevolucaoQuery.FieldByName('Serie').AsString)
            = 'D' then
            RefECF.Modelo := ECFModRef2D
          else if UpperCase(FReferenciaDevolucaoQuery.FieldByName('Serie')
            .AsString) = 'B' then
            RefECF.Modelo := ECFModRef2B
          else if UpperCase(FReferenciaDevolucaoQuery.FieldByName('Serie')
            .AsString) = 'C' then
            RefECF.Modelo := ECFModRef2C
          else
            RefECF.Modelo := ECFModRefVazio;

          RefECF.nECF := FReferenciaDevolucaoQuery.FieldByName
            ('Caixa_ECF').AsString;
          RefECF.nCOO := FReferenciaDevolucaoQuery.FieldByName
            ('Numero').AsString;
        end;
        FReferenciaDevolucaoQuery.next;
      end;
    end;
  except
    on E: Exception do
      TLog.Error(Self.ClassName + ' - adicionarReferenciaDevolucaoACBR - ' +
        E.Message);
  end;
end;

procedure TFrmNFE.Atualiza_CFOP;
var
  qAux: TADOQuery;
begin
  TLog.Info('--- ENTROU NO MÉTODO Atualiza_CFOP ---');
  if (qrypedido_pendenteStatus.AsString = 'PAGO') then
  begin
    if (Application.MessageBox
      (PWideChar
      ('Foi detectado que já foi emitido cupom fiscal para essa venda. Para não gerar novamente o imposto, o sistema irá automaticamente atualizar o CFOP dos itens da NFe para '
      + QuotedStr(CFOP) + '. Deseja realizar a alteração?'), 'Atenção',
      MB_YESNO + MB_ICONQUESTION)) = idyes then
    begin
      qAux := TADOQuery.create(nil);
      try
        with qAux, sql do
        begin
          Close;
          Connection := dm.ADOConnection1;
          Clear;
          Add('update Itens_Pedido set CFOP = :CFOP where Codigo = :Codigo');

          Parameters.ParamByName('CFOP').Value := CFOP;
          Parameters.ParamByName('Codigo').Value :=
            qrypedido_pendenteCodigo.AsInteger;
          ExecSQL;
        end;
        Atualiza_Itens_NFe;
      finally
        FreeAndNil(qAux);
      end;
    end;
  end;
  TLog.Info('--- SAIU DO MÉTODO Atualiza_CFOP ---');
end;

procedure TFrmNFE.Atualiza_Dados_OS;
begin
  if (gera_os = '0101') then
  begin
    LblStatus.Visible := true;
    CmbStatus.Visible := true;
    Consulta.Chama_Status_OS(dm.ADOConnection1);
    CmbStatus.KeyValue := null;
  end
  else
  begin
    LblStatus.Visible := false;
    CmbStatus.Visible := false;
    CmbStatus.KeyValue := null;
  end;
end;

procedure TFrmNFE.Atualiza_Itens_NFe;
var
  chis: string;
begin
  try
    TLog.Info('--- ENTROU DO MÉTODO Atualiza_Itens_NFe ---');
    with qryitens_nf, sql do
    begin
      Close;
      Clear;
      Add('select IP.*, ');
      Add('Cli.Codigo as Cod_Cli, PEC.Inscricao_Estadual, Cli.Insc_Municipal, Cli.Email, Cli.Suframa, Cli.Enquadramento, ');
      Add('PEC.Cidade, PEC.Nome, PEC.CPF_CNPJ, ');
      Add('PEC.UF, PEC.Codigo_Municipio, PEC.Setor, PEC.Endereco as Log, PEC.CEP, PEC.Numero, PEC.Complemento, PEC.Telefone,');
      Add('PPD.Forma_Pagamento, PPD.Qtde_Parcela, PPD.Prazo, PPD.Taxa, PPD.Codigo_Forma_Pagamento, PPD.Forma_Pagamento, PPD.Tipo_Pagamento, ');
      Add('Pro.Estoque, Pro.Volume, Pro.Valor_Compra as Valor_Compra_Atual from Itens_Pedido IP');
      Add('left join Pedido P on (IP.Codigo = P.Codigo)');
      Add('left join Cliente Cli on (P.Codigo_Cliente = Cli.Codigo)');
      Add('left join Pedido_Endereco_Cliente PEC on (P.Codigo = PEC.Codigo)');
      Add('left join Pedido_Pagamento_DAV PPD on (P.Codigo = PPD.Codigo)');
      Add('left join Produto Pro on (IP.Codigo_Produto = Pro.Codigo)');

      // chis := 'where IP.Cancelado = :N AND '+QuotedStr( FPedidos);
      Add('where IP.Cancelado = '+QuotedStr('N') + ' AND (' + FPedidosWhere + ')');
      TLog.Debug('Valor da variável FPedidosWhere' + FPedidosWhere);
      // add('where IP.Cancelado = :N and P.N_Pedido = :N_Pedido');

      // Parameters.ParamByName('N_Pedido').Value:= FPedidos;
//      Parameters.ParamByName('N').Value := 'N';
      open;
    end;
    EdtCodigo_Condicao_Pagamento.Text :=
      qryitens_nfCodigo_Forma_Pagamento.AsString;
    EdtCondicao_Pagamento.Text := qryitens_nfForma_Pagamento.AsString;
    codigoCondicaoPagamento := qryitens_nfCodigo.AsString;
    descricaoCondicaoPagamento := qryitens_nfForma_Pagamento.AsString;
    taxaCondicaoPagamento := qryitens_nfTaxa.AsFloat;
    qtdeParcela := qryitens_nfQtde_Parcela.AsInteger;
    prazoPagamento := qryitens_nfPrazo.AsInteger;
    tipoPagamento := qryitens_nfTipo_Pagamento.AsString;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
  TLog.Info('--- SAIU DO MÉTODO Atualiza_Itens_NFe ---');
end;

procedure TFrmNFE.FormCreate(Sender: TObject);
begin
  try
    Util.Habilita_Campos(FrmNFE);
    Util.Limpa_Campos(FrmNFE);
    Util.Desabilita_Campos(FrmNFE);
    Escreve_Produto;
    Escreve_Imposto;
    PageControl1.TabIndex := 0;
    PageControl3.TabIndex := 0;
    exclui := false;
    iniciado := false;
    encontrou_alertas := false;
    ADOQuery1.Close;
    qryitens_nf.Close;
    qrypedido_pendente.Close;
    CMBTipo_Nota.ItemIndex := -1;
    BtnInformar_Pagamento.Visible:= false;

    Pega_Certificado_Digital(dm.ACBrNFe1);
    if (impressao_danfe = 'RETRATO') then
      dm.ACBrNFeDANFeRL1.TipoDANFE := tiRetrato
    else
      dm.ACBrNFeDANFeRL1.TipoDANFE := tiPaisagem;

    dm.ACBrNFeDANFCeFortes1.TipoDANFE := tiNFCe;
    dm.ACBrNFe1.DANFE:= dm.ACBrNFeDANFeRL1;

    if (logomarca <> '') then
    begin
      dm.ACBrNFeDANFeRL1.Logo := logomarca;
      dm.ACBrNFeDANFCeFortes1.Logo:= logomarca;
    end;

    // if (email <> '') then
    dm.ACBrNFeDANFeRL1.email := email;
    dm.ACBrNFe1.Configuracoes.Geral.VersaoDF := ve310;
    dm.ACBrNFe1.Configuracoes.Geral.ModeloDF:= moNFe;
    dm.ACBrNFe1.Configuracoes.WebServices.uf := uf;
    dm.ACBrNFe1.Configuracoes.Arquivos.PathSalvar := salva_xml;
    dm.ACBrNFeDANFeRL1.PathPDF:= salva_xml;
    dm.ACBrNFe1.Configuracoes.Arquivos.PathNFe := salva_xml + 'Transmitidos';
    dm.ACBrNFe1.Configuracoes.Arquivos.PathEvento := salva_xml + 'Cancelados';
    dm.ACBrNFe1.Configuracoes.Arquivos.PathSchemas := caminho_schema;
    RGFrete.ItemIndex:= 0;
    if (ambiente = 'PRODUÇÃO') then
      dm.ACBrNFe1.Configuracoes.WebServices.ambiente := taProducao
    else if (ambiente = 'HOMOLOGAÇÃO') then
      dm.ACBrNFe1.Configuracoes.WebServices.ambiente := taHomologacao;

    dm.ACBrNFeDANFeRL1.PathPDF := salva_xml;
    dm.ACBrNFeDANFeRL1.email := email;
    dm.ACBrNFe1.Configuracoes.Geral.IdCSC:= idcsc;
    dm.ACBrNFe1.Configuracoes.Geral.CSC:= numerocsc;
    Timer1.Interval := tempo_atualizacao;
    Atualiza_Dados_OS;
    FFormConsultaNFParaReferencia := TformConsultaNFParaReferencia.create
      (dm.ADOConnection1);
    FReferenciaDevolucaoQuery := TADOQuery.create(nil);
    FReferenciaDevolucaoQuery.Connection := dm.ADOConnection1;
    dtReferenciaDevolucao.DataSet := FReferenciaDevolucaoQuery;
    FNFEDominio := TNFEDominio.create(dm.ADOConnection1);
  except
    on E: Exception do
      TLog.Error(Self.ClassName + ' - FormCreate - ' + E.Message);
  end;
end;

procedure TFrmNFE.FormDeactivate(Sender: TObject);
begin
  ativo := false;
end;

procedure TFrmNFE.FormDestroy(Sender: TObject);
begin
  try
    FreeAndNil(FFormConsultaNFParaReferencia);
    FReferenciaDevolucaoQuery.Close;
    FreeAndNil(FReferenciaDevolucaoQuery);
    FNFEDominio._Release;
    FNFEDominio := nil;
  except
    on E: Exception do
      TLog.Error(Self.ClassName + ' - FormDestroy - ' + E.Message);
  end;
end;

procedure TFrmNFE.Atualiza_Pedido_Pendente;
begin
  TLog.Info('--- ENTROU NO MÉTODO Atualiza_Pedido_Pendente ---');
  try
    with qrypedido_pendente, sql do
    begin
      TLog.Debug('Entrou no método Atualiza_Pedido_Pendente.');
      Close;
      Clear;
      Add('select P.Codigo, P.N_Pedido, P.Data_Venda, P.Total_Pedido, P.Tipo as TipoVenda, P.COO, Cli.Codigo as CodCli, Cli.Nome_Nome_Fantasia,');
      Add('Cli.Razao_Social, Cli.Email, Cli.Endereco, P.Status,  Cli.Tipo, Cli.CPF, Cli.CNPJ, Ci.Codigo_Municipio,');
      Add('P.Total_Produtos, P.Desc_Acr');
      Add('from Pedido P');
      Add('left join Cliente Cli on (P.Codigo_Cliente = Cli.Codigo)');
      Add('left join Pedido_Endereco_Cliente pec on pec.Codigo = p.Codigo');
      Add('left join Cidade Ci on Ci.Codigo = Cli.Codigo_Cidade');
      Add('where (P.Tipo <> :NFENFCE and P.Tipo <> :NFCENFE) and P.Status <> :Cancelado and P.Status <> :Anulado order by P.Codigo desc');
      // order by P.N_Pedido desc');
      Parameters.ParamByName('NFENFCE').Value := 'NFE/NFCE';
      Parameters.ParamByName('NFCENFE').Value := 'NFCE/NFE';
      Parameters.ParamByName('Cancelado').Value := 'CANCELADO';
      Parameters.ParamByName('Anulado').Value := 'ANULADO';
      TLog.Debug('Vai abrir o médoto Atualiza_Pedido_Pendente.');
      open;
      TLog.Debug('Abriu o método Atualiza_Pedido_Pendente.');
    end;
  except
    on E: Exception do
    begin
      TMensagens.MensagemErro('Método Atualiza_Pedido_Pendente: ' + E.Message);
      TLog.Error('Erro ao executar Atualiza_Pedido_Pendente: ' + E.Message);
    end;

  end;
  TLog.Info('--- FIM DO MÉTODO Atualiza_Pedido_Pendente ---');
end;

procedure TFrmNFE.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_f2) then
  begin
  end;

  if (Key = vk_escape) then
    Close;
end;

procedure TFrmNFE.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0; // anula todas as teclas
    SelectNext(ActiveControl, true, true);
  end;
end;

procedure TFrmNFE.Mensagem_Erro(Mensagem: String);
begin
  Application.MessageBox(PChar('Informe o(a) ' + Mensagem + '.'), 'Erro',
    MB_OK + MB_ICONHAND);
  abort;
end;

procedure TFrmNFE.GeraNFe;
var
  data_emissao, data_saida, valaux2, va: AnsiString;
  data_vencim: TDate;
  valaux, valor_un: double;
  i: Integer;
  TemAlerta: boolean;
begin
  TLog.Info('--- MÉTODO GERAR NFE---');

  // Ide.cNF       := ; //Caso não seja preenchido será gerado um número aleatório pelo componente
  DadosEmissaoNFE.CFOP := EdtCFOP.Text;
  DadosEmissaoNFE.FormaPagamento:= CmbForma_Pagamento.ItemIndex;
  DadosEmissaoNFE.Modelo:= EdtModelo.Text;
  DadosEmissaoNFE.Serie:= EdtSerie.Text;
  DadosEmissaoNFE.NNF:= StrToInt(EdtN_Nota_Fiscal.Text);
  DadosEmissaoNFE.DataSaida:= MEdtData_Entrada_Saida.Text;
  DadosEmissaoNFE.HoraSaida:= MEdtHora_Entrada_Saida.Text;
  DadosEmissaoNFE.DataEmissao:= DateTimeToStr(FDataEmissao);
  DadosEmissaoNFE.TipoOperacao:= RGTipo_Operacao.ItemIndex;
  DadosEmissaoNFE.FormaEmissao:= forma_emissao;
  DadosEmissaoNFE.Ambiente := ambiente;
  DadosEmissaoNFE.VersaoEXE:= VersaoExe;

  if (RGFinalidade.ItemIndex = 0) then
    DadosEmissaoNFE.Finalidade:= 'NORMAL'
  else if (RGFinalidade.ItemIndex = 1) then
    DadosEmissaoNFE.Finalidade:= 'COMPLEMENTAR'
  else if (RGFinalidade.ItemIndex = 2) then
    DadosEmissaoNFE.Finalidade:= 'AJUSTE'
  else if (RGFinalidade.ItemIndex = 3) then
    DadosEmissaoNFE.Finalidade:= 'DEVOLUÇÃO';

  qryitens_nf.First;
  while not qryitens_nf.Eof do
  begin
    Inc(item);
    DadosEmissaoNFEItens:= TDadosEmissaoNFEItens.Create;
    DadosEmissaoNFEItens.ValorUnitario:= qryitens_nfValor_Unitario.AsFloat;
    DadosEmissaoNFEItens.CodigoVenda:= qryitens_nfCodigo_Venda.AsString;
    DadosEmissaoNFEItens.DescricaoProduto:= qryitens_nfDescricao.AsString;
    DadosEmissaoNFEItens.NCM:= qryitens_nfNCM.AsString;
    DadosEmissaoNFEItens.CFOP:= StringReplace(qryitens_nfCFOP.AsString, '.', '',
        [rfReplaceAll]);
    DadosEmissaoNFEItens.Unidade:= qryitens_nfUN.AsString;
    DadosEmissaoNFEItens.Quantidade:= qryitens_nfQtde.AsFloat;
    DadosEmissaoNFEItens.ValorOriginal:= qryitens_nfValor_Original.AsFloat;
    DadosEmissaoNFEItens.ValorFrete:= qryitens_nfValor_Frete.AsFloat;
    DadosEmissaoNFEItens.ValorSeguro:= qryitens_nfValor_Seguro.AsFloat;
    DadosEmissaoNFEItens.DouA:= qryitens_nfdOUa.AsString;
    DadosEmissaoNFEItens.DescAcr:= qryitens_nfDesc_Acr.AsFloat;
    DadosEmissaoNFEItens.OutrasDespesas:= qryitens_nfOutras_Despesas.AsFloat;
    DadosEmissaoNFEItens.CSOSN:= qryitens_nfCSOSN.AsString;
    DadosEmissaoNFEItens.AliquotaCalculoCredito:= qryitens_nfAliquota_Calculo_Credito.AsFloat;
    DadosEmissaoNFEItens.CreditoICMS:= qryitens_nfCredito_ICMS.AsString;
    DadosEmissaoNFEItens.TipoCalculoBCICMSST:= qryitens_nfTipo_Calculo_BC_ICMS_ST.AsString;
    DadosEmissaoNFEItens.MVAST:= qryitens_nfMVAST.AsString;
    DadosEmissaoNFEItens.BCST:= qryitens_nfBC_ST.AsString;
    DadosEmissaoNFEItens.ValorICMSST:= qryitens_nfValor_ICMS_ST.AsString;
    DadosEmissaoNFEItens.ICMSST:= qryitens_nfICMS_ST.AsString;
    DadosEmissaoNFEItens.TipoCalculoBCICMS:= qryitens_nfTipo_Calculo_BC_ICMS.AsString;
    DadosEmissaoNFEItens.BCReduzida:= qryitens_nfBase_Reduzida.AsString;
    DadosEmissaoNFEItens.BC:= qryitens_nfBC.AsString;
    DadosEmissaoNFEItens.ICMS:= qryitens_nfICMS.AsString;
    DadosEmissaoNFEItens.ValorICMS:= qryitens_nfValor_ICMS.AsString;
    DadosEmissaoNFEItens.IPI:= qryitens_nfIPI.AsString;
    DadosEmissaoNFEItens.ValorIPI:= qryitens_nfValor_IPI.AsString;
    DadosEmissaoNFEItens.CST:= qryitens_nfCST.AsString;
    DadosEmissaoNFEItens.Origem:= qryitens_nfOrigem.AsInteger;
    DadosEmissaoNFEItens.CSTIPI:= qryitens_nfCST_IPI.AsString;
    DadosEmissaoNFEItens.BCIPI:= qryitens_nfBC_IPI.AsString;
    DadosEmissaoNFEItens.IPI:= qryitens_nfIPI.AsString;
    DadosEmissaoNFEItens.ValorIPI:= qryitens_nfValor_IPI.AsString;
    DadosEmissaoNFEItens.CSTPIS:= qryitens_nfCST_PIS.AsString;
    DadosEmissaoNFEItens.BCPIS:= qryitens_nfBC_PIS.AsString;
    DadosEmissaoNFEItens.PIS:= qryitens_nfPIS.AsString;
    DadosEmissaoNFEItens.ValorPIS:= qryitens_nfValor_PIS.AsString;
    DadosEmissaoNFEItens.CSTCOFINS:= qryitens_nfCST_COFINS.AsString;
    DadosEmissaoNFEItens.BCCOFINS:= qryitens_nfBC_COFINS.AsString;
    DadosEmissaoNFEItens.COFINS:= qryitens_nfCOFINS.AsString;
    DadosEmissaoNFEItens.ValorCOFINS:= qryitens_nfValor_COFINS.AsString;
    DadosEmissaoNFE.Itens.Add(DadosEmissaoNFEItens);
    qryitens_nf.next;
  end;

  DadosEmissaoNFE.ImpostoTotalBC:= StrToFloat(EdtBase_Calculo_ICMS.Text);
  DadosEmissaoNFE.ImpostoTotalICMS:= StrToFloat(EdtValor_ICMS.Text);
  DadosEmissaoNFE.ImpostoTotalBCST:= StrToFloat(EdtBase_Calculo_ICMS_Substituicao.Text);
  DadosEmissaoNFE.ImpostoTotalST:= StrToFloat(EdtValor_ICMS_Substituicao.Text);
  DadosEmissaoNFE.ImpostoTotalVProduto:= StrToFloat(EdtValor_Total_Produtos.Text);
  DadosEmissaoNFE.ImpostoTotalVFrete:= StrToFloat(EdtValor_Frete.Text);
  DadosEmissaoNFE.ImpostoTotalVSeguro:= StrToFloat(EdtValor_Seguro.Text);
  DadosEmissaoNFE.ImpostoTotalVDesc:= StrToFloat(EdtDesconto_Nota.Text);
  DadosEmissaoNFE.ImpostoTotalVIPI:= StrToFloat(EdtValor_Total_IPI.Text);
  DadosEmissaoNFE.ImpostoTotalVPIS:= StrToFloat(EdtValor_Total_PIS.Text);
  DadosEmissaoNFE.ImpostoTotalVCOFINS:= StrToFloat(EdtValor_Total_COFINS.Text);
  DadosEmissaoNFE.ImpostoTotalVOutros:= StrToFloat(EdtOutras_Despesas.Text);
  DadosEmissaoNFE.ImpostoTotalVNF:= StrToFloat(EdtValor_Total_Nota.Text);
  DadosEmissaoNFE.ImpostoTotalVServico:= StrToFloat(EdtValor_Total_Servicos.Text);
  DadosEmissaoNFE.ImpostoTotalBCServico:= StrToFloat(EdtBase_Calculo_ISSQN.Text);
  DadosEmissaoNFE.ImpostoTotalVISS:= StrToFloat(EdtValor_ISSQN.Text);
  DadosEmissaoNFE.TipoFrete:= RGFrete.ItemIndex;
  DadosEmissaoNFE.TransportadoraCNPJ:= cnpj_trans;
  DadosEmissaoNFE.TransportadoraNome:= EdtTransportadora.Text;
  DadosEmissaoNFE.TransportadoraIE:= inscricao_estadual_trans;
  DadosEmissaoNFE.TransportadoraEndereco:= endereco_trans;
  DadosEmissaoNFE.TransportadoraMunicipio:= municipio_trans;
  DadosEmissaoNFE.TransportadoraUF:= uf_trans;
  DadosEmissaoNFE.VeiculoPlaca:= EdtVeiculo.Text;
  DadosEmissaoNFE.VeiculoUF:= EdtUF_Veiculo.Text;
  DadosEmissaoNFE.VeiculoRNTC:= antt;
  DadosEmissaoNFE.ReboquePlaca:= EdtReboque.Text;
  DadosEmissaoNFE.ReboqueUF:= EdtUF_Reboque.Text;
  DadosEmissaoNFE.ReboqueRNTC:= antt_reboque;
  DadosEmissaoNFE.VolumeQtTransportada:= EdtQuantidade_Transportada.Text;
  DadosEmissaoNFE.VolumeEspecie:= EdtEspecie.Text;
  DadosEmissaoNFE.VolumeMarca:= EdtMarca.Text;
  DadosEmissaoNFE.VolumeNVolume:= EdtNumero_Transportado.Text;
  DadosEmissaoNFE.VolumePesoL:= EdtPeso_Liquido.Text;
  DadosEmissaoNFE.VolumePesoB:= EdtPeso_Bruto.Text;

  if (ClientDataSet1.Active) then
  begin
    ClientDataSet1.First;
    while not ClientDataSet1.Eof do
    begin
      DadosEmissaoNFEPagamento:= TDadosEmissaoNFEPagamento.Create;
      DadosEmissaoNFEPagamento.NDocumento:= ClientDataSet1NDoc.AsString;
      DadosEmissaoNFEPagamento.DataVencimento:= ClientDataSet1Data.AsDateTime;
      DadosEmissaoNFEPagamento.Valor:= ClientDataSet1Valor.AsFloat;
      DadosEmissaoNFE.Pagamentos.Add(DadosEmissaoNFEPagamento);
      ClientDataSet1.next;
    end;
  end;
  DadosEmissaoNFE.InformacoesAdicionais:= MMOObservacao.Text;
  Verifica_Nota_Ja_Emitida;
  GerarNFe(TemAlerta, MemoDadosSistema, DadosEmissaoNFE, dm.ACBrNFe1, dm.ACBrNFeDANFeRL1, dm.ACBrNFeDANFCeFortes1);
  if (TemAlerta) then
  begin
    PageControl1.TabIndex := 5;
    PageControl2.TabIndex := 5;
    Abort;
  end;


  TLog.Info('--- FIM MÉTODO GERAR NFE---');
end;

procedure TFrmNFE.Pega_Codigo_Forma_Pagamento(Forma: Integer);
var
  qAux_Forma_Pagamento: TADOQuery;
begin
  qAux_Forma_Pagamento := TADOQuery.create(Self);
  try
    with qAux_Forma_Pagamento, sql do
    begin
      Close;
      Connection := dm.ADOConnection1;
      Clear;
      Add('select CP.Codigo, CP.Parcela, CP.Prazo, CP.Tipo_Pagamento, CP.Taxa, CP.Indice, CP.Tipo_Juro from Condicao_Pagamento CP');
      Add('where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value := Forma;
      open;

      codigo_forma_pagamento := qAux_Forma_Pagamento.FieldByName('Codigo')
        .AsInteger;
      // indice_imp:= qAux_Forma_Pagamento.FieldByName('Indice').AsString;
      qtde_parcela := qAux_Forma_Pagamento.FieldByName('Parcela').AsInteger;
      prazo := qAux_Forma_Pagamento.FieldByName('Prazo').AsInteger;
      taxa_juro := qAux_Forma_Pagamento.FieldByName('Taxa').AsInteger;
      tipo_pagamento := qAux_Forma_Pagamento.FieldByName
        ('Tipo_Pagamento').AsString;
      tipo_juro := qAux_Forma_Pagamento.FieldByName('Tipo_Juro').AsString;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmNFE.Gera_Financeiro;
begin
  try
    TLog.Info('--- MÉTODO Gera_Financeiro ---');
    TLog.Debug('Variável gerar_financeiro (configuração do sistema): ' +
      IntToStr(gerar_financeiro));
    TLog.Debug('Variável gera_fi (cadastro CFOP): ' + IntToStr(gera_fi));
    TLog.Debug('Condição de pagamento: ' + EdtCodigo_Condicao_Pagamento.Text);
    TLog.Debug('Data de vencimento base: ' + MEdtData_Primeiro_Vencimento.Text);

    if (gerar_financeiro = 1) and (gera_fi = 0) then
    // gera_financeiro é da config. sistema. gera_fi é do cfop
    begin
      if (EdtCodigo_Condicao_Pagamento.Text <> '') and
        (MEdtData_Primeiro_Vencimento.Text <> '  /  /    ') then
      begin
        TLog.Debug('VAI GERAR O FINANCEIRO. AS CONDIÇÕES ESTÃO OK PARA GERAR O FINANCEIRO.');
        oCli := TClienteEntidade.create;
        oCli.Codigo := qrypedido_pendenteCodCli.AsInteger;
        oCli.NomeFantasia := qrypedido_pendenteNome_Nome_Fantasia.AsString;
        oCli.RazaoSocial := qrypedido_pendenteRazao_Social.AsString;
        oCli.EnderecoTexto := qrypedido_pendenteEndereco.AsString;

        TLog.Debug('Código do Cliente: ' + IntToStr(oCli.Codigo));
        TLog.Debug('Razão Social: ' + oCli.RazaoSocial);
        TLog.Debug('Nome fantasia: ' + oCli.NomeFantasia);
        TLog.Debug('Endereço: ' + oCli.EnderecoTexto);

        if (qrypedido_pendenteTipo.AsString = 'FÍSICO') then
          oCli.CPFCNPJ := qrypedido_pendenteCPF.AsString
        else
          oCli.CPFCNPJ := qrypedido_pendenteCNPJ.AsString;

        TLog.Debug('CPF/CNPJ: ' + oCli.CPFCNPJ);

        Gera_Parcelas;
      end;
    end;
    TLog.Info('--- FIM MÉTODO Gera_Financeiro ---');
  except
    on E: Exception do
    begin
      TLog.Error('Método Gera_Financeiro - Emissão NFe: ' + E.Message);
      TMensagens.MensagemErro('Método Gera_Financeiro - Emissão NFe: ' +
        E.Message);
    end;
  end;

end;

procedure TFrmNFE.Gera_Parcelas;
var
  qAux, qAux2: TADOQuery;
  CodigoLancamento, i, doc: Integer;
  data_vencim, data: TDate;
  valaux, valaux2: double;
  valaux3: AnsiString;
begin
  qAux := TADOQuery.create(Self);
  qAux2 := TADOQuery.create(Self);
  try
    try
      i := 0;
      TLog.Info('--- MÉTODO Gera_Parcelas ---');
      TLog.Debug('Variável tipo_dias: ' + IntToStr(tipo_dias));

      data_vencim := StrToDateTime(MEdtData_Primeiro_Vencimento.Text);

      TLog.Debug('Gerou data de vencimento.');

      doc := StrToInt(EdtN_Nota_Fiscal.Text);

      oLF := TLancamentoFinanceiroEntidade.create;
      TLog.Debug('Criou objeto oLF.');
      // oLF.Codigo := CodigoLancamento;
      TLog.Debug('Gerou número de documento: ' + IntToStr(oLF.Codigo));
      oLF.Tipo := TipoLancamentoEnum.RECEBER;
      TLog.Debug('Gerou tipo de conta à receber.');
      oLF.NDocumento := doc;
      TLog.Debug('Pegou nº do documento: ' + IntToStr(oLF.NDocumento));
      oLF.codigo_empresa := UDeclaracao.codigo_empresa;
      oCP := TCondicaoPagamentoEntidade.create;
      oCP := oCPDominio.CarregaDadosCondicao
        (StrToInt(EdtCodigo_Condicao_Pagamento.Text));
      oLF.codigo_forma_pagamento := StrToInt(EdtCodigo_Condicao_Pagamento.Text);
      TLog.Debug('Pegou código da forma de pagamento: ' +
        IntToStr(oLF.codigo_forma_pagamento));

      oLF.Codigo_Cli_For := StrToInt(EdtCodigo_Destinatario.Text);

      TLog.Debug('Pegou código do cliente: ' + IntToStr(oLF.Codigo_Cli_For));
      oLF.Codigo_Tipo_Documento := Codigo_Tipo_Documento;
      oLF.Historico := historico_conta + ' Nº Nota: ' + EdtN_Nota_Fiscal.Text;
      oLF.Codigo_Departamento := Codigo_Departamento;
      oLF.Codigo_Plano := codigo_plano_financeiro;
      oLF.Data_Lancamento := date;
      oLF.Data_Vencimento := data_vencim;
      oLF.Valor_Documento := StrToFloat(EdtValor_Total_Nota.Text);
      oLF.desconto := 0;
      oLF.Multa := 0;
      oLF.Valor_Cobrado := StrToFloat(EdtValor_Total_Nota.Text);
      oLF.Observacoes := '';
      oLF.Conta_Fixa := 1;
      oLF.Calcula_Juro := 1;

      doc := StrToInt(IntToStr(doc) + '1');
      ClientDataSet1.First;
      while not ClientDataSet1.Eof do
      begin
        oPLF := TParcelasLancamentoFinanceiroEntidade.create;
        TLog.Debug('Criou objeto oPLF');
        // oPLF.Codigo := CodigoLancamento;
        TLog.Debug('Gerou código da parcela: ' + IntToStr(oPLF.Codigo));
        oPLF.N_Documento := ClientDataSet1NDoc.AsInteger;
        TLog.Debug('Gerou nº de documento da parcela: ' +
          IntToStr(oPLF.N_Documento));
        oPLF.Data_Vencimento := ClientDataSet1Data.Value;
        TLog.Debug('Gerou data de vencimento: ' +
          DateToStr(oPLF.Data_Vencimento));
        TLog.Debug('Tipo Pagamento: ' + tipoPagamento);

        { if (tipoPagamento = 'A PRAZO') then
          begin
          oPLF.Data_Pagamento := 0;
          end
          else
          begin
          oPLF.Data_Pagamento := date;
          end; }
        oPLF.Data_Pagamento := ClientDataSet1DataPagamento.Value;
        { if (tipo_dias = 0) then
          begin
          data_vencim := IncDay(data_vencim, prazo);
          end
          else if (tipo_dias = 1) then
          begin
          data_vencim := data_vencim + prazo;
          end
          else if (tipo_dias = 2) then
          begin
          data_vencim := IncMonth(data_vencim, 1);
          end; }

        Inc(i);
        oPLF.Parcela := i;

        if (ClientDataSet1Status.AsString = 'PENDENTE') then
        begin
          oPLF.Status := StatusEnumParcela.PENDENTE;
          // ClientDataSet1Status.Value := 'PENDENTE';
        end
        else
        begin
          oPLF.Status := StatusEnumParcela.PAGO;
          // ClientDataSet1Status.Value := 'PAGO';
        end;
        // valaux2 := StrToFloat(EdtValor_Total_Nota.Text);
        // valaux2 := (valaux2 / qtdeParcela);
        oPLF.Valor := ClientDataSet1Valor.Value;
        oPLF.Valor_Pagar := ClientDataSet1Valor.Value;
        // ClientDataSet1Valor.Value := valaux2;

        oPLF.Codigo_Forma_Pagamento_Parcela := oCP.Codigo;

        if (tipoPagamento = 'A PRAZO') then
          oPLF.Valor_Restante := ClientDataSet1Valor.Value
        else
          oPLF.Valor_Restante := 0;

        oPLF.desconto := 0;
        oPLF.Acrescimo := 0;

        if (tipoPagamento = 'A PRAZO') then
          oPLF.Valor_Pago := 0
        else
          oPLF.Valor_Pago := ClientDataSet1Valor.Value;

        TLog.Debug('...');
        oLF.ParcelasLancamentoFinanceiro.Add(oPLF);
        TLog.Debug('Adicionou objeto oPLF dentro do oLF');
        ClientDataSet1.next;
      end;
      TLog.Info('--- FIM MÉTODO Gera_Parcelas ---');
    finally
      FreeAndNil(qAux);
      FreeAndNil(qAux2);
    end;
  except
    on E: Exception do
    begin
      TLog.Error('Erro ao gerar dados para o financeiro: ' + E.Message);
    end;

  end;

end;

procedure TFrmNFE.habilitarReferenciaDevolucao(habilitar: Boolean);
begin
  try
    btnLocalizar.Enabled := habilitar;
    DBGridReferenciaDevolucao.Enabled := habilitar;
  except
    on E: Exception do
      TLog.Error(Self.ClassName + ' - habilitarReferenciaDevolucao - ' +
        E.Message);
  end;
end;

procedure TFrmNFE.MEdtCNPJ_RetiradaExit(Sender: TObject);
begin
  // cnpj_emitente := MEdtCNPJ_Retirada.Text;
end;

procedure TFrmNFE.MEdtData_EmissaoEnter(Sender: TObject);
begin
  MEdtData_Emissao.Text := DateToStr(date);
end;

procedure TFrmNFE.MEdtData_EmissaoExit(Sender: TObject);
begin
  try
    Util.Verifica_Data(MEdtData_Emissao);
    if FormatDateTime('dd/mm/yyyy', FDataEmissao) <> Trim(MEdtData_Emissao.Text)
    then
    begin
      FDataEmissao := StrToDateTime(MEdtData_Emissao.Text +
        FormatDateTime('hh:mm', now));
    end;
  except
    on E: Exception do
      TLog.Error(Self.ClassName + ' - MEdtData_EmissaoExit - ' + E.Message);
  end;
end;

procedure TFrmNFE.MEdtData_Entrada_SaidaEnter(Sender: TObject);
begin
  MEdtData_Entrada_Saida.Text := DateToStr(date);
end;

procedure TFrmNFE.MEdtData_Entrada_SaidaExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Emissao);
end;

procedure TFrmNFE.MEdtHora_Entrada_SaidaDblClick(Sender: TObject);
begin
//  if (FileExists(ExtractFilePath(Application.ExeName) + 'TesteECF.txt')) then
//  begin
    Gera_Estoque;
    Gera_Financeiro;
    qryitens_nf.First;
    while not qryitens_nf.Eof do
    begin
      Atualiza_Status_NFe(qryitens_nfCodigo.AsInteger, 'PAGO', 'NFE');
      qryitens_nf.next;
    end;
//  end;
end;

procedure TFrmNFE.MEdtHora_Entrada_SaidaEnter(Sender: TObject);
begin
  MEdtHora_Entrada_Saida.Text := FormatDateTime('hh:mm', now);
end;

procedure TFrmNFE.Pega_COFINS;
begin
  { with ADOQuery6, sql do
    begin
    close;
    clear;
    add('select RC1.Descricao as Descricao_COFINS1, RC1.Aliquota as Aliquota_COFINS1, RC1.Tipo_Recolhimento as Tipo_Recolhimento_COFINS1,');
    add('RC1.Base_Reduzida as Base_Reduzida_COFINS1, RC1.Percentual_BC_Reduzida as Percentual_BC_Reduzida_COFINS1, RC1.Base_Acrescida as Base_Acrescida_COFINS1,');
    add('RC1.Percentual_BC_Acrescida as Percentual_BC_Acrescida_COFINS1, CST4_1.Codigo_Situacao as Codigo_ST_COFINS1, CST4_1.Descricao as Descricao_ST_COFINS1,');

    add('RC2.Descricao as Descricao_COFINS2, RC2.Aliquota as Aliquota_COFINS2, RC2.Tipo_Recolhimento as Tipo_Recolhimento_COFINS2,');
    add('RC2.Base_Reduzida as Base_Reduzida_COFINS2, RC2.Percentual_BC_Reduzida as Percentual_BC_Reduzida_COFINS2, RC2.Base_Acrescida as Base_Acrescida_COFINS2,');
    add('RC2.Percentual_BC_Acrescida as Percentual_BC_Acrescida_COFINS2, CST4_2.Codigo_Situacao as Codigo_ST_COFINS2, CST4_2.Descricao as Descricao_ST_COFINS2,');

    add('RC3.Descricao as Descricao_COFINS3, RC3.Aliquota as Aliquota_COFINS3, RC3.Tipo_Recolhimento as Tipo_Recolhimento_COFINS3,');
    add('RC3.Base_Reduzida as Base_Reduzida_COFINS3, RC3.Percentual_BC_Reduzida as Percentual_BC_Reduzida_COFINS3, RC3.Base_Acrescida as Base_Acrescida_COFINS3,');
    add('RC3.Percentual_BC_Acrescida as Percentual_BC_Acrescida_COFINS3, CST4_3.Codigo_Situacao as Codigo_ST_COFINS3, CST4_3.Descricao as Descricao_ST_COFINS3,');

    add('RC4.Descricao as Descricao_COFINS4, RC4.Aliquota as Aliquota_COFINS4, RC4.Tipo_Recolhimento as Tipo_Recolhimento_COFINS4,');
    add('RC4.Base_Reduzida as Base_Reduzida_COFINS4, RC4.Percentual_BC_Reduzida as Percentual_BC_Reduzida_COFINS4, RC4.Base_Acrescida as Base_Acrescida_COFINS4,');
    add('RC4.Percentual_BC_Acrescida as Percentual_BC_Acrescida_COFINS4, CST4_4.Codigo_Situacao as Codigo_ST_COFINS4, CST4_4.Descricao as Descricao_ST_COFINS4,');

    add('RC5.Descricao as Descricao_COFINS5, RC5.Aliquota as Aliquota_COFINS5, RC5.Tipo_Recolhimento as Tipo_Recolhimento_COFINS5,');
    add('RC5.Base_Reduzida as Base_Reduzida_COFINS5, RC5.Percentual_BC_Reduzida as Percentual_BC_Reduzida_COFINS5, RC5.Base_Acrescida as Base_Acrescida_COFINS5,');
    add('RC5.Percentual_BC_Acrescida as Percentual_BC_Acrescida_COFINS5, CST4_5.Codigo_Situacao as Codigo_ST_COFINS5, CST4_5.Descricao as Descricao_ST_COFINS5,');

    add('RC6.Descricao as Descricao_COFINS6, RC6.Aliquota as Aliquota_COFINS6, RC6.Tipo_Recolhimento as Tipo_Recolhimento_COFINS6,');
    add('RC6.Base_Reduzida as Base_Reduzida_COFINS6, RC6.Percentual_BC_Reduzida as Percentual_BC_Reduzida_COFINS6, RC6.Base_Acrescida as Base_Acrescida_COFINS6,');
    add('RC6.Percentual_BC_Acrescida as Percentual_BC_Acrescida_COFINS6, CST4_6.Codigo_Situacao as Codigo_ST_COFINS6, CST4_6.Descricao as Descricao_ST_COFINS6,');

    add('RC7.Descricao as Descricao_COFINS7, RC7.Aliquota as Aliquota_COFINS7, RC7.Tipo_Recolhimento as Tipo_Recolhimento_COFINS7,');
    add('RC7.Base_Reduzida as Base_Reduzida_COFINS7, RC7.Percentual_BC_Reduzida as Percentual_BC_Reduzida_COFINS7, RC7.Base_Acrescida as Base_Acrescida_COFINS7,');
    add('RC7.Percentual_BC_Acrescida as Percentual_BC_Acrescida_COFINS7, CST4_7.Codigo_Situacao as Codigo_ST_COFINS7, CST4_7.Descricao as Descricao_ST_COFINS7');
    add('from Produto Pro');

    add('inner join Grupo_Produto_Tributacao_COFINS GPTC on (GPTC.Codigo = Pro.Codigo_Grupo_Tributacao_COFINS)');
    add('inner join Tratamento_COFINS TC on (GPTC.Codigo_Tratamento_COFINS = TC.Codigo)');
    add('inner join Itens_Tratamento_COFINS ITCOFINS on (TC.Codigo = ITCOFINS.Codigo)');
    add('inner join Regra_COFINS RC1 on (ITCOFINS.Entrada_Regra_EN = RC1.Codigo)');
    add('inner join Regra_COFINS RC2 on (ITCOFINS.Entrada_Regra_EPP = RC2.Codigo)');
    add('inner join Regra_COFINS RC3 on (ITCOFINS.Entrada_Regra_ME = RC3.Codigo)');
    add('inner join Regra_COFINS RC4 on (ITCOFINS.Saida_Regra_EN = RC4.Codigo)');
    add('inner join Regra_COFINS RC5 on (ITCOFINS.Saida_Regra_EPP = RC5.Codigo)');
    add('inner join Regra_COFINS RC6 on (ITCOFINS.Saida_Regra_ME = RC6.Codigo)');
    add('inner join Regra_COFINS RC7 on (ITCOFINS.Regra_Nao_Contribuinte = RC7.Codigo)');

    add('inner join Cadastro_Situacao_Tributaria CST4_1 on (RC1.Codigo_Situacao_Tributaria = CST4_1.Codigo)');
    add('inner join Cadastro_Situacao_Tributaria CST4_2 on (RC2.Codigo_Situacao_Tributaria = CST4_2.Codigo)');
    add('inner join Cadastro_Situacao_Tributaria CST4_3 on (RC3.Codigo_Situacao_Tributaria = CST4_3.Codigo)');
    add('inner join Cadastro_Situacao_Tributaria CST4_4 on (RC4.Codigo_Situacao_Tributaria = CST4_4.Codigo)');
    add('inner join Cadastro_Situacao_Tributaria CST4_5 on (RC5.Codigo_Situacao_Tributaria = CST4_5.Codigo)');
    add('inner join Cadastro_Situacao_Tributaria CST4_6 on (RC6.Codigo_Situacao_Tributaria = CST4_6.Codigo)');
    add('inner join Cadastro_Situacao_Tributaria CST4_7 on (RC7.Codigo_Situacao_Tributaria = CST4_7.Codigo)');
    add('where Pro.Codigo_Grupo_Tributacao_COFINS = :Grupo');
    Parameters.ParamByName('Grupo').Value:= StrToInt(LblGrupo_Tributacao_COFINS.Caption);
    open;
    end; }
end;

procedure TFrmNFE.Pega_COFINS_Item;
begin
  try
    qcofins := TADOQuery.create(Self);
    with qcofins, sql do
    begin
      Close;
      Connection := dm.ADOConnection1;
      Clear;
      Add('select N.* from NF_COFINS N');
      Add('where N.N_Nota_Fiscal = :Nota and N.Codigo_Produto = :Produto');
      Parameters.ParamByName('Nota').Value := EdtN_Nota_Fiscal.Text;
      // Parameters.ParamByName('Produto').Value:= qryitens_nfCodigo_Produto_Inteiro.AsInteger;
      open;
    end;
  finally

  end;
end;

procedure TFrmNFE.Pega_ICMS;
begin
  { with ADOQuery2, sql do
    begin
    close;
    clear;
    add('select RI1.Codigo, RI1.Aliquota, RI1.Base_Reduzida, RI1.Base_Acrescida, RI1.Percentual_BC_Reduzida, RI1.Percentual_BC_Acrescida,');
    add('RI2.Codigo, RI2.Aliquota, RI2.Base_Reduzida, RI2.Base_Acrescida, RI2.Percentual_BC_Reduzida, RI2.Percentual_BC_Acrescida,');
    add('RI3.Codigo, RI3.Aliquota, RI3.Base_Reduzida, RI3.Base_Acrescida, RI3.Percentual_BC_Reduzida, RI3.Percentual_BC_Acrescida,');
    add('RI4.Codigo, RI4.Aliquota, RI4.Base_Reduzida, RI4.Base_Acrescida, RI4.Percentual_BC_Reduzida, RI4.Percentual_BC_Acrescida,');
    add('RI5.Codigo, RI5.Aliquota, RI5.Base_Reduzida, RI5.Base_Acrescida, RI5.Percentual_BC_Reduzida, RI5.Percentual_BC_Acrescida,');
    add('RI6.Codigo, RI6.Aliquota, RI6.Base_Reduzida, RI6.Base_Acrescida, RI6.Percentual_BC_Reduzida, RI6.Percentual_BC_Acrescida,');
    add('RI7.Codigo, RI7.Aliquota, RI7.Base_Reduzida, RI7.Base_Acrescida, RI7.Percentual_BC_Reduzida, RI7.Percentual_BC_Acrescida, GPT.*, TI.*,');
    add('COF1.Descricao, COF2.Descricao, COF3.Descricao, COF4.Descricao, COF5.Descricao, COF6.Descricao, COF7.Descricao,');
    add('CST1.Codigo_Situacao, CST1.Origem, CST2.Codigo_Situacao, CST3.Codigo_Situacao, CST4.Codigo_Situacao, CST5.Codigo_Situacao, CST6.Codigo_Situacao, CST7.Codigo_Situacao,');
    add('Pro.Codigo_Grupo_Tributacao from Produto Pro');

    add('inner join Grupo_Produto_Tributacao GPT on (Pro.Codigo_Grupo_Tributacao = GPT.Codigo)');
    add('inner join Tratamento_ICMS TI on (GPT.Codigo_Tratamento_ICMS = TI.Codigo)');
    add('inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo)');

    add('inner join Regra_ICMS RI1 on (ITI.Entrada_Regra_EN = RI1.Codigo)');
    add('inner join Regra_ICMS RI2 on (ITI.Entrada_Regra_EPP = RI2.Codigo)');
    add('inner join Regra_ICMS RI3 on (ITI.Entrada_Regra_ME = RI3.Codigo)');
    add('inner join Regra_ICMS RI4 on (ITI.Saida_Regra_EN = RI4.Codigo)');
    add('inner join Regra_ICMS RI5 on (ITI.Saida_Regra_EPP = RI5.Codigo)');
    add('inner join Regra_ICMS RI6 on (ITI.Saida_Regra_ME = RI6.Codigo)');
    add('inner join Regra_ICMS RI7 on (ITI.Regra_Nao_Contribuinte = RI7.Codigo)');

    add('left join Cadastro_Observacao_Fiscal COF1 on (RI1.Codigo_Observacao_Fiscal = COF1.Codigo)');
    add('left join Cadastro_Observacao_Fiscal COF2 on (RI2.Codigo_Observacao_Fiscal = COF2.Codigo)');
    add('left join Cadastro_Observacao_Fiscal COF3 on (RI3.Codigo_Observacao_Fiscal = COF3.Codigo)');
    add('left join Cadastro_Observacao_Fiscal COF4 on (RI4.Codigo_Observacao_Fiscal = COF4.Codigo)');
    add('left join Cadastro_Observacao_Fiscal COF5 on (RI5.Codigo_Observacao_Fiscal = COF5.Codigo)');
    add('left join Cadastro_Observacao_Fiscal COF6 on (RI6.Codigo_Observacao_Fiscal = COF6.Codigo)');
    add('left join Cadastro_Observacao_Fiscal COF7 on (RI7.Codigo_Observacao_Fiscal = COF7.Codigo)');

    add('left join Cadastro_Situacao_Tributaria CST1 on (RI1.Codigo_Situacao_Tributaria = CST1.Codigo)');
    add('left join Cadastro_Situacao_Tributaria CST2 on (RI2.Codigo_Situacao_Tributaria = CST2.Codigo)');
    add('left join Cadastro_Situacao_Tributaria CST3 on (RI3.Codigo_Situacao_Tributaria = CST3.Codigo)');
    add('left join Cadastro_Situacao_Tributaria CST4 on (RI4.Codigo_Situacao_Tributaria = CST4.Codigo)');
    add('left join Cadastro_Situacao_Tributaria CST5 on (RI5.Codigo_Situacao_Tributaria = CST5.Codigo)');
    add('left join Cadastro_Situacao_Tributaria CST6 on (RI6.Codigo_Situacao_Tributaria = CST6.Codigo)');
    add('left join Cadastro_Situacao_Tributaria CST7 on (RI7.Codigo_Situacao_Tributaria = CST7.Codigo)');
    add('where Pro.Codigo_Grupo_Tributacao = :Grupo');
    Parameters.ParamByName('Grupo').Value:= StrToInt(LblGrupo_Tributacao.Caption);
    open;
    end;
    LblRegra.Caption:= ADOQuery2Codigo.AsString;
    LblOrigem.Caption:= ADOQuery2Origem.AsString; }
end;

procedure TFrmNFE.Pega_ICMS_Item;
begin
  try
    qicms := TADOQuery.create(Self);
    with qicms, sql do
    begin
      Close;
      Connection := dm.ADOConnection1;
      Clear;
      Add('select N.* from NF_ICMS_SN N');
      Add('where N.N_Nota_Fiscal = :Nota and N.Codigo_Produto = :Produto');
      Parameters.ParamByName('Nota').Value := EdtN_Nota_Fiscal.Text;
      // Parameters.ParamByName('Produto').Value:= qryitens_nfCodigo_Produto_Inteiro.AsInteger;
      open;
    end;
  finally

  end;
end;

procedure TFrmNFE.Pega_IPI;
begin
  { with ADOQuery4, sql do
    begin
    close;
    clear;
    add('select RIPI1.Descricao as Descricao_IPI_1, RIPI1.Aliquota as Aliquota_IPI_1, NCM1.Codigo_NCM as Codigo_NCM_1, NCM1.Descricao as Descricao_NCM_1, RIPI1.Tipo_Recolhimento as Tipo_Recolhimento_IPI_1,');
    add('RIPI1.Base_Reduzida as Base_Reduzida_IPI_1, RIPI1.Percentual_BC_Reduzida as Percentual_BC_Reduzida_IPI_1, RIPI1.Base_Acrescida as Base_Acrescida_IPI_1,');
    add('RIPI1.Percentual_BC_Acrescida as Percentual_BC_Acrescida_IPI_1, CST2_1.Codigo_Situacao as Codigo_ST_IPI2_1, CST2_1.Descricao as Descricao_ST_IPI2_1,');

    add('RIPI2.Descricao as Descricao_IPI_2, RIPI2.Aliquota as Aliquota_IPI_2, NCM2.Codigo_NCM as Codigo_NCM_2, NCM2.Descricao as Descricao_NCM_2, RIPI2.Tipo_Recolhimento as Tipo_Recolhimento_IPI_2,');
    add('RIPI2.Base_Reduzida as Base_Reduzida_IPI_2, RIPI2.Percentual_BC_Reduzida as Percentual_BC_Reduzida_IPI_2, RIPI2.Base_Acrescida as Base_Acrescida_IPI_2,');
    add('RIPI2.Percentual_BC_Acrescida as Percentual_BC_Acrescida_IPI_2, CST2_2.Codigo_Situacao as Codigo_ST_IPI2_2, CST2_2.Descricao as Descricao_ST_IPI2_2,');

    add('RIPI3.Descricao as Descricao_IPI_3, RIPI3.Aliquota as Aliquota_IPI_3, NCM3.Codigo_NCM as Codigo_NCM_3, NCM3.Descricao as Descricao_NCM_3, RIPI3.Tipo_Recolhimento as Tipo_Recolhimento_IPI_3,');
    add('RIPI3.Base_Reduzida as Base_Reduzida_IPI_3, RIPI3.Percentual_BC_Reduzida as Percentual_BC_Reduzida_IPI_3, RIPI3.Base_Acrescida as Base_Acrescida_IPI_3,');
    add('RIPI3.Percentual_BC_Acrescida as Percentual_BC_Acrescida_IPI_3, CST2_3.Codigo_Situacao as Codigo_ST_IPI2_3, CST2_3.Descricao as Descricao_ST_IPI2_3,');

    add('RIPI4.Descricao as Descricao_IPI_4, RIPI4.Aliquota as Aliquota_IPI_4, NCM4.Codigo_NCM as Codigo_NCM_4, NCM4.Descricao as Descricao_NCM_4, RIPI4.Tipo_Recolhimento as Tipo_Recolhimento_IPI_4,');
    add('RIPI4.Base_Reduzida as Base_Reduzida_IPI_4, RIPI4.Percentual_BC_Reduzida as Percentual_BC_Reduzida_IPI_4, RIPI4.Base_Acrescida as Base_Acrescida_IPI_4,');
    add('RIPI4.Percentual_BC_Acrescida as Percentual_BC_Acrescida_IPI_4, CST2_4.Codigo_Situacao as Codigo_ST_IPI2_4, CST2_4.Descricao as Descricao_ST_IPI2_4,');

    add('RIPI5.Descricao as Descricao_IPI_5, RIPI5.Aliquota as Aliquota_IPI_5, NCM5.Codigo_NCM as Codigo_NCM_5, NCM5.Descricao as Descricao_NCM_5, RIPI5.Tipo_Recolhimento as Tipo_Recolhimento_IPI_5,');
    add('RIPI5.Base_Reduzida as Base_Reduzida_IPI_5, RIPI5.Percentual_BC_Reduzida as Percentual_BC_Reduzida_IPI_5, RIPI5.Base_Acrescida as Base_Acrescida_IPI_5,');
    add('RIPI5.Percentual_BC_Acrescida as Percentual_BC_Acrescida_IPI_5, CST2_5.Codigo_Situacao as Codigo_ST_IPI2_5, CST2_5.Descricao as Descricao_ST_IPI2_5,');

    add('RIPI6.Descricao as Descricao_IPI_6, RIPI6.Aliquota as Aliquota_IPI_6, NCM6.Codigo_NCM as Codigo_NCM_6, NCM6.Descricao as Descricao_NCM_6, RIPI6.Tipo_Recolhimento as Tipo_Recolhimento_IPI_6,');
    add('RIPI6.Base_Reduzida as Base_Reduzida_IPI_6, RIPI6.Percentual_BC_Reduzida as Percentual_BC_Reduzida_IPI_6, RIPI6.Base_Acrescida as Base_Acrescida_IPI_6,');
    add('RIPI6.Percentual_BC_Acrescida as Percentual_BC_Acrescida_IPI_6, CST2_6.Codigo_Situacao as Codigo_ST_IPI2_6, CST2_6.Descricao as Descricao_ST_IPI2_6,');

    add('RIPI7.Descricao as Descricao_IPI_7, RIPI7.Aliquota as Aliquota_IPI_7, NCM7.Codigo_NCM as Codigo_NCM_7, NCM7.Descricao as Descricao_NCM_7, RIPI7.Tipo_Recolhimento as Tipo_Recolhimento_IPI_7,');
    add('RIPI7.Base_Reduzida as Base_Reduzida_IPI_7, RIPI7.Percentual_BC_Reduzida as Percentual_BC_Reduzida_IPI_7, RIPI7.Base_Acrescida as Base_Acrescida_IPI_7,');
    add('RIPI7.Percentual_BC_Acrescida as Percentual_BC_Acrescida_IPI_7, CST2_7.Codigo_Situacao as Codigo_ST_IPI2_7, CST2_7.Descricao as Descricao_ST_IPI2_7');
    add('from Produto Pro');

    add('inner join Grupo_Produto_Tributacao_IPI GPTI on (GPTI.Codigo = Pro.Codigo_Grupo_Tributacao_IPI)');
    add('inner join Tratamento_IPI TI on (GPTI.Codigo_Tratamento_IPI = TI.Codigo)');
    add('inner join Itens_Tratamento_IPI ITIPI on (TI.Codigo = ITIPI.Codigo)');
    add('inner join Regra_IPI RIPI1 on (ITIPI.Entrada_Regra_EN = RIPI1.Codigo)');
    add('inner join Regra_IPI RIPI2 on (ITIPI.Entrada_Regra_EPP = RIPI2.Codigo)');
    add('inner join Regra_IPI RIPI3 on (ITIPI.Entrada_Regra_ME = RIPI3.Codigo)');
    add('inner join Regra_IPI RIPI4 on (ITIPI.Saida_Regra_EN = RIPI4.Codigo)');
    add('inner join Regra_IPI RIPI5 on (ITIPI.Saida_Regra_EPP = RIPI5.Codigo)');
    add('inner join Regra_IPI RIPI6 on (ITIPI.Saida_Regra_ME = RIPI6.Codigo)');
    add('inner join Regra_IPI RIPI7 on (ITIPI.Regra_Nao_Contribuinte = RIPI7.Codigo)');

    add('inner join Cadastro_Situacao_Tributaria CST2_1 on (RIPI1.Codigo_Situacao_Tributaria = CST2_1.Codigo)');
    add('inner join Cadastro_Situacao_Tributaria CST2_2 on (RIPI2.Codigo_Situacao_Tributaria = CST2_2.Codigo)');
    add('inner join Cadastro_Situacao_Tributaria CST2_3 on (RIPI3.Codigo_Situacao_Tributaria = CST2_3.Codigo)');
    add('inner join Cadastro_Situacao_Tributaria CST2_4 on (RIPI4.Codigo_Situacao_Tributaria = CST2_4.Codigo)');
    add('inner join Cadastro_Situacao_Tributaria CST2_5 on (RIPI5.Codigo_Situacao_Tributaria = CST2_5.Codigo)');
    add('inner join Cadastro_Situacao_Tributaria CST2_6 on (RIPI6.Codigo_Situacao_Tributaria = CST2_6.Codigo)');
    add('inner join Cadastro_Situacao_Tributaria CST2_7 on (RIPI7.Codigo_Situacao_Tributaria = CST2_7.Codigo)');

    add('inner join NCM NCM1 on (RIPI1.Codigo_NCM = NCM1.Codigo)');
    add('inner join NCM NCM2 on (RIPI2.Codigo_NCM = NCM2.Codigo)');
    add('inner join NCM NCM3 on (RIPI3.Codigo_NCM = NCM3.Codigo)');
    add('inner join NCM NCM4 on (RIPI4.Codigo_NCM = NCM4.Codigo)');
    add('inner join NCM NCM5 on (RIPI5.Codigo_NCM = NCM5.Codigo)');
    add('inner join NCM NCM6 on (RIPI6.Codigo_NCM = NCM6.Codigo)');
    add('inner join NCM NCM7 on (RIPI7.Codigo_NCM = NCM7.Codigo)');
    add('where Pro.Codigo_Grupo_Tributacao_IPI = :Grupo');
    Parameters.ParamByName('Grupo').Value:= StrToInt(LblGrupo_Tributacao_IPI.Caption);
    open;
    end; }
end;

procedure TFrmNFE.Pega_IPI_Item;
begin
  try
    qipi := TADOQuery.create(Self);
    with qipi, sql do
    begin
      Close;
      Connection := dm.ADOConnection1;
      Clear;
      Add('select N.* from NF_IPI N');
      Add('where N.N_Nota_Fiscal = :Nota and N.Codigo_Produto = :Produto');
      Parameters.ParamByName('Nota').Value := EdtN_Nota_Fiscal.Text;
      // Parameters.ParamByName('Produto').Value:= qryitens_nfCodigo_Produto_Inteiro.AsInteger;
      open;
    end;
  finally

  end;
end;

procedure TFrmNFE.Pega_Obs_Codigo;
var
  qAux: TADOQuery;
begin
  if (EdtCodigo_Obs_Fiscal.Text <> '') then
  begin
    qAux := TADOQuery.create(Self);
    with qAux, sql do
    begin
      Close;
      Connection := dm.ADOConnection1;
      Clear;
      Add('select COF.Descricao from Cadastro_Observacao_Fiscal COF');
      Add('where COF.Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value :=
        StrToInt(EdtCodigo_Obs_Fiscal.Text);
      open;

      if (IsEmpty = false) then
      begin
        MMOObservacao.Text := qAux.FieldByName('Descricao').AsString;
      end
      else
      begin
        Mensagem_Fim_Pesquisa;
        abort;
      end;
    end;
  end;
end;

procedure TFrmNFE.Pega_PIS;
begin
  { with ADOQuery5, sql do
    begin
    close;
    clear;
    add('select RPIS1.Descricao as Descricao_PIS1, RPIS1.Aliquota as Aliquota_PIS1, RPIS1.Tipo_Recolhimento as Tipo_Recolhimento_PIS1,');
    add('RPIS1.Base_Reduzida as Base_Reduzida_PIS1, RPIS1.Percentual_BC_Reduzida as Percentual_BC_Reduzida_PIS1, RPIS1.Base_Acrescida as Base_Acrescida_PIS1,');
    add('RPIS1.Percentual_BC_Acrescida as Percentual_BC_Acrescida_PIS1, CST3_1.Codigo_Situacao as Codigo_ST_PIS3_1, CST3_1.Descricao as Descricao_ST_PIS3_1,');

    add('RPIS2.Descricao as Descricao_PIS2, RPIS2.Aliquota as Aliquota_PIS2, RPIS2.Tipo_Recolhimento as Tipo_Recolhimento_PIS2,');
    add('RPIS2.Base_Reduzida as Base_Reduzida_PIS2, RPIS2.Percentual_BC_Reduzida as Percentual_BC_Reduzida_PIS2, RPIS2.Base_Acrescida as Base_Acrescida_PIS2,');
    add('RPIS2.Percentual_BC_Acrescida as Percentual_BC_Acrescida_PIS2, CST3_2.Codigo_Situacao as Codigo_ST_PIS3_2, CST3_2.Descricao as Descricao_ST_PIS3_2,');

    add('RPIS3.Descricao as Descricao_PIS3, RPIS3.Aliquota as Aliquota_PIS3, RPIS3.Tipo_Recolhimento as Tipo_Recolhimento_PIS3,');
    add('RPIS3.Base_Reduzida as Base_Reduzida_PIS3, RPIS3.Percentual_BC_Reduzida as Percentual_BC_Reduzida_PIS3, RPIS3.Base_Acrescida as Base_Acrescida_PIS3,');
    add('RPIS3.Percentual_BC_Acrescida as Percentual_BC_Acrescida_PIS3, CST3_3.Codigo_Situacao as Codigo_ST_PIS3_3, CST3_3.Descricao as Descricao_ST_PIS3_3,');

    add('RPIS4.Descricao as Descricao_PIS4, RPIS4.Aliquota as Aliquota_PIS4, RPIS4.Tipo_Recolhimento as Tipo_Recolhimento_PIS4,');
    add('RPIS4.Base_Reduzida as Base_Reduzida_PIS4, RPIS4.Percentual_BC_Reduzida as Percentual_BC_Reduzida_PIS4, RPIS4.Base_Acrescida as Base_Acrescida_PIS4,');
    add('RPIS4.Percentual_BC_Acrescida as Percentual_BC_Acrescida_PIS4, CST3_4.Codigo_Situacao as Codigo_ST_PIS3_4, CST3_4.Descricao as Descricao_ST_PIS3_4,');

    add('RPIS5.Descricao as Descricao_PIS5, RPIS5.Aliquota as Aliquota_PIS5, RPIS5.Tipo_Recolhimento as Tipo_Recolhimento_PIS5,');
    add('RPIS5.Base_Reduzida as Base_Reduzida_PIS5, RPIS5.Percentual_BC_Reduzida as Percentual_BC_Reduzida_PIS5, RPIS5.Base_Acrescida as Base_Acrescida_PIS5,');
    add('RPIS5.Percentual_BC_Acrescida as Percentual_BC_Acrescida_PIS5, CST3_5.Codigo_Situacao as Codigo_ST_PIS3_5, CST3_5.Descricao as Descricao_ST_PIS3_5,');

    add('RPIS6.Descricao as Descricao_PIS6, RPIS6.Aliquota as Aliquota_PIS6, RPIS6.Tipo_Recolhimento as Tipo_Recolhimento_PIS6,');
    add('RPIS6.Base_Reduzida as Base_Reduzida_PIS6, RPIS6.Percentual_BC_Reduzida as Percentual_BC_Reduzida_PIS6, RPIS6.Base_Acrescida as Base_Acrescida_PIS6,');
    add('RPIS6.Percentual_BC_Acrescida as Percentual_BC_Acrescida_PIS6, CST3_6.Codigo_Situacao as Codigo_ST_PIS3_6, CST3_6.Descricao as Descricao_ST_PIS3_6,');

    add('RPIS7.Descricao as Descricao_PIS7, RPIS7.Aliquota as Aliquota_PIS7, RPIS7.Tipo_Recolhimento as Tipo_Recolhimento_PIS7,');
    add('RPIS7.Base_Reduzida as Base_Reduzida_PIS7, RPIS7.Percentual_BC_Reduzida as Percentual_BC_Reduzida_PIS7, RPIS7.Base_Acrescida as Base_Acrescida_PIS7,');
    add('RPIS7.Percentual_BC_Acrescida as Percentual_BC_Acrescida_PIS7, CST3_7.Codigo_Situacao as Codigo_ST_PIS3_7, CST3_7.Descricao as Descricao_ST_PIS3_7');
    add('from Produto Pro');

    add('inner join Grupo_Produto_Tributacao_PIS GPTP on (GPTP.Codigo = Pro.Codigo_Grupo_Tributacao_PIS)');
    add('inner join Tratamento_PIS TP on (GPTP.Codigo_Tratamento_PIS = TP.Codigo)');
    add('inner join Itens_Tratamento_PIS ITPIS on (TP.Codigo = ITPIS.Codigo)');
    add('inner join Regra_PIS RPIS1 on (ITPIS.Entrada_Regra_EN = RPIS1.Codigo)');
    add('inner join Regra_PIS RPIS2 on (ITPIS.Entrada_Regra_EPP = RPIS2.Codigo)');
    add('inner join Regra_PIS RPIS3 on (ITPIS.Entrada_Regra_ME = RPIS3.Codigo)');
    add('inner join Regra_PIS RPIS4 on (ITPIS.Saida_Regra_EN = RPIS4.Codigo)');
    add('inner join Regra_PIS RPIS5 on (ITPIS.Saida_Regra_EPP = RPIS5.Codigo)');
    add('inner join Regra_PIS RPIS6 on (ITPIS.Saida_Regra_ME = RPIS6.Codigo)');
    add('inner join Regra_PIS RPIS7 on (ITPIS.Regra_Nao_Contribuinte = RPIS7.Codigo)');

    add('inner join Cadastro_Situacao_Tributaria CST3_1 on (RPIS1.Codigo_Situacao_Tributaria = CST3_1.Codigo)');
    add('inner join Cadastro_Situacao_Tributaria CST3_2 on (RPIS2.Codigo_Situacao_Tributaria = CST3_2.Codigo)');
    add('inner join Cadastro_Situacao_Tributaria CST3_3 on (RPIS3.Codigo_Situacao_Tributaria = CST3_3.Codigo)');
    add('inner join Cadastro_Situacao_Tributaria CST3_4 on (RPIS4.Codigo_Situacao_Tributaria = CST3_4.Codigo)');
    add('inner join Cadastro_Situacao_Tributaria CST3_5 on (RPIS5.Codigo_Situacao_Tributaria = CST3_5.Codigo)');
    add('inner join Cadastro_Situacao_Tributaria CST3_6 on (RPIS6.Codigo_Situacao_Tributaria = CST3_6.Codigo)');
    add('inner join Cadastro_Situacao_Tributaria CST3_7 on (RPIS7.Codigo_Situacao_Tributaria = CST3_7.Codigo)');
    add('where Pro.Codigo_Grupo_Tributacao_PIS = :Grupo');
    Parameters.ParamByName('Grupo').Value:= StrToInt(LblGrupo_Tributacao_PIS.Caption);
    open;
    end; }
end;

procedure TFrmNFE.Pega_PIS_Item;
begin
  try
    qpis := TADOQuery.create(Self);
    with qpis, sql do
    begin
      Close;
      Connection := dm.ADOConnection1;
      Clear;
      Add('select N.* from NF_PIS N');
      Add('where N.N_Nota_Fiscal = :Nota and N.Codigo_Produto = :Produto');
      Parameters.ParamByName('Nota').Value := EdtN_Nota_Fiscal.Text;
      // Parameters.ParamByName('Produto').Value:= qryitens_nfCodigo_Produto_Inteiro.AsInteger;
      open;
    end;
  finally

  end;
end;

procedure TFrmNFE.qryitens_nfAfterEdit(DataSet: TDataSet);
begin
  { if (DBGrid1.SelectedIndex <> 3) and
    (DBGrid1.SelectedIndex <> 4) and
    (DBGrid1.SelectedIndex <> 5) and
    (DBGrid1.SelectedIndex <> 6) and
    (DBGrid1.SelectedIndex <> 7) and
    (DBGrid1.SelectedIndex <> 8) then
    altera:= true; }
end;

procedure TFrmNFE.Timer1Timer(Sender: TObject);
begin
  {try
    if (FileExists(caminho_servidor + '\Atualizações\TemNota.txt')) then
    begin
      TLog.Debug('Encontrou arquivo TemNota.');
      Atualiza_Pedido_Pendente;
      DeleteFile(caminho_servidor + '\Atualizações\TemNota.txt');
      TLog.Debug('Deletou arquivo TemNota.');
    end;
  except
    on E: Exception do
    begin
      TLog.Error('Erro ao executar Atualiza_Pedido_Pendente: ' + E.Message);
    end;
  end;}
end;

procedure TFrmNFE.ToolButton1Click(Sender: TObject);
begin
  if (EdtN_Nota_Fiscal.Text = '') then
  begin
    Application.MessageBox('Informe o número da nota fiscal para importar',
      'Número da nota fiscal', MB_OK + MB_ICONHAND);
    PageControl1.TabIndex := 0;
    EdtN_Nota_Fiscal.SetFocus;
    abort;
  end;
  // Application.CreateForm(TFrmChama_Produto_NF, FrmChama_Produto_NF);
  // FrmChama_Produto_NF.ShowModal;
  // FrmChama_Produto_NF.Free;
end;

procedure TFrmNFE.Verifica_CSOSN;
begin
  { if (csosn = '101') then
    begin
    GBST.Visible:= false;
    GBAliquota.Visible:= true;
    GBICMS_ST_Retido.Visible:= false;
    end
    else if (csosn = '102') then
    begin
    GBST.Visible:= false;
    GBAliquota.Visible:= false;
    GBICMS_ST_Retido.Visible:= false;
    end
    else if (csosn = '103') then
    begin
    GBST.Visible:= false;
    GBAliquota.Visible:= false;
    GBICMS_ST_Retido.Visible:= false;
    end
    else if (csosn = '201') then
    begin
    GBST.Visible:= true;
    GBAliquota.Visible:= true;
    GBICMS_ST_Retido.Visible:= false;
    end
    else if (csosn = '202') then
    begin
    GBST.Visible:= true;
    GBAliquota.Visible:= false;
    GBICMS_ST_Retido.Visible:= false;
    end
    else if (csosn = '203') then
    begin
    GBST.Visible:= true;
    GBAliquota.Visible:= false;
    GBICMS_ST_Retido.Visible:= false;
    end
    else if (csosn = '300') then
    begin
    GBST.Visible:= false;
    GBAliquota.Visible:= false;
    GBICMS_ST_Retido.Visible:= false;
    end
    else if (csosn = '400') then
    begin
    GBST.Visible:= false;
    GBAliquota.Visible:= false;
    GBICMS_ST_Retido.Visible:= false;
    end
    else if (csosn = '500') then
    begin
    GBST.Visible:= false;
    GBAliquota.Visible:= false;
    GBICMS_ST_Retido.Visible:= true;
    end
    else if (csosn = '900') then
    begin
    GBST.Visible:= true;
    GBAliquota.Visible:= true;
    GBICMS_ST_Retido.Visible:= false;
    end; }
end;

procedure TFrmNFE.Verifica_CST;
begin
  { if (EdtCST.Text = '00') then
    begin
    GBICMS.Visible:= true;
    GBICMS_ST.Visible:= false;
    GBICMS_ST_Retido_TN.Visible:= false;

    CBModalidade_BC_ICMS.Enabled:= true;
    EdtPercentual_Reducao_BC_ICMS.Enabled:= false;
    EdtBC_ICMS.Enabled:= true;
    CBMotivo_Desoneração.Enabled:= false;
    EdtAliquota_ICMS.Enabled:= true;
    EdtValor_ICMS_Produto.Enabled:= true;
    end
    else if (EdtCST.Text = '10') then
    begin
    GBICMS.Visible:= true;
    GBICMS_ST.Visible:= true;
    GBICMS_ST_Retido_TN.Visible:= false;

    CBModalidade_BC_ICMS.Enabled:= true;
    EdtPercentual_Reducao_BC_ICMS.Enabled:= false;
    EdtBC_ICMS.Enabled:= true;
    CBMotivo_Desoneração.Enabled:= false;
    EdtAliquota_ICMS.Enabled:= true;
    EdtValor_ICMS_Produto.Enabled:= true;
    end
    else if (EdtCST.Text = '20') then
    begin
    GBICMS.Visible:= true;
    GBICMS_ST.Visible:= false;
    GBICMS_ST_Retido_TN.Visible:= false;

    CBModalidade_BC_ICMS.Enabled:= true;
    EdtPercentual_Reducao_BC_ICMS.Enabled:= true;
    EdtBC_ICMS.Enabled:= true;
    CBMotivo_Desoneração.Enabled:= false;
    EdtAliquota_ICMS.Enabled:= true;
    EdtValor_ICMS_Produto.Enabled:= true;
    end
    else if (EdtCST.Text = '30') then
    begin
    GBICMS.Visible:= false;
    GBICMS_ST.Visible:= true;
    GBICMS_ST_Retido_TN.Visible:= false;

    -----CBModalidade_BC_ICMS.Enabled:= false;
    EdtPercentual_Reducao_BC_ICMS.Enabled:= false;
    EdtBC_ICMS.Enabled:= false;
    CBMotivo_Desoneração.Enabled:= false;
    EdtAliquota_ICMS.Enabled:= false;
    EdtValor_ICMS_Produto.Enabled:= false;-----
    end
    else if (EdtCST.Text = '40') then
    begin
    GBICMS.Visible:= true;
    GBICMS_ST.Visible:= false;
    GBICMS_ST_Retido_TN.Visible:= false;

    CBModalidade_BC_ICMS.Enabled:= false;
    EdtPercentual_Reducao_BC_ICMS.Enabled:= false;
    EdtBC_ICMS.Enabled:= false;
    CBMotivo_Desoneração.Enabled:= true;
    EdtAliquota_ICMS.Enabled:= false;
    EdtValor_ICMS_Produto.Enabled:= true;
    end
    else if (EdtCST.Text = '41') then
    begin
    GBICMS.Visible:= true;
    GBICMS_ST.Visible:= false;
    GBICMS_ST_Retido_TN.Visible:= false;

    CBModalidade_BC_ICMS.Enabled:= false;
    EdtPercentual_Reducao_BC_ICMS.Enabled:= false;
    EdtBC_ICMS.Enabled:= false;
    CBMotivo_Desoneração.Enabled:= true;
    EdtAliquota_ICMS.Enabled:= false;
    EdtValor_ICMS_Produto.Enabled:= true;
    end
    else if (EdtCST.Text = '50') then
    begin
    GBICMS.Visible:= true;
    GBICMS_ST.Visible:= false;
    GBICMS_ST_Retido_TN.Visible:= false;

    CBModalidade_BC_ICMS.Enabled:= false;
    EdtPercentual_Reducao_BC_ICMS.Enabled:= false;
    EdtBC_ICMS.Enabled:= false;
    CBMotivo_Desoneração.Enabled:= true;
    EdtAliquota_ICMS.Enabled:= false;
    EdtValor_ICMS_Produto.Enabled:= true;
    end
    else if (EdtCST.Text = '51') then
    begin
    GBICMS.Visible:= true;
    GBICMS_ST.Visible:= false;
    GBICMS_ST_Retido_TN.Visible:= false;

    CBModalidade_BC_ICMS.Enabled:= true;
    EdtPercentual_Reducao_BC_ICMS.Enabled:= true;
    EdtBC_ICMS.Enabled:= true;
    CBMotivo_Desoneração.Enabled:= false;
    EdtAliquota_ICMS.Enabled:= true;
    EdtValor_ICMS_Produto.Enabled:= true;
    end
    else if (EdtCST.Text = '60') then   //
    begin
    GBICMS.Visible:= false;
    GBICMS_ST.Visible:= false;
    GBICMS_ST_Retido_TN.Visible:= true;

    -----CBModalidade_BC_ICMS.Enabled:= false;
    EdtPercentual_Reducao_BC_ICMS.Enabled:= false;
    EdtBC_ICMS.Enabled:= false;
    CBMotivo_Desoneração.Enabled:= false;
    EdtAliquota_ICMS.Enabled:= false;
    EdtValor_ICMS_Produto.Enabled:= false;-----
    end
    else if (EdtCST.Text = '70') then
    begin
    GBICMS.Visible:= true;
    GBICMS_ST.Visible:= true;
    GBICMS_ST_Retido_TN.Visible:= false;

    CBModalidade_BC_ICMS.Enabled:= true;
    EdtPercentual_Reducao_BC_ICMS.Enabled:= true;
    EdtBC_ICMS.Enabled:= true;
    CBMotivo_Desoneração.Enabled:= false;
    EdtAliquota_ICMS.Enabled:= true;
    EdtValor_ICMS_Produto.Enabled:= true;
    end
    else if (EdtCST.Text = '90') then
    begin
    GBICMS.Visible:= true;
    GBICMS_ST.Visible:= true;
    GBICMS_ST_Retido_TN.Visible:= false;

    CBModalidade_BC_ICMS.Enabled:= true;
    EdtPercentual_Reducao_BC_ICMS.Enabled:= true;
    EdtBC_ICMS.Enabled:= true;
    CBMotivo_Desoneração.Enabled:= false;
    EdtAliquota_ICMS.Enabled:= true;
    EdtValor_ICMS_Produto.Enabled:= true;
    end; }
end;

procedure TFrmNFE.Verifica_Nota_Ja_Emitida;
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.create(nil);
    with qAux, sql do
    begin
      Close;
      Connection := dm.ADOConnection1;
      Clear;
      Add('select P.N_Nota_Fiscal from Pedido P');
      Add('where N_Nota_Fiscal = :N_Nota_Fiscal');
      Parameters.ParamByName('N_Nota_Fiscal').Value := EdtN_Nota_Fiscal.Text;
      open;

      if (IsEmpty = false) then
      begin
        Escreve_Alertas('Nº da Nota Fiscal já emitida' + #13);
        encontrou_alertas := true;
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmNFE.BBtnPesquisarClick(Sender: TObject);
begin
  { Application.CreateForm(TFrmChama_Setor, FrmChama_Setor);
    FrmChama_Setor.ShowModal;
    FrmChama_Setor.Release; }
end;

end.
