unit UChama_Ocorrencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta;

type
  TFrmChama_Ocorrencia = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_ocorrencia: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_ocorrenciaNome: TStringField;
    qrychama_ocorrenciaOcorrencia: TStringField;
    qrychama_ocorrenciaCodigo: TAutoIncField;
    qrychama_ocorrenciaCodigo_Funcionario: TIntegerField;
    qrychama_ocorrenciaCodigo_Tipo_Ocorrencia: TIntegerField;
    qrychama_ocorrenciaObservacao: TStringField;
    qrychama_ocorrenciaData_Ocorrencia: TDateTimeField;
    qrychama_ocorrenciaData_Cadastro: TDateTimeField;
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
  FrmChama_Ocorrencia: TFrmChama_Ocorrencia;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UOcorrencia;

{$R *.dfm}

procedure TFrmChama_Ocorrencia.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Ocorrencia.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Ocorrencia;
end;

procedure TFrmChama_Ocorrencia.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmOcorrencia <> NIL) and (FrmOcorrencia.ativo = true) then
  begin
    FrmOcorrencia.EdtCodigo.Text:= qrychama_ocorrenciaCodigo.AsString;
    FrmOcorrencia.MEdtData_Cadastro.Text:= qrychama_ocorrenciaData_Cadastro.AsString;
    FrmOcorrencia.MEdtData_Ocorrencia.Text:= qrychama_ocorrenciaData_Ocorrencia.AsString;
    FrmOcorrencia.EdtCodigo_Funcionario.Text:= qrychama_ocorrenciaCodigo_Funcionario.AsString;
    FrmOcorrencia.EdtFuncionario.Text:= qrychama_ocorrenciaNome.AsString;
    FrmOcorrencia.EdtCodigo_Tipo_Ocorrencia.Text:= qrychama_ocorrenciaCodigo_Tipo_Ocorrencia.AsString;
    FrmOcorrencia.EdtTipo_Ocorrencia.Text:= qrychama_ocorrenciaOcorrencia.AsString;
    FrmOcorrencia.MmoObservacoes.Text:= qrychama_ocorrenciaObservacao.AsString;

    FrmChama_Ocorrencia.Close;
    FrmOcorrencia.BBtnSalvar.Enabled:= true;
    FrmOcorrencia.BBtnExcluir.Enabled:= true;
    FrmOcorrencia.BBtnPesquisar.Enabled:= true;
    FrmOcorrencia.BBtnCancelar.Enabled:= true;
    FrmOcorrencia.BBtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmOcorrencia);
    FrmOcorrencia.achei:= true;
  end;
end;

procedure TFrmChama_Ocorrencia.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Ocorrencia.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      if (FrmOcorrencia <> NIL) and (FrmOcorrencia.ativo = true) then
      begin
        FrmOcorrencia.EdtCodigo.Text:= qrychama_ocorrenciaCodigo.AsString;
        FrmOcorrencia.MEdtData_Cadastro.Text:= qrychama_ocorrenciaData_Cadastro.AsString;
        FrmOcorrencia.MEdtData_Ocorrencia.Text:= qrychama_ocorrenciaData_Ocorrencia.AsString;
        FrmOcorrencia.EdtCodigo_Funcionario.Text:= qrychama_ocorrenciaCodigo_Funcionario.AsString;
        FrmOcorrencia.EdtFuncionario.Text:= qrychama_ocorrenciaNome.AsString;
        FrmOcorrencia.EdtCodigo_Tipo_Ocorrencia.Text:= qrychama_ocorrenciaCodigo_Tipo_Ocorrencia.AsString;
        FrmOcorrencia.EdtTipo_Ocorrencia.Text:= qrychama_ocorrenciaOcorrencia.AsString;
        FrmOcorrencia.MmoObservacoes.Text:= qrychama_ocorrenciaObservacao.AsString;

        FrmChama_Ocorrencia.Close;
        FrmOcorrencia.BBtnSalvar.Enabled:= true;
        FrmOcorrencia.BBtnExcluir.Enabled:= true;
        FrmOcorrencia.BBtnPesquisar.Enabled:= true;
        FrmOcorrencia.BBtnCancelar.Enabled:= true;
        Util.Habilita_Campos(FrmOcorrencia);
        FrmOcorrencia.achei:= true;
      end;
    end;
end;

procedure TFrmChama_Ocorrencia.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Ocorrencia;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Ocorrencia.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Ocorrencia.Release;
end;

procedure TFrmChama_Ocorrencia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
