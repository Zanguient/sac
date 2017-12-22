unit UChama_Patrimonio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Patrimonio = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_bem: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_bemCodigo: TAutoIncField;
    qrychama_bemN_Bem: TStringField;
    qrychama_bemN_Identificacao: TStringField;
    qrychama_bemDescricao: TStringField;
    qrychama_bemCodigo_Marca: TIntegerField;
    qrychama_bemModelo: TStringField;
    qrychama_bemCodigo_Tipo_Bem: TIntegerField;
    qrychama_bemCodigo_Local_Bem: TIntegerField;
    qrychama_bemData_Aquisicao: TDateTimeField;
    qrychama_bemData_Baixa: TDateTimeField;
    qrychama_bemValor_Bem: TFloatField;
    qrychama_bemCodigo_Status: TIntegerField;
    qrychama_bemObservacao: TStringField;
    qrychama_bemData_Cadastro: TDateTimeField;
    qrychama_bemMarca: TStringField;
    qrychama_bemTipo_Bem: TStringField;
    qrychama_bemLocal: TStringField;
    qrychama_bemStatus: TStringField;
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
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Patrimonio: TFrmChama_Patrimonio;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Patrimonio;

{$R *.dfm}

procedure TFrmChama_Patrimonio.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Patrimonio.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Patrimonio;
end;

procedure TFrmChama_Patrimonio.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Patrimonio <> Nil) and (FrmCadastro_Patrimonio.ativo = true) then
  begin
    FrmCadastro_Patrimonio.EdtCodigo.Text:= qrychama_bemCodigo.AsString;
    FrmCadastro_Patrimonio.MEdtData_Cadastro.Text:= qrychama_bemData_Cadastro.AsString;
    FrmCadastro_Patrimonio.EdtN_Bem.Text:= qrychama_bemN_Bem.AsString;
    FrmCadastro_Patrimonio.EdtN_Identificacao.Text:= qrychama_bemN_Identificacao.AsString;
    FrmCadastro_Patrimonio.EdtDescricao.Text:= qrychama_bemDescricao.AsString;
    FrmCadastro_Patrimonio.EdtCodigo_Marca.Text:= qrychama_bemCodigo_Marca.AsString;
    FrmCadastro_Patrimonio.EdtMarca.Text:= qrychama_bemMarca.AsString;
    FrmCadastro_Patrimonio.EdtCodigo_Tipo_Bem.Text:= qrychama_bemCodigo_Tipo_Bem.AsString;
    FrmCadastro_Patrimonio.EdtTipo_Bem.Text:= qrychama_bemTipo_Bem.AsString;
    FrmCadastro_Patrimonio.EdtModelo.Text:= qrychama_bemModelo.AsString;
    FrmCadastro_Patrimonio.EdtCodigo_Local.Text:= qrychama_bemCodigo_Local_Bem.AsString;
    FrmCadastro_Patrimonio.EdtLocal.Text:= qrychama_bemLocal.AsString;
    FrmCadastro_Patrimonio.MEdtData_Aquisicao.Text:= qrychama_bemData_Aquisicao.AsString;
    FrmCadastro_Patrimonio.MEdtData_Baixa.Text:= qrychama_bemData_Baixa.AsString;

    Util.FormataFloat(2, FrmCadastro_Patrimonio.EdtValor, qrychama_bemValor_Bem.AsFloat);

    FrmCadastro_Patrimonio.EdtCodigo_Status.Text:= qrychama_bemCodigo_Status.AsString;
    FrmCadastro_Patrimonio.EdtStatus.Text:= qrychama_bemStatus.AsString;
    FrmCadastro_Patrimonio.MmoObservacoes.Text:= qrychama_bemObservacao.AsString;
    FrmChama_Patrimonio.Close;
    FrmCadastro_Patrimonio.BBtnSalvar.Enabled:= true;
    FrmCadastro_Patrimonio.BBtnExcluir.Enabled:= true;
    FrmCadastro_Patrimonio.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Patrimonio.BBtnCancelar.Enabled:= true;
    FrmCadastro_Patrimonio.BBtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmCadastro_Patrimonio);
    FrmCadastro_Patrimonio.achei:= true;
  end;
end;

procedure TFrmChama_Patrimonio.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Patrimonio.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Patrimonio.DBGrid1TitleClick(Column: TColumn);
begin
  if (qrychama_bem.Sort <> column.FieldName+ ' ASC') then
    qrychama_bem.Sort:=column.FieldName+ ' ASC'
  else
    qrychama_bem.sort:=column.fieldname+ ' DESC';
end;

procedure TFrmChama_Patrimonio.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Patrimonio;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Patrimonio.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Patrimonio.Release;
end;

procedure TFrmChama_Patrimonio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
