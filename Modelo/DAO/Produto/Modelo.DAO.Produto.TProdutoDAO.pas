unit Modelo.DAO.Produto.TProdutoDAO;

interface
uses
  ADODB, Modelo.Entidade.Produto.TProduto;
  type
    TProdutoDAO = class
     private
          Conexao : TADOConnection;
          function salvar(produto : TProdutoEntidade): Boolean;
          function editar(produto : TProdutoEntidade): Boolean;
        public

          constructor Create(var Conexao : TADOConnection);

          destructor Destroy; override;

          function gravar(produto : TProdutoEntidade): Boolean;

          function AtualizaDadosEntrada(FProduto: TProdutoEntidade): Integer;

          function AtualizaNCM(CodigoProduto: integer; NCM: AnsiString): boolean;

          function AtualizaDataValidade(CodigoProduto: integer; DataValidade: TDate): boolean;

          function AtualizaCusto(ValorCompra, CustoCompra: Double; CodigoProduto: integer): boolean;

          function RetornaEstoqueAtual(CodigoProduto: integer): double;

          function AtualizaEstoque(CodigoProduto: integer; NovoEstoque: double): integer;
    end;

implementation

{ TProdutoDAO }

uses
  SysUtils, Util.TLog, Modelo.Entidade.ComandosSQL, Modelo.Dominio.ComandosSQL,
  Util.Mensagens;

function TProdutoDAO.AtualizaCusto(ValorCompra, CustoCompra: Double;
  CodigoProduto: integer): boolean;
var
  FComandoSQL: TComandoSQLEntidade;
  FComandoSQLDominio: TComandoSQLDominio;
begin
  FComandoSQL:= TComandoSQLEntidade.Create;
  FComandoSQL.Conexao:= Conexao;
  FComandoSQL.ComandoSQL:= 'update Produto set Valor_Compra = :Valor_Compra, Valor_Compra_Unitario = :Valor_Compra_Unitario '+
                           'where Codigo = :Codigo';

  FComandoSQL.Parametros.Add('Valor_Compra');
  FComandoSQL.Parametros.Add('Valor_Compra_Unitario');
  FComandoSQL.Parametros.Add('Codigo');
  FComandoSQL.Valores.Add(CustoCompra);
  FComandoSQL.Valores.Add(ValorCompra);
  FComandoSQL.Valores.Add(CodigoProduto);
  FComandoSQLDominio:= TComandoSQLDominio.Create(FComandoSQL);
  FComandoSQLDominio.ExecutaComandoSQLSalvarAlterarExcluir
end;

function TProdutoDAO.AtualizaDadosEntrada(FProduto: TProdutoEntidade): Integer;
var
  FComandoSQL: TComandoSQLEntidade;
  FComandoSQLDominio: TComandoSQLDominio;
begin
  FComandoSQL:= TComandoSQLEntidade.Create;
  FComandoSQL.Conexao:= Conexao;
  FComandoSQL.ComandoSQL:= 'update Produto set MD5 = :MD5, NCM = :NCM, Data_Validade = :Data_Validade, Saldo_Estoque = :Saldo_Estoque, '+
                           'Estoque = :Estoque, Data_Atualizacao_Estoque = :Data_Atualizacao_Estoque, Status_Estoque_Data = :Status_Estoque_Data, '+
                           'Volume_Total = :Volume_Total, Valor_Medio = :Valor_Medio, Valor_Compra = :Valor_Compra, '+
                           'Valor_Compra_Unitario = :Valor_Compra_Unitario, Valor_Ultima_Compra = :Valor_Ultima_Compra,'+
                           'Valor_Ultima_Compra_Unitario = :Valor_Ultima_Compra_Unitario, Ultima_Compra = :Ultima_Compra '+
                           'where Codigo = :Codigo';
  FComandoSQL.Parametros.Add('MD5');
  FComandoSQL.Parametros.Add('NCM');
  FComandoSQL.Parametros.Add('Data_Validade');
  FComandoSQL.Parametros.Add('Saldo_Estoque');
  FComandoSQL.Parametros.Add('Estoque');
  FComandoSQL.Parametros.Add('Data_Atualizacao_Estoque');
  FComandoSQL.Parametros.Add('Status_Estoque_Data');
  FComandoSQL.Parametros.Add('Volume_Total');
  FComandoSQL.Parametros.Add('Valor_Medio');
  FComandoSQL.Parametros.Add('Valor_Compra');
  FComandoSQL.Parametros.Add('Valor_Compra_Unitario');
  FComandoSQL.Parametros.Add('Valor_Ultima_Compra');
  FComandoSQL.Parametros.Add('Valor_Ultima_Compra_Unitario');
  FComandoSQL.Parametros.Add('Ultima_Compra');
  FComandoSQL.Parametros.Add('Codigo');

  FComandoSQL.Valores.Add(FProduto.MD5);
  FComandoSQL.Valores.Add(FProduto.NCM);
  FComandoSQL.Valores.Add(FProduto.DataValidade);
  FComandoSQL.Valores.Add(FProduto.SaldoEstoque);
  FComandoSQL.Valores.Add(FProduto.Estoque);
  FComandoSQL.Valores.Add(FProduto.DataAtualizacaoEstoque);
  FComandoSQL.Valores.Add(FProduto.StatusEstoque);
  FComandoSQL.Valores.Add(FProduto.VolumeTotal);
  FComandoSQL.Valores.Add(FProduto.ValorMedio);
  FComandoSQL.Valores.Add(FProduto.ValorCompra);
  FComandoSQL.Valores.Add(FProduto.ValorCompraUnitario);
  FComandoSQL.Valores.Add(FProduto.ValorUltimaCompra);
  FComandoSQL.Valores.Add(FProduto.ValorUltimaCompraUnitario);
  FComandoSQL.Valores.Add(FProduto.Ultima_Compra);
  FComandoSQL.Valores.Add(FProduto.Codigo);
  FComandoSQLDominio:= TComandoSQLDominio.Create(FComandoSQL);
  FComandoSQLDominio.ExecutaComandoSQLSalvarAlterarExcluir
