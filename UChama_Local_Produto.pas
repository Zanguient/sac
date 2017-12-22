unit UChama_Local_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Local_Produto = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_local: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_localCodigo: TAutoIncField;
    qrychama_localCodigo_Empresa: TIntegerField;
    qrychama_localLocal: TStringField;
    qrychama_localData_Cadastro: TDateTimeField;
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
  FrmChama_Local_Produto: TFrmChama_Local_Produto;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Local_Produto, UCadastro_Produto,
  UConsulta_Produto_Cadastrado, UCadastro_Patrimonio, UConsulta_Patrimonio;

{$R *.dfm}

procedure TFrmChama_Local_Produto.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Local_Produto.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Local_Produto(EdtConsulta.Text);
end;

procedure TFrmChama_Local_Produto.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Local_Produto <> NIL) and (FrmCadastro_Local_Produto.ativo = true) and (FrmCadastro_Local_Produto.loc = 0) then
  begin
    FrmCadastro_Local_Produto.EdtCodigo.Text:= qrychama_localCodigo.AsString;
    FrmCadastro_Local_Produto.EdtLocal.Text:= qrychama_localLocal.AsString;
//    FrmCadastro_Local_Produto.EdtDetalhe.Text:= qrychama_localDetalhe.AsString;
    FrmCadastro_Local_Produto.MEdtData_Cadastro.Text:= qrychama_localData_Cadastro.AsString;
    FrmCadastro_Local_Produto.Pega_Produto_Local;

    FrmChama_Local_Produto.Close;
    FrmCadastro_Local_Produto.BBtnSalvar.Enabled:= true;
    FrmCadastro_Local_Produto.BBtnExcluir.Enabled:= true;
    FrmCadastro_Local_Produto.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Local_Produto.BBtnCancelar.Enabled:= true;
    FrmCadastro_Local_Produto.BBtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmCadastro_Local_Produto);
    FrmCadastro_Local_Produto.achei:= true;
  end
  else if (FrmCadastro_Local_Produto <> NIL) and (FrmCadastro_Local_Produto.ativo = true) and (FrmCadastro_Local_Produto.loc = 1) then
  begin
    FrmCadastro_Local_Produto.EdtCodigo_Local_Destino.Text:= qrychama_localCodigo.AsString;
    FrmCadastro_Local_Produto.EdtLocal_Destino.Text:= qrychama_localLocal.AsString;
    FrmChama_Local_Produto.Close;
  end
  else if (FrmCadastro_Produto <> nil) and (FrmCadastro_Produto.ativo = true) then
  begin
    FrmCadastro_Produto.EdtCodigo_Local.Text:= qrychama_localCodigo.AsString;
//    FrmCadastro_Produto.EdtLocal.Text:= qrychama_localLocal.AsString + ' - ' + qrychama_localDetalhe.AsString;
    FrmChama_Local_Produto.Close;
  end
  else if (FrmConsulta_Produto_Cadastrado <> nil) and (FrmConsulta_Produto_Cadastrado.ativo = true) then
  begin
    FrmConsulta_Produto_Cadastrado.EdtCodigo.Text:= qrychama_localCodigo.AsString;
    FrmConsulta_Produto_Cadastrado.EdtDescricao.Text:= qrychama_localLocal.AsString;
    FrmChama_Local_Produto.Close;
  end
  else if (FrmCadastro_Patrimonio <> nil) and (FrmCadastro_Patrimonio.ativo = true) then
  begin
    FrmCadastro_Patrimonio.EdtCodigo_Local.Text:= qrychama_localCodigo.AsString;
    FrmCadastro_Patrimonio.EdtLocal.Text:= qrychama_localLocal.AsString;
    FrmChama_Local_Produto.Close;
  end
  else if (FrmConsulta_Patrimonio <> nil) and (FrmConsulta_Patrimonio.ativo = true) then
  begin
    FrmConsulta_Patrimonio.EdtCodigo.Text:= qrychama_localCodigo.AsString;
    FrmConsulta_Patrimonio.EdtDescricao.Text:= qrychama_localLocal.AsString;
    FrmChama_Local_Produto.Close;
  end;
end;

procedure TFrmChama_Local_Produto.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Local_Produto.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Local_Produto.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Local_Produto(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Local_Produto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Local_Produto.Release;
end;

procedure TFrmChama_Local_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
