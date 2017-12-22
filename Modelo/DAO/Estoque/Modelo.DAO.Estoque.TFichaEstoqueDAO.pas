unit Modelo.DAO.Estoque.TFichaEstoqueDAO;

interface
 uses
    ADODB, Modelo.Entidade.Estoque.TFichaEstoque;
  type
    TFichaEstoqueDAO = class
      private
        FQuery : TADOQuery;
        Conexao: TADOConnection;

        function getSQLInsertFichaEstoque:string;

        procedure adicionarParametros(ficha : TFichaEstoque);

        function getSQLUpdateFichaEstoque: string;

      public

        constructor Create(Query : TADOQuery; var Conexao: TADOConnection);

        function salvar(ficha : TFichaEstoque):Boolean;

        function editar(ficha : TFichaEstoque):Boolean;

        function remover(ficha : TFichaEstoque):Boolean;

        function gerarCodigo:Integer;

        function carregarUltimaFichaEstoque(produtoCodigo : Integer; dataMov : TDate; CodigoFicha: integer): Boolean;

        function verificarSEExisteLancamentoPosterior(dataMovimentacao: TDate; Query : TADOQuery; Codigo_Produto: integer): Boolean;

        function retornarFichaEstoquePorCodigo(codigo: Integer): Boolean;

        function atualizarItensEntradaCodFichaEstoque(CodItemEntrada, codigoFichaEstoque : Integer):Boolean;

    end;

implementation

{ TFichaEstoqueDAO }
uses
  System.SysUtils, Util.TLog, System.TypInfo, Util.Mensagens;

function TFichaEstoqueDAO.atualizarItensEntradaCodFichaEstoque(CodItemEntrada,
  codigoFichaEstoque: Integer): Boolean;
var
  SQL : string;
begin
  try
    TLog.Info('--- MÉTODO ATUALIZAR ENTRADA COM CÓDIGO DA FICHA - DAO ---');
    TLog.Debug('Código da Ficha: '+IntToStr(codigoFichaEstoque));
    TLog.Debug('Código do Registro: '+IntToStr(CodItemEntrada));
    Result := False;
    SQL := 'UPDATE Itens_Entrada SET Ficha_Estoque_Codigo = :codigoFicha WHERE Codigo_Registro = :CodigoItemEntrada';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('codigoFicha').Value := codigoFichaEstoque;
    FQuery.Parameters.ParamByName('CodigoItemEntrada').Value := CodItemEntrada;
    Result := (FQuery.ExecSQL > 0);
    TLog.Info('--- FIM DO MÉTODO ATUALIZAR ENTRADA COM CÓDIGO DA FICHA - DAO ---');
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.className+' - atualizarPedidoCodFichaEstoque - '+E.Message);
      TLog.Error(Self.className+' - atualizarPedidoCodFichaEstoque - '+E.Message);
    end;
  end;
end;

function TFichaEstoqueDAO.carregarUltimaFichaEstoque(produtoCodigo: Integer; dataMov : TDate; CodigoFicha: integer): Boolean;
var
  SQL : string;
begin
  try
    TLog.Info('--- MÉTODO ÚLTIMA FICHA ESTOQUE - DAO ---');
    TLog.Debug('Código do Produto: '+IntToStr(produtoCodigo));
    TLog.Debug('Data: '+DateToStr(dataMov));
    Result := False;
    SQL := 'SELECT TOP 1 * FROM Ficha_estoque WHERE Data_Movimentacao <= :data and Codigo_Produto = :codigo ORDER BY Data_Movimentacao DESC';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('data').Value := DateToStr(dataMov);
    FQuery.Parameters.ParamByName('codigo').Value := produtoCodigo;
    FQuery.Open;
    Result := (FQuery.RecordCount > 0);
    TLog.Debug('Código do Produto: '+FQuery.FieldByName('Codigo_Produto').AsString);
    TLog.Debug('Quantidade Total: '+FQuery.FieldByName('QuantidadeTotal').AsString);
    TLog.Info('--- FIM DO MÉTODO ÚLTIMA FICHA ESTOQUE - DAO ---');
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - carregarUltimaFichaEstoque - '+E.Message);
      TLog.Error(Self.ClassName+' - carregarUltimaFichaEstoque - '+E.Message);
    end;
  end;
end;

constructor TFichaEstoqueDAO.Create(Query: TADOQuery; var Conexao: TADOConnection);
begin
  FQuery := Query;
  Self.Conexao:= Conexao;
  FQuery.Connection:= Conexao;
end;

function TFichaEstoqueDAO.editar(ficha: TFichaEstoque): Boolean;
var
  SQL : string;
