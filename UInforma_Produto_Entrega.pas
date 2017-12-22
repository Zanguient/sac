unit UInforma_Produto_Entrega;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, DB, Grids, DBGrids, URegistro, RSPrint, ComCtrls,
  ToolWin;

type
  TFrmInforma_Produto_Entrega = class(TForm)
    qryitens_venda: TADOQuery;
    qryitens_vendaCodigo: TIntegerField;
    qryitens_vendaN_Item: TStringField;
    qryitens_vendaCodigo_Produto: TIntegerField;
    qryitens_vendaCodigo_Venda: TStringField;
    qryitens_vendaDescricao: TStringField;
    qryitens_vendaNCM: TStringField;
    qryitens_vendaOrigem: TStringField;
    qryitens_vendaCFOP: TStringField;
    qryitens_vendaUN: TStringField;
    qryitens_vendaTipo_Calculo_BC_ICMS: TStringField;
    qryitens_vendaTipo_Recolhimento: TStringField;
    qryitens_vendaICMS: TStringField;
    qryitens_vendaCST: TStringField;
    qryitens_vendaCSOSN: TStringField;
    qryitens_vendaBase_Reduzida: TStringField;
    qryitens_vendaBase_Acrescida: TStringField;
    qryitens_vendaBC: TStringField;
    qryitens_vendaValor_ICMS: TStringField;
    qryitens_vendaTipo_Calculo_BC_ICMS_ST: TStringField;
    qryitens_vendaMVAST: TStringField;
    qryitens_vendaICMS_ST: TStringField;
    qryitens_vendaCST_ST: TStringField;
    qryitens_vendaBase_Reduzida_ST: TStringField;
    qryitens_vendaBase_Acrescida_ST: TStringField;
    qryitens_vendaBC_ST: TStringField;
    qryitens_vendaValor_ICMS_ST: TStringField;
    qryitens_vendaAliquota_Calculo_Credito: TStringField;
    qryitens_vendaCredito_ICMS: TStringField;
    qryitens_vendaTipo_Calculo_IPI: TStringField;
    qryitens_vendaIPI: TStringField;
    qryitens_vendaCST_IPI: TStringField;
    qryitens_vendaBase_Reduzida_IPI: TStringField;
    qryitens_vendaBase_Acrescida_IPI: TStringField;
    qryitens_vendaBC_IPI: TStringField;
    qryitens_vendaValor_IPI: TFloatField;
    qryitens_vendaTipo_Calculo_PIS: TStringField;
    qryitens_vendaPIS: TStringField;
    qryitens_vendaCST_PIS: TStringField;
    qryitens_vendaBase_Reduzida_PIS: TStringField;
    qryitens_vendaBase_Acrescida_PIS: TStringField;
    qryitens_vendaBC_PIS: TStringField;
    qryitens_vendaValor_PIS: TFloatField;
    qryitens_vendaTipo_Calculo_COFINS: TStringField;
    qryitens_vendaCOFINS: TStringField;
    qryitens_vendaCST_COFINS: TStringField;
    qryitens_vendaBase_Reduzida_COFINS: TStringField;
    qryitens_vendaBase_Acrescida_COFINS: TStringField;
    qryitens_vendaBC_COFINS: TStringField;
    qryitens_vendaValor_COFINS: TFloatField;
    qryitens_vendaQtde: TFloatField;
    qryitens_vendaValor_Unitario: TFloatField;
    qryitens_vendaValor_Frete: TFloatField;
    qryitens_vendaValor_Seguro: TFloatField;
    qryitens_vendaOutras_Despesas: TFloatField;
    qryitens_vendaSub_Total: TFloatField;
    qryitens_vendaSub_Total_Liquido: TFloatField;
    qryitens_vendaCancelado: TStringField;
    qryitens_vendaIndica_Valor_Total: TStringField;
    qryitens_vendaDesc_Acr: TFloatField;
    qryitens_vendaTipo_Desc_Acr: TStringField;
    qryitens_vendaCodigo_Registro: TAutoIncField;
    qryitens_vendaMarca: TStringField;
    qryitens_vendaValor_Original: TFloatField;
    qryitens_vendaValor_Compra: TFloatField;
    ds_itens_venda: TDataSource;
    DBGrid1: TDBGrid;
    qryitens_vendaQtde_Entregue: TFloatField;
    qryitens_vendaQtde_Restante: TFloatField;
    qryitens_vendaData_Entrega: TDateTimeField;
    LblProduto: TLabel;
    rs: TRSPrinter;
    qAux_Separacao: TADOQuery;
    qAux_SeparacaoCodigo_Registro: TAutoIncField;
    qAux_SeparacaoCodigo: TIntegerField;
    qAux_SeparacaoN_Item: TStringField;
    qAux_SeparacaoCodigo_Produto: TIntegerField;
    qAux_SeparacaoCodigo_Venda: TStringField;
    qAux_SeparacaoDescricao: TStringField;
    qAux_SeparacaoNCM: TStringField;
    qAux_SeparacaoOrigem: TStringField;
    qAux_SeparacaoCFOP: TStringField;
    qAux_SeparacaoUN: TStringField;
    qAux_SeparacaoTipo_Calculo_BC_ICMS: TStringField;
    qAux_SeparacaoTipo_Recolhimento: TStringField;
    qAux_SeparacaoICMS: TStringField;
    qAux_SeparacaoCST: TStringField;
    qAux_SeparacaoCSOSN: TStringField;
    qAux_SeparacaoBase_Reduzida: TStringField;
    qAux_SeparacaoBase_Acrescida: TStringField;
    qAux_SeparacaoBC: TStringField;
    qAux_SeparacaoValor_ICMS: TStringField;
    qAux_SeparacaoTipo_Calculo_BC_ICMS_ST: TStringField;
    qAux_SeparacaoMVAST: TStringField;
    qAux_SeparacaoICMS_ST: TStringField;
    qAux_SeparacaoCST_ST: TStringField;
    qAux_SeparacaoBase_Reduzida_ST: TStringField;
    qAux_SeparacaoBase_Acrescida_ST: TStringField;
    qAux_SeparacaoBC_ST: TStringField;
    qAux_SeparacaoValor_ICMS_ST: TStringField;
    qAux_SeparacaoAliquota_Calculo_Credito: TStringField;
    qAux_SeparacaoCredito_ICMS: TStringField;
    qAux_SeparacaoTipo_Calculo_IPI: TStringField;
    qAux_SeparacaoIPI: TStringField;
    qAux_SeparacaoCST_IPI: TStringField;
    qAux_SeparacaoBase_Reduzida_IPI: TStringField;
    qAux_SeparacaoBase_Acrescida_IPI: TStringField;
    qAux_SeparacaoBC_IPI: TStringField;
    qAux_SeparacaoValor_IPI: TFloatField;
    qAux_SeparacaoTipo_Calculo_PIS: TStringField;
    qAux_SeparacaoPIS: TStringField;
    qAux_SeparacaoCST_PIS: TStringField;
    qAux_SeparacaoBase_Reduzida_PIS: TStringField;
    qAux_SeparacaoBase_Acrescida_PIS: TStringField;
    qAux_SeparacaoBC_PIS: TStringField;
    qAux_SeparacaoValor_PIS: TFloatField;
    qAux_SeparacaoTipo_Calculo_COFINS: TStringField;
    qAux_SeparacaoCOFINS: TStringField;
    qAux_SeparacaoCST_COFINS: TStringField;
    qAux_SeparacaoBase_Reduzida_COFINS: TStringField;
    qAux_SeparacaoBase_Acrescida_COFINS: TStringField;
    qAux_SeparacaoBC_COFINS: TStringField;
    qAux_SeparacaoValor_COFINS: TFloatField;
    qAux_SeparacaoQtde: TFloatField;
    qAux_SeparacaoQtde_Entregue: TFloatField;
    qAux_SeparacaoQtde_Restante: TFloatField;
    qAux_SeparacaoValor_Compra: TFloatField;
    qAux_SeparacaoValor_Original: TFloatField;
    qAux_SeparacaoValor_Unitario: TFloatField;
    qAux_SeparacaoDesc_Acr: TFloatField;
    qAux_SeparacaoTipo_Desc_Acr: TStringField;
    qAux_SeparacaoValor_Frete: TFloatField;
    qAux_SeparacaoValor_Seguro: TFloatField;
    qAux_SeparacaoOutras_Despesas: TFloatField;
    qAux_SeparacaoSub_Total: TFloatField;
    qAux_SeparacaoSub_Total_Liquido: TFloatField;
    qAux_SeparacaoCancelado: TStringField;
    qAux_SeparacaoIndica_Valor_Total: TStringField;
    qAux_SeparacaoData_Entrega: TDateTimeField;
    qAux_SeparacaoTipo_Entrega: TStringField;
    qAux_SeparacaoMarca: TStringField;
    TlbFerramentas: TToolBar;
    BBtnOK: TToolButton;
    qryitens_vendaQtde_S_Previsao: TFloatField;
    qryitens_vendaHora_Entrega: TStringField;
    qAux_SeparacaoTipo_Venda: TStringField;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure qryitens_vendaBeforeScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure qryitens_vendaBeforeInsert(DataSet: TDataSet);
    procedure BBtnOKClick(Sender: TObject);
  private
    qAux_Forma_Pagamento: TADOQuery;
    acre_item, indicador_cancelamento_item, casa_decimal_qtde, casa_decimal_val_un, cod_pro, desc_item,
    descri, IAT, IPPT, qtde_vendida, qtde_cancelada, unid, valor_cancelado, can_acre, valor_total_item,
    valor_unit, descricao_servico: AnsiString;
    R05: TR05;
    linha, conta, i2, criado: integer;
    cn, cp: string;
    procedure Atualiza_Dados;
    procedure Colega_Dados_R05;
    procedure Imprime_Lista_Separacao;
    procedure Cabecalho_Lista_Separacao;
    procedure Atualiza_Dados_Separacao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInforma_Produto_Entrega: TFrmInforma_Produto_Entrega;

