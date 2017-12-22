unit UChama_Cargo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta;

type
  TFrmChama_Cargo = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_cargo: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_cargoCodigo: TAutoIncField;
    qrychama_cargoDescricao: TStringField;
    qrychama_cargoData_Cadastro: TDateTimeField;
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
  FrmChama_Cargo: TFrmChama_Cargo;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Cargo, UCadastro_Funcionarios;

{$R *.dfm}

procedure TFrmChama_Cargo.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Cargo.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Cargo(EdtConsulta.Text);
end;

procedure TFrmChama_Cargo.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Cargo <> NIL) and (FrmCadastro_Cargo.ativo = true) then
  begin
    FrmCadastro_Cargo.EdtCodigo.Text:= qrychama_cargoCodigo.AsString;
    FrmCadastro_Cargo.EdtDescricao.Text:= qrychama_cargoDescricao.AsString;
    FrmCadastro_Cargo.MEdtData_Cadastro.Text:= qrychama_cargoData_Cadastro.AsString;
    FrmChama_Cargo.Close;
    FrmCadastro_Cargo.BBtnSalvar.Enabled:= true;
    FrmCadastro_Cargo.BBtnExcluir.Enabled:= true;
    FrmCadastro_Cargo.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Cargo.BBtnCancelar.Enabled:= true;
    FrmCadastro_Cargo.BBtnNovo.Enabled:= False;
    Util.Habilita_Campos(FrmCadastro_Cargo);
    FrmCadastro_Cargo.achei:= true;
  end
  else if (FrmCadastro_Funcionarios <> NIl) and (FrmCadastro_Funcionarios.ativo = true) then
  begin
    FrmCadastro_Funcionarios.EdtCodigo_Cargo.Text:= qrychama_cargoCodigo.AsString;
    FrmCadastro_Funcionarios.EdtCargo.Text:= qrychama_cargoDescricao.AsString;
    FrmChama_Cargo.Close;
  end;
end;

procedure TFrmChama_Cargo.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Cargo.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      if (FrmCadastro_Cargo <> NIL) and (FrmCadastro_Cargo.ativo = true) then
      begin
        FrmCadastro_Cargo.EdtCodigo.Text:= qrychama_cargoCodigo.AsString;
        FrmCadastro_Cargo.EdtDescricao.Text:= qrychama_cargoDescricao.AsString;
        FrmCadastro_Cargo.MEdtData_Cadastro.Text:= qrychama_cargoData_Cadastro.AsString;
        FrmChama_Cargo.Close;
        FrmCadastro_Cargo.BBtnSalvar.Enabled:= true;
        FrmCadastro_Cargo.BBtnExcluir.Enabled:= true;
        FrmCadastro_Cargo.BBtnPesquisar.Enabled:= true;
        FrmCadastro_Cargo.BBtnCancelar.Enabled:= true;
        FrmCadastro_Cargo.BBtnNovo.Enabled:= true;
        Util.Habilita_Campos(FrmCadastro_Cargo);
        achei:= true;
      end
      else if (FrmCadastro_Funcionarios <> NIl) and (FrmCadastro_Funcionarios.ativo = true) then
      begin
        FrmCadastro_Funcionarios.EdtCodigo_Cargo.Text:= qrychama_cargoCodigo.AsString;
        FrmCadastro_Funcionarios.EdtCargo.Text:= qrychama_cargoDescricao.AsString;
        FrmChama_Cargo.Close;
      end;
    end;
end;

procedure TFrmChama_Cargo.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Cargo(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Cargo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Cargo.Release;
end;

procedure TFrmChama_Cargo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
