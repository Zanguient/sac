unit Entidade.TEntradas;

interface
  type
    TEntradasEntidade = class
    private
      FCodigo: integer;
      FN_Nota_Fiscal: AnsiString;
      FModelo: AnsiString;
      FSerie: AnsiString;
      FData_Emissao: TDate;
      FHora_Emissao: AnsiString;
      FData_Entrada: TDate;
      FHora_Entrada: AnsiString;
      FTipo_Frete: AnsiString;
      FTipo_Pagamento: AnsiString;
      FCodigo_Fornecedor: integer;
      FCodigo_CFOP: integer;
      FCodigo_Empresa: integer;
      FQuantidade_Itens: integer;
      FObservacao: AnsiString;
      FStatus: AnsiString;
      FCodigo_Funcionario: integer;
      FChave_NFe_Entrada: AnsiString;
      FCaixa_ECF: integer;
      FFinalizada: integer;

      procedure SetCaixa_ECF(const Value: integer);
      procedure SetChave_NFe_Entrada(const Value: AnsiString);
      procedure SetCodigo(const Value: integer);
      procedure SetCodigo_CFOP(const Value: integer);
      procedure SetCodigo_Empresa(const Value: integer);
      procedure SetCodigo_Fornecedor(const Value: integer);
      procedure SetCodigo_Funcionario(const Value: integer);
      procedure SetData_Emissao(const Value: TDate);
      procedure SetData_Entrada(const Value: TDate);
      procedure SetHora_Emissao(const Value: AnsiString);
      procedure SetHora_Entrada(const Value: AnsiString);
      procedure SetModelo(const Value: AnsiString);
      procedure SetN_Nota_Fiscal(const Value: AnsiString);
      procedure SetObservacao(const Value: AnsiString);
      procedure SetQuantidade_Itens(const Value: integer);
      procedure SetSerie(const Value: AnsiString);
      procedure SetStatus(const Value: AnsiString);
      procedure SetTipo_Frete(const Value: AnsiString);
      procedure SetTipo_Pagamento(const Value: AnsiString);
      procedure SetFinalizada(const Value: integer);

    public
      property Codigo: integer read FCodigo write SetCodigo;
      property N_Nota_Fiscal: AnsiString read FN_Nota_Fiscal write SetN_Nota_Fiscal;
      property Modelo: AnsiString read FModelo write SetModelo;
      property Serie: AnsiString read FSerie write SetSerie;
      property Data_Emissao: TDate read FData_Emissao write SetData_Emissao;
      property Hora_Emissao: AnsiString read FHora_Emissao write SetHora_Emissao;
      property Data_Entrada: TDate read FData_Entrada write SetData_Entrada;
      property Hora_Entrada: AnsiString read FHora_Entrada write SetHora_Entrada;
      property Tipo_Frete: AnsiString read FTipo_Frete write SetTipo_Frete;
      property Tipo_Pagamento: AnsiString read FTipo_Pagamento write SetTipo_Pagamento;
      property Codigo_Fornecedor: integer read FCodigo_Fornecedor write SetCodigo_Fornecedor;
      property Codigo_CFOP: integer read FCodigo_CFOP write SetCodigo_CFOP;
      property Codigo_Empresa: integer read FCodigo_Empresa write SetCodigo_Empresa;
      property Quantidade_Itens: integer read FQuantidade_Itens write SetQuantidade_Itens;
      property Observacao: AnsiString read FObservacao write SetObservacao;
      property Status: AnsiString read FStatus write SetStatus;
      property Codigo_Funcionario: integer read FCodigo_Funcionario write SetCodigo_Funcionario;
      property Chave_NFe_Entrada: AnsiString read FChave_NFe_Entrada write SetChave_NFe_Entrada;
      property Caixa_ECF: integer read FCaixa_ECF write SetCaixa_ECF;
      property Finalizada: integer read FFinalizada write SetFinalizada;

    end;
implementation

{ TEntradasEntidade }

procedure TEntradasEntidade.SetCaixa_ECF(const Value: integer);
begin
  FCaixa_ECF := Value;
end;

procedure TEntradasEntidade.SetChave_NFe_Entrada(const Value: AnsiString);
begin
  FChave_NFe_Entrada := Value;
end;

procedure TEntradasEntidade.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TEntradasEntidade.SetCodigo_CFOP(const Value: integer);
begin
  FCodigo_CFOP := Value;
end;

procedure TEntradasEntidade.SetCodigo_Empresa(const Value: integer);
begin
  FCodigo_Empresa := Value;
end;

procedure TEntradasEntidade.SetCodigo_Fornecedor(const Value: integer);
begin
  FCodigo_Fornecedor := Value;
end;

procedure TEntradasEntidade.SetCodigo_Funcionario(const Value: integer);
begin
  FCodigo_Funcionario := Value;
end;

procedure TEntradasEntidade.SetData_Emissao(const Value: TDate);
begin
  FData_Emissao := Value;
end;

procedure TEntradasEntidade.SetData_Entrada(const Value: TDate);
begin
  FData_Entrada := Value;
end;

procedure TEntradasEntidade.SetFinalizada(const Value: integer);
begin
  FFinalizada := Value;
end;

procedure TEntradasEntidade.SetHora_Emissao(const Value: AnsiString);
begin
  FHora_Emissao := Value;
end;

procedure TEntradasEntidade.SetHora_Entrada(const Value: AnsiString);
begin
  FHora_Entrada := Value;
end;

procedure TEntradasEntidade.SetModelo(const Value: AnsiString);
begin
  FModelo := Value;
end;

procedure TEntradasEntidade.SetN_Nota_Fiscal(const Value: AnsiString);
begin
  FN_Nota_Fiscal := Value;
end;

procedure TEntradasEntidade.SetObservacao(const Value: AnsiString);
begin
  FObservacao := Value;
end;

procedure TEntradasEntidade.SetQuantidade_Itens(const Value: integer);
begin
  FQuantidade_Itens := Value;
end;

procedure TEntradasEntidade.SetSerie(const Value: AnsiString);
begin
  FSerie := Value;
end;

procedure TEntradasEntidade.SetStatus(const Value: AnsiString);
begin
  FStatus := Value;
end;

procedure TEntradasEntidade.SetTipo_Frete(const Value: AnsiString);
begin
  FTipo_Frete := Value;
end;

procedure TEntradasEntidade.SetTipo_Pagamento(const Value: AnsiString);
begin
  FTipo_Pagamento := Value;
end;

end.
