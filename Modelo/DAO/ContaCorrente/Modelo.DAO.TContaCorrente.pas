unit Modelo.DAO.TContaCorrente;

interface

uses
  ADODB, Modelo.Entidade.TContaCorrente,
  Modelo.Entidade.TLancamentoBancarioEntidade;
  type
    TContaCorrenteDAO = class
      private

      public
        function RetornaSaldoAtual(CodigoConta: integer; var Conexao: TADOConnection): double;
        function AtualizaSaldoAtual(ContaCorrenteEntidade: TContaCorrenteEntidade; var Conexao: TADOConnection): Boolean; overload;
        function AtualizaSaldoAtual(CodigoConta: integer; NovoSaldo: double; var Conexao: TADOConnection): Boolean; overload;
    end;
implementation

uses
  Util.TLog, SysUtils, Util.Mensagens;

{ TContaCorrenteDAO }

function TContaCorrenteDAO.AtualizaSaldoAtual(
  ContaCorrenteEntidade: TContaCorrenteEntidade;
  var Conexao: TADOConnection): Boolean;
var
  SQL : string;
  FQuery: TADOQuery;
begin
  try
    FQuery:= TADOQuery.Create(nil);
    TLog.Info('--- MÉTODO AtualizaSaldoAtual - DAO ---');
    SQL := 'update Conta_Corrente set Saldo_Atual = :Saldo where Codigo = :Codigo';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('Codigo').Value := ContaCorrenteEntidade.Codigo;
    FQuery.Parameters.ParamByName('Saldo').Value := ContaCorrenteEntidade.NovoSaldo;
    FQuery.ExecSQL;
    Result := true;
    TLog.Info('--- FIM DO MÉTODO AtualizaSaldoAtual - DAO ---');
  except
    on E : Exception do
    begin
      Result:= false;
      TMensagens.MensagemErro(Self.ClassName+' - AtualizaSaldoAtual - '+E.Message);
      TLog.Error(Self.ClassName+' - AtualizaSaldoAtual - '+E.Message);
    end;
  end;
end;

function TContaCorrenteDAO.AtualizaSaldoAtual(CodigoConta: integer;
  NovoSaldo: double; var Conexao: TADOConnection): Boolean;
var
  SQL : string;
  FQuery: TADOQuery;
begin
  try
    FQuery:= TADOQuery.Create(nil);
    TLog.Info('--- MÉTODO AtualizaSaldoAtual - DAO ---');
    SQL := 'update Conta_Corrente set Saldo_Atual = :Saldo where Codigo = :Codigo';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('Codigo').Value := CodigoConta;
    FQuery.Parameters.ParamByName('Saldo').Value := NovoSaldo;
    FQuery.ExecSQL;
    Result := true;
    TLog.Info('--- FIM DO MÉTODO AtualizaSaldoAtual - DAO ---');
  except
    on E : Exception do
    begin
      Result:= false;
      TMensagens.MensagemErro(Self.ClassName+' - AtualizaSaldoAtual - '+E.Message);
      TLog.Error(Self.ClassName+' - AtualizaSaldoAtual - '+E.Message);
    end;
  end;
end;

function TContaCorrenteDAO.RetornaSaldoAtual(CodigoConta: integer; var Conexao: TADOConnection): double;
var
  SQL : string;
  FQuery: TADOQuery;
begin
  try
    FQuery:= TADOQuery.Create(nil);
    TLog.Info('--- MÉTODO RetornaSaldoAtual - DAO ---');
    TLog.Debug('Código da Conta: '+IntToStr(CodigoConta));
    SQL := 'select CC.Saldo_Atual from Conta_Corrente CC where Codigo = :Codigo';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('Codigo').Value := CodigoConta;
    FQuery.Open;
    Result := FQuery.FieldByName('Saldo_Atual').AsFloat;
    TLog.Info('--- FIM DO MÉTODO RetornaSaldoAtual - DAO ---');
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - RetornaSaldoAtual - '+E.Message);
      TLog.Error(Self.ClassName+' - RetornaSaldoAtual - '+E.Message);
    end;
  end;
end;

end.
