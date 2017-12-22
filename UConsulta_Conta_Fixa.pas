unit UConsulta_Conta_Fixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, Mask;

type
  TFrmConsulta_Conta_Fixa = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_conta: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    Label1: TLabel;
    EdtValor_Total: TEdit;
    BBtnImprimir: TToolButton;
    qryconsulta_contaCodigo: TAutoIncField;
    qryconsulta_contaData_Cadastro: TDateTimeField;
    qryconsulta_contaDescricao: TStringField;
    qryconsulta_contaCodigo_Plano: TIntegerField;
    qryconsulta_contaValor: TFloatField;
    qryconsulta_contaDia_Vencimento: TIntegerField;
    qryconsulta_contaTipo: TStringField;
    qryconsulta_contaObservacao: TStringField;
    qryconsulta_contaPlano: TStringField;
    Label2: TLabel;
    EdtCodigo_Plano: TEdit;
    EdtDia_Ini: TEdit;
    EdtDia_Fim: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    qryconsulta_contaCOLUMN1: TFloatField;
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
    procedure EdtCodigo_PlanoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
  FrmConsulta_Conta_Fixa: TFrmConsulta_Conta_Fixa;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UEscolha_Impressao, UChama_Plano_Financeiro, URel_Consulta_Conta_Fixa;

{$R *.dfm}

procedure TFrmConsulta_Conta_Fixa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Conta_Fixa.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Conta_Fixa(EdtConsulta.Text);
  if Consulta.Consulta_Conta_Fixa(EdtConsulta.Text) = true then
  begin
     EdtValor_Total.Text:= FormatFloat('#0.0,0', qryconsulta_contaCOLUMN1.AsFloat);
  end;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Conta_Fixa.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Conta_Fixa:= TFrmRel_Consulta_Conta_Fixa.create(self);
  FrmRel_Consulta_Conta_Fixa.Release;
  FrmRel_Consulta_Conta_Fixa:= Nil;
  {Application.CreateForm(TFrmEscolha_Impressao, FrmEscolha_Impressao);
  FrmEscolha_Impressao.Show;
  ativo:= true;}
end;

procedure TFrmConsulta_Conta_Fixa.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_conta.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
  EdtConsulta.SetFocus;
end;

procedure TFrmConsulta_Conta_Fixa.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Conta_Fixa.EdtCodigo_PlanoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Plano_Financeiro, FrmChama_Plano_Financeiro);
      FrmChama_Plano_Financeiro.ShowModal;
      FrmChama_Plano_Financeiro.Free;
    end;
end;

procedure TFrmConsulta_Conta_Fixa.EdtCodigo_PlanoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Conta_Fixa.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmConsulta_Conta_Fixa.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Conta_Fixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Conta_Fixa.Free;
  FrmConsulta_Conta_Fixa:= NIl;
end;

procedure TFrmConsulta_Conta_Fixa.FormCreate(Sender: TObject);
begin
  qryconsulta_conta.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  EdtConsulta.Clear;
end;

procedure TFrmConsulta_Conta_Fixa.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Conta_Fixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
