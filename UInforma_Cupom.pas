unit UInforma_Cupom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB;

type
  TFrmInforma_Cupom = class(TForm)
    EdtPedido: TEdit;
    procedure EdtPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInforma_Cupom: TFrmInforma_Cupom;

implementation

uses UDeclaracao, UDM;

{$R *.dfm}

procedure TFrmInforma_Cupom.EdtPedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  qAux: TADOQuery;
begin
  if (key = vk_return) then
  begin
    if (Cancela_DAV = true) then
    begin
      try
        qAux:= TADOQuery.Create(self);
        try
        with qAux, sql do
        begin
          close;
          Connection:= dm.ADOConnection1;
          clear;
          add('update Pedido set Status = :Status');
          add('where N_Pedido = :N_Pedido');
          Parameters.ParamByName('Status').Value:= 'CANCELADO';
          Parameters.ParamByName('N_Pedido').Value:= EdtPedido.Text;
          ExecSQL;
        end;

        //iRetorno:= Bematech_FI_CancelaCupom;
        //Analisa_iRetorno;
        except
          showmessage('Erro');
        end;
      finally
        FreeAndNil(qAux);
        //AlteraGT;
        DAV_Cancelado;
        close;
      end;
    end;
  end;

end;

end.
