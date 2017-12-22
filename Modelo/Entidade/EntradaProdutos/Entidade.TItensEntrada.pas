unit Entidade.TItensEntrada;

interface
type
  TItensEntradaEntidade = class
    private
      FCodigo                    :Integer;
      FN_Item                    :AnsiString;
      FN_Nota_Fiscal             :AnsiString;
      FCodigo_Produto            :integer;
      FNCM                       :AnsiString;
      FUnidade                   :AnsiString;
      FST                        :AnsiString;
      FValor_Ultima_Compra       :double;
      FValor_Unitario            :Double;
      FQuantidade                :Double;
      FQuantidade_Restante       :double;
      FValor_Total               :double;
      FValor_Frete_Unitario      :double;
      FQuantidade_Volume         :double;
      FBC_ICMS                   :double;
      FAliquota_ICMS             :AnsiString;
      FAliquota_IPI              :AnsiString;
      FCFOP                      :AnsiString;
      FValor_ICMS_Unitario       :double;
      FValor_IPI                 :double;
      FCusto_Unitario            :double;
      FPercentual_Lucro_Vista    :double;
      FValor_Vista               :double;
      FPercentual_Lucro_Prazo    :double;
      FValor_Prazo               :double;
      FValor_Vista_Ultimo        :double;
      FValor_Prazo_Ultimo        :double;
      FIVA                       :double;
      FBC_ICMS_ST                :double;
      FValor_ICMS_ST             :double;
      FChecado                   :AnsiString;
      FCodigo_Produto_Fornecedor :AnsiString;
      FDescricao_Produto         :AnsiString;
      FValor_Ultima_Compra_Unitario :double;
      FQtde_Estoque_Atual        :double;
      FSaldo_Estoque_Atual       :double;
      FVolume_Atual              :double;
      FCodigo_Registro           :integer;
      FFicha_Estoque_Codigo      :integer;
      FData_Validade             :TDate;

      procedure SetAliquota_ICMS(const Value: AnsiString);
      procedure SetAliquota_IPI(const Value: AnsiString);
      procedure SetBC_ICMS(const Value: double);
      procedure SetBC_ICMS_ST(const Value: double);
      procedure SetCFOP(const Value: AnsiString);
      procedure SetChecado(const Value: AnsiString);
      procedure SetCodigo(const Value: Integer);
      procedure SetCodigo_Produto(const Value: integer);
      procedure SetCodigo_Produto_Fornecedor(const Value: AnsiString);
      procedure SetCodigo_Registro(const Value: integer);
      procedure SetCusto_Unitario(const Value: double);
      procedure SetData_Validade(const Value: TDate);
      procedure SetDescricao_Produto(const Value: AnsiString);
      procedure SetFicha_Estoque_Codigo(const Value: integer);
      procedure SetIVA(const Value: double);
      procedure SetN_Item(const Value: AnsiString);
      procedure SetN_Nota_Fiscal(const Value: AnsiString);
      procedure SetNCM(const Value: AnsiString);
      procedure SetPercentual_Lucro_Prazo(const Value: double);
      procedure SetPercentual_Lucro_Vista(const Value: double);
      procedure SetQtde_Estoque_Atual(const Value: double);
      procedure SetQuantidade(const Value: Double);
      procedure SetQuantidade_Restante(const Value: double);
      procedure SetQuantidade_Volume(const Value: double);
      procedure SetSaldo_Estoque_Atual(const Value: double);
      procedure SetST(const Value: AnsiString);
      procedure SetUnidade(const Value: AnsiString);
      procedure SetValor_Frete_Unitario(const Value: double);
      procedure SetValor_ICMS_ST(const Value: double);
      procedure SetValor_ICMS_Unitario(const Value: double);
      procedure SetValor_IPI(const Value: double);
      procedure SetValor_Prazo(const Value: double);
      procedure SetValor_Prazo_Ultimo(const Value: double);
      procedure SetValor_Total(const Value: double);
      procedure SetValor_Ultima_Compra(const Value: double);
      procedure SetValor_Ultima_Compra_Unitario(const Value: double);
      procedure SetValor_Unitario(const Value: Double);
      procedure SetValor_Vista(const Value: double);
      procedure SetValor_Vista_Ultimo(const Value: double);
      procedure SetVolume_Atual(const Value: double);

    public
      property Codigo                    :Integer read FCodigo write SetCodigo;
      property N_Item                    :AnsiString read FN_Item write SetN_Item;
      property N_Nota_Fiscal             :AnsiString read FN_Nota_Fiscal write SetN_Nota_Fiscal;
      property Codigo_Produto            :integer read FCodigo_Produto write SetCodigo_Produto;
      property NCM                       :AnsiString read FNCM write SetNCM;
      property Unidade                   :AnsiString read FUnidade write SetUnidade;
      property ST                        :AnsiString read FST write SetST;
      property Valor_Ultima_Compra       :double read FValor_Ultima_Compra write SetValor_Ultima_Compra;
      property Valor_Unitario            :Double read FValor_Unitario write SetValor_Unitario;
      property Quantidade                :Double read FQuantidade write SetQuantidade;
      property Quantidade_Restante       :double read FQuantidade_Restante write SetQuantidade_Restante;
      property Valor_Total               :double read FValor_Total write SetValor_Total;
      property Valor_Frete_Unitario      :double read FValor_Frete_Unitario write SetValor_Frete_Unitario;
      property Quantidade_Volume         :double read FQuantidade_Volume write SetQuantidade_Volume;
      property BC_ICMS                   :double read FBC_ICMS write SetBC_ICMS;
      property Aliquota_ICMS             :AnsiString read FAliquota_ICMS write SetAliquota_ICMS;
      property Aliquota_IPI              :AnsiString read FAliquota_IPI write SetAliquota_IPI;
      property CFOP                      :AnsiString read FCFOP write SetCFOP;
      property Valor_ICMS_Unitario       :double read FValor_ICMS_Unitario write SetValor_ICMS_Unitario;
      property Valor_IPI                 :double read FValor_IPI write SetValor_IPI;
      property Custo_Unitario            :double read FCusto_Unitario write SetCusto_Unitario;
      property Percentual_Lucro_Vista    :double read FPercentual_Lucro_Vista write SetPercentual_Lucro_Vista;
      property Valor_Vista               :double read FValor_Vista write SetValor_Vista;
      property Percentual_Lucro_Prazo    :double read FPercentual_Lucro_Prazo write SetPercentual_Lucro_Prazo;
      property Valor_Prazo               :double read FValor_Prazo write SetValor_Prazo;
      property Valor_Vista_Ultimo        :double read FValor_Vista_Ultimo write SetValor_Vista_Ultimo;
      property Valor_Prazo_Ultimo        :double read FValor_Prazo_Ultimo write SetValor_Prazo_Ultimo;
      property IVA                       :double read FIVA write SetIVA;
      property BC_ICMS_ST                :double read FBC_ICMS_ST write SetBC_ICMS_ST;
      property Valor_ICMS_ST             :double read FValor_ICMS_ST write SetValor_ICMS_ST;
      property Checado                   :AnsiString read FChecado write SetChecado;
      property Codigo_Produto_Fornecedor :AnsiString read FCodigo_Produto_Fornecedor write SetCodigo_Produto_Fornecedor;
      property Descricao_Produto         :AnsiString read FDescricao_Produto write SetDescricao_Produto;
      property Valor_Ultima_Compra_Unitario :double read FValor_Ultima_Compra_Unitario write SetValor_Ultima_Compra_Unitario;
      property Qtde_Estoque_Atual        :double read FQtde_Estoque_Atual write SetQtde_Estoque_Atual;
      property Saldo_Estoque_Atual       :double read FSaldo_Estoque_Atual write SetSaldo_Estoque_Atual;
      property Volume_Atual              :double read FVolume_Atual write SetVolume_Atual;
      property Codigo_Registro           :integer read FCodigo_Registro write SetCodigo_Registro;
      property Ficha_Estoque_Codigo      :integer read FFicha_Estoque_Codigo write SetFicha_Estoque_Codigo;
      property Data_Validade             :TDate read FData_Validade write SetData_Validade;


  end;
