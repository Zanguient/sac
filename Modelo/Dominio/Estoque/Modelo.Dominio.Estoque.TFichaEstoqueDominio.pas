unit Modelo.Dominio.Estoque.TFichaEstoqueDominio;

interface
  uses
    Modelo.Dominio.Estoque.IFichaEstoqueDominio,
    Modelo.Entidade.Estoque.TFichaEstoque, ADODB,
    Modelo.Entidade.Estoque.TFichaEstoqueLista,
    Modelo.DAO.Estoque.TFichaEstoqueDAO, UDM, System.TypInfo, Util.Configs;

    type
      TFichaEstoqueDominio = class(TInterfacedObject, IFichaEstoqueDominio)
        private
          FFichaEstoqueDAO : TFichaEstoqueDAO;
          Conexao   : TADOConnection;
          FQuery           : TADOQuery;

          function  gerarCodigo : Integer;

          procedure carregarUtimaFichaEstoque(FichaEstoque  : TFichaEstoque; dataMov : TDate; CodigoFichaAtual: integer);

          function recalcular(Query : TADOQuery):Boolean;

          procedure calcularCustos(FichaEstoque  : TFichaEstoque);

          function verificarLancamentoPosterior(dataMovimentacao : TDateTime; Query : TADOQuery):Boolean;

          procedure carregarFichaEstoqueDaQuery(FichaEstoque : TFichaEstoque; Query : TADOQuery);

        public

          constructor Create(var Conexao: TADOConnection);

          destructor Destroy;override;

          function salvarFichaEstoque(FichaEstoque  : TFichaEstoque):Integer;

          function removerFichaEstoque(FichaEstoque  : TFichaEstoque):Boolean;

          function retornarFichaEstoqueLista(data : TDateTime; codigo, grupo:String):TFichaEstoqueLista;overload;

          function retornarFichaEstoque(data : TDateTime; codigo, grupo:String):TADOQuery;overload;

          function retornarFichaEstoquePorCodigo(codigo : Integer):TFichaEstoque;

          function atualizarEntradaComCodigoFichaEstoque(CodItemEntrada, codigo : Integer):Boolean;

      end;

implementation

{ TFichaEstoqueDominio }

uses
  System.SysUtils, Util.TLog, Util.Mensagens;

constructor TFichaEstoqueDominio.Create(var Conexao: TADOConnection);
begin
  FQuery := TADOQuery.Create(nil);
  FQuery.Connection := Conexao;
  Self.Conexao:= Conexao;
  FFichaEstoqueDAO := TFichaEstoqueDAO.Create(FQuery, Conexao);
end;

destructor TFichaEstoqueDominio.Destroy;
begin
  try
    FreeAndNil(FFichaEstoqueDAO);
    inherited;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - Destroy - '+E.Message);
      TLog.Error(Self.ClassName+' - Destroy - '+E.Message);
    end;
  end;
end;

function TFichaEstoqueDominio.retornarFichaEstoquePorCodigo(codigo: Integer): TFichaEstoque;
begin
  try
    Result := TFichaEstoque.Create;
    if codigo > 0 then begin
      if FFichaEstoqueDAO.retornarFichaEstoquePorCodigo(codigo) then begin
        carregarFichaEstoqueDaQuery(Result, FQuery);
      end;
    end;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - retornarFichaEstoquePorCodigo - '+E.Message);
      TLog.Error(Self.ClassName+' - retornarFichaEstoquePorCodigo - '+E.Message);
    end;
  end;
end;

function TFichaEstoqueDominio.recalcular(Query : TADOQuery): Boolean;
var
  FichaEstoque, utimaFichaEstoque : TFichaEstoque;
begin
  try
    Result := True;
    while not Query.Eof do begin
      FichaEstoque  := TFichaEstoque.Create;
      carregarFichaEstoqueDaQuery(FichaEstoque, Query);
      calcularCustos(FichaEstoque);
      Result := FFichaEstoqueDAO.editar(FichaEstoque);
      FreeAndNil(FichaEstoque);
      Query.Next;
    end;
  except
    on E : Exception do begin
      Result := False;
      begin
      TMensagens.MensagemErro(Self.ClassName+' - recalcular - '+E.Message);
      TLog.Error(Self.ClassName+' - recalcular - '+E.Message);
      end;
    end;
  end;
