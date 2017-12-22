unit UConsulta_Comissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, Mask;

type
  TFrmConsulta_Comissao = class(TForm)
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryconsulta: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    RGConsulta_Por: TRadioGroup;
    Label3: TLabel;
    Label4: TLabel;
    MEdtData_Inicial: TMaskEdit;
    MEdtData_Final: TMaskEdit;
    qryconsultaNome: TStringField;
    qryconsultaSalario: TFloatField;
    qryconsultaTotal_Comissao: TFloatField;
    qryconsultaTotal_Salario: TFloatField;
    qryconsultaTotal_Pedido: TFloatField;
    Label2: TLabel;
    EdtFuncionario: TEdit;
    EdtCodigo_Funcionario: TEdit;
    RGTipo_Calculo: TRadioGroup;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    qrylucratividade: TADOQuery;
    DataSource1: TDataSource;
    qrylucratividadeNome: TStringField;
    qrylucratividadeValor_Compra: TFloatField;
    qrylucratividadeValor_Venda: TFloatField;
    qrylucratividadeTotal: TFloatField;
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
    procedure EdtCodigo_UsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_FuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_FuncionarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Inicia;
  public
    ativo: boolean;
    mes1, ano1, mes2, ano2: AnsiString;
    { Public declarations }
  end;

var
  FrmConsulta_Comissao: TFrmConsulta_Comissao;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, URel_Consulta_Comissao, UChama_Funcionario,
  URel_Consulta_Comissao_Lucratividade;

{$R *.dfm}

procedure TFrmConsulta_Comissao.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Comissao.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  if (RGTipo_Calculo.ItemIndex = 0) then
  begin
    PageControl1.TabIndex:= 0;
    Consulta.Consulta_Comissao;
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir.Enabled:= true;
  end
  else
  begin
    PageControl1.TabIndex:= 1;
    mes1:= FormatDateTime('MM', StrToDateTime(MEdtData_Inicial.Text));
    ano1:= FormatDateTime('YYYY', StrToDateTime(MEdtData_Inicial.Text));

    mes2:= FormatDateTime('MM', StrToDateTime(MEdtData_Final.Text));
    ano2:= FormatDateTime('YYYY', StrToDateTime(MEdtData_Final.Text));

    Consulta.Consulta_Comissao_Lucratividade_Vendedor;
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir.Enabled:= true;
  end;
end;

procedure TFrmConsulta_Comissao.BBtnImprimirClick(Sender: TObject);
begin
  if (RGTipo_Calculo.ItemIndex = 0) then
  begin
    FrmRel_Consulta_Comissao:= TFrmRel_Consulta_Comissao.create(self);
    FrmRel_Consulta_Comissao.Release;
    FrmRel_Consulta_Comissao:= Nil;
  end
  else
  begin
    FrmRel_Consulta_Comissao_Lucratividade:= TFrmRel_Consulta_Comissao_Lucratividade.create(self);
    FrmRel_Consulta_Comissao_Lucratividade.Release;
    FrmRel_Consulta_Comissao_Lucratividade:= Nil;
  end;
end;

procedure TFrmConsulta_Comissao.BBtnLimparClick(Sender: TObject);
begin
  Inicia;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
end;

procedure TFrmConsulta_Comissao.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Comissao.EdtFuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Comissao.EdtCodigo_FuncionarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Funcionario, FrmChama_Funcionario);
    FrmChama_Funcionario.ShowModal;
    FrmChama_Funcionario.Free;
  end;
end;

procedure TFrmConsulta_Comissao.EdtCodigo_FuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Comissao.EdtCodigo_UsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Comissao.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Comissao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Comissao.Free;
  FrmConsulta_Comissao:= NIl;
end;

procedure TFrmConsulta_Comissao.FormCreate(Sender: TObject);
begin
  Inicia;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  MEdtData_Inicial.Text:= DateToStr(date);
  MEdtData_Final.Text:= DateToStr(date);
end;

procedure TFrmConsulta_Comissao.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Comissao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmConsulta_Comissao.Inicia;
begin
  PageControl1.TabIndex:= 0;
  qrylucratividade.Close;
  qryconsulta.close;
end;

end.
