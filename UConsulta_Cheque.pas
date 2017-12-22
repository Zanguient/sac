unit UConsulta_Cheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, Mask;

type
  TFrmConsulta_Cheque = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qryconsulta_cheque: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    RGTipo_Cheque: TRadioGroup;
    BBtnLimpar: TToolButton;
    Label7: TLabel;
    Label8: TLabel;
    MEdtData_Final: TMaskEdit;
    MEdtData_Inicial: TMaskEdit;
    RGStatus: TRadioGroup;
    BBtnImprimir: TToolButton;
    qryconsulta_chequeCodigo: TAutoIncField;
    qryconsulta_chequeTipo: TStringField;
    qryconsulta_chequeEmitente: TStringField;
    qryconsulta_chequeFavorecido: TStringField;
    qryconsulta_chequeOrigem: TStringField;
    qryconsulta_chequeCodigo_Banco: TIntegerField;
    qryconsulta_chequeAgencia: TStringField;
    qryconsulta_chequeTitular: TStringField;
    qryconsulta_chequeN_Cheque: TStringField;
    qryconsulta_chequeValor: TFloatField;
    qryconsulta_chequeData_Cadastro: TDateTimeField;
    qryconsulta_chequeData_Vencimento: TDateTimeField;
    qryconsulta_chequeData_Saida: TDateTimeField;
    qryconsulta_chequeObservacoes: TStringField;
    qryconsulta_chequeStatus: TStringField;
    qryconsulta_chequeNome: TStringField;
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
    procedure qryconsulta_chequeData_VencimentoGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryconsulta_chequeData_SaidaGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Cheque: TFrmConsulta_Cheque;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UEscolha_Impressao, URel_Consulta_Cheque;

{$R *.dfm}

procedure TFrmConsulta_Cheque.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Cheque.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Consulta_Cheque(EdtConsulta.Text);
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Cheque.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Cheque:= TFrmRel_Consulta_Cheque.Create(self);
  FrmRel_Consulta_Cheque.Release;
  FrmRel_Consulta_Cheque:= Nil;
end;

procedure TFrmConsulta_Cheque.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_cheque.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  EdtConsulta.SetFocus;
end;

procedure TFrmConsulta_Cheque.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Cheque.DBGrid1TitleClick(Column: TColumn);
begin
  if (qryconsulta_cheque.Sort <> column.FieldName+ ' ASC') then
    qryconsulta_cheque.Sort:=column.FieldName+ ' ASC'
  else
    qryconsulta_cheque.sort:=column.fieldname+ ' DESC';
end;

procedure TFrmConsulta_Cheque.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Consulta_Cheque(EdtConsulta.Text);
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir.Enabled:= true;
  end;
end;

procedure TFrmConsulta_Cheque.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Cheque.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Cheque.Free;
  FrmConsulta_Cheque:= NIl;
end;

procedure TFrmConsulta_Cheque.FormCreate(Sender: TObject);
begin
  qryconsulta_cheque.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  EdtConsulta.Clear;
  Util.Inicia_Data(MEdtData_Final, MEdtData_Inicial);
end;

procedure TFrmConsulta_Cheque.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Cheque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmConsulta_Cheque.qryconsulta_chequeData_SaidaGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '30/12/1899') then
    Text:= ''
  else
    Text:= Sender.AsString;

end;

procedure TFrmConsulta_Cheque.qryconsulta_chequeData_VencimentoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '30/12/1899') then
    Text:= ''
  else
    Text:= Sender.AsString;

end;

end.
