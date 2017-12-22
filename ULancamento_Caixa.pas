unit ULancamento_Caixa;

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls, Modelo.Entidade.TContaCorrente, Modelo.Entidade.TOperacaoBancaria,
  Modelo.Entidade.TLancamentoBancarioEntidade,
  Modelo.Entidade.TLancamentoCaixaEntidade;

type
  TFrmLancamento_Caixa = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    BBtnPesquisar: TToolButton;
    Label8: TLabel;
    Label9: TLabel;
    MEdtData_Lancamento: TMaskEdit;
    EdtValor: TEdit;
    Label16: TLabel;
    EdtDescricao: TEdit;
    RGTipoMovimento: TRadioGroup;
    BbtnNovo: TToolButton;
    GBOutra_Conta: TGroupBox;
    Label4: TLabel;
    RGCondPag: TRadioGroup;
    CBTransferencia: TCheckBox;
    GBTransferencia: TGroupBox;
    Label1: TLabel;
    EdtConta: TEdit;
    EdtCodigo_Conta: TEdit;
    Label2: TLabel;
    EdtCodigo_Operacao: TEdit;
    EdtOperacao_Bancaria: TEdit;
    EdtTipo_Operacao: TEdit;
    Label3: TLabel;
    EdtPlano: TEdit;
    EdtCodigo_Plano: TEdit;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    EdtCodigo_Lancamento_Banco: TEdit;
    txtEdtCodigo_Atendente: TEdit;
    txtEdtAtendente: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure MEdtData_LancamentoEnter(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure MEdtData_LancamentoExit(Sender: TObject);
    procedure EdtValorKeyPress(Sender: TObject; var Key: Char);
    procedure BbtnNovoClick(Sender: TObject);
    procedure EdtCodigo_ContaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtContaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBTransferenciaClick(Sender: TObject);
    procedure EdtOperacao_BancariaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTipo_OperacaoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_OperacaoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_OperacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_PlanoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_PlanoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtEdtCodigo_AtendenteDblClick(Sender: TObject);
    procedure txtEdtCodigo_AtendenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Lancamento_Banco: URegistro.TLancamento_Banco;
    Parcela: URegistro.TParcelas;
    Util: TUtil;

    Fechamento: URegistro.TFechamento_Venda;
  public
    ativo, achei: boolean;
    conta: integer;

    LancamentoCaixa: TLancamentoCaixaEntidade;
    ContaCorrente: TContaCorrenteEntidade;
    OperacaoBancaria: TOperacaoBancariaEntidade;
    LancamentoBancario: TLancamentoBancarioentidade;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmLancamento_Caixa: TFrmLancamento_Caixa;
implementation

uses UDM, UDeclaracao,
  Modelo.Dominio.TContaCorrenteDominio, Modelo.Dominio.TCaixaDiario,
  Util.Mensagens, Modelo.Dominio.TLancamentoBancarioDominio, Modelo.Enum.TEnum,
  TypInfo, Util.GeradorDeCodigo, UChama_Cheque,
  Modelo.Dominio.TLancamentoCaixaDominio, UChama_Lancamento_Caixa,
  UChama_Conta_Corrente, UChama_Operacao_Bancaria, UChama_Plano_Financeiro,
  UChama_Usuario, USenha_ADM, Windows;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmLancamento_Caixa.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmLancamento_Caixa);
  Util.Desabilita_Campos(FrmLancamento_Caixa);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  CBTransferencia.Checked := False;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmLancamento_Caixa.BBtnExcluirClick(Sender: TObject);
var
  TipoOperacao: AnsiString;
  ContaCorrenteDominio: TContaCorrenteDominio;
  //CaixaDiario: TCaixaDiarioDominio;
  LancamentoBancarioDominio: TLancamentoBancarioDominio;
  LancamentoCaixaDominio: TLancamentoCaixaDominio;
