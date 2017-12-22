unit UConsulta_Tabela_Preco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, Mask;

type
  TFrmConsulta_Tabela_Preco = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtTabela: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_tabela: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    Label2: TLabel;
    EdtCodigo_Tabela: TEdit;
    RGTipo: TRadioGroup;
    Label3: TLabel;
    Label4: TLabel;
    MEdtData_Inicial: TMaskEdit;
    MEdtData_Final: TMaskEdit;
    qryconsulta_tabelaCodigo: TIntegerField;
    qryconsulta_tabelaDescricao: TStringField;
    qryconsulta_tabelaData_Cadastro: TDateTimeField;
    qryconsulta_tabelaData_Validade: TDateTimeField;
    qryconsulta_tabelaTipo: TStringField;
    Panel1: TPanel;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    qryitens_tabela: TADOQuery;
    DataSource1: TDataSource;
    qryitens_tabelaCodigo: TIntegerField;
    qryitens_tabelaCodigo_Produto: TIntegerField;
    qryitens_tabelaPreco_Vista: TFloatField;
    qryitens_tabelaPreco_Prazo: TFloatField;
    qryitens_tabelaPercentual_Desconto_Vista: TFloatField;
    qryitens_tabelaPercentual_Desconto_Prazo: TFloatField;
    qryitens_tabelaCodigo_Venda: TStringField;
    qryitens_tabelaDescricao: TStringField;
    qryconsulta_tabelaCodigo_Empresa: TIntegerField;
    qryitens_tabelaCodigo_Registro: TAutoIncField;
    qryitens_tabelaPercentual_Lucro_Vista: TFloatField;
    qryitens_tabelaPercentual_Lucro_Prazo: TFloatField;
    qryconsulta_tabelaTipo_Calculo: TStringField;
    qryconsulta_tabelaPercentual_Vista: TFloatField;
    qryconsulta_tabelaPercentual_Prazo: TFloatField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdtTabelaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_TabelaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_TabelaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Tabela_Preco: TFrmConsulta_Tabela_Preco;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Tabela_Preco, URel_Consulta_Tabela_Preco;

{$R *.dfm}

procedure TFrmConsulta_Tabela_Preco.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Tabela_Preco.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Tabela_Preco;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Tabela_Preco.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Tabela_Preco:= TFrmRel_Consulta_Tabela_Preco.create(self);
  FrmRel_Consulta_Tabela_Preco.Release;
  FrmRel_Consulta_Tabela_Preco:= Nil;
end;

procedure TFrmConsulta_Tabela_Preco.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_tabela.close;
  qryitens_tabela.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
end;

procedure TFrmConsulta_Tabela_Preco.DBGrid1CellClick(Column: TColumn);
begin
  Consulta.Consulta_Itens_Tabela_Preco;
end;

procedure TFrmConsulta_Tabela_Preco.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Tabela_Preco.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Tabela_Preco.EdtCodigo_TabelaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Tabela_Preco, FrmChama_Tabela_Preco);
    FrmChama_Tabela_Preco.ShowModal;
    FrmChama_Tabela_Preco.Free;
  end;
end;

procedure TFrmConsulta_Tabela_Preco.EdtCodigo_TabelaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Tabela_Preco.EdtTabelaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Consulta_Tabela_Preco;
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir.Enabled:= true;
  end;
end;

procedure TFrmConsulta_Tabela_Preco.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Tabela_Preco.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Tabela_Preco.Free;
  FrmConsulta_Tabela_Preco:= NIl;
end;

procedure TFrmConsulta_Tabela_Preco.FormCreate(Sender: TObject);
begin
  qryconsulta_tabela.close;
  qryitens_tabela.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  Util.Inicia_Data(MEdtData_Inicial, MEdtData_Final);
end;

procedure TFrmConsulta_Tabela_Preco.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Tabela_Preco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
