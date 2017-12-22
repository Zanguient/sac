unit UChama_Receita;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta;

type
  TFrmChama_Receita = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_receita: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_receitaCodigo: TIntegerField;
    qrychama_receitaCodigo_Empresa: TIntegerField;
    qrychama_receitaDescricao: TStringField;
    qrychama_receitaData_Cadastro: TDateTimeField;
    qrychama_receitaCodigo_Produto: TIntegerField;
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
  FrmChama_Receita: TFrmChama_Receita;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UReceita;

{$R *.dfm}

procedure TFrmChama_Receita.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Receita.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Receita;
end;

procedure TFrmChama_Receita.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Receita <> NIL) and (FrmCadastro_Receita.ativo = true) then
  begin
    FrmCadastro_Receita.EdtCodigo.Text:= qrychama_receitaCodigo.AsString;
    FrmCadastro_Receita.EdtIdProduto.Text:= qrychama_receitaCodigo_Produto.AsString;
    FrmCadastro_Receita.EdtProduto.Text:= qrychama_receitaDescricao.AsString;
    FrmCadastro_Receita.LblProd.Caption:= qrychama_receitaCodigo_Produto.AsString;
    FrmCadastro_Receita.MEdtData_Cadastro.Text:= qrychama_receitaData_Cadastro.AsString;
    FrmChama_Receita.Close;
    FrmCadastro_Receita.BBtnSalvar.Enabled:= true;
    FrmCadastro_Receita.BBtnExcluir.Enabled:= true;
    FrmCadastro_Receita.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Receita.BBtnCancelar.Enabled:= true;
    FrmCadastro_Receita.BbtnNovo.Enabled:= False;
    Util.Habilita_Campos(FrmCadastro_Receita);
    FrmCadastro_Receita.achei:= true;
    Consulta.Chama_Itens_Receita;
  end;
end;

procedure TFrmChama_Receita.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Receita.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Receita.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Receita;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Receita.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Receita.Release;
end;

procedure TFrmChama_Receita.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