begin
  if (CONFIRMA_EXCLUSAO) then
  BEGIN
    LancamentoCaixaDominio:= TLancamentoCaixaDominio.Create(dm.ADOConnection1);
    LancamentoCaixa:= TLancamentoCaixaEntidade.Create;

    if (EdtCodigo.Text = '') then
      LancamentoCaixa.Codigo:= 0
    else
      LancamentoCaixa.Codigo:= StrToInt(EdtCodigo.Text);

    LancamentoCaixa.CodigoEmpresa:= UDeclaracao.Codigo_Empresa;
    LancamentoCaixa.CodigoCaixa:= codigo_usu;
    LancamentoCaixa.CodigoUsuario:= codigo_usu;
    if (RGCondPag.ItemIndex = 0) then
      LancamentoCaixa.FormaPagamento:= 'DINHEIRO'
    else
      LancamentoCaixa.FormaPagamento:= 'CHEQUE';

    LancamentoCaixa.Valor:= StrToFloat(EdtValor.Text);
    LancamentoCaixa.Troco:= 0;
    LancamentoCaixa.Data:= StrToDateTime(MEdtData_Lancamento.Text);

    if (RGTipoMovimento.ItemIndex = 0) then
    begin
      LancamentoCaixa.TipoDocumento:= 'RECEBIDAS';
      LancamentoCaixa.Tipo:= '+';
      TipoOperacao:= 'CRÉDITO';
    end
    else
    begin
      LancamentoCaixa.TipoDocumento:= 'PAGAS';
      LancamentoCaixa.Tipo:= '-';
      TipoOperacao:= 'DÉBITO'
    end;

    LancamentoCaixa.Status:= 'ESTORNADO';
    LancamentoCaixa.Acerto:= 0;
    LancamentoCaixa.Movimenta:= 0;
    LancamentoCaixa.NDocumento:= 0;
    LancamentoCaixa.Parcela:= 0;
    LancamentoCaixa.Descricao:= 'ESTORNO DE VALOR DO CAIXA';

    if (EdtCodigo_Conta.Text = '') then
      LancamentoCaixa.CodigoConta:= 0
    else
      LancamentoCaixa.CodigoConta:= StrToInt(EdtCodigo_Conta.Text);

    if (EdtCodigo_Operacao.Text = '') then
      LancamentoCaixa.CodigoOperacao:= 0
    else
      LancamentoCaixa.CodigoOperacao:= StrToInt(EdtCodigo_Operacao.Text);

    if (CBTransferencia.Checked) then
      LancamentoCaixa.Transferencia:= 0
    else
      LancamentoCaixa.Transferencia:= 1;

    LancamentoCaixa.CodigoLancamentoBanco:= 0;
    LancamentoCaixa.SaldoAnterior:= LancamentoCaixaDominio.RetornaSaldoAtual(codigo_usu);
    LancamentoCaixa.SaldoAtual:= LancamentoCaixaDominio.RetornaNovoSaldo(codigo_usu, StrToFloat(EdtValor.Text), TipoOperacao, 1);

    LancamentoCaixaDominio.Inserir(LancamentoCaixa);
    LancamentoCaixaDominio.AtualizaSaldoCaixa(codigo_usu, StrToFloat(EdtValor.Text), TipoOperacao, 1);
    LancamentoCaixaDominio.AtualizaStatusLancamentoCaixa(StrToInt(EdtCodigo.Text), 'ESTORNADO', dm.ADOConnection1);

    if (CBTransferencia.Checked) then
    begin
      LancamentoBancarioDominio:= TLancamentoBancarioDominio.Create(dm.ADOConnection1);
      ContaCorrenteDominio:= TContaCorrenteDominio.Create(dm.ADOConnection1);
      LancamentoBancario:= TLancamentoBancarioEntidade.Create;

      LancamentoBancario.Codigo_Empresa:= UDeclaracao.Codigo_Empresa;
      LancamentoBancario.N_Documento:= 0;
      LancamentoBancario.Data_Lancamento:= StrToDateTime(MEdtData_Lancamento.Text);
      LancamentoBancario.Codigo_Conta:= StrToInt(EdtCodigo_Conta.Text);
      LancamentoBancario.Codigo_Operacao:= StrToInt(EdtCodigo_Operacao.Text);

      if (EdtCodigo_Plano.Text = '') then
        LancamentoBancario.Codigo_Plano:= 0
      else
        LancamentoBancario.Codigo_Plano:= StrToInt(EdtCodigo_Plano.Text);

      LancamentoBancario.Descricao:= 'ESTORNO DE VALOR LIBERADO';
      LancamentoBancario.Valor:= StrToFloat(EdtValor.Text);
      LancamentoBancario.Status:= 'LIBERADO';
      LancamentoBancario.SaldoAnterior:= ContaCorrenteDominio.RetornaSaldoAtual(StrToInt(EdtCodigo_Conta.Text));
      LancamentoBancario.SaldoAtual:= ContaCorrenteDominio.RetornaNovoSaldo(StrToInt(EdtCodigo_Conta.Text), StrToFloat(EdtValor.Text), EdtTipo_Operacao.Text, 1, 1);

      LancamentoBancario.CodigoCheque:= 0;

      LancamentoBancarioDominio.Inserir(LancamentoBancario);
      ContaCorrenteDominio.AtualizaSaldoBancario(StrToInt(EdtCodigo_Conta.Text), StrToFloat(EdtValor.Text), EdtTipo_Operacao.Text, 1, 1);
      LancamentoBancarioDominio.AtualizaStatusBancario(StrToInt(EdtCodigo_Lancamento_Banco.Text), 'ESTORNADO', dm.ADOConnection1);
      UDeclaracao.Insere_Historico(usuario, 'ESTORNOU TRANSFERENCIA DO CAIXA PARA O BANCO - ' + EdtValor.Text + '.', TimeToStr(time), insercao, date);
    end;

    UDeclaracao.Insere_Historico(usuario, 'ESTORNOU LANÇAMENTO DO CAIXA - ' + EdtValor.Text + '.', TimeToStr(time), exclusao, date);
    Processo_Concluido;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmLancamento_Caixa);
  END;
