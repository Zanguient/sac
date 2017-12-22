unit Modelo.Entidade.TLancamentoFinanceiroEntidade;

interface
  uses
  System.Generics.Collections, Modelo.Entidade.TParcelasLancamentoFinanceiroEntidade;

  type
    TipoLancamentoEnum = (PAGAR, RECEBER);
    StatusEnum = (PAGO, PENDENTE);

    TLancamentoFinanceiroEntidade = class
    private
      FCodigo: Integer;
      FTipo: TipoLancamentoEnum;
      FNDocumento: integer;
      FCodigo_Empresa: integer;
      FCodigo_Forma_Pagamento: Integer;
      FCodigo_Cli_For: integer;
      FCodigo_Tipo_Documento: integer;
      FHistorico: AnsiString;
      FCodigo_Departamento: integer;
      FCodigo_Plano: Integer;
      FData_Lancamento: TDateTime;
      FData_Vencimento: TDateTime;
      FValor_Documento: Double;
      FDesconto: Double;
      FMulta: double;
      FValor_Cobrado: Double;
      FObservacoes: AnsiString;
      FStatus: StatusEnum;
      FConta_Fixa: integer;
      FCalcula_Juro: integer;
      FParcelasLancamentoFinanceiro : TObjectList<TParcelasLancamentoFinanceiroEntidade>;

      procedure SetCalcula_Juro(const Value: integer);
      procedure SetCodigo(const Value: Integer);
      procedure SetCodigo_Cli_For(const Value: integer);
      procedure SetCodigo_Departamento(const Value: integer);
      procedure SetCodigo_Empresa(const Value: integer);
      procedure SetCodigo_Forma_Pagamento(const Value: Integer);
      procedure SetCodigo_Plano(const Value: Integer);
      procedure SetCodigo_Tipo_Documento(const Value: integer);
      procedure SetConta_Fixa(const Value: integer);
      procedure SetData_Lancamento(const Value: TDateTime);
      procedure SetData_Vencimento(const Value: TDateTime);
      procedure SetDesconto(const Value: Double);
      procedure SetHistorico(const Value: AnsiString);
      procedure SetMulta(const Value: double);
      procedure SetNDocumento(const Value: integer);
      procedure SetObservacoes(const Value: AnsiString);
      procedure SetStatus(const Value: StatusEnum);
      procedure SetTipo(const Value: TipoLancamentoEnum);
      procedure SetValor_Cobrado(const Value: Double);
      procedure SetValor_Documento(const Value: Double);
      procedure SetParcelasLancamentoFinanceiro(const Value: TObjectList<TParcelasLancamentoFinanceiroEntidade>);

      public
        property Codigo: Integer read FCodigo write SetCodigo;
        property Tipo: TipoLancamentoEnum read FTipo write SetTipo;
        property NDocumento: integer read FNDocumento write SetNDocumento;
        property Codigo_Empresa: integer read FCodigo_Empresa write SetCodigo_Empresa;
        property Codigo_Forma_Pagamento: Integer read FCodigo_Forma_Pagamento write SetCodigo_Forma_Pagamento;
        property Codigo_Cli_For: integer read FCodigo_Cli_For write SetCodigo_Cli_For;
        property Codigo_Tipo_Documento: integer read FCodigo_Tipo_Documento write SetCodigo_Tipo_Documento;
        property Historico: AnsiString read FHistorico write SetHistorico;
        property Codigo_Departamento: integer read FCodigo_Departamento write SetCodigo_Departamento;
        property Codigo_Plano: Integer read FCodigo_Plano write SetCodigo_Plano;
        property Data_Lancamento: TDateTime read FData_Lancamento write SetData_Lancamento;
        property Data_Vencimento: TDateTime read FData_Vencimento write SetData_Vencimento;
        property Valor_Documento: Double read FValor_Documento write SetValor_Documento;
        property Desconto: Double read FDesconto write SetDesconto;
        property Multa: double read FMulta write SetMulta;
        property Valor_Cobrado: Double read FValor_Cobrado write SetValor_Cobrado;
        property Observacoes: AnsiString read FObservacoes write SetObservacoes;
        property Status: StatusEnum read FStatus write SetStatus;
        property Conta_Fixa: integer read FConta_Fixa write SetConta_Fixa;
        property Calcula_Juro: integer read FCalcula_Juro write SetCalcula_Juro;
        property ParcelasLancamentoFinanceiro : TObjectList<TParcelasLancamentoFinanceiroEntidade> read FParcelasLancamentoFinanceiro write SetParcelasLancamentoFinanceiro;
        constructor Create;
    end;
