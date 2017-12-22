unit URel_Consulta_Saldo_Estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Saldo_Estoque = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBData_Vencimento: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRGroup1: TQRGroup;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRDBText1: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRChildBand1: TQRChildBand;
    QRLabel5: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBData_Pagamento: TQRDBText;
    QRBand1: TQRBand;
    ADOQuery1: TADOQuery;
    ADOQuery1Codigo_Venda: TStringField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Natureza: TStringField;
    ADOQuery1Data: TDateTimeField;
    ADOQuery1Estoque_Atual: TFloatField;
    ADOQuery1Quantidade: TFloatField;
    ADOQuery1Valor_Compra: TFloatField;
    ADOQuery1Valor_Total: TFloatField;
    ADOQuery1Custo_Medio: TFloatField;
    ADOQuery1Saldo_Quantidade: TFloatField;
    ADOQuery1Saldo_Valor: TFloatField;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRHRule1: TQRHRule;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    ADOQuery1Codigo_Empresa: TIntegerField;
    ADOQuery1Codigo_Produto: TIntegerField;
    ADOQuery1Estoque: TFloatField;
    ADOQuery1Saldo_Estoque: TFloatField;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Saldo_Estoque: TFrmRel_Consulta_Saldo_Estoque;

implementation

uses UGeral, UDeclaracao, UConsulta_Saldo_Estoque, UDM;

{$R *.dfm}

procedure TFrmRel_Consulta_Saldo_Estoque.FormCreate(Sender: TObject);
begin
//  if (FrmEscolha_Impressao.preview = true) then
    QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Saldo_Estoque.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  if (FrmConsulta_Saldo_Estoque.RGNatureza.ItemIndex = 0) then
    begin
      with ADOQuery1 do
        begin
          close;
          sql.clear;
          sql.add('select ME.*, P.Estoque, P.Saldo_Estoque from Movimentacao_Estoque ME');
          sql.add('inner join Produto P on (ME.Codigo_Produto = P.Codigo)');
          sql.Add('where ME.Codigo_Empresa = :Empresa and ME.Data between :DI and :DF');
          sql.Add('order by ME.Codigo_Produto, ME.Data, ME.Natureza');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('DI').Value:= FrmConsulta_Saldo_Estoque.MEdtData_Inicial.Text;
          Parameters.ParamByName('DF').Value:= FrmConsulta_Saldo_Estoque.MEdtData_Final.Text;
          open;
        end;
    end
    else
    begin
      with ADOQuery1 do
        begin
          close;
          sql.clear;
          sql.add('select ME.*, P.Estoque, P.Saldo_Estoque from Movimentacao_Estoque ME');
          sql.add('inner join Produto P on (ME.Codigo_Produto = P.Codigo)');
          sql.Add('where ME.Codigo_Empresa = :Empresa and ME.Data between :DI and :DF and ME.Natureza = :Natureza');
          sql.Add('order by ME.Codigo_Produto, ME.Data, ME.Natureza');

          if (FrmConsulta_Saldo_Estoque.RGNatureza.ItemIndex = 1) then
            Parameters.ParamByName('Natureza').Value:= 'ENTRADA'
          else if (FrmConsulta_Saldo_Estoque.RGNatureza.ItemIndex = 2) then
            Parameters.ParamByName('Natureza').Value:= 'SAÍDA';

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('DI').Value:= FrmConsulta_Saldo_Estoque.MEdtData_Inicial.Text;
          Parameters.ParamByName('DF').Value:= FrmConsulta_Saldo_Estoque.MEdtData_Final.Text;
          open;
        end;
    end;
end;

end.
