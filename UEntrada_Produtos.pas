unit UEntrada_Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls, DateUtils, DBClient, xmldom, XMLIntf, msxmldom, XMLDoc, OleCtrls,
  SHDocVw, Provider, Xmlxform, ACBrNFe, pcnConversao, Modelo.Dominio.Estoque.IFichaEstoqueDominio,
  Vcl.Buttons, Entidade.TItensEntrada, Modelo.Dominio.ComandosSQL,
  Entidade.TImpostosEntrada, Modelo.Entidade.Produto.TProduto,
  Modelo.Entidade.ItensTabelaPreco, Modelo.Dominio.Produto.TProdutoDominio,
  Modelo.Dominio.ItensTabelaPrecoDominio, Modelo.Dominio.EntradaProdutos.ItensEntrada,
  Entidade.TEntradas, Modelo.Entidade.TTransporteNFe,
  Modelo.Dominio.EntradaProdutos.TEntradasDominio,
  Modelo.Dominio.TransporteNFeDominio,
  Modelo.Dominio.EntradaProdutos.TImpostos, ACBrBase, ACBrDFe;

type
  TFrmEntrada_Produtos = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    MEdtData_Emissao: TMaskEdit;
    LblData_Cadastro: TLabel;
    LblMarca: TLabel;
    EdtN_Nota_Fiscal: TEdit;
    LblData_Compra: TLabel;
    MEdtData_Entrada: TMaskEdit;
    Label1: TLabel;
    EdtSerie: TEdit;
    LblNome: TLabel;
    EdtCodigo_Fornecedor: TEdit;
    EdtFornecedor: TEdit;
    Label2: TLabel;
    EdtCodigo_CFOP: TEdit;
    EdtCFOP: TEdit;
    MEdtHora_Emissao: TMaskEdit;
    MEdtHora_Entrada: TMaskEdit;
    Label11: TLabel;
    EdtModelo: TEdit;
    ds_itens_entrada: TDataSource;
    qryentrada: TADOQuery;
    ds_entrada: TDataSource;
    RGTipo_Pagamento: TRadioGroup;
    RGTipo_Frete: TRadioGroup;
    BBtnImprimir_Etiqueta: TToolButton;
    RGTipo_Calculo: TRadioGroup;
    Label22: TLabel;
    EdtPedido: TEdit;
    BBtnCancela_Nota: TToolButton;
    BBtnCopia_Nota: TToolButton;
    ADOQuery1: TADOQuery;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1N_Documento: TIntegerField;
    ADOQuery1Data_Vencimento: TDateTimeField;
    ADOQuery1Data_Pagamento: TDateTimeField;
    ADOQuery1Parcela: TIntegerField;
    ADOQuery1Status: TStringField;
    ADOQuery1Valor: TFloatField;
    DataSource1: TDataSource;
    qryitens_entrada: TADOQuery;
    Image1: TImage;
    BBtnImporta_XML: TToolButton;
    OpenDialog1: TOpenDialog;
    qryitens_entradaCodigo: TIntegerField;
    qryitens_entradaN_Item: TStringField;
    qryitens_entradaN_Nota_Fiscal: TStringField;
    qryitens_entradaCodigo_Produto: TIntegerField;
    qryitens_entradaNCM: TStringField;
    qryitens_entradaUnidade: TStringField;
    qryitens_entradaST: TStringField;
    qryitens_entradaValor_Ultima_Compra: TFloatField;
    qryitens_entradaValor_Unitario: TFloatField;
    qryitens_entradaQuantidade: TFloatField;
    qryitens_entradaQuantidade_Restante: TFloatField;
    qryitens_entradaValor_Total: TFloatField;
    qryitens_entradaValor_Frete_Unitario: TFloatField;
    qryitens_entradaQuantidade_Volume: TFloatField;
    qryitens_entradaBC_ICMS: TFloatField;
    qryitens_entradaAliquota_ICMS: TStringField;
    qryitens_entradaAliquota_IPI: TStringField;
    qryitens_entradaCFOP: TStringField;
    qryitens_entradaValor_ICMS_Unitario: TFloatField;
    qryitens_entradaValor_IPI: TFloatField;
    qryitens_entradaCusto_Unitario: TFloatField;
    qryitens_entradaPercentual_Lucro_Vista: TFloatField;
    qryitens_entradaValor_Vista: TFloatField;
    qryitens_entradaPercentual_Lucro_Prazo: TFloatField;
    qryitens_entradaValor_Prazo: TFloatField;
    qryitens_entradaValor_Vista_Ultimo: TFloatField;
    qryitens_entradaValor_Prazo_Ultimo: TFloatField;
    qryitens_entradaIVA: TFloatField;
    qryitens_entradaBC_ICMS_ST: TFloatField;
    qryitens_entradaValor_ICMS_ST: TFloatField;
    qryitens_entradaChecado: TStringField;
    qryitens_entradaCodigo_Produto_Fornecedor: TStringField;
    qryitens_entradaDescricao_Produto: TStringField;
    qryitens_entradaValor_Ultima_Compra_Unitario: TFloatField;
    qryitens_entradaQtde_Estoque_Atual: TFloatField;

    lbl1: TLabel;
    EdtChave_Acesso: TEdit;
    EditCaixaECF: TEdit;
    Label32: TLabel;
    ACBrNFe1: TACBrNFe;
    qryitens_entradaFicha_Estoque_Codigo: TIntegerField;

    qryitens_entradaCodigo_Registro: TAutoIncField;
    qryitens_entradaEstoque: TFloatField;
    qryitens_entradaData_Validade: TDateTimeField;
    CBAtualiza_Data_Validade: TCheckBox;
    CBAtualiza_NCM: TCheckBox;
    CBAtualiza_Preco: TCheckBox;
    CBAtualiza_Custos: TCheckBox;
    qryimpostos: TADOQuery;
    qryimpostosValor_Total: TFloatField;
    qryimpostosValor_Frete_Unitario: TFloatField;
    qryimpostosBC_ICMS: TFloatField;
    qryimpostosValor_ICMS_Unitario: TFloatField;
    qryimpostosValor_IPI: TFloatField;
    qryimpostosCusto_Unitario: TFloatField;
    qryimpostosBC_ICMS_ST: TFloatField;
    qryimpostosValor_ICMS_ST: TFloatField;
    DataSource2: TDataSource;
    qryimpostosValor_Total_Nota: TFloatField;
    BbtnNovo: TToolButton;
    qryitens_entradaSaldo_Estoque: TFloatField;
    qryitens_entradaVolume: TFloatField;
    qryitens_entradaVolume_Total: TFloatField;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LblProduto: TLabel;
    Label4: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label3: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label26: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    DBGrid1: TDBGrid;
    EdtCodigo_Produto: TEdit;
    EdtProduto: TEdit;
    EdtUnidade: TEdit;
    EdtQuantidade: TEdit;
    EdtValor_Unitario: TEdit;
    EdtValor_Total: TEdit;
    Edit2: TEdit;
    EdtQuantidade_Itens: TEdit;
    EdtTotal_Produtos: TEdit;
    Edit4: TEdit;
    EdtDesconto: TEdit;
    Edit8: TEdit;
    Edit5: TEdit;
    EdtTotal_Nota: TEdit;
    EdtSituacao_Tributaria: TEdit;
    EdtICMS: TEdit;
    EdtIPI: TEdit;
    EdtValor_IPI: TEdit;
    EdtTotal_IPI: TEdit;
    Edit1: TEdit;
    EdtCFOP2: TEdit;
    Edit3: TEdit;
    EdtBase_ICMS: TEdit;
    Edit6: TEdit;
    EdtValor_ICMS: TEdit;
    Edit9: TEdit;
    EdtBase_ICMS_Substituicao: TEdit;
    EdtValor_ICMS_Substituicao: TEdit;
    Edit11: TEdit;
    Edit10: TEdit;
    EdtValor_Frete: TEdit;
    Edit12: TEdit;
    EdtValor_Seguro: TEdit;
    Edit13: TEdit;
    EdtOutras_Despesas: TEdit;
    EdtOutros_ICMS: TEdit;
    Edit15: TEdit;
    EdtIsento_ICMS: TEdit;
    Edit17: TEdit;
    EdtOutros_IPI: TEdit;
    Edit16: TEdit;
    EdtIsento_IPI: TEdit;
    Edit19: TEdit;
    EdtAliquota_ICMS: TEdit;
    Edit18: TEdit;
    EdtNCM: TEdit;
    EdtPercentual_Lucro_Vista: TEdit;
    EdtValor_Vista: TEdit;
    EdtQuantidade_Volume: TEdit;
    EdtPercentual_Lucro_Prazo: TEdit;
    EdtValor_Prazo: TEdit;
    EdtValor_Unitario_Frete: TEdit;
    EdtBC_ICMS: TEdit;
    EdtValor_ICMS_Unitario: TEdit;
    EdtCusto_Unitario: TEdit;
    EdtIVA: TEdit;
    EdtBC_ICMS_ST: TEdit;
    EdtValor_ICMS_ST: TEdit;
    Edit7: TEdit;
    EdtCusto_Total: TEdit;
    MEdtData_Validade: TMaskEdit;
    DBGrid3: TDBGrid;
    BitBtn1: TBitBtn;
    TabSheet5: TTabSheet;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    EdtTransportadora: TEdit;
    EdtCodigo_Transportadora: TEdit;
    EdtVeiculo: TEdit;
    EdtCodigo_Veiculo: TEdit;
    EdtUF_Veiculo: TEdit;
    EdtQuantidade_Transportada: TEdit;
    EdtEspecie: TEdit;
    EdtMarca: TEdit;
    EdtNumero_Transportado: TEdit;
    EdtPeso_Bruto: TEdit;
    EdtPeso_Liquido: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    EdtCondicao_Pagamento: TEdit;
    EdtCodigo_Condicao_Pagamento: TEdit;
    MEdtData_Primeira_Parcela: TMaskEdit;
    CBGera: TCheckBox;
    EdtEtiqueta: TEdit;
    EdtCodigo_Etiqueta: TEdit;
    CBGera_Etiqueta: TCheckBox;
    DBGrid2: TDBGrid;
    TabSheet3: TTabSheet;
    Label10: TLabel;
    MmoObservacao: TMemo;
    CBFecharNota: TCheckBox;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtData_EmissaoEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtCodigo_FornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_CFOPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtValor_TotalEnter(Sender: TObject);
    procedure EdtValor_UnitarioExit(Sender: TObject);
    procedure EdtQuantidadeExit(Sender: TObject);
    procedure EdtValor_UnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtData_EntradaEnter(Sender: TObject);
    procedure MEdtHora_EmissaoEnter(Sender: TObject);
    procedure MEdtHora_EntradaEnter(Sender: TObject);
    procedure EdtValor_IPIEnter(Sender: TObject);
    procedure EdtTotal_NotaEnter(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_FornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtFornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CFOPKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCFOPKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCFOP2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtPercentual_Lucro_VistaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_VistaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_VistaEnter(Sender: TObject);
    procedure EdtPercentual_Lucro_VistaExit(Sender: TObject);
    procedure EdtCodigo_Condicao_PagamentoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Condicao_PagamentoKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtCondicao_PagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure CBGeraClick(Sender: TObject);
    procedure EdtCodigo_TransportadoraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_TransportadoraKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTransportadoraKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_VeiculoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtUF_VeiculoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtVeiculoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_VeiculoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBGera_EtiquetaClick(Sender: TObject);
    procedure EdtCodigo_EtiquetaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_EtiquetaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtEtiquetaKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnImprimir_EtiquetaClick(Sender: TObject);
    procedure EdtCFOP2KeyPress(Sender: TObject; var Key: Char);
    procedure EdtQuantidade_VolumeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtQuantidade_VolumeExit(Sender: TObject);
    procedure EdtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_FreteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPercentual_Lucro_PrazoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_PrazoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPercentual_Lucro_PrazoExit(Sender: TObject);
    procedure EdtValor_PrazoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtValor_PrazoEnter(Sender: TObject);
    procedure EdtValor_Unitario_FreteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_Unitario_FreteEnter(Sender: TObject);
    procedure EdtCodigo_FornecedorExit(Sender: TObject);
    procedure CBPedidoClick(Sender: TObject);
    procedure EdtPedidoExit(Sender: TObject);
    procedure BBtnCancela_NotaClick(Sender: TObject);
    procedure BBtnCopia_NotaClick(Sender: TObject);
    procedure EdtN_Nota_FiscalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtBC_ICMSKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_ICMS_UnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtBC_ICMSEnter(Sender: TObject);
    procedure EdtBC_ICMSExit(Sender: TObject);
    procedure EdtValor_ICMS_UnitarioExit(Sender: TObject);
    procedure EdtValor_IPIExit(Sender: TObject);
    procedure EdtValor_STKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_STEnter(Sender: TObject);
    procedure EdtCusto_UnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCusto_UnitarioEnter(Sender: TObject);
    procedure CBIncluirExit(Sender: TObject);
    procedure EdtPeso_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure ADOQuery1BeforeScroll(DataSet: TDataSet);
    procedure EdtValor_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure EdtIPIKeyPress(Sender: TObject; var Key: Char);
    procedure EdtICMSKeyPress(Sender: TObject; var Key: Char);
    procedure EdtIPIExit(Sender: TObject);
    procedure EdtICMSExit(Sender: TObject);
    procedure CBIncluirMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure EdtIVAKeyPress(Sender: TObject; var Key: Char);
    procedure EdtIVAExit(Sender: TObject);
    procedure EdtCodigo_FornecedorDblClick(Sender: TObject);
    procedure EdtCodigo_CFOPDblClick(Sender: TObject);
    procedure EdtCFOP2DblClick(Sender: TObject);
    procedure EdtCodigo_ProdutoDblClick(Sender: TObject);
    procedure EdtCodigo_Condicao_PagamentoDblClick(Sender: TObject);
    procedure EdtCodigo_EtiquetaDblClick(Sender: TObject);
    procedure EdtCodigo_TransportadoraDblClick(Sender: TObject);
    procedure EdtCodigo_VeiculoDblClick(Sender: TObject);
    procedure EdtBC_ICMS_STExit(Sender: TObject);
    procedure EdtValor_ICMS_STExit(Sender: TObject);
    procedure EdtBC_ICMS_STKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_ICMS_STKeyPress(Sender: TObject; var Key: Char);
    procedure EdtBC_ICMS_STEnter(Sender: TObject);
    procedure EdtCodigo_CFOPExit(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure BBtnImporta_XMLClick(Sender: TObject);
    procedure EdtCusto_TotalEnter(Sender: TObject);
    procedure EdtCusto_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCusto_TotalExit(Sender: TObject);
    procedure EdtModeloExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MEdtData_ValidadeExit(Sender: TObject);
    procedure MEdtData_ValidadeEnter(Sender: TObject);
    procedure qryitens_entradaAfterScroll(DataSet: TDataSet);
    procedure BbtnNovoClick(Sender: TObject);
    procedure MEdtData_EmissaoExit(Sender: TObject);
    procedure MEdtData_EntradaExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EdtQuantidade_TransportadaKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtPeso_BrutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPeso_LiquidoKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtData_Primeira_ParcelaEnter(Sender: TObject);
    procedure EdtQuantidade_ItensKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTotal_ProdutosKeyPress(Sender: TObject; var Key: Char);
    procedure EdtBase_ICMSKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_ICMSKeyPress(Sender: TObject; var Key: Char);
    procedure EdtIsento_ICMSKeyPress(Sender: TObject; var Key: Char);
    procedure EdtOutros_ICMSKeyPress(Sender: TObject; var Key: Char);
    procedure EdtBase_ICMS_SubstituicaoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_ICMS_SubstituicaoKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtAliquota_ICMSKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_SeguroKeyPress(Sender: TObject; var Key: Char);
    procedure EdtOutras_DespesasKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTotal_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure EdtIsento_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure EdtOutros_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTotal_NotaKeyPress(Sender: TObject; var Key: Char);
    procedure qryitens_entradaData_ValidadeGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure EdtValor_ICMS_UnitarioEnter(Sender: TObject);
    procedure EdtValor_ICMS_STEnter(Sender: TObject);
    procedure EdtCusto_UnitarioExit(Sender: TObject);
    procedure EdtValor_PrazoExit(Sender: TObject);
    procedure EdtValor_VistaExit(Sender: TObject);
    procedure EdtTotal_NotaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtN_Nota_FiscalKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtData_Primeira_ParcelaExit(Sender: TObject);
    procedure EdtQuantidade_TransportadaExit(Sender: TObject);
    procedure EdtPeso_BrutoExit(Sender: TObject);
    procedure EdtPeso_LiquidoExit(Sender: TObject);
    procedure EdtTotal_ProdutosExit(Sender: TObject);
    procedure EdtBase_ICMSExit(Sender: TObject);
    procedure EdtQuantidade_ItensExit(Sender: TObject);
    procedure EdtValor_ICMSExit(Sender: TObject);
    procedure EdtBase_ICMS_SubstituicaoExit(Sender: TObject);
    procedure EdtValor_ICMS_SubstituicaoExit(Sender: TObject);
    procedure EdtValor_FreteExit(Sender: TObject);
    procedure EdtValor_SeguroExit(Sender: TObject);
    procedure EdtOutras_DespesasExit(Sender: TObject);
    procedure EdtTotal_IPIExit(Sender: TObject);
    procedure EdtDescontoExit(Sender: TObject);
    procedure EdtTotal_NotaExit(Sender: TObject);
    procedure qryitens_entradaBeforePost(DataSet: TDataSet);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    Entrada: TEntrada_Produtos;
    FFichaEstoqueDominio : IFichaEstoqueDominio;
    Itens_Entrada: URegistro.TItens_Entrada;
    Imposto: URegistro.TImpostos_Entrada;
    Transporte: URegistro.TTransporte_Entrada;
    Util: TUtil;
    qAuxItensNota, qAux2, qImpostos: TADOQuery;
    frete, st, bc_st_acu, valor_icms_st_acu: double;
    iniciado, exclui: boolean;


    FImpostosEntrada: TImpostosEntradaEntidade;
    FProduto: TProdutoEntidade;
    FItensTabelaPreco: TItensTabelaPrecoEntidade;

    FEntradas: TEntradasEntidade;
    FTransporte: TTransporteNFeEntidade;
    FItens_Entrada: TItensEntradaEntidade;

    FComandosSQL: TComandoSQLDominio;
    FProdutoDominio: TProdutoDominio;
    FItensTabelaPrecoDom: TItensTabelaPrecoDominio;
    FItensEntradaDominio: TItensEntradaDominio;

    FEntradasDominio: TEntradasDominio;
    FTransporteDominio : TTransporteNFeDominio;
    FImpostosDominio : TImpostosEntradaDominio;


    codigo_setor, codigo_logradouro, codigo_cidade, codigo_fornecedor, cod_lancamento_financeiro: integer;
    data_val: TDateTime;
    Conexao: TADOConnection;

    procedure Escreve_Texto;
    function Confira_Itens_Entrada: boolean;
    procedure Calcula_Total;
    procedure Calcula_Custo_Total;
    procedure Calcula_Custo_Total_Deletado;
    procedure Calcula_Total_Deletado;
    procedure Gera_Codigo;
    procedure Atualiza_Valores_Item_Cancelado;
    procedure Atualiza_Item_Checado;
    procedure Atualiza_Preco_Venda;
    procedure Atualiza_Preco_Venda_Prazo;
    procedure Atualiza_Preco_Tabela(FItensTabelaPreco: TItensTabelaPrecoEntidade);
    procedure Atualiza_Preco_Tabela_Cancelado;
    procedure Atualiza_Produto_Nota_Cancelada;
    function Soma_Entrada_Produto(Produto: integer): double;
    procedure Gera_Conta_Pagar;
    function Verifica_Produto_Lancado: boolean;
    procedure Pega_Produto_Compra;
    procedure Atualiza_Pedido;
    procedure HabilitaCheck;
    procedure Calcula_Custo;
    procedure Calcula_Custo_Sem_Despesa;
    procedure Calcula_Perc_Despesa;
    procedure Calcula_Perc_Despesa_ST;
    procedure Verifica_Despesas;
    procedure Atualiza_Parcela;
    procedure Atualiza_NCM;
    procedure Calcula_Frete;
    procedure Pega_Produto_Codigo;
    procedure Deleta_Lancamento_Financeiro;
    procedure Atualiza_Novo_Valor_Venda(Produto: integer; Valor: double);
    procedure Pega_Dados_XML_NFe;
    procedure Verifica_Fornecedor_Cadastrado(CNPJ: AnsiString);
    procedure Verifica_Setor(Setor: AnsiString);
    procedure Verifica_Cidade(Cidade, UF: AnsiString; CodMun: integer);
    procedure Verifica_Logradouro(Logradouro: AnsiString);
    procedure Cadastra_Fornecedor(Codigo_Empresa: integer; Tipo: AnsiString; Nome_Fantasia: AnsiString; Razao_Social: AnsiString;
    CPF: AnsiString; RG: AnsiString; Orgao_Expedidor: AnsiString; Data_Emissao: TDate; CNPJ: AnsiString; Insc_Estadual_Municipal: AnsiString;
    Numero: AnsiString; Referencia: AnsiString; Codigo_Setor: integer; Codigo_Cidade: integer; Telefone: AnsiString;
    Celular: AnsiString; Email: AnsiString; Site: AnsiString; Data_Cadastro: TDate; Observacoes, Endereco, CEP: AnsiString );

    procedure Cadastra_Transportadora(Nome_Fantasia: AnsiString; Razao_Social: AnsiString;
    CPF: AnsiString; RG: AnsiString; Orgao_Expedidor: AnsiString; Data_Emissao_RG: TDate; CNPJ: AnsiString; Insc_Estadual_Municipal: AnsiString;
    Numero: AnsiString; Referencia: AnsiString; Codigo_Setor: integer; Codigo_Cidade: integer; Telefone: AnsiString;
    Celular: AnsiString; Email: AnsiString; Site: AnsiString; Data_Cadastro: TDate; Observacoes, Endereco, CEP: AnsiString );

    procedure Verifica_CFOP(CFOP: AnsiString);
    procedure Lanca_Produtos;
    procedure Verifica_Produto_Cadastrado;
    procedure Atualiza_Itens_Cancelado;
    function salvarFichaEstoque():Boolean;
    function removerFichaEstoque:Boolean;
    function removerTodasFichasEstoques:Boolean;
    procedure Atualiza_Data_Validade;
    procedure Atualiza_Custos;
    procedure Pega_Total_Impostos;
    procedure PreencheObjetoItensEntrada;
    procedure PreencheObjetoImpostosEntrada;
    procedure PreencheObjetoEntrada;
    procedure PreencheObjetoTransporte;
    function VerificaItensEmBranco: boolean;
    procedure AtualizaDadosProdutoGeradoDepoisLancamento(FProduto: TProdutoEntidade);
    procedure AtualizaCodigoProdutoFornecedor(Codigo_Fornecedor: AnsiString;
      Fornecedor, Produto: integer);
    procedure Preenche_Cabecalho_NFe;
    procedure Preenche_Rodape_NFe;
    procedure Preenche_Transporte_NFe;
    procedure Verifica_Transportadora_Cadastrado(CNPJCPF: AnsiString);
    procedure PreencheObjetoIE;
  public
    ativo, achei, lanca_item: boolean;
    valor_compra, valor_compra_unitario, qtde_solicitada, qtde_restante, qtde_recebida, qtde_pendente, taxa_juro: double;
    cfop, n_item, prazo, qtde_parcelas: integer;
    uf_destino, tipo_juro, tipo_recolhimento: AnsiString;
    qtde: integer;
    base_acrescida, base_reduzida, valor_vista, valor_prazo: double;
    etiqueta_linha, linha_pagina, EtiquetaSelecionada, tamanho_fonte: integer;

    margem_esquerda, margem_direita, margem_superior, margem_inferior, distancia_horizontal, distancia_vertical,
    altura_etiqueta, largura_etiqueta, altura_pagina, largura_pagina: double;

    procedure Limpa_Menor;
    function Chama_Entrada: boolean;
    procedure Ver_Pedido;
    procedure Verifica_Nota;
    procedure Atualiza_Dados;

  protected
    function Confira: boolean; virtual;
  end;

var
  FrmEntrada_Produtos: TFrmEntrada_Produtos;
implementation

uses UChama_Fornecedor, UChama_CFOP, UDeclaracao, UChama_Produto, UDM,
  UChama_Condicao_Pagamento, UChama_Transportadora, UChama_Veiculo,
  UChama_Etiqueta, URel_Etiqueta_Produto_Entrada, UInforma_NNF,
  URel_Etiqueta_Produto_Entrada_2, UAjuda_Entrada_Produto,
  Modelo.Visao.NFE.TConsultaNFParaReferencia, Util.TLog,
  Modelo.Dominio.Estoque.TFichaEstoqueDominio,
  Modelo.Entidade.Estoque.TFichaEstoque, Util.GeradorDeCodigo,
  Modelo.Entidade.ComandosSQL, Conexao.TPoll, Conexao.TTransacao, Util.Mensagens,
  Conexao.TConexao, Util.Configs, UEscolha_Produtos_Importacao_XML_Entrada;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmEntrada_Produtos.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
  if (ADOQuery1.Eof) then
  begin
    abort;
  end;
end;

procedure TFrmEntrada_Produtos.ADOQuery1BeforeScroll(DataSet: TDataSet);
begin
  ADOQuery1.Edit;
  ADOQuery1.Post;
end;

procedure TFrmEntrada_Produtos.Atualiza_Dados;
var
  FComandoSQL: TComandoSQLEntidade;
  FComandoSQLDominio: TComandoSQLDominio;
begin
  Tlog.Info('--- MÉTODO Atualiza_Dados EM TFrmEntrada_Produtos ---');
  try
    FComandoSQL:= TComandoSQLEntidade.Create;
    FComandoSQL.Conexao:= Conexao;
    FComandoSQL.ComandoSQL:= 'select IE.*, P.Estoque, P.Saldo_Estoque, P.Volume, P.Volume_Total from Itens_Entrada IE '+
                             'left join Produto P on (IE.Codigo_Produto = P.Codigo) '+
                             'where IE.Codigo = :Codigo';
    FComandoSQL.Parametros.Add('Codigo');
    FComandoSQL.Valores.Add(EdtCodigo.Text);
    FComandoSQLDominio:= TComandoSQLDominio.Create(FComandoSQL);
    FComandoSQLDominio.ExecutaComandoSQLRetornaADOQuery(qryitens_entrada);
    qryitens_entrada.Open;

    {with qryitens_entrada, sql do
    begin
      close;
      clear;
      Connection:= Conexao;
      //add('select IE.*, P.Estoque from Itens_Entrada IE');
      //add('left join Produto P on (IE.Codigo_Produto = P.Codigo)');
      //add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
      //add('where IE.Codigo = :Codigo');
      //Parameters.ParamByName('Codigo').Value:= EdtCodigo.Text;
      qryitens_entrada:= FComandoSQLDominio.ExecutaComandoSQLRetornaADOQuery;
      open;
      Last;
    end;}

    {qryitens_entrada.Close;
    qryitens_entrada.Connection:= Conexao;
    qryitens_entrada:= FComandoSQLDominio.ExecutaComandoSQLRetornaADOQuery;
    qryitens_entrada.Open; }

  {
    with qryitens_entrada, sql do
    begin
      close;
      clear;
      add('select IE.*, P.Estoque from Itens_Entrada IE');
      add('left join Produto P on (IE.Codigo_Produto = P.Codigo)');
      //add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
      add('where IE.Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= EdtCodigo.Text;
      open;
      Last;
    end;
    }
  except
    on E : Exception do
    begin
      TLog.Error(Self.ClassName+' - Atualiza_Dados - '+E.Message);
      TMensagens.MensagemErro('Método Atualiza_Dados: '+E.Message);
    end;
  end;
  Tlog.Info('--- FIM MÉTODO Atualiza_Dados EM TFrmEntrada_Produtos ---');
end;

procedure TFrmEntrada_Produtos.Atualiza_Valores_Item_Cancelado;
var
  vaux: double;
  FComandoSQL: TComandoSQLEntidade;
  FComandoSQLDominio: TComandoSQLDominio;
begin
  Tlog.Info('--- MÉTODO Atualiza_Valores_Item_Cancelado EM TFrmEntrada_Produtos ---');
  //qAux2:= TADOQuery.Create(self);
  try
    try
      {if (exclui = false) then begin
        with qAux2, sql do begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('update Produto set Valor_Compra = :Valor_Compra, Valor_Compra_Unitario = :Valor_Compra_Unitario, Valor_Ultima_Compra = :Valor_Ultima_Compra,');
          add('Valor_Ultima_Compra_Unitario = :Valor_Ultima_Compra_Unitario, Ultima_Compra = :Ultima_Compra');
          add('where Codigo = :Codigo');

          Parameters.ParamByName('Valor_Compra').Value:= qryitens_entradaCusto_Unitario.AsFloat;
          Parameters.ParamByName('Valor_Compra_Unitario').Value:= qryitens_entradaValor_Unitario.AsFloat;
          Parameters.ParamByName('Valor_Ultima_Compra').Value:= qryitens_entradaValor_Ultima_Compra.AsFloat;
          Parameters.ParamByName('Valor_Ultima_Compra_Unitario').Value:= qryitens_entradaValor_Ultima_Compra_Unitario.AsFloat;
          Parameters.ParamByName('Ultima_Compra').Value:= StrToDateTime(MEdtData_Entrada.Text);
          Parameters.ParamByName('Codigo').Value:= qryitens_entradaCodigo_Produto.AsInteger;
          ExecSQL;
        end;
      end else begin}

      FComandoSQL:= TComandoSQLEntidade.Create;
      FComandoSQL.Conexao:= Conexao;
      FComandoSQL.ComandoSQL:= 'update Produto set Valor_Compra = :Valor_Compra, Valor_Compra_Unitario = :Valor_Compra_Unitario, Valor_Ultima_Compra = :Valor_Ultima_Compra,'+
          'Valor_Ultima_Compra_Unitario = :Valor_Ultima_Compra_Unitario, Ultima_Compra = :Ultima_Compra '+
          'where Codigo = :Codigo';
      FComandoSQL.Parametros.Add('Valor_Compra');
      FComandoSQL.Parametros.Add('Valor_Compra_Unitario');
      FComandoSQL.Parametros.Add('Valor_Ultima_Compra');
      FComandoSQL.Parametros.Add('Valor_Ultima_Compra_Unitario');
      FComandoSQL.Parametros.Add('Ultima_Compra');
      FComandoSQL.Parametros.Add('Codigo');
      FComandoSQL.Valores.Add(qryitens_entradaValor_Ultima_Compra.AsFloat);
      FComandoSQL.Valores.Add(qryitens_entradaValor_Ultima_Compra_Unitario.AsFloat);
      FComandoSQL.Valores.Add(0);
      FComandoSQL.Valores.Add(0);
      FComandoSQL.Valores.Add(NULL);
      FComandoSQL.Valores.Add(qryitens_entradaCodigo_Produto.AsInteger);
      FComandoSQLDominio:= TComandoSQLDominio.Create(FComandoSQL);
      FComandoSQLDominio.ExecutaComandoSQLSalvarAlterarExcluir;

        {with qAux2, sql do begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('update Produto set Valor_Compra = :Valor_Compra, Valor_Compra_Unitario = :Valor_Compra_Unitario, Valor_Ultima_Compra = :Valor_Ultima_Compra,');
          add('Valor_Ultima_Compra_Unitario = :Valor_Ultima_Compra_Unitario, Ultima_Compra = :Ultima_Compra');
          add('where Codigo = :Codigo');

          Parameters.ParamByName('Valor_Compra').Value:= qryitens_entradaValor_Ultima_Compra.AsFloat;
          Parameters.ParamByName('Valor_Compra_Unitario').Value:= qryitens_entradaValor_Ultima_Compra_Unitario.AsFloat;
          Parameters.ParamByName('Valor_Ultima_Compra').Value:= 0;
          Parameters.ParamByName('Valor_Ultima_Compra_Unitario').Value:= 0;
          Parameters.ParamByName('Ultima_Compra').Value:= Null;
          Parameters.ParamByName('Codigo').Value:= qryitens_entradaCodigo_Produto.AsInteger;
          ExecSQL;
        end;}
      //end;
    except
      on E : Exception do
      begin
        TLog.Error(Self.ClassName+' - Atualiza_Dados_Produto - '+E.Message);
        TMensagens.MensagemErro('Método Atualiza_Valores_Item_Cancelado: '+E.Message);
      end;
    end;
  finally
    FreeAndNil(qAux2);
  end;
  Tlog.Info('--- FIM MÉTODO Atualiza_Valores_Item_Cancelado EM TFrmEntrada_Produtos ---');
end;

procedure TFrmEntrada_Produtos.Atualiza_Item_Checado;
begin
  Tlog.Info('--- MÉTODO Atualiza_Item_Checado EM TFrmEntrada_Produtos ---');
  try
    FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
    FItensEntradaDominio.AtualizaItemChegadoEntrada(qryitens_entradaCodigo_Produto.AsInteger, StrToInt(EdtCodigo.Text), 'S');

  {qAux := TADOQuery.Create(nil);
    try
      with qAux, sql do begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('update Itens_Entrada set Checado = :Checado');
        add('where Codigo_Produto = :Codigo_Produto and Codigo = :Codigo');
        Parameters.ParamByName('Checado').Value := 'S';
        Parameters.ParamByName('Codigo_Produto').Value := qryitens_entradaCodigo_Produto.AsInteger;
        Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
        ExecSQL;
      end;}
  except
    on E : Exception do
    begin
      TLog.Error(Self.ClassName+' - Atualiza_Item_Checado - '+E.Message);
      TMensagens.MensagemErro('Método Atualiza_Item_Checado: '+E.Message);
    end;
  end;
    Tlog.Info('---FIM MÉTODO Atualiza_Item_Checado EM TFrmEntrada_Produtos ---');
  //finally
    //FreeAndNil(qAux);
  //end;
end;

procedure TFrmEntrada_Produtos.Atualiza_Preco_Tabela(FItensTabelaPreco: TItensTabelaPrecoEntidade);
begin
  Tlog.Info('--- MÉTODO Atualiza_Preco_Tabela EM TFrmEntrada_Produtos ---');
  try
    FItensTabelaPrecoDom:= TItensTabelaPrecoDominio.Create(Conexao);
    FItensTabelaPrecoDom.AtualizaValoresEntrada(FItensTabelaPreco);
  {qAux := TADOQuery.Create(nil);
    try
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('update Itens_Tabela_Preco set Preco_Vista = :Preco_Vista, Percentual_Lucro_Vista = :Percentual_Lucro_Vista,');
        add('Preco_Prazo = :Preco_Prazo, Percentual_Lucro_Prazo = :Percentual_Lucro_Prazo');
        add('where Codigo_Produto = :Codigo_Produto and Codigo = :Codigo');
        Parameters.ParamByName('Preco_Vista').Value := qryitens_entradaValor_Vista.AsFloat;
        Parameters.ParamByName('Preco_Prazo').Value := qryitens_entradaValor_Prazo.AsFloat;
        Parameters.ParamByName('Percentual_Lucro_Vista').Value := qryitens_entradaPercentual_Lucro_Vista.AsFloat;
        Parameters.ParamByName('Percentual_Lucro_Prazo').Value := qryitens_entradaPercentual_Lucro_Prazo.AsFloat;
        Parameters.ParamByName('Codigo_Produto').Value := qryitens_entradaCodigo_Produto.AsInteger;
        Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_padrao;
        ExecSQL;
      end;}
  except
    on E : Exception do
    begin
      TLog.Error(Self.ClassName+' - Atualiza_Preco_Tabela - '+E.Message);
      TMensagens.MensagemErro('Método Atualiza_Preco_Tabela: '+E.Message);
    end;
  end;
    Tlog.Info('---FIM MÉTODO Atualiza_Preco_Tabela EM TFrmEntrada_Produtos ---');
end;

procedure TFrmEntrada_Produtos.Atualiza_Data_Validade;
begin
  Tlog.Info('--- MÉTODO Atualiza_Data_Validade EM TFrmEntrada_Produtos ---');
  try
    FProdutoDominio:= TProdutoDominio.Create(Conexao);
    FProdutoDominio.AtualizaDataValidade(qryitens_entradaCodigo_Produto.AsInteger, qryitens_entradaData_Validade.AsDateTime);
      {with qAux, sql do begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('update Produto set Data_Validade = :Data_Validade');
        add('where Codigo = :Codigo');
        Parameters.ParamByName('Data_Validade').Value := qryitens_entradaData_Validade.AsDateTime;
        Parameters.ParamByName('Codigo').Value := qryitens_entradaCodigo_Produto.AsInteger;
        ExecSQL;
      end;}
  except
    on E : Exception do
    begin
      TLog.Error(Self.ClassName+' - AtualizaDataValidade - '+E.Message);
      TMensagens.MensagemErro('Método Atualiza_Data_Validade: '+E.Message);
    end;
  end;
  Tlog.Info('---FIM MÉTODO Atualiza_Data_Validade EM TFrmEntrada_Produtos ---');
end;

procedure TFrmEntrada_Produtos.Atualiza_Preco_Tabela_Cancelado;
var
  qAux: TADOQuery;
  perc, valor1_vista, valor1_prazo, valor2, calculo_perc: double;
begin
  Tlog.Info('--- MÉTODO Atualiza_Preco_Tabela_Cancelado EM TFrmEntrada_Produtos ---');
  qAux := TADOQuery.Create(nil);
  try
    try
      with qAux, sql do begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('update Itens_Tabela_Preco set Preco_Vista = :Preco_Vista, Preco_Prazo = :Preco_Prazo');
        add('where Codigo_Produto = :Codigo_Produto and Codigo = :Codigo');
        Parameters.ParamByName('Preco_Vista').Value := qryitens_entradaValor_Vista_Ultimo.AsFloat;
        Parameters.ParamByName('Preco_Prazo').Value := qryitens_entradaValor_Prazo_Ultimo.AsFloat;
        Parameters.ParamByName('Codigo_Produto').Value := qryitens_entradaCodigo_Produto.AsInteger;
        Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_padrao;
        ExecSQL;
      end;
    except
      on E : Exception do
        TLog.Error(Self.ClassName+' - Atualiza_Preco_Tabela_Cancelado - '+E.Message);
    end;
  finally
    FreeAndNil(qAux);
  end;
  Tlog.Info('--- FIM MÉTODO Atualiza_Preco_Tabela_Cancelado EM TFrmEntrada_Produtos ---');
end;

procedure TFrmEntrada_Produtos.Atualiza_NCM;
begin
  Tlog.Info('--- MÉTODO Atualiza_NCM EM TFrmEntrada_Produtos ---');
  try
    FProdutoDominio:= TProdutoDominio.Create(Conexao);
    FProdutoDominio.AtualizaNCM(qryitens_entradaCodigo_Produto.AsInteger, qryitens_entradaNCM.AsString);
      {with qAux, sql do begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('update Produto set NCM = :NCM');
        add('where Codigo = :Codigo');
        Parameters.ParamByName('NCM').Value := qryitens_entradaNCM.AsString;
        Parameters.ParamByName('Codigo').Value := qryitens_entradaCodigo_Produto.AsInteger;
        ExecSQL;
      end;}
  except
    on E : Exception do
    begin
      TLog.Error(Self.ClassName+' - Atualiza_NCM - '+E.Message);
      TMensagens.MensagemErro('Método Atualiza_NCM: '+E.Message);
    end;
  end;
  Tlog.Info('--- FIM MÉTODO Atualiza_NCM EM TFrmEntrada_Produtos ---');
end;

procedure TFrmEntrada_Produtos.Atualiza_Custos;
begin
  Tlog.Info('--- MÉTODO Atualiza_Custos EM TFrmEntrada_Produtos ---');
  try
    FProdutoDominio:= TProdutoDominio.Create(Conexao);
    FProdutoDominio.AtualizaCusto(qryitens_entradaValor_Unitario.AsFloat, qryitens_entradaCusto_Unitario.AsFloat, qryitens_entradaCodigo_Produto.AsInteger);
      {with qAux, sql do begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('update Produto set Valor_Compra = :Valor_Compra, Valor_Compra_Unitario = :Valor_Compra_Unitario');
        add('where Codigo = :Codigo');

        Parameters.ParamByName('Valor_Compra').Value:= qryitens_entradaCusto_Unitario.AsFloat;
        Parameters.ParamByName('Valor_Compra_Unitario').Value:= qryitens_entradaValor_Unitario.AsFloat;
        Parameters.ParamByName('Codigo').Value:= qryitens_entradaCodigo_Produto.AsInteger;
        ExecSQL;
      end;}
  except
    on E : Exception do
    begin
      TLog.Error(Self.ClassName+' - Atualiza_Custos - '+E.Message);
      TMensagens.MensagemErro('Método Atualiza_Custos: '+E.Message);
    end;
  end;
  Tlog.Info('--- FIM MÉTODO Atualiza_Custos EM TFrmEntrada_Produtos --- ');
end;

procedure TFrmEntrada_Produtos.Atualiza_Preco_Venda;
var
  vaux, valor1, valor2, valor3, perc, valor_uni, calculo_perc: double;
begin
  Tlog.Info('--- MÉTODO Atualiza_Preco_Venda EM TFrmEntrada_Produtos --- ');
  try
    valor1:= StrToFloat(EdtCusto_Unitario.Text);//(vaux / StrToFloat(EdtQuantidade_Volume.Text));//ADOQuery1Valor_Compra.Value;
    perc:= StrToFloat(EdtPercentual_Lucro_Vista.Text) / 100; //ADOQuery1Percentual_Lucro.Value / 100;

    if (RGTipo_Calculo.ItemIndex = 0) then
    begin
      valor2:= valor1 * perc;
      valor1:= valor1 + valor2;
    end else begin
      calculo_perc:= (100 - StrToFloat(EdtPercentual_Lucro_Vista.Text)) / 100;
      valor1:= valor1 / calculo_perc;
    end;

    valor3:= Calcula_Valor(FloatToStr(valor1));
    TLog.Debug('VARIÁVEL valor3: '+FloatToStr(valor3));
    EdtValor_Vista.Text:= FormatFloat('0.00', valor3);
    EdtValor_Vista.Text:= StringReplace(EdtValor_Vista.Text, ThousandSeparator, '', [rfReplaceAll]);
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - Atualiza_Preco_Venda - '+E.Message);
  end;
  Tlog.Info('--- FIM MÉTODO Atualiza_Preco_Venda EM TFrmEntrada_Produtos --- ');
end;

procedure TFrmEntrada_Produtos.Atualiza_Preco_Venda_Prazo;
var
  vaux, valor1, valor2, valor3, perc, valor_uni, calculo_perc: double;
begin
  Tlog.Info('--- MÉTODO Atualiza_Preco_Venda_Prazo EM TFrmEntrada_Produtos --- ');
  try
    valor1:= StrToFloat(EdtCusto_Unitario.Text);//(vaux / StrToFloat(EdtQuantidade_Transportada.Text));//ADOQuery1Valor_Compra.Value;

    perc:= StrToFloat(EdtPercentual_Lucro_Prazo.Text) / 100; //ADOQuery1Percentual_Lucro.Value / 100;

    if (RGTipo_Calculo.ItemIndex = 0) then
    begin
      valor2:= valor1 * perc;
      valor1:= valor1 + valor2;
    end
    else
    begin
      calculo_perc:= (100 - StrToFloat(EdtPercentual_Lucro_Prazo.Text)) / 100;
      valor1:= valor1 / calculo_perc;
    end;

    valor3:= Calcula_Valor(FloatToStr(valor1));
    TLog.Debug('VARIÁVEL valor3: '+FloatToStr(valor3));

    EdtValor_Prazo.Text:= FormatFloat('0.00', valor3);
    EdtValor_Prazo.Text:= StringReplace(EdtValor_Prazo.Text, ThousandSeparator, '', [rfReplaceAll]);
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - Atualiza_Preco_Venda_Prazo - '+E.Message);
  end;
  Tlog.Info('--- FIM MÉTODO Atualiza_Preco_Venda_Prazo EM TFrmEntrada_Produtos --- ');
end;

procedure TFrmEntrada_Produtos.Atualiza_Itens_Cancelado;
var
  vaux, saldo_atual, total_bruto, estoque_atual, custo, custoUltimaCompra: double;
  saldo: AnsiString;
begin
  try
    TLog.Info('--- MÉTODO Atualiza_Itens_Cancelado ---');
    //exclui:= true;
    //Atualiza_Dados_Produto;
    //Atualiza_Valores_Item_Cancelado;
    //exclui:= false;

    saldo_atual:= qryitens_entradaSaldo_Estoque.AsFloat;
    TLog.Debug('VARIÁVEL saldo_atual'+ FloatToStr(saldo_atual));
    //custo2:= qryitens_entradaCusto_Unitario.AsFloat;
    custoUltimaCompra:= qryitens_entradaValor_Ultima_Compra.AsFloat;
    TLog.Debug('VARIÁVEL custoUltimaCompra'+ FloatToStr(custoUltimaCompra));

    total_bruto:= ((custoUltimaCompra) * (qryitens_entradaQuantidade.AsFloat * qryitens_entradaQuantidade_Volume.AsFloat));
    TLog.Debug('VARIÁVEL total_bruto'+ FloatToStr(total_bruto));
    estoque_atual:= qryitens_entradaEstoque.AsFloat - (qryitens_entradaQuantidade.AsFloat * qryitens_entradaQuantidade_Volume.AsFloat);
    TLog.Debug('VARIÁVEL estoque_atual'+ FloatToStr(estoque_atual));

    if (estoque_atual > 0) then
    begin
      custo:= (saldo_atual - total_bruto) / estoque_atual;
      TLog.Debug('Valor da variável custo: '+FloatToStr(custo));
      custo:= Calcula_Valor(FloatToStr(custo));
      TLog.Debug('Valor da variável custo após método Calcula_Valor: '+FloatToStr(custo));
    end
    else
    begin
      custo:= qryitens_entradaCusto_Unitario.AsFloat;
      TLog.Debug('Valor da variável custo: '+FloatToStr(custo));
    end;

    saldo:= FloatToStr(Calcula_Valor(FloatToStr(custoUltimaCompra * estoque_atual))); //// mudei, aqui está apenas custo (custo medio)
    saldo:= StringReplace(saldo, ThousandSeparator, '', [rfReplaceAll]);
    TLog.Debug('Valor da variável saldo: '+saldo);

    //dados do produto
    FProduto:= TProdutoEntidade.Create;
    FProduto.Codigo:= qryitens_entradaCodigo_Produto.AsInteger;
    FProduto.NCM:= qryitens_entradaNCM.AsString;
    FProduto.DataValidade:= 0;
    FProduto.SaldoEstoque:= StrToFloat(saldo);
    FProduto.Estoque:= estoque_atual;
    FProduto.DataAtualizacaoEstoque:= date;
    TLog.Debug('estoque_atual: '+FloatToStr(estoque_atual));
    if (estoque_atual >= 0) then
    begin
      FProduto.StatusEstoque:= '+';
      TLog.Debug('StatusEstoque = '+'');
    end
    else
    begin
      FProduto.StatusEstoque:= '-';
      TLog.Debug('StatusEstoque = - ');
    end;


    FProduto.VolumeTotal:= estoque_atual * qryitens_entradaVolume.AsFloat;
    FProduto.ValorMedio:= custo;
    FProduto.ValorCompra:= qryitens_entradaValor_Ultima_Compra.AsFloat;
    FProduto.ValorCompraUnitario:= qryitens_entradaValor_Ultima_Compra_Unitario.AsFloat;
    FProduto.ValorUltimaCompra:= 0;
    FProduto.ValorUltimaCompraUnitario:= 0;
    FProduto.Ultima_Compra:= 0;
    AtualizaDadosProdutoGeradoDepoisLancamento(FProduto);

    //dados dos preços na tabela de preço
    FItensTabelaPreco:= TItensTabelaPrecoEntidade.Create;
    FItensTabelaPreco.Codigo:= codigo_tabela_preco_padrao;
    FItensTabelaPreco.CodigoProduto:= qryitens_entradaCodigo_Produto.AsInteger;
    FItensTabelaPreco.PrecoVista:= qryitens_entradaValor_Vista_Ultimo.AsFloat;
    FItensTabelaPreco.PrecoPrazo:= qryitens_entradaValor_Prazo_Ultimo.AsFloat;
    FItensTabelaPreco.PercentualLucroVista:= qryitens_entradaPercentual_Lucro_Vista.AsFloat;
    FItensTabelaPreco.PercentualLucroPrazo:= qryitens_entradaPercentual_Lucro_Prazo.AsFloat;
    Atualiza_Preco_Tabela(FItensTabelaPreco);
    {Atualiza_Saldo_Estoque(qryitens_entradaCodigo_Produto.AsInteger, StrToFloat(saldo));
    Atualiza_Estoque(estoque_atual, qryitens_entradaCodigo_Produto.AsInteger);//qryitens_entradaEstoque.AsFloat + qryitens_entradaQuantidade.AsFloat, qryitens_entradaCodigo_Produto.AsInteger);
    Atualiza_Volume((estoque_atual * qryitens_entradaVolume_Atual.AsFloat), qryitens_entradaCodigo_Produto.AsInteger);//qryitens_entradaEstoque.AsFloat + qryitens_entradaQuantidade.AsFloat) * qryitens_entradaVolume.AsFloat, qryitens_entradaCodigo_Produto.AsInteger);
    Atualiza_Custo_Produto(qryitens_entradaCodigo_Produto.AsInteger, custo);}
    //Atualiza_Preco_Tabela_Cancelado;
  except
    on E : Exception do
    begin
      TLog.Error(Self.ClassName+' - Atualiza_Itens_Cancelado - '+E.Message);
      TMensagens.MensagemErro('Método Atualiza_Itens_Cancelado: '+E.Message);
    end;
  end;
  TLog.Info('---FIM MÉTODO Atualiza_Itens_Cancelado ---');
end;

procedure TFrmEntrada_Produtos.Atualiza_Produto_Nota_Cancelada;
var
  vaux, saldo_atual, total_bruto, estoque_atual, custo, custo2: double;
  saldo: AnsiString;
begin
  try
    TLog.Info('--- MÉTODO Atualiza_Produto_Nota_Cancelada ---');
    //exclui:= true;
    qryitens_entrada.First;
    while not qryitens_entrada.Eof do begin
      Atualiza_Itens_Cancelado;
      qryitens_entrada.Next;
    end;
  except
    on E : Exception do
    begin
      TLog.Error(Self.ClassName+' - Atualiza_Produto_Nota_Cancelada - '+E.Message);
      TMensagens.MensagemErro('Método Atualiza_Produto_Nota_Cancelada: '+E.Message);
    end;
  end;
  TLog.Info('--- FIM MÉTODO Atualiza_Produto_Nota_Cancelada ---');
end;

procedure TFrmEntrada_Produtos.BBtnCancelarClick(Sender: TObject);
begin
  try
  TLog.Info('--- MÉTODO CANCELAR');
    {if (achei = false) then begin
      removerTodasFichasEstoques;
      Itens_Entrada.Excluir_Tudo(Itens_Entrada);
    end;}

    {TTransacao.desfazerTransacao(Conexao);
    TPool.getInstance.liberarConexao(Conexao);}
    Util.Limpa_Campos(FrmEntrada_Produtos);
    Util.Desabilita_Campos(FrmEntrada_Produtos);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    TabSheet1.Enabled:= false;
    TabSheet2.Enabled:= false;
    BBtnImprimir_Etiqueta.Enabled:= false;
    BBtnCancela_Nota.Enabled:= false;
    BBtnCopia_Nota.Enabled:= false;
    BBtnImporta_XML.Enabled:= false;
    qryitens_entrada.Close;
    qryimpostos.Close;
    Escreve_Texto;
    EdtN_Nota_Fiscal.ReadOnly:= false;
    TConexao.CancelaConexao(Conexao);
    iniciado:= false;
  except
    on E : Exception do
    begin
      TLog.Error(Self.ClassName+' - BBtnCancelarClick - '+E.Message);
      TMensagens.MensagemErro('Método BBtnCancelarClick: '+E.Message);
      TConexao.CancelaConexao(Conexao);
    end;
  end;
  TLog.Info('--- FIM MÉTODO CANCELAR');
end;

procedure TFrmEntrada_Produtos.BBtnCancela_NotaClick(Sender: TObject);
begin
//  try
//    if Application.MessageBox('Confirma o cancelamento da nota fiscal selecionada?', 'Cancela Nota', MB_YESNO+MB_ICONQUESTION) = idyes then
//    begin
//      Atualiza_Nota_Cancelada(EdtN_Nota_Fiscal.Text, StrToInt(EdtCodigo.Text));
//
//      Atualiza_Produto_Nota_Cancelada;
//
//      BBtnSalvar.Enabled:= false;
//      BBtnExcluir.Enabled:= false;
//      BBtnCancelar.Enabled:= false;
//      BBtnCancela_Nota.Enabled:= false;
//      BBtnCopia_Nota.Enabled:= false;
//      BBtnImporta_XML.Enabled:= false;
//
//      Util.Desabilita_Campos(FrmEntrada_Produtos);
//      iniciado:= false;
//      Processo_Concluido;
//    end;
//  except
//    on E : Exception do
//      TLog.Error(Self.ClassName+' - BBtnCancela_NotaClick - '+E.Message);
//  end;
end;

procedure TFrmEntrada_Produtos.BBtnCopia_NotaClick(Sender: TObject);
begin
  TLog.Info('--- BOTÃO BBtnCopia_NotaClick ---');
  Application.CreateForm(TFrmInforma_NNF, FrmInforma_NNF);
  TLog.Debug('--- CRIOU FrmInforma_NNF ---');
  FrmInforma_NNF.ShowModal;
  FrmInforma_NNF.Free;
end;

procedure TFrmEntrada_Produtos.BBtnExcluirClick(Sender: TObject);
var
  vaux, saldo_atual, total_bruto, estoque_atual, custo: double;
  saldo: AnsiString;
begin
  if (Confirma_Exclusao) then
  begin
    TLog.Debug('--- MÉTODO EXCLUIR (CLIQUE NO BOTÃO EXCLUIR) ---');
    try
      try
        Atualiza_Produto_Nota_Cancelada;
        FEntradasDominio:= TEntradasDominio.Create(Conexao);
        FEntradasDominio.remover(StrToInt(EdtCodigo.Text));
        //Entrada.Excluir(Entrada);
        FTransporteDominio:= TTransporteNFeDominio.Create(Conexao);
        FTransporteDominio.remover(StrToInt(EdtCodigo.Text));
        //Transporte.Excluir;
        FImpostosDominio:= TImpostosEntradaDominio.Create(Conexao);
        FImpostosDominio.remover(StrToInt(EdtCodigo.Text));
        //Imposto.Excluir(Imposto);
        removerTodasFichasEstoques;
        //Itens_Entrada.Excluir_Tudo(Itens_Entrada);
        Deleta_Lancamento_Financeiro;
        TConexao.ConfirmaConexao(Conexao);
        Cria_Arquivo_Atualiza_Dados('AITPr');
        Cria_Arquivo_Atualiza_Dados('AProd');

        BBtnCopia_Nota.Enabled:= false;
        BBtnImporta_XML.Enabled:= false;
        UDeclaracao.Insere_Historico(usuario, 'EXCLUIU ENTRADA DE PRODUTOS ' + EdtN_Nota_Fiscal.Text + '.', TimeToStr(time), exclusao, date);
        BBtnSalvar.Enabled:= false;
        BBtnExcluir.Enabled:= false;
        BBtnImprimir_Etiqueta.Enabled:= false;
        BBtnCancelar.Enabled:= false;
        BBtnNovo.Enabled:= true;
        BBtnCancela_Nota.Enabled:= false;
        Util.Desabilita_Campos(FrmEntrada_Produtos);
        iniciado:= false;
        exclui:= false;
        TabSheet2.Enabled:= false;
        TabSheet1.Enabled:= false;
        TabSheet3.Enabled:= false;
      except
        on E : Exception do
        begin
          TLog.Error(Self.ClassName+' - BBtnExcluirClick - '+E.Message);
          TMensagens.MensagemErro('Método BBtnExcluirClick: '+E.Message);
          TConexao.CancelaConexao(Conexao);
        end;
      end;
    finally
      TLog.Debug('--- FIM DO MÉTODO EXCLUIR (CLIQUE NO BOTÃO EXCLUIR) ---');
      FreeAndNil(qAux2);
    end;
  end;
end;

procedure TFrmEntrada_Produtos.Atualiza_Novo_Valor_Venda(Produto: integer; Valor: double);
var
  qAux: TADOQuery;
begin
  Tlog.Info('--- MÉTODO Atualiza_Novo_Valor_Venda ---');
  qAux:= TADOQuery.Create(nil);
  try
    try
      with qAux, sql do
      begin
        close;
        Connection:= Conexao;
        clear;
        add('update IP set IP.Valor_Unitario = :V1, IP.Sub_Total = (Qtde * :V2) from Itens_Pedido IP');
        add('left join Pedido P on (IP.Codigo = P.Codigo)');
        add('where IP.Codigo_Produto = :Codigo_Produto and P.Tipo = :Tipo and P.Status = :Status');
        Parameters.ParamByName('V1').Value:= Valor;
        Parameters.ParamByName('V2').Value:= Valor;
        Parameters.ParamByName('Codigo_Produto').Value:= Produto;
        Parameters.ParamByName('Tipo').Value:= 'DAV';
        Parameters.ParamByName('Status').Value:= 'PENDENTE';
        ExecSQL;
      end;
    except
      on E : Exception do
      begin
        TLog.Error(Self.ClassName+' - Atualiza_Novo_Valor_Venda - '+E.Message);
        TMensagens.MensagemErro('Método Atualiza_Novo_Valor_Venda: '+E.Message);
      end;
    end;
  finally
    Tlog.Info('---FIM MÉTODO Atualiza_Novo_Valor_Venda ---');
    FreeAndNil(qAux);
  end;
end;

procedure TFrmEntrada_Produtos.Deleta_Lancamento_Financeiro();
var
  qAux, qAux2: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  qAux2:= TADOQuery.Create(self);
  TLOG.Info('--- MÉTODO Deleta_Lancamento_Financeiro ---');
  try
    try
      with qAux, sql do begin
        close;
        Connection:= Conexao;
        clear;
        add('Select LF.Codigo from Lancamento_Financeiro LF ');
        add('where N_Documento = :N_Documento and Codigo_Cli_For = :Codigo_Cli_For');
        Parameters.ParamByName('N_Documento').Value:= EdtN_Nota_Fiscal.Text;
        Parameters.ParamByName('Codigo_Cli_For').Value:= StrToInt(EdtCodigo_Fornecedor.Text);
        open;
      end;

      if (qAux.IsEmpty = false) then begin
        with qAux2, sql do begin
          close;
          Connection:= Conexao;
          clear;
          add('Delete from Lancamento_Financeiro where Codigo = :Codigo');
          Parameters.ParamByName('Codigo').Value:= qAux.FieldByName('Codigo').AsInteger;
          ExecSQL;
        end;

        with qAux2, sql do begin
          close;
          Connection:= Conexao;
          clear;
          add('Delete from Parcelas_Lancamentos where Codigo = :Codigo');
          Parameters.ParamByName('Codigo').Value:= qAux.FieldByName('Codigo').AsInteger;
          ExecSQL;
        end;
      end;
    except
      on E : Exception do
      begin
        TLog.Error(Self.ClassName+' - Deleta_Lancamento_Financeiro - '+E.Message);
        TMensagens.MensagemErro('Método Deleta_Lancamento_Financeiro: '+E.Message);
      end;
    end;
  finally
    FreeAndNil(qAux);
    FreeAndNil(qAux2);
  end;
  TLOG.Info('---FIM MÉTODO Deleta_Lancamento_Financeiro ---');
end;

procedure TFrmEntrada_Produtos.BBtnFecharClick(Sender: TObject);
begin
  TLog.Info('--- MÉTODO FECHAR JANELA');
  close;
  TLog.Info('---FIM MÉTODO FECHAR JANELA');
end;

procedure TFrmEntrada_Produtos.BBtnImporta_XMLClick(Sender: TObject);
begin
  TLog.Info('--- BOTÃO IMPORTA XML');
  Pega_Dados_XML_NFe;
end;

procedure TFrmEntrada_Produtos.Preenche_Cabecalho_NFe;
begin
  TLog.Info('--- MÉTODO Preenche_Cabecalho_NFe ---');
  TLog.Debug('Vai preencher o cabeçalho da NFe.');
  with ACBrNFe1.NotasFiscais.Items[0].NFe do
  begin
    RGTipo_Pagamento.ItemIndex:= StrToInt(IndpagToStr(Ide.indPag));
    EdtModelo.Text:= IntToStr(Ide.modelo);
    EdtSerie.Text:= IntToStr(Ide.serie);
    EdtN_Nota_Fiscal.Text:= IntToStr(Ide.nNF);
    EdtChave_Acesso.Text:= procNFe.chNFe;
    MEdtData_Emissao.Text:= DateToStr(Ide.dEmi);
    MEdtHora_Emissao.Text:= FormatDateTime('hh:mm', Ide.hSaiEnt);

    if (Transp.modFrete = mfContaEmitente) then
    begin
      RGTipo_Frete.ItemIndex:= 1;
    end
    else if (Transp.modFrete = mfContaDestinatario) then
    begin
      RGTipo_Frete.ItemIndex:= 2;
    end
    else if (Transp.modFrete = mfContaTerceiros) then
    begin
      RGTipo_Frete.ItemIndex:= 0;
    end
    else if (Transp.modFrete = mfSemFrete) then
    begin
      RGTipo_Frete.ItemIndex:= 3;
    end;
    MmoObservacao.Text:= Copy(InfAdic.infCpl, 1, 300);
  end;
  TLog.Debug('Preencheu o cabeçalho da NFe.');
  TLog.Info('--- FIM MÉTODO Preenche_Cabecalho_NFe ---');
end;

procedure TFrmEntrada_Produtos.Preenche_Rodape_NFe;
begin
  TLog.Info('--- MÉTODO Preenche_Rodape_NFe ---');
  TLog.Debug('Vai preencher o rodapé da NFe.');
  with ACBrNFe1.NotasFiscais.Items[0].NFe do
  begin
    Util.FormataFloat(2, EdtTotal_Produtos, Total.ICMSTot.vProd);
    Util.FormataFloat(2, EdtBase_ICMS, Total.ICMSTot.vBC);
    Util.FormataFloat(2, EdtValor_ICMS, Total.ICMSTot.vICMS);
    Util.FormataFloat(2, EdtBase_ICMS_Substituicao, Total.ICMSTot.vBCST);
    Util.FormataFloat(2, EdtValor_ICMS_Substituicao, Total.ICMSTot.vST);
    Util.FormataFloat(2, EdtValor_Frete, Total.ICMSTot.vFrete);
    Util.FormataFloat(2, EdtValor_Seguro, Total.ICMSTot.vSeg);
    Util.FormataFloat(2, EdtOutras_Despesas, Total.ICMSTot.vOutro);
    Util.FormataFloat(2, EdtTotal_IPI, Total.ICMSTot.vIPI);
    Util.FormataFloat(2, EdtDesconto, Total.ICMSTot.vDesc);
    Util.FormataFloat(2, EdtTotal_Nota, Total.ICMSTot.vNF);
  end;
  TLog.Debug('Preencheu o rodapé da NFe.');
  TLog.Info('--- FIM MÉTODO Preenche_Rodape_NFe ---');
end;

procedure TFrmEntrada_Produtos.Preenche_Transporte_NFe;
begin
  TLog.Info('--- MÉTODO Preenche_Transporte_NFe ---');
  TLog.Debug('Quantidade de volumes transportados da NFe: '+IntToStr(ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.Vol.Count));
  if (ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.Vol.Count <> 0) then
  begin
    TLog.Debug('Vai preencher os dados transportados da NFe.');
    with ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.Vol.Items[0] do
    begin
      EdtQuantidade_Transportada.Text:= IntToStr(qVol);
      EdtEspecie.Text:= esp;
      EdtMarca.Text:= marca;
      EdtNumero_Transportado.Text:= nVol;
      EdtPeso_Bruto.Text:= FloatToStr(pesoB);
      EdtPeso_Liquido.Text:= FloatToStr(pesoL);
    end;
    TLog.Debug('Preencheu os dados transportados da NFe.');
  end;
  TLog.Info('--- FIM MÉTODO Preenche_Transporte_NFe ---');
end;

procedure TFrmEntrada_Produtos.Pega_Dados_XML_NFe;
var
  i: integer;
  cnpj, cnpjcpftransportadora: AnsiString;
begin
  try
    TLog.Info('--- MÉTODO Pega_Dados_XML_NFe ---');
    ACBrNFe1.NotasFiscais.Clear;

    if (OpenDialog1.Execute()) then begin
      ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName)
    end;
    TLog.Debug('Quantidade de notas fiscais: '+IntToStr(ACBrNFe1.NotasFiscais.Count));
    if (ACBrNFe1.NotasFiscais.Count > 0) then
    begin
      with ACBrNFe1.NotasFiscais.Items[0].NFe do
      begin
        Preenche_Cabecalho_NFe;
        Preenche_Rodape_NFe;
        Preenche_Transporte_NFe;
        PreencheObjetoImpostosEntrada;

        cnpj:= Emit.CNPJCPF;
        cnpj:= StringReplace(cnpj, '.', '', [rfReplaceAll]);
        cnpj:= StringReplace(cnpj, '-', '', [rfReplaceAll]);
        cnpj:= StringReplace(cnpj, '/', '', [rfReplaceAll]);

        cnpjcpftransportadora:= Transp.Transporta.CNPJCPF;
        cnpjcpftransportadora:= StringReplace(cnpjcpftransportadora, '.', '', [rfReplaceAll]);
        cnpjcpftransportadora:= StringReplace(cnpjcpftransportadora, '-', '', [rfReplaceAll]);
        cnpjcpftransportadora:= StringReplace(cnpjcpftransportadora, '/', '', [rfReplaceAll]);

        Verifica_Fornecedor_Cadastrado(cnpj);
        Verifica_Transportadora_Cadastrado(cnpjcpftransportadora);


        //FrmEscolha_Produtos_Importacao_XML_Entrada:= TFrmEscolha_Produtos_Importacao_XML_Entrada.Create(self, FItens_Entrada, FImpostosEntrada);
        //FrmEscolha_Produtos_Importacao_XML_Entrada.Show;

        Lanca_Produtos;
        Atualiza_Dados;
      end;
    end;
    TLog.Info('--- FIM MÉTODO Pega_Dados_XML_NFe ---');
  except
    on E : Exception do
    begin
      TLog.Error(Self.ClassName+' - Pega_Dados_XML_NFe - '+E.Message);
      TMensagens.MensagemErro('Método Pega_Dados_XML_NFe: '+E.Message);
    end;
  end;
end;

procedure TFrmEntrada_Produtos.Lanca_Produtos;
var
  qAux: TADOQuery;
  i, qtde_itens: integer;
  custo, valor_v, valor_p: double;

  total_produtos, base_icms, valor_icms, base_icms_st, valor_icms_st, custo_total, valor_frete, valor_seguro, outras_despesas,
  total_ipi, desconto, total_nota: double;

begin
  try
    qAux:= TADOQuery.Create(self);
    i:= 0;
    qtde_itens:= 0;

    TLog.Info('--- MÉTODO Lanca_Produtos ---');
    TLog.Debug('Quantidade de produtos da NFe: '+IntToStr(ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Count));
    TLog.Debug('Vai preencher o rodapé da NFe.');
    for i := 0 to ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Count -1 do
    begin
      with ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i],
            ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Prod,
             ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Imposto.IPI,
              ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Imposto.ICMS do
      begin
        Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
        FrmChama_Produto.LblProduto_Entrada.Caption:= Prod.xProd;
        FrmChama_Produto.ShowModal;
        FrmChama_Produto.Free;

        FItens_Entrada:= TItensEntradaEntidade.Create;
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);

        FItens_Entrada.Codigo:= StrToInt(EdtCodigo.Text);
        FItens_Entrada.N_Item:= IntToStr(Prod.nItem);
        FItens_Entrada.N_Nota_Fiscal:= EdtN_Nota_Fiscal.Text;
        FItens_Entrada.Codigo_Produto:= dm.qrychama_produtoCodigo.AsInteger;
        FItens_Entrada.NCM:= Prod.NCM;
        FItens_Entrada.Unidade:= Prod.uCom;
        FItens_Entrada.ST:= CSTICMSToStr(CST);
        FItens_Entrada.Valor_Ultima_Compra:= dm.qrychama_produtoValor_Compra.AsFloat;
        FItens_Entrada.Valor_Unitario:= Prod.vUnCom;
        FItens_Entrada.Quantidade:= Prod.qCom;
        FItens_Entrada.Quantidade_Restante:= 0;
        FItens_Entrada.Valor_Total:= Prod.vProd;

        FItensEntradaDominio.CalculaDespesas(FItens_Entrada, FImpostosEntrada);
        //FItens_Entrada.Valor_Frete_Unitario:= FItens_Entrada.Valor_Frete_Unitario;

        FItens_Entrada.Quantidade_Volume:= 1;
        FItens_Entrada.BC_ICMS:= vBC;
        FItens_Entrada.Aliquota_ICMS:= FloatToStr(pICMS);
        FItens_Entrada.Aliquota_IPI:= FloatToStr(pIPI);
        FItens_Entrada.CFOP:= Prod.CFOP;
        FItens_Entrada.Valor_ICMS_Unitario:= vICMS;
        FItens_Entrada.Valor_IPI:= vIPI;
        FItens_Entrada.BC_ICMS_ST:= vBCST;
        FItens_Entrada.Valor_ICMS_ST:= vICMSST;

        FItensEntradaDominio.CalculaCustoTotal(FItens_Entrada);
        //FItens_Entrada.Custo_Unitario:= FItens_Entrada.Custo_Unitario;

        FItens_Entrada.Percentual_Lucro_Vista:= dm.qrychama_produtoPercentual_Lucro_Vista.AsFloat;
        FItens_Entrada.Valor_Vista:= FItensEntradaDominio.CalculaPrecoVenda(FItens_Entrada.Percentual_Lucro_Vista, FItens_Entrada.Custo_Unitario);

        FItens_Entrada.Percentual_Lucro_Prazo:= dm.qrychama_produtoPercentual_Lucro_Prazo.AsFloat;
        FItens_Entrada.Valor_Prazo:= FItensEntradaDominio.CalculaPrecoVenda(FItens_Entrada.Percentual_Lucro_Prazo, FItens_Entrada.Custo_Unitario);

        FItens_Entrada.Valor_Vista_Ultimo:= dm.qrychama_produtoPreco_Vista.AsFloat;
        FItens_Entrada.Valor_Prazo_Ultimo:= dm.qrychama_produtoPreco_Prazo.AsFloat;
        FItens_Entrada.IVA:= 0;
        FItens_Entrada.Checado:= 'N';
        FItens_Entrada.Codigo_Produto_Fornecedor:= Prod.cProd;
        FItens_Entrada.Descricao_Produto:= Prod.xProd;
        FItens_Entrada.Valor_Ultima_Compra_Unitario:= dm.qrychama_produtoValor_Compra_Unitario.AsFloat;
        FItens_Entrada.Qtde_Estoque_Atual:= dm.qrychama_produtoEstoque.AsFloat;
        FItens_Entrada.Ficha_Estoque_Codigo:= 0;

        FItens_Entrada.Data_Validade:= 0;

        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
        FItensEntradaDominio.GravaItem(FItens_Entrada);

        Inc(qtde_itens);
      end;
    end;

    EdtQuantidade_Itens.Text:= IntToStr(qtde_itens);
    TLog.Info('--- FIM MÉTODO Lanca_Produtos ---');
  except
    on E : Exception do
    begin
      TLog.Error(Self.ClassName+' - Lanca_Produtos - '+E.Message);
      TMensagens.MensagemErro('Método Lanca_Produtos: '+E.Message);
    end;
  end;
