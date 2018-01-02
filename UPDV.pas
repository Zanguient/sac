unit UPDV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, UGeral, ADODB,
  ComCtrls, ShellAPI, URegistro, DB, DBClient,
  Grids, DBGrids, Provider, Menus, ACBrECFClass, ACBrBase, ACBrECF, UDeclaracao,
  Modelo.Entidade.TLancamentoFinanceiroEntidade,
  Modelo.Dominio.LancamentoFinanceiro.TLancamentoFinanceiroDominio,
  Modelo.Entidade.TParcelasLancamentoFinanceiroEntidade,
  Modelo.Dominio.LancamentoFinanceiro.TParcelasLancamentoFinanceiroDominio,
  Modelo.Entidade.TCondicaoPagamentoEntidade,
  Modelo.Dominio.TCondicaoPagamentoDominio,
  Modelo.Entidade.Cliente.TCliente,
  Modelo.Dominio.Tributacao.TTributacaoDominio,
  Modelo.Entidade.Tributacao.TTributacaoEntidade, DadosEmissaoNFE,
  DadosEmissaoNFEItens, DadosEmissaoNFEPagamento, DadosEmissaoNFERecebimento, pcnConversao,
  pcnConversaoNFe;

type
  TFrmPDV = class(TForm)
    Panel1: TPanel;
    Shape7: TShape;
    Timer1: TTimer;
    DBGrid1: TDBGrid;
    LblST: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label14: TLabel;
    Label13: TLabel;
    Shape2: TShape;
    Shape8: TShape;
    Panel2: TPanel;
    LblStatus: TLabel;
    Panel3: TPanel;
    Shape6: TShape;
    Label10: TLabel;
    LblSub_Total: TLabel;
    Label4: TLabel;
    Shape3: TShape;
    Label6: TLabel;
    Shape4: TShape;
    Label8: TLabel;
    Shape5: TShape;
    EdtQuantidade: TEdit;
    EdtValor_Unitario: TEdit;
    Shape9: TShape;
    EdtValor_Total: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    LblCodigo: TLabel;
    LblNCM: TLabel;
    LblCFOP: TLabel;
    Panel4: TPanel;
    EdtCodigo_Produto: TEdit;
    Shape1: TShape;
    LblProduto: TLabel;
    Panel5: TPanel;
    Label7: TLabel;
    LblNVenda: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure IdIPWatch1StatusChanged(Sender: TObject);
    procedure Totalizador_Parcial;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtValor_UnitarioExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_UnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtValor_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_TotalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtAcre_DescKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_TotalExit(Sender: TObject);
    procedure EdtCodigo_Produto2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure EdtQuantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtQuantidadeExit(Sender: TObject);
    procedure EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure EdtValor_UnitarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Itens_Pedido: URegistro.TItens_Pedido;
    Controla_Codigo: URegistro.TControla_Codigo;
    Util: TUtil;
    R05: URegistro.TR05;
    Aprovado, Impresso : Boolean;
    FTributacaoDominio: TTributacaoDominio;
    FTributacaoEntidade: TTributacaoEntidade;

    procedure Verifica_Permissao;
    procedure Verifica_Permissao_Valor_Total;
    procedure Atualiza_Itens;
    procedure Atualiza_Itens_R05;
    procedure Verifica_Dados;
    procedure Coleta_Dados_R05;
    procedure Gera_Codigo;
    procedure Gera_Codigo_Sem_Rede;
    procedure Inicia_Dados_Cliente;
    procedure Verifica_Produto_Lancado;
    procedure Calcula_Imposto;
    procedure Limpa_Labels;
    procedure Calcula_Imposto_Servico;
    procedure Insere_Dados;
    procedure Pega_Produto_Codigo_Barra;
    procedure Verifica_Permissao_Lancar_Produto;
    procedure Calcula_ICMS;
    function removerFichaEstoque:Boolean;
    procedure PreencheObjetoDadosNFEItens;

  public
    { Public declarations }
      ativo, pode_chamar, pode_encerrar, pode_fechar, quero_cancelar, pesquisa, libera_cancelar_item, jaCancelado: boolean;
      cod_pro, descri, qtde_vendida, unid, valor_unit, desc_item, acre_item, valor_total_item, indicador_cancelamento_item,
      qtde_cancelada, valor_cancelado, can_acre, IAT, IPPT, casa_decimal_qtde, casa_decimal_val_un: AnsiString;
      cod_produto, item, existe, ultimo_item, codigo, permite_credito, codigo_obs_fiscal: integer;
      codigo_produto, descricao, tipo_desc, item_cancelar, cAliquota, tipo_prod, saliquota,peso: AnsiString;
      unid_med, tipo_trib: AnsiString;
      valor_desc, desc_per, var_uni, novo_valor_uni, total_valor_uni, valor_compra, valor_compra_nota: double;

      CPF, Nome, Endereco, Tipo_Cliente: AnsiString;
      cli_tipo_end, cli_end, cli_num, cli_set, cli_cid, cli_uf, cli_tel, cli_cep, cli_cod_mun, cli_comp: AnsiString;

      Codigo_Cliente, qtde_cancelado: integer;
      iRelatorio, iIndex, iInTotalizador, iTotal, iConta: integer;
      Iniciado: boolean;
      cod_prod, dOUa: AnsiString;

      oLF: TLancamentoFinanceiroEntidade;
      oPLF: TParcelasLancamentoFinanceiroEntidade;
      oCP: TCondicaoPagamentoEntidade;
      oCli: TClienteEntidade;
      oLFDominio: TLancamentoFinanceiroDominio;
      oPLFDominio: TParcelasLancamentoFinanceiroDominio;
      oCPDominio: TCondicaoPagamentoDominio;

      DadosEmissaoNFE: TDadosEmissaoNFE;
      DadosEmissaoNFEItens: TDadosEmissaoNFEItens;
      DadosEmissaoNFEPagamento: TDadosEmissaoNFEPagamento;
      DadosEmissaoNFERecebimento: TDadosEmissaoNFERecebimento;
      Conexao: TADOConnection;

      procedure Limpa_Campos;
      procedure Limpa_Menor;

      procedure Inicia_Itens;
      procedure Limpa_Para_Novo_Registro;
      procedure AbreCupom;
      procedure Atualiza_Dados;
      procedure Grava_Pedido_Endereco_Cliente;

  end;

var
  FrmPDV: TFrmPDV;

implementation

uses UChama_Produto, UDM, UDesconto_PDV, UCancela_Item_Generico,
  UFechamento_Venda_PDV, UChama_Cliente, UMenu_Geral,
  UMensagem_TEF, UEscolha_Tabela_Preco, UMensagem_Erro_TEF,
  UMensagem_Erro_Impressora_TEF, UMensagem_Erro_Gerenciador_TEF,
  UInforma_Item_Cancelamento, UEscolha_Bandeira, UInformar_Cliente_PDV,
  USenha_ADM, Util.TLog, Modelo.Dominio.Pedido.IPedidoDominio, Modelo.Dominio.Pedido.TPedidoDominio,
  UGerar_Documentos, Util.Mensagens, Conexao.TConexao;

  {$R *.dfm}

procedure TFrmPDV.Totalizador_Parcial;
begin
  If (Trim(smodelo) = 'MP20FI') or (Trim(smodelo) = 'MP40FI')then
  begin
    iRetorno := Bematech_FI_DadosUltimaReducao(dados_reducao);
    If(iRetorno = 1)then
    begin
      iRelatorio := 0;
      iIndex := 53;
      iConta := 0;
      iInTotalizador := 118;
      iTotal := 0;
      While (iRelatorio = 0)do
      begin
        cAliquota := Copy(dados_reducao,iIndex,4);
        If(cAliquota <> '0000')then
        begin
          cTotalizador := Copy(dados_reducao,iInTotalizador,14);
          cBuffer := cBuffer + FormatFloat('00',iConta +1) + 'T' + cAliquota;
          cBuffer := cBuffer + cTotalizador;
          iInTotalizador := iInTotalizador + 14;
          iIndex := iIndex + 4;
        end
        Else
        begin
          iInTotalizador := 342;
          If(iInTotalizador = 342)then
          begin
            cTotalizador := Copy(dados_reducao,iInTotalizador,14);
            cBuffer := cBuffer + 'I1';
            cBuffer := cBuffer + cTotalizador;
            iInTotalizador := iInTotalizador + 14;
            iRelatorio := 1;
          end;
          If(iInTotalizador = 356)then
          begin
            cTotalizador := Copy(dados_reducao,iInTotalizador,14);
            cBuffer := cBuffer + 'F1';
            cBuffer := cBuffer + cTotalizador;
            iInTotalizador := iInTotalizador + 14;
          end;
          If(iInTotalizador = 370)then
          begin
            cTotalizador := Copy(dados_reducao,iInTotalizador,14);
            cBuffer := cBuffer + 'N1';
            cBuffer := cBuffer + cTotalizador;
            iInTotalizador := 38;
          end;
          If(iInTotalizador = 38)then
          begin
            cTotalizador := Copy(dados_reducao,iInTotalizador,14);
            cBuffer := cBuffer + 'DT';
            cBuffer := cBuffer + cTotalizador;
            iInTotalizador := 603;
          end;
          If(iInTotalizador = 603)then
          begin
            cTotalizador := Copy(dados_reducao,iInTotalizador,14);
            cBuffer := cBuffer + 'AT';
            cBuffer := cBuffer + cTotalizador;
            iInTotalizador := 23;
          end;
          If(iInTotalizador = 23)then
          begin
            cTotalizador := Copy(dados_reducao,iInTotalizador,14);
            cBuffer := cBuffer + 'Can-T';
            cBuffer := cBuffer + cTotalizador;
            iInTotalizador := 385;
          end;
          If(iInTotalizador = 385)then
          begin
            iTotal := iTotal + StrToInt(Copy(dados_reducao,385,14));
            iTotal := iTotal + StrToInt(Copy(dados_reducao,400,14));
            iTotal := iTotal + StrToInt(Copy(dados_reducao,415,14));
            iTotal := iTotal + StrToInt(Copy(dados_reducao,428,14));
            iTotal := iTotal + StrToInt(Copy(dados_reducao,442,14));
            iTotal := iTotal + StrToInt(Copy(dados_reducao,456,14));
            iTotal := iTotal + StrToInt(Copy(dados_reducao,470,14));
            iTotal := iTotal + StrToInt(Copy(dados_reducao,484,14));
            iTotal := iTotal + StrToInt(Copy(dados_reducao,498,14));
            iTotal := iTotal + StrToInt(Copy(dados_reducao,512,14));
            iTotal := iTotal + StrToInt(Copy(dados_reducao,526,14));
            cBuffer := cBuffer + 'F1';
            cBuffer := cBuffer + FormatFloat('00000000000000',iTotal);
            iInTotalizador := iInTotalizador + 14;
          end;
        end;
      end;
    end;
  end
  Else
  begin
    iRelatorio := 0;
    iIndex := 1208;
    iInTotalizador := 335;
    iConta := 0;
    iTotal := 0;
    While (iRelatorio = 0)do
    begin
      cAliquota := Copy(dados_reducao,iIndex,4);
      If(cAliquota <> '0000')then
      begin
        cTotalizador := Copy(dados_reducao,iInTotalizador,14);
        cBuffer := cBuffer + formatfloat('00',iConta+1) + 'T' + cAliquota;
        //cBuffer := cBuffer + cTotalizador;
        iInTotalizador := iInTotalizador + 14;
        iRelatorio := 1;
      end
      Else
      begin
        iInTotalizador := 560;
        If(iInTotalizador = 560)then
        begin
          cTotalizador := Copy(dados_reducao,iInTotalizador,14);
          cBuffer := cBuffer + 'I1';
          //cBuffer := cBuffer + cTotalizador;
          iInTotalizador := iInTotalizador + 15;
          iRelatorio := 1;
        end;
        If(iInTotalizador = 575)then
        begin
          cTotalizador := Copy(dados_reducao,iInTotalizador,14);
          cBuffer := cBuffer + 'N1';
          //cBuffer := cBuffer + cTotalizador;
          iInTotalizador := iInTotalizador + 15;
          iRelatorio := 1;
        end;
        If(iInTotalizador = 590)then
        begin
          cTotalizador := Copy(dados_reducao,iInTotalizador,14);
          cBuffer := cBuffer + 'F1';
          //cBuffer := cBuffer + cTotalizador;
          iInTotalizador := iInTotalizador + 15;
          iRelatorio := 1;
        end;
        If(iInTotalizador = 605)then
        begin
          cTotalizador := Copy(dados_reducao,iInTotalizador,14);
          cBuffer := cBuffer + 'IS1';
          //cBuffer := cBuffer + cTotalizador;
          iInTotalizador := iInTotalizador + 15;
          iRelatorio := 1;
        end;
        If(iInTotalizador = 620)then
        begin
          cTotalizador := Copy(dados_reducao,iInTotalizador,14);
          cBuffer := cBuffer + 'NS1';
          //cBuffer := cBuffer + cTotalizador;
          iInTotalizador := iInTotalizador + 15;
          iRelatorio := 1;
        end;
        If(iInTotalizador = 635)then
        begin
          cTotalizador := Copy(dados_reducao,iInTotalizador,14);
          cBuffer := cBuffer + 'FS1';
          //cBuffer := cBuffer + cTotalizador;
          iInTotalizador := iInTotalizador + 15;
          iRelatorio := 1;
        end;
        If(iInTotalizador = 650)then
        begin
          cTotalizador := Copy(dados_reducao,iInTotalizador,14);
          cBuffer := cBuffer + 'DT';
          //cBuffer := cBuffer + cTotalizador;
          iInTotalizador := iInTotalizador + 15;
          iRelatorio := 1;
        end;
        If(iInTotalizador = 665)then
        begin
          cTotalizador := Copy(dados_reducao,iInTotalizador,14);
          cBuffer := cBuffer + 'DS';
          //cBuffer := cBuffer + cTotalizador;
          iInTotalizador := iInTotalizador + 15;
          iRelatorio := 1;
        end;
        If(iInTotalizador = 680)then
        begin
          cTotalizador := Copy(dados_reducao,iInTotalizador,14);
          cBuffer := cBuffer + 'AT';
          //cBuffer := cBuffer + cTotalizador;
          iInTotalizador := iInTotalizador + 15;
          iRelatorio := 1;
        end;
        If(iInTotalizador = 695)then
        begin
          cTotalizador := Copy(dados_reducao,iInTotalizador,14);
          cBuffer := cBuffer + 'AS';
          //cBuffer := cBuffer + cTotalizador;
          iInTotalizador := iInTotalizador + 15;
          iRelatorio := 1;
        end;
        If(iInTotalizador = 710)then
        begin
          cTotalizador := Copy(dados_reducao,iInTotalizador,14);
          cBuffer := cBuffer + 'Can-T';
          //cBuffer := cBuffer + cTotalizador;
          iInTotalizador := iInTotalizador + 15;
          iRelatorio := 1;
        end;
        If(iInTotalizador = 725)then
        begin
          cTotalizador := Copy(dados_reducao,iInTotalizador,14);
          cBuffer := cBuffer + 'Can-S';
          //cBuffer := cBuffer + cTotalizador;
          iInTotalizador := iInTotalizador + 15;
          iRelatorio := 1;
        end;
        If(iInTotalizador = 740)then
        begin
          While (iInTotalizador < 1132)do
          begin
            cTotalizador := Copy(dados_reducao,iInTotalizador,14);
            iTotal := iTotal + StrToInt(cTotalizador);
            iInTotalizador := iInTotalizador + 14;
            iRelatorio := 1;
          end;
          iInTotalizador := iInTotalizador + 1;
          cTotalizador := Copy(dados_reducao,iInTotalizador,14);
          iTotal := iTotal + StrToInt(cTotalizador);
          iInTotalizador := iInTotalizador + 15;
          cTotalizador := Copy(dados_reducao,iInTotalizador,14);
          iTotal := iTotal + StrToInt(cTotalizador);
          cBuffer := cBuffer + 'OPNF';
          //cBuffer := cBuffer + FormatFloat('0000000000000',iTotal);
          iInTotalizador := iInTotalizador + 15;
        end;
      end;
      iConta := iConta + 1;
      iIndex := iIndex + 4;
    end;
  end;
