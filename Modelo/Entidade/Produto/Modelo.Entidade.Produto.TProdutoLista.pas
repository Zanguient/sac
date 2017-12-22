unit Modelo.Entidade.Produto.TProdutoLista;

interface
 uses
  Modelo.Entidade.Produto.TProduto, System.Generics.Collections;
  type
    TProdutoLista = class
      private
        FProdutos : TObjectList<TProdutoEntidade>;
      public
        constructor Create;

        destructor Destroy;override;

        procedure addProduto(produto: TProdutoEntidade);

        function Produtos: TObjectList<TProdutoEntidade>;

        function remover(Produto: TProdutoEntidade): Boolean;overload;

        function remover(index: Integer): Boolean;overload;


    end;

implementation

{ TProdutoLista }

uses
 SysUtils, Util.TLog, Util.Mensagens;

constructor TProdutoLista.Create;
begin
  FProdutos := TObjectList<TProdutoEntidade>.Create;
end;

destructor TProdutoLista.Destroy;
begin
  FreeAndNil(FProdutos);
  inherited;
end;

function TProdutoLista.remover(Produto: TProdutoEntidade): Boolean;
begin
  try
    Result := False;
    if Assigned(produto) then begin
      Result := FProdutos.Remove(produto) > 0;
    end;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - remover - '+E.Message);
      TLog.Error(Self.ClassName+' - remover - '+E.Message);
    end;
  end;
end;

function TProdutoLista.remover(index: Integer): Boolean;
begin
  try
    Result := False;
    FProdutos.Delete(index);
    Result := True;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - remover - '+E.Message);
      TLog.Error(Self.ClassName+' - remover - '+E.Message);
    end;
  end;
end;

procedure TProdutoLista.addProduto(produto: TProdutoEntidade);
begin
  FProdutos.Add(produto);
end;

function TProdutoLista.Produtos: TObjectList<TProdutoEntidade>;
begin
  Result := FProdutos;
end;

end.
