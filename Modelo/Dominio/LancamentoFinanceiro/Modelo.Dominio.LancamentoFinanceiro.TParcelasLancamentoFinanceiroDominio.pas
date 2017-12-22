unit Modelo.Dominio.LancamentoFinanceiro.TParcelasLancamentoFinanceiroDominio;

interface

uses
  Modelo.Entidade.TParcelasLancamentoFinanceiroEntidade,
  Modelo.DAO.LancamentoFinanceiro.TParcelasLancamentoFinanceiroDAO,
  Modelo.Entidade.TLancamentoFinanceiroEntidade, ADODB;

  type
    TParcelasLancamentoFinanceiroDominio = class
      private
        FPLF: TParcelasLancamentoFinanceiroEntidade;
        FPLFDAO: TParcelasLancamentoFinanceiroDAO;
        Conexao: TADOConnection;
      public
        constructor Create; overload;
        constructor Create(var Conexao: TADOConnection); overload;
        destructor  Destroy; overload;
        procedure NovoLF;
        function gravarLancamentoFinanceiro(PLF: TParcelasLancamentoFinanceiroEntidade): Boolean;
        function retornaParcelasLancamentos(LF: TLancamentoFinanceiroEntidade): AnsiString;

    end;
implementation

uses
  SysUtils, Util.TLog, Util.Mensagens;


{,  TParcelasLancamentoFinanceiroDominio }

constructor TParcelasLancamentoFinanceiroDominio.Create(var Conexao: TADOConnection);
begin
  Self.Conexao:= Conexao;
  FPLFDAO:= TParcelasLancamentoFinanceiroDAO.Create(Conexao);
end;

constructor TParcelasLancamentoFinanceiroDominio.Create;
begin

end;

destructor TParcelasLancamentoFinanceiroDominio.Destroy;
begin
  if Assigned(FPLF) then
    FreeAndNil(FPLF);
  inherited;
end;

function TParcelasLancamentoFinanceiroDominio.gravarLancamentoFinanceiro(
  PLF: TParcelasLancamentoFinanceiroEntidade): Boolean;
begin
  try
    FPLFDAO.gravar(PLF);
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - GravarParcelasLançamentoFinanceiro - '+E.Message);
      TLog.Error(Self.ClassName+' - GravarParcelasLançamentoFinanceiro - '+E.Message);
    end;
  end;

end;

procedure TParcelasLancamentoFinanceiroDominio.NovoLF;
begin

end;

function TParcelasLancamentoFinanceiroDominio.retornaParcelasLancamentos(
  LF: TLancamentoFinanceiroEntidade): AnsiString;
begin
  result:= FPLFDAO.retornaParcelasLancamentos(LF);
end;

end.
