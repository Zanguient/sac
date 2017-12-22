unit Modelo.Dominio.EntradaProdutos.ItensEntrada;

interface

uses
  Entidade.TItensEntrada, UDeclaracao, SysUtils, Entidade.TImpostosEntrada,
  Modelo.DAO.EntradaProdutos.ItensEntrada, ADODB,
  Modelo.Entidade.ItensTabelaPreco, Modelo.Dominio.ItensTabelaPrecoDominio;
type
  TItensEntradaDominio = class
    private
      FItensEntrada : TItensEntradaEntidade;
      FItensEntradaDAO: TItensEntradaDAO;
      FItensTabelaPrecoEntidade: TItensTabelaPrecoEntidade;
      Conexao: TADOConnection;
      FItensTabelaPrecoDominio: TItensTabelaPrecoDominio;
    public
      constructor Create(var Conexao: TADOConnection);
      function GravaItem(var FItemNota: TItensEntradaEntidade): Boolean;
      function AtualizaItemChegadoEntrada(CodigoProduto, CodigoEntrada: integer; Checado: AnsiString): Integer;
      function RemoveItem(CodigoProduto, CodigoEntrada: integer): Boolean;
      function RemoveTudo(CodigoEntrada: integer): Boolean;
      function CalculaValorTotal(var ItensEntrada: TItensEntradaEntidade): TItensEntradaEntidade;
      function CalculaValorTotalIPI(var ItensEntrada: TItensEntradaEntidade): TItensEntradaEntidade;
      function CalculaDespesas(var ItensEntrada: TItensEntradaEntidade; Impostos: TImpostosEntradaEntidade): TItensEntradaEntidade;
      function CalculaCustoTotal(var ItensEntrada: TItensEntradaEntidade): TItensEntradaEntidade;
      function CalculaBCICMSST(var ItensEntrada: TItensEntradaEntidade): TItensEntradaEntidade;
      function CalculaValorICMSST(var ItensEntrada: TItensEntradaEntidade): TItensEntradaEntidade;
      function CalculaBCICMS(var ItensEntrada: TItensEntradaEntidade): TItensEntradaEntidade;
      function CalculaValorICMS(var ItensEntrada: TItensEntradaEntidade): TItensEntradaEntidade;
      function CalculaPrecoVenda(PLucro, ValorBase: Double): double;
  end;
implementation

{ TItensEntradaDominio }

function TItensEntradaDominio.AtualizaItemChegadoEntrada(CodigoProduto, CodigoEntrada: integer; Checado: AnsiString): Integer;
begin
  try
    FItensEntradaDAO.AtualizaItemChegado(CodigoProduto, CodigoEntrada, Checado);
  finally

  end;
end;

function TItensEntradaDominio.CalculaCustoTotal(
  var ItensEntrada: TItensEntradaEntidade): TItensEntradaEntidade;
var
  TotalDespesas, DespesasAdicionais, PercDespesasAdicionais,
  CustoUnitario, valorICMSST, qtde: double;
begin
  //calcular custo
  TotalDespesas:= ItensEntrada.Valor_Total + ItensEntrada.Valor_IPI + ItensEntrada.Valor_Frete_Unitario + ItensEntrada.Valor_ICMS_ST;
  DespesasAdicionais:= custo_op + StrToFloat(aliquota_sn);

  PercDespesasAdicionais:= TotalDespesas * ( DespesasAdicionais /100);
  TotalDespesas:= TotalDespesas + PercDespesasAdicionais;
  qtde:= ItensEntrada.Quantidade * ItensEntrada.Quantidade_Volume;
  CustoUnitario:= Calcula_Valor(FloatToStr(TotalDespesas/qtde));
  ItensEntrada.Custo_Unitario:= CustoUnitario;
  Result:= ItensEntrada;
end;

function TItensEntradaDominio.CalculaDespesas(var ItensEntrada: TItensEntradaEntidade; Impostos: TImpostosEntradaEntidade): TItensEntradaEntidade;
var
  percentual_vttp, somatoria_despesas, cdi: double;
begin
  //Calcula despesas da nota (frete, seguro, descontos no fim)
  percentual_vttp:= ItensEntrada.Valor_Total / Impostos.Total_Produtos;
  somatoria_despesas:= ( (Impostos.Valor_Frete + Impostos.Valor_Seguro + Impostos.Outras_Despesas) - Impostos.Desconto);
  cdi:= Calcula_Valor_Tres_Casas(FloatToStr(percentual_vttp * somatoria_despesas));
  ItensEntrada.Valor_Frete_Unitario:= Calcula_Valor_Tres_Casas(FloatToStr(cdi));
  Result:= ItensEntrada;
end;

function TItensEntradaDominio.CalculaBCICMS(
  var ItensEntrada: TItensEntradaEntidade): TItensEntradaEntidade;
