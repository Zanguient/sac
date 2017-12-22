unit UAltera_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, UGeral, URegistro;

type
  TFrmAltera_Caixa = class(TForm)
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    Label1: TLabel;
    EdtValor: TEdit;
    EdtForma_Pagamento: TEdit;
    Label2: TLabel;
    EdtCodigo_Forma_Pagamento: TEdit;
    Label3: TLabel;
    EdtCaixa: TEdit;
    EdtCodigo_Caixa: TEdit;
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
  private
    Util: UGeral.TUtil;
    R07: URegistro.TR07;
    Fechamento: URegistro.TFechamento_Venda;
    Abertura: URegistro.TAbertura_Caixa;
    procedure Coleta_Dados_R07;
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmAltera_Caixa: TFrmAltera_Caixa;

implementation

uses UMenu_Geral, UDeclaracao, UChama_Condicao_Pagamento, UChama_Caixa;

{$R *.dfm}

procedure TFrmAltera_Caixa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmAltera_Caixa.BBtnSalvarClick(Sender: TObject);
var
  valor, forma: Ansistring;
begin
  if (EdtCodigo_Forma_Pagamento.Text = '') or (EdtCodigo_Caixa.Text = '') or (EdtValor.Text = '') or (EdtValor.Text = '0,00') or (EdtValor.Text = '0') then
  begin
    Mensagem_Falta_Dados;
    abort;
  end;

  if (Application.MessageBox('Deseja realizar a alteração de caixa?', 'Atenção', MB_YESNO+MB_ICONQUESTION)) = idyes then
  begin
    valor:= FormatFLoat('#0.0,0', StrToFloat(EdtValor.Text));
    forma:= EdtForma_Pagamento.Text;

    iRetorno:= Bematech_FI_Suprimento(PAnsiChar(valor), PAnsiChar(forma));
    Analisa_iRetorno;
    den_op:= 'CN';
    Registra_R06;

    Coleta_Dados_R07;
    R07.Inserir_Outros(R07);
    R07.Inserir_Outros_Aux(R07);
    Abertura.Inserir(Abertura);
    Fechamento.Salva_Conta(0, UDeclaracao.codigo_empresa, StrToInt(EdtCodigo_Caixa.Text), UDeclaracao.codigo_usu, 0, 0, 0, 0, EdtForma_Pagamento.Text, 'SUPRIMENTO', 'PAGO', '+', StrToFloat(EdtValor.Text), 0, date);

    UDeclaracao.Insere_Historico(usuario, 'REALIZOU TROCA DE CAIXA NO VALOR DE ' + EdtValor.Text + ' REAIS.', TimeToStr(time), insercao, date);
    UDeclaracao.codigo_caixa:= StrToInt(EdtCodigo_Caixa.Text);
    FrmMenu_Geral.StbStatus.Panels[5].Text:= 'Caixa - ' + EdtCaixa.Text;
    BBtnSalvar.Enabled:= false;
    Processo_Concluido;
  end;
end;

procedure TFrmAltera_Caixa.Coleta_Dados_R07;
var
  iConta: integer;
begin
  //Captura_Numero_Caixa;
  ECF.Pega_Numero_Caixa;
  //CapturaContadoresECF;
  ECF.Pega_Contadores;

  UDeclaracao.forma_pg:= EdtForma_Pagamento.Text;
  UDeclaracao.valor_pag:= EdtValor.Text;

  UDeclaracao.indicador_estorno:= 'N';
  UDeclaracao.valor_estorno:= '0';
end;

procedure TFrmAltera_Caixa.EdtCodigo_CaixaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Caixa, FrmChama_Caixa);
      FrmChama_Caixa.ShowModal;
      FrmChama_Caixa.Free;
    end;
end;

procedure TFrmAltera_Caixa.EdtCodigo_Forma_PagamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
    FrmChama_Condicao_Pagamento.ShowModal;
    FrmChama_Condicao_Pagamento.Free;
  end;
end;

procedure TFrmAltera_Caixa.EdtCodigo_Forma_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmAltera_Caixa.EdtForma_PagamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmAltera_Caixa.EdtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', ',',#08]) then
    key := #0
end;

procedure TFrmAltera_Caixa.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmAltera_Caixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmAltera_Caixa.Free;
  FrmAltera_Caixa:= Nil;
end;

procedure TFrmAltera_Caixa.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmAltera_Caixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f2) then
  begin
    bbtnSalvar.Enabled:= true;
  end;
end;

procedure TFrmAltera_Caixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
