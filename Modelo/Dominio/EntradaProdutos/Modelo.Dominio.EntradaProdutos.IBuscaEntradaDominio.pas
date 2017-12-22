unit Modelo.Dominio.EntradaProdutos.IBuscaEntradaDominio;

interface
  uses
    ADODB;
  type
    IBuscaEntradaDominio = interface
      ['{2B35D531-918F-4003-9DBF-DE0CE0CB5A42}']

      function buscarEntradaProdutos(condicao: String; buscarPor, ordernarPor : Integer; Query : TADOQuery): TADOQuery;

      function buscarEntradaReferenciaDevolucao(condicao, codFornecedor: String; buscarPor, ordernarPor : Integer; Query : TADOQuery): TADOQuery;


    end;

implementation

end.
