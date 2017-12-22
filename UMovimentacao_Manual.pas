unit UMovimentacao_Manual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls, Provider, DBClient, RSPrint, Buttons, StrUtils;

type
  TFrmMovimentacao_Manual = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ImgImagens_Comandos: TImageList;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    MEdtData_Venda: TMaskEdit;
    LblData_Cadastro: TLabel;
    LblNome: TLabel;
    EdtCodigo_Cliente: TEdit;
    EdtCliente: TEdit;
    Label1: TLabel;
    EdtCodigo_Funcionario: TEdit;
    EdtFuncionario: TEdit;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
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
    Label10: TLabel;
    MmoObservacao: TMemo;
    EdtTotal_Produtos: TEdit;
    Edit4: TEdit;
    EdtDesconto: TEdit;
    Edit8: TEdit;
    Edit5: TEdit;
    EdtTotal_Pedido: TEdit;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    LblProduto: TLabel;
    qryitens_movimentacao: TADOQuery;
    ds_qry_itens_venda: TDataSource;
    Label13: TLabel;
    EdtDesconto_Item: TEdit;
    qrymovimentacao: TADOQuery;
    qrymovimentacaoCodigo: TIntegerField;
    qrymovimentacaoCodigo_Empresa: TIntegerField;
    qrymovimentacaoCodigo_Funcionario: TIntegerField;
    qrymovimentacaoCodigo_Cliente: TIntegerField;
    qrymovimentacaoData_Emissao: TDateTimeField;
    qrymovimentacaoN_Ordem: TStringField;
    qrymovimentacaoModelo: TStringField;
    qrymovimentacaoN_Serie: TStringField;
    qrymovimentacaoCaixa: TStringField;
    qrymovimentacaoNome_Nome_Fantasia: TStringField;
    qrymovimentacaoNome: TStringField;
    Label2: TLabel;
    EdtN_Serie: TEdit;
    EdtModelo: TEdit;
    Label3: TLabel;
    EdtN_Ordem: TEdit;
    Label4: TLabel;
    Label16: TLabel;
    EdtST: TEdit;
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
    LblValor_ICMS: TLabel;
    LblValor_COFINS: TLabel;
    LblValor_PIS: TLabel;
    LblValor_IPI: TLabel;
    LblSub_Total_Liquido: TLabel;
    qryitens_movimentacaoCodigo: TIntegerField;
    qryitens_movimentacaoSequencia: TStringField;
    qryitens_movimentacaoCodigo_Produto: TIntegerField;
    qryitens_movimentacaoUN: TStringField;
    qryitens_movimentacaoICMS: TStringField;
    qryitens_movimentacaoCST: TStringField;
    qryitens_movimentacaoBase_Reduzida: TStringField;
    qryitens_movimentacaoBase_Acrescida: TStringField;
    qryitens_movimentacaoBC: TStringField;
    qryitens_movimentacaoValor_ICMS: TFloatField;
    qryitens_movimentacaoIPI: TStringField;
    qryitens_movimentacaoCST_IPI: TStringField;
    qryitens_movimentacaoBase_Reduzida_IPI: TStringField;
    qryitens_movimentacaoBase_Acrescida_IPI: TStringField;
    qryitens_movimentacaoBC_IPI: TStringField;
    qryitens_movimentacaoValor_IPI: TFloatField;
    qryitens_movimentacaoPIS: TStringField;
    qryitens_movimentacaoCST_PIS: TStringField;
    qryitens_movimentacaoBase_Reduzida_PIS: TStringField;
    qryitens_movimentacaoBase_Acrescida_PIS: TStringField;
    qryitens_movimentacaoBC_PIS: TStringField;
    qryitens_movimentacaoValor_PIS: TFloatField;
    qryitens_movimentacaoCOFINS: TStringField;
    qryitens_movimentacaoCST_COFINS: TStringField;
    qryitens_movimentacaoBase_Reduzida_COFINS: TStringField;
    qryitens_movimentacaoBase_Acrescida_COFINS: TStringField;
    qryitens_movimentacaoBC_COFINS: TStringField;
    qryitens_movimentacaoValor_COFINS: TFloatField;
    qryitens_movimentacaoValor_Unitario: TFloatField;
    qryitens_movimentacaoQuantidade: TFloatField;
    qryitens_movimentacaoDesconto: TFloatField;
    qryitens_movimentacaoTipo_Desconto: TStringField;
    qryitens_movimentacaoSub_Total: TFloatField;
    qryitens_movimentacaoSub_Total_Liquido: TFloatField;
    qryitens_movimentacaoUnidade: TStringField;
    qryitens_movimentacaoCodigo_Venda: TStringField;
    qryitens_movimentacaoDescricao: TStringField;
    qryitens_movimentacaoEstoque: TFloatField;
    qryitens_movimentacaoValor_Medio: TFloatField;
    LblTipo: TLabel;
    procedure BBtnSalvarClick(Sender: TObject);
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
    procedure EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_FuncionarioKeyDown(Sender: TObject;
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
    procedure EdtDesconto_ItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtDescontoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtTotal_PedidoEnter(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_FuncionarioKeyPress(Sender: TObject; var Key: Char);
  private
    MM: URegistro.TMovimentacao_Manual;
    IMM: URegistro.TItens_Movimentacao_Manual;
    Util: TUtil;
    qtde_itens: integer;
    pode: boolean;
    procedure Gera_Codigo;
    procedure Limpa_Labels;
    procedure Calcula_Imposto;
    procedure Verifica_Permissao;
  public
    ativo, iniciado: boolean;
    sequencial: integer;
  protected
    function Confira_Pedido: boolean;
    function Confira_Itens_Pedido: boolean;
  end;

var
  FrmMovimentacao_Manual: TFrmMovimentacao_Manual;
implementation

uses UDM, UChama_Produto, UChama_Cliente, UDeclaracao, UChama_Funcionario;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmMovimentacao_Manual.Atualiza_Dados;
begin
  with qryitens_movimentacao, sql do
  begin
    close;
    clear;
    add('select IMM.*, UM.Sigla as Unidade, P.Codigo_Venda, P.Descricao, P.Estoque, P.Valor_Medio from Itens_Movimentacao_Manual IMM');
    add('inner join Produto P on (IMM.Codigo_Produto = P.Codigo)');
    add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
    add('where IMM.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= EdtCodigo.Text;
    open;
  end;
end;

procedure TFrmMovimentacao_Manual.BBtnCancelarClick(Sender: TObject);
begin
  IMM.Excluir(IMM);
  Util.Limpa_Campos(FrmMovimentacao_Manual);
  Escreve_Texto;
  Util.Desabilita_Campos(FrmMovimentacao_Manual);
  BBtnSalvar.Enabled:= false;
end;

procedure TFrmMovimentacao_Manual.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    MM.Excluir(MM);
    IMM.Excluir(IMM);
    BBtnSalvar.Enabled:= false;
    Util.Desabilita_Campos(FrmMovimentacao_Manual);
  end;
end;

procedure TFrmMovimentacao_Manual.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmMovimentacao_Manual.BBtnSalvarClick(Sender: TObject);
var
  estoque: double;
begin
  if (achei = false) then
    begin
      if (Confira_Pedido = true) then
      begin
        MM.Inserir(MM);

        qryitens_movimentacao.First;
        while not qryitens_movimentacao.Eof do
        begin
          estoque:= qryitens_movimentacaoEstoque.AsFloat - qryitens_movimentacaoQuantidade.AsFloat;

          //Atualiza_Saldo_Estoque(qryitens_movimentacaoCodigo.AsInteger, qryitens_movimentacaoValor_Medio.AsFloat * estoque);
          //Atualiza_Estoque(estoque, qryitens_movimentacaoCodigo_Produto.AsInteger);

          qryitens_movimentacao.Next;
        end;

        UDeclaracao.Insere_Historico(usuario, 'REALIZOU REGISTRO DE MOVIMENTAÇÃO MANUAL.', TimeToStr(time), insercao, date);
      end
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    iniciado:= false;
    Util.Desabilita_Campos(FrmMovimentacao_Manual);
end;

procedure TFrmMovimentacao_Manual.Calcula_Total;
var
  sub_total, total_produtos, peso_total, desconto, total_pedido, outras_despesas, valor_frete,
  limite_compra, limite_compra_disponivel: double;
begin
  sub_total:= StrToFloat(EdtValor_Total.Text);

  Inc(qtde_itens);

  total_produtos:= sub_total + StrToFloat(EdtTotal_Produtos.Text);
  EdtTotal_Produtos.Text:= FormatFloat('#0.0,0', total_produtos);
  EdtTotal_Produtos.Text:= StringReplace(EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

  total_pedido:= sub_total + StrToFloat(EdtTotal_Pedido.Text);
  EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', total_pedido);
  EdtTotal_Pedido.Text:= StringReplace(EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmMovimentacao_Manual.Calcula_Total_Deletado;
var
  sub_total, total_produtos, peso_total, desconto, total_pedido, outras_despesas, valor_frete,
  limite_compra, limite_compra_disponivel: double;
begin
  sub_total:= qryitens_movimentacaoSub_Total.AsFloat;

  Dec(qtde_itens);

  total_produtos:= StrToFloat(EdtTotal_Produtos.Text) - sub_total;
  EdtTotal_Produtos.Text:= FormatFloat('#0.0,0', total_produtos);
  EdtTotal_Produtos.Text:= StringReplace(EdtTotal_Produtos.Text, ThousandSeparator, '', [rfReplaceAll]);

  total_pedido:= StrToFloat(EdtTotal_Pedido.Text) - sub_total;
  EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', total_pedido);
  EdtTotal_Pedido.Text:= StringReplace(EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

function TFrmMovimentacao_Manual.Chama_Pedido: boolean;
begin
  {with qAux, sql do
  begin
    close;
    clear;
    add('Select P.*, Cli.Nome_Nome_Fantasia, CP.Descricao from Pedido P');
    add('inner join Cliente Cli on (Cli.Codigo = P.Codigo_Cliente)');
    add('inner join Condicao_Pagamento CP on (CP.Codigo = P.Codigo_Condicao_Pagamento)');
    add('where P.N_Pedido = :Pedido and P.Status = :Status');
    Parameters.ParamByName('Pedido').Value:= EdtN_Pedido.Text;
    Parameters.ParamByName('Status').Value:= 'PENDENTE';
    open;
  end;

  if (qAux.IsEmpty = false) then
    Result:= true
  else
    Result:= false; }
end;

function TFrmMovimentacao_Manual.Confira_Itens_Pedido: boolean;
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

  if (EdtValor_Total.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtValor_Total.SetFocus;
    abort;
  end;

  Confira_Itens_Pedido:= true;
end;

function TFrmMovimentacao_Manual.Confira_Pedido: boolean;
begin
  Confira_Pedido:= false;

  if (EdtCodigo.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo.SetFocus;
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

  if (MEdtData_Venda.Text = '') then
  begin
    Mensagem_Falta_Dados;
    MEdtData_Venda.SetFocus;
    abort;
  end;

  Confira_Pedido:= true;
end;

procedure TFrmMovimentacao_Manual.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmMovimentacao_Manual.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_delete) then
  begin
    if (Confirma_Delete = true) then
      begin
        Calcula_Total_Deletado;
        IMM.Excluir_Item(IMM);
      end;
  end;
end;

procedure TFrmMovimentacao_Manual.EdtClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmMovimentacao_Manual.EdtCodigo_ClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;
end;

procedure TFrmMovimentacao_Manual.EdtCodigo_ClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmMovimentacao_Manual.EdtCodigo_FuncionarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Funcionario, FrmChama_Funcionario);
    FrmChama_Funcionario.ShowModal;
    FrmChama_Funcionario.Free;
  end;
end;

procedure TFrmMovimentacao_Manual.EdtCodigo_FuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmMovimentacao_Manual.EdtCodigo_ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free;
  end;
end;

procedure TFrmMovimentacao_Manual.EdtDescontoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_RETURN) then
  begin
    if (EdtDesconto.Text = '') then
    begin
      Valor_Invalido;
      EdtDesconto.SetFocus;
      abort;
    end
    else
    begin
      EdtDesconto.Text:= FormatFloat('#0.0,0', StrToFloat(EdtDesconto.Text));
      EdtDesconto.Text:= StringReplace(EdtDesconto.Text, ThousandSeparator, '', [rfReplaceAll]);

      end;
  end;
end;

procedure TFrmMovimentacao_Manual.EdtDesconto_ItemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_RETURN) then
  begin
    if (EdtDesconto_Item.Text = '') then
    begin
      Valor_Invalido;
      EdtDesconto_Item.SetFocus;
      abort;
    end
    else
    begin
      EdtDesconto_Item.Text:= FormatFloat('#0.0,0', StrToFloat(EdtDesconto_Item.Text));
      EdtDesconto_Item.Text:= StringReplace(EdtDesconto_Item.Text, ThousandSeparator, '', [rfReplaceAll]);

      end;
  end;
end;

procedure TFrmMovimentacao_Manual.EdtFuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmMovimentacao_Manual.EdtN_PedidoKeyDown(Sender: TObject; var Key: Word;
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
      achei:= false;
    end;
  end;
end;

procedure TFrmMovimentacao_Manual.EdtQuantidadeExit(Sender: TObject);
begin
  if (EdtQuantidade.Text = '') then
  begin
    Valor_Invalido;
    EdtQuantidade.SetFocus;
    abort;
  end
  else
  begin
    EdtQuantidade.Text:= FormatFloat('#0.0,0', StrToFloat(EdtQuantidade.Text));
    EdtQuantidade.Text:= StringReplace(EdtQuantidade.Text, ThousandSeparator, '', [rfReplaceAll]);
  end;
end;

procedure TFrmMovimentacao_Manual.EdtTotal_PedidoEnter(Sender: TObject);
var
  total_prod, total_ped, total: double;
  desconto, cdesconto, ctotalitem: double;
begin
  total_prod:= StrToFloat(EdtTotal_Produtos.Text);
  total_ped:= StrToFloat(EdtTotal_Pedido.Text);

  {if (RGDesconto.ItemIndex = 0) then
    begin
      desconto:= 0;
      cdesconto:= 0;
      ctotalitem:= 0;

      desconto:= StrtoFloat(EdtDesconto.Text);
      cdesconto:= total_prod * (desconto / 100);
      ctotalitem:= total_prod - cdesconto;
      EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', ctotalitem);
      EdtTotal_Pedido.Text:= StringReplace(EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);
    end
    else
    begin}
      desconto:= 0;
      ctotalitem:= 0;

      desconto:= StrtoFloat(EdtDesconto.Text);
      ctotalitem:= total_prod - desconto;
      EdtTotal_Pedido.Text:= FormatFloat('#0.0,0', ctotalitem);
      EdtTotal_Pedido.Text:= StringReplace(EdtTotal_Pedido.Text, ThousandSeparator, '', [rfReplaceAll]);
    //end;
end;

procedure TFrmMovimentacao_Manual.EdtValor_TotalEnter(Sender: TObject);
var
  qtde, valor_unitario, total: double;
  desconto, cdesconto, ctotalitem: double;
begin
  qtde:= StrToFloat(EdtQuantidade.Text);
  valor_unitario:= StrToFloat(EdtValor_Unitario.Text);
  total:= qtde * valor_unitario;
  total:= Calcula_Valor(FloatToStr(total));
  {if (RGDesconto_Item.ItemIndex = 0) then
    begin
      desconto:= 0;
      cdesconto:= 0;
      ctotalitem:= 0;

      desconto:= StrtoFloat(EdtDesconto_Item.Text);
      cdesconto:= total * (desconto / 100);
      ctotalitem:= total - cdesconto;
      EdtValor_Total.Text:= FormatFloat('#0.0,0', ctotalitem);
      EdtValor_Total.Text:= StringReplace(EdtValor_Total.Text, ThousandSeparator, '', [rfReplaceAll]);
    end
    else
    begin}
      desconto:= 0;
      ctotalitem:= 0;

      desconto:= StrtoFloat(EdtDesconto_Item.Text);
      ctotalitem:= total - desconto;
      EdtValor_Total.Text:= FormatFloat('#0.0,0', ctotalitem);
      EdtValor_Total.Text:= StringReplace(EdtValor_Total.Text, ThousandSeparator, '', [rfReplaceAll]);
    //end;
end;

procedure TFrmMovimentacao_Manual.EdtValor_TotalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  bc, bc2, ali: double;
begin
  if (key = vk_return) then
  begin
    Verifica_Permissao;
    if (Confira_Itens_Pedido = true) then
    begin

      inc(sequencial);
      Calcula_Imposto;
      IMM.Inserir(IMM);
      Atualiza_Dados;
      Calcula_Total;

      Limpa_Menor;
      BBtnSalvar.Enabled:= true;
    end;
  end;
end;

procedure TFrmMovimentacao_Manual.Calcula_Imposto;
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

procedure TFrmMovimentacao_Manual.Limpa_Labels;
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
  EdtModelo.Text:= '02';
  EdtN_Serie.Text:= 'D';
end;

procedure TFrmMovimentacao_Manual.EdtValor_UnitarioExit(Sender: TObject);
begin
  EdtValor_Unitario.Text:= FormatFloat('#0.0,0', StrToFloat(EdtValor_Unitario.Text));
  EdtValor_Unitario.Text:= StringReplace(EdtValor_Unitario.Text, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmMovimentacao_Manual.Escreve_Texto;
begin
  Edit4.Text:= 'Total Produtos';
  Edit8.Text:= 'Desconto';
  Edit5.Text:= 'Total do Pedido';
  EdtTotal_Produtos.Text:= '0,00';
  EdtDesconto.Text:= '0,00';
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

procedure TFrmMovimentacao_Manual.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmMovimentacao_Manual.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (iniciado = false) then
    begin
      FrmMovimentacao_Manual.Free;
      FrmMovimentacao_Manual:= Nil;
    end
    else
    begin
      Salve;
      Abort;
    end;
end;

procedure TFrmMovimentacao_Manual.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmMovimentacao_Manual);
  Util.Limpa_Campos(FrmMovimentacao_Manual);
  Escreve_Texto;
  qtde_itens:= 0;
  Util.Desabilita_Campos(FrmMovimentacao_Manual);
  PageControl2.TabIndex:= 0;
  Centraliza_Form(FrmMovimentacao_Manual);
  qryitens_movimentacao.Close;
  Limpa_Labels;
end;

procedure TFrmMovimentacao_Manual.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmMovimentacao_Manual.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      if (iniciado = true) then
      begin
        Mensagem_Venda_Andamento;
        abort;
      end;
      Util.Habilita_Campos(FrmMovimentacao_Manual);
      Util.Limpa_Campos(FrmMovimentacao_Manual);
      Escreve_Texto;
      iniciado:= true;
      BBtnSalvar.Enabled:= false;
      achei:= false;
      PageControl2.TabIndex:= 0;
      MEdtData_Venda.SetFocus;
      Gera_Codigo;
      qryitens_movimentacao.Close;
      Limpa_Labels;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmMovimentacao_Manual.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmMovimentacao_Manual.Gera_Codigo;
var
  qAux: TADOQuery;
  codigo: integer;
begin
  try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select max(Codigo) as Codigo from Movimentacao_Manual');
      open;
    end;
      codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
      EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmMovimentacao_Manual.Limpa_Menor;
begin
  EdtCodigo_Produto.Clear;
  EdtProduto.Clear;
  EdtUnidade.Clear;
  EdtQuantidade.Clear;
  EdtValor_Unitario.Clear;
  EdtValor_Total.Clear;
  LblProduto.Caption:= '';
  LblBC.Caption:= '';
  EdtST.Clear;
  LblIPI.Caption:= '';

  Limpa_Labels;
  EdtCodigo_Produto.SetFocus;
end;

procedure TFrmMovimentacao_Manual.MEdtData_VendaEnter(Sender: TObject);
begin
  MEdtData_Venda.Text:= DateToStr(date);
end;

procedure TFrmMovimentacao_Manual.Verifica_Permissao;
begin
  if (LblTipo.Caption = '1') then
  begin
    Application.MessageBox('Não é permitido lançar serviços na Movimentação Manual.', 'Operação não permitida', MB_OK+MB_ICONHAND);
    Limpa_Menor;
    abort;
  end;
end;

procedure TFrmMovimentacao_Manual.Ver_Pedido;
var
  limite_compra_disponivel: double;
begin
  {EdtCodigo.Text:= qAux.FieldByName('Codigo').AsString;
  EdtCodigo_Cliente.Text:= qAux.FieldByName('Codigo_Cliente').AsString;
  EdtCliente.Text:= qAux.FieldByName('Nome_Nome_Fantasia').AsString;
  EdtCodigo_Condicao_Pagamento.Text:= qAux.FieldByName('Codigo_Condicao_Pagamento').AsString;
  EdtCondicao_Pagamento.Text:= qAux.FieldByName('Descricao').AsString;

  EdtOutras_Despesas.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Outras_Despesas').AsFloat);
  EdtOutras_Despesas.Text:= StringReplace(EdtOutras_Despesas.Text, ThousandSeparator, '', [rfReplaceAll]);

  if (qAux.FieldByName('Tipo_Frete').AsString = 'CIF') then
    RGTipo_Frete.ItemIndex:= 0
  else
    RGTipo_Frete.ItemIndex:= 1;

  EdtValor_Frete.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Valor_Frete').AsFloat);
  EdtValor_Frete.Text:= StringReplace(EdtValor_Frete.Text, ThousandSeparator, '', [rfReplaceAll]);

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

  MmoObservacao.Text:= qAux.FieldByName('Observacoes').AsString;

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
    FrmPedido_Venda.LblCPF.Caption:= qAux2.FieldByName('CPF').AsString
  else if (qAux2.FieldByName('CNPJ').AsString <> '') then
    FrmPedido_Venda.LblCPF.Caption:= qAux2.FieldByName('CNPJ').AsString
  else
    FrmPedido_Venda.LblCPF.Caption:= '';

  FrmPedido_Venda.LblCidade.Caption:= qAux2.FieldByName('Descricao').AsString;
  FrmPedido_Venda.LblSetor.Caption:= qAux2.FieldByName('Descricao_1').AsString;
  FrmPedido_Venda.LblEndereco.Caption:= qAux2.FieldByName('Descricao_2').AsString;
  FrmPedido_Venda.LblTipo_Logradouro.Caption:= qAux2.FieldByName('Tipo_Logradouro').AsString;
  FrmPedido_Venda.LblUF.Caption:= qAux2.FieldByName('UF').AsString;
  FrmPedido_Venda.LblTelefone.Caption:= qAux2.FieldByName('Telefone').AsString;
  FrmPedido_Venda.LblNumero.Caption:= qAux2.FieldByName('Numero').AsString;

  EdtLimite_Compra.Text:= FormatFloat('#0.0,0', qAux2.FieldByName('Limite_Credito').AsFloat);
  EdtLimite_Compra.Text:= StringReplace(EdtLimite_Compra.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtLimite_Desconto.Text:= FormatFloat('#0.0,0', qAux2.FieldByName('Limite_Desconto').AsFloat);
  EdtLimite_Desconto.Text:= StringReplace(EdtLimite_Desconto.Text, ThousandSeparator, '', [rfReplaceAll]);

  limite_compra_disponivel:= StrToFloat(EdtLimite_Compra.Text) - StrToFloat(EdtTotal_Pedido.Text);

  EdtLimite_Compra_Disponivel.Text:= FormatFloat('#0.0,0', limite_compra_disponivel);
  EdtLimite_Compra_Disponivel.Text:= StringReplace(EdtLimite_Compra_Disponivel.Text, ThousandSeparator, '', [rfReplaceAll]);

  BBtnSalvar.Enabled:= true;
  BBtnPedido.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnVerifica_Rede.Enabled:= true;
  BBtnCancelar.Enabled:= false;   }
end;

end.
