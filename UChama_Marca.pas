unit UChama_Marca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Marca = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_marca: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_marcaCodigo: TAutoIncField;
    qrychama_marcaDescricao: TStringField;
    qrychama_marcaData_Cadastro: TDateTimeField;
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
  FrmChama_Marca: TFrmChama_Marca;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Marca, UCadastro_Produto, UCadastro_Veiculo,
  UConsulta_Produto_Cadastrado, UConsulta_Contagem_Estoque,
  UConsulta_Reposicao_Estoque, UCadastro_Patrimonio;

{$R *.dfm}

procedure TFrmChama_Marca.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Marca.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Marca(EdtConsulta.Text);
end;

procedure TFrmChama_Marca.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Marca <> Nil) and (FrmCadastro_Marca.ativo = true) and (FrmCadastro_Marca.marcaa = 0) then
  begin
    FrmCadastro_Marca.EdtCodigo.Text:= qrychama_marcaCodigo.AsString;
    FrmCadastro_Marca.EdtDescricao.Text:= qrychama_marcaDescricao.AsString;
    FrmCadastro_Marca.MEdtData_Cadastro.Text:= qrychama_marcaData_Cadastro.AsString;
    FrmCadastro_Marca.Pega_Produto_Marca;
    FrmChama_Marca.Close;
    FrmCadastro_Marca.BBtnSalvar.Enabled:= true;
    FrmCadastro_Marca.BBtnExcluir.Enabled:= true;
    FrmCadastro_Marca.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Marca.BBtnCancelar.Enabled:= true;
    FrmCadastro_Marca.BBtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmCadastro_Marca);
    FrmCadastro_Marca.achei:= true;
  end
  else if (FrmCadastro_Marca <> Nil) and (FrmCadastro_Marca.ativo = true) and (FrmCadastro_Marca.marcaa = 1) then
  begin
    FrmCadastro_Marca.EdtCodigo_Marca_Destino.Text:= qrychama_marcaCodigo.AsString;
    FrmCadastro_Marca.EdtMarca_Destino.Text:= qrychama_marcaDescricao.AsString;
    FrmChama_Marca.Close;
  end
  else if (FrmCadastro_Produto <> nIl) and (FrmCadastro_Produto.ativo = true) then
  begin
    FrmCadastro_Produto.EdtCodigo_Marca.Text:= qrychama_marcaCodigo.AsString;
    FrmCadastro_Produto.EdtMarca.Text:= qrychama_marcaDescricao.AsString;
    FrmChama_Marca.Close;
  end
  else if (FrmCadastro_Veiculo <> nIl) and (FrmCadastro_Veiculo.ativo = true) then
  begin
    FrmCadastro_Veiculo.EdtCodigo_Marca.Text:= qrychama_marcaCodigo.AsString;
    FrmCadastro_Veiculo.EdtMarca.Text:= qrychama_marcaDescricao.AsString;
    FrmChama_Marca.Close;
  end
  else if (FrmConsulta_Produto_Cadastrado <> nIl) and (FrmConsulta_Produto_Cadastrado.ativo = true) then
  begin
    FrmConsulta_Produto_Cadastrado.EdtCodigo.Text:= qrychama_marcaCodigo.AsString;
    FrmConsulta_Produto_Cadastrado.EdtDescricao.Text:= qrychama_marcaDescricao.AsString;
    FrmChama_Marca.Close;
  end
  else if (FrmConsulta_Contagem_Estoque <> nIl) and (FrmConsulta_Contagem_Estoque.ativo = true) then
  begin
    //FrmConsulta_Contagem_Estoque.EdtCodigo.Text:= qrychama_marcaCodigo.AsString;
    //FrmConsulta_Contagem_Estoque.EdtConsulta.Text:= qrychama_marcaDescricao.AsString;
    FrmChama_Marca.Close;
  end
  else if (FrmConsulta_Reposicao_Estoque <> nIl) and (FrmConsulta_Reposicao_Estoque.ativo = true) then
  begin
    FrmConsulta_Reposicao_Estoque.EdtCodigo.Text:= qrychama_marcaCodigo.AsString;
    FrmConsulta_Reposicao_Estoque.EdtDescricao.Text:= qrychama_marcaDescricao.AsString;
    FrmChama_Marca.Close;
  end
  else if (FrmCadastro_Patrimonio <> nIl) and (FrmCadastro_Patrimonio.ativo = true) then
  begin
    FrmCadastro_Patrimonio.EdtCodigo_Marca.Text:= qrychama_marcaCodigo.AsString;
    FrmCadastro_Patrimonio.EdtMarca.Text:= qrychama_marcaDescricao.AsString;
    FrmChama_Marca.Close;
  end;
end;

procedure TFrmChama_Marca.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Marca.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Marca.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Marca(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Marca.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Marca.Release;
end;

procedure TFrmChama_Marca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