begin
  //base de calculo ICMS
  ItensEntrada.BC_ICMS:= ItensEntrada.Valor_Unitario * ItensEntrada.Quantidade;

  Result:= ItensEntrada;
end;

function TItensEntradaDominio.CalculaBCICMSST(
  var ItensEntrada: TItensEntradaEntidade): TItensEntradaEntidade;
var
  valorTotalComIPI, bc_st, iva, valorICMSInterno, valorICMSST: double;
begin
  //calcular valor_icms_st
  iva:= ItensEntrada.IVA;
  valorTotalComIPI:= ItensEntrada.Valor_Total + ItensEntrada.Valor_IPI;
  bc_st:= ( valorTotalComIPI * ( iva / 100) ); //valor total do item + ipi + %IVA
  bc_st:= Calcula_Valor(FloatToStr(valorTotalComIPI + bc_st));
  ItensEntrada.BC_ICMS_ST:= bc_st;
  Result:= ItensEntrada;

end;

function TItensEntradaDominio.CalculaValorICMSST(
  var ItensEntrada: TItensEntradaEntidade): TItensEntradaEntidade;
var
  valorICMSInterno, valorICMSST: double;
begin
  valorICMSInterno:= ItensEntrada.BC_ICMS_ST * 0.17;           //17% é a aliquota do estado de goiás
  valorICMSInterno:= Calcula_Valor(FloatToStr(valorICMSInterno));

  valorICMSST:= (ItensEntrada.Valor_ICMS_Unitario - valorICMSInterno);
  valorICMSST:= Abs(valorICMSST);
  valorICMSST:= Calcula_Valor(FloatToStr(valorICMSST));

  ItensEntrada.Valor_ICMS_ST:= valorICMSST;
  Result:= ItensEntrada;
end;

function TItensEntradaDominio.CalculaPrecoVenda(PLucro, ValorBase: Double): double;
begin
  FItensTabelaPrecoDominio:= TItensTabelaPrecoDominio.Create(PLucro, ValorBase, 0, Conexao);

  Result:= FItensTabelaPrecoDominio.CalculaPrecoVista;
end;

function TItensEntradaDominio.CalculaValorICMS(
  var ItensEntrada: TItensEntradaEntidade): TItensEntradaEntidade;
var
  bc, ali_icms, valor_icms: double;
begin
  bc:= ItensEntrada.BC_ICMS;
  //valor_icms
  if (ItensEntrada.Aliquota_ICMS = '0') then
  begin
    ItensEntrada.Valor_ICMS_Unitario:= 0;
  end else begin
    ali_icms:= (StrToInt(ItensEntrada.Aliquota_ICMS) / 100) * bc;
    valor_icms:= Calcula_Valor(FloatToStr(ali_icms));
    ItensEntrada.Valor_ICMS_Unitario:= valor_icms;
  end;
end;

function TItensEntradaDominio.CalculaValorTotal(
  var ItensEntrada: TItensEntradaEntidade): TItensEntradaEntidade;
begin
  //calcular valor total
  ItensEntrada.Valor_Total:= Calcula_Valor_Tres_Casas(FloatToStr(ItensEntrada.Quantidade * ItensEntrada.Valor_Unitario));;
  Result:= ItensEntrada;
end;

function TItensEntradaDominio.CalculaValorTotalIPI(
  var ItensEntrada: TItensEntradaEntidade): TItensEntradaEntidade;
var
  valor_ipi: double;
  ipi: Integer;
begin
  //calcular ipi
  ipi:= StrToInt(ItensEntrada.Aliquota_IPI);
  valor_ipi:= ipi / 100;
  valor_ipi:= valor_ipi * ItensEntrada.Valor_Total;
  valor_ipi:= Calcula_Valor_Tres_Casas(FloatToStr(valor_ipi));
  ItensEntrada.Valor_IPI:= valor_ipi;
  Result:= ItensEntrada;
end;

constructor TItensEntradaDominio.Create(var Conexao: TADOConnection);
begin
  Self.Conexao:= Conexao;
  FItensEntradaDAO:= TItensEntradaDAO.Create(Conexao);
end;

function TItensEntradaDominio.GravaItem(var FItemNota: TItensEntradaEntidade): Boolean;
begin
  try
    try
      //FItensEntrada:= calculaValoresItensNota(FItemNota, FImpostosEntrada);
      FItensEntradaDAO.gravaItem(FItemNota);
    except

    end;
  finally

  end;
end;

function TItensEntradaDominio.RemoveItem(CodigoProduto, CodigoEntrada: integer): Boolean;
begin
  try
  begin
    FItensEntradaDAO.RemoveItem(CodigoProduto, CodigoEntrada);
  end;
  finally

  end;
end;

function TItensEntradaDominio.RemoveTudo(CodigoEntrada: integer): Boolean;
begin
  try
    FItensEntradaDAO.RemoveTudo(CodigoEntrada);
  finally

  end;
end;

end.
