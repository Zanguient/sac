unit UConsulta_Custo_Venda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, Mask;

type
  TFrmConsulta_Custo_Venda = class(TForm)
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_custo_venda: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    RGOrdena_Por: TRadioGroup;
    qryconsulta_custo_vendaCodigo_Venda: TStringField;
    qryconsulta_custo_vendaDescricao: TStringField;
    qryconsulta_custo_vendaEstoque: TFloatField;
    qryconsulta_custo_vendaValor_Medio: TFloatField;
    qryconsulta_custo_vendaSaldo_Estoque: TFloatField;
    qryconsulta_custo_vendaPreco_Vista: TFloatField;
    qryconsulta_custo_vendaValor_Total: TFloatField;
    qryconsulta_custo_vendaDiferenca: TFloatField;
    qryconsulta_custo_vendaSigla: TStringField;
    Label40: TLabel;
    EdtTabela_Preco: TEdit;
    EdtCodigo_Tabela_Preco: TEdit;
    qryconsulta_custo_vendaPerc_Real: TFloatField;
    qryconsulta_custo_vendaPercentual_Lucro_Vista: TFloatField;
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
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Custo_Venda: TFrmConsulta_Custo_Venda;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Tabela_Preco, URel_Consulta_Custo_Venda;

{$R *.dfm}

procedure TFrmConsulta_Custo_Venda.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Custo_Venda.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Custo_Venda;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Custo_Venda.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Custo_Venda:= TFrmRel_Consulta_Custo_Venda.create(self);
  FrmRel_Consulta_Custo_Venda.Release;
  FrmRel_Consulta_Custo_Venda:= Nil;
end;

procedure TFrmConsulta_Custo_Venda.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_custo_venda.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Custo_Venda.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Custo_Venda.EdtCodigo_Tabela_PrecoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Tabela_Preco, FrmChama_Tabela_Preco);
    FrmChama_Tabela_Preco.ShowModal;
    FrmChama_Tabela_Preco.Free;
  end;
end;

procedure TFrmConsulta_Custo_Venda.EdtCodigo_Tabela_PrecoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Custo_Venda.EdtCodigo_UsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Custo_Venda.EdtTabela_PrecoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Custo_Venda.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Custo_Venda.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Custo_Venda.Free;
  FrmConsulta_Custo_Venda:= NIl;
end;

procedure TFrmConsulta_Custo_Venda.FormCreate(Sender: TObject);
begin
  qryconsulta_custo_venda.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  //MEdtData_Inicial.Text:= DateToStr(date);
  //MEdtData_Final.Text:= DateToStr(date);
end;

procedure TFrmConsulta_Custo_Venda.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Custo_Venda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
