unit DadosEmissaoNFEItens;

interface
type
  TDadosEmissaoNFEItens = class
    private
      FNCM: AnsiString;
      FDescricaoProduto: AnsiString;
      FCodigoVenda: AnsiString;
      FCSOSN: AnsiString;
      FCST: AnsiString;
      FValorUnitario: Double;
      FCFOP: AnsiString;
      FUnidade: AnsiString;
      FQuantidade: double;
      FValorOriginal: double;
      FValorFrete: double;
      FValorSeguro: Double;
      FDouA: AnsiString;
      FDescAcr: double;
      FOutrasDespesas: Double;
      FAliquotaCalculoCredito: Double;
      FCreditoICMS: AnsiString;
      FTipoCalculoBCICMS: AnsiString;
      FTipoCalculoBCICMSST: AnsiString;
      FMVAST: AnsiString;
      FBCST: AnsiString;
      FICMSST: AnsiString;
      FValorICMSST: AnsiString;
      FBCReduzida: AnsiString;
      FBC: AnsiString;
      FBCICMS: AnsiString;
      FICMS: AnsiString;
      FValorICMS: AnsiString;
      FBCIPI: AnsiString;
      FIPI: AnsiString;
      FValorIPI: AnsiString;
      FCSTIPI: AnsiString;
      FCSTPIS: AnsiString;
      FBCPIS: AnsiString;
      FPIS: AnsiString;
      FValorPIS: AnsiString;
      FCSTCOFINS: AnsiString;
      FBCCOFINS: AnsiString;
      FCOFINS: AnsiString;
      FValorCOFINS: AnsiString;
      FOrigem: Integer;
    procedure SetAliquotaCalculoCredito(const Value: Double);
    procedure SetBCCOFINS(const Value: AnsiString);
    procedure SetBCICMS(const Value: AnsiString);
    procedure SetBCIPI(const Value: AnsiString);
    procedure SetBCPIS(const Value: AnsiString);
    procedure SetBCReduzida(const Value: AnsiString);
    procedure SetBCST(const Value: AnsiString);
    procedure SetCFOP(const Value: AnsiString);
    procedure SetCodigoVenda(const Value: AnsiString);
    procedure SetCOFINS(const Value: AnsiString);
    procedure SetCreditoICMS(const Value: AnsiString);
    procedure SetCSOSN(const Value: AnsiString);
    procedure SetCST(const Value: AnsiString);
    procedure SetCSTCOFINS(const Value: AnsiString);
    procedure SetCSTIPI(const Value: AnsiString);
    procedure SetCSTPIS(const Value: AnsiString);
    procedure SetDescAcr(const Value: double);
    procedure SetDescricaoProduto(const Value: AnsiString);
    procedure SetDouA(const Value: AnsiString);
    procedure SetICMS(const Value: AnsiString);
    procedure SetICMSST(const Value: AnsiString);
    procedure SetIPI(const Value: AnsiString);
    procedure SetMVAST(const Value: AnsiString);
    procedure SetNCM(const Value: AnsiString);
    procedure SetOutrasDespesas(const Value: Double);
    procedure SetPIS(const Value: AnsiString);
    procedure SetQuantidade(const Value: double);
    procedure SetTipoCalculoBCICMS(const Value: AnsiString);
    procedure SetTipoCalculoBCICMSST(const Value: AnsiString);
    procedure SetUnidade(const Value: AnsiString);
    procedure SetValorCOFINS(const Value: AnsiString);
    procedure SetValorFrete(const Value: double);
    procedure SetValorICMS(const Value: AnsiString);
    procedure SetValorICMSST(const Value: AnsiString);
    procedure SetValorIPI(const Value: AnsiString);
    procedure SetValorOriginal(const Value: double);
    procedure SetValorPIS(const Value: AnsiString);
    procedure SetValorSeguro(const Value: Double);
    procedure SetValorUnitario(const Value: Double);
    procedure SetBC(const Value: AnsiString);
    procedure SetOrigem(const Value: Integer);
    public
      property NCM: AnsiString read FNCM write SetNCM;
      property DescricaoProduto: AnsiString read FDescricaoProduto write SetDescricaoProduto;
      property CodigoVenda: AnsiString read FCodigoVenda write SetCodigoVenda;
      property CSOSN: AnsiString read FCSOSN write SetCSOSN;
      property CST: AnsiString read FCST write SetCST;
      property ValorUnitario: Double read FValorUnitario write SetValorUnitario;
      property CFOP: AnsiString read FCFOP write SetCFOP;
      property Unidade: AnsiString read FUnidade write SetUnidade;
      property Quantidade: double read FQuantidade write SetQuantidade;
      property ValorOriginal: double read FValorOriginal write SetValorOriginal;
      property ValorFrete: double read FValorFrete write SetValorFrete;
      property ValorSeguro: Double read FValorSeguro write SetValorSeguro;
      property DouA: AnsiString read FDouA write SetDouA;
      property DescAcr: double read FDescAcr write SetDescAcr;
      property OutrasDespesas: Double read FOutrasDespesas write SetOutrasDespesas;
      property AliquotaCalculoCredito: Double read FAliquotaCalculoCredito write SetAliquotaCalculoCredito;
      property CreditoICMS: AnsiString read FCreditoICMS write SetCreditoICMS;
      property TipoCalculoBCICMS: AnsiString read FTipoCalculoBCICMS write SetTipoCalculoBCICMS;
      property TipoCalculoBCICMSST: AnsiString read FTipoCalculoBCICMSST write SetTipoCalculoBCICMSST;
      property MVAST: AnsiString read FMVAST write SetMVAST;
      property BCST: AnsiString read FBCST write SetBCST;
      property ICMSST: AnsiString read FICMSST write SetICMSST;
      property ValorICMSST: AnsiString read FValorICMSST write SetValorICMSST;
      property BC: AnsiString read FBC write SetBC;
      property BCReduzida: AnsiString read FBCReduzida write SetBCReduzida;
      property BCICMS: AnsiString read FBCICMS write SetBCICMS;
      property ICMS: AnsiString read FICMS write SetICMS;
      property ValorICMS: AnsiString read FValorICMS write SetValorICMS;
      property BCIPI: AnsiString read FBCIPI write SetBCIPI;
      property IPI: AnsiString read FIPI write SetIPI;
      property ValorIPI: AnsiString read FValorIPI write SetValorIPI;
      property CSTIPI: AnsiString read FCSTIPI write SetCSTIPI;
      property CSTPIS: AnsiString read FCSTPIS write SetCSTPIS;
      property BCPIS: AnsiString read FBCPIS write SetBCPIS;
      property PIS: AnsiString read FPIS write SetPIS;
      property ValorPIS: AnsiString read FValorPIS write SetValorPIS;
      property CSTCOFINS: AnsiString read FCSTCOFINS write SetCSTCOFINS;
      property BCCOFINS: AnsiString read FBCCOFINS write SetBCCOFINS;
      property COFINS: AnsiString read FCOFINS write SetCOFINS;
      property ValorCOFINS: AnsiString read FValorCOFINS write SetValorCOFINS;
      property Origem: Integer read FOrigem write SetOrigem;
  end;
