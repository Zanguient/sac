unit UChama_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  UGeral,
  ADODB, UConsulta, UCadastro_Cliente, DBClient, Provider;

type
  TFrmChama_Produto = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    ImgImagens: TImageList;
    LblMarca: TLabel;
    LblProduto: TLabel;
    LblProduto_Similar: TLabel;
    RGStatus: TRadioGroup;
    LblProduto_Entrada: TLabel;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure EdtProduto_SimilarChange(Sender: TObject);
    procedure EdtConsultaEnter(Sender: TObject);
    procedure RGStatusClick(Sender: TObject);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private

    qAuxPreco: TADOQuery;

    procedure Pega_Tributos;
    procedure Pega_Produto_Compra;
    procedure Pega_Percentual_Tabela_Preco;

    { Private declarations }
  public
    procedure procuraProdutoCodigo;
  end;

var
  FrmChama_Produto: TFrmChama_Produto;
  Utili: TUtil;
  Consulta: TConsulta;

implementation

uses UDM, UCadastro_Forn_Fab, UCadastro_Produto, UPDV, UPedido_Venda,
  UDeclaracao, UCompra, UMovimentacao_Manual, UOS, UPre_Venda,
  UEntrada_Produtos, UConsulta_Preco_Produto, UCotacao_Preco_Produto,
  URetorno_Cotacao, UConsulta_Comparativo_Preco_Cotacao, UFabricacao, UReceita,
  UConsulta_Saldo_Estoque, UConsulta_Reposicao_Estoque,
  UTabela_Indice_Tecnico_Producao, UGera_Etiqueta_Produto,
  UGera_Etiqueta_Produto_2, UMenu_Geral, UConsulta_Historico_Movimentacao,
  UGera_Etiqueta_Impressora_Etiqueta, Entidade.TItensEntrada,
  UEscolha_Produtos_Importacao_XML_Entrada, Util.TLog;

{$R *.dfm}

procedure TFrmChama_Produto.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Produto.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Produto(EdtConsulta.Text);
end;

procedure TFrmChama_Produto.DBGrid1CellClick(Column: TColumn);
begin
  // Consulta.Chama_Produto_Similar_Consulta;
  // LblProduto_Similar.Caption:= 'Você tem ' + IntToStr(dm.qrychama_produto_similar.RecordCount) + ' produtos similares para o produto selecionado';

  FrmMenu_Geral.produto_escolhido := dm.qrychama_produtoDescricao.AsString;
end;

procedure TFrmChama_Produto.DBGrid1DblClick(Sender: TObject);
var
  val_aux: double;
  Conec: TADOConnection;