end;

procedure TFrmEntrada_Produtos.Verifica_Produto_Cadastrado;
var
  qAux: TADOQuery;
  i: integer;
begin
  qAux:= TADOQuery.Create(self);

  for I := 0 to ACBrNFe1.NotasFiscais.Items[i].NFe.Det.Count-1 do
  begin
    with ACBrNFe1.NotasFiscais.Items[i].NFe.Det.Items[i] do
    begin


      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('');
        open;
      end;
    end;
  end;
end;

procedure TFrmEntrada_Produtos.Verifica_Fornecedor_Cadastrado(CNPJ: AnsiString);
var
  qAuxFornecedor_Cadastrado: TADOQuery;
  telefone: AnsiString;
begin
  try
    TLog.Info('--- MÉTODO Verifica_Fornecedor_Cadastrado ---');
    TLog.Debug('CNPJ do cliente no XML: '+CNPJ);
    qAuxFornecedor_Cadastrado:= TADOQuery.Create(self);
    with qAuxFornecedor_Cadastrado, sql do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('select F.Codigo, F.Nome_Fantasia from Fornecedor F');
      add('where F.CNPJ = :CNPJ');
      Parameters.ParamByName('CNPJ').Value:= CNPJ;
      open;
    end;

    if (qAuxFornecedor_Cadastrado.IsEmpty) then
    begin
      TLog.Debug('Não encontrou CNPJ.');
      Verifica_Setor(ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xBairro);
      Verifica_Cidade(ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xMun, ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.UF, ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.cMun);  //ou descricao ou codigo municipio???
      //Verifica_Logradouro(ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xLgr); //descricao ou cep???

      EdtCodigo_Fornecedor.Text:= IntToStr( TGeradorDeCodigo.GeraCodigoIndetity('Fornecedor', Conexao));
      EdtFornecedor.Text:= ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.xFant;
      uf_destino:= ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.UF;
      telefone:= ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.fone;

      if (Length(telefone)=10) then
        telefone:= '('+ Copy(telefone, 1,2)+')'+Copy(telefone, 3,4)+'-'+Copy(telefone, 7,4)
      else
        telefone:= '('+ Copy(telefone, 1,2)+')'+Copy(telefone, 3,5)+'-'+Copy(telefone, 8,4);

      TLog.Debug('Código do Fornecedor: '+EdtCodigo_Fornecedor.Text);
      TLog.Debug('Fornecedor: '+EdtFornecedor.Text);
      TLog.Debug('UF do Fornecedor: '+uf_destino);
      TLog.Debug('Telefone do Fornecedor: '+telefone);

      Cadastra_Fornecedor(Codigo_Empresa, 'FORNECEDOR', ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.xFant, ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.xNome,
      '', '', '', date, ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.CNPJCPF, ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.IE,
      ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.nro, '', codigo_setor, codigo_cidade, telefone,
      '', '', '', date, '', ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xLgr, IntToStr(ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.CEP));
    end
    else
    begin
      EdtCodigo_Fornecedor.Text:= qAuxFornecedor_Cadastrado.FieldByName('Codigo').AsString;
      EdtFornecedor.Text:= qAuxFornecedor_Cadastrado.FieldByName('Nome_Fantasia').AsString;
      uf_destino:= ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.UF;
      TLog.Debug('Encontrou o CNPJ já cadastrado: '+qAuxFornecedor_Cadastrado.FieldByName('Nome_Fantasia').AsString);
    end;
    TLog.Info('--- FIM MÉTODO Verifica_Fornecedor_Cadastrado ---');
  except on E:Exception do
  begin
    TLog.Error(Self.ClassName+' - Verifica_Fornecedor_Cadastrado - '+E.Message);
    TMensagens.MensagemErro('Método Verifica_Fornecedor_Cadastrado: '+E.Message);
  end;
  end;

