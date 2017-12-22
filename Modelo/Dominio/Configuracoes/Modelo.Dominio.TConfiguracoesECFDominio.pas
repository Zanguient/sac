unit Modelo.Dominio.TConfiguracoesECFDominio;

interface

uses
  Modelo.Entidade.TConfiguracoesECFEntidade, Modelo.DAO.TConfiguracoesECFDAO, ADODB, System.Generics.Collections;
  type
    TConfiguracoesECFDominio = class
    private
      FConfigEntidade: TConfiguracoesECFEntidade;
      FConfigDAO: TConfiguracoesECFDAO;
      Conexao: TADOConnection;
      procedure SetConfigDAO(const Value: TConfiguracoesECFDAO);
      procedure SetConfigEntidade(const Value: TConfiguracoesECFEntidade);

    public
      constructor Create(var Conexao: TADOConnection);
      public function gravaConfiguracoesECF(Config: TConfiguracoesECFEntidade): Boolean;
      function retornaConfiguracaoECF(N_Fabricacao: AnsiString): TList<String>;
      function verificaECFConfigurado(N_Fabricacao: AnsiString): boolean;
    end;

implementation

{ TConfiguracoesECFDominio }

constructor TConfiguracoesECFDominio.Create(var Conexao: TADOConnection);
begin
  Self.Conexao:= Conexao;
  if not (Assigned(FConfigEntidade)) then
    FConfigEntidade:= TConfiguracoesECFEntidade.Create;

  if not (Assigned(FConfigDAO)) then
    FConfigDAO:= TConfiguracoesECFDAO.Create(Conexao);


end;

function TConfiguracoesECFDominio.gravaConfiguracoesECF(
  Config: TConfiguracoesECFEntidade): Boolean;
begin
  FConfigDAO.gravaConfiguracao(Config);
end;

function TConfiguracoesECFDominio.retornaConfiguracaoECF(
  N_Fabricacao: AnsiString): TList<String>;
begin
  Result:= FConfigDAO.retornaConfiguracaoECF(N_Fabricacao);
end;

procedure TConfiguracoesECFDominio.SetConfigDAO(
  const Value: TConfiguracoesECFDAO);
begin

end;

procedure TConfiguracoesECFDominio.SetConfigEntidade(
  const Value: TConfiguracoesECFEntidade);
begin

end;

function TConfiguracoesECFDominio.verificaECFConfigurado(
  N_Fabricacao: AnsiString): boolean;
begin
  Result:= FConfigDAO.verificaECFConfigurado(N_Fabricacao);
end;

end.
