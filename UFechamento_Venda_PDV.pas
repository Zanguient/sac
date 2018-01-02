unit UFechamento_Venda_PDV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UGeral, URegistro, DB, ADODB, DBClient, Grids,
  DBGrids, ComCtrls, Provider, DateUtils, RSPrint, TLoggerUnit,
  Modelo.Entidade.Estoque.TFichaEstoque, Modelo.Entidade.Estoque.TFichaEstoqueLista,
  ACBrEnterTab, ACBrBase,
  Modelo.Entidade.TLancamentoFinanceiroEntidade,
  Modelo.Entidade.TParcelasLancamentoFinanceiroEntidade,
  Modelo.Entidade.TCondicaoPagamentoEntidade,
  Modelo.Dominio.TCondicaoPagamentoDominio,
  Modelo.Dominio.LancamentoFinanceiro.TLancamentoFinanceiroDominio,
  Modelo.Entidade.Cliente.TCliente,
  ACBrPosPrinter;

type
  TFrmFechamento_Venda_PDV = class(TForm)
    LblSubTotal: TLabel;
    EdtSub_Total: TEdit;
    LblDesAcr: TLabel;
    EdtDesconto: TEdit;
    Label3: TLabel;
    EdtTotal_Venda: TEdit;
    Label4: TLabel;
    EdtValor_Recebido: TEdit;
    Label5: TLabel;
    EdtTroco: TEdit;
    Shape1: TShape;
    LblFechamento: TLabel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    EdtValor: TEdit;
    ListBox1: TListBox;
    LblData_Pedido: TLabel;
    LblN_Pedido: TLabel;
    Label7: TLabel;
    EdtForma_Pagamento: TEdit;
    LblCodigo: TLabel;
    Shape7: TShape;
    LblHnde: TLabel;
    LblFecha: TLabel;
    ADOQuery1: TADOQuery;
    ADOQuery1N_Documento: TIntegerField;
    ADOQuery1Data_Vencimento: TDateTimeField;
    ADOQuery1Valor: TFloatField;
    qryitens_venda: TADOQuery;
    qryitens_vendaCodigo: TIntegerField;
    qryitens_vendaN_Item: TStringField;
    qryitens_vendaCodigo_Produto: TIntegerField;
    qryitens_vendaCodigo_Venda: TStringField;
    qryitens_vendaDescricao: TStringField;
    qryitens_vendaNCM: TStringField;
    qryitens_vendaOrigem: TStringField;
    qryitens_vendaCFOP: TStringField;
    qryitens_vendaUN: TStringField;
    qryitens_vendaTipo_Calculo_BC_ICMS: TStringField;
    qryitens_vendaTipo_Recolhimento: TStringField;
    qryitens_vendaICMS: TStringField;
    qryitens_vendaCST: TStringField;
    qryitens_vendaCSOSN: TStringField;
    qryitens_vendaBase_Reduzida: TStringField;
    qryitens_vendaBase_Acrescida: TStringField;
    qryitens_vendaBC: TStringField;
    qryitens_vendaValor_ICMS: TStringField;
    qryitens_vendaTipo_Calculo_BC_ICMS_ST: TStringField;
    qryitens_vendaMVAST: TStringField;
    qryitens_vendaICMS_ST: TStringField;
    qryitens_vendaCST_ST: TStringField;
    qryitens_vendaBase_Reduzida_ST: TStringField;
    qryitens_vendaBase_Acrescida_ST: TStringField;
    qryitens_vendaBC_ST: TStringField;
    qryitens_vendaValor_ICMS_ST: TStringField;
    qryitens_vendaAliquota_Calculo_Credito: TStringField;
    qryitens_vendaCredito_ICMS: TStringField;
    qryitens_vendaTipo_Calculo_IPI: TStringField;
    qryitens_vendaIPI: TStringField;
    qryitens_vendaCST_IPI: TStringField;
    qryitens_vendaBase_Reduzida_IPI: TStringField;
    qryitens_vendaBase_Acrescida_IPI: TStringField;
    qryitens_vendaBC_IPI: TStringField;
    qryitens_vendaValor_IPI: TFloatField;
    qryitens_vendaTipo_Calculo_PIS: TStringField;
    qryitens_vendaPIS: TStringField;
    qryitens_vendaCST_PIS: TStringField;
    qryitens_vendaBase_Reduzida_PIS: TStringField;
    qryitens_vendaBase_Acrescida_PIS: TStringField;
    qryitens_vendaBC_PIS: TStringField;
    qryitens_vendaValor_PIS: TFloatField;
    qryitens_vendaTipo_Calculo_COFINS: TStringField;
    qryitens_vendaCOFINS: TStringField;
    qryitens_vendaCST_COFINS: TStringField;
    qryitens_vendaBase_Reduzida_COFINS: TStringField;
    qryitens_vendaBase_Acrescida_COFINS: TStringField;
    qryitens_vendaBC_COFINS: TStringField;
    qryitens_vendaValor_COFINS: TFloatField;
    qryitens_vendaQtde: TFloatField;
    qryitens_vendaValor_Unitario: TFloatField;
    qryitens_vendaValor_Frete: TFloatField;
    qryitens_vendaValor_Seguro: TFloatField;
    qryitens_vendaOutras_Despesas: TFloatField;
    qryitens_vendaSub_Total: TFloatField;
    qryitens_vendaSub_Total_Liquido: TFloatField;
    qryitens_vendaCancelado: TStringField;
    qryitens_vendaIndica_Valor_Total: TStringField;
    qryitens_vendaDesc_Acr: TFloatField;
    qryitens_vendaTipo_Desc_Acr: TStringField;
    qryitens_vendaCodigo_Registro: TAutoIncField;
    qryitens_vendaMarca: TStringField;
    qryitens_vendaValor_Original: TFloatField;
    qryitens_vendaValor_Compra: TFloatField;
    Label8: TLabel;
    RGTipo: TRadioGroup;
    RGDesc_Acr: TRadioGroup;
    qryitens_vendaQtde_Estoque_Atual: TFloatField;
    MmoDados_Adicionais: TMemo;
    Label9: TLabel;
    qryitens_vendaTipo_Calculo_BC_ICMS_NF: TStringField;
    qryitens_vendaTipo_Recolhimento_NF: TStringField;
    qryitens_vendaICMS_NF: TStringField;
    qryitens_vendaCST_NF: TStringField;
    qryitens_vendaCSOSN_NF: TStringField;
    qryitens_vendaBase_Reduzida_NF: TStringField;
    qryitens_vendaBase_Acrescida_NF: TStringField;
    qryitens_vendaBC_NF: TStringField;
    qryitens_vendaValor_ICMS_NF: TStringField;
    qryitens_vendaQtde_Entregue: TFloatField;
    qryitens_vendaQtde_Restante: TFloatField;
    qryitens_vendaQtde_S_Previsao: TFloatField;
    qryitens_vendaDesc_Acr_P: TFloatField;
    qryitens_vendadOUa: TStringField;
    qryitens_vendaData_Entrega: TDateTimeField;
    qryitens_vendaHora_Entrega: TStringField;
    qryitens_vendaTipo_Venda: TStringField;
    qryitens_vendaTipo_Entrega: TStringField;
    qryitens_vendaComissao: TFloatField;
    qryitens_vendaPerc_Desc_Vista: TFloatField;
    qryitens_vendaPerc_Desc_Prazo: TFloatField;
    qryitens_vendaPermite_Credito: TIntegerField;
    qryitens_vendaCodigo_Obs_Fiscal: TIntegerField;
    qryitens_vendaValor_Compra_Nota: TFloatField;
    qryitens_vendaFicha_Estoque_Codigo: TIntegerField;
    ACBrEnterTab1: TACBrEnterTab;
    MemoNFCe: TMemo;
    rs: TRSPrinter;
    cbVisualizarDANFE: TCheckBox;
    Label10: TLabel;
    BtnGerarNFCe: TButton;
    BtnEnviarNFCe: TButton;
    Label11: TLabel;
    BtnEdita_Itens: TButton;
    Label1: TLabel;
    procedure EdtDescontoExit(Sender: TObject);
    procedure EdtValor_RecebidoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    function Confira: boolean;
    procedure Coleta_Dados_R04;
    procedure Coleta_Dados_R07;
    procedure Atualiza_R05;
    procedure FormCreate(Sender: TObject);
    procedure EdtValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox1Click(Sender: TObject);
    procedure EdtValorKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtSub_TotalExit(Sender: TObject);
    procedure EdtTrocoKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure EdtDescontoEnter(Sender: TObject);
    procedure EdtTotal_VendaEnter(Sender: TObject);
    procedure EdtTotal_VendaExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RGDesc_AcrClick(Sender: TObject);
    procedure RGTipoClick(Sender: TObject);
    procedure EdtValorEnter(Sender: TObject);
    procedure BtnGerarNFCeClick(Sender: TObject);
    procedure BtnEnviarNFCeClick(Sender: TObject);
    procedure BtnEdita_ItensClick(Sender: TObject);
  private
    { Private declarations }
    FFicahEstoques : TFichaEstoqueLista;
    Pedido: URegistro.TPedido;
    Fechamento_Venda: URegistro.TFechamento_Venda;
    Itens_Pedido: URegistro.TItens_Pedido;
    Itens_OS: URegistro.TItens_OS;
    Util: UGeral.TUtil;
    R04: TR04;
    R07: TR07;
    R05: TR05;
    R06: TR06;
    coo_cupom: AnsiString;
    conexao : TADOConnection;

    Controla_Codigo: TControla_Codigo;
    cod: string;
    flagfiscal, tecla: integer;
    pode_fechar, tem_troco, iniciou_fechamento, estorno, tef, cartao, Impresso: boolean;
    forma_estornada: AnsiString;
    i: integer;
    qAux_Forma_Pagamento, qAux_Pagamento_DAV: TADOQuery;
    MD5Criado, desc_acr, mensagem_final: AnsiString;


    linha, conta, i2, criado: integer;
    dav, dav2, tipo_rela, rodape: AnsiString;
    cn, cp: AnsiString;

    desconto_rateiro, perc_imposto_venda: double;

    oLF: TLancamentoFinanceiroEntidade;
    oPLF: TParcelasLancamentoFinanceiroEntidade;
    oCli: TClienteEntidade;
    oCP: TCondicaoPagamentoEntidade;
    oCPDominio: TCondicaoPagamentoDominio;
    TemCreditoDisponivel: boolean;

    procedure Inicia_Fechamento;
    function RealizaVendaTEF:Boolean;
    function ImprimeVendaTEF:Boolean;
    procedure Insere_Dados;
    procedure Verifica_Pode_Fechar;
    procedure Lanca_Financeiro;
    procedure Atualiza_COOVIN;
    procedure Inicializa_CDS;
    procedure Atualiza_Pedido;
    procedure Nao_Confirma_Cupom;
    procedure Verifica_Permissao_TEF;
    procedure Fecha_TEF;
    procedure Calcula_Troco;
    procedure Gera_Financeiro(var Conexao: TADOConnection);
    procedure Pega_Financeiro_Gerado(Codigo: integer);
    procedure Pega_Codigo_Forma_Pagamento(Forma: AnsiString);
    procedure Pega_Forma_Pagamento_DAV;
    procedure Comprovante_Compra;
    procedure Atualiza_Dados;
    procedure Cabecalho_Comprovante_Compra;
    procedure Fecha_Cupom;
    procedure Imprime_Transacao_TEF;
    procedure Limpa_Local;
    procedure Cancela_Registro_Cupom;
    procedure Calcula_Total_Faltando;
    procedure Grava_Forma_Pagamento;
    procedure Calcula_Imposto_Lei;
    function salvarFichaEstoque(COO : string): Boolean;
    procedure preencherFichaEstoque(COO : string);
    procedure Verifica_Credito_Cliente;
    procedure GerarNFCe;
    procedure EnviarNFCe;
    procedure ImprimirNFCe;
    procedure GravaDadosBD;
    procedure ImprimeTEF;
    //procedure Atualiza_Pedido;
  public
    ccf, coo, coo_vin, gnf, data_inicio_emissao, subtotal, desconto_subtotal, indicador_tipo_desc, acrecimo,
    indicador_tipo_acre, valor_total, indicador_cancelamento, cancelamento_acrecimo, indicador_desc_acre,
    adquirente, cnpj_adquirente: AnsiString;
    iConta, codigo_forma_pagamento, qtde_parcela, prazo: integer;
    cFormaPgto, tipo_pagamento, tipo_juro, indice_imp, EChqueTipoPagamento, ETEF, CNPJOperadora: AnsiString;
    ativo: boolean;
    valor_troco, taxa_juro, ValorRecebidoParcial: double;

    function Consulta_Cheque: boolean;
    procedure BuscaCondPagOutroForm(oCP: TCondicaoPagamentoEntidade);
    { Public declarations }
  end;

var
  FrmFechamento_Venda_PDV: TFrmFechamento_Venda_PDV;

implementation

uses UPDV, UChama_Cliente, UDeclaracao, UChama_Tipo_Documento,
  UDM, UPedido_Venda, UCarrega_Pedido_Caixa, UMenu_Geral,
  UInforma_Forma_Pagamento, UMensagem_TEF, UMensagem_Erro_TEF,
  UMensagem_Erro_Realizar_TEF, UMensagem_Erro_Impressora_TEF,
  UMensagem_Erro_Gerenciador_TEF, UEscolha_Bandeira, URel_Recibo_Venda,
  Modelo.Dominio.NFE.INFEDominio, Modelo.Dominio.NFE.TNFEDominio,
  Modelo.Dominio.Estoque.IFichaEstoqueDominio,
  Modelo.Dominio.Estoque.TFichaEstoqueDominio, Util.TLog,
  URel_Carne,
  Util.GeradorDeCodigo, System.TypInfo, UGerar_Documentos, Util.Mensagens,
  Modelo.Dominio.Cliente.TClienteDominio, Conexao.TConexao,
  DadosEmissaoNFERecebimento, UNFE, UEdita_Item_PDV;

{$R *.dfm}

procedure TFrmFechamento_Venda_PDV.Atualiza_COOVIN;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update Pedido set COO_Vin = :COO_Vin where Codigo = :Codigo');
      Parameters.ParamByName('COO_Vin').Value:= UDeclaracao.coo;
      Parameters.ParamByName('Codigo').Value:= StrToInt(LblCodigo.Caption);
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmFechamento_Venda_PDV.Atualiza_Pedido;
begin
  with FrmCarrega_Pedido_Caixa.qrycarrega_caixa, sql do
  begin
    close;
    clear;
    add('select P.Codigo, P.N_Pedido, P.N_Pre_Venda, P.Data_Venda, P.Total_Pedido, P.Tipo, P.DAVC, ');
    add('C.Codigo as Codigo_Cliente, C.Nome_Nome_Fantasia, C.CPF, Log.Descricao as Endereco, C.Numero from Pedido P');
    add('inner join Cliente C on (C.Codigo = P.Codigo_Cliente)');
    add('inner join Logradouro Log on (Log.Codigo = C.Codigo_Logradouro)');
    add('where P.Status = :Parametro and (P.Tipo = :Tipo or P.Tipo = :Tipo2)');
    Parameters.ParamByName('Parametro').Value:= 'PENDENTE';
    Parameters.ParamByName('Tipo').Value:= 'PRÉ-VENDA';
    Parameters.ParamByName('Tipo2').Value:= 'DAV-OS';
    open;
  end;
end;

procedure TFrmFechamento_Venda_PDV.Atualiza_R05;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  try
    //CapturaContadoresECF;
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update R05 set COO = :COO, CCF = :CCF');
      add('where N_Pedido = :Pedido');
      Parameters.ParamByName('COO').Value:= UDeclaracao.coo;
      Parameters.ParamByName('CCF').Value:= UDeclaracao.ccf;
      Parameters.ParamByName('Pedido').Value:= LblN_Pedido.Caption;
      ExecSQL;
    end;

  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmFechamento_Venda_PDV.BtnEnviarNFCeClick(Sender: TObject);
begin
  //Se der merda ao emitir a NFCe automaticamente com o usuário finalizando o cupom, o botão Gerar NFCe e
  //Enviar NFCe será habilitado (visible=true). Ao corrigir a NFCe (criar a tela pra corrigir, igual a tela
  //de Emissão de NFe), deve-se Gerar, Enviar, Imprimir a NFCe, imprimir TEF (se for TEF) e gravar os dados no BD.
  EnviarNFCe;
  ImprimirNFCe;
  ImprimeTEF;
  GravaDadosBD;
end;

procedure TFrmFechamento_Venda_PDV.BtnGerarNFCeClick(Sender: TObject);
begin
  GerarNFCe;
end;

procedure TFrmFechamento_Venda_PDV.BuscaCondPagOutroForm(oCP: TCondicaoPagamentoEntidade);
begin
  self.oCP := oCP;
end;

procedure TFrmFechamento_Venda_PDV.BtnEdita_ItensClick(Sender: TObject);
begin
  TLog.Debug('Clicou no botão Editar Itens.');
  Application.CreateForm(TFrmEdita_Item_PDV, FrmEdita_Item_PDV);
  Centraliza_Form(FrmEdita_Item_PDV);
  Atualiza_Itens_NFe(FrmEdita_Item_PDV.qryitens_nf, FrmPDV.Conexao, StrToInt(LblCodigo.Caption));
  FrmEdita_Item_PDV.Show;
