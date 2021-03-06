unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB, Forms, DBClient, Provider, ImgList, Controls, Dialogs,
  ACBrECFClass, ACBrBase, ACBrECF, ACBrGAV, ACBrBAL, IdBaseComponent,
  IdComponent, IdRawBase, IdRawClient, IdIcmpClient, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, Graphics, RSPrint,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxSkinsdxBarPainter, dxPSCore, dxPScxCommon, cxStyles, cxClasses, ACBrPAF,
  ACBrEAD, ACBrMail, ACBrDANFCeFortesFr, ACBrNFeDANFEClass, ACBrNFeDANFeRLClass,
  ACBrDFe, ACBrNFe, ACBrTEFD, ACBrNFeDANFeESCPOS, ACBrPosPrinter,
  ACBrECFVirtual, ACBrECFVirtualBuffer, ACBrECFVirtualPrinter,
  ACBrECFVirtualNaoFiscal, ACBrECFVirtualNFCe;

type
  TDM = class(TDataModule)
    qrychama_produto: TADOQuery;
    qrychama_condicao: TADOQuery;
    qrychama_condicaoCodigo: TAutoIncField;
    qrychama_condicaoDescricao: TStringField;
    qrychama_condicaoParcela: TIntegerField;
    qrychama_condicaoPrazo: TIntegerField;
    qrychama_condicaoTaxa: TFloatField;
    qrychama_condicaoTipo_Pagamento: TStringField;
    qrychama_condicaoForma_Negociacao: TStringField;
    qrychama_condicaoData_Cadastro: TDateTimeField;
    qrychama_veiculo: TADOQuery;
    qrychama_veiculoCodigo: TAutoIncField;
    qrychama_veiculoData_Cadastro: TDateTimeField;
    qrychama_veiculoVeiculo: TStringField;
    qrychama_veiculoCodigo_Cliente: TIntegerField;
    qrychama_veiculoCodigo_Marca: TIntegerField;
    qrychama_veiculoModelo: TStringField;
    qrychama_veiculoAno_Fabricacao: TStringField;
    qrychama_veiculoPlaca: TStringField;
    qrychama_veiculoChassi: TStringField;
    qrychama_veiculoRenavam: TStringField;
    qrychama_veiculoDescricao: TStringField;
    qrychama_veiculoNome_Nome_Fantasia: TStringField;
    qrychama_servico: TADOQuery;
    qryR06: TADOQuery;
    qryR06Data_Movimento: TDateTimeField;
    qryR06Tipo: TStringField;
    qryR06N_Fabricacao: TStringField;
    qryR06MF_Adicional: TStringField;
    qryR06Modelo_ECF: TStringField;
    qryR06COO: TStringField;
    qryR06GNF: TStringField;
    qryR06GRG: TStringField;
    qryR06CDC: TStringField;
    qryR06Denominacao: TStringField;
    qryR06Data_Final_Emissao: TStringField;
    qryR06Hora_Final_Emissao: TStringField;
    qryR06Caixa: TStringField;
    qryr04: TADOQuery;
    qryr04Data_Movimento: TDateTimeField;
    qryr04Tipo: TStringField;
    qryr04MF_Adicional: TStringField;
    qryr04Modelo_ECF: TStringField;
    qryr04CCF: TStringField;
    qryr04COO: TStringField;
    qryr04Data_Inicio_Emissao: TStringField;
    qryr04Sub_Total_Documento: TStringField;
    qryr04Desconto: TStringField;
    qryr04Tipo_Desconto: TStringField;
    qryr04Acrecimo: TStringField;
    qryr04Tipo_Acrecimo: TStringField;
    qryr04Valor_Total: TStringField;
    qryr04Cancelamento: TStringField;
    qryr04Valor_Cancelamento_Acrecimo: TStringField;
    qryr04Indicador_Acre_Desc: TStringField;
    qryr04Adquirente: TStringField;
    qryr04CPF_CNPJ: TStringField;
    qryr04Caixa: TStringField;
    qryr07: TADOQuery;
    qryr07Data_Movimento: TDateTimeField;
    qryr07Tipo: TStringField;
    qryr07N_Fabricacao: TStringField;
    qryr07MF_Adicional: TStringField;
    qryr07Modelo_ECF: TStringField;
    qryr07COO: TStringField;
    qryr07CCF: TStringField;
    qryr07GNF: TStringField;
    qryr07Meio_Pagamento: TStringField;
    qryr07Valor_Pago: TStringField;
    qryr07Estorno: TStringField;
    qryr07Valor_Estorno: TStringField;
    qryr07Caixa: TStringField;
    qryvenda: TADOQuery;
    qryitens_venda: TADOQuery;
    qryr05: TADOQuery;
    qryr05N_Pedido: TStringField;
    qryr05Data_Movimento: TDateTimeField;
    qryr05Tipo: TStringField;
    qryr05N_Fabricacao: TStringField;
    qryr05MF_Adicional: TStringField;
    qryr05Modelo_ECF: TStringField;
    qryr05COO: TStringField;
    qryr05CCF: TStringField;
    qryr05N_Item: TStringField;
    qryr05Codigo_Produto: TStringField;
    qryr05Descricao: TStringField;
    qryr05Quantidade: TStringField;
    qryr05Unidade: TStringField;
    qryr05Valor_Unitario: TStringField;
    qryr05Desconto: TStringField;
    qryr05Acrecimo: TStringField;
    qryr05Valor_Total: TStringField;
    qryr05Totalizador_Parcial: TStringField;
    qryr05Cancelamento: TStringField;
    qryr05Quantidade_Cancelada: TStringField;
    qryr05Valor_Cancelado: TStringField;
    qryr05Valor_Cancelamento_Acrecimo: TStringField;
    qryr05IAT: TStringField;
    qryr05IPPT: TStringField;
    qryr05Casas_Decimais_Qtde: TStringField;
    qryr05Casas_Decimais_Valor_Unitario: TStringField;
    qryr05Caixa: TStringField;
    qryitens_os: TADOQuery;
    qryitens_osN_Pedido: TStringField;
    qryitens_osCodigo_Servico: TIntegerField;
    qryitens_osValor_Unitario: TFloatField;
    qryitens_osDesconto: TFloatField;
    qryitens_osTipo_Desconto: TStringField;
    qryitens_osSub_Total: TFloatField;
    qryitens_osCodigo_Venda: TStringField;
    qryitens_osDescricao: TStringField;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    ds_itens_venda: TDataSource;
    qryr05Codigo_Produto_Inteiro: TIntegerField;
    qryItens_Venda_Aux: TADOQuery;
    qryfechamento_venda_aux: TADOQuery;
    qrychama_condicaoTEF: TStringField;
    qrychama_condicaoCheque: TStringField;
    qrychama_condicaoStatus: TStringField;
    ImgImagens_Comandos: TImageList;
    ImgImagens_Chama: TImageList;
    ImgImagens_PAF: TImageList;
    ImgImagens_Consulta: TImageList;
    qrycontrola_codigo: TADOQuery;
    qrycontrola_codigoCodigo: TIntegerField;
    qryfechamento_venda_auxCodigo: TIntegerField;
    qryfechamento_venda_auxForma_Pagamento: TStringField;
    qryfechamento_venda_auxValor: TFloatField;
    qryfechamento_venda_auxData: TDateTimeField;
    qryfechamento_venda_auxTipo_Documento: TStringField;
    ADOConnection1: TADOConnection;
    qryicms: TADOQuery;
    qryiss: TADOQuery;
    qryissCodigo: TAutoIncField;
    qryissAliquota: TStringField;
    qryissTributacao: TStringField;
    qryissBase_Reduzida: TStringField;
    qryissBase_Acrescida: TStringField;
    qryissPercentual_BC_Reduzida: TStringField;
    qryissPercentual_BC_Acrescida: TStringField;
    qryissCodigo_Grupo_Tributacao_ISSQN: TIntegerField;
    qryvendaCodigo: TIntegerField;
    qryvendaN_Pedido: TStringField;
    qryvendaN_Pre_Venda: TStringField;
    qryvendaCOO: TStringField;
    qryvendaCOO_Vin: TStringField;
    qryvendaCCF: TStringField;
    qryvendaCodigo_Cliente: TIntegerField;
    qryvendaCodigo_Empresa: TIntegerField;
    qryvendaCodigo_Veiculo: TIntegerField;
    qryvendaCodigo_Funcionario: TIntegerField;
    qryvendaCodigo_Tabela_Preco: TIntegerField;
    qryvendaData_Venda: TDateTimeField;
    qryvendaQtde_Itens: TIntegerField;
    qryvendaQtde_Servicos: TIntegerField;
    qryvendaTotal_Produtos: TFloatField;
    qryvendaTotal_Servicos: TFloatField;
    qryvendaTotal_Pedido: TFloatField;
    qryvendaTipo: TStringField;
    qryvendaStatus: TStringField;
    qryvendaValor_Recebido: TFloatField;
    qryvendaTroco: TFloatField;
    qryvendaMesclada: TIntegerField;
    qryvendaProblema_Reclamado: TStringField;
    qryvendaProblema_Constatado: TStringField;
    qryvendaSolucao: TStringField;
    qryipi: TADOQuery;
    qryvendaDAVC: TStringField;
    qrypis: TADOQuery;
    qrycofins: TADOQuery;
    qryvendaDAVAnt: TStringField;
    qryr04N_Pedido: TIntegerField;
    qryr04N_Fabricacao: TStringField;
    qryfechamento_venda_auxTroco: TFloatField;
    qryfechamento_venda_auxCodigo_Empresa: TIntegerField;
    qryfechamento_venda_auxStatus: TStringField;
    qryfechamento_venda_auxCodigo_Caixa: TIntegerField;
    qryfechamento_venda_auxAcerto: TIntegerField;
    qryfechamento_venda_auxCodigo_Usuario: TIntegerField;
    qryfechamento_venda_auxTipo: TStringField;
    qryfechamento_venda_auxMovimenta: TIntegerField;
    qryfechamento_venda_auxN_Documento: TIntegerField;
    qryfechamento_venda_auxParcela: TIntegerField;
    qrychama_condicaoBandeira: TStringField;
    qryItens_Venda_AuxCodigo: TIntegerField;
    qryItens_Venda_AuxN_Item: TStringField;
    qryItens_Venda_AuxCodigo_Produto: TIntegerField;
    qryItens_Venda_AuxCodigo_Venda: TStringField;
    qryItens_Venda_AuxDescricao: TStringField;
    qryItens_Venda_AuxNCM: TStringField;
    qryItens_Venda_AuxOrigem: TStringField;
    qryItens_Venda_AuxCFOP: TStringField;
    qryItens_Venda_AuxUN: TStringField;
    qryItens_Venda_AuxTipo_Calculo_BC_ICMS: TStringField;
    qryItens_Venda_AuxTipo_Recolhimento: TStringField;
    qryItens_Venda_AuxICMS: TStringField;
    qryItens_Venda_AuxCST: TStringField;
    qryItens_Venda_AuxCSOSN: TStringField;
    qryItens_Venda_AuxBase_Reduzida: TStringField;
    qryItens_Venda_AuxBase_Acrescida: TStringField;
    qryItens_Venda_AuxBC: TStringField;
    qryItens_Venda_AuxValor_ICMS: TStringField;
    qryItens_Venda_AuxTipo_Calculo_BC_ICMS_ST: TStringField;
    qryItens_Venda_AuxMVAST: TStringField;
    qryItens_Venda_AuxICMS_ST: TStringField;
    qryItens_Venda_AuxCST_ST: TStringField;
    qryItens_Venda_AuxBase_Reduzida_ST: TStringField;
    qryItens_Venda_AuxBase_Acrescida_ST: TStringField;
    qryItens_Venda_AuxBC_ST: TStringField;
    qryItens_Venda_AuxValor_ICMS_ST: TStringField;
    qryItens_Venda_AuxAliquota_Calculo_Credito: TStringField;
    qryItens_Venda_AuxCredito_ICMS: TStringField;
    qryItens_Venda_AuxTipo_Calculo_IPI: TStringField;
    qryItens_Venda_AuxIPI: TStringField;
    qryItens_Venda_AuxCST_IPI: TStringField;
    qryItens_Venda_AuxBase_Reduzida_IPI: TStringField;
    qryItens_Venda_AuxBase_Acrescida_IPI: TStringField;
    qryItens_Venda_AuxBC_IPI: TStringField;
    qryItens_Venda_AuxValor_IPI: TFloatField;
    qryItens_Venda_AuxTipo_Calculo_PIS: TStringField;
    qryItens_Venda_AuxPIS: TStringField;
    qryItens_Venda_AuxCST_PIS: TStringField;
    qryItens_Venda_AuxBase_Reduzida_PIS: TStringField;
    qryItens_Venda_AuxBase_Acrescida_PIS: TStringField;
    qryItens_Venda_AuxBC_PIS: TStringField;
    qryItens_Venda_AuxValor_PIS: TFloatField;
    qryItens_Venda_AuxTipo_Calculo_COFINS: TStringField;
    qryItens_Venda_AuxCOFINS: TStringField;
    qryItens_Venda_AuxCST_COFINS: TStringField;
    qryItens_Venda_AuxBase_Reduzida_COFINS: TStringField;
    qryItens_Venda_AuxBase_Acrescida_COFINS: TStringField;
    qryItens_Venda_AuxBC_COFINS: TStringField;
    qryItens_Venda_AuxValor_COFINS: TFloatField;
    qryItens_Venda_AuxQtde: TFloatField;
    qryItens_Venda_AuxQtde_Entregue: TFloatField;
    qryItens_Venda_AuxQtde_Restante: TFloatField;
    qryItens_Venda_AuxValor_Unitario: TFloatField;
    qryItens_Venda_AuxValor_Frete: TFloatField;
    qryItens_Venda_AuxValor_Seguro: TFloatField;
    qryItens_Venda_AuxOutras_Despesas: TFloatField;
    qryItens_Venda_AuxSub_Total: TFloatField;
    qryItens_Venda_AuxSub_Total_Liquido: TFloatField;
    qryItens_Venda_AuxCancelado: TStringField;
    qryItens_Venda_AuxIndica_Valor_Total: TStringField;
    qryItens_Venda_AuxCodigo_Venda_1: TStringField;
    qryItens_Venda_AuxDescricao_1: TStringField;
    qryvendaDesc_Acr: TFloatField;
    qryvendaTipo_Desc_Acr: TStringField;
    qryItens_Venda_AuxDesc_Acr: TFloatField;
    qryItens_Venda_AuxTipo_Desc_Acr: TStringField;
    qrychama_condicaoTipo_Juro: TStringField;
    qryItens_Venda_AuxValor_Compra: TFloatField;
    qryvendaData_Vencimento: TDateTimeField;
    qrycofinsCodigo: TAutoIncField;
    qrycofinsAliquota: TStringField;
    qrycofinsTipo_Calculo: TStringField;
    qrycofinsBase_Reduzida: TStringField;
    qrycofinsBase_Acrescida: TStringField;
    qrycofinsPercentual_BC_Reduzida: TStringField;
    qrycofinsPercentual_BC_Acrescida: TStringField;
    qrycofinsCodigo_Situacao: TStringField;
    qrycofinsCodigo_Grupo_Tributacao_COFINS: TIntegerField;
    qrypisCodigo: TAutoIncField;
    qrypisAliquota: TStringField;
    qrypisTipo_Calculo: TStringField;
    qrypisBase_Reduzida: TStringField;
    qrypisBase_Acrescida: TStringField;
    qrypisPercentual_BC_Reduzida: TStringField;
    qrypisPercentual_BC_Acrescida: TStringField;
    qrypisCodigo_Situacao: TStringField;
    qrypisCodigo_Grupo_Tributacao_PIS: TIntegerField;
    qryipiCodigo: TAutoIncField;
    qryipiAliquota: TStringField;
    qryipiTipo_Calculo: TStringField;
    qryipiBase_Reduzida: TStringField;
    qryipiBase_Acrescida: TStringField;
    qryipiPercentual_BC_Reduzida: TStringField;
    qryipiPercentual_BC_Acrescida: TStringField;
    qryipiCodigo_Situacao: TStringField;
    qryipiCodigo_Grupo_Tributacao_IPI: TIntegerField;
    qryicmsCodigo: TAutoIncField;
    qryicmsAliquota: TStringField;
    qryicmsCFOP_D: TStringField;
    qryicmsCFOP_F: TStringField;
    qryicmsTipo_Recolhimento: TStringField;
    qryicmsTipo_Calculo_BC_ICMS: TStringField;
    qryicmsTipo_Calculo_BC_ICMS_ST: TStringField;
    qryicmsBase_Reduzida: TStringField;
    qryicmsBase_Acrescida: TStringField;
    qryicmsPercentual_BC_Reduzida: TStringField;
    qryicmsPercentual_BC_Acrescida: TStringField;
    qryicmsCodigo_Situacao: TStringField;
    qryicmsCodigo_CSOSN: TStringField;
    qryicmsCodigo_Grupo_Tributacao: TIntegerField;
    qrychama_condicaoIndice: TStringField;
    qryr07Codigo: TAutoIncField;
    qryr07N_Usuario: TStringField;
    qryR06Codigo: TAutoIncField;
    qryR06N_Usuario: TStringField;
    qryr05Codigo: TAutoIncField;
    qryr05N_Usuario: TStringField;
    qryr04Codigo: TAutoIncField;
    qryr04N_Usuario: TStringField;
    ADOConnectionLocal: TADOConnection;
    DataSource2: TDataSource;
    DataSource4: TDataSource;
    DataSource5: TDataSource;
    qryendereco_cliente: TADOQuery;
    DataSource6: TDataSource;
    qryitens_vendaCodigo_Registro: TAutoIncField;
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
    qryitens_vendaQtde_Entregue: TFloatField;
    qryitens_vendaQtde_Restante: TFloatField;
    qryitens_vendaQtde_S_Previsao: TFloatField;
    qryitens_vendaValor_Compra: TFloatField;
    qryitens_vendaValor_Original: TFloatField;
    qryitens_vendaValor_Unitario: TFloatField;
    qryitens_vendaDesc_Acr: TFloatField;
    qryitens_vendaDesc_Acr_P: TFloatField;
    qryitens_vendaTipo_Desc_Acr: TStringField;
    qryitens_vendadOUa: TStringField;
    qryitens_vendaValor_Frete: TFloatField;
    qryitens_vendaValor_Seguro: TFloatField;
    qryitens_vendaOutras_Despesas: TFloatField;
    qryitens_vendaSub_Total: TFloatField;
    qryitens_vendaSub_Total_Liquido: TFloatField;
    qryitens_vendaCancelado: TStringField;
    qryitens_vendaIndica_Valor_Total: TStringField;
    qryitens_vendaData_Entrega: TDateTimeField;
    qryitens_vendaHora_Entrega: TStringField;
    qryitens_vendaTipo_Venda: TStringField;
    qryitens_vendaTipo_Entrega: TStringField;
    qryitens_vendaComissao: TFloatField;
    IdIcmpClient1: TIdIcmpClient;
    ftpupdate: TIdFTP;
    qryvendaCodigo_Forma_Pag: TIntegerField;
    qryvendaTotal_Desc_Acr: TFloatField;
    qryvendaStatus_OS: TStringField;
    qryvendaChave_NFe: TStringField;
    qryvendaProtocolo_NFe: TStringField;
    qryvendaN_Nota_Fiscal: TIntegerField;
    qryvendaObservacao: TStringField;
    qryvendaHora_Venda: TWideStringField;
    qryitens_vendaPerc_Desc_Vista: TFloatField;
    qryitens_vendaPerc_Desc_Prazo: TFloatField;
    qrychama_produto_similar: TADOQuery;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    DateTimeField4: TDateTimeField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    StringField10: TStringField;
    StringField11: TStringField;
    DateTimeField5: TDateTimeField;
    DateTimeField6: TDateTimeField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    DataSource7: TDataSource;
    qryvendaAtualizou_Orcamento_Vencido: TIntegerField;
    qrychama_produto_similarCodigo_Similar: TStringField;
    qrychama_produto_similarValor_Compra_Unitario: TFloatField;
    qrychama_produto_similarValor_Ultima_Compra_Unitario: TFloatField;
    qryitens_vendaPermite_Credito: TIntegerField;
    qryitens_vendaCodigo_Obs_Fiscal: TIntegerField;
    qryitens_vendaQtde_Estoque_Atual: TFloatField;
    qryvendaData_Previsao_Entrega: TDateTimeField;
    qryvendaData_Entrega: TDateTimeField;
    qryvendaKilometragem: TFloatField;
    qryveiculo: TADOQuery;
    qryveiculoVeiculo: TStringField;
    qryveiculoModelo: TStringField;
    qryveiculoAno_Fabricacao: TStringField;
    qryveiculoPlaca: TStringField;
    qryveiculoDescricao: TStringField;
    qryveiculoCodigo: TAutoIncField;
    DataSource8: TDataSource;
    qrystatus: TADOQuery;
    qrystatusDescricao: TStringField;
    qrystatusData_Cadastro: TDateTimeField;
    DataSource9: TDataSource;
    qrychama_servicoCodigo: TIntegerField;
    qrychama_servicoDescricao_Servico: TStringField;
    qrychama_servicoAliquota: TStringField;
    qrychama_servicoPreco_Vista: TFloatField;
    qryveiculoRenavam: TStringField;
    qryitens_vendaValor_Compra_Nota: TFloatField;
    qrychama_funcionario: TADOQuery;
    qrychama_funcionarioNome: TStringField;
    qrychama_funcionarioComissao: TFloatField;
    qrychama_funcionarioCodigo: TIntegerField;
    qrychama_cargo: TADOQuery;
    qrychama_cargoCodigo: TAutoIncField;
    qrychama_cargoDescricao: TStringField;
    qrychama_cargoData_Cadastro: TDateTimeField;
    qrychama_tipo_ocorrencia: TADOQuery;
    qrychama_tipo_ocorrenciaCodigo: TAutoIncField;
    qrychama_tipo_ocorrenciaDescricao: TStringField;
    qrychama_tipo_ocorrenciaData_Cadastro: TDateTimeField;
    qrychama_produto_similarPercentual_Comissao_Vista: TFloatField;
    qrychama_produto_similarPercentual_Comissao_Prazo: TFloatField;
    qryvendaECF: TStringField;
    qryautorizados: TADOQuery;
    qryautorizadosCodigo: TAutoIncField;
    qryautorizadosCodigo_Cliente: TIntegerField;
    qryautorizadosNome_Autorizado: TStringField;
    qryautorizadosCPF_Autorizado: TStringField;
    ACBrECF1: TACBrECF;
    qrychama_condicaoPrograma_Impressora: TStringField;
    qrychama_funcionarioComissao_Servico: TFloatField;
    ACBrBAL1: TACBrBAL;
    qrychama_cliente: TADOQuery;
    qrychama_clienteCodigo: TIntegerField;
    qrychama_clienteCodigo_Empresa: TIntegerField;
    qrychama_clienteTipo: TStringField;
    qrychama_clienteEnquadramento: TStringField;
    qrychama_clienteNome_Nome_Fantasia: TStringField;
    qrychama_clienteRazao_Social: TStringField;
    qrychama_clienteCPF: TStringField;
    qrychama_clienteRG: TStringField;
    qrychama_clienteOrgao_Expedidor: TStringField;
    qrychama_clienteData_Emissao_RG: TDateTimeField;
    qrychama_clienteCNPJ: TStringField;
    qrychama_clienteInsc_Estadual: TStringField;
    qrychama_clienteInsc_Municipal: TStringField;
    qrychama_clienteNumero: TStringField;
    qrychama_clienteComplemento: TStringField;
    qrychama_clienteReferencia: TStringField;
    qrychama_clienteCodigo_Setor: TIntegerField;
    qrychama_clienteCodigo_Cidade: TIntegerField;
    qrychama_clienteCodigo_Grupo: TIntegerField;
    qrychama_clienteSuframa: TStringField;
    qrychama_clienteTelefone: TStringField;
    qrychama_clienteCelular: TStringField;
    qrychama_clienteContato: TStringField;
    qrychama_clienteTelefone_Contato: TStringField;
    qrychama_clienteEmail: TStringField;
    qrychama_clienteSite: TStringField;
    qrychama_clienteProfissao: TStringField;
    qrychama_clienteData_Nascimento: TDateTimeField;
    qrychama_clienteEstado_Civil: TStringField;
    qrychama_clienteData_Cadastro: TDateTimeField;
    qrychama_clienteCredito: TFloatField;
    qrychama_clienteLimite_Credito: TFloatField;
    qrychama_clienteAcima_Limite_Credito: TStringField;
    qrychama_clienteLimite_Desconto: TFloatField;
    qrychama_clienteAcima_Limite_Desconto: TStringField;
    qrychama_clienteObservacoes: TStringField;
    qrychama_clienteCodigo_Tabela_Preco: TIntegerField;
    qrychama_clienteBloqueado: TStringField;
    qrychama_clienteCodigo_Usuario: TIntegerField;
    qrychama_clienteEndereco: TStringField;
    qrychama_clienteCEP: TStringField;
    qrychama_clienteCidade: TStringField;
    qrychama_clienteUF: TStringField;
    qrychama_clienteCodigo_Municipio: TStringField;
    qrychama_clienteSetor: TStringField;
    qrychama_clienteGrupo: TStringField;
    qrychama_clienteTabela_Preco: TStringField;
    DataSource3: TDataSource;
    qryendereco_clienteCodigo_Cliente: TIntegerField;
    qryendereco_clienteCodigo_Setor: TIntegerField;
    qryendereco_clienteNumero: TStringField;
    qryendereco_clienteComplemento: TStringField;
    qryendereco_clienteTipo_Endereco: TStringField;
    qryendereco_clienteEndereco: TStringField;
    qryendereco_clienteCEP: TStringField;
    qryendereco_clienteCodigo_Registro: TAutoIncField;
    qryendereco_clienteSetor: TStringField;
    qrysetor: TADOQuery;
    qrysetorCodigo: TAutoIncField;
    qrysetorDescricao: TStringField;
    qrysetorData_Cadastro: TDateTimeField;
    qrycidade: TADOQuery;
    qrycidadeCodigo: TAutoIncField;
    qrycidadeDescricao: TStringField;
    qrycidadeUF: TStringField;
    qrycidadeDDD: TStringField;
    qrycidadeData_Cadastro: TDateTimeField;
    qrycidadeCodigo_Municipio: TStringField;
    qrycidadeCodigo_Pais: TIntegerField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    qrytratamento_icms: TADOQuery;
    qrytratamento_icmsCodigo: TIntegerField;
    qrytratamento_icmsDescricao: TStringField;
    qrytratamento_icmsData_Cadastro: TDateTimeField;
    qryvendaCodigo_CFOP: TIntegerField;
    qryvendaTotal_Impostos: TFloatField;
    qryitens_vendaValor_ICMS_ST: TFloatField;
    qryvendaData_Emissao_NFe: TDateTimeField;
    qrystatusEncerrado: TIntegerField;
    qrystatusCodigo: TAutoIncField;
    qrychama_produto_teste: TADOQuery;
    ADOStoredProc1: TADOStoredProc;
    qrychama_produtoCodigo: TAutoIncField;
    qrychama_produtoTipo: TIntegerField;
    qrychama_produtoCodigo_Empresa: TIntegerField;
    qrychama_produtoStatus: TStringField;
    qrychama_produtoGera_Comissao: TStringField;
    qrychama_produtoAceita_Devolucao: TStringField;
    qrychama_produtoArred_Trunc: TStringField;
    qrychama_produtoProducao_Propria: TStringField;
    qrychama_produtoCodigo_Original: TStringField;
    qrychama_produtoCodigo_Venda: TStringField;
    qrychama_produtoDescricao: TStringField;
    qrychama_produtoCodigo_Barra: TStringField;
    qrychama_produtoCodigo_Similar: TStringField;
    qrychama_produtoCodigo_Fornecedor: TIntegerField;
    qrychama_produtoCodigo_Fabricante: TIntegerField;
    qrychama_produtoCodigo_Marca: TIntegerField;
    qrychama_produtoCodigo_Unidade_Medida: TIntegerField;
    qrychama_produtoCodigo_Unidade_Volume: TIntegerField;
    qrychama_produtoCodigo_Grupo: TIntegerField;
    qrychama_produtoCodigo_Grupo_Tributacao: TIntegerField;
    qrychama_produtoCodigo_Grupo_Tributacao_IPI: TIntegerField;
    qrychama_produtoCodigo_Grupo_Tributacao_PIS: TIntegerField;
    qrychama_produtoCodigo_Grupo_Tributacao_COFINS: TIntegerField;
    qrychama_produtoCodigo_Grupo_Tributacao_ISSQN: TIntegerField;
    qrychama_produtoCodigo_Local: TIntegerField;
    qrychama_produtoData_Fabricacao: TDateTimeField;
    qrychama_produtoData_Validade: TDateTimeField;
    qrychama_produtoUltima_Compra: TDateTimeField;
    qrychama_produtoUltima_Venda: TDateTimeField;
    qrychama_produtoValor_Compra: TFloatField;
    qrychama_produtoValor_Compra_Unitario: TFloatField;
    qrychama_produtoValor_Ultima_Compra_Unitario: TFloatField;
    qrychama_produtoValor_Medio: TFloatField;
    qrychama_produtoSaldo_Estoque: TFloatField;
    qrychama_produtoValor_Ultima_Compra: TFloatField;
    qrychama_produtoEstoque_Maximo: TFloatField;
    qrychama_produtoEstoque_Minimo: TFloatField;
    qrychama_produtoEstoque: TFloatField;
    qrychama_produtoEstoque_Reservado: TFloatField;
    qrychama_produtoVolume: TFloatField;
    qrychama_produtoVolume_Total: TFloatField;
    qrychama_produtoEm_Estoque_Maximo: TStringField;
    qrychama_produtoEm_Estoque_Minimo: TStringField;
    qrychama_produtoData_Cadastro: TDateTimeField;
    qrychama_produtoData_Atualizacao_Estoque: TDateTimeField;
    qrychama_produtoStatus_Estoque_Data: TStringField;
    qrychama_produtoNCM: TStringField;
    qrychama_produtoAplicacao: TStringField;
    qrychama_produtoNome_Fantasia: TStringField;
    qrychama_produtoFabricante: TStringField;
    qrychama_produtoMarca: TStringField;
    qrychama_produtoSigla: TStringField;
    qrychama_produtoSigla2: TStringField;
    qrychama_produtoGrupo_Produto: TStringField;
    qrychama_produtoCodigo_Sub_Grupo: TIntegerField;
    qrychama_produtoCodigo_Pai: TIntegerField;
    qrychama_produtoPVistaG: TFloatField;
    qrychama_produtoPPrazoG: TFloatField;
    qrychama_produtoPDesVistaG: TFloatField;
    qrychama_produtoPDesPrazoG: TFloatField;
    qrychama_produtoDescricao_TICMS: TStringField;
    qrychama_produtoDescricao_TIPI: TStringField;
    qrychama_produtoLocal: TStringField;
    qrychama_produtoDescricao_TPIS: TStringField;
    qrychama_produtoDescricao_TCO: TStringField;
    qrychama_produtoPreco_Vista: TFloatField;
    qrychama_produtoPreco_Prazo: TFloatField;
    qrychama_produtoPercentual_Desconto_Vista: TFloatField;
    qrychama_produtoPercentual_Desconto_Prazo: TFloatField;
    qrychama_produtoPercentual_Lucro_Vista: TFloatField;
    qrychama_produtoPercentual_Lucro_Prazo: TFloatField;
    qrychama_produtoPercentual_Comissao_Vista: TFloatField;
    qrychama_produtoPercentual_Comissao_Prazo: TFloatField;
    qrychama_produtoAliquota: TStringField;
    qrychama_produtoAliquota_NF: TStringField;
    qrychama_produtoISS: TStringField;
    intgrfld_clienteCodigo_Cidade: TIntegerField;
    qryendereco_clienteCidade: TStringField;
    qryendereco_clienteUF: TStringField;
    qryendereco_clienteCodigo_Municipio: TStringField;
    ds_dados_adicionais: TDataSource;
    qrydados_adicionais: TADOQuery;
    qrydados_adicionaisEmpresa: TStringField;
    qrydados_adicionaisInscricao: TStringField;
    qrydados_adicionaisEndereco: TStringField;
    qrydados_adicionaisNumero: TStringField;
    qrydados_adicionaisCEP: TStringField;
    qrydados_adicionaisUF: TStringField;
    qrydados_adicionaisCidade: TStringField;
    qrydados_adicionaisSetor: TStringField;
    qrydados_adicionaisCodigo_Municipio: TStringField;
    qrydados_adicionaisComplemento: TStringField;
    qrydados_adicionaisCodigo_Cliente: TIntegerField;
    qrymarca: TADOQuery;
    ADOCodigo: TAutoIncField;
    qrymarcaDescricao: TStringField;
    qrymarcaData_Cadastro: TDateTimeField;
    ImageList1: TImageList;
    ACBrPAF1: TACBrPAF;
    qryr05MD5: TStringField;
    ACBrEAD1: TACBrEAD;
    qryr04MD5: TStringField;
    qryr07MD5: TStringField;
    qryR06MD5: TStringField;
    qryfechamento_venda_auxCodigo_Registro: TAutoIncField;
    qryfechamento_venda_auxDescricao: TStringField;
    qryfechamento_venda_auxTransferencia: TIntegerField;
    qryfechamento_venda_auxCodigo_Conta: TIntegerField;
    qryfechamento_venda_auxCodigo_Operacao: TIntegerField;
    qryfechamento_venda_auxCodigo_Lancamento_Banco: TIntegerField;
    qryfechamento_venda_auxSaldo_Anterior: TFloatField;
    qryfechamento_venda_auxSaldo_Atual: TFloatField;
    qryfechamento_venda_auxMD5: TStringField;
    qrychama_produtoTipo_Recolhimento: TStringField;
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    ACBrNFeDANFCeFortes1: TACBrNFeDANFCeFortes;
    ACBrMail1: TACBrMail;
    ACBrTEFD1: TACBrTEFD;
    qrychama_condicaoCNPJ_Operadora: TStringField;
    ACBrNFeDANFeESCPOS1: TACBrNFeDANFeESCPOS;
    ACBrPosPrinter1: TACBrPosPrinter;
    qryfechamento_venda: TADOQuery;
    qryfechamento_vendaCodigo: TIntegerField;
    qryfechamento_vendaForma_Pagamento: TStringField;
    qryfechamento_vendaValor: TFloatField;
    qryfechamento_vendaData: TDateTimeField;
    qryfechamento_vendaTipo_Documento: TStringField;
    qryfechamento_vendaTroco: TFloatField;
    qryfechamento_vendaCodigo_Empresa: TIntegerField;
    qryfechamento_vendaStatus: TStringField;
    qryfechamento_vendaCodigo_Caixa: TIntegerField;
    qryfechamento_vendaAcerto: TIntegerField;
    qryfechamento_vendaCodigo_Usuario: TIntegerField;
    qryfechamento_vendaTipo: TStringField;
    qryfechamento_vendaMovimenta: TIntegerField;
    qryfechamento_vendaN_Documento: TIntegerField;
    qryfechamento_vendaParcela: TIntegerField;
    qryfechamento_vendaCodigo_Registro: TAutoIncField;
    qryfechamento_vendaDescricao: TStringField;
    qryfechamento_vendaTransferencia: TIntegerField;
    qryfechamento_vendaCodigo_Conta: TIntegerField;
    qryfechamento_vendaCodigo_Operacao: TIntegerField;
    qryfechamento_vendaCodigo_Lancamento_Banco: TIntegerField;
    qryfechamento_vendaSaldo_Anterior: TFloatField;
    qryfechamento_vendaSaldo_Atual: TFloatField;
    qryfechamento_vendaMD5: TStringField;
    ds_fechamento_Venda: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure ftpupdateDisconnected(Sender: TObject);
    procedure ftpupdateStatus(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure ftpupdateWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure ftpupdateWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure ACBrECF1MsgPoucoPapel(Sender: TObject);
    procedure ACBrNFe1StatusChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses UGeral, UDeclaracao, UMenu_Geral, UStatus_NFE, pcnConversaoNFe;

{$R *.dfm}

procedure TDM.ACBrECF1MsgPoucoPapel(Sender: TObject);
begin
  //if (ACBrECF1.PoucoPapel) then
  //begin
    //FrmMenu_Geral.StbStatus.Panels[6].Text := 'Status da bobina: Pouco Papel';
  //end
  //else
  //begin
    //FrmMenu_Geral.StbStatus.Panels[6].Text := 'Status da bobina: Normal';
  //end;
end;

procedure TDM.ACBrNFe1StatusChange(Sender: TObject);
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
      frmStatus.lblStatus.Caption := 'Verificando status do servi�o...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeRecepcao :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando dados da NFe/NFCe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeRetRecepcao :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Recebendo dados da NFe/NFCe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeConsulta :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Consultando NFe/NFCe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeCancelamento :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando cancelamento de NFe/NFCe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeInutilizacao :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando pedido de Inutiliza��o...';
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
      frmStatus.lblStatus.Caption := 'Enviando Carta de Corre��o...';
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

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  //ACBrECF1.MsgPoucoPapel:= 1;
  Pega_INI;
  //if (Verifica_Status_Rede(ipservidor)) or (qtde_mac = '1')  then
  //begin
    if Abre_Conexao(ADOConnection1) = false then
    begin
      Erro_Comunicacao_Servidor_2;
      //Application.Terminate;
    end;
  {end
  else
  begin
    Erro_Comunicacao_Servidor;
  end;}

  {if (tipo_local = '0101') then
  begin
    if Abre_Conexao_Local(ADOConnectionLocal) = false then
    begin
      Erro_Comunicacao_Servidor_Local;
      Application.Terminate;
    end;
  end;}

end;

procedure TDM.ftpupdateDisconnected(Sender: TObject);
begin
  //FrmMenu_Geral.Gauge1.AddProgress(100);
  //FrmMenu_Geral.lblstatus.caption:='Download conclu�do!! Desconectado do servidor';
end;

procedure TDM.ftpupdateStatus(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: string);
begin
 {case aStatus of
   hsResolving : FrmMenu_Geral.lblstatus.caption:='Resolvendo..';
   hsConnecting : FrmMenu_Geral.lblstatus.caption:='Conectando..';
   hsConnected : FrmMenu_Geral.lblstatus.caption:='Conectado ao Servidor FTP! Aguarde..';
   hsDisconnecting : FrmMenu_Geral.lblstatus.caption:='Desconectando..';
   hsDisconnected : FrmMenu_Geral.lblstatus.caption:='Desconectado!';
   ftpTransfer : FrmMenu_Geral.lblstatus.caption:='Transferindo..';
   ftpReady : FrmMenu_Geral.lblstatus.caption:='Lendo...';
   ftpAborted : FrmMenu_Geral.lblstatus.caption:='Abortado!';
   else
     FrmMenu_Geral.lblstatus.caption:= AStatusText;
  end;}//fim do case
end;

procedure TDM.ftpupdateWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
  contador, kbTotal, kbTransmitidos,
  kbFaltantes: Integer;
  Status_trans: string;
  TotalTempo: TDateTime;
  H, M, Sec, MS: Word;
  DLTime, media: Double;
begin
  {kbTotal := tamanho_arquivo div 1024;
  TotalTempo :=  Now - STime;
  DecodeTime(TotalTempo, H, M, Sec, MS);
  Sec := Sec + M * 60 + H * 3600;
  DLTime := Sec + MS / 1000;
  KbTransmitidos := AWorkCount div 1024;
  kbFaltantes := kbTotal - kbTransmitidos;
  FrmMenu_Geral.lblcontador.Caption := 'Transferidos: '+ FormatFloat('##,###,##0', kbTransmitidos ) +  ' Kb de ' + FormatFloat('##,###,##0', kbTotal) +' Kb';
  media := (100/tamanho_arquivo) * AWorkCount;
  if DLTime > 0 then
  begin
    tempo_medio := (AWorkCount / 1024) / DLTime;
    Status_trans := Format('%2d:%2d:%2d',
      [Sec div 3600, (Sec div 60) mod 60,
      Sec mod 60]);
    Status_trans := 'Tempo de download ' +
      Status_trans;
  end;
  Status_trans := 'Taxa de Transferencia: '+ FormatFloat('0.00 KB/s', tempo_medio) + '; ' + Status_trans;
  FrmMenu_Geral.lblstatus.Caption := Status_trans;
  Application.ProcessMessages;
  Contador := Trunc(media);
  FrmMenu_Geral.Gauge1.Progress := (contador); }
end;

procedure TDM.ftpupdateWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  Stime := Now;
  tempo_medio := 0;
end;

end.
