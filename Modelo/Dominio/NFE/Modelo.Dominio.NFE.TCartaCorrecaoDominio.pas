unit Modelo.Dominio.NFE.TCartaCorrecaoDominio;

interface

uses
  Modelo.Entidade.NFE.TCartaCorrecaoEntidade, Modelo.DAO.NFE.TCartaCorrecao,
  ADODB;
  type
    TCartaCorrecaoDominio = class
    private
      FCC: TCartaCorrecaoEntidade;
      FCCDAO: TCartaCorrecaoDAO;
      Conexao: TADOConnection;
    public
      public function gravaCartaCorrecao(FCC: TCartaCorrecaoEntidade): boolean;
      constructor Create(var Conexao: TADOConnection);
    end;

implementation

{ TCartaCorrecaoDominio }

constructor TCartaCorrecaoDominio.Create(var Conexao: TADOConnection);
begin
  //inherited;
  Self.Conexao:= Conexao;
  FCCDAO:= TCartaCorrecaoDAO.Create(Conexao);
end;

function TCartaCorrecaoDominio.gravaCartaCorrecao(
  FCC: TCartaCorrecaoEntidade): boolean;
begin
  result:= FCCDAO.gravaCartaCorrecao(FCC);
end;

end.