implementation

{ TDadosEmissaoNFEItens }

procedure TDadosEmissaoNFEItens.SetAliquotaCalculoCredito(const Value: Double);
begin
  FAliquotaCalculoCredito := Value;
end;

procedure TDadosEmissaoNFEItens.SetBC(const Value: AnsiString);
begin
  FBC := Value;
end;

procedure TDadosEmissaoNFEItens.SetBCCOFINS(const Value: AnsiString);
begin
  FBCCOFINS := Value;
end;

procedure TDadosEmissaoNFEItens.SetBCICMS(const Value: AnsiString);
begin
  FBCICMS := Value;
end;

procedure TDadosEmissaoNFEItens.SetBCIPI(const Value: AnsiString);
begin
  FBCIPI := Value;
end;

procedure TDadosEmissaoNFEItens.SetBCPIS(const Value: AnsiString);
begin
  FBCPIS := Value;
end;

procedure TDadosEmissaoNFEItens.SetBCReduzida(const Value: AnsiString);
begin
  FBCReduzida := Value;
end;

procedure TDadosEmissaoNFEItens.SetBCST(const Value: AnsiString);
begin
  FBCST := Value;
end;

procedure TDadosEmissaoNFEItens.SetCFOP(const Value: AnsiString);
begin
  FCFOP := Value;
end;

procedure TDadosEmissaoNFEItens.SetCodigoVenda(const Value: AnsiString);
begin
  FCodigoVenda := Value;
