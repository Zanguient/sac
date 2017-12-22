unit Modelo.DAO.EntradaProdutos.ItensEntrada;

interface

uses
  ADODB, Entidade.TItensEntrada, Modelo.Entidade.ComandosSQL, Modelo.Dominio.ComandosSQL;

  type
    TItensEntradaDAO = class
      private
        qAux: TADOQuery;
        Conexao: TADOConnection;
        FComando: TComandoSQLEntidade;
        FItem: TItensEntradaEntidade;
        FComandoSQLDom: TComandoSQLDominio;
        procedure PreencheParametros;
        procedure PreencheValores;
      public
        function gravaItem(var FItensEntrada: TItensEntradaEntidade): Integer;
        function AtualizaItemChegado(CodigoProduto, CodigoEntrada: integer; Checado: AnsiString): Integer;
        function RemoveItem(CodigoProduto, CodigoEntrada: integer): Boolean;
        function RemoveTudo(CodigoEntrada: integer): Boolean;
        constructor Create(var Conexao: TADOConnection);
    end;
implementation

{ TItensEntradaDAO }

function TItensEntradaDAO.AtualizaItemChegado(CodigoProduto, CodigoEntrada: integer; Checado: AnsiString): Integer;
var
  comando: String;
begin
  comando:=
      'update Itens_Entrada set Checado = :Checado '+
      'where Codigo_Produto = :Codigo_Produto and Codigo = :Codigo';

  FComando:= TComandoSQLEntidade.Create;
  FComando.Conexao:= Conexao;
  FComando.ComandoSQL:= comando;
  FComando.Parametros.Add('Checado');
  FComando.Parametros.Add('Codigo_Produto');
  FComando.Parametros.Add('Codigo');
  FComando.Valores.Add(Checado);
  FComando.Valores.Add(CodigoProduto);
  FComando.Valores.Add(CodigoEntrada);
  FComandoSQLDom:= TComandoSQLDominio.Create(FComando);
  FComandoSQLDom.ExecutaComandoSQLSalvarAlterarExcluir;
end;

function TItensEntradaDAO.RemoveItem(CodigoProduto, CodigoEntrada: integer): Boolean;
var
  comando: String;
begin
  comando:=
      'Delete from Itens_Entrada where Codigo = :Codigo and Codigo_Produto = :Codigo_Produto ';

  FComando:= TComandoSQLEntidade.Create;
  FComando.Conexao:= Conexao;
  FComando.ComandoSQL:= comando;
  FComando.Parametros.Add('Codigo');
  FComando.Parametros.Add('Codigo_Produto');
  FComando.Valores.Add(CodigoEntrada);
  FComando.Valores.Add(CodigoProduto);
  FComandoSQLDom:= TComandoSQLDominio.Create(FComando);
  FComandoSQLDom.ExecutaComandoSQLSalvarAlterarExcluir;
end;

function TItensEntradaDAO.RemoveTudo(CodigoEntrada: integer): Boolean;
var
  comando: String;
begin
  comando:= 'Delete from Itens_Entrada where Codigo = :Codigo';

  FComando:= TComandoSQLEntidade.Create;
  FComando.Conexao:= Conexao;
  FComando.ComandoSQL:= comando;
  FComando.Parametros.Add('Codigo');
  FComando.Valores.Add(CodigoEntrada);
  FComandoSQLDom:= TComandoSQLDominio.Create(FComando);
  FComandoSQLDom.ExecutaComandoSQLSalvarAlterarExcluir;
end;

constructor TItensEntradaDAO.Create(var Conexao: TADOConnection);
begin
  Self.Conexao:= Conexao;
end;

function TItensEntradaDAO.gravaItem(var FItensEntrada: TItensEntradaEntidade): Integer;
var
  comando: String;
begin
  //FItem:= TItensEntradaEntidade.Create;
  FItem := FItensEntrada;
  comando:=
      'Insert into Itens_Entrada (Codigo, N_Item, N_Nota_Fiscal, Codigo_Produto, NCM, Unidade, ST, Valor_Ultima_Compra, Valor_Unitario, Quantidade, Quantidade_Restante,'+
      'Valor_Total, Valor_Frete_Unitario, Quantidade_Volume, BC_ICMS, Aliquota_ICMS, Aliquota_IPI, CFOP, Valor_ICMS_Unitario, Valor_IPI, Custo_Unitario,'+
      'Percentual_Lucro_Vista, Valor_Vista, Percentual_Lucro_Prazo, Valor_Prazo, Valor_Vista_Ultimo, Valor_Prazo_Ultimo, IVA, BC_ICMS_ST, Valor_ICMS_ST, Checado, Codigo_Produto_Fornecedor, Descricao_Produto, Valor_Ultima_Compra_Unitario, '+
      'Qtde_Estoque_Atual, Ficha_Estoque_Codigo, Data_Validade) values (:Codigo, :N_Item, :N_Nota_Fiscal, :Codigo_Produto, :NCM, :Unidade, :ST, '+
      ':Valor_Ultima_Compra, :Valor_Unitario, :Quantidade, :Quantidade_Restante, :Valor_Total, :Valor_Frete_Unitario, :Quantidade_Volume, :BC_ICMS, :Aliquota_ICMS, :Aliquota_IPI, :CFOP, :Valor_ICMS_Unitario, '+
      ':Valor_IPI, :Custo_Unitario, :Percentual_Lucro_Vista, :Valor_Vista, :Percentual_Lucro_Prazo, :Valor_Prazo, :Valor_Vista_Ultimo, :Valor_Prazo_Ultimo, :IVA, :BC_ICMS_ST, :Valor_ICMS_ST, :Checado, :Codigo_Produto_Fornecedor, :Descricao_Produto, '+
      ':Valor_Ultima_Compra_Unitario, :Qtde_Estoque_Atual, :Ficha_Estoque_Codigo, :Data_Validade)';

  FComando:= TComandoSQLEntidade.Create;
  FComando.Conexao:= Conexao;
  FComando.ComandoSQL:= comando;
  PreencheParametros;
  PreencheValores;
  FComandoSQLDom:= TComandoSQLDominio.Create(FComando);
  FComandoSQLDom.ExecutaComandoSQLSalvarAlterarExcluir;

