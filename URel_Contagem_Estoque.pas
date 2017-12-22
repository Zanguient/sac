unit URel_Contagem_Estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Contagem_Estoque = class(TForm)
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
    QRChildBand1: TQRChildBand;
    QRLabel5: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel3: TQRLabel;
    QRBand1: TQRBand;
    ADOQuery1: TADOQuery;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    ADOQuery1Codigo_Venda: TStringField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Estoque: TFloatField;
    ADOQuery1Marca: TStringField;
    QRLabel1: TQRLabel;
    QRExpr1: TQRExpr;
    ADOQuery1Nome_Fantasia: TStringField;
    QRDBData_Vencimento: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Contagem_Estoque: TFrmRel_Contagem_Estoque;

implementation

uses UGeral, UDeclaracao, UConsulta_Saldo_Estoque, UDM,
  UConsulta_Contagem_Estoque;

{$R *.dfm}

procedure TFrmRel_Contagem_Estoque.FormCreate(Sender: TObject);
begin
//  if (FrmEscolha_Impressao.preview = true) then
    QuickRep1.Preview;
end;

procedure TFrmRel_Contagem_Estoque.QuickRep1BeforePrint(Sender: TCustomQuickRep;
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
      sql.add('select P.Codigo_Venda, P.Descricao, P.Estoque, M.Descricao as Marca, F.Nome_Fantasia from Produto P');
      sql.add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
      sql.add('left join Fornecedor F on (P.Codigo_Fornecedor = F.Codigo)');

      sql.add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo order by P.Descricao');

      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('Status').Value:= 'ATIVO';
      Parameters.ParamByName('Tipo').Value:= 0;
      open;

    end;
end;

end.
