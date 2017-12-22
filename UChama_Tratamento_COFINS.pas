unit UChama_Tratamento_COFINS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Tratamento_COFINS = class(TForm)
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
  FrmChama_Tratamento_COFINS: TFrmChama_Tratamento_COFINS;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UTratamento_COFINS, UCadastro_Grupo_Produto_Tributacao_COFINS,
  UCadastro_Grupo_Produto, UCadastro_Produto;

{$R *.dfm}

procedure TFrmChama_Tratamento_COFINS.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Tratamento_COFINS.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Tratamento_COFINS;
end;

procedure TFrmChama_Tratamento_COFINS.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmTratamento_COFINS <> NIl) and (FrmTratamento_COFINS.ativo = true) then
  begin
    FrmTratamento_COFINS.EdtCodigo.Text:= qrychama_tratamentoCodigo.AsString;
    FrmTratamento_COFINS.MEdtData_Cadastro.Text:= qrychama_tratamentoData_Cadastro.AsString;
    FrmTratamento_COFINS.EdtDescricao.Text:= qrychama_tratamentoDescricao.AsString;

    FrmTratamento_COFINS.EdtCodigo_Regra_COFINS_EN_Entrada.Text:= qrychama_tratamentoEntrada_Regra_EN.AsString;
    FrmTratamento_COFINS.EdtRegra_COFINS_EN_Entrada.Text:= qrychama_tratamentoDescricao_1.AsString;

    FrmTratamento_COFINS.EdtCodigo_Regra_COFINS_EPP_Entrada.Text:= qrychama_tratamentoEntrada_Regra_EPP.AsString;
    FrmTratamento_COFINS.EdtRegra_COFINS_EPP_Entrada.Text:= qrychama_tratamentoDescricao_2.AsString;

    FrmTratamento_COFINS.EdtCodigo_Regra_COFINS_ME_Entrada.Text:= qrychama_tratamentoEntrada_Regra_ME.AsString;
    FrmTratamento_COFINS.EdtRegra_COFINS_ME_Entrada.Text:= qrychama_tratamentoDescricao_3.AsString;

    FrmTratamento_COFINS.EdtCodigo_Regra_COFINS_EN_Saida.Text:= qrychama_tratamentoSaida_Regra_EN.AsString;
    FrmTratamento_COFINS.EdtRegra_COFINS_EN_Saida.Text:= qrychama_tratamentoDescricao_4.AsString;

    FrmTratamento_COFINS.EdtCodigo_Regra_COFINS_EPP_Saida.Text:= qrychama_tratamentoSaida_Regra_EPP.AsString;
    FrmTratamento_COFINS.EdtRegra_COFINS_EPP_Saida.Text:= qrychama_tratamentoDescricao_5.AsString;

    FrmTratamento_COFINS.EdtCodigo_Regra_COFINS_ME_Saida.Text:= qrychama_tratamentoSaida_Regra_ME.AsString;
    FrmTratamento_COFINS.EdtRegra_COFINS_ME_Saida.Text:= qrychama_tratamentoDescricao_6.AsString;

    FrmChama_Tratamento_COFINS.Close;
    FrmTratamento_COFINS.BBtnSalvar.Enabled:= true;
    //FrmTratamento_COFINS.BBtnSalvar_Itens.Enabled:= true;
    FrmTratamento_COFINS.BBtnExcluir.Enabled:= true;
    //FrmTratamento_COFINS.BBtnExcluir_Item.Enabled:= true;
    FrmTratamento_COFINS.BBtnPesquisar.Enabled:= true;
    FrmTratamento_COFINS.BBtnCancelar.Enabled:= true;
    FrmTratamento_COFINS.BBtnNovo.Enabled:= false;
    FrmTratamento_COFINS.PageControl2.TabIndex:= 0;
    Util.Habilita_Campos(FrmTratamento_COFINS);
    FrmTratamento_COFINS.achei:= true;
  end
  else if (FrmCadastro_Grupo_Produto <> Nil) and (FrmCadastro_Grupo_Produto.ativo = true) then
  begin
    FrmCadastro_Grupo_Produto.EdtCodigo_Grupo_COFINS.Text:= qrychama_tratamentoCodigo.AsString;
    FrmCadastro_Grupo_Produto.EdtGrupo_COFINS.Text:= qrychama_tratamentoDescricao.AsString;
    FrmChama_Tratamento_COFINS.Close;
  end
  else if (FrmCadastro_Produto <> Nil) and (FrmCadastro_Produto.ativo = true) then
  begin
    FrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_COFINS.Text:= qrychama_tratamentoCodigo.AsString;
    FrmCadastro_Produto.EdtGrupo_Tributacao_COFINS.Text:= qrychama_tratamentoDescricao.AsString;
    FrmChama_Tratamento_COFINS.Close;
  end
  else if (FrmCadastro_Grupo_Produto_Tributacao_COFINS <> Nil) and (FrmCadastro_Grupo_Produto_Tributacao_COFINS.ativo = true) then
  begin
    FrmCadastro_Grupo_Produto_Tributacao_COFINS.EdtCodigo_Tratamento_COFINS.Text:= qrychama_tratamentoCodigo.AsString;
    FrmCadastro_Grupo_Produto_Tributacao_COFINS.EdtTratamento_COFINS.Text:= qrychama_tratamentoDescricao.AsString;
    FrmChama_Tratamento_COFINS.Close;
  end;
end;

procedure TFrmChama_Tratamento_COFINS.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Tratamento_COFINS.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Tratamento_COFINS.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Tratamento_COFINS;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Tratamento_COFINS.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Tratamento_COFINS.Release;
end;

procedure TFrmChama_Tratamento_COFINS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
