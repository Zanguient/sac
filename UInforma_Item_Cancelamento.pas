unit UInforma_Item_Cancelamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, DB, DBClient;

type
  TFrmInforma_Item_Cancelamento = class(TForm)
    EdtCondicao: TEdit;
    procedure EdtCondicaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdtCondicaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInforma_Item_Cancelamento: TFrmInforma_Item_Cancelamento;

implementation

uses UDeclaracao, UDM, UPDV;

{$R *.dfm}

procedure TFrmInforma_Item_Cancelamento.EdtCondicaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  total, sub1, sub2, valor_cancelado: double;
  item: AnsiString;
begin
  if (key = VK_RETURN) then
  begin
    item_cancelamento:= EdtCondicao.Text;
    item:= item_cancelamento;
    if not (dm.qryitens_venda.Locate('N_Item', item_cancelamento, [])) then
    begin
      Application.MessageBox('Item não encontrado', '', MB_OK+MB_ICONHAND);
      abort;
    end
    else if (dm.qryitens_vendaCancelado.AsString = 'S') then
    begin
      Item_Ja_Cancelado;
      abort;
    end
    else
    begin
      if (Confirma_Exclusao) then
      begin
        //ECF.Cancela_Item(StrToInt(item_cancelamento));

        if (dm.qryitens_venda.Locate('Codigo;N_Item', VarArrayOf([FrmPDV.LblCodigo.Caption, item_cancelamento]), [])) then
        begin
          dm.qryitens_venda.Edit;
          dm.qryitens_vendaCancelado.AsString:= 'S';
          dm.qryitens_venda.Post;
        end;

        {if (dm.qryr05.Locate('N_Pedido;N_Item', VarArrayOf([FrmPDV.LblCodigo.Caption, item_cancelamento]), [])) then
        begin
          dm.qryr05.Edit;
          dm.qryr05Cancelamento.AsString:= 'S';

          dm.qryr05Quantidade_Cancelada.AsString:= dm.qryitens_vendaQtde.AsString;
          valor_cancelado:= dm.qryitens_vendaQtde.AsFloat * dm.qryitens_vendaValor_Unitario.AsFloat;
          dm.qryr05Valor_Cancelado.AsString:= FloatToStr(valor_cancelado);
          dm.qryr05.Post;
        end; }

        sub1:= StrToFloat(FrmPDV.LblSub_Total.Caption);
        sub2:= dm.qryitens_vendaSub_Total.AsFloat;
        total:= sub1 - sub2;
        FrmPDV.LblSub_Total.Caption:= FormatFloat('#0.0,0', total);
        FrmPDV.LblSub_Total.Caption:= StringReplace(FrmPDV.LblSub_Total.Caption, ThousandSeparator, '', [rfReplaceAll]);

        close;
      end;
    end;
  end;

  if (key = VK_ESCAPE) then
    close;
end;

procedure TFrmInforma_Item_Cancelamento.EdtCondicaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmInforma_Item_Cancelamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmInforma_Item_Cancelamento:= nil;
end;

end.
