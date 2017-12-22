unit UAtualizacao_Configuracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IniFiles;

type
  Tfrmconfiguracao = class(TForm)
    edftp: TEdit;
    edusuario: TEdit;
    edsenha: TEdit;
    edsalvar: TEdit;
    eddiretorio: TEdit;
    edarquivo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
  function lerini(tabela_ini,campo_ini:string):string;
  procedure gravarini(tabela_ini,campo_ini,valor_ini:string);
    { Public declarations }
  end;

var
  frmconfiguracao: Tfrmconfiguracao;

implementation

{$R *.dfm}



{ Tfrmconfiguracao }

procedure Tfrmconfiguracao.gravarini(tabela_ini,campo_ini, valor_ini: string);
var
  ServerIni: TIniFile;
begin
  ServerIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'atualizador.ini');
  ServerIni.WriteString(TABELA_INI,CAMPO_INI,VALOR_INI);
  ServerIni.UpdateFile;
  ServerIni.Free;
end;

procedure Tfrmconfiguracao.BitBtn1Click(Sender: TObject);
begin
 gravarini('CONEXAO','FTP',edftp.Text);
 gravarini('CONEXAO','USUARIO',edusuario.Text);
 gravarini('CONEXAO','SENHA',edsenha.Text);
 if checkbox1.Checked then
   gravarini('CONEXAO','PASSIVO','S')
 else
   gravarini('CONEXAO','PASSIVO','N');
 gravarini('CONEXAO','DIRETORIOCLIENTE',edsalvar.Text);
 gravarini('CONEXAO','ARQUIVO',edarquivo.Text);
 gravarini('CONEXAO','DIRETORIOSERVIDORFTP',eddiretorio.Text);
 close;
end;

function Tfrmconfiguracao.lerini(tabela_ini, campo_ini: string): string;
var
  ServerIni: TIniFile;
begin
  ServerIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'atualizador.ini');
  result := ServerIni.ReadString(tabela_ini,campo_ini,'');
  ServerIni.Free;
end;

procedure Tfrmconfiguracao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  frmconfiguracao.Free;
  frmconfiguracao:= nil;
end;

procedure Tfrmconfiguracao.FormShow(Sender: TObject);
begin
  edftp.Text:=lerini('CONEXAO','FTP');
  edusuario.Text:=lerini('CONEXAO','USUARIO');
  edsenha.Text:=lerini('CONEXAO','SENHA');
  if lerini('CONEXAO','PASSIVO') ='S' then
    checkbox1.Checked
  else
    checkbox1.Checked:=false;
  edsalvar.Text:=lerini('CONEXAO','DIRETORIOCLIENTE');
  edarquivo.Text:=lerini('CONEXAO','ARQUIVO');
  eddiretorio.Text:=lerini('CONEXAO','DIRETORIOSERVIDORFTP');
end;

end.
