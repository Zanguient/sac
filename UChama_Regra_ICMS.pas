unit UChama_Regra_ICMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Regra_ICMS = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_regra: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_regraCodigo: TAutoIncField;
    qrychama_regraData_Cadastro: TDateTimeField;
    qrychama_regraDescricao: TStringField;
    qrychama_regraAliquota: TStringField;
    qrychama_regraTipo_Recolhimento: TStringField;
    qrychama_regraTipo_Calculo_BC_ICMS: TStringField;
    qrychama_regraTipo_Calculo_BC_ICMS_ST: TStringField;
    qrychama_regraBase_Reduzida: TStringField;
    qrychama_regraPercentual_BC_Reduzida: TStringField;
    qrychama_regraBase_Acrescida: TStringField;
    qrychama_regraPercentual_BC_Acrescida: TStringField;
    qrychama_regraCodigo_Situacao_Tributaria: TIntegerField;
    qrychama_regraCodigo_Situacao: TStringField;
    qrychama_regraSituacao: TStringField;
    qrychama_regraCFOP_D: TStringField;
    qrychama_regraCFOP_F: TStringField;
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
  FrmChama_Regra_ICMS: TFrmChama_Regra_ICMS;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Observacao_Fiscal, URegra_ICMS, UTratamento_ICMS;

{$R *.dfm}

procedure TFrmChama_Regra_ICMS.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Regra_ICMS.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Regra_ICMS;
end;

