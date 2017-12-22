unit UConsulta_Venda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  UGeral, ADODB, UConsulta, UCadastro_Cliente, Mask, Buttons, cxGraphics,
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
  cxGridCustomView, cxGrid, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxSkinsdxBarPainter, dxPSCore, dxPScxCommon, cxPropertiesStore;

type
  TFrmConsulta_Venda = class(TForm)
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    LblEscolha: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    EdtCodigo: TEdit;
    MEdtData_Inicial: TMaskEdit;
    MEdtData_Final: TMaskEdit;
    RGStatus: TRadioGroup;
    EdtPedido: TEdit;
    ds_consulta_folha: TDataSource;
    qryitens_venda: TADOQuery;
    ds_consulta_itens_folha: TDataSource;
    TabSheet3: TTabSheet;
    RGTipo_Relatorio: TRadioGroup;
    Panel3: TPanel;
    DBGrid3: TDBGrid;
    Panel4: TPanel;
    DBGrid4: TDBGrid;
    TabSheet4: TTabSheet;
    Panel5: TPanel;
    DBGrid5: TDBGrid;
    TabSheet5: TTabSheet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    qryconsulta_sintetico_produto: TADOQuery;
    DataSource3: TDataSource;
    qryconsulta_sintetico_produtoData_Venda: TDateTimeField;
    qryconsulta_sintetico_produtoCodigo_Venda: TStringField;
    qryconsulta_sintetico_produtoDescricao: TStringField;
    qryconsulta_sintetico_produtoUN: TStringField;
    qryconsulta_sintetico_produtoQtde: TFloatField;
    qryconsulta_sintetico_produtoValor_Total: TFloatField;
    qryconsulta_sintetico_1: TADOQuery;
    DataSource4: TDataSource;
    TabSheet6: TTabSheet;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    qryconsulta_venda_tributo: TADOQuery;
    DataSource5: TDataSource;
    qryconsulta_venda_tributoData_Venda: TDateTimeField;
    qryconsulta_venda_tributoN_Pedido: TStringField;
    qryconsulta_venda_tributoCOO: TStringField;
    qryconsulta_venda_tributoCOO_Vin: TStringField;
    qryconsulta_venda_tributoN_Nota_Fiscal: TIntegerField;
    qryconsulta_venda_tributoChave_NFe: TStringField;
    qryconsulta_venda_tributoProtocolo_NFe: TStringField;
    qryconsulta_venda_tributoNome_Nome_Fantasia: TStringField;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    DBGrid6: TDBGrid;
    TabSheet7: TTabSheet;
    DBGrid7: TDBGrid;
    TabSheet8: TTabSheet;
    DBGrid2: TDBGrid;
    qrylucratividade_cliente: TADOQuery;
    DataSource6: TDataSource;
    qrylucratividade_clienteMes: TStringField;
    qrylucratividade_clienteNome_Nome_Fantasia: TStringField;
    qrylucratividade_clienteValor_Total: TFloatField;
    qrylucratividade_clientePercentual: TFloatField;
    qrylucratividade_vendedor: TADOQuery;
    qrylucratividade_vendedorMes: TStringField;
    qrylucratividade_vendedorNome: TStringField;
    qrylucratividade_vendedorCusto_Total: TFloatField;
    qrylucratividade_vendedorVenda_Total: TFloatField;
    qrylucratividade_vendedorPercentual: TFloatField;
    qrylucratividade_geral: TADOQuery;
    qrylucratividade_geralMes: TStringField;
    qrylucratividade_geralCusto_Total: TFloatField;
    qrylucratividade_geralVenda_Total: TFloatField;
    qrylucratividade_geralPercentual: TFloatField;
    TabSheet9: TTabSheet;
    DBGrid8: TDBGrid;
    DataSource7: TDataSource;
    qrylucratividade_grupo: TADOQuery;
    GBLucratividade: TGroupBox;
    CBGeral: TCheckBox;
    CBVendedor: TCheckBox;
    CBCliente: TCheckBox;
    CBGrupo: TCheckBox;
    qrylucratividade_grupoMes: TStringField;
    qrylucratividade_grupoDescricao: TStringField;
    qrylucratividade_grupoVenda_Total: TFloatField;
    qrylucratividade_grupoPercentual: TFloatField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    RGOpcao_Impressao: TRadioGroup;
    TabSheet10: TTabSheet;
    qrydados_agrupados_grupo: TADOQuery;
    DataSource8: TDataSource;
    qrydados_agrupados_grupoGrupo: TStringField;
    qrydados_agrupados_grupoCodigo: TIntegerField;
    qrydados_agrupados_grupoCodigo_Venda: TStringField;
    qrydados_agrupados_grupoDescricao: TStringField;
    qrydados_agrupados_grupoUN: TStringField;
    qrydados_agrupados_grupoQtde: TFloatField;
    qrydados_agrupados_grupoValor_Unitario: TFloatField;
    qrydados_agrupados_grupoSub_Total: TFloatField;
    PageControl3: TPageControl;
    TabSheet11: TTabSheet;
    DBGrid9: TDBGrid;
    BitBtn5: TBitBtn;
    qrydados_agrupados_grupoCodGrupo: TAutoIncField;
    qrydados_agrupados_grupoData_Venda: TDateTimeField;
    TabSheet12: TTabSheet;
    DBGrid10: TDBGrid;
    BitBtn6: TBitBtn;
    qrydados_agrupados_cliente: TADOQuery;
    DataSource9: TDataSource;
    qrydados_agrupados_clienteCodCliente: TIntegerField;
    qrydados_agrupados_clienteNome_Nome_Fantasia: TStringField;
    qrydados_agrupados_clienteRazao_Social: TStringField;
    qrydados_agrupados_clienteCodigo: TIntegerField;
    qrydados_agrupados_clienteCodigo_Venda: TStringField;
    qrydados_agrupados_clienteDescricao: TStringField;
    qrydados_agrupados_clienteUN: TStringField;
    qrydados_agrupados_clienteQtde: TFloatField;
    qrydados_agrupados_clienteValor_Unitario: TFloatField;
    qrydados_agrupados_clienteSub_Total: TFloatField;
    qrydados_agrupados_clienteData_Venda: TDateTimeField;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1Column1: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBTableView2: TcxGridDBTableView;
    qryconsulta_sintetico_1Codigo: TIntegerField;
    qryconsulta_sintetico_1N_Pedido: TStringField;
    qryconsulta_sintetico_1Data_Venda: TDateTimeField;
    qryconsulta_sintetico_1Total_Pedido: TFloatField;
    qryconsulta_sintetico_1Cond_Pag: TStringField;
    qryconsulta_sintetico_1Nome_Nome_Fantasia: TStringField;
    qryconsulta_sintetico_1Funcionario: TStringField;
    qryconsulta_sintetico_1CFOP: TStringField;
    qryconsulta_sintetico_1Status: TStringField;
    cxGrid1DBTableView1Codigo: TcxGridDBColumn;
    cxGrid1DBTableView1N_Pedido: TcxGridDBColumn;
    cxGrid1DBTableView1Data_Venda: TcxGridDBColumn;
    cxGrid1DBTableView1Total_Pedido: TcxGridDBColumn;
    cxGrid1DBTableView1Cond_Pag: TcxGridDBColumn;
    cxGrid1DBTableView1Nome_Nome_Fantasia: TcxGridDBColumn;
    cxGrid1DBTableView1Funcionario: TcxGridDBColumn;
    cxGrid1DBTableView1CFOP: TcxGridDBColumn;
    cxGrid1DBTableView1Status: TcxGridDBColumn;
    qryitens_vendaCodigo_Produto: TIntegerField;
    qryitens_vendaCodigo: TIntegerField;
    qryitens_vendaCodigo_Venda: TStringField;
    qryitens_vendaDescricao: TStringField;
    qryitens_vendaUN: TStringField;
    qryitens_vendaQtde: TFloatField;
    qryitens_vendaValor_Original: TFloatField;
    qryitens_vendaDesc_Acr: TFloatField;
    qryitens_vendaValor_Unitario: TFloatField;
    qryitens_vendaValor_Compra: TFloatField;
    qryitens_vendaSub_Total: TFloatField;
    cxGrid1DBTableView2Codigo_Produto: TcxGridDBColumn;
    cxGrid1DBTableView2Codigo: TcxGridDBColumn;
    cxGrid1DBTableView2Codigo_Venda: TcxGridDBColumn;
    cxGrid1DBTableView2Descricao: TcxGridDBColumn;
    cxGrid1DBTableView2UN: TcxGridDBColumn;
    cxGrid1DBTableView2Qtde: TcxGridDBColumn;
    cxGrid1DBTableView2Valor_Original: TcxGridDBColumn;
    cxGrid1DBTableView2Desc_Acr: TcxGridDBColumn;
    cxGrid1DBTableView2Valor_Unitario: TcxGridDBColumn;
    cxGrid1DBTableView2Valor_Compra: TcxGridDBColumn;
    cxGrid1DBTableView2Sub_Total: TcxGridDBColumn;
    cxPropertiesStore1: TcxPropertiesStore;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    BBtnExporta_XLS: TToolButton;
    qryconsulta_sintetico_1Total_Impostos: TFloatField;
    qryitens_vendaValor_ICMS_ST: TFloatField;
    cxGrid1DBTableView2Valor_ICMS_ST: TcxGridDBColumn;
    qryconsulta_sintetico_1Data_Emissao_NFe: TDateTimeField;
    cxGrid1DBTableView1Data_Emissao_NFe: TcxGridDBColumn;
    qryitens_vendaCodigo_Registro: TAutoIncField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure EdtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RGConsulta_PorClick(Sender: TObject);
    procedure EdtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BBtnImprimir_S1Click(Sender: TObject);
    procedure BBtnImprimir_S2Click(Sender: TObject);
    procedure RGTipo_RelatorioClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BBtnExporta_XLSClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure qryconsulta_sintetico_1Data_Emissao_NFeGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
    procedure FechaQuery;
  public
    ativo: Boolean;
    mes1, mes2, ano1, ano2: AnsiString;
    { Public declarations }
  end;

