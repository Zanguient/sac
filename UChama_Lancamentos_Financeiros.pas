unit UChama_Lancamentos_Financeiros;

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
  TFrmChama_Lancamentos_Financeiros = class(TForm)
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ImgImagens: TImageList;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_lancamento: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    RGTipo_Conta: TRadioGroup;
    BBtnLimpar: TToolButton;
    Label7: TLabel;
    Label8: TLabel;
    MEdtData_Final: TMaskEdit;
    MEdtData_Inicial: TMaskEdit;
    qrychama_lancamentoNome: TStringField;
    qrychama_lancamentoN_Documento: TIntegerField;
    qrychama_lancamentoData_Vencimento: TDateTimeField;
    qrychama_lancamentoParcela: TIntegerField;
    qrychama_lancamentoValor: TFloatField;
    qrychama_lancamentoData_Lancamento: TDateTimeField;
    BBtnImprimir_Agrupado: TToolButton;
    qrychama_lancamentoCodigo_Plano: TIntegerField;
    RGStatus: TRadioGroup;
    BBtnEstornar: TToolButton;
    SPAtualiza_Movimento_Caixa: TADOStoredProc;
    SPAtualiza_Status_Conta: TADOStoredProc;
    CBBaixa: TCheckBox;
    Label2: TLabel;
    EdtCodigo_Cli_For: TEdit;
    BBtnBaixar_Conta: TToolButton;
    qrychama_lancamentoCodigo: TIntegerField;
    qrychama_lancamentoCod: TAutoIncField;
    qrychama_lancamentoCodigo_Conta: TIntegerField;
    qrychama_lancamentoCodigo_Cheque: TIntegerField;
    qrychama_lancamentoTipo: TStringField;
    qrychama_lancamentoCOO: TStringField;
    qrychama_lancamentoHistorico: TStringField;
    qrychama_lancamentoValor_Pagar: TFloatField;
    qrychama_lancamentoDias_Venc: TIntegerField;
    qrychama_lancamentoCond_Pag: TStringField;
    qrychama_lancamentoCodigo_Forma_Pagamento: TIntegerField;
    qrychama_lancamentoValor_Restante: TFloatField;
    qrychama_lancamentoDesconto: TFloatField;
    qrychama_lancamentoAcrescimo: TFloatField;
    qrychama_lancamentoValor_Pago: TFloatField;
    qrychama_lancamentoTipo_Pagamento: TStringField;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1Column1: TcxGridColumn;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2Codigo: TcxGridDBColumn;
    cxGrid1DBTableView2N_Item: TcxGridDBColumn;
    cxGrid1DBTableView2N_Nota_Fiscal: TcxGridDBColumn;
    cxGrid1DBTableView2Codigo_Produto: TcxGridDBColumn;
    cxGrid1DBTableView2Codigo_Produto_Fornecedor: TcxGridDBColumn;
    cxGrid1DBTableView2Descricao_Produto: TcxGridDBColumn;
    cxGrid1DBTableView2Codigo_Venda: TcxGridDBColumn;
    cxGrid1DBTableView2Descricao: TcxGridDBColumn;
    cxGrid1DBTableView2Unidade: TcxGridDBColumn;
    cxGrid1DBTableView2NCM: TcxGridDBColumn;
    cxGrid1DBTableView2CFOP: TcxGridDBColumn;
    cxGrid1DBTableView2ST: TcxGridDBColumn;
    cxGrid1DBTableView2Valor_Ultima_Compra: TcxGridDBColumn;
    cxGrid1DBTableView2Valor_Unitario: TcxGridDBColumn;
    cxGrid1DBTableView2Quantidade: TcxGridDBColumn;
    cxGrid1DBTableView2Valor_Total: TcxGridDBColumn;
    cxGrid1DBTableView2IVA: TcxGridDBColumn;
    cxGrid1DBTableView2BC_ICMS: TcxGridDBColumn;
    cxGrid1DBTableView2Valor_ICMS_Unitario: TcxGridDBColumn;
    cxGrid1DBTableView2Aliquota_ICMS: TcxGridDBColumn;
    cxGrid1DBTableView2Aliquota_IPI: TcxGridDBColumn;
    cxGrid1DBTableView2Valor_IPI: TcxGridDBColumn;
    cxGrid1DBTableView2Quantidade_Volume: TcxGridDBColumn;
    cxGrid1DBTableView2Valor_Frete_Unitario: TcxGridDBColumn;
    cxGrid1DBTableView2Custo_Unitario: TcxGridDBColumn;
    cxGrid1DBTableView2Percentual_Lucro_Vista: TcxGridDBColumn;
    cxGrid1DBTableView2Valor_Vista: TcxGridDBColumn;
    cxGrid1DBTableView2Percentual_Lucro_Prazo: TcxGridDBColumn;
    cxGrid1DBTableView2Valor_Prazo: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1Nome: TcxGridDBColumn;
    cxGrid1DBTableView1N_Documento: TcxGridDBColumn;
    cxGrid1DBTableView1Data_Lancamento: TcxGridDBColumn;
    cxGrid1DBTableView1Data_Vencimento: TcxGridDBColumn;
    cxGrid1DBTableView1Parcela: TcxGridDBColumn;
    cxGrid1DBTableView1Valor: TcxGridDBColumn;
    cxGrid1DBTableView1Codigo: TcxGridDBColumn;
    cxGrid1DBTableView1COO: TcxGridDBColumn;
    cxGrid1DBTableView1Historico: TcxGridDBColumn;
    cxGrid1DBTableView1Valor_Pagar: TcxGridDBColumn;
    cxGrid1DBTableView1Dias_Venc: TcxGridDBColumn;
    cxGrid1DBTableView1Valor_Restante: TcxGridDBColumn;
    cxGrid1DBTableView1Valor_Pago: TcxGridDBColumn;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    cxPropertiesStore1: TcxPropertiesStore;
    BBtnOcorrencia_Cobranca: TToolButton;
    qrychama_lancamentoData_Pagamento: TDateTimeField;
    cxGrid1DBTableView1Data_Pagamento: TcxGridDBColumn;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnEstornarClick(Sender: TObject);
    procedure BBtnImprimir_SinteticoClick(Sender: TObject);
    procedure BBtnImprimir_AgrupadoClick(Sender: TObject);
    procedure EdtCodigo_Cli_ForKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CBBaixaClick(Sender: TObject);
    procedure RGConsulta_PorClick(Sender: TObject);
    procedure BBtnBaixar_ContaClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BBtnImprimir_Sintetico2Click(Sender: TObject);
    procedure BBtnOcorrencia_CobrancaClick(Sender: TObject);
    procedure qrychama_lancamentoData_PagamentoGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
  public
    ativo: boolean;
    imp, imp_agru: boolean;
    { Public declarations }
  end;

