unit UGerar_Documentos;

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
  TFrmGerar_Documentos = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnOK: TToolButton;
    ImgImagens_Comandos: TImageList;
    BBtnSair: TToolButton;
    GroupBox1: TGroupBox;
    CBGerar_Financeiro: TCheckBox;
    CBGerar_Carne: TCheckBox;
    Label7: TLabel;
    EdtCodigo_Condicao_Pagamento: TEdit;
    EdtCondicao_Pagamento: TEdit;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1N_Documento: TIntegerField;
    ADOQuery1Data_Vencimento: TDateTimeField;
    ADOQuery1Data_Pagamento: TDateTimeField;
    ADOQuery1Parcela: TIntegerField;
    ADOQuery1Status: TStringField;
    ADOQuery1Valor: TFloatField;
    ADOQuery1Codigo_Conta: TIntegerField;
    ADOQuery1Codigo_Cheque: TIntegerField;
    ADOQuery1Data_Atualizacao: TDateTimeField;
    ADOQuery1Valor_Pagar: TFloatField;
    ADOQuery1Codigo_Forma_Pagamento_Parcela: TIntegerField;
    ADOQuery1Forma_Pagamento: TStringField;
    ADOQuery1Valor_Restante: TFloatField;
    ADOQuery1Valor_Pago: TFloatField;
    DataSource1: TDataSource;
    Label1: TLabel;
    EdtCodigo_Cliente: TEdit;
    EdtCliente: TEdit;
    LblData_Cadastro: TLabel;
    MEdtData_Lancamento: TMaskEdit;
    Label2: TLabel;
    MEdtData_Vencimento: TMaskEdit;
    CBPromissoria: TCheckBox;
    CBLista_Separacao: TCheckBox;
    Label3: TLabel;
    EdtCodigo_Departamento: TEdit;
    EdtDepartamento: TEdit;
    procedure BBtnSairClick(Sender: TObject);
    procedure EdtCodigo_Condicao_PagamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnOKClick(Sender: TObject);
    procedure EdtCodigo_Condicao_PagamentoKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtCondicao_PagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure EdtCodigo_ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtCodigo_DepartamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ClienteEnter(Sender: TObject);
    procedure EdtCodigo_Condicao_PagamentoEnter(Sender: TObject);
    procedure EdtCodigo_DepartamentoEnter(Sender: TObject);
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
  FrmGerar_Documentos: TFrmGerar_Documentos;

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
  UDM, URel_Promissoria, Util.TLog;

{$R *.dfm}

procedure TFrmGerar_Documentos.BBtnOKClick(Sender: TObject);
var
  i, doc: integer;
  data_vencim: TDate;
  valaux2: double;
