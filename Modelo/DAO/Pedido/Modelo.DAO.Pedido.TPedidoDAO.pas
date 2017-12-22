unit Modelo.DAO.Pedido.TPedidoDAO;

interface
 uses
  ADODB;
  type
    TPedidoDAO = class
      private
        FQuery : TADOQuery;
        Conexao: TADOConnection;
      public
         constructor Create(query : TADOQuery; var Conexao: TADOConnection); overload;
         constructor Create(var Conexao: TADOConnection); overload;
         destructor Destroy;override;

         function carregarItensPedido(codPedido : Integer; query : TADOQuery):Boolean;
         procedure AtualizaPedidoMesclado(CodigoPedido: integer; Mesclado0OU1: integer);
    end;

implementation

uses
  Util.TLog, System.SysUtils, Util.Mensagens;

{ TPedidoDAO }

procedure TPedidoDAO.AtualizaPedidoMesclado(CodigoPedido, Mesclado0OU1: integer);
var
  SQL : string;
begin
  try
    SQL := 'update Pedido set Mesclada = :Mesclado where Codigo = :Pedido';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('Mesclado').Value := Mesclado0OU1;
    FQuery.Parameters.ParamByName('Pedido').Value := CodigoPedido;
    FQuery.ExecSQL;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - AtualizaPedidoMesclado - '+E.message);
      TLog.Error(Self.ClassName+' - AtualizaPedidoMesclado - '+E.message);
    end;
  end;
end;

function TPedidoDAO.carregarItensPedido(codPedido: Integer; query: TADOQuery): Boolean;
var
  SQL : string;
begin
  try
    Result := False;
    SQL := 'SELECT Ficha_Estoque_Codigo FROM Itens_Pedido WHERE Codigo = :codigoPedido';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('codigoPedido').Value := codPedido;
    FQuery.Open;
    Result := (FQuery.RecordCount > 0);
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - carregarItensPedido - '+E.message);
      TLog.Error(Self.ClassName+' - carregarItensPedido - '+E.message);
    end;
  end;
end;

constructor TPedidoDAO.Create(var Conexao: TADOConnection);
begin
  Self.Conexao:= Conexao;
  FQuery:= TADOQuery.Create(nil);
end;

constructor TPedidoDAO.Create(query: TADOQuery; var Conexao: TADOConnection);
begin
  FQuery := query;
  Self.Conexao := Conexao;
  FQuery.Connection:= Conexao;
end;

destructor TPedidoDAO.Destroy;
begin

  inherited;
end;

end.
