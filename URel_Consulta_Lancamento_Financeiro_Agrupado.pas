unit URel_Consulta_Lancamento_Financeiro_Agrupado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt, QRExport;

type
  TFrmRel_Consulta_Lancamento_Financeiro_Agrupado = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRGroup1: TQRGroup;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRLabel4: TQRLabel;
    LblDe: TQRLabel;
    QRLabel11: TQRLabel;
    LblAte: TQRLabel;
    qrypagar: TADOQuery;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRBand3: TQRBand;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRCompositeReport1: TQRCompositeReport;
    QRLabel3: TQRLabel;
    qryreceber: TADOQuery;
    QuickRep2: TQuickRep;
    QRBand2: TQRBand;
    QRLabel21: TQRLabel;
    QRGroup2: TQRGroup;
    QRLabel22: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRBand5: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand6: TQRBand;
    QRLabel35: TQRLabel;
    QRExpr3: TQRExpr;
    QRBand7: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel38: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel5: TQRLabel;
    LblSaldo: TQRLabel;
    qrypagarCodigo: TIntegerField;
    qrypagarN_Documento: TIntegerField;
    qrypagarHistorico: TStringField;
    qrypagarData_Lancamento: TDateTimeField;
    qrypagarData_Vencimento: TDateTimeField;
    qrypagarData_Pagamento: TDateTimeField;
    qrypagarValor: TFloatField;
    qrypagarStatus: TStringField;
    qrypagarNome_Fantasia: TStringField;
    qryreceberCodigo: TIntegerField;
    qryreceberN_Documento: TIntegerField;
    qryreceberHistorico: TStringField;
    qryreceberData_Lancamento: TDateTimeField;
    qryreceberData_Vencimento: TDateTimeField;
    qryreceberData_Pagamento: TDateTimeField;
    qryreceberValor: TFloatField;
    qryreceberStatus: TStringField;
    qryreceberNome_Nome_Fantasia: TStringField;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText9: TQRDBText;
    qrypagarN_Cheque: TStringField;
    qrypagarConta: TStringField;
    qryreceberN_Cheque: TStringField;
    qryreceberConta: TStringField;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    qryreceberValor_Pagar: TFloatField;
    qrypagarValor_Pagar: TFloatField;
    qrypagarValor_Pago: TFloatField;
    qrypagarValor_Restante: TFloatField;
    qryreceberValor_Pago: TFloatField;
    qryreceberValor_Restante: TFloatField;
    QRExcelFilter1: TQRExcelFilter;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure QRExpr1Print(sender: TObject; var Value: string);
    procedure QRExpr3Print(sender: TObject; var Value: string);
    procedure LblSaldoPrint(sender: TObject; var Value: string);
  private
    val1, val2, result: double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Lancamento_Financeiro_Agrupado: TFrmRel_Consulta_Lancamento_Financeiro_Agrupado;

implementation

uses UDM, UConsulta_Lancamentos_Financeiros, UDeclaracao, UGeral;

{$R *.dfm}

procedure TFrmRel_Consulta_Lancamento_Financeiro_Agrupado.FormCreate(Sender: TObject);
begin
  QRCompositeReport1.Prepare;
  QRCompositeReport1.Preview;
end;

procedure TFrmRel_Consulta_Lancamento_Financeiro_Agrupado.LblSaldoPrint(
  sender: TObject; var Value: string);
begin
  result:= val2 - val1;
  Value:= FormatFloat('#0.0,0', result);
  Value:= StringReplace(Value, ThousandSeparator, '', [rfReplaceAll]);
end;

procedure TFrmRel_Consulta_Lancamento_Financeiro_Agrupado.QRCompositeReport1AddReports(
  Sender: TObject);
begin
  QRCompositeReport1.Reports.Add(QuickRep1);
  QRCompositeReport1.Reports.Add(QuickRep2);
end;

procedure TFrmRel_Consulta_Lancamento_Financeiro_Agrupado.QRExpr1Print(
  sender: TObject; var Value: string);
var
  aux: AnsiString;
begin
  aux:= StringReplace(Value, ThousandSeparator, '', [rfReplaceAll]);
  //aux:= FormatFloat('#0,00', StrToFloat(Value));
  //aux:= StringReplace(aux, ThousandSeparator, '', [rfReplaceAll]);
  val1:= StrToFloat(aux);
