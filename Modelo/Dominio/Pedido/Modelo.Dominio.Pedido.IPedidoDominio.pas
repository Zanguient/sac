unit Modelo.Dominio.Pedido.IPedidoDominio;

interface
 uses
  ADODB;
  type
    IPedidoDominio = interface
      ['{6E2A8708-7EDF-49AD-8867-2550B27C728C}']
      function removerFichaEstoque(codPedido : Integer):Boolean;
    end;

implementation

end.
