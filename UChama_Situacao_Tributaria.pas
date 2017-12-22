unit UChama_Situacao_Tributaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta;

type
  TFrmChama_Situacao_Tributaria = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_situacao_tributaria: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_situacao_tributariaCodigo: TIntegerField;
    qrychama_situacao_tributariaCodigo_Situacao: TStringField;
    qrychama_situacao_tributariaDescricao: TStringField;
    qrychama_situacao_tributariaData_Cadastro: TDateTimeField;
    qrychama_situacao_tributariaOrigem: TIntegerField;
    qrychama_situacao_tributariaCodigo_CSOSN: TStringField;
    qrychama_situacao_tributariaDescricao_CSOSN: TStringField;
    qrychama_situacao_tributariaPermite_Credito: TIntegerField;
    qrychama_situacao_tributariaCodigo_Obs_Fiscal: TIntegerField;
    qrychama_situacao_tributariaObs: TStringField;
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
  FrmChama_Situacao_Tributaria: TFrmChama_Situacao_Tributaria;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Situacao_Tributaria, UCadastro_Produto, URegra_ICMS,
  URegra_PIS, URegra_COFINS, URegra_IPI;

{$R *.dfm}

procedure TFrmChama_Situacao_Tributaria.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Situacao_Tributaria.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Situacao_Tributaria(EdtConsulta.Text);
end;

procedure TFrmChama_Situacao_Tributaria.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Situacao_Tributaria <> NIL) and (FrmCadastro_Situacao_Tributaria.ativo = true) then
  begin
    FrmCadastro_Situacao_Tributaria.EdtCodigo.Text:= qrychama_situacao_tributariaCodigo.AsString;
    FrmCadastro_Situacao_Tributaria.EdtOrigem.Text:= qrychama_situacao_tributariaOrigem.AsString;
    FrmCadastro_Situacao_Tributaria.EdtCodigo_Situacao.Text:= qrychama_situacao_tributariaCodigo_Situacao.AsString;
    FrmCadastro_Situacao_Tributaria.EdtDescricao.Text:= qrychama_situacao_tributariaDescricao.AsString;
    FrmCadastro_Situacao_Tributaria.MEdtData_Cadastro.Text:= qrychama_situacao_tributariaData_Cadastro.AsString;
    FrmCadastro_Situacao_Tributaria.EdtCSOSN.Text:= qrychama_situacao_tributariaCodigo_CSOSN.AsString;
    FrmCadastro_Situacao_Tributaria.EdtDescricao_CSOSN.Text:= qrychama_situacao_tributariaDescricao_CSOSN.AsString;
    FrmCadastro_Situacao_Tributaria.EdtCodigo_Observacao_Fiscal.Text:= qrychama_situacao_tributariaCodigo_Obs_Fiscal.AsString;
    FrmCadastro_Situacao_Tributaria.EdtObservacao_Fiscal.Text:= qrychama_situacao_tributariaObs.AsString;
    FrmCadastro_Situacao_Tributaria.RGPermite_Credito.ItemIndex:= qrychama_situacao_tributariaPermite_Credito.AsInteger;

    FrmChama_Situacao_Tributaria.Close;
    FrmCadastro_Situacao_Tributaria.BBtnSalvar.Enabled:= true;
    FrmCadastro_Situacao_Tributaria.BBtnExcluir.Enabled:= true;
    FrmCadastro_Situacao_Tributaria.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Situacao_Tributaria.BBtnCancelar.Enabled:= true;
    FrmCadastro_Situacao_Tributaria.BBtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmCadastro_Situacao_Tributaria);
    FrmCadastro_Situacao_Tributaria.achei:= true;
  end
  else if (FrmRegra_ICMS <> NIL) and (FrmRegra_ICMS.ativo = true) then
  begin
    FrmRegra_ICMS.EdtCodigo_Situacao_Tributaria.Text:= qrychama_situacao_tributariaCodigo.AsString;
    FrmRegra_ICMS.EdtSituacao_Tributaria.Text:= qrychama_situacao_tributariaCodigo_Situacao.AsString + ' - ' + qrychama_situacao_tributariaDescricao.AsString;
    FrmRegra_ICMS.codigo_situacao:= qrychama_situacao_tributariaCodigo_Situacao.AsString;
    FrmChama_Situacao_Tributaria.Close;
  end
  else if (FrmRegra_PIS <> NIL) and (FrmRegra_PIS.ativo = true) then
  begin
    FrmRegra_PIS.EdtCodigo_Situacao_Tributaria.Text:= qrychama_situacao_tributariaCodigo.AsString;
    FrmRegra_PIS.EdtSituacao_Tributaria.Text:= qrychama_situacao_tributariaCodigo_Situacao.AsString + ' - ' + qrychama_situacao_tributariaDescricao.AsString;
    FrmChama_Situacao_Tributaria.Close;
  end
  else if (FrmRegra_COFINS <> NIL) and (FrmRegra_COFINS.ativo = true) then
  begin
    FrmRegra_COFINS.EdtCodigo_Situacao_Tributaria.Text:= qrychama_situacao_tributariaCodigo.AsString;
    FrmRegra_COFINS.EdtSituacao_Tributaria.Text:= qrychama_situacao_tributariaCodigo_Situacao.AsString + ' - ' + qrychama_situacao_tributariaDescricao.AsString;
    FrmChama_Situacao_Tributaria.Close;
  end
  else if (FrmRegra_IPI <> NIL) and (FrmRegra_IPI.ativo = true) then
  begin
    FrmRegra_IPI.EdtCodigo_Situacao_Tributaria.Text:= qrychama_situacao_tributariaCodigo.AsString;
    FrmRegra_IPI.EdtSituacao_Tributaria.Text:= qrychama_situacao_tributariaCodigo_Situacao.AsString + ' - ' + qrychama_situacao_tributariaDescricao.AsString;
    FrmChama_Situacao_Tributaria.Close;
  end;
end;

procedure TFrmChama_Situacao_Tributaria.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Situacao_Tributaria.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Situacao_Tributaria.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Situacao_Tributaria(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Situacao_Tributaria.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Situacao_Tributaria.Release;
end;

procedure TFrmChama_Situacao_Tributaria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
