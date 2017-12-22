unit Modelo.DAO.TLancamentoCaixaDAO;

interface

uses
  Modelo.Entidade.TLancamentoCaixaEntidade, ADODB;
  type
    TLancamentoCaixaDAO = class
      private

      public
        function Inserir(var LancamentoCaixa: TLancamentoCaixaEntidade; var Conexao: TADOConnection): Boolean;
        function Alterar(var LancamentoCaixa: TLancamentoCaixaEntidade; var Conexao: TADOConnection): Boolean;
        function Excluir(Codigo: integer; var Conexao: TADOConnection): Boolean;
        function RetornaSaldoAtual(CodigoUsuario: integer; var Conexao: TADOConnection): double;
        function AtualizaSaldoAtual(CodigoUsuario: integer; NovoSaldo: double; var Conexao: TADOConnection): Boolean;
        function AtualizaStatusLancamentoCaixa(CodigoLancamento: integer; Status: AnsiString; var Conexao: TADOConnection): Boolean;
    end;
implementation

uses
  Util.TLog, Util.Mensagens, SysUtils;

{ TLancamentoCaixaDAO }

function TLancamentoCaixaDAO.Alterar(
  var LancamentoCaixa: TLancamentoCaixaEntidade;
  var Conexao: TADOConnection): Boolean;
var
  SQL : string;
  FQuery: TADOQuery;
begin
  try
    FQuery:= TADOQuery.Create(nil);
    TLog.Info('--- MÉTODO AlterarLancamentoCaixa - DAO ---');

    SQL := 'update Fechamento_Venda set Forma_Pagamento = :Forma_Pagamento, Valor = :Valor, Data = :Data, Tipo_Documento = :Tipo_Documento, Tipo = :Tipo, Descricao = :Descricao where Codigo_Registro = :Codigo';

    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('Forma_Pagamento').Value := LancamentoCaixa.FormaPagamento;
    FQuery.Parameters.ParamByName('Valor').Value := LancamentoCaixa.Valor;
    FQuery.Parameters.ParamByName('Data').Value := LancamentoCaixa.Data;
    FQuery.Parameters.ParamByName('Tipo_Documento').Value := LancamentoCaixa.TipoDocumento;
    FQuery.Parameters.ParamByName('Tipo').Value := LancamentoCaixa.Tipo;
    FQuery.Parameters.ParamByName('Descricao').Value := LancamentoCaixa.Descricao;
    FQuery.Parameters.ParamByName('Codigo').Value := LancamentoCaixa.CodigoRegistro;
    FQuery.ExecSQL;
    Result := true;
    TLog.Info('--- FIM DO MÉTODO AlterarLancamentoCaixa - DAO ---');
  except
    on E : Exception do
    begin
      Result:= false;
      TMensagens.MensagemErro(Self.ClassName+' - AlterarLancamentoCaixa - '+E.Message);
      TLog.Error(Self.ClassName+' - AlterarLancamentoCaixa - '+E.Message);
    end;
  end;
end;

function TLancamentoCaixaDAO.AtualizaSaldoAtual(CodigoUsuario: integer;
  NovoSaldo: double; var Conexao: TADOConnection): Boolean;
var
  SQL : string;
  FQuery: TADOQuery;
begin
  try
    FQuery:= TADOQuery.Create(nil);
    TLog.Info('--- MÉTODO AtualizaSaldoAtual - DAO ---');
    SQL := 'update Cadastro_Usuario set Saldo_Atual = :Saldo where Codigo = :Codigo';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('Codigo').Value := CodigoUsuario;
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

function TLancamentoCaixaDAO.AtualizaStatusLancamentoCaixa(
  CodigoLancamento: integer; Status: AnsiString;
  var Conexao: TADOConnection): Boolean;
var
  SQL : string;
  FQuery: TADOQuery;
begin
  try
    FQuery:= TADOQuery.Create(nil);
    TLog.Info('--- MÉTODO AtualizaStatusLancamentoCaixa - DAO ---');
    SQL := 'update Fechamento_Venda set Status = :Status where Codigo_Registro = :Codigo';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('Status').Value := Status;
    FQuery.Parameters.ParamByName('Codigo').Value := CodigoLancamento;
    FQuery.ExecSQL;
    Result := true;
    TLog.Info('--- FIM DO MÉTODO AtualizaStatusLancamentoCaixa - DAO ---');
  except
    on E : Exception do
    begin
      Result:= false;
      TMensagens.MensagemErro(Self.ClassName+' - AtualizaStatusLancamentoCaixa - '+E.Message);
      TLog.Error(Self.ClassName+' - AtualizaStatusLancamentoCaixa - '+E.Message);
    end;
  end;
end;

function TLancamentoCaixaDAO.Excluir(Codigo: integer;
  var Conexao: TADOConnection): Boolean;
var
  SQL : string;
  FQuery: TADOQuery;
begin
  try
    FQuery:= TADOQuery.Create(nil);
    TLog.Info('--- MÉTODO ExcluirLancamentoCaixa - DAO ---');

    SQL := 'Delete from Fechamento_Venda where Codigo_Registro = :Codigo';

    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('Codigo').Value := Codigo;
    FQuery.ExecSQL;
    Result := true;
    TLog.Info('--- FIM DO MÉTODO ExcluirLancamentoCaixa - DAO ---');
  except
    on E : Exception do
    begin
      Result:= false;
      TMensagens.MensagemErro(Self.ClassName+' - ExcluirLancamentoCaixa - '+E.Message);
      TLog.Error(Self.ClassName+' - ExcluirLancamentoCaixa - '+E.Message);
    end;
  end;
