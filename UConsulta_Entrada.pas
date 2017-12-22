unit UConsulta_Entrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente, Mask, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxSkinsdxBarPainter,
  cxPropertiesStore, dxPSCore, dxPScxCommon;

type
  TFrmConsulta_Entrada = class(TForm)
    RGConsulta_Por: TRadioGroup;
    EdtFornecedor: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    Label2: TLabel;
    EdtCodigo_Fornecedor: TEdit;
    Label1: TLabel;
    MEdtData_Inicial: TMaskEdit;
    Label3: TLabel;
    MEdtData_Final: TMaskEdit;
    qryconsulta_entrada: TADOQuery;
    ds_consulta_entrada: TDataSource;
    qryitens_entrada: TADOQuery;
    ds_consulta_itens_entrada: TDataSource;
    Label4: TLabel;
    EdtNota_Fiscal: TEdit;
    qryitens_entradaCodigo: TIntegerField;
    qryitens_entradaN_Item: TStringField;
    qryitens_entradaN_Nota_Fiscal: TStringField;
    qryitens_entradaCodigo_Produto: TIntegerField;
    qryitens_entradaUnidade: TStringField;
    qryitens_entradaST: TStringField;
    qryitens_entradaValor_Ultima_Compra: TFloatField;
    qryitens_entradaValor_Unitario: TFloatField;
    qryitens_entradaQuantidade: TFloatField;
    qryitens_entradaValor_Total: TFloatField;
    qryitens_entradaAliquota_ICMS: TStringField;
    qryitens_entradaAliquota_IPI: TStringField;
    qryitens_entradaCFOP: TStringField;
    qryitens_entradaValor_IPI: TFloatField;
    qryitens_entradaNCM: TStringField;
    qryitens_entradaQuantidade_Volume: TFloatField;
    qryitens_entradaValor_Frete_Unitario: TFloatField;
    qryitens_entradaPercentual_Lucro_Vista: TFloatField;
    qryitens_entradaValor_Vista: TFloatField;
    qryitens_entradaPercentual_Lucro_Prazo: TFloatField;
    qryitens_entradaValor_Prazo: TFloatField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    RGTipo: TRadioGroup;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    DBGrid3: TDBGrid;
    qryconsulta_entrada_sintetico: TADOQuery;
    DataSource1: TDataSource;
    qryconsulta_entrada_sinteticoN_Nota_Fiscal: TStringField;
    qryconsulta_entrada_sinteticoData_Emissao: TDateTimeField;
    qryconsulta_entrada_sinteticoData_Entrada: TDateTimeField;
    qryconsulta_entrada_sinteticoTotal_Produtos: TFloatField;
    qryconsulta_entrada_sinteticoTotal_Nota: TFloatField;
    qryconsulta_entrada_sinteticoNome_Fantasia: TStringField;
    TabSheet3: TTabSheet;
    Panel4: TPanel;
    DBGrid4: TDBGrid;
    Panel5: TPanel;
    DBGrid5: TDBGrid;
    qryconsulta_entrada_sintetico_1: TADOQuery;
    DataSource2: TDataSource;
    qryconsulta_entrada_sintetico_1N_Nota_Fiscal: TStringField;
    qryconsulta_entrada_sintetico_1Data_Emissao: TDateTimeField;
    qryconsulta_entrada_sintetico_1Data_Entrada: TDateTimeField;
    qryconsulta_entrada_sintetico_1Nome_Fantasia: TStringField;
    qryconsulta_entrada_sintetico_1Total_Produtos: TFloatField;
    qryconsulta_entrada_sintetico_1Total_Nota: TFloatField;
    qryitens_entrada_sintetico: TADOQuery;
    DataSource3: TDataSource;
    qryitens_entrada_sinteticoN_Item: TStringField;
    qryitens_entrada_sinteticoUnidade: TStringField;
    qryitens_entrada_sinteticoValor_Unitario: TFloatField;
    qryitens_entrada_sinteticoQuantidade: TFloatField;
    qryitens_entrada_sinteticoValor_Total: TFloatField;
    qryitens_entrada_sinteticoCodigo_Venda: TStringField;
    qryitens_entrada_sinteticoDescricao: TStringField;
    qryitens_entradaCusto_Unitario: TFloatField;
    LblPerc: TLabel;
    EdtPerc: TEdit;
    RGPerc: TRadioGroup;
    BBtnAtualiza_Produto: TToolButton;
    qryitens_entradaBC_ICMS: TFloatField;
    qryitens_entradaIVA: TFloatField;
    qryitens_entradaValor_ICMS_Unitario: TFloatField;
    qryconsulta_entrada_sintetico_1Custo_Total: TFloatField;
    qryconsulta_entrada_sinteticoCusto_Total: TFloatField;
    qryitens_entradaCodigo_Produto_Fornecedor: TStringField;
    qryitens_entradaDescricao_Produto: TStringField;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1Column1: TcxGridColumn;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBTableView1Codigo: TcxGridDBColumn;
    cxGrid1DBTableView1N_Nota_Fiscal: TcxGridDBColumn;
    cxGrid1DBTableView1Modelo: TcxGridDBColumn;
    cxGrid1DBTableView1Serie: TcxGridDBColumn;
    cxGrid1DBTableView1Data_Emissao: TcxGridDBColumn;
    cxGrid1DBTableView1Hora_Emissao: TcxGridDBColumn;
    cxGrid1DBTableView1Data_Entrada: TcxGridDBColumn;
    cxGrid1DBTableView1Hora_Entrada: TcxGridDBColumn;
    cxGrid1DBTableView1Quantidade_Itens: TcxGridDBColumn;
    cxGrid1DBTableView1Observacao: TcxGridDBColumn;
    cxGrid1DBTableView1Total_Produtos: TcxGridDBColumn;
    cxGrid1DBTableView1Total_Nota: TcxGridDBColumn;
    cxGrid1DBTableView1Nome_Fantasia: TcxGridDBColumn;
    cxGrid1DBTableView1CFOP: TcxGridDBColumn;
    cxGrid1DBTableView1Custo_Total: TcxGridDBColumn;
    cxGrid1DBTableView2Codigo: TcxGridDBColumn;
    cxGrid1DBTableView2N_Item: TcxGridDBColumn;
    cxGrid1DBTableView2N_Nota_Fiscal: TcxGridDBColumn;
    cxGrid1DBTableView2Codigo_Produto: TcxGridDBColumn;
    cxGrid1DBTableView2Unidade: TcxGridDBColumn;
    cxGrid1DBTableView2ST: TcxGridDBColumn;
    cxGrid1DBTableView2Valor_Ultima_Compra: TcxGridDBColumn;
    cxGrid1DBTableView2Valor_Unitario: TcxGridDBColumn;
    cxGrid1DBTableView2Quantidade: TcxGridDBColumn;
    cxGrid1DBTableView2Valor_Total: TcxGridDBColumn;
    cxGrid1DBTableView2Aliquota_ICMS: TcxGridDBColumn;
    cxGrid1DBTableView2Aliquota_IPI: TcxGridDBColumn;
    cxGrid1DBTableView2CFOP: TcxGridDBColumn;
    cxGrid1DBTableView2Valor_IPI: TcxGridDBColumn;
    cxGrid1DBTableView2NCM: TcxGridDBColumn;
    cxGrid1DBTableView2Quantidade_Volume: TcxGridDBColumn;
    cxGrid1DBTableView2Valor_Frete_Unitario: TcxGridDBColumn;
    cxGrid1DBTableView2Percentual_Lucro_Vista: TcxGridDBColumn;
    cxGrid1DBTableView2Valor_Vista: TcxGridDBColumn;
    cxGrid1DBTableView2Percentual_Lucro_Prazo: TcxGridDBColumn;
    cxGrid1DBTableView2Valor_Prazo: TcxGridDBColumn;
    cxGrid1DBTableView2Custo_Unitario: TcxGridDBColumn;
    cxGrid1DBTableView2BC_ICMS: TcxGridDBColumn;
    cxGrid1DBTableView2IVA: TcxGridDBColumn;
    cxGrid1DBTableView2Valor_ICMS_Unitario: TcxGridDBColumn;
    cxGrid1DBTableView2Codigo_Produto_Fornecedor: TcxGridDBColumn;
    cxGrid1DBTableView2Descricao_Produto: TcxGridDBColumn;
    cxGrid1DBTableView2Codigo_Venda: TcxGridDBColumn;
    cxGrid1DBTableView2Descricao: TcxGridDBColumn;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    cxPropertiesStore1: TcxPropertiesStore;
    BBtnExportar_XLS: TToolButton;
    qryitens_entradaCodigo_Registro: TAutoIncField;
    qryconsulta_entradaCodigo: TIntegerField;
    qryconsulta_entradaN_Nota_Fiscal: TStringField;
    qryconsulta_entradaModelo: TStringField;
    qryconsulta_entradaSerie: TStringField;
    qryconsulta_entradaData_Emissao: TDateTimeField;
    qryconsulta_entradaHora_Emissao: TStringField;
    qryconsulta_entradaData_Entrada: TDateTimeField;
    qryconsulta_entradaHora_Entrada: TStringField;
    qryconsulta_entradaTipo_Frete: TStringField;
    qryconsulta_entradaTipo_Pagamento: TStringField;
    qryconsulta_entradaCodigo_Fornecedor: TIntegerField;
    qryconsulta_entradaCodigo_CFOP: TIntegerField;
    qryconsulta_entradaCodigo_Empresa: TIntegerField;
    qryconsulta_entradaQuantidade_Itens: TIntegerField;
    qryconsulta_entradaObservacao: TStringField;
    qryconsulta_entradaStatus: TStringField;
    qryconsulta_entradaCodigo_Funcionario: TIntegerField;
    qryconsulta_entradaChave_NFe_Entrada: TStringField;
    qryconsulta_entradaCaixa_ECF: TIntegerField;
    qryconsulta_entradaFinalizada: TIntegerField;
    qryconsulta_entradaCodigo_1: TIntegerField;
    qryconsulta_entradaN_Nota_Fiscal_1: TStringField;
    qryconsulta_entradaTotal_Produtos: TFloatField;
    qryconsulta_entradaBase_ICMS: TFloatField;
    qryconsulta_entradaValor_ICMS: TFloatField;
    qryconsulta_entradaIsento_ICMS: TFloatField;
    qryconsulta_entradaOutros_ICMS: TFloatField;
    qryconsulta_entradaBase_ICMS_Subs: TFloatField;
    qryconsulta_entradaValor_ICMS_Subs: TFloatField;
    qryconsulta_entradaAliquota: TFloatField;
    qryconsulta_entradaValor_Frete: TFloatField;
    qryconsulta_entradaValor_Seguro: TFloatField;
    qryconsulta_entradaOutras_Despesas: TFloatField;
    qryconsulta_entradaTotal_IPI: TFloatField;
    qryconsulta_entradaIsento_IPI: TFloatField;
    qryconsulta_entradaOutros_IPI: TFloatField;
    qryconsulta_entradaDesconto: TFloatField;
    qryconsulta_entradaTotal_Nota: TFloatField;
    qryconsulta_entradaCusto_Total: TFloatField;
    qryconsulta_entradaNome_Fantasia: TStringField;
    qryconsulta_entradaCFOP: TStringField;
    qryconsulta_entradaDescricao: TStringField;
    qryitens_entradaQuantidade_Restante: TFloatField;
    qryitens_entradaValor_Vista_Ultimo: TFloatField;
    qryitens_entradaValor_Prazo_Ultimo: TFloatField;
    qryitens_entradaBC_ICMS_ST: TFloatField;
    qryitens_entradaValor_ICMS_ST: TFloatField;
    qryitens_entradaChecado: TStringField;
    qryitens_entradaValor_Ultima_Compra_Unitario: TFloatField;
    qryitens_entradaQtde_Estoque_Atual: TFloatField;
    qryitens_entradaFicha_Estoque_Codigo: TIntegerField;
    qryitens_entradaData_Validade: TDateTimeField;
    qryitens_entradaCodigo_Venda: TStringField;
    qryitens_entradaDescricao: TStringField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure EdtCodigo_FornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_FornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BBtnAtualiza_ProdutoClick(Sender: TObject);
    procedure BBtnExportar_XLSClick(Sender: TObject);
  private
    custo: double;
    procedure Atualiza_Custo;
    procedure Altera_Custo;
    procedure Altera_Preco_Tabela;

    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmConsulta_Entrada: TFrmConsulta_Entrada;
  Utili: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Fornecedor, URel_Consulta_Entrada,
  URel_Consulta_Entrada_Sintetico2, URel_Consulta_Entrada_Sintetico1,
  UDeclaracao, Util.Mensagens, Util.TLog, cxGridExportLink;