end;

procedure TFrmPDV.Verifica_Permissao;
begin
  if (EdtQuantidade.Text = '') or (LblProduto.Caption = '') or (EdtCodigo_Produto.Text = '') or
      (EdtValor_Unitario.Text = '') or (EdtQuantidade.Text = '0') then
    begin
      Mensagem_Falta_Dados;
      EdtQuantidade.SetFocus;
      abort
    end
    else
    begin
      if (Verifica_Produto_Saida(StrToFloat(EdtQuantidade.Text)) = false)then
        abort;
    end;
end;

procedure TFrmPDV.Verifica_Permissao_Valor_Total;
begin
  if (EdtCodigo_Produto.Text = '') or (LblProduto.Caption = '') or (EdtValor_Unitario.Text = '') or
      (EdtValor_Total.Text = '0') or (EdtValor_Total.Text = '0,00') or (EdtValor_Total.Text = '') then
    begin
      Mensagem_Falta_Dados;
      EdtQuantidade.SetFocus;
      abort
    end;
end;

procedure TFrmPDV.Verifica_Produto_Lancado;
begin
  if not dm.qryitens_venda.IsEmpty then
  begin
    if (dm.qryitens_venda.Locate('Codigo;Codigo_Produto;Cancelado', VarArrayOf([StrToInt(LblCodigo.Caption), cod_produto, 'N']), [])) then
    begin
      EdtCodigo_Produto.SetFocus;
      Produto_Ja_Lancamento_Venda;
      abort;
    end;
  end;
end;

procedure TFrmPDV.AbreCupom;
var
  Aux1, Aux2, Aux3, Aux4, Aux5: AnsiString;
begin
  if (pode_fechar = false) then
  begin
    Mensagem_Venda_Andamento;
    abort;
  end;

  if (Habilitado = false) then
  begin
    UDeclaracao.Mensagem_Erro;
    abort;
  end;

  quero_cancelar:= false;
  //Verifica_Permissao_Impressora;

  {if (Nome <> '') and (CPF <> '')then
  begin
    if not (ECF.Abrir_Cupom_Nominal(CPF, Nome, Endereco)) then
    begin
      //pode_fechar:= false;
      Iniciado:= false;
      pode_fechar:= true;
      pode_chamar:= false;
    end
    else
    begin
      //Verifica_Dados;
      Iniciado:= true;
      pode_fechar:= false;
      pode_chamar:= true;
    end;
  end
  else
  begin
    if not (ECF.Abrir_Cupom) then
    begin
      //pode_fechar:= false;
      Iniciado:= false;
      pode_fechar:= true;
      pode_chamar:= false;
    end
    else
    begin
      //Verifica_Dados;
      Iniciado:= true;
      pode_fechar:= false;
      pode_chamar:= true;
    end;
  end;}

  Inicia_Itens;
  Iniciado:= true;
  pode_fechar:= false;
  pode_chamar:= true;
  jaCancelado:= false;
  LblStatus.Caption:= Caixa_Operacao(1);
  encontrou_alertas := false;
  dm.ACBrNFe1.NotasFiscais.Clear;

  DadosEmissaoNFE:= TDadosEmissaoNFE.Create;
  DadosEmissaoNFEItens:= TDadosEmissaoNFEItens.Create;
  DadosEmissaoNFEPagamento:= TDadosEmissaoNFEPagamento.Create;
  DadosEmissaoNFERecebimento:= TDadosEmissaoNFERecebimento.Create;
  Conexao:= TConexao.NovaConexao(Conexao);
  TConexao.IniciaQuerys([dm.qryitens_venda], Conexao);

  Gera_Codigo_Lancamento(Conexao);
  LblCodigo.Caption:= IntToStr(UDeclaracao.Codigo);
  TLog.Debug('Gerou código do pedido ao gravar no banco de dados: '+LblCodigo.Caption);

  LblNVenda.Caption:= IntToStr(Gera_N_NFCe);
  TLog.Debug('Gerou número da NFCe: '+LblNVenda.Caption);

  Atualiza_Dados;
  TLog.Debug('Atualizou a grid.');

  EdtCodigo_Produto.SetFocus;
end;

procedure TFrmPDV.Inicia_Itens;
begin
  item:= 0;
  existe:= 0;
  valor_desc:= 0;
  tipo_desc:= '';
  item_cancelar:= '';
  novo_valor_uni:= 0;
  total_valor_uni:= 0;
  var_uni:= 0;
  qtde_cancelado:= 0;
  EdtQuantidade.Text:= '1';
  Panel1.Enabled:= true;
  LblStatus.Caption:= Caixa_Operacao(0);
  LblNVenda.Caption:= '';
  n_item:= '0';
  libera_cancelar_item:= false;
  pode_chamar:= true;
  //ao finalizar uma venda, esses dois itens são afetados, pois o metodo Inicia_Itens é o primeor a ser chamado,
  //mas depois, é chamado o pode_chamar:= false e Iniciado:= false

  dOUa:= 'D';
  Inicia_Dados_Cliente;
  Limpa_Labels;
  Limpa_Campos;
  Limpa_Tributos;
end;

procedure TFrmPDV.Atualiza_Itens;
var
  total, sub1, sub2: double;
  item: AnsiString;
begin
  if (Confirma_Exclusao) then
  begin
    //item:= copy(DM.qryitens_vendaN_Item.AsString,2,3);
    //iRetorno:= Bematech_FI_CancelaItemGenerico(PAnsiChar(item));
    //Analisa_iRetorno;
    //if (iRetorno = 1) then
    //begin
      //dm.qryitens_venda.LogChanges:= false;
      //dm.qryitens_venda_Aux.LogChanges:= false;

      //if not (dm.CDSItens_Venda.State in [dsEdit]) then
      //dm.qryitens_vendaCancelado.AsString:= 'S';
      //dm.qryitens_venda.Post;



      //if not (dm.qryitens_venda_Aux.State in [dsEdit]) then
      //dm.qryitens_venda_Aux.Locate('N_Item', dm.qryitens_vendaN_Item.AsString, []);
      //dm.qryitens_venda_Aux.Edit;
      //dm.qryitens_venda_AuxCancelado.AsString:= 'S';

      sub1:= StrToFloat(LblSub_Total.Caption);
      sub2:= dm.qryitens_vendaSub_Total.AsFloat;
      total:= sub1 - sub2;
      LblSub_Total.Caption:= FormatFloat('#0.0,0', total);
      LblSub_Total.Caption:= StringReplace(LblSub_Total.Caption, ThousandSeparator, '', [rfReplaceAll]);

      dm.qryitens_venda.Delete;
      //DadosEmissaoNFE.Itens.Delete(dm.qryitens_venda.RecNo-1);
      Atualiza_Dados;

      //dm.qryitens_venda.SaveToFile(Local_Arquivo(2), dfXMLUTF8);

      //dm.qryitens_venda_Aux.Post;
      //dm.qryitens_venda_Aux.SaveToFile(Local_Arquivo(3), dfXMLUTF8);
      //Atualiza_Itens_R05;
    //end;
  end;
end;

procedure TFrmPDV.Atualiza_Itens_R05;
var
  total, sub1, sub2, valor_cancelado: double;
begin
  //dm.qryr05.LogChanges:= false;
  dm.qryr05.Locate('N_Item', dm.qryitens_vendaN_Item.AsString, []);

  if not (dm.qryr05.State in [dsEdit]) then
    dm.qryr05.Edit;

  dm.qryr05Cancelamento.AsString:= 'S';
  dm.qryr05Quantidade_Cancelada.AsString:= dm.qryitens_vendaQtde.AsString;
  valor_cancelado:= dm.qryitens_vendaQtde.AsFloat * dm.qryitens_vendaValor_Unitario.AsFloat;
  dm.qryr05Valor_Cancelado.AsString:= FloatToStr(valor_cancelado);
  dm.qryr05.Post;
  //dm.qryr05.SaveToFile(Local_Arquivo(8), dfXMLUTF8);
end;

procedure TFrmPDV.Button2Click(Sender: TObject);
begin
  with DM.qryitens_venda, SQL do
  begin
    close;
    Connection := DM.ADOConnectionLocal;
    clear;
    add('select IP.*, Pro.Estoque from Itens_Pedido IP');
    add('left join Produto Pro on (IP.Codigo_Produto = Pro.Codigo)');
    add('where IP.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value := DM.qryvendaCodigo.AsInteger;
    open;
  end;

end;

procedure TFrmPDV.Calcula_ICMS;
var
  bc, bc2, ali, bcst, bcst2, icmsst: double;
begin
  if (regime_tributario_emitente = '2') then
  begin

    //calcula icms, caso for preciso do cupom fiscal
    if (cst_icms = '00') or (cst_icms = '20') or (cst_icms = '51') then
    begin
      if (br_icms <> '') then
      begin
        bc:= (StrToFloat(br_icms) / 100) * StrToFloat(EdtValor_Total.Text);
        bc2:= StrToFloat(EdtValor_Total.Text) - bc;
        bc_icms:= FloatToStr(bc2);     //base

        if (icms = 'I1') or (icms = 'N1') or (icms = 'F1') or (icms = '0') then
        begin
          ali:= 0 * bc2;
          valor_icms:= FloatToStr(ali);
        end
        else
        begin
          ali:= (StrToFloat(icms) / 10000) * bc2;
          valor_icms:= FloatToStr(ali);
        end;
      end
      else
      begin
        bc2:= StrToFloat(EdtValor_Total.Text);
        bc_icms:= FloatToStr(bc2);     //base

        if (icms = 'I1') or (icms = 'N1') or (icms = 'F1') or (icms = '0') then
        begin
          ali:= 0 * bc2;
          valor_icms:= FloatToStr(ali);
        end
        else
        begin
          ali:= (StrToFloat(icms) / 10000) * bc2;
          valor_icms:= FloatToStr(ali);
        end;
      end;
    end;

    if (cst_icms = '10') or (cst_icms = '30') or (cst_icms = '60')  or (cst_icms = '70')  then
    begin
               ////calcula o ICMS para depois calcular o ICMSST, subtraindo um do outro
      if (br_icms <> '') then
      begin
        bc:= (StrToFloat(br_icms) / 100) * StrToFloat(EdtValor_Total.Text);
        bc2:= StrToFloat(EdtValor_Total.Text) - bc;
        bc_icms:= FloatToStr(bc2);     //base

        if (icms = 'I1') or (icms = 'N1') or (icms = 'F1') or (icms = '0') then
        begin
          ali:= 0 * bc2;
          valor_icms:= FloatToStr(ali);
        end
        else
        begin
          ali:= (StrToFloat(icms) / 10000) * bc2;
          valor_icms:= FloatToStr(ali);
        end;
      end
      else
      begin
        bc2:= StrToFloat(EdtValor_Total.Text);
        bc_icms:= FloatToStr(bc2);     //base

        if (icms = 'I1') or (icms = 'N1') or (icms = 'F1') or (icms = '0') then
        begin
          ali:= 0 * bc2;
          valor_icms:= FloatToStr(ali);
        end
        else
        begin
          ali:= (StrToFloat(icms) / 10000) * bc2;
          valor_icms:= FloatToStr(ali);
        end;
      end;

      bcst:= StrToFloat(EdtValor_Total.Text) + ((StrToFloat(mvast) / 100) * StrToFloat(EdtValor_Total.Text));
      Pega_ICMS_Qualquer(StrToInt(grupo_produto_tributacao_icms), uf, uf, dm.ADOConnection1);

      if (qAux_ICMS_Qualquer.FieldByName('Aliquota').AsString = 'I') or
         (qAux_ICMS_Qualquer.FieldByName('Aliquota').AsString = 'N') or
         (qAux_ICMS_Qualquer.FieldByName('Aliquota').AsString = 'F') or
         (qAux_ICMS_Qualquer.FieldByName('Aliquota').AsString = '0') then
      begin
        icmsst:= bcst * (0 / 100)
      end
      else
      begin
        icmsst:= bcst * (qAux_ICMS_Qualquer.FieldByName('Aliquota').AsFloat / 100);
      end;

      icmsst:= icmsst - StrToFloat(valor_icms);
      icms_st:= qAux_ICMS_Qualquer.FieldByName('Aliquota').AsString;      /////conferir tudo
      valor_icms_st:= FloatToStr(icmsst);
      bc_icms_st:= FloatToStr(bcst);
    end;

    if (cst_icms = '40') or (cst_icms = '41') then
    begin
      icms_st:= '0';
      valor_icms_st:= '0';
      bc_icms_st:= '0';
      bc_icms:= '0';
      valor_icms:= '0';
    end;

    if (cst_icms = '40') or (cst_icms = '41') then
    begin
      icms_st:= '0';
      valor_icms_st:= '0';
      bc_icms_st:= '0';
      bc_icms:= '0';
      valor_icms:= '0';
    end;


  end
  else
  begin

  //calculando o icms caso for preciso de cupom fiscal
    if (csosn = '101') then
    begin
      uDeclaracao.credito_icms:= FloatToStr((StrToFloat(aliquota_sn) / 100) * StrToFloat(EdtValor_Total.Text));
    end
    else if (csosn = '102') or (csosn = '103') then
    begin
      UDeclaracao.credito_icms:= '0';
    end
    else if (csosn = '201') or (csosn = '202') or (csosn = '203') or (csosn = '500') then
    begin

      if (csosn = '201') then
        uDeclaracao.credito_icms:= FloatToStr((StrToFloat(aliquota_sn) / 100) * StrToFloat(EdtValor_Total.Text))
      else if (csosn = '202') or (csosn = '203') or (csosn = '500') then
        uDeclaracao.credito_icms:= '0';

               ////calcula o ICMS para depois calcular o ICMSST, subtraindo um do outro
      if (br_icms <> '') then
      begin
        bc:= (StrToFloat(br_icms) / 100) * StrToFloat(EdtValor_Total.Text);
        bc2:= StrToFloat(EdtValor_Total.Text) - bc;
        bc_icms:= FloatToStr(bc2);     //base

        if (icms = 'I1') or (icms = 'N1') or (icms = 'F1') or (icms = '0') then
        begin
          ali:= 0 * bc2;
          valor_icms:= FloatToStr(ali);
        end
        else
        begin
          ali:= (StrToFloat(icms) / 10000) * bc2;
          valor_icms:= FloatToStr(ali);
        end;
      end
      else
      begin
        bc2:= StrToFloat(EdtValor_Total.Text);
        bc_icms:= FloatToStr(bc2);     //base

        if (icms = 'I1') or (icms = 'N1') or (icms = 'F1') or (icms = '0') then
        begin
          ali:= 0 * bc2;
          valor_icms:= FloatToStr(ali);
        end
        else
        begin
          ali:= (StrToFloat(icms) / 10000) * bc2;
          valor_icms:= FloatToStr(ali);
        end;
      end;

      bcst:= StrToFloat(EdtValor_Total.Text) + ((StrToFloat(mvast) / 100) * StrToFloat(EdtValor_Total.Text));
      Pega_ICMS_Qualquer(StrToInt(grupo_produto_tributacao_icms), uf, uf, dm.ADOConnection1);

      if (qAux_ICMS_Qualquer.FieldByName('Aliquota').AsString = 'I') or
         (qAux_ICMS_Qualquer.FieldByName('Aliquota').AsString = 'N') or
         (qAux_ICMS_Qualquer.FieldByName('Aliquota').AsString = 'F') or
         (qAux_ICMS_Qualquer.FieldByName('Aliquota').AsString = 'I1') or
         (qAux_ICMS_Qualquer.FieldByName('Aliquota').AsString = 'N1') or
         (qAux_ICMS_Qualquer.FieldByName('Aliquota').AsString = 'F1') or
         (qAux_ICMS_Qualquer.FieldByName('Aliquota').AsString = '0') then
      begin
        icmsst:= bcst * (0 / 100)
      end
      else
      begin
        icmsst:= bcst * (qAux_ICMS_Qualquer.FieldByName('Aliquota').AsFloat / 100);
      end;

      icmsst:= icmsst - StrToFloat(valor_icms);
      icms_st:= qAux_ICMS_Qualquer.FieldByName('Aliquota').AsString;      /////conferir tudo
      valor_icms_st:= FloatToStr(icmsst);
      bc_icms_st:= FloatToStr(bcst);
    end
    else if (csosn = '101') or (csosn = '102') or (csosn = '103') or
            (csosn = '300') or (csosn = '400') then
    begin
      icms_st:= '0';
      valor_icms_st:= '0';
      bc_icms_st:= '0';
      //bc_icms:= '0';
      //valor_icms:= '0';
    end;

    if (csosn <> '900') then
    begin
      bc_icms:= '0';
      valor_icms:= '0';
    end;
  end;


end;

procedure TFrmPDV.Calcula_Imposto;
var
  bc, bc2, ali: double;
begin
  //-------------------icms ----------------//

  Calcula_ICMS;

  //--------------------fim icms--------------------------------//


  //-------------------ipi acrescida ou reduzida----------------//

  if (ipi = '') then
    ipi:= '0';

  if (br_ipi <> '') then
  begin
    bc:= (StrToFloat(br_ipi) / 100) * StrToFloat(EdtValor_Total.Text);
    bc2:= StrToFloat(EdtValor_Total.Text) - bc;
    bc_ipi:= FloatToStr(bc2);     //base

    if (ipi = 'I') or (ipi = 'N') or (ipi = 'F') or (ipi = '0') then
    begin
      ali:= 0 * bc2;
      valor_ipi:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(ipi) / 100) * bc2;
      valor_ipi:= FloatToStr(ali);
    end;
  end
  else if (ba_ipi <> '') then
  begin
    bc:= (StrToFloat(ba_ipi) / 100) * StrToFloat(EdtValor_Total.Text);
    bc2:= StrToFloat(EdtValor_Total.Text) + bc;
    bc_ipi:= FloatToStr(bc2);     //base

    if (ipi = 'I') or (ipi = 'N') or (ipi = 'F') or (ipi = '0') then
    begin
      ali:= 0 * bc2;
      valor_ipi:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(ipi) / 100) * bc2;
      valor_ipi:= FloatToStr(ali);
    end;
  end
  else
  begin
    bc2:= StrToFloat(EdtValor_Total.Text);
    bc_ipi:= FloatToStr(bc2);     //base

    if (ipi = 'I') or (ipi = 'N') or (ipi = 'F') or (ipi = '0') then
    begin
      ali:= 0 * bc2;
      valor_ipi:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(ipi) / 100) * bc2;
      valor_ipi:= FloatToStr(ali);
    end;
  end;
  //--------------------fim ipi--------------------------------//

  //-------------------pis acrescida ou reduzida----------------//

  if (pis = '') then
    pis:= '0';

  if (br_pis <> '') then
  begin
    bc:= (StrToFloat(br_pis) / 100) * StrToFloat(EdtValor_Total.Text);
    bc2:= StrToFloat(EdtValor_Total.Text) - bc;
    bc_pis:= FloatToStr(bc2);     //base

    if (pis = 'I') or (pis = 'N') or (pis = 'F') or (pis = '0') then
    begin
      ali:= 0 * bc2;
      valor_pis:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(pis) / 100) * bc2;
      valor_pis:= FloatToStr(ali);
    end;
  end
  else if (ba_pis <> '') then
  begin
    bc:= (StrToFloat(ba_pis) / 100) * StrToFloat(EdtValor_Total.Text);
    bc2:= StrToFloat(EdtValor_Total.Text) + bc;
    bc_pis:= FloatToStr(bc2);     //base

    if (pis = 'I') or (pis = 'N') or (pis = 'F') or (pis = '0') then
    begin
      ali:= 0 * bc2;
      valor_pis:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(pis) / 100) * bc2;
      valor_pis:= FloatToStr(ali);
    end;
  end
  else
  begin
    bc2:= StrToFloat(EdtValor_Total.Text);
    bc_pis:= FloatToStr(bc2);     //base

    if (pis = 'I') or (pis = 'N') or (pis = 'F') or (pis = '0') then
    begin
      ali:= 0 * bc2;
      valor_pis:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(pis) / 100) * bc2;
      valor_pis:= FloatToStr(ali);
    end;
  end;
  //--------------------fim pis--------------------------------//

  //-------------------cofins acrescida ou reduzida----------------//

  if (cofins = '') then
    cofins:= '0';

  if (br_cofins <> '') then
  begin
    bc:= (StrToFloat(br_cofins) / 100) * StrToFloat(EdtValor_Total.Text);
    bc2:= StrToFloat(EdtValor_Total.Text) - bc;
    bc_cofins:= FloatToStr(bc2);     //base

    if (cofins = 'I') or (cofins = 'N') or (cofins = 'F') or (cofins = '0') then
    begin
      ali:= 0 * bc2;
      valor_cofins:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(cofins) / 100) * bc2;
      valor_cofins:= FloatToStr(ali);
    end;
  end
  else if (ba_cofins <> '') then
  begin
    bc:= (StrToFloat(ba_cofins) / 100) * StrToFloat(EdtValor_Total.Text);
    bc2:= StrToFloat(EdtValor_Total.Text) + bc;
    bc_cofins:= FloatToStr(bc2);     //base

    if (cofins = 'I') or (cofins = 'N') or (cofins = 'F') or (cofins = '0') then
    begin
      ali:= 0 * bc2;
      valor_cofins:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(cofins) / 100) * bc2;
      valor_cofins:= FloatToStr(ali);
    end;
  end
  else
  begin
    bc2:= StrToFloat(EdtValor_Total.Text);
    bc_cofins:= FloatToStr(bc2);     //base

    if (cofins = 'I') or (cofins = 'N') or (cofins = 'F') or (cofins = '0') then
    begin
      ali:= 0 * bc2;
      valor_cofins:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(cofins) / 100) * bc2;
      valor_cofins:= FloatToStr(ali);
    end;
  end;
  //--------------------fim cofins--------------------------------//

  sub_total_liquido:= FloatToStr(StrToFloat(EdtValor_Total.Text));
