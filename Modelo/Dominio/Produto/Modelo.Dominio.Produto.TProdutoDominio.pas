unit Modelo.Dominio.Produto.TProdutoDominio;

interface

uses
  Modelo.Entidade.Produto.TProduto, Modelo.Entidade.Produto.TProdutoLista,
  Modelo.DAO.Produto.TProdutoDAO, Modelo.Dominio.Produto.IProdutoDominio,
  ADODB;

type
  TProdutoDominio = class(TInterfacedObject, IProdutoDominio)
  private
    FProduto: TProdutoEntidade;
    FProdutoDAO: TProdutoDAO;
    Conexao: TADOConnection;
    function RetornaEstoqueAtual(CodigoProduto: integer): double;
  public
    constructor Create(var Conexao: TADOConnection);

    destructor Destroy; override;

    procedure NovoProduto;

    function gravarProduto: Boolean;

    function removerProduto: Boolean;

    function buscarProdutoPorCodigo(codigo: integer): TProdutoEntidade;

    function buscarTodosProdutos: TProdutoLista;

    function AtualizaCodigoProdutoFornecedor
      (FProduto: TProdutoEntidade): integer;

    function AtualizaDadosEntrada(FProduto: TProdutoEntidade): integer;

    function AtualizaNCM(CodigoProduto: integer; NCM: AnsiString): Boolean;

    function AtualizaDataValidade(CodigoProduto: integer;
      DataValidade: TDate): Boolean;

    function AtualizaCusto(ValorCompra, CustoCompra: double;
      CodigoProduto: integer): Boolean;

    function AtualizaEstoque(CodigoProduto: integer; QtdeVendida: double;
      TipoOperacao: AnsiString; InserirExcluir: integer): Boolean;

    procedure ProcuraProdutoCodigo(UFOrigem, UFDestino: AnsiString; 
Tabela, CampoPesquisa: Integer; TextoPesquisa: AnsiString);
  end;

implementation

uses
  SysUtils, Util.TLog, Util.Mensagens, UDM, UConsulta;

{ TClienteDominio }

constructor TProdutoDominio.Create(var Conexao: TADOConnection);
begin
  Self.Conexao := Conexao;
  FProdutoDAO := TProdutoDAO.Create(Conexao);
end;

destructor TProdutoDominio.Destroy;
begin
  if Assigned(FProduto) then
    FreeAndNil(FProduto);
  inherited;
end;

function TProdutoDominio.AtualizaCodigoProdutoFornecedor
  (FProduto: TProdutoEntidade): integer;
begin

end;

function TProdutoDominio.AtualizaCusto(ValorCompra, CustoCompra: double;
  CodigoProduto: integer): Boolean;
begin
  try
    FProdutoDAO.AtualizaCusto(ValorCompra, CustoCompra, CodigoProduto);
  finally

  end;
end;

function TProdutoDominio.AtualizaDadosEntrada
  (FProduto: TProdutoEntidade): integer;
begin
  try
    FProdutoDAO.AtualizaDadosEntrada(FProduto);
  finally

  end;
end;

function TProdutoDominio.AtualizaDataValidade(CodigoProduto: integer;
  DataValidade: TDate): Boolean;
begin
  FProdutoDAO.AtualizaDataValidade(CodigoProduto, DataValidade)
end;

function TProdutoDominio.AtualizaEstoque(CodigoProduto: integer;
  QtdeVendida: double; TipoOperacao: AnsiString;
  InserirExcluir: integer): Boolean;
var
  EstoqueAtual, NovoEstoque: double;
begin
  NovoEstoque := 0;
  EstoqueAtual := FProdutoDAO.RetornaEstoqueAtual(CodigoProduto);

  if (TipoOperacao = '+') then
  begin
    if (InserirExcluir = 0) then
    begin
      NovoEstoque := EstoqueAtual + QtdeVendida;
    end
    else
    begin
      NovoEstoque := EstoqueAtual - QtdeVendida;
    end;
  end
  else
  begin
    if (InserirExcluir = 0) then
    begin
      NovoEstoque := EstoqueAtual - QtdeVendida;
    end
    else
    begin
      NovoEstoque := EstoqueAtual + QtdeVendida;
    end;
  end;
  FProdutoDAO.AtualizaEstoque(CodigoProduto, NovoEstoque);
end;

function TProdutoDominio.AtualizaNCM(CodigoProduto: integer;
  NCM: AnsiString): Boolean;
begin
  FProdutoDAO.AtualizaNCM(CodigoProduto, NCM);
end;

function TProdutoDominio.buscarProdutoPorCodigo(codigo: integer)
  : TProdutoEntidade;
begin
  try
    Result := TProdutoEntidade.Create;
  except
    on E: Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName + ' - buscarClientePorCodigo - ' +
        E.Message);
      TLog.Error(Self.ClassName + ' - buscarClientePorCodigo - ' + E.Message);
    end;
  end;
end;

function TProdutoDominio.buscarTodosProdutos: TProdutoLista;
begin
  try
    Result := TProdutoLista.Create;

  except
    on E: Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName + ' - buscarTodosCliente - ' +
        E.Message);
      TLog.Error(Self.ClassName + ' - buscarTodosCliente - ' + E.Message);
    end;

  end;
end;

function TProdutoDominio.gravarProduto: Boolean;
begin
  try

  except
    on E: Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName + ' - GravarProduto - ' +
        E.Message);
      TLog.Error(Self.ClassName + ' - GravarProduto - ' + E.Message);
    end;

  end;
end;

procedure TProdutoDominio.NovoProduto;
begin
  try
    if Assigned(FProduto) then
      FreeAndNil(FProduto);
    FProduto := TProdutoEntidade.Create;

  except
    on E: Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName + ' - NovoProduto - ' + E.Message);
      TLog.Error(Self.ClassName + ' - NovoProduto - ' + E.Message);
    end;

  end;
end;

procedure TProdutoDominio.ProcuraProdutoCodigo(UFOrigem, UFDestino: AnsiString; 
Tabela, CampoPesquisa: Integer; TextoPesquisa: AnsiString);
begin
  with dm.qrychama_produto, sql do
  begin
    close;
    clear;
    add('select * from fProduto(:Status, :Origem, :Destino, :Tabela, :CampoPesquisa, :TextoPesquisa)');
    Parameters.ParamByName('Status').Value := 'ATIVO';
    Parameters.ParamByName('Origem').Value := UFOrigem;
    Parameters.ParamByName('Destino').Value := UFDestino;
    Parameters.ParamByName('Tabela').Value := Tabela;
    Parameters.ParamByName('CampoPesquisa').Value := CampoPesquisa;
    Parameters.ParamByName('TextoPesquisa').Value := TextoPesquisa;
    open;
  end;
end;

function TProdutoDominio.removerProduto: Boolean;
begin
  try

  except
    on E: Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName + ' - removerProduto - ' +
        E.Message);
      TLog.Error(Self.ClassName + ' - removerProduto - ' + E.Message);
    end;
  end;
end;

function TProdutoDominio.RetornaEstoqueAtual(CodigoProduto: integer): double;
begin
  Result := FProdutoDAO.RetornaEstoqueAtual(CodigoProduto);
end;

end.