implementation

{ TItensEntradaEntidade }

procedure TItensEntradaEntidade.SetAliquota_ICMS(const Value: AnsiString);
begin
  FAliquota_ICMS := Value;
end;

procedure TItensEntradaEntidade.SetAliquota_IPI(const Value: AnsiString);
begin
  FAliquota_IPI := Value;
end;

procedure TItensEntradaEntidade.SetBC_ICMS(const Value: double);
begin
  FBC_ICMS := Value;
end;

procedure TItensEntradaEntidade.SetBC_ICMS_ST(const Value: double);
begin
  FBC_ICMS_ST := Value;
end;

procedure TItensEntradaEntidade.SetCFOP(const Value: AnsiString);
begin
  FCFOP := Value;
end;

procedure TItensEntradaEntidade.SetChecado(const Value: AnsiString);
begin
  FChecado := Value;
end;

procedure TItensEntradaEntidade.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TItensEntradaEntidade.SetCodigo_Produto(const Value: integer);
begin
  FCodigo_Produto := Value;
end;

procedure TItensEntradaEntidade.SetCodigo_Produto_Fornecedor(const Value: AnsiString);
begin
  FCodigo_Produto_Fornecedor := Value;
end;

procedure TItensEntradaEntidade.SetCodigo_Registro(const Value: integer);
begin
  FCodigo_Registro := Value;