begin
  TLog.Info('--- MÉTODO DUPLO CLIQUE NA GRID DE PRODUTOS ---');
  if (FrmCadastro_Produto <> Nil) and (FrmCadastro_Produto.ativo = true) and
    (FrmCadastro_Produto.copiar_prod = false) then
  begin
    FrmCadastro_Produto.EdtCodigo.Text := dm.qrychama_produtoCodigo.AsString;
    FrmCadastro_Produto.MEdtData_Cadastro.Text :=
      dm.qrychama_produtoData_Cadastro.AsString;

    if (dm.qrychama_produtoGera_Comissao.AsString = 'SIM') then
      FrmCadastro_Produto.CBGera_Comissao.Checked := true
    else
      FrmCadastro_Produto.CBGera_Comissao.Checked := false;

    if (dm.qrychama_produtoAceita_Devolucao.AsString = 'SIM') then
      FrmCadastro_Produto.CBAceita_Devolucao.Checked := true
    else
      FrmCadastro_Produto.CBAceita_Devolucao.Checked := false;

    if (dm.qrychama_produtoTipo.AsInteger = 0) then
      FrmCadastro_Produto.CBServico.Checked := false
    else
      FrmCadastro_Produto.CBServico.Checked := true;

    if (dm.qrychama_produtoStatus.AsString = 'ATIVO') then
      FrmCadastro_Produto.CBAtivo.Checked := true
    else
      FrmCadastro_Produto.CBAtivo.Checked := false;

    if (dm.qrychama_produtoProducao_Propria.AsString = 'P') then
      FrmCadastro_Produto.CBProducao_Propria.Checked := true
    else
      FrmCadastro_Produto.CBProducao_Propria.Checked := false;

    FrmCadastro_Produto.EdtCodigo_Original.Text :=
      dm.qrychama_produtoCodigo_Original.AsString;
    FrmCadastro_Produto.EdtCodigo_Produto.Text :=
      dm.qrychama_produtoCodigo_Venda.AsString;
    FrmCadastro_Produto.EdtCodigo_Similar.Text :=
      dm.qrychama_produtoCodigo_Similar.AsString;
    FrmCadastro_Produto.EdtDescricao.Text :=
      dm.qrychama_produtoDescricao.AsString;
    if (dm.qrychama_produtoCodigo_Fornecedor.AsString = '0') then
    begin
      FrmCadastro_Produto.EdtCodigo_Fornecedor.Text := '';
      FrmCadastro_Produto.EdtFornecedor.Text := '';
    end
    else
    begin
      FrmCadastro_Produto.EdtCodigo_Fornecedor.Text :=
        dm.qrychama_produtoCodigo_Fornecedor.AsString;
      FrmCadastro_Produto.EdtFornecedor.Text :=
        dm.qrychama_produtoNome_Fantasia.AsString;
    end;

    if (dm.qrychama_produtoCodigo_Fabricante.AsString = '0') then
    begin
      FrmCadastro_Produto.EdtCodigo_Fabricante.Text := '';
      FrmCadastro_Produto.EdtFabricante.Text := '';
    end
    else
    begin
      FrmCadastro_Produto.EdtCodigo_Fabricante.Text :=
        dm.qrychama_produtoCodigo_Fabricante.AsString;
      FrmCadastro_Produto.EdtFabricante.Text :=
        dm.qrychama_produtoFabricante.AsString;
    end;

    if (dm.qrychama_produtoCodigo_Marca.AsString = '0') then
    begin
      FrmCadastro_Produto.EdtCodigo_Marca.Text := '';
      FrmCadastro_Produto.EdtMarca.Text := '';
    end
    else
    begin
      FrmCadastro_Produto.EdtCodigo_Marca.Text :=
        dm.qrychama_produtoCodigo_Marca.AsString;
      FrmCadastro_Produto.EdtMarca.Text := dm.qrychama_produtoMarca.AsString;
    end;

    if (dm.qrychama_produtoCodigo_Unidade_Medida.AsString = '0') then
    begin
      FrmCadastro_Produto.EdtCodigo_Unidade.Text := '';
      FrmCadastro_Produto.EdtUnidade.Text := '';
    end
    else
    begin
      FrmCadastro_Produto.EdtCodigo_Unidade.Text :=
        dm.qrychama_produtoCodigo_Unidade_Medida.AsString;
      FrmCadastro_Produto.EdtUnidade.Text := dm.qrychama_produtoSigla.AsString;
    end;

    if (dm.qrychama_produtoCodigo_Unidade_Volume.AsString = '0') then
    begin
      FrmCadastro_Produto.EdtCodigo_Unidade_Volume.Text := '';
      FrmCadastro_Produto.EdtUnidade_Volume.Text := '';
    end
    else
    begin
      FrmCadastro_Produto.EdtCodigo_Unidade_Volume.Text :=
        dm.qrychama_produtoCodigo_Unidade_Volume.AsString;
      FrmCadastro_Produto.EdtUnidade_Volume.Text :=
        dm.qrychama_produtoSigla2.AsString;
    end;

    if (dm.qrychama_produtoCodigo_Grupo.AsString = '0') then
    begin
      FrmCadastro_Produto.EdtCodigo_Grupo.Text := '';
      FrmCadastro_Produto.EdtGrupo.Text := '';
    end
    else
    begin
      FrmCadastro_Produto.EdtCodigo_Grupo.Text :=
        dm.qrychama_produtoCodigo_Grupo.AsString;
      FrmCadastro_Produto.EdtGrupo.Text :=
        dm.qrychama_produtoGrupo_Produto.AsString;
    end;

    if (dm.qrychama_produtoCodigo_Local.AsString = '0') then
    begin
      FrmCadastro_Produto.EdtCodigo_Local.Text := '';
      FrmCadastro_Produto.EdtLocal.Text := '';
    end
    else
    begin
      FrmCadastro_Produto.EdtCodigo_Local.Text :=
        dm.qrychama_produtoCodigo_Local.AsString;
      FrmCadastro_Produto.EdtLocal.Text := dm.qrychama_produtoLocal.AsString;
    end;

    if (dm.qrychama_produtoData_Fabricacao.AsString = '30/12/1899') then
      FrmCadastro_Produto.MEdtData_Fabricacao.Text := ''
    else
      FrmCadastro_Produto.MEdtData_Fabricacao.Text :=
        dm.qrychama_produtoData_Fabricacao.AsString;

    if (dm.qrychama_produtoData_Validade.AsString = '30/12/1899') then
      FrmCadastro_Produto.MEdtData_Validade.Text := ''
    else
      FrmCadastro_Produto.MEdtData_Validade.Text :=
        dm.qrychama_produtoData_Validade.AsString;

    if (dm.qrychama_produtoUltima_Compra.AsString = '30/12/1899') then
      FrmCadastro_Produto.MEdtUltima_Compra.Text := ''
    else
      FrmCadastro_Produto.MEdtUltima_Compra.Text :=
        dm.qrychama_produtoUltima_Compra.AsString;

    if (dm.qrychama_produtoUltima_Venda.AsString = '30/12/1899') then
      FrmCadastro_Produto.MEdtUltima_Venda.Text := ''
    else
      FrmCadastro_Produto.MEdtUltima_Venda.Text :=
        dm.qrychama_produtoUltima_Venda.AsString;

    if (dm.qrychama_produtoData_Atualizacao_Estoque.AsString = '30/12/1899')
    then
      FrmCadastro_Produto.MEdtData_Atualizacao_Estoque.Text := ''
    else
      FrmCadastro_Produto.MEdtData_Atualizacao_Estoque.Text :=
        dm.qrychama_produtoData_Atualizacao_Estoque.AsString;

    FrmCadastro_Produto.EdtValor_Compra.Text :=
      FormatFloat('#0.0,0', dm.qrychama_produtoValor_Compra.AsFloat);
    FrmCadastro_Produto.EdtValor_Compra.Text :=
      StringReplace(FrmCadastro_Produto.EdtValor_Compra.Text, ThousandSeparator,
      '', [rfReplaceAll]);

    FrmCadastro_Produto.EdtValor_Compra_Unitario.Text :=
      FormatFloat('#0.0,0', dm.qrychama_produtoValor_Compra_Unitario.AsFloat);
    FrmCadastro_Produto.EdtValor_Compra_Unitario.Text :=
      StringReplace(FrmCadastro_Produto.EdtValor_Compra_Unitario.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Produto.EdtValor_Ultima_Compra_Unitario.Text :=
      FormatFloat('#0.0,0',
      dm.qrychama_produtoValor_Ultima_Compra_Unitario.AsFloat);
    FrmCadastro_Produto.EdtValor_Ultima_Compra_Unitario.Text :=
      StringReplace(FrmCadastro_Produto.EdtValor_Ultima_Compra_Unitario.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Produto.EdtValor_Medio.Text :=
      FormatFloat('#0.0,0', dm.qrychama_produtoValor_Medio.AsFloat);
    FrmCadastro_Produto.EdtValor_Medio.Text :=
      StringReplace(FrmCadastro_Produto.EdtValor_Medio.Text, ThousandSeparator,
      '', [rfReplaceAll]);

    FrmCadastro_Produto.EdtSaldo_Estoque.Text :=
      FormatFloat('#0.0,0', dm.qrychama_produtoSaldo_Estoque.AsFloat);
    FrmCadastro_Produto.EdtSaldo_Estoque.Text :=
      StringReplace(FrmCadastro_Produto.EdtSaldo_Estoque.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Produto.EdtCodigo_Grupo_Tributacao.Text :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao.AsString;
    FrmCadastro_Produto.EdtGrupo_Tributacao.Text :=
      dm.qrychama_produtoDescricao_TICMS.AsString;

    FrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_IPI.Text :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_IPI.AsString;
    FrmCadastro_Produto.EdtGrupo_Tributacao_IPI.Text :=
      dm.qrychama_produtoDescricao_TIPI.AsString;

    FrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_PIS.Text :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_PIS.AsString;
    FrmCadastro_Produto.EdtGrupo_Tributacao_PIS.Text :=
      dm.qrychama_produtoDescricao_TPIS.AsString;

    FrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_COFINS.Text :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_COFINS.AsString;
    FrmCadastro_Produto.EdtGrupo_Tributacao_COFINS.Text :=
      dm.qrychama_produtoDescricao_TCO.AsString;

    FrmCadastro_Produto.EdtCodigo_Grupo_Tributacao_ISSQN.Text :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_ISSQN.AsString;

    FrmCadastro_Produto.p_vista := dm.qrychama_produtoPVistaG.AsFloat;
    FrmCadastro_Produto.p_prazo := dm.qrychama_produtoPPrazoG.AsFloat;
    FrmCadastro_Produto.p_des_vista := dm.qrychama_produtoPDesVistaG.AsFloat;
    FrmCadastro_Produto.p_des_prazo := dm.qrychama_produtoPDesPrazoG.AsFloat;

    FrmCadastro_Produto.p_vista_T :=
      dm.qrychama_produtoPercentual_Lucro_Vista.AsFloat;
    FrmCadastro_Produto.p_prazo_T :=
      dm.qrychama_produtoPercentual_Lucro_Prazo.AsFloat;
    FrmCadastro_Produto.p_des_vista_T :=
      dm.qrychama_produtoPercentual_Desconto_Vista.AsFloat;
    FrmCadastro_Produto.p_des_prazo_T :=
      dm.qrychama_produtoPercentual_Desconto_Prazo.AsFloat;

    FrmCadastro_Produto.EdtValor_Medio.Text :=
      FormatFloat('#0.0,0', dm.qrychama_produtoValor_Medio.AsFloat);
    FrmCadastro_Produto.EdtValor_Medio.Text :=
      StringReplace(FrmCadastro_Produto.EdtValor_Medio.Text, ThousandSeparator,
      '', [rfReplaceAll]);
    FrmCadastro_Produto.EdtValor_Ultima_Compra.Text :=
      FormatFloat('#0.0,0', dm.qrychama_produtoValor_Ultima_Compra.AsFloat);
    FrmCadastro_Produto.EdtValor_Ultima_Compra.Text :=
      StringReplace(FrmCadastro_Produto.EdtValor_Ultima_Compra.Text,
      ThousandSeparator, '', [rfReplaceAll]);
    FrmCadastro_Produto.EdtEstoque_Maximo.Text :=
      FormatFloat('#0.0,0', dm.qrychama_produtoEstoque_Maximo.AsFloat);
    FrmCadastro_Produto.EdtEstoque_Maximo.Text :=
      StringReplace(FrmCadastro_Produto.EdtEstoque_Maximo.Text,
      ThousandSeparator, '', [rfReplaceAll]);
    FrmCadastro_Produto.EdtEstoque_Minimo.Text :=
      FormatFloat('#0.0,0', dm.qrychama_produtoEstoque_Minimo.AsFloat);
    FrmCadastro_Produto.EdtEstoque_Minimo.Text :=
      StringReplace(FrmCadastro_Produto.EdtEstoque_Minimo.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Produto.EdtPreco_Vista.Text :=
      FormatFloat('#0.0,0', dm.qrychama_produtoPreco_Vista.AsFloat);
    FrmCadastro_Produto.EdtPreco_Vista.Text :=
      StringReplace(FrmCadastro_Produto.EdtPreco_Vista.Text, ThousandSeparator,
      '', [rfReplaceAll]);

    FrmCadastro_Produto.EdtPreco_Prazo.Text :=
      FormatFloat('#0.0,0', dm.qrychama_produtoPreco_Prazo.AsFloat);
    FrmCadastro_Produto.EdtPreco_Prazo.Text :=
      StringReplace(FrmCadastro_Produto.EdtPreco_Prazo.Text, ThousandSeparator,
      '', [rfReplaceAll]);

    FrmCadastro_Produto.EdtPercentual_Desconto_Vista.Text :=
      FormatFloat('#0.0,0',
      dm.qrychama_produtoPercentual_Desconto_Vista.AsFloat);
    FrmCadastro_Produto.EdtPercentual_Desconto_Vista.Text :=
      StringReplace(FrmCadastro_Produto.EdtPercentual_Desconto_Vista.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Produto.EdtPercentual_Desconto_Prazo.Text :=
      FormatFloat('#0.0,0',
      dm.qrychama_produtoPercentual_Desconto_Prazo.AsFloat);
    FrmCadastro_Produto.EdtPercentual_Desconto_Prazo.Text :=
      StringReplace(FrmCadastro_Produto.EdtPercentual_Desconto_Prazo.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Produto.EdtPercentual_Lucro_Vista.Text :=
      FormatFloat('#0.0,0', dm.qrychama_produtoPercentual_Lucro_Vista.AsFloat);
    FrmCadastro_Produto.EdtPercentual_Lucro_Vista.Text :=
      StringReplace(FrmCadastro_Produto.EdtPercentual_Lucro_Vista.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Produto.EdtPercentual_Lucro_Prazo.Text :=
      FormatFloat('#0.0,0', dm.qrychama_produtoPercentual_Lucro_Prazo.AsFloat);
    FrmCadastro_Produto.EdtPercentual_Lucro_Prazo.Text :=
      StringReplace(FrmCadastro_Produto.EdtPercentual_Lucro_Prazo.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Produto.EdtPercentual_Comissao_Vista.Text :=
      FormatFloat('#0.0,0',
      dm.qrychama_produtoPercentual_Comissao_Vista.AsFloat);
    FrmCadastro_Produto.EdtPercentual_Comissao_Vista.Text :=
      StringReplace(FrmCadastro_Produto.EdtPercentual_Comissao_Vista.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Produto.EdtPercentual_Comissao_Prazo.Text :=
      FormatFloat('#0.0,0',
      dm.qrychama_produtoPercentual_Comissao_Prazo.AsFloat);
    FrmCadastro_Produto.EdtPercentual_Comissao_Prazo.Text :=
      StringReplace(FrmCadastro_Produto.EdtPercentual_Comissao_Prazo.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Produto.EdtEstoque.Text := dm.qrychama_produtoEstoque.AsString;

    FrmCadastro_Produto.qtde_est := dm.qrychama_produtoEstoque.AsFloat;
    FrmCadastro_Produto.EdtEstoque_Reservado.Text :=
      dm.qrychama_produtoEstoque_Reservado.AsString;
    FrmCadastro_Produto.EdtVolume.Text :=
      FormatFloat('#0.0,0', dm.qrychama_produtoVolume.AsFloat);
    FrmCadastro_Produto.EdtVolume.Text :=
      StringReplace(FrmCadastro_Produto.EdtVolume.Text, ThousandSeparator, '',
      [rfReplaceAll]);
    FrmCadastro_Produto.EdtVolume_Total.Text :=
      FormatFloat('#0.0,0', dm.qrychama_produtoVolume_Total.AsFloat);
    FrmCadastro_Produto.EdtVolume_Total.Text :=
      StringReplace(FrmCadastro_Produto.EdtVolume_Total.Text, ThousandSeparator,
      '', [rfReplaceAll]);

    FrmCadastro_Produto.CmbEstoque_Minimo.Text :=
      dm.qrychama_produtoEm_Estoque_Minimo.AsString;
    FrmCadastro_Produto.CmbEstoque_Maximo.Text :=
      dm.qrychama_produtoEm_Estoque_Maximo.AsString;
    FrmCadastro_Produto.EdtNCM.Text := dm.qrychama_produtoNCM.AsString;
    FrmCadastro_Produto.MMOAplicacao.Text :=
      dm.qrychama_produtoAplicacao.AsString;

    // if (Verifica_Status_Rede) then
    // begin
    Pega_Tributos;
    FrmCadastro_Produto.Pega_Preco_Tabela; // mexi aqui status rede
    // FrmCadastro_Produto.ClientDataSet1.Close;
    // FrmCadastro_Produto.ClientDataSet1.Open;
    // end;
    FrmCadastro_Produto.Chama_Imagens;
    FrmCadastro_Produto.Atualiza_Preco_Fornecedor;
    FrmCadastro_Produto.Atualiza_Historico_Movimentacao;
    FrmCadastro_Produto.Atualiza_Codigo_Fornecedor;
    FrmCadastro_Produto.qryhistorico_produto.close;
    FrmCadastro_Produto.EdtValor_Total_Historico.Text := '0,00';

    if (usu_adm = 'SIM') then
    begin
      FrmCadastro_Produto.EdtEstoque.ReadOnly:= false;
    end
    else
    begin
      FrmCadastro_Produto.EdtEstoque.ReadOnly:= true;
    end;

    FrmChama_Produto.close;
    FrmCadastro_Produto.BBtnSalvar.Enabled := true;
    FrmCadastro_Produto.BBtnExcluir.Enabled := true;
    FrmCadastro_Produto.BBtnPesquisar.Enabled := true;
    FrmCadastro_Produto.BBtnCancelar.Enabled := true;
    FrmCadastro_Produto.BBtnNovo.Enabled := false;
    FrmCadastro_Produto.PageControl2.TabIndex := 0;
    FrmCadastro_Produto.PageControl8.TabIndex := 0;
    Utili.Habilita_Campos(FrmCadastro_Produto);
    FrmCadastro_Produto.achei := true;
  end
  else if (FrmCadastro_Produto <> Nil) and (FrmCadastro_Produto.ativo = true)
    and (FrmCadastro_Produto.copiar_prod = true) then
  begin
    if (Application.MessageBox('Confirma a copia do registro selecionado?',
      'Copia de registro', MB_YESNO + MB_ICONQUESTION)) = IDYES then
    begin
      FrmCadastro_Produto.Copia_Produto(dm.qrychama_produtoCodigo.AsInteger);
      FrmCadastro_Produto.Copia_Produto_Tabela
        (dm.qrychama_produtoCodigo.AsInteger);
      Cria_Arquivo_Atualiza_Dados('IITPr');
      Cria_Arquivo_Atualiza_Dados('IProd');
      FrmChama_Produto.close;
    end;
  end
  else if (FrmPDV <> nil) and (FrmPDV.pode_chamar) then
  begin
    TLog.Debug('Tipo local: '+tipo_local);
    if (tipo_local = '0101') then
    begin
      Conec:= dm.ADOConnectionLocal;
    end
    else
    begin
      Conec:= dm.ADOConnection1;
    end;

    {TLog.Debug('IP Servidor: '+ipservidor);
    TLog.Debug('Qtde. Maquinas: '+qtde_mac);
    if (Verifica_Status_Rede(ipservidor)) or (qtde_mac = '1') then
    begin
      sem_rede:= false;
    end
    else
    begin
      sem_rede:= true;
    end;

    if (sem_rede = false) then
    begin
      TLog.Debug('Variável sem_rede: false. Vai verificar o NCM no db_proj_fav.');
      if (dm.qrychama_produtoNCM.AsString = '') then
      begin
        if (Application.MessageBox(PChar('O código NCM do produto ' +
          dm.qrychama_produtoDescricao.AsString +
          ' ESTÁ EM BRANCO. Para calcular o imposto na nota, é necessário configura-lo. Deseja continuar?'),
          'NCM não encontrado', MB_YESNO + MB_ICONEXCLAMATION)) = IDNO then
        begin
          abort;
        end;
      end;

      if not(Verifica_NCM_Ja_Existe(dm.qrychama_produtoNCM.AsString,
        Conec)) then
      begin
        if (Application.MessageBox(PChar('O código NCM do produto ' +
          dm.qrychama_produtoDescricao.AsString +
          ' NÃO FOI ENCONTRADO no cadastro de NCM. Para calcular o imposto na nota, é necessário configura-lo. Deseja continuar?'),
          'NCM não encontrado', MB_YESNO + MB_ICONEXCLAMATION)) = IDNO then
        begin
          abort;
        end;
      end;
    end
    else
    begin
      TLog.Debug('Variável sem_rede: true. Não vai verificar o NCM no db_proj_fav.');
    end;}

    FrmPDV.EdtCodigo_Produto.Text := dm.qrychama_produtoCodigo_Venda.AsString;
    FrmPDV.LblProduto.Caption := dm.qrychama_produtoDescricao.AsString;
    FrmPDV.LblNCM.Caption := dm.qrychama_produtoNCM.AsString;
    FrmPDV.cod_prod := dm.qrychama_produtoCodigo_Venda.AsString;
    FrmPDV.EdtValor_Unitario.Text := FormatFloat('#0.0,0',
      dm.qrychama_produtoPreco_Vista.AsFloat);
    // FormatFloat('#0.0,0', dm.qrychama_produtoValor_Venda.AsFloat);
    FrmPDV.EdtValor_Unitario.Text :=
      StringReplace(FrmPDV.EdtValor_Unitario.Text, ThousandSeparator, '',
      [rfReplaceAll]);
    FrmPDV.valor_compra := dm.qrychama_produtoValor_Compra.AsFloat;
    FrmPDV.valor_compra_nota :=
      dm.qrychama_produtoValor_Compra_Unitario.AsFloat;
    FrmPDV.IAT := dm.qrychama_produtoArred_Trunc.AsString;
    FrmPDV.IPPT := dm.qrychama_produtoProducao_Propria.AsString;
    grupo_produto_tributacao_icms :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao.AsString;

    if (dm.qrychama_produtoTipo.AsInteger = 0) then
    begin
      // ----icms----

      Pega_ICMS_NC(dm.qrychama_produtoCodigo_Grupo_Tributacao.AsInteger,
        Conec);

      FrmPDV.LblCFOP.Caption := qAux_ICMS.FieldByName('CFOP_D').AsString;
      FrmPDV.LblST.Caption := qAux_ICMS.FieldByName('Aliquota').AsString;
      icms := qAux_ICMS.FieldByName('Aliquota').AsString;
      cst_icms := qAux_ICMS.FieldByName('Codigo_Situacao').AsString;
      csosn := qAux_ICMS.FieldByName('Codigo_CSOSN').AsString;
      origem := qAux_ICMS.FieldByName('Origem').AsString;
      tipo_calculo_bc_icms := qAux_ICMS.FieldByName
        ('Tipo_Calculo_BC_ICMS').AsString;
      tipo_calculo_bc_icms_st := qAux_ICMS.FieldByName
        ('Tipo_Calculo_BC_ICMS_ST').AsString;
      tipo_recolhimento_icms := qAux_ICMS.FieldByName
        ('Tipo_Recolhimento').AsString;

      permite_credito := qAux_ICMS.FieldByName('Permite_Credito').AsInteger;
      codigo_obs_fiscal := qAux_ICMS.FieldByName('Codigo_Obs_Fiscal').AsInteger;

      br_icms := qAux_ICMS.FieldByName('Percentual_BC_Reduzida').AsString;

      // ---- fim icms----


      // ----icms nf----

      if (FrmPDV.cli_uf <> '') then
      begin
        Pega_ICMS_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao.AsInteger,
          uf, FrmPDV.cli_uf, Conec);
      end
      else
      begin
        Pega_ICMS_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao.AsInteger,
          uf, uf, Conec);
      end;

      // ---- fim icms nf----


      // ----ipi----

      Pega_IPI_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao_IPI.AsInteger, Conec);

      ipi := qAux_IPI.FieldByName('Aliquota').AsString;
      cst_ipi := qAux_IPI.FieldByName('Codigo_Situacao').AsString;

      if (qAux_IPI.FieldByName('Base_Reduzida').AsString = 'SIM') then
        br_ipi := qAux_IPI.FieldByName('Percentual_BC_Reduzida').AsString
      else
        br_ipi := '';

      if (qAux_IPI.FieldByName('Base_Acrescida').AsString = 'SIM') then
        ba_ipi := qAux_IPI.FieldByName('Percentual_BC_Acrescida').AsString
      else
        ba_ipi := '';

      // ----fim ipi----

      // ----pis----

      Pega_PIS_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao_PIS.AsInteger, Conec);

      pis := qAux_PIS.FieldByName('Aliquota').AsString;
      cst_pis := qAux_PIS.FieldByName('Codigo_Situacao').AsString;

      if (qAux_PIS.FieldByName('Base_Reduzida').AsString = 'SIM') then
        br_pis := qAux_PIS.FieldByName('Percentual_BC_Reduzida').AsString
      else
        br_pis := '';

      if (qAux_PIS.FieldByName('Base_Acrescida').AsString = 'SIM') then
        ba_pis := qAux_PIS.FieldByName('Percentual_BC_Acrescida').AsString
      else
        ba_pis := '';

      // ---- fim pis----

      // ----cofins----

      Pega_COFINS_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao_COFINS.
        AsInteger, Conec);

      cofins := qAux_COFINS.FieldByName('Aliquota').AsString;
      cst_cofins := qAux_COFINS.FieldByName('Codigo_Situacao').AsString;

      if (qAux_COFINS.FieldByName('Base_Reduzida').AsString = 'SIM') then
        br_cofins := qAux_COFINS.FieldByName('Percentual_BC_Reduzida').AsString
      else
        br_cofins := '';

      if (qAux_COFINS.FieldByName('Base_Acrescida').AsString = 'SIM') then
        ba_cofins := qAux_COFINS.FieldByName('Percentual_BC_Acrescida').AsString
      else
        ba_cofins := '';

      // ---- fim cofins----

    end
    else
    begin
      Pega_ISS(dm.qrychama_produtoCodigo_Grupo_Tributacao_ISSQN.AsInteger);

      FrmPDV.LblST.Caption := qAux_ISS.FieldByName('Aliquota').AsString;
      icms := qAux_ISS.FieldByName('Aliquota').AsString;
      cst_icms := '00';

      if (qAux_ISS.FieldByName('Base_Reduzida').AsString = 'SIM') then
        br_icms := qAux_ISS.FieldByName('Percentual_BC_Reduzida').AsString
      else
        br_icms := '';

    end;

    FrmPDV.cod_produto := dm.qrychama_produtoCodigo.AsInteger;
    // dm.qrychama_produtoCodigo.AsInteger;
    FrmPDV.codigo_produto := dm.qrychama_produtoCodigo_Venda.AsString;
    // dm.qrychama_produtoCodigo_Venda.AsString;
    FrmPDV.descricao := dm.qrychama_produtoDescricao.AsString;
    // dm.qrychama_produtoDescricao.AsString;
    FrmPDV.unid_med := dm.qrychama_produtoSigla.AsString;
    // dm.qrychama_produtoSigla.AsString;
    FrmPDV.tipo_prod := dm.qrychama_produtoTipo.AsString;

    if (tipo_recolhimento_icms = 'I') then
      FrmPDV.tipo_trib := 'I'
    else if (tipo_recolhimento_icms = 'NT') then
      FrmPDV.tipo_trib := 'N'
    else if (tipo_recolhimento_icms = 'ST') then
      FrmPDV.tipo_trib := 'F'
    else
      FrmPDV.tipo_trib := 'T';

    FrmPDV.var_uni := dm.qrychama_produtoPreco_Vista.AsFloat;
    FrmPDV.novo_valor_uni := dm.qrychama_produtoPreco_Vista.AsFloat;

    permissao_venda := dm.qrychama_produtoEm_Estoque_Minimo.AsString;
    permissao_compra := dm.qrychama_produtoEm_Estoque_Maximo.AsString;
    estoque_minimo := dm.qrychama_produtoEstoque_Minimo.AsFloat;
    estoque_maximo := dm.qrychama_produtoEstoque_Maximo.AsFloat;
    qtde_estoque := dm.qrychama_produtoEstoque.AsFloat;
    FrmPDV.pesquisa := true;
    FrmPDV.EdtQuantidade.SetFocus;
    FrmChama_Produto.close;
  end
  else if (FrmPedido_Venda <> Nil) and (FrmPedido_Venda.ativo = true) then
  begin
    TLog.Info('--- CHAMA PRODUTO - DUPLO CLIQUE NO PRODUTO ---');
    if (dm.qrychama_produtoNCM.AsString = '') then
    begin
      if (Application.MessageBox(PChar('O código NCM do produto ' +
        dm.qrychama_produtoDescricao.AsString +
        ' ESTÁ EM BRANCO. Para calcular o imposto na nota, é necessário configura-lo. Deseja continuar?'),
        'NCM não encontrado', MB_YESNO + MB_ICONEXCLAMATION)) = IDNO then
      begin
        abort;
      end;
    end;

    TLog.Debug('Verificou NCM em branco.');
    if not(Verifica_NCM_Ja_Existe(dm.qrychama_produtoNCM.AsString,
      FrmPedido_Venda.Conexao)) then
    begin
      if (Application.MessageBox(PChar('O código NCM do produto ' +
        dm.qrychama_produtoDescricao.AsString +
        ' NÃO FOI ENCONTRADO no cadastro de NCM. Para calcular o imposto na nota, é necessário configura-lo. Deseja continuar?'),
        'NCM não encontrado', MB_YESNO + MB_ICONEXCLAMATION)) = IDNO then
      begin
        abort;
      end;
    end;

    TLog.Debug('Verificou NCM não cadastrado.');
    FrmPedido_Venda.LblProduto.Caption := dm.qrychama_produtoCodigo.AsString;
    FrmPedido_Venda.LblTipo.Caption := dm.qrychama_produtoTipo.AsString;
    FrmPedido_Venda.LblNCM.Caption := dm.qrychama_produtoNCM.AsString;

    FrmPedido_Venda.EdtCodigo_Produto.Text :=
      dm.qrychama_produtoCodigo_Venda.AsString;
    FrmPedido_Venda.EdtProduto.Text := dm.qrychama_produtoDescricao.AsString;
    FrmPedido_Venda.EdtUnidade.Text := dm.qrychama_produtoSigla.AsString;
    FrmPedido_Venda.valor_compra := dm.qrychama_produtoValor_Compra.AsFloat;
    FrmPedido_Venda.valor_compra_nota :=
      dm.qrychama_produtoValor_Compra_Unitario.AsFloat;
    grupo_produto_tributacao_icms :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao.AsString;
    TLog.Debug('Tipo de Pagamento: ' + FrmPedido_Venda.tipo_pag);

    if (FrmPedido_Venda.tipo_pag = 'A VISTA') then
    begin
      if (dm.qrychama_produtoPreco_Prazo.AsFloat = dm.
        qrychama_produtoPreco_Vista.AsFloat) then
      begin
        if (FrmPedido_Venda.tipo_juro = 'C') then
          val_aux := Calcula_Juro_Composto
            (dm.qrychama_produtoPreco_Vista.AsFloat, FrmPedido_Venda.taxa / 100,
            FrmPedido_Venda.qtde_parcela)
        else
        begin
          val_aux := (100 - FrmPedido_Venda.taxa) / 100;
          val_aux := dm.qrychama_produtoPreco_Vista.AsFloat / val_aux;
        end;
      end
      else
      begin
        val_aux := dm.qrychama_produtoPreco_Vista.AsFloat;
      end;
    end
    else
    begin
      if (dm.qrychama_produtoPreco_Prazo.AsFloat = dm.
        qrychama_produtoPreco_Vista.AsFloat) then
      begin
        if (FrmPedido_Venda.tipo_juro = 'C') then
          val_aux := Calcula_Juro_Composto
            (dm.qrychama_produtoPreco_Prazo.AsFloat, FrmPedido_Venda.taxa / 100,
            FrmPedido_Venda.qtde_parcela)
        else
        begin
          val_aux := (100 - FrmPedido_Venda.taxa) / 100;
          val_aux := dm.qrychama_produtoPreco_Prazo.AsFloat / val_aux;
        end;
      end
      else
      begin
        val_aux := dm.qrychama_produtoPreco_Prazo.AsFloat;
      end;
    end;
    TLog.Debug('Verificou Juros Vista/Prazo.');
    FrmPedido_Venda.EdtValor_Unitario.Text :=
      FloatToStr(Calcula_Valor(FloatToStr(val_aux)));
    FrmPedido_Venda.EdtValor_Tabela.Text :=
      FloatToStr(Calcula_Valor(FloatToStr(val_aux)));
    // FrmPedido_Venda.EdtDesc_Acr.Text:= '0,00';
    // FrmPedido_Venda.var_uni:= Calcula_Valor(FloatToStr(val_aux));

    FrmPedido_Venda.perc_desc :=
      dm.qrychama_produtoPercentual_Desconto_Vista.AsFloat;
    FrmPedido_Venda.perc_desc_prazo :=
      dm.qrychama_produtoPercentual_Desconto_Prazo.AsFloat;

    FrmPedido_Venda.perc_vista :=
      dm.qrychama_produtoPercentual_Lucro_Vista.AsFloat;
    FrmPedido_Venda.perc_prazo :=
      dm.qrychama_produtoPercentual_Lucro_Prazo.AsFloat;

    // pegar ICMS
    TLog.Debug('Inscrição Estadual: ' +
      FrmPedido_Venda.LblInscricao_Estadual.Caption);
    if (FrmPedido_Venda.LblInscricao_Estadual.Caption <> '') then
    begin
      if not(Pega_ICMS_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao.
        AsInteger, uf, FrmPedido_Venda.LblUF.Caption, FrmPedido_Venda.Conexao))
      then
      begin
        Application.MessageBox(PWideChar('ICMS de ' + uf + ' para ' +
          FrmPedido_Venda.LblUF.Caption +
          ' não configurado. Por favor, vá em Cadastro > ICMS > Tratamento e configure.'),
          'ICMS não encontrado', MB_OK + MB_ICONHAND);
        abort;
      end;
    end
    else
    begin
      if not(Pega_ICMS_NC_Outro(dm.qrychama_produtoCodigo_Grupo_Tributacao.
        AsInteger, uf, FrmPedido_Venda.LblUF.Caption, FrmPedido_Venda.Conexao))
      then
      begin
        Application.MessageBox(PWideChar('ICMS de ' + uf + ' para ' +
          FrmPedido_Venda.LblUF.Caption +
          ' não configurado. Por favor, vá em Cadastro > ICMS > Tratamento e configure.'),
          'ICMS não encontrado', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;
    TLog.Debug('Verificou ICMS.');
    permite_credito := qAux_ICMS.FieldByName('Permite_Credito').AsInteger;
    codigo_obs_fiscal := qAux_ICMS.FieldByName('Codigo_Obs_Fiscal').AsInteger;

    if (uf = FrmPedido_Venda.LblUF.Caption) then
      FrmPedido_Venda.EdtCFOP.Text := qAux_ICMS.FieldByName('CFOP_D').AsString
    else
      FrmPedido_Venda.EdtCFOP.Text := qAux_ICMS.FieldByName('CFOP_F').AsString;

    FrmPedido_Venda.EdtST.Text := qAux_ICMS.FieldByName('Aliquota').AsString;
    { if not (Pega_ICMS_NC(dm.qrychama_produtoCodigo_Grupo_Tributacao.AsInteger) ) then
      begin
      Application.MessageBox(PWideChar('ICMS de '+uf+' para '+FrmPedido_Venda.LblUF.Caption+
      ' não configurado. Por favor, vá em Cadastro > ICMS > Tratamento e configure.'), 'ICMS não encontrado', MB_OK + MB_ICONHAND);
      abort;
      end; }

    if (qAux_ICMS.FieldByName('Aliquota').AsString <> 'I') and
      (qAux_ICMS.FieldByName('Aliquota').AsString <> 'N') and
      (qAux_ICMS.FieldByName('Aliquota').AsString <> 'F') then
    begin
      if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 1 then
      begin
        icms := '0' + qAux_ICMS.FieldByName('Aliquota').AsString + '00'; // 0700
        icms_st := '';
        // FrmPedido_Venda.EdtST.Text:= qAux_ICMS.FieldByName('Aliquota').AsString;
      end
      else if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 2 then
      begin
        icms := qAux_ICMS.FieldByName('Aliquota').AsString + '00'; // 1700
        icms_st := '';
        // FrmPedido_Venda.EdtST.Text:= qAux_ICMS.FieldByName('Aliquota').AsString;
      end
      else if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 3 then
      begin
        icms := StringReplace(qAux_ICMS.FieldByName('Aliquota').AsString, ',',
          '', [rfReplaceAll]);
        icms := '0' + icms + '0'; // 0840
        icms_st := '';
        // FrmPedido_Venda.EdtST.Text:= qAux_ICMS.FieldByName('Aliquota').AsString;
      end
      else if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 4 then
      begin
        icms := StringReplace(qAux_ICMS.FieldByName('Aliquota').AsString, ',',
          '', [rfReplaceAll]);
        icms := icms + '0'; // 1320
        icms_st := '';
        // FrmPedido_Venda.EdtST.Text:= qAux_ICMS.FieldByName('Aliquota').AsString;
      end;
    end
    else
    begin
      icms := qAux_ICMS.FieldByName('Aliquota').AsString + '1';
      icms_st := '';
      // FrmPedido_Venda.EdtST.Text:= qAux_ICMS.FieldByName('Aliquota').AsString;
    end;

    cst_icms := qAux_ICMS.FieldByName('Codigo_Situacao').AsString;
    cst_icms_st := '';

    tipo_calculo_bc_icms := qAux_ICMS.FieldByName
      ('Tipo_Calculo_BC_ICMS').AsString;
    tipo_calculo_bc_icms_st := qAux_ICMS.FieldByName
      ('Tipo_Calculo_BC_ICMS_ST').AsString;
    tipo_recolhimento_icms := qAux_ICMS.FieldByName
      ('Tipo_Recolhimento').AsString;

    // if (qAux_ICMS.FieldByName('Base_Reduzida').AsString = 'SIM') then
    // begin
    br_icms := qAux_ICMS.FieldByName('Percentual_BC_Reduzida').AsString;
    br_icms_st := '';
    { end
      else
      begin
      br_icms:= '';
      br_icms_st:= '';
      end; }

    // if (qAux_ICMS.FieldByName('Base_Acrescida').AsString = 'SIM') then
    // begin
    ba_icms_st := '';
    { end
      else
      begin
      ba_icms:= '';
      ba_icms_st:= '';
      end; }
    csosn := qAux_ICMS.FieldByName('Codigo_CSOSN').AsString;

    origem := qAux_ICMS.FieldByName('Origem').AsString;

    // ---- fim icms----

    // ----ipi----

    Pega_IPI_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao_IPI.AsInteger, FrmPedido_Venda.Conexao);

    ipi := qAux_IPI.FieldByName('Aliquota').AsString;
    cst_ipi := qAux_IPI.FieldByName('Codigo_Situacao').AsString;
    tipo_calculo_bc_ipi := qAux_IPI.FieldByName('Tipo_Calculo').AsString;

    if (qAux_IPI.FieldByName('Base_Reduzida').AsString = 'SIM') then
      br_ipi := qAux_IPI.FieldByName('Percentual_BC_Reduzida').AsString
    else
      br_ipi := '';

    if (qAux_IPI.FieldByName('Base_Acrescida').AsString = 'SIM') then
      ba_ipi := qAux_IPI.FieldByName('Percentual_BC_Acrescida').AsString
    else
      ba_ipi := '';

    // ----fim ipi----

    // ----pis----

    Pega_PIS_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao_PIS.AsInteger, FrmPedido_Venda.Conexao);

    pis := qAux_PIS.FieldByName('Aliquota').AsString;
    cst_pis := qAux_PIS.FieldByName('Codigo_Situacao').AsString;
    tipo_calculo_bc_pis := qAux_PIS.FieldByName('Tipo_Calculo').AsString;

    if (qAux_PIS.FieldByName('Base_Reduzida').AsString = 'SIM') then
      br_pis := qAux_PIS.FieldByName('Percentual_BC_Reduzida').AsString
    else
      br_pis := '';

    if (qAux_PIS.FieldByName('Base_Acrescida').AsString = 'SIM') then
      ba_pis := qAux_PIS.FieldByName('Percentual_BC_Acrescida').AsString
    else
      ba_pis := '';

    // ---- fim pis----

    // ----cofins----

    Pega_COFINS_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao_COFINS.
      AsInteger, FrmPedido_Venda.Conexao);

    cofins := qAux_COFINS.FieldByName('Aliquota').AsString;
    cst_cofins := qAux_COFINS.FieldByName('Codigo_Situacao').AsString;
    tipo_calculo_bc_cofins := qAux_COFINS.FieldByName('Tipo_Calculo').AsString;

    if (qAux_COFINS.FieldByName('Base_Reduzida').AsString = 'SIM') then
      br_cofins := qAux_COFINS.FieldByName('Percentual_BC_Reduzida').AsString
    else
      br_cofins := '';

    if (qAux_COFINS.FieldByName('Base_Acrescida').AsString = 'SIM') then
      ba_cofins := qAux_COFINS.FieldByName('Percentual_BC_Acrescida').AsString
    else
      ba_cofins := '';

    // ---- fim cofins----

    { if (dm.qrychama_produtoTipo_Tributacao.AsString = 'T') then
      begin
      if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 1 then
      begin
      FrmPedido_Venda.LblAli.Caption:= '0'+qAux_ICMS.FieldByName('Aliquota').AsString+'00';
      FrmPedido_Venda.EdtST.Text:= qAux_ICMS.FieldByName('Aliquota').AsString;
      end
      else
      begin
      FrmPedido_Venda.LblAli.Caption:= qAux_ICMS.FieldByName('Aliquota').AsString+'00';
      FrmPedido_Venda.EdtST.Text:= qAux_ICMS.FieldByName('Aliquota').AsString;
      end;
      end
      else if (dm.qrychama_produtoTipo_Tributacao.AsString = 'I') then
      begin
      FrmPedido_Venda.EdtST.Text:= 'I1';
      FrmPedido_Venda.LblAli.Caption:= 'I1';
      end
      else if (dm.qrychama_produtoTipo_Tributacao.AsString = 'N') then
      begin
      FrmPedido_Venda.EdtST.Text:= 'N1';
      FrmPedido_Venda.LblAli.Caption:= 'N1';
      end
      else if (dm.qrychama_produtoTipo_Tributacao.AsString = 'F') then
      begin
      FrmPedido_Venda.EdtST.Text:= 'F1';
      FrmPedido_Venda.LblAli.Caption:= 'F1';
      end; }

    FrmPedido_Venda.cod_produto := dm.qrychama_produtoCodigo.AsInteger;
    // dm.qrychama_produtoCodigo.AsInteger;
    FrmPedido_Venda.cod_pro := dm.qrychama_produtoCodigo_Venda.AsString;
    // dm.qrychama_produtoCodigo_Venda.AsString;
    FrmPedido_Venda.descri := dm.qrychama_produtoDescricao.AsString;
    // dm.qrychama_produtoDescricao.AsString;
    FrmPedido_Venda.unid := dm.qrychama_produtoSigla.AsString;
    // dm.qrychama_produtoSigla.AsString;
    FrmPedido_Venda.IAT := dm.qrychama_produtoArred_Trunc.AsString;
    FrmPedido_Venda.IPPT := dm.qrychama_produtoProducao_Propria.AsString;

    permissao_venda := dm.qrychama_produtoEm_Estoque_Minimo.AsString;
    permissao_compra := dm.qrychama_produtoEm_Estoque_Maximo.AsString;
    estoque_minimo := dm.qrychama_produtoEstoque_Minimo.AsFloat;
    estoque_maximo := dm.qrychama_produtoEstoque_Maximo.AsFloat;
    qtde_estoque := dm.qrychama_produtoEstoque.AsFloat;

    if (FrmPedido_Venda.tipo_pag = 'A VISTA') then
      comissao_produto := dm.qrychama_produtoPercentual_Comissao_Vista.AsFloat
    else
      comissao_produto := dm.qrychama_produtoPercentual_Comissao_Prazo.AsFloat;

    FrmPedido_Venda.EdtQuantidade.SetFocus;
    TLog.Info('--- FIM CHAMA PRODUTO - DUPLO CLIQUE NO PRODUTO ---');
    FrmChama_Produto.close;
  end
  else if (FrmCompra <> Nil) and (FrmCompra.ativo = true) then
  begin
    FrmCompra.LblProduto.Caption := dm.qrychama_produtoCodigo.AsString;
    FrmCompra.EdtCodigo_Produto.Text :=
      dm.qrychama_produtoCodigo_Venda.AsString;
    FrmCompra.EdtProduto.Text := dm.qrychama_produtoDescricao.AsString;
    FrmCompra.EdtUnidade.Text := dm.qrychama_produtoSigla.AsString;
    FrmCompra.EdtValor_Unitario.Text :=
      dm.qrychama_produtoValor_Compra.AsString;
    FrmChama_Produto.close;
  end
  else if (FrmMovimentacao_Manual <> Nil) and
    (FrmMovimentacao_Manual.ativo = true) then
  begin
    { if (dm.qrychama_produtoTipo.AsInteger = 0) then
      begin
      Pega_ICMS_NC(dm.qrychama_produtoCodigo_Grupo_Tributacao.AsInteger);
      //FrmMovimentacao_Manual.LblAli.Caption:= qAux_ICMS.FieldByName('Aliquota').AsString;
      FrmMovimentacao_Manual.LblCST.Caption:= qAux_ICMS.FieldByName('Codigo_Situacao').AsString;

      if (dm.qrychama_produtoTipo_Tributacao.AsString = 'T') then
      begin
      if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 1 then
      begin
      FrmMovimentacao_Manual.LblAli.Caption:= qAux_ICMS.FieldByName('Aliquota').AsString;
      FrmMovimentacao_Manual.EdtST.Text:= qAux_ICMS.FieldByName('Aliquota').AsString;
      end
      else
      begin
      FrmMovimentacao_Manual.LblAli.Caption:= qAux_ICMS.FieldByName('Aliquota').AsString;
      FrmMovimentacao_Manual.EdtST.Text:= qAux_ICMS.FieldByName('Aliquota').AsString;
      end;
      end
      else if (dm.qrychama_produtoTipo_Tributacao.AsString = 'I') then
      begin
      FrmMovimentacao_Manual.EdtST.Text:= 'I1';
      FrmMovimentacao_Manual.LblAli.Caption:= 'I1';
      end
      else if (dm.qrychama_produtoTipo_Tributacao.AsString = 'N') then
      begin
      FrmMovimentacao_Manual.EdtST.Text:= 'N1';
      FrmMovimentacao_Manual.LblAli.Caption:= 'N1';
      end
      else if (dm.qrychama_produtoTipo_Tributacao.AsString = 'F') then
      begin
      FrmMovimentacao_Manual.EdtST.Text:= 'F1';
      FrmMovimentacao_Manual.LblAli.Caption:= 'F1';
      end;

      if (qAux_ICMS.FieldByName('Base_Reduzida').AsString = 'SIM') then
      FrmMovimentacao_Manual.LblBase.Caption:= qAux_ICMS.FieldByName('Percentual_BC_Reduzida').AsString
      else
      FrmMovimentacao_Manual.LblBase.Caption:= '';
      end
      else
      begin
      Pega_ISS(dm.qrychama_produtoCodigo_Grupo_Tributacao_ISSQN.AsInteger);
      FrmMovimentacao_Manual.LblAli.Caption:= qAux_ISS.FieldByName('Aliquota').AsString;
      FrmMovimentacao_Manual.LblCST.Caption:= '00';

      if (qAux_ISS.FieldByName('Base_Reduzida').AsString = 'SIM') then
      FrmMovimentacao_Manual.LblBase.Caption:= qAux_ISS.FieldByName('Percentual_BC_Reduzida').AsString
      else
      FrmMovimentacao_Manual.LblBase.Caption:= '';
      end;

      Pega_IPI_NC(dm.qrychama_produtoCodigo_Grupo_Tributacao_IPI.AsInteger);
      FrmMovimentacao_Manual.LblIPI.Caption:= qAux_IPI.FieldByName('Aliquota').AsString; }

    // ----icms----

    Pega_ICMS_NC(dm.qrychama_produtoCodigo_Grupo_Tributacao.AsInteger,
      dm.ADOConnection1);

    if (dm.qrychama_produtoAliquota.AsString <> 'I') and
      (dm.qrychama_produtoAliquota.AsString <> 'N') <>
      (dm.qrychama_produtoAliquota.AsString <> 'F') then
    begin
      if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 1 then
      begin
        FrmMovimentacao_Manual.LblICMS.Caption :=
          '0' + qAux_ICMS.FieldByName('Aliquota').AsString + '00'; // 0700
        FrmMovimentacao_Manual.EdtST.Text :=
          qAux_ICMS.FieldByName('Aliquota').AsString;
      end
      else if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 2 then
      begin
        FrmMovimentacao_Manual.LblICMS.Caption :=
          qAux_ICMS.FieldByName('Aliquota').AsString + '00'; // 1700
        FrmMovimentacao_Manual.EdtST.Text :=
          qAux_ICMS.FieldByName('Aliquota').AsString;
      end
      else if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 3 then
      begin
        FrmMovimentacao_Manual.LblICMS.Caption :=
          StringReplace(qAux_ICMS.FieldByName('Aliquota').AsString, ',', '',
          [rfReplaceAll]);
        FrmMovimentacao_Manual.LblICMS.Caption :=
          '0' + FrmMovimentacao_Manual.LblICMS.Caption + '0'; // 0840
        FrmMovimentacao_Manual.EdtST.Text :=
          qAux_ICMS.FieldByName('Aliquota').AsString;
      end
      else if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 4 then
      begin
        FrmMovimentacao_Manual.LblICMS.Caption :=
          StringReplace(qAux_ICMS.FieldByName('Aliquota').AsString, ',', '',
          [rfReplaceAll]);
        FrmMovimentacao_Manual.LblICMS.Caption :=
          FrmMovimentacao_Manual.LblICMS.Caption + '0'; // 1320
        FrmMovimentacao_Manual.EdtST.Text :=
          qAux_ICMS.FieldByName('Aliquota').AsString;
      end;
    end
    else
    begin
      FrmMovimentacao_Manual.LblICMS.Caption :=
        qAux_ICMS.FieldByName('Aliquota').AsString + '1';
      FrmMovimentacao_Manual.EdtST.Text :=
        qAux_ICMS.FieldByName('Aliquota').AsString;
    end;

    FrmMovimentacao_Manual.LblCST.Caption :=
      qAux_ICMS.FieldByName('Codigo_Situacao').AsString;

    if (qAux_ICMS.FieldByName('Base_Reduzida').AsString = 'SIM') then
      FrmMovimentacao_Manual.LblBase_Reduzida.Caption :=
        qAux_ICMS.FieldByName('Percentual_BC_Reduzida').AsString
    else
      FrmMovimentacao_Manual.LblBase_Reduzida.Caption := '';

    if (qAux_ICMS.FieldByName('Base_Acrescida').AsString = 'SIM') then
      FrmMovimentacao_Manual.LblBase_Acrescida.Caption :=
        qAux_ICMS.FieldByName('Percentual_BC_Acrescida').AsString
    else
      FrmMovimentacao_Manual.LblBase_Acrescida.Caption := '';

    // ---- fim icms----

    // ----ipi----

    Pega_IPI_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao_IPI.AsInteger, dm.ADOConnection1);

    FrmMovimentacao_Manual.LblIPI.Caption :=
      qAux_IPI.FieldByName('Aliquota').AsString;
    FrmMovimentacao_Manual.LblCST_IPI.Caption :=
      qAux_IPI.FieldByName('Codigo_Situacao').AsString;

    if (qAux_IPI.FieldByName('Base_Reduzida').AsString = 'SIM') then
      FrmMovimentacao_Manual.LblBase_Reduzida_IPI.Caption :=
        qAux_IPI.FieldByName('Percentual_BC_Reduzida').AsString
    else
      FrmMovimentacao_Manual.LblBase_Reduzida_IPI.Caption := '';

    if (qAux_IPI.FieldByName('Base_Acrescida').AsString = 'SIM') then
      FrmMovimentacao_Manual.LblBase_Acrescida_IPI.Caption :=
        qAux_IPI.FieldByName('Percentual_BC_Acrescida').AsString
    else
      FrmMovimentacao_Manual.LblBase_Acrescida_IPI.Caption := '';

    // ----fim ipi----

    // ----pis----

    Pega_PIS_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao_PIS.AsInteger, dm.ADOConnection1);

    FrmMovimentacao_Manual.LblPIS.Caption :=
      qAux_PIS.FieldByName('Aliquota').AsString;
    FrmMovimentacao_Manual.LblCST_PIS.Caption :=
      qAux_PIS.FieldByName('Codigo_Situacao').AsString;

    if (qAux_PIS.FieldByName('Base_Reduzida').AsString = 'SIM') then
      FrmMovimentacao_Manual.LblBase_Reduzida_PIS.Caption :=
        qAux_PIS.FieldByName('Percentual_BC_Reduzida').AsString
    else
      FrmMovimentacao_Manual.LblBase_Reduzida_PIS.Caption := '';

    if (qAux_PIS.FieldByName('Base_Acrescida').AsString = 'SIM') then
      FrmMovimentacao_Manual.LblBase_Acrescida_PIS.Caption :=
        qAux_PIS.FieldByName('Percentual_BC_Acrescida').AsString
    else
      FrmMovimentacao_Manual.LblBase_Acrescida_PIS.Caption := '';

    // ---- fim pis----

    // ----cofins----

    Pega_COFINS_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao_COFINS.
      AsInteger, dm.ADOConnection1);

    FrmMovimentacao_Manual.LblCOFINS.Caption :=
      qAux_COFINS.FieldByName('Aliquota').AsString;
    FrmMovimentacao_Manual.LblCST_COFINS.Caption :=
      qAux_COFINS.FieldByName('Codigo_Situacao').AsString;

    if (qAux_COFINS.FieldByName('Base_Reduzida').AsString = 'SIM') then
      FrmMovimentacao_Manual.LblBase_Reduzida_COFINS.Caption :=
        qAux_COFINS.FieldByName('Percentual_BC_Reduzida').AsString
    else
      FrmMovimentacao_Manual.LblBase_Reduzida_COFINS.Caption := '';

    if (qAux_COFINS.FieldByName('Base_Acrescida').AsString = 'SIM') then
      FrmMovimentacao_Manual.LblBase_Acrescida_COFINS.Caption :=
        qAux_COFINS.FieldByName('Percentual_BC_Acrescida').AsString
    else
      FrmMovimentacao_Manual.LblBase_Acrescida_COFINS.Caption := '';

    // ---- fim cofins----

    FrmMovimentacao_Manual.LblProduto.Caption :=
      dm.qrychama_produtoCodigo.AsString;
    FrmMovimentacao_Manual.LblTipo.Caption := dm.qrychama_produtoTipo.AsString;
    FrmMovimentacao_Manual.EdtCodigo_Produto.Text :=
      dm.qrychama_produtoCodigo_Venda.AsString;
    FrmMovimentacao_Manual.EdtProduto.Text :=
      dm.qrychama_produtoDescricao.AsString;
    FrmMovimentacao_Manual.EdtUnidade.Text := dm.qrychama_produtoSigla.AsString;
    FrmMovimentacao_Manual.EdtValor_Unitario.Text :=
      dm.qrychama_produtoPreco_Vista.AsString;
    FrmChama_Produto.close;
  end
  else if (FrmOS <> NIl) and (FrmOS.ativo = true) then
  begin
    FrmOS.LblProduto.Caption := dm.qrychama_produtoCodigo.AsString;
    FrmOS.LblTipo.Caption := dm.qrychama_produtoTipo.AsString;
    FrmOS.EdtCodigo_Produto.Text := dm.qrychama_produtoCodigo_Venda.AsString;
    FrmOS.EdtProduto.Text := dm.qrychama_produtoDescricao.AsString;
    FrmOS.EdtUnidade.Text := dm.qrychama_produtoSigla.AsString;
    FrmOS.EdtValor_Unitario.Text := dm.qrychama_produtoPreco_Vista.AsString;
    FrmOS.perc_desc := dm.qrychama_produtoPercentual_Desconto_Vista.AsFloat;

    // ----icms----

    Pega_ICMS_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao.AsInteger, uf,
      FrmOS.LblUF.Caption, dm.ADOConnection1);

    if (dm.qrychama_produtoAliquota.AsString <> 'I') and
      (dm.qrychama_produtoAliquota.AsString <> 'N') <>
      (dm.qrychama_produtoAliquota.AsString <> 'F') then
    begin
      if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 1 then
      begin
        FrmOS.LblICMS.Caption := '0' + qAux_ICMS.FieldByName('Aliquota')
          .AsString + '00'; // 0700
        FrmOS.EdtST.Text := qAux_ICMS.FieldByName('Aliquota').AsString;
      end
      else if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 2 then
      begin
        FrmOS.LblICMS.Caption := qAux_ICMS.FieldByName('Aliquota').AsString +
          '00'; // 1700
        FrmOS.EdtST.Text := qAux_ICMS.FieldByName('Aliquota').AsString;
      end
      else if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 3 then
      begin
        FrmOS.LblICMS.Caption := StringReplace(qAux_ICMS.FieldByName('Aliquota')
          .AsString, ',', '', [rfReplaceAll]);
        FrmOS.LblICMS.Caption := '0' + FrmOS.LblICMS.Caption + '0'; // 0840
        FrmOS.EdtST.Text := qAux_ICMS.FieldByName('Aliquota').AsString;
      end
      else if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 4 then
      begin
        FrmOS.LblICMS.Caption := StringReplace(qAux_ICMS.FieldByName('Aliquota')
          .AsString, ',', '', [rfReplaceAll]);
        FrmOS.LblICMS.Caption := FrmOS.LblICMS.Caption + '0'; // 1320
        FrmOS.EdtST.Text := qAux_ICMS.FieldByName('Aliquota').AsString;
      end;
    end

    else
    begin
      FrmOS.LblICMS.Caption := qAux_ICMS.FieldByName('Aliquota').AsString + '1';
      FrmOS.EdtST.Text := qAux_ICMS.FieldByName('Aliquota').AsString;
    end;

    FrmOS.LblCST.Caption := qAux_ICMS.FieldByName('Codigo_Situacao').AsString;

    if (qAux_ICMS.FieldByName('Base_Reduzida').AsString = 'SIM') then
      FrmOS.LblBase_Reduzida.Caption :=
        qAux_ICMS.FieldByName('Percentual_BC_Reduzida').AsString
    else
      FrmOS.LblBase_Reduzida.Caption := '';

    if (qAux_ICMS.FieldByName('Base_Acrescida').AsString = 'SIM') then
      FrmOS.LblBase_Acrescida.Caption :=
        qAux_ICMS.FieldByName('Percentual_BC_Acrescida').AsString
    else
      FrmOS.LblBase_Acrescida.Caption := '';

    // ---- fim icms----

    // ----ipi----

    Pega_IPI_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao_IPI.AsInteger, dm.ADOConnection1);

    FrmOS.LblIPI.Caption := qAux_IPI.FieldByName('Aliquota').AsString;
    FrmOS.LblCST_IPI.Caption := qAux_IPI.FieldByName('Codigo_Situacao')
      .AsString;

    if (qAux_IPI.FieldByName('Base_Reduzida').AsString = 'SIM') then
      FrmOS.LblBase_Reduzida_IPI.Caption :=
        qAux_IPI.FieldByName('Percentual_BC_Reduzida').AsString
    else
      FrmOS.LblBase_Reduzida_IPI.Caption := '';

    if (qAux_IPI.FieldByName('Base_Acrescida').AsString = 'SIM') then
      FrmOS.LblBase_Acrescida_IPI.Caption :=
        qAux_IPI.FieldByName('Percentual_BC_Acrescida').AsString
    else
      FrmOS.LblBase_Acrescida_IPI.Caption := '';

    // ----fim ipi----

    // ----pis----

    Pega_PIS_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao_PIS.AsInteger, dm.ADOConnection1);

    FrmOS.LblPIS.Caption := qAux_PIS.FieldByName('Aliquota').AsString;
    FrmOS.LblCST_PIS.Caption := qAux_PIS.FieldByName('Codigo_Situacao')
      .AsString;

    if (qAux_PIS.FieldByName('Base_Reduzida').AsString = 'SIM') then
      FrmOS.LblBase_Reduzida_PIS.Caption :=
        qAux_PIS.FieldByName('Percentual_BC_Reduzida').AsString
    else
      FrmOS.LblBase_Reduzida_PIS.Caption := '';

    if (qAux_PIS.FieldByName('Base_Acrescida').AsString = 'SIM') then
      FrmOS.LblBase_Acrescida_PIS.Caption :=
        qAux_PIS.FieldByName('Percentual_BC_Acrescida').AsString
    else
      FrmOS.LblBase_Acrescida_PIS.Caption := '';

    // ---- fim pis----

    // ----cofins----

    Pega_COFINS_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao_COFINS.
      AsInteger, dm.ADOConnection1);

    FrmOS.LblCOFINS.Caption := qAux_COFINS.FieldByName('Aliquota').AsString;
    FrmOS.LblCST_COFINS.Caption := qAux_COFINS.FieldByName
      ('Codigo_Situacao').AsString;

    if (qAux_COFINS.FieldByName('Base_Reduzida').AsString = 'SIM') then
      FrmOS.LblBase_Reduzida_COFINS.Caption :=
        qAux_COFINS.FieldByName('Percentual_BC_Reduzida').AsString
    else
      FrmOS.LblBase_Reduzida_COFINS.Caption := '';

    if (qAux_COFINS.FieldByName('Base_Acrescida').AsString = 'SIM') then
      FrmOS.LblBase_Acrescida_COFINS.Caption :=
        qAux_COFINS.FieldByName('Percentual_BC_Acrescida').AsString
    else
      FrmOS.LblBase_Acrescida_COFINS.Caption := '';

    // ---- fim cofins----

    { if (dm.qrychama_produtoTipo_Tributacao.AsString = 'T') then
      begin
      if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 1 then
      begin
      FrmOS.LblAli.Caption:= '0'+qAux_ICMS.FieldByName('Aliquota').AsString+'00';
      FrmOS.EdtST.Text:= qAux_ICMS.FieldByName('Aliquota').AsString;
      end
      else
      begin
      FrmOS.LblAli.Caption:= qAux_ICMS.FieldByName('Aliquota').AsString+'00';
      FrmOS.EdtST.Text:= qAux_ICMS.FieldByName('Aliquota').AsString;
      end;
      end
      else if (dm.qrychama_produtoTipo_Tributacao.AsString = 'I') then
      begin
      FrmOS.EdtST.Text:= 'I1';
      FrmOS.LblAli.Caption:= 'I1';
      end
      else if (dm.qrychama_produtoTipo_Tributacao.AsString = 'N') then
      begin
      FrmOS.EdtST.Text:= 'N1';
      FrmOS.LblAli.Caption:= 'N1';
      end
      else if (dm.qrychama_produtoTipo_Tributacao.AsString = 'F') then
      begin
      FrmOS.EdtST.Text:= 'F1';
      FrmOS.LblAli.Caption:= 'F1';
      end; }

    FrmOS.cod_produto := dm.qrychama_produtoCodigo.AsInteger;
    // dm.qrychama_produtoCodigo.AsInteger;
    FrmOS.cod_pro := dm.qrychama_produtoCodigo_Venda.AsString;
    // dm.qrychama_produtoCodigo_Venda.AsString;
    FrmOS.descri := dm.qrychama_produtoDescricao.AsString;
    // dm.qrychama_produtoDescricao.AsString;
    FrmOS.unid := dm.qrychama_produtoSigla.AsString;
    // dm.qrychama_produtoSigla.AsString;
    FrmOS.IAT := dm.qrychama_produtoArred_Trunc.AsString;
    FrmOS.IPPT := dm.qrychama_produtoProducao_Propria.AsString;
    FrmOS.var_uni := dm.qrychama_produtoPreco_Vista.AsFloat;
    permissao_venda := dm.qrychama_produtoEm_Estoque_Minimo.AsString;
    permissao_compra := dm.qrychama_produtoEm_Estoque_Maximo.AsString;
    estoque_minimo := dm.qrychama_produtoEstoque_Minimo.AsFloat;
    estoque_maximo := dm.qrychama_produtoEstoque_Maximo.AsFloat;
    qtde_estoque := dm.qrychama_produtoEstoque.AsFloat;
    FrmChama_Produto.close;
  end
  else if (FrmPre_Venda <> NIl) and (FrmPre_Venda.ativo = true) then
  begin
    FrmPre_Venda.LblProduto.Caption := dm.qrychama_produtoCodigo.AsString;
    FrmPre_Venda.LblTipo.Caption := dm.qrychama_produtoTipo.AsString;
    FrmPre_Venda.EdtCodigo_Produto.Text :=
      dm.qrychama_produtoCodigo_Venda.AsString;
    FrmPre_Venda.EdtProduto.Text := dm.qrychama_produtoDescricao.AsString;
    FrmPre_Venda.EdtUnidade.Text := dm.qrychama_produtoSigla.AsString;

    if (FrmPre_Venda.CBVerifica.Checked) then
    begin
      FrmPre_Venda.EdtValor_Unitario.Text :=
        dm.qrychama_produtoPreco_Vista.AsString;
      FrmPre_Venda.var_uni := dm.qrychama_produtoPreco_Vista.AsFloat;
    end
    else
    begin
      FrmPre_Venda.EdtValor_Unitario.Text :=
        dm.qrychama_produtoPreco_Prazo.AsString;
      FrmPre_Venda.var_uni := dm.qrychama_produtoPreco_Prazo.AsFloat;
    end;

    FrmPre_Venda.perc_desc :=
      dm.qrychama_produtoPercentual_Desconto_Vista.AsFloat;

    // ----icms----

    Pega_ICMS_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao.AsInteger, uf,
      FrmPre_Venda.LblUF.Caption, dm.ADOConnection1);

    if (dm.qrychama_produtoAliquota.AsString <> 'I') and
      (dm.qrychama_produtoAliquota.AsString <> 'N') <>
      (dm.qrychama_produtoAliquota.AsString <> 'F') then
    begin
      if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 1 then
      begin
        FrmPre_Venda.LblICMS.Caption := '0' + qAux_ICMS.FieldByName('Aliquota')
          .AsString + '00'; // 0700
        FrmPre_Venda.EdtST.Text := qAux_ICMS.FieldByName('Aliquota').AsString;
      end
      else if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 2 then
      begin
        FrmPre_Venda.LblICMS.Caption := qAux_ICMS.FieldByName('Aliquota')
          .AsString + '00'; // 1700
        FrmPre_Venda.EdtST.Text := qAux_ICMS.FieldByName('Aliquota').AsString;
      end
      else if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 3 then
      begin
        FrmPre_Venda.LblICMS.Caption :=
          StringReplace(qAux_ICMS.FieldByName('Aliquota').AsString, ',', '',
          [rfReplaceAll]);
        FrmPre_Venda.LblICMS.Caption := '0' + FrmPre_Venda.LblICMS.Caption +
          '0'; // 0840
        FrmPre_Venda.EdtST.Text := qAux_ICMS.FieldByName('Aliquota').AsString;
      end
      else if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 4 then
      begin
        FrmPre_Venda.LblICMS.Caption :=
          StringReplace(qAux_ICMS.FieldByName('Aliquota').AsString, ',', '',
          [rfReplaceAll]);
        FrmPre_Venda.LblICMS.Caption := FrmPre_Venda.LblICMS.Caption + '0';
        // 1320
        FrmPre_Venda.EdtST.Text := qAux_ICMS.FieldByName('Aliquota').AsString;
      end;
    end
    else
    begin
      FrmPre_Venda.LblICMS.Caption := qAux_ICMS.FieldByName('Aliquota')
        .AsString + '1';
      FrmPre_Venda.EdtST.Text := qAux_ICMS.FieldByName('Aliquota').AsString;
    end;

    FrmPre_Venda.LblCST.Caption := qAux_ICMS.FieldByName
      ('Codigo_Situacao').AsString;

    if (qAux_ICMS.FieldByName('Base_Reduzida').AsString = 'SIM') then
      FrmPre_Venda.LblBase_Reduzida.Caption :=
        qAux_ICMS.FieldByName('Percentual_BC_Reduzida').AsString
    else
      FrmPre_Venda.LblBase_Reduzida.Caption := '';

    if (qAux_ICMS.FieldByName('Base_Acrescida').AsString = 'SIM') then
      FrmPre_Venda.LblBase_Acrescida.Caption :=
        qAux_ICMS.FieldByName('Percentual_BC_Acrescida').AsString
    else
      FrmPre_Venda.LblBase_Acrescida.Caption := '';

    // ---- fim icms----

    // ----ipi----

    Pega_IPI_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao_IPI.AsInteger, dm.ADOConnection1);

    FrmPre_Venda.LblIPI.Caption := qAux_IPI.FieldByName('Aliquota').AsString;
    FrmPre_Venda.LblCST_IPI.Caption :=
      qAux_IPI.FieldByName('Codigo_Situacao').AsString;

    if (qAux_IPI.FieldByName('Base_Reduzida').AsString = 'SIM') then
      FrmPre_Venda.LblBase_Reduzida_IPI.Caption :=
        qAux_IPI.FieldByName('Percentual_BC_Reduzida').AsString
    else
      FrmPre_Venda.LblBase_Reduzida_IPI.Caption := '';

    if (qAux_IPI.FieldByName('Base_Acrescida').AsString = 'SIM') then
      FrmPre_Venda.LblBase_Acrescida_IPI.Caption :=
        qAux_IPI.FieldByName('Percentual_BC_Acrescida').AsString
    else
      FrmPre_Venda.LblBase_Acrescida_IPI.Caption := '';

    // ----fim ipi----

    // ----pis----

    Pega_PIS_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao_PIS.AsInteger, dm.ADOConnection1);

    FrmPre_Venda.LblPIS.Caption := qAux_PIS.FieldByName('Aliquota').AsString;
    FrmPre_Venda.LblCST_PIS.Caption :=
      qAux_PIS.FieldByName('Codigo_Situacao').AsString;

    if (qAux_PIS.FieldByName('Base_Reduzida').AsString = 'SIM') then
      FrmPre_Venda.LblBase_Reduzida_PIS.Caption :=
        qAux_PIS.FieldByName('Percentual_BC_Reduzida').AsString
    else
      FrmPre_Venda.LblBase_Reduzida_PIS.Caption := '';

    if (qAux_PIS.FieldByName('Base_Acrescida').AsString = 'SIM') then
      FrmPre_Venda.LblBase_Acrescida_PIS.Caption :=
        qAux_PIS.FieldByName('Percentual_BC_Acrescida').AsString
    else
      FrmPre_Venda.LblBase_Acrescida_PIS.Caption := '';

    // ---- fim pis----

    // ----cofins----

    Pega_COFINS_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao_COFINS.
      AsInteger, dm.ADOConnection1);

    FrmPre_Venda.LblCOFINS.Caption := qAux_COFINS.FieldByName
      ('Aliquota').AsString;
    FrmPre_Venda.LblCST_COFINS.Caption :=
      qAux_COFINS.FieldByName('Codigo_Situacao').AsString;

    if (qAux_COFINS.FieldByName('Base_Reduzida').AsString = 'SIM') then
      FrmPre_Venda.LblBase_Reduzida_COFINS.Caption :=
        qAux_COFINS.FieldByName('Percentual_BC_Reduzida').AsString
    else
      FrmPre_Venda.LblBase_Reduzida_COFINS.Caption := '';

    if (qAux_COFINS.FieldByName('Base_Acrescida').AsString = 'SIM') then
      FrmPre_Venda.LblBase_Acrescida_COFINS.Caption :=
        qAux_COFINS.FieldByName('Percentual_BC_Acrescida').AsString
    else
      FrmPre_Venda.LblBase_Acrescida_COFINS.Caption := '';

    // ---- fim cofins----

    { if (dm.qrychama_produtoTipo_Tributacao.AsString = 'T') then
      begin
      if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 1 then
      begin
      FrmPre_Venda.LblAli.Caption:= '0'+qAux_ICMS.FieldByName('Aliquota').AsString+'00';
      FrmPre_Venda.EdtST.Text:= qAux_ICMS.FieldByName('Aliquota').AsString;
      end
      else
      begin
      FrmPre_Venda.LblAli.Caption:= qAux_ICMS.FieldByName('Aliquota').AsString+'00';
      FrmPre_Venda.EdtST.Text:= qAux_ICMS.FieldByName('Aliquota').AsString;
      end;
      end
      else if (dm.qrychama_produtoTipo_Tributacao.AsString = 'I') then
      begin
      FrmPre_Venda.EdtST.Text:= 'I1';
      FrmPre_Venda.LblAli.Caption:= 'I1';
      end
      else if (dm.qrychama_produtoTipo_Tributacao.AsString = 'N') then
      begin
      FrmPre_Venda.EdtST.Text:= 'N1';
      FrmPre_Venda.LblAli.Caption:= 'N1';
      end
      else if (dm.qrychama_produtoTipo_Tributacao.AsString = 'F') then
      begin
      FrmPre_Venda.EdtST.Text:= 'F1';
      FrmPre_Venda.LblAli.Caption:= 'F1';
      end; }

    FrmPre_Venda.cod_produto := dm.qrychama_produtoCodigo.AsInteger;
    // dm.qrychama_produtoCodigo.AsInteger;
    FrmPre_Venda.cod_pro := dm.qrychama_produtoCodigo_Venda.AsString;
    // dm.qrychama_produtoCodigo_Venda.AsString;
    FrmPre_Venda.descri := dm.qrychama_produtoDescricao.AsString;
    // dm.qrychama_produtoDescricao.AsString;
    FrmPre_Venda.unid := dm.qrychama_produtoSigla.AsString;
    // dm.qrychama_produtoSigla.AsString;
    FrmPre_Venda.IAT := dm.qrychama_produtoArred_Trunc.AsString;
    FrmPre_Venda.IPPT := dm.qrychama_produtoProducao_Propria.AsString;

    permissao_venda := dm.qrychama_produtoEm_Estoque_Minimo.AsString;
    estoque_minimo := dm.qrychama_produtoEstoque_Minimo.AsFloat;
    estoque_maximo := dm.qrychama_produtoEstoque_Maximo.AsFloat;
    qtde_estoque := dm.qrychama_produtoEstoque.AsFloat;
    FrmChama_Produto.close;
  end
  else if (FrmEntrada_Produtos <> Nil) and (FrmEntrada_Produtos.ativo = true)
    and (FrmEntrada_Produtos.lanca_item = true) then
  begin
    FrmEntrada_Produtos.LblProduto.Caption :=
      dm.qrychama_produtoCodigo.AsString;
    FrmEntrada_Produtos.EdtCodigo_Produto.Text := Pega_Codigo_Produto_Fornecedor
      (StrToInt(FrmEntrada_Produtos.EdtCodigo_Fornecedor.Text),
      StrToInt(FrmEntrada_Produtos.LblProduto.Caption));
    // FrmEntrada_Produtos.EdtCodigo_Produto.Text:= dm.qrychama_produtoCodigo_Venda.AsString;
    FrmEntrada_Produtos.EdtProduto.Text :=
      dm.qrychama_produtoDescricao.AsString;
    FrmEntrada_Produtos.EdtUnidade.Text := dm.qrychama_produtoSigla.AsString;
    FrmEntrada_Produtos.EdtNCM.Text := dm.qrychama_produtoNCM.AsString;

    if (FrmEntrada_Produtos.uf_destino <> '') then
    begin
      Pega_ICMS_Entrada(dm.qrychama_produtoCodigo_Grupo_Tributacao.AsInteger,
        FrmEntrada_Produtos.uf_destino, UDeclaracao.uf);
      FrmEntrada_Produtos.EdtSituacao_Tributaria.Text :=
        qAux_ICMS_Entrada.FieldByName('Origem').AsString +
        qAux_ICMS_Entrada.FieldByName('Codigo_Situacao').AsString;
      FrmEntrada_Produtos.EdtICMS.Text := qAux_ICMS_Entrada.FieldByName
        ('Aliquota').AsString;
      FrmEntrada_Produtos.tipo_recolhimento := qAux_ICMS_Entrada.FieldByName
        ('Tipo_Recolhimento').AsString;

      if (qAux_ICMS_Entrada.FieldByName('Percentual_BC_Acrescida').AsString
        <> '') then
        FrmEntrada_Produtos.base_acrescida := qAux_ICMS_Entrada.FieldByName
          ('Percentual_BC_Acrescida').AsFloat
      else
        FrmEntrada_Produtos.base_acrescida := 0;

      if (qAux_ICMS_Entrada.FieldByName('Percentual_BC_Reduzida').AsString <> '')
      then
        FrmEntrada_Produtos.base_reduzida := qAux_ICMS_Entrada.FieldByName
          ('Percentual_BC_Reduzida').AsFloat
      else
        FrmEntrada_Produtos.base_reduzida := 0;
    end
    else
    begin
      FrmEntrada_Produtos.EdtSituacao_Tributaria.Text := '';
      FrmEntrada_Produtos.EdtICMS.Text := '0';
      FrmEntrada_Produtos.base_acrescida := 0;
      FrmEntrada_Produtos.base_reduzida := 0;
      FrmEntrada_Produtos.tipo_recolhimento := '';
    end;

    FrmEntrada_Produtos.EdtValor_Unitario.Text :=
      dm.qrychama_produtoValor_Compra.AsString;
    FrmEntrada_Produtos.valor_vista := dm.qrychama_produtoPreco_Vista.AsFloat;
    FrmEntrada_Produtos.valor_prazo := dm.qrychama_produtoPreco_Prazo.AsFloat;

    if (dm.qrychama_produtoData_Validade.AsString <> '30/12/1899') then
      FrmEntrada_Produtos.MEdtData_Validade.Text :=
        dm.qrychama_produtoData_Validade.AsString;

    Pega_IPI_Entrada(dm.qrychama_produtoCodigo_Grupo_Tributacao_IPI.AsInteger);
    FrmEntrada_Produtos.EdtIPI.Text := qAux_IPI_Entrada.FieldByName
      ('Aliquota').AsString;

    FrmEntrada_Produtos.valor_compra := dm.qrychama_produtoValor_Compra.AsFloat;
    FrmEntrada_Produtos.valor_compra_unitario :=
      dm.qrychama_produtoValor_Compra_Unitario.AsFloat;

    if (busca_parametro_calculo_preco = 1) then
    begin
      FrmEntrada_Produtos.EdtPercentual_Lucro_Vista.Text :=
        dm.qrychama_produtoPVistaG.AsString;
      FrmEntrada_Produtos.EdtPercentual_Lucro_Prazo.Text :=
        dm.qrychama_produtoPPrazoG.AsString;
    end
    else
    begin
      // Pega_Percentual_Tabela_Preco;
      FrmEntrada_Produtos.EdtPercentual_Lucro_Vista.Text :=
        dm.qrychama_produtoPercentual_Lucro_Vista.AsString;
      FrmEntrada_Produtos.EdtPercentual_Lucro_Prazo.Text :=
        dm.qrychama_produtoPercentual_Lucro_Prazo.AsString;
    end;

    permissao_compra := dm.qrychama_produtoEm_Estoque_Maximo.AsString;
    estoque_minimo := dm.qrychama_produtoEstoque_Minimo.AsFloat;
    estoque_maximo := dm.qrychama_produtoEstoque_Maximo.AsFloat;
    qtde_estoque := dm.qrychama_produtoEstoque.AsFloat;
    saldo_estoque := dm.qrychama_produtoSaldo_Estoque.AsFloat;
    volume_atual := dm.qrychama_produtoVolume.AsFloat;

    FrmChama_Produto.close;
  end
  else if (FrmEntrada_Produtos <> Nil) and (FrmEntrada_Produtos.ativo = true)
    and (FrmEntrada_Produtos.lanca_item = false) then
  begin
    FrmChama_Produto.close;
  end
  else if (FrmConsulta_Preco_Produto <> nil) and
    (FrmConsulta_Preco_Produto.ativo = true) then
  begin
    FrmConsulta_Preco_Produto.EdtCodigo_Produto.Text :=
      dm.qrychama_produtoCodigo.AsString;
    FrmConsulta_Preco_Produto.EdtProduto.Text :=
      dm.qrychama_produtoDescricao.AsString;
    FrmChama_Produto.close;
  end
  else if (FrmCotacao_Preco_Produto <> Nil) and
    (FrmCotacao_Preco_Produto.ativo = true) then
  begin
    FrmCotacao_Preco_Produto.LblProduto.Caption :=
      dm.qrychama_produtoCodigo.AsString;
    FrmCotacao_Preco_Produto.EdtCodigo_Produto.Text :=
      dm.qrychama_produtoCodigo_Venda.AsString;
    FrmCotacao_Preco_Produto.EdtProduto.Text :=
      dm.qrychama_produtoDescricao.AsString;
    FrmCotacao_Preco_Produto.EdtUnidade.Text :=
      dm.qrychama_produtoSigla.AsString;
    FrmChama_Produto.close;
  end
  else if (FrmConsulta_Comparativo_Preco_Cotacao <> nil) and
    (FrmConsulta_Comparativo_Preco_Cotacao.ativo = true) then
  begin
    FrmConsulta_Comparativo_Preco_Cotacao.EdtCodigo.Text :=
      dm.qrychama_produtoCodigo.AsString;
    FrmConsulta_Comparativo_Preco_Cotacao.EdtConsulta.Text :=
      dm.qrychama_produtoDescricao.AsString;
    FrmChama_Produto.close;
  end
  else if (FrmFabricacao_Propria <> nil) and
    (FrmFabricacao_Propria.ativo = true) and
    (FrmFabricacao_Propria.produto = true) then
  begin
    FrmFabricacao_Propria.LblProd.Caption := dm.qrychama_produtoCodigo.AsString;
    FrmFabricacao_Propria.EdtCodigo_Produto.Text :=
      dm.qrychama_produtoCodigo_Venda.AsString;
    FrmFabricacao_Propria.EdtProduto.Text :=
      dm.qrychama_produtoDescricao.AsString;
    FrmFabricacao_Propria.LblEstoque.Caption :=
      dm.qrychama_produtoEstoque.AsString;
    FrmChama_Produto.close;
  end
  else if (FrmCadastro_Receita <> nil) and (FrmCadastro_Receita.ativo = true)
    and (FrmCadastro_Receita.produto = true) then
  begin
    FrmCadastro_Receita.LblProd.Caption := dm.qrychama_produtoCodigo.AsString;
    FrmCadastro_Receita.EdtIdProduto.Text :=
      dm.qrychama_produtoCodigo.AsString;
    FrmCadastro_Receita.EdtProduto.Text :=
      dm.qrychama_produtoDescricao.AsString;
    FrmCadastro_Receita.LblEstoque.Caption :=
      dm.qrychama_produtoEstoque.AsString;
    FrmCadastro_Receita.LblTipo_Producao.Caption :=
      dm.qrychama_produtoProducao_Propria.AsString;
    FrmChama_Produto.close;
  end
  else if (FrmCadastro_Receita <> nil) and (FrmCadastro_Receita.ativo = true)
    and (FrmCadastro_Receita.produto = false) then
  begin
    FrmCadastro_Receita.LblInsumo.Caption := dm.qrychama_produtoCodigo.AsString;
    FrmCadastro_Receita.EdtIdInsumo.Text :=
      dm.qrychama_produtoCodigo.AsString;
    FrmCadastro_Receita.EdtInsumo.Text := dm.qrychama_produtoDescricao.AsString;
    FrmCadastro_Receita.EdtUnidade.Text := dm.qrychama_produtoSigla2.AsString;
    FrmCadastro_Receita.LblTipo_Producao2.Caption :=
      dm.qrychama_produtoProducao_Propria.AsString;
    FrmChama_Produto.close;
  end
  else if (FrmConsulta_Reposicao_Estoque <> nil) and
    (FrmConsulta_Reposicao_Estoque.ativo = true) then
  begin
    FrmConsulta_Reposicao_Estoque.EdtCodigo.Text :=
      dm.qrychama_produtoCodigo.AsString;
    FrmConsulta_Reposicao_Estoque.EdtDescricao.Text :=
      dm.qrychama_produtoCodigo_Venda.AsString + ' - ' +
      dm.qrychama_produtoDescricao.AsString;
    FrmChama_Produto.close;
  end
  else if (FrmTabela_Indice_Tecnico_Producao <> nil) and
    (FrmTabela_Indice_Tecnico_Producao.ativo = true) then
  begin
    FrmTabela_Indice_Tecnico_Producao.LblProd.Caption :=
      dm.qrychama_produtoCodigo.AsString;
    FrmTabela_Indice_Tecnico_Producao.EdtCodigo_Produto.Text :=
      dm.qrychama_produtoCodigo_Venda.AsString;
    FrmTabela_Indice_Tecnico_Producao.EdtProduto.Text :=
      dm.qrychama_produtoDescricao.AsString;
    FrmChama_Produto.close;
  end
  else if (FrmGera_Etiqueta_Produto <> Nil) and
    (FrmGera_Etiqueta_Produto.ativo = true) then
  begin
    FrmGera_Etiqueta_Produto.EdtCodigo_Produto.Text :=
      dm.qrychama_produtoCodigo_Venda.AsString;
    FrmGera_Etiqueta_Produto.EdtCodigo_Ficticio.Text :=
      dm.qrychama_produtoCodigo_Venda.AsString;
    FrmGera_Etiqueta_Produto.EdtDescricao.Text :=
      dm.qrychama_produtoDescricao.AsString;

    FrmGera_Etiqueta_Produto.EdtValor_Venda.Text :=
      FormatFloat('#0.0,0', dm.qrychama_produtoPreco_Vista.AsFloat);
    FrmGera_Etiqueta_Produto.EdtValor_Venda.Text :=
      StringReplace(FrmGera_Etiqueta_Produto.EdtValor_Venda.Text,
      ThousandSeparator, '', [rfReplaceAll]);
    FrmChama_Produto.close;
  end
  else if (FrmGera_Etiqueta_Produto_2 <> Nil) and
    (FrmGera_Etiqueta_Produto_2.ativo = true) then
  begin
    FrmGera_Etiqueta_Produto_2.EdtCodigo_Produto.Text :=
      dm.qrychama_produtoCodigo_Venda.AsString;
    FrmGera_Etiqueta_Produto_2.EdtDescricao.Text :=
      dm.qrychama_produtoDescricao.AsString;
    FrmGera_Etiqueta_Produto_2.EdtMarca.Text :=
      dm.qrychama_produtoMarca.AsString;

    // FrmGera_Etiqueta_Produto.EdtValor_Venda.Text:= FormatFloat('#0.0,0', dm.qrychama_produtoPreco_Vista.AsFloat);
    // FrmGera_Etiqueta_Produto.EdtValor_Venda.Text:= StringReplace(FrmGera_Etiqueta_Produto.EdtValor_Venda.Text, ThousandSeparator, '', [rfReplaceAll]);
    FrmChama_Produto.close;
  end
  else if (FrmConsulta_Historico_Movimentacao <> Nil) and
    (FrmConsulta_Historico_Movimentacao.ativo = true) then
  begin
    FrmConsulta_Historico_Movimentacao.EdtCodigo_Produto.Text :=
      dm.qrychama_produtoCodigo.AsString;
    FrmConsulta_Historico_Movimentacao.EdtProduto.Text :=
      dm.qrychama_produtoDescricao.AsString;
    FrmChama_Produto.close;
  end
  else if (FrmGera_Etiqueta_Impressora_Etiqueta <> Nil) and
    (FrmGera_Etiqueta_Impressora_Etiqueta.ativo = true) then
  begin
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtCodigo_Produto.Text :=
      dm.qrychama_produtoCodigo.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtCodigo_Venda.Text :=
      dm.qrychama_produtoCodigo_Venda.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtProduto.Text :=
      dm.qrychama_produtoDescricao.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtUnidade.Text :=
      dm.qrychama_produtoSigla2.AsString;
    FrmGera_Etiqueta_Impressora_Etiqueta.EdtUnidade_Venda.Text :=
      dm.qrychama_produtoSigla2.AsString;

    if (dm.qrychama_produtoData_Validade.AsString <> '30/12/1899') then
      FrmGera_Etiqueta_Impressora_Etiqueta.MEdtData_Validade.Text :=
        dm.qrychama_produtoData_Validade.AsString;

    Utili.FormataFloat(2, FrmGera_Etiqueta_Impressora_Etiqueta.EdtPreco,
      dm.qrychama_produtoPreco_Vista.AsFloat);
    Utili.FormataFloat(2, FrmGera_Etiqueta_Impressora_Etiqueta.EdtPreco_Venda,
      dm.qrychama_produtoPreco_Vista.AsFloat);

    FrmChama_Produto.close;
  end
  else if (FrmEscolha_Produtos_Importacao_XML_Entrada <> nil) and
    (FrmEscolha_Produtos_Importacao_XML_Entrada.ativo = true) then
  begin
    FrmEscolha_Produtos_Importacao_XML_Entrada.EdtCodigo_Produto.Text :=
      dm.qrychama_produtoCodigo.AsString;
    FrmEscolha_Produtos_Importacao_XML_Entrada.EdtProduto.Text :=
      dm.qrychama_produtoDescricao.AsString;
    FrmChama_Produto.close;
  end;
