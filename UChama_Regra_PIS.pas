unit UChama_Regra_PIS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Regra_PIS = class(TForm)
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
    qrychama_regraBase_Reduzida: TStringField;
    qrychama_regraPercentual_BC_Reduzida: TStringField;
    qrychama_regraBase_Acrescida: TStringField;
    qrychama_regraPercentual_BC_Acrescida: TStringField;
    qrychama_regraCodigo_Situacao_Tributaria: TIntegerField;
    qrychama_regraCodigo_Situacao: TStringField;
    qrychama_regraSituacao: TStringField;
    qrychama_regraTipo_Calculo: TStringField;
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
  FrmChama_Regra_PIS: TFrmChama_Regra_PIS;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, URegra_PIS, UTratamento_PIS, UCadastro_Produto,
  UCadastro_Grupo_Produto;

{$R *.dfm}

procedure TFrmChama_Regra_PIS.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Regra_PIS.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Regra_PIS;
end;

procedure TFrmChama_Regra_PIS.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmRegra_PIS <> Nil) and (FrmRegra_PIS.ativo = true) then
  begin
    FrmRegra_PIS.EdtCodigo.Text:= qrychama_regraCodigo.AsString;
    FrmRegra_PIS.MEdtData_Cadastro.Text:= qrychama_regraData_Cadastro.AsString;
    FrmRegra_PIS.EdtDescricao.Text:= qrychama_regraDescricao.AsString;
    FrmRegra_PIS.EdtAliquota.Text:= qrychama_regraAliquota.AsString;

    if (qrychama_regraTipo_Recolhimento.AsString = 'NORMAL') then
      FrmRegra_PIS.RGTipo_Recolhimento.ItemIndex:= 0
    else
      FrmRegra_PIS.RGTipo_Recolhimento.ItemIndex:= 1;

    if (qrychama_regraBase_Reduzida.AsString = 'SIM') then
      FrmRegra_PIS.RGBase_Reduzida.ItemIndex:= 0
    else
      FrmRegra_PIS.RGBase_Reduzida.ItemIndex:= 1;

    if (qrychama_regraBase_Acrescida.AsString = 'SIM') then
      FrmRegra_PIS.RGBase_Acrescida.ItemIndex:= 0
    else
      FrmRegra_PIS.RGBase_Acrescida.ItemIndex:= 1;

    FrmRegra_PIS.EdtPercentual_Base_Calculo_Reduzida.Text:= qrychama_regraPercentual_BC_Reduzida.AsString;
    FrmRegra_PIS.EdtPercentual_Base_Calculo_Acrescida.Text:= qrychama_regraPercentual_BC_Acrescida.AsString;
    FrmRegra_PIS.EdtCodigo_Situacao_Tributaria.Text:= qrychama_regraCodigo_Situacao_Tributaria.AsString;
    FrmRegra_PIS.EdtSituacao_Tributaria.Text:= qrychama_regraCodigo_Situacao.AsString + ' - ' + qrychama_regraSituacao.AsString;
    FrmRegra_PIS.CBTipo_Calculo.Text:= qrychama_regraTipo_Calculo.AsString;
    FrmChama_Regra_PIS.Close;
    FrmRegra_PIS.BBtnSalvar.Enabled:= true;
    FrmRegra_PIS.BBtnExcluir.Enabled:= true;
    FrmRegra_PIS.BBtnPesquisar.Enabled:= true;
    FrmRegra_PIS.BBtnCancelar.Enabled:= true;
    FrmRegra_PIS.BBtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmRegra_PIS);
    FrmRegra_PIS.achei:= true;
  end
  else if (FrmTratamento_PIS <> Nil) and (FrmTratamento_PIS.ativo = true) and (FrmTratamento_PIS.regra = 1) then
  begin
    FrmTratamento_PIS.EdtCodigo_Regra_PIS_EN_Entrada.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_PIS.EdtRegra_PIS_EN_Entrada.Text:= qrychama_regraDescricao.AsString;

    FrmTratamento_PIS.EdtCodigo_Regra_PIS_EPP_Entrada.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_PIS.EdtRegra_PIS_EPP_Entrada.Text:= qrychama_regraDescricao.AsString;

    FrmTratamento_PIS.EdtCodigo_Regra_PIS_ME_Entrada.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_PIS.EdtRegra_PIS_ME_Entrada.Text:= qrychama_regraDescricao.AsString;

    FrmTratamento_PIS.EdtCodigo_Regra_PIS_EN_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_PIS.EdtRegra_PIS_EN_Saida.Text:= qrychama_regraDescricao.AsString;

    FrmTratamento_PIS.EdtCodigo_Regra_PIS_EPP_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_PIS.EdtRegra_PIS_EPP_Saida.Text:= qrychama_regraDescricao.AsString;

    FrmTratamento_PIS.EdtCodigo_Regra_PIS_ME_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_PIS.EdtRegra_PIS_ME_Saida.Text:= qrychama_regraDescricao.AsString;

    //FrmTratamento_PIS.EdtCodigo_Regra_PIS_Nao_Contribuinte.Text:= qrychama_regraCodigo.AsString;
    //FrmTratamento_PIS.EdtRegra_PIS_Nao_Contribuinte.Text:= qrychama_regraDescricao.AsString;

    FrmChama_Regra_PIS.Close;
  end
  else if (FrmTratamento_PIS <> Nil) and (FrmTratamento_PIS.ativo = true) and (FrmTratamento_PIS.regra = 2) then
  begin
    FrmTratamento_PIS.EdtCodigo_Regra_PIS_EPP_Entrada.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_PIS.EdtRegra_PIS_EPP_Entrada.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_PIS.Close;
  end
  else if (FrmTratamento_PIS <> Nil) and (FrmTratamento_PIS.ativo = true) and (FrmTratamento_PIS.regra = 3) then
  begin
    FrmTratamento_PIS.EdtCodigo_Regra_PIS_ME_Entrada.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_PIS.EdtRegra_PIS_ME_Entrada.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_PIS.Close;
  end
  else if (FrmTratamento_PIS <> Nil) and (FrmTratamento_PIS.ativo = true) and (FrmTratamento_PIS.regra = 4) then
  begin
    FrmTratamento_PIS.EdtCodigo_Regra_PIS_EN_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_PIS.EdtRegra_PIS_EN_Saida.Text:= qrychama_regraDescricao.AsString;

    FrmTratamento_PIS.EdtCodigo_Regra_PIS_EPP_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_PIS.EdtRegra_PIS_EPP_Saida.Text:= qrychama_regraDescricao.AsString;

    FrmTratamento_PIS.EdtCodigo_Regra_PIS_ME_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_PIS.EdtRegra_PIS_ME_Saida.Text:= qrychama_regraDescricao.AsString;

    FrmChama_Regra_PIS.Close;
  end
  else if (FrmTratamento_PIS <> Nil) and (FrmTratamento_PIS.ativo = true) and (FrmTratamento_PIS.regra = 5) then
  begin
    FrmTratamento_PIS.EdtCodigo_Regra_PIS_EPP_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_PIS.EdtRegra_PIS_EPP_Saida.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_PIS.Close;
  end
  else if (FrmTratamento_PIS <> Nil) and (FrmTratamento_PIS.ativo = true) and (FrmTratamento_PIS.regra = 6) then
  begin
    FrmTratamento_PIS.EdtCodigo_Regra_PIS_ME_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_PIS.EdtRegra_PIS_ME_Saida.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_PIS.Close;
  end
  else if (FrmTratamento_PIS <> Nil) and (FrmTratamento_PIS.ativo = true) and (FrmTratamento_PIS.regra = 7) then
  begin
    //FrmTratamento_PIS.EdtCodigo_Regra_PIS_Nao_Contribuinte.Text:= qrychama_regraCodigo.AsString;
    //FrmTratamento_PIS.EdtRegra_PIS_Nao_Contribuinte.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_PIS.Close;
  end
  else if (FrmCadastro_Produto <> Nil) and (FrmCadastro_Produto.ativo = true) then
  begin
    FrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_PIS.Text:= qrychama_regraCodigo.AsString;
    FrmCadastro_Produto.EdtGrupo_Tributacao_PIS.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_PIS.Close;
  end
  else if (FrmCadastro_Grupo_Produto <> Nil) and (FrmCadastro_Grupo_Produto.ativo = true) then
  begin
    FrmCadastro_Grupo_Produto.EdtCodigo_Grupo_PIS.Text:= qrychama_regraCodigo.AsString;
    FrmCadastro_Grupo_Produto.EdtGrupo_PIS.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_PIS.Close;
  end;
end;

procedure TFrmChama_Regra_PIS.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Regra_PIS.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Regra_PIS.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Regra_PIS;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Regra_PIS.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Regra_PIS.Release;
end;

procedure TFrmChama_Regra_PIS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
