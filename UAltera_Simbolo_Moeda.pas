unit UAltera_Simbolo_Moeda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFrmAltera_Simbolo_Moeda = class(TForm)
    EdtSimbolo: TEdit;
    Label1: TLabel;
    Button1: TButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAltera_Simbolo_Moeda: TFrmAltera_Simbolo_Moeda;

implementation

uses UDeclaracao;

{$R *.dfm}

procedure TFrmAltera_Simbolo_Moeda.Button1Click(Sender: TObject);
begin
  if (EdtSimbolo.Text = '') then
  begin
    ShowMessage('Digite um valor valido');
    EdtSimbolo.SetFocus;
    abort
  end
  else
  begin
   if Application.MessageBox('Confirma alteração do símbolo da moeda?','Atenção',Mb_YesNo + Mb_IconQuestion) = idyes then
   begin
		 Bematech_FI_AlteraSimboloMoeda( pchar(EdtSimbolo.Text));
     Analisa_iRetorno;
     UDeclaracao.Insere_Historico(usuario, 'ALTEROU SÍMBOLO DA MOEDA NO ECF PARA ' + EdtSimbolo.Text + '.', TimeToStr(time), alteracao, date);
     Processo_Concluido;
     close;
   end;
  end;
end;

procedure TFrmAltera_Simbolo_Moeda.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmAltera_Simbolo_Moeda.Free;
  FrmAltera_Simbolo_Moeda:= Nil;
end;

procedure TFrmAltera_Simbolo_Moeda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmAltera_Simbolo_Moeda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