end;

procedure TFrmChama_Produto.Pega_Percentual_Tabela_Preco;
begin
  qAuxPreco := TADOQuery.Create(nil);
  try
    with qAuxPreco, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('select TP.Percentual_Vista, TP.Percentual_Prazo, TP.Codigo');
      add('from Tabela_Preco TP');
      add('where TP.Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_padrao;
      open;
    end;
  finally
    // FreeAndNil(qAuxPreco);
  end;
end;

procedure TFrmChama_Produto.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid1 do
  begin
    if Odd(DataSource.DataSet.RecNo) then
      Canvas.Brush.Color := clMenu
    else
      Canvas.Brush.Color := clWindow;

    Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.font.Color := clBlack;

    if gdSelected in State then
      with (Sender as TDBGrid).Canvas do
      begin
        Brush.Color := clSilver;
        FillRect(Rect);
      end;

    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

  { if odd(dm.qrychama_produto.RecNo) then
    begin
    DBGrid1.Canvas.Brush.Color:= clSilver;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);

    if gdFocused in State then
    begin
    DBGrid1.Canvas.Brush.Color:= clSilver;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
    end; }
end;

procedure TFrmChama_Produto.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_return) then
  begin
    DBGrid1DblClick(self);
  end;

end;

procedure TFrmChama_Produto.DBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  mousePt: TGridcoord;
begin
  { mousePt := DbGrid1.MouseCoord(x,y);
    if mousePt.y = 0 then
    Screen.Cursor := crHandPoint
    else
    Screen.Cursor := crDefault; }
