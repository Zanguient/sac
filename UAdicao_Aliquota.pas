unit UAdicao_Aliquota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFrmAdicao_Aliquota = class(TForm)
    RGTipo: TRadioGroup;
    EdtValor: TEdit;
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
  FrmAdicao_Aliquota: TFrmAdicao_Aliquota;

implementation

uses UPDV, UDeclaracao, UDM;

{$R *.dfm}

procedure TFrmAdicao_Aliquota.Button1Click(Sender: TObject);
var
  situacao: integer;
begin
   if Application.MessageBox('Deseja Adicionar a Aliquota?','Atenção',Mb_YesNo + Mb_IconQuestion) = idyes then
   begin
     if (RGTipo.ItemIndex = 0) then
       situacao:= 0
     else
       situacao:= 1;

		 Bematech_FI_ProgramaAliquota( PAnsiChar(EdtValor.Text), situacao );
     Analisa_iRetorno;
   end;
   UDeclaracao.Insere_Historico(usuario, 'CADASTROU ALIQUOTA TRIBUTÁRIA ' + EdtValor.Text + '.', TimeToStr(time), insercao, date);
   Processo_Concluido;
end;

procedure TFrmAdicao_Aliquota.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmAdicao_Aliquota.Free;
  FrmAdicao_Aliquota:= Nil;
end;

procedure TFrmAdicao_Aliquota.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmAdicao_Aliquota.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