begin
  try
    TLog.Info('--- MÉTODO EDITAR FICHA ESTOQUE - DAO ---');
    TLog.Debug('Código da Ficha: '+IntToStr(ficha.Codigo));
    Result := False;
    SQL := getSQLUpdateFichaEstoque;
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    adicionarParametros(ficha);
    Result := (FQuery.ExecSQL > 0);
    TLog.Info('--- FIM DO MÉTODO EDITAR FICHA ESTOQUE - DAO ---');
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - editar - '+E.Message);
      TLog.Error(Self.ClassName+' - editar - '+E.Message);
    end;
  end;
end;

function TFichaEstoqueDAO.salvar(ficha: TFichaEstoque): Boolean;
var
  SQL : string;
begin
  try
    TLog.Info('--- MÉTODO SALVAR FICHA ESTOQUE - DAO ---');
    TLog.Debug('Código da Ficha: '+IntToStr(ficha.Codigo));
    Result := False;
    SQL := getSQLInsertFichaEstoque;
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    adicionarParametros(ficha);
    Result := (FQuery.ExecSQL > 0);
    TLog.Info('--- FIM DO MÉTODO SALVAR FICHA - DAO ---');
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - salvar - '+E.Message);
      TLog.Error(Self.ClassName+' - salvar - '+E.Message);
    end;
  end;
end;

function TFichaEstoqueDAO.verificarSEExisteLancamentoPosterior(dataMovimentacao: TDate; Query : TADOQuery; Codigo_Produto: integer): Boolean;
var
  SQL : string;
begin
  try
    TLog.Info('--- MÉTODO VERIFICA SE EXISTE LANÇAMENTO POSTERIOR - DAO ---');
    TLog.Debug('Data do Movimento: '+DateToStr(dataMovimentacao));
    Result := False;
    //SQL := 'SELECT * FROM Ficha_estoque WHERE Data_Movimentacao > :dataMov and Codigo_Produto = :Produto ORDER BY Data_Movimentacao ';
    SQL := 'SELECT * FROM Ficha_estoque WHERE Data_Movimentacao > :dataMov ORDER BY Data_Movimentacao ';
    Query.Close;
    Query.Connection:= Conexao;
    Query.SQL.Clear;
    Query.SQL.Add(SQL);
    Query.Parameters.ParamByName('dataMov').Value := DateToStr(dataMovimentacao);
    //Query.Parameters.ParamByName('Produto').Value := Codigo_Produto;
    Query.Open;
    Result := (Query.RecordCount > 0);
    TLog.Debug('Quantidade de linhas da verificação: '+IntToStr(Query.RecordCount));
    TLog.Info('--- FIM DO MÉTODO VERIFICA SE EXISTE LANÇAMENTO POSTERIOR - DAO ---');
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - verificarSEExisteLancamentoPosterior - '+E.Message);
      TLog.Error(Self.ClassName+' - verificarSEExisteLancamentoPosterior - '+E.Message);
    end;
  end;
end;


function TFichaEstoqueDAO.remover(ficha: TFichaEstoque): Boolean;
var
  SQL : string;
begin
  try
    TLog.Info('--- MÉTODO REMOVER FICHA ESTOQUE - DAO ---');
    TLog.Debug('Código da Ficha: '+IntToStr(ficha.Codigo));
    Result := False;
    SQL := 'DELETE FROM Ficha_estoque WHERE Codigo = :codigo;';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('codigo').Value := ficha.Codigo;
    Result := FQuery.ExecSQL > 0;
    TLog.Info('--- FIM DO MÉTODO REMOVER FICHA ESTOQUE DAO ---');
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - retornarFichaEstoquePorCodigo - '+E.Message);
      TLog.Error(Self.ClassName+' - retornarFichaEstoquePorCodigo - '+E.Message);
    end;
  end;
end;

function TFichaEstoqueDAO.retornarFichaEstoquePorCodigo(codigo: Integer): Boolean;
var
  SQL : string;
begin
  try
    TLog.Info('--- MÉTODO RETORNAR FICHA ESTOQUE POR CÓDIGO - DAO ---');
    TLog.Debug('Código da Ficha: '+IntToStr(codigo));
    SQL := 'SELECT * FROM Ficha_Estoque WHERE Codigo = :codigo';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Parameters.ParamByName('codigo').Value := codigo;
    FQuery.Open;
    Result := (FQuery.RecordCount > 0);
    TLog.Info('--- FIM DO MÉTODO RETORNAR FICHA ESTOQUE POR CÓDIGO - DAO ---');
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - retornarFichaEstoquePorCodigo - '+E.Message);
      TLog.Error(Self.ClassName+' - retornarFichaEstoquePorCodigo - '+E.Message);
    end;
  end;
end;

