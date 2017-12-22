unit UTabela_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, Mask;

type
  TFrmTabela_Produto = class(TForm)
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
    Label40: TLabel;
    EdtTabela_Preco: TEdit;
    EdtCodigo_Tabela_Preco: TEdit;
    qryconsulta_produtoPreco_Vista: TFloatField;
    qryconsulta_produtoCodigo_Venda: TStringField;
    qryconsulta_produtoDescricao: TStringField;
    qryconsulta_produtoProducao_Propria: TStringField;
    qryconsulta_produtoArred_Trunc: TStringField;
    qryconsulta_produtoSigla: TStringField;
    qryconsulta_produtoICMS: TStringField;
    qryconsulta_produtoISS: TStringField;
    qryconsulta_produtoCodigo_Situacao: TStringField;
    qryconsulta_produtoOrigem: TStringField;
    qryconsulta_produtoDestino: TStringField;
    qryconsulta_produtoTipo: TIntegerField;
    qryconsulta_produtoCodigo: TAutoIncField;
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
    procedure EdtCodigo_Tabela_PrecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Tabela_PrecoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTabela_PrecoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Tabela_PrecoDblClick(Sender: TObject);

  private
    { Private declarations }
  public
    ativo: boolean;
    tipo: AnsiString;
    { Public declarations }
  end;

var
  FrmTabela_Produto: TFrmTabela_Produto;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UEscolha_Impressao, UChama_Plano_Financeiro, UMenu_Geral, UDeclaracao,
  URel_Tabela_Preco, UChama_Tabela_Preco;

{$R *.dfm}

procedure TFrmTabela_Produto.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmTabela_Produto.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Consulta_Tabela_Produto;
  BBtnFiltrar.Enabled:= false;
  BBtnLimpar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
  BBtnGerar_Arquivo.Enabled:= true;
end;