end;

procedure TFrmFechamento_Venda_PDV.Calcula_Troco;
var
  v_rec, t_venda: double;
begin
  v_rec:= StrToFloat(EdtValor_Recebido.Text);
  t_venda:= StrToFloat(EdtTotal_Venda.Text);

  if (v_rec >= t_venda) then
  begin
    valor_troco:= v_rec - t_venda;
    EdtTroco.Text:= FormatFloat('#0.0,0', valor_troco);
    EdtTroco.Text:= StringReplace(EdtTroco.Text, ThousandSeparator, '', [rfReplaceAll]);
  end
  else
    EdtTroco.Text:= '0,00';

  EdtTroco.Refresh;
end;

procedure TFrmFechamento_Venda_PDV.Calcula_Total_Faltando;
var
  v_rec, t_venda, v_falta: double;
begin
  v_rec:= StrToFloat(EdtValor.Text);
  t_venda:= StrToFloat(EdtTotal_Venda.Text);

  v_falta:= t_venda - v_rec;
  EdtValor.Text:= FormatFloat('#0.0,0', v_falta);
  EdtValor.Text:= StringReplace(EdtValor.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtValor.SetFocus;
  EdtValor.SelectAll;
end;

procedure TFrmFechamento_Venda_PDV.Coleta_Dados_R04;
begin
  //CapturaContadoresECF;
  ECF.Pega_Contadores;
  //Captura_Data_Hora_Documento;
  ECF.Pega_Data_Hora_Documento;
  //Captura_Sub_Total;
  //ECF.Pega_Sub_Total;

  desconto_subtotal:= FormatFloat('#0.0,0', StrToFloat(EdtDesconto.Text));

  indicador_tipo_desc:= 'V';

  acrecimo:= '0';
  indicador_tipo_acre:= 'V';

  valor_total:= FormatFloat('#0.0,0', StrToFloat(EdtTotal_Venda.Text));
  indicador_cancelamento:= 'N';
  cancelamento_acrecimo:= '0';
  indicador_desc_acre:= 'D';

  if (FrmPDV <> Nil) then
  begin
    adquirente:= FrmPDV.Nome;
    cnpj_adquirente:= FrmPDV.CPF;
    cnpj_adquirente:= StringReplace(cnpj_adquirente, '.', '', [rfReplaceAll]);
    cnpj_adquirente:= StringReplace(cnpj_adquirente, '-', '', [rfReplaceAll]);
  end
  else if (FrmCarrega_Pedido_Caixa <> nil) then
  begin
    if (FrmCarrega_Pedido_Caixa.nominal = true) then
    begin
      adquirente:= FrmCarrega_Pedido_Caixa.qrycarrega_caixaNome_Nome_Fantasia.AsString;
      cnpj_adquirente:= FrmCarrega_Pedido_Caixa.qrycarrega_caixaCPF.asstring;
      cnpj_adquirente:= StringReplace(cnpj_adquirente, '.', '', [rfReplaceAll]);
      cnpj_adquirente:= StringReplace(cnpj_adquirente, '-', '', [rfReplaceAll]);
    end
    else
    begin
      adquirente:= '';
      cnpj_adquirente:= '';
    end;
  end;
end;

procedure TFrmFechamento_Venda_PDV.Coleta_Dados_R07;
var
  iConta: integer;
  valor: double;
begin
  //CapturaContadoresECF;
  ECF.Pega_Contadores;

  //UDeclaracao.valor_pag:= EdtValor.Text;

  UDeclaracao.forma_pg:= cFormaPgto;

  //UDeclaracao.valor_pag:= FormatFloat('#0.0,0', valor);
  //UDeclaracao.valor_pag:= StringReplace(UDeclaracao.valor_pag, ThousandSeparator, '', [rfReplaceAll]);

  UDeclaracao.indicador_estorno:= 'N';
  UDeclaracao.valor_estorno:= '0';
end;

function TFrmFechamento_Venda_PDV.ImprimeVendaTEF: Boolean;
begin
  try
    Impresso := false;
    den_op:= 'CC';
    Tipo_Rel:= 1;
    while not Impresso do
    begin
      //TLog.Debug('Vai abrir janela para mostrar mensagem: Imprimindo Cupom TEF.');
      //Application.CreateForm(TFrmMensagem_TEF, FrmMensagem_TEF);
      //FrmMensagem_TEF.Show;
      //TLog.Debug('Abriu janela para mostrar mensagem: Imprimindo Cupom TEF.');
      if not ImprimeTransacaoTEF(Tipo_Rel, 2, EdtValor.Text, pNumeroCupom, indice_imp) then
      begin
        //chama o form da mensagem
        Application.CreateForm(TFrmMensagem_Erro_Impressora_TEF, FrmMensagem_Erro_Impressora_TEF);
        FrmMensagem_Erro_Impressora_TEF.ShowModal;
        if (FrmMensagem_Erro_Impressora_TEF.confirma = false) then
        begin
          Result := false;
          NaoConfirmaTransacao;
          ApagaArquivosTEF;
          DeleteFile(ArqTemp);
          //Deleta_Bandeira_Pendente;
          Impresso := true;
          Aberto:= 0;
        end
        else
        begin
          BlockInput(true);
          TLog.Debug('Bloqueou teclado/mouse para imprimir o Relatório Gerencial.');
          Result := false;
          Impresso := false;
          den_op:= 'RG';
          Tipo_Rel:= 1;
          //Aberto:= 1;
        end;
      end
      else
      begin
        ConfirmaTransacao;
        ApagaArquivosTEF;
        //Deleta_Bandeira_Pendente;
        DeleteFile(ArqTemp);
        Aberto:= 0;
        Result := true;
        Impresso := true;
//        Coleta_Dados_R06;

//        R06.Inserir_Outros(R06);
        //R06.Inserir_Outros_Aux(R06);
      end;
    end;
  except on E:Exception do
  begin
    TLog.Error('Erro em ImprimeVendaTEF: '+e.Message);
  end;

  end;
end;

procedure TFrmFechamento_Venda_PDV.Inicializa_CDS;
begin
  //inicializa dados para começar uma nova venda
  Inicializa_Dados_Principais_Movimentacao(0,dm.qrychama_produto);
  //Inicializa_Dados_Principais_Movimentacao(1,dm.qrychama_cliente);
  Inicializa_Dados_Principais_Movimentacao(2,dm.qrychama_condicao);
  Inicializa_Dados_Principais_Movimentacao(5,dm.qryvenda);
  Inicializa_Dados_Principais_Movimentacao(6,dm.qryitens_venda);
  Inicializa_Dados_Principais_Movimentacao(7,dm.qryr05);
  Inicializa_Dados_Principais_Movimentacao(9,dm.qrycontrola_codigo);  //9 ou 17
  Inicializa_Dados_Principais_Movimentacao(10,dm.qryfechamento_venda);
  Inicializa_Dados_Principais_Movimentacao(11,dm.qryr04);
  Inicializa_Dados_Principais_Movimentacao(12,dm.qryr07);
  Inicializa_Dados_Principais_Movimentacao(13,dm.qryR06);
  Inicializa_Dados_Principais_Movimentacao(14,dm.qryfechamento_venda_aux);
  Inicializa_Dados_Principais_Movimentacao(15,dm.qryitens_venda_aux);
end;

procedure TFrmFechamento_Venda_PDV.Inicia_Fechamento;
var
  mensagem, cAcreDesc, cTipoAcreDesc, cValorAcreDesc, cFormaPgto, cValorPago, dOUa: Ansistring;
begin
  try
    TLog.Debug('Entrou no método Inicia_Fechamento');
    cTipoAcreDesc:= '$';
    Impresso:= false;

    if (FrmCarrega_Pedido_Caixa <> nil) and (FrmCarrega_Pedido_Caixa.qrycarrega_caixaDesc_Acr.AsFloat > 0) then
      cAcreDesc:= 'A'
    else
      cAcreDesc:= 'D';

    if (RGTipo.ItemIndex = 0) then
      dOUa:= '+'
    else
      dOUa:= '-';

    cValorAcreDesc:= FormatFloat('#0.0,0', StrToFloat(EdtDesconto.Text));
    cValorAcreDesc:= StringReplace(cValorAcreDesc, ThousandSeparator, '', [rfReplaceAll]);

    {while not Impresso do
    begin
      if not (ECF.Inicia_Fechamento_Cupom(PAnsiChar(dOUa+cValorAcreDesc), '')) then
      begin
        //BlockInput(false);
        Application.CreateForm(TFrmMensagem_Erro_Impressora_TEF, FrmMensagem_Erro_Impressora_TEF);
        FrmMensagem_Erro_Impressora_TEF.ShowModal;
        if (FrmMensagem_Erro_Impressora_TEF.confirma = false) then
        begin
          Nao_Confirma_Cupom;
          FrmMensagem_Erro_Impressora_TEF.Free;
        end
        else
        begin
          //BlockInput(true);
          Impresso:= false;
          FrmMensagem_Erro_Impressora_TEF.Free;
        end;
      end
      else
      begin
        Impresso:= true;
        iniciou_fechamento:= true;
      end;
    end;}
    TLog.Debug('Terminou de executar o método Inicia_Fechamento');
  except on E:Exception do
  begin
    TLog.Error('Erro no método Inicia_Fechamento: '+E.Message);
    BlockInput(false);
    TLog.Debug('Desbloqueou teclado/mouse pois deu erro em Inicia_Fechamento.');
  end;

  end;
end;

procedure TFrmFechamento_Venda_PDV.Insere_Dados;
begin
  TLog.Info('--- MÉTODO Insere_Dados ---');
  if (FrmPDV <> nil) then
    Fechamento_Venda.Salva_Banco(Fechamento_Venda, FrmPDV.Conexao)
  else
    Fechamento_Venda.Salva_Banco(Fechamento_Venda, dm.ADOConnection1);

  TLog.Debug('Inseriu condição de pagamento.');
  //Coleta_Dados_R07;
  //R07.Inserir(R07);

  if (FrmPDV <> nil) then
    Atualiza_Dados_Fechamento(FrmPDV.Conexao, StrToInt(LblCodigo.Caption))
  else if (FrmNFE <> nil) then
    Atualiza_Dados_Fechamento(dm.ADOConnection1, StrToInt(LblCodigo.Caption));
  TLog.Debug('Atualizou condição de pagamento.');

  DBGrid1.Refresh;
  TLog.Debug('Refresh na grade de condição de pagamento.');

  TLog.Debug('Vai preencher o objeto DadosEmissaoNFERecebimento.');
  if (FrmPDV <> nil) then
  begin
    TLog.Debug('FrmPDV aberto.');
    FrmPDV.DadosEmissaoNFERecebimento:= TDadosEmissaoNFERecebimento.Create;
    FrmPDV.DadosEmissaoNFERecebimento.TipoRecebimento:= EChqueTipoPagamento;
    FrmPDV.DadosEmissaoNFERecebimento.ValorRecebimento:= StrToFloat(UDeclaracao.valor_pag);
    FrmPDV.DadosEmissaoNFERecebimento.PosOuTEF:= ETEF;
    FrmPDV.DadosEmissaoNFERecebimento.NAut:= pNSU;
    FrmPDV.DadosEmissaoNFERecebimento.NomeRede:= pNomeRede;
    FrmPDV.DadosEmissaoNFERecebimento.CNPJ_Operadora:= CNPJOperadora;
    FrmPDV.DadosEmissaoNFE.Recebimentos.Add(FrmPDV.DadosEmissaoNFERecebimento);
  end
  else if (FrmNFE <> nil) then
  begin
    TLog.Debug('FrmNFE aberto.');
    FrmNFE.DadosEmissaoNFERecebimento:= TDadosEmissaoNFERecebimento.Create;
    FrmNFE.DadosEmissaoNFERecebimento.TipoRecebimento:= EChqueTipoPagamento;
    FrmNFE.DadosEmissaoNFERecebimento.ValorRecebimento:= StrToFloat(UDeclaracao.valor_pag);
    FrmNFE.DadosEmissaoNFERecebimento.PosOuTEF:= ETEF;
    FrmNFE.DadosEmissaoNFERecebimento.NAut:= pNSU;
    FrmNFE.DadosEmissaoNFERecebimento.NomeRede:= pNomeRede;
    FrmNFE.DadosEmissaoNFERecebimento.CNPJ_Operadora:= CNPJOperadora;
    FrmNFE.DadosEmissaoNFE.Recebimentos.Add(FrmNFE.DadosEmissaoNFERecebimento);
  end;
  TLog.Debug('Preencheu o objeto DadosEmissaoNFERecebimento.');
  TLog.Info('--- FIM MÉTODO Insere_Dados ---');
end;

function TFrmFechamento_Venda_PDV.Confira: boolean;
begin
//  Confira:= false;

//  Confira:= true;
end;

procedure TFrmFechamento_Venda_PDV.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State)
end;

procedure TFrmFechamento_Venda_PDV.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  valor_rec, valor, total: double;
begin
  {if (key = VK_DELETE) then
  begin
    if (i = 1) then
    begin
      Application.MessageBox('É possível estornar apenas uma forma de pagamento.', 'Impossível Continuar', MB_OK+MB_ICONHAND);
      abort;
    end;

    if (Confirma_Exclusao) then
    begin
      i:= 1;
      valor_rec:= StrToFloat(EdtValor_Recebido.Text);
      valor:= qryfechamento_vendaValor.AsFloat;
      total:= valor_rec - valor;
      EdtValor_Recebido.Text:= FormatFloat('#0.0,0', total);
      EdtValor_Recebido.Text:= StringReplace(EdtValor_Recebido.Text, ThousandSeparator, '', [rfReplaceAll]);
      estorno:= true;
      pode_fechar:= false;
      forma_estornada:= qryfechamento_vendaForma_Pagamento.AsString;

      dm.qryr07.Edit;
      dm.qryr07Estorno.AsString:= 'S';
      dm.qryr07Valor_Estorno.AsString:= qryfechamento_vendaValor.AsString;
      dm.qryr07.SaveToFile(Local_Arquivo(7));

      qryfechamento_venda.Delete;
    end;
  end;}
end;

procedure TFrmFechamento_Venda_PDV.EdtCodigo_ClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;
end;

procedure TFrmFechamento_Venda_PDV.EdtDescontoEnter(Sender: TObject);
begin
  if (FrmCarrega_Pedido_Caixa <> nil) then
    EdtDesconto.ReadOnly:= true
  else
    EdtDesconto.ReadOnly:= false;
end;

procedure TFrmFechamento_Venda_PDV.EdtDescontoExit(Sender: TObject);
var
  sub_total, valor_desc, total_venda, desc_per: double;
begin
  Verifica_Edit_Branco(EdtDesconto);
  Verifica_Valor_Negativo_Desconto(StrToFloat(EdtDesconto.Text), EdtDesconto);
  valor_desc:= StrToFloat(EdtDesconto.Text);
  sub_total:= StrToFloat(EdtSub_Total.Text);

  if (valor_desc >= sub_total) then
  begin
    TMensagens.MensagemErro('Valor do desconto ou acréscimo não pode ser maior OU igual ao valor da venda.');
    EdtDesconto.Text:= '0,00';
    EdtDesconto.SetFocus;
    Abort;
  end;

  {
  total_venda:= sub_total - valor_desc;
  EdtTotal_Venda.Text:= FormatFloat('#0.0,0', total_venda);
  EdtTotal_Venda.Text:= StringReplace(EdtTotal_Venda.Text, ThousandSeparator, '', [rfReplaceAll]);}

end;

procedure TFrmFechamento_Venda_PDV.EdtDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmFechamento_Venda_PDV.EdtSub_TotalExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtSub_Total, StrToFloat(EdtSub_Total.Text));
end;

procedure TFrmFechamento_Venda_PDV.Calcula_Imposto_Lei;
var
  aliquota, valor_rateio, total_venda: double;
begin
  total_venda:= StrToFloat(EdtTotal_Venda.Text);
  perc_imposto_venda:= 0;
  TLog.Debug('Vai executar o método Calcula_Imposto_Lei.');
  if (FrmPDV <> nil) then
  begin
    valor_imposto_lei:= 0;
    aliquota:= 0;
    valor_rateio:= 0;

    dm.qryitens_venda.First;
    while not (dm.qryitens_venda.Eof) do
    begin
      if (dm.qryitens_vendaCancelado.AsString = 'N') then
      begin
        valor_rateio:= 0;
        aliquota:= 0;
        TLog.Debug('Vai executar o método Retorna_Aliquota_NCM.');
        aliquota:= Retorna_Aliquota_NCM(dm.qryitens_vendaNCM.AsString, DM.qryitens_vendaOrigem.AsString, FrmPDV.Conexao);
        valor_rateio:= dm.qryitens_vendaValor_Unitario.AsFloat * (desconto_rateiro / 100);
        TLog.Debug('Executou o método Retorna_Aliquota_NCM.');
        if (RGTipo.ItemIndex = 0) then
        begin
          valor_rateio:= dm.qryitens_vendaValor_Unitario.AsFloat + valor_rateio;
        end
        else
        begin
          valor_rateio:= dm.qryitens_vendaValor_Unitario.AsFloat - valor_rateio;
        end;

        valor_rateio:= Calcula_Valor(FloatToStr(valor_rateio));

        valor_imposto_lei:= valor_imposto_lei + (valor_rateio * (aliquota / 100));
        valor_imposto_lei:= Calcula_Valor(FloatToStr(valor_imposto_lei));
      end;

      dm.qryitens_venda.Next;
    end;
  end;

  valor_imposto_lei:= Calcula_Valor(FloatToStr(valor_imposto_lei));
  TLog.Debug('Valor do imposto: '+FloatToStr(valor_imposto_lei));
  perc_imposto_venda:= ( (valor_imposto_lei / total_venda) * 100);
  perc_imposto_venda:= Calcula_Valor(FloatToStr(perc_imposto_venda));

  MmoDados_Adicionais.Text:= MmoDados_Adicionais.Text + 'Val. Aprox. dos Tributos R$' + FloatToStr(valor_imposto_lei) + '('+FloatToStr(perc_imposto_venda)+'%) Fonte: IBPT';
  TLog.Debug('Executou o método Calcula_Imposto_Lei.');
