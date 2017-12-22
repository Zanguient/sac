unit UConsulta_Lancamento_Banco;

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
  TFrmConsulta_Lancamento_Banco = class(TForm)
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
    qryconsulta_lancamentoCodigo: TAutoIncField;
    qryconsulta_lancamentoCodigo_Empresa: TIntegerField;
    qryconsulta_lancamentoN_Documento: TIntegerField;
    qryconsulta_lancamentoData_Lancamento: TDateTimeField;
    qryconsulta_lancamentoCodigo_Conta: TIntegerField;
    qryconsulta_lancamentoCodigo_Operacao: TIntegerField;
    qryconsulta_lancamentoCodigo_Plano: TIntegerField;
    qryconsulta_lancamentoDescricao: TStringField;
    qryconsulta_lancamentoValor: TFloatField;
    qryconsulta_lancamentoStatus: TStringField;
    qryconsulta_lancamentoConta: TStringField;
    qryconsulta_lancamentoOperacao: TStringField;
    qryconsulta_lancamentoTipo: TStringField;
    qryconsulta_lancamentoPlano: TStringField;
    Label4: TLabel;
    EdtConta: TEdit;
    EdtCodigo_Conta: TEdit;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1Column1: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1Codigo: TcxGridDBColumn;
    cxGrid1DBTableView1N_Documento: TcxGridDBColumn;
    cxGrid1DBTableView1Data_Lancamento: TcxGridDBColumn;
    cxGrid1DBTableView1Descricao: TcxGridDBColumn;
    cxGrid1DBTableView1Valor: TcxGridDBColumn;
    cxGrid1DBTableView1Status: TcxGridDBColumn;
    cxGrid1DBTableView1Conta: TcxGridDBColumn;
    cxGrid1DBTableView1Operacao: TcxGridDBColumn;
    cxGrid1DBTableView1Tipo: TcxGridDBColumn;
    cxGrid1DBTableView1Plano: TcxGridDBColumn;
    cxPropertiesStore1: TcxPropertiesStore;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    qryconsulta_lancamentoSaldo_Anterior: TFloatField;
    qryconsulta_lancamentoSaldo_Atual: TFloatField;
    cxGrid1DBTableView1Saldo_Anterior: TcxGridDBColumn;
    cxGrid1DBTableView1Saldo_Atual: TcxGridDBColumn;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure EdtCodigo_PlanoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_PlanoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ContaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtContaKeyPress(Sender: TObject; var Key: Char);
    procedure MEdtData_InicialExit(Sender: TObject);
    procedure MEdtData_FinalExit(Sender: TObject);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Lancamento_Banco: TFrmConsulta_Lancamento_Banco;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UEscolha_Impressao, UChama_Plano_Financeiro,
  URel_Consulta_Lancamento_Banco, UChama_Conta_Corrente;

{$R *.dfm}

procedure TFrmConsulta_Lancamento_Banco.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Lancamento_Banco.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Consulta_Lancamento_Banco;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Lancamento_Banco.BBtnImprimirClick(Sender: TObject);
begin
  {FrmRel_Consulta_Lancamento_Banco:= TFrmRel_Consulta_Lancamento_Banco.Create(self);
  FrmRel_Consulta_Lancamento_Banco.Release;
  FrmRel_Consulta_Lancamento_Banco:= Nil;  }
  dxComponentPrinter1.Preview(True, nil);
end;

procedure TFrmConsulta_Lancamento_Banco.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_lancamento.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  EdtCodigo_Conta.SetFocus;
end;

procedure TFrmConsulta_Lancamento_Banco.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Lancamento_Banco.EdtCodigo_ContaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Conta_Corrente, FrmChama_Conta_Corrente);
    FrmChama_Conta_Corrente.ShowModal;
    FrmChama_Conta_Corrente.Free;
  end;
end;

procedure TFrmConsulta_Lancamento_Banco.EdtCodigo_ContaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Lancamento_Banco.EdtCodigo_PlanoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Plano_Financeiro, FrmChama_Plano_Financeiro);
    FrmChama_Plano_Financeiro.ShowModal;
    FrmChama_Plano_Financeiro.Free;
  end;
end;

procedure TFrmConsulta_Lancamento_Banco.EdtCodigo_PlanoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Lancamento_Banco.EdtContaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Lancamento_Banco.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Lancamento_Banco.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Lancamento_Banco.Free;
  FrmConsulta_Lancamento_Banco:= NIl;
end;

procedure TFrmConsulta_Lancamento_Banco.FormCreate(Sender: TObject);
begin
  qryconsulta_lancamento.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  Util.Inicia_Data(MEdtData_Inicial, MEdtData_Final);
end;

procedure TFrmConsulta_Lancamento_Banco.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Lancamento_Banco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmConsulta_Lancamento_Banco.MEdtData_FinalExit(Sender: TObject);
begin
  if (MEdtData_Final.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Final);
end;

procedure TFrmConsulta_Lancamento_Banco.MEdtData_InicialExit(Sender: TObject);
begin
  if (MEdtData_Inicial.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Inicial);
end;

end.