var
  FrmConsulta_Venda: TFrmConsulta_Venda;
  Utili: TUtil;
  Consulta: TConsulta;

implementation

uses UDM, UChama_Cliente, UChama_Funcionario, UChama_Tabela_Preco,
  URel_Consulta_Venda_Sintetico1,
  URel_Consulta_Venda_Sintetico2, URel_Consulta_Venda_Produto,
  URel_Consulta_Venda_Tributo, URel_Consulta_Venda_Grupo,
  URel_Consulta_Venda_Cliente, URel_Consulta_Venda_Vendedor,
  URel_Consulta_Venda_Geral, URel_Consulta_Venda_Cliente_Sintetico,
  URel_Consulta_Venda_Agrupado_Grupo, URel_Consulta_Venda_Agrupado_Cliente,
  cxGridExportLink, Util.Mensagens, Util.TLog;
{$R *.dfm}

procedure TFrmConsulta_Venda.BBtnExporta_XLSClick(Sender: TObject);
var
  NomeArquivo, DataAtual: AnsiString;
begin
  try
    DataAtual:= FormatDateTime('YYYYMMDDHHMM', now);
    NomeArquivo:= ExtractFilePath(Application.ExeName)+ 'Relatórios\XLS\VendasAnalitico'+DataAtual+'.xls';
    ExportGridToExcel(NomeArquivo, cxGrid1, false);
    TMensagens.MensagemInformacao('Relatório exportado para: '+NomeArquivo);
  except on E:Exception do
  begin
    TMensagens.MensagemErro('Erro ao exportar relatório: '+e.Message);
    TLog.Error('Erro ao exportar relatório: '+e.Message);
  end;
  end;
