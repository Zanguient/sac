unit UAjuda_Geral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TFrmAjuda_Geral = class(TForm)
    RichEdit1: TRichEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAjuda_Geral: TFrmAjuda_Geral;

implementation

{$R *.dfm}

procedure TFrmAjuda_Geral.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmAjuda_Geral.Release;
  FrmAjuda_Geral:= nil;
end;

procedure TFrmAjuda_Geral.FormShow(Sender: TObject);
begin
  RichEdit1.SelStart:= 0;
end;

end.
