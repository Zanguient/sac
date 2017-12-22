unit Modelo.Entidade.TCondicaoPagamentoEntidade;

interface

  type
    TCondicaoPagamentoEntidade = class
      private
        FCodigo: integer;
        FDescricao: AnsiString;
        FParcela: integer;
        FPrazo: integer;
        FTaxa: double;
        FIndiceImp: AnsiString;
        FTipoPagamento: AnsiString;
        FUsaTEF: AnsiString;
        FCheque: AnsiString;
        FTipoJuro: AnsiString;
        FDataCadastro: TDateTime;
        FStatus: AnsiString;
        FProgramaImpressora: AnsiString;

        procedure SetCheque(const Value: AnsiString);
        procedure SetCodigo(const Value: integer);
        procedure SetDescricao(const Value: AnsiString);
        procedure SetIndiceImp(const Value: AnsiString);
        procedure SetParcela(const Value: integer);
        procedure SetPrazo(const Value: integer);
        procedure SetTaxa(const Value: double);
        procedure SetTipoJuro(const Value: AnsiString);
        procedure SetTipoPagamento(const Value: AnsiString);
        procedure SetUsaTEF(const Value: AnsiString);
        procedure SetDataCadastro(const Value: TDateTime);
        procedure SetProgramaImpressora(const Value: AnsiString);
        procedure SetStatus(const Value: AnsiString);

      public
        property Codigo: integer read FCodigo write SetCodigo;
        property Descricao: AnsiString read FDescricao write SetDescricao;
        property Parcela: integer read FParcela write SetParcela;
        property Prazo: integer read FPrazo write SetPrazo;
        property Taxa: double read FTaxa write SetTaxa;
        property IndiceImp: AnsiString read FIndiceImp write SetIndiceImp;
        property TipoPagamento: AnsiString read FTipoPagamento write SetTipoPagamento;
        property UsaTEF: AnsiString read FUsaTEF write SetUsaTEF;
        property Cheque: AnsiString read FCheque write SetCheque;
        property TipoJuro: AnsiString read FTipoJuro write SetTipoJuro;
        property DataCadastro: TDateTime read FDataCadastro write SetDataCadastro;
        property Status: AnsiString read FStatus write SetStatus;
        property ProgramaImpressora: AnsiString read FProgramaImpressora write SetProgramaImpressora;


    end;

implementation

{ TCondicaoPagamento }

procedure TCondicaoPagamentoEntidade.SetCheque(const Value: AnsiString);
begin
  FCheque := Value;
end;

procedure TCondicaoPagamentoEntidade.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TCondicaoPagamentoEntidade.SetDataCadastro(const Value: TDateTime);
begin
  FDataCadastro := Value;
end;

procedure TCondicaoPagamentoEntidade.SetDescricao(const Value: AnsiString);
begin
  FDescricao := Value;
end;

procedure TCondicaoPagamentoEntidade.SetIndiceImp(const Value: AnsiString);
begin
  FIndiceImp := Value;
end;

procedure TCondicaoPagamentoEntidade.SetParcela(const Value: integer);
begin
  FParcela := Value;
end;

procedure TCondicaoPagamentoEntidade.SetPrazo(const Value: integer);
begin
  FPrazo := Value;
end;

procedure TCondicaoPagamentoEntidade.SetProgramaImpressora(
  const Value: AnsiString);
begin
  FProgramaImpressora := Value;
end;

procedure TCondicaoPagamentoEntidade.SetStatus(const Value: AnsiString);
begin
  FStatus := Value;
end;

procedure TCondicaoPagamentoEntidade.SetTaxa(const Value: double);
begin
  FTaxa := Value;
end;

procedure TCondicaoPagamentoEntidade.SetTipoJuro(const Value: AnsiString);
begin
  FTipoJuro := Value;
end;

procedure TCondicaoPagamentoEntidade.SetTipoPagamento(const Value: AnsiString);
begin
  FTipoPagamento := Value;
end;

procedure TCondicaoPagamentoEntidade.SetUsaTEF(const Value: AnsiString);
begin
  FUsaTEF := Value;
end;

end.
