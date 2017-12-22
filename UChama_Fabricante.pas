unit UChama_Fabricante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta;

type
  TFrmChama_Fabricante = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_fabricante: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_fabricanteCodigo: TAutoIncField;
    qrychama_fabricanteNome_Fantasia: TStringField;
    qrychama_fabricanteRazao_Social: TStringField;
    qrychama_fabricanteCNPJ: TStringField;
    qrychama_fabricanteInsc_Estadual_Municipal: TStringField;
    qrychama_fabricanteCodigo_Logradouro: TIntegerField;
    qrychama_fabricanteNumero: TStringField;
    qrychama_fabricanteReferencia: TStringField;
    qrychama_fabricanteCodigo_Setor: TIntegerField;
    qrychama_fabricanteCodigo_Cidade: TIntegerField;
    qrychama_fabricanteTelefone: TStringField;
    qrychama_fabricanteCelular: TStringField;
    qrychama_fabricanteEmail: TStringField;
    qrychama_fabricanteSite: TStringField;
    qrychama_fabricanteData_Cadastro: TDateTimeField;
    qrychama_fabricanteObservacoes: TStringField;
    qrychama_fabricanteDescricao: TStringField;
    qrychama_fabricanteUF: TStringField;
    qrychama_fabricanteDescricao_1: TStringField;
    qrychama_fabricanteDescricao_2: TStringField;
    qrychama_fabricanteTipo_Logradouro: TStringField;
    qrychama_fabricanteCEP: TStringField;
    qrychama_fabricanteTipo: TStringField;
    qrychama_fabricanteCPF: TStringField;
    qrychama_fabricanteRG: TStringField;
    qrychama_fabricanteOrgao_Expedidor: TStringField;
    qrychama_fabricanteData_Emissao_RG: TDateTimeField;
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
  FrmChama_Fabricante: TFrmChama_Fabricante;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Produto;

{$R *.dfm}

procedure TFrmChama_Fabricante.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Fabricante.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Fabricante(EdtConsulta.Text);
end;

procedure TFrmChama_Fabricante.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Produto <> NIL) and (FrmCadastro_Produto.ativo = true) then
    begin
      FrmCadastro_Produto.EdtCodigo_Fabricante.Text:= qrychama_fabricanteCodigo.AsString;
      FrmCadastro_Produto.EdtFabricante.Text:= qrychama_fabricanteNome_Fantasia.AsString;
      FrmChama_Fabricante.Close;
    end;
end;

procedure TFrmChama_Fabricante.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Fabricante.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Fabricante.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Fabricante(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Fabricante.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Fabricante.Release;
end;

procedure TFrmChama_Fabricante.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
