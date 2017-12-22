unit UChama_Unidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta;

type
  TFrmChama_Unidade = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_unidade: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_unidadeCodigo: TAutoIncField;
    qrychama_unidadeSigla: TStringField;
    qrychama_unidadeDescricao: TStringField;
    qrychama_unidadeData_Cadastro: TDateTimeField;
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
  FrmChama_Unidade: TFrmChama_Unidade;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Unidade_Medida , UCadastro_Produto;

{$R *.dfm}

procedure TFrmChama_Unidade.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Unidade.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Unidade(EdtConsulta.Text);
end;

procedure TFrmChama_Unidade.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Unidade_Medida <> NIl) and (FrmCadastro_Unidade_Medida.ativo = true) then
  begin
    FrmCadastro_Unidade_Medida.EdtCodigo.Text:= qrychama_unidadeCodigo.AsString;
    FrmCadastro_Unidade_Medida.EdtSigla.Text:= qrychama_unidadeSigla.AsString;
    FrmCadastro_Unidade_Medida.EdtDescricao.Text:= qrychama_unidadeDescricao.AsString;
    FrmCadastro_Unidade_Medida.MEdtData_Cadastro.Text:= qrychama_unidadeData_Cadastro.AsString;

    FrmChama_Unidade.Close;
    FrmCadastro_Unidade_Medida.BBtnSalvar.Enabled:= true;
    FrmCadastro_Unidade_Medida.BBtnExcluir.Enabled:= true;
    FrmCadastro_Unidade_Medida.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Unidade_Medida.BBtnCancelar.Enabled:= true;
    FrmCadastro_Unidade_Medida.BBtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmCadastro_Unidade_Medida);
    FrmCadastro_Unidade_Medida.achei:= true;
  end
  else if (FrmCadastro_Produto <> Nil) and (FrmCadastro_Produto.ativo = true) and (FrmCadastro_Produto.unidade = true) then
  begin
    FrmCadastro_Produto.EdtCodigo_Unidade.Text:= qrychama_unidadeCodigo.AsString;
    FrmCadastro_Produto.EdtUnidade.Text:= qrychama_unidadeDescricao.AsString;
    FrmChama_Unidade.Close;
  end
  else if (FrmCadastro_Produto <> Nil) and (FrmCadastro_Produto.ativo = true) and (FrmCadastro_Produto.unidade_volume = true) then
  begin
    FrmCadastro_Produto.EdtCodigo_Unidade_Volume.Text:= qrychama_unidadeCodigo.AsString;
    FrmCadastro_Produto.EdtUnidade_Volume.Text:= qrychama_unidadeDescricao.AsString;
    FrmChama_Unidade.Close;
  end;
end;

procedure TFrmChama_Unidade.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Unidade.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
    if (FrmCadastro_Unidade_Medida <> NIl) and (FrmCadastro_Unidade_Medida.ativo = true) then
    begin
      FrmCadastro_Unidade_Medida.EdtCodigo.Text:= qrychama_unidadeCodigo.AsString;
      FrmCadastro_Unidade_Medida.EdtSigla.Text:= qrychama_unidadeSigla.AsString;
      FrmCadastro_Unidade_Medida.EdtDescricao.Text:= qrychama_unidadeDescricao.AsString;
      FrmCadastro_Unidade_Medida.MEdtData_Cadastro.Text:= qrychama_unidadeData_Cadastro.AsString;
      FrmChama_Unidade.Close;
      FrmCadastro_Unidade_Medida.BBtnSalvar.Enabled:= true;
      FrmCadastro_Unidade_Medida.BBtnExcluir.Enabled:= true;
      FrmCadastro_Unidade_Medida.BBtnPesquisar.Enabled:= true;
      FrmCadastro_Unidade_Medida.BBtnCancelar.Enabled:= true;
      Util.Habilita_Campos(FrmCadastro_Unidade_Medida);
      achei:= true;
    end
    else if (FrmCadastro_Produto <> Nil) and (FrmCadastro_Produto.ativo = true) and (FrmCadastro_Produto.unidade = true) then
    begin
      FrmCadastro_Produto.EdtCodigo_Unidade.Text:= qrychama_unidadeCodigo.AsString;
      FrmCadastro_Produto.EdtUnidade.Text:= qrychama_unidadeSigla.AsString;
      FrmChama_Unidade.Close;
    end
    else if (FrmCadastro_Produto <> Nil) and (FrmCadastro_Produto.ativo = true) and (FrmCadastro_Produto.unidade_volume = true) then
    begin
      FrmCadastro_Produto.EdtCodigo_Unidade_Volume.Text:= qrychama_unidadeCodigo.AsString;
      FrmCadastro_Produto.EdtUnidade_Volume.Text:= qrychama_unidadeSigla.AsString;
      FrmChama_Unidade.Close;
    end;
    end;
end;

procedure TFrmChama_Unidade.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Unidade(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Unidade.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Unidade.Release;
end;

procedure TFrmChama_Unidade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
