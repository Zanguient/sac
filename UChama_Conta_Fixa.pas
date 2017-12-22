unit UChama_Conta_Fixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta;

type
  TFrmChama_Conta_Fixa = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_conta_fixa: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_conta_fixaCodigo: TIntegerField;
    qrychama_conta_fixaData_Cadastro: TDateTimeField;
    qrychama_conta_fixaDescricao: TStringField;
    qrychama_conta_fixaCodigo_Plano: TIntegerField;
    qrychama_conta_fixaValor: TFloatField;
    qrychama_conta_fixaDia_Vencimento: TIntegerField;
    qrychama_conta_fixaTipo: TStringField;
    qrychama_conta_fixaPlano: TStringField;
    qrychama_conta_fixaObservacao: TStringField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Conta_Fixa: TFrmChama_Conta_Fixa;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UConta_Fixa;

{$R *.dfm}

procedure TFrmChama_Conta_Fixa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Conta_Fixa.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Conta_Fixa(EdtConsulta.Text);
end;

procedure TFrmChama_Conta_Fixa.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmConta_Fixa <> NIl) and (FrmConta_Fixa.ativo = true) then
  begin
    FrmConta_Fixa.EdtCodigo.Text:= qrychama_conta_fixaCodigo.AsString;
    FrmConta_Fixa.MEdtData_Lancamento.Text:= qrychama_conta_fixaData_Cadastro.AsString;
    FrmConta_Fixa.EdtDescricao.Text:= qrychama_conta_fixaDescricao.AsString;
    if (qrychama_conta_fixaCodigo_Plano.AsString <> '0') then
    begin
      FrmConta_Fixa.EdtCodigo_Plano.Text:= qrychama_conta_fixaCodigo_Plano.AsString;
      FrmConta_Fixa.EdtPlano.Text:= qrychama_conta_fixaPlano.AsString;
    end
    else
    begin
      FrmConta_Fixa.EdtCodigo_Plano.Text:= '';
      FrmConta_Fixa.EdtPlano.Text:= '';
    end;
    FrmConta_Fixa.EdtValor.Text:= qrychama_conta_fixaValor.AsString;
    Util.FormataFloat(2, FrmConta_Fixa.EdtValor, StrToFloat(FrmConta_Fixa.EdtValor.Text));
    FrmConta_Fixa.EdtDia.Text:= qrychama_conta_fixaDia_Vencimento.AsString;
    FrmConta_Fixa.MmoObservacoes.Text:= qrychama_conta_fixaObservacao.AsString;
    if (qrychama_conta_fixaTipo.AsString = 'CRÉDITO') then
      FrmConta_Fixa.RGTipo.ItemIndex:= 0
    else
      FrmConta_Fixa.RGTipo.ItemIndex:= 1;
    FrmChama_Conta_Fixa.Close;
    FrmConta_Fixa.BBtnSalvar.Enabled:= true;
    FrmConta_Fixa.BBtnExcluir.Enabled:= true;
    FrmConta_Fixa.BBtnPesquisar.Enabled:= true;
    FrmConta_Fixa.BBtnCancelar.Enabled:= true;
    Util.Habilita_Campos(FrmConta_Fixa);
    FrmConta_Fixa.achei:= true;
  end;
end;

procedure TFrmChama_Conta_Fixa.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Conta_Fixa.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Conta_Fixa.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Conta_Fixa(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Conta_Fixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Conta_Fixa.Release;
end;

procedure TFrmChama_Conta_Fixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
