unit URel_Consulta_Venda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Venda = class(TForm)
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
    QRLabel20: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel30: TQRLabel;
    QRBand3: TQRBand;
    QRDBValor: TQRDBText;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand1: TQRBand;
    ADOQuery1: TADOQuery;
    LblStatus: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText30: TQRDBText;
    QRHRule1: TQRHRule;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel36: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRExpr1: TQRExpr;
    QRBand2: TQRBand;
    QRLabel31: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel34: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel47: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText31: TQRDBText;
    QRExpr6: TQRExpr;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRExpr9: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRExpr13: TQRExpr;
    QRLabel39: TQRLabel;
    QRLabel56: TQRLabel;
    QRExpr14: TQRExpr;
    QRLabel57: TQRLabel;
    QRExpr15: TQRExpr;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1N_Pedido: TStringField;
    ADOQuery1N_Pre_Venda: TStringField;
    ADOQuery1COO: TStringField;
    ADOQuery1COO_Vin: TStringField;
    ADOQuery1CCF: TStringField;
    ADOQuery1Codigo_Cliente: TIntegerField;
    ADOQuery1Codigo_Empresa: TIntegerField;
    ADOQuery1Codigo_Veiculo: TIntegerField;
    ADOQuery1Codigo_Funcionario: TIntegerField;
    ADOQuery1Codigo_Tabela_Preco: TIntegerField;
    ADOQuery1Data_Venda: TDateTimeField;
    ADOQuery1Hora_Entrega: TStringField;
    ADOQuery1Qtde_Itens: TIntegerField;
    ADOQuery1Qtde_Servicos: TIntegerField;
    ADOQuery1Total_Produtos: TFloatField;
    ADOQuery1Total_Servicos: TFloatField;
    ADOQuery1Desc_Acr: TFloatField;
    ADOQuery1Tipo_Desc_Acr: TStringField;
    ADOQuery1Total_Pedido: TFloatField;
    ADOQuery1Tipo: TStringField;
    ADOQuery1Status: TStringField;
    ADOQuery1Status_OS: TStringField;
    ADOQuery1Valor_Recebido: TFloatField;
    ADOQuery1Troco: TFloatField;
    ADOQuery1Mesclada: TIntegerField;
    ADOQuery1Problema_Reclamado: TStringField;
    ADOQuery1Problema_Constatado: TStringField;
    ADOQuery1Solucao: TStringField;
    ADOQuery1DAVC: TStringField;
    ADOQuery1DAVAnt: TStringField;
    ADOQuery1Chave_NFe: TStringField;
    ADOQuery1Protocolo_NFe: TStringField;
    ADOQuery1N_Nota_Fiscal: TIntegerField;
    ADOQuery1Codigo_Registro: TAutoIncField;
    ADOQuery1Codigo_1: TIntegerField;
    ADOQuery1N_Item: TStringField;
    ADOQuery1Codigo_Produto: TIntegerField;
    ADOQuery1Codigo_Venda: TStringField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1NCM: TStringField;
    ADOQuery1Origem: TStringField;
    ADOQuery1CFOP: TStringField;
    ADOQuery1UN: TStringField;
    ADOQuery1Tipo_Calculo_BC_ICMS: TStringField;
    ADOQuery1Tipo_Recolhimento: TStringField;
    ADOQuery1ICMS: TStringField;
    ADOQuery1CST: TStringField;
    ADOQuery1CSOSN: TStringField;
    ADOQuery1Base_Reduzida: TStringField;
    ADOQuery1Base_Acrescida: TStringField;
    ADOQuery1BC: TStringField;
    ADOQuery1Valor_ICMS: TStringField;
    ADOQuery1Tipo_Calculo_BC_ICMS_ST: TStringField;
    ADOQuery1MVAST: TStringField;
    ADOQuery1ICMS_ST: TStringField;
    ADOQuery1CST_ST: TStringField;
    ADOQuery1Base_Reduzida_ST: TStringField;
    ADOQuery1Base_Acrescida_ST: TStringField;
    ADOQuery1BC_ST: TStringField;
    ADOQuery1Valor_ICMS_ST: TStringField;
    ADOQuery1Aliquota_Calculo_Credito: TStringField;
    ADOQuery1Credito_ICMS: TStringField;
    ADOQuery1Tipo_Calculo_IPI: TStringField;
    ADOQuery1IPI: TStringField;
    ADOQuery1CST_IPI: TStringField;
    ADOQuery1Base_Reduzida_IPI: TStringField;
    ADOQuery1Base_Acrescida_IPI: TStringField;
    ADOQuery1BC_IPI: TStringField;
    ADOQuery1Valor_IPI: TFloatField;
    ADOQuery1Tipo_Calculo_PIS: TStringField;
    ADOQuery1PIS: TStringField;
    ADOQuery1CST_PIS: TStringField;
    ADOQuery1Base_Reduzida_PIS: TStringField;
    ADOQuery1Base_Acrescida_PIS: TStringField;
    ADOQuery1BC_PIS: TStringField;
    ADOQuery1Valor_PIS: TFloatField;
    ADOQuery1Tipo_Calculo_COFINS: TStringField;
    ADOQuery1COFINS: TStringField;
    ADOQuery1CST_COFINS: TStringField;
    ADOQuery1Base_Reduzida_COFINS: TStringField;
    ADOQuery1Base_Acrescida_COFINS: TStringField;
    ADOQuery1BC_COFINS: TStringField;
    ADOQuery1Valor_COFINS: TFloatField;
    ADOQuery1Qtde: TFloatField;
    ADOQuery1Qtde_Entregue: TFloatField;
    ADOQuery1Qtde_Restante: TFloatField;
    ADOQuery1Valor_Unitario: TFloatField;
    ADOQuery1Desc_Acr_1: TFloatField;
    ADOQuery1Tipo_Desc_Acr_1: TStringField;
    ADOQuery1Valor_Frete: TFloatField;
    ADOQuery1Valor_Seguro: TFloatField;
    ADOQuery1Outras_Despesas: TFloatField;
    ADOQuery1Sub_Total: TFloatField;
    ADOQuery1Sub_Total_Liquido: TFloatField;
    ADOQuery1Cancelado: TStringField;
    ADOQuery1Indica_Valor_Total: TStringField;
    ADOQuery1Nome_Nome_Fantasia: TStringField;
    ADOQuery1Nome: TStringField;
    ADOQuery1Tabela: TStringField;
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
  FrmRel_Consulta_Venda: TFrmRel_Consulta_Venda;

