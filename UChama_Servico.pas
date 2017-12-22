unit UChama_Servico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, DBClient, Provider;

type
  TFrmChama_Servico = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    ImgImagens: TImageList;
    LblMarca: TLabel;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_servico: TADOQuery;
    CDSChama_Servico: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    qrychama_servicoCodigo: TAutoIncField;
    qrychama_servicoTipo: TIntegerField;
    qrychama_servicoCodigo_Empresa: TIntegerField;
    qrychama_servicoStatus: TStringField;
    qrychama_servicoGera_Comissao: TStringField;
    qrychama_servicoAceita_Devolucao: TStringField;
    qrychama_servicoArred_Trunc: TStringField;
    qrychama_servicoCodigo_Original: TStringField;
    qrychama_servicoCodigo_Venda: TStringField;
    qrychama_servicoDescricao: TStringField;
    qrychama_servicoCodigo_Barra: TStringField;
    qrychama_servicoCodigo_Fornecedor: TIntegerField;
    qrychama_servicoCodigo_Fabricante: TIntegerField;
    qrychama_servicoCodigo_Marca: TIntegerField;
    qrychama_servicoCodigo_Unidade_Medida: TIntegerField;
    qrychama_servicoCodigo_Unidade_Volume: TIntegerField;
    qrychama_servicoCodigo_Grupo: TIntegerField;
    qrychama_servicoCodigo_Grupo_Tributacao: TIntegerField;
    qrychama_servicoCodigo_Grupo_Tributacao_IPI: TIntegerField;
    qrychama_servicoCodigo_Grupo_Tributacao_PIS: TIntegerField;
    qrychama_servicoCodigo_Grupo_Tributacao_COFINS: TIntegerField;
    qrychama_servicoCodigo_Grupo_Tributacao_ISSQN: TIntegerField;
    qrychama_servicoCodigo_Local: TIntegerField;
    qrychama_servicoData_Fabricacao: TDateTimeField;
    qrychama_servicoData_Validade: TDateTimeField;
    qrychama_servicoUltima_Compra: TDateTimeField;
    qrychama_servicoUltima_Venda: TDateTimeField;
    qrychama_servicoValor_Compra: TFloatField;
    qrychama_servicoValor_Medio: TFloatField;
    qrychama_servicoValor_Ultima_Compra: TFloatField;
    qrychama_servicoTipo_Tributacao: TStringField;
    qrychama_servicoEstoque_Maximo: TFloatField;
    qrychama_servicoEstoque_Minimo: TFloatField;
    qrychama_servicoEstoque: TFloatField;
    qrychama_servicoVolume: TFloatField;
    qrychama_servicoVolume_Total: TFloatField;
    qrychama_servicoEm_Estoque_Maximo: TStringField;
    qrychama_servicoEm_Estoque_Minimo: TStringField;
    qrychama_servicoData_Cadastro: TDateTimeField;
    qrychama_servicoData_Atualizacao_Estoque: TDateTimeField;
    qrychama_servicoStatus_Estoque_Data: TStringField;
    qrychama_servicoAliquota: TStringField;
    qrychama_servicoTributacao: TStringField;
    qrychama_servicoSigla: TStringField;
    qrychama_servicoPreco_Vista: TFloatField;
    qrychama_servicoPercentual_Desconto_Vista: TFloatField;
    qrychama_servicoPercentual_Desconto_Prazo: TFloatField;
    CDSChama_ServicoCodigo: TAutoIncField;
    CDSChama_ServicoTipo: TIntegerField;
    CDSChama_ServicoCodigo_Empresa: TIntegerField;
    CDSChama_ServicoStatus: TStringField;
    CDSChama_ServicoGera_Comissao: TStringField;
    CDSChama_ServicoAceita_Devolucao: TStringField;
    CDSChama_ServicoArred_Trunc: TStringField;
    CDSChama_ServicoCodigo_Original: TStringField;
    CDSChama_ServicoCodigo_Venda: TStringField;
    CDSChama_ServicoDescricao: TStringField;
    CDSChama_ServicoCodigo_Barra: TStringField;
    CDSChama_ServicoCodigo_Fornecedor: TIntegerField;
    CDSChama_ServicoCodigo_Fabricante: TIntegerField;
    CDSChama_ServicoCodigo_Marca: TIntegerField;
    CDSChama_ServicoCodigo_Unidade_Medida: TIntegerField;
    CDSChama_ServicoCodigo_Unidade_Volume: TIntegerField;
    CDSChama_ServicoCodigo_Grupo: TIntegerField;
    CDSChama_ServicoCodigo_Grupo_Tributacao: TIntegerField;
    CDSChama_ServicoCodigo_Grupo_Tributacao_IPI: TIntegerField;
    CDSChama_ServicoCodigo_Grupo_Tributacao_PIS: TIntegerField;
    CDSChama_ServicoCodigo_Grupo_Tributacao_COFINS: TIntegerField;
    CDSChama_ServicoCodigo_Grupo_Tributacao_ISSQN: TIntegerField;
    CDSChama_ServicoCodigo_Local: TIntegerField;
    CDSChama_ServicoData_Fabricacao: TDateTimeField;
    CDSChama_ServicoData_Validade: TDateTimeField;
    CDSChama_ServicoUltima_Compra: TDateTimeField;
    CDSChama_ServicoUltima_Venda: TDateTimeField;
    CDSChama_ServicoValor_Compra: TFloatField;
    CDSChama_ServicoValor_Medio: TFloatField;
    CDSChama_ServicoValor_Ultima_Compra: TFloatField;
    CDSChama_ServicoTipo_Tributacao: TStringField;
    CDSChama_ServicoEstoque_Maximo: TFloatField;
    CDSChama_ServicoEstoque_Minimo: TFloatField;
    CDSChama_ServicoEstoque: TFloatField;
    CDSChama_ServicoVolume: TFloatField;
    CDSChama_ServicoVolume_Total: TFloatField;
    CDSChama_ServicoEm_Estoque_Maximo: TStringField;
    CDSChama_ServicoEm_Estoque_Minimo: TStringField;
    CDSChama_ServicoData_Cadastro: TDateTimeField;
    CDSChama_ServicoData_Atualizacao_Estoque: TDateTimeField;
    CDSChama_ServicoStatus_Estoque_Data: TStringField;
    CDSChama_ServicoAliquota: TStringField;
    CDSChama_ServicoTributacao: TStringField;
    CDSChama_ServicoSigla: TStringField;
    CDSChama_ServicoPreco_Vista: TFloatField;
    CDSChama_ServicoPercentual_Desconto_Vista: TFloatField;
    CDSChama_ServicoPercentual_Desconto_Prazo: TFloatField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Servico: TFrmChama_Servico;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UPedido_Venda, UDeclaracao, UOS;

