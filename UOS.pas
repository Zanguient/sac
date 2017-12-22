unit UOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls, Provider, DBClient, RSPrint, Buttons, StrUtils;

type
  TFrmOS = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ImgImagens_Comandos: TImageList;
    EdtCodigo: TEdit;
    MEdtData_Entrada: TMaskEdit;
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
    TlbFerramentas: TToolBar;
    BBtnFechar: TToolButton;
    BalloonHint1: TBalloonHint;
    LblProduto: TLabel;
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
    BBtnSalvar_OS: TToolButton;
    TabSheet4: TTabSheet;
    EdtCodigo_Veiculo: TEdit;
    EdtVeiculo: TEdit;
    LblVeiculo: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    LblServico: TLabel;
    Label21: TLabel;
    DBGrid2: TDBGrid;
    EdtCodigo_Servico: TEdit;
    EdtServico: TEdit;
    EdtValor_Servico: TEdit;
    EdtValor_Total_Servico: TEdit;
    EdtDesconto_Servico: TEdit;
    DataSource1: TDataSource;
    qryitens_os: TADOQuery;
    LblMarca: TLabel;
    LblModelo: TLabel;
    LblAno: TLabel;
    LblPlaca: TLabel;
    LblRenavam: TLabel;
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
    qryvendaTotal_Desconto: TFloatField;
    qryvendaTotal_Acrecimo: TFloatField;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    MMOProblema_Reclamado: TMemo;
    MMOProblema_Constatado: TMemo;
    Label3: TLabel;
    MMOSolucao: TMemo;
    Label4: TLabel;
    Edit2: TEdit;
    EdtQuantidade_Itens: TEdit;
    EdtTotal_Produtos: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    EdtLimite_Compra: TEdit;
    Edit6: TEdit;
    EdtLimite_Compra_Disponivel: TEdit;
    EdtDesconto: TEdit;
    Edit8: TEdit;
    Edit5: TEdit;
    EdtTotal_Pedido: TEdit;
    Edit1: TEdit;
    EdtLimite_Desconto: TEdit;
    Edit10: TEdit;
    EdtLimite_Desconto_Disponivel: TEdit;
    EdtAcrecimo_Total: TEdit;
    Edit11: TEdit;
    EdtTotal_Acrecimo: TEdit;
    Edit13: TEdit;
    Edit9: TEdit;
    EdtTotal_Desconto: TEdit;
    Edit12: TEdit;
    EdtQuantidade_Servicos: TEdit;
    EdtTotal_Servicos: TEdit;
    Edit18: TEdit;
    Label10: TLabel;
    EdtCodigo_Funcionario: TEdit;
    EdtFuncionario: TEdit;
    Label17: TLabel;
    Label20: TLabel;
    EdtUnidade_Servico: TEdit;
    EdtST_Servico: TEdit;
    Label22: TLabel;
    EdtDAV_Anterior: TEdit;
    LblPIS: TLabel;
    LblCST_PIS: TLabel;
    LblBase_Reduzida_PIS: TLabel;
    LblBase_Acrescida_PIS: TLabel;
    LblBC_PIS: TLabel;
    LblICMS: TLabel;
    LblCST: TLabel;
    LblBase_Reduzida: TLabel;
    LblBase_Acrescida: TLabel;
    LblBC: TLabel;
    LblIPI: TLabel;
    LblCST_IPI: TLabel;
    LblBase_Reduzida_IPI: TLabel;
    LblBase_Acrescida_IPI: TLabel;
    LblBC_IPI: TLabel;
    LblBC_COFINS: TLabel;
    LblBase_Acrescida_COFINS: TLabel;
    LblBase_Reduzida_COFINS: TLabel;
    LblCST_COFINS: TLabel;
    LblCOFINS: TLabel;
    LblValor_ICMS: TLabel;
    LblValor_COFINS: TLabel;
    LblValor_PIS: TLabel;
    LblValor_IPI: TLabel;
    LblSub_Total_Liquido: TLabel;
    qryitens_vendaCodigo: TIntegerField;
    qryitens_vendaN_Item: TStringField;
    qryitens_vendaCodigo_Produto: TIntegerField;
    qryitens_vendaUN: TStringField;
    qryitens_vendaICMS: TStringField;
    qryitens_vendaCST: TStringField;
    qryitens_vendaBase_Reduzida: TStringField;
    qryitens_vendaBase_Acrescida: TStringField;
    qryitens_vendaBC: TStringField;
    qryitens_vendaValor_ICMS: TFloatField;
    qryitens_vendaIPI: TStringField;
    qryitens_vendaCST_IPI: TStringField;
    qryitens_vendaBase_Reduzida_IPI: TStringField;
    qryitens_vendaBase_Acrescida_IPI: TStringField;
    qryitens_vendaBC_IPI: TStringField;
    qryitens_vendaValor_IPI: TFloatField;
    qryitens_vendaPIS: TStringField;
    qryitens_vendaCST_PIS: TStringField;
    qryitens_vendaBase_Reduzida_PIS: TStringField;
    qryitens_vendaBase_Acrescida_PIS: TStringField;
    qryitens_vendaBC_PIS: TStringField;
    qryitens_vendaValor_PIS: TFloatField;
    qryitens_vendaCOFINS: TStringField;
    qryitens_vendaCST_COFINS: TStringField;
    qryitens_vendaBase_Reduzida_COFINS: TStringField;
    qryitens_vendaBase_Acrescida_COFINS: TStringField;
    qryitens_vendaBC_COFINS: TStringField;
    qryitens_vendaValor_COFINS: TFloatField;
    qryitens_vendaQtde: TFloatField;
    qryitens_vendaQtde_Entregue: TFloatField;
    qryitens_vendaQtde_Restante: TFloatField;
    qryitens_vendaValor_Unitario: TFloatField;
    qryitens_vendaDesconto: TFloatField;
    qryitens_vendaTipo_Desconto: TStringField;
    qryitens_vendaAcrecimo: TFloatField;
    qryitens_vendaTipo_Acrecimo: TStringField;
    qryitens_vendaSub_Total: TFloatField;
    qryitens_vendaSub_Total_Liquido: TFloatField;
    qryitens_vendaCancelado: TStringField;
    qryitens_vendaCodigo_Venda: TStringField;
    qryitens_vendaDescricao: TStringField;
    qryitens_vendaTipo: TIntegerField;
    qryitens_osCodigo: TIntegerField;
    qryitens_osN_Item: TStringField;
    qryitens_osCodigo_Produto: TIntegerField;
    qryitens_osUN: TStringField;
    qryitens_osICMS: TStringField;
    qryitens_osCST: TStringField;
    qryitens_osBase_Reduzida: TStringField;
    qryitens_osBase_Acrescida: TStringField;
    qryitens_osBC: TStringField;
    qryitens_osValor_ICMS: TFloatField;
    qryitens_osIPI: TStringField;
    qryitens_osCST_IPI: TStringField;
    qryitens_osBase_Reduzida_IPI: TStringField;
    qryitens_osBase_Acrescida_IPI: TStringField;
    qryitens_osBC_IPI: TStringField;
    qryitens_osValor_IPI: TFloatField;
    qryitens_osPIS: TStringField;
    qryitens_osCST_PIS: TStringField;
    qryitens_osBase_Reduzida_PIS: TStringField;
    qryitens_osBase_Acrescida_PIS: TStringField;
    qryitens_osBC_PIS: TStringField;
    qryitens_osValor_PIS: TFloatField;
    qryitens_osCOFINS: TStringField;
    qryitens_osCST_COFINS: TStringField;
    qryitens_osBase_Reduzida_COFINS: TStringField;
    qryitens_osBase_Acrescida_COFINS: TStringField;
    qryitens_osBC_COFINS: TStringField;
    qryitens_osValor_COFINS: TFloatField;
    qryitens_osQtde: TFloatField;
    qryitens_osQtde_Entregue: TFloatField;
    qryitens_osQtde_Restante: TFloatField;
    qryitens_osValor_Unitario: TFloatField;
    qryitens_osDesconto: TFloatField;
    qryitens_osTipo_Desconto: TStringField;
    qryitens_osAcrecimo: TFloatField;
    qryitens_osTipo_Acrecimo: TStringField;
    qryitens_osSub_Total: TFloatField;
    qryitens_osSub_Total_Liquido: TFloatField;
    qryitens_osCancelado: TStringField;
    qryitens_osCodigo_Venda: TStringField;
    qryitens_osDescricao: TStringField;
    qryitens_osTipo: TIntegerField;
    Panel1: TPanel;
    LblCodigo_Anterior: TLabel;
    MMODAV_Anterior: TMemo;
    LblTipo: TLabel;
    LblTipo_Servico: TLabel;
    CBFechar: TCheckBox;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtData_EntradaEnter(Sender: TObject);
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
    procedure Limpa_Menor_Servico;
    procedure Calcula_Total;
    procedure Calcula_Total_Servico;
    procedure Calcula_Total_Deletado;
    procedure Calcula_Total_Deletado_Servico;
    procedure EdtValor_TotalEnter(Sender: TObject);
    procedure EdtValor_UnitarioExit(Sender: TObject);
    procedure EdtQuantidadeExit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Atualiza_Dados;
    procedure Atualiza_Dados_Anterior;
    procedure Atualiza_Dados_OS;
    procedure Atualiza_Dados_OS_Anterior;
    function Chama_Pedido: boolean;
    procedure Ver_Pedido;
    procedure EdtN_PedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtDesconto_ItemExit(Sender: TObject);
    procedure DAV_OS_Modelo_1;
    procedure DAV_OS_Modelo_2;
    procedure BBtnCopiar_PedidoClick(Sender: TObject);
    procedure EdtValor_Total_ServicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ServicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnSalvar_OSClick(Sender: TObject);
    procedure EdtValor_Total_ServicoEnter(Sender: TObject);
    procedure EdtCodigo_VeiculoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtValor_ServicoExit(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtDesconto_ServicoExit(Sender: TObject);
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
    procedure EdtCodigo_FuncionarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_VeiculoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtVeiculoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_FuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ServicoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtServicoKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtValor_ServicoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDesconto_ServicoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValor_Total_ServicoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDAV_AnteriorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    pode, pode_fechar: boolean;
    Pedido: URegistro.TPedido;
    Itens_Pedido: URegistro.TItens_Pedido;
    Itens_OS: URegistro.TItens_OS;
    Util: TUtil;
    qtde_itens, qtde_servicos: integer;
    R05: URegistro.TR05;
    procedure Colega_Dados_R05;
    procedure Colega_Dados_R05_OS;
    procedure Desabilita_Itens;
    procedure Atualiza_Itens;
    procedure Atualiza_Itens_OS;
    procedure Verifica_Produto_Lancado;
    procedure Verifica_Servico_Lancado;
    procedure Limpa_Labels;
    procedure Calcula_Imposto;
    procedure Calcula_Imposto_Servico;
    procedure Salva_Produtos;
    procedure Salva_OS;
    procedure Verifica_Permissao;
    procedure Verifica_Permissao_Servico;
  public
    ativo, achei, iniciado: boolean;
    acre_item, indicador_cancelamento_item, casa_decimal_qtde, casa_decimal_val_un, cod_pro, desc_item,
    descri, IAT, IPPT, qtde_vendida, qtde_cancelada, unid, valor_cancelado, can_acre, valor_total_item,
    valor_unit, descricao_servico, dav_ant: AnsiString;
    cod_servico, cod_produto: integer;
    var_uni, novo_valor_uni, total_limite, total_valor_uni, perc_desc: double;
  protected
    function Confira_Pedido: boolean;
    function Confira_Itens_Pedido: boolean;
    function Confira_Itens_Pedido_OS: boolean;
  end;

var
  FrmOS: TFrmOS;
implementation

uses UDM, UChama_Produto, UChama_Cliente, UChama_Condicao_Pagamento,
  UDeclaracao, UChama_Pedido, UChama_Servico, UChama_Veiculo, UMenu_Geral,
  UChama_Funcionario, UEscolha_Tabela_Preco;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmOS.Atualiza_Dados;
begin
  with qryitens_venda, sql do
  begin
    close;
    clear;
    add('select IP.*, P.Codigo_Venda, P.Descricao, P.Tipo from Itens_Pedido IP');
    add('inner join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('where IP.Codigo = :Codigo and P.Tipo = :Tipo');
    Parameters.ParamByName('Codigo').Value:= EdtCodigo.Text;
    Parameters.ParamByName('Tipo').Value:= 0;
    open;
  end;
end;

procedure TFrmOS.BBtnCancelarClick(Sender: TObject);
begin
  //Itens_Pedido.Excluir(Itens_Pedido);
  //Itens_OS.Excluir(Itens_OS);
  R05.Excluir(R05);
  qryitens_venda.Close;
  qryitens_os.Close;
  Util.Limpa_Campos(FrmOS);
  Escreve_Texto;
  Util.Desabilita_Campos(FrmOS);
  BBtnSalvar_OS.Enabled:= false;
end;

procedure TFrmOS.BBtnCopiar_PedidoClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Pedido, FrmChama_Pedido);
  FrmChama_Pedido.ShowModal;
  FrmChama_Pedido.Free;
end;

procedure TFrmOS.BBtnExcluirClick(Sender: TObject);
begin
  //Pedido.Excluir(Pedido);
  //Itens_Pedido.Excluir(Itens_Pedido);
  Util.Desabilita_Campos(FrmOS);
end;

procedure TFrmOS.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmOS.BBtnSalvar_OSClick(Sender: TObject);
begin
  tipo_venda:= 'DAV-OS';
  if (achei = false) then
    begin
      if (Confira_Pedido = true) then
      begin
        //Pedido.Salva_Banco(Pedido);
        Pedido_Gerado;
        UDeclaracao.Insere_Historico(usuario, 'REALIZOU REGISTRO DE O.S ' + EdtN_Pedido.Text + '.', TimeToStr(time), insercao, date);
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
    Insere_Pedido_Aux(EdtN_Pedido.Text, '', StrToDateTime(MEdtData_Entrada.Text), StrToFloat(EdtTotal_Pedido.Text));
    BBtnSalvar_OS.Enabled:= false;
    pode_fechar:= true;
    iniciado:= false;
    Util.Desabilita_Campos(FrmOS);
    codigo_tabela_preco_ativo:= codigo_tabela_preco_padrao;

    if (modelo_os = '0101') then
      DAV_OS_Modelo_1
    else if (modelo_os = '0202') then
      DAV_OS_Modelo_2;
end;

procedure TFrmOS.Calcula_Total;
var
  sub_total, total_produtos, peso_total, desconto, total_pedido, limite_compra, limite_compra_disponivel,
  total_desconto, total_acrecimo, tot_des, tot_acre, limite_desconto, desconto_item: double;

  qtde_itens: integer;
begin
  qtde_itens:= StrToInt(EdtQuantidade_Itens.Text);
  sub_total:= StrToFloat(EdtValor_Total.Text);
  limite_compra:= StrToFloat(EdtLimite_Compra.Text);
  total_acrecimo:= StrToFloat(EdtTotal_Acrecimo.Text);
  limite_desconto:= StrToFloat(EdtLimite_Desconto_Disponivel.Text);
  desconto_item:= StrToFloat(EdtDesconto_Item.Text);
  total_desconto:= StrToFloat(EdtTotal_Desconto.Text);

  tot_des:= total_desconto + StrToFloat(EdtDesconto_Item.Text);
  tot_acre:= total_acrecimo + StrToFloat(EdtAcrecimo.Text);

  //verifica se chegou no limite do desconto
  total_limite:= limite_desconto - desconto_item;
  if (Verifica_Desconto(total_limite) = false) then
    abort;

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

procedure TFrmOS.Calcula_Total_Deletado;
var
  sub_total, total_produtos, peso_total, desconto, total_pedido,
  limite_compra, limite_compra_disponivel, acrecimo, limite_desconto: double;

  qtde_itens: integer;
begin
  qtde_itens:= StrToInt(EdtQuantidade_Itens.Text);
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

  if (StrToFloat(EdtLimite_Compra_Disponivel.Text) < 0) then
    EdtLimite_Compra_Disponivel.Font.Color:= clRed
  else
    EdtLimite_Compra_Disponivel.Font.Color:= clBlack;

end;

procedure TFrmOS.Calcula_Total_Deletado_Servico;
var
  sub_total, total_servicos, total_pedido, limite_compra_disponivel: double;
  qtde_itens: integer;
begin
  qtde_itens:= StrToInt(EdtQuantidade_Servicos.Text);
  limite_compra_disponivel:= StrToFloat(EdtLimite_Compra_Disponivel.Text);

  Dec(qtde_itens);
  EdtQuantidade_Servicos.Text:= IntToStr(qtde_itens);

  sub_total:= qryitens_osSub_Total.AsFloat;
  total_servicos:= StrToFloat(EdtTotal_Servicos.Text) - sub_total;
  EdtTotal_Servicos.Text:= FormatFloat('#0.0,0', total_servicos);
  EdtTotal_Servicos.Text:= StringReplace(EdtTotal_Servicos.Text, ThousandSeparator, '', [rfReplaceAll]);

  total_pedido:= StrToFloat(EdtTotal_Pedido.Text) - sub_total;
  EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', total_pedido);
  EdtTotal_Pedido.Text:= StringReplace(EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);
  //aqui

  EdtLimite_Desconto_Disponivel.Text:= FormatFloat('#0.0,0', (StrToFloat(EdtLimite_Desconto_Disponivel.Text) + qryitens_osDesconto.AsFloat));
  EdtLimite_Desconto_Disponivel.Text:= StringReplace(EdtLimite_Desconto_Disponivel.Text, ThousandSeparator, '', [rfReplaceAll]);

  if (StrToFloat(EdtLimite_Desconto_Disponivel.Text) < 0) then
    EdtLimite_Desconto_Disponivel.Font.Color:= clRed
  else
    EdtLimite_Desconto_Disponivel.Font.Color:= clBlack;

  EdtTotal_Desconto.Text:= FormatFloat('#0.0,0', StrToFloat(EdtTotal_Desconto.Text) - qryitens_osDesconto.AsFloat);
  EdtTotal_Desconto.Text:= StringReplace(EdtTotal_Desconto.Text, ThousandSeparator, '', [rfReplaceAll]);

  limite_compra_disponivel:= limite_compra_disponivel + qryitens_osSub_Total.AsFloat;
  EdtLimite_Compra_Disponivel.Text:= FormatFloat('#0.0,0', limite_compra_disponivel);
  EdtLimite_Compra_Disponivel.Text:= StringReplace(EdtLimite_Compra_Disponivel.Text, ThousandSeparator, '', [rfReplaceAll]);

  if (StrToFloat(EdtLimite_Compra_Disponivel.Text) < 0) then
    EdtLimite_Compra_Disponivel.Font.Color:= clRed
  else
    EdtLimite_Compra_Disponivel.Font.Color:= clBlack;
end;

procedure TFrmOS.Calcula_Total_Servico;
var
  sub_total, total_servico, total_pedido, total_limite, limite_desconto, desconto_item,
  limite_compra_disponivel, limite_compra, total_desconto, tot_des: double;  //

  qtde_itens: integer;
begin
  qtde_itens:= StrToInt(EdtQuantidade_Servicos.Text);
  sub_total:= StrToFloat(EdtValor_Total_Servico.Text);
  limite_compra:= StrToFloat(EdtLimite_Compra.Text);
  limite_desconto:= StrToFloat(EdtLimite_Desconto_Disponivel.Text);
  desconto_item:= StrToFloat(EdtDesconto_Servico.Text);
  total_desconto:= StrToFloat(EdtTotal_Desconto.Text);

  tot_des:= total_desconto + desconto_item;

  total_limite:= limite_desconto - desconto_item;
  if (Verifica_Desconto(total_limite) = false) then
    abort;

  inc(qtde_itens);
  EdtQuantidade_Servicos.Text:= IntToStr(qtde_itens);

  EdtLimite_Desconto_Disponivel.Text:= FormatFloat('#0.0,0', total_limite);
  EdtLimite_Desconto_Disponivel.Text:= StringReplace(EdtLimite_Desconto_Disponivel.Text, ThousandSeparator, '', [rfReplaceAll]);

  if (StrToFloat(EdtLimite_Desconto_Disponivel.Text) < 0) then
    EdtLimite_Desconto_Disponivel.Font.Color:= clRed
  else
    EdtLimite_Desconto_Disponivel.Font.Color:= clBlack;

  EdtTotal_Desconto.Text:= FormatFloat('#0.0,0', tot_des);
  EdtTotal_Desconto.Text:= StringReplace(EdtTotal_Desconto.Text, ThousandSeparator, '', [rfReplaceAll]);

  total_servico:= StrToFloat(EdtTotal_Servicos.Text) + sub_total;
  EdtTotal_Servicos.Text:= FormatFloat('#0.0,0', total_servico);
  EdtTotal_Servicos.Text:= StringReplace(EdtTotal_Servicos.Text, ThousandSeparator, '', [rfReplaceAll]);

  total_pedido:= StrToFloat(EdtTotal_Pedido.Text) + sub_total;
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

function TFrmOS.Chama_Pedido: boolean;
var
  i, i2: integer;
  dav_ant_aux: AnsiString;
begin
  qAux:= TADOQuery.Create(self);
  with qAux, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('Select P.*, Cli.Nome_Nome_Fantasia, V.Veiculo, V.Ano_Fabricacao,');
    add('V.Placa, V.Chassi, V.Renavam, M.Descricao, Fun.Nome from Pedido P');
    add('inner join Cliente Cli on (Cli.Codigo = P.Codigo_Cliente)');
    add('inner join Veiculo V on (V.Codigo = P.Codigo_Veiculo)');
    add('inner join Marca M on (M.Codigo = V.Codigo_Marca)');
    add('inner join Funcionario Fun on (P.Codigo_Funcionario = Fun.Codigo)');
    add('where P.N_Pedido = :Pedido and P.Tipo = :Tipo and P.Status = :Status');
    Parameters.ParamByName('Pedido').Value:= EdtDAV_Anterior.Text;
    Parameters.ParamByName('Tipo').Value:= 'DAV-OS';
    Parameters.ParamByName('Status').Value:= 'PENDENTE';
    open;
  end;

  if (qAux.IsEmpty = false) then
  begin
    LblCodigo_Anterior.Caption:= qAux.FieldByName('Codigo').AsString;
    Result:= true;

    if (qAux.Locate('N_Pedido', EdtDAV_Anterior.Text, [])) then
    begin
      if (qAux.FieldByName('DAVAnt').AsString = '') then
        dav_ant:= EdtDAV_Anterior.Text
      else
        dav_ant:= qAux.FieldByName('DAVAnt').AsString + ',' + EdtDAV_Anterior.Text;
    end
    else
      dav_ant:= '';

    {for i := 0 to Length(dav_ant) do
    begin
      if (dav_ant[i] <> ',') then
      begin
        dav_ant_aux:= dav_ant[i];
        MMODAV_Anterior.Text:= MMODAV_Anterior.Text + dav_ant_aux;
      end
      else
        MMODAV_Anterior.Text:= MMODAV_Anterior.Text + #10+#13;
    end; }
    for i := 0 to Length(dav_ant) do
    begin
      if (dav_ant[i] <> ',') then
      begin
        dav_ant_aux:= dav_ant[i];
        MMODAV_Anterior.Text:= MMODAV_Anterior.Text + dav_ant_aux;
      end
      else
        MMODAV_Anterior.Text:= MMODAV_Anterior.Text + dav_ant[i] + #10+#13;
    end;

  end
  else
    Result:= false;
end;

function TFrmOS.Confira_Itens_Pedido: boolean;
begin
  Confira_Itens_Pedido:= false;

  if (EdtCodigo_Cliente.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Cliente.SetFocus;
    abort;
  end;

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

function TFrmOS.Confira_Itens_Pedido_OS: boolean;
begin
  Confira_Itens_Pedido_OS:= false;

  if (EdtCodigo_Cliente.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Cliente.SetFocus;
    abort;
  end;

  if (EdtCodigo_Servico.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Servico.SetFocus;
    abort;
  end;

  if (EdtValor_Servico.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtValor_Servico.SetFocus;
    abort;
  end;

  if (EdtDesconto_Servico.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtDesconto_Servico.SetFocus;
    abort;
  end;
  Confira_Itens_Pedido_OS:= true;
end;

function TFrmOS.Confira_Pedido: boolean;
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

  if (EdtCodigo_Funcionario.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Funcionario.SetFocus;
    abort;
  end;

  if (MEdtData_Entrada.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    MEdtData_Entrada.SetFocus;
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

procedure TFrmOS.DAV_OS_Modelo_1;
var
  i, i2, linha: integer;
  dav, dav2, tipo_rel, rodape: string;
  cn, cp: string;
begin
  rs.BeginDoc;
  i:= 0;
  i2:= 136;

  dav:= 'NÃO É DOCUMENTO FISCAL - NÃO É VÁLIDO COMO RECIBO E COMO GARANTIA DE MERCADORIA - ';
  dav2:= 'NÃO COMPROVA PAGAMENTO';
  tipo_rel:= 'DOCUMENTO AUXILIAR DE VENDA - ORDEM DE SERVIÇO';

  rs.WriteFont(1, Alinha_Centro(tipo_rel,i2),tipo_rel, [Bold] + [DobleWide]);
  rs.WriteFont(2, Alinha_Centro(dav,i2), dav, [Bold] + [DobleWide]);
  rs.WriteFont(3, Alinha_Centro(dav2,i2), dav2, [Bold] + [DobleWide]);

  for i := 0 to i2 do
    rs.Write(4,i,'-');

  cn:= Copy(cnpj,1,2)+'.'+Copy(cnpj,3,3)+'.'+Copy(cnpj,6,3)+'/'+
    Copy(cnpj,9,4)+'-'+Copy(cnpj,13,2);

  cp:= Copy(LblCPF.Caption,1,3)+'.'+Copy(LblCPF.Caption,4,3)+'.'+Copy(LblCPF.Caption,7,3)+'-'+
    Copy(LblCPF.Caption,10,2);

  rs.Write(5,0, 'Denominação');
  rs.Write(5,50, 'CNPJ');
  rs.Write(6,0, nome_fantasia);
  rs.Write(6,50, cn);

  i:= 1;
  for i := 0 to i2 do
    rs.Write(7,i,'-');

  rs.Write(8,0, 'Identificação do Destinatário');
  rs.Write(8,50, 'CPF/CNPJ');
  rs.Write(9,0, EdtCliente.Text);
  rs.Write(9,50, cp);

  i:= 1;
  for i := 0 to i2 do
    rs.Write(10,i,'-');
  rs.Write(11,0, 'Veículo: ' + EdtVeiculo.Text); rs.Write(11,60, 'Renavam: ' + LblRenavam.Caption);
  rs.Write(12,0, 'Marca: ' + LblMarca.Caption); rs.Write(12,30, 'Modelo: ' + LblModelo.Caption + ' - ' + LblAno.Caption);
  rs.Write(13, 0, 'Placa: ' + LblPlaca.Caption);

  i:= 1;
  for i := 0 to i2 do
    rs.Write(14,i, '-');

  rs.Write(15,0, 'Número do Documento: ' + EdtN_Pedido.Text);
  rs.Write(15, 40, 'Número do Documento Fiscal: ' + '');

  i:= 1;
  for i := 0 to i2 do
    rs.Write(16,i, '-');

  rs.WriteFont(18,0,'Produtos', [Underline]);
  rs.WriteFont(19,0,'Código Produto', [Underline]);
  rs.WriteFont(19, 16, 'Descrição', [Underline]);
  rs.WriteFont(19, 60, 'Un.', [Underline]);
  rs.WriteFont(19, 66, 'Qtde.', [Underline]);
  rs.WriteFont(19, 74, 'Valor Un.', [Underline]);
  rs.WriteFont(19, 85, 'Desc.', [Underline]);
  rs.WriteFont(19, 95, 'Acr.', [Underline]);
  rs.WriteFont(19, 105, 'Valor Total', [Underline]);
  rs.WriteFont(19, 120, 'Canc.', [Underline]);

  with qryitens_venda, sql do
  begin
    close;
    clear;
    add('select IP.*, P.Codigo_Venda, P.Descricao, P.Tipo, UM.Sigla as Unidade from Itens_Pedido IP');
    add('inner join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
    add('where IP.Codigo = :Codigo and P.Tipo = :Tipo');
    Parameters.ParamByName('Codigo').Value:= EdtCodigo.Text;
    Parameters.ParamByName('Tipo').Value:= 0;
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
    rs.Write(linha, 95, FormatFloat('#0.0,0', qryitens_vendaAcrecimo.AsFloat));
    rs.Write(linha, 105, FormatFloat('#0.0,0', qryitens_vendaSub_Total.AsFloat));
    rs.Write(linha, 120, qryitens_vendaCancelado.AsString);
    Inc(linha);
    qryitens_venda.Next;
  end;

  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha,i, '-');

  linha:= linha + 1;
  rs.WriteFont(linha,0,'Serviços', [Underline]);
  linha:= linha + 2;
  rs.WriteFont(linha,0,'Código Serviço', [Underline]);
  rs.WriteFont(linha, 16, 'Descrição', [Underline]);
  rs.WriteFont(linha, 74, 'Valor Un.', [Underline]);
  rs.WriteFont(linha, 85, 'Desc.', [Underline]);
  rs.WriteFont(linha, 92, 'Valor Total', [Underline]);
  rs.WriteFont(linha, 105, 'Canc.', [Underline]);

  with qryitens_os, sql do
  begin
    close;
    clear;
    add('select IP.*, P.Codigo_Venda, P.Descricao, P.Tipo, UM.Sigla as Unidade from Itens_Pedido IP');
    add('inner join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
    add('where IP.Codigo = :Codigo and P.Tipo = :Tipo');
    Parameters.ParamByName('Codigo').Value:= EdtCodigo.Text;
    Parameters.ParamByName('Tipo').Value:= 1;
    open;
    First;
  end;

  linha:= linha + 2;
  while not qryitens_os.Eof do
  begin
    rs.Write(linha, 0, qryitens_osCodigo_Venda.AsString);
    rs.Write(linha, 16, qryitens_osDescricao.AsString);
    rs.Write(linha, 74, FormatFloat('#0.0,0', qryitens_osValor_Unitario.AsFloat));
    rs.Write(linha, 85, FormatFloat('#0.0,0', qryitens_osDesconto.AsFloat));
    rs.Write(linha, 92, FormatFloat('#0.0,0', qryitens_osSub_Total.AsFloat));
    rs.Write(linha, 105, qryitens_osCancelado.AsString);
    Inc(linha);
    qryitens_os.Next;
  end;

  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha + 1,i, '-');

  if (MMODAV_Anterior.Text <> '') then
  begin
    rs.Write(linha + 2, 0, 'DAV-OS Anteriores');
    rs.Write(linha + 3, 0, MMODAV_Anterior.Lines.Text);
  end;

  rodape:= 'É vedada a autenticação deste documento';
  rs.Write(linha + 10,Alinha_Centro(rodape, i2), rodape);
  rs.Print;
end;

procedure TFrmOS.DAV_OS_Modelo_2;
var
  i, i2, linha: integer;
  dav, dav2, tipo_rel, rodape: string;
  cn, cp: string;
begin
  rs.BeginDoc;
  i:= 0;
  i2:= 135;

  dav:= 'NÃO É DOCUMENTO FISCAL - NÃO É VÁLIDO COMO RECIBO E COMO GARANTIA DE MERCADORIA - ';
  dav2:= 'NÃO COMPROVA PAGAMENTO';
  tipo_rel:= 'DOCUMENTO AUXILIAR DE VENDA - ORDEM DE SERVIÇO';

  rs.WriteFont(1, Alinha_Centro(tipo_rel,i2),tipo_rel, [Bold] + [DobleWide]);
  rs.WriteFont(2, Alinha_Centro(dav,i2), dav, [Bold] + [DobleWide]);
  rs.WriteFont(3, Alinha_Centro(dav2,i2), dav2, [Bold] + [DobleWide]);

  for i := 0 to i2 do
    rs.Write(4,i,'-');

  cn:= Copy(cnpj,1,2)+'.'+Copy(cnpj,3,3)+'.'+Copy(cnpj,6,3)+'/'+ Copy(cnpj,9,4)+'-'+Copy(cnpj,13,2);
  cp:= Copy(LblCPF.Caption,1,3)+'.'+Copy(LblCPF.Caption,4,3)+'.'+Copy(LblCPF.Caption,7,3)+'-'+Copy(LblCPF.Caption,10,2);

  rs.Write(4,0, 'Empresa: ' + nome_fantasia);
  rs.Write(4,60, 'Endereço: ' + tipo_endereco + ' ' + endereco + ', ' + numero);

  rs.Write(5,0, 'CNPJ: ' + cn); RS.Write(5,30, 'Insc. Estadual: ' + insc_estadual);
  RS.Write(5,60, 'Insc. Municipal: ' + insc_municipal);

  rs.Write(6,0, 'Telefone: ' + telefone);

  i:= 1;
  for i := 0 to i2 do
    rs.Write(7,i,'-');

  rs.Write(8,0, 'Cliente: ' + EdtCliente.Text);
  rs.Write(8,60, 'Endereço: ' + LblTipo_Logradouro.Caption + ' ' + LblEndereco.Caption + ', ' + LblNumero.Caption);

  rs.Write(9,0, 'CPF/CNPJ: ' + cp);
  rs.Write(9,30, 'Cidade: ' + LblCidade.Caption); rs.Write(9,60,'UF: ' + LblUF.Caption);

  rs.Write(10,0, 'Setor: ' + LblSetor.Caption); rs.Write(10, 30, 'Telefone: ' + LblTelefone.Caption);

  i:= 1;
  for i := 0 to i2 do
    rs.Write(11,i,'-');

  rs.Write(12,0, 'Veículo: ' + EdtVeiculo.Text);
  rs.Write(12,60, 'RENAVAM: ' + LblRenavam.Caption);

  rs.Write(13,0, 'Marca: ' + LblMarca.Caption);
  rs.Write(13,30, 'Modelo: ' + LblModelo.Caption + ' - ' + LblAno.Caption);

  rs.Write(14,0, 'Placa: ' + LblPlaca.Caption);

  i:= 1;
  for i := 0 to i2 do
    rs.Write(15,i, '-');

  rs.Write(16,0, 'Número do Documento: ' + EdtN_Pedido.Text);
  rs.Write(16, 40, 'Número do Documento Fiscal: ' + '');

  i:= 1;
  for i := 0 to i2 do
    rs.Write(17,i, '-');

  rs.WriteFont(18,0,'Produtos', [Underline]);

  for i := 0 to 10 do
    rs.Write(19,i, '-');

  rs.WriteFont(20,0,'Código Produto', [Underline]);
  rs.WriteFont(20, 16, 'Descrição', [Underline]);
  rs.WriteFont(20, 60, 'Un.', [Underline]);
  rs.WriteFont(20, 66, 'Qtde.', [Underline]);
  rs.WriteFont(20, 74, 'Valor Un.', [Underline]);
  rs.WriteFont(20, 92, 'Valor Total', [Underline]);

  with qryitens_venda, sql do
  begin
    close;
    clear;
    add('select IP.*, M.Descricao as Marca, LP.Local from Itens_Pedido IP');
    add('left join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
    add('left join Localidade_Produto LP on (P.Codigo_Local = LP.Codigo)');
    add('where IP.Codigo = :Codigo and IP.Cancelado = :N');
    Parameters.ParamByName('Pedido').Value:= EdtCodigo.Text;
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
    //rs.Write(linha, 85, FormatFloat('#0.0,0', qryitens_vendaDesconto.AsFloat));
    rs.Write(linha, 92, FormatFloat('#0.0,0', qryitens_vendaSub_Total.AsFloat));
    Inc(linha);
    qryitens_venda.Next;
  end;

  i:= 1;
  for i := 0 to i2 do
    rs.Write(linha,i, '-');

  rs.Write(linha+2,0,'Qtde. Itens:.....: ' + EdtQuantidade_Itens.Text);
  rs.Write(linha+3,0,'Total de Produtos: ' + EdtTotal_Produtos.Text);
  rs.Write(linha+4,40,'Descontos.......: ' + EdtDesconto.Text);
  rs.Write(linha+5,0,'Qtde. Serviços...: ' + EdtQuantidade_Servicos.Text);
  rs.Write(linha+6,0,'Total de Serviços: ' + EdtTotal_Servicos.Text);      rs.WriteFont(linha+6,40,'Total do DAV-OS: ' + EdtTotal_Pedido.Text, [Underline] + [Bold]);


  rodape:= 'É vedada a autenticação deste documento';
  rs.Write(linha + 12,Alinha_Centro(rodape, i2), rodape);
  rs.Print;
end;

procedure TFrmOS.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui é definida a cor da fonte
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

procedure TFrmOS.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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
            add('Delete from Itens_Pedido where N_Pedido = :N_Pedido and Codigo_Produto = :Produto');
            Parameters.ParamByName('N_Pedido').Value:= EdtN_Pedido.Text;
            Parameters.ParamByName('Produto').Value:= qryitens_vendaCodigo_Produto.AsInteger;
            ExecSQL;
          end;

          with qAuxEx, sql do
          begin
            close;
            Connection:= dm.ADOConnection1;
            clear;
            add('Delete from R05 where N_Pedido = :N_Pedido and Codigo_Produto_Inteiro = :Produto');
            Parameters.ParamByName('N_Pedido').Value:= EdtN_Pedido.Text;
            Parameters.ParamByName('Produto').Value:= qryitens_vendaCodigo_Produto.AsInteger;
            ExecSQL;
          end;
        finally
          FreeAndNil(qAux);
        end;  }

        Atualiza_Itens;
      end;
  end;
end;

procedure TFrmOS.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

  if qryitens_osCancelado.AsString = 'S' then
    DBGrid2.Canvas.Font.Color:= clRed;
  dbgrid2.DefaultDrawDataCell(Rect, dbgrid2.columns[datacol].field, State);
end;

procedure TFrmOS.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_delete) then
  begin
    if (Confirma_Delete = true) then
      begin
        Calcula_Total_Deletado_Servico;
        Atualiza_Itens_OS;
      end;
  end;
end;

procedure TFrmOS.Atualiza_Dados_Anterior;
begin
  with qryitens_venda, sql do
  begin
    close;
    clear;
    add('select IP.*, P.Codigo_Venda, P.Descricao, P.Tipo, UM.Sigla as Unidade from Itens_Pedido IP');
    add('inner join Produto P on(IP.Codigo_Produto = P.Codigo)');
    add('inner join Unidade_Medida UM on(P.Codigo_Unidade_Medida = UM.Codigo)');
    add('where IP.Codigo = :Codigo and P.Tipo = :Tipo');
    Parameters.ParamByName('Codigo').Value:= LblCodigo_Anterior.Caption;
    Parameters.ParamByName('Tipo').Value:= 0;
    open;
  end;
  while not qryitens_venda.Eof do
  begin
    Salva_Produtos;
    qryitens_venda.Next;
  end;
end;

procedure TFrmOS.Atualiza_Dados_OS;
begin
  with qryitens_os, sql do
  begin
    close;
    clear;
    add('select IP.*, P.Codigo_Venda, P.Descricao, P.Tipo from Itens_Pedido IP');
    add('inner join Produto P on(IP.Codigo_Produto = P.Codigo)');
    add('where IP.Codigo = :Codigo and P.Tipo = :Tipo');
    Parameters.ParamByName('Codigo').Value:= EdtCodigo.Text;
    Parameters.ParamByName('Tipo').Value:= 1;
    open;
  end;

end;

procedure TFrmOS.Atualiza_Dados_OS_Anterior;
begin
  with qryitens_os, sql do
  begin
    close;
    clear;
    add('select IP.*, P.Codigo_Venda, P.Descricao, P.Tipo from Itens_Pedido IP');
    add('inner join Produto P on(IP.Codigo_Produto = P.Codigo)');
    add('where IP.Codigo = :Codigo and P.Tipo = :Tipo');
    Parameters.ParamByName('Codigo').Value:= LblCodigo_Anterior.Caption;
    Parameters.ParamByName('Tipo').Value:= 1;
    open;
  end;

  while not qryitens_os.Eof do
  begin
    Salva_OS;
    qryitens_os.Next;
  end;
end;

procedure TFrmOS.Atualiza_Itens;
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
      Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
      ExecSQL;
    end;

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update R05 set Cancelamento = :Cancelamento, Quantidade_Cancelada = :Qtde, Valor_Cancelado = :Valor');
      add('where Codigo_Produto_Inteiro = :Codigo_Produto and N_Pedido = :Codigo');
      Parameters.ParamByName('Cancelamento').Value:= 'S';
      Parameters.ParamByName('Qtde').Value:= qryitens_vendaQtde.AsString;
      valor_cancelado:= qryitens_vendaQtde.AsFloat * qryitens_vendaValor_Unitario.AsFloat;
      Parameters.ParamByName('Valor').Value:= FloatToStr(valor_cancelado);
      Parameters.ParamByName('Codigo_Produto').Value:= qryitens_vendaCodigo_Produto.AsInteger;
      Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
      ExecSQL;
    end;

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update R05_Aux set Cancelamento = :Cancelamento, Quantidade_Cancelada = :Qtde, Valor_Cancelado = :Valor');
      add('where Codigo_Produto_Inteiro = :Codigo_Produto and N_Pedido = :Codigo');
      Parameters.ParamByName('Cancelamento').Value:= 'S';
      Parameters.ParamByName('Qtde').Value:= qryitens_vendaQtde.AsString;
      valor_cancelado:= qryitens_vendaQtde.AsFloat * qryitens_vendaValor_Unitario.AsFloat;
      Parameters.ParamByName('Valor').Value:= FloatToStr(valor_cancelado);
      Parameters.ParamByName('Codigo_Produto').Value:= qryitens_vendaCodigo_Produto.AsInteger;
      Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
  Atualiza_Dados;
end;

procedure TFrmOS.Atualiza_Itens_OS;
var
  total, sub1, sub2, valor_cancelado: double;
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update Itens_Pedido set Cancelado = :Cancelado');
      add('where Codigo_Produto = :Codigo_Produto and Codigo = :Codigo');
      Parameters.ParamByName('Cancelado').Value:= 'S';
      Parameters.ParamByName('Codigo_Produto').Value:= qryitens_osCodigo_Produto.AsInteger;
      Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
      ExecSQL;
    end;

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update R05 set Cancelamento = :Cancelamento, Quantidade_Cancelada = :Qtde, Valor_Cancelado = :Valor');
      add('where Codigo_Produto_Inteiro = :Codigo_Produto and N_Pedido = :Codigo');
      Parameters.ParamByName('Cancelamento').Value:= 'S';
      Parameters.ParamByName('Qtde').Value:= '1';
      valor_cancelado:= qryitens_osValor_Unitario.AsFloat;
      Parameters.ParamByName('Valor').Value:= FloatToStr(valor_cancelado);
      Parameters.ParamByName('Codigo_Produto').Value:= qryitens_osCodigo_Produto.AsInteger;
      Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
      ExecSQL;
    end;

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update R05_Aux set Cancelamento = :Cancelamento, Quantidade_Cancelada = :Qtde, Valor_Cancelado = :Valor');
      add('where Codigo_Produto_Inteiro = :Codigo_Produto and N_Pedido = :Codigo');
      Parameters.ParamByName('Cancelamento').Value:= 'S';
      Parameters.ParamByName('Qtde').Value:= '1';
      valor_cancelado:= qryitens_osValor_Unitario.AsFloat;
      Parameters.ParamByName('Valor').Value:= FloatToStr(valor_cancelado);
      Parameters.ParamByName('Codigo_Produto').Value:= qryitens_osCodigo_Produto.AsInteger;
      Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
  Atualiza_Dados_OS;
end;

procedure TFrmOS.Desabilita_Itens;
begin
    BBtnSalvar_OS.Visible:= true;
    LblVeiculo.Visible:= true;
    EdtCodigo_Veiculo.Visible:= true;
    EdtVeiculo.Visible:= true;
    PageControl2.Pages[1].TabVisible:= true;
end;

procedure TFrmOS.EdtAcrecimoEnter(Sender: TObject);
begin
  if (total_valor_uni > 0) then
  begin
    EdtAcrecimo.Text:= FormatFloat('#0.0,0', total_valor_uni);
    EdtAcrecimo.Text:= StringReplace(EdtAcrecimo.Text, ThousandSeparator, '', [rfReplaceAll]);
  end
  else
    EdtAcrecimo.Text:= '0,00';
end;

procedure TFrmOS.EdtAcrecimoExit(Sender: TObject);
begin
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

procedure TFrmOS.EdtAcrecimoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmOS.EdtAcrecimo_TotalExit(Sender: TObject);
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

procedure TFrmOS.EdtClienteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOS.EdtCodigo_ClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;
end;

procedure TFrmOS.EdtCodigo_ClienteKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOS.EdtCodigo_Condicao_PagamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Condicao_Pagamento, FrmChama_Condicao_Pagamento);
    FrmChama_Condicao_Pagamento.ShowModal;
    FrmChama_Condicao_Pagamento.Free;
  end;
end;

procedure TFrmOS.EdtCodigo_FuncionarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Funcionario, FrmChama_Funcionario);
    FrmChama_Funcionario.ShowModal;
    FrmChama_Funcionario.Free;
  end;
end;

procedure TFrmOS.EdtCodigo_FuncionarioKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOS.EdtCodigo_ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    Limpa_Labels;
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free;
  end;

  if (key = vk_return) then
  begin
    EdtST.SetFocus;
  end;
end;

procedure TFrmOS.EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOS.EdtCodigo_ServicoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Servico, FrmChama_Servico);
    FrmChama_Servico.ShowModal;
    FrmChama_Servico.Free;
  end;
end;

procedure TFrmOS.EdtCodigo_ServicoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOS.EdtCodigo_VeiculoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Veiculo, FrmChama_Veiculo);
    FrmChama_Veiculo.ShowModal;
    FrmChama_Veiculo.Free;
  end;
end;

procedure TFrmOS.EdtCodigo_VeiculoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOS.EdtDAV_AnteriorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    if (Chama_Pedido = true) then
    begin
      Ver_Pedido;
      Atualiza_Dados_Anterior;
      Atualiza_Dados_OS_Anterior;
      Atualiza_Dados;
      Atualiza_Dados_OS;
    end
    else
    begin
      Nao_Selecionado;
      EdtDAV_Anterior.SetFocus;
    end;
  end;
end;

procedure TFrmOS.EdtDescontoExit(Sender: TObject);
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

procedure TFrmOS.EdtDesconto_ItemEnter(Sender: TObject);
begin
  if (total_valor_uni < 0) then
  begin
    EdtDesconto_Item.Text:= FormatFloat('#0.0,0', Abs(total_valor_uni));
    EdtDesconto_Item.Text:= StringReplace(EdtDesconto_Item.Text, ThousandSeparator, '', [rfReplaceAll]);
  end
  else
    EdtDesconto_Item.Text:= '0,00';
end;

procedure TFrmOS.EdtDesconto_ItemExit(Sender: TObject);
begin
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
    abort; }
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

procedure TFrmOS.EdtDesconto_ItemKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmOS.EdtDesconto_ServicoExit(Sender: TObject);
begin
  if (EdtDesconto_Servico.Text = '') then
  begin
    Valor_Invalido;
    EdtDesconto_Servico.Clear;
    EdtDesconto_Servico.SetFocus;
    abort;
  end
  else if (StrToFloat(EdtDesconto_Servico.Text) < 0) then
  begin
    Valor_Invalido;
    EdtDesconto_Servico.SetFocus;
    abort;
  end
  else
  begin
    EdtDesconto_Servico.Text:= FormatFloat('#0.0,0', StrToFloat(EdtDesconto_Servico.Text));
    EdtDesconto_Servico.Text:= StringReplace(EdtDesconto_Servico.Text, ThousandSeparator, '', [rfReplaceAll]);
  end;
end;

procedure TFrmOS.EdtDesconto_ServicoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmOS.EdtFuncionarioKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOS.EdtN_PedidoKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmOS.EdtProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOS.EdtQuantidadeExit(Sender: TObject);
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
    EdtQuantidade.Text:= FormatFloat('#0.0,0', StrToFloat(EdtQuantidade.Text));
    EdtQuantidade.Text:= StringReplace(EdtQuantidade.Text, ThousandSeparator, '', [rfReplaceAll]);
  end;
end;

procedure TFrmOS.EdtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', ',', #08]) then
    key := #0
end;

procedure TFrmOS.EdtServicoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOS.EdtTotal_PedidoEnter(Sender: TObject);
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

procedure TFrmOS.EdtValor_ServicoExit(Sender: TObject);
begin
  if (EdtValor_Servico.Text < '0') then
  begin
    Valor_Invalido;
    EdtValor_Servico.Clear;
    EdtValor_Servico.SetFocus;
    abort;
  end
  else if (EdtValor_Servico.Text = '') then
  begin
    Valor_Invalido;
    EdtValor_Servico.SetFocus;
    abort;
  end
  else
  begin
    EdtValor_Servico.Text:= FormatFloat('#0.0,0', StrToFloat(EdtValor_Servico.Text));
    EdtValor_Servico.Text:= StringReplace(EdtValor_Servico.Text, ThousandSeparator, '', [rfReplaceAll]);
  end;
end;

procedure TFrmOS.EdtValor_ServicoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmOS.EdtValor_TotalEnter(Sender: TObject);
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
    begin }
      ctotalitem:= 0;
      ctotalitem:= total - desconto + acrecimo;
      EdtValor_Total.Text:= FormatFloat('#0.0,0', ctotalitem);
      EdtValor_Total.Text:= StringReplace(EdtValor_Total.Text, ThousandSeparator, '', [rfReplaceAll]);
    //end;
end;

procedure TFrmOS.EdtValor_TotalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  limite_compra, limite_compra_disponivel, total_pedido, sub_total, bc, bc2, ali: double;
begin
  if (key = vk_return) then
  begin
    Verifica_Permissao;
    Verifica_Produto_Lancado;

    if (Confira_Itens_Pedido = true) then
    begin
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

      Calcula_Total;

      Colega_Dados_R05;
      R05.Salva_Banco(R05);
      R05.Salva_Banco_Aux(R05);

      Calcula_Imposto;

      //Itens_Pedido.Salva_Banco(Itens_Pedido);

      Atualiza_Dados;
      Limpa_Menor;
      BBtnSalvar_OS.Enabled:= true;
    end;
  end;
end;

procedure TFrmOS.Calcula_Imposto;
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

procedure TFrmOS.Calcula_Imposto_Servico;
var
  bc, bc2, ali: double;
begin
  //-------------------issqn acrescida ou reduzida----------------//

  if (LblBase_Reduzida.Caption <> '') then
  begin
    bc:= (StrToFloat(LblBase_Reduzida.Caption) / 100) * StrToFloat(EdtValor_Total_Servico.Text);
    bc2:= StrToFloat(EdtValor_Total_Servico.Text) - bc;
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
    bc:= (StrToFloat(LblBase_Acrescida.Caption) / 100) * StrToFloat(EdtValor_Total_Servico.Text);
    bc2:= StrToFloat(EdtValor_Total_Servico.Text) + bc;
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
    bc2:= StrToFloat(EdtValor_Total_Servico.Text);
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
  LblSub_Total_Liquido.Caption:= FloatToStr(StrToFloat(EdtValor_Total_Servico.Text) - StrToFloat(LblValor_ICMS.Caption));
  //--------------------fim issqn--------------------------------//
end;

procedure TFrmOS.EdtValor_TotalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmOS.EdtValor_Total_ServicoEnter(Sender: TObject);
var
  qtde, valor_unitario, total: double;
  desconto, cdesconto, ctotalitem: double;
begin
  valor_unitario:= StrToFloat(EdtValor_Servico.Text);

  {if (RGTipo_Desconto_Servico.ItemIndex = 0) then
    begin
      desconto:= 0;
      cdesconto:= 0;
      ctotalitem:= 0;

      desconto:= StrtoFloat(EdtDesconto_Servico.Text);
      cdesconto:= valor_unitario * (desconto / 100);
      ctotalitem:= valor_unitario - cdesconto;
      EdtValor_Total_Servico.Text:= FormatFloat('#0.0,0', ctotalitem);
      EdtValor_Total_Servico.Text:= StringReplace(EdtValor_Total_Servico.Text, ThousandSeparator, '', [rfReplaceAll]);
    end
    else
    begin}
      desconto:= 0;
      ctotalitem:= 0;

      desconto:= StrtoFloat(EdtDesconto_Servico.Text);
      ctotalitem:= valor_unitario - desconto;
      EdtValor_Total_Servico.Text:= FormatFloat('#0.0,0', ctotalitem);
      EdtValor_Total_Servico.Text:= StringReplace(EdtValor_Total_Servico.Text, ThousandSeparator, '', [rfReplaceAll]);
    //end;
end;

procedure TFrmOS.EdtValor_Total_ServicoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  limite_compra, limite_compra_disponivel, total_pedido, sub_total, bc, bc2, ali: double;
begin
  if (key = vk_return) then
  begin
    Verifica_Permissao_Servico;
    Verifica_Servico_Lancado;

    if (Confira_Itens_Pedido_OS = true) then
    begin

    sub_total:= StrToFloat(EdtValor_Total_Servico.Text);
    total_pedido:= sub_total + StrToFloat(EdtTotal_Pedido.Text);
    limite_compra:= StrToFloat(EdtLimite_Compra.Text);
    limite_compra_disponivel:= limite_compra - total_pedido;
    if (Verifica_Credito(limite_compra_disponivel) = false)then
    begin
      Atualiza_Dados_OS;
      Limpa_Menor_Servico;
      EdtCodigo_Servico.SetFocus;
      abort;
    end;

      Calcula_Total_Servico;

      Calcula_Imposto_Servico;

      Colega_Dados_R05_OS;
      R05.Salva_Banco(R05);
      R05.Salva_Banco_Aux(R05);

      Itens_OS.Salva_Banco(Itens_OS);

      Atualiza_Dados_OS;
      Limpa_Menor_Servico;
      BBtnSalvar_OS.Enabled:= true;
    end;
  end;
end;

procedure TFrmOS.EdtValor_Total_ServicoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmOS.Colega_Dados_R05;
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
  tot_par:= cBuffer;
  indicador_cancelamento_item:= 'N';
  qtde_cancelada:= '';
  valor_cancelado:= '';
  can_acre:= '0';
  //IAT:= qAux.FieldByName('Arred_Trunc').AsString;
  //IPPT:= qAux.FieldByName('Producao_Propria').AsString;
  casa_decimal_qtde:= '0';
  casa_decimal_val_un:= '2';
end;

procedure TFrmOS.Colega_Dados_R05_OS;
begin
  //CapturaContadoresECF;
  //Captura_Ultimo_Item;

  //cod_pro:= codigo_produto;
  //descri:= descricao;
  qtde_vendida:= '1';
  //unid:= LblUnidade.Caption;
  valor_unit:= EdtValor_Servico.Text;
  desc_item:= EdtDesconto_Servico.Text;
  acre_item:= '0';
  valor_total_item:= EdtValor_Total_Servico.Text;
  //tot_par:= cBuffer;
  indicador_cancelamento_item:= 'N';
  qtde_cancelada:= '';
  valor_cancelado:= '';
  can_acre:= '0';
  //IAT:= qAux.FieldByName('Arred_Trunc').AsString;
  //IPPT:= qAux.FieldByName('Producao_Propria').AsString;
  casa_decimal_qtde:= '0';
  casa_decimal_val_un:= '2';
end;

procedure TFrmOS.EdtValor_UnitarioExit(Sender: TObject);
begin
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

procedure TFrmOS.EdtValor_UnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmOS.EdtVeiculoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmOS.Escreve_Texto;
begin
  Edit2.Text:= 'Qtde Itens';
  Edit4.Text:= 'Total Produtos';
  Edit3.Text:= 'Limite Crédito';
  Edit6.Text:= 'Limite Disp.';
  Edit8.Text:= 'Desconto';
  Edit5.Text:= 'Total do Pedido';
  Edit1.Text:= 'Limite de Desc.';
  Edit10.Text:= 'Limite Disp.';
  Edit18.Text:= 'Total Serviços';
  Edit12.Text:= 'Qtde. Serv.';
  Edit11.Text:= 'Acréscimo';
  Edit13.Text:= 'Total Acr.';
  Edit9.Text:= 'Total Desc.';
  EdtQuantidade_Itens.Text:= '0';
  EdtQuantidade_Servicos.Text:= '0';
  EdtTotal_Produtos.Text:= '0,00';
  EdtAcrecimo_Total.Text:= '0,00';
  EdtTotal_Servicos.Text:= '0,00';
  EdtTotal_Desconto.Text:= '0,00';
  EdtTotal_Acrecimo.Text:= '0,00';
  EdtLimite_Compra.Text:= '0,00';
  EdtLimite_Compra_Disponivel.Text:= '0,00';
  EdtLimite_Desconto.Text:= '0,00';
  EdtLimite_Desconto_Disponivel.Text:= '0,00';
  EdtDesconto.Text:= '0,00';
  EdtAcrecimo.Text:= '0,00';
  EdtDesconto_Item.Text:= '0,00';
  EdtDesconto_Servico.Text:= '0,00';
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

procedure TFrmOS.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmOS.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (pode_fechar = false) then
    begin
      Salve;
      Abort;
    end
    else
      begin
        FrmOS.Free;
        FrmOS:= Nil;
        codigo_tabela_preco_ativo:= codigo_tabela_preco_padrao;
      end;
end;

procedure TFrmOS.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmOS);
  Util.Limpa_Campos(FrmOS);
  Escreve_Texto;
  qtde_itens:= 0;
  qtde_servicos:= 0;
  Util.Desabilita_Campos(FrmOS);
  PageControl2.TabIndex:= 0;
  qryitens_os.Close;
  qryitens_venda.Close;
  Centraliza_Form(FrmOS);
  Desabilita_Itens;
  pode_fechar:= true;
  Limpa_Labels;
  LblCodigo_Anterior.Caption:= '';
  dav_ant:= '';
  CBFechar.Checked:= false;
