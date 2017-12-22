unit Modelo.Dominio.NFE.TNFEReferenciaDevolucaoDominio;

interface
  uses
    Modelo.Dominio.NFE.INFEReferenciaDevolucaoDominio, ADODB,
    Modelo.DAO.NFE.TReferenciaDevolucaoDAO;
  type
    TNFEReferenciaDevolucaoDominio = class(TInterfacedObject, INFEReferenciaDevolucaoDominio)
      private
        FQuery : TADOQuery;
        FReferenciaDevolucaoDAO : TReferenciaDevolucaoDAO;
        Conexao: TADOConnection;
        function buscarParaAdicinarNaGrid(CodigoNFEntrada: Integer; Query : TADOQuery): TADOQuery;

      public
         function gravar(CodigoNFEntrada, codigoPedido: Integer; var Query : TADOQuery): Boolean;

         function remover(Codigo, CodigoPedido: Integer; var Query : TADOQuery): Boolean;

         function retornarCodigoNFDevolucaoReferencia: Integer;

         function carregarReferenciaDevolucaoPorPedido(CodPedido: Integer; var Query: TADOQuery): Boolean;

         function verificaSePodeAddReferencia(NumeroNF : string; Query: TADOQuery): Boolean;

         function removerTodasReferenciaDevolucao(CodigoPedido : Integer; var Query : TADOQuery) : Boolean;

         constructor Create(var Conexao: TADOConnection);

         destructor Destroy;override;
    end;

implementation

{ TNFEReferenciaDevolucaoDominio }

uses
  Util.TLog, SysUtils, Forms, Windows, UDM,
   Modelo.DAO.EntradaProdutos.TBuscaEntradaProdutosDAO, Util.Mensagens;

constructor TNFEReferenciaDevolucaoDominio.Create(var Conexao: TADOConnection);
begin
  try
    FQuery := TADOQuery.Create(nil);
    Self.Conexao:= Conexao;
    FQuery.Connection := Conexao;
    FReferenciaDevolucaoDAO := TReferenciaDevolucaoDAO.Create(FQuery, Conexao);
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - Create - '+E.Message);
      TLog.Error(Self.ClassName+' - Create - '+E.Message);
    end;
  end;
end;

destructor TNFEReferenciaDevolucaoDominio.Destroy;
begin
  try
    FQuery.Close;
    FreeAndNil(FQuery);
    FreeAndNil(FReferenciaDevolucaoDAO);
    inherited;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - Create - '+E.Message);
      TLog.Error(Self.ClassName+' - Create - '+E.Message);
    end;
  end;
end;

function TNFEReferenciaDevolucaoDominio.retornarCodigoNFDevolucaoReferencia: Integer;
begin
  try
    Result := 0;
    Result := FReferenciaDevolucaoDAO.gerarCodigoNFDevolucaoReferencia;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - retornarCodigoNFDevolucaoReferencia - '+E.Message);
      TLog.Error(Self.ClassName+' - retornarCodigoNFDevolucaoReferencia - '+E.Message);
    end;
  end;
end;

function TNFEReferenciaDevolucaoDominio.remover(Codigo, CodigoPedido: Integer; var Query : TADOQuery): Boolean;
begin
  try
    Result := False;
    if Codigo > 0 then begin
      if FReferenciaDevolucaoDAO.removerRefernciaDevolucao(codigo) then begin
        carregarReferenciaDevolucaoPorPedido(CodigoPedido, Query);
        Result := True;
      end;
    end;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - removerReferenciaDevolucao - '+E.Message);
      TLog.Error(Self.ClassName+' - removerReferenciaDevolucao - '+E.Message);
    end;
  end;
end;

function TNFEReferenciaDevolucaoDominio.removerTodasReferenciaDevolucao(
  CodigoPedido: Integer; var Query: TADOQuery): Boolean;