end;

procedure TFrmEntrada_Produtos.Verifica_Transportadora_Cadastrado(CNPJCPF: AnsiString);
var
  qAuxTransportadora_Cadastrado: TADOQuery;
  cnpj, cpf, ie: AnsiString;
begin
  try
    if (Length(CNPJCPF) = 14) then
    begin
      cpf:= '';
      cnpj:= CNPJCPF;
      ie:= ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.Transporta.IE;
    end
    else if (Length(CNPJCPF) = 11) then
    begin
      cpf:= CNPJCPF;
      cnpj:= '';
      ie:= '';
    end
    else
    begin
      cpf:= '';
      cnpj:= '';
      ie:= '';
    end;

    qAuxTransportadora_Cadastrado:= TADOQuery.Create(self);
    with qAuxTransportadora_Cadastrado, sql do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('select T.Codigo, T.Nome_Fantasia from Transportadora T');

      if (Length(CNPJCPF) = 14) then
      begin
        add('where T.CNPJ = :CNPJ');
        Parameters.ParamByName('CNPJ').Value:= cnpj;
      end
      else if (Length(CNPJCPF) = 11) then
      begin
        add('where T.CPF = :CNPJ');
        Parameters.ParamByName('CNPJ').Value:= cpf;
      end;

      open;
    end;

    if (qAuxTransportadora_Cadastrado.IsEmpty) and ( (cnpj <> '') or (cpf <> '') ) then
    begin
      Verifica_Cidade(ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.Transporta.xMun, ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.Transporta.UF, 0);

      EdtCodigo_Transportadora.Text:= IntToStr( TGeradorDeCodigo.GeraCodigoIndetity('Transportadora', Conexao));
      EdtTransportadora.Text:= ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.Transporta.xNome;

      with ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.Transporta do
      begin
        Cadastra_Transportadora(Copy(xNome, 1, 50), Copy(xNome, 1, 50), cpf, '', '', 0, cnpj, ie, '', '', 0, codigo_cidade, '',
        '', '', '', date, '', Copy(xEnder, 1, 200), '');
      end;
    end
    else
    begin
      EdtCodigo_Transportadora.Text:= qAuxTransportadora_Cadastrado.FieldByName('Codigo').AsString;
      EdtTransportadora.Text:= qAuxTransportadora_Cadastrado.FieldByName('Nome_Fantasia').AsString;
    end;
  except on E:Exception do
  begin
    TLog.Error(Self.ClassName+' - Verifica_Fornecedor_Cadastrado - '+E.Message);
    TMensagens.MensagemErro('Método Verifica_Fornecedor_Cadastrado: '+E.Message);
  end;
  end;

end;

procedure TFrmEntrada_Produtos.Cadastra_Fornecedor(Codigo_Empresa: integer;
  Tipo, Nome_Fantasia, Razao_Social, CPF, RG, Orgao_Expedidor: AnsiString;
  Data_Emissao: TDate; CNPJ, Insc_Estadual_Municipal: AnsiString;
  Numero, Referencia: AnsiString; Codigo_Setor,
  Codigo_Cidade: integer; Telefone, Celular, Email, Site: AnsiString;
  Data_Cadastro: TDate; Observacoes, Endereco, CEP: AnsiString);
var
  qCadastro: TADOQuery;
begin
  qCadastro:= TADOQuery.Create(self);
  try
    try
      with qCadastro, sql do
      begin
        close;
        Connection:= Conexao;
        clear;
        add('Insert into Fornecedor (Codigo_Empresa, Tipo, Nome_Fantasia, Razao_Social, CPF, RG, Orgao_Expedidor, ');
        add('Data_Emissao_RG, CNPJ, Insc_Estadual_Municipal, ');
        add('Numero, Referencia, Codigo_Setor, Codigo_Cidade, Telefone, Celular, ');
        add('Email, Site, Data_Cadastro, Observacoes, Endereco, CEP) values(:Codigo_Empresa, :Tipo, ');
        add(':Nome_Fantasia, :Razao_Social, :CPF, :RG, :Orgao_Expedidor, :Data_Emissao,');
        add(':CNPJ, :Inscricao, :Numero, :Referencia, ');
        add(':Setor, :Cidade, :Telefone, :Celular, :Email, :Site, :Data_Cad, :Obs, :Endereco, :CEP)');
        Parameters.ParamByName('Codigo_Empresa').Value := Codigo_Empresa;
        Parameters.ParamByName('Tipo').Value := Tipo;
        Parameters.ParamByName('Nome_Fantasia').Value := Copy(Nome_Fantasia, 1,50);
        Parameters.ParamByName('Razao_Social').Value := Copy(Razao_Social, 1,50);
        Parameters.ParamByName('CPF').Value := CPF;
        Parameters.ParamByName('RG').Value := RG;
        Parameters.ParamByName('Orgao_Expedidor').Value := Orgao_Expedidor;
        Parameters.ParamByName('Data_Emissao').Value := Data_Emissao;
        Parameters.ParamByName('CNPJ').Value := CNPJ;
        Parameters.ParamByName('Inscricao').Value := Insc_Estadual_Municipal;
        Parameters.ParamByName('Numero').Value := Copy(Numero, 1, 5);
        Parameters.ParamByName('Referencia').Value := Referencia;
        Parameters.ParamByName('Setor').Value := Codigo_Setor;
        Parameters.ParamByName('Cidade').Value := Codigo_Cidade;
        Parameters.ParamByName('Telefone').Value := Telefone;
        Parameters.ParamByName('Celular').Value := Celular;
        Parameters.ParamByName('Email').Value := Email;
        Parameters.ParamByName('Site').Value := Site;
        Parameters.ParamByName('Data_Cad').Value := Data_Cadastro;
        Parameters.ParamByName('Obs').Value := Observacoes;
        Parameters.ParamByName('Endereco').Value := Copy(Endereco, 1, 200);
        Parameters.ParamByName('CEP').Value := Copy(Endereco, 1, 10);
        ExecSQL;
      end;
      //codigo_fornecedor:= Gera_Codigo_Cadastro('Fornecedor');
    except on E:Exception do
    begin
      TMensagens.MensagemErro('Método Cadastra_Fornecedor: '+E.Message);
      TLog.Error(Self.ClassName+' - Cadastra_Fornecedor - '+E.Message);
    end;
    end;
  finally
    FreeAndNil(qCadastro);
  end;
end;

procedure TFrmEntrada_Produtos.Cadastra_Transportadora(Nome_Fantasia, Razao_Social, CPF, RG, Orgao_Expedidor: AnsiString;
  Data_Emissao_RG: TDate; CNPJ, Insc_Estadual_Municipal, Numero,
  Referencia: AnsiString; Codigo_Setor, Codigo_Cidade: integer; Telefone,
  Celular, Email, Site: AnsiString; Data_Cadastro: TDate; Observacoes, Endereco,
  CEP: AnsiString);
var
  qCadastro: TADOQuery;
begin
  qCadastro:= TADOQuery.Create(self);
  try
    try
      with qCadastro, sql do
      begin
        close;
        Connection:= Conexao;
        clear;
        add('Insert into Transportadora (Nome_Fantasia, Razao_Social, CPF, RG, Orgao_Expedidor, ');
        add('Data_Emissao_RG, CNPJ, Insc_Estadual_Municipal, ');
        add('Numero, Referencia, Codigo_Setor, Codigo_Cidade, Telefone, Celular, ');
        add('Email, Site, Data_Cadastro, Observacoes, Endereco, CEP) values( ');
        add(':Nome_Fantasia, :Razao_Social, :CPF, :RG, :Orgao_Expedidor, :Data_Emissao_RG,');
        add(':CNPJ, :Inscricao, :Numero, :Referencia, ');
        add(':Setor, :Cidade, :Telefone, :Celular, :Email, :Site, :Data_Cad, :Obs, :Endereco, :CEP)');
        Parameters.ParamByName('Nome_Fantasia').Value := Nome_Fantasia;
        Parameters.ParamByName('Razao_Social').Value := Razao_Social;
        Parameters.ParamByName('CPF').Value := CPF;
        Parameters.ParamByName('RG').Value := RG;
        Parameters.ParamByName('Orgao_Expedidor').Value := Orgao_Expedidor;
        Parameters.ParamByName('Data_Emissao_RG').Value := Data_Emissao_RG;
        Parameters.ParamByName('CNPJ').Value := CNPJ;
        Parameters.ParamByName('Inscricao').Value := Insc_Estadual_Municipal;
        Parameters.ParamByName('Numero').Value := Copy(Numero, 1, 5);
        Parameters.ParamByName('Referencia').Value := Referencia;
        Parameters.ParamByName('Setor').Value := Codigo_Setor;
        Parameters.ParamByName('Cidade').Value := Codigo_Cidade;
        Parameters.ParamByName('Telefone').Value := Telefone;
        Parameters.ParamByName('Celular').Value := Celular;
        Parameters.ParamByName('Email').Value := Email;
        Parameters.ParamByName('Site').Value := Site;
        Parameters.ParamByName('Data_Cad').Value := Data_Cadastro;
        Parameters.ParamByName('Obs').Value := Observacoes;
        Parameters.ParamByName('Endereco').Value := Endereco;
        Parameters.ParamByName('CEP').Value := CEP;
        ExecSQL;
      end;
      //codigo_fornecedor:= Gera_Codigo_Cadastro('Fornecedor');
    except on E:Exception do
    begin
      TMensagens.MensagemErro('Método Cadastra_Transportadora: '+E.Message);
      TLog.Error(Self.ClassName+' - Cadastra_Transportadora - '+E.Message);
    end;
    end;
  finally
    FreeAndNil(qCadastro);
  end;
end;

procedure TFrmEntrada_Produtos.Verifica_Logradouro(Logradouro: AnsiString);
var
  qAux, qCadastro: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  with qAux, sql do
  begin
    close;
    Connection:= Conexao;
    clear;
    add('select L.Codigo, L.Descricao from Logradouro L');
    add('where L.Descricao = :Logradouro');
    Parameters.ParamByName('Logradouro').Value:= Logradouro;
    open;
  end;

  if (qAux.IsEmpty) then
  begin
    qCadastro:= TADOQuery.Create(self);
    with qCadastro, sql do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('insert into Logradouro (Descricao, Tipo_Logradouro, CEP, Data_Cadastro)');
      add('values (:Descricao, :Tipo_Logradouro, :CEP, :Data_Cadastro)');
      Parameters.ParamByName('Descricao').Value := Logradouro;
      Parameters.ParamByName('Tipo_Logradouro').Value := '';
      Parameters.ParamByName('CEP').Value := IntToStr(ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.CEP);
      Parameters.ParamByName('Data_Cadastro').Value := date;
      ExecSQL;
    end;
    codigo_logradouro:= Gera_Codigo_Cadastro('Logradouro');
    Cria_Arquivo_Atualiza_Dados('ILog');
  end
  else
  begin
    codigo_logradouro:= qAux.FieldByName('Codigo').AsInteger;
  end;
end;

procedure TFrmEntrada_Produtos.Verifica_Setor(Setor: AnsiString);
var
  qAux, qCadastro: TADOQuery;
begin
  TLog.Info('--- MÉTODO Verifica_Setor ---');
  TLog.Debug('Setor à verificar: '+Setor);
  qAux:= TADOQuery.Create(self);
  with qAux, sql do
  begin
    close;
    Connection:= Conexao;
    clear;
    add('select S.Codigo, S.Descricao from Setor S');
    add('where S.Descricao = :Setor');
    Parameters.ParamByName('Setor').Value:= Setor;
    open;
  end;

  if (qAux.IsEmpty) then
  begin
    TLog.Debug('Não encontrou setor.');
    qCadastro:= TADOQuery.Create(self);
    codigo_setor:= TGeradorDeCodigo.GeraCodigoIndetity('Setor', Conexao);
    TLog.Debug('Código do setor: '+IntToStr(codigo_setor));
    with qCadastro, sql do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('insert into Setor (Descricao, Data_Cadastro)');
      add('values (:Descricao, :Data_Cadastro)');
      Parameters.ParamByName('Descricao').Value := Copy(Setor, 1, 40);
      Parameters.ParamByName('Data_Cadastro').Value := date;
      ExecSQL;
    end;
    Cria_Arquivo_Atualiza_Dados('ISet');
    TLog.Debug('Gravou setor.');
  end
  else
  begin
    codigo_setor:= qAux.FieldByName('Codigo').AsInteger;
    TLog.Debug('Encontrou setor: '+IntToStr(codigo_setor));
  end;

  TLog.Info('--- FIM MÉTODO Verifica_Setor ---');
end;

procedure TFrmEntrada_Produtos.Verifica_Cidade(Cidade, UF: AnsiString; CodMun: integer);
var
  qAux, qCadastro: TADOQuery;
begin
  TLog.Info('--- MÉTODO Verifica_Cidade ---');
  TLog.Debug('Cidade à verificar: '+Cidade);
  qAux:= TADOQuery.Create(self);
  with qAux, sql do
  begin
    close;
    Connection:= Conexao;
    clear;
    add('select C.Codigo from Cidade C');
    add('where C.Descricao = :Cidade');
    Parameters.ParamByName('Cidade').Value:= Cidade;
    open;
  end;

  if (qAux.IsEmpty) then
  begin
    TLog.Debug('Não encontrou cidade.');
    qCadastro:= TADOQuery.Create(self);
    codigo_cidade:= TGeradorDeCodigo.GeraCodigoIndetity('Cidade', Conexao);
    TLog.Debug('Código da cidade: '+IntToStr(codigo_cidade));
    with qCadastro, sql do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('insert into Cidade (Descricao, UF, DDD, Data_Cadastro, Codigo_Municipio, Codigo_Pais)');
      add('values (:Descricao, :UF, :DDD, :Data_Cadastro, :Codigo_Municipio, :Codigo_Pais)');
      Parameters.ParamByName('Descricao').Value := Copy(Cidade, 1, 30);
      Parameters.ParamByName('UF').Value := UF;
      Parameters.ParamByName('DDD').Value := '';
      Parameters.ParamByName('Data_Cadastro').Value := date;
      Parameters.ParamByName('Codigo_Municipio').Value := CodMun;
      Parameters.ParamByName('Codigo_Pais').Value := 1;
      ExecSQL;
    end;
    Cria_Arquivo_Atualiza_Dados('ICid');
    TLog.Debug('Gravou cidade.');
  end
  else
  begin
    codigo_cidade:= qAux.FieldByName('Codigo').AsInteger;
    TLog.Debug('Encontrou cidade: '+IntToStr(codigo_cidade));
  end;
  TLog.Info('--- FIM MÉTODO Verifica_Cidade ---');
end;

procedure TFrmEntrada_Produtos.Verifica_CFOP(CFOP: AnsiString);
var
  qAux, qCadastro: TADOQuery;
begin
  TLog.Info('--- MÉTODO Verifica_CFOP ---');
  TLog.Debug('CFOP à verificar: '+CFOP);
  qAux:= TADOQuery.Create(self);
  with qAux, sql do
  begin
    close;
    Connection:= Conexao;
    clear;
    add('select Codigo, CFOP, Descricao from Cadastro_CFOP');
    add('where CFOP = :CFOP');
    Parameters.ParamByName('CFOP').Value:= CFOP;
    open;
  end;

  if (qAux.IsEmpty) then
  begin
    TLog.Debug('Não encontrou CFOP.');
    qCadastro:= TADOQuery.Create(self);
    EdtCodigo_CFOP.Text:= IntToStr(Gera_Codigo_Cadastro('Cadastro_CFOP'));
    EdtCFOP.Text:= CFOP;
    TLog.Debug('Código do CFOP: '+EdtCodigo_CFOP.Text);
    with qCadastro, sql do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('Insert into Cadastro_CFOP (CFOP, Descricao, Data_Cadastro)');
      add('values (:CFOP, :Descricao, :Data_Cadastro)');
      Parameters.ParamByName('CFOP').Value := CFOP;
      Parameters.ParamByName('Descricao').Value := CFOP;
      Parameters.ParamByName('Data_Cadastro').Value := date;
      ExecSQL;
    end;
    TLog.Debug('Gravou CFOP.');
  end
  else
  begin
    EdtCodigo_CFOP.Text:= qAux.FieldByName('Codigo').AsString;
    EdtCFOP.Text:= qAux.FieldByName('CFOP').AsString;
    TLog.Debug('Encontrou CFOP: '+EdtCFOP.Text);
  end;

  TLog.Info('--- FIM MÉTODO Verifica_CFOP ---');
end;

procedure TFrmEntrada_Produtos.BBtnImprimir_EtiquetaClick(Sender: TObject);
begin
  TLog.Info('--- MÉTODO BOTÃO Imprimir_Etiqueta ');
  FrmRel_Etiqueta_Produto_Entrada_2:= TFrmRel_Etiqueta_Produto_Entrada_2.Create(self);
  TLog.Debug('--- CRIOU OBJETO FrmRel_Etiqueta_Produto_Entrada_2');
  FrmRel_Etiqueta_Produto_Entrada_2.Release;
  FrmRel_Etiqueta_Produto_Entrada_2:= Nil;
end;

procedure TFrmEntrada_Produtos.BbtnNovoClick(Sender: TObject);
begin
  TLog.Info('--- MÉTODO NOVO --- ');
  if (iniciado = false) then
  begin
    {Conexao:= TADOConnection.Create(self);
    Conexao:= TPool.getInstance.getConnection;
    TTransacao.Create(Conexao);
    TTransacao.iniciarTransacao(Conexao);
    SetUncommitted(Conexao);}
    Conexao:= TConexao.NovaConexao(Conexao);
    //ShowMessage(qryitens_entrada.Connection.Name);
    TConexao.IniciaQuerys([qryitens_entrada, ADOQuery1, qryentrada, qryimpostos], Conexao);
    //ShowMessage(qryitens_entrada.Connection.Name);

    TabSheet2.Enabled:= True;
    TabSheet1.Enabled:= true;
    TabSheet3.Enabled:= true;
    FItens_Entrada:= TItensEntradaEntidade.Create;
    PageControl2.TabIndex:= 0;
    Util.Habilita_Campos(FrmEntrada_Produtos);
    Util.Limpa_Campos(FrmEntrada_Produtos);
    BBtnSalvar.Enabled:= true;
    BBtnExcluir.Enabled:= false;
    BBtnCancelar.Enabled:= true;
    BBtnNovo.Enabled:= False;
    BBtnImprimir_Etiqueta.Enabled:= false;
    BBtnCopia_Nota.Enabled:= true;
    BBtnCancela_Nota.Enabled:= false;
    BBtnImporta_XML.Enabled:= true;
    EdtN_Nota_Fiscal.ReadOnly:= false;
    Label22.Visible:= false;
    EdtPedido.Visible:= false;
    qryitens_entrada.Close;
    achei:= false;
    Escreve_Texto;
    Gera_Codigo;
    qtde:= 0;
    EdtQuantidade_Transportada.Text:= '0';
    n_item:= 0;
    qtde_pendente:= 0;
    cod_lancamento_financeiro:= 0;
    bc_st_acu:= 0;
    valor_icms_st_acu:= 0;

    CBAtualiza_Data_Validade.Checked:= false;
    CBAtualiza_NCM.Checked:= false;
    CBAtualiza_Preco.Checked:= false;
    CBAtualiza_Custos.Checked:= false;

    MEdtData_Emissao.Text:= DateToStr(date);
    MEdtData_Primeira_Parcela.Text:= DateToStr(date);
    MEdtHora_Emissao.Text:= FormatDateTime('hh:mm', Time);
    MEdtData_Entrada.Text:= DateToStr(date);
    MEdtHora_Entrada.Text:= FormatDateTime('hh:mm', Time);

    RGTipo_Calculo.ItemIndex:= 0;
    RGTipo_Pagamento.ItemIndex:= 0;
    RGTipo_Frete.ItemIndex:= 0;
    Limpa_Menor;
    iniciado:= true;
    exclui:= false;
    HabilitaCheck;
    CBFecharNota.Checked:= false;
    CBGera_Etiqueta.Checked:= false;
    EdtN_Nota_Fiscal.SetFocus;
    DBGrid2.Visible:= false;
    ADOQuery1.Close;
  end;
  TLog.Info('--- FIM DO MÉTODO NOVO --- ');
