unit UChama_Condicao_Pagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, DBClient, Provider;

type
  TFrmChama_Condicao_Pagamento = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ImgImagens: TImageList;
    LblMarca: TLabel;
    qrychama_condicao: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_condicaoCodigo: TAutoIncField;
    qrychama_condicaoDescricao: TStringField;
    qrychama_condicaoParcela: TIntegerField;
    qrychama_condicaoPrazo: TIntegerField;
    qrychama_condicaoTaxa: TFloatField;
    qrychama_condicaoTipo_Pagamento: TStringField;
    qrychama_condicaoForma_Negociacao: TStringField;
    qrychama_condicaoData_Cadastro: TDateTimeField;
    qrychama_condicaoTEF: TStringField;
    qrychama_condicaoCheque: TStringField;
    qrychama_condicaoStatus: TStringField;
    qrychama_condicaoBandeira: TStringField;
    qrychama_condicaoTipo_Juro: TStringField;
    qrychama_condicaoIndice: TStringField;
    qrychama_condicaoPrograma_Impressora: TStringField;
    CBStatus: TCheckBox;
    CBImpFiscal: TCheckBox;
    qrychama_condicaoCNPJ_Operadora: TStringField;
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CBImpFiscalClick(Sender: TObject);
    procedure CBStatusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Condicao_Pagamento: TFrmChama_Condicao_Pagamento;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Condicao_Pagamento, ULancamento_Financeiro, UPedido_Venda,
  UDeclaracao, UCompra, UAbertura_Caixa, UConsulta_Lancamentos_Financeiros,
  UCotacao_Preco_Produto, URetorno_Cotacao, USuprimento, USangria,
  UAltera_Caixa, UEntrada_Produtos, UNFE, UBaixar_Titulo,
  UGerar_Documentos;

{$R *.dfm}

procedure TFrmChama_Condicao_Pagamento.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Condicao_Pagamento.CBImpFiscalClick(Sender: TObject);
begin
  Consulta.Chama_Condicao_Pagamento(EdtConsulta.Text);
end;

procedure TFrmChama_Condicao_Pagamento.CBStatusClick(Sender: TObject);
begin
  Consulta.Chama_Condicao_Pagamento(EdtConsulta.Text);
end;