end;

procedure TFrmLancamento_Caixa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmLancamento_Caixa.BbtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmLancamento_Caixa);
  Util.Limpa_Campos(FrmLancamento_Caixa);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BbtnNovo.Enabled:= false;
  achei:= false;
  RGCondPag.ItemIndex:= 0;
  GBTransferencia.Visible:= false;
  CBTransferencia.Checked:= false;
  MEdtData_Lancamento.Text:= DateToStr(Date);
  EdtDescricao.SetFocus;
  txtEdtCodigo_Atendente.text := IntToStr(codigo_usu);
  txtEdtAtendente.Text:= usuario;
  EdtValor.Text:= '0,00';
end;

procedure TFrmLancamento_Caixa.BBtnSalvarClick(Sender: TObject);
var
  tipo, TipoOperacao: AnsiString;
  LancamentoCaixaDominio: TLancamentoCaixaDominio;
  ContaCorrenteDominio: TContaCorrenteDominio;
  LancamentoBancarioDominio: TLancamentoBancarioDominio;
  CodigoLancamentoBancario: integer;
begin
  if (achei = false) then
  begin
    if (Confira = true) then
    begin
      LancamentoCaixaDominio:= TLancamentoCaixaDominio.Create(dm.ADOConnection1);
      LancamentoCaixa:= TLancamentoCaixaEntidade.Create;

      if (EdtCodigo.Text = '') then
        LancamentoCaixa.Codigo:= 0
      else
        LancamentoCaixa.Codigo:= StrToInt(EdtCodigo.Text);

      LancamentoCaixa.CodigoEmpresa:= UDeclaracao.Codigo_Empresa;
      LancamentoCaixa.CodigoCaixa:= StrToInt(txtEdtCodigo_Atendente.Text);
      LancamentoCaixa.CodigoUsuario:= StrToInt(txtEdtCodigo_Atendente.text);
      if (RGCondPag.ItemIndex = 0) then
        LancamentoCaixa.FormaPagamento:= 'DINHEIRO'
      else if (RGCondPag.ItemIndex = 1) then
        LancamentoCaixa.FormaPagamento:= 'CHEQUE'
      else if (RGCondPag.ItemIndex = 2) then
        LancamentoCaixa.FormaPagamento:= 'CARTÃO';

      LancamentoCaixa.Valor:= StrToFloat(EdtValor.Text);
      LancamentoCaixa.Troco:= 0;
      LancamentoCaixa.Data:= StrToDateTime(MEdtData_Lancamento.Text);

      if (RGTipoMovimento.ItemIndex = 0) then
      begin
        LancamentoCaixa.Tipo:= '+';
        TipoOperacao:= 'CRÉDITO';
        LancamentoCaixa.TipoDocumento:= 'RECEBIDAS';
      end
      else
      begin
        LancamentoCaixa.TipoDocumento:= 'PAGAS';
        LancamentoCaixa.Tipo:= '-';
        TipoOperacao:= 'DÉBITO'
      end;

      LancamentoCaixa.Status:= 'PAGO';
      LancamentoCaixa.Acerto:= 0;
      LancamentoCaixa.Movimenta:= 0;
      LancamentoCaixa.NDocumento:= 0;
      LancamentoCaixa.Parcela:= 0;
      LancamentoCaixa.Descricao:= EdtDescricao.Text;

      if (EdtCodigo_Conta.Text = '') then
        LancamentoCaixa.CodigoConta:= 0
      else
        LancamentoCaixa.CodigoConta:= StrToInt(EdtCodigo_Conta.Text);

      if (EdtCodigo_Operacao.Text = '') then
        LancamentoCaixa.CodigoOperacao:= 0
      else
        LancamentoCaixa.CodigoOperacao:= StrToInt(EdtCodigo_Operacao.Text);

      if (CBTransferencia.Checked) then
        LancamentoCaixa.Transferencia:= 0
      else
        LancamentoCaixa.Transferencia:= 1;

      LancamentoCaixa.CodigoLancamentoBanco:= 0;
      LancamentoCaixa.SaldoAnterior:= LancamentoCaixaDominio.RetornaSaldoAtual(codigo_usu);
      LancamentoCaixa.SaldoAtual:= LancamentoCaixaDominio.RetornaNovoSaldo(codigo_usu, StrToFloat(EdtValor.Text), TipoOperacao, 0);

      LancamentoCaixaDominio.Inserir(LancamentoCaixa);
      LancamentoCaixaDominio.AtualizaSaldoCaixa(StrToInt(txtEdtCodigo_Atendente.text), StrToFloat(EdtValor.Text), TipoOperacao, 0);

      if (CBTransferencia.Checked) then
      begin
        LancamentoBancario:= TLancamentoBancarioEntidade.Create;
        CodigoLancamentoBancario:= TGeradorDeCodigo.GeraCodigoIndetity('Lancamento_Banco', dm.ADOConnection1);
        LancamentoCaixa.CodigoLancamentoBanco:= CodigoLancamentoBancario;
        LancamentoBancario.Codigo_Empresa:= UDeclaracao.Codigo_Empresa;
        LancamentoBancario.N_Documento:= 0;
        LancamentoBancario.Data_Lancamento:= StrToDateTime(MEdtData_Lancamento.Text);
        LancamentoBancario.Codigo_Conta:= StrToInt(EdtCodigo_Conta.Text);
        LancamentoBancario.Codigo_Operacao:= StrToInt(EdtCodigo_Operacao.Text);

        if (EdtCodigo_Plano.Text = '') then
          LancamentoBancario.Codigo_Plano:= 0
        else
          LancamentoBancario.Codigo_Plano:= StrToInt(EdtCodigo_Plano.Text);

        LancamentoBancario.Descricao:= EdtDescricao.Text;
        LancamentoBancario.Valor:= StrToFloat(EdtValor.Text);

        LancamentoBancario.Status:= 'LIBERADO';

        if (EdtTipo_Operacao.Text = 'DÉBITO') then
          TipoOperacao:= 'DÉBITO'
        else
          TipoOperacao:= 'CRÉDITO';

        ContaCorrenteDominio:= TContaCorrenteDominio.Create(dm.ADOConnection1);
        LancamentoBancario.SaldoAnterior:= ContaCorrenteDominio.RetornaSaldoAtual(StrToInt(EdtCodigo_Conta.Text));
        LancamentoBancario.SaldoAtual:= ContaCorrenteDominio.RetornaNovoSaldo(StrToInt(EdtCodigo_Conta.Text), StrToFloat(EdtValor.Text), TipoOperacao, 0, 1);

        LancamentoBancario.CodigoCheque:= 0;
        LancamentoBancario.Transferencia:= 1;

        LancamentoBancarioDominio:= TLancamentoBancarioDominio.Create(dm.ADOConnection1);
        LancamentoBancarioDominio.Inserir(LancamentoBancario);

        ContaCorrenteDominio.AtualizaSaldoBancario(StrToInt(EdtCodigo_Conta.Text), StrToFloat(EdtValor.Text), TipoOperacao, 0, 1);
        UDeclaracao.Insere_Historico(usuario, 'TRANSFERIU DINHEIRO/CHEQUE DO CAIXA PARA O BANCO - ' + EdtValor.Text + '.', TimeToStr(time), insercao, date);
      end;

      UDeclaracao.Insere_Historico(usuario, 'EFETUOU LANÇAMENTO NO CAIXA ' + EdtValor.Text + '.', TimeToStr(time), insercao, date);
    end
    else
      exit;
  end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Processo_Concluido;
    Util.Desabilita_Campos(FrmLancamento_Caixa);