var
  FrmChama_Lancamentos_Financeiros: TFrmChama_Lancamentos_Financeiros;
  Utili: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UChama_Cliente, UChama_Fornecedor, UBaixar_Titulo,
  UEscolha_Impressao, URel_Lancamento_Contas, URel_Lancamento_Contas_Agrupado,
  UDeclaracao, UEscolha_Parcela_Estorno, URel_Lancamento_Contas_Simples_2,
  Util.Mensagens, UCadastro_Ocorrencia_Cobranca;

{$R *.dfm}

procedure TFrmChama_Lancamentos_Financeiros.BBtnBaixar_ContaClick(
  Sender: TObject);
var
  qAux: TADOQuery;
  valor: double;
  qtde: integer;
begin
  if (cxGrid1DBTableView1.Controller.SelectedRowCount = 0) then
  begin
    Application.MessageBox('Por favor, selecione ao menos uma conta a baixar', 'Item não selecionado', MB_OK+MB_ICONHAND);
    abort
  end
  else
  begin
    valor:= 0;
    qAux:= TADOQuery.Create(nil);
    if (qrychama_lancamento.IsEmpty = false) and (RGStatus.ItemIndex = 0) then
    begin
    {if (CBBaixa.Checked) then
      begin
        if (Application.MessageBox('A opção para Realizar Pagamento Geral está marcada. Será dado baixa em todas as contas selecionadas. Neste procedimento, as contas baixadas não poderão ser estornadas, no momento. Deseja Continuar?', 'Confirmação...', MB_YESNO + MB_ICONQUESTION)) = idyes then
          begin
            qrychama_lancamento.First;
            while not qrychama_lancamento.Eof do
              begin
                if (cxGrid1DBTableView1.Controller.selected) then
                begin
                  valor:= valor + qrychama_lancamentoValor.AsFloat;
                  //qtde:= qtde + 1;
                  qrychama_lancamento.Next;
                end
                else
                  qrychama_lancamento.Next;
              end;
              Application.CreateForm(TFrmBaixar_Titulo, FrmBaixar_Titulo);
              FrmBaixar_Titulo.EdtN_Documento.Text:= '';
              FrmBaixar_Titulo.MEdtData_Vencimento.Text:= qrychama_lancamentoData_Vencimento.AsString;
              FrmBaixar_Titulo.EdtParcela.Text:= '';//qrychama_lancamentoParcela.AsString;
              FrmBaixar_Titulo.EdtValor_Parcela.Text:= FormatFloat('#0.0,0', valor);
              FrmBaixar_Titulo.EdtValor_Parcela.Text:= StringReplace(FrmBaixar_Titulo.EdtValor_Parcela.Text, ThousandSeparator, '', [rfReplaceAll]);

              FrmBaixar_Titulo.EdtValor_Pagar.Text:= FormatFloat('#0.0,0', valor);
              FrmBaixar_Titulo.EdtValor_Pagar.Text:= StringReplace(FrmBaixar_Titulo.EdtValor_Pagar.Text, ThousandSeparator, '', [rfReplaceAll]);
              FrmBaixar_Titulo.EdtCodigo_Condicao_Pagamento.Text:= qrychama_lancamentoCodigo_Forma_Pagamento.AsString;
              FrmBaixar_Titulo.EdtCondicao_Pagamento.Text:= qrychama_lancamentoCond_Pag.AsString;
              FrmBaixar_Titulo.ShowModal;
              FrmBaixar_Titulo.Free;
          end;
      end
      else
      begin }
        Application.CreateForm(TFrmBaixar_Titulo, FrmBaixar_Titulo);
        FrmBaixar_Titulo.EdtN_Documento.Text:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoN_Documento.AsString;
        FrmBaixar_Titulo.EdtParcela.Text:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoParcela.AsString;

        FrmBaixar_Titulo.EdtValor_Parcela.Text:= FormatFloat('#0.0,0', FrmChama_Lancamentos_Financeiros.qrychama_lancamentoValor.AsFloat);
        FrmBaixar_Titulo.EdtValor_Parcela.Text:= StringReplace(FrmBaixar_Titulo.EdtValor_Parcela.Text, ThousandSeparator, '', [rfReplaceAll]);

        FrmBaixar_Titulo.EdtValor_Pagar.Text:= FormatFloat('#0.0,0', FrmChama_Lancamentos_Financeiros.qrychama_lancamentoValor_Pagar.AsFloat);
        FrmBaixar_Titulo.EdtValor_Pagar.Text:= StringReplace(FrmBaixar_Titulo.EdtValor_Pagar.Text, ThousandSeparator, '', [rfReplaceAll]);

        FrmBaixar_Titulo.EdtDesconto.Text:= FormatFloat('#0.0,0', FrmChama_Lancamentos_Financeiros.qrychama_lancamentoDesconto.AsFloat);
        FrmBaixar_Titulo.EdtDesconto.Text:= StringReplace(FrmBaixar_Titulo.EdtDesconto.Text, ThousandSeparator, '', [rfReplaceAll]);

        FrmBaixar_Titulo.EdtAcrescimo.Text:= FormatFloat('#0.0,0', FrmChama_Lancamentos_Financeiros.qrychama_lancamentoAcrescimo.AsFloat);
        FrmBaixar_Titulo.EdtAcrescimo.Text:= StringReplace(FrmBaixar_Titulo.EdtAcrescimo.Text, ThousandSeparator, '', [rfReplaceAll]);

        FrmBaixar_Titulo.EdtValor_Restante.Text:= FormatFloat('#0.0,0', FrmChama_Lancamentos_Financeiros.qrychama_lancamentoValor_Restante.AsFloat);
        FrmBaixar_Titulo.EdtValor_Restante.Text:= StringReplace(FrmBaixar_Titulo.EdtValor_Restante.Text, ThousandSeparator, '', [rfReplaceAll]);

        //FrmBaixar_Titulo.EdtValor_Recebido.Text:= FormatFloat('#0.0,0', ( FrmChama_Lancamentos_Financeiros.qrychama_lancamentoValor_Restante.AsFloat));
        //FrmBaixar_Titulo.EdtValor_Recebido.Text:= StringReplace(FrmBaixar_Titulo.EdtValor_Recebido.Text, ThousandSeparator, '', [rfReplaceAll]);

        FrmBaixar_Titulo.EdtValor_Pago.Text:= FormatFloat('#0.0,0', ( FrmChama_Lancamentos_Financeiros.qrychama_lancamentoValor_Pago.AsFloat));
        FrmBaixar_Titulo.EdtValor_Pago.Text:= StringReplace(FrmBaixar_Titulo.EdtValor_Pago.Text, ThousandSeparator, '', [rfReplaceAll]);

        //FrmBaixar_Titulo.valor_ja_recebido:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoValor_Pagar.AsFloat - FrmChama_Lancamentos_Financeiros.qrychama_lancamentoValor_Restante.AsFloat;

        FrmBaixar_Titulo.MEdtData_Vencimento.Text:= FrmChama_Lancamentos_Financeiros.qrychama_lancamentoData_Vencimento.AsString;
        FrmBaixar_Titulo.EdtCodigo_Condicao_Pagamento.Text:= qrychama_lancamentoCodigo_Forma_Pagamento.AsString;
        FrmBaixar_Titulo.EdtCondicao_Pagamento.Text:= qrychama_lancamentoCond_Pag.AsString;
        FrmBaixar_Titulo.ShowModal;
        FrmBaixar_Titulo.Free;
    //  end;
    end;
  end;
