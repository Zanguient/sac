unit URel_Consulta_Comissao_Lucratividade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Comissao_Lucratividade = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
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
    LblConsulta_Lancamento: TQRLabel;
    QRLabel6: TQRLabel;
    LblParametro: TQRLabel;
    QRLabel13: TQRLabel;
    LblData: TQRLabel;
    QRChildBand1: TQRChildBand;
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRBand2: TQRBand;
    QRLabel45: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText12: TQRDBText;
    qryconsulta: TADOQuery;
    QRLabel1: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    qryconsultaNome: TStringField;
    qryconsultaValor_Compra: TFloatField;
    qryconsultaValor_Venda: TFloatField;
    qryconsultaTotal: TFloatField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Comissao_Lucratividade: TFrmRel_Consulta_Comissao_Lucratividade;

implementation

uses UGeral, UDeclaracao, UConsulta_Comissao;

{$R *.dfm}

procedure TFrmRel_Consulta_Comissao_Lucratividade.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Comissao_Lucratividade.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  {if FrmConsulta_Venda.DBGrid1.SelectedRows.CurrentRowSelected then
    PrintBand:= true
  else
    PrintBand:= false; }
end;

procedure TFrmRel_Consulta_Comissao_Lucratividade.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  if (FrmConsulta_Comissao.RGConsulta_Por.ItemIndex = 0) then
  begin
    LblConsulta_Lancamento.Caption:= 'Tudo';
    LblParametro.Enabled:= false;
  end
  else
  begin
    LblConsulta_Lancamento.Caption:= 'Funcionário';
    LblParametro.Enabled:= true;
    LblParametro.Caption:= FrmConsulta_Comissao.EdtFuncionario.Text;
  end;

  LblData.Caption:= 'De ' + FrmConsulta_Comissao.MEdtData_Inicial.Text + ' a ' + FrmConsulta_Comissao.MEdtData_Final.Text;

  with qryconsulta do
    begin
      close;
      sql.clear;
      sql.add('select F.Nome, sum(IP.Valor_Compra * IP.Qtde) as Valor_Compra, sum(IP.Valor_Unitario * IP.Qtde) as Valor_Venda,');
      sql.add('( sum(IP.Valor_Compra * IP.Qtde) / sum(IP.Valor_Unitario * IP.Qtde) *100 ) as Total from Itens_Pedido IP');
      sql.add('left join Pedido P on (IP.Codigo = P.Codigo)');
      sql.add('left join Funcionario F on (P.Codigo_Funcionario = F.Codigo)');
      sql.add('where month(P.Data_Venda) between :m1 and :m2 and year(P.Data_Venda) between :a1 and :a2 and P.Status = :Status');
      sql.add('group by P.Codigo_Funcionario, F.Nome');

      Parameters.ParamByName('m1').Value:= FrmConsulta_Comissao.mes1;
      Parameters.ParamByName('m2').Value:= FrmConsulta_Comissao.mes2;
      Parameters.ParamByName('a1').Value:= FrmConsulta_Comissao.ano1;
      Parameters.ParamByName('a2').Value:= FrmConsulta_Comissao.ano2;
      Parameters.ParamByName('Status').Value:= 'PAGO';
      open;
    end;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

end;
end.
