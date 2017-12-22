unit UEscolha_Bandeira;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, ComCtrls, ToolWin, Buttons;

type
  TFrmEscolha_Bandeira = class(TForm)
    BBtnTEF_Dial: TBitBtn;
    BBtnTEF_Disc: TBitBtn;
    BBtnPayGO: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BBtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BBtnTEF_DialClick(Sender: TObject);
    procedure BBtnTEF_DiscClick(Sender: TObject);
    procedure BBtnPayGOClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    band: string;
    procedure Grava_Bandeira;
  public
    { Public declarations }
    var
      preview: boolean;
  end;

var
  FrmEscolha_Bandeira: TFrmEscolha_Bandeira;

implementation

uses UDeclaracao, UFechamento_Venda_PDV;

{$R *.dfm}

procedure TFrmEscolha_Bandeira.BBtnSairClick(Sender: TObject);
begin
  FrmEscolha_Bandeira:= Nil;
end;

procedure TFrmEscolha_Bandeira.BBtnTEF_DialClick(Sender: TObject);
begin
  PathReq  := 'C:\TEF_DIAL\Req\';
  PathResp := 'C:\TEF_DIAL\Resp\';
  band:= 'TEF DIAL';
  gerenciadorPadrao:= 'C:\tef_dial\tef_dial.exe';
  Verifica_Gerenciador_Padrao_Ativo;
  Grava_Bandeira;

  if (FrmFechamento_Venda_PDV <> nil) then
    aborta_escolha_bandeira:= false;
  close;
end;

procedure TFrmEscolha_Bandeira.BBtnTEF_DiscClick(Sender: TObject);
begin
  PathReq  := 'C:\TEF_DISC\Req\';
  PathResp := 'C:\TEF_DISC\Resp\';
  band:= 'TEF DISC';
  gerenciadorPadrao:= 'C:\TEF_Disc\tef_disc.exe';
  Verifica_Gerenciador_Padrao_Ativo;
  Grava_Bandeira;

  if (FrmFechamento_Venda_PDV <> nil) then
    aborta_escolha_bandeira:= false;
  close;
end;

procedure TFrmEscolha_Bandeira.BBtnPayGOClick(Sender: TObject);
begin
  PathReq  := 'C:\TEF_DIAL\Req\';
  PathResp := 'C:\TEF_DIAL\Resp\';
  band:= 'TEF DIAL';
  gerenciadorPadrao:= 'C:\tef_dial\tef_dial.exe';
  Verifica_Gerenciador_Padrao_Ativo;
  Grava_Bandeira;

  if (FrmFechamento_Venda_PDV <> nil) then
    aborta_escolha_bandeira:= false;
  close;
end;

procedure TFrmEscolha_Bandeira.BitBtn4Click(Sender: TObject);
begin
  if (FrmFechamento_Venda_PDV <> nil) then
    aborta_escolha_bandeira:= true;
  close;
end;

procedure TFrmEscolha_Bandeira.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_NUMPAD1) then
  begin
    PathReq  := 'C:\Tef_Dial\Req\';
    PathResp := 'C:\Tef_Dial\Resp\';
    band:= 'TEF DIAL';
    gerenciadorPadrao:= 'C:\tef_dial\tef_dial.exe';
    Verifica_Gerenciador_Padrao_Ativo;
    Grava_Bandeira;

    if (FrmFechamento_Venda_PDV <> nil) then
      aborta_escolha_bandeira:= false;
  end
  else if (key = VK_NUMPAD2) then
  begin
    PathReq  := 'C:\TEF_DISC\Req\';
    PathResp := 'C:\TEF_DISC\Resp\';
    band:= 'TEF DISC';
    gerenciadorPadrao:= 'C:\TEF_Disc\tef_disc.exe';
    Verifica_Gerenciador_Padrao_Ativo;
    Grava_Bandeira;

    if (FrmFechamento_Venda_PDV <> nil) then
      aborta_escolha_bandeira:= false;
  end
  else if (key = VK_NUMPAD3) then
  begin
    PathReq  := 'C:\TEF_DIAL\Req\';
    PathResp := 'C:\TEF_DIAL\Resp\';
    band:= 'TEF DIAL';
    gerenciadorPadrao:= 'C:\tef_dial\tef_dial.exe';
    Verifica_Gerenciador_Padrao_Ativo;
    Grava_Bandeira;

    if (FrmFechamento_Venda_PDV <> nil) then
      aborta_escolha_bandeira:= false;
  end
  else if (key = VK_NUMPAD9) then
  begin
    if (FrmFechamento_Venda_PDV <> nil) then
      aborta_escolha_bandeira:= true;
    close;
  end
  else if (key = VK_ESCAPE) then
  begin
    if (FrmFechamento_Venda_PDV <> nil) then
      aborta_escolha_bandeira:= true;
    close;
  end
  else
  begin
    Application.MessageBox('Escolha uma opção', 'Opção não encontrada', MB_OK+MB_ICONHAND);
    abort;
  end;

end;

procedure TFrmEscolha_Bandeira.FormShow(Sender: TObject);
begin
  if (DirectoryExists('C:\Tef_Dial')) then
    BBtnTEF_Dial.Enabled:= true
  else
    BBtnTEF_Dial.Enabled:= false;

  if (DirectoryExists('C:\Tef_Disc')) then
    BBtnTEF_Disc.Enabled:= true
  else
    BBtnTEF_Disc.Enabled:= false;

  if (DirectoryExists('C:\PAYGO')) then
    BBtnPayGO.Enabled:= true
  else
    BBtnPayGO.Enabled:= false;
end;

procedure TFrmEscolha_Bandeira.Grava_Bandeira;
var
  Arq: TextFile;
  Nome: String;
begin
  Nome := Local_Arquivo(14) + 'Bandeira.txt';
  AssignFile(Arq, Nome);
  Rewrite(Arq);
  writeln(Arq, band);
  CloseFile(Arq);
end;

end.
