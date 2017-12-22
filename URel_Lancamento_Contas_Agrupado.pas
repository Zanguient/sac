unit URel_Lancamento_Contas_Agrupado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt, QRExport;

type
  TFrmRel_Lancamento_Contas_Agrupado = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBData_Vencimento: TQRDBText;
    QRDBValor: TQRDBText;
    QRDBParcela: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBData_Pagamento: TQRDBText;
    QRGroup1: TQRGroup;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel4: TQRLabel;
    LblTipo_Conta: TQRLabel;
    LblConsulta_Por: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    LblStatus: TQRLabel;
    QRLabel10: TQRLabel;
    LblParametro: TQRLabel;
    QRLabel11: TQRLabel;
    Lblde: TQRLabel;
    Lbla: TQRLabel;
    QRLabel13: TQRLabel;
    QRChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBDescricao: TQRDBText;
    QRExpr1: TQRExpr;
    QRBand2: TQRBand;
    ADOQuery1: TADOQuery;
    ADOQuery1Nome: TStringField;
    ADOQuery1N_Documento: TIntegerField;
    ADOQuery1Data_Lancamento: TDateTimeField;
    ADOQuery1Codigo_Plano: TIntegerField;
    ADOQuery1Data_Vencimento: TDateTimeField;
    ADOQuery1Parcela: TIntegerField;
    ADOQuery1Valor: TFloatField;
    ADOQuery1Codigo: TAutoIncField;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    ADOQuery1Historico: TStringField;
    QRLabel14: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText2: TQRDBText;
    ADOQuery1Valor_Pagar: TFloatField;
    QRLabel18: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel1: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel19: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel20: TQRLabel;
    QRDBText3: TQRDBText;
    ADOQuery1Dias_Venc: TIntegerField;
    QRLabel21: TQRLabel;
    QRDBText4: TQRDBText;
    ADOQuery1Valor_Restante: TFloatField;
    ADOQuery1Desconto: TFloatField;
    ADOQuery1Acrescimo: TFloatField;
    QRLabel22: TQRLabel;
    QRExpr6: TQRExpr;
    QRLabel26: TQRLabel;
    QRExpr7: TQRExpr;
    ADOQuery1Valor_Pago: TFloatField;
    QRLabel27: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel28: TQRLabel;
    QRExpr8: TQRExpr;
    QRLabel29: TQRLabel;
    QRExpr9: TQRExpr;
    QRLabel30: TQRLabel;
    QRHRule1: TQRHRule;
    QRExcelFilter1: TQRExcelFilter;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Lancamento_Contas_Agrupado: TFrmRel_Lancamento_Contas_Agrupado;

implementation

uses UChama_Lancamentos_Financeiros, UGeral, UEscolha_Impressao, UDM,
  UMenu_Geral, UDeclaracao;

{$R *.dfm}