end;

procedure TFrmPDV.Calcula_Imposto_Servico;
var
  bc, bc2, ali: double;
begin
  //-------------------issqn acrescida ou reduzida----------------//

  {if (LblBase_Reduzida.Caption <> '') then
  begin
    bc:= (StrToFloat(LblBase_Reduzida.Caption) / 100) * StrToFloat(EdtValor_Total.Text);
    bc2:= StrToFloat(EdtValor_Total.Text) - bc;
    LblBC.Caption:= FloatToStr(bc2);     //base

    if (LblICMS.Caption = 'I') or (LblICMS.Caption = 'N') or (LblICMS.Caption = 'F') then
    begin
      ali:= 0 * bc2;
      LblValor_ICMS.Caption:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(LblICMS.Caption) / 100) * bc2;
      LblValor_ICMS.Caption:= FloatToStr(ali);
    end;
  end
  else if (LblBase_Acrescida.Caption <> '') then
  begin
    bc:= (StrToFloat(LblBase_Acrescida.Caption) / 100) * StrToFloat(EdtValor_Total.Text);
    bc2:= StrToFloat(EdtValor_Total.Text) + bc;
    LblBC.Caption:= FloatToStr(bc2);     //base

    if (LblICMS.Caption = 'I') or (LblICMS.Caption = 'N') or (LblICMS.Caption = 'F') then
    begin
      ali:= 0 * bc2;
      LblValor_ICMS.Caption:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(LblICMS.Caption) / 100) * bc2;
      LblValor_ICMS.Caption:= FloatToStr(ali);
    end;
  end
  else
  begin
    bc2:= StrToFloat(EdtValor_Total.Text);
    LblBC.Caption:= FloatToStr(bc2);     //base

    if (LblICMS.Caption = 'I') or (LblICMS.Caption = 'N') or (LblICMS.Caption = 'F') then
    begin
      ali:= 0 * bc2;
      LblValor_ICMS.Caption:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(LblICMS.Caption) / 100) * bc2;
      LblValor_ICMS.Caption:= FloatToStr(ali);
    end;
  end;
  //--------------------fim issqn--------------------------------//

  LblSub_Total_Liquido.Caption:= FloatToStr(StrToFloat(EdtValor_Total.Text) - StrToFloat(LblValor_ICMS.Caption)); }
end;

procedure TFrmPDV.Coleta_Dados_R05;
begin
  //CapturaContadoresECF;
  ECF.Pega_Contadores;
  //Captura_Ultimo_Item;
  ECF.PEga_Ultimo_Item;

  cod_pro:= codigo_produto;
  descri:= descricao;

  qtde_vendida:= FormatFloat('#0.0,0', StrToFloat(EdtQuantidade.Text));
  qtde_vendida:= StringReplace(qtde_vendida, ThousandSeparator, '', [rfReplaceAll]);

  unid:= unid_med;
  valor_unit:= EdtValor_Unitario.Text;

  if (total_valor_uni = 0) then
  begin
    desc_item:= '0';
    acre_item:= '0';
  end
  else if (total_valor_uni > 0) then
  begin
    desc_item:= '0';
    acre_item:= FloatToStr(Abs(total_valor_uni));
  end
  else if (total_valor_uni < 0) then
  begin
    desc_item:= FloatToStr(Abs(total_valor_uni));
    acre_item:= '0';
  end;

  valor_total_item:= EdtValor_Total.Text;
  indicador_cancelamento_item:= 'N';
  qtde_cancelada:= '';
  valor_cancelado:= '';
  can_acre:= '0';
  casa_decimal_qtde:= '0';
  casa_decimal_val_un:= '2';
end;

procedure TFrmPDV.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

  if dm.qryitens_vendaCancelado.AsString = 'S' then
    DBGrid1.Canvas.Font.Color:= clRed;
  dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
end;

procedure TFrmPDV.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cancela: integer;
  total, valor_cancelado: double;
  qAux, qAux2: TADOQuery;
begin
  if (key = VK_DELETE) then
  begin
    if (DBGrid1.SelectedRows.CurrentRowSelected = false) then
    begin
      Registro_Nao_Selecionado;
      abort;
    end;

    Atualiza_Itens;
  end;
end;

