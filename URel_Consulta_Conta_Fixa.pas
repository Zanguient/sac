unit URel_Consulta_Conta_Fixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Conta_Fixa = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBDescricao: TQRDBText;
    QRDBData_Vencimento: TQRDBText;
    QRDBParcela: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBData_Pagamento: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
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
    LblConsulta_Por: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    LblParametro: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRBand1: TQRBand;
    QRLabel7: TQRLabel;
    LblValor: TQRLabel;
    LblTipo_Conta: TQRLabel;
    QRLabel13: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Conta_Fixa: TFrmRel_Consulta_Conta_Fixa;

implementation

uses UGeral, UEscolha_Impressao, UConsulta_Conta_Fixa, UDeclaracao;

{$R *.dfm}

procedure TFrmRel_Consulta_Conta_Fixa.FormCreate(Sender: TObject);
begin
//  if (FrmEscolha_Impressao.preview = true) then
    QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Conta_Fixa.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;
  LblParametro.Caption:= '';

  if (FrmConsulta_Conta_Fixa.RGTipo.ItemIndex = 0) then
    LblTipo_Conta.Caption:= 'Crédito'
  else
    LblTipo_Conta.Caption:= 'Débito';

  if (FrmConsulta_Conta_Fixa.RGConsulta_Por.ItemIndex = 1) then
    LblParametro.Caption:= 'De ' + FrmConsulta_Conta_Fixa.EdtDia_Ini.Text + ' até ' + FrmConsulta_Conta_Fixa.EdtDia_Fim.Text
  else
    LblParametro.Caption:= FrmConsulta_Conta_Fixa.EdtConsulta.Text;
  
  if (FrmConsulta_Conta_Fixa.RGConsulta_Por.ItemIndex = 0) then
    LblConsulta_Por.Caption:= 'Tudo'
  else if (FrmConsulta_Conta_Fixa.RGConsulta_Por.ItemIndex = 1) then
    LblConsulta_Por.Caption:= 'Dia'
  else if (FrmConsulta_Conta_Fixa.RGConsulta_Por.ItemIndex = 2) then
    LblConsulta_Por.Caption:= 'Descrição'
  else if (FrmConsulta_Conta_Fixa.RGConsulta_Por.ItemIndex = 3) then
    LblConsulta_Por.Caption:= 'Plano Financeiro';

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  LblValor.Caption:= FrmConsulta_Conta_Fixa.EdtValor_Total.Text;

end;

end.
