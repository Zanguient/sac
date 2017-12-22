unit URel_Consulta_Entrada_Sintetico2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Entrada_Sintetico2 = class(TForm)
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
    QRChildBand1: TQRChildBand;
    QRBand3: TQRBand;
    ADOQuery1: TADOQuery;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRBand2: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel45: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel1: TQRLabel;
    LblConsulta_Lancamento: TQRLabel;
    QRLabel6: TQRLabel;
    LblParametro: TQRLabel;
    QRLabel13: TQRLabel;
    LblData: TQRLabel;
    QRLabel4: TQRLabel;
    ADOQuery1N_Nota_Fiscal: TStringField;
    ADOQuery1Data_Emissao: TDateTimeField;
    ADOQuery1Data_Entrada: TDateTimeField;
    ADOQuery1Total_Produtos: TFloatField;
    ADOQuery1Total_Nota: TFloatField;
    ADOQuery1Nome_Fantasia: TStringField;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    ADOQuery1Custo_Total: TFloatField;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
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
  FrmRel_Consulta_Entrada_Sintetico2: TFrmRel_Consulta_Entrada_Sintetico2;

implementation

uses UGeral, UDeclaracao, UConsulta_Venda, UConsulta_Entrada;

{$R *.dfm}

procedure TFrmRel_Consulta_Entrada_Sintetico2.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Entrada_Sintetico2.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  {if FrmConsulta_Venda.DBGrid1.SelectedRows.CurrentRowSelected then
    PrintBand:= true
  else
    PrintBand:= false; }
end;

procedure TFrmRel_Consulta_Entrada_Sintetico2.QuickRep1BeforePrint(Sender: TCustomQuickRep;
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

  if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 0) then
    begin
      with ADOQuery1 do
        begin
          close;
          sql.clear;
          sql.add('Select EP.N_Nota_Fiscal, EP.Data_Emissao, EP.Data_Entrada, IE.Total_Produtos, IE.Custo_Total, Total_Nota,');
          sql.add('Forn.Nome_Fantasia from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.N_Nota_Fiscal = :N_Nota_Fiscal order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.N_Nota_Fiscal = :N_Nota_Fiscal order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.N_Nota_Fiscal = :N_Nota_Fiscal order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('N_Nota_Fiscal').Value:= FrmConsulta_Entrada.EdtNota_Fiscal.Text;
          open;

        end;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 1) then
    begin
      with ADOQuery1 do
        begin
          close;
          sql.clear;
          sql.add('Select EP.N_Nota_Fiscal, EP.Data_Emissao, EP.Data_Entrada, IE.Total_Produtos, IE.Custo_Total, Total_Nota,');
          sql.add('Forn.Nome_Fantasia from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Emissao between :DI and :DF order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Emissao between :DI and :DF order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Emissao between :DI and :DF order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Final.Text);
          open;
        end;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 2) then
    begin
      with ADOQuery1 do
        begin
          close;
          sql.clear;
          sql.add('Select EP.N_Nota_Fiscal, EP.Data_Emissao, EP.Data_Entrada, IE.Total_Produtos, IE.Custo_Total, Total_Nota,');
          sql.add('Forn.Nome_Fantasia from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Entrada between :DI and :DF order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Entrada between :DI and :DF order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Data_Entrada between :DI and :DF order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Final.Text);
          open;
        end;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 3) then
    begin
      with ADOQuery1 do
        begin
          close;
          sql.clear;
          sql.add('Select EP.N_Nota_Fiscal, EP.Data_Emissao, EP.Data_Entrada, IE.Total_Produtos, IE.Custo_Total, Total_Nota,');
          sql.add('Forn.Nome_Fantasia from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text);
          open;
        end;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 4) then
    begin
      with ADOQuery1 do
        begin
          close;
          sql.clear;
          sql.add('Select EP.N_Nota_Fiscal, EP.Data_Emissao, EP.Data_Entrada, IE.Total_Produtos, IE.Custo_Total, Total_Nota,');
          sql.add('Forn.Nome_Fantasia from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Emissao between :DI and :DF order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Emissao between :DI and :DF order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Emissao between :DI and :DF order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Final.Text);
          open;
        end;
    end
    else if (FrmConsulta_Entrada.RGConsulta_Por.ItemIndex = 5) then
    begin
      with ADOQuery1 do
        begin
          close;
          sql.clear;
          sql.add('Select EP.N_Nota_Fiscal, EP.Data_Emissao, EP.Data_Entrada, IE.Total_Produtos, IE.Custo_Total, Total_Nota,');
          sql.add('Forn.Nome_Fantasia from Entrada_Produtos EP');
          sql.add('inner join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_Fiscal)');
          sql.add('inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo)');

          if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 0) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Entrada between :DI and :DF order by EP.Data_Emissao')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 1) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Entrada between :DI and :DF order by EP.Data_Entrada')
          else if (FrmConsulta_Entrada.RGOrdena_Por.ItemIndex = 2) then
            sql.add('where EP.Codigo_Empresa = :Empresa and EP.Codigo_Fornecedor = :Forn and EP.Data_Entrada between :DI and :DF order by Forn.Nome_Fantasia');

          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Forn').Value:= StrToInt(FrmConsulta_Entrada.EdtCodigo_Fornecedor.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Entrada.MEdtData_Final.Text);
          open;
        end;
    end;
end;
end.
