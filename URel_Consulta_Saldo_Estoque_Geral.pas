unit URel_Consulta_Saldo_Estoque_Geral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Saldo_Estoque_Geral = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    ADOQuery1: TADOQuery;
    QRDBText8: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel15: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    ADOQuery1Sigla: TStringField;
    ADOQuery1Est: TFloatField;
    ADOQuery1Val_Compra: TFloatField;
    ADOQuery1Total: TFloatField;
    QRLabel5: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel6: TQRLabel;
    QRExpr4: TQRExpr;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Saldo_Estoque_Geral: TFrmRel_Consulta_Saldo_Estoque_Geral;

implementation

uses UGeral, UDeclaracao, UConsulta_Saldo_Estoque, UDM;

{$R *.dfm}

procedure TFrmRel_Consulta_Saldo_Estoque_Geral.FormCreate(Sender: TObject);
begin
//  if (FrmEscolha_Impressao.preview = true) then
    QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Saldo_Estoque_Geral.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  with ADOQuery1 do
  begin
    close;
    sql.clear;
    sql.add('select UM.Sigla, sum(Estoque) as Est, sum(Valor_Compra) as Val_Compra,');
    sql.add('(sum(Estoque) * sum(Valor_Compra)) as Total from Produto P');
    sql.add('left join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
    sql.add('group by UM.Sigla');
    open;
  end;
end;

end.
