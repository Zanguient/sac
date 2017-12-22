unit Modelo.Dominio.TContaCorrenteDominio;

interface

uses
  ADODB, Modelo.DAO.TContaCorrente, Modelo.Entidade.TContaCorrente,
  Modelo.Entidade.TLancamentoBancarioEntidade,
  Modelo.Entidade.TOperacaoBancaria;
  type
    TContaCorrenteDominio = class
      private
        FContaCorrenteDAO: TContaCorrenteDAO;
        Conexao: TADOConnection;
      public
        function AtualizaSaldoBancario(var ContaCorrente: TContaCorrenteEntidade; var LancamentoBancario: TLancamentoBancarioEntidade; OperacaoBancaria: TOperacaoBancariaEntidade; LancarExcluir: integer; BloqueadoLiberado: integer): Boolean; overload;
        function AtualizaSaldoBancario(CodigoConta: integer; ValorOperacao: double; TipoOperacao: AnsiString; LancarExcluir: integer; BloqueadoLiberado: integer): Boolean; overload;
        function RetornaNovoSaldo(CodigoConta: integer; ValorOperacao: double; TipoOperacao: AnsiString; LancarExcluir: integer; BloqueadoLiberado: integer): double;
        function RetornaSaldoAtual(CodigoConta: integer): double;
        constructor Create(var Conexao: TADOConnection);
    end;
implementation

uses
  Util.TLog;

{ TContaCorrenteDominio }

function TContaCorrenteDominio.AtualizaSaldoBancario(
  var ContaCorrente: TContaCorrenteEntidade;
  var LancamentoBancario: TLancamentoBancarioEntidade;
  OperacaoBancaria: TOperacaoBancariaEntidade; LancarExcluir: integer; BloqueadoLiberado: integer): Boolean;
var
  SaldoAtual, ValorOperacao, NovoSaldo: Double;
  Operacao: AnsiString;
begin
  TLog.Info('--- MÉTODO AtualizaSaldoBancario DOMINIO ---');

  SaldoAtual:= FContaCorrenteDAO.RetornaSaldoAtual(ContaCorrente.Codigo, Conexao);
  ValorOperacao:= LancamentoBancario.Valor;
  Operacao:= OperacaoBancaria.Tipo;

  if (BloqueadoLiberado = 1) then
  begin
    if (LancarExcluir = 0) then
    begin
      if (Operacao = 'DÉBITO') then
      begin
        NovoSaldo:= SaldoAtual - ValorOperacao;
      end
      else
      begin
        NovoSaldo:= SaldoAtual + ValorOperacao;
      end;
    end
    else
    begin
      if (Operacao = 'DÉBITO') then
      begin
        NovoSaldo:= SaldoAtual + ValorOperacao;
      end
      else
      begin
        NovoSaldo:= SaldoAtual - ValorOperacao;
      end;
    end;
  end
  else
  begin
    NovoSaldo:= SaldoAtual;
  end;
  ContaCorrente.NovoSaldo:= NovoSaldo;
  FContaCorrenteDAO.AtualizaSaldoAtual(ContaCorrente, Conexao);
  TLog.Info('--- FIM MÉTODO AtualizaSaldoBancario DOMINIO ---');
end;

function TContaCorrenteDominio.AtualizaSaldoBancario(CodigoConta: integer;
  ValorOperacao: double; TipoOperacao: AnsiString;
  LancarExcluir: integer; BloqueadoLiberado: integer): Boolean;
var
  SaldoAtual, NovoSaldo: Double;
begin
  TLog.Info('--- MÉTODO AtualizaSaldoBancario DOMINIO ---');

  SaldoAtual:= FContaCorrenteDAO.RetornaSaldoAtual(CodigoConta, Conexao);

  if (BloqueadoLiberado = 1) then
  begin
    if (LancarExcluir = 0) then
    begin
      if (TipoOperacao = 'DÉBITO') then
      begin
        NovoSaldo:= SaldoAtual - ValorOperacao;
      end
      else
      begin
        NovoSaldo:= SaldoAtual + ValorOperacao;
      end;
    end
    else
    begin
      if (TipoOperacao = 'DÉBITO') then
      begin
        NovoSaldo:= SaldoAtual + ValorOperacao;
      end
      else
      begin
        NovoSaldo:= SaldoAtual - ValorOperacao;
      end;
    end;
  end
  else
  begin
    NovoSaldo:= SaldoAtual;
  end;
  FContaCorrenteDAO.AtualizaSaldoAtual(CodigoConta, NovoSaldo, Conexao);
  TLog.Info('--- FIM MÉTODO AtualizaSaldoBancario DOMINIO ---');
end;

constructor TContaCorrenteDominio.Create(var Conexao: TADOConnection);
begin
  FContaCorrenteDAO:= TContaCorrenteDAO.Create;
  Self.Conexao:= Conexao;
end;

function TContaCorrenteDominio.RetornaNovoSaldo(CodigoConta: integer;
  ValorOperacao: double; TipoOperacao: AnsiString; LancarExcluir,
  BloqueadoLiberado: integer): double;
var
  SaldoAtual, NovoSaldo: Double;
begin
  TLog.Info('--- MÉTODO RetornaNovoSaldo - DOMINIO ---');

  SaldoAtual:= FContaCorrenteDAO.RetornaSaldoAtual(CodigoConta, Conexao);

  if (BloqueadoLiberado = 1) then
  begin
    if (LancarExcluir = 0) then
    begin
      if (TipoOperacao = 'DÉBITO') then
      begin
        NovoSaldo:= SaldoAtual - ValorOperacao;
      end
      else
      begin
        NovoSaldo:= SaldoAtual + ValorOperacao;
      end;
    end
    else
    begin
      if (TipoOperacao = 'DÉBITO') then
      begin
        NovoSaldo:= SaldoAtual + ValorOperacao;
      end
      else
      begin
        NovoSaldo:= SaldoAtual - ValorOperacao;
      end;
    end;
  end
  else
  begin
    NovoSaldo:= SaldoAtual;
  end;

  Result:= NovoSaldo;
  TLog.Info('--- FIM MÉTODO RetornaNovoSaldo DOMINIO ---');
end;

function TContaCorrenteDominio.RetornaSaldoAtual(CodigoConta: integer): double;
begin
  Result:= FContaCorrenteDAO.RetornaSaldoAtual(CodigoConta, Conexao);
end;

end.
