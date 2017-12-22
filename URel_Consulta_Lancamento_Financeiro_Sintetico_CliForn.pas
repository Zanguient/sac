unit URel_Consulta_Lancamento_Financeiro_Sintetico_CliForn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt, QRExport;

type
  TFrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRTituloData: TQRLabel;
    QRTitulohora: TQRLabel;
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
    ADOQuery1: TADOQuery;
    QRBand3: TQRBand;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRBand1: TQRBand;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1N_Documento: TIntegerField;
    ADOQuery1Codigo_Empresa: TIntegerField;
    ADOQuery1Tipo: TStringField;
    ADOQuery1Codigo_Cli_For: TIntegerField;
    ADOQuery1Historico: TStringField;
    ADOQuery1Data_Lancamento: TDateTimeField;
    ADOQuery1Data_Vencimento: TDateTimeField;
    ADOQuery1Valor: TFloatField;
    ChildBand1: TQRChildBand;
    QRLabel20: TQRLabel;
    QRLabel1: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel2: TQRLabel;
    QRExpr5: TQRExpr;
    ADOQuery1Status: TStringField;
    ADOQuery1Nome: TStringField;
    ADOQuery1N_Cheque: TStringField;
    ADOQuery1Conta: TStringField;
    ADOQuery1Data_Pagamento: TDateTimeField;
    ADOQuery1Valor_Pagar: TFloatField;
    ADOQuery1Dias_Venc: TIntegerField;
    ADOQuery1Cond_Pag: TStringField;
    QRDBText6: TQRDBText;
    ADOQuery1Valor_Restante: TFloatField;
    ADOQuery1Valor_Pago: TFloatField;
    ADOQuery2: TADOQuery;
    ADOQuery2Codigo: TIntegerField;
    ADOQuery2N_Documento: TIntegerField;
    ADOQuery2Data_Pagamento: TDateTimeField;
    ADOQuery2Codigo_Forma_Pagamento: TIntegerField;
    ADOQuery2Valor_Recebido: TFloatField;
    ADOQuery2Cond_Pag: TStringField;
    QRBand5: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand6: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel18: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel22: TQRLabel;
    QRExpr6: TQRExpr;
    QRLabel28: TQRLabel;
    QRExpr8: TQRExpr;
    QRLabel12: TQRLabel;
    QRExpr7: TQRExpr;
    QRBand2: TQRBand;
    QRLabel3: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel14: TQRLabel;
    QRExpr9: TQRExpr;
    QRLabel15: TQRLabel;
    QRExpr10: TQRExpr;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    ADOQuery2Codigo_Conta: TIntegerField;
    ADOQuery2Codigo_Cheque: TIntegerField;
    ADOQuery2Codigo_Registro: TAutoIncField;
    ADOQuery2Conta: TStringField;
    ADOQuery2N_Cheque: TStringField;
    QRLabel19: TQRLabel;
    QRExpr11: TQRExpr;
    QRLabel21: TQRLabel;
    QRExpr12: TQRExpr;
    QRLabel23: TQRLabel;
    QRExpr13: TQRExpr;
    QRExcelFilter1: TQRExcelFilter;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ADOQuery1Data_PagamentoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure QRDBText1Print(sender: TObject; var Value: string);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Atualiza_Query;
    procedure Atualiza_Query2(N_Documento: AnsiString);
  end;

var
  FrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn: TFrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn;

implementation

uses UDM, UConsulta_Lancamentos_Financeiros, UDeclaracao, UGeral;

{$R *.dfm}

procedure TFrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.ADOQuery1Data_PagamentoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '30/12/1899') then
    Text:= ''
  else
    Text:= Sender.AsString;

end;

