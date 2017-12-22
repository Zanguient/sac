unit UConsulta_Ficha_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, Mask;

type
  TFrmConsulta_Ficha_Cliente = class(TForm)
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_cliente: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    RGConsulta_Por: TRadioGroup;
    LblConsulta: TLabel;
    EdtCodigo: TEdit;
    EdtDescricao: TEdit;
    qryconsulta_clienteNome_Nome_Fantasia: TStringField;
    qryconsulta_clienteRazao_Social: TStringField;
    qryconsulta_clienteCPF: TStringField;
    qryconsulta_clienteRG: TStringField;
    qryconsulta_clienteCNPJ: TStringField;
    qryconsulta_clienteInsc_Estadual: TStringField;
    qryconsulta_clienteSetor: TStringField;
    qryconsulta_clienteCidade: TStringField;
    qryconsulta_clienteNumero: TStringField;
    qryconsulta_clienteTelefone: TStringField;
    qryconsulta_clienteCelular: TStringField;
    qryconsulta_clienteEndereco: TStringField;
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
  FrmConsulta_Ficha_Cliente: TFrmConsulta_Ficha_Cliente;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Usuario, URel_Consulta_Ficha_Cliente,
  UChama_Cliente;

{$R *.dfm}

procedure TFrmConsulta_Ficha_Cliente.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Ficha_Cliente.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Ficha_Cliente;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Ficha_Cliente.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Ficha_Cliente:= TFrmRel_Consulta_Ficha_Cliente.create(self);
  FrmRel_Consulta_Ficha_Cliente.Release;
  FrmRel_Consulta_Ficha_Cliente:= Nil;
end;

procedure TFrmConsulta_Ficha_Cliente.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_cliente.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Ficha_Cliente.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Ficha_Cliente.DBGrid1TitleClick(Column: TColumn);
begin
  Util.Ordena_Grid(qryconsulta_cliente, Column);
end;

procedure TFrmConsulta_Ficha_Cliente.EdtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_F3) then
  begin
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;
end;

procedure TFrmConsulta_Ficha_Cliente.EdtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Ficha_Cliente.EdtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Ficha_Cliente.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Ficha_Cliente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Ficha_Cliente.Free;
  FrmConsulta_Ficha_Cliente:= NIl;
end;

procedure TFrmConsulta_Ficha_Cliente.FormCreate(Sender: TObject);
begin
  qryconsulta_cliente.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
end;

procedure TFrmConsulta_Ficha_Cliente.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Ficha_Cliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
