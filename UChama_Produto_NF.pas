unit UChama_Produto_NF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, DBClient, Provider, URegistro;

type
  TFrmChama_Produto_NF = class(TForm)
    DBGrid1: TDBGrid;
    EdtPedido: TEdit;
    ImgImagens: TImageList;
    LblMarca: TLabel;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_pedido: TADOQuery;
    Panel1: TPanel;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    DBGrid3: TDBGrid;
    Panel3: TPanel;
    EdtCFOP: TEdit;
    ds_qryitens_pedido: TDataSource;
    qryitens_pedido: TADOQuery;
    ds_qrycfop: TDataSource;
    qrycfop: TADOQuery;
    qrycfopCodigo: TAutoIncField;
    qrycfopCFOP: TStringField;
    qrycfopDescricao: TStringField;
    qrycfopData_Cadastro: TDateTimeField;
    qrychama_pedidoCodigo: TIntegerField;
    qrychama_pedidoN_Pedido: TStringField;
    qrychama_pedidoN_Pre_Venda: TStringField;
    qrychama_pedidoCOO: TStringField;
    qrychama_pedidoCOO_Vin: TStringField;
    qrychama_pedidoCCF: TStringField;
    qrychama_pedidoCodigo_Cliente: TIntegerField;
    qrychama_pedidoCodigo_Empresa: TIntegerField;
    qrychama_pedidoCodigo_Veiculo: TIntegerField;
    qrychama_pedidoCodigo_Funcionario: TIntegerField;
    qrychama_pedidoData_Venda: TDateTimeField;
    qrychama_pedidoData_Previsao_Entrega: TDateTimeField;
    qrychama_pedidoHora_Entrega: TStringField;
    qrychama_pedidoQtde_Itens: TIntegerField;
    qrychama_pedidoQtde_Servicos: TIntegerField;
    qrychama_pedidoTotal_Produtos: TFloatField;
    qrychama_pedidoTotal_Servicos: TFloatField;
    qrychama_pedidoPeso_Total: TFloatField;
    qrychama_pedidoDesconto: TFloatField;
    qrychama_pedidoTipo_Desconto: TStringField;
    qrychama_pedidoAcrecimo: TFloatField;
    qrychama_pedidoTipo_Acrecimo: TStringField;
    qrychama_pedidoTotal_Pedido: TFloatField;
    qrychama_pedidoTotal_Desconto: TFloatField;
    qrychama_pedidoTotal_Acrecimo: TFloatField;
    qrychama_pedidoTipo: TStringField;
    qrychama_pedidoStatus: TStringField;
    qrychama_pedidoValor_Recebido: TFloatField;
    qrychama_pedidoTroco: TFloatField;
    qrychama_pedidoMesclada: TIntegerField;
    qrychama_pedidoProblema_Reclamado: TStringField;
    qrychama_pedidoProblema_Constatado: TStringField;
    qrychama_pedidoSolucao: TStringField;
    qrychama_pedidoNome_Nome_Fantasia: TStringField;
    qrychama_pedidoCPF: TStringField;
    qryitens_pedidoCodigo: TIntegerField;
    qryitens_pedidoN_Item: TStringField;
    qryitens_pedidoCodigo_Produto: TIntegerField;
    qryitens_pedidoQtde: TFloatField;
    qryitens_pedidoQtde_Entregue: TFloatField;
    qryitens_pedidoQtde_Restante: TFloatField;
    qryitens_pedidoValor_Unitario: TFloatField;
    qryitens_pedidoDesconto: TFloatField;
    qryitens_pedidoTipo_Desconto: TStringField;
    qryitens_pedidoAcrecimo: TFloatField;
    qryitens_pedidoTipo_Acrecimo: TStringField;
    qryitens_pedidoSub_Total: TFloatField;
    qryitens_pedidoCancelado: TStringField;
    qryitens_pedidoCodigo_Venda: TStringField;
    qryitens_pedidoDescricao: TStringField;
    qryitens_pedidoUnidade: TStringField;
    qryitens_pedidoCodigo_1: TAutoIncField;
    qryitens_pedidoCodigo_NCM: TStringField;
    qryitens_pedidoDescricao_1: TStringField;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    BBtnInserir: TToolButton;
    BBtnLimpar: TToolButton;
    BBtnFechar: TToolButton;
    ToolButton1: TToolButton;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    EdtValor_Frete: TEdit;
    EdtValor_Seguro: TEdit;
    EdtOutras_Despesas: TEdit;
    EdtValor_Total_Bruto: TEdit;
    Label10: TLabel;
    EdtDesconto: TEdit;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure BBtnLimparClick(Sender: TObject);
    procedure EdtCFOPChange(Sender: TObject);
    procedure BBtnInserirClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    codigo_ncm, descricao_ncm: AnsiString;
    Itens_NF: TItens_NF;
    procedure Limpa;
    procedure Atualiza_Itens_Pedido;
    procedure Atualiza_Itens_Pedido_NF;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Produto_NF: TFrmChama_Produto_NF;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UDeclaracao;

