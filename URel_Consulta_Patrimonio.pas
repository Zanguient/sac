unit URel_Consulta_Patrimonio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Patrimonio = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBDescricao: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBData_Pagamento: TQRDBText;
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
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Patrimonio: TFrmRel_Consulta_Patrimonio;

implementation

uses UGeral, UEscolha_Impressao, UDeclaracao, UConsulta_Patrimonio;

{$R *.dfm}

procedure TFrmRel_Consulta_Patrimonio.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Patrimonio.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;
  //LblPropriedade.Caption:= FrmCarregar_Contas_Pagar.EdtPropriedade.Text;
  LblParametro.Caption:= '';

  case (FrmConsulta_Patrimonio.RGConsulta_Por.ItemIndex) of
    0: LblParametro.Caption:= FrmConsulta_Patrimonio.EdtConsulta.Text;
    1: LblParametro.Caption:= FrmConsulta_Patrimonio.EdtConsulta.Text;
    2: LblParametro.Caption:= FrmConsulta_Patrimonio.EdtConsulta.Text;
    3: LblParametro.Caption:= FrmConsulta_Patrimonio.EdtConsulta.Text;
    4: LblParametro.Caption:= FrmConsulta_Patrimonio.EdtDescricao.Text;
    5: LblParametro.Caption:= FrmConsulta_Patrimonio.EdtDescricao.Text;
    6: LblParametro.Caption:= FrmConsulta_Patrimonio.EdtDescricao.Text;
  end;

  case (FrmConsulta_Patrimonio.RGConsulta_Por.ItemIndex) of
    0: LblConsulta_Por.Caption:= 'Nº Bem';
    1: LblConsulta_Por.Caption:= 'Nº Identificação';
    2: LblConsulta_Por.Caption:= 'Descrição';
    3: LblConsulta_Por.Caption:= 'Modelo';
    4: LblConsulta_Por.Caption:= 'Tipo';
    5: LblConsulta_Por.Caption:= 'Local';
    6: LblConsulta_Por.Caption:= 'Status';
  end;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;
end;

end.
