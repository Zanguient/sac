unit UMensagem_TEF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, ComCtrls, ToolWin, URegistro;

type
  TFrmMensagem_TEF = class(TForm)
    LblMensagem: TLabel;
    Timer1: TTimer;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMensagem_TEF: TFrmMensagem_TEF;

implementation

{$R *.dfm}

{ TFrmMensagem_TEF }

procedure TFrmMensagem_TEF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmMensagem_TEF.Release;
end;

end.
