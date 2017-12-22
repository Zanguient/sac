unit ULancamento_Banco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls, Modelo.Entidade.TContaCorrente, Modelo.Entidade.TOperacaoBancaria,
  Modelo.Entidade.TLancamentoBancarioEntidade;

type
  TFrmLancamento_Banco = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    BBtnPesquisar: TToolButton;
    LblMarca: TLabel;
    EdtDocumento: TEdit;
    Label6: TLabel;
    EdtPlano: TEdit;
    EdtCodigo_Plano: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    MEdtData_Lancamento: TMaskEdit;
    EdtValor: TEdit;
    Label16: TLabel;
    EdtDescricao: TEdit;
    Label1: TLabel;
    EdtConta: TEdit;
    EdtCodigo_Conta: TEdit;
    Label2: TLabel;
    EdtCodigo_Operacao: TEdit;
    EdtOperacao_Bancaria: TEdit;
    EdtTipo_Operacao: TEdit;
    RGStatus: TRadioGroup;
    BbtnNovo: TToolButton;
    Label3: TLabel;
    EdtCheque: TEdit;
    EdtCodigo_Cheque: TEdit;
    GBOutra_Conta: TGroupBox;
    Label4: TLabel;
    EdtConta_Destino: TEdit;
    EdtCodigo_Conta_Destino: TEdit;
    CBTransferencia: TCheckBox;
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
    procedure EdtCodigo_PlanoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdtData_LancamentoEnter(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure MEdtData_LancamentoExit(Sender: TObject);
    procedure MmoObservacoesKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_OperacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ContaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtContaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_OperacaoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtOperacao_BancariaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_PlanoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPlanoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValorKeyPress(Sender: TObject; var Key: Char);
    procedure BbtnNovoClick(Sender: TObject);
    procedure EdtCodigo_ChequeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtChequeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ChequeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Conta_DestinoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBTransferenciaClick(Sender: TObject);
  private
    Lancamento_Banco: URegistro.TLancamento_Banco;
    Parcela: URegistro.TParcelas;
    Util: TUtil;

    Fechamento: URegistro.TFechamento_Venda;
  public
    ativo, achei: boolean;
    conta: integer;

    ContaCorrente: TContaCorrenteEntidade;
    OperacaoBancaria: TOperacaoBancariaEntidade;
    LancamentoBancario: TLancamentoBancarioentidade;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmLancamento_Banco: TFrmLancamento_Banco;
implementation

uses UChama_Plano_Financeiro, UChama_Conta_Corrente,
  UChama_Operacao_Bancaria, UChama_Lancamento_Banco, UDM, UDeclaracao,
  Modelo.Dominio.TContaCorrenteDominio, Modelo.Dominio.TCaixaDiario,
  Util.Mensagens, Modelo.Dominio.TLancamentoBancarioDominio, Modelo.Enum.TEnum,
  TypInfo, Util.GeradorDeCodigo, UChama_Cheque;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmLancamento_Banco.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmLancamento_Banco);
  Util.Desabilita_Campos(FrmLancamento_Banco);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmLancamento_Banco.BBtnExcluirClick(Sender: TObject);
var
  ContaCorrenteDominio: TContaCorrenteDominio;
  CaixaDiario: TCaixaDiarioDominio;
  LancamentoBancarioDominio: TLancamentoBancarioDominio;
