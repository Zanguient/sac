unit UGera_Etiqueta_Produto_2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls, ComCtrls,
  ImgList, ToolWin, DB, DBClient, uDeclaracao;

type
  TFrmGera_Etiqueta_Produto_2 = class(TForm)
    StbStatus: TStatusBar;
    Timer1: TTimer;
    ImgImagens_Cadastros: TImageList;
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnImprimir: TToolButton;
    BBtnFechar: TToolButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    LblSetor: TLabel;
    EdtCodigo_Produto: TEdit;
    EdtDescricao: TEdit;
    BBtnLimpar: TToolButton;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    PanelEtiquetas: TPanel;
    Label2: TLabel;
    EdtEtiqueta: TEdit;
    EdtCodigo_Etiqueta: TEdit;
    BBtnGera_Etiqueta: TToolButton;
    Label1: TLabel;
    EdtMarca: TEdit;
    Label5: TLabel;
    ClientDataSet1Codigo_Produto: TStringField;
    ClientDataSet1Descricao: TStringField;
    ToolButton1: TToolButton;
    OpenDialog1: TOpenDialog;
    ClientDataSet1Marca: TStringField;
    Label3: TLabel;
    EdtQuantidade: TEdit;
    ClientDataSet1Quantidade: TIntegerField;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BBtnFecharClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_EtiquetaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnGera_EtiquetaClick(Sender: TObject);
    procedure EdtMarcaExit(Sender: TObject);
    procedure EdtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtMarcaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_EtiquetaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtEtiquetaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ToolButton1Click(Sender: TObject);
  private
    achou, carregou: boolean;

    procedure Limpa_Menor;
    procedure Limpa_Cliente;
    procedure Verifica_Etiqueta;
    procedure Verifica_Etiqueta_Menor;
    procedure CriaEtiqueta(NColuna, NLinha: integer);
    procedure ClickEtiqueta(Sender: TObject);
    procedure DesmarcarEtiquetas(EtiquetaInicial: integer);
    { Private declarations }
  public
    ativo: boolean;
    etiqueta_linha, linha_pagina, EtiquetaSelecionada, tamanho_fonte: integer;

    margem_esquerda, margem_direita, margem_superior, margem_inferior, distancia_horizontal, distancia_vertical,
    altura_etiqueta, largura_etiqueta, altura_pagina, largura_pagina: double;
    { Public declarations }
  end;

var
  FrmGera_Etiqueta_Produto_2: TFrmGera_Etiqueta_Produto_2;
  codigo: integer;
implementation

uses UDM, UChama_Etiqueta, URel_Etiqueta_Produto, UChama_Produto,
  URel_Etiqueta_Produto_2;

{$R *.dfm}

procedure TFrmGera_Etiqueta_Produto_2.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmGera_Etiqueta_Produto_2.BBtnGera_EtiquetaClick(Sender: TObject);
begin
  Verifica_Etiqueta;
  CriaEtiqueta(etiqueta_linha, linha_pagina);
  BBtnImprimir.Enabled:= true;
end;

procedure TFrmGera_Etiqueta_Produto_2.CriaEtiqueta(NColuna, NLinha: integer);
var
  x, y: integer;
  LarguraColunas, AlturaColunas: double;
  Etiqueta: TLabel;
  Tag: integer;
  Esquerda, Topo: integer;
