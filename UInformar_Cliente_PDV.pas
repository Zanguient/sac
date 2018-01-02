unit UInformar_Cliente_PDV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFrmInformar_Cliente_PDV = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    EdtNome: TEdit;
    EdtEndereco: TEdit;
    Label2: TLabel;
    EdtCPF_CNPJ: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EdtCodigo_Cliente: TEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInformar_Cliente_PDV: TFrmInformar_Cliente_PDV;

implementation

uses UPDV, UChama_Cliente, UDeclaracao, Modelo.Entidade.Cliente.TCliente;

{$R *.dfm}

procedure TFrmInformar_Cliente_PDV.Button1Click(Sender: TObject);
begin

  FrmPDV.Nome := EdtNome.Text;
  FrmPDV.CPF := EdtCPF_CNPJ.Text;
  FrmPDV.Endereco := EdtEndereco.Text;

  if (EdtCodigo_Cliente.Text <> '') then
  begin
    FrmPDV.oCli:= TClienteEntidade.Create;
    FrmPDV.oCli.Codigo:= StrToInt(EdtCodigo_Cliente.Text);
    FrmPDV.oCli.NomeFantasia:= EdtNome.Text;
    FrmPDV.oCli.RazaoSocial:= EdtNome.Text;
    FrmPDV.oCli.CPFCNPJ:= EdtCPF_CNPJ.Text;
    FrmPDV.oCli.EnderecoTexto:= EdtEndereco.Text;
  end;

  razao_social_destinatario := EdtNome.Text;
  cnpj_destinatario := EdtCPF_CNPJ.Text;
  endereco_destinatario := EdtEndereco.Text;

  FrmPDV.AbreCupom;
  FrmPDV.LblStatus.Caption:= Caixa_Operacao(1);
  FrmPDV.Atualiza_Dados;
  FrmPDV.Iniciado:= True;
  close;
end;

procedure TFrmInformar_Cliente_PDV.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmInformar_Cliente_PDV:= Nil;
end;

procedure TFrmInformar_Cliente_PDV.FormCreate(Sender: TObject);
begin
  FrmPDV.Inicia_Itens;
end;

procedure TFrmInformar_Cliente_PDV.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmInformar_Cliente_PDV.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
