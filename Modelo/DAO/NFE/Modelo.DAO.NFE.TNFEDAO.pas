unit Modelo.DAO.NFE.TNFEDAO;

interface
 uses
  ADODB, Util.TLog, Windows;
  type
     TNFEDAO = class
       private
         FQuery : TADOQuery;
         Conexao: TADOConnection;

       public

        constructor Create(query : TADOQuery; var Conexao: TADOConnection);

        destructor Destroy;override;

        function atualizarPedidoCodFichaEstoque(CodItemPedido, codigoFichaEstoque : Integer):Boolean;

        function carregarItensPedido(Query: TADOQuery; NumeroNF: Integer): Boolean;

        end;

implementation
uses
  SysUtils, Util.Mensagens;
{ TNFEDAO }

function TNFEDAO.atualizarPedidoCodFichaEstoque(CodItemPedido, codigoFichaEstoque: Integer): Boolean;
var
  SQL : string;
begin
  try
    Result := False;
    SQL := 'UPDATE Itens_Pedido SET Ficha_Estoque_Codigo = :codigoFicha WHERE Codigo_Registro = :CodigoItemPedigo';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('codigoFicha').Value := codigoFichaEstoque;
    FQuery.Parameters.ParamByName('CodigoItemPedigo').Value := CodItemPedido;
    Result := (FQuery.ExecSQL > 0);
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.className+' - atualizarPedidoCodFichaEstoque - '+E.Message);
      TLog.Error(Self.className+' - atualizarPedidoCodFichaEstoque - '+E.Message);
    end;
  end;
end;

function TNFEDAO.carregarItensPedido(Query: TADOQuery; NumeroNF: Integer): Boolean;
var
  SQL : string;
begin
  try
    Result := False;
    SQL := ' Select IP.Ficha_Estoque_Codigo from Itens_Pedido IP '+
           ' left join Pedido P on (IP.Codigo = P.Codigo)'+
           ' WHERE P.N_Nota_Fiscal = :NF';
    Query.Close;
    Query.Connection:= Conexao;
    Query.SQL.Clear;
    Query.SQL.Add(SQL);
    Query.Parameters.ParamByName('NF').Value := NumeroNF;
    Result := (FQuery.ExecSQL > 0);
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.className+' - atualizarPedidoCodFichaEstoque - '+E.Message);
      TLog.Error(Self.className+' - atualizarPedidoCodFichaEstoque - '+E.Message);
    end;
  end;

end;

constructor TNFEDAO.Create(query : TADOQuery; var Conexao: TADOConnection);
begin
  try
    Self.FQuery := query;
    Self.Conexao:= Conexao;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.className+' - Create - '+E.Message);
      TLog.Error(Self.className+' - Create - '+E.Message);
    end;
  end;
end;

destructor TNFEDAO.Destroy;
begin
  try
    inherited;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.className+' - Destroy - '+E.Message);
      TLog.Error(Self.className+' - Destroy - '+E.Message);
    end;
  end;
end;

end.
