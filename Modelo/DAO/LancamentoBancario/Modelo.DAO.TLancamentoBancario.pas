unit Modelo.DAO.TLancamentoBancario;

interface

uses
  Modelo.Entidade.TLancamentoBancarioEntidade, ADODB;
  type
    TLancamentoBancarioDAO = class
      private

      public
        function AtualizaStatusBancario(CodigoLancamento: integer; Status: AnsiString; var Conexao: TADOConnection): Boolean; overload;
        function AtualizaStatusBancario(NDocumento: AnsiString; Status: AnsiString; var Conexao: TADOConnection): Boolean; overload;
        function AtualizaCodigoChequeLancamentoBanco(CodigoLancamento, CodigoCheque: integer; var Conexao: TADOConnection): Boolean;
        function DeletaLancamentoBancario(NDocumento: integer; var Conexao: TADOConnection): Boolean;
        function Inserir(var LancamentoBancario: TLancamentoBancarioEntidade; var Conexao: TADOConnection): Boolean;
        function Alterar(var LancamentoBancario: TLancamentoBancarioEntidade; var Conexao: TADOConnection): Boolean;
        function Excluir(Codigo: integer; var Conexao: TADOConnection): Boolean;
        function RetornaStatusLancamento(CodigoLancamento: integer; var Conexao: TADOConnection): AnsiString;
    end;
implementation

uses
  Util.TLog, Util.Mensagens, SysUtils;

{ TLancamentoBancarioDAO }

function TLancamentoBancarioDAO.Alterar(
  var LancamentoBancario: TLancamentoBancarioEntidade;
  var Conexao: TADOConnection): Boolean;
var
  SQL : string;
  FQuery: TADOQuery;
begin
  try
    FQuery:= TADOQuery.Create(nil);
    TLog.Info('--- MÉTODO AlterarLancamentoBancario - DAO ---');

    SQL := 'Update Lancamento_Banco set Codigo_Empresa = :Codigo_Empresa, N_Documento = :N_Documento, Data_Lancamento = :Data_Lancamento, '+
          'Codigo_Conta = :Codigo_Conta, Codigo_Operacao = :Codigo_Operacao, Codigo_Plano = :Codigo_Plano, '+
          'Descricao = :Descricao, Valor = :Valor, Status = :Status, Saldo_Anterior = :Saldo_Anterior, '+
          'Saldo_Atual = :Saldo_Atual, Codigo_Cheque = :Codigo_Cheque, Transferencia = :Transferencia '+
          'where Codigo = :Codigo';

    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('Codigo_Empresa').Value := LancamentoBancario.Codigo_Empresa;
    FQuery.Parameters.ParamByName('N_Documento').Value := LancamentoBancario.N_Documento;
    FQuery.Parameters.ParamByName('Data_Lancamento').Value := LancamentoBancario.Data_Lancamento;
    FQuery.Parameters.ParamByName('Codigo_Conta').Value := LancamentoBancario.Codigo_Conta;
    FQuery.Parameters.ParamByName('Codigo_Operacao').Value := LancamentoBancario.Codigo_Operacao;
    FQuery.Parameters.ParamByName('Codigo_Plano').Value := LancamentoBancario.Codigo_Plano;
    FQuery.Parameters.ParamByName('Descricao').Value := LancamentoBancario.Descricao;
    FQuery.Parameters.ParamByName('Valor').Value := LancamentoBancario.Valor;
    FQuery.Parameters.ParamByName('Status').Value := LancamentoBancario.Status;
    FQuery.Parameters.ParamByName('Saldo_Anterior').Value := LancamentoBancario.SaldoAnterior;
    FQuery.Parameters.ParamByName('Saldo_Atual').Value := LancamentoBancario.SaldoAtual;
    FQuery.Parameters.ParamByName('Codigo_Cheque').Value := LancamentoBancario.CodigoCheque;
    FQuery.Parameters.ParamByName('Transferencia').Value := LancamentoBancario.Transferencia;
    FQuery.Parameters.ParamByName('Codigo').Value := LancamentoBancario.Codigo;
    FQuery.ExecSQL;
    Result := true;
    TLog.Info('--- FIM DO MÉTODO AlterarLancamentoBancario - DAO ---');
  except
    on E : Exception do
    begin
      Result:= false;
      TMensagens.MensagemErro(Self.ClassName+' - AlterarLancamentoBancario - '+E.Message);
      TLog.Error(Self.ClassName+' - AlterarLancamentoBancario - '+E.Message);
    end;
  end;
end;

