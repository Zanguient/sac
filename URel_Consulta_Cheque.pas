unit URel_Consulta_Cheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt, UConsulta_Cheque;

type
  TFrmRel_Consulta_Cheque = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBDescricao: TQRDBText;
    QRDBData_Vencimento: TQRDBText;
    QRDBParcela: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBData_Pagamento: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    LblConsulta_Por: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    LblStatus: TQRLabel;
    QRLabel10: TQRLabel;
    LblParametro: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel4: TQRLabel;
    LblTipo_Cheque: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRBand1: TQRBand;
    QRLabel11: TQRLabel;
    LblValor_Total: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    valor_total: double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Cheque: TFrmRel_Consulta_Cheque;

implementation

uses UGeral, UEscolha_Impressao, UDeclaracao;

{$R *.dfm}

procedure TFrmRel_Consulta_Cheque.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  valor_total:= valor_total + FrmConsulta_Cheque.qryconsulta_chequeValor.AsFloat;
  LblValor_Total.Caption:= FormatFloat('#0.0,0', valor_total);
end;

procedure TFrmRel_Consulta_Cheque.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Cheque.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;
  LblParametro.Caption:= '';
  LblParametro.Caption:= FrmConsulta_Cheque.EdtConsulta.Text;
  
  if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 0) then
    LblConsulta_Por.Caption:= 'Emitente'
  else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 1) then
    LblConsulta_Por.Caption:= 'Titular'
  else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 2) then
    LblConsulta_Por.Caption:= 'Número do Cheque'
  else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 3) then
    LblConsulta_Por.Caption:= 'Data de Vencimento'
  else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 4) then
    LblConsulta_Por.Caption:= 'Data da Saída'
  else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 5) then
    LblConsulta_Por.Caption:= 'Emitente/Data de Vencimento'
  else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 6) then
    LblConsulta_Por.Caption:= 'Emitente/Data da Saída';

  if (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
    LblStatus.Caption:= 'Pendente'
  else
    LblStatus.Caption:= 'Baixado';

  if (FrmConsulta_Cheque.RGTipo_Cheque.ItemIndex = 0) then
    LblTipo_Cheque.Caption:= 'Emitido'
  else
    LblTipo_Cheque.Caption:= 'Recebido';

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  {with qryconsulta_cheque do
  begin
    close;
    sql.clear;
    sql.add('select Che.*, B.Nome from Cheque Che');
    sql.add('inner join Banco B on (Che.Codigo_Banco = B.Codigo)');

    if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 0) then
    begin
      //if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 0) then
        //sql.add('where Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Emitente like '''+ FrmConsulta_Cheque.EdtConsulta.Text +'%''order by Che.N_Cheque')
      //else if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 1) then
        //sql.add('where Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Emitente like '''+ FrmConsulta_Cheque.EdtConsulta.Text +'%''order by Che.Emitente');
      sql.add('where Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Emitente like '''+ FrmConsulta_Cheque.EdtConsulta.Text +'%''');

      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      if (FrmConsulta_Cheque.RGTipo_Cheque.ItemIndex = 0) then
        Parameters.ParamByName('Tipo').Value:= 'EMITIDO'
      else
        Parameters.ParamByName('Tipo').Value:= 'RECEBIDO';

      if (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'PENDENTE'
      else
        Parameters.ParamByName('Status').Value:= 'BAIXADO';
      open;
    end
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 1) then
    begin
      if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 0) then
        sql.add('where Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Titular like '''+ FrmConsulta_Cheque.EdtConsulta.Text +'%''order by Che.N_Cheque')
      else if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 1) then
        sql.add('where Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Titular like '''+ FrmConsulta_Cheque.EdtConsulta.Text +'%''order by Che.Emitente');

      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      if (FrmConsulta_Cheque.RGTipo_Cheque.ItemIndex = 0) then
        Parameters.ParamByName('Tipo').Value:= 'EMITIDO'
      else
        Parameters.ParamByName('Tipo').Value:= 'RECEBIDO';

      if (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'PENDENTE'
      else
        Parameters.ParamByName('Status').Value:= 'BAIXADO';
      open;

    end
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 2) then
    begin
      if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 0) then
        sql.add('where Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.N_Cheque like '''+ FrmConsulta_Cheque.EdtConsulta.Text +'%''order by Che.N_Cheque')
      else if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 1) then
        sql.add('where Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.N_Cheque like '''+ FrmConsulta_Cheque.EdtConsulta.Text +'%''order by Che.Emitente');

      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      if (FrmConsulta_Cheque.RGTipo_Cheque.ItemIndex = 0) then
        Parameters.ParamByName('Tipo').Value:= 'EMITIDO'
      else
        Parameters.ParamByName('Tipo').Value:= 'RECEBIDO';

      if (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'PENDENTE'
      else
        Parameters.ParamByName('Status').Value:= 'BAIXADO';

      open;
    end
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 3) then
    begin
      if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 0) then
        sql.add('where Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Data_Vencimento between :DI and :DF order by Che.N_Cheque')
      else if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 1) then
        sql.add('where Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Data_Vencimento between :DI and :DF order by Che.Emitente');

      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Cheque.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Cheque.MEdtData_Final.Text);

      if (FrmConsulta_Cheque.RGTipo_Cheque.ItemIndex = 0) then
        Parameters.ParamByName('Tipo').Value:= 'EMITIDO'
      else
        Parameters.ParamByName('Tipo').Value:= 'RECEBIDO';

      if (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'PENDENTE'
      else
        Parameters.ParamByName('Status').Value:= 'BAIXADO';
      open;
    end
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 4) then
    begin
      if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 0) then
        sql.add('where Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Data_Saida between :DI and :DF order by Che.N_Cheque')
      else if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 1) then
        sql.add('where Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and  Che.Data_Saida between :DI and :DF order by Che.Emitente');

      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Cheque.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Cheque.MEdtData_Final.Text);

      if (FrmConsulta_Cheque.RGTipo_Cheque.ItemIndex = 0) then
        Parameters.ParamByName('Tipo').Value:= 'EMITIDO'
      else
        Parameters.ParamByName('Tipo').Value:= 'RECEBIDO';

      if (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'PENDENTE'
      else
        Parameters.ParamByName('Status').Value:= 'BAIXADO';

      open;
    end
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 5) then
    begin
      if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 0) then
        sql.add('where Che.Data_Vencimento between :DI and :DF and Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Emitente like '''+ FrmConsulta_Cheque.EdtConsulta.Text +'%''order by Che.N_Cheque')
      else if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 1) then
        sql.add('where Che.Data_Vencimento between :DI and :DF and Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Emitente like '''+ FrmConsulta_Cheque.EdtConsulta.Text +'%''order by Che.Emitente');

      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Cheque.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Cheque.MEdtData_Final.Text);

      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      if (FrmConsulta_Cheque.RGTipo_Cheque.ItemIndex = 0) then
        Parameters.ParamByName('Tipo').Value:= 'EMITIDO'
      else
        Parameters.ParamByName('Tipo').Value:= 'RECEBIDO';

      if (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'PENDENTE'
      else
        Parameters.ParamByName('Status').Value:= 'BAIXADO';
      open;
    end
    else if (FrmConsulta_Cheque.RGConsulta_Por.ItemIndex = 6) then
    begin
      if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 0) then
        sql.add('where Che.Data_Saida between :DI and :DF and Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Emitente like '''+ FrmConsulta_Cheque.EdtConsulta.Text +'%''order by Che.N_Cheque')
      else if (FrmConsulta_Cheque.RGOrdena_Por.ItemIndex = 1) then
        sql.add('where Che.Data_Saida between :DI and :DF and Che.Codigo_Empresa = :Empresa and Che.Tipo = :Tipo and Che.Status = :Status and Che.Emitente like '''+ FrmConsulta_Cheque.EdtConsulta.Text +'%''order by Che.Emitente');

      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Cheque.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Cheque.MEdtData_Final.Text);

      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      if (FrmConsulta_Cheque.RGTipo_Cheque.ItemIndex = 0) then
        Parameters.ParamByName('Tipo').Value:= 'EMITIDO'
      else
        Parameters.ParamByName('Tipo').Value:= 'RECEBIDO';

      if (FrmConsulta_Cheque.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'PENDENTE'
      else
        Parameters.ParamByName('Status').Value:= 'BAIXADO';
      open;
    end;

  end;}
end;

end.
