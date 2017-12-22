unit UMensagem_Erro_Impressora_TEF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, ComCtrls, ToolWin, TLoggerUnit;

type
  TFrmMensagem_Erro_Impressora_TEF = class(TForm)
    LblMensagem: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    confirma: boolean;
  end;

var
  FrmMensagem_Erro_Impressora_TEF: TFrmMensagem_Erro_Impressora_TEF;

implementation

uses UDeclaracao, Util.TLog;

{$R *.dfm}

{ TFrmMensagem_TEF }

procedure TFrmMensagem_Erro_Impressora_TEF.Button1Click(Sender: TObject);
begin
  confirma:= true;
  TLogger.GetInstance.Warn('Impressora não responde. Tentar novamente? --- O usuário clicou em Sim. '+DateTimeToSTr(now));
  close;
end;

procedure TFrmMensagem_Erro_Impressora_TEF.Button2Click(Sender: TObject);
begin
  confirma:= false;
  TLogger.GetInstance.Warn('Impressora não responde. Tentar novamente? --- O usuário clicou em Não. '+DateTimeToSTr(now));
  close;
end;

procedure TFrmMensagem_Erro_Impressora_TEF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmMensagem_Erro_Impressora_TEF.Release;
end;

procedure TFrmMensagem_Erro_Impressora_TEF.FormCreate(Sender: TObject);
begin
  BlockInput(false);
  TLog.Debug('Desbloqueou teclado/mouse ao abrir a janela de Mensagem_Erro_Impressora_TEF.');
end;

procedure TFrmMensagem_Erro_Impressora_TEF.FormShow(Sender: TObject);
begin
  Button1.SetFocus;
  Application.ProcessMessages;
end;

end.
