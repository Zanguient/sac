unit UBaixar_Titulo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, ComCtrls, ToolWin, ImgList, UGeral, URegistro,
  DB, ADODB, Modelo.Entidade.TContaCorrente, Modelo.Entidade.TOperacaoBancaria, Modelo.Entidade.TLancamentoBancarioEntidade,
  Modelo.Entidade.TLancamentoCaixaEntidade;

type
  TFrmBaixar_Titulo = class(TForm)
    LblValor: TLabel;
    LblN_Nota_Fiscal: TLabel;
    LblData_Vencimento: TLabel;
    LblParcela: TLabel;
    LblData_Pagamento: TLabel;
    Label4: TLabel;
    EdtValor_Parcela: TEdit;
    EdtN_Documento: TEdit;
    MEdtData_Vencimento: TMaskEdit;
    EdtParcela: TEdit;
    MEdtData_Pagamento: TMaskEdit;
    EdtValor_Pagar: TEdit;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    EdtOperacao_Bancaria: TEdit;
    EdtTipo_Operacao: TEdit;
    EdtConta: TEdit;
    RGStatus: TRadioGroup;
    EdtCheque: TEdit;
    Label8: TLabel;
    EdtCodigo_Conta: TEdit;
    Label10: TLabel;
    EdtCodigo_Cheque: TEdit;
    Label11: TLabel;
    EdtCodigo_Operacao: TEdit;
    SPAtualiza_Status_Conta: TADOStoredProc;
    SPAtualiza_Status_Conta_Tudo: TADOStoredProc;
    SPAtualiza_Saldo_Bancario: TADOStoredProc;
    CBBanco: TCheckBox;
    Label2: TLabel;
    EdtCondicao_Pagamento: TEdit;
    EdtCodigo_Condicao_Pagamento: TEdit;
    EdtDesconto: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    EdtAcrescimo: TEdit;
    Label5: TLabel;
    EdtValor_Restante: TEdit;
    EdtValor_Recebido: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    EdtValor_Pago: TEdit;
    Label9: TLabel;
    EdtHistorico: TEdit;
    procedure EdtCodigo_CaixaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ChequeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_OperacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdtData_PagamentoEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_ParcelaExit(Sender: TObject);
    procedure EdtValor_PagarEnter(Sender: TObject);
    procedure BBtnSalvarClick(Sender: TObject);
    procedure MmoObservacoesKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtValor_PagoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCheque_a_VistaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCheque_a_PrazoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCartaoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtJurosKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_PagarKeyPress(Sender: TObject; var Key: Char);
    procedure CBBancoClick(Sender: TObject);
    procedure EdtCodigo_ContaDblClick(Sender: TObject);
    procedure EdtCodigo_ChequeDblClick(Sender: TObject);
    procedure EdtCodigo_OperacaoDblClick(Sender: TObject);
    procedure EdtCodigo_ContaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtContaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ChequeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtChequeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_OperacaoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtOperacao_BancariaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTipo_OperacaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure EdtCodigo_Condicao_PagamentoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtCodigo_Condicao_PagamentoDblClick(Sender: TObject);
    procedure EdtCodigo_Condicao_PagamentoKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtCondicao_PagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_PagoEnter(Sender: TObject);
    procedure EdtDescontoExit(Sender: TObject);
    procedure EdtAcrescimoExit(Sender: TObject);
    procedure EdtValor_RestanteEnter(Sender: TObject);
    procedure EdtValor_PagarExit(Sender: TObject);
    procedure EdtValor_RestanteExit(Sender: TObject);
    procedure EdtValor_RecebidoExit(Sender: TObject);
    procedure EdtValor_PagoExit(Sender: TObject);
  private
    Util: UGeral.TUtil;
    Movimento_Caixa: URegistro.TMovimento_Caixa;
    Lancamento_Banco: URegistro.TLancamento_Banco;
    Fechamento: URegistro.TFechamento_Venda;
    CodigoLancamentoBancario, CodigoLancamentoCaixa: integer;

    procedure Atualiza_Status_Conta;
    procedure Verifica_Banco;
    procedure Bloqueia_Cliente;
    procedure Atualiza_Credito_Cliente;
    procedure Grava_Historico;
    procedure PreencheObjetoCaixa;
    { Private declarations }
  public
    ativo: boolean;
    valor_ja_recebido: double;

    ContaCorrente: TContaCorrenteEntidade;
    OperacaoBancaria: TOperacaoBancariaEntidade;
    LancamentoBancario: TLancamentoBancarioentidade;
    LancamentoCaixa: TLancamentoCaixaEntidade;
  protected
    function Confira: boolean;
    { Public declarations }
  end;

