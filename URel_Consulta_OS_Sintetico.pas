unit URel_Consulta_OS_Sintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_OS_Sintetico = class(TForm)
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
    QRBand3: TQRBand;
    ADOQuery1: TADOQuery;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRBand2: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel45: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText17: TQRDBText;
    LblConsulta_Lancamento: TQRLabel;
    QRLabel6: TQRLabel;
    LblParametro: TQRLabel;
    QRLabel13: TQRLabel;
    LblData: TQRLabel;
    QRLabel4: TQRLabel;
    LblStatus_OS: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    ChildBand2: TQRChildBand;
    QRLabel20: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel1: TQRLabel;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1N_Pedido: TStringField;
    ADOQuery1Data_Venda: TDateTimeField;
    ADOQuery1Total_Pedido: TFloatField;
    ADOQuery1Total_Produtos: TFloatField;
    ADOQuery1Total_Servicos: TFloatField;
    ADOQuery1Cliente: TStringField;
    ADOQuery1Veiculo: TStringField;
    ADOQuery1Funcionario: TStringField;
    QRDBText1: TQRDBText;
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
  FrmRel_Consulta_OS_Sintetico: TFrmRel_Consulta_OS_Sintetico;

implementation

uses UGeral, UDeclaracao, UConsulta_OS;

{$R *.dfm}

procedure TFrmRel_Consulta_OS_Sintetico.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_OS_Sintetico.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  {if FrmConsulta_Venda.DBGrid1.SelectedRows.CurrentRowSelected then
    PrintBand:= true
  else
    PrintBand:= false; }
end;

procedure TFrmRel_Consulta_OS_Sintetico.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;
  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  LblStatus_OS.Caption:= FrmConsulta_OS.CmbStatus.Text;

  LblData.Caption:= 'De ' + FrmConsulta_OS.MEdtData_Inicial.Text + ' a ' + FrmConsulta_OS.MEdtData_Final.Text;

  if (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 1) then
  begin
    LblParametro.Enabled:= true;
    LblParametro.Caption:= FrmConsulta_OS.EdtDAV_OS.Text;
  end
  else if (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 2) or (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 3) then
  begin
    LblParametro.Enabled:= true;
    LblParametro.Caption:= FrmConsulta_OS.EdtCliente.Text;
  end
  else
    LblParametro.Enabled:= false;

  if (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 0) then
    LblConsulta_Lancamento.Caption:= 'Tudo'
  else if (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 1) then
    LblConsulta_Lancamento.Caption:= 'Nº DAV'
  else if (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 2) then
    LblConsulta_Lancamento.Caption:= 'Cliente'
  else if (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 3) then
    LblConsulta_Lancamento.Caption:= 'Atendente';

  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select P.Codigo, P.N_Pedido, P.Data_Venda, P.Total_Pedido, P.Total_Produtos, P.Total_Servicos,');
    add('C.Nome_Nome_Fantasia as Cliente, (V.Veiculo + ' + QuotedStr(' - ') +' + V.Placa) as Veiculo, Fun.Nome as Funcionario from Pedido P');
    add('left join Cliente C on (C.Codigo = P.Codigo_Cliente)');
    add('left join Veiculo V on (V.Codigo = P.Codigo_Veiculo)');
    add('left join Funcionario Fun on (P.Codigo_Funcionario = Fun.Codigo)');

    case (FrmConsulta_OS.RGConsulta_Por.ItemIndex) of
      0: Add('where P.Codigo_Empresa = :Empresa and P.Status_OS = :Status_OS');
      1: Add('where P.N_Pedido = :Pedido and P.Codigo_Empresa = :Empresa and P.Status_OS = :Status_OS');
      2: Add('where P.Codigo_Cliente = :Cliente and P.Codigo_Empresa = :Empresa and P.Status_OS = :Status_OS');
      3: Add('where P.Codigo_Funcionario = :Cliente and P.Codigo_Empresa = :Empresa and P.Status_OS = :Status_OS');
    end;

    case (FrmConsulta_OS.RGData.ItemIndex) of
      0: Add('and Data_Venda between :DI and :DF');
      1: Add('and Data_Previsao_Entrega between :DI and :DF');
      2: Add('and Data_Entrega between :DI and :DF');
    end;

    case (FrmConsulta_OS.RGOrdena_Por.ItemIndex) of
      0: Add('order by Data_Venda');
      1: Add('order by Data_Previsao_Entrega');
      2: Add('order by Data_Entrega');
      3: Add('order by C.Nome_Nome_Fantasia');
    end;

    if (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 2) or (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 3) then
    begin
      Parameters.ParamByName('Cliente').Value:= StrToInt(FrmConsulta_OS.EdtCodigo_Cliente.Text);
    end
    else if (FrmConsulta_OS.RGConsulta_Por.ItemIndex = 1) then
    begin
      Parameters.ParamByName('Pedido').Value:= FrmConsulta_OS.EdtDAV_OS.Text;
    end;

    Parameters.ParamByName('Empresa').Value:= Codigo_Empresa;
    //Parameters.ParamByName('Tipo').Value:= 'DAV';
    Parameters.ParamByName('Status_OS').Value:= FrmConsulta_OS.CmbStatus.KeyValue;
    Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_OS.MEdtData_Inicial.Text);
    Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_OS.MEdtData_Final.Text);

    open;
  end;

end;
end.
