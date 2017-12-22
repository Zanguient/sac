unit Modelo.Entidade.DocumentosFinanceiro.TPromissoriaEntidade;

interface
  type
    TPromissoriaEntidade = class
      private
        FDataVencimento: TDate;
        FData_Atual: TDate;
        FValor: double;
        FNomeCliente: AnsiString;
        FCPFCNPJ: AnsiString;
        FEndereco: AnsiString;

        procedure SetCPFCNPJ(const Value: AnsiString);
        procedure SetData_Atual(const Value: TDate);
        procedure SetDataVencimento(const Value: TDate);
        procedure SetEndereco(const Value: AnsiString);
        procedure SetNomeCliente(const Value: AnsiString);
        procedure SetValor(const Value: double);
      public
        property DataVencimento: TDate read FDataVencimento write SetDataVencimento;
        property Data_Atual: TDate read FData_Atual write SetData_Atual;
        property Valor: double read FValor write SetValor;
        property NomeCliente: AnsiString read FNomeCliente write SetNomeCliente;
        property CPFCNPJ: AnsiString read FCPFCNPJ write SetCPFCNPJ;
        property Endereco: AnsiString read FEndereco write SetEndereco;

    end;

implementation

{ TPromissoria }

procedure TPromissoriaEntidade.SetCPFCNPJ(const Value: AnsiString);
begin
  FCPFCNPJ := Value;
end;

procedure TPromissoriaEntidade.SetDataVencimento(const Value: TDate);
begin
  FDataVencimento := Value;
end;

procedure TPromissoriaEntidade.SetData_Atual(const Value: TDate);
begin
  FData_Atual := Value;
end;

procedure TPromissoriaEntidade.SetEndereco(const Value: AnsiString);
begin
  FEndereco := Value;
end;

procedure TPromissoriaEntidade.SetNomeCliente(const Value: AnsiString);
begin
  FNomeCliente := Value;
end;

procedure TPromissoriaEntidade.SetValor(const Value: double);
begin
  FValor := Value;
end;

end.
