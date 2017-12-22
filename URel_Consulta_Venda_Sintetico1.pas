unit URel_Consulta_Venda_Sintetico1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Venda_Sintetico1 = class(TForm)
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
    QRBand1: TQRBand;
    ADOQuery1: TADOQuery;
    LblStatus: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel28: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel32: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText22: TQRDBText;
    QRDBText25: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRBand2: TQRBand;
    QRExpr3: TQRExpr;
    QRLabel45: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1N_Pedido: TStringField;
    ADOQuery1Data_Venda: TDateTimeField;
    ADOQuery1Total_Pedido: TFloatField;
    ADOQuery1Nome_Nome_Fantasia: TStringField;
    ADOQuery1Nome: TStringField;
    ADOQuery1Tabela: TStringField;
    ADOQuery1Codigo_Venda: TStringField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1UN: TStringField;
    ADOQuery1Qtde: TFloatField;
    ADOQuery1Valor_Unitario: TFloatField;
    ADOQuery1Sub_Total: TFloatField;
    ADOQuery1Cancelado: TStringField;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    ADOQuery1Valor_Compra: TFloatField;
    QRLabel10: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel14: TQRLabel;
    QRExpr4: TQRExpr;
    ADOQuery1Valor_Compra_Nota: TFloatField;
    QRLabel15: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel16: TQRLabel;
    QRExpr6: TQRExpr;
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
  FrmRel_Consulta_Venda_Sintetico1: TFrmRel_Consulta_Venda_Sintetico1;

implementation

uses UGeral, UDeclaracao, UConsulta_Venda;

{$R *.dfm}

procedure TFrmRel_Consulta_Venda_Sintetico1.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Venda_Sintetico1.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  {if FrmConsulta_Venda.DBGrid1.SelectedRows.CurrentRowSelected then
    PrintBand:= true
  else
    PrintBand:= false; }
end;