end;

{procedure TFrmFechamento_Venda_PDV.Calcula_Imposto_Lei;
var
  aliquota, valor_rateio, total_venda: double;
begin
  aliquota:= 0;
  valor_rateio:= 0;
  valor_imposto:= 0;
  perc_imposto_venda:= 0;
  total_venda:= StrToFloat(EdtTotal_Venda.Text);

  dm.qryitens_venda.First;
  while not (dm.qryitens_venda.Eof) do
  begin
    if (dm.qryitens_vendaCancelado.AsString = 'N') then
    begin
      valor_rateio:= 0;
      aliquota:= 0;

      aliquota:= Retorna_Aliquota_NCM(dm.qryitens_vendaNCM.AsString, DM.qryitens_vendaOrigem.AsString, dm.ADOConnection1);
      valor_rateio:= dm.qryitens_vendaValor_Unitario.AsFloat * (desconto_rateiro / 100);

      if (RGTipo.ItemIndex = 0) then
      begin
        valor_rateio:= dm.qryitens_vendaValor_Unitario.AsFloat + valor_rateio;
      end
      else
      begin
        valor_rateio:= dm.qryitens_vendaValor_Unitario.AsFloat - valor_rateio;
      end;

      valor_rateio:= Calcula_Valor(FloatToStr(valor_rateio));

      valor_imposto:= valor_imposto + (valor_rateio * (aliquota / 100));
      valor_imposto:= Calcula_Valor(FloatToStr(valor_imposto));
    end;

    dm.qryitens_venda.Next;
  end;

  valor_imposto:= Calcula_Valor(FloatToStr(valor_imposto));
  perc_imposto_venda:= ( (valor_imposto / total_venda) * 100);
  perc_imposto_venda:= Calcula_Valor(FloatToStr(perc_imposto_venda));

  MmoDados_Adicionais.Text:= MmoDados_Adicionais.Text + 'Val. Aprox. dos Tributos R$' + FloatToStr(valor_imposto) + '('+FloatToStr(perc_imposto_venda)+'%) Fonte: IBPT';
end;}

procedure TFrmFechamento_Venda_PDV.EdtTotal_VendaEnter(Sender: TObject);
var
  sub_total, valor_desc, vaux, total_venda: double;
begin
  sub_total:= StrToFloat(EdtSub_Total.Text);
  valor_desc:= StrToFloat(EdtDesconto.Text);

  if (RGDesc_Acr.ItemIndex = 0) then
  begin
    valor_desc:= sub_total * (valor_desc / 100);
    valor_desc:= Calcula_Valor(FloatToStr(valor_desc));

    desconto_rateiro:= StrToFloat(EdtDesconto.Text);
    EdtDesconto.Text:= FloatToStr(valor_desc);
  end
  else
  begin
    valor_desc:= StrToFloat(EdtDesconto.Text);
    desconto_rateiro:= ( valor_desc / sub_total);
    desconto_rateiro:= desconto_rateiro * 100;
    desconto_rateiro:= Calcula_Valor(FloatToStr(desconto_rateiro));
  end;

  if (RGTipo.ItemIndex = 1) and (FrmPDV <> Nil) then
    total_venda:= sub_total - valor_desc
  else if (RGTipo.ItemIndex = 0) and (FrmPDV <> Nil) then
    total_venda:= sub_total + valor_desc
  else
    total_venda:= sub_total;

  EdtTotal_Venda.Text:= FormatFloat('#0.0,0', total_venda);
  EdtTotal_Venda.Text:= StringReplace(EdtTotal_Venda.Text, ThousandSeparator, '', [rfReplaceAll]);

  //Calcula_Imposto_Lei;
end;

procedure TFrmFechamento_Venda_PDV.EdtTotal_VendaExit(Sender: TObject);
begin
  //EdtValor.Text:= FormatFloat('#0.0,0', StrToFloat(EdtTotal_Venda.Text));
  //EdtValor.Text:= StringReplace(EdtValor.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmFechamento_Venda_PDV.EdtTrocoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmFechamento_Venda_PDV.EdtValorEnter(Sender: TObject);
begin
  if (EdtValor.Text = '0') or (EdtValor.Text = '0,00') or (EdtValor.Text = '') then
    EdtValor.Text:= EdtTotal_Venda.Text;
end;

procedure TFrmFechamento_Venda_PDV.EdtValorExit(Sender: TObject);
begin
  Verifica_Edit_Branco(EdtValor);
  Verifica_Valor_Negativo(StrToFloat(EdtValor.Text), EdtValor);
end;

procedure TFrmFechamento_Venda_PDV.EdtValorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  total: double;
  i: integer;
  item: string;
  aTEF: boolean;
begin
  if (key = vk_return) then
  begin
    if (TemCreditoDisponivel = false) and (FrmPDV <> Nil) then
    begin
      TMensagens.MensagemErro('O crédito para compras a prazo do cliente selecionado foi ultrapassado. Por favor, verifique o financeiro do cliente.');
      abort;
    end;

    if (Application.MessageBox(PChar('Confirma o recebimento na condição de pagamento '+EdtForma_Pagamento.Text+'?'), 'Confirmação de forma de pagamento', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) = IDYES) then
    begin

      FrmMenu_Geral.Timer2.Enabled:= false;

      if (EdtValor.Text = '') or (EdtValor.Text = '0') or (EdtValor.Text = '0,00') then
      begin
        pode_fechar:= false;
        Mensagem_Falta_Dados;
        EdtValor.SetFocus;
        abort;
      end
      else
      begin
        Util.FormataFloat(2, EdtValor, StrToFloat(EdtValor.Text));
      end;

      total:= StrToFloat(EdtValor_Recebido.Text);
      ValorRecebidoParcial:= StrToFloat(EdtValor.Text);
      cFormaPgto:= EdtForma_Pagamento.Text;

      //ECF.Pega_Contadores;
      //coo_cupom:= UDeclaracao.COO;
      //TLog.Debug('Pegou COO do cupom fiscal: '+coo_cupom);
      //TLog.Debug('Pegou CCF do cupom fiscal: '+UDeclaracao.ccf);

      try
        if (StrToFloat(EdtValor_Recebido.Text) < StrToFLoat(EdtTotal_Venda.Text)) then
        begin
        {  dm.qrychama_condicao.Locate('Descricao', EdtForma_Pagamento.Text, []);
          if (dm.qrychama_condicaoCheque.AsString = 'SIM') then
          begin
            Verifica_Permissao_TEF;
            Application.CreateForm(TFrmEscolha_Bandeira, FrmEscolha_Bandeira);
            FrmEscolha_Bandeira.ShowModal;
            FrmEscolha_Bandeira.Free;

            if (aborta_escolha_bandeira = true) then
            begin
              EdtValor.SetFocus;
              aborta_escolha_bandeira:= false;
              abort;
            end;

            //Pega_Bandeira(dm.qrychama_condicaoBandeira.AsString);
            Impresso:= false;
            aTEF:= false;
            while not aTEF do
            begin
              if not Consulta_Cheque then
              begin
                //Foco_Aplicacao;

                //chama o form da mensagem
                Application.CreateForm(TFrmMensagem_Erro_Realizar_TEF, FrmMensagem_Erro_Realizar_TEF);
                FrmMensagem_Erro_Realizar_TEF.ShowModal;
                if (FrmMensagem_Erro_Realizar_TEF.confirma = false) then
                begin
                  ApagaArquivosTEF;
                  FrmMensagem_Erro_Realizar_TEF.Free;
                  EdtValor.SetFocus;
                  //Deleta_Bandeira_Pendente;
                  abort;
                end
                else
                  FrmMensagem_Erro_Realizar_TEF.Free;

              end
              else
              begin
                BlockInput(true);
                aTEF:= true;
                total:= total + ValorRecebidoParcial;
                EdtValor_Recebido.Text:= FormatFloat('#0.0,0', total);
                EdtValor_Recebido.Text:= StringReplace(EdtValor_Recebido.Text, ThousandSeparator, '', [rfReplaceAll]);

                if (iniciou_fechamento = false) then
                  Inicia_Fechamento;

                Impresso:= false;
                while not Impresso do
                begin
                  //iRetorno:= Bematech_FI_EfetuaFormaPagamento(cFormaPgto, FormatFloat('#0.0,0', StrToFloat(EdtValor.Text)));
                  ECF.Fecha_Cupom(indice_imp, FormatFloat('#0.0,0', StrToFloat(EdtValor.Text)), false);
                  //verificar se o iRetorno tem nas outras impressoras fiscais
                  if iRetorno <> 1 then
                  begin

                    //chama o form da mensagem
                    Application.CreateForm(TFrmMensagem_Erro_Impressora_TEF, FrmMensagem_Erro_Impressora_TEF);
                    FrmMensagem_Erro_Impressora_TEF.ShowModal;
                    if (FrmMensagem_Erro_Impressora_TEF.confirma = false) then
                    begin
                      Nao_Confirma_Cupom;
                      FrmMensagem_Erro_Impressora_TEF.Free;
                    end
                    else
                    begin
                      BlockInput(true);
                      Impresso:= false;
                      FrmMensagem_Erro_Impressora_TEF.Free;
                    end;

                  end
                  else
                  begin
                    Impresso:= true;
                    Insere_Dados;
                    FrmFechamento_Venda_PDV.Refresh;
                  end;
                end;
                Verifica_Pode_Fechar;

                if (estorno = true) then
                begin
                  Impresso:= false;
                  while not Impresso do
                  begin
                    iRetorno:= Bematech_FI_EstornoFormasPagamento(PAnsiChar(forma_estornada), PAnsiChar(EdtForma_Pagamento.Text), PAnsiChar(EdtValor.Text));
                    if iRetorno <> 1 then
                    begin

                      //chama o form da mensagem
                      Application.CreateForm(TFrmMensagem_Erro_Impressora_TEF, FrmMensagem_Erro_Impressora_TEF);
                      FrmMensagem_Erro_Impressora_TEF.ShowModal;
                      if (FrmMensagem_Erro_Impressora_TEF.confirma = false) then
                      begin
                        Nao_Confirma_Cupom;
                        FrmMensagem_Erro_Impressora_TEF.Free;
                      end
                      else
                      begin
                        Impresso:= false;
                        FrmMensagem_Erro_Impressora_TEF.Free;
                      end;

                    end
                    else
                    begin
                      Impresso:= true;
                      estorno:= false;
                    end;
                  end;
                end;
              end;
            end;
          end }
          if (ETEF = 'SIM') then
          begin
            Verifica_Permissao_TEF;
            //Verifica_Gerenciador_Padrao_Ativo;

            Application.CreateForm(TFrmEscolha_Bandeira, FrmEscolha_Bandeira);
            FrmEscolha_Bandeira.ShowModal;
            FrmEscolha_Bandeira.Free;

            if (aborta_escolha_bandeira = true) then
            begin
              EdtValor.SetFocus;
              aborta_escolha_bandeira:= false;
              abort;
            end;

            BlockInput(true);
            TLog.Debug('Bloqueou teclado/mouse ao verificar que é TEF.');
            Impresso:= false;
            aTEF:= false;
            while not aTEF do
            begin
              if not RealizaVendaTEF then
                begin
                  Application.CreateForm(TFrmMensagem_Erro_Realizar_TEF, FrmMensagem_Erro_Realizar_TEF);
                  FrmMensagem_Erro_Realizar_TEF.ShowModal;
                  if (FrmMensagem_Erro_Realizar_TEF.confirma = false) then
                  begin
                    ApagaArquivosTEF;
                    FrmMensagem_Erro_Realizar_TEF.Free;
                    EdtValor.SetFocus;
                    abort;
                  end
                  else
                    FrmMensagem_Erro_Realizar_TEF.Free;

                end
                else
                begin
                  if (iniciou_fechamento = false) then
                    Inicia_Fechamento;

                  aTEF:= true;

                  total:= total + ValorRecebidoParcial;
                  EdtValor_Recebido.Text:= FormatFloat('#0.0,0', total);
                  EdtValor_Recebido.Text:= StringReplace(EdtValor_Recebido.Text, ThousandSeparator, '', [rfReplaceAll]);
                  EdtValor_Recebido.Refresh;
                  UDeclaracao.valor_pag:= EdtValor.Text;
                  TLog.Debug('Variável valor_pag: '+ UDeclaracao.valor_pag);
                  TLog.Debug('Formatou o campo Valor Recebido.');

                  EdtValor.Text:= FormatFloat('#0.0,0', StrToFloat(EdtTotal_Venda.Text) - total);
                  EdtValor.Text:= StringReplace(EdtValor.Text, ThousandSeparator, '', [rfReplaceAll]);
                  EdtValor.Refresh;
                  TLog.Debug('Formatou o campo Valor.');
                  EdtTroco.Refresh;
                  TLog.Debug('Formatou o campo Troco.');

                  {Impresso:= false;
                  while not Impresso do
                  begin
                    if not (ECF.Fecha_Cupom(indice_imp, FloatToStr(ValorRecebidoParcial), true)) then
                    begin
                      Application.CreateForm(TFrmMensagem_Erro_Impressora_TEF, FrmMensagem_Erro_Impressora_TEF);
                      FrmMensagem_Erro_Impressora_TEF.ShowModal;
                      if (FrmMensagem_Erro_Impressora_TEF.confirma = false) then
                      begin
                        Nao_Confirma_Cupom;
                        FrmMensagem_Erro_Impressora_TEF.Free;
                      end
                      else
                      begin
                        Impresso:= false;
                        FrmMensagem_Erro_Impressora_TEF.Free;
                      end;

                    end
                    else
                    begin
                      Impresso:= true;
                    end;
                  end;}
                  Verifica_Pode_Fechar;
                  Insere_Dados;

                end;
            end;
          end
          else
          begin
            if (iniciou_fechamento = false) then
              Inicia_Fechamento;

            UDeclaracao.valor_pag:= EdtValor.Text;
            total:= total + ValorRecebidoParcial;
            EdtValor_Recebido.Text:= FormatFloat('#0.0,0', total);
            EdtValor_Recebido.Text:= StringReplace(EdtValor_Recebido.Text, ThousandSeparator, '', [rfReplaceAll]);
            EdtValor_Recebido.Refresh;

            EdtValor.Text:= FormatFloat('#0.0,0', StrToFloat(EdtTotal_Venda.Text) - total);
            EdtValor.Text:= StringReplace(EdtValor.Text, ThousandSeparator, '', [rfReplaceAll]);
            EdtValor.Refresh;


            {Impresso:= false;
            while not Impresso do
            begin
              //TLogger.GetInstance.Debug('Metodo fecha cupom. Venda em dinheiro. Indice da forma de pagamento: '+indice_imp+'. '+DateTimeToStr(now));
              //TLogger.GetInstance.Debug('Metodo fecha cupom. Venda em dinheiro. Valor da operacao: '+EdtValor.Text+'. '+DateTimeToStr(now));
              if not (ECF.Fecha_Cupom(indice_imp, FloatToStr(ValorRecebidoParcial), false)) then
              begin
                Application.CreateForm(TFrmMensagem_Erro_Impressora_TEF, FrmMensagem_Erro_Impressora_TEF);
                FrmMensagem_Erro_Impressora_TEF.ShowModal;
                if (FrmMensagem_Erro_Impressora_TEF.confirma = false) then
                begin
                  Cancela_Registro_Cupom;
                  FrmMensagem_Erro_Impressora_TEF.Free;
                  abort;
                end
                else
                begin
                  Impresso:= false;
                  FrmMensagem_Erro_Impressora_TEF.Free;
                end;
              end
              else
                Impresso:= true;
            end;}
            Verifica_Pode_Fechar;
            Insere_Dados;
            Calcula_Troco;
          end;
        end;
      except
        on e: Exception do
        begin
          BlockInput(false);
          TLog.Error('Desbloqueou teclado/mouse pois deu erro em Enter no valor total.');
          TLog.Error('Mensagem de erro em: Enter no valor total. ' + e.Message);
        end;
      end;

      Fecha_Cupom;

    end;
  end;
end;

