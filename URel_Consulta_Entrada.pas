unit URel_Consulta_Entrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Entrada = class(TForm)
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
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand1: TQRBand;
    ADOQuery1: TADOQuery;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel29: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRLabel31: TQRLabel;
    QRLabel35: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1N_Nota_Fiscal: TStringField;
    ADOQuery1Modelo: TStringField;
    ADOQuery1Serie: TStringField;
    ADOQuery1Data_Emissao: TDateTimeField;
    ADOQuery1Hora_Emissao: TStringField;
    ADOQuery1Data_Entrada: TDateTimeField;
    ADOQuery1Hora_Entrada: TStringField;
    ADOQuery1Tipo_Frete: TStringField;
    ADOQuery1Tipo_Pagamento: TStringField;
    ADOQuery1Codigo_Fornecedor: TIntegerField;
    ADOQuery1Codigo_CFOP: TIntegerField;
    ADOQuery1Codigo_Empresa: TIntegerField;
    ADOQuery1Quantidade_Itens: TIntegerField;
    ADOQuery1Observacao: TStringField;
    ADOQuery1Codigo_1: TIntegerField;
    ADOQuery1N_Item: TStringField;
    ADOQuery1N_Nota_Fiscal_1: TStringField;
    ADOQuery1Codigo_Produto: TIntegerField;
    ADOQuery1Unidade: TStringField;
    ADOQuery1ST: TStringField;
    ADOQuery1Valor_Ultima_Compra: TFloatField;
    ADOQuery1Valor_Unitario: TFloatField;
    ADOQuery1Quantidade: TFloatField;
    ADOQuery1Valor_Total: TFloatField;
    ADOQuery1Aliquota_ICMS: TStringField;
    ADOQuery1Aliquota_IPI: TStringField;
    ADOQuery1CFOP: TStringField;
    ADOQuery1Valor_IPI: TFloatField;
    ADOQuery1Codigo_2: TIntegerField;
    ADOQuery1N_Nota_Fiscal_2: TStringField;
    ADOQuery1Total_Produtos: TFloatField;
    ADOQuery1Base_ICMS: TFloatField;
    ADOQuery1Valor_ICMS: TFloatField;
    ADOQuery1Isento_ICMS: TFloatField;
    ADOQuery1Outros_ICMS: TFloatField;
    ADOQuery1Base_ICMS_Subs: TFloatField;
    ADOQuery1Valor_ICMS_Subs: TFloatField;
    ADOQuery1Aliquota: TFloatField;
    ADOQuery1Valor_Frete: TFloatField;
    ADOQuery1Valor_Seguro: TFloatField;
    ADOQuery1Outras_Despesas: TFloatField;
    ADOQuery1Total_IPI: TFloatField;
    ADOQuery1Isento_IPI: TFloatField;
    ADOQuery1Outros_IPI: TFloatField;
    ADOQuery1Desconto: TFloatField;
    ADOQuery1Total_Nota: TFloatField;
    ADOQuery1Codigo_Venda: TStringField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Estoque: TFloatField;
    ADOQuery1Nome_Fantasia: TStringField;
    QRBand2: TQRBand;
    QRLabel44: TQRLabel;
    QRDBText26: TQRDBText;
    ADOQuery1NCM: TStringField;
    ADOQuery1Quantidade_Volume: TFloatField;
    QRLabel45: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRLabel47: TQRLabel;
    ADOQuery1Valor_Frete_Unitario: TFloatField;
    ADOQuery1Percentual_Lucro_Vista: TFloatField;
    ADOQuery1Valor_Vista: TFloatField;
    ADOQuery1Percentual_Lucro_Prazo: TFloatField;
    ADOQuery1Valor_Prazo: TFloatField;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRLabel50: TQRLabel;
    QRDBText37: TQRDBText;
    QRLabel51: TQRLabel;
    QRDBText38: TQRDBText;
    ADOQuery1Custo_Unitario: TFloatField;
    ADOQuery1BC_ICMS: TFloatField;
    ADOQuery1Valor_ICMS_Unitario: TFloatField;
    ADOQuery1IVA: TFloatField;
    QRDBText25: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText24: TQRDBText;
    ADOQuery1Custo_Total: TFloatField;
    QRLabel36: TQRLabel;
    QRDBText39: TQRDBText;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Entrada: TFrmRel_Consulta_Entrada;

implementation

uses UGeral, UConsulta_Entrada, UDeclaracao;

{$R *.dfm}

procedure TFrmRel_Consulta_Entrada.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Entrada.QuickRep1BeforePrint(Sender: TCustomQuickRep;
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
    add('Select EP.*, IE.*, ImpE.*, P.Codigo_Venda, P.Descricao, P.Estoque,');
    add('Forn.Nome_Fantasia from Entrada_Produtos EP');
    add('inner join Impostos_Entrada ImpE on (EP.N_Nota_Fiscal = ImpE.N_Nota_Fiscal)');
    add('inner join Itens_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal)');
    add('inner join Produto P on(IE.Codigo_Produto = P.Codigo)');
    add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');

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
