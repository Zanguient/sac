unit UConsulta_OS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, Mask, DBCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxSkinsdxBarPainter,
  cxPropertiesStore, dxPSCore, dxPScxCommon;

type
  TFrmConsulta_OS = class(TForm)
    RGConsulta_Por: TRadioGroup;
    EdtCliente: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    LblCli: TLabel;
    EdtCodigo_Cliente: TEdit;
    Label1: TLabel;
    MEdtData_Inicial: TMaskEdit;
    Label3: TLabel;
    MEdtData_Final: TMaskEdit;
    qryconsulta_os: TADOQuery;
    dsConsulta_OS: TDataSource;
    qryitens_os: TADOQuery;
    dsItens_OS: TDataSource;
    Label4: TLabel;
    EdtDAV_OS: TEdit;
    RGTipo: TRadioGroup;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    DBGrid3: TDBGrid;
    Label24: TLabel;
    CmbStatus: TDBLookupComboBox;
    DBGrid4: TDBGrid;
    Panel4: TPanel;
    qryservicos_os: TADOQuery;
    dsServicos_OS: TDataSource;
    qryconsulta_osCodigo: TIntegerField;
    qryconsulta_osN_Pedido: TStringField;
    qryconsulta_osData_Venda: TDateTimeField;
    qryconsulta_osData_Vencimento: TDateTimeField;
    qryconsulta_osQtde_Itens: TIntegerField;
    qryconsulta_osQtde_Servicos: TIntegerField;
    qryconsulta_osTotal_Produtos: TFloatField;
    qryconsulta_osTotal_Servicos: TFloatField;
    qryconsulta_osTotal_Pedido: TFloatField;
    qryconsulta_osData_Previsao_Entrega: TDateTimeField;
    qryconsulta_osData_Entrega: TDateTimeField;
    qryconsulta_osKilometragem: TFloatField;
    qryconsulta_osCond_Pag: TStringField;
    qryconsulta_osCliente: TStringField;
    qryconsulta_osVeiculo: TStringField;
    qryconsulta_osFuncionario: TStringField;
    qryitens_osCodigo: TIntegerField;
    qryitens_osCodigo_Venda: TStringField;
    qryitens_osDescricao: TStringField;
    qryitens_osNCM: TStringField;
    qryitens_osQtde: TFloatField;
    qryitens_osValor_Unitario: TFloatField;
    qryitens_osSub_Total: TFloatField;
    qryservicos_osCodigo: TIntegerField;
    qryservicos_osCodigo_Servico: TIntegerField;
    qryservicos_osValor_Unitario: TFloatField;
    qryservicos_osDesconto: TFloatField;
    qryservicos_osTipo_Desconto: TStringField;
    qryservicos_osSub_Total: TFloatField;
    qryservicos_osDescricao_Servico: TStringField;
    qryservicos_osISS: TStringField;
    qryservicos_osQtde: TIntegerField;
    qryservicos_osCodigo_Registro: TAutoIncField;
    RGData: TRadioGroup;
    qrysintetico_os: TADOQuery;
    DataSource1: TDataSource;
    qrysintetico_osCodigo: TIntegerField;
    qrysintetico_osN_Pedido: TStringField;
    qrysintetico_osData_Venda: TDateTimeField;
    qrysintetico_osTotal_Pedido: TFloatField;
    qrysintetico_osCliente: TStringField;
    qrysintetico_osVeiculo: TStringField;
    qrysintetico_osFuncionario: TStringField;
    qrysintetico_osTotal_Produtos: TFloatField;
    qrysintetico_osTotal_Servicos: TFloatField;
    qryservicos_osCodigo_Mecanico: TIntegerField;
    qryservicos_osComissao: TFloatField;
    qryservicos_osNome: TStringField;
    TabSheet3: TTabSheet;
    Panel5: TPanel;
    DBGrid5: TDBGrid;
    qrycomissao_os: TADOQuery;
    DataSource2: TDataSource;
    qrycomissao_osDescricao_Servico: TStringField;
    qrycomissao_osQtde: TIntegerField;
    qrycomissao_osValor_Unitario: TFloatField;
    qrycomissao_osDesconto: TFloatField;
    qrycomissao_osSub_Total: TFloatField;
    qrycomissao_osComissao: TFloatField;
    qrycomissao_osN_Pedido: TStringField;
    qrycomissao_osFuncionario: TStringField;
    qrycomissao_osNome_Nome_Fantasia: TStringField;
    TabSheet4: TTabSheet;
    Panel6: TPanel;
    DBGrid6: TDBGrid;
    qryagrupado_grupo: TADOQuery;
    DataSource3: TDataSource;
    qryagrupado_grupoCodGrupo: TAutoIncField;
    qryagrupado_grupoGrupo: TStringField;
    qryagrupado_grupoDescricao_Servico: TStringField;
    qryagrupado_grupoQtde: TIntegerField;
    qryagrupado_grupoValor_Unitario: TFloatField;
    qryagrupado_grupoSub_Total: TFloatField;
    qryagrupado_grupoDesconto: TFloatField;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1Column1: TcxGridColumn;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2Codigo: TcxGridDBColumn;
    cxGrid1DBTableView2Codigo_Produto: TcxGridDBColumn;
    cxGrid1DBTableView2Codigo_Venda: TcxGridDBColumn;
    cxGrid1DBTableView2Descricao: TcxGridDBColumn;
    cxGrid1DBTableView2UN: TcxGridDBColumn;
    cxGrid1DBTableView2Qtde: TcxGridDBColumn;
    cxGrid1DBTableView2Valor_Original: TcxGridDBColumn;
    cxGrid1DBTableView2Desc_Acr: TcxGridDBColumn;
    cxGrid1DBTableView2Valor_Unitario: TcxGridDBColumn;
    cxGrid1DBTableView2Valor_Compra: TcxGridDBColumn;
    cxGrid1DBTableView2Sub_Total: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1Grupo: TcxGridDBColumn;
    cxGrid1DBTableView1Descricao_Servico: TcxGridDBColumn;
    cxGrid1DBTableView1Qtde: TcxGridDBColumn;
    cxGrid1DBTableView1Valor_Unitario: TcxGridDBColumn;
    cxGrid1DBTableView1Sub_Total: TcxGridDBColumn;
    cxGrid1DBTableView1Desconto: TcxGridDBColumn;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    cxPropertiesStore2: TcxPropertiesStore;
    qryagrupado_grupoData_Venda: TDateTimeField;
    cxGrid1DBTableView1Data_Venda: TcxGridDBColumn;
    BBtnExportar: TToolButton;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure EdtCodigo_ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_ClienteKeyPress(Sender: TObject; var Key: Char);
    procedure RGConsulta_PorClick(Sender: TObject);
    procedure RGTipoClick(Sender: TObject);
    procedure BBtnExportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_OS: TFrmConsulta_OS;
  Utili: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Cliente, URel_Consulta_OS, URel_Consulta_OS_Sintetico,
  UChama_Usuario, URel_Consulta_OS_Comissao, UChama_Funcionario,
  URel_Consulta_OS_Agrupado, cxGridExportLink, Util.Mensagens, Util.TLog;

