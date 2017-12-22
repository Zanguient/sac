unit UInforma_Forma_Pagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB,
  Modelo.Dominio.TCondicaoPagamentoDominio,
  Modelo.Entidade.TCondicaoPagamentoEntidade;


type
  TFrmInforma_Forma_Pagamento = class(TForm)
    EdtCondicao: TEdit;
    procedure EdtCondicaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    qAux_Forma_Pagamento: TADOQuery;
    oCP: TCondicaoPagamentoEntidade;
    oCPDominio: TCondicaoPagamentoDominio;

    procedure Pega_Codigo_Forma_Pagamento(Forma: AnsiString);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInforma_Forma_Pagamento: TFrmInforma_Forma_Pagamento;

implementation

uses UFechamento_Venda_PDV, UDeclaracao, UDM;
{$R *.dfm}

procedure TFrmInforma_Forma_Pagamento.EdtCondicaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  tec, indice, te: string;
  i, tamanho: integer;
begin
  if (key = vk_return) then
  begin
    tec:= '';
    tec:= EdtCondicao.Text;
    for i := 0 to FrmFechamento_Venda_PDV.ListBox1.Items.Count - 1 do
      begin
        te:= copy(FrmFechamento_Venda_PDV.ListBox1.Items.Strings[i],1,2);
        te:= StringReplace(te, '.', '', [rfReplaceAll]);

        if (Length(te) = 1) then
          indice:= copy(FrmFechamento_Venda_PDV.ListBox1.Items.Strings[i],1,5)
        else
          indice:= copy(FrmFechamento_Venda_PDV.ListBox1.Items.Strings[i],1,6);

        tamanho:= Length(indice) + 2;
        texto:= copy(FrmFechamento_Venda_PDV.ListBox1.Items.Strings[i],tamanho,50);

        indice:= StringReplace(indice, '.','',[rfReplaceAll]);
        indice:= StringReplace(indice, ':','',[rfReplaceAll]);
        if (tec = indice) then
        begin
          FrmFechamento_Venda_PDV.ListBox1.ItemIndex:= StrToInt(tec) -1;
          FrmFechamento_Venda_PDV.EdtForma_Pagamento.Text:= texto;//FrmFechamento_Venda_PDV.ListBox1.Items[FrmFechamento_Venda_PDV.ListBox1.ItemIndex];
          Pega_Codigo_Forma_Pagamento(texto);

          oCP:= TCondicaoPagamentoEntidade.Create;
          oCPDominio:= TCondicaoPagamentoDominio.Create(dm.ADOConnection1);
          oCP:= oCPDominio.CarregaDadosCondicao(texto);

          FrmFechamento_Venda_PDV.BuscaCondPagOutroForm(oCP);

          FrmFechamento_Venda_PDV.EdtValor.SetFocus;
          FrmFechamento_Venda_PDV.EdtValor.SelectAll;
          FrmInforma_Forma_Pagamento.Close;
          break;
        end;
      end;
  end;

  if (key = VK_ESCAPE) then
    close;
end;

procedure TFrmInforma_Forma_Pagamento.Pega_Codigo_Forma_Pagamento(Forma: AnsiString);
begin
  qAux_Forma_Pagamento:= TADOQuery.Create(self);
  with qAux_Forma_Pagamento, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select CP.Codigo, CP.Indice, CP.Parcela, CP.Prazo, CP.Taxa, CP.Tipo_Pagamento,CP.Tipo_Juro from Condicao_Pagamento CP');
    add('where Descricao = :Descricao');
    Parameters.ParamByName('Descricao').Value:= Forma;
    open;

    FrmFechamento_Venda_PDV.codigo_forma_pagamento:= qAux_Forma_Pagamento.FieldByName('Codigo').AsInteger;
    FrmFechamento_Venda_PDV.indice_imp:= qAux_Forma_Pagamento.FieldByName('Indice').AsString;
    FrmFechamento_Venda_PDV.qtde_parcela:= qAux_Forma_Pagamento.FieldByName('Parcela').AsInteger;
    FrmFechamento_Venda_PDV.prazo:= qAux_Forma_Pagamento.FieldByName('Prazo').AsInteger;
    FrmFechamento_Venda_PDV.taxa_juro:= qAux_Forma_Pagamento.FieldByName('Taxa').AsInteger;
    FrmFechamento_Venda_PDV.tipo_pagamento:= qAux_Forma_Pagamento.FieldByName('Tipo_Pagamento').AsString;
    FrmFechamento_Venda_PDV.tipo_juro:= qAux_Forma_Pagamento.FieldByName('Tipo_Juro').AsString;
  end;
end;

procedure TFrmInforma_Forma_Pagamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmInforma_Forma_Pagamento:= nil;
end;

end.