end;

procedure TFrmChama_Produto.DBGrid1TitleClick(Column: TColumn);
begin
  if (dm.qrychama_produto.Sort <> Column.FieldName + ' ASC') then
    dm.qrychama_produto.Sort := Column.FieldName + ' ASC'
  else
    dm.qrychama_produto.Sort := Column.FieldName + ' DESC';

  // Column.Title.Font.Style := [fsBold];
end;

procedure TFrmChama_Produto.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  { with DBGrid2 do
    begin
    if Odd( DataSource.DataSet.RecNo) then
    Canvas.Brush.Color := clMenu
    else
    Canvas.Brush.Color := clWindow;

    Canvas.FillRect(Rect);
    TDbGrid(Sender).Canvas.font.Color:= clBlack;
    DefaultDrawColumnCell(Rect,DataCol,Column,State);
    end; }
end;

procedure TFrmChama_Produto.EdtConsultaEnter(Sender: TObject);
begin
  dm.qrychama_produto_similar.close;
end;

procedure TFrmChama_Produto.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_return) then
  begin
    Consulta.Chama_Produto(EdtConsulta.Text);
    // Consulta.Chama_Produto_Similar_Consulta;

    LblProduto.Caption := 'Você tem ' +
      IntToStr(dm.qrychama_produto.RecordCount) + ' produtos cadastrados';
    // LblProduto_Similar.Caption:= 'Você tem ' + IntToStr(dm.qrychama_produto_similar.RecordCount) + ' produtos similares para o produto selecionado';

    FrmMenu_Geral.produto_filtrar := EdtConsulta.Text;
  end;