begin
  for x := PanelEtiquetas.ComponentCount - 1 downto 0 do
    begin
      Etiqueta:= TLabel(PanelEtiquetas.Components[x]);
      PanelEtiquetas.RemoveControl(Etiqueta);
      Etiqueta.Parent:= nil;
      Etiqueta.Free;
      Etiqueta:= nil;
    end;
    PanelEtiquetas.Refresh;

    LarguraColunas:= PanelEtiquetas.Width/NColuna;
    AlturaColunas:= PanelEtiquetas.Height/NLinha;
    Tag:= 0;
    Esquerda:= 0;
    Topo:= 0;

    for x := 1 to NColuna do
      begin
        for y := 1 to NLinha do
          begin
            inc(tag);
            Etiqueta:= TLabel.Create(PanelEtiquetas);
            Etiqueta.Alignment:= taCenter;
            Etiqueta.Parent:= PanelEtiquetas;
            Etiqueta.AutoSize:= false;
            Etiqueta.Height:= Trunc(AlturaColunas);
            Etiqueta.Width:= Trunc(LarguraColunas);
            Etiqueta.Caption:= InttoStr(Tag);
            Etiqueta.Tag:= Tag;
            Etiqueta.Left:= Esquerda;
            Etiqueta.Top:= topo;
            Etiqueta.Color:= clSilver;
            Etiqueta.Visible:= true;
            Etiqueta.OnClick:= ClickEtiqueta;

            topo:= topo + Etiqueta.Height;
          end;
            topo:= 0;
            Esquerda:= Esquerda + Etiqueta.Width;
      end;

end;

procedure TFrmGera_Etiqueta_Produto_2.ClickEtiqueta(Sender: TObject);
begin
  DesmarcarEtiquetas(TLabel(Sender).Tag);
  EtiquetaSelecionada:= TLabel(Sender).Tag;
end;

procedure TFrmGera_Etiqueta_Produto_2.DesmarcarEtiquetas;
var
  x: integer;
begin
  with PanelEtiquetas do
    begin
      for x := 0 to ControlCount - 1 do
        if Controls[x] is TLabel then
          begin
            if TLabel(Controls[x]).Tag >= EtiquetaInicial then
               TLabel(Controls[x]).Transparent := true
            else
               TLabel(Controls[x]).Transparent := false;
          end;

    end;
end;

procedure TFrmGera_Etiqueta_Produto_2.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Etiqueta_Produto_2:= TFrmRel_Etiqueta_Produto_2.Create(self);
  FrmRel_Etiqueta_Produto_2.Release;
  FrmRel_Etiqueta_Produto_2:= Nil;
end;

procedure TFrmGera_Etiqueta_Produto_2.BBtnLimparClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmGera_Etiqueta_Produto_2);
  BBtnImprimir.Enabled:= false;
  carregou:= false;
  Limpa_Cliente;
end;

procedure TFrmGera_Etiqueta_Produto_2.BBtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFrmGera_Etiqueta_Produto_2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_DELETE) then
  begin
    ClientDataSet1.Delete;
  end;
end;

procedure TFrmGera_Etiqueta_Produto_2.EdtCodigo_EtiquetaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Etiqueta, FrmChama_Etiqueta);
    FrmChama_Etiqueta.ShowModal;
    FrmChama_Etiqueta.Free;
  end;
end;

procedure TFrmGera_Etiqueta_Produto_2.EdtCodigo_EtiquetaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmGera_Etiqueta_Produto_2.EdtCodigo_ProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free;
  end;
end;

procedure TFrmGera_Etiqueta_Produto_2.EdtEtiquetaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmGera_Etiqueta_Produto_2.EdtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmGera_Etiqueta_Produto_2.EdtMarcaExit(Sender: TObject);
begin
  Verifica_Etiqueta_Menor;

  if not ClientDataSet1.Active then
    ClientDataSet1.CreateDataSet;
  ClientDataSet1.Insert;
  ClientDataSet1Codigo_Produto.AsString:= EdtCodigo_Produto.Text;
  ClientDataSet1Descricao.AsString:= EdtDescricao.Text;
  ClientDataSet1Marca.AsString:= EdtMarca.Text;
  ClientDataSet1Quantidade.AsString:= EdtQuantidade.Text;

  ClientDataSet1.SaveToFile('C:\Produtos.xml', dfXMLUTF8);
  Limpa_Menor;
end;

procedure TFrmGera_Etiqueta_Produto_2.EdtMarcaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

