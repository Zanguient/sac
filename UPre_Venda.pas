unit UPre_Venda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls, Provider, DBClient, RSPrint, Buttons, StrUtils;

type
  TFrmPre_Venda = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ImgImagens_Comandos: TImageList;
    EdtCodigo: TEdit;
    MEdtData_Venda: TMaskEdit;
    LblData_Cadastro: TLabel;
    LblNome: TLabel;
    EdtCodigo_Cliente: TEdit;
    EdtCliente: TEdit;
    Label2: TLabel;
    MEdtData_Previsao_Entrega: TMaskEdit;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    EdtCodigo_Produto: TEdit;
    EdtProduto: TEdit;
    Label6: TLabel;
    EdtUnidade: TEdit;
    Label7: TLabel;
    EdtQuantidade: TEdit;
    Label8: TLabel;
    EdtValor_Unitario: TEdit;
    Label9: TLabel;
    EdtValor_Total: TEdit;
    Label11: TLabel;
    EdtN_Pedido: TEdit;
    MEdtHora_Entrega: TMaskEdit;
    Label12: TLabel;
    Edit2: TEdit;
    EdtQuantidade_Itens: TEdit;
    EdtTotal_Produtos: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    EdtLimite_Compra: TEdit;
    Edit6: TEdit;
    EdtLimite_Compra_Disponivel: TEdit;
    EdtPeso_Total: TEdit;
    Edit7: TEdit;
    EdtDesconto: TEdit;
    Edit8: TEdit;
    Edit5: TEdit;
    EdtTotal_Pedido: TEdit;
    TlbFerramentas: TToolBar;
    BBtnOrcamento: TToolButton;
    BBtnFechar: TToolButton;
    BalloonHint1: TBalloonHint;
    LblProduto: TLabel;
    Edit1: TEdit;
    EdtLimite_Desconto: TEdit;
    Edit10: TEdit;
    EdtLimite_Desconto_Disponivel: TEdit;
    qAux: TADOQuery;
    qAux2: TADOQuery;
    Label13: TLabel;
    EdtDesconto_Item: TEdit;
    rs: TRSPrinter;
    LblCPF: TLabel;
    LblEndereco: TLabel;
    LblSetor: TLabel;
    LblTelefone: TLabel;
    LblCidade: TLabel;
    LblUF: TLabel;
    LblTipo_Logradouro: TLabel;
    LblNumero: TLabel;
    BBtnCopiar_Pedido: TToolButton;
    ds_itens_venda: TDataSource;
    qryitens_venda: TADOQuery;
    qryvenda: TADOQuery;
    qryvendaCodigo: TAutoIncField;
    qryvendaN_Pedido: TStringField;
    qryvendaCOO: TStringField;
    qryvendaCOO_Vin: TStringField;
    qryvendaCodigo_Cliente: TIntegerField;
    qryvendaCodigo_Condicao_Pagamento: TIntegerField;
    qryvendaCodigo_Empresa: TIntegerField;
    qryvendaOutras_Despesas: TFloatField;
    qryvendaTipo_Frete: TStringField;
    qryvendaValor_Frete: TFloatField;
    qryvendaData_Venda: TDateTimeField;
    qryvendaData_Previsao_Entrega: TDateTimeField;
    qryvendaHora_Entrega: TStringField;
    qryvendaQtde_Itens: TIntegerField;
    qryvendaTotal_Produtos: TFloatField;
    qryvendaPeso_Total: TFloatField;
    qryvendaDesconto: TFloatField;
    qryvendaTipo_Desconto: TStringField;
    qryvendaTotal_Pedido: TFloatField;
    qryvendaTipo: TStringField;
    qryvendaStatus: TStringField;
    qryvendaValor_Recebido: TFloatField;
    qryvendaTroco: TFloatField;
    qryvendaObservacoes: TStringField;
    qryvendaNome_Nome_Fantasia: TStringField;
    qryvendaCPF: TStringField;
    qryvendaDescricao: TStringField;
    DataSource1: TDataSource;
    qryitens_os: TADOQuery;
    qryitens_osCodigo_Servico: TIntegerField;
    qryitens_osValor_Unitario: TFloatField;
    qryitens_osDesconto: TFloatField;
    qryitens_osTipo_Desconto: TStringField;
    qryitens_osSub_Total: TFloatField;
    qryitens_osCodigo_Venda: TStringField;
    qryitens_osDescricao: TStringField;
    qryvendaCCF: TStringField;
    qryvendaCodigo_Veiculo: TIntegerField;
    qryvendaTotal_Servicos: TFloatField;
    qryvendaQtde_Servicos: TIntegerField;
    qryvendaAcrecimo: TFloatField;
    qryvendaTipo_Acrecimo: TStringField;
    Label14: TLabel;
    EdtAcrecimo: TEdit;
    EdtST: TEdit;
    Label16: TLabel;
    qAux3: TADOQuery;
    EdtAcrecimo_Total: TEdit;
    Edit11: TEdit;
    EdtTotal_Acrecimo: TEdit;
    Edit13: TEdit;
    Edit9: TEdit;
    EdtTotal_Desconto: TEdit;
    qryvendaTotal_Desconto: TFloatField;
    qryvendaTotal_Acrecimo: TFloatField;
    qryitens_osCodigo: TIntegerField;
    LblBase_Reducao: TLabel;
    LblBase_Acrescida_IPI: TLabel;
    LblIPI: TLabel;
    LblCST_IPI: TLabel;
    LblBC_IPI: TLabel;
    LblPIS: TLabel;
    LblCST_PIS: TLabel;
    LblBase_Reduzida_PIS: TLabel;
    LblBase_Acrescida_PIS: TLabel;
    LblBC_PIS: TLabel;
    LblCOFINS: TLabel;
    LblCST_COFINS: TLabel;
    LblBase_Reduzida_COFINS: TLabel;
    LblBase_Acrescida_COFINS: TLabel;
    LblBC_COFINS: TLabel;
    LblICMS: TLabel;
    LblCST: TLabel;
    LblBase_Reduzida: TLabel;
    LblBase_Acrescida: TLabel;
    LblBC: TLabel;
    LblBase_Reduzida_IPI: TLabel;
    qryitens_vendaCodigo: TIntegerField;
    qryitens_vendaN_Item: TStringField;
    qryitens_vendaCodigo_Produto: TIntegerField;
    qryitens_vendaUN: TStringField;
    qryitens_vendaICMS: TStringField;
    qryitens_vendaCST: TStringField;
    qryitens_vendaBase_Reduzida: TStringField;
    qryitens_vendaBase_Acrescida: TStringField;
    qryitens_vendaBC: TStringField;
    qryitens_vendaIPI: TStringField;
    qryitens_vendaCST_IPI: TStringField;
    qryitens_vendaBase_Reduzida_IPI: TStringField;
    qryitens_vendaBase_Acrescida_IPI: TStringField;
    qryitens_vendaBC_IPI: TStringField;
    qryitens_vendaPIS: TStringField;
    qryitens_vendaCST_PIS: TStringField;
    qryitens_vendaBase_Reduzida_PIS: TStringField;
    qryitens_vendaBase_Acrescida_PIS: TStringField;
    qryitens_vendaBC_PIS: TStringField;
    qryitens_vendaCOFINS: TStringField;
    qryitens_vendaCST_COFINS: TStringField;
    qryitens_vendaBase_Reduzida_COFINS: TStringField;
    qryitens_vendaBase_Acrescida_COFINS: TStringField;
    qryitens_vendaBC_COFINS: TStringField;
    qryitens_vendaQtde: TFloatField;
    qryitens_vendaQtde_Entregue: TFloatField;
    qryitens_vendaQtde_Restante: TFloatField;
    qryitens_vendaValor_Unitario: TFloatField;
    qryitens_vendaDesconto: TFloatField;
    qryitens_vendaTipo_Desconto: TStringField;
    qryitens_vendaAcrecimo: TFloatField;
    qryitens_vendaTipo_Acrecimo: TStringField;
    qryitens_vendaSub_Total: TFloatField;
    qryitens_vendaCancelado: TStringField;
    qryitens_vendaCodigo_Venda: TStringField;
    qryitens_vendaDescricao: TStringField;
    LblValor_ICMS: TLabel;
    LblValor_COFINS: TLabel;
    LblValor_PIS: TLabel;
    LblValor_IPI: TLabel;
    LblSub_Total_Liquido: TLabel;
    LblTipo: TLabel;
    CBVerifica: TCheckBox;
    procedure BBtnOrcamentoClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtData_VendaEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Escreve_Texto;
    procedure MEdtData_Previsao_EntregaEnter(Sender: TObject);
    procedure MEdtHora_EntregaEnter(Sender: TObject);
    procedure EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Condicao_PagamentoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtValor_TotalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Limpa_Menor;
    procedure Calcula_Total;
    procedure Calcula_Total_Deletado;
    procedure EdtValor_TotalEnter(Sender: TObject);
    procedure EdtValor_UnitarioExit(Sender: TObject);
    procedure EdtQuantidadeExit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Atualiza_Dados;
    function Chama_Pedido: boolean;
    procedure Ver_Pedido;
    procedure EdtN_PedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtDesconto_ItemExit(Sender: TObject);
    procedure DAV_Modelo_1;
    procedure DAV_Modelo_2;
    procedure Button1Click(Sender: TObject);
    procedure BBtnCopiar_PedidoClick(Sender: TObject);
    procedure EdtAcrecimoExit(Sender: TObject);
    procedure EdtAcrecimoEnter(Sender: TObject);
    procedure EdtDesconto_ItemEnter(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtTotal_PedidoEnter(Sender: TObject);
    procedure EdtAcrecimo_TotalExit(Sender: TObject);
    procedure EdtDescontoExit(Sender: TObject);
    procedure EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_UnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDesconto_ItemKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAcrecimoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_TotalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_TotalExit(Sender: TObject);
  private
    pode: boolean;
    Pedido: URegistro.TPedido;
    Itens_Pedido: URegistro.TItens_Pedido;
    Itens_OS: URegistro.TItens_OS;
    Util: TUtil;
    qtde_itens, qtde_servicos: integer;
    R05: URegistro.TR05;
    pode_fechar: boolean;
    procedure Colega_Dados_R05;
    procedure Atualiza_Itens;
    procedure Verifica_Produto_Lancado;
    procedure Calcula_Imposto;
    procedure Limpa_Labels;
    procedure Verifica_Permissao;
  public
    ativo, achei, iniciado: boolean;
    acre_item, indicador_cancelamento_item, casa_decimal_qtde, casa_decimal_val_un, cod_pro, desc_item,
    descri, IAT, IPPT, qtde_vendida, qtde_cancelada, unid, valor_cancelado, can_acre, valor_total_item,
    valor_unit, descricao_servico: AnsiString;
    cod_servico, cod_produto: integer;
    var_uni, novo_valor_uni, total_limite, total_valor_uni, perc_desc: double;
    mescla: boolean;
  protected
    function Confira_Pedido: boolean;
    function Confira_Itens_Pedido: boolean;
  end;

var
  FrmPre_Venda: TFrmPre_Venda;
implementation

uses UDM, UChama_Produto, UChama_Cliente, UChama_Condicao_Pagamento,
  UDeclaracao, UChama_Pedido, UChama_Servico, UChama_Veiculo, UMenu_Geral,
  UMescla_Venda, UEscolha_Tabela_Preco, UInforma_Forma_Pagamento_Pre_Venda;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmPre_Venda.Atualiza_Dados;
begin
  with qryitens_venda, sql do
  begin
    close;
    clear;
    add('select IP.*, P.Codigo_Venda, P.Descricao from Itens_Pedido IP');
    add('inner join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('where IP.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= EdtCodigo.Text;
    open;
  end;
end;

procedure TFrmPre_Venda.BBtnCancelarClick(Sender: TObject);
begin
  //Itens_Pedido.Excluir(Itens_Pedido);
  //Itens_OS.Excluir(Itens_OS);
  R05.Excluir(R05);
  qryitens_venda.Close;
  Util.Limpa_Campos(FrmPre_Venda);
  Escreve_Texto;
  Util.Desabilita_Campos(FrmPre_Venda);
  BBtnOrcamento.Enabled:= false;
  BBtnCopiar_Pedido.Enabled:= false;
end;

procedure TFrmPre_Venda.BBtnCopiar_PedidoClick(Sender: TObject);
begin
  Application.CreateForm(TFrmMescla_Venda, FrmMescla_Venda);
  FrmMescla_Venda.ShowModal;
  FrmMescla_Venda.Free;

  {Application.CreateForm(TFrmChama_Pedido, FrmChama_Pedido);
  FrmChama_Pedido.ShowModal;
  FrmChama_Pedido.Free;}
end;

procedure TFrmPre_Venda.BBtnExcluirClick(Sender: TObject);
begin
  //Pedido.Excluir(Pedido);
  //Itens_Pedido.Excluir(Itens_Pedido);
  BBtnOrcamento.Enabled:= false;
  BBtnCopiar_Pedido.Enabled:= false;
  Util.Desabilita_Campos(FrmPre_Venda);
end;

procedure TFrmPre_Venda.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmPre_Venda.BBtnOrcamentoClick(Sender: TObject);
begin
  tipo_venda:= 'PRÉ-VENDA';
  if (achei = false) then
    begin
      if (Confira_Pedido = true) then
      begin
        Application.CreateForm(TFrmInforma_Forma_Pagamento_Pre_Venda, FrmInforma_Forma_Pagamento_Pre_Venda);
        FrmInforma_Forma_Pagamento_Pre_Venda.ShowModal;
        FrmInforma_Forma_Pagamento_Pre_Venda.Free;

        //Pedido.Salva_Banco(Pedido);
        Pedido_Gerado;
        UDeclaracao.Insere_Historico(usuario, 'REALIZOU REGISTRO DE PRÉ-VENDA ' + EdtN_Pedido.Text + '.', TimeToStr(time), insercao, date);
      end
      else
        exit;
    end
    else
    begin
      if (Confira_Pedido = true) then
        //Pedido.Alterar(Pedido)
      else
        exit;
    end;
    codigo_tabela_preco_ativo:= codigo_tabela_preco_padrao;
    Inicializa_Dados_Principais_Movimentacao(0, dm.qrychama_produto);
    BBtnOrcamento.Enabled:= false;
    BBtnCopiar_Pedido.Enabled:= false;
    pode_fechar:= true;
    iniciado:= false;
    Util.Desabilita_Campos(FrmPre_Venda);
end;

procedure TFrmPre_Venda.Button1Click(Sender: TObject);
begin
  DAV_Modelo_2;
end;

procedure TFrmPre_Venda.Calcula_Total;
var
  sub_total, total_produtos, peso_total, desconto, total_pedido, limite_compra, limite_compra_disponivel,
  total_desconto, total_acrecimo, tot_des, tot_acre,
  limite_desconto, desconto_item: double;
begin
  sub_total:= StrToFloat(EdtValor_Total.Text);
  limite_compra:= StrToFloat(EdtLimite_Compra.Text);
  total_desconto:= StrToFloat(EdtTotal_Desconto.Text);
  total_acrecimo:= StrToFloat(EdtTotal_Acrecimo.Text);
  limite_desconto:= StrToFloat(EdtLimite_Desconto_Disponivel.Text);
  desconto_item:= StrToFloat(EdtDesconto_Item.Text);

  tot_des:= total_desconto + StrToFloat(EdtDesconto_Item.Text);
  tot_acre:= total_acrecimo + StrToFloat(EdtAcrecimo.Text);

  //verifica se chegou no limite do desconto
  total_limite:= limite_desconto - desconto_item;
  if (Verifica_Desconto(total_limite) = false) then
  begin
    EdtValor_Total.SetFocus;
    abort;
  end;

  Inc(qtde_itens);
  EdtQuantidade_Itens.Text:= IntToStr(qtde_itens);

  EdtLimite_Desconto_Disponivel.Text:= FormatFloat('#0.0,0', total_limite);
  EdtLimite_Desconto_Disponivel.Text:= StringReplace(EdtLimite_Desconto_Disponivel.Text, ThousandSeparator, '', [rfReplaceAll]);

  if (StrToFloat(EdtLimite_Desconto_Disponivel.Text) < 0) then
    EdtLimite_Desconto_Disponivel.Font.Color:= clRed
  else
    EdtLimite_Desconto_Disponivel.Font.Color:= clBlack;

  EdtTotal_Desconto.Text:= FormatFloat('#0.0,0', tot_des);
  EdtTotal_Desconto.Text:= StringReplace(EdtTotal_Desconto.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtTotal_Acrecimo.Text:= FormatFloat('#0.0,0', tot_acre);
  EdtTotal_Acrecimo.Text:= StringReplace(EdtTotal_Acrecimo.Text, ThousandSeparator, '', [rfReplaceAll]);

  total_produtos:= sub_total + StrToFloat(EdtTotal_Produtos.Text);
  EdtTotal_Produtos.Text:= FormatFloat('#0.0,0', total_produtos);
  EdtTotal_Produtos.Text:= StringReplace(EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

  total_pedido:= sub_total + StrToFloat(EdtTotal_Pedido.Text);
  EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', total_pedido);
  EdtTotal_Pedido.Text:= StringReplace(EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);

  limite_compra_disponivel:= limite_compra - total_pedido;
  EdtLimite_Compra_Disponivel.Text:= FormatFloat('#0.0,0', limite_compra_disponivel);
  EdtLimite_Compra_Disponivel.Text:= StringReplace(EdtLimite_Compra_Disponivel.Text, ThousandSeparator, '', [rfReplaceAll]);

  if (StrToFloat(EdtLimite_Compra_Disponivel.Text) < 0) then
    EdtLimite_Compra_Disponivel.Font.Color:= clRed
  else
    EdtLimite_Compra_Disponivel.Font.Color:= clBlack;

end;

procedure TFrmPre_Venda.Calcula_Total_Deletado;
var
  sub_total, total_produtos, peso_total, desconto, total_pedido,
  limite_compra, limite_compra_disponivel, acrecimo, limite_desconto: double;
begin
  sub_total:= qryitens_vendaSub_Total.AsFloat;
  acrecimo:= qryitens_vendaAcrecimo.AsFloat;
  desconto:= qryitens_vendaDesconto.AsFloat;
  limite_compra_disponivel:= StrToFloat(EdtLimite_Compra_Disponivel.Text);
  total_pedido:= StrToFloat(EdtTotal_Pedido.Text);
  limite_desconto:= StrToFloat(EdtLimite_Desconto_Disponivel.Text);

  Dec(qtde_itens);
  EdtQuantidade_Itens.Text:= IntToStr(qtde_itens);

  EdtLimite_Desconto_Disponivel.Text:= FormatFloat('#0.0,0', (limite_Desconto + desconto));
  EdtLimite_Desconto_Disponivel.Text:= StringReplace(EdtLimite_Desconto_Disponivel.Text, ThousandSeparator, '', [rfReplaceAll]);

  if (StrToFloat(EdtLimite_Desconto_Disponivel.Text) < 0) then
    EdtLimite_Desconto_Disponivel.Font.Color:= clRed
  else
    EdtLimite_Desconto_Disponivel.Font.Color:= clBlack;

  EdtTotal_Acrecimo.Text:= FormatFloat('#0.0,0', StrToFloat(EdtTotal_Acrecimo.Text) - acrecimo);
  EdtTotal_Acrecimo.Text:= StringReplace(EdtTotal_Acrecimo.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtTotal_Desconto.Text:= FormatFloat('#0.0,0', StrToFloat(EdtTotal_Desconto.Text) - desconto);
  EdtTotal_Desconto.Text:= StringReplace(EdtTotal_Desconto.Text, ThousandSeparator, '', [rfReplaceAll]);

  total_produtos:= StrToFloat(EdtTotal_Produtos.Text) - sub_total;
  EdtTotal_Produtos.Text:= FormatFloat('#0.0,0', total_produtos);
  EdtTotal_Produtos.Text:= StringReplace(EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

  total_pedido:= StrToFloat(EdtTotal_Pedido.Text) - sub_total;
  EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', total_pedido);
  EdtTotal_Pedido.Text:= StringReplace(EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);

  limite_compra_disponivel:= limite_compra_disponivel + sub_total;
  EdtLimite_Compra_Disponivel.Text:= FormatFloat('#0.0,0', limite_compra_disponivel);
  EdtLimite_Compra_Disponivel.Text:= StringReplace(EdtLimite_Compra_Disponivel.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

function TFrmPre_Venda.Chama_Pedido: boolean;
begin
  with qAux, sql do
  begin
    close;
    clear;
    add('Select Ped.*, Cli.Nome_Nome_Fantasia from Pedido Ped');
    add('inner join Cliente Cli on (Cli.Codigo = Ped.Codigo_Cliente)');
    add('where Ped.N_Pre_Venda = :N_Pre_Venda and Ped.Tipo = :Pre_Venda');
    Parameters.ParamByName('N_Pre_Venda').Value:= EdtN_Pedido.Text;
    Parameters.ParamByName('Pre_Venda').Value:= 'PRÉ-VENDA';
    open;
  end;

  if (qAux.IsEmpty = false) then
  begin
    EdtCodigo.Text:= qAux.FieldByName('Codigo').AsString;
    Result:= true;
    with qryitens_venda, sql do
    begin
      close;
      clear;
      add('select IP.*, Ped.N_Pre_Venda, P.Codigo_Venda, P.Descricao, UM.Sigla as Unidade from Itens_Pedido IP');
      add('inner join Pedido Ped on(IP.Codigo = Ped.Codigo)');
      add('inner join Produto P on(IP.Codigo_Produto = P.Codigo)');
      add('inner join Unidade_Medida UM on(P.Codigo_Unidade_Medida = UM.Codigo)');
      add('where Ped.Codigo = :Codigo and Ped.Tipo = :Pre_Venda');
      Parameters.ParamByName('Codigo').Value:= EdtCodigo.Text;
      Parameters.ParamByName('Pre_Venda').Value:= 'PRÉ-VENDA';
      open;
    end;
  end
  else
    Result:= false;
end;

function TFrmPre_Venda.Confira_Itens_Pedido: boolean;
begin
  Confira_Itens_Pedido:= false;

  if (EdtCodigo_Produto.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Produto.SetFocus;
    abort;
  end;

  if (EdtQuantidade.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtQuantidade.SetFocus;
    abort;
  end;

  if (EdtDesconto_Item.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtDesconto_Item.SetFocus;
    abort;
  end;

  if (EdtAcrecimo.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtAcrecimo.SetFocus;
    abort;
  end;

  if (EdtValor_Total.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtValor_Total.SetFocus;
    abort;
  end;

  Confira_Itens_Pedido:= true;
end;

function TFrmPre_Venda.Confira_Pedido: boolean;
begin
  Confira_Pedido:= false;

  if (EdtCodigo.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo.SetFocus;
    abort;
  end;

  if (EdtN_Pedido.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtN_Pedido.SetFocus;
    abort;
  end;

  if (EdtCodigo_Cliente.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Cliente.SetFocus;
    abort;
  end;

  if (MEdtData_Venda.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    MEdtData_Venda.SetFocus;
    abort;
  end;

  if (MEdtData_Previsao_Entrega.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    MEdtData_Previsao_Entrega.SetFocus;
    abort;
  end;

  Confira_Pedido:= true;
end;

procedure TFrmPre_Venda.DAV_Modelo_1;
var
  i, i2, linha: integer;
  dav, tipo_rel, rodape: string;
  cn, cp: string;
begin
  rs.BeginDoc;
  i:= 0;
  i2:= 135;

  dav:= 'NÃO É DOCUMENTO FISCAL - NÃO É VÁLIDO COMO RECIBO E COMO GARANTIA DE MERCADORIA - NÃO COMPROVA PAGAMENTO';
  tipo_rel:= 'DOCUMENTO AUXILIAR DE VENDA - ' + tipo;

  rs.WriteFont(2,Alinha_Centro(tipo_rel,i2),tipo_rel, [Underline] + [Bold]);
  rs.WriteFont(3, Alinha_Centro(dav,i2), dav, [Underline] + [Bold]);

  for i := 0 to i2 do
    rs.Write(4,i,'-');

  cn:= Copy(cnpj,1,2)+'.'+Copy(cnpj,3,3)+'.'+Copy(cnpj,6,3)+'/'+
    Copy(cnpj,9,4)+'-'+Copy(cnpj,13,2);

  cp:= Copy(LblCPF.Caption,1,3)+'.'+Copy(LblCPF.Caption,4,3)+'.'+Copy(LblCPF.Caption,7,3)+'-'+
    Copy(LblCPF.Caption,10,2);

  rs.Write(5,0, 'EMPRESA');
  rs.Write(5,50, 'CNPJ');
  rs.Write(6,0, nome_fantasia);
  rs.Write(6,50, cn);

  i:= 1;
  for i := 0 to i2 do
    rs.Write(7,i,'-');

  rs.Write(8,0, 'DESTINATÁRIO');
  rs.Write(8,50, 'CPF/CNPJ');
  rs.Write(9,0, EdtCliente.Text);
  rs.Write(9,50, cp);

  i:= 1;
  for i := 0 to i2 do
    rs.Write(10,i, '-');

  rs.Write(11,0, 'Número do Documento: ' + EdtN_Pedido.Text);
  rs.Write(11, 40, 'Número do Documento Fiscal: ' + '');

  i:= 1;
  for i := 0 to i2 do
    rs.Write(12,i, '-');

  rs.WriteFont(14,0,'PRODUTOS', [Underline]);
  rs.WriteFont(16,0,'CÓDIGO PRODUTO', [Underline]);
  rs.WriteFont(16, 16, 'DESCRIÇÃO', [Underline]);
  rs.WriteFont(16, 60, 'UN.', [Underline]);
  rs.WriteFont(16, 66, 'QTDE.', [Underline]);
  rs.WriteFont(16, 74, 'VALOR UN.', [Underline]);
  rs.WriteFont(16, 85, 'DESC.', [Underline]);
  rs.WriteFont(16, 92, 'VALOR TOTAL', [Underline]);

  with qryitens_venda, sql do
  begin
    close;
    clear;
    add('select IP.*, P.Codigo_Venda, P.Descricao, UM.Sigla as Unidade from Itens_Pedido IP');
    add('inner join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
    add('where IP.N_Pedido = :Pedido and IP.Cancelado = :N');
    Parameters.ParamByName('Pedido').Value:= EdtN_Pedido.Text;
    Parameters.ParamByName('N').Value:= 'N';
    open;
    First;
  end;

  linha:= 18;
  while not qryitens_venda.Eof do
  begin
    rs.Write(linha, 0, qryitens_vendaCodigo_Venda.AsString);
    rs.Write(linha, 16, qryitens_vendaDescricao.AsString);
    rs.Write(linha, 60, qryitens_vendaUN.AsString);
    rs.Write(linha, 66, FormatFloat('#0.0,0', qryitens_vendaQtde.AsFloat));
    rs.Write(linha, 74, FormatFloat('#0.0,0', qryitens_vendaValor_Unitario.AsFloat));
    rs.Write(linha, 85, FormatFloat('#0.0,0', qryitens_vendaDesconto.AsFloat));
    rs.Write(linha, 92, FormatFloat('#0.0,0', qryitens_vendaSub_Total.AsFloat));
    Inc(linha);
    qryitens_venda.Next;
  end;

  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha + 1,i, '-');

  rodape:= 'É vedada a autenticação deste documento';
  rs.Write(linha + 6,Alinha_Centro(rodape, i2), rodape);
  rs.Print;
end;

procedure TFrmPre_Venda.DAV_Modelo_2;
var
  i, i2, linha: integer;
  dav, tipo_rel, rodape: string;
  cn, cp: string;
begin
  rs.BeginDoc;
  i:= 0;
  i2:= 135;

  dav:= 'NÃO É DOCUMENTO FISCAL - NÃO É VÁLIDO COMO RECIBO E COMO GARANTIA DE MERCADORIA - NÃO COMPROVA PAGAMENTO';
  tipo_rel:= 'DOCUMENTO AUXILIAR DE VENDA - ' + tipo;

  rs.WriteFont(2,Alinha_Centro(tipo_rel,i2),tipo_rel, [Underline] + [Bold]);
  rs.WriteFont(3, Alinha_Centro(dav,i2), dav, [Underline] + [Bold]);

  for i := 0 to i2 do
    rs.Write(4,i,'-');

  cn:= Copy(cnpj,1,2)+'.'+Copy(cnpj,3,3)+'.'+Copy(cnpj,6,3)+'/'+
    Copy(cnpj,9,4)+'-'+Copy(cnpj,13,2);

  cp:= Copy(LblCPF.Caption,1,3)+'.'+Copy(LblCPF.Caption,4,3)+'.'+Copy(LblCPF.Caption,7,3)+'-'+
    Copy(LblCPF.Caption,10,2);

  rs.Write(5,0, 'EMPRESA: ' + nome_fantasia); rs.Write(5,60, 'ENDEREÇO: ' + tipo_endereco + ' ' + endereco + ', ' + numero);

  rs.Write(6,0, 'CNPJ: ' + cn); RS.Write(6,30, 'Insc. Estadual: ' + insc_estadual); RS.Write(6,60, 'Insc. Municipal: ' + insc_municipal);

  rs.Write(7,0, 'TELEFONE: ' + telefone);

  i:= 1;
  for i := 0 to i2 do
    rs.Write(8,i,'-');

  rs.Write(9,0, 'CLIENTE: ' + EdtCliente.Text); rs.Write(9,60, 'ENDEREÇO: ' + LblTipo_Logradouro.Caption + ' ' + LblEndereco.Caption + ', ' + LblNumero.Caption);

  rs.Write(10,0, 'CPF/CNPJ: ' + cp); rs.Write(10,30, 'CIDADE: ' + LblCidade.Caption); rs.Write(10,60,'UF: ' + LblUF.Caption);

  rs.Write(11,0, 'SETOR: ' + LblSetor.Caption); rs.Write(11, 30, 'TELEFONE: ' + LblTelefone.Caption);

  i:= 1;
  for i := 0 to i2 do
    rs.Write(12,i, '-');

  rs.Write(13,0, 'Número do Documento: ' + EdtN_Pedido.Text);
  rs.Write(13, 40, 'Número do Documento Fiscal: ' + '');

  i:= 1;
  for i := 0 to i2 do
    rs.Write(14,i, '-');

  rs.WriteFont(18,0,'PRODUTOS', [Underline]);
  rs.WriteFont(18,0,'CÓDIGO PRODUTO', [Underline]);
  rs.WriteFont(18, 16, 'DESCRIÇÃO', [Underline]);
  rs.WriteFont(18, 60, 'UN.', [Underline]);
  rs.WriteFont(18, 66, 'QTDE.', [Underline]);
  rs.WriteFont(18, 74, 'VALOR UN.', [Underline]);
  rs.WriteFont(18, 85, 'DESC.', [Underline]);
  rs.WriteFont(18, 92, 'VALOR TOTAL', [Underline]);

  with qryitens_venda, sql do
  begin
    close;
    clear;
    add('select IP.*, P.Codigo_Venda, P.Descricao, UM.Sigla as Unidade from Itens_Pedido IP');
    add('inner join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
    add('where IP.N_Pedido = :Pedido and IP.Cancelado = :N');
    Parameters.ParamByName('Pedido').Value:= EdtN_Pedido.Text;
    Parameters.ParamByName('N').Value:= 'N';
    open;
    First;
  end;

  linha:= 21;
  while not qryitens_venda.Eof do
  begin
    rs.Write(linha, 0, qryitens_vendaCodigo_Venda.AsString);
    rs.Write(linha, 16, qryitens_vendaDescricao.AsString);
    rs.Write(linha, 60, qryitens_vendaUN.AsString);
    rs.Write(linha, 66, FormatFloat('#0.0,0', qryitens_vendaQtde.AsFloat));
    rs.Write(linha, 74, FormatFloat('#0.0,0', qryitens_vendaValor_Unitario.AsFloat));
    rs.Write(linha, 85, FormatFloat('#0.0,0', qryitens_vendaDesconto.AsFloat));
    rs.Write(linha, 92, FormatFloat('#0.0,0', qryitens_vendaSub_Total.AsFloat));
    Inc(linha);
    qryitens_venda.Next;
  end;

  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha,i, '-');

  rs.Write(linha+2,0,'QTDE. ITENS:.....: ' + EdtQuantidade_Itens.Text);
  rs.Write(linha+3,0,'TOTAL DE PRODUTOS: ' + EdtTotal_Produtos.Text);
  rs.Write(linha+4,0,'PESO TOTAL.......: ' + EdtPeso_Total.Text);       rs.Write(linha+4,40,'DESCONTOS......: ' + EdtDesconto.Text);
  rs.WriteFont(linha+5,40,'TOTAL DO PEDIDO: ' + EdtTotal_Pedido.Text, [Underline] + [Bold]);

  rodape:= 'É vedada a autenticação deste documento';
  rs.Write(linha + 12,Alinha_Centro(rodape, i2), rodape);
  rs.Print;
end;

procedure TFrmPre_Venda.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

  if qryitens_vendaCancelado.AsString = 'S' then
    DBGrid1.Canvas.Font.Color:= clRed;
  dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
end;

procedure TFrmPre_Venda.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  qAuxEx: TADOQuery;
begin
  if (key = vk_delete) then
  begin
    if (Confirma_Delete = true) then
      begin
        Calcula_Total_Deletado;

        {try
          qAuxEx:= TADOQuery.Create(self);
          with qAuxEx, sql do
          begin
            close;
            Connection:= dm.ADOConnection1;
            clear;
            add('Delete from Itens_Pedido where Codigo = :Codigo and Codigo_Produto = :Produto');
            Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
            Parameters.ParamByName('Produto').Value:= qryitens_vendaCodigo_Produto.AsInteger;
            ExecSQL;
          end;

          with qAuxEx, sql do
          begin
            close;
            Connection:= dm.ADOConnection1;
            clear;
            add('Delete from R05 where N_Pedido = :Codigo and Codigo_Produto_Inteiro = :Produto');
            Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
            Parameters.ParamByName('Produto').Value:= qryitens_vendaCodigo_Produto.AsInteger;
            ExecSQL;
          end;
        finally
          FreeAndNil(qAux);
        end; }

        Atualiza_Itens;
      end;
  end;
end;

procedure TFrmPre_Venda.Atualiza_Itens;
var
  total, sub1, sub2, valor_cancelado: double;
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update Itens_Pedido set Cancelado = :Cancelado');
      add('where Codigo_Produto = :Codigo_Produto and Codigo = :Codigo');
      Parameters.ParamByName('Cancelado').Value:= 'S';
      Parameters.ParamByName('Codigo_Produto').Value:= qryitens_vendaCodigo_Produto.AsInteger;
      Parameters.ParamByName('Codigo').Value:= EdtCodigo.Text;
      ExecSQL;
    end;

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update R05 set Cancelamento = :Cancelamento, Quantidade_Cancelada = :Qtde, Valor_Cancelado = :Valor');
      add('where Codigo_Produto_Inteiro = :Codigo and N_Pedido = :Pedido');
      Parameters.ParamByName('Cancelamento').Value:= 'S';
      Parameters.ParamByName('Qtde').Value:= qryitens_vendaQtde.AsString;
      valor_cancelado:= qryitens_vendaQtde.AsFloat * qryitens_vendaValor_Unitario.AsFloat;
      Parameters.ParamByName('Valor').Value:= FloatToStr(valor_cancelado);
      Parameters.ParamByName('Codigo').Value:= qryitens_vendaCodigo_Produto.AsInteger;
      Parameters.ParamByName('Pedido').Value:= EdtCodigo.Text;
      ExecSQL;
    end;

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update R05_Aux set Cancelamento = :Cancelamento, Quantidade_Cancelada = :Qtde, Valor_Cancelado = :Valor');
      add('where Codigo_Produto_Inteiro = :Codigo and N_Pedido = :Pedido');
      Parameters.ParamByName('Cancelamento').Value:= 'S';
      Parameters.ParamByName('Qtde').Value:= qryitens_vendaQtde.AsString;
      valor_cancelado:= qryitens_vendaQtde.AsFloat * qryitens_vendaValor_Unitario.AsFloat;
      Parameters.ParamByName('Valor').Value:= FloatToStr(valor_cancelado);
      Parameters.ParamByName('Codigo').Value:= qryitens_vendaCodigo_Produto.AsInteger;
      Parameters.ParamByName('Pedido').Value:= EdtCodigo.Text;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
  Atualiza_Dados;
end;

procedure TFrmPre_Venda.EdtAcrecimoEnter(Sender: TObject);
begin
  if (total_valor_uni > 0) then
  begin
    EdtAcrecimo.Text:= FormatFloat('#0.0,0', total_valor_uni);
    EdtAcrecimo.Text:= StringReplace(EdtAcrecimo.Text, ThousandSeparator, '', [rfReplaceAll]);
  end
  else
    EdtAcrecimo.Text:= '0,00';
end;

procedure TFrmPre_Venda.EdtAcrecimoExit(Sender: TObject);
begin
  Verifica_Valor_Negativo_Desconto(StrToFloat(EdtAcrecimo.Text), EdtAcrecimo);

  if (EdtAcrecimo.Text = '') then
  begin
    Valor_Invalido;
    EdtAcrecimo.Clear;
    EdtAcrecimo.SetFocus;
    abort;
  end
  else if (StrToFloat(EdtAcrecimo.Text) < 0) then
  begin
    Valor_Invalido;
    EdtAcrecimo.Clear;
    EdtAcrecimo.SetFocus;
    abort;
  end
  else
  begin
    EdtAcrecimo.Text:= FormatFloat('#0.0,0', StrToFloat(EdtAcrecimo.Text));
    EdtAcrecimo.Text:= StringReplace(EdtAcrecimo.Text, ThousandSeparator, '', [rfReplaceAll]);
  end;
end;

procedure TFrmPre_Venda.EdtAcrecimoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmPre_Venda.EdtAcrecimo_TotalExit(Sender: TObject);
begin
  if (EdtAcrecimo_Total.Text = '') then
  begin
    Valor_Invalido;
    EdtAcrecimo_Total.Clear;
    EdtAcrecimo_Total.SetFocus;
    abort;
  end
  else if (StrToFloat(EdtAcrecimo_Total.Text) < 0) then
  begin
    Valor_Invalido;
    EdtAcrecimo_Total.SetFocus;
    abort;
  end
  else
  begin
    EdtAcrecimo_Total.Text:= FormatFloat('#0.0,0', StrToFloat(EdtAcrecimo_Total.Text));
    EdtAcrecimo_Total.Text:= StringReplace(EdtAcrecimo_Total.Text, ThousandSeparator, '', [rfReplaceAll]);
  end;
end;

procedure TFrmPre_Venda.EdtClienteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmPre_Venda.EdtCodigo_ClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;
end;

procedure TFrmPre_Venda.EdtCodigo_ClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmPre_Venda.EdtCodigo_Condicao_PagamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
    FrmChama_Condicao_Pagamento.ShowModal;
    FrmChama_Condicao_Pagamento.Free;
  end;
end;

procedure TFrmPre_Venda.EdtCodigo_ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free;
  end;

  if (key = vk_return) then
  begin
    EdtST.SetFocus;
  end;
end;

procedure TFrmPre_Venda.EdtCodigo_ProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmPre_Venda.EdtDescontoExit(Sender: TObject);
var
  total: double;
begin
  if (EdtDesconto.Text = '') then
  begin
    Valor_Invalido;
    EdtDesconto.Clear;
    EdtDesconto.SetFocus;
    abort;
  end
  else if (StrToFloat(EdtDesconto.Text) < 0) then
  begin
    Valor_Invalido;
    EdtDesconto.SetFocus;
    abort;
  end
  else
  begin
    total:= Calcula_Valor(EdtDesconto.Text);
    EdtDesconto.Text:= FormatFloat('#0.0,0', total);
    EdtDesconto.Text:= StringReplace(EdtDesconto.Text, ThousandSeparator, '', [rfReplaceAll]);
  end;
end;

procedure TFrmPre_Venda.EdtDesconto_ItemEnter(Sender: TObject);
begin
  if (total_valor_uni < 0) then
  begin
    EdtDesconto_Item.Text:= FormatFloat('#0.0,0', Abs(total_valor_uni));
    EdtDesconto_Item.Text:= StringReplace(EdtDesconto_Item.Text, ThousandSeparator, '', [rfReplaceAll]);
  end
  else
    EdtDesconto_Item.Text:= '0,00';
end;

procedure TFrmPre_Venda.EdtDesconto_ItemExit(Sender: TObject);
begin
  Verifica_Valor_Negativo_Desconto(StrToFloat(EdtDesconto_Item.Text), EdtDesconto_Item);

  if (EdtDesconto_Item.Text = '') then
  begin
    Valor_Invalido;
    EdtDesconto_Item.Clear;
    EdtDesconto_Item.SetFocus;
    abort;
  {end
  else if (StrToFloat(EdtDesconto_Item.Text) > perc_desc ) then
  begin
    Valor_Invalido;
    EdtDesconto_Item.Text:= '0,00';
    EdtDesconto_Item.SetFocus;
    abort;}
  end
  else if (Calcula_Valor_Porcentagem(StrToFloat(EdtDesconto_Item.Text), StrToFloat(EdtValor_Unitario.Text)) > perc_desc) then
  begin
    Valor_Invalido;
    EdtDesconto_Item.Text:= '0,00';
    EdtDesconto_Item.SetFocus;
    abort;
  end
  else
  begin
    EdtDesconto_Item.Text:= FormatFloat('#0.0,0', StrToFloat(EdtDesconto_Item.Text));
    EdtDesconto_Item.Text:= StringReplace(EdtDesconto_Item.Text, ThousandSeparator, '', [rfReplaceAll]);
  end;
end;

procedure TFrmPre_Venda.EdtDesconto_ItemKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmPre_Venda.EdtN_PedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    if (Chama_Pedido = true) then
    begin
      Ver_Pedido;
      Atualiza_Dados;
      achei:= true;
    end
    else
    begin
      Nao_Selecionado;
      EdtN_Pedido.SetFocus;
      achei:= false;
    end;
  end;
end;

procedure TFrmPre_Venda.EdtProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmPre_Venda.EdtQuantidadeExit(Sender: TObject);
begin
  if (EdtQuantidade.Text = '') or (StrToFloat(EdtQuantidade.Text) < 0) then
  begin
    Valor_Invalido;
    EdtQuantidade.Clear;
    EdtQuantidade.SetFocus;
    abort;
  end
  else
  begin
    Verifica_Valor_Negativo(StrToFloat(EdtQuantidade.Text), EdtQuantidade);
    EdtQuantidade.Text:= FormatFloat('#0.0,0', StrToFloat(EdtQuantidade.Text));
    EdtQuantidade.Text:= StringReplace(EdtQuantidade.Text, ThousandSeparator, '', [rfReplaceAll]);
  end;
end;

procedure TFrmPre_Venda.EdtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', ',', #08]) then
    key := #0
end;

procedure TFrmPre_Venda.EdtTotal_PedidoEnter(Sender: TObject);
var
  desconto, total, cdesconto, cacrecimo, acrecimo, ctotalitem, total_ped: double;
begin
  if (EdtDesconto.Text = '') then
  begin
    Valor_Invalido;
    abort;
  end;
  desconto:= StrToFloat(EdtDesconto.Text);
  acrecimo:= StrToFloat(EdtAcrecimo_Total.Text);
  total_ped:= StrToFloat(EdtTotal_Pedido.Text);

  {if (RGDesconto.ItemIndex = 0) then
  begin
    cdesconto:= total * (desconto / 100);
    cacrecimo:= total * (acrecimo / 100);
    ctotalitem:= total - cdesconto + cacrecimo;
    EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', ctotalitem);
    EdtTotal_Pedido.Text:= StringReplace(EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);
  end
  else
  begin}
    ctotalitem:= total_ped - desconto + acrecimo;
    EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', ctotalitem);
    EdtTotal_Pedido.Text:= StringReplace(EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);
  //end;
end;

procedure TFrmPre_Venda.EdtValor_TotalEnter(Sender: TObject);
var
  qtde, valor_unitario, tot_trun, total: double;
  desconto, acrecimo, cdesconto, cacrecimo, ctotalitem: double;
begin
  //RGDesconto_Item.Visible:= false;
  qtde:= StrToFloat(EdtQuantidade.Text);
  valor_unitario:= StrToFloat(EdtValor_Unitario.Text);
  desconto:= StrtoFloat(EdtDesconto_Item.Text);
  acrecimo:= StrtoFloat(EdtAcrecimo.Text);
  tot_trun:= qtde * valor_unitario;
  total:= Calcula_Valor(FloatToStr(tot_trun));
  //total:= Trunc(tot_trun * 100) / 100;

  {if (RGDesconto_Item.ItemIndex = 0) then
    begin
      cdesconto:= total * (desconto / 100);
      cacrecimo:= total * (acrecimo / 100);
      ctotalitem:= total - cdesconto + cacrecimo;
      EdtValor_Total.Text:= FormatFloat('#0.0,0', ctotalitem);
      EdtValor_Total.Text:= StringReplace(EdtValor_Total.Text, ThousandSeparator, '', [rfReplaceAll]);
    end
    else
    begin}
      ctotalitem:= 0;
      ctotalitem:= total - desconto + acrecimo;
      EdtValor_Total.Text:= FormatFloat('#0.0,0', ctotalitem);
      EdtValor_Total.Text:= StringReplace(EdtValor_Total.Text, ThousandSeparator, '', [rfReplaceAll]);
    //end;
end;

procedure TFrmPre_Venda.EdtValor_TotalExit(Sender: TObject);
begin
  Verifica_Valor_Negativo(StrToFloat(EdtValor_Total.Text), EdtValor_Total);
end;

procedure TFrmPre_Venda.EdtValor_TotalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  limite_compra, limite_compra_disponivel, total_pedido, sub_total, bc, bc2, ali: double;
begin
  if (key = vk_return) then
  begin
    Verifica_Permissao;
    Verifica_Produto_Lancado;

    if (StrToFloat(EdtValor_Total.Text) < 0) then
      begin
        Valor_Invalido;
        abort;
      end;

    if (Verifica_Produto_Saida(StrToFloat(EdtQuantidade.Text)) = false)then
    begin
      Atualiza_Dados;
      Limpa_Menor;
      EdtCodigo_Produto.SetFocus;
      abort;
    end;

    sub_total:= StrToFloat(EdtValor_Total.Text);
    total_pedido:= sub_total + StrToFloat(EdtTotal_Pedido.Text);
    limite_compra:= StrToFloat(EdtLimite_Compra.Text);
    limite_compra_disponivel:= limite_compra - total_pedido;
    if (Verifica_Credito(limite_compra_disponivel) = false)then
    begin
      Atualiza_Dados;
      Limpa_Menor;
      EdtCodigo_Produto.SetFocus;
      abort;
    end;

    if (Confira_Itens_Pedido = true) then
    begin
      Calcula_Total;

      Colega_Dados_R05;
      R05.Salva_Banco(R05);
      R05.Salva_Banco_Aux(R05);

      Calcula_Imposto;

      //Itens_Pedido.Salva_Banco(Itens_Pedido);

      Atualiza_Dados;
      Limpa_Menor;
      BBtnOrcamento.Enabled:= true;
    end;
  end;
end;

procedure TFrmPre_Venda.Calcula_Imposto;
var
  bc, bc2, ali: double;
begin
  //-------------------icms acrescida ou reduzida----------------//

  if (LblBase_Reduzida.Caption <> '') then
  begin
    bc:= (StrToFloat(LblBase_Reduzida.Caption) / 100) * StrToFloat(EdtValor_Total.Text);
    bc2:= StrToFloat(EdtValor_Total.Text) - bc;
    LblBC.Caption:= FloatToStr(bc2);     //base

    if (LblICMS.Caption = 'I1') or (LblICMS.Caption = 'N1') or (LblICMS.Caption = 'F1') then
    begin
      ali:= 0 * bc2;
      LblValor_ICMS.Caption:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(LblICMS.Caption) / 10000) * bc2;
      LblValor_ICMS.Caption:= FloatToStr(ali);
    end;
  end
  else if (LblBase_Acrescida.Caption <> '') then
  begin
    bc:= (StrToFloat(LblBase_Acrescida.Caption) / 100) * StrToFloat(EdtValor_Total.Text);
    bc2:= StrToFloat(EdtValor_Total.Text) + bc;
    LblBC.Caption:= FloatToStr(bc2);     //base

    if (LblICMS.Caption = 'I1') or (LblICMS.Caption = 'N1') or (LblICMS.Caption = 'F1') then
    begin
      ali:= 0 * bc2;
      LblValor_ICMS.Caption:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(LblICMS.Caption) / 10000) * bc2;
      LblValor_ICMS.Caption:= FloatToStr(ali);
    end;
  end
  else
  begin
    bc2:= StrToFloat(EdtValor_Total.Text);
    LblBC.Caption:= FloatToStr(bc2);     //base

    if (LblICMS.Caption = 'I1') or (LblICMS.Caption = 'N1') or (LblICMS.Caption = 'F1') then
    begin
      ali:= 0 * bc2;
      LblValor_ICMS.Caption:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(LblICMS.Caption) / 10000) * bc2;
      LblValor_ICMS.Caption:= FloatToStr(ali);
    end;
  end;
  //--------------------fim icms--------------------------------//


  //-------------------ipi acrescida ou reduzida----------------//

  if (LblBase_Reduzida_IPI.Caption <> '') then
  begin
    bc:= (StrToFloat(LblBase_Reduzida_IPI.Caption) / 100) * StrToFloat(EdtValor_Total.Text);
    bc2:= StrToFloat(EdtValor_Total.Text) - bc;
    LblBC_IPI.Caption:= FloatToStr(bc2);     //base

    if (LblIPI.Caption = 'I') or (LblIPI.Caption = 'N') or (LblIPI.Caption = 'F') then
    begin
      ali:= 0 * bc2;
      LblValor_IPI.Caption:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(LblIPI.Caption) / 100) * bc2;
      LblValor_IPI.Caption:= FloatToStr(ali);
    end;
  end
  else if (LblBase_Acrescida_IPI.Caption <> '') then
  begin
    bc:= (StrToFloat(LblBase_Acrescida_IPI.Caption) / 100) * StrToFloat(EdtValor_Total.Text);
    bc2:= StrToFloat(EdtValor_Total.Text) + bc;
    LblBC_IPI.Caption:= FloatToStr(bc2);     //base

    if (LblIPI.Caption = 'I') or (LblIPI.Caption = 'N') or (LblIPI.Caption = 'F') then
    begin
      ali:= 0 * bc2;
      LblValor_IPI.Caption:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(LblIPI.Caption) / 100) * bc2;
      LblValor_IPI.Caption:= FloatToStr(ali);
    end;
  end
  else
  begin
    bc2:= StrToFloat(EdtValor_Total.Text);
    LblBC_IPI.Caption:= FloatToStr(bc2);     //base

    if (LblIPI.Caption = 'I') or (LblIPI.Caption = 'N') or (LblIPI.Caption = 'F') then
    begin
      ali:= 0 * bc2;
      LblValor_IPI.Caption:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(LblIPI.Caption) / 100) * bc2;
      LblValor_IPI.Caption:= FloatToStr(ali);
    end;
  end;
  //--------------------fim ipi--------------------------------//

  //-------------------pis acrescida ou reduzida----------------//

  if (LblBase_Reduzida_PIS.Caption <> '') then
  begin
    bc:= (StrToFloat(LblBase_Reduzida_PIS.Caption) / 100) * StrToFloat(EdtValor_Total.Text);
    bc2:= StrToFloat(EdtValor_Total.Text) - bc;
    LblBC_PIS.Caption:= FloatToStr(bc2);     //base

    if (LblPIS.Caption = 'I') or (LblPIS.Caption = 'N') or (LblPIS.Caption = 'F') then
    begin
      ali:= 0 * bc2;
      LblValor_PIS.Caption:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(LblPIS.Caption) / 100) * bc2;
      LblValor_PIS.Caption:= FloatToStr(ali);
    end;
  end
  else if (LblBase_Acrescida_PIS.Caption <> '') then
  begin
    bc:= (StrToFloat(LblBase_Acrescida_PIS.Caption) / 100) * StrToFloat(EdtValor_Total.Text);
    bc2:= StrToFloat(EdtValor_Total.Text) + bc;
    LblBC_PIS.Caption:= FloatToStr(bc2);     //base

    if (LblPIS.Caption = 'I') or (LblPIS.Caption = 'N') or (LblPIS.Caption = 'F') then
    begin
      ali:= 0 * bc2;
      LblValor_PIS.Caption:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(LblPIS.Caption) / 100) * bc2;
      LblValor_PIS.Caption:= FloatToStr(ali);
    end;
  end
  else
  begin
    bc2:= StrToFloat(EdtValor_Total.Text);
    LblBC_PIS.Caption:= FloatToStr(bc2);     //base

    if (LblPIS.Caption = 'I') or (LblPIS.Caption = 'N') or (LblPIS.Caption = 'F') then
    begin
      ali:= 0 * bc2;
      LblValor_PIS.Caption:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(LblPIS.Caption) / 100) * bc2;
      LblValor_PIS.Caption:= FloatToStr(ali);
    end;
  end;
  //--------------------fim pis--------------------------------//

  //-------------------cofins acrescida ou reduzida----------------//

  if (LblBase_Reduzida_COFINS.Caption <> '') then
  begin
    bc:= (StrToFloat(LblBase_Reduzida_COFINS.Caption) / 100) * StrToFloat(EdtValor_Total.Text);
    bc2:= StrToFloat(EdtValor_Total.Text) - bc;
    LblBC_COFINS.Caption:= FloatToStr(bc2);     //base

    if (LblCOFINS.Caption = 'I') or (LblCOFINS.Caption = 'N') or (LblCOFINS.Caption = 'F') then
    begin
      ali:= 0 * bc2;
      LblValor_COFINS.Caption:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(LblCOFINS.Caption) / 100) * bc2;
      LblValor_COFINS.Caption:= FloatToStr(ali);
    end;
  end
  else if (LblBase_Acrescida_COFINS.Caption <> '') then
  begin
    bc:= (StrToFloat(LblBase_Acrescida_COFINS.Caption) / 100) * StrToFloat(EdtValor_Total.Text);
    bc2:= StrToFloat(EdtValor_Total.Text) + bc;
    LblBC_COFINS.Caption:= FloatToStr(bc2);     //base

    if (LblCOFINS.Caption = 'I') or (LblCOFINS.Caption = 'N') or (LblCOFINS.Caption = 'F') then
    begin
      ali:= 0 * bc2;
      LblValor_COFINS.Caption:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(LblCOFINS.Caption) / 100) * bc2;
      LblValor_COFINS.Caption:= FloatToStr(ali);
    end;
  end
  else
  begin
    bc2:= StrToFloat(EdtValor_Total.Text);
    LblBC_COFINS.Caption:= FloatToStr(bc2);     //base

    if (LblCOFINS.Caption = 'I') or (LblCOFINS.Caption = 'N') or (LblCOFINS.Caption = 'F') then
    begin
      ali:= 0 * bc2;
      LblValor_COFINS.Caption:= FloatToStr(ali);
    end
    else
    begin
      ali:= (StrToFloat(LblCOFINS.Caption) / 100) * bc2;
      LblValor_COFINS.Caption:= FloatToStr(ali);
    end;
  end;
  //--------------------fim cofins--------------------------------//

  LblSub_Total_Liquido.Caption:= FloatToStr(StrToFloat(EdtValor_Total.Text) - StrToFloat(LblValor_ICMS.Caption) -
                                  StrToFloat(LblValor_COFINS.Caption) - StrToFloat(LblValor_PIS.Caption) -
                                  StrToFloat(LblValor_IPI.Caption));
end;

procedure TFrmPre_Venda.EdtValor_TotalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', ',', #08]) then
    key := #0
end;


procedure TFrmPre_Venda.Colega_Dados_R05;
begin
  //CapturaContadoresECF;
  //Captura_Ultimo_Item;

  //cod_pro:= codigo_produto;
  //descri:= descricao;
  qtde_vendida:= EdtQuantidade.Text;
  //unid:= LblUnidade.Caption;
  valor_unit:= EdtValor_Unitario.Text;
  desc_item:= EdtDesconto_Item.Text;
  acre_item:= EdtAcrecimo.Text;
  valor_total_item:= EdtValor_Total.Text;
  tot_par:= '';
  indicador_cancelamento_item:= 'N';
  qtde_cancelada:= '';
  valor_cancelado:= '';
  can_acre:= '0';
  //IAT:= qAux.FieldByName('Arred_Trunc').AsString;
  //IPPT:= qAux.FieldByName('Producao_Propria').AsString;
  casa_decimal_qtde:= '0';
  casa_decimal_val_un:= '2';
end;

procedure TFrmPre_Venda.EdtValor_UnitarioExit(Sender: TObject);
begin
  Verifica_Valor_Negativo(StrToFloat(EdtQuantidade.Text), EdtQuantidade);

  if (EdtValor_Unitario.Text = '') or (EdtValor_Unitario.Text = '0') or (StrToFloat(EdtValor_Unitario.Text) < 0) then
  begin
    Valor_Invalido;
    EdtValor_Unitario.SetFocus;
    abort;
  end
  else
  begin
    novo_valor_uni:= StrToFloat(EdtValor_Unitario.Text);
    total_valor_uni:= novo_valor_uni - var_uni;
    EdtValor_Unitario.Text:= FormatFloat('#0.0,0', var_uni);
    EdtValor_Unitario.Text:= StringReplace(EdtValor_Unitario.Text, ThousandSeparator, '', [rfReplaceAll]);
  end;
end;

procedure TFrmPre_Venda.EdtValor_UnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmPre_Venda.Escreve_Texto;
begin
  Edit2.Text:= 'Qtde Itens';
  Edit4.Text:= 'Total Produtos';
  Edit7.Text:= 'Peso Total';
  Edit3.Text:= 'Limite Crédito';
  Edit6.Text:= 'Limite Disp.';
  Edit8.Text:= 'Desconto';
  Edit5.Text:= 'Total do Pedido';
  Edit1.Text:= 'Limite de Desc.';
  Edit10.Text:= 'Limite Disp.';
  Edit11.Text:= 'Acréscimo';
  Edit13.Text:= 'Total Acr.';
  Edit9.Text:= 'Total Desc.';
  EdtQuantidade_Itens.Text:= '0';
  EdtTotal_Produtos.Text:= '0,00';
  EdtAcrecimo_Total.Text:= '0,00';
  EdtTotal_Desconto.Text:= '0,00';
  EdtTotal_Acrecimo.Text:= '0,00';
  EdtPeso_Total.Text:= '0,00';
  EdtLimite_Compra.Text:= '0,00';
  EdtLimite_Compra_Disponivel.Text:= '0,00';
  EdtLimite_Desconto.Text:= '0,00';
  EdtLimite_Desconto_Disponivel.Text:= '0,00';
  EdtDesconto.Text:= '0,00';
  EdtAcrecimo.Text:= '0,00';
  EdtDesconto_Item.Text:= '0,00';
  EdtTotal_Pedido.Text:= '0,00';
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmPre_Venda.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmPre_Venda.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (pode_fechar = true) then
    begin
      FrmPre_Venda.Free;
      FrmPre_Venda:= Nil;
      codigo_tabela_preco_ativo:= codigo_tabela_preco_padrao;
    end
    else
    begin
      Salve;
      Abort;
    end;
end;

procedure TFrmPre_Venda.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmPre_Venda);
  Util.Limpa_Campos(FrmPre_Venda);
  Escreve_Texto;
  pode_fechar:= false;
  qtde_itens:= 0;
  Util.Desabilita_Campos(FrmPre_Venda);
  PageControl2.TabIndex:= 0;
  Centraliza_Form(FrmPre_Venda);
  mescla:= false;
  pode_fechar:= true;
  Limpa_Labels;
end;

procedure TFrmPre_Venda.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmPre_Venda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      if (iniciado = true) then
      begin
        Mensagem_Venda_Andamento;
        abort;
      end;
      //UDeclaracao.n_item:= '';
      qtde_itens:= 0;
      Util.Habilita_Campos(FrmPre_Venda);
      Util.Limpa_Campos(FrmPre_Venda);
      Escreve_Texto;
      BBtnOrcamento.Enabled:= false;
      BBtnCopiar_Pedido.Enabled:= true;
      achei:= false;
      iniciado:= true;
      pode_fechar:= false;
      PageControl2.TabIndex:= 0;
      qryitens_venda.Close;
      UDeclaracao.pre_venda:= '';
      UDeclaracao.pedido:= '';
      CBVerifica.Checked:= true;
      //Gera_N_Pre_Venda;
      //Gera_Codigo_Lancamento;
      EdtN_Pedido.Text:= UDeclaracao.pre_venda;
      EdtCodigo.Text:= IntToStr(UDeclaracao.codigo);
      EdtN_Pedido.SetFocus;
      mescla:= false;
      Limpa_Labels;
    end;

  if (key = vk_f4) then
    begin
      Application.CreateForm(TFrmEscolha_Tabela_Preco, FrmEscolha_Tabela_Preco);
      FrmEscolha_Tabela_Preco.ShowModal;
      FrmEscolha_Tabela_Preco.Free;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmPre_Venda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmPre_Venda.Limpa_Menor;
begin
  EdtCodigo_Produto.Clear;
  EdtProduto.Clear;
  EdtUnidade.Clear;
  EdtQuantidade.Clear;
  EdtValor_Unitario.Clear;
  EdtValor_Total.Clear;
  EdtST.Clear;
  EdtAcrecimo.Text:= '0,00';
  EdtDesconto_Item.Text:= '0,00';
  LblProduto.Caption:= '';
  LblTipo.Caption:= '';
  LblBC.Caption:= '';
  EdtCodigo_Produto.SetFocus;

  Limpa_Labels;
end;

procedure TFrmPre_Venda.Limpa_Labels;
begin
  LblICMS.Caption:= '';
  LblCST.Caption:= '';
  LblBase_Reduzida.Caption:= '';
  LblBase_Acrescida.Caption:= '';
  LblBC.Caption:= '';
  LblValor_ICMS.Caption:= '';

  LblIPI.Caption:= '';
  LblCST_IPI.Caption:= '';
  LblBase_Reduzida_IPI.Caption:= '';
  LblBase_Acrescida_IPI.Caption:= '';
  LblBC_IPI.Caption:= '';
  LblValor_IPI.Caption:= '';

  LblPIS.Caption:= '';
  LblCST_PIS.Caption:= '';
  LblBase_Reduzida_PIS.Caption:= '';
  LblBase_Acrescida_PIS.Caption:= '';
  LblBC_PIS.Caption:= '';
  LblValor_PIS.Caption:= '';

  LblCOFINS.Caption:= '';
  LblCST_COFINS.Caption:= '';
  LblBase_Reduzida_COFINS.Caption:= '';
  LblBase_Acrescida_COFINS.Caption:= '';
  LblBC_COFINS.Caption:= '';
  LblValor_COFINS.Caption:= '';

  LblSub_Total_Liquido.Caption:= '';
end;
procedure TFrmPre_Venda.MEdtData_Previsao_EntregaEnter(Sender: TObject);
begin
  MEdtData_Previsao_Entrega.Text:= DateToStr(date);
end;

procedure TFrmPre_Venda.MEdtData_VendaEnter(Sender: TObject);
begin
  MEdtData_Venda.Text:= DateToStr(date);
end;

procedure TFrmPre_Venda.MEdtHora_EntregaEnter(Sender: TObject);
begin
  MEdtHora_Entrega.Text:= TimeToStr(Now);
end;

procedure TFrmPre_Venda.Verifica_Permissao;
begin
  if (EdtCodigo_Cliente.Text = '') then
  begin
    UDeclaracao.Mensagem_Falta_Dados;
    EdtCodigo_Cliente.SetFocus;
    abort;
  end;

  if (LblTipo.Caption = '1') then
  begin
    Application.MessageBox('Não é permitido lançar serviços na pré-venda.', 'Operação não permitida', MB_OK+MB_ICONHAND);
    Limpa_Menor;
    abort;
  end;

end;

procedure TFrmPre_Venda.Verifica_Produto_Lancado;
begin
  if not qryitens_venda.IsEmpty then
  begin
    if (qryitens_venda.Locate('Codigo;Codigo_Produto;Cancelado', VarArrayOf([StrToInt(EdtCodigo.Text), StrToInt(LblProduto.Caption), 'N']), [])) then
    begin
      Produto_Ja_Lancamento_Venda;
      EdtCodigo_Produto.SetFocus;
      abort;
    end;
  end;
end;

procedure TFrmPre_Venda.Ver_Pedido;
var
  limite_compra_disponivel: double;
begin
  EdtCodigo_Cliente.Text:= qAux.FieldByName('Codigo_Cliente').AsString;
  EdtCliente.Text:= qAux.FieldByName('Nome_Nome_Fantasia').AsString;

  MEdtData_Venda.Text:= qAux.FieldByName('Data_Venda').AsString;
  MEdtData_Previsao_Entrega.Text:= qAux.FieldByName('Data_Previsao_Entrega').AsString;
  MEdtHora_Entrega.Text:= qAux.FieldByName('Hora_Entrega').AsString;

  EdtQuantidade_Itens.Text:= qAux.FieldByName('Qtde_Itens').AsString;

  EdtTotal_Produtos.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Total_Produtos').AsFloat);
  EdtTotal_Produtos.Text:= StringReplace(EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtPeso_Total.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Peso_Total').AsFloat);
  EdtPeso_Total.Text:= StringReplace(EdtPeso_Total.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtDesconto.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Desconto').AsFloat);
  EdtDesconto.Text:= StringReplace(EdtDesconto.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Total_Pedido').AsFloat);
  EdtTotal_Pedido.Text:= StringReplace(EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);

  with qAux2, sql do
  begin
    close;
    clear;
    add('select Cli.*, Ci.Descricao, Ci.UF, Se.Descricao, L.Descricao, L.Tipo_Logradouro from Cliente Cli');
    add('left join Cidade Ci on (Cli.Codigo_Cidade = Ci.Codigo)');
    add('left join Setor Se on (Cli.Codigo_Setor = Se.Codigo)');
    add('left join Logradouro L on (Cli.Codigo_Logradouro = L.Codigo)');
    add('where Cli.Codigo = :Cliente');
    Parameters.ParamByName('Cliente').Value:= StrToInt(EdtCodigo_Cliente.Text);
    open;
  end;

  if (qAux2.FieldByName('CPF').AsString <> '') then
    FrmPre_Venda.LblCPF.Caption:= qAux2.FieldByName('CPF').AsString
  else if (qAux2.FieldByName('CNPJ').AsString <> '') then
    FrmPre_Venda.LblCPF.Caption:= qAux2.FieldByName('CNPJ').AsString
  else
    FrmPre_Venda.LblCPF.Caption:= '';

  FrmPre_Venda.LblCidade.Caption:= qAux2.FieldByName('Descricao').AsString;
  FrmPre_Venda.LblSetor.Caption:= qAux2.FieldByName('Descricao_1').AsString;
  FrmPre_Venda.LblEndereco.Caption:= qAux2.FieldByName('Descricao_2').AsString;
  FrmPre_Venda.LblTipo_Logradouro.Caption:= qAux2.FieldByName('Tipo_Logradouro').AsString;
  FrmPre_Venda.LblUF.Caption:= qAux2.FieldByName('UF').AsString;
  FrmPre_Venda.LblTelefone.Caption:= qAux2.FieldByName('Telefone').AsString;
  FrmPre_Venda.LblNumero.Caption:= qAux2.FieldByName('Numero').AsString;

  EdtLimite_Compra.Text:= FormatFloat('#0.0,0', qAux2.FieldByName('Limite_Credito').AsFloat);
  EdtLimite_Compra.Text:= StringReplace(EdtLimite_Compra.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtLimite_Desconto.Text:= FormatFloat('#0.0,0', qAux2.FieldByName('Limite_Desconto').AsFloat);
  EdtLimite_Desconto.Text:= StringReplace(EdtLimite_Desconto.Text, ThousandSeparator, '', [rfReplaceAll]);

  limite_compra_disponivel:= StrToFloat(EdtLimite_Compra.Text) - StrToFloat(EdtTotal_Pedido.Text);

  EdtLimite_Compra_Disponivel.Text:= FormatFloat('#0.0,0', limite_compra_disponivel);
  EdtLimite_Compra_Disponivel.Text:= StringReplace(EdtLimite_Compra_Disponivel.Text, ThousandSeparator, '', [rfReplaceAll]);

  BBtnOrcamento.Enabled:= true;
end;

end.
