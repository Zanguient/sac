unit Modelo.Dominio.EntradaProdutos.TBuscaEntradaDominio;

interface
 uses
  ADODB, Modelo.DAO.EntradaProdutos.TBuscaEntradaProdutosDAO,
  Modelo.Dominio.EntradaProdutos.IBuscaEntradaDominio;
  type
    TBuscaEntradaDominio = class(TInterfacedObject, IBuscaEntradaDominio)
      private
        Conexao: TADOConnection;
      public

        constructor Create(var Conexao: TADOConnection);

        destructor Destroy;override;

        function buscarEntradaProdutos(condicao: String; buscarPor, ordernarPor : Integer; Query : TADOQuery): TADOQuery;

        function buscarEntradaReferenciaDevolucao(condicao, codFornecedor: String; buscarPor, ordernarPor : Integer; Query : TADOQuery): TADOQuery;

    end;

implementation
uses
  SysUtils, Util.TLog, UDM, Util.Mensagens;
{ TBuscaEntrada }

function TBuscaEntradaDominio.buscarEntradaReferenciaDevolucao(condicao, codFornecedor: String;
   buscarPor, ordernarPor: Integer; Query: TADOQuery): TADOQuery;
  var
  BuscaEntradaProdutosDAO : TBuscaEntradaProdutosDAO;
begin
  try
    try
      BuscaEntradaProdutosDAO := TBuscaEntradaProdutosDAO.Create(Query, Conexao);
      Result := BuscaEntradaProdutosDAO.buscar(condicao, codFornecedor, buscarPor, ordernarPor);
    except
      on E : Exception do
      begin
        TMensagens.MensagemErro(Self.ClassName+' - buscarEntradaReferenciaDevolucao - '+E.Message);
        TLog.Error(Self.ClassName+' - buscarEntradaReferenciaDevolucao - '+E.Message);
      end;
    end;
  finally
    FreeAndNil(BuscaEntradaProdutosDAO);
  end;
end;

constructor TBuscaEntradaDominio.Create(var Conexao: TADOConnection);
begin
  try
    Self.Conexao := Conexao;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - Create - '+E.Message);
      TLog.Error(Self.ClassName+' - Create - '+E.Message);
    end;
  end;
end;

destructor TBuscaEntradaDominio.Destroy;
begin
  try
    inherited;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - Destroy - '+E.Message);
      TLog.Error(Self.ClassName+' - Destroy - '+E.Message);
    end;
  end;
end;

function TBuscaEntradaDominio.buscarEntradaProdutos(condicao: String; buscarPor, ordernarPor : Integer; Query : TADOQuery): TADOQuery;
var
  BuscaEntradaProdutosDAO : TBuscaEntradaProdutosDAO;
begin
  try
    try
      BuscaEntradaProdutosDAO := TBuscaEntradaProdutosDAO.Create(Query, Conexao);
      Result := BuscaEntradaProdutosDAO.buscar(condicao, buscarPor, ordernarPor);
    except
      on E : Exception do
      begin
        TMensagens.MensagemErro(Self.ClassName+' - buscarEntradaProdutos - '+E.Message);
        TLog.Error(Self.ClassName+' - buscarEntradaProdutos - '+E.Message);
      end;
    end;
  finally
    FreeAndNil(BuscaEntradaProdutosDAO);
  end;
end;


end.
