unit UEscolha_Produtos_Importacao_XML_Entrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, ComCtrls, ToolWin, Grids, DBGrids, DB,
  ADODB, Entidade.TItensEntrada, Modelo.Dominio.EntradaProdutos.ItensEntrada,
  Entidade.TImpostosEntrada, Modelo.Dominio.EntradaProdutos.TImpostos, UGeral;

type
  TFrmEscolha_Produtos_Importacao_XML_Entrada = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnOK: TToolButton;
    ImgImagens_Comandos: TImageList;
    BBtnSair: TToolButton;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    EdtCodigo_Produto: TEdit;
    EdtProduto: TEdit;
    BBtnCadastrar: TToolButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox2: TGroupBox;
    LblProduto: TLabel;
    LblCusto: TLabel;
    LblValor_Compra: TLabel;
    LblPercentual_Vista: TLabel;
    LblPercentual_Prazo: TLabel;
    LblPreco_Vista: TLabel;
    LblPreco_Prazo: TLabel;
    Button1: TButton;
    procedure BBtnSairClick(Sender: TObject);
    procedure BBtnOKClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnCadastrarClick(Sender: TObject);
    procedure EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FItens_Entrada: TItensEntradaEntidade;
    FItensEntradaDominio: TItensEntradaDominio;
    FImpostosEntrada: TImpostosEntradaEntidade;
    FImpostosDominio : TImpostosEntradaDominio;
    Conexao: TADOConnection;
    Utili: TUtil;
    confirmado: boolean;
    procedure Lanca_Produtos;
    procedure GravaItem;
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
    constructor Create(Sender: TObject; var FItens_Entrada: TItensEntradaEntidade; var FImpostosEntrada: TImpostosEntradaEntidade);
    var
      preview: boolean;
  end;

var
  FrmEscolha_Produtos_Importacao_XML_Entrada: TFrmEscolha_Produtos_Importacao_XML_Entrada;

implementation

uses UDM, UDeclaracao, UChama_Produto, UCadastro_Produto,
  UEntrada_Produtos, pcnConversao, Util.TLog, Util.Mensagens;

{$R *.dfm}

procedure TFrmEscolha_Produtos_Importacao_XML_Entrada.GravaItem;
begin

end;

procedure TFrmEscolha_Produtos_Importacao_XML_Entrada.Lanca_Produtos;
var
  qAux: TADOQuery;
  i, qtde_itens: integer;
  custo, valor_v, valor_p: double;

  total_produtos, base_icms, valor_icms, base_icms_st, valor_icms_st, custo_total, valor_frete, valor_seguro, outras_despesas,
  total_ipi, desconto, total_nota: double;