var
  FrmBaixar_Titulo: TFrmBaixar_Titulo;

implementation

uses UChama_Caixa, UChama_Conta_Corrente, UChama_Cheque,
  UChama_Operacao_Bancaria, UChama_Lancamentos_Financeiros, UDM, UDeclaracao,
  UChama_Usuario, UChama_Condicao_Pagamento, Modelo.Entidade.Cliente.TCliente,
  Modelo.Dominio.Cliente.TClienteDominio,
  Modelo.Dominio.TLancamentoBancarioDominio,
  Modelo.Dominio.TContaCorrenteDominio, Modelo.Enum.TEnum,
  Util.GeradorDeCodigo, Modelo.Dominio.TLancamentoCaixaDominio;

{$R *.dfm}

procedure TFrmBaixar_Titulo.Atualiza_Status_Conta;
var
  status: AnsiString;
begin
  if (EdtValor_Restante.Text = '0,00') or (EdtValor_Restante.Text = '0') then
    status:= 'PAGO'
  else
    status:= 'PENDENTE';

  //if (FrmChama_Lancamentos_Financeiros.CBBaixa.Checked = false) then
  //begin
    Atualiza_Conta(FrmChama_Lancamentos_Financeiros.qrychama_lancamentoCodigo.AsInteger,
                   StrtoInt(EdtParcela.Text),
                   MEdtData_Pagamento.Text,
                   status,
                   EdtCodigo_Conta.Text,
                   EdtCodigo_Cheque.Text,
                   StrToFloat(EdtValor_Pagar.Text),
                   StrToFloat(EdtDesconto.Text),
                   StrToFloat(EdtAcrescimo.Text),
                   StrToFloat(EdtValor_Restante.Text),
                   StrToFloat(EdtValor_Pago.Text),
                   StrToInt(EdtCodigo_Condicao_Pagamento.Text));
  {end
  else
  begin
    FrmChama_Lancamentos_Financeiros.qrychama_lancamento.First;
    while not FrmChama_Lancamentos_Financeiros.qrychama_lancamento.Eof do
    begin
      if (FrmChama_Lancamentos_Financeiros.cxGrid1DBTableView1.Controller.) then
      begin
        Atualiza_Conta(FrmChama_Lancamentos_Financeiros.qrychama_lancamentoCodigo.AsInteger,
                       FrmChama_Lancamentos_Financeiros.qrychama_lancamentoParcela.AsInteger,
                       MEdtData_Pagamento.Text,
                       status,
                       EdtCodigo_Conta.Text,
                       EdtCodigo_Cheque.Text,
                       FrmChama_Lancamentos_Financeiros.qrychama_lancamentoValor.AsFloat,
                       0,
                       0,
                       0,
                       0,
                       StrToInt(EdtCodigo_Condicao_Pagamento.Text));

        FrmChama_Lancamentos_Financeiros.qrychama_lancamento.Next;
      end
      else
        FrmChama_Lancamentos_Financeiros.qrychama_lancamento.Next;
    end;
  end;}
end;

procedure TFrmBaixar_Titulo.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmBaixar_Titulo.PreencheObjetoCaixa;
begin
end;

