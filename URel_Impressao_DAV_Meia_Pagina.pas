unit URel_Impressao_DAV_Meia_Pagina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Impressao_DAV_Meia_Pagina = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRBand4: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel6: TQRLabel;
    QRExpr1: TQRExpr;
    LblTelefone_Rodape: TQRLabel;
    QRBand2: TQRBand;
    LblCliente_Rodape: TQRLabel;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    LblEmpresa: TQRLabel;
    QRLabel3: TQRLabel;
    LblCNPJ: TQRLabel;
    Lblad: TQRLabel;
    LblEndereco: TQRLabel;
    QRLabel5: TQRLabel;
    LblInscricao_Estadual: TQRLabel;
    QRLabel10: TQRLabel;
    LblTelefone: TQRLabel;
    QRLabel11: TQRLabel;
    LblInscricao_Municipal: TQRLabel;
    QRLabel14: TQRLabel;
    LblCidade: TQRLabel;
    QRLabel13: TQRLabel;
    LblCliente: TQRLabel;
    QRLabel15: TQRLabel;
    LblCPF_Cliente: TQRLabel;
    QRLabel17: TQRLabel;
    LblEndereco_Cliente: TQRLabel;
    QRLabel22: TQRLabel;
    LblTelefone_Cliente: TQRLabel;
    LblCidade_Cliente: TQRLabel;
    QRLabel18: TQRLabel;
    LblSetor_Cliente: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel21: TQRLabel;
    LblN_Documento: TQRLabel;
    LblN_Documento_Fiscal: TQRLabel;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    QRHRule3: TQRHRule;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    LblAtendente: TQRLabel;
    LblQtde_Itens: TQRLabel;
    LblValor_Total: TQRLabel;
    lblForma_Pagamento: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    QRLabel24: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel32: TQRLabel;
    LblResponsavel: TQRLabel;
    QRLabel33: TQRLabel;
    LblQtde_Total: TQRLabel;
    QRLabel34: TQRLabel;
    LblCEP: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel36: TQRLabel;
    LblValor_Bruto: TQRLabel;
    QRLabel37: TQRLabel;
    LblTotal_Desconto: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRDBText5Print(sender: TObject; var Value: string);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
  private
    { Private declarations }
    qtde_total: double;
  public
    { Public declarations }
  end;

var
  FrmRel_Impressao_DAV_Meia_Pagina: TFrmRel_Impressao_DAV_Meia_Pagina;

implementation

uses UDM, UGeral, UPDV, UFechamento_Venda_PDV, UDeclaracao,
  UCarrega_Pedido_Caixa, UPedido_Venda, Util.Configs;

{$R *.dfm}

procedure TFrmRel_Impressao_DAV_Meia_Pagina.FormCreate(Sender: TObject);
var
  i: integer;
begin
  if (caminho_pedido_pdf <> '') then
  begin
    QuickRep1.ExportToFilter(TQRPDFDocumentFilter.Create(caminho_pedido_pdf+FrmPedido_Venda.EdtCliente.Text+FrmPedido_Venda.EdtN_Pedido.Text+'.pdf'));
  end;

  qtde_total:= 0;
  for i := 1 to qtde_copias do
  begin
    QuickRep1.Print;
  end;
  //QuickRep1.Preview;
end;

procedure TFrmRel_Impressao_DAV_Meia_Pagina.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  LblQtde_Total.Caption:= FloatToStr(qtde_total);
end;

procedure TFrmRel_Impressao_DAV_Meia_Pagina.QRDBText5Print(sender: TObject;
  var Value: string);
begin
  qtde_total:= qtde_total + StrToFloat(Value);
end;

procedure TFrmRel_Impressao_DAV_Meia_Pagina.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var
    i: integer;
    texto: string;
    endereco_cliente, setor_cliente, endereco_empresa, cn, cp: AnsiString;
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblTelefone_Rodape.Caption:= telefone_relatorio;
  qtde_total:= 0;

  endereco_cliente:= FrmPedido_Venda.LblEndereco.Caption + ', Nº ' + FrmPedido_Venda.LblNumero.Caption;
  setor_cliente:= FrmPedido_Venda.LblSetor.Caption;

  endereco_empresa:= UDeclaracao.endereco + ', Nº ' + UDeclaracao.numero + ', Setor ' + UDeclaracao.setor;

  cn:= Copy(cnpj,1,2)+'.'+Copy(cnpj,3,3)+'.'+Copy(cnpj,6,3)+'/'+ Copy(cnpj,9,4)+'-'+Copy(cnpj,13,2);

  if Length(FrmPedido_Venda.LblCPF.Caption) = 11 then
    cp:= TConfigs.FormataCPF(FrmPedido_Venda.LblCPF.Caption)
  else if Length(FrmPedido_Venda.LblCPF.Caption) = 14 then
    cp:= TConfigs.FormataCNPJ(FrmPedido_Venda.LblCPF.Caption)
  else
    cp:= '';

  LblEmpresa.Caption:= razao_social;
  LblCNPJ.Caption:= cn;
  LblTelefone.Caption:= telefone;
  LblCidade.Caption:= Cidade;
  LblEndereco.Caption:= endereco_empresa;
  LblInscricao_Estadual.Caption:= insc_estadual;
  LblInscricao_Municipal.Caption:= insc_municipal;
  LblResponsavel.Caption:= proprietario;

  LblCliente.Caption:= FrmPedido_Venda.EdtCliente.Text;
  LblCPF_Cliente.Caption:= cp;
  LblTelefone_Cliente.Caption:= FrmPedido_Venda.LblTelefone.Caption;
  LblCidade_Cliente.Caption:= FrmPedido_Venda.LblCidade.Caption;
  LblEndereco_Cliente.Caption:= FrmPedido_Venda.LblEndereco.Caption + ', nº ' + FrmPedido_Venda.LblNumero.Caption;
  LblSetor_Cliente.Caption:= FrmPedido_Venda.LblSetor.Caption;
  LblCEP.Caption:= FrmPedido_Venda.LblCEP.Caption;

  LblN_Documento.Caption:= FrmPedido_Venda.EdtN_Pedido.Text;
  LblN_Documento_Fiscal.Caption:= '';

  LblAtendente.Caption:= FrmPedido_Venda.EdtAtendente.Text;
  LblQtde_Itens.Caption:= FrmPedido_Venda.EdtQuantidade_Itens.Text;
  LblValor_Total.Caption:= FrmPedido_Venda.EdtTotal_Pedido.Text;
  lblForma_Pagamento.Caption:= FrmPedido_Venda.EdtForma_Pagamento.Text;
  LblValor_Bruto.Caption:= FrmPedido_Venda.EdtTotal_Produtos.Text;
  LblTotal_Desconto.Caption:= FrmPedido_Venda.EdtDesc_Acr_Total.Text;
end;

end.
