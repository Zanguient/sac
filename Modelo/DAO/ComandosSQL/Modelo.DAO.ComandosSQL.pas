unit Modelo.DAO.ComandosSQL;

interface

uses
  ADODB, Modelo.Entidade.ComandosSQL;

type
  TComandosSQLDAO = class
    private
      qAux: TADOQuery;
      FComandoSQL: TComandoSQLEntidade;
    public
      function ExecutaComandoSQLSalvarAlterarExcluir: Integer;
      function ExecutaComandoSQLRetornaADOQuery(var Query: TADOQuery): integer;
      constructor Create(var FComando: TComandoSQLEntidade);
  end;

implementation

uses
  SysUtils, Util.TLog, Dialogs, Util.Mensagens;

{ TComandosSQLDAO }

constructor TComandosSQLDAO.Create(var FComando: TComandoSQLEntidade);
begin
  FComandoSQL:= FComando;
  qAux:= TADOQuery.Create(nil);
end;

function TComandosSQLDAO.ExecutaComandoSQLRetornaADOQuery(var Query: TADOQuery): integer;
var
  i: integer;
begin
  try
    //try
      with Query, sql do
      begin
        close;
        //Connection:= FComandoSQL.Conexao;
        Clear;
        Add(FComandoSQL.ComandoSQL);
        if (FComandoSQL.Parametros.Count > 0) then
        begin
          for i := 0 to FComandoSQL.Parametros.Count-1 do
          begin
            Parameters.ParamByName(FComandoSQL.Parametros.Items[i]).Value:= FComandoSQL.Valores.Items[i];
          end;
        end;
        open;
        Result := 1;
      end;
    {except on E:Exception do
    begin
      Result:= 0;
      TMensagens.MensagemErro('TComandosSQLDAO.ExecutaComandoSQLRetornaADOQuery: '+E.Message);
      TLog.Error('TComandosSQLDAO.ExecutaComandoSQLRetornaADOQuery: '+E.Message);
    end;

    end;}
  finally
    //FreeAndNil(qAux);
  end;
end;

function TComandosSQLDAO.ExecutaComandoSQLSalvarAlterarExcluir: Integer;
var
  i: integer;
begin
  try
    //try
      with qAux, sql do
      begin
        close;
        Connection:= FComandoSQL.Conexao;
        Clear;
        Add(FComandoSQL.ComandoSQL);
        if (FComandoSQL.Parametros.Count > 0) then
        begin
          for i := 0 to FComandoSQL.Parametros.Count-1 do
          begin
            Parameters.ParamByName(FComandoSQL.Parametros.Items[i]).Value:= FComandoSQL.Valores.Items[i];
          end;
        end;
        Result := ExecSQL;
      end;
    {except on E:Exception do
    begin
      TMensagens.MensagemErro('TComandosSQLDAO.ExecutaComandoSQLSalvarAlterarExcluir: '+E.Message);
      TLog.Error('TComandosSQLDAO.ExecutaComandoSQLSalvarAlterarExcluir: '+E.Message);
    end;

    end;}
  finally
    FreeAndNil(qAux);
  end;
end;

end.
