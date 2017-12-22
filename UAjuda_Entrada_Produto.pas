unit UAjuda_Entrada_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TFrmAjuda_Entrada_Produto = class(TForm)
    RichEdit1: TRichEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAjuda_Entrada_Produto: TFrmAjuda_Entrada_Produto;

implementation

{$R *.dfm}

procedure TFrmAjuda_Entrada_Produto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmAjuda_Entrada_Produto.Release;
  FrmAjuda_Entrada_Produto:= nil;
end;

procedure TFrmAjuda_Entrada_Produto.FormShow(Sender: TObject);
begin
  RichEdit1.SelStart:= 0;
end;

end.
