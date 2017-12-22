unit URel_Consulta_Lucratividade_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Lucratividade_Produto = class(TForm)
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
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    ADOQuery1: TADOQuery;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    ADOQuery1Codigo_venda: TStringField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Qtde: TFloatField;
    ADOQuery1Total_vendido: TFloatField;
    ADOQuery1Custo_total: TFloatField;
    ADOQuery1lucratividade: TFloatField;
    ADOQuery1percentual: TFloatField;
    ADOQuery1lucratividade_unitaria: TFloatField;
    QRBand2: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel1: TQRLabel;
    LblValor_Total_Vendido: TQRLabel;
    LblCusto_Medio_Total: TQRLabel;
    LblLucro_Total: TQRLabel;
    LblP_Total: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRDBText2Print(sender: TObject; var Value: string);
    procedure QRDBText4Print(sender: TObject; var Value: string);
    procedure QRDBText5Print(sender: TObject; var Value: string);
    procedure QRDBText3Print(sender: TObject; var Value: string);
  private
    { Private declarations }
    total_vendido, custo_medio, lucro_total, p_total: double;
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Lucratividade_Produto: TFrmRel_Consulta_Lucratividade_Produto;

implementation

uses UGeral, UDeclaracao, UConsulta_Lucratividade_Produto;

{$R *.dfm}

procedure TFrmRel_Consulta_Lucratividade_Produto.FormCreate(Sender: TObject);
begin
//  if (FrmEscolha_Impressao.preview = true) then
    QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Lucratividade_Produto.QRDBText2Print(sender: TObject;
  var Value: string);
begin
  total_vendido:= total_vendido + StrToFloat(QRDBText2.DataSet.FieldByName('Total_Vendido').Value);
  LblValor_Total_Vendido.Caption := FormatFloat('#0.0,0', total_vendido);
end;

procedure TFrmRel_Consulta_Lucratividade_Produto.QRDBText3Print(sender: TObject;
  var Value: string);
begin
  p_total:= p_total + StrToFloat(QRDBText3.DataSet.FieldByName('percentual').Value);
  LblP_Total.Caption := FormatFloat('#0.0,0', p_total);
end;

procedure TFrmRel_Consulta_Lucratividade_Produto.QRDBText4Print(sender: TObject;
  var Value: string);
begin
  custo_medio:= custo_medio + StrToFloat(QRDBText4.DataSet.FieldByName('Custo_Total').Value);
  LblCusto_Medio_Total.Caption := FormatFloat('#0.0,0', custo_medio);
end;

procedure TFrmRel_Consulta_Lucratividade_Produto.QRDBText5Print(sender: TObject;
  var Value: string);
begin
  lucro_total:= lucro_total + StrToFloat(QRDBText5.DataSet.FieldByName('Lucratividade').Value);
  LblLucro_Total.Caption := FormatFloat('#0.0,0', lucro_total);
end;

procedure TFrmRel_Consulta_Lucratividade_Produto.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  total_vendido:= 0;
  custo_medio:= 0;
  lucro_total:= 0;
  p_total:= 0;

    {with ADOQuery1 do
    begin
      close;
      sql.clear;
      sql.add('select          Y.Codigo_venda,');
      sql.add('	   Y.Descricao,');
      sql.add('	   Y.Qtde,');
      sql.add('	   Y.Total_vendido,');
      sql.add('	   Y.Custo_total,');
      sql.add('    (Y.Total_vendido - Y.Custo_total) as lucratividade,');
      sql.add('	   ((Y.custo_total / Y.totalgeral)*100) as percentual,');
      sql.add('    ((Y.Total_vendido - Y.Custo_total) / Y.Qtde) as lucratividade_unitaria from');

      sql.add('    (select Pro.Codigo_Venda AS CODIGO_VENDA,');
      sql.add('    Pro.Descricao AS DESCRICAO,');
      sql.add('    sum(IP.Qtde) as Qtde,');
      sql.add('    sum(IP.Sub_Total_Liquido) as Total_Vendido,');
      sql.add('    (sum(IP.Valor_Compra * IP.Qtde)) as Custo_Total,');

      sql.add('    (select sum(t.Sub_Total_Liquido) from Itens_Pedido t');
      sql.add('    left join Pedido Ped on (t.Codigo = Ped.Codigo)');
      sql.add('    where Ped.Data_Venda between :DI1 and :DF1 and (Ped.Tipo = :Tipo1 or Ped.Tipo = :Tipo2) and Ped.Status = :Status1 and IP.Cancelado = '+QuotedStr('N')+') as totalgeral');

      sql.add('from Itens_Pedido IP');
      sql.add('left join Produto Pro on (Pro.Codigo = IP.Codigo_Produto)');
      sql.add('left join Pedido Ped on (IP.Codigo = Ped.Codigo)');
      sql.add('where Ped.Data_Venda between :DI2 and :DF2 and (Ped.Tipo = :Tipo1 or Ped.Tipo = :Tipo2) and Ped.Status = :Status2 and IP.Cancelado = '+QuotedStr('N')+'');
      sql.add('group by Pro.Codigo_Venda, Pro.Descricao, IP.Valor_Compra) Y');

      if (FrmConsulta_Lucratividade_Produto.RGTipo.ItemIndex = 0) then
      begin
        Parameters.ParamByName('Tipo1').Value:= 'PDV';
        Parameters.ParamByName('Tipo2').Value:= 'NFE';
        Parameters.ParamByName('Tipo3').Value:= 'PDV';
        Parameters.ParamByName('Tipo4').Value:= 'NFE';
      end
      else if (FrmConsulta_Lucratividade_Produto.RGTipo.ItemIndex = 1) then
      begin
        Parameters.ParamByName('Tipo1').Value:= 'PDV';
        Parameters.ParamByName('Tipo2').Value:= 'PDV';
        Parameters.ParamByName('Tipo3').Value:= 'PDV';
        Parameters.ParamByName('Tipo4').Value:= 'PDV';
      end
      else if (FrmConsulta_Lucratividade_Produto.RGTipo.ItemIndex = 2) then
      begin
        Parameters.ParamByName('Tipo1').Value:= 'NFE';
        Parameters.ParamByName('Tipo2').Value:= 'NFE';
        Parameters.ParamByName('Tipo3').Value:= 'NFE';
        Parameters.ParamByName('Tipo4').Value:= 'NFE';
      end;

      Parameters.ParamByName('DI1').Value:= StrToDateTime(FrmConsulta_Lucratividade_Produto.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF1').Value:= StrToDateTime(FrmConsulta_Lucratividade_Produto.MEdtData_Final.Text);
      Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Lucratividade_Produto.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Lucratividade_Produto.MEdtData_Final.Text);
      Parameters.ParamByName('Status1').Value:= 'PAGO';
      Parameters.ParamByName('Status2').Value:= 'PAGO';
      open;
    end;}
end;

end.
