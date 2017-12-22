unit URel_Consulta_Cotacao_Preco_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Cotacao_Preco_Produto = class(TForm)
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
    QRLabel28: TQRLabel;
    QRDBText19: TQRDBText;
    ADOQuery1N_Cotacao: TIntegerField;
    ADOQuery1Codigo_Empresa: TIntegerField;
    ADOQuery1Codigo_Funcionario: TIntegerField;
    ADOQuery1Data_Cotacao: TDateTimeField;
    ADOQuery1Hora_Cotacao: TStringField;
    ADOQuery1Data_Vencimento: TDateTimeField;
    ADOQuery1Qtde_Itens: TFloatField;
    ADOQuery1N_Cotacao_1: TIntegerField;
    ADOQuery1Codigo_Produto: TIntegerField;
    ADOQuery1Qtde: TFloatField;
    ADOQuery1Nome: TStringField;
    ADOQuery1Codigo_Venda: TStringField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Sigla: TStringField;
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
  FrmRel_Consulta_Cotacao_Preco_Produto: TFrmRel_Consulta_Cotacao_Preco_Produto;

implementation

uses UGeral, UDeclaracao, UConsulta_Cotacao_Preco_Produto;

{$R *.dfm}

procedure TFrmRel_Consulta_Cotacao_Preco_Produto.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Cotacao_Preco_Produto.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  if (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 1) or (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 2) or
     (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 3) or (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 4) then
  begin
    LblData.Enabled:= true;
    LblData.Caption:= 'De ' + FrmConsulta_Cotacao_Preco_Produto.MEdtData_Inicial.Text + ' a ' + FrmConsulta_Cotacao_Preco_Produto.MEdtData_Final.Text;
  end
  else
    LblData.Enabled:= false;

  if (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 0) then
  begin
    LblParametro.Enabled:= true;
    LblParametro.Caption:= FrmConsulta_Cotacao_Preco_Produto.EdtCotacao.Text;
  end
  else if (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 3) or (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 4) then
  begin
    LblParametro.Enabled:= true;
    LblParametro.Caption:= FrmConsulta_Cotacao_Preco_Produto.EdtFuncionario.Text;
  end
  else
    LblParametro.Enabled:= false;

  if (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 0) then
    LblConsulta_Lancamento.Caption:= 'Cotação'
  else if (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 1) then
    LblConsulta_Lancamento.Caption:= 'Data Cotação'
  else if (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 2) then
    LblConsulta_Lancamento.Caption:= 'Data Vencimento'
  else if (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 3) then
    LblConsulta_Lancamento.Caption:= 'Funcionário / Data Cotação'
  else if (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 4) then
    LblConsulta_Lancamento.Caption:= 'Funcionário / Data Vencimento';

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('Select CP.*, IC.*, F.Nome, P.Codigo_Venda, P.Descricao, UM.Sigla from Cotacao_Preco_Produto CP');
    add('inner join Itens_Cotacao_Preco_Produto IC on (CP.N_Cotacao = IC.N_Cotacao)');
    add('inner join Funcionario F on (F.Codigo = CP.Codigo_Funcionario)');
    add('left join Produto P on (P.Codigo = IC.Codigo_Produto)');
    add('left join Unidade_Medida UM on (UM.Codigo = P.Codigo_Unidade_Medida)');

    if (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 0) then
    begin
      sql.add('where CP.Codigo_Empresa = :Empresa and CP.N_Cotacao = :N_Cotacao');
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('N_Cotacao').Value:= FrmConsulta_Cotacao_Preco_Produto.EdtCotacao.Text;
      open;
    end
    else if (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 1) then
    begin
      sql.add('where CP.Codigo_Empresa = :Empresa and CP.Data_Cotacao between :DI and :DF');
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('DI').Value:= FrmConsulta_Cotacao_Preco_Produto.MEdtData_Inicial.Text;
      Parameters.ParamByName('DF').Value:= FrmConsulta_Cotacao_Preco_Produto.MEdtData_Final.Text;
      open;
    end
    else if (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 2) then
    begin
      sql.add('where CP.Codigo_Empresa = :Empresa and CP.Data_Vencimento between :DI and :DF');
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('DI').Value:= FrmConsulta_Cotacao_Preco_Produto.MEdtData_Inicial.Text;
      Parameters.ParamByName('DF').Value:= FrmConsulta_Cotacao_Preco_Produto.MEdtData_Final.Text;
      open;
    end
    else if (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 3) then
    begin
      sql.add('where CP.Codigo_Empresa = :Empresa and CP.Codigo_Funcionario = :Funcionario and CP.Data_Cotacao between :DI and :DF');
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('Funcionario').Value:= StrToInt(FrmConsulta_Cotacao_Preco_Produto.EdtCodigo_Funcionario.Text);
      Parameters.ParamByName('DI').Value:= FrmConsulta_Cotacao_Preco_Produto.MEdtData_Inicial.Text;
      Parameters.ParamByName('DF').Value:= FrmConsulta_Cotacao_Preco_Produto.MEdtData_Final.Text;
      open;
    end
    else if (FrmConsulta_Cotacao_Preco_Produto.RGConsulta_Por.ItemIndex = 4) then
    begin
      sql.add('where CP.Codigo_Empresa = :Empresa and CP.Codigo_Funcionario = :Funcionario and CP.Data_Vencimento between :DI and :DF');
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('Funcionario').Value:= StrToInt(FrmConsulta_Cotacao_Preco_Produto.EdtCodigo_Funcionario.Text);
      Parameters.ParamByName('DI').Value:= FrmConsulta_Cotacao_Preco_Produto.MEdtData_Inicial.Text;
      Parameters.ParamByName('DF').Value:= FrmConsulta_Cotacao_Preco_Produto.MEdtData_Final.Text;
      open;
    end;
  end;

end;
end.