begin
  TMensagens.MensagemInformacao('Ao excluir o lançamento, o mesmo será colocado como ESTORNADO no histórico da conta corrente, o saldo bancário será atualizado e o valor será removido do caixa diário.');
  if (CONFIRMA_EXCLUSAO) then
  BEGIN
    LancamentoBancarioDominio:= TLancamentoBancarioDominio.Create(dm.ADOConnection1);
    ContaCorrenteDominio:= TContaCorrenteDominio.Create(dm.ADOConnection1);
    //CaixaDiario:= TCaixaDiarioDominio.Create(dm.ADOConnection1);

    LancamentoBancario:= TLancamentoBancarioEntidade.Create;
    LancamentoBancario.Codigo_Empresa:= UDeclaracao.Codigo_Empresa;
    LancamentoBancario.N_Documento:= StrToInt(EdtDocumento.Text);
    LancamentoBancario.Data_Lancamento:= StrToDateTime(MEdtData_Lancamento.Text);
    LancamentoBancario.Codigo_Conta:= StrToInt(EdtCodigo_Conta.Text);
    LancamentoBancario.Codigo_Operacao:= StrToInt(EdtCodigo_Operacao.Text);

    if (FrmLancamento_Banco.EdtCodigo_Plano.Text = '') then
      LancamentoBancario.Codigo_Plano:= 0
    else
      LancamentoBancario.Codigo_Plano:= StrToInt(EdtCodigo_Plano.Text);
    LancamentoBancario.Descricao:= 'ESTORNO DE VALOR LIBERADO';
    LancamentoBancario.Valor:= StrToFloat(EdtValor.Text);
    LancamentoBancario.Status:= 'LIBERADO';
    LancamentoBancario.SaldoAnterior:= ContaCorrenteDominio.RetornaSaldoAtual(StrToInt(EdtCodigo_Conta.Text));
    LancamentoBancario.SaldoAtual:= ContaCorrenteDominio.RetornaNovoSaldo(StrToInt(EdtCodigo_Conta.Text), StrToFloat(EdtValor.Text), EdtTipo_Operacao.Text, 1, RGStatus.ItemIndex);

    LancamentoBancario.CodigoCheque:= 0;

    LancamentoBancarioDominio.Inserir(LancamentoBancario);
    ContaCorrenteDominio.AtualizaSaldoBancario(StrToInt(EdtCodigo_Conta.Text), StrToFloat(EdtValor.Text), EdtTipo_Operacao.Text, 1, RGStatus.ItemIndex);
    //CaixaDiario.DeletaCaixa(StrToInt(EdtDocumento.Text), EdtValor.Text, 1);
    LancamentoBancarioDominio.AtualizaStatusBancario(StrToInt(EdtCodigo.Text), 'ESTORNADO', dm.ADOConnection1);
    LancamentoBancarioDominio.AtualizaCodigoChequeLancamentoBanco(StrToInt(EdtCodigo.Text), 0, dm.ADOConnection1);

    if (EdtCodigo_Cheque.Text <> '') then
    begin
      Atualiza_Cheque( '', 'PENDENTE', StrToInt(EdtCodigo_Cheque.Text));
    end;

    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU LANÇAMENTO BANCÁRIO ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    Processo_Concluido;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmLancamento_Banco);
  END;
end;

procedure TFrmLancamento_Banco.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmLancamento_Banco.BbtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmLancamento_Banco);
  Util.Limpa_Campos(FrmLancamento_Banco);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BbtnNovo.Enabled:= false;
  achei:= false;
  CBTransferencia.Checked:= false;
  EdtDocumento.SetFocus;
  EdtValor.Text:= '0,00';
end;

