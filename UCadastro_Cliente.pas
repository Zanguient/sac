unit UCadastro_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids,
  DBGrids, UGeral, URegistro,
  ExtCtrls, Buttons, ExtDlgs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFrmCadastro_Cliente = class(TForm)
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
    LblMarca: TLabel;
    EdtNome: TEdit;
    BBtnPesquisar: TToolButton;
    CBTipo: TCheckBox;
    Label1: TLabel;
    EdtRazao_Social: TEdit;
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
    Label22: TLabel;
    Label16: TLabel;
    EdtInsc_Estadual: TEdit;
    EdtCNPJ: TMaskEdit;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    LblNumero: TLabel;
    Label13: TLabel;
    LblUF: TLabel;
    Label23: TLabel;
    EdtEndereco: TEdit;
    EdtNumero: TEdit;
    EdtCEP: TEdit;
    EdtSetor: TEdit;
    EdtCidade: TEdit;
    EdtUF: TEdit;
    EdtReferencia: TEdit;
    Label2: TLabel;
    EdtCodigo_Setor: TEdit;
    Label3: TLabel;
    EdtCodigo_Cidade: TEdit;
    Label4: TLabel;
    LblEmail: TLabel;
    EdtEmail: TEdit;
    EdtGrupo: TEdit;
    EdtCodigo_Grupo: TEdit;
    Label5: TLabel;
    LblProfissao: TLabel;
    EdtProfissao: TEdit;
    Label6: TLabel;
    LblData_Nasc: TLabel;
    CmbEstado_Civil: TComboBox;
    MEdtData_Nascimento: TMaskEdit;
    Label7: TLabel;
    MEdtTelefone: TMaskEdit;
    Label8: TLabel;
    MEdtCelular: TMaskEdit;
    Label9: TLabel;
    EdtContato: TEdit;
    Label10: TLabel;
    MEdtTelefone_Contato: TMaskEdit;
    Label11: TLabel;
    EdtSite: TEdit;
    TabSheet3: TTabSheet;
    Label14: TLabel;
    EdtLimite_Credito: TEdit;
    Label15: TLabel;
    CmbAcima_Limite_Credito: TComboBox;
    Label17: TLabel;
    EdtLimite_Desconto: TEdit;
    Label18: TLabel;
    CmbAcima_Limite_Desconto: TComboBox;
    Label47: TLabel;
    MmoObservacoes: TMemo;
    Label24: TLabel;
    EdtComplemento: TEdit;
    Label26: TLabel;
    EdtSuframa: TEdit;
    TabSheet4: TTabSheet;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    EdtEndereco_Outros: TEdit;
    EdtNumero_Outros: TEdit;
    EdtCEP_Outros: TEdit;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Label31: TLabel;
    EdtTipo_Endereco: TEdit;
    Label32: TLabel;
    EdtComplemento_Outros: TEdit;
    Label33: TLabel;
    Label34: TLabel;
    EdtInsc_Municipal: TEdit;
    Label40: TLabel;
    EdtTabela_Preco: TEdit;
    EdtCodigo_Tabela_Preco: TEdit;
    TabSheet5: TTabSheet;
    MEdtData_Inicial: TMaskEdit;
    Label35: TLabel;
    MEdtData_Final: TMaskEdit;
    Label36: TLabel;
    DataSource2: TDataSource;
    qryPedido: TADOQuery;
    RGTipo: TRadioGroup;
    TabSheet6: TTabSheet;
    qrydados_adicionais: TADOQuery;
    DataSource3: TDataSource;
    Label39: TLabel;
    EdtSetor_Outros: TEdit;
    EdtCodigo_Setor_Outros: TEdit;
    intgrfldPedidoCodigo: TIntegerField;
    strngfldPedidoN_Pedido: TStringField;
    strngfldPedidoN_Pre_Venda: TStringField;
    qryPedidoTotal_Pedido: TFloatField;
    strngfldPedidoNome_Nome_Fantasia: TStringField;
    qryPedidoData_Venda: TDateTimeField;
    ADOQuery4: TADOQuery;
    ADOQuery4Codigo_Registro: TAutoIncField;
    ADOQuery4Codigo: TIntegerField;
    ADOQuery4N_Item: TStringField;
    ADOQuery4Codigo_Produto: TIntegerField;
    ADOQuery4Codigo_Venda: TStringField;
    ADOQuery4Descricao: TStringField;
    ADOQuery4NCM: TStringField;
    ADOQuery4Origem: TStringField;
    ADOQuery4CFOP: TStringField;
    ADOQuery4UN: TStringField;
    ADOQuery4Tipo_Calculo_BC_ICMS: TStringField;
    ADOQuery4Tipo_Recolhimento: TStringField;
    ADOQuery4ICMS: TStringField;
    ADOQuery4CST: TStringField;
    ADOQuery4CSOSN: TStringField;
    ADOQuery4Base_Reduzida: TStringField;
    ADOQuery4Base_Acrescida: TStringField;
    ADOQuery4BC: TStringField;
    ADOQuery4Valor_ICMS: TStringField;
    ADOQuery4Tipo_Calculo_BC_ICMS_ST: TStringField;
    ADOQuery4MVAST: TStringField;
    ADOQuery4ICMS_ST: TStringField;
    ADOQuery4CST_ST: TStringField;
    ADOQuery4Base_Reduzida_ST: TStringField;
    ADOQuery4Base_Acrescida_ST: TStringField;
    ADOQuery4BC_ST: TStringField;
    ADOQuery4Valor_ICMS_ST: TStringField;
    ADOQuery4Aliquota_Calculo_Credito: TStringField;
    ADOQuery4Credito_ICMS: TStringField;
    ADOQuery4Tipo_Calculo_IPI: TStringField;
    ADOQuery4IPI: TStringField;
    ADOQuery4CST_IPI: TStringField;
    ADOQuery4Base_Reduzida_IPI: TStringField;
    ADOQuery4Base_Acrescida_IPI: TStringField;
    ADOQuery4BC_IPI: TStringField;
    ADOQuery4Valor_IPI: TFloatField;
    ADOQuery4Tipo_Calculo_PIS: TStringField;
    ADOQuery4PIS: TStringField;
    ADOQuery4CST_PIS: TStringField;
    ADOQuery4Base_Reduzida_PIS: TStringField;
    ADOQuery4Base_Acrescida_PIS: TStringField;
    ADOQuery4BC_PIS: TStringField;
    ADOQuery4Valor_PIS: TFloatField;
    ADOQuery4Tipo_Calculo_COFINS: TStringField;
    ADOQuery4COFINS: TStringField;
    ADOQuery4CST_COFINS: TStringField;
    ADOQuery4Base_Reduzida_COFINS: TStringField;
    ADOQuery4Base_Acrescida_COFINS: TStringField;
    ADOQuery4BC_COFINS: TStringField;
    ADOQuery4Valor_COFINS: TFloatField;
    ADOQuery4Qtde: TFloatField;
    ADOQuery4Qtde_Entregue: TFloatField;
    ADOQuery4Qtde_Restante: TFloatField;
    ADOQuery4Qtde_S_Previsao: TFloatField;
    ADOQuery4Valor_Compra: TFloatField;
    ADOQuery4Valor_Original: TFloatField;
    ADOQuery4Valor_Unitario: TFloatField;
    ADOQuery4Desc_Acr: TFloatField;
    ADOQuery4Desc_Acr_P: TFloatField;
    ADOQuery4Tipo_Desc_Acr: TStringField;
    ADOQuery4dOUa: TStringField;
    ADOQuery4Valor_Frete: TFloatField;
    ADOQuery4Valor_Seguro: TFloatField;
    ADOQuery4Outras_Despesas: TFloatField;
    ADOQuery4Sub_Total: TFloatField;
    ADOQuery4Sub_Total_Liquido: TFloatField;
    ADOQuery4Cancelado: TStringField;
    ADOQuery4Indica_Valor_Total: TStringField;
    ADOQuery4Data_Entrega: TDateTimeField;
    ADOQuery4Hora_Entrega: TStringField;
    ADOQuery4Tipo_Entrega: TStringField;
    Label25: TLabel;
    EdtCredito: TEdit;
    TabSheet7: TTabSheet;
    DBGrid4: TDBGrid;
    Label41: TLabel;
    MEdtTelefone_Adicional: TMaskEdit;
    Label42: TLabel;
    CmbTipo_Telefone: TComboBox;
    qrytelefone: TADOQuery;
    DataSource4: TDataSource;
    qrytelefoneCodigo_Cliente: TIntegerField;
    qrytelefoneTelefone: TStringField;
    qrytelefoneTipo: TStringField;
    qrytelefoneCodigo_Telefone: TIntegerField;
    CBBloqueado: TCheckBox;
    RGEnquadramento: TRadioGroup;
    ADOQuery4Tipo_Calculo_BC_ICMS_NF: TStringField;
    ADOQuery4Tipo_Recolhimento_NF: TStringField;
    ADOQuery4ICMS_NF: TStringField;
    ADOQuery4CST_NF: TStringField;
    ADOQuery4CSOSN_NF: TStringField;
    ADOQuery4Base_Reduzida_NF: TStringField;
    ADOQuery4Base_Acrescida_NF: TStringField;
    ADOQuery4BC_NF: TStringField;
    ADOQuery4Valor_ICMS_NF: TStringField;
    ADOQuery4Tipo_Venda: TStringField;
    ADOQuery4Comissao: TFloatField;
    ADOQuery4Perc_Desc_Vista: TFloatField;
    ADOQuery4Perc_Desc_Prazo: TFloatField;
    ADOQuery4Permite_Credito: TIntegerField;
    ADOQuery4Codigo_Obs_Fiscal: TIntegerField;
    ADOQuery4Qtde_Estoque_Atual: TFloatField;
    ADOQuery4Valor_Compra_Nota: TFloatField;
    BBtnImprimir: TToolButton;
    PageControl3: TPageControl;
    TabSheet8: TTabSheet;
    Label38: TLabel;
    EdtEmpresa: TEdit;
    DBGrid3: TDBGrid;
    EdtInscricao_Empresa: TEdit;
    Label37: TLabel;
    TabSheet9: TTabSheet;
    Label43: TLabel;
    EdtPai: TEdit;
    Label44: TLabel;
    EdtMae: TEdit;
    Label45: TLabel;
    EdtConjuge: TEdit;
    Label46: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    EdtNaturalidade: TEdit;
    EdtNacionalidade: TEdit;
    EdtGrau_Instrucao: TEdit;
    TabSheet10: TTabSheet;
    Img1: TImage;
    SpeedButton2: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Img2: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    qryautorizados: TADOQuery;
    DataSource5: TDataSource;
    qryautorizadosCodigo: TAutoIncField;
    qryautorizadosCodigo_Cliente: TIntegerField;
    qryautorizadosNome_Autorizado: TStringField;
    qryautorizadosCPF_Autorizado: TStringField;
    TabSheet12: TTabSheet;
    Label50: TLabel;
    Label51: TLabel;
    EdtNome_Autorizado: TEdit;
    DBGrid5: TDBGrid;
    EdtCPF_Autorizado: TEdit;
    BBtnNovo: TToolButton;
    ADOQuery1Codigo_Cliente: TIntegerField;
    ADOQuery1Codigo_Setor: TIntegerField;
    ADOQuery1Numero: TStringField;
    ADOQuery1Complemento: TStringField;
    ADOQuery1Tipo_Endereco: TStringField;
    ADOQuery1Endereco: TStringField;
    ADOQuery1CEP: TStringField;
    ADOQuery1Codigo_Registro: TAutoIncField;
    ADOQuery1Setor: TStringField;
    Label12: TLabel;
    Label28: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    EdtEndereco_DAC: TEdit;
    EdtNumero_DAC: TEdit;
    EdtCEP_DAC: TEdit;
    EdtComplemento_DAC: TEdit;
    EdtSetor_DAC: TEdit;
    EdtCodigo_Setor_DAC: TEdit;
    EdtCidade_DAC: TEdit;
    EdtCodigo_Cidade_DAC: TEdit;
    Label55: TLabel;
    qrydados_adicionaisCodigo_Cliente: TIntegerField;
    qrydados_adicionaisEmpresa: TStringField;
    qrydados_adicionaisInscricao: TStringField;
    qrydados_adicionaisEndereco: TStringField;
    qrydados_adicionaisNumero: TStringField;
    qrydados_adicionaisCEP: TStringField;
    qrydados_adicionaisComplemento: TStringField;
    qrydados_adicionaisCodigo_Setor: TIntegerField;
    qrydados_adicionaisCodigo_Cidade: TIntegerField;
    qrydados_adicionaisCodigo_Registro: TAutoIncField;
    qrydados_adicionaisSetor: TStringField;
    qrydados_adicionaisCidade: TStringField;
    BitBtn2: TBitBtn;
    qrydados_adicionaisSetorTeste: TStringField;
    qrydados_adicionaisCidadeLookUp: TStringField;
    ADOQuery1SetorLookUp: TStringField;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    cxgrd1: TcxGrid;
    cxgrdbtblvwGrid1DBTableView1: TcxGridDBTableView;
    cxgrd1TableView1: TcxGridTableView;
    cxgrd1TableView1Column1: TcxGridColumn;
    cxgrdbtblvwcxgrd1DBTableView2: TcxGridDBTableView;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Codigo: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Codigo_Produto: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Codigo_Venda: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Descricao: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2UN: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Qtde: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Valor_Original: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Desc_Acr: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Valor_Unitario: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Valor_Compra: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Sub_Total: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Valor_ICMS_ST: TcxGridDBColumn;
    cxgrdlvlcxgrd1Level1: TcxGridLevel;
    cxgrdbclmnGrid1DBTableView1N_Pedido: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1N_Pre_Venda: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1Total_Pedido: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1Data_Venda: TcxGridDBColumn;
    BindingsList1: TBindingsList;
    cxgrdbtblvwcxgrd1DBTableView1: TcxGridDBTableView;
    cxgrdlvlcxgrd1Level2: TcxGridLevel;
    cxgrdbtblvwcxgrd1DBTableView3: TcxGridDBTableView;
    ds1: TDataSource;
    qryItensPedido: TADOQuery;
    qryItensPedidoCodigo_Registro: TAutoIncField;
    intgrfldItensPedidoCodigo: TIntegerField;
    strngfldItensPedidoCodigo_Venda: TStringField;
    strngfldItensPedidoDescricao: TStringField;
    qryItensPedidoQtde: TFloatField;
    qryItensPedidoValor_Unitario: TFloatField;
    qryItensPedidoSub_Total: TFloatField;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView3Codigo_Registro: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView3Codigo: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView3Codigo_Venda: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView3Descricao: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView3Qtde: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView3Valor_Unitario: TcxGridDBColumn;
    cxgrdbclmncxgrdbtblvwcxgrd1DBTableView3Sub_Total: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1Codigo: TcxGridDBColumn;
    rgPeriodoVenda: TRadioGroup;
    txtEdtCidadeOutros: TEdit;
    lbl1: TLabel;
    ADOQuery1NomeCidade: TStringField;
    txtEdtCodCidadeOutros: TEdit;
    ADOQuery1Codigo_Cidade: TAutoIncField;
    TabSheet11: TTabSheet;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridTableView1: TcxGridTableView;
    cxGridColumn1: TcxGridColumn;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    qryocorrencia: TADOQuery;
    DataSource6: TDataSource;
    qryocorrenciaData_Cadastro: TDateTimeField;
    qryocorrenciaData_Cobranca: TDateTimeField;
    qryocorrenciaResponsavel_Atendimento: TStringField;
    qryocorrenciaOrigem_Atendimento: TIntegerField;
    qryocorrenciaCodigo_Lancamento_Financeiro: TIntegerField;
    qryocorrenciaN_Documento: TIntegerField;
    qryocorrenciaObservacoes: TStringField;
    cxGridDBTableView1Data_Cadastro: TcxGridDBColumn;
    cxGridDBTableView1Data_Cobranca: TcxGridDBColumn;
    cxGridDBTableView1Responsavel_Atendimento: TcxGridDBColumn;
    cxGridDBTableView1Origem_Atendimento: TcxGridDBColumn;
    cxGridDBTableView1Codigo_Lancamento_Financeiro: TcxGridDBColumn;
    cxGridDBTableView1N_Documento: TcxGridDBColumn;
    cxGridDBTableView1Observacoes: TcxGridDBColumn;
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
    procedure EdtRGKeyPress(Sender: TObject; var Key: Char);
    procedure EdtInsc_EstadualKeyPress(Sender: TObject; var Key: Char);
    procedure EdtLimite_CreditoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtLimite_DescontoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_SetorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_CidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_GrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtData_EmissaoExit(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
    procedure EdtCPFExit(Sender: TObject);
    procedure MEdtData_NascimentoExit(Sender: TObject);
    procedure EdtCNPJExit(Sender: TObject);
    procedure EdtLimite_CreditoExit(Sender: TObject);
    procedure EdtLimite_DescontoExit(Sender: TObject);
    procedure EdtCodigo_PaisKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Endereco_OutrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_Tabela_PrecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtEndereco_OutrosKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Endereco_OutrosKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTipo_Logradouro_OutrosKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_EnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTipo_LogradouroKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_SetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_PaisKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPaisKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_GrupoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtGrupoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Tabela_PrecoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTabela_PrecoKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtData_InicialExit(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Setor_OutrosKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Setor_OutrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtSetor_OutrosKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure EdtRazao_SocialEnter(Sender: TObject);
    procedure EdtCodigo_EnderecoDblClick(Sender: TObject);
    procedure EdtCodigo_SetorDblClick(Sender: TObject);
    procedure EdtCodigo_CidadeDblClick(Sender: TObject);
    procedure EdtCodigo_Tabela_PrecoDblClick(Sender: TObject);
    procedure EdtCodigo_GrupoDblClick(Sender: TObject);
    procedure EdtCodigo_Endereco_OutrosDblClick(Sender: TObject);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBTipoClick(Sender: TObject);
    procedure EdtEnderecoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtEnderecoExit(Sender: TObject);
    procedure EdtSetorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtSetorExit(Sender: TObject);
    procedure EdtCidadeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCidadeExit(Sender: TObject);
    procedure EdtSetor_OutrosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtSetor_OutrosExit(Sender: TObject);
    procedure EdtEndereco_OutrosKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtEndereco_OutrosExit(Sender: TObject);
    procedure MEdtData_InicialEnter(Sender: TObject);
    procedure MEdtData_FinalEnter(Sender: TObject);
    procedure MEdtData_FinalExit(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGrid5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnNovoClick(Sender: TObject);
    procedure EdtCodigo_Setor_DACKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Cidade_DACKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtSetor_DACKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCidade_DACKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Cidade_DACKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Setor_DACKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rgPeriodoVendaClick(Sender: TObject);
    procedure txtEdtCodCidadeOutrosKeyPress(Sender: TObject; var Key: Char);
    procedure txtEdtCidadeOutrosKeyPress(Sender: TObject; var Key: Char);
    procedure txtEdtCodCidadeOutrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qryocorrenciaOrigem_AtendimentoGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    Cliente: URegistro.TCliente;
    Cliente_Outros: URegistro.TCliente_Outros;
    Endereco: URegistro.TEndereco_Cliente;
    Telefone: URegistro.TTelefone_Cliente;
    Dados_Adicionais: URegistro.TDados_Adicionais_Cliente;
    Autorizados: URegistro.TCliente_Autorizados;
    Itens_Pedido: URegistro.TItens_Pedido;
    Util: TUtil;
    iniciado: Boolean;
    codigo_endereco, codigo_setor, codigo_cidade: Integer;
    nome_imagem1, nome_imagem2, nome_imagem3: AnsiString;

    procedure Limpa_Menor;
    procedure Limpa_Menor_Telefone;
    procedure Chama_Compra_Cliente;
    procedure Chama_Itens_Pedido_Relatorio;
    procedure Atualiza_Itens_Venda;
    procedure Pega_Itens_Venda;
    procedure Salva_Itens;
    procedure Grava_Temporario;
    procedure Atualiza_Pedido_Temporario;
    procedure Verifica_CPF_Cadastrado;
    procedure Inicia_Itens;

  public
    ativo, enderec, achei, achei_outros, achei_telefone, achou_endereco,
      achou_setor, achou_cidade, achou_setor_outros,
      achou_endereco_outros: Boolean;
    codigo_telefone, seto, cid: Integer;
    Conexao: TADOConnection;

    procedure Atualiza_Dados;
    procedure Atualiza_Dados_Telefone;
    procedure Atualiza_Dados_Adicionais;
    procedure Atualiza_Dados_Autorizados;
    procedure Atualiza_Dados_Ocorrencia;
    procedure Gera_Codigo;
    procedure Gera_Codigo_Telefone;
    procedure Chama_Imagens;
    constructor Create();
  protected
    function Confira: Boolean;
    function Confira_Endereco: Boolean;
    function Confira_Telefone: Boolean;
    function Confira_Autorizados: Boolean;
  end;

var
  FrmCadastro_Cliente: TFrmCadastro_Cliente;

implementation

uses UChama_Logradouro, UChama_Setor, UChama_Cidade, UChama_Grupo_Cliente,
  UChama_Cliente, UDeclaracao, UChama_Pais, UDM, UChama_Tabela_Preco,
  UPedido_Venda, URel_Ficha_Cliente, Conexao.TConexao, Util.TLog,
  Util.Mensagens;

{$R *.dfm}
{ TFrmPadrao }

procedure TFrmCadastro_Cliente.Atualiza_Dados;
begin
  with ADOQuery1, sql do
  begin
    close;
    Clear;
    add('select EC.*, S.Descricao as Setor, C.Descricao as NomeCidade, C.Codigo as Codigo_Cidade from Endereco_Cliente EC');
    // add('inner join Logradouro L on (L.Codigo = EC.Codigo_Endereco)');
    add('left join Setor S on (S.Codigo = EC.Codigo_Setor)');
    add('left join Cidade C on (C.Codigo = EC.Codigo_Cidade)');
    add('where EC.Codigo_Cliente = :Codigo');
    Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmCadastro_Cliente.Atualiza_Dados_Adicionais;
begin
  with qrydados_adicionais, sql do
  begin
    close;
    Clear;
    add('select DAC.*, S.Descricao as Setor, C.Descricao as Cidade from Dados_Adicionais_Cliente DAC');
    add('left join Setor S on (DAC.Codigo_Setor = S.Codigo)');
    add('left join Cidade C on (DAC.Codigo_Cidade = C.Codigo)');
    add('where DAC.Codigo_Cliente = :Codigo');
    Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmCadastro_Cliente.Atualiza_Dados_Autorizados;
begin
  with qryautorizados, sql do
  begin
    close;
    Clear;
    add('select CA.* from Cliente_Autorizados CA');
    add('where CA.Codigo_Cliente = :Codigo');
    Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmCadastro_Cliente.Atualiza_Dados_Ocorrencia;
begin
  with qryocorrencia, sql do
  begin
    close;
    Clear;
    add('select T.Data_Cadastro, T.Data_Cobranca, T.Responsavel_Atendimento, T.Origem_Atendimento,');
    add('T.Codigo_Lancamento_Financeiro, T.N_Documento, T.Observacoes from Lancamento_Financeiro_Ocorrencia_Cobranca T');
    add('inner join Parcelas_Lancamentos PL on (T.Codigo_Lancamento_Financeiro = PL.Codigo and T.N_Documento = PL.N_Documento)');
    add('inner join Lancamento_Financeiro LF on (PL.Codigo = LF.Codigo)');
    Add('where LF.Codigo_Cli_For = :Codigo and PL.Status = :Status and LF.Tipo = :Tipo');
    Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
    Parameters.ParamByName('Status').Value := 'PENDENTE';
    Parameters.ParamByName('Tipo').Value := 'RECEBER';
    open;
  end;
end;

procedure TFrmCadastro_Cliente.Atualiza_Dados_Telefone;
begin
  with qrytelefone, sql do
  begin
    close;
    Clear;
    add('select TC.* from Telefone_Cliente TC');
    add('where TC.Codigo_Cliente = :Codigo');
    Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmCadastro_Cliente.BBtnCancelarClick(Sender: TObject);
begin
  { if (achei = false) then
    begin
    Endereco.Excluir_Tudo(Endereco);
    Dados_Adicionais.Excluir_Tudo(Dados_Adicionais);
    Autorizados.Excluir_Tudo;
    end; }
  TConexao.CancelaConexao(Conexao);

  Util.Limpa_Campos(FrmCadastro_Cliente);
  Util.Desabilita_Campos(FrmCadastro_Cliente);
  iniciado := false;
  BBtnSalvar.Enabled := false;
  BBtnExcluir.Enabled := false;
  BBtnPesquisar.Enabled := true;
  BBtnCancelar.Enabled := false;
  BBtnImprimir.Enabled := false;
  BBtnNovo.Enabled := true;

end;

procedure TFrmCadastro_Cliente.BBtnExcluirClick(Sender: TObject);
begin
  try
    if (Confirma_Exclusao) then
    begin
      Cliente.Excluir(Cliente, Conexao);
      Endereco.Excluir_Tudo(Endereco, Conexao);
      Telefone.Excluir_Tudo(Conexao);
      Dados_Adicionais.Excluir_Tudo(Dados_Adicionais, Conexao);
      Cliente_Outros.Excluir(Conexao);
      Autorizados.Excluir_Tudo(Conexao);

      TConexao.ConfirmaConexao(Conexao);
      UDeclaracao.Insere_Historico(usuario, 'EXCLUIU CLIENTE ' + EdtNome.Text +
        '.', TimeToStr(time), exclusao, date);
      BBtnSalvar.Enabled := false;
      BBtnExcluir.Enabled := false;
      BBtnPesquisar.Enabled := true;
      BBtnCancelar.Enabled := false;
      BBtnNovo.Enabled := true;
      BBtnImprimir.Enabled := false;
      Util.Desabilita_Campos(FrmCadastro_Cliente);
    end;
  except
    on E: Exception do
    begin
      TMensagens.MensagemErro
        ('Erro ao excluir cliente. Verifique se não foi lançado nenhuma venda para este cliente. '
        + E.Message);
      TLog.Error('Método BBtnExcluirClick CadastroCliente: ' + E.Message);
      TConexao.CancelaConexao(Conexao);
    end;
  end;
end;

procedure TFrmCadastro_Cliente.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Cliente.BBtnSalvarClick(Sender: TObject);
begin
  try
    if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Cliente.Inserir(Cliente, Conexao);
        Cliente_Outros.Inserir(Conexao);
        // Cria_Arquivo_Atualiza_Dados('IECli');
        // Cria_Arquivo_Atualiza_Dados('ICli');
        // Cria_Arquivo_Atualiza_Dados('ITCli');
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU CLIENTE ' +
          EdtNome.Text + '.', TimeToStr(time), insercao, date);
      end
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      begin
        Cliente.Alterar(Cliente, Conexao);
        Cliente_Outros.Alterar(Conexao);
        // Cria_Arquivo_Atualiza_Dados('AECli');
        // Cria_Arquivo_Atualiza_Dados('ACli');
        // Cria_Arquivo_Atualiza_Dados('ATCli');
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU CLIENTE ' + EdtNome.Text
          + '.', TimeToStr(time), alteracao, date);
      end
      else
        exit;
    end;

    TConexao.ConfirmaConexao(Conexao);
    iniciado := false;
    BBtnSalvar.Enabled := false;
    BBtnExcluir.Enabled := false;
    BBtnPesquisar.Enabled := true;
    BBtnCancelar.Enabled := false;
    BBtnImprimir.Enabled := true;
    BBtnNovo.Enabled := true;

    if (nome_imagem1 <> '') then
      RenameFile(nome_imagem1, caminho_servidor + 'Imagens\Clientes\' +
        EdtCodigo.Text + '-1.jpg');

    if (nome_imagem2 <> '') then
      RenameFile(nome_imagem2, caminho_servidor + 'Imagens\Clientes\' +
        EdtCodigo.Text + '-2.jpg');

    Util.Desabilita_Campos(FrmCadastro_Cliente);

  except
    on E: Exception do
    begin
      TMensagens.MensagemErro('Erro ao gravar cliente: ' + E.Message);
      TLog.Error('Método BBtnSalvarClick Cliente: ' + E.Message);
      TConexao.CancelaConexao(Conexao);
    end;
  end;

end;

procedure TFrmCadastro_Cliente.BitBtn1Click(Sender: TObject);
begin
  if (Confira_Endereco = true) then
  begin
    if (achei_outros = false) then
      Endereco.Inserir(Endereco, Conexao)
    else
      Endereco.Alterar(Endereco, Conexao);

    { if (achou_setor_outros = false) and (EdtSetor_Outros.Text <> '') then
      begin
      Cadastra_Setor(EdtSetor_Outros.Text, date);
      Cria_Arquivo_Atualiza_Dados('ISet');
      end; }

    { if (achou_endereco_outros = false) and (EdtEndereco_Outros.Text <> '') then
      begin
      Cadastra_Logradouro(EdtEndereco_Outros.Text, EdtTipo_Logradouro_Outros.Text, EdtCEP_Outros.Text, date);
      Cria_Arquivo_Atualiza_Dados('ILog');
      end; }

    Atualiza_Dados;
    achei_outros := false;
    achou_setor_outros := false;
    // achou_endereco_outros:= false;

    Limpa_Menor;
    EdtEndereco_Outros.SetFocus;
  end;
end;

procedure TFrmCadastro_Cliente.BitBtn2Click(Sender: TObject);
begin
  Dados_Adicionais.Inserir(Dados_Adicionais, Conexao);
  EdtEmpresa.Clear;
  EdtInscricao_Empresa.Clear;
  EdtEndereco_DAC.Clear;
  EdtNumero_DAC.Clear;
  EdtNumero_DAC.Clear;
  EdtCEP_DAC.Clear;
  EdtComplemento_DAC.Clear;
  EdtCodigo_Setor_DAC.Clear;
  EdtSetor_DAC.Clear;
  EdtCidade_DAC.Clear;
  EdtCodigo_Cidade_DAC.Clear;
  EdtEmpresa.SetFocus;
  Atualiza_Dados_Adicionais;
end;

procedure TFrmCadastro_Cliente.BitBtn3Click(Sender: TObject);
begin
  if (Confira_Autorizados) then
  begin
    Autorizados.Inserir(Conexao);
    EdtNome_Autorizado.Clear;
    EdtCPF_Autorizado.Clear;
    EdtNome_Autorizado.SetFocus;
    Atualiza_Dados_Autorizados;
  end;
end;

procedure TFrmCadastro_Cliente.BitBtn4Click(Sender: TObject);
begin
  if (Confira_Telefone = true) then
  begin
    if (achei_telefone = false) then
    begin
      Gera_Codigo_Telefone;
      Telefone.Inserir(Conexao);
    end
    else
    begin
      Telefone.Alterar(Conexao);
    end;

    Atualiza_Dados_Telefone;
    achei_telefone := false;
    Limpa_Menor_Telefone;
    MEdtTelefone_Adicional.SetFocus;
  end;
end;

procedure TFrmCadastro_Cliente.CBTipoClick(Sender: TObject);
begin
  { if (CBTipo.Checked) then
    begin
    GroupBox1.Enabled:= true;
    GroupBox2.Enabled:= false;
    end
    else
    begin
    GroupBox1.Enabled:= false;
    GroupBox2.Enabled:= true;
    end; }

  if CBTipo.Checked then
  begin
    EdtCNPJ.Enabled := false;
    EdtCPF.Enabled := true;
  end
  else
  begin
    EdtCPF.Enabled := false;
    EdtCNPJ.Enabled := true;
  end;
end;

procedure TFrmCadastro_Cliente.Chama_Compra_Cliente;
begin

  with qryPedido, sql do
  begin
    close;
    Clear;
    if (rgPeriodoVenda.ItemIndex = 0) then
    begin
      add('select P.Codigo, P.N_Pedido, P.N_Pre_Venda, P.Total_Pedido,P.Data_Venda,');
      add('C.Nome_Nome_Fantasia from Pedido P');
      add('left join Cliente C on (P.Codigo_Cliente = C.Codigo)');
      add('where P.Data_Venda between :DI and :DF and P.Codigo_Cliente = :Cliente and (P.Tipo = :Tipo or P.Tipo = :Tipo2 or P.Tipo = :Tipo3)');
      add('order by P.N_Pedido, P.Data_Venda');
      Parameters.ParamByName('DI').Value :=
        StrToDateTime(MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value := StrToDateTime(MEdtData_Final.Text);
      Parameters.ParamByName('Cliente').Value := StrToInt(EdtCodigo.Text);
    end
    else if (rgPeriodoVenda.ItemIndex = 1) then
    begin
      add('select top 1 P.Data_Venda, P.Codigo, P.N_Pedido, P.N_Pre_Venda, P.Total_Pedido,');
      add('C.Nome_Nome_Fantasia from Pedido P');
      add('left join Cliente C on (P.Codigo_Cliente = C.Codigo)');
      add('where P.Codigo_Cliente = :Cliente and (P.Tipo = :Tipo or P.Tipo = :Tipo2 or P.Tipo = :Tipo3)');
      add('GROUP BY C.Nome_Nome_Fantasia, P.Data_Venda,P.Codigo, P.N_Pedido, P.N_Pre_Venda, P.Total_Pedido');
      add('order by P.Data_Venda ASC');
      Parameters.ParamByName('Cliente').Value := StrToInt(EdtCodigo.Text);
    end
    else
    begin
      add('select top 1 P.Data_Venda, P.Codigo, P.N_Pedido, P.N_Pre_Venda, P.Total_Pedido,');
      add('C.Nome_Nome_Fantasia from Pedido P');
      add('left join Cliente C on (P.Codigo_Cliente = C.Codigo)');
      add('where P.Codigo_Cliente = :Cliente and (P.Tipo = :Tipo or P.Tipo = :Tipo2 or P.Tipo = :Tipo3)');
      add('GROUP BY C.Nome_Nome_Fantasia, P.Data_Venda,P.Codigo, P.N_Pedido, P.N_Pre_Venda, P.Total_Pedido');
      add('order by P.Data_Venda DESC');
      Parameters.ParamByName('Cliente').Value := StrToInt(EdtCodigo.Text);
    end;

    if (RGTipo.ItemIndex = 0) then
    begin
      Parameters.ParamByName('Tipo').Value := 'PRÉ-VENDA';
      Parameters.ParamByName('Tipo2').Value := 'PDV';
      Parameters.ParamByName('Tipo3').Value := 'NFE';
    end
    else
    begin
      Parameters.ParamByName('Tipo').Value := 'DAV';
      Parameters.ParamByName('Tipo2').Value := 'DAV';
      Parameters.ParamByName('Tipo3').Value := 'DAV';
    end;
    open;
  end;
end;

function TFrmCadastro_Cliente.Confira: Boolean;
begin
  Confira := false;

  if (Ob_Cliente_Nome = 0) then
  begin
    if (EdtNome.Text = '') then
    begin
      Mensagem_Falta_Dados;
      // PageControl2.TabIndex:= 0;
      EdtNome.SetFocus;
      exit;
    end;
  end;

  if (Ob_Cliente_Razao_Social = 0) then
  begin
    if (EdtRazao_Social.Text = '') then
    begin
      Mensagem_Falta_Dados;
      // PageControl2.TabIndex:= 0;
      EdtRazao_Social.SetFocus;
      exit;
    end;
  end;

  if (CBTipo.Checked) then
  begin
    EdtCNPJ.Enabled := false;
    if (Ob_Cliente_CPF = 0) then
    begin
      if (EdtCPF.Text = '') then
      begin
        Mensagem_Falta_Dados;
        // PageControl2.TabIndex:= 0;
        EdtCPF.SetFocus;
        exit;
      end;
    end;

    if (Ob_Cliente_RG = 0) then
    begin
      if (EdtRG.Text = '') then
      begin
        Mensagem_Falta_Dados;
        // PageControl2.TabIndex:= 0;
        EdtRG.SetFocus;
        exit;
      end;
    end;
  end;

  if (CBTipo.Checked = false) then
  begin
    if (Ob_Cliente_CNPJ = 0) then
    begin
      if (EdtCNPJ.Text = '') then
      begin
        Mensagem_Falta_Dados;
        // PageControl1.TabIndex:= 0;
        EdtCNPJ.SetFocus;
        exit;
      end;
    end;

    if (Ob_Cliente_Insc_Estadual = 0) then
    begin
      if (EdtInsc_Estadual.Text = '') then
      begin
        Mensagem_Falta_Dados;
        // PageControl1.TabIndex:= 0;
        EdtInsc_Estadual.SetFocus;
        exit;
      end;
    end;
  end;

  if (Ob_Cliente_Endereco = 0) then
  begin
    if (EdtEndereco.Text = '') then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 0;
      EdtEndereco.SetFocus;
      exit;
    end;
  end;

  if (Ob_Cliente_Numero = 0) then
  begin
    if (EdtNumero.Text = '') then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 0;
      EdtNumero.SetFocus;
      exit;
    end;
  end;

  if (Ob_Cliente_Setor = 0) then
  begin
    if (EdtCodigo_Setor.Text = '') then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 0;
      EdtCodigo_Setor.SetFocus;
      exit;
    end;
  end;

  if (Ob_Cliente_Email = 0) then
  begin
    if (EdtEmail.Text = '') then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 0;
      EdtEmail.SetFocus;
      exit;
    end;
  end;

  if (Ob_Cliente_Cidade = 0) then
  begin
    if (EdtCodigo_Cidade.Text = '') then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 0;
      EdtCodigo_Cidade.SetFocus;
      exit;
    end;
  end;

  if (Ob_Cliente_Data_Nascimento = 0) then
  begin
    if (MEdtData_Nascimento.Text = '  /  /    ') then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 0;
      MEdtData_Nascimento.SetFocus;
      exit;
    end;
  end;

  if (Ob_Cliente_Telefone = 0) then
  begin
    if (MEdtTelefone.Text = '(  )     -    ') then
    begin
      Mensagem_Falta_Dados;
      PageControl2.TabIndex := 0;
      MEdtTelefone.SetFocus;
      exit;
    end;
  end;

  Confira := true;
end;

function TFrmCadastro_Cliente.Confira_Autorizados: Boolean;
begin
  Confira_Autorizados := false;

  if EdtNome_Autorizado.Text = '' then
  begin
    Mensagem_Falta_Dados;
    EdtNome_Autorizado.SetFocus;
    exit;
  end;

  Confira_Autorizados := true;
end;

function TFrmCadastro_Cliente.Confira_Endereco: Boolean;
begin
  Confira_Endereco := false;

  if EdtEndereco_Outros.Text = '' then
  begin
    Mensagem_Falta_Dados;
    EdtEndereco_Outros.SetFocus;
    exit;
  end;

  if EdtCodigo_Setor_Outros.Text = '' then
  begin
    Mensagem_Falta_Dados;
    EdtEndereco_Outros.SetFocus;
    exit;
  end;

  if txtEdtCidadeOutros.Text = '' then
  begin
    Mensagem_Falta_Dados;
    EdtEndereco_Outros.SetFocus;
    exit;
  end;

  if EdtNumero_Outros.Text = '' then
  begin
    Mensagem_Falta_Dados;
    EdtNumero_Outros.SetFocus;
    exit;
  end;

  if EdtCEP_Outros.Text = '' then
  begin
    Mensagem_Falta_Dados;
    EdtCEP_Outros.SetFocus;
    exit;
  end;

  if EdtCodigo_Setor_Outros.Text = '' then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Setor_Outros.SetFocus;
    exit;
  end;

  Confira_Endereco := true;
end;

function TFrmCadastro_Cliente.Confira_Telefone: Boolean;
begin
  Confira_Telefone := false;

  if MEdtTelefone_Adicional.Text = '' then
  begin
    Mensagem_Falta_Dados;
    MEdtTelefone_Adicional.SetFocus;
    exit;
  end;

  Confira_Telefone := true;
end;

constructor TFrmCadastro_Cliente.Create;
begin
EdtCNPJ.Enabled := False;
end;

procedure TFrmCadastro_Cliente.DBGrid1DblClick(Sender: TObject);
begin
  EdtEndereco_Outros.Text := ADOQuery1Endereco.AsString;
  EdtNumero_Outros.Text := ADOQuery1Numero.AsString;
  EdtCEP_Outros.Text := ADOQuery1CEP.AsString;
  EdtComplemento_Outros.Text := ADOQuery1Complemento.AsString;
  EdtCodigo_Setor_Outros.Text := ADOQuery1Codigo_Setor.AsString;
  EdtSetor_Outros.Text := ADOQuery1Setor.AsString;
  EdtTipo_Endereco.Text := ADOQuery1Tipo_Endereco.AsString;
  txtEdtCodCidadeOutros.Text := ADOQuery1Codigo_Cidade.AsString;
  txtEdtCidadeOutros.Text := ADOQuery1NomeCidade.AsString;
  achei_outros := true;
end;

procedure TFrmCadastro_Cliente.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
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
  // TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TFrmCadastro_Cliente.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) then
  begin
    if (Confirma_Exclusao) then
    begin
      Endereco.Excluir(Endereco, Conexao);
      // Cria_Arquivo_Atualiza_Dados('DECli');
      Atualiza_Dados;
      Limpa_Menor;
      EdtEndereco_Outros.SetFocus;
    end;
  end;
end;

procedure TFrmCadastro_Cliente.Pega_Itens_Venda;
begin
  { with ADOQuery4, sql do
    begin
    close;
    clear;
    add('select IP.* from Itens_Pedido IP');
    add('where IP.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= qryPedidoCodigo.AsInteger;
    open;
    end; }
end;

procedure TFrmCadastro_Cliente.qryocorrenciaOrigem_AtendimentoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsInteger = 0) then
  begin
    Text:= 'LOJA';
  end
  else if (Sender.AsInteger = 1) then
  begin
    Text:= 'CLIENTE';
  end
  else if (Sender.AsInteger = 2) then
  begin
    Text:= 'FORNECEDOR';
  end;
end;

procedure TFrmCadastro_Cliente.rgPeriodoVendaClick(Sender: TObject);
begin
  Chama_Compra_Cliente;
end;

procedure TFrmCadastro_Cliente.Atualiza_Itens_Venda;
begin
  with FrmPedido_Venda.qryitens_venda, sql do
  begin
    close;
    Clear;
    add('select IP.*, M.Descricao as Marca, LP.Local from Itens_Pedido IP');
    add('left join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
    add('left join Localidade_Produto LP on (P.Codigo_Local = LP.Codigo)');
    add('where IP.Codigo = :Codigo and IP.Cancelado = :N order by IP.Descricao');
    Parameters.ParamByName('Codigo').Value :=
      StrToInt(FrmPedido_Venda.EdtCodigo.Text);
    Parameters.ParamByName('N').Value := 'N';
    open;
  end;
end;

procedure TFrmCadastro_Cliente.Atualiza_Pedido_Temporario;
begin
  with FrmPedido_Venda.qrypedido_temporario, sql do
  begin
    close;
    Clear;
    add('select PT.*, P.Codigo_Venda + ' + QuotedStr(' - ') +
      '+P.Descricao as Produto, P.Valor_Compra from Pedido_Temporario PT');
    add('left join Produto P on (PT.Codigo_Produto = P.Codigo)');
    add('where PT.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value := FrmPedido_Venda.EdtCodigo.Text;
    open;
  end;
  // Atualiza_Venda_Total;
end;

procedure TFrmCadastro_Cliente.DBGrid2DblClick(Sender: TObject);
var
  total_produtos, total_pedido: double;
begin
  // if (RGTipo.ItemIndex = 1) then
  // begin
  if (FrmPedido_Venda = Nil) then
    Application.CreateForm(TFrmPedido_Venda, FrmPedido_Venda);

  FrmPedido_Venda.Inicializa_Venda;
  // FrmPedido_Venda.EdtCodigo.Text:= ADOQuery2Codigo.AsString;
  // FrmPedido_Venda.EdtN_Pedido.Text:= ADOQuery2N_Pedido.AsString;
  FrmPedido_Venda.EdtN_PedidoExit(self);
  FrmPedido_Venda.Show;
  // BBtnCancelarClick(self);
  // FrmCadastro_Cliente.Close;
  { end
    else
    begin
    if (FrmPedido_Venda = Nil) then
    Application.CreateForm(TFrmPedido_Venda, FrmPedido_Venda);

    UDeclaracao.pre_venda:= '';
    UDeclaracao.pedido:= '';
    Gera_N_Pedido(FrmPedido_Venda.Conexao);
    Gera_Codigo_Lancamento(FrmPedido_Venda.Conexao);
    FrmPedido_Venda.EdtN_Pedido.Text:= UDeclaracao.pedido;
    FrmPedido_Venda.numero_pedido:= FrmPedido_Venda.EdtN_Pedido.Text;
    FrmPedido_Venda.EdtCodigo.Text:= IntToStr(UDeclaracao.codigo);
    FrmPedido_Venda.BBtnCopiar_DAV.Enabled:= false;
    FrmPedido_Venda.BBtnAnalisa_Venda.Enabled:= true;
    FrmPedido_Venda.BBtnOrcamento.Enabled:= true;
    FrmPedido_Venda.BBtnVoltar_Pedido.Enabled:= false;
    FrmPedido_Venda.achei:= false;
    FrmPedido_Venda.pode_fechar:= false;
    Util.Habilita_Campos(FrmPedido_Venda);


    Pega_Itens_Venda;
    ADOQuery4.First;
    while not ADOQuery4.Eof do
    begin
    Salva_Itens;
    Grava_Temporario;
    ADOQuery4.Next;
    end;
    Atualiza_Itens_Venda;
    Atualiza_Pedido_Temporario;

    total_produtos:= Pega_Total_Produto(StrToInt(FrmPedido_Venda.EdtCodigo.Text), FrmPedido_Venda.Conexao);//StrToFloat(EdtTotal_Produtos.Text) + (bruto_ant - valor_tot); //+ ((qtde * qryitens_vendaValor_Original.AsFloat) - bruto_ant);
    total_pedido:= Pega_Total_Pedido(StrToInt(FrmPedido_Venda.EdtCodigo.Text), FrmPedido_Venda.Conexao);//StrToFloat(EdtTotal_Pedido.Text) + (valor_tot - sub_total_ant);

    FrmPedido_Venda.EdtTotal_Produtos.Text:= FormatFloat('#0.0,0', total_produtos);
    FrmPedido_Venda.EdtTotal_Produtos.Text:= StringReplace(FrmPedido_Venda.EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmPedido_Venda.EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', total_pedido);
    FrmPedido_Venda.EdtTotal_Pedido.Text:= StringReplace(FrmPedido_Venda.EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmPedido_Venda.Show;
    end; }

end;

procedure TFrmCadastro_Cliente.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  { with DBGrid2 do
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
    end; }
end;

procedure TFrmCadastro_Cliente.Grava_Temporario;
var
  qAux: TADOQuery;
  perc_fim, perc_aux, pe, pe_aux, v_un: double;
begin
  qAux := TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      close;
      Connection := Conexao;
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

      Parameters.ParamByName('Codigo').Value :=
        StrToInt(FrmPedido_Venda.EdtCodigo.Text);
      Parameters.ParamByName('Codigo_Produto').Value :=
        ADOQuery4Codigo_Produto.AsInteger;
      Parameters.ParamByName('Valor_Original').Value :=
        ADOQuery4Valor_Original.AsFloat;
      Parameters.ParamByName('Valor_Compra').Value :=
        ADOQuery4Valor_Compra.AsFloat;

      // v_un:= ( StrToFloat(EdtValor_Unitario.Text) + StrToFloat(EdtDesc_Acr.Text));
      Parameters.ParamByName('Valor_Unitario').Value :=
        ADOQuery4Valor_Unitario.AsFloat;

      Parameters.ParamByName('Quantidade').Value := ADOQuery4Qtde.AsFloat;

      pe_aux := ADOQuery4Valor_Unitario.AsFloat - ADOQuery4Valor_Compra.AsFloat;
      pe := (pe_aux / ADOQuery4Valor_Unitario.AsFloat);
      pe := pe * 100;
      pe := Calcula_Valor(FloatToStr(pe));

      Parameters.ParamByName('Percetual').Value := pe;
      Parameters.ParamByName('Lucro_Vista').Value := 0;
      Parameters.ParamByName('Lucro_Prazo').Value := 0;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;

  FrmPedido_Venda.EdtCusto_Total.Text :=
    FloatToStr(StrToFloat(FrmPedido_Venda.EdtCusto_Total.Text) +
    (ADOQuery4Valor_Compra.AsFloat * ADOQuery4Qtde.AsFloat));
  FrmPedido_Venda.EdtCusto_Total.Text :=
    FormatFloat('#0.0,0', StrToFloat(FrmPedido_Venda.EdtCusto_Total.Text));
  FrmPedido_Venda.EdtCusto_Total.Text :=
    StringReplace(FrmPedido_Venda.EdtCusto_Total.Text, ThousandSeparator, '',
    [rfReplaceAll]);

  FrmPedido_Venda.EdtVenda_Total.Text :=
    FloatToStr(StrToFloat(FrmPedido_Venda.EdtVenda_Total.Text) +
    ADOQuery4Sub_Total.AsFloat);
  FrmPedido_Venda.EdtVenda_Total.Text :=
    FormatFloat('#0.0,0', StrToFloat(FrmPedido_Venda.EdtVenda_Total.Text));
  FrmPedido_Venda.EdtVenda_Total.Text :=
    StringReplace(FrmPedido_Venda.EdtVenda_Total.Text, ThousandSeparator, '',
    [rfReplaceAll]);

  perc_aux := StrToFloat(FrmPedido_Venda.EdtVenda_Total.Text) -
    StrToFloat(FrmPedido_Venda.EdtCusto_Total.Text);
  perc_fim := (perc_aux / StrToFloat(FrmPedido_Venda.EdtVenda_Total.Text));
  perc_fim := perc_fim * 100;
  perc_fim := Calcula_Valor(FloatToStr(perc_fim));

  FrmPedido_Venda.EdtPerc_Total.Text := FloatToStr(perc_fim);
  // EdtPerc_Total.Text:= FormatFloat('#0.0,0', StrToFloat(EdtPerc_Total.Text));
end;

procedure TFrmCadastro_Cliente.Salva_Itens;
var
  des: double;
  qAux: TADOQuery;
  total_produtos, total_pedido: double;
  qtde_itens: Integer;
begin
  Itens_Pedido.Salva_Banco(FrmPedido_Venda.Conexao, 'S', 'I',
    StrToInt(FrmPedido_Venda.EdtCodigo.Text), ADOQuery4N_Item.AsString,
    ADOQuery4Codigo_Produto.AsInteger, ADOQuery4Codigo_Venda.AsString,
    ADOQuery4Descricao.AsString, ADOQuery4NCM.AsString,
    ADOQuery4Origem.AsString, ADOQuery4CFOP.AsString, ADOQuery4UN.AsString,
    ADOQuery4Tipo_Calculo_BC_ICMS.AsString, ADOQuery4Tipo_Recolhimento.AsString,
    ADOQuery4ICMS.AsString, ADOQuery4CST.AsString, ADOQuery4CSOSN.AsString,
    ADOQuery4Base_Reduzida.AsString, ADOQuery4BC.AsString,
    ADOQuery4Valor_ICMS.AsString, ADOQuery4Tipo_Calculo_BC_ICMS_ST.AsString,
    ADOQuery4MVAST.AsString, ADOQuery4ICMS_ST.AsString,
    ADOQuery4CST_ST.AsString, ADOQuery4Base_Reduzida_ST.AsString,
    ADOQuery4Base_Acrescida_ST.AsString, ADOQuery4BC_ST.AsString,
    ADOQuery4Valor_ICMS_ST.AsFloat, ADOQuery4Aliquota_Calculo_Credito.AsString,
    ADOQuery4Credito_ICMS.AsString, ADOQuery4Tipo_Calculo_IPI.AsString,
    ADOQuery4IPI.AsString, ADOQuery4CST_IPI.AsString,
    ADOQuery4Base_Reduzida_IPI.AsString, ADOQuery4Base_Acrescida_IPI.AsString,
    ADOQuery4BC_IPI.AsString, ADOQuery4Valor_IPI.AsFloat,
    ADOQuery4Tipo_Calculo_PIS.AsString, ADOQuery4PIS.AsString,
    ADOQuery4CST_PIS.AsString, ADOQuery4Base_Reduzida_PIS.AsString,
    ADOQuery4Base_Acrescida_PIS.AsString, ADOQuery4BC_PIS.AsString,
    ADOQuery4Valor_PIS.AsFloat, ADOQuery4Tipo_Calculo_COFINS.AsString,
    ADOQuery4COFINS.AsString, ADOQuery4CST_COFINS.AsString,
    ADOQuery4Base_Reduzida_COFINS.AsString,
    ADOQuery4Base_Acrescida_COFINS.AsString, ADOQuery4BC_COFINS.AsString,
    ADOQuery4Valor_COFINS.AsFloat, ADOQuery4Qtde.AsFloat,
    ADOQuery4Qtde_Entregue.AsFloat, ADOQuery4Qtde_Restante.AsFloat,
    ADOQuery4Qtde_S_Previsao.AsFloat, ADOQuery4Valor_Compra.AsFloat,
    ADOQuery4Valor_Original.AsFloat, ADOQuery4Valor_Unitario.AsFloat,
    ADOQuery4Desc_Acr.AsFloat, ADOQuery4Desc_Acr_P.AsFloat,
    ADOQuery4Tipo_Desc_Acr.AsString, ADOQuery4dOUa.AsString,
    ADOQuery4Valor_Frete.AsFloat, ADOQuery4Valor_Seguro.AsFloat,
    ADOQuery4Outras_Despesas.AsFloat, ADOQuery4Sub_Total.AsFloat,
    ADOQuery4Sub_Total_Liquido.AsFloat, ADOQuery4Cancelado.AsString,
    ADOQuery4Indica_Valor_Total.AsString, ADOQuery4Data_Entrega.AsDateTime,
    ADOQuery4Hora_Entrega.AsString, ADOQuery4Tipo_Venda.AsString,
    ADOQuery4Tipo_Entrega.AsString, ADOQuery4Comissao.AsFloat,
    ADOQuery4Perc_Desc_Vista.AsFloat, ADOQuery4Perc_Desc_Prazo.AsFloat,
    ADOQuery4Permite_Credito.AsInteger, ADOQuery4Codigo_Obs_Fiscal.AsInteger,
    ADOQuery4Qtde_Estoque_Atual.AsFloat, ADOQuery4Valor_Compra_Nota.AsFloat);

  qtde_itens := StrToInt(FrmPedido_Venda.EdtQuantidade_Itens.Text);
  inc(qtde_itens);

  total_produtos := total_produtos +
    (ADOQuery4Valor_Original.AsFloat * ADOQuery4Qtde.AsFloat);
  FrmPedido_Venda.EdtTotal_Produtos.Text :=
    FormatFloat('#0.0,0', total_produtos);
  FrmPedido_Venda.EdtTotal_Produtos.Text :=
    StringReplace(FrmPedido_Venda.EdtTotal_Produtos.Text, ThousandSeparator, '',
    [rfReplaceAll]);

  total_pedido := total_pedido + ADOQuery4Sub_Total.AsFloat;
  // ( StrToFloat(EdtTotal_Desc_Acr.Text ) + ( StrToFloat(EdtTotal_Desconto.Text )));

  FrmPedido_Venda.EdtTotal_Pedido.Text := FormatFloat('#0.0,0', total_pedido);
  FrmPedido_Venda.EdtTotal_Pedido.Text :=
    StringReplace(FrmPedido_Venda.EdtTotal_Pedido.Text, ThousandSeparator, '',
    [rfReplaceAll]);

  des := des + ADOQuery4Desc_Acr_P.AsFloat;
  FrmPedido_Venda.EdtTotal_Desc_Acr.Text := FormatFloat('#0.0,0', des);

  FrmPedido_Venda.EdtQuantidade_Itens.Text := IntToStr(qtde_itens);

  // end;
end;

procedure TFrmCadastro_Cliente.SpeedButton1Click(Sender: TObject);
begin
  if (Application.MessageBox(PChar('Confirma a exclusão da imagem?'#13 +
    'Obs.: A imagem não será excluida do computador; apenas do sistema.'),
    'Confirmação', MB_YESNO + MB_ICONQUESTION)) = IDYES then
  begin
    if (nome_imagem2 <> '') then
    begin
      RenameFile(nome_imagem2, caminho_servidor + 'Imagens\Clientes\' +
        EdtCodigo.Text + '-2-Excluida.jpg');
      nome_imagem2 := '';
      Img2.Picture.LoadFromFile('');
    end;
  end;
end;

procedure TFrmCadastro_Cliente.SpeedButton2Click(Sender: TObject);
begin
  OpenPictureDialog1.InitialDir := caminho_servidor + 'Imagens\Clientes';
  OpenPictureDialog1.Execute;
  nome_imagem1 := OpenPictureDialog1.FileName;
  Img1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TFrmCadastro_Cliente.SpeedButton3Click(Sender: TObject);
begin
  OpenPictureDialog1.InitialDir := caminho_servidor + 'Imagens\Clientes';
  OpenPictureDialog1.Execute;
  nome_imagem2 := OpenPictureDialog1.FileName;
  Img2.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TFrmCadastro_Cliente.SpeedButton6Click(Sender: TObject);
begin
  if (Application.MessageBox(PChar('Confirma a exclusão da imagem?'#13 +
    'Obs.: A imagem não será excluida do computador; apenas do sistema.'),
    'Confirmação', MB_YESNO + MB_ICONQUESTION)) = IDYES then
  begin
    if (nome_imagem1 <> '') then
    begin
      RenameFile(nome_imagem1, caminho_servidor + 'Imagens\Clientes\' +
        EdtCodigo.Text + '-1-Excluida.jpg');
      nome_imagem1 := '';
      Img1.Picture.LoadFromFile('');
    end;
  end;
end;

procedure TFrmCadastro_Cliente.txtEdtCidadeOutrosKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Cliente.txtEdtCodCidadeOutrosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    cid := 2;
    Application.CreateForm(TFrmChama_Cidade, FrmChama_Cidade);
    FrmChama_Cidade.ShowModal;
    FrmChama_Cidade.Free;
  end;

end;

procedure TFrmCadastro_Cliente.txtEdtCodCidadeOutrosKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Cliente.Chama_Imagens;
begin
  nome_imagem1 := '';
  nome_imagem2 := '';

  if FileExists(caminho_servidor + 'Imagens\Clientes\' + EdtCodigo.Text +
    '-1.jpg') then
  begin
    Img1.Picture.LoadFromFile(caminho_servidor + 'Imagens\Clientes\' +
      EdtCodigo.Text + '-1.jpg');
    nome_imagem1 := caminho_servidor + 'Imagens\Clientes\' + EdtCodigo.Text
      + '-1.jpg';
  end
  else
  begin
    Img1.Picture.LoadFromFile('');
  end;

  if FileExists(caminho_servidor + 'Imagens\Clientes\' + EdtCodigo.Text +
    '-2.jpg') then
  begin
    Img2.Picture.LoadFromFile(caminho_servidor + 'Imagens\Clientes\' +
      EdtCodigo.Text + '-2.jpg');
    nome_imagem2 := caminho_servidor + 'Imagens\Clientes\' + EdtCodigo.Text
      + '-2.jpg';
  end
  else
  begin
    Img2.Picture.LoadFromFile('');
  end;

end;

procedure TFrmCadastro_Cliente.Chama_Itens_Pedido_Relatorio;
begin
  with qryItensPedido, sql do
  begin
    close;
    Clear;
    add('SELECT I.Codigo_Registro,I.Codigo,I.Codigo_Venda, I.Descricao, I.Qtde,I.Valor_Unitario, I.Sub_Total');
    add('FROM Itens_Pedido I');
    add('ORDER BY I.Codigo');
    open;
  end;
end;

procedure TFrmCadastro_Cliente.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Ficha_Cliente := TFrmRel_Ficha_Cliente.Create(self);
  FrmRel_Ficha_Cliente.Release;
  FrmRel_Ficha_Cliente := Nil;
end;

procedure TFrmCadastro_Cliente.BBtnNovoClick(Sender: TObject);
begin
  PageControl2.TabIndex := 0;
  PageControl3.TabIndex := 0;
  Util.Habilita_Campos(FrmCadastro_Cliente);
  Util.Limpa_Campos(FrmCadastro_Cliente);

  Conexao := TConexao.NovaConexao(Conexao);
  TConexao.IniciaQuerys([ADOQuery1, qryPedido, ADOQuery4, qrytelefone,
    qrydados_adicionais, qryautorizados, qryocorrencia], Conexao);

  Inicia_Itens;
  CBBloqueado.Checked := false;
  BBtnSalvar.Enabled := true;
  BBtnExcluir.Enabled := false;
  BBtnPesquisar.Enabled := false;
  BBtnCancelar.Enabled := true;
  BBtnImprimir.Enabled := false;
  BBtnNovo.Enabled := false;
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);
  EdtNome.SetFocus;

end;

procedure TFrmCadastro_Cliente.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TFrmCadastro_Cliente.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) then
  begin
    if (Confirma_Exclusao) then
    begin
      Dados_Adicionais.Excluir(Dados_Adicionais, Conexao);
      Atualiza_Dados_Adicionais;
      EdtEmpresa.Clear;
      EdtInscricao_Empresa.Clear;
      EdtEmpresa.SetFocus;
    end;
  end;
end;

procedure TFrmCadastro_Cliente.DBGrid4DblClick(Sender: TObject);
begin
  codigo_telefone := qrytelefoneCodigo_Telefone.AsInteger;
  MEdtTelefone_Adicional.Text := qrytelefoneTelefone.AsString;
  CmbTipo_Telefone.Text := qrytelefoneTipo.AsString;
  achei_telefone := true;
end;

procedure TFrmCadastro_Cliente.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid4 do
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

procedure TFrmCadastro_Cliente.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) then
  begin
    if (Confirma_Exclusao) then
    begin
      Telefone.Excluir(Conexao);
      // Cria_Arquivo_Atualiza_Dados('DTCli');
      Atualiza_Dados_Telefone;
      Limpa_Menor_Telefone;
      MEdtTelefone_Adicional.SetFocus;
    end;
  end;
end;

procedure TFrmCadastro_Cliente.DBGrid5DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid5 do
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

procedure TFrmCadastro_Cliente.DBGrid5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) then
  begin
    if (Confirma_Exclusao) then
    begin
      Autorizados.Excluir(Conexao);
      Atualiza_Dados_Autorizados;
      EdtNome_Autorizado.Clear;
      EdtCPF_Autorizado.Clear;
      EdtNome_Autorizado.SetFocus;
    end;
  end;
end;

procedure TFrmCadastro_Cliente.EdtCidadeExit(Sender: TObject);
begin
  if (EdtCidade.Text <> '') then
    Pega_Cidade(EdtCidade);

  if (qAux_Cidade <> Nil) and (qAux_Cidade.IsEmpty = false) and
    (EdtCidade.Text <> '') then
  begin
    codigo_cidade := qAux_Cidade.FieldByName('Codigo').AsInteger;
    EdtCodigo_Cidade.Text := qAux_Cidade.FieldByName('Codigo').AsString;
    EdtCidade.Text := qAux_Cidade.FieldByName('Descricao').AsString;
    EdtUF.Text := qAux_Cidade.FieldByName('UF').AsString;
    achou_cidade := true;
  end
  else
  begin
    achou_cidade := false;
    codigo_cidade := 0;

    if (EdtCidade.Text <> '') then
    begin
      EdtCodigo_Cidade.Text := IntToStr(Gera_Codigo_Cadastro('Cidade'));
    end
    else
    begin
      EdtCodigo_Cidade.Text := '';
      EdtCidade.Text := '';
      EdtUF.Text := '';
    end;
  end;
end;

procedure TFrmCadastro_Cliente.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  // Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cliente.EdtCidadeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not((Key = 08) or (Key = 46)) and (EdtCidade.Text <> '') then
    Pega_Cidade(EdtCidade);
end;

procedure TFrmCadastro_Cliente.EdtCidade_DACKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Cliente.EdtCNPJExit(Sender: TObject);
begin
  if (EdtCNPJ.Text = '') then
    exit
  else if Util.Valida_CGC(EdtCNPJ.Text) <> true then
  begin
    Application.MessageBox('CNPJ inválido', 'Erro', MB_OK + MB_ICONHAND);
    EdtCNPJ.Clear;
    EdtCNPJ.SetFocus;
  end;
end;

procedure TFrmCadastro_Cliente.EdtCodigo_CidadeDblClick(Sender: TObject);
begin
  { Application.CreateForm(TFrmChama_Cidade, FrmChama_Cidade);
    FrmChama_Cidade.ShowModal;
    FrmChama_Cidade.Free; }
end;

procedure TFrmCadastro_Cliente.EdtCodigo_CidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    cid := 0;
    Application.CreateForm(TFrmChama_Cidade, FrmChama_Cidade);
    FrmChama_Cidade.ShowModal;
    FrmChama_Cidade.Free;
  end;
end;

procedure TFrmCadastro_Cliente.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Cliente.EdtCodigo_Cidade_DACKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    cid := 1;
    Application.CreateForm(TFrmChama_Cidade, FrmChama_Cidade);
    FrmChama_Cidade.ShowModal;
    FrmChama_Cidade.Free;
  end;

end;

procedure TFrmCadastro_Cliente.EdtCodigo_Cidade_DACKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Cliente.EdtCodigo_EnderecoDblClick(Sender: TObject);
begin
  { enderec:= true;
    Application.CreateForm(TFrmChama_Logradouro, FrmChama_Logradouro);
    FrmChama_Logradouro.ShowModal;
    FrmChama_Logradouro.Free; }
end;

procedure TFrmCadastro_Cliente.EdtCodigo_EnderecoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    enderec := true;
    Application.CreateForm(TFrmChama_Logradouro, FrmChama_Logradouro);
    FrmChama_Logradouro.ShowModal;
    FrmChama_Logradouro.Free;
  end;
end;

procedure TFrmCadastro_Cliente.EdtCodigo_EnderecoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Cliente.EdtCodigo_Endereco_OutrosDblClick
  (Sender: TObject);
begin
  enderec := false;
  Application.CreateForm(TFrmChama_Logradouro, FrmChama_Logradouro);
  FrmChama_Logradouro.ShowModal;
  FrmChama_Logradouro.Free;
end;

procedure TFrmCadastro_Cliente.EdtCodigo_Endereco_OutrosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    enderec := false;
    Application.CreateForm(TFrmChama_Logradouro, FrmChama_Logradouro);
    FrmChama_Logradouro.ShowModal;
    FrmChama_Logradouro.Free;
  end;
end;

procedure TFrmCadastro_Cliente.EdtCodigo_Endereco_OutrosKeyPress
  (Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Cliente.EdtCodigo_GrupoDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Grupo_Cliente, FrmChama_Grupo_Cliente);
  FrmChama_Grupo_Cliente.ShowModal;
  FrmChama_Grupo_Cliente.Free;
end;

procedure TFrmCadastro_Cliente.EdtCodigo_GrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Grupo_Cliente, FrmChama_Grupo_Cliente);
    FrmChama_Grupo_Cliente.ShowModal;
    FrmChama_Grupo_Cliente.Free;
  end;
end;

procedure TFrmCadastro_Cliente.EdtCodigo_GrupoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Cliente.EdtCodigo_PaisKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Pais, FrmChama_Pais);
    FrmChama_Pais.ShowModal;
    FrmChama_Pais.Free;
  end;
