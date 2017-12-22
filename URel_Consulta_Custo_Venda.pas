unit URel_Consulta_Custo_Venda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Custo_Venda = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
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
    QRBand1: TQRBand;
    ADOQuery1: TADOQuery;
    QRDBText8: TQRDBText;
    QRHRule1: TQRHRule;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText11: TQRDBText;
    QRExpr1: TQRExpr;
    ADOQuery1Codigo_Venda: TStringField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Estoque: TFloatField;
    ADOQuery1Valor_Medio: TFloatField;
    ADOQuery1Saldo_Estoque: TFloatField;
    ADOQuery1Preco_Vista: TFloatField;
    ADOQuery1Valor_Total: TFloatField;
    ADOQuery1Diferenca: TFloatField;
    ADOQuery1Sigla: TStringField;
    QRExpr3: TQRExpr;
    QRLabel3: TQRLabel;
    QRExpr4: TQRExpr;
    ADOQuery1Perc_Real: TFloatField;
    QRLabel14: TQRLabel;
    QRDBText9: TQRDBText;
    ADOQuery1Percentual_Lucro_Vista: TFloatField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Custo_Venda: TFrmRel_Consulta_Custo_Venda;

implementation

uses UGeral, UDeclaracao, UConsulta_Custo_Venda;

{$R *.dfm}

procedure TFrmRel_Consulta_Custo_Venda.FormCreate(Sender: TObject);
begin
//  if (FrmEscolha_Impressao.preview = true) then
    QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Custo_Venda.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  with ADOQuery1 do
    begin
      close;
      sql.clear;
      sql.add('select P.Codigo_Venda, P.Descricao, P.Estoque, P.Valor_Medio, P.Saldo_Estoque, ITP.Preco_Vista, (P.Estoque * ITP.Preco_Vista) as Valor_Total,');
      sql.add('((P.Estoque * ITP.Preco_Vista) - P.Saldo_Estoque) as Diferenca, (P.Saldo_Estoque / (P.Estoque * ITP.Preco_Vista) * 100) as Perc_Real, ITP.Percentual_Lucro_Vista, UM.Sigla from Produto P');
      sql.add('inner join Itens_Tabela_Preco ITP on (P.Codigo = ITP.Codigo_Produto)');
      sql.add('inner join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
      sql.add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');

      if (FrmConsulta_Custo_Venda.RGOrdena_Por.ItemIndex = 0) then
        sql.add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by P.Codigo_Venda')

      else if (FrmConsulta_Custo_Venda.RGOrdena_Por.ItemIndex = 1) then
        sql.add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by P.Descricao')

      else if (FrmConsulta_Custo_Venda.RGOrdena_Por.ItemIndex = 2) then
        sql.add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by P.Estoque')

      else if (FrmConsulta_Custo_Venda.RGOrdena_Por.ItemIndex = 3) then
        sql.add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by P.Valor_Medio')

      else if (FrmConsulta_Custo_Venda.RGOrdena_Por.ItemIndex = 4) then
        sql.add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by P.Saldo_Estoque')

      else if (FrmConsulta_Custo_Venda.RGOrdena_Por.ItemIndex = 5) then
        sql.add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by ITP.Preco_Vista')

      else if (FrmConsulta_Custo_Venda.RGOrdena_Por.ItemIndex = 6) then
        sql.add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by Valor_Total')

      else if (FrmConsulta_Custo_Venda.RGOrdena_Por.ItemIndex = 7) then
        sql.add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by Diferenca')

      else if (FrmConsulta_Custo_Venda.RGOrdena_Por.ItemIndex = 8) then
        sql.add('where TP.Codigo = :Tabela and P.Codigo_Empresa = :Empresa and P.Status = :Status order by ITP.Percentual_Lucro');

      Parameters.ParamByName('Tabela').Value:= StrToInt(FrmConsulta_Custo_Venda.EdtCodigo_Tabela_Preco.Text);
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('Status').Value:= 'ATIVO';
      open;
    end;
end;

end.
