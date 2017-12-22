unit UMescla_DAV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, Grids, DBGrids, DB, ImgList, ComCtrls, ToolWin,
  ExtCtrls, URegistro;

type
  TFrmMescla_DAV = class(TForm)
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    TlbFerramentas: TToolBar;
    BBtnOK: TToolButton;
    BBtnFechar: TToolButton;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1N_Pedido: TStringField;
    ADOQuery1Status: TStringField;
    Panel1: TPanel;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    EdtDAV: TEdit;
    ADOQuery2Codigo_Registro: TAutoIncField;
    ADOQuery2Codigo: TIntegerField;
    ADOQuery2N_Item: TStringField;
    ADOQuery2Codigo_Produto: TIntegerField;
    ADOQuery2Codigo_Venda: TStringField;
    ADOQuery2Descricao: TStringField;
    ADOQuery2NCM: TStringField;
    ADOQuery2Origem: TStringField;
    ADOQuery2CFOP: TStringField;
    ADOQuery2UN: TStringField;
    ADOQuery2Tipo_Calculo_BC_ICMS: TStringField;
    ADOQuery2Tipo_Recolhimento: TStringField;
    ADOQuery2ICMS: TStringField;
    ADOQuery2CST: TStringField;
    ADOQuery2CSOSN: TStringField;
    ADOQuery2Base_Reduzida: TStringField;
    ADOQuery2BC: TStringField;
    ADOQuery2Valor_ICMS: TStringField;
    ADOQuery2MVAST: TStringField;
    ADOQuery2ICMS_ST: TStringField;
    ADOQuery2CST_ST: TStringField;
    ADOQuery2Base_Reduzida_ST: TStringField;
    ADOQuery2Base_Acrescida_ST: TStringField;
    ADOQuery2BC_ST: TStringField;
    ADOQuery2Aliquota_Calculo_Credito: TStringField;
    ADOQuery2Credito_ICMS: TStringField;
    ADOQuery2Tipo_Calculo_IPI: TStringField;
    ADOQuery2IPI: TStringField;
    ADOQuery2CST_IPI: TStringField;
    ADOQuery2Base_Reduzida_IPI: TStringField;
    ADOQuery2Base_Acrescida_IPI: TStringField;
    ADOQuery2BC_IPI: TStringField;
    ADOQuery2Valor_IPI: TFloatField;
    ADOQuery2Tipo_Calculo_PIS: TStringField;
    ADOQuery2PIS: TStringField;
    ADOQuery2CST_PIS: TStringField;
    ADOQuery2Base_Reduzida_PIS: TStringField;
    ADOQuery2Base_Acrescida_PIS: TStringField;
    ADOQuery2BC_PIS: TStringField;
    ADOQuery2Valor_PIS: TFloatField;
    ADOQuery2Tipo_Calculo_COFINS: TStringField;
    ADOQuery2COFINS: TStringField;
    ADOQuery2CST_COFINS: TStringField;
    ADOQuery2Base_Reduzida_COFINS: TStringField;
    ADOQuery2Base_Acrescida_COFINS: TStringField;
    ADOQuery2BC_COFINS: TStringField;
    ADOQuery2Valor_COFINS: TFloatField;
    ADOQuery2Qtde: TFloatField;
    ADOQuery2Qtde_Entregue: TFloatField;
    ADOQuery2Qtde_Restante: TFloatField;
    ADOQuery2Qtde_S_Previsao: TFloatField;
    ADOQuery2Valor_Compra: TFloatField;
    ADOQuery2Valor_Original: TFloatField;
    ADOQuery2Valor_Unitario: TFloatField;
    ADOQuery2Desc_Acr: TFloatField;
    ADOQuery2Desc_Acr_P: TFloatField;
    ADOQuery2Tipo_Desc_Acr: TStringField;
    ADOQuery2dOUa: TStringField;
    ADOQuery2Valor_Frete: TFloatField;
    ADOQuery2Valor_Seguro: TFloatField;
    ADOQuery2Outras_Despesas: TFloatField;
    ADOQuery2Sub_Total: TFloatField;
    ADOQuery2Sub_Total_Liquido: TFloatField;
    ADOQuery2Cancelado: TStringField;
    ADOQuery2Indica_Valor_Total: TStringField;
    ADOQuery2Data_Entrega: TDateTimeField;
    ADOQuery2Hora_Entrega: TStringField;
    ADOQuery2Tipo_Entrega: TStringField;
    RGTipo: TRadioGroup;
    ADOQuery2Tipo_Venda: TStringField;
    ADOQuery2Comissao: TFloatField;
    ADOQuery2Perc_Desc_Vista: TFloatField;
    ADOQuery2Perc_Desc_Prazo: TFloatField;
    ADOQuery2Permite_Credito: TIntegerField;
    ADOQuery2Codigo_Obs_Fiscal: TIntegerField;
    ADOQuery2Qtde_Estoque_Atual: TFloatField;
    ADOQuery2Valor_Compra_Nota: TFloatField;
    ADOQuery2Valor_ICMS_ST: TFloatField;
    ADOQuery2Tipo_Calculo_BC_ICMS_ST: TStringField;
    ADOQuery2Ficha_Estoque_Codigo: TIntegerField;
    ADOQuery1Mesclada: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure BBtnOKClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtDAVChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    qAux, qAux2, qAux3, qAux4: TAdoquery;
    cod_pro, cod_pro_int, descri, qtde_vendida, unid, valor_unit, desc_item, acre_item, valor_total_item, tot_par,
    indicador_cancelamento_item, qtde_cancelada, valor_cancelado, can_acre, IAT, IPPT, casa_decimal_qtde,
    casa_decimal_val_un: AnsiString;
    Itens_Pedido: URegistro.TItens_Pedido;

    qtde_itens: integer;
    total_produtos, total_acrecimo, total_desconto, total_pedido: double;
    procedure Salva_Itens;
    procedure Verifica_Produto_Lancado;
    procedure Atualiza_Itens_Venda(Conexao: TADOConnection);
    procedure Grava_Temporario(Conexao: TADOConnection);
    procedure Atualiza_Pedido_Temporario(Conexao: TADOConnection);
    procedure Inicia_Query_Conexao(Conexao: TADOConnection);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMescla_DAV: TFrmMescla_DAV;