{$R *.dfm}

procedure TFrmConsulta_OS.BBtnExportarClick(Sender: TObject);
var
  NomeArquivo, DataAtual: AnsiString;
begin
  try
    DataAtual:= FormatDateTime('YYYYMMDDHHMM', now);
    NomeArquivo:= ExtractFilePath(Application.ExeName)+ 'Relatórios\XLS\OSAgrupadoGrupo'+DataAtual+'.xls';
    ExportGridToExcel(NomeArquivo, cxGrid1, false);
    TMensagens.MensagemInformacao('Relatório exportado para: '+NomeArquivo);
  except on E:Exception do
  begin
    TMensagens.MensagemErro('Erro ao exportar relatório: '+e.Message);
    TLog.Error('Erro ao exportar relatório: '+e.Message);
  end;
  end;
end;

procedure TFrmConsulta_OS.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_OS.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  if (RGTipo.ItemIndex = 0) then
  begin
    PageControl1.TabIndex:= 0;
    Consulta.Consulta_OS;
    qryitens_os.Close;
    qryitens_os.Parameters.ParamByName('Codigo').Value:= qryconsulta_osCodigo.AsInteger;
    qryitens_os.Open;
    qryservicos_os.Close;
    qryservicos_os.Parameters.ParamByName('Codigo').Value:= qryconsulta_osCodigo.AsInteger;
    qryservicos_os.Open;
  end
  else if (RGTipo.ItemIndex = 1) then
  begin
    PageControl1.TabIndex:= 1;
    Consulta.Consulta_OS;
  end
  else if (RGTipo.ItemIndex = 2) then
  begin
    PageControl1.TabIndex:= 2;
    Consulta.Consulta_OS;
  end
  else if (RGTipo.ItemIndex = 3) then
  begin
    PageControl1.TabIndex:= 3;
    Consulta.Consulta_OS_Agrupado_Grupo;
    BBtnExportar.Enabled:= true;
  end;

  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_OS.BBtnImprimirClick(Sender: TObject);
