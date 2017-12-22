unit URel_Fiscal_Memoria_Faixa_Reducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UFiscal, Mask;

type
  TFrmRel_Fiscal_Memoria_Faixa_Reducao = class(TForm)
    Button1: TButton;
    Label7: TLabel;
    Label8: TLabel;
    EdtInicio: TEdit;
    EdtFim: TEdit;
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
  FrmRel_Fiscal_Memoria_Faixa_Reducao: TFrmRel_Fiscal_Memoria_Faixa_Reducao;

implementation

{$R *.dfm}

procedure TFrmRel_Fiscal_Memoria_Faixa_Reducao.Button1Click(Sender: TObject);
var
  cChavePublica, cChavePrivada, cRegistroEAD: String;
begin
  if (EdtInicio.Text = '') or (EdtFim.Text = '') then
  begin
    ShowMessage('Digite um valor valido');
    EdtInicio.SetFocus;
    abort
  end
  else
  begin
   if Application.MessageBox('Realiza a leitura da memória fiscal por faixa de redução?','Atenção',Mb_YesNo + Mb_IconQuestion) = idyes then
   begin
     cChavePublica:= '123';
     cChavePrivada:= '321';
     cRegistroEAD:= 'teste de efd';

     SetLength(cChavePublica, 256);
     SetLength(cChavePrivada, 256);
     SetLength(cRegistroEAD, 256);

     loImpressora.genkkey(cChavePublica, cChavePrivada);
     loImpressora.generateEAD('C:\Teste.txt', cChavePublica, cChavePrivada, cRegistroEAD, 1);
     loImpressora.EspelhoMFD('C:\Teste.txt', EdtInicio.Text, EdtFim.Text, '', '', cChavePublica, cChavePrivada);

		 loImpressora.LeituraMemoriaFiscalReducao(EdtInicio.Text, EdtFim.Text);
     loImpressora.Analisa_iRetorno;
     loImpressora.RetornoImpressora;
   end;
     close;
  end;
end;

procedure TFrmRel_Fiscal_Memoria_Faixa_Reducao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmRel_Fiscal_Memoria_Faixa_Reducao:= Nil;
end;

procedure TFrmRel_Fiscal_Memoria_Faixa_Reducao.FormCreate(Sender: TObject);
begin
   lnImp:= 1;
   case lnImp of
     1: loImpressora:= TBematech.Create;
     2: loImpressora:= TDaruma.Create;
   end;
end;

procedure TFrmRel_Fiscal_Memoria_Faixa_Reducao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmRel_Fiscal_Memoria_Faixa_Reducao.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
