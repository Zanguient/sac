unit UChama_Cidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta;

type
  TFrmChama_Cidade = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_cidade: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_cidadeCodigo: TAutoIncField;
    qrychama_cidadeDescricao: TStringField;
    qrychama_cidadeUF: TStringField;
    qrychama_cidadeDDD: TStringField;
    qrychama_cidadeData_Cadastro: TDateTimeField;
    qrychama_cidadeCodigo_Municipio: TStringField;
    qrychama_cidadeCodigo_Pais: TIntegerField;
    qrychama_cidadePais: TStringField;
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
  FrmChama_Cidade: TFrmChama_Cidade;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Cidade, UCadastro_Cliente, UCadastro_Funcionarios,
  UCadastro_Forn_Fab, UCadastro_Empresa, UCadastro_Transportadora, UNFE,
  UDeclaracao;

{$R *.dfm}

procedure TFrmChama_Cidade.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Cidade.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Cidade(EdtConsulta.Text);
end;

procedure TFrmChama_Cidade.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Cidade <> NIl) and (FrmCadastro_Cidade.ativo = true) then
  begin
    FrmCadastro_Cidade.EdtCodigo.Text:= qrychama_cidadeCodigo.AsString;
    FrmCadastro_Cidade.EdtCidade.Text:= qrychama_cidadeDescricao.AsString;
    FrmCadastro_Cidade.CmbUF.Text:= qrychama_cidadeUF.AsString;
    FrmCadastro_Cidade.EdtDDD.Text:= qrychama_cidadeDDD.AsString;
    FrmCadastro_Cidade.EdtCodigo_Cidade.Text:= qrychama_cidadeCodigo_Municipio.AsString;
    FrmCadastro_Cidade.MEdtData_Cadastro.Text:= qrychama_cidadeData_Cadastro.AsString;
    FrmCadastro_Cidade.EdtCodigo_Pais.Text:= qrychama_cidadeCodigo_Pais.AsString;
    FrmCadastro_Cidade.EdtPais.Text:= qrychama_cidadePais.AsString;
    FrmChama_Cidade.Close;
    FrmCadastro_Cidade.BBtnSalvar.Enabled:= true;
    FrmCadastro_Cidade.BBtnExcluir.Enabled:= true;
    FrmCadastro_Cidade.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Cidade.BBtnCancelar.Enabled:= true;
    FrmCadastro_Cidade.BBtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmCadastro_Cidade);
    FrmCadastro_Cidade.achei:= true;
  end
  else if (FrmCadastro_Cliente <> NIl) and (FrmCadastro_Cliente.ativo = true) and (FrmCadastro_Cliente.cid = 0) then
  begin
    FrmCadastro_Cliente.EdtCodigo_Cidade.Text:= qrychama_cidadeCodigo.AsString;
    FrmCadastro_Cliente.EdtCidade.Text:= qrychama_cidadeDescricao.AsString;
    FrmCadastro_Cliente.EdtUF.Text:= qrychama_cidadeUF.AsString;
    FrmChama_Cidade.Close;
  end
  else if (FrmCadastro_Cliente <> NIl) and (FrmCadastro_Cliente.ativo = true) and (FrmCadastro_Cliente.cid = 1) then
  begin
    FrmCadastro_Cliente.EdtCodigo_Cidade_DAC.Text:= qrychama_cidadeCodigo.AsString;
    FrmCadastro_Cliente.EdtCidade_DAC.Text:= qrychama_cidadeDescricao.AsString;
    FrmChama_Cidade.Close;
  end
  else if (FrmCadastro_Cliente <> NIl) and (FrmCadastro_Cliente.ativo = true) and (FrmCadastro_Cliente.cid = 2) then
  begin
    FrmCadastro_Cliente.txtEdtCodCidadeOutros.Text:= qrychama_cidadeCodigo.AsString;
    FrmCadastro_Cliente.txtEdtCidadeOutros.Text:= qrychama_cidadeDescricao.AsString;
    FrmChama_Cidade.Close;
  end
  else if (FrmCadastro_Funcionarios <> Nil) and (FrmCadastro_Funcionarios.ativo = true) then
  begin
    FrmCadastro_Funcionarios.EdtCodigo_Cidade.Text:= qrychama_cidadeCodigo.AsString;
    FrmCadastro_Funcionarios.EdtCidade.Text:= qrychama_cidadeDescricao.AsString;
    FrmCadastro_Funcionarios.EdtUF.Text:= qrychama_cidadeUF.AsString;
    FrmChama_Cidade.Close;
  end
  else if (FrmCadastro_Forn_Fab <> Nil) and (FrmCadastro_Forn_Fab.ativo = true) then
  begin
    FrmCadastro_Forn_Fab.EdtCodigo_Cidade.Text:= qrychama_cidadeCodigo.AsString;
    FrmCadastro_Forn_Fab.EdtCidade.Text:= qrychama_cidadeDescricao.AsString;
    FrmCadastro_Forn_Fab.EdtUF.Text:= qrychama_cidadeUF.AsString;
    FrmChama_Cidade.Close;
  end
  else if (FrmCadastro_Empresa <> NIl) and (FrmCadastro_Empresa.ativo = true) and (FrmCadastro_Empresa.contabilista = false) then
  begin
    FrmCadastro_Empresa.EdtCodigo_Cidade.Text:= qrychama_cidadeCodigo.AsString;
    FrmCadastro_Empresa.EdtCidade.Text:= qrychama_cidadeDescricao.AsString;
    FrmCadastro_Empresa.EdtUF.Text:= qrychama_cidadeUF.AsString;
    FrmChama_Cidade.Close;
  end
  else if (FrmCadastro_Empresa <> NIl) and (FrmCadastro_Empresa.ativo = true) and (FrmCadastro_Empresa.contabilista = true) then
  begin
    FrmCadastro_Empresa.EdtCodigo_Cidade_Contador.Text:= qrychama_cidadeCodigo.AsString;
    FrmCadastro_Empresa.EdtCidade_Contador.Text:= qrychama_cidadeDescricao.AsString;
    FrmCadastro_Empresa.EdtUF_Contador.Text:= qrychama_cidadeUF.AsString;
    FrmChama_Cidade.Close;
  end
  else if (FrmCadastro_Transportadora <> NIl) and (FrmCadastro_Transportadora.ativo = true) then
  begin
    FrmCadastro_Transportadora.EdtCodigo_Cidade.Text:= qrychama_cidadeCodigo.AsString;
    FrmCadastro_Transportadora.EdtCidade.Text:= qrychama_cidadeDescricao.AsString;
    FrmCadastro_Transportadora.EdtUF.Text:= qrychama_cidadeUF.AsString;
    FrmChama_Cidade.Close;
  end
  else if (FrmNFE <> NIl) and (FrmNFE.ativo = true) then
  begin
    {FrmNFE.LblMunicipio_Retirada.Caption:= qrychama_cidadeCodigo.AsString;
    FrmNFE.EdtCodigo_Municipio_Retirada.Text:= qrychama_cidadeCodigo_Municipio.AsString;
    FrmNFE.EdtMunicipio_Retirada.Text:= qrychama_cidadeDescricao.AsString;
    FrmNFE.EdtUF_Retirada.Text:= qrychama_cidadeUF.AsString;}
    codigo_municipio_emitente:= qrychama_cidadeCodigo_Municipio.AsString;
    municipio_emitente:= qrychama_cidadeDescricao.AsString;
    uf_emitente:= qrychama_cidadeUF.AsString;
    FrmChama_Cidade.Close;
  end;
end;

procedure TFrmChama_Cidade.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Cidade.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Cidade.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Cidade(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Cidade.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Cidade.Release;
end;

procedure TFrmChama_Cidade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
