unit USMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DB, DBClient, Grids, DBGrids;

type
  TFrmEnvia_SMS = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl5: TLabel;
    btn1: TButton;
    EdtDDD: TEdit;
    EdtTelefone: TEdit;
    MMOMensagem: TMemo;
    LblSetor: TLabel;
    EdtCliente: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Nome: TStringField;
    ClientDataSet1DDD: TStringField;
    ClientDataSet1Telefone: TStringField;
    Button1: TButton;
    procedure btn1Click(Sender: TObject);
    procedure EdtTelefoneExit(Sender: TObject);
    procedure EdtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmEnvia_SMS: TFrmEnvia_SMS;

implementation

uses UServer_SMS, UChama_Cliente, UDeclaracao;

{$R *.dfm}

procedure TFrmEnvia_SMS.btn1Click(Sender: TObject);
const vEmail = 'flavioavilela@gmail.com';
const vSenha = 'f&nd&r23';
begin
  //se quiser o retorno da mensagem do servidor faca assim:
  ClientDataSet1.First;
  while not ClientDataSet1.Eof do
  begin
    ShowMessage( GetServerSendSMSPortType().sendSMS(vEmail, vSenha, ClientDataSet1DDD.AsString, ClientDataSet1Telefone.AsString, MMOMensagem.Text));
    ClientDataSet1.Next;
  end;
  Processo_Concluido;
//sem mensagem do servidor:
//GetServerSendSMSPortType().sendSMS('seuemail@provedor.com', 'senha naoligo', edt1.Text, edt2.Text, edt3.text);
end;

procedure TFrmEnvia_SMS.Button1Click(Sender: TObject);
begin
  ClientDataSet1.Close;
  DeleteFile('C:\SMS.xml');
  close;
end;

procedure TFrmEnvia_SMS.EdtClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;
end;

procedure TFrmEnvia_SMS.EdtTelefoneExit(Sender: TObject);
begin
  if not ClientDataSet1.Active then
    ClientDataSet1.CreateDataSet;
  ClientDataSet1.Insert;
  ClientDataSet1Nome.AsString:= EdtCliente.Text;
  ClientDataSet1Telefone.AsString:= EdtTelefone.Text;
  ClientDataSet1DDD.AsString:= EdtDDD.Text;
  ClientDataSet1.SaveToFile('C:\SMS.xml', dfXMLUTF8);
  EdtCliente.SetFocus;
end;

procedure TFrmEnvia_SMS.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmEnvia_SMS.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FrmEnvia_SMS.Free;
  FrmEnvia_SMS:= nil;
end;

procedure TFrmEnvia_SMS.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmEnvia_SMS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
