unit UFechamento_Pedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UGeral, URegistro, DB, ADODB, DBClient, Grids,
  DBGrids, ComCtrls, Provider;

type
  TFrmFechamento_Pedido = class(TForm)
    Label3: TLabel;
    EdtTotal_Venda: TEdit;
    Label4: TLabel;
    EdtValor_Recebido: TEdit;
    Label5: TLabel;
    EdtTroco: TEdit;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    EdtValor: TEdit;
    ListBox1: TListBox;
    qryfechamento_pedido: TADOQuery;
    ds_qry_formas_pagamento: TDataSource;
    qryfechamento_pedidoCodigo: TIntegerField;
    qryfechamento_pedidoN_Pedido: TStringField;
    qryfechamento_pedidoForma_Pagamento: TStringField;
    qryfechamento_pedidoValor: TFloatField;
    qryfechamento_pedidoData: TDateTimeField;
    qryfechamento_pedidoTipo_Documento: TStringField;
    procedure EdtValor_RecebidoExit(Sender: TObject);
    procedure EdtValor_RecebidoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure EdtValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtValorEnter(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure Atualiza_Dados;
  private
    { Private declarations }
    Venda: URegistro.TVenda_ECF;
    Fechamento_Venda: URegistro.TFechamento_Venda;
    Itens_Venda: URegistro.TItens_Venda_ECF;
    Util: UGeral.TUtil;
    R04: TR04;
    R07: TR07;
    R05: TR05;
    cod: string;
    flagfiscal: integer;
  public
    ccf, coo, gnf, data_inicio_emissao, subtotal, desconto_subtotal, indicador_tipo_desc, acrecimo,
    indicador_tipo_acre, valor_total, indicador_cancelamento, cancelamento_acrecimo, indicador_desc_acre,
    adquirente, cnpj_adquirente, indicador_estorno, valor_estorno, forma_pg, valor_pago: string;
    iConta: integer;
    cFormaPgto: string;
    { Public declarations }
  end;

var
  FrmFechamento_Pedido: TFrmFechamento_Pedido;

implementation

uses UDeclaracao, UDM, UCarrega_Pedido_Caixa;

{$R *.dfm}

procedure TFrmFechamento_Pedido.Atualiza_Dados;
begin
  with qryfechamento_pedido, sql do
  begin
    close;
    clear;
    add('select FV.* from Fechamento_Venda FV');
    add('where FV.N_Pedido = :Pedido');
    Parameters.ParamByName('Pedido').Value:= FrmCarrega_Pedido_Caixa.qrycarrega_caixaN_Pedido.AsString;
    open;
  end;
end;

procedure TFrmFechamento_Pedido.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  valor_recebido, valor, total: double;
begin
  if (key = vk_delete) then
  begin
    if Confirma_Delete = true then
    begin
      valor_recebido:= StrToFloat(EdtValor_Recebido.Text);
      valor:= qryfechamento_pedidoValor.AsFloat;
      total:= valor_recebido - valor;
      EdtValor_Recebido.Text:= FormatFloat('#0.0,0', total);
      EdtValor_Recebido.Text:= StringReplace(EdtValor_Recebido.Text, ThousandSeparator, '', [rfReplaceAll]);
      qryfechamento_pedido.Delete;
      Atualiza_Dados;
    end;
  end;
end;

procedure TFrmFechamento_Pedido.EdtDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', ',',#08]) then
    key := #0
end;

procedure TFrmFechamento_Pedido.EdtValorEnter(Sender: TObject);
var
    mensagem, cAcreDesc, cTipoAcreDesc, cValorAcreDesc, cFormaPgto, cValorPago: string;
begin
  if (FrmCarrega_Pedido_Caixa.qrycarrega_caixaTipo_Desconto.AsString = '%') then
    cTipoAcreDesc:= '%'
  else
    cTipoAcreDesc:= '$';

  cAcreDesc:= 'D';
  cValorAcreDesc:= FormatFloat('#0.0,0', FrmCarrega_Pedido_Caixa.qrycarrega_caixaDesconto.AsFloat);
  iRetorno:= Bematech_FI_IniciaFechamentoCupom(cAcreDesc, cTipoAcreDesc, cValorAcreDesc);
  Analisa_iRetorno;
end;

procedure TFrmFechamento_Pedido.EdtValorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  total, valor: double;
  i: integer;
  item: string;
begin
  if (key = vk_return) then
  begin
    if (EdtValor_Recebido.Text < EdtTotal_Venda.Text) then
    begin
      for i := 0 to ListBox1.Items.Count - 1 do
      begin
        if (ListBox1.Selected[i]) then
        begin
          item:= ListBox1.Items[(ListBox1.ItemIndex)];
          cFormaPgto:= item;
        end;
      end;
      iRetorno:= Bematech_FI_EfetuaFormaPagamento(cFormaPgto, FormatFloat('#0.0,0', StrToFloat(EdtValor.Text)));
      Analisa_iRetorno;

      total:= StrToFloat(EdtValor_Recebido.Text);
      valor:= StrToFloat(EdtValor.Text);
      total:= total + valor;
      EdtValor_Recebido.Text:= FormatFloat('#0.0,0', total);
      EdtValor_Recebido.Text:= StringReplace(EdtValor_Recebido.Text, ThousandSeparator, '', [rfReplaceAll]);
      Fechamento_Venda.Salva_Pedido(Fechamento_Venda);
      Atualiza_Dados;
      EdtTotal_Venda.SetFocus;
    end;
  end;
end;

procedure TFrmFechamento_Pedido.EdtValor_RecebidoExit(Sender: TObject);
var
  v_rec, t_venda, troco: double;
begin
  if (EdtValor_Recebido.Text < EdtTotal_Venda.Text) then
  begin
    Application.MessageBox('O valor recebido deve ser maior ou igual ao total de venda', 'Erro', MB_OK+MB_ICONHAND);
    EdtValor_Recebido.SetFocus;
    abort
  end
  else
  begin
    v_rec:= StrToFloat(EdtValor_Recebido.Text);
    t_venda:= StrToFloat(EdtTotal_Venda.Text);
    troco:= v_rec - t_venda;
    EdtTroco.Text:= FormatFloat('#0.0,0', troco);
    EdtTroco.Text:= StringReplace(EdtTroco.Text, ThousandSeparator, '', [rfReplaceAll]);
  end;
end;

procedure TFrmFechamento_Pedido.EdtValor_RecebidoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', ',',#08]) then
    key := #0
end;

procedure TFrmFechamento_Pedido.FormCreate(Sender: TObject);
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
      add('select * from Condicao_Pagamento');
      open;
    end;

    while not qAux.Eof do
    begin
      ListBox1.Items.Add(qAux.FieldByName('Descricao').AsString);
      qAux.Next;
    end;
  finally
    FreeAndNil(qAux);
  end;

  EdtTotal_Venda.Text:= FrmCarrega_Pedido_Caixa.qrycarrega_caixaTotal_Pedido.AsString;
  //EdtSub_Total.SetFocus;

end;

procedure TFrmFechamento_Pedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  qAux: TADOQuery;
  mensagem, cAcreDesc, cTipoAcreDesc, cValorAcreDesc, cFormaPgto, cValorPago: string;
  iConta: integer;
  COO: AnsiString;
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f9) then
  begin
    //if (Confira = true) then
    //begin
      for iConta := 1 to 6 do
        COO := COO + ' ';

      iRetorno := Bematech_FI_NumeroCupom(COO);
      Analisa_iRetorno;

      mensagem:= 'DAV ' + FrmCarrega_Pedido_Caixa.qrycarrega_caixaN_Pedido.AsString;

      {if (iRetorno = 1) then
      begin
        COO := Copy(dados_reducao, 14, 6);
      end;}

      qAux:= TADOQuery.Create(self);
      with qAux, sql do
      begin
        close;
        Connection:= dm.ADOConnection1;
        clear;
        add('update Pedido set COO = :COO');
        add('where N_Pedido = :Pedido');
        Parameters.ParamByName('COO').Value:= COO;
        Parameters.ParamByName('Pedido').Value:= FrmCarrega_Pedido_Caixa.qrycarrega_caixaN_Pedido.AsString;
        ExecSQL;
      end;

      //fazer também para o COO_Vin pra colocar no arquivo do DAV Emitido
      iRetorno:= Bematech_FI_TerminaFechamentoCupom(pMD5 + '                ' + mensagem); //(pchar(mensagem));
      Analisa_iRetorno;
      AlteraGT;
      Close;
  end;
end;

procedure TFrmFechamento_Pedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
