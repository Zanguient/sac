unit UConsulta_Lucratividade_Marca;

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
  cxPropertiesStore, dxPSCore, dxPScxCommon;

type
  TFrmConsulta_Lucratividade_Marca = class(TForm)
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_lucro: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    Label7: TLabel;
    Label8: TLabel;
    MEdtData_Final: TMaskEdit;
    MEdtData_Inicial: TMaskEdit;
    qryconsulta_lucroCodigo_Marca: TIntegerField;
    qryconsulta_lucroDescricao_Marca: TStringField;
    qryconsulta_lucroTotal_Vendido: TFloatField;
    qryconsulta_lucroCusto_total: TFloatField;
    qryconsulta_lucrolucratividade: TFloatField;
    qryconsulta_lucropercentual: TFloatField;
    qryconsulta_lucrolucratividade_unitaria: TFloatField;
    qryconsulta_lucroQtde: TFloatField;
    RGTipo: TRadioGroup;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    cxPropertiesStore1: TcxPropertiesStore;
    cxGrid1DBTableView1Descricao_Marca: TcxGridDBColumn;
    cxGrid1DBTableView1Total_Vendido: TcxGridDBColumn;
    cxGrid1DBTableView1Custo_total: TcxGridDBColumn;
    cxGrid1DBTableView1lucratividade: TcxGridDBColumn;
    cxGrid1DBTableView1percentual: TcxGridDBColumn;
    cxGrid1DBTableView1lucratividade_unitaria: TcxGridDBColumn;
    cxGrid1DBTableView1Qtde: TcxGridDBColumn;
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
    procedure EdtCodigo_UsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Tabela_PrecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Tabela_PrecoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTabela_PrecoKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtData_FinalExit(Sender: TObject);
    procedure MEdtData_InicialExit(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Lucratividade_Marca: TFrmConsulta_Lucratividade_Marca;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Tabela_Preco, URel_Consulta_Custo_Venda,
  URel_Consulta_Lucratividade_Marca;

{$R *.dfm}

procedure TFrmConsulta_Lucratividade_Marca.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Lucratividade_Marca.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Lucratividade_Marca;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Lucratividade_Marca.BBtnImprimirClick(Sender: TObject);
begin
  {FrmRel_Consulta_Lucratividade_Marca:= TFrmRel_Consulta_Lucratividade_Marca.create(self);
  FrmRel_Consulta_Lucratividade_Marca.Release;
  FrmRel_Consulta_Lucratividade_Marca:= Nil;}
  dxComponentPrinter1.Preview(True, nil);
end;

procedure TFrmConsulta_Lucratividade_Marca.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_lucro.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Lucratividade_Marca.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Lucratividade_Marca.DBGrid1TitleClick(Column: TColumn);
begin
  if (qryconsulta_lucro.Sort <> column.FieldName+ ' ASC') then
    qryconsulta_lucro.Sort:=column.FieldName+ ' ASC'
  else
    qryconsulta_lucro.Sort:=column.fieldname+ ' DESC';
end;

procedure TFrmConsulta_Lucratividade_Marca.EdtCodigo_Tabela_PrecoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Tabela_Preco, FrmChama_Tabela_Preco);
    FrmChama_Tabela_Preco.ShowModal;
    FrmChama_Tabela_Preco.Free;
  end;
end;

procedure TFrmConsulta_Lucratividade_Marca.EdtCodigo_Tabela_PrecoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Lucratividade_Marca.EdtCodigo_UsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Lucratividade_Marca.EdtTabela_PrecoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Lucratividade_Marca.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Lucratividade_Marca.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Lucratividade_Marca.Free;
  FrmConsulta_Lucratividade_Marca:= NIl;
end;

procedure TFrmConsulta_Lucratividade_Marca.FormCreate(Sender: TObject);
begin
  qryconsulta_lucro.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  Util.Inicia_Data(MEdtData_Final, MEdtData_Inicial);
  //MEdtData_Inicial.Text:= DateToStr(date);
  //MEdtData_Final.Text:= DateToStr(date);
end;

procedure TFrmConsulta_Lucratividade_Marca.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Lucratividade_Marca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmConsulta_Lucratividade_Marca.MEdtData_FinalExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Final);
end;

procedure TFrmConsulta_Lucratividade_Marca.MEdtData_InicialExit(
  Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Inicial);
end;

end.