begin
  if (RGTipo.ItemIndex = 0) then
  begin
    FrmRel_Consulta_OS:= TFrmRel_Consulta_OS.create(self);
    FrmRel_Consulta_OS.Release;
    FrmRel_Consulta_OS:= Nil;
  end
  else if (RGTipo.ItemIndex = 1) then
  begin
    FrmRel_Consulta_OS_Sintetico:= TFrmRel_Consulta_OS_Sintetico.create(self);
    FrmRel_Consulta_OS_Sintetico.Release;
    FrmRel_Consulta_OS_Sintetico:= Nil;
  end
  else if (RGTipo.ItemIndex = 2) then
  begin
    FrmRel_Consulta_OS_Comissao:= TFrmRel_Consulta_OS_Comissao.create(self);
    FrmRel_Consulta_OS_Comissao.Release;
    FrmRel_Consulta_OS_Comissao:= Nil;
  end
  else if (RGTipo.ItemIndex = 3) then
  begin
    dxComponentPrinter1.Preview(True, nil);
    {FrmRel_Consulta_OS_Agrupado:= TFrmRel_Consulta_OS_Agrupado.create(self);
    FrmRel_Consulta_OS_Agrupado.Release;
    FrmRel_Consulta_OS_Agrupado:= Nil;}
  end;
end;

procedure TFrmConsulta_OS.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_os.close;
  qryitens_os.Close;
  qrysintetico_os.Close;
  qrycomissao_os.Close;
  PageControl1.TabIndex:= 0;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  BBtnExportar.Enabled:= false;
end;

procedure TFrmConsulta_OS.DBGrid1CellClick(Column: TColumn);
begin
  //Consulta.Consulta_Itens_OS;
end;

procedure TFrmConsulta_OS.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_OS.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_OS.EdtCodigo_ClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      if (RGConsulta_Por.ItemIndex = 2) then
      begin
        Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
        FrmChama_Cliente.ShowModal;
        FrmChama_Cliente.Free;
      end
      else if (RGConsulta_Por.ItemIndex = 3) then
      begin
        Application.CreateForm(TFrmChama_Funcionario, FrmChama_Funcionario);
        FrmChama_Funcionario.ShowModal;
        FrmChama_Funcionario.Free;
      end;
    end;
end;

procedure TFrmConsulta_OS.EdtCodigo_ClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Utili.Somente_Apaga(key);
end;

procedure TFrmConsulta_OS.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_OS.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_OS.Free;
  FrmConsulta_OS:= NIl;
end;

procedure TFrmConsulta_OS.FormCreate(Sender: TObject);
begin
  qryconsulta_os.close;
  qryitens_os.Close;
  Consulta.Chama_Status_OS(dm.ADOConnection1);
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  PageControl1.TabIndex:= 0;
  Utili.Inicia_Data(MEdtData_Inicial, MEdtData_Final);
end;

procedure TFrmConsulta_OS.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_OS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmConsulta_OS.RGConsulta_PorClick(Sender: TObject);
begin
  if (RGConsulta_Por.ItemIndex = 3) then
    LblCli.Caption:= 'Atendente'
  else
    LblCli.Caption:= 'Cliente';
end;

procedure TFrmConsulta_OS.RGTipoClick(Sender: TObject);
begin
  if (RGTipo.ItemIndex = 2) then
  begin
    RGOrdena_Por.ItemIndex:= 3;
    TRadioGroup(RGOrdena_Por.Controls[0]).Enabled:= false;
    TRadioGroup(RGOrdena_Por.Controls[1]).Enabled:= false;
    TRadioGroup(RGOrdena_Por.Controls[2]).Enabled:= false;
    TRadioGroup(RGOrdena_Por.Controls[3]).Enabled:= true;
    TRadioGroup(RGOrdena_Por.Controls[3]).Caption:= 'Funcionário';
    TRadioGroup(RGConsulta_Por.Controls[3]).Caption:= 'Funcionário';
  end
  else
  begin
    RGOrdena_Por.ItemIndex:= 0;
    TRadioGroup(RGOrdena_Por.Controls[0]).Enabled:= true;
    TRadioGroup(RGOrdena_Por.Controls[1]).Enabled:= true;
    TRadioGroup(RGOrdena_Por.Controls[2]).Enabled:= true;
    TRadioGroup(RGOrdena_Por.Controls[3]).Enabled:= true;
    TRadioGroup(RGOrdena_Por.Controls[3]).Caption:= 'Cliente';
    TRadioGroup(RGConsulta_Por.Controls[3]).Caption:= 'Atendente';
  end;
end;

end.
