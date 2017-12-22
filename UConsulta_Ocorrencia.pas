unit UConsulta_Ocorrencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, Mask;

type
  TFrmConsulta_Ocorrencia = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    ds_qry_consulta_padrao: TDataSource;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    Label2: TLabel;
    EdtCodigo: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    MEdtData_Inicial: TMaskEdit;
    MEdtData_Final: TMaskEdit;
    qryconsulta_ocorrencia: TADOQuery;
    qryconsulta_ocorrenciaNome: TStringField;
    qryconsulta_ocorrenciaOcorrencia: TStringField;
    qryconsulta_ocorrenciaCodigo: TAutoIncField;
    qryconsulta_ocorrenciaCodigo_Funcionario: TIntegerField;
    qryconsulta_ocorrenciaCodigo_Tipo_Ocorrencia: TIntegerField;
    qryconsulta_ocorrenciaObservacao: TStringField;
    qryconsulta_ocorrenciaData_Ocorrencia: TDateTimeField;
    qryconsulta_ocorrenciaData_Cadastro: TDateTimeField;
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
    procedure EdtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Ocorrencia: TFrmConsulta_Ocorrencia;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UEscolha_Impressao, UChama_Plano_Financeiro,
  UChama_Funcionario, UChama_Tipo_Ocorrencia, URel_Consulta_Ocorrencia;

{$R *.dfm}

procedure TFrmConsulta_Ocorrencia.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Ocorrencia.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Consulta.Consulta_Ocorrencia;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmConsulta_Ocorrencia.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Consulta_Ocorrencia:= TFrmRel_Consulta_Ocorrencia.create(self);
  FrmRel_Consulta_Ocorrencia.Release;
  FrmRel_Consulta_Ocorrencia:= Nil;
  {Application.CreateForm(TFrmEscolha_Impressao, FrmEscolha_Impressao);
  FrmEscolha_Impressao.Show;
  ativo:= true;}
end;

procedure TFrmConsulta_Ocorrencia.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_ocorrencia.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  {EdtConsulta.Clear;
  EdtCodigo_Plano.Clear;
  EdtDia_Ini.Clear;
  EdtDia_Fim.Clear;}
  EdtConsulta.SetFocus;
end;

procedure TFrmConsulta_Ocorrencia.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Ocorrencia.EdtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      if (RGConsulta_Por.ItemIndex = 1) then
      begin
        Application.CreateForm(TFrmChama_Funcionario, FrmChama_Funcionario);
        FrmChama_Funcionario.ShowModal;
        FrmChama_Funcionario.Free;
      end
      else if (RGConsulta_Por.ItemIndex = 2) then
      begin
        Application.CreateForm(TFrmChama_Tipo_Ocorrencia, FrmChama_Tipo_Ocorrencia);
        FrmChama_Tipo_Ocorrencia.ShowModal;
        FrmChama_Tipo_Ocorrencia.Free;
      end;
    end;
end;

procedure TFrmConsulta_Ocorrencia.EdtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConsulta_Ocorrencia.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Consulta_Conta_Fixa(EdtConsulta.Text);
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir.Enabled:= true;
  end;
end;

procedure TFrmConsulta_Ocorrencia.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Ocorrencia.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Ocorrencia.Free;
  FrmConsulta_Ocorrencia:= NIl;
end;

procedure TFrmConsulta_Ocorrencia.FormCreate(Sender: TObject);
begin
  qryconsulta_ocorrencia.close;
  Util.Inicia_Data(MEdtData_Inicial, MEdtData_Final);
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  EdtConsulta.Clear;
end;

procedure TFrmConsulta_Ocorrencia.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Ocorrencia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
