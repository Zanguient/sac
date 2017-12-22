unit UAjuda_Pedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TFrmAjuda_Pedido = class(TForm)
    RichEdit1: TRichEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAjuda_Pedido: TFrmAjuda_Pedido;

implementation

{$R *.dfm}

procedure TFrmAjuda_Pedido.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmAjuda_Pedido.Release;
  FrmAjuda_Pedido:= nil;
end;

procedure TFrmAjuda_Pedido.FormShow(Sender: TObject);
begin
  RichEdit1.SelStart:= 0;
end;

end.
