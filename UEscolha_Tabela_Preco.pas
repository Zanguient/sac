unit UEscolha_Tabela_Preco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, ComCtrls, ToolWin, Grids, DBGrids, DB,
  ADODB;

type
  TFrmEscolha_Tabela_Preco = class(TForm)
    TlbFerramentas: TToolBar;
    BBtnOK: TToolButton;
    ImgImagens_Comandos: TImageList;
    BBtnSair: TToolButton;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Data_Cadastro: TDateTimeField;
    ADOQuery1Data_Validade: TDateTimeField;
    ADOQuery1Atalho: TStringField;
    procedure BBtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnOKClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    var
      preview: boolean;
  end;

var
  FrmEscolha_Tabela_Preco: TFrmEscolha_Tabela_Preco;

implementation

uses UDM, UDeclaracao, UGeral;

{$R *.dfm}

procedure TFrmEscolha_Tabela_Preco.BBtnOKClick(Sender: TObject);
begin
  Atualiza_Codigo_Tabela_Padrao(ADOQuery1Codigo.AsInteger);
  FrmEscolha_Tabela_Preco.Close;
end;

procedure TFrmEscolha_Tabela_Preco.BBtnSairClick(Sender: TObject);
begin
  Close;  //FrmEscolha_Tabela_Preco:= Nil;
end;

procedure TFrmEscolha_Tabela_Preco.DBGrid1CellClick(Column: TColumn);
begin
  {with ADOQuery2, sql do
  begin
    close;
    clear;
    add('select ITP.* from Itens_Tabela_Preco ITP');
    add('inner join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
    add('where ITP.Codigo = :Codigo and ITP.Codigo_Produto = :Produto');
    Parameters.ParamByName('Codigo').Value:= ADOQuery1Codigo.AsInteger;
    Parameters.ParamByName('Produto').Value:= StrToInt(FrmPedido_Venda.LblProduto.Caption);
    open;
  end;}
end;

procedure TFrmEscolha_Tabela_Preco.DBGrid1DblClick(Sender: TObject);
begin
  BBtnOKClick(self);
end;

procedure TFrmEscolha_Tabela_Preco.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TFrmEscolha_Tabela_Preco.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_return) then
    BBtnOKClick(self);

  if (key = VK_ESCAPE) then
    close;
end;

procedure TFrmEscolha_Tabela_Preco.FormCreate(Sender: TObject);
begin
  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select TP.* from Tabela_Preco TP');
    add('where TP.Data_Validade >= :Data');
    Parameters.ParamByName('Data').Value:= date;
    open;
  end;
end;

end.