end;

procedure TFrmLancamento_Caixa.CBTransferenciaClick(Sender: TObject);
begin
  if (CBTransferencia.Checked) then
  begin
    GBTransferencia.Visible:= true;
  end
  else
  begin
    GBTransferencia.Visible:= false;
  end;
end;

function TFrmLancamento_Caixa.Confira: boolean;
begin
  Confira:= false;
  if MEdtData_Lancamento.Text = '  /  /    ' then
  begin
    Mensagem_Falta_Dados;
    MEdtData_Lancamento.SetFocus;
    exit;
  end;

  if (EdtValor.Text = '') or (EdtValor.Text = '0,00') or (EdtValor.Text = '0') then
  begin
    Mensagem_Falta_Dados;
    EdtValor.SetFocus;
    exit;
  end;

  if (EdtDescricao.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtDescricao.SetFocus;
    exit;
  end;

  if (CBTransferencia.Checked) then
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

    if (RGTipoMovimento.ItemIndex = 0) and (EdtTipo_Operacao.Text = 'CRÉDITO') then
    begin
      TMensagens.MensagemErro('A operação do caixa foi configurada com crédito e a do banco também. Por favor, verifique.');
      exit;
    end;

    if (RGTipoMovimento.ItemIndex = 1) and (EdtTipo_Operacao.Text = 'DÉBITO') then
    begin
      TMensagens.MensagemErro('A operação do caixa foi configurada com débito e a do banco também. Por favor, verifique.');
      exit;
    end;
  end;
  Confira:= true;
end;

procedure TFrmLancamento_Caixa.EdtCodigo_ContaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    Application.CreateForm(TFrmChama_Conta_Corrente, FrmChama_Conta_Corrente);
    FrmChama_Conta_Corrente.ShowModal;
    FrmChama_Conta_Corrente.Free;
  end;
end;

procedure TFrmLancamento_Caixa.EdtCodigo_ContaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Caixa.EdtCodigo_OperacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    Application.CreateForm(TFrmChama_Operacao_Bancaria, FrmChama_Operacao_Bancaria);
    FrmChama_Operacao_Bancaria.ShowModal;
    FrmChama_Operacao_Bancaria.Free;
  end;
end;

procedure TFrmLancamento_Caixa.EdtCodigo_OperacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Caixa.EdtCodigo_PlanoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    Application.CreateForm(TFrmChama_Plano_Financeiro, FrmChama_Plano_Financeiro);
    FrmChama_Plano_Financeiro.ShowModal;
    FrmChama_Plano_Financeiro.Free;
  end;
end;

procedure TFrmLancamento_Caixa.EdtCodigo_PlanoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Caixa.EdtContaKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Caixa.EdtOperacao_BancariaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Caixa.EdtTipo_OperacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Caixa.EdtValorExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtValor, StrToFloat(EdtValor.Text));
end;

