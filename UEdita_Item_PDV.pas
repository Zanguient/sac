unit UEdita_Item_PDV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, ComCtrls, ToolWin, Data.DB,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, UGeral, Modelo.Dominio.LancamentoFinanceiro.TParcelasLancamentoFinanceiroDominio,
  Modelo.Dominio.LancamentoFinanceiro.TLancamentoFinanceiroDominio, Modelo.Dominio.TCondicaoPagamentoDominio,
  Modelo.Entidade.Cliente.TCliente, Modelo.Entidade.TParcelasLancamentoFinanceiroEntidade, Modelo.Entidade.TLancamentoFinanceiroEntidade,
  Modelo.Entidade.TCondicaoPagamentoEntidade, Modelo.Entidade.DocumentosFinanceiro.TPromissoriaEntidade,
  Modelo.Dominio.DocumentosFinanceiro.TPromissoriaDominio, Modelo.Dominio.Cliente.TClienteDominio,
  Modelo.DAO.TDepartamentoDAO;

type
  TFrmEdita_Item_PDV = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnOK: TToolButton;
    ImgImagens_Comandos: TImageList;
    BBtnSair: TToolButton;
    DBGrid1: TDBGrid;
    qryitens_nf: TADOQuery;
    DataSource1: TDataSource;
    qryitens_nfCodigo_Registro: TAutoIncField;
    qryitens_nfCodigo: TIntegerField;
    qryitens_nfN_Item: TStringField;
    qryitens_nfCodigo_Produto: TIntegerField;
    qryitens_nfCodigo_Venda: TStringField;
    qryitens_nfDescricao: TStringField;
    qryitens_nfNCM: TStringField;
    qryitens_nfOrigem: TStringField;
    qryitens_nfCFOP: TStringField;
    qryitens_nfUN: TStringField;
    qryitens_nfTipo_Calculo_BC_ICMS: TStringField;
    qryitens_nfTipo_Recolhimento: TStringField;
    qryitens_nfICMS: TStringField;
    qryitens_nfCST: TStringField;
    qryitens_nfCSOSN: TStringField;
    qryitens_nfBase_Reduzida: TStringField;
    qryitens_nfBC: TStringField;
    qryitens_nfValor_ICMS: TStringField;
    qryitens_nfTipo_Calculo_BC_ICMS_ST: TStringField;
    qryitens_nfMVAST: TStringField;
    qryitens_nfICMS_ST: TStringField;
    qryitens_nfCST_ST: TStringField;
    qryitens_nfBase_Reduzida_ST: TStringField;
    qryitens_nfBase_Acrescida_ST: TStringField;
    qryitens_nfBC_ST: TStringField;
    qryitens_nfAliquota_Calculo_Credito: TStringField;
    qryitens_nfCredito_ICMS: TStringField;
    qryitens_nfTipo_Calculo_IPI: TStringField;
    qryitens_nfIPI: TStringField;
    qryitens_nfCST_IPI: TStringField;
    qryitens_nfBase_Reduzida_IPI: TStringField;
    qryitens_nfBase_Acrescida_IPI: TStringField;
    qryitens_nfBC_IPI: TStringField;
    qryitens_nfValor_IPI: TFloatField;
    qryitens_nfTipo_Calculo_PIS: TStringField;
    qryitens_nfPIS: TStringField;
    qryitens_nfCST_PIS: TStringField;
    qryitens_nfBase_Reduzida_PIS: TStringField;
    qryitens_nfBase_Acrescida_PIS: TStringField;
    qryitens_nfBC_PIS: TStringField;
    qryitens_nfValor_PIS: TFloatField;
    qryitens_nfTipo_Calculo_COFINS: TStringField;
    qryitens_nfCOFINS: TStringField;
    qryitens_nfCST_COFINS: TStringField;
    qryitens_nfBase_Reduzida_COFINS: TStringField;
    qryitens_nfBase_Acrescida_COFINS: TStringField;
    qryitens_nfBC_COFINS: TStringField;
    qryitens_nfValor_COFINS: TFloatField;
    qryitens_nfQtde: TFloatField;
    qryitens_nfQtde_Entregue: TFloatField;
    qryitens_nfQtde_Restante: TFloatField;
    qryitens_nfQtde_S_Previsao: TFloatField;
    qryitens_nfValor_Compra: TFloatField;
    qryitens_nfValor_Original: TFloatField;
    qryitens_nfValor_Unitario: TFloatField;
    qryitens_nfDesc_Acr: TFloatField;
    qryitens_nfDesc_Acr_P: TFloatField;
    qryitens_nfTipo_Desc_Acr: TStringField;
    qryitens_nfdOUa: TStringField;
    qryitens_nfValor_Frete: TFloatField;
    qryitens_nfValor_Seguro: TFloatField;
    qryitens_nfOutras_Despesas: TFloatField;
    qryitens_nfSub_Total: TFloatField;
    qryitens_nfSub_Total_Liquido: TFloatField;
    qryitens_nfCancelado: TStringField;
    qryitens_nfIndica_Valor_Total: TStringField;
    qryitens_nfData_Entrega: TDateTimeField;
    qryitens_nfHora_Entrega: TStringField;
    qryitens_nfTipo_Venda: TStringField;
    qryitens_nfTipo_Entrega: TStringField;
    qryitens_nfComissao: TFloatField;
    qryitens_nfPerc_Desc_Vista: TFloatField;
    qryitens_nfPerc_Desc_Prazo: TFloatField;
    qryitens_nfPermite_Credito: TIntegerField;
    qryitens_nfCodigo_Obs_Fiscal: TIntegerField;
    qryitens_nfQtde_Estoque_Atual: TFloatField;
    qryitens_nfValor_Compra_Nota: TFloatField;
    qryitens_nfFicha_Estoque_Codigo: TIntegerField;
    qryitens_nfValor_ICMS_ST: TFloatField;
    qryitens_nfMD5: TStringField;
    qryitens_nfCod_Cli: TIntegerField;
    qryitens_nfInscricao_Estadual: TStringField;
    qryitens_nfInsc_Municipal: TStringField;
    qryitens_nfEmail: TStringField;
    qryitens_nfSuframa: TStringField;
    qryitens_nfEnquadramento: TStringField;
    qryitens_nfCidade: TStringField;
    qryitens_nfNome: TStringField;
    qryitens_nfCPF_CNPJ: TStringField;
    qryitens_nfUF: TStringField;
    qryitens_nfCodigo_Municipio: TStringField;
    qryitens_nfSetor: TStringField;
    qryitens_nfLog: TStringField;
    qryitens_nfCEP: TStringField;
    qryitens_nfNumero: TStringField;
    qryitens_nfComplemento: TStringField;
    qryitens_nfTelefone: TStringField;
    qryitens_nfForma_Pagamento: TStringField;
    qryitens_nfQtde_Parcela: TIntegerField;
    qryitens_nfPrazo: TIntegerField;
    qryitens_nfTaxa: TFloatField;
    qryitens_nfCodigo_Forma_Pagamento: TIntegerField;
    qryitens_nfForma_Pagamento_1: TStringField;
    qryitens_nfTipo_Pagamento: TStringField;
    qryitens_nfEstoque: TFloatField;
    qryitens_nfVolume: TFloatField;
    qryitens_nfValor_Compra_Atual: TFloatField;
    procedure BBtnSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnOKClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    Utili: UGeral.TUtil;
    oLFDominio: TLancamentoFinanceiroDominio;
    oPLFDominio: TParcelasLancamentoFinanceiroDominio;
    oCPDominio: TCondicaoPagamentoDominio;

    oLF: TLancamentoFinanceiroEntidade;
    oPLF: TParcelasLancamentoFinanceiroEntidade;
    oCP: TCondicaoPagamentoEntidade;
    oCli: TClienteEntidade;
    oCliDominio: TClienteDominio;
    oP: TPromissoriaEntidade;
    oPDominio: TPromissoriaDominio;
    CodigoPedido: integer;
    CupomOuNFe: integer;
    { Private declarations }
  public
    constructor Create(Sender: TObject; var oLFPara: TLancamentoFinanceiroEntidade; var oPLFPara: TParcelasLancamentoFinanceiroEntidade;
    var oCPPara: TCondicaoPagamentoEntidade; var oCliPara: TClienteEntidade; CodigoPedido: integer); overload;
    { Public declarations }
    var
      preview: boolean;
      ativo: boolean;
  end;