end;

procedure TFrmCadastro_Cliente.EdtCodigo_PaisKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Cliente.EdtCodigo_SetorDblClick(Sender: TObject);
begin
  { seto:= true;
    Application.CreateForm(TFrmChama_Setor, FrmChama_Setor);
    FrmChama_Setor.ShowModal;
    FrmChama_Setor.Free; }
end;

procedure TFrmCadastro_Cliente.EdtCodigo_SetorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    seto := 0;
    Application.CreateForm(TFrmChama_Setor, FrmChama_Setor);
    FrmChama_Setor.ShowModal;
    FrmChama_Setor.Free;
  end;
end;

procedure TFrmCadastro_Cliente.EdtCodigo_SetorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Cliente.EdtCodigo_Setor_DACKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    seto := 2;
    Application.CreateForm(TFrmChama_Setor, FrmChama_Setor);
    FrmChama_Setor.ShowModal;
    FrmChama_Setor.Free;
  end;
end;

procedure TFrmCadastro_Cliente.EdtCodigo_Setor_DACKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Cliente.EdtCodigo_Setor_OutrosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    seto := 1;
    Application.CreateForm(TFrmChama_Setor, FrmChama_Setor);
    FrmChama_Setor.ShowModal;
    FrmChama_Setor.Free;
  end;
