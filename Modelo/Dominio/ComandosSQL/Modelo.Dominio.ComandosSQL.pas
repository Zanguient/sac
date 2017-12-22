unit Modelo.Dominio.ComandosSQL;

interface

uses
  ADODB, Modelo.Entidade.ComandosSQL, Modelo.DAO.ComandosSQL;

type
  TComandoSQLDominio = class
    private
      FComandosSQLDAO: TComandosSQLDAO;
      FComando: TComandoSQLEntidade;
    public
      function ExecutaComandoSQLSalvarAlterarExcluir: Integer;
      function ExecutaComandoSQLRetornaADOQuery(var Query: TADOQuery): integer;
      constructor Create(var FComandoSQL: TComandoSQLEntidade);
  end;
implementation

uses
  SysUtils;

{ TComandosSQL }

constructor TComandoSQLDominio.Create(var FComandoSQL: TComandoSQLEntidade);
begin
  FComando:= FComandoSQL;
  FComandosSQLDAO:= TComandosSQLDAO.Create(FComandoSQL);
end;

function TComandoSQLDominio.ExecutaComandoSQLSalvarAlterarExcluir: Integer;
begin
  try
    Result:= FComandosSQLDAO.ExecutaComandoSQLSalvarAlterarExcluir;
  finally

  end;
end;

function TComandoSQLDominio.ExecutaComandoSQLRetornaADOQuery(var Query: TADOQuery): integer;
begin
  try
    Result:= FComandosSQLDAO.ExecutaComandoSQLRetornaADOQuery(Query);
  finally

  end;
end;

end.
