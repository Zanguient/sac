unit UConsulta_Patrimonio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, Mask;

type
  TFrmConsulta_Patrimonio = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qryconsulta_bem: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    RGAgrupa_Impressao: TRadioGroup;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    LblConsulta: TLabel;
    EdtCodigo: TEdit;
    EdtDescricao: TEdit;
    qryconsulta_bemCodigo: TAutoIncField;
    qryconsulta_bemN_Bem: TStringField;
    qryconsulta_bemN_Identificacao: TStringField;
    qryconsulta_bemDescricao: TStringField;
    qryconsulta_bemCodigo_Marca: TIntegerField;
    qryconsulta_bemModelo: TStringField;
    qryconsulta_bemCodigo_Tipo_Bem: TIntegerField;
    qryconsulta_bemCodigo_Local_Bem: TIntegerField;
    qryconsulta_bemData_Aquisicao: TDateTimeField;
    qryconsulta_bemData_Baixa: TDateTimeField;
    qryconsulta_bemValor_Bem: TFloatField;
    qryconsulta_bemCodigo_Status: TIntegerField;
    qryconsulta_bemObservacao: TStringField;
    qryconsulta_bemData_Cadastro: TDateTimeField;
    qryconsulta_bemMarca: TStringField;
    qryconsulta_bemTipo_Bem: TStringField;
    qryconsulta_bemLocal: TStringField;
    qryconsulta_bemStatus: TStringField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Patrimonio: TFrmConsulta_Patrimonio;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UEscolha_Impressao, UChama_Tipo_Bem_Patrimonial,
  UChama_Local_Produto, UChama_Status, URel_Consulta_Patrimonio,
  URel_Consulta_Patrimonio_Tipo, URel_Consulta_Patrimonio_Local,
  URel_Consulta_Patrimonio_Status;

{$R *.dfm}

procedure TFrmConsulta_Patrimonio.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Patrimonio.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Consulta_Patrimonio;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Patrimonio.BBtnImprimirClick(Sender: TObject);
begin
  if (RGAgrupa_Impressao.ItemIndex = 0) then
  begin
    FrmRel_Consulta_Patrimonio:= TFrmRel_Consulta_Patrimonio.Create(self);
    FrmRel_Consulta_Patrimonio.Release;
    FrmRel_Consulta_Patrimonio:= Nil;
  end
  else if (RGAgrupa_Impressao.ItemIndex = 1) then
  begin
    FrmRel_Consulta_Patrimonio_Tipo:= TFrmRel_Consulta_Patrimonio_Tipo.Create(self);
    FrmRel_Consulta_Patrimonio_Tipo.Release;
    FrmRel_Consulta_Patrimonio_Tipo:= Nil;
  end
  else if (RGAgrupa_Impressao.ItemIndex = 2) then
  begin
    FrmRel_Consulta_Patrimonio_Local:= TFrmRel_Consulta_Patrimonio_Local.Create(self);
    FrmRel_Consulta_Patrimonio_Local.Release;
    FrmRel_Consulta_Patrimonio_Local:= Nil;
  end
  else if (RGAgrupa_Impressao.ItemIndex = 3) then
  begin
    FrmRel_Consulta_Patrimonio_Status:= TFrmRel_Consulta_Patrimonio_Status.Create(self);
    FrmRel_Consulta_Patrimonio_Status.Release;
    FrmRel_Consulta_Patrimonio_Status:= Nil;
  end;
end;

procedure TFrmConsulta_Patrimonio.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_bem.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  EdtCodigo.SetFocus;
end;

procedure TFrmConsulta_Patrimonio.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Patrimonio.DBGrid1TitleClick(Column: TColumn);
begin
  Util.Ordena_Grid(qryconsulta_bem, Column);
  {if (qryconsulta_bem.Sort <> column.FieldName+ ' ASC') then
    qryconsulta_bem.Sort:=column.FieldName+ ' ASC'
  else
    qryconsulta_bem.sort:=column.fieldname+ ' DESC';}
end;

procedure TFrmConsulta_Patrimonio.EdtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_F3) then
  begin
    if (RGConsulta_Por.ItemIndex = 4) then
    begin
      Application.CreateForm(TFrmChama_Tipo_Bem_Patrimonial, FrmChama_Tipo_Bem_Patrimonial);
      FrmChama_Tipo_Bem_Patrimonial.ShowModal;
      FrmChama_Tipo_Bem_Patrimonial.Free;
    end
    else if (RGConsulta_Por.ItemIndex = 5) then
    begin
      Application.CreateForm(TFrmChama_Local_Produto, FrmChama_Local_Produto);
      FrmChama_Local_Produto.ShowModal;
      FrmChama_Local_Produto.Free;
    end
    else if (RGConsulta_Por.ItemIndex = 6) then
    begin
      Application.CreateForm(TFrmChama_Status, FrmChama_Status);
      FrmChama_Status.ShowModal;
      FrmChama_Status.Free;
    end;
  end;
end;

procedure TFrmConsulta_Patrimonio.EdtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Patrimonio.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Consulta_Cheque(EdtConsulta.Text);
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir.Enabled:= true;
  end;
end;

procedure TFrmConsulta_Patrimonio.EdtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Patrimonio.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Patrimonio.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Patrimonio.Free;
  FrmConsulta_Patrimonio:= NIl;
end;

procedure TFrmConsulta_Patrimonio.FormCreate(Sender: TObject);
begin
  qryconsulta_bem.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  EdtConsulta.Clear;
end;

procedure TFrmConsulta_Patrimonio.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Patrimonio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
