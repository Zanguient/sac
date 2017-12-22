unit URel_Consulta_OS_Agrupado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_OS_Agrupado = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBParcela: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBData_Pagamento: TQRDBText;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel11: TQRLabel;
    Lblde: TQRLabel;
    Lbla: TQRLabel;
    QRLabel13: TQRLabel;
    QRChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBDescricao: TQRDBText;
    QRExpr1: TQRExpr;
    QRBand2: TQRBand;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel30: TQRLabel;
    QRHRule1: TQRHRule;
    qrydados_agrupados_grupo: TADOQuery;
    QRLabel1: TQRLabel;
    QRExpr3: TQRExpr;
    qrydados_agrupados_grupoCodGrupo: TAutoIncField;
    qrydados_agrupados_grupoGrupo: TStringField;
    qrydados_agrupados_grupoDescricao_Servico: TStringField;
    qrydados_agrupados_grupoQtde: TIntegerField;
    qrydados_agrupados_grupoValor_Unitario: TFloatField;
    qrydados_agrupados_grupoSub_Total: TFloatField;
    qrydados_agrupados_grupoData_Venda: TDateTimeField;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    qrydados_agrupados_grupoDesconto: TFloatField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_OS_Agrupado: TFrmRel_Consulta_OS_Agrupado;

implementation

uses UGeral, UDM, UMenu_Geral, UDeclaracao, UConsulta_OS;

{$R *.dfm}

procedure TFrmRel_Consulta_OS_Agrupado.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_OS_Agrupado.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  with qrydados_agrupados_grupo, sql do
  begin
    close;
    clear;
    add('select GP.Codigo as CodGrupo, GP.Descricao as Grupo, IOS.Descricao_Servico, IOS.Qtde, IOS.Desconto, IOS.Valor_Unitario, ');
    Add('Ped.Data_Venda, IOS.Sub_Total');
    add('from Itens_OS IOS');
    add('left join Pedido Ped on (IOS.Codigo = Ped.Codigo)');
    add('left join Produto P on (IOS.Codigo_Servico = P.Codigo)');
    add('left join Grupo_Produto GP on (P.Codigo_Grupo = GP.Codigo)');

    case (FrmConsulta_OS.RGConsulta_Por.ItemIndex) of
      0: Add('where Ped.Codigo_Empresa = :Empresa and Ped.Status_OS = :Status_OS');
      1: Add('where Ped.N_Pedido = :Pedido and Ped.Codigo_Empresa = :Empresa and Ped.Status_OS = :Status_OS');
      2: Add('where Ped.Codigo_Cliente = :Cliente and Ped.Codigo_Empresa = :Empresa and Ped.Status_OS = :Status_OS');
      3: Add('where Ped.Codigo_Funcionario = :Cliente and Ped.Codigo_Empresa = :Empresa and Ped.Status_OS = :Status_OS');
    end;

    case (FrmConsulta_OS.RGData.ItemIndex) of
      0: Add('and Data_Venda between :DI and :DF order by GP.Descricao, Ped.Data_Venda, IOS.Descricao_Servico');
      1: Add('and Data_Previsao_Entrega between :DI and :DF order by GP.Descricao, Ped.Data_Venda, IOS.Descricao_Servico');
      2: Add('and Data_Entrega between :DI and :DF order by GP.Descricao, Ped.Data_Venda, IOS.Descricao_Servico');
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
    Parameters.ParamByName('Status_OS').Value:= FrmConsulta_OS.CmbStatus.KeyValue;
    Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_OS.MEdtData_Inicial.Text);
    Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_OS.MEdtData_Final.Text);

    open;
  end;
end;

end.
