unit Modelo.DAO.TransporteNFe.TTransporteNFeDAO;

interface

uses
  Modelo.Entidade.TTransporteNFe, Modelo.Entidade.ComandosSQL,
  Modelo.Dominio.ComandosSQL, ADODB;
  type
    TTransporteNFeDAO = class
      private
        FComando: TComandoSQLEntidade;
        FComandoSQLDom: TComandoSQLDominio;
        Conexao: TADOConnection;
      public
        function gravar(FTransporte: TTransporteNFeEntidade): boolean;
        function alterar(FTransporte: TTransporteNFeEntidade): boolean;
        function remover(CodigoTransporte: integer): boolean;
        constructor Create(var Conexao: TADOConnection);

    end;
implementation

{ TTransporteNFeDAO }

function TTransporteNFeDAO.alterar(
  FTransporte: TTransporteNFeEntidade): boolean;
var
  comando: AnsiString;
begin
  comando:=
        'update Transporte_Entrada set'+
        '   N_Nota_Fiscal = :N_Nota_Fiscal'+
        '   ,Codigo_Transportadora = :Codigo_Transportadora'+
        '   ,Codigo_Veiculo = :Codigo_Veiculo'+
        '   ,Quantidade = :Quantidade'+
        '   ,Especie = :Especie'+
        '   ,Marca = :Marca'+
        '   ,Numero = :Numero'+
        '   ,Peso_Bruto = :Peso_Bruto'+
        '   ,Peso_Liquido = :Peso_Liquido '+
        'where Codigo = :Codigo';

  FComando:= TComandoSQLEntidade.Create;
  FComando.Conexao:= Conexao;
  FComando.ComandoSQL:= comando;
  FComando.Parametros.Add('N_Nota_Fiscal');
  FComando.Parametros.Add('Codigo_Transportadora');
  FComando.Parametros.Add('Codigo_Veiculo');
  FComando.Parametros.Add('Quantidade');
  FComando.Parametros.Add('Especie');
  FComando.Parametros.Add('Marca');
  FComando.Parametros.Add('Numero');
  FComando.Parametros.Add('Peso_Bruto');
  FComando.Parametros.Add('Peso_Liquido');
  FComando.Parametros.Add('Codigo');
  FComando.Valores.Add(FTransporte.N_Nota_Fiscal);
  FComando.Valores.Add(FTransporte.Codigo_Transportadora);
  FComando.Valores.Add(FTransporte.Codigo_Veiculo);
  FComando.Valores.Add(FTransporte.Quantidade);
  FComando.Valores.Add(FTransporte.Especie);
  FComando.Valores.Add(FTransporte.Marca);
  FComando.Valores.Add(FTransporte.Numero);
  FComando.Valores.Add(FTransporte.Peso_Bruto);
  FComando.Valores.Add(FTransporte.Peso_Liquido);
  FComando.Valores.Add(FTransporte.Codigo);
  FComandoSQLDom:= TComandoSQLDominio.Create(FComando);
  FComandoSQLDom.ExecutaComandoSQLSalvarAlterarExcluir;
end;

constructor TTransporteNFeDAO.Create(var Conexao: TADOConnection);
begin
  self.Conexao:= Conexao;
end;

function TTransporteNFeDAO.gravar(FTransporte: TTransporteNFeEntidade): boolean;
var
  comando: AnsiString;
begin
  comando:=
        'INSERT INTO Transporte_Entrada'+
        '   (Codigo'+
        '   ,N_Nota_Fiscal'+
        '   ,Codigo_Transportadora'+
        '   ,Codigo_Veiculo'+
        '   ,Quantidade'+
        '   ,Especie'+
        '   ,Marca'+
        '   ,Numero'+
        '   ,Peso_Bruto'+
        '   ,Peso_Liquido)'+
        'VALUES'+
        '   (:Codigo'+
        '   ,:N_Nota_Fiscal'+
        '   ,:Codigo_Transportadora'+
        '   ,:Codigo_Veiculo'+
        '   ,:Quantidade'+
        '   ,:Especie'+
        '   ,:Marca'+
        '   ,:Numero'+
        '   ,:Peso_Bruto'+
        '   ,:Peso_Liquido)';

  FComando:= TComandoSQLEntidade.Create;
  FComando.Conexao:= Conexao;
  FComando.ComandoSQL:= comando;
  FComando.Parametros.Add('Codigo');
  FComando.Parametros.Add('N_Nota_Fiscal');
  FComando.Parametros.Add('Codigo_Transportadora');
  FComando.Parametros.Add('Codigo_Veiculo');
  FComando.Parametros.Add('Quantidade');
  FComando.Parametros.Add('Especie');
  FComando.Parametros.Add('Marca');
  FComando.Parametros.Add('Numero');
  FComando.Parametros.Add('Peso_Bruto');
  FComando.Parametros.Add('Peso_Liquido');
  FComando.Valores.Add(FTransporte.Codigo);
  FComando.Valores.Add(FTransporte.N_Nota_Fiscal);
  FComando.Valores.Add(FTransporte.Codigo_Transportadora);
  FComando.Valores.Add(FTransporte.Codigo_Veiculo);
  FComando.Valores.Add(FTransporte.Quantidade);
  FComando.Valores.Add(FTransporte.Especie);
  FComando.Valores.Add(FTransporte.Marca);
  FComando.Valores.Add(FTransporte.Numero);
  FComando.Valores.Add(FTransporte.Peso_Bruto);
  FComando.Valores.Add(FTransporte.Peso_Liquido);
  FComandoSQLDom:= TComandoSQLDominio.Create(FComando);
  FComandoSQLDom.ExecutaComandoSQLSalvarAlterarExcluir;
end;

function TTransporteNFeDAO.remover(CodigoTransporte: integer): boolean;
var
  comando: AnsiString;
begin
  comando:=
        'Delete from Transporte_Entrada where Codigo = :Codigo';

  FComando:= TComandoSQLEntidade.Create;
  FComando.Conexao:= Conexao;
  FComando.ComandoSQL:= comando;
  FComando.Parametros.Add('Codigo');
  FComando.Valores.Add(CodigoTransporte);
  FComandoSQLDom:= TComandoSQLDominio.Create(FComando);
  FComandoSQLDom.ExecutaComandoSQLSalvarAlterarExcluir;
end;

end.