end;

procedure TItensEntradaDAO.PreencheValores;
begin
  FComando.Valores.Add(FItem.Codigo);
  FComando.Valores.Add(FItem.N_Item);
  FComando.Valores.Add(FItem.N_Nota_Fiscal);
  FComando.Valores.Add(FItem.Codigo_Produto);
  FComando.Valores.Add(FItem.NCM);
  FComando.Valores.Add(FItem.Unidade);
  FComando.Valores.Add(FItem.ST);
  FComando.Valores.Add(FItem.Valor_Ultima_Compra);
  FComando.Valores.Add(FItem.Valor_Unitario);
  FComando.Valores.Add(FItem.Quantidade);
  FComando.Valores.Add(FItem.Quantidade_Restante);
  FComando.Valores.Add(FItem.Valor_Total);
  FComando.Valores.Add(FItem.Valor_Frete_Unitario);
  FComando.Valores.Add(FItem.Quantidade_Volume);
  FComando.Valores.Add(FItem.BC_ICMS);
  FComando.Valores.Add(FItem.Aliquota_ICMS);
  FComando.Valores.Add(FItem.Aliquota_IPI);
  FComando.Valores.Add(FItem.CFOP);
  FComando.Valores.Add(FItem.Valor_ICMS_Unitario);
  FComando.Valores.Add(FItem.Valor_IPI);
  FComando.Valores.Add(FItem.Custo_Unitario);
  FComando.Valores.Add(FItem.Percentual_Lucro_Vista);
  FComando.Valores.Add(FItem.Valor_Vista);
  FComando.Valores.Add(FItem.Percentual_Lucro_Prazo);
  FComando.Valores.Add(FItem.Valor_Prazo);
  FComando.Valores.Add(FItem.Valor_Vista_Ultimo);
  FComando.Valores.Add(FItem.Valor_Prazo_Ultimo);
  FComando.Valores.Add(FItem.IVA);
  FComando.Valores.Add(FItem.BC_ICMS_ST);
  FComando.Valores.Add(FItem.Valor_ICMS_ST);
  FComando.Valores.Add(FItem.Checado);
  FComando.Valores.Add(FItem.Codigo_Produto_Fornecedor);
  FComando.Valores.Add(FItem.Descricao_Produto);
  FComando.Valores.Add(FItem.Valor_Ultima_Compra_Unitario);
  FComando.Valores.Add(FItem.Qtde_Estoque_Atual);
  FComando.Valores.Add(FItem.Ficha_Estoque_Codigo);
  FComando.Valores.Add(FItem.Data_Validade);
end;

procedure TItensEntradaDAO.PreencheParametros;
begin
  FComando.Parametros.Add('Codigo');
  FComando.Parametros.Add('N_Item');
  FComando.Parametros.Add('N_Nota_Fiscal');
  FComando.Parametros.Add('Codigo_Produto');
  FComando.Parametros.Add('NCM');
  FComando.Parametros.Add('Unidade');
  FComando.Parametros.Add('ST');
  FComando.Parametros.Add('Valor_Ultima_Compra');
  FComando.Parametros.Add('Valor_Unitario');
  FComando.Parametros.Add('Quantidade');
  FComando.Parametros.Add('Quantidade_Restante');
  FComando.Parametros.Add('Valor_Total');
  FComando.Parametros.Add('Valor_Frete_Unitario');
  FComando.Parametros.Add('Quantidade_Volume');
  FComando.Parametros.Add('BC_ICMS');
  FComando.Parametros.Add('Aliquota_ICMS');
  FComando.Parametros.Add('Aliquota_IPI');
  FComando.Parametros.Add('CFOP');
  FComando.Parametros.Add('Valor_ICMS_Unitario');
  FComando.Parametros.Add('Valor_IPI');
  FComando.Parametros.Add('Custo_Unitario');
  FComando.Parametros.Add('Percentual_Lucro_Vista');
  FComando.Parametros.Add('Valor_Vista');
  FComando.Parametros.Add('Percentual_Lucro_Prazo');
  FComando.Parametros.Add('Valor_Prazo');
  FComando.Parametros.Add('Valor_Vista_Ultimo');
  FComando.Parametros.Add('Valor_Prazo_Ultimo');
  FComando.Parametros.Add('IVA');
  FComando.Parametros.Add('BC_ICMS_ST');
  FComando.Parametros.Add('Valor_ICMS_ST');
  FComando.Parametros.Add('Checado');
  FComando.Parametros.Add('Codigo_Produto_Fornecedor');
  FComando.Parametros.Add('Descricao_Produto');
  FComando.Parametros.Add('Valor_Ultima_Compra_Unitario');
  FComando.Parametros.Add('Qtde_Estoque_Atual');
  FComando.Parametros.Add('Ficha_Estoque_Codigo');
  FComando.Parametros.Add('Data_Validade');

end;

end.