end;

procedure TItensEntradaEntidade.SetCusto_Unitario(const Value: double);
begin
  FCusto_Unitario := Value;
end;

procedure TItensEntradaEntidade.SetData_Validade(const Value: TDate);
begin
  FData_Validade := Value;
end;

procedure TItensEntradaEntidade.SetDescricao_Produto(const Value: AnsiString);
begin
  FDescricao_Produto := Value;
end;

procedure TItensEntradaEntidade.SetFicha_Estoque_Codigo(const Value: integer);
begin
  FFicha_Estoque_Codigo := Value;
end;

procedure TItensEntradaEntidade.SetIVA(const Value: double);
begin
  FIVA := Value;
end;

procedure TItensEntradaEntidade.SetNCM(const Value: AnsiString);
begin
  FNCM := Value;
end;

procedure TItensEntradaEntidade.SetN_Item(const Value: AnsiString);
begin
  FN_Item := Value;
end;

procedure TItensEntradaEntidade.SetN_Nota_Fiscal(const Value: AnsiString);
begin
  FN_Nota_Fiscal := Value;
end;

procedure TItensEntradaEntidade.SetPercentual_Lucro_Prazo(const Value: double);
begin
  FPercentual_Lucro_Prazo := Value;
end;

procedure TItensEntradaEntidade.SetPercentual_Lucro_Vista(const Value: double);
begin
  FPercentual_Lucro_Vista := Value;
end;

procedure TItensEntradaEntidade.SetQtde_Estoque_Atual(const Value: double);
begin
  FQtde_Estoque_Atual := Value;
end;

procedure TItensEntradaEntidade.SetQuantidade(const Value: Double);
begin
  FQuantidade := Value;
end;

procedure TItensEntradaEntidade.SetQuantidade_Restante(const Value: double);
begin
  FQuantidade_Restante := Value;
end;

procedure TItensEntradaEntidade.SetQuantidade_Volume(const Value: double);
begin
  FQuantidade_Volume := Value;
end;

procedure TItensEntradaEntidade.SetSaldo_Estoque_Atual(const Value: double);
begin
  FSaldo_Estoque_Atual := Value;
end;

procedure TItensEntradaEntidade.SetST(const Value: AnsiString);
begin
  FST := Value;
end;

procedure TItensEntradaEntidade.SetUnidade(const Value: AnsiString);
begin
  FUnidade := Value;
end;

procedure TItensEntradaEntidade.SetValor_Frete_Unitario(const Value: double);
begin
  FValor_Frete_Unitario := Value;
end;

procedure TItensEntradaEntidade.SetValor_ICMS_ST(const Value: double);
begin
  FValor_ICMS_ST := Value;
end;

procedure TItensEntradaEntidade.SetValor_ICMS_Unitario(const Value: double);
begin
  FValor_ICMS_Unitario := Value;
end;

procedure TItensEntradaEntidade.SetValor_IPI(const Value: double);
begin
  FValor_IPI := Value;
end;

procedure TItensEntradaEntidade.SetValor_Prazo(const Value: double);
begin
  FValor_Prazo := Value;
end;

procedure TItensEntradaEntidade.SetValor_Prazo_Ultimo(const Value: double);
begin
  FValor_Prazo_Ultimo := Value;
end;

procedure TItensEntradaEntidade.SetValor_Total(const Value: double);
begin
  FValor_Total := Value;
end;

procedure TItensEntradaEntidade.SetValor_Ultima_Compra(const Value: double);
begin
  FValor_Ultima_Compra := Value;
end;

procedure TItensEntradaEntidade.SetValor_Ultima_Compra_Unitario(const Value: double);
begin
  FValor_Ultima_Compra_Unitario := Value;
end;

procedure TItensEntradaEntidade.SetValor_Unitario(const Value: Double);
begin
  FValor_Unitario := Value;
end;

procedure TItensEntradaEntidade.SetValor_Vista(const Value: double);
begin
  FValor_Vista := Value;
end;

procedure TItensEntradaEntidade.SetValor_Vista_Ultimo(const Value: double);
begin
  FValor_Vista_Ultimo := Value;
end;

procedure TItensEntradaEntidade.SetVolume_Atual(const Value: double);
begin
  FVolume_Atual := Value;
end;

end.
