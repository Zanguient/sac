unit UChama_Regra_COFINS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Regra_Cofins = class(TForm)
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
  FrmChama_Regra_Cofins: TFrmChama_Regra_Cofins;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, URegra_COFINS, UTratamento_COFINS, UCadastro_Produto,
  UCadastro_Grupo_Produto;

{$R *.dfm}

procedure TFrmChama_Regra_Cofins.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Regra_Cofins.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Regra_COFINS;
end;

procedure TFrmChama_Regra_Cofins.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmRegra_COFINS <> Nil) and (FrmRegra_COFINS.ativo = true) then
  begin
    FrmRegra_COFINS.EdtCodigo.Text:= qrychama_regraCodigo.AsString;
    FrmRegra_COFINS.MEdtData_Cadastro.Text:= qrychama_regraData_Cadastro.AsString;
    FrmRegra_COFINS.EdtDescricao.Text:= qrychama_regraDescricao.AsString;
    FrmRegra_COFINS.EdtAliquota.Text:= qrychama_regraAliquota.AsString;

    if (qrychama_regraTipo_Recolhimento.AsString = 'NORMAL') then
      FrmRegra_COFINS.RGTipo_Recolhimento.ItemIndex:= 0
    else
      FrmRegra_COFINS.RGTipo_Recolhimento.ItemIndex:= 1;

    if (qrychama_regraBase_Reduzida.AsString = 'SIM') then
      FrmRegra_COFINS.RGBase_Reduzida.ItemIndex:= 0
    else
      FrmRegra_COFINS.RGBase_Reduzida.ItemIndex:= 1;

    if (qrychama_regraBase_Acrescida.AsString = 'SIM') then
      FrmRegra_COFINS.RGBase_Acrescida.ItemIndex:= 0
    else
      FrmRegra_COFINS.RGBase_Acrescida.ItemIndex:= 1;

    FrmRegra_COFINS.EdtPercentual_Base_Calculo_Reduzida.Text:= qrychama_regraPercentual_BC_Reduzida.AsString;
    FrmRegra_COFINS.EdtPercentual_Base_Calculo_Acrescida.Text:= qrychama_regraPercentual_BC_Acrescida.AsString;
    FrmRegra_COFINS.EdtCodigo_Situacao_Tributaria.Text:= qrychama_regraCodigo_Situacao_Tributaria.AsString;
    FrmRegra_COFINS.EdtSituacao_Tributaria.Text:= qrychama_regraCodigo_Situacao.AsString + ' - ' + qrychama_regraSituacao.AsString;
    FrmRegra_COFINS.CBTipo_Calculo.Text:= qrychama_regraTipo_Calculo.AsString;
    FrmChama_Regra_Cofins.Close;
    FrmRegra_COFINS.BBtnSalvar.Enabled:= true;
    FrmRegra_COFINS.BBtnExcluir.Enabled:= true;
    FrmRegra_COFINS.BBtnPesquisar.Enabled:= true;
    FrmRegra_COFINS.BBtnCancelar.Enabled:= true;
    FrmRegra_COFINS.BbtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmRegra_COFINS);
    FrmRegra_COFINS.achei:= true;
  end
  else if (FrmTratamento_COFINS <> Nil) and (FrmTratamento_COFINS.ativo = true) and (FrmTratamento_COFINS.regra = 1) then
  begin
    FrmTratamento_COFINS.EdtCodigo_Regra_COFINS_EN_Entrada.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_COFINS.EdtRegra_COFINS_EN_Entrada.Text:= qrychama_regraDescricao.AsString;

    FrmTratamento_COFINS.EdtCodigo_Regra_COFINS_EPP_Entrada.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_COFINS.EdtRegra_COFINS_EPP_Entrada.Text:= qrychama_regraDescricao.AsString;

    FrmTratamento_COFINS.EdtCodigo_Regra_COFINS_ME_Entrada.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_COFINS.EdtRegra_COFINS_ME_Entrada.Text:= qrychama_regraDescricao.AsString;

    FrmTratamento_COFINS.EdtCodigo_Regra_COFINS_EN_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_COFINS.EdtRegra_COFINS_EN_Saida.Text:= qrychama_regraDescricao.AsString;

    FrmTratamento_COFINS.EdtCodigo_Regra_COFINS_EPP_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_COFINS.EdtRegra_COFINS_EPP_Saida.Text:= qrychama_regraDescricao.AsString;

    FrmTratamento_COFINS.EdtCodigo_Regra_COFINS_ME_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_COFINS.EdtRegra_COFINS_ME_Saida.Text:= qrychama_regraDescricao.AsString;

    //FrmTratamento_COFINS.EdtCodigo_Regra_COFINS_Nao_Contribuinte.Text:= qrychama_regraCodigo.AsString;
    //FrmTratamento_COFINS.EdtRegra_COFINS_Nao_Contribuinte.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_Cofins.Close;
  end
  else if (FrmTratamento_COFINS <> Nil) and (FrmTratamento_COFINS.ativo = true) and (FrmTratamento_COFINS.regra = 2) then
  begin
    FrmTratamento_COFINS.EdtCodigo_Regra_COFINS_EPP_Entrada.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_COFINS.EdtRegra_COFINS_EPP_Entrada.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_Cofins.Close;
  end
  else if (FrmTratamento_COFINS <> Nil) and (FrmTratamento_COFINS.ativo = true) and (FrmTratamento_COFINS.regra = 3) then
  begin
    FrmTratamento_COFINS.EdtCodigo_Regra_COFINS_ME_Entrada.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_COFINS.EdtRegra_COFINS_ME_Entrada.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_Cofins.Close;
  end
  else if (FrmTratamento_COFINS <> Nil) and (FrmTratamento_COFINS.ativo = true) and (FrmTratamento_COFINS.regra = 4) then
  begin
    FrmTratamento_COFINS.EdtCodigo_Regra_COFINS_EN_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_COFINS.EdtRegra_COFINS_EN_Saida.Text:= qrychama_regraDescricao.AsString;

    FrmTratamento_COFINS.EdtCodigo_Regra_COFINS_EPP_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_COFINS.EdtRegra_COFINS_EPP_Saida.Text:= qrychama_regraDescricao.AsString;

    FrmTratamento_COFINS.EdtCodigo_Regra_COFINS_ME_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_COFINS.EdtRegra_COFINS_ME_Saida.Text:= qrychama_regraDescricao.AsString;

    FrmChama_Regra_Cofins.Close;
  end
  else if (FrmTratamento_COFINS <> Nil) and (FrmTratamento_COFINS.ativo = true) and (FrmTratamento_COFINS.regra = 5) then
  begin
    FrmTratamento_COFINS.EdtCodigo_Regra_COFINS_EPP_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_COFINS.EdtRegra_COFINS_EPP_Saida.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_Cofins.Close;
  end
  else if (FrmTratamento_COFINS <> Nil) and (FrmTratamento_COFINS.ativo = true) and (FrmTratamento_COFINS.regra = 6) then
  begin
    FrmTratamento_COFINS.EdtCodigo_Regra_COFINS_ME_Saida.Text:= qrychama_regraCodigo.AsString;
    FrmTratamento_COFINS.EdtRegra_COFINS_ME_Saida.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_Cofins.Close;
  end
  else if (FrmTratamento_COFINS <> Nil) and (FrmTratamento_COFINS.ativo = true) and (FrmTratamento_COFINS.regra = 7) then
  begin
    //FrmTratamento_COFINS.EdtCodigo_Regra_COFINS_Nao_Contribuinte.Text:= qrychama_regraCodigo.AsString;
    //FrmTratamento_COFINS.EdtRegra_COFINS_Nao_Contribuinte.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_Cofins.Close;
  end
  else if (FrmCadastro_Produto <> Nil) and (FrmCadastro_Produto.ativo = true) then
  begin
    FrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_COFINS.Text:= qrychama_regraCodigo.AsString;
    FrmCadastro_Produto.EdtGrupo_Tributacao_COFINS.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_COFINS.Close;
  end
  else if (FrmCadastro_Grupo_Produto <> Nil) and (FrmCadastro_Grupo_Produto.ativo = true) then
  begin
    FrmCadastro_Grupo_Produto.EdtCodigo_Grupo_COFINS.Text:= qrychama_regraCodigo.AsString;
    FrmCadastro_Grupo_Produto.EdtGrupo_COFINS.Text:= qrychama_regraDescricao.AsString;
    FrmChama_Regra_COFINS.Close;
  end;
end;

procedure TFrmChama_Regra_Cofins.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Regra_Cofins.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Regra_Cofins.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Regra_COFINS;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Regra_Cofins.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Regra_Cofins.Release;
end;

procedure TFrmChama_Regra_Cofins.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
