unit UConsulta_Curva_ABC_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, Mask;

type
  TFrmConsulta_Curva_ABC_Produto = class(TForm)
    DBGrid1: TDBGrid;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_curva: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    Label1: TLabel;
    Label3: TLabel;
    MEdtData_Inicial: TMaskEdit;
    MEdtData_Final: TMaskEdit;
    qryconsulta_curvaCodigo: TIntegerField;
    qryconsulta_curvaCodigo_Produto: TIntegerField;
    qryconsulta_curvaQtde: TFloatField;
    qryconsulta_curvaValor_Unitario: TFloatField;
    qryconsulta_curvaSub_Total: TFloatField;
    qryconsulta_curvaPerc: TFloatField;
    qryconsulta_curvaPercAcum: TFloatField;
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
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Curva_ABC_Produto: TFrmConsulta_Curva_ABC_Produto;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, URel_Consulta_Curva_ABC_Produto;

{$R *.dfm}

procedure TFrmConsulta_Curva_ABC_Produto.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Curva_ABC_Produto.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Curva_ABC_Produto;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Curva_ABC_Produto.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Curva_ABC_Produto:= TFrmRel_Consulta_Curva_ABC_Produto.create(self);
  FrmRel_Consulta_Curva_ABC_Produto.Release;
  FrmRel_Consulta_Curva_ABC_Produto:= Nil;
end;

procedure TFrmConsulta_Curva_ABC_Produto.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_curva.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Curva_ABC_Produto.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Curva_ABC_Produto.EdtCodigo_PlanoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Curva_ABC_Produto.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Curva_ABC_Produto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Curva_ABC_Produto.Free;
  FrmConsulta_Curva_ABC_Produto:= NIl;
end;

procedure TFrmConsulta_Curva_ABC_Produto.FormCreate(Sender: TObject);
begin
  qryconsulta_curva.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  Util.Inicia_Data(MEdtData_Inicial, MEdtData_Final);
end;

procedure TFrmConsulta_Curva_ABC_Produto.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Curva_ABC_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