end;

procedure TFrmRel_Consulta_Lancamento_Financeiro_Agrupado.QRExpr3Print(
  sender: TObject; var Value: string);
var
  aux: AnsiString;
begin
  aux:= StringReplace(Value, ThousandSeparator, '', [rfReplaceAll]);
  //aux:= FormatFloat('#0,00', StrToFloat(Value));
  //aux:= StringReplace(aux, ThousandSeparator, '', [rfReplaceAll]);
  val2:= StrToFloat(aux);
end;

procedure TFrmRel_Consulta_Lancamento_Financeiro_Agrupado.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  LblDe.Caption:= FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text;
  LblAte.Caption:= FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  with qrypagar do
  begin
    close;
    sql.clear;
    sql.add('select CH.N_Cheque, CC.Conta, PL.Codigo, PL.N_Documento, LF.Historico,');
    sql.add('LF.Data_Lancamento, PL.Data_Vencimento, PL.Data_Pagamento,');
    sql.add('PL.Valor, PL.Valor_Pagar, PL.Valor_Pago, PL.Valor_Restante, PL.Status, Forn.Nome_Fantasia');
    sql.add('from Lancamento_Financeiro LF');
    sql.add('left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)');
    sql.add('left join Fornecedor Forn on(LF.Codigo_Cli_For = Forn.Codigo)');
    sql.Add('left join Cheque CH on (PL.Codigo_Cheque = CH.Codigo)');
    sql.Add('left join Conta_Corrente CC on (PL.Codigo_Conta = CC.Codigo)');

    if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
      sql.add('where PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2) order by PL.Data_Vencimento')
    else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
      sql.add('where PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2) order by PL.Data_Vencimento')
    else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
      sql.add('where PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2) order by PL.Data_Vencimento');

    Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
    Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
    Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

    if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
      Parameters.ParamByName('Status').Value:= 'PAGO'
    else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
      Parameters.ParamByName('Status').Value:= 'PENDENTE';

    Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';

    if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 0) then
    begin
      Parameters.ParamByName('Conta1').Value:= 0;
      Parameters.ParamByName('Conta2').Value:= 1;
    end
    else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 1) then
    begin
      Parameters.ParamByName('Conta1').Value:= 0;
      Parameters.ParamByName('Conta2').Value:= 0;
    end
    else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 2) then
    begin
      Parameters.ParamByName('Conta1').Value:= 1;
      Parameters.ParamByName('Conta2').Value:= 1;
    end;
    open;
  end;

  with qryreceber do
  begin
    close;
    sql.clear;
    sql.add('select CH.N_Cheque, CC.Conta, PL.Codigo, PL.N_Documento, LF.Historico,');
    sql.add('LF.Data_Lancamento, PL.Data_Vencimento, PL.Data_Pagamento,');
    sql.add('PL.Valor, PL.Valor_Pagar, PL.Valor_Pago, PL.Valor_Restante, PL.Status, Cli.Nome_Nome_Fantasia');
    sql.add('from Lancamento_Financeiro LF');
    sql.add('left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)');
    sql.add('left join Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo)');
    sql.Add('left join Cheque CH on (PL.Codigo_Cheque = CH.Codigo)');
    sql.Add('left join Conta_Corrente CC on (PL.Codigo_Conta = CC.Codigo)');

    if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
      sql.add('where PL.Status = :Status and LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2) order by PL.Data_Vencimento')
    else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
      sql.add('where PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2) order by PL.Data_Vencimento')
    else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
      sql.add('where PL.Status = :Status and LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2) order by PL.Data_Vencimento');

    Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
    Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
    Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

    if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
      Parameters.ParamByName('Status').Value:= 'PAGO'
    else if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
      Parameters.ParamByName('Status').Value:= 'PENDENTE';

    Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';

    if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 0) then
    begin
      Parameters.ParamByName('Conta1').Value:= 0;
      Parameters.ParamByName('Conta2').Value:= 1;
    end
    else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 1) then
    begin
      Parameters.ParamByName('Conta1').Value:= 0;
      Parameters.ParamByName('Conta2').Value:= 0;
    end
    else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 2) then
    begin
      Parameters.ParamByName('Conta1').Value:= 1;
      Parameters.ParamByName('Conta2').Value:= 1;
    end;
    open;
  end;

end;

end.
