unit UChama_Tipo_Bem_Patrimonial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Tipo_Bem_Patrimonial = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_bem: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_bemCodigo: TAutoIncField;
    qrychama_bemDescricao: TStringField;
    qrychama_bemData_Cadastro: TDateTimeField;
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
  FrmChama_Tipo_Bem_Patrimonial: TFrmChama_Tipo_Bem_Patrimonial;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Setor, UCadastro_Funcionarios, UCadastro_Forn_Fab,
  UCadastro_Empresa, UCadastro_Transportadora, UNFE,
  UCadastro_Tipo_Bem_Patrimonial, UCadastro_Patrimonio, UConsulta_Patrimonio;

{$R *.dfm}

procedure TFrmChama_Tipo_Bem_Patrimonial.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Tipo_Bem_Patrimonial.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Tipo_Bem_Patrimonial;
end;

procedure TFrmChama_Tipo_Bem_Patrimonial.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Tipo_Bem_Patrimonial <> Nil) and (FrmCadastro_Tipo_Bem_Patrimonial.ativo = true) then
  begin
    FrmCadastro_Tipo_Bem_Patrimonial.EdtCodigo.Text:= qrychama_bemCodigo.AsString;
    FrmCadastro_Tipo_Bem_Patrimonial.EdtDescricao.Text:= qrychama_bemDescricao.AsString;
    FrmCadastro_Tipo_Bem_Patrimonial.MEdtData_Cadastro.Text:= qrychama_bemData_Cadastro.AsString;
    FrmChama_Tipo_Bem_Patrimonial.Close;
    FrmCadastro_Tipo_Bem_Patrimonial.BBtnSalvar.Enabled:= true;
    FrmCadastro_Tipo_Bem_Patrimonial.BBtnExcluir.Enabled:= true;
    FrmCadastro_Tipo_Bem_Patrimonial.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Tipo_Bem_Patrimonial.BBtnCancelar.Enabled:= true;
    FrmCadastro_Tipo_Bem_Patrimonial.BBtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmCadastro_Tipo_Bem_Patrimonial);
    FrmCadastro_Tipo_Bem_Patrimonial.achei:= true;
  end
  else if (FrmCadastro_Patrimonio <> NIl) and (FrmCadastro_Patrimonio.ativo = true) then
  begin
    FrmCadastro_Patrimonio.EdtCodigo_Tipo_Bem.Text:= qrychama_bemCodigo.AsString;
    FrmCadastro_Patrimonio.EdtTipo_Bem.Text:= qrychama_bemDescricao.AsString;
    FrmChama_Tipo_Bem_Patrimonial.Close;
  end
  else if (FrmConsulta_Patrimonio <> NIl) and (FrmConsulta_Patrimonio.ativo = true) then
  begin
    FrmConsulta_Patrimonio.EdtCodigo.Text:= qrychama_bemCodigo.AsString;
    FrmConsulta_Patrimonio.EdtDescricao.Text:= qrychama_bemDescricao.AsString;
    FrmChama_Tipo_Bem_Patrimonial.Close;
  end;
end;

procedure TFrmChama_Tipo_Bem_Patrimonial.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Tipo_Bem_Patrimonial.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Tipo_Bem_Patrimonial.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Tipo_Bem_Patrimonial;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Tipo_Bem_Patrimonial.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Tipo_Bem_Patrimonial.Release;
end;

procedure TFrmChama_Tipo_Bem_Patrimonial.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
