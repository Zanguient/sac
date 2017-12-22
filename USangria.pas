unit USangria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,  ComCtrls, ToolWin, ImgList, UGeral, URegistro;

type
  TFrmSangria = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    Label1: TLabel;
    EdtValor: TEdit;
    Label2: TLabel;
    EdtForma_Pagamento: TEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure EdtForma_PagamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtValorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtForma_PagamentoDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Util: UGeral.TUtil;
    R06: URegistro.TR06;
    R07: URegistro.TR07;
    Fechamento: URegistro.TFechamento_Venda;
    flagfiscal: integer;
    procedure Coleta_Dados_R07;
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmSangria: TFrmSangria;

implementation

uses UMenu_Geral, UDeclaracao, UDM, UChama_Condicao_Pagamento;

{$R *.dfm}

procedure TFrmSangria.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmSangria.BBtnSalvarClick(Sender: TObject);
var
  valor: AnsiString;
begin
  Verifica_Erros_Ao_Gerar_Cupom;
  if (flagfiscal = 8) then
     Application.MessageBox('Impossível continuar, pois já houve redução Z no dia corrente','Atenção',MB_ICONHAND)
  else if (EdtValor.Text = '') or (EdtValor.Text = '0,00') or (EdtValor.Text = '0') or (EdtForma_Pagamento.Text = '') then
    Mensagem_Falta_Dados
  else if (Application.MessageBox('Deseja realizar sangria no caixa?', 'Atenção', MB_YESNO+MB_ICONQUESTION)) = idyes then
  begin
    valor:= FormatFLoat('#0.0,0', StrToFloat(EdtValor.Text));
    ECF.Sangria(valor, EdtForma_Pagamento.Text);
    den_op:= 'CN';
    Registra_R06;

    Coleta_Dados_R07;
    R07.Inserir_Outros(R07);
    R07.Inserir_Outros_Aux(R07);

    Fechamento.Salva_Conta(0, UDeclaracao.codigo_empresa, UDeclaracao.codigo_caixa, UDeclaracao.codigo_usu, 0, 0, 0, 0, EdtForma_Pagamento.Text, 'SANGRIA', 'PAGO', '-', StrToFloat(EdtValor.Text), 0, date);

    UDeclaracao.Insere_Historico(usuario, 'REALIZOU SANGRIA PELO ECF.', TimeToStr(time), consu, date);
    Processo_Concluido;
  end;
end;

procedure TFrmSangria.Coleta_Dados_R07;
begin
  //CapturaContadoresECF;
  ECF.Pega_Contadores;

  UDeclaracao.forma_pg:= EdtForma_Pagamento.Text;
  UDeclaracao.valor_pag:= EdtValor.Text;

  UDeclaracao.indicador_estorno:= 'N';
  UDeclaracao.valor_estorno:= '0';
end;

procedure TFrmSangria.EdtForma_PagamentoDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
  FrmChama_Condicao_Pagamento.ShowModal;
  FrmChama_Condicao_Pagamento.Free;
end;

procedure TFrmSangria.EdtForma_PagamentoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
    FrmChama_Condicao_Pagamento.ShowModal;
    FrmChama_Condicao_Pagamento.Free;
  end;
end;

procedure TFrmSangria.EdtValorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmSangria.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmSangria.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmSangria.Free;
  FrmSangria:= Nil;
end;

procedure TFrmSangria.FormCreate(Sender: TObject);
begin
  Verifica_Erros_Ao_Gerar_Cupom;
end;

procedure TFrmSangria.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmSangria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f2) then
  begin
    bbtnSalvar.Enabled:= true;
  end;
end;

procedure TFrmSangria.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
