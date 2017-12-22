unit URel_Consulta_Lancamento_Financeiro_Sintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Lancamento_Financeiro_Sintetico = class(TForm)
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
    ADOQuery1: TADOQuery;
    QRBand3: TQRBand;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
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
    QRLabel31: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText9: TQRDBText;
    QRBand2: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel32: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel1: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel2: TQRLabel;
    QRExpr5: TQRExpr;
    ADOQuery1Status: TStringField;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    ADOQuery1Nome: TStringField;
    ADOQuery1N_Cheque: TStringField;
    ADOQuery1Conta: TStringField;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    ADOQuery1Data_Pagamento: TDateTimeField;
    ADOQuery1Valor_Pagar: TFloatField;
    QRLabel12: TQRLabel;
    QRDBText5: TQRDBText;
    ADOQuery1Dias_Venc: TIntegerField;
    ADOQuery1Cond_Pag: TStringField;
    QRLabel14: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    ADOQuery1Valor_Restante: TFloatField;
    ADOQuery1Valor_Pago: TFloatField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ADOQuery1Data_PagamentoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Lancamento_Financeiro_Sintetico: TFrmRel_Consulta_Lancamento_Financeiro_Sintetico;

implementation

uses UDM, UConsulta_Lancamentos_Financeiros, UDeclaracao, UGeral;

{$R *.dfm}

procedure TFrmRel_Consulta_Lancamento_Financeiro_Sintetico.ADOQuery1Data_PagamentoGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if (Sender.AsString = '30/12/1899') then
    Text:= ''
  else
    Text:= Sender.AsString;

end;

