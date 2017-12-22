unit Modelo.Entidade.TabelaPreco;

interface

  type
    TTabelaPrecoEntidade = class
      private
        FCodigo: integer;
        FCodigoEmpresa: integer;
        FDescricao: AnsiString;
        FDataCadastro: TDateTime;
        FDataValidade: TDateTime;
        FTipo: AnsiString;
        FTipoCalculo: AnsiString;
        FPercentual_Vista: Double;
        FPercentual_Prazo: Double;
        FAtalho: AnsiString;
        FTipoValor: integer;

        procedure SetAtalho(const Value: AnsiString);
        procedure SetCodigo(const Value: integer);
        procedure SetCodigoEmpresa(const Value: integer);
        procedure SetDataCadastro(const Value: TDateTime);
        procedure SetDataValidade(const Value: TDateTime);
        procedure SetDescricao(const Value: AnsiString);
        procedure SetPercentual_Prazo(const Value: Double);
        procedure SetPercentual_Vista(const Value: Double);
        procedure SetTipo(const Value: AnsiString);
        procedure SetTipoCalculo(const Value: AnsiString);
        procedure SetTipoValor(const Value: integer);

        public

        property Codigo: integer read FCodigo write SetCodigo;
        property CodigoEmpresa: integer read FCodigoEmpresa write SetCodigoEmpresa;
        property Descricao: AnsiString read FDescricao write SetDescricao;
        property DataCadastro: TDateTime read FDataCadastro write SetDataCadastro;
        property DataValidade: TDateTime read FDataValidade write SetDataValidade;
        property Tipo: AnsiString read FTipo write SetTipo;
        property TipoCalculo: AnsiString read FTipoCalculo write SetTipoCalculo;
        property Percentual_Vista: Double read FPercentual_Vista write SetPercentual_Vista;
        property Percentual_Prazo: Double read FPercentual_Prazo write SetPercentual_Prazo;
        property Atalho: AnsiString read FAtalho write SetAtalho;
        property TipoValor: integer read FTipoValor write SetTipoValor;


    end;
implementation

{ TTabelaPrecoEntidade }

procedure TTabelaPrecoEntidade.SetAtalho(const Value: AnsiString);
begin
  FAtalho := Value;
end;

procedure TTabelaPrecoEntidade.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TTabelaPrecoEntidade.SetCodigoEmpresa(const Value: integer);
begin
  FCodigoEmpresa := Value;
end;

procedure TTabelaPrecoEntidade.SetDataCadastro(const Value: TDateTime);
begin
  FDataCadastro := Value;
end;

procedure TTabelaPrecoEntidade.SetDataValidade(const Value: TDateTime);
begin
  FDataValidade := Value;
end;

procedure TTabelaPrecoEntidade.SetDescricao(const Value: AnsiString);
begin
  FDescricao := Value;
end;

procedure TTabelaPrecoEntidade.SetPercentual_Prazo(const Value: Double);
begin
  FPercentual_Prazo := Value;
end;

procedure TTabelaPrecoEntidade.SetPercentual_Vista(const Value: Double);
begin
  FPercentual_Vista := Value;
end;

procedure TTabelaPrecoEntidade.SetTipo(const Value: AnsiString);
begin
  FTipo := Value;
end;

procedure TTabelaPrecoEntidade.SetTipoCalculo(const Value: AnsiString);
begin
  FTipoCalculo := Value;
end;

procedure TTabelaPrecoEntidade.SetTipoValor(const Value: integer);
begin
  FTipoValor := Value;
end;

end.