end;

procedure TFrmChama_Produto.EdtProduto_SimilarChange(Sender: TObject);
begin
  Consulta.Chama_Produto_Similar_Consulta;
  LblProduto_Similar.Caption := 'Você tem ' +
    IntToStr(dm.qrychama_produto_similar.RecordCount) +
    ' produtos similares para o produto selecionado';
end;

procedure TFrmChama_Produto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FrmPDV <> Nil) then
  begin
    Atualiza_Produto(4, '');
  end;

  FrmChama_Produto.Release;
  FrmChama_Produto := nil;
end;

procedure TFrmChama_Produto.FormCreate(Sender: TObject);
begin
  RGConsulta_Por.ItemIndex := consulta_padrao_produto;
  // RGConsulta_Similar.ItemIndex:= consulta_padrao_produto;
  RGStatus.ItemIndex := 0;

  EdtConsulta.Text := FrmMenu_Geral.produto_filtrar;
  if (dm.qrychama_produto.Active) then
  begin
    dm.qrychama_produto.Locate('Descricao',
      FrmMenu_Geral.produto_escolhido, []);
    LblProduto_Entrada.Caption := '';
    LblProduto.Caption := 'Você tem ' +
      IntToStr(dm.qrychama_produto.RecordCount) + ' produtos cadastrados';
  end;
  DBGrid1.DataSource:= dm.DataSource2;
end;

