unit UConsulta_Produto_Cadastrado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, Mask;

type
  TFrmConsulta_Produto_Cadastrado = class(TForm)
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    Label40: TLabel;
    EdtDescricao: TEdit;
    EdtCodigo: TEdit;
    RGConsulta_Por: TRadioGroup;
    RGOrdena_Por: TRadioGroup;
    qryconsultaCodigo_Venda: TStringField;
    qryconsultaDescricao: TStringField;
    qryconsultaData_Fabricacao: TDateTimeField;
    qryconsultaData_Validade: TDateTimeField;
    qryconsultaValor_Compra: TFloatField;
    qryconsultaPreco_Vista: TFloatField;
    qryconsultaGrupo_Produto: TStringField;
    qryconsultaMarca: TStringField;
    qryconsultaLocal: TStringField;
    qryconsultaDetalhe: TStringField;
    qryconsultaNome_Fantasia: TStringField;
    Label1: TLabel;
    Label3: TLabel;
    MEdtData_Inicial: TMaskEdit;
    MEdtData_Final: TMaskEdit;
    RGStatus: TRadioGroup;
    qryconsultaCodigo_Original: TStringField;
    qryconsultaCodigo_Similar: TStringField;
    qryconsultaCodigo: TAutoIncField;
    BBtnImprimir_Lista_Preco: TToolButton;
    qryconsultaPreco_Prazo: TFloatField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure qryconsultaData_FabricacaoGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryconsultaData_ValidadeGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure EdtCodigoDblClick(Sender: TObject);
    procedure BBtnImprimir_Lista_PrecoClick(Sender: TObject);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Produto_Cadastrado: TFrmConsulta_Produto_Cadastrado;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Grupo_Produto, UChama_Marca, UChama_Local_Produto, UChama_Fornecedor,
  URel_Consulta_Produto_Cadastrado, URel_Lista_Preco;

{$R *.dfm}

procedure TFrmConsulta_Produto_Cadastrado.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Produto_Cadastrado.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Produto_Cadastrado;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
  BBtnImprimir_Lista_Preco.Enabled:= true;
end;

procedure TFrmConsulta_Produto_Cadastrado.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Produto_Cadastrado:= TFrmRel_Consulta_Produto_Cadastrado.create(self);
  FrmRel_Consulta_Produto_Cadastrado.Release;
  FrmRel_Consulta_Produto_Cadastrado:= Nil;
end;

procedure TFrmConsulta_Produto_Cadastrado.BBtnImprimir_Lista_PrecoClick(
  Sender: TObject);
begin
  FrmRel_Lista_Preco:= TFrmRel_Lista_Preco.create(self);
  FrmRel_Lista_Preco.Release;
  FrmRel_Lista_Preco:= Nil;
end;

procedure TFrmConsulta_Produto_Cadastrado.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  BBtnImprimir_Lista_Preco.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Produto_Cadastrado.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Produto_Cadastrado.EdtCodigoDblClick(Sender: TObject);
begin
  if (RGConsulta_Por.ItemIndex = 1) then
  begin
    Application.CreateForm(TFrmChama_Grupo_Produto, FrmChama_Grupo_Produto);
    FrmChama_Grupo_Produto.ShowModal;
    FrmChama_Grupo_Produto.Free;
  end
  else if (RGConsulta_Por.ItemIndex = 2) then
  begin
    Application.CreateForm(TFrmChama_Marca, FrmChama_Marca);
    FrmChama_Marca.ShowModal;
    FrmChama_Marca.Free;
  end
  else if (RGConsulta_Por.ItemIndex = 3) then
  begin
    Application.CreateForm(TFrmChama_Local_Produto, FrmChama_Local_Produto);
    FrmChama_Local_Produto.ShowModal;
    FrmChama_Local_Produto.Free;
  end
  else if (RGConsulta_Por.ItemIndex = 4) then
  begin
    Application.CreateForm(TFrmChama_Fornecedor, FrmChama_Fornecedor);
    FrmChama_Fornecedor.ShowModal;
    FrmChama_Fornecedor.Free;
  end;
end;

procedure TFrmConsulta_Produto_Cadastrado.EdtCodigoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    if (RGConsulta_Por.ItemIndex = 1) then
    begin
      Application.CreateForm(TFrmChama_Grupo_Produto, FrmChama_Grupo_Produto);
      FrmChama_Grupo_Produto.ShowModal;
      FrmChama_Grupo_Produto.Free;
    end
    else if (RGConsulta_Por.ItemIndex = 2) then
    begin
      Application.CreateForm(TFrmChama_Marca, FrmChama_Marca);
      FrmChama_Marca.ShowModal;
      FrmChama_Marca.Free;
    end
    else if (RGConsulta_Por.ItemIndex = 3) then
    begin
      Application.CreateForm(TFrmChama_Local_Produto, FrmChama_Local_Produto);
      FrmChama_Local_Produto.ShowModal;
      FrmChama_Local_Produto.Free;
    end
    else if (RGConsulta_Por.ItemIndex = 4) then
    begin
      Application.CreateForm(TFrmChama_Fornecedor, FrmChama_Fornecedor);
      FrmChama_Fornecedor.ShowModal;
      FrmChama_Fornecedor.Free;
    end;
  end;
end;

procedure TFrmConsulta_Produto_Cadastrado.EdtCodigoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Produto_Cadastrado.EdtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Produto_Cadastrado.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Produto_Cadastrado.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Produto_Cadastrado.Free;
  FrmConsulta_Produto_Cadastrado:= NIl;
end;

procedure TFrmConsulta_Produto_Cadastrado.FormCreate(Sender: TObject);
begin
  qryconsulta.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  BBtnImprimir_Lista_Preco.Enabled:= false;
  //MEdtData_Inicial.Text:= DateToStr(date);
  //MEdtData_Final.Text:= DateToStr(date);
end;

procedure TFrmConsulta_Produto_Cadastrado.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Produto_Cadastrado.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmConsulta_Produto_Cadastrado.qryconsultaData_FabricacaoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '30/12/1899') then
    Text:= ''
  else
    Text:= Sender.AsString;
end;

procedure TFrmConsulta_Produto_Cadastrado.qryconsultaData_ValidadeGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '30/12/1899') then
    Text:= ''
  else
    Text:= Sender.AsString;
end;

end.