{$R *.dfm}

procedure TFrmConsulta_Entrada.BBtnAtualiza_ProdutoClick(Sender: TObject);
begin
  Atualiza_Custo;
end;

procedure TFrmConsulta_Entrada.BBtnExportar_XLSClick(Sender: TObject);
var
  NomeArquivo, DataAtual: AnsiString;
begin
  try
    DataAtual:= FormatDateTime('YYYYMMDDHHMM', now);
    NomeArquivo:= ExtractFilePath(Application.ExeName)+ 'Relatórios\XLS\EntradasAnalitico'+DataAtual+'.xls';
    ExportGridToExcel(NomeArquivo, cxGrid1, false);
    TMensagens.MensagemInformacao('Relatório exportado para: '+NomeArquivo);
  except on E:Exception do
  begin
    TMensagens.MensagemErro('Erro ao exportar relatório: '+e.Message);
    TLog.Error('Erro ao exportar relatório: '+e.Message);
  end;
  end;
end;

procedure TFrmConsulta_Entrada.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConsulta_Entrada.BBtnFiltrarClick(Sender: TObject);
var
  qAux: TADOQuery;
begin
  if (RGTipo.ItemIndex = 0) then
  begin
    PageControl1.TabIndex:= 0;
    Consulta.Consulta_Entrada;
    Consulta.Consulta_Itens_Entrada;
    BBtnAtualiza_Produto.Enabled:= true;
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir.Enabled:= true;
    BBtnExportar_XLS.Enabled:= true;
  end
  else if (RGTipo.ItemIndex = 2) then
  begin
    PageControl1.TabIndex:= 2;
    Consulta.Consulta_Entrada_Sintetico2;
    //Consulta.Consulta_Itens_Entrada;
    BBtnAtualiza_Produto.Enabled:= false;
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir.Enabled:= true;
    BBtnExportar_XLS.Enabled:= true;
  end
  else if (RGTipo.ItemIndex = 1) then
  begin
    PageControl1.TabIndex:= 1;
    Consulta.Consulta_Entrada_Sintetico1;
    //Consulta.Consulta_Itens_Entrada;
    BBtnAtualiza_Produto.Enabled:= false;
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir.Enabled:= true;
    BBtnExportar_XLS.Enabled:= true;
  end;