end;

procedure TFrmConsulta_Venda.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Venda.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  if (RGTipo_Relatorio.ItemIndex = 0) then
  begin
    Consulta.Consulta_Venda_Sintetico_1;
    Consulta.Consulta_Itens_Venda;
    PageControl1.TabIndex := 1;

    if (qryconsulta_sintetico_1.IsEmpty = false) then
    begin
      BBtnFiltrar.Enabled := false;
      BBtnLimpar.Enabled := true;
      BBtnImprimir.Enabled := true;
      BBtnExporta_XLS.Enabled:= true;
    end;
  end
  else if (RGTipo_Relatorio.ItemIndex = 1) then
  begin
    Consulta.Consulta_Venda_Sintetico_2;
    PageControl1.TabIndex := 2;
    if (qryconsulta_sintetico_produto.IsEmpty = false) then
    begin
      BBtnFiltrar.Enabled := false;
      BBtnLimpar.Enabled := true;
      BBtnImprimir.Enabled := true;
    end;
  end
  else if (RGTipo_Relatorio.ItemIndex = 2) then
  begin
    PageControl1.TabIndex := 3;
    mes1 := FormatDateTime('MM', StrToDateTime(MEdtData_Inicial.Text));
    ano1 := FormatDateTime('YYYY', StrToDateTime(MEdtData_Inicial.Text));

    mes2 := FormatDateTime('MM', StrToDateTime(MEdtData_Final.Text));
    ano2 := FormatDateTime('YYYY', StrToDateTime(MEdtData_Final.Text));

    if (CBGeral.Checked) then
      Consulta.Consulta_Venda_Lucratividade_Geral;

    if (CBVendedor.Checked) then
      Consulta.Consulta_Venda_Lucratividade_Vendedor;

    if (CBCliente.Checked) then
      Consulta.Consulta_Venda_Lucratividade_Cliente;

    if (CBGrupo.Checked) then
      Consulta.Consulta_Venda_Lucratividade_Grupo;

    BBtnLimpar.Enabled := true;
    BBtnImprimir.Enabled := false;
    PageControl1.TabIndex := 3;
    PageControl2.TabIndex := 0;

  end
  else if (RGTipo_Relatorio.ItemIndex = 3) then
  begin
    PageControl1.TabIndex := 5;
    Consulta.Consulta_Venda_Tributo;

    if (qryconsulta_venda_tributo.IsEmpty = false) then
    begin
      BBtnFiltrar.Enabled := false;
      BBtnLimpar.Enabled := true;
      BBtnImprimir.Enabled := true;
    end;
  end
  else if (RGTipo_Relatorio.ItemIndex = 4) then
  begin
    PageControl1.TabIndex := 4;
    PageControl3.TabIndex := 0;

    if (CBCliente.Checked) then
      Consulta.Consulta_Venda_Agrupado_Cliente;

    if (CBGrupo.Checked) then
      Consulta.Consulta_Venda_Agrupado_Grupo;

    BBtnLimpar.Enabled := true;
    BBtnImprimir.Enabled := false;
  end;

