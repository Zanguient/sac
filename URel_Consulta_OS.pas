unit URel_Consulta_OS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_OS = class(TForm)
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
    QRLabel4: TQRLabel;
    LblStatus: TQRLabel;
    QRLabel3: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    LblStatus_OS: TQRLabel;
    QRLabel37: TQRLabel;
    qryconsulta_os: TADOQuery;
    qryconsulta_osCodigo: TIntegerField;
    qryconsulta_osN_Pedido: TStringField;
    qryconsulta_osData_Venda: TDateTimeField;
    qryconsulta_osData_Vencimento: TDateTimeField;
    qryconsulta_osQtde_Itens: TIntegerField;
    qryconsulta_osQtde_Servicos: TIntegerField;
    qryconsulta_osTotal_Produtos: TFloatField;
    qryconsulta_osTotal_Servicos: TFloatField;
    qryconsulta_osTotal_Pedido: TFloatField;
    qryconsulta_osData_Previsao_Entrega: TDateTimeField;
    qryconsulta_osData_Entrega: TDateTimeField;
    qryconsulta_osKilometragem: TFloatField;
    qryconsulta_osCond_Pag: TStringField;
    qryconsulta_osCliente: TStringField;
    qryconsulta_osVeiculo: TStringField;
    qryconsulta_osFuncionario: TStringField;
    qryitens_os: TADOQuery;
    qryitens_osCodigo: TIntegerField;
    qryitens_osCodigo_Venda: TStringField;
    qryitens_osDescricao: TStringField;
    qryitens_osNCM: TStringField;
    qryitens_osQtde: TFloatField;
    qryitens_osValor_Unitario: TFloatField;
    qryitens_osSub_Total: TFloatField;
    qryservicos_os: TADOQuery;
    qryservicos_osCodigo: TIntegerField;
    qryservicos_osCodigo_Servico: TIntegerField;
    qryservicos_osValor_Unitario: TFloatField;
    qryservicos_osDesconto: TFloatField;
    qryservicos_osTipo_Desconto: TStringField;
    qryservicos_osSub_Total: TFloatField;
    qryservicos_osDescricao_Servico: TStringField;
    qryservicos_osISS: TStringField;
    qryservicos_osQtde: TIntegerField;
    qryservicos_osCodigo_Registro: TAutoIncField;
    QRSubDetail3: TQRSubDetail;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRDBText16: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText2: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel2: TQRLabel;
    dsConsulta_OS: TDataSource;
    dsItens_OS: TDataSource;
    dsServicos_OS: TDataSource;
    QRBand3: TQRBand;
    QRBand5: TQRBand;
    QRBand6: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText17: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRBand7: TQRBand;
    QRLabel27: TQRLabel;
    QRTotal_Produtos: TQRExpr;
    QRLabel28: TQRLabel;
    QRTotal_Servicos: TQRExpr;
    ChildBand1: TQRChildBand;
    QRLabel5: TQRLabel;
    QRDBText12: TQRDBText;
    qryservicos_osCodigo_Mecanico: TIntegerField;
    qryservicos_osComissao: TFloatField;
    qryservicos_osNome: TStringField;
    qryconsulta_osHora_Venda: TStringField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    gZebrado: Boolean;

    procedure Zebrado(Sender: TQRBand);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_OS: TFrmRel_Consulta_OS;

implementation

uses UGeral, UDeclaracao, UConsulta_OS;

{$R *.dfm}

procedure TFrmRel_Consulta_OS.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_OS.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  //Zebrado(QRBand2);
end;

procedure TFrmRel_Consulta_OS.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;
  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  LblStatus_OS.Caption:= FrmConsulta_OS.CmbStatus.KeyValue;

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


  with qryconsulta_os, sql do
  begin
    close;
    clear;
    add('select P.Codigo, P.N_Pedido, P.Data_Venda, P.Data_Vencimento, P.Qtde_Itens, P.Qtde_Servicos,');
    add('P.Total_Produtos, P.Total_Servicos, P.Total_Pedido, P.Data_Previsao_Entrega, P.Data_Entrega,');
    add('P.Hora_Venda, P.Kilometragem, CP.Descricao as Cond_Pag, C.Nome_Nome_Fantasia as Cliente, (V.Veiculo + ' + QuotedStr(' - ') +' + V.Placa) as Veiculo, Fun.Nome as Funcionario from Pedido P');
    add('left join Cliente C on (C.Codigo = P.Codigo_Cliente)');
    add('left join Veiculo V on (V.Codigo = P.Codigo_Veiculo)');
    add('left join Funcionario Fun on (P.Codigo_Funcionario = Fun.Codigo)');
    add('left join Condicao_Pagamento CP on (P.Codigo_Forma_Pag = CP.Codigo)');

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

  qryitens_os.Close;
  qryitens_os.Parameters.ParamByName('Codigo').Value:= qryconsulta_osCodigo.AsInteger;
  qryitens_os.Open;

  qryservicos_os.Close;
  qryservicos_os.Parameters.ParamByName('Codigo').Value:= qryconsulta_osCodigo.AsInteger;
  qryservicos_os.Open;

  //LblTotal_Pedido.Caption:= FloatToStr(StrToFloat(QRTotal_Produtos.Expression + QRTotal_Servicos.Caption));
  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

end;

procedure TFrmRel_Consulta_OS.Zebrado(Sender: TQRBand);
begin
  if ( gZebrado ) then
  begin
    Sender.Color:= $00FFFFFF;
    QRBand2.Color:= $00FFFFFF;
  end
  else
  begin
    Sender.Color:= $00EEEEEE;
    QRBand2.Color:= $00EEEEEE;
  end;

  gZebrado:= not gZebrado;
end;

end.
