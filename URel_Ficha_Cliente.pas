unit URel_Ficha_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB;

type
  TFrmRel_Ficha_Cliente = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRHRule1: TQRHRule;
    QRLabel4: TQRLabel;
    QRBand4: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel6: TQRLabel;
    QRExpr1: TQRExpr;
    LblTelefone_Rodape: TQRLabel;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    LblNome_Fantasia: TQRLabel;
    QRLabel1: TQRLabel;
    LblRazao_Social: TQRLabel;
    QRLabel3: TQRLabel;
    LblEndereco: TQRLabel;
    QRLabel5: TQRLabel;
    LblCidade: TQRLabel;
    QRLabel7: TQRLabel;
    LblProfissao: TQRLabel;
    QRLabel8: TQRLabel;
    LblData_Nascimento: TQRLabel;
    QRLabel10: TQRLabel;
    LblEstado_Civil: TQRLabel;
    QRLabel11: TQRLabel;
    LblTelefone: TQRLabel;
    QRLabel12: TQRLabel;
    LblCelular: TQRLabel;
    QRLabel13: TQRLabel;
    LblTelefone_Contato: TQRLabel;
    QRLabel14: TQRLabel;
    LblContato: TQRLabel;
    QRLabel15: TQRLabel;
    LblEmail: TQRLabel;
    QRBand2: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRLabel16: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText3: TQRDBText;
    QRBand3: TQRBand;
    QRSubDetail2: TQRSubDetail;
    QRLabel18: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel25: TQRLabel;
    LblCPF: TQRLabel;
    QRLabel27: TQRLabel;
    LblRG: TQRLabel;
    QRLabel28: TQRLabel;
    LblData_Emissao: TQRLabel;
    QRLabel29: TQRLabel;
    LblOrgao_Expedidor: TQRLabel;
    QRLabel30: TQRLabel;
    LblCNPJ: TQRLabel;
    QRLabel32: TQRLabel;
    LblInscricao_Estadual: TQRLabel;
    QRLabel31: TQRLabel;
    LblInscricao_Municipal: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Ficha_Cliente: TFrmRel_Ficha_Cliente;

implementation

uses UDM, UCadastro_Cliente;

{$R *.dfm}

procedure TFrmRel_Ficha_Cliente.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Ficha_Cliente.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var
    i: integer;
    texto: string;
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);

  LblNome_Fantasia.Caption:= FrmCadastro_Cliente.EdtNome.Text;
  LblRazao_Social.Caption:= FrmCadastro_Cliente.EdtRazao_Social.Text;

  LblEndereco.Caption:= FrmCadastro_Cliente.EdtEndereco.Text + ', ' + FrmCadastro_Cliente.EdtNumero.Text + ', ' + FrmCadastro_Cliente.EdtSetor.Text;
  LblCidade.Caption:= FrmCadastro_Cliente.EdtCidade.Text;
  LblProfissao.Caption:= FrmCadastro_Cliente.EdtProfissao.Text;
  LblData_Nascimento.Caption:= FrmCadastro_Cliente.MEdtData_Nascimento.Text;
  LblEstado_Civil.Caption:= FrmCadastro_Cliente.CmbEstado_Civil.Text;
  LblEmail.Caption:= FrmCadastro_Cliente.EdtEmail.Text;
  LblTelefone.Caption:= FrmCadastro_Cliente.MEdtTelefone.Text;
  LblCelular.Caption:= FrmCadastro_Cliente.MEdtCelular.Text;
  LblContato.Caption:= FrmCadastro_Cliente.EdtContato.Text;
  LblTelefone_Contato.Caption:= FrmCadastro_Cliente.MEdtTelefone_Contato.Text;

  LblCPF.Caption:= FrmCadastro_Cliente.EdtCPF.Text;
  LblRG.Caption:= FrmCadastro_Cliente.EdtRG.Text;
  LblOrgao_Expedidor.Caption:= FrmCadastro_Cliente.EdtOrgao_Expedidor.Text;
  LblData_Emissao.Caption:= FrmCadastro_Cliente.EdtData_Emissao.Text;
  LblCNPJ.Caption:= FrmCadastro_Cliente.EdtCNPJ.Text;
  LblInscricao_Estadual.Caption:= FrmCadastro_Cliente.EdtInsc_Estadual.Text;
  LblInscricao_Municipal.Caption:= FrmCadastro_Cliente.EdtInsc_Municipal.Text;



end;

end.