end;

procedure TFrmConsulta_Entrada.BBtnImprimirClick(Sender: TObject);
begin
  if (RGTipo.ItemIndex = 0) then
  begin
    dxComponentPrinter1.Preview(True, nil);
    {FrmRel_Consulta_Entrada:= TFrmRel_Consulta_Entrada.create(self);
    FrmRel_Consulta_Entrada.Release;
    FrmRel_Consulta_Entrada:= Nil; }
  end
  else if (RGTipo.ItemIndex = 2) then
  begin
    FrmRel_Consulta_Entrada_Sintetico2:= TFrmRel_Consulta_Entrada_Sintetico2.create(self);
    FrmRel_Consulta_Entrada_Sintetico2.Release;
    FrmRel_Consulta_Entrada_Sintetico2:= Nil;
  end
  else if (RGTipo.ItemIndex = 1) then
  begin
    FrmRel_Consulta_Entrada_Sintetico1:= TFrmRel_Consulta_Entrada_Sintetico1.create(self);
    FrmRel_Consulta_Entrada_Sintetico1.Release;
    FrmRel_Consulta_Entrada_Sintetico1:= Nil;
  end;
end;

procedure TFrmConsulta_Entrada.Altera_Preco_Tabela;
var
  qAux, qAux2: TADOQuery;
  perc, valor1_vista, valor1_prazo, valor2, calculo_perc: double;
