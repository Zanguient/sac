unit Modelo.DAO.TDepartamentoDAO;

interface
  uses
    ADODB;

  type
    TDepartamentoDAO = class
      private
        Conexao: TADOConnection;
      public
        function retornaDepartamento(CodigoApartamento: integer): AnsiString;
        constructor Create(var Conexao: TADOConnection);
    end;

implementation

uses
  SysUtils, Util.TLog, Util.Mensagens;

{ TDepartamentoDAO }

constructor TDepartamentoDAO.Create(var Conexao: TADOConnection);
begin
  Self.Conexao:= Conexao;
end;

function TDepartamentoDAO.retornaDepartamento(
  CodigoApartamento: integer): AnsiString;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection:= Conexao;
      clear;
      Add('select D.Descricao from Departamento D');
      Add('where D.Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= CodigoApartamento;
      Open;
      if (IsEmpty = false) then
        Result:= qAux.FieldByName('Descricao').AsString
    end;
  except on E:Exception do
  begin
    TMensagens.MensagemErro('Erro ao retornar a descrição do departamento: '+e.Message);
    TLog.Error('Erro ao retornar a descrição do departamento: '+e.Message);
  end;

  end;
end;

end.
