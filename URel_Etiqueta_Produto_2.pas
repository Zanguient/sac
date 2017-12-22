unit URel_Etiqueta_Produto_2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, DBTables, grimgctrl, ADODB;

type
  TFrmRel_Etiqueta_Produto_2 = class(TForm)
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
  FrmRel_Etiqueta_Produto_2: TFrmRel_Etiqueta_Produto_2;

implementation

uses UDM, UGera_Etiqueta_Produto_2;

{$R *.dfm}

procedure TFrmRel_Etiqueta_Produto_2.FormCreate(Sender: TObject);
begin
  Monta_Relatorio;
end;

procedure TFrmRel_Etiqueta_Produto_2.Monta_Relatorio;
begin
  //qtde colunas
  QuickRep1.Page.Columns:= FrmGera_Etiqueta_Produto_2.etiqueta_linha;

  //Altura etiqueta
  QRExpr1.Size.Height := FrmGera_Etiqueta_Produto_2.altura_etiqueta * 10;

  //Largura etiqueta
  QRExpr1.Size.Width := FrmGera_Etiqueta_Produto_2.largura_etiqueta * 10;

  //Altura coluna
  QrDados.Size.Height:= FrmGera_Etiqueta_Produto_2.distancia_vertical * 10;

  //Largura coluna
  QrDados.Size.Width:= FrmGera_Etiqueta_Produto_2.distancia_horizontal * 10;

  //Tamanho Fonte
  QRExpr1.Font.Size:= FrmGera_Etiqueta_Produto_2.tamanho_fonte;

  //Altura Página
  QuickRep1.Page.Length:= FrmGera_Etiqueta_Produto_2.altura_pagina * 10;

  //Largura Página
  QuickRep1.Page.Width:= FrmGera_Etiqueta_Produto_2.largura_pagina * 10;

  //Margem Esquerda
  QuickRep1.Page.LeftMargin:= FrmGera_Etiqueta_Produto_2.margem_esquerda * 10;

  //Margem direita
  QuickRep1.Page.RightMargin:= FrmGera_Etiqueta_Produto_2.margem_direita * 10;

  //margem superior
  QuickRep1.Page.TopMargin:= FrmGera_Etiqueta_Produto_2.margem_superior * 10;

  //margem inferior
  QuickRep1.Page.BottomMargin:= FrmGera_Etiqueta_Produto_2.margem_inferior * 10;
  EtiquetaInicial:= FrmGera_Etiqueta_Produto_2.EtiquetaSelecionada;
  QuickRep1.Preview;
end;

procedure TFrmRel_Etiqueta_Produto_2.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  var
    x: integer;
    texto: string;
begin
  QrDados.Items.Clear;
  for x := 1 to EtiquetaInicial -1 do
    QrDados.Items.Add('');

  FrmGera_Etiqueta_Produto_2.ClientDataSet1.First;
  while not FrmGera_Etiqueta_Produto_2.ClientDataSet1.Eof do
    begin
      for x := 1 to FrmGera_Etiqueta_Produto_2.ClientDataSet1.FieldByName('Quantidade').AsInteger do
        begin
          Text:= '';
          texto:= 'CÓDIGO....: '+ FrmGera_Etiqueta_Produto_2.ClientDataSet1.FieldByName('Codigo_Produto').AsString + #13;
          texto:= texto +
                  'DESCRIÇÃO.: ' + FrmGera_Etiqueta_Produto_2.ClientDataSet1.FieldByName('Descricao').AsString + #13;
          texto:= texto +
                  'MARCA.....: '+FrmGera_Etiqueta_Produto_2.ClientDataSet1.FieldByName('Marca').AsString;
          QrDados.Items.Add(Texto);
        end;
        FrmGera_Etiqueta_Produto_2.ClientDataSet1.Next;
    end;

end;

end.