begin
  TLog.Info('--- BOTÃO OK DO FORM GERAR DOCUMENTOS ---');
  TLog.Debug('Opção Gerar Financeiro: '+BoolToStr(CBGerar_Financeiro.Checked));
  TLog.Debug('Opção Gerar Carnê: '+BoolToStr(CBGerar_Carne.Checked));
  TLog.Debug('Opção Gerar Promissória: '+BoolToStr(CBPromissoria.Checked));
  TLog.Debug('Opção Lista de separação: '+BoolToStr(CBPromissoria.Checked));

  if (FrmNFE = nil) then
  begin
    if (CBGerar_Carne.Checked) and (CBGerar_Financeiro.Checked = false) and (CBGerar_Financeiro.Enabled) then
    begin
      TMensagens.MensagemErro('Para gerar carnê, é necessário marcar a opção Gerar Financeiro.');
      CBGerar_Financeiro.SetFocus;
      abort;
    end;
  end;

  if (EdtCodigo_Cliente.Text = '') then
  begin
    TMensagens.MensagemErro('Por favor, selecione um cliente.');
    EdtCodigo_Cliente.SetFocus;
    abort;
  end;

  if (EdtCodigo_Condicao_Pagamento.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Condicao_Pagamento.SetFocus;
    abort;
  end;

  if (MEdtData_Lancamento.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    MEdtData_Lancamento.SetFocus;
    abort;
  end;

  if (MEdtData_Vencimento.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    MEdtData_Vencimento.SetFocus;
    abort;
  end;

  if (CBGerar_Financeiro.Checked) then
  begin
    TLog.Info('Vai gerar financeiro com o financeiro marcado.');
    oPLFDominio:= TParcelasLancamentoFinanceiroDominio.Create(dm.ADOConnection1);
    oLFDominio:= TLancamentoFinanceiroDominio.Create;
    oCPDominio:= TCondicaoPagamentoDominio.Create(dm.ADOConnection1);
    oCP:= oCPDominio.CarregaDadosCondicao(StrToInt(EdtCodigo_Condicao_Pagamento.Text));
    TLog.Debug('Preencheu os objetos oCPDominio, oPLFDOminio, oCP e oLFDOminio.');
    Self.oLF.Codigo_Forma_Pagamento:= StrToInt(EdtCodigo_Condicao_Pagamento.Text);

    if (EdtCodigo_Cliente.Text <> '') then    
      oLF.Codigo_Cli_For:= StrToInt(EdtCodigo_Cliente.Text)
    else
      oLF.Codigo_Cli_For:= 0;
        TLog.Debug('Verificou o campo EdtCodigo_Cliente.');
    oLF.Data_Lancamento:= StrToDateTime(MEdtData_Lancamento.Text);
    TLog.Debug('Preencheu oLF.Data_Lancamento.');
    oLF.Data_Vencimento:= StrToDateTime(MEdtData_Vencimento.Text);
    TLog.Debug('Preencheu oLF.Data_Vencimento.');
    data_vencim:= StrToDate(MEdtData_Vencimento.Text);
    TLog.Debug('Preencheu data_vencim.');
    oLF.Codigo_Departamento:= StrToInt(EdtCodigo_Departamento.Text);
    TLog.Debug('Preencheu oLF.Codigo_Departamento.');

    doc:= oLF.NDocumento;
    TLog.Debug('doc recebeu oLF.NDocumento com valor de .' + IntToStr(doc));
    doc:= StrToInt(IntToStr(doc) + '1');
    TLog.Debug('doc foi incrementado valor: ' + IntToStr(doc));
    for i := 1 to oCP.Parcela do
    begin
        TLog.Info('doc recebeu oLF.NDocumento com valor de .' + IntToStr(doc));
      oPLF := TParcelasLancamentoFinanceiroEntidade.Create;
      oPLF.Codigo:= oLF.Codigo;
      oPLF.N_Documento:= doc;
      oPLF.Data_Vencimento:= data_vencim;

          TLog.Debug('oPLF recebeu valores');

      if (oCP.TipoPagamento = 'A PRAZO') then
      begin
        oPLF.Data_Pagamento:= 0;
      end
      else
      begin
        oPLF.Data_Pagamento:= date;
      end;

      if (tipo_dias = 0) then
      begin
        data_vencim:= IncDay(data_vencim, oCP.Prazo);
      end
      else if (tipo_dias = 1) then
      begin
        data_vencim:= data_vencim + oCP.Prazo;
      end
      else if (tipo_dias = 2) then
      begin
        data_vencim:= IncMonth(data_vencim, 1);
      end;
                TLog.Debug('incrementar doc novamente com inc(doc)');
      inc(doc);
      oPLF.Parcela:= i;
                      TLog.Debug('oPLF.Parcela recebeu valor i: '+ IntToStr(i));
      if (oCP.TipoPagamento = 'A PRAZO') then
      begin
      TLog.Debug('Vai jogar valor em oPLF.Status StatusEnumParcela.PENDENTE');
        oPLF.Status:= StatusEnumParcela.PENDENTE;
      end
      else
      begin
        TLog.Debug('Vai jogar valor em oPLF.Status  StatusEnumParcela.PAGO');
        oPLF.Status:= StatusEnumParcela.PAGO;
      end;
      TLog.Debug('Saiu da condicao a prazo');


      valaux2:= oLF.Valor_Cobrado;
      valaux2:= (valaux2 / oCP.Parcela);
      oPLF.Valor:= valaux2;
      oPLF.Valor_Pagar:= valaux2;

      oPLF.Codigo_Forma_Pagamento_Parcela:= oCP.Codigo;

      TLog.Debug('Setou valores para, valaux2 e oPLF.valor e oPLF.valor_pagar');

      if (oCP.TipoPagamento = 'A PRAZO') then
        oPLF.Valor_Restante:= valaux2
      else
        oPLF.Valor_Restante:= 0;

      oPLF.Desconto:= 0;
      oPLF.Acrescimo:= 0;

      if (oCP.TipoPagamento = 'A PRAZO') then
        oPLF.Valor_Pago:= 0
      else
        oPLF.Valor_Pago:= valaux2;

        TLog.Debug('Entrar no método gravarLancamentoFinanceiro(oPLF).');
      oPLFDominio.gravarLancamentoFinanceiro(oPLF);
      TLog.Debug('Fim do método gravarLancamentoFinanceiro(oPLF).');
    end;
TLog.Info('Entrar no método gravar lancamento financeiro .');
    oLFDominio.gravarLancamentoFinanceiro(oLF);
    TLog.Info('Saiu do Método  gravarLancamentoFinanceiro .');
TLog.Info('Vai atribuir false para CBGerar_Financeiro .');
    CBGerar_Financeiro.Checked:= false;
    CBGerar_Financeiro.Enabled:= false;
  
    ADOQuery1.Close;
    ADOQuery1.SQL.Add(oPLFDominio.retornaParcelasLancamentos(oLF));
    ADOQuery1.Open;
        TLog.Info('Chegou ao fim da condição, marcada pelo financeiro.');
  end;

  if (CBGerar_Carne.Checked) then
  begin
    FrmRel_Carne:= TFrmRel_Carne.Create(self, oLF);
    FrmRel_Carne.Release;
    FrmRel_Carne:= Nil;  
  end;

  if (CBPromissoria.Checked) then
  begin
    FrmRel_Promissoria:= TFrmRel_Promissoria.Create(oLF.Codigo);
    FrmRel_Promissoria.Release;
    FrmRel_Promissoria:= Nil;
//    if (oCli = nil) and (EdtCodigo_Cliente.Text <> '') then
//    begin
//      oCliDominio:= TClienteDominio.Create;
//      oCli:= TCliente.Create;
//      oCli:= oCliDominio.buscarClientePorCodigo(StrToInt(EdtCodigo_Cliente.Text));
//    end;
//
//    oP:= TPromissoriaEntidade.Create;
//    oPDominio:= TPromissoriaDominio.Create;
//
//    ADOQuery1.First;
//    while not ADOQuery1.Eof do
//    begin
//      oP.Data_Atual:= StrToDateTime(MEdtData_Lancamento.Text);
//      oP.DataVencimento:= ADOQuery1Data_Vencimento.AsDateTime;
//      oP.Valor:= ADOQuery1Valor_Pagar.AsFloat;
//
//      //if (oCli <> nil) then
//      //begin
//        oP.NomeCliente:= razao_social;
//        oP.CPFCNPJ:= cnpj;
//        oP.Endereco:= tipo_endereco + ' ' + endereco + ', nº '+UDeclaracao.numero+', Setor '+ setor;
//      //end;
//
//      oPDominio.GeraPromissoria(oP);
//      ADOQuery1.Next;
//    end;
  end;

  if (CBLista_Separacao.Checked) then
  begin
    FrmRel_Lista_Separacao:= TFrmRel_Lista_Separacao.Create(CodigoPedido, '');
    FrmRel_Lista_Separacao.Release;
    FrmRel_Lista_Separacao:= nil;
  end;

  TLog.Info('--- FIM BOTÃO OK DO FORM GERAR DOCUMENTOS ---');
end;

procedure TFrmGerar_Documentos.BBtnSairClick(Sender: TObject);
begin
  close;
end;

constructor TFrmGerar_Documentos.Create(Sender: TObject; var oLFPara: TLancamentoFinanceiroEntidade;
  var oPLFPara: TParcelasLancamentoFinanceiroEntidade; var oCPPara: TCondicaoPagamentoEntidade;
  var oCliPara: TClienteEntidade; CodigoPedido: integer);
begin
  Self.oLF:= oLFPara;
  Self.oPLF:= oPLFPara;
  Self.oCP:= oCPPara;
  Self.oCli:= oCliPara;
  Self.CodigoPedido:= CodigoPedido;
  //Self.CupomOuNFe:= CupomOuNFe;

  TLog.Info('--- CONSTRUTOR DO FORMULÁRIO GERAR_DOCUMENTOS ---');
  if (Self.oCli <> nil) then
  begin
    TLog.Debug('Código do cliente no objeto do formulário Gerar_Documentos: '+IntToStr(Self.oCli.Codigo));
    TLog.Debug('Razão social no objeto do formulário Gerar_Documentos: '+Self.oCli.RazaoSocial);
    TLog.Debug('Nome fantasia no objeto do formulário Gerar_Documentos: '+Self.oCli.NomeFantasia);
  end
  else
  begin
    TLog.Debug('Venda Sem Cliente.');
  end;
  TLog.Debug('Código da condição de pagamento no objeto do formulário Gerar_Documentos: '+IntToStr(Self.oCP.Codigo));
  TLog.Debug('Condição de pagamento no objeto do formulário Gerar_Documentos: '+Self.oCP.Descricao);
  TLog.Debug('Código Lançamento no objeto do formulário Gerar_Documentos: '+IntToStr(Self.oLF.Codigo));
  //TLog.Debug('Código Lançamento Parcela no objeto do formulário Gerar_Documentos: '+IntToStr(Self.oPLF.Codigo));
  TLog.Info('--- FIM CONSTRUTOR DO FORMULÁRIO GERAR_DOCUMENTO ---');
  inherited Create(nil);
end;

procedure TFrmGerar_Documentos.FormCreate(Sender: TObject);
var
  oDepDAO: TDepartamentoDAO;
  CodigoLancamento: integer;
  i: integer;
  PLF: TParcelasLancamentoFinanceiroEntidade;
begin
  CBGerar_Financeiro.Enabled:= true;
  CBGerar_Financeiro.Checked:= false;
  CBGerar_Carne.Enabled:= true;
  CBGerar_Carne.Checked:= false;
  i:= 0;

  if (FrmNFE <> nil) then
  begin
    oPLFDominio:= TParcelasLancamentoFinanceiroDominio.Create(dm.ADOConnection1);
    oLFDominio:= TLancamentoFinanceiroDominio.Create;
    oCPDominio:= TCondicaoPagamentoDominio.Create(dm.ADOConnection1);
    PLF:= TParcelasLancamentoFinanceiroEntidade.Create;

    CodigoLancamento:= TGeradorDeCodigo.GeraCodigoSequenciaControlaCodigo('Controla_Codigo_Lancamento_Financeiro', dm.ADOConnection1);
    oLF.Codigo:= CodigoLancamento;
    for i := 0 to oLF.ParcelasLancamentoFinanceiro.Count-1 do
    begin
      PLF:= oLF.ParcelasLancamentoFinanceiro.Items[i];
      PLF.Codigo:= CodigoLancamento;
      oPLFDominio.gravarLancamentoFinanceiro(PLF);
    end;

    oLFDominio.gravarLancamentoFinanceiro(oLF);

    MEdtData_Lancamento.Text:= DateToStr(date);
    MEdtData_Vencimento.Text:= FrmNFE.MEdtData_Primeiro_Vencimento.Text;

    CBGerar_Financeiro.Checked:= false;
    CBGerar_Financeiro.Enabled:= false;

    ADOQuery1.Close;
    ADOQuery1.SQL.Add(oPLFDominio.retornaParcelasLancamentos(oLF));
    ADOQuery1.Open;

    {oCP:= oCPDominio.CarregaDadosCondicao(StrToInt(EdtCodigo_Condicao_Pagamento.Text));
    Self.oLF.Codigo_Forma_Pagamento:= StrToInt(EdtCodigo_Condicao_Pagamento.Text);

    if (EdtCodigo_Cliente.Text <> '') then
      oLF.Codigo_Cli_For:= StrToInt(EdtCodigo_Cliente.Text)
    else
      oLF.Codigo_Cli_For:= 0;

    oLF.Data_Lancamento:= StrToDateTime(MEdtData_Lancamento.Text);
    oLF.Data_Vencimento:= StrToDateTime(MEdtData_Vencimento.Text);
    data_vencim:= StrToDate(MEdtData_Vencimento.Text);
    oLF.Codigo_Departamento:= StrToInt(EdtCodigo_Departamento.Text);

    doc:= oLF.NDocumento;
    doc:= StrToInt(IntToStr(doc) + '1');
    for i := 1 to oCP.Parcela do
    begin
      oPLF := TParcelasLancamentoFinanceiroEntidade.Create;
      oPLF.Codigo:= oLF.Codigo;
      oPLF.N_Documento:= doc;
      oPLF.Data_Vencimento:= data_vencim;

      if (oCP.TipoPagamento = 'A PRAZO') then
      begin
        oPLF.Data_Pagamento:= 0;
      end
      else
      begin
        oPLF.Data_Pagamento:= date;
      end;

      if (tipo_dias = 0) then
      begin
        data_vencim:= IncDay(data_vencim, oCP.Prazo);
      end
      else if (tipo_dias = 1) then
      begin
        data_vencim:= data_vencim + oCP.Prazo;
      end
      else if (tipo_dias = 2) then
      begin
        data_vencim:= IncMonth(data_vencim, 1);
      end;

      inc(doc);
      oPLF.Parcela:= i;

      if (oCP.TipoPagamento = 'A PRAZO') then
      begin
        oPLF.Status:= StatusEnumParcela.PENDENTE;
      end
      else
      begin
        oPLF.Status:= StatusEnumParcela.PAGO;
      end;

      valaux2:= oLF.Valor_Cobrado;
      valaux2:= (valaux2 / oCP.Parcela);
      oPLF.Valor:= valaux2;
      oPLF.Valor_Pagar:= valaux2;

      oPLF.Codigo_Forma_Pagamento_Parcela:= oCP.Codigo;

      if (oCP.TipoPagamento = 'A PRAZO') then
        oPLF.Valor_Restante:= valaux2
      else
        oPLF.Valor_Restante:= 0;

      oPLF.Desconto:= 0;
      oPLF.Acrescimo:= 0;

      if (oCP.TipoPagamento = 'A PRAZO') then
        oPLF.Valor_Pago:= 0
      else
        oPLF.Valor_Pago:= valaux2;

      oPLFDominio.gravarLancamentoFinanceiro(oPLF)
    end;

    oLFDominio.gravarLancamentoFinanceiro(oLF);

    CBGerar_Financeiro.Checked:= false;
    CBGerar_Financeiro.Enabled:= false;

    ADOQuery1.Close;
    ADOQuery1.SQL.Add(oPLFDominio.retornaParcelasLancamentos(oLF));
    ADOQuery1.Open;}
    //MEdtData_Vencimento.Text:= FrmNFE.MEdtData_Primeiro_Vencimento.Text;
  end
  else
  begin
    MEdtData_Lancamento.Text:= DateToStr(date);
    MEdtData_Vencimento.Text:= DateToStr(IncDay(date, 30));
    CBGerar_Financeiro.Enabled:= true;
    CBGerar_Financeiro.Checked:= false;
  end;

  oDepDAO:= TDepartamentoDAO.Create(dm.ADOConnection1);

  if (oCP <> nil) then
  begin
    TLog.Info('Objeto oCP é <> de Nil.');
    EdtCodigo_Condicao_Pagamento.Text:= IntToStr(oCP.Codigo);
    EdtCondicao_Pagamento.Text:= oCP.Descricao;
    TLog.Debug('Código da condição de pagamento do objeto oCP: '+IntToStr(oCP.Codigo));
    TLog.Debug('Condição de pagamento do objeto oCP: '+oCP.Descricao);
  end;

  if (oCli <> nil) then
  begin
    TLog.Info('Objeto oCli é <> de Nil.');
    EdtCodigo_Cliente.Text:= IntToStr(oCli.Codigo);
    EdtCliente.Text:= oCli.NomeFantasia;
    EdtCliente.Text:= oCli.RazaoSocial;
    TLog.Debug('Código do cliente do objeto oCli: '+IntToStr(oCli.Codigo));
    TLog.Debug('Nome fantasia do objeto oCli: '+oCli.NomeFantasia);
    TLog.Debug('Razão social do objeto oCli: '+oCli.RazaoSocial);
  end;

  EdtCodigo_Departamento.Text:= IntToStr(codigo_departamento);
  EdtDepartamento.Text:= oDepDAO.retornaDepartamento(codigo_departamento);
  TLog.Debug('Código do departamento: '+IntToStr(codigo_departamento));
  TLog.Debug('Departamento: '+EdtDepartamento.Text);
  TLog.Debug('Variável gerar_financeiro: '+IntToStr(gerar_financeiro));

  CBGerar_Carne.Enabled:= true;
  CBGerar_Carne.Checked:= false;
end;

procedure TFrmGerar_Documentos.EdtCodigo_ClienteEnter(Sender: TObject);
begin
  TLog.Info('O usuário clicou no Edit Codigo_Cliente');
  TLog.Debug('Código do cliente: '+EdtCodigo_Cliente.Text);
  TLog.Debug('Cliente: '+EdtCliente.Text);
end;

procedure TFrmGerar_Documentos.EdtCodigo_ClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    TLog.Info('O usuário pressionou F3 para escolher outro Cliente.');
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
    TLog.Debug('Código do cliente: '+EdtCodigo_Cliente.Text);
    TLog.Debug('Cliente: '+EdtCliente.Text);
    TLog.Info('A janela para escolher outro cliente fechou.');
  end;
end;

procedure TFrmGerar_Documentos.EdtCodigo_Condicao_PagamentoEnter(
  Sender: TObject);
begin
  TLog.Info('O usuário clicou no Edit Codigo_Condicao_Pagamento');
  TLog.Debug('Código da condição de pagamento: '+EdtCodigo_Condicao_Pagamento.Text);
  TLog.Debug('Condição de pagamento: '+EdtCondicao_Pagamento.Text);
end;

procedure TFrmGerar_Documentos.EdtCodigo_Condicao_PagamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    TLog.Info('O usuário pressionou F3 para escolher outra condição de pagamento.');
    Application.CreateForm(tFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
    FrmChama_Condicao_Pagamento.ShowModal;
    FrmChama_Condicao_Pagamento.Free;
    TLog.Debug('Código da condição de pagamento: '+EdtCodigo_Condicao_Pagamento.Text);
    TLog.Debug('Condição de pagamento: '+EdtCondicao_Pagamento.Text);
    TLog.Info('A janela para escolher outra condição de pagamento fechou.');
  end;
end;

procedure TFrmGerar_Documentos.EdtCodigo_Condicao_PagamentoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Utili.Somente_Apaga(key);
end;

procedure TFrmGerar_Documentos.EdtCodigo_DepartamentoEnter(Sender: TObject);
begin
  TLog.Info('O usuário clicou no Edit Codigo_Departamento');
  TLog.Debug('Código do departamento: '+EdtCodigo_Departamento.Text);
  TLog.Debug('Departamento: '+EdtDepartamento.Text);
end;

procedure TFrmGerar_Documentos.EdtCodigo_DepartamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    TLog.Info('O usuário pressionou F3 para escolher outro departamento.');
    Application.CreateForm(TFrmChama_Departamento, FrmChama_Departamento);
    FrmChama_Departamento.ShowModal;
    FrmChama_Departamento.Free;
    TLog.Debug('Código do departamento: '+EdtCodigo_Departamento.Text);
    TLog.Debug('Departamento: '+EdtDepartamento.Text);
    TLog.Info('A janela para escolher outro departamento fechou.');
  end;
end;

procedure TFrmGerar_Documentos.EdtCondicao_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Utili.Somente_Apaga(key);
end;

procedure TFrmGerar_Documentos.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmGerar_Documentos.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

end.


