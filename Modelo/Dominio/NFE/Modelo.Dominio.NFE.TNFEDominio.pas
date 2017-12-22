unit Modelo.Dominio.NFE.TNFEDominio;

interface
 uses
   Modelo.Dominio.NFE.INFEDominio, ADODB, Modelo.DAO.NFE.TNFEDAO, Forms, Windows,
   Modelo.Dominio.NFE.INFEReferenciaDevolucaoDominio,
  Modelo.Entidade.Estoque.TFichaEstoque;
  type
    TNFEDominio = class(TInterfacedObject, INFEDominio)
      private
        FQuery    : TADOQuery;
        FNFEDAO   : TNFEDAO;
        FNFEReferenciaDevolucaoDominio : INFEReferenciaDevolucaoDominio;
        Conexao: TADOConnection;

        function atualizarPedidoComCodigoFichaEstoque(CodItemPedido, codigo : Integer):Boolean;

        function carregarItensPedido(Query : TADOQuery; NumeroNF : Integer):Boolean;

      public
        constructor Create(var Conexao: TADOConnection);

        destructor Destroy;override;

        function gravarRefernciaDevolucao(CodigoNFEntrada, codigoPedido : Integer; var Query : TADOQuery): Boolean;

        function removerReferenciaDevolucao(Codigo, CodigoPedido : Integer; var Query : TADOQuery) : Boolean;

        function carregarReferenciaDevolucaoPorPedido(CodPedido : Integer; var Query : TADOQuery): Boolean;

        function removerTodasReferenciaDevolucao(CodigoPedido : Integer; var Query : TADOQuery) : Boolean;

        function salvarFichaEstoque(CodItemPedido : Integer; fichaEstoque : TFichaEstoque):Boolean;

        function removerFichaEstoque(NumeroNF : Integer):Boolean;

        function removerPeloCodigoDoPedido(CodItemPedido : Integer):Boolean;

    end;

implementation

{ TNFEDominio }

uses
  SysUtils, Util.TLog, UDM, Modelo.Dominio.NFE.TNFEReferenciaDevolucaoDominio,
  Modelo.Dominio.Estoque.IFichaEstoqueDominio,
  Modelo.Dominio.Estoque.TFichaEstoqueDominio, Util.Mensagens;

constructor TNFEDominio.Create(var Conexao: TADOConnection);
begin
  try
    FQuery := TADOQuery.Create(nil);
    FQuery.Connection := Conexao;
    Self.Conexao:= Conexao;
    FNFEDAO := TNFEDAO.Create(FQuery, Conexao);
    FNFEReferenciaDevolucaoDominio := TNFEReferenciaDevolucaoDominio.Create(Conexao);
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - Create - '+E.Message);
      TLog.Error(Self.ClassName+' - Create - '+E.Message);
    end;
  end;
end;

destructor TNFEDominio.Destroy;
begin
  try
    FQuery.Close;
    FreeAndNil(FQuery);
    inherited;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - Destroy - '+E.Message);
      TLog.Error(Self.ClassName+' - Destroy - '+E.Message);
    end;
  end;
end;

function TNFEDominio.removerFichaEstoque(NumeroNF: Integer): Boolean;
var
  FichaEstoque : TFichaEstoque;
  FichaEstoqueDominio : TFichaEstoqueDominio;
  Query : TADOQuery;
begin
  try
    try
      Result := False;
      Query := TADOQuery.Create(nil);
      Query.Connection := Conexao;
      if NumeroNF > 0 then begin
        carregarItensPedido(Query, NumeroNF);
        while not Query.Eof do begin
          FichaEstoque := FichaEstoqueDominio.retornarFichaEstoquePorCodigo(Query.FieldByName('Ficha_Estoque_Codigo').AsInteger);
          if Assigned(FichaEstoque) then
            Result := FichaEstoqueDominio.removerFichaEstoque(FichaEstoque);
          Query.Next;
        end;
      end;

      if Result = false then begin
        Application.MessageBox('Não foi possível retornar o produto para o estoque. Por favor entre em contato com o suporte técnico.', 'Erro', MB_OK+MB_ICONHAND);
      end;
    except
      on E : Exception do
      begin
        TMensagens.MensagemErro(Self.ClassName+' - removerTodasFichasEstoques - '+E.Message);
        TLog.Error(Self.ClassName+' - removerTodasFichasEstoques - '+E.Message);
      end;
    end;
  finally
    FreeAndNil(FichaEstoque);
    FichaEstoqueDominio := nil;
    Query.close;
    FreeAndNil(Query);
  end;
