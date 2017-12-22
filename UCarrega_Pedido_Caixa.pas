unit UCarrega_Pedido_Caixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  DBClient, Provider, RSPrint, ExtCtrls, Modelo.Entidade.TLancamentoFinanceiroEntidade,
  Modelo.Entidade.TParcelasLancamentoFinanceiroEntidade,
  Modelo.Entidade.Cliente.TCliente, Modelo.Entidade.TCondicaoPagamentoEntidade,
  Modelo.Dominio.TCondicaoPagamentoDominio, Util.TLog;

type
  TFrmCarrega_Pedido_Caixa = class(TForm)
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnCarregar_Pedido: TToolButton;
    BBtnBaixar_Pedido: TToolButton;
    BBtnFechar: TToolButton;
    DBGrid1: TDBGrid;
    ds_processa_caixa: TDataSource;
    BBtnLimpar: TToolButton;
    qrycarrega_caixa: TADOQuery;
    qrycarrega_caixaN_Pedido: TStringField;
    qrycarrega_caixaData_Venda: TDateTimeField;
    qrycarrega_caixaTotal_Pedido: TFloatField;
    qrycarrega_caixaNome_Nome_Fantasia: TStringField;
    qrycarrega_caixaCPF: TStringField;
    qrycarrega_caixaEndereco: TStringField;
    qrycarrega_caixaN_Pre_Venda: TStringField;
    qrycarrega_caixaTipo: TStringField;
    qrycarrega_caixaCodigo: TIntegerField;
    BBtnCancela_Pre_Venda: TToolButton;
    LblData_Hora: TLabel;
    qrycarrega_caixaNumero: TStringField;
    qrycarrega_caixaDAVC: TStringField;
    qrycarrega_caixaTotal_Produtos: TFloatField;
    qrycarrega_caixaTotal_Servicos: TFloatField;
    qrycarrega_caixaDesc_Acr: TFloatField;
    qryendereco_cliente: TADOQuery;
    qryendereco_clienteNome: TStringField;
    qryendereco_clienteCPF_CNPJ: TStringField;
    qryendereco_clienteTipo_Endereco: TStringField;
    qryendereco_clienteEndereco: TStringField;
    qryendereco_clienteNumero: TStringField;
    qryendereco_clienteSetor: TStringField;
    qryitens_venda: TADOQuery;
    qryitens_vendaCodigo: TIntegerField;
    qryitens_vendaN_Item: TStringField;
    qryitens_vendaCodigo_Produto: TIntegerField;
    qryitens_vendaCodigo_Venda: TStringField;
    qryitens_vendaDescricao: TStringField;
    qryitens_vendaNCM: TStringField;
    qryitens_vendaOrigem: TStringField;
    qryitens_vendaCFOP: TStringField;
    qryitens_vendaUN: TStringField;
    qryitens_vendaTipo_Calculo_BC_ICMS: TStringField;
    qryitens_vendaTipo_Recolhimento: TStringField;
    qryitens_vendaICMS: TStringField;
    qryitens_vendaCST: TStringField;
    qryitens_vendaCSOSN: TStringField;
    qryitens_vendaBase_Reduzida: TStringField;
    qryitens_vendaBC: TStringField;
    qryitens_vendaValor_ICMS: TStringField;
    qryitens_vendaTipo_Calculo_BC_ICMS_ST: TStringField;
    qryitens_vendaMVAST: TStringField;
    qryitens_vendaICMS_ST: TStringField;
    qryitens_vendaCST_ST: TStringField;
    qryitens_vendaBase_Reduzida_ST: TStringField;
    qryitens_vendaBase_Acrescida_ST: TStringField;
    qryitens_vendaBC_ST: TStringField;
    qryitens_vendaAliquota_Calculo_Credito: TStringField;
    qryitens_vendaCredito_ICMS: TStringField;
    qryitens_vendaTipo_Calculo_IPI: TStringField;
    qryitens_vendaIPI: TStringField;
    qryitens_vendaCST_IPI: TStringField;
    qryitens_vendaBase_Reduzida_IPI: TStringField;
    qryitens_vendaBase_Acrescida_IPI: TStringField;
    qryitens_vendaBC_IPI: TStringField;
    qryitens_vendaValor_IPI: TFloatField;
    qryitens_vendaTipo_Calculo_PIS: TStringField;
    qryitens_vendaPIS: TStringField;
    qryitens_vendaCST_PIS: TStringField;
    qryitens_vendaBase_Reduzida_PIS: TStringField;
    qryitens_vendaBase_Acrescida_PIS: TStringField;
    qryitens_vendaBC_PIS: TStringField;
    qryitens_vendaValor_PIS: TFloatField;
    qryitens_vendaTipo_Calculo_COFINS: TStringField;
    qryitens_vendaCOFINS: TStringField;
    qryitens_vendaCST_COFINS: TStringField;
    qryitens_vendaBase_Reduzida_COFINS: TStringField;
    qryitens_vendaBase_Acrescida_COFINS: TStringField;
    qryitens_vendaBC_COFINS: TStringField;
    qryitens_vendaValor_COFINS: TFloatField;
    qryitens_vendaQtde: TFloatField;
    qryitens_vendaValor_Unitario: TFloatField;
    qryitens_vendaValor_Frete: TFloatField;
    qryitens_vendaValor_Seguro: TFloatField;
    qryitens_vendaOutras_Despesas: TFloatField;
    qryitens_vendaSub_Total: TFloatField;
    qryitens_vendaSub_Total_Liquido: TFloatField;
    qryitens_vendaCancelado: TStringField;
    qryitens_vendaIndica_Valor_Total: TStringField;
    qryitens_vendaDesc_Acr: TFloatField;
    qryitens_vendaTipo_Desc_Acr: TStringField;
    qryitens_vendaCodigo_Registro: TAutoIncField;
    qryitens_vendaMarca: TStringField;
    qryitens_vendaValor_Original: TFloatField;
    qryitens_vendaValor_Compra: TFloatField;
    rs: TRSPrinter;
    Button1: TButton;
    qrycarrega_caixaCP: TStringField;
    LblCodigo: TLabel;
    qrycarrega_caixaTipo_Desc_Acr: TStringField;
    qrycarrega_caixaCodigo_Cliente: TIntegerField;
    RGOrdena: TRadioGroup;
    Timer1: TTimer;
    qryitens_vendaQtde_Estoque_Atual: TFloatField;
    qrycarrega_caixaTipo_Pagamento: TStringField;
    qryitens_vendaValor_ICMS_ST: TFloatField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnCarregar_PedidoClick(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure BBtnDevolve_PedidoClick(Sender: TObject);
    procedure BBtnBaixar_PedidoClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnCancelar_CupomClick(Sender: TObject);
    procedure BBtnCancela_Pre_VendaClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BBtnVoltar_PedidoClick(Sender: TObject);
    procedure RGOrdenaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BBtnGerar_DocumentosClick(Sender: TObject);
  private
    R05: URegistro.TR05;
    Itens_Pedido: URegistro.TItens_Pedido;
    Util: TUtil;
    saliquota: AnsiString;

    linha, conta, i2, criado: integer;
    dav, dav2, tipo_rel, rodape: AnsiString;
    cn, cp: AnsiString;

    procedure Verifica_Permissao;
    procedure Atualiza_R05;
    procedure Captura_Pedido_Mesclagem;
    procedure Captura_Produtos;
    procedure Captura_Totalizador;
    procedure Captura_Totalizador_ISS;
    procedure Captura_Totalizador_Cancelamento;
    procedure Pega_Endereco_Cliente;
    procedure Comprovante_Compra;
    procedure Cabecalho_Comprovante_Compra;
    procedure Atualiza_Dados;

    procedure Deleta_Pre_Venda;
    procedure Deleta_Forma_Pagamento;
    procedure Atualiza_Dados_Pedido;
    procedure Deleta_R05;
    procedure Cria_Conexao;
    procedure Inicia_Transacao;
    procedure Finaliza_Transacao;
    procedure Cancela_Transacao;
    procedure Inicia_Query_Conexao(Conexao: TADOConnection);
    function Verifica_Credito_Cliente: boolean;
  public
    ativo, nominal, cancela_pre: boolean;
    totalizador, totaux: AnsiString;
    qAux, qAux2, qAux3, qAux4, qTemp, qTemp2, qTemp3, qTemp4: TADOQuery;
    quero_cancelar: boolean;
    CPF: AnsiString;
    Conexao: TADOConnection;

    oLF: TLancamentoFinanceiroEntidade;
    oPLF: TParcelasLancamentoFinanceiroEntidade;
    oCli: TClienteEntidade;
    oCP: TCondicaoPagamentoEntidade;
    oCPDominio: TCondicaoPagamentoDominio;

    procedure Cancela_Pre_Venda(CodigoPedido: integer);
    procedure Chama_Dados;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCarrega_Pedido_Caixa: TFrmCarrega_Pedido_Caixa;
implementation

uses UDM, UDeclaracao, UInforma_Cupom, UFechamento_Venda_PDV, UMenu_Geral,
  UPre_Venda, UGerar_Documentos, Modelo.Dominio.Cliente.TClienteDominio;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCarrega_Pedido_Caixa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCarrega_Pedido_Caixa.BBtnGerar_DocumentosClick(Sender: TObject);
begin
  //FrmGerar_Documentos:= TFrmGerar_Documentos.Create(nil, oLF, oPLF, oCP, oCli);
  //FrmGerar_Documentos.ShowModal;
  //FrmGerar_Documentos.Free;
end;

procedure TFrmCarrega_Pedido_Caixa.BBtnLimparClick(Sender: TObject);
begin
  qrycarrega_caixa.close;
  BBtnBaixar_Pedido.Enabled:= false;
  //BBtnDevolve_Pedido.Enabled:= false;
  BBtnLimpar.Enabled:= false;
  BBtnCarregar_Pedido.Enabled:= true;
  //BBtnVoltar_Pedido.Enabled:= false;
  BBtnCancela_Pre_Venda.Enabled:= false;
end;

procedure TFrmCarrega_Pedido_Caixa.BBtnVoltar_PedidoClick(Sender: TObject);
begin
  if (Confirma_Processo) then
  begin
    Deleta_Pre_Venda;
    Atualiza_Dados_Pedido;
    Deleta_R05;
    Chama_Dados;
    Processo_Concluido;
  end;
end;

procedure TFrmCarrega_Pedido_Caixa.Button1Click(Sender: TObject);
begin
  Comprovante_Compra;
end;

procedure TFrmCarrega_Pedido_Caixa.Cancela_Pre_Venda(CodigoPedido: integer);
var
  sCodigo, sDescricao, sTipoQtde, sQtde, sValor, sTipo, sDesconto, tipo_desc, valor_desc, unid_med,
  sAcrecimo, Aux1, Aux3, Aux4, Aux5, sdesc_acr, dOUa, aliquotacupom: AnsiString;
  iConta: integer;
  valor_unitario, aliquota, DescontoTotal, ValorCupom: double;
  qDadosPedidoVenda: TADOQuery;
begin
  if (Habilitado = false) then
  begin
    Mensagem_Erro;
    abort;
  end;

  valor_unitario:= 0;
  valor_imposto_lei:= 0;
  aliquota:= 0;
  DescontoTotal:= 0;

  qAux:= TADOQuery.Create(self);
  qAux2:= TADOQuery.Create(self);
  qDadosPedidoVenda:= TADOQuery.Create(self);
  Verifica_Permissao;
  //Atualiza_Dados;
  //Cancela_Pre_Venda;
  TLog.Info('---CANCELAR PRE-VENDA---');
  try
    Cria_Conexao;
    ValorCupom:= 0;
    with qDadosPedidoVenda, sql do
    begin
      close;
      Connection:= FrmCarrega_Pedido_Caixa.Conexao;
      clear;
      add('select Ped.Codigo, IP.* from Itens_Pedido IP');
      add('inner join Pedido Ped on (IP.Codigo = Ped.Codigo)');
      //add('inner join Produto P on (IP.Codigo_Produto = P.Codigo)');
      add('where Ped.Codigo = :Codigo and IP.Cancelado = :N');
      Parameters.ParamByName('Codigo').Value:= CodigoPedido;//qrycarrega_caixaCodigo.AsString;
      Parameters.ParamByName('N').Value:= 'N';
      open;
    end;

    TLog.Debug('Carregou dados do pedido.');

    {with qAux, sql do
    begin
      close;
      Connection:= FrmCarrega_Pedido_Caixa.Conexao;
      clear;
      add('select P.Codigo, P.Codigo_Venda, P.Descricao, P.Estoque, P.Estoque_Reservado, P.Tipo, P.Valor_Medio,');
      add('P.Volume, P.Valor_Compra, P.Codigo_Grupo_Tributacao, P.Codigo_Grupo_Tributacao_ISSQN from Produto P');
      open;
    end;

    TLog.Debug('Carregou dados do produto.');}

    //Pega_Endereco_Cliente;
    //TLog.Debug('Carregou dados do endereço do cliente.');
    //Cupom_Nominal;
    {if (Cupom = 6) then
    begin

      if (qryendereco_clienteCPF_CNPJ.AsString = '') then
      begin
        Application.MessageBox('CPF ou CNPJ do cliente não cadastrado. Por favor, atualize seu cadastro. Logo após, atualize sua venda e tente novamente.', 'CPF/CNPJ inválido', MB_OK+MB_ICONHAND);
        abort;
      end;

      if (qryendereco_clienteNome.AsString = '') then
      begin
        Application.MessageBox('Nome do cliente não cadastrado. Por favor, atualize seu cadastro. Logo após, atualize sua venda e tente novamente.', 'Nome inválido', MB_OK+MB_ICONHAND);
        abort;
      end;

      if (qrycarrega_caixaTipo_Pagamento.AsString = 'A PRAZO') and (controla_credito_cliente = 0) then
      begin
        if not (Verifica_Credito_Cliente) then
          exit;
      end;

      TLog.Debug('Vai abrir cupom nominal.');
      if ( Length(qryendereco_clienteCPF_CNPJ.AsString) = 11) then
      begin
        Aux1:= Copy(qryendereco_clienteCPF_CNPJ.AsString, 1, 3);
        Aux2:= Copy(qryendereco_clienteCPF_CNPJ.AsString, 4, 3);
        Aux3:= Copy(qryendereco_clienteCPF_CNPJ.AsString, 7, 3);
        Aux4:= Copy(qryendereco_clienteCPF_CNPJ.AsString, 10, 2);

        CPF:= Aux1 + '.' + Aux2 + '.' + Aux3 + '-' + Aux4;
      end
      else if ( Length(qryendereco_clienteCPF_CNPJ.AsString) = 14) then
      begin
        Aux1:= Copy(qryendereco_clienteCPF_CNPJ.AsString, 1, 2);
        Aux2:= Copy(qryendereco_clienteCPF_CNPJ.AsString, 3, 3);
        Aux3:= Copy(qryendereco_clienteCPF_CNPJ.AsString, 6, 3);
        Aux4:= Copy(qryendereco_clienteCPF_CNPJ.AsString, 9, 4);
        Aux5:= Copy(qryendereco_clienteCPF_CNPJ.AsString, 13, 2);

        CPF:= Aux1 + '.' + Aux2 + '.' + Aux3 + '/' + Aux4 + '-' + Aux5;
      end;
      TLog.Debug('CPF formatado:'+CPF);

      ECF.Abrir_Cupom_Nominal(CPF, qryendereco_clienteNome.AsString, qryendereco_clienteTipo_Endereco.AsString + ' ' + qryendereco_clienteEndereco.AsString + ', ' + qryendereco_clienteNumero.AsString + ', BAIRRO ' + qryendereco_clienteSetor.AsString);
      TLog.Debug('Abriu cupom norminal.');
      nominal:= true;
    end
    else if (Cupom = 7) then
    begin

      if (qrycarrega_caixaTipo_Pagamento.AsString = 'A PRAZO') and (controla_credito_cliente = 0) then
      begin
        if not (Verifica_Credito_Cliente) then
          exit;
      end;
      }
      ECF.Abrir_Cupom;
      TLog.Debug('Abriu cupom normal.');
      nominal:= false;
    //end
    //else
      //abort;

    {TLog.Debug('Vai preencher objeto Cliente com os dados do cliente.');
    oCli:= TClienteEntidade.Create;
    oCli.Codigo:= qrycarrega_caixaCodigo_Cliente.AsInteger;
    oCli.NomeFantasia:= qrycarrega_caixaNome_Nome_Fantasia.AsString;
    oCli.RazaoSocial:= qrycarrega_caixaNome_Nome_Fantasia.AsString;
    oCli.EnderecoTexto:= qryendereco_clienteEndereco.AsString;
    oCli.CPFCNPJ:= qryendereco_clienteCPF_CNPJ.AsString;

    TLog.Debug('Preencheu objeto Cliente com os dados do cliente.'); }
    while not qDadosPedidoVenda.Eof do
    begin
      TLog.Debug('');
      TLog.Debug('DADOS DOS PRODUTOS:');
      //qAux.Locate('Codigo', qAux2.FieldByName('Codigo_Produto').AsInteger, []);

      sCodigo    := StringOfChar('0', 12-Length(qDadosPedidoVenda.FieldByName('Codigo_Venda').AsString)) + qDadosPedidoVenda.FieldByName('Codigo_Venda').AsString;
      sCodigo    := Copy(sCodigo,1,12);
      TLog.Debug('Código do produto: '+sCodigo);
      sDescricao := Copy(qDadosPedidoVenda.FieldByName('Descricao').AsString,1,29);
      TLog.Debug('Descrição do produto: '+sDescricao);
      TLog.Debug('Tipo do recolhimento: '+qDadosPedidoVenda.FieldByName('Tipo_Recolhimento').AsString);

      if (qDadosPedidoVenda.FieldByName('Tipo_Recolhimento').AsString = 'I') then
      begin
        sAliquota:= 'I1';
        aliquotacupom:= 'II';
      end
      else if (qDadosPedidoVenda.FieldByName('Tipo_Recolhimento').AsString = 'NT') then
      begin
        sAliquota:= 'N1';
        aliquotacupom:= 'NN';
      end
      else if (qDadosPedidoVenda.FieldByName('Tipo_Recolhimento').AsString = 'ST') then
      begin
        sAliquota:= 'F1';
        aliquotacupom:= 'FF';
      end
      else if (qDadosPedidoVenda.FieldByName('Tipo_Recolhimento').AsString = 'TRIBUTADO') then
      begin
        sAliquota:= qDadosPedidoVenda.FieldByName('ICMS').AsString;
        aliquotacupom:= StringReplace(saliquota, '0', '', [rfReplaceAll]);
      end
      else
      begin
        if (qDadosPedidoVenda.FieldByName('ICMS').AsString = '0') then
        begin
          sAliquota:= 'F1';
          aliquotacupom:= 'FF';
        end
        else
        begin
          sAliquota:= qDadosPedidoVenda.FieldByName('ICMS').AsString;
          aliquotacupom:= StringReplace(saliquota, '0', '', [rfReplaceAll]);
        end;
        //sAliquota:= qAux2.FieldByName('ICMS').AsString;
        //aliquotacupom:= StringReplace(saliquota, '0', '', [rfReplaceAll]);
      end;

      TLog.Debug('Aliquota do produto: '+sAliquota);
      TLog.Debug('Aliquota do cupom: '+aliquotacupom);
      sTipoQtde  := 'I';
      sQtde      := FormatFloat('#0.0,00', qDadosPedidoVenda.FieldByName('Qtde').AsFloat);
      sQtde:= StringReplace(sQtde, ThousandSeparator, '', [rfReplaceAll]);
      TLog.Debug('Quantidade: '+sQtde);
      //sValor     := FormatFloat('#0.0,00', qAux2.FieldByName('Valor_Unitario').AsFloat);
      sValor     := FormatFloat('#0.0,00', qDadosPedidoVenda.FieldByName('Valor_Original').AsFloat);
      sValor     := StringReplace(sValor, ThousandSeparator, '', [rfReplaceAll]);
      TLog.Debug('Valor: '+sValor);
      //if (qAux2.FieldByName('Tipo_Desc_Acr').AsString = '%') then
        //sTipo:= '%'
      //else
        sTipo:= '$';
      DescontoTotal:= (qDadosPedidoVenda.FieldByName('Qtde').AsFloat * qDadosPedidoVenda.FieldByName('Desc_Acr').AsFloat) - qDadosPedidoVenda.FieldByName('Outras_Despesas').AsFloat;
      {sDesconto:= '0';
      sAcrecimo:= '0';
      if (qAux2.FieldByName('dOUa').AsString = 'D') then
      begin}
        sDesconto:= FormatFloat('#0.0,0', DescontoTotal);
        sDesconto:= StringReplace(sDesconto, ThousandSeparator, '', [rfReplaceAll]);
        //sDesconto:= FormatFloat('#0.0,0', qAux2.FieldByName('Desc_Acr').AsFloat * StrToFloat(sQtde));
        sAcrecimo:= '0';
        sdesc_acr:= sDesconto;
        dOUa:= 'D';
      {end
      else
      begin
        sAcrecimo:= FormatFloat('#0.0,0', qAux2.FieldByName('Desc_Acr').AsFloat);
        //sAcrecimo:= FormatFloat('#0.0,0', qAux2.FieldByName('Desc_Acr').AsFloat * StrToFloat(sQtde));
        sDesconto:= '0';
        sdesc_acr:= sAcrecimo;
        dOUa:= 'A';
      end;}
      //TLog.Debug('Acréscimo: '+sAcrecimo);
      TLog.Debug('Desconto: '+sDesconto);
      TLog.Debug('Variável sdesc_acr: '+sdesc_acr);
      TLog.Debug('dOUa: '+dOUa);

      unid_med:= qDadosPedidoVenda.FieldByName('UN').AsString;
      TLog.Debug('Unidade de medida: '+unid_med);
      if (ECF.Vende_Item(scodigo, sdescricao, aliquotacupom, sqtde, svalor, sdesc_acr, sTipo, unid_med, dOUa)) then
      begin
        //CapturaContadoresECF;
        //ECF.Pega_Contadores;
        //ECF.Pega_Numero_Caixa;
        //Captura_Ultimo_Item;
        //ECF.Pega_Ultimo_Item;
        //Captura_Totalizador;

        //R05.Alterar(R05);
        //R05.Alterar_Aux(R05);

        //R05.Alterar_Item(R05);
        //R05.Alterar_Item_Aux(R05);

        {if (qryitens_venda.Locate('Codigo; Codigo_Produto', VarArrayOf([qrycarrega_caixaCodigo.AsInteger, qAux.FieldByName('Codigo').AsInteger]), [])) then
        begin
          TLog.Debug('Vai atualizar dados do N_Item');
          qryitens_venda.Edit;
          qryitens_vendaN_Item.AsString:= UDeclaracao.N_Item;
          qryitens_venda.Post;
          TLog.Debug('Atualizou dados do N_Item');
        end;

        if (FrmCarrega_Pedido_Caixa.quero_cancelar = false) and (qAux2.FieldByName('Cancelado').AsString = 'N') and (gerar_estoque = 0) then
        begin
          if (qryitens_venda.Locate('Codigo; Codigo_Produto', VarArrayOf([qrycarrega_caixaCodigo.AsInteger, qAux.FieldByName('Codigo').AsInteger]), [])) then
          begin
            TLog.Debug('Vai atualizar dados da Qtde_Estoque_Atual');
            qryitens_venda.Edit;
            qryitens_vendaQtde_Estoque_Atual.AsFloat:= qAux.FieldByName('Estoque').AsFloat;
            qryitens_venda.Post;
            TLog.Debug('Atualizou dados da Qtde_Estoque_Atual');
          end;

          estoque:= qAux.FieldByName('Estoque').AsFloat - qAux2.FieldByName('Qtde_Entregue').AsFloat;
          estoque_reservado:= qAux.FieldByName('Estoque_Reservado').AsFloat + qAux2.FieldByName('Qtde_Restante').AsFloat;
          TLog.Debug('Estoque: '+FloatToStr(estoque));

          Atualiza_Saldo_Estoque(qAux.FieldByName('Codigo').AsInteger, (qAux.FieldByName('Valor_Compra').AsFloat * estoque));
          TLog.Debug('Atualizou saldo do estoque.');
          Atualiza_Estoque(estoque, qAux.FieldByName('Codigo').AsInteger);
          TLog.Debug('Atualizou estoque.');
          Atualiza_Volume(estoque * qAux.FieldByName('Volume').AsFloat, qAux.FieldByName('Codigo').AsInteger);
          TLog.Debug('Atualizou volume.');
        end;}


        aliquota:= Retorna_Aliquota_NCM(qDadosPedidoVenda.FieldByName('NCM').AsString, qDadosPedidoVenda.FieldByName('Origem').AsString, FrmCarrega_Pedido_Caixa.Conexao);
        valor_unitario:= qDadosPedidoVenda.FieldByName('Valor_Unitario').AsFloat;
        TLog.Debug('Aliquota do NCM: '+FloatToStr(aliquota));
        TLog.Debug('Valor Unitário: '+FloatToStr(valor_unitario));

        valor_imposto_lei:= valor_imposto_lei + (valor_unitario * (aliquota / 100));
        valor_imposto_lei:= Calcula_Valor(FloatToStr(valor_imposto_lei));
        TLog.Debug('Valor Imposto Lei: '+FloatToStr(valor_imposto_lei));
        ValorCupom:= ValorCupom + (qDadosPedidoVenda.FieldByName('Valor_Unitario').AsFloat * qDadosPedidoVenda.FieldByName('Qtde').AsFloat);
        qDadosPedidoVenda.Next;
      end;
    end;

    ECF.Inicia_Fechamento_Cupom(PAnsiChar('+0'), '');
    ECF.Fecha_Cupom('01', FloatToStr(ValorCupom), false);
    ECF.Termina_Fechamento_Cupom(mensagem, pMD5_Arquivos, '', '', '');

    ECF.Cancela_Cupom;
    ECF.Pega_Grande_Total;
    Atualiza_Status_Pedido(dm.ADOConnection1, qrycarrega_caixaCodigo.AsInteger, 'CANCELADO');
    AlteraGT(StrToFloat(UDeclaracao.GrandeTotal), nu_serie);
    Finaliza_Transacao;
  except on e:Exception do
  begin
    ShowMessage('Erro ao cancelar cupom fiscal: '+e.Message);
    TLog.Error('Erro ao cancelar cupom fiscal: '+e.Message);
    Cancela_Transacao;
    abort;
  end;
  end;

  //Application.CreateForm(TFrmFechamento_Venda_PDV, FrmFechamento_Venda_PDV);
  //Centraliza_Form(FrmFechamento_Venda_PDV);
  //FrmFechamento_Venda_PDV.Show;
  //FrmFechamento_Venda_PDV.Free;
{var
  sCodigo, sDescricao, saliquota, sTipoQtde, sQtde, sValor, sTipo, sDesconto, tipo_desc, valor_desc, unid_med,
  sAcrecimo, cAcreDesc, cTipoAcreDesc, cValorAcreDesc: AnsiString;
begin
  dm.qryvenda.Close;
  dm.qryvenda.Open;
  cancela_pre:= false;
  dm.qryvenda.Locate('N_Pre_Venda', qrycarrega_caixaN_Pre_Venda.AsString, []);
  if (DM.qryvendaMesclada.AsInteger = 1) then
  begin
  try
    cancela_pre:= true;
    qTemp:= TADOQuery.Create(self);
    qTemp2:= TADOQuery.Create(self);
    qTemp3:= TADOQuery.Create(self);
    qTemp4:= TADOQuery.Create(self);
    qAux:= TADOQuery.Create(self);

    Captura_Pedido_Mesclagem;
    Captura_Produtos;

    //percorre para pegar todos pedidos "antigos", referente a nova pré-venda
    try
      while not qTemp3.Eof do
      begin
        with qTemp2, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('select Ped.Codigo, Ped.N_Pre_Venda, IP.*, P.Codigo_Venda, P.Descricao, P.Tipo from Itens_Pedido IP');
          add('inner join Pedido Ped on (IP.Codigo = Ped.Codigo)');
          add('inner join Produto P on (IP.Codigo_Produto = P.Codigo)');
          add('where Ped.N_Pre_Venda = :N_Pre_Venda and IP.Cancelado = :N and P.Tipo = :Tipo');
          Parameters.ParamByName('N_Pre_Venda').Value:= qTemp3.FieldByName('N_Pre_Venda_Antiga').AsString;
          Parameters.ParamByName('N').Value:= 'N';
          Parameters.ParamByName('Tipo').Value:= 0;
          open;
        end;

        iRetorno:= Bematech_FI_AbreCupom('');
        Analisa_iRetorno;

        //pegar os itens dessa pré-venda "antiga", gerar o cupom e cancelar
        while not qTemp2.Eof do
        begin
          qTemp.Locate('Codigo', qTemp2.FieldByName('Codigo_Produto').AsInteger, []);
          //Pega_ICMS_NC(qTemp.FieldByName('Codigo_Grupo_Tributacao').AsInteger);
          //Pega_ISS(qTemp.FieldByName('Codigo_Grupo_Tributacao_ISSQN').AsInteger);

          sCodigo    := qTemp.FieldByName('Codigo_Venda').AsString;
          sDescricao := Copy(qTemp.FieldByName('Descricao').AsString,1,29);

          if (qTemp2.FieldByName('ICMS').AsString = 'I') then
            sAliquota:= 'I1'
          else if (qTemp2.FieldByName('ICMS').AsString = 'N') then
            sAliquota:= 'N1'
          else if (qTemp2.FieldByName('ICMS').AsString = 'F') then
            sAliquota:= 'F1'
          else
            sAliquota:= qTemp2.FieldByName('ICMS').AsString;

          sTipoQtde  := 'I';
          sQtde      := FormatFloat('#0.0,00', qTemp2.FieldByName('Qtde').AsFloat);
          sValor     := FormatFloat('#0.0,00', qTemp2.FieldByName('Valor_Unitario').AsFloat);

          if (qTemp2.FieldByName('Tipo_Desconto').AsString = '%') then
            sTipo:= '%'
          else
            sTipo:= '$';

          sDesconto  := FormatFloat('#0.0,0', qTemp2.FieldByName('Desconto').AsFloat);
          sAcrecimo  := FormatFloat('#0.0,0', qTemp2.FieldByName('Acrecimo').AsFloat);
          unid_med:= qTemp2.FieldByName('UN').AsString;

          iRetorno:= Bematech_FI_VendeItemDepartamento(PAnsiChar(scodigo), PAnsiChar(sdescricao),
                                                       PAnsiChar(saliquota), PAnsiChar(svalor),
                                                       PAnsiChar(sqtde), PAnsiChar(sAcrecimo),
                                                       PAnsiChar(sdesconto), PAnsiChar('00'), PAnsiChar(unid_med));
          if (iRetorno = 1) then
          begin
            //CapturaContadoresECF;
            ECF.Pega_Contadores;
            ECF.Pega_Numero_Caixa;
            //Captura_Ultimo_Item;
            ECF.Pega_Ultimo_Item;
            Captura_Totalizador_Cancelamento;
            R05.Alterar(R05);
            R05.Alterar_Item(R05);
            Atualiza_R05;
          end;

          qTemp2.Next;
        end;

        cTipoAcreDesc:= '$';
        cAcreDesc:= 'D';
        cValorAcreDesc:= '0,00';
        iRetorno:= Bematech_FI_IniciaFechamentoCupom(PAnsiChar(cAcreDesc), PAnsiChar(cTipoAcreDesc), PAnsiChar(cValorAcreDesc));
        Analisa_iRetorno;

        iRetorno:= Bematech_FI_TerminaFechamentoCupom(#13+#10 + 'MD5 - ' + pMD5_Arquivos +
                                                      #13+#10 + 'PV - ' + qTemp3.FieldByName('N_Pre_Venda_Antiga').AsString);

        if (iRetorno = 1) then
        begin
          den_op:= 'RV';
          Coleta_Dados_R06;
          R06.Inserir_Outros(R06);
        end;

        iRetorno:= Bematech_FI_CancelaCupom;
        Analisa_iRetorno;

        if (iRetorno = 1) then
        begin
          den_op:= 'NC';
          Coleta_Dados_R06;
          R06.Inserir_Outros(R06);
        end;

        ECF.Pega_Grande_Total;

        AlteraGT(StrToFloat(UDeclaracao.GrandeTotal), nu_serie);
        with qAux, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('update Pedido set Status = :Status');
          add('where N_Pre_Venda = :N_Pre_Venda');
          Parameters.ParamByName('Status').Value:= 'CANCELADO';
          Parameters.ParamByName('N_Pre_Venda').Value:= qTemp3.FieldByName('N_Pre_Venda_Antiga').AsString;
          ExecSQL;
        end;
      qTemp3.Next;
      end;
    except
      showmessage('Erro');
    end;
  finally
    cancela_pre:= false;
    FreeAndNil(qTemp);
    FreeAndNil(qTemp2);
    FreeAndNil(qTemp3);
    FreeAndNil(qAux);
  end;
  end; }


end;

procedure TFrmCarrega_Pedido_Caixa.Cancela_Transacao;
begin
  Conexao.RollbackTrans;
end;

procedure TFrmCarrega_Pedido_Caixa.Captura_Pedido_Mesclagem;
begin
  with qTemp3, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select CMV.* from Controla_Mesclagem_Venda CMV');
    add('where CMV.N_Pre_Venda = :N');
    Parameters.ParamByName('N').Value:= qrycarrega_caixaN_Pre_Venda.AsString;
    open;
  end;
end;

procedure TFrmCarrega_Pedido_Caixa.Captura_Produtos;
begin
  with qTemp, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select P.Codigo, P.Codigo_Venda, P.Descricao, P.Codigo_Grupo_Tributacao, P.Codigo_Grupo_Tributacao_ISSQN, P.Estoque, P.Tipo,');
    add('P.Volume, UM.Sigla from Produto P');
    add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
    open;
  end;
end;

procedure TFrmCarrega_Pedido_Caixa.Captura_Totalizador;
begin
  if (saliquota <> 'I1') and (saliquota <> 'N1') and (saliquota <> 'F1') then
  begin
    totaux:= saliquota;
    totalizador:= 'T' + totaux;
  {end
  else if (qAux.FieldByName('Tipo_Tributacao').AsString = 'S') then
  begin
    totaux:= saliquota;
    totalizador:= qAux.FieldByName('Tipo_Tributacao').AsString + totaux;}
  end
  else if (saliquota = 'I1') then
    totalizador:= 'I1'
  else if (saliquota = 'N1') then
    totalizador:= 'N1'
  else if (saliquota = 'F1') then
    totalizador:= 'F1';

end;

procedure TFrmCarrega_Pedido_Caixa.Captura_Totalizador_Cancelamento;
begin
  if (qTemp.FieldByName('Tipo_Tributacao').AsString = 'T') then
  begin
    totaux:= saliquota;
    totalizador:= qTemp.FieldByName('Tipo_Tributacao').AsString + totaux;
  end
  else if (qTemp.FieldByName('Tipo_Tributacao').AsString = 'S') then
  begin
    totaux:= saliquota;
    totalizador:= qTemp.FieldByName('Tipo_Tributacao').AsString + totaux;
  end
  else if (qTemp.FieldByName('Tipo_Tributacao').AsString = 'I') then
    totalizador:= 'I1'
  else if (qTemp.FieldByName('Tipo_Tributacao').AsString = 'N') then
    totalizador:= 'N1'
  else if (qTemp.FieldByName('Tipo_Tributacao').AsString = 'F') then
    totalizador:= 'F1';
end;

procedure TFrmCarrega_Pedido_Caixa.Captura_Totalizador_ISS;
begin
  {if (qAux.FieldByName('Tipo_Tributacao').AsString = 'I') or (qAux.FieldByName('Tipo_Tributacao').AsString = 'N') OR
     (qAux.FieldByName('Tipo_Tributacao').AsString = 'F') or (qAux.FieldByName('Tipo_Tributacao').AsString = 'T') then
  begin
    if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 1 then
      totaux  := '0' + qAux_ICMS.FieldByName('Aliquota').AsString + '00' //0700
        else
      totaux  := qAux_ICMS.FieldByName('Aliquota').AsString + '00';      //1200

    totalizador:= qAux.FieldByName('Tipo_Tributacao').AsString + totaux;
  end
  else} if (qAux.FieldByName('Tipo_Tributacao').AsString = 'S') then
  begin
    if Length(qAux_ISS.FieldByName('Aliquota').AsString) = 1 then
      totaux  := '0' + qAux_ISS.FieldByName('Aliquota').AsString + '00' //0700
        else
      totaux  := qAux_ISS.FieldByName('Aliquota').AsString + '00';      //1200

    totalizador:= qAux.FieldByName('Tipo_Tributacao').AsString + totaux;
  end;
end;

function TFrmCarrega_Pedido_Caixa.Confira: boolean;
begin
    {Confira:= false;
    if EdtNumero.Text = '' then
      begin
        Application.MessageBox('Há dados incorretos que não foram preenchidos.', 'Erro', MB_OK+MB_ICONHAND);
        EdtNumero.SetFocus;
        abort;
      end;

    if EdtNome.Text = '' then
      begin
        Application.MessageBox('Há dados incorretos que não foram preenchidos.', 'Erro', MB_OK+MB_ICONHAND);
        EdtNome.SetFocus;
        abort;
      end;
      Confira:= true; }
end;

procedure TFrmCarrega_Pedido_Caixa.DBGrid1CellClick(Column: TColumn);
begin
  LblCodigo.Caption:= qrycarrega_caixaCodigo.AsString;
end;

procedure TFrmCarrega_Pedido_Caixa.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmCarrega_Pedido_Caixa.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    BBtnBaixar_Pedido.Click;
  end;
end;

procedure TFrmCarrega_Pedido_Caixa.Atualiza_Dados_Pedido;
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
      add('update Pedido set N_Pre_Venda = :N_Pre_Venda, Tipo = :Tipo, Status = :Status, DAVC = :DAVC');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('N_Pre_Venda').Value:= '';
      Parameters.ParamByName('Tipo').Value:= 'DAV';
      Parameters.ParamByName('Status').Value:= 'PENDENTE';
      Parameters.ParamByName('DAVC').Value:= 'NÃO';
      Parameters.ParamByName('Codigo').Value:= qrycarrega_caixaCodigo.AsInteger;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCarrega_Pedido_Caixa.Deleta_Forma_Pagamento;
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
      add('Delete from Pedido_Pagamento_DAV');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= qrycarrega_caixaCodigo.AsInteger;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCarrega_Pedido_Caixa.Deleta_Pre_Venda;
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
      add('Delete from Controla_Pre_Venda');
      add('where N_Pre_Venda = :N_Pre_Venda');
      Parameters.ParamByName('N_Pre_Venda').Value:= qrycarrega_caixaN_Pre_Venda.AsInteger;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCarrega_Pedido_Caixa.Deleta_R05;
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
      add('Delete from R05');
      add('where N_Pedido = :N_Pedido');
      Parameters.ParamByName('N_Pedido').Value:= qrycarrega_caixaCodigo.AsInteger;
      ExecSQL;
    end;

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('Delete from R05_Aux');
      add('where N_Pedido = :N_Pedido');
      Parameters.ParamByName('N_Pedido').Value:= qrycarrega_caixaCodigo.AsInteger;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCarrega_Pedido_Caixa.Finaliza_Transacao;
begin
  Conexao.CommitTrans;
end;

procedure TFrmCarrega_Pedido_Caixa.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCarrega_Pedido_Caixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmCarrega_Pedido_Caixa.Release;
  FrmCarrega_Pedido_Caixa:= Nil;
end;

procedure TFrmCarrega_Pedido_Caixa.FormCreate(Sender: TObject);
begin
  if (Habilitado = false) then
    begin
      Mensagem_Erro;
      abort;
    end;

  Centraliza_Form(FrmCarrega_Pedido_Caixa);
  qrycarrega_caixa.Close;
  LblData_Hora.Caption:= DateToStr(now);
  quero_cancelar:= false;
  Timer1.Interval:= tempo_atualizacao;
end;

procedure TFrmCarrega_Pedido_Caixa.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCarrega_Pedido_Caixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  estoque, estoque_reservado: double;
  qAux, qAux2: TADOQuery;
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f12) then
  begin
    if (Confirma_Cancalamento_Cupom) then
    begin
      try
        qAux:= TADOQuery.Create(self);
        qAux2:= TADOQuery.Create(self);

        with qAux2, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('select Ped.Codigo, IP.* from Itens_Pedido IP');
          add('inner join Pedido Ped on (IP.Codigo = Ped.Codigo)');
          add('where Ped.Codigo = :Codigo and IP.Cancelado = :N');
          Parameters.ParamByName('Codigo').Value:= StrToInt(LblCodigo.Caption);
          Parameters.ParamByName('N').Value:= 'N';
          open;
        end;

        qAux2.First;
        while not qAux2.Eof do
        begin
          with qAux, sql do
          begin
            close;
            Connection:= dm.ADOConnection1;
            clear;
            add('select P.Codigo, P.Estoque, P.Estoque_Reservado, P.Valor_Medio, P.Valor_Compra, P.Volume from Produto P');
            add('where P.Codigo = :Codigo');
            Parameters.ParamByName('Codigo').Value:= qAux2.FieldByName('Codigo_Produto').AsInteger;
            open;
          end;

          estoque:= qAux.FieldByName('Estoque').AsFloat + qAux2.FieldByName('Qtde_Entregue').AsFloat;
          estoque_reservado:= qAux.FieldByName('Estoque_Reservado').AsFloat - qAux2.FieldByName('Qtde_Restante').AsFloat;

          {Insere_Movimentacao_Estoque(UDeclaracao.codigo_empresa, qAux.FieldByName('Codigo').AsInteger, qAux.FieldByName('Codigo_Venda').AsString, qAux.FieldByName('Descricao').AsString, 'SAÍDA', qrycarrega_caixaData_Venda.AsDateTime,
          qAux.FieldByName('Estoque').AsFloat, qAux2.FieldByName('Qtde_Entregue').AsFloat, qAux2.FieldByName('Valor_Unitario').AsFloat, (qAux2.FieldByName('Qtde_Entregue').AsFloat * qAux2.FieldByName('Valor_Unitario').AsFloat),
          qAux.FieldByName('Valor_Medio').AsFloat, estoque, (qAux.FieldByName('Valor_Medio').AsFloat * estoque));}

          Atualiza_Saldo_Estoque(dm.ADOConnection1, qAux.FieldByName('Codigo').AsInteger, (qAux.FieldByName('Valor_Compra').AsFloat * estoque));
          Atualiza_Estoque(dm.ADOConnection1, estoque, qAux.FieldByName('Codigo').AsInteger);
          Atualiza_Estoque_Reservado(estoque_reservado, qAux.FieldByName('Codigo').AsInteger);  //////verificar estoque reservado
          Atualiza_Volume(dm.ADOConnection1, estoque * qAux.FieldByName('Volume').AsFloat, qAux.FieldByName('Codigo').AsInteger);
          qAux2.Next;
        end;

        ECF.Cancela_Cupom;
        ECF.Pega_Grande_Total;
        AlteraGT(StrToFloat(UDeclaracao.GrandeTotal), nu_serie);

        Atualiza_Status_Pedido(dm.ADOConnection1, StrToInt(LblCodigo.Caption), 'CANCELADO');
        Atualiza_R04(StrToInt(LblCodigo.Caption));
        Atualiza_R04_Aux(StrToInt(LblCodigo.Caption));
        Deleta_Lancamento_Financeiro();

        Cria_Arquivo_Atualiza_Dados('AProd');
        Atualiza_Produto(4, '');
        Processo_Concluido;
      finally
        FreeAndNil(qAux);
        FreeAndNil(qAux2);
      end;
    end;
  end;
end;

procedure TFrmCarrega_Pedido_Caixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCarrega_Pedido_Caixa.Pega_Endereco_Cliente;
begin
  with qryendereco_cliente, sql do
  begin
    close;
    Connection:= FrmCarrega_Pedido_Caixa.Conexao;
    clear;
    add('select PEC.Nome, PEC.CPF_CNPJ, PEC.Tipo_Endereco, PEC.Endereco,');
    add('PEC.Numero, PEC.Setor from Pedido_Endereco_Cliente PEC');
    add('where PEC.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= qrycarrega_caixaCodigo.AsInteger;
    open;
  end;
end;

procedure TFrmCarrega_Pedido_Caixa.RGOrdenaClick(Sender: TObject);
begin
  Chama_Dados;
end;

procedure TFrmCarrega_Pedido_Caixa.Timer1Timer(Sender: TObject);
begin
  if (FileExists(caminho_servidor + '\Atualizações\TemCupom.txt')) then
  begin
    Chama_Dados;
    BBtnBaixar_Pedido.Enabled:= true;
    BBtnLimpar.Enabled:= true;
    BBtnCarregar_Pedido.Enabled:= false;
    BBtnCancela_Pre_Venda.Enabled:= true;
    DeleteFile(caminho_servidor + '\Atualizações\TemCupom.txt');
  end;
end;

procedure TFrmCarrega_Pedido_Caixa.Verifica_Permissao;
begin
  if (DBGrid1.SelectedRows.Count = 0) and (qrycarrega_caixa.IsEmpty = false) then
  begin
    Item_Nao_Selecionado;
    abort;
  end
  else if (qrycarrega_caixa.IsEmpty) then
  begin
    Nao_Ha_Registro;
    abort;
  end;

end;

procedure TFrmCarrega_Pedido_Caixa.Atualiza_R05;
begin
  with qTemp4, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('update R05 set Cancelamento = :Cancelamento, Quantidade_Cancelada = :Qtde, Valor_Cancelado = :Valor');
    add('where N_Pedido = :Pedido and Codigo_Produto_Inteiro = :Produto');
    Parameters.ParamByName('Produto').Value:= qTemp2.FieldByName('Codigo_Produto').AsInteger;
    Parameters.ParamByName('Pedido').Value:= qTemp3.FieldByName('Codigo_Pre_Venda_Antiga').AsString;
    Parameters.ParamByName('Cancelamento').Value:= 'S';
    Parameters.ParamByName('Qtde').Value:= qTemp2.FieldByName('Qtde').AsString;
    Parameters.ParamByName('Valor').Value:= qTemp2.FieldByName('Valor_Unitario').AsFloat * qTemp2.FieldByName('Qtde').AsFloat;
    ExecSQL;
  end;
end;

procedure TFrmCarrega_Pedido_Caixa.Inicia_Transacao;
begin
  SetUncommitted(FrmCarrega_Pedido_Caixa.Conexao);
  SetUncommitted(dm.ADOConnection1);
  FrmCarrega_Pedido_Caixa.Conexao.BeginTrans;
end;

procedure TFrmCarrega_Pedido_Caixa.Inicia_Query_Conexao(Conexao: TADOConnection);
begin
  qryitens_venda.Connection:= FrmCarrega_Pedido_Caixa.Conexao;
  qryendereco_cliente.Connection:= FrmCarrega_Pedido_Caixa.Conexao;
  qAux.Connection:= FrmCarrega_Pedido_Caixa.Conexao;
  qAux2.Connection:= FrmCarrega_Pedido_Caixa.Conexao;
end;

procedure TFrmCarrega_Pedido_Caixa.Cria_Conexao;
begin
  try
    Conexao:= TADOConnection.Create(self);
    UGeral.Abre_Conexao(FrmCarrega_Pedido_Caixa.Conexao);
    Inicia_Transacao;
    Inicia_Query_Conexao(FrmCarrega_Pedido_Caixa.Conexao);
    //SetUncommitted(FrmCarrega_Pedido_Caixa.Conexao);
    //SetUncommitted(dm.ADOConnection1);
  except on e:Exception do
  begin
    ShowMessage('Erro ao abrir conexão com banco de dados. '+e.Message);
    abort;
  end;
  end;
end;

function TFrmCarrega_Pedido_Caixa.Verifica_Credito_Cliente: boolean;
var
  aux: Boolean;
  ValorTotal, TotalCompra, Credito: double;
  FCliente: TClienteEntidade;
  FClienteDom: TClienteDominio;
begin
  TotalCompra:= qrycarrega_caixaTotal_Pedido.AsFloat;
  FCliente:= TClienteEntidade.Create;
  FClienteDom:= TClienteDominio.Create(dm.ADOConnection1);
  FCliente.Codigo:= qrycarrega_caixaCodigo_Cliente.AsInteger;
  FCliente.NomeFantasia:= qrycarrega_caixaNome_Nome_Fantasia.AsString;
  Result:= false;

  if (FClienteDom.VerificaSeExisteLimiteDeCreditoDisponivel(FCliente, TotalCompra)) then
  begin
    FClienteDom.AtualizaCreditoCliente(FCliente, TotalCompra);
    Result:= true;
    //Cria_Arquivo_Atualiza_Dados('ACli');
  end;

end;

procedure TFrmCarrega_Pedido_Caixa.BBtnBaixar_PedidoClick(Sender: TObject);
var
  sCodigo, sDescricao, sTipoQtde, sQtde, sValor, sTipo, sDesconto, tipo_desc, valor_desc, unid_med,
  sAcrecimo, Aux1, Aux2, Aux3, Aux4, Aux5, sdesc_acr, dOUa, aliquotacupom: AnsiString;
  iConta: integer;
  estoque, estoque_reservado, valor_unitario, aliquota, DescontoTotal: double;
begin
  if (Habilitado = false) then
  begin
    Mensagem_Erro;
    abort;
  end;

  valor_unitario:= 0;
  valor_imposto_lei:= 0;
  aliquota:= 0;
  DescontoTotal:= 0;

  qAux:= TADOQuery.Create(self);
  qAux2:= TADOQuery.Create(self);
  Verifica_Permissao;
  Atualiza_Dados;
  //Cancela_Pre_Venda;
  TLog.Info('---RECEBIMENTOS CAIXA: BAIXAR PEDIDO---');
  try
    Cria_Conexao;

    with qAux2, sql do
    begin
      close;
      Connection:= FrmCarrega_Pedido_Caixa.Conexao;
      clear;
      add('select Ped.Codigo, IP.*, P.Tipo from Itens_Pedido IP');
      add('inner join Pedido Ped on (IP.Codigo = Ped.Codigo)');
      add('inner join Produto P on (IP.Codigo_Produto = P.Codigo)');
      add('where Ped.Codigo = :Codigo and IP.Cancelado = :N');//and IP.Qtde_Entregue > 0');//IP.Tipo_Entrega = :Tipo');
      Parameters.ParamByName('Codigo').Value:= qrycarrega_caixaCodigo.AsString;
      Parameters.ParamByName('N').Value:= 'N';
      open;
    end;

    TLog.Debug('Carregou dados do pedido.');

    with qAux, sql do
    begin
      close;
      Connection:= FrmCarrega_Pedido_Caixa.Conexao;
      clear;
      add('select P.Codigo, P.Codigo_Venda, P.Descricao, P.Estoque, P.Estoque_Reservado, P.Tipo, P.Valor_Medio,');
      add('P.Volume, P.Valor_Compra, P.Codigo_Grupo_Tributacao, P.Codigo_Grupo_Tributacao_ISSQN from Produto P');
      open;
    end;

    TLog.Debug('Carregou dados do produto.');

    Pega_Endereco_Cliente;
    TLog.Debug('Carregou dados do endereço do cliente.');
    Cupom_Nominal;
    if (Cupom = 6) then
    begin

      if (qryendereco_clienteCPF_CNPJ.AsString = '') then
      begin
        Application.MessageBox('CPF ou CNPJ do cliente não cadastrado. Por favor, atualize seu cadastro. Logo após, atualize sua venda e tente novamente.', 'CPF/CNPJ inválido', MB_OK+MB_ICONHAND);
        abort;
      end;

      if (qryendereco_clienteNome.AsString = '') then
      begin
        Application.MessageBox('Nome do cliente não cadastrado. Por favor, atualize seu cadastro. Logo após, atualize sua venda e tente novamente.', 'Nome inválido', MB_OK+MB_ICONHAND);
        abort;
      end;

      if (qrycarrega_caixaTipo_Pagamento.AsString = 'A PRAZO') and (controla_credito_cliente = 0) then
      begin
        if not (Verifica_Credito_Cliente) then
          exit;
      end;

      TLog.Debug('Vai abrir cupom nominal.');
      if ( Length(qryendereco_clienteCPF_CNPJ.AsString) = 11) then
      begin
        Aux1:= Copy(qryendereco_clienteCPF_CNPJ.AsString, 1, 3);
        Aux2:= Copy(qryendereco_clienteCPF_CNPJ.AsString, 4, 3);
        Aux3:= Copy(qryendereco_clienteCPF_CNPJ.AsString, 7, 3);
        Aux4:= Copy(qryendereco_clienteCPF_CNPJ.AsString, 10, 2);

        CPF:= Aux1 + '.' + Aux2 + '.' + Aux3 + '-' + Aux4;
      end
      else if ( Length(qryendereco_clienteCPF_CNPJ.AsString) = 14) then
      begin
        Aux1:= Copy(qryendereco_clienteCPF_CNPJ.AsString, 1, 2);
        Aux2:= Copy(qryendereco_clienteCPF_CNPJ.AsString, 3, 3);
        Aux3:= Copy(qryendereco_clienteCPF_CNPJ.AsString, 6, 3);
        Aux4:= Copy(qryendereco_clienteCPF_CNPJ.AsString, 9, 4);
        Aux5:= Copy(qryendereco_clienteCPF_CNPJ.AsString, 13, 2);

        CPF:= Aux1 + '.' + Aux2 + '.' + Aux3 + '/' + Aux4 + '-' + Aux5;
      end;
      TLog.Debug('CPF formatado:'+CPF);

      ECF.Abrir_Cupom_Nominal(CPF, qryendereco_clienteNome.AsString, qryendereco_clienteTipo_Endereco.AsString + ' ' + qryendereco_clienteEndereco.AsString + ', ' + qryendereco_clienteNumero.AsString + ', BAIRRO ' + qryendereco_clienteSetor.AsString);
      TLog.Debug('Abriu cupom norminal.');
      nominal:= true;
    end
    else if (Cupom = 7) then
    begin

      if (qrycarrega_caixaTipo_Pagamento.AsString = 'A PRAZO') and (controla_credito_cliente = 0) then
      begin
        if not (Verifica_Credito_Cliente) then
          exit;
      end;

      ECF.Abrir_Cupom;
      TLog.Debug('Abriu cupom normal.');
      nominal:= false;
    end
    else
      abort;

    TLog.Debug('Vai preencher objeto Cliente com os dados do cliente.');
    oCli:= TClienteEntidade.Create;
    oCli.Codigo:= qrycarrega_caixaCodigo_Cliente.AsInteger;
    oCli.NomeFantasia:= qrycarrega_caixaNome_Nome_Fantasia.AsString;
    oCli.RazaoSocial:= qrycarrega_caixaNome_Nome_Fantasia.AsString;
    oCli.EnderecoTexto:= qryendereco_clienteEndereco.AsString;
    oCli.CPFCNPJ:= qryendereco_clienteCPF_CNPJ.AsString;

    TLog.Debug('Preencheu objeto Cliente com os dados do cliente.');
    while not qAux2.Eof do
    begin
      TLog.Debug('');
      TLog.Debug('DADOS DOS PRODUTOS:');
      qAux.Locate('Codigo', qAux2.FieldByName('Codigo_Produto').AsInteger, []);

      sCodigo    := StringOfChar('0', 12-Length(qAux2.FieldByName('Codigo_Venda').AsString)) + qAux2.FieldByName('Codigo_Venda').AsString;
      sCodigo    := Copy(sCodigo,1,12);
      TLog.Debug('Código do produto: '+sCodigo);
      sDescricao := Copy(qAux2.FieldByName('Descricao').AsString,1,29);
      TLog.Debug('Descrição do produto: '+sDescricao);
      TLog.Debug('Tipo do recolhimento: '+qAux2.FieldByName('Tipo_Recolhimento').AsString);

      if (qAux2.FieldByName('Tipo_Recolhimento').AsString = 'I') then
      begin
        sAliquota:= 'I1';
        aliquotacupom:= 'II';
      end
      else if (qAux2.FieldByName('Tipo_Recolhimento').AsString = 'NT') then
      begin
        sAliquota:= 'N1';
        aliquotacupom:= 'NN';
      end
      else if (qAux2.FieldByName('Tipo_Recolhimento').AsString = 'ST') then
      begin
        sAliquota:= 'F1';
        aliquotacupom:= 'FF';
      end
      else if (qAux2.FieldByName('Tipo_Recolhimento').AsString = 'TRIBUTADO') then
      begin
        sAliquota:= qAux2.FieldByName('ICMS').AsString;
        aliquotacupom:= StringReplace(saliquota, '0', '', [rfReplaceAll]);
      end
      else
      begin
        if (qAux2.FieldByName('ICMS').AsString = '0') then
        begin
          sAliquota:= 'F1';
          aliquotacupom:= 'FF';
        end
        else
        begin
          sAliquota:= qAux2.FieldByName('ICMS').AsString;
          aliquotacupom:= StringReplace(saliquota, '0', '', [rfReplaceAll]);
        end;
        //sAliquota:= qAux2.FieldByName('ICMS').AsString;
        //aliquotacupom:= StringReplace(saliquota, '0', '', [rfReplaceAll]);
      end;

      TLog.Debug('Aliquota do produto: '+sAliquota);
      TLog.Debug('Aliquota do cupom: '+aliquotacupom);
      sTipoQtde  := 'I';
      sQtde      := FormatFloat('#0.0,00', qAux2.FieldByName('Qtde').AsFloat);
      sQtde:= StringReplace(sQtde, ThousandSeparator, '', [rfReplaceAll]);
      TLog.Debug('Quantidade: '+sQtde);
      //sValor     := FormatFloat('#0.0,00', qAux2.FieldByName('Valor_Unitario').AsFloat);
      sValor     := FormatFloat('#0.0,00', qAux2.FieldByName('Valor_Original').AsFloat);
      sValor     := StringReplace(sValor, ThousandSeparator, '', [rfReplaceAll]);
      TLog.Debug('Valor: '+sValor);
      //if (qAux2.FieldByName('Tipo_Desc_Acr').AsString = '%') then
        //sTipo:= '%'
      //else
        sTipo:= '$';
      DescontoTotal:= (qAux2.FieldByName('Qtde').AsFloat * qAux2.FieldByName('Desc_Acr').AsFloat) - qAux2.FieldByName('Outras_Despesas').AsFloat;
      {sDesconto:= '0';
      sAcrecimo:= '0';
      if (qAux2.FieldByName('dOUa').AsString = 'D') then
      begin}
        sDesconto:= FormatFloat('#0.0,0', DescontoTotal);
        sDesconto:= StringReplace(sDesconto, ThousandSeparator, '', [rfReplaceAll]);
        //sDesconto:= FormatFloat('#0.0,0', qAux2.FieldByName('Desc_Acr').AsFloat * StrToFloat(sQtde));
        sAcrecimo:= '0';
        sdesc_acr:= sDesconto;
        dOUa:= 'D';
      {end
      else
      begin
        sAcrecimo:= FormatFloat('#0.0,0', qAux2.FieldByName('Desc_Acr').AsFloat);
        //sAcrecimo:= FormatFloat('#0.0,0', qAux2.FieldByName('Desc_Acr').AsFloat * StrToFloat(sQtde));
        sDesconto:= '0';
        sdesc_acr:= sAcrecimo;
        dOUa:= 'A';
      end;}
      //TLog.Debug('Acréscimo: '+sAcrecimo);
      TLog.Debug('Desconto: '+sDesconto);
      TLog.Debug('Variável sdesc_acr: '+sdesc_acr);
      TLog.Debug('dOUa: '+dOUa);

      unid_med:= qAux2.FieldByName('UN').AsString;
      TLog.Debug('Unidade de medida: '+unid_med);
      if (ECF.Vende_Item(scodigo, sdescricao, aliquotacupom, sqtde, svalor, sdesc_acr, sTipo, unid_med, dOUa)) then
      begin
        //CapturaContadoresECF;
        ECF.Pega_Contadores;
        ECF.Pega_Numero_Caixa;
        //Captura_Ultimo_Item;
        ECF.Pega_Ultimo_Item;
        Captura_Totalizador;

        R05.Alterar(R05);
        //R05.Alterar_Aux(R05);

        R05.Alterar_Item(R05);
        //R05.Alterar_Item_Aux(R05);

        {if (qryitens_venda.Locate('Codigo; Codigo_Produto', VarArrayOf([qrycarrega_caixaCodigo.AsInteger, qAux.FieldByName('Codigo').AsInteger]), [])) then
        begin
          TLog.Debug('Vai atualizar dados do N_Item');
          qryitens_venda.Edit;
          qryitens_vendaN_Item.AsString:= UDeclaracao.N_Item;
          qryitens_venda.Post;
          TLog.Debug('Atualizou dados do N_Item');
        end;}

        if (FrmCarrega_Pedido_Caixa.quero_cancelar = false) and (qAux2.FieldByName('Cancelado').AsString = 'N') and (gerar_estoque = 0) then
        begin
          if (qryitens_venda.Locate('Codigo; Codigo_Produto', VarArrayOf([qrycarrega_caixaCodigo.AsInteger, qAux.FieldByName('Codigo').AsInteger]), [])) then
          begin
            TLog.Debug('Vai atualizar dados da Qtde_Estoque_Atual');
            qryitens_venda.Edit;
            qryitens_vendaQtde_Estoque_Atual.AsFloat:= qAux.FieldByName('Estoque').AsFloat;
            qryitens_venda.Post;
            TLog.Debug('Atualizou dados da Qtde_Estoque_Atual');
          end;

          estoque:= qAux.FieldByName('Estoque').AsFloat - qAux2.FieldByName('Qtde_Entregue').AsFloat;
          estoque_reservado:= qAux.FieldByName('Estoque_Reservado').AsFloat + qAux2.FieldByName('Qtde_Restante').AsFloat;
          TLog.Debug('Estoque: '+FloatToStr(estoque));

          Atualiza_Saldo_Estoque(dm.ADOConnection1, qAux.FieldByName('Codigo').AsInteger, (qAux.FieldByName('Valor_Compra').AsFloat * estoque));


          TLog.Debug('Atualizou saldo do estoque.');
          Atualiza_Estoque(dm.ADOConnection1, estoque, qAux.FieldByName('Codigo').AsInteger);

        //**** ATUALIZAR MD5

                  //MD51
        AtualizaMD51(qryitens_vendaCodigo_Produto.asinteger, GeraMD5([qryitens_vendaCodigo_Venda.AsString,
                      qryitens_vendaDescricao.asstring,
                      FloatToStr(estoque)]));

          //*****///
         //Atualiza na tabela PAFQuantidadeRegistros
        //AtualizarQuantidadeRegistro('Produto','QtdeProduto');


          TLog.Debug('Atualizou estoque.');
          Atualiza_Volume(dm.ADOConnection1, estoque * qAux.FieldByName('Volume').AsFloat, qAux.FieldByName('Codigo').AsInteger);
          TLog.Debug('Atualizou volume.');
        end;


        aliquota:= Retorna_Aliquota_NCM(qAux2.FieldByName('NCM').AsString, qAux2.FieldByName('Origem').AsString, FrmCarrega_Pedido_Caixa.Conexao);
        valor_unitario:= qAux2.FieldByName('Valor_Unitario').AsFloat;
        TLog.Debug('Aliquota do NCM: '+FloatToStr(aliquota));
        TLog.Debug('Valor Unitário: '+FloatToStr(valor_unitario));

        valor_imposto_lei:= valor_imposto_lei + (valor_unitario * (aliquota / 100));
        valor_imposto_lei:= Calcula_Valor(FloatToStr(valor_imposto_lei));
        TLog.Debug('Valor Imposto Lei: '+FloatToStr(valor_imposto_lei));
        qAux2.Next;
      end;
    end;
  except on e:Exception do
  begin
    ShowMessage('Erro: '+e.Message);
    Cancela_Transacao;
    abort;
  end;

  end;

  Finaliza_Transacao;
  ECF.Pega_Grande_Total;
  AlteraGT(StrToFloat(UDeclaracao.GrandeTotal), nu_serie);
  Application.CreateForm(TFrmFechamento_Venda_PDV, FrmFechamento_Venda_PDV);
  Centraliza_Form(FrmFechamento_Venda_PDV);
  FrmFechamento_Venda_PDV.Show;
  //FrmFechamento_Venda_PDV.Free;
end;

procedure TFrmCarrega_Pedido_Caixa.Cabecalho_Comprovante_Compra;
var
  i: integer;
begin
  if (rs.Paginas = 0) then
    rs.BeginDoc;
  i:= 0;
  i2:= 136;
  linha:= 0;
  conta:= 0;

  //dav:= 'NÃO É DOCUMENTO FISCAL - NÃO É VÁLIDO COMO RECIBO E COMO GARANTIA DE MERCADORIA - ';
  //dav2:= 'NÃO COMPROVA PAGAMENTO';
  tipo_rel:= 'COMPROVANTE DE COMPRA';


  inc(linha);
  rs.WriteFont(linha, Alinha_Centro(tipo_rel,i2),tipo_rel, [Bold] + [DobleWide]);
  //inc(linha);
  //rs.WriteFont(linha, Alinha_Centro(dav,i2), dav, [Bold] + [DobleWide]);
  //inc(linha);
  //rs.WriteFont(linha, Alinha_Centro(dav2,i2), dav2, [Bold] + [DobleWide]);

  inc(linha);
  for i := 0 to i2 do
    rs.Write(linha,i,'-');

  cn:= Copy(cnpj,1,2)+'.'+Copy(cnpj,3,3)+'.'+Copy(cnpj,6,3)+'/'+
    Copy(cnpj,9,4)+'-'+Copy(cnpj,13,2);

  cp:= Copy(qrycarrega_caixaCPF.AsString,1,3)+'.'+Copy(qrycarrega_caixaCPF.AsString,4,3)+'.'+Copy(qrycarrega_caixaCPF.AsString,7,3)+'-'+
    Copy(qrycarrega_caixaCPF.AsString,10,2);

  inc(linha);
  rs.Write(linha,0, 'Empresa');
  rs.Write(linha,50, 'CNPJ');
  inc(linha);
  rs.Write(linha,0, nome_fantasia);
  rs.Write(linha,50, cn);

  inc(linha);
  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha,i,'-');

  inc(linha);
  rs.Write(linha,0, 'Destinatário');
  rs.Write(linha,50, 'CPF/CNPJ');
  inc(linha);
  rs.Write(linha,0, qrycarrega_caixaNome_Nome_Fantasia.AsString);
  rs.Write(linha,50, cp);

  inc(linha);
  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha,i, '-');

  inc(linha);
  rs.Write(linha,0, 'Número do Documento: ' + qrycarrega_caixaN_Pedido.AsString);
  rs.Write(linha, 40, 'Número do Documento Fiscal: ' + UDeclaracao.coo);
  rs.Write(linha, 80, 'Página Nº: ' + IntToStr(rs.PageNo));
  rs.Write(linha, 100, 'Data: ' + DateToStr(Date));

  inc(linha);
  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha,i, '-');

  linha:= linha + 2;
  rs.WriteFont(linha,0,'Produtos', [Underline]);
  linha:= linha + 2;
  rs.WriteFont(linha,0,'Código Produto', [Underline]);
  rs.WriteFont(linha, 16, 'Descrição', [Underline]);
  rs.WriteFont(linha, 56, 'Un.', [Underline]);
  rs.WriteFont(linha, 65, 'Qtde.', [Underline]);
  rs.WriteFont(linha, 75, 'Valor Un.', [Underline]);
  rs.WriteFont(linha, 90, 'Valor Total', [Underline]);
  rs.WriteFont(linha, 105, 'Marca', [Underline]);
  linha:= linha + 2;
