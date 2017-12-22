unit Modelo.Entidade.TTransporteNFe;

interface
  type
    TTransporteNFeEntidade = class
    private
      FCodigo: integer;
      FN_Nota_Fiscal: AnsiString;
      FCodigo_Transportadora: integer;
      FCodigo_Veiculo: integer;
      FQuantidade: double;
      FEspecie: AnsiString;
      FMarca: AnsiString;
      FNumero: AnsiString;
      FPeso_Bruto: Double;
      FPeso_Liquido: double;

      procedure SetCodigo(const Value: integer);
      procedure SetCodigo_Transportadora(const Value: integer);
      procedure SetCodigo_Veiculo(const Value: integer);
      procedure SetEspecie(const Value: AnsiString);
      procedure SetMarca(const Value: AnsiString);
      procedure SetN_Nota_Fiscal(const Value: AnsiString);
      procedure SetNumero(const Value: AnsiString);
      procedure SetPeso_Bruto(const Value: Double);
      procedure SetPeso_Liquido(const Value: double);
      procedure SetQuantidade(const Value: double);

    public
      property Codigo: integer read FCodigo write SetCodigo;
      property N_Nota_Fiscal: AnsiString read FN_Nota_Fiscal write SetN_Nota_Fiscal;
      property Codigo_Transportadora: integer read FCodigo_Transportadora write SetCodigo_Transportadora;
      property Codigo_Veiculo: integer read FCodigo_Veiculo write SetCodigo_Veiculo;
      property Quantidade: double read FQuantidade write SetQuantidade;
      property Especie: AnsiString read FEspecie write SetEspecie;
      property Marca: AnsiString read FMarca write SetMarca;
      property Numero: AnsiString read FNumero write SetNumero;
      property Peso_Bruto: Double read FPeso_Bruto write SetPeso_Bruto;
      property Peso_Liquido: double read FPeso_Liquido write SetPeso_Liquido;

    end;
implementation

{ TTransporteNFeEntidade }

procedure TTransporteNFeEntidade.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TTransporteNFeEntidade.SetCodigo_Transportadora(const Value: integer);
begin
  FCodigo_Transportadora := Value;
end;

procedure TTransporteNFeEntidade.SetCodigo_Veiculo(const Value: integer);
begin
  FCodigo_Veiculo := Value;
end;

procedure TTransporteNFeEntidade.SetEspecie(const Value: AnsiString);
begin
  FEspecie := Value;
end;

procedure TTransporteNFeEntidade.SetMarca(const Value: AnsiString);
begin
  FMarca := Value;
end;

procedure TTransporteNFeEntidade.SetNumero(const Value: AnsiString);
begin
  FNumero := Value;
end;

procedure TTransporteNFeEntidade.SetN_Nota_Fiscal(const Value: AnsiString);
begin
  FN_Nota_Fiscal := Value;
end;

procedure TTransporteNFeEntidade.SetPeso_Bruto(const Value: Double);
begin
  FPeso_Bruto := Value;
end;

procedure TTransporteNFeEntidade.SetPeso_Liquido(const Value: double);
begin
  FPeso_Liquido := Value;
end;

procedure TTransporteNFeEntidade.SetQuantidade(const Value: double);
begin
  FQuantidade := Value;
end;

end.
