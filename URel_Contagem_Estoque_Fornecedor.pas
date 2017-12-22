unit URel_Contagem_Estoque_Fornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Contagem_Estoque_Fornecedor = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText1: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRBand1: TQRBand;
    ADOQuery1: TADOQuery;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    ADOQuery1Codigo_Venda: TStringField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Estoque: TFloatField;
    ADOQuery1Marca: TStringField;
    QRExpr1: TQRExpr;
    ADOQuery1Nome_Fantasia: TStringField;
    QRDBText2: TQRDBText;
    QRGroup1: TQRGroup;
    ChildBand1: TQRChildBand;
    QRLabel15: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    ADOQuery1Codigo_Fornecedor: TIntegerField;
    QRDBText3: TQRDBText;
    QRBand2: TQRBand;
    QRLabel4: TQRLabel;
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
  FrmRel_Contagem_Estoque_Fornecedor: TFrmRel_Contagem_Estoque_Fornecedor;

implementation

uses UGeral, UDeclaracao, UConsulta_Saldo_Estoque, UDM,
  UConsulta_Contagem_Estoque;

{$R *.dfm}

procedure TFrmRel_Contagem_Estoque_Fornecedor.FormCreate(Sender: TObject);
begin
//  if (FrmEscolha_Impressao.preview = true) then
    QuickRep1.Preview;
end;

procedure TFrmRel_Contagem_Estoque_Fornecedor.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  with ADOQuery1 do
  begin
    close;
    sql.clear;
    sql.add('select P.Codigo_Venda, P.Descricao, P.Estoque, M.Descricao as Marca, P.Codigo_Fornecedor, F.Nome_Fantasia from Produto P');
    sql.add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
    sql.add('left join Fornecedor F on (P.Codigo_Fornecedor = F.Codigo)');

    sql.add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo order by F.Nome_Fantasia, P.Descricao');

    Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
    Parameters.ParamByName('Status').Value:= 'ATIVO';
    Parameters.ParamByName('Tipo').Value:= 0;
    //Parameters.ParamByName('Parametro').Value:= StrToInt(FrmConsulta_Contagem_Estoque.EdtCodigo.Text);
    open;

  end;
end;

end.