end;

procedure TFrmConsulta_Venda.BBtnImprimirClick(Sender: TObject);
begin
  if (RGTipo_Relatorio.ItemIndex = 0) then
  begin
    dxComponentPrinter1.Preview(True, nil);
    {FrmRel_Consulta_Venda_Sintetico1 := TFrmRel_Consulta_Venda_Sintetico1.create(self);
    FrmRel_Consulta_Venda_Sintetico1.Release;
    FrmRel_Consulta_Venda_Sintetico1 := Nil; }
  end
  else if (RGTipo_Relatorio.ItemIndex = 1) then
  begin
    if (RGOpcao_Impressao.ItemIndex = 0) then
    begin
      FrmRel_Consulta_Venda_Cliente_Sintetico := TFrmRel_Consulta_Venda_Cliente_Sintetico.create(self);
      FrmRel_Consulta_Venda_Cliente_Sintetico.Release;
      FrmRel_Consulta_Venda_Cliente_Sintetico := Nil;
    end
    else if (RGOpcao_Impressao.ItemIndex = 1) then
    begin
      FrmRel_Consulta_Venda_Produto := TFrmRel_Consulta_Venda_Produto.create
        (self);
      FrmRel_Consulta_Venda_Produto.Release;
      FrmRel_Consulta_Venda_Produto := Nil;
    end;
  end
  else if (RGTipo_Relatorio.ItemIndex = 2) then
  begin
    { FrmRel_Consulta_Venda_Sintetico2:= TFrmRel_Consulta_Venda_Sintetico2.create(self);
      FrmRel_Consulta_Venda_Sintetico2.Release;
      FrmRel_Consulta_Venda_Sintetico2:= Nil; }
  end
  else if (RGTipo_Relatorio.ItemIndex = 3) then
  begin
    FrmRel_Consulta_Venda_Tributo := TFrmRel_Consulta_Venda_Tributo.create
      (self);
    FrmRel_Consulta_Venda_Tributo.Release;
    FrmRel_Consulta_Venda_Tributo := Nil;
  end;
