unit Modelo.DAO.LancamentoFinanceiro.TParcelasLancamentoFinanceiroDAO;

interface

uses
  Modelo.Entidade.TParcelasLancamentoFinanceiroEntidade, ADODB, Modelo.Entidade.TLancamentoFinanceiroEntidade;

  type
    TParcelasLancamentoFinanceiroDAO = class
      private
        Conexao : TADOConnection;
        function salvar(PLF: TParcelasLancamentoFinanceiroEntidade): Boolean;
      public
        constructor Create(var Conexao : TADOConnection); overload;
        destructor Destroy; override;
        function gravar(PLF: TParcelasLancamentoFinanceiroEntidade): Boolean;
        function retornaParcelasLancamentos(LF: TLancamentoFinanceiroEntidade): String;
    end;

implementation

{ TParcelasLancamentoFinanceiroDAO }

uses UDM, SysUtils, TLoggerUnit, System.TypInfo, Util.Mensagens, URegistro,
  UDeclaracao, Modelo.DAO.TCondicaoPagamentoDAO;

constructor TParcelasLancamentoFinanceiroDAO.Create(var Conexao: TADOConnection);
begin
  Self.Conexao := Conexao;
end;

destructor TParcelasLancamentoFinanceiroDAO.Destroy;
begin

  inherited;
end;

function TParcelasLancamentoFinanceiroDAO.gravar(PLF: TParcelasLancamentoFinanceiroEntidade): Boolean;
var
  qAux: TADOQuery;
  s: AnsiString;
  Fechamento_Venda: TFechamento_Venda;
  CondicaoDAO: TCondicaoPagamentoDAO;
begin
  try
    CondicaoDAO:= TCondicaoPagamentoDAO.Create(Conexao);
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('Insert into Parcelas_Lancamentos (Codigo, N_Documento, Data_Vencimento, Data_Pagamento, ');
      add('Parcela, Status, Valor, Valor_Pagar, Codigo_Forma_Pagamento_Parcela, Valor_Restante, Desconto, Acrescimo, Valor_Pago) values (:Codigo, :N_Documento, :Data_Vencimento, :Data_Pagamento, ');
      add(':Parcela, :Status, :Valor, :Valor_Pagar, :Codigo_Forma_Pagamento_Parcela, :Valor_Restante, :Desconto, :Acrescimo, :Valor_Pago)');

      Parameters.ParamByName('Codigo').Value:= PLF.Codigo;
      Parameters.ParamByName('N_Documento').Value:= PLF.N_Documento;
      Parameters.ParamByName('Data_Vencimento').Value:= PLF.Data_Vencimento;
      Parameters.ParamByName('Data_Pagamento').Value:= PLF.Data_Pagamento;
      Parameters.ParamByName('Parcela').Value:= PLF.Parcela;
      s:= GetEnumName(TypeInfo(StatusEnumParcela),integer(PLF.Status));
      Parameters.ParamByName('Status').Value:= s;
      Parameters.ParamByName('Valor').Value:= PLF.Valor;
      Parameters.ParamByName('Valor_Pagar').Value:= PLF.Valor_Pagar;
      Parameters.ParamByName('Codigo_Forma_Pagamento_Parcela').Value:= PLF.Codigo_Forma_Pagamento_Parcela;
      Parameters.ParamByName('Valor_Restante').Value:= PLF.Valor_Restante;
      Parameters.ParamByName('Desconto').Value:= PLF.Desconto;
      Parameters.ParamByName('Acrescimo').Value:= PLF.Acrescimo;
      Parameters.ParamByName('Valor_Pago').Value:= PLF.Valor_Pago;
      ExecSQL;

      if (s = 'PAGO') then
      begin
        Fechamento_Venda.Salva_Conta(PLF.N_Documento, codigo_empresa, codigo_usu, codigo_usu, 0, 0,
                                     PLF.N_Documento, PLF.Parcela,
                                     CondicaoDAO.CarregaDadosCondicaoPelaDescricao(PLF.Codigo_Forma_Pagamento_Parcela),
                                     'NFE', 'PAGO', '+', PLF.Valor_Pagar, 0, PLF.Data_Pagamento);
      end
      else
      begin
        Fechamento_Venda.Salva_Conta(PLF.N_Documento, codigo_empresa, codigo_usu, codigo_usu, 0, 0,
                                     PLF.N_Documento, PLF.Parcela,
                                     CondicaoDAO.CarregaDadosCondicaoPelaDescricao(PLF.Codigo_Forma_Pagamento_Parcela),
                                     'NFE', 'PENDENTE', '+', PLF.Valor_Pagar, 0, PLF.Data_Pagamento);
      end;

    end;
  except on E: Exception do
  begin
    TMensagens.MensagemErro('Gravar parcelas lançamento financeiro. Erro: '+e.Message+'. '+DateTimeToStr(now));
    TLogger.GetInstance.Error('Gravar parcelas lançamento financeiro. Erro: '+e.Message+'. '+DateTimeToStr(now) );
  end;
  end;
end;

function TParcelasLancamentoFinanceiroDAO.retornaParcelasLancamentos(
  LF: TLancamentoFinanceiroEntidade): String;
var
  Aux: String;
begin
  try
    Aux:= ('select * from Parcelas_Lancamentos PL '
    +'where PL.Codigo = '+ IntToStr(LF.Codigo) +'');
    result:= Aux;
  except on E: Exception do
  begin
    TMensagens.MensagemErro('Retornar parcelas lançamento financeiro. Erro: '+e.Message+'. '+DateTimeToStr(now));
    TLogger.GetInstance.Error('Retornar parcelas lançamento financeiro. Erro: '+e.Message+'. '+DateTimeToStr(now) );
  end;
  end;
end;

function TParcelasLancamentoFinanceiroDAO.salvar(
  PLF: TParcelasLancamentoFinanceiroEntidade): Boolean;
begin

end;

end.
