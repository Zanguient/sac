unit Modelo.DAO.Tributacao.TributacaoDAO;

interface

uses
  ADODB;

  type
    TTributacaoDAO = class
      private
        FQuery : TADOQuery;
        Conexao: TADOConnection;

      public
        function BuscaIVA(NCM: AnsiString): double;
        function BuscaAliquotaEstadoDestino(UF: AnsiString): integer;
        constructor Create(Conexao: TADOConnection);
    end;
implementation

{ TTributacaoDAO }

function TTributacaoDAO.BuscaAliquotaEstadoDestino(UF: AnsiString): integer;
begin
  with FQuery, sql do
  begin
    close;
    Connection:= Conexao;
    Clear;
    add('select Aliquota_ICMS from Cadastro_UF where UF = :UF');
    Parameters.ParamByName('UF').Value:= UF;
    open;
    Result:= FQuery.FieldByName('Aliquota_ICMS').AsInteger;
  end;
end;

function TTributacaoDAO.BuscaIVA(NCM: AnsiString): double;
begin
  with FQuery, sql do
  begin
    close;
    Connection:= Conexao;
    Clear;
    add('select IVA from NCM where Codigo_NCM = :NCM');
    Parameters.ParamByName('NCM').Value:= NCM;
    open;
    Result:= FQuery.FieldByName('IVA').AsFloat;
  end;
end;

constructor TTributacaoDAO.Create(Conexao: TADOConnection);
begin
  FQuery:= TADOQuery.Create(nil);
  Self.Conexao:= Conexao;
end;

end.
