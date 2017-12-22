unit UMovimentacao_Saida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, ComCtrls, ToolWin, ImgList, Grids,
  DBGrids, DB, ADODB, UConsulta;

type
  TFrmMovimentacao_Saida = class(TForm)
    Label7: TLabel;
    Label8: TLabel;
    MEdtData_Final: TMaskEdit;
    MEdtData_Inicial: TMaskEdit;
    DBGrid1: TDBGrid;
    ImgImagens: TImageList;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnLimpar: TToolButton;
    BBtnImprimir: TToolButton;
    BBtnFechar: TToolButton;
    BBtnGerar_Arquivo: TToolButton;
    qryconsulta: TADOQuery;
    DataSource1: TDataSource;
    qryconsultaCodigo: TAutoIncField;
    qryconsultaCodigo_Operador: TIntegerField;
    qryconsultaCodigo_Loja: TIntegerField;
    qryconsultaData: TDateTimeField;
    qryconsultaTotal_Venda: TFloatField;
    qryconsultaTipo_Desconto: TStringField;
    qryconsultaDesconto: TFloatField;
    qryconsultaTotal_Geral: TFloatField;
    qryconsultaValor_Recebido: TFloatField;
    qryconsultaTroco: TFloatField;
    qryconsultaNome: TStringField;
    SaveDialog1: TSaveDialog;
    Panel1: TPanel;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    qryitens_venda: TADOQuery;
    DataSource2: TDataSource;
    qryitens_vendaCodigo: TIntegerField;
    qryitens_vendaCodigo_Produto: TIntegerField;
    qryitens_vendaQuantidade: TIntegerField;
    qryitens_vendaTipo_Desconto: TStringField;
    qryitens_vendaDesconto: TFloatField;
    qryitens_vendaSub_Total: TFloatField;
    qryitens_vendaCodigo_Venda: TStringField;
    qryitens_vendaDescricao: TStringField;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnFecharClick(Sender: TObject);
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnLimparClick(Sender: TObject);
    procedure BBtnGerar_ArquivoClick(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure GeraChave;
    procedure DBGrid1CellClick(Column: TColumn);
  private
    Consulta: TConsulta;
    lnImp          : integer;
    cChavePublica  : string;
    cChavePrivada  : string;
    chave_pu       : string;
    chave_pri      : string;
    cArquivoOrigem : String;
    cArquivoDestino: String;
    cDataInicial   : String;
    cDataFinal     : String;
    cTipo          : String;
    cUsuario       : String;
    razaosocial    : String;
    endereco       : String;
    cmd            : String;
    iTipoGeracao   : integer;
    iUnicoArquivo  : integer;
    { Private declarations }
  public
    var
      ativo: boolean;

    { Public declarations }
  end;

var
  FrmMovimentacao_Saida: TFrmMovimentacao_Saida;

implementation

uses UDM, UEscolha_Impressao, UDeclaracao;

{$R *.dfm}

procedure TFrmMovimentacao_Saida.BBtnFecharClick(
  Sender: TObject);
begin
  close;
end;

procedure TFrmMovimentacao_Saida.BBtnFiltrarClick(Sender: TObject);
begin
  if (MEdtData_Inicial.Text = '  /  /    ') or (MEdtData_Final.Text = '  /  /    ') then
  begin
    Application.MessageBox('Por favor, informe um período a consultar', 'Atenção', MB_OK+MB_ICONHAND);
    abort
  end
  else
  begin
    Consulta.Consulta_Movimento_Saida();
    BBtnFiltrar.Enabled:= false;
    BBtnLimpar.Enabled:= true;
    BBtnImprimir.Enabled:= true;
    BBtnGerar_Arquivo.Enabled:= true;
  end;
end;

procedure TFrmMovimentacao_Saida.BBtnGerar_ArquivoClick(Sender: TObject);
var
  loArquivo: TextFile;
  lnLoop   : Integer;
  lcArq    : String;
  lcSep    : String;
  loMemo   : TStringList;
  registroEAD, NomeArquivo: string;
  iGrava: integer;
begin
  setlength( registroEAD, 256 );
  SaveDialog1.Execute();
  lcArq := SaveDialog1.FileName + '.txt';

  AssignFile(loArquivo, lcArq);
  Rewrite(loArquivo);
  writeln(loArquivo, 'MOVIMENTAÇÃO DE SAÍDA');
  writeln(loArquivo, StringOfChar('-', 50));
  writeln(loArquivo);
  
  Writeln(loArquivo, StringOfChar(' ', 3) + 'Operador' + StringOfChar(' ', 30-Length('Operador')) + 'Loja' + StringOfChar(' ', 5-Length('Loja')) + 'Data' + StringOfChar(' ', 20-Length('Data')) + 'Total Venda' +
         StringOfChar(' ', 12-Length('Total Venda')) + 'T' + StringOfChar(' ', 2-Length('T')) + 'Desconto' + StringOfChar(' ', 10-Length('Desconto')) + 'Total Geral' + StringOfChar(' ', 12-Length('Total Geral')) +
         'Valor Rec.' + StringOfChar(' ', 11-Length('Valor Rec.')) + 'Troco');
  writeln(loArquivo);
  for lnLoop := 1 to qryconsulta.RecordCount do
  begin
     Writeln(loArquivo, IntToStr(lnLoop) + '. ' + qryconsultaNome.AsString + StringOfChar(' ', 30-Length(qryconsultaNome.AsString)) + qryconsultaCodigo_Loja.AsString + StringOfChar(' ', 5-Length(qryconsultaCodigo_Loja.AsString)) + qryconsultaData.AsString +
             StringOfChar(' ', 20-Length(qryconsultaData.AsString)) + FormatFloat('#0.0,0',qryconsultaTotal_Venda.AsFloat) + StringOfChar(' ', 9-Length(qryconsultaTotal_Venda.AsString)) + qryconsultaTipo_Desconto.AsString + StringOfChar(' ', 2-Length('1')) +
             FormatFloat('#0.0,0',qryconsultaDesconto.AsFloat) + StringOfChar(' ', 7-Length(qryconsultaDesconto.AsString)) + FormatFloat('#0.0,0', qryconsultaTotal_Geral.AsFloat) + StringOfChar(' ', 9-Length(qryconsultaTotal_Geral.AsString)) + FormatFloat('#0.0,0',qryconsultaValor_Recebido.AsFloat) +
             StringOfChar(' ', 9-Length(qryconsultaValor_Recebido.AsString)) + FormatFloat('#0.0,0',qryconsultaTroco.AsFloat));
     qryconsulta.Next;
  end;
  Write(loArquivo);
  CloseFile(loArquivo);

  //GeraChave;
  //NomeArquivo:= lcArq;
  //loImpressora.generateEAD(NomeArquivo, cChavePublica, cChavePublica, registroEAD, 1);
end;

procedure TFrmMovimentacao_Saida.GeraChave;
begin
  try
    setlength( cChavePublica, 256 );
    setlength( cChavePrivada, 256 );

    genkkey( cChavePublica, cChavePrivada );
    if ( iRetorno = 0 ) then
      application.MessageBox( 'Erro de execução!', 'ERRO', MB_ICONINFORMATION + MB_OK );
  except
    on E: Exception do
      ShowMessage('Erro: ' + E.Message + 'Unidade: ' + Self.Name + ' Rotina: GeraChave');
  end;
end;

procedure TFrmMovimentacao_Saida.BBtnImprimirClick(Sender: TObject);
var
  indice, descricao: string;
begin
  {indice:= '2';
  descricao:= 'Movimentação de Saida';
  loImpressora.NomeiaRelatorioGerencialMFD(indice, descricao);
  while not qryconsulta.Eof do
  begin
    loImpressora.RelatorioGerencial(qryconsultaNome.AsString + ' ' + qryconsultaCodigo_Loja.AsString + ' ' + qryconsultaData.AsString
             + ' ' + qryconsultaTotal_Venda.AsString + ' ' + qryconsultaTipo_Desconto.AsString + ' ' + qryconsultaDesconto.AsString
             + ' ' + qryconsultaTotal_Geral.AsString + ' ' + qryconsultaValor_Recebido.AsString + ' ' + qryconsultaTroco.AsString);
    qryconsulta.Next;
  end;
  loImpressora.FechaRelatorioGerencial; }
  {Application.CreateForm(TFrmEscolha_Impressao, FrmEscolha_Impressao);
  FrmEscolha_Impressao.Show;
  ativo:= true;}
end;

procedure TFrmMovimentacao_Saida.BBtnLimparClick(Sender: TObject);
begin
  qryconsulta.Close;
  BBtnFiltrar.Enabled:= true;
  BBtnLimpar.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  BBtnGerar_Arquivo.Enabled:= false;
end;

procedure TFrmMovimentacao_Saida.DBGrid1CellClick(Column: TColumn);
begin
  if not (qryconsulta.IsEmpty) then
  begin
    with qryitens_venda, sql do
    begin
      close;
      clear;
      add('select IVE.*, Pro.Codigo_Venda, Pro.Descricao from Itens_Venda_ECF IVE');
      add('inner join Venda_ECF VE on (IVE.Codigo = VE.Codigo)');
      add('left join Produto Pro on (IVE.Codigo_Produto = Pro.Codigo)');
      add('where VE.Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value:= qryconsultaCodigo.AsString;
      open;
    end;
  end;
end;

procedure TFrmMovimentacao_Saida.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmMovimentacao_Saida.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmMovimentacao_Saida.Free;
  FrmMovimentacao_Saida:= Nil;
end;

procedure TFrmMovimentacao_Saida.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmMovimentacao_Saida.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

procedure TFrmMovimentacao_Saida.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
