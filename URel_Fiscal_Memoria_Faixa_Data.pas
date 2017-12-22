unit URel_Fiscal_Memoria_Faixa_Data;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UFiscal, Mask;

type
  TFrmRel_Fiscal_Memoria_Faixa_Data = class(TForm)
    Button1: TButton;
    Label7: TLabel;
    Label8: TLabel;
    MEdtData_Final: TMaskEdit;
    MEdtData_Inicial: TMaskEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    loImpressora: IFiscal;
    lnImp: integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRel_Fiscal_Memoria_Faixa_Data: TFrmRel_Fiscal_Memoria_Faixa_Data;

implementation

{$R *.dfm}

procedure TFrmRel_Fiscal_Memoria_Faixa_Data.Button1Click(Sender: TObject);
begin
  if (MEdtData_Inicial.Text = '  /  /    ') or (MEdtData_Final.Text = '  /  /    ') then
  begin
    ShowMessage('Digite um valor valido');
    MEdtData_Inicial.SetFocus;
    abort
  end
  else
  begin
   if Application.MessageBox('Realiza a leitura da memória fiscal por faixa de data?','Atenção',Mb_YesNo + Mb_IconQuestion) = idyes then
   begin
		 loImpressora.LeituraMemoriaFiscalData(MEdtData_Inicial.Text, MEdtData_Final.Text);
     loImpressora.Analisa_iRetorno;
     loImpressora.RetornoImpressora;
   end;
     Application.MessageBox('Programado Somente em Intervenção Técnica','Informação do Sistema',Mb_IconInformation);
     close;
  end;
end;

procedure TFrmRel_Fiscal_Memoria_Faixa_Data.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmRel_Fiscal_Memoria_Faixa_Data:= Nil;
end;

procedure TFrmRel_Fiscal_Memoria_Faixa_Data.FormCreate(Sender: TObject);
begin
   lnImp:= 1;
   case lnImp of
     1: loImpressora:= TBematech.Create;
     2: loImpressora:= TDaruma.Create;
   end;
end;

procedure TFrmRel_Fiscal_Memoria_Faixa_Data.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmRel_Fiscal_Memoria_Faixa_Data.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