procedure TFrmPDV.EdtAcre_DescKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmPDV.EdtCodigo_Produto2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  qAux: TADOQuery;
begin
    {if (key = VK_RETURN) then
    begin
      if (Panel1.Enabled = true) then
      begin
        try
          qAux:= TADOQuery.Create(self);
          with qAux, sql do
          begin
            close;
            Connection:= dm.ADOConnection1;
            clear;
            add('select Pro.*, Forn.Nome_Fantasia, Forn2.Nome_Fantasia, Mar.Descricao, UM.Sigla, UM2.Sigla, Gru.Descricao, GPT.Descricao as Descricao_GPT, GPTC.Descricao as Descricao_GPTC,');
            add('GPTI.Descricao as Descricao_GPTI, GPTP.Descricao as Descricao_GPTP, ITP.Preco_Vista, ITP.Percentual_Desconto_Vista, ITP.Percentual_Desconto_Prazo from Produto Pro');
            add('left join Fornecedor Forn on (Pro.Codigo_Fornecedor = Forn.Codigo)');
            add('left join Fornecedor Forn2 on (Pro.Codigo_Fabricante = Forn2.Codigo)');
            add('left join Marca Mar on (Pro.Codigo_Marca = Mar.Codigo)');
            add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
            add('left join Unidade_Medida UM2 on (Pro.Codigo_Unidade_Volume = UM2.Codigo)');
            add('left join Grupo_Produto Gru on (Pro.Codigo_Grupo = Gru.Codigo)');
            add('left join Grupo_Produto_Tributacao GPT on (Pro.Codigo_Grupo_Tributacao = GPT.Codigo)');
            add('left join Grupo_Produto_Tributacao_COFINS GPTC on (Pro.Codigo_Grupo_Tributacao_COFINS = GPTC.Codigo)');
            add('left join Grupo_Produto_Tributacao_IPI GPTI on (Pro.Codigo_Grupo_Tributacao_IPI = GPTI.Codigo)');
            add('left join Grupo_Produto_Tributacao_PIS GPTP on (Pro.Codigo_Grupo_Tributacao_PIS = GPTP.Codigo)');
            add('left join Itens_Tabela_Preco ITP on (Pro.Codigo = ITP.Codigo_Produto)');
            add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
            add('where TP.Codigo = :Codigo_Tabela and Pro.Codigo_Venda = :Codigo');
            Parameters.ParamByName('Codigo').Value:= EdtCodigo_Produto.Text;
            Parameters.ParamByName('Codigo_Tabela').Value:= codigo_tabela_preco_ativo;
            open;

            if (IsEmpty = false) then
            begin
              FrmPDV.LblCodigo_Produto.Caption:= qAux.FieldByName('Codigo_Venda').AsString;
              FrmPDV.LblProduto.Caption:= qAux.FieldByName('Descricao').AsString;
              //Pega_Tabela_Preco(codigo_tabela_preco_padrao, CDSChama_ProdutoCodigo.AsInteger);
              FrmPDV.EdtValor_Unitario.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Preco_Vista').AsFloat); //FormatFloat('#0.0,0', CDSChama_ProdutoValor_Venda.AsFloat);
              FrmPDV.EdtValor_Unitario.Text:= StringReplace(FrmPDV.EdtValor_Unitario.Text, ThousandSeparator, '', [rfReplaceAll]);
              FrmPDV.LblUnidade.Caption:= qAux.FieldByName('Sigla').AsString; //CDSChama_ProdutoSigla.AsString;
              FrmPDV.IAT:= qAux.FieldByName('Arred_Trunc').AsString;
              FrmPDV.IPPT:= qAux.FieldByName('Producao_Propria').AsString;
              FrmPDV.tipo_prod:= qAux.FieldByName('Tipo').AsString;
              FrmPDV.tipo_trib:= qAux.FieldByName('Tipo_Tributacao').AsString;

              if (sem_rede = false) then
              begin
                if (qAux.FieldByName('Tipo').AsInteger = 0) then
                begin

                  //----icms----

                  Pega_ICMS_NC(qAux.FieldByName('Codigo_Grupo_Tributacao').AsInteger);

                  FrmPDV.LblST.Caption:= qAux_ICMS.FieldByName('Aliquota').AsString;
                  FrmPDV.LblICMS.Caption:= qAux_ICMS.FieldByName('Aliquota').AsString;
                  FrmPDV.LblCST.Caption:= qAux_ICMS.FieldByName('Codigo_Situacao').AsString;

                  if (qAux_ICMS.FieldByName('Base_Reduzida').AsString = 'SIM') then
                    FrmPDV.LblBase_Reduzida.Caption:= qAux_ICMS.FieldByName('Percentual_BC_Reduzida').AsString
                  else
                    FrmPDV.LblBase_Reduzida.Caption:= '';

                  if (qAux_ICMS.FieldByName('Base_Acrescida').AsString = 'SIM') then
                    FrmPDV.LblBase_Acrescida.Caption:= qAux_ICMS.FieldByName('Percentual_BC_Acrescida').AsString
                  else
                    FrmPDV.LblBase_Acrescida.Caption:= '';

                  //---- fim icms----

                  //----ipi----

                  Pega_IPI_NC(qAux.FieldByName('Codigo_Grupo_Tributacao_IPI').AsInteger);

                  FrmPDV.LblIPI.Caption:= qAux_IPI.FieldByName('Aliquota').AsString;
                  FrmPDV.LblCST_IPI.Caption:= qAux_IPI.FieldByName('Codigo_Situacao').AsString;

                  if (qAux_IPI.FieldByName('Base_Reduzida').AsString = 'SIM') then
                    FrmPDV.LblBase_Reduzida_IPI.Caption:= qAux_IPI.FieldByName('Percentual_BC_Reduzida').AsString
                  else
                    FrmPDV.LblBase_Reduzida_IPI.Caption:= '';

                  if (qAux_IPI.FieldByName('Base_Acrescida').AsString = 'SIM') then
                    FrmPDV.LblBase_Acrescida_IPI.Caption:= qAux_IPI.FieldByName('Percentual_BC_Acrescida').AsString
                  else
                    FrmPDV.LblBase_Acrescida_IPI.Caption:= '';

                  //----fim ipi----

                  //----pis----

                  Pega_PIS_NC(qAux.FieldByName('Codigo_Grupo_Tributacao_PIS').AsInteger);

                  FrmPDV.LblPIS.Caption:= qAux_PIS.FieldByName('Aliquota').AsString;
                  FrmPDV.LblCST_PIS.Caption:= qAux_PIS.FieldByName('Codigo_Situacao').AsString;

                  if (qAux_PIS.FieldByName('Base_Reduzida').AsString = 'SIM') then
                    FrmPDV.LblBase_Reduzida_PIS.Caption:= qAux_PIS.FieldByName('Percentual_BC_Reduzida').AsString
                  else
                    FrmPDV.LblBase_Reduzida_PIS.Caption:= '';

                  if (qAux_PIS.FieldByName('Base_Acrescida').AsString = 'SIM') then
                    FrmPDV.LblBase_Acrescida_PIS.Caption:= qAux_PIS.FieldByName('Percentual_BC_Acrescida').AsString
                  else
                    FrmPDV.LblBase_Acrescida_PIS.Caption:= '';

                  //---- fim pis----

                  //----cofins----

                  Pega_COFINS_NC(qAux.FieldByName('Codigo_Grupo_Tributacao_COFINS').AsInteger);

                  FrmPDV.LblCOFINS.Caption:= qAux_COFINS.FieldByName('Aliquota').AsString;
                  FrmPDV.LblCST_COFINS.Caption:= qAux_COFINS.FieldByName('Codigo_Situacao').AsString;

                  if (qAux_COFINS.FieldByName('Base_Reduzida').AsString = 'SIM') then
                    FrmPDV.LblBase_Reduzida_COFINS.Caption:= qAux_COFINS.FieldByName('Percentual_BC_Reduzida').AsString
                  else
                    FrmPDV.LblBase_Reduzida_COFINS.Caption:= '';

                  if (qAux_COFINS.FieldByName('Base_Acrescida').AsString = 'SIM') then
                    FrmPDV.LblBase_Acrescida_COFINS.Caption:= qAux_COFINS.FieldByName('Percentual_BC_Acrescida').AsString
                  else
                    FrmPDV.LblBase_Acrescida_COFINS.Caption:= '';

                  //---- fim cofins----

                end
                else
                begin
                  Pega_ISS(qAux.FieldByName('Codigo_Grupo_Tributacao_ISSQN').AsInteger);

                  FrmPDV.LblST.Caption:= qAux_ISS.FieldByName('Aliquota').AsString;
                  FrmPDV.LblICMS.Caption:= qAux_ISS.FieldByName('Aliquota').AsString;
                  FrmPDV.LblCST.Caption:= '00';

                  if (qAux_ISS.FieldByName('Base_Reduzida').AsString = 'SIM') then
                    FrmPDV.LblBase_Reduzida.Caption:= qAux_ISS.FieldByName('Percentual_BC_Reduzida').AsString
                  else
                    FrmPDV.LblBase_Reduzida.Caption:= '';

                  if (qAux_ISS.FieldByName('Base_Acrescida').AsString = 'SIM') then
                    FrmPDV.LblBase_Acrescida.Caption:= qAux_ISS.FieldByName('Percentual_BC_Acrescida').AsString
                  else
                    FrmPDV.LblBase_Acrescida.Caption:= '';

                end;
              end
              else
              begin
                if (qAux.FieldByName('Tipo').AsInteger = 0) then
                begin
                  //---- icms---
                  dm.qryicms.LoadFromFile(Local_Arquivo(20));
                  dm.qryicms.Locate('Codigo_Grupo_Tributacao', qAux.FieldByName('Codigo_Grupo_Tributacao').AsInteger, []);

                  FrmPDV.LblST.Caption:= dm.qryicmsAliquota.AsString;
                  FrmPDV.LblICMS.Caption:= dm.qryicmsAliquota.AsString;
                  FrmPDV.LblCST.Caption:= dm.qryicmsCodigo_Situacao.AsString;

                  if (dm.qryicms.FieldByName('Base_Reduzida').AsString = 'SIM') then
                    FrmPDV.LblBase_Reduzida.Caption:= dm.qryicms.FieldByName('Percentual_BC_Reduzida').AsString
                  else
                    FrmPDV.LblBase_Reduzida.Caption:= '';

                  if (dm.qryicms.FieldByName('Base_Acrescida').AsString = 'SIM') then
                    FrmPDV.LblBase_Acrescida.Caption:= dm.qryicms.FieldByName('Percentual_BC_Acrescida').AsString
                  else
                    FrmPDV.LblBase_Acrescida.Caption:= '';

                    //---- fim icms----

                  //---- ipi---
                  dm.qryipi.LoadFromFile(Local_Arquivo(22));
                  dm.qryipi.Locate('Codigo_Grupo_Tributacao_IPI', qAux.FieldByName('Codigo_Grupo_Tributacao_IPI').AsInteger, []);

                  FrmPDV.LblIPI.Caption:= dm.qryipiAliquota.AsString;
                  FrmPDV.LblCST_IPI.Caption:= dm.qryipiCodigo_Situacao.AsString;

                  if (dm.qryipi.FieldByName('Base_Reduzida').AsString = 'SIM') then
                    FrmPDV.LblBase_Reduzida_IPI.Caption:= dm.qryipi.FieldByName('Percentual_BC_Reduzida').AsString
                  else
                    FrmPDV.LblBase_Reduzida_IPI.Caption:= '';

                  if (dm.qryipi.FieldByName('Base_Acrescida').AsString = 'SIM') then
                    FrmPDV.LblBase_Acrescida_IPI.Caption:= dm.qryipi.FieldByName('Percentual_BC_Acrescida').AsString
                  else
                    FrmPDV.LblBase_Acrescida_IPI.Caption:= '';

                    //---- fim ipi----

                  //---- pis---
                  dm.qrypis.LoadFromFile(Local_Arquivo(23));
                  dm.qrypis.Locate('Codigo_Grupo_Tributacao_PIS', qAux.FieldByName('Codigo_Grupo_Tributacao_PIS').AsInteger, []);

                  FrmPDV.LblPIS.Caption:= dm.qrypisAliquota.AsString;
                  FrmPDV.LblCST_PIS.Caption:= dm.qrypisCodigo_Situacao.AsString;

                  if (dm.qrypis.FieldByName('Base_Reduzida').AsString = 'SIM') then
                    FrmPDV.LblBase_Reduzida_PIS.Caption:= dm.qrypis.FieldByName('Percentual_BC_Reduzida').AsString
                  else
                    FrmPDV.LblBase_Reduzida_PIS.Caption:= '';

                  if (dm.qrypis.FieldByName('Base_Acrescida').AsString = 'SIM') then
                    FrmPDV.LblBase_Acrescida_PIS.Caption:= dm.qrypis.FieldByName('Percentual_BC_Acrescida').AsString
                  else
                    FrmPDV.LblBase_Acrescida_PIS.Caption:= '';

                    //---- fim pis----

                  //---- COFINS---
                  dm.qrycofins.LoadFromFile(Local_Arquivo(24));
                  dm.qrycofins.Locate('Codigo_Grupo_Tributacao_COFINS', qAux.FieldByName('Codigo_Grupo_Tributacao_COFINS').AsInteger, []);

                  FrmPDV.LblCOFINS.Caption:= dm.qrycofinsAliquota.AsString;
                  FrmPDV.LblCST_COFINS.Caption:= dm.qrycofinsCodigo_Situacao.AsString;

                  if (dm.qrycofins.FieldByName('Base_Reduzida').AsString = 'SIM') then
                    FrmPDV.LblBase_Reduzida_COFINS.Caption:= dm.qrycofins.FieldByName('Percentual_BC_Reduzida').AsString
                  else
                    FrmPDV.LblBase_Reduzida_COFINS.Caption:= '';

                  if (dm.qrycofins.FieldByName('Base_Acrescida').AsString = 'SIM') then
                    FrmPDV.LblBase_Acrescida_COFINS.Caption:= dm.qrycofins.FieldByName('Percentual_BC_Acrescida').AsString
                  else
                    FrmPDV.LblBase_Acrescida_COFINS.Caption:= '';

                    //---- fim COFINS----

                end
                else
                begin
                  dm.qryiss.LoadFromFile(Local_Arquivo(21));
                  dm.qryiss.Locate('Codigo_Grupo_Tributacao_ISSQN', qAux.FieldByName('Codigo_Grupo_Tributacao_ISSQN').AsInteger, []);
                  FrmPDV.LblST.Caption:= dm.qryissAliquota.AsString;
                  FrmPDV.LblICMS.Caption:= dm.qryissAliquota.AsString;
                  FrmPDV.LblCST.Caption:= '00';

                  if (dm.qryiss.FieldByName('Base_Reduzida').AsString = 'SIM') then
                    FrmPDV.LblBase_Reduzida.Caption:= dm.qryiss.FieldByName('Percentual_BC_Reduzida').AsString
                  else
                    FrmPDV.LblBase_Reduzida.Caption:= '';

                  if (dm.qryiss.FieldByName('Base_Acrescida').AsString = 'SIM') then
                    FrmPDV.LblBase_Acrescida.Caption:= dm.qryiss.FieldByName('Percentual_BC_Acrescida').AsString
                  else
                    FrmPDV.LblBase_Acrescida.Caption:= '';

                end;
              end;

              FrmPDV.cod_produto:= qAux.FieldByName('Codigo').AsInteger; //CDSChama_ProdutoCodigo.AsInteger;
              FrmPDV.codigo_produto:= qAux.FieldByName('Codigo_Venda').AsString; //CDSChama_ProdutoCodigo_Venda.AsString;
              FrmPDV.descricao:= qAux.FieldByName('Descricao').AsString; //CDSChama_ProdutoDescricao.AsString;
              FrmPDV.unid_med:= qAux.FieldByName('Sigla').AsString; //CDSChama_ProdutoSigla.AsString;

              FrmPDV.var_uni:= qAux.FieldByName('Preco_Vista').AsFloat;
              permissao_venda:= qAux.FieldByName('Em_Estoque_Minimo').AsString;
              permissao_compra:= qAux.FieldByName('Em_Estoque_Maximo').AsString;
              estoque_minimo:= qAux.FieldByName('Estoque_Minimo').AsFloat;
              estoque_maximo:= qAux.FieldByName('Estoque_Maximo').AsFloat;
              qtde_estoque:= qAux.FieldByName('Estoque').AsFloat;

              Verifica_Produto_Lancado;
              LblCodigo_Produto.Refresh;
              LblProduto.Refresh;
              LblUnidade.Refresh;
              EdtValor_Unitario.Refresh;
              LblST.Refresh;
              EdtAcre_Desc.Refresh;
              EdtQuantidade.Refresh;
              EdtValor_Total.Refresh;

              //EdtValor_Total.SetFocus;
              Insere_Dados;
              //EdtCodigo_Produto.SetFocus;
            end
            else
            begin
              EdtValor_Total.SetFocus;
              Mensagem_Produto_Nao_Encontrado;
              abort;
            end;
          end;
        finally
          FreeAndNil(qAux);
        end;
      end;
    end;}
end;

procedure TFrmPDV.EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    if (EdtCodigo_Produto.Text <> '') then
    begin
      //Verifica_Permissao_Lancar_Produto;
      Pega_Produto_Codigo_Barra;
    end
    else
    begin
      if (pode_encerrar = true) then
      begin
        TLog.Debug('Deu enter para finalizar o cupom fiscal.');
        TLog.Debug('Vai executar o método PreencheObjetoDadosNFEItens pelo Enter.');
        PreencheObjetoDadosNFEItens;
        TLog.Debug('Executou o método PreencheObjetoDadosNFEItens pelo Enter.');
        Application.CreateForm(TFrmFechamento_Venda_PDV, FrmFechamento_Venda_PDV);
        Centraliza_Form(FrmFechamento_Venda_PDV);
        FrmFechamento_Venda_PDV.Show;
        //FrmFechamento_Venda_PDV.Free;
      end;
    end;
  end;
end;

procedure TFrmPDV.PreencheObjetoDadosNFEItens;
begin
  TLog.Info('--- MÉTODO PreencheObjetoDadosNFEItens ---');
  dm.qryitens_venda.First;
  DadosEmissaoNFE.Itens.Clear;
  try
    while not dm.qryitens_venda.Eof do
    begin
      DadosEmissaoNFEItens:= TDadosEmissaoNFEItens.Create;
      DadosEmissaoNFEItens.NCM:= dm.qryitens_vendaNCM.AsString;
      DadosEmissaoNFEItens.DescricaoProduto:= dm.qryitens_vendaDescricao.AsString;
      DadosEmissaoNFEItens.CodigoVenda:= dm.qryitens_vendaCodigo_Venda.AsString;
      DadosEmissaoNFEItens.CSOSN:= dm.qryitens_vendaCSOSN.AsString;
      DadosEmissaoNFEItens.CST:= dm.qryitens_vendaCST.AsString;
      DadosEmissaoNFEItens.ValorUnitario:= dm.qryitens_vendaValor_Unitario.AsFloat;
      DadosEmissaoNFEItens.CFOP:= dm.qryitens_vendaCFOP.AsString;
      DadosEmissaoNFEItens.Unidade:= dm.qryitens_vendaUN.AsString;
      DadosEmissaoNFEItens.Quantidade:= dm.qryitens_vendaQtde.AsFloat;
      DadosEmissaoNFEItens.ValorUnitario:= dm.qryitens_vendaValor_Unitario.AsFloat;
      DadosEmissaoNFEItens.ValorOriginal:= dm.qryitens_vendaValor_Unitario.AsFloat;
      DadosEmissaoNFEItens.ValorFrete:= 0;
      DadosEmissaoNFEItens.ValorSeguro:= 0;
      DadosEmissaoNFEItens.DouA:= dm.qryitens_vendadOUa.AsString;
      DadosEmissaoNFEItens.DescAcr:= dm.qryitens_vendaDesc_Acr.AsFloat;
      DadosEmissaoNFEItens.OutrasDespesas:= 0;
      DadosEmissaoNFEItens.AliquotaCalculoCredito:= dm.qryitens_vendaAliquota_Calculo_Credito.AsFloat;
      DadosEmissaoNFEItens.CreditoICMS:= dm.qryitens_vendaCredito_ICMS.AsString;
      DadosEmissaoNFEItens.TipoCalculoBCICMS:= dm.qryitens_vendaTipo_Calculo_BC_ICMS.AsString;
      DadosEmissaoNFEItens.TipoCalculoBCICMSST:= dm.qryitens_vendaTipo_Calculo_BC_ICMS_ST.AsString;
      DadosEmissaoNFEItens.MVAST:= '0';
      DadosEmissaoNFEItens.BCST:= '0';
      DadosEmissaoNFEItens.ICMSST:= '0';
      DadosEmissaoNFEItens.ValorICMSST:= '0';
      DadosEmissaoNFEItens.BC:= dm.qryitens_vendaBC.AsString;
      DadosEmissaoNFEItens.BCReduzida:= dm.qryitens_vendaBase_Reduzida.AsString;
      DadosEmissaoNFEItens.BCICMS:= dm.qryitens_vendaBC.AsString;
      DadosEmissaoNFEItens.ICMS:= dm.qryitens_vendaICMS.AsString;
      DadosEmissaoNFEItens.ValorICMS:= dm.qryitens_vendaValor_ICMS.AsString;
      DadosEmissaoNFEItens.BCIPI:= dm.qryitens_vendaBC_IPI.AsString;
      DadosEmissaoNFEItens.IPI:= dm.qryitens_vendaIPI.AsString;
      DadosEmissaoNFEItens.ValorIPI:= dm.qryitens_vendaValor_IPI.AsString;
      DadosEmissaoNFEItens.CSTIPI:= dm.qryitens_vendaCST_IPI.AsString;
      DadosEmissaoNFEItens.CSTPIS:= dm.qryitens_vendaCST_PIS.AsString;
      DadosEmissaoNFEItens.BCPIS:= dm.qryitens_vendaBC_PIS.AsString;
      DadosEmissaoNFEItens.PIS:= dm.qryitens_vendaPIS.AsString;
      DadosEmissaoNFEItens.ValorPIS:= dm.qryitens_vendaValor_PIS.AsString;
      DadosEmissaoNFEItens.CSTCOFINS:= dm.qryitens_vendaCST_COFINS.AsString;
      DadosEmissaoNFEItens.BCCOFINS:= dm.qryitens_vendaBC_COFINS.AsString;
      DadosEmissaoNFEItens.COFINS:= dm.qryitens_vendaCOFINS.AsString;
      DadosEmissaoNFEItens.ValorCOFINS:= dm.qryitens_vendaValor_COFINS.AsString;
      DadosEmissaoNFEItens.Origem:= dm.qryitens_vendaOrigem.AsInteger;
      DadosEmissaoNFE.Itens.Add(DadosEmissaoNFEItens);
      dm.qryitens_venda.Next;
    end;
  except on E:Exception do
  begin
    TLog.Error('Erro ao preencher objeto DadosEmissaoNFEItens: '+E.Message);
  end;
  end;
  TLog.Info('--- FIM MÉTODO PreencheObjetoDadosNFEItens ---');
