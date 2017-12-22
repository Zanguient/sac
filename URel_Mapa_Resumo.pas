unit URel_Mapa_Resumo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Mapa_Resumo = class(TForm)
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
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText16: TQRDBText;
    QRChildBand1: TQRChildBand;
    QRLabel5: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel30: TQRLabel;
    QRBand3: TQRBand;
    QRDBValor: TQRDBText;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    LblPeriodo: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel13: TQRLabel;
    ADOQuery1: TADOQuery;
    QRBand1: TQRBand;
    ADOQuery1Totalizador_Parcial: TStringField;
    ADOQuery1Data_Movimento: TDateTimeField;
    ADOQuery1Caixa: TStringField;
    ADOQuery1CRZ: TStringField;
    ADOQuery1N_Fabricacao: TStringField;
    ADOQuery1COO_Inicial: TStringField;
    ADOQuery1COO_Final: TStringField;
    ADOQuery1Valor_Acumulado: TFloatField;
    ADOQuery1Venda_Bruta_Diaria: TFloatField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Mapa_Resumo: TFrmRel_Mapa_Resumo;

implementation

uses UGeral, UDeclaracao, UDM, UMapa_Resumo;

{$R *.dfm}

procedure TFrmRel_Mapa_Resumo.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Mapa_Resumo.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  LblPeriodo.Caption:= FrmMapa_Resumo.MEdtData_Inicial.Text + ' a ' + FrmMapa_Resumo.MEdtData_Final.Text;

  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select R03.Totalizador_Parcial, R02.Data_Movimento, R02.Caixa, R02.CRZ, R02.N_Fabricacao, R02.COO_Inicial, R02.COO_Final, convert(float, R03.Valor_Acumulado)/100 as Valor_Acumulado,');
    add('convert(float, R02.Venda_Bruta_Diaria)/100 as Venda_Bruta_Diaria from R02');
    add('left join R03 on (R02.Data_Movimento = R03.Data_Movimento)');
    add('where R02.Data_Movimento between :DI and :DF and R02.N_Fabricacao = :N');
    add('group by R03.Totalizador_Parcial, R02.Data_Movimento, R02.Caixa, R02.CRZ, R02.N_Fabricacao, R02.COO_Inicial, R02.COO_Final, R03.Valor_Acumulado, R02.Venda_Bruta_Diaria');
    add('order by R02.Data_Movimento');
    Parameters.ParamByName('DI').Value:= StrToDateTime(FrmMapa_Resumo.MEdtData_Inicial.Text);
    Parameters.ParamByName('DF').Value:= StrToDateTime(FrmMapa_Resumo.MEdtData_Final.Text);
    Parameters.ParamByName('N').Value:= FrmMapa_Resumo.EdtN_Serie.Text;
    open;
  end;
end;
end.
