unit UCancela_Item_Generico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFrmCancela_Item_Generico = class(TForm)
    EdtValor: TEdit;
    Label1: TLabel;
    Button1: TButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCancela_Item_Generico: TFrmCancela_Item_Generico;

implementation

uses UPDV;

{$R *.dfm}

procedure TFrmCancela_Item_Generico.Button1Click(Sender: TObject);
var
  cancela: integer;
  total: double;
begin
  if (EdtValor.Text = '') then
    Application.MessageBox('Informe um item a ser cancelado', 'Atenção', MB_OK+MB_ICONHAND)
  else if Application.MessageBox('Deseja realmente cancelar o item informado?', 'Atenção', MB_YESNO+MB_ICONQUESTION) = idyes then
  begin
    FrmPDV.item_cancelar:= EdtValor.Text;
    cancela := StrToInt(EdtValor.Text) * 2 - 2;
    //FrmPDV.ListBox1.Items.Add('************************************');
    //FrmPDV.ListBox1.Items.Add(FrmPDV.ListBox1.Items[cancela]);
    //FrmPDV.ListBox1.Items.Add('ITEM CANCELADO');
    //FrmPDV.ListBox1.Items.Add('************************************');
    //FrmPDV.LblTotal.caption:= Copy(FrmPDV.ListBox1.items[cancela+1],26,11);
    //total:= StrToFloat(FrmPDV.LblSub_Total.Caption) - StrToFloat(FrmPDV.LblTotal.Caption);
    FrmPDV.LblSub_Total.Caption:= FormatFloat('#0.0,0', total);
    Inc(FrmPDV.qtde_cancelado);
    close;
  end;
end;

procedure TFrmCancela_Item_Generico.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmCancela_Item_Generico:= Nil;
end;

end.