end;

procedure TFrmCadastro_Cliente.EdtCodigo_Setor_OutrosKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Cliente.EdtCodigo_Tabela_PrecoDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Tabela_Preco, FrmChama_Tabela_Preco);
  FrmChama_Tabela_Preco.ShowModal;
  FrmChama_Tabela_Preco.Free;
end;

procedure TFrmCadastro_Cliente.EdtCodigo_Tabela_PrecoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Tabela_Preco, FrmChama_Tabela_Preco);
    FrmChama_Tabela_Preco.ShowModal;
    FrmChama_Tabela_Preco.Free;
  end;
end;

procedure TFrmCadastro_Cliente.EdtCodigo_Tabela_PrecoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Cliente.Verifica_CPF_Cadastrado;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  with qAux, sql do
  begin
    close;
    Connection := Conexao;
    Clear;
    add('select C.CPF from Cliente C');
    add('where C.CPF = :CPF');
    Parameters.ParamByName('CPF').Value := EdtCPF.Text;
    open;

    if (IsEmpty = false) then
    begin
      Application.MessageBox('CPF já cadastrado.', 'CPF Encontrado',
        MB_OK + MB_ICONHAND);
    end;
  end;
end;

procedure TFrmCadastro_Cliente.EdtCPFExit(Sender: TObject);
begin
  if (EdtCPF.Text = '') then
    exit
  else
  begin
    if Util.Valida_CPF(EdtCPF.Text) <> true then
    begin
      Application.MessageBox('CPF inválido', 'Erro', MB_OK + MB_ICONHAND);
      EdtCPF.Clear;
      EdtCPF.SetFocus;
    end;

    Verifica_CPF_Cadastrado;
  end;