procedure TFrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.Atualiza_Query;
begin
  with ADOQuery1 do
    begin
      close;
      sql.clear;
      sql.add('select CH.N_Cheque, CC.Conta, PL.Codigo, PL.N_Documento, LF.Codigo_Empresa, LF.Tipo, LF.Codigo_Cli_For, ');
      sql.add('LF.Historico, LF.Data_Lancamento, PL.Data_Vencimento, PL.Data_Pagamento, PL.Valor, PL.Valor_Pagar, PL.Status,');
      sql.add('PL.Valor_Restante, PL.Valor_Pago, datediff(day, getDate(), PL.Data_Vencimento) as Dias_Venc, Nome = case when (LF.Tipo = :Tipo) then');
      sql.add('(select Forn.Nome_Fantasia from Fornecedor Forn where LF.Codigo_Cli_For = Forn.Codigo)');
      sql.add('when (LF.Tipo = :Tipo2) then');
      sql.add('(select Cli.Nome_Nome_Fantasia from Cliente Cli where LF.Codigo_Cli_For = Cli.Codigo) end, ');
      sql.add('CP.Descricao as Cond_Pag');
      sql.add('from Lancamento_Financeiro LF');
      sql.add('left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)');
      //sql.add('left join Parcelas_Lancamentos_Historico PLH on (PL.N_Documento = PLH.N_Documento)');
      sql.add('left join Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo)');
      sql.Add('left join Cheque CH on (PL.Codigo_Cheque = CH.Codigo)');
      sql.Add('left join Conta_Corrente CC on (PL.Codigo_Conta = CC.Codigo)');
      sql.add('left join Condicao_Pagamento CP on (PL.Codigo_Forma_Pagamento_Parcela = CP.Codigo)');

      if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
        begin
          sql.add('where LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan and PL.Status = :Status and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
          Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
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
          sql.add('where LF.Codigo_Empresa = :Empresa and PL.Status = :Status and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
          Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
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
          sql.add('where LF.Codigo_Empresa = :Empresa and PL.Status = :Status and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
          //sql.add(' and PLH.Data_Pagamento between :DI2 and :DF2');
          Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

          //Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
          //Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

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
        end;
        Parameters.ParamByName('Tipo').value:= 'PAGAR';
        Parameters.ParamByName('Tipo2').value:= 'RECEBER';

        //if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) or (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2)then
        //begin
          if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
          begin
            Parameters.ParamByName('Status').Value:= 'PAGO';
          end
          else
          begin
            Parameters.ParamByName('Status').Value:= 'PENDENTE';
          end;
        //end;

        if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 0) then
        begin
          Parameters.ParamByName('Conta1').Value:= 0;
          Parameters.ParamByName('Conta2').Value:= 1;
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 1) then
        begin
          Parameters.ParamByName('Conta1').Value:= 0;
          Parameters.ParamByName('Conta2').Value:= 0;
        end
        else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 2) then
        begin
          Parameters.ParamByName('Conta1').Value:= 1;
          Parameters.ParamByName('Conta2').Value:= 1;
        end;

        open;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
      begin
          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and PL.N_Documento = :Documento and LF.Tipo = :Tipo_Lan and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
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
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and PL.N_Documento = :Documento and LF.Tipo = :Tipo_Lan and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
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
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and PL.N_Documento = :Documento and LF.Tipo = :Tipo_Lan and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
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
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
          end;
          Parameters.ParamByName('Tipo').value:= 'PAGAR';
          Parameters.ParamByName('Tipo2').value:= 'RECEBER';

          if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 0) then
          begin
            Parameters.ParamByName('Conta1').Value:= 0;
            Parameters.ParamByName('Conta2').Value:= 1;
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 1) then
          begin
            Parameters.ParamByName('Conta1').Value:= 0;
            Parameters.ParamByName('Conta2').Value:= 0;
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 2) then
          begin
            Parameters.ParamByName('Conta1').Value:= 1;
            Parameters.ParamByName('Conta2').Value:= 1;
          end;

          open;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) then
      begin
          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF and PL.Status = :Status and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
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
            sql.add('where LF.Codigo_Empresa = :Empresa and PL.Status = :Status and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
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
            sql.add('where LF.Codigo_Empresa = :Empresa and PL.Status = :Status and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
            //sql.add(' and PLH.Data_Pagamento between :DI2 and :DF2');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
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

            //Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            //Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

          end;
          Parameters.ParamByName('Tipo').value:= 'PAGAR';
          Parameters.ParamByName('Tipo2').value:= 'RECEBER';

          //if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) or (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2)then
          //begin
            if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Status').Value:= 'PAGO';
            end
            else
            begin
              Parameters.ParamByName('Status').Value:= 'PENDENTE';
            end;
          //end;

          if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 0) then
          begin
            Parameters.ParamByName('Conta1').Value:= 0;
            Parameters.ParamByName('Conta2').Value:= 1;
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 1) then
          begin
            Parameters.ParamByName('Conta1').Value:= 0;
            Parameters.ParamByName('Conta2').Value:= 0;
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 2) then
          begin
            Parameters.ParamByName('Conta1').Value:= 1;
            Parameters.ParamByName('Conta2').Value:= 1;
          end;

          open;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) then
      begin
          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Codigo and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF  and PL.Status = :Status and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
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
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and PL.Status = :Status and LF.Codigo_Plano = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
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
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and PL.Status = :Status and LF.Codigo_Plano = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
            //sql.add(' and PLH.Data_Pagamento between :DI2 and :DF2');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
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

            //Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            //Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

          end;
          Parameters.ParamByName('Tipo').value:= 'PAGAR';
          Parameters.ParamByName('Tipo2').value:= 'RECEBER';

          //if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) or (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2)then
          //begin
            if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Status').Value:= 'PAGO';
            end
            else
            begin
              Parameters.ParamByName('Status').Value:= 'PENDENTE';
            end;
          //end;

          if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 0) then
          begin
            Parameters.ParamByName('Conta1').Value:= 0;
            Parameters.ParamByName('Conta2').Value:= 1;
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 1) then
          begin
            Parameters.ParamByName('Conta1').Value:= 0;
            Parameters.ParamByName('Conta2').Value:= 0;
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 2) then
          begin
            Parameters.ParamByName('Conta1').Value:= 1;
            Parameters.ParamByName('Conta2').Value:= 1;
          end;

          open;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 4) then
      begin
          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 4) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Departamento = :Codigo and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF  and PL.Status = :Status and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
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
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 4) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 1) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and PL.Status = :Status and LF.Codigo_Departamento = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
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
          else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 4) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and PL.Status = :Status and LF.Codigo_Departamento = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF and (LF.Conta_Fixa = :Conta1 or LF.Conta_Fixa = :Conta2)');
            //sql.add(' and PLH.Data_Pagamento between :DI2 and :DF2');
            Parameters.ParamByName('Empresa').value:= Codigo_Empresa;
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

            //Parameters.ParamByName('DI2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            //Parameters.ParamByName('DF2').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);

          end;
          Parameters.ParamByName('Tipo').value:= 'PAGAR';
          Parameters.ParamByName('Tipo2').value:= 'RECEBER';

          //if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) or (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2)then
          //begin
            if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Status').Value:= 'PAGO';
            end
            else
            begin
              Parameters.ParamByName('Status').Value:= 'PENDENTE';
            end;
          //end;

          if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 0) then
          begin
            Parameters.ParamByName('Conta1').Value:= 0;
            Parameters.ParamByName('Conta2').Value:= 1;
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 1) then
          begin
            Parameters.ParamByName('Conta1').Value:= 0;
            Parameters.ParamByName('Conta2').Value:= 0;
          end
          else if (FrmConsulta_Lancamentos_Financeiros.RGConta_Fixa.ItemIndex = 2) then
          begin
            Parameters.ParamByName('Conta1').Value:= 1;
            Parameters.ParamByName('Conta2').Value:= 1;
          end;

          open;
      end;
    end;
