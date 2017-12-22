unit URel_Balanco_Estoque_Grupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Balanco_Estoque_Grupo = class(TForm)
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
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRBand1: TQRBand;
    ADOQuery1: TADOQuery;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    QRExpr1: TQRExpr;
    QRDBText2: TQRDBText;
    ADOQuery1Codigo_Venda: TStringField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Estoque: TFloatField;
    ADOQuery1Valor_Compra: TFloatField;
    ADOQuery1Unidade: TStringField;
    ADOQuery1Total: TFloatField;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRExpr3: TQRExpr;
    QRGroup1: TQRGroup;
    ChildBand1: TQRChildBand;
    QRLabel15: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRBand2: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel7: TQRLabel;
    QRExpr5: TQRExpr;
    QRDBText5: TQRDBText;
    ADOQuery1Grupo: TStringField;
    ADOQuery1Codigo_Grupo: TIntegerField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Balanco_Estoque_Grupo: TFrmRel_Balanco_Estoque_Grupo;

implementation

uses UGeral, UDeclaracao, UConsulta_Saldo_Estoque, UDM,
  UConsulta_Contagem_Estoque;

{$R *.dfm}

procedure TFrmRel_Balanco_Estoque_Grupo.FormCreate(Sender: TObject);
begin
//  if (FrmEscolha_Impressao.preview = true) then
    QuickRep1.Preview;
end;

procedure TFrmRel_Balanco_Estoque_Grupo.QuickRep1BeforePrint(Sender: TCustomQuickRep;
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
      sql.add('select P.Codigo_Venda, P.Descricao, P.Estoque, P.Valor_Compra, P.Codigo_Grupo, GP.Descricao as Grupo,');
      sql.add('UM.Sigla as Unidade, sum(P.Estoque * P.Valor_Compra) as Total from Produto P');
      sql.add('left join Unidade_Medida UM on(P.Codigo_Unidade_Medida = UM.Codigo)');
      sql.add('left join Grupo_Produto GP on (P.Codigo_Grupo = GP.Codigo)');
      sql.add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo');
      sql.add('group by P.Descricao, P.Codigo_Venda, P.Estoque, P.Valor_Compra, P.Codigo_Grupo, GP.Descricao, UM.Sigla order by GP.Descricao, P.Descricao');

      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('Status').Value:= 'ATIVO';
      Parameters.ParamByName('Tipo').Value:= 0;
      open;

    end;
end;

end.
