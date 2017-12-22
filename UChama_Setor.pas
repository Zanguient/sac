unit UChama_Setor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Setor = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_setor: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_setorCodigo: TAutoIncField;
    qrychama_setorDescricao: TStringField;
    qrychama_setorData_Cadastro: TDateTimeField;
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
  FrmChama_Setor: TFrmChama_Setor;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Setor, UCadastro_Funcionarios, UCadastro_Forn_Fab,
  UCadastro_Empresa, UCadastro_Transportadora, UNFE, UDeclaracao;

{$R *.dfm}

procedure TFrmChama_Setor.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Setor.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Setor(EdtConsulta.Text);
end;

procedure TFrmChama_Setor.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Cliente <> NIL) and (FrmCadastro_Cliente.ativo = true) and (FrmCadastro_Cliente.seto = 0) then
    begin
      FrmCadastro_Cliente.EdtCodigo_Setor.Text:= qrychama_setorCodigo.AsString;
      FrmCadastro_Cliente.EdtSetor.Text:= qrychama_setorDescricao.AsString;
      FrmChama_Setor.Close;
    end
    else if (FrmCadastro_Cliente <> NIL) and (FrmCadastro_Cliente.ativo = true) and (FrmCadastro_Cliente.seto = 1) then
    begin
      FrmCadastro_Cliente.EdtCodigo_Setor_Outros.Text:= qrychama_setorCodigo.AsString;
      FrmCadastro_Cliente.EdtSetor_Outros.Text:= qrychama_setorDescricao.AsString;
      FrmChama_Setor.Close;
    end
    else if (FrmCadastro_Cliente <> NIL) and (FrmCadastro_Cliente.ativo = true) and (FrmCadastro_Cliente.seto = 2) then
    begin
      FrmCadastro_Cliente.EdtCodigo_Setor_DAC.Text:= qrychama_setorCodigo.AsString;
      FrmCadastro_Cliente.EdtSetor_DAC.Text:= qrychama_setorDescricao.AsString;
      FrmChama_Setor.Close;
    end
    else if (FrmCadastro_Setor <> Nil) and (FrmCadastro_Setor.ativo = true) then
    begin
      FrmCadastro_Setor.EdtCodigo.Text:= qrychama_setorCodigo.AsString;
      FrmCadastro_Setor.EdtDescricao.Text:= qrychama_setorDescricao.AsString;
      FrmCadastro_Setor.MEdtData_Cadastro.Text:= qrychama_setorData_Cadastro.AsString;
      FrmChama_Setor.Close;
      FrmCadastro_Setor.BBtnSalvar.Enabled:= true;
      FrmCadastro_Setor.BBtnExcluir.Enabled:= true;
      FrmCadastro_Setor.BBtnPesquisar.Enabled:= true;
      FrmCadastro_Setor.BBtnCancelar.Enabled:= true;
      FrmCadastro_Setor.BBtnNovo.Enabled:= False;
      Util.Habilita_Campos(FrmCadastro_Setor);
      FrmCadastro_Setor.achei:= true;
    end
    else if (FrmCadastro_Funcionarios <> Nil) and (FrmCadastro_Funcionarios.ativo = true) then
    begin
      FrmCadastro_Funcionarios.EdtCodigo_Setor.Text:= qrychama_setorCodigo.AsString;
      FrmCadastro_Funcionarios.EdtSetor.Text:= qrychama_setorDescricao.AsString;
      FrmChama_Setor.Close;
    end
    else if (FrmCadastro_Forn_Fab <> NIl) and (FrmCadastro_Forn_Fab.ativo = true) then
    begin
      FrmCadastro_Forn_Fab.EdtCodigo_Setor.Text:= qrychama_setorCodigo.AsString;
      FrmCadastro_Forn_Fab.EdtSetor.Text:= qrychama_setorDescricao.AsString;
      FrmChama_Setor.Close;
    end
    else if (FrmCadastro_Empresa <> Nil) and (FrmCadastro_Empresa.ativo = true) and (FrmCadastro_Empresa.contabilista = false) then
    begin
      FrmCadastro_Empresa.EdtCodigo_Setor.Text:= qrychama_setorCodigo.AsString;
      FrmCadastro_Empresa.EdtSetor.Text:= qrychama_setorDescricao.AsString;
      FrmChama_Setor.Close;
    end
    else if (FrmCadastro_Empresa <> Nil) and (FrmCadastro_Empresa.ativo = true) and (FrmCadastro_Empresa.contabilista = true) then
    begin
      FrmCadastro_Empresa.EdtCodigo_Setor_Contador.Text:= qrychama_setorCodigo.AsString;
      FrmCadastro_Empresa.EdtSetor_Contador.Text:= qrychama_setorDescricao.AsString;
      FrmChama_Setor.Close;
    end
    else if (FrmCadastro_Transportadora <> Nil) and (FrmCadastro_Transportadora.ativo = true) then
    begin
      FrmCadastro_Transportadora.EdtCodigo_Setor.Text:= qrychama_setorCodigo.AsString;
      FrmCadastro_Transportadora.EdtSetor.Text:= qrychama_setorDescricao.AsString;
      FrmChama_Setor.Close;
    end
    else if (FrmNFE <> Nil) and (FrmNFE.ativo = true) then
    begin
      //FrmNFE.EdtCodigo_Setor_Retirada.Text:= qrychama_setorCodigo.AsString;
      //FrmNFE.EdtSetor_Retirada.Text:= qrychama_setorDescricao.AsString;
      setor_emitente:= qrychama_setorDescricao.AsString;
      FrmChama_Setor.Close;
    end;
end;

procedure TFrmChama_Setor.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Setor.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Setor.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Setor(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Setor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Setor.Release;
end;

procedure TFrmChama_Setor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.