function TLancamentoBancarioDAO.AtualizaStatusBancario(CodigoLancamento: integer; Status: AnsiString; var Conexao: TADOConnection): Boolean;
var
  SQL : string;
  FQuery: TADOQuery;
begin
  try
    FQuery:= TADOQuery.Create(nil);
    TLog.Info('--- MÉTODO AtualizaStatusBancario - DAO ---');
    SQL := 'update Lancamento_Banco set Status = :Status where Codigo = :Codigo';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('Status').Value := Status;
    FQuery.Parameters.ParamByName('Codigo').Value := CodigoLancamento;
    FQuery.ExecSQL;
    Result := true;
    TLog.Info('--- FIM DO MÉTODO AtualizaStatusBancario - DAO ---');
  except
    on E : Exception do
    begin
      Result:= false;
      TMensagens.MensagemErro(Self.ClassName+' - AtualizaStatusBancario - '+E.Message);
      TLog.Error(Self.ClassName+' - AtualizaStatusBancario - '+E.Message);
    end;
  end;
end;

function TLancamentoBancarioDAO.AtualizaCodigoChequeLancamentoBanco(
  CodigoLancamento, CodigoCheque: integer;
  var Conexao: TADOConnection): Boolean;
var
  SQL : string;
  FQuery: TADOQuery;
begin
  try
    FQuery:= TADOQuery.Create(nil);
    TLog.Info('--- MÉTODO AtualizaCodigoChequeLancamentoBanco - DAO ---');
    SQL := 'update Lancamento_Banco set Codigo_Cheque = :Codigo_Cheque where Codigo = :Codigo';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('Codigo_Cheque').Value := CodigoCheque;
    FQuery.Parameters.ParamByName('Codigo').Value := CodigoLancamento;
    FQuery.ExecSQL;
    Result := true;
    TLog.Info('--- FIM DO MÉTODO AtualizaCodigoChequeLancamentoBanco - DAO ---');
  except
    on E : Exception do
    begin
      Result:= false;
      TMensagens.MensagemErro(Self.ClassName+' - AtualizaCodigoChequeLancamentoBanco - '+E.Message);
      TLog.Error(Self.ClassName+' - AtualizaCodigoChequeLancamentoBanco - '+E.Message);
    end;
  end;
end;

function TLancamentoBancarioDAO.AtualizaStatusBancario(NDocumento,
  Status: AnsiString; var Conexao: TADOConnection): Boolean;
var
  SQL : string;
  FQuery: TADOQuery;
begin
  try
    FQuery:= TADOQuery.Create(nil);
    TLog.Info('--- MÉTODO AtualizaStatusBancario - DAO ---');
    SQL := 'update Lancamento_Banco set Status = :Status where N_Documento = :N_Documento';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('Status').Value := Status;
    FQuery.Parameters.ParamByName('N_Documento').Value := StrToInt(NDocumento);
    FQuery.ExecSQL;
    Result := true;
    TLog.Info('--- FIM DO MÉTODO AtualizaStatusBancario - DAO ---');
  except
    on E : Exception do
    begin
      Result:= false;
      TMensagens.MensagemErro(Self.ClassName+' - AtualizaStatusBancario - '+E.Message);
      TLog.Error(Self.ClassName+' - AtualizaStatusBancario - '+E.Message);
    end;
  end;
end;

function TLancamentoBancarioDAO.DeletaLancamentoBancario(
  NDocumento: integer; var Conexao: TADOConnection): Boolean;
var
  SQL : string;
  FQuery: TADOQuery;
begin
  try
    FQuery:= TADOQuery.Create(nil);
    TLog.Info('--- MÉTODO DeletaLancamentoBancario - DAO ---');
    SQL := 'delete from Lancamento_Banco where N_Documento = :N_Documento';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('N_Documento').Value := NDocumento;
    FQuery.ExecSQL;
    Result := true;
    TLog.Info('--- FIM DO MÉTODO DeletaLancamentoBancario - DAO ---');
  except
    on E : Exception do
    begin
      Result:= false;
      TMensagens.MensagemErro(Self.ClassName+' - DeletaLancamentoBancario - '+E.Message);
      TLog.Error(Self.ClassName+' - DeletaLancamentoBancario - '+E.Message);
    end;
  end;
end;

function TLancamentoBancarioDAO.Excluir(Codigo: integer;
  var Conexao: TADOConnection): Boolean;
var
  SQL : string;
  FQuery: TADOQuery;