end;

procedure TFrmEntrada_Produtos.Atualiza_Parcela;
begin
  TLog.Info('--- MÉTODO Atualiza_Parcela --- ');
  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select PL.* from Parcelas_Lancamentos PL');
    add('where Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= cod_lancamento_financeiro;
    open;
  end;
end;

procedure TFrmEntrada_Produtos.Atualiza_Pedido;
var
  qAux5, qAux6: TADOQuery;
begin
  {qryitens_entrada.First;
  try
    qAux5:= TADOQuery.Create(self);
    qAux6:= TADOQuery.Create(self);
    try
    while not qryitens_entrada.Eof do
    begin
      with qAux5, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('update Itens_Compra set Qtde_Recebida = :Qtde_Recebida, Qtde_Restante = :Qtde_Restante, Status = :S,');
        add('Data_Entrega = :Data where N_Pedido = :Pedido and Codigo_Produto = :Produto');
        Parameters.ParamByName('Qtde_Recebida').Value:= qryitens_entradaQuantidade.AsFloat;
        Parameters.ParamByName('Qtde_Restante').Value:= qryitens_entradaQuantidade_Restante.AsFloat;
        if (qryitens_entradaQuantidade_Restante.AsString <> '0') then
          Parameters.ParamByName('S').Value:= 'PENDENTE'
        else
          Parameters.ParamByName('S').Value:= 'BAIXADO';
        Parameters.ParamByName('Pedido').Value:= StrToInt(EdtPedido.Text);
        Parameters.ParamByName('Produto').Value:= qryitens_entradaCodigo_Produto.AsInteger;
        Parameters.ParamByName('Data').Value:= StrToDateTime(MEdtData_Entrada.Text);
        ExecSQL;
      end;
      qryitens_entrada.Next;
    end;

    finally
      lrControle:= Altera;
      UGeral.Mensagem_Padrao(lrControle);
      FreeAndNil(qAux5);
      FreeAndNil(qAux6);
    end;
  except
    Erro_Processo;
    DM.ADOConnection1.RollbackTrans;
  end;}

end;

procedure TFrmEntrada_Produtos.AtualizaCodigoProdutoFornecedor(Codigo_Fornecedor: AnsiString; Fornecedor: integer; Produto: integer);
var
  FComando: TComandoSQLEntidade;
  qAux, qAux2: TADOQuery;
begin
  try
    TLog.Info('--- MÉTODO AtualizaCodigoProdutoFornecedor --- ');
    FComando:= TComandoSQLEntidade.Create;
    FComando.Conexao:= Conexao;
    FComando.ComandoSQL:= 'select PCF.Codigo_Produto_Fornecedor from Produto_Codigo_Fornecedor PCF '+
                          'where Codigo_Produto_Inteiro = :Codigo_Produto_Inteiro and Codigo_Fornecedor = :Codigo_Fornecedor';
    FComando.Parametros.Add('Codigo_Produto_Inteiro');
    FComando.Parametros.Add('Codigo_Fornecedor');
    FComando.Valores.Add(Produto);
    FComando.Valores.Add(Fornecedor);
    FComandosSQL:= TComandoSQLDominio.Create(FComando);

    qAux:= TADOQuery.Create(self);
    qAux.Connection:= Conexao;
    FComandosSQL.ExecutaComandoSQLRetornaADOQuery(qAux);

    if (qAux.IsEmpty) then
    begin
      FComando:= TComandoSQLEntidade.Create;
      FComando.Conexao:= Conexao;
      FComando.ComandoSQL:= 'insert into Produto_Codigo_Fornecedor (Codigo_Produto_Fornecedor, Codigo_Produto_Inteiro, Codigo_Fornecedor)values '+
                            '(:Codigo_Produto_Fornecedor, :Codigo_Produto_Inteiro, :Codigo_Fornecedor)';
      FComando.Parametros.Add('Codigo_Produto_Fornecedor');
      FComando.Parametros.Add('Codigo_Produto_Inteiro');
      FComando.Parametros.Add('Codigo_Fornecedor');
      FComando.Valores.Add(Codigo_Fornecedor);
      FComando.Valores.Add(Produto);
      FComando.Valores.Add(Fornecedor);
      FComandosSQL:= TComandoSQLDominio.Create(FComando);
      FComandosSQL.ExecutaComandoSQLSalvarAlterarExcluir;
    end
    else
    begin
      FComando:= TComandoSQLEntidade.Create;
      FComando.Conexao:= Conexao;
      FComando.ComandoSQL:= 'update Produto_Codigo_Fornecedor set '+
                            'Codigo_Produto_Fornecedor = :Codigo_Produto_Fornecedor '+
                            'where Codigo_Produto_Inteiro = :Codigo_Produto_Inteiro and Codigo_Fornecedor = :Codigo_Fornecedor';
      FComando.Parametros.Add('Codigo_Produto_Fornecedor');
      FComando.Parametros.Add('Codigo_Produto_Inteiro');
      FComando.Parametros.Add('Codigo_Fornecedor');
      FComando.Valores.Add(Codigo_Fornecedor);
      FComando.Valores.Add(Produto);
      FComando.Valores.Add(Fornecedor);
      FComandosSQL:= TComandoSQLDominio.Create(FComando);
      FComandosSQL.ExecutaComandoSQLSalvarAlterarExcluir;
    end;
  except on E:Exception do
  begin
    TMensagens.MensagemErro('Método AtualizaCodigoProdutoFornecedor: '+E.Message);
    TLog.Error(Self.ClassName+' - AtualizaCodigoProdutoFornecedor - '+E.Message);
  end;

  end;
  TLog.Info('--- FIM MÉTODO AtualizaCodigoProdutoFornecedor --- ');
end;

procedure TFrmEntrada_Produtos.AtualizaDadosProdutoGeradoDepoisLancamento(FProduto: TProdutoEntidade);
begin
  FProdutoDominio:= TProdutoDominio.Create(Conexao);
  FProdutoDominio.AtualizaDadosEntrada(FProduto);
end;

procedure TFrmEntrada_Produtos.BBtnSalvarClick(Sender: TObject);
var
  vaux, saldo_atual, total_bruto, estoque_atual, custo :double;
  totNota, totNotaQuery, codigoDeVenda, camposGeraHash, saldo, MD5Gerado: AnsiString;
  finalizada: Boolean;
  codigoProdutoQuery : Integer;

begin
  try
    TLog.Info('--- MÉTODO SALVAR (CLIQUE NO BOTÃO SALVAR) --- ');
    FEntradasDominio:= TEntradasDominio.Create(Conexao);
    finalizada:= FEntradasDominio.VerificaNotaFinalizada(StrToInt(EdtCodigo.Text));

    TLog.Debug('Nota '+EdtN_Nota_Fiscal.Text+' finalizada? : '+BoolToStr(finalizada));

    if (CBFecharNota.Checked) then
      TLog.Debug('Opção Fechar Nota MARCADA')
    else
      TLog.Debug('Opção Fechar Nota DESMARCADA');

    if (finalizada) then
    begin
      TMensagens.MensagemErro('Nota Fiscal já finalizada.');
      exit;
    end;

    if (CBFecharNota.Checked) and (CBGera.Checked) and ((EdtCodigo_Condicao_Pagamento.Text = '') or (MEdtData_Primeira_Parcela.Text = '  /  /    ')) then
    begin
      Application.MessageBox('Por favor, informe uma condição de pagamento e/ou uma data para gerar o financeiro desta nota fiscal', 'Dados incorretos', MB_OK+MB_ICONHAND);
      PageControl2.TabIndex:= 1;
      EdtCodigo_Condicao_Pagamento.SetFocus;
      exit;
    end;

    if (CBGera_Etiqueta.Checked) and (EdtCodigo_Etiqueta.Text = '') then
    begin
      Application.MessageBox('Por favor, informe uma etiqueta para ser gerada.', 'Dados incorretos', MB_OK+MB_ICONHAND);
      PageControl2.TabIndex:= 1;
      EdtCodigo_Etiqueta.SetFocus;
      exit;
    end;

    totNotaQuery:= qryimpostosValor_Total_Nota.AsString;
    totNota:= EdtTotal_Nota.Text;

    TLog.Debug('EdtTotal_Nota: '+totNota);
    TLog.Debug('qryimpostosValor_Total_Nota: '+totNotaQuery);

    totNotaQuery:= FormatFloat('#0.00', qryimpostosValor_Total_Nota.AsFloat);
    TLog.Debug('qryimpostosValor_Total_Nota Formatado com 2 casas decimais: '+totNotaQuery);

    if (totNota <> totNotaQuery) then
    begin
      if (Application.MessageBox(PChar('O valor total da nota calculado pelo sistema está DIFERENTE ao valor total informado manualmente. '+#13+#10+#13+#10+'Deseja continuar?'), 'Atenção!', MB_YESNO+MB_ICONEXCLAMATION))=IDNO then
      begin
        PageControl2.TabIndex:= 0;
        EdtTotal_Nota.SetFocus;
        exit;
      end;
    end;

    if (totNota = qryimpostosValor_Total_Nota.AsString) and (CBFecharNota.Checked = false) then
    begin
      if (Application.MessageBox(PChar('O valor total da nota calculado pelo sistema está IGUAL ao valor total informado manualmente. '+#13+#10+'Portanto, entende-se que foram lançados todos os itens da nota fiscal. '+#13+#10+'No entanto, a opção FECHAR NOTA está DESMARCADA e não será atualizado o estoque e os demais dados dos produtos.'+#13+#10+#13+#10+'Deseja continuar?'), 'Atenção!', MB_YESNO+MB_ICONEXCLAMATION))=IDNO then
      begin
        PageControl2.TabIndex:= 0;
        CBFecharNota.SetFocus;
        exit;
      end;
    end;

    if (CBFecharNota.Checked = false) then
    begin
      if (Application.MessageBox('A opção FECHAR NOTA está DESMARCADA. Não será atualizado o financeiro, o estoque e os demais dados dos produtos. Deseja continuar?', 'Atenção!', MB_YESNO+MB_ICONEXCLAMATION))=IDNO then
      begin
        PageControl2.TabIndex:= 0;
        CBFecharNota.SetFocus;
        exit;
      end;
    end;

    if (CBFecharNota.Checked) then
    begin
      if (Application.MessageBox('A opção FECHAR NOTA está MARCADA. Os dados dos produtos (estoque, custos, preços e etc.) serão atualizados automaticamente. Deseja continuar?', 'Atenção!', MB_YESNO+MB_ICONEXCLAMATION))=IDNO then
      begin
        PageControl2.TabIndex:= 0;
        CBFecharNota.SetFocus;
        exit;
      end;
    end;

    if (Confira) then
    begin
      if (CBFecharNota.Checked) then
      begin
        qryitens_entrada.First;
        while not qryitens_entrada.Eof do
        begin
          //if (qryitens_entradaChecado.AsString = 'N') then
          //begin
            Atualiza_Item_Checado;

            //preenchendo parâmetros para colocar no objeto produto
            saldo_atual:= qryitens_entradaSaldo_Estoque.AsFloat;
            total_bruto:= ((qryitens_entradaCusto_Unitario.AsFloat) * (qryitens_entradaQuantidade.AsFloat * qryitens_entradaQuantidade_Volume.AsFloat));
            estoque_atual:= qryitens_entradaEstoque.AsFloat + (qryitens_entradaQuantidade.AsFloat * qryitens_entradaQuantidade_Volume.AsFloat);

            //MD51
            codigoProdutoQuery := qryitens_entradaCodigo_Produto.AsInteger;
            codigoDeVenda := BuscaCodigoProduto(codigoProdutoQuery);
            MD5Gerado := GeraMD5([codigoDeVenda, qryitens_entradaDescricao_Produto.AsAnsiString,
                        FloatToStr(estoque_atual), qryitens_entradaCodigo_Produto.AsAnsiString, cChavePrivada]);


            if (estoque_atual <= 0) then
              custo:= (saldo_atual + total_bruto)
            else
            begin
              custo:= (saldo_atual + total_bruto) / estoque_atual;
              custo:= Calcula_Valor(FloatToStr(custo));
            end;

            TLog.Info('Vai calcular o saldo');
            saldo:= FloatToStr(Calcula_Valor(FloatToStr(qryitens_entradaCusto_Unitario.AsFloat * estoque_atual)));  //// estava assim: custo * estoque_atual

            saldo:= StringReplace(saldo, ThousandSeparator, '', [rfReplaceAll]);
            TLog.Debug('Valor: do saldo: ' + saldo);

             TLog.Info('Vai iniciar o objeto FProduto');
            //objeto produto com atualizações do NCM, data de validade e etc.
            FProduto:= TProdutoEntidade.Create;
             TLog.Debug('Passou TProdutoEntidade.Create');
            FProduto.Codigo:= qryitens_entradaCodigo_Produto.AsInteger;
            TLog.Debug('FProduto.Codigo:= qryitens_entradaCodigo_Produto.AsInteger ==>> ' + qryitens_entradaCodigo_Produto.AsString);
            FProduto.NCM:= qryitens_entradaNCM.AsString;
            TLog.Debug('FProduto.NCM:= qryitens_entradaNCM.AsString ==>> '+ qryitens_entradaNCM.AsString);
            FProduto.DataValidade:= qryitens_entradaData_Validade.AsDateTime;
            TLog.Debug('FProduto.DataValidade:= qryitens_entradaData_Validade.AsDateTime ==>> ' + qryitens_entradaData_Validade.AsString);
            FProduto.SaldoEstoque:= StrToFloat(saldo);
            TLog.Debug('FProduto.SaldoEstoque:= StrToFloat(saldo) ==>> ' + saldo);
            FProduto.Estoque:= estoque_atual;
            TLog.Debug('FProduto.Estoque:= estoque_atual; => ' + FloatToStr(estoque_atual));
            FProduto.DataAtualizacaoEstoque:= date;
            TLog.Debug('FProduto.DataAtualizacaoEstoque:= date; = > ' + DateToStr(date));
            FProduto.MD5 := MD5Gerado;
            TLog.Debug('FProduto.MD5 := MD5Gerado; => '+ MD5Gerado);


            if (estoque_atual >= 0) then
              FProduto.StatusEstoque:= '+'
            else
              FProduto.StatusEstoque:= '-';


            FProduto.VolumeTotal:= estoque_atual * qryitens_entradaVolume.AsFloat;
            TLog.Debug(' FProduto.VolumeTotal:= estoque_atual * qryitens_entradaVolume.AsFloat => ' + FloatToStr(FProduto.VolumeTotal));
            FProduto.ValorMedio:= custo;
            TLog.Debug(' FProduto.ValorMedio:= custo; => ' + FloatToStr(custo));
            FProduto.ValorCompra:= qryitens_entradaCusto_Unitario.AsFloat;
            TLog.Debug(' FProduto.ValorCompra:= qryitens_entradaCusto_Unitario.AsFloat => ' + qryitens_entradaCusto_Unitario.AsString);
//            FProduto.ValorCompraUnitario:= qryitens_entradaValor_Unitario.AsFloat;
            FProduto.ValorCompraUnitario:= qryitens_entradaValor_Total.AsFloat / (qryitens_entradaQuantidade.AsFloat *
                                            qryitens_entradaQuantidade_Volume.AsFloat);
            FProduto.ValorUltimaCompra:= qryitens_entradaValor_Ultima_Compra.AsFloat;
            TLog.Debug(' FProduto.ValorUltimaCompra := qryitens_entradaValor_Ultima_Compra.AsFloat => ' + qryitens_entradaValor_Ultima_Compra.AsString);
            FProduto.ValorUltimaCompraUnitario:= qryitens_entradaValor_Ultima_Compra_Unitario.AsFloat;
            TLog.Debug(' FProduto.ValorUltimaCompraUnitario:= qryitens_entradaValor_Ultima_Compra_Unitario.AsFloat; => ' + qryitens_entradaValor_Ultima_Compra_Unitario.AsString);
            FProduto.Ultima_Compra:= StrToDateTime(MEdtData_Entrada.Text);
            TLog.Debug(' FProduto.Ultima_Compra:= StrToDateTime(MEdtData_Entrada.Text);' + MEdtData_Entrada.Text);
            TLog.Info('Preencheu o objeto FProduto');
            TLog.Info('Vai entrar no método AtualizaDadosProdutoGeradoDepoisLancamento(FProduto)');
            AtualizaDadosProdutoGeradoDepoisLancamento(FProduto);
            TLog.Info('Fim método AtualizaDadosProdutoGeradoDepoisLancamento(FProduto)');


            //objeto ItensTabelaPreco para atualizar a tabela de preço.
            FItensTabelaPreco:= TItensTabelaPrecoEntidade.Create;
            FItensTabelaPreco.Codigo:= codigo_tabela_preco_padrao;
            FItensTabelaPreco.CodigoProduto:= qryitens_entradaCodigo_Produto.AsInteger;
            FItensTabelaPreco.PrecoVista:= qryitens_entradaValor_Vista.AsFloat;
            FItensTabelaPreco.PrecoPrazo:= qryitens_entradaValor_Prazo.AsFloat;
            FItensTabelaPreco.PercentualLucroVista:= qryitens_entradaPercentual_Lucro_Vista.AsFloat;
            FItensTabelaPreco.PercentualLucroPrazo:= qryitens_entradaPercentual_Lucro_Prazo.AsFloat;
            Atualiza_Preco_Tabela(FItensTabelaPreco);

            //MD52
//            FreeAndNil(MD5Gerado);
            camposGeraHash := BuscaCamposProdutoMD5(codigoProdutoQuery);
            MD5Gerado := GeraMD5([camposGeraHash]);

//            AtualizarMD52(codigoProdutoQuery, MD5Gerado);
//            FreeAndNil(MD5Gerado);
            Atualiza_Codigo_Produto_Fornecedor(qryitens_entradaCodigo_Produto_Fornecedor.AsString, StrToInt(EdtCodigo_Fornecedor.Text), qryitens_entradaCodigo_Produto.AsInteger);
            salvarFichaEstoque;
          {end
          else
          begin
            if (CBAtualiza_NCM.Checked) then
              Atualiza_NCM;

            if (CBAtualiza_Data_Validade.Checked) then
              Atualiza_Data_Validade;

            if (CBAtualiza_Preco.Checked) then
            begin
              FItensTabelaPreco:= TItensTabelaPrecoEntidade.Create;
              FItensTabelaPreco.Codigo:= codigo_tabela_preco_padrao;
              FItensTabelaPreco.CodigoProduto:= qryitens_entradaCodigo_Produto.AsInteger;
              FItensTabelaPreco.PrecoVista:= qryitens_entradaValor_Vista.AsFloat;
              FItensTabelaPreco.PrecoPrazo:= qryitens_entradaValor_Prazo.AsFloat;
              FItensTabelaPreco.PercentualLucroVista:= qryitens_entradaPercentual_Lucro_Vista.AsFloat;
              FItensTabelaPreco.PercentualLucroPrazo:= qryitens_entradaPercentual_Lucro_Prazo.AsFloat;
              Atualiza_Preco_Tabela(FItensTabelaPreco);
            end;

            if (CBAtualiza_Custos.Checked) then
              Atualiza_Custos;

          end;}

          qryitens_entrada.Next;
        end;
      end;

      PreencheObjetoEntrada;
      PreencheObjetoTransporte;
      PreencheObjetoImpostosEntrada;
      FEntradasDominio:= TEntradasDominio.Create(Conexao);
      FImpostosDominio:= TImpostosEntradaDominio.Create(Conexao);
      FTransporteDominio:= TTransporteNFeDominio.Create(Conexao);

      if (achei = false) then
      begin
        //Entrada.Inserir(Entrada);
        //Imposto.Inserir(Imposto);
        //Transporte.Inserir;
        FEntradasDominio.gravar(FEntradas);
        FImpostosDominio.gravar(FImpostosEntrada);
        FTransporteDominio.gravar(FTransporte);
        UDeclaracao.Insere_Historico(usuario, 'REALIZOU ENTRADA DE PRODUTOS ' + EdtN_Nota_Fiscal.Text + '.', TimeToStr(time), insercao, date);
      end
      else
      begin
        //Entrada.Alterar(Entrada);
        //Transporte.Alterar;
        //Imposto.Alterar(Imposto);
        FEntradasDominio.alterar(FEntradas);
        FImpostosDominio.alterar(FImpostosEntrada);
        FTransporteDominio.alterar(FTransporte);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU ENTRADA DE PRODUTOS ' + EdtN_Nota_Fiscal.Text + '.', TimeToStr(time), alteracao, date);
      end;

      if (CBGera.Checked) and (CBFecharNota.Checked) then
      begin
        Gera_Conta_Pagar;
        DBGrid2.Visible:= true;
        Atualiza_Parcela;
      end;
      TabSheet2.Enabled:= false;
      TabSheet1.Enabled:= false;
      TabSheet3.Enabled:= false;
      TConexao.ConfirmaConexao(Conexao);

      //Delete_Produto_Aux;
      //Insere_Produto_Aux;
      BBtnSalvar.Enabled:= false;
      BBtnExcluir.Enabled:= false;
      BBtnCancelar.Enabled:= false;
      BBtnCopia_Nota.Enabled:= false;
      BBtnCancela_Nota.Enabled:= false;
      BBtnNovo.Enabled:= true;
      BBtnImporta_XML.Enabled:= false;

      if (CBFecharNota.Checked) then
      begin
        Cria_Arquivo_Atualiza_Dados('AITPr');
        Cria_Arquivo_Atualiza_Dados('AProd');
      end;

      if (CBGera_Etiqueta.Checked) then
        BBtnImprimir_Etiqueta.Enabled:= true
      else
        BBtnImprimir_Etiqueta.Enabled:= false;

      Processo_Concluido;
      TLog.Info('--- FIM MÉTODO SALVAR (CLICK) --- ');
      iniciado:= false;
    end;
  except
    on E : Exception do
    begin
      TLog.Error(Self.ClassName+' - BBtnSalvarClick - '+E.Message);
      TMensagens.MensagemErro('Método BBtnSalvarClick: '+E.Message);
      TConexao.CancelaConexao(Conexao);
    end;
  end;

end;

procedure TFrmEntrada_Produtos.PreencheObjetoEntrada;
begin
  try
    FEntradas:= TEntradasEntidade.Create;

    FEntradas.Codigo:= StrToInt(EdtCodigo.Text);
    FEntradas.N_Nota_Fiscal:= EdtN_Nota_Fiscal.Text;
    FEntradas.Modelo:= EdtModelo.Text;
    FEntradas.Serie:= EdtSerie.Text;
    FEntradas.Data_Emissao:= StrToDate(MEdtData_Emissao.Text);
    FEntradas.Hora_Emissao:= MEdtHora_Emissao.Text;
    FEntradas.Data_Entrada:= StrToDate(MEdtData_Entrada.Text);
    FEntradas.Hora_Entrada:= MEdtHora_Entrada.Text;

    if (RGTipo_Frete.ItemIndex = 0) then
      FEntradas.Tipo_Frete := '0'
    else if (RGTipo_Frete.ItemIndex = 1) then
      FEntradas.Tipo_Frete := '1'
    else if (RGTipo_Frete.ItemIndex = 2) then
      FEntradas.Tipo_Frete := '2'
    else if (RGTipo_Frete.ItemIndex = 3) then
      FEntradas.Tipo_Frete := '9';

    if (RGTipo_Pagamento.ItemIndex = 0) then
      FEntradas.Tipo_Pagamento := '0'
    else if (RGTipo_Pagamento.ItemIndex = 1) then
      FEntradas.Tipo_Pagamento := '1'
    else if (RGTipo_Pagamento.ItemIndex = 2) then
      FEntradas.Tipo_Pagamento := '9';

    FEntradas.Codigo_Fornecedor:= StrToInt(EdtCodigo_Fornecedor.Text);
    FEntradas.Codigo_CFOP:= StrToInt(EdtCodigo_CFOP.Text);
    FEntradas.Codigo_Empresa:= UDeclaracao.Codigo_Empresa;
    FEntradas.Quantidade_Itens:= StrToInt(EdtQuantidade_Itens.Text);
    FEntradas.Observacao:= MmoObservacao.Text;
    FEntradas.Status:= 'N';
    FEntradas.Codigo_Funcionario:= codigo_usu;
    FEntradas.Chave_NFe_Entrada:= EdtChave_Acesso.Text;
    if (EditCaixaECF.Text = '') then
      FEntradas.Caixa_ECF:= 0
    else
      FEntradas.Caixa_ECF:= StrToInt(EditCaixaECF.Text);

    if (CBFecharNota.Checked) then
      FEntradas.Finalizada:= 0
    else
      FEntradas.Finalizada:= 1;

  except on E:Exception do
  begin
    TLog.Error(Self.ClassName+' - PreencheObjetoEntrada - '+E.Message);
    TMensagens.MensagemErro('Método PreencheObjetoEntrada: '+E.Message);
  end;

  end;
end;

procedure TFrmEntrada_Produtos.PreencheObjetoImpostosEntrada;
begin
  Tlog.Info('--- MÉTODO PreencheObjetoImpostosEntrada ---');
  try
    FImpostosEntrada:= TImpostosEntradaEntidade.Create;

    FImpostosEntrada.Codigo:= StrToInt(EdtCodigo.Text);
    FImpostosEntrada.N_Nota_Fiscal:= EdtN_Nota_Fiscal.Text;
    FImpostosEntrada.Total_Produtos:= StrToFloat(EdtTotal_Produtos.Text);
    FImpostosEntrada.Base_ICMS:= StrToFloat(EdtBase_ICMS.Text);
    FImpostosEntrada.Valor_ICMS:= StrToFloat(EdtValor_ICMS.Text);
    FImpostosEntrada.Isento_ICMS:= StrToFloat(EdtIsento_ICMS.Text);
    FImpostosEntrada.Outros_ICMS:= StrToFloat(EdtOutros_ICMS.Text);
    FImpostosEntrada.Base_ICMS_Subs:= StrToFloat(EdtBase_ICMS_Substituicao.Text);
    FImpostosEntrada.Valor_ICMS_Subs:= StrToFloat(EdtValor_ICMS_Substituicao.Text);
    FImpostosEntrada.Aliquota:= StrToFloat(EdtAliquota_ICMS.Text);
    FImpostosEntrada.Valor_Frete:= StrToFloat(EdtValor_Frete.Text);
    FImpostosEntrada.Valor_Seguro:= StrToFloat(EdtValor_Seguro.Text);;
    FImpostosEntrada.Outras_Despesas:= StrToFloat(EdtOutras_Despesas.Text);;
    FImpostosEntrada.Total_IPI:= StrToFloat(EdtTotal_IPI.Text);
    FImpostosEntrada.Isento_IPI:= StrToFloat(EdtIsento_IPI.Text);
    FImpostosEntrada.Outros_IPI:= StrToFloat(EdtOutros_IPI.Text);
    FImpostosEntrada.Desconto:= StrToFloat(EdtDesconto.Text);
    FImpostosEntrada.Total_Nota:= StrToFloat(EdtTotal_Nota.Text);
    FImpostosEntrada.Custo_Total:= StrToFloat(EdtCusto_Total.Text);;
  except on E:Exception do
  begin
    TLog.Error(Self.ClassName+' - PreencheObjetoImpostosEntrada - '+E.Message);
    TMensagens.MensagemErro('Método PreencheObjetoImpostosEntrada: '+E.Message);
  end;
  end;
  Tlog.Info('--- FIM MÉTODO PreencheObjetoImpostosEntrada ---');
end;

procedure TFrmEntrada_Produtos.PreencheObjetoItensEntrada;
var
  qAux: TADOQuery;
  FComando: TComandoSQLEntidade;
begin
  Tlog.Info('--- MÉTODO PreencheObjetoItensEntrada ---');
  try
    FComando:= TComandoSQLEntidade.Create;
    FComando.Conexao:= Conexao;
    FComando.ComandoSQL:= 'select max(N_Item) as Item from Itens_Entrada where N_Nota_Fiscal = :Nota';
    FComando.Parametros.Add('Nota');
    FComando.Valores.Add(EdtN_Nota_Fiscal.Text);
    FComandosSQL:= TComandoSQLDominio.Create(FComando);

    qAux:= TADOQuery.Create(self);
    qAux.Connection:= Conexao;
    FComandosSQL.ExecutaComandoSQLRetornaADOQuery(qAux);

    if (qAux.FieldByName('Item').AsString = '') then
    begin
      n_item:= 0;
      Tlog.Debug('VARIÁVEL n_item: 0');
    end
    else
    begin
      n_item:= qAux.FieldByName('Item').AsInteger;
      Tlog.Debug('VARIÁVEL n_item: '+IntToStr(n_item));
    end;


    Inc(n_item);

    FItens_Entrada.Codigo:= StrToInt(EdtCodigo.Text);
    FItens_Entrada.N_Item:= StringOfChar('0', 3 - Length(IntToStr(N_Item))) + IntToStr(N_Item);
    FItens_Entrada.N_Nota_Fiscal:= EdtN_Nota_Fiscal.Text;
    FItens_Entrada.Codigo_Produto:= StrToInt(LblProduto.Caption);
    FItens_Entrada.NCM:= EdtNCM.Text;
    FItens_Entrada.Unidade:= EdtUnidade.Text;
    FItens_Entrada.ST:= EdtSituacao_Tributaria.Text;
    FItens_Entrada.Valor_Ultima_Compra:= valor_compra;
    //FItens_Entrada.Valor_Unitario:= StrToFloat(FrmEntrada_Produtos.EdtValor_Unitario.Text);
    //FItens_Entrada.Quantidade:= StrToFloat(EdtQuantidade.Text);
    FItens_Entrada.Quantidade_Restante:= qtde_pendente;
    //FItens_Entrada.Valor_Total:= StrToFloat(EdtValor_Total.Text);
    //FItens_Entrada.Valor_Frete_Unitario:= StrToFloat(EdtValor_Unitario_Frete.Text);
    //FItens_Entrada.Quantidade_Volume:= StrToFloat(EdtQuantidade_Volume.Text);
    //FItens_Entrada.BC_ICMS:= StrToFloat(EdtBC_ICMS.Text);
    //FItens_Entrada.Aliquota_ICMS:= EdtICMS.Text;
    //FItens_Entrada.Aliquota_IPI:= EdtIPI.Text;
    FItens_Entrada.CFOP:= EdtCFOP2.Text;
    //FItens_Entrada.Valor_ICMS_Unitario:= StrToFloat(EdtValor_ICMS_Unitario.Text);
    //FItens_Entrada.Valor_IPI:= StrToFloat(EdtValor_IPI.Text);
    //FItens_Entrada.Custo_Unitario:= StrToFloat(EdtCusto_Unitario.Text);
    //FItens_Entrada.Percentual_Lucro_Vista:= StrToFloat(EdtPercentual_Lucro_Vista.Text);
    //FItens_Entrada.Valor_Vista:= StrToFloat(EdtValor_Vista.Text);
    //FItens_Entrada.Percentual_Lucro_Prazo:= StrToFloat(EdtPercentual_Lucro_Prazo.Text);
    //FItens_Entrada.Valor_Prazo:= StrToFloat(EdtValor_Prazo.Text);
    FItens_Entrada.Valor_Vista_Ultimo:= valor_vista;
    FItens_Entrada.Valor_Prazo_Ultimo:= valor_prazo;
    //FItens_Entrada.IVA:= StrToFloat(EdtIVA.Text);
    //FItens_Entrada.BC_ICMS_ST:= StrToFloat(EdtBC_ICMS_ST.Text);;
    //FItens_Entrada.Valor_ICMS_ST:= StrToFloat(EdtValor_ICMS_ST.Text);
    FItens_Entrada.Checado:= 'N';
    FItens_Entrada.Codigo_Produto_Fornecedor:= EdtCodigo_Produto.Text;
    FItens_Entrada.Descricao_Produto:= EdtProduto.Text;
    FItens_Entrada.Valor_Ultima_Compra_Unitario:= valor_compra_unitario;
    FItens_Entrada.Qtde_Estoque_Atual:= qtde_estoque;
    //FItens_Entrada.Saldo_Estoque_Atual:= saldo_estoque;
    //FItens_Entrada.Volume_Atual:= volume_atual;
    FItens_Entrada.Ficha_Estoque_Codigo:= 0;

    if (FrmEntrada_Produtos.MEdtData_Validade.Text = '  /  /    ') then
      FItens_Entrada.Data_Validade:= 0
    else
      FItens_Entrada.Data_Validade:= StrToDateTime(MEdtData_Validade.Text);
  except on E:Exception do
  begin
    TLog.Error(Self.ClassName+' - PreencheObjetoItensEntrada - '+E.Message);
    TMensagens.MensagemErro('Método PreencheObjetoItensEntrada: '+E.Message);
  end;
  end;
  Tlog.Info('--- FIM MÉTODO PreencheObjetoItensEntrada ---');
end;

procedure TFrmEntrada_Produtos.PreencheObjetoTransporte;
begin
  Tlog.Info('--- MÉTODO PreencheObjetoTransporte ---');
  try
    FTransporte:= TTransporteNFeEntidade.Create;
    Tlog.Debug('Novo objeto TTransporteNFeEntidade foi criado');

    FTransporte.Codigo:= StrToInt(EdtCodigo.Text);;
    FTransporte.N_Nota_Fiscal:= EdtN_Nota_Fiscal.Text;
    Tlog.Debug('Novo objeto TTransporteNFeEntidade foi criado');

    if (EdtCodigo_Transportadora.Text = '') then
      FTransporte.Codigo_Transportadora := 0
    else
      FTransporte.Codigo_Transportadora := StrToInt(EdtCodigo_Transportadora.Text);

    if (EdtCodigo_Veiculo.Text = '') then
      FTransporte.Codigo_Veiculo := 0
    else
      FTransporte.Codigo_Veiculo := StrToInt(EdtCodigo_Veiculo.Text);

    FTransporte.Quantidade:= StrToFloat(EdtQuantidade_Transportada.Text);
    FTransporte.Especie:= EdtEspecie.Text;
    FTransporte.Marca:= EdtMarca.Text;
    FTransporte.Numero:= EdtNumero_Transportado.Text;
    FTransporte.Peso_Bruto:= StrToFloat(EdtPeso_Bruto.Text);
    FTransporte.Peso_Liquido:= StrToFloat(EdtPeso_Liquido.Text);
  except on E:Exception do
  begin
    TLog.Error(Self.ClassName+' - PreencheObjetoTransporte - '+E.Message);
    TMensagens.MensagemErro('Método PreencheObjetoTransporte: '+E.Message);
  end;
  end;
  Tlog.Info('---FIM MÉTODO PreencheObjetoTransporte ---');
end;

procedure TFrmEntrada_Produtos.BitBtn1Click(Sender: TObject);
begin
  try
    if (Verifica_Produto_Lancado) then
    begin
      Produto_Ja_Lancamento_Venda;
      exit;
    end;

    if (Verifica_Produto_Entrada(StrToFloat(EdtQuantidade.Text)) = false)then
    begin
      Atualiza_Dados;
      exit;
    end;

    if (Confira_Itens_Entrada) then
    begin

      qtde:= StrToInt(EdtQuantidade_Itens.Text);
      inc(qtde);
      EdtQuantidade_Itens.Text:= IntToStr(qtde);

      //if (CBIncluir.Checked = false) or (achei = true) then
        //Calcula_Total;

      Calcula_Custo_Total;
      PreencheObjetoImpostosEntrada;
      PreencheObjetoItensEntrada;

      FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
      FItensEntradaDominio.GravaItem(FItens_Entrada);

      FItens_Entrada:= TItensEntradaEntidade.Create;
      Atualiza_Dados;
      Pega_Total_Impostos;
      Limpa_Menor;
      BBtnSalvar.Enabled:= true;
      BBtnCancelar.Enabled:= true;
    end;
  except
    on E : Exception do
    begin
      TLog.Error(Self.ClassName+' - Clique ConfirmarItem - '+E.Message);
      TMensagens.MensagemErro('Método ConfirmarItem: '+E.Message);
    end;
  end;

end;

procedure TFrmEntrada_Produtos.Calcula_Custo;
var
  valor_total_item, somatoria, cdi, icms, valor_icms_st, qtde, custo, ipi, total, perc, ad: double; //cdi = Custo Despesa Item
begin
  try
    valor_total_item:= StrToFloat(EdtValor_Total.Text);

    if (tipo_recolhimento = 'ST') then
    begin
      icms:= StrToFloat(EdtICMS.Text);
      valor_icms_st:= (valor_total_item * ( icms / 100));
      valor_total_item:= (valor_total_item - valor_icms_st);
    end;

    cdi:= StrToFloat(EdtValor_Unitario_Frete.Text);
    ipi:= StrToFloat(EdtValor_IPI.Text);
    qtde:= ( StrToFloat(EdtQuantidade.Text) * StrToFloat(EdtQuantidade_Volume.Text) );

    ad:= custo_op + StrToFloat(aliquota_sn);
    total:= valor_total_item + cdi + valor_icms_st + ipi;
    perc:= total * ( ad /100);
    total:= total + perc;
    custo:= total / qtde;

    EdtCusto_Unitario.Text:= FloatToStr(Calcula_Valor(FloatToStr(custo)));
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - Calcula_Custo  - '+E.Message);
  end;
end;

procedure TFrmEntrada_Produtos.Calcula_Custo_Sem_Despesa;
var
  valor_total, ipi, qtde, total, perc, ad, custo, st: double;
begin
  try
    valor_total:= StrToFloat(EdtValor_Total.Text);
    ipi:= StrToFloat(EdtValor_IPI.Text);
    custo:= StrToFloat(EdtValor_Unitario_Frete.Text);
    st:= StrToFloat(EdtValor_ICMS_ST.Text);

    total:= valor_total + ipi + custo + st;
    ad:= custo_op + StrToFloat(aliquota_sn);

    perc:= total * ( ad /100);
    total:= total + perc;
    qtde:= StrToFloat(EdtQuantidade.Text) * StrToFloat(EdtQuantidade_Volume.Text);

    EdtCusto_Unitario.Text:= FormatFloat('#0.0,0', total / qtde );
    EdtCusto_Unitario.Text:= StringReplace(EdtCusto_Unitario.Text, ThousandSeparator, '', [rfReplaceAll]);
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - Calcula_Custo_Sem_Despesa  - '+E.Message);
  end;
end;

procedure TFrmEntrada_Produtos.Calcula_Custo_Total;
var
  custo_unitario, qtde, custo_total: double;
begin
  try
    custo_total:= StrToFloat(EdtCusto_Total.Text);
    custo_unitario:= StrToFloat(EdtCusto_Unitario.Text);
    qtde:= StrToFloat(EdtQuantidade.Text) * StrToFloat(EdtQuantidade_Volume.Text);

    custo_total:= custo_total + (custo_unitario * qtde);

    EdtCusto_Total.Text:= FormatFloat('#0.0,0', custo_total);
    EdtCusto_Total.Text:= StringReplace(EdtCusto_Total.Text, ThousandSeparator, '', [rfReplaceAll]);
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - Calcula_Custo_Total  - '+E.Message);
  end;
end;

procedure TFrmEntrada_Produtos.Calcula_Custo_Total_Deletado;
var
  custo_unitario, qtde, custo_total: double;
begin
  try
    custo_total:= StrToFloat(EdtCusto_Total.Text);
    custo_unitario:= qryitens_entradaCusto_Unitario.AsFloat;
    qtde:= qryitens_entradaQuantidade.AsFloat * qryitens_entradaQuantidade_Volume.AsFloat;

    custo_total:= custo_total - (custo_unitario * qtde);

    EdtCusto_Total.Text:= FormatFloat('#0.0,0', custo_total);
    EdtCusto_Total.Text:= StringReplace(EdtCusto_Total.Text, ThousandSeparator, '', [rfReplaceAll]);
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - Calcula_Custo_Total_Deletado  - '+E.Message);
  end;
end;

procedure TFrmEntrada_Produtos.Calcula_Perc_Despesa;
var
  valor_total_item, perc, somatoria, cdi, icms, valor_icms_st, valor_icms_nota, valor_icms_interno, total_produtos, valor_ipi, iva,
  valor_bc_st, valor_st, bc_st: double; //cdi = Custo Despesa Item
begin
  try
    valor_total_item:= 0;
    total_produtos:= 0;
    perc:= 0;
    somatoria:= 0;
    cdi:= 0;
    valor_icms_st:= 0;
    bc_st:= 0;

    valor_total_item:= StrToFloat(EdtValor_Total.Text);

    valor_bc_st:= StrToFloat(EdtBase_ICMS_Substituicao.Text);
    valor_st:= StrToFloat(EdtValor_ICMS_Substituicao.Text);

    valor_ipi:= StrToFloat(EdtValor_IPI.Text);
    icms:= StrToFloat(EdtICMS.Text);
    iva:= StrToFloat(EdtIVA.Text);

    total_produtos:= StrToFloat(EdtTotal_Produtos.Text);

    if (tipo_recolhimento = 'ST') or (EdtSituacao_Tributaria.Text = '010') or (EdtSituacao_Tributaria.Text = '030') or
       (EdtSituacao_Tributaria.Text = '060') or (EdtSituacao_Tributaria.Text = '070') or (EdtSituacao_Tributaria.Text = '210')
       or (EdtSituacao_Tributaria.Text = '110') then
    begin
      valor_icms_nota:= (valor_total_item * ( icms / 100) );     //valor total do item sem ipi, para calcular o icms normal
      valor_icms_nota:= Calcula_Valor(FloatToStr(valor_icms_nota));

      valor_total_item:= valor_total_item + valor_ipi;

      bc_st:= (valor_total_item * ( iva / 100) ); //valor total do item + ipi + %IVA
      bc_st:= Calcula_Valor(FloatToStr(bc_st));
      bc_st:= valor_total_item + bc_st;
      bc_st_acu:= bc_st_acu + bc_st;

      valor_icms_interno:= bc_st * 0.17;           //17% é a aliquota do estado de goiás
      valor_icms_interno:= Calcula_Valor(FloatToStr(valor_icms_interno));

      //falta multiplicar pela aliquota externa e depois sim, a linha de baixo, subtrair

      valor_icms_st:= (valor_icms_nota - valor_icms_interno);
      valor_icms_st:= Abs(valor_icms_st);
      valor_icms_st:= Calcula_Valor(FloatToStr(valor_icms_st));

      valor_icms_st_acu:= valor_icms_st_acu + valor_icms_st;


      EdtBC_ICMS_ST.Text:= FormatFloat('#0.0,00', bc_st);
      EdtBC_ICMS_ST.Text:= StringReplace(EdtBC_ICMS_ST.Text, ThousandSeparator, '', [rfReplaceAll]);

      EdtValor_ICMS_ST.Text:= FormatFloat('#0.0,00', valor_icms_st);
      EdtValor_ICMS_ST.Text:= StringReplace(EdtValor_ICMS_ST.Text, ThousandSeparator, '', [rfReplaceAll]);
    end;
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - Calcula_Perc_Despesa - '+E.Message);
  end;
end;

procedure TFrmEntrada_Produtos.Calcula_Frete;
var
  valor_total_item, perc, somatoria, cdi, icms, valor_icms_st, valor_icms_nota, valor_icms_interno, total_produtos, valor_ipi, iva,
  valor_bc_st, valor_st, bc_st: double; //cdi = Custo Despesa Item
begin
  try
    //if (CBIncluir.Checked) then
    //begin

      //TLog.Debug('Marcou a opção Incluir Despesas.');
      //Verifica_Despesas;

      valor_total_item:= 0;
      total_produtos:= 0;
      perc:= 0;
      somatoria:= 0;

      valor_total_item:= StrToFloat(EdtValor_Total.Text);
      TLog.Debug('Valor Total: '+FloatToStr(valor_total_item));

      total_produtos:= StrToFloat(EdtTotal_Produtos.Text);
      TLog.Debug('Valor Total de Produtos: '+FloatToStr(total_produtos));

      perc:= valor_total_item / total_produtos;
      TLog.Debug('Percentual: '+FloatToStr(perc));

      somatoria:= ( StrToFloat(EdtValor_Frete.Text) + StrToFloat(EdtValor_Seguro.Text) + StrToFloat(EdtOutras_Despesas.Text) - StrToFloat(EdtDesconto.Text) );
      TLog.Debug('Somatória: '+FloatToStr(somatoria));

      cdi:= Calcula_Valor_Tres_Casas(FloatToStr(perc * somatoria));
      TLog.Debug('Valor de despesas: '+FloatToStr(cdi));

      EdtValor_Unitario_Frete.Text:= FormatFloat('#0.0,00', cdi);
      EdtValor_Unitario_Frete.Text:= StringReplace(EdtValor_Unitario_Frete.Text, ThousandSeparator, '', [rfReplaceAll]);
    //end
    //else
    //begin
    //  TLog.Debug('Não marcou a opção Incluir Despesas.');
    //  EdtValor_Unitario_Frete.Text:= '0,00';
    //end;
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - Calcula_Frete - '+E.Message);
  end;
end;

procedure TFrmEntrada_Produtos.Calcula_Perc_Despesa_ST;
var
  valor_total_item, perc, somatoria, cdi, icms, valor_icms_st, total_produtos: double; //cdi = Custo Despesa Item
begin
  try
    if (EdtTotal_Produtos.Text = '') or (EdtTotal_Produtos.Text = '0,00') or (EdtTotal_Produtos.Text = '0') then
    begin
      EdtTotal_Produtos.SetFocus;
      Mensagem_Falta_Dados;
      abort;
    end;

    valor_total_item:= StrToFloat(EdtValor_Total.Text);
    total_produtos:= StrToFloat(EdtTotal_Produtos.Text);
    icms:= StrToFloat(EdtICMS.Text);
    valor_icms_st:= (valor_total_item * ( icms / 100) );

    if (tipo_recolhimento = 'ST') then
      valor_total_item:= (valor_total_item - valor_icms_st);

    perc:= Calcula_Valor(FloatToStr(valor_total_item / total_produtos));
    somatoria:= ( StrToFloat(EdtValor_Frete.Text) + StrToFloat(EdtValor_Seguro.Text) + StrToFloat(EdtOutras_Despesas.Text) - StrToFloat(EdtDesconto.Text) );
    cdi:= Calcula_Valor(FloatToStr(perc * somatoria));
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - Calcula_Perc_Despesa_ST - '+E.Message);
  end;
end;

procedure TFrmEntrada_Produtos.Calcula_Total;
var
  total_nota, total_produtos, sub_total, ipi, total_ipi, bc_icms, valor_icms, bc_icms_st, valor_icms_st: double;
begin
  try
    total_produtos:= StrToFloat(EdtTotal_Produtos.Text);
    sub_total:= StrToFloat(EdtValor_Total.Text);
    ipi:= StrToFloat(EdtValor_IPI.Text);

    total_ipi:= StrToFloat(EdtTotal_IPI.Text);
    total_nota:=StrToFloat(EdtTotal_Nota.Text);
    bc_icms:= StrToFloat(EdtBase_ICMS.Text);
    valor_icms:= StrToFloat(EdtValor_ICMS.Text);

    bc_icms_st:= StrToFloat(EdtBase_ICMS_Substituicao.Text);
    valor_icms_st:= StrToFloat(EdtValor_ICMS_Substituicao.Text);

    total_ipi:= total_ipi + ipi;
    total_produtos:= total_produtos + sub_total;
    total_nota:= total_nota + sub_total;

    bc_icms_st:= bc_icms_st + StrToFloat(EdtBC_ICMS_ST.Text);
    valor_icms_st:= valor_icms_st + StrToFloat(EdtValor_ICMS_ST.Text);

    EdtBase_ICMS.Text:= FormatFloat('#0.0,00', bc_icms + StrToFloat(EdtBC_ICMS.Text));
    EdtBase_ICMS.Text:= StringReplace(EdtBase_ICMS.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtValor_ICMS.Text:= FormatFloat('#0.0,00', valor_icms + StrToFloat(EdtValor_ICMS_Unitario.Text));
    EdtValor_ICMS.Text:= StringReplace(EdtValor_ICMS.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtBase_ICMS_Substituicao.Text:= FormatFloat('#0.0,00', bc_icms_st);
    EdtBase_ICMS_Substituicao.Text:= StringReplace(EdtBase_ICMS_Substituicao.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtValor_ICMS_Substituicao.Text:= FormatFloat('#0.0,00', valor_icms_st );
    EdtValor_ICMS_Substituicao.Text:= StringReplace(EdtValor_ICMS_Substituicao.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtTotal_Nota.Text:= FormatFloat('#0.0,00', total_nota);
    EdtTotal_Nota.Text:= StringReplace(EdtTotal_Nota.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtTotal_Produtos.Text:= FormatFloat('#0.0,00', total_produtos);
    EdtTotal_Produtos.Text:= StringReplace(EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtTotal_IPI.Text:= FormatFloat('#0.0,00', total_ipi);
    EdtTotal_IPI.Text:= StringReplace(EdtTotal_IPI.Text, ThousandSeparator, '', [rfReplaceAll]);
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - Calcula_Total - '+E.Message);
  end;

end;

procedure TFrmEntrada_Produtos.Calcula_Total_Deletado;
var
  total_nota, total_produtos, sub_total, ipi, total_ipi, total_bc_icms_st, total_valor_icms_st,
  bc_icms, valor_icms, bc_icms_st, valor_icms_st, total_bc_icms, total_valor_icms: double;
begin
  try
    total_produtos:= StrToFloat(EdtTotal_Produtos.Text);
    sub_total:= qryitens_entradaValor_Total.AsFloat;
    ipi:= qryitens_entradaValor_IPI.AsFloat;
    bc_icms:= qryitens_entradaBC_ICMS.AsFloat;
    valor_icms:= qryitens_entradaValor_ICMS_Unitario.AsFloat;

    bc_icms_st:= qryitens_entradaBC_ICMS_ST.AsFloat;
    valor_icms_st:= qryitens_entradaValor_ICMS_ST.AsFloat;

    total_ipi:= StrToFloat(EdtTotal_IPI.Text);
    total_nota:=StrToFloat(EdtTotal_Nota.Text);
    total_bc_icms:=StrToFloat(EdtBase_ICMS.Text);
    total_valor_icms:=StrToFloat(EdtValor_ICMS.Text);

    total_bc_icms_st:= StrToFloat(EdtBase_ICMS_Substituicao.Text) - bc_icms_st;
    total_valor_icms_st:= StrToFloat(EdtValor_ICMS_Substituicao.Text) - valor_icms_st;

    qtde:= StrToInt(EdtQuantidade_Itens.Text);
    dec(qtde);

    total_ipi:= total_ipi - ipi;
    total_produtos:= total_produtos - sub_total;
    total_nota:= total_nota - sub_total;
    total_bc_icms:= total_bc_icms - bc_icms;
    total_valor_icms:= total_valor_icms - valor_icms;

    EdtQuantidade_Itens.Text:= IntToStr(qtde);

    EdtBase_ICMS.Text:= FormatFloat('#0.0,0', total_bc_icms);
    EdtBase_ICMS.Text:= StringReplace(EdtBase_ICMS.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtValor_ICMS.Text:= FormatFloat('#0.0,0', total_valor_icms);
    EdtValor_ICMS.Text:= StringReplace(EdtValor_ICMS.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtBase_ICMS_Substituicao.Text:= FormatFloat('#0.0,0', total_bc_icms_st);
    EdtBase_ICMS_Substituicao.Text:= StringReplace(EdtBase_ICMS_Substituicao.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtValor_ICMS_Substituicao.Text:= FormatFloat('#0.0,0', total_valor_icms_st);
    EdtValor_ICMS_Substituicao.Text:= StringReplace(EdtValor_ICMS_Substituicao.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtTotal_Nota.Text:= FormatFloat('#0.0,0', total_nota);
    EdtTotal_Nota.Text:= StringReplace(EdtTotal_Nota.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtTotal_Produtos.Text:= FormatFloat('#0.0,0', total_produtos);
    EdtTotal_Produtos.Text:= StringReplace(EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtTotal_IPI.Text:= FormatFloat('#0.0,0', total_ipi);
    EdtTotal_IPI.Text:= StringReplace(EdtTotal_IPI.Text, ThousandSeparator, '', [rfReplaceAll]);
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - Calcula_Total_Deletado - '+E.Message);
  end;
end;

procedure TFrmEntrada_Produtos.CBGeraClick(Sender: TObject);
begin
  if (CBGera.Checked = false) then
  begin
    EdtCodigo_Condicao_Pagamento.Visible:= false;
    EdtCondicao_Pagamento.Visible:= false;
    MEdtData_Primeira_Parcela.Visible:= false;
    Label18.Visible:= false;
    Label19.Visible:= false;
  end
  else
  begin
    EdtCodigo_Condicao_Pagamento.Visible:= true;
    EdtCondicao_Pagamento.Visible:= true;
    MEdtData_Primeira_Parcela.Visible:= true;
    Label18.Visible:= true;
    Label19.Visible:= true;
  end;
end;

procedure TFrmEntrada_Produtos.CBGera_EtiquetaClick(Sender: TObject);
begin
  if (CBGera_Etiqueta.Checked = false) then
  begin
    EdtCodigo_Etiqueta.Visible:= false;
    EdtEtiqueta.Visible:= false;
    Label20.Visible:= false;
  end
  else
  begin
    EdtCodigo_Etiqueta.Visible:= true;
    EdtEtiqueta.Visible:= true;
    Label20.Visible:= true;
  end;
end;

procedure TFrmEntrada_Produtos.CBIncluirExit(Sender: TObject);
begin
  {if (CBIncluir.Checked) then
  begin
    Application.MessageBox(PChar('Você optou por adicionar as despesas da Nota Fiscal ao custo do produto, portanto, preencha os campos referêntes ao: ' +
    #13 + 'Valor Total de Produtos' + #13 + 'Valor Total da Nota' + #13 + 'Valor do Frete' + #13 + 'Valor do Seguro' + #13 + 'Outras Despesas' + #13 + 'Desconto'), 'Aviso', MB_OK+MB_ICONQUESTION);
    EdtTotal_Produtos.SetFocus;
  end;}
end;

procedure TFrmEntrada_Produtos.CBIncluirMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  //CBIncluir.Hint:= 'Marque esta opção, caso queira incluir Frete, Seguro, Outras Despesas ou Desconto no custo do produto.'#13'Preencha o rodapé da NF e lance os produtos.';
end;

procedure TFrmEntrada_Produtos.CBPedidoClick(Sender: TObject);
begin
  {if (CBPedido.Checked) then
  begin
    Label22.Visible:= true;
    EdtPedido.Visible:= true;
  end
  else
  begin
    Label22.Visible:= false;
    EdtPedido.Visible:= false;
  end;}
end;

function TFrmEntrada_Produtos.Chama_Entrada: boolean;
var
  FComando: TComandoSQLEntidade;
begin
  try
    qAuxItensNota:= TADOQuery.Create(self);
    qAuxItensNota.Connection:= Conexao;
    FComando:= TComandoSQLEntidade.Create;
    FComando.Conexao:= Conexao;
    FComando.ComandoSQL:= 'Select EP.*, IE.*, TE.*, Forn.Nome_Fantasia, CFOP.CFOP, CFOP.Descricao, Cid.UF,'+
      'Trans.Nome_Fantasia as Nome_Transportadora, Vei.Placa, Vei.UF, Caixa_ECF from Entrada_Produtos EP '+
      'left join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal) '+
      'left join Transporte_Entrada TE on (EP.N_Nota_Fiscal = TE.N_Nota_Fiscal) '+
      'left join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo) '+
      'left join Cadastro_CFOP CFOP on (EP.Codigo_CFOP = CFOP.Codigo) ' +
      'left join Cidade Cid on (Forn.Codigo_Cidade = Cid.Codigo) ' +
      'left join Transportadora Trans on (TE.Codigo_Transportadora = Trans.Codigo) '+
      'left join Veiculo Vei on (TE.Codigo_Veiculo = Vei.Codigo) '+
      'where EP.Status = :Status and EP.N_Nota_Fiscal = :N_Nota_Fiscal';
    FComando.Parametros.Add('Status');
    FComando.Parametros.Add('N_Nota_Fiscal');
    FComando.Valores.Add('N');
    FComando.Valores.Add(EdtN_Nota_Fiscal.Text);
    FComandosSQL:= TComandoSQLDominio.Create(FComando);
    FComandosSQL.ExecutaComandoSQLRetornaADOQuery(qAuxItensNota);

    {with qAuxItensNota, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('Select EP.*, IE.*, TE.*, Forn.Nome_Fantasia, CFOP.CFOP, CFOP.Descricao, Cid.UF,');
      add('Trans.Nome_Fantasia as Nome_Transportadora, Vei.Placa, Vei.UF, Caixa_ECF from Entrada_Produtos EP');
      add('left join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal)');
      add('left join Transporte_Entrada TE on (EP.N_Nota_Fiscal = TE.N_Nota_Fiscal)');
      add('left join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');
      add('left join Cadastro_CFOP CFOP on (EP.Codigo_CFOP = CFOP.Codigo)');
      add('left join Cidade Cid on (Forn.Codigo_Cidade = Cid.Codigo)');
      add('left join Transportadora Trans on (TE.Codigo_Transportadora = Trans.Codigo)');
      add('left join Veiculo Vei on (TE.Codigo_Veiculo = Vei.Codigo)');
      add('where EP.Status = :Status and EP.N_Nota_Fiscal = :N_Nota_Fiscal');
      Parameters.ParamByName('N_Nota_Fiscal').Value:= EdtN_Nota_Fiscal.Text;
      Parameters.ParamByName('Status').Value:= 'N';
      open;
    end;}

    if (qAuxItensNota.IsEmpty = false) then
    begin
      Result:= true;
      {with qryitens_entrada, sql do
      begin
        close;
        clear;
        add('select IE.*, P.Codigo_Venda, P.Descricao, P.Estoque,');
        add('P.Saldo_Estoque, P.Volume, M.Descricao as Marca from Itens_Entrada IE');
        add('inner join Produto P on(IE.Codigo_Produto = P.Codigo)');
        add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
        add('where IE.N_Nota_Fiscal = :N_Nota_Fiscal');
        Parameters.ParamByName('N_Nota_Fiscal').Value:= EdtN_Nota_Fiscal.Text;
        open;
      end;}
    end
    else
      Result:= false;
  except
    on E : Exception do
    begin
      TLog.Error(Self.ClassName+' - Chama_Entrada - '+E.Message);
      TMensagens.MensagemErro('Método Chama_Entrada: '+E.Message);
    end;
  end;
end;

function TFrmEntrada_Produtos.Confira: boolean;
begin
  Confira:= false;

  if EdtN_Nota_Fiscal.Text = '' then
    begin
      Mensagem_Falta_Dados;
      EdtN_Nota_Fiscal.SetFocus;
      exit;
    end;

  if EdtModelo.Text = '' then
    begin
      Mensagem_Falta_Dados;
      EdtModelo.SetFocus;
      exit;
    end;

  if EdtSerie.Text = '' then
    begin
      Mensagem_Falta_Dados;
      EdtSerie.SetFocus;
      exit;
    end;

  if MEdtData_Emissao.Text = '  /  /    ' then
    begin
      Mensagem_Falta_Dados;
      MEdtData_Emissao.SetFocus;
      exit;
    end;

  if MEdtData_Entrada.Text = '  /  /    ' then
    begin
      Mensagem_Falta_Dados;
      MEdtData_Entrada.SetFocus;
      exit;
    end;

  if EdtCodigo_Fornecedor.Text = '' then
    begin
      Mensagem_Falta_Dados;
      EdtCodigo_Fornecedor.SetFocus;
      exit;
    end;

  if EdtCodigo_CFOP.Text = '' then
    begin
      Mensagem_Falta_Dados;
      EdtCodigo_CFOP.SetFocus;
      exit;
    end;

  if EdtBase_ICMS.Text = '' then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex:= 0;
      EdtBase_ICMS.SetFocus;
      exit;
    end;

  if EdtValor_ICMS.Text = '' then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex:= 0;
      EdtValor_ICMS.SetFocus;
      exit;
    end;

  if EdtBase_ICMS_Substituicao.Text = '' then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex:= 0;
      EdtBase_ICMS_Substituicao.SetFocus;
      exit;
    end;

  if EdtValor_ICMS_Substituicao.Text = '' then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex:= 0;
      EdtValor_ICMS_Substituicao.SetFocus;
      exit;
    end;

  if EdtValor_Frete.Text = '' then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex:= 0;
      EdtValor_Frete.SetFocus;
      exit;
    end;

  if EdtValor_Seguro.Text = '' then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex:= 0;
      EdtValor_Seguro.SetFocus;
      exit;
    end;

  if EdtOutras_Despesas.Text = '' then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex:= 0;
      EdtOutras_Despesas.SetFocus;
      exit;
    end;

  if EdtTotal_IPI.Text = '' then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex:= 0;
      EdtTotal_IPI.SetFocus;
      exit;
    end;

  if EdtDesconto.Text = '' then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex:= 0;
      EdtDesconto.SetFocus;
      exit;
    end;

  if EdtTotal_Nota.Text = '' then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex:= 0;
      EdtTotal_Nota.SetFocus;
      exit;
    end;

    Confira:= true;
end;

function TFrmEntrada_Produtos.Confira_Itens_Entrada: boolean;
begin
  Confira_Itens_Entrada:= false;

  if EdtN_Nota_Fiscal.Text = '' then
    begin
      Mensagem_Falta_Dados;
      EdtN_Nota_Fiscal.SetFocus;
      exit;
    end;

  if EdtModelo.Text = '' then
    begin
      Mensagem_Falta_Dados;
      EdtModelo.SetFocus;
      exit;
    end;

  if EdtSerie.Text = '' then
    begin
      Mensagem_Falta_Dados;
      EdtSerie.SetFocus;
      exit;
    end;

  if MEdtData_Emissao.Text = '  /  /    ' then
    begin
      Mensagem_Falta_Dados;
      MEdtData_Emissao.SetFocus;
      exit;
    end;

  if MEdtData_Entrada.Text = '  /  /    ' then
    begin
      Mensagem_Falta_Dados;
      MEdtData_Entrada.SetFocus;
      exit;
    end;

  if EdtCodigo_Fornecedor.Text = '' then
    begin
      Mensagem_Falta_Dados;
      EdtCodigo_Fornecedor.SetFocus;
      exit;
    end;

  if EdtCodigo_CFOP.Text = '' then
    begin
      Mensagem_Falta_Dados;
      EdtCodigo_CFOP.SetFocus;
      exit;
    end;

  if (EdtPercentual_Lucro_Vista.Text = '') then
    begin
      Mensagem_Falta_Dados;
      EdtPercentual_Lucro_Vista.SetFocus;
      exit;
    end;

  if (EdtValor_Vista.Text = '') then
    begin
      Mensagem_Falta_Dados;
      EdtValor_Vista.SetFocus;
      exit;
    end;

  if (EdtPercentual_Lucro_Prazo.Text = '') then
    begin
      Mensagem_Falta_Dados;
      EdtPercentual_Lucro_Prazo.SetFocus;
      exit;
    end;

  if (EdtValor_Prazo.Text = '') then
    begin
      Mensagem_Falta_Dados;
      EdtValor_Prazo.SetFocus;
      exit;
    end;

  if (EdtQuantidade_Volume.Text = '') then
    begin
      Mensagem_Falta_Dados;
      EdtQuantidade_Volume.SetFocus;
      exit;
    end;

    Confira_Itens_Entrada:= true;
end;

procedure TFrmEntrada_Produtos.PreencheObjetoIE;
begin
  try
    FItens_Entrada:= TItensEntradaEntidade.Create;

    FItens_Entrada.Codigo:= qryitens_entradaCodigo.AsInteger;
    FItens_Entrada.N_Item:= qryitens_entradaN_Item.AsString;
    FItens_Entrada.N_Nota_Fiscal:= qryitens_entradaN_Nota_Fiscal.AsString;
    FItens_Entrada.Codigo_Produto:= qryitens_entradaCodigo_Produto.AsInteger;
    FItens_Entrada.NCM:= qryitens_entradaNCM.AsString;
    FItens_Entrada.Unidade:= qryitens_entradaUnidade.AsString;
    FItens_Entrada.ST:= qryitens_entradaST.AsString;
    FItens_Entrada.Valor_Ultima_Compra:= qryitens_entradaValor_Ultima_Compra.AsFloat;
    FItens_Entrada.Valor_Unitario:= qryitens_entradaValor_Unitario.AsFloat;
    FItens_Entrada.Quantidade:= qryitens_entradaQuantidade.AsFloat;
    FItens_Entrada.Quantidade_Restante:= qryitens_entradaQuantidade_Restante.AsFloat;
    FItens_Entrada.Valor_Total:= qryitens_entradaValor_Total.AsFloat;
    FItens_Entrada.Valor_Frete_Unitario:= qryitens_entradaValor_Frete_Unitario.AsFloat;
    FItens_Entrada.Quantidade_Volume:= qryitens_entradaQuantidade_Volume.AsFloat;
    FItens_Entrada.BC_ICMS:= qryitens_entradaBC_ICMS.AsFloat;
    FItens_Entrada.Aliquota_ICMS:= qryitens_entradaAliquota_ICMS.AsString;
    FItens_Entrada.Aliquota_IPI:= qryitens_entradaAliquota_IPI.AsString;
    FItens_Entrada.CFOP:= qryitens_entradaCFOP.AsString;
    FItens_Entrada.Valor_ICMS_Unitario:= qryitens_entradaValor_ICMS_Unitario.AsFloat;
    FItens_Entrada.Valor_IPI:= qryitens_entradaValor_IPI.AsFloat;
    FItens_Entrada.Custo_Unitario:= qryitens_entradaCusto_Unitario.AsFloat;
    FItens_Entrada.Percentual_Lucro_Vista:= qryitens_entradaPercentual_Lucro_Vista.AsFloat;
    FItens_Entrada.Valor_Vista:= qryitens_entradaValor_Vista.AsFloat;
    FItens_Entrada.Percentual_Lucro_Prazo:= qryitens_entradaPercentual_Lucro_Prazo.AsFloat;
    FItens_Entrada.Valor_Prazo:= qryitens_entradaValor_Prazo.AsFloat;
    FItens_Entrada.Valor_Vista_Ultimo:= qryitens_entradaValor_Vista_Ultimo.AsFloat;
    FItens_Entrada.Valor_Prazo_Ultimo:= qryitens_entradaValor_Prazo_Ultimo.AsFloat;
    FItens_Entrada.IVA:= qryitens_entradaIVA.AsFloat;
    FItens_Entrada.BC_ICMS_ST:= qryitens_entradaBC_ICMS_ST.AsFloat;
    FItens_Entrada.Valor_ICMS_ST:= qryitens_entradaValor_ICMS_ST.AsFloat;
    FItens_Entrada.Checado:= qryitens_entradaChecado.AsString;
    FItens_Entrada.Codigo_Produto_Fornecedor:= qryitens_entradaCodigo_Produto_Fornecedor.AsString;
    FItens_Entrada.Descricao_Produto:= qryitens_entradaDescricao_Produto.AsString;
    FItens_Entrada.Valor_Ultima_Compra_Unitario:= qryitens_entradaValor_Ultima_Compra_Unitario.AsFloat;
    FItens_Entrada.Qtde_Estoque_Atual:= qryitens_entradaQtde_Estoque_Atual.AsFloat;
    FItens_Entrada.Codigo_Registro:= qryitens_entradaCodigo_Registro.AsInteger;
    FItens_Entrada.Ficha_Estoque_Codigo:= qryitens_entradaFicha_Estoque_Codigo.AsInteger;
    FItens_Entrada.Data_Validade:= qryitens_entradaData_Validade.AsDateTime;
  except on E:Exception do
  begin
    TLog.Error(Self.ClassName+' - DBGrid1CellClick - '+E.Message);
    TMensagens.MensagemErro('Método DBGrid1CellClick: '+E.Message);
  end;
  end;
end;

procedure TFrmEntrada_Produtos.DBGrid1CellClick(Column: TColumn);
begin
  PreencheObjetoIE;
end;

procedure TFrmEntrada_Produtos.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmEntrada_Produtos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
    if (key = vk_delete) then
    begin
      if (Confirma_Delete = true) then
        begin
          //if (qryitens_entradaChecado.AsString = 'S') then
            //Atualiza_Itens_Cancelado;

          //if (achei = True) then
            //removerFichaEstoque;

          FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
          FItensEntradaDominio.RemoveItem(qryitens_entradaCodigo_Produto.AsInteger, qryitens_entradaCodigo.AsInteger);
          //Itens_Entrada.Excluir(Itens_Entrada);

          Pega_Total_Impostos;
          Atualiza_Dados;
        end;
    end;

  except
    on E : Exception do
    begin
      TLog.Error(Self.ClassName+' - DBGrid1KeyDown - '+E.Message);
      TMensagens.MensagemErro('Método DBGrid1KeyDown: '+E.Message);
    end;
  end;
end;

procedure TFrmEntrada_Produtos.DBGrid3DrawColumnCell(Sender: TObject;
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

procedure TFrmEntrada_Produtos.EdtAliquota_ICMSKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtBase_ICMSExit(Sender: TObject);
begin
  TConfigs.VerificaCampoEmBranco(EdtBase_ICMS);
end;

procedure TFrmEntrada_Produtos.EdtBase_ICMSKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtBase_ICMS_SubstituicaoExit(Sender: TObject);
begin
  TConfigs.VerificaCampoEmBranco(EdtBase_ICMS_Substituicao);
end;

procedure TFrmEntrada_Produtos.EdtBase_ICMS_SubstituicaoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtBC_ICMSEnter(Sender: TObject);
begin
  FItensEntradaDominio.CalculaBCICMS(FItens_Entrada);
  EdtBC_ICMS.Text:= FloatToStr(FItens_Entrada.BC_ICMS);
end;

procedure TFrmEntrada_Produtos.EdtBC_ICMSExit(Sender: TObject);
begin
  if (EdtBC_ICMS.Text = '') then
  begin
    Valor_Invalido;
    EdtBC_ICMS.SetFocus;
    exit;
  end;

  FItens_Entrada.BC_ICMS:= StrToFloat(EdtBC_ICMS.Text);
  EdtBC_ICMS.Text:= FormatFloat('#0.0,0', StrToFloat(EdtBC_ICMS.Text));
  EdtBC_ICMS.Text:= StringReplace(EdtBC_ICMS.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmEntrada_Produtos.EdtBC_ICMSKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtBC_ICMS_STEnter(Sender: TObject);
begin
  if (EdtSituacao_Tributaria.Text = '010') or (EdtSituacao_Tributaria.Text = '030') or
     (EdtSituacao_Tributaria.Text = '060') or (EdtSituacao_Tributaria.Text = '070') or
     (EdtSituacao_Tributaria.Text = '210') or (EdtSituacao_Tributaria.Text = '110') then
  begin
    FItensEntradaDominio.CalculaBCICMSST(FItens_Entrada);
    EdtBC_ICMS_ST.Text:= FloatToStr(FItens_Entrada.BC_ICMS_ST);
    //EdtValor_ICMS_ST.Text:= FloatToStr(FItens_Entrada.Valor_ICMS_ST);
  end
  else
  begin
    FItens_Entrada.BC_ICMS_ST:= 0;
    //FItens_Entrada.Valor_ICMS_ST:= 0;
    EdtBC_ICMS_ST.Text:= '0';
    //EdtValor_ICMS_ST.Text:= '0';
  end;
end;

procedure TFrmEntrada_Produtos.EdtBC_ICMS_STExit(Sender: TObject);
begin
  try
    if (EdtBC_ICMS_ST.Text = '') then
    begin
      Valor_Invalido;
      EdtBC_ICMS_ST.SetFocus;
      exit;
    end;
    FItens_Entrada.BC_ICMS_ST:= StrToFloat(EdtBC_ICMS_ST.Text);
    EdtBC_ICMS_ST.Text:= FormatFloat('#0.0,0', StrToFloat(EdtBC_ICMS_ST.Text));
    EdtBC_ICMS_ST.Text:= StringReplace(EdtBC_ICMS_ST.Text, ThousandSeparator, '', [rfReplaceAll]);
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - EdtBC_ICMS_STExit - '+E.Message);
  end;
end;

procedure TFrmEntrada_Produtos.EdtBC_ICMS_STKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtCFOP2DblClick(Sender: TObject);
begin
  cfop:= 2;
  Application.CreateForm(TFrmChama_CFOP, FrmChama_CFOP);
  FrmChama_CFOP.ShowModal;
  FrmChama_CFOP.Free;
end;

procedure TFrmEntrada_Produtos.EdtCFOP2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    cfop:= 2;
    Application.CreateForm(TFrmChama_CFOP, FrmChama_CFOP);
    FrmChama_CFOP.ShowModal;
    FrmChama_CFOP.Free;
  end;
end;

procedure TFrmEntrada_Produtos.EdtCFOP2KeyPress(Sender: TObject; var Key: Char);
begin
//  Util.Somente_Apaga(key);
end;

procedure TFrmEntrada_Produtos.EdtCFOPKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmEntrada_Produtos.EdtCodigo_CFOPDblClick(Sender: TObject);
begin
  cfop:= 1;
  Application.CreateForm(TFrmChama_CFOP, FrmChama_CFOP);
  FrmChama_CFOP.ShowModal;
  FrmChama_CFOP.Free;
end;

procedure TFrmEntrada_Produtos.EdtCodigo_CFOPExit(Sender: TObject);
begin
  Busca_Cadastro_CFOP(EdtCodigo_CFOP, EdtCFOP, EdtCFOP2);
end;

procedure TFrmEntrada_Produtos.EdtCodigo_CFOPKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    cfop:= 1;
    Application.CreateForm(TFrmChama_CFOP, FrmChama_CFOP);
    FrmChama_CFOP.ShowModal;
    FrmChama_CFOP.Free;
  end;
end;

procedure TFrmEntrada_Produtos.EdtCodigo_CFOPKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmEntrada_Produtos.EdtCodigo_Condicao_PagamentoDblClick(
  Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
  FrmChama_Condicao_Pagamento.ShowModal;
  FrmChama_Condicao_Pagamento.Free;
end;

procedure TFrmEntrada_Produtos.EdtCodigo_Condicao_PagamentoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
      FrmChama_Condicao_Pagamento.ShowModal;
      FrmChama_Condicao_Pagamento.Free;
    end;
end;

procedure TFrmEntrada_Produtos.EdtCodigo_Condicao_PagamentoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmEntrada_Produtos.EdtCodigo_EtiquetaDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Etiqueta, FrmChama_Etiqueta);
  FrmChama_Etiqueta.ShowModal;
  FrmChama_Etiqueta.Free;
end;

procedure TFrmEntrada_Produtos.EdtCodigo_EtiquetaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Etiqueta, FrmChama_Etiqueta);
      FrmChama_Etiqueta.ShowModal;
      FrmChama_Etiqueta.Free;
    end;
end;

procedure TFrmEntrada_Produtos.EdtCodigo_EtiquetaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmEntrada_Produtos.EdtCodigo_FornecedorDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Fornecedor, FrmChama_Fornecedor);
  FrmChama_Fornecedor.ShowModal;
  FrmChama_Fornecedor.Free;
end;

procedure TFrmEntrada_Produtos.EdtCodigo_FornecedorExit(Sender: TObject);
begin
  //Verifica_Nota;
  //Busca_Cadastro_Fornecedor(EdtCodigo_Fornecedor, EdtFornecedor, uf_destino);
end;

procedure TFrmEntrada_Produtos.EdtCodigo_FornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Fornecedor, FrmChama_Fornecedor);
    FrmChama_Fornecedor.ShowModal;
    FrmChama_Fornecedor.Free;
  end;
end;

procedure TFrmEntrada_Produtos.EdtCodigo_FornecedorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmEntrada_Produtos.EdtCodigo_ProdutoDblClick(Sender: TObject);
begin
  if EdtCodigo_Fornecedor.Text = '' then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Fornecedor.SetFocus;
    exit;
  end;

  Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
  FrmChama_Produto.ShowModal;
  FrmChama_Produto.Free;

end;

function TFrmEntrada_Produtos.VerificaItensEmBranco: boolean;
begin
  result:= false;
  if (EdtTotal_Produtos.Text = '') or (EdtTotal_Produtos.Text = '0') or (EdtTotal_Produtos.Text = '0,00') then
  begin
    TMensagens.MensagemErro('O campo Total de Produtos está nulo. Por favor, preencha com o total de produtos da nota fiscal.');
    EdtTotal_Produtos.SetFocus;
    Result:= true;
    exit;
  end;

  if (EdtTotal_Nota.Text = '') or (EdtTotal_Nota.Text = '0') or (EdtTotal_Nota.Text = '0,00') then
  begin
    TMensagens.MensagemErro('O campo Total da Nota está nulo. Por favor, preencha com o total da nota.');
    EdtTotal_Nota.SetFocus;
    Result:= true;
    exit;
  end;

  if (EdtValor_Frete.Text = '') or (EdtValor_Frete.Text = '0') or (EdtValor_Frete.Text = '0,00') then
  begin
    TMensagens.MensagemWarning('O campo Total do Frente está nulo. O sistema permitirá prosseguir com o lançamento das informações, porém, não calculará o frente proporcional para cada item da nota fiscal.');
  end;

  if (EdtValor_Seguro.Text = '') or (EdtValor_Seguro.Text = '0') or (EdtValor_Seguro.Text = '0,00') then
  begin
    TMensagens.MensagemWarning('O campo Total do Seguro está nulo. O sistema permitirá prosseguir com o lançamento das informações, porém, não calculará o valor do seguro proporcional para cada item da nota fiscal.');
  end;

  if (EdtOutras_Despesas.Text = '') or (EdtOutras_Despesas.Text = '0') or (EdtOutras_Despesas.Text = '0,00') then
  begin
    TMensagens.MensagemWarning('O campo Outras Despesas está nulo. O sistema permitirá prosseguir com o lançamento das informações, porém, não calculará o valor de outras despesas proporcional para cada item da nota fiscal.');
  end;

  if (EdtDesconto.Text = '') or (EdtDesconto.Text = '0') or (EdtDesconto.Text = '0,00') then
  begin
    TMensagens.MensagemWarning('O campo Desconto no rodapé da nota fiscal está nulo. O sistema permitirá prosseguir com o lançamento das informações, porém, não calculará o valor do desconto proporcional para cada item da nota fiscal.');
  end;

end;

procedure TFrmEntrada_Produtos.EdtCodigo_ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if EdtCodigo_Fornecedor.Text = '' then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Fornecedor.SetFocus;
    exit;
  end;

  if (key = vk_f3) then
  begin
    if (qryitens_entrada.Active = false) then
    begin
      if (VerificaItensEmBranco) then
      begin
        Exit;
      end;
    end
    else
    begin
      if (qryitens_entrada.RecordCount = 0) then
      begin
        if (VerificaItensEmBranco) then
        begin
          exit;
        end;
      end;
    end;

    PreencheObjetoImpostosEntrada;

    lanca_item:= true;
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free;
    lanca_item:= false;
  end;

  if (key = VK_RETURN) then
  begin
    Pega_Produto_Codigo;
  end;
end;

procedure TFrmEntrada_Produtos.Pega_Produto_Codigo;
var
  codigo_produto: AnsiString;
begin
  try
    codigo_produto:= StringOfChar('0', 13 - Length(EdtCodigo_Produto.Text)) + EdtCodigo_Produto.Text;
    if (dm.qrychama_produto.Locate('Codigo_Venda', codigo_produto, [])) then
    begin
      FrmEntrada_Produtos.LblProduto.Caption:= dm.qrychama_produtoCodigo.AsString;
      FrmEntrada_Produtos.EdtCodigo_Produto.Text:= dm.qrychama_produtoCodigo_Venda.AsString;
      FrmEntrada_Produtos.EdtProduto.Text:= dm.qrychama_produtoDescricao.AsString;
      FrmEntrada_Produtos.EdtUnidade.Text:= dm.qrychama_produtoSigla2.AsString;
      FrmEntrada_Produtos.EdtNCM.Text:= dm.qrychama_produtoNCM.AsString;

      Pega_ICMS_Entrada(dm.qrychama_produtoCodigo_Grupo_Tributacao.AsInteger, uf_destino, UDeclaracao.uf);
      FrmEntrada_Produtos.EdtSituacao_Tributaria.Text:= qAux_ICMS_Entrada.FieldByName('Origem').AsString + qAux_ICMS_Entrada.FieldByName('Codigo_Situacao').AsString;
      FrmEntrada_Produtos.EdtICMS.Text:= qAux_ICMS_Entrada.FieldByName('Aliquota').AsString;
      FrmEntrada_Produtos.tipo_recolhimento:= qAux_ICMS_Entrada.FieldByName('Tipo_Recolhimento').AsString;

      if (qAux_ICMS_Entrada.FieldByName('Percentual_BC_Acrescida').AsString <> '') then
        FrmEntrada_Produtos.base_acrescida:= qAux_ICMS_Entrada.FieldByName('Percentual_BC_Acrescida').AsFloat
      else
        FrmEntrada_Produtos.base_acrescida:= 0;

      if (qAux_ICMS_Entrada.FieldByName('Percentual_BC_Reduzida').AsString <> '') then
        FrmEntrada_Produtos.base_reduzida:= qAux_ICMS_Entrada.FieldByName('Percentual_BC_Reduzida').AsFloat
      else
        FrmEntrada_Produtos.base_reduzida:= 0;

      FrmEntrada_Produtos.EdtValor_Unitario.Text:= dm.qrychama_produtoValor_Compra.AsString;
      FrmEntrada_Produtos.valor_vista:= dm.qrychama_produtoPreco_Vista.AsFloat;
      FrmEntrada_Produtos.valor_prazo:= dm.qrychama_produtoPreco_Prazo.AsFloat;

      Pega_IPI_Entrada(dm.qrychama_produtoCodigo_Grupo_Tributacao_IPI.AsInteger);
      FrmEntrada_Produtos.EdtIPI.Text:= qAux_IPI_Entrada.FieldByName('Aliquota').AsString;

      FrmEntrada_Produtos.valor_compra:= dm.qrychama_produtoValor_Compra.AsFloat;
      FrmEntrada_Produtos.EdtPercentual_Lucro_Vista.Text:= dm.qrychama_produtoPVistaG.AsString;
      FrmEntrada_Produtos.EdtPercentual_Lucro_Prazo.Text:= dm.qrychama_produtoPPrazoG.AsString;

      permissao_compra:= dm.qrychama_produtoEm_Estoque_Maximo.AsString;
      estoque_minimo:= dm.qrychama_produtoEstoque_Minimo.AsFloat;
      estoque_maximo:= dm.qrychama_produtoEstoque_Maximo.AsFloat;
      qtde_estoque:= dm.qrychama_produtoEstoque.AsFloat;
    end;
  except
    on E : Exception do
    begin
      TLog.Error(Self.ClassName+' - Pega_Produto_Codigo - '+E.Message);
      TMensagens.MensagemErro('Método Pega_Produto_Codigo: '+E.Message);
    end;
  end;
end;

procedure TFrmEntrada_Produtos.EdtCodigo_ProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmEntrada_Produtos.EdtCodigo_TransportadoraDblClick(
  Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Transportadora, FrmChama_Transportadora);
  FrmChama_Transportadora.ShowModal;
  FrmChama_Transportadora.Free;
end;

procedure TFrmEntrada_Produtos.EdtCodigo_TransportadoraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Transportadora, FrmChama_Transportadora);
      FrmChama_Transportadora.ShowModal;
      FrmChama_Transportadora.Free;
    end;
end;

procedure TFrmEntrada_Produtos.EdtCodigo_TransportadoraKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmEntrada_Produtos.EdtCodigo_VeiculoDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Veiculo, FrmChama_Veiculo);
  FrmChama_Veiculo.ShowModal;
  FrmChama_Veiculo.Free;
end;

procedure TFrmEntrada_Produtos.EdtCodigo_VeiculoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Veiculo, FrmChama_Veiculo);
      FrmChama_Veiculo.ShowModal;
      FrmChama_Veiculo.Free;
    end;
end;

procedure TFrmEntrada_Produtos.EdtCodigo_VeiculoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmEntrada_Produtos.EdtCondicao_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmEntrada_Produtos.EdtCusto_TotalEnter(Sender: TObject);
var
  custo, qtde, custo_total: double;
begin
  try
    custo:= StrToFloat(EdtCusto_Unitario.Text);
    qtde:= StrToFloat(EdtQuantidade.Text);
    custo_total:= custo * qtde;

    EdtCusto_Total.Text:= FormatFloat('#0.0,0', custo_total);
    EdtCusto_Total.Text:= StringReplace(EdtCusto_Total.Text, ThousandSeparator, '', [rfReplaceAll]);
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - EdtCusto_TotalEnter - '+E.Message);
  end;
end;

procedure TFrmEntrada_Produtos.EdtCusto_TotalExit(Sender: TObject);
begin
  if (EdtCusto_Total.Text = '') then
  begin
    Valor_Invalido;
    EdtCusto_Total.SetFocus;
    exit;
  end;

  EdtCusto_Total.Text:= FormatFloat('#0.0,0', StrToFloat(EdtCusto_Total.Text));
  EdtCusto_Total.Text:= StringReplace(EdtCusto_Total.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmEntrada_Produtos.EdtCusto_TotalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtCusto_UnitarioEnter(Sender: TObject);
begin
  try
    FItensEntradaDominio.CalculaCustoTotal(FItens_Entrada);
    EdtCusto_Unitario.Text:= FloatToStr(FItens_Entrada.Custo_Unitario);
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - EdtCusto_UnitarioEnter - '+E.Message);
  end;
end;

procedure TFrmEntrada_Produtos.EdtCusto_UnitarioExit(Sender: TObject);
begin
  if (EdtCusto_Unitario.Text = '') then
  begin
    Valor_Invalido;
    EdtCusto_Unitario.SetFocus;
    exit;
  end;

  FItens_Entrada.Custo_Unitario:= StrToFloat(EdtCusto_Unitario.Text);
  EdtCusto_Unitario.Text:= FormatFloat('#0.0,0', StrToFloat(EdtCusto_Unitario.Text));
  EdtCusto_Unitario.Text:= StringReplace(EdtCusto_Unitario.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmEntrada_Produtos.EdtCusto_UnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtDescontoExit(Sender: TObject);
begin
  TConfigs.VerificaCampoEmBranco(EdtDesconto);
end;

procedure TFrmEntrada_Produtos.EdtDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtEtiquetaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmEntrada_Produtos.EdtFornecedorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmEntrada_Produtos.EdtICMSExit(Sender: TObject);
begin
  if (EdtICMS.Text = '') then
  begin
    Valor_Invalido;
    EdtICMS.SetFocus;
    exit;
  end;

  FItens_Entrada.Aliquota_ICMS:= EdtICMS.Text;
  {EdtICMS.Text:= FormatFloat('#0.0,0', StrToFloat(EdtICMS.Text));
  EdtICMS.Text:= StringReplace(EdtICMS.Text, ThousandSeparator, '', [rfReplaceAll]); }
end;

procedure TFrmEntrada_Produtos.EdtICMSKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtIPIExit(Sender: TObject);
begin
  if (EdtIPI.Text = '') then
  begin
    Valor_Invalido;
    EdtIPI.SetFocus;
    exit;
  end;
  FItens_Entrada.Aliquota_IPI:= EdtIPI.Text;
  {EdtIPI.Text:= FormatFloat('#0.0,0', StrToFloat(EdtIPI.Text));
  EdtIPI.Text:= StringReplace(EdtIPI.Text, ThousandSeparator, '', [rfReplaceAll]);}
end;

procedure TFrmEntrada_Produtos.EdtIPIKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtIsento_ICMSKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtIsento_IPIKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtIVAExit(Sender: TObject);
begin
  if (EdtIVA.Text = '') then
  begin
    Valor_Invalido;
    EdtIVA.SetFocus;
    exit;
  end;
  FItens_Entrada.IVA:= StrToFloat(EdtIVA.Text);
end;

procedure TFrmEntrada_Produtos.EdtIVAKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtModeloExit(Sender: TObject);
begin
  try
    EditCaixaECF.Enabled := ((Trim(EdtModelo.Text) = '2') or (Trim(EdtModelo.Text) = '02'));
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - EdtModeloExit - '+E.Message);
  end;
end;

procedure TFrmEntrada_Produtos.EdtN_Nota_FiscalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  FFormConsultaNFParaReferencia : TformConsultaNFParaReferencia;
begin
  FFormConsultaNFParaReferencia := TformConsultaNFParaReferencia.Create(Conexao);
  try
    try
      if (key = VK_F3) then begin
        FFormConsultaNFParaReferencia.ShowModal;
        if FFormConsultaNFParaReferencia.NumeroNotaFiscal > 0 then
          EdtN_Nota_Fiscal.Text := IntToStr(FFormConsultaNFParaReferencia.NumeroNotaFiscal);
      end;

      if (key = vk_return) then
      begin
        if (achei = false) then
        begin
          if (Chama_Entrada) then
          begin
            achei:= true;
            iniciado:= false;
            EdtN_Nota_Fiscal.ReadOnly:= true;
            Ver_Pedido;

            Pega_Total_Impostos;
            Atualiza_Dados;

            EdtCodigo_Produto.SetFocus;
            BBtnSalvar.Enabled:= true;
            BBtnExcluir.Enabled:= true;
            BBtnCancelar.Enabled:= true;
            BBtnCancela_Nota.Enabled:= true;
            BBtnCopia_Nota.Enabled:= false;
            EdtModeloExit(Self);
            //abort;
          end;
        end;
      end;
    except
      on E : Exception do
      begin
        TLog.Error(Self.ClassName+' - EdtN_Nota_FiscalKeyDown - '+E.Message);
        TMensagens.MensagemErro('Método EdtN_Nota_FiscalKeyDown: '+E.Message);
      end;
    end;
  finally
    FreeAndNil(FFormConsultaNFParaReferencia);
  end;
end;

procedure TFrmEntrada_Produtos.EdtN_Nota_FiscalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmEntrada_Produtos.EdtOutras_DespesasExit(Sender: TObject);
begin
  TConfigs.VerificaCampoEmBranco(EdtOutras_Despesas);
end;

procedure TFrmEntrada_Produtos.EdtOutras_DespesasKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtOutros_ICMSKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtOutros_IPIKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtPedidoExit(Sender: TObject);
var
  qAux: TADOQuery;
begin
  {try
    try
      if (EdtPedido.Text <> '') then
      begin
        qAux:= TADOQuery.Create(self);
        with qAux, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('select C.N_Pedido from Compra C');
          add('where C.N_Pedido = :Pedido');
          Parameters.ParamByName('Pedido').Value:= EdtPedido.Text;
          Open;
          if (IsEmpty) then
          begin
            Nao_Selecionado;
            EdtPedido.SetFocus;
            exit;
          end;
        end;

      end;
    except
      on E : Exception do
        TLog.Error(Self.ClassName+' - EdtPedidoExit - '+E.Message);
    end;
  finally
    FreeAndNil(qAux);
  end;}
end;

procedure TFrmEntrada_Produtos.EdtPercentual_Lucro_PrazoExit(Sender: TObject);
begin
  if (EdtPercentual_Lucro_Prazo.Text = '') then
  begin
    Valor_Invalido;
    EdtPercentual_Lucro_Prazo.SetFocus;
    exit;
  end;
  FItens_Entrada.Percentual_Lucro_Prazo:= StrToFloat(EdtPercentual_Lucro_Prazo.Text);
end;

procedure TFrmEntrada_Produtos.EdtPercentual_Lucro_PrazoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtPercentual_Lucro_VistaExit(Sender: TObject);
begin
  if (EdtPercentual_Lucro_Vista.Text = '') then
  begin
    Valor_Invalido;
    EdtPercentual_Lucro_Vista.SetFocus;
    exit;
  end;
  FItens_Entrada.Percentual_Lucro_Vista:= StrToFloat(EdtPercentual_Lucro_Vista.Text);
end;

procedure TFrmEntrada_Produtos.EdtPercentual_Lucro_VistaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtPeso_BrutoExit(Sender: TObject);
begin
  if (EdtPeso_Bruto.Text = '')then
  begin
    Valor_Invalido;
    EdtPeso_Bruto.SetFocus;
    exit;
  end;

end;

procedure TFrmEntrada_Produtos.EdtPeso_BrutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtPeso_LiquidoExit(Sender: TObject);
begin
  if (EdtPeso_Liquido.Text = '')then
  begin
    Valor_Invalido;
    EdtPeso_Liquido.SetFocus;
    exit;
  end;
end;

procedure TFrmEntrada_Produtos.EdtPeso_LiquidoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtPeso_TotalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmEntrada_Produtos.EdtQtdeKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmEntrada_Produtos.EdtQuantidadeExit(Sender: TObject);
begin
  if (EdtQuantidade.Text = '') or (EdtQuantidade.Text = '0') then
  begin
    Valor_Invalido;
    EdtQuantidade.SetFocus;
    exit;
  end;
  FItens_Entrada.Quantidade:= StrToFloat(EdtQuantidade.Text);
end;

procedure TFrmEntrada_Produtos.Pega_Produto_Compra;
var
  qAux: TADOQuery;
begin
  {try
    if (EdtPedido.Text <> '') and (CBPedido.Checked) then
    begin
      qAux:= TADOQuery.Create(self);
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('select IC.Qtde_Restante from Itens_Compra IC');
        add('where IC.N_Pedido = :Pedido and IC.Codigo_Produto = :Produto');
        Parameters.ParamByName('Pedido').Value:= EdtPedido.Text;
        Parameters.ParamByName('Produto').Value:= StrToInt(LblProduto.Caption);
        Open;
        if (IsEmpty = false) then
        begin
          //qtde_solicitada:= qAux.FieldByName('Qtde').AsFloat;
          qtde_restante:= qAux.FieldByName('Qtde_Restante').AsFloat;
          qtde_recebida:= StrToFloat(EdtQuantidade.Text);

          if (qtde_recebida > qtde_restante) then
            qtde_pendente:= (qtde_recebida - qtde_restante)
          else
            qtde_pendente:= (qtde_restante - qtde_recebida);
        end;
      end;
    end;

  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - Pega_Produto_Compra - '+E.Message);
  end;}
end;

procedure TFrmEntrada_Produtos.Pega_Total_Impostos;
var
  FComandoSQL: TComandoSQLEntidade;
  FComandoSQLDominio: TComandoSQLDominio;
begin
  try
    FComandoSQL:= TComandoSQLEntidade.Create;
    FComandoSQL.Conexao:= Conexao;
    FComandoSQL.ComandoSQL:=
      'select sum(Valor_Total) as Valor_Total, sum(Valor_Frete_Unitario) as Valor_Frete_Unitario, sum(BC_ICMS) as BC_ICMS, sum(Valor_ICMS_Unitario) as Valor_ICMS_Unitario,'+
      'sum(Valor_IPI) as Valor_IPI, sum(Custo_Unitario) as Custo_Unitario, sum(BC_ICMS_ST) as BC_ICMS_ST, sum(Valor_ICMS_ST) as Valor_ICMS_ST,'+
      'sum(Valor_Total + Valor_ICMS_ST + Valor_Frete_Unitario + Valor_IPI) as Valor_Total_Nota '+
      'from Itens_Entrada '+
      'where Codigo = :Codigo';
    FComandoSQL.Parametros.Add('Codigo');
    FComandoSQL.Valores.Add(EdtCodigo.Text);
    FComandoSQLDominio:= TComandoSQLDominio.Create(FComandoSQL);
    FComandoSQLDominio.ExecutaComandoSQLRetornaADOQuery(qryimpostos);
    qryimpostos.Open;

  {try
    with qryimpostos, sql do
    begin
      close;
      clear;
      Add('select sum(Valor_Total) as Valor_Total, sum(Valor_Frete_Unitario) as Valor_Frete_Unitario, sum(BC_ICMS) as BC_ICMS, sum(Valor_ICMS_Unitario) as Valor_ICMS_Unitario,');
      Add('sum(Valor_IPI) as Valor_IPI, sum(Custo_Unitario) as Custo_Unitario, sum(BC_ICMS_ST) as BC_ICMS_ST, sum(Valor_ICMS_ST) as Valor_ICMS_ST,');
      Add('sum(Valor_Total + Valor_ICMS_ST + Valor_Frete_Unitario + Valor_IPI) as Valor_Total_Nota');
      Add('from Itens_Entrada');
      Add('where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
      open;
    end;}
  except on E:Exception do
  begin
    TMensagens.MensagemErro('Método Pega_Total_Impostos: '+E.Message);
    TLog.Error(Self.ClassName+' - Pega_Total_Impostos - '+E.Message);
  end;

  end;
end;

procedure TFrmEntrada_Produtos.qryitens_entradaAfterScroll(DataSet: TDataSet);
begin
  Pega_Total_Impostos;
  PreencheObjetoIE;
end;

procedure TFrmEntrada_Produtos.qryitens_entradaBeforePost(DataSet: TDataSet);
begin
  try
    if (qryitens_entrada.State in [dsEdit]) then
    begin
      if (DBGrid1.SelectedIndex = 9) then //quantidade
      begin
        FItens_Entrada.Quantidade:= StrToFloat(DBGrid1.Columns.Grid.Fields[9].Text);
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
        //valor total
        FItensEntradaDominio.CalculaValorTotal(FItens_Entrada);
        qryitens_entradaValor_Total.AsFloat:= FItens_Entrada.Valor_Total;
        //valor ipi
        FItensEntradaDominio.CalculaValorTotalIPI(FItens_Entrada);
        qryitens_entradaValor_IPI.AsFloat:= FItens_Entrada.Valor_IPI;
        //despesas (frete, seguro e etc.)
        FItensEntradaDominio.CalculaDespesas(FItens_Entrada, FImpostosEntrada);
        qryitens_entradaValor_Frete_Unitario.AsFloat:= FItens_Entrada.Valor_Frete_Unitario;
        //bc icms
        FItensEntradaDominio.CalculaBCICMS(FItens_Entrada);
        qryitens_entradaBC_ICMS.AsFloat:= FItens_Entrada.BC_ICMS;
        //valor icms
        FItensEntradaDominio.CalculaValorICMS(FItens_Entrada);
        qryitens_entradaValor_ICMS_Unitario.AsFloat:= FItens_Entrada.Valor_ICMS_Unitario;
        //bc icms st
        FItensEntradaDominio.CalculaBCICMSST(FItens_Entrada);
        qryitens_entradaBC_ICMS_ST.AsFloat:= FItens_Entrada.BC_ICMS_ST;
        //valor icms st
        FItensEntradaDominio.CalculaValorICMSST(FItens_Entrada);
        qryitens_entradaValor_ICMS_ST.AsFloat:= FItens_Entrada.Valor_ICMS_ST;
        //custo unitário
        FItensEntradaDominio.CalculaCustoTotal(FItens_Entrada);
        qryitens_entradaCusto_Unitario.AsFloat:= FItens_Entrada.Custo_Unitario;
        //preço a vista
        qryitens_entradaValor_Vista.AsFloat:= FItensEntradaDominio.CalculaPrecoVenda(qryitens_entradaPercentual_Lucro_Vista.AsFloat, qryitens_entradaCusto_Unitario.AsFloat);
        //preço a prazo
        qryitens_entradaValor_Prazo.AsFloat:= FItensEntradaDominio.CalculaPrecoVenda(qryitens_entradaPercentual_Lucro_Prazo.AsFloat, qryitens_entradaCusto_Unitario.AsFloat);
      end;

      if (DBGrid1.SelectedIndex = 10) then //valor unitário
      begin
        FItens_Entrada.Valor_Unitario:= StrToFloat(DBGrid1.Columns.Grid.Fields[10].Text);
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
        //valor total
        FItensEntradaDominio.CalculaValorTotal(FItens_Entrada);
        qryitens_entradaValor_Total.AsFloat:= FItens_Entrada.Valor_Total;
        //valor ipi
        FItensEntradaDominio.CalculaValorTotalIPI(FItens_Entrada);
        qryitens_entradaValor_IPI.AsFloat:= FItens_Entrada.Valor_IPI;
        //despesas (frete, seguro e etc.)
        FItensEntradaDominio.CalculaDespesas(FItens_Entrada, FImpostosEntrada);
        qryitens_entradaValor_Frete_Unitario.AsFloat:= FItens_Entrada.Valor_Frete_Unitario;
        //bc icms
        FItensEntradaDominio.CalculaBCICMS(FItens_Entrada);
        qryitens_entradaBC_ICMS.AsFloat:= FItens_Entrada.BC_ICMS;
        //valor icms
        FItensEntradaDominio.CalculaValorICMS(FItens_Entrada);
        qryitens_entradaValor_ICMS_Unitario.AsFloat:= FItens_Entrada.Valor_ICMS_Unitario;
        //bc icms st
        FItensEntradaDominio.CalculaBCICMSST(FItens_Entrada);
        qryitens_entradaBC_ICMS_ST.AsFloat:= FItens_Entrada.BC_ICMS_ST;
        //valor icms st
        FItensEntradaDominio.CalculaValorICMSST(FItens_Entrada);
        qryitens_entradaValor_ICMS_ST.AsFloat:= FItens_Entrada.Valor_ICMS_ST;
        //custo unitário
        FItensEntradaDominio.CalculaCustoTotal(FItens_Entrada);
        qryitens_entradaCusto_Unitario.AsFloat:= FItens_Entrada.Custo_Unitario;
        //preço a vista
        qryitens_entradaValor_Vista.AsFloat:= FItensEntradaDominio.CalculaPrecoVenda(qryitens_entradaPercentual_Lucro_Vista.AsFloat, qryitens_entradaCusto_Unitario.AsFloat);
        //preço a prazo
        qryitens_entradaValor_Prazo.AsFloat:= FItensEntradaDominio.CalculaPrecoVenda(qryitens_entradaPercentual_Lucro_Prazo.AsFloat, qryitens_entradaCusto_Unitario.AsFloat);
      end;

      if (DBGrid1.SelectedIndex = 12) then //aliquota icms
      begin
        FItens_Entrada.Aliquota_ICMS:= DBGrid1.Columns.Grid.Fields[12].Text;
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
        //valor icms
        FItensEntradaDominio.CalculaValorICMS(FItens_Entrada);
        qryitens_entradaValor_ICMS_Unitario.AsFloat:= FItens_Entrada.Valor_ICMS_Unitario;
      end;

      if (DBGrid1.SelectedIndex = 13) then //aliquota ipi
      begin
        FItens_Entrada.Aliquota_IPI:= DBGrid1.Columns.Grid.Fields[13].Text;
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);

        //valor do ipi
        FItensEntradaDominio.CalculaValorTotalIPI(FItens_Entrada);
        qryitens_entradaValor_IPI.AsFloat:= FItens_Entrada.Valor_IPI;
        //bc icms st
        FItensEntradaDominio.CalculaBCICMSST(FItens_Entrada);
        qryitens_entradaBC_ICMS_ST.AsFloat:= FItens_Entrada.BC_ICMS_ST;
        //valor icms st
        FItensEntradaDominio.CalculaValorICMSST(FItens_Entrada);
        qryitens_entradaValor_ICMS_ST.AsFloat:= FItens_Entrada.Valor_ICMS_ST;
        //custo unitário
        FItensEntradaDominio.CalculaCustoTotal(FItens_Entrada);
        qryitens_entradaCusto_Unitario.AsFloat:= FItens_Entrada.Custo_Unitario;
        //preço a vista
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
        qryitens_entradaValor_Vista.AsFloat:= FItensEntradaDominio.CalculaPrecoVenda(qryitens_entradaPercentual_Lucro_Vista.AsFloat, qryitens_entradaCusto_Unitario.AsFloat);
        //preço a prazo
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
        qryitens_entradaValor_Prazo.AsFloat:= FItensEntradaDominio.CalculaPrecoVenda(qryitens_entradaPercentual_Lucro_Prazo.AsFloat, qryitens_entradaCusto_Unitario.AsFloat);
      end;

      if (DBGrid1.SelectedIndex = 14) then //IVA
      begin
        FItens_Entrada.IVA:= StrToFloat(DBGrid1.Columns.Grid.Fields[14].Text);
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
        //bc icms st
        FItensEntradaDominio.CalculaBCICMSST(FItens_Entrada);
        qryitens_entradaBC_ICMS_ST.AsFloat:= FItens_Entrada.BC_ICMS_ST;
        //valor icms st
        FItensEntradaDominio.CalculaValorICMSST(FItens_Entrada);
        qryitens_entradaValor_ICMS_ST.AsFloat:= FItens_Entrada.Valor_ICMS_ST;
        //custo unitário
        FItensEntradaDominio.CalculaCustoTotal(FItens_Entrada);
        qryitens_entradaCusto_Unitario.AsFloat:= FItens_Entrada.Custo_Unitario;
        //preço a vista
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
        qryitens_entradaValor_Vista.AsFloat:= FItensEntradaDominio.CalculaPrecoVenda(qryitens_entradaPercentual_Lucro_Vista.AsFloat, qryitens_entradaCusto_Unitario.AsFloat);
        //preço a prazo
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
        qryitens_entradaValor_Prazo.AsFloat:= FItensEntradaDominio.CalculaPrecoVenda(qryitens_entradaPercentual_Lucro_Prazo.AsFloat, qryitens_entradaCusto_Unitario.AsFloat);
      end;

      if (DBGrid1.SelectedIndex = 17) then //quantidade volume
      begin
        FItens_Entrada.Quantidade_Volume:= StrToFloat(DBGrid1.Columns.Grid.Fields[17].Text);
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
        //custo unitário
        FItensEntradaDominio.CalculaCustoTotal(FItens_Entrada);
        qryitens_entradaCusto_Unitario.AsFloat:= FItens_Entrada.Custo_Unitario;
        //preço a vista
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
        qryitens_entradaValor_Vista.AsFloat:= FItensEntradaDominio.CalculaPrecoVenda(qryitens_entradaPercentual_Lucro_Vista.AsFloat, qryitens_entradaCusto_Unitario.AsFloat);
        //preço a prazo
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
        qryitens_entradaValor_Prazo.AsFloat:= FItensEntradaDominio.CalculaPrecoVenda(qryitens_entradaPercentual_Lucro_Prazo.AsFloat, qryitens_entradaCusto_Unitario.AsFloat);
      end;

      if (DBGrid1.SelectedIndex = 19) then //BC ICMS
      begin
        FItens_Entrada.BC_ICMS:= StrToFloat(DBGrid1.Columns.Grid.Fields[19].Text);
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
        //valor icms
        FItensEntradaDominio.CalculaValorICMS(FItens_Entrada);
        qryitens_entradaValor_ICMS_Unitario.AsFloat:= FItens_Entrada.Valor_ICMS_Unitario;
      end;

      if (DBGrid1.SelectedIndex = 21) then //BC ICMS ST
      begin
        FItens_Entrada.BC_ICMS_ST:= StrToFloat(DBGrid1.Columns.Grid.Fields[21].Text);
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
        //valor icms st
        FItensEntradaDominio.CalculaValorICMSST(FItens_Entrada);
        qryitens_entradaValor_ICMS_ST.AsFloat:= FItens_Entrada.Valor_ICMS_ST;
        //custo unitário
        FItensEntradaDominio.CalculaCustoTotal(FItens_Entrada);
        qryitens_entradaCusto_Unitario.AsFloat:= FItens_Entrada.Custo_Unitario;
        //preço a vista
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
        qryitens_entradaValor_Vista.AsFloat:= FItensEntradaDominio.CalculaPrecoVenda(qryitens_entradaPercentual_Lucro_Vista.AsFloat, qryitens_entradaCusto_Unitario.AsFloat);
        //preço a prazo
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
        qryitens_entradaValor_Prazo.AsFloat:= FItensEntradaDominio.CalculaPrecoVenda(qryitens_entradaPercentual_Lucro_Prazo.AsFloat, qryitens_entradaCusto_Unitario.AsFloat);
      end;

      if (DBGrid1.SelectedIndex = 22) then //valor ICMS ST
      begin
        FItens_Entrada.Valor_ICMS_ST:= StrToFloat(DBGrid1.Columns.Grid.Fields[22].Text);
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
        //custo unitário
        FItensEntradaDominio.CalculaCustoTotal(FItens_Entrada);
        qryitens_entradaCusto_Unitario.AsFloat:= FItens_Entrada.Custo_Unitario;
        //preço a vista
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
        qryitens_entradaValor_Vista.AsFloat:= FItensEntradaDominio.CalculaPrecoVenda(qryitens_entradaPercentual_Lucro_Vista.AsFloat, qryitens_entradaCusto_Unitario.AsFloat);
        //preço a prazo
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
        qryitens_entradaValor_Prazo.AsFloat:= FItensEntradaDominio.CalculaPrecoVenda(qryitens_entradaPercentual_Lucro_Prazo.AsFloat, qryitens_entradaCusto_Unitario.AsFloat);
      end;

      if (DBGrid1.SelectedIndex = 23) then //Custo unitário
      begin
        FItens_Entrada.Custo_Unitario:= StrToFloat(DBGrid1.Columns.Grid.Fields[23].Text);
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
        //preço a vista
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
        qryitens_entradaValor_Vista.AsFloat:= FItensEntradaDominio.CalculaPrecoVenda(qryitens_entradaPercentual_Lucro_Vista.AsFloat, qryitens_entradaCusto_Unitario.AsFloat);
        //preço a prazo
        FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
        qryitens_entradaValor_Prazo.AsFloat:= FItensEntradaDominio.CalculaPrecoVenda(qryitens_entradaPercentual_Lucro_Prazo.AsFloat, qryitens_entradaCusto_Unitario.AsFloat);
      end;

    end;
  except on E:Exception do
  begin
    TMensagens.MensagemErro('Método qryitens_entradaBeforePost: '+E.Message);
    TLog.Error(Self.ClassName+' - qryitens_entradaBeforePost - '+E.Message);
  end;

  end;
end;

procedure TFrmEntrada_Produtos.qryitens_entradaData_ValidadeGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '30/12/1899') then
    Text:= ''
  else
    Text:= Sender.AsString;
end;

function TFrmEntrada_Produtos.removerFichaEstoque: Boolean;
var
  fichaEstoque : TFichaEstoque;
begin
  try
    TLog.Info('--- MÉTODO REMOVER FICHA ESTOQUE ---');
    try
      FFichaEstoqueDominio:= TFichaEstoqueDominio.Create(Conexao);
      Result := False;
      fichaEstoque := nil;
      TLog.Debug('Código da Ficha: '+qryitens_entradaFicha_Estoque_Codigo.AsString);
      fichaEstoque := FFichaEstoqueDominio.retornarFichaEstoquePorCodigo(qryitens_entradaFicha_Estoque_Codigo.AsInteger);
      if Assigned(fichaEstoque) then begin
        TLog.Debug('Entrou no Assigned');
        Result := FFichaEstoqueDominio.removerFichaEstoque(fichaEstoque);
      end;

      if Result = False then begin
        Application.MessageBox('Não foi possível excluir a ficha do estoque. Por favor, entre em contato com o suporte técnico.', 'Erro', MB_OK+MB_ICONHAND);
      end;
    except
      on E : Exception do
      begin
        TLog.Error(Self.ClassName+' - removerFichaEstoque - '+E.Message);
        TMensagens.MensagemErro('Método removerFichaEstoque: '+E.Message);
      end;
    end;
    TLog.Info('--- FIM DO MÉTODO REMOVER FICHA ESTOQUE ---');
  finally
    if Assigned(fichaEstoque) then
      FreeAndNil(fichaEstoque);
  end;
end;

function TFrmEntrada_Produtos.removerTodasFichasEstoques: Boolean;
var
  FichaEstoque : TFichaEstoque;
begin
  Tlog.Info(' --- MÉTODO removerTodasFichasEstoques ---');
  try
    qryitens_entrada.First;
    while not qryitens_entrada.Eof do begin
      FFichaEstoqueDominio:= TFichaEstoqueDominio.Create(Conexao);
      FichaEstoque := FFichaEstoqueDominio.retornarFichaEstoquePorCodigo(qryitens_entrada.FieldByName('Ficha_Estoque_Codigo').AsInteger);
      if Assigned(FichaEstoque) then
        FFichaEstoqueDominio.removerFichaEstoque(FichaEstoque);
      qryitens_entrada.Next;
    end;
  except
    on E : Exception do
    begin
      TLog.Error(Self.ClassName+' - removerTodasFichasEstoques - '+E.Message);
      TMensagens.MensagemErro('Método removerTodasFichasEstoques: '+E.Message);
    end;
  end;
  Tlog.Info(' --- FIM MÉTODO removerTodasFichasEstoques ---');
end;

function TFrmEntrada_Produtos.salvarFichaEstoque: Boolean;
var
  FichaEstoque : TFichaEstoque;
  CodigoFicha: integer;
begin
  try
    TLog.Info('--- MÉTODO SALVAR FICHA ESTOQUE ---');
    try
      Result := False;
      FichaEstoque := TFichaEstoque.Create;
      FFichaEstoqueDominio:= TFichaEstoqueDominio.Create(Conexao);
      FichaEstoque.DataLancamento         := Now;
      FichaEstoque.DataMovimentacao       := StrToDateTime(MEdtData_Entrada.Text);//+' '+ FormatDateTime('hh:mm:ss', now));
      FichaEstoque.TipoFichaEstoque       := TipoFichaEstoqueEnum.ENTRADA;
      FichaEstoque.TipoDocumento          := NOTA_FISCAL_ENTRADA;
      FichaEstoque.NumDocumento           := EdtN_Nota_Fiscal.Text;
      TLog.Debug('Nº Nota Fiscal: '+EdtN_Nota_Fiscal.Text);

      FichaEstoque.ProdutoCodigo          := qryitens_entradaCodigo_Produto.AsInteger;
      TLog.Debug('Código Produto: '+IntToStr(FichaEstoque.ProdutoCodigo));
      FichaEstoque.Quantidade             := qryitens_entradaQuantidade.AsFloat * qryitens_entradaQuantidade_Volume.AsFloat;
      TLog.Debug('Quantidade: '+FloatToStr(FichaEstoque.Quantidade));
      FichaEstoque.ValorUnitario          := qryitens_entradaCusto_Unitario.AsFloat;
      TLog.Debug('Custo Unitário: '+FloatToStr(FichaEstoque.ValorUnitario));
      FichaEstoque.ValorUnitarioTotal     := (qryitens_entradaQuantidade.AsFloat * qryitens_entradaQuantidade_Volume.AsFloat) * qryitens_entradaCusto_Unitario.AsFloat;
      TLog.Debug('Custo Total: '+FloatToStr(FichaEstoque.ValorUnitarioTotal));
      FichaEstoque.PrecoVendaVista        := qryitens_entradaValor_Vista.AsFloat;
      TLog.Debug('Preço à Vista: '+FloatToStr(FichaEstoque.PrecoVendaVista));
      FichaEstoque.PrecoVendaPrazo        := qryitens_entradaValor_Prazo.AsFloat;
      TLog.Debug('Preço à Prazo: '+FloatToStr(FichaEstoque.PrecoVendaPrazo));
      FichaEstoque.ValorNota              := 0;
      //Itens_Entrada.Ficha_Estoque_Codigo  := FFichaEstoqueDominio.salvarFichaEstoque(FichaEstoque);
      CodigoFicha  := FFichaEstoqueDominio.salvarFichaEstoque(FichaEstoque);
      TLog.Debug('Código da Ficha: '+IntToStr(CodigoFicha));
      TLog.Debug('Código do Registro: '+qryitens_entradaCodigo_Registro.AsString);
      FFichaEstoqueDominio.atualizarEntradaComCodigoFichaEstoque(qryitens_entradaCodigo_Registro.AsInteger, CodigoFicha);

      TLog.Info('--- FIM DO MÉTODO SALVAR FICHA ESTOQUE ---');
      Result := True;
    except
      on E : Exception do
      begin
        TLog.Error(Self.ClassName+' - salvarFichaEstoque - '+E.Message);
        TMensagens.MensagemErro('Método salvarFichaEstoque: '+E.Message);
      end;
    end;
  finally
    FreeAndNil(FichaEstoque);
  end;
end;

function TFrmEntrada_Produtos.Soma_Entrada_Produto(Produto: integer): double;
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
      add('select sum(Valor_Unitario) as ');
    end;
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - Soma_Entrada_Produto - '+E.Message);
  end;
end;

procedure TFrmEntrada_Produtos.EdtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtQuantidade_ItensExit(Sender: TObject);
begin
  TConfigs.VerificaCampoEmBranco(EdtQuantidade_Itens);
end;

procedure TFrmEntrada_Produtos.EdtQuantidade_ItensKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmEntrada_Produtos.EdtQuantidade_TransportadaExit(Sender: TObject);
begin
  if (EdtQuantidade_Transportada.Text = '')then
  begin
    Valor_Invalido;
    EdtQuantidade_Transportada.SetFocus;
    exit;
  end;
end;

procedure TFrmEntrada_Produtos.EdtQuantidade_TransportadaKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtQuantidade_VolumeExit(Sender: TObject);
begin
  if (EdtQuantidade_Volume.Text = '') or (EdtQuantidade_Volume.Text = '0') then
  begin
    Valor_Invalido;
    EdtQuantidade_Volume.SetFocus;
    exit;
  end;
  FItens_Entrada.Quantidade_Volume:= StrToFloat(EdtQuantidade_Volume.Text);
end;

procedure TFrmEntrada_Produtos.EdtQuantidade_VolumeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtTotal_IPIExit(Sender: TObject);
begin
  TConfigs.VerificaCampoEmBranco(EdtTotal_IPI);
end;

procedure TFrmEntrada_Produtos.EdtTotal_IPIKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtTotal_NotaEnter(Sender: TObject);
var
  desconto, valor_frete, valor_seguro, outras_despesas, valor_ipi, total_nota, valor_icms_st, total_produtos: double;
begin
  try
    desconto:= StrToFloat(EdtDesconto.Text);
    valor_frete:= StrToFloat(EdtValor_Frete.Text);
    valor_seguro:= StrToFloat(EdtValor_Seguro.Text);
    outras_despesas:= StrToFloat(EdtOutras_Despesas.Text);
    valor_ipi:= StrToFloat(EdtTotal_IPI.Text);
    valor_icms_st:= StrToFloat(EdtValor_ICMS_Substituicao.Text);
    total_produtos:= StrToFloat(EdtTotal_Produtos.Text);

    //total_nota:= StrToFloat(EdtTotal_Nota.Text);

    total_nota:= total_produtos + valor_frete + valor_seguro + outras_despesas + valor_ipi + valor_icms_st - desconto;

    EdtTotal_Nota.Text:= FormatFloat('#0.0,0', total_nota);
    EdtTotal_Nota.Text:= StringReplace(EdtTotal_Nota.Text, ThousandSeparator, '', [rfReplaceAll]);
  except
    on E : Exception do
    begin
      TLog.Error(Self.ClassName+' - EdtTotal_NotaEnter - '+E.Message);
      TMensagens.MensagemErro('Método EdtTotal_NotaEnter: '+E.Message);
    end;
  end;
end;

procedure TFrmEntrada_Produtos.EdtTotal_NotaExit(Sender: TObject);
begin
  TConfigs.VerificaCampoEmBranco(EdtTotal_Nota);
end;

procedure TFrmEntrada_Produtos.EdtTotal_NotaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_RETURN) then
  begin
    EdtCodigo_Produto.SetFocus;
  end;
end;

procedure TFrmEntrada_Produtos.EdtTotal_NotaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtTotal_ProdutosExit(Sender: TObject);
begin
  TConfigs.VerificaCampoEmBranco(EdtTotal_Produtos);
end;

procedure TFrmEntrada_Produtos.EdtTotal_ProdutosKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtTransportadoraKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmEntrada_Produtos.EdtUF_VeiculoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmEntrada_Produtos.EdtValor_FreteExit(Sender: TObject);
begin
  TConfigs.VerificaCampoEmBranco(EdtValor_Frete);
end;

procedure TFrmEntrada_Produtos.EdtValor_FreteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtValor_ICMSExit(Sender: TObject);
begin
  TConfigs.VerificaCampoEmBranco(EdtValor_ICMS);
end;

procedure TFrmEntrada_Produtos.EdtValor_ICMSKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtValor_ICMS_STEnter(Sender: TObject);
begin
  if (EdtSituacao_Tributaria.Text = '010') or (EdtSituacao_Tributaria.Text = '030') or
     (EdtSituacao_Tributaria.Text = '060') or (EdtSituacao_Tributaria.Text = '070') or
     (EdtSituacao_Tributaria.Text = '210') or (EdtSituacao_Tributaria.Text = '110') then
  begin
    FItensEntradaDominio.CalculaValorICMSST(FItens_Entrada);
    EdtValor_ICMS_ST.Text:= FloatToStr(FItens_Entrada.Valor_ICMS_ST);
    //EdtValor_ICMS_ST.Text:= FloatToStr(FItens_Entrada.Valor_ICMS_ST);
  end
  else
  begin
    FItens_Entrada.Valor_ICMS_ST:= 0;
    EdtValor_ICMS_ST.Text:= '0';
  end;
end;

procedure TFrmEntrada_Produtos.EdtValor_ICMS_STExit(Sender: TObject);
begin
  if (EdtValor_ICMS_ST.Text = '') then
  begin
    Valor_Invalido;
    EdtValor_ICMS_ST.SetFocus;
    exit;
  end;

  FItens_Entrada.Valor_ICMS_ST:= StrToFloat(EdtValor_ICMS_ST.Text);
  EdtValor_ICMS_ST.Text:= FormatFloat('#0.0,0', StrToFloat(EdtValor_ICMS_ST.Text));
  EdtValor_ICMS_ST.Text:= StringReplace(EdtValor_ICMS_ST.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmEntrada_Produtos.EdtValor_ICMS_STKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtValor_ICMS_SubstituicaoExit(Sender: TObject);
begin
  TConfigs.VerificaCampoEmBranco(EdtValor_ICMS_Substituicao);
end;

procedure TFrmEntrada_Produtos.EdtValor_ICMS_SubstituicaoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtValor_ICMS_UnitarioEnter(Sender: TObject);
begin
  FItensEntradaDominio.CalculaValorICMS(FItens_Entrada);
  EdtValor_ICMS_Unitario.Text:= FloatToStr(FItens_Entrada.Valor_ICMS_Unitario);
end;

procedure TFrmEntrada_Produtos.EdtValor_ICMS_UnitarioExit(Sender: TObject);
begin
  if (EdtValor_ICMS_Unitario.Text = '') then
  begin
    Valor_Invalido;
    EdtValor_ICMS_Unitario.SetFocus;
    exit;
  end;

  FItens_Entrada.Valor_ICMS_Unitario:= StrToFloat(EdtValor_ICMS_Unitario.Text);
  EdtValor_ICMS_Unitario.Text:= FormatFloat('#0.0,0', StrToFloat(EdtValor_ICMS_Unitario.Text));
  EdtValor_ICMS_Unitario.Text:= StringReplace(EdtValor_ICMS_Unitario.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmEntrada_Produtos.EdtValor_ICMS_UnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtValor_IPIEnter(Sender: TObject);
begin
  try
    FItensEntradaDominio.CalculaValorTotalIPI(FItens_Entrada);
    EdtValor_IPI.Text:= FloatToStr(FItens_Entrada.Valor_IPI);
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - EdtValor_IPIEnter - '+E.Message);
  end;
end;

procedure TFrmEntrada_Produtos.EdtValor_IPIExit(Sender: TObject);
begin
  if (EdtValor_IPI.Text = '') then
  begin
    Valor_Invalido;
    EdtValor_IPI.SetFocus;
    exit;
  end;
  FItens_Entrada.Valor_IPI:= StrToFloat(EdtValor_IPI.Text);
  EdtValor_IPI.Text:= FormatFloat('#0.0,0', StrToFloat(EdtValor_IPI.Text));
  EdtValor_IPI.Text:= StringReplace(EdtValor_IPI.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmEntrada_Produtos.EdtValor_IPIKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtValor_PrazoEnter(Sender: TObject);
var
  valor: double;
begin
  valor:= FItensEntradaDominio.CalculaPrecoVenda(StrToFloat(EdtPercentual_Lucro_Prazo.Text), StrToFloat(EdtCusto_Unitario.Text));
  EdtValor_Prazo.Text:= FloatToStr(valor);
  FItens_Entrada.Valor_Prazo:= valor;
end;

procedure TFrmEntrada_Produtos.EdtValor_PrazoExit(Sender: TObject);
begin
  if (EdtValor_Prazo.Text = '') then
  begin
    Valor_Invalido;
    EdtValor_Prazo.SetFocus;
    exit;
  end;
  FItens_Entrada.Valor_Prazo:= StrToFloat(EdtValor_Prazo.Text);
end;

procedure TFrmEntrada_Produtos.EdtValor_PrazoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  qAux: TADOQuery;
begin
end;

procedure TFrmEntrada_Produtos.EdtValor_PrazoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtValor_SeguroExit(Sender: TObject);
begin
  TConfigs.VerificaCampoEmBranco(EdtValor_Seguro);
end;

procedure TFrmEntrada_Produtos.EdtValor_SeguroKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtValor_STEnter(Sender: TObject);
var
  qtde, valor_tot: double;
begin

end;

procedure TFrmEntrada_Produtos.EdtValor_STKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtValor_TotalEnter(Sender: TObject);
begin
  FItensEntradaDominio.CalculaValorTotal(FItens_Entrada);
  EdtValor_Total.Text:= FloatToStr(FItens_Entrada.Valor_Total);
end;

procedure TFrmEntrada_Produtos.EdtValor_TotalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtValor_UnitarioExit(Sender: TObject);
begin
  if (EdtValor_Unitario.Text = '') or (EdtValor_Unitario.Text = '0') or (EdtValor_Unitario.Text = '0,00') then
  begin
    Valor_Invalido;
    EdtValor_Unitario.SetFocus;
    exit;
  end;
  FItens_Entrada.Valor_Unitario:= Calcula_Valor_Tres_Casas(EdtValor_Unitario.Text);
  EdtValor_Unitario.Text:= FloatToStr(Calcula_Valor_Tres_Casas(EdtValor_Unitario.Text));
  EdtValor_Unitario.Text:= FormatFloat('#0.0,00', StrToFloat(EdtValor_Unitario.Text));
  EdtValor_Unitario.Text:= StringReplace(EdtValor_Unitario.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmEntrada_Produtos.EdtValor_UnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', ',',#08]) then
    key := #0
end;

procedure TFrmEntrada_Produtos.EdtValor_Unitario_FreteEnter(Sender: TObject);
begin
  try
    FItensEntradaDominio.CalculaDespesas(FItens_Entrada, FImpostosEntrada);
    EdtValor_Unitario_Frete.Text:= FloatToStr(FItens_Entrada.Valor_Frete_Unitario);
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - EdtValor_Unitario_FreteEnter - '+E.Message);
  end;
end;

procedure TFrmEntrada_Produtos.EdtValor_Unitario_FreteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtValor_VistaEnter(Sender: TObject);
var
  valor: double;
begin
  FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
  valor:= FItensEntradaDominio.CalculaPrecoVenda(StrToFloat(EdtPercentual_Lucro_Vista.Text), StrToFloat(EdtCusto_Unitario.Text));
  EdtValor_Vista.Text:= FloatToStr(valor);
  FItens_Entrada.Valor_Vista:= valor;
end;

procedure TFrmEntrada_Produtos.EdtValor_VistaExit(Sender: TObject);
begin
  if (EdtValor_Vista.Text = '') then
  begin
    Valor_Invalido;
    EdtValor_Vista.SetFocus;
    exit;
  end;
  FItens_Entrada.Valor_Vista:= StrToFloat(EdtValor_Vista.Text);
end;

procedure TFrmEntrada_Produtos.Verifica_Despesas;
begin
  {if (EdtValor_Frete.Text = '0,00') and
  (EdtValor_Seguro.Text = '0,00') and
  (EdtOutras_Despesas.Text = '0,00') and
  (EdtDesconto.Text = '0,00') then
  begin
    Application.MessageBox('Você optou por incluir despesas no custo do produto, portanto deve-se informar pelo menos o Valor do Frete ou Valor do Seguro ou Outras Despesas ou Desconto', 'Aviso', MB_OK+MB_ICONHAND);
    EdtValor_Frete.SetFocus;
    abort;
  end;}

  if (EdtTotal_Produtos.Text = '') or (EdtTotal_Produtos.Text = '0,00') or (EdtTotal_Produtos.Text = '0') then
  begin
    EdtTotal_Produtos.SetFocus;
    Mensagem_Falta_Dados;
    exit;
  end;

end;

procedure TFrmEntrada_Produtos.Verifica_Nota;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  try
    try
      if (EdtCodigo_Fornecedor.Text <> '') then
      begin
        with qAux, sql do
        begin
          close;
          Connection:= Conexao;
          clear;
          add('select EP.N_Nota_Fiscal from Entrada_Produtos EP');
          add('where EP.Status = :Status and EP.N_Nota_Fiscal = :Nota and Codigo_Fornecedor = :Fornecedor');
          Parameters.ParamByName('Status').Value:= 'N';
          Parameters.ParamByName('Nota').Value:= EdtN_Nota_Fiscal.Text;
          Parameters.ParamByName('Fornecedor').Value:= StrToInt(EdtCodigo_Fornecedor.Text);
          open;

          if (IsEmpty = false) then
          begin
            Application.MessageBox('Foi detectado que existe uma nota fiscal com esse número para o mesmo fornecedor, no sistema. Por favor, verifique.', 'Nota fiscal encontrada', MB_OK+MB_ICONHAND);
            exit;
          end;
        end;
      end;
    except
      on E : Exception do
      begin
        TLog.Error(Self.ClassName+' - Verifica_Nota - '+E.Message);
        TMensagens.MensagemErro('Método Verifica_Nota: '+E.Message);
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

function TFrmEntrada_Produtos.Verifica_Produto_Lancado: boolean;
begin
  try
    Result:= false;
    if not qryitens_entrada.IsEmpty then
    begin
      if (qryitens_entrada.Locate('Codigo;Codigo_Produto', VarArrayOf([StrToInt(EdtCodigo.Text), StrToInt(LblProduto.Caption)]), [])) then
      begin
        //Produto_Ja_Lancamento_Venda;
        //exit;
        Result:= true;
      end;
    end;
  except
    on E : Exception do
    begin
      TLog.Error(Self.ClassName+' - Verifica_Produto_Lancado - '+E.Message);
      TMensagens.MensagemErro('Método Verifica_Produto_Lancado: '+E.Message);
    end;
  end;
end;

procedure TFrmEntrada_Produtos.EdtValor_VistaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmEntrada_Produtos.EdtVeiculoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmEntrada_Produtos.Escreve_Texto;
begin
  Edit2.Text:= 'Qtde. Itens';
  Edit4.Text:= 'Total Prod.';
  Edit3.Text:= 'Base ICMS';
  Edit6.Text:= 'Valor ICMS';
  Edit9.Text:= 'BC ICMS ST';
  Edit11.Text:= 'V. ICMS ST';
  Edit10.Text:= 'Valor Frete';
  Edit12.Text:= 'Valor Seguro';
  Edit13.Text:= 'Out. Desp.';
  Edit1.Text:= 'Total IPI';
  Edit8.Text:= 'Desconto';
  Edit5.Text:= 'Total Nota';
  //Edit7.Text:= 'Custo Total';

  //Edit17.Text:= 'Isenta ou Não T.';
  //Edit15.Text:= 'Outros';
  //Edit19.Text:= 'Isenta ou Não T.';
  //Edit16.Text:= 'Outros';
  //Edit18.Text:= 'Aliquota';


  EdtQuantidade_Itens.Text:= '0';
  EdtTotal_Produtos.Text:= '0,00';
  EdtBase_ICMS.Text:= '0,00';
  EdtValor_ICMS.Text:= '0,00';
  EdtBase_ICMS_Substituicao.Text:= '0,00';
  EdtValor_ICMS_Substituicao.Text:= '0,00';
  EdtValor_Frete.Text:= '0,00';
  EdtValor_Seguro.Text:= '0,00';
  EdtOutras_Despesas.Text:= '0,00';
  EdtTotal_IPI.Text:= '0,00';
  EdtDesconto.Text:= '0,00';
  EdtTotal_Nota.Text:= '0,00';
  EdtAliquota_ICMS.Text:= '0,00';

  EdtIsento_ICMS.Text:= '0,00';
  EdtIsento_IPI.Text:= '0,00';
  EdtOutros_ICMS.Text:= '0,00';
  EdtOutros_IPI.Text:= '0,00';

  EdtValor_Unitario.Text:= '0,00';
  EdtValor_Total.Text:= '0,00';
  EdtICMS.Text:= '0';
  EdtIPI.Text:= '0';
  EdtValor_IPI.Text:= '0,00';

  EdtQuantidade_Transportada.Text:= '0';
  EdtPeso_Bruto.Text:= '0,00';
  EdtPeso_Liquido.Text:= '0,00';
  EdtCusto_Total.Text:= '0,00';
end;

procedure TFrmEntrada_Produtos.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmEntrada_Produtos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      exit;
    end
    else
    begin
      FrmEntrada_Produtos.Free;
      FrmEntrada_Produtos:= Nil;
    end;
end;

procedure TFrmEntrada_Produtos.FormCreate(Sender: TObject);
begin
  Entrada :=  TEntrada_Produtos.Create;
  FFichaEstoqueDominio := TFichaEstoqueDominio.Create(Conexao);
  Itens_Entrada := TItens_Entrada.Create;
  Util.Habilita_Campos(FrmEntrada_Produtos);
  Util.Limpa_Campos(FrmEntrada_Produtos);
  Util.Desabilita_Campos(FrmEntrada_Produtos);
  qryitens_entrada.Close;
  Escreve_Texto;
  n_item:= 0;
  qtde_pendente:= 0;
  EdtQuantidade_Transportada.Text:= '0';
  PageControl2.TabIndex:= 0;
  Label22.Visible:= false;
  EdtPedido.Visible:= false;
  exclui:= false;
  iniciado:= false;
  HabilitaCheck;
  DBGrid2.Visible:= false;
  ADOQuery1.Close;
  //Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, nil, BBtnCancelar, BBtnFechar);
end;

procedure TFrmEntrada_Produtos.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmEntrada_Produtos.FormDestroy(Sender: TObject);
begin
  try
    FreeAndNil(Entrada);
    FreeAndNil(Itens_Entrada);
    FFichaEstoqueDominio := nil;
  except
    on E : Exception do
    begin
      TLog.Error(Self.ClassName+' - FormDestroy - '+E.Message);
      TMensagens.MensagemErro('Método FormDestroy: '+E.Message);
    end;
  end;
end;

procedure TFrmEntrada_Produtos.HabilitaCheck;
begin
  //CBIncluir.Checked:= true;
end;

procedure TFrmEntrada_Produtos.Image1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmAjuda_Entrada_Produto, FrmAjuda_Entrada_Produto);
  FrmAjuda_Entrada_Produto.Show;
  Centraliza_Form(FrmAjuda_Entrada_Produto);
end;

procedure TFrmEntrada_Produtos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin

    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmEntrada_Produtos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmEntrada_Produtos.Gera_Codigo;
var
  qAux, qAux2: TADOQuery;
  n_pedido: integer;
begin
  try
  TLog.Info('--- MÉTODO TFrmEntrada_Produtos.Gera_Codigo ---');
    try
      qAux:= TADOQuery.Create(self);
      qAux2:= TADOQuery.Create(self);
      with qAux, sql do
      begin
        close;
        Connection:= Conexao;
        clear;
        add('select max(Codigo) as Codigo from Controla_Codigo_Entrada ');
        open;
      end;
      codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
      EdtCodigo.Text:= IntToStr(codigo);

      with qAux2, sql do
      begin
        close;
        Connection := Conexao;
        clear;
        add('Insert into Controla_Codigo_Entrada (Codigo) values (:Codigo)');
        Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
        ExecSQL;
      end;
    except
      on E : Exception do
      begin
        TLog.Error(Self.ClassName+' - Gera_Codigo - '+E.Message);
        TMensagens.MensagemErro('Método Gera_Codigo: '+E.Message);
      end;
    end;
  finally
    FreeAndNil(qAux);
    FreeAndNil(qAux2);
  end;
end;

procedure TFrmEntrada_Produtos.Gera_Conta_Pagar;
var
  qAux, qAux2: TADOQuery;
  codigo, i, n_documento: integer;
  data_vencim: TDate;
  valaux: double;
begin
  qAux:= TADOQuery.Create(self);
  qAux2:= TADOQuery.Create(self);
  try
    TLog.Info('--- MÉTODO Gera_Conta_Pagar ---');
    try
      //pega o código do lançamento
      //Gera_Codigo_Lancamento_Financeiro;
      data_vencim:= StrToDateTime(MEdtData_Primeira_Parcela.Text);
      TLog.Debug('--- VARIÁVEL data_vencim ---'+DateTimeToStr(n_documento));
      n_documento:= StrToInt(EdtN_Nota_Fiscal.Text);
      TLog.Debug('--- VARIÁVEL n_documento ---'+IntToStr(n_documento));
      cod_lancamento_financeiro:= TGeradorDeCodigo.GeraCodigoSequenciaControlaCodigo('Controla_Codigo_Lancamento_Financeiro', Conexao);
      TLog.Debug('--- VARIÁVEL cod_lancamento_financeiro ---'+IntToStr(cod_lancamento_financeiro));
      with qAux2, SQL do begin
        close;
        Connection:= Conexao;
        clear;
        add('Insert into Lancamento_Financeiro (Codigo, Tipo, N_Documento, Codigo_Empresa, Codigo_Forma_Pagamento, ');
        add('Codigo_Cli_For, Codigo_Tipo_Documento, Historico, Codigo_Departamento, Codigo_Plano, Data_Lancamento,');
        add('Data_Vencimento, Valor_Documento, Desconto, Multa, Valor_Cobrado, Observacoes, Status, Conta_Fixa) values (');
        add(':Codigo, :Tipo, :N_Documento, :Codigo_Empresa, :Codigo_Forma_Pagamento, :Codigo_Cli_For, :Codigo_Tipo_Documento, ');
        add(':Historico, :Codigo_Departamento, :Codigo_Plano, :Data_Lancamento, :Data_Vencimento, :Valor_Documento, ');
        add(':Desconto, :Multa, :Valor_Cobrado, :Observacoes, :Status, :Conta_Fixa)');

        Parameters.ParamByName('Codigo').Value:= cod_lancamento_financeiro;
        Parameters.ParamByName('Tipo').Value:= 'PAGAR';

        Parameters.ParamByName('N_Documento').Value:= n_documento;

        Parameters.ParamByName('Codigo_Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('Codigo_Forma_Pagamento').Value:= StrToInt(EdtCodigo_Condicao_Pagamento.Text);

        Parameters.ParamByName('Codigo_Cli_For').Value:= StrToInt(EdtCodigo_Fornecedor.Text);

        Parameters.ParamByName('Codigo_Tipo_Documento').Value:= codigo_tipo_documento_pagar;
        Parameters.ParamByName('Historico').Value:= historico_conta_pagar;
        Parameters.ParamByName('Codigo_Departamento').Value:= codigo_departamento_pagar;
        Parameters.ParamByName('Codigo_Plano').Value:= codigo_plano_financeiro_pagar;
        Parameters.ParamByName('Data_Lancamento').Value:= StrToDateTime(MEdtData_Entrada.Text);
        Parameters.ParamByName('Data_Vencimento').Value:= data_vencim;
        Parameters.ParamByName('Valor_Documento').Value:= StrToFloat(EdtTotal_Nota.Text);
        Parameters.ParamByName('Desconto').Value:= 0;
        Parameters.ParamByName('Multa').Value:= 0;
        Parameters.ParamByName('Valor_Cobrado').Value:= StrToFloat(EdtTotal_Nota.Text);
        Parameters.ParamByName('Observacoes').Value:= '';
        Parameters.ParamByName('Status').Value:= 'PENDENTE';
        Parameters.ParamByName('Conta_Fixa').Value:= 1;
        ExecSQL;
      end;

      n_documento:= StrToInt(IntToStr(n_documento) + '1');
      for i := 1 to qtde_parcelas do begin
        with qAux2, SQL do begin
          close;
          Connection:= Conexao;
          clear;
          add('Insert into Parcelas_Lancamentos (Codigo, N_Documento, Data_Vencimento, Data_Pagamento, ');
          add('Parcela, Status, Valor, Valor_Pagar, Codigo_Forma_Pagamento_Parcela, Valor_Restante, Desconto, Acrescimo, Valor_Pago) values (:Codigo, :N_Documento, :Data_Vencimento, :Data_Pagamento, ');
          add(':Parcela, :Status, :Valor, :Valor_Pagar, :Codigo_Forma_Pagamento_Parcela, :Valor_Restante, :Desconto, :Acrescimo, :Valor_Pago)');

          Parameters.ParamByName('Codigo').Value:= cod_lancamento_financeiro;

          Parameters.ParamByName('N_Documento').Value:= n_documento;

          Parameters.ParamByName('Data_Vencimento').Value:= data_vencim;
          Parameters.ParamByName('Data_Pagamento').Value:= NULL;

          data_vencim:= IncDay(data_vencim, prazo);
          inc(n_documento);
          Parameters.ParamByName('Parcela').Value:= i;
          Parameters.ParamByName('Status').Value:= 'PENDENTE';
             { TODO : VARRER ENTRADA DE PRODUTOS PARA NÃO PERMITIR PASSAR SEM O VALOR ESTAR CORRETO COM O TOTAL DA NOTA }
          if (tipo_juro = 'C') then
          begin
            valaux:= Calcula_Juro_Composto(StrToFloat(EdtTotal_Nota.Text), taxa_juro / 100, qtde_parcelas);
            Parameters.ParamByName('Valor').Value:= (valaux / qtde_parcelas);
            Parameters.ParamByName('Valor_Pagar').Value:= (valaux / qtde_parcelas);
            Parameters.ParamByName('Valor_Restante').Value:= (valaux / qtde_parcelas);
          end
          else
          begin
            valaux:= StrToFloat(EdtTotal_Nota.Text) + (StrToFloat(EdtTotal_Nota.Text) * (taxa_juro / 100));
            valaux:= (valaux / qtde_parcelas);
            Parameters.ParamByName('Valor').Value:= valaux;
            Parameters.ParamByName('Valor_Pagar').Value:= valaux;
            Parameters.ParamByName('Valor_Restante').Value:= valaux;
          end;

          Parameters.ParamByName('Codigo_Forma_Pagamento_Parcela').Value:= StrToInt(EdtCodigo_Condicao_Pagamento.Text);
          Parameters.ParamByName('Desconto').Value:= 0;
          Parameters.ParamByName('Acrescimo').Value:= 0;
          Parameters.ParamByName('Valor_Pago').Value:= 0;
          ExecSQL;
        end;
      end;
    except
      on E : Exception do
      begin
        TLog.Error(Self.ClassName+' - Gera_Conta_Pagar - '+E.Message);
        TMensagens.MensagemErro('Método Gera_Conta_Pagar: '+E.Message);
      end;
    end;
  finally
    FreeAndNil(qAux);
    FreeAndNil(qAux2);
  end;
end;

procedure TFrmEntrada_Produtos.Limpa_Menor;
begin
  LblProduto.Caption:= '';
  EdtCodigo_Produto.Clear;
  EdtNCM.Clear;
  EdtProduto.Clear;
  EdtUnidade.Clear;
  EdtSituacao_Tributaria.Clear;

  EdtValor_Unitario.Text:= '0,00';
  EdtQuantidade.Clear;
  EdtValor_Total.Text:= '0,00';
  EdtBC_ICMS.Text:= '0,00';
  EdtCusto_Unitario.Text:= '0,00';
  //EdtCusto_Total.Text:= '0,00';
  EdtQuantidade_Volume.Text:= '1';

  EdtBC_ICMS_ST.Text:= '0,00';
  EdtValor_ICMS_ST.Text:= '0,00';

  EdtICMS.Text:= '0';
  EdtIPI.Text:= '0';
  EdtValor_IPI.Text:= '0,00';
  EdtValor_ICMS_Unitario.Text:= '0,00';
  EdtPercentual_Lucro_Vista.Text:= '0';
  EdtValor_Vista.Text:= '0,00';
  EdtPercentual_Lucro_Prazo.Text:= '0';
  EdtValor_Prazo.Text:= '0,00';
  EdtIVA.Text:= '0,00';
  MEdtData_Validade.Text:= '  /  /    ';
  EdtCodigo_Produto.SetFocus;
end;

procedure TFrmEntrada_Produtos.MEdtData_EmissaoEnter(Sender: TObject);
begin
  if (achei = false) then
  begin
    MEdtData_Emissao.Text:= DateToStr(date);
    MEdtData_Primeira_Parcela.Text:= DateToStr(date);
  end;
end;

procedure TFrmEntrada_Produtos.MEdtData_EmissaoExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Emissao);
end;

procedure TFrmEntrada_Produtos.MEdtData_EntradaEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Entrada.Text:= DateToStr(date);
end;

procedure TFrmEntrada_Produtos.MEdtData_EntradaExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Entrada);
end;

procedure TFrmEntrada_Produtos.MEdtData_Primeira_ParcelaEnter(Sender: TObject);
begin
  MEdtData_Primeira_Parcela.Text:= DateToStr(date);
end;

procedure TFrmEntrada_Produtos.MEdtData_Primeira_ParcelaExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Primeira_Parcela);
end;

procedure TFrmEntrada_Produtos.MEdtData_ValidadeEnter(Sender: TObject);
begin
  if (MEdtData_Validade.Text <> '  /  /    ') then
    data_val:= StrToDateTime(MEdtData_Validade.Text);
end;

procedure TFrmEntrada_Produtos.MEdtData_ValidadeExit(Sender: TObject);
begin
  if (MEdtData_Validade.Text <> '  /  /    ') then
  begin
    Util.Verifica_Data(MEdtData_Validade);
    if (data_val <> StrToDateTime(MEdtData_Validade.Text)) then
    begin
      Application.MessageBox(PChar('A data de validade informada é diferente da data de validade no cadastro deste produto.'+#10+#13+#10+#13 +'Data cadastrada atualmente: '+DateTimeToStr(data_val)+#10+#13+'Nova data de validade: '+MEdtData_Validade.Text), 'Data de validade diferente', MB_OK+MB_ICONHAND);
    end;
  end;
end;

procedure TFrmEntrada_Produtos.MEdtHora_EmissaoEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtHora_Emissao.Text:= FormatDateTime('hh:mm', Time);
end;

procedure TFrmEntrada_Produtos.MEdtHora_EntradaEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtHora_Entrada.Text:= FormatDateTime('hh:mm', Time);
end;

procedure TFrmEntrada_Produtos.Ver_Pedido;
begin
  try
    EdtCodigo.Text:= qAuxItensNota.FieldByName('Codigo').AsString;
    EdtModelo.Text:= qAuxItensNota.FieldByName('Modelo').AsString;
    EdtSerie.Text:= qAuxItensNota.FieldByName('Serie').AsString;
    MEdtData_Emissao.Text:= qAuxItensNota.FieldByName('Data_Emissao').AsString;
    MEdtHora_Emissao.Text:= qAuxItensNota.FieldByName('Hora_Emissao').AsString;
    MEdtData_Entrada.Text:= qAuxItensNota.FieldByName('Data_Entrada').AsString;
    MEdtHora_Entrada.Text:= qAuxItensNota.FieldByName('Hora_Entrada').AsString;
    EdtCodigo_Fornecedor.Text:= qAuxItensNota.FieldByName('Codigo_Fornecedor').AsString;
    EdtFornecedor.Text:= qAuxItensNota.FieldByName('Nome_Fantasia').AsString;
    uf_destino:= qAuxItensNota.FieldByName('UF').AsString;
    EdtCodigo_CFOP.Text:= qAuxItensNota.FieldByName('Codigo_CFOP').AsString;
    EdtCFOP.Text:= qAuxItensNota.FieldByName('CFOP').AsString + ' - ' + qAuxItensNota.FieldByName('Descricao').AsString;
    EdtCFOP2.Text:= qAuxItensNota.FieldByName('CFOP').AsString;
    EdtChave_Acesso.Text:= qAuxItensNota.FieldByName('Chave_NFe_Entrada').AsString;
    EdtQuantidade_Itens.Text:= qAuxItensNota.FieldByName('Quantidade_Itens').AsString;
    MmoObservacao.Text:= qAuxItensNota.FieldByName('Observacao').AsString;
    qtde:= qAuxItensNota.FieldByName('Quantidade_Itens').AsInteger;
    EditCaixaECF.Text := Trim(qAuxItensNota.FieldByName('Caixa_ECF').AsString);

    if (qAuxItensNota.FieldByName('Tipo_Frete').AsInteger = 0) then
      RGTipo_Frete.ItemIndex := 0
    else if (qAuxItensNota.FieldByName('Tipo_Frete').AsInteger = 1) then
      RGTipo_Frete.ItemIndex := 1
    else if (qAuxItensNota.FieldByName('Tipo_Frete').AsInteger = 2) then
      RGTipo_Frete.ItemIndex := 2
    else if (qAuxItensNota.FieldByName('Tipo_Frete').AsInteger = 9) then
      RGTipo_Frete.ItemIndex := 3;

    if (qAuxItensNota.FieldByName('Tipo_Pagamento').AsInteger = 0) then
      RGTipo_Pagamento.ItemIndex := 0
    else if (qAuxItensNota.FieldByName('Tipo_Pagamento').AsInteger = 1) then
      RGTipo_Pagamento.ItemIndex := 1
    else if (qAuxItensNota.FieldByName('Tipo_Pagamento').AsInteger = 9) then
      RGTipo_Pagamento.ItemIndex := 2;

    if (qAuxItensNota.FieldByName('Finalizada').AsInteger = 0) then
      CBFecharNota.Checked:= True
    else
      CBFecharNota.Checked:= False;

    EdtCodigo_Transportadora.Text:= qAuxItensNota.FieldByName('Codigo_Transportadora').AsString;
    EdtTransportadora.Text:= qAuxItensNota.FieldByName('Nome_Transportadora').AsString;

    EdtCodigo_Veiculo.Text:= qAuxItensNota.FieldByName('Codigo_Veiculo').AsString;
    EdtVeiculo.Text:= qAuxItensNota.FieldByName('Placa').AsString;
    EdtUF_Veiculo.Text:= qAuxItensNota.FieldByName('UF').AsString;

    EdtQuantidade_Transportada.Text:= qAuxItensNota.FieldByName('Quantidade').AsString;
    EdtEspecie.Text:= qAuxItensNota.FieldByName('Especie').AsString;
    EdtMarca.Text:= qAuxItensNota.FieldByName('Marca').AsString;
    EdtNumero_Transportado.Text:= qAuxItensNota.FieldByName('Numero').AsString;
    EdtPeso_Bruto.Text:= qAuxItensNota.FieldByName('Peso_Bruto').AsString;
    EdtPeso_Liquido.Text:= qAuxItensNota.FieldByName('Peso_Liquido').AsString;

    EdtTotal_Produtos.Text:= FormatFloat('#0.0,0', qAuxItensNota.FieldByName('Total_Produtos').AsFloat);
    EdtTotal_Produtos.Text:= StringReplace(EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtBase_ICMS.Text:= FormatFloat('#0.0,0', qAuxItensNota.FieldByName('Base_ICMS').AsFloat);
    EdtBase_ICMS.Text:= StringReplace(EdtBase_ICMS.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtValor_ICMS.Text:= FormatFloat('#0.0,0', qAuxItensNota.FieldByName('Valor_ICMS').AsFloat);
    EdtValor_ICMS.Text:= StringReplace(EdtValor_ICMS.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtIsento_ICMS.Text:= FormatFloat('#0.0,0', qAuxItensNota.FieldByName('Isento_ICMS').AsFloat);
    EdtIsento_ICMS.Text:= StringReplace(EdtIsento_ICMS.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtOutros_ICMS.Text:= FormatFloat('#0.0,0', qAuxItensNota.FieldByName('Outros_ICMS').AsFloat);
    EdtOutros_ICMS.Text:= StringReplace(EdtOutros_ICMS.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtBase_ICMS_Substituicao.Text:= FormatFloat('#0.0,0', qAuxItensNota.FieldByName('Base_ICMS_Subs').AsFloat);
    EdtBase_ICMS_Substituicao.Text:= StringReplace(EdtBase_ICMS_Substituicao.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtValor_ICMS_Substituicao.Text:= FormatFloat('#0.0,0', qAuxItensNota.FieldByName('Valor_ICMS_Subs').AsFloat);
    EdtValor_ICMS_Substituicao.Text:= StringReplace(EdtValor_ICMS_Substituicao.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtAliquota_ICMS.Text:= FormatFloat('#0.0,0', qAuxItensNota.FieldByName('Aliquota').AsFloat);
    EdtAliquota_ICMS.Text:= StringReplace(EdtAliquota_ICMS.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtValor_Frete.Text:= FormatFloat('#0.0,0', qAuxItensNota.FieldByName('Valor_Frete').AsFloat);
    EdtValor_Frete.Text:= StringReplace(EdtValor_Frete.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtValor_Seguro.Text:= FormatFloat('#0.0,0', qAuxItensNota.FieldByName('Valor_Seguro').AsFloat);
    EdtValor_Seguro.Text:= StringReplace(EdtValor_Seguro.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtOutras_Despesas.Text:= FormatFloat('#0.0,0', qAuxItensNota.FieldByName('Outras_Despesas').AsFloat);
    EdtOutras_Despesas.Text:= StringReplace(EdtOutras_Despesas.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtTotal_IPI.Text:= FormatFloat('#0.0,0', qAuxItensNota.FieldByName('Total_IPI').AsFloat);
    EdtTotal_IPI.Text:= StringReplace(EdtTotal_IPI.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtIsento_IPI.Text:= FormatFloat('#0.0,0', qAuxItensNota.FieldByName('Isento_IPI').AsFloat);
    EdtIsento_IPI.Text:= StringReplace(EdtIsento_IPI.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtOutros_IPI.Text:= FormatFloat('#0.0,0', qAuxItensNota.FieldByName('Outros_IPI').AsFloat);
    EdtOutros_IPI.Text:= StringReplace(EdtOutros_IPI.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtDesconto.Text:= FormatFloat('#0.0,0', qAuxItensNota.FieldByName('Desconto').AsFloat);
    EdtDesconto.Text:= StringReplace(EdtDesconto.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtTotal_Nota.Text:= FormatFloat('#0.0,0', qAuxItensNota.FieldByName('Total_Nota').AsFloat);
    EdtTotal_Nota.Text:= StringReplace(EdtTotal_Nota.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtCusto_Total.Text:= FormatFloat('#0.0,0', qAuxItensNota.FieldByName('Custo_Total').AsFloat);
    EdtCusto_Total.Text:= StringReplace(EdtCusto_Total.Text, ThousandSeparator, '', [rfReplaceAll]);
    PreencheObjetoImpostosEntrada;
    BBtnSalvar.Enabled:= true;
    BBtnExcluir.Enabled:= true;
    BBtnCancelar.Enabled:= true;
    BBtnCancela_Nota.Enabled:= true;
    BBtnCopia_Nota.Enabled:= false;
  except
    on E : Exception do
    begin
      TLog.Error(Self.ClassName+' - Ver_Pedido - '+E.Message);
      TMensagens.MensagemErro('Método Ver_Pedido: '+E.Message);
    end;
  end;
end;

end.
