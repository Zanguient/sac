unit Modelo.Dominio.TLancamentoCaixaDominio;

interface

uses
  Modelo.DAO.TLancamentoCaixaDAO, ADODB,
  Modelo.Entidade.TLancamentoCaixaEntidade;
  type
    TLancamentoCaixaDominio = class
      private
        FLancamentoCaixa: TLancamentoCaixaDAO;
        Conexao: TADOConnection;
      public
        function Inserir(var LancamentoCaixa: TLancamentoCaixaEntidade): Boolean;
        function Alterar(var LancamentoCaixa: TLancamentoCaixaEntidade): Boolean;
        function Excluir(Codigo: integer): Boolean;
        function AtualizaSaldoCaixa(CodigoUsuario: integer; ValorOperacao: double; TipoOperacao: AnsiString; LancarExcluir: integer): Boolean; overload;
        function AtualizaSaldoCaixa(CodigoUsuario: integer; NovoSaldo: double): Boolean; overload;
        function RetornaNovoSaldo(CodigoUsuario: integer; ValorOperacao: double; TipoOperacao: AnsiString; LancarExcluir: integer): double;
        function RetornaSaldoAtual(CodigoUsuario: integer): double;
        constructor Create(var Conexao: TADOConnection);
        function AtualizaStatusLancamentoCaixa(CodigoLancamento: integer; Status: AnsiString; var Conexao: TADOConnection): Boolean;
    end;
implementation

uses
  Util.TLog;

{ TLancamentoCaixaDominio }

function TLancamentoCaixaDominio.Alterar(
  var LancamentoCaixa: TLancamentoCaixaEntidade): Boolean;
begin
  Result:= FLancamentoCaixa.Alterar(LancamentoCaixa, Conexao);
end;

function TLancamentoCaixaDominio.AtualizaSaldoCaixa(CodigoUsuario: integer;
  ValorOperacao: double; TipoOperacao: AnsiString;
  LancarExcluir: integer): Boolean;
var
  SaldoAtual, NovoSaldo: Double;
begin
  TLog.Info('--- MÉTODO AtualizaSaldoCaixa - DOMINIO ---');

  SaldoAtual:= FLancamentoCaixa.RetornaSaldoAtual(CodigoUsuario, Conexao);

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

  FLancamentoCaixa.AtualizaSaldoAtual(CodigoUsuario, NovoSaldo, Conexao);
  TLog.Info('--- FIM MÉTODO AtualizaSaldoCaixa DOMINIO ---');
end;

function TLancamentoCaixaDominio.AtualizaSaldoCaixa(CodigoUsuario: integer;
  NovoSaldo: double): Boolean;
begin
  TLog.Info('--- MÉTODO AtualizaSaldoCaixa - DOMINIO ---');
  FLancamentoCaixa.AtualizaSaldoAtual(CodigoUsuario, NovoSaldo, Conexao);
  TLog.Info('--- FIM MÉTODO AtualizaSaldoCaixa DOMINIO ---');
end;

function TLancamentoCaixaDominio.AtualizaStatusLancamentoCaixa(
  CodigoLancamento: integer; Status: AnsiString; var Conexao: TADOConnection): Boolean;
begin
  Result:= FLancamentoCaixa.AtualizaStatusLancamentoCaixa(CodigoLancamento, Status, Conexao);
end;

constructor TLancamentoCaixaDominio.Create(var Conexao: TADOConnection);
begin
  FLancamentoCaixa:= TLancamentoCaixaDAO.Create;
  Self.Conexao:= Conexao;
end;

function TLancamentoCaixaDominio.Excluir(Codigo: integer): Boolean;
begin
  Result:= FLancamentoCaixa.Excluir(Codigo, Conexao);
end;

function TLancamentoCaixaDominio.Inserir(
  var LancamentoCaixa: TLancamentoCaixaEntidade): Boolean;
begin
  Result:= FLancamentoCaixa.Inserir(LancamentoCaixa, Conexao);
end;

function TLancamentoCaixaDominio.RetornaNovoSaldo(CodigoUsuario: integer;
  ValorOperacao: double; TipoOperacao: AnsiString;
  LancarExcluir: integer): double;
var
  SaldoAtual, NovoSaldo: Double;
begin
  TLog.Info('--- MÉTODO RetornaNovoSaldo - DOMINIO ---');

  SaldoAtual:= FLancamentoCaixa.RetornaSaldoAtual(CodigoUsuario, Conexao);

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

  Result:= NovoSaldo;
  TLog.Info('--- FIM MÉTODO RetornaNovoSaldo DOMINIO ---');
end;

function TLancamentoCaixaDominio.RetornaSaldoAtual(
  CodigoUsuario: integer): double;
begin
  Result:= FLancamentoCaixa.RetornaSaldoAtual(CodigoUsuario, Conexao);
end;

end.