procedure TFrmFechamento_Venda_PDV.EdtValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmFechamento_Venda_PDV.EdtValor_RecebidoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmFechamento_Venda_PDV.Fecha_TEF;
var
  sAux: TADOStoredProc;
  qAux: TADOQuery;
  gerou_financeiro: boolean;
  cAcreDesc, cTipoAcreDesc, cValorAcreDesc, cFormaPgto, cValorPago: string;
begin
  {//if (pode_fechar = true) then
  //begin
    FrmMenu_Geral.Timer2.Enabled:= false;
    sAux:= TADOStoredProc.Create(nil);
    qAux:= TADOQuery.Create(nil);
    //Verifica_Status_Impressora;
    try
      if (FrmPDV <> Nil) then
      begin
        Impresso:= false;
        while not Impresso do
        begin
          ECF.Termina_Fechamento_Cupom(mensagem, pMD5_Arquivos, '', '', '');
          if iRetorno <> 1 then
          begin

            BlockInput(false);
            Application.CreateForm(TFrmMensagem_Erro_Impressora_TEF, FrmMensagem_Erro_Impressora_TEF);
            FrmMensagem_Erro_Impressora_TEF.ShowModal;
            if (FrmMensagem_Erro_Impressora_TEF.confirma = false) then
            begin
              Nao_Confirma_Cupom;
              FrmMensagem_Erro_Impressora_TEF.Free;
            end
            else
            begin
              BlockInput(true);
              Impresso:= false;
              FrmMensagem_Erro_Impressora_TEF.Free;
            end;
          end
          else
          begin
            Impresso:= true;
          end;
        end;

        if (estorno = true) then
        begin
          iRetorno:= Bematech_FI_EstornoFormasPagamento(PAnsiChar(forma_estornada), EdtForma_Pagamento.Text, EdtValor.Text);
          estorno:= false;
        end
      end
      else if (FrmCarrega_Pedido_Caixa <> Nil) then
      begin
        if (FrmCarrega_Pedido_Caixa.qrycarrega_caixaTipo.AsString = 'PRÉ-VENDA') then
          begin
            Impresso:= false;
            while not Impresso do
            begin
              if (FrmCarrega_Pedido_Caixa.qrycarrega_caixaN_Pedido.AsString <> '') then
                ECF.Termina_Fechamento_Cupom(mensagem, pMD5_Arquivos, FrmCarrega_Pedido_Caixa.qrycarrega_caixaN_Pedido.AsString, '', FrmCarrega_Pedido_Caixa.qrycarrega_caixan_Pre_Venda.AsString)
              else
                ECF.Termina_Fechamento_Cupom(mensagem, pMD5_Arquivos, '', '', FrmCarrega_Pedido_Caixa.qrycarrega_caixan_Pre_Venda.AsString);

              if iRetorno <> 1 then
              begin
                BlockInput(false);
                //chama o form da mensagem
                Application.CreateForm(TFrmMensagem_Erro_Impressora_TEF, FrmMensagem_Erro_Impressora_TEF);
                FrmMensagem_Erro_Impressora_TEF.ShowModal;
                if (FrmMensagem_Erro_Impressora_TEF.confirma = false) then
                begin
                  Nao_Confirma_Cupom;
                  FrmMensagem_Erro_Impressora_TEF.Free;
                end
                else
                begin
                  BlockInput(true);
                  Impresso:= false;
                  FrmMensagem_Erro_Impressora_TEF.Free;
                end;

              end
              else
              begin
                Impresso:= true;
              end;
            end;
          end
          else
          begin
            Impresso:= false;
            while not Impresso do
            begin
              ECF.Termina_Fechamento_Cupom(mensagem, pMD5_Arquivos, '', FrmCarrega_Pedido_Caixa.qrycarrega_caixaN_Pedido.AsString, '');
              if iRetorno <> 1 then
              begin
                BlockInput(false);
                //chama o form da mensagem
                Application.CreateForm(TFrmMensagem_Erro_Impressora_TEF, FrmMensagem_Erro_Impressora_TEF);
                FrmMensagem_Erro_Impressora_TEF.ShowModal;
                if (FrmMensagem_Erro_Impressora_TEF.confirma = false) then
                begin
                  Nao_Confirma_Cupom;
                  FrmMensagem_Erro_Impressora_TEF.Free;
                end
                else
                begin
                  BlockInput(true);
                  Impresso:= false;
                  FrmMensagem_Erro_Impressora_TEF.Free;
                end;

              end
              else
              begin
                Impresso:= true;
              end;
            end;
          end;
      end;

      Coleta_Dados_R04;
      R04.Inserir(R04);

      Coleta_Dados_R06;
      R06.Inserir(R06);

      if (FrmPDV <> NIl) then
      begin
        Pedido.Inserir_PDV(Pedido);
      end;

      if (sem_rede = false) then
      begin
        if (FrmPDV <> Nil) then
        begin
          Pedido.Salva_Banco_PDV(Pedido);
          Itens_Pedido.Salva_Banco_PDV(Itens_Pedido);

          R05.Salva_Banco_PDV(R05);
          R05.Salva_Banco_PDV_Aux(R05);
        end;

        Fechamento_Venda.Salva_Banco(Fechamento_Venda);
        R04.Salva_Banco(R04);
        R04.Salva_Banco_Aux(R04);

        R07.Salva_Banco(R07);
        R07.Salva_Banco_Aux(R07);

        R06.Salva_Banco(R06);
        R06.Salva_Banco_Aux(R06);

      end
      else
      begin
        Mensagem_Erro_Rede;
      end;
    except on E:Exception do
      begin
        ShowMessage('Houve um erro inesperado - ' + E.Message);
        abort;
      end;
    end;



  if (FrmPDV <> Nil) then
  begin
    FrmPDV.Inicia_Itens;

    dm.qryitens_venda.Active:= false;

    FrmPDV.pode_encerrar:= false;
    FrmPDV.pode_chamar:= false;
    FrmPDV.pode_fechar:= true;

    codigo_tabela_preco_ativo:= codigo_tabela_preco_padrao;
    FrmPDV.Iniciado:= false;

    if (sem_rede = false) then
    begin
      Gera_Codigo_Lancamento_Sem_Inserir;
      UDeclaracao.Insere_Historico(usuario, 'EMITIU CUPOM FISCAL DE UMA VENDA.', TimeToStr(time), insercao, date);
    end;
  end
  else if (FrmCarrega_Pedido_Caixa <> Nil) then
  begin
    //Pedido.Alterar_Pedido(Pedido);
    Altera_Pedido_Aux(FrmCarrega_Pedido_Caixa.qrycarrega_caixaN_Pedido.AsString, UDeclaracao.coo);
  end;

  if (FrmPDV <> NIl) and (FrmPDV.quero_cancelar = true) then
  begin
    ECF.Cancela_Cupom;

    Atualiza_Status_Pedido(StrToInt(LblCodigo.Caption), 'CANCELADO');
    Atualiza_R04(StrToInt(LblCodigo.Caption));
    Atualiza_R04_Aux(StrToInt(LblCodigo.Caption));
  end
  else if (FrmCarrega_Pedido_Caixa <> NIl) and (FrmCarrega_Pedido_Caixa.quero_cancelar = true) then
  begin
    ECF.Cancela_Cupom;

    Atualiza_Status_Pedido(StrToInt(LblCodigo.Caption), 'CANCELADO');
    Atualiza_R04(StrToInt(LblCodigo.Caption));
    Atualiza_R04_Aux(StrToInt(LblCodigo.Caption));
    FrmCarrega_Pedido_Caixa.quero_cancelar:= false;
  end;

  if (sem_rede = false) and (FrmPDV <> NIl) and (FrmPDV.quero_cancelar = false) then
  begin
    qryfechamento_venda.First;
    while not qryfechamento_venda.Eof do
    begin
      Pega_Codigo_Forma_Pagamento(qryfechamento_vendaForma_Pagamento.AsString);

      if (tipo_pagamento = 'A PRAZO') then
      begin
        Gera_Financeiro;
        gerou_financeiro:= true;
      end
      else
        gerou_financeiro:= false;

      qryfechamento_venda.Next;
    end;
  end
  else if (sem_rede = false) and (FrmCarrega_Pedido_Caixa <> NIl) and (FrmCarrega_Pedido_Caixa.quero_cancelar = false) then
  begin
    qryfechamento_venda.First;
    while not qryfechamento_venda.Eof do
    begin
      Pega_Codigo_Forma_Pagamento(qryfechamento_vendaForma_Pagamento.AsString);

      if (tipo_pagamento = 'A PRAZO') then
      begin
        Gera_Financeiro;
        gerou_financeiro:= true;
      end
      else
        gerou_financeiro:= false;

      qryfechamento_venda.Next;
    end;

    if (compra = '0101') then
    begin
      if (Application.MessageBox('Imprimir comprovante?', 'Confirmação', MB_ICONQUESTION+MB_YESNO)) = idyes then
      begin
        Comprovante_Compra;
      end;
    end;

    FrmCarrega_Pedido_Caixa.Chama_Dados;
  end;

  //if (sem_rede = false) then
  //begin
    //Deleta_Arquivos_Temp;    //////////////////////////////////////////////////////////verificar se tiver rede
    R04.Excluir(R04);
    R05.ExcluirLocal(R05);
    R06.Excluir(R06);
    R07.Excluir(R07);
    Pedido.ExcluirLocal(Pedido);
    Itens_Pedido.ExcluirLocal(Itens_Pedido);
    Fechamento_Venda.ExcluirLocal(Fechamento_Venda);
    //Inicializa_CDS;

    Delete_Produto_Aux;
    Insere_Produto_Aux;
  //end;

  if (recibo = '0101') then
  begin
    if (gerou_financeiro) then
    begin
      FrmRel_Recibo_Venda:= TFrmRel_Recibo_Venda.create(self);
      FrmRel_Recibo_Venda.Release;
      FrmRel_Recibo_Venda:= Nil;
    end;
  end;
  qryfechamento_venda.Active:= false;
  FrmFechamento_Venda_PDV.Close; }
end;

procedure TFrmFechamento_Venda_PDV.Imprime_Transacao_TEF();
begin
  try
    TLog.Debug('Entrou no método Imprime_Transacao_TEF');
    if (tef) and (Imprime_Transacao) then
    begin
      TLog.Debug('Vai imprimir comprovante vinculado.');
      if not ImprimeVendaTEF then
      begin
        if Tipo_Rel = 0 then
        begin
          ECF.Fecha_Relatorio
        end
        else if Tipo_Rel = 1 then
        begin
          //ECF.Fecha_Relatorio;
        end;

        tef:= false;

        Cancela_Registro_Cupom;
        BlockInput(false);
        TLog.Debug('Desbloqueou teclado/mouse pois o método Imprime_Transacao_TEF retornou false.');
      end
      else
      begin
        //ECF.Pega_Contadores;
        //coo_vin:= UDeclaracao.COO;
        //Atualiza_COOVIN;
        tef:= false;
        //FrmMensagem_TEF.Close;
        BlockInput(false);
        TLog.Debug('Desbloqueou teclado/mouse pois o método Imprime_Transacao_TEF executou corretamente e foi finalizado.');
      end;
    end
    else
    begin
      BlockInput(false);
      TLog.Debug('Desbloqueou teclado/mouse pois o método Imprime_Transacao_TEF não tinha nada para imprimir.');
      //Deleta_Bandeira_Pendente;
    end;
  except
    on e: Exception do
    begin
      TLogger.GetInstance.Error(Self.ClassName+'. Método Imprime_Transacao_TEF. '+e.Message);
    end;
  end;
end;

procedure TFrmFechamento_Venda_PDV.FormActivate(Sender: TObject);
begin
  ativo:= true;
  //Captura_Data_Inicio_Documento;
  ECF.Pega_Data_Inicio_Documento;
end;

procedure TFrmFechamento_Venda_PDV.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmFechamento_Venda_PDV.Release;

end;

procedure TFrmFechamento_Venda_PDV.FormCreate(Sender: TObject);
var
  i: integer;
  indice: integer;
begin
  //Centraliza_Form(FrmFechamento_Venda_PDV);
  FFicahEstoques := TFichaEstoqueLista.Create;
  LblFechamento.Caption:= '';
  LblFechamento.Refresh;
  iniciou_fechamento:= false;
  pode_fechar:= false;
  i:= 0;
  indice:= 0;
  TemCreditoDisponivel:= true;
  oCP:= TCondicaoPagamentoEntidade.Create;
  oCPDominio:= TCondicaoPagamentoDominio.Create(dm.ADOConnection1);

  with dm.qrychama_condicao, sql do
  begin
    close;
    clear;
    Add('select * from Condicao_Pagamento where Status = '+QuotedStr('ATIVO')+' and Programa_Impressora = '+QuotedStr('SIM')+'');
    Open;
    First;
  end;
  EdtForma_Pagamento.Text:= dm.qrychama_condicaoDescricao.AsString;
  Pega_Codigo_Forma_Pagamento(EdtForma_Pagamento.Text);

  while not dm.qrychama_condicao.Eof do
  begin
    inc(i);
    inc(indice);
    ListBox1.Items.Add(IntToStr(indice) + '...: ' + dm.qrychama_condicao.FieldByName('Descricao').AsString);
    dm.qrychama_condicao.Next;
  end;

  if (FrmPDV <> Nil) then
  begin
    LblData_Pedido.Caption:= DateToStr(date);//FrmPDV.LblData.Caption;
    LblN_Pedido.Caption:= IntToStr(UDeclaracao.codigo);
    LblCodigo.Caption:= FrmPDV.LblCodigo.Caption;
    EdtSub_Total.Text:= FrmPDV.LblSub_Total.Caption;
    EdtTotal_Venda.Text:= FrmPDV.LblSub_Total.Caption;
    desc_acr:= 'D';
    Verifica_Credito_Cliente;
    ListBox1.Enabled:= true;
    MmoDados_Adicionais.Text:= mensagem + #13+#10 + 'Usuário: '+usuario + #13+#10 + 'SAC - Sistema de Acompanhamento e Gestão Comercial'+#13+#10;
    cbVisualizarDANFE.Visible:= true;
    Label10.Visible:= true;
    MemoNFCe.Visible:= true;
    LblSubTotal.Visible:= True;
    EdtSub_Total.Visible:= true;
    LblDesAcr.Visible:= true;
    EdtDesconto.Visible:= True;
    //EdtDesconto.Text:= '0';
  end
  else if (FrmCarrega_Pedido_Caixa <> Nil) then
  begin
    LblData_Pedido.Caption:= FrmCarrega_Pedido_Caixa.qrycarrega_caixaData_Venda.AsString;
    LblN_Pedido.Caption:= FrmCarrega_Pedido_Caixa.qrycarrega_caixaN_Pedido.AsString;
    LblCodigo.Caption:= FrmCarrega_Pedido_Caixa.qrycarrega_caixaCodigo.AsString;

    //if (FrmCarrega_Pedido_Caixa.qrycarrega_caixaTipo_Desc_Acr.AsString = '$') then
      //EdtDesconto.Text:= FloatToStr(Abs(FrmCarrega_Pedido_Caixa.qrycarrega_caixaDesc_Acr.AsFloat)) //'0';//FloatToStr(Abs(FrmCarrega_Pedido_Caixa.qrycarrega_caixaTotal_Desconto.AsFloat));
    //else
      EdtDesconto.Text:= '0';

    if (FrmCarrega_Pedido_Caixa.qrycarrega_caixaN_Pedido.AsString <> '') then
    begin
      if (gera_os = '0101') then
        MmoDados_Adicionais.Text:= 'DAV-OS'+FrmCarrega_Pedido_Caixa.qrycarrega_caixaN_Pedido.AsString + #13+#10 +mensagem + #13+#10 + 'Usuário: '+usuario + #13+#10 + 'SAC - Sistema de Acompanhamento e Gestão Comercial'+#13+#10
      else
        MmoDados_Adicionais.Text:= 'DAV'+FrmCarrega_Pedido_Caixa.qrycarrega_caixaN_Pedido.AsString + #13+#10 +mensagem + #13+#10 + 'Usuário: '+usuario + #13+#10 + 'SAC - Sistema de Acompanhamento e Gestão Comercial'+#13+#10;
    end
    else
      MmoDados_Adicionais.Text:= mensagem + #13+#10 + 'Usuário: '+usuario + #13+#10 + 'SAC - Sistema de Acompanhamento e Gestão Comercial'+#13+#10;

    ListBox1.Enabled:= false;
    EdtSub_Total.Text:= FrmCarrega_Pedido_Caixa.qrycarrega_caixaTotal_Pedido.AsString;
    EdtTotal_Venda.Text:= FrmCarrega_Pedido_Caixa.qrycarrega_caixaTotal_Pedido.AsString;
    Pega_Forma_Pagamento_DAV;
  end
  else if (FrmNFE <> nil) then
  begin
    LblData_Pedido.Caption:= FrmNFE.qrypedido_pendenteData_Venda.AsString;
    LblN_Pedido.Caption:= FrmNFE.qrypedido_pendenteN_Pedido.AsString;
    LblCodigo.Caption:= FrmNFE.EdtCodigo_Pedido.Text;

    //if (FrmCarrega_Pedido_Caixa.qrycarrega_caixaTipo_Desc_Acr.AsString = '$') then
      //EdtDesconto.Text:= FloatToStr(Abs(FrmCarrega_Pedido_Caixa.qrycarrega_caixaDesc_Acr.AsFloat)) //'0';//FloatToStr(Abs(FrmCarrega_Pedido_Caixa.qrycarrega_caixaTotal_Desconto.AsFloat));
    //else
      EdtDesconto.Text:= '0';

    //ListBox1.Enabled:= false;
    EdtSub_Total.Text:= FrmNFE.EdtValor_Total_Nota.Text;
    EdtTotal_Venda.Text:= FrmNFE.EdtValor_Total_Nota.Text;
    cbVisualizarDANFE.Visible:= false;
    Label10.Visible:= false;
    MemoNFCe.Visible:= false;
    LblSubTotal.Visible:= false;
    EdtSub_Total.Visible:= false;
    LblDesAcr.Visible:= false;
    EdtDesconto.Visible:= false;
    //EdtValor.SetFocus;
    //Pega_Forma_Pagamento_DAV;
  end;

  //oCP:= oCPDominio.CarregaDadosCondicao(EdtForma_Pagamento.Text);

  RGDesc_Acr.ItemIndex:= tipo_desc_acr_padrao;
  RGTipo.ItemIndex:= 1;
  //EdtDesconto.SetFocus;
  den_op:= 'RV';

