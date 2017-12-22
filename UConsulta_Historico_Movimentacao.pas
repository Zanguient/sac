unit UConsulta_Historico_Movimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, Mask;

type
  TFrmConsulta_Historico_Movimentacao = class(TForm)
    DBGrid1: TDBGrid;
    EdtProduto: TEdit;
    RGConsulta_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_historico: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    Label2: TLabel;
    EdtCodigo_Produto: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    MEdtData_Inicial: TMaskEdit;
    MEdtData_Final: TMaskEdit;
    qryconsulta_historicoCodigo: TIntegerField;
    qryconsulta_historicoDescricao: TStringField;
    qryconsulta_historicoQuantidade: TFloatField;
    qryconsulta_historicoData: TDateTimeField;
    qryconsulta_historicoTipo: TStringField;
    qryconsulta_historicoNome: TStringField;
    qryconsulta_historicoCliForn: TStringField;
    qryconsulta_historicoQtde_Estoque_Atual: TFloatField;
    qryconsulta_historicoCodigo_Reg: TIntegerField;
    qryconsulta_historicoQtd: TFloatField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Historico_Movimentacao: TFrmConsulta_Historico_Movimentacao;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Usuario, UChama_Produto,
  URel_Consulta_Historico_Movimentacao;

{$R *.dfm}

procedure TFrmConsulta_Historico_Movimentacao.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Historico_Movimentacao.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Historico_Movimentacao;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Historico_Movimentacao.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Historico_Movimentacao:= TFrmRel_Consulta_Historico_Movimentacao.create(self);
  FrmRel_Consulta_Historico_Movimentacao.Release;
  FrmRel_Consulta_Historico_Movimentacao:= Nil;
end;

procedure TFrmConsulta_Historico_Movimentacao.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_historico.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Historico_Movimentacao.DBGrid1DrawColumnCell(Sender: TObject;
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

  if (qryconsulta_historicoTipo.Value = 'ENTRADA') or (qryconsulta_historicoTipo.Value = 'ENTRADA MANUAL') then
  begin
    dbgrid1.Canvas.Font.Color:= clBlue;
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end
  else if (qryconsulta_historicoTipo.Value = 'SAÍDA') or (qryconsulta_historicoTipo.Value = 'SAÍDA MANUAL') then
  begin
    dbgrid1.Canvas.Font.Color:= clRed;
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

end;

procedure TFrmConsulta_Historico_Movimentacao.EdtCodigo_ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
      FrmChama_Produto.ShowModal;
      FrmChama_Produto.Free;
    end;
end;

procedure TFrmConsulta_Historico_Movimentacao.EdtCodigo_ProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Historico_Movimentacao.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Historico_Movimentacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Historico_Movimentacao.Free;
  FrmConsulta_Historico_Movimentacao:= NIl;
end;

procedure TFrmConsulta_Historico_Movimentacao.FormCreate(Sender: TObject);
begin
  qryconsulta_historico.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  EdtCodigo_Produto.Clear;
  EdtProduto.Clear;
  MEdtData_Inicial.Text:= DateToStr(date);
  MEdtData_Final.Text:= DateToStr(date);
end;

procedure TFrmConsulta_Historico_Movimentacao.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Historico_Movimentacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
