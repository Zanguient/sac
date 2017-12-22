unit UMensagem_Sistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, ToolWin, ImgList, StdCtrls, ExtCtrls, DateUtils;

type
  TFrmMensagem_Sistema = class(TForm)
    ImgImagens: TImageList;
    ToolBar1: TToolBar;
    BBtnFechar: TToolButton;
    BBtnImprimir: TToolButton;
    Label1: TLabel;
    LblTotal: TLabel;
    RichEdit1: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBtnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMensagem_Sistema: TFrmMensagem_Sistema;

implementation

uses URel_Mensagem_Sistema, UDeclaracao;


{$R *.dfm}

procedure TFrmMensagem_Sistema.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmMensagem_Sistema.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Mensagem_Sistema:= TFrmRel_Mensagem_Sistema.Create(self);
  FrmRel_Mensagem_Sistema.Release;
  FrmRel_Mensagem_Sistema:= Nil;
  {Application.CreateForm(TFrmRel_Mensagem_Sistema, FrmRel_Mensagem_Sistema);
  FrmRel_Mensagem_Sistema.QuickRep1.Preview;
  FrmRel_Mensagem_Sistema.Free;}
end;

procedure TFrmMensagem_Sistema.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmMensagem_Sistema.Free;
  FrmMensagem_Sistema:= Nil;
end;