end;

procedure TDadosEmissaoNFEItens.SetCOFINS(const Value: AnsiString);
begin
  FCOFINS := Value;
end;

procedure TDadosEmissaoNFEItens.SetCreditoICMS(const Value: AnsiString);
begin
  FCreditoICMS := Value;
end;

procedure TDadosEmissaoNFEItens.SetCSOSN(const Value: AnsiString);
begin
  FCSOSN := Value;
end;

procedure TDadosEmissaoNFEItens.SetCST(const Value: AnsiString);
begin
  FCST := Value;
end;

procedure TDadosEmissaoNFEItens.SetCSTCOFINS(const Value: AnsiString);
begin
  FCSTCOFINS := Value;
end;

procedure TDadosEmissaoNFEItens.SetCSTIPI(const Value: AnsiString);
begin
  FCSTIPI := Value;
end;

procedure TDadosEmissaoNFEItens.SetCSTPIS(const Value: AnsiString);
begin
  FCSTPIS := Value;
end;

procedure TDadosEmissaoNFEItens.SetDescAcr(const Value: double);
begin
  FDescAcr := Value;
end;

procedure TDadosEmissaoNFEItens.SetDescricaoProduto(const Value: AnsiString);
begin
  FDescricaoProduto := Value;
end;

procedure TDadosEmissaoNFEItens.SetDouA(const Value: AnsiString);
begin
  FDouA := Value;
end;

procedure TDadosEmissaoNFEItens.SetICMS(const Value: AnsiString);
begin
  FICMS := Value;
end;

procedure TDadosEmissaoNFEItens.SetICMSST(const Value: AnsiString);
begin
  FICMSST := Value;
end;

procedure TDadosEmissaoNFEItens.SetIPI(const Value: AnsiString);
begin
  FIPI := Value;
end;

procedure TDadosEmissaoNFEItens.SetMVAST(const Value: AnsiString);
begin
  FMVAST := Value;
end;

procedure TDadosEmissaoNFEItens.SetNCM(const Value: AnsiString);
begin
  FNCM := Value;
end;

procedure TDadosEmissaoNFEItens.SetOrigem(const Value: Integer);
begin
  FOrigem := Value;
end;

procedure TDadosEmissaoNFEItens.SetOutrasDespesas(const Value: Double);
begin
  FOutrasDespesas := Value;
end;

procedure TDadosEmissaoNFEItens.SetPIS(const Value: AnsiString);
begin
  FPIS := Value;
end;

procedure TDadosEmissaoNFEItens.SetQuantidade(const Value: double);
begin
  FQuantidade := Value;
end;

procedure TDadosEmissaoNFEItens.SetTipoCalculoBCICMS(const Value: AnsiString);
begin
  FTipoCalculoBCICMS := Value;
end;

procedure TDadosEmissaoNFEItens.SetTipoCalculoBCICMSST(const Value: AnsiString);
begin
  FTipoCalculoBCICMSST := Value;
end;

procedure TDadosEmissaoNFEItens.SetUnidade(const Value: AnsiString);
begin
  FUnidade := Value;
end;

procedure TDadosEmissaoNFEItens.SetValorCOFINS(const Value: AnsiString);
begin
  FValorCOFINS := Value;
end;

procedure TDadosEmissaoNFEItens.SetValorFrete(const Value: double);
begin
  FValorFrete := Value;
end;

procedure TDadosEmissaoNFEItens.SetValorICMS(const Value: AnsiString);
begin
  FValorICMS := Value;
end;

procedure TDadosEmissaoNFEItens.SetValorICMSST(const Value: AnsiString);
begin
  FValorICMSST := Value;
end;

procedure TDadosEmissaoNFEItens.SetValorIPI(const Value: AnsiString);
begin
  FValorIPI := Value;
end;

procedure TDadosEmissaoNFEItens.SetValorOriginal(const Value: double);
begin
  FValorOriginal := Value;
end;

procedure TDadosEmissaoNFEItens.SetValorPIS(const Value: AnsiString);
begin
  FValorPIS := Value;
end;

procedure TDadosEmissaoNFEItens.SetValorSeguro(const Value: Double);
begin
  FValorSeguro := Value;
end;

procedure TDadosEmissaoNFEItens.SetValorUnitario(const Value: Double);
begin
  FValorUnitario := Value;
end;

end.