end;

procedure TFrmFechamento_Venda_PDV.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
  //ForceForegroundWindow(Hwnd);
end;

procedure TFrmFechamento_Venda_PDV.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FFicahEstoques);
end;

procedure TFrmFechamento_Venda_PDV.Grava_Forma_Pagamento;
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
        add('INSERT INTO Pedido_Pagamento_DAV');
        add('           (Codigo');
        add('           ,N_Pedido');
        add('           ,Codigo_Forma_Pagamento_Selecionada');
        add('           ,Codigo_Forma_Pagamento');
        add('           ,Forma_Pagamento');
        add('           ,Qtde_Parcela');
        add('           ,Prazo');
        add('           ,Taxa');
        add('           ,Tipo_Pagamento)');
        add('     VALUES');
        add('           (:Codigo');
        add('           ,:N_Pedido');
        add('           ,:Codigo_Forma_Pagamento_Selecionada');
        add('           ,:Codigo_Forma_Pagamento');
        add('           ,:Forma_Pagamento');
        add('           ,:Qtde_Parcela');
        add('           ,:Prazo');
        add('           ,:Taxa');
        add('           ,:Tipo_Pagamento)');

        Parameters.ParamByName('Codigo').Value:= StrToInt(LblCodigo.Caption);

        Parameters.ParamByName('N_Pedido').Value:= coo;

        Parameters.ParamByName('Codigo_Forma_Pagamento_Selecionada').Value:= codigo_forma_pagamento;
        Parameters.ParamByName('Codigo_Forma_Pagamento').Value:= codigo_forma_pagamento;
        Parameters.ParamByName('Forma_Pagamento').Value:= EdtForma_Pagamento.Text;
        Parameters.ParamByName('Qtde_Parcela').Value:= qtde_parcela;
        Parameters.ParamByName('Prazo').Value:= prazo;
        Parameters.ParamByName('Taxa').Value:= taxa_juro;
        Parameters.ParamByName('Tipo_Pagamento').Value:= tipo_pagamento;
        ExecSQL;
      end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

procedure TFrmFechamento_Venda_PDV.GerarNFCe;
var
  gerou_financeiro: boolean;
  MD5Produto, MD5ProdutoGerado: AnsiString;
  i: integer;
  qAux: TADOQuery;
  FClienteDom: TClienteDominio;
  TemAlerta: boolean;
  StatusImpressora, TentaAtivar: Boolean;
  PrnStatus: TACBrPosPrinterStatus;
  MsgErro: String;
begin
  try
    TLog.Debug('Vai preencher o objeto DadosEmissaoNFE.');
    FrmPDV.DadosEmissaoNFE.CFOP:= Busca_CFOP(codigo_cfop_padrao);
    FrmPDV.DadosEmissaoNFE.FormaPagamento:= 0;
    FrmPDV.DadosEmissaoNFE.Modelo:= '65';
    FrmPDV.DadosEmissaoNFE.Serie:= '1';
    FrmPDV.DadosEmissaoNFE.NNF:= Gera_N_NFCe;
    FrmPDV.DadosEmissaoNFE.DataSaida:= DateTimeToStr(now);
    FrmPDV.DadosEmissaoNFE.HoraSaida:= FormatDateTime('hh:mm', now);;
    FrmPDV.DadosEmissaoNFE.DataEmissao:= DateTimeToStr(now);
    FrmPDV.DadosEmissaoNFE.TipoOperacao:= 1;
    FrmPDV.DadosEmissaoNFE.FormaEmissao:= forma_emissao;
    FrmPDV.DadosEmissaoNFE.Ambiente:= ambiente;
    FrmPDV.DadosEmissaoNFE.VersaoEXE:= VersaoExe;
    FrmPDV.DadosEmissaoNFE.Finalidade:= 'NORMAL';
    FrmPDV.DadosEmissaoNFE.TipoFrete:= 3;
    FrmPDV.DadosEmissaoNFE.InformacoesAdicionais:= mensagem_final;
    FrmPDV.DadosEmissaoNFE.ImpostoTotalVNF:= StrToFloat(EdtTotal_Venda.Text);

    FrmPDV.DadosEmissaoNFE.ImpostoTotalBC:= 0;
    FrmPDV.DadosEmissaoNFE.ImpostoTotalICMS:= 0;
    FrmPDV.DadosEmissaoNFE.ImpostoTotalBCST:= 0;
    FrmPDV.DadosEmissaoNFE.ImpostoTotalST:= 0;
    FrmPDV.DadosEmissaoNFE.ImpostoTotalVProduto:= StrToFloat(EdtTotal_Venda.Text);
    FrmPDV.DadosEmissaoNFE.ImpostoTotalVFrete:= 0;
    FrmPDV.DadosEmissaoNFE.ImpostoTotalVSeguro:= 0;
    FrmPDV.DadosEmissaoNFE.ImpostoTotalVDesc:= 0;
    FrmPDV.DadosEmissaoNFE.ImpostoTotalVIPI:= 0;
    FrmPDV.DadosEmissaoNFE.ImpostoTotalVPIS:= 0;
    FrmPDV.DadosEmissaoNFE.ImpostoTotalVCOFINS:= 0;
    FrmPDV.DadosEmissaoNFE.ImpostoTotalVOutros:= 0;
    FrmPDV.DadosEmissaoNFE.ImpostoTotalVNF:= StrToFloat(EdtTotal_Venda.Text);
    FrmPDV.DadosEmissaoNFE.ImpostoTotalVServico:= 0;
    FrmPDV.DadosEmissaoNFE.ImpostoTotalBCServico:= 0;
    FrmPDV.DadosEmissaoNFE.ImpostoTotalVISS:= 0;

    TLog.Debug('Preencheu o objeto DadosEmissaoNFE.');
    TLog.Debug('Vai gerar a NFe.');
    GerarNFe(TemAlerta, MemoNFCe, FrmPDV.DadosEmissaoNFE, dm.ACBrNFe1, dm.ACBrNFeDANFeRL1, dm.ACBrNFeDANFCeFortes1);
    if (TemAlerta) then
    begin
      //PageControl1.TabIndex := 5;
      //PageControl2.TabIndex := 5;
      BtnGerarNFCe.Visible:= true;
      BtnEdita_Itens.Visible:= true;
      BtnEnviarNFCe.Visible:= false;
      Abort;
    end;

    BtnGerarNFCe.Visible:= false;
    BtnEnviarNFCe.Visible:= true;
    dm.ACBrNFe1.NotasFiscais.GerarNFe;
    dm.ACBrNFe1.NotasFiscais.Items[0].GravarXML;
    MemoNFCe.Lines.Text := dm.ACBrNFe1.NotasFiscais.Items[0].NomeArq;
  except on E:Exception do
  begin
    BtnGerarNFCe.Visible:= true;
    BtnEnviarNFCe.Visible:= false;
    Application.MessageBox(PWideChar('Erro ao Gerar NFCe: '+E.Message), 'Erro ao Gerar NFCe', MB_ICONHAND+MB_OK);
    Abort;
  end;
  end;
end;

procedure TFrmFechamento_Venda_PDV.EnviarNFCe;
begin
  try
    dm.ACBrNFe1.Enviar(FrmPDV.LblNVenda.Caption, false);
    BtnEnviarNFCe.Visible:= false;
    BtnGerarNFCe.Visible:= false;
    BtnEdita_Itens.Visible:= false;
  except on E:Exception do
  begin
    BtnEnviarNFCe.Visible:= false;
    BtnGerarNFCe.Visible:= true;
    BtnEdita_Itens.Visible:= true;
    Application.MessageBox(PWideChar('Erro ao enviar NFCe: '+E.Message), 'Erro ao enviar NFCe', MB_ICONHAND+MB_OK);
    Abort;
  end;
  end;
end;

procedure TFrmFechamento_Venda_PDV.ImprimirNFCe;
begin
  if (cbVisualizarDANFE.Checked) then
  begin
    dm.ACBrNFeDANFCeFortes1.MostrarPreview:= true;
  end
  else
  begin
    dm.ACBrNFeDANFCeFortes1.MostrarPreview:= false;
  end;

  dm.ACBrNFe1.NotasFiscais.Items[0].Imprimir;
end;

procedure TFrmFechamento_Venda_PDV.GravaDadosBD;
var
  FClienteDom: TClienteDominio;
  qAux: TADOQuery;
  Estoque: double;