end;

procedure TFrmChama_Lancamentos_Financeiros.BBtnEstornarClick(Sender: TObject);
var
  qAux, qAux2: TADOQuery;
  saldo: double;
begin
  if (cxGrid1DBTableView1.Controller.SelectedRowCount = 0) then
    Application.MessageBox('É necessário informar pelo menos um item', 'Dados não encontrados', MB_OK+MB_ICONHAND)
  else
  begin
    TMensagens.MensagemInformacao('Ao estornar uma conta, a mesma se tornará pendente, o pagamento parcial será excluído, o lançamento no caixa diário será excluído e, se foi dado baixa via banco, o cheque se tornará pendente e o saldo da conta bancária será atualizado.');

    Application.CreateForm(TFrmEscolha_Parcela_Estorno, FrmEscolha_Parcela_Estorno);
    FrmEscolha_Parcela_Estorno.ShowModal;
    FrmEscolha_Parcela_Estorno.Free;
    {if (Application.MessageBox('Confirma o estorno das informações selecionadas?', 'Confirmação...', MB_ICONQUESTION+MB_YESNO)) = idyes then
      begin
        qrychama_lancamento.First;
        while not qrychama_lancamento.Eof do
          begin
            if (DBGrid1.SelectedRows.CurrentRowSelected) then
            begin
              Atualiza_Conta(qrychama_lancamentoCodigo.AsInteger,
                             qrychama_lancamentoParcela.AsInteger,
                             '',
                             'PENDENTE',
                             '',
                             '',
                             0,
                             0,
                             0,
                             0,
                             0,
                             qrychama_lancamentoCodigo_Forma_Pagamento.AsInteger);
              try
                qAux:= TADOQuery.Create(self);
                qAux2:= TADOQuery.Create(self);

                if (qrychama_lancamentoCodigo_Conta.AsInteger <> 0) then
                begin
                  with qAux2, sql do
                  begin
                    close;
                    clear;
                    Connection:= dm.ADOConnection1;
                    add('select CC.Saldo_Atual from Conta_Corrente CC where Codigo = :Codigo');
                    Parameters.ParamByName('Codigo').Value:= qrychama_lancamentoCodigo_Conta.AsInteger;
                    open;
                  end;

                  if (qrychama_lancamentoTipo.AsString = 'PAGAR') then
                    saldo:= qAux2.FieldByName('Saldo_Atual').AsFloat + qrychama_lancamentoValor.AsFloat
                  else if (qrychama_lancamentoTipo.AsString = 'RECEBER') then
                    saldo:= qAux2.FieldByName('Saldo_Atual').AsFloat - qrychama_lancamentoValor.AsFloat;

                  Atualiza_Saldo_Bancario(qrychama_lancamentoCodigo_Conta.AsInteger, saldo);
                  //Deleta_Lancamento_Bancario(qrychama_lancamentoN_Documento.AsInteger);
                end;

                if (qrychama_lancamentoCodigo_Cheque.AsInteger <> 0) then
                  Atualiza_Cheque('', 'PENDENTE', qrychama_lancamentoCodigo_Cheque.AsInteger);

                with qAux, sql do
                begin
                  close;
                  Connection:= dm.ADOConnection1;
                  clear;
                  add('Delete from Fechamento_Venda where N_Documento = :N_Documento and Parcela = :Parcela');
                  Parameters.ParamByName('N_Documento').Value:= qrychama_lancamentoN_Documento.AsInteger;
                  Parameters.ParamByName('Parcela').Value:= qrychama_lancamentoParcela.AsInteger;
                  ExecSQL;
                end;
              finally
                FreeAndNil(qAux);
              end;

              qrychama_lancamento.Next;
            end
            else
              qrychama_lancamento.Next;
          end;
          Processo_Concluido;
          qrychama_lancamento.Close;
          qrychama_lancamento.Open;
      end;}
  end;
