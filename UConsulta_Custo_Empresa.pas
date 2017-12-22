unit UConsulta_Custo_Empresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, Mask;

type
  TFrmConsulta_Custo_Empresa = class(TForm)
    RGConsulta_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_custo: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    qryconsulta_custoMES_ANO: TStringField;
    qryconsulta_custoVALOR_FIXO: TFloatField;
    qryconsulta_custoVALOR_VARIAVEL: TFloatField;
    qryconsulta_custoVALORTOTAL: TFloatField;
    qryconsulta_custoPFIXO: TFloatField;
    qryconsulta_custoPVARIAVEL: TFloatField;
    Label2: TLabel;
    MEdtData_Final: TMaskEdit;
    MEdtData_Inicial: TMaskEdit;
    Label5: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
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
  private
    { Private declarations }
  public
    mes1, mes2, ano1, ano2: AnsiString;
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Custo_Empresa: TFrmConsulta_Custo_Empresa;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UEscolha_Impressao, UChama_Plano_Financeiro,
  URel_Consulta_Custo_Empresa;

{$R *.dfm}

procedure TFrmConsulta_Custo_Empresa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Custo_Empresa.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  mes1:= Copy(MEdtData_Inicial.Text, 1,2);
  ano1:= Copy(MEdtData_Inicial.Text, 4,4);

  mes2:= Copy(MEdtData_Final.Text, 1,2);
  ano2:= Copy(MEdtData_Final.Text, 4,4);

  if (RGConsulta_Por.ItemIndex = 0) then
  begin
    PageControl1.TabIndex:= 0;
    Consulta.Consulta_Custo_Empresa;
  end;

  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Custo_Empresa.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Custo_Empresa:= TFrmRel_Consulta_Custo_Empresa.create(self);
  FrmRel_Consulta_Custo_Empresa.Release;
  FrmRel_Consulta_Custo_Empresa:= Nil;
  {Application.CreateForm(TFrmEscolha_Impressao, FrmEscolha_Impressao);
  FrmEscolha_Impressao.Show;
  ativo:= true;}
end;

procedure TFrmConsulta_Custo_Empresa.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_custo.close;
  PageControl1.TabIndex:= 0;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Custo_Empresa.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Custo_Empresa.EdtCodigo_PlanoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Plano_Financeiro, FrmChama_Plano_Financeiro);
      FrmChama_Plano_Financeiro.ShowModal;
      FrmChama_Plano_Financeiro.Free;
    end;
end;

procedure TFrmConsulta_Custo_Empresa.EdtCodigo_PlanoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Custo_Empresa.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Custo_Empresa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Custo_Empresa.Free;
  FrmConsulta_Custo_Empresa:= NIl;
end;

procedure TFrmConsulta_Custo_Empresa.FormCreate(Sender: TObject);
begin
  qryconsulta_custo.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
end;

procedure TFrmConsulta_Custo_Empresa.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Custo_Empresa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
