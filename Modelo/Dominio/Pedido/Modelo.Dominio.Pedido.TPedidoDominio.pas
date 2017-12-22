unit Modelo.Dominio.Pedido.TPedidoDominio;

interface
 uses
  ADODB, UDM, Modelo.DAO.Pedido.TPedidoDAO, Modelo.Dominio.Pedido.IPedidoDominio;
  type
    TPedidoDominio = class(TInterfacedObject, IPedidoDominio)
      private
        FQuery     : TADOQuery;
        FPedidoDAO : TPedidoDAO;
        Conexao: TADOConnection;

        function retornarCodigFichaEstoqueDoPedido(codPedido : Integer):TADOQuery;

      public
        constructor Create(var Conexao: TADOConnection);

        destructor Destroy;override;

        function removerFichaEstoque(codPedido : Integer):Boolean;

    end;

implementation

uses
  Util.TLog, System.SysUtils,  Modelo.Dominio.Estoque.IFichaEstoqueDominio,
  Modelo.Dominio.Estoque.TFichaEstoqueDominio,
  Modelo.Entidade.Estoque.TFichaEstoque, Util.Mensagens;

{ TPedidoDominio }

constructor TPedidoDominio.Create(var Conexao: TADOConnection);
begin
  FQuery := TADOQuery.Create(nil);
  FQuery.Connection := Conexao;
  Self.Conexao:= Conexao;
  FPedidoDAO := TPedidoDAO.Create(FQuery, Conexao);
end;

destructor TPedidoDominio.Destroy;
begin
  FQuery.Close;
  FreeAndNil(FQuery);
  FreeAndNil(FPedidoDAO);
  inherited;
end;

function TPedidoDominio.retornarCodigFichaEstoqueDoPedido(codPedido: Integer): TADOQuery;
begin
  try
    Result := TADOQuery.Create(nil);
    Result.Connection := Conexao;
    FPedidoDAO.carregarItensPedido(codPedido, Result);
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - retornarCodigFichaEstoqueDoPedido - '+E.Message);
      TLog.Error(Self.ClassName+' - retornarCodigFichaEstoqueDoPedido - '+E.Message);
    end;
  end;
end;

function TPedidoDominio.removerFichaEstoque(codPedido : Integer): Boolean;
var
  FichaEstoqueDominio : IFichaEstoqueDominio;
  FichaEstoque : TFichaEstoque;
  query : TADOQuery;
begin
  try
    try
      FichaEstoqueDominio := TFichaEstoqueDominio.Create(Conexao);
      while not query.Eof do begin
        FichaEstoque := nil;
        query := retornarCodigFichaEstoqueDoPedido(codPedido);
        FichaEstoque := FichaEstoqueDominio.retornarFichaEstoquePorCodigo(query.FieldByName('Ficha_Estoque_Codigo').AsInteger);
        if Assigned(FichaEstoque) then begin
          FichaEstoqueDominio.removerFichaEstoque(FichaEstoque);
        end;
        query.Next;
      end;
    except
      on E : Exception do
      begin
        TMensagens.MensagemErro(Self.ClassName+' - removerFichaEstoque - '+E.Message);
        TLog.Error(Self.ClassName+' - removerFichaEstoque - '+E.Message);
      end;
    end;
  finally
    FichaEstoqueDominio := nil;
  end;
end;

end.
