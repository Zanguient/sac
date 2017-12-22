unit URel_Consulta_Venda_Agrupado_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Venda_Agrupado_Cliente = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
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
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel11: TQRLabel;
    Lblde: TQRLabel;
    Lbla: TQRLabel;
    QRLabel13: TQRLabel;
    QRChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBDescricao: TQRDBText;
    QRExpr1: TQRExpr;
    QRBand2: TQRBand;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel30: TQRLabel;
    QRHRule1: TQRHRule;
    qrydados_agrupados_cliente: TADOQuery;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    qrydados_agrupados_clienteCodCliente: TIntegerField;
    qrydados_agrupados_clienteNome_Nome_Fantasia: TStringField;
    qrydados_agrupados_clienteRazao_Social: TStringField;
    qrydados_agrupados_clienteCodigo: TIntegerField;
    qrydados_agrupados_clienteCodigo_Venda: TStringField;
    qrydados_agrupados_clienteDescricao: TStringField;
    qrydados_agrupados_clienteUN: TStringField;
    qrydados_agrupados_clienteQtde: TFloatField;
    qrydados_agrupados_clienteValor_Unitario: TFloatField;
    qrydados_agrupados_clienteSub_Total: TFloatField;
    qrydados_agrupados_clienteData_Venda: TDateTimeField;
    QRExpr3: TQRExpr;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Venda_Agrupado_Cliente: TFrmRel_Consulta_Venda_Agrupado_Cliente;

implementation

uses UChama_Lancamentos_Financeiros, UGeral, UEscolha_Impressao, UDM,
  UMenu_Geral, UDeclaracao, UConsulta_Venda;

{$R *.dfm}

procedure TFrmRel_Consulta_Venda_Agrupado_Cliente.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Venda_Agrupado_Cliente.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;
  //LblPropriedade.Caption:= FrmCarregar_Contas_Pagar.EdtPropriedade.Text;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  with qrydados_agrupados_cliente, sql do
  begin
    close;
    clear;
    add('select C.Codigo as CodCliente, C.Nome_Nome_Fantasia, C.Razao_Social, IP.Codigo, IP.Codigo_Venda, IP.Descricao, IP.UN, IP.Qtde,');
    add('IP.Valor_Unitario, IP.Sub_Total, Ped.Data_Venda from Itens_Pedido IP');
    add('left join Pedido Ped on (IP.Codigo = Ped.Codigo)');
    add('left join Produto P on (IP.Codigo_Produto = P.Codigo)');
    add('left join Cliente C on (Ped.Codigo_Cliente = C.Codigo)');
    Add('where Ped.Codigo_Empresa = :Empresa ');
    add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status');
    add('order by C.Nome_Nome_Fantasia, IP.Descricao');
    Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
    Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
    Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);
    if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
      Parameters.ParamByName('Status').Value:= 'PAGO'
    else
      Parameters.ParamByName('Status').Value:= 'PENDENTE';
    open;
  end

end;

end.
