unit Modelo.Entidade.NFE.TCartaCorrecaoEntidade;

interface
  type
    TCartaCorrecaoEntidade = class
      private
        FCodigo: integer;
        FN_Nota_Fiscal: integer;
        FChave_NFE: AnsiString;
        FCNPJ: AnsiString;
        FDataEvento: TDateTime;
        FN_Carta_Correcao: integer;
        FObservacao: AnsiString;
        FProtocolo: AnsiString;

        procedure SetChave_NFE(const Value: AnsiString);
        procedure SetCNPJ(const Value: AnsiString);
        procedure SetCodigo(const Value: integer);
        procedure SetDataEvento(const Value: TDateTime);
        procedure SetN_Carta_Correcao(const Value: integer);
        procedure SetObservacao(const Value: AnsiString);
        procedure SetProtocolo(const Value: AnsiString);
        procedure SetN_Nota_Fiscal(const Value: integer);

      public
        property Codigo: integer read FCodigo write SetCodigo;
        property N_Nota_Fiscal: integer read FN_Nota_Fiscal write SetN_Nota_Fiscal;
        property Chave_NFE: AnsiString read FChave_NFE write SetChave_NFE;
        property CNPJ: AnsiString read FCNPJ write SetCNPJ;
        property DataEvento: TDateTime read FDataEvento write SetDataEvento;
        property N_Carta_Correcao: integer read FN_Carta_Correcao write SetN_Carta_Correcao;
        property Observacao: AnsiString read FObservacao write SetObservacao;
        property Protocolo: AnsiString read FProtocolo write SetProtocolo;


    end;

implementation

{ TCartaCorrecaoEntidade }

{ TCartaCorrecaoEntidade }

procedure TCartaCorrecaoEntidade.SetChave_NFE(const Value: AnsiString);
begin
  FChave_NFE := Value;
end;

procedure TCartaCorrecaoEntidade.SetCNPJ(const Value: AnsiString);
begin
  FCNPJ := Value;
end;

procedure TCartaCorrecaoEntidade.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TCartaCorrecaoEntidade.SetDataEvento(const Value: TDateTime);
begin
  FDataEvento := Value;
end;

procedure TCartaCorrecaoEntidade.SetN_Carta_Correcao(const Value: integer);
begin
  FN_Carta_Correcao := Value;
end;

procedure TCartaCorrecaoEntidade.SetN_Nota_Fiscal(const Value: integer);
begin
  FN_Nota_Fiscal := Value;
end;

procedure TCartaCorrecaoEntidade.SetObservacao(const Value: AnsiString);
begin
  FObservacao := Value;
end;

procedure TCartaCorrecaoEntidade.SetProtocolo(const Value: AnsiString);
begin
  FProtocolo := Value;
end;

end.
