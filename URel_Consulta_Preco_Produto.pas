unit URel_Consulta_Preco_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Preco_Produto = class(TForm)
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
    QRLabel10: TQRLabel;
    LblParametro: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    LblTipo_Conta: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel11: TQRLabel;
    LblIntervalo: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    LblTabela1: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    LblTabela2: TQRLabel;
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
  FrmRel_Consulta_Preco_Produto: TFrmRel_Consulta_Preco_Produto;

implementation

uses UGeral, UConsulta_Preco_Produto, UDeclaracao;

{$R *.dfm}

procedure TFrmRel_Consulta_Preco_Produto.FormCreate(Sender: TObject);
begin
//  if (FrmEscolha_Impressao.preview = true) then
    QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Preco_Produto.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblParametro.Caption:= '';
  LblEmpresa.Caption:= nome_fantasia;

  if (FrmConsulta_Preco_Produto.RGConsulta_Por.ItemIndex = 2) then
  begin
    QRLabel17.Enabled:= true;
    QRLabel18.Enabled:= true;
    LblTabela1.Enabled:= true;
    LblTabela2.Enabled:= true;
    QRLabel11.Enabled:= false;
    LblIntervalo.Enabled:= false;

    LblTabela1.Caption:= FrmConsulta_Preco_Produto.EdtTabela1.Text;
    LblTabela2.Caption:= FrmConsulta_Preco_Produto.EdtTabela2.Text;
  end
  else
  begin
    QRLabel17.Enabled:= false;
    QRLabel18.Enabled:= false;
    LblTabela1.Enabled:= false;
    LblTabela2.Enabled:= false;
    QRLabel11.Enabled:= true;
    LblIntervalo.Enabled:= true;
  end;

  if (FrmConsulta_Preco_Produto.RGTipo.ItemIndex = 0) then
    LblTipo_Conta.Caption:= 'Vigente'
  else
    LblTipo_Conta.Caption:= 'Vencida';

  LblIntervalo.Caption:= 'De ' + FrmConsulta_Preco_Produto.MEdtData_Inicial.Text + ' até ' + FrmConsulta_Preco_Produto.MEdtData_Final.Text;

  if (FrmConsulta_Preco_Produto.RGConsulta_Por.ItemIndex = 1) then
    LblParametro.Caption:= FrmConsulta_Preco_Produto.EdtProduto.Text
  else
    LblParametro.Enabled:= false;
  
  if (FrmConsulta_Preco_Produto.RGConsulta_Por.ItemIndex = 0) then
    LblConsulta_Por.Caption:= 'Tudo'
  else if (FrmConsulta_Preco_Produto.RGConsulta_Por.ItemIndex = 1) then
    LblConsulta_Por.Caption:= 'Produto'
  else if (FrmConsulta_Preco_Produto.RGConsulta_Por.ItemIndex = 2) then
    LblConsulta_Por.Caption:= 'Tabela';

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

end;

end.
