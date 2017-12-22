unit UChama_Grupo_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta;

type
  TFrmChama_Grupo_Cliente = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_grupo: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_grupoCodigo: TAutoIncField;
    qrychama_grupoDescricao: TStringField;
    qrychama_grupoData_Cadastro: TDateTimeField;
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
  FrmChama_Grupo_Cliente: TFrmChama_Grupo_Cliente;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Grupo_Cliente, UCadastro_Cliente;

{$R *.dfm}

procedure TFrmChama_Grupo_Cliente.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Grupo_Cliente.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Grupo(EdtConsulta.Text);
end;

procedure TFrmChama_Grupo_Cliente.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Grupo_Cliente <> Nil) and (FrmCadastro_Grupo_Cliente.ativo = true) then
  begin
    FrmCadastro_Grupo_Cliente.EdtCodigo.Text:= qrychama_grupoCodigo.AsString;
    FrmCadastro_Grupo_Cliente.EdtDescricao.Text:= qrychama_grupoDescricao.AsString;
    FrmCadastro_Grupo_Cliente.MEdtData_Cadastro.Text:= qrychama_grupoData_Cadastro.AsString;
    FrmChama_Grupo_Cliente.Close;
    FrmCadastro_Grupo_Cliente.BBtnSalvar.Enabled:= true;
    FrmCadastro_Grupo_Cliente.BBtnExcluir.Enabled:= true;
    FrmCadastro_Grupo_Cliente.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Grupo_Cliente.BBtnCancelar.Enabled:= true;
    FrmCadastro_Grupo_Cliente.BBtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmCadastro_Grupo_Cliente);
    FrmCadastro_Grupo_Cliente.achei:= true;
  end
  else if (FrmCadastro_Cliente <> Nil) and (FrmCadastro_Cliente.ativo = true) then
  begin
    FrmCadastro_Cliente.EdtCodigo_Grupo.Text:= qrychama_grupoCodigo.AsString;
    FrmCadastro_Cliente.EdtGrupo.Text:= qrychama_grupoDescricao.AsString;
    FrmChama_Grupo_Cliente.Close;
  end;
end;

procedure TFrmChama_Grupo_Cliente.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui � definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui � definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State)
end;

procedure TFrmChama_Grupo_Cliente.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
    if (FrmCadastro_Grupo_Cliente <> Nil) and (FrmCadastro_Grupo_Cliente.ativo = true) then
    begin
      FrmCadastro_Grupo_Cliente.EdtCodigo.Text:= qrychama_grupoCodigo.AsString;
      FrmCadastro_Grupo_Cliente.EdtDescricao.Text:= qrychama_grupoDescricao.AsString;
      FrmCadastro_Grupo_Cliente.MEdtData_Cadastro.Text:= qrychama_grupoData_Cadastro.AsString;
      FrmChama_Grupo_Cliente.Close;
      FrmCadastro_Grupo_Cliente.BBtnSalvar.Enabled:= true;
      FrmCadastro_Grupo_Cliente.BBtnExcluir.Enabled:= true;
      FrmCadastro_Grupo_Cliente.BBtnPesquisar.Enabled:= true;
      FrmCadastro_Grupo_Cliente.BBtnCancelar.Enabled:= true;
      Util.Habilita_Campos(FrmCadastro_Grupo_Cliente);
      achei:= true;
    end
    else if (FrmCadastro_Cliente <> Nil) and (FrmCadastro_Cliente.ativo = true) then
      begin
        FrmCadastro_Cliente.EdtCodigo_Grupo.Text:= qrychama_grupoCodigo.AsString;
        FrmCadastro_Cliente.EdtGrupo.Text:= qrychama_grupoDescricao.AsString;
        FrmChama_Grupo_Cliente.Close;
      end;
    end;
end;

procedure TFrmChama_Grupo_Cliente.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Grupo(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Grupo_Cliente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Grupo_Cliente.Release;
end;

procedure TFrmChama_Grupo_Cliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
