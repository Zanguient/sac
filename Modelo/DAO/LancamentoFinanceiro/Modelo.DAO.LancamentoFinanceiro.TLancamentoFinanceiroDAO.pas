unit Modelo.DAO.LancamentoFinanceiro.TLancamentoFinanceiroDAO;

interface

uses
  ADODB, Modelo.Entidade.TLancamentoFinanceiroEntidade, TLoggerUnit;

  type
    TLancamentoFinanceiroDAO = class
      private
        FADOConnection : TADOConnection;
        function salvar(LF: TLancamentoFinanceiroEntidade): Boolean;

      public
        constructor Create(connection : TADOConnection); overload;
        destructor Destroy; override;
        function gravar(LF: TLancamentoFinanceiroEntidade): Boolean;


    end;

implementation

{ TLancamentoFinanceiroDAO }

uses UDM, SysUtils, TypInfo, Util.Mensagens;

constructor TLancamentoFinanceiroDAO.Create(connection: TADOConnection);
begin

end;

destructor TLancamentoFinanceiroDAO.Destroy;
begin
  inherited;
end;

function TLancamentoFinanceiroDAO.gravar( LF: TLancamentoFinanceiroEntidade): Boolean;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('Insert into Lancamento_Financeiro (Codigo, Tipo, N_Documento, Codigo_Empresa, Codigo_Forma_Pagamento, ');
      add('Codigo_Cli_For, Codigo_Tipo_Documento, Historico, Codigo_Departamento, Codigo_Plano, Data_Lancamento,');
      add('Data_Vencimento, Valor_Documento, Desconto, Multa, Valor_Cobrado, Observacoes, Status, Conta_Fixa, Calcula_Juro) values (');
      add(':Codigo, :Tipo, :N_Documento, :Codigo_Empresa, :Codigo_Forma_Pagamento, :Codigo_Cli_For, :Codigo_Tipo_Documento, ');
      add(':Historico, :Codigo_Departamento, :Codigo_Plano, :Data_Lancamento, :Data_Vencimento, :Valor_Documento, ');
      add(':Desconto, :Multa, :Valor_Cobrado, :Observacoes, :Status, :Conta_Fixa, :Calcula_Juro)');

      Parameters.ParamByName('Codigo').Value:= LF.Codigo;
      Parameters.ParamByName('Tipo').Value:= GetEnumName(TypeInfo(TipoLancamentoEnum), 1);
      Parameters.ParamByName('N_Documento').Value:= LF.NDocumento;
      Parameters.ParamByName('Codigo_Empresa').Value:= LF.Codigo_Empresa;
      Parameters.ParamByName('Codigo_Forma_Pagamento').Value:= LF.Codigo_Forma_Pagamento;
      Parameters.ParamByName('Codigo_Cli_For').Value:= LF.Codigo_Cli_For;
      Parameters.ParamByName('Codigo_Tipo_Documento').Value:= LF.Codigo_Tipo_Documento;
      Parameters.ParamByName('Historico').Value:= LF.Historico;
      Parameters.ParamByName('Codigo_Departamento').Value:= LF.Codigo_Departamento;
      Parameters.ParamByName('Codigo_Plano').Value:= LF.Codigo_Plano;
      Parameters.ParamByName('Data_Lancamento').Value:= LF.Data_Lancamento;
      Parameters.ParamByName('Data_Vencimento').Value:= LF.Data_Vencimento;
      Parameters.ParamByName('Valor_Documento').Value:= LF.Valor_Documento;
      Parameters.ParamByName('Desconto').Value:= LF.Desconto;
      Parameters.ParamByName('Multa').Value:= LF.Multa;
      Parameters.ParamByName('Valor_Cobrado').Value:= LF.Valor_Cobrado;
      Parameters.ParamByName('Observacoes').Value:= LF.Observacoes;

      Parameters.ParamByName('Status').Value:= GetEnumName(TypeInfo(StatusEnum), 1);
      Parameters.ParamByName('Conta_Fixa').Value:= LF.Conta_Fixa;
      Parameters.ParamByName('Calcula_Juro').Value:= LF.Calcula_Juro;
      ExecSQL;
    end;
  except on E: Exception do
  begin
    TMensagens.MensagemErro('Gravar lançamento financeiro. Erro: '+e.Message+'. '+DateTimeToStr(now));
    TLogger.GetInstance.Error('Gravar lançamento financeiro. Erro: '+e.Message+'. '+DateTimeToStr(now) );
  end;
  end;
end;

function TLancamentoFinanceiroDAO.salvar(
  LF: TLancamentoFinanceiroEntidade): Boolean;
begin

end;

end.