end;

procedure TFrmConsulta_Venda.BBtnImprimir_S1Click(Sender: TObject);
begin
  FrmRel_Consulta_Venda_Sintetico1 := TFrmRel_Consulta_Venda_Sintetico1.create
    (self);
  FrmRel_Consulta_Venda_Sintetico1.Release;
  FrmRel_Consulta_Venda_Sintetico1 := Nil;
end;

procedure TFrmConsulta_Venda.BBtnImprimir_S2Click(Sender: TObject);
begin
  FrmRel_Consulta_Venda_Sintetico2 := TFrmRel_Consulta_Venda_Sintetico2.create
    (self);
  FrmRel_Consulta_Venda_Sintetico2.Release;
  FrmRel_Consulta_Venda_Sintetico2 := Nil;
end;

procedure TFrmConsulta_Venda.BBtnLimparClick(Sender: TObject);
begin
  PageControl1.TabIndex := 0;
  PageControl2.TabIndex := 1;
  FechaQuery;
  BBtnFiltrar.Enabled := true;
  BBtnLimpar.Enabled := false;
  BBtnImprimir.Enabled := false;
  BBtnExporta_XLS.Enabled:= false;
end;

procedure TFrmConsulta_Venda.BitBtn1Click(Sender: TObject);
begin
  FrmRel_Consulta_Venda_Grupo := TFrmRel_Consulta_Venda_Grupo.create(self);
  FrmRel_Consulta_Venda_Grupo.Release;
  FrmRel_Consulta_Venda_Grupo := Nil;
end;

procedure TFrmConsulta_Venda.BitBtn2Click(Sender: TObject);
begin
  FrmRel_Consulta_Venda_Cliente := TFrmRel_Consulta_Venda_Cliente.create(self);
  FrmRel_Consulta_Venda_Cliente.Release;
  FrmRel_Consulta_Venda_Cliente := Nil;
end;

procedure TFrmConsulta_Venda.BitBtn3Click(Sender: TObject);
begin
  FrmRel_Consulta_Venda_Vendedor := TFrmRel_Consulta_Venda_Vendedor.create
    (self);
  FrmRel_Consulta_Venda_Vendedor.Release;
  FrmRel_Consulta_Venda_Vendedor := Nil;
end;

procedure TFrmConsulta_Venda.BitBtn4Click(Sender: TObject);
begin
  FrmRel_Consulta_Venda_Geral := TFrmRel_Consulta_Venda_Geral.create(self);
  FrmRel_Consulta_Venda_Geral.Release;
  FrmRel_Consulta_Venda_Geral := Nil;
end;

procedure TFrmConsulta_Venda.BitBtn5Click(Sender: TObject);
begin
  FrmRel_Consulta_Venda_Agrupado_Grupo := TFrmRel_Consulta_Venda_Agrupado_Grupo.create(self);
  FrmRel_Consulta_Venda_Agrupado_Grupo.Release;
  FrmRel_Consulta_Venda_Agrupado_Grupo := Nil;
end;

procedure TFrmConsulta_Venda.BitBtn6Click(Sender: TObject);
begin
  FrmRel_Consulta_Venda_Agrupado_Cliente := TFrmRel_Consulta_Venda_Agrupado_Cliente.create(self);
  FrmRel_Consulta_Venda_Agrupado_Cliente.Release;
  FrmRel_Consulta_Venda_Agrupado_Cliente := Nil;
