unit UConciliacao_Bancaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, URegistro;

type
  TFrmConciliacao_Bancaria = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    LblMarca: TLabel;
    qryconciliacao_bancaria: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    ImgImagens: TImageList;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnLimpar: TToolButton;
    BBtnConciliar: TToolButton;
    BBtnImprimir: TToolButton;
    BBtnFechar: TToolButton;
    BBtnEstornar: TToolButton;
    RGStatus: TRadioGroup;
    SPAtualiza_Status_Bancario: TADOStoredProc;
    SPAtualiza_Saldo_Bancario: TADOStoredProc;
    qryconciliacao_bancariaCodigo: TAutoIncField;
    qryconciliacao_bancariaCodigo_Empresa: TIntegerField;
    qryconciliacao_bancariaN_Documento: TIntegerField;
    qryconciliacao_bancariaData_Lancamento: TDateTimeField;
    qryconciliacao_bancariaCodigo_Conta: TIntegerField;
    qryconciliacao_bancariaCodigo_Operacao: TIntegerField;
    qryconciliacao_bancariaCodigo_Plano: TIntegerField;
    qryconciliacao_bancariaDescricao: TStringField;
    qryconciliacao_bancariaValor: TFloatField;
    qryconciliacao_bancariaStatus: TStringField;
    qryconciliacao_bancariaConta: TStringField;
    qryconciliacao_bancariaOperacao: TStringField;
    qryconciliacao_bancariaTipo: TStringField;
    qryconciliacao_bancariaPlano: TStringField;
    qryconciliacao_bancariaSaldo_Anterior: TFloatField;
    qryconciliacao_bancariaSaldo_Atual: TFloatField;
    qryconciliacao_bancariaCodigo_Cheque: TIntegerField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BBtnLimparClick(Sender: TObject);
    procedure BBtnConciliarClick(Sender: TObject);
    procedure BBtnEstornarClick(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    Fechamento: URegistro.TFechamento_Venda;

    procedure Deleta_Movimento_Banco(Documento: integer);
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConciliacao_Bancaria: TFrmConciliacao_Bancaria;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UEscolha_Impressao, URel_Conciliacao_Bancaria, UDeclaracao,
  Modelo.Dominio.TLancamentoBancarioDominio,
  Modelo.Dominio.TContaCorrenteDominio, Modelo.Entidade.TContaCorrente,
  Modelo.Entidade.TOperacaoBancaria,
  Modelo.Entidade.TLancamentoBancarioEntidade, Modelo.Dominio.TCaixaDiario;

{$R *.dfm}

procedure TFrmConciliacao_Bancaria.BBtnConciliarClick(Sender: TObject);
var
  saldo: double;
  LancamentoBancarioDominio: TLancamentoBancarioDominio;
  ContaCorrenteDominio: TContaCorrenteDominio;
  ContaCorrente: TContaCorrenteEntidade;
  OperacaoBancaria: TOperacaoBancariaEntidade;
  LancamentoBancario: TLancamentoBancarioEntidade;
begin
  if (DBGrid1.SelectedRows.Count = 0) then
  begin
    Item_Selecionado_DBGrid;
    exit;
  end;

  if Confirma_Processo then
  begin
    try
      qryconciliacao_bancaria.First;
      while not qryconciliacao_bancaria.Eof do
      begin
        if (DBGrid1.SelectedRows.CurrentRowSelected) then
        begin
          ContaCorrenteDominio:= TContaCorrenteDominio.Create(dm.ADOConnection1);
          LancamentoBancario:= TLancamentoBancarioEntidade.Create;
          LancamentoBancarioDominio:= TLancamentoBancarioDominio.Create(dm.ADOConnection1);

          LancamentoBancario.Codigo_Empresa:= qryconciliacao_bancariaCodigo_Empresa.AsInteger;
          LancamentoBancario.N_Documento:= qryconciliacao_bancariaN_Documento.AsInteger;
          LancamentoBancario.Data_Lancamento:= date;
          LancamentoBancario.Codigo_Conta:= qryconciliacao_bancariaCodigo_Conta.AsInteger;
          LancamentoBancario.Codigo_Operacao:= qryconciliacao_bancariaCodigo_Operacao.AsInteger;
          LancamentoBancario.Codigo_Plano:= qryconciliacao_bancariaCodigo_Plano.AsInteger;

          LancamentoBancario.Descricao:= 'LIBERAÇÃO DE VALOR BLOQUEADO';
          LancamentoBancario.Valor:= qryconciliacao_bancariaValor.AsFloat;
          LancamentoBancario.Status:= 'LIBERADO';

          LancamentoBancario.SaldoAnterior:= ContaCorrenteDominio.RetornaSaldoAtual(qryconciliacao_bancariaCodigo_Conta.AsInteger);
          LancamentoBancario.SaldoAtual:= ContaCorrenteDominio.RetornaNovoSaldo(qryconciliacao_bancariaCodigo_Conta.AsInteger, qryconciliacao_bancariaValor.AsFloat, qryconciliacao_bancariaTipo.AsString, 0, 1);

          LancamentoBancario.CodigoCheque:= qryconciliacao_bancariaCodigo_Cheque.AsInteger;
          LancamentoBancario.Transferencia:= 1;

          LancamentoBancarioDominio.Inserir(LancamentoBancario);
          LancamentoBancarioDominio.AtualizaStatusBancario(qryconciliacao_bancariaCodigo.AsInteger, 'LIBERADO', dm.ADOConnection1);
          ContaCorrenteDominio.AtualizaSaldoBancario(qryconciliacao_bancariaCodigo_Conta.AsInteger, qryconciliacao_bancariaValor.AsFloat, qryconciliacao_bancariaTipo.AsString, 0, 1);

          if (RGStatus.ItemIndex = 0) then
          begin
            if (qryconciliacao_bancariaTipo.AsString = 'CRÉDITO') then
            begin
              tipo:= '+';
              Fechamento.Salva_Conta(0, UDeclaracao.codigo_empresa, UDeclaracao.codigo_caixa, UDeclaracao.codigo_usu, 0, 1, qryconciliacao_bancariaN_Documento.AsInteger, 1, 'DINHEIRO', 'RECEB. - BANCO', 'PAGO', tipo, qryconciliacao_bancariaValor.AsFloat, 0, date)
            end
            else
            begin
              tipo:= '-';
              Fechamento.Salva_Conta(0, UDeclaracao.codigo_empresa, UDeclaracao.codigo_caixa, UDeclaracao.codigo_usu, 0, 1, qryconciliacao_bancariaN_Documento.AsInteger, 1, 'DINHEIRO', 'PAGAS - BANCO', 'PAGO', tipo, qryconciliacao_bancariaValor.AsFloat, 0, date);
            end;
          end;

          qryconciliacao_bancaria.Next;
        end
        else
          qryconciliacao_bancaria.Next;
      end;
    except on E: Exception do
    begin

    end;
    end;
    Application.MessageBox('Registros conciliados com sucesso', 'Alteração Efetuada', MB_OK+MB_ICONQUESTION);
    qryconciliacao_bancaria.Close;
    qryconciliacao_bancaria.Open;
    UDeclaracao.Insere_Historico(usuario, 'REALIZOU CONCILIAÇÃO BANCÁRIA.', TimeToStr(time), alteracao, date);
  end;
end;

procedure TFrmConciliacao_Bancaria.BBtnEstornarClick(Sender: TObject);
var
  saldo: double;
  LancamentoBancarioDominio: TLancamentoBancarioDominio;
  ContaCorrenteDominio: TContaCorrenteDominio;
  CaixaDiarioDominio: TCaixaDiarioDominio;
  LancamentoBancario: TLancamentoBancarioEntidade;
begin
  if (DBGrid1.SelectedRows.Count = 0) then
  begin
    Application.MessageBox('É necessário informar pelo menos um lançamento', 'FAV Sistemas', MB_OK+MB_ICONHAND);
    Exit;
  end;

  if (Application.MessageBox('Confirma o estorno dos registros selecionados?', 'Confirmação', MB_YESNO+MB_ICONQUESTION)) = idyes then
  begin
    try
      qryconciliacao_bancaria.First;
      while not qryconciliacao_bancaria.Eof do
      begin
        if (DBGrid1.SelectedRows.CurrentRowSelected) then
        begin
          LancamentoBancarioDominio:= TLancamentoBancarioDominio.Create(dm.ADOConnection1);
          ContaCorrenteDominio:= TContaCorrenteDominio.Create(dm.ADOConnection1);
          //CaixaDiarioDominio:= TCaixaDiarioDominio.Create(dm.ADOConnection1);
          LancamentoBancario:= TLancamentoBancarioEntidade.Create;

          LancamentoBancario.Codigo_Empresa:= qryconciliacao_bancariaCodigo_Empresa.AsInteger;
          LancamentoBancario.N_Documento:= qryconciliacao_bancariaN_Documento.AsInteger;
          LancamentoBancario.Data_Lancamento:= date;
          LancamentoBancario.Codigo_Conta:= qryconciliacao_bancariaCodigo_Conta.AsInteger;
          LancamentoBancario.Codigo_Operacao:= qryconciliacao_bancariaCodigo_Operacao.AsInteger;
          LancamentoBancario.Codigo_Plano:= qryconciliacao_bancariaCodigo_Plano.AsInteger;
          LancamentoBancario.Descricao:= 'ESTORNO DE VALOR LIBERADO';
          LancamentoBancario.Valor:= qryconciliacao_bancariaValor.AsFloat;
          LancamentoBancario.Status:= 'LIBERADO';
          LancamentoBancario.SaldoAnterior:= ContaCorrenteDominio.RetornaSaldoAtual(qryconciliacao_bancariaCodigo_Conta.AsInteger);
          LancamentoBancario.SaldoAtual:= ContaCorrenteDominio.RetornaNovoSaldo(qryconciliacao_bancariaCodigo_Conta.AsInteger, qryconciliacao_bancariaValor.AsFloat, qryconciliacao_bancariaTipo.AsString, 1, 1);
          LancamentoBancario.CodigoCheque:= 0;

          //ESTORNA SOMENTE OS LIBERADOS. LOGO, NÃO PRECISA SABER SE O LANÇAMENTO ESTÁ BLOQUEADO, POIS JÁ VAI ESTAR LIBERADO.
          LancamentoBancarioDominio.Inserir(LancamentoBancario);
          LancamentoBancarioDominio.AtualizaStatusBancario(qryconciliacao_bancariaCodigo.AsInteger, 'BLOQUEADO', dm.ADOConnection1);
          LancamentoBancarioDominio.AtualizaCodigoChequeLancamentoBanco(qryconciliacao_bancariaCodigo.AsInteger, 0, dm.ADOConnection1);
          ContaCorrenteDominio.AtualizaSaldoBancario(qryconciliacao_bancariaCodigo_Conta.AsInteger,
                                                      qryconciliacao_bancariaValor.AsFloat,
                                                      qryconciliacao_bancariaTipo.AsString,
                                                      1,
                                                      1);

          {CaixaDiarioDominio.DeletaCaixa(qryconciliacao_bancariaN_Documento.AsInteger,
                                         qryconciliacao_bancariaValor.AsString,
                                         1); }

          if (qryconciliacao_bancariaCodigo_Cheque.AsInteger <> 0) then
          begin
            Atualiza_Cheque( '', 'PENDENTE', qryconciliacao_bancariaCodigo_Cheque.AsInteger);
          end;

          qryconciliacao_bancaria.Next;
        end
        else
          qryconciliacao_bancaria.Next;
      end;

    except
      on E: Exception do
      begin
        //DM.ADOConnection1.RollbackTrans;
      end;
    end;
      Application.MessageBox('Registros conciliados com sucesso', 'Alteração Efetuada', MB_OK+MB_ICONQUESTION);
      qryconciliacao_bancaria.Close;
      qryconciliacao_bancaria.Open;
  end;
end;

procedure TFrmConciliacao_Bancaria.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConciliacao_Bancaria.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Lancamento_Conciliacao(EdtConsulta.Text);
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
  if (RGStatus.ItemIndex = 0) then
  begin
    BBtnEstornar.Enabled:= false;
    BBtnConciliar.Enabled:= true;
  end
  else
  begin
    BBtnEstornar.Enabled:= true;
    BBtnConciliar.Enabled:= false;
  end;
end;

procedure TFrmConciliacao_Bancaria.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Conciliacao_Bancaria:= TFrmRel_Conciliacao_Bancaria.Create(self);
  FrmRel_Conciliacao_Bancaria.Release;
  FrmRel_Conciliacao_Bancaria:= Nil;
end;

procedure TFrmConciliacao_Bancaria.BBtnLimparClick(Sender: TObject);
begin
  qryconciliacao_bancaria.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  BBtnEstornar.Enabled:= false;
  BBtnConciliar.Enabled:= false;
  BBtnConciliar.Enabled:= false;
  EdtConsulta.SetFocus;
end;

procedure TFrmConciliacao_Bancaria.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConciliacao_Bancaria.DBGrid1TitleClick(Column: TColumn);
begin
  Util.Ordena_Grid(qryconciliacao_bancaria, Column);
end;

procedure TFrmConciliacao_Bancaria.Deleta_Movimento_Banco(Documento: integer);
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('delete from Fechamento_Venda where N_Documento = :Documento');
      Parameters.ParamByName('Documento').Value:= Documento;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmConciliacao_Bancaria.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    Consulta.Chama_Lancamento_Conciliacao(EdtConsulta.Text);
end;

procedure TFrmConciliacao_Bancaria.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConciliacao_Bancaria.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConciliacao_Bancaria.Free;
  FrmConciliacao_Bancaria:= nil;
end;

procedure TFrmConciliacao_Bancaria.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConciliacao_Bancaria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
