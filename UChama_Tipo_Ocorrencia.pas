unit UChama_Tipo_Ocorrencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta;

type
  TFrmChama_Tipo_Ocorrencia = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_tipo_ocorrencia: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_tipo_ocorrenciaCodigo: TAutoIncField;
    qrychama_tipo_ocorrenciaDescricao: TStringField;
    qrychama_tipo_ocorrenciaData_Cadastro: TDateTimeField;
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
  FrmChama_Tipo_Ocorrencia: TFrmChama_Tipo_Ocorrencia;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Tipo_Ocorrencia, UOcorrencia, UConsulta_Ocorrencia;

{$R *.dfm}

procedure TFrmChama_Tipo_Ocorrencia.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Tipo_Ocorrencia.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Tipo_Ocorrencia;
end;

procedure TFrmChama_Tipo_Ocorrencia.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Tipo_Ocorrencia <> NIL) and (FrmCadastro_Tipo_Ocorrencia.ativo = true) then
  begin
    FrmCadastro_Tipo_Ocorrencia.EdtCodigo.Text:= qrychama_tipo_ocorrenciaCodigo.AsString;
    FrmCadastro_Tipo_Ocorrencia.EdtDescricao.Text:= qrychama_tipo_ocorrenciaDescricao.AsString;
    FrmCadastro_Tipo_Ocorrencia.MEdtData_Cadastro.Text:= qrychama_tipo_ocorrenciaData_Cadastro.AsString;
    FrmChama_Tipo_Ocorrencia.Close;
    FrmCadastro_Tipo_Ocorrencia.BBtnSalvar.Enabled:= true;
    FrmCadastro_Tipo_Ocorrencia.BBtnExcluir.Enabled:= true;
    FrmCadastro_Tipo_Ocorrencia.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Tipo_Ocorrencia.BBtnCancelar.Enabled:= true;
    FrmCadastro_Tipo_Ocorrencia.BBtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmCadastro_Tipo_Ocorrencia);
    FrmCadastro_Tipo_Ocorrencia.achei:= true;
  end
  else if (FrmOcorrencia <> NIL) and (FrmOcorrencia.ativo = true) then
  begin
    FrmOcorrencia.EdtCodigo_Tipo_Ocorrencia.Text:= qrychama_tipo_ocorrenciaCodigo.AsString;
    FrmOcorrencia.EdtTipo_Ocorrencia.Text:= qrychama_tipo_ocorrenciaDescricao.AsString;
    FrmChama_Tipo_Ocorrencia.Close;
  end
  else if (FrmConsulta_Ocorrencia <> Nil) and (FrmConsulta_Ocorrencia.ativo = true) then
  begin
    FrmConsulta_Ocorrencia.EdtCodigo.Text:= qrychama_tipo_ocorrenciaCodigo.AsString;
    FrmConsulta_Ocorrencia.EdtConsulta.Text:= qrychama_tipo_ocorrenciaDescricao.AsString;
    FrmChama_Tipo_Ocorrencia.Close;
  end;
end;

procedure TFrmChama_Tipo_Ocorrencia.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Tipo_Ocorrencia.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      if (FrmCadastro_Tipo_Ocorrencia <> NIL) and (FrmCadastro_Tipo_Ocorrencia.ativo = true) then
      begin
        FrmCadastro_Tipo_Ocorrencia.EdtCodigo.Text:= qrychama_tipo_ocorrenciaCodigo.AsString;
        FrmCadastro_Tipo_Ocorrencia.EdtDescricao.Text:= qrychama_tipo_ocorrenciaDescricao.AsString;
        FrmCadastro_Tipo_Ocorrencia.MEdtData_Cadastro.Text:= qrychama_tipo_ocorrenciaData_Cadastro.AsString;
        FrmChama_Tipo_Ocorrencia.Close;
        FrmCadastro_Tipo_Ocorrencia.BBtnSalvar.Enabled:= true;
        FrmCadastro_Tipo_Ocorrencia.BBtnExcluir.Enabled:= true;
        FrmCadastro_Tipo_Ocorrencia.BBtnPesquisar.Enabled:= true;
        FrmCadastro_Tipo_Ocorrencia.BBtnCancelar.Enabled:= true;
        Util.Habilita_Campos(FrmCadastro_Tipo_Ocorrencia);
        FrmCadastro_Tipo_Ocorrencia.achei:= true;
      end
      else if (FrmOcorrencia <> NIL) and (FrmOcorrencia.ativo = true) then
      begin
        FrmOcorrencia.EdtCodigo_Tipo_Ocorrencia.Text:= qrychama_tipo_ocorrenciaCodigo.AsString;
        FrmOcorrencia.EdtTipo_Ocorrencia.Text:= qrychama_tipo_ocorrenciaDescricao.AsString;
        FrmChama_Tipo_Ocorrencia.Close;
      end
      else if (FrmConsulta_Ocorrencia <> Nil) and (FrmConsulta_Ocorrencia.ativo = true) then
      begin
        FrmConsulta_Ocorrencia.EdtCodigo.Text:= qrychama_tipo_ocorrenciaCodigo.AsString;
        FrmConsulta_Ocorrencia.EdtConsulta.Text:= qrychama_tipo_ocorrenciaDescricao.AsString;
        FrmChama_Tipo_Ocorrencia.Close;
      end;
    end;
end;

procedure TFrmChama_Tipo_Ocorrencia.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Tipo_Ocorrencia;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Tipo_Ocorrencia.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Tipo_Ocorrencia.Release;
end;

procedure TFrmChama_Tipo_Ocorrencia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
