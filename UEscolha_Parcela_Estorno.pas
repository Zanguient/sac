unit UEscolha_Parcela_Estorno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, ComCtrls, ToolWin, DB, ADODB, Grids,
  DBGrids;

type
  TFrmEscolha_Parcela_Estorno = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnOK: TToolButton;
    ImgImagens_Comandos: TImageList;
    BBtnSair: TToolButton;
    DBGrid1: TDBGrid;
    qrychama_lancamento: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_lancamentoCodigo: TIntegerField;
    qrychama_lancamentoN_Documento: TIntegerField;
    qrychama_lancamentoData_Pagamento: TDateTimeField;
    qrychama_lancamentoCodigo_Forma_Pagamento: TIntegerField;
    qrychama_lancamentoValor_Recebido: TFloatField;
    qrychama_lancamentoCond_Pag: TStringField;
    qrychama_lancamentoCodigo_Conta: TIntegerField;
    qrychama_lancamentoCodigo_Cheque: TIntegerField;
    qrychama_lancamentoCodigo_Registro: TAutoIncField;
    qrychama_lancamentoConta: TStringField;
    qrychama_lancamentoN_Cheque: TStringField;
    qrychama_lancamentoCodigo_Lancamento_Bancario: TIntegerField;
    qrychama_lancamentoCodigo_Lancamento_Caixa: TIntegerField;
    procedure BBtnSairClick(Sender: TObject);
    procedure imprime(pForm: TForm);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBtnOKClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure Atualiza_Query;
    procedure Deleta_Parcela;
    { Private declarations }
  public
    { Public declarations }
  var
    preview: boolean;
  end;

var
  FrmEscolha_Parcela_Estorno: TFrmEscolha_Parcela_Estorno;

implementation

uses UChama_Lancamentos_Financeiros, UDeclaracao, UDM, UGeral,
  Modelo.Dominio.TCaixaDiario, Modelo.Dominio.TContaCorrenteDominio,
  Modelo.Dominio.TLancamentoBancarioDominio,
  Modelo.Entidade.TLancamentoBancarioEntidade,
  Modelo.Entidade.TLancamentoCaixaEntidade,
  Modelo.Dominio.TLancamentoCaixaDominio;

{$R *.dfm}

