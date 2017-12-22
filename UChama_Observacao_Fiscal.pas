unit UChama_Observacao_Fiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Observacao_Fiscal = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_obs: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_obsCodigo: TAutoIncField;
    qrychama_obsData_Cadastro: TDateTimeField;
    qrychama_obsDescricao: TStringField;
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
  FrmChama_Observacao_Fiscal: TFrmChama_Observacao_Fiscal;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Observacao_Fiscal, URegra_ICMS, UNFE,
  UCadastro_Situacao_Tributaria;

{$R *.dfm}

procedure TFrmChama_Observacao_Fiscal.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Observacao_Fiscal.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Obs_Fiscal;
end;

procedure TFrmChama_Observacao_Fiscal.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Observacao_Fiscal <> Nil) and (FrmCadastro_Observacao_Fiscal.ativo = true) then
  begin
    FrmCadastro_Observacao_Fiscal.EdtCodigo.Text:= qrychama_obsCodigo.AsString;
    FrmCadastro_Observacao_Fiscal.EdtDescricao.Text:= qrychama_obsDescricao.AsString;
    FrmCadastro_Observacao_Fiscal.MEdtData_Cadastro.Text:= qrychama_obsData_Cadastro.AsString;
    FrmChama_Observacao_Fiscal.Close;
    FrmCadastro_Observacao_Fiscal.BBtnSalvar.Enabled:= true;
    FrmCadastro_Observacao_Fiscal.BBtnExcluir.Enabled:= true;
    FrmCadastro_Observacao_Fiscal.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Observacao_Fiscal.BBtnCancelar.Enabled:= true;
    FrmCadastro_Observacao_Fiscal.BBtnNovo.Enabled:= False;
    Util.Habilita_Campos(FrmCadastro_Observacao_Fiscal);
    FrmCadastro_Observacao_Fiscal.achei:= true;
  {end
  else if (FrmRegra_ICMS <> Nil) and (FrmRegra_ICMS.ativo = true) then
  begin
    FrmRegra_ICMS.EdtCodigo_Observacao_Fiscal.Text:= qrychama_obsCodigo.AsString;
    FrmRegra_ICMS.EdtObservacao_Fiscal.Text:= qrychama_obsDescricao.AsString;
    FrmChama_Observacao_Fiscal.Close; }
  end
  else if (FrmNFE <> Nil) and (FrmNFE.ativo = true) then
  begin
    FrmNFE.EdtCodigo_Obs_Fiscal.Text:= qrychama_obsCodigo.AsString;
    FrmNFE.MMOObservacao.Text:= qrychama_obsDescricao.AsString;
    FrmChama_Observacao_Fiscal.Close;
  end
  else if (FrmCadastro_Situacao_Tributaria <> Nil) and (FrmCadastro_Situacao_Tributaria.ativo = true) then
  begin
    FrmCadastro_Situacao_Tributaria.EdtCodigo_Observacao_Fiscal.Text:= qrychama_obsCodigo.AsString;
    FrmCadastro_Situacao_Tributaria.EdtObservacao_Fiscal.Text:= qrychama_obsDescricao.AsString;
    FrmChama_Observacao_Fiscal.Close;
  end;
end;

procedure TFrmChama_Observacao_Fiscal.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Observacao_Fiscal.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Observacao_Fiscal.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Obs_Fiscal;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Observacao_Fiscal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Observacao_Fiscal.Release;
end;

procedure TFrmChama_Observacao_Fiscal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