end;

procedure TFrmCadastro_Cliente.EdtData_EmissaoExit(Sender: TObject);
begin
  if (EdtData_Emissao.Text = '  /  /    ') then
    exit
  else
    Util.Verifica_Data(EdtData_Emissao);
end;

procedure TFrmCadastro_Cliente.EdtEnderecoExit(Sender: TObject);
begin
  { if (EdtEndereco.Text <> '')then
    Pega_Endereco(EdtEndereco);

    if (qAux_Endereco <> Nil) and (qAux_Endereco.IsEmpty = false) and (EdtEndereco.Text <> '') then
    begin
    codigo_endereco:= qAux_Endereco.FieldByName('Codigo').AsInteger;
    EdtCodigo_Endereco.Text:= qAux_Endereco.FieldByName('Codigo').AsString;
    EdtEndereco.Text:= qAux_Endereco.FieldByName('Descricao').AsString;
    EdtTipo_Logradouro.Text:= qAux_Endereco.FieldByName('Tipo_Logradouro').AsString;
    EdtCEP.Text:= qAux_Endereco.FieldByName('CEP').AsString;
    achou_endereco:= true;
    end
    else
    begin
    achou_endereco:= false;
    codigo_endereco:= 0;

    if (EdtEndereco.Text <> '') then
    begin
    EdtCodigo_Endereco.Text:= IntToStr(Gera_Codigo_Cadastro('Logradouro'));
    end
    else
    begin
    EdtCodigo_Endereco.Text:= '';
    EdtEndereco.Text:= '';
    EdtTipo_Logradouro.Text:= '';
    EdtCEP.Text:= '';
    EdtNumero.Text:= '';
    end;
    end; }
