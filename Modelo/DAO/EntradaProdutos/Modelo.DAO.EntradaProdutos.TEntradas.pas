unit Modelo.DAO.EntradaProdutos.TEntradas;

interface

uses
  Entidade.TEntradas;
  type
    TEntradasDominio = class
      private

      public
        function gravar(FEntradas: TEntradasEntidade): boolean;
        function alterar(FEntradas: TEntradasEntidade): boolean;
        function remover(CodigoEntrada: integer): boolean;
    end;

implementation

{ TEntradasDominio }

function TEntradasDominio.alterar(FEntradas: TEntradasEntidade): boolean;
begin

end;

function TEntradasDominio.gravar(FEntradas: TEntradasEntidade): boolean;
begin

end;

function TEntradasDominio.remover(CodigoEntrada: integer): boolean;
begin

end;

end.
