unit DadosEmissaoNFERecebimento;

interface
type
  TDadosEmissaoNFERecebimento = class
    private
      FTipoRecebimento: AnsiString;
      FValorRecebimento: double;
      FCNPJ_Operadora: AnsiString;
      FPosOuTEF: AnsiString;
      FNAut: AnsiString;
      FNomeRede: AnsiString;
      procedure SetTipoRecebimento(const Value: AnsiString);
      procedure SetValorRecebimento(const Value: double);
      procedure SetCNPJ_Operadora(const Value: AnsiString);
      procedure SetNAut(const Value: AnsiString);
      procedure SetNomeRede(const Value: AnsiString);
      procedure SetPosOuTEF(const Value: AnsiString);
    public
      property TipoRecebimento: AnsiString read FTipoRecebimento write SetTipoRecebimento;
      property ValorRecebimento: double read FValorRecebimento write SetValorRecebimento;
      property CNPJ_Operadora: AnsiString read FCNPJ_Operadora write SetCNPJ_Operadora;
      property PosOuTEF: AnsiString read FPosOuTEF write SetPosOuTEF;
      property NAut: AnsiString read FNAut write SetNAut;
      property NomeRede: AnsiString read FNomeRede write SetNomeRede;

  end;
implementation

{ TDadosEmissaoNFERecebimento }

procedure TDadosEmissaoNFERecebimento.SetCNPJ_Operadora(
  const Value: AnsiString);
begin
  FCNPJ_Operadora := Value;
end;

procedure TDadosEmissaoNFERecebimento.SetNAut(const Value: AnsiString);
begin
  FNAut := Value;
end;

procedure TDadosEmissaoNFERecebimento.SetNomeRede(const Value: AnsiString);
begin
  FNomeRede := Value;
end;

procedure TDadosEmissaoNFERecebimento.SetPosOuTEF(const Value: AnsiString);
begin
  FPosOuTEF := Value;
end;

procedure TDadosEmissaoNFERecebimento.SetTipoRecebimento(
  const Value: AnsiString);
begin
  FTipoRecebimento := Value;
end;

procedure TDadosEmissaoNFERecebimento.SetValorRecebimento(const Value: double);
begin
  FValorRecebimento := Value;
end;

end.
