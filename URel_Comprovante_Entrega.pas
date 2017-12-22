unit URel_Comprovante_Entrega;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB, jpeg,
  QRPDFFilt;

type
  TFrmRel_Comprovante_Entrega = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qrysoma_consulta_cliente_balcao_selecionado: TADOQuery;
    PageHeaderBand1: TQRBand;
    QRLabel17: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRHRule2: TQRHRule;
    QRLabel26: TQRLabel;
    LblEmpresa: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel20: TQRLabel;
    QRExpr2: TQRExpr;
    QRBand2: TQRBand;
    LblEmpresa2: TQRLabel;
    QRHRule4: TQRHRule;
    QRHRule5: TQRHRule;
    QRLabel8: TQRLabel;
    LblCliente: TQRLabel;
    LblEndereco: TQRLabel;
    LblCidade: TQRLabel;
    LblTelefone: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel13: TQRLabel;
    LblCPF: TQRLabel;
    LblEndereco_Empresa: TQRLabel;
    QRLabel24: TQRLabel;
    LblCidade_Empresa: TQRLabel;
    QRLabel25: TQRLabel;
    LblTelefone_Empresa: TQRLabel;
    QRLabel27: TQRLabel;
    LblCNPJ: TQRLabel;
    LblCliente2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRHRule6: TQRHRule;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    QRLabel14: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    LblN_Pedido: TQRLabel;
    LblN_NF: TQRLabel;
    QRLabel9: TQRLabel;
    LblTransportador: TQRLabel;
    QRLabel19: TQRLabel;
    LblPlaca: TQRLabel;
    QRLabel21: TQRLabel;
    LblTelefone_Transportador: TQRLabel;
    QRShape1: TQRShape;
    QRHRule1: TQRHRule;
    LblTransportador2: TQRLabel;
    QRHRule3: TQRHRule;
    LblCPF_CNPJ_Transportadora2: TQRLabel;
    QRImage1: TQRImage;
    QRLabel18: TQRLabel;
    LblCPF_CNPJ_Transportadora: TQRLabel;
    QRLabel22: TQRLabel;
    LblRG_Insc_Transportadora: TQRLabel;
    LblCNPJ2: TQRLabel;
    LblCPF2: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Comprovante_Entrega: TFrmRel_Comprovante_Entrega;

implementation

uses UDeclaracao, UGeral, UNFE;

{$R *.dfm}

procedure TFrmRel_Comprovante_Entrega.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Comprovante_Entrega.QuickRep1BeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  cn, cp, ct: AnsiString;
begin
  QRLabeldata.Caption:= FrmNFE.MEdtData_Emissao.Text;
  QRLabelHora.Caption:= FrmNFE.MEdtHora_Entrada_Saida.Text;
  LblEmpresa.Caption:= nome_fantasia;
  //QRLabel14.Caption:= nome_fantasia;

  cn:= Copy(cnpj,1,2)+'.'+Copy(cnpj,3,3)+'.'+Copy(cnpj,6,3)+'/'+
    Copy(cnpj,9,4)+'-'+Copy(cnpj,13,2);

  //cliente
  if (Length(cnpj_destinatario)=11) then
  begin
    cp:= Copy(cnpj_destinatario,1,3)+'.'+Copy(cnpj_destinatario,4,3)+'.'+Copy(cnpj_destinatario,7,3)+'-'+
      Copy(cnpj_destinatario,10,2);
  end
  else if (Length(cnpj_destinatario)=14) then
  begin
    cp:= Copy(cnpj_destinatario,1,2)+'.'+Copy(cnpj_destinatario,3,3)+'.'+Copy(cnpj_destinatario,6,3)+'/'+
      Copy(cnpj_destinatario,9,4)+'-'+Copy(cnpj_destinatario,13,2);
  end
  else
    cp:= '';


  LblCliente.Caption:= FrmNFE.EdtDestinatario.Text;
  LblCliente2.Caption:= FrmNFE.EdtDestinatario.Text;
  LblCPF.Caption:= cp;
  LblCPF2.Caption:= cp;
  LblEndereco.Caption:= endereco_destinatario + ', ' + numero_destinatario;
  LblCidade.Caption:= municipio_destinatario + ' - ' + uf_destinatario;
  LblTelefone.Caption:= telefone_destinatario;

  QRImage1.Picture.LoadFromFile(logomarca);
  LblEmpresa.Caption:= nome_fantasia;
  LblEmpresa2.Caption:= nome_fantasia;
  LblCNPJ.Caption:= cn;
  LblCNPJ2.Caption:= cn;
  LblEndereco_Empresa.Caption:= tipo_endereco + ' ' + endereco + ', ' + numero;
  LblCidade_Empresa.Caption:= cidade + ' - ' + uf;
  LblTelefone_Empresa.Caption:= telefone;
  LblN_Pedido.Caption:= FrmNFE.MMOPedido.Text;
  LblN_NF.Caption:= FrmNFE.EdtN_Nota_Fiscal.Text;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;

  LblTransportador.Caption:= FrmNFE.EdtTransportadora.Text;
  LblPlaca.Caption:= placa_transportadora;
  LblTelefone_Transportador.Caption:= telefone_transportadora;

  if (cpf_trans <> '') then
  begin
    ct:= Copy(cpf_trans,1,3)+'.'+Copy(cpf_trans,4,3)+'.'+Copy(cpf_trans,7,3)+'-'+
      Copy(cpf_trans,10,2);

    LblCPF_CNPJ_Transportadora.Caption:= ct;
  end
  else if (cnpj_trans <> '') then
  begin
    ct:= Copy(cnpj_trans,1,2)+'.'+Copy(cnpj_trans,3,3)+'.'+Copy(cnpj_trans,6,3)+'/'+
      Copy(cnpj_trans,9,4)+'-'+Copy(cnpj_trans,13,2);

    LblCPF_CNPJ_Transportadora.Caption:= ct;
  end
  else
  begin
    LblCPF_CNPJ_Transportadora.Caption:= '';
  end;

  if (rg_trans <> '') then
    LblRG_Insc_Transportadora.Caption:= rg_trans
  else if (insc_trans <> '') then
    LblRG_Insc_Transportadora.Caption:= insc_trans
  else
    LblRG_Insc_Transportadora.Caption:= '';

end;

end.
