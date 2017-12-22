unit UFechamento_Inventario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls, Provider, DBClient, RSPrint, Buttons, StrUtils, DateUtils, UConsulta;

type
  TFrmFechamento_Inventario = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnPesquisa: TToolButton;
    BBtnFechar: TToolButton;
    qryestoque: TADOQuery;
    rs: TRSPrinter;
    LblEndereco: TLabel;
    LblTipo_Logradouro: TLabel;
    LblPedido: TLabel;
    DBGrid2: TDBGrid;
    ds_qry_estoque: TDataSource;
    BBtnFechar_Inventario: TToolButton;
    BBtnLimpar: TToolButton;
    Edit2: TEdit;
    MEdtMes: TMaskEdit;
    qryestoqueCodigo: TAutoIncField;
    qryestoqueCodigo_Venda: TStringField;
    qryestoqueDescricao: TStringField;
    qryestoqueValor_Compra: TFloatField;
    qryestoqueEstoque: TFloatField;
    qryestoqueValorEstoque: TFloatField;
    qryestoqueSigla: TStringField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnPesquisaClick(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure BBtnFechar_InventarioClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    Util: TUtil;
    dias_anterior: integer;
    data_inicio, data_fim: TDate;
    FI: URegistro.TFechamento_Estoque;
  public
    ativo: boolean;
    tipo: string;
    mes, ano: AnsiString;
    codigo: integer;
  end;

var
  FrmFechamento_Inventario: TFrmFechamento_Inventario;
  Consulta: TConsulta;
implementation

uses UDM, UDeclaracao;

{$R *.dfm}

{ TFrmPadrao }
procedure TFrmFechamento_Inventario.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmFechamento_Inventario.BBtnFechar_InventarioClick(Sender: TObject);
var
  qAux:TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select max(Codigo) as Codigo from Fechamento_Estoque');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
  finally
    FreeAndNil(qAux);
  end;

  FI.Inserir(FI);
  UDeclaracao.Insere_Historico(usuario, 'REALIZOU FECHAMENTO DE ESTOQUE.', TimeToStr(time), insercao, date);
  Processo_Concluido;
end;

procedure TFrmFechamento_Inventario.BBtnLimparClick(Sender: TObject);
begin
  PageControl1.TabIndex:= 0;
  qryestoque.Close;
  BBtnFechar_Inventario.Enabled:= false;
  BBtnPesquisa.Enabled:= true;
  BBtnLimpar.Enabled:= false;
end;

procedure TFrmFechamento_Inventario.BBtnPesquisaClick(Sender: TObject);
begin
  mes:= FormatDateTime('MM', date);
  ano:= FormatDateTime('YYYY', date);
  MEdtMes.Text:= FormatDateTime('MM/YYYY', date);
  Consulta.Consulta_Fechamento_Estoque;
  if (qryestoque.IsEmpty = false) then
  begin
    BBtnPesquisa.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnFechar_Inventario.Enabled:= true;
  end;
end;

procedure TFrmFechamento_Inventario.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFrmFechamento_Inventario.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmFechamento_Inventario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmFechamento_Inventario.Free;
  FrmFechamento_Inventario:= Nil;
end;

procedure TFrmFechamento_Inventario.FormCreate(Sender: TObject);
begin
  //Util.Limpa_Campos(FrmSugestao_Compra);
  PageControl1.TabIndex:= 0;
end;

procedure TFrmFechamento_Inventario.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmFechamento_Inventario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmFechamento_Inventario.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
