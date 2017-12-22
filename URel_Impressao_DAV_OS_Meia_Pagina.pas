unit URel_Impressao_DAV_OS_Meia_Pagina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Impressao_DAV_OS_Meia_Pagina = class(TForm)
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
    QRLabel4: TQRLabel;
    QRLabel12: TQRLabel;
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
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    LblAtendente: TQRLabel;
    LblQtde_Itens: TQRLabel;
    LblValor_Total: TQRLabel;
    lblForma_Pagamento: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    QRSubDetail1: TQRSubDetail;
    QRBand3: TQRBand;
    QRSubDetail2: TQRSubDetail;
    QRBand1: TQRBand;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel36: TQRLabel;
    LblQtde_Servicos: TQRLabel;
    QRBand5: TQRBand;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    LblVeiculo: TQRLabel;
    QRLabel40: TQRLabel;
    LblMarca: TQRLabel;
    QRLabel42: TQRLabel;
    LblPlaca: TQRLabel;
    QRLabel39: TQRLabel;
    LblRenavam: TQRLabel;
    QRLabel45: TQRLabel;
    LblModelo: TQRLabel;
    QRLabel47: TQRLabel;
    LblKM: TQRLabel;
    QRLabel49: TQRLabel;
    LblProblema: TQRLabel;
    QRHRule4: TQRHRule;
    LblSub_Total: TQRLabel;
    QRBand6: TQRBand;
    QRLabel41: TQRLabel;
    LblSub_Total_Servico: TQRLabel;
    LblObservacao: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel46: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    valor_produto, valor_servico: double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Impressao_DAV_OS_Meia_Pagina: TFrmRel_Impressao_DAV_OS_Meia_Pagina;

implementation

uses UDM, UGeral, UPDV, UFechamento_Venda_PDV, UDeclaracao,
  UCarrega_Pedido_Caixa, UPedido_Venda, Util.Configs;

{$R *.dfm}

procedure TFrmRel_Impressao_DAV_OS_Meia_Pagina.FormCreate(Sender: TObject);
var
  i: integer;
begin
  if (caminho_pedido_pdf <> '') then
  begin
    QuickRep1.ExportToFilter(TQRPDFDocumentFilter.Create(caminho_pedido_pdf+FrmPedido_Venda.EdtCliente.Text+FrmPedido_Venda.EdtN_Pedido.Text+'.pdf'));
  end;

  for i := 1 to qtde_copias do
  begin
    QuickRep1.Print;
  end;
end;

procedure TFrmRel_Impressao_DAV_OS_Meia_Pagina.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (QRDBText6.DataSet.FieldByName('Sub_Total').Value <> NULL) then
  begin
    valor_produto:= valor_produto + StrToFloat(QRDBText6.DataSet.FieldByName('Sub_Total').Value);
  end;
  LblSub_Total.Caption := FormatFloat('#0.0,0', valor_produto);
end;

procedure TFrmRel_Impressao_DAV_OS_Meia_Pagina.QRSubDetail2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (QRDBText12.DataSet.FieldByName('Sub_Total').Value <> NULL) then
  begin
    valor_servico:= valor_servico + StrToFloat(QRDBText12.DataSet.FieldByName('Sub_Total').Value);
  end;
  LblSub_Total_Servico.Caption := FormatFloat('#0.0,0', valor_servico);
end;

procedure TFrmRel_Impressao_DAV_OS_Meia_Pagina.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var
    i: integer;
    texto: string;
    endereco_cliente, setor_cliente, endereco_empresa, cn, cp: AnsiString;
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblTelefone_Rodape.Caption:= telefone_relatorio;

  valor_produto:= 0;
  valor_servico:= 0;
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

  LblEmpresa.Caption:= nome_fantasia;
  LblCNPJ.Caption:= cn;
  LblTelefone.Caption:= telefone;
  LblCidade.Caption:= Cidade;
  LblEndereco.Caption:= endereco_empresa;
  LblInscricao_Estadual.Caption:= insc_estadual;
  LblInscricao_Municipal.Caption:= insc_municipal;

  LblCliente.Caption:= FrmPedido_Venda.EdtCliente.Text;
  LblCPF_Cliente.Caption:= cp;
  LblTelefone_Cliente.Caption:= FrmPedido_Venda.LblTelefone.Caption;
  LblCidade_Cliente.Caption:= FrmPedido_Venda.LblCidade.Caption;
  LblEndereco_Cliente.Caption:= FrmPedido_Venda.LblEndereco.Caption + ', nº ' + FrmPedido_Venda.LblNumero.Caption;
  LblSetor_Cliente.Caption:= FrmPedido_Venda.LblSetor.Caption;

  LblN_Documento.Caption:= FrmPedido_Venda.EdtN_Pedido.Text;
  LblN_Documento_Fiscal.Caption:= '';

  LblAtendente.Caption:= FrmPedido_Venda.EdtAtendente.Text;
  LblQtde_Itens.Caption:= FrmPedido_Venda.EdtQuantidade_Itens.Text;
  LblQtde_Servicos.Caption:= FrmPedido_Venda.EdtQuantidade_Servicos.Text;
  LblValor_Total.Caption:= FrmPedido_Venda.EdtTotal_Pedido.Text;
  lblForma_Pagamento.Caption:= FrmPedido_Venda.EdtForma_Pagamento.Text;

  LblVeiculo.Caption:= dm.qryveiculoVeiculo.AsString;
  LblMarca.Caption:= dm.qryveiculoDescricao.AsString;
  LblPlaca.Caption:= dm.qryveiculoPlaca.AsString;
  LblRenavam.Caption:= dm.qryveiculoRenavam.AsString;
  LblModelo.Caption:= dm.qryveiculoModelo.AsString + ' - ' + dm.qryveiculoAno_Fabricacao.AsString;
  LblKM.Caption:= FrmPedido_Venda.EdtKilometragem.Text;
  LblProblema.Caption:= FrmPedido_Venda.MMOProblema.Text;
  LblObservacao.Caption:= FrmPedido_Venda.MmoObservacao.Text;
end;

end.
