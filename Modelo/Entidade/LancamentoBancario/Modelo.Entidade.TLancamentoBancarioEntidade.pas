unit Modelo.Entidade.TLancamentoBancarioEntidade;

interface
  type
    TLancamentoBancarioEntidade = class
    private
      FCodigo: integer;
      FCodigo_Empresa: integer;
      FN_Documento: integer;
      FData_Lancamento: TDate;
      FCodigo_Conta: integer;
      FCodigo_Operacao: integer;
      FCodigo_Plano: integer;
      FDescricao: AnsiString;
      FValor: double;
      FStatus: AnsiString;
      FSaldoAnterior: Double;
      FSaldoAtual: Double;
      FCodigoCheque: integer;
      FTransferencia: integer;

      procedure SetCodigo(const Value: integer);
      procedure SetCodigo_Conta(const Value: integer);
      procedure SetCodigo_Empresa(const Value: integer);
      procedure SetCodigo_Operacao(const Value: integer);
      procedure SetCodigo_Plano(const Value: integer);
      procedure SetData_Lancamento(const Value: TDate);
      procedure SetDescricao(const Value: AnsiString);
      procedure SetN_Documento(const Value: integer);
      procedure SetStatus(const Value: AnsiString);
      procedure SetValor(const Value: double);
      procedure SetSaldoAnterior(const Value: Double);
      procedure SetSaldoAtual(const Value: Double);
      procedure SetCodigoCheque(const Value: integer);
      procedure SetTransferencia(const Value: integer);

    public
      property Codigo: integer read FCodigo write SetCodigo;
      property Codigo_Empresa: integer read FCodigo_Empresa write SetCodigo_Empresa;
      property N_Documento: integer read FN_Documento write SetN_Documento;
      property Data_Lancamento: TDate read FData_Lancamento write SetData_Lancamento;
      property Codigo_Conta: integer read FCodigo_Conta write SetCodigo_Conta;
      property Codigo_Operacao: integer read FCodigo_Operacao write SetCodigo_Operacao;
      property Codigo_Plano: integer read FCodigo_Plano write SetCodigo_Plano;
      property Descricao: AnsiString read FDescricao write SetDescricao;
      property Valor: double read FValor write SetValor;
      property Status: AnsiString read FStatus write SetStatus;
      property SaldoAnterior: Double read FSaldoAnterior write SetSaldoAnterior;
      property SaldoAtual: Double read FSaldoAtual write SetSaldoAtual;
      property CodigoCheque: integer read FCodigoCheque write SetCodigoCheque;
      property Transferencia: integer read FTransferencia write SetTransferencia;


    end;
implementation

{ TLancamentoBancarioEntidade }

procedure TLancamentoBancarioEntidade.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TLancamentoBancarioEntidade.SetCodigoCheque(const Value: integer);
begin
  FCodigoCheque := Value;
end;

procedure TLancamentoBancarioEntidade.SetCodigo_Conta(const Value: integer);
begin
  FCodigo_Conta := Value;
end;

procedure TLancamentoBancarioEntidade.SetCodigo_Empresa(const Value: integer);
begin
  FCodigo_Empresa := Value;
end;

procedure TLancamentoBancarioEntidade.SetCodigo_Operacao(const Value: integer);
begin
  FCodigo_Operacao := Value;
end;

procedure TLancamentoBancarioEntidade.SetCodigo_Plano(const Value: integer);
begin
  FCodigo_Plano := Value;
end;

procedure TLancamentoBancarioEntidade.SetData_Lancamento(const Value: TDate);
begin
  FData_Lancamento := Value;
end;

procedure TLancamentoBancarioEntidade.SetDescricao(const Value: AnsiString);
begin
  FDescricao := Value;
end;

procedure TLancamentoBancarioEntidade.SetN_Documento(const Value: integer);
begin
  FN_Documento := Value;
end;

procedure TLancamentoBancarioEntidade.SetSaldoAnterior(const Value: Double);
begin
  FSaldoAnterior := Value;
end;

procedure TLancamentoBancarioEntidade.SetSaldoAtual(const Value: Double);
begin
  FSaldoAtual := Value;
end;

procedure TLancamentoBancarioEntidade.SetStatus(const Value: AnsiString);
begin
  FStatus := Value;
end;

procedure TLancamentoBancarioEntidade.SetTransferencia(const Value: integer);
begin
  FTransferencia := Value;
end;

procedure TLancamentoBancarioEntidade.SetValor(const Value: double);
begin
  FValor := Value;
end;

end.
