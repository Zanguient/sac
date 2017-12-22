unit URel_Carne_Selecionado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt, jpeg, ACBrBoleto, ACBrBase, StrUtils,
  ACBrUtil, ExtDlgs, UConsulta;

type
  TFrmRel_Carne_Selecionado = class(TForm)
    QuickRep1: TQuickRep;
    QRPDFFilter1: TQRPDFFilter;
    QRBand1: TQRBand;
    Img1: TQRImage;
    QRShape22: TQRShape;
    QRLabel5: TQRLabel;
    ADOQuery1: TADOQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel6: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRHRule3: TQRHRule;
    QRHRule4: TQRHRule;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText12: TQRDBText;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel11: TQRLabel;
    ADOQuery2: TADOQuery;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText17: TQRDBText;
    QRHRule5: TQRHRule;
    QRHRule6: TQRHRule;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    ADOQuery2Razao_Social: TStringField;
    ADOQuery2Endereco: TStringField;
    ADOQuery2CEP: TStringField;
    ADOQuery2Cidade: TStringField;
    ADOQuery2Telefone: TStringField;
    ADOQuery1N_Documento: TIntegerField;
    ADOQuery1Data_Lancamento: TDateTimeField;
    ADOQuery1Valor_Pagar: TFloatField;
    ADOQuery1Parcela: TIntegerField;
    ADOQuery1Observacoes: TStringField;
    ADOQuery1Cliente: TStringField;
    ADOQuery1Endereco: TStringField;
    ADOQuery1CEP: TStringField;
    ADOQuery1Cidade: TStringField;
    ADOQuery1Data_Vencimento: TDateTimeField;
    Img2: TQRImage;
    QRLabel12: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRHRule7: TQRHRule;
    QRHRule8: TQRHRule;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel17: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRHRule9: TQRHRule;
    QRHRule10: TQRHRule;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText28: TQRDBText;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel22: TQRLabel;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRHRule11: TQRHRule;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    ADOQuery1Codigo: TIntegerField;
    LblObs1: TQRLabel;
    LblObs2: TQRLabel;
    QRHRule12: TQRHRule;
    QRHRule13: TQRHRule;
    LblEmissao1: TQRLabel;
    LblEmissao2: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
    Consulta : TConsulta;
  public
    { Public declarations }

  end;

var
  FrmRel_Carne_Selecionado: TFrmRel_Carne_Selecionado;

implementation

uses UDM, UGeral, UMenu_Geral, UDeclaracao, UVisualizacao_Carne,
  ULancamento_Financeiro;

{$R *.dfm}

procedure TFrmRel_Carne_Selecionado.FormCreate(Sender: TObject);
begin
  Img1.Picture.LoadFromFile(logomarca);
  Img2.Picture.LoadFromFile(logomarca);

  ADOQuery2.close;
  ADOQuery2.open;

  //ADOQuery1.close;
  //ADOQuery1.sql.Add(Consulta.Atualiza_Dados_Carne(StrToInt(FrmLancamento_Financeiro.EdtCodigo.Text)));
  //ADOQuery1.open;

  LblObs1.Caption:= observacoes_carne;
  LblObs2.Caption:= observacoes_carne;
  LblEmissao1.Caption:= FrmLancamento_Financeiro.MEdtData_Lancamento.Text;
  LblEmissao2.Caption:= FrmLancamento_Financeiro.MEdtData_Lancamento.Text;

  {if (caminho_pdf_carne <> '') then
  begin
    QuickRep1.ExportToFilter(TQRPDFDocumentFilter.Create(caminho_pdf_carne+ADOQuery1Cliente.AsString+ADOQuery1Codigo.AsString+'.pdf'));
  end;}

  QuickRep1.Preview;
end;

procedure TFrmRel_Carne_Selecionado.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:= FrmVisualizacao_Carne.DBGrid1.SelectedRows.CurrentRowSelected;
end;

end.
