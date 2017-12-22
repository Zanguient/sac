unit UAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFrmAcesso = class(TForm)
    Label1: TLabel;
    EdtUsuario: TEdit;
    Image1: TImage;
    Label2: TLabel;
    EdtSenha: TEdit;
    btOK: TBitBtn;
    BtCancela: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAcesso: TFrmAcesso;

implementation

{$R *.dfm}

end.