end;

procedure TFrmCadastro_Cliente.EdtEnderecoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  { if not ( (key = 08) or (key = 46) ) and (EdtEndereco.Text <> '')then
    Pega_Endereco(EdtEndereco); }
end;

procedure TFrmCadastro_Cliente.EdtEndereco_OutrosExit(Sender: TObject);
begin
  { if (qAux_Endereco <> Nil) and (qAux_Endereco.IsEmpty = false) and (EdtEndereco_Outros.Text <> '') then
    begin
    EdtCodigo_Endereco_Outros.Text:= qAux_Endereco.FieldByName('Codigo').AsString;
    EdtEndereco_Outros.Text:= qAux_Endereco.FieldByName('Descricao').AsString;
    EdtTipo_Logradouro_Outros.Text:= qAux_Endereco.FieldByName('Tipo_Logradouro').AsString;
    EdtCEP_Outros.Text:= qAux_Endereco.FieldByName('CEP').AsString;
    achou_endereco_outros:= true;
    end
    else
    begin
    achou_endereco_outros:= false;

    if (EdtEndereco_Outros.Text <> '') then
    begin
    EdtCodigo_Endereco_Outros.Text:= IntToStr(Gera_Codigo_Cadastro('Logradouro'));
    end
    else
    begin
    EdtCodigo_Endereco_Outros.Text:= '';
    EdtEndereco_Outros.Text:= '';
    EdtTipo_Logradouro_Outros.Text:= '';
    EdtCEP_Outros.Text:= '';
    EdtNumero_Outros.Text:= '';
    end;
    end; }
