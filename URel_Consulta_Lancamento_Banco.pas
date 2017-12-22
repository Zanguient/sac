unit URel_Consulta_Lancamento_Banco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Lancamento_Banco = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBDescricao: TQRDBText;
    QRDBData_Vencimento: TQRDBText;
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
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel4: TQRLabel;
    Lblde: TQRLabel;
    Lbla: TQRLabel;
    QRLabel16: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Lancamento_Banco: TFrmRel_Consulta_Lancamento_Banco;

implementation

uses UGeral, UEscolha_Impressao, UConsulta_Lancamento_Banco, UDeclaracao;

{$R *.dfm}

procedure TFrmRel_Consulta_Lancamento_Banco.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Lancamento_Banco.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;
  //LblPropriedade.Caption:= FrmCarregar_Contas_Pagar.EdtPropriedade.Text;
  LblParametro.Caption:= '';
  //LblParametro.Caption:= FrmConsulta_Lancamento_Banco.EdtConsulta.Text;
  
  {if (FrmConsulta_Lancamento_Banco.RGConsulta_Por.ItemIndex = 0) then
  begin
    LblConsulta_Por.Caption:= 'Número do documento';
    QRLabel4.Enabled:= false;
    qrlabel16.Enabled:= false;
    Lblde.Enabled:= false;
    Lbla.Enabled:= false;
    Lblde.Enabled:= false;
    Lbla.Enabled:= false;
  end
  else if (FrmConsulta_Lancamento_Banco.RGConsulta_Por.ItemIndex = 1) then
  begin
    LblConsulta_Por.Caption:= 'Data do Lançamento';
    QRLabel4.Enabled:= true;
    qrlabel16.Enabled:= true;
    Lblde.Enabled:= true;
    Lbla.Enabled:= true;
    Lblde.Caption:= FrmConsulta_Lancamento_Banco.MEdtData_Inicial.Text;
    Lbla.Caption:= FrmConsulta_Lancamento_Banco.MEdtData_Final.Text;
  end
  else if (FrmConsulta_Lancamento_Banco.RGConsulta_Por.ItemIndex = 2) then
  begin
    LblConsulta_Por.Caption:= 'Plano Financeiro';
    QRLabel4.Enabled:= false;
    qrlabel16.Enabled:= false;
    Lblde.Enabled:= false;
    Lbla.Enabled:= false;
    Lblde.Enabled:= false;
    Lbla.Enabled:= false;
  end
  else if (FrmConsulta_Lancamento_Banco.RGConsulta_Por.ItemIndex = 3) then
  begin
    LblConsulta_Por.Caption:= 'Plano Financeiro e Data';
    QRLabel4.Enabled:= true;
    qrlabel16.Enabled:= true;
    Lblde.Enabled:= true;
    Lbla.Enabled:= true;
    Lblde.Caption:= FrmConsulta_Lancamento_Banco.MEdtData_Inicial.Text;
    Lbla.Caption:= FrmConsulta_Lancamento_Banco.MEdtData_Final.Text;
  end; }

  {if (FrmConsulta_Lancamento_Banco.RGStatus.ItemIndex = 0) then
    LblStatus.Caption:= 'Liberado'
  else
    LblStatus.Caption:= 'Bloqueado';}

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

end;

end.