begin
  try
    qAux:= TADOQuery.Create(self);
    i:= 0;
    qtde_itens:= 0;

    //if confirmado then
    //begin
      for i := 0 to FrmEntrada_Produtos.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Count -1 do
      begin
        with FrmEntrada_Produtos.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i],
              FrmEntrada_Produtos.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Prod,
               FrmEntrada_Produtos.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Imposto.IPI,
                FrmEntrada_Produtos.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Imposto.ICMS do
        begin
          {Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
          FrmChama_Produto.LblProduto_Entrada.Caption:= Prod.xProd;
          FrmChama_Produto.ShowModal;
          FrmChama_Produto.Free;}
          LblProduto.Caption:= Prod.xProd;
          //confirmado:= false;
          while confirmado do
          begin
            FItens_Entrada:= TItensEntradaEntidade.Create;
            FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);

            FItens_Entrada.Codigo:= StrToInt(FrmEntrada_Produtos.EdtCodigo.Text);
            FItens_Entrada.N_Item:= IntToStr(Prod.nItem);
            FItens_Entrada.N_Nota_Fiscal:= FrmEntrada_Produtos.EdtN_Nota_Fiscal.Text;
            FItens_Entrada.Codigo_Produto:= dm.qrychama_produtoCodigo.AsInteger;
            FItens_Entrada.NCM:= Prod.NCM;
            FItens_Entrada.Unidade:= Prod.uCom;
            FItens_Entrada.ST:= CSTICMSToStr(CST);
            FItens_Entrada.Valor_Ultima_Compra:= dm.qrychama_produtoValor_Compra.AsFloat;
            FItens_Entrada.Valor_Unitario:= Prod.vUnCom;
            FItens_Entrada.Quantidade:= Prod.qCom;
            FItens_Entrada.Quantidade_Restante:= 0;
            FItens_Entrada.Valor_Total:= Prod.vProd;

            FItensEntradaDominio.CalculaDespesas(FItens_Entrada, FImpostosEntrada);
            //FItens_Entrada.Valor_Frete_Unitario:= FItens_Entrada.Valor_Frete_Unitario;

            FItens_Entrada.Quantidade_Volume:= 1;
            FItens_Entrada.BC_ICMS:= vBC;
            FItens_Entrada.Aliquota_ICMS:= FloatToStr(pICMS);
            FItens_Entrada.Aliquota_IPI:= FloatToStr(pIPI);
            FItens_Entrada.CFOP:= Prod.CFOP;
            FItens_Entrada.Valor_ICMS_Unitario:= vICMS;
            FItens_Entrada.Valor_IPI:= vIPI;
            FItens_Entrada.BC_ICMS_ST:= vBCST;
            FItens_Entrada.Valor_ICMS_ST:= vICMSST;

            FItensEntradaDominio.CalculaCustoTotal(FItens_Entrada);
            //FItens_Entrada.Custo_Unitario:= FItens_Entrada.Custo_Unitario;

            FItens_Entrada.Percentual_Lucro_Vista:= dm.qrychama_produtoPercentual_Lucro_Vista.AsFloat;
            FItens_Entrada.Valor_Vista:= FItensEntradaDominio.CalculaPrecoVenda(FItens_Entrada.Percentual_Lucro_Vista, FItens_Entrada.Custo_Unitario);

            FItens_Entrada.Percentual_Lucro_Prazo:= dm.qrychama_produtoPercentual_Lucro_Prazo.AsFloat;
            FItens_Entrada.Valor_Prazo:= FItensEntradaDominio.CalculaPrecoVenda(FItens_Entrada.Percentual_Lucro_Prazo, FItens_Entrada.Custo_Unitario);

            FItens_Entrada.Valor_Vista_Ultimo:= dm.qrychama_produtoPreco_Vista.AsFloat;
            FItens_Entrada.Valor_Prazo_Ultimo:= dm.qrychama_produtoPreco_Prazo.AsFloat;
            FItens_Entrada.IVA:= 0;
            FItens_Entrada.Checado:= 'N';
            FItens_Entrada.Codigo_Produto_Fornecedor:= Prod.cProd;
            FItens_Entrada.Descricao_Produto:= Prod.xProd;
            FItens_Entrada.Valor_Ultima_Compra_Unitario:= dm.qrychama_produtoValor_Compra_Unitario.AsFloat;
            FItens_Entrada.Qtde_Estoque_Atual:= dm.qrychama_produtoEstoque.AsFloat;
            FItens_Entrada.Ficha_Estoque_Codigo:= 0;

            FItens_Entrada.Data_Validade:= 0;

            FItensEntradaDominio:= TItensEntradaDominio.Create(Conexao);
            FItensEntradaDominio.GravaItem(FItens_Entrada);

            Inc(qtde_itens);
            confirmado:= false;
          end;
        end;
      end;
    //end;

    FrmEntrada_Produtos.EdtQuantidade_Itens.Text:= IntToStr(qtde_itens);
  except
    on E : Exception do
    begin
      TLog.Error(Self.ClassName+' - Lanca_Produtos - '+E.Message);
      TMensagens.MensagemErro('Método Lanca_Produtos: '+E.Message);
    end;
  end;
end;

procedure TFrmEscolha_Produtos_Importacao_XML_Entrada.BBtnCadastrarClick(
  Sender: TObject);
begin
  Verifica_Form_Aberto(FrmCadastro_Produto);

  Application.CreateForm(TFrmCadastro_Produto, FrmCadastro_Produto);
  FrmCadastro_Produto.Show;
  Centraliza_Form(FrmCadastro_Produto);
end;

procedure TFrmEscolha_Produtos_Importacao_XML_Entrada.BBtnOKClick(Sender: TObject);
begin
  //Lanca_Produtos;
  confirmado:= True;
  FrmEntrada_Produtos.Atualiza_Dados;
  //FrmEscolha_Produtos_Importacao_XML_Entrada.Close;
end;

procedure TFrmEscolha_Produtos_Importacao_XML_Entrada.BBtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmEscolha_Produtos_Importacao_XML_Entrada.Button1Click(
  Sender: TObject);
begin
  Lanca_Produtos;
end;

constructor TFrmEscolha_Produtos_Importacao_XML_Entrada.Create(Sender: TObject;
  var FItens_Entrada: TItensEntradaEntidade;
  var FImpostosEntrada: TImpostosEntradaEntidade);
begin
  Self.FItens_Entrada:= FItens_Entrada;
  Self.FImpostosEntrada:= FImpostosEntrada;
  inherited Create(nil);
end;

procedure TFrmEscolha_Produtos_Importacao_XML_Entrada.DBGrid1DrawColumnCell(Sender: TObject;
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
end;

procedure TFrmEscolha_Produtos_Importacao_XML_Entrada.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_ESCAPE) then
    close;
end;

procedure TFrmEscolha_Produtos_Importacao_XML_Entrada.EdtCodigo_ProdutoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = VK_F3) then
  begin
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free;
  end;
end;

procedure TFrmEscolha_Produtos_Importacao_XML_Entrada.EdtCodigo_ProdutoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Utili.Somente_Apaga(key);
end;

procedure TFrmEscolha_Produtos_Importacao_XML_Entrada.EdtProdutoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Utili.Somente_Apaga(key);
end;

procedure TFrmEscolha_Produtos_Importacao_XML_Entrada.FormActivate(
  Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmEscolha_Produtos_Importacao_XML_Entrada.FormCreate(
  Sender: TObject);
begin
  confirmado:= false;
end;

procedure TFrmEscolha_Produtos_Importacao_XML_Entrada.FormDeactivate(
  Sender: TObject);
begin
  ativo:= false;
end;

end.