procedure TFrmRel_Consulta_Lancamento_Financeiro_Sintetico.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Lancamento_Financeiro_Sintetico.QuickRep1BeforePrint(Sender: TCustomQuickRep;
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
    LblConsulta_Lancamento.Caption:= 'Plano Financeiro';

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
      sql.add('select CH.N_Cheque, CC.Conta, PL.Codigo, PL.N_Documento, LF.Codigo_Empresa, LF.Tipo, LF.Codigo_Cli_For, ');
      sql.add('LF.Historico, LF.Data_Lancamento, PL.Data_Vencimento, PL.Data_Pagamento, PL.Valor, PL.Valor_Pagar, PL.Status,');
      sql.add('PL.Valor_Restante, PL.Valor_Pago, datediff(day, getDate(), PL.Data_Vencimento) as Dias_Venc, Nome = case when (LF.Tipo = :Tipo) then');
      sql.add('(select Forn.Nome_Fantasia from Fornecedor Forn where LF.Codigo_Cli_For = Forn.Codigo)');
      sql.add('when (LF.Tipo = :Tipo2) then');
      sql.add('(select Cli.Nome_Nome_Fantasia from Cliente Cli where LF.Codigo_Cli_For = Cli.Codigo) end, ');
      sql.add('CP.Descricao as Cond_Pag');
      sql.add('from Lancamento_Financeiro LF');
      sql.add('left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)');
      sql.add('left join Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo)');
      sql.Add('left join Cheque CH on (PL.Codigo_Cheque = CH.Codigo)');
      sql.Add('left join Conta_Corrente CC on (PL.Codigo_Conta = CC.Codigo)');
      sql.add('left join Condicao_Pagamento CP on (PL.Codigo_Forma_Pagamento_Parcela = CP.Codigo)');

      if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) then
      begin
        if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 0) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
        begin
          sql.add('where LF.Codigo_Empresa = :Empresa and LF.Data_Lancamento between :DI and :DF and LF.Tipo = :Tipo_Lan and PL.Status = :Status');
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
          sql.add('where LF.Codigo_Empresa = :Empresa and PL.Status = '+QuotedStr('PENDENTE')+' and PL.Data_Vencimento between :DI and :DF and LF.Tipo = :Tipo_Lan');
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
          sql.add('where LF.Codigo_Empresa = :Empresa and PL.Status = '+QuotedStr('PAGO')+' and PL.Data_Pagamento between :DI and :DF and LF.Tipo = :Tipo_Lan');
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
        end;
        Parameters.ParamByName('Tipo').value:= 'PAGAR';
        Parameters.ParamByName('Tipo2').value:= 'RECEBER';

        if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
        begin
          if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
          begin
            Parameters.ParamByName('Status').Value:= 'PAGO';
          end
          else
          begin
            Parameters.ParamByName('Status').Value:= 'PENDENTE';
          end;
        end;

        open;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
      begin
          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 1) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and PL.N_Documento = :Documento and LF.Tipo = :Tipo_Lan');
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
            sql.add('where LF.Codigo_Empresa = :Empresa and PL.N_Documento = :Documento and LF.Tipo = :Tipo_Lan');
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
            sql.add('where LF.Codigo_Empresa = :Empresa and PL.N_Documento = :Documento and LF.Tipo = :Tipo_Lan');
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
          open;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) then
      begin
          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 2) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF and PL.Status = :Status');
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
            sql.add('where LF.Codigo_Empresa = :Empresa and PL.Status = '+QuotedStr('PENDENTE')+' and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF');
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
            sql.add('where LF.Codigo_Empresa = :Empresa and PL.Status = '+QuotedStr('PAGO')+' and LF.Codigo_Cli_For = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF');
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
          end;
          Parameters.ParamByName('Tipo').value:= 'PAGAR';
          Parameters.ParamByName('Tipo2').value:= 'RECEBER';

          if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Status').Value:= 'PAGO';
            end
            else
            begin
              Parameters.ParamByName('Status').Value:= 'PENDENTE';
            end;
          end;
          open;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) then
      begin
          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 3) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Plano = :Codigo and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF  and PL.Status = :Status');
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
            sql.add('where LF.Codigo_Empresa = :Empresa and PL.Status = '+QuotedStr('PENDENTE')+' and LF.Codigo_Plano = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF');
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
            sql.add('where LF.Codigo_Empresa = :Empresa and PL.Status = '+QuotedStr('PAGO')+' and LF.Codigo_Plano = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF');
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
          end;
          Parameters.ParamByName('Tipo').value:= 'PAGAR';
          Parameters.ParamByName('Tipo2').value:= 'RECEBER';

          if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Status').Value:= 'PAGO';
            end
            else
            begin
              Parameters.ParamByName('Status').Value:= 'PENDENTE';
            end;
          end;
          open;
      end
      else if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 4) then
      begin
          if (FrmConsulta_Lancamentos_Financeiros.RGConsulta_Lancamento.ItemIndex = 4) and (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Codigo_Departamento = :Codigo and LF.Tipo = :Tipo_Lan and LF.Data_Lancamento between :DI and :DF  and PL.Status = :Status');
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
            sql.add('where LF.Codigo_Empresa = :Empresa and PL.Status = '+QuotedStr('PENDENTE')+' and LF.Codigo_Departamento = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Vencimento between :DI and :DF');
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
            sql.add('where LF.Codigo_Empresa = :Empresa and PL.Status = '+QuotedStr('PAGO')+' and LF.Codigo_Departamento = :Codigo and LF.Tipo = :Tipo_Lan and PL.Data_Pagamento between :DI and :DF');
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
          end;
          Parameters.ParamByName('Tipo').value:= 'PAGAR';
          Parameters.ParamByName('Tipo2').value:= 'RECEBER';

          if (FrmConsulta_Lancamentos_Financeiros.RGData.ItemIndex = 0) then
          begin
            if (FrmConsulta_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
            begin
              Parameters.ParamByName('Status').Value:= 'PAGO';
            end
            else
            begin
              Parameters.ParamByName('Status').Value:= 'PENDENTE';
            end;
          end;
          open;
      end;
    end;
end;
end.