end;

procedure TFrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.Atualiza_Query2(N_Documento: AnsiString);
begin
  with ADOQuery2, sql do
  begin
    close;
    clear;
    add('select PLH.*, CP.Descricao as Cond_Pag, CC.Conta, Ch.N_Cheque from Parcelas_Lancamentos_Historico PLH');
    add('left join Condicao_Pagamento CP on (PLH.Codigo_Forma_Pagamento = CP.Codigo)');
    add('left join Conta_Corrente CC on (PLH.Codigo_Conta = CC.Codigo)');
    add('left join Cheque Ch on (PLH.Codigo_Cheque = Ch.Codigo)');
    if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex <> 2) then
      add('where PLH.N_Documento = :Codigo ')
    else
      add('where PLH.N_Documento = :Codigo and PLH.Data_Pagamento between :DI and :DF');

    Parameters.ParamByName('Codigo').Value:= N_Documento;

    if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 2) then
    begin
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
    end;

    open;
  end;
end;

procedure TFrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.FormCreate(Sender: TObject);
begin
  if (FrmConsulta_Lancamentos_Financeiros.CBMostrar_Historico.Checked) then
  begin
    QRBand5.Enabled:= true;
    QRSubDetail1.Enabled:= true;
    QRBand6.Enabled:= true;
  end
  else
  begin
    QRBand5.Enabled:= false;
    QRSubDetail1.Enabled:= false;
    QRBand6.Enabled:= false;
  end;
  //QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.QRDBText1Print(
  sender: TObject; var Value: string);
begin
  //ADOQuery2.Close;
  //ADOQuery2.Parameters.ParamByName('Codigo').Value:= Value;
  //ADOQuery2.Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Inicial.Text);
  //ADOQuery2.Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Lancamentos_Financeiros.MEdtData_Final.Text);
  //ADOQuery2.Open;
  Atualiza_Query2(Value);
end;

procedure TFrmRel_Consulta_Lancamento_Financeiro_Sintetico_CliForn.QuickRep1BeforePrint(Sender: TCustomQuickRep;
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
    LblConsulta_Lancamento.Caption:= 'Departamento'
  else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 5) then
    LblConsulta_Lancamento.Caption:= 'Forma Pag.';

  if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
    LblTipo_Conta.Caption:= 'Débito'
  else if (FrmConsulta_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
    LblTipo_Conta.Caption:= 'Crédito';

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

end;
end.