procedure TFrmChama_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_escape) then
    close;

  if (Key = vk_f4) then
  begin
    if (RGConsulta_Por.ItemIndex = 0) then
      RGConsulta_Por.ItemIndex := 1
    else if (RGConsulta_Por.ItemIndex = 1) then
      RGConsulta_Por.ItemIndex := 2
    else if (RGConsulta_Por.ItemIndex = 2) then
      RGConsulta_Por.ItemIndex := 3
    else if (RGConsulta_Por.ItemIndex = 3) then
      RGConsulta_Por.ItemIndex := 4
    else if (RGConsulta_Por.ItemIndex = 4) then
      RGConsulta_Por.ItemIndex := 0;
  end;
end;

procedure TFrmChama_Produto.Pega_Produto_Compra;
// var
// qAux: TADOQuery;
begin
  { if (FrmEntrada_Produtos.EdtPedido.Text <> '') and (FrmEntrada_Produtos.CBPedido.Checked) then
    begin
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select IC.Qtde from Itens_Compra');
    add('where IC.N_Pedido = :Pedido and IC.Codigo_Produto = :Produto');
    Parameters.ParamByName('Pedido').Value:= FrmEntrada_Produtos.EdtPedido.Text;
    Parameters.ParamByName('Produto').Value:= StrToInt(FrmEntrada_Produtos.LblProduto.Caption);
    Open;
    end;
    FrmEntrada_Produtos.qtde_solicitada:= qAux.FieldByName('Qtde').AsFloat;
    end; }
end;

