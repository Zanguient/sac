unit URel_Consulta_Lancamento_Financeiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Lancamento_Financeiro = class(TForm)
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
    QRLabel10: TQRLabel;
    LblParametro: TQRLabel;
    QRLabel4: TQRLabel;
    LblDe: TQRLabel;
    LblTipo_Conta: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel11: TQRLabel;
    LblAte: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    ADOQuery1: TADOQuery;
    QRBand2: TQRBand;
    QRLabel45: TQRLabel;
    QRHRule3: TQRHRule;
    QRChildBand1: TQRChildBand;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRBand3: TQRBand;
    QRDBValor: TQRDBText;
    QRDBParcela: TQRDBText;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBText1: TQRDBText;
    QRBand1: TQRBand;
    QRDBText25: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel47: TQRLabel;
    QRLabel15: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel32: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel3: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel37: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    ADOQuery1Codigo: TAutoIncField;
    ADOQuery1Tipo: TStringField;
    ADOQuery1N_Documento: TIntegerField;
    ADOQuery1Codigo_Empresa: TIntegerField;
    ADOQuery1Codigo_Forma_Pagamento: TIntegerField;
    ADOQuery1Codigo_Cli_For: TIntegerField;
    ADOQuery1Codigo_Tipo_Documento: TIntegerField;
    ADOQuery1Historico: TStringField;
    ADOQuery1Codigo_Departamento: TIntegerField;
    ADOQuery1Codigo_Plano: TIntegerField;
    ADOQuery1Data_Lancamento: TDateTimeField;
    ADOQuery1Data_Vencimento: TDateTimeField;
    ADOQuery1Valor_Documento: TFloatField;
    ADOQuery1Desconto: TFloatField;
    ADOQuery1Multa: TFloatField;
    ADOQuery1Valor_Cobrado: TFloatField;
    ADOQuery1Observacoes: TStringField;
    ADOQuery1Status: TStringField;
    ADOQuery1Codigo_1: TIntegerField;
    ADOQuery1N_Documento_1: TIntegerField;
    ADOQuery1Data_Vencimento_1: TDateTimeField;
    ADOQuery1Data_Pagamento: TDateTimeField;
    ADOQuery1Parcela: TIntegerField;
    ADOQuery1Status_1: TStringField;
    ADOQuery1Valor: TFloatField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Descricao_1: TStringField;
    ADOQuery1Descricao_2: TStringField;
    ADOQuery1Plano: TStringField;
    ADOQuery1Nome: TStringField;
    ADOQuery1Dinheiro: TFloatField;
    ADOQuery1Cheque_Vista: TFloatField;
    ADOQuery1Cheque_Prazo: TFloatField;
    ADOQuery1Cartao: TFloatField;
    ADOQuery1Juros: TFloatField;
    ADOQuery1Desconto_1: TFloatField;
    QRLabel14: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
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
  FrmRel_Consulta_Lancamento_Financeiro: TFrmRel_Consulta_Lancamento_Financeiro;

implementation

uses UGeral, UEscolha_Impressao, UDM, UConsulta_Lancamentos_Financeiros,
  UDeclaracao;

{$R *.dfm}

