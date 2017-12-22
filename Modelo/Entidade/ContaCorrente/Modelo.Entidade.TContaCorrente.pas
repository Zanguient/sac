unit Modelo.Entidade.TContaCorrente;

interface
  type
    TContaCorrenteEntidade = class
      private
        FCodigo: integer;
        FCodigo_Empresa: integer;
        FData_Abertura: TDate;
        FData_Cadastro: TDate;
        FConta: AnsiString;
        FAgencia: AnsiString;
        FCodigo_Banco: integer;
        FNome_Agencia: AnsiString;
        FNome_Correntista: AnsiString;
        FSaldo_Inicial: Double;
        FLimite: double;
        FSaldo_Atual: double;
        FNovoSaldo: double;

        procedure SetAgencia(const Value: AnsiString);
        procedure SetCodigo(const Value: integer);
        procedure SetCodigo_Banco(const Value: integer);
        procedure SetCodigo_Empresa(const Value: integer);
        procedure SetConta(const Value: AnsiString);
        procedure SetData_Abertura(const Value: TDate);
        procedure SetData_Cadastro(const Value: TDate);
        procedure SetLimite(const Value: double);
        procedure SetNome_Agencia(const Value: AnsiString);
        procedure SetNome_Correntista(const Value: AnsiString);
        procedure SetSaldo_Atual(const Value: double);
        procedure SetSaldo_Inicial(const Value: Double);
        procedure SetNovoSaldo(const Value: double);

      public
        property Codigo: integer read FCodigo write SetCodigo;
        property Codigo_Empresa: integer read FCodigo_Empresa write SetCodigo_Empresa;
        property Data_Abertura: TDate read FData_Abertura write SetData_Abertura;
        property Data_Cadastro: TDate read FData_Cadastro write SetData_Cadastro;
        property Conta: AnsiString read FConta write SetConta;
        property Agencia: AnsiString read FAgencia write SetAgencia;
        property Codigo_Banco: integer read FCodigo_Banco write SetCodigo_Banco;
        property Nome_Agencia: AnsiString read FNome_Agencia write SetNome_Agencia;
        property Nome_Correntista: AnsiString read FNome_Correntista write SetNome_Correntista;
        property Saldo_Inicial: Double read FSaldo_Inicial write SetSaldo_Inicial;
        property Limite: double read FLimite write SetLimite;
        property Saldo_Atual: double read FSaldo_Atual write SetSaldo_Atual;
        property NovoSaldo: double read FNovoSaldo write SetNovoSaldo;

    end;
implementation

{ TContaCorrenteEntidade }

procedure TContaCorrenteEntidade.SetAgencia(const Value: AnsiString);
begin
  FAgencia := Value;
end;

procedure TContaCorrenteEntidade.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TContaCorrenteEntidade.SetCodigo_Banco(const Value: integer);
begin
  FCodigo_Banco := Value;
end;

procedure TContaCorrenteEntidade.SetCodigo_Empresa(const Value: integer);
begin
  FCodigo_Empresa := Value;
end;

procedure TContaCorrenteEntidade.SetConta(const Value: AnsiString);
begin
  FConta := Value;
end;

procedure TContaCorrenteEntidade.SetData_Abertura(const Value: TDate);
begin
  FData_Abertura := Value;
end;

procedure TContaCorrenteEntidade.SetData_Cadastro(const Value: TDate);
begin
  FData_Cadastro := Value;
end;

procedure TContaCorrenteEntidade.SetLimite(const Value: double);
begin
  FLimite := Value;
end;

procedure TContaCorrenteEntidade.SetNome_Agencia(const Value: AnsiString);
begin
  FNome_Agencia := Value;
end;

procedure TContaCorrenteEntidade.SetNome_Correntista(const Value: AnsiString);
begin
  FNome_Correntista := Value;
end;

procedure TContaCorrenteEntidade.SetNovoSaldo(const Value: double);
begin
  FNovoSaldo := Value;
end;

procedure TContaCorrenteEntidade.SetSaldo_Atual(const Value: double);
begin
  FSaldo_Atual := Value;
end;

procedure TContaCorrenteEntidade.SetSaldo_Inicial(const Value: Double);
begin
  FSaldo_Inicial := Value;
end;

end.
