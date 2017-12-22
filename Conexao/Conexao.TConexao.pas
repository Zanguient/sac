unit Conexao.TConexao;

interface

uses
  ADODB, System.Generics.Collections;

  type
    TConexao = class
      private
        class procedure SetUncommitted(Conexao: TADOConnection);
      public
        constructor create(var Conexao: TADOConnection);
        class function NovaConexao(var Conexao: TADOConnection): TADOConnection;
        class procedure ConfirmaConexao(var Conexao: TADOConnection);
        class procedure CancelaConexao(var Conexao: TADOConnection);
        class procedure IniciaQuerys(querys: array of TADOQuery; var Conexao: TADOConnection);
    end;
implementation

uses
  Conexao.TPoll, Conexao.TTransacao, SysUtils, Dialogs;

{ TConexao }

class procedure TConexao.CancelaConexao(var Conexao: TADOConnection);
begin
  TTransacao.desfazerTransacao(Conexao);
  TPool.getInstance.liberarConexao(Conexao);
end;

class procedure TConexao.ConfirmaConexao(var Conexao: TADOConnection);
begin
  TTransacao.confirmarTransacao(Conexao);
  TPool.getInstance.liberarConexao(Conexao);
end;

constructor TConexao.create(var Conexao: TADOConnection);
begin

end;

class procedure TConexao.IniciaQuerys(querys: array of TADOQuery; var Conexao: TADOConnection);
var
  i: Integer;
begin
  for i := 0 to High(querys) do
  begin
    querys[i].Connection:= Conexao;
  end;
end;

class function TConexao.NovaConexao(
  var Conexao: TADOConnection): TADOConnection;
begin
  Conexao:= TADOConnection.Create(nil);
  Conexao:= TPool.getInstance.getConnection;
  TTransacao.Create(Conexao);
  TTransacao.iniciarTransacao(Conexao);
  SetUncommitted(Conexao);
  Result:= Conexao;
end;

class procedure TConexao.SetUncommitted(Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection := Conexao;
      clear;
      add('set transaction isolation level read uncommitted');
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

end.
