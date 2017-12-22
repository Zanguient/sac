unit UChama_Tratamento_ISSQN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Tratamento_ISSQN = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_tratamento: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_tratamentoCodigo: TAutoIncField;
    qrychama_tratamentoDescricao: TStringField;
    qrychama_tratamentoOrigem: TStringField;
    qrychama_tratamentoDestino: TStringField;
    qrychama_tratamentoEntrada_Regra_EN: TIntegerField;
    qrychama_tratamentoEntrada_Regra_EPP: TIntegerField;
    qrychama_tratamentoEntrada_Regra_ME: TIntegerField;
    qrychama_tratamentoSaida_Regra_EN: TIntegerField;
    qrychama_tratamentoSaida_Regra_EPP: TIntegerField;
    qrychama_tratamentoSaida_Regra_ME: TIntegerField;
    qrychama_tratamentoRegra_Nao_Contribuinte: TIntegerField;
    qrychama_tratamentoData_Cadastro: TDateTimeField;
    qrychama_tratamentoDescricao_1: TStringField;
    qrychama_tratamentoDescricao_2: TStringField;
    qrychama_tratamentoDescricao_3: TStringField;
    qrychama_tratamentoDescricao_4: TStringField;
    qrychama_tratamentoDescricao_5: TStringField;
    qrychama_tratamentoDescricao_6: TStringField;
    qrychama_tratamentoDescricao_7: TStringField;
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
  FrmChama_Tratamento_ISSQN: TFrmChama_Tratamento_ISSQN;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Grupo_Produto_Tributacao_PIS, UTratamento_ISSQN;

{$R *.dfm}

procedure TFrmChama_Tratamento_ISSQN.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Tratamento_ISSQN.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Tratamento_ISSQN;
end;

procedure TFrmChama_Tratamento_ISSQN.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmTratamento_ISSQN <> NIl) and (FrmTratamento_ISSQN.ativo = true) then
  begin
    FrmTratamento_ISSQN.EdtCodigo.Text:= qrychama_tratamentoCodigo.AsString;
    FrmTratamento_ISSQN.MEdtData_Cadastro.Text:= qrychama_tratamentoData_Cadastro.AsString;
    FrmTratamento_ISSQN.EdtDescricao.Text:= qrychama_tratamentoDescricao.AsString;
    FrmTratamento_ISSQN.CmbOrigem.Text:= qrychama_tratamentoOrigem.AsString;
    FrmTratamento_ISSQN.CmbDestino.Text:= qrychama_tratamentoDestino.AsString;

    FrmTratamento_ISSQN.EdtCodigo_Regra_ICMS_EN_Entrada.Text:= qrychama_tratamentoEntrada_Regra_EN.AsString;
    FrmTratamento_ISSQN.EdtCodigo_Regra_ICMS_EPP_Entrada.Text:= qrychama_tratamentoEntrada_Regra_EPP.AsString;
    FrmTratamento_ISSQN.EdtCodigo_Regra_ICMS_ME_Entrada.Text:= qrychama_tratamentoEntrada_Regra_ME.AsString;
    FrmTratamento_ISSQN.EdtCodigo_Regra_ICMS_EN_Saida.Text:= qrychama_tratamentoSaida_Regra_EN.AsString;
    FrmTratamento_ISSQN.EdtCodigo_Regra_ICMS_EPP_Saida.Text:= qrychama_tratamentoSaida_Regra_EPP.AsString;
    FrmTratamento_ISSQN.EdtCodigo_Regra_ICMS_ME_Saida.Text:= qrychama_tratamentoSaida_Regra_ME.AsString;
    FrmTratamento_ISSQN.EdtCodigo_Regra_ICMS_Nao_Contribuinte.Text:= qrychama_tratamentoRegra_Nao_Contribuinte.AsString;

    FrmTratamento_ISSQN.EdtRegra_ICMS_EN_Entrada.Text:= qrychama_tratamentoDescricao_1.AsString;
    FrmTratamento_ISSQN.EdtRegra_ICMS_EPP_Entrada.Text:= qrychama_tratamentoDescricao_2.AsString;
    FrmTratamento_ISSQN.EdtRegra_ICMS_ME_Entrada.Text:= qrychama_tratamentoDescricao_3.AsString;
    FrmTratamento_ISSQN.EdtRegra_ICMS_EN_Saida.Text:= qrychama_tratamentoDescricao_4.AsString;
    FrmTratamento_ISSQN.EdtRegra_ICMS_EPP_Saida.Text:= qrychama_tratamentoDescricao_5.AsString;
    FrmTratamento_ISSQN.EdtRegra_ICMS_ME_Saida.Text:= qrychama_tratamentoDescricao_6.AsString;
    FrmTratamento_ISSQN.EdtRegra_ICMS_Nao_Contribuinte.Text:= qrychama_tratamentoDescricao_7.AsString;
    FrmChama_Tratamento_ISSQN.Close;
    FrmTratamento_ISSQN.BBtnSalvar.Enabled:= true;
    FrmTratamento_ISSQN.BBtnExcluir.Enabled:= true;
    FrmTratamento_ISSQN.BBtnPesquisar.Enabled:= true;
    FrmTratamento_ISSQN.BBtnCancelar.Enabled:= true;
    FrmTratamento_ISSQN.PageControl2.TabIndex:= 0;
    Util.Habilita_Campos(FrmTratamento_ISSQN);
    FrmTratamento_ISSQN.achei:= true;
  {end
  else if (FrmCadastro_Grupo_Produto_Tributacao_PIS <> Nil) and (FrmCadastro_Grupo_Produto_Tributacao_PIS.ativo = true) then
  begin
    FrmCadastro_Grupo_Produto_Tributacao_PIS.EdtCodigo_Tratamento_PIS.Text:= qrychama_tratamentoCodigo.AsString;
    FrmCadastro_Grupo_Produto_Tributacao_PIS.EdtTratamento_PIS.Text:= qrychama_tratamentoDescricao.AsString;
    FrmChama_Tratamento_PIS.Close; }
  end;
end;

procedure TFrmChama_Tratamento_ISSQN.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Tratamento_ISSQN.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Tratamento_ISSQN.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    Consulta.Chama_Tratamento_ISSQN;
end;

procedure TFrmChama_Tratamento_ISSQN.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Tratamento_ISSQN.Release;
end;

procedure TFrmChama_Tratamento_ISSQN.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