procedure TFrmEscolha_Parcela_Estorno.Atualiza_Query;
begin
  with qrychama_lancamento, sql do
  begin
    close;
    clear;
    add('select PLH.*, CP.Descricao as Cond_Pag, CC.Conta, Ch.N_Cheque from Parcelas_Lancamentos_Historico PLH');
    add('left join Condicao_Pagamento CP on (PLH.Codigo_Forma_Pagamento = CP.Codigo)');
    add('left join Conta_Corrente CC on (PLH.Codigo_Conta = CC.Codigo)');
    add('left join Cheque Ch on (PLH.Codigo_Cheque = Ch.Codigo)');
    add('where PLH.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoCodigo.AsInteger;
    open;
  end;
end;

procedure TFrmEscolha_Parcela_Estorno.Deleta_Parcela;
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
      add('Delete from Parcelas_Lancamentos_Historico');
      add('where Codigo_Registro = :Codigo');
      Parameters.ParamByName('Codigo').Value:= qrychama_lancamentoCodigo_Registro.AsInteger;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmEscolha_Parcela_Estorno.BBtnOKClick(Sender: TObject);
var
  qAux, qAux2: TADOQuery;
  saldo: double;
  CaixaDiarioDominio: TCaixaDiarioDominio;
  ContaCorrenteDominio: TContaCorrenteDominio;
  LancamentoBancarioDominio: TLancamentoBancarioDominio;
  LancamentoBancario: TLancamentoBancarioEntidade;
  LancamentoCaixa: TLancamentoCaixaEntidade;
  LancamentoCaixaDominio: TLancamentoCaixaDominio;
  TipoOp, Tipo, TipoDoc: AnsiString;
  Status: integer;
begin
  if (Application.MessageBox('Confirma o estorno das informações selecionadas?', 'Confirmação...', MB_ICONQUESTION+MB_YESNO)) = idyes then
    begin
      try
        qAux:= TADOQuery.Create(self);
        qAux2:= TADOQuery.Create(self);

        Atualiza_Conta(FrmChama_Lancamentos_Financeiros.qrychama_lancamentoCodigo.AsInteger,
                       FrmChama_Lancamentos_Financeiros.qrychama_lancamentoParcela.AsInteger,
                       '',
                       'PENDENTE',
                       '',
                       '',
                       FrmChama_Lancamentos_Financeiros.qrychama_lancamentoValor_Pagar.AsFloat,
                       0,
                       0,
                       FrmChama_Lancamentos_Financeiros.qrychama_lancamentoValor_Restante.AsFloat + qrychama_lancamentoValor_Recebido.AsFloat,
                       FrmChama_Lancamentos_Financeiros.qrychama_lancamentoValor_Pago.AsFloat - qrychama_lancamentoValor_Recebido.AsFloat,
                       FrmChama_Lancamentos_Financeiros.qrychama_lancamentoCodigo_Forma_Pagamento.AsInteger);

        if (qrychama_lancamentoCodigo_Conta.AsInteger <> 0) then
        begin
          ContaCorrenteDominio:= TContaCorrenteDominio.Create(dm.ADOConnection1);
          LancamentoBancarioDominio:= TLancamentoBancarioDominio.Create(dm.ADOConnection1);
          LancamentoBancario:= TLancamentoBancarioEntidade.Create;

          if (FrmChama_Lancamentos_Financeiros.qrychama_lancamentoTipo.AsString = 'PAGAR') then
            TipoOp:= 'DÉBITO'
          else if (FrmChama_Lancamentos_Financeiros.qrychama_lancamentoTipo.AsString = 'RECEBER') then
            TipoOp:= 'CRÉDITO';

          LancamentoBancario.Codigo_Empresa:= UDeclaracao.Codigo_Empresa;
          LancamentoBancario.N_Documento:= qrychama_lancamentoN_Documento.AsInteger;
          LancamentoBancario.Data_Lancamento:= date;
          LancamentoBancario.Codigo_Conta:= qrychama_lancamentoCodigo_Conta.AsInteger;
          LancamentoBancario.Codigo_Operacao:= 0;
          LancamentoBancario.Codigo_Plano:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoCodigo_Plano.AsInteger;
          Status:= LancamentoBancarioDominio.RetornaStatusLancamento(qrychama_lancamentoCodigo_Lancamento_Bancario.AsInteger);

          LancamentoBancario.Descricao:= 'ESTORNO DE VALOR LIBERADO';
          LancamentoBancario.Valor:= qrychama_lancamentoValor_Recebido.AsFloat;
          LancamentoBancario.Status:= 'LIBERADO';
          LancamentoBancario.SaldoAnterior:= ContaCorrenteDominio.RetornaSaldoAtual(qrychama_lancamentoCodigo_Conta.AsInteger);
          LancamentoBancario.SaldoAtual:= ContaCorrenteDominio.RetornaNovoSaldo(qrychama_lancamentoCodigo_Conta.AsInteger, qrychama_lancamentoValor_Recebido.AsFloat, TipoOp, 1, Status);
          LancamentoBancario.CodigoCheque:= qrychama_lancamentoCodigo_Cheque.AsInteger;

          LancamentoBancarioDominio.Inserir(LancamentoBancario);
          LancamentoBancarioDominio.AtualizaStatusBancario(qrychama_lancamentoCodigo_Lancamento_Bancario.AsInteger, 'ESTORNADO', dm.ADOConnection1);
          LancamentoBancarioDominio.AtualizaCodigoChequeLancamentoBanco(qrychama_lancamentoCodigo_Lancamento_Bancario.AsInteger, 0, dm.ADOConnection1);
          ContaCorrenteDominio.AtualizaSaldoBancario(qrychama_lancamentoCodigo_Conta.AsInteger,
                                                     qrychama_lancamentoValor_Recebido.AsFloat,
                                                     TipoOp,
                                                     1,
                                                     Status);

          if (qrychama_lancamentoCodigo_Cheque.AsInteger <> 0) then
            Atualiza_Cheque('', 'PENDENTE', qrychama_lancamentoCodigo_Cheque.AsInteger);

        end;

        if (qrychama_lancamentoCodigo_Lancamento_Caixa.AsInteger <> 0) then
        begin
          LancamentoCaixa:= TLancamentoCaixaEntidade.Create;
          LancamentoCaixaDominio:= TLancamentoCaixaDominio.Create(dm.ADOConnection1);

          if (FrmChama_Lancamentos_Financeiros.qrychama_lancamentoTipo.AsString = 'PAGAR') then
          begin
            Tipo:= '-';
            TipoOp:= 'DÉBITO';
            TipoDoc:= 'PAGAS';

            LancamentoCaixa.TipoDocumento:= 'PAGAS';
            LancamentoCaixa.Tipo:= '-';
          end
          else
          begin
            Tipo:= '+';
            TipoOp:= 'CRÉDITO';
            TipoDoc:= 'RECEBIDAS';

            LancamentoCaixa.TipoDocumento:= 'RECEBIDAS';
            LancamentoCaixa.Tipo:= '+';
          end;

          LancamentoCaixa.Codigo:= 0;
          LancamentoCaixa.CodigoEmpresa:= UDeclaracao.Codigo_Empresa;
          LancamentoCaixa.CodigoCaixa:= codigo_usu;
          LancamentoCaixa.CodigoUsuario:= codigo_usu;
          LancamentoCaixa.FormaPagamento:= qrychama_lancamentoCond_Pag.AsString;

          LancamentoCaixa.Valor:= qrychama_lancamentoValor_Recebido.AsFloat;
          LancamentoCaixa.Troco:= 0;
          LancamentoCaixa.Data:= date;

          LancamentoCaixa.Status:= 'ESTORNADO';
          LancamentoCaixa.Acerto:= 0;
          LancamentoCaixa.Movimenta:= 0;
          LancamentoCaixa.NDocumento:= qrychama_lancamentoN_Documento.AsInteger;
          LancamentoCaixa.Parcela:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoParcela.AsInteger;
          LancamentoCaixa.Descricao:= 'ESTORNO DE VALOR DO CAIXA';
          LancamentoCaixa.CodigoConta:= 0;
          LancamentoCaixa.CodigoOperacao:= 0;
          LancamentoCaixa.Transferencia:= 1;
          LancamentoCaixa.CodigoLancamentoBanco:= 0;
          LancamentoCaixa.SaldoAnterior:= LancamentoCaixaDominio.RetornaSaldoAtual(codigo_usu);
          LancamentoCaixa.SaldoAtual:= LancamentoCaixaDominio.RetornaNovoSaldo(codigo_usu, qrychama_lancamentoValor_Recebido.AsFloat, TipoOp, 1);

          LancamentoCaixaDominio.Inserir(LancamentoCaixa);
          LancamentoCaixaDominio.AtualizaSaldoCaixa(codigo_usu, qrychama_lancamentoValor_Recebido.AsFloat, TipoOp, 1);
          LancamentoCaixaDominio.AtualizaStatusLancamentoCaixa(qrychama_lancamentoCodigo_Lancamento_Caixa.AsInteger, 'ESTORNADO', dm.ADOConnection1);
        end;

        with qAux, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('Delete from Parcelas_Lancamentos_Historico where Codigo_Registro = :Codigo_Registro');
          Parameters.ParamByName('Codigo_Registro').Value:= qrychama_lancamentoCodigo_Registro.AsInteger;
          ExecSQL;
        end;

      finally
        FreeAndNil(qAux);
        FreeAndNil(qAux2);
      end;

      Processo_Concluido;
      FrmChama_Lancamentos_Financeiros.qrychama_lancamento.Close;
      FrmChama_Lancamentos_Financeiros.qrychama_lancamento.Open;
      close;
    end;
end;

procedure TFrmEscolha_Parcela_Estorno.BBtnSairClick(Sender: TObject);
begin
  close;
  //FrmEscolha_Parcela_Estorno := Nil;
end;

procedure TFrmEscolha_Parcela_Estorno.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmEscolha_Parcela_Estorno.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) then
  begin
    if (Confirma_Exclusao) then
    begin
      Deleta_Parcela;
      Atualiza_Query;
      Application.MessageBox('Por favor, vá até a janela de Lançamento Financeiro para alterar o Valor Restante e o Valor Pago', 'Atenção', MB_OK+MB_ICONQUESTION);
    end;
  end;
end;

procedure TFrmEscolha_Parcela_Estorno.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmEscolha_Parcela_Estorno.Release;
//  FrmEscolha_Parcela_Estorno:= nil;
end;

procedure TFrmEscolha_Parcela_Estorno.FormCreate(Sender: TObject);
begin
  Atualiza_Query;
end;

procedure TFrmEscolha_Parcela_Estorno.imprime(pForm: TForm);
begin
  pForm := TForm.Create(self);
  pForm.Print;
  pForm.Release;
  pForm := Nil;
end;

end.
