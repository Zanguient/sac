unit UConsulta_Ficha_Funcionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, Mask;

type
  TFrmConsulta_Ficha_Funcionario = class(TForm)
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta_funcionario: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    RGConsulta_Por: TRadioGroup;
    qryconsulta_funcionarioNome: TStringField;
    qryconsulta_funcionarioCPF: TStringField;
    qryconsulta_funcionarioRG: TStringField;
    qryconsulta_funcionarioSalario: TFloatField;
    qryconsulta_funcionarioComissao: TFloatField;
    qryconsulta_funcionarioLogradouro: TStringField;
    qryconsulta_funcionarioSetor: TStringField;
    qryconsulta_funcionarioCidade: TStringField;
    qryconsulta_funcionarioNumero: TStringField;
    qryconsulta_funcionarioTelefone: TStringField;
    qryconsulta_funcionarioCelular: TStringField;
    LblConsulta: TLabel;
    EdtCodigo: TEdit;
    EdtDescricao: TEdit;
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
  FrmConsulta_Ficha_Funcionario: TFrmConsulta_Ficha_Funcionario;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Usuario, UChama_Funcionario, URel_Consulta_Ficha_Funcionario;

{$R *.dfm}

procedure TFrmConsulta_Ficha_Funcionario.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Ficha_Funcionario.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Ficha_Funcionario;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Ficha_Funcionario.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Ficha_Funcionario:= TFrmRel_Consulta_Ficha_Funcionario.create(self);
  FrmRel_Consulta_Ficha_Funcionario.Release;
  FrmRel_Consulta_Ficha_Funcionario:= Nil;
end;

procedure TFrmConsulta_Ficha_Funcionario.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_funcionario.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Ficha_Funcionario.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Ficha_Funcionario.DBGrid1TitleClick(Column: TColumn);
begin
  Util.Ordena_Grid(qryconsulta_funcionario, Column);
end;

procedure TFrmConsulta_Ficha_Funcionario.EdtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_F3) then
  begin
    Application.CreateForm(TFrmChama_Funcionario, FrmChama_Funcionario);
    FrmChama_Funcionario.ShowModal;
    FrmChama_Funcionario.Free;
  end;
end;

procedure TFrmConsulta_Ficha_Funcionario.EdtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Ficha_Funcionario.EdtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Ficha_Funcionario.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Ficha_Funcionario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Ficha_Funcionario.Free;
  FrmConsulta_Ficha_Funcionario:= NIl;
end;

procedure TFrmConsulta_Ficha_Funcionario.FormCreate(Sender: TObject);
begin
  qryconsulta_funcionario.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
end;

procedure TFrmConsulta_Ficha_Funcionario.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Ficha_Funcionario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