implementation

uses UDeclaracao, UDM, UPedido_Venda;

{$R *.dfm}

procedure TFrmInforma_Produto_Entrega.qryitens_vendaBeforeInsert(
  DataSet: TDataSet);
begin
  if (qryitens_venda.Eof) then
  begin
    abort;
  end;
end;

procedure TFrmInforma_Produto_Entrega.qryitens_vendaBeforeScroll(
  DataSet: TDataSet);
var
  qtde_ent, qtde_res, qtde, qtde_s: double;
begin
  qtde:= qryitens_vendaQtde.AsFloat;
  qtde_ent:= qryitens_vendaQtde_Entregue.AsFloat;
  qtde_res:= qryitens_vendaQtde_Restante.AsFloat;
  qtde_s:= qryitens_vendaQtde_S_Previsao.AsFloat;

  if ( (qtde_ent + qtde_res + qtde_s) > qtde) then
  begin
    Valor_Invalido;
    abort;
  end;

  if ( (qtde_ent + qtde_res + qtde_s) < qtde) then
  begin
    Valor_Invalido;
    abort;
  end;

  //qryitens_venda.Edit;
  //qtde_res:= ( qtde - qtde_ent);
  //qryitens_vendaQtde_Restante.AsFloat:= qtde_res;
  //qryitens_venda.Post;
