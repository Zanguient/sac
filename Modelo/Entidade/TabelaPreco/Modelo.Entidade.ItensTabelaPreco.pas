unit Modelo.Entidade.ItensTabelaPreco;

interface

  type
    TItensTabelaPrecoEntidade = class
    private
      FCodigoRegistro: integer;
      FCodigo: integer;
      FCodigoProduto: integer;
      FPrecoVista: double;
      FPrecoPrazo: double;
      FPercentualDescontoVista: double;
      FPercentualDescontoPrazo: double;
      FPercentualLucroVista: Double;
      FPercentualLucroPrazo: double;
      FPercentualComissaoVista: Double;
      FPercentualComissaoPrazo: Double;

      procedure SetCodigo(const Value: integer);
      procedure SetCodigoProduto(const Value: integer);
      procedure SetCodigoRegistro(const Value: integer);
      procedure SetPercentualComissaoPrazo(const Value: Double);
      procedure SetPercentualComissaoVista(const Value: Double);
      procedure SetPercentualDescontoPrazo(const Value: double);
      procedure SetPercentualDescontoVista(const Value: double);
      procedure SetPercentualLucroPrazo(const Value: double);
      procedure SetPercentualLucroVista(const Value: Double);
      procedure SetPrecoPrazo(const Value: double);
      procedure SetPrecoVista(const Value: double);

    public
      property CodigoRegistro: integer read FCodigoRegistro write SetCodigoRegistro;
      property Codigo: integer read FCodigo write SetCodigo;
      property CodigoProduto: integer read FCodigoProduto write SetCodigoProduto;
      property PrecoVista: double read FPrecoVista write SetPrecoVista;
      property PrecoPrazo: double read FPrecoPrazo write SetPrecoPrazo;
      property PercentualDescontoVista: double read FPercentualDescontoVista write SetPercentualDescontoVista;
      property PercentualDescontoPrazo: double read FPercentualDescontoPrazo write SetPercentualDescontoPrazo;
      property PercentualLucroVista: Double read FPercentualLucroVista write SetPercentualLucroVista;
      property PercentualLucroPrazo: double read FPercentualLucroPrazo write SetPercentualLucroPrazo;
      property PercentualComissaoVista: Double read FPercentualComissaoVista write SetPercentualComissaoVista;
      property PercentualComissaoPrazo: Double read FPercentualComissaoPrazo write SetPercentualComissaoPrazo;


    end;
implementation

{ TItensTabelaPreco }

procedure TItensTabelaPrecoEntidade.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TItensTabelaPrecoEntidade.SetCodigoProduto(const Value: integer);
begin
  FCodigoProduto := Value;
end;

procedure TItensTabelaPrecoEntidade.SetCodigoRegistro(const Value: integer);
begin
  FCodigoRegistro := Value;
end;

procedure TItensTabelaPrecoEntidade.SetPercentualComissaoPrazo(const Value: Double);
begin
  FPercentualComissaoPrazo := Value;
end;

procedure TItensTabelaPrecoEntidade.SetPercentualComissaoVista(const Value: Double);
begin
  FPercentualComissaoVista := Value;
end;

procedure TItensTabelaPrecoEntidade.SetPercentualDescontoPrazo(const Value: double);
begin
  FPercentualDescontoPrazo := Value;
end;

procedure TItensTabelaPrecoEntidade.SetPercentualDescontoVista(const Value: double);
begin
  FPercentualDescontoVista := Value;
end;

procedure TItensTabelaPrecoEntidade.SetPercentualLucroPrazo(const Value: double);
begin
  FPercentualLucroPrazo := Value;
end;

procedure TItensTabelaPrecoEntidade.SetPercentualLucroVista(const Value: Double);
begin
  FPercentualLucroVista := Value;
end;

procedure TItensTabelaPrecoEntidade.SetPrecoPrazo(const Value: double);
begin
  FPrecoPrazo := Value;
end;

procedure TItensTabelaPrecoEntidade.SetPrecoVista(const Value: double);
begin
  FPrecoVista := Value;
end;

end.
