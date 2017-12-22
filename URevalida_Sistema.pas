unit URevalida_Sistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, ComCtrls, ToolWin, URegistro, Buttons,
  ADODB;

type
  TFrmRevalida_Sistema = class(TForm)
    Label2: TLabel;
    EdtChave: TEdit;
    Memo1: TMemo;
    btOK: TBitBtn;
    BtCancela: TBitBtn;
    LblChave_Seguranca: TLabel;
    Image1: TImage;
    BBtnConfirma: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtCancelaClick(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure BBtnConfirmaClick(Sender: TObject);
  private
    procedure Gera_Chave;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRevalida_Sistema: TFrmRevalida_Sistema;

implementation

uses UDM, UDeclaracao;

{$R *.dfm}

{ TFrmMensagem_TEF }

procedure TFrmRevalida_Sistema.BBtnConfirmaClick(Sender: TObject);
var
  data_ativacao, data_ativacao2, ultimo_acesso, ultimo_acesso2, data_validade, data_validade2, separa, fim, mes: String;
  aux1, aux2, aux3, chave: string;
begin
  data_ativacao:= copy(Criptografa(EdtChave.Text, 15), 1,8);
  ultimo_acesso:= copy(Criptografa(EdtChave.Text, 15), 10,8);
  data_validade:= copy(Criptografa(EdtChave.Text, 15), 19,8);

  data_ativacao2:= copy(EdtChave.Text,1,8);
  ultimo_acesso2:= copy(EdtChave.Text,10,8);
  data_validade2:= copy(EdtChave.Text,19,8);
  separa:= Criptografa(',', 15);

  chave:= data_ativacao2 + separa + ultimo_acesso2 + separa + data_validade2;

  aux1:= copy(data_ativacao, 1,2);
  aux2:= copy(data_ativacao, 3,2);
  aux3:= copy(data_ativacao, 5,4);
  data_ativacao:= aux1 + '/' + aux2 + '/' + aux3;

  aux1:= copy(ultimo_acesso, 1,2);
  aux2:= copy(ultimo_acesso, 3,2);
  aux3:= copy(ultimo_acesso, 5,4);
  ultimo_acesso:= aux1 + '/' + aux2 + '/' + aux3;

  aux1:= copy(data_validade, 1,2);
  aux2:= copy(data_validade, 3,2);
  aux3:= copy(data_validade, 5,4);
  data_validade:= aux1 + '/' + aux2 + '/' + aux3;

  Atualiza_Validade_Sistema(StrToDate(data_ativacao), StrToDate(data_validade), StrToDate(ultimo_acesso));
  Cria_Arquivo_Controle_Validade(chave);
  Application.Terminate;
  abort;
end;

procedure TFrmRevalida_Sistema.BtCancelaClick(Sender: TObject);
begin
  close;
end;

procedure TFrmRevalida_Sistema.btOKClick(Sender: TObject);
begin
  Gera_Chave;
end;

procedure TFrmRevalida_Sistema.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmRevalida_Sistema.Release;
end;

procedure TFrmRevalida_Sistema.Gera_Chave;
var
  qAux: TADOQuery;
  data_ativacao, data_ativacao2, ultimo_acesso, ultimo_acesso2, data_validade, data_validade2, separa, fim, mes: String;
begin
  qAux:= TADOQuery.Create(nil);
  with qAux, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select * from Controla_Validade_Sistema');
    open;
  end;

  data_ativacao:= FormatDateTime('DDMMYYYY', qAux.FieldByName('Data_Ativacao').AsDateTime);
  ultimo_acesso:= FormatDateTime('DDMMYYYY', qAux.FieldByName('Ultimo_Acesso').AsDateTime);
  data_validade:= FormatDateTime('DDMMYYYY', qAux.FieldByName('Data_Validade').AsDateTime);
  separa:= ',';

  data_ativacao:= Criptografa(data_ativacao, 15);
  ultimo_acesso:= Criptografa(ultimo_acesso, 15);
  data_validade:= Criptografa(data_validade, 15);
  separa:= Criptografa(separa, 15);

  fim:= data_ativacao + separa + ultimo_acesso + separa + data_validade;

  LblChave_Seguranca.Caption:= fim;

end;

end.
