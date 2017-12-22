unit Modelo.Dominio.Estoque.IFichaEstoqueDominio;

interface
 uses
  Modelo.Entidade.Estoque.TFichaEstoque,ADODB,
  Modelo.Entidade.Estoque.TFichaEstoqueLista,
  Modelo.Entidade.NFE.TNFE;
  type
    IFichaEstoqueDominio = interface
      ['{E781F9C8-4613-40E1-B619-9B45B080C6A3}']

      function salvarFichaEstoque(FichaEstoque  : TFichaEstoque):Integer;

      function removerFichaEstoque(FichaEstoque  : TFichaEstoque):Boolean;

      function retornarFichaEstoqueLista(data : TDateTime; codigo, grupo:String):TFichaEstoqueLista;overload;

      function retornarFichaEstoque(data : TDateTime; codigo, grupo:String):TADOQuery;overload;

      function retornarFichaEstoquePorCodigo(codigo : Integer):TFichaEstoque;

      function atualizarEntradaComCodigoFichaEstoque(CodItemEntrada, codigo : Integer):Boolean;
    end;

implementation

end.
