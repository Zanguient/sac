unit UConsulta_Saldo_Estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, Mask;

type
  TFrmConsulta_Saldo_Estoque = class(TForm)
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_saldo: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    RGNatureza: TRadioGroup;
    Label3: TLabel;
    Label4: TLabel;
    MEdtData_Inicial: TMaskEdit;
    MEdtData_Final: TMaskEdit;
    qryconsulta_saldoCodigo_Venda: TStringField;
    qryconsulta_saldoDescricao: TStringField;
    qryconsulta_saldoNatureza: TStringField;
    qryconsulta_saldoData: TDateTimeField;
    qryconsulta_saldoEstoque_Atual: TFloatField;
    qryconsulta_saldoQuantidade: TFloatField;
    qryconsulta_saldoValor_Compra: TFloatField;
    qryconsulta_saldoValor_Total: TFloatField;
    qryconsulta_saldoCusto_Medio: TFloatField;
    qryconsulta_saldoSaldo_Quantidade: TFloatField;
    qryconsulta_saldoSaldo_Valor: TFloatField;
    qryconsulta_saldoCodigo_Produto: TIntegerField;
    RGConsulta_Por: TRadioGroup;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    qryconsulta_saldo_geral: TADOQuery;
    DataSource1: TDataSource;
    qryconsulta_saldo_geralTotal: TFloatField;
    Label1: TLabel;
    qryconsulta_saldo_geralEst: TFloatField;
    qryconsulta_saldo_geralVal_Compra: TFloatField;
    qryconsulta_saldo_geralSigla: TStringField;
    qryconsulta_saldo_geral2: TADOQuery;
    DataSource2: TDataSource;
    qryconsulta_saldo_geral2Estoque: TFloatField;
    qryconsulta_saldo_geral2Total: TFloatField;
    TabSheet4: TTabSheet;
    DBGrid3: TDBGrid;
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
    procedure EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Saldo_Estoque: TFrmConsulta_Saldo_Estoque;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Produto, URel_Consulta_Saldo_Estoque,
  URel_Consulta_Saldo_Bancario, URel_Consulta_Saldo_Estoque_Geral,
  URel_Consulta_Saldo_Estoque_Geral2;

{$R *.dfm}

procedure TFrmConsulta_Saldo_Estoque.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Saldo_Estoque.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  if (RGConsulta_Por.ItemIndex = 0) then
  begin
    PageControl1.TabIndex:= 0;
    Consulta.Consulta_Saldo_Estoque_Geral;
  end
  else if (RGConsulta_Por.ItemIndex = 1) then
  begin
    PageControl1.TabIndex:= 1;
    Consulta.Consulta_Saldo_Estoque_Geral2;
  end
  else if (RGConsulta_Por.ItemIndex = 2) then
  begin
    PageControl1.TabIndex:= 2;
    //Consulta.Consulta_Saldo_Estoque;
  end
  else if (RGConsulta_Por.ItemIndex = 3) then
  begin
    PageControl1.TabIndex:= 3;
    Consulta.Consulta_Saldo_Estoque;
  end;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Saldo_Estoque.BBtnImprimirClick(Sender: TObject);
begin
  if (RGConsulta_Por.ItemIndex = 0) then
  begin
    FrmRel_Consulta_Saldo_Estoque_Geral:= TFrmRel_Consulta_Saldo_Estoque_Geral.create(self);
    FrmRel_Consulta_Saldo_Estoque_Geral.Release;
    FrmRel_Consulta_Saldo_Estoque_Geral:= Nil;
  end
  else if (RGConsulta_Por.ItemIndex = 1) then
  begin
    FrmRel_Consulta_Saldo_Estoque_Geral2:= TFrmRel_Consulta_Saldo_Estoque_Geral2.create(self);
    FrmRel_Consulta_Saldo_Estoque_Geral2.Release;
    FrmRel_Consulta_Saldo_Estoque_Geral2:= Nil;
  end
  else if (RGConsulta_Por.ItemIndex = 2) then
  begin

  end
  else if (RGConsulta_Por.ItemIndex = 3) then
  begin
    FrmRel_Consulta_Saldo_Estoque:= TFrmRel_Consulta_Saldo_Estoque.create(self);
    FrmRel_Consulta_Saldo_Estoque.Release;
    FrmRel_Consulta_Saldo_Estoque:= Nil;
  end;
end;

procedure TFrmConsulta_Saldo_Estoque.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_saldo.close;
  qryconsulta_saldo_geral.Close;
  qryconsulta_saldo_geral2.Close;
  PageControl1.TabIndex:= 0;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Saldo_Estoque.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Saldo_Estoque.EdtCodigo_ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free;
  end;
end;

procedure TFrmConsulta_Saldo_Estoque.EdtCodigo_UsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Saldo_Estoque.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Saldo_Estoque.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Saldo_Estoque.Free;
  FrmConsulta_Saldo_Estoque:= NIl;
end;

procedure TFrmConsulta_Saldo_Estoque.FormCreate(Sender: TObject);
begin
  qryconsulta_saldo.close;
  qryconsulta_saldo_geral.Close;
  qryconsulta_saldo_geral2.Close;
  PageControl1.TabIndex:= 0;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  MEdtData_Inicial.Text:= DateToStr(date);
  MEdtData_Final.Text:= DateToStr(date);
end;

procedure TFrmConsulta_Saldo_Estoque.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Saldo_Estoque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