end;

procedure TFrmChama_Lancamentos_Financeiros.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Lancamentos_Financeiros.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Lancamento_Financeiro(EdtConsulta.Text);
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir_Agrupado.Enabled:= true;
  BBtnBaixar_Conta.Enabled:= true;
  BBtnOcorrencia_Cobranca.Enabled:= true;
  {if (RGStatus.ItemIndex = 0) then
    BBtnEstornar.Enabled:= false
  else}
    BBtnEstornar.Enabled:= true;
end;

procedure TFrmChama_Lancamentos_Financeiros.BBtnImprimir_SinteticoClick(Sender: TObject);
begin
  FrmRel_Lancamento_Contas:= TFrmRel_Lancamento_Contas.Create(self);
  FrmRel_Lancamento_Contas.Release;
  FrmRel_Lancamento_Contas:= Nil;
end;

procedure TFrmChama_Lancamentos_Financeiros.BBtnImprimir_AgrupadoClick(
  Sender: TObject);
begin
  dxComponentPrinter1.Preview(True, nil);
  {FrmRel_Lancamento_Contas_Agrupado:= TFrmRel_Lancamento_Contas_Agrupado.Create(self);
  FrmRel_Lancamento_Contas_Agrupado.Release;
  FrmRel_Lancamento_Contas_Agrupado:= Nil;}
