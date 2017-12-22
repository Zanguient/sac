unit UConsulta_Reposicao_Estoque;

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
  TFrmConsulta_Reposicao_Estoque = class(TForm)
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_reposicao: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    RGConsulta_Por: TRadioGroup;
    Label2: TLabel;
    EdtDescricao: TEdit;
    EdtCodigo: TEdit;
    qrycompra: TADOQuery;
    DataSource1: TDataSource;
    qrycompraQtde: TFloatField;
    qrycompraQtde_Recebida: TFloatField;
    qrycompraQtde_Restante: TFloatField;
    qrycompraData_Previsao_Entrega: TDateTimeField;
    qrycompraCodigo_Original: TStringField;
    qrycompraDescricao: TStringField;
    RGEstoque_Minimo: TRadioGroup;
    qryconsulta_reposicaoCodigo: TAutoIncField;
    qryconsulta_reposicaoDescricao: TStringField;
    qryconsulta_reposicaoSigla: TStringField;
    qryconsulta_reposicaoEstoque: TFloatField;
    qryconsulta_reposicaoEstoque_Minimo: TFloatField;
    qryconsulta_reposicaoEm_Estoque_Minimo: TStringField;
    qryconsulta_reposicaoValor_Ultima_Compra: TFloatField;
    qryconsulta_reposicaoUltima_Compra: TDateTimeField;
    qryconsulta_reposicaoValor_Compra_Unitario: TFloatField;
    qryconsulta_reposicaoGrupo: TStringField;
    qryconsulta_reposicaoMarca: TStringField;
    qryconsulta_reposicaoValor_Compra: TFloatField;
    qryconsulta_reposicaoCodigo_Original: TStringField;
    qryconsulta_reposicaoCodigo_Similar: TStringField;
    cxPropertiesStore1: TcxPropertiesStore;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1Column1: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1Codigo: TcxGridDBColumn;
    cxGrid1DBTableView1Descricao: TcxGridDBColumn;
    cxGrid1DBTableView1Sigla: TcxGridDBColumn;
    cxGrid1DBTableView1Estoque: TcxGridDBColumn;
    cxGrid1DBTableView1Estoque_Minimo: TcxGridDBColumn;
    cxGrid1DBTableView1Em_Estoque_Minimo: TcxGridDBColumn;
    cxGrid1DBTableView1Valor_Ultima_Compra: TcxGridDBColumn;
    cxGrid1DBTableView1Ultima_Compra: TcxGridDBColumn;
    cxGrid1DBTableView1Valor_Compra_Unitario: TcxGridDBColumn;
    cxGrid1DBTableView1Grupo: TcxGridDBColumn;
    cxGrid1DBTableView1Marca: TcxGridDBColumn;
    cxGrid1DBTableView1Valor_Compra: TcxGridDBColumn;
    cxGrid1DBTableView1Codigo_Original: TcxGridDBColumn;
    cxGrid1DBTableView1Codigo_Similar: TcxGridDBColumn;
    BBtnExportar: TToolButton;
    qryconsulta_reposicaoLocal: TStringField;
    cxGrid1DBTableView1Local: TcxGridDBColumn;
    qryconsulta_reposicaoPreco_Vista: TFloatField;
    qryconsulta_reposicaoPreco_Prazo: TFloatField;
    cxGrid1DBTableView1Preco_Vista: TcxGridDBColumn;
    cxGrid1DBTableView1Preco_Prazo: TcxGridDBColumn;
    qryconsulta_reposicaoCodigo_Venda: TStringField;
    cxGrid1DBTableView1Codigo_Venda: TcxGridDBColumn;
    qryconsulta_reposicaoData_Validade: TDateTimeField;
    cxGrid1DBTableView1Data_Validade: TcxGridDBColumn;
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
    procedure EdtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qryconsulta_reposicaoUltima_CompraGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure EdtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RGConsulta_PorClick(Sender: TObject);
    procedure RGOrdena_PorClick(Sender: TObject);
    procedure RGEstoque_MinimoClick(Sender: TObject);
    procedure BBtnExportarClick(Sender: TObject);
    procedure qryconsulta_reposicaoData_ValidadeGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Reposicao_Estoque: TFrmConsulta_Reposicao_Estoque;
  Utili: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, URel_Consulta_Reposicao_Estoque, UChama_Produto, UChama_Grupo_Produto,
  UChama_Fornecedor, UChama_Marca, UDeclaracao,
  URel_Consulta_Reposicao_Estoque_Marca,
  URel_Consulta_Reposicao_Estoque_Produto, Util.Mensagens, Util.TLog,
  cxGridExportLink;

{$R *.dfm}

procedure TFrmConsulta_Reposicao_Estoque.BBtnExportarClick(Sender: TObject);
var
  NomeArquivo, DataAtual: AnsiString;
