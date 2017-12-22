unit UChama_Cliente_PDV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UFiscal;

type
  TFrmChama_Cliente_PDV = class(TForm)
    Button1: TButton;
    Label6: TLabel;
    EdtCodigo_Cliente: TEdit;
    EdtCliente: TEdit;
    EdtCPF: TEdit;
    EdtEndereco: TEdit;
    EdtN: TEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    loImpressora: IFiscal;
    lnImp: integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChama_Cliente_PDV: TFrmChama_Cliente_PDV;

implementation

uses UPDV;

{$R *.dfm}

procedure TFrmChama_Cliente_PDV.Button1Click(Sender: TObject);
begin
  FrmPDV.Nome:= EdtCliente.Text;
  FrmPDV.Endereco:= EdtEndereco.Text + ', ' + EdtN.Text;
  FrmPDV.CPF:= EdtCPF.Text;
end;

procedure TFrmChama_Cliente_PDV.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Cliente_PDV:= Nil;
end;

procedure TFrmChama_Cliente_PDV.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmChama_Cliente_PDV.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
