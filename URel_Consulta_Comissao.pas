unit URel_Consulta_Comissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Comissao = class(TForm)
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
    QRLabel26: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText8: TQRDBText;
    qryconsulta: TADOQuery;
    qryconsultaNome: TStringField;
    qryconsultaSalario: TFloatField;
    qryconsultaTotal_Comissao: TFloatField;
    qryconsultaTotal_Salario: TFloatField;
    qryconsultaTotal_Pedido: TFloatField;
    QRLabel1: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel2: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
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
  FrmRel_Consulta_Comissao: TFrmRel_Consulta_Comissao;

implementation

uses UGeral, UDeclaracao, UConsulta_Comissao;

{$R *.dfm}

procedure TFrmRel_Consulta_Comissao.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Comissao.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  {if FrmConsulta_Venda.DBGrid1.SelectedRows.CurrentRowSelected then
    PrintBand:= true
  else
    PrintBand:= false; }
end;

procedure TFrmRel_Consulta_Comissao.QuickRep1BeforePrint(Sender: TCustomQuickRep;
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

  if (FrmConsulta_Comissao.RGConsulta_Por.ItemIndex = 0) then
  begin
    with qryconsulta do
      begin
        close;
        sql.clear;
        sql.add('select Fun.Nome, Fun.Salario, sum(IP.Valor_Unitario * IP.Qtde) as Total_Pedido,');
        sql.add('sum((IP.Valor_Unitario * IP.Qtde) * (IP.Comissao / 100)) as Total_Comissao,');
        sql.add('(Fun.Salario + sum((IP.Valor_Unitario * IP.Qtde) * (IP.Comissao / 100))) as Total_Salario from Pedido Ped');
        sql.add('left join Itens_Pedido IP on (Ped.Codigo = IP.Codigo)');
        sql.add('left join Funcionario Fun on (Ped.Codigo_Funcionario = Fun.Codigo)');
        sql.add('where Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and IP.Cancelado = :N');
        sql.add('group by Fun.Nome, Fun.Salario');
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Comissao.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Comissao.MEdtData_Final.Text);
        Parameters.ParamByName('Status').Value:= 'PAGO';
        Parameters.ParamByName('N').Value:= 'N';
        open;
      end;
  end
  else
  begin
    with qryconsulta do
      begin
        close;
        sql.clear;
        sql.add('select Fun.Nome, Fun.Salario, sum(IP.Valor_Unitario * IP.Qtde) as Total_Pedido,');
        sql.add('sum((IP.Valor_Unitario * IP.Qtde) * (IP.Comissao / 100)) as Total_Comissao,');
        sql.add('(Fun.Salario + sum((IP.Valor_Unitario * IP.Qtde) * (IP.Comissao / 100))) as Total_Salario from Pedido Ped');
        sql.add('left join Itens_Pedido IP on (Ped.Codigo = IP.Codigo)');
        sql.add('left join Funcionario Fun on (Ped.Codigo_Funcionario = Fun.Codigo)');
        sql.add('where Ped.Data_Venda between :DI and :DF and Ped.Codigo_Funcionario = :Funcionario and Ped.Status = :Status and IP.Cancelado = :N');
        sql.add('group by Fun.Nome, Fun.Salario');
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Comissao.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Comissao.MEdtData_Final.Text);
        Parameters.ParamByName('Funcionario').Value:= StrToInt(FrmConsulta_Comissao.EdtCodigo_Funcionario.Text);
        Parameters.ParamByName('Status').Value:= 'PAGO';
        Parameters.ParamByName('N').Value:= 'N';
        open;
      end;
  end;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

end;
end.