procedure TFrmRel_Consulta_Venda_Sintetico1.QuickRep1BeforePrint(Sender: TCustomQuickRep;
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
    with ADOQuery1, sql do
    begin
      close;
      clear;
      add('select Ped.Codigo, Ped.N_Pedido, Ped.Data_Venda, Ped.Total_Pedido, CP.Descricao as Cond_Pag,');
      add('Cli.Nome_Nome_Fantasia, Fun.Nome, TP.Descricao as Tabela,');
      add('IP.Codigo_Venda, IP.Descricao, IP.UN, IP.Qtde, IP.Valor_Compra, IP.Valor_Unitario, (IP.Valor_Unitario * IP.Qtde) as Sub_Total,');
      add('IP.Cancelado, IP.Valor_Compra_Nota from Pedido Ped');
      add('left join Cliente Cli on (Ped.Codigo_Cliente = Cli.Codigo)');
      add('left join Funcionario Fun on (Ped.Codigo_Funcionario = Fun.Codigo)');
      add('left join Tabela_Preco TP on (Ped.Codigo_Tabela_Preco = TP.Codigo)');
      add('left join Itens_Pedido IP on (Ped.Codigo = IP.Codigo)');
      add('left join Condicao_Pagamento CP on (Ped.Codigo_Forma_Pag = CP.Codigo)');

    if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 0) then
      begin
        if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Ped.N_Pedido');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Ped.Data_Venda');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Cli.Nome_Nome_Fantasia');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Fun.Nome');
        end;

        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

        if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'PAGO'
        else
          Parameters.ParamByName('Status').Value:= 'PENDENTE';

        Parameters.ParamByName('Cancelado').Value:= 'N';

        open;
      end
      else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 1) then
      begin
        if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pedido = :Pedido ');
          sql.add('and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Ped.N_Pedido');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pedido = :Pedido ');
          sql.add('and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Ped.Data_Venda');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pedido = :Pedido ');
          sql.add('and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Cli.Nome_Nome_Fantasia');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pedido = :Pedido ');
          sql.add('and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Fun.Nome');
        end;
        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('Pedido').Value:= FrmConsulta_Venda.EdtPedido.Text;
        //Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
        //Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

          if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
            Parameters.ParamByName('Status').Value:= 'PAGO'
          else
            Parameters.ParamByName('Status').Value:= 'PENDENTE';

          Parameters.ParamByName('Cancelado').Value:= 'N';

        open;
      end
      else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 2) then
      begin
        if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pre_Venda = :Pedido ');
          sql.add('and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Ped.N_Pedido');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pre_Venda = :Pedido ');
          sql.add('and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Ped.Data_Venda');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pre_Venda = :Pedido ');
          sql.add('and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Cli.Nome_Nome_Fantasia');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.N_Pre_Venda = :Pedido ');
          sql.add('and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Fun.Nome');
        end;
        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('Pedido').Value:= FrmConsulta_Venda.EdtPedido.Text;
        //Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
        //Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

        if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'PAGO'
        else
          Parameters.ParamByName('Status').Value:= 'PENDENTE';

        Parameters.ParamByName('Cancelado').Value:= 'N';

        open;
      end
      else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 3) then
      begin
        if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Cliente = :Pedido ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Ped.N_Pedido');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Cliente = :Pedido ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Ped.Data_Venda');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Cliente = :Pedido ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Cli.Nome_Nome_Fantasia');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Cliente = :Pedido ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Fun.Nome');
        end;
        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('Pedido').Value:= StrToInt(FrmConsulta_Venda.EdtCodigo.Text);
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

        if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'PAGO'
        else
          Parameters.ParamByName('Status').Value:= 'PENDENTE';

        Parameters.ParamByName('Cancelado').Value:= 'N';

        open;
      end
      else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 4) then
      begin
        if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Funcionario = :Pedido ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Ped.N_Pedido');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Funcionario = :Pedido ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Ped.Data_Venda');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Funcionario = :Pedido ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Cli.Nome_Nome_Fantasia');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Funcionario = :Pedido ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Fun.Nome');
        end;
        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('Pedido').Value:= StrToInt(FrmConsulta_Venda.EdtCodigo.Text);
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

        if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'PAGO'
        else
          Parameters.ParamByName('Status').Value:= 'PENDENTE';

        Parameters.ParamByName('Cancelado').Value:= 'N';

        open;
      end
      else if (FrmConsulta_Venda.RGConsulta_Por.ItemIndex = 5) then
      begin
        if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 0) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Tabela_Preco = :Pedido ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Ped.N_Pedido');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 1) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Tabela_Preco = :Pedido ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Ped.Data_Venda');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 2) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Tabela_Preco = :Pedido ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Cli.Nome_Nome_Fantasia');
        end

        else if (FrmConsulta_Venda.RGOrdena_Por.ItemIndex = 3) then
        begin
          sql.Add('where Ped.Codigo_Empresa = :Empresa and Ped.Codigo_Tabela_Preco = :Pedido ');
          sql.add('and Ped.Data_Venda between :DI and :DF and Ped.Status = :Status and IP.Cancelado = :Cancelado order by Fun.Nome');
        end;
        Parameters.ParamByName('Empresa').Value:= UDeclaracao.codigo_empresa;
        Parameters.ParamByName('Pedido').Value:= StrToInt(FrmConsulta_Venda.EdtCodigo.Text);
        Parameters.ParamByName('DI').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Inicial.Text);
        Parameters.ParamByName('DF').Value:= StrToDateTime(FrmConsulta_Venda.MEdtData_Final.Text);

        if (FrmConsulta_Venda.RGStatus.ItemIndex = 0) then
          Parameters.ParamByName('Status').Value:= 'PAGO'
        else
          Parameters.ParamByName('Status').Value:= 'PENDENTE';

        Parameters.ParamByName('Cancelado').Value:= 'N';

        open;
      end
    end;
end;
end.