implementation

uses UGeral, UDeclaracao, UConsulta_Venda;

{$R *.dfm}

procedure TFrmRel_Consulta_Venda.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Venda.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  {if FrmConsulta_Venda.DBGrid1.SelectedRows.CurrentRowSelected then
    PrintBand:= true
  else
    PrintBand:= false; }
end;

procedure TFrmRel_Consulta_Venda.QuickRep1BeforePrint(Sender: TCustomQuickRep;
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

  {if (FrmConsulta_Venda.RGTipo.ItemIndex = 2) then
  begin
    with ADOQuery1, sql do
    begin
      close;
      clear;
      add('select Ped.*, IP.*, Cli.Nome_Nome_Fantasia, Fun.Nome, TP.Descricao as Tabela, P.Codigo_Venda, P.Descricao');
      add('from Pedido Ped');
      add('inner join Itens_Pedido IP on (Ped.Codigo = IP.Codigo)');
      add('left join Cliente Cli on (Ped.Codigo_Cliente = Cli.Codigo)');
      add('left join Funcionario Fun on (Ped.Codigo_Funcionario = Fun.Codigo)');
      add('inner join Tabela_Preco TP on (Ped.Codigo_Tabela_Preco = TP.Codigo)');
      add('inner join Produto P on (IP.Codigo_Produto = P.Codigo)');

      if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
      begin
        sql.Add('where Ped.Codigo_Empresa = :Empresa ');
        sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and Ped.Tipo = :Tipo order by Ped.N_Pedido');
      end

      else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
      begin
        sql.Add('where Ped.Codigo_Empresa = :Empresa ');
        sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and Ped.Tipo = :Tipo order by Ped.N_Pre_Venda');
      end

      else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
      begin
        sql.Add('where Ped.Codigo_Empresa = :Empresa ');
        sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and Ped.Tipo = :Tipo order by Cli.Nome_Nome_Fantasia');
      end

      else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
      begin
        sql.Add('where Ped.Codigo_Empresa = :Empresa ');
        sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and Ped.Tipo = :Tipo order by Fun.Nome');
      end

      else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 4) then
      begin
        sql.Add('where Ped.Codigo_Empresa = :Empresa ');
        sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and Ped.Tipo = :Tipo order by TP.Descricao');
      end;
      Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
      Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
      Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

      Parameters.ParamByName('Status').Value:= 'PAGO';

      Parameters.ParamByName('Tipo').Value:= 'PDV';

      open;
    end;
  end
  else
  begin}
  if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 0) then
    begin
      with ADOQuery1, sql do
      begin
        close;
        clear;
        add('select Ped.*, IP.*, Cli.Nome_Nome_Fantasia, Fun.Nome, TP.Descricao as Tabela');
        add('from Pedido Ped');
        add('inner join Itens_Pedido IP on (Ped.Codigo = IP.Codigo)');
        add('left join Cliente Cli on (Ped.Codigo_Cliente = Cli.Codigo)');
        add('left join Funcionario Fun on (Ped.Codigo_Funcionario = Fun.Codigo)');
        add('inner join Tabela_Preco TP on (Ped.Codigo_Tabela_Preco = TP.Codigo)');

        if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pedido');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pre_Venda');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Cli.Nome_Nome_Fantasia');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Fun.Nome');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 4) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by TP.Descricao');
        end;
        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

          if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';

        open;
      end;
    end
    else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 1) then
    begin
      with ADOQuery1, sql do
      begin
        close;
        clear;
        add('select Ped.*, IP.*, Cli.Nome_Nome_Fantasia, Fun.Nome, TP.Descricao as Tabela');
        add('from Pedido Ped');
        add('inner join Itens_Pedido IP on (Ped.Codigo = IP.Codigo)');
        add('left join Cliente Cli on (Ped.Codigo_Cliente = Cli.Codigo)');
        add('left join Funcionario Fun on (Ped.Codigo_Funcionario = Fun.Codigo)');
        add('inner join Tabela_Preco TP on (Ped.Codigo_Tabela_Preco = TP.Codigo)');

        if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pedido = :Pedido ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pedido');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pedido = :Pedido ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pre_Venda');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pedido = :Pedido ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Cli.Nome_Nome_Fantasia');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pedido = :Pedido ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Fun.Nome');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 4) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pedido = :Pedido ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by TP.Descricao');
        end;
        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('Pedido').Value:= FrmConsulta_Venda.EdtPedido.Text;
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

          if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';

        open;
      end;
    end
    else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 2) then
    begin
      with ADOQuery1, sql do
        begin
          close;
          sql.clear;
          add('select Ped.*, IP.*, Cli.Nome_Nome_Fantasia, Fun.Nome, TP.Descricao as Tabela');
          add('from Pedido Ped');
          add('inner join Itens_Pedido IP on (Ped.Codigo = IP.Codigo)');
          add('left join Cliente Cli on (Ped.Codigo_Cliente = Cli.Codigo)');
          add('left join Funcionario Fun on (Ped.Codigo_Funcionario = Fun.Codigo)');
          add('inner join Tabela_Preco TP on (Ped.Codigo_Tabela_Preco = TP.Codigo)');

          if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pre_Venda = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pedido');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pre_Venda = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pre_Venda');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pre_Venda = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Cli.Nome_Nome_Fantasia');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pre_Venda = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Fun.Nome');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 4) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pre_Venda = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by TP.Descricao');
          end;
          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Pedido').Value:= FrmConsulta_Venda.EdtPedido.Text;
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

          if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';

          open;
        end;
    end
    else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 3) then
    begin
      with ADOQuery1, sql do
        begin
          close;
          sql.clear;
          add('select Ped.*, IP.*, Cli.Nome_Nome_Fantasia, Fun.Nome, TP.Descricao as Tabela');
          add('from Pedido Ped');
          add('inner join Itens_Pedido IP on (Ped.Codigo = IP.Codigo)');
          add('left join Cliente Cli on (Ped.Codigo_Cliente = Cli.Codigo)');
          add('left join Funcionario Fun on (Ped.Codigo_Funcionario = Fun.Codigo)');
          add('inner join Tabela_Preco TP on (Ped.Codigo_Tabela_Preco = TP.Codigo)');

          if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Cliente = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pedido');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Cliente = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pre_Venda');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Cliente = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Cli.Nome_Nome_Fantasia');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Cliente = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Fun.Nome');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 4) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Cliente = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by TP.Descricao');
          end;
          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Pedido').Value:= StrToInt(FrmConsulta_Venda.EdtCodigo.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

          if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';

          open;
        end;
    end
    else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 4) then
    begin
      with ADOQuery1, sql do
        begin
          close;
          sql.clear;
          add('select Ped.*, IP.*, Cli.Nome_Nome_Fantasia, Fun.Nome, TP.Descricao as Tabela');
          add('from Pedido Ped');
          add('inner join Itens_Pedido IP on (Ped.Codigo = IP.Codigo)');
          add('left join Cliente Cli on (Ped.Codigo_Cliente = Cli.Codigo)');
          add('left join Funcionario Fun on (Ped.Codigo_Funcionario = Fun.Codigo)');
          add('inner join Tabela_Preco TP on (Ped.Codigo_Tabela_Preco = TP.Codigo)');

          if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Funcionario = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pedido');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Funcionario = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pre_Venda');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Funcionario = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Cli.Nome_Nome_Fantasia');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Funcionario = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Fun.Nome');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 4) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Funcionario = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by TP.Descricao');
          end;
          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Pedido').Value:= StrToInt(FrmConsulta_Venda.EdtCodigo.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

          if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';

          open;
        end;
    end
    else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 5) then
    begin
      with ADOQuery1, sql do
        begin
          close;
          sql.clear;
          add('select Ped.*, IP.*, Cli.Nome_Nome_Fantasia, Fun.Nome, TP.Descricao as Tabela');
          add('from Pedido Ped');
          add('inner join Itens_Pedido IP on (Ped.Codigo = IP.Codigo)');
          add('left join Cliente Cli on (Ped.Codigo_Cliente = Cli.Codigo)');
          add('left join Funcionario Fun on (Ped.Codigo_Funcionario = Fun.Codigo)');
          add('inner join Tabela_Preco TP on (Ped.Codigo_Tabela_Preco = TP.Codigo)');

          if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Tabela_Preco = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pedido');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Tabela_Preco = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Ped.N_Pre_Venda');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Tabela_Preco = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Cli.Nome_Nome_Fantasia');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Tabela_Preco = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by Fun.Nome');
          end

          else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 4) then
          begin
            sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Tabela_Preco = :Pedido ');
            sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status order by TP.Descricao');
          end;
          Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
          Parameters.ParamByName('Pedido').Value:= StrToInt(FrmConsulta_Venda.EdtCodigo.Text);
          Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
          Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

          if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';

          open;
        end;
    end
  //end;

end;
end.