end;

procedure TFrmCarrega_Pedido_Caixa.Comprovante_Compra;
var
  i: integer;
begin
  Cabecalho_Comprovante_Compra;
  i:= 0;

  Atualiza_Dados;
  qryitens_venda.First;

  while not qryitens_venda.Eof do
  begin
    rs.Write(linha, 0, qryitens_vendaCodigo_Venda.AsString);
    rs.Write(linha, 16, qryitens_vendaDescricao.AsString);
    rs.Write(linha, 56, qryitens_vendaUN.AsString);
    rs.Write(linha, 65, FormatFloat('#0.0,0', qryitens_vendaQtde.AsFloat));
    rs.Write(linha, 75, FormatFloat('#0.0,0', qryitens_vendaValor_Unitario.AsFloat));
    rs.Write(linha, 90, FormatFloat('#0.0,0', qryitens_vendaSub_Total.AsFloat));
    rs.Write(linha, 105, qryitens_vendaMarca.AsString);
    Inc(linha);

    if (linha = rs.Lines) then
    begin
      rs.NewPage;
      Cabecalho_Comprovante_Compra;
    end;

    qryitens_venda.Next;
  end;

  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha + 1,i, '-');

  if (linha <= rs.Lines - 3) then
  begin
    i:= 1;
    rs.Write(linha + 2, i, 'Cond. Pag.........: ' + qrycarrega_caixaCP.AsString);
    rs.WriteFont(linha + 3, i, 'Total Pedido......: ' + qrycarrega_caixaTotal_Pedido.AsString, [Bold]);
    linha:= linha + 3;
  end
  else
  begin
    rs.NewPage;
    linha:= 1;
    i:= 1;
    rs.Write(linha, i, 'Cond. Pag.........: ' + qrycarrega_caixaCP.AsString);
    rs.WriteFont(linha + 1, i, 'Total Pedido......: ' + FormatFloat('#0.0,0', qrycarrega_caixaTotal_Pedido.AsFloat), [Bold]);
  end;

  rodape:= 'É vedada a autenticação deste documento';

  if (linha <= rs.Lines - 1) then
    rs.Write(linha + 7,Alinha_Centro(rodape, i2), rodape)
  else
  begin
    rs.NewPage;
    linha:= 1;
    rs.Write(linha,Alinha_Centro(rodape, i2), rodape)
  end;
  rs.Print;
  rs.EndDoc;