end;

procedure TFrmOS.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmOS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      if (iniciado = true) then
      begin
        Mensagem_Venda_Andamento;
        abort;
      end;
      UDeclaracao.n_item:= '';
      qtde_itens:= 0;
      qtde_servicos:= 0;
      Util.Habilita_Campos(FrmOS);
      Util.Limpa_Campos(FrmOS);
      Escreve_Texto;
      pode_fechar:= false;
      achei:= false;
      iniciado:= true;
      PageControl2.TabIndex:= 0;
      qryitens_venda.Close;
      qryitens_os.Close;
      UDeclaracao.pre_venda:= '';
      UDeclaracao.pedido:= '';
      //Gera_N_Pedido;
      //Gera_Codigo_Lancamento;
      EdtN_Pedido.Text:= UDeclaracao.pedido;
      EdtCodigo.Text:= IntToStr(UDeclaracao.codigo);
      EdtN_Pedido.SetFocus;
      Limpa_Labels;
      LblCodigo_Anterior.Caption:= '';
      dav_ant:= '';
      CBFechar.Checked:= false;
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

procedure TFrmOS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmOS.Limpa_Menor;
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

procedure TFrmOS.Limpa_Labels;
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

procedure TFrmOS.Limpa_Menor_Servico;
begin
  EdtCodigo_Servico.Clear;
  EdtServico.Clear;
  EdtValor_Servico.Clear;
  EdtValor_Total_Servico.Clear;
  LblServico.Caption:= '';
  LblTipo_Servico.Caption:= '';
  LblBC.Caption:= '';
  EdtUnidade_Servico.Clear;
  EdtST_Servico.Clear;
  EdtCodigo_Servico.SetFocus;
  Limpa_Labels;