procedure TFrmBaixar_Titulo.BBtnSalvarClick(Sender: TObject);
var
  tipo_doc, tipo, tipo_pag, TipoOperacao: AnsiString;
  //LancamentoBancarioDominio: TLancamentoBancarioDominio;
  ContaCorrenteDominio: TContaCorrenteDominio;
  LancamentoBancarioDominio: TLancamentoBancarioDominio;
  LancamentoCaixaDominio: TLancamentoCaixaDominio;
begin
  if (Confira = true) then
  begin
    CodigoLancamentoBancario:= 0;
    CodigoLancamentoCaixa:= 0;

    if (CBBanco.Checked = false) then
    begin
      LancamentoCaixaDominio:= TLancamentoCaixaDominio.Create(dm.ADOConnection1);
      CodigoLancamentoCaixa:= TGeradorDeCodigo.GeraCodigoIndetity('Fechamento_Venda', dm.ADOConnection1);

      LancamentoCaixa:= TLancamentoCaixaEntidade.Create;
      if (FrmChama_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
      begin
        tipo:= '-';
        TipoOperacao:= 'DÉBITO';
        tipo_doc:= 'PAGAS';

        LancamentoCaixa.TipoDocumento:= 'PAGAS';
        LancamentoCaixa.Tipo:= '-';
        TipoOperacao:= 'DÉBITO'
      end
      else
      begin
        tipo:= '+';
        TipoOperacao:= 'CRÉDITO';
        tipo_doc:= 'RECEBIDAS';

        LancamentoCaixa.TipoDocumento:= 'RECEBIDAS';
        LancamentoCaixa.Tipo:= '+';
        TipoOperacao:= 'CRÉDITO';
      end;

      LancamentoCaixa.Codigo:= 0;
      LancamentoCaixa.CodigoEmpresa:= UDeclaracao.Codigo_Empresa;
      LancamentoCaixa.CodigoCaixa:= codigo_usu;
      LancamentoCaixa.CodigoUsuario:= codigo_usu;
      LancamentoCaixa.FormaPagamento:= EdtCondicao_Pagamento.Text;

      LancamentoCaixa.Valor:= StrToFloat(EdtValor_Recebido.Text);
      LancamentoCaixa.Troco:= 0;
      LancamentoCaixa.Data:= date;

      LancamentoCaixa.Status:= 'PAGO';
      LancamentoCaixa.Acerto:= 0;
      LancamentoCaixa.Movimenta:= 0;
      LancamentoCaixa.NDocumento:= StrToInt(EdtN_Documento.Text);
      LancamentoCaixa.Parcela:= StrToInt(EdtParcela.Text);
      LancamentoCaixa.Descricao:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoHistorico.AsString;
      LancamentoCaixa.CodigoConta:= 0;
      LancamentoCaixa.CodigoOperacao:= 0;
      LancamentoCaixa.Transferencia:= 1;
      LancamentoCaixa.CodigoLancamentoBanco:= 0;
      LancamentoCaixa.SaldoAnterior:= LancamentoCaixaDominio.RetornaSaldoAtual(codigo_usu);
      LancamentoCaixa.SaldoAtual:= LancamentoCaixaDominio.RetornaNovoSaldo(codigo_usu, StrToFloat(EdtValor_Recebido.Text), TipoOperacao, 0);

      LancamentoCaixaDominio.Inserir(LancamentoCaixa);
      LancamentoCaixaDominio.AtualizaSaldoCaixa(codigo_usu, StrToFloat(EdtValor_Recebido.Text), TipoOperacao, 0);
    end
    else
    begin
      LancamentoBancario:= TLancamentoBancarioEntidade.Create;
      LancamentoBancarioDominio:= TLancamentoBancarioDominio.Create(dm.ADOConnection1);
      ContaCorrenteDominio:= TContaCorrenteDominio.Create(dm.ADOConnection1);

      CodigoLancamentoBancario:= TGeradorDeCodigo.GeraCodigoIndetity('Lancamento_Banco', dm.ADOConnection1);

      LancamentoBancario.Codigo_Empresa:= UDeclaracao.Codigo_Empresa;
      LancamentoBancario.N_Documento:= StrToInt(EdtN_Documento.Text);
      LancamentoBancario.Data_Lancamento:= StrToDateTime(MEdtData_Pagamento.Text);
      LancamentoBancario.Codigo_Conta:= StrToInt(EdtCodigo_Conta.Text);
      LancamentoBancario.Codigo_Operacao:= StrToInt(EdtCodigo_Operacao.Text);
      LancamentoBancario.Codigo_Plano:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoCodigo_Plano.AsInteger;

      LancamentoBancario.Descricao:= EdtHistorico.Text;
      LancamentoBancario.Valor:= StrToFloat(EdtValor_Recebido.Text);

      if (RGStatus.ItemIndex = 0) then
        LancamentoBancario.Status:= 'BLOQUEADO'
      else
        LancamentoBancario.Status:= 'LIBERADO';

      LancamentoBancario.SaldoAnterior:= ContaCorrente.Saldo_Atual;
      LancamentoBancario.SaldoAtual:= ContaCorrenteDominio.RetornaNovoSaldo(StrToInt(EdtCodigo_Conta.Text), StrToFloat(EdtValor_Recebido.Text), EdtTipo_Operacao.Text, 0, RGStatus.ItemIndex);

      if (EdtCodigo_Cheque.Text = '') then
        LancamentoBancario.CodigoCheque:= 0
      else
        LancamentoBancario.CodigoCheque:= StrToInt(EdtCodigo_Cheque.Text);

      LancamentoBancario.Transferencia:= 1;
      LancamentoBancarioDominio.Inserir(LancamentoBancario);

      ContaCorrenteDominio.AtualizaSaldoBancario(ContaCorrente, LancamentoBancario, OperacaoBancaria, 0, RGStatus.ItemIndex);

      if (EdtCodigo_Cheque.Text <> '') then
      begin
        if (RGStatus.ItemIndex = 1) then
        begin
          Atualiza_Cheque( MEdtData_Pagamento.Text, 'BAIXADO', StrToInt(EdtCodigo_Cheque.Text));
        end
        else
        begin
          Atualiza_Cheque( MEdtData_Pagamento.Text, 'PENDENTE', StrToInt(EdtCodigo_Cheque.Text));
        end;
      end;

    end;

    Atualiza_Status_Conta;
    Grava_Historico;

    if (FrmChama_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
    begin
      if (desbloq_cliente = 'SIM') then
      begin
        Bloqueia_Cliente;
      end;

      if (controla_credito_cliente = 0) then
      begin
        Atualiza_Credito_Cliente;
      end;

      //Cria_Arquivo_Atualiza_Dados('ACli');
    end;

      UDeclaracao.Insere_Historico(usuario, 'BAIXOU TÍTULO A PAGAR/RECEBER NÚMERO ' + EdtN_Documento.Text + '.', TimeToStr(time), alteracao, date);
      Processo_Concluido;
      Close;
      FrmChama_Lancamentos_Financeiros.qrychama_lancamento.close;
      FrmChama_Lancamentos_Financeiros.qrychama_lancamento.open;
      FrmChama_Lancamentos_Financeiros.CBBaixa.Checked:= false;
    end;

end;

procedure TFrmBaixar_Titulo.Atualiza_Credito_Cliente;
var
  aux: Boolean;
  ValorRecebido, Credito: double;
  FCliente: TClienteEntidade;
  FClienteDom: TClienteDominio;
begin
  ValorRecebido:= StrToFloat(EdtValor_Recebido.Text);
  FCliente:= TClienteEntidade.Create;
  FClienteDom:= TClienteDominio.Create(dm.ADOConnection1);
  FCliente.Codigo:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoCod.AsInteger;
  FCliente.NomeFantasia:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoNome.AsString;
  Credito:= FClienteDom.BuscaCreditoCliente(FCliente);
  FClienteDom.AtualizaCreditoCliente(FCliente, ValorRecebido + Credito);
end;

procedure TFrmBaixar_Titulo.Bloqueia_Cliente;
var
  qAux2: TADOQuery;
begin
  qAux2:= TADOQuery.Create(nil);
  try
    with qAux2, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select LF.Codigo_Cli_For from Lancamento_Financeiro LF');

      add('left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)');
      add('where LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo and PL.Status = :Status and PL.Data_Vencimento < :data');
      Parameters.ParamByName('Codigo').Value:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoCod.AsInteger;
      Parameters.ParamByName('Tipo').Value:= 'RECEBER';
      Parameters.ParamByName('Status').Value:= 'PENDENTE';
      Parameters.ParamByName('data').Value:= date;
      open;
    end;

    if (qAux2.IsEmpty = false) then
      BloqDesbloqCliente('SIM', FrmChama_Lancamentos_Financeiros.qrychama_lancamentoCod.AsInteger)
    else
      BloqDesbloqCliente('NÃO', FrmChama_Lancamentos_Financeiros.qrychama_lancamentoCod.AsInteger);
  finally
    FreeAndNil(qAux2);
  end;
end;

procedure TFrmBaixar_Titulo.CBBancoClick(Sender: TObject);
begin
  if (CBBanco.Checked) then
    begin
      FrmBaixar_Titulo.Height:= 309;
      TlbFerramentas.Height:= 281;
      //Label3.Visible:= false;
      //EdtCaixa.Visible:= false;
      //EdtCodigo_Caixa.Visible:= false;
    end
    else
    begin
      FrmBaixar_Titulo.Height:= 187;
      TlbFerramentas.Height:= 187;
      //Label3.Visible:= true;
      //EdtCaixa.Visible:= true;
      //EdtCodigo_Caixa.Visible:= true;
    end;
end;

function TFrmBaixar_Titulo.Confira: boolean;
begin
  Confira:= false;
  if MEdtData_Pagamento.Text = '  /  /    ' then
  begin
    Mensagem_Falta_Dados;
    MEdtData_Pagamento.SetFocus;
    exit;
  end;

  if (EdtValor_Pagar.Text = '') or (EdtValor_Pagar.Text = '0,00') then
  begin
    Mensagem_Falta_Dados;
    EdtValor_Pagar.SetFocus;
    exit;
  end;

  if (EdtCondicao_Pagamento.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCondicao_Pagamento.SetFocus;
    exit;
  end;

  if (CBBanco.Checked) then
  begin
    if (EdtCodigo_Conta.Text = '') then
    begin
      Mensagem_Falta_Dados;
      EdtCodigo_Conta.SetFocus;
      exit;
    end;

    if (EdtCodigo_Operacao.Text = '') then
    begin
      Mensagem_Falta_Dados;
      EdtCodigo_Operacao.SetFocus;
      exit;
    end;

    Verifica_Banco;
  end;
    Confira:= true;
end;

procedure TFrmBaixar_Titulo.EdtAcrescimoExit(Sender: TObject);
begin
  if (EdtAcrescimo.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtAcrescimo.Text:= '0,00';
    EdtAcrescimo.SetFocus;
    abort;
  end;
  EdtAcrescimo.Text:= FormatFloat('#0.0,0', StrToFloat(EdtAcrescimo.Text));
  EdtAcrescimo.Text:= StringReplace(EdtAcrescimo.Text, ThousandSeparator, '', [rfReplaceAll]);

end;

procedure TFrmBaixar_Titulo.EdtCartaoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmBaixar_Titulo.EdtChequeKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixar_Titulo.EdtCheque_a_PrazoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmBaixar_Titulo.EdtCheque_a_VistaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmBaixar_Titulo.EdtCodigo_CaixaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Caixa, FrmChama_Caixa);
      FrmChama_Caixa.ShowModal;
      FrmChama_Caixa.Free;
    end;
end;

procedure TFrmBaixar_Titulo.EdtCodigo_ChequeDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Cheque, FrmChama_Cheque);
  FrmChama_Cheque.ShowModal;
  FrmChama_Cheque.Free;
end;

procedure TFrmBaixar_Titulo.EdtCodigo_ChequeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Cheque, FrmChama_Cheque);
      FrmChama_Cheque.ShowModal;
      FrmChama_Cheque.Free;
    end;
end;

procedure TFrmBaixar_Titulo.EdtCodigo_ChequeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixar_Titulo.EdtCodigo_Condicao_PagamentoDblClick(
  Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
  FrmChama_Condicao_Pagamento.ShowModal;
  FrmChama_Condicao_Pagamento.Free;
end;

procedure TFrmBaixar_Titulo.EdtCodigo_Condicao_PagamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
      FrmChama_Condicao_Pagamento.ShowModal;
      FrmChama_Condicao_Pagamento.Free;
    end;
end;

procedure TFrmBaixar_Titulo.EdtCodigo_Condicao_PagamentoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixar_Titulo.EdtCodigo_ContaDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Conta_Corrente, FrmChama_Conta_Corrente);
  FrmChama_Conta_Corrente.ShowModal;
  FrmChama_Conta_Corrente.Free;
end;

procedure TFrmBaixar_Titulo.EdtCodigo_ContaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Conta_Corrente, FrmChama_Conta_Corrente);
      FrmChama_Conta_Corrente.ShowModal;
      FrmChama_Conta_Corrente.Free;
    end;
