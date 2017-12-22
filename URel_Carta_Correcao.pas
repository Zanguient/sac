unit URel_Carta_Correcao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Carta_Correcao = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand4: TQRBand;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRBand1: TQRBand;
    QRLabel5: TQRLabel;
    LblMensagem: TQRLabel;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    LblIDEvento: TQRLabel;
    QRLabel3: TQRLabel;
    LblEvento: TQRLabel;
    QRLabel4: TQRLabel;
    LblData_Hora: TQRLabel;
    Label919: TQRLabel;
    LblProtocolo: TQRLabel;
    QRLabel1: TQRLabel;
    LblNFE: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Carta_Correcao: TFrmRel_Carta_Correcao;

implementation

uses UGeral, UDeclaracao, UDM, UNFE_Adm, UNFE_Imprime;

{$R *.dfm}

procedure TFrmRel_Carta_Correcao.FormCreate(Sender: TObject);
begin
//  if (FrmEscolha_Impressao.preview = true) then
    QuickRep1.Preview;
end;

procedure TFrmRel_Carta_Correcao.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  LblData_Hora.Caption:=  FrmNFE_Imprime.ADOQuery1DataEvento.AsString;
  LblProtocolo.Caption:=  FrmNFE_Imprime.ADOQuery1Protocolo.AsString;
  LblEvento.Caption:=  'Carta de Correção';
  LblIDEvento.Caption:=  FrmNFE_Imprime.ADOQuery1N_Carta_Correcao.AsString;
  LblMensagem.Caption:= FrmNFE_Imprime.ADOQuery1Observacao.AsString;
  LblNFE.Caption:= FrmNFE_Imprime.ADOQuery1N_Nota_Fiscal.AsString;

  //LblTelefone_Rodape.Caption:= telefone_relatorio;
  //LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

end;

end.