end;

procedure TFrmOS.MEdtData_Previsao_EntregaEnter(Sender: TObject);
begin
  MEdtData_Previsao_Entrega.Text:= DateToStr(date);
end;

procedure TFrmOS.MEdtData_EntradaEnter(Sender: TObject);
begin
  MEdtData_Entrada.Text:= DateToStr(date);
end;

procedure TFrmOS.MEdtHora_EntregaEnter(Sender: TObject);
begin
  MEdtHora_Entrega.Text:= TimeToStr(Now);
end;

procedure TFrmOS.Salva_OS;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  with qAux, SQL do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('Insert into Itens_Pedido (Codigo, N_Item, Codigo_Produto, UN, ');
      add('ICMS, CST, Base_Reduzida, Base_Acrescida, BC, Valor_ICMS, ');
      add('IPI, CST_IPI, Base_Reduzida_IPI, Base_Acrescida_IPI, BC_IPI, Valor_IPI, ');
      add('PIS, CST_PIS, Base_Reduzida_PIS, Base_Acrescida_PIS, BC_PIS, Valor_PIS, ');
      add('COFINS, CST_COFINS, Base_Reduzida_COFINS, Base_Acrescida_COFINS, BC_COFINS, Valor_COFINS, ');
      add('Qtde, Qtde_Entregue, Qtde_Restante, ');
      add('Valor_Unitario, Desconto, Tipo_Desconto, Acrecimo, Tipo_Acrecimo, Sub_Total, Sub_Total_Liquido, Cancelado)');
      add('values (:Codigo, :N_Item, :Codigo_Produto, :UN, ');
      add(':ICMS, :CST, :Base_Reduzida, :Base_Acrescida, :BC, :Valor_ICMS, ');
      add(':IPI, :CST_IPI, :Base_Reduzida_IPI, :Base_Acrescida_IPI, :BC_IPI, :Valor_IPI, ');
      add(':PIS, :CST_PIS, :Base_Reduzida_PIS, :Base_Acrescida_PIS, :BC_PIS, :Valor_PIS, ');
      add(':COFINS, :CST_COFINS, :Base_Reduzida_COFINS, :Base_Acrescida_COFINS, :BC_COFINS, :Valor_COFINS, ');
      add(':Qtde, :Qtde_Entregue, :Qtde_Restante, :Valor_Unitario,');
      add(':Desconto, :Tipo_Desconto, :Acrecimo, :Tipo_Acrecimo, :Sub_Total, :Sub_Total_Liquido, :Cancelado)');

      Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
      Parameters.ParamByName('N_Item').Value:= qryitens_osN_Item.AsString;
      Parameters.ParamByName('Codigo_Produto').Value:= qryitens_osCodigo_Produto.AsInteger;
      Parameters.ParamByName('UN').Value:= qryitens_osUN.AsString;


      Parameters.ParamByName('ICMS').Value:= qryitens_osICMS.AsString;
      Parameters.ParamByName('CST').Value:= qryitens_osCST.AsString;
      Parameters.ParamByName('Base_Reduzida').Value:= qryitens_osBase_Reduzida.AsString;
      Parameters.ParamByName('Base_Acrescida').Value:= qryitens_osBase_Acrescida.AsString;
      Parameters.ParamByName('BC').Value:= qryitens_osBC.AsString;
      Parameters.ParamByName('Valor_ICMS').Value:= qryitens_osValor_ICMS.AsFloat;

      Parameters.ParamByName('IPI').Value:= '';
      Parameters.ParamByName('CST_IPI').Value:= '';
      Parameters.ParamByName('Base_Reduzida_IPI').Value:= '';
      Parameters.ParamByName('Base_Acrescida_IPI').Value:= '';
      Parameters.ParamByName('BC_IPI').Value:= '';
      Parameters.ParamByName('Valor_IPI').Value:= 0;

      Parameters.ParamByName('PIS').Value:= '';
      Parameters.ParamByName('CST_PIS').Value:= '';
      Parameters.ParamByName('Base_Reduzida_PIS').Value:= '';
      Parameters.ParamByName('Base_Acrescida_PIS').Value:= '';
      Parameters.ParamByName('BC_PIS').Value:= '';
      Parameters.ParamByName('Valor_PIS').Value:= 0;

      Parameters.ParamByName('COFINS').Value:= '';
      Parameters.ParamByName('CST_COFINS').Value:= '';
      Parameters.ParamByName('Base_Reduzida_COFINS').Value:= '';
      Parameters.ParamByName('Base_Acrescida_COFINS').Value:= '';
      Parameters.ParamByName('BC_COFINS').Value:= '';
      Parameters.ParamByName('Valor_COFINS').Value:= 0;


      Parameters.ParamByName('Qtde').Value:= qryitens_osQtde.AsFloat;;
      Parameters.ParamByName('Qtde_Entregue').Value:= qryitens_osQtde_Entregue.AsFloat;;
      Parameters.ParamByName('Qtde_Restante').Value:= qryitens_osQtde_Restante.AsFloat;;
      Parameters.ParamByName('Valor_Unitario').Value:= qryitens_osValor_Unitario.AsFloat;
      Parameters.ParamByName('Desconto').Value:= qryitens_osDesconto.AsFloat;;
      Parameters.ParamByName('Tipo_Desconto').Value:= qryitens_osTipo_Desconto.AsString;;
      Parameters.ParamByName('Acrecimo').Value:= qryitens_osAcrecimo.AsFloat;;
      Parameters.ParamByName('Tipo_Acrecimo').Value:= qryitens_osTipo_Acrecimo.AsString;;
      Parameters.ParamByName('Sub_Total').Value:= qryitens_osSub_Total.AsFloat;;
      Parameters.ParamByName('Sub_Total_Liquido').Value:= qryitens_osSub_Total_Liquido.AsFloat;;
      Parameters.ParamByName('Cancelado').Value:= qryitens_osCancelado.AsString;;
      ExecSQL;
    end;