implementation

uses UDeclaracao, UDM, UGeral, UPedido_Venda, Modelo.DAO.Pedido.TPedidoDAO;

{$R *.dfm}

procedure TFrmMescla_DAV.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmMescla_DAV.Atualiza_Itens_Venda(Conexao: TADOConnection);
begin
  with FrmPedido_Venda.qryitens_venda, sql do
  begin
    close;
    Connection:= Conexao;
    clear;
    add('select IP.*, M.Descricao as Marca, LP.Local from Itens_Pedido IP');
    add('left join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
    add('left join Localidade_Produto LP on (P.Codigo_Local = LP.Codigo)');
    add('where IP.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= StrToInt(FrmPedido_Venda.EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmMescla_DAV.BBtnOKClick(Sender: TObject);
var
  PedidoDAO: TPedidoDAO;
begin
  qAux:= TADOQuery.Create(self);
  qAux2:= TADOQuery.Create(self);
  qAux3:= TADOQuery.Create(self);
  qAux4:= TADOQuery.Create(self);

  if (ADOQuery1Mesclada.AsInteger = 1) then
  begin
    Application.MessageBox('O DAV selecionado já foi utilizado em uma outra mesclagem. Por favor, escolha outro DAV.', 'DAV já utilizado', MB_OK+MB_ICONHAND);
    exit;
  end;

  if (RGTipo.ItemIndex = 1) then
  begin
    PedidoDAO:= TPedidoDAO.Create(FrmPedido_Venda.Conexao);

    if (DBGrid2.SelectedRows.Count = 0) then
    begin
      Item_Selecionado_DBGrid;
      abort;
    end;

    ADOQuery2.First;
    while not ADOQuery2.Eof do
    begin
      if (DBGrid2.SelectedRows.CurrentRowSelected) then
      begin
        Verifica_Produto_Lancado;
        Salva_Itens;
        Grava_Temporario(FrmPedido_Venda.Conexao);
      end;
      ADOQuery2.Next;
    end;

    PedidoDAO.AtualizaPedidoMesclado(ADOQuery2Codigo.AsInteger, 1);
    Atualiza_Itens_Venda(FrmPedido_Venda.Conexao);
    Atualiza_Pedido_Temporario(FrmPedido_Venda.Conexao);
    FrmPedido_Venda.BBtnOrcamento.Enabled:= true;
    FrmPedido_Venda.BBtnAnalisa_Venda.Enabled:= true;

    total_produtos:= Pega_Total_Produto(StrToInt(FrmPedido_Venda.EdtCodigo.Text), FrmPedido_Venda.Conexao);//StrToFloat(EdtTotal_Produtos.Text) + (bruto_ant - valor_tot); //+ ((qtde * qryitens_vendaValor_Original.AsFloat) - bruto_ant);
    total_pedido:= Pega_Total_Pedido(StrToInt(FrmPedido_Venda.EdtCodigo.Text), FrmPedido_Venda.Conexao);//StrToFloat(EdtTotal_Pedido.Text) + (valor_tot - sub_total_ant);

    FrmPedido_Venda.EdtTotal_Produtos.Text:= FormatFloat('#0.0,0', total_produtos);
    FrmPedido_Venda.EdtTotal_Produtos.Text:= StringReplace(FrmPedido_Venda.EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmPedido_Venda.EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', total_pedido);
    FrmPedido_Venda.EdtTotal_Pedido.Text:= StringReplace(FrmPedido_Venda.EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);

    Mensagem_Produto_Inserido;
  end
  else
  begin
    if (Confirma_Processo) then
    begin
      PedidoDAO:= TPedidoDAO.Create(FrmPedido_Venda.Conexao);
      ADOQuery2.First;
      while not ADOQuery2.Eof do
      begin
        Salva_Itens;
        Grava_Temporario(FrmPedido_Venda.Conexao);
        ADOQuery2.Next;
      end;

      PedidoDAO.AtualizaPedidoMesclado(ADOQuery2Codigo.AsInteger, 1);
      Atualiza_Itens_Venda(FrmPedido_Venda.Conexao);
      Atualiza_Pedido_Temporario(FrmPedido_Venda.Conexao);
      FrmPedido_Venda.BBtnOrcamento.Enabled:= true;
      FrmPedido_Venda.BBtnAnalisa_Venda.Enabled:= true;

      total_produtos:= Pega_Total_Produto(StrToInt(FrmPedido_Venda.EdtCodigo.Text), FrmPedido_Venda.Conexao);//StrToFloat(EdtTotal_Produtos.Text) + (bruto_ant - valor_tot); //+ ((qtde * qryitens_vendaValor_Original.AsFloat) - bruto_ant);
      total_pedido:= Pega_Total_Pedido(StrToInt(FrmPedido_Venda.EdtCodigo.Text), FrmPedido_Venda.Conexao);//StrToFloat(EdtTotal_Pedido.Text) + (valor_tot - sub_total_ant);

      FrmPedido_Venda.EdtTotal_Produtos.Text:= FormatFloat('#0.0,0', total_produtos);
      FrmPedido_Venda.EdtTotal_Produtos.Text:= StringReplace(FrmPedido_Venda.EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

      FrmPedido_Venda.EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', total_pedido);
      FrmPedido_Venda.EdtTotal_Pedido.Text:= StringReplace(FrmPedido_Venda.EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);

      Mensagem_Produto_Inserido;
    end;
  end;
  FrmMescla_DAV.Close;
end;

procedure TFrmMescla_DAV.Grava_Temporario(Conexao: TADOConnection);
var
  qAux: TADOQuery;
  perc_fim, perc_aux, pe, pe_aux, v_un: double;
begin
  qAux:= TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('INSERT INTO Pedido_Temporario');
      add('           (Codigo');
      add('           ,Codigo_Produto');
      add('           ,Valor_Original');
      add('           ,Valor_Compra');
      add('           ,Valor_Unitario');
      add('           ,Quantidade');
      add('           ,Percetual');
      add('           ,Lucro_Vista');
      add('           ,Lucro_Prazo)');
      add('     VALUES');
      add('           (:Codigo');
      add('           ,:Codigo_Produto');
      add('           ,:Valor_Original');
      add('           ,:Valor_Compra');
      add('           ,:Valor_Unitario');
      add('           ,:Quantidade');
      add('           ,:Percetual');
      add('           ,:Lucro_Vista');
      add('           ,:Lucro_Prazo)');

      Parameters.ParamByName('Codigo').Value := StrToInt(FrmPedido_Venda.EdtCodigo.Text);
      Parameters.ParamByName('Codigo_Produto').Value := ADOQuery2Codigo_Produto.AsInteger;
      Parameters.ParamByName('Valor_Original').Value := ADOQuery2Valor_Original.AsFloat;
      Parameters.ParamByName('Valor_Compra').Value := ADOQuery2Valor_Compra.AsFloat;

      //v_un:= ( StrToFloat(EdtValor_Unitario.Text) + StrToFloat(EdtDesc_Acr.Text));
      Parameters.ParamByName('Valor_Unitario').Value := ADOQuery2Valor_Unitario.AsFloat;

      Parameters.ParamByName('Quantidade').Value := ADOQuery2Qtde.AsFloat;

      pe_aux:= ADOQuery2Valor_Unitario.AsFloat - ADOQuery2Valor_Compra.AsFloat;
      pe:= ( pe_aux / ADOQuery2Valor_Unitario.AsFloat );
      pe:= pe * 100;
      pe:= Calcula_Valor(FloatToStr(pe));

      Parameters.ParamByName('Percetual').Value := pe;
      Parameters.ParamByName('Lucro_Vista').Value := 0;
      Parameters.ParamByName('Lucro_Prazo').Value := 0;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;

  FrmPedido_Venda.EdtCusto_Total.Text:= FloatToStr( StrToFloat(FrmPedido_Venda.EdtCusto_Total.Text) + ( ADOQuery2Valor_Compra.AsFloat * ADOQuery2Qtde.AsFloat));
  FrmPedido_Venda.EdtCusto_Total.Text:= FormatFloat('#0.0,0', StrToFloat(FrmPedido_Venda.EdtCusto_Total.Text));
  FrmPedido_Venda.EdtCusto_Total.Text:= StringReplace(FrmPedido_Venda.EdtCusto_Total.Text, ThousandSeparator, '', [rfReplaceAll]);

  FrmPedido_Venda.EdtVenda_Total.Text:= FloatToStr( StrToFloat(FrmPedido_Venda.EdtVenda_Total.Text) + ADOQuery2Sub_Total.AsFloat);
  FrmPedido_Venda.EdtVenda_Total.Text:= FormatFloat('#0.0,0', StrToFloat(FrmPedido_Venda.EdtVenda_Total.Text));
  FrmPedido_Venda.EdtVenda_Total.Text:= StringReplace(FrmPedido_Venda.EdtVenda_Total.Text, ThousandSeparator, '', [rfReplaceAll]);

  perc_aux:= StrToFloat(FrmPedido_Venda.EdtVenda_Total.Text) - StrToFloat(FrmPedido_Venda.EdtCusto_Total.Text);
  perc_fim:= ( perc_aux / StrToFloat(FrmPedido_Venda.EdtVenda_Total.Text) );
  perc_fim:= perc_fim * 100;
  perc_fim:= Calcula_Valor(FloatToStr(perc_fim));

  FrmPedido_Venda.EdtPerc_Total.Text:= FloatToStr(perc_fim);
  //EdtPerc_Total.Text:= FormatFloat('#0.0,0', StrToFloat(EdtPerc_Total.Text));
end;

procedure TFrmMescla_DAV.Atualiza_Pedido_Temporario(Conexao: TADOConnection);
begin
  with FrmPedido_Venda.qrypedido_temporario, sql do
  begin
    close;
    Connection:= Conexao;
    clear;
    add('select PT.*, P.Codigo_Venda + '+ QuotedStr(' - ') + '+P.Descricao as Produto, P.Valor_Compra from Pedido_Temporario PT');
    add('left join Produto P on (PT.Codigo_Produto = P.Codigo)');
    add('where PT.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= FrmPedido_Venda.EdtCodigo.Text;
    open;
  end;
  //Atualiza_Venda_Total;
end;

procedure TFrmMescla_DAV.DBGrid1CellClick(Column: TColumn);
begin
  with ADOQuery2, sql do
  begin
    close;
    clear;
    add('select IP.* from Itens_Pedido IP');
    //add('left join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('where IP.Codigo = :Codigo and IP.Cancelado = :N');
    Parameters.ParamByName('Codigo').Value:= ADOQuery1Codigo.AsInteger;
    Parameters.ParamByName('N').Value:= 'N';
    open;
  end;
end;

procedure TFrmMescla_DAV.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmMescla_DAV.DBGrid1TitleClick(Column: TColumn);
begin
  Util.Ordena_Grid(ADOQuery1, Column);
end;

procedure TFrmMescla_DAV.EdtDAVChange(Sender: TObject);
var
  Pedido: AnsiString;
begin
  Pedido:= StringOfChar('0', 12-Length(EdtDAV.Text)) + EdtDAV.Text;
  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select Ped.Codigo, Ped.N_Pedido, Ped.Status from Pedido Ped');
    add('where Ped.N_Pedido like '''+ Pedido +'%''order by Ped.N_Pedido');
    open;
  end;
end;

procedure TFrmMescla_DAV.FormCreate(Sender: TObject);
begin
  Inicia_Query_Conexao(FrmPedido_Venda.Conexao);
  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select Ped.Codigo, Ped.N_Pedido, Ped.Status, Ped.Mesclada from Pedido Ped');
    add('where Ped.Tipo = :Tipo and Ped.Mesclada = :Mesclado and Ped.Status = :Status');
    Parameters.ParamByName('Tipo').Value:= 'DAV';
    Parameters.ParamByName('Mesclado').Value:= 0;
    Parameters.ParamByName('Status').Value:= 'PENDENTE';
    open;
  end;
end;

procedure TFrmMescla_DAV.Salva_Itens;
var
  des: double;
begin
    Itens_Pedido.Salva_Banco(FrmPedido_Venda.Conexao, 'S', 'I', StrToInt(FrmPedido_Venda.EdtCodigo.Text), ADOQuery2N_Item.AsString, ADOQuery2Codigo_Produto.AsInteger,
    ADOQuery2Codigo_Venda.AsString,  ADOQuery2Descricao.AsString, ADOQuery2NCM.AsString, ADOQuery2Origem.AsString, ADOQuery2CFOP.AsString,
    ADOQuery2UN.AsString, ADOQuery2Tipo_Calculo_BC_ICMS.AsString, ADOQuery2Tipo_Recolhimento.AsString, ADOQuery2ICMS.AsString,ADOQuery2CST.AsString,
    ADOQuery2CSOSN.AsString, ADOQuery2Base_Reduzida.AsString, ADOQuery2BC.AsString, ADOQuery2Valor_ICMS.AsString,
    ADOQuery2Tipo_Calculo_BC_ICMS_ST.AsString, ADOQuery2MVAST.AsString, ADOQuery2ICMS_ST.AsString, ADOQuery2CST_ST.AsString, ADOQuery2Base_Reduzida_ST.AsString,
    ADOQuery2Base_Acrescida_ST.AsString, ADOQuery2BC_ST.AsString, ADOQuery2Valor_ICMS_ST.AsFloat, ADOQuery2Aliquota_Calculo_Credito.AsString, ADOQuery2Credito_ICMS.AsString,
    ADOQuery2Tipo_Calculo_IPI.AsString, ADOQuery2IPI.AsString, ADOQuery2CST_IPI.AsString, ADOQuery2Base_Reduzida_IPI.AsString, ADOQuery2Base_Acrescida_IPI.AsString,
    ADOQuery2BC_IPI.AsString, ADOQuery2Valor_IPI.AsFloat, ADOQuery2Tipo_Calculo_PIS.AsString, ADOQuery2PIS.AsString, ADOQuery2CST_PIS.AsString,
    ADOQuery2Base_Reduzida_PIS.AsString, ADOQuery2Base_Acrescida_PIS.AsString, ADOQuery2BC_PIS.AsString, ADOQuery2Valor_PIS.AsFloat, ADOQuery2Tipo_Calculo_COFINS.AsString,
    ADOQuery2COFINS.AsString, ADOQuery2CST_COFINS.AsString, ADOQuery2Base_Reduzida_COFINS.AsString, ADOQuery2Base_Acrescida_COFINS.AsString,
    ADOQuery2BC_COFINS.AsString, ADOQuery2Valor_COFINS.AsFloat,
    ADOQuery2Qtde.AsFloat, ADOQuery2Qtde_Entregue.AsFloat, ADOQuery2Qtde_Restante.AsFloat, ADOQuery2Qtde_S_Previsao.AsFloat, ADOQuery2Valor_Compra.AsFloat,
    ADOQuery2Valor_Original.AsFloat, ADOQuery2Valor_Unitario.AsFloat, ADOQuery2Desc_Acr.AsFloat, ADOQuery2Desc_Acr_P.AsFloat, ADOQuery2Tipo_Desc_Acr.AsString,
    ADOQuery2dOUa.AsString, ADOQuery2Valor_Frete.AsFloat, ADOQuery2Valor_Seguro.AsFloat, ADOQuery2Outras_Despesas.AsFloat, ADOQuery2Sub_Total.AsFloat,
    ADOQuery2Sub_Total_Liquido.AsFloat, ADOQuery2Cancelado.AsString, ADOQuery2Indica_Valor_Total.AsString, ADOQuery2Data_Entrega.AsDateTime, ADOQuery2Hora_Entrega.AsString,
    ADOQuery2Tipo_Venda.AsString, ADOQuery2Tipo_Entrega.AsString, ADOQuery2Comissao.AsFloat, ADOQuery2Perc_Desc_Vista.AsFloat, ADOQuery2Perc_Desc_Prazo.AsFloat,
    ADOQuery2Permite_Credito.AsInteger, ADOQuery2Codigo_Obs_Fiscal.AsInteger, ADOQuery2Qtde_Estoque_Atual.AsFloat, ADOQuery2Valor_Compra_Nota.AsFloat);

    qtde_itens:= StrToInt(FrmPedido_Venda.EdtQuantidade_Itens.Text);
    inc(qtde_itens);

    {total_produtos:= total_produtos + ( ADOQuery2Valor_Original.AsFloat * ADOQuery2Qtde.AsFloat);
    FrmPedido_Venda.EdtTotal_Produtos.Text:= FormatFloat('#0.0,0', total_produtos);
    FrmPedido_Venda.EdtTotal_Produtos.Text:= StringReplace(FrmPedido_Venda.EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

    total_pedido:= total_pedido + ADOQuery2Sub_Total.AsFloat;//( StrToFloat(EdtTotal_Desc_Acr.Text ) + ( StrToFloat(EdtTotal_Desconto.Text )));

    FrmPedido_Venda.EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', total_pedido);
    FrmPedido_Venda.EdtTotal_Pedido.Text:= StringReplace(FrmPedido_Venda.EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);}

    des:= des + ADOQuery2Desc_Acr_P.AsFloat;
    FrmPedido_Venda.EdtTotal_Desc_Acr.Text:= FormatFloat('#0.0,0', des);

    FrmPedido_Venda.EdtQuantidade_Itens.Text:= IntToStr(qtde_itens);

  {with qAux, SQL do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('Insert into Itens_Pedido (Codigo, N_Item, Codigo_Produto, Codigo_Venda, Descricao, NCM, Origem, CFOP, UN, ');
      add('Tipo_Calculo_BC_ICMS, Tipo_Recolhimento, ICMS, CST, CSOSN, Base_Reduzida, Base_Acrescida, BC, Valor_ICMS, ');
      add('Tipo_Calculo_BC_ICMS_NF, Tipo_Recolhimento_NF, ICMS_NF, CST_NF, CSOSN_NF, Base_Reduzida_NF, Base_Acrescida_NF, BC_NF, Valor_ICMS_NF, ');
      add('Tipo_Calculo_BC_ICMS_ST, MVAST, ICMS_ST, CST_ST, Base_Reduzida_ST, Base_Acrescida_ST, BC_ST, Valor_ICMS_ST, Aliquota_Calculo_Credito, Credito_ICMS,');
      add('Tipo_Calculo_IPI, IPI, CST_IPI, Base_Reduzida_IPI, Base_Acrescida_IPI, BC_IPI, Valor_IPI, ');
      add('Tipo_Calculo_PIS, PIS, CST_PIS, Base_Reduzida_PIS, Base_Acrescida_PIS, BC_PIS, Valor_PIS, ');
      add('Tipo_Calculo_COFINS, COFINS, CST_COFINS, Base_Reduzida_COFINS, Base_Acrescida_COFINS, BC_COFINS, Valor_COFINS, ');
      add('Qtde, Qtde_Entregue, Qtde_Restante, Qtde_S_Previsao, Valor_Compra, Valor_Original,');
      add('Valor_Unitario, Desc_Acr, Desc_Acr_P, Tipo_Desc_Acr, dOUa, Sub_Total, Sub_Total_Liquido, Cancelado, Indica_Valor_Total, Data_Entrega, Tipo_Venda, Tipo_Entrega)');
      add('values (:Codigo, :N_Item, :Codigo_Produto, :Codigo_Venda, :Descricao, :NCM, :Origem, :CFOP, :UN, ');
      add(':Tipo_Calculo_BC_ICMS, :Tipo_Recolhimento, :ICMS, :CST, :CSOSN, :Base_Reduzida, :Base_Acrescida, :BC, :Valor_ICMS, ');
      add(':Tipo_Calculo_BC_ICMS_NF, :Tipo_Recolhimento_NF, :ICMS_NF, :CST_NF, :CSOSN_NF, :Base_Reduzida_NF, :Base_Acrescida_NF, :BC_NF, :Valor_ICMS_NF, ');
      add(':Tipo_Calculo_BC_ICMS_ST, :MVAST, :ICMS_ST, :CST_ST, :Base_Reduzida_ST, :Base_Acrescida_ST, :BC_ST, :Valor_ICMS_ST, :Aliquota_Calculo_Credito, :Credito_ICMS,');
      add(':Tipo_Calculo_IPI, :IPI, :CST_IPI, :Base_Reduzida_IPI, :Base_Acrescida_IPI, :BC_IPI, :Valor_IPI, ');
      add(':Tipo_Calculo_PIS, :PIS, :CST_PIS, :Base_Reduzida_PIS, :Base_Acrescida_PIS, :BC_PIS, :Valor_PIS, ');
      add(':Tipo_Calculo_COFINS, :COFINS, :CST_COFINS, :Base_Reduzida_COFINS, :Base_Acrescida_COFINS, :BC_COFINS, :Valor_COFINS, ');
      add(':Qtde, :Qtde_Entregue, :Qtde_Restante, :Qtde_S_Previsao, :Valor_Compra, :Valor_Original, :Valor_Unitario,');
      add(':Desc_Acr, :Desc_Acr_P, :Tipo_Desc_Acr, :dOUa, :Sub_Total, :Sub_Total_Liquido, :Cancelado, :Indica_Valor_Total, :Data_Entrega, :Tipo_Venda, :Tipo_Entrega)');

      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmPedido_Venda.EdtCodigo.Text);
      Parameters.ParamByName('N_Item').Value:= ADOQuery2N_Item.AsString;
      Parameters.ParamByName('Codigo_Produto').Value:= ADOQuery2Codigo_Produto.AsInteger;
      Parameters.ParamByName('Codigo_Venda').Value:= ADOQuery2Codigo_Venda.AsString;
      Parameters.ParamByName('Descricao').Value:= ADOQuery2Descricao.AsString;;
      Parameters.ParamByName('NCM').Value:= ADOQuery2NCM.AsString;;
      Parameters.ParamByName('Origem').Value:= ADOQuery2Origem.AsString;
      Parameters.ParamByName('CFOP').Value:= ADOQuery2CFOP.AsString;;
      Parameters.ParamByName('UN').Value:= ADOQuery2UN.AsString;;

      Parameters.ParamByName('Tipo_Calculo_BC_ICMS').Value:= ADOQuery2Tipo_Calculo_BC_ICMS.AsString;;
      Parameters.ParamByName('Tipo_Recolhimento').Value:= ADOQuery2Tipo_Recolhimento.AsString;;
      Parameters.ParamByName('ICMS').Value:= ADOQuery2ICMS.AsString;
      Parameters.ParamByName('CST').Value:= ADOQuery2CST.AsString;
      Parameters.ParamByName('CSOSN').Value:= ADOQuery2CSOSN.AsString;
      Parameters.ParamByName('Base_Reduzida').Value:= ADOQuery2Base_Reduzida.AsString;
      Parameters.ParamByName('Base_Acrescida').Value:= ADOQuery2Base_Acrescida.AsString;
      Parameters.ParamByName('BC').Value:= ADOQuery2BC.AsString;
      Parameters.ParamByName('Valor_ICMS').Value:= ADOQuery2Valor_ICMS.AsString;

      Parameters.ParamByName('Tipo_Calculo_BC_ICMS_NF').Value:= ADOQuery2Tipo_Calculo_BC_ICMS_NF.AsString;;
      Parameters.ParamByName('Tipo_Recolhimento_NF').Value:= ADOQuery2Tipo_Recolhimento_NF.AsString;;
      Parameters.ParamByName('ICMS_NF').Value:= ADOQuery2ICMS_NF.AsString;
      Parameters.ParamByName('CST_NF').Value:= ADOQuery2CST_NF.AsString;
      Parameters.ParamByName('CSOSN_NF').Value:= ADOQuery2CSOSN_NF.AsString;
      Parameters.ParamByName('Base_Reduzida_NF').Value:= ADOQuery2Base_Reduzida_NF.AsString;
      Parameters.ParamByName('Base_Acrescida_NF').Value:= ADOQuery2Base_Acrescida_NF.AsString;
      Parameters.ParamByName('BC_NF').Value:= ADOQuery2BC_NF.AsString;
      Parameters.ParamByName('Valor_ICMS_NF').Value:= ADOQuery2Valor_ICMS_NF.AsString;

      Parameters.ParamByName('Tipo_Calculo_BC_ICMS_ST').Value:= ADOQuery2Tipo_Calculo_BC_ICMS_ST.AsString;
      Parameters.ParamByName('MVAST').Value:= ADOQuery2MVAST.AsString;
      Parameters.ParamByName('ICMS_ST').Value:= ADOQuery2ICMS_ST.AsString;
      Parameters.ParamByName('CST_ST').Value:= ADOQuery2CST_ST.AsString;
      Parameters.ParamByName('Base_Reduzida_ST').Value:= ADOQuery2Base_Reduzida_ST.AsString;
      Parameters.ParamByName('Base_Acrescida_ST').Value:= ADOQuery2Base_Acrescida_ST.AsString;
      Parameters.ParamByName('BC_ST').Value:= ADOQuery2BC_ST.AsString;
      Parameters.ParamByName('Valor_ICMS_ST').Value:= ADOQuery2Valor_ICMS_ST.AsString;

      Parameters.ParamByName('Aliquota_Calculo_Credito').Value:= ADOQuery2Aliquota_Calculo_Credito.AsString;
      Parameters.ParamByName('Credito_ICMS').Value:= ADOQuery2Credito_ICMS.AsString;

      Parameters.ParamByName('Tipo_Calculo_IPI').Value:= ADOQuery2Tipo_Calculo_IPI.AsString;
      Parameters.ParamByName('IPI').Value:= ADOQuery2IPI.AsString;
      Parameters.ParamByName('CST_IPI').Value:= ADOQuery2CST_IPI.AsString;
      Parameters.ParamByName('Base_Reduzida_IPI').Value:= ADOQuery2Base_Reduzida_IPI.AsString;
      Parameters.ParamByName('Base_Acrescida_IPI').Value:= ADOQuery2Base_Acrescida_IPI.AsString;
      Parameters.ParamByName('BC_IPI').Value:= ADOQuery2BC_IPI.AsString;
      Parameters.ParamByName('Valor_IPI').Value:= ADOQuery2Valor_IPI.AsString;

      Parameters.ParamByName('Tipo_Calculo_PIS').Value:= ADOQuery2Tipo_Calculo_PIS.AsString;
      Parameters.ParamByName('PIS').Value:= ADOQuery2PIS.AsString;
      Parameters.ParamByName('CST_PIS').Value:= ADOQuery2CST_PIS.AsString;
      Parameters.ParamByName('Base_Reduzida_PIS').Value:= ADOQuery2Base_Reduzida_PIS.AsString;
      Parameters.ParamByName('Base_Acrescida_PIS').Value:= ADOQuery2Base_Acrescida_PIS.AsString;
      Parameters.ParamByName('BC_PIS').Value:= ADOQuery2BC_PIS.AsString;
      Parameters.ParamByName('Valor_PIS').Value:= ADOQuery2Valor_PIS.AsString;

      Parameters.ParamByName('Tipo_Calculo_COFINS').Value:= ADOQuery2Tipo_Calculo_COFINS.AsString;
      Parameters.ParamByName('COFINS').Value:= ADOQuery2COFINS.AsString;
      Parameters.ParamByName('CST_COFINS').Value:= ADOQuery2CST_COFINS.AsString;
      Parameters.ParamByName('Base_Reduzida_COFINS').Value:= ADOQuery2Base_Reduzida_COFINS.AsString;
      Parameters.ParamByName('Base_Acrescida_COFINS').Value:= ADOQuery2Base_Acrescida_COFINS.AsString;
      Parameters.ParamByName('BC_COFINS').Value:= ADOQuery2BC_COFINS.AsString;
      Parameters.ParamByName('Valor_COFINS').Value:= ADOQuery2Valor_COFINS.AsString;

      Parameters.ParamByName('Qtde').Value:= ADOQuery2Qtde.AsString;
      Parameters.ParamByName('Qtde_Entregue').Value:= ADOQuery2Qtde_Entregue.AsString;
      Parameters.ParamByName('Qtde_Restante').Value:= ADOQuery2Qtde_Restante.AsString;
      Parameters.ParamByName('Qtde_S_Previsao').Value:= ADOQuery2Qtde_S_Previsao.AsString;
      Parameters.ParamByName('Valor_Compra').Value:= ADOQuery2Valor_Compra.AsString;
      Parameters.ParamByName('Valor_Original').Value:= ADOQuery2Valor_Original.AsString;
      Parameters.ParamByName('Valor_Unitario').Value:= ADOQuery2Valor_Unitario.AsString;
      Parameters.ParamByName('Desc_Acr').Value:= ADOQuery2Desc_Acr.AsString;
      Parameters.ParamByName('Desc_Acr_P').Value:= ADOQuery2Desc_Acr_P.AsString;
      Parameters.ParamByName('Tipo_Desc_Acr').Value:= ADOQuery2Tipo_Desc_Acr.AsString;
      Parameters.ParamByName('dOUa').Value:= ADOQuery2dOUa.AsString;
      Parameters.ParamByName('Sub_Total').Value:= ADOQuery2Sub_Total.AsString;
      Parameters.ParamByName('Sub_Total_Liquido').Value:= ADOQuery2Sub_Total_Liquido.AsString;
      Parameters.ParamByName('Cancelado').Value:= ADOQuery2Cancelado.AsString;
      Parameters.ParamByName('Indica_Valor_Total').Value:= ADOQuery2Indica_Valor_Total.AsString;

        Parameters.ParamByName('Data_Entrega').Value:= date;

      Parameters.ParamByName('Tipo_Venda').Value:= ADOQuery2Tipo_Venda.AsString;
      Parameters.ParamByName('Tipo_Entrega').Value:= ADOQuery2Tipo_Entrega.AsString;
      ExecSQL;

    qtde_itens:= StrToInt(FrmPedido_Venda.EdtQuantidade_Itens.Text);
    inc(qtde_itens);

    total_produtos:= total_produtos + ( ADOQuery2Valor_Original.AsFloat * ADOQuery2Qtde.AsFloat);
    FrmPedido_Venda.EdtTotal_Produtos.Text:= FormatFloat('#0.0,0', total_produtos);
    FrmPedido_Venda.EdtTotal_Produtos.Text:= StringReplace(FrmPedido_Venda.EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

    total_pedido:= total_pedido + ADOQuery2Sub_Total.AsFloat;//( StrToFloat(EdtTotal_Desc_Acr.Text ) + ( StrToFloat(EdtTotal_Desconto.Text )));

    FrmPedido_Venda.EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', total_pedido);
    FrmPedido_Venda.EdtTotal_Pedido.Text:= StringReplace(FrmPedido_Venda.EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);

    des:= des + ADOQuery2Desc_Acr_P.AsFloat;
    FrmPedido_Venda.EdtTotal_Desc_Acr.Text:= FormatFloat('#0.0,0', des);

    FrmPedido_Venda.EdtQuantidade_Itens.Text:= IntToStr(qtde_itens);

  end; }

end;

procedure TFrmMescla_DAV.Inicia_Query_Conexao(Conexao: TADOConnection);
begin
  ADOQuery2.Connection:= Conexao;
  ADOQuery1.Connection:= Conexao;
end;

procedure TFrmMescla_DAV.Verifica_Produto_Lancado;
begin
  if not FrmPedido_Venda.qryitens_venda.IsEmpty then
  begin
    if (FrmPedido_Venda.qryitens_venda.Locate('Codigo;Codigo_Produto', VarArrayOf([StrToInt(FrmPedido_Venda.EdtCodigo.Text), ADOQuery2Codigo_Produto.AsInteger]), [])) then
    begin
      Produto_Ja_Lancamento_Venda;
      abort;
    end;
  end;

end;

end.