var
  FrmEdita_Item_PDV: TFrmEdita_Item_PDV;

implementation

uses UChama_Lancamentos_Financeiros, URel_Lancamento_Contas,
  UConciliacao_Bancaria, URel_Conciliacao_Bancaria,
  URel_Lancamento_Contas_Agrupado, UConsulta_Cheque, URel_Consulta_Cheque,
  URel_Consulta_Lancamento_Banco, UConsulta_Lancamento_Banco,
  UConsulta_Saldo_Bancario, URel_Consulta_Saldo_Bancario, UTabela_Produto,
  URel_Tabela_Preco, URel_Movimentacao_Saida, UMovimentacao_Saida,
  UEstoque_Produto, URel_Estoque_Produto, UChama_Condicao_Pagamento, UPDV,
  URel_Carne, UDeclaracao, UChama_Cliente,
  Util.GeradorDeCodigo,
  DateUtils, Util.Mensagens, URel_Lista_Separacao, UNFE, UChama_Departamento,
  UDM, URel_Promissoria, Util.TLog, DadosEmissaoNFEItens;

{$R *.dfm}

procedure TFrmEdita_Item_PDV.BBtnOKClick(Sender: TObject);
begin
  TLog.Info('--- BOTÃO OK DA TELA Edita_item_PDV ---');
  FrmPDV.DadosEmissaoNFE.Itens.Clear;
  qryitens_nf.First;
  while not qryitens_nf.Eof do
  begin
    //Inc(item);
    FrmPDV.DadosEmissaoNFEItens:= TDadosEmissaoNFEItens.Create;
    FrmPDV.DadosEmissaoNFEItens.ValorUnitario:= qryitens_nfValor_Unitario.AsFloat;
    FrmPDV.DadosEmissaoNFEItens.CodigoVenda:= qryitens_nfCodigo_Venda.AsString;
    FrmPDV.DadosEmissaoNFEItens.DescricaoProduto:= qryitens_nfDescricao.AsString;
    FrmPDV.DadosEmissaoNFEItens.NCM:= qryitens_nfNCM.AsString;
    FrmPDV.DadosEmissaoNFEItens.CFOP:= StringReplace(qryitens_nfCFOP.AsString, '.', '',
        [rfReplaceAll]);
    FrmPDV.DadosEmissaoNFEItens.Unidade:= qryitens_nfUN.AsString;
    FrmPDV.DadosEmissaoNFEItens.Quantidade:= qryitens_nfQtde.AsFloat;
    FrmPDV.DadosEmissaoNFEItens.ValorOriginal:= qryitens_nfValor_Original.AsFloat;
    FrmPDV.DadosEmissaoNFEItens.ValorFrete:= qryitens_nfValor_Frete.AsFloat;
    FrmPDV.DadosEmissaoNFEItens.ValorSeguro:= qryitens_nfValor_Seguro.AsFloat;
    FrmPDV.DadosEmissaoNFEItens.DouA:= qryitens_nfdOUa.AsString;
    FrmPDV.DadosEmissaoNFEItens.DescAcr:= qryitens_nfDesc_Acr.AsFloat;
    FrmPDV.DadosEmissaoNFEItens.OutrasDespesas:= qryitens_nfOutras_Despesas.AsFloat;
    FrmPDV.DadosEmissaoNFEItens.CSOSN:= qryitens_nfCSOSN.AsString;
    FrmPDV.DadosEmissaoNFEItens.AliquotaCalculoCredito:= qryitens_nfAliquota_Calculo_Credito.AsFloat;
    FrmPDV.DadosEmissaoNFEItens.CreditoICMS:= qryitens_nfCredito_ICMS.AsString;
    FrmPDV.DadosEmissaoNFEItens.TipoCalculoBCICMSST:= qryitens_nfTipo_Calculo_BC_ICMS_ST.AsString;
    FrmPDV.DadosEmissaoNFEItens.MVAST:= qryitens_nfMVAST.AsString;
    FrmPDV.DadosEmissaoNFEItens.BCST:= qryitens_nfBC_ST.AsString;
    FrmPDV.DadosEmissaoNFEItens.ValorICMSST:= qryitens_nfValor_ICMS_ST.AsString;
    FrmPDV.DadosEmissaoNFEItens.ICMSST:= qryitens_nfICMS_ST.AsString;
    FrmPDV.DadosEmissaoNFEItens.TipoCalculoBCICMS:= qryitens_nfTipo_Calculo_BC_ICMS.AsString;
    FrmPDV.DadosEmissaoNFEItens.BCReduzida:= qryitens_nfBase_Reduzida.AsString;
    FrmPDV.DadosEmissaoNFEItens.BC:= qryitens_nfBC.AsString;
    FrmPDV.DadosEmissaoNFEItens.ICMS:= qryitens_nfICMS.AsString;
    FrmPDV.DadosEmissaoNFEItens.ValorICMS:= qryitens_nfValor_ICMS.AsString;
    FrmPDV.DadosEmissaoNFEItens.IPI:= qryitens_nfIPI.AsString;
    FrmPDV.DadosEmissaoNFEItens.ValorIPI:= qryitens_nfValor_IPI.AsString;
    FrmPDV.DadosEmissaoNFEItens.CST:= qryitens_nfCST.AsString;
    FrmPDV.DadosEmissaoNFEItens.Origem:= qryitens_nfOrigem.AsInteger;
    FrmPDV.DadosEmissaoNFEItens.CSTIPI:= qryitens_nfCST_IPI.AsString;
    FrmPDV.DadosEmissaoNFEItens.BCIPI:= qryitens_nfBC_IPI.AsString;
    FrmPDV.DadosEmissaoNFEItens.IPI:= qryitens_nfIPI.AsString;
    FrmPDV.DadosEmissaoNFEItens.ValorIPI:= qryitens_nfValor_IPI.AsString;
    FrmPDV.DadosEmissaoNFEItens.CSTPIS:= qryitens_nfCST_PIS.AsString;
    FrmPDV.DadosEmissaoNFEItens.BCPIS:= qryitens_nfBC_PIS.AsString;
    FrmPDV.DadosEmissaoNFEItens.PIS:= qryitens_nfPIS.AsString;
    FrmPDV.DadosEmissaoNFEItens.ValorPIS:= qryitens_nfValor_PIS.AsString;
    FrmPDV.DadosEmissaoNFEItens.CSTCOFINS:= qryitens_nfCST_COFINS.AsString;
    FrmPDV.DadosEmissaoNFEItens.BCCOFINS:= qryitens_nfBC_COFINS.AsString;
    FrmPDV.DadosEmissaoNFEItens.COFINS:= qryitens_nfCOFINS.AsString;
    FrmPDV.DadosEmissaoNFEItens.ValorCOFINS:= qryitens_nfValor_COFINS.AsString;
    FrmPDV.DadosEmissaoNFE.Itens.Add(FrmPDV.DadosEmissaoNFEItens);
    qryitens_nf.next;
  end;
  TMensagens.MensagemInformacao('Itens atualizados com sucesso!');
  TLog.Info('--- FIM BOTÃO OK DA TELA Edita_item_PDV ---');
  Close;
end;

procedure TFrmEdita_Item_PDV.BBtnSairClick(Sender: TObject);
begin
  close;
end;

constructor TFrmEdita_Item_PDV.Create(Sender: TObject;
  var oLFPara: TLancamentoFinanceiroEntidade;
  var oPLFPara: TParcelasLancamentoFinanceiroEntidade;
  var oCPPara: TCondicaoPagamentoEntidade; var oCliPara: TClienteEntidade;
  CodigoPedido: integer);
begin

end;

procedure TFrmEdita_Item_PDV.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

  if dm.qryitens_vendaCancelado.AsString = 'S' then
    DBGrid1.Canvas.Font.Color:= clRed;
  dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
end;

procedure TFrmEdita_Item_PDV.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmEdita_Item_PDV.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

end.