end;

procedure TFrmConsulta_Venda.DBGrid1CellClick(Column: TColumn);
begin
  Consulta.Consulta_Itens_Venda;
end;

procedure TFrmConsulta_Venda.DBGrid1DrawColumnCell(Sender: TObject;
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

  TDBGrid(Sender).DefaultDrawDataCell(Rect,
    TDBGrid(Sender).columns[DataCol].field, State)
end;

procedure TFrmConsulta_Venda.DBGrid1TitleClick(Column: TColumn);
begin
  Utili.Ordena_Grid(qryconsulta_venda_tributo, Column);
end;

procedure TFrmConsulta_Venda.DBGrid2DrawColumnCell(Sender: TObject;
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

  TDBGrid(Sender).DefaultDrawDataCell(Rect,
    TDBGrid(Sender).columns[DataCol].field, State)
end;

procedure TFrmConsulta_Venda.DBGrid3CellClick(Column: TColumn);
begin
  Consulta.Consulta_Itens_Venda;
end;

procedure TFrmConsulta_Venda.DBGrid3DrawColumnCell(Sender: TObject;
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

  TDBGrid(Sender).DefaultDrawDataCell(Rect,
    TDBGrid(Sender).columns[DataCol].field, State)
end;

procedure TFrmConsulta_Venda.DBGrid4DrawColumnCell(Sender: TObject;
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

  TDBGrid(Sender).DefaultDrawDataCell(Rect,
    TDBGrid(Sender).columns[DataCol].field, State)
end;

procedure TFrmConsulta_Venda.DBGrid5DrawColumnCell(Sender: TObject;
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

  TDBGrid(Sender).DefaultDrawDataCell(Rect,
    TDBGrid(Sender).columns[DataCol].field, State)
end;

procedure TFrmConsulta_Venda.EdtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    if (RGConsulta_Por.ItemIndex = 3) then
    begin
      Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
      FrmChama_Cliente.ShowModal;
      FrmChama_Cliente.Free;
    end
    else if (RGConsulta_Por.ItemIndex = 4) then
    begin
      Application.CreateForm(TFrmChama_Funcionario, FrmChama_Funcionario);
      FrmChama_Funcionario.ShowModal;
      FrmChama_Funcionario.Free;
    end
    else if (RGConsulta_Por.ItemIndex = 5) then
    begin
      Application.CreateForm(TFrmChama_Tabela_Preco, FrmChama_Tabela_Preco);
      FrmChama_Tabela_Preco.ShowModal;
      FrmChama_Tabela_Preco.Free;
    end;
  end;
end;

procedure TFrmConsulta_Venda.EdtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  Utili.Somente_Apaga(Key);
end;

procedure TFrmConsulta_Venda.FechaQuery;
begin
  //qryconsulta_venda.close;
  qryitens_venda.close;
  qrylucratividade_geral.close;
  qrylucratividade_vendedor.close;
  qrylucratividade_cliente.close;
  qrylucratividade_grupo.close;
  qrydados_agrupados_grupo.Close;
  qrydados_agrupados_cliente.Close;
end;

procedure TFrmConsulta_Venda.FormActivate(Sender: TObject);
begin
  ativo := true;
end;

procedure TFrmConsulta_Venda.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Venda.Free;
  FrmConsulta_Venda := NIl;
end;

procedure TFrmConsulta_Venda.FormCreate(Sender: TObject);
begin
  PageControl1.TabIndex := 0;
  FechaQuery;
  BBtnFiltrar.Enabled := true;
  BBtnLimpar.Enabled := false;
  BBtnImprimir.Enabled := false;
  GBLucratividade.Enabled := false;
  Utili.Inicia_Data(MEdtData_Inicial, MEdtData_Final);
end;

procedure TFrmConsulta_Venda.FormDeactivate(Sender: TObject);
begin
  ativo := false;
end;

procedure TFrmConsulta_Venda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_escape) then
    close;
end;

procedure TFrmConsulta_Venda.qryconsulta_sintetico_1Data_Emissao_NFeGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '30/12/1899') then
    Text:= ''
  else
    Text:= Sender.AsString;
end;

procedure TFrmConsulta_Venda.RGConsulta_PorClick(Sender: TObject);
begin
  if (RGConsulta_Por.ItemIndex = 3) then
    LblEscolha.Caption := 'Cliente'
  else if (RGConsulta_Por.ItemIndex = 4) then
    LblEscolha.Caption := 'Funcionário'
  else if (RGConsulta_Por.ItemIndex = 5) then
    LblEscolha.Caption := 'Tabela'
  else
    LblEscolha.Caption := 'Parametro';

end;

procedure TFrmConsulta_Venda.RGTipo_RelatorioClick(Sender: TObject);
begin
  if (RGTipo_Relatorio.ItemIndex = 0) then
  begin
    RGConsulta_Por.Enabled := true;
    RGOrdena_Por.Enabled := true;
    RGStatus.Enabled := true;
    GBLucratividade.Enabled := false;
    RGOpcao_Impressao.Enabled := false;
    CBGeral.Enabled:= true;
    CBVendedor.Enabled:= true;
    TRadioGroup(RGConsulta_Por.Controls[0]).Enabled:= true;
    TRadioGroup(RGConsulta_Por.Controls[1]).Enabled:= true;
    TRadioGroup(RGConsulta_Por.Controls[2]).Enabled:= true;
    TRadioGroup(RGConsulta_Por.Controls[3]).Enabled:= true;
    TRadioGroup(RGConsulta_Por.Controls[4]).Enabled:= true;
    TRadioGroup(RGConsulta_Por.Controls[5]).Enabled:= true;
  end
  else if (RGTipo_Relatorio.ItemIndex = 1) then
  begin
    RGConsulta_Por.Enabled := true;
    RGOrdena_Por.Enabled := false;
    RGStatus.Enabled := true;
    GBLucratividade.Enabled := false;
    RGOpcao_Impressao.Enabled := true;
    CBGeral.Enabled:= true;
    CBVendedor.Enabled:= true;
    TRadioGroup(RGConsulta_Por.Controls[0]).Enabled:= true;
    TRadioGroup(RGConsulta_Por.Controls[1]).Enabled:= false;
    TRadioGroup(RGConsulta_Por.Controls[2]).Enabled:= false;
    TRadioGroup(RGConsulta_Por.Controls[3]).Enabled:= true;
    TRadioGroup(RGConsulta_Por.Controls[4]).Enabled:= true;
    TRadioGroup(RGConsulta_Por.Controls[5]).Enabled:= false;
  end
  else if (RGTipo_Relatorio.ItemIndex = 2) then
  begin
    RGConsulta_Por.Enabled := false;
    RGOrdena_Por.Enabled := false;
    RGStatus.Enabled := false;
    GBLucratividade.Enabled := true;
    RGOpcao_Impressao.Enabled := false;
    CBGeral.Enabled:= true;
    CBVendedor.Enabled:= true;
  end
  else if (RGTipo_Relatorio.ItemIndex = 3) then
  begin
    RGConsulta_Por.Enabled := false;
    RGOrdena_Por.Enabled := false;
    RGStatus.Enabled := false;
    GBLucratividade.Enabled := false;
    RGOpcao_Impressao.Enabled := false;
    CBGeral.Enabled:= true;
    CBVendedor.Enabled:= true;
  end
  else if (RGTipo_Relatorio.ItemIndex = 4) then
  begin
    RGConsulta_Por.Enabled := false;
    RGOrdena_Por.Enabled := false;
    RGStatus.Enabled := true;
    GBLucratividade.Enabled := true;
    RGOpcao_Impressao.Enabled := false;
    CBGeral.Checked:= false;
    CBVendedor.Checked:= False;

    CBGeral.Enabled:= false;
    CBVendedor.Enabled:= false;
    CBCliente.Checked:= true;
  end;
end;

end.
