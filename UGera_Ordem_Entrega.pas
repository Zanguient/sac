unit UGera_Ordem_Entrega;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls, Provider, DBClient, RSPrint, Buttons, StrUtils;

type
  TFrmGera_Ordem_Entrega = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnPesquisa: TToolButton;
    BBtnGera_Entrega: TToolButton;
    BBtnFechar: TToolButton;
    qrypedido: TADOQuery;
    rs: TRSPrinter;
    LblCPF: TLabel;
    LblEndereco: TLabel;
    LblSetor: TLabel;
    LblTelefone: TLabel;
    LblCidade: TLabel;
    LblUF: TLabel;
    LblTipo_Logradouro: TLabel;
    LblNumero: TLabel;
    LblPedido: TLabel;
    qryitens_pedido: TADOQuery;
    ds_qry_itens_compra: TDataSource;
    qryitens_pedidoCodigo: TIntegerField;
    qryitens_pedidoCodigo_Produto: TIntegerField;
    qryitens_pedidoQtde: TFloatField;
    qryitens_pedidoValor_Unitario: TFloatField;
    qryitens_pedidoDesconto: TFloatField;
    qryitens_pedidoTipo_Desconto: TStringField;
    qryitens_pedidoSub_Total: TFloatField;
    qryitens_pedidoCodigo_Venda: TStringField;
    qryitens_pedidoDescricao: TStringField;
    qryitens_pedidoSigla: TStringField;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LblProduto: TLabel;
    DBGrid1: TDBGrid;
    EdtCodigo_Produto: TEdit;
    EdtProduto: TEdit;
    EdtUnidade: TEdit;
    EdtQtde_Pedido: TEdit;
    DBGrid2: TDBGrid;
    ds_qry_compra: TDataSource;
    Panel1: TPanel;
    qryitens_pedidoQtde_Entregue: TFloatField;
    qryitens_pedidoQtde_Restante: TFloatField;
    Label1: TLabel;
    EdtQtde_Entregue: TEdit;
    Label2: TLabel;
    EdtQtde_Restante: TEdit;
    BBtnAltera: TToolButton;
    TabSheet2: TTabSheet;
    RGConsulta_Por: TRadioGroup;
    LblData_Cadastro: TLabel;
    MEdtData_Inicial: TMaskEdit;
    Label3: TLabel;
    MEdtData_Final: TMaskEdit;
    LblNome: TLabel;
    EdtCodigo_Cliente: TEdit;
    EdtCliente: TEdit;
    Label4: TLabel;
    EdtN_Pedido: TEdit;
    Label8: TLabel;
    EdtValor_Inicial: TEdit;
    Label9: TLabel;
    EdtValor_Final: TEdit;
    RGOrdena_Por: TRadioGroup;
    BBtnLimpar: TToolButton;
    qrypedidoCodigo: TIntegerField;
    qrypedidoN_Pedido: TStringField;
    qrypedidoN_Pre_Venda: TStringField;
    qrypedidoCOO: TStringField;
    qrypedidoCOO_Vin: TStringField;
    qrypedidoCCF: TStringField;
    qrypedidoCodigo_Cliente: TIntegerField;
    qrypedidoCodigo_Empresa: TIntegerField;
    qrypedidoCodigo_Veiculo: TIntegerField;
    qrypedidoCodigo_Funcionario: TIntegerField;
    qrypedidoCodigo_Tabela_Preco: TIntegerField;
    qrypedidoData_Venda: TDateTimeField;
    qrypedidoData_Previsao_Entrega: TDateTimeField;
    qrypedidoHora_Entrega: TStringField;
    qrypedidoQtde_Itens: TIntegerField;
    qrypedidoQtde_Servicos: TIntegerField;
    qrypedidoTotal_Produtos: TFloatField;
    qrypedidoTotal_Servicos: TFloatField;
    qrypedidoPeso_Total: TFloatField;
    qrypedidoDesconto: TFloatField;
    qrypedidoTipo_Desconto: TStringField;
    qrypedidoAcrecimo: TFloatField;
    qrypedidoTipo_Acrecimo: TStringField;
    qrypedidoTotal_Pedido: TFloatField;
    qrypedidoTotal_Desconto: TFloatField;
    qrypedidoTotal_Acrecimo: TFloatField;
    qrypedidoTipo: TStringField;
    qrypedidoStatus: TStringField;
    qrypedidoValor_Recebido: TFloatField;
    qrypedidoTroco: TFloatField;
    qrypedidoMesclada: TIntegerField;
    qrypedidoProblema_Reclamado: TStringField;
    qrypedidoProblema_Constatado: TStringField;
    qrypedidoSolucao: TStringField;
    qrypedidoNome_Nome_Fantasia: TStringField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Limpa_Menor;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtQtde_RestanteEnter(Sender: TObject);
    procedure EdtQtde_RestanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Atualiza_Dados;
    procedure Chama_Itens;
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnAlteraClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EdtCodigo_ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnPesquisaClick(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure Dados_Cliente;
    procedure Comprovante_Entrega;
    procedure BBtnGera_EntregaClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtClienteKeyPress(Sender: TObject; var Key: Char);
  private
    Compra: URegistro.TCompra;
    Itens_Compra: URegistro.TItens_Compra;
    Util: TUtil;
    qtde_itens: integer;
  public
    ativo: boolean;
    tipo: string;
  end;

var
  FrmGera_Ordem_Entrega: TFrmGera_Ordem_Entrega;
implementation

uses UDM, UChama_Produto, UChama_Cliente, UChama_Condicao_Pagamento,
  UDeclaracao, UChama_Fornecedor, UChama_Funcionario, UAltera_Data_Pedido;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmGera_Ordem_Entrega.Atualiza_Dados;
var
  qAux: TADOQuery;
begin
  try
  qAux:= TADOQuery.Create(self);
  with qAux, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('update Itens_Pedido set Qtde_Entregue = :Qtde_Entregue, Qtde_Restante = :Qtde_Restante');
    add('where Codigo = :Codigo and Codigo_Produto = :Produto');
    Parameters.ParamByName('Qtde_Entregue').Value:= StrToFloat(EdtQtde_Entregue.Text);
    Parameters.ParamByName('Qtde_Restante').Value:= StrToFloat(EdtQtde_Restante.Text);
    Parameters.ParamByName('Codigo').Value:= qrypedidoCodigo.AsInteger;
    Parameters.ParamByName('Produto').Value:= StrToInt(LblProduto.Caption);
    ExecSQL;
  end;
  finally
    FreeAndNil(qAux);
  end;

  Chama_Itens;
end;

procedure TFrmGera_Ordem_Entrega.BBtnAlteraClick(Sender: TObject);
begin
  Application.CreateForm(TFrmAltera_Data_Pedido, FrmAltera_Data_Pedido);
  FrmAltera_Data_Pedido.Show;
end;

procedure TFrmGera_Ordem_Entrega.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmGera_Ordem_Entrega.BBtnGera_EntregaClick(Sender: TObject);
begin
  Comprovante_Entrega;
  UDeclaracao.Insere_Historico(usuario, 'GEROU ORDEM DE ENTREGA DE MERCADORIAS.', TimeToStr(time), insercao, date);
end;

procedure TFrmGera_Ordem_Entrega.BBtnLimparClick(Sender: TObject);
begin
  PageControl1.TabIndex:= 0;
  TabSheet1.Enabled:= false;
  qrypedido.Close;
  qryitens_pedido.Close;
  BBtnPesquisa.Enabled:= true;
  BBtnGera_Entrega.Enabled:= false;
  BBtnAltera.Enabled:= false;
  BBtnLimpar.Enabled:= false;
end;

procedure TFrmGera_Ordem_Entrega.BBtnPesquisaClick(Sender: TObject);
begin
  Consulta.Chama_Ordem_Entrega;
  BBtnPesquisa.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  if (qrypedido.IsEmpty = false) then
  begin
    TabSheet1.Enabled:= true;
    PageControl1.TabIndex:= 1;
  end;
end;

procedure TFrmGera_Ordem_Entrega.Button1Click(Sender: TObject);
begin
  Centraliza_Form(FrmGera_Ordem_Entrega);
end;

procedure TFrmGera_Ordem_Entrega.Chama_Itens;
begin
  with qryitens_pedido, sql do
  begin
    close;
    clear;
    add('select IP.*, P.Codigo_Venda, P.Descricao, UM.Sigla from Itens_Pedido IP');
    add('inner join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
    add('where IP.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= qrypedidoCodigo.AsString;
    open;
  end;
end;

procedure TFrmGera_Ordem_Entrega.Comprovante_Entrega;
var
  i, i2, linha: integer;
  titulo, cn, cp, rodape: string;
  qAux: TADOQuery;
  estoque: double;
begin
  qAux:= TADOQuery.Create(self);
  rs.BeginDoc;
  i:= 0;
  i2:= 135;
  titulo:= 'COMPROVANTE DE ENTREGA';
  rs.Write(2, Alinha_Centro(titulo,i2), titulo);
  for i := 0 to i2 do
    rs.Write(3,i,'-');

  cn:= Copy(cnpj,1,2)+'.'+Copy(cnpj,3,3)+'.'+Copy(cnpj,6,3)+'/'+
    Copy(cnpj,9,4)+'-'+Copy(cnpj,13,2);

  cp:= Copy(LblCPF.Caption,1,3)+'.'+Copy(LblCPF.Caption,4,3)+'.'+Copy(LblCPF.Caption,7,3)+'-'+
    Copy(LblCPF.Caption,10,2);

  rs.Write(5,0, 'EMPRESA: ' + nome_fantasia); rs.Write(5,60, 'ENDEREÇO: ' + tipo_endereco + ' ' + endereco + ', ' + numero);

  rs.Write(6,0, 'CNPJ: ' + cn); RS.Write(6,30, 'INSC. ESTADUAL: ' + insc_estadual); RS.Write(6,60, 'INSC. MUNICIPAL: ' + insc_municipal);

  rs.Write(7,0, 'TELEFONE: ' + telefone);

  i:= 1;
  for i := 0 to i2 do
    rs.Write(8,i,'-');

  rs.Write(9,0, 'CLIENTE: ' + qrypedidoNome_Nome_Fantasia.AsString); rs.Write(9,60, 'ENDEREÇO: ' + LblTipo_Logradouro.Caption + ' ' + LblEndereco.Caption + ', ' + LblNumero.Caption);

  rs.Write(10,0, 'CPF/CNPJ: ' + cp); rs.Write(10,30, 'CIDADE: ' + LblCidade.Caption); rs.Write(10,60,'UF: ' + LblUF.Caption);

  rs.Write(11,0, 'SETOR: ' + LblSetor.Caption); rs.Write(11, 30, 'TELEFONE: ' + LblTelefone.Caption);

  i:= 1;
  for i := 0 to i2 do
    rs.Write(12,i, '-');

  rs.Write(13, 0, 'PEDIDO');
  i:= 1;
  for i := 0 to 20 do
    rs.Write(14,i, '-');

  rs.WriteFont(15,0,'PRÉ-VENDA',[Underline]);
  rs.WriteFont(15,15,'DATA VENDA',[Underline]);
  rs.WriteFont(15,40,'PREV. ENT.',[Underline]);
  rs.WriteFont(15,60,'HORA ENT.',[Underline]);
  rs.WriteFont(15,75,'TOTAL PEDIDO',[Underline]);

  rs.Write(17, 0, qrypedidoN_Pre_Venda.AsString);
  rs.Write(17, 15, qrypedidoData_Venda.AsString);
  rs.Write(17, 40, qrypedidoData_Previsao_Entrega.AsString);
  rs.Write(17, 60, qrypedidoHora_Entrega.AsString);
  rs.Write(17, 75, qrypedidoTotal_Pedido.AsString);

  rs.Write(19, 0, 'ITENS DO PEDIDO');
  i:= 1;
  for i := 0 to 20 do
    rs.Write(20,i, '-');

  rs.WriteFont(21,0,'CÓDIGO PRODUTO', [Underline]);
  rs.WriteFont(21, 16, 'DESCRIÇÃO', [Underline]);
  rs.WriteFont(21, 60, 'UN.', [Underline]);
  rs.WriteFont(21, 66, 'QTDE. PENDENTE', [Underline]);
  rs.WriteFont(21, 86, 'QTDE. ENTREGUE', [Underline]);
  rs.WriteFont(21, 106, 'QTDE. RESTANTE', [Underline]);

  qryitens_pedido.First;
  linha:= 23;

  qAux:= TADOQuery.Create(self);
  with qAux, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select P.Codigo, P.Codigo_Venda, P.Descricao, P.Estoque, P.Tipo, ');
    add('P.Volume, UM.Sigla from Produto P');
    add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
    open;
  end;

  while not qryitens_pedido.Eof do
  begin
    qAux.Locate('Codigo', qryitens_pedidoCodigo_Produto.AsInteger, []);
    rs.Write(linha, 0, qryitens_pedidoCodigo_Venda.AsString);
    rs.Write(linha, 16, qryitens_pedidoDescricao.AsString);
    rs.Write(linha, 60, qryitens_pedidoSigla.AsString);
    rs.Write(linha, 66, FormatFloat('#0.0,0', qryitens_pedidoQtde.AsFloat));
    rs.Write(linha, 86, FormatFloat('#0.0,0', qryitens_pedidoQtde_Entregue.AsFloat));
    rs.Write(linha, 106, FormatFloat('#0.0,0', qryitens_pedidoQtde_Restante.AsFloat));

    estoque:= qAux.FieldByName('Estoque').AsFloat - qryitens_pedidoQtde_Entregue.AsFloat;
    Atualiza_Estoque(dm.ADOConnection1, estoque, qAux.FieldByName('Codigo').AsInteger);
    Atualiza_Volume(dm.ADOConnection1, estoque * qAux.FieldByName('Volume').AsFloat, qAux.FieldByName('Codigo').AsInteger);

    Inc(linha);
    qryitens_pedido.Next;
  end;

  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha,i, '-');

  rodape:= 'É vedada a autenticação deste documento';
  rs.Write(linha + 10,Alinha_Centro(rodape, i2), rodape);
  rs.Print;

end;

procedure TFrmGera_Ordem_Entrega.Dados_Cliente;
var
  qAux2: TADOQuery;
begin
  qAux2:= TADOQuery.Create(self);
  with qAux2, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select Cli.*, Ci.Descricao, Ci.UF, Se.Descricao, L.Descricao, L.Tipo_Logradouro from Cliente Cli');
    add('left join Cidade Ci on (Cli.Codigo_Cidade = Ci.Codigo)');
    add('left join Setor Se on (Cli.Codigo_Setor = Se.Codigo)');
    add('left join Logradouro L on (Cli.Codigo_Logradouro = L.Codigo)');
    add('where Cli.Codigo = :Cliente');
    Parameters.ParamByName('Cliente').Value:= qrypedidoCodigo_Cliente.AsInteger;
    open;
  end;

  if (qAux2.FieldByName('CPF').AsString <> '') then
    FrmGera_Ordem_Entrega.LblCPF.Caption:= qAux2.FieldByName('CPF').AsString
  else if (qAux2.FieldByName('CNPJ').AsString <> '') then
    FrmGera_Ordem_Entrega.LblCPF.Caption:= qAux2.FieldByName('CNPJ').AsString
  else
    FrmGera_Ordem_Entrega.LblCPF.Caption:= '';

  FrmGera_Ordem_Entrega.LblCidade.Caption:= qAux2.FieldByName('Descricao').AsString;
  FrmGera_Ordem_Entrega.LblSetor.Caption:= qAux2.FieldByName('Descricao_1').AsString;
  FrmGera_Ordem_Entrega.LblEndereco.Caption:= qAux2.FieldByName('Descricao_2').AsString;
  FrmGera_Ordem_Entrega.LblTipo_Logradouro.Caption:= qAux2.FieldByName('Tipo_Logradouro').AsString;
  FrmGera_Ordem_Entrega.LblUF.Caption:= qAux2.FieldByName('UF').AsString;
  FrmGera_Ordem_Entrega.LblTelefone.Caption:= qAux2.FieldByName('Telefone').AsString;
  FrmGera_Ordem_Entrega.LblNumero.Caption:= qAux2.FieldByName('Numero').AsString;
end;

procedure TFrmGera_Ordem_Entrega.DBGrid1DblClick(Sender: TObject);
begin
  EdtCodigo_Produto.Text:= qryitens_pedidoCodigo_Venda.AsString;
  EdtProduto.Text:= qryitens_pedidoDescricao.AsString;
  EdtUnidade.Text:= qryitens_pedidoSigla.AsString;
  EdtQtde_Pedido.Text:= qryitens_pedidoQtde.AsString;
  EdtQtde_Entregue.Text:= qryitens_pedidoQtde_Entregue.AsString;
  EdtQtde_Restante.Text:= qryitens_pedidoQtde_Restante.AsString;
  LblProduto.Caption:= qryitens_pedidoCodigo_Produto.AsString;
  EdtQtde_Entregue.SetFocus;
end;

procedure TFrmGera_Ordem_Entrega.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmGera_Ordem_Entrega.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    DBGrid1DblClick(self);
  end;
end;

procedure TFrmGera_Ordem_Entrega.DBGrid2CellClick(Column: TColumn);
begin
  Dados_Cliente;
  Chama_Itens;
  BBtnGera_Entrega.Enabled:= true;
  BBtnAltera.Enabled:= true;
end;

procedure TFrmGera_Ordem_Entrega.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFrmGera_Ordem_Entrega.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Chama_Itens;
    Dados_Cliente;
    BBtnGera_Entrega.Enabled:= true;
    BBtnAltera.Enabled:= true;
  end;
end;

procedure TFrmGera_Ordem_Entrega.EdtClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmGera_Ordem_Entrega.EdtCodigo_ClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    if (RGConsulta_Por.ItemIndex = 1) then
    begin
      Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
      FrmChama_Cliente.ShowModal;
      FrmChama_Cliente.Free;
    end;
  end;
end;

procedure TFrmGera_Ordem_Entrega.EdtCodigo_ClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmGera_Ordem_Entrega.EdtCodigo_ProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
    Util.Somente_Apaga(key);
end;

procedure TFrmGera_Ordem_Entrega.EdtProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmGera_Ordem_Entrega.EdtQtde_RestanteEnter(Sender: TObject);
var
  qtde_sol, qtde_rec, qtde_res, qtde_pen: double;
begin
  qtde_sol:= StrToFloat(EdtQtde_Pedido.Text);
  qtde_rec:= StrToFloat(EdtQtde_Entregue.Text);
  qtde_res:= StrToFloat(EdtQtde_Restante.Text);

  if (qtde_rec > qtde_res) then
    qtde_pen:= (qtde_rec - qtde_res)
  else
    qtde_pen:= (qtde_res - qtde_rec);
  EdtQtde_Restante.Text:= FloatToStr(qtde_pen);
end;

procedure TFrmGera_Ordem_Entrega.EdtQtde_RestanteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Atualiza_Dados;
    Limpa_Menor;
  end;
end;

procedure TFrmGera_Ordem_Entrega.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmGera_Ordem_Entrega.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmGera_Ordem_Entrega.Free;
  FrmGera_Ordem_Entrega:= Nil;
end;

procedure TFrmGera_Ordem_Entrega.FormCreate(Sender: TObject);
begin
  Util.Limpa_Campos(FrmGera_Ordem_Entrega);
  PageControl1.TabIndex:= 0;
  Util.Inicia_Data(MEdtData_Inicial, MEdtData_Final);
end;

procedure TFrmGera_Ordem_Entrega.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmGera_Ordem_Entrega.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmGera_Ordem_Entrega.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmGera_Ordem_Entrega.Limpa_Menor;
begin
  EdtCodigo_Produto.Clear;
  EdtProduto.Clear;
  EdtUnidade.Clear;
  EdtQtde_Pedido.Clear;
  EdtQtde_Entregue.Clear;
  EdtQtde_Restante.Clear;
  EdtCodigo_Produto.SetFocus;
end;

end.