begin
  Pedido.Salva_Banco('S', 'I' , StrToInt(FrmPDV.LblCodigo.Caption), UDeclaracao.pedido, UDeclaracao.pre_venda,
  coo_cupom, coo_vin, UDeclaracao.ccf, FrmPDV.Codigo_Cliente, UDeclaracao.codigo_empresa,
  0, codigo_usu, codigo_tabela_preco_ativo, codigo_forma_pagamento, StrToDate(dataf), date, 0, 0, StrToFloat(FrmFechamento_Venda_PDV.EdtSub_Total.Text),
  0, 0, StrToFloat(FrmFechamento_Venda_PDV.EdtDesconto.Text), '$', StrToFloat(FrmFechamento_Venda_PDV.EdtTotal_Venda.Text),
  'PDV', 'PAGO', '', StrToFloat(FrmFechamento_Venda_PDV.EdtValor_Recebido.Text), StrToFloat(FrmFechamento_Venda_PDV.EdtTroco.Text),
  0, '', '', '', 'NÃO', '', '', '', 0, '', FormatDateTime('hh:mm', now), 0, 0, 0, 0, nu_serie_inteiro, codigo_cfop_padrao, 0, date, FrmPDV.Conexao);

  TLog.Debug('Vai atualizar os dados da NFCe no banco de dados.');
  TLog.Debug('Chave de acesso: '+dm.ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.
        Items[0].chNFe);
  TLog.Debug('Protocolo: '+dm.ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.
        Items[0].nProt);
  TLog.Debug('Nº NFCe: '+FrmPDV.LblNVenda.Caption);

  Atualiza_NFCe_Banco(dm.ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.
        Items[0].chNFe, dm.ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.
        Items[0].nProt, FrmPDV.LblNVenda.Caption, 'NFCE', 'PAGO', StrToInt(FrmPDV.LblCodigo.Caption),
        now, FrmPDV.Conexao);
  TLog.Debug('Atualizou os dados da NFCe no banco de dados.');

  TLog.Debug('Vai gravar o número da NFCe.');
  Grava_N_NFCe(StrToInt(FrmPDV.LblNVenda.Caption));
  TLog.Debug('Gravou o número da NFCe.');

  TLog.Debug('Vai gerar dados para o financeiro.');
  Gera_Financeiro(FrmPDV.Conexao);
  TLog.Debug('Gerou dados para o financeiro.');
  TLog.Debug('Variável gerar_estoque = '+IntToStr(gerar_estoque));

  if (gerar_estoque = 0) then
  begin
    TLog.Debug('Vai atualizar o estoque. Vai fazer um loop até percorrer todos os produtos da grid.');
    qAux := TADOQuery.Create(nil);
    dm.qryitens_venda.First;
    while not dm.qryitens_venda.Eof do
    begin
      if (dm.qryitens_vendaCancelado.AsString = 'N') then
      begin
        TLog.Debug('Vai abrir a query qAux com dados do produto atual na grid.');
        TLog.Debug('Descrição do Produto: '+dm.qryitens_vendaDescricao.AsString+'. Código do Produto: '+dm.qryitens_vendaCodigo_Produto.AsString);
        with qAux, SQL do
        begin
          close;
          Connection := FrmPDV.Conexao;
          clear;
          add('select P.Codigo, P.Estoque, P.Valor_Medio, P.Valor_Compra, P.Volume from Produto P ');
          Add('where Codigo = :Codigo');
          Parameters.ParamByName('Codigo').Value:= dm.qryitens_vendaCodigo_Produto.AsInteger;
          open;
        end;

        Estoque := qAux.FieldByName('Estoque').AsFloat - DM.qryitens_vendaQtde.AsFloat;
        TLog.Debug('Estoque atual do produto: '+qAux.FieldByName('Estoque').AsString);
        TLog.Debug('Quantidade vendida: '+DM.qryitens_vendaQtde.AsString);
        TLog.Debug('Novo estoque: '+FloatToStr(Estoque));

        Atualiza_Saldo_Estoque(FrmPDV.Conexao, qAux.FieldByName('Codigo').AsInteger, qAux.FieldByName('Valor_Compra').AsFloat * Estoque);
        Atualiza_Estoque(FrmPDV.Conexao, Estoque, qAux.FieldByName('Codigo').AsInteger);
        Atualiza_Volume(FrmPDV.Conexao, Estoque * qAux.FieldByName('Volume').AsFloat, qAux.FieldByName('Codigo').AsInteger);

        AtualizaMD51(qAux.FieldByName('Codigo').AsInteger,
          GeraMD5([DM.qryitens_vendaCodigo_Venda.AsString,
          DM.qryitens_vendaDescricao.AsString,
          FloatToStr(Estoque)]));
      end;

      dm.qryitens_venda.Next;
    end;
    TLog.Debug('Atualizou o estoque. Fez o loop e percorreu todos os itens da grid.');
  end;

  Limpa_Dados_N_Pedido;
  TLog.Debug('Limpou dados pra próxima venda.');

  dm.qryfechamento_venda.Active:= false;
  TLog.Debug('Fechou query condições de pagamento.');

  FrmMenu_Geral.Timer2.Enabled:= true;
  TLog.Debug('Habilitou timer no menu geral.');
  coo_vin:= '';
  coo_cupom:= '';

  if (sem_rede = false) and (FrmPDV.oCli <> nil) and (tipo_pagamento = 'A PRAZO') and (controla_credito_cliente = 0) and (TemCreditoDisponivel) then
  begin
    FClienteDom:= TClienteDominio.Create(FrmPDV.Conexao);
    FClienteDom.AtualizaCreditoCliente(FrmPDV.oCli, StrToFloat(EdtTotal_Venda.Text));
    //Cria_Arquivo_Atualiza_Dados('ACli');
  end;

  FrmPDV.oLF:= oLF;
  TLog.Debug('Atribuiu objeto oLF.');
  FrmPDV.oPLF:= oPLF;
  TLog.Debug('Atribuiu objeto oPLF.');
  FrmPDV.oCP:= oCP;
  TLog.Debug('Atribuiu objeto oCP.');
  oCli:= FrmPDV.oCli;
  TLog.Debug('Atribuiu objeto oCli.');
  FrmPDV.Limpa_Para_Novo_Registro;
  TLog.Debug('Limpou dados para próximo registro.');
  Atualiza_Codigo_Tabela_Padrao(codigo_tabela_preco_padrao);
  TLog.Debug('Atualizou tabela padrão.');

  //end;

  TLog.Debug('Vai fechar janela.');
  FrmFechamento_Venda_PDV.Close;
  TLog.Debug('Fechou janela de fechamento de venda.');

  BlockInput(false);
  TLog.Debug('Desbloqueou teclado/mouse pois acabou a finalização do cupom.');

  TLog.Debug('Atualizou produtos.');
  Atualiza_Produto(4, '');

  TConexao.ConfirmaConexao(FrmPDV.Conexao);

  if (gerar_financeiro = 0) then
  begin
    FrmGerar_Documentos:= TFrmGerar_Documentos.Create(nil, oLF, oPLF, oCP, oCli, UDeclaracao.Codigo);
    FrmGerar_Documentos.ShowModal;
    FrmGerar_Documentos.Free;
  end;


  cnpj_destinatario := '';
  razao_social_destinatario := '';
  endereco_destinatario := '';
  numero_destinatario := '';
  complemento_destinatario := '';
  setor_destinatario := '';
  codigo_municipio_destinatario := '';
  municipio_destinatario := '';
  uf_destinatario := '';
  telefone_destinatario := '';
  ie_destinatario := '';
  im_destinatario := '';
  cep_destinatario := '';
  email_destinatario := '';
  suframa_destinatario := '';
  enquadramento := '';

    {try
      if (FrmPDV <> Nil) then
      begin
        Impresso:= false;
        while not Impresso do
        begin
          if not ECF.Termina_Fechamento_Cupom(mensagem_final, pMD5_Arquivos, '', '', '') then
          begin
            Application.CreateForm(TFrmMensagem_Erro_Impressora_TEF, FrmMensagem_Erro_Impressora_TEF);
            FrmMensagem_Erro_Impressora_TEF.ShowModal;

            if (FrmMensagem_Erro_Impressora_TEF.confirma = false) then
            begin
              Nao_Confirma_Cupom;
              FrmMensagem_Erro_Impressora_TEF.Free;
            end
            else
            begin
              Impresso:= false;
              FrmMensagem_Erro_Impressora_TEF.Free;
            end;

          end
          else
          begin
            Impresso:= true;
          end;
        end;

      end
      else if (FrmCarrega_Pedido_Caixa <> Nil) then
      begin
        if (FrmCarrega_Pedido_Caixa.qrycarrega_caixaTipo.AsString = 'DAV') then
          begin
            Impresso:= false;
            while not Impresso do
            begin
              if (FrmCarrega_Pedido_Caixa.qrycarrega_caixaN_Pedido.AsString <> '') then
              begin
                if not (ECF.Termina_Fechamento_Cupom(mensagem_final, pMD5_Arquivos, FrmCarrega_Pedido_Caixa.qrycarrega_caixaN_Pedido.AsString, '', FrmCarrega_Pedido_Caixa.qrycarrega_caixan_Pre_Venda.AsString)) then
                begin
                  Application.CreateForm(TFrmMensagem_Erro_Impressora_TEF, FrmMensagem_Erro_Impressora_TEF);
                  FrmMensagem_Erro_Impressora_TEF.ShowModal;
                  if (FrmMensagem_Erro_Impressora_TEF.confirma = false) then
                  begin
                    Nao_Confirma_Cupom;
                    FrmMensagem_Erro_Impressora_TEF.Free;
                  end
                  else
                  begin
                    Impresso:= false;
                    FrmMensagem_Erro_Impressora_TEF.Free;
                  end;
                end
                else
                begin
                  Impresso:= true;
                end;
              end
              else if not (ECF.Termina_Fechamento_Cupom(mensagem_final, pMD5_Arquivos, '', '', FrmCarrega_Pedido_Caixa.qrycarrega_caixan_Pre_Venda.AsString)) then
              begin
                Application.CreateForm(TFrmMensagem_Erro_Impressora_TEF, FrmMensagem_Erro_Impressora_TEF);
                FrmMensagem_Erro_Impressora_TEF.ShowModal;
                if (FrmMensagem_Erro_Impressora_TEF.confirma = false) then
                begin
                  Nao_Confirma_Cupom;
                  FrmMensagem_Erro_Impressora_TEF.Free;
                end
                else
                begin
                  Impresso:= false;
                  FrmMensagem_Erro_Impressora_TEF.Free;
                end;
              end
              else
              begin
                Impresso:= true;
              end;
            end;
          end
          else
          begin
            Impresso:= false;
            while not Impresso do
            begin

              if not (ECF.Termina_Fechamento_Cupom(mensagem_final, pMD5_Arquivos, '', FrmCarrega_Pedido_Caixa.qrycarrega_caixaN_Pedido.AsString, '')) then
              begin

                //chama o form da mensagem
                Application.CreateForm(TFrmMensagem_Erro_Impressora_TEF, FrmMensagem_Erro_Impressora_TEF);
                FrmMensagem_Erro_Impressora_TEF.ShowModal;
                if (FrmMensagem_Erro_Impressora_TEF.confirma = false) then
                begin
                  Nao_Confirma_Cupom;
                  FrmMensagem_Erro_Impressora_TEF.Free;
                end
                else
                begin
                  Impresso:= false;
                  FrmMensagem_Erro_Impressora_TEF.Free;
                end;

              end
              else
              begin
                Impresso:= true;
              end;
            end;
          end;
      end;
    except
      on e: Exception do
      begin
        TLogger.GetInstance.Error('Mensagem de erro em: Termina fechamento do cupom. '+e.Message);
      end;
    end;}

    //TLog.Debug('Vai aguardar 1 segundo.');
    //Sleep(1000);
    //TLog.Debug('Aguardou 1 segundo.');

    {try
      Imprime_Transacao_TEF;
    except
      on e: Exception do
      begin
        TLogger.GetInstance.Error('Mensagem de erro em: Imprimir transação TEF. '+e.Message);
      end;
    end;}

    {Coleta_Dados_R04;
    R04.Inserir(R04);

    Coleta_Dados_R06;
    R06.Inserir(R06); }

    //if (FrmPDV <> NIl) then
    //begin
      //ECF.Pega_Contadores;
      {TLog.Debug('Vai enviar o COO do cupom fiscal para o BD via PDV: '+coo_cupom);
      TLog.Debug('Vai enviar o CCF do cupom fiscal para o BD via PDV: '+UDeclaracao.ccf);
      TLog.Debug('Vai enviar o COO Vinculado para o BD via PDV: '+coo_vin);}

      {Pedido.Salva_Banco('S', 'I' , StrToInt(FrmPDV.LblCodigo.Caption), UDeclaracao.pedido, UDeclaracao.pre_venda,
      coo_cupom, coo_vin, UDeclaracao.ccf, FrmPDV.Codigo_Cliente, UDeclaracao.codigo_empresa,
      0, codigo_usu, codigo_tabela_preco_ativo, codigo_forma_pagamento, StrToDate(dataf), date, 0, 0, StrToFloat(FrmFechamento_Venda_PDV.EdtSub_Total.Text),
      0, 0, StrToFloat(FrmFechamento_Venda_PDV.EdtDesconto.Text), '$', StrToFloat(FrmFechamento_Venda_PDV.EdtTotal_Venda.Text),
      'PDV', 'PAGO', '', StrToFloat(FrmFechamento_Venda_PDV.EdtValor_Recebido.Text), StrToFloat(FrmFechamento_Venda_PDV.EdtTroco.Text),
      0, '', '', '', 'NÃO', '', '', '', 0, '', FormatDateTime('hh:mm', now), 0, 0, 0, 0, nu_serie_inteiro, codigo_cfop_padrao, 0, date, dm.ADOConnection1);
       }
    //end;


    {if (Verifica_Status_Rede(ipservidor)) or (qtde_mac = '1') then
      sem_rede:= false
    else
      sem_rede:= true;}

      {try
        if (sem_rede = false) then
        begin
          if (FrmPDV <> Nil) then
          begin
            if (DM.ADOConnection1.InTransaction) then
            begin
              dm.ADOConnection1.CommitTrans;
            end;

            dm.qryvenda.Close;
            dm.qryvenda.Open;
            dm.qryvenda.First;

            while not dm.qryvenda.Eof do begin
              Gera_Codigo_Lancamento(dm.ADOConnection1);
              FrmPDV.LblCodigo.Caption:= IntToStr(UDeclaracao.Codigo);
              LblCodigo.Caption:= IntToStr(UDeclaracao.Codigo);
              TLog.Debug('Gerou código do pedido ao gravar no banco de dados: '+LblCodigo.Caption);

              Pedido.Salva_Banco('S', 'I' , UDeclaracao.Codigo, dm.qryvenda['N_Pedido'], dm.qryvenda['N_Pre_Venda'],
              dm.qryvenda['COO'], dm.qryvenda['COO_Vin'], dm.qryvenda['CCF'], dm.qryvenda['Codigo_Cliente'], dm.qryvenda['Codigo_Empresa'],
              dm.qryvenda['Codigo_Veiculo'], dm.qryvenda['Codigo_Funcionario'], dm.qryvenda['Codigo_Tabela_Preco'], dm.qryvenda['Codigo_Forma_Pag'], dm.qryvenda['Data_Venda'],
              dm.qryvenda['Data_Vencimento'], dm.qryvenda['Qtde_Itens'], dm.qryvenda['Qtde_Servicos'], dm.qryvenda['Total_Produtos'],
              dm.qryvenda['Total_Servicos'], dm.qryvenda['Total_Desc_Acr'], dm.qryvenda['Desc_Acr'], dm.qryvenda['Tipo_Desc_Acr'], dm.qryvenda['Total_Pedido'],
              dm.qryvenda['Tipo'], dm.qryvenda['Status'], '', dm.qryvenda['Valor_Recebido'], dm.qryvenda['Troco'], dm.qryvenda['Mesclada'],
              dm.qryvenda['Problema_Reclamado'], dm.qryvenda['Problema_Constatado'], dm.qryvenda['Solucao'], dm.qryvenda['DAVC'], dm.qryvenda['DAVAnt'], '', '', 0,
              dm.qryvenda['Observacao'], dm.qryvenda['Hora_Venda'], dm.qryvenda['Atualizou_Orcamento_Vencido'], dm.qryvenda['Data_Previsao_Entrega'],
              dm.qryvenda['Data_Entrega'], dm.qryvenda['Kilometragem'], dm.qryvenda['ECF'], dm.qryvenda['Codigo_CFOP'], dm.qryvenda['Total_Impostos'], dm.qryvenda['Data_Emissao_NFe'], dm.ADOConnection1);

              Itens_Pedido.Salva_Banco_PDV(Itens_Pedido);

              salvarFichaEstoque(dm.qryvenda['COO']);

              R05.Salva_Banco_PDV(R05);
              Fechamento_Venda.Salva_Banco_PDV;
              R04.Salva_Banco_PDV;

              FrmPDV.Grava_Pedido_Endereco_Cliente;

              DM.qryvenda.Next;
            end;

            R07.Salva_Banco(R07);

            R06.Salva_Banco(R06);

            AtualizarQuantidadeRegistro('Pedido', 'QtdeDAV');
            AtualizarQuantidadeRegistro('Itens_Pedido', 'QtdeItensDAV');
            UDeclaracao.Insere_Historico(usuario, 'EMITIU CUPOM FISCAL DA VENDA - COO '+coo, TimeToStr(time), insercao, date);
          end
          else
          begin
            Fechamento_Venda.Salva_Banco(Fechamento_Venda);
            R04.Salva_Banco(R04);

            R07.Salva_Banco(R07);

            R06.Salva_Banco(R06);

            TLog.Debug('Vai enviar o COO do cupom fiscal para o BD via Carregar_Pedido: '+coo_cupom);
            TLog.Debug('Vai enviar o CCF do cupom fiscal para o BD via Carregar_Pedido: '+UDeclaracao.ccf);
            TLog.Debug('Vai enviar o COO Vinculado para o BD via Carregar_Pedido: '+coo_vin);

            Grava_Pedido_Informacoes_ECF(FrmCarrega_Pedido_Caixa.qrycarrega_caixaCodigo.AsInteger,
                                          nu_serie_inteiro,
                                          mf,
                                          'ECF-IF',
                                          'BEMATECH',
                                          UDeclaracao.sModelo,
                                          coo_cupom,
                                          coo_vin,
                                          Copy(UDeclaracao.Sequencia,2,3),
                                          '',//////faltou o MD5 aqui
                                          dm.ADOConnection1);

            AtualizarQuantidadeRegistro('Pedido_Informacoes_ECF', 'QtdeDAVRegD2');
            //AtualizarQuantidadeRegistro('Itens_Pedido', 'QtdeItensDAV');

            MD5Criado:= GeraMD5([coo_cupom,
                                FrmCarrega_Pedido_Caixa.qrycarrega_caixaN_Pedido.AsString,
                                Copy(UDeclaracao.Sequencia,2,3),
                                FrmCarrega_Pedido_Caixa.qrycarrega_caixaNome_Nome_Fantasia.AsString,
                                FrmCarrega_Pedido_Caixa.qrycarrega_caixaCPF.AsString,
                                FrmCarrega_Pedido_Caixa.qrycarrega_caixaData_Venda.AsString,
                                FrmCarrega_Pedido_Caixa.qrycarrega_caixaTotal_Pedido.AsString]);

                                AtualizaMD5('Pedido', MD5Criado, 'Codigo', FrmCarrega_Pedido_Caixa.qrycarrega_caixaCodigo.AsString, dm.ADOConnection1);


            Pedido.Alterar_Pedido(coo_cupom, coo_vin, UDeclaracao.ccf);
            //Altera_Pedido_Aux(FrmCarrega_Pedido_Caixa.qrycarrega_caixaN_Pedido.AsString, coo_cupom);

            UDeclaracao.Insere_Historico(usuario, 'EMITIU CUPOM FISCAL DA VENDA - COO '+coo, TimeToStr(time), insercao, date);
          end;

        end
        else
        begin
          Mensagem_Erro_Rede;
        end;

        ECF.Pega_Grande_Total;
        AlteraGT(StrToFloat(UDeclaracao.GrandeTotal), nu_serie);

      except on E:Exception do
        begin
          TLogger.GetInstance.Error('Mensagem de erro em: Salvar dados no banco de dados. '+e.Message);
          ShowMessage('Erro ao salvar no banco de dados ' + E.Message);
        end;
      end;}

      //if (sem_rede = False) then
      //begin
        {TLog.Debug('Vai gerar dados para o financeiro.');
        Gera_Financeiro;
        TLog.Debug('Gerou dados para o financeiro.'); }
      //end;

      {if (FrmCarrega_Pedido_Caixa <> NIl) then
      begin

        FrmCarrega_Pedido_Caixa.oLF:= oLF;
        FrmCarrega_Pedido_Caixa.oPLF:= oPLF;
        FrmCarrega_Pedido_Caixa.oCP:= oCP;
        oCli:= FrmCarrega_Pedido_Caixa.oCli;

        FrmCarrega_Pedido_Caixa.Chama_Dados;

      end;}

      {Limpa_Dados_N_Pedido;
      TLog.Debug('Limpou dados pra próxima venda.');

      qryfechamento_venda.Active:= false;
      TLog.Debug('Fechou query condições de pagamento.');

      FrmMenu_Geral.Timer2.Enabled:= true;
      TLog.Debug('Habilitou timer no menu geral.');
      coo_vin:= '';
      coo_cupom:= ''; }

      {if (sem_rede = false) then
      begin
        Limpa_Local;
        Cria_Arquivo_Atualiza_Dados('AProd');
      end;}

      //if (FrmPDV <> nil) then
      //begin
        {if (sem_rede = false) and (FrmPDV.oCli <> nil) and (tipo_pagamento = 'A PRAZO') and (controla_credito_cliente = 0) and (TemCreditoDisponivel) then
        begin
          FClienteDom:= TClienteDominio.Create(dm.ADOConnection1);
          FClienteDom.AtualizaCreditoCliente(FrmPDV.oCli, StrToFloat(EdtTotal_Venda.Text));
          //Cria_Arquivo_Atualiza_Dados('ACli');
        end;

        FrmPDV.oLF:= oLF;
        TLog.Debug('Atribuiu objeto oLF.');
        FrmPDV.oPLF:= oPLF;
        TLog.Debug('Atribuiu objeto oPLF.');
        FrmPDV.oCP:= oCP;
        TLog.Debug('Atribuiu objeto oCP.');
        oCli:= FrmPDV.oCli;
        TLog.Debug('Atribuiu objeto oCli.');
        FrmPDV.Limpa_Para_Novo_Registro;
        TLog.Debug('Limpou dados para próximo registro.');
        Atualiza_Codigo_Tabela_Padrao(codigo_tabela_preco_padrao);
        TLog.Debug('Atualizou tabela padrão.');

      //end;

      TLog.Debug('Vai fechar janela.');
      FrmFechamento_Venda_PDV.Close;
      TLog.Debug('Fechou janela de fechamento de venda.');

      BlockInput(false);
      TLog.Debug('Desbloqueou teclado/mouse pois acabou a finalização do cupom.');

      TLog.Debug('Atualizou produtos.');
      Atualiza_Produto(4, '');

      if (gerar_financeiro = 0) then
      begin
        FrmGerar_Documentos:= TFrmGerar_Documentos.Create(nil, oLF, oPLF, oCP, oCli, UDeclaracao.Codigo);
        FrmGerar_Documentos.ShowModal;
        FrmGerar_Documentos.Free;
      end;}
end;

procedure TFrmFechamento_Venda_PDV.ImprimeTEF;
var
  TemAlerta: boolean;
  StatusImpressora, TentaAtivar: Boolean;
begin
  //se a condição de pagamento for TEF, tem que ativar o componente ACBrPosPrinter que comunica com a impressora NF
  //Fica em loop (while) pq as vezes ainda está imprimindo a NFCe, logo, não da pra acessar a impressora pra
  //imprimir o comprovante TEF enquanto não terminar a NFCe.

  //Variavel ETEF é alimentada quando o usuário clica pra escolher a condição de pagamento ou no Create deste form
  //através do método Pega_Codigo_Forma_Pagamento;
  if (ETEF = 'SIM') then
  begin
    TentaAtivar:= false;
    while not TentaAtivar do
    begin
      try
        dm.ACBrPosPrinter1.Ativo:= true;
        TentaAtivar:= true;
      except
        TentaAtivar:= False;
      end;
    end;
  end;

  //Se for TEF, tem que ativar a porta da impressora não fiscal. Fica em loop até conseguir ativar.
  if (ETEF = 'SIM') then
  begin
    StatusImpressora:= false;
    while not StatusImpressora do
    begin
      Verifica_Status_Impressora_NF(StatusImpressora, porta_ecf);
      if (StatusImpressora = true) then
          Imprime_Transacao_TEF;
    end;
  end;

