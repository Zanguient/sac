unit UChama_Pedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta;

type
  TFrmChama_Pedido = class(TForm)
    DBGrid1: TDBGrid;
    EdtConsulta: TEdit;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_pedido: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_pedidoCodigo: TIntegerField;
    qrychama_pedidoN_Pedido: TStringField;
    qrychama_pedidoCodigo_Produto: TIntegerField;
    qrychama_pedidoQtde: TFloatField;
    qrychama_pedidoValor_Unitario: TFloatField;
    qrychama_pedidoDesconto: TFloatField;
    qrychama_pedidoTipo_Desconto: TStringField;
    qrychama_pedidoSub_Total: TFloatField;
    qrychama_pedidoCodigo_Venda: TStringField;
    qrychama_pedidoDescricao: TStringField;
    qrychama_pedidoSigla: TStringField;
    qrychama_pedidoICMS: TIntegerField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Pedido: TFrmChama_Pedido;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UPedido_Venda, UPre_Venda;

{$R *.dfm}

procedure TFrmChama_Pedido.BBtnFecharClick(Sender: TObject);
begin
  FrmChama_Pedido.Close;
end;

procedure TFrmChama_Pedido.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Pedido(EdtConsulta.Text);
end;

procedure TFrmChama_Pedido.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmPedido_Venda <> Nil) and (FrmPedido_Venda.ativo = true) then
  begin
    FrmPedido_Venda.EdtCodigo_Produto.Text:= qrychama_pedidoCodigo_Venda.AsString;
    FrmPedido_Venda.EdtProduto.Text:= qrychama_pedidoDescricao.AsString;
    FrmPedido_Venda.EdtUnidade.Text:= qrychama_pedidoSigla.AsString;
    FrmPedido_Venda.EdtQuantidade.Text:= qrychama_pedidoQtde.AsString;
    FrmPedido_Venda.EdtValor_Unitario.Text:= qrychama_pedidoValor_Unitario.AsString;
    FrmPedido_Venda.LblProduto.Caption:= qrychama_pedidoCodigo_Produto.AsString;
    FrmPedido_Venda.EdtST.Text:= qrychama_pedidoICMS.AsString;
    FrmPedido_Venda.EdtCodigo_Produto.SetFocus;
    //FrmPedido_Venda.var_uni:= qrychama_pedidoValor_Unitario.AsFloat;
    FrmChama_Pedido.Close;
  end
  else if (FrmPre_Venda <> nil) and (FrmPre_Venda.ativo = true) then
  begin
    FrmPre_Venda.EdtCodigo_Produto.Text:= qrychama_pedidoCodigo_Venda.AsString;
    FrmPre_Venda.EdtProduto.Text:= qrychama_pedidoDescricao.AsString;
    FrmPre_Venda.EdtUnidade.Text:= qrychama_pedidoSigla.AsString;
    FrmPre_Venda.EdtValor_Unitario.Text:= qrychama_pedidoValor_Unitario.AsString;
    FrmPre_Venda.EdtQuantidade.Text:= qrychama_pedidoQtde.AsString;
    FrmPre_Venda.LblProduto.Caption:= qrychama_pedidoCodigo_Produto.AsString;
    FrmPre_Venda.EdtST.Text:= qrychama_pedidoICMS.AsString;
    FrmPre_Venda.EdtCodigo_Produto.SetFocus;
    FrmPre_Venda.var_uni:= qrychama_pedidoValor_Unitario.AsFloat;
    FrmChama_Pedido.Close;
  end;
end;

procedure TFrmChama_Pedido.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Pedido.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Pedido.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    Consulta.Chama_Pedido(EdtConsulta.Text);
end;

procedure TFrmChama_Pedido.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Pedido.Release;
end;

procedure TFrmChama_Pedido.FormCreate(Sender: TObject);
begin
  EdtConsulta.Text:= '00000000';
end;

procedure TFrmChama_Pedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    FrmChama_Pedido.close;
end;

end.
