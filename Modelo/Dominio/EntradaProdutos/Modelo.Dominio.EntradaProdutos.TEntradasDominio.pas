unit Modelo.Dominio.EntradaProdutos.TEntradasDominio;

interface

uses
  Entidade.TEntradas, ADODB, Modelo.DAO.EntradaProdutosTEntradas;
  type
    TEntradasDominio = class
      private
        Conexao: TADOConnection;
        FEntradasDAO: TEntradasDAO;
      public
        function gravar(FEntradas: TEntradasEntidade): boolean;
        function alterar(FEntradas: TEntradasEntidade): boolean;
        function remover(CodigoEntrada: integer): boolean;
        function VerificaNotaFinalizada(CodigoNota: integer): Boolean;
        constructor Create(var Conexao: TADOConnection);
    end;
implementation

uses
  Util.TLog;

{ TEntradasDominio }

function TEntradasDominio.alterar(FEntradas: TEntradasEntidade): boolean;
begin
  try
    FEntradasDAO.alterar(FEntradas);
  finally

  end;
end;

constructor TEntradasDominio.Create(var Conexao: TADOConnection);
begin
  Self.Conexao:= Conexao;
  FEntradasDAO:= TEntradasDAO.Create(Conexao);
end;

function TEntradasDominio.gravar(FEntradas: TEntradasEntidade): boolean;
begin
  try
    FEntradasDAO.gravar(FEntradas);
  finally

  end;
end;

function TEntradasDominio.remover(CodigoEntrada: integer): boolean;
begin
  try
    tlog.Info('--- MÉTODO remover ---');
    FEntradasDAO.remover(CodigoEntrada);
    tlog.Info('--- FIM MÉTODO remover ---');
  finally

  end;
end;

function TEntradasDominio.VerificaNotaFinalizada(CodigoNota: integer): Boolean;
begin
  try
    TLog.Info('--- MÉTODO VerificaNotaFinalizada --- ');
    Result:= FEntradasDAO.VerificaNotaFinalizada(CodigoNota);
        tlog.Info('--- FIM MÉTODO VerificaNotaFinalizada ---');
  finally

  end;
end;

end.
