unit URel_Consulta_Inventario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt, QRExport;

type
  TFrmRel_Consulta_Inventario = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBData_Vencimento: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand1: TQRBand;
    ADOQuery1: TADOQuery;
    QRDBText8: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    ADOQuery1Codigo_Venda: TStringField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Valor_Compra: TFloatField;
    ADOQuery1Estoque: TFloatField;
    ADOQuery1Saldo: TFloatField;
    ADOQuery1Unidade: TStringField;
    QRHRule1: TQRHRule;
    QRExcelFilter1: TQRExcelFilter;
    LblSub_Total: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    valor_total: Double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Inventario: TFrmRel_Consulta_Inventario;

implementation

uses UGeral, UDeclaracao, UConsulta_Saldo_Estoque, UDM, UConsulta_Inventario;

{$R *.dfm}

procedure TFrmRel_Consulta_Inventario.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if (QRDBText6.DataSet.FieldByName('Saldo').Value <> NULL) then
  begin
    valor_total:= valor_total + StrToFloat(QRDBText6.DataSet.FieldByName('Saldo').Value);
  end;
  LblSub_Total.Caption := FormatFloat('#0.0,0', valor_total);
end;

procedure TFrmRel_Consulta_Inventario.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Inventario.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  {with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select P.Codigo_Venda, P.Descricao, P.Valor_Compra, P.Estoque,');
    add('sum(P.Valor_Compra * P.Estoque) as Saldo, UM.Sigla as Unidade');
    add('from Produto P');
    add('left join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');

    if (FrmConsulta_Inventario.RGOrdena_Por.ItemIndex = 0) then
    begin
      Add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo ');
      Add('group by P.Codigo_Venda, P.Descricao, P.Valor_Compra, P.Estoque, UM.Sigla order by P.Codigo_Venda');
    end
    else
    begin
      Add('where P.Codigo_Empresa = :Empresa and P.Status = :Status and P.Tipo = :Tipo');
      Add('group by P.Codigo_Venda, P.Descricao, P.Valor_Compra, P.Estoque, UM.Sigla order by P.Descricao');
    end;

    Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
    Parameters.ParamByName('Status').Value:= 'ATIVO';
    Parameters.ParamByName('Tipo').Value:= 0;
    open;
  end;}
end;

end.

