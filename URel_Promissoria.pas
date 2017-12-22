unit URel_Promissoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB,
  QRPDFFilt, jpeg, ACBrBoleto, ACBrBase, StrUtils,
  ACBrUtil, ExtDlgs, UConsulta, Modelo.Entidade.TLancamentoFinanceiroEntidade,
  Modelo.Dominio.DocumentosFinanceiro.TPromissoriaDominio, Modelo.Entidade.TParcelasLancamentoFinanceiroEntidade;

type
  TFrmRel_Promissoria = class(TForm)
    QuickRep1: TQuickRep;
    QRPDFFilter1: TQRPDFFilter;
    QRBand1: TQRBand;
    Img1: TQRImage;
    LblDados: TQRLabel;
    ADOQuery1: TADOQuery;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    ADOQuery1Razao_Social: TStringField;
    ADOQuery1Mensagem: TWideStringField;
    ADOQuery1DataExtenso: TWideStringField;
    ADOQuery1Valor_Pagar: TFloatField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    CodigoLancamento: integer;
  public
    constructor Create(CodigoLancamento: integer);
    { Public declarations }
  end;

var
  FrmRel_Promissoria: TFrmRel_Promissoria;

implementation

uses UDM, UGeral, UMenu_Geral, UDeclaracao,
  Modelo.Dominio.LancamentoFinanceiro.TParcelasLancamentoFinanceiroDominio,
  Util.Configs;

{$R *.dfm}

constructor TFrmRel_Promissoria.Create(CodigoLancamento: integer);
begin
  Self.CodigoLancamento:= CodigoLancamento;
  Inherited Create(nil);
end;

procedure TFrmRel_Promissoria.FormCreate(Sender: TObject);
begin
  with ADOQuery1, sql do
  begin
    Close;
    Parameters.ParamByName('CidadeEmpresa').Value:= Cidade;
    Parameters.ParamByName('UFEmpresa').Value:= uf;
    Parameters.ParamByName('Empresa').Value:= razao_social;
    Parameters.ParamByName('CNPJCPFEmpresa').Value:= TConfigs.FormataCNPJ(CNPJ);
    Parameters.ParamByName('EnderecoEmpresa').Value:= tipo_endereco + ' ' + endereco + ', nº '+UDeclaracao.numero+', Setor '+ setor;;
    Parameters.ParamByName('Codigo').Value:= CodigoLancamento;
    open;
  end;

//  ADOQuery1.Close;
//  ADOQuery1.SQL.Add(oPLFDominio.retornaParcelasLancamentos(oPLF));
//  ADOQuery1.Open;

  //MemoVencimento.Lines.Add(self.vencimento);
  //MemoTexto.Lines.Add(Self.texto);
  //MemoCli.Lines.Add(self.cli);
  Img1.Picture.LoadFromFile(logomarca);
  //QuickRep1.Print;
  QuickRep1.Preview;
end;

end.