end;

procedure TFrmOS.Salva_Produtos;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  with qAux, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('Insert into Itens_Pedido (Codigo, N_Item, Codigo_Produto, UN, ');
    add('ICMS, CST, Base_Reduzida, Base_Acrescida, BC, Valor_ICMS, ');
    add('IPI, CST_IPI, Base_Reduzida_IPI, Base_Acrescida_IPI, BC_IPI, Valor_IPI, ');
    add('PIS, CST_PIS, Base_Reduzida_PIS, Base_Acrescida_PIS, BC_PIS, Valor_PIS, ');
    add('COFINS, CST_COFINS, Base_Reduzida_COFINS, Base_Acrescida_COFINS, BC_COFINS, Valor_COFINS, ');
    add('Qtde, Qtde_Entregue, Qtde_Restante, ');
    add('Valor_Unitario, Desconto, Tipo_Desconto, Acrecimo, Tipo_Acrecimo, Sub_Total, Sub_Total_Liquido, Cancelado)');
    add('values (:Codigo, :N_Item, :Codigo_Produto, :UN, ');
    add(':ICMS, :CST, :Base_Reduzida, :Base_Acrescida, :BC, :Valor_ICMS, ');
    add(':IPI, :CST_IPI, :Base_Reduzida_IPI, :Base_Acrescida_IPI, :BC_IPI, :Valor_IPI, ');
    add(':PIS, :CST_PIS, :Base_Reduzida_PIS, :Base_Acrescida_PIS, :BC_PIS, :Valor_PIS, ');
    add(':COFINS, :CST_COFINS, :Base_Reduzida_COFINS, :Base_Acrescida_COFINS, :BC_COFINS, :Valor_COFINS, ');
    add(':Qtde, :Qtde_Entregue, :Qtde_Restante, :Valor_Unitario,');
    add(':Desconto, :Tipo_Desconto, :Acrecimo, :Tipo_Acrecimo, :Sub_Total, :Sub_Total_Liquido, :Cancelado)');

    Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
    Parameters.ParamByName('N_Item').Value:= qryitens_vendaN_Item.AsString;
    Parameters.ParamByName('Codigo_Produto').Value:= qryitens_vendaCodigo_Produto.AsInteger;
    Parameters.ParamByName('UN').Value:= qryitens_vendaUN.AsString;

    Parameters.ParamByName('ICMS').Value:= qryitens_vendaICMS.AsString;
    Parameters.ParamByName('CST').Value:= qryitens_vendaCST.AsString;
    Parameters.ParamByName('Base_Reduzida').Value:= qryitens_vendaBase_Reduzida.AsString;
    Parameters.ParamByName('Base_Acrescida').Value:= qryitens_vendaBase_Acrescida.AsString;
    Parameters.ParamByName('BC').Value:= qryitens_vendaBC.AsString;
    Parameters.ParamByName('Valor_ICMS').Value:= qryitens_vendaValor_ICMS.AsFloat;

    Parameters.ParamByName('IPI').Value:= qryitens_vendaIPI.AsString;
    Parameters.ParamByName('CST_IPI').Value:= qryitens_vendaCST_IPI.AsString;
    Parameters.ParamByName('Base_Reduzida_IPI').Value:= qryitens_vendaBase_Reduzida_IPI.AsString;
    Parameters.ParamByName('Base_Acrescida_IPI').Value:= qryitens_vendaBase_Acrescida_IPI.AsString;
    Parameters.ParamByName('BC_IPI').Value:= qryitens_vendaBC_IPI.AsString;
    Parameters.ParamByName('Valor_IPI').Value:= qryitens_vendaValor_IPI.AsFloat;

    Parameters.ParamByName('PIS').Value:= qryitens_vendaPIS.AsString;
    Parameters.ParamByName('CST_PIS').Value:= qryitens_vendaCST_PIS.AsString;
    Parameters.ParamByName('Base_Reduzida_PIS').Value:= qryitens_vendaBase_Reduzida_PIS.AsString;
    Parameters.ParamByName('Base_Acrescida_PIS').Value:= qryitens_vendaBase_Acrescida_PIS.AsString;
    Parameters.ParamByName('BC_PIS').Value:= qryitens_vendaBC_PIS.AsString;
    Parameters.ParamByName('Valor_PIS').Value:= qryitens_vendaValor_PIS.AsFloat;

    Parameters.ParamByName('COFINS').Value:= qryitens_vendaCOFINS.AsString;
    Parameters.ParamByName('CST_COFINS').Value:= qryitens_vendaCST_COFINS.AsString;
    Parameters.ParamByName('Base_Reduzida_COFINS').Value:= qryitens_vendaBase_Reduzida_COFINS.AsString;
    Parameters.ParamByName('Base_Acrescida_COFINS').Value:= qryitens_vendaBase_Acrescida_COFINS.AsString;
    Parameters.ParamByName('BC_COFINS').Value:= qryitens_vendaBC_COFINS.AsString;
    Parameters.ParamByName('Valor_COFINS').Value:= qryitens_vendaValor_COFINS.AsFloat;


    Parameters.ParamByName('Qtde').Value:= qryitens_vendaQtde.AsFloat;
    Parameters.ParamByName('Qtde_Entregue').Value:= qryitens_vendaQtde_Entregue.AsFloat;
    Parameters.ParamByName('Qtde_Restante').Value:= qryitens_vendaQtde_Restante.AsFloat;
    Parameters.ParamByName('Valor_Unitario').Value:= qryitens_vendaValor_Unitario.AsFloat;
    Parameters.ParamByName('Desconto').Value:= qryitens_vendaDesconto.AsFloat;
    Parameters.ParamByName('Tipo_Desconto').Value:= qryitens_vendaTipo_Desconto.AsString;
    Parameters.ParamByName('Acrecimo').Value:= qryitens_vendaAcrecimo.AsFloat;
    Parameters.ParamByName('Tipo_Acrecimo').Value:= qryitens_vendaTipo_Acrecimo.AsString;
    Parameters.ParamByName('Sub_Total').Value:= qryitens_vendaSub_Total.AsFloat;
    Parameters.ParamByName('Sub_Total_Liquido').Value:= qryitens_vendaSub_Total_Liquido.AsFloat;
    Parameters.ParamByName('Cancelado').Value:= qryitens_vendaCancelado.AsString;
    ExecSQL;
  end;