end;

procedure TFrmFechamento_Venda_PDV.Fecha_Cupom();
var
  gerou_financeiro: boolean;
  MD5Produto, MD5ProdutoGerado: AnsiString;
  i: integer;
  qAux: TADOQuery;
begin
  if (pode_fechar = true) then
  begin
    if (FrmPDV <> nil) then
    begin
      Calcula_Imposto_Lei;
      MmoDados_Adicionais.Refresh;
      mensagem_final:= MmoDados_Adicionais.Text;
      GerarNFCe;
      EnviarNFCe;
      ImprimirNFCe;
      ImprimeTEF;
      GravaDadosBD;
    end
    else
    begin
      LblFechamento.Caption:= 'Pagamento informado.';
      Application.MessageBox('Pagamento informado. Por favor, comande a geração e envio da NFe/NFCe.', 'Pagamento informado.', MB_OK+MB_ICONQUESTION);
      Atualiza_Dados_Fechamento(dm.ADOConnection1, StrToInt(FrmNFE.EdtCodigo_Pedido.Text));
      Close;
    end;
  end
  else
  begin
    Nao_Fecha_Cupom;
    //Calcula_Total_Faltando;
  end;
end;

function TFrmFechamento_Venda_PDV.salvarFichaEstoque(COO : string): Boolean;
var
 NFEDominio : INFEDominio;
 fichaEstoque: TFichaEstoque;
begin
  try
    try
      Result := False;
      NFEDominio := TNFEDominio.Create(dm.ADOConnection1);
      FFicahEstoques.FichasEstoques.Clear;
      preencherFichaEstoque(COO);
      for fichaEstoque in FFicahEstoques.FichasEstoques do begin
        if Assigned(fichaEstoque) then begin
          Result := NFEDominio.salvarFichaEstoque(fichaEstoque.CodigoItemPedido, fichaEstoque);
        end;
      end;
    except
      on E : Exception do
        TLog.Error(Self.ClassName+' - salvarFichaEstoque - '+E.Message);
    end;
  finally
    NFEDominio := nil;
  end;
end;

procedure TFrmFechamento_Venda_PDV.Limpa_Local;
begin
  R04.Excluir(R04);
  R05.ExcluirLocal(R05);
  R06.Excluir(R06);
  R07.Excluir(R07);
  Pedido.ExcluirLocal(Pedido);
  Itens_Pedido.ExcluirLocal(Itens_Pedido);
  Fechamento_Venda.ExcluirLocal(Fechamento_Venda);
  Controla_Codigo.Excluir_Local;

  Inicializa_Dados_Principais_Movimentacao(5, dm.qryvenda);
  Inicializa_Dados_Principais_Movimentacao(6, dm.qryitens_venda);
  Inicializa_Dados_Principais_Movimentacao(9, dm.qrycontrola_codigo);
  Inicializa_Dados_Principais_Movimentacao(7, dm.qryr05);
  Inicializa_Dados_Principais_Movimentacao(11, dm.qryr04);
  Inicializa_Dados_Principais_Movimentacao(12, dm.qryr07);
  Inicializa_Dados_Principais_Movimentacao(13, dm.qryR06);
  Inicializa_Dados_Principais_Movimentacao(14, dm.qryfechamento_venda_aux);
end;

procedure TFrmFechamento_Venda_PDV.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  qAux: TADOQuery;
  gerou_financeiro: boolean;
  cAcreDesc, cTipoAcreDesc, cValorAcreDesc, cFormaPgto, cValorPago: string;
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f7) then
  begin
    Application.CreateForm(TFrmInforma_Forma_Pagamento, FrmInforma_Forma_Pagamento);
    FrmInforma_Forma_Pagamento.ShowModal;
    FrmInforma_Forma_Pagamento.Free;

    Verifica_Credito_Cliente;
  end;

  if (key = VK_RETURN) then
  begin
    //Fecha_Cupom;
  end;
end;

procedure TFrmFechamento_Venda_PDV.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      //Perform(Wm_NextDlgCtl,0,0);
      //SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmFechamento_Venda_PDV.Atualiza_Dados;
begin
  with qryitens_venda, sql do
  begin
    close;
    clear;
    add('select IP.*, M.Descricao as Marca from Itens_Pedido IP');
    add('left join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
    add('where IP.Codigo = :Codigo and IP.Cancelado = :N order by IP.Descricao');
    Parameters.ParamByName('Codigo').Value:= StrToInt(LblCodigo.Caption);
    Parameters.ParamByName('N').Value:= 'N';
    open;
  end;
end;

procedure TFrmFechamento_Venda_PDV.Cabecalho_Comprovante_Compra;
var
  i: integer;
begin
  if (rs.Paginas = 0) then
    rs.BeginDoc;
  i:= 0;
  i2:= 136;
  linha:= 0;
  conta:= 0;

  //dav:= 'NÃO É DOCUMENTO FISCAL - NÃO É VÁLIDO COMO RECIBO E COMO GARANTIA DE MERCADORIA - ';
  //dav2:= 'NÃO COMPROVA PAGAMENTO';
  tipo_rela:= 'COMPROVANTE DE COMPRA';


  inc(linha);
  rs.WriteFont(linha, Alinha_Centro(tipo_rela,i2),tipo_rela, [Bold] + [DobleWide]);
  //inc(linha);
  //rs.WriteFont(linha, Alinha_Centro(dav,i2), dav, [Bold] + [DobleWide]);
  //inc(linha);
  //rs.WriteFont(linha, Alinha_Centro(dav2,i2), dav2, [Bold] + [DobleWide]);

  inc(linha);
  for i := 0 to i2 do
    rs.Write(linha,i,'-');

  cn:= Copy(cnpj,1,2)+'.'+Copy(cnpj,3,3)+'.'+Copy(cnpj,6,3)+'/'+
    Copy(cnpj,9,4)+'-'+Copy(cnpj,13,2);

  cp:= Copy(FrmCarrega_Pedido_Caixa.qrycarrega_caixaCPF.AsString,1,3)+'.'+Copy(FrmCarrega_Pedido_Caixa.qrycarrega_caixaCPF.AsString,4,3)+'.'+Copy(FrmCarrega_Pedido_Caixa.qrycarrega_caixaCPF.AsString,7,3)+'-'+
    Copy(FrmCarrega_Pedido_Caixa.qrycarrega_caixaCPF.AsString,10,2);

  inc(linha);
  rs.Write(linha,0, 'Empresa');
  rs.Write(linha,50, 'CNPJ');
  inc(linha);
  rs.Write(linha,0, nome_fantasia);
  rs.Write(linha,50, cn);

  inc(linha);
  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha,i,'-');

  inc(linha);
  rs.Write(linha,0, 'Destinatário');
  rs.Write(linha,50, 'CPF/CNPJ');
  inc(linha);
  rs.Write(linha,0, FrmCarrega_Pedido_Caixa.qrycarrega_caixaNome_Nome_Fantasia.AsString);
  rs.Write(linha,50, cp);

  inc(linha);
  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha,i, '-');

  inc(linha);
  rs.Write(linha,0, 'Número do Documento: ' + FrmCarrega_Pedido_Caixa.qrycarrega_caixaN_Pedido.AsString);
  rs.Write(linha, 40, 'Número do Documento Fiscal: ' + coo_cupom);
  rs.Write(linha, 80, 'Página Nº: ' + IntToStr(rs.PageNo));
  rs.Write(linha, 100, 'Data: ' + DateToStr(Date));

  inc(linha);
  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha,i, '-');

  linha:= linha + 2;
  rs.WriteFont(linha,0,'Produtos', [Underline]);
  linha:= linha + 2;
  rs.WriteFont(linha, 0,'Código Produto', [Underline]);
  rs.WriteFont(linha, 16, 'Descrição', [Underline]);
  rs.WriteFont(linha, 70, 'Un.', [Underline]);
  rs.WriteFont(linha, 75, 'Qtde.', [Underline]);
  rs.WriteFont(linha, 85, 'Valor Un.', [Underline]);
  rs.WriteFont(linha, 100, 'Valor Total', [Underline]);
  rs.WriteFont(linha, 115, 'Marca', [Underline]);
  linha:= linha + 2;
end;

procedure TFrmFechamento_Venda_PDV.Comprovante_Compra;
var
  i: integer;
  assinatura: AnsiString;
begin
  Cabecalho_Comprovante_Compra;
  i:= 0;

  Atualiza_Dados;
  qryitens_venda.First;

  while not qryitens_venda.Eof do
  begin
    rs.Write(linha, 0, qryitens_vendaCodigo_Venda.AsString);
    rs.Write(linha, 16, qryitens_vendaDescricao.AsString);
    rs.Write(linha, 70, qryitens_vendaUN.AsString);
    rs.Write(linha, 75, FormatFloat('#0.0,0', qryitens_vendaQtde.AsFloat));
    rs.Write(linha, 85, FormatFloat('#0.0,0', qryitens_vendaValor_Unitario.AsFloat));
    rs.Write(linha, 100, FormatFloat('#0.0,0', qryitens_vendaSub_Total.AsFloat));
    rs.Write(linha, 115, qryitens_vendaMarca.AsString);
    Inc(linha);

    if (linha = rs.Lines) then
    begin
      rs.NewPage;
      Cabecalho_Comprovante_Compra;
    end;

    qryitens_venda.Next;
  end;

  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha + 1,i, '-');

  if (linha <= rs.Lines - 3) then
  begin
    i:= 1;
    rs.Write(linha + 2, i, 'Cond. Pag.........: ' + FrmCarrega_Pedido_Caixa.qrycarrega_caixaCP.AsString);
    rs.WriteFont(linha + 3, i, 'Total Pedido......: ' + FrmCarrega_Pedido_Caixa.qrycarrega_caixaTotal_Pedido.AsString, [Bold]);
    linha:= linha + 3;
  end
  else
  begin
    rs.NewPage;
    linha:= 1;
    i:= 1;
    rs.Write(linha, i, 'Cond. Pag.........: ' + FrmCarrega_Pedido_Caixa.qrycarrega_caixaCP.AsString);
    rs.WriteFont(linha + 1, i, 'Total Pedido......: ' + FormatFloat('#0.0,0', FrmCarrega_Pedido_Caixa.qrycarrega_caixaTotal_Pedido.AsFloat), [Bold]);
    linha:= linha + 2;
  end;

  assinatura:= '____________________________________________________________';

  if (linha <= rs.Lines - 5) then
  begin
    i:= 1;
    rs.Write(linha + 3, Alinha_Centro(assinatura,i2),assinatura);
    rs.Write(linha + 5, Alinha_Centro(FrmCarrega_Pedido_Caixa.qrycarrega_caixaNome_Nome_Fantasia.AsString,i2),FrmCarrega_Pedido_Caixa.qrycarrega_caixaNome_Nome_Fantasia.AsString);
    linha:= linha + 6;
  end
  else
  begin
    rs.NewPage;
    linha:= 1;
    i:= 1;
    rs.Write(linha + 4, Alinha_Centro(assinatura,i2),assinatura);
    rs.Write(linha + 6, Alinha_Centro(FrmCarrega_Pedido_Caixa.qrycarrega_caixaNome_Nome_Fantasia.AsString,i2),FrmCarrega_Pedido_Caixa.qrycarrega_caixaNome_Nome_Fantasia.AsString);
    linha:= linha + 7;
  end;


  rodape:= 'É vedada a autenticação deste documento';

  if (linha <= rs.Lines - 1) then
    rs.Write(linha + 1,Alinha_Centro(rodape, i2), rodape)
  else
  begin
    rs.NewPage;
    linha:= 1;
    rs.Write(linha,Alinha_Centro(rodape, i2), rodape)
  end;
  rs.Print;
  rs.EndDoc;
end;

procedure TFrmFechamento_Venda_PDV.Gera_Financeiro(var Conexao: TADOConnection);
var
  qAux, qAux2: TADOQuery;
  codigo_lancamento, i, doc: integer;
  data_vencim: TDate;
  valaux, valaux2: double;
begin
  qAux:= TADOQuery.Create(self);
  qAux2:= TADOQuery.Create(self);
  try
    try

      if (tipo_dias = 0) then
      begin
        data_vencim:= IncDay(date, prazo);
      end
      else if (tipo_dias = 1) then
      begin
        data_vencim:= date + prazo;
      end
      else if (tipo_dias = 2) then
      begin
        data_vencim:= IncMonth(date, 1);
      end;
      TLog.Debug('Gerou data de vencimento.');

      doc:= StrToInt(LblCodigo.Caption);
      TLog.Debug('Pegou código do pedido gerado para colocar como nº de documento do lançamento financeiro: '+IntToStr(doc));

      oLF := TLancamentoFinanceiroEntidade.Create;
      TLog.Debug('Criou objeto oLF.');

      codigo_lancamento:= TGeradorDeCodigo.GeraCodigoSequenciaControlaCodigo('Controla_Codigo_Lancamento_Financeiro', dm.ADOConnection1);
      TLog.Debug('Gerou código do lançamento financeiro: '+IntToStr(codigo_lancamento));

      oLF.Codigo:= codigo_lancamento;

      oLF.Tipo:= TipoLancamentoEnum.RECEBER;
      TLog.Debug('Gerou tipo de conta à receber.');
      oLF.NDocumento:= doc;
      oLF.Codigo_Empresa:= UDeclaracao.codigo_empresa;
      TLog.Debug('Pegou código da empresa.');
      oLF.Codigo_Forma_Pagamento:= oCP.Codigo;
      TLog.Debug('Pegou código da forma de pagamento');

      if (FrmCarrega_Pedido_Caixa <> nil) then
        oLF.Codigo_Cli_For:= FrmCarrega_Pedido_Caixa.qrycarrega_caixaCodigo_Cliente.AsInteger
      else if (FrmPDV <> nil) then
        oLF.Codigo_Cli_For:= FrmPDV.Codigo_Cliente;

      TLog.Debug('Pegou código do cliente: '+IntToStr(oLF.Codigo_Cli_For));
      oLF.Codigo_Tipo_Documento:= codigo_tipo_documento;
      //ECF.Pega_Contadores;
      oLF.Historico:= historico_conta + ' COO ' + coo_cupom;
      oLF.Codigo_Departamento:= codigo_departamento;
      oLF.Codigo_Plano:= codigo_plano_financeiro;
      oLF.Data_Lancamento:= date;
      oLF.Data_Vencimento:= data_vencim;
      oLF.Valor_Documento:= (dm.qryfechamento_vendaValor.AsFloat - dm.qryfechamento_vendaTroco.AsFloat);
      TLog.Debug('Pegou valor do documento. '+FloatToStr(dm.qryfechamento_vendaValor.AsFloat - dm.qryfechamento_vendaTroco.AsFloat));
      oLF.Desconto:= 0;
      oLF.Multa := 0;
      oLF.Valor_Cobrado:= (dm.qryfechamento_vendaValor.AsFloat - dm.qryfechamento_vendaTroco.AsFloat);
      oLF.Observacoes:= '';
      //oLF.Status:= StatusEnum(1);
      oLF.Conta_Fixa:= 1;
      oLF.Calcula_Juro:= 1;

      doc:= StrToInt(IntToStr(doc) + '1');
      for i := 1 to qtde_parcela do
      begin
        oPLF := TParcelasLancamentoFinanceiroEntidade.Create;
        TLog.Debug('Criou objeto oPLF');
        oPLF.Codigo:= codigo_lancamento;
        TLog.Debug('Pegou o mesmo código gerado no lançamento financeiro para colocar nas parcelas: '+IntToStr(codigo_lancamento));
        oPLF.N_Documento:= doc;
        TLog.Debug('Pegou código do pedido gerado para colocar como nº de documento das parcelas geradas: '+IntToStr(doc));
        oPLF.Data_Vencimento:= data_vencim;
        TLog.Debug('Gerou data de vencimento. '+DateToStr(data_vencim));

        if (tipo_pagamento = 'A PRAZO') then
        begin
          oPLF.Data_Pagamento:= 0;
        end
        else
        begin
          oPLF.Data_Pagamento:= date;
        end;

        if (tipo_dias = 0) then
        begin
          data_vencim:= IncDay(data_vencim, prazo);
        end
        else if (tipo_dias = 1) then
        begin
          data_vencim:= data_vencim + prazo;
        end
        else if (tipo_dias = 2) then
        begin
          data_vencim:= IncMonth(data_vencim, 1);
        end;

        inc(doc);
        oPLF.Parcela:= i;

        if (tipo_pagamento = 'A PRAZO') then
        begin
          oPLF.Status:= StatusEnumParcela.PENDENTE;
        end
        else
        begin
          oPLF.Status:= StatusEnumParcela.PAGO;
        end;

        valaux2:= dm.qryfechamento_vendaValor.AsFloat - dm.qryfechamento_vendaTroco.AsFloat;
        valaux2:= (valaux2 / qtde_parcela);
        oPLF.Valor:= valaux2;
        oPLF.Valor_Pagar:= valaux2;

        TLog.Debug('Pegou valor da parcela. '+FloatToStr(valaux2));

        oPLF.Codigo_Forma_Pagamento_Parcela:= oCP.Codigo;

        if (tipo_pagamento = 'A PRAZO') then
          oPLF.Valor_Restante:= valaux2
        else
          oPLF.Valor_Restante:= 0;

        oPLF.Desconto:= 0;
        oPLF.Acrescimo:= 0;

        if (tipo_pagamento = 'A PRAZO') then
          oPLF.Valor_Pago:= 0
        else
          oPLF.Valor_Pago:= valaux2;

        TLog.Debug('...');
        oLF.ParcelasLancamentoFinanceiro.Add(oPLF);
        TLog.Debug('Adicionou objeto oPLF dentro do oLF');
      end;
    finally
      FreeAndNil(qAux);
      FreeAndNil(qAux2);
    end;
  except on E:Exception do
  begin
    TLog.Error('Erro ao gerar dados para o financeiro: '+e.Message);
  end;

  end;
