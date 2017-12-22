unit UChama_Status;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta;

type
  TFrmChama_Status = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_status: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_statusCodigo: TAutoIncField;
    qrychama_statusDescricao: TStringField;
    qrychama_statusData_Cadastro: TDateTimeField;
    qrychama_statusEncerrado: TIntegerField;
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
    procedure qrychama_statusEncerradoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Status: TFrmChama_Status;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Status, UCadastro_Patrimonio, UConsulta_Patrimonio;

{$R *.dfm}

procedure TFrmChama_Status.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Status.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Status(EdtConsulta.Text);
end;

procedure TFrmChama_Status.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Status <> NIL) and (FrmCadastro_Status.ativo = true) then
  begin
    FrmCadastro_Status.EdtCodigo.Text:= qrychama_statusCodigo.AsString;
    FrmCadastro_Status.EdtDescricao.Text:= qrychama_statusDescricao.AsString;
    FrmCadastro_Status.MEdtData_Cadastro.Text:= qrychama_statusData_Cadastro.AsString;

    if (qrychama_statusEncerrado.AsInteger = 0) then
      FrmCadastro_Status.CBEncerrado.Checked:= True
    else
      FrmCadastro_Status.CBEncerrado.Checked:= false;

    FrmChama_Status.Close;
    FrmCadastro_Status.BBtnSalvar.Enabled:= true;
    FrmCadastro_Status.BBtnExcluir.Enabled:= true;
    FrmCadastro_Status.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Status.BBtnCancelar.Enabled:= true;
    FrmCadastro_Status.BBtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmCadastro_Status);
    FrmCadastro_Status.achei:= true;
  end
  else if (FrmCadastro_Patrimonio <> NIL) and (FrmCadastro_Patrimonio.ativo = true) then
  begin
    FrmCadastro_Patrimonio.EdtCodigo_Status.Text:= qrychama_statusCodigo.AsString;
    FrmCadastro_Patrimonio.EdtStatus.Text:= qrychama_statusDescricao.AsString;
    FrmChama_Status.Close;
  end
  else if (FrmConsulta_Patrimonio <> NIL) and (FrmConsulta_Patrimonio.ativo = true) then
  begin
    FrmConsulta_Patrimonio.EdtCodigo.Text:= qrychama_statusCodigo.AsString;
    FrmConsulta_Patrimonio.EdtDescricao.Text:= qrychama_statusDescricao.AsString;
    FrmChama_Status.Close;
  end;
end;

procedure TFrmChama_Status.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Status.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      if (FrmCadastro_Status <> NIL) and (FrmCadastro_Status.ativo = true) then
      begin
        FrmCadastro_Status.EdtCodigo.Text:= qrychama_statusCodigo.AsString;
        FrmCadastro_Status.EdtDescricao.Text:= qrychama_statusDescricao.AsString;
        FrmCadastro_Status.MEdtData_Cadastro.Text:= qrychama_statusData_Cadastro.AsString;
        FrmChama_Status.Close;
        FrmCadastro_Status.BBtnSalvar.Enabled:= true;
        FrmCadastro_Status.BBtnExcluir.Enabled:= true;
        FrmCadastro_Status.BBtnPesquisar.Enabled:= true;
        FrmCadastro_Status.BBtnCancelar.Enabled:= true;
        Util.Habilita_Campos(FrmCadastro_Status);
        FrmCadastro_Status.achei:= true;
      end
      else if (FrmCadastro_Patrimonio <> NIL) and (FrmCadastro_Patrimonio.ativo = true) then
      begin
        FrmCadastro_Patrimonio.EdtCodigo_Status.Text:= qrychama_statusCodigo.AsString;
        FrmCadastro_Patrimonio.EdtStatus.Text:= qrychama_statusDescricao.AsString;
        FrmChama_Status.Close;
      end
      else if (FrmConsulta_Patrimonio <> NIL) and (FrmConsulta_Patrimonio.ativo = true) then
      begin
        FrmConsulta_Patrimonio.EdtCodigo.Text:= qrychama_statusCodigo.AsString;
        FrmConsulta_Patrimonio.EdtDescricao.Text:= qrychama_statusDescricao.AsString;
        FrmChama_Status.Close;
      end;
    end;
end;

procedure TFrmChama_Status.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Status(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Status.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Status.Release;
end;

procedure TFrmChama_Status.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Status.qrychama_statusEncerradoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '0') then
    Text:= 'SIM'
  else
    Text:= 'NÃO';
end;

end.
