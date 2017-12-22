unit URel_Consulta_Custo_Empresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Custo_Empresa = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBData_Vencimento: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBData_Pagamento: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
    LblPeriodo: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    ADOQuery1: TADOQuery;
    ADOQuery1MES_ANO: TStringField;
    ADOQuery1VALOR_FIXO: TFloatField;
    ADOQuery1VALOR_VARIAVEL: TFloatField;
    ADOQuery1VALORTOTAL: TFloatField;
    ADOQuery1PFIXO: TFloatField;
    ADOQuery1PVARIAVEL: TFloatField;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel6: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel11: TQRLabel;
    QRExpr6: TQRExpr;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Custo_Empresa: TFrmRel_Consulta_Custo_Empresa;

implementation

uses UGeral, UEscolha_Impressao, UDeclaracao, UDM, UConsulta_Custo_Empresa;

{$R *.dfm}

procedure TFrmRel_Consulta_Custo_Empresa.FormCreate(Sender: TObject);
begin
//  if (FrmEscolha_Impressao.preview = true) then
    QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Custo_Empresa.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;
  LblPeriodo.Caption:= FrmConsulta_Custo_Empresa.MEdtData_Inicial.Text + ' a ' + FrmConsulta_Custo_Empresa.MEdtData_Final.Text;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  with ADOQuery1 do
  begin
    close;
    sql.clear;
    sql.add('SELECT MES_ANO,');
    sql.add('	   VALOR_FIXO,');
    sql.add('	   VALOR_VARIAVEL,');
    sql.add('	   VALORTOTAL,');
    sql.add('	   (VALOR_FIXO / VALORTOTAL) * 100 as PFIXO,');
    sql.add('	   (VALOR_VARIAVEL / VALORTOTAL) * 100 as PVARIAVEL');
    sql.add('FROM ( ');
    sql.add('SELECT  convert(varchar(2),month(h.Data_Lancamento)) + ' + QuotedStr('/') + ' + convert(varchar(4),year(h.Data_Lancamento)) as Mes_ano,');
    sql.add('        (select SUM(PL.Valor) FROM Parcelas_Lancamentos PL');
    sql.add('          left join Lancamento_Financeiro LF on (PL.Codigo = LF.Codigo)');
    sql.add('          where PL.Status = ' + QuotedStr('PAGO') + ' and LF.Tipo = ' + QuotedStr('PAGAR') + ' and LF.Conta_Fixa = 0 AND (convert(varchar(2),month(h.Data_Lancamento)) + ' + QuotedStr('/') + ' +');
    sql.add('        convert(varchar(4),year(h.Data_Lancamento))) =');
    sql.add('        convert(varchar(2),month(LF.Data_Lancamento)) + ' + QuotedStr('/') + ' +');
    sql.add('        convert(varchar(4),year(LF.Data_Lancamento))) AS VALOR_FIXO,');

    sql.add('        (select SUM(PL.Valor) FROM Parcelas_Lancamentos PL');
    sql.add('          left join Lancamento_Financeiro LF on (PL.Codigo = LF.Codigo)');
    sql.add('          where PL.Status = ' + QuotedStr('PAGO') + ' and LF.Tipo = ' + QuotedStr('PAGAR') + ' and LF.Conta_Fixa = 1 AND (convert(varchar(2),month(h.Data_Lancamento)) + ' + QuotedStr('/') + ' +');
    sql.add('        convert(varchar(4),year(h.Data_Lancamento))) =');
    sql.add('        convert(varchar(2),month(LF.Data_Lancamento)) + ' + QuotedStr('/') + ' +');
    sql.add('        convert(varchar(4),year(LF.Data_Lancamento))) AS VALOR_VARIAVEL,');

    sql.add('        (select SUM(PL.Valor) FROM Parcelas_Lancamentos PL');
    sql.add('          left join Lancamento_Financeiro LF on (PL.Codigo = LF.Codigo)');
    sql.add('          where PL.Status = ' + QuotedStr('PAGO') + ' and LF.Tipo = ' + QuotedStr('PAGAR') + ' and (convert(varchar(2),month(h.Data_Lancamento)) + ' + QuotedStr('/') + ' +');
    sql.add('        convert(varchar(4),year(h.Data_Lancamento))) =');
    sql.add('        convert(varchar(2),month(LF.Data_Lancamento)) + ' + QuotedStr('/') + ' +');
    sql.add('        convert(varchar(4),year(LF.Data_Lancamento))) AS VALORTOTAL');

    sql.add('        FROM Lancamento_Financeiro H');
    sql.Add('        left join Parcelas_Lancamentos PL1 on(H.Codigo = PL1.Codigo)');
    sql.add('        where PL1.Status = ' + QuotedStr('PAGO') + ' and H.Tipo = ' + QuotedStr('PAGAR') + ' and month(H.Data_Lancamento) between :m1 and :m2 and year(H.Data_Lancamento) between :a1 and :a2');
    sql.add('          group by convert(varchar(2),month(h.Data_Lancamento)) + ' + QuotedStr('/') + ' +');
    sql.add('          convert(varchar(4),year(h.Data_Lancamento))) AS TB');
    sql.Add('          order by VALORTOTAL');


    //Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
    Parameters.ParamByName('m1').Value:= FrmConsulta_Custo_Empresa.mes1;
    Parameters.ParamByName('m2').Value:= FrmConsulta_Custo_Empresa.mes2;
    Parameters.ParamByName('a1').Value:= FrmConsulta_Custo_Empresa.ano1;
    Parameters.ParamByName('a2').Value:= FrmConsulta_Custo_Empresa.ano2;
    open;
  end;
end;

end.
