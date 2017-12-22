unit Modelo.DAO.NFE.TReferenciaDevolucaoDAO;

interface
uses
  ADODB;
  type
    TReferenciaDevolucaoDAO = class
      private
        FQuery : TADOQuery;
        Conexao: TADOConnection;
      public
        constructor Create(query : TADOQuery; var Conexao: TADOConnection);

        destructor Destroy;override;

        function carregarRefernciaDevolucao(CodPedido : Integer; var Query : TADOQuery): Boolean;

        function gerarCodigoNFDevolucaoReferencia: Integer;

        function getSQLInserirReferencia: string;

        function removerRefernciaDevolucao(Codigo : Integer): Boolean;

        function removerTodasRefernciaDevolucao(CodigoPedigo : Integer): Boolean;

        function salvarRefernciaDevolucao(Codigo, Codigo_Pedido, Codigo_Entrada_Produtos, Caixa_ecf : Integer;
                        Numero, Modelo, Serie : string; Valor:Double;  Data_Emissao : TDate; Chave_NFe_Entrada : string): Boolean;

    end;

implementation

{ TReferenciaDevolucaoDAO }

uses
  SysUtils, Util.TLog, Util.Mensagens;

constructor TReferenciaDevolucaoDAO.Create(query: TADOQuery; var Conexao: TADOConnection);
begin
  FQuery := query;
  Self.Conexao:= Conexao;
end;

destructor TReferenciaDevolucaoDAO.Destroy;
begin

  inherited;
end;

function TReferenciaDevolucaoDAO.gerarCodigoNFDevolucaoReferencia: Integer;
var
  SQL : string;
begin
  try
    Result := 0;
    SQL := 'SELECT MAX(Codigo) as codigo FROM NF_Devolucao_Referencia;';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Open;
    Result := FQuery.FieldByName('Codigo').AsInteger + 1;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.className+' - gerarCodigoNFDevolucaoReferencia - '+E.Message);
      TLog.Error(Self.className+' - gerarCodigoNFDevolucaoReferencia - '+E.Message);
    end;
  end;
end;

function TReferenciaDevolucaoDAO.carregarRefernciaDevolucao(CodPedido : Integer; var Query : TADOQuery): Boolean;
var
  SQL : string;
begin
  try
    SQL := 'SELECT * FROM NF_Devolucao_Referencia WHERE Codigo_Pedido = ' + QuotedStr(IntToStr(CodPedido));
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add(SQL);
    Query.Open;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.className+' - carregarRefernciaDevolucao - '+E.Message);
      TLog.Error(Self.className+' - carregarRefernciaDevolucao - '+E.Message);
    end;
  end;
end;

function TReferenciaDevolucaoDAO.removerTodasRefernciaDevolucao(CodigoPedigo : Integer): Boolean;
var
  SQL : string;
begin
  try
    Result := False;
    SQL := ' DELETE FROM NF_Devolucao_Referencia WHERE Codigo_Pedido = :Codigo_Pedido;';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('Codigo_Pedido').Value := CodigoPedigo;
    Result := (FQuery.ExecSQL > 0);
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.className+' - removerRefernciaDevolucao - '+E.Message);
      TLog.Error(Self.className+' - removerRefernciaDevolucao - '+E.Message);
    end;
  end;
end;

function TReferenciaDevolucaoDAO.removerRefernciaDevolucao(Codigo : Integer): Boolean;
var
  SQL : string;
begin
  try
    Result := False;
    SQL := ' DELETE FROM NF_Devolucao_Referencia WHERE Codigo = :Codigo;';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('Codigo').Value := Codigo;
    Result := (FQuery.ExecSQL > 0);
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.className+' - removerRefernciaDevolucao - '+E.Message);
      TLog.Error(Self.className+' - removerRefernciaDevolucao - '+E.Message);
    end;
  end;
end;

function TReferenciaDevolucaoDAO.salvarRefernciaDevolucao(Codigo, Codigo_Pedido, Codigo_Entrada_Produtos, Caixa_ecf : Integer;
                        Numero, Modelo, Serie : string; Valor:Double; Data_Emissao : TDate; Chave_NFe_Entrada : string): Boolean;
var
  SQL : string;
begin
  try
    Result := False;
    SQL := getSQLInserirReferencia;
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('Codigo').Value                   := Codigo;
    FQuery.Parameters.ParamByName('Codigo_Pedido').Value            := Codigo_Pedido;
    FQuery.Parameters.ParamByName('Codigo_Entrada_Produto').Value   := Codigo_Entrada_Produtos;
    FQuery.Parameters.ParamByName('Chave').Value                    := Chave_NFe_Entrada;
    FQuery.Parameters.ParamByName('Caixa_ecf').Value                := Caixa_ecf;
    FQuery.Parameters.ParamByName('Numero').Value                   := Numero;
    FQuery.Parameters.ParamByName('Modelo').Value                   := Modelo;
    FQuery.Parameters.ParamByName('Serie').Value                    := Serie;
    FQuery.Parameters.ParamByName('Valor').Value                    := Valor;
    FQuery.Parameters.ParamByName('Data_Emissao').Value             := Data_Emissao;
    Result := (FQuery.ExecSQL > 0);
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.className+' - salvarRefernciaDevolucao - '+E.Message);
      TLog.Error(Self.className+' - salvarRefernciaDevolucao - '+E.Message);
    end;
  end;
end;

function TReferenciaDevolucaoDAO.getSQLInserirReferencia: string;
begin
  Result := ' INSERT INTO NF_Devolucao_Referencia('+
           ' Codigo, Codigo_Pedido, Codigo_Entrada_Produto,'+
           ' Numero, Chave, Caixa_ecf, Modelo, Serie, Valor, Data_Emissao)'+
           ' VALUES ('+
           ' :Codigo, :Codigo_Pedido, :Codigo_Entrada_Produto,'+
           ' :Numero, :Chave, :Caixa_ecf, :Modelo, :Serie, :Valor, :Data_Emissao);';
end;



end.
