unit URel_Lista_Separacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Lista_Separacao = class(TForm)
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
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
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
    LblObservacao: TQRLabel;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel25: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel32: TQRLabel;
    LblResponsavel: TQRLabel;
    ADOQuery1: TADOQuery;
    ADOQuery1Codigo_Venda: TStringField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Qtde: TFloatField;
    ADOQuery1Marca: TStringField;
    ADOQuery1Local: TStringField;
    QRLabel8: TQRLabel;
    QRExpr2: TQRExpr;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRDBText5Print(sender: TObject; var Value: string);
  private
    { Private declarations }
    qtde_total: double;
    CodigoPedido: integer;
    Observacao: AnsiString;
  public
    constructor Create(CodigoPedido: integer; Observacao: AnsiString);
    { Public declarations }
  end;

var
  FrmRel_Lista_Separacao: TFrmRel_Lista_Separacao;

implementation

uses UDM, UGeral, UPDV, UFechamento_Venda_PDV, UDeclaracao,
  UCarrega_Pedido_Caixa, UPedido_Venda;

{$R *.dfm}

constructor TFrmRel_Lista_Separacao.Create(CodigoPedido: integer; Observacao: AnsiString);
begin
  self.CodigoPedido := CodigoPedido;
  self.Observacao := Observacao;
  inherited Create(nil);
end;

procedure TFrmRel_Lista_Separacao.FormCreate(Sender: TObject);
var
  i: integer;
begin
  {if (caminho_pedido_pdf <> '') then
  begin
    QuickRep1.ExportToFilter(TQRPDFDocumentFilter.Create(caminho_pedido_pdf+FrmPedido_Venda.EdtCliente.Text+FrmPedido_Venda.EdtN_Pedido.Text+'.pdf'));
  end;
  qtde_total:= 0;}

  //for i := 1 to qtde_copias do
  //begin
    //QuickRep1.Print;
  //end;
  QuickRep1.Preview;
end;

procedure TFrmRel_Lista_Separacao.QRDBText5Print(sender: TObject;
  var Value: string);
begin
  //qtde_total:= qtde_total + StrToFloat(Value);
end;

procedure TFrmRel_Lista_Separacao.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var
    i: integer;
    texto: string;
    endereco_cliente, setor_cliente, endereco_empresa, cn, cp: AnsiString;
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblTelefone_Rodape.Caption:= telefone_relatorio;

  //endereco_cliente:= FrmPedido_Venda.LblTipo_Logradouro.Caption + ' ' + FrmPedido_Venda.LblEndereco.Caption + ', Nº ' + FrmPedido_Venda.LblNumero.Caption;
  //setor_cliente:= FrmPedido_Venda.LblSetor.Caption;

  endereco_empresa:= UDeclaracao.tipo_endereco + ' ' + UDeclaracao.endereco + ', Nº ' + UDeclaracao.numero + ', Setor ' + UDeclaracao.setor;

  cn:= Copy(cnpj,1,2)+'.'+Copy(cnpj,3,3)+'.'+Copy(cnpj,6,3)+'/'+ Copy(cnpj,9,4)+'-'+Copy(cnpj,13,2);

  //cp:= Copy(FrmPedido_Venda.LblCPF.Caption,1,3)+'.'+Copy(FrmPedido_Venda.LblCPF.Caption,4,3)+'.'+Copy(FrmPedido_Venda.LblCPF.Caption,7,3)+'-'+ Copy(FrmPedido_Venda.LblCPF.Caption,10,2);

  LblEmpresa.Caption:= razao_social;
  LblCNPJ.Caption:= cn;
  LblTelefone.Caption:= telefone;
  LblCidade.Caption:= Cidade;
  LblEndereco.Caption:= endereco_empresa;
  LblInscricao_Estadual.Caption:= insc_estadual;
  LblInscricao_Municipal.Caption:= insc_municipal;
  LblResponsavel.Caption:= proprietario;
  LblObservacao.Caption:= Observacao;

  with ADOQuery1, sql do
  begin
    Close;
    clear;
    Add('select IP.Codigo_Venda, IP.Descricao, IP.Qtde, M.Descricao as Marca, L.Local from Itens_Pedido IP');
    Add('left join Produto P on (IP.Codigo_Produto = P.Codigo)');
    Add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
    Add('left join Localidade_Produto L on (P.Codigo_Local = L.Codigo)');
    add('where IP.Codigo = :Codigo and IP.Cancelado = :N');
    Parameters.ParamByName('Codigo').Value:= Self.CodigoPedido;
    Parameters.ParamByName('N').Value:= 'N';
    open;
  end;

end;

end.