end;

function TFichaEstoqueDominio.removerFichaEstoque(FichaEstoque: TFichaEstoque): Boolean;
var
  Query : TADOQuery;
begin
  try
    TLog.Info('--- MÉTODO REMOVER FICHA ESTOQUE DOMÍNIO ---');
    try
      Result := False;
      Query := TADOQuery.Create(nil);
      Query.Connection := Conexao;
      TLog.Debug('Código da Ficha: '+IntToStr(FichaEstoque.Codigo));
      if Assigned(FichaEstoque) then begin
        TLog.Debug('Entrou no Assigned');
        if FFichaEstoqueDAO.remover(FichaEstoque) then begin
          Result:= True;
          if (FFichaEstoqueDAO.verificarSEExisteLancamentoPosterior(FichaEstoque.DataMovimentacao, Query, FichaEstoque.ProdutoCodigo)) then begin
            Result := recalcular(Query);
          end;
        end;
      end;
    except
      on E : Exception do
      begin
        TMensagens.MensagemErro(Self.ClassName+' - removerFichaEstoque - '+E.Message);
        TLog.Error(Self.ClassName+' - removerFichaEstoque - '+E.Message);
      end;
    end;
    TLog.Info('--- FIM DO MÉTODO REMOVER FICHA ESTOQUE DOMÍNIO ---');
  finally
    Query.Close;
    FreeAndNil(Query);
  end;
end;

function TFichaEstoqueDominio.salvarFichaEstoque(FichaEstoque  : TFichaEstoque):Integer;
var
  Query : TADOQuery;
begin
  try
    TLog.Info('--- MÉTODO SALVAR FICHA ESTOQUE - DOMÍNIO ---');
    try
      Result := 0;
      Query := TADOQuery.Create(nil);
      Query.Connection := Conexao;
      FichaEstoque.Codigo := gerarCodigo;
      TLog.Debug('Código da ficha gerado: '+IntToStr(FichaEstoque.Codigo));
      calcularCustos(FichaEstoque);
      if FFichaEstoqueDAO.salvar(FichaEstoque) then begin
        if (FFichaEstoqueDAO.verificarSEExisteLancamentoPosterior(FichaEstoque.DataMovimentacao, Query, FichaEstoque.ProdutoCodigo)) then begin
          TLog.Debug('Encontrou lançamento posterior: Data: '+DateTimeToStr(FichaEstoque.DataMovimentacao)+'.');
          recalcular(Query);
        end
        else
        begin
          TLog.Debug('Não encontrou lançamento posterior.');
        end;
        Result := FichaEstoque.Codigo;
      end;
    except
      on E : Exception do
      begin
        TMensagens.MensagemErro(Self.ClassName+' - salvarFichaEstoque - '+E.Message);
        TLog.Error(Self.ClassName+' - salvarFichaEstoque - '+E.Message);
      end;
    end;
    TLog.Info('--- FIM DO MÉTODO SALVAR FICHA ESTOQUE - DOMÍNIO ---');
  finally
    Query.Close;
    FreeAndNil(Query);
  end;
end;

function TFichaEstoqueDominio.verificarLancamentoPosterior(dataMovimentacao: TDateTime; Query : TADOQuery): Boolean;
begin
  try
    Result := False;
    //Result := FFichaEstoqueDAO.verificarSEExisteLancamentoPosterior(dataMovimentacao, Query);
  except
    on E : Exception do begin
      Result := False;
      begin
      TMensagens.MensagemErro(Self.ClassName+' - verificarLancamentoPosterior - '+E.Message);
      TLog.Error(Self.ClassName+' - verificarLancamentoPosterior - '+E.Message);
      end;
    end;
  end;
end;

function TFichaEstoqueDominio.atualizarEntradaComCodigoFichaEstoque(
  CodItemEntrada, codigo: Integer): Boolean;
