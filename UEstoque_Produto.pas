unit UEstoque_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, Mask;

type
  TFrmEstoque_Produto = class(TForm)
    DBGrid1: TDBGrid;
    RGOrdena_Por: TRadioGroup;
    ImgImagens: TImageList;
    qryconsulta_produto: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    BBtnFechar: TToolButton;
    BBtnGerar_Arquivo: TToolButton;
    SaveDialog1: TSaveDialog;
    Label1: TLabel;
    EdtTotal: TEdit;
    qryconsulta_produtoCodigo: TAutoIncField;
    qryconsulta_produtoTipo: TIntegerField;
    qryconsulta_produtoCodigo_Empresa: TIntegerField;
    qryconsulta_produtoStatus: TStringField;
    qryconsulta_produtoGera_Comissao: TStringField;
    qryconsulta_produtoAceita_Devolucao: TStringField;
    qryconsulta_produtoProducao_Propria: TStringField;
    qryconsulta_produtoArred_Trunc: TStringField;
    qryconsulta_produtoCodigo_Original: TStringField;
    qryconsulta_produtoCodigo_Venda: TStringField;
    qryconsulta_produtoDescricao: TStringField;
    qryconsulta_produtoCodigo_Barra: TStringField;
    qryconsulta_produtoCodigo_Fornecedor: TIntegerField;
    qryconsulta_produtoCodigo_Fabricante: TIntegerField;
    qryconsulta_produtoCodigo_Marca: TIntegerField;
    qryconsulta_produtoCodigo_Unidade_Medida: TIntegerField;
    qryconsulta_produtoCodigo_Unidade_Volume: TIntegerField;
    qryconsulta_produtoCodigo_Grupo: TIntegerField;
    qryconsulta_produtoCodigo_Grupo_Tributacao: TIntegerField;
    qryconsulta_produtoCodigo_Grupo_Tributacao_IPI: TIntegerField;
    qryconsulta_produtoCodigo_Grupo_Tributacao_PIS: TIntegerField;
    qryconsulta_produtoCodigo_Grupo_Tributacao_COFINS: TIntegerField;
    qryconsulta_produtoCodigo_Grupo_Tributacao_ISSQN: TIntegerField;
    qryconsulta_produtoCodigo_Local: TIntegerField;
    qryconsulta_produtoData_Fabricacao: TDateTimeField;
    qryconsulta_produtoData_Validade: TDateTimeField;
    qryconsulta_produtoUltima_Compra: TDateTimeField;
    qryconsulta_produtoUltima_Venda: TDateTimeField;
    qryconsulta_produtoValor_Compra: TFloatField;
    qryconsulta_produtoValor_Medio: TFloatField;
    qryconsulta_produtoValor_Ultima_Compra: TFloatField;
    qryconsulta_produtoEstoque_Maximo: TFloatField;
    qryconsulta_produtoEstoque_Minimo: TFloatField;
    qryconsulta_produtoEstoque: TFloatField;
    qryconsulta_produtoVolume: TFloatField;
    qryconsulta_produtoVolume_Total: TFloatField;
    qryconsulta_produtoEm_Estoque_Maximo: TStringField;
    qryconsulta_produtoEm_Estoque_Minimo: TStringField;
    qryconsulta_produtoData_Cadastro: TDateTimeField;
    qryconsulta_produtoData_Atualizacao_Estoque: TDateTimeField;
    qryconsulta_produtoStatus_Estoque_Data: TStringField;
    qryconsulta_produtoNome_Fantasia: TStringField;
    qryconsulta_produtoSigla: TStringField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure BBtnGerar_ArquivoClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private
    qProd: TADOQuery;

    procedure Pega_Produto_Unidade(Codigo_Venda, Descricao: AnsiString);
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmEstoque_Produto: TFrmEstoque_Produto;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UEscolha_Impressao, UMenu_Geral, UDeclaracao, URel_Estoque_Produto;

{$R *.dfm}

procedure TFrmEstoque_Produto.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmEstoque_Produto.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Consulta_Estoque_Produto;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
  BBtnGerar_Arquivo.Enabled:= true;
end;

