unit UChama_Ocorrencia_Cobranca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Ocorrencia_Cobranca = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_ocorrencia: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_ocorrenciaCodigo: TAutoIncField;
    qrychama_ocorrenciaData_Cadastro: TDateTimeField;
    qrychama_ocorrenciaData_Cobranca: TDateTimeField;
    qrychama_ocorrenciaResponsavel_Atendimento: TStringField;
    qrychama_ocorrenciaOrigem_Atendimento: TIntegerField;
    qrychama_ocorrenciaCodigo_Lancamento_Financeiro: TIntegerField;
    qrychama_ocorrenciaN_Documento: TIntegerField;
    qrychama_ocorrenciaObservacoes: TStringField;
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
  FrmChama_Ocorrencia_Cobranca: TFrmChama_Ocorrencia_Cobranca;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Ocorrencia_Cobranca;

{$R *.dfm}

procedure TFrmChama_Ocorrencia_Cobranca.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Ocorrencia_Cobranca.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Ocorrencia_Cobranca;
end;

procedure TFrmChama_Ocorrencia_Cobranca.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Ocorrencia_Cobranca <> Nil) and (FrmCadastro_Ocorrencia_Cobranca.ativo = true) then
  begin
    FrmCadastro_Ocorrencia_Cobranca.EdtCodigo.Text:= qrychama_ocorrenciaCodigo.AsString;
    FrmCadastro_Ocorrencia_Cobranca.MEdtData_Cadastro.Text:= qrychama_ocorrenciaData_Cadastro.AsString;
    FrmCadastro_Ocorrencia_Cobranca.MEdtData_Cobranca.Text:= qrychama_ocorrenciaData_Cobranca.AsString;
    FrmCadastro_Ocorrencia_Cobranca.RGOrigem.ItemIndex:= qrychama_ocorrenciaOrigem_Atendimento.AsInteger;
    FrmCadastro_Ocorrencia_Cobranca.EdtResponsavel.Text:= qrychama_ocorrenciaResponsavel_Atendimento.AsString;
    FrmCadastro_Ocorrencia_Cobranca.EdtCodigo_Lancamento.Text:= qrychama_ocorrenciaCodigo_Lancamento_Financeiro.AsString;
    FrmCadastro_Ocorrencia_Cobranca.EdtN_Documento.Text:= qrychama_ocorrenciaN_Documento.AsString;
    FrmCadastro_Ocorrencia_Cobranca.MmoObservacoes.Text:= qrychama_ocorrenciaObservacoes.AsString;
    FrmChama_Ocorrencia_Cobranca.Close;
    FrmCadastro_Ocorrencia_Cobranca.BBtnSalvar.Enabled:= true;
    FrmCadastro_Ocorrencia_Cobranca.BBtnExcluir.Enabled:= true;
    FrmCadastro_Ocorrencia_Cobranca.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Ocorrencia_Cobranca.BBtnCancelar.Enabled:= true;
    FrmCadastro_Ocorrencia_Cobranca.BBtnNovo.Enabled:= False;
    Util.Habilita_Campos(FrmCadastro_Ocorrencia_Cobranca);
    FrmCadastro_Ocorrencia_Cobranca.achei:= true;
  end;
end;

procedure TFrmChama_Ocorrencia_Cobranca.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Ocorrencia_Cobranca.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Ocorrencia_Cobranca.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Ocorrencia_Cobranca;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Ocorrencia_Cobranca.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Ocorrencia_Cobranca.Release;
end;

procedure TFrmChama_Ocorrencia_Cobranca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.

