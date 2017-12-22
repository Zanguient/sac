unit Modelo.Entidade.DocumentosFinanceiro.TListaSeparacaoLista;

interface
  uses
    System.Generics.Collections, Modelo.Entidade.DocumentosFinanceiro.TListaSeparacaoEntidade;

  type
    TListaSeparacaoLista = class
      private
        FProdutosLista : TObjectList<TListaSeparacaoEntidade>;
      public
        constructor Create;
        procedure adicionaProdutosLista(ProdutoLista : TListaSeparacaoEntidade);
        procedure removerProdutoLista(index: integer);
        function retornaProdutosLista: TObjectList<TListaSeparacaoEntidade>;
    end;

implementation

{ TListaSeparacaoLista }

procedure TListaSeparacaoLista.adicionaProdutosLista(
  ProdutoLista: TListaSeparacaoEntidade);
begin
  FProdutosLista.Add(ProdutoLista);
end;

constructor TListaSeparacaoLista.Create;
begin
  FProdutosLista := TObjectList<TListaSeparacaoEntidade>.Create;
end;

procedure TListaSeparacaoLista.removerProdutoLista(
  index: integer);
begin
  //if Assigned(ProdutoLista) then
    FProdutosLista.Delete(index);
end;

function TListaSeparacaoLista.retornaProdutosLista: TObjectList<TListaSeparacaoEntidade>;
begin
  Result:= FProdutosLista;
end;

end.
