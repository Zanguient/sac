unit UAltera_Data_Pedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, Mask, Buttons;

type
  TFrmAltera_Data_Pedido = class(TForm)
    Label2: TLabel;
    Label12: TLabel;
    MEdtPrevisao_Entrega: TMaskEdit;
    MEdtHora_Pedido: TMaskEdit;
    btOK: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure Atualiza_Pedido;
    procedure Atualiza_Itens;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAltera_Data_Pedido: TFrmAltera_Data_Pedido;

implementation

uses UDeclaracao, UDM, UGera_Ordem_Entrega;

{$R *.dfm}

procedure TFrmAltera_Data_Pedido.Atualiza_Itens;
begin
  with FrmGera_Ordem_Entrega.qrypedido, sql do
  begin
    close;
    clear;
    add('select P.*, C.Nome_Nome_Fantasia from Pedido P');
    add('inner join Cliente C on (P.Codigo_Cliente = C.Codigo)');
    open;
  end;
end;

procedure TFrmAltera_Data_Pedido.Atualiza_Pedido;
var
  qAux: TADOQuery;
begin
  try
  qAux:= TADOQuery.Create(self);
  with qAux, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('update Pedido set Data_Previsao_Entrega = :Data_Previsao_Entrega, Hora_Entrega = :Hora_Entrega');
    add('where N_Pedido = :Pedido');
    Parameters.ParamByName('Data_Previsao_Entrega').Value:= StrToDateTime(MEdtPrevisao_Entrega.Text);
    Parameters.ParamByName('Hora_Entrega').Value:= MEdtHora_Pedido.Text;
    Parameters.ParamByName('Pedido').Value:= FrmGera_Ordem_Entrega.qrypedidoN_Pedido.AsString;
    ExecSQL;
  end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmAltera_Data_Pedido.btOKClick(Sender: TObject);
begin
  Atualiza_Pedido;
  Atualiza_Itens;
  UDeclaracao.Insere_Historico(usuario, 'ALTEROU DATA/HORA DE PREVISÃO DE ENTREGA DE MERCADORIAS PARA ' + MEdtPrevisao_Entrega.Text + ' / ' + MEdtHora_Pedido.Text + '.', TimeToStr(time), alteracao, date);
  FrmAltera_Data_Pedido.Close;
end;

procedure TFrmAltera_Data_Pedido.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmAltera_Data_Pedido.Free;
  FrmAltera_Data_Pedido:= NIl;
end;

procedure TFrmAltera_Data_Pedido.FormCreate(Sender: TObject);
begin
  MEdtPrevisao_Entrega.Text:= FrmGera_Ordem_Entrega.qrypedidoData_Previsao_Entrega.AsString;
  MEdtHora_Pedido.Text:= FrmGera_Ordem_Entrega.qrypedidoHora_Entrega.AsString;
  //MEdtPrevisao_Entrega.SetFocus;
end;

end.


