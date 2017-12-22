unit URel_Consulta_Entrada_Sintetico1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Entrada_Sintetico1 = class(TForm)
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
    LblParametro: TQRLabel;
    QRLabel13: TQRLabel;
    LblData: TQRLabel;
    QRDBText16: TQRDBText;
    QRChildBand1: TQRChildBand;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel30: TQRLabel;
    QRBand3: TQRBand;
    QRDBValor: TQRDBText;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand1: TQRBand;
    ADOQuery1: TADOQuery;
    QRLabel10: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText32: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    ADOQuery1N_Nota_Fiscal: TStringField;
    ADOQuery1Data_Emissao: TDateTimeField;
    ADOQuery1Data_Entrada: TDateTimeField;
    ADOQuery1Nome_Fantasia: TStringField;
    ADOQuery1Total_Produtos: TFloatField;
    ADOQuery1Total_Nota: TFloatField;
    ADOQuery1N_Item: TStringField;
    ADOQuery1Unidade: TStringField;
    ADOQuery1Valor_Unitario: TFloatField;
    ADOQuery1Quantidade: TFloatField;
    ADOQuery1Valor_Total: TFloatField;
    ADOQuery1Codigo_Venda: TStringField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Custo_Total: TFloatField;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Entrada_Sintetico1: TFrmRel_Consulta_Entrada_Sintetico1;

implementation

uses UGeral, UConsulta_Entrada, UDeclaracao;

{$R *.dfm}

procedure TFrmRel_Consulta_Entrada_Sintetico1.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Entrada_Sintetico1.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 1) or (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 2) or
     (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 4) or (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 5) then
  begin
    LblData.Enabled:= true;
    LblData.Caption:= 'De ' + FrmConsulta_Entrada.MEdtData_Inicial.Text + ' a ' + FrmConsulta_Entrada.MEdtData_Final.Text;
  end
  else
    LblData.Enabled:= false;

  if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 0) then
  begin
    LblParametro.Enabled:= true;
    LblParametro.Caption:= FrmConsulta_Entrada.EdtNota_Fiscal.Text;
  end
  else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 3) or (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 4) or
          (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 5) then
  begin
    LblParametro.Enabled:= true;
    LblParametro.Caption:= FrmConsulta_Entrada.EdtFornecedor.Text;
  end
  else
    LblParametro.Enabled:= false;

  if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 0) then
    LblConsulta_Lancamento.Caption:= 'Nota Fiscal'
  else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 1) then
    LblConsulta_Lancamento.Caption:= 'Data Emissão'
  else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 2) then
    LblConsulta_Lancamento.Caption:= 'Data Entrega'
  else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 3) then
    LblConsulta_Lancamento.Caption:= 'Fornecedor'
  else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 4) then
    LblConsulta_Lancamento.Caption:= 'Data Emissão/Fornecedor'
  else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 5) then
    LblConsulta_Lancamento.Caption:= 'Data Entrega/Fornecedor';

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('Select EP.N_Nota_Fiscal, EP.Data_Emissao, EP.Data_Entrada, Forn.Nome_Fantasia,');
    add('IE.Total_Produtos, IE.Total_Nota, IE.Custo_Total, IEnt.N_Item, IEnt.Unidade, IEnt.Valor_Unitario, IEnt.Quantidade, IEnt.Valor_Total,');
    add('P.Codigo_Venda, P.Descricao  from Entrada_Produtos EP');
    add('inner join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal)');
    add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');
    add('left join Itens_Entrada IEnt on (EP.N_Nota_Fiscal = IEnt.N_Nota_Fiscal)');
    add('left join Produto P on(IEnt.Codigo_Produto = P.Codigo)');

    if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 0) then
    begin
      Add('where EP.Codigo_Empresa = :Empresa and EP.N_Nota_Fiscal = :N_Nota_Fiscal');
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('N_Nota_Fiscal').Value:= FrmConsulta_Entrada.EdtNota_Fiscal.Text;
      Open;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 1) then
    begin
      Add('where EP.Codigo_Empresa = :Empresa and EP.Data_Emissao between :DI and :DF');
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Final.Text);
      Open;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 2) then
    begin
      Add('where EP.Codigo_Empresa = :Empresa and EP.Data_Entrada between :DI and :DF');
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Final.Text);
      Open;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 3) then
    begin
      Add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn');
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text);
      Open;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 4) then
    begin
      Add('where EP.Codigo_Empresa = :Empresa and EP.Data_Emissao between :DI and :DF and EP.Codigo_Fornecedor = :Forn');
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Final.Text);
      Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text);
      Open;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 5) then
    begin
      Add('where EP.Codigo_Empresa = :Empresa and EP.Data_Entrada between :DI and :DF and EP.Codigo_Fornecedor = :Forn');
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Final.Text);
      Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text);
      Open;
    end;
  end;

end;
end.