end;

function TProdutoDAO.AtualizaDataValidade(CodigoProduto: integer;
  DataValidade: TDate): boolean;
var
  FComandoSQL: TComandoSQLEntidade;
  FComandoSQLDominio: TComandoSQLDominio;
begin
  FComandoSQL:= TComandoSQLEntidade.Create;
  FComandoSQL.Conexao:= Conexao;
  FComandoSQL.ComandoSQL:= 'update Produto set Data_Validade = :Data_Validade '+
                           'where Codigo = :Codigo';

  FComandoSQL.Parametros.Add('Data_Validade');
  FComandoSQL.Parametros.Add('Codigo');
  FComandoSQL.Valores.Add(DataValidade);
  FComandoSQL.Valores.Add(CodigoProduto);
  FComandoSQLDominio:= TComandoSQLDominio.Create(FComandoSQL);
  FComandoSQLDominio.ExecutaComandoSQLSalvarAlterarExcluir
end;

function TProdutoDAO.AtualizaEstoque(CodigoProduto: integer;
  NovoEstoque: double): integer;
var
  FComandoSQL: TComandoSQLEntidade;
  FComandoSQLDominio: TComandoSQLDominio;
begin
  FComandoSQL:= TComandoSQLEntidade.Create;
  FComandoSQL.Conexao:= Conexao;
  FComandoSQL.ComandoSQL:= 'update Produto set Estoque = :Estoque '+
                           'where Codigo = :Codigo';

  FComandoSQL.Parametros.Add('Estoque');
  FComandoSQL.Parametros.Add('Codigo');
  FComandoSQL.Valores.Add(NovoEstoque);
  FComandoSQL.Valores.Add(CodigoProduto);
  FComandoSQLDominio:= TComandoSQLDominio.Create(FComandoSQL);
  Result:= FComandoSQLDominio.ExecutaComandoSQLSalvarAlterarExcluir
end;

function TProdutoDAO.AtualizaNCM(CodigoProduto: integer;
  NCM: AnsiString): boolean;
var
  FComandoSQL: TComandoSQLEntidade;
  FComandoSQLDominio: TComandoSQLDominio;
begin
  FComandoSQL:= TComandoSQLEntidade.Create;
  FComandoSQL.Conexao:= Conexao;
  FComandoSQL.ComandoSQL:= 'update Produto set NCM = :NCM '+
                           'where Codigo = :Codigo';

  FComandoSQL.Parametros.Add('NCM');
  FComandoSQL.Parametros.Add('Codigo');
  FComandoSQL.Valores.Add(NCM);
  FComandoSQL.Valores.Add(CodigoProduto);
  FComandoSQLDominio:= TComandoSQLDominio.Create(FComandoSQL);
  FComandoSQLDominio.ExecutaComandoSQLSalvarAlterarExcluir
end;

constructor TProdutoDAO.Create(var Conexao : TADOConnection);
begin
  Self.Conexao:= Conexao;
end;

destructor TProdutoDAO.Destroy;
begin

  inherited;
end;

function TProdutoDAO.editar(produto: TProdutoEntidade): Boolean;
begin
  try

  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - editar - '+E.Message);
      TLog.Error(Self.ClassName+' - editar - '+E.Message);
    end;

  end;
end;

function TProdutoDAO.gravar(produto: TProdutoEntidade): Boolean;
begin
  try

  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - editar - '+E.Message);
      TLog.Error(Self.ClassName+' - editar - '+E.Message);
    end;

  end;
end;

function TProdutoDAO.RetornaEstoqueAtual(CodigoProduto: integer): double;
var
  SQL : string;
  FQuery: TADOQuery;
begin
  try
    FQuery:= TADOQuery.Create(nil);
    TLog.Info('--- MÉTODO RetornaEstoqueAtual - DAO ---');
    TLog.Debug('Código do Produto: '+IntToStr(CodigoProduto));
    SQL := 'select Estoque from Produto where Codigo = :Codigo';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('Codigo').Value := CodigoProduto;
    FQuery.Open;
    Result := FQuery.FieldByName('Estoque').AsFloat;
    TLog.Info('--- FIM DO MÉTODO RetornaEstoqueAtual - DAO ---');
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - RetornaEstoqueAtual - '+E.Message);
      TLog.Error(Self.ClassName+' - RetornaEstoqueAtual - '+E.Message);
    end;
  end;
end;

function TProdutoDAO.salvar(produto: TProdutoEntidade): Boolean;
begin
  try

  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - editar - '+E.Message);
      TLog.Error(Self.ClassName+' - editar - '+E.Message);
    end;

  end;
end;

end.