end;

procedure TFrmInforma_Produto_Entrega.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmInforma_Produto_Entrega:= nil;
end;

procedure TFrmInforma_Produto_Entrega.FormCreate(Sender: TObject);
begin
  Atualiza_Dados;
end;

procedure TFrmInforma_Produto_Entrega.Colega_Dados_R05;
var
  qAux: TADOQuery;
begin
  qryitens_venda.First;
  try
    qAux:= TADOQuery.Create(self);
    while not qryitens_venda.Eof do
    begin
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('select P.Codigo, P.Producao_Propria, P.Arred_Trunc from Produto P');
        add('where P.Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value:= qryitens_vendaCodigo_Produto.AsInteger;
        Open;
      end;

      cod_pro:= qryitens_vendaCodigo_Venda.AsString;
      descri:= qryitens_vendaDescricao.AsString;
      qtde_vendida:= qryitens_vendaQtde.AsString;
      unid:= qryitens_vendaUN.AsString;
      valor_unit:= qryitens_vendaValor_Unitario.AsString;

      if (qryitens_vendaDesc_Acr.AsFloat < 0) then
        desc_item:= qryitens_vendaDesc_Acr.AsString
      else
        acre_item:= qryitens_vendaDesc_Acr.AsString;

      valor_total_item:= qryitens_vendaSub_Total.AsString;
      if (qryitens_vendaCancelado.AsString = 'S') then
      begin
        indicador_cancelamento_item:= 'S';
        qtde_cancelada:= qryitens_vendaQtde.AsString;
        valor_cancelado:= FloatToStr(StrToFloat(qtde_cancelada) * qryitens_vendaValor_Unitario.AsFloat);
      end
      else
      begin
        indicador_cancelamento_item:= 'N';
        qtde_cancelada:= '';
        valor_cancelado:= '';
      end;
      can_acre:= '0';
      IAT:= qAux.FieldByName('Arred_Trunc').AsString;
      IPPT:= qAux.FieldByName('Producao_Propria').AsString;
      casa_decimal_qtde:= '0';
      casa_decimal_val_un:= '2';
      LblProduto.Caption:= qryitens_vendaCodigo_Produto.AsString;

      R05.Salva_Banco(R05);
      R05.Salva_Banco_Aux(R05);

      qryitens_venda.Next;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmInforma_Produto_Entrega.Atualiza_Dados;
begin
  with qryitens_venda, sql do
  begin
    close;
    clear;
    add('select IP.*, M.Descricao as Marca from Itens_Pedido IP');
    add('left join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
    add('where IP.Codigo = :Codigo order by IP.Descricao');
    Parameters.ParamByName('Codigo').Value:= StrToInt(FrmPedido_Venda.EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmInforma_Produto_Entrega.Atualiza_Dados_Separacao;
begin
  with qAux_Separacao, sql do
  begin
    close;
    clear;
    add('select IP.*, M.Descricao as Marca from Itens_Pedido IP');
    add('left join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
    add('where IP.Codigo = :Codigo and IP.Cancelado = :N order by IP.Descricao');
    Parameters.ParamByName('Codigo').Value:= StrToInt(FrmPedido_Venda.EdtCodigo.Text);
    Parameters.ParamByName('N').Value:= 'N';
    open;
  end;
end;

procedure TFrmInforma_Produto_Entrega.BBtnOKClick(Sender: TObject);
begin
  Gera_N_Pre_Venda(FrmPedido_Venda.Conexao);
  FrmPedido_Venda.Grava_Forma_Pagamento(FrmPedido_Venda.Conexao);
  FrmPedido_Venda.Atualiza_Dados_Pedido(FrmPedido_Venda.Conexao);
  FrmPedido_Venda.Colega_Dados_R05(FrmPedido_Venda.Conexao);

  if (separacao = '0101') then
    Imprime_Lista_Separacao;

  close;
end;

procedure TFrmInforma_Produto_Entrega.Cabecalho_Lista_Separacao;
var
  i: integer;
  lista: Ansistring;
begin
  if (rs.Paginas = 0) then
    rs.BeginDoc;
  i:= 0;
  i2:= 136;
  linha:= 0;
  conta:= 0;

  lista:= 'LISTA DE SEPARAÇÃO';

  inc(linha);
  rs.WriteFont(linha, Alinha_Centro(lista,i2),lista, [Bold] + [DobleWide]);
  inc(linha);

  for i := 0 to i2 do
    rs.Write(linha,i,'-');

  cn:= Copy(cnpj,1,2)+'.'+Copy(cnpj,3,3)+'.'+Copy(cnpj,6,3)+'/'+
    Copy(cnpj,9,4)+'-'+Copy(cnpj,13,2);

  cp:= Copy(FrmPedido_Venda.LblCPF.Caption,1,3)+'.'+Copy(FrmPedido_Venda.LblCPF.Caption,4,3)+'.'+Copy(FrmPedido_Venda.LblCPF.Caption,7,3)+'-'+
    Copy(FrmPedido_Venda.LblCPF.Caption,10,2);

  inc(linha);
  rs.Write(linha,0, 'Empresa');
  rs.Write(linha,50, 'CNPJ');
  inc(linha);
  rs.Write(linha,0, nome_fantasia);
  rs.Write(linha,50, cn);

  inc(linha);
  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha,i,'-');

  inc(linha);
  rs.Write(linha,0, 'Destinatário');
  rs.Write(linha,50, 'CPF/CNPJ');
  inc(linha);
  rs.Write(linha,0, FrmPedido_Venda.EdtCliente.Text);
  rs.Write(linha,50, cp);

  inc(linha);
  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha,i, '-');

  linha:= linha + 2;
  rs.WriteFont(linha,0,'Produtos', [Underline]);
  linha:= linha + 2;
  rs.WriteFont(linha,0,'Código Produto', [Underline]);
  rs.WriteFont(linha, 16, 'Descrição', [Underline]);
  rs.WriteFont(linha, 70, 'Un.', [Underline]);
  rs.WriteFont(linha, 80, 'Qtde.', [Underline]);
  rs.WriteFont(linha, 90, 'Marca', [Underline]);
  rs.WriteFont(linha, 111, 'T. Ent.', [Underline]);
  linha:= linha + 2;
end;

procedure TFrmInforma_Produto_Entrega.Imprime_Lista_Separacao;
var
  i: integer;
  assinatura: AnsiString;
begin
  assinatura:= '';
  i:= 0;
  Cabecalho_Lista_Separacao;
  Atualiza_Dados_Separacao;
  qAux_Separacao.First;

  while not qAux_Separacao.Eof do
  begin
    if (qAux_SeparacaoCancelado.AsString = 'N') then
    begin
      rs.Write(linha, 0, qAux_SeparacaoCodigo_Venda.AsString);
      rs.Write(linha, 16, qAux_SeparacaoDescricao.AsString);
      rs.Write(linha, 70, qAux_SeparacaoUN.AsString);
      rs.Write(linha, 80, FormatFloat('#0.0,0', qAux_SeparacaoQtde_Entregue.AsFloat));
      rs.Write(linha, 90, qAux_SeparacaoMarca.AsString);
      rs.Write(linha, 111, qAux_SeparacaoTipo_Entrega.AsString);
      Inc(linha);

      if (linha = rs.Lines) then
      begin
        rs.NewPage;
        Cabecalho_Lista_Separacao;
      end;

      qAux_Separacao.Next;
    end
    else
      qAux_Separacao.Next;
  end;

  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha + 1,i, '-');

  assinatura:= '____________________________________________________________';

  if (linha <= rs.Lines - 5) then
  begin
    i:= 1;
    rs.Write(linha + 3, Alinha_Centro(assinatura,i2),assinatura);
    rs.Write(linha + 5, Alinha_Centro(FrmPedido_Venda.EdtCliente.Text,i2),FrmPedido_Venda.EdtCliente.Text);
  end
  else
  begin
    rs.NewPage;
    linha:= 1;
    i:= 1;
    rs.Write(linha + 4, Alinha_Centro(assinatura,i2),assinatura);
    rs.Write(linha + 6, Alinha_Centro(FrmPedido_Venda.EdtCliente.Text,i2),FrmPedido_Venda.EdtCliente.Text);
  end;

  //SetDefaultPrinter('HP LaserJet M1005');
  rs.Print;
  rs.EndDoc;
end;

end.