begin
  try
    FQuery:= TADOQuery.Create(nil);
    TLog.Info('--- MÉTODO ExcluirLancamentoBancario - DAO ---');

    SQL := 'Delete from Lancamento_Banco where Codigo = :Codigo';

    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('Codigo').Value := Codigo;
    FQuery.ExecSQL;
    Result := true;
    TLog.Info('--- FIM DO MÉTODO ExcluirLancamentoBancario - DAO ---');
  except
    on E : Exception do
    begin
      Result:= false;
      TMensagens.MensagemErro(Self.ClassName+' - ExcluirLancamentoBancario - '+E.Message);
      TLog.Error(Self.ClassName+' - ExcluirLancamentoBancario - '+E.Message);
    end;
  end;
end;

function TLancamentoBancarioDAO.Inserir(
  var LancamentoBancario: TLancamentoBancarioEntidade; var Conexao: TADOConnection): Boolean;
var
  SQL : string;
  FQuery: TADOQuery;
begin
  try
    FQuery:= TADOQuery.Create(nil);
    TLog.Info('--- MÉTODO InserirLancamentoBancario - DAO ---');

    SQL := 'Insert Into Lancamento_Banco (Codigo_Empresa, N_Documento, Data_Lancamento, Codigo_Conta,'+
      'Codigo_Operacao, Codigo_Plano, Descricao, Valor, Status, Saldo_Anterior, Saldo_Atual, Codigo_Cheque, Transferencia) values (:Codigo_Empresa, :N_Documento, :Data_Lancamento,'+
      ':Codigo_Conta, :Codigo_Operacao, :Codigo_Plano, :Descricao, :Valor, :Status, :Saldo_Anterior, :Saldo_Atual, :Codigo_Cheque, :Transferencia)';

    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('Codigo_Empresa').Value := LancamentoBancario.Codigo_Empresa;
    FQuery.Parameters.ParamByName('N_Documento').Value := LancamentoBancario.N_Documento;
    FQuery.Parameters.ParamByName('Data_Lancamento').Value := LancamentoBancario.Data_Lancamento;
    FQuery.Parameters.ParamByName('Codigo_Conta').Value := LancamentoBancario.Codigo_Conta;
    FQuery.Parameters.ParamByName('Codigo_Operacao').Value := LancamentoBancario.Codigo_Operacao;
    FQuery.Parameters.ParamByName('Codigo_Plano').Value := LancamentoBancario.Codigo_Plano;
    FQuery.Parameters.ParamByName('Descricao').Value := LancamentoBancario.Descricao;
    FQuery.Parameters.ParamByName('Valor').Value := LancamentoBancario.Valor;
    FQuery.Parameters.ParamByName('Status').Value := LancamentoBancario.Status;
    FQuery.Parameters.ParamByName('Saldo_Anterior').Value := LancamentoBancario.SaldoAnterior;
    FQuery.Parameters.ParamByName('Saldo_Atual').Value := LancamentoBancario.SaldoAtual;
    FQuery.Parameters.ParamByName('Codigo_Cheque').Value := LancamentoBancario.CodigoCheque;
    FQuery.Parameters.ParamByName('Transferencia').Value := LancamentoBancario.Transferencia;
    FQuery.ExecSQL;
    Result := true;
    TLog.Info('--- FIM DO MÉTODO InserirLancamentoBancario - DAO ---');
  except
    on E : Exception do
    begin
      Result:= false;
      TMensagens.MensagemErro(Self.ClassName+' - InserirLancamentoBancario - '+E.Message);
      TLog.Error(Self.ClassName+' - InserirLancamentoBancario - '+E.Message);
    end;
  end;
end;

function TLancamentoBancarioDAO.RetornaStatusLancamento(
  CodigoLancamento: integer; var Conexao: TADOConnection): AnsiString;
var
  SQL : string;
  FQuery: TADOQuery;
begin
  try
    FQuery:= TADOQuery.Create(nil);
    TLog.Info('--- MÉTODO RetornaStatusLancamento - DAO ---');
    SQL := 'Select Status from Lancamento_Banco where Codigo = :Codigo';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('Codigo').Value := CodigoLancamento;
    FQuery.Open;
    Result := FQuery.FieldByName('Status').AsString;
    TLog.Info('--- FIM DO MÉTODO RetornaStatusLancamento - DAO ---');
  except
    on E : Exception do
    begin
      Result:= '';
      TMensagens.MensagemErro(Self.ClassName+' - RetornaStatusLancamento - '+E.Message);
      TLog.Error(Self.ClassName+' - RetornaStatusLancamento - '+E.Message);
    end;
  end;
end;

end.