procedure TFrmLancamento_Caixa.EdtValorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmLancamento_Caixa.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmLancamento_Caixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
    begin
      FrmLancamento_Caixa.Free;
      FrmLancamento_Caixa:= Nil;
    end;
end;

procedure TFrmLancamento_Caixa.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmLancamento_Caixa);
  Util.Limpa_Campos(FrmLancamento_Caixa);
  Util.Desabilita_Campos(FrmLancamento_Caixa);
  EdtValor.Text:= '0,00';
  CBTransferencia.Checked:= false;
  GBTransferencia.Visible:= false;
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmLancamento_Caixa.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmLancamento_Caixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmLancamento_Caixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    key:=#0; //anula todas as teclas
    SelectNext(ActiveControl, true, true);
  end;
end;

procedure TFrmLancamento_Caixa.MEdtData_LancamentoEnter(Sender: TObject);
begin
  MEdtData_Lancamento.Text:= DateToStr(date);
end;

procedure TFrmLancamento_Caixa.MEdtData_LancamentoExit(Sender: TObject);
begin
  if (MEdtData_Lancamento.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Lancamento);
end;

procedure TFrmLancamento_Caixa.txtEdtCodigo_AtendenteDblClick(Sender: TObject);
begin

    Application.CreateForm(TFrmSenha_ADM, FrmSenha_ADM);
    FrmSenha_ADM.ShowModal;
    FrmSenha_ADM.Free;

    if (libera_alterar_usuario_caixa) then
    begin
      libera_alterar_usuario_caixa:= false;
      Application.CreateForm(TFrmChama_Usuario, FrmChama_Usuario);
      FrmChama_Usuario.ShowModal;
      FrmChama_Usuario.Free;
    end
    else
    begin
      Application.MessageBox('Você não tem permissão para alterar o atendente atual.', 'Usuário não é administrador ou não encontrado', MB_ICONHAND+MB_OK);
      abort;
    end;
  //end;
end;

procedure TFrmLancamento_Caixa.txtEdtCodigo_AtendenteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmSenha_ADM, FrmSenha_ADM);
      FrmSenha_ADM.ShowModal;
      FrmSenha_ADM.Free;

      if (libera_alterar_usuario_caixa) then
      begin
        libera_alterar_usuario_caixa:= false;
        Application.CreateForm(TFrmChama_Usuario, FrmChama_Usuario);
        FrmChama_Usuario.ShowModal;
        FrmChama_Usuario.Free;
      end
      else
      begin
        Application.MessageBox('Você não tem permissão para alterar o atendente atual.', 'Usuário não é administrador ou não encontrado', MB_ICONHAND+MB_OK);
        abort;
      end;
    end;
end;

procedure TFrmLancamento_Caixa.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Lancamento_Caixa, FrmChama_Lancamento_Caixa);
  FrmChama_Lancamento_Caixa.ShowModal;
  FrmChama_Lancamento_Caixa.Release;
end;

end.
