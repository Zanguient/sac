unit Modelo.DAO.EntradaProdutos.TImpostos;

interface

uses
  Entidade.TImpostosEntrada, ADODB, Modelo.Entidade.ComandosSQL,
  Modelo.Dominio.ComandosSQL;
  type
    TImpostosEntradaDAO = class
      private
        FComando: TComandoSQLEntidade;
        FComandoSQLDom: TComandoSQLDominio;
        Conexao: TADOConnection;
      public
        function gravar(FEntradas: TImpostosEntradaEntidade): boolean;
        function alterar(FEntradas: TImpostosEntradaEntidade): boolean;
        function remover(CodigoEntrada: integer): boolean;
        constructor Create(var Conexao: TADOConnection);

    end;
implementation

{ TImpostosDAO }

function TImpostosEntradaDAO.alterar(FEntradas: TImpostosEntradaEntidade): boolean;
var
  comando: AnsiString;
begin
  comando:=
          'Update Impostos_Entrada set N_Nota_Fiscal = :N_Nota_Fiscal, Total_Produtos = :Total_Produtos, Base_ICMS = :Base_ICMS,'+
          'Valor_ICMS = :Valor_ICMS, Isento_ICMS = :Isento_ICMS, Outros_ICMS = :Outros_ICMS, '+
          'Base_ICMS_Subs = :Base_ICMS_Subs, Valor_ICMS_Subs = :Valor_ICMS_Subs, Aliquota = :Aliquota,'+
          'Valor_Frete = :Valor_Frete, Valor_Seguro = :Valor_Seguro, Outras_Despesas = :Outras_Despesas,'+
          'Total_IPI = :Total_IPI, Isento_IPI = :Isento_IPI, Outros_IPI = :Outros_IPI, '+
          'Desconto = :Desconto, Total_Nota = :Total_Nota, Custo_Total = :Custo_Total '+
          'where Codigo = :Codigo';

  FComando:= TComandoSQLEntidade.Create;
  FComando.Conexao:= Conexao;
  FComando.ComandoSQL:= comando;
  FComando.Parametros.Add('N_Nota_Fiscal');
  FComando.Parametros.Add('Total_Produtos');
  FComando.Parametros.Add('Base_ICMS');
  FComando.Parametros.Add('Valor_ICMS');
  FComando.Parametros.Add('Isento_ICMS');
  FComando.Parametros.Add('Outros_ICMS');
  FComando.Parametros.Add('Base_ICMS_Subs');
  FComando.Parametros.Add('Valor_ICMS_Subs');
  FComando.Parametros.Add('Aliquota');
  FComando.Parametros.Add('Valor_Frete');
  FComando.Parametros.Add('Valor_Seguro');
  FComando.Parametros.Add('Outras_Despesas');
  FComando.Parametros.Add('Total_IPI');
  FComando.Parametros.Add('Isento_IPI');
  FComando.Parametros.Add('Outros_IPI');
  FComando.Parametros.Add('Desconto');
  FComando.Parametros.Add('Total_Nota');
  FComando.Parametros.Add('Custo_Total');
  FComando.Parametros.Add('Codigo');
  FComando.Valores.Add(FEntradas.N_Nota_Fiscal);
  FComando.Valores.Add(FEntradas.Total_Produtos);
  FComando.Valores.Add(FEntradas.Base_ICMS);
  FComando.Valores.Add(FEntradas.Valor_ICMS);
  FComando.Valores.Add(FEntradas.Isento_ICMS);
  FComando.Valores.Add(FEntradas.Outros_ICMS);
  FComando.Valores.Add(FEntradas.Base_ICMS_Subs);
  FComando.Valores.Add(FEntradas.Valor_ICMS_Subs);
  FComando.Valores.Add(FEntradas.Aliquota);
  FComando.Valores.Add(FEntradas.Valor_Frete);
  FComando.Valores.Add(FEntradas.Valor_Seguro);
  FComando.Valores.Add(FEntradas.Outras_Despesas);
  FComando.Valores.Add(FEntradas.Total_IPI);
  FComando.Valores.Add(FEntradas.Isento_IPI);
  FComando.Valores.Add(FEntradas.Outros_IPI);
  FComando.Valores.Add(FEntradas.Desconto);
  FComando.Valores.Add(FEntradas.Total_Nota);
  FComando.Valores.Add(FEntradas.Custo_Total);
  FComando.Valores.Add(FEntradas.Codigo);
  FComandoSQLDom:= TComandoSQLDominio.Create(FComando);
  FComandoSQLDom.ExecutaComandoSQLSalvarAlterarExcluir;
end;