end;

procedure TFrmCadastro_Cliente.EdtEndereco_OutrosKeyPress(Sender: TObject;
  var Key: Char);
begin
  // Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cliente.EdtEndereco_OutrosKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  { if not ( (key = 08) or (key = 46) ) and (EdtEndereco_Outros.Text <> '')then
    Pega_Endereco(EdtEndereco_Outros); }
end;

procedure TFrmCadastro_Cliente.EdtGrupoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Cliente.EdtInsc_EstadualKeyPress(Sender: TObject;
  var Key: Char);
begin
  // if not (key in ['0'..'9', '.',#08]) then
  // key := #0
end;

procedure TFrmCadastro_Cliente.EdtLimite_CreditoExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtLimite_Credito, StrToFloat(EdtLimite_Credito.Text));
end;

procedure TFrmCadastro_Cliente.EdtLimite_CreditoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmCadastro_Cliente.EdtLimite_DescontoExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtLimite_Desconto, StrToFloat(EdtLimite_Desconto.Text));
end;

procedure TFrmCadastro_Cliente.EdtLimite_DescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', ',', #08]) then
    Key := #0
end;

procedure TFrmCadastro_Cliente.EdtPaisKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Cliente.EdtRazao_SocialEnter(Sender: TObject);
begin
  EdtRazao_Social.Text := EdtNome.Text;
