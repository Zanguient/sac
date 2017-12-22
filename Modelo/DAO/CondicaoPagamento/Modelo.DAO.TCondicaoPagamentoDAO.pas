unit Modelo.DAO.TCondicaoPagamentoDAO;

interface

uses
  Modelo.Entidade.TCondicaoPagamentoEntidade, ADODB;

  type
    TCondicaoPagamentoDAO = class
      private
        Conexao: TADOConnection;
      public
        constructor create(var Conexao: TADOConnection);
        function CarregaDadosCondicao(CodigoCondicao: integer): TCondicaoPagamentoEntidade; overload;
        function CarregaDadosCondicao(DescricaoCondicao: AnsiString): TCondicaoPagamentoEntidade; overload;
        function CarregaDadosCondicaoPelaDescricao(CodigoCondicao: integer): AnsiString; overload;
    end;

implementation

uses
  UDM, TLoggerUnit, SysUtils, Util.TLog, Util.Mensagens;
{ TCondicaoPagamentoDAO }

function TCondicaoPagamentoDAO.CarregaDadosCondicao(
  CodigoCondicao: integer): TCondicaoPagamentoEntidade;
var
  qAux: TADOQuery;
  CondPag: TCondicaoPagamentoEntidade;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('select * from Condicao_Pagamento where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= CodigoCondicao;
      open;
    end;

    CondPag:= TCondicaoPagamentoEntidade.Create;
    if (qAux.IsEmpty = false) then
    begin
      CondPag.Codigo:= qAux.FieldByName('Codigo').AsInteger;
      CondPag.Descricao:= qAux.FieldByName('Descricao').AsString;
      CondPag.Parcela:= qAux.FieldByName('Parcela').AsInteger;
      CondPag.Prazo:= qAux.FieldByName('Prazo').AsInteger;
      CondPag.Taxa:= qAux.FieldByName('Taxa').AsFloat;
      CondPag.IndiceImp:= qAux.FieldByName('Indice').AsString;
      CondPag.TipoPagamento:= qAux.FieldByName('Tipo_Pagamento').AsString;
      CondPag.UsaTEF:= qAux.FieldByName('TEF').AsString;
      CondPag.Cheque:= qAux.FieldByName('Cheque').AsString;
      CondPag.TipoJuro:= qAux.FieldByName('Tipo_Juro').AsString;
      CondPag.DataCadastro:= qAux.FieldByName('Data_Cadastro').AsDateTime;
      CondPag.Status:= qAux.FieldByName('Status').AsString;
      CondPag.ProgramaImpressora:= qAux.FieldByName('Programa_Impressora').AsString;
    end;
    Result:= CondPag;

  except on E: Exception do
  begin
    TMensagens.MensagemErro('Erro ao Carregar Condição de Pagamento: '+e.Message );
    TLog.Error('Erro ao Carregar Condição de Pagamento: '+e.Message );
  end;
  end;
end;

function TCondicaoPagamentoDAO.CarregaDadosCondicao(
  DescricaoCondicao: AnsiString): TCondicaoPagamentoEntidade;
var
  qAux: TADOQuery;
  CondPag: TCondicaoPagamentoEntidade;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('select * from Condicao_Pagamento where Descricao = :Descricao');
      Parameters.ParamByName('Descricao').Value:= DescricaoCondicao;
      open;
    end;

    CondPag:= TCondicaoPagamentoEntidade.Create;
    if (qAux.IsEmpty = false) then
    begin
      CondPag.Codigo:= qAux.FieldByName('Codigo').AsInteger;
      CondPag.Descricao:= qAux.FieldByName('Descricao').AsString;
      CondPag.Parcela:= qAux.FieldByName('Parcela').AsInteger;
      CondPag.Prazo:= qAux.FieldByName('Prazo').AsInteger;
      CondPag.Taxa:= qAux.FieldByName('Taxa').AsFloat;
      CondPag.IndiceImp:= qAux.FieldByName('Indice').AsString;
      CondPag.TipoPagamento:= qAux.FieldByName('Tipo_Pagamento').AsString;
      CondPag.UsaTEF:= qAux.FieldByName('TEF').AsString;
      CondPag.Cheque:= qAux.FieldByName('Cheque').AsString;
      CondPag.TipoJuro:= qAux.FieldByName('Tipo_Juro').AsString;
      CondPag.DataCadastro:= qAux.FieldByName('Data_Cadastro').AsDateTime;
      CondPag.Status:= qAux.FieldByName('Status').AsString;
      CondPag.ProgramaImpressora:= qAux.FieldByName('Programa_Impressora').AsString;
    end;
    Result:= CondPag;

  except on E: Exception do
  begin
    TMensagens.MensagemErro('Erro ao Carregar Condição de Pagamento: '+e.Message );
    TLog.Error('Erro ao Carregar Condição de Pagamento: '+e.Message );
  end;
  end;
end;

function TCondicaoPagamentoDAO.CarregaDadosCondicaoPelaDescricao(
  CodigoCondicao: integer): AnsiString;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('select Descricao from Condicao_Pagamento where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= CodigoCondicao;
      open;
    end;

    Result:= qAux.FieldByName('Descricao').AsString;

  except on E: Exception do
  begin
    TMensagens.MensagemErro('Erro ao Carregar Condição de Pagamento: '+e.Message );
    TLog.Error('Erro ao Carregar Condição de Pagamento: '+e.Message );
  end;
  end;
end;

constructor TCondicaoPagamentoDAO.create(var Conexao: TADOConnection);
begin
  Self.Conexao := Conexao;
end;

end.
