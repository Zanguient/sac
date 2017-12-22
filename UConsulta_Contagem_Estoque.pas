unit UConsulta_Contagem_Estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, Mask, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridCustomView, cxGridDBTableView, cxGrid,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxSkinsdxBarPainter,
  dxPSCore, dxPScxCommon, cxPropertiesStore, dxSkinBlack, dxSkinBlue,
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
  TFrmConsulta_Contagem_Estoque = class(TForm)
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    qryconsultaCodigo_Venda: TStringField;
    qryconsultaDescricao: TStringField;
    qryconsultaEstoque: TFloatField;
    qryconsultaMarca: TStringField;
    qryconsultaNome_Fantasia: TStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    qrybalanco: TADOQuery;
    DataSource1: TDataSource;
    qrybalancoCodigo_Venda: TStringField;
    qrybalancoDescricao: TStringField;
    qrybalancoEstoque: TFloatField;
    qrybalancoValor_Compra: TFloatField;
    qrybalancoTotal: TFloatField;
    qrybalancoUnidade: TStringField;
    cxgrd1: TcxGrid;
    cxgrdbtblvwGrid1DBTableView1: TcxGridDBTableView;
    cxgrd1TableView1: TcxGridTableView;
    cxgrd1TableView1Column1: TcxGridColumn;
    cxgrdlvlcxgrd1Level1: TcxGridLevel;
    cxgrdbclmnGrid1DBTableView1Codigo_Venda: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1Descricao: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1Estoque: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1Marca: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1Nome_Fantasia: TcxGridDBColumn;
    strngfldLocal: TStringField;
    cxgrdbclmnGrid1DBTableView1Local: TcxGridDBColumn;
    cxPropertiesStore1: TcxPropertiesStore;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    strngfldGrupo: TStringField;
    cxgrdbclmnGrid1DBTableView1Grupo: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1Column1: TcxGridDBColumn;
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
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtConsultaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Contagem_Estoque: TFrmConsulta_Contagem_Estoque;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UEscolha_Impressao, UChama_Plano_Financeiro, URel_Consulta_Conta_Fixa,
  UChama_Fornecedor, UChama_Marca, URel_Contagem_Estoque,
  URel_Contagem_Estoque_Fornecedor, URel_Contagem_Estoque_Marca,
  URel_Contagem_Estoque_Grupo, URel_Balanco_Estoque, URel_Balanco_Estoque_Grupo;

{$R *.dfm}

procedure TFrmConsulta_Contagem_Estoque.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Contagem_Estoque.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  //if (RadioGroup1.ItemIndex = 0) then
  //begin
    PageControl1.TabIndex:= 0;
    Consulta.Consulta_Contagem_Estoque;
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir.Enabled:= true;
  {end
  else if (RadioGroup1.ItemIndex = 1) and ( (RGConsulta_Por.ItemIndex = 0) or (RGConsulta_Por.ItemIndex = 3)) then
  begin
    PageControl1.TabIndex:= 1;
    Consulta.Consulta_Balanco_Estoque;
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir.Enabled:= true;
  end; }

end;

procedure TFrmConsulta_Contagem_Estoque.BBtnImprimirClick(Sender: TObject);
begin
  dxComponentPrinter1.Preview(True, nil);
  {if (RadioGroup1.ItemIndex = 0) then
  begin
    dxComponentPrinter1.Preview(True, nil);
  end
  else if (RadioGroup1.ItemIndex = 1) and (RGConsulta_Por.ItemIndex = 0) then
  begin
    FrmRel_Balanco_Estoque:= TFrmRel_Balanco_Estoque.create(self);
    FrmRel_Balanco_Estoque.Release;
    FrmRel_Balanco_Estoque:= Nil;
  end
  else if (RadioGroup1.ItemIndex = 1) and (RGConsulta_Por.ItemIndex = 3) then
  begin
    FrmRel_Balanco_Estoque_Grupo:= TFrmRel_Balanco_Estoque_Grupo.create(self);
    FrmRel_Balanco_Estoque_Grupo.Release;
    FrmRel_Balanco_Estoque_Grupo:= Nil;
  end;
  {Application.CreateForm(TFrmEscolha_Impressao, FrmEscolha_Impressao);
  FrmEscolha_Impressao.Show;
  ativo:= true;}
end;

procedure TFrmConsulta_Contagem_Estoque.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta.close;
  PageControl1.TabIndex:= 0;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Contagem_Estoque.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Contagem_Estoque.EdtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      {if (RGConsulta_Por.ItemIndex = 1) then
      begin
        Application.CreateForm(TFrmChama_Fornecedor, FrmChama_Fornecedor);
        FrmChama_Fornecedor.ShowModal;
        FrmChama_Fornecedor.Free;
      end
      else if (RGConsulta_Por.ItemIndex = 2) then
      begin
        Application.CreateForm(TFrmChama_Marca, FrmChama_Marca);
        FrmChama_Marca.ShowModal;
        FrmChama_Marca.Free;
      end;  }
    end;
end;

procedure TFrmConsulta_Contagem_Estoque.EdtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Contagem_Estoque.EdtConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Contagem_Estoque.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Contagem_Estoque.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Contagem_Estoque.Free;
  FrmConsulta_Contagem_Estoque:= NIl;
end;

procedure TFrmConsulta_Contagem_Estoque.FormCreate(Sender: TObject);
begin
  qryconsulta.close;
  PageControl1.TabIndex:= 0;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  //EdtConsulta.Clear;
end;

procedure TFrmConsulta_Contagem_Estoque.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Contagem_Estoque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
