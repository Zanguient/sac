unit Modelo.Dominio.ItensTabelaPrecoDominio;

interface

uses
  Modelo.Entidade.ItensTabelaPreco, Modelo.Entidade.TabelaPreco, ADODB,
  Modelo.DAO.ItensTabelaPreco;

  type
    TItensTabelaPrecoDominio = class
      private
        FItensTabelaPreco: TItensTabelaPrecoEntidade;
        FItensTabelaPrecoDAO: TItensTabelaPrecoDAO;
        FTabelaPreco: TTabelaPrecoEntidade;
        ValorBase, PLucro: double;
        TipoCalculo: integer;
        Conexao: TADOConnection;
      public
        constructor Create(PLucro, ValorBase: Double; TipoCalculo: integer; var Conexao: TADOConnection); overload;
        constructor Create(var Conexao: TADOConnection); overload;
        function CalculaPrecoVista(): double;
        function CalculaPrecoPrazo(): Double;
        function AtualizaValoresEntrada(FItemTabelaPreco: TItensTabelaPrecoEntidade): integer;
    end;
implementation

uses
  Util.Configs, SysUtils;

{ TItensTabelaPrecoDominio }

function TItensTabelaPrecoDominio.AtualizaValoresEntrada(
  FItemTabelaPreco: TItensTabelaPrecoEntidade): integer;
begin
  try
    FItensTabelaPrecoDAO.AtualizaValoresEntrada(FItemTabelaPreco);
  finally

  end;
end;

function TItensTabelaPrecoDominio.CalculaPrecoPrazo: Double;
var
  P, VAux, ValorPrazo: Double;
begin
  if (TipoCalculo = 0) then
  begin
    P:= PLucro / 100;
    VAux:= ValorBase * P;
    ValorPrazo:= ValorBase + VAux;
  end else begin
    P:= (100 - PLucro) / 100;
    ValorPrazo:= ValorBase / P;
  end;
  Result:= TConfigs.Calcula_Valor(FloatToStr(ValorPrazo));
end;

function TItensTabelaPrecoDominio.CalculaPrecoVista: double;
var
  P, VAux, ValorVista: Double;
begin
  if (TipoCalculo = 0) then
  begin
    P:= PLucro / 100;
    VAux:= ValorBase * P;
    ValorVista:= ValorBase + VAux;
  end else begin
    P:= (100 - PLucro) / 100;
    ValorVista:= ValorBase / P;
  end;
  Result:= TConfigs.Calcula_Valor(FloatToStr(ValorVista));
end;

constructor TItensTabelaPrecoDominio.Create(var Conexao: TADOConnection);
begin
  Self.Conexao := Conexao;
  FItensTabelaPrecoDAO:= TItensTabelaPrecoDAO.Create(Conexao);
end;

constructor TItensTabelaPrecoDominio.Create(PLucro, ValorBase: Double; TipoCalculo: integer; var Conexao: TADOConnection);
begin
  Self.Conexao := Conexao;
  Self.FItensTabelaPreco:= FItensTabelaPreco;
  Self.ValorBase:= ValorBase;
  Self.PLucro:= PLucro;
  Self.TipoCalculo:= TipoCalculo;
end;

end.