end;

function TNFEDominio.removerPeloCodigoDoPedido(CodItemPedido: Integer): Boolean;
begin

end;

function TNFEDominio.removerReferenciaDevolucao(Codigo, CodigoPedido: Integer; var Query : TADOQuery): Boolean;
begin
  try
    Result := False;
    Result := FNFEReferenciaDevolucaoDominio.remover(Codigo, CodigoPedido, Query);
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - removerReferenciaDevolucao - '+E.Message);
      TLog.Error(Self.ClassName+' - removerReferenciaDevolucao - '+E.Message);
    end;
  end;
end;

function TNFEDominio.removerTodasReferenciaDevolucao(CodigoPedido: Integer; var Query: TADOQuery): Boolean;
begin
  try
    Result := False;
    FNFEReferenciaDevolucaoDominio.removerTodasReferenciaDevolucao(CodigoPedido, Query);
    Result := (Query.recordCount > 0);
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - removerTodasReferenciaDevolucao - '+E.Message);
      TLog.Error(Self.ClassName+' - removerTodasReferenciaDevolucao - '+E.Message);
    end;
  end;
end;

function TNFEDominio.salvarFichaEstoque(CodItemPedido : Integer; fichaEstoque: TFichaEstoque): Boolean;
var
  FichaEstoqueDominio : IFichaEstoqueDominio;
  codigoFichaEstoque: integer;
begin
  try
    try
      Result := False;
      FichaEstoqueDominio := TFichaEstoqueDominio.Create(Conexao);
      if Assigned(fichaEstoque) then begin
         codigoFichaEstoque:= FichaEstoqueDominio.salvarFichaEstoque(fichaEstoque);
         Result := atualizarPedidoComCodigoFichaEstoque(CodItemPedido, codigoFichaEstoque);
      end;
    except
      on E : Exception do
      begin
        TMensagens.MensagemErro(Self.ClassName+' - salvarFichaEstoque - '+E.Message);
        TLog.Error(Self.ClassName+' - salvarFichaEstoque - '+E.Message);
      end;
    end;
  finally
    FichaEstoqueDominio := nil;
  end;
end;

function TNFEDominio.atualizarPedidoComCodigoFichaEstoque(CodItemPedido, codigo: Integer):Boolean;
begin
  try
    Result := False;
    if (codigo > 0) and (CodItemPedido > 0) then begin
      Result := FNFEDAO.atualizarPedidoCodFichaEstoque(CodItemPedido, codigo);
    end;
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - atualizarPedidoComCodigoFichaEstoque - '+E.Message);
      TLog.Error(Self.ClassName+' - atualizarPedidoComCodigoFichaEstoque - '+E.Message);
    end
  end;
end;

function TNFEDominio.carregarItensPedido(Query: TADOQuery; NumeroNF: Integer): Boolean;
begin
  try
    Result := False;
    Result := carregarItensPedido(Query, NumeroNF);
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - carregarItensPedido - '+E.Message);
      TLog.Error(Self.ClassName+' - carregarItensPedido - '+E.Message);
    end;
  end;
end;

function TNFEDominio.carregarReferenciaDevolucaoPorPedido(CodPedido: Integer;
  var Query: TADOQuery): Boolean;
begin
  try
    Result := False;
    FNFEReferenciaDevolucaoDominio.carregarReferenciaDevolucaoPorPedido(CodPedido, Query);
    Result := (Query.recordCount > 0);
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - carregarReferenciaDevolucaoPorPedido - '+E.Message);
      TLog.Error(Self.ClassName+' - carregarReferenciaDevolucaoPorPedido - '+E.Message);
    end;
  end;
end;

function TNFEDominio.gravarRefernciaDevolucao(CodigoNFEntrada, codigoPedido: Integer; var Query : TADOQuery): Boolean;
begin
  try
    Result := False;
    Result := FNFEReferenciaDevolucaoDominio.gravar(CodigoNFEntrada, codigoPedido, Query);
  except
    on E : Exception do
    begin
      TMensagens.MensagemErro(Self.ClassName+' - gravarRefernciaDevolucao - '+E.Message);
      TLog.Error(Self.ClassName+' - gravarRefernciaDevolucao - '+E.Message);
    end;
  end;
end;

end.
