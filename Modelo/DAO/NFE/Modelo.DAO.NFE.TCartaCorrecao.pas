unit Modelo.DAO.NFE.TCartaCorrecao;

interface

uses
  Modelo.Entidade.NFE.TCartaCorrecaoEntidade, ADODB;
  type
    TCartaCorrecaoDAO = class
    private
      FCC: TCartaCorrecaoEntidade;
      Conexao: TADOConnection;
    public
      public function gravaCartaCorrecao(FCC: TCartaCorrecaoEntidade): boolean;
      constructor Create(var Conexao: TADOConnection);
    end;

implementation

uses
  SysUtils, Util.Mensagens, Util.TLog;

{ TCartaCorrecaoDAO }

constructor TCartaCorrecaoDAO.Create(var Conexao: TADOConnection);
begin
  Self.Conexao:= Conexao;
end;

function TCartaCorrecaoDAO.gravaCartaCorrecao(
  FCC: TCartaCorrecaoEntidade): boolean;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(nil);
  try
    try
      with qAux, sql do
      begin
        close;
        Connection:= Conexao;
        Clear;
        add('INSERT INTO NFCarta_Correcao ');
        add('     (Chave_NFE	,N_Nota_Fiscal, CNPJ, DataEvento, N_Carta_Correcao, Observacao, Protocolo)');
        add('     VALUES ');
        add('     ( :Chave_NFE, :N_Nota_Fiscal, :CNPJ, :DataEvento, :N_Carta_Correcao, :Observacao, :Protocolo)');
        Parameters.ParamByName('Chave_NFE').Value:= FCC.Chave_NFE;
        Parameters.ParamByName('N_Nota_Fiscal').Value:= FCC.N_Nota_Fiscal;
        Parameters.ParamByName('CNPJ').Value:= FCC.CNPJ;
        Parameters.ParamByName('DataEvento').Value:= FCC.DataEvento;
        Parameters.ParamByName('N_Carta_Correcao').Value:= FCC.N_Carta_Correcao;
        Parameters.ParamByName('Observacao').Value:= FCC.Observacao;
        Parameters.ParamByName('Protocolo').Value:= FCC.Protocolo;
        ExecSQL;
      end;
    finally
      FreeAndNil(qAux);
    end;
  except on E:Exception do
  begin
    TMensagens.MensagemErro(e.Message);
    TLog.Error('Erro ao gravar Carta de Correção: '+e.Message );
  end;

  end;
end;

end.