procedure TFrmChama_Condicao_Pagamento.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Condicao_Pagamento <> Nil) and (FrmCadastro_Condicao_Pagamento.ativo = true) then
  begin
    FrmCadastro_Condicao_Pagamento.EdtCodigo.Text:= dm.qrychama_condicaoCodigo.AsString;
    FrmCadastro_Condicao_Pagamento.EdtDescricao.Text:= dm.qrychama_condicaoDescricao.AsString;
    FrmCadastro_Condicao_Pagamento.EdtParcela.Text:= dm.qrychama_condicaoParcela.AsString;
    FrmCadastro_Condicao_Pagamento.EdtPrazo.Text:= dm.qrychama_condicaoPrazo.AsString;
    FrmCadastro_Condicao_Pagamento.EdtTaxa_Juros.Text:= dm.qrychama_condicaoTaxa.AsString;
    FrmCadastro_Condicao_Pagamento.EdtIndice.Text:= dm.qrychama_condicaoIndice.AsString;

    if (dm.qrychama_condicaoStatus.AsString = 'ATIVO') then
      FrmCadastro_Condicao_Pagamento.CBStatus.Checked:= true
    else if (dm.qrychama_condicaoStatus.AsString = 'INATIVO') then
      FrmCadastro_Condicao_Pagamento.CBStatus.Checked:= true;

    if (dm.qrychama_condicaoTipo_Pagamento.AsString = 'A VISTA') then
      FrmCadastro_Condicao_Pagamento.RBA_Vista.Checked:= true
    else if (dm.qrychama_condicaoTipo_Pagamento.AsString = 'A PRAZO') then
      FrmCadastro_Condicao_Pagamento.RBA_PRazo.Checked:= true;

    if (dm.qrychama_condicaoTEF.AsString = 'SIM') then
      FrmCadastro_Condicao_Pagamento.RGTEF.ItemIndex:= 0
    else
      FrmCadastro_Condicao_Pagamento.RGTEF.ItemIndex:= 1;

    if (dm.qrychama_condicaoCheque.AsString = 'SIM') then
      FrmCadastro_Condicao_Pagamento.RGCheque.ItemIndex:= 0
    else
      FrmCadastro_Condicao_Pagamento.RGCheque.ItemIndex:= 1;

    if (dm.qrychama_condicaoTipo_Juro.AsString = 'S') then
      FrmCadastro_Condicao_Pagamento.RGTipo_Juro.ItemIndex:= 0
    else
      FrmCadastro_Condicao_Pagamento.RGTipo_Juro.ItemIndex:= 1;

    if (dm.qrychama_condicaoPrograma_Impressora.AsString = 'SIM') then
      FrmCadastro_Condicao_Pagamento.CBPrograma.Checked:= true
    else
      FrmCadastro_Condicao_Pagamento.CBPrograma.Checked:= false;

    FrmCadastro_Condicao_Pagamento.MEdtData_Cadastro.Text:= dm.qrychama_condicaoData_Cadastro.AsString;
    FrmCadastro_Condicao_Pagamento.EdtCNPJ_Operadora.Text:= dm.qrychama_condicaoCNPJ_Operadora.AsString;
    FrmChama_Condicao_Pagamento.Close;
    FrmCadastro_Condicao_Pagamento.BBtnSalvar.Enabled:= true;
    FrmCadastro_Condicao_Pagamento.BBtnExcluir.Enabled:= true;
    FrmCadastro_Condicao_Pagamento.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Condicao_Pagamento.BBtnCancelar.Enabled:= true;
    FrmCadastro_Condicao_Pagamento.BBtnNovo.Enabled:= False;
    Util.Habilita_Campos(FrmCadastro_Condicao_Pagamento);
    FrmCadastro_Condicao_Pagamento.achei:= true;
  end
  else if (FrmLancamento_Financeiro <> NIl) and (FrmLancamento_Financeiro.ativo = true) then
  begin
    FrmLancamento_Financeiro.EdtCodigo_Condicao_Pagamento.Text:= dm.qrychama_condicaoCodigo.AsString;
    FrmLancamento_Financeiro.EdtCondicao_Pagamento.Text:= dm.qrychama_condicaoDescricao.AsString;
    FrmChama_Condicao_Pagamento.Close;
  end
  else if (FrmCompra <> nIl) and (FrmCompra.ativo = true) then
  begin
    FrmCompra.EdtCodigo_Condicao_Pagamento.Text:= dm.qrychama_condicaoCodigo.AsString;
    FrmCompra.EdtCondicao_Pagamento.Text:= dm.qrychama_condicaoDescricao.AsString;
    FrmChama_Condicao_Pagamento.Close;
  end
  else if (FrmAbertura_Caixa <> nIl) then
  begin
    //FrmAbertura_Caixa.EdtCodigo_Forma_Pagamento.Text:= dm.qrychama_condicaoCodigo.AsString;
    //FrmAbertura_Caixa.EdtForma_Pagamento.Text:= dm.qrychama_condicaoDescricao.AsString;
    FrmChama_Condicao_Pagamento.Close;
  end
  else if (FrmConsulta_Lancamentos_Financeiros <> NIl) and (FrmConsulta_Lancamentos_Financeiros.ativo = true) then
  begin
    FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text:= dm.qrychama_condicaoCodigo.AsString;
    FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text:= dm.qrychama_condicaoDescricao.AsString;
    FrmChama_Condicao_Pagamento.Close;
  end
  else if (FrmRetorno_Cotacao <> NIl) and (FrmRetorno_Cotacao.ativo = true) then
  begin
    FrmRetorno_Cotacao.EdtCodigo_Condicao_Pagamento.Text:= dm.qrychama_condicaoCodigo.AsString;
    FrmRetorno_Cotacao.EdtCondicao_Pagamento.Text:= dm.qrychama_condicaoDescricao.AsString;
    FrmChama_Condicao_Pagamento.Close;
  end
  else if (FrmSuprimento <> NIl) and (FrmSuprimento.ativo = true) then
  begin
    FrmSuprimento.EdtForma_Pagamento.Text:= dm.qrychama_condicaoDescricao.AsString;
    FrmChama_Condicao_Pagamento.Close;
  end
  else if (FrmSangria <> NIl) and (FrmSangria.ativo = true) then
  begin
    FrmSangria.EdtForma_Pagamento.Text:= dm.qrychama_condicaoDescricao.AsString;
    FrmChama_Condicao_Pagamento.Close;
  end
  else if (FrmAltera_Caixa <> NIl) and (FrmAltera_Caixa.ativo = true) then
  begin
    FrmAltera_Caixa.EdtCodigo_Forma_Pagamento.Text:= dm.qrychama_condicaoCodigo.AsString;
    FrmAltera_Caixa.EdtForma_Pagamento.Text:= dm.qrychama_condicaoDescricao.AsString;
    FrmChama_Condicao_Pagamento.Close;
  end
  else if (FrmEntrada_Produtos <> NIl) and (FrmEntrada_Produtos.ativo = true) then
  begin
    FrmEntrada_Produtos.EdtCodigo_Condicao_Pagamento.Text:= dm.qrychama_condicaoCodigo.AsString;
    FrmEntrada_Produtos.EdtCondicao_Pagamento.Text:= dm.qrychama_condicaoDescricao.AsString;
    FrmEntrada_Produtos.prazo:= dm.qrychama_condicaoPrazo.AsInteger;
    FrmEntrada_Produtos.qtde_parcelas:= dm.qrychama_condicaoParcela.AsInteger;
    FrmEntrada_Produtos.taxa_juro:= dm.qrychama_condicaoTaxa.AsFloat;
    FrmEntrada_Produtos.tipo_juro:= dm.qrychama_condicaoTipo_Juro.AsString;
    FrmChama_Condicao_Pagamento.Close;
  end
  else if (FrmPedido_Venda <> NIl) and (FrmPedido_Venda.ativo = true) then
  begin
    FrmPedido_Venda.EdtCodigo_Forma_Pagamento.Text:= dm.qrychama_condicaoCodigo.AsString;
    FrmPedido_Venda.EdtForma_Pagamento.Text:= dm.qrychama_condicaoDescricao.AsString;
    FrmPedido_Venda.tipo_pag:= dm.qrychama_condicaoTipo_Pagamento.AsString;
    FrmPedido_Venda.prazo:= dm.qrychama_condicaoPrazo.AsInteger;
    FrmPedido_Venda.qtde_parcela:= dm.qrychama_condicaoParcela.AsInteger;
    FrmPedido_Venda.taxa:= dm.qrychama_condicaoTaxa.AsFloat;
    FrmPedido_Venda.forma_pagamento_selecionado:= dm.qrychama_condicao.RecNo;
    FrmPedido_Venda.tipo_juro:= dm.qrychama_condicaoTipo_Juro.AsString;
    FrmPedido_Venda.EdtCodigo_Produto.SetFocus;

    if (FrmPedido_Venda.qryitens_venda.Active = true) then
    begin
      FrmPedido_Venda.Atualiza_Preco_Forma_Pag;
      //FrmPedido_Venda.Atualiza_Preco_Forma_Pag_Analise;
    end;
  end
  else if (FrmGerar_Documentos <> nIl) and (FrmGerar_Documentos.ativo = true) then
  begin
    FrmGerar_Documentos.EdtCodigo_Condicao_Pagamento.Text:= dm.qrychama_condicaoCodigo.AsString;
    FrmGerar_Documentos.EdtCondicao_Pagamento.Text:= dm.qrychama_condicaoDescricao.AsString;
  end
  else if (FrmNFE <> nIl) and (FrmNFE.ativo = true) then
  begin
    FrmNFE.EdtCodigo_Condicao_Pagamento.Text:= dm.qrychama_condicaoCodigo.AsString;
    FrmNFE.EdtCondicao_Pagamento.Text:= dm.qrychama_condicaoDescricao.AsString;
    FrmNFE.codigoCondicaoPagamento := dm.qrychama_condicaoCodigo.AsString;
    FrmNFE.descricaoCondicaoPagamento := dm.qrychama_condicaoDescricao.AsString;
    FrmNFE.taxaCondicaoPagamento := dm.qrychama_condicaoTaxa.AsFloat;
    FrmNFE.qtdeParcela := dm.qrychama_condicaoParcela.AsInteger;
    FrmNFE.prazoPagamento := dm.qrychama_condicaoPrazo.AsInteger;
    FrmNFE.tipoPagamento := dm.qrychama_condicaoTipo_Pagamento.AsString;
  end
  else if (FrmBaixar_Titulo <> nIl) and (FrmBaixar_Titulo.ativo = true) then
  begin
    FrmBaixar_Titulo.EdtCodigo_Condicao_Pagamento.Text:= dm.qrychama_condicaoCodigo.AsString;
    FrmBaixar_Titulo.EdtCondicao_Pagamento.Text:= dm.qrychama_condicaoDescricao.AsString;
  end;
    FrmChama_Condicao_Pagamento.Close;
end;

procedure TFrmChama_Condicao_Pagamento.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Condicao_Pagamento.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Condicao_Pagamento.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Condicao_Pagamento(EdtConsulta.Text);
end;

procedure TFrmChama_Condicao_Pagamento.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    Consulta.Chama_Condicao_Pagamento(EdtConsulta.Text);
end;

procedure TFrmChama_Condicao_Pagamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Condicao_Pagamento.Release;
end;

procedure TFrmChama_Condicao_Pagamento.FormCreate(Sender: TObject);
begin
  dm.qrychama_condicao.Close;
  dm.qrychama_condicao.Open;

  if (trazer_somente_cond_pag_ecf = 0) then
    CBImpFiscal.Checked:= True
  else
    CBImpFiscal.Checked:= false;

  Consulta.Chama_Condicao_Pagamento(EdtConsulta.Text);
  DBGrid1.DataSource:= dm.DataSource4;
end;

procedure TFrmChama_Condicao_Pagamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.

