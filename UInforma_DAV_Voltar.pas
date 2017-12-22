unit UInforma_DAV_Voltar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, RSPrint, ExtCtrls;

type
  TFrmInforma_DAV_Voltar = class(TForm)
    EdtPedido: TEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdtPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    qAux2: TADOQuery;
    procedure Verifica_Pedido;
    procedure Atualiza_Dados_Pedido;
    procedure Deleta_R05;
    procedure Deleta_Pre_Venda;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInforma_DAV_Voltar: TFrmInforma_DAV_Voltar;

implementation

uses UDeclaracao, UDM;

{$R *.dfm}

procedure TFrmInforma_DAV_Voltar.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  //FrmInforma_DAV_Voltar.Free;
  FrmInforma_DAV_Voltar:= nil;
end;

procedure TFrmInforma_DAV_Voltar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_ESCAPE) then
    FrmInforma_DAV_Voltar.Close;
end;

procedure TFrmInforma_DAV_Voltar.Verifica_Pedido;
var
  Pedido: AnsiString;
begin
  Pedido:= StringOfChar('0', 12-Length(EdtPedido.Text)) + EdtPedido.Text;
  qAux2:= TADOQuery.Create(self);
  try
    with qAux2, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select P.Codigo, P.N_Pedido, P.N_Pre_Venda from Pedido P');
      add('where P.N_Pedido = :N_Pedido and (P.Status = :Status1 or P.Status = :Status2)');//and P.Status = :Status');
      Parameters.ParamByName('N_Pedido').Value:= Pedido;
      Parameters.ParamByName('Status1').Value:= 'PENDENTE';
      Parameters.ParamByName('Status2').Value:= 'ANULADO';
      open;

      if (IsEmpty = true) then
      begin
        Nao_Selecionado;
        EdtPedido.SetFocus;
        abort;
      end
      else
      begin
        if (Confirma_Processo) then
        begin
          //Deleta_Pre_Venda;
          Atualiza_Dados_Pedido;
          //Deleta_R05;
          Processo_Concluido;
        end;
        FrmInforma_DAV_Voltar.Close;
      end;
    end;
  finally
    FreeAndNil(qAux2);
  end;
end;

procedure TFrmInforma_DAV_Voltar.Atualiza_Dados_Pedido;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update Pedido set N_Pre_Venda = :N_Pre_Venda, Tipo = :Tipo, Status = :Status, DAVC = :DAVC');
      add('where Codigo = :Codigo');

      if (gera_pre_venda = '0101') and (gera_dav = '0101') then
      begin
        Parameters.ParamByName('N_Pre_Venda').Value:= '';
        Parameters.ParamByName('Tipo').Value:= 'DAV';
      end
      else if (gera_pre_venda = '0101') and (gera_dav = '0202') then
      begin
        Gera_N_Pre_Venda(dm.ADOConnection1);
        Parameters.ParamByName('N_Pre_Venda').Value:= UDeclaracao.pre_venda;
        Parameters.ParamByName('Tipo').Value:= 'PRÉ-VENDA';
      end
      else if (gera_pre_venda = '0202') and (gera_dav = '0101') then
      begin
        Parameters.ParamByName('N_Pre_Venda').Value:= '';
        Parameters.ParamByName('Tipo').Value:= 'DAV';
      end;

      Parameters.ParamByName('Status').Value:= 'PENDENTE';
      Parameters.ParamByName('DAVC').Value:= 'NÃO';
      Parameters.ParamByName('Codigo').Value:= qAux2.FieldByName('Codigo').AsInteger;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmInforma_DAV_Voltar.Deleta_R05;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('Delete from R05');
      add('where N_Pedido = :N_Pedido');
      Parameters.ParamByName('N_Pedido').Value:= qAux2.FieldByName('Codigo').AsInteger;
      ExecSQL;
    end;

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('Delete from R05_Aux');
      add('where N_Pedido = :N_Pedido');
      Parameters.ParamByName('N_Pedido').Value:= qAux2.FieldByName('Codigo').AsInteger;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmInforma_DAV_Voltar.EdtPedidoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Verifica_Pedido;
  end;
end;

procedure TFrmInforma_DAV_Voltar.Deleta_Pre_Venda;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('Delete from Controla_Pre_Venda');
      add('where N_Pre_Venda = :N_Pre_Venda');
      Parameters.ParamByName('N_Pre_Venda').Value:= qAux2.FieldByName('N_Pre_Venda').AsInteger;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

end.
