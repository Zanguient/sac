unit URel_Consulta_Patrimonio_Local;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt;

type
  TFrmRel_Consulta_Patrimonio_Local = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBDescricao: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabeldata: TQRLabel;
    QRLabelHora: TQRLabel;
    QRDBN_Nota_Fiscal: TQRDBText;
    QRDBData_Pagamento: TQRDBText;
    QRHRule2: TQRHRule;
    LblEmpresa_Cabecalho: TQRLabel;
    QRBand4: TQRBand;
    LblEmpresa_Rodape: TQRLabel;
    LblTelefone_Rodape: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr2: TQRExpr;
    LblConsulta_Por: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    LblParametro: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    LblEmpresa: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRLabel8: TQRLabel;
    qryconsulta_bem: TADOQuery;
    qryconsulta_bemCodigo: TAutoIncField;
    qryconsulta_bemN_Bem: TStringField;
    qryconsulta_bemN_Identificacao: TStringField;
    qryconsulta_bemDescricao: TStringField;
    qryconsulta_bemCodigo_Marca: TIntegerField;
    qryconsulta_bemModelo: TStringField;
    qryconsulta_bemCodigo_Tipo_Bem: TIntegerField;
    qryconsulta_bemCodigo_Local_Bem: TIntegerField;
    qryconsulta_bemData_Aquisicao: TDateTimeField;
    qryconsulta_bemData_Baixa: TDateTimeField;
    qryconsulta_bemValor_Bem: TFloatField;
    qryconsulta_bemCodigo_Status: TIntegerField;
    qryconsulta_bemObservacao: TStringField;
    qryconsulta_bemData_Cadastro: TDateTimeField;
    qryconsulta_bemMarca: TStringField;
    qryconsulta_bemTipo_Bem: TStringField;
    qryconsulta_bemLocal: TStringField;
    qryconsulta_bemStatus: TStringField;
    QRHRule1: TQRHRule;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Consulta_Patrimonio_Local: TFrmRel_Consulta_Patrimonio_Local;

implementation

uses UGeral, UEscolha_Impressao, UDeclaracao, UConsulta_Patrimonio;

{$R *.dfm}

procedure TFrmRel_Consulta_Patrimonio_Local.FormCreate(Sender: TObject);
begin
  QuickRep1.Preview;
end;

procedure TFrmRel_Consulta_Patrimonio_Local.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabeldata.Caption:= datetostr(now);
  QRLabelHora.Caption:= timetostr(time);
  LblEmpresa.Caption:= nome_fantasia;
  //LblPropriedade.Caption:= FrmCarregar_Contas_Pagar.EdtPropriedade.Text;
  LblParametro.Caption:= '';

  case (FrmConsulta_Patrimonio.RGConsulta_Por.ItemIndex) of
    0: LblParametro.Caption:= FrmConsulta_Patrimonio.EdtConsulta.Text;
    1: LblParametro.Caption:= FrmConsulta_Patrimonio.EdtConsulta.Text;
    2: LblParametro.Caption:= FrmConsulta_Patrimonio.EdtConsulta.Text;
    3: LblParametro.Caption:= FrmConsulta_Patrimonio.EdtConsulta.Text;
    4: LblParametro.Caption:= FrmConsulta_Patrimonio.EdtDescricao.Text;
    5: LblParametro.Caption:= FrmConsulta_Patrimonio.EdtDescricao.Text;
    6: LblParametro.Caption:= FrmConsulta_Patrimonio.EdtDescricao.Text;
  end;

  case (FrmConsulta_Patrimonio.RGConsulta_Por.ItemIndex) of
    0: LblConsulta_Por.Caption:= 'Nº Bem';
    1: LblConsulta_Por.Caption:= 'Nº Identificação';
    2: LblConsulta_Por.Caption:= 'Descrição';
    3: LblConsulta_Por.Caption:= 'Modelo';
    4: LblConsulta_Por.Caption:= 'Tipo';
    5: LblConsulta_Por.Caption:= 'Local';
    6: LblConsulta_Por.Caption:= 'Status';
  end;

  with qryconsulta_bem, sql do
    begin
      close;
      sql.clear;
      sql.add('select P.*, M.Descricao as Marca, TBP.Descricao as Tipo_Bem, LP.Local, CS.Descricao as Status');
      sql.add('from Patrimonio P');
      sql.add('left join Marca M on (P.Codigo_Marca = M.Codigo)');
      sql.add('left join Tipo_Bem_Patrimonial TBP on (P.Codigo_Tipo_Bem = TBP.Codigo)');
      sql.add('left join Localidade_Produto LP on (P.Codigo_Local_Bem = LP.Codigo)');
      sql.add('left join Cadastro_Status CS on (P.Codigo_Status = CS.Codigo)');

      case (FrmConsulta_Patrimonio.RGConsulta_Por.ItemIndex) of
        0: add('where P.N_Bem like '''+ FrmConsulta_Patrimonio.EdtConsulta.Text +'%''');
        1: add('where P.N_Identificacao like '''+ FrmConsulta_Patrimonio.EdtConsulta.Text +'%''');
        2: add('where P.Descricao like '''+ FrmConsulta_Patrimonio.EdtConsulta.Text +'%''');
        3: add('where P.Modelo like '''+ FrmConsulta_Patrimonio.EdtConsulta.Text +'%''');
        4: add('where P.Codigo_Tipo_Bem = :1 ');
        5: add('where P.Codigo_Local_Bem = :2 ');
        6: add('where P.Codigo_Status = :3 ');
      end;

      case (FrmConsulta_Patrimonio.RGAgrupa_Impressao.ItemIndex) of
        0: add('order by P.Codigo');
        1: add('order by TBP.Descricao');
        2: add('order by LP.Local');
        3: add('order by CS.Descricao');
        {4: add('order by P.Codigo_Tipo_Bem');
        5: add('order by P.Codigo_Local_Bem');
        6: add('order by P.Codigo_Status');}
      end;

      case (FrmConsulta_Patrimonio.RGConsulta_Por.ItemIndex) of
        4: Parameters.ParamByName('1').Value:= StrToInt(FrmConsulta_Patrimonio.EdtCodigo.Text);
        5: Parameters.ParamByName('2').Value:= StrToInt(FrmConsulta_Patrimonio.EdtCodigo.Text);
        6: Parameters.ParamByName('3').Value:= StrToInt(FrmConsulta_Patrimonio.EdtCodigo.Text);
      end;

      open;
    end;

  LblTelefone_Rodape.Caption:= telefone_relatorio;
  LblEmpresa_Rodape.Caption:= empresa_relatorio_rodape;
  LblEmpresa_Cabecalho.Caption:= empresa_relatorio_cabecalho;
end;

end.