{$R *.dfm}

procedure TFrmChama_Produto_NF.Atualiza_Itens_Pedido;
begin
  with qryitens_pedido, sql do
  begin
    close;
    clear;
    add('select IP.*, P.Codigo_Venda, P.Descricao, UM.sigla as Unidade, NCM.Codigo, NCM.Codigo_NCM, NCM.Descricao from Itens_Pedido IP');
    add('inner join Pedido Ped on (Ped.Codigo = IP.Codigo)');
    add('inner join Produto P on(IP.Codigo_Produto = P.Codigo)');
    add('inner join Unidade_Medida UM on(P.Codigo_Unidade_Medida = UM.Codigo)');
    add('inner join NCM on (P.Codigo_NCM = NCM.Codigo)');
    add('where IP.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= qrychama_pedidoCodigo.AsInteger;
    open;
  end;
end;

procedure TFrmChama_Produto_NF.Atualiza_Itens_Pedido_NF;
begin
  with FrmNFE.qryitens_nf, sql do
  begin
    close;
    clear;
    add('select * from Itens_NF');
    add('where Itens_NF.N_Nota_Fiscal = :Nota');
    Parameters.ParamByName('Nota').Value:= FrmNFE.EdtN_Nota_Fiscal.Text;
    open;
  end;
end;

procedure TFrmChama_Produto_NF.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Produto_NF.BBtnInserirClick(Sender: TObject);
begin
  if (Application.MessageBox('Confirma a inclusão do registro selecionado?', 'Confirmação', MB_YESNO+MB_ICONQUESTION)) = idyes then
  begin
    Itens_NF.Inserir(Itens_NF);
    Limpa;
    Atualiza_Itens_Pedido_NF;
  end;
end;

procedure TFrmChama_Produto_NF.BBtnLimparClick(Sender: TObject);
begin
  qrychama_pedido.Close;
  qryitens_pedido.Close;
  qrycfop.Close;
  EdtCFOP.Clear;
end;

procedure TFrmChama_Produto_NF.DBGrid1CellClick(Column: TColumn);
begin
  if (qrychama_pedido.IsEmpty = false) then
  begin
    Atualiza_Itens_Pedido;
  end;
end;

procedure TFrmChama_Produto_NF.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Produto_NF.DBGrid2CellClick(Column: TColumn);
begin
  codigo_ncm:= qryitens_pedidoCodigo_NCM.AsString;
  descricao_ncm:= qryitens_pedidoDescricao_1.AsString;
end;

procedure TFrmChama_Produto_NF.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Produto_NF.DBGrid3DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Produto_NF.EdtCFOPChange(Sender: TObject);
begin
  with qrycfop do
    begin
      close;
      SQL.Clear;
      SQL.Add('select * from Cadastro_CFOP where CFOP like '''+ EdtCFOP.Text +'%''');
      open;
    end;
end;

procedure TFrmChama_Produto_NF.EdtPedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    with qrychama_pedido, sql do
    begin
      close;
      clear;
      add('select P.*, C.Nome_Nome_Fantasia, C.CPF from Pedido P');
      add('left join Cliente C on (C.Codigo = P.Codigo_Cliente)');
      add('where P.N_Pre_Venda = :Venda');
      Parameters.ParamByName('Venda').Value:= EdtPedido.Text;
      open;
    end;

    with qrycfop, sql do
    begin
      close;
      clear;
      add('select * from Cadastro_CFOP');
      open;
    end;
  end;
end;

procedure TFrmChama_Produto_NF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Produto_NF.Release;
end;

procedure TFrmChama_Produto_NF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Produto_NF.Limpa;
begin
  EdtValor_Frete.Text:= '0,00';
  EdtValor_Seguro.Text:= '0,00';
  EdtDesconto.Text:= '0,00';
  EdtOutras_Despesas.Text:= '0,00';
  EdtValor_Total_Bruto.Text:= '0,00';
  EdtCFOP.Clear;
  qrycfop.Close;
  qrycfop.Open;
  Atualiza_Itens_Pedido;
end;

procedure TFrmChama_Produto_NF.ToolButton1Click(Sender: TObject);
begin
  if (Application.MessageBox('Confirma a inclusão do registro selecionado? Caso confirme Sim, a janela será fechada.', 'Confirmação', MB_OK+MB_ICONQUESTION)) = idyes then
  begin
    Itens_NF.Inserir(Itens_NF);
    Limpa;
    close;
  end;
end;

end.
