unit Modelo.Dominio.LancamentoFinanceiro.TLancamentoFinanceiroDominio;

interface

uses
  Modelo.DAO.LancamentoFinanceiro.TLancamentoFinanceiroDAO, Modelo.Dominio.LancamentoFinanceiro.ILancamentoFinanceiroDominio,
  Modelo.Entidade.TLancamentoFinanceiroEntidade;
  type
    TLancamentoFinanceiroDominio = class(TInterfacedObject, ILancamentoFinanceiroDominio)
      private
        FLF : TLancamentoFinanceiroEntidade;
        FLFDAO : TLancamentoFinanceiroDAO;
      public
        constructor Create; overload;
        destructor  Destroy; overload;
        procedure NovoLF;
        function gravarLancamentoFinanceiro(LF: TLancamentoFinanceiroEntidade): Boolean;
    end;

implementation

uses
  SysUtils, Util.TLog, Util.Mensagens;

{ TLancamentoFinanceiro }

constructor TLancamentoFinanceiroDominio.Create;
begin

end;

destructor TLancamentoFinanceiroDominio.Destroy;
begin
  if Assigned(FLF) then
    FreeAndNil(FLF);
  inherited;
end;

function TLancamentoFinanceiroDominio.gravarLancamentoFinanceiro(LF: TLancamentoFinanceiroEntidade): Boolean;
begin
  try
    FLFDAO.gravar(LF);
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - GravarLan�amentoFinanceiro - '+E.Message);
      TLog.Error(Self.ClassName+' - GravarLan�amentoFinanceiro - '+E.Message);
    end;
  end;

end;

procedure TLancamentoFinanceiroDominio.NovoLF;
begin
  try
    if Assigned(FLF) then
      FreeAndNil(FLF);
    FLF := TLancamentoFinanceiroEntidade.Create;

  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - NovoLan�amentoFinanceiro - '+E.Message);
      TLog.Error(Self.ClassName+' - NovoLan�amentoFinanceiro - '+E.Message);
    end;

  end;

end;

end.
