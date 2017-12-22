unit Util.GeradorDeCodigo;

interface

uses
  ADODB;

  type
    TGeradorDeCodigo = class
      public
        class function GeraCodigoSequencia(Tabela: AnsiString; var Conexao: TADOConnection): integer;
        class function GeraCodigoSequenciaControlaCodigo(Tabela: AnsiString; var Conexao: TADOConnection): integer;
        class function GeraCodigoIndetity(Tabela: AnsiString; var Conexao: TADOConnection): integer;
    end;

implementation

uses
  TLoggerUnit, UDM, SysUtils, Util.Mensagens;


{ GeradorDeCodigo }

class function TGeradorDeCodigo.GeraCodigoSequencia(Tabela: AnsiString; var Conexao: TADOConnection): integer;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('select max(Codigo) as Codigo from '+Tabela+'');
      open;
      Result:= qAux.FieldByName('Codigo').AsInteger + 1;
    end;
  except on E: Exception do
  begin
    TMensagens.MensagemErro('Gerar código sequencial. Erro: '+e.Message+'. '+DateTimeToStr(now));
    TLogger.GetInstance.Error('Gerar código sequencial. Erro: '+e.Message+'. '+DateTimeToStr(now) );
  end;
  end;
end;

class function TGeradorDeCodigo.GeraCodigoSequenciaControlaCodigo(
  Tabela: AnsiString; var Conexao: TADOConnection): integer;
var
  qAux, qAux2: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    qAux2:= TADOQuery.Create(nil);

    with qAux, SQL do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('select max(Codigo) as Codigo from '+Tabela+'');
      open;
      Result:= qAux.FieldByName('Codigo').AsInteger + 1;
    end;

    with qAux2, SQL do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('Insert into '+Tabela+' (Codigo) values (:Codigo)');
      Parameters.ParamByName('Codigo').Value:= qAux.FieldByName('Codigo').AsInteger + 1;;
      ExecSQL;
    end;
  except on E: Exception do
  begin
    TMensagens.MensagemErro('Gerar código sequencial. Erro: '+e.Message+'. '+DateTimeToStr(now));
    TLogger.GetInstance.Error('Gerar código sequencial. Erro: '+e.Message+'. '+DateTimeToStr(now) );
  end;
  end;
end;

class function TGeradorDeCodigo.GeraCodigoIndetity(Tabela: AnsiString;
  var Conexao: TADOConnection): integer;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('select IDENT_CURRENT('+QuotedStr(Tabela)+') as Codigo');
      open;
      Result:= qAux.FieldByName('Codigo').AsInteger + 1;
    end;
  except on E: Exception do
  begin
    TMensagens.MensagemErro('Gerar Gera_Codigo_Indetity. Erro: '+e.Message+'. '+DateTimeToStr(now));
    TLogger.GetInstance.Error('Gerar Gera_Codigo_Indetity. Erro: '+e.Message+'. '+DateTimeToStr(now) );
  end;
  end;
end;

end.