end;

procedure TFrmPDV.EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmPDV.Pega_Produto_Codigo_Barra;
var
  aux, total_pagar, quantidade, peso, aux2: AnsiString;
  aux_qtde: double;
  tem_total_pagar, tem_peso: boolean;
  Conec: TADOConnection;
begin
  if (Iniciado = false) then
  begin
    Atualiza_Produto(4, '');
  end;

  if (tipo_local = '0101') then
  begin
    Conec:= dm.ADOConnectionLocal;
  end
  else
  begin
    Conec:= dm.ADOConnection1;
  end;

  cod_prod:= '';
  cod_prod:= Remove_Zero_Esquerda(EdtCodigo_Produto.Text);
  tem_total_pagar:= false;
  tem_peso:= false;

  if ( Length(cod_prod) = 13) and ( copy(cod_prod, 1,1) = '2' ) then
  begin
    if (ean_balanca = 0) then
    begin
      cod_prod:= copy(EdtCodigo_Produto.Text, 2,4);
      total_pagar:= copy(EdtCodigo_Produto.Text, 7,6);
      total_pagar:= FormatFloat('#0.0,0', StrToFloat(total_pagar));
      total_pagar:= StringReplace(total_pagar, ThousandSeparator, '', [rfReplaceAll]);
      total_pagar:= FloatToStr( StrToFloat(total_pagar) / 100);
      tem_total_pagar:= true;
      //ShowMessage(total_pagar);
    end
    else if (ean_balanca = 1) then
    begin
      cod_prod:= copy(EdtCodigo_Produto.Text, 2,4);
      peso:= copy(EdtCodigo_Produto.Text, 8,5);
      peso:= FormatFloat('#0.0,0', StrToFloat(peso));
      peso:= StringReplace(peso, ThousandSeparator, '', [rfReplaceAll]);
      peso:= FloatToStr( StrToFloat(peso) / 1000);
      tem_peso:= true;
    end
    else if (ean_balanca = 2) then
    begin
      cod_prod:= copy(EdtCodigo_Produto.Text, 2,4);
      quantidade:= copy(EdtCodigo_Produto.Text, 8,5);
    end
    else if (ean_balanca = 3) then
    begin
      cod_prod:= copy(EdtCodigo_Produto.Text, 2,5);
      total_pagar:= copy(EdtCodigo_Produto.Text, 7,6);
      total_pagar:= FormatFloat('#0.0,0', StrToFloat(total_pagar));
      total_pagar:= StringReplace(total_pagar, ThousandSeparator, '', [rfReplaceAll]);
      total_pagar:= FloatToStr( StrToFloat(total_pagar) / 100);
      tem_total_pagar:= true;
    end
    else if (ean_balanca = 4) then
    begin
      cod_prod:= copy(EdtCodigo_Produto.Text, 2,5);
      peso:= copy(EdtCodigo_Produto.Text, 8,5);
      peso:= FormatFloat('#0.0,0', StrToFloat(peso));
      peso:= StringReplace(peso, ThousandSeparator, '', [rfReplaceAll]);
      peso:= FloatToStr( StrToFloat(peso) / 1000);
      tem_peso:= true;
    end
    else if (ean_balanca = 5) then
    begin
      cod_prod:= copy(EdtCodigo_Produto.Text, 2,5);
      quantidade:= copy(EdtCodigo_Produto.Text, 8,5);
    end
    else if (ean_balanca = 6) then
    begin
      cod_prod:= copy(EdtCodigo_Produto.Text, 2,6);
      peso:= copy(EdtCodigo_Produto.Text, 8,5);
      peso:= FormatFloat('#0.0,0', StrToFloat(peso));
      peso:= StringReplace(peso, ThousandSeparator, '', [rfReplaceAll]);
      peso:= FloatToStr( StrToFloat(peso) / 1000);
      tem_peso:= true;
    end
    else if (ean_balanca = 7) then
    begin
      cod_prod:= copy(EdtCodigo_Produto.Text, 2,6);
      quantidade:= copy(EdtCodigo_Produto.Text, 8,5);
    end
    else if (ean_balanca = 8) then
    begin
      cod_prod:= copy(EdtCodigo_Produto.Text, 2,6);
      total_pagar:= copy(EdtCodigo_Produto.Text, 8,5);
      total_pagar:= FormatFloat('#0.0,0', StrToFloat(total_pagar));
      total_pagar:= StringReplace(total_pagar, ThousandSeparator, '', [rfReplaceAll]);
      total_pagar:= FloatToStr( StrToFloat(total_pagar) / 100);
      tem_total_pagar:= true;
    end;

    cod_prod:= IntToStr(StrToInt(cod_prod));
    cod_prod:= StringOfChar('0', 12-Length(cod_prod)) + cod_prod;
    aux2:= CalculaDigEAN13(cod_prod);

    cod_prod:= cod_prod + aux2; //testar aqui para ver se vai pegar
  end                                                                   //o codigo e mais o digito validador
  else if ( Length(cod_prod) < 13) then//and ( copy(cod_prod, 1,1) <> '2' ) then
  begin
    cod_prod:= StringOfChar('0', 13-Length(cod_prod)) + cod_prod;
    //aux2:= CalculaDigEAN13(cod_prod);
    //cod_prod:= cod_prod + aux2;
  end                                                                   //o codigo e mais o digito validador
  else if ( Length(cod_prod) = 13) and ( copy(cod_prod, 1,1) <> '2' ) then
  begin
    //cod_prod:= IntToStr(StrToInt(cod_prod));
    //cod_prod:= StringOfChar('0', 13-Length(cod_prod)) + cod_prod;
    cod_prod:= cod_prod;
    //aux2:= CalculaDigEAN13(cod_prod);
    //cod_prod:= cod_prod + aux2;
  end;

  if (dm.qrychama_produto.Locate('Codigo_Venda', cod_prod, [])) then
  begin

    if (dm.qrychama_produtoNCM.AsString = '') then
    begin
      if (Application.MessageBox(PChar('O código NCM do produto '+dm.qrychama_produtoDescricao.AsString+' ESTÁ EM BRANCO. Para calcular o imposto na nota, é necessário configura-lo. Deseja continuar?'), 'NCM não encontrado', MB_YESNO+MB_ICONEXCLAMATION)) = IDNO then
      begin
        abort;
      end;
    end;

    if not (Verifica_NCM_Ja_Existe(dm.qrychama_produtoNCM.AsString, DM.ADOConnection1)) then
    begin
      if (Application.MessageBox(PChar('O código NCM do produto '+dm.qrychama_produtoDescricao.AsString+' NÃO FOI ENCONTRADO no cadastro de NCM. Para calcular o imposto na nota, é necessário configura-lo. Deseja continuar?'), 'NCM não encontrado', MB_YESNO+MB_ICONEXCLAMATION)) = IDNO then
      begin
        abort;
      end;
    end;

    FrmPDV.cod_produto:= dm.qrychama_produtoCodigo.AsInteger; //dm.qrychama_produtoCodigo.AsInteger;
    FrmPDV.EdtCodigo_Produto.Text:= dm.qrychama_produtoCodigo_Venda.AsString;
    FrmPDV.LblProduto.Caption:= dm.qrychama_produtoDescricao.AsString;
    FrmPDV.LblProduto.Refresh;
    FrmPDV.codigo_produto:= dm.qrychama_produtoCodigo_Venda.AsString; //dm.qrychama_produtoCodigo_Venda.AsString;
    FrmPDV.descricao:= dm.qrychama_produtoDescricao.AsString; //dm.qrychama_produtoDescricao.AsString;
    FrmPDV.unid_med:= dm.qrychama_produtoSigla.AsString; //dm.qrychama_produtoSigla.AsString;
    FrmPDV.tipo_prod:= dm.qrychama_produtoTipo.AsString;

    FrmPDV.LblNCM.Caption:= dm.qrychama_produtoNCM.AsString;

    FrmPDV.EdtValor_Unitario.Text:= FormatFloat('#0.0,0', dm.qrychama_produtoPreco_Vista.AsFloat);
    FrmPDV.EdtValor_Unitario.Text:= StringReplace(FrmPDV.EdtValor_Unitario.Text, ThousandSeparator, '', [rfReplaceAll]);
    FrmPDV.EdtValor_Unitario.Refresh;
    FrmPDV.valor_compra:= dm.qrychama_produtoValor_Compra.AsFloat;
    FrmPDV.valor_compra_nota:= dm.qrychama_produtoValor_Compra_Unitario.AsFloat;
    FrmPDV.IAT:= dm.qrychama_produtoArred_Trunc.AsString;
    FrmPDV.IPPT:= dm.qrychama_produtoProducao_Propria.AsString;
    grupo_produto_tributacao_icms:= dm.qrychama_produtoCodigo_Grupo_Tributacao.AsString;

    FrmPDV.var_uni:= dm.qrychama_produtoPreco_Vista.AsFloat;
    FrmPDV.novo_valor_uni:= dm.qrychama_produtoPreco_Vista.AsFloat;

    permissao_venda:= dm.qrychama_produtoEm_Estoque_Minimo.AsString;
    permissao_compra:= dm.qrychama_produtoEm_Estoque_Maximo.AsString;
    estoque_minimo:= dm.qrychama_produtoEstoque_Minimo.AsFloat;
    estoque_maximo:= dm.qrychama_produtoEstoque_Maximo.AsFloat;
    qtde_estoque:= dm.qrychama_produtoEstoque.AsFloat;
    FrmPDV.pesquisa:= true;

    if (dm.qrychama_produtoTipo.AsInteger = 0) then
    begin

      //----icms----

      Pega_ICMS_NC(dm.qrychama_produtoCodigo_Grupo_Tributacao.AsInteger, dm.ADOConnection1);

      FrmPDV.LblCFOP.Caption:= qAux_ICMS.FieldByName('CFOP_D').AsString;
      FrmPDV.LblST.Caption:= qAux_ICMS.FieldByName('Aliquota').AsString;
      FrmPDV.LblST.Refresh;
      icms:= qAux_ICMS.FieldByName('Aliquota').AsString;
      cst_icms:= qAux_ICMS.FieldByName('Codigo_Situacao').AsString;
      csosn:= qAux_ICMS.FieldByName('Codigo_CSOSN').AsString;

      permite_credito:= qAux_ICMS.FieldByName('Permite_Credito').AsInteger;
      codigo_obs_Fiscal:= qAux_ICMS.FieldByName('Codigo_Obs_Fiscal').AsInteger;

      tipo_calculo_bc_icms:= qAux_ICMS.FieldByName('Tipo_Calculo_BC_ICMS').AsString;
      tipo_calculo_bc_icms_st:= qAux_ICMS.FieldByName('Tipo_Calculo_BC_ICMS_ST').AsString;
      tipo_recolhimento_icms:= qAux_ICMS.FieldByName('Tipo_Recolhimento').AsString;

      if (tipo_recolhimento_icms = 'I') then
        FrmPDV.tipo_trib:= 'I'
      else if (tipo_recolhimento_icms = 'NT') then
        FrmPDV.tipo_trib:= 'N'
      else if (tipo_recolhimento_icms = 'ST') then
        FrmPDV.tipo_trib:= 'F'
      else FrmPDV.tipo_trib:= 'T';

      br_icms:= qAux_ICMS.FieldByName('Percentual_BC_Reduzida').AsString;

      //---- fim icms----


      //----ipi----

      Pega_IPI_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao_IPI.AsInteger, Conec);

      ipi:= qAux_IPI.FieldByName('Aliquota').AsString;
      cst_ipi:= qAux_IPI.FieldByName('Codigo_Situacao').AsString;

      if (qAux_IPI.FieldByName('Base_Reduzida').AsString = 'SIM') then
        br_ipi:= qAux_IPI.FieldByName('Percentual_BC_Reduzida').AsString
      else
        br_ipi:= '';

      if (qAux_IPI.FieldByName('Base_Acrescida').AsString = 'SIM') then
        ba_ipi:= qAux_IPI.FieldByName('Percentual_BC_Acrescida').AsString
      else
        ba_ipi:= '';

      //----fim ipi----

      //----pis----

      Pega_PIS_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao_PIS.AsInteger, Conec);

      pis:= qAux_PIS.FieldByName('Aliquota').AsString;
      cst_pis:= qAux_PIS.FieldByName('Codigo_Situacao').AsString;

      if (qAux_PIS.FieldByName('Base_Reduzida').AsString = 'SIM') then
        br_pis:= qAux_PIS.FieldByName('Percentual_BC_Reduzida').AsString
      else
        br_pis:= '';

      if (qAux_PIS.FieldByName('Base_Acrescida').AsString = 'SIM') then
        ba_pis:= qAux_PIS.FieldByName('Percentual_BC_Acrescida').AsString
      else
        ba_pis:= '';

      //---- fim pis----

      //----cofins----

      Pega_COFINS_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao_COFINS.AsInteger, Conec);

      cofins:= qAux_COFINS.FieldByName('Aliquota').AsString;
      cst_cofins:= qAux_COFINS.FieldByName('Codigo_Situacao').AsString;

      if (qAux_COFINS.FieldByName('Base_Reduzida').AsString = 'SIM') then
        br_cofins:= qAux_COFINS.FieldByName('Percentual_BC_Reduzida').AsString
      else
        br_cofins:= '';

      if (qAux_COFINS.FieldByName('Base_Acrescida').AsString = 'SIM') then
        ba_cofins:= qAux_COFINS.FieldByName('Percentual_BC_Acrescida').AsString
      else
        ba_cofins:= '';

      //---- fim cofins----

    end;

    if (iniciado = false) then
    begin
      AbreCupom;
      Atualiza_Dados;
    end;

    //codigo_produto_inteiro:= qAux.FieldByName('Codigo').AsInteger; //qrychama_produtoCodigo.AsInteger;

    if (tem_total_pagar) then
    begin
      aux_qtde:= StrToFloat(total_pagar) / var_uni;
      EdtQuantidade.Text:= FormatFloat('#0.0,00', aux_qtde);
      EdtQuantidade.Text:= StringReplace(EdtQuantidade.Text, ThousandSeparator, '', [rfReplaceAll]);
    end;

    if (tem_peso) then
    begin
      aux_qtde:= StrToFloat(peso);
      EdtQuantidade.Text:= FormatFloat('#0.0,00', aux_qtde);
      EdtQuantidade.Text:= StringReplace(EdtQuantidade.Text, ThousandSeparator, '', [rfReplaceAll]);
    end;

    //VendeItem;
    Insere_Dados;

  end
  else
  begin
    Application.MessageBox('Produto não encontrado', 'Não encontrado', MB_OK+MB_ICONHAND);
    EdtCodigo_Produto.Clear;
    EdtCodigo_Produto.SetFocus;
    abort;
  end;
