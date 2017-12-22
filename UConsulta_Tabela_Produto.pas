unit UConsulta_Tabela_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, Mask;

type
  TFrmConsulta_Tabela_Produto = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ImgImagens: TImageList;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_preco: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    Label1: TLabel;
    EdtValor_Total: TEdit;
    BBtnImprimir: TToolButton;
    qryconsulta_precoCodigo: TAutoIncField;
    qryconsulta_precoData_Cadastro: TDateTimeField;
    qryconsulta_precoDescricao: TStringField;
    qryconsulta_precoCodigo_Plano: TIntegerField;
    qryconsulta_precoValor: TFloatField;
    qryconsulta_precoDia_Vencimento: TIntegerField;
    qryconsulta_precoTipo: TStringField;
    qryconsulta_precoObservacao: TStringField;
    qryconsulta_precoPlano: TStringField;
    Label2: TLabel;
    EdtCodigo_Plano: TEdit;
    EdtDia_Ini: TEdit;
    EdtDia_Fim: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    qryconsulta_precoCOLUMN1: TFloatField;
    RGTipo: TRadioGroup;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Tabela_Produto: TFrmConsulta_Tabela_Produto;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM;

{$R *.dfm}

procedure TFrmConsulta_Tabela_Produto.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Tabela_Produto.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Conta_Fixa(EdtConsulta.Text);
  if Consulta.Consulta_Conta_Fixa(EdtConsulta.Text) = true then
  begin
     //EdtValor_Total.Text:= FormatFloat('#0.0,0', qryconsulta_contaCOLUMN1.AsFloat);
  end;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Tabela_Produto.BBtnImprimirClick(Sender: TObject);
begin
  {FrmRel_Consulta_Conta_Fixa:= TFrmRel_Consulta_Conta_Fixa.create(self);
  FrmRel_Consulta_Conta_Fixa.Release;
  FrmRel_Consulta_Conta_Fixa:= Nil;}
end;

procedure TFrmConsulta_Tabela_Produto.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_preco.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  EdtConsulta.SetFocus;
end;

procedure TFrmConsulta_Tabela_Produto.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State)
end;

procedure TFrmConsulta_Tabela_Produto.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Consulta_Conta_Fixa(EdtConsulta.Text);
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir.Enabled:= true;
  end;
end;

procedure TFrmConsulta_Tabela_Produto.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Tabela_Produto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Tabela_Produto.Free;
  FrmConsulta_Tabela_Produto:= NIl;
end;

procedure TFrmConsulta_Tabela_Produto.FormCreate(Sender: TObject);
begin
  qryconsulta_preco.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  EdtConsulta.Clear;
end;

procedure TFrmConsulta_Tabela_Produto.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Tabela_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
