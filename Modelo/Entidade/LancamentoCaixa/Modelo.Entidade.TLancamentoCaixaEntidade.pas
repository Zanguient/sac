unit Modelo.Entidade.TLancamentoCaixaEntidade;

interface
  type
    TLancamentoCaixaEntidade = class
      private
        FCodigoRegistro: Integer;
        FCodigo: integer;
        FCodigoEmpresa: integer;
        FCodigoCaixa: integer;
        FCodigoUsuario: integer;
        FFormaPagamento: AnsiString;
        FValor: double;
        FTroco: double;
        FData: TDateTime;
        FTipoDocumento: AnsiString;
        FStatus: AnsiString;
        FAcerto: Integer;
        FTipo: AnsiString;
        FMovimenta: Integer;
        FNDocumento: integer;
        FParcela: integer;
        FDescricao: AnsiString;
        FTransferencia: integer;
        FCodigoConta: integer;
        FCodigoOperacao: integer;
        FCodigoLancamentoBanco: integer;
        FSaldoAnterior: double;
        FSaldoAtual: double;

        procedure SetAcerto(const Value: Integer);
        procedure SetCodigo(const Value: integer);
        procedure SetCodigoCaixa(const Value: integer);
        procedure SetCodigoEmpresa(const Value: integer);
        procedure SetCodigoUsuario(const Value: integer);
        procedure SetData(const Value: TDateTime);
        procedure SetFormaPagamento(const Value: AnsiString);
        procedure SetParcela(const Value: integer);
        procedure SetMovimenta(const Value: Integer);
        procedure SetNDocumento(const Value: integer);
        procedure SetStatus(const Value: AnsiString);
        procedure SetTipo(const Value: AnsiString);
        procedure SetTipoDocumento(const Value: AnsiString);
        procedure SetTroco(const Value: double);
        procedure SetValor(const Value: double);
        procedure SetCodigoRegistro(const Value: Integer);
        procedure SetDescricao(const Value: AnsiString);
        procedure SetCodigoConta(const Value: integer);
        procedure SetCodigoOperacao(const Value: integer);
        procedure SetTransferencia(const Value: integer);
        procedure SetCodigoLancamentoBanco(const Value: integer);
        procedure SetSaldoAnterior(const Value: double);
        procedure SetSaldoAtual(const Value: double);
      public
        property Codigo: integer read FCodigo write SetCodigo;
        property CodigoEmpresa: integer read FCodigoEmpresa write SetCodigoEmpresa;
        property CodigoCaixa: integer read FCodigoCaixa write SetCodigoCaixa;
        property CodigoUsuario: integer read FCodigoUsuario write SetCodigoUsuario;
        property FormaPagamento: AnsiString read FFormaPagamento write SetFormaPagamento;
        property Valor: double read FValor write SetValor;
        property Troco: double read FTroco write SetTroco;
        property Data: TDateTime read FData write SetData;
        property TipoDocumento: AnsiString read FTipoDocumento write SetTipoDocumento;
        property Status: AnsiString read FStatus write SetStatus;
        property Acerto: Integer read FAcerto write SetAcerto;
        property Tipo: AnsiString read FTipo write SetTipo;
        property Movimenta: Integer read FMovimenta write SetMovimenta;
        property NDocumento: integer read FNDocumento write SetNDocumento;
        property Parcela: integer read FParcela write SetParcela;
        property CodigoRegistro: Integer read FCodigoRegistro write SetCodigoRegistro;
        property Descricao: AnsiString read FDescricao write SetDescricao;
        property Transferencia: integer read FTransferencia write SetTransferencia;
        property CodigoConta: integer read FCodigoConta write SetCodigoConta;
        property CodigoOperacao: integer read FCodigoOperacao write SetCodigoOperacao;
        property CodigoLancamentoBanco: integer read FCodigoLancamentoBanco write SetCodigoLancamentoBanco;
        property SaldoAnterior: double read FSaldoAnterior write SetSaldoAnterior;
        property SaldoAtual: double read FSaldoAtual write SetSaldoAtual;

    end;
implementation

{ TLancamentoCaixaEntidade }

procedure TLancamentoCaixaEntidade.SetAcerto(const Value: Integer);
begin
  FAcerto := Value;
end;

procedure TLancamentoCaixaEntidade.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TLancamentoCaixaEntidade.SetCodigoCaixa(const Value: integer);
begin
  FCodigoCaixa := Value;
end;

procedure TLancamentoCaixaEntidade.SetCodigoConta(const Value: integer);
begin
  FCodigoConta := Value;
end;

procedure TLancamentoCaixaEntidade.SetCodigoEmpresa(const Value: integer);
begin
  FCodigoEmpresa := Value;
end;

procedure TLancamentoCaixaEntidade.SetCodigoLancamentoBanco(
  const Value: integer);
begin
  FCodigoLancamentoBanco := Value;
end;

procedure TLancamentoCaixaEntidade.SetCodigoOperacao(const Value: integer);
begin
  FCodigoOperacao := Value;
end;

procedure TLancamentoCaixaEntidade.SetCodigoRegistro(const Value: Integer);
begin
  FCodigoRegistro := Value;
end;

procedure TLancamentoCaixaEntidade.SetCodigoUsuario(const Value: integer);
begin
  FCodigoUsuario := Value;
end;

procedure TLancamentoCaixaEntidade.SetData(const Value: TDateTime);
begin
  FData := Value;
end;

procedure TLancamentoCaixaEntidade.SetDescricao(const Value: AnsiString);
begin
  FDescricao := Value;
end;

procedure TLancamentoCaixaEntidade.SetFormaPagamento(const Value: AnsiString);
begin
  FFormaPagamento := Value;
end;

procedure TLancamentoCaixaEntidade.SetParcela(const Value: integer);
begin
  FParcela := Value;
end;

procedure TLancamentoCaixaEntidade.SetMovimenta(const Value: Integer);
begin
  FMovimenta := Value;
end;

procedure TLancamentoCaixaEntidade.SetNDocumento(const Value: integer);
begin
  FNDocumento := Value;
end;

procedure TLancamentoCaixaEntidade.SetSaldoAnterior(const Value: double);
begin
  FSaldoAnterior := Value;
end;

procedure TLancamentoCaixaEntidade.SetSaldoAtual(const Value: double);
begin
  FSaldoAtual := Value;
end;

procedure TLancamentoCaixaEntidade.SetStatus(const Value: AnsiString);
begin
  FStatus := Value;
end;

procedure TLancamentoCaixaEntidade.SetTipo(const Value: AnsiString);
begin
  FTipo := Value;
end;

procedure TLancamentoCaixaEntidade.SetTipoDocumento(const Value: AnsiString);
begin
  FTipoDocumento := Value;
end;

procedure TLancamentoCaixaEntidade.SetTransferencia(const Value: integer);
begin
  FTransferencia := Value;
end;

procedure TLancamentoCaixaEntidade.SetTroco(const Value: double);
begin
  FTroco := Value;
end;

procedure TLancamentoCaixaEntidade.SetValor(const Value: double);
begin
  FValor := Value;
end;

end.
