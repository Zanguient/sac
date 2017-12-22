unit Modelo.Entidade.Estoque.TFichaEstoque;

interface
  type
    TipoFichaEstoqueEnum = (ENTRADA, SAIDA);
    TipoDocumentoEnum = (NOTA_FISCAL_ENTRADA, CUPOM_FISCAL, NOTA_FISCAL_SAIDA);
    TFichaEstoque = class
      private
        FCodigo             : Integer;
        FDataLancamento     : TDateTime;
        FDataMovimentacao   : TDateTime;
        FTipoFichaEstoque   : TipoFichaEstoqueEnum;
        FTipoDocumento      : TipoDocumentoEnum;
        FNumDocumento       : string;
        FProdutoCodigo      : Integer;
        FQuantidade         : Double;
        FValorUnitario      : Double;
        FValorUnitarioTotal : Double;
        FPrecoVendaVista    : Double;
        FPrecoVendaPrazo    : Double;
        FQuantidadeTotal    : Double;
        FCustoMedio         : Double;
        FSaldo              : Double;
        FCodigoItemPedido   : Integer;
        FValorNota          : Double;

        procedure SetCodigo(const Value: Integer);
        procedure SetCustoMedio(const Value: Double);
        procedure SetDataLancamento(const Value: TDateTime);
        procedure SetDataMovimentacao(const Value: TDateTime);
        procedure SetPrecoVendaPrazo(const Value: Double);
        procedure SetPrecoVendaVista(const Value: Double);
        procedure SetQuantidade(const Value: Double);
        procedure SetQuantidadeTotal(const Value: Double);
        procedure SetSaldo(const Value: Double);
        procedure SetTipoFichaEstoque(const Value: TipoFichaEstoqueEnum);
        procedure SetTipoDocumento(const Value: TipoDocumentoEnum);
        procedure SetNumDocumento(const Value: string);
        procedure SetProdutoCodigo(const Value: Integer);
        procedure SetValorUnitario(const Value: Double);
        procedure SetValorUnitarioTotal(const Value: Double);
        procedure SetCodigoItemPedido(const Value: Integer);
        procedure SetValorNota(const Value: Double);
      public

        property Codigo           : Integer read FCodigo write SetCodigo;
        property DataLancamento   : TDateTime read FDataLancamento write SetDataLancamento;
        property DataMovimentacao : TDateTime read FDataMovimentacao write SetDataMovimentacao;
        property TipoFichaEstoque : TipoFichaEstoqueEnum read FTipoFichaEstoque write SetTipoFichaEstoque;
        property Quantidade       : Double read FQuantidade write SetQuantidade;
        property PrecoVendaVista  : Double read FPrecoVendaVista write SetPrecoVendaVista;
        property PrecoVendaPrazo  : Double read FPrecoVendaPrazo write SetPrecoVendaPrazo;
        property QuantidadeTotal  : Double read FQuantidadeTotal write SetQuantidadeTotal;
        property CustoMedio       : Double read FCustoMedio write SetCustoMedio;
        property Saldo            : Double read FSaldo write SetSaldo;
        property TipoDocumento    : TipoDocumentoEnum read FTipoDocumento write SetTipoDocumento;
        property NumDocumento     : string read FNumDocumento write SetNumDocumento;
        property ProdutoCodigo    : Integer read FProdutoCodigo write SetProdutoCodigo;
        property ValorUnitario      : Double read FValorUnitario write SetValorUnitario;
        property ValorUnitarioTotal : Double read FValorUnitarioTotal write SetValorUnitarioTotal;
        property CodigoItemPedido   : Integer read FCodigoItemPedido write SetCodigoItemPedido;
        property ValorNota        : Double read FValorNota write SetValorNota;

    end;

implementation

{ TFichaEstoque }

procedure TFichaEstoque.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TFichaEstoque.SetCodigoItemPedido(const Value: Integer);
begin
  FCodigoItemPedido := Value;
end;

procedure TFichaEstoque.SetCustoMedio(const Value: Double);
begin
  FCustoMedio := Value;
end;

procedure TFichaEstoque.SetValorNota(const Value: Double);
begin
  FValorNota := Value;
end;

procedure TFichaEstoque.SetDataLancamento(const Value: TDateTime);
begin
  FDataLancamento := Value;
end;

procedure TFichaEstoque.SetDataMovimentacao(const Value: TDateTime);
begin
  FDataMovimentacao := Value;
end;

procedure TFichaEstoque.SetNumDocumento(const Value: string);
begin
  FNumDocumento := Value;
end;

procedure TFichaEstoque.SetPrecoVendaPrazo(const Value: Double);
begin
  FPrecoVendaPrazo := Value;
end;

procedure TFichaEstoque.SetPrecoVendaVista(const Value: Double);
begin
  FPrecoVendaVista := Value;
end;

procedure TFichaEstoque.SetProdutoCodigo(const Value: Integer);
begin
  FProdutoCodigo := Value;
end;

procedure TFichaEstoque.SetQuantidade(const Value: Double);
begin
  FQuantidade := Value;
end;

procedure TFichaEstoque.SetQuantidadeTotal(const Value: Double);
begin
  FQuantidadeTotal := Value;
end;

procedure TFichaEstoque.SetSaldo(const Value: Double);
begin
  FSaldo := Value;
end;

procedure TFichaEstoque.SetTipoDocumento(const Value: TipoDocumentoEnum);
begin
  FTipoDocumento := Value;
end;

procedure TFichaEstoque.SetTipoFichaEstoque(const Value: TipoFichaEstoqueEnum);
begin
  FTipoFichaEstoque := Value;
end;

procedure TFichaEstoque.SetValorUnitario(const Value: Double);
begin
  FValorUnitario := Value;
end;

procedure TFichaEstoque.SetValorUnitarioTotal(const Value: Double);
begin
  FValorUnitarioTotal := Value;
end;

end.
