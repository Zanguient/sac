unit UMescla_Venda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, Grids, DBGrids, DB, ImgList, ComCtrls, ToolWin;

type
  TFrmMescla_Venda = class(TForm)
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1N_Pre_Venda: TStringField;
    TlbFerramentas: TToolBar;
    BBtnOK: TToolButton;
    BBtnFechar: TToolButton;
    ADOQuery1Status: TStringField;
    ADOQuery1Codigo: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure BBtnOKClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    qAux, qAux2, qAux3, qAux4: TAdoquery;
    cod_pro, cod_pro_int, descri, qtde_vendida, unid, valor_unit, desc_item, acre_item, valor_total_item, tot_par,
    indicador_cancelamento_item, qtde_cancelada, valor_cancelado, can_acre, IAT, IPPT, casa_decimal_qtde,
    casa_decimal_val_un: AnsiString;

    var
      qtde_itens: integer;
      total_produtos, total_acrecimo, total_desconto, total_pedido: double;
    procedure Coleta_Dados_R05;
    procedure Salva_R05;
    procedure Salva_Itens;
    procedure Captura_Produtos;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMescla_Venda: TFrmMescla_Venda;

implementation

uses UDeclaracao, UDM, UPre_Venda, UGeral, UPedido_Venda;

{$R *.dfm}

