unit UConsulta_Lancamentos_Financeiros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, Mask, QuickRpt, Buttons, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxPropertiesStore, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxSkinsdxBarPainter,
  dxPSCore, dxPSContainerLnk, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxCommon, cxGridExportLink;

type
  TFrmConsulta_Lancamentos_Financeiros = class(TForm)
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_lancamento: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    ds_qry_consulta_parcelas: TDataSource;
    qryconsulta_parcelas: TADOQuery;
    qryconsulta_parcelasCodigo: TIntegerField;
    qryconsulta_parcelasN_Documento: TIntegerField;
    qryconsulta_parcelasData_Vencimento: TDateTimeField;
    qryconsulta_parcelasData_Pagamento: TDateTimeField;
    qryconsulta_parcelasParcela: TIntegerField;
    qryconsulta_parcelasStatus: TStringField;
    qryconsulta_parcelasValor: TFloatField;
    qryconsulta_parcelasDinheiro: TFloatField;
    qryconsulta_parcelasCheque_Vista: TFloatField;
    qryconsulta_parcelasCheque_Prazo: TFloatField;
    qryconsulta_parcelasCartao: TFloatField;
    qryconsulta_parcelasJuros: TFloatField;
    qryconsulta_parcelasDesconto: TFloatField;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    qryconsulta_lancamento_sintetico: TADOQuery;
    DataSource1: TDataSource;
    BBtnImprimir_Sintetico: TToolButton;
    qryconsulta_lancamento_sinteticoCodigo: TIntegerField;
    qryconsulta_lancamento_sinteticoN_Documento: TIntegerField;
    qryconsulta_lancamento_sinteticoCodigo_Empresa: TIntegerField;
    qryconsulta_lancamento_sinteticoTipo: TStringField;
    qryconsulta_lancamento_sinteticoCodigo_Cli_For: TIntegerField;
    qryconsulta_lancamento_sinteticoHistorico: TStringField;
    qryconsulta_lancamento_sinteticoData_Lancamento: TDateTimeField;
    qryconsulta_lancamento_sinteticoData_Vencimento: TDateTimeField;
    qryconsulta_lancamento_sinteticoValor: TFloatField;
    qryconsulta_lancamento_sinteticoStatus: TStringField;
    qryconsulta_lancamento_sinteticoNome: TStringField;
    qryconsulta_lancamentoCodigo: TIntegerField;
    qryconsulta_lancamentoTipo: TStringField;
    qryconsulta_lancamentoN_Documento: TIntegerField;
    qryconsulta_lancamentoCodigo_Empresa: TIntegerField;
    qryconsulta_lancamentoCodigo_Forma_Pagamento: TIntegerField;
    qryconsulta_lancamentoCodigo_Cli_For: TIntegerField;
    qryconsulta_lancamentoCodigo_Tipo_Documento: TIntegerField;
    qryconsulta_lancamentoHistorico: TStringField;
    qryconsulta_lancamentoCodigo_Departamento: TIntegerField;
    qryconsulta_lancamentoCodigo_Plano: TIntegerField;
    qryconsulta_lancamentoData_Lancamento: TDateTimeField;
    qryconsulta_lancamentoData_Vencimento: TDateTimeField;
    qryconsulta_lancamentoValor_Documento: TFloatField;
    qryconsulta_lancamentoDesconto: TFloatField;
    qryconsulta_lancamentoMulta: TFloatField;
    qryconsulta_lancamentoValor_Cobrado: TFloatField;
    qryconsulta_lancamentoObservacoes: TStringField;
    qryconsulta_lancamentoStatus: TStringField;
    qryconsulta_lancamentoNome: TStringField;
    qryconsulta_lancamentoDescricao: TStringField;
    qryconsulta_lancamentoDescricao_1: TStringField;
    qryconsulta_lancamentoDescricao_2: TStringField;
    qryconsulta_lancamentoPlano: TStringField;
    qryconsulta_lancamentoNome_1: TStringField;
    qrypagar_agrupado: TADOQuery;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    qryreceber_agrupado: TADOQuery;
    QRCompositeReport1: TQRCompositeReport;
    qryreceber_agrupadoCodigo: TIntegerField;
    qryreceber_agrupadoN_Documento: TIntegerField;
    qryreceber_agrupadoHistorico: TStringField;
    qryreceber_agrupadoData_Lancamento: TDateTimeField;
    qryreceber_agrupadoData_Vencimento: TDateTimeField;
    qryreceber_agrupadoData_Pagamento: TDateTimeField;
    qryreceber_agrupadoValor: TFloatField;
    qryreceber_agrupadoStatus: TStringField;
    qryreceber_agrupadoNome_Nome_Fantasia: TStringField;
    qrypagar_agrupadoCodigo: TIntegerField;
    qrypagar_agrupadoN_Documento: TIntegerField;
    qrypagar_agrupadoHistorico: TStringField;
    qrypagar_agrupadoData_Lancamento: TDateTimeField;
    qrypagar_agrupadoData_Vencimento: TDateTimeField;
    qrypagar_agrupadoData_Pagamento: TDateTimeField;
    qrypagar_agrupadoValor: TFloatField;
    qrypagar_agrupadoStatus: TStringField;
    qrypagar_agrupadoNome_Fantasia: TStringField;
    qryconsulta_lancamento_sinteticoN_Cheque: TStringField;
    qryconsulta_lancamento_sinteticoConta: TStringField;
    qrypagar_agrupadoN_Cheque: TStringField;
    qrypagar_agrupadoConta: TStringField;
    qryreceber_agrupadoN_Cheque: TStringField;
    qryreceber_agrupadoConta: TStringField;
    qryconsulta_lancamento_sinteticoData_Pagamento: TDateTimeField;
    TabSheet1: TTabSheet;
    DataSource4: TDataSource;
    qryagrupado_plano: TADOQuery;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    DBGrid1: TDBGrid;
    qryagrupado_planoMes: TStringField;
    qryagrupado_planoDescricao: TStringField;
    qryagrupado_planoValor_Total: TFloatField;
    qryagrupado_planoPercentual: TFloatField;
    DBGrid2: TDBGrid;
    qryagrupado_cli_forn: TADOQuery;
    DataSource5: TDataSource;
    qryagrupado_cli_fornMes: TStringField;
    qryagrupado_cli_fornNome: TStringField;
    qryagrupado_cli_fornValor_Total: TFloatField;
    qryagrupado_cli_fornPercentual: TFloatField;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    qryconsulta_lancamento_sintetico2: TADOQuery;
    DataSource6: TDataSource;
    qryconsulta_lancamento_sintetico2Tipo_Pagamento: TStringField;
    qryconsulta_lancamento_sintetico2Nome: TStringField;
    qryconsulta_lancamento_sintetico2Valor_Total: TFloatField;
    qryconsulta_lancamento_sintetico2Percentual: TFloatField;
    qryconsulta_lancamento_sinteticoValor_Pagar: TFloatField;
    qrypagar_agrupadoValor_Pagar: TFloatField;
    qryreceber_agrupadoValor_Pagar: TFloatField;
    qryconsulta_lancamento_sinteticoDias_Venc: TIntegerField;
    TabSheet7: TTabSheet;
    DBGrid7: TDBGrid;
    qryagrupado_departamento: TADOQuery;
    DataSource7: TDataSource;
    qryagrupado_departamentoMes: TStringField;
    qryagrupado_departamentoDescricao: TStringField;
    qryagrupado_departamentoValor_Total: TFloatField;
    qryagrupado_departamentoPercentual: TFloatField;
    BitBtn3: TBitBtn;
    qryconsulta_lancamento_sinteticoCond_Pag: TStringField;
    TabSheet8: TTabSheet;
    DBGrid8: TDBGrid;
    BitBtn4: TBitBtn;
    qryagrupado_forma_pagamento: TADOQuery;
    DataSource8: TDataSource;
    qryagrupado_forma_pagamentoMes: TStringField;
    qryagrupado_forma_pagamentoDescricao: TStringField;
    qryagrupado_forma_pagamentoValor_Total: TFloatField;
    qryagrupado_forma_pagamentoPercentual: TFloatField;
    qryconsulta_lancamento_sinteticoValor_Pago: TFloatField;
    qryconsulta_lancamento_sinteticoValor_Restante: TFloatField;
    TabSheet9: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    RGConsulta_Lancamento: TRadioGroup;
    EdtConsulta: TEdit;
    RGData: TRadioGroup;
    RGTipo_Conta: TRadioGroup;
    MEdtData_Final: TMaskEdit;
    MEdtData_Inicial: TMaskEdit;
    EdtCodigo_Cli_For: TEdit;
    RGTipo_Relatorio: TRadioGroup;
    RGStatus: TRadioGroup;
    RGConta_Fixa: TRadioGroup;
    CBMostrar_Historico: TCheckBox;
    qrypagar_agrupadoValor_Pago: TFloatField;
    qryreceber_agrupadoValor_Pago: TFloatField;
    qryreceber_agrupadoValor_Restante: TFloatField;
    qrypagar_agrupadoValor_Restante: TFloatField;
    cxPropertiesStore1: TcxPropertiesStore;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    BBtnExportar: TToolButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Codigo: TcxGridDBColumn;
    cxGrid1DBTableView1N_Documento: TcxGridDBColumn;
    cxGrid1DBTableView1Nome: TcxGridDBColumn;
    cxGrid1DBTableView1Historico: TcxGridDBColumn;
    cxGrid1DBTableView1Cond_Pag: TcxGridDBColumn;
    cxGrid1DBTableView1Data_Lancamento: TcxGridDBColumn;
    cxGrid1DBTableView1Data_Vencimento: TcxGridDBColumn;
    cxGrid1DBTableView1Data_Pagamento: TcxGridDBColumn;
    cxGrid1DBTableView1Dias_Venc: TcxGridDBColumn;
    cxGrid1DBTableView1Valor: TcxGridDBColumn;
    cxGrid1DBTableView1Valor_Pagar: TcxGridDBColumn;
    cxGrid1DBTableView1Valor_Pago: TcxGridDBColumn;
    cxGrid1DBTableView1Valor_Restante: TcxGridDBColumn;
    cxGrid1DBTableView1N_Cheque: TcxGridDBColumn;
    cxGrid1DBTableView1Conta: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    qryconsulta_lancamento_sinteticoTipo_Pagamento: TStringField;
    cxGrid1DBTableView1Tipo_Pagamento: TcxGridDBColumn;
    cxGrid1DBTableView1Tipo: TcxGridDBColumn;
    cxGrid1DBTableView1Status: TcxGridDBColumn;
    qryconsulta_lancamento_sinteticoPlano_Financeiro: TStringField;
    qryconsulta_lancamento_sinteticoDepartamento: TStringField;
    cxGrid1DBTableView1Plano_Financeiro: TcxGridDBColumn;
    cxGrid1DBTableView1Departamento: TcxGridDBColumn;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1Column1: TcxGridColumn;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBTableView2: TcxGridDBTableView;
    qryconsulta_ocorrencia: TADOQuery;
    DataSource9: TDataSource;
    qryconsulta_ocorrenciaCodigo: TAutoIncField;
    qryconsulta_ocorrenciaData_Cadastro: TDateTimeField;
    qryconsulta_ocorrenciaData_Cobranca: TDateTimeField;
    qryconsulta_ocorrenciaResponsavel_Atendimento: TStringField;
    qryconsulta_ocorrenciaOrigem_Atendimento: TIntegerField;
    qryconsulta_ocorrenciaCodigo_Lancamento_Financeiro: TIntegerField;
    qryconsulta_ocorrenciaN_Documento: TIntegerField;
    qryconsulta_ocorrenciaObservacoes: TStringField;
    cxGrid1DBTableView2Codigo: TcxGridDBColumn;
    cxGrid1DBTableView2Data_Cadastro: TcxGridDBColumn;
    cxGrid1DBTableView2Data_Cobranca: TcxGridDBColumn;
    cxGrid1DBTableView2Responsavel_Atendimento: TcxGridDBColumn;
    cxGrid1DBTableView2Origem_Atendimento: TcxGridDBColumn;
    cxGrid1DBTableView2Codigo_Lancamento_Financeiro: TcxGridDBColumn;
    cxGrid1DBTableView2N_Documento: TcxGridDBColumn;
    cxGrid1DBTableView2Observacoes: TcxGridDBColumn;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdtCodigo_Cli_ForKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RGConsulta_ParcelaEnter(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_Cli_ForKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnImprimir_SinteticoClick(Sender: TObject);
    procedure RGTipo_RelatorioClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RGDataClick(Sender: TObject);
    procedure qryconsulta_lancamento_sinteticoData_PagamentoGetText(
      Sender: TField; var Text: string; DisplayText: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid3TitleClick(Column: TColumn);
    procedure BBtnExportarClick(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid7TitleClick(Column: TColumn);
    procedure DBGrid8TitleClick(Column: TColumn);
    procedure qryconsulta_ocorrenciaOrigem_AtendimentoGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    procedure Limpa;
    { Private declarations }
  public
    ativo: boolean;
    imp, imp_agru: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Lancamentos_Financeiros: TFrmConsulta_Lancamentos_Financeiros;
  Utili: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Cliente, UChama_Fornecedor, UEscolha_Impressao,
  UChama_Plano_Financeiro, URel_Consulta_Lancamento_Financeiro,
  UChama_Condicao_Pagamento, UChama_Departamento, UChama_Tipo_Documento,
  URel_Consulta_Lancamento_Financeiro_Sintetico,
  URel_Consulta_Lancamento_Financeiro_Agrupado, UDeclaracao,
  URel_Consulta_Lancamento_Financeiro_Agrupado_Cliente,
  URel_Consulta_Lancamento_Financeiro_Agrupado_Plano,
  URel_Consulta_Lancamento_Financeiro_Sintetico2,
  URel_Consulta_Lancamento_Financeiro_Agrupado_Departamento,
  URel_Consulta_Lancamento_Financeiro_Agrupado_Forma_Pagamento,
  URel_Consulta_Lancamento_Financeiro_Sintetico_Condicao_Pagamento,
  URel_Consulta_Lancamento_Financeiro_Sintetico_CliForn,
  UEscolha_Campos_Imprimir, Util.Mensagens, Util.TLog;

{$R *.dfm}

procedure TFrmConsulta_Lancamentos_Financeiros.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.BBtnFiltrarClick(Sender: TObject);
begin
  if (RGTipo_Relatorio.ItemIndex = 0) then
  begin
    Consulta.Consulta_Lancamento_Financeiro_Sintetico;
    Consulta.Consulta_Ocorrencia_Cobranca;
    PageControl1.TabIndex:= 1;
    //BBtnImprimir.Enabled:= true;
    BBtnImprimir_Sintetico.Enabled:= true;
    BBtnExportar.Enabled:= true;
  {end
  else if (RGTipo_Relatorio.ItemIndex = 1) then
  begin
    Consulta.Consulta_Lancamento_Financeiro_Sintetico2;
    PageControl1.TabIndex:= 2;
    //BBtnImprimir.Enabled:= true;
    BBtnImprimir_Sintetico.Enabled:= true;
    BBtnExportar.Enabled:= false;
  end
  else if (RGTipo_Relatorio.ItemIndex = 2) then
  begin
    Consulta.Consulta_Lancamento_Financeiro_Pagar_Agrupado;
    Consulta.Consulta_Lancamento_Financeiro_Receber_Agrupado;
    PageControl1.TabIndex:= 3;
    //BBtnImprimir.Enabled:= true;
    BBtnImprimir_Sintetico.Enabled:= true;
    BBtnExportar.Enabled:= false;}
  end
  else if (RGTipo_Relatorio.ItemIndex = 1) then
  begin
    if (RGConsulta_Lancamento.ItemIndex = 2) and (RGData.ItemIndex <> 0) then
    begin
      Consulta.Consulta_Lancamento_Financeiro_Agrupado_Cli_Forn;
      PageControl1.TabIndex:= 2;
      PageControl2.TabIndex:= 0;
    end
    else if (RGConsulta_Lancamento.ItemIndex = 3) and (RGData.ItemIndex <> 0) then
    begin
      Consulta.Consulta_Lancamento_Financeiro_Agrupado_PF;
      PageControl1.TabIndex:= 2;
      PageControl2.TabIndex:= 1;
    end
    else if (RGConsulta_Lancamento.ItemIndex = 4) and (RGData.ItemIndex <> 0) then
    begin
      Consulta.Consulta_Lancamento_Financeiro_Agrupado_Departamento;
      PageControl1.TabIndex:= 2;
      PageControl2.TabIndex:= 2;
    end
    else if (RGConsulta_Lancamento.ItemIndex = 5) and (RGData.ItemIndex <> 0) then
    begin
      Consulta.Consulta_Lancamento_Financeiro_Agrupado_Forma_Pagamento;
      PageControl1.TabIndex:= 2;
      PageControl2.TabIndex:= 3;
    end
    else
    begin
      if (FrmConsulta_Lancamentos_Financeiros.qryagrupado_cli_forn.IsEmpty) then
      begin
        Application.MessageBox('Escolha a opção Cli./Forn, Plano Financeiro, Departamento ou Forma de Pag. A opção Data de Lançamento não pode ser escolhida.', 'Fim da Pesquisa', MB_OK+MB_ICONEXCLAMATION);
        Abort;
      end;
    end;
  end;

  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.BBtnImprimirClick(
  Sender: TObject);
begin
  FrmRel_Consulta_Lancamento_Financeiro:= TFrmRel_Consulta_Lancamento_Financeiro.create(self);
  FrmRel_Consulta_Lancamento_Financeiro.Release;
  FrmRel_Consulta_Lancamento_Financeiro:= Nil;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.BBtnImprimir_SinteticoClick(
  Sender: TObject);
begin
  if (RGTipo_Relatorio.ItemIndex = 0) then
  begin
    dxComponentPrinter1.Preview(True, nil);
    {Application.CreateForm(TFrmEscolha_Campos_Imprimir, FrmEscolha_Campos_Imprimir);
    FrmEscolha_Campos_Imprimir.ShowModal;
    FrmEscolha_Campos_Imprimir.Free;}
    {if (RGAgrupa_Por.ItemIndex = 0) then
    begin
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico:= TFrmRel_Consulta_Lancamento_Financeiro_Sintetico.create(self);
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico.Release;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico:= Nil;
    end
    else if (RGAgrupa_Por.ItemIndex = 1) then
    begin
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn:= TFrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.create(self);
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.Release;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn:= Nil;
    end
    else if (RGAgrupa_Por.ItemIndex = 2) then
    begin
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao:= TFrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.create(self);
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao.Release;
      FrmRel_Consulta_Lancamento_Financeiro_Sintetico_Condicao:= Nil;
    end;}
  end
  else if (RGTipo_Relatorio.ItemIndex = 1) then
  begin
    FrmRel_Consulta_Lancamento_Financeiro_Sintetico2:= TFrmRel_Consulta_Lancamento_Financeiro_Sintetico2.create(self);
    FrmRel_Consulta_Lancamento_Financeiro_Sintetico2.Release;
    FrmRel_Consulta_Lancamento_Financeiro_Sintetico2:= Nil;
  end
  else if (RGTipo_Relatorio.ItemIndex = 2) then
  begin
    FrmRel_Consulta_Lancamento_Financeiro_Agrupado:= TFrmRel_Consulta_Lancamento_Financeiro_Agrupado.create(self);
    FrmRel_Consulta_Lancamento_Financeiro_Agrupado.Release;
    FrmRel_Consulta_Lancamento_Financeiro_Agrupado:= Nil;
  end;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.Limpa;
begin
  qryconsulta_lancamento_sintetico.close;
  qrypagar_agrupado.Close;
  qryreceber_agrupado.Close;
  qryagrupado_plano.Close;
  qryagrupado_cli_forn.Close;
  qryagrupado_departamento.Close;
  qryagrupado_forma_pagamento.Close;
  qryconsulta_lancamento_sintetico2.Close;

  //RGConsulta_Lancamento.ItemIndex:= 0;
  //RGTipo_Conta.ItemIndex:= 0;
  //RGTipo_Relatorio.ItemIndex:= 0;
  //RGData.ItemIndex:= 0;
  //RGStatus.ItemIndex:= 0;

  {TRadioGroup(RGConsulta_Lancamento.Controls[0]).Enabled:= true;
  TRadioGroup(RGConsulta_Lancamento.Controls[1]).Enabled:= true;
  TRadioGroup(RGConsulta_Lancamento.Controls[2]).Enabled:= true;
  TRadioGroup(RGConsulta_Lancamento.Controls[3]).Enabled:= true;
  TRadioGroup(RGData.Controls[0]).Enabled:= true;
  TRadioGroup(RGStatus.Controls[0]).Enabled:= true;
  TRadioGroup(RGStatus.Controls[1]).Enabled:= true;}

end;

procedure TFrmConsulta_Lancamentos_Financeiros.qryconsulta_lancamento_sinteticoData_PagamentoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '30/12/1899') then
    Text:= ''
  else
    Text:= Sender.AsString;

end;

procedure TFrmConsulta_Lancamentos_Financeiros.qryconsulta_ocorrenciaOrigem_AtendimentoGetText(
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

procedure TFrmConsulta_Lancamentos_Financeiros.BBtnLimparClick(Sender: TObject);
begin
  PageControl1.TabIndex:= 0;
  Limpa;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnExportar.Enabled:= false;
  EdtConsulta.SetFocus;
  //BBtnImprimir.Enabled:= false;
  BBtnImprimir_Sintetico.Enabled:= false;
  //EdtConsulta.Clear;
  //EdtCodigo_Cli_For.Clear;
  //MEdtData_Final.Clear;
  //MEdtData_Inicial.Clear;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.BitBtn1Click(Sender: TObject);
begin
  FrmRel_Consulta_Lancamento_Financeiro_Agrupado_Plano:= TFrmRel_Consulta_Lancamento_Financeiro_Agrupado_Plano.create(self);
  FrmRel_Consulta_Lancamento_Financeiro_Agrupado_Plano.Release;
  FrmRel_Consulta_Lancamento_Financeiro_Agrupado_Plano:= Nil;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.BitBtn2Click(Sender: TObject);
begin
  FrmRel_Consulta_Lancamento_Financeiro_Agrupado_Cliente:= TFrmRel_Consulta_Lancamento_Financeiro_Agrupado_Cliente.create(self);
  FrmRel_Consulta_Lancamento_Financeiro_Agrupado_Cliente.Release;
  FrmRel_Consulta_Lancamento_Financeiro_Agrupado_Cliente:= Nil;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.BitBtn3Click(Sender: TObject);
begin
  FrmRel_Consulta_Lancamento_Financeiro_Agrupado_Departamento:= TFrmRel_Consulta_Lancamento_Financeiro_Agrupado_Departamento.create(self);
  FrmRel_Consulta_Lancamento_Financeiro_Agrupado_Departamento.Release;
  FrmRel_Consulta_Lancamento_Financeiro_Agrupado_Departamento:= Nil;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.BitBtn4Click(Sender: TObject);
begin
  FrmRel_Consulta_Lancamento_Financeiro_Agrupado_Forma_Pagamento:= TFrmRel_Consulta_Lancamento_Financeiro_Agrupado_Forma_Pagamento.create(self);
  FrmRel_Consulta_Lancamento_Financeiro_Agrupado_Forma_Pagamento.Release;
  FrmRel_Consulta_Lancamento_Financeiro_Agrupado_Forma_Pagamento:= Nil;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.DBGrid1CellClick(
  Column: TColumn);
begin
  Consulta.Consulta_Parcelas_Lancamento;
  {if (Consulta.Consulta_Pagamento_Lancamento = false) then
    Application.MessageBox('Não há pagamentos efetuados por esse documento', 'Pagamento não encontrado', MB_OK+MB_ICONQUESTION);}
end;

procedure TFrmConsulta_Lancamentos_Financeiros.DBGrid1DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
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

procedure TFrmConsulta_Lancamentos_Financeiros.DBGrid1TitleClick(
  Column: TColumn);
begin
  Utili.Ordena_Grid(qryagrupado_plano, Column);
end;

procedure TFrmConsulta_Lancamentos_Financeiros.DBGrid2CellClick(
  Column: TColumn);
var
  qAux: TADOQuery;
begin
  {if (RGConsulta_Parcela.ItemIndex = 0) or (RGConsulta_Parcela.ItemIndex = 1) or (RGConsulta_Parcela.ItemIndex = 2) or (RGConsulta_Parcela.ItemIndex = 3) or (RGConsulta_Parcela.ItemIndex = 4) then
  begin
    qAux:= TADOQuery.Create(self);
    try
      with qAux, sql do
      begin
        close;
        clear;
        Connection:= dm.ADOConnection1;
        add('Select LF.* from Lancamento_Financeiro LF');
        add('inner join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)');
        add('where PL.Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value:= qryconsulta_parcelasCodigo.AsInteger;
        open;
      end;
      if (qAux.IsEmpty = false) then
      begin
        if (qAux.FieldByName('Tipo').AsString = 'PAGAR') then
        begin
          with qryconsulta_lancamento do
            begin
              close;
              sql.clear;
              sql.add('select LF.*, Forn.Nome_Fantasia as Nome, CP.Descricao, TD.Descricao, D.Descricao, PF.Plano,');
              sql.add('(select sum(Valor_Documento) from Lancamento_Financeiro LF where LF.N_Documento = :Documento and LF.Tipo = :Tipo and LF.Status = :Status) as valor_doc,');
              sql.add('(select sum(Desconto) from Lancamento_Financeiro LF where LF.N_Documento = :Documentoo and LF.Tipo = :Tipoo and LF.Status = :Statuss) as desco,');
              sql.add('(select sum(Multa) from Lancamento_Financeiro LF where LF.N_Documento = :Documentooo and LF.Tipo = :Tipooo and LF.Status = :Statusss) as mult,');
              sql.add('(select sum(Valor_Cobrado) from Lancamento_Financeiro LF where LF.N_Documento = :Documentoooo and LF.Tipo = :Tipoooo and LF.Status = :Statussss) as valor_cob');
              sql.add('from Lancamento_Financeiro LF');
              sql.add('left join Fornecedor Forn on(LF.Codigo_Cli_For = Forn.Codigo)');
              sql.add('left join Condicao_Pagamento CP on(LF.Codigo_Forma_Pagamento = CP.Codigo)');
              sql.add('left join Tipo_Documento TD on(LF.Codigo_Tipo_Documento = TD.Codigo)');
              sql.add('left join Departamento D on(LF.Codigo_Departamento = D.Codigo)');
              sql.add('left join Plano_Financeiro PF on(LF.Codigo_Plano = PF.Codigo)');
{              sql.add('select LF.*, Forn.Nome_Fantasia as Nome, CP.Descricao, TD.Descricao, D.Descricao, PF.Plano from Lancamento_Financeiro LF');
              sql.add('left join Fornecedor Forn on(LF.Codigo_Cli_For = Forn.Codigo)');
              sql.add('left join Condicao_Pagamento CP on(LF.Codigo_Forma_Pagamento = CP.Codigo)');
              sql.add('left join Tipo_Documento TD on(LF.Codigo_Tipo_Documento = TD.Codigo)');
              sql.add('left join Departamento D on(LF.Codigo_Departamento = D.Codigo)');
              sql.add('left join Plano_Financeiro PF on(LF.Codigo_Plano = PF.Codigo)');
              sql.add('where LF.Codigo = :Codigo');
              Parameters.ParamByName('Codigo').Value:= qryconsulta_parcelasCodigo.AsInteger;
              open;
            end;
        end
        else
        begin
          with qryconsulta_lancamento do
            begin
              close;
              sql.clear;
              sql.add('select LF.*, Cli.Nome_Nome_Fantasia as Nome, CP.Descricao, TD.Descricao, D.Descricao, PF.Plano from Lancamento_Financeiro LF');
              sql.add('left join Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo)');
              sql.add('left join Condicao_Pagamento CP on(LF.Codigo_Forma_Pagamento = CP.Codigo)');
              sql.add('left join Tipo_Documento TD on(LF.Codigo_Tipo_Documento = TD.Codigo)');
              sql.add('left join Departamento D on(LF.Codigo_Departamento = D.Codigo)');
              sql.add('left join Plano_Financeiro PF on(LF.Codigo_Plano = PF.Codigo)');
              sql.add('where LF.Codigo = :Codigo');
              Parameters.ParamByName('Codigo').Value:= qryconsulta_parcelasCodigo.AsInteger;
              open;
            end;
        end;
      end;
    finally
      FreeAndNil(qAux);
    end;
  end;}
end;

procedure TFrmConsulta_Lancamentos_Financeiros.DBGrid2DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
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

procedure TFrmConsulta_Lancamentos_Financeiros.DBGrid2TitleClick(
  Column: TColumn);
begin
  Utili.Ordena_Grid(qryagrupado_cli_forn, Column);
end;

procedure TFrmConsulta_Lancamentos_Financeiros.DBGrid3TitleClick(
  Column: TColumn);
begin
  if (qryconsulta_lancamento_sintetico.Sort <> column.FieldName+ ' ASC') then
    qryconsulta_lancamento_sintetico.Sort:=column.FieldName+ ' ASC'
  else
    qryconsulta_lancamento_sintetico.sort:=column.fieldname+ ' DESC';
end;

procedure TFrmConsulta_Lancamentos_Financeiros.DBGrid7TitleClick(
  Column: TColumn);
begin
  Utili.Ordena_Grid(qryagrupado_departamento, Column);
end;

procedure TFrmConsulta_Lancamentos_Financeiros.DBGrid8TitleClick(
  Column: TColumn);
begin
  Utili.Ordena_Grid(qryagrupado_forma_pagamento, Column);
end;

procedure TFrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_ForKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      if (RGTipo_Conta.ItemIndex = 1) and (RGConsulta_Lancamento.ItemIndex = 2) then
      begin
        Application.CreateForm(TFrmChama_Fornecedor, FrmChama_Fornecedor);
        FrmChama_Fornecedor.ShowModal;
        FrmChama_Fornecedor.Free;
      end
      else if (RGTipo_Conta.ItemIndex = 2) and (RGConsulta_Lancamento.ItemIndex = 2) then
      begin
        Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
        FrmChama_Cliente.ShowModal;
        FrmChama_Cliente.Free;
      end
      else if (RGConsulta_Lancamento.ItemIndex = 3) then
      begin
        Application.CreateForm(TFrmChama_Plano_Financeiro, FrmChama_Plano_Financeiro);
        FrmChama_Plano_Financeiro.ShowModal;
        FrmChama_Plano_Financeiro.Free;
      end
      else if (RGConsulta_Lancamento.ItemIndex = 4) then
      begin
        Application.CreateForm(TFrmChama_Departamento, FrmChama_Departamento);
        FrmChama_Departamento.ShowModal;
        FrmChama_Departamento.Free;
      end
      else if (RGConsulta_Lancamento.ItemIndex = 5) then
      begin
        Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
        FrmChama_Condicao_Pagamento.ShowModal;
        FrmChama_Condicao_Pagamento.Free;
      end
      else if (RGConsulta_Lancamento.ItemIndex = 6) then
      begin
        Application.CreateForm(TFrmChama_Tipo_Documento, FrmChama_Tipo_Documento);
        FrmChama_Tipo_Documento.ShowModal;
        FrmChama_Tipo_Documento.Free;
      end;
    end;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_ForKeyPress(
  Sender: TObject; var Key: Char);
begin
  Utili.Somente_Apaga(key);
end;

procedure TFrmConsulta_Lancamentos_Financeiros.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Lancamento_Financeiro(EdtConsulta.Text);
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    //BBtnImprimir.Enabled:= true;
  end;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Lancamentos_Financeiros.Free;
  FrmConsulta_Lancamentos_Financeiros:= NIl;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.FormCreate(Sender: TObject);
begin
  PageControl1.TabIndex:= 0;
  qryconsulta_lancamento_sintetico.Close;
  qryconsulta_lancamento.close;
  qryconsulta_parcelas.close;
  qryagrupado_plano.Close;
  qryagrupado_cli_forn.Close;
  qryconsulta_lancamento_sintetico2.Close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  //BBtnImprimir.Enabled:= false;
  EdtConsulta.Clear;
  Utili.Inicia_Data(MEdtData_Final, MEdtData_Inicial);
end;

procedure TFrmConsulta_Lancamentos_Financeiros.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.RGConsulta_ParcelaEnter(
  Sender: TObject);
begin
  RGConsulta_Lancamento.ItemIndex:= -1;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.RGDataClick(Sender: TObject);
begin
  {if (RGData.ItemIndex = 0) or (RGData.ItemIndex = 2) then
  begin
    TRadioGroup(RGStatus.Controls[0]).Enabled:= true;
    TRadioGroup(RGStatus.Controls[1]).Enabled:= true;
  end
  else
  begin
    TRadioGroup(RGStatus.Controls[0]).Enabled:= false;
    TRadioGroup(RGStatus.Controls[1]).Enabled:= false;
  end;}

end;

procedure TFrmConsulta_Lancamentos_Financeiros.RGTipo_RelatorioClick(
  Sender: TObject);
begin
  if (RGTipo_Relatorio.ItemIndex = 33) then
  begin
    TRadioGroup(RGConsulta_Lancamento.Controls[0]).Enabled:= true;
    TRadioGroup(RGConsulta_Lancamento.Controls[1]).Enabled:= false;
    TRadioGroup(RGConsulta_Lancamento.Controls[2]).Enabled:= true;
    TRadioGroup(RGConsulta_Lancamento.Controls[3]).Enabled:= false;
    TRadioGroup(RGConsulta_Lancamento.Controls[4]).Enabled:= false;
    TRadioGroup(RGConsulta_Lancamento.Controls[5]).Enabled:= true;
    RGTipo_Conta.Enabled:= true;
    RGConsulta_Lancamento.ItemIndex:= 0;
    TRadioGroup(RGData.Controls[0]).Enabled:= true;
    RGData.ItemIndex:= 0;
    RGConsulta_Lancamento.ItemIndex:= 0;
  end
  else if (RGTipo_Relatorio.ItemIndex = 23) then
  begin
    TRadioGroup(RGConsulta_Lancamento.Controls[0]).Enabled:= false;
    TRadioGroup(RGConsulta_Lancamento.Controls[1]).Enabled:= false;
    TRadioGroup(RGConsulta_Lancamento.Controls[2]).Enabled:= false;
    TRadioGroup(RGConsulta_Lancamento.Controls[3]).Enabled:= false;
    TRadioGroup(RGConsulta_Lancamento.Controls[4]).Enabled:= false;
    TRadioGroup(RGConsulta_Lancamento.Controls[5]).Enabled:= false;
    RGTipo_Conta.Enabled:= false;
    RGConsulta_Lancamento.ItemIndex:= 0;
    TRadioGroup(RGData.Controls[0]).Enabled:= false;
    RGData.ItemIndex:= 1;
  end
  else if (RGTipo_Relatorio.ItemIndex = 1) then
  begin
    TRadioGroup(RGConsulta_Lancamento.Controls[0]).Enabled:= false;
    TRadioGroup(RGConsulta_Lancamento.Controls[1]).Enabled:= false;
    TRadioGroup(RGConsulta_Lancamento.Controls[2]).Enabled:= true;
    TRadioGroup(RGConsulta_Lancamento.Controls[3]).Enabled:= true;
    TRadioGroup(RGConsulta_Lancamento.Controls[4]).Enabled:= true;
    TRadioGroup(RGConsulta_Lancamento.Controls[5]).Enabled:= true;
    RGConsulta_Lancamento.ItemIndex:= 2;
    RGTipo_Conta.Enabled:= true;
    TRadioGroup(RGData.Controls[0]).Enabled:= false;
    RGData.ItemIndex:= 1;
  end
  else
  begin
    TRadioGroup(RGConsulta_Lancamento.Controls[0]).Enabled:= true;
    TRadioGroup(RGConsulta_Lancamento.Controls[1]).Enabled:= true;
    TRadioGroup(RGConsulta_Lancamento.Controls[2]).Enabled:= true;
    TRadioGroup(RGConsulta_Lancamento.Controls[3]).Enabled:= true;
    TRadioGroup(RGConsulta_Lancamento.Controls[4]).Enabled:= true;
    RGConsulta_Lancamento.ItemIndex:= 0;
    RGTipo_Conta.Enabled:= true;
    TRadioGroup(RGData.Controls[0]).Enabled:= true;
    RGData.ItemIndex:= 0;
    RGConsulta_Lancamento.ItemIndex:= 0;
  end;
end;

procedure TFrmConsulta_Lancamentos_Financeiros.BBtnExportarClick(
  Sender: TObject);
var
  NomeArquivo, DataAtual: AnsiString;
begin
  try
    DataAtual:= FormatDateTime('YYYYMMDDHHMM', now);
    NomeArquivo:= ExtractFilePath(Application.ExeName)+ 'Relatórios\XLS\LancamentoFinanceiroSintetico1'+DataAtual+'.xls';
    ExportGridToExcel(NomeArquivo, cxGrid1, false);
    TMensagens.MensagemInformacao('Relatório exportado para: '+NomeArquivo);
  except on E:Exception do
  begin
    TMensagens.MensagemErro('Erro ao exportar relatório: '+e.Message);
    TLog.Error('Erro ao exportar relatório: '+e.Message);
  end;
  end;
end;

end.
