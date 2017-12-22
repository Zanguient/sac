unit UChama_Tratamento_IPI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Tratamento_IPI = class(TForm)
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
  FrmChama_Tratamento_IPI: TFrmChama_Tratamento_IPI;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UTratamento_IPI, UCadastro_Grupo_Produto_Tributacao_IPI,
  UCadastro_Produto, UCadastro_Grupo_Produto;

{$R *.dfm}

procedure TFrmChama_Tratamento_IPI.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Tratamento_IPI.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Tratamento_IPI;
end;

procedure TFrmChama_Tratamento_IPI.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmTratamento_IPI <> NIl) and (FrmTratamento_IPI.ativo = true) then
  begin
    FrmTratamento_IPI.EdtCodigo.Text:= qrychama_tratamentoCodigo.AsString;
    FrmTratamento_IPI.MEdtData_Cadastro.Text:= qrychama_tratamentoData_Cadastro.AsString;
    FrmTratamento_IPI.EdtDescricao.Text:= qrychama_tratamentoDescricao.AsString;

    FrmTratamento_IPI.EdtCodigo_Regra_IPI_EN_Entrada.Text:= qrychama_tratamentoEntrada_Regra_EN.AsString;
    FrmTratamento_IPI.EdtRegra_IPI_EN_Entrada.Text:= qrychama_tratamentoDescricao_1.AsString;

    FrmTratamento_IPI.EdtCodigo_Regra_IPI_EPP_Entrada.Text:= qrychama_tratamentoEntrada_Regra_EPP.AsString;
    FrmTratamento_IPI.EdtRegra_IPI_EPP_Entrada.Text:= qrychama_tratamentoDescricao_2.AsString;

    FrmTratamento_IPI.EdtCodigo_Regra_IPI_ME_Entrada.Text:= qrychama_tratamentoEntrada_Regra_ME.AsString;
    FrmTratamento_IPI.EdtRegra_IPI_ME_Entrada.Text:= qrychama_tratamentoDescricao_3.AsString;

    FrmTratamento_IPI.EdtCodigo_Regra_IPI_EN_Saida.Text:= qrychama_tratamentoSaida_Regra_EN.AsString;
    FrmTratamento_IPI.EdtRegra_IPI_EN_Saida.Text:= qrychama_tratamentoDescricao_4.AsString;

    FrmTratamento_IPI.EdtCodigo_Regra_IPI_EPP_Saida.Text:= qrychama_tratamentoSaida_Regra_EPP.AsString;
    FrmTratamento_IPI.EdtRegra_IPI_EPP_Saida.Text:= qrychama_tratamentoDescricao_5.AsString;

    FrmTratamento_IPI.EdtCodigo_Regra_IPI_ME_Saida.Text:= qrychama_tratamentoSaida_Regra_ME.AsString;
    FrmTratamento_IPI.EdtRegra_IPI_ME_Saida.Text:= qrychama_tratamentoDescricao_6.AsString;

    FrmChama_Tratamento_IPI.Close;
    FrmTratamento_IPI.BBtnSalvar.Enabled:= true;
    FrmTratamento_IPI.BBtnExcluir.Enabled:= true;
    FrmTratamento_IPI.BBtnPesquisar.Enabled:= true;
    FrmTratamento_IPI.BBtnCancelar.Enabled:= true;
    FrmTratamento_IPI.BBtnNovo.Enabled:= false;
    FrmTratamento_IPI.PageControl2.TabIndex:= 0;
    Util.Habilita_Campos(FrmTratamento_IPI);
    FrmTratamento_IPI.achei:= true;
  end
  else if (FrmCadastro_Grupo_Produto <> Nil) and (FrmCadastro_Grupo_Produto.ativo = true) then
  begin
    FrmCadastro_Grupo_Produto.EdtCodigo_Grupo_IPI.Text:= qrychama_tratamentoCodigo.AsString;
    FrmCadastro_Grupo_Produto.EdtGrupo_IPI.Text:= qrychama_tratamentoDescricao.AsString;
    FrmChama_Tratamento_IPI.Close;
  end
  else if (FrmCadastro_Produto <> Nil) and (FrmCadastro_Produto.ativo = true) then
  begin
    FrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_IPI.Text:= qrychama_tratamentoCodigo.AsString;
    FrmCadastro_Produto.EdtGrupo_Tributacao_IPI.Text:= qrychama_tratamentoDescricao.AsString;
    FrmChama_Tratamento_IPI.Close;
  end
  else if (FrmCadastro_Grupo_Produto_Tributacao_IPI <> Nil) and (FrmCadastro_Grupo_Produto_Tributacao_IPI.ativo = true) then
  begin
    FrmCadastro_Grupo_Produto_Tributacao_IPI.EdtCodigo_Tratamento_IPI.Text:= qrychama_tratamentoCodigo.AsString;
    FrmCadastro_Grupo_Produto_Tributacao_IPI.EdtTratamento_IPI.Text:= qrychama_tratamentoDescricao.AsString;
    FrmChama_Tratamento_IPI.Close;
  end;
end;

procedure TFrmChama_Tratamento_IPI.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Tratamento_IPI.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Tratamento_IPI.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Tratamento_IPI;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Tratamento_IPI.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Tratamento_IPI.Release;
end;

procedure TFrmChama_Tratamento_IPI.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