end;

procedure TFrmCadastro_Cliente.EdtRGKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', '.', #08]) then
    Key := #0
end;

procedure TFrmCadastro_Cliente.EdtSetorExit(Sender: TObject);
begin
  if (EdtSetor.Text <> '') then
    Pega_Setor(EdtSetor);

  if (qAux_Setor <> Nil) and (qAux_Setor.IsEmpty = false) and
    (EdtSetor.Text <> '') then
  begin
    codigo_setor := qAux_Setor.FieldByName('Codigo').AsInteger;
    EdtCodigo_Setor.Text := qAux_Setor.FieldByName('Codigo').AsString;
    EdtSetor.Text := qAux_Setor.FieldByName('Descricao').AsString;
    achou_setor := true;
  end
  else
  begin
    achou_setor := false;
    codigo_setor := 0;

    if (EdtSetor.Text <> '') then
    begin
      EdtCodigo_Setor.Text := IntToStr(Gera_Codigo_Cadastro('Setor'));
    end
    else
    begin
      EdtCodigo_Setor.Text := '';
      EdtSetor.Text := '';
    end;
  end;
end;

procedure TFrmCadastro_Cliente.EdtSetorKeyPress(Sender: TObject; var Key: Char);
begin
  // Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cliente.EdtSetorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not((Key = 08) or (Key = 46)) and (EdtSetor.Text <> '') then
    Pega_Setor(EdtSetor);