end;

procedure TFrmChama_Lancamentos_Financeiros.BBtnImprimir_Sintetico2Click(
  Sender: TObject);
begin
  FrmRel_Lancamento_Contas_Simples_2:= TFrmRel_Lancamento_Contas_Simples_2.Create(self);
  FrmRel_Lancamento_Contas_Simples_2.Release;
  FrmRel_Lancamento_Contas_Simples_2:= Nil;
end;

procedure TFrmChama_Lancamentos_Financeiros.BBtnLimparClick(Sender: TObject);
begin
  qrychama_lancamento.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir_Agrupado.Enabled:= false;
  BBtnEstornar.Enabled:= false;
  BBtnBaixar_Conta.Enabled:= false;
  BBtnOcorrencia_Cobranca.Enabled:= false;
  EdtConsulta.SetFocus;
end;

procedure TFrmChama_Lancamentos_Financeiros.BBtnOcorrencia_CobrancaClick(
  Sender: TObject);
begin
  Application.CreateForm(TFrmCadastro_Ocorrencia_Cobranca, FrmCadastro_Ocorrencia_Cobranca);
  FrmCadastro_Ocorrencia_Cobranca.Create(Self, qrychama_lancamentoCodigo.AsInteger, qrychama_lancamentoN_Documento.AsInteger);
  FrmCadastro_Ocorrencia_Cobranca.Show;
  Centraliza_Form(FrmCadastro_Ocorrencia_Cobranca);
  FrmCadastro_Ocorrencia_Cobranca.BBtnNovoClick(nil);
  {Application.CreateForm(TFrmCadastro_Ocorrencia_Cobranca, FrmCadastro_Ocorrencia_Cobranca);
  FrmCadastro_Ocorrencia_Cobranca.Create(Self, qrychama_lancamentoCodigo.AsInteger, qrychama_lancamentoN_Documento.AsInteger);
  FrmCadastro_Ocorrencia_Cobranca.Show;
  Centraliza_Form(FrmCadastro_Ocorrencia_Cobranca);}
