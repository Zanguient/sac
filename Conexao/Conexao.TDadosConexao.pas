unit Conexao.TDadosConexao;

interface

type
  TDadosConexao = class

    private

      FUsuario: String;
      FBanco: String;
      FServidor: String;
      FCaminhoServidor: String;

      procedure SetBanco(const Value: String);
      procedure SetCaminhoServidor(const Value: String);
      procedure SetServidor(const Value: String);
      procedure SetUsuario(const Value: String);

    public
      property Usuario: String read FUsuario write SetUsuario;
      property Banco: String read FBanco write SetBanco;
      property Servidor: String read FServidor write SetServidor;
      property CaminhoServidor: String read FCaminhoServidor write SetCaminhoServidor;


  end;
implementation

{ TDadosConexao }

procedure TDadosConexao.SetBanco(const Value: String);
begin
  FBanco := Value;
end;

procedure TDadosConexao.SetCaminhoServidor(const Value: String);
begin
  FCaminhoServidor := Value;
end;

procedure TDadosConexao.SetServidor(const Value: String);
begin
  FServidor := Value;
end;

procedure TDadosConexao.SetUsuario(const Value: String);
begin
  FUsuario := Value;
end;

end.
