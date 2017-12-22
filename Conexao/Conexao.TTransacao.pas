unit Conexao.TTransacao;

interface
 uses
  SqlExpr, DBXCommon, ADODB;
  type
    TTransacao = class
      private
        var FConexao : TADOConnection;
      public
        constructor Create(var conn : TADOConnection);

        class procedure confirmarTransacao(var conn: TADOConnection);

        class procedure desfazerTransacao(var conn: TADOConnection);

        class procedure iniciarTransacao(var conn: TADOConnection);

    end;

implementation

uses
  System.SysUtils, Dialogs;

{ TTransacao }

constructor TTransacao.Create(var conn: TADOConnection);
begin
  FConexao := conn;
  //ShowMessage(conn.Name);
end;

class procedure TTransacao.confirmarTransacao(var conn: TADOConnection);
begin
  try
    //ShowMessage(conn.Name);
    if conn.InTransaction then
    begin
      conn.CommitTrans;
      //FConexao.Close;
      //FConexao:= nil;
    end;
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

class procedure TTransacao.desfazerTransacao(var conn: TADOConnection);
begin
  try
    if conn.InTransaction then begin
      conn.RollbackTrans;
    end;
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

class procedure TTransacao.iniciarTransacao(var conn: TADOConnection);
begin
  try
    //ShowMessage(conn.Name);
    if not conn.InTransaction then begin
      conn.BeginTrans;
    end;
  except
    on E : Exception do
      raise Exception.Create(E.Message);
  end;
end;

end.