end;

procedure TFrmChama_Lancamentos_Financeiros.CBBaixaClick(Sender: TObject);
begin
  {if (RGConsulta_Por.ItemIndex <> 1) then
    begin
      Application.MessageBox('Para realizar esta operação, é necessário marcar a opção Consultar por Cliente/Forn.', 'Opção Inválida', MB_OK+Mb_ICONEXCLAMATION);
      CBBaixa.Checked:= false;
      abort;
    end
    else if (EdtCodigo_Cli_For.Text = '') then
    begin
      Application.MessageBox('Por favor, informe um parametro', 'Atenção', MB_OK+Mb_ICONEXCLAMATION);
      CBBaixa.Checked:= false;
      abort;
    end;}
  
end;

procedure TFrmChama_Lancamentos_Financeiros.DBGrid1DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
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

procedure TFrmChama_Lancamentos_Financeiros.EdtCodigo_Cli_ForKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      if (RGTipo_Conta.ItemIndex = 0) and (RGConsulta_Por.ItemIndex = 1) then
      begin
        Application.CreateForm(TFrmChama_Fornecedor, FrmChama_Fornecedor);
        FrmChama_Fornecedor.ShowModal;
        FrmChama_Fornecedor.Free;
      end
      else if (RGTipo_Conta.ItemIndex = 1) and (RGConsulta_Por.ItemIndex = 1) then
      begin
        Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
        FrmChama_Cliente.ShowModal;
        FrmChama_Cliente.Free;
      end;
    end;
end;

procedure TFrmChama_Lancamentos_Financeiros.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Lancamento_Financeiro(EdtConsulta.Text);
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir_Agrupado.Enabled:= true;
  end;
end;

procedure TFrmChama_Lancamentos_Financeiros.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmChama_Lancamentos_Financeiros.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Lancamentos_Financeiros.Free;
  FrmChama_Lancamentos_Financeiros:= NIl;
end;

procedure TFrmChama_Lancamentos_Financeiros.FormCreate(Sender: TObject);
begin
  qrychama_lancamento.close;
  CBBaixa.Checked:= false;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir_Agrupado.Enabled:= false;
  EdtConsulta.Clear;
  Utili.Inicia_Data(MEdtData_Inicial, MEdtData_Final);
end;

procedure TFrmChama_Lancamentos_Financeiros.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmChama_Lancamentos_Financeiros.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Lancamentos_Financeiros.qrychama_lancamentoData_PagamentoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '30/12/1899') then
    Text:= ''
  else
    Text:= Sender.AsString;
end;

procedure TFrmChama_Lancamentos_Financeiros.RGConsulta_PorClick(
  Sender: TObject);
begin
  if (RGConsulta_Por.ItemIndex <> 1) then
    CBBaixa.Checked:= false;
end;

end.