end;

procedure TFrmOS.Verifica_Permissao;
begin
  if (EdtCodigo_Cliente.Text = '') then
  begin
    UDeclaracao.Mensagem_Falta_Dados;
    EdtCodigo_Cliente.SetFocus;
    abort;
  end;

  if (LblTipo.Caption = '1') then
  begin
    Application.MessageBox('Não é permitido lançar serviços nesta aba.', 'Operação não permitida', MB_OK+MB_ICONHAND);
    Limpa_Menor;
    abort;
  end;

end;

procedure TFrmOS.Verifica_Permissao_Servico;
begin
  if (LblTipo.Caption = '0') then
  begin
    Application.MessageBox('Não é permitido lançar produtos nesta aba.', 'Operação não permitida', MB_OK+MB_ICONHAND);
    Limpa_Menor_Servico;
    abort;
  end;

end;

procedure TFrmOS.Verifica_Produto_Lancado;
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

procedure TFrmOS.Verifica_Servico_Lancado;
begin
  if not qryitens_os.IsEmpty then
  begin
    if (qryitens_os.Locate('Codigo;Codigo_Produto;Cancelado', VarArrayOf([StrToInt(EdtCodigo.Text), StrToInt(LblProduto.Caption), 'N']), [])) then
    begin
      Produto_Ja_Lancamento_Venda;
      EdtCodigo_Servico.SetFocus;
      abort;
    end;
  end;
