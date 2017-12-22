unit UAbertura_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, UGeral, URegistro;

type
  TFrmAbertura_Caixa = class(TForm)
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    Label1: TLabel;
    EdtValor: TEdit;
    BBtnNovo: TToolButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure EdtValorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Forma_PagamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtForma_PagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Forma_PagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CaixaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtCodigo_CaixaKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnNovoClick(Sender: TObject);
  private
    Util: UGeral.TUtil;
    Abertura: URegistro.TAbertura_Caixa;
    Fechamento: URegistro.TFechamento_Venda;
    flagfiscal: integer;
    R07: TR07;
    procedure Coleta_Dados_R07;
    { Private declarations }
  public
    ativo: boolean;
    md5e3 : AnsiString;
    { Public declarations }
  end;

var
  FrmAbertura_Caixa: TFrmAbertura_Caixa;

implementation

uses UMenu_Geral, UDeclaracao, UChama_Condicao_Pagamento, UChama_Caixa, UDM,
  Util.TLog, Modelo.Dominio.TLancamentoCaixaDominio;

{$R *.dfm}

procedure TFrmAbertura_Caixa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmAbertura_Caixa.BBtnNovoClick(Sender: TObject);
var
  LancamentoCaixaDominio: TLancamentoCaixaDominio;
  SaldoAtual: Double;
begin
  if (tipo_local = '0101') then
    Verifica_Erros_Ao_Gerar_Cupom;

  BBtnSalvar.Enabled:= true;
  LancamentoCaixaDominio:= TLancamentoCaixaDominio.Create(dm.ADOConnection1);
  SaldoAtual:= LancamentoCaixaDominio.RetornaSaldoAtual(codigo_usu);
  Util.FormataFloat(2, EdtValor, SaldoAtual);
end;

procedure TFrmAbertura_Caixa.BBtnSalvarClick(Sender: TObject);
var
  valor, forma: Ansistring;
  timeout : Integer;
  data: TDate;
  hora: AnsiString;
begin
  try
    try
      timeout := Dm.ACBrECF1.TimeOut;
      if (Application.MessageBox('Deseja realizar a abertura do caixa?', 'Atenção', MB_YESNO+MB_ICONQUESTION)) = idyes then
      begin
        valor:= FormatFLoat('#0.0,0', StrToFloat(EdtValor.Text));
        valor:= StringReplace(valor, ThousandSeparator, '', [rfReplaceAll]);
        forma:= 'Dinheiro';

        if (tipo_local = '0101') then begin
          //Verifica_Status_Impressora;

          ECF.Abre_Movimento(valor, forma);
          Dm.ACBrECF1.TimeOut := 100;
          den_op:= 'CN';
          Registra_R06;

          data := date;
          hora := FormatDateTime('hh:mm:ss', now);
          md5e3 :=  GeraMD5([DateToStr(data), hora, nu_serie]);
          InserirE3(UDeclaracao.nu_serie, UDeclaracao.mf, 'ECF-IF', 'BEMATECH', UDeclaracao.sModelo, md5e3, data, hora);
          Coleta_Dados_R07;
          R07.Inserir_Outros(R07);
          //R07.Inserir_Outros_Aux(R07);
          ECF.Pega_Data_Hora_GravacaoSWBasicoMFAdicional;
        end;

        Fechamento.Salva_Conta(0, UDeclaracao.codigo_empresa, UDeclaracao.codigo_usu, UDeclaracao.codigo_usu, 0, 0, 0, 0, forma, 'SUPRIMENTO', 'PAGO', '+', StrToFloat(EdtValor.Text), 0, date);

        UDeclaracao.Insere_Historico(usuario, 'REALIZOU ABERTURA DE CAIXA NO VALOR DE ' + EdtValor.Text + ' REAIS.', TimeToStr(time), insercao, date);
        UDeclaracao.codigo_caixa:= UDeclaracao.codigo_usu;
        Abertura.Inserir(Abertura);
        BBtnSalvar.Enabled:= false;
        Habilitado:= true;
        Houve_Reducao:= false;
        UDeclaracao.Pega_Caixa;
        Processo_Concluido;

      end;
    except
       on E : Exception do
        TLog.Error(Self.ClassName+' - BBtnSalvarClick - '+E.Message);
    end;
  finally
    Dm.ACBrECF1.TimeOut := timeout;
  end;
end;

procedure TFrmAbertura_Caixa.Coleta_Dados_R07;
var
  iConta: integer;
begin
  ECF.Pega_Numero_Caixa;
  //CapturaContadoresECF;
  ECF.Pega_Contadores;

  UDeclaracao.forma_pg:= 'DINHEIRO';
  UDeclaracao.valor_pag:= EdtValor.Text;

  UDeclaracao.indicador_estorno:= 'N';
  UDeclaracao.valor_estorno:= '0';
end;

procedure TFrmAbertura_Caixa.EdtCodigo_CaixaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Caixa, FrmChama_Caixa);
      FrmChama_Caixa.ShowModal;
      FrmChama_Caixa.Free;
    end;
end;

procedure TFrmAbertura_Caixa.EdtCodigo_CaixaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmAbertura_Caixa.EdtCodigo_Forma_PagamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
    FrmChama_Condicao_Pagamento.ShowModal;
    FrmChama_Condicao_Pagamento.Free;
  end;
end;

procedure TFrmAbertura_Caixa.EdtCodigo_Forma_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmAbertura_Caixa.EdtForma_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmAbertura_Caixa.EdtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', ',',#08]) then
    key := #0
end;

procedure TFrmAbertura_Caixa.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmAbertura_Caixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmAbertura_Caixa.Free;
  FrmAbertura_Caixa:= Nil;
end;

procedure TFrmAbertura_Caixa.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmAbertura_Caixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f2) then
  begin
    bbtnSalvar.Enabled:= true;
  end;
end;

procedure TFrmAbertura_Caixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