begin
  qAux := TADOQuery.Create(nil);
  qAux2 := TADOQuery.Create(nil);
  try
    with qAux2, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('select TP.Tipo_Calculo, ITP.* from Tabela_Preco TP');
      add('left join Itens_Tabela_Preco ITP on (TP.Codigo = ITP.Codigo)');
      add('where TP.Codigo = :Codigo and ITP.Codigo_Produto = :Codigo_Produto');
      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_padrao;
      Parameters.ParamByName('Codigo_Produto').Value := qryitens_entradaCodigo_Produto.AsInteger;
      open;
    end;
    valor1_vista:= custo;
    valor1_prazo:= custo;

    if (qAux2.FieldByName('Tipo_Calculo').AsString = 'MARGEM BRUTA') then
    begin
      perc:= qAux2.FieldByName('Percentual_Lucro_Vista').AsFloat / 100;
      valor2:= valor1_vista * perc;
      valor1_vista:= valor1_vista + valor2;
      valor1_vista:= Calcula_Valor(FloatToStr(valor1_vista));
    end
    else
    begin
      calculo_perc:= (100 - qAux2.FieldByName('Percentual_Lucro_Vista').AsFloat) / 100;
      valor1_vista:= valor1_vista / calculo_perc;
      valor1_vista:= Calcula_Valor(FloatToStr(valor1_vista));
    end;

    if (qAux2.FieldByName('Tipo_Calculo').AsString = 'MARGEM BRUTA') then
    begin
      perc:= qAux2.FieldByName('Percentual_Lucro_Prazo').AsFloat / 100;
      valor2:= valor1_prazo * perc;
      valor1_prazo:= valor1_prazo + valor2;
      valor1_prazo:= Calcula_Valor(FloatToStr(valor1_prazo));
    end
    else
    begin
      calculo_perc:= (100 - qAux2.FieldByName('Percentual_Lucro_Prazo').AsFloat) / 100;
      valor1_prazo:= valor1_prazo / calculo_perc;
      valor1_prazo:= Calcula_Valor(FloatToStr(valor1_prazo));
    end;

    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('Update Itens_Tabela_Preco set Preco_Vista = :Preco_Vista, Preco_Prazo = :Preco_Prazo');
      add('where Codigo = :Codigo and Codigo_Produto = :Codigo_Produto');

      Parameters.ParamByName('Codigo').Value := qAux2.FieldByName('Codigo').AsInteger;
      Parameters.ParamByName('Codigo_Produto').Value := qryitens_entradaCodigo_Produto.AsInteger;
      Parameters.ParamByName('Preco_Vista').Value := valor1_vista;
      Parameters.ParamByName('Preco_Prazo').Value := valor1_prazo;
      ExecSQL;
    end;

  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmConsulta_Entrada.Altera_Custo;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('update Produto set Valor_Compra = :Valor_Compra');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Valor_Compra').Value := custo;
      Parameters.ParamByName('Codigo').Value := qryitens_entradaCodigo_Produto.AsInteger;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmConsulta_Entrada.Atualiza_Custo;
