unit URel_Consulta_Lucratividade_Grupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Lucratividade_Grupo = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
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
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    ADOQuery1: TADOQuery;
    QRDBText8: TQRDBText;
    QRDBText11: TQRDBText;
    QRBand2: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel1: TQRLabel;
    ADOQuery1Codigo_Grupo: TIntegerField;
    ADOQuery1Descricao_grupo: TStringField;
    ADOQuery1Total_Vendido: TFloatField;
    ADOQuery1Qtde: TFloatField;
    ADOQuery1Custo_total: TFloatField;
    ADOQuery1lucratividade: TFloatField;
    ADOQuery1percentual: TFloatField;
    ADOQuery1lucratividade_unitaria: TFloatField;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
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
    total_vendido, custo_medio, lucro_total, p_total: double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Lucratividade_Grupo: TFrmRel_Consulta_Lucratividade_Grupo;

implementation

uses UGeral, UDeclaracao, UConsulta_Lucratividade_Grupo;

{$R *.dfm}

procedure TFrmRel_Consulta_Lucratividade_Grupo.FormCreate(Sender: TObject);
begin
//  if (FrmEscolha_Impressao.preview = true) then
    QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Lucratividade_Grupo.QRDBText2Print(sender: TObject;
  var Value: string);
begin
  total_vendido:= total_vendido + StrToFloat(QRDBText2.DataSet.FieldByName('Total_Vendido').Value);
  LblValor_Total_Vendido.Caption := FormatFloat('#0.0,0', total_vendido);
end;

procedure TFrmRel_Consulta_Lucratividade_Grupo.QRDBText3Print(sender: TObject;
  var Value: string);
begin
  p_total:= p_total + StrToFloat(QRDBText3.DataSet.FieldByName('percentual').Value);
  LblP_Total.Caption := FormatFloat('#0.0,0', p_total);
end;

procedure TFrmRel_Consulta_Lucratividade_Grupo.QRDBText4Print(sender: TObject;
  var Value: string);
begin
  custo_medio:= custo_medio + StrToFloat(QRDBText4.DataSet.FieldByName('Custo_Total').Value);
  LblCusto_Medio_Total.Caption := FormatFloat('#0.0,0', custo_medio);
end;

procedure TFrmRel_Consulta_Lucratividade_Grupo.QRDBText5Print(sender: TObject;
  var Value: string);
begin
  lucro_total:= lucro_total + StrToFloat(QRDBText5.DataSet.FieldByName('Lucratividade').Value);
  LblLucro_Total.Caption := FormatFloat('#0.0,0', lucro_total);
end;

procedure TFrmRel_Consulta_Lucratividade_Grupo.QuickRep1BeforePrint(Sender: TCustomQuickRep;
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
      sql.add('select * from (');
      sql.add('select H.Codigo_Grupo,');
      sql.add('	   H.Descricao_Grupo,');
      sql.add('	   H.Total_Vendido,');
      sql.add('	   H.Qtde,');
      sql.add('	   H.Custo_total,');
      sql.add('    (H.Total_vendido - H.Custo_total) as lucratividade,');
      sql.add('	   ((H.custo_total / H.totalgeral)*100) as percentual,');
      sql.add('    ((H.Total_vendido - H.Custo_total) / H.Qtde) as lucratividade_unitaria');
      sql.add('FROM(');
      sql.add('select Y.Codigo_Grupo,');
      sql.add('	   Y.Descricao_Grupo,');
      sql.add('	   sum(Y.Qtde) Qtde,');
      sql.add('	   sum(Y.Total_vendido) Total_vendido,');
      sql.add('	   sum(Y.Custo_total) Custo_total,');
      sql.add('	   sum(Y.totalgeral) totalgeral');
      sql.add('from(');
      sql.add('select Pro.Codigo_Venda AS CODIGO_VENDA,');
      sql.add('          Pro.Descricao AS DESCRICAO,');
      sql.add('          Pro.Codigo_Grupo as Codigo_Grupo,');
      sql.add('          Gru.Descricao as Descricao_Grupo,');
      sql.add('          sum(IP.Qtde) as Qtde,');
      sql.add('          sum(IP.Sub_Total_Liquido) as Total_Vendido,');
      sql.add('          (sum(IP.Valor_Compra * IP.Qtde)) as Custo_Total,');

      sql.add('          (select sum(t.Sub_Total_Liquido) from Itens_Pedido t');
      sql.add('          left join Pedido Ped on (t.Codigo = Ped.Codigo)');
      sql.add('          where Ped.Data_Venda between :DI1 and :DF1 and Ped.Status = :Status1) as totalgeral');

      sql.add('from Itens_Pedido IP');
      sql.add('left join Produto Pro on (Pro.Codigo = IP.Codigo_Produto)');
      sql.add('left join Pedido Ped on (IP.Codigo = Ped.Codigo)');
      sql.add('left join Grupo_Produto Gru on (Gru.Codigo = Pro.Codigo_Grupo)');

      sql.add('where Ped.Data_Venda between :DI2 and :DF2 and Ped.Status = :Status2');
      sql.add('group by Pro.Codigo_Venda,Pro.Descricao,Pro.Codigo_Grupo, Gru.Descricao, IP.Valor_Compra) Y');
      sql.add('group by Y.Codigo_grupo,Y.Descricao_Grupo) H ) U');

      if (FrmConsulta_Lucratividade_Grupo.RGOrdena_Por.ItemIndex = 0) then
        sql.add('order by Descricao_Grupo desc')
      else if (FrmConsulta_Lucratividade_Grupo.RGOrdena_Por.ItemIndex = 1) then
        sql.add('order by Qtde desc')
      else if (FrmConsulta_Lucratividade_Grupo.RGOrdena_Por.ItemIndex = 2) then
        sql.add('order by Total_vendido desc')
      else if (FrmConsulta_Lucratividade_Grupo.RGOrdena_Por.ItemIndex = 3) then
        sql.add('order by Custo_Total desc')
      else if (FrmConsulta_Lucratividade_Grupo.RGOrdena_Por.ItemIndex = 4) then
        sql.add('order by Lucratividade desc')
      else if (FrmConsulta_Lucratividade_Grupo.RGOrdena_Por.ItemIndex = 5) then
        sql.add('order by Percentual desc')
      else if (FrmConsulta_Lucratividade_Grupo.RGOrdena_Por.ItemIndex = 6) then
        sql.add('order by lucratividade_unitaria desc');

      Parameters.ParamByName('DI1').Value:= StrToDateTime(FrmConsulta_Lucratividade_Grupo.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF1').Value:= StrToDateTime(FrmConsulta_Lucratividade_Grupo.MEdtData_Final.Text);
      Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Lucratividade_Grupo.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Lucratividade_Grupo.MEdtData_Final.Text);
      Parameters.ParamByName('Status1').Value:= 'PAGO';
      Parameters.ParamByName('Status2').Value:= 'PAGO';
      open;
    end;}
end;

end.
