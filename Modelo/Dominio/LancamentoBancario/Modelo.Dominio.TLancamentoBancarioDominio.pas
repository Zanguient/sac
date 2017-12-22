unit Modelo.Dominio.TLancamentoBancarioDominio;

interface

uses
  Modelo.Entidade.TLancamentoBancarioEntidade, ADODB,
  Modelo.Entidade.TContaCorrente, Modelo.DAO.TContaCorrente,
  Modelo.Entidade.TOperacaoBancaria, Modelo.DAO.TLancamentoBancario;
  type
    TLancamentoBancarioDominio = class
      private
        FLancamentoBancario: TLancamentoBancarioDAO;
        Conexao: TADOConnection;
      public
        constructor Create(var Conexao: TADOConnection);
        function AtualizaStatusBancario(CodigoLancamento: integer; Status: AnsiString; var Conexao: TADOConnection): Boolean; overload;
        function AtualizaStatusBancario(NDocumento: AnsiString; Status: AnsiString; var Conexao: TADOConnection): Boolean; overload;
        function AtualizaCodigoChequeLancamentoBanco(CodigoLancamento, CodigoCheque: integer; var Conexao: TADOConnection): Boolean;
        function DeletaLancamentoBancario(NDocumento: integer): Boolean;
        function Inserir(var LancamentoBancario: TLancamentoBancarioEntidade): Boolean;
        function Alterar(var LancamentoBancario: TLancamentoBancarioEntidade): Boolean;
        function Excluir(Codigo: integer): Boolean;
        function RetornaStatusLancamento(CodigoLancamento: integer): integer;
    end;
implementation

uses
  Util.TLog, SysUtils;

{ TLancamentoBancarioDominio }

function TLancamentoBancarioDominio.Alterar(
  var LancamentoBancario: TLancamentoBancarioEntidade): Boolean;
begin
  Result:= FLancamentoBancario.Alterar(LancamentoBancario, Conexao);
end;

function TLancamentoBancarioDominio.AtualizaStatusBancario(
  CodigoLancamento: integer; Status: AnsiString;
  var Conexao: TADOConnection): Boolean;
begin
  Result:= FLancamentoBancario.AtualizaStatusBancario(CodigoLancamento, Status, Conexao);
end;

function TLancamentoBancarioDominio.AtualizaCodigoChequeLancamentoBanco(
  CodigoLancamento, CodigoCheque: integer;
  var Conexao: TADOConnection): Boolean;
begin
  Result:= FLancamentoBancario.AtualizaCodigoChequeLancamentoBanco(CodigoLancamento, CodigoCheque, Conexao);
end;

function TLancamentoBancarioDominio.AtualizaStatusBancario(NDocumento,
  Status: AnsiString; var Conexao: TADOConnection): Boolean;
begin
  Result:= FLancamentoBancario.AtualizaStatusBancario(StrToInt(NDocumento), Status, Conexao);
end;

constructor TLancamentoBancarioDominio.Create(var Conexao: TADOConnection);
begin
  FLancamentoBancario:= TLancamentoBancarioDAO.Create;
  Self.Conexao:= Conexao;
end;

function TLancamentoBancarioDominio.DeletaLancamentoBancario(
  NDocumento: integer): Boolean;
begin
  Result:= FLancamentoBancario.DeletaLancamentoBancario(NDocumento, Conexao);
end;

function TLancamentoBancarioDominio.Excluir(Codigo: integer): Boolean;
begin
  Result:= FLancamentoBancario.Excluir(Codigo, Conexao);
end;

function TLancamentoBancarioDominio.Inserir(
  var LancamentoBancario: TLancamentoBancarioEntidade): Boolean;
begin
  Result:= FLancamentoBancario.Inserir(LancamentoBancario, Conexao);
end;

function TLancamentoBancarioDominio.RetornaStatusLancamento(
  CodigoLancamento: integer): integer;
var
  Status: AnsiString;
begin
  Status:= FLancamentoBancario.RetornaStatusLancamento(CodigoLancamento, Conexao);
  if (Status = 'BLOQUEADO') then
    Result:= 0
  ELSE
    Result:= 1;
end;

end.
