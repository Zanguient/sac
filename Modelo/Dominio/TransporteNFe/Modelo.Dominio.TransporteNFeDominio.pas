unit Modelo.Dominio.TransporteNFeDominio;

interface

uses
  Modelo.Entidade.TTransporteNFe, ADODB,
  Modelo.DAO.TransporteNFe.TTransporteNFeDAO;
  type
    TTransporteNFeDominio = class
      private
        Conexao: TADOConnection;
        FTransporteNFeDAO: TTransporteNFeDAO;
      public
        function gravar(FTransporte: TTransporteNFeEntidade): boolean;
        function alterar(FTransporte: TTransporteNFeEntidade): boolean;
        function remover(CodigoTransporte: integer): boolean;
        constructor Create(var Conexao: TADOConnection);
    end;
implementation

uses
  Util.TLog;

{ TTransporteNFeDominio }

function TTransporteNFeDominio.alterar(
  FTransporte: TTransporteNFeEntidade): boolean;
begin
  try
    FTransporteNFeDAO.alterar(FTransporte);
  finally

  end;
end;

constructor TTransporteNFeDominio.Create(var Conexao: TADOConnection);
begin
  self.Conexao:= Conexao;
  FTransporteNFeDAO:= TTransporteNFeDAO.Create(Conexao);
end;

function TTransporteNFeDominio.gravar(
  FTransporte: TTransporteNFeEntidade): boolean;
begin
  try
    FTransporteNFeDAO.gravar(FTransporte);
  finally

  end;
end;

function TTransporteNFeDominio.remover(CodigoTransporte: integer): boolean;
begin
  try
    Tlog.Info(' --- MÉTODO remover ---');
    FTransporteNFeDAO.remover(CodigoTransporte);
    Tlog.Info(' --- FIM MÉTODO remover ---');
  finally

  end;
end;

end.
