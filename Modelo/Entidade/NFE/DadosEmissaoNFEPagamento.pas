unit DadosEmissaoNFEPagamento;

interface
type
  TDadosEmissaoNFEPagamento = class
  private
    FNDocumento: AnsiString;
    FDataVencimento: TDateTime;
    FValor: double;
    procedure SetDataVencimento(const Value: TDateTime);
    procedure SetNDocumento(const Value: AnsiString);
    procedure SetValor(const Value: double);
  public
    property NDocumento: AnsiString read FNDocumento write SetNDocumento;
    property DataVencimento: TDateTime read FDataVencimento write SetDataVencimento;
    property Valor: double read FValor write SetValor;

  end;
implementation

{ TDadosEmissaoNFEPagamento }

procedure TDadosEmissaoNFEPagamento.SetDataVencimento(const Value: TDateTime);
begin
  FDataVencimento := Value;
end;

procedure TDadosEmissaoNFEPagamento.SetNDocumento(const Value: AnsiString);
begin
  FNDocumento := Value;
end;

procedure TDadosEmissaoNFEPagamento.SetValor(const Value: double);
begin
  FValor := Value;
end;

end.
