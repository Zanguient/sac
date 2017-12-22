unit UChama_NCM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta;

type
  TFrmChama_NCM = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_ncm: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_ncmCodigo: TAutoIncField;
    qrychama_ncmCodigo_NCM: TStringField;
    qrychama_ncmDescricao: TStringField;
    qrychama_ncmData_Cadastro: TDateTimeField;
    qrychama_ncmEx: TStringField;
    qrychama_ncmAliquota_Nacional: TFloatField;
    qrychama_ncmAliquota_Importada: TFloatField;
    qrychama_ncmVersao: TStringField;
    qrychama_ncmTabela: TIntegerField;
    qrychama_ncmAliquota_Estadual: TFloatField;
    qrychama_ncmAliquota_Municipal: TFloatField;
    qrychama_ncmVigencia_Inicio: TStringField;
    qrychama_ncmVigencia_Fim: TStringField;
    qrychama_ncmIVA: TFloatField;
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
  FrmChama_NCM: TFrmChama_NCM;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_NCM, UCadastro_Produto, URegra_IPI;

{$R *.dfm}

procedure TFrmChama_NCM.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_NCM.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_NCM;;
end;

procedure TFrmChama_NCM.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_NCM <> Nil) and (FrmCadastro_NCM.ativo = true) then
  begin
    FrmCadastro_NCM.EdtCodigo.Text:= qrychama_ncmCodigo.AsString;
    FrmCadastro_NCM.EdtCodigo_NCM.Text:= qrychama_ncmCodigo_NCM.AsString;
    FrmCadastro_NCM.EdtDescricao.Text:= qrychama_ncmDescricao.AsString;
    FrmCadastro_NCM.MEdtData_Cadastro.Text:= FormatDateTime('DD/MM/YYYY', qrychama_ncmData_Cadastro.AsDateTime);
    FrmCadastro_NCM.EdtEx.Text:= qrychama_ncmEx.AsString;
    FrmCadastro_NCM.EdtAliquota_Nacional.Text:= qrychama_ncmAliquota_Nacional.AsString;
    FrmCadastro_NCM.EdtAliquota_Importada.Text:= qrychama_ncmAliquota_Importada.AsString;
    FrmCadastro_NCM.EdtVersao.Text:= qrychama_ncmVersao.AsString;
    FrmCadastro_NCM.RGTabela.ItemIndex:= qrychama_ncmTabela.AsInteger;
    FrmCadastro_NCM.EdtAliquota_Estadual.Text:= qrychama_ncmAliquota_Estadual.AsString;
    FrmCadastro_NCM.EdtAliquota_Municipal.Text:= qrychama_ncmAliquota_Municipal.AsString;
    FrmCadastro_NCM.MEdtVigencia_Inicio.Text:= qrychama_ncmVigencia_Inicio.AsString;
    FrmCadastro_NCM.MEdtVigencia_Fim.Text:= qrychama_ncmVigencia_Fim.AsString;
    FrmCadastro_NCM.EdtIVA.Text:= qrychama_ncmIVA.AsString;
    FrmChama_NCM.Close;
    FrmCadastro_NCM.BBtnSalvar.Enabled:= true;
    FrmCadastro_NCM.BBtnExcluir.Enabled:= true;
    FrmCadastro_NCM.BBtnPesquisar.Enabled:= true;
    FrmCadastro_NCM.BBtnCancelar.Enabled:= true;
    FrmCadastro_NCM.BbtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmCadastro_NCM);
    FrmCadastro_NCM.achei:= true;
  end;
end;

procedure TFrmChama_NCM.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_NCM.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_NCM.DBGrid1TitleClick(Column: TColumn);
begin
  if (qrychama_ncm.Sort <> column.FieldName+ ' ASC') then
    qrychama_ncm.Sort:=column.FieldName+ ' ASC'
  else
    qrychama_ncm.sort:=column.fieldname+ ' DESC';
end;

procedure TFrmChama_NCM.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_NCM;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_NCM.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_NCM.Release;
end;

procedure TFrmChama_NCM.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