procedure TFrmLancamento_Banco.BBtnSalvarClick(Sender: TObject);
var
  tipo, TipoOperacao: AnsiString;
  ContaCorrenteDominio: TContaCorrenteDominio;
  LancamentoBancarioDominio: TLancamentoBancarioDominio;
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        ContaCorrenteDominio:= TContaCorrenteDominio.Create(dm.ADOConnection1);
        LancamentoBancarioDominio:= TLancamentoBancarioDominio.Create(dm.ADOConnection1);

        LancamentoBancario:= TLancamentoBancarioEntidade.Create;
        LancamentoBancario.Codigo_Empresa:= UDeclaracao.Codigo_Empresa;
        LancamentoBancario.N_Documento:= StrToInt(EdtDocumento.Text);
        LancamentoBancario.Data_Lancamento:= StrToDateTime(MEdtData_Lancamento.Text);
        LancamentoBancario.Codigo_Conta:= StrToInt(EdtCodigo_Conta.Text);
        LancamentoBancario.Codigo_Operacao:= StrToInt(EdtCodigo_Operacao.Text);

        if (FrmLancamento_Banco.EdtCodigo_Plano.Text = '') then
          LancamentoBancario.Codigo_Plano:= 0
        else
          LancamentoBancario.Codigo_Plano:= StrToInt(EdtCodigo_Plano.Text);

        LancamentoBancario.Descricao:= EdtDescricao.Text;
        LancamentoBancario.Valor:= StrToFloat(EdtValor.Text);

        if (FrmLancamento_Banco.RGStatus.ItemIndex = 0) then
          LancamentoBancario.Status:= 'BLOQUEADO'
        else
          LancamentoBancario.Status:= 'LIBERADO';

        LancamentoBancario.SaldoAnterior:= ContaCorrente.Saldo_Atual;
        LancamentoBancario.SaldoAtual:= ContaCorrenteDominio.RetornaNovoSaldo(StrToInt(EdtCodigo_Conta.Text), StrToFloat(EdtValor.Text), EdtTipo_Operacao.Text, 0, RGStatus.ItemIndex);

        if (EdtCodigo_Cheque.Text = '') then
          LancamentoBancario.CodigoCheque:= 0
        else
          LancamentoBancario.CodigoCheque:= StrToInt(EdtCodigo_Cheque.Text);

        if (CBTransferencia.Checked) then
          LancamentoBancario.Transferencia:= 0
        else
          LancamentoBancario.Transferencia:= 1;

        LancamentoBancarioDominio.Inserir(LancamentoBancario);
        ContaCorrenteDominio.AtualizaSaldoBancario(ContaCorrente, LancamentoBancario, OperacaoBancaria, 0, RGStatus.ItemIndex);

        if (EdtCodigo_Cheque.Text <> '') then
        begin
          if (RGStatus.ItemIndex = 1) then
          begin
            Atualiza_Cheque( MEdtData_Lancamento.Text, 'BAIXADO', StrToInt(EdtCodigo_Cheque.Text));
          end
          else
          begin
            Atualiza_Cheque( MEdtData_Lancamento.Text, 'PENDENTE', StrToInt(EdtCodigo_Cheque.Text));
          end;
        end;

        if (CBTransferencia.Checked) then
        begin
          LancamentoBancario:= TLancamentoBancarioEntidade.Create;
          LancamentoBancario.Codigo_Empresa:= UDeclaracao.Codigo_Empresa;
          LancamentoBancario.N_Documento:= StrToInt(EdtDocumento.Text);
          LancamentoBancario.Data_Lancamento:= StrToDateTime(MEdtData_Lancamento.Text);
          LancamentoBancario.Codigo_Conta:= StrToInt(EdtCodigo_Conta_Destino.Text);
          LancamentoBancario.Codigo_Operacao:= StrToInt(EdtCodigo_Operacao.Text);

          if (FrmLancamento_Banco.EdtCodigo_Plano.Text = '') then
            LancamentoBancario.Codigo_Plano:= 0
          else
            LancamentoBancario.Codigo_Plano:= StrToInt(EdtCodigo_Plano.Text);

          LancamentoBancario.Descricao:= EdtDescricao.Text;
          LancamentoBancario.Valor:= StrToFloat(EdtValor.Text);

          if (FrmLancamento_Banco.RGStatus.ItemIndex = 0) then
            LancamentoBancario.Status:= 'BLOQUEADO'
          else
            LancamentoBancario.Status:= 'LIBERADO';

          if (EdtTipo_Operacao.Text = 'DÉBITO') then
            TipoOperacao:= 'CRÉDITO'
          else
            TipoOperacao:= 'DÉBITO';

          LancamentoBancario.SaldoAnterior:= ContaCorrenteDominio.RetornaSaldoAtual(StrToInt(EdtCodigo_Conta_Destino.Text));
          LancamentoBancario.SaldoAtual:= ContaCorrenteDominio.RetornaNovoSaldo(StrToInt(EdtCodigo_Conta_Destino.Text), StrToFloat(EdtValor.Text), TipoOperacao, 0, RGStatus.ItemIndex);

          if (EdtCodigo_Cheque.Text = '') then
            LancamentoBancario.CodigoCheque:= 0
          else
            LancamentoBancario.CodigoCheque:= StrToInt(EdtCodigo_Cheque.Text);

          LancamentoBancario.Transferencia:= 0;

          LancamentoBancarioDominio:= TLancamentoBancarioDominio.Create(dm.ADOConnection1);
          LancamentoBancarioDominio.Inserir(LancamentoBancario);

          ContaCorrenteDominio:= TContaCorrenteDominio.Create(dm.ADOConnection1);
          ContaCorrenteDominio.AtualizaSaldoBancario(StrToInt(EdtCodigo_Conta_Destino.Text), StrToFloat(EdtValor.Text), TipoOperacao, 0, RGStatus.ItemIndex);
        end;

        if (RGStatus.ItemIndex = 1) then
        begin
          if (EdtTipo_Operacao.Text = 'CRÉDITO') then
          begin
            tipo:= '+';
            Fechamento.Salva_Conta(0, UDeclaracao.codigo_empresa, UDeclaracao.codigo_caixa, UDeclaracao.codigo_usu, 0, 1, StrToInt(EdtDocumento.Text), 1, 'DINHEIRO', 'RECEB. - BANCO', 'PAGO', tipo, StrToFloat(EdtValor.Text), 0, date);
          end
          else
          begin
            tipo:= '-';
            Fechamento.Salva_Conta(0, UDeclaracao.codigo_empresa, UDeclaracao.codigo_caixa, UDeclaracao.codigo_usu, 0, 1, StrToInt(EdtDocumento.Text), 1, 'DINHEIRO', 'PAGAS - BANCO', 'PAGO', tipo, StrToFloat(EdtValor.Text), 0, date);
          end;
        end;


        UDeclaracao.Insere_Historico(usuario, 'EFETUOU LANÇAMENTO BANCÁRIO ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      end
      else
        exit;
    {end
    else
    begin
      if (Confira = true) then
      BEGIN
        Lancamento_Banco.Alterar(Lancamento_Banco);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU LANÇAMENTO BANCÁRIO ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;}
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Processo_Concluido;
    Util.Desabilita_Campos(FrmLancamento_Banco);
end;

procedure TFrmLancamento_Banco.CBTransferenciaClick(Sender: TObject);
begin
  if (CBTransferencia.Checked) then
  begin
    FrmLancamento_Banco.Height:= 346;
    RGStatus.ItemIndex:= 1;
  end
  else
  begin
    FrmLancamento_Banco.Height:= 265;
  end;
end;

function TFrmLancamento_Banco.Confira: boolean;
begin
  Confira:= false;
  if EdtDocumento.Text = '' then
  begin
    Mensagem_Falta_Dados;
    EdtDocumento.SetFocus;
    exit;
  end;

  if MEdtData_Lancamento.Text = '  /  /    ' then
  begin
    Mensagem_Falta_Dados;
    MEdtData_Lancamento.SetFocus;
    exit;
  end;

  if EdtCodigo_Conta.Text = '' then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Conta.SetFocus;
    exit;
  end;

  if EdtCodigo_Operacao.Text = '' then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Conta.SetFocus;
    exit;
  end;

  if (EdtValor.Text = '') or (EdtValor.Text = '0,00') then
  begin
    Mensagem_Falta_Dados;
    EdtValor.SetFocus;
    exit;
  end;

  if (CBTransferencia.Checked) and (EdtCodigo_Conta_Destino.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Conta_Destino.SetFocus;
    exit;
  end;
   Confira:= true;
end;

procedure TFrmLancamento_Banco.EdtChequeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Banco.EdtCodigo_ChequeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Cheque, FrmChama_Cheque);
    FrmChama_Cheque.ShowModal;
    FrmChama_Cheque.Free;
  end;
end;

procedure TFrmLancamento_Banco.EdtCodigo_ChequeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Banco.EdtCodigo_ContaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      conta:= 0;
      Application.CreateForm(TFrmChama_Conta_Corrente, FrmChama_Conta_Corrente);
      FrmChama_Conta_Corrente.ShowModal;
      FrmChama_Conta_Corrente.Free;
    end;
end;

procedure TFrmLancamento_Banco.EdtCodigo_ContaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Banco.EdtCodigo_Conta_DestinoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      conta:= 1;
      Application.CreateForm(TFrmChama_Conta_Corrente, FrmChama_Conta_Corrente);
      FrmChama_Conta_Corrente.ShowModal;
      FrmChama_Conta_Corrente.Free;
    end;
end;

procedure TFrmLancamento_Banco.EdtCodigo_OperacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Operacao_Bancaria, FrmChama_Operacao_Bancaria);
      FrmChama_Operacao_Bancaria.ShowModal;
      FrmChama_Operacao_Bancaria.Free;
    end;
