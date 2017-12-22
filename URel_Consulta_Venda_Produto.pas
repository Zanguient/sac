unit URel_Consulta_Venda_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Venda_Produto = class(TForm)
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
    LblConsulta_Lancamento: TQRLabel;
    QRLabel6: TQRLabel;
    LblParametro: TQRLabel;
    QRLabel13: TQRLabel;
    LblData: TQRLabel;
    QRBand3: TQRBand;
    QRDBValor: TQRDBText;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    ADOQuery1: TADOQuery;
    LblStatus: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText25: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    ADOQuery1Data_Venda: TDateTimeField;
    ADOQuery1Codigo_Venda: TStringField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1UN: TStringField;
    ADOQuery1Qtde: TFloatField;
    ADOQuery1Valor_Total: TFloatField;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr5: TQRExpr;
    QRGroup1: TQRGroup;
    ChildBand1: TQRChildBand;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText4: TQRDBText;
    QRBand1: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
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
  FrmRel_Consulta_Venda_Produto: TFrmRel_Consulta_Venda_Produto;

implementation

uses UGeral, UDeclaracao, UConsulta_Venda;

{$R *.dfm}

procedure TFrmRel_Consulta_Venda_Produto.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Venda_Produto.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  {if FrmConsulta_Venda.DBGrid1.SelectedRows.CurrentRowSelected then
    PrintBand:= true
  else
    PrintBand:= false; }
end;

procedure TFrmRel_Consulta_Venda_Produto.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
    LblStatus.Caption:= 'Pago'
  else
    LblStatus.Caption:= 'Pendente';

  LblData.Caption:= 'De ' + FrmConsulta_Venda.MEdtData_Inicial.Text + ' a ' + FrmConsulta_Venda.MEdtData_Final.Text;

  if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 0) or (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 1) then
    LblParametro.Caption:= FrmConsulta_Venda.EdtPedido.Text
  else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 2) or (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 3) or
            (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 4) then
    LblParametro.Caption:= FrmConsulta_Venda.EdtConsulta.Text;

  if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 0) then
    LblConsulta_Lancamento.Caption:= 'Tudo'
  else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 1) then
    LblConsulta_Lancamento.Caption:= 'DAV'
  else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 2) then
    LblConsulta_Lancamento.Caption:= 'Pré-Venda'
  else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 3) then
    LblConsulta_Lancamento.Caption:= 'Cliente'
  else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 4) then
    LblConsulta_Lancamento.Caption:= 'Funcionário'
  else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 5) then
    LblConsulta_Lancamento.Caption:= 'Tabela de Preço';

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('SELECT     P.Data_Venda, IP.Codigo_Venda, IP.Descricao, IP.UN, SUM(IP.Qtde) AS Qtde, SUM(IP.Qtde * IP.Valor_Unitario) AS Valor_Total');
    add('FROM         Itens_Pedido IP');
    add('LEFT JOIN Pedido P on (IP.Codigo = P.Codigo)');

    if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 0) then
    begin
      add('WHERE     P.Data_Venda BETWEEN :DI AND :DF and P.Status = :Status and P.Codigo_Empresa = :Empresa and IP.Cancelado = '+QuotedStr('N')+'');
      add('GROUP BY P.Data_Venda, IP.Codigo_Venda, IP.Descricao, IP.UN');
      add('ORDER BY P.Data_Venda, IP.Descricao');
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

      if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'PAGO'
      else
        Parameters.ParamByName('Status').Value:= 'PENDENTE';
    end
    else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 3) then
    begin
      add('WHERE P.Codigo_Cliente = :Cliente and P.Data_Venda BETWEEN :DI AND :DF and P.Status = :Status and P.Codigo_Empresa = :Empresa and IP.Cancelado = '+QuotedStr('N')+'');
      add('GROUP BY P.Data_Venda, IP.Codigo_Venda, IP.Descricao, IP.UN');
      add('ORDER BY P.Data_Venda, IP.Descricao');

      Parameters.ParamByName('Cliente').Value:= StrToInt(FrmConsulta_Venda.EdtCodigo.Text);
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

      if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'PAGO'
      else
        Parameters.ParamByName('Status').Value:= 'PENDENTE';
    end
    else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 4) then
    begin
      add('WHERE P.Codigo_Funcionario = :Funcionario and P.Data_Venda BETWEEN :DI AND :DF and P.Status = :Status and P.Codigo_Empresa = :Empresa and IP.Cancelado = '+QuotedStr('N')+'');
      add('GROUP BY P.Data_Venda, IP.Codigo_Venda, IP.Descricao, IP.UN');
      add('ORDER BY P.Data_Venda, IP.Descricao');

      Parameters.ParamByName('Funcionario').Value:= StrToInt(FrmConsulta_Venda.EdtCodigo.Text);
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

      if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
        Parameters.ParamByName('Status').Value:= 'PAGO'
      else
        Parameters.ParamByName('Status').Value:= 'PENDENTE';

    end;

      open;
  end;
end;
end.
