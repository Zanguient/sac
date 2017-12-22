unit UChama_Itens_Folha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta;

type
  TFrmChama_Itens_Folha = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_itens: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_itensCodigo: TAutoIncField;
    qrychama_itensDescricao: TStringField;
    qrychama_itensNatureza: TStringField;
    qrychama_itensData_Cadastro: TDateTimeField;
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
  FrmChama_Itens_Folha: TFrmChama_Itens_Folha;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Itens_Folha_Pagamento, UFolha_Pagamento;

{$R *.dfm}

procedure TFrmChama_Itens_Folha.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Itens_Folha.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Itens_Folha(EdtConsulta.Text);
end;

procedure TFrmChama_Itens_Folha.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Itens_Folha_Pagamento <> NIL) and (FrmCadastro_Itens_Folha_Pagamento.ativo = true) then
    begin
      FrmCadastro_Itens_Folha_Pagamento.EdtCodigo.Text:= qrychama_itensCodigo.AsString;
      FrmCadastro_Itens_Folha_Pagamento.EdtDescricao.Text:= qrychama_itensDescricao.AsString;
      FrmCadastro_Itens_Folha_Pagamento.CmbNatureza.Text:= qrychama_itensNatureza.AsString;
      FrmCadastro_Itens_Folha_Pagamento.MEdtData_Cadastro.Text:= qrychama_itensData_Cadastro.AsString;
      FrmChama_Itens_Folha.Close;
      FrmCadastro_Itens_Folha_Pagamento.BBtnSalvar.Enabled:= true;
      FrmCadastro_Itens_Folha_Pagamento.BBtnExcluir.Enabled:= true;
      FrmCadastro_Itens_Folha_Pagamento.BBtnPesquisar.Enabled:= true;
      FrmCadastro_Itens_Folha_Pagamento.BBtnCancelar.Enabled:= true;
      FrmCadastro_Itens_Folha_Pagamento.BBtnNovo.Enabled:= false;
      Util.Habilita_Campos(FrmCadastro_Itens_Folha_Pagamento);
      FrmCadastro_Itens_Folha_Pagamento.achei:= true;
    end
    else if (FrmFolha_Pagamento <> NIl) and (FrmFolha_Pagamento.ativo = true) then
    begin
      FrmFolha_Pagamento.EdtCodigo_Item.Text:= qrychama_itensCodigo.AsString;
      FrmFolha_Pagamento.EdtItem.Text:= qrychama_itensDescricao.AsString;
      FrmFolha_Pagamento.EdtNatureza.Text:= qrychama_itensNatureza.AsString;
      FrmChama_Itens_Folha.Close;
    end;
end;

procedure TFrmChama_Itens_Folha.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Itens_Folha.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Itens_Folha.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Itens_Folha(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Itens_Folha.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Itens_Folha.Release;
end;

procedure TFrmChama_Itens_Folha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