begin
  try
    TLog.Debug('--- MÉTODO ATUALIZAR ENTRADA COM CÓDIGO DA FICHA - DOMÍNIO ---');
    TLog.Debug('Código da Ficha: '+IntToStr(codigo));
    TLog.Debug('Código do Registro: '+IntToStr(CodItemEntrada));
    Result := False;
    if (codigo > 0) and (CodItemEntrada > 0) then begin
      Result := FFichaEstoqueDAO.atualizarItensEntradaCodFichaEstoque(CodItemEntrada, codigo);
    end;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - atualizarEntradaComCodigoFichaEstoque - '+E.Message);
      TLog.Error(Self.ClassName+' - atualizarEntradaComCodigoFichaEstoque - '+E.Message);
    end;
  end;

  TLog.Debug('--- FIM DO MÉTODO ATUALIZAR ENTRADA COM CÓDIGO DA FICHA - DOMÍNIO ---');
end;

procedure TFichaEstoqueDominio.calcularCustos(FichaEstoque  : TFichaEstoque);
var
  CustoMedio, Saldo, qtdAtual : Double;
  utimaFichaEstoque : TFichaEstoque;
begin
  try
    TLog.Debug('--- MÉTODO CALCULAR CUSTOS ---');
    try
      utimaFichaEstoque := TFichaEstoque.Create;
      utimaFichaEstoque.ProdutoCodigo := FichaEstoque.ProdutoCodigo;
      carregarUtimaFichaEstoque(utimaFichaEstoque, FichaEstoque.DataMovimentacao, FichaEstoque.Codigo);
      TLog.Debug('Código do produto na última ficha: '+IntToStr(utimaFichaEstoque.ProdutoCodigo));
      TLog.Debug('Data que encontrou a última ficha: '+DateTimeToStr(FichaEstoque.DataMovimentacao));
      Saldo := 0;
      CustoMedio := 0;
      if FichaEstoque.TipoFichaEstoque = ENTRADA then begin
        qtdAtual :=  (utimaFichaEstoque.QuantidadeTotal + FichaEstoque.Quantidade);
        if qtdAtual > 0 then
          CustoMedio := (utimaFichaEstoque.Saldo + FichaEstoque.ValorUnitarioTotal) / qtdAtual;
        FichaEstoque.CustoMedio      := CustoMedio;
        FichaEstoque.QuantidadeTotal := (utimaFichaEstoque.QuantidadeTotal + FichaEstoque.Quantidade);
        FichaEstoque.Saldo           := FichaEstoque.QuantidadeTotal * FichaEstoque.CustoMedio;
      end else begin
        FichaEstoque.CustoMedio := utimaFichaEstoque.CustoMedio;
        FichaEstoque.ValorUnitario := utimaFichaEstoque.ValorUnitario;
        FichaEstoque.ValorUnitarioTotal := FichaEstoque.ValorUnitario * FichaEstoque.Quantidade;
        FichaEstoque.QuantidadeTotal := (utimaFichaEstoque.QuantidadeTotal - FichaEstoque.Quantidade);
        //Saldo := utimaFichaEstoque.Saldo - FichaEstoque.ValorUnitarioTotal;
        Saldo := FichaEstoque.CustoMedio * FichaEstoque.QuantidadeTotal;
        FichaEstoque.Saldo := Saldo;
      end;
      TLog.Debug('--- FIM DO MÉTODO CALCULAR CUSTOS ---');
    except
      on E : Exception do
      begin
        TMensagens.MensagemErro(Self.ClassName+' - calcularCustos - '+E.Message);
        TLog.Error(Self.ClassName+' - calcularCustos - '+E.Message);
      end;
    end;
  finally
    FreeAndNil(utimaFichaEstoque);
  end;
end;

procedure TFichaEstoqueDominio.carregarUtimaFichaEstoque(FichaEstoque: TFichaEstoque; dataMov : TDate; CodigoFichaAtual: integer);
begin
  try
    if FichaEstoque.ProdutoCodigo > 0 then begin
      if FFichaEstoqueDAO.carregarUltimaFichaEstoque(FichaEstoque.ProdutoCodigo, dataMov, CodigoFichaAtual) then begin
        carregarFichaEstoqueDaQuery(FichaEstoque, FQuery);
      end;
    end;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - carregarUtimaFichaEstoque - '+E.Message);
      TLog.Error(Self.ClassName+' - carregarUtimaFichaEstoque - '+E.Message);
    end;
  end;