end;

function TLancamentoCaixaDAO.Inserir(
  var LancamentoCaixa: TLancamentoCaixaEntidade;
  var Conexao: TADOConnection): Boolean;
var
  SQL : string;
  FQuery: TADOQuery;
begin
  try
    FQuery:= TADOQuery.Create(nil);
    TLog.Info('--- MÉTODO InserirLancamentoCaixa - DAO ---');

    SQL := 'Insert Into Fechamento_Venda (Codigo, Codigo_Empresa, Codigo_Caixa, Codigo_Usuario,'+
                                          'Forma_Pagamento, Valor, Troco, Data, Tipo_Documento,'+
                                          'Status, Acerto, Tipo, Movimenta, N_Documento, Parcela,'+
                                          'Descricao, Transferencia, Codigo_Conta, Codigo_Operacao,'+
                                          'Codigo_Lancamento_Banco, Saldo_Anterior, Saldo_Atual)'+
                                          'values (:Codigo, :Codigo_Empresa, :Codigo_Caixa, :Codigo_Usuario,'+
                                          ':Forma_Pagamento, :Valor, :Troco, :Data, :Tipo_Documento, '+
                                          ':Status, :Acerto, :Tipo, :Movimenta, :N_Documento, :Parcela, '+
                                          ':Descricao, :Transferencia, :Codigo_Conta, :Codigo_Operacao,'+
                                          ':Codigo_Lancamento_Banco, :Saldo_Anterior, :Saldo_Atual)';

    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('Codigo').Value := LancamentoCaixa.Codigo;
    FQuery.Parameters.ParamByName('Codigo_Empresa').Value := LancamentoCaixa.CodigoEmpresa;
    FQuery.Parameters.ParamByName('Codigo_Caixa').Value := LancamentoCaixa.CodigoCaixa;
    FQuery.Parameters.ParamByName('Codigo_Usuario').Value := LancamentoCaixa.CodigoUsuario;
    FQuery.Parameters.ParamByName('Forma_Pagamento').Value := LancamentoCaixa.FormaPagamento;
    FQuery.Parameters.ParamByName('Valor').Value := LancamentoCaixa.Valor;
    FQuery.Parameters.ParamByName('Troco').Value := LancamentoCaixa.Troco;
    FQuery.Parameters.ParamByName('Data').Value := LancamentoCaixa.Data;
    FQuery.Parameters.ParamByName('Tipo_Documento').Value := LancamentoCaixa.TipoDocumento;
    FQuery.Parameters.ParamByName('Status').Value := LancamentoCaixa.Status;
    FQuery.Parameters.ParamByName('Acerto').Value := LancamentoCaixa.Acerto;
    FQuery.Parameters.ParamByName('Tipo').Value := LancamentoCaixa.Tipo;
    FQuery.Parameters.ParamByName('Movimenta').Value := LancamentoCaixa.Movimenta;
    FQuery.Parameters.ParamByName('N_Documento').Value := LancamentoCaixa.NDocumento;
    FQuery.Parameters.ParamByName('Parcela').Value := LancamentoCaixa.Parcela;
    FQuery.Parameters.ParamByName('Descricao').Value := LancamentoCaixa.Descricao;
    FQuery.Parameters.ParamByName('Transferencia').Value := LancamentoCaixa.Transferencia;
    FQuery.Parameters.ParamByName('Codigo_Conta').Value := LancamentoCaixa.CodigoConta;
    FQuery.Parameters.ParamByName('Codigo_Operacao').Value := LancamentoCaixa.CodigoOperacao;
    FQuery.Parameters.ParamByName('Codigo_Lancamento_Banco').Value := LancamentoCaixa.CodigoLancamentoBanco;
    FQuery.Parameters.ParamByName('Saldo_Anterior').Value := LancamentoCaixa.SaldoAnterior;
    FQuery.Parameters.ParamByName('Saldo_Atual').Value := LancamentoCaixa.SaldoAtual;
    FQuery.ExecSQL;
    Result := true;
    TLog.Info('--- FIM DO MÉTODO InserirLancamentoCaixa - DAO ---');
  except
    on E : Exception do
    begin
      Result:= false;
      TMensagens.MensagemErro(Self.ClassName+' - InserirLancamentoCaixa - '+E.Message);
      TLog.Error(Self.ClassName+' - InserirLancamentoCaixa - '+E.Message);
    end;
  end;
end;

function TLancamentoCaixaDAO.RetornaSaldoAtual(CodigoUsuario: integer;
  var Conexao: TADOConnection): double;
var
  SQL : string;
  FQuery: TADOQuery;
begin
  try
    FQuery:= TADOQuery.Create(nil);
    TLog.Info('--- MÉTODO RetornaSaldoAtual - DAO ---');
    TLog.Debug('Código do Usuário: '+IntToStr(CodigoUsuario));
    SQL := 'select CU.Saldo_Atual from Cadastro_Usuario CU where Codigo = :Codigo';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('Codigo').Value := CodigoUsuario;
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
