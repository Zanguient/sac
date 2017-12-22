unit Modelo.Entidade.Tributacao.TTributacaoEntidade;

interface

  type
    TTributacaoEntidade = class
      private
        FValorOperacao    : double;
        FBaseCalculo      : Double;
        FBaseCalculoST    : Double;
        FAliquotaOperacao : integer;
        FAliquotaEstadoDestino   : Integer;
        FValorICMS        : Double;
        FValorICMSST      : Double;
        FIVA              : double;
        FPercBaseRed      : double;
        FAliquotaIPI      : Double;
        FIPI              : Double;
        FCOFINS           : Double;
        FPIS              : Integer;
        FFrete            : Double;
        FSeguro           : Double;
        FOutras           : Double;
        FDesconto         : Double;
        FCreditoICMS      : Double;

        procedure SetAliquotaEstadoDestino(const Value: Integer);
        procedure SetAliquotaIPI(const Value: Double);
        procedure SetAliquotaOperacao(const Value: integer);
        procedure SetBaseCalculo(const Value: Double);
        procedure SetBaseCalculoST(const Value: Double);
        procedure SetCOFINS(const Value: Double);
        procedure SetDesconto(const Value: Double);
        procedure SetFrete(const Value: Double);
        procedure SetIPI(const Value: Double);
        procedure SetOutras(const Value: Double);
        procedure SetPIS(const Value: Integer);
        procedure SetSeguro(const Value: Double);
        procedure SetValorICMS(const Value: Double);
        procedure SetValorICMSST(const Value: Double);
        procedure SetValorOperacao(const Value: double);
        procedure SetIVA(const Value: double);
        procedure SetPercBaseRed(const Value: double);
        procedure SetCreditoICMS(const Value: Double);

      public
        property ValorOperacao    : double read FValorOperacao write SetValorOperacao;
        property BaseCalculo      : Double read FBaseCalculo write SetBaseCalculo;
        property BaseCalculoST    : Double read FBaseCalculoST write SetBaseCalculoST;
        property AliquotaOperacao : integer read FAliquotaOperacao write SetAliquotaOperacao;
        property AliquotaEstadoDestino   : Integer read FAliquotaEstadoDestino write SetAliquotaEstadoDestino;
        property ValorICMS        : Double read FValorICMS write SetValorICMS;
        property ValorICMSST      : Double read FValorICMSST write SetValorICMSST;
        property IVA              : double read FIVA write SetIVA;
        property PercBaseRed      : double read FPercBaseRed write SetPercBaseRed;
        property AliquotaIPI      : Double read FAliquotaIPI write SetAliquotaIPI;
        property IPI              : Double read FIPI write SetIPI;
        property COFINS           : Double read FCOFINS write SetCOFINS;
        property PIS              : Integer read FPIS write SetPIS;
        property Frete            : Double read FFrete write SetFrete;
        property Seguro           : Double read FSeguro write SetSeguro;
        property Outras           : Double read FOutras write SetOutras;
        property Desconto         : Double read FDesconto write SetDesconto;
        property CreditoICMS      : Double read FCreditoICMS write SetCreditoICMS;

    end;

implementation

{ TTributacaoEntidade }

procedure TTributacaoEntidade.SetAliquotaEstadoDestino(const Value: Integer);
begin
  FAliquotaEstadoDestino := Value;
end;

procedure TTributacaoEntidade.SetAliquotaIPI(const Value: Double);
begin
  FAliquotaIPI := Value;
end;

procedure TTributacaoEntidade.SetAliquotaOperacao(const Value: integer);
begin
  FAliquotaOperacao := Value;
end;

procedure TTributacaoEntidade.SetBaseCalculo(const Value: Double);
begin
  FBaseCalculo := Value;
end;

procedure TTributacaoEntidade.SetBaseCalculoST(const Value: Double);
begin
  FBaseCalculoST := Value;
end;

procedure TTributacaoEntidade.SetCOFINS(const Value: Double);
begin
  FCOFINS := Value;
end;

procedure TTributacaoEntidade.SetCreditoICMS(const Value: Double);
begin
  FCreditoICMS := Value;
end;

procedure TTributacaoEntidade.SetDesconto(const Value: Double);
begin
  FDesconto := Value;
end;

procedure TTributacaoEntidade.SetFrete(const Value: Double);
begin
  FFrete := Value;
end;

procedure TTributacaoEntidade.SetIPI(const Value: Double);
begin
  FIPI := Value;
end;

procedure TTributacaoEntidade.SetIVA(const Value: double);
begin
  FIVA := Value;
end;

procedure TTributacaoEntidade.SetOutras(const Value: Double);
begin
  FOutras := Value;
end;

procedure TTributacaoEntidade.SetPercBaseRed(const Value: double);
begin
  FPercBaseRed := Value;
end;

procedure TTributacaoEntidade.SetPIS(const Value: Integer);
begin
  FPIS := Value;
end;

procedure TTributacaoEntidade.SetSeguro(const Value: Double);
begin
  FSeguro := Value;
end;

procedure TTributacaoEntidade.SetValorICMS(const Value: Double);
begin
  FValorICMS := Value;
end;

procedure TTributacaoEntidade.SetValorICMSST(const Value: Double);
begin
  FValorICMSST := Value;
end;

procedure TTributacaoEntidade.SetValorOperacao(const Value: double);
begin
  FValorOperacao := Value;
end;

end.