implementation

{ TLancamentoFinanceiroEntidade }

constructor TLancamentoFinanceiroEntidade.Create;
begin
  FParcelasLancamentoFinanceiro := TObjectList<TParcelasLancamentoFinanceiroEntidade>.Create;
end;

procedure TLancamentoFinanceiroEntidade.SetCalcula_Juro(const Value: integer);
begin
  FCalcula_Juro := Value;
end;

procedure TLancamentoFinanceiroEntidade.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TLancamentoFinanceiroEntidade.SetCodigo_Cli_For(const Value: integer);
begin
  FCodigo_Cli_For := Value;
end;

procedure TLancamentoFinanceiroEntidade.SetCodigo_Departamento(const Value: integer);
begin
  FCodigo_Departamento := Value;
end;

procedure TLancamentoFinanceiroEntidade.SetCodigo_Empresa(const Value: integer);
begin
  FCodigo_Empresa := Value;
end;

procedure TLancamentoFinanceiroEntidade.SetCodigo_Forma_Pagamento(const Value: Integer);
begin
  FCodigo_Forma_Pagamento := Value;
end;

procedure TLancamentoFinanceiroEntidade.SetCodigo_Plano(const Value: Integer);
begin
  FCodigo_Plano := Value;
end;

procedure TLancamentoFinanceiroEntidade.SetCodigo_Tipo_Documento(const Value: integer);
begin
  FCodigo_Tipo_Documento := Value;
end;

procedure TLancamentoFinanceiroEntidade.SetConta_Fixa(const Value: integer);
begin
  FConta_Fixa := Value;
end;

procedure TLancamentoFinanceiroEntidade.SetData_Lancamento(const Value: TDateTime);
begin
  FData_Lancamento := Value;
end;

procedure TLancamentoFinanceiroEntidade.SetData_Vencimento(const Value: TDateTime);
begin
  FData_Vencimento := Value;
end;

procedure TLancamentoFinanceiroEntidade.SetDesconto(const Value: Double);
begin
  FDesconto := Value;
end;

procedure TLancamentoFinanceiroEntidade.SetHistorico(const Value: AnsiString);
begin
  FHistorico := Value;
end;

procedure TLancamentoFinanceiroEntidade.SetMulta(const Value: double);
begin
  FMulta := Value;
end;

procedure TLancamentoFinanceiroEntidade.SetNDocumento(const Value: integer);
begin
  FNDocumento := Value;
end;

procedure TLancamentoFinanceiroEntidade.SetObservacoes(const Value: AnsiString);
begin
  FObservacoes := Value;
end;

procedure TLancamentoFinanceiroEntidade.SetParcelasLancamentoFinanceiro(
  const Value: TObjectList<TParcelasLancamentoFinanceiroEntidade>);
begin
  FParcelasLancamentoFinanceiro := Value;
end;

procedure TLancamentoFinanceiroEntidade.SetStatus(const Value: StatusEnum);
begin
  FStatus := Value;
end;

procedure TLancamentoFinanceiroEntidade.SetTipo(const Value: TipoLancamentoEnum);
begin
  FTipo := Value;
end;

procedure TLancamentoFinanceiroEntidade.SetValor_Cobrado(const Value: Double);
begin
  FValor_Cobrado := Value;
end;

procedure TLancamentoFinanceiroEntidade.SetValor_Documento(const Value: Double);
begin
  FValor_Documento := Value;
end;

end.