end;

procedure TFrmLancamento_Banco.EdtCodigo_OperacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Banco.EdtCodigo_PlanoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Plano_Financeiro, FrmChama_Plano_Financeiro);
      FrmChama_Plano_Financeiro.ShowModal;
      FrmChama_Plano_Financeiro.Free;
    end;
end;

procedure TFrmLancamento_Banco.EdtCodigo_PlanoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Banco.EdtContaKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Banco.EdtOperacao_BancariaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Banco.EdtPlanoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmLancamento_Banco.EdtValorExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtValor, StrToFloat(EdtValor.Text));
end;

procedure TFrmLancamento_Banco.EdtValorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmLancamento_Banco.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmLancamento_Banco.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmLancamento_Banco.Free;
        FrmLancamento_Banco:= Nil;
      end;
end;

procedure TFrmLancamento_Banco.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmLancamento_Banco);
  Util.Limpa_Campos(FrmLancamento_Banco);
  Util.Desabilita_Campos(FrmLancamento_Banco);
  EdtValor.Text:= '0,00';
  CBTransferencia.Checked:= false;
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmLancamento_Banco.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmLancamento_Banco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin

    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmLancamento_Banco.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmLancamento_Banco.MEdtData_LancamentoEnter(Sender: TObject);
begin
  MEdtData_Lancamento.Text:= DateToStr(date);
end;

procedure TFrmLancamento_Banco.MEdtData_LancamentoExit(Sender: TObject);
begin
  if (MEdtData_Lancamento.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Lancamento);
end;

procedure TFrmLancamento_Banco.MmoObservacoesKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];
end;

procedure TFrmLancamento_Banco.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Lancamento_Banco, FrmChama_Lancamento_Banco);
  FrmChama_Lancamento_Banco.ShowModal;
  FrmChama_Lancamento_Banco.Release;
end;

end.
