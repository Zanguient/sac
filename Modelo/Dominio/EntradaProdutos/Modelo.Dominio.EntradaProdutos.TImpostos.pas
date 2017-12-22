unit Modelo.Dominio.EntradaProdutos.TImpostos;

interface

uses
  Entidade.TImpostosEntrada, ADODB, Modelo.DAO.EntradaProdutos.TImpostos;
  type
    TImpostosEntradaDominio = class
      private
        Conexao: TADOConnection;
        FImpostosDAO: TImpostosEntradaDAO;
      public
        function gravar(FEntradas: TImpostosEntradaEntidade): boolean;
        function alterar(FEntradas: TImpostosEntradaEntidade): boolean;
        function remover(CodigoEntrada: integer): boolean;
        constructor Create(var Conexao: TADOConnection);

    end;
implementation

uses
  Util.TLog;

{ TImpostosEntradaDominio }

function TImpostosEntradaDominio.alterar(
  FEntradas: TImpostosEntradaEntidade): boolean;
begin
  try
    FImpostosDAO.alterar(FEntradas);
  finally

  end;
end;

constructor TImpostosEntradaDominio.Create(var Conexao: TADOConnection);
begin
  self.Conexao:= Conexao;
  FImpostosDAO:= TImpostosEntradaDAO.Create(Conexao);
end;

function TImpostosEntradaDominio.gravar(
  FEntradas: TImpostosEntradaEntidade): boolean;
begin
  try
    FImpostosDAO.gravar(FEntradas);
  finally

  end;
end;

function TImpostosEntradaDominio.remover(CodigoEntrada: integer): boolean;
begin
  try
    Tlog.Info(' --- MÉTODO remover ---');
    FImpostosDAO.remover(CodigoEntrada);
        Tlog.Info(' --- FIM MÉTODO remover ---');
  finally

  end;
end;

end.
