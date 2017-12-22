unit Modelo.Entidade.TParcelasLancamentoFinanceiroEntidade;

interface

  type
    StatusEnumParcela = (PAGO, PENDENTE);

    TParcelasLancamentoFinanceiroEntidade = class
    private
      FCodigo: integer;
      FN_Documento: integer;
      FData_Vencimento: TDateTime;
      FData_Pagamento: TDateTime;
      FParcela: Integer;
      FStatus: StatusEnumParcela;
      FValor: Double;
      FCodigo_Conta: integer;
      FCodigo_Cheque: integer;
      FData_Atualizacao: TDateTime;
      FValor_Pagar: double;
      FCodigo_Forma_Pagamento_Parcela: integer;
      FValor_Restante: Double;
      FDesconto: Double;
      FAcrescimo: Double;
      FValor_Pago: double;

      procedure SetAcrescimo(const Value: Double);
      procedure SetCodigo(const Value: integer);
      procedure SetCodigo_Cheque(const Value: integer);
      procedure SetCodigo_Conta(const Value: integer);
      procedure SetCodigo_Forma_Pagamento_Parcela(const Value: integer);
      procedure SetData_Atualizacao(const Value: TDateTime);
      procedure SetData_Pagamento(const Value: TDateTime);
      procedure SetData_Vencimento(const Value: TDateTime);
      procedure SetDesconto(const Value: Double);
      procedure SetN_Documento(const Value: integer);
      procedure SetParcela(const Value: Integer);
      procedure SetStatus(const Value: StatusEnumParcela);
      procedure SetValor(const Value: Double);
      procedure SetValor_Pagar(const Value: double);
      procedure SetValor_Pago(const Value: double);
      procedure SetValor_Restante(const Value: Double);

    public
      property Codigo: integer read FCodigo write SetCodigo;
      property N_Documento: integer read FN_Documento write SetN_Documento;
      property Data_Vencimento: TDateTime read FData_Vencimento write SetData_Vencimento;
      property Data_Pagamento: TDateTime read FData_Pagamento write SetData_Pagamento;
      property Parcela: Integer read FParcela write SetParcela;
      property Status: StatusEnumParcela read FStatus write SetStatus;
      property Valor: Double read FValor write SetValor;
      property Codigo_Conta: integer read FCodigo_Conta write SetCodigo_Conta;
      property Codigo_Cheque: integer read FCodigo_Cheque write SetCodigo_Cheque;
      property Data_Atualizacao: TDateTime read FData_Atualizacao write SetData_Atualizacao;
      property Valor_Pagar: double read FValor_Pagar write SetValor_Pagar;
      property Codigo_Forma_Pagamento_Parcela: integer read FCodigo_Forma_Pagamento_Parcela write SetCodigo_Forma_Pagamento_Parcela;
      property Valor_Restante: Double read FValor_Restante write SetValor_Restante;
      property Desconto: Double read FDesconto write SetDesconto;
      property Acrescimo: Double read FAcrescimo write SetAcrescimo;
      property Valor_Pago: double read FValor_Pago write SetValor_Pago;
    end;

implementation

{ TParcelasLancamentoFinanceiroEntidade }

procedure TParcelasLancamentoFinanceiroEntidade.SetAcrescimo(const Value: Double);
begin
  FAcrescimo := Value;
end;

procedure TParcelasLancamentoFinanceiroEntidade.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TParcelasLancamentoFinanceiroEntidade.SetCodigo_Cheque(const Value: integer);
begin
  FCodigo_Cheque := Value;
end;

procedure TParcelasLancamentoFinanceiroEntidade.SetCodigo_Conta(const Value: integer);
begin
  FCodigo_Conta := Value;
end;

procedure TParcelasLancamentoFinanceiroEntidade.SetCodigo_Forma_Pagamento_Parcela(
  const Value: integer);
begin
  FCodigo_Forma_Pagamento_Parcela := Value;
end;

procedure TParcelasLancamentoFinanceiroEntidade.SetData_Atualizacao(
  const Value: TDateTime);
begin
  FData_Atualizacao := Value;
end;

procedure TParcelasLancamentoFinanceiroEntidade.SetData_Pagamento(
  const Value: TDateTime);
begin
  FData_Pagamento := Value;
end;

procedure TParcelasLancamentoFinanceiroEntidade.SetData_Vencimento(
  const Value: TDateTime);
begin
  FData_Vencimento := Value;
end;

procedure TParcelasLancamentoFinanceiroEntidade.SetDesconto(const Value: Double);
begin
  FDesconto := Value;
end;

procedure TParcelasLancamentoFinanceiroEntidade.SetN_Documento(const Value: integer);
begin
  FN_Documento := Value;
end;

procedure TParcelasLancamentoFinanceiroEntidade.SetParcela(const Value: Integer);
begin
  FParcela := Value;
end;

procedure TParcelasLancamentoFinanceiroEntidade.SetStatus(const Value: StatusEnumParcela);
begin
  FStatus := Value;
end;

procedure TParcelasLancamentoFinanceiroEntidade.SetValor(const Value: Double);
begin
  FValor := Value;
end;

procedure TParcelasLancamentoFinanceiroEntidade.SetValor_Pagar(const Value: double);
begin
  FValor_Pagar := Value;
end;

procedure TParcelasLancamentoFinanceiroEntidade.SetValor_Pago(const Value: double);
begin
  FValor_Pago := Value;
end;

procedure TParcelasLancamentoFinanceiroEntidade.SetValor_Restante(const Value: Double);
begin
  FValor_Restante := Value;
end;

end.
