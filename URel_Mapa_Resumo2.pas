unit URel_Mapa_Resumo2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Mapa_Resumo2 = class(TForm)
    QuickRep1: TQuickRep;
    QRPDFFilter1: TQRPDFFilter;
    ADOQuery1: TADOQuery;
    QRBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRLabel8: TQRLabel;
    LblRazao_Social: TQRLabel;
    QRLabel1: TQRLabel;
    LblEndereco: TQRLabel;
    QRLabel2: TQRLabel;
    LblMunicipio: TQRLabel;
    QRLabel3: TQRLabel;
    LblUF: TQRLabel;
    QRLabel4: TQRLabel;
    LblCNPJ: TQRLabel;
    QRLabel6: TQRLabel;
    LblCCE: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel21: TQRLabel;
    ADOQuery2: TADOQuery;
    ADOQuery2Totalizador_Parcial: TStringField;
    QRHRule3: TQRHRule;
    LblValor_Contabil: TQRLabel;
    ADOQuery3: TADOQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    ADOQuery4: TADOQuery;
    QRDBText7: TQRDBText;
    ADOQuery4Datamov: TDateTimeField;
    ADOQuery4Aliquota: TStringField;
    ADOQuery4valor_venda: TFloatField;
    ADOQuery4vendas_totais: TFloatField;
    ADOQuery1Datamov: TDateTimeField;
    ADOQuery1Caixa: TStringField;
    ADOQuery1CRZ: TStringField;
    ADOQuery1COO: TStringField;
    ADOQuery1valor_venda: TFloatField;
    ADOQuery1vendas_totais: TFloatField;
    ADOQuery3Datamov: TDateTimeField;
    ADOQuery3Aliquota: TStringField;
    ADOQuery3valor_venda: TFloatField;
    ADOQuery3vendas_totais: TFloatField;
    LblIsento: TQRLabel;
    LblSubs: TQRLabel;
    LblOutros: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    foi: boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Mapa_Resumo2: TFrmRel_Mapa_Resumo2;

implementation

uses UGeral, UDeclaracao, UDM, UMapa_Resumo;

{$R *.dfm}

procedure TFrmRel_Mapa_Resumo2.FormCreate(Sender: TObject);
var
  conta, l: integer;
  campo: TQRLabel;
begin
    ADOQuery1.Close;
    ADOQuery1.open;
    ADOQuery1.First;

    while not ADOQuery1.Eof do
    begin
      ADOQuery2.Close;
      ADOQuery2.Parameters.ParamByName('Data').Value:= ADOQuery1Datamov.AsDateTime;
      ADOQuery2.Open;
      ADOQuery2.First;

      l:= 670;
      while not ADOQuery2.Eof do
        begin
          campo:= TQRLabel.Create(nil);
          campo.Left:= l;
          campo.AutoSize:= true;
          //campo.Width:= 45;
          campo.ParentReport:= QuickRep1;
          campo.Parent:= QRBand1;
          campo.Name:= 'Name' + IntToStr(conta);
          campo.Top:= 183;
          campo.Height:= 25;
          campo.Font.Name:= 'Tahoma';
          campo.Font.Size:= 8;
          campo.Font.Style:= [fsBold];
          campo.Caption:= ADOQuery2Totalizador_Parcial.AsString;
          campo.Frame.DrawTop:= true;
          campo.Frame.DrawBottom:= false;
          campo.Frame.DrawLeft:= true;
          campo.Frame.DrawRight:= true;
          campo.Visible:= true;
          l:= l + campo.Width;
          ADOQuery2.Next;
        end;

      ADOQuery3.Close;
      ADOQuery3.Parameters.ParamByName('D1').Value:= ADOQuery1Datamov.AsDateTime;
      ADOQuery3.Parameters.ParamByName('D2').Value:= ADOQuery1Datamov.AsDateTime;
      ADOQuery3.open;
      ADOQuery3.First;

      while not ADOQuery3.EOF do
      begin
        if (ADOQuery3Aliquota.AsString = 'I1') then
        begin
          LblIsento.Caption:= ADOQuery3valor_venda.AsString;
          LblIsento.Refresh;
        end
        else if (ADOQuery3Aliquota.AsString = 'F1') then
        begin
          LblSubs.Caption:= ADOQuery3valor_venda.AsString;
          LblSubs.Refresh;
        end
        else if (ADOQuery3Aliquota.AsString = 'N1') then
        begin
          LblOutros.Caption:= ADOQuery3valor_venda.AsString;
          LblOutros.Refresh;
        end;
        ADOQuery3.Next;
        QRBand1.Refresh;
      QuickRep1.Preview;
      end;

      QRBand1.ForceNewPage:= true;
      ADOQuery1.Next;
    end;

  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;

  {with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select R03.Totalizador_Parcial, R02.Data_Movimento, R02.Caixa, R02.CRZ, R02.N_Fabricacao, R02.COO_Inicial, R02.COO_Final, convert(float, R03.Valor_Acumulado)/100 as Valor_Acumulado,');
    add('convert(float, R02.Venda_Bruta_Diaria)/100 as Venda_Bruta_Diaria from R02');
    add('left join R03 on (R02.Data_Movimento = R03.Data_Movimento)');
    add('where R02.Data_Movimento between :DI and :DF and R02.N_Fabricacao = :N');
    add('group by R03.Totalizador_Parcial, R02.Data_Movimento, R02.Caixa, R02.CRZ, R02.N_Fabricacao, R02.COO_Inicial, R02.COO_Final, R03.Valor_Acumulado, R02.Venda_Bruta_Diaria');
    add('order by R02.Data_Movimento');
    Parameters.ParamByName('DI').Value:= StrToDateTime(FrmMapa_Resumo.MEdtData_Inicial.Text);
    Parameters.ParamByName('DF').Value:= StrToDateTime(FrmMapa_Resumo.MEdtData_Final.Text);
    Parameters.ParamByName('N').Value:= FrmMapa_Resumo.EdtN_Serie.Text;
    open;
  end;}
