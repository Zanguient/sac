unit UChama_Tipo_Documento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Tipo_Documento = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_tipo_documento: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_tipo_documentoCodigo: TAutoIncField;
    qrychama_tipo_documentoDescricao: TStringField;
    qrychama_tipo_documentoData_Cadastro: TDateTimeField;
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
  FrmChama_Tipo_Documento: TFrmChama_Tipo_Documento;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Tipo_Documento, ULancamento_Financeiro,
  UFechamento_Venda_PDV, UConsulta_Lancamentos_Financeiros,
  UConfiguracao_Sistema;

{$R *.dfm}

procedure TFrmChama_Tipo_Documento.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Tipo_Documento.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Tipo_Documento(EdtConsulta.Text);
end;

procedure TFrmChama_Tipo_Documento.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Tipo_Documento <> Nil) and (FrmCadastro_Tipo_Documento.ativo = true) then
  begin
    FrmCadastro_Tipo_Documento.EdtCodigo.Text:= qrychama_tipo_documentoCodigo.AsString;
    FrmCadastro_Tipo_Documento.EdtDescricao.Text:= qrychama_tipo_documentoDescricao.AsString;
    FrmCadastro_Tipo_Documento.MEdtData_Cadastro.Text:= qrychama_tipo_documentoData_Cadastro.AsString;
    FrmChama_Tipo_Documento.Close;
    FrmCadastro_Tipo_Documento.BBtnSalvar.Enabled:= true;
    FrmCadastro_Tipo_Documento.BBtnExcluir.Enabled:= true;
    FrmCadastro_Tipo_Documento.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Tipo_Documento.BBtnCancelar.Enabled:= true;
    FrmCadastro_Tipo_Documento.BBtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmCadastro_Tipo_Documento);
    FrmCadastro_Tipo_Documento.achei:= true;
  end
  else if (FrmLancamento_Financeiro <> NIl) and (FrmLancamento_Financeiro.ativo = true) then
  begin
    FrmLancamento_Financeiro.EdtCodigo_Tipo_Documento.Text:= qrychama_tipo_documentoCodigo.AsString;
    FrmLancamento_Financeiro.EdtTipo_Documento.Text:= qrychama_tipo_documentoDescricao.AsString;
    FrmChama_Tipo_Documento.Close;
  end
  else if (FrmConsulta_Lancamentos_Financeiros <> NIl) and (FrmConsulta_Lancamentos_Financeiros.ativo = true) then
  begin
    FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text:= qrychama_tipo_documentoCodigo.AsString;
    FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text:= qrychama_tipo_documentoDescricao.AsString;
    FrmChama_Tipo_Documento.Close;
  end
  else if (FrmConfiguracao_Sistema <> NIl) and (FrmConfiguracao_Sistema.ativo = true) and (FrmConfiguracao_Sistema.receber = true) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Tipo_Documento.Text:= qrychama_tipo_documentoCodigo.AsString;
    FrmConfiguracao_Sistema.EdtTipo_Documento.Text:= qrychama_tipo_documentoDescricao.AsString;
    FrmChama_Tipo_Documento.Close;
  end
  else if (FrmConfiguracao_Sistema <> NIl) and (FrmConfiguracao_Sistema.ativo = true) and (FrmConfiguracao_Sistema.receber = false) then
  begin
    FrmConfiguracao_Sistema.EdtCodigo_Tipo_Documento_Pagar.Text:= qrychama_tipo_documentoCodigo.AsString;
    FrmConfiguracao_Sistema.EdtTipo_Documento_Pagar.Text:= qrychama_tipo_documentoDescricao.AsString;
    FrmChama_Tipo_Documento.Close;
  end;
end;

procedure TFrmChama_Tipo_Documento.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Tipo_Documento.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Tipo_Documento.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Tipo_Documento(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Tipo_Documento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Tipo_Documento.Release;
end;

procedure TFrmChama_Tipo_Documento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
