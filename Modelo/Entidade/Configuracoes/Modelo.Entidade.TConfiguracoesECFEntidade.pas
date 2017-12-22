unit Modelo.Entidade.TConfiguracoesECFEntidade;

interface
  type
    TConfiguracoesECFEntidade = class
      private
        FCodigo: integer;
        FCodigoEmpresa : integer;
        FNFabricacao : AnsiString;
        FGT : double;
        FPorta : AnsiString;
        FMarca : AnsiString;
        FCIECF : AnsiString;
        FMD5 : AnsiString;
        FDataAtivacao : TDateTime;
        FModeloECF: AnsiString;
        FNCaixa: AnsiString;

        procedure SetCIECF(const Value: AnsiString);
        procedure SetDataAtivacao(const Value: TDateTime);
        procedure SetGT(const Value: double);
        procedure SetMarca(const Value: AnsiString);
        procedure SetMD5(const Value: AnsiString);
        procedure SetNFabricacao(const Value: AnsiString);
        procedure SetPorta(const Value: AnsiString);
        procedure SetCodigoEmpresa(const Value: integer);
        procedure SetCodigo(const Value: integer);
        procedure SetModeloECF(const Value: AnsiString);
        procedure SetNCaixa(const Value: AnsiString);

      public
        property Codigo: integer read FCodigo write SetCodigo;
        property CodigoEmpresa : integer read FCodigoEmpresa write SetCodigoEmpresa;
        property NFabricacao : AnsiString read FNFabricacao write SetNFabricacao;
        property GT : double read FGT write SetGT;
        property Porta : AnsiString read FPorta write SetPorta;
        property Marca : AnsiString read FMarca write SetMarca;
        property CIECF : AnsiString read FCIECF write SetCIECF;
        property MD5 : AnsiString read FMD5 write SetMD5;
        property DataAtivacao : TDateTime read FDataAtivacao write SetDataAtivacao;
        property ModeloECF : AnsiString read FModeloECF write SetModeloECF;
        property NCaixa : AnsiString read FNCaixa write SetNCaixa;


    end;

implementation

{ TConfiguracoesECFEntidade }

procedure TConfiguracoesECFEntidade.SetCIECF(const Value: AnsiString);
begin
  FCIECF := Value;
end;

procedure TConfiguracoesECFEntidade.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TConfiguracoesECFEntidade.SetCodigoEmpresa(const Value: integer);
begin
  FCodigoEmpresa := Value;
end;

procedure TConfiguracoesECFEntidade.SetDataAtivacao(const Value: TDateTime);
begin
  FDataAtivacao := Value;
end;

procedure TConfiguracoesECFEntidade.SetGT(const Value: double);
begin
  FGT := Value;
end;

procedure TConfiguracoesECFEntidade.SetMarca(const Value: AnsiString);
begin
  FMarca := Value;
end;

procedure TConfiguracoesECFEntidade.SetMD5(const Value: AnsiString);
begin
  FMD5 := Value;
end;

procedure TConfiguracoesECFEntidade.SetModeloECF(const Value: AnsiString);
begin
  FModeloECF := Value;
end;

procedure TConfiguracoesECFEntidade.SetNCaixa(const Value: AnsiString);
begin
  FNCaixa := Value;
end;

procedure TConfiguracoesECFEntidade.SetNFabricacao(const Value: AnsiString);
begin
  FNFabricacao := Value;
end;

procedure TConfiguracoesECFEntidade.SetPorta(const Value: AnsiString);
begin
  FPorta := Value;
end;

end.
