unit Modelo.Dominio.TCaixaDiario;

interface

uses
  ADODB, Modelo.DAO.TCaixaDiarioDAO;
  type
    TCaixaDiarioDominio = class
      private
        CaixaDiarioDAO: TCaixaDiarioDAO;
        Conexao: TADOConnection;
      public
        function DeletaCaixa(NDocumento: Integer; Valor: AnsiString; Parcela: Integer): Boolean;
        constructor Create(var Conexao: TADOConnection);
    end;
implementation

{ TCaixaDiarioDominio }

constructor TCaixaDiarioDominio.Create(var Conexao: TADOConnection);
begin
  Self.Conexao:= Conexao;
  CaixaDiarioDAO:= TCaixaDiarioDAO.Create;
end;

function TCaixaDiarioDominio.DeletaCaixa(NDocumento: Integer; Valor: AnsiString;
  Parcela: Integer): Boolean;
begin
  Result:= CaixaDiarioDAO.DeletaCaixa(NDocumento, Valor, Parcela, Conexao);
end;

end.
