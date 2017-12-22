unit URel_Etiqueta_Produto__Entrada_2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB;

type
  TFrmRel_Etiqueta_Produto_Entrada_2 = class(TForm)
    QuickRep1: TQuickRep;
    QrDados: TQRStringsBand;
    QRExpr1: TQRExpr;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    procedure Monta_Relatorio;
    { Private declarations }
  public
    { Public declarations }
    EtiquetaInicial: integer;
  end;

var
  FrmRel_Etiqueta_Produto_Entrada_2: TFrmRel_Etiqueta_Produto_Entrada_2;

implementation

uses UDM, UEntrada_Produtos;

{$R *.dfm}

procedure TFrmRel_Etiqueta_Produto_Entrada_2.FormCreate(Sender: TObject);
begin
  Monta_Relatorio;
end;

procedure TFrmRel_Etiqueta_Produto_Entrada_2.Monta_Relatorio;
begin
  //qtde colunas
  QuickRep1.Page.Columns:= FrmEntrada_Produtos.etiqueta_linha;

  //Altura etiqueta
  QRExpr1.Size.Height := FrmEntrada_Produtos.altura_etiqueta * 10;

  //Largura etiqueta
  QRExpr1.Size.Width := FrmEntrada_Produtos.largura_etiqueta * 10;

  //Altura coluna
  QrDados.Size.Height:= FrmEntrada_Produtos.distancia_vertical * 10;

  //Largura coluna
  QrDados.Size.Width:= FrmEntrada_Produtos.distancia_horizontal * 10;

  //Tamanho Fonte
  QRExpr1.Font.Size:= FrmEntrada_Produtos.tamanho_fonte;

  //Altura Página
  QuickRep1.Page.Length:= FrmEntrada_Produtos.altura_pagina * 10;

  //Largura Página
  QuickRep1.Page.Width:= FrmEntrada_Produtos.largura_pagina * 10;

  //Margem Esquerda
  QuickRep1.Page.LeftMargin:= FrmEntrada_Produtos.margem_esquerda * 10;

  //Margem direita
  QuickRep1.Page.RightMargin:= FrmEntrada_Produtos.margem_direita * 10;

  //margem superior
  QuickRep1.Page.TopMargin:= FrmEntrada_Produtos.margem_superior * 10;

  //margem inferior
  QuickRep1.Page.BottomMargin:= FrmEntrada_Produtos.margem_inferior * 10;
  EtiquetaInicial:= FrmEntrada_Produtos.EtiquetaSelecionada;
  QuickRep1.Preview;
end;

procedure TFrmRel_Etiqueta_Produto_Entrada_2.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var
    x: integer;
    texto: string;
begin
  QrDados.Items.Clear;
  for x := 1 to EtiquetaInicial -1 do
    QrDados.Items.Add('');

  FrmEntrada_Produtos.qryitens_entrada.First;
  while not FrmEntrada_Produtos.qryitens_entrada.Eof do
    begin
      for x := 1 to FrmEntrada_Produtos.qryitens_entradaQuantidade.AsInteger do
        begin
          Text:= '';
          texto:= 'CÓDIGO....: '+ FrmEntrada_Produtos.qryitens_entrada.FieldByName('Codigo_Venda').AsString + #13;
          texto:= texto +
                  'DESCRIÇÃO.: ' + FrmEntrada_Produtos.qryitens_entrada.FieldByName('Descricao').AsString + #13;
          texto:= texto +
                  'MARCA.....: '+ FrmEntrada_Produtos.qryitens_entrada.FieldByName('Marca').AsString;
          QrDados.Items.Add(Texto);
        end;
        FrmEntrada_Produtos.qryitens_entrada.Next;
    end;

end;

end.
