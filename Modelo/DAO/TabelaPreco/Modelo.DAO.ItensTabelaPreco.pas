unit Modelo.DAO.ItensTabelaPreco;

interface

uses
  Modelo.Entidade.ItensTabelaPreco, ADODB, Modelo.Dominio.ComandosSQL,
  Modelo.Entidade.ComandosSQL;

  type
    TItensTabelaPrecoDAO = class
      private
        FItensTabelaPreco: TItensTabelaPrecoEntidade;
        FComando: TComandoSQLEntidade;
        FComandoSQLDom: TComandoSQLDominio;
        Conexao: TADOConnection;
      public
        function AtualizaValoresEntrada(FItemTabelaPreco: TItensTabelaPrecoEntidade): integer;
        constructor Create(var Conexao: TADOConnection);
    end;
implementation

{ ItensTabelaPrecoDAO }

function TItensTabelaPrecoDAO.AtualizaValoresEntrada(
  FItemTabelaPreco: TItensTabelaPrecoEntidade): integer;
var
  comando: String;
begin
  comando:=
      'update Itens_Tabela_Preco set Preco_Vista = :Preco_Vista, Percentual_Lucro_Vista = :Percentual_Lucro_Vista,'+
        'Preco_Prazo = :Preco_Prazo, Percentual_Lucro_Prazo = :Percentual_Lucro_Prazo '+
        'where Codigo_Produto = :Codigo_Produto and Codigo = :Codigo';

  FComando:= TComandoSQLEntidade.Create;
  FComando.Conexao:= Conexao;
  FComando.ComandoSQL:= comando;
  FComando.Parametros.Add('Preco_Vista');
  FComando.Parametros.Add('Percentual_Lucro_Vista');
  FComando.Parametros.Add('Preco_Prazo');
  FComando.Parametros.Add('Percentual_Lucro_Prazo');
  FComando.Parametros.Add('Codigo_Produto');
  FComando.Parametros.Add('Codigo');
  FComando.Valores.Add(FItemTabelaPreco.PrecoVista);
  FComando.Valores.Add(FItemTabelaPreco.PercentualLucroVista);
  FComando.Valores.Add(FItemTabelaPreco.PrecoPrazo);
  FComando.Valores.Add(FItemTabelaPreco.PercentualLucroPrazo);
  FComando.Valores.Add(FItemTabelaPreco.CodigoProduto);
  FComando.Valores.Add(FItemTabelaPreco.Codigo);
  FComandoSQLDom:= TComandoSQLDominio.Create(FComando);
  FComandoSQLDom.ExecutaComandoSQLSalvarAlterarExcluir;
end;

constructor TItensTabelaPrecoDAO.Create(var Conexao: TADOConnection);
begin
  Self.Conexao:= Conexao;
end;

end.