begin
  try
    DataAtual:= FormatDateTime('YYYYMMDDHHMM', now);
    NomeArquivo:= ExtractFilePath(Application.ExeName)+ 'Relatórios\XLS\ReposicaoEstoque'+DataAtual+'.xls';
    ExportGridToExcel(NomeArquivo, cxGrid1, false);
    TMensagens.MensagemInformacao('Relatório exportado para: '+NomeArquivo);
  except on E:Exception do
  begin
    TMensagens.MensagemErro('Erro ao exportar relatório: '+e.Message);
    TLog.Error('Erro ao exportar relatório: '+e.Message);
  end;
  end;
end;

procedure TFrmConsulta_Reposicao_Estoque.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Reposicao_Estoque.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Reposicao_Estoque;
  Consulta.Consulta_Compra_Reposicao;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
  BBtnExportar.Enabled:= true;
end;

procedure TFrmConsulta_Reposicao_Estoque.BBtnImprimirClick(Sender: TObject);
begin
  dxComponentPrinter1.Preview(True, nil);
  {if (RGOrdena_Por.ItemIndex = 0) then
  begin
    FrmRel_Consulta_Reposicao_Estoque_Produto:= TFrmRel_Consulta_Reposicao_Estoque_Produto.create(self);
    FrmRel_Consulta_Reposicao_Estoque_Produto.Release;
    FrmRel_Consulta_Reposicao_Estoque_Produto:= Nil;
  end
  else if (RGOrdena_Por.ItemIndex = 1) then
  begin
    FrmRel_Consulta_Reposicao_Estoque:= TFrmRel_Consulta_Reposicao_Estoque.create(self);
    FrmRel_Consulta_Reposicao_Estoque.Release;
    FrmRel_Consulta_Reposicao_Estoque:= Nil;
  end
  else if (RGOrdena_Por.ItemIndex = 2) then
  begin
    FrmRel_Consulta_Reposicao_Estoque_Marca:= TFrmRel_Consulta_Reposicao_Estoque_Marca.create(self);
    FrmRel_Consulta_Reposicao_Estoque_Marca.Release;
    FrmRel_Consulta_Reposicao_Estoque_Marca:= Nil;
  end;}
end;

procedure TFrmConsulta_Reposicao_Estoque.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_reposicao.close;
  qrycompra.Close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  BBtnExportar.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Reposicao_Estoque.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

end;

procedure TFrmConsulta_Reposicao_Estoque.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Reposicao_Estoque.EdtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    if (RGConsulta_Por.ItemIndex = 1) then
    begin
      Application.CreateForm(TFrmChama_Grupo_Produto, FrmChama_Grupo_Produto);
      FrmChama_Grupo_Produto.ShowModal;
      FrmChama_Grupo_Produto.Free;
    end
    else if (RGConsulta_Por.ItemIndex = 2) then
    begin
      Application.CreateForm(TFrmChama_Marca, FrmChama_Marca);
      FrmChama_Marca.ShowModal;
      FrmChama_Marca.Free;
    end;
  end;
end;

procedure TFrmConsulta_Reposicao_Estoque.EdtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Utili.Somente_Apaga(key);
end;

procedure TFrmConsulta_Reposicao_Estoque.EdtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Utili.Somente_Apaga(key);
end;

procedure TFrmConsulta_Reposicao_Estoque.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Reposicao_Estoque.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Reposicao_Estoque.Free;
  FrmConsulta_Reposicao_Estoque:= NIl;
end;

procedure TFrmConsulta_Reposicao_Estoque.FormCreate(Sender: TObject);
begin
  qryconsulta_reposicao.close;
  qrycompra.Close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  //Util.Inicia_Data(MEdtData_Inicial, MEdtData_Final);
end;

procedure TFrmConsulta_Reposicao_Estoque.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Reposicao_Estoque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmConsulta_Reposicao_Estoque.qryconsulta_reposicaoData_ValidadeGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '30/12/1899') then
    Text:= ''
  else
    Text:= Sender.AsString;
end;

procedure TFrmConsulta_Reposicao_Estoque.qryconsulta_reposicaoUltima_CompraGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '30/12/1899') then
    Text:= ''
  else
    Text:= Sender.AsString;
end;

procedure TFrmConsulta_Reposicao_Estoque.RGConsulta_PorClick(Sender: TObject);
begin
  //Consulta.Consulta_Reposicao_Estoque;
end;

procedure TFrmConsulta_Reposicao_Estoque.RGEstoque_MinimoClick(Sender: TObject);
begin
  Consulta.Consulta_Reposicao_Estoque;
end;

procedure TFrmConsulta_Reposicao_Estoque.RGOrdena_PorClick(Sender: TObject);
begin
  Consulta.Consulta_Reposicao_Estoque;
end;

end.