end;

function TFrmPDV.removerFichaEstoque: Boolean;
var
  PedidoDominio : IPedidoDominio;
begin
  try
    try
      Result := False;
      PedidoDominio := TPedidoDominio.Create(dm.ADOConnection1);
      Result := PedidoDominio.removerFichaEstoque(StrToInt(LblCodigo.Caption));
    except
      on E : Exception do
        TLog.Error(Self.ClassName+' - removerFichaEstoque - '+E.Message);
    end;
  finally
    PedidoDominio := nil;
  end;
end;

procedure TFrmPDV.EdtQuantidadeExit(Sender: TObject);
begin
  Verifica_Edit_Branco(EdtQuantidade);

  if (EdtQuantidade.Text = '') then
  begin
    Valor_Invalido;
    EdtQuantidade.SetFocus;
    abort;
  end;

  if (Length(EdtQuantidade.Text)) > 6 then
  begin
    Valor_Invalido;
    EdtQuantidade.SetFocus;
    abort;
  end;

  Verifica_Valor_Negativo( StrToFloat(EdtQuantidade.Text), EdtQuantidade);

  //EdtValor_Unitario.SetFocus;
end;

procedure TFrmPDV.Verifica_Permissao_Lancar_Produto;
begin
  if (Habilitado = false) then
  begin
    UDeclaracao.Mensagem_Erro;
    abort;
  end;

  if (LblProduto.Caption = '') and (EdtQuantidade.Text <> '1') then
  begin
    EdtValor_Total.SetFocus;
    //UDeclaracao.Mensagem_Codigo_Barra;
    abort;
  end;

  if (StrToFloat(EdtQuantidade.Text) <= 0) then
  begin
    UDeclaracao.Mensagem_Falta_Dados;
    EdtQuantidade.SetFocus;
    abort;
  end;

  if (EdtCodigo_Produto.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Produto.SetFocus;
    abort;
  end;

  {if (StrToFloat(EdtAcre_Desc.Text) >= StrToFloat(EdtValor_Unitario.Text)) then
  begin
    UDeclaracao.Mensagem_Falta_Dados;
    EdtValor_Unitario.SetFocus;
    abort;
  end;}

end;

procedure TFrmPDV.EdtQuantidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    if (EdtQuantidade.Text = '') then
    begin
      Valor_Invalido;
      EdtQuantidade.SetFocus;
      abort;
    end;

    Verifica_Permissao_Lancar_Produto;
    Verifica_Erros_Ao_Gerar_Cupom;
    //Verifica_Produto_Lancado;
    Insere_Dados;
    //EdtCodigo_Produto.SetFocus;
  end;
end;

procedure TFrmPDV.EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmPDV.EdtValor_TotalExit(Sender: TObject);
//var
  //v_un, qtde, total, resul, valor_total, total_produto: double;
begin
   Verifica_Valor_Negativo_Desconto(StrToFloat(EdtValor_Total.Text), EdtValor_Total);
 {    total_produto:= StrToFloat(EdtValor_Total.Text);
    valor_total:= StrToFloat(LblSub_Total.Caption);
    v_un:= novo_valor_uni;
    total:= total_produto / v_un;
    LblTotal.Caption:= FloatToStr(total);
    EdtQuantidade.Text:= FormatFloat('#0.0,0', total);
    EdtQuantidade.Text:= StringReplace(EdtQuantidade.Text, ThousandSeparator, '', [rfReplaceAll]);

    resul:= valor_total + total_produto;
    LblSub_Total.Caption:= FormatFloat('#0.0,0', resul);
    LblSub_Total.Caption:= StringReplace(LblSub_Total.Caption, ThousandSeparator, '', [rfReplaceAll]); }
end;

procedure TFrmPDV.EdtValor_TotalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  scodigo,sdescricao,stipoqtde,sqtde,svalor,stipo,sdesc_acr, sdesconto,sacrecimo,totaux,dOUa,aliquotacupom: AnsiString;
  v_un, qtde, total, resul, valor_total, total_produto: double;
begin
  if (key = vk_return) then
  begin
    if (Habilitado = false) then
    begin
      UDeclaracao.Mensagem_Erro;
      abort;
    end;

    if (unid_med = 'MG') or (unid_med = 'KG') or (unid_med = 'G') or (unid_med = 'TL') then
    begin
      //Verifica_Permissao_Impressora;
      Verifica_Permissao_Valor_Total;
      Verifica_Produto_Lancado;

      total_produto:= StrToFloat(EdtValor_Total.Text);

      valor_total:= StrToFloat(LblSub_Total.Caption);
      v_un:= novo_valor_uni;
      total:= total_produto / v_un;

      //LblTotal.Caption:= FloatToStr(total);
      EdtQuantidade.Text:= FormatFloat('#0.0,00', total);
      EdtQuantidade.Text:= StringReplace(EdtQuantidade.Text, ThousandSeparator, '', [rfReplaceAll]);
      EdtQuantidade.Refresh;

      resul:= valor_total + total_produto;
      LblSub_Total.Caption:= FormatFloat('#0.0,0', resul);
      LblSub_Total.Caption:= StringReplace(LblSub_Total.Caption, ThousandSeparator, '', [rfReplaceAll]);

      sCodigo    := StringOfChar('0', 12-Length(codigo_produto)) + codigo_produto;
      sCodigo    := Copy(sCodigo,1,12);
      sDescricao := Copy(descricao,1,29);
      UDeclaracao.tot_par:= '';

    if (tipo_trib = 'T') or (tipo_trib = 'S') then
    begin
      if Length(LblST.Caption) = 1 then
      begin
        sAliquota  := '0' + LblST.Caption + '00'; //0700
        totaux  := '0' + LblST.Caption + '00'; //0700
        aliquotacupom:= LblST.Caption;
      end
      else if Length(LblST.Caption) = 2 then
      begin
        sAliquota  := LblST.Caption + '00';       //1200
        totaux  := LblST.Caption + '00';      //1200
        aliquotacupom:= LblST.Caption;
      end
      else if Length(LblST.Caption) = 3 then
      begin
        saliquota:= StringReplace(LblST.Caption, ',', '', [rfReplaceAll]);
        aliquotacupom:= LblST.Caption;
        saliquota  := '0'+saliquota+'0';       //0840
        totaux  := '0'+saliquota+'0';       //0840
      end
      else if Length(LblST.Caption) = 4 then
      begin
        saliquota:= StringReplace(LblST.Caption, ',', '', [rfReplaceAll]);
        aliquotacupom:= LblST.Caption;
        saliquota  := saliquota+'0';       //1320
        totaux  := saliquota+'0';       //1320
      end;

      if (tipo_trib = 'T') then
        Calcula_Imposto
      else if (tipo_trib = 'S') then
        Calcula_Imposto_Servico;

      UDeclaracao.tot_par:= tipo_trib + totaux;
    end
    else if (tipo_trib = 'I') then
    begin
      Calcula_Imposto;
      saliquota:= 'I1';
      UDeclaracao.tot_par:= 'I1';
      aliquotacupom:= 'II';
    end
    else if (tipo_trib = 'N') then
    begin
      Calcula_Imposto;
      saliquota:= 'N1';
      UDeclaracao.tot_par:= 'N1';
      aliquotacupom:= 'NN';
    end
    else if (tipo_trib = 'F') then
    begin
      Calcula_Imposto;
      saliquota:= 'F1';
      UDeclaracao.tot_par:= 'F1';
      aliquotacupom:= 'FF';
    end;

{      if (tipo_trib = 'T') or (tipo_trib = 'S') then
      begin
        if Length(LblST.Caption) = 1 then
        begin
          sAliquota  := '0' + LblST.Caption + '00'; //0700
          totaux  := '0' + LblST.Caption + '00'; //0700
        end
        else if Length(LblST.Caption) = 2 then
        begin
          sAliquota  := LblST.Caption + '00';       //1200
          totaux  := LblST.Caption + '00';      //1200
        end
        else if Length(LblST.Caption) = 3 then
        begin
          saliquota:= StringReplace(LblST.Caption, ',', '', [rfReplaceAll]);
          saliquota  := '0'+saliquota+'0';       //0840
          totaux  := '0'+saliquota+'0';       //0840
        end
        else if Length(LblST.Caption) = 4 then
        begin
          saliquota:= StringReplace(LblST.Caption, ',', '', [rfReplaceAll]);
          saliquota  := saliquota+'0';       //1320
          totaux  := saliquota+'0';       //1320
        end;

        Calcula_Imposto;
        UDeclaracao.tot_par:= tipo_trib + totaux;
      end
      else if (tipo_trib = 'I') then
      begin
        Calcula_Imposto;
        saliquota:= 'I1';
        UDeclaracao.tot_par:= 'I1';
      end
      else if (tipo_trib = 'N') then
      begin
        Calcula_Imposto;
        saliquota:= 'N1';
        UDeclaracao.tot_par:= 'N1';
      end
      else if (tipo_trib = 'F') then
      begin
        Calcula_Imposto;
        saliquota:= 'F1';
        UDeclaracao.tot_par:= 'F1';
      end;}

      sTipoQtde  := 'I';
      sQtde      := FormatFloat('#0.0,00', StrToFloat(EdtQuantidade.Text));
      sValor     := FormatFloat('#0.0,00',(StrToFloat(EdtValor_Unitario.Text)));
      if (stipo = '') then
        sTipo:= '$'
      else
        sTipo:= tipo_desc;

      sdesconto:= '0,00';
      sacrecimo:= '0,00';
      sdesc_acr:= '0,00';
      dOUa:= 'D';

      if (total_valor_uni = 0) or (total_valor_uni < 0) then
        sacrecimo:= '0,00';

      if (total_valor_uni > 0) then
      begin
        sacrecimo:= FormatFloat('#0.0,0', total_valor_uni);
        sdesc_acr:= FloatToStr(Abs( StrToFloat(sacrecimo) ));
        dOUa:= 'A';
      end
      else if (total_valor_uni < 0) then
      begin
        sDesconto  := FormatFloat('#0.0,0', total_valor_uni);
        sdesc_acr  := FloatToStr(Abs(StrToFloat(sDesconto)));
        dOUa:= 'D';
      end;

      //iRetorno:= Bematech_FI_VendeItemDepartamento(scodigo, sdescricao, saliquota, svalor, sqtde, sacrecimo, sdesconto, '00', unid_med);
      //Analisa_iRetorno;
      ECF.Vende_Item(scodigo, sdescricao, aliquotacupom, svalor, sqtde, sdesc_acr, sTipo, unid_med, dOUa);

      if (iRetorno = 1) then
      begin
        //Captura_Ultimo_Item;
        ECF.Pega_Ultimo_Item;
        if (FileExists(Local_Arquivo(2))) then
          DeleteFile(Local_Arquivo(2));
        //Itens_Pedido.Inserir_PDV(Itens_Pedido);

        Coleta_Dados_R05;
        if FileExists(Local_Arquivo(8)) then
          DeleteFile(Local_Arquivo(8));
        R05.Inserir_PDV(R05);

        //Sleep(500);
        Limpa_Menor;
        EdtValor_Unitario.SetFocus;
        ultimo_item:= 0;

        Limpa_Labels;

        pode_encerrar:= true;
        EdtCodigo_Produto.SetFocus;
      end;
    end
    else
    begin
      UDeclaracao.Mensagem_Venda_Produto_Peso;
      EdtQuantidade.SetFocus;
    end;
  end
end;

procedure TFrmPDV.EdtValor_TotalKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmPDV.EdtValor_UnitarioExit(Sender: TObject);
begin
  Verifica_Edit_Branco(EdtValor_Unitario);
  Verifica_Valor_Negativo(StrToFloat(EdtValor_Unitario.Text), EdtValor_Unitario);

  {if ( StrToFloat(EdtValor_Unitario.Text) <> 0) then
  begin
    novo_valor_uni:= StrToFloat(EdtValor_Unitario.Text);
    total_valor_uni:= novo_valor_uni - var_uni;
    total_valor_uni:= Abs(total_valor_uni);

    if (novo_valor_uni > var_uni) then
      dOUa:= 'A'
    else
      dOUa:= 'D';

    EdtValor_Unitario.Text:= FormatFloat('#0.0,0', var_uni);
    EdtValor_Unitario.Text:= StringReplace(EdtValor_Unitario.Text, ThousandSeparator, '', [rfReplaceAll]);
  end;}

  //EdtQuantidade.SetFocus;
end;

procedure TFrmPDV.EdtValor_UnitarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    EdtQuantidade.SetFocus;
  end;
end;

procedure TFrmPDV.EdtValor_UnitarioKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmPDV.FormActivate(Sender: TObject);
begin
  ativo:= true;
  Foco_Aplicacao;
end;

procedure TFrmPDV.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   If pode_fechar = false then begin
     Application.MessageBox('Impossível Fechar - Existe um Cupom Aberto!','Aviso do Sistema',Mb_IconInformation);
     abort;
   end
   else
    begin
      FrmPDV.Free;
      FrmPDV:= NIl;
   end;

end;

procedure TFrmPDV.FormCreate(Sender: TObject);
begin
  Limpa_Campos;
  item:= 0;
  existe:= 0;
  valor_desc:= 0;
  tipo_desc:= '';
  item_cancelar:= '';
  LblStatus.Caption:= Caixa_Operacao(0);
  pode_chamar:= false;
  pode_encerrar:= false;
  pode_fechar:= true;
  tipo_venda:= 'PDV';
  //LblUsuario.Caption:= usuario;
  Inicia_Dados_Cliente;
  Limpa_Labels;
  quero_cancelar:= false;
  LblCodigo.Caption:= '0';

  cnpj_destinatario := '';
  razao_social_destinatario := '';
  endereco_destinatario := '';
  numero_destinatario := '';
  complemento_destinatario := '';
  setor_destinatario := '';
  codigo_municipio_destinatario := '';
  municipio_destinatario := '';
  uf_destinatario := '';
  telefone_destinatario := '';
  ie_destinatario := '';
  im_destinatario := '';
  cep_destinatario := '';
  email_destinatario := '';
  suframa_destinatario := '';
  enquadramento := '';

  //// Configurações do ACBr
  Pega_Certificado_Digital(dm.ACBrNFe1);
  dm.ACBrNFe1.DANFE:= dm.ACBrNFeDANFCeFortes1;

  if (impressao_danfe = 'RETRATO') then
    dm.ACBrNFeDANFeRL1.TipoDANFE := tiRetrato
  else
    dm.ACBrNFeDANFeRL1.TipoDANFE := tiPaisagem;

  dm.ACBrNFeDANFCeFortes1.TipoDANFE := tiNFCe;

  if (logomarca <> '') then
  begin
    dm.ACBrNFeDANFeRL1.Logo := logomarca;
    dm.ACBrNFeDANFCeFortes1.Logo:= logomarca;
  end;

  // if (email <> '') then
  dm.ACBrNFeDANFeRL1.email := email;
  dm.ACBrNFeDANFeRL1.PathPDF:= salva_xml;
  dm.ACBrNFeDANFCeFortes1.PathPDF:= salva_xml;
  dm.ACBrNFe1.Configuracoes.Geral.VersaoDF := ve310;
  dm.ACBrNFe1.Configuracoes.Geral.ModeloDF:= moNFe;
  dm.ACBrNFe1.Configuracoes.WebServices.uf := uf;
  dm.ACBrNFe1.Configuracoes.Arquivos.PathSalvar := salva_xml;
  dm.ACBrNFe1.Configuracoes.Arquivos.PathNFe := salva_xml + 'Transmitidos';
  dm.ACBrNFe1.Configuracoes.Arquivos.PathEvento := salva_xml + 'Cancelados';
  dm.ACBrNFe1.Configuracoes.Arquivos.PathSchemas := caminho_schema;

  if (ambiente = 'PRODUÇÃO') then
    dm.ACBrNFe1.Configuracoes.WebServices.ambiente := taProducao
  else if (ambiente = 'HOMOLOGAÇÃO') then
    dm.ACBrNFe1.Configuracoes.WebServices.ambiente := taHomologacao;

  dm.ACBrNFe1.Configuracoes.Geral.IdCSC:= idcsc;
  dm.ACBrNFe1.Configuracoes.Geral.CSC:= numerocsc;
  //Verifica_Erros_Ao_Gerar_Cupom;

  {if (Balanca_Modelo <> 0) then
  begin
    Conecta_Balanca(dm.ACBrBAL1);
  end;}

  //Atualiza_Dados;
end;

procedure TFrmPDV.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmPDV.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Mensagem, Aux1, Aux2, Aux3, Aux4, Aux5 : String;
  sAux: TADOStoredProc;
  cancela: integer;
  total, peso_balanca, preco_balanca, valor_total_balanca: double;
  iConta: integer;

begin
  if (key = vk_escape) then
    close;

  if (key = vk_f3) then
  begin
    if (Iniciado) then
    begin
      Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
      FrmChama_Produto.ShowModal;
      FrmChama_Produto.Free;
    end
    else
    begin
      TMensagens.MensagemWarning('Inicie uma nova venda, antes de inserir um item.');
      abort;
    end;
  end;

  if (key = vk_f11) then
  begin
    //if (Iniciado = false) and (oLF <> nil) and (oPLF <> nil) and (oCP <> nil) and (oCli <> nil) then
    //begin
      //FrmGerar_Documentos:= TFrmGerar_Documentos.Create(nil, oLF, oPLF, oCP, oCli);
      //FrmGerar_Documentos.ShowModal;
      //FrmGerar_Documentos.Free;
      //FrmGerar_Documentos:= Nil;

      {Application.CreateForm(TFrmGerar_Documentos, FrmGerar_Documentos);
      FrmGerar_Documentos.ShowModal;
      FrmGerar_Documentos.Free;}
    //end;
  end;

  if (key = vk_f9) then
  begin
    if (Iniciado = false) then
    begin
      Application.CreateForm(TFrmInformar_Cliente_PDV, FrmInformar_Cliente_PDV);
      FrmInformar_Cliente_PDV.ShowModal;
      FrmInformar_Cliente_PDV.Free;
    end;
  end;

  if (key = vk_f10) then
  begin
    if (pode_encerrar = true) then
    begin
      TLog.Debug('Pressionou F10 para finalizar o cupom fiscal.');
      TLog.Debug('Vai executar o método PreencheObjetoDadosNFEItens pelo F10.');
      PreencheObjetoDadosNFEItens;
      TLog.Debug('Executou o método PreencheObjetoDadosNFEItens  pelo F10.');
      Application.CreateForm(TFrmFechamento_Venda_PDV, FrmFechamento_Venda_PDV);
      Centraliza_Form(FrmFechamento_Venda_PDV);
      FrmFechamento_Venda_PDV.Show;
    end;
  end;

  if (key = vk_f2) then
  begin
    if (Iniciado) then
    begin
      Application.MessageBox('Já existe um cupom aberto','Atenção',Mb_IconInformation);
      abort;
    end
    else
    begin
      //DBGrid1.DataSource:= dm.ds_itens_venda;
      AbreCupom;

    end;

  end;

  if (key = vk_f8) then
  begin
    {if (Iniciado) and (LblSub_Total.Caption <> '0,00') then
    begin
      Application.CreateForm(TFrmSenha_ADM, FrmSenha_ADM);
      FrmSenha_ADM.ShowModal;
      FrmSenha_ADM.Free;

      if (libera_cancelar_item) then
      begin
        Application.CreateForm(TFrmInforma_Item_Cancelamento, FrmInforma_Item_Cancelamento);
        FrmInforma_Item_Cancelamento.ShowModal;
        FrmInforma_Item_Cancelamento.Free;

        libera_cancelar_item:= false;
      end;
    end
    else
    begin
      TMensagens.MensagemWarning('Para cancelar um item, é necessário ter pelo menos um item lançado e não cancelado.');
      abort;
    end;}
  end;

  if (key = vk_f12) then
  begin
    if (jaCancelado = False) then
    begin
      if (Confirma_Cancalamento_Cupom) then
      begin
        jaCancelado:= true;
        //ECF.Cancela_Cupom;
        //ECF.Pega_Grande_Total;

        //AlteraGT(StrToFloat(UDeclaracao.GrandeTotal), nu_serie);

        {if (sem_rede = false) then
        begin
          Atualiza_Status_Pedido(StrToInt(LblCodigo.Caption), 'CANCELADO');
          Atualiza_R04(StrToInt(LblCodigo.Caption));
          Atualiza_R04_Aux(StrToInt(LblCodigo.Caption));
          Deleta_Lancamento_Financeiro();
          quero_cancelar := true;
          //removerFichaEstoque;
        end
        else
        begin
          Atualiza_Status_Pedido_Sem_Rede(StrToInt(LblCodigo.Caption), 'CANCELADO');
          Atualiza_R04_Sem_Rede(StrToInt(LblCodigo.Caption));
          quero_cancelar:= true;
        end;}
        //Atualiza_Status_Pedido(Conexao, StrToInt(LblCodigo.Caption), 'CANCELADO');
        //Atualiza_Estoque_Acima(Conexao);
        TConexao.CancelaConexao(Conexao);
        FrmPDV.Limpa_Para_Novo_Registro;
        Atualiza_Codigo_Tabela_Padrao(codigo_tabela_preco_padrao);
        //ApagaArquivosTEF;
      end;

    end;
  end;

  if (key = vk_f4) then
  begin
    if (DirectoryExists('C:\tef_dial') or (DirectoryExists('C:\TEF_DISC'))) then
    begin
      if (Iniciado = false) then
      begin
        ApagaArquivosTEF;
        Impresso:= false;

        Application.CreateForm(TFrmEscolha_Bandeira, FrmEscolha_Bandeira);
        FrmEscolha_Bandeira.ShowModal;
        FrmEscolha_Bandeira.Free;

        if (aborta_escolha_bandeira = true) then
        begin
          aborta_escolha_bandeira:= false;
          abort;
        end;

        FrmMenu_Geral.Timer2.Enabled:= false;
        //Verifica_Gerenciador_Padrao_Ativo;
        //else
        //begin
          TLog.Debug('Vai executar o método FuncaoAdministrativaTEF.');
          FuncaoAdministrativaTEF;
          TLog.Debug('Executou o método FuncaoAdministrativaTEF.');
          Sleep(1000);
          AnalizaArquivoRetorno(Aprovado,Mensagem);
          if not Aprovado then
          begin
            //Foco_Aplicacao;
            //chama janela de mensagem modal
            //Deleta_Bandeira_Pendente;
            ApagaArquivosTEF;
            Application.CreateForm(TFrmMensagem_Erro_TEF, FrmMensagem_Erro_TEF);
            FrmMensagem_Erro_TEF.LblMensagem.Caption:= Mensagem;
            FrmMensagem_Erro_TEF.ShowModal;
            FrmMensagem_Erro_TEF.Free;
          end
          else if (Aprovado) and (Imprime_Transacao = false) then
          begin
            //Deleta_Bandeira_Pendente;
            Application.CreateForm(TFrmMensagem_Erro_TEF, FrmMensagem_Erro_TEF);
            FrmMensagem_Erro_TEF.LblMensagem.Caption:= Mensagem;
            FrmMensagem_Erro_TEF.ShowModal;
            FrmMensagem_Erro_TEF.Free;
          end
          else
          begin
            ExibeMensagem(5, Mensagem);
            while not Impresso do
            begin
              //Foco_Aplicacao;
              Application.CreateForm(TFrmMensagem_TEF, FrmMensagem_TEF);
              FrmMensagem_TEF.Show;
              if not ImprimeTransacaoTEF(1,2,'0','0', '01') then
              begin
                BlockInput(false);

                //chama o form da mensagem
                Application.CreateForm(TFrmMensagem_Erro_Impressora_TEF, FrmMensagem_Erro_Impressora_TEF);
                FrmMensagem_Erro_Impressora_TEF.ShowModal;
                if (FrmMensagem_Erro_Impressora_TEF.confirma = false) then
                begin
                  NaoConfirmaTransacao;
                  ApagaArquivosTEF;
                  DeleteFile(ArqTemp);
                  //Deleta_Bandeira_Pendente;
                  Impresso:= true;
                  LblStatus.Caption:= Caixa_Operacao(0);
                  Limpa_Campos;
                  //Deleta_Bandeira_Pendente;
                  //iRetorno := Bematech_FI_FechaRelatorioGerencial();
                  ECF.Fecha_Relatorio;
                end
                else
                begin
                  Impresso:= false;
                end;

                {if Impressora_Nao_Responde_TEF = true then
                begin
                  Impresso:= false;
                end
                else
                begin
                  //FrmMensagem_TEF.Close;
                  NaoConfirmaTransacao;
                  ApagaArquivosTEF;
                  DeleteFile(ArqTemp);
                  Impresso:= true;
                  iRetorno := Bematech_FI_FechaRelatorioGerencial();
                  Analisa_iRetorno;
                end;}
              end
              else
              begin
                ConfirmaTransacao;
                ApagaArquivosTEF;
                DeleteFile(ArqTemp);
                den_op:= 'RG';
                //Coleta_Dados_R06;
                //R06.Inserir_Outros(R06);
                //R06.Inserir_Outros_Aux(R06);
                Impresso:= true;
                FrmMensagem_TEF.Close;
                //Deleta_Bandeira_Pendente;
                BlockInput(false);
              end;
            end;
          end;
        //end;
        LblStatus.Caption:= Caixa_Operacao(0);
        Limpa_Campos;
      end;
      FrmMenu_Geral.Timer2.Enabled:= true;
    end;
  end;

  if (key = vk_f5) then
  begin
    if (Panel1.Enabled = true) then
    begin
      if not (dm.ACBrBAL1.Ativo) then
      begin
        if not (Conecta_Balanca(dm.ACBrBAL1)) then
          abort;
      end;

      peso_balanca:= dm.ACBrBAL1.LePeso(Balanca_TimeOut);
      preco_balanca:= StrToFloat(EdtValor_Unitario.Text);

      //EdtValor_Unitario.Text:= FormatFloat('#0.0,0', StrToFloat(preco)/100);
      //EdtValor_Unitario.Text:= StringReplace(EdtValor_Unitario.Text, ThousandSeparator, '', [rfReplaceAll]);

      EdtQuantidade.Text:= FormatFloat('#0.0,00', peso_balanca);
      EdtQuantidade.Text:= StringReplace(EdtQuantidade.Text, ThousandSeparator, '', [rfReplaceAll]);

      valor_total_balanca:= Calcula_Valor(FloatToStr(peso_balanca * preco_balanca));

      EdtValor_Total.Text:= FormatFloat('#0.0,0', valor_total_balanca);
      EdtValor_Total.Text:= StringReplace(EdtValor_Total.Text, ThousandSeparator, '', [rfReplaceAll]);
    end;
  end;

  if (key = vk_f7) then
    begin
      //if (pode_fechar = false) then
      //begin
        Application.CreateForm(TFrmEscolha_Tabela_Preco, FrmEscolha_Tabela_Preco);
        FrmEscolha_Tabela_Preco.ShowModal;
        FrmEscolha_Tabela_Preco.Free;
      //end;
    end;

  if (key = vk_f6) then
    begin
      if (Iniciado) and (EdtCodigo_Produto.Text <> '') then
      begin
        Application.CreateForm(TFrmDesconto_PDV, FrmDesconto_PDV);
        FrmDesconto_PDV.ShowModal;
        FrmDesconto_PDV.Free;
      end
      else
      begin
        TMensagens.MensagemWarning('Para acessar a tela de desconto/acrescimo, deve-se iniciar uma nova venda e escolher um produto.');
        abort;
      end;
    end;

end;

procedure TFrmPDV.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      //SelectNext(ActiveControl, true, true);
    end;

  try
    //Pega_Atalho_Tabela(key);
  except

  end;

end;

procedure TFrmPDV.FormResize(Sender: TObject);
begin
  UDeclaracao.Centraliza_Form_Full_Screen(FrmPDV);
  //Label9.Top:= Panel2.Top - 20;
  Label1.Top:= Shape7.Top + 3;
  Label3.Top:= Label1.Top + 15;

  Shape8.Top:= Shape7.Top - 40;
  Shape8.Width:= Screen.Width - 15;
  Panel2.Width:= Screen.Width - 20;

  Panel3.Top:= Panel4.Height;
  Panel3.Height:= FrmPDV.Height - Panel4.Height - Shape8.Height - Shape7.Height - 40;
  Shape9.Top:= Panel3.Height - Shape9.Height - 10;

  Panel2.Top:= Shape8.Top + 2;
  //Label17.Top:= Shape8.Top;
  Label10.Top:= Shape9.Top - 21;


  DBGrid1.Top:= Shape1.Height + 10;
  DBGrid1.Height:= Shape8.Top - DBGrid1.Top - 20;
  //Shape6.Top:= DBGrid1.Height;
  //Panel3.Top:= Shape1.Height + 10;
  //Panel3.Height:= Shape8.Top - DBGrid1.Top - 20;

  //LblUsuario.Left:= Shape2.Width - 200;
  //LblData.Left:= Shape2.Width - 200;
  Label14.Left:= Shape2.Width - 200 - 70;
  Label13.Left:= Shape2.Width - 200 - 40;

  //Shape9.Top:= Panel3.Height - Shape9.Height;
  LblSub_Total.Top:= Shape9.Top;

  //Image1.Left:= Screen.Width - Image1.Width;
end;

procedure TFrmPDV.FormShow(Sender: TObject);
begin
  EdtCodigo_Produto.SetFocus;
end;

procedure TFrmPDV.Gera_Codigo;
begin
  Gera_Codigo_Lancamento(dm.ADOConnection1);
  LblCodigo.Caption:= IntToStr(UDeclaracao.codigo);
end;

procedure TFrmPDV.Gera_Codigo_Sem_Rede;
var
  cod: integer;
begin
  //dm.qrycontrola_codigo.LoadFromFile(Local_Arquivo(18));
  //dm.qrycontrola_codigo.Last;
  //cod:= StrToInt(LblCodigo_Sem_Rede.Caption) + 1;//dm.qrycontrola_codigoCodigo.AsString;
  //LblCodigo_Sem_Rede.Caption:= IntToStr(cod);
end;

procedure TFrmPDV.IdIPWatch1StatusChanged(Sender: TObject);
begin
  {if IdIPWatch1.ForceCheck = true  then
    ShowMessage('Rede Conectada! ')
  else
    ShowMessage('Rede Caiu.');}
end;

procedure TFrmPDV.Inicia_Dados_Cliente;
begin
  CPF:= '';
  Nome:= '';
  Endereco:= '';
  cli_tipo_end:= '';
  cli_end:= '';
  cli_num:= '';
  cli_set:= '';
  cli_cid:= '';
  cli_uf:= '';
  cli_tel:= '';
  cli_cep:= '';
  cli_cod_mun:= '';
  cli_comp:= '';

  Codigo_Cliente:= 0;
end;

procedure TFrmPDV.Insere_Dados;
var
  scodigo,sdescricao,stipoqtde,sqtde,svalor,stipo,sdesc_acr,sdesconto,sacrecimo,totaux,aliquotacupom: AnsiString;
  v_un, qtde, total, valor_total, resul, bc, bc2, ali, real: double;
  AliquotaImposto: integer;
begin
    scodigo:= EdtCodigo_Produto.Text;
    sDescricao := Copy(descricao,1,29);
    UDeclaracao.tot_par:= '';

    if (tipo_trib = 'T') or (tipo_trib = 'S') then
    begin
      if Length(LblST.Caption) = 1 then
      begin
        sAliquota  := '0' + LblST.Caption + '00'; //0700
        totaux  := '0' + LblST.Caption + '00'; //0700
        aliquotacupom:= LblST.Caption;
      end
      else if Length(LblST.Caption) = 2 then
      begin
        sAliquota  := LblST.Caption + '00';       //1200
        totaux  := LblST.Caption + '00';      //1200
        aliquotacupom:= LblST.Caption;
      end
      else if Length(LblST.Caption) = 3 then
      begin
        saliquota:= StringReplace(LblST.Caption, ',', '', [rfReplaceAll]);
        aliquotacupom:= LblST.Caption;
        saliquota  := '0'+saliquota+'0';       //0840
        totaux  := '0'+saliquota+'0';       //0840
      end
      else if Length(LblST.Caption) = 4 then
      begin
        saliquota:= StringReplace(LblST.Caption, ',', '', [rfReplaceAll]);
        aliquotacupom:= LblST.Caption;
        saliquota  := saliquota+'0';       //1320
        totaux  := saliquota+'0';       //1320
      end;
      AliquotaImposto:= StrToInt(saliquota);
      UDeclaracao.tot_par:= tipo_trib + totaux;
    end
    else if (tipo_trib = 'I') then
    begin
      //Calcula_Imposto;
      saliquota:= '0';
      UDeclaracao.tot_par:= 'I1';
      aliquotacupom:= 'II';
      AliquotaImposto:= 0;
    end
    else if (tipo_trib = 'N') then
    begin
      //Calcula_Imposto;
      saliquota:= '0';
      UDeclaracao.tot_par:= 'N1';
      aliquotacupom:= 'NN';
      AliquotaImposto:= 0;
    end
    else if (tipo_trib = 'F') then
    begin
      //Calcula_Imposto;
      saliquota:= '0';
      UDeclaracao.tot_par:= 'F1';
      aliquotacupom:= 'FF';
      AliquotaImposto:= 0;
    end;

    sTipoQtde  := 'I';
    sQtde      := FormatFloat('#0.0,00', StrToFloat(EdtQuantidade.Text));
    sValor     := FormatFloat('#0.0,00',(StrToFloat(EdtValor_Unitario.Text)));
    sValor     := StringReplace(sValor, ThousandSeparator, '', [rfReplaceAll]);
    if (stipo = '') then
      sTipo:= '$'
    else
      sTipo:= tipo_desc;

    sDesconto  := FormatFloat('#0.0,0', total_valor_uni * StrToFloat(sQtde));
    sDesconto  := StringReplace(sDesconto, ThousandSeparator, '', [rfReplaceAll]);
    sdesc_acr  := FloatToStr(Abs(StrToFloat(sDesconto)));

    //if (ECF.Vende_Item(scodigo, sdescricao, aliquotacupom, sqtde, svalor, sdesc_acr, sTipo, unid_med, dOUa)) then
    //begin
      valor_total:= StrToFloat(LblSub_Total.Caption);
      //v_un:= novo_valor_uni;
      v_un:= StrToFloat(EdtValor_Unitario.Text);
      qtde:= StrToFloat(EdtQuantidade.Text);

      {if (dOUa = 'A') then
        real:= ((var_uni * qtde) + (total_valor_uni * qtde))
      else
        real:= ((var_uni * qtde) - (total_valor_uni * qtde)); }

      //total:= Calcula_Valor(FloatToStr(real));
      total:= v_un * qtde;
      //total:= Trunc(real * 100) / 100;

      //LblTotal.Caption:= FloatToStr(total);
      EdtValor_Total.Text:= FormatFloat('#0.0,0', total);
      EdtValor_Total.Text:= StringReplace(EdtValor_Total.Text, ThousandSeparator, '', [rfReplaceAll]);
      resul:= valor_total + total;
      LblSub_Total.Caption:= FormatFloat('#0.0,0', resul);
      LblSub_Total.Caption:= StringReplace(LblSub_Total.Caption, ThousandSeparator, '', [rfReplaceAll]);
      EdtValor_Total.Refresh;
      LblSub_Total.Refresh;

      if (tipo_prod = '0') then
        Atualiza_Impostos(total)
      else if (tipo_prod = '1') then
        Calcula_Imposto_Servico;

      //ECF.Pega_Ultimo_Item;
      n_item:= IntToStr( StrToInt(n_item) + 1);
      TLog.Info('--- CÁLCULAR IMPOSTOS PDV ---');
      TLog.Debug('Iniciou objeto FTributacaoEntidade.');
      FTributacaoEntidade:= TTributacaoEntidade.Create;
      TLog.Debug('Iniciou objeto FTributacaoDominio.');
      FTributacaoDominio:= TTributacaoDominio.Create(dm.ADOConnection1);
      TLog.Debug('Vai calcular o ICMS.');
      FTributacaoEntidade:= FTributacaoDominio.CalculaICMS(StrToFloat(EdtValor_Total.Text), StrToFloat(br_icms), AliquotaImposto, uf, uf);
      TLog.Info('--- FIM CÁLCULAR IMPOSTOS PDV ---');

      TLog.Debug('Vai salvar o produto '+LblProduto.Caption+' no BD.');
      Itens_Pedido.Salva_Banco(Conexao, 'S', 'I', StrToInt(LblCodigo.Caption), n_item, cod_produto,
      EdtCodigo_Produto.Text, LblProduto.Caption, LblNCM.Caption, origem,
      LblCFOP.Caption, unid_med, tipo_calculo_bc_icms, tipo_recolhimento_icms, saliquota, cst_icms, csosn, //icms, cst_icms, csosn,
      br_icms, FloatToStr(FTributacaoEntidade.BaseCalculo), FloatToStr(FTributacaoEntidade.ValorICMS), tipo_calculo_bc_icms_st, '0', '0', '0', '0',
      '0', '0', 0, aliquota_sn, uDeclaracao.credito_icms, tipo_calculo_bc_pis, ipi, cst_ipi, br_ipi, ba_ipi, bc_ipi, StrToFLoat(valor_ipi),
      tipo_calculo_bc_pis, pis, cst_pis, br_pis, ba_pis, bc_pis, StrToFloat(valor_pis),
      tipo_calculo_bc_cofins, cofins, cst_cofins, br_cofins, ba_cofins, bc_cofins, StrToFloat(valor_cofins),
      StrToFloat(EdtQuantidade.Text), 0, 0, 0, FrmPDV.valor_compra,
      FrmPDV.var_uni, StrToFloat(FrmPDV.EdtValor_Unitario.Text), 0, 0, '$', dOUa, 0, 0, 0, StrToFloat(FrmPDV.EdtValor_Total.Text),
      StrToFloat(sub_total_liquido), 'N', 'S', date, '', '', 'A', comissao_ven, 0, 0, permite_credito, codigo_obs_fiscal, qtde_estoque, FrmPDV.valor_compra_nota);
      TLog.Debug('Salvou o produto '+LblProduto.Caption+' no BD.');

      {DadosEmissaoNFEItens:= TDadosEmissaoNFEItens.Create;
      DadosEmissaoNFEItens.NCM:= LblNCM.Caption;
      DadosEmissaoNFEItens.DescricaoProduto:= LblProduto.Caption;
      DadosEmissaoNFEItens.CodigoVenda:= EdtCodigo_Produto.Text;
      DadosEmissaoNFEItens.CSOSN:= csosn;
      DadosEmissaoNFEItens.CST:= cst_icms;
      DadosEmissaoNFEItens.ValorUnitario:= StrToFloat(FrmPDV.EdtValor_Unitario.Text);
      DadosEmissaoNFEItens.CFOP:= LblCFOP.Caption;
      DadosEmissaoNFEItens.Unidade:= unid_med;
      DadosEmissaoNFEItens.Quantidade:= StrToFloat(EdtQuantidade.Text);
      DadosEmissaoNFEItens.ValorOriginal:= FrmPDV.var_uni;
      DadosEmissaoNFEItens.ValorFrete:= 0;
      DadosEmissaoNFEItens.ValorSeguro:= 0;
      DadosEmissaoNFEItens.DouA:= dOUa;
      DadosEmissaoNFEItens.DescAcr:= 0;
      DadosEmissaoNFEItens.OutrasDespesas:= 0;

      if (aliquota_sn = '') then
        DadosEmissaoNFEItens.AliquotaCalculoCredito:= 0
      else
        DadosEmissaoNFEItens.AliquotaCalculoCredito:= StrToFloat(aliquota_sn);

      DadosEmissaoNFEItens.CreditoICMS:= uDeclaracao.credito_icms;
      DadosEmissaoNFEItens.TipoCalculoBCICMS:= tipo_calculo_bc_icms;
      DadosEmissaoNFEItens.TipoCalculoBCICMSST:= tipo_calculo_bc_icms_st;
      DadosEmissaoNFEItens.MVAST:= '0';
      DadosEmissaoNFEItens.BCST:= '0';
      DadosEmissaoNFEItens.ICMSST:= '0';
      DadosEmissaoNFEItens.ValorICMSST:= '0';
      DadosEmissaoNFEItens.BC:= FloatToStr(FTributacaoEntidade.BaseCalculo);
      DadosEmissaoNFEItens.BCReduzida:= br_icms;
      DadosEmissaoNFEItens.BCICMS:= FloatToStr(FTributacaoEntidade.BaseCalculo);
      DadosEmissaoNFEItens.ICMS:= saliquota;
      DadosEmissaoNFEItens.ValorICMS:= FloatToStr(FTributacaoEntidade.ValorICMS);
      DadosEmissaoNFEItens.BCIPI:= bc_ipi;
      DadosEmissaoNFEItens.IPI:= ipi;
      DadosEmissaoNFEItens.ValorIPI:= valor_ipi;
      DadosEmissaoNFEItens.CSTIPI:= cst_ipi;
      DadosEmissaoNFEItens.CSTPIS:= cst_pis;
      DadosEmissaoNFEItens.BCPIS:= bc_pis;
      DadosEmissaoNFEItens.PIS:= pis;
      DadosEmissaoNFEItens.ValorPIS:= valor_pis;
      DadosEmissaoNFEItens.CSTCOFINS:= cst_cofins;
      DadosEmissaoNFEItens.BCCOFINS:= bc_cofins;
      DadosEmissaoNFEItens.COFINS:= cofins;
      DadosEmissaoNFEItens.ValorCOFINS:= valor_cofins;
      DadosEmissaoNFEItens.Origem:= 0;
      DadosEmissaoNFE.Itens.Add(DadosEmissaoNFEItens);}
      //Itens_Pedido.Inserir_PDV(Itens_Pedido);

      //Coleta_Dados_R05;
      //R05.Inserir_PDV(R05);

      //Sleep(500);
      Limpa_Menor;
      ultimo_item:= 0;

      Atualiza_Dados;

      //ECF.Pega_Grande_Total;
      //AlteraGT(StrToFloat(UDeclaracao.GrandeTotal), nu_serie);

      Limpa_Labels;
      LblStatus.Caption:= Caixa_Operacao(1);

      pode_encerrar:= true;
      pesquisa:= false;

      EdtCodigo_Produto.SetFocus;
    {end
    else
    begin
      Limpa_Menor;
      ultimo_item:= 0;
      Limpa_Labels;
      EdtCodigo_Produto.SetFocus;
    end; }
end;

procedure TFrmPDV.Atualiza_Dados;
begin
  with dm.qryitens_venda, sql do
  begin
    close;
    Connection:= Conexao;//dm.ADOConnectionLocal;
    clear;
    add('select * from Itens_Pedido where Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= StrToInt(LblCodigo.Caption);
    open;
    //Last;
  end;
end;

procedure TFrmPDV.Verifica_Dados;
begin
  if (sem_rede = true) then
  begin
    Mensagem_Erro_Rede;
    Gera_Codigo_Sem_Rede;
    dm.qrycontrola_codigo.Insert;
    //dm.qrycontrola_codigo['Codigo']:= StrToInt(LblCodigo_Sem_Rede.Caption);
    //dm.qrycontrola_codigo.SaveToFile(Local_Arquivo(18));
  end
  else
  begin
    if (dm.qrycontrola_codigo.RecordCount <> 0) then
      Controla_Codigo.Inserir(Controla_Codigo);
    Gera_Codigo;
  end;
end;

procedure TFrmPDV.Limpa_Campos;
begin
  LblProduto.Caption:= '';
  LblST.Caption:= '0,00';
  LblSub_Total.Caption:= '0,00';
  unid_med:= '';
  EdtQuantidade.Text:= '1';
  //EdtAcre_Desc.Text:= '0,00';
  EdtValor_Unitario.Text:= '0,00';
  EdtValor_Total.Text:= '0,00';
  EdtCodigo_Produto.Text:= '';
  novo_valor_uni:= 0;
  total_valor_uni:= 0;
  var_uni:= 0;
end;

procedure TFrmPDV.Limpa_Labels;
begin
  LblCFOP.Caption:= '';
  LblNCM.Caption:= '';
end;

procedure TFrmPDV.Limpa_Menor;
begin
  LblProduto.Caption:= '';
  LblST.Caption:= '';
  unid_med:= '';
  EdtQuantidade.Text:= '1';
  //EdtAcre_Desc.Text:= '0,00';
  EdtValor_Unitario.Text:= '0,00';
  EdtValor_Total.Text:= '0,00';
  EdtCodigo_Produto.Text:= '';
  novo_valor_uni:= 0;
  total_valor_uni:= 0;
  dOUa:= 'D';
  var_uni:= 0;

  Limpa_Tributos;
end;

procedure TFrmPDV.Grava_Pedido_Endereco_Cliente;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('INSERT INTO Pedido_Endereco_Cliente');
        add('           (Codigo');
        add('           ,N_Pedido');
        add('           ,Nome');
        add('           ,CPF_CNPJ');
        add('           ,Tipo_Endereco');
        add('           ,Endereco');
        add('           ,Numero');
        add('           ,Setor');
        add('           ,Cidade');
        add('           ,UF');
        add('           ,Telefone');
        add('           ,CEP');
        add('           ,Codigo_Municipio');
        add('           ,Complemento)');
        add('     VALUES');
        add('           (:Codigo');
        add('           ,:N_Pedido');
        add('           ,:Nome');
        add('           ,:CPF_CNPJ');
        add('           ,:Tipo_Endereco');
        add('           ,:Endereco');
        add('           ,:Numero');
        add('           ,:Setor');
        add('           ,:Cidade');
        add('           ,:UF');
        add('           ,:Telefone');
        add('           ,:CEP');
        add('           ,:Codigo_Municipio');
        add('           ,:Complemento)');



        Parameters.ParamByName('Codigo').Value:= StrToInt(LblCodigo.Caption);
        Parameters.ParamByName('N_Pedido').Value:= COO;
        Parameters.ParamByName('Nome').Value:= Nome;
        Parameters.ParamByName('CPF_CNPJ').Value:= CPF;
        Parameters.ParamByName('Tipo_Endereco').Value:= cli_tipo_end;
        Parameters.ParamByName('Endereco').Value:= cli_end;
        Parameters.ParamByName('Numero').Value:= cli_num;
        Parameters.ParamByName('Setor').Value:= cli_set;
        Parameters.ParamByName('Cidade').Value:= cli_cid;
        Parameters.ParamByName('UF').Value:= cli_uf;
        Parameters.ParamByName('Telefone').Value:= cli_tel;
        Parameters.ParamByName('CEP').Value:= cli_cep;
        Parameters.ParamByName('Codigo_Municipio').Value:= cli_cod_mun;
        Parameters.ParamByName('Complemento').Value:= cli_comp;
        ExecSQL;
      end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

procedure TFrmPDV.Limpa_Para_Novo_Registro;
begin
  Inicia_Itens;

  dm.qryitens_venda.Active:= false;
  pode_encerrar:= false;
  pode_chamar:= false;
  pode_fechar:= true;
  Iniciado:= false;
end;

procedure TFrmPDV.Timer1Timer(Sender: TObject);
begin
  //LblData.Caption:= DateToStr(date) + ' ' + TimeToStr(Time);
end;

end.