end;

procedure TFrmCadastro_Cliente.EdtSetor_DACKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Cliente.EdtSetor_OutrosExit(Sender: TObject);
begin
  { if (qAux_Setor <> Nil) and (qAux_Setor.IsEmpty = false) and (EdtSetor_Outros.Text <> '') then
    begin
    EdtCodigo_Setor_Outros.Text:= qAux_Setor.FieldByName('Codigo').AsString;
    EdtSetor_Outros.Text:= qAux_Setor.FieldByName('Descricao').AsString;
    achou_setor_outros:= true;
    end
    else
    begin
    achou_setor_outros:= false;

    if (EdtSetor_Outros.Text <> '') then
    begin
    EdtCodigo_Setor_Outros.Text:= IntToStr(Gera_Codigo_Cadastro('Setor'));
    end
    else
    begin
    EdtCodigo_Setor_Outros.Text:= '';
    EdtSetor_Outros.Text:= '';
    end;

    end; }
end;

procedure TFrmCadastro_Cliente.EdtSetor_OutrosKeyPress(Sender: TObject;
  var Key: Char);
begin
  // Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cliente.EdtSetor_OutrosKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // if not ( (key = 08) or (key = 46) ) and (EdtSetor_Outros.Text <> '')then
  // Pega_Setor(EdtSetor_Outros);
end;

procedure TFrmCadastro_Cliente.EdtTabela_PrecoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Cliente.EdtTipo_LogradouroKeyPress(Sender: TObject;
  var Key: Char);
begin
  // Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cliente.EdtTipo_Logradouro_OutrosKeyPress
  (Sender: TObject; var Key: Char);
begin
  // Util.Somente_Apaga(key);
end;

{ procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
  begin
  case llEstado of
  Inserir: Habilita_Botao([false, true, false, true]);
  //Alterar: Habilita_Botao([false, true, false, true]);
  Consultar: Habilita_Botao([false, true, true, true]);
  end;
  end; }

procedure TFrmCadastro_Cliente.FormActivate(Sender: TObject);
begin
  ativo := true;
end;

procedure TFrmCadastro_Cliente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
  begin
    Cancele;
    exit;
  end
  else
  begin
    FrmCadastro_Cliente.Free;
    FrmCadastro_Cliente := Nil;
  end;
end;

procedure TFrmCadastro_Cliente.FormCreate(Sender: TObject);
begin
  PageControl2.TabIndex := 0;
  Util.Habilita_Campos(FrmCadastro_Cliente);
  Util.Limpa_Campos(FrmCadastro_Cliente);
  Util.Desabilita_Campos(FrmCadastro_Cliente);
  iniciado := false;
  achou_setor := false;
  achou_cidade := false;
  achou_endereco := false;
  achou_setor_outros := false;
  achou_endereco_outros := false;
  achei_outros := false;
  CBBloqueado.Checked := false;
  EdtLimite_Credito.Text := '0,00';
  EdtLimite_Desconto.Text := '0,00';
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar,
    BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Cliente.FormDeactivate(Sender: TObject);
begin
  ativo := false;
end;

procedure TFrmCadastro_Cliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_f2) then
  begin
    if (iniciado = false) then
    begin
    end;
  end;

  if (Key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Cliente.Inicia_Itens;
begin
  ADOQuery1.close;
  qrytelefone.close;
  qrydados_adicionais.close;
  qryautorizados.close;
  qryPedido.close;
  qryocorrencia.Close;
  Gera_Codigo;
  achei := false;
  achei_outros := false;
  achei_telefone := false;
  CBTipo.Checked := true;
  // GroupBox1.Enabled:= true;
  // GroupBox2.Enabled:= false;
  EdtCredito.Text := '0,00';
  EdtLimite_Credito.Text := '0,00';
  EdtLimite_Desconto.Text := '0,00';
  iniciado := true;
  achou_setor := false;
  achou_cidade := false;
  achou_endereco := false;
  achou_setor_outros := false;
  achou_endereco_outros := false;
end;

procedure TFrmCadastro_Cliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0; // anula todas as teclas
    SelectNext(ActiveControl, true, true);
  end;
end;

procedure TFrmCadastro_Cliente.Gera_Codigo;
var
  qAux: TADOQuery;
  codigo: Integer;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection := Conexao;
      Clear;
      add('select max(Codigo) as Codigo from Cliente ');
      open;
    end;
    codigo := qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text := IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Cliente.Gera_Codigo_Telefone;
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection := Conexao;
      Clear;
      add('select max(Codigo_Telefone) as Codigo from Telefone_Cliente ');
      open;
    end;
    codigo_telefone := qAux.FieldByName('Codigo').AsInteger + 1;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Cliente.Limpa_Menor;
begin
  EdtEndereco_Outros.Clear;
  EdtEndereco_Outros.Clear;
  EdtCodigo_Setor_Outros.Clear;
  EdtSetor_Outros.Clear;
  EdtNumero_Outros.Clear;
  EdtCEP_Outros.Clear;
  EdtTipo_Endereco.Clear;
  EdtComplemento_Outros.Clear;
  txtEdtCidadeOutros.Clear;
  txtEdtCodCidadeOutros.Clear;
end;

procedure TFrmCadastro_Cliente.Limpa_Menor_Telefone;
begin
  MEdtTelefone_Adicional.Clear;
  CmbTipo_Telefone.ItemIndex := -1;
end;

procedure TFrmCadastro_Cliente.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Cadastro.Text := DateToStr(date);
end;

procedure TFrmCadastro_Cliente.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Cliente.MEdtData_FinalEnter(Sender: TObject);
begin
  if (MEdtData_Final.Text = '  /  /    ') then
    MEdtData_Final.Text := DateToStr(date);
end;

procedure TFrmCadastro_Cliente.MEdtData_FinalExit(Sender: TObject);
begin
  if (achei = true) then
  begin
    if (MEdtData_Final.Text = '  /  /    ') then
      exit
    else
      Util.Verifica_Data(MEdtData_Final);

    Chama_Compra_Cliente;
    Chama_Itens_Pedido_Relatorio;
  end
end;

procedure TFrmCadastro_Cliente.MEdtData_InicialEnter(Sender: TObject);
begin
  if (MEdtData_Inicial.Text = '  /  /    ') then
    MEdtData_Inicial.Text := DateToStr(date);
end;

procedure TFrmCadastro_Cliente.MEdtData_InicialExit(Sender: TObject);
begin
  if (MEdtData_Inicial.Text = '  /  /    ') then
    exit
  else
    Util.Verifica_Data(MEdtData_Inicial);
end;

procedure TFrmCadastro_Cliente.MEdtData_NascimentoExit(Sender: TObject);
begin
  if (MEdtData_Nascimento.Text = '  /  /    ') then
    exit
  else
    Util.Verifica_Data(MEdtData_Nascimento);
end;

procedure TFrmCadastro_Cliente.MmoObservacoesKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase(Key)[1];
end;

procedure TFrmCadastro_Cliente.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
  FrmChama_Cliente.ShowModal;
  FrmChama_Cliente.Release;
end;

end.
