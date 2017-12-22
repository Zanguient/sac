unit Modelo.Dominio.NFE.INFEReferenciaDevolucaoDominio;

interface
 uses
  ADODB;
  type
    INFEReferenciaDevolucaoDominio = interface
      ['{4F437BA5-3F4F-41C5-A9D1-CCBD42286EA0}']

       function gravar(CodigoNFEntrada, codigoPedido: Integer; var Query : TADOQuery): Boolean;

       function remover(Codigo, CodigoPedido: Integer; var Query : TADOQuery): Boolean;

       function carregarReferenciaDevolucaoPorPedido(CodPedido: Integer; var Query: TADOQuery): Boolean;

       function removerTodasReferenciaDevolucao(CodigoPedido : Integer; var Query : TADOQuery) : Boolean;

    end;

implementation

end.
