unit UDesconto_PDV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFrmDesconto_PDV = class(TForm)
    RGAcr_Desc: TRadioGroup;
    EdtValor: TEdit;
    Label1: TLabel;
    Button1: TButton;
    RGTipo: TRadioGroup;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure EdtValorKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDesconto_PDV: TFrmDesconto_PDV;

implementation

uses UPDV, UPedido_Venda;

{$R *.dfm}

procedure TFrmDesconto_PDV.Button1Click(Sender: TObject);
var
  valor_unitario, valor_desc, desc: double;
begin
  if (EdtValor.Text < '0') or (EdtValor.Text = '') then
  begin
    Application.MessageBox('Não é permitido valor negativo', 'Impossível continuar', MB_OK+MB_ICONHAND);
    EdtValor.Clear;
    EdtValor.SetFocus
  end
  else
  begin
    desc:= StrToFloat(EdtValor.Text);

    if (FrmPedido_Venda <> nil) and (FrmPedido_Venda.ativo) then
    begin
      valor_unitario:= StrToFloat(FrmPedido_Venda.EdtValor_Unitario.Text);
    end
    else if (FrmPDV <> nil) and (FrmPDV.ativo) then
    begin
      valor_unitario:= StrToFloat(FrmPDV.EdtValor_Unitario.Text);
    end;

    if (RGTipo.ItemIndex = 0) then
    begin
      valor_desc:= valor_unitario * (desc / 100);
    end
    else
    begin
      valor_desc:= desc;
    end;

    EdtValor.Text:= FloatToStr(valor_desc);

    if (Application.MessageBox('Confirma o valor de desconto/acrescimo?', 'Confirmação', MB_YESNO+MB_ICONEXCLAMATION)) = idyes then
    begin
      if (RGAcr_Desc.ItemIndex = 0) then
      begin
        if (FrmPDV <> nil) and (FrmPDV.ativo) then
          FrmPDV.dOUa:= 'A';
      end
      else
      begin
        if (FrmPDV <> nil) and (FrmPDV.ativo) then
          FrmPDV.dOUa:= 'D';
      end;

      if (FrmPedido_Venda <> nil) and (FrmPedido_Venda.ativo) then
      begin
        if (RGAcr_Desc.ItemIndex = 0) then
          FrmPedido_Venda.EdtValor_Unitario.Text:= FloatToStr(valor_unitario + valor_desc)
        else
          FrmPedido_Venda.EdtValor_Unitario.Text:= FloatToStr(valor_unitario - valor_desc);
      end
      else if (FrmPDV <> nil) and (FrmPDV.ativo) then
      begin
        if (RGAcr_Desc.ItemIndex = 0) then
          FrmPDV.total_valor_uni:= valor_desc
        else
          FrmPDV.total_valor_uni:= valor_desc;
      end;

      close;
    end;

  end;
end;

procedure TFrmDesconto_PDV.EdtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', ',', #08]) then
    key := #0
end;

procedure TFrmDesconto_PDV.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmDesconto_PDV:= Nil;
end;

procedure TFrmDesconto_PDV.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmDesconto_PDV.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;

end;

end.