end;

function TFichaEstoqueDominio.retornarFichaEstoque(data: TDateTime; codigo, grupo: String): TADOQuery;
begin
  try

  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - retornarFichaEstoque - '+E.Message);
      TLog.Error(Self.ClassName+' - retornarFichaEstoque - '+E.Message);
    end;
  end;
end;

function TFichaEstoqueDominio.retornarFichaEstoqueLista(data: TDateTime; codigo, grupo: String): TFichaEstoqueLista;
begin
  try

  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - retornarFichaEstoque - '+E.Message);
      TLog.Error(Self.ClassName+' - retornarFichaEstoque - '+E.Message);
    end;
  end;
end;


procedure TFichaEstoqueDominio.carregarFichaEstoqueDaQuery(FichaEstoque : TFichaEstoque; Query : TADOQuery);
var
  data, d1, d2, d3: AnsiString;
begin
  try
    data:= Query.FieldByName('Data_Movimentacao').AsString;
    if (TConfigs.VerificaSeExisteCaracter(data, '-')) then
    begin
      data:= StringReplace(data, '-', '', [rfReplaceAll]);
      d1:= Copy(data, 1, 4);
      d2:= Copy(data, 5, 2);
      d3:= Copy(data, 7, 2);

      data:= d3 + '/' + d2 + '/' + d1;
    end;

    FichaEstoque.Codigo             := Query.FieldByName('Codigo').AsInteger;
    FichaEstoque.DataLancamento     := Query.FieldByName('Data_Lancamento').AsDateTime;
    FichaEstoque.DataMovimentacao   := StrToDate(data);
    FichaEstoque.TipoFichaEstoque   := TipoFichaEstoqueEnum(GetEnumValue(TypeInfo(TipoFichaEstoqueEnum), Query.FieldByName('Tipo').AsString));
    FichaEstoque.TipoDocumento      := TipoDocumentoEnum(GetEnumValue(TypeInfo(TipoDocumentoEnum), Query.FieldByName('Tipo_Documento').AsString));
    FichaEstoque.NumDocumento       := Query.FieldByName('Numero_Documento').AsString;
    FichaEstoque.ProdutoCodigo      := Query.FieldByName('Codigo_Produto').AsInteger;
    FichaEstoque.Quantidade         := Query.FieldByName('Quantidade').AsFloat;
    FichaEstoque.ValorUnitario      := Query.FieldByName('Valor_Unitario').AsFloat;
    FichaEstoque.ValorUnitarioTotal := Query.FieldByName('Valor_Unitario').AsFloat * Query.FieldByName('Quantidade').AsFloat;
    FichaEstoque.PrecoVendaVista    := Query.FieldByName('Valor_UnitarioTotal').AsFloat;
    FichaEstoque.PrecoVendaPrazo    := Query.FieldByName('PrecoVendaPrazo').AsFloat;
    FichaEstoque.QuantidadeTotal    := Query.FieldByName('QuantidadeTotal').AsFloat;
    FichaEstoque.CustoMedio         := Query.FieldByName('CustoMedio').AsFloat;
    //FichaEstoque.CustoUnitario      := Query.FieldByName('CustoUnitario').AsFloat;
    FichaEstoque.Saldo              := Query.FieldByName('Saldo').AsFloat;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - carregarFichaEstoqueDaQuery - '+E.Message);
      TLog.Error(Self.ClassName+' - carregarFichaEstoqueDaQuery - '+E.Message);
    end;
  end;
end;

function TFichaEstoqueDominio.gerarCodigo:Integer;
begin
  try
    Result := FFichaEstoqueDAO.gerarCodigo;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - adicionarCodigo - '+E.Message);
      TLog.Error(Self.ClassName+' - adicionarCodigo - '+E.Message);
    end;
  end;
end;


end.