procedure TFrmEstoque_Produto.BBtnGerar_ArquivoClick(Sender: TObject);
var
  loArquivo: TextFile;
  lnLoop   : Integer;
  lcArq    : String;
  registroEAD, NomeArquivo: Ansistring;
  iGrava: integer;
  data, estoque, unidade: string;
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  setlength( registroEAD, 256 );
  SaveDialog1.InitialDir:= Local_Arquivo(14);
  //SaveDialog1.Execute();
  lcArq := Local_Arquivo(14) + 'Estoque.txt';

  AssignFile(loArquivo, lcArq);
  Rewrite(loArquivo);
  writeln(loArquivo, 'E1' + StringOfChar('0', 14-Length(cnpj)) + cnpj +
                            insc_estadual + StringOfChar(' ', 14-Length(insc_estadual)) +
                            insc_municipal + StringOfChar(' ', 14-Length(insc_municipal)) +
                            razao_social + StringOfChar(' ', 50-Length(razao_social)));
  qryconsulta_produto.First;
  while not qryconsulta_produto.Eof do
  begin

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select P_Aux.Codigo, P_Aux.Codigo_Venda, P_Aux.Descricao, P_Aux.Estoque, P_Aux.Data_Atualizacao_Estoque');
      add('from Produto_Aux P_Aux where P_Aux.Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= qryconsulta_produtoCodigo.AsInteger;
      open;
    end;

    unidade:= qryconsulta_produtoSigla.AsString;

    if (qryconsulta_produtoCodigo_Venda.AsString <> qAux.FieldByName('Codigo_Venda').AsString) then
      unidade:= '??????';

    if (qryconsulta_produtoDescricao.AsString <> qAux.FieldByName('Descricao').AsString) then
      unidade:= '??????';

    if (qryconsulta_produtoEstoque.AsString <> qAux.FieldByName('Estoque').AsString) then
      unidade:= '??????';

    if (qryconsulta_produtoData_Atualizacao_Estoque.AsString <> qAux.FieldByName('Data_Atualizacao_Estoque').AsString) then
      unidade:= '??????';

    data:= FormatDateTime('YYYYMMDD', qryconsulta_produtoData_Atualizacao_Estoque.AsDateTime);
    estoque:= StringReplace(qryconsulta_produtoEstoque.AsString, '-', '', [rfReplaceAll]);
    estoque:= FormatFloat('#0.0,0', StrToFloat(estoque));
    estoque:= StringReplace(estoque, ',','', [rfReplaceAll]);

    writeln(loArquivo, 'E2' + StringOfChar('0', 14-Length(cnpj)) + cnpj +
            qryconsulta_produtoCodigo_Venda.AsString + StringOfChar(' ', 14-Length(qryconsulta_produtoCodigo_Venda.AsString)) +
            qryconsulta_produtoDescricao.AsString + StringOfChar(' ', 50-Length(qryconsulta_produtoDescricao.AsString)) +
            unidade + StringOfChar(' ', 6-Length(unidade)) +
            qryconsulta_produtoStatus_Estoque_Data.AsString + StringOfChar(' ', 1-Length(qryconsulta_produtoStatus_Estoque_Data.AsString)) +
            StringOfChar('0', 9-Length(estoque)) + estoque +
            data + StringOfChar(' ', 8-Length(data)));
    qryconsulta_produto.Next;
  end;
  writeln(loArquivo, 'E9' + StringOfChar('0', 14-Length(cnpj)) + cnpj +
                            insc_estadual + StringOfChar(' ', 14-Length(insc_estadual)) +
                            StringOfChar('0', 6-Length(EdtTotal.Text)) + EdtTotal.Text);
  //write(loArquivo);
  CloseFile(loArquivo);
  
  NomeArquivo:= lcArq;
  generateEAD(NomeArquivo, cChavePublica, cChavePrivada, registroEAD, 1);
  Arquivo_Gerado(lcArq);
  UDeclaracao.Insere_Historico(usuario, 'GEROU ARQUIVO ELETRÔNICO DE ESTOQUE.', TimeToStr(time), consu, date);
end;

procedure TFrmEstoque_Produto.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Estoque_Produto:= TFrmRel_Estoque_Produto.Create(self);
  FrmRel_Estoque_Produto.Release;
  FrmRel_Estoque_Produto:= Nil;
end;

procedure TFrmEstoque_Produto.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_produto.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  BBtnGerar_Arquivo.Enabled:= false;
end;

procedure TFrmEstoque_Produto.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State)
end;

procedure TFrmEstoque_Produto.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Consulta_Estoque_Produto;
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir.Enabled:= true;
    BBtnGerar_Arquivo.Enabled:= true;
  end;
end;

procedure TFrmEstoque_Produto.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmEstoque_Produto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmEstoque_Produto.Free;
  FrmEstoque_Produto:= NIl;
end;

procedure TFrmEstoque_Produto.FormCreate(Sender: TObject);
begin
  qryconsulta_produto.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
end;

procedure TFrmEstoque_Produto.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmEstoque_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmEstoque_Produto.Pega_Produto_Unidade(Codigo_Venda, Descricao: AnsiString);
begin
  qProd:= TADOQuery.Create(self);
  try
    with qProd, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select P.Codigo, P.Codigo_Venda, P.Descricao, UM.Sigla from Produto P');
      add('inner join Unidade_Medida UM on (P.Codigo_Unidade)');
      add('where P.Codigo_Venda = :Codigo_Venda and P.Descricao = :Descricao');
      Parameters.ParamByName('Codigo_Venda').Value:= Codigo_Venda;
      Parameters.ParamByName('Descricao').Value:= Descricao;
      open;
    end;
  finally

  end;
end;

end.
