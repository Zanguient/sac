unit UConsulta_Lancamento_Caixa;

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
  TFrmConsulta_Lancamento_Caixa = class(TForm)
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_lancamento: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    Label7: TLabel;
    Label8: TLabel;
    MEdtData_Final: TMaskEdit;
    MEdtData_Inicial: TMaskEdit;
    BBtnImprimir: TToolButton;
    Label4: TLabel;
    EdtUsuario: TEdit;
    EdtCodigo_Usuario: TEdit;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1Column1: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    cxPropertiesStore1: TcxPropertiesStore;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    qryconsulta_lancamentoCodigo: TIntegerField;
    qryconsulta_lancamentoCodigo_Empresa: TIntegerField;
    qryconsulta_lancamentoCodigo_Caixa: TIntegerField;
    qryconsulta_lancamentoCodigo_Usuario: TIntegerField;
    qryconsulta_lancamentoForma_Pagamento: TStringField;
    qryconsulta_lancamentoValor: TFloatField;
    qryconsulta_lancamentoTroco: TFloatField;
    qryconsulta_lancamentoData: TDateTimeField;
    qryconsulta_lancamentoTipo_Documento: TStringField;
    qryconsulta_lancamentoStatus: TStringField;
    qryconsulta_lancamentoAcerto: TIntegerField;
    qryconsulta_lancamentoTipo: TStringField;
    qryconsulta_lancamentoMovimenta: TIntegerField;
    qryconsulta_lancamentoN_Documento: TIntegerField;
    qryconsulta_lancamentoParcela: TIntegerField;
    qryconsulta_lancamentoCodigo_Registro: TAutoIncField;
    qryconsulta_lancamentoDescricao: TStringField;
    qryconsulta_lancamentoTransferencia: TIntegerField;
    qryconsulta_lancamentoCodigo_Conta: TIntegerField;
    qryconsulta_lancamentoCodigo_Operacao: TIntegerField;
    qryconsulta_lancamentoCodigo_Lancamento_Banco: TIntegerField;
    qryconsulta_lancamentoSaldo_Anterior: TFloatField;
    qryconsulta_lancamentoSaldo_Atual: TFloatField;
    qryconsulta_lancamentoUsuario: TStringField;
    cxGrid1DBTableView1Forma_Pagamento: TcxGridDBColumn;
    cxGrid1DBTableView1Valor: TcxGridDBColumn;
    cxGrid1DBTableView1Data: TcxGridDBColumn;
    cxGrid1DBTableView1Tipo_Documento: TcxGridDBColumn;
    cxGrid1DBTableView1Status: TcxGridDBColumn;
    cxGrid1DBTableView1Tipo: TcxGridDBColumn;
    cxGrid1DBTableView1N_Documento: TcxGridDBColumn;
    cxGrid1DBTableView1Descricao: TcxGridDBColumn;
    cxGrid1DBTableView1Saldo_Anterior: TcxGridDBColumn;
    cxGrid1DBTableView1Saldo_Atual: TcxGridDBColumn;
    cxGrid1DBTableView1Usuario: TcxGridDBColumn;
    cxGrid1DBTableView1Codigo_Registro: TcxGridDBColumn;
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
    procedure EdtCodigo_PlanoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_UsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_UsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtData_InicialExit(Sender: TObject);
    procedure MEdtData_FinalExit(Sender: TObject);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Lancamento_Caixa: TFrmConsulta_Lancamento_Caixa;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UEscolha_Impressao, UChama_Usuario;

{$R *.dfm}

procedure TFrmConsulta_Lancamento_Caixa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Lancamento_Caixa.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Consulta_Lancamento_Caixa;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Lancamento_Caixa.BBtnImprimirClick(Sender: TObject);
begin
  dxComponentPrinter1.Preview(True, nil);
end;

procedure TFrmConsulta_Lancamento_Caixa.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_lancamento.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  EdtCodigo_Usuario.SetFocus;
end;

procedure TFrmConsulta_Lancamento_Caixa.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Lancamento_Caixa.EdtCodigo_UsuarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Usuario, FrmChama_Usuario);
    FrmChama_Usuario.ShowModal;
    FrmChama_Usuario.Free;
  end;
end;

procedure TFrmConsulta_Lancamento_Caixa.EdtCodigo_UsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Lancamento_Caixa.EdtCodigo_PlanoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Lancamento_Caixa.EdtUsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Lancamento_Caixa.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Lancamento_Caixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Lancamento_Caixa.Free;
  FrmConsulta_Lancamento_Caixa:= NIl;
end;

procedure TFrmConsulta_Lancamento_Caixa.FormCreate(Sender: TObject);
begin
  qryconsulta_lancamento.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  Util.Inicia_Data(MEdtData_Inicial, MEdtData_Final);
end;

procedure TFrmConsulta_Lancamento_Caixa.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Lancamento_Caixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmConsulta_Lancamento_Caixa.MEdtData_FinalExit(Sender: TObject);
begin
  if (MEdtData_Final.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Final);
end;

procedure TFrmConsulta_Lancamento_Caixa.MEdtData_InicialExit(Sender: TObject);
begin
  if (MEdtData_Inicial.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Inicial);
end;

end.
