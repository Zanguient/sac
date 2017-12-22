unit URel_Recibo_Venda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB;

type
  TFrmRel_Recibo_Venda = class(TForm)
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
    QRBand2: TQRBand;
    QRHRule2: TQRHRule;
    LblEmitente_Rodape: TQRLabel;
    LblCliente_Rodape: TQRLabel;
    QRHRule3: TQRHRule;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    LblCliente: TQRLabel;
    QRLabel3: TQRLabel;
    LblEndereco: TQRLabel;
    Lblad: TQRLabel;
    LblCPF: TQRLabel;
    QRBand1: TQRBand;
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    LblData: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    LblValor: TQRLabel;
    QRLabel11: TQRLabel;
    LblCOO: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Recibo_Venda: TFrmRel_Recibo_Venda;

implementation

uses UDM, UGeral, UPDV, UFechamento_Venda_PDV, UDeclaracao,
  UCarrega_Pedido_Caixa;

{$R *.dfm}

procedure TFrmRel_Recibo_Venda.FormCreate(Sender: TObject);
begin
  QuickRep1.Print;
end;

procedure TFrmRel_Recibo_Venda.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var
    i: integer;
    texto: string;
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);

  if (FrmPDV <> nil) and (FrmPDV.ativo) then
  begin
    LblCliente.Caption:= FrmPDV.Nome;
    LblEndereco.Caption:= FrmPDV.Endereco;
    LblCPF.Caption:= FrmPDV.CPF;
    LblCliente_Rodape.Caption:= FrmPDV.Nome;
  end
  else
  begin
    LblCliente.Caption:= FrmCarrega_Pedido_Caixa.qrycarrega_caixaNome_Nome_Fantasia.AsString;
    LblEndereco.Caption:= FrmCarrega_Pedido_Caixa.qrycarrega_caixaEndereco.AsString;
    LblCPF.Caption:= FrmCarrega_Pedido_Caixa.CPF;
    LblCliente_Rodape.Caption:= FrmCarrega_Pedido_Caixa.qrycarrega_caixaNome_Nome_Fantasia.AsString;
  end;
  LblCOO.Caption:= UDeclaracao.COO;
  LblValor.Caption:= FrmFechamento_Venda_PDV.EdtTotal_Venda.Text;
  LblData.Caption:= DateTostr(date);
  LblEmitente_Rodape.Caption:= nome_fantasia;
  LblTelefone_Rodape.Caption:= telefone_relatorio;

end;

end.
