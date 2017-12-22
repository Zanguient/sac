unit Modelo.Dominio.NFE.INFEDominio;

interface
 uses
  ADODB, Modelo.Entidade.Estoque.TFichaEstoque;
  type
    INFEDominio = interface
      ['{A1D28BDF-9F7C-4443-A8DC-49FEC2CAAF69}']

       function gravarRefernciaDevolucao(CodigoNFEntrada, codigoPedido : Integer; var Query : TADOQuery): Boolean;

       function removerReferenciaDevolucao(Codigo, CodigoPedido : Integer; var Query : TADOQuery) : Boolean;

       function removerTodasReferenciaDevolucao(CodigoPedido : Integer; var Query : TADOQuery) : Boolean;

       function carregarReferenciaDevolucaoPorPedido(CodPedido : Integer; var Query : TADOQuery): Boolean;

       function salvarFichaEstoque(CodItemPedido : Integer; fichaEstoque : TFichaEstoque):Boolean;

       function removerFichaEstoque(NumeroNF: Integer): Boolean;

       function removerPeloCodigoDoPedido(CodItemPedido : Integer):Boolean;

  end;

implementation

end.