{$R *.dfm}

procedure TFrmChama_Servico.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Servico.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Servico;
end;

procedure TFrmChama_Servico.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmOS <> Nil) and (FrmOS.ativo = true) then
  begin
    FrmOS.LblProduto.Caption:= CDSChama_ServicoCodigo.AsString;
    FrmOS.LblTipo_Servico.Caption:= CDSChama_ServicoTipo.AsString;
    FrmOS.EdtCodigo_Servico.Text:= CDSChama_ServicoCodigo_Venda.AsString;
    FrmOS.EdtServico.Text:= CDSChama_ServicoDescricao.AsString;
    FrmOS.EdtValor_Servico.Text:= CDSChama_ServicoPreco_Vista.AsString;
    FrmOS.EdtUnidade_Servico.Text:= CDSChama_ServicoSigla.AsString;

    Pega_ISS(CDSChama_ServicoCodigo_Grupo_Tributacao_ISSQN.AsInteger);

    if Length(qAux_ISS.FieldByName('Aliquota').AsString) = 1 then
    begin
      FrmOS.LblICMS.Caption:= '0'+qAux_ISS.FieldByName('Aliquota').AsString+'00';  //0700
      FrmOS.EdtST_Servico.Text:= qAux_ISS.FieldByName('Aliquota').AsString;
    end
    else if Length(qAux_ISS.FieldByName('Aliquota').AsString) = 2 then
    begin
      FrmOS.LblICMS.Caption:= qAux_ISS.FieldByName('Aliquota').AsString+'00';  //1700
      FrmOS.EdtST_Servico.Text:= qAux_ISS.FieldByName('Aliquota').AsString;
    end
    else if Length(qAux_ISS.FieldByName('Aliquota').AsString) = 3 then
    begin
      FrmOS.LblICMS.Caption:= '0'+qAux_ISS.FieldByName('Aliquota').AsString+'0';  //0840
      FrmOS.EdtST_Servico.Text:= qAux_ISS.FieldByName('Aliquota').AsString;
    end
    else if Length(qAux_ISS.FieldByName('Aliquota').AsString) = 4 then
    begin
      FrmOS.LblICMS.Caption:= qAux_ISS.FieldByName('Aliquota').AsString+'0';  //1320
      FrmOS.EdtST_Servico.Text:= qAux_ISS.FieldByName('Aliquota').AsString;
    end;

    if (qAux_ISS.FieldByName('Base_Reduzida').AsString = 'SIM') then
      FrmOS.LblBase_Reduzida.Caption:= qAux_ISS.FieldByName('Percentual_BC_Reduzida').AsString
    else
      FrmOS.LblBase_Reduzida.Caption:= '';

    if (qAux_ISS.FieldByName('Base_Acrescida').AsString = 'SIM') then
      FrmOS.LblBase_Acrescida.Caption:= qAux_ISS.FieldByName('Percentual_BC_Acrescida').AsString
    else
      FrmOS.LblBase_Acrescida.Caption:= '';

    {if Length(qAux_ISS.FieldByName('Aliquota').AsString) = 1 then
    begin
      FrmOS.LblICMS.Caption:= '0'+qAux_ISS.FieldByName('Aliquota').AsString+'00';
      FrmOS.EdtST_Servico.Text:= qAux_ISS.FieldByName('Aliquota').AsString;
    end
    else
    begin
      FrmOS.LblICMS.Caption:= qAux_ISS.FieldByName('Aliquota').AsString+'00';
      FrmOS.EdtST_Servico.Text:= qAux_ISS.FieldByName('Aliquota').AsString;
    end;}

    FrmOS.LblCST.Caption:= '00';//qAux_ISS.FieldByName('Codigo_Situacao').AsString;

    FrmOS.cod_produto:= CDSChama_ServicoCodigo.AsInteger; //CDSChama_ProdutoCodigo.AsInteger;
    FrmOS.cod_pro:= CDSChama_ServicoCodigo_Venda.AsString; //CDSChama_ProdutoCodigo_Venda.AsString;
    FrmOS.descri:= CDSChama_ServicoDescricao.AsString; //CDSChama_ProdutoDescricao.AsString;
    FrmOS.unid:= CDSChama_ServicoSigla.AsString; //CDSChama_ProdutoSigla.AsString;
    FrmOS.IAT:= CDSChama_ServicoArred_Trunc.AsString;
    FrmOS.IPPT:= 'T';
    FrmOS.var_uni:= CDSChama_ServicoPreco_Vista.AsFloat;
    FrmChama_Servico.Close;
  end;
end;

procedure TFrmChama_Servico.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Servico.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Servico.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Servico;
end;

procedure TFrmChama_Servico.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Servico.Release;
end;

procedure TFrmChama_Servico.FormCreate(Sender: TObject);
begin
  Inicializa_Dados_Principais_Movimentacao(4, qrychama_servico);
end;

procedure TFrmChama_Servico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