constructor TImpostosEntradaDAO.Create(var Conexao: TADOConnection);
begin
  self.Conexao:= Conexao;
end;

function TImpostosEntradaDAO.gravar(FEntradas: TImpostosEntradaEntidade): boolean;
var
  comando: AnsiString;
begin
  comando:=
          'Insert into Impostos_Entrada (Codigo, N_Nota_Fiscal, Total_Produtos, Base_ICMS, Valor_ICMS, Isento_ICMS, Outros_ICMS,'+
          'Base_ICMS_Subs, Valor_ICMS_Subs, Aliquota, Valor_Frete, Valor_Seguro, Outras_Despesas, '+
          'Total_IPI, Isento_IPI, Outros_IPI, Desconto, Total_Nota, Custo_Total)'+
          'values (:Codigo, :N_Nota_Fiscal, :Total_Produtos, :Base_ICMS, :Valor_ICMS, :Isento_ICMS, :Outros_ICMS, :Base_ICMS_Subs,'+
          ':Valor_ICMS_Subs, :Aliquota, :Valor_Frete, :Valor_Seguro, :Outras_Despesas,'+
          ':Total_IPI, :Isento_IPI, :Outros_IPI, :Desconto, :Total_Nota, :Custo_Total)';

  FComando:= TComandoSQLEntidade.Create;
  FComando.Conexao:= Conexao;
  FComando.ComandoSQL:= comando;
  FComando.Parametros.Add('Codigo');
  FComando.Parametros.Add('N_Nota_Fiscal');
  FComando.Parametros.Add('Total_Produtos');
  FComando.Parametros.Add('Base_ICMS');
  FComando.Parametros.Add('Valor_ICMS');
  FComando.Parametros.Add('Isento_ICMS');
  FComando.Parametros.Add('Outros_ICMS');
  FComando.Parametros.Add('Base_ICMS_Subs');
  FComando.Parametros.Add('Valor_ICMS_Subs');
  FComando.Parametros.Add('Aliquota');
  FComando.Parametros.Add('Valor_Frete');
  FComando.Parametros.Add('Valor_Seguro');
  FComando.Parametros.Add('Outras_Despesas');
  FComando.Parametros.Add('Total_IPI');
  FComando.Parametros.Add('Isento_IPI');
  FComando.Parametros.Add('Outros_IPI');
  FComando.Parametros.Add('Desconto');
  FComando.Parametros.Add('Total_Nota');
  FComando.Parametros.Add('Custo_Total');
  FComando.Valores.Add(FEntradas.Codigo);
  FComando.Valores.Add(FEntradas.N_Nota_Fiscal);
  FComando.Valores.Add(FEntradas.Total_Produtos);
  FComando.Valores.Add(FEntradas.Base_ICMS);
  FComando.Valores.Add(FEntradas.Valor_ICMS);
  FComando.Valores.Add(FEntradas.Isento_ICMS);
  FComando.Valores.Add(FEntradas.Outros_ICMS);
  FComando.Valores.Add(FEntradas.Base_ICMS_Subs);
  FComando.Valores.Add(FEntradas.Valor_ICMS_Subs);
  FComando.Valores.Add(FEntradas.Aliquota);
  FComando.Valores.Add(FEntradas.Valor_Frete);
  FComando.Valores.Add(FEntradas.Valor_Seguro);
  FComando.Valores.Add(FEntradas.Outras_Despesas);
  FComando.Valores.Add(FEntradas.Total_IPI);
  FComando.Valores.Add(FEntradas.Isento_IPI);
  FComando.Valores.Add(FEntradas.Outros_IPI);
  FComando.Valores.Add(FEntradas.Desconto);
  FComando.Valores.Add(FEntradas.Total_Nota);
  FComando.Valores.Add(FEntradas.Custo_Total);
  FComandoSQLDom:= TComandoSQLDominio.Create(FComando);
  FComandoSQLDom.ExecutaComandoSQLSalvarAlterarExcluir;
end;

function TImpostosEntradaDAO.remover(CodigoEntrada: integer): boolean;
var
  comando: AnsiString;
begin
  comando:=
          'Delete from Impostos_Entrada where Codigo = :Codigo';

  FComando:= TComandoSQLEntidade.Create;
  FComando.Conexao:= Conexao;
  FComando.ComandoSQL:= comando;
  FComando.Parametros.Add('Codigo');
  FComando.Valores.Add(CodigoEntrada);
  FComandoSQLDom:= TComandoSQLDominio.Create(FComando);
  FComandoSQLDom.ExecutaComandoSQLSalvarAlterarExcluir;
end;

end.