procedure TFrmChama_Regra_ICMS.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmRegra_ICMS <> Nil) and (FrmRegra_ICMS.ativo = true) then
  begin
    FrmRegra_ICMS.EdtCodigo.Text:= qrychama_regraCodigo.AsString;
    FrmRegra_ICMS.MEdtData_Cadastro.Text:= qrychama_regraData_Cadastro.AsString;
    FrmRegra_ICMS.EdtDescricao.Text:= qrychama_regraDescricao.AsString;
    FrmRegra_ICMS.EdtAliquota.Text:= qrychama_regraAliquota.AsString;

    if (qrychama_regraTipo_Recolhimento.AsString = 'TRIBUTADO') then
      FrmRegra_ICMS.RGTipo_Recolhimento.ItemIndex:= 0
    else if (qrychama_regraTipo_Recolhimento.AsString = 'ST') then
      FrmRegra_ICMS.RGTipo_Recolhimento.ItemIndex:= 1
    else if (qrychama_regraTipo_Recolhimento.AsString = 'NT') then
      FrmRegra_ICMS.RGTipo_Recolhimento.ItemIndex:= 2
    else if (qrychama_regraTipo_Recolhimento.AsString = 'I') then
      FrmRegra_ICMS.RGTipo_Recolhimento.ItemIndex:= 3;

    if (qrychama_regraBase_Reduzida.AsString = 'SIM') then
      FrmRegra_ICMS.RGBase_Reduzida.ItemIndex:= 0
    else
      FrmRegra_ICMS.RGBase_Reduzida.ItemIndex:= 1;

    if (qrychama_regraBase_Acrescida.AsString = 'SIM') then
      FrmRegra_ICMS.RGBase_Acrescida.ItemIndex:= 0
    else
      FrmRegra_ICMS.RGBase_Acrescida.ItemIndex:= 1;

    FrmRegra_ICMS.EdtPercentual_Base_Calculo_Reduzida.Text:= qrychama_regraPercentual_BC_Reduzida.AsString;
    FrmRegra_ICMS.EdtPercentual_Base_Calculo_Acrescida.Text:= qrychama_regraPercentual_BC_Acrescida.AsString;
    FrmRegra_ICMS.EdtCodigo_Situacao_Tributaria.Text:= qrychama_regraCodigo_Situacao_Tributaria.AsString;
    FrmRegra_ICMS.EdtSituacao_Tributaria.Text:= qrychama_regraCodigo_Situacao.AsString + ' - ' + qrychama_regraSituacao.AsString;
    FrmRegra_ICMS.codigo_situacao:= qrychama_regraCodigo_Situacao.AsString;

    FrmRegra_ICMS.EdtCFOP_V_D.Text:= qrychama_regraCFOP_D.AsString;
    FrmRegra_ICMS.EdtCFOP_V_F.Text:= qrychama_regraCFOP_F.AsString;
    FrmRegra_ICMS.CBModalidade_BC_ICMS.Text:= qrychama_regraTipo_Calculo_BC_ICMS.AsString;
    FrmRegra_ICMS.CBModalidade_BC_ICMS_ST.Text:= qrychama_regraTipo_Calculo_BC_ICMS_ST.AsString;
    FrmChama_Regra_ICMS.Close;
    FrmRegra_ICMS.BBtnSalvar.Enabled:= true;
    FrmRegra_ICMS.BBtnExcluir.Enabled:= true;
    FrmRegra_ICMS.BBtnPesquisar.Enabled:= true;
    FrmRegra_ICMS.BBtnCancelar.Enabled:= true;
    FrmRegra_ICMS.BBtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmRegra_ICMS);
    FrmRegra_ICMS.achei:= true;
  end
  else if (FrmTratamento_ICMS <> Nil) and (FrmTratamento_ICMS.ativo = true) and (FrmTratamento_ICMS.regra = 1) then
  begin
    FrmTratamento_ICMS.EdtCodigo_Regra_ICMS_EN_Entrada.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_ICMS.EdtRegra_ICMS_EN_Entrada.Text:= qrychama_regraDescricao.AsString;

    FrmTratamento_ICMS.EdtCodigo_Regra_ICMS_EPP_Entrada.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_ICMS.EdtRegra_ICMS_EPP_Entrada.Text:= qrychama_regraDescricao.AsString;

    FrmTratamento_ICMS.EdtCodigo_Regra_ICMS_ME_Entrada.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_ICMS.EdtRegra_ICMS_ME_Entrada.Text:= qrychama_regraDescricao.AsString;

    FrmTratamento_ICMS.EdtCodigo_Regra_ICMS_EN_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_ICMS.EdtRegra_ICMS_EN_Saida.Text:= qrychama_regraDescricao.AsString;

    FrmTratamento_ICMS.EdtCodigo_Regra_ICMS_EPP_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_ICMS.EdtRegra_ICMS_EPP_Saida.Text:= qrychama_regraDescricao.AsString;

    FrmTratamento_ICMS.EdtCodigo_Regra_ICMS_ME_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_ICMS.EdtRegra_ICMS_ME_Saida.Text:= qrychama_regraDescricao.AsString;

    FrmTratamento_ICMS.EdtCodigo_Regra_ICMS_Nao_Contribuinte.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_ICMS.EdtRegra_ICMS_Nao_Contribuinte.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_ICMS.Close;
  end
  else if (FrmTratamento_ICMS <> Nil) and (FrmTratamento_ICMS.ativo = true) and (FrmTratamento_ICMS.regra = 2) then
  begin
    FrmTratamento_ICMS.EdtCodigo_Regra_ICMS_EPP_Entrada.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_ICMS.EdtRegra_ICMS_EPP_Entrada.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_ICMS.Close;
  end
  else if (FrmTratamento_ICMS <> Nil) and (FrmTratamento_ICMS.ativo = true) and (FrmTratamento_ICMS.regra = 3) then
  begin
    FrmTratamento_ICMS.EdtCodigo_Regra_ICMS_ME_Entrada.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_ICMS.EdtRegra_ICMS_ME_Entrada.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_ICMS.Close;
  end
  else if (FrmTratamento_ICMS <> Nil) and (FrmTratamento_ICMS.ativo = true) and (FrmTratamento_ICMS.regra = 4) then
  begin
    FrmTratamento_ICMS.EdtCodigo_Regra_ICMS_EN_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_ICMS.EdtRegra_ICMS_EN_Saida.Text:= qrychama_regraDescricao.AsString;

    FrmTratamento_ICMS.EdtCodigo_Regra_ICMS_EPP_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_ICMS.EdtRegra_ICMS_EPP_Saida.Text:= qrychama_regraDescricao.AsString;

    FrmTratamento_ICMS.EdtCodigo_Regra_ICMS_ME_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_ICMS.EdtRegra_ICMS_ME_Saida.Text:= qrychama_regraDescricao.AsString;

    FrmChama_Regra_ICMS.Close;
  end
  else if (FrmTratamento_ICMS <> Nil) and (FrmTratamento_ICMS.ativo = true) and (FrmTratamento_ICMS.regra = 5) then
  begin
    FrmTratamento_ICMS.EdtCodigo_Regra_ICMS_EPP_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_ICMS.EdtRegra_ICMS_EPP_Saida.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_ICMS.Close;
  end
  else if (FrmTratamento_ICMS <> Nil) and (FrmTratamento_ICMS.ativo = true) and (FrmTratamento_ICMS.regra = 6) then
  begin
    FrmTratamento_ICMS.EdtCodigo_Regra_ICMS_ME_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_ICMS.EdtRegra_ICMS_ME_Saida.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_ICMS.Close;
  end
  else if (FrmTratamento_ICMS <> Nil) and (FrmTratamento_ICMS.ativo = true) and (FrmTratamento_ICMS.regra = 7) then
  begin
    FrmTratamento_ICMS.EdtCodigo_Regra_ICMS_Nao_Contribuinte.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_ICMS.EdtRegra_ICMS_Nao_Contribuinte.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_ICMS.Close;
  end;
end;

procedure TFrmChama_Regra_ICMS.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Regra_ICMS.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Regra_ICMS.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Regra_ICMS;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Regra_ICMS.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Regra_ICMS.Release;
end;

procedure TFrmChama_Regra_ICMS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