end;

procedure TFrmOS.Ver_Pedido;
var
  limite_compra_disponivel: double;
begin
  EdtCodigo_Cliente.Text:= qAux.FieldByName('Codigo_Cliente').AsString;
  EdtCliente.Text:= qAux.FieldByName('Nome_Nome_Fantasia').AsString;
  EdtCodigo_Veiculo.Text:= qAux.FieldByName('Codigo_Veiculo').AsString;
  EdtVeiculo.Text:= qAux.FieldByName('Veiculo').AsString;

  EdtCodigo_Funcionario.Text:= qAux.FieldByName('Codigo_Funcionario').AsString;
  EdtFuncionario.Text:= qAux.FieldByName('Nome').AsString;

  MEdtData_Entrada.Text:= qAux.FieldByName('Data_Venda').AsString;
  MEdtData_Previsao_Entrega.Text:= qAux.FieldByName('Data_Previsao_Entrega').AsString;
  MEdtHora_Entrega.Text:= qAux.FieldByName('Hora_Entrega').AsString;

  EdtQuantidade_Itens.Text:= qAux.FieldByName('Qtde_Itens').AsString;

  if (qAux.FieldByName('Status_OS').AsString = 'ABERTO') then
    CBFechar.Checked:= false
  else
    CBFechar.Checked:= true;

  EdtTotal_Produtos.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Total_Produtos').AsFloat);
  EdtTotal_Produtos.Text:= StringReplace(EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtDesconto.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Desconto').AsFloat);
  EdtDesconto.Text:= StringReplace(EdtDesconto.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Total_Pedido').AsFloat);
  EdtTotal_Pedido.Text:= StringReplace(EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtQuantidade_Servicos.Text:= qAux.FieldByName('Qtde_Servicos').AsString;

  EdtTotal_Servicos.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Total_Servicos').AsFloat);
  EdtTotal_Servicos.Text:= StringReplace(EdtTotal_Servicos.Text, ThousandSeparator, '', [rfReplaceAll]);

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
    FrmOS.LblCPF.Caption:= qAux2.FieldByName('CPF').AsString
  else if (qAux2.FieldByName('CNPJ').AsString <> '') then
    FrmOS.LblCPF.Caption:= qAux2.FieldByName('CNPJ').AsString
  else
    FrmOS.LblCPF.Caption:= '';

  FrmOS.LblCidade.Caption:= qAux2.FieldByName('Descricao').AsString;
  FrmOS.LblSetor.Caption:= qAux2.FieldByName('Descricao_1').AsString;
  FrmOS.LblEndereco.Caption:= qAux2.FieldByName('Descricao_2').AsString;
  FrmOS.LblTipo_Logradouro.Caption:= qAux2.FieldByName('Tipo_Logradouro').AsString;
  FrmOS.LblUF.Caption:= qAux2.FieldByName('UF').AsString;
  FrmOS.LblTelefone.Caption:= qAux2.FieldByName('Telefone').AsString;
  FrmOS.LblNumero.Caption:= qAux2.FieldByName('Numero').AsString;

  if (qAux.FieldByName('Tipo').AsString = 'OS') then
  begin
    with qAux3, sql do
    begin
      close;
      clear;
      add('select V.*, M.Descricao, C.Nome_Nome_Fantasia from Veiculo V');
      add('inner join Marca M on (V.Codigo_Marca = M.Codigo)');
      add('inner join Cliente C on (V.Codigo_Cliente = C.Codigo)');
      add('where V.Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo_Veiculo.Text);
      open;
    end;

    LblMarca.Caption:= qAux3.FieldByName('Descricao').AsString;
    LblModelo.Caption:= qAux3.FieldByName('Modelo').AsString;
    LblAno.Caption:= qAux3.FieldByName('Ano_Fabricacao').AsString;
    LblPlaca.Caption:= qAux3.FieldByName('Placa').AsString;
    LblRenavam.Caption:= qAux3.FieldByName('Renavam').AsString;
  end;


  EdtLimite_Compra.Text:= FormatFloat('#0.0,0', qAux2.FieldByName('Limite_Credito').AsFloat);
  EdtLimite_Compra.Text:= StringReplace(EdtLimite_Compra.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtLimite_Desconto.Text:= FormatFloat('#0.0,0', qAux2.FieldByName('Limite_Desconto').AsFloat);
  EdtLimite_Desconto.Text:= StringReplace(EdtLimite_Desconto.Text, ThousandSeparator, '', [rfReplaceAll]);

  limite_compra_disponivel:= StrToFloat(EdtLimite_Compra.Text) - StrToFloat(EdtTotal_Pedido.Text);

  EdtLimite_Compra_Disponivel.Text:= FormatFloat('#0.0,0', limite_compra_disponivel);
  EdtLimite_Compra_Disponivel.Text:= StringReplace(EdtLimite_Compra_Disponivel.Text, ThousandSeparator, '', [rfReplaceAll]);

  BBtnSalvar_OS.Enabled:= true;
end;

end.
