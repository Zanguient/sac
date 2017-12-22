unit UChama_Tratamento_PIS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Tratamento_PIS = class(TForm)
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
    qrychama_tratamentoCodigo: TIntegerField;
    qrychama_tratamentoDescricao: TStringField;
    qrychama_tratamentoData_Cadastro: TDateTimeField;
    qrychama_tratamentoCodigo_1: TIntegerField;
    qrychama_tratamentoEntrada_Regra_EN: TIntegerField;
    qrychama_tratamentoEntrada_Regra_EPP: TIntegerField;
    qrychama_tratamentoEntrada_Regra_ME: TIntegerField;
    qrychama_tratamentoSaida_Regra_EN: TIntegerField;
    qrychama_tratamentoSaida_Regra_EPP: TIntegerField;
    qrychama_tratamentoSaida_Regra_ME: TIntegerField;
    qrychama_tratamentoDescricao_1: TStringField;
    qrychama_tratamentoDescricao_2: TStringField;
    qrychama_tratamentoDescricao_3: TStringField;
    qrychama_tratamentoDescricao_4: TStringField;
    qrychama_tratamentoDescricao_5: TStringField;
    qrychama_tratamentoDescricao_6: TStringField;
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
  FrmChama_Tratamento_PIS: TFrmChama_Tratamento_PIS;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UTratamento_PIS, UCadastro_Grupo_Produto_Tributacao_PIS,
  UCadastro_Produto, UCadastro_Grupo_Produto;

{$R *.dfm}

procedure TFrmChama_Tratamento_PIS.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Tratamento_PIS.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Tratamento_PIS;
end;

procedure TFrmChama_Tratamento_PIS.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmTratamento_PIS <> NIl) and (FrmTratamento_PIS.ativo = true) then
  begin
    FrmTratamento_PIS.EdtCodigo.Text:= qrychama_tratamentoCodigo.AsString;
    FrmTratamento_PIS.MEdtData_Cadastro.Text:= qrychama_tratamentoData_Cadastro.AsString;
    FrmTratamento_PIS.EdtDescricao.Text:= qrychama_tratamentoDescricao.AsString;

    FrmTratamento_PIS.EdtCodigo_Regra_PIS_EN_Entrada.Text:= qrychama_tratamentoEntrada_Regra_EN.AsString;
    FrmTratamento_PIS.EdtRegra_PIS_EN_Entrada.Text:= qrychama_tratamentoDescricao_1.AsString;

    FrmTratamento_PIS.EdtCodigo_Regra_PIS_EPP_Entrada.Text:= qrychama_tratamentoEntrada_Regra_EPP.AsString;
    FrmTratamento_PIS.EdtRegra_PIS_EPP_Entrada.Text:= qrychama_tratamentoDescricao_2.AsString;

    FrmTratamento_PIS.EdtCodigo_Regra_PIS_ME_Entrada.Text:= qrychama_tratamentoEntrada_Regra_ME.AsString;
    FrmTratamento_PIS.EdtRegra_PIS_ME_Entrada.Text:= qrychama_tratamentoDescricao_3.AsString;

    FrmTratamento_PIS.EdtCodigo_Regra_PIS_EN_Saida.Text:= qrychama_tratamentoSaida_Regra_EN.AsString;
    FrmTratamento_PIS.EdtRegra_PIS_EN_Saida.Text:= qrychama_tratamentoDescricao_4.AsString;

    FrmTratamento_PIS.EdtCodigo_Regra_PIS_EPP_Saida.Text:= qrychama_tratamentoSaida_Regra_EPP.AsString;
    FrmTratamento_PIS.EdtRegra_PIS_EPP_Saida.Text:= qrychama_tratamentoDescricao_5.AsString;

    FrmTratamento_PIS.EdtCodigo_Regra_PIS_ME_Saida.Text:= qrychama_tratamentoSaida_Regra_ME.AsString;
    FrmTratamento_PIS.EdtRegra_PIS_ME_Saida.Text:= qrychama_tratamentoDescricao_6.AsString;

    FrmChama_Tratamento_PIS.Close;
    FrmTratamento_PIS.BBtnSalvar.Enabled:= true;
    FrmTratamento_PIS.BBtnExcluir.Enabled:= true;
    FrmTratamento_PIS.BBtnPesquisar.Enabled:= true;
    FrmTratamento_PIS.BBtnCancelar.Enabled:= true;
    FrmTratamento_PIS.BBtnNovo.Enabled:= false;
    FrmTratamento_PIS.PageControl2.TabIndex:= 0;
    Util.Habilita_Campos(FrmTratamento_PIS);
    FrmTratamento_PIS.achei:= true;
  end
  else if (FrmCadastro_Grupo_Produto <> Nil) and (FrmCadastro_Grupo_Produto.ativo = true) then
  begin
    FrmCadastro_Grupo_Produto.EdtCodigo_Grupo_PIS.Text:= qrychama_tratamentoCodigo.AsString;
    FrmCadastro_Grupo_Produto.EdtGrupo_PIS.Text:= qrychama_tratamentoDescricao.AsString;
    FrmChama_Tratamento_PIS.Close;
  end
  else if (FrmCadastro_Produto <> Nil) and (FrmCadastro_Produto.ativo = true) then
  begin
    FrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_PIS.Text:= qrychama_tratamentoCodigo.AsString;
    FrmCadastro_Produto.EdtGrupo_Tributacao_PIS.Text:= qrychama_tratamentoDescricao.AsString;
    FrmChama_Tratamento_PIS.Close;
  end
  else if (FrmCadastro_Grupo_Produto_Tributacao_PIS <> Nil) and (FrmCadastro_Grupo_Produto_Tributacao_PIS.ativo = true) then
  begin
    FrmCadastro_Grupo_Produto_Tributacao_PIS.EdtCodigo_Tratamento_PIS.Text:= qrychama_tratamentoCodigo.AsString;
    FrmCadastro_Grupo_Produto_Tributacao_PIS.EdtTratamento_PIS.Text:= qrychama_tratamentoDescricao.AsString;
    FrmChama_Tratamento_PIS.Close;
  end;
end;

procedure TFrmChama_Tratamento_PIS.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Tratamento_PIS.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Tratamento_PIS.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Tratamento_PIS;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Tratamento_PIS.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Tratamento_PIS.Release;
end;

procedure TFrmChama_Tratamento_PIS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