procedure TFrmGera_Etiqueta_Produto_2.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmGera_Etiqueta_Produto_2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Limpa_Cliente;
  FrmGera_Etiqueta_Produto_2.Free;
  FrmGera_Etiqueta_Produto_2:= Nil;
end;

procedure TFrmGera_Etiqueta_Produto_2.FormCreate(Sender: TObject);
begin
  PageControl1.TabIndex:= 0;
  Util.Limpa_Campos(FrmGera_Etiqueta_Produto_2);
  ClientDataSet1.Close;
  if FileExists('C:\Produtos.xml') then
    ClientDataSet1.LoadFromFile('C:\Produtos.xml');
end;

procedure TFrmGera_Etiqueta_Produto_2.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmGera_Etiqueta_Produto_2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmGera_Etiqueta_Produto_2.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
    key:=#0; //anula todas as teclas
    SelectNext(ActiveControl, true, true);
  end;
end;

procedure TFrmGera_Etiqueta_Produto_2.Limpa_Cliente;
var
  pasta, data, hora, destino: AnsiString;
begin
  hora:= TimeToStr(Time);
  hora:= StringReplace(hora, ':', '', [rfReplaceAll]);

  data:= DateToStr(Date);
  data:= StringReplace(data, '/', '', [rfReplaceAll]);

  pasta:= ExtractFilePath(Application.ExeName) + 'Etiquetas';
  destino:= pasta + '\Produtos.xml';

  if not (DirectoryExists(pasta)) then
    ForceDirectories(pasta);

  if (FileExists('C:\Produtos.xml')) then
    CopyFile(PWideChar('C:\Produtos.xml'), PWideChar(ExtractFilePath(Application.ExeName) + 'Etiquetas\Produtos'+data+hora+'.xml'), true);
  DeleteFile('C:\Produtos.xml');
  ClientDataSet1.Close;
end;

procedure TFrmGera_Etiqueta_Produto_2.Limpa_Menor;
begin
  EdtCodigo_Produto.Clear;
  EdtDescricao.Clear;
  EdtMarca.Clear;
  EdtQuantidade.Text:= '1';
  EdtCodigo_Produto.SetFocus;
end;

procedure TFrmGera_Etiqueta_Produto_2.Timer1Timer(Sender: TObject);
begin
  StbStatus.Panels[0].Text := TimeToStr (time);
  StbStatus.Panels[1].Text := DateToStr(date);
end;

procedure TFrmGera_Etiqueta_Produto_2.ToolButton1Click(Sender: TObject);
begin
  OpenDialog1.Title:= 'Escolha Arquivo XML';
  OpenDialog1.InitialDir:= ExtractFilePath(Application.ExeName) + 'Etiquetas';
  if OpenDialog1.Execute then
  begin
    ClientDataSet1.LoadFromFile(OpenDialog1.FileName);
    carregou:= true;
  end;
end;

procedure TFrmGera_Etiqueta_Produto_2.Verifica_Etiqueta;
begin
  if (EdtCodigo_Etiqueta.Text = '') then
  begin
    EdtCodigo_Etiqueta.SetFocus;
    Mensagem_Falta_Dados;
    abort;
  end;

  if (ClientDataSet1.IsEmpty) then
  begin
    EdtCodigo_Produto.SetFocus;
    Mensagem_Falta_Dados;
    abort;
  end;

end;

procedure TFrmGera_Etiqueta_Produto_2.Verifica_Etiqueta_Menor;
begin
  if (EdtCodigo_Produto.Text = '') then
  begin
    EdtCodigo_Produto.SetFocus;
    Mensagem_Falta_Dados;
    abort;
  end;

  if (EdtDescricao.Text = '') then
  begin
    EdtDescricao.SetFocus;
    Mensagem_Falta_Dados;
    abort;
  end;

  if (EdtQuantidade.Text = '') then
  begin
    EdtQuantidade.SetFocus;
    Mensagem_Falta_Dados;
    abort;
  end;

end;

end.