end;

procedure TFrmRel_Mapa_Resumo2.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  conta, l: integer;
  campo: TQRLabel;
begin
    {ADOQuery1.Close;
    ADOQuery1.open;
    ADOQuery1.First;

    while not ADOQuery1.Eof do
    begin
      ADOQuery2.Close;
      ADOQuery2.Parameters.ParamByName('Data').Value:= ADOQuery1Datamov.AsDateTime;
      ADOQuery2.Open;
      ADOQuery2.First;

      l:= 670;
      while not ADOQuery2.Eof do
        begin
          campo:= TQRLabel.Create(nil);
          campo.Left:= l;
          campo.AutoSize:= true;
          //campo.Width:= 45;
          campo.ParentReport:= QuickRep1;
          campo.Parent:= QRBand1;
          campo.Name:= 'Name' + IntToStr(conta);
          campo.Top:= 183;
          campo.Height:= 25;
          campo.Font.Name:= 'Tahoma';
          campo.Font.Size:= 8;
          campo.Font.Style:= [fsBold];
          campo.Caption:= ADOQuery2Totalizador_Parcial.AsString;
          campo.Frame.DrawTop:= true;
          campo.Frame.DrawBottom:= false;
          campo.Frame.DrawLeft:= true;
          campo.Frame.DrawRight:= true;
          campo.Visible:= true;
          l:= l + campo.Width;
          ADOQuery2.Next;
        end;

      ADOQuery3.Close;
      ADOQuery3.Parameters.ParamByName('D1').Value:= ADOQuery1Datamov.AsDateTime;
      ADOQuery3.Parameters.ParamByName('D2').Value:= ADOQuery1Datamov.AsDateTime;
      ADOQuery3.open;
      ADOQuery3.First;

      while not ADOQuery3.EOF do
      begin
        if (ADOQuery3Aliquota.AsString = 'I1') then
        begin
          LblIsento.Caption:= ADOQuery3valor_venda.AsString;
          LblIsento.Refresh;
        end
        else if (ADOQuery3Aliquota.AsString = 'F1') then
        begin
          LblSubs.Caption:= ADOQuery3valor_venda.AsString;
          LblSubs.Refresh;
        end
        else if (ADOQuery3Aliquota.AsString = 'N1') then
        begin
          LblOutros.Caption:= ADOQuery3valor_venda.AsString;
          LblOutros.Refresh;
        end;
        ADOQuery3.Next;
        QRBand1.Refresh;
      end;

      ADOQuery1.Next;
      QRBand1.ForceNewPage:= true;
    end;

  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho; }

  {with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select R03.Totalizador_Parcial, R02.Data_Movimento, R02.Caixa, R02.CRZ, R02.N_Fabricacao, R02.COO_Inicial, R02.COO_Final, convert(float, R03.Valor_Acumulado)/100 as Valor_Acumulado,');
    add('convert(float, R02.Venda_Bruta_Diaria)/100 as Venda_Bruta_Diaria from R02');
    add('left join R03 on (R02.Data_Movimento = R03.Data_Movimento)');
    add('where R02.Data_Movimento between :DI and :DF and R02.N_Fabricacao = :N');
    add('group by R03.Totalizador_Parcial, R02.Data_Movimento, R02.Caixa, R02.CRZ, R02.N_Fabricacao, R02.COO_Inicial, R02.COO_Final, R03.Valor_Acumulado, R02.Venda_Bruta_Diaria');
    add('order by R02.Data_Movimento');
    Parameters.ParamByName('DI').Value:= StrToDateTime(FrmMapa_Resumo.MEdtData_Inicial.Text);
    Parameters.ParamByName('DF').Value:= StrToDateTime(FrmMapa_Resumo.MEdtData_Final.Text);
    Parameters.ParamByName('N').Value:= FrmMapa_Resumo.EdtN_Serie.Text;
    open;
  end;}
end;
end.
