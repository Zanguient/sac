unit UConsulta_Posicao_Estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, Mask;

type
  TFrmConsulta_Posicao_Estoque = class(TForm)
    DBGrid1: TDBGrid;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_posicao: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    qryconsulta_posicaoCodigo_Venda: TStringField;
    qryconsulta_posicaoDescricao: TStringField;
    qryconsulta_posicaoSigla: TStringField;
    qryconsulta_posicaoCodigo_Empresa: TIntegerField;
    qryconsulta_posicaoCOLUMN1: TStringField;
    qryconsulta_posicaoCodigo_Produto: TIntegerField;
    qryconsulta_posicaoQuantidade: TFloatField;
    qryconsulta_posicaoValor_Compra: TFloatField;
    qryconsulta_posicaoSub_Total: TFloatField;
    MEdtMes: TMaskEdit;
    Label2: TLabel;
    qryconsulta_posicaoMes: TStringField;
    qryconsulta_posicaoAno: TStringField;
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
    mes, ano: AnsiString;
    { Public declarations }
  end;

var
  FrmConsulta_Posicao_Estoque: TFrmConsulta_Posicao_Estoque;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, URel_Consulta_Posicao_Estoque;

{$R *.dfm}

procedure TFrmConsulta_Posicao_Estoque.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Posicao_Estoque.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  mes:= Copy(MEdtMes.Text, 1,2);
  ano:= Copy(MEdtMes.Text, 4,4);
  Consulta.Consulta_Posicao_Estoque;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Posicao_Estoque.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Posicao_Estoque:= TFrmRel_Consulta_Posicao_Estoque.create(self);
  FrmRel_Consulta_Posicao_Estoque.Release;
  FrmRel_Consulta_Posicao_Estoque:= Nil;
end;

procedure TFrmConsulta_Posicao_Estoque.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_posicao.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Posicao_Estoque.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Posicao_Estoque.EdtCodigo_PlanoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Posicao_Estoque.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Posicao_Estoque.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Posicao_Estoque.Free;
  FrmConsulta_Posicao_Estoque:= NIl;
end;

procedure TFrmConsulta_Posicao_Estoque.FormCreate(Sender: TObject);
begin
  qryconsulta_posicao.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  //Util.Inicia_Data(MEdtData_Inicial, MEdtData_Final);
end;

procedure TFrmConsulta_Posicao_Estoque.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Posicao_Estoque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
