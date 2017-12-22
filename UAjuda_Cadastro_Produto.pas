unit UAjuda_Cadastro_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, jpeg;

type
  TFrmAjuda_Cadastro_Produto = class(TForm)
    RichEdit1: TRichEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAjuda_Cadastro_Produto: TFrmAjuda_Cadastro_Produto;

implementation

{$R *.dfm}

procedure TFrmAjuda_Cadastro_Produto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmAjuda_Cadastro_Produto.Release;
  FrmAjuda_Cadastro_Produto:= nil;
end;

procedure TFrmAjuda_Cadastro_Produto.FormShow(Sender: TObject);
begin
  RichEdit1.SelStart:= 0;
end;

end.
