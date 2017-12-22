unit Modelo.Entidade.TOperacaoBancaria;

interface
  type
    TOperacaoBancariaEntidade = class
    private
      FCodigo: integer;
      FOperacao: AnsiString;
      FTipo: AnsiString;
      FDataCadastro: TDate;

      procedure SetCodigo(const Value: integer);
      procedure SetDataCadastro(const Value: TDate);
      procedure SetOperacao(const Value: AnsiString);
      procedure SetTipo(const Value: AnsiString);
    public
      property Codigo: integer read FCodigo write SetCodigo;
      property Operacao: AnsiString read FOperacao write SetOperacao;
      property Tipo: AnsiString read FTipo write SetTipo;
      property DataCadastro: TDate read FDataCadastro write SetDataCadastro;


    end;
implementation

{ TOperacaoBancariaEntidade }

procedure TOperacaoBancariaEntidade.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TOperacaoBancariaEntidade.SetDataCadastro(const Value: TDate);
begin
  FDataCadastro := Value;
end;

procedure TOperacaoBancariaEntidade.SetOperacao(const Value: AnsiString);
begin
  FOperacao := Value;
end;

procedure TOperacaoBancariaEntidade.SetTipo(const Value: AnsiString);
begin
  FTipo := Value;
end;

end.
