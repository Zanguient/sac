unit Modelo.Entidade.ComandosSQL;

interface

uses
  System.Generics.Collections, Data.Win.ADODB;

  type
    TComandoSQLEntidade = class
    private
      FConexao: TADOConnection;
      FComandoSQL: String;
      FParametros: TList<WideString>;
      FValores: TList<Variant>;
      procedure SetComandoSQL(const Value: String);
      procedure SetConexao(const Value: TADOConnection);
      procedure SetParametros(const Value: TList<WideString>);
      procedure SetValores(const Value: TList<Variant>);
    public
      constructor Create;
      property Conexao : TADOConnection read FConexao write SetConexao;
      property ComandoSQL: String read FComandoSQL write SetComandoSQL;
      property Parametros: TList<WideString> read FParametros write SetParametros;
      property Valores: TList<Variant> read FValores write SetValores;

    end;

implementation

{ TComandoSQL }

constructor TComandoSQLEntidade.Create;
begin
  Parametros := TList<WideString>.Create;
  Valores := TList<Variant>.Create;
end;

procedure TComandoSQLEntidade.SetComandoSQL(const Value: String);
begin
  FComandoSQL := Value;
end;

procedure TComandoSQLEntidade.SetConexao(const Value: TADOConnection);
begin
  FConexao := Value;
end;

procedure TComandoSQLEntidade.SetParametros(const Value: TList<WideString>);
begin
  FParametros := Value;
end;

procedure TComandoSQLEntidade.SetValores(const Value: TList<Variant>);
begin
  FValores := Value;
end;

end.
