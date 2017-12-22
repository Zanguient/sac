unit UMensagem_Erro_Gerenciador_TEF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, ComCtrls, ToolWin;

type
  TFrmMensagem_Erro_Gerenciador_TEF = class(TForm)
    LblMensagem: TLabel;
    Button1: TButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMensagem_Erro_Gerenciador_TEF: TFrmMensagem_Erro_Gerenciador_TEF;

implementation

uses UDeclaracao;

{$R *.dfm}

{ TFrmMensagem_TEF }

procedure TFrmMensagem_Erro_Gerenciador_TEF.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmMensagem_Erro_Gerenciador_TEF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmMensagem_Erro_Gerenciador_TEF.Release;
  //FrmMensagem_Erro_Gerenciador_TEF:= nil;
end;

procedure TFrmMensagem_Erro_Gerenciador_TEF.FormCreate(Sender: TObject);
begin
  BlockInput(false);
end;

procedure TFrmMensagem_Erro_Gerenciador_TEF.FormShow(Sender: TObject);
begin
  Button1.SetFocus;
  Application.ProcessMessages;
end;

end.