procedure TFichaEstoqueDAO.adicionarParametros(ficha : TFichaEstoque);
begin
  try
    FQuery.Parameters.ParamByName('Codigo').Value := ficha.Codigo;
    FQuery.Parameters.ParamByName('Data_Lancamento').Value := ficha.DataLancamento;
    FQuery.Parameters.ParamByName('Data_Movimentacao').Value := ficha.DataMovimentacao;
    FQuery.Parameters.ParamByName('Tipo').Value := GetEnumName(TypeInfo(TipoFichaEstoqueEnum), Integer(ficha.TipoFichaEstoque));
    FQuery.Parameters.ParamByName('Tipo_Documento').Value := GetEnumName(TypeInfo(TipoDocumentoEnum), Integer(ficha.TipoDocumento));
    FQuery.Parameters.ParamByName('Numero_Documento').Value := ficha.NumDocumento;
    FQuery.Parameters.ParamByName('Codigo_Produto').Value := ficha.ProdutoCodigo;
    FQuery.Parameters.ParamByName('Quantidade').Value := ficha.Quantidade;
    FQuery.Parameters.ParamByName('Valor_Unitario').Value := ficha.ValorUnitario;
    FQuery.Parameters.ParamByName('Valor_UnitarioTotal').Value := ficha.ValorUnitarioTotal;
    FQuery.Parameters.ParamByName('PrecoVendaVista').Value := ficha.PrecoVendaVista;
    FQuery.Parameters.ParamByName('PrecoVendaPrazo').Value := ficha.PrecoVendaPrazo;
    FQuery.Parameters.ParamByName('QuantidadeTotal').Value := ficha.QuantidadeTotal;
    FQuery.Parameters.ParamByName('CustoMedio').Value := ficha.CustoMedio;
    FQuery.Parameters.ParamByName('Saldo').Value := ficha.Saldo;
    //FQuery.Parameters.ParamByName('ValorNota').Value := ficha.ValorNota;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - adicionarParametros - '+E.Message);
      TLog.Error(Self.ClassName+' - adicionarParametros - '+E.Message);
    end;
  end;
end;

function TFichaEstoqueDAO.gerarCodigo: Integer;
var
  SQL : string;
begin
  try
    TLog.Info('--- MÉTODO GERAR CÓDIGO FICHA - DAO ---');
    Result := 0;
    SQL := 'SELECT MAX(Codigo) as Codigo FROM Ficha_Estoque;';
    FQuery.Close;
    FQuery.Connection:= Conexao;
    FQuery.SQL.Clear;
    FQuery.SQL.Add(SQL);
    FQuery.Open;
    Result := FQuery.FieldByName('Codigo').AsInteger + 1;
    TLog.Debug('Código da Ficha Gerada: '+IntToStr(FQuery.FieldByName('Codigo').AsInteger + 1));
    TLog.Info('--- FIM DO MÉTODO GERAR CÓDIGO FICHA - DAO ---');
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - gerarCodigo - '+E.Message);
      TLog.Error(Self.ClassName+' - gerarCodigo - '+E.Message);
    end;
  end;
end;

function TFichaEstoqueDAO.getSQLInsertFichaEstoque: string;
begin
  Result := ' INSERT INTO Ficha_Estoque '+
            '	(Codigo, Data_Lancamento , Data_Movimentacao, Tipo, Tipo_Documento,'+
            '	Numero_Documento, Codigo_Produto, Quantidade, Valor_Unitario, Valor_UnitarioTotal, PrecoVendaVista,'+
            ' PrecoVendaPrazo, QuantidadeTotal, CustoMedio, Saldo)'+
            ' VALUES '+
            '	(:Codigo, :Data_Lancamento , :Data_Movimentacao, :Tipo, :Tipo_Documento,'+
            '	:Numero_Documento, :Codigo_Produto, :Quantidade, :Valor_Unitario, :Valor_UnitarioTotal, :PrecoVendaVista,'+
            ' :PrecoVendaPrazo, :QuantidadeTotal, :CustoMedio, :Saldo)';
end;

function TFichaEstoqueDAO.getSQLUpdateFichaEstoque: string;
begin
  Result := ' UPDATE Ficha_Estoque SET Data_Lancamento = :Data_Lancamento,'+
            ' Data_Movimentacao= :Data_Movimentacao, Tipo= :Tipo, Tipo_Documento= :Tipo_Documento,'+
            '	Numero_Documento= :Numero_Documento  , Codigo_Produto=:Codigo_Produto , Quantidade=:Quantidade,'+
            ' Valor_Unitario=:Valor_Unitario, Valor_UnitarioTotal=:Valor_UnitarioTotal, PrecoVendaVista= :PrecoVendaVista,'+
            ' PrecoVendaPrazo= :PrecoVendaPrazo, QuantidadeTotal=:QuantidadeTotal, CustoMedio=:CustoMedio, Saldo= :Saldo'+
            ' WHERE Codigo = :Codigo';

end;

end.