end;

procedure TFrmBaixar_Titulo.EdtCodigo_ContaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixar_Titulo.EdtCodigo_OperacaoDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Operacao_Bancaria, FrmChama_Operacao_Bancaria);
  FrmChama_Operacao_Bancaria.ShowModal;
  FrmChama_Operacao_Bancaria.Free;
end;

procedure TFrmBaixar_Titulo.EdtCodigo_OperacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Operacao_Bancaria, FrmChama_Operacao_Bancaria);
      FrmChama_Operacao_Bancaria.ShowModal;
      FrmChama_Operacao_Bancaria.Free;
    end;
end;

procedure TFrmBaixar_Titulo.EdtCodigo_OperacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixar_Titulo.EdtCondicao_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixar_Titulo.EdtContaKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixar_Titulo.EdtDescontoExit(Sender: TObject);
begin
  if (EdtDesconto.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtDesconto.Text:= '0,00';
    EdtDesconto.SetFocus;
    abort;
  end;
  EdtDesconto.Text:= FormatFloat('#0.0,0', StrToFloat(EdtDesconto.Text));
  EdtDesconto.Text:= StringReplace(EdtDesconto.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmBaixar_Titulo.EdtDescontoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmBaixar_Titulo.EdtValor_PagoEnter(Sender: TObject);
var
  valor_restante, valor_recebido, valor_pagar, valor_pago: double;
begin
  valor_pagar:= StrToFloat(EdtValor_Pagar.Text);
  valor_restante:= StrToFloat(EdtValor_Restante.Text);

  valor_pago:= (valor_pagar - valor_restante);

  Util.FormataFloat(2, EdtValor_Pago, valor_pago);
end;

procedure TFrmBaixar_Titulo.EdtValor_PagoExit(Sender: TObject);
begin
  if (EdtValor_Pago.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtValor_Pago.Text:= '0,00';
    EdtValor_Pago.SetFocus;
    abort;
  end;
  Util.FormataFloat(2, EdtValor_Pago, StrToFloat(EdtValor_Pago.Text));
end;

procedure TFrmBaixar_Titulo.EdtValor_PagarExit(Sender: TObject);
begin
  if (EdtValor_Pagar.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtValor_Pagar.Text:= '0,00';
    EdtValor_Pagar.SetFocus;
    abort;
  end;
  Util.FormataFloat(2, EdtValor_Pagar, StrToFloat(EdtValor_Pagar.Text));
end;

procedure TFrmBaixar_Titulo.EdtValor_PagoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmBaixar_Titulo.EdtJurosKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmBaixar_Titulo.EdtOperacao_BancariaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixar_Titulo.EdtTipo_OperacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmBaixar_Titulo.EdtValor_PagarEnter(Sender: TObject);
var
  acrescimo, desconto, valor_parcela, total, valor_restante, valor_recebido, valor_pago, valor_pagar: double;
begin
  //if (EdtValor_Pago.Text = '0,00') or (EdtValor_Pago.Text = '0') then
  //begin
    acrescimo:= StrToFloat(EdtAcrescimo.Text);
    desconto:= StrToFloat(EdtDesconto.Text);
    valor_parcela:= StrToFloat(EdtValor_Parcela.Text);
    //valor_restante:= StrToFloat(EdtValor_Restante.Text);
    valor_pagar:= StrToFloat(EdtValor_Pagar.Text);
    valor_pago:= StrToFloat(EdtValor_Pago.Text);
    valor_recebido:= StrToFloat(EdtValor_Recebido.Text);

    total:= valor_parcela + acrescimo - desconto;

    //valor_restante:= (valor_pagar - valor_pago);
    //valor_pago:= (valor_pagar - valor_restante);

    Util.FormataFloat(2, EdtValor_Pagar, total);
    //Util.FormataFloat(2, EdtValor_Pago, valor_pago);
    //Util.FormataFloat(2, EdtValor_Restante, valor_restante);

  //end;

end;

procedure TFrmBaixar_Titulo.EdtValor_PagarKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmBaixar_Titulo.EdtValor_ParcelaExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtValor_Parcela, StrToFloat(EdtValor_Parcela.Text));
end;

procedure TFrmBaixar_Titulo.EdtValor_RecebidoExit(Sender: TObject);
begin
  if (EdtValor_Recebido.Text = '') or (EdtValor_Recebido.Text = '0,00') or (EdtValor_Recebido.Text = '0') then
  begin
    Mensagem_Falta_Dados;
    EdtValor_Recebido.SetFocus;
    abort;
  end;
  Util.FormataFloat(2, EdtValor_Recebido, StrToFloat(EdtValor_Recebido.Text));
end;

procedure TFrmBaixar_Titulo.EdtValor_RestanteEnter(Sender: TObject);
var
  valor_parcela, desconto, acrescimo, total, valor_pagar, valor_recebido, valor_restante, valor_pago: double;
begin
  valor_parcela:= StrToFloat(EdtValor_Parcela.Text);
  desconto:= StrToFloat(EdtDesconto.Text);
  acrescimo:= StrToFloat(EdtAcrescimo.Text);
  valor_pagar:= StrToFloat(EdtValor_Pagar.Text);
  valor_pago:= StrToFloat(EdtValor_Pago.Text);
  valor_recebido:= StrToFloat(EdtValor_Recebido.Text);
  valor_restante:= StrToFloat(EdtValor_Restante.Text);

  total:= ( valor_pagar - ( valor_recebido + valor_pago));

  Util.FormataFloat(2, EdtValor_Restante, total);
end;

procedure TFrmBaixar_Titulo.EdtValor_RestanteExit(Sender: TObject);
begin
  if (EdtValor_Restante.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtValor_Restante.Text:= '0,00';
    EdtValor_Restante.SetFocus;
    abort;
  end;
  Util.FormataFloat(2, EdtValor_Restante, StrToFloat(EdtValor_Restante.Text));
end;

procedure TFrmBaixar_Titulo.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmBaixar_Titulo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  //FrmBaixar_Titulo.Free;
  FrmBaixar_Titulo:= Nil;
end;

procedure TFrmBaixar_Titulo.FormCreate(Sender: TObject);
var
  credito: double;
begin
  {if (FrmChama_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
  begin
    credito:= Pega_Credito_Cliente(FrmChama_Lancamentos_Financeiros.qrychama_lancamentoCod.AsInteger);

    if (credito < 0) then
      EdtJuros.Text:= FloatToStr(Abs(credito))
    else
      EdtDesconto.Text:= FloatToStr(credito);
  end;}
  //EdtDesconto.Text:= '0,00';
  //EdtAcrescimo.Text:= '0,00';
  CodigoLancamentoBancario:= 0;
  EdtHistorico.Text:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoHistorico.AsString;
end;

procedure TFrmBaixar_Titulo.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmBaixar_Titulo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmBaixar_Titulo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmBaixar_Titulo.Grava_Historico;
var
  qAux2: TADOQuery;
begin
  qAux2:= TADOQuery.Create(nil);
  try
  //if ( EdtValor_Restante.Text <> '0,00') and (FrmChama_Lancamentos_Financeiros.CBBaixa.Checked = false) then
  //begin
    with qAux2, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('insert into Parcelas_Lancamentos_Historico(Codigo, N_Documento, Data_Pagamento, Codigo_Forma_Pagamento, Valor_Recebido, Codigo_Conta, Codigo_Cheque, Codigo_Lancamento_Bancario, Codigo_Lancamento_Caixa) values');
      add('(:Codigo, :N_Documento, :Data_Pagamento, :Codigo_Forma_Pagamento, :Valor_Recebido, :Codigo_Conta, :Codigo_Cheque, :Codigo_Lancamento_Bancario, :Codigo_Lancamento_Caixa)');

      Parameters.ParamByName('Codigo').Value:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoCodigo.AsInteger;
      Parameters.ParamByName('N_Documento').Value:= EdtN_Documento.Text;
      Parameters.ParamByName('Data_Pagamento').Value:= StrToDateTime(MEdtData_Pagamento.Text);
      Parameters.ParamByName('Codigo_Forma_Pagamento').Value:= StrToInt(EdtCodigo_Condicao_Pagamento.Text);
      Parameters.ParamByName('Valor_Recebido').Value:= StrToFloat(EdtValor_Recebido.Text);

      if (EdtCodigo_Conta.Text = '') then
        Parameters.ParamByName('Codigo_Conta').Value:= 0
      else
        Parameters.ParamByName('Codigo_Conta').Value:= StrToInt(EdtCodigo_Conta.Text);

      if (EdtCodigo_Cheque.Text = '') then
        Parameters.ParamByName('Codigo_Cheque').Value:= 0
      else
        Parameters.ParamByName('Codigo_Cheque').Value:= StrToInt(EdtCodigo_Cheque.Text);

      Parameters.ParamByName('Codigo_Lancamento_Bancario').Value:= CodigoLancamentoBancario;
      Parameters.ParamByName('Codigo_Lancamento_Caixa').Value:= CodigoLancamentoCaixa;
      ExecSQL;
    end;
  //end;

  finally
    FreeAndNil(qAux2);
  end;
end;

procedure TFrmBaixar_Titulo.MEdtData_PagamentoEnter(Sender: TObject);
begin
  MEdtData_Pagamento.Text:= DateToStr(date);
end;

procedure TFrmBaixar_Titulo.MmoObservacoesKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];
end;

procedure TFrmBaixar_Titulo.Verifica_Banco;
begin
  if (FrmChama_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) and (EdtTipo_Operacao.Text = 'CRÉDITO') then
  begin
    Application.MessageBox('Por favor, verifique o tipo de operação.', 'Operação errada', MB_OK+MB_ICONHAND);
    abort;
  end;

  if (FrmChama_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) and (EdtTipo_Operacao.Text = 'DÉBITO') then
  begin
    Application.MessageBox('Por favor, verifique o tipo de operação.', 'Operação errada', MB_OK+MB_ICONHAND);
    abort;
  end;

end;

end.