procedure TFrmTabela_Produto.BBtnGerar_ArquivoClick(Sender: TObject);
var
  loArquivo: TextFile;
  lnLoop   : Integer;
  lcArq    : String;
  registroEAD, NomeArquivo, saliquota, vv, unidade, tipo_trib: Ansistring;
  iGrava: integer;
  preco: AnsiString;
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  setlength( registroEAD, 256 );

  SaveDialog1.InitialDir:= Local_Arquivo(14);
  lcArq := Local_Arquivo(14) + 'Tab. Produtos.txt';

  AssignFile(loArquivo, lcArq);
  Rewrite(loArquivo);
  writeln(loArquivo, 'P1' + StringOfChar('0', 14-Length(cnpj)) + cnpj +
                            insc_estadual + StringOfChar(' ', 14-Length(insc_estadual)) +
                            insc_municipal + StringOfChar(' ', 14-Length(insc_municipal)) +
                            razao_social + StringOfChar(' ', 50-Length(razao_social)));

  qryconsulta_produto.First;
  while not qryconsulta_produto.Eof do
  begin

    unidade:= qryconsulta_produtoSigla.AsString;

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select ITP.Preco_Vista,');
      add('Pro.Codigo, Pro.Tipo, Pro.Codigo_Venda, Pro.Descricao, Pro.Producao_Propria, Pro.Arred_Trunc, ');
      add('UM.Sigla, RI.Aliquota as ICMS, RISS.Aliquota as ISS, CST.Codigo_Situacao, ITI.Origem, ITI.Destino from Produto_Aux Pro');

      add('left join Itens_Tabela_Preco_Aux ITP on (ITP.Codigo_Produto = Pro.Codigo)');
      add('left join Tabela_Preco_Aux TP on (ITP.Codigo = TP.Codigo)');
      add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
      add('left join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
      add('left join Itens_Tratamento_ICMS ITI on (ITI.Codigo = TI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
      add('left join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Codigo)');
      add('left join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');
      add('left join Regra_ISSQN RISS on (Pro.Codigo_Grupo_Tributacao_ISSQN = RISS.Codigo)');
      add('where Pro.Status = :Status and TP.Codigo = :Codigo and Pro.Codigo = :Produto');
      Parameters.ParamByName('Status').Value:= 'ATIVO';
      Parameters.ParamByName('GO1').Value:= uf;
      Parameters.ParamByName('GO2').Value:= uf;
      Parameters.ParamByName('Codigo').Value:= StrToInt(FrmTabela_Produto.EdtCodigo_Tabela_Preco.Text);
      Parameters.ParamByName('Produto').Value:= qryconsulta_produtoCodigo.AsInteger;
      open;
    end;

    if (qryconsulta_produtoCodigo_Venda.AsString <> qAux.FieldByName('Codigo_Venda').AsString) then
      unidade:= '??????';

    if (qryconsulta_produtoDescricao.AsString <> qAux.FieldByName('Descricao').AsString) then
      unidade:= '??????';

    if (qryconsulta_produtoCodigo_Situacao.AsString <> qAux.FieldByName('Codigo_Situacao').AsString) then
      unidade:= '??????';

    if (qryconsulta_produtoICMS.AsString <> qAux.FieldByName('ICMS').AsString) then
      unidade:= '??????';

    if (qryconsulta_produtoPreco_Vista.AsString <> qAux.FieldByName('Preco_Vista').AsString) then
      unidade:= '??????';


    preco:= FormatFloat('0.00', qryconsulta_produtoPreco_Vista.AsFloat);
    preco:= StringReplace(preco, ',','', [rfReplaceAll]);

    {if (qryconsulta_produtoTipo.AsInteger = 0) then
    begin
      if (qryconsulta_produtoTipo_Tributacao.AsString = 'T') then
      begin
        if Length(qryconsulta_produtoICMS.AsString) = 1 then
          sAliquota  := '0' + qryconsulta_produtoICMS.AsString + '00' //0700
        else if Length(qryconsulta_produtoICMS.AsString) = 2 then
          sAliquota  := qryconsulta_produtoICMS.AsString + '00'       //1200
        else if Length(qryconsulta_produtoICMS.AsString) = 3 then
          sAliquota  := '0'+qryconsulta_produtoICMS.AsString + '0'       //0840
        else if Length(qryconsulta_produtoICMS.AsString) = 4 then
          sAliquota  := qryconsulta_produtoICMS.AsString + '0'       //1320
      end
      else
        saliquota:= '0';
    end
    else if (qryconsulta_produtoTipo.AsInteger = 1) then
    begin
      if (qryconsulta_produtoTipo_Tributacao.AsString = 'S') then
      begin
        if Length(qryconsulta_produtoISS.AsString) = 1 then
          sAliquota  := '0' + qryconsulta_produtoISS.AsString + '00' //0700
        else if Length(qryconsulta_produtoISS.AsString) = 2 then
          sAliquota  := qryconsulta_produtoISS.AsString + '00'       //1200
        else if Length(qryconsulta_produtoISS.AsString) = 3 then
          sAliquota  := '0'+qryconsulta_produtoISS.AsString + '0'       //0840
        else if Length(qryconsulta_produtoISS.AsString) = 4 then
          sAliquota  := qryconsulta_produtoISS.AsString + '0'       //1320
      end
      else
        sAliquota:= '0';
    end
    else
      sAliquota:= '0000';}

      if (qryconsulta_produtoICMS.AsString <> 'I') or (qryconsulta_produtoICMS.AsString <> 'I1') or
         (qryconsulta_produtoICMS.AsString <> 'N') or (qryconsulta_produtoICMS.AsString <> 'N1') or
         (qryconsulta_produtoICMS.AsString <> 'F') or (qryconsulta_produtoICMS.AsString <> 'F1') then
      begin
        if Length(qryconsulta_produtoICMS.AsString) = 1 then
          sAliquota  := '0' + qryconsulta_produtoICMS.AsString + '00' //0700
        else if Length(qryconsulta_produtoICMS.AsString) = 2 then
          sAliquota  := qryconsulta_produtoICMS.AsString + '00'       //1200
        else if Length(qryconsulta_produtoICMS.AsString) = 3 then
          sAliquota  := '0'+qryconsulta_produtoICMS.AsString + '0'       //0840
        else if Length(qryconsulta_produtoICMS.AsString) = 4 then
          sAliquota  := qryconsulta_produtoICMS.AsString + '0';       //1320

        tipo_trib:= 'T';
      end
      else
      begin
        sAliquota:= '0000';

        if (qryconsulta_produtoICMS.AsString = 'I') or (qryconsulta_produtoICMS.AsString = 'I1') then
          tipo_trib:= 'I'
        else if (qryconsulta_produtoICMS.AsString = 'N') or (qryconsulta_produtoICMS.AsString = 'N1') then
          tipo_trib:= 'N'
        else if (qryconsulta_produtoICMS.AsString = 'F') or (qryconsulta_produtoICMS.AsString = 'F1') then
          tipo_trib:= 'F';
      end;

    sAliquota:= StringReplace(sAliquota, ',','', [rfReplaceAll]);

    writeln(loArquivo, 'P2' + StringOfChar('0', 14-Length(cnpj)) + cnpj +
                              qryconsulta_produtoCodigo_Venda.AsString + StringOfChar(' ', 14-Length(qryconsulta_produtoCodigo_Venda.AsString)) +
                              qryconsulta_produtoDescricao.AsString + StringOfChar(' ', 50-Length(qryconsulta_produtoDescricao.AsString)) +
                              unidade + StringOfChar(' ', 6-Length(unidade)) +
                              qryconsulta_produtoArred_Trunc.AsString + StringOfChar(' ', 1-Length(qryconsulta_produtoArred_Trunc.AsString)) +
                              qryconsulta_produtoProducao_Propria.AsString + StringOfChar(' ', 1-Length(qryconsulta_produtoProducao_Propria.AsString)) +
                              tipo_trib + StringOfChar(' ', 1-Length(tipo_trib)) +
                              StringOfChar('0', 4-Length(saliquota)) + saliquota +
                              StringOfChar('0', 12-Length(preco)) + preco);
    qryconsulta_produto.Next;
  end;
  writeln(loArquivo, 'P9' + StringOfChar('0', 14-Length(cnpj)) + cnpj +
                            insc_estadual + StringOfChar(' ', 14-Length(insc_estadual)) +
                            StringOfChar('0', 6-Length(EdtTotal.Text)) + EdtTotal.Text);
  //write(loArquivo);
  CloseFile(loArquivo);
  
  NomeArquivo:= lcArq;
  generateEAD(NomeArquivo, cChavePublica, cChavePrivada, registroEAD, 1);
  Arquivo_Gerado(lcArq);
  UDeclaracao.Insere_Historico(usuario, 'GEROU ARQUIVO ELETRÔNICO DA TABELA DE PREÇO ' + EdtTabela_Preco.Text + '.', TimeToStr(time), consu, date);
end;

procedure TFrmTabela_Produto.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Tabela_Preco:= TFrmRel_Tabela_Preco.Create(self);
  FrmRel_Tabela_Preco.Release;
  FrmRel_Tabela_Preco:= Nil;
end;

procedure TFrmTabela_Produto.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta_produto.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  BBtnGerar_Arquivo.Enabled:= false;
  EdtCodigo_Tabela_Preco.SetFocus;
end;

procedure TFrmTabela_Produto.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmTabela_Produto.EdtCodigo_Tabela_PrecoDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Tabela_Preco, FrmChama_Tabela_Preco);
  FrmChama_Tabela_Preco.ShowModal;
  FrmChama_Tabela_Preco.Free;
end;

procedure TFrmTabela_Produto.EdtCodigo_Tabela_PrecoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Tabela_Preco, FrmChama_Tabela_Preco);
    FrmChama_Tabela_Preco.ShowModal;
    FrmChama_Tabela_Preco.Free;
  end;
end;

procedure TFrmTabela_Produto.EdtCodigo_Tabela_PrecoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTabela_Produto.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Consulta_Tabela_Produto;
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir.Enabled:= true;
    BBtnGerar_Arquivo.Enabled:= true;
  end;
end;

procedure TFrmTabela_Produto.EdtTabela_PrecoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmTabela_Produto.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmTabela_Produto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmTabela_Produto.Free;
  FrmTabela_Produto:= NIl;
end;

procedure TFrmTabela_Produto.FormCreate(Sender: TObject);
begin
  qryconsulta_produto.close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  EdtCodigo_Tabela_Preco.Clear;
end;

procedure TFrmTabela_Produto.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmTabela_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
