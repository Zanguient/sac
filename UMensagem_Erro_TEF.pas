unit UMensagem_Erro_TEF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, ComCtrls, ToolWin;

type
  TFrmMensagem_Erro_TEF = class(TForm)
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
  FrmMensagem_Erro_TEF: TFrmMensagem_Erro_TEF;

implementation

uses UDeclaracao, Util.TLog;

{$R *.dfm}

{ TFrmMensagem_TEF }

procedure TFrmMensagem_Erro_TEF.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmMensagem_Erro_TEF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmMensagem_Erro_TEF.Release;
end;

procedure TFrmMensagem_Erro_TEF.FormCreate(Sender: TObject);
begin
  BlockInput(false);
  TLog.Debug('Desbloqueou teclado/mouse ao abrir a janela de Mensagem_Erro_TEF.');
end;

procedure TFrmMensagem_Erro_TEF.FormShow(Sender: TObject);
begin
  LblMensagem.Refresh;
  Button1.SetFocus;
  Application.ProcessMessages;
end;

end.
