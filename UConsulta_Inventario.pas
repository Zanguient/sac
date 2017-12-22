unit UConsulta_Inventario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, Mask, cxGraphics, cxControls,
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
  dxPSCore, dxPScxCommon, cxPropertiesStore;

type
  TFrmConsulta_Inventario = class(TForm)
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_inventario: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    qryconsulta_inventarioCodigo_Venda: TStringField;
    qryconsulta_inventarioDescricao: TStringField;
    qryconsulta_inventarioValor_Compra: TFloatField;
    qryconsulta_inventarioEstoque: TFloatField;
    qryconsulta_inventarioSaldo: TFloatField;
    qryconsulta_inventarioUnidade: TStringField;
    cxgrd1: TcxGrid;
    cxgrdbtblvwGrid1DBTableView1: TcxGridDBTableView;
    cxgrd1TableView1: TcxGridTableView;
    cxgrd1TableView1Column1: TcxGridColumn;
    cxgrdlvlcxgrd1Level1: TcxGridLevel;
    cxgrdbtblvwGrid1DBTableView1Codigo_Venda: TcxGridDBColumn;
    cxgrdbtblvwGrid1DBTableView1Descricao: TcxGridDBColumn;
    cxgrdbtblvwGrid1DBTableView1Valor_Compra: TcxGridDBColumn;
    cxgrdbtblvwGrid1DBTableView1Estoque: TcxGridDBColumn;
    cxgrdbtblvwGrid1DBTableView1Saldo: TcxGridDBColumn;
    cxgrdbtblvwGrid1DBTableView1Unidade: TcxGridDBColumn;
    cxPropertiesStore1: TcxPropertiesStore;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    btnExpExcel: TToolButton;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btnExpExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Inventario: TFrmConsulta_Inventario;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Usuario, URel_Consulta_Inventario,
  URel_Consulta_Inventario_Grupo, cxGridExportLink, Util.Mensagens, Util.TLog;

{$R *.dfm}

procedure TFrmConsulta_Inventario.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Inventario.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Inventario_Estoque;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
  btnExpExcel.Enabled := True;
end;

procedure TFrmConsulta_Inventario.BBtnImprimirClick(Sender: TObject);
begin
  dxComponentPrinter1.Preview(True, nil);
  {if (RGTipo_Impressao.ItemIndex = 0) then
  begin
    FrmRel_Consulta_Inventario:= TFrmRel_Consulta_Inventario.create(self);
    FrmRel_Consulta_Inventario.Release;
    FrmRel_Consulta_Inventario:= Nil;
  end
  else if (RGTipo_Impressao.ItemIndex = 1) then
  begin
    FrmRel_Consulta_Inventario_Grupo:= TFrmRel_Consulta_Inventario_Grupo.create(self);
    FrmRel_Consulta_Inventario_Grupo.Release;
    FrmRel_Consulta_Inventario_Grupo:= Nil;
  end;}
end;

procedure TFrmConsulta_Inventario.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_inventario.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  btnExpExcel.Enabled := False;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Inventario.btnExpExcelClick(Sender: TObject);
var
  NomeArquivo, DataAtual: AnsiString;
begin
  try
    DataAtual:= FormatDateTime('YYYYMMDDHHMM', now);
    NomeArquivo:= ExtractFilePath(Application.ExeName)+ 'Relatórios\XLS\ReposicaoEstoque'+DataAtual+'.xls';
    ExportGridToExcel(NomeArquivo, cxGrd1, false);
    TMensagens.MensagemInformacao('Relatório exportado para: '+NomeArquivo);
  except on E:Exception do
    begin
      TMensagens.MensagemErro('Erro ao exportar relatório: '+e.Message);
      TLog.Error('Erro ao exportar relatório: '+e.Message);
    end;
  end;
end;

procedure TFrmConsulta_Inventario.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Inventario.DBGrid1TitleClick(Column: TColumn);
begin
//  Util.Ordena_Grid(qryconsulta_inventario, Column);
end;

procedure TFrmConsulta_Inventario.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Inventario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Inventario.Free;
  FrmConsulta_Inventario:= NIl;
end;

procedure TFrmConsulta_Inventario.FormCreate(Sender: TObject);
begin
  qryconsulta_inventario.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  btnExpExcel.Enabled:=False;
end;

procedure TFrmConsulta_Inventario.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Inventario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