var
  qAux: TADOQuery;
  caux: double;
begin
  {if (DBGrid1.SelectedRows.Count = 0) then
  begin
    Item_Selecionado_DBGrid;
    abort;
  end;}

  if (EdtPerc.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtPerc.SetFocus;
    abort;
  end;

  if (Confirma_Processo) then
  begin
    qryitens_entrada.First;
    try
      while not qryitens_entrada.Eof do
      begin
        caux:= 0;
        custo:= 0;
        caux:= qryitens_entradaCusto_Unitario.AsFloat * ( StrToFloat(EdtPerc.Text) / 100);

        if (RGPerc.ItemIndex = 0) then
          custo:= qryitens_entradaCusto_Unitario.AsFloat + caux
        else
          custo:= qryitens_entradaCusto_Unitario.AsFloat - caux;

        Altera_Preco_Tabela;
        Altera_Custo;
        qryitens_entrada.Next;
      end;
    finally
      Processo_Concluido;
    end;
  end;
end;

procedure TFrmConsulta_Entrada.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_entrada.close;
  qryitens_entrada.Close;

  qryconsulta_entrada_sintetico_1.Close;
  qryconsulta_entrada_sintetico.Close;
  qryitens_entrada_sintetico.Close;
  PageControl1.TabIndex:= 0;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  BBtnAtualiza_Produto.Enabled:= false;
  BBtnExportar_XLS.Enabled:= false;
end;

procedure TFrmConsulta_Entrada.DBGrid1CellClick(Column: TColumn);
begin
  Consulta.Consulta_Itens_Entrada;
end;

procedure TFrmConsulta_Entrada.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Entrada.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Entrada.DBGrid4CellClick(Column: TColumn);
begin
  Consulta.Consulta_Itens_Entrada_Sintetico_1;
end;

procedure TFrmConsulta_Entrada.DBGrid4DrawColumnCell(Sender: TObject;
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

procedure TFrmConsulta_Entrada.EdtCodigo_FornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Fornecedor, FrmChama_Fornecedor);
      FrmChama_Fornecedor.ShowModal;
      FrmChama_Fornecedor.Free;
    end;
end;

procedure TFrmConsulta_Entrada.EdtCodigo_FornecedorKeyPress(Sender: TObject;
  var Key: Char);
begin
  Utili.Somente_Apaga(key);
end;

procedure TFrmConsulta_Entrada.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConsulta_Entrada.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmConsulta_Entrada.Free;
  FrmConsulta_Entrada:= NIl;
end;

procedure TFrmConsulta_Entrada.FormCreate(Sender: TObject);
begin
  PageControl1.TabIndex:= 0;
  qryconsulta_entrada.close;
  qryitens_entrada.Close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  Utili.Inicia_Data(MEdtData_Inicial, MEdtData_Final);
end;

procedure TFrmConsulta_Entrada.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConsulta_Entrada.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
