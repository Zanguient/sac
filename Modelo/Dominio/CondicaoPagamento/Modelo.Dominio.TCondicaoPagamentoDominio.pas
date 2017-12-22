unit Modelo.Dominio.TCondicaoPagamentoDominio;

interface
  uses Modelo.DAO.TCondicaoPagamentoDAO,
    Modelo.Entidade.TCondicaoPagamentoEntidade, ADODB;

  type
    TCondicaoPagamentoDominio = class
      private
        FCondicaoPagamentoEntidade : TCondicaoPagamentoEntidade;
        FCondicaoPagamentoDAO : TCondicaoPagamentoDAO;
        Conexao: TADOConnection;
      public
        constructor Create(var Conexao: TADOConnection);
        function CarregaDadosCondicao(CodigoCondicao: integer): TCondicaoPagamentoEntidade; overload;
        function CarregaDadosCondicao(DescricaoCondicao: AnsiString): TCondicaoPagamentoEntidade; overload;
        function RetornaCodigoCondicao(CPE: TCondicaoPagamentoEntidade): integer;

    end;

implementation

{ TCondicaoPagamentoDominio }

function TCondicaoPagamentoDominio.CarregaDadosCondicao(
  CodigoCondicao: integer): TCondicaoPagamentoEntidade;
begin
  Result:= FCondicaoPagamentoDAO.CarregaDadosCondicao(CodigoCondicao);
end;

function TCondicaoPagamentoDominio.CarregaDadosCondicao(
  DescricaoCondicao: AnsiString): TCondicaoPagamentoEntidade;
begin
  Result:= FCondicaoPagamentoDAO.CarregaDadosCondicao(DescricaoCondicao);
end;

constructor TCondicaoPagamentoDominio.Create(var Conexao: TADOConnection);
begin
  Self.Conexao:= Conexao;
  FCondicaoPagamentoDAO := TCondicaoPagamentoDAO.Create(Conexao);
end;

function TCondicaoPagamentoDominio.RetornaCodigoCondicao(
  CPE: TCondicaoPagamentoEntidade): integer;
begin
  Result := CPE.Codigo;
end;

end.