end;

procedure TFrmFechamento_Venda_PDV.Pega_Codigo_Forma_Pagamento(Forma: AnsiString);
begin
  qAux_Forma_Pagamento:= TADOQuery.Create(self);
  with qAux_Forma_Pagamento, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select CP.Codigo, CP.Parcela, CP.Prazo, CP.Tipo_Pagamento, CP.Taxa, CP.Indice, ');
    Add('CP.CNPJ_Operadora, CP.Tipo_Juro, CP.Cheque, CP.TEF from Condicao_Pagamento CP');
    add('where Descricao = :Descricao');
    Parameters.ParamByName('Descricao').Value:= Forma;
    open;

    codigo_forma_pagamento:= qAux_Forma_Pagamento.FieldByName('Codigo').AsInteger;
    indice_imp:= qAux_Forma_Pagamento.FieldByName('Indice').AsString;
    qtde_parcela:= qAux_Forma_Pagamento.FieldByName('Parcela').AsInteger;
    prazo:= qAux_Forma_Pagamento.FieldByName('Prazo').AsInteger;
    taxa_juro:= qAux_Forma_Pagamento.FieldByName('Taxa').AsInteger;
    tipo_pagamento:= qAux_Forma_Pagamento.FieldByName('Tipo_Pagamento').AsString;
    tipo_juro:= qAux_Forma_Pagamento.FieldByName('Tipo_Juro').AsString;
    ETEF:= qAux_Forma_Pagamento.FieldByName('TEF').AsString;
    EChqueTipoPagamento:= qAux_Forma_Pagamento.FieldByName('Cheque').AsString;
    CNPJOperadora:= qAux_Forma_Pagamento.FieldByName('CNPJ_Operadora').AsString;
  end;
end;

procedure TFrmFechamento_Venda_PDV.Pega_Financeiro_Gerado(Codigo: integer);
begin
  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select PL.N_Documento, PL.Data_Vencimento, PL.Valor from Parcelas_Lancamentos PL');
    add('where PL.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= Codigo;
    open;
  end;
end;

procedure TFrmFechamento_Venda_PDV.Pega_Forma_Pagamento_DAV;
var
  tec, indice, te: string;
  i, tamanho: integer;
begin
  qAux_Pagamento_DAV:= TADOQuery.Create(self);
  try
    with qAux_Pagamento_DAV, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select PPD.* from Pedido_Pagamento_DAV PPD');
      add('where PPD.Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= StrToInt(LblCodigo.Caption);
      open;

      if (IsEmpty = false) then
      begin
        tec:= '';
        tec:= qAux_Pagamento_DAV.FieldByName('Codigo_Forma_Pagamento_Selecionada').AsString;

        for i := 0 to ListBox1.Items.Count - 1 do
          begin
            te:= copy(ListBox1.Items.Strings[i],1,2);
            te:= StringReplace(te, '.', '', [rfReplaceAll]);

            if (Length(te) = 1) then
              indice:= copy(ListBox1.Items.Strings[i],1,5)
            else
              indice:= copy(ListBox1.Items.Strings[i],1,6);

            tamanho:= Length(indice) + 2;
            texto:= copy(ListBox1.Items.Strings[i],tamanho,50);

            indice:= StringReplace(indice, '.','',[rfReplaceAll]);
            indice:= StringReplace(indice, ':','',[rfReplaceAll]);
            if (tec = indice) then
            begin
              ListBox1.ItemIndex:= StrToInt(tec) -1;
              EdtForma_Pagamento.Text:= texto;

              {codigo_forma_pagamento:= qAux_Pagamento_DAV.FieldByName('Codigo_Forma_Pagamento').AsInteger;
              qtde_parcela:= qAux_Pagamento_DAV.FieldByName('Qtde_Parcela').AsInteger;
              prazo:= qAux_Pagamento_DAV.FieldByName('Prazo').AsInteger;
              tipo_pagamento:= qAux_Pagamento_DAV.FieldByName('Tipo_Pagamento').AsString; }
              Pega_Codigo_Forma_Pagamento(EdtForma_Pagamento.Text);
              break;
            end;
          end;
      end;
    end;
  finally
    FreeAndNil(qAux_Pagamento_DAV);
  end;
end;

procedure TFrmFechamento_Venda_PDV.preencherFichaEstoque(COO : string);
var
  fichaEstoque:TFichaEstoque;
begin
  try
    with DM.qryitens_venda, SQL do begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select * from Itens_Pedido IP');
      add('where IP.Codigo = :Codigo and IP.Cancelado = :N');
      Parameters.ParamByName('Codigo').Value := UDeclaracao.Codigo;
      Parameters.ParamByName('N').Value := 'N';
      open;
    end;

    while not DM.qryitens_venda.Eof do begin
      fichaEstoque:= TFichaEstoque.Create;
      FichaEstoque.DataLancamento         := date;
      FichaEstoque.DataMovimentacao       := FichaEstoque.DataLancamento;
      FichaEstoque.TipoFichaEstoque       := TipoFichaEstoqueEnum.SAIDA;
      FichaEstoque.TipoDocumento          := CUPOM_FISCAL;
      FichaEstoque.NumDocumento           := COO;
      fichaEstoque.CodigoItemPedido       := DM.qryitens_venda.FieldByName('Codigo_Registro').AsInteger;
      FichaEstoque.ProdutoCodigo          := DM.qryitens_venda.FieldByName('Codigo_Produto').AsInteger;
      FichaEstoque.Quantidade             := DM.qryitens_venda.FieldByName('Qtde').AsFloat;
      FichaEstoque.ValorUnitario          := DM.qryitens_venda.FieldByName('Valor_Unitario').AsFloat;
      FichaEstoque.ValorUnitarioTotal     := DM.qryitens_venda.FieldByName('Valor_Unitario').AsFloat * DM.qryitens_venda.FieldByName('Qtde').AsFloat;
      FichaEstoque.PrecoVendaVista        := DM.qryitens_venda.FieldByName('Valor_Unitario').AsFloat;
      FichaEstoque.PrecoVendaPrazo        := DM.qryitens_venda.FieldByName('Valor_Unitario').AsFloat;
      FFicahEstoques.addFichaEstoque(fichaEstoque);
      DM.qryitens_venda.Next;
    end;
  except
    on E : Exception do
      TLog.Error(Self.ClassName+' - PreencherFichaEstoque - '+e.Message);
  end;
end;

procedure TFrmFechamento_Venda_PDV.Lanca_Financeiro;
begin

end;

procedure TFrmFechamento_Venda_PDV.Verifica_Credito_Cliente;
var
  ValorTotal, TotalCompra, Credito: double;
  FCliente: TClienteEntidade;
  FClienteDom: TClienteDominio;
begin
  if (FrmPDV <> nil) then
  begin
    if (FrmPDV.oCli <> nil) and (tipo_pagamento = 'A PRAZO') and (controla_credito_cliente = 0) then
    begin
      TotalCompra:= StrToFloat(EdtValor.Text);
      FClienteDom:= TClienteDominio.Create(dm.ADOConnection1);
      if (FClienteDom.VerificaSeExisteLimiteDeCreditoDisponivel(FrmPDV.oCli, TotalCompra)) then
      begin
        TemCreditoDisponivel:= True;
      end
      else
      begin
        TemCreditoDisponivel:= false;
      end;
    end
    else
    begin
      TemCreditoDisponivel:= True;
    end;
  end;

end;

procedure TFrmFechamento_Venda_PDV.ListBox1Click(Sender: TObject);
var
  tec, indice, te: string;
  i, tamanho: integer;
begin
  te:= copy(ListBox1.Items[ListBox1.ItemIndex],1,2);
  te:= StringReplace(te, '.', '', [rfReplaceAll]);

  if (Length(te) = 1) then
    texto:= copy(ListBox1.Items[ListBox1.ItemIndex],7,50)
  else if (Length(te) = 2) then
    texto:= copy(ListBox1.Items[ListBox1.ItemIndex],8,50);

  FrmFechamento_Venda_PDV.EdtForma_Pagamento.Text:= texto;//FrmFechamento_Venda_PDV.ListBox1.Items[FrmFechamento_Venda_PDV.ListBox1.ItemIndex];
  Pega_Codigo_Forma_Pagamento(texto);
  oCP:= oCPDominio.CarregaDadosCondicao(texto);
  Verifica_Credito_Cliente;

  EdtValor.SetFocus;
  EdtValor.SelectAll;
end;

function TFrmFechamento_Venda_PDV.Consulta_Cheque: boolean;
var Aprovado : Boolean;
    Mensagem :String;
begin
  Result := false;
  ApagaArquivosTEF;
  Verifica_Gerenciador_Padrao_Ativo;
  {if not VerificaGerenciadorPadrao then
  begin

    //mensagem de erro do gerenciador padrão
    Application.CreateForm(TFrmMensagem_Erro_Gerenciador_TEF, FrmMensagem_Erro_Gerenciador_TEF);
    FrmMensagem_Erro_Gerenciador_TEF.ShowModal;
    //shellexecute(0, 'open', (PWideChar('C:\tef_dial\tef_dial.exe')), '', nil,SW_HIDE);
    //Sleep(1000);
    FrmMensagem_Erro_Gerenciador_TEF.Free;

     //Gerenciador_Padrao
  end  }
  //else
  //begin
    pNumeroCupom := coo_cupom;
    pValor := StringReplace(EdtValor.Text, ',', '',[rfReplaceAll]);
    ConsultaCheque;
    AnalizaArquivoRetorno(Aprovado,Mensagem);
    if not Aprovado then
    begin
      //Foco_Aplicacao;
      //chama janela de mensagem modal
      Application.CreateForm(TFrmMensagem_Erro_TEF, FrmMensagem_Erro_TEF);
      FrmMensagem_Erro_TEF.LblMensagem.Caption:= Mensagem;
      FrmMensagem_Erro_TEF.ShowModal;
      FrmMensagem_Erro_TEF.Free;
    end
    else
    begin

      if not(Imprime_Transacao) then
      begin
        Application.CreateForm(TFrmMensagem_Erro_TEF, FrmMensagem_Erro_TEF);
        FrmMensagem_Erro_TEF.LblMensagem.Caption:= Mensagem;
        FrmMensagem_Erro_TEF.ShowModal;
        FrmMensagem_Erro_TEF.Free;
      end;

      //ExibeMensagem(5,Mensagem);
      tef:= true;
      Result := true;
      pValor:= FormatFloat('#0.0,0', StrToFloat(EdtValor.Text));
      pValor := StringReplace(pValor, ThousandSeparator, '',[rfReplaceAll]);
    end;
  //end;
end;

procedure TFrmFechamento_Venda_PDV.Cancela_Registro_Cupom;
begin
  Atualiza_Status_Pedido(FrmPDV.Conexao, StrToInt(LblCodigo.Caption), 'CANCELADO');
  TLog.Debug('Atualizou status do pedido para CANCELADO.');
  //Atualiza_R04(StrToInt(LblCodigo.Caption));
  //Atualiza_R04_Aux(StrToInt(LblCodigo.Caption));

  if (FrmPDV <> nil) then
  begin
    FrmPDV.Limpa_Para_Novo_Registro;
    TLog.Debug('Limpou dados para nova venda no PDV.');
    FrmPDV.LblStatus.Caption:= Caixa_Operacao(0);
  end
  else if (FrmCarrega_Pedido_Caixa <> nil) then
  begin
    TLog.Debug('Atualizou os pedidos na tela de Recebimentos.');
    FrmCarrega_Pedido_Caixa.Chama_Dados;
  end;

  //ECF.Cancela_Cupom;
  //ECF.Pega_Grande_Total;
  //AlteraGT(StrToFloat(UDeclaracao.GrandeTotal), nu_serie);
  Limpa_Local;

  FrmFechamento_Venda_PDV.Close;
end;

procedure TFrmFechamento_Venda_PDV.Nao_Confirma_Cupom;
begin
  NaoConfirmaTransacao;
  ApagaArquivosTEF;
  DeleteFile(ArqTemp);
  Impresso := true;
  dm.qryfechamento_venda.Active:= false;

  if (sem_rede = false) then
  begin
    den_op:= 'NC';
    Coleta_Dados_R06;
    R06.Inserir_Outros(R06);
    //R06.Inserir_Outros_Aux(R06);
  end;
  Deleta_Arquivos_Temp;
  //Deleta_Bandeira_Pendente;
  tef:= false;

  Cancela_Registro_Cupom;
  abort;
end;

function TFrmFechamento_Venda_PDV.RealizaVendaTEF: Boolean;
var Aprovado : Boolean;
    Mensagem :String;
begin
  try
    TLog.Debug('Entrou no método RealizaVendaTEF.');
    Result := false;
    ApagaArquivosTEF;
    pValor := StringReplace(EdtValor.Text, ',', '',[rfReplaceAll]);
    TLog.Debug('Valor da operação: '+pValor);
    //pNumeroCupom := FrmPDV.LblNVenda.Caption;
    //TLog.Debug('Número da venda: '+FrmPDV.LblNVenda.Caption);
    FuncaoVendaTEF;
    AnalizaArquivoRetorno(Aprovado,Mensagem);
    TLog.Debug('Analisou o arquivo retorno: '+Mensagem);
    if not Aprovado then
    begin
      TLog.Error('Não aprovado: '+Mensagem);
      Application.CreateForm(TFrmMensagem_Erro_TEF, FrmMensagem_Erro_TEF);
      FrmMensagem_Erro_TEF.LblMensagem.Caption:= Mensagem;
      FrmMensagem_Erro_TEF.ShowModal;
      FrmMensagem_Erro_TEF.Free;
    end
    else
    begin
      TLog.Debug('Aprovado: '+Mensagem);
      ExibeMensagem(5,Mensagem);
      TLog.Debug('Exibiu mensagem de aprovação: '+Mensagem);
      Result := true;
      tef:= true;
    end;
  except on E:Exception do
  begin
    TLog.Error('Erro em RealizaVendaTEF: '+e.Message);
    BlockInput(false);
    TLog.Error('Desbloqueou teclado/mouse pois deu erro em RealizaVendaTEF.');
  end;

  end;
end;

procedure TFrmFechamento_Venda_PDV.RGDesc_AcrClick(Sender: TObject);
begin
  //EdtDesconto.SetFocus;
end;

procedure TFrmFechamento_Venda_PDV.RGTipoClick(Sender: TObject);
begin
  //EdtDesconto.SetFocus;
end;

procedure TFrmFechamento_Venda_PDV.Verifica_Permissao_TEF;
var
  valor, tot_venda, valor_rec, rest: double;
begin
  valor:= Calcula_Valor(EdtValor.Text); //StrToFloat(EdtValor.Text);
  valor_rec:= Calcula_Valor(EdtValor_Recebido.Text);//StrToFloat(EdtValor_Recebido.Text);
  tot_venda:= Calcula_Valor(EdtTotal_Venda.Text);//StrToFloat(EdtTotal_Venda.Text);
  rest:= tot_venda - valor_rec;

  if (tef = true) then
  begin
    Multiplos_Cartoes;
    EdtValor.SetFocus;
    abort;
  end;

  if tot_venda < (valor + valor_rec) then
  begin
    Mensagem_Troco_TEF;
    pode_fechar:= false;
    EdtValor.SetFocus;
    abort;
  end;

  {if (EdtValor_Recebido.Text = '0,00') and (valor < tot_venda) then
  begin
    Mensagem_Falta_Dados;
    pode_fechar:= false;
    EdtValor.SetFocus;
    abort;
  end;}

  {if (EdtValor_Recebido.Text <> '0,00') and (valor < rest) then
  begin
    Mensagem_Falta_Dados;
    pode_fechar:= false;
    EdtValor.SetFocus;
    abort;
  end;}

  {if (EdtValor_Recebido.Text <> '0,00') and (valor > rest) then
  begin
    Mensagem_Falta_Dados;
    pode_fechar:= false;
    EdtValor.SetFocus;
    abort;
  end;}
end;

procedure TFrmFechamento_Venda_PDV.Verifica_Pode_Fechar;
begin
  if (StrToFloat(EdtValor_Recebido.Text) >= StrToFloat(EdtTotal_Venda.Text)) then
  begin
    pode_fechar:= true;
    EdtTroco.SetFocus;
  end
  else
  begin
    pode_fechar:= false;
    EdtValor.SetFocus;
  end;
end;

end.
