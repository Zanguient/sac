unit URel_Consulta_Ficha_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Ficha_Cliente = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBParcela: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRDBData_Pagamento: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel11: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel12: TQRLabel;
    QRCPF: TQRLabel;
    QRInsc: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    valor: double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Ficha_Cliente: TFrmRel_Consulta_Ficha_Cliente;

implementation

uses UGeral, UEscolha_Impressao, UDeclaracao, UConsulta_Ficha_Cliente;

{$R *.dfm}

procedure TFrmRel_Consulta_Ficha_Cliente.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (FrmConsulta_Ficha_Cliente.qryconsulta_clienteCPF.AsString <> '') then
  begin
    QRInsc.Caption := FrmConsulta_Ficha_Cliente.qryconsulta_clienteRG.AsString;
    //QRDBCPF.Mask:= '000.000.000-00;0;_';
    QRCPF.Caption:= FrmConsulta_Ficha_Cliente.qryconsulta_clienteCPF.AsString;
  end
  else
  begin
    //QRCPF.DataField := 'CNPJ';
    QRInsc.Caption := FrmConsulta_Ficha_Cliente.qryconsulta_clienteInsc_Estadual.AsString;
    //QRDBCPF.Mask:= '00.000.000/0000-00;0;_';
    QRCPF.Caption:= FrmConsulta_Ficha_Cliente.qryconsulta_clienteCNPJ.AsString;
  end;

  //valor:= valor + FrmConsulta_Ficha_Funcionario.qryconsulta_funcionarioSalario.AsFloat;
  //lblSalario.Caption:= FormatFloat('#0.0,0', valor);
end;

procedure TFrmRel_Consulta_Ficha_Cliente.FormCreate(Sender: TObject);
begin
//  if (FrmEscolha_Impressao.preview = true) then
    QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Ficha_Cliente.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

end;

end.