procedure TFrmChama_Produto.Pega_Tributos;
begin
  with FrmCadastro_Produto.qryicms_ent_en, sql do
  begin
    close;
    Parameters.ParamByName('CGT').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  with FrmCadastro_Produto.qryicms_ent_epp, sql do
  begin
    close;
    Parameters.ParamByName('CGT').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  with FrmCadastro_Produto.qryicms_ent_me, sql do
  begin
    close;
    Parameters.ParamByName('CGT').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  with FrmCadastro_Produto.qryicms_sai_en, sql do
  begin
    close;
    Parameters.ParamByName('CGT').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  with FrmCadastro_Produto.qryicms_sai_epp, sql do
  begin
    close;
    Parameters.ParamByName('CGT').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  with FrmCadastro_Produto.qryicms_sai_me, sql do
  begin
    close;
    Parameters.ParamByName('CGT').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  with FrmCadastro_Produto.qryicms_nc, sql do
  begin
    close;
    Parameters.ParamByName('CGT').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  with FrmCadastro_Produto.qryipi_ent_en, sql do
  begin
    close;
    Parameters.ParamByName('CGTI').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_IPI.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  with FrmCadastro_Produto.qryipi_ent_epp, sql do
  begin
    close;
    Parameters.ParamByName('CGTI').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_IPI.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  with FrmCadastro_Produto.qryipi_ent_me, sql do
  begin
    close;
    Parameters.ParamByName('CGTI').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_IPI.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  with FrmCadastro_Produto.qryipi_sai_en, sql do
  begin
    close;
    Parameters.ParamByName('CGTI').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_IPI.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  with FrmCadastro_Produto.qryipi_sai_epp, sql do
  begin
    close;
    Parameters.ParamByName('CGTI').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_IPI.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  with FrmCadastro_Produto.qryipi_sai_me, sql do
  begin
    close;
    Parameters.ParamByName('CGTI').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_IPI.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  { with FrmCadastro_Produto.qryipi_nc, sql do
    begin
    close;
    Parameters.ParamByName('CGTI').Value:= dm.qrychama_produtoCodigo_Grupo_Tributacao_IPI.AsInteger;
    Parameters.ParamByName('Pro').Value:= dm.qrychama_produtoCodigo.AsInteger;
    open;
    end; }

  with FrmCadastro_Produto.qrypis_ent_en, sql do
  begin
    close;
    Parameters.ParamByName('CGTP').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_PIS.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  with FrmCadastro_Produto.qrypis_ent_epp, sql do
  begin
    close;
    Parameters.ParamByName('CGTP').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_PIS.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  with FrmCadastro_Produto.qrypis_ent_me, sql do
  begin
    close;
    Parameters.ParamByName('CGTP').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_PIS.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  with FrmCadastro_Produto.qrypis_sai_en, sql do
  begin
    close;
    Parameters.ParamByName('CGTP').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_PIS.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  with FrmCadastro_Produto.qrypis_sai_epp, sql do
  begin
    close;
    Parameters.ParamByName('CGTP').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_PIS.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  with FrmCadastro_Produto.qrypis_sai_me, sql do
  begin
    close;
    Parameters.ParamByName('CGTP').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_PIS.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  { with FrmCadastro_Produto.qrypis_nc, sql do
    begin
    close;
    Parameters.ParamByName('CGTP').Value:= dm.qrychama_produtoCodigo_Grupo_Tributacao_PIS.AsInteger;
    Parameters.ParamByName('Pro').Value:= dm.qrychama_produtoCodigo.AsInteger;
    open;
    end; }

  with FrmCadastro_Produto.qrycofins_ent_en, sql do
  begin
    close;
    Parameters.ParamByName('CGTC').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_COFINS.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  with FrmCadastro_Produto.qrycofins_ent_epp, sql do
  begin
    close;
    Parameters.ParamByName('CGTC').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_COFINS.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  with FrmCadastro_Produto.qrycofins_ent_me, sql do
  begin
    close;
    Parameters.ParamByName('CGTC').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_COFINS.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  with FrmCadastro_Produto.qrycofins_sai_en, sql do
  begin
    close;
    Parameters.ParamByName('CGTC').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_COFINS.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  with FrmCadastro_Produto.qrycofins_sai_epp, sql do
  begin
    close;
    Parameters.ParamByName('CGTC').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_COFINS.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  with FrmCadastro_Produto.qrycofins_sai_me, sql do
  begin
    close;
    Parameters.ParamByName('CGTC').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_COFINS.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  { with FrmCadastro_Produto.qrycofins_nc, sql do
    begin
    close;
    Parameters.ParamByName('CGTC').Value:= dm.qrychama_produtoCodigo_Grupo_Tributacao_COFINS.AsInteger;
    Parameters.ParamByName('Pro').Value:= dm.qrychama_produtoCodigo.AsInteger;
    open;
    end; }

  with FrmCadastro_Produto.qryregra_issqn, sql do
  begin
    close;
    Parameters.ParamByName('CGTISS').Value :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao_ISSQN.AsInteger;
    Parameters.ParamByName('Pro').Value := dm.qrychama_produtoCodigo.AsInteger;
    open;
  end;

  { //ENTRADAS      ICMS

    //ICMS / entrada / EN
    FrmCadastro_Produto.EdtDescricao_ICMS_Entrada_EN.Text:= ADOQuery1Descricao_ICMS_1.AsString;
    FrmCadastro_Produto.EdtAliquota_ICMS_Entrada_EN.Text:= ADOQuery1Aliquota_ICMS_1.AsString;

    if (ADOQuery1Tipo_Recolhimento_ICMS_1.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_ICMS_Entrada_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_ICMS_Entrada_EN.ItemIndex:= 1;

    if (ADOQuery1Base_Reduzida_ICMS_1.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_ICMS_Entrada_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_ICMS_Entrada_EN.ItemIndex:= 1;

    if (ADOQuery1Base_Acrescida_ICMS_1.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_ICMS_Entrada_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_ICMS_Entrada_EN.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_Base_Calculo_Reduzida_ICMS_Entrada_EN.Text:= ADOQuery1Percentual_BC_Reduzida_ICMS_1.AsString;
    FrmCadastro_Produto.EdtPercentual_Base_Calculo_Acrescida_ICMS_Entrada_EN.Text:= ADOQuery1Percentual_BC_Acrescida_ICMS_1.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_ICMS_Entrada_EN.Text:= ADOQuery1Codigo_ST_ICMS1_1.AsString + ' - ' + ADOQuery1Descricao_ST_ICMS1_1.AsString;
    FrmCadastro_Produto.EdtObservacao_Fiscal_ICMS_Entrada_EN.Text:= ADOQuery1Obs_Fiscal.AsString;
    FrmCadastro_Produto.MMODispositivo_Legal_Entrada_EN.Text:= ADOQuery1Dispositivo_Legal.AsString;

    //ICMS / entrada / EPP
    FrmCadastro_Produto.EdtDescricao_ICMS_Entrada_EPP.Text:= ADOQuery1Descricao_ICMS_2.AsString;
    FrmCadastro_Produto.EdtAliquota_ICMS_Entrada_EPP.Text:= ADOQuery1Aliquota_ICMS_2.AsString;

    if (ADOQuery1Tipo_Recolhimento_ICMS_2.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_ICMS_Entrada_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_ICMS_Entrada_EPP.ItemIndex:= 1;

    if (ADOQuery1Base_Reduzida_ICMS_2.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_ICMS_Entrada_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_ICMS_Entrada_EPP.ItemIndex:= 1;

    if (ADOQuery1Base_Acrescida_ICMS_2.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_ICMS_Entrada_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_ICMS_Entrada_EPP.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_Base_Calculo_Reduzida_ICMS_Entrada_EPP.Text:= ADOQuery1Percentual_BC_Reduzida_ICMS_2.AsString;
    FrmCadastro_Produto.EdtPercentual_Base_Calculo_Acrescida_ICMS_Entrada_EPP.Text:= ADOQuery1Percentual_BC_Acrescida_ICMS_2.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_ICMS_Entrada_EPP.Text:= ADOQuery1Codigo_ST_ICMS1_2.AsString + ' - ' + ADOQuery1Descricao_ST_ICMS1_2.AsString;
    FrmCadastro_Produto.EdtObservacao_Fiscal_ICMS_Entrada_EPP.Text:= ADOQuery1Obs_Fiscal_1.AsString;
    FrmCadastro_Produto.MMODispositivo_Legal_Entrada_EPP.Text:= ADOQuery1Dispositivo_Legal_1.AsString;

    //ICMS / entrada / ME
    FrmCadastro_Produto.EdtDescricao_ICMS_Entrada_ME.Text:= ADOQuery1Descricao_ICMS_3.AsString;
    FrmCadastro_Produto.EdtAliquota_ICMS_Entrada_ME.Text:= ADOQuery1Aliquota_ICMS_3.AsString;

    if (ADOQuery1Tipo_Recolhimento_ICMS_3.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_ICMS_Entrada_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_ICMS_Entrada_ME.ItemIndex:= 1;

    if (ADOQuery1Base_Reduzida_ICMS_3.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_ICMS_Entrada_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_ICMS_Entrada_ME.ItemIndex:= 1;

    if (ADOQuery1Base_Acrescida_ICMS_3.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_ICMS_Entrada_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_ICMS_Entrada_ME.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_Base_Calculo_Reduzida_ICMS_Entrada_ME.Text:= ADOQuery1Percentual_BC_Reduzida_ICMS_3.AsString;
    FrmCadastro_Produto.EdtPercentual_Base_Calculo_Acrescida_ICMS_Entrada_ME.Text:= ADOQuery1Percentual_BC_Acrescida_ICMS_3.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_ICMS_Entrada_ME.Text:= ADOQuery1Codigo_ST_ICMS1_3.AsString + ' - ' + ADOQuery1Descricao_ST_ICMS1_3.AsString;
    FrmCadastro_Produto.EdtObservacao_Fiscal_ICMS_Entrada_ME.Text:= ADOQuery1Obs_Fiscal_2.AsString;
    FrmCadastro_Produto.MMODispositivo_Legal_Entrada_ME.Text:= ADOQuery1Dispositivo_Legal_2.AsString;


    //SAIDAS

    //ICMS / saida / EN
    FrmCadastro_Produto.EdtDescricao_ICMS_Saida_EN.Text:= ADOQuery1Descricao_ICMS_4.AsString;
    FrmCadastro_Produto.EdtAliquota_ICMS_Saida_EN.Text:= ADOQuery1Aliquota_ICMS_4.AsString;

    if (ADOQuery1Tipo_Recolhimento_ICMS_4.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_ICMS_Saida_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_ICMS_Saida_EN.ItemIndex:= 1;

    if (ADOQuery1Base_Reduzida_ICMS_4.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_ICMS_Saida_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_ICMS_Saida_EN.ItemIndex:= 1;

    if (ADOQuery1Base_Acrescida_ICMS_4.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_ICMS_Saida_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_ICMS_Saida_EN.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_ICMS_Saida_EN.Text:= ADOQuery1Percentual_BC_Reduzida_ICMS_4.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_ICMS_Saida_EN.Text:= ADOQuery1Percentual_BC_Acrescida_ICMS_4.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_ICMS_Saida_EN.Text:= ADOQuery1Codigo_ST_ICMS1_4.AsString + ' - ' + ADOQuery1Descricao_ST_ICMS1_4.AsString;
    FrmCadastro_Produto.EdtObservacao_Fiscal_ICMS_Saida_EN.Text:= ADOQuery1Obs_Fiscal_3.AsString;
    FrmCadastro_Produto.MMODispositivo_Legal_Saida_EN.Text:= ADOQuery1Dispositivo_Legal_3.AsString;

    //ICMS / saida / EPP
    FrmCadastro_Produto.EdtDescricao_ICMS_Saida_EPP.Text:= ADOQuery1Descricao_ICMS_5.AsString;
    FrmCadastro_Produto.EdtAliquota_ICMS_Saida_EPP.Text:= ADOQuery1Aliquota_ICMS_5.AsString;

    if (ADOQuery1Tipo_Recolhimento_ICMS_5.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_ICMS_Saida_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_ICMS_Saida_EPP.ItemIndex:= 1;

    if (ADOQuery1Base_Reduzida_ICMS_5.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_ICMS_Saida_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_ICMS_Saida_EPP.ItemIndex:= 1;

    if (ADOQuery1Base_Acrescida_ICMS_5.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_ICMS_Saida_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_ICMS_Saida_EPP.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_ICMS_Saida_EPP.Text:= ADOQuery1Percentual_BC_Reduzida_ICMS_5.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_ICMS_Saida_EPP.Text:= ADOQuery1Percentual_BC_Acrescida_ICMS_5.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_ICMS_Saida_EPP.Text:= ADOQuery1Codigo_ST_ICMS1_5.AsString + ' - ' + ADOQuery1Descricao_ST_ICMS1_5.AsString;
    FrmCadastro_Produto.EdtObservacao_Fiscal_ICMS_Saida_EPP.Text:= ADOQuery1Obs_Fiscal_4.AsString;
    FrmCadastro_Produto.MMODispositivo_Legal_Saida_EPP.Text:= ADOQuery1Dispositivo_Legal_4.AsString;

    //ICMS / saida / ME
    FrmCadastro_Produto.EdtDescricao_ICMS_Saida_ME.Text:= ADOQuery1Descricao_ICMS_6.AsString;
    FrmCadastro_Produto.EdtAliquota_ICMS_Saida_ME.Text:= ADOQuery1Aliquota_ICMS_6.AsString;

    if (ADOQuery1Tipo_Recolhimento_ICMS_6.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_ICMS_Saida_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_ICMS_Saida_ME.ItemIndex:= 1;

    if (ADOQuery1Base_Reduzida_ICMS_6.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_ICMS_Saida_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_ICMS_Saida_ME.ItemIndex:= 1;

    if (ADOQuery1Base_Acrescida_ICMS_6.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_ICMS_Saida_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_ICMS_Saida_ME.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_ICMS_Saida_ME.Text:= ADOQuery1Percentual_BC_Reduzida_ICMS_6.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_ICMS_Saida_ME.Text:= ADOQuery1Percentual_BC_Acrescida_ICMS_6.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_ICMS_Saida_ME.Text:= ADOQuery1Codigo_ST_ICMS1_6.AsString + ' - ' + ADOQuery1Descricao_ST_ICMS1_6.AsString;
    FrmCadastro_Produto.EdtObservacao_Fiscal_ICMS_Saida_ME.Text:= ADOQuery1Obs_Fiscal_5.AsString;
    FrmCadastro_Produto.MMODispositivo_Legal_Saida_ME.Text:= ADOQuery1Dispositivo_Legal_5.AsString;

    //ICMS / NC
    FrmCadastro_Produto.EdtDescricao_ICMS_NC.Text:= ADOQuery1Descricao_ICMS_7.AsString;
    FrmCadastro_Produto.EdtAliquota_ICMS_NC.Text:= ADOQuery1Aliquota_ICMS_7.AsString;

    if (ADOQuery1Tipo_Recolhimento_ICMS_7.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_ICMS_NC.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_ICMS_NC.ItemIndex:= 1;

    if (ADOQuery1Base_Reduzida_ICMS_7.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_ICMS_NC.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_ICMS_NC.ItemIndex:= 1;

    if (ADOQuery1Base_Acrescida_ICMS_7.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_ICMS_NC.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_ICMS_NC.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_ICMS_NC.Text:= ADOQuery1Percentual_BC_Reduzida_ICMS_7.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_ICMS_NC.Text:= ADOQuery1Percentual_BC_Acrescida_ICMS_7.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_ICMS_NC.Text:= ADOQuery1Codigo_ST_ICMS1_7.AsString + ' - ' + ADOQuery1Descricao_ST_ICMS1_7.AsString;
    FrmCadastro_Produto.EdtObservacao_Fiscal_ICMS_NC.Text:= ADOQuery1Obs_Fiscal_6.AsString;
    FrmCadastro_Produto.MMODispositivo_Legal_NC.Text:= ADOQuery1Dispositivo_Legal_6.AsString;












    //ENTRADAS      IPI
    //IPI / entrada / EN
    FrmCadastro_Produto.EdtDescricao_IPI_Entrada_EN.Text:= ADOQuery2Descricao_IPI_1.AsString;
    FrmCadastro_Produto.EdtAliquota_IPI_Entrada_EN.Text:= ADOQuery2Aliquota_IPI_1.AsString;

    if (ADOQuery2Tipo_Recolhimento_IPI_1.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_IPI_Entrada_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_IPI_Entrada_EN.ItemIndex:= 1;

    if (ADOQuery2Base_Reduzida_IPI_1.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_IPI_Entrada_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_IPI_Entrada_EN.ItemIndex:= 1;

    if (ADOQuery2Base_Acrescida_IPI_1.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_IPI_Entrada_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_IPI_Entrada_EN.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_IPI_Entrada_EN.Text:= ADOQuery2Percentual_BC_Reduzida_IPI_1.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_IPI_Entrada_EN.Text:= ADOQuery2Percentual_BC_Acrescida_IPI_1.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_IPI_Entrada_EN.Text:= ADOQuery2Codigo_ST_IPI2_1.AsString + ' - ' + ADOQuery2Descricao_ST_IPI2_1.AsString;

    //IPI / entrada / EPP
    FrmCadastro_Produto.EdtDescricao_IPI_Entrada_EPP.Text:= ADOQuery2Descricao_IPI_2.AsString;
    FrmCadastro_Produto.EdtAliquota_IPI_Entrada_EPP.Text:= ADOQuery2Aliquota_IPI_2.AsString;

    if (ADOQuery2Tipo_Recolhimento_IPI_2.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_IPI_Entrada_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_IPI_Entrada_EPP.ItemIndex:= 1;

    if (ADOQuery2Base_Reduzida_IPI_2.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_IPI_Entrada_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_IPI_Entrada_EPP.ItemIndex:= 1;

    if (ADOQuery2Base_Acrescida_IPI_2.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_IPI_Entrada_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_IPI_Entrada_EPP.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_IPI_Entrada_EPP.Text:= ADOQuery2Percentual_BC_Reduzida_IPI_2.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_IPI_Entrada_EPP.Text:= ADOQuery2Percentual_BC_Acrescida_IPI_2.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_IPI_Entrada_EPP.Text:= ADOQuery2Codigo_ST_IPI2_2.AsString + ' - ' + ADOQuery2Descricao_ST_IPI2_2.AsString;

    //IPI / entrada / ME
    FrmCadastro_Produto.EdtDescricao_IPI_Entrada_ME.Text:= ADOQuery2Descricao_IPI_3.AsString;
    FrmCadastro_Produto.EdtAliquota_IPI_Entrada_ME.Text:= ADOQuery2Aliquota_IPI_3.AsString;

    if (ADOQuery2Tipo_Recolhimento_IPI_3.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_IPI_Entrada_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_IPI_Entrada_ME.ItemIndex:= 1;

    if (ADOQuery2Base_Reduzida_IPI_3.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_IPI_Entrada_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_IPI_Entrada_ME.ItemIndex:= 1;

    if (ADOQuery2Base_Acrescida_IPI_3.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_IPI_Entrada_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_IPI_Entrada_ME.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_IPI_Entrada_ME.Text:= ADOQuery2Percentual_BC_Reduzida_IPI_3.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_IPI_Entrada_ME.Text:= ADOQuery2Percentual_BC_Acrescida_IPI_3.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_IPI_Entrada_ME.Text:= ADOQuery2Codigo_ST_IPI2_3.AsString + ' - ' + ADOQuery2Descricao_ST_IPI2_3.AsString;


    //SAIDAS
    //IPI / saida / EN
    FrmCadastro_Produto.EdtDescricao_IPI_Saida_EN.Text:= ADOQuery2Descricao_IPI_4.AsString;
    FrmCadastro_Produto.EdtAliquota_IPI_Saida_EN.Text:= ADOQuery2Aliquota_IPI_4.AsString;

    if (ADOQuery2Tipo_Recolhimento_IPI_4.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_IPI_Saida_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_IPI_Saida_EN.ItemIndex:= 1;

    if (ADOQuery2Base_Reduzida_IPI_4.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_IPI_Saida_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_IPI_Saida_EN.ItemIndex:= 1;

    if (ADOQuery2Base_Acrescida_IPI_4.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_IPI_Saida_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_IPI_Saida_EN.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_IPI_Saida_EN.Text:= ADOQuery2Percentual_BC_Reduzida_IPI_4.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_IPI_Saida_EN.Text:= ADOQuery2Percentual_BC_Acrescida_IPI_4.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_IPI_Saida_EN.Text:= ADOQuery2Codigo_ST_IPI2_4.AsString + ' - ' + ADOQuery2Descricao_ST_IPI2_4.AsString;

    //IPI / saida / EPP
    FrmCadastro_Produto.EdtDescricao_IPI_Saida_EPP.Text:= ADOQuery2Descricao_IPI_5.AsString;
    FrmCadastro_Produto.EdtAliquota_IPI_Saida_EPP.Text:= ADOQuery2Aliquota_IPI_5.AsString;

    if (ADOQuery2Tipo_Recolhimento_IPI_5.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_IPI_Saida_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_IPI_Saida_EPP.ItemIndex:= 1;

    if (ADOQuery2Base_Reduzida_IPI_5.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_IPI_Saida_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_IPI_Saida_EPP.ItemIndex:= 1;

    if (ADOQuery2Base_Acrescida_IPI_5.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_IPI_Saida_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_IPI_Saida_EPP.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_IPI_Saida_EPP.Text:= ADOQuery2Percentual_BC_Reduzida_IPI_5.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_IPI_Saida_EPP.Text:= ADOQuery2Percentual_BC_Acrescida_IPI_5.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_IPI_Saida_EPP.Text:= ADOQuery2Codigo_ST_IPI2_5.AsString + ' - ' + ADOQuery2Descricao_ST_IPI2_5.AsString;

    //IPI / saida / ME
    FrmCadastro_Produto.EdtDescricao_IPI_Saida_ME.Text:= ADOQuery2Descricao_IPI_6.AsString;
    FrmCadastro_Produto.EdtAliquota_IPI_Saida_ME.Text:= ADOQuery2Aliquota_IPI_6.AsString;

    if (ADOQuery2Tipo_Recolhimento_IPI_6.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_IPI_Saida_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_IPI_Saida_ME.ItemIndex:= 1;

    if (ADOQuery2Base_Reduzida_IPI_6.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_IPI_Saida_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_IPI_Saida_ME.ItemIndex:= 1;

    if (ADOQuery2Base_Acrescida_IPI_6.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_IPI_Saida_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_IPI_Saida_ME.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_IPI_Saida_ME.Text:= ADOQuery2Percentual_BC_Reduzida_IPI_6.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_IPI_Saida_ME.Text:= ADOQuery2Percentual_BC_Acrescida_IPI_6.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_IPI_Saida_ME.Text:= ADOQuery2Codigo_ST_IPI2_6.AsString + ' - ' + ADOQuery2Descricao_ST_IPI2_6.AsString;


    //NC
    //IPI / NC
    FrmCadastro_Produto.EdtDescricao_IPI_NC.Text:= ADOQuery2Descricao_IPI_7.AsString;
    FrmCadastro_Produto.EdtAliquota_IPI_NC.Text:= ADOQuery2Aliquota_IPI_7.AsString;

    if (ADOQuery2Tipo_Recolhimento_IPI_7.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_IPI_NC.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_IPI_NC.ItemIndex:= 1;

    if (ADOQuery2Base_Reduzida_IPI_7.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_IPI_NC.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_IPI_NC.ItemIndex:= 1;

    if (ADOQuery2Base_Acrescida_IPI_7.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_IPI_NC.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_IPI_NC.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_IPI_NC.Text:= ADOQuery2Percentual_BC_Reduzida_IPI_7.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_IPI_NC.Text:= ADOQuery2Percentual_BC_Acrescida_IPI_7.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_IPI_NC.Text:= ADOQuery2Codigo_ST_IPI2_7.AsString + ' - ' + ADOQuery2Descricao_ST_IPI2_7.AsString;











    //ENTRADAS      PIS
    //PIS / entrada / EN
    FrmCadastro_Produto.EdtDescricao_PIS_Entrada_EN.Text:= ADOQuery3Descricao_PIS1.AsString;
    FrmCadastro_Produto.EdtAliquota_PIS_Entrada_EN.Text:= ADOQuery3Aliquota_PIS1.AsString;

    if (ADOQuery3Tipo_Recolhimento_PIS1.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_PIS_Entrada_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_PIS_Entrada_EN.ItemIndex:= 1;

    if (ADOQuery3Base_Reduzida_PIS1.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_PIS_Entrada_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_PIS_Entrada_EN.ItemIndex:= 1;

    if (ADOQuery3Base_Acrescida_PIS1.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_PIS_Entrada_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_PIS_Entrada_EN.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_PIS_Entrada_EN.Text:= ADOQuery3Percentual_BC_Reduzida_PIS1.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_PIS_Entrada_EN.Text:= ADOQuery3Percentual_BC_Acrescida_PIS1.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_PIS_Entrada_EN.Text:= ADOQuery3Codigo_ST_PIS3_1.AsString + ' - ' + ADOQuery3Descricao_ST_PIS3_1.AsString;

    //PIS / entrada / EPP
    FrmCadastro_Produto.EdtDescricao_PIS_Entrada_EPP.Text:= ADOQuery3Descricao_PIS2.AsString;
    FrmCadastro_Produto.EdtAliquota_PIS_Entrada_EPP.Text:= ADOQuery3Aliquota_PIS2.AsString;

    if (ADOQuery3Tipo_Recolhimento_PIS2.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_PIS_Entrada_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_PIS_Entrada_EPP.ItemIndex:= 1;

    if (ADOQuery3Base_Reduzida_PIS2.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_PIS_Entrada_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_PIS_Entrada_EPP.ItemIndex:= 1;

    if (ADOQuery3Base_Acrescida_PIS2.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_PIS_Entrada_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_PIS_Entrada_EPP.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_PIS_Entrada_EPP.Text:= ADOQuery3Percentual_BC_Reduzida_PIS2.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_PIS_Entrada_EPP.Text:= ADOQuery3Percentual_BC_Acrescida_PIS2.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_PIS_Entrada_EPP.Text:= ADOQuery3Codigo_ST_PIS3_2.AsString + ' - ' + ADOQuery3Descricao_ST_PIS3_2.AsString;

    //PIS / entrada / ME
    FrmCadastro_Produto.EdtDescricao_PIS_Entrada_ME.Text:= ADOQuery3Descricao_PIS3.AsString;
    FrmCadastro_Produto.EdtAliquota_PIS_Entrada_ME.Text:= ADOQuery3Aliquota_PIS3.AsString;

    if (ADOQuery3Tipo_Recolhimento_PIS3.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_PIS_Entrada_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_PIS_Entrada_ME.ItemIndex:= 1;

    if (ADOQuery3Base_Reduzida_PIS3.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_PIS_Entrada_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_PIS_Entrada_ME.ItemIndex:= 1;

    if (ADOQuery3Base_Acrescida_PIS3.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_PIS_Entrada_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_PIS_Entrada_ME.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_PIS_Entrada_ME.Text:= ADOQuery3Percentual_BC_Reduzida_PIS3.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_PIS_Entrada_ME.Text:= ADOQuery3Percentual_BC_Acrescida_PIS3.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_PIS_Entrada_ME.Text:= ADOQuery3Codigo_ST_PIS3_3.AsString + ' - ' + ADOQuery3Descricao_ST_PIS3_3.AsString;


    //SAIDAS
    //PIS / saida / EN
    FrmCadastro_Produto.EdtDescricao_PIS_Saida_EN.Text:= ADOQuery3Descricao_PIS4.AsString;
    FrmCadastro_Produto.EdtAliquota_PIS_Saida_EN.Text:= ADOQuery3Aliquota_PIS4.AsString;

    if (ADOQuery3Tipo_Recolhimento_PIS4.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_PIS_Saida_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_PIS_Saida_EN.ItemIndex:= 1;

    if (ADOQuery3Base_Reduzida_PIS4.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_PIS_Saida_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_PIS_Saida_EN.ItemIndex:= 1;

    if (ADOQuery3Base_Acrescida_PIS4.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_PIS_Saida_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_PIS_Saida_EN.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_PIS_Saida_EN.Text:= ADOQuery3Percentual_BC_Reduzida_PIS4.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_PIS_Saida_EN.Text:= ADOQuery3Percentual_BC_Acrescida_PIS4.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_PIS_Saida_EN.Text:= ADOQuery3Codigo_ST_PIS3_4.AsString + ' - ' + ADOQuery3Descricao_ST_PIS3_4.AsString;

    //PIS / saida / EPP
    FrmCadastro_Produto.EdtDescricao_PIS_Saida_EPP.Text:= ADOQuery3Descricao_PIS5.AsString;
    FrmCadastro_Produto.EdtAliquota_PIS_Saida_EPP.Text:= ADOQuery3Aliquota_PIS5.AsString;

    if (ADOQuery3Tipo_Recolhimento_PIS5.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_PIS_Saida_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_PIS_Saida_EPP.ItemIndex:= 1;

    if (ADOQuery3Base_Reduzida_PIS5.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_PIS_Saida_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_PIS_Saida_EPP.ItemIndex:= 1;

    if (ADOQuery3Base_Acrescida_PIS5.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_PIS_Saida_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_PIS_Saida_EPP.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_PIS_Saida_EPP.Text:= ADOQuery3Percentual_BC_Reduzida_PIS5.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_PIS_Saida_EPP.Text:= ADOQuery3Percentual_BC_Acrescida_PIS5.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_PIS_Saida_EPP.Text:= ADOQuery3Codigo_ST_PIS3_5.AsString + ' - ' + ADOQuery3Descricao_ST_PIS3_5.AsString;

    //PIS / saida / ME
    FrmCadastro_Produto.EdtDescricao_PIS_Saida_ME.Text:= ADOQuery3Descricao_PIS6.AsString;
    FrmCadastro_Produto.EdtAliquota_PIS_Saida_ME.Text:= ADOQuery3Aliquota_PIS6.AsString;

    if (ADOQuery3Tipo_Recolhimento_PIS6.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_PIS_Saida_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_PIS_Saida_ME.ItemIndex:= 1;

    if (ADOQuery3Base_Reduzida_PIS6.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_PIS_Saida_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_PIS_Saida_ME.ItemIndex:= 1;

    if (ADOQuery3Base_Acrescida_PIS6.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_PIS_Saida_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_PIS_Saida_ME.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_PIS_Saida_ME.Text:= ADOQuery3Percentual_BC_Reduzida_PIS6.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_PIS_Saida_ME.Text:= ADOQuery3Percentual_BC_Acrescida_PIS6.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_PIS_Saida_ME.Text:= ADOQuery3Codigo_ST_PIS3_6.AsString + ' - ' + ADOQuery3Descricao_ST_PIS3_6.AsString;


    //NC
    //PIS / NC
    FrmCadastro_Produto.EdtDescricao_PIS_NC.Text:= ADOQuery3Descricao_PIS7.AsString;
    FrmCadastro_Produto.EdtAliquota_PIS_NC.Text:= ADOQuery3Aliquota_PIS7.AsString;

    if (ADOQuery3Tipo_Recolhimento_PIS7.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_PIS_NC.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_PIS_NC.ItemIndex:= 1;

    if (ADOQuery3Base_Reduzida_PIS7.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_PIS_NC.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_PIS_NC.ItemIndex:= 1;

    if (ADOQuery3Base_Acrescida_PIS7.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_PIS_NC.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_PIS_NC.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_PIS_NC.Text:= ADOQuery3Percentual_BC_Reduzida_PIS7.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_PIS_NC.Text:= ADOQuery3Percentual_BC_Acrescida_PIS7.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_PIS_NC.Text:= ADOQuery3Codigo_ST_PIS3_7.AsString + ' - ' + ADOQuery3Descricao_ST_PIS3_7.AsString;












    {//ENTRADAS      COFINS
    //COFINS / entrada / EN
    FrmCadastro_Produto.EdtDescricao_COFINS_Entrada_EN.Text:= ADOQuery1Descricao_COFINS1.AsString;
    FrmCadastro_Produto.EdtAliquota_COFINS_Entrada_EN.Text:= ADOQuery1Aliquota_COFINS1.AsString;

    if (ADOQuery1Tipo_Recolhimento_PIS1.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_COFINS_Entrada_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_COFINS_Entrada_EN.ItemIndex:= 1;

    if (ADOQuery1Base_Reduzida_PIS1.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_COFINS_Entrada_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_COFINS_Entrada_EN.ItemIndex:= 1;

    if (ADOQuery1Base_Acrescida_PIS1.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_COFINS_Entrada_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_COFINS_Entrada_EN.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_COFINS_Entrada_EN.Text:= ADOQuery1Percentual_BC_Reduzida_COFINS1.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_COFINS_Entrada_EN.Text:= ADOQuery1Percentual_BC_Acrescida_COFINS1.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_COFINS_Entrada_EN.Text:= ADOQuery1Codigo_ST_COFINS1.AsString + ' - ' + ADOQuery1Descricao_ST_COFINS1.AsString;

    //COFINS / entrada / EPP
    FrmCadastro_Produto.EdtDescricao_COFINS_Entrada_EPP.Text:= ADOQuery1Descricao_COFINS2.AsString;
    FrmCadastro_Produto.EdtAliquota_COFINS_Entrada_EPP.Text:= ADOQuery1Aliquota_COFINS2.AsString;

    if (ADOQuery1Tipo_Recolhimento_PIS2.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_COFINS_Entrada_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_COFINS_Entrada_EPP.ItemIndex:= 1;

    if (ADOQuery1Base_Reduzida_PIS2.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_COFINS_Entrada_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_COFINS_Entrada_EPP.ItemIndex:= 1;

    if (ADOQuery1Base_Acrescida_PIS2.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_COFINS_Entrada_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_COFINS_Entrada_EPP.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_COFINS_Entrada_EPP.Text:= ADOQuery1Percentual_BC_Reduzida_COFINS2.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_COFINS_Entrada_EPP.Text:= ADOQuery1Percentual_BC_Acrescida_COFINS2.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_COFINS_Entrada_EPP.Text:= ADOQuery1Codigo_ST_COFINS2.AsString + ' - ' + ADOQuery1Descricao_ST_COFINS2.AsString;

    //COFINS / entrada / ME
    FrmCadastro_Produto.EdtDescricao_COFINS_Entrada_ME.Text:= ADOQuery1Descricao_COFINS3.AsString;
    FrmCadastro_Produto.EdtAliquota_COFINS_Entrada_ME.Text:= ADOQuery1Aliquota_COFINS3.AsString;

    if (ADOQuery1Tipo_Recolhimento_PIS3.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_COFINS_Entrada_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_COFINS_Entrada_ME.ItemIndex:= 1;

    if (ADOQuery1Base_Reduzida_PIS3.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_COFINS_Entrada_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_COFINS_Entrada_ME.ItemIndex:= 1;

    if (ADOQuery1Base_Acrescida_PIS3.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_COFINS_Entrada_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_COFINS_Entrada_ME.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_COFINS_Entrada_ME.Text:= ADOQuery1Percentual_BC_Reduzida_COFINS3.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_COFINS_Entrada_ME.Text:= ADOQuery1Percentual_BC_Acrescida_COFINS3.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_COFINS_Entrada_ME.Text:= ADOQuery1Codigo_ST_COFINS3.AsString + ' - ' + ADOQuery1Descricao_ST_COFINS3.AsString;


    //SAIDAS
    //COFINS / saida / EN
    FrmCadastro_Produto.EdtDescricao_COFINS_Saida_EN.Text:= ADOQuery1Descricao_COFINS4.AsString;
    FrmCadastro_Produto.EdtAliquota_COFINS_Saida_EN.Text:= ADOQuery1Aliquota_COFINS4.AsString;

    if (ADOQuery1Tipo_Recolhimento_PIS4.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_COFINS_Saida_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_COFINS_Saida_EN.ItemIndex:= 1;

    if (ADOQuery1Base_Reduzida_PIS4.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_COFINS_Saida_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_COFINS_Saida_EN.ItemIndex:= 1;

    if (ADOQuery1Base_Acrescida_PIS4.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_COFINS_Saida_EN.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_COFINS_Saida_EN.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_COFINS_Saida_EN.Text:= ADOQuery1Percentual_BC_Reduzida_COFINS4.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_COFINS_Saida_EN.Text:= ADOQuery1Percentual_BC_Acrescida_COFINS4.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_COFINS_Saida_EN.Text:= ADOQuery1Codigo_ST_COFINS4.AsString + ' - ' + ADOQuery1Descricao_ST_COFINS4.AsString;

    //COFINS / saida / EPP
    FrmCadastro_Produto.EdtDescricao_COFINS_Saida_EPP.Text:= ADOQuery1Descricao_COFINS5.AsString;
    FrmCadastro_Produto.EdtAliquota_COFINS_Saida_EPP.Text:= ADOQuery1Aliquota_COFINS5.AsString;

    if (ADOQuery1Tipo_Recolhimento_PIS5.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_COFINS_Saida_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_COFINS_Saida_EPP.ItemIndex:= 1;

    if (ADOQuery1Base_Reduzida_PIS5.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_COFINS_Saida_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_COFINS_Saida_EPP.ItemIndex:= 1;

    if (ADOQuery1Base_Acrescida_PIS5.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_COFINS_Saida_EPP.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_COFINS_Saida_EPP.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_COFINS_Saida_EPP.Text:= ADOQuery1Percentual_BC_Reduzida_COFINS5.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_COFINS_Saida_EPP.Text:= ADOQuery1Percentual_BC_Acrescida_COFINS5.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_COFINS_Saida_EPP.Text:= ADOQuery1Codigo_ST_COFINS5.AsString + ' - ' + ADOQuery1Descricao_ST_COFINS5.AsString;

    //COFINS / saida / ME
    FrmCadastro_Produto.EdtDescricao_COFINS_Saida_ME.Text:= ADOQuery1Descricao_COFINS6.AsString;
    FrmCadastro_Produto.EdtAliquota_COFINS_Saida_ME.Text:= ADOQuery1Aliquota_COFINS6.AsString;

    if (ADOQuery1Tipo_Recolhimento_PIS6.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_COFINS_Saida_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_COFINS_Saida_ME.ItemIndex:= 1;

    if (ADOQuery1Base_Reduzida_PIS6.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_COFINS_Saida_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_COFINS_Saida_ME.ItemIndex:= 1;

    if (ADOQuery1Base_Acrescida_PIS6.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_COFINS_Saida_ME.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_COFINS_Saida_ME.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_COFINS_Saida_ME.Text:= ADOQuery1Percentual_BC_Reduzida_COFINS6.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_COFINS_Saida_ME.Text:= ADOQuery1Percentual_BC_Acrescida_COFINS6.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_COFINS_Saida_ME.Text:= ADOQuery1Codigo_ST_COFINS6.AsString + ' - ' + ADOQuery1Descricao_ST_COFINS6.AsString;


    //NC
    //COFINS / NC
    FrmCadastro_Produto.EdtDescricao_COFINS_NC.Text:= ADOQuery1Descricao_COFINS7.AsString;
    FrmCadastro_Produto.EdtAliquota_COFINS_NC.Text:= ADOQuery1Aliquota_COFINS7.AsString;

    if (ADOQuery1Tipo_Recolhimento_PIS7.AsString = 'NORMAL') then
    FrmCadastro_Produto.RGTipo_Recolhimento_COFINS_NC.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGTipo_Recolhimento_COFINS_NC.ItemIndex:= 1;

    if (ADOQuery1Base_Reduzida_PIS7.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Reduzida_COFINS_NC.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Reduzida_COFINS_NC.ItemIndex:= 1;

    if (ADOQuery1Base_Acrescida_PIS7.AsString = 'SIM') then
    FrmCadastro_Produto.RGBase_Acrescida_COFINS_NC.ItemIndex:= 0
    else
    FrmCadastro_Produto.RGBase_Acrescida_COFINS_NC.ItemIndex:= 1;

    FrmCadastro_Produto.EdtPercentual_BC_Reduzida_COFINS_NC.Text:= ADOQuery1Percentual_BC_Reduzida_COFINS7.AsString;
    FrmCadastro_Produto.EdtPercentual_BC_Acrescida_COFINS_NC.Text:= ADOQuery1Percentual_BC_Acrescida_COFINS7.AsString;
    FrmCadastro_Produto.EdtSituacao_Tributaria_COFINS_NC.Text:= ADOQuery1Codigo_ST_COFINS7.AsString + ' - ' + ADOQuery1Descricao_ST_COFINS7.AsString; }
end;

procedure TFrmChama_Produto.procuraProdutoCodigo;
var
  val_aux: double;
begin
  if (FrmPedido_Venda <> Nil) and (FrmPedido_Venda.ativo = true) then
  begin
    TLog.Info('--- CHAMA PRODUTO - DUPLO CLIQUE NO PRODUTO ---');
    if (dm.qrychama_produtoNCM.AsString = '') then
    begin
      if (Application.MessageBox(PChar('O código NCM do produto ' +
        dm.qrychama_produtoDescricao.AsString +
        ' ESTÁ EM BRANCO. Para calcular o imposto na nota, é necessário configura-lo. Deseja continuar?'),
        'NCM não encontrado', MB_YESNO + MB_ICONEXCLAMATION)) = IDNO then
      begin
        abort;
      end;
    end;

    TLog.Debug('Verificou NCM em branco.');
    if not(Verifica_NCM_Ja_Existe(dm.qrychama_produtoNCM.AsString,
      FrmPedido_Venda.Conexao)) then
    begin
      if (Application.MessageBox(PChar('O código NCM do produto ' +
        dm.qrychama_produtoDescricao.AsString +
        ' NÃO FOI ENCONTRADO no cadastro de NCM. Para calcular o imposto na nota, é necessário configura-lo. Deseja continuar?'),
        'NCM não encontrado', MB_YESNO + MB_ICONEXCLAMATION)) = IDNO then
      begin
        abort;
      end;
    end;

    TLog.Debug('Verificou NCM não cadastrado.');
    FrmPedido_Venda.LblProduto.Caption := dm.qrychama_produtoCodigo.AsString;
    FrmPedido_Venda.LblTipo.Caption := dm.qrychama_produtoTipo.AsString;
    FrmPedido_Venda.LblNCM.Caption := dm.qrychama_produtoNCM.AsString;

    FrmPedido_Venda.EdtCodigo_Produto.Text :=
      dm.qrychama_produtoCodigo_Venda.AsString;
    FrmPedido_Venda.EdtProduto.Text := dm.qrychama_produtoDescricao.AsString;
    FrmPedido_Venda.EdtUnidade.Text := dm.qrychama_produtoSigla.AsString;
    FrmPedido_Venda.valor_compra := dm.qrychama_produtoValor_Compra.AsFloat;
    FrmPedido_Venda.valor_compra_nota :=
      dm.qrychama_produtoValor_Compra_Unitario.AsFloat;
    grupo_produto_tributacao_icms :=
      dm.qrychama_produtoCodigo_Grupo_Tributacao.AsString;
    TLog.Debug('Tipo de Pagamento: ' + FrmPedido_Venda.tipo_pag);

    if (FrmPedido_Venda.tipo_pag = 'A VISTA') then
    begin
      if (dm.qrychama_produtoPreco_Prazo.AsFloat = dm.
        qrychama_produtoPreco_Vista.AsFloat) then
      begin
        if (FrmPedido_Venda.tipo_juro = 'C') then
          val_aux := Calcula_Juro_Composto
            (dm.qrychama_produtoPreco_Vista.AsFloat, FrmPedido_Venda.taxa / 100,
            FrmPedido_Venda.qtde_parcela)
        else
        begin
          val_aux := (100 - FrmPedido_Venda.taxa) / 100;
          val_aux := dm.qrychama_produtoPreco_Vista.AsFloat / val_aux;
        end;
      end
      else
      begin
        val_aux := dm.qrychama_produtoPreco_Vista.AsFloat;
      end;
    end
    else
    begin
      if (dm.qrychama_produtoPreco_Prazo.AsFloat = dm.
        qrychama_produtoPreco_Vista.AsFloat) then
      begin
        if (FrmPedido_Venda.tipo_juro = 'C') then
          val_aux := Calcula_Juro_Composto
            (dm.qrychama_produtoPreco_Prazo.AsFloat, FrmPedido_Venda.taxa / 100,
            FrmPedido_Venda.qtde_parcela)
        else
        begin
          val_aux := (100 - FrmPedido_Venda.taxa) / 100;
          val_aux := dm.qrychama_produtoPreco_Prazo.AsFloat / val_aux;
        end;
      end
      else
      begin
        val_aux := dm.qrychama_produtoPreco_Prazo.AsFloat;
      end;
    end;
    TLog.Debug('Verificou Juros Vista/Prazo.');
    FrmPedido_Venda.EdtValor_Unitario.Text :=
      FloatToStr(Calcula_Valor(FloatToStr(val_aux)));
    FrmPedido_Venda.EdtValor_Tabela.Text :=
      FloatToStr(Calcula_Valor(FloatToStr(val_aux)));
    // FrmPedido_Venda.EdtDesc_Acr.Text:= '0,00';
    // FrmPedido_Venda.var_uni:= Calcula_Valor(FloatToStr(val_aux));

    FrmPedido_Venda.perc_desc :=
      dm.qrychama_produtoPercentual_Desconto_Vista.AsFloat;
    FrmPedido_Venda.perc_desc_prazo :=
      dm.qrychama_produtoPercentual_Desconto_Prazo.AsFloat;

    FrmPedido_Venda.perc_vista :=
      dm.qrychama_produtoPercentual_Lucro_Vista.AsFloat;
    FrmPedido_Venda.perc_prazo :=
      dm.qrychama_produtoPercentual_Lucro_Prazo.AsFloat;

    // pegar ICMS
    TLog.Debug('Inscrição Estadual: ' +
      FrmPedido_Venda.LblInscricao_Estadual.Caption);
    if (FrmPedido_Venda.LblInscricao_Estadual.Caption <> '') then
    begin
      if not(Pega_ICMS_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao.
        AsInteger, uf, FrmPedido_Venda.LblUF.Caption, FrmPedido_Venda.Conexao))
      then
      begin
        Application.MessageBox(PWideChar('ICMS de ' + uf + ' para ' +
          FrmPedido_Venda.LblUF.Caption +
          ' não configurado. Por favor, vá em Cadastro > ICMS > Tratamento e configure.'),
          'ICMS não encontrado', MB_OK + MB_ICONHAND);
        abort;
      end;
    end
    else
    begin
      if not(Pega_ICMS_NC_Outro(dm.qrychama_produtoCodigo_Grupo_Tributacao.
        AsInteger, uf, FrmPedido_Venda.LblUF.Caption, FrmPedido_Venda.Conexao))
      then
      begin
        Application.MessageBox(PWideChar('ICMS de ' + uf + ' para ' +
          FrmPedido_Venda.LblUF.Caption +
          ' não configurado. Por favor, vá em Cadastro > ICMS > Tratamento e configure.'),
          'ICMS não encontrado', MB_OK + MB_ICONHAND);
        abort;
      end;
    end;
    TLog.Debug('Verificou ICMS.');
    permite_credito := qAux_ICMS.FieldByName('Permite_Credito').AsInteger;
    codigo_obs_fiscal := qAux_ICMS.FieldByName('Codigo_Obs_Fiscal').AsInteger;

    if (uf = FrmPedido_Venda.LblUF.Caption) then
      FrmPedido_Venda.EdtCFOP.Text := qAux_ICMS.FieldByName('CFOP_D').AsString
    else
      FrmPedido_Venda.EdtCFOP.Text := qAux_ICMS.FieldByName('CFOP_F').AsString;

    FrmPedido_Venda.EdtST.Text := qAux_ICMS.FieldByName('Aliquota').AsString;
    { if not (Pega_ICMS_NC(dm.qrychama_produtoCodigo_Grupo_Tributacao.AsInteger) ) then
      begin
      Application.MessageBox(PWideChar('ICMS de '+uf+' para '+FrmPedido_Venda.LblUF.Caption+
      ' não configurado. Por favor, vá em Cadastro > ICMS > Tratamento e configure.'), 'ICMS não encontrado', MB_OK + MB_ICONHAND);
      abort;
      end; }

    if (qAux_ICMS.FieldByName('Aliquota').AsString <> 'I') and
      (qAux_ICMS.FieldByName('Aliquota').AsString <> 'N') and
      (qAux_ICMS.FieldByName('Aliquota').AsString <> 'F') then
    begin
      if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 1 then
      begin
        icms := '0' + qAux_ICMS.FieldByName('Aliquota').AsString + '00'; // 0700
        icms_st := '';
        // FrmPedido_Venda.EdtST.Text:= qAux_ICMS.FieldByName('Aliquota').AsString;
      end
      else if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 2 then
      begin
        icms := qAux_ICMS.FieldByName('Aliquota').AsString + '00'; // 1700
        icms_st := '';
        // FrmPedido_Venda.EdtST.Text:= qAux_ICMS.FieldByName('Aliquota').AsString;
      end
      else if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 3 then
      begin
        icms := StringReplace(qAux_ICMS.FieldByName('Aliquota').AsString, ',',
          '', [rfReplaceAll]);
        icms := '0' + icms + '0'; // 0840
        icms_st := '';
        // FrmPedido_Venda.EdtST.Text:= qAux_ICMS.FieldByName('Aliquota').AsString;
      end
      else if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 4 then
      begin
        icms := StringReplace(qAux_ICMS.FieldByName('Aliquota').AsString, ',',
          '', [rfReplaceAll]);
        icms := icms + '0'; // 1320
        icms_st := '';
        // FrmPedido_Venda.EdtST.Text:= qAux_ICMS.FieldByName('Aliquota').AsString;
      end;
    end
    else
    begin
      icms := qAux_ICMS.FieldByName('Aliquota').AsString + '1';
      icms_st := '';
      // FrmPedido_Venda.EdtST.Text:= qAux_ICMS.FieldByName('Aliquota').AsString;
    end;

    cst_icms := qAux_ICMS.FieldByName('Codigo_Situacao').AsString;
    cst_icms_st := '';

    tipo_calculo_bc_icms := qAux_ICMS.FieldByName
      ('Tipo_Calculo_BC_ICMS').AsString;
    tipo_calculo_bc_icms_st := qAux_ICMS.FieldByName
      ('Tipo_Calculo_BC_ICMS_ST').AsString;
    tipo_recolhimento_icms := qAux_ICMS.FieldByName
      ('Tipo_Recolhimento').AsString;

    // if (qAux_ICMS.FieldByName('Base_Reduzida').AsString = 'SIM') then
    // begin
    br_icms := qAux_ICMS.FieldByName('Percentual_BC_Reduzida').AsString;
    br_icms_st := '';
    { end
      else
      begin
      br_icms:= '';
      br_icms_st:= '';
      end; }

    // if (qAux_ICMS.FieldByName('Base_Acrescida').AsString = 'SIM') then
    // begin
    ba_icms_st := '';
    { end
      else
      begin
      ba_icms:= '';
      ba_icms_st:= '';
      end; }
    csosn := qAux_ICMS.FieldByName('Codigo_CSOSN').AsString;

    origem := qAux_ICMS.FieldByName('Origem').AsString;

    // ---- fim icms----

    // ----ipi----

    Pega_IPI_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao_IPI.AsInteger, FrmPedido_Venda.Conexao);

    ipi := qAux_IPI.FieldByName('Aliquota').AsString;
    cst_ipi := qAux_IPI.FieldByName('Codigo_Situacao').AsString;
    tipo_calculo_bc_ipi := qAux_IPI.FieldByName('Tipo_Calculo').AsString;

    if (qAux_IPI.FieldByName('Base_Reduzida').AsString = 'SIM') then
      br_ipi := qAux_IPI.FieldByName('Percentual_BC_Reduzida').AsString
    else
      br_ipi := '';

    if (qAux_IPI.FieldByName('Base_Acrescida').AsString = 'SIM') then
      ba_ipi := qAux_IPI.FieldByName('Percentual_BC_Acrescida').AsString
    else
      ba_ipi := '';

    // ----fim ipi----

    // ----pis----

    Pega_PIS_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao_PIS.AsInteger, FrmPedido_Venda.Conexao);

    pis := qAux_PIS.FieldByName('Aliquota').AsString;
    cst_pis := qAux_PIS.FieldByName('Codigo_Situacao').AsString;
    tipo_calculo_bc_pis := qAux_PIS.FieldByName('Tipo_Calculo').AsString;

    if (qAux_PIS.FieldByName('Base_Reduzida').AsString = 'SIM') then
      br_pis := qAux_PIS.FieldByName('Percentual_BC_Reduzida').AsString
    else
      br_pis := '';

    if (qAux_PIS.FieldByName('Base_Acrescida').AsString = 'SIM') then
      ba_pis := qAux_PIS.FieldByName('Percentual_BC_Acrescida').AsString
    else
      ba_pis := '';

    // ---- fim pis----

    // ----cofins----

    Pega_COFINS_Saida(dm.qrychama_produtoCodigo_Grupo_Tributacao_COFINS.
      AsInteger, FrmPedido_Venda.Conexao);

    cofins := qAux_COFINS.FieldByName('Aliquota').AsString;
    cst_cofins := qAux_COFINS.FieldByName('Codigo_Situacao').AsString;
    tipo_calculo_bc_cofins := qAux_COFINS.FieldByName('Tipo_Calculo').AsString;

    if (qAux_COFINS.FieldByName('Base_Reduzida').AsString = 'SIM') then
      br_cofins := qAux_COFINS.FieldByName('Percentual_BC_Reduzida').AsString
    else
      br_cofins := '';

    if (qAux_COFINS.FieldByName('Base_Acrescida').AsString = 'SIM') then
      ba_cofins := qAux_COFINS.FieldByName('Percentual_BC_Acrescida').AsString
    else
      ba_cofins := '';

    // ---- fim cofins----

    { if (dm.qrychama_produtoTipo_Tributacao.AsString = 'T') then
      begin
      if Length(qAux_ICMS.FieldByName('Aliquota').AsString) = 1 then
      begin
      FrmPedido_Venda.LblAli.Caption:= '0'+qAux_ICMS.FieldByName('Aliquota').AsString+'00';
      FrmPedido_Venda.EdtST.Text:= qAux_ICMS.FieldByName('Aliquota').AsString;
      end
      else
      begin
      FrmPedido_Venda.LblAli.Caption:= qAux_ICMS.FieldByName('Aliquota').AsString+'00';
      FrmPedido_Venda.EdtST.Text:= qAux_ICMS.FieldByName('Aliquota').AsString;
      end;
      end
      else if (dm.qrychama_produtoTipo_Tributacao.AsString = 'I') then
      begin
      FrmPedido_Venda.EdtST.Text:= 'I1';
      FrmPedido_Venda.LblAli.Caption:= 'I1';
      end
      else if (dm.qrychama_produtoTipo_Tributacao.AsString = 'N') then
      begin
      FrmPedido_Venda.EdtST.Text:= 'N1';
      FrmPedido_Venda.LblAli.Caption:= 'N1';
      end
      else if (dm.qrychama_produtoTipo_Tributacao.AsString = 'F') then
      begin
      FrmPedido_Venda.EdtST.Text:= 'F1';
      FrmPedido_Venda.LblAli.Caption:= 'F1';
      end; }

    FrmPedido_Venda.cod_produto := dm.qrychama_produtoCodigo.AsInteger;
    // dm.qrychama_produtoCodigo.AsInteger;
    FrmPedido_Venda.cod_pro := dm.qrychama_produtoCodigo_Venda.AsString;
    // dm.qrychama_produtoCodigo_Venda.AsString;
    FrmPedido_Venda.descri := dm.qrychama_produtoDescricao.AsString;
    // dm.qrychama_produtoDescricao.AsString;
    FrmPedido_Venda.unid := dm.qrychama_produtoSigla.AsString;
    // dm.qrychama_produtoSigla.AsString;
    FrmPedido_Venda.IAT := dm.qrychama_produtoArred_Trunc.AsString;
    FrmPedido_Venda.IPPT := dm.qrychama_produtoProducao_Propria.AsString;

    permissao_venda := dm.qrychama_produtoEm_Estoque_Minimo.AsString;
    permissao_compra := dm.qrychama_produtoEm_Estoque_Maximo.AsString;
    estoque_minimo := dm.qrychama_produtoEstoque_Minimo.AsFloat;
    estoque_maximo := dm.qrychama_produtoEstoque_Maximo.AsFloat;
    qtde_estoque := dm.qrychama_produtoEstoque.AsFloat;

    if (FrmPedido_Venda.tipo_pag = 'A VISTA') then
      comissao_produto := dm.qrychama_produtoPercentual_Comissao_Vista.AsFloat
    else
      comissao_produto := dm.qrychama_produtoPercentual_Comissao_Prazo.AsFloat;

    FrmPedido_Venda.EdtST.SetFocus;
  end;
end;

  procedure TFrmChama_Produto.RGStatusClick(Sender: TObject);
  begin
    Consulta.Chama_Produto(EdtConsulta.Text);
    LblProduto.Caption := 'Você tem ' +
      IntToStr(dm.qrychama_produto.RecordCount) + ' produtos cadastrados';
  end;

end.
