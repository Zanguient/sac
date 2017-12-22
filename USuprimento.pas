unit USuprimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, UGeral, URegistro;

type
  TFrmSuprimento = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    Label1: TLabel;
    EdtValor: TEdit;
    EdtForma_Pagamento: TEdit;
    Label2: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure EdtValorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtForma_PagamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtForma_PagamentoDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Util: UGeral.TUtil;
    flagfiscal: integer;
    R07: TR07;
    Fechamento: URegistro.TFechamento_Venda;
    procedure Coleta_Dados_R07;
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmSuprimento: TFrmSuprimento;

implementation

uses UMenu_Geral, UDeclaracao, UDM, UChama_Condicao_Pagamento;

{$R *.dfm}

procedure TFrmSuprimento.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmSuprimento.BBtnSalvarClick(Sender: TObject);
var
  valor, forma: Ansistring;
begin
  Verifica_Erros_Ao_Gerar_Cupom;
  if (flagfiscal = 8) then
     Application.MessageBox('Impossível continuar, pois já houve redução Z no dia corrente','Atenção',MB_ICONHAND)
  else if (EdtForma_Pagamento.Text = '') or (EdtValor.Text = '') or (EdtValor.Text = '0,00') or (EdtValor.Text = '0') then
    Mensagem_Falta_Dados
  else if (Application.MessageBox('Deseja realizar suprimento de caixa?', 'Atenção', MB_YESNO+MB_ICONQUESTION)) = idyes then
  begin
    valor:= FormatFloat('#0.0,0', StrToFloat(EdtValor.Text));
    forma:= EdtForma_Pagamento.Text;
    ECF.Suprimento(valor, forma);
    den_op:= 'CN';
    Registra_R06;

    Coleta_Dados_R07;
    R07.Inserir_Outros(R07);
    R07.Inserir_Outros_Aux(R07);

    Fechamento.Salva_Conta(0, UDeclaracao.codigo_empresa, UDeclaracao.codigo_caixa, UDeclaracao.codigo_usu, 0, 0, 0, 0, EdtForma_Pagamento.Text, 'SUPRIMENTO', 'PAGO', '+', StrToFloat(EdtValor.Text), 0, date);

    UDeclaracao.Insere_Historico(usuario, 'REALIZOU SUPRIMENTO PELO ECF.', TimeToStr(time), consu, date);
    Processo_Concluido;
  end;
end;

procedure TFrmSuprimento.Coleta_Dados_R07;
begin
  //CapturaContadoresECF;
  ECF.Pega_Contadores;

  UDeclaracao.forma_pg:= EdtForma_Pagamento.Text;
  UDeclaracao.valor_pag:= EdtValor.Text;

  UDeclaracao.indicador_estorno:= 'N';
  UDeclaracao.valor_estorno:= '0';
end;

procedure TFrmSuprimento.EdtForma_PagamentoDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
  FrmChama_Condicao_Pagamento.ShowModal;
  FrmChama_Condicao_Pagamento.Free;
end;

procedure TFrmSuprimento.EdtForma_PagamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
    FrmChama_Condicao_Pagamento.ShowModal;
    FrmChama_Condicao_Pagamento.Free;
  end;
end;

procedure TFrmSuprimento.EdtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', ',',#08]) then
    key := #0
end;

procedure TFrmSuprimento.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmSuprimento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmSuprimento.Free;
  FrmSuprimento:= Nil;
end;

procedure TFrmSuprimento.FormCreate(Sender: TObject);
begin
  Verifica_Erros_Ao_Gerar_Cupom;
end;

procedure TFrmSuprimento.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmSuprimento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f2) then
  begin
    bbtnSalvar.Enabled:= true;
  end;
end;

procedure TFrmSuprimento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
