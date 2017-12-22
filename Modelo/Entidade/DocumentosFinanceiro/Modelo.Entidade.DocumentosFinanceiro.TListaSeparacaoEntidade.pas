unit Modelo.Entidade.DocumentosFinanceiro.TListaSeparacaoEntidade;

interface
  type
    TListaSeparacaoEntidade = class
      private
        FCodigoProduto: AnsiString;
        FDescricaoProduto: AnsiString;
        FQuantidade: double;
        FMarca: AnsiString;
        FLocalProduto: AnsiString;

        procedure SetCodigoProduto(const Value: AnsiString);
        procedure SetDescricaoProduto(const Value: AnsiString);
        procedure SetLocalProduto(const Value: AnsiString);
        procedure SetMarca(const Value: AnsiString);
        procedure SetQuantidade(const Value: double);

      public
        property CodigoProduto: AnsiString read FCodigoProduto write SetCodigoProduto;
        property DescricaoProduto: AnsiString read FDescricaoProduto write SetDescricaoProduto;
        property Quantidade: double read FQuantidade write SetQuantidade;
        property Marca: AnsiString read FMarca write SetMarca;
        property LocalProduto: AnsiString read FLocalProduto write SetLocalProduto;

    end;

implementation

{ TListaSeparacao }

procedure TListaSeparacaoEntidade.SetCodigoProduto(const Value: AnsiString);
begin
  FCodigoProduto := Value;
end;

procedure TListaSeparacaoEntidade.SetDescricaoProduto(const Value: AnsiString);
begin
  FDescricaoProduto := Value;
end;

procedure TListaSeparacaoEntidade.SetLocalProduto(const Value: AnsiString);
begin
  FLocalProduto := Value;
end;

procedure TListaSeparacaoEntidade.SetMarca(const Value: AnsiString);
begin
  FMarca := Value;
end;

procedure TListaSeparacaoEntidade.SetQuantidade(const Value: double);
begin
  FQuantidade := Value;
end;

end.