begin
  try
    Result := False;
    if CodigoPedido > 0 then begin
      if FReferenciaDevolucaoDAO.removerTodasRefernciaDevolucao(CodigoPedido) then begin
        Query.Close;
        Query.Open;
        Result := True;
      end;
    end;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - removerTodasReferenciaDevolucao - '+E.Message);
      TLog.Error(Self.ClassName+' - removerTodasReferenciaDevolucao - '+E.Message);
    end;
  end;
end;

function TNFEReferenciaDevolucaoDominio.carregarReferenciaDevolucaoPorPedido(CodPedido: Integer;
  var Query: TADOQuery): Boolean;
begin
  try
    Result := False;
    FReferenciaDevolucaoDAO.carregarRefernciaDevolucao(CodPedido, Query);
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - carregarReferenciaDevolucaoPorPidido - '+E.Message);
      TLog.Error(Self.ClassName+' - carregarReferenciaDevolucaoPorPidido - '+E.Message);
    end;
  end;
end;

function TNFEReferenciaDevolucaoDominio.gravar(CodigoNFEntrada, codigoPedido: Integer; var Query : TADOQuery): Boolean;
begin
  try
    Result := False;
    FQuery := buscarParaAdicinarNaGrid(CodigoNFEntrada, FQuery);
    if FQuery.RecordCount > 0 then begin
      if verificaSePodeAddReferencia(FQuery.FieldByName('N_Nota_Fiscal').AsString, Query) then begin
        Result := FReferenciaDevolucaoDAO.salvarRefernciaDevolucao(retornarCodigoNFDevolucaoReferencia,
                                                   codigoPedido,
                                                   FQuery.FieldByName('Codigo').AsInteger,
                                                   FQuery.FieldByName('Caixa_ECF').AsInteger,
                                                   FQuery.FieldByName('N_Nota_Fiscal').AsString,
                                                   FQuery.FieldByName('Modelo').AsString,
                                                   FQuery.FieldByName('Serie').AsString,
                                                   FQuery.FieldByName('Total_Nota').AsFloat,
                                                   FQuery.FieldByName('Data_Emissao').AsDateTime,
                                                   FQuery.FieldByName('Chave_NFe_Entrada').AsString);
        carregarReferenciaDevolucaoPorPedido(codigoPedido, Query);
      end  else begin
        Application.MessageBox(PChar('A nota fiscal número('+FQuery.FieldByName('N_Nota_Fiscal').AsString+') já foi referênciada.'), 'Erro', MB_OK+MB_ICONHAND);
      end;

    end
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - gravarRefernciaDevolucao - '+E.Message);
      TLog.Error(Self.ClassName+' - gravarRefernciaDevolucao - '+E.Message);
    end;
  end;
end;

function TNFEReferenciaDevolucaoDominio.verificaSePodeAddReferencia(NumeroNF : string; Query: TADOQuery): Boolean;
begin
  try
    Result := True;
    while not Query.Eof do begin
      if Trim(NumeroNF) = FQuery.FieldByName('N_Nota_Fiscal').AsString then begin
        Result := False;
        Break;
      end;
    end;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - verificaSePodeAddReferencia - '+E.Message);
      TLog.Error(Self.ClassName+' - verificaSePodeAddReferencia - '+E.Message);
    end;
  end;
end;

function TNFEReferenciaDevolucaoDominio.buscarParaAdicinarNaGrid(CodigoNFEntrada: Integer; Query : TADOQuery): TADOQuery;
var
  dao : TBuscaEntradaProdutosDAO;
begin
  try
    try
      dao := TBuscaEntradaProdutosDAO.Create(Query, Conexao);
      Result := dao.buscarPorCodigo(CodigoNFEntrada);
    except
      on E : Exception do begin
        TMensagens.MensagemErro(Self.ClassName+' - buscarParaAdicinarNaGrid - '+E.Message);
        TLog.Error(Self.ClassName+' - buscarParaAdicinarNaGrid - '+E.Message);
      end;
    end;
  finally
    FreeAndNil(DAO);
  end;
end;

end.