end;

procedure TFrmCarrega_Pedido_Caixa.BBtnCancelar_CupomClick(Sender: TObject);
begin
  Application.CreateForm(TFrmInforma_Cupom, FrmInforma_Cupom);
  FrmInforma_Cupom.ShowModal;
  FrmInforma_Cupom.Free;
end;

procedure TFrmCarrega_Pedido_Caixa.Atualiza_Dados;
begin
  with qryitens_venda, sql do
  begin
    close;
    clear;
    add('select IP.*, M.Descricao as Marca from Itens_Pedido IP');
    add('left join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
    add('where IP.Codigo = :Codigo and IP.Cancelado = :N order by IP.Descricao');
    Parameters.ParamByName('Codigo').Value:= qrycarrega_caixaCodigo.AsInteger;
    Parameters.ParamByName('N').Value:= 'N';
    open;
  end;
end;

procedure TFrmCarrega_Pedido_Caixa.BBtnCancela_Pre_VendaClick(Sender: TObject);
var
  //qAux, qAux2: TADOQuery;
  sCodigo, sDescricao, saliquota, sTipoQtde, sQtde, sValor, sTipo, sDesconto, tipo_desc, valor_desc, unid_med,
  sAcrecimo, cAcreDesc, cTipoAcreDesc, cValorAcreDesc: AnsiString;
  iConta: integer;
  estoque: double;
begin
 { Verifica_Permissao;
  if (FrmMenu_Geral.ValidaGT = true) then
    Habilitado := true
  else
  begin
    Habilitado := false;
    abort;
  end;

  if (FrmMenu_Geral.ValidaSN = true) then
    Habilitado := true
  else
  begin
    Habilitado := false;
    abort;
  end; }

  if Confirma_Cancalamento_Cupom then
  begin
    Cancela_Pre_Venda(qrycarrega_caixaCodigo.AsInteger);
    //Mensagem_Cupom_Cancelado;
    //quero_cancelar:= true;
    {qAux:= TADOQuery.Create(self);
    qAux2:= TADOQuery.Create(self);

    with qAux2, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select Ped.Codigo, Ped.N_Pre_Venda, IP.*, P.Codigo_Venda, P.Descricao, P.Tipo from Itens_Pedido IP');
      add('inner join Pedido Ped on (IP.Codigo = Ped.Codigo)');
      add('inner join Produto P on (IP.Codigo_Produto = P.Codigo)');
      add('where Ped.Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= qrycarrega_caixaCodigo.AsString;
      //Parameters.ParamByName('N').Value:= 'N';
      //Parameters.ParamByName('Tipo').Value:= 0;
      open;
    end;

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select P.Codigo, P.Codigo_Venda, P.Descricao, P.Estoque, P.Tipo,');
      add('P.Volume, P.Tipo_Tributacao, P.Codigo_Grupo_Tributacao, P.Codigo_Grupo_Tributacao_ISSQN from Produto P');
      open;
    end;

    iRetorno:= Bematech_FI_AbreCupom('');
    Analisa_iRetorno;

    while not qAux2.Eof do
    begin
      qAux.Locate('Codigo', qAux2.FieldByName('Codigo_Produto').AsInteger, []);
      //Pega_ICMS_NC(qAux.FieldByName('Codigo_Grupo_Tributacao').AsInteger);
      //Pega_ISS(qAux.FieldByName('Codigo_Grupo_Tributacao_ISSQN').AsInteger);

      sCodigo    := qAux.FieldByName('Codigo_Venda').AsString;
      sDescricao := Copy(qAux.FieldByName('Descricao').AsString,1,29);

      if (qAux2.FieldByName('ICMS').AsString = 'I') then
        sAliquota:= 'I1'
      else if (qAux2.FieldByName('ICMS').AsString = 'N') then
        sAliquota:= 'N1'
      else if (qAux2.FieldByName('ICMS').AsString = 'F') then
        sAliquota:= 'F1'
      else
        sAliquota:= qAux2.FieldByName('ICMS').AsString;

      sTipoQtde  := 'I';
      sQtde      := FormatFloat('#0.0,00', qAux2.FieldByName('Qtde').AsFloat);
      sValor     := FormatFloat('#0.0,00', qAux2.FieldByName('Valor_Unitario').AsFloat);

      if (qAux2.FieldByName('Tipo_Desconto').AsString = '%') then
        sTipo:= '%'
      else
        sTipo:= '$';

      sDesconto  := FormatFloat('#0.0,0', qAux2.FieldByName('Desconto').AsFloat);
      sAcrecimo  := FormatFloat('#0.0,0', qAux2.FieldByName('Acrecimo').AsFloat);
      unid_med:= qAux2.FieldByName('UN').AsString;

      iRetorno:= Bematech_FI_VendeItemDepartamento(PAnsiChar(scodigo), PAnsiChar(sdescricao),
                                                   PAnsiChar(saliquota), PAnsiChar(svalor),
                                                   PAnsiChar(sqtde), PAnsiChar(sAcrecimo),
                                                   PAnsiChar(sdesconto), PAnsiChar('00'), PAnsiChar(unid_med));
      Analisa_iRetorno;

      if (iRetorno = 1) then
      begin
        CapturaContadoresECF;
        Captura_Numero_Caixa;
        Captura_Ultimo_Item;
        Captura_Totalizador;

        R05.Alterar(R05);
        R05.Alterar_Item(R05);
        Itens_Pedido.Atualiza_Itens(Itens_Pedido);

        if (qAux2.FieldByName('Cancelado').AsString = 'S') then
        begin
          iRetorno:= Bematech_FI_CancelaItemAnterior;
          Analisa_iRetorno;
        end;
      end;

      qAux2.Next;
    end;

      cTipoAcreDesc:= '$';
      cAcreDesc:= 'D';
      cValorAcreDesc:= '0,00';
      iRetorno:= Bematech_FI_IniciaFechamentoCupom(PAnsiChar(cAcreDesc), PAnsiChar(cTipoAcreDesc), PAnsiChar(cValorAcreDesc));
      Analisa_iRetorno;

      iRetorno:= Bematech_FI_TerminaFechamentoCupom(#13+#10 + 'MD5 - ' + pMD5_Arquivos +
                                                    #13+#10 + 'PV - ' + qrycarrega_caixaN_Pre_Venda.AsString);
      if (iRetorno = 1) then
      begin
        den_op:= 'RV';
        Coleta_Dados_R06;
        R06.Inserir_Outros(R06);
      end;

      iRetorno:= Bematech_FI_CancelaCupom;
      AlteraGT;

      Atualiza_R04(qrycarrega_caixaCodigo.AsInteger);
      Atualiza_Status_Pedido(qrycarrega_caixaCodigo.AsInteger);

      qrycarrega_caixa.Close;
      qrycarrega_caixa.Open;
      Processo_Concluido;  }
  end;
end;

procedure TFrmCarrega_Pedido_Caixa.Chama_Dados;
begin
  {if (gera_os = '0101') and (gera_pre_venda = '0101') then
  begin
    with qrycarrega_caixa, sql do
    begin
      close;
      clear;
      add('select P.Codigo, P.N_Pedido, P.N_Pre_Venda, P.Data_Venda, P.Total_Pedido, P.Tipo, P.DAVC, P.Tipo_Desc_Acr, P.Desc_Acr, P.Total_Produtos,');
      add('P.Total_Servicos, C.Codigo as Codigo_Cliente, C.Nome_Nome_Fantasia, C.CPF, C.Endereco, C.Numero, CP.Descricao as CP, CP.Tipo_Pagamento from Pedido P');
      add('inner join Cliente C on (C.Codigo = P.Codigo_Cliente)');
      //add('left join Logradouro Log on (Log.Codigo = C.Codigo_Logradouro)');
      add('left join Condicao_Pagamento CP on (CP.Codigo = P.Codigo_Forma_Pag)');

      add('where P.Status_OS = :Status_OS and P.Status = :Parametro and (P.Tipo = :Tipo or P.Tipo = :Tipo2 or P.Tipo = :Tipo3)');
      case (RGOrdena.ItemIndex) of
        0: add('order by P.N_Pedido desc');
        1: add('order by C.Nome_Nome_Fantasia');
        2: add('order by P.Data_Venda desc');
      end;
      Parameters.ParamByName('Status_OS').Value:= 'FECHADO';
      Parameters.ParamByName('Parametro').Value:= 'PENDENTE';
      Parameters.ParamByName('Tipo').Value:= 'PRÉ-VENDA';
      Parameters.ParamByName('Tipo2').Value:= 'DAV-OS';
      Parameters.ParamByName('Tipo3').Value:= 'DAV';
      open;
    end;
  end
  else if (gera_os = '0101') then
  begin
    with qrycarrega_caixa, sql do
    begin
      close;
      clear;
      add('select P.Codigo, P.N_Pedido, P.N_Pre_Venda, P.Data_Venda, P.Total_Pedido, P.Tipo, P.DAVC, P.Tipo_Desc_Acr, P.Desc_Acr, P.Total_Produtos,');
      add('P.Total_Servicos, C.Codigo as Codigo_Cliente, C.Nome_Nome_Fantasia, C.CPF, C.Endereco, C.Numero, CP.Descricao as CP, CP.Tipo_Pagamento from Pedido P');
      add('inner join Cliente C on (C.Codigo = P.Codigo_Cliente)');
      //add('left join Logradouro Log on (Log.Codigo = C.Codigo_Logradouro)');
      add('left join Condicao_Pagamento CP on (CP.Codigo = P.Codigo_Forma_Pag)');
      add('where P.Status_OS = :Status_OS and P.Status = :Parametro and P.Tipo = :Tipo');
      case (RGOrdena.ItemIndex) of
        0: add('order by P.N_Pedido desc');
        1: add('order by C.Nome_Nome_Fantasia');
        2: add('order by P.Data_Venda desc');
      end;
      Parameters.ParamByName('Status_OS').Value:= 'FECHADO';
      Parameters.ParamByName('Parametro').Value:= 'PENDENTE';
      Parameters.ParamByName('Tipo').Value:= 'DAV-OS';
      open;
    end;
  end
  else if (gera_pre_venda = '0101') then
  begin
    with qrycarrega_caixa, sql do
    begin
      close;
      clear;
      add('select P.Codigo, P.N_Pedido, P.N_Pre_Venda, P.Data_Venda, P.Total_Pedido, P.Tipo, P.DAVC, P.Tipo_Desc_Acr, P.Desc_Acr, P.Total_Produtos,');
      add('P.Total_Servicos, C.Codigo as Codigo_Cliente, C.Nome_Nome_Fantasia, C.CPF, C.Endereco, C.Numero, CP.Descricao as CP, CP.Tipo_Pagamento from Pedido P');
      add('inner join Cliente C on (C.Codigo = P.Codigo_Cliente)');
      //add('left join Logradouro Log on (Log.Codigo = C.Codigo_Logradouro)');
      add('left join Condicao_Pagamento CP on (CP.Codigo = P.Codigo_Forma_Pag)');
      add('where P.Status = :Parametro and P.Tipo = :Tipo');
      case (RGOrdena.ItemIndex) of
        0: add('order by P.N_Pedido desc');
        1: add('order by C.Nome_Nome_Fantasia');
        2: add('order by P.Data_Venda desc');
      end;
      Parameters.ParamByName('Parametro').Value:= 'PENDENTE';
      Parameters.ParamByName('Tipo').Value:= 'PRÉ-VENDA';
      open;
    end;
  end
  else
  begin
    with qrycarrega_caixa, sql do
    begin
      close;
      clear;
      add('select P.Codigo, P.N_Pedido, P.N_Pre_Venda, P.Data_Venda, P.Total_Pedido, P.Tipo, P.DAVC, P.Tipo_Desc_Acr, P.Desc_Acr, P.Total_Produtos,');
      add('P.Total_Servicos, C.Codigo as Codigo_Cliente, C.Nome_Nome_Fantasia, C.CPF, C.Endereco, C.Numero, CP.Descricao as CP, CP.Tipo_Pagamento from Pedido P');
      add('inner join Cliente C on (C.Codigo = P.Codigo_Cliente)');
      //add('left join Logradouro Log on (Log.Codigo = C.Codigo_Logradouro)');
      add('left join Condicao_Pagamento CP on (CP.Codigo = P.Codigo_Forma_Pag)');
      add('where P.Status = :Parametro and P.Tipo = :Tipo');
      case (RGOrdena.ItemIndex) of
        0: add('order by P.N_Pedido desc');
        1: add('order by C.Nome_Nome_Fantasia');
        2: add('order by P.Data_Venda desc');
      end;
      Parameters.ParamByName('Parametro').Value:= 'PENDENTE';
      Parameters.ParamByName('Tipo').Value:= 'PRÉ-VENDA';
      open;
    end;
  end; }
  if (gera_os = '0101') then
  begin
    with qrycarrega_caixa, sql do
    begin
      close;
      clear;
      add('select P.Codigo, P.N_Pedido, P.N_Pre_Venda, P.Data_Venda, P.Total_Pedido, P.Tipo, P.DAVC, P.Tipo_Desc_Acr, P.Desc_Acr, P.Total_Produtos,');
      add('P.Total_Servicos, C.Codigo as Codigo_Cliente, C.Nome_Nome_Fantasia, C.CPF, C.Endereco, C.Numero, CP.Descricao as CP, CP.Tipo_Pagamento from Pedido P');
      add('inner join Cliente C on (C.Codigo = P.Codigo_Cliente)');
      //add('left join Logradouro Log on (Log.Codigo = C.Codigo_Logradouro)');
      add('left join Condicao_Pagamento CP on (CP.Codigo = P.Codigo_Forma_Pag)');
      add('where P.Status = :Parametro and P.Tipo = :Tipo1 and P.Mesclada = :Mesclada');
      case (RGOrdena.ItemIndex) of
        0: add('order by P.N_Pedido desc');
        1: add('order by C.Nome_Nome_Fantasia');
        2: add('order by P.Data_Venda desc');
      end;
      //Parameters.ParamByName('Status_OS').Value:= 'FECHADO';
      Parameters.ParamByName('Parametro').Value:= 'PENDENTE';
      Parameters.ParamByName('Tipo1').Value:= 'DAV-OS';
      Parameters.ParamByName('Mesclada').Value:= 0;
      open;
    end;
  end
  else
  begin
    with qrycarrega_caixa, sql do
    begin
      close;
      clear;
      add('select P.Codigo, P.N_Pedido, P.N_Pre_Venda, P.Data_Venda, P.Total_Pedido, P.Tipo, P.DAVC, P.Tipo_Desc_Acr, P.Desc_Acr, P.Total_Produtos,');
      add('P.Total_Servicos, C.Codigo as Codigo_Cliente, C.Nome_Nome_Fantasia, C.CPF, C.Endereco, C.Numero, CP.Descricao as CP, CP.Tipo_Pagamento from Pedido P');
      add('inner join Cliente C on (C.Codigo = P.Codigo_Cliente)');
      //add('left join Logradouro Log on (Log.Codigo = C.Codigo_Logradouro)');
      add('left join Condicao_Pagamento CP on (CP.Codigo = P.Codigo_Forma_Pag)');
      add('where P.Status = :Parametro and P.Tipo = :Tipo1 and P.Mesclada = :Mesclada');
      case (RGOrdena.ItemIndex) of
        0: add('order by P.N_Pedido desc');
        1: add('order by C.Nome_Nome_Fantasia');
        2: add('order by P.Data_Venda desc');
      end;
      Parameters.ParamByName('Parametro').Value:= 'PENDENTE';
      Parameters.ParamByName('Tipo1').Value:= 'DAV';
      Parameters.ParamByName('Mesclada').Value:= 0;
      open;
    end;
  end;

end;

procedure TFrmCarrega_Pedido_Caixa.BBtnCarregar_PedidoClick(Sender: TObject);
begin
  Chama_Dados;
  BBtnBaixar_Pedido.Enabled:= true;
  //BBtnDevolve_Pedido.Enabled:= true;
  BBtnLimpar.Enabled:= true;
  BBtnCarregar_Pedido.Enabled:= false;
  //BBtnVoltar_Pedido.Enabled:= true;
  BBtnCancela_Pre_Venda.Enabled:= true;
end;

procedure TFrmCarrega_Pedido_Caixa.BBtnDevolve_PedidoClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  Verifica_Permissao;

  if Confirma_Devolucao = true then
  begin
    try
      qAux:= TADOQuery.Create(self);
      try
        with qAux, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('update Pedido set Status = :Status');
          add('where N_Pedido = :Pedido');
          Parameters.ParamByName('Status').Value:= 'PENDENTE';
          Parameters.ParamByName('Pedido').Value:= qrycarrega_caixaN_Pedido.AsString;
          ExecSQL;
        end;
      except
        Nao_Selecionado;
        abort;
      end;
    finally
      BBtnCarregar_Pedido.Click;
      FreeAndNil(qAux);
    end;
  end;
end;

end.