procedure TFrmRel_Consulta_Lancamento_Financeiro.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Lancamento_Financeiro.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;

  LblParametro.Caption:= '';
  LblParametro.Caption:= FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text;
  if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
  begin
    LblDe.Caption:= '';
    LblAte.Caption:= '';
  end
  else
  begin
    LblDe.Caption:= FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text;
    LblAte.Caption:= FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text;
  end;

  if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) then
    LblConsulta_Lancamento.Caption:= 'Tudo'
  else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
    LblConsulta_Lancamento.Caption:= 'Documento'
  else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) then
    LblConsulta_Lancamento.Caption:= 'Cli./Forn.'
  else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) then
    LblConsulta_Lancamento.Caption:= 'Plano Financeiro'
  else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 4) then
    LblConsulta_Lancamento.Caption:= 'Formas de Pagamento'
  else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 5) then
    LblConsulta_Lancamento.Caption:= 'Departamento'
  else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 6) then
    LblConsulta_Lancamento.Caption:= 'Tipo de Documento';

  if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
    LblTipo_Conta.Caption:= 'Débito'
  else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
    LblTipo_Conta.Caption:= 'Crédito';

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

      with ADOQuery1 do
        begin
          close;
          sql.clear;
          sql.add('select LF.*, PL.*, CP.Descricao, TD.Descricao, D.Descricao, PF.Plano,');
          sql.Add('MC.Dinheiro, MC.Cheque_Vista, MC.Cheque_Prazo, MC.Cartao, MC.Juros, MC.Desconto,');
          sql.add('Nome = case when (LF.Tipo = :Tipo) then');
          sql.add('(select Forn.Nome_Fantasia from Fornecedor Forn where LF.Codigo_Cli_For = Forn.Codigo)');
          sql.add('when (LF.Tipo = :Tipo2) then');
          sql.add('(select Cli.Nome_Nome_Fantasia from Cliente Cli where LF.Codigo_Cli_For = Cli.Codigo) end from Lancamento_Financeiro LF');
          sql.add('left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)');
          sql.Add('left join Movimento_Caixa MC on (PL.N_Documento = MC.N_Documento)');
          sql.add('left join Fornecedor Forn on(LF.Codigo_Cli_For = Forn.Codigo)');
          sql.add('left join Condicao_Pagamento CP on(LF.Codigo_Forma_Pagamento = CP.Codigo)');
          sql.add('left join Tipo_Documento TD on(LF.Codigo_Tipo_Documento = TD.Codigo)');
          sql.add('left join Departamento D on(LF.Codigo_Departamento = D.Codigo)');
          sql.add('left join Plano_Financeiro PF on(LF.Codigo_Plano = PF.Codigo)');


          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan');
            Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
            Parameters.ParamByName('Tipo').value:= 'PAGAR';
            Parameters.ParamByName('Tipo2').value:= 'RECEBER';
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
              //Parameters.ParamByName('Status').Value:= 'PAGO';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
              //Parameters.ParamByName('Status').Value:= 'PENDENTE';
            end;
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan');
            Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
            Parameters.ParamByName('Tipo').value:= 'PAGAR';
            Parameters.ParamByName('Tipo2').value:= 'RECEBER';
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
              //Parameters.ParamByName('Status').Value:= 'PAGO';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
              //Parameters.ParamByName('Status').Value:= 'PENDENTE';
            end;
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan');
            Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
            Parameters.ParamByName('Tipo').value:= 'PAGAR';
            Parameters.ParamByName('Tipo2').value:= 'RECEBER';
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
              //Parameters.ParamByName('Status').Value:= 'PAGO';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
              //Parameters.ParamByName('Status').Value:= 'PENDENTE';
            end;
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.N_Documento = :Documento and LF.Tipo = :Tipo_Lan');
            Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
            Parameters.ParamByName('Tipo').value:= 'PAGAR';
            Parameters.ParamByName('Tipo2').value:= 'RECEBER';
            Parameters.ParamByName('Documento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text;

            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
              //Parameters.ParamByName('Status').Value:= 'PAGO';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
              //Parameters.ParamByName('Status').Value:= 'PENDENTE';
            end;
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF');
            Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
            Parameters.ParamByName('Tipo').value:= 'PAGAR';
            Parameters.ParamByName('Tipo2').value:= 'RECEBER';
            Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
              //Parameters.ParamByName('Status').Value:= 'PAGO';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
              //Parameters.ParamByName('Status').Value:= 'PENDENTE';
            end;
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF');
            Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
            Parameters.ParamByName('Tipo').value:= 'PAGAR';
            Parameters.ParamByName('Tipo2').value:= 'RECEBER';
            Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
              //Parameters.ParamByName('Status').Value:= 'PAGO';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
              //Parameters.ParamByName('Status').Value:= 'PENDENTE';
            end;
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF');
            Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
            Parameters.ParamByName('Tipo').value:= 'PAGAR';
            Parameters.ParamByName('Tipo2').value:= 'RECEBER';
            Parameters.ParamByName('Codigo').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
              //Parameters.ParamByName('Status').Value:= 'PAGO';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
              //Parameters.ParamByName('Status').Value:= 'PENDENTE';
            end;
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Plano and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF');
            Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
            Parameters.ParamByName('Tipo').value:= 'PAGAR';
            Parameters.ParamByName('Tipo2').value:= 'RECEBER';
            Parameters.ParamByName('Plano').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
              //Parameters.ParamByName('Status').Value:= 'PAGO';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
              //Parameters.ParamByName('Status').Value:= 'PENDENTE';
            end;
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Plano and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF');
            Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
            Parameters.ParamByName('Tipo').value:= 'PAGAR';
            Parameters.ParamByName('Tipo2').value:= 'RECEBER';
            Parameters.ParamByName('Plano').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
              //Parameters.ParamByName('Status').Value:= 'PAGO';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
              //Parameters.ParamByName('Status').Value:= 'PENDENTE';
            end;
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Plano and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF');
            Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
            Parameters.ParamByName('Tipo').value:= 'PAGAR';
            Parameters.ParamByName('Tipo2').value:= 'RECEBER';
            Parameters.ParamByName('Plano').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
            if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
              //Parameters.ParamByName('Status').Value:= 'PAGO';
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
            begin
              Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
              //Parameters.ParamByName('Status').Value:= 'PENDENTE';
            end;
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 4) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Forma_Pagamento = :Forma and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF');
              Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
              Parameters.ParamByName('Tipo').value:= 'PAGAR';
              Parameters.ParamByName('Tipo2').value:= 'RECEBER';
              Parameters.ParamByName('Forma').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
              if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
              begin
                Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                //Parameters.ParamByName('Status').Value:= 'PAGO';
              end
              else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
              begin
                Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                //Parameters.ParamByName('Status').Value:= 'PENDENTE';
              end;
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 4) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Forma_Pagamento = :Forma and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF');
              Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
              Parameters.ParamByName('Tipo').value:= 'PAGAR';
              Parameters.ParamByName('Tipo2').value:= 'RECEBER';
              Parameters.ParamByName('Forma').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
              if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
              begin
                Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                //Parameters.ParamByName('Status').Value:= 'PAGO';
              end
              else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
              begin
                Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                //Parameters.ParamByName('Status').Value:= 'PENDENTE';
              end;
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 4) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Forma_Pagamento = :Forma and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF');
              Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
              Parameters.ParamByName('Tipo').value:= 'PAGAR';
              Parameters.ParamByName('Tipo2').value:= 'RECEBER';
              Parameters.ParamByName('Forma').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
              if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
              begin
                Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                //Parameters.ParamByName('Status').Value:= 'PAGO';
              end
              else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
              begin
                Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                //Parameters.ParamByName('Status').Value:= 'PENDENTE';
              end;
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 5) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Departamento = :Departamento and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF');
              Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
              Parameters.ParamByName('Tipo').value:= 'PAGAR';
              Parameters.ParamByName('Tipo2').value:= 'RECEBER';
              Parameters.ParamByName('Departamento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
              if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
              begin
                Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                //Parameters.ParamByName('Status').Value:= 'PAGO';
              end
              else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
              begin
                Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                //Parameters.ParamByName('Status').Value:= 'PENDENTE';
              end;
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 5) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Departamento = :Departamento and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF');
              Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
              Parameters.ParamByName('Tipo').value:= 'PAGAR';
              Parameters.ParamByName('Tipo2').value:= 'RECEBER';
              Parameters.ParamByName('Departamento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
              if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
              begin
                Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                //Parameters.ParamByName('Status').Value:= 'PAGO';
              end
              else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
              begin
                Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                //Parameters.ParamByName('Status').Value:= 'PENDENTE';
              end;
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 5) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Departamento = :Departamento and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF');
              Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
              Parameters.ParamByName('Tipo').value:= 'PAGAR';
              Parameters.ParamByName('Tipo2').value:= 'RECEBER';
              Parameters.ParamByName('Departamento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
              if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
              begin
                Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                //Parameters.ParamByName('Status').Value:= 'PAGO';
              end
              else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
              begin
                Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                //Parameters.ParamByName('Status').Value:= 'PENDENTE';
              end;
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 6) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Tipo_Documento = :Documento and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF');
              Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
              Parameters.ParamByName('Tipo').value:= 'PAGAR';
              Parameters.ParamByName('Tipo2').value:= 'RECEBER';
              Parameters.ParamByName('Documento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
              if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
              begin
                Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                //Parameters.ParamByName('Status').Value:= 'PAGO';
              end
              else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
              begin
                Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                //Parameters.ParamByName('Status').Value:= 'PENDENTE';
              end;
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 6) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Tipo_Documento = :Documento and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF');
              Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
              Parameters.ParamByName('Tipo').value:= 'PAGAR';
              Parameters.ParamByName('Tipo2').value:= 'RECEBER';
              Parameters.ParamByName('Documento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
              if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
              begin
                Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                //Parameters.ParamByName('Status').Value:= 'PAGO';
              end
              else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
              begin
                Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                //Parameters.ParamByName('Status').Value:= 'PENDENTE';
              end;
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
            end
            else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 6) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Tipo_Documento = :Documento and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF');
              Parameters.ParamByName('Empresa').value:= UDeclaracao.codigo_empresa;
              Parameters.ParamByName('Tipo').value:= 'PAGAR';
              Parameters.ParamByName('Tipo2').value:= 'RECEBER';
              Parameters.ParamByName('Documento').Value:= FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text;
              if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
              begin
                Parameters.ParamByName('Tipo_Lan').Value:= 'PAGAR';
                //Parameters.ParamByName('Status').Value:= 'PAGO';
              end
              else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
              begin
                Parameters.ParamByName('Tipo_Lan').Value:= 'RECEBER';
                //Parameters.ParamByName('Status').Value:= 'PENDENTE';
              end;
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          open;
        end;

end;
end.
