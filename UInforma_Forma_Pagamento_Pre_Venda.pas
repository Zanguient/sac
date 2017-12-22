unit UInforma_Forma_Pagamento_Pre_Venda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB;

type
  TFrmInforma_Forma_Pagamento_Pre_Venda = class(TForm)
    EdtCondicao: TEdit;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    EdtForma_Pagamento: TEdit;
    Button1: TButton;
    procedure EdtCondicaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EdtCondicaoKeyPress(Sender: TObject; var Key: Char);
  private
    qAux_Forma_Pagamento: TADOQuery;
    codigo_forma_pagamento, qtde_parcela, prazo: integer;
    forma_pagamento, tipo_pagamento: AnsiString;
    taxa: double;

    procedure Pega_Codigo_Forma_Pagamento(Forma: AnsiString);
    procedure Grava_Forma_Pagamento;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInforma_Forma_Pagamento_Pre_Venda: TFrmInforma_Forma_Pagamento_Pre_Venda;

implementation

uses UFechamento_Venda_PDV, UDeclaracao, UDM, UPedido_Venda, UPre_Venda;

{$R *.dfm}

procedure TFrmInforma_Forma_Pagamento_Pre_Venda.Button1Click(Sender: TObject);
begin
  Grava_Forma_Pagamento;
  close;
end;

procedure TFrmInforma_Forma_Pagamento_Pre_Venda.EdtCondicaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  tec, indice: string;
  i, tamanho: integer;
begin
  if (key = vk_return) then
  begin
    tec:= '';
    tec:= EdtCondicao.Text;
    for i := 0 to ListBox1.Items.Count - 1 do
      begin
        indice:= copy(ListBox1.Items.Strings[i],1,5);
        tamanho:= Length(indice) + 2;
        texto:= copy(ListBox1.Items.Strings[i],tamanho,50);

        indice:= StringReplace(indice, '.','',[rfReplaceAll]);
        indice:= StringReplace(indice, ':','',[rfReplaceAll]);
        if (tec = indice) then
        begin
          ListBox1.ItemIndex:= StrToInt(tec) -1;
          EdtForma_Pagamento.Text:= texto;
          Pega_Codigo_Forma_Pagamento(texto);
          Button1.Enabled:= true;
          Button1.SetFocus;
          break;
        end;
      end;
  end;
end;

procedure TFrmInforma_Forma_Pagamento_Pre_Venda.EdtCondicaoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmInforma_Forma_Pagamento_Pre_Venda.Pega_Codigo_Forma_Pagamento(Forma: AnsiString);
begin
  qAux_Forma_Pagamento:= TADOQuery.Create(self);
  with qAux_Forma_Pagamento, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select CP.Codigo, CP.Descricao, CP.Parcela, CP.Prazo, CP.Tipo_Pagamento, CP.Taxa from Condicao_Pagamento CP');
    add('where Descricao = :Descricao');
    Parameters.ParamByName('Descricao').Value:= Forma;
    open;

    codigo_forma_pagamento:= qAux_Forma_Pagamento.FieldByName('Codigo').AsInteger;
    forma_pagamento:= qAux_Forma_Pagamento.FieldByName('Descricao').AsString;
    qtde_parcela:= qAux_Forma_Pagamento.FieldByName('Parcela').AsInteger;
    prazo:= qAux_Forma_Pagamento.FieldByName('Prazo').AsInteger;
    tipo_pagamento:= qAux_Forma_Pagamento.FieldByName('Tipo_Pagamento').AsString;
    taxa:= qAux_Forma_Pagamento.FieldByName('Taxa').AsFloat;
  end;
end;

procedure TFrmInforma_Forma_Pagamento_Pre_Venda.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmInforma_Forma_Pagamento_Pre_Venda:= nil;
end;

procedure TFrmInforma_Forma_Pagamento_Pre_Venda.FormCreate(Sender: TObject);
var
  qAux: TADOQuery;
   i: integer;
   indice: integer;
begin
  try
    i:= 0;
    indice:= 0;
    qAux:= TADOQuery.Create(self);

    if (sem_rede = false) then
    begin
      dm.qrychama_condicao.Close;
      dm.qrychama_condicao.Open;
      dm.qrychama_condicao.First;
    end
    else
      dm.qrychama_condicao.LoadFromFile(Local_Arquivo(12));
    EdtForma_Pagamento.Text:= dm.qrychama_condicaoDescricao.AsString;

    while not dm.qrychama_condicao.Eof do
    begin
      inc(i);
      inc(indice);
      ListBox1.Items.Add(IntToStr(indice) + '...: ' + dm.qrychama_condicao.FieldByName('Descricao').AsString);
      dm.qrychama_condicao.Next;
    end;

  finally
    //FreeAndNil(qAux);
  end;

end;

procedure TFrmInforma_Forma_Pagamento_Pre_Venda.Grava_Forma_Pagamento;
var
  qAux: TADOQuery;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, SQL do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('INSERT INTO Pedido_Pagamento_DAV');
        add('           (Codigo');
        add('           ,N_Pedido');
        add('           ,Codigo_Forma_Pagamento_Selecionada');
        add('           ,Codigo_Forma_Pagamento');
        add('           ,Forma_Pagamento');
        add('           ,Qtde_Parcela');
        add('           ,Prazo');
        add('           ,Taxa');
        add('           ,Tipo_Pagamento)');
        add('     VALUES');
        add('           (:Codigo');
        add('           ,:N_Pedido');
        add('           ,:Codigo_Forma_Pagamento_Selecionada');
        add('           ,:Codigo_Forma_Pagamento');
        add('           ,:Forma_Pagamento');
        add('           ,:Qtde_Parcela');
        add('           ,:Prazo');
        add('           ,:Taxa');
        add('           ,:Tipo_Pagamento)');

        if (FrmPedido_Venda <> nil) then
          Parameters.ParamByName('Codigo').Value:= StrToInt(FrmPedido_Venda.EdtCodigo.Text)
        else if (FrmPre_Venda <> nil) then
          Parameters.ParamByName('Codigo').Value:= StrToInt(FrmPre_Venda.EdtCodigo.Text);

        if (FrmPedido_Venda <> nil) then
          Parameters.ParamByName('N_Pedido').Value:= FrmPedido_Venda.EdtN_Pedido.Text
        else if (FrmPre_Venda <> nil) then
          Parameters.ParamByName('N_Pedido').Value:= FrmPre_Venda.EdtN_Pedido.Text;

        Parameters.ParamByName('Codigo_Forma_Pagamento_Selecionada').Value:= StrToInt(EdtCondicao.Text);
        Parameters.ParamByName('Codigo_Forma_Pagamento').Value:= codigo_forma_pagamento;
        Parameters.ParamByName('Forma_Pagamento').Value:= forma_pagamento;
        Parameters.ParamByName('Qtde_Parcela').Value:= qtde_parcela;
        Parameters.ParamByName('Prazo').Value:= prazo;
        Parameters.ParamByName('Taxa').Value:= taxa;
        Parameters.ParamByName('Tipo_Pagamento').Value:= tipo_pagamento;
        ExecSQL;
      end;
  finally
    qAux.Close;
    FreeAndNil(qAux);
  end;
end;

end.