procedure TFrmRel_Lancamento_Contas_Agrupado.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Lancamento_Contas_Agrupado.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;
  //LblPropriedade.Caption:= FrmCarregar_Contas_Pagar.EdtPropriedade.Text;

  if (FrmChama_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
    lblTipo_Conta.Caption:= 'Contas a Pagar'
  else
    lblTipo_Conta.Caption:= 'Contas a Receber';

  if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) then
    LblConsulta_Por.Caption:= 'Número do documento'
  else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) then
    LblConsulta_Por.Caption:= 'Cliente / Fornecedor'
  else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) then
    LblConsulta_Por.Caption:= 'Data de Lançamento'
  else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3) then
    LblConsulta_Por.Caption:= 'Data de Vencimento';

  if (FrmChama_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
    LblStatus.Caption:= 'Pendente'
  else
    LblStatus.Caption:= 'Pago';

  if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) or (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) then
    begin
      QRLabel11.Enabled:= false;
      Lblde.Enabled:= false;
      Lbla.Enabled:= false;
      QRLabel13.Enabled:= false;
      QRLabel10.Enabled:= true;
      LblParametro.Enabled:= true;
      LblParametro.Caption:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
    end
    else if ((FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) or (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3)) then
    begin
      QRLabel10.Enabled:= false;
      LblParametro.Enabled:= false;
      LblParametro.Caption:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
      
      QRLabel11.Enabled:= true;
      Lblde.Enabled:= true;
      Lbla.Enabled:= true;
      QRLabel13.Enabled:= true;
      Lblde.Caption:= FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text;
      Lbla.Caption:= FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text;
    end;
    //LblValor_Total.Caption:= FrmChama_Lancamentos_Financeiros.EdtValor_Total.Text;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  if (FrmChama_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 0) then
    begin
      with ADOQuery1 do
        begin
          close;
          sql.clear;
          sql.add('select Forn.Codigo as Cod, Forn.Nome_Fantasia as Nome, PL.N_Documento, LF.Codigo, LF.Historico, LF.Data_Lancamento, ');
          sql.add('LF.Codigo_Plano, PL.Data_Vencimento, PL.Parcela, PL.Valor_Pagar, PL.Valor, PL.Valor_Restante, PL.Desconto, PL.Acrescimo, PL.Valor_Pago, datediff(day, getDate(), PL.Data_Vencimento) as Dias_Venc from Parcelas_Lancamentos PL');
          sql.add('left join Lancamento_Financeiro LF on(PL.Codigo = LF.Codigo)');
          sql.add('left join Fornecedor Forn on(LF.Codigo_Cli_For = Forn.Codigo)');

          if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.N_Documento = :Parametro and PL.Status = :Pendente order by PL.N_Documento');
            Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and Forn.Nome_Fantasia = :Parametro and PL.Status = :Pendente order by PL.N_Documento');
            Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Data_Lancamento between :DI and :DF and PL.Status = :Pendente order by PL.N_Documento');
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.Data_Vencimento between :DI and :DF and PL.Status = :Pendente order by PL.N_Documento');
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
          end;



          if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.N_Documento = :Parametro and PL.Status = :Pendente order by Forn.Nome_Fantasia');
            Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and Forn.Nome_Fantasia = :Parametro and PL.Status = :Pendente order by Forn.Nome_Fantasia');
            Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Data_Lancamento between :DI and :DF and PL.Status = :Pendente group by Form.Nome_Fantasia order by Forn.Nome_Fantasia');
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.Data_Vencimento between :DI and :DF and PL.Status = :Pendente order by Forn.Nome_Fantasia');
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
          end;



          if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 2) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.N_Documento = :Parametro and PL.Status = :Pendente order by LF.Data_Lancamento');
            Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 2) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and Forn.Nome_Fantasia = :Parametro and PL.Status = :Pendente order by LF.Data_Lancamento');
            Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 2) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Data_Lancamento between :DI and :DF and PL.Status = :Pendente order by LF.Data_Lancamento');
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 2) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.Data_Vencimento between :DI and :DF and PL.Status = :Pendente order by LF.Data_Lancamento');
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
          end;



          if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 3) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.N_Documento = :Parametro and PL.Status = :Pendente order by PL.Data_Vencimento');
            Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 3) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and Forn.Nome_Fantasia = :Parametro and PL.Status = :Pendente order by PL.Data_Vencimento');
            Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 3) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Data_Lancamento between :DI and :DF and PL.Status = :Pendente order by PL.Data_Vencimento');
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 3) then
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.Data_Vencimento between :DI and :DF and PL.Status = :Pendente order by PL.Data_Vencimento');
            Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
            Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
          end;

          Parameters.ParamByName('Tipo').Value:= 'PAGAR';
          if (FrmChama_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Pendente').Value:= 'PENDENTE'
          else
            Parameters.ParamByName('Pendente').Value:= 'PAGO';
          Parameters.ParamByName('Empresa').Value:= codigo_empresa;
          open;
        end;
    end
    else
    if (FrmChama_Lancamentos_Financeiros.RGTipo_Conta.ItemIndex = 1) then
    begin
      with ADOQuery1 do
        begin
          close;
          sql.clear;
          sql.add('select Cli.Codigo as Cod, Cli.Nome_Nome_Fantasia as Nome, PL.N_Documento, LF.Codigo, LF.Historico, LF.Data_Lancamento, ');
          sql.add('LF.Codigo_Plano, PL.Data_Vencimento, PL.Parcela, PL.Valor_Pagar, PL.Valor, PL.Valor_Restante, PL.Desconto, PL.Acrescimo, PL.Valor_Pago, datediff(day, getDate(), PL.Data_Vencimento) as Dias_Venc from Parcelas_Lancamentos PL');
          sql.add('left join Lancamento_Financeiro LF on(PL.Codigo = LF.Codigo)');
          sql.add('left join Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo)');

          if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
          begin
            if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
            begin
              Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.N_Documento = :Parametro and PL.Status = :Pendente order by PL.N_Documento');
              Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
          if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
          begin
            Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
            FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
            abort
          end
          else
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and Cli.Nome_Nome_Fantasia = :Parametro and PL.Status = :Pendente order by PL.N_Documento');
            Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Data_Lancamento between :DI and :DF and PL.Status = :Pendente order by PL.N_Documento');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 0) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.Data_Vencimento between :DI and :DF and PL.Status = :Pendente order by PL.N_Documento');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end;



          if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
          begin
            if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
            begin
              Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.N_Documento = :Parametro and PL.Status = :Pendente order by Cli.Nome_Nome_Fantasia');
              Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
          if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
          begin
            Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
            FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
            abort
          end
          else
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and Cli.Nome_Nome_Fantasia = :Parametro and PL.Status = :Pendente order by Cli.Nome_Nome_Fantasia');
            Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Data_Lancamento between :DI and :DF and PL.Status = :Pendente order by Cli.Nome_Nome_Fantasia');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 1) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.Data_Vencimento between :DI and :DF and PL.Status = :Pendente order by Cli.Nome_Nome_Fantasia');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end;



          if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 2) then
          begin
            if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
            begin
              Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.N_Documento = :Parametro and PL.Status = :Pendente order by LF.Data_Lancamento');
              Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 2) then
          if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
          begin
            Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
            FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
            abort
          end
          else
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and Cli.Nome_Nome_Fantasia = :Parametro and PL.Status = :Pendente order by LF.Data_Lancamento');
            Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 2) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Data_Lancamento between :DI and :DF and PL.Status = :Pendente order by LF.Data_Lancamento');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 2) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.Data_Vencimento between :DI and :DF and PL.Status = :Pendente order by LF.Data_Lancamento');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end;



          if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 0) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 3) then
          begin
            if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
            begin
              Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.N_Documento = :Parametro and PL.Status = :Pendente order by PL.Data_Vencimento');
              Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 1) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 3) then
          if (FrmChama_Lancamentos_Financeiros.EdtConsulta.Text = '') then
          begin
            Application.MessageBox('Por favor, informe um parametro a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
            FrmChama_Lancamentos_Financeiros.EdtConsulta.SetFocus;
            abort
          end
          else
          begin
            sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and Cli.Nome_Nome_Fantasia = :Parametro and PL.Status = :Pendente order by PL.Data_Vencimento');
            Parameters.ParamByName('Parametro').Value:= FrmChama_Lancamentos_Financeiros.EdtConsulta.Text;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 2) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 3) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and LF.Data_Lancamento between :DI and :DF and PL.Status = :Pendente order by PL.Data_Vencimento');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end
          else if (FrmChama_Lancamentos_Financeiros.RGConsulta_Por.ItemIndex = 3) and (FrmChama_Lancamentos_Financeiros.RGOrdena_Por.ItemIndex = 3) then
          begin
            if (FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text = '  /  /    ') or (FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text = '  /  /    ') then
            begin
              Application.MessageBox('Por favor, informe uma data a consultar', 'Impossível continuar', MB_OK+MB_ICONHAND);
              FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.SetFocus;
              abort
            end
            else
            begin
              sql.add('where LF.Codigo_Empresa = :Empresa and LF.Tipo = :Tipo and PL.Data_Vencimento between :DI and :DF and PL.Status = :Pendente order by PL.Data_Vencimento');
              Parameters.ParamByName('DI').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Inicial.Text);
              Parameters.ParamByName('DF').Value:= StrToDateTime(FrmChama_Lancamentos_Financeiros.MEdtData_Final.Text);
            end;
          end;


          Parameters.ParamByName('Tipo').Value:= 'RECEBER';
          if (FrmChama_Lancamentos_Financeiros.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Pendente').Value:= 'PENDENTE'
          else
            Parameters.ParamByName('Pendente').Value:= 'PAGO';
          Parameters.ParamByName('Empresa').Value:= codigo_empresa;
          open;
        end;
    end;
end;

end.
