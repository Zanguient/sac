unit URel_Consulta_Folha_Pagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt, QRExport;

type
  TFrmRel_Consulta_Folha_Pagamento = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRGroup1: TQRGroup;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    LblConsulta_Lancamento: TQRLabel;
    QRLabel6: TQRLabel;
    LblFuncionario: TQRLabel;
    QRLabel13: TQRLabel;
    LblData: TQRLabel;
    QRDBText16: TQRDBText;
    QRChildBand1: TQRChildBand;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel30: TQRLabel;
    QRBand3: TQRBand;
    QRDBValor: TQRDBText;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand1: TQRBand;
    ADOQuery1: TADOQuery;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1Codigo_Funcionario: TIntegerField;
    ADOQuery1Codigo_Empresa: TIntegerField;
    ADOQuery1Mes_Ano: TStringField;
    ADOQuery1Data_Fechamento: TDateTimeField;
    ADOQuery1Entradas: TFloatField;
    ADOQuery1Saidas: TFloatField;
    ADOQuery1Comissao: TFloatField;
    ADOQuery1Desconto: TFloatField;
    ADOQuery1Salario: TFloatField;
    ADOQuery1Quantidade_Itens: TIntegerField;
    ADOQuery1Observacao: TStringField;
    ADOQuery1Codigo_1: TIntegerField;
    ADOQuery1Codigo_Item: TIntegerField;
    ADOQuery1Valor: TFloatField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Natureza: TStringField;
    ADOQuery1Nome: TStringField;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    QRExcelFilter1: TQRExcelFilter;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Folha_Pagamento: TFrmRel_Consulta_Folha_Pagamento;

implementation

uses UConsulta_Folha_Pagamento, UGeral, UDeclaracao;

{$R *.dfm}

procedure TFrmRel_Consulta_Folha_Pagamento.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Folha_Pagamento.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= FrmConsulta_Folha_Pagamento.EdtEmpresa.Text;

  if (FrmConsulta_Folha_Pagamento.RGConsulta_Por.ItemIndex = 1) or (FrmConsulta_Folha_Pagamento.RGConsulta_Por.ItemIndex = 2) then
    LblData.Caption:= 'M�s: ' + FrmConsulta_Folha_Pagamento.MEdtMes_Ano.Text
  else
    LblData.Caption:= 'De ' + FrmConsulta_Folha_Pagamento.MEdtData_Inicial.Text + ' a ' + FrmConsulta_Folha_Pagamento.MEdtData_Final.Text;

  if (FrmConsulta_Folha_Pagamento.RGConsulta_Por.ItemIndex = 0) or (FrmConsulta_Folha_Pagamento.RGConsulta_Por.ItemIndex = 1) then
  begin
    QRLabel13.Enabled:= true;
    LblFuncionario.Enabled:= true;
    LblFuncionario.Caption:= FrmConsulta_Folha_Pagamento.EdtFuncionario.Text;
  end
  else
  begin
    LblFuncionario.Caption:= '';
    QRLabel13.Enabled:= false;
    LblFuncionario.Enabled:= false;
  end;

  if (FrmConsulta_Folha_Pagamento.RGConsulta_Por.ItemIndex = 0) then
    LblConsulta_Lancamento.Caption:= 'Funcion�rio/Data Fec.'
  else if (FrmConsulta_Folha_Pagamento.RGConsulta_Por.ItemIndex = 1) then
    FrmConsulta_Folha_Pagamento.Caption:= 'Funcion�rio/M�s-Ano'
  else if (FrmConsulta_Folha_Pagamento.RGConsulta_Por.ItemIndex = 2) then
    LblConsulta_Lancamento.Caption:= 'M�s-Ano'
  else if (FrmConsulta_Folha_Pagamento.RGConsulta_Por.ItemIndex = 3) then
    LblConsulta_Lancamento.Caption:= 'Data Fec.';

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select FP.*, IFP.*, IFF.Descricao, IFF.Natureza, Fun.Nome from Folha_Pagamento FP');
    add('left join Itens_Folha_Pagamento IFP on (FP.Codigo = IFP.Codigo)');
    add('left join Itens_Folha IFF on (IFP.Codigo_Item = IFF.Codigo)');
    add('left join Funcionario Fun on (FP.Codigo_Funcionario = Fun.Codigo)');

    if (FrmConsulta_Folha_Pagamento.RGConsulta_Por.ItemIndex = 0) then
    begin
      Add('where FP.Codigo_Empresa = :Empresa and FP.Codigo_Funcionario = :Nome and FP.Data_Fechamento between :DI and :DF order by Fun.Nome, FP.Codigo');
      Parameters.ParamByName('Empresa').Value:= StrToInt(FrmConsulta_Folha_Pagamento.EdtCodigo_Empresa.Text);
      Parameters.ParamByName('Nome').Value:= StrToInt(FrmConsulta_Folha_Pagamento.EdtCodigo_Funcionario.Text);
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Folha_Pagamento.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Folha_Pagamento.MEdtData_Final.Text);
      Open;
    end
    else if (FrmConsulta_Folha_Pagamento.RGConsulta_Por.ItemIndex = 1) then
    begin
      Add('where FP.Codigo_Empresa = :Empresa and FP.Codigo_Funcionario = :Nome and FP.Mes_Ano = :Mes order by Fun.Nome, FP.Codigo');
      Parameters.ParamByName('Empresa').Value:= StrToInt(FrmConsulta_Folha_Pagamento.EdtCodigo_Empresa.Text);
      Parameters.ParamByName('Nome').Value:= StrToInt(FrmConsulta_Folha_Pagamento.EdtCodigo_Funcionario.Text);
      Parameters.ParamByName('Mes').Value:= FrmConsulta_Folha_Pagamento.MEdtMes_Ano.Text;
      Open;
    end
    else if (FrmConsulta_Folha_Pagamento.RGConsulta_Por.ItemIndex = 2) then
    begin
      Add('where FP.Codigo_Empresa = :Empresa and FP.Mes_Ano = :Mes order by Fun.Nome, FP.Codigo');
      Parameters.ParamByName('Empresa').Value:= StrToInt(FrmConsulta_Folha_Pagamento.EdtCodigo_Empresa.Text);
      Parameters.ParamByName('Mes').Value:= FrmConsulta_Folha_Pagamento.MEdtMes_Ano.Text;
      Open;
    end
    else if (FrmConsulta_Folha_Pagamento.RGConsulta_Por.ItemIndex = 3) then
    begin
      Add('where FP.Codigo_Empresa = :Empresa and FP.Data_Fechamento between :DI and :DF order by Fun.Nome, FP.Codigo');
      Parameters.ParamByName('Empresa').Value:= StrToInt(FrmConsulta_Folha_Pagamento.EdtCodigo_Empresa.Text);
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Folha_Pagamento.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Folha_Pagamento.MEdtData_Final.Text);
      Open;
    end;
  end;

end;
end.
