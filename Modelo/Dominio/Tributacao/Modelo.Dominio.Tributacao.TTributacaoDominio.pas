unit Modelo.Dominio.Tributacao.TTributacaoDominio;

interface

uses
  Modelo.Entidade.Tributacao.TTributacaoEntidade,
  Modelo.DAO.Tributacao.TributacaoDAO, ADODB, UDeclaracao;

  type
    TTributacaoDominio = class
      private
        FTributacaoEntidade: TTributacaoEntidade;
        FTributacaoDAO: TTributacaoDAO;

        function BuscaIVA(NCM: AnsiString): double;
        function BuscaAliquotaEstadoDestino(UF: AnsiString): integer;
        function BuscaBaseICMS(ValorOperacao, PercBR: double): double;
      public
        constructor Create(Conexao: TADOConnection);
        function CalculaICMS(ValorOperacao, PercBR: Double; AliquotaICMS: integer; UFOrigem, UFDestino: AnsiString): TTributacaoEntidade;
        function CalculaICMSST(var FTributacao: TTributacaoEntidade; NCM, UFOrigem, UFDestino: AnsiString): TTributacaoEntidade;
        function CalculaCreditoICMS(var FTributacao: TTributacaoEntidade; CSOSN: AnsiString; AliquotaSN: double): TTributacaoEntidade;
    end;

implementation

uses
  SysUtils, Util.TLog;

{ TTributacaoDominio }

function TTributacaoDominio.BuscaAliquotaEstadoDestino(UF: AnsiString): integer;
begin
  Result:= FTributacaoDAO.BuscaAliquotaEstadoDestino(UF);
end;

function TTributacaoDominio.BuscaBaseICMS(ValorOperacao,
  PercBR: double): double;
var
  BaseICMS: double;
begin
  BaseICMS:= ValorOperacao - (ValorOperacao * (PercBR/100));
  Result:= BaseICMS;
end;

function TTributacaoDominio.BuscaIVA(NCM: AnsiString): double;
begin
  Result:= FTributacaoDAO.BuscaIVA(NCM);
end;

function TTributacaoDominio.CalculaCreditoICMS(var FTributacao: TTributacaoEntidade; CSOSN: AnsiString;
  AliquotaSN: double): TTributacaoEntidade;
var
  Credito: double;
begin
  TLog.Info('--- MÉTODO CÁLCULAR CRÉDITO ICMS ---');
  TLog.Debug('CSOSN: '+CSOSN);
  TLog.Debug('Aliquota SN: '+FloatToStr(AliquotaSN));
  TLog.Debug('Valor Operação: '+FloatToStr(FTributacao.ValorOperacao));
  if (CSOSN = '101') or (CSOSN = '201') then
  begin
    Credito:= FTributacao.ValorOperacao * (AliquotaSN / 100);
    FTributacao.CreditoICMS:= Calcula_Valor(FloatToStr(Credito));
  end
  else
  begin
    FTributacao.CreditoICMS:= 0;
  end;
  Result:= FTributacao;
  TLog.Info('--- FIM MÉTODO CÁLCULAR CRÉDITO ICMS ---');
end;

function TTributacaoDominio.CalculaICMS(ValorOperacao, PercBR: Double; AliquotaICMS: integer; UFOrigem, UFDestino: AnsiString): TTributacaoEntidade;
var
  ValorICMS, BaseICMS: double;
begin
  TLog.Info('--- MÉTODO CÁLCULAR ICMS ---');
  TLog.Debug('Valor Operação: '+FloatToStr(ValorOperacao));
  TLog.Debug('Percentual de BR: '+FloatToStr(PercBR));
  TLog.Debug('Aliquota Operação: '+IntToStr(AliquotaICMS));
  TLog.Debug('UF Origem: '+UFOrigem);
  TLog.Debug('UF Destino: '+UFDestino);
  BaseICMS:= BuscaBaseICMS(ValorOperacao, PercBR);
  TLog.Debug('Base ICMS: '+FloatToStr(BaseICMS));
  ValorICMS:= BaseICMS * (AliquotaICMS/10000);
  TLog.Debug('Valor ICMS: '+FloatToStr(ValorICMS));

  if (ValorICMS = 0) then
  begin
    FTributacaoEntidade.BaseCalculo:= 0;
  end
  else
  begin
    FTributacaoEntidade.BaseCalculo:= Calcula_Valor(FloatToStr(BaseICMS));
  end;

  FTributacaoEntidade.ValorICMS:= Calcula_Valor(FloatToStr(ValorICMS));
  FTributacaoEntidade.ValorOperacao:= ValorOperacao;
  FTributacaoEntidade.PercBaseRed:= PercBR;
  FTributacaoEntidade.AliquotaOperacao:= AliquotaICMS;
  FTributacaoEntidade.IVA:= 0;
  FTributacaoEntidade.BaseCalculoST:= 0;
  FTributacaoEntidade.ValorICMSST:= 0;
  Result:= FTributacaoEntidade;
  TLog.Info('--- FIM MÉTODO CÁLCULAR ICMS ---');
end;

function TTributacaoDominio.CalculaICMSST(
  var FTributacao: TTributacaoEntidade; NCM, UFOrigem, UFDestino: AnsiString): TTributacaoEntidade;
var
  ICMSNormal, IVA, BaseICMS, BaseICMSST, ICMSAux, ICMSST: double;
  AliquotaEstadoDestino: integer;
begin
  TLog.Info('--- MÉTODO CÁLCULAR ICMS ST ---');
  IVA:= BuscaIVA(NCM);
  TLog.Debug('NCM: '+NCM);
  TLog.Debug('IVA: '+FloatToStr(IVA));
  BaseICMS:= BuscaBaseICMS(FTributacao.ValorOperacao, FTributacao.PercBaseRed);
  TLog.Debug('Base ICMS: '+FloatToStr(BaseICMS));
  ICMSNormal:= BaseICMS * 0.12;
  TLog.Debug('ICMS Normal: '+FloatToStr(ICMSNormal));

  BaseICMSST:= BaseICMS + (BaseICMS * (IVA/100));
  TLog.Debug('Base ICMS ST: '+FloatToStr(BaseICMSST));
  AliquotaEstadoDestino:= BuscaAliquotaEstadoDestino(UFDestino);
  TLog.Debug('Aliquota Destino: '+IntToStr(AliquotaEstadoDestino));
  ICMSAux:= BaseICMSST * (AliquotaEstadoDestino/100);
  TLog.Debug('ICMS Estado Destino: '+FloatToStr(ICMSAux));
  ICMSST:= ICMSAux - ICMSNormal;
  TLog.Debug('ICMS ST: '+FloatToStr(ICMSST));

  FTributacao.IVA:= IVA;
  FTributacao.BaseCalculoST:= Calcula_Valor(FloatToStr(BaseICMSST));
  FTributacao.AliquotaEstadoDestino:= AliquotaEstadoDestino;
  FTributacao.ValorICMSST:= Calcula_Valor(FloatToStr(ICMSST));
  FTributacao.BaseCalculo:= 0;
  Result:= FTributacao;
  TLog.Info('--- FIM MÉTODO CÁLCULAR ICMS ST ---');
end;

constructor TTributacaoDominio.Create(Conexao: TADOConnection);
begin
  FTributacaoEntidade:= TTributacaoEntidade.Create;
  FTributacaoDAO:= TTributacaoDAO.Create(Conexao);
end;

end.
