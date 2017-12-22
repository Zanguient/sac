unit URel_Consulta_Tabela_Preco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Tabela_Preco = class(TForm)
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
    QRLabel1: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel30: TQRLabel;
    QRBand3: TQRBand;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand1: TQRBand;
    ADOQuery1: TADOQuery;
    LblTipo: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel28: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText24: TQRDBText;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1Codigo_Produto: TIntegerField;
    ADOQuery1Preco_Vista: TFloatField;
    ADOQuery1Preco_Prazo: TFloatField;
    ADOQuery1Percentual_Desconto_Vista: TFloatField;
    ADOQuery1Percentual_Desconto_Prazo: TFloatField;
    ADOQuery1Codigo_1: TIntegerField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Data_Cadastro: TDateTimeField;
    ADOQuery1Data_Validade: TDateTimeField;
    ADOQuery1Tipo: TStringField;
    ADOQuery1Codigo_Venda: TStringField;
    ADOQuery1Descricao_1: TStringField;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    ADOQuery1Codigo_Registro: TAutoIncField;
    ADOQuery1Percentual_Lucro_Vista: TFloatField;
    ADOQuery1Percentual_Lucro_Prazo: TFloatField;
    ADOQuery1Codigo_Empresa: TIntegerField;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    ADOQuery1Tipo_Calculo: TStringField;
    ADOQuery1Percentual_Vista: TFloatField;
    ADOQuery1Percentual_Prazo: TFloatField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Tabela_Preco: TFrmRel_Consulta_Tabela_Preco;

implementation

uses UGeral, UDeclaracao, UConsulta_Tabela_Preco;

{$R *.dfm}

procedure TFrmRel_Consulta_Tabela_Preco.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Tabela_Preco.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  if (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 0) then
    LblTipo.Caption:= 'Vigente'
  else
    LblTipo.Caption:= 'Vencida';

  if (FrmConsulta_Tabela_Preco.RGConsulta_Por.ItemIndex = 2) or
     (FrmConsulta_Tabela_Preco.RGConsulta_Por.ItemIndex = 3) then
  begin
    LblData.Enabled:= true;
    LblData.Caption:= 'De ' + FrmConsulta_Tabela_Preco.MEdtData_Inicial.Text + ' a ' + FrmConsulta_Tabela_Preco.MEdtData_Final.Text;
  end
  else
    LblData.Enabled:= false;

  if (FrmConsulta_Tabela_Preco.RGConsulta_Por.ItemIndex = 1) then
  begin
    LblParametro.Enabled:= true;
    QRLabel13.Enabled:= true;
    LblParametro.Caption:= FrmConsulta_Tabela_Preco.EdtTabela.Text;
  end
  else if (FrmConsulta_Tabela_Preco.RGConsulta_Por.ItemIndex = 0) or (FrmConsulta_Tabela_Preco.RGConsulta_Por.ItemIndex = 2) or
          (FrmConsulta_Tabela_Preco.RGConsulta_Por.ItemIndex = 3) then
  begin
    LblParametro.Enabled:= false;
    QRLabel13.Enabled:= false;
  end;

  if (FrmConsulta_Tabela_Preco.RGConsulta_Por.ItemIndex = 0) then
    LblConsulta_Lancamento.Caption:= 'Tudo'
  else if (FrmConsulta_Tabela_Preco.RGConsulta_Por.ItemIndex = 1) then
    LblConsulta_Lancamento.Caption:= 'Tabela'
  else if (FrmConsulta_Tabela_Preco.RGConsulta_Por.ItemIndex = 2) then
    LblConsulta_Lancamento.Caption:= 'Data do Cadastro'
  else if (FrmConsulta_Tabela_Preco.RGConsulta_Por.ItemIndex = 3) then
    LblConsulta_Lancamento.Caption:= 'Data de Vencimento';

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select ITP.*, TP.*, P.Codigo_Venda, P.Descricao from Itens_Tabela_Preco ITP');
    add('inner join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
    add('left join Produto P on (ITP.Codigo_Produto = P.Codigo)');

    if (FrmConsulta_Tabela_Preco.RGConsulta_Por.ItemIndex = 0) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 0) then
    begin
      sql.Add('where TP.Data_Validade >= :Data order by ITP.Codigo, P.Descricao');
      Parameters.ParamByName('Data').Value:= date;
    end
    else if (FrmConsulta_Tabela_Preco.RGConsulta_Por.ItemIndex = 0) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 1) then
    begin
      sql.Add('where TP.Data_Validade <= :Data order by ITP.Codigo, P.Descricao');
      Parameters.ParamByName('Data').Value:= date;
    end;

    if (FrmConsulta_Tabela_Preco.RGConsulta_Por.ItemIndex = 1) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 0) then
    begin
      sql.Add('where TP.Codigo = :Codigo and TP.Data_Validade >= :Data order by ITP.Codigo, P.Descricao');
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmConsulta_Tabela_Preco.EdtCodigo_Tabela.Text);
      Parameters.ParamByName('Data').Value:= date;
    end
    else if (FrmConsulta_Tabela_Preco.RGConsulta_Por.ItemIndex = 1) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 1) then
    begin
      sql.Add('where TP.Codigo = :Codigo and TP.Data_Validade <= :Data order by ITP.Codigo, P.Descricao');
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmConsulta_Tabela_Preco.EdtCodigo_Tabela.Text);
      Parameters.ParamByName('Data').Value:= date;
    end;

    if (FrmConsulta_Tabela_Preco.RGConsulta_Por.ItemIndex = 2) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 0) then
    begin
      sql.Add('where TP.Data_Cadastro between :DI and :DF and TP.Data_Validade >= :Data order by ITP.Codigo, P.Descricao');
      Parameters.ParamByName('Data').Value:= date;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Tabela_Preco.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Tabela_Preco.MEdtData_Final.Text);
    end
    else if (FrmConsulta_Tabela_Preco.RGConsulta_Por.ItemIndex = 2) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 1) then
    begin
      sql.Add('where TP.Data_Cadastro between :DI and :DF and TP.Data_Validade <= :Data order by ITP.Codigo, P.Descricao');
      Parameters.ParamByName('Data').Value:= date;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Tabela_Preco.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Tabela_Preco.MEdtData_Final.Text);
    end;

    if (FrmConsulta_Tabela_Preco.RGConsulta_Por.ItemIndex = 3) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 0) then
    begin
      sql.Add('where TP.Data_Validade between :DI and :DF and TP.Data_Validade >= :Data order by ITP.Codigo, P.Descricao');
      Parameters.ParamByName('Data').Value:= date;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Tabela_Preco.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Tabela_Preco.MEdtData_Final.Text);
    end
    else if (FrmConsulta_Tabela_Preco.RGConsulta_Por.ItemIndex = 3) and (FrmConsulta_Tabela_Preco.RGTipo.ItemIndex = 1) then
    begin
      sql.Add('where TP.Data_Validade between :DI and :DF and TP.Data_Validade <= :Data order by ITP.Codigo, P.Descricao');
      Parameters.ParamByName('Data').Value:= date;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Tabela_Preco.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Tabela_Preco.MEdtData_Final.Text);
    end;
    open;
  end;


end;
end.