procedure TFrmMensagem_Sistema.FormCreate(Sender: TObject);
begin
  RichEdit1.Lines.Clear;

  if (tabela_preco <> '') then
    RichEdit1.Lines.Add(tabela_preco);

  if (lancamento_financeiro <> '') then
    RichEdit1.Lines.Add(lancamento_financeiro);

  if (cheque <> '') then
    RichEdit1.Lines.Add(cheque);

  if (pedido_compra <> '') then
    RichEdit1.Lines.Add(pedido_compra);

  if (aniversario_cliente <> '') then
    RichEdit1.Lines.Add(aniversario_cliente);

  if (aniversario_funcionario <> '') then
    RichEdit1.Lines.Add(aniversario_funcionario);

  if (produto_vencido <> '') then
    RichEdit1.Lines.Add(produto_vencido);

  if (conta_fixa <> '') then
    RichEdit1.Lines.Add(conta_fixa);

  if (cotacao_preco <> '') then
    RichEdit1.Lines.Add(cotacao_preco);

  if (pedido_pendente <> '') then
    RichEdit1.Lines.Add(pedido_pendente);

    {if (achou_contas_pagar_maior = true) then
    begin
      if (resul_contas_pagar_maior <> 0) then
        begin
          RichEdit1.Lines.Add('Há lançamentos financeiros no sistema maior ou igual a ' + FloatToStr(valor_conta_maior) + ', que vencerá em '+ IntToStr(resul_contas_pagar_maior) + ' dia(s).');
          RichEdit1.Lines.Add('');
        end
        else
        begin
          RichEdit1.Lines.Add('Há lançamentos financeiros no sistema maior ou igual a ' + FloatToStr(valor_conta_maior) + ', que vencerá hoje, dia ' + DateToStr(date) + '.');
          RichEdit1.Lines.Add('');
        end;
        i:= i + 1;
    end;

  if (achou_planejamento = true) then
    begin
      if (resul_contas_fixas <> 0) then
        begin
          RichEdit1.Lines.Add('Há Contas a ser(em) paga(s) em função de um pagamento fixo mensal em ' + IntToStr(resul_contas_fixas) + ' dia(s).');
          RichEdit1.Lines.Add('');
        end
        else
        begin
          RichEdit1.Lines.Add('Há Contas a ser(em) paga(s) em função de um pagamento fixo mensal hoje, dia ' + DateToStr(date) + '.');
          RichEdit1.Lines.Add('');
        end;
        i:= i + 1;
    end;

  if (achou_cheque_vencer = true) then
    begin
      if (resul_cheque_vencer <> 0) then
        begin
          RichEdit1.Lines.Add('Há Cheques cadastrados no sistema que vencerá em ' + IntToStr(resul_cheque_vencer) + ' dia(s).');
          RichEdit1.Lines.Add('');
        end
        else
        begin
          RichEdit1.Lines.Add('Há Cheques cadastrados no sistema que vencerá hoje, dia ' + DateToStr(date) + '.');
          RichEdit1.Lines.Add('');
        end;
        i:= i + 1;
    end;

  if (achou_cliente = true) then
    begin
      if (resul_cliente <> 0) then
        begin
          RichEdit1.Lines.Add('Há Clientes fazendo aniversário em ' + IntToStr(resul_cliente) + ' dia(s).');
          RichEdit1.Lines.Add('');
        end
        else
        begin
          RichEdit1.Lines.Add('Há Clientes fazendo aniversário hoje, dia ' + DateToStr(date) + '.');
          RichEdit1.Lines.Add('');
        end;
        i:= i + 1;
    end;

  if (achou_produto = true) then
    begin
      if (resul_produtos <> 0) then
        begin
          RichEdit1.Lines.Add('Há produtos que perderão seu prazo de validade em ' + IntToStr(resul_produtos) + ' dia(s).');
          RichEdit1.Lines.Add('');
        end
        else
        begin
          RichEdit1.Lines.Add('Há produtos que perderão seu prazo de validade hoje, dia ' + DateToStr(date) + '.');
          RichEdit1.Lines.Add('');
        end;
        i:= i + 1;
    end;

  if (achou_pedido_compra = true) then
    begin
      RichEdit1.Lines.Add('Há Produtos que estão programados para serem entregues hoje, dia ' + DateToStr(Date) + ', proveniente de um pedido de compra.');
      RichEdit1.Lines.Add('');
    end;

  if (achou_funcionario = true) then
    begin
      if (resul_funcionarios <> 0) then
        begin
          RichEdit1.Lines.Add('Há Funcionários fazendo aniversário em ' + IntToStr(resul_funcionarios) + ' dia(s).');
          RichEdit1.Lines.Add('');
        end
        else
        begin
          RichEdit1.Lines.Add('Há Funcionários fazendo aniversário hoje, dia ' + DateToStr(date) + '.');
          RichEdit1.Lines.Add('');
        end;
        i:= i + 1;
    end;

  if (achou_secamento = true) then
    begin
      if (resul_secamento <> 0) then
        begin
          RichEdit1.Lines.Add('Há Animais com Previsão de Secamento em ' + IntToStr(resul_secamento) + ' dia(s).');
          RichEdit1.Lines.Add('');
        end
        else
        begin
          RichEdit1.Lines.Add('Há Animais que com Previsão de Secamento para hoje, dia ' + DateToStr(date) + '.');
          RichEdit1.Lines.Add('');
        end;
        i:= i + 1;
    end;

  if (achou_paricao = true) then
    begin
      if (resul_secamento <> 0) then
        begin
          RichEdit1.Lines.Add('Há Animais com Previsão de Parição em ' + IntToStr(resul_secamento) + ' dia(s).');
          RichEdit1.Lines.Add('');
        end
        else
        begin
          RichEdit1.Lines.Add('Há Animais que com Previsão de Parição para hoje, dia ' + DateToStr(date) + '.');
          RichEdit1.Lines.Add('');
        end;
        i:= i + 1;
    end;

  if (achou_cobertura = true) then
    begin
      if (resul_secamento <> 0) then
        begin
          RichEdit1.Lines.Add('Há Animais com Previsão de Cobertura em ' + IntToStr(resul_secamento) + ' dia(s).');
          RichEdit1.Lines.Add('');
        end
        else
        begin
          RichEdit1.Lines.Add('Há Animais que com Previsão de Cobertura para hoje, dia ' + DateToStr(date) + '.');
          RichEdit1.Lines.Add('');
        end;
        i:= i + 1;
    end;

  if (achou_idade = true) then
    begin
      RichEdit1.Lines.Add('Há Animais cadastrados no sistema que se estão entre ' + IntToStr(periodo_idade_de) + ' e ' + IntToStr(periodo_idade_ate) + ' mêses de vida.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

  if (achou_aplicacao = true) then
    begin
      if (resul_aplicacao = 0) then
        begin
          RichEdit1.Lines.Add('Há aplicações programadas a ser(em) efetuada(s) hoje, dia ' + DateToStr(date) + '.');
          RichEdit1.Lines.Add('');
        end
        else
        begin
          RichEdit1.Lines.Add('Há aplicações programadas a ser(em) efetuada(s) em ' + IntToStr(resul_aplicacao) + ' dia(s).');
          RichEdit1.Lines.Add('');
        end;
        i:= i + 1;
    end;

  if (achou_dias_coberta = true) then
    begin
      if (resul_dias_coberta = 0) then
        begin
          RichEdit1.Lines.Add('Há animais que completam '+ IntToStr(n_dias_coberta) + ' dias de coberta hoje, dia ' + DateToStr(date) + '.');
          RichEdit1.Lines.Add('');
        end
        else
        begin
          RichEdit1.Lines.Add('Há animais que completarão '+ IntToStr(n_dias_coberta) + ' dias de coberta em ' + IntToStr(resul_dias_coberta) + ' dia(s).');
          RichEdit1.Lines.Add('');
        end;
        i:= i + 1;
    end;
    
  if (achou_dias_diagnosticada = true) then
    begin
      if (resul_dias_diagnosticada = 0) then
        begin
          RichEdit1.Lines.Add('Há animais que completam '+ IntToStr(n_dias_diagnosticada) + ' dias de diagnosticada hoje, dia ' + DateToStr(date) + '.');
          RichEdit1.Lines.Add('');
        end
        else
        begin
          RichEdit1.Lines.Add('Há animais que completarão '+ IntToStr(n_dias_diagnosticada) + ' dias de diagnosticada em ' + IntToStr(resul_dias_diagnosticada) + ' dia(s).');
          RichEdit1.Lines.Add('');
        end;
        i:= i + 1;
    end;
    
  if (achou_dias_seca = true) then
    begin
      if (resul_dias_seca = 0) then
        begin
          RichEdit1.Lines.Add('Há animais que completam '+ IntToStr(n_dias_seca) + ' dias de secamento hoje, dia ' + DateToStr(date) + '.');
          RichEdit1.Lines.Add('');
        end
        else
        begin
          RichEdit1.Lines.Add('Há animais que completarão '+ IntToStr(n_dias_seca) + ' dias de secamento em ' + IntToStr(resul_dias_seca) + ' dia(s).');
          RichEdit1.Lines.Add('');
        end;
        i:= i + 1;
    end;
    
  if (achou_dias_parida = true) then
    begin
      if (resul_dias_parida = 0) then
        begin
          RichEdit1.Lines.Add('Há animais que completam '+ IntToStr(n_dias_parida) + ' dias de parida hoje, dia ' + DateToStr(date) + '.');
          RichEdit1.Lines.Add('');
        end
        else
        begin
          RichEdit1.Lines.Add('Há animais que completarão '+ IntToStr(n_dias_parida) + ' dias de parida em ' + IntToStr(resul_dias_parida) + ' dia(s).');
          RichEdit1.Lines.Add('');
        end;
        i:= i + 1;
    end;
    
  if (achou_animal_sincronizar = true) then
    begin
      if (resul_dias_parida = 0) then
        begin
          RichEdit1.Lines.Add('Há animais a serem cobertos hoje, dia '+ DateToStr(date) + ' proveniênte de uma sincronização de cio.');
          RichEdit1.Lines.Add('');
        end
        else
        begin
          RichEdit1.Lines.Add('Há animais a serem cobertos em '+ IntToStr(resul_animal_sincronizar) + ' dias, proveniênte de uma sincronização de cio.');
          RichEdit1.Lines.Add('');
        end;
        i:= i + 1;
    end;
    
  if (achou_protocolo_sincronizacao = true) then
    begin
      if (resul_protocolo_sincronizacao = 0) then
        begin
          RichEdit1.Lines.Add('Há protocolos de sincronização a serem executados hoje, dia '+ DateToStr(date) + '.');
          RichEdit1.Lines.Add('');
        end
        else
        begin
          RichEdit1.Lines.Add('Há protocolos de sincronização a serem executados em '+ IntToStr(resul_protocolo_sincronizacao) + ' dias.');
          RichEdit1.Lines.Add('');
        end;
        i:= i + 1;
    end;

  if (achou_animal_desmamar = true) then
    begin
      if (resul_animal_desmamar = 0) then
        begin
          RichEdit1.Lines.Add('Há animais a serem desmamados hoje, dia '+ DateToStr(date) + '.');
          RichEdit1.Lines.Add('');
        end
        else
        begin
          RichEdit1.Lines.Add('Há animais a serem desmamados em '+ IntToStr(resul_animal_desmamar) + ' dias.');
          RichEdit1.Lines.Add('');
        end;
        i:= i + 1;
    end;

    if (conta_nov_apta > 0) and (tem_nov_apta = true) then
    begin
      RichEdit1.Lines.Add('Há novilha(s) apta(s), no sistema. Foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (conta_nov_apta = 0) and (tem_nov_apta = true) then
    begin
      RichEdit1.Lines.Add('Há novilha(s) apta(s), no sistema. Não foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (conta_nov_apta_atr > 0) and (tem_nov_atr = true) then
    begin
      RichEdit1.Lines.Add('Há novilha(s) apta(s) atrasada(s), no sistema. Foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (conta_nov_apta_atr = 0) and (tem_nov_atr = true) then
    begin
      RichEdit1.Lines.Add('Há novilha(s) apta(s) atrasada(s), no sistema. Não foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (conta_nov_vaz_atr > 0) and (tem_nov_atr = true) then
    begin
      RichEdit1.Lines.Add('Há novilha(s) vazia(s) atrasada(s), no sistema. Foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (conta_nov_vaz_atr = 0) and (tem_nov_atr = true) then
    begin
      RichEdit1.Lines.Add('Há novilha(s) vazia(s) atrasada(s), no sistema. Não foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

  if (achou_dias_diagnostico = true) then
    begin
      if (resul_dias_diagnostico = 0) then
        begin
          RichEdit1.Lines.Add('Há animais que serão diagnosticadas hoje, dia '+ DateToStr(date) + '.');
          RichEdit1.Lines.Add('');
        end
        else
        begin
          RichEdit1.Lines.Add('Há animais que deverão ser diagnosticadas em '+ IntToStr(resul_dias_diagnostico) + ' dias.');
          RichEdit1.Lines.Add('');
        end;
        i:= i + 1;
    end;

    if (Conta > 0) and (tem_cres1 = true) then
    begin
      RichEdit1.Lines.Add('Há animais fêmeas que mudarão de situação de crescimento para situação 1 hoje, dia '+ DateToStr(date) + '. Foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (Conta = 0) and (tem_cres1 = true) then
    begin
      RichEdit1.Lines.Add('Há animais fêmeas que mudarão de situação de crescimento para situação 1 hoje, dia '+ DateToStr(date) + '. Não foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (Conta > 0) and (tem_cres2 = true) then
    begin
      RichEdit1.Lines.Add('Há animais fêmeas que mudarão de situação de crescimento para situação 2 hoje, dia '+ DateToStr(date) + '. Foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (Conta = 0) and (tem_cres2 = true) then
    begin
      RichEdit1.Lines.Add('Há animais fêmeas que mudarão de situação de crescimento para situação 2 hoje, dia '+ DateToStr(date) + '. Não foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (Conta > 0) and (tem_cres3 = true) then
    begin
      RichEdit1.Lines.Add('Há animais fêmeas que mudarão de situação de crescimento para situação 3 hoje, dia '+ DateToStr(date) + '. Foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (Conta = 0) and (tem_cres3 = true) then
    begin
      RichEdit1.Lines.Add('Há animais fêmeas que mudarão de situação de crescimento para situação 3 hoje, dia '+ DateToStr(date) + '. Não foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (Conta > 0) and (tem_cres4 = true) then
    begin
      RichEdit1.Lines.Add('Há animais fêmeas que mudarão de situação de crescimento para situação 4 hoje, dia '+ DateToStr(date) + '. Foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (Conta = 0) and (tem_cres4 = true) then
    begin
      RichEdit1.Lines.Add('Há animais fêmeas que mudarão de situação de crescimento para situação 4 hoje, dia '+ DateToStr(date) + '. Não foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (Conta > 0) and (tem_cres5 = true) then
    begin
      RichEdit1.Lines.Add('Há animais fêmeas que mudarão de situação de crescimento para situação 5 hoje, dia '+ DateToStr(date) + '. Foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (Conta = 0) and (tem_cres5 = true) then
    begin
      RichEdit1.Lines.Add('Há animais fêmeas que mudarão de situação de crescimento para situação 5 hoje, dia '+ DateToStr(date) + '. Não foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (Conta > 0) and (tem_cres6 = true) then
    begin
      RichEdit1.Lines.Add('Há animais fêmeas que mudarão de situação de crescimento para situação 6 hoje, dia '+ DateToStr(date) + '. Foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (Conta = 0) and (tem_cres6 = true) then
    begin
      RichEdit1.Lines.Add('Há animais fêmeas que mudarão de situação de crescimento para situação 6 hoje, dia '+ DateToStr(date) + '. Não foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (Conta > 0) and (tem_cres1_macho = true) then
    begin
      RichEdit1.Lines.Add('Há animais machos que mudarão de situação de crescimento para situação 1 hoje, dia '+ DateToStr(date) + '. Foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (Conta = 0) and (tem_cres1_macho = true) then
    begin
      RichEdit1.Lines.Add('Há animais machos que mudarão de situação de crescimento para situação 1 hoje, dia '+ DateToStr(date) + '. Não foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (Conta > 0) and (tem_cres2_macho = true) then
    begin
      RichEdit1.Lines.Add('Há animais machos que mudarão de situação de crescimento para situação 2 hoje, dia '+ DateToStr(date) + '. Foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (Conta = 0) and (tem_cres2_macho = true) then
    begin
      RichEdit1.Lines.Add('Há animais machos que mudarão de situação de crescimento para situação 2 hoje, dia '+ DateToStr(date) + '. Não foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (Conta > 0) and (tem_cres3_macho = true) then
    begin
      RichEdit1.Lines.Add('Há animais machos que mudarão de situação de crescimento para situação 3 hoje, dia '+ DateToStr(date) + '. Foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (Conta = 0) and (tem_cres3_macho = true) then
    begin
      RichEdit1.Lines.Add('Há animais machos que mudarão de situação de crescimento para situação 3 hoje, dia '+ DateToStr(date) + '. Não foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (Conta > 0) and (tem_cres4_macho = true) then
    begin
      RichEdit1.Lines.Add('Há animais machos que mudarão de situação de crescimento para situação 4 hoje, dia '+ DateToStr(date) + '. Foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (Conta = 0) and (tem_cres4_macho = true) then
    begin
      RichEdit1.Lines.Add('Há animais machos que mudarão de situação de crescimento para situação 4 hoje, dia '+ DateToStr(date) + '. Não foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (Conta > 0) and (tem_cres5_macho = true) then
    begin
      RichEdit1.Lines.Add('Há animais machos que mudarão de situação de crescimento para situação 5 hoje, dia '+ DateToStr(date) + '. Foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (Conta = 0) and (tem_cres5_macho = true) then
    begin
      RichEdit1.Lines.Add('Há animais machos que mudarão de situação de crescimento para situação 5 hoje, dia '+ DateToStr(date) + '. Não foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (Conta > 0) and (tem_cres6_macho = true) then
    begin
      RichEdit1.Lines.Add('Há animais machos que mudarão de situação de crescimento para situação 6 hoje, dia '+ DateToStr(date) + '. Foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (Conta = 0) and (tem_cres6_macho = true) then
    begin
      RichEdit1.Lines.Add('Há animais machos que mudarão de situação de crescimento para situação 6 hoje, dia '+ DateToStr(date) + '. Não foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (Conta > 0) and (tem_cres7_macho = true) then
    begin
      RichEdit1.Lines.Add('Há animais machos que mudarão de situação de crescimento para situação 7 hoje, dia '+ DateToStr(date) + '. Foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (Conta = 0) and (tem_cres7_macho = true) then
    begin
      RichEdit1.Lines.Add('Há animais machos que mudarão de situação de crescimento para situação 7 hoje, dia '+ DateToStr(date) + '. Não foi alterado a situação desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

  if (achou_lac_atrasada = true) then
    begin
      RichEdit1.Lines.Add('Há animais em lactação vazia atrasada no sistema. Foi alterado sua situação no sistema.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

  if (achou_sec_atrasada = true) then
    begin
      RichEdit1.Lines.Add('Há animais secas vazia atrasada no sistema. Foi alterado sua situação no sistema.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

  if (achou_calendario = true) then
    begin
      RichEdit1.Lines.Add('Há Eventos Sanitários programados para serem realizados neste mês de ' + resul_calendario + '.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (conta_lote_1 > 0) and (achou_lote_1 = true) then
    begin
      RichEdit1.Lines.Add('Os animais '+ animal_lote_1 + ' mudaram para o lote 1 hoje, dia '+ DateToStr(date) + '. Foi alterado o lote desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (conta_lote_1 = 0) and (achou_lote_1 = true) then
    begin
      RichEdit1.Lines.Add('Os animais '+ animal_lote_1 + ' mudaram para o lote 1 hoje, dia '+ DateToStr(date) + '. Foi alterado o lote desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (conta_lote_2 > 0) and (achou_lote_2 = true) then
    begin
      RichEdit1.Lines.Add('Os animais '+ animal_lote_2 + ' mudaram para o lote 2 hoje, dia '+ DateToStr(date) + '. Foi alterado o lote desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (conta_lote_2 = 0) and (achou_lote_2 = true) then
    begin
      RichEdit1.Lines.Add('Os animais '+ animal_lote_2 + ' mudaram para o lote 2 hoje, dia '+ DateToStr(date) + '. Não foi alterado o lote desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (conta_lote_3 > 0) and (achou_lote_3 = true) then
    begin
      RichEdit1.Lines.Add('Os animais '+ animal_lote_3 + ' mudaram para o lote 3 hoje, dia '+ DateToStr(date) + '. Foi alterado o lote desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (conta_lote_3 = 0) and (achou_lote_3 = true) then
    begin
      RichEdit1.Lines.Add('Os animais '+ animal_lote_3 + ' mudaram para o lote 3 hoje, dia '+ DateToStr(date) + '. Não foi alterado o lote desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (conta_lote_4 > 0) and (achou_lote_4 = true) then
    begin
      RichEdit1.Lines.Add('Os animais '+ animal_lote_4 + ' mudaram para o lote 4 hoje, dia '+ DateToStr(date) + '. Foi alterado o lote desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (conta_lote_4 = 0) and (achou_lote_4 = true) then
    begin
      RichEdit1.Lines.Add('Os animais '+ animal_lote_4 + ' mudaram para o lote 4 hoje, dia '+ DateToStr(date) + '. Não foi alterado o lote desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (conta_lote_5 > 0) and (achou_lote_5 = true) then
    begin
      RichEdit1.Lines.Add('Os animais '+ animal_lote_5 + ' mudaram para o lote 5 hoje, dia '+ DateToStr(date) + '. Foi alterado o lote desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (conta_lote_5 = 0) and (achou_lote_5 = true) then
    begin
      RichEdit1.Lines.Add('Os animais '+ animal_lote_5 + ' mudaram para o lote 5 hoje, dia '+ DateToStr(date) + '. Não foi alterado o lote desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (conta_lote_6 > 0) and (achou_lote_6 = true) then
    begin
      RichEdit1.Lines.Add('Os animais '+ animal_lote_6 + ' mudaram para o lote 6 hoje, dia '+ DateToStr(date) + '. Foi alterado o lote desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (conta_lote_6 = 0) and (achou_lote_6 = true) then
    begin
      RichEdit1.Lines.Add('Os animais '+ animal_lote_6 + ' mudaram para o lote 6 hoje, dia '+ DateToStr(date) + '. Não foi alterado o lote desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (conta_lote_7 > 0) and (achou_lote_7 = true) then
    begin
      RichEdit1.Lines.Add('Os animais '+ animal_lote_7 + ' mudaram para o lote 7 hoje, dia '+ DateToStr(date) + '. Foi alterado o lote desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (conta_lote_7 = 0) and (achou_lote_7 = true) then
    begin
      RichEdit1.Lines.Add('Os animais '+ animal_lote_7 + ' mudaram para o lote 7 hoje, dia '+ DateToStr(date) + '. Não foi alterado o lote desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (conta_lote_8 > 0) and (achou_lote_8 = true) then
    begin
      RichEdit1.Lines.Add('Os animais '+ animal_lote_8 + ' mudaram para o lote 8 hoje, dia '+ DateToStr(date) + '. Foi alterado o lote desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (conta_lote_8 = 0) and (achou_lote_8 = true) then
    begin
      RichEdit1.Lines.Add('Os animais '+ animal_lote_8 + ' mudaram para o lote 8 hoje, dia '+ DateToStr(date) + '. Não foi alterado o lote desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (conta_lote_9 > 0) and (achou_lote_9 = true) then
    begin
      RichEdit1.Lines.Add('Os animais '+ animal_lote_9 + ' mudaram para o lote 9 hoje, dia '+ DateToStr(date) + '. Foi alterado o lote desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (conta_lote_9 = 0) and (achou_lote_9 = true) then
    begin
      RichEdit1.Lines.Add('Os animais '+ animal_lote_9 + ' mudaram para o lote 9 hoje, dia '+ DateToStr(date) + '. Não foi alterado o lote desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;

    if (conta_lote_10 > 0) and (achou_lote_10 = true) then
    begin
      RichEdit1.Lines.Add('Os animais '+ animal_lote_10 + ' mudaram para o lote 10 hoje, dia '+ DateToStr(date) + '. Foi alterado o lote desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end
    else if (conta_lote_10 = 0) and (achou_lote_10 = true) then
    begin
      RichEdit1.Lines.Add('Os animais '+ animal_lote_10 + ' mudaram para o lote 10 hoje, dia '+ DateToStr(date) + '. Não foi alterado o lote desses animais automaticamente.');
      RichEdit1.Lines.Add('');
      i:= i + 1;
    end;}

    if (conta_mensagem = 0) then
      LblTotal.Caption:= '0'
    else
      LblTotal.Caption:= IntToStr(conta_mensagem);
end;
end.
