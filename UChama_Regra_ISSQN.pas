unit UChama_Regra_ISSQN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Regra_ISSQN = class(TForm)
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
    qrychama_regraTributacao: TStringField;
    qrychama_regraBase_Reduzida: TStringField;
    qrychama_regraPercentual_BC_Reduzida: TStringField;
    qrychama_regraBase_Acrescida: TStringField;
    qrychama_regraPercentual_BC_Acrescida: TStringField;
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
  FrmChama_Regra_ISSQN: TFrmChama_Regra_ISSQN;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, URegra_ISSQN, UTratamento_ISSQN, UCadastro_Produto;

{$R *.dfm}

procedure TFrmChama_Regra_ISSQN.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Regra_ISSQN.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Regra_ISSQN;
end;

procedure TFrmChama_Regra_ISSQN.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmRegra_ISSQN <> Nil) and (FrmRegra_ISSQN.ativo = true) then
  begin
    FrmRegra_ISSQN.EdtCodigo.Text:= qrychama_regraCodigo.AsString;
    FrmRegra_ISSQN.MEdtData_Cadastro.Text:= qrychama_regraData_Cadastro.AsString;
    FrmRegra_ISSQN.EdtDescricao.Text:= qrychama_regraDescricao.AsString;
    FrmRegra_ISSQN.EdtAliquota.Text:= qrychama_regraAliquota.AsString;

    if (qrychama_regraTributacao.AsString = 'NORMAL') then
      FrmRegra_ISSQN.RGTributacao.ItemIndex:= 0
    else if (qrychama_regraTributacao.AsString = 'RETIDA') then
      FrmRegra_ISSQN.RGTributacao.ItemIndex:= 1
    else if (qrychama_regraTributacao.AsString = 'SUBSTITUTA') then
      FrmRegra_ISSQN.RGTributacao.ItemIndex:= 2
    else if (qrychama_regraTributacao.AsString = 'ISENTA') then
      FrmRegra_ISSQN.RGTributacao.ItemIndex:= 3;

    if (qrychama_regraBase_Reduzida.AsString = 'SIM') then
      FrmRegra_ISSQN.RGBase_Reduzida.ItemIndex:= 0
    else
      FrmRegra_ISSQN.RGBase_Reduzida.ItemIndex:= 1;

    if (qrychama_regraBase_Acrescida.AsString = 'SIM') then
      FrmRegra_ISSQN.RGBase_Acrescida.ItemIndex:= 0
    else
      FrmRegra_ISSQN.RGBase_Acrescida.ItemIndex:= 1;

    FrmRegra_ISSQN.EdtPercentual_Base_Calculo_Reduzida.Text:= qrychama_regraPercentual_BC_Reduzida.AsString;
    FrmRegra_ISSQN.EdtPercentual_Base_Calculo_Acrescida.Text:= qrychama_regraPercentual_BC_Acrescida.AsString;
    FrmChama_Regra_ISSQN.Close;
    FrmRegra_ISSQN.BBtnSalvar.Enabled:= true;
    FrmRegra_ISSQN.BBtnExcluir.Enabled:= true;
    FrmRegra_ISSQN.BBtnPesquisar.Enabled:= true;
    FrmRegra_ISSQN.BBtnCancelar.Enabled:= true;
    FrmRegra_ISSQN.BBtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmRegra_ISSQN);
    FrmRegra_ISSQN.achei:= true;
  end
  else if (FrmTratamento_ISSQN <> Nil) and (FrmTratamento_ISSQN.ativo = true) and (FrmTratamento_ISSQN.regra = 1) then
  begin
    FrmTratamento_ISSQN.EdtCodigo_Regra_ICMS_EN_Entrada.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_ISSQN.EdtRegra_ICMS_EN_Entrada.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_ISSQN.Close;
  end
  else if (FrmTratamento_ISSQN <> Nil) and (FrmTratamento_ISSQN.ativo = true) and (FrmTratamento_ISSQN.regra = 2) then
  begin
    FrmTratamento_ISSQN.EdtCodigo_Regra_ICMS_EPP_Entrada.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_ISSQN.EdtRegra_ICMS_EPP_Entrada.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_ISSQN.Close;
  end
  else if (FrmTratamento_ISSQN <> Nil) and (FrmTratamento_ISSQN.ativo = true) and (FrmTratamento_ISSQN.regra = 3) then
  begin
    FrmTratamento_ISSQN.EdtCodigo_Regra_ICMS_ME_Entrada.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_ISSQN.EdtRegra_ICMS_ME_Entrada.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_ISSQN.Close;
  end
  else if (FrmTratamento_ISSQN <> Nil) and (FrmTratamento_ISSQN.ativo = true) and (FrmTratamento_ISSQN.regra = 4) then
  begin
    FrmTratamento_ISSQN.EdtCodigo_Regra_ICMS_EN_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_ISSQN.EdtRegra_ICMS_EN_Saida.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_ISSQN.Close;
  end
  else if (FrmTratamento_ISSQN <> Nil) and (FrmTratamento_ISSQN.ativo = true) and (FrmTratamento_ISSQN.regra = 5) then
  begin
    FrmTratamento_ISSQN.EdtCodigo_Regra_ICMS_EPP_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_ISSQN.EdtRegra_ICMS_EPP_Saida.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_ISSQN.Close;
  end
  else if (FrmTratamento_ISSQN <> Nil) and (FrmTratamento_ISSQN.ativo = true) and (FrmTratamento_ISSQN.regra = 6) then
  begin
    FrmTratamento_ISSQN.EdtCodigo_Regra_ICMS_ME_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_ISSQN.EdtRegra_ICMS_ME_Saida.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_ISSQN.Close;
  end
  else if (FrmTratamento_ISSQN <> Nil) and (FrmTratamento_ISSQN.ativo = true) and (FrmTratamento_ISSQN.regra = 7) then
  begin
    FrmTratamento_ISSQN.EdtCodigo_Regra_ICMS_Nao_Contribuinte.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_ISSQN.EdtRegra_ICMS_Nao_Contribuinte.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_ISSQN.Close;
  end
  else if (FrmCadastro_Produto <> Nil) and (FrmCadastro_Produto.ativo = true) then
  begin
    FrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_ISSQN.Text:= qrychama_regraCodigo.AsString;
    FrmCadastro_Produto.EdtGrupo_Tributacao_ISSQN.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_ISSQN.Close;
  end;
end;

procedure TFrmChama_Regra_ISSQN.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Regra_ISSQN.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Regra_ISSQN.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Regra_ISSQN;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Regra_ISSQN.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Regra_ISSQN.Release;
end;

procedure TFrmChama_Regra_ISSQN.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
