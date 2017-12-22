unit Entidade.TImpostosEntrada;

interface
type
  TImpostosEntradaEntidade = class
    private
      FCodigo: integer;
      FN_Nota_Fiscal: AnsiString;
      FTotal_Produtos: double;
      FBase_ICMS: Double;
      FValor_ICMS: double;
      FIsento_ICMS: double;
      FOutros_ICMS: double;
      FBase_ICMS_Subs: double;
      FValor_ICMS_Subs: double;
      FAliquota: double;
      FValor_Frete: double;
      FValor_Seguro: double;
      FOutras_Despesas: double;
      FTotal_IPI: double;
      FIsento_IPI: Double;
      FOutros_IPI: double;
      FDesconto: double;
      FTotal_Nota: double;
      FCusto_Total: double;

      procedure SetAliquota(const Value: double);
      procedure SetBase_ICMS(const Value: Double);
      procedure SetBase_ICMS_Subs(const Value: double);
      procedure SetCodigo(const Value: integer);
      procedure SetCusto_Total(const Value: double);
      procedure SetDesconto(const Value: double);
      procedure SetIsento_ICMS(const Value: double);
      procedure SetIsento_IPI(const Value: Double);
      procedure SetN_Nota_Fiscal(const Value: AnsiString);
      procedure SetOutras_Despesas(const Value: double);
      procedure SetOutros_ICMS(const Value: double);
      procedure SetOutros_IPI(const Value: double);
      procedure SetTotal_IPI(const Value: double);
      procedure SetTotal_Nota(const Value: double);
      procedure SetTotal_Produtos(const Value: double);
      procedure SetValor_Frete(const Value: double);
      procedure SetValor_ICMS(const Value: double);
      procedure SetValor_ICMS_Subs(const Value: double);
      procedure SetValor_Seguro(const Value: double);
    public
      property Codigo: integer read FCodigo write SetCodigo;
      property N_Nota_Fiscal: AnsiString read FN_Nota_Fiscal write SetN_Nota_Fiscal;
      property Total_Produtos: double read FTotal_Produtos write SetTotal_Produtos;
      property Base_ICMS: Double read FBase_ICMS write SetBase_ICMS;
      property Valor_ICMS: double read FValor_ICMS write SetValor_ICMS;
      property Isento_ICMS: double read FIsento_ICMS write SetIsento_ICMS;
      property Outros_ICMS: double read FOutros_ICMS write SetOutros_ICMS;
      property Base_ICMS_Subs: double read FBase_ICMS_Subs write SetBase_ICMS_Subs;
      property Valor_ICMS_Subs: double read FValor_ICMS_Subs write SetValor_ICMS_Subs;
      property Aliquota: double read FAliquota write SetAliquota;
      property Valor_Frete: double read FValor_Frete write SetValor_Frete;
      property Valor_Seguro: double read FValor_Seguro write SetValor_Seguro;
      property Outras_Despesas: double read FOutras_Despesas write SetOutras_Despesas;
      property Total_IPI: double read FTotal_IPI write SetTotal_IPI;
      property Isento_IPI: Double read FIsento_IPI write SetIsento_IPI;
      property Outros_IPI: double read FOutros_IPI write SetOutros_IPI;
      property Desconto: double read FDesconto write SetDesconto;
      property Total_Nota: double read FTotal_Nota write SetTotal_Nota;
      property Custo_Total: double read FCusto_Total write SetCusto_Total;
  end;
implementation

{ TImpostosEntradaEntidade }

procedure TImpostosEntradaEntidade.SetAliquota(const Value: double);
begin
  FAliquota := Value;
end;

procedure TImpostosEntradaEntidade.SetBase_ICMS(const Value: Double);
begin
  FBase_ICMS := Value;
end;

procedure TImpostosEntradaEntidade.SetBase_ICMS_Subs(const Value: double);
begin
  FBase_ICMS_Subs := Value;
end;

procedure TImpostosEntradaEntidade.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TImpostosEntradaEntidade.SetCusto_Total(const Value: double);
begin
  FCusto_Total := Value;
end;

procedure TImpostosEntradaEntidade.SetDesconto(const Value: double);
begin
  FDesconto := Value;
end;

procedure TImpostosEntradaEntidade.SetIsento_ICMS(const Value: double);
begin
  FIsento_ICMS := Value;
end;

procedure TImpostosEntradaEntidade.SetIsento_IPI(const Value: Double);
begin
  FIsento_IPI := Value;
end;

procedure TImpostosEntradaEntidade.SetN_Nota_Fiscal(const Value: AnsiString);
begin
  FN_Nota_Fiscal := Value;
end;

procedure TImpostosEntradaEntidade.SetOutras_Despesas(const Value: double);
begin
  FOutras_Despesas := Value;
end;

procedure TImpostosEntradaEntidade.SetOutros_ICMS(const Value: double);
begin
  FOutros_ICMS := Value;
end;

procedure TImpostosEntradaEntidade.SetOutros_IPI(const Value: double);
begin
  FOutros_IPI := Value;
end;

procedure TImpostosEntradaEntidade.SetTotal_IPI(const Value: double);
begin
  FTotal_IPI := Value;
end;

procedure TImpostosEntradaEntidade.SetTotal_Nota(const Value: double);
begin
  FTotal_Nota := Value;
end;

procedure TImpostosEntradaEntidade.SetTotal_Produtos(const Value: double);
begin
  FTotal_Produtos := Value;
end;

procedure TImpostosEntradaEntidade.SetValor_Frete(const Value: double);
begin
  FValor_Frete := Value;
end;

procedure TImpostosEntradaEntidade.SetValor_ICMS(const Value: double);
begin
  FValor_ICMS := Value;
end;

procedure TImpostosEntradaEntidade.SetValor_ICMS_Subs(const Value: double);
begin
  FValor_ICMS_Subs := Value;
end;

procedure TImpostosEntradaEntidade.SetValor_Seguro(const Value: double);
begin
  FValor_Seguro := Value;
end;

end.
