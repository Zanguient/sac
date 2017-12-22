unit Conexao.TPoll;

interface
uses
 DBXCommon, SqlExpr, System.Generics.Collections, ADODB;
  type
    TPool = class
      private
        class var FConexaoLivres      : TQueue<TADOConnection>;
        class var FConexaoUtilizadas  : TDictionary<String, TADOConnection>;
        class var FSeqConexao         : Integer;
        FNumMaxConexoes               : Integer;

        function criarConexao : TADOConnection;


      public
        constructor create;
        destructor Destroy;override;
        class function getInstance : TPool;
        function getConnection : TADOConnection;
        procedure liberarConexao(var conn : TADOConnection);
    end;
var
  FInstance : TPool;

implementation

uses
  Vcl.Dialogs, System.SysUtils, Conexao.TDadosConexao,
  Controle.DadosConexaoControle, Conexao.TTransacao;

{ TRepositorioBase }

constructor TPool.create;
begin
  try
    { TODO -oEdnaldo -c : Fazer leitura do arquivo ini para pegar os parametros das conexoes 03/11/2014 18:12:51 }
    FConexaoLivres     := TQueue<TADOConnection>.Create;
    FConexaoUtilizadas := TDictionary<String, TADOConnection>.Create;
    FNumMaxConexoes := 30;
    FSeqConexao := 0;
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

destructor TPool.Destroy;
begin
  FreeAndNil(FConexaoLivres);
  FreeAndNil(FConexaoUtilizadas);
  inherited;
end;


function TPool.criarConexao: TADOConnection;
var
  Conexao : TADOConnection;
  FDadosConexao: TDadosConexao;
  FDadosConexaoControle: TDadosConexaoControle;
begin
  FDadosConexaoControle:= TDadosConexaoControle.Create;
  FDadosConexao := FDadosConexaoControle.retornaDadosConexao;

  Conexao := TADOConnection.Create(nil);
  with Conexao do
  begin
    Inc(FSeqConexao);
    Name := 'conn'+IntToStr(FSeqConexao);
    Conexao.ConnectionString := PWideChar(
    'Provider=SQLOLEDB.1;Password=@dminf@v01032011;Persist Security Info=True;User ID=' +
      FDadosConexao.Usuario + ';Initial Catalog=' + FDadosConexao.Banco + ';Data Source=' + FDadosConexao.Servidor + '');
     LoginPrompt:= false;
    try
      Open;
    except
      on e: Exception do begin
        raise Exception.Create('Não foi possível conectar-se com o Banco de Dados. ' + #13 + e.Message);
      end;
    end;
  end;
  Result := Conexao;
end;

function TPool.getConnection: TADOConnection;
var
  conn : TADOConnection;
begin
  try
    conn := nil;
    if FConexaoUtilizadas.Count < FNumMaxConexoes then
    begin
      if FConexaoLivres.Count > 0 then
      begin
        conn := FConexaoLivres.Dequeue;
        FConexaoUtilizadas.Add(conn.Name, conn);
      end;
      if conn = nil then
      begin
        conn := criarConexao;
        FConexaoUtilizadas.Add(conn.Name, conn);
      end
      else if not conn.Connected then
      begin
        conn.Connected := True;
      end;
    end;
    Result := conn;
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

class function TPool.getInstance: TPool;
begin
  if not Assigned(FInstance) then
    FInstance := TPool.create;
  Result := FInstance;
end;

procedure TPool.liberarConexao(var conn: TADOConnection);
var
  conexao : TADOConnection;
begin
  try
    conexao := FConexaoUtilizadas.Items[conn.Name];
    FConexaoUtilizadas.ExtractPair(conn.Name);
    FConexaoLivres.Enqueue(conn);
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

 initialization

 finalization
 if Assigned(FInstance) then
  FreeAndNil(FInstance);

end.
