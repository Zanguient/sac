unit Modelo.DAO.EntradaProdutos.TBuscaEntradaProdutosDAO;

interface
 uses
  ADODB;
  type
    TBuscaEntradaProdutosDAO = class
      private
        FQuery : TADOQuery;

        Conexao: TADOConnection;

        function configurarParametrosBuscaPor(parametro :string; buscarPor : Integer):string;

        function configurarParametrosOrdenarPor(ordernarPor : Integer): string;

        function getSQLBuscarEntradaProdutos : string;

      public
        constructor Create(query : TADOQuery; var Conexao: TADOConnection);

        destructor Destroy;override;

        function buscar(condicao: String; buscarPor, ordernarPor : Integer):TADOQuery; overload;

        function buscar(condicao, codFornecedor: String; buscarPor, ordernarPor : Integer):TADOQuery; overload;

        function buscarPorCodigo(codigo : Integer): TADOQuery;

    end;

implementation

{ TEntradaProdutosDAO }
uses
 Util.TLog, SysUtils, Util.Mensagens;


constructor TBuscaEntradaProdutosDAO.Create(query: TADOQuery; var Conexao: TADOConnection);
begin
  FQuery := query;
  Self.Conexao:= Conexao;
  FQuery.Connection:= Conexao;
end;

destructor TBuscaEntradaProdutosDAO.Destroy;
begin

  inherited;
end;

function TBuscaEntradaProdutosDAO.buscar(condicao: String; buscarPor, ordernarPor : Integer): TADOQuery;
var
  SQL : string;
begin
  try
    SQL := getSQLBuscarEntradaProdutos+configurarParametrosBuscaPor(condicao, buscarPor) + configurarParametrosOrdenarPor(ordernarPor);
    FQuery.Close;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Open;
    Result := FQuery;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - buscar - '+E.message);
      TLog.Error(Self.ClassName+' - buscar - '+E.message);
    end;
  end;
end;

function TBuscaEntradaProdutosDAO.buscar(condicao, codFornecedor: String;
  buscarPor, ordernarPor: Integer): TADOQuery;
var
  SQL : string;
  fornecedor : string;
begin
  try
    if Length(Trim(codFornecedor)) = 11 then
      fornecedor := ' AND f.CPF = '+QuotedStr(codFornecedor)
    else
      fornecedor := ' AND f.CNPJ = '+QuotedStr(codFornecedor);
    SQL := ' SELECT'+
            ' ep.Codigo, '+
            ' ep.N_Nota_Fiscal,'+
            ' Modelo,'+
            ' Serie,'+
            ' Data_Emissao,'+
            ' Data_Entrada,'+
            ' ie.Total_Nota,'+
            ' Nome_Fantasia,'+
            ' Razao_Social'+
          ' FROM Entrada_Produtos as ep'+
          ' JOIN Impostos_Entrada as ie on ie.Codigo = ep.Codigo'+
          ' JOIN Fornecedor f on f.Codigo = ep.Codigo_Fornecedor '
          +configurarParametrosBuscaPor(condicao, buscarPor)+fornecedor+ configurarParametrosOrdenarPor(ordernarPor);
    FQuery.Close;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Open;
    Result := FQuery;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - buscar - '+E.message);
      TLog.Error(Self.ClassName+' - buscar - '+E.message);
    end;
  end;
end;

function TBuscaEntradaProdutosDAO.buscarPorCodigo(codigo : Integer): TADOQuery;
var
  SQL : string;
begin
  try
    SQL := getSQLBuscarEntradaProdutos+ ' WHERE ep.Codigo = '+IntToStr(codigo);
    FQuery.Close;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Open;
    Result := FQuery;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - buscar - '+E.message);
      TLog.Error(Self.ClassName+' - buscar - '+E.message);
    end;
  end;
end;

function TBuscaEntradaProdutosDAO.configurarParametrosBuscaPor(parametro: string; buscarPor:Integer): string;
begin
  try
    Result := '';
    if (Trim(parametro) <> '') then begin
      if buscarPor = 0 then begin
        Result := ' WHERE ep.N_Nota_Fiscal = ''' + Trim(parametro) +'''';
      end else if buscarPor = 1 then begin
        Result := ' WHERE Data_Emissao = ''' + parametro + '''';
      end else if buscarPor = 2 then begin
        Result := ' WHERE Data_Entrada = ''' + parametro +'''';
      end else if buscarPor = 3 then begin
        Result := ' WHERE  Razao_Social like ''' + parametro +'%''';
      end
    end;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - configurarParametrosBuscaPor - '+E.Message);
      TLog.Error(Self.ClassName+' - configurarParametrosBuscaPor - '+E.Message)
    end;
  end;
end;

function TBuscaEntradaProdutosDAO.configurarParametrosOrdenarPor(ordernarPor : Integer): string;
begin
  try
    if ordernarPor = 0 then begin
      Result := ' ORDER BY ep.N_Nota_Fiscal';
    end else if ordernarPor = 1 then begin
      Result := ' ORDER BY Data_Emissao';
    end else if ordernarPor = 2 then begin
      Result := ' ORDER BY Data_Entrada';
    end else if ordernarPor = 3 then begin
      Result := ' ORDER BY Razao_Social';
    end
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - configurarParametrosOrdenarPor - '+E.Message);
      TLog.Error(Self.ClassName+' - configurarParametrosOrdenarPor - '+E.Message)
    end;
  end;
end;

function TBuscaEntradaProdutosDAO.getSQLBuscarEntradaProdutos: string;
begin
  Result := ' SELECT'+
            ' ep.Codigo, '+
            ' ep.N_Nota_Fiscal,'+
            ' Modelo,'+
            ' Serie,'+
            ' Data_Emissao,'+
            ' Data_Entrada,'+
            ' ie.Total_Nota,'+
            ' Nome_Fantasia,'+
            ' Razao_Social,'+
            ' Caixa_ECF,'+
            ' Chave_NFe_Entrada'+
          ' FROM Entrada_Produtos as ep'+
          ' JOIN Impostos_Entrada as ie on ie.Codigo = ep.Codigo'+
          ' JOIN Fornecedor f on f.Codigo = ep.Codigo_Fornecedor ';
end;

end.
