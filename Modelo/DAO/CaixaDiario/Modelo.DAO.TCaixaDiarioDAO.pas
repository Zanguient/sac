unit Modelo.DAO.TCaixaDiarioDAO;

interface

uses
  ADODB;
  type
    TCaixaDiarioDAO = class
      private

      public
        function DeletaCaixa(NDocumento:Integer; Valor: AnsiString; Parcela: Integer; var Conexao: TADOConnection): Boolean;
    end;
implementation

uses
  Util.TLog, SysUtils, Util.Mensagens;

{ TCaixaDiario }

function TCaixaDiarioDAO.DeletaCaixa(NDocumento: Integer; Valor: AnsiString;
  Parcela: Integer; var Conexao: TADOConnection): Boolean;
var
  SQL : string;
  FQuery: TADOQuery;
begin
  try
    FQuery:= TADOQuery.Create(nil);
    TLog.Info('--- MÉTODO DeletaCaixa - DAO ---');
    SQL := 'Delete from Fechamento_Venda where N_Documento = :N_Documento and Parcela = :Parcela and Valor = :Valor';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('N_Documento').Value := NDocumento;
    FQuery.Parameters.ParamByName('Parcela').Value := Parcela;
    FQuery.Parameters.ParamByName('Valor').Value := Valor;
    FQuery.ExecSQL;
    Result := true;
    TLog.Info('--- FIM DO MÉTODO DeletaCaixa - DAO ---');
  except
    on E : Exception do
    begin
      Result:= false;
      TMensagens.MensagemErro(Self.ClassName+' - DeletaCaixa - '+E.Message);
      TLog.Error(Self.ClassName+' - DeletaCaixa - '+E.Message);
    end;
  end;
end;

end.
