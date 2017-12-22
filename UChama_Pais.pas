unit UChama_Pais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta;

type
  TFrmChama_Pais = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_pais: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_paisCodigo: TAutoIncField;
    qrychama_paisCodigo_Pais: TStringField;
    qrychama_paisDescricao: TStringField;
    qrychama_paisData_Cadastro: TDateTimeField;
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
  FrmChama_Pais: TFrmChama_Pais;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Pais, UCadastro_Cidade;

{$R *.dfm}

procedure TFrmChama_Pais.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Pais.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Pais;
end;

procedure TFrmChama_Pais.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Pais <> Nil) and (FrmCadastro_Pais.ativo = true) then
  begin
    FrmCadastro_Pais.EdtCodigo.Text:= qrychama_paisCodigo.AsString;
    FrmCadastro_Pais.EdtCodigo_Pais.Text:= qrychama_paisCodigo_Pais.AsString;
    FrmCadastro_Pais.EdtDescricao.Text:= qrychama_paisDescricao.AsString;
    FrmCadastro_Pais.MEdtData_Cadastro.Text:= qrychama_paisData_Cadastro.AsString;
    FrmChama_Pais.Close;
    FrmCadastro_Pais.BBtnSalvar.Enabled:= true;
    FrmCadastro_Pais.BBtnExcluir.Enabled:= true;
    FrmCadastro_Pais.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Pais.BBtnCancelar.Enabled:= true;
    FrmCadastro_Pais.BBtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmCadastro_Pais);
    FrmCadastro_Pais.achei:= true;
  end
  else if (FrmCadastro_Cidade <> Nil) and (FrmCadastro_Cidade.ativo = true) then
  begin
    FrmCadastro_Cidade.EdtCodigo_Pais.Text:= qrychama_paisCodigo.AsString;
    FrmCadastro_Cidade.EdtPais.Text:= qrychama_paisCodigo_Pais.AsString + ' - ' + qrychama_paisDescricao.AsString;
    FrmChama_Pais.Close;
  end;
end;

procedure TFrmChama_Pais.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Pais.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Pais.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Pais;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Pais.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Pais.Release;
end;

procedure TFrmChama_Pais.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