procedure TFrmMescla_Venda.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmMescla_Venda.BBtnOKClick(Sender: TObject);
begin
  try
    qAux:= TADOQuery.Create(self);
    qAux2:= TADOQuery.Create(self);
    qAux3:= TADOQuery.Create(self);
    qAux4:= TADOQuery.Create(self);

    Gera_Codigo_Lancamento(FrmPedido_Venda.Conexao);
    Captura_Produtos;
    ADOQuery1.First;

    //percorrer toda a grid para ver quem está marcado
    while not ADOQuery1.Eof do
    begin
      if (DBGrid1.SelectedRows.CurrentRowSelected) then
      begin
        with qAux3, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('Insert Into Controla_Mesclagem_Venda (N_Pre_Venda, N_Pre_Venda_Antiga, Codigo_Pre_Venda_Antiga) values');
          add('(:N_Pre_Venda, :N_Pre_Venda_Antiga, :Codigo_Pre_Venda_Antiga)');
          Parameters.ParamByName('N_Pre_Venda').Value:= FrmPre_Venda.EdtN_Pedido.Text;
          Parameters.ParamByName('N_Pre_Venda_Antiga').Value:= ADOQuery1N_Pre_Venda.AsString;
          Parameters.ParamByName('Codigo_Pre_Venda_Antiga').Value:= ADOQuery1Codigo.AsString;
          ExecSQL;
        end;

        with qAux2, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('select Ped.N_Pre_Venda, IP.* from Itens_Pedido IP');
          add('inner join Pedido Ped on (IP.Codigo = Ped.Codigo)');
          add('where Ped.N_Pre_Venda = :N');
          Parameters.ParamByName('N').Value:= ADOQuery1N_Pre_Venda.AsString;
          open;
        end;

        //pegar os itens daquele que está marcado
        while not qAux2.Eof do
        begin
          qAux4.Locate('Codigo', qAux2.FieldByName('Codigo_Produto').AsInteger, []);
          Salva_Itens;
          Coleta_Dados_R05;
          Salva_R05;

          qAux2.Next;
        end;
      end;
      ADOQuery1.Next;
    end;
  finally
    FreeAndNil(qAux);

    with FrmPre_Venda.qryitens_venda, sql do
    begin
      close;
      clear;
      add('select IP.*, P.Codigo_Venda, P.Descricao from Itens_Pedido IP');
      add('inner join Produto P on (IP.Codigo_Produto = P.Codigo)');
      add('where IP.Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmPre_Venda.EdtCodigo.Text);
      open;
    end;
    FrmPre_Venda.EdtTotal_Produtos.Text:= FormatFloat('#0.0,0', total_produtos);
    FrmPre_Venda.EdtTotal_Produtos.Text:= StringReplace(FrmPre_Venda.EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmPre_Venda.EdtTotal_Acrecimo.Text:= FormatFloat('#0.0,0', total_acrecimo);
    FrmPre_Venda.EdtTotal_Acrecimo.Text:= StringReplace(FrmPre_Venda.EdtTotal_Acrecimo.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmPre_Venda.EdtTotal_Desconto.Text:= FormatFloat('#0.0,0', total_desconto);
    FrmPre_Venda.EdtTotal_Desconto.Text:= StringReplace(FrmPre_Venda.EdtTotal_Desconto.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmPre_Venda.EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', total_pedido);
    FrmPre_Venda.EdtTotal_Pedido.Text:= StringReplace(FrmPre_Venda.EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);

    FrmPre_Venda.EdtQuantidade_Itens.Text:= IntToStr(qtde_itens);
    FrmPre_Venda.BBtnOrcamento.Enabled:= true;
    FrmPre_Venda.mescla:= true;
    close;
  end;
end;

procedure TFrmMescla_Venda.Captura_Produtos;
begin
  with qAux4, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select P.Codigo, P.Codigo_Venda, P.Descricao, RI.Aliquota as ICMS, P.Estoque, P.Tipo,');
    add('P.Volume, P.Tipo_Tributacao, P.Arred_Trunc, P.Producao_Propria, UM.Sigla, ITI.Origem, ITI.Destino from Produto P');
    add('left join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
    add('left join Grupo_Produto_Tributacao GPT on (P.Codigo_Grupo_Tributacao = GPT.Codigo)');
    add('left join Tratamento_ICMS TI on (GPT.Codigo_Tratamento_ICMS = TI.Codigo)');
    add('left join Itens_Tratamento_ICMS ITI on (ITI.Codigo = TI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
    add('left join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Codigo)');
    Parameters.ParamByName('GO1').Value:= uf;
    Parameters.ParamByName('GO2').Value:= uf;
    open;
  end;
end;

procedure TFrmMescla_Venda.Coleta_Dados_R05;
begin
  cod_pro:= qAux4.FieldByName('Codigo_Venda').AsString;
  cod_pro_int:= qAux4.FieldByName('Codigo').AsString;
  descri:= qAux4.FieldByName('Descricao').AsString;
  qtde_vendida:= qAux2.FieldByName('Qtde').AsString;
  unid:= qAux4.FieldByName('Sigla').AsString;
  valor_unit:= qAux2.FieldByName('Valor_Unitario').AsString;
  desc_item:= qAux2.FieldByName('Desconto').AsString;
  acre_item:= qAux2.FieldByName('Acrecimo').AsString;
  valor_total_item:= qAux2.FieldByName('Sub_Total').AsString;
  tot_par:= '';
  indicador_cancelamento_item:= 'N';
  qtde_cancelada:= '';
  valor_cancelado:= '';
  can_acre:= '0';
  IAT:= qAux4.FieldByName('Arred_Trunc').AsString;
  IPPT:= qAux4.FieldByName('Producao_Propria').AsString;
  casa_decimal_qtde:= '0';
  casa_decimal_val_un:= '2';
end;

procedure TFrmMescla_Venda.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmMescla_Venda.FormCreate(Sender: TObject);
begin
  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select Ped.Codigo, Ped.N_Pre_Venda, Ped.Status, Ped.Tipo from Pedido Ped');
    add('where Ped.Tipo = :Tipo and Ped.Status = :Status');
    Parameters.ParamByName('Tipo').Value:= 'PRÉ-VENDA';
    Parameters.ParamByName('Status').Value:= 'PENDENTE';
    open;
  end;
end;

procedure TFrmMescla_Venda.Salva_Itens;
begin
  with qAux, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('Insert into Itens_Pedido (Codigo, N_Item, Codigo_Produto, UN, ');
    add('ICMS, CST, Base_Reduzida, Base_Acrescida, BC, Valor_ICMS, ');
    add('IPI, CST_IPI, Base_Reduzida_IPI, Base_Acrescida_IPI, BC_IPI, Valor_IPI, ');
    add('PIS, CST_PIS, Base_Reduzida_PIS, Base_Acrescida_PIS, BC_PIS, Valor_PIS, ');
    add('COFINS, CST_COFINS, Base_Reduzida_COFINS, Base_Acrescida_COFINS, BC_COFINS, Valor_COFINS, ');
    add('Qtde, Qtde_Entregue, Qtde_Restante, ');
    add('Valor_Unitario, Desconto, Tipo_Desconto, Acrecimo, Tipo_Acrecimo, Sub_Total, Sub_Total_Liquido, Cancelado)');
    add('values (:Codigo, :N_Item, :Codigo_Produto, :UN, ');
    add(':ICMS, :CST, :Base_Reduzida, :Base_Acrescida, :BC, :Valor_ICMS, ');
    add(':IPI, :CST_IPI, :Base_Reduzida_IPI, :Base_Acrescida_IPI, :BC_IPI, :Valor_IPI, ');
    add(':PIS, :CST_PIS, :Base_Reduzida_PIS, :Base_Acrescida_PIS, :BC_PIS, :Valor_PIS, ');
    add(':COFINS, :CST_COFINS, :Base_Reduzida_COFINS, :Base_Acrescida_COFINS, :BC_COFINS, :Valor_COFINS, ');
    add(':Qtde, :Qtde_Entregue, :Qtde_Restante, :Valor_Unitario,');
    add(':Desconto, :Tipo_Desconto, :Acrecimo, :Tipo_Acrecimo, :Sub_Total, :Sub_Total_Liquido, :Cancelado)');

    Parameters.ParamByName('Codigo').Value:= StrToInt(FrmPre_Venda.EdtCodigo.Text);
    Parameters.ParamByName('N_Item').Value:= qAux2.FieldByName('N_Item').AsString;
    Parameters.ParamByName('Codigo_Produto').Value:= qAux2.FieldByName('Codigo_Produto').AsInteger;
    Parameters.ParamByName('UN').Value:= qAux2.FieldByName('UN').AsString;


    Parameters.ParamByName('ICMS').Value:= qAux2.FieldByName('ICMS').AsString;
    Parameters.ParamByName('CST').Value:= qAux2.FieldByName('CST').AsString;
    Parameters.ParamByName('Base_Reduzida').Value:= qAux2.FieldByName('Base_Reduzida').AsString;
    Parameters.ParamByName('Base_Acrescida').Value:= qAux2.FieldByName('Base_Acrescida').AsString;
    Parameters.ParamByName('BC').Value:= qAux2.FieldByName('BC').AsString;
    Parameters.ParamByName('Valor_ICMS').Value:= qAux2.FieldByName('Valor_ICMS').AsString;

    Parameters.ParamByName('IPI').Value:= qAux2.FieldByName('IPI').AsString;
    Parameters.ParamByName('CST_IPI').Value:= qAux2.FieldByName('CST_IPI').AsString;
    Parameters.ParamByName('Base_Reduzida_IPI').Value:= qAux2.FieldByName('Base_Reduzida_IPI').AsString;
    Parameters.ParamByName('Base_Acrescida_IPI').Value:= qAux2.FieldByName('Base_Acrescida_IPI').AsString;
    Parameters.ParamByName('BC_IPI').Value:= qAux2.FieldByName('BC_IPI').AsString;
    Parameters.ParamByName('Valor_IPI').Value:= qAux2.FieldByName('Valor_IPI').AsString;

    Parameters.ParamByName('PIS').Value:= qAux2.FieldByName('PIS').AsString;
    Parameters.ParamByName('CST_PIS').Value:= qAux2.FieldByName('CST_PIS').AsString;
    Parameters.ParamByName('Base_Reduzida_PIS').Value:= qAux2.FieldByName('Base_Reduzida_PIS').AsString;
    Parameters.ParamByName('Base_Acrescida_PIS').Value:= qAux2.FieldByName('Base_Acrescida_PIS').AsString;
    Parameters.ParamByName('BC_PIS').Value:= qAux2.FieldByName('BC_PIS').AsString;
    Parameters.ParamByName('Valor_PIS').Value:= qAux2.FieldByName('Valor_PIS').AsString;

    Parameters.ParamByName('COFINS').Value:= qAux2.FieldByName('COFINS').AsString;
    Parameters.ParamByName('CST_COFINS').Value:= qAux2.FieldByName('CST_COFINS').AsString;
    Parameters.ParamByName('Base_Reduzida_COFINS').Value:= qAux2.FieldByName('Base_Reduzida_COFINS').AsString;
    Parameters.ParamByName('Base_Acrescida_COFINS').Value:= qAux2.FieldByName('Base_Acrescida_COFINS').AsString;
    Parameters.ParamByName('BC_COFINS').Value:= qAux2.FieldByName('BC_COFINS').AsString;
    Parameters.ParamByName('Valor_COFINS').Value:= qAux2.FieldByName('Valor_COFINS').AsString;


    Parameters.ParamByName('Qtde').Value:= qAux2.FieldByName('Qtde').AsFloat;
    Parameters.ParamByName('Qtde_Entregue').Value:= qAux2.FieldByName('Qtde_Entregue').AsFloat;
    Parameters.ParamByName('Qtde_Restante').Value:= qAux2.FieldByName('Qtde_Restante').AsFloat;
    Parameters.ParamByName('Valor_Unitario').Value:= qAux2.FieldByName('Valor_Unitario').AsFloat;
    Parameters.ParamByName('Desconto').Value:= qAux2.FieldByName('Desconto').AsFloat;
    Parameters.ParamByName('Tipo_Desconto').Value:= qAux2.FieldByName('Tipo_Desconto').AsString;
    Parameters.ParamByName('Acrecimo').Value:= qAux2.FieldByName('Acrecimo').AsFloat;
    Parameters.ParamByName('Tipo_Acrecimo').Value:= qAux2.FieldByName('Tipo_Acrecimo').AsString;
    Parameters.ParamByName('Sub_Total').Value:= qAux2.FieldByName('Sub_Total').AsFloat;
    Parameters.ParamByName('Sub_Total_Liquido').Value:= qAux2.FieldByName('Sub_Total_Liquido').AsFloat;
    Parameters.ParamByName('Cancelado').Value:= qAux2.FieldByName('Cancelado').AsString;
    ExecSQL;
    inc(qtde_itens);
    total_produtos:= total_produtos + qAux2.FieldByName('Valor_Unitario').AsFloat * qAux2.FieldByName('Qtde').AsFloat;
    total_acrecimo:= total_acrecimo + qAux2.FieldByName('Acrecimo').AsFloat;
    total_desconto:= total_desconto + qAux2.FieldByName('Desconto').AsFloat;
    if (qAux2.FieldByName('Cancelado').AsString = 'N') then
      total_pedido:= total_pedido +
                     qAux2.FieldByName('Sub_Total').AsFloat -
                     qAux2.FieldByName('Desconto').AsFloat +
                     qAux2.FieldByName('Acrecimo').AsFloat
    else
      total_pedido:= total_pedido;
  end;
end;

procedure TFrmMescla_Venda.Salva_R05;
var
  qTemp: TADOQuery;
begin
  try
    qTemp:= TADOQuery.Create(self);
    with qTemp, SQL do
      begin
        close;
        clear;
        Connection:= dm.ADOConnection1;
        add('Insert into R05 (Tipo, N_Pedido, ');
        add('Codigo_Produto_Inteiro, Codigo_Produto, Descricao, Quantidade, Unidade, Valor_Unitario, Desconto, Acrecimo, Valor_Total,');
        add('Cancelamento, Quantidade_Cancelada, Valor_Cancelado, Valor_Cancelamento_Acrecimo,');
        add('IAT, IPPT, Casas_Decimais_Qtde, Casas_Decimais_Valor_Unitario) values (:Tipo, :N_Pedido, ');
        add(':Codigo_Produto_Inteiro, :Codigo_Produto, :Descricao, :Quantidade, :Unidade,');
        add(':Valor_Unitario, :Desconto, :Acrecimo, :Valor_Total, :Cancelamento, :Quantidade_Cancelada,');
        add(':Valor_Cancelado, :Valor_Cancelamento_Acrecimo, :IAT, :IPPT, :Casas_Decimais_Qtde, :Casas_Decimais_Valor_Unitario)');

        Parameters.ParamByName('Tipo').Value:= 'R05';
        Parameters.ParamByName('N_Pedido').Value:= FrmPre_Venda.EdtCodigo.Text;
        Parameters.ParamByName('Codigo_Produto_Inteiro').Value:= cod_pro_int;
        Parameters.ParamByName('Codigo_Produto').Value:= cod_pro;
        Parameters.ParamByName('Descricao').Value:= descri;
        Parameters.ParamByName('Quantidade').Value:= qtde_vendida;
        Parameters.ParamByName('Unidade').Value:= unid;
        Parameters.ParamByName('Valor_Unitario').Value:= valor_unit;
        Parameters.ParamByName('Desconto').Value:= desc_item;
        Parameters.ParamByName('Acrecimo').Value:= acre_item;
        Parameters.ParamByName('Valor_Total').Value:= valor_total_item;
        Parameters.ParamByName('Cancelamento').Value:= indicador_cancelamento_item;
        Parameters.ParamByName('Quantidade_Cancelada').Value:= qtde_cancelada;
        Parameters.ParamByName('Valor_Cancelado').Value:= valor_cancelado;
        Parameters.ParamByName('Valor_Cancelamento_Acrecimo').Value:= can_acre;
        Parameters.ParamByName('IAT').Value:= IAT;
        Parameters.ParamByName('IPPT').Value:= IPPT;
        Parameters.ParamByName('Casas_Decimais_Qtde').Value:= casa_decimal_qtde;
        Parameters.ParamByName('Casas_Decimais_Valor_Unitario').Value:= casa_decimal_val_un;
        ExecSQL;
      end;
  finally
    FreeAndNil(qTemp);
  end;
end;

end.
