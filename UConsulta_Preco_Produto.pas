unit UConsulta_Preco_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, Mask;

type
  TFrmConsulta_Preco_Produto = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtProduto: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_preco: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    Label2: TLabel;
    EdtCodigo_Produto: TEdit;
    RGTipo: TRadioGroup;
    Label5: TLabel;
    EdtTabela1: TEdit;
    EdtCodigo_Tabela1: TEdit;
    Label6: TLabel;
    EdtTabela2: TEdit;
    EdtCodigo_Tabela2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    MEdtData_Inicial: TMaskEdit;
    MEdtData_Final: TMaskEdit;
    qryconsulta_precoCodigo: TIntegerField;
    qryconsulta_precoCodigo_Produto: TIntegerField;
    qryconsulta_precoPreco_Vista: TFloatField;
    qryconsulta_precoPreco_Prazo: TFloatField;
    qryconsulta_precoPercentual_Desconto_Vista: TFloatField;
    qryconsulta_precoPercentual_Desconto_Prazo: TFloatField;
    qryconsulta_precoData_Cadastro: TDateTimeField;
    qryconsulta_precoData_Validade: TDateTimeField;
    qryconsulta_precoCodigo_Venda: TStringField;
    qryconsulta_precoDescricao: TStringField;
    qryconsulta_precoDescricao_1: TStringField;
    qryconsulta_precoPercentual_Lucro_Vista: TFloatField;
    qryconsulta_precoPercentual_Lucro_Prazo: TFloatField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdtProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Tabela1KeyPress(Sender: TObject; var Key: Char);
    procedure EdtTabela1KeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Tabela2KeyPress(Sender: TObject; var Key: Char);
    procedure EdtTabela2KeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Tabela1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Tabela2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    ativo: boolean;
    tabela: integer;
    { Public declarations }
  end;

var
  FrmConsulta_Preco_Produto: TFrmConsulta_Preco_Produto;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Produto, URel_Consulta_Preco_Produto, UChama_Tabela_Preco;

{$R *.dfm}

procedure TFrmConsulta_Preco_Produto.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Preco_Produto.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Preco_Produto;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Preco_Produto.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Preco_Produto:= TFrmRel_Consulta_Preco_Produto.create(self);
  FrmRel_Consulta_Preco_Produto.Release;
  FrmRel_Consulta_Preco_Produto:= Nil;
end;

procedure TFrmConsulta_Preco_Produto.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_preco.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
end;

procedure TFrmConsulta_Preco_Produto.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Preco_Produto.EdtCodigo_ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free
  end;
end;

procedure TFrmConsulta_Preco_Produto.EdtCodigo_ProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Preco_Produto.EdtCodigo_Tabela1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    if (RGConsulta_Por.ItemIndex = 2) then
    begin
      tabela:= 1;
      Application.CreateForm(TFrmChama_Tabela_Preco, FrmChama_Tabela_Preco);
      FrmChama_Tabela_Preco.ShowModal;
      FrmChama_Tabela_Preco.Free;
    end;
  end;
end;

procedure TFrmConsulta_Preco_Produto.EdtCodigo_Tabela1KeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Preco_Produto.EdtCodigo_Tabela2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    if (RGConsulta_Por.ItemIndex = 2) then
    begin
      tabela:= 2;
      Application.CreateForm(TFrmChama_Tabela_Preco, FrmChama_Tabela_Preco);
      FrmChama_Tabela_Preco.ShowModal;
      FrmChama_Tabela_Preco.Free;
    end;
  end;
end;

procedure TFrmConsulta_Preco_Produto.EdtCodigo_Tabela2KeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Preco_Produto.EdtProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Consulta_Preco_Produto;
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir.Enabled:= true;
  end;
end;

procedure TFrmConsulta_Preco_Produto.EdtProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Preco_Produto.EdtTabela1KeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Preco_Produto.EdtTabela2KeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Preco_Produto.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Preco_Produto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Preco_Produto.Free;
  FrmConsulta_Preco_Produto:= NIl;
end;

procedure TFrmConsulta_Preco_Produto.FormCreate(Sender: TObject);
begin
  qryconsulta_preco.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  Util.Inicia_Data(MEdtData_Inicial, MEdtData_Final);
end;

procedure TFrmConsulta_Preco_Produto.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Preco_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
