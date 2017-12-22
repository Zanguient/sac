unit UTabela_Indice_Tecnico_Producao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ADODB, Mask, ComCtrls, ToolWin, ImgList;

type
  TFrmTabela_Indice_Tecnico_Producao = class(TForm)
    SaveDialog1: TSaveDialog;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    LblNome: TLabel;
    LblProd: TLabel;
    EdtCodigo_Produto: TEdit;
    EdtProduto: TEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnFecharClick(Sender: TObject);
    procedure EdtCodigo_ProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnSalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    sArquivo: TextFile;
    Caix: AnsiString;
    function Valida: boolean;
    { Private declarations }
  public
    ativo: boolean;
    { Public declarations }
  end;

var
  FrmTabela_Indice_Tecnico_Producao: TFrmTabela_Indice_Tecnico_Producao;

implementation

uses UDeclaracao, UMenu_Geral, UDM, UGeral, UChama_Produto;

{$R *.dfm}

procedure TFrmTabela_Indice_Tecnico_Producao.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmTabela_Indice_Tecnico_Producao.BBtnSalvarClick(Sender: TObject);
var
  qAux: TADOQuery;
  sArquivo: TextFile;
  Nome_Arquivo, Prod, Prod2: AnsiString;
begin
  qAux:= TADOQuery.Create(self);
  try
    setlength( registroEAD, 256 );
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select R.*, IR.*, P.Codigo_Venda, P.Descricao, P2.Codigo_Venda as Codigo_Venda2, P2.Descricao as Descricao2 from Receita R');
      add('left join Itens_Receita IR on (R.Codigo = IR.Codigo)');
      add('left join Produto P on (R.Codigo_Produto = P.Codigo)');
      add('left join Produto P2 on (IR.Codigo_Insumo = P2.Codigo)');
      add('where R.Codigo_Produto = :Produto');
      Parameters.ParamByName('Produto').Value:= StrToInt(LblProd.Caption);
      open;
    end;

    if (qAux.IsEmpty = false) then
    begin
      Nome_Arquivo:= Local_Arquivo(14) + 'Tabela de Índice Técnico de Produção.txt';
      AssignFile(sArquivo, Nome_Arquivo);
      Rewrite(sArquivo);
      Writeln(sArquivo, 'Produto Produzido: ' + qAux.FieldByName('Codigo_Venda').AsString + ' - ' + qAux.FieldByName('Descricao').AsString);
      Writeln(sArquivo, '--------------------------------');
      Writeln(sArquivo, 'Insumos                                                                      ' + 'Un.  ' + 'Qtde      ');
      Writeln(sArquivo);
      while not qAux.Eof do
      begin
        Prod2:= qAux.FieldByName('Codigo_Venda2').AsString + ' - ' + qAux.FieldByName('Descricao2').AsString;
        Prod:= Prod2 + StringOfChar(' ', 77-Length(Prod2));
        Writeln(sArquivo, Prod, qAux.FieldByName('Unidade').AsString+'   ', FormatFloat('#0.0,0',qAux.FieldByName('Qtde').AsFloat));
        qAux.Next;
      end;
      Writeln(sArquivo, '--------------------------------');
      Write(sArquivo);
      CloseFile(sArquivo);
      Sleep(1000);
      generateEAD(Nome_Arquivo, cChavePublica, cChavePrivada, registroEAD, 1);
      Arquivo_Gerado(Nome_Arquivo);
      UDeclaracao.Insere_Historico(usuario, 'GEROU ARQUIVO ELETRÔNICO DE TABELA DE ÍNDICE TÉCNICO DE PRODUÇÃO.', TimeToStr(time), consu, date);
    end
    else
      Mensagem_Nao_E_PP;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmTabela_Indice_Tecnico_Producao.EdtCodigo_ProdutoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free;
  end;
end;

procedure TFrmTabela_Indice_Tecnico_Producao.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmTabela_Indice_Tecnico_Producao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmTabela_Indice_Tecnico_Producao.Free;
  FrmTabela_Indice_Tecnico_Producao:= Nil;
end;

procedure TFrmTabela_Indice_Tecnico_Producao.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmTabela_Indice_Tecnico_Producao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;

  if (key = vk_f2) then
  begin
    BBtnSalvar.Enabled:= true;
  end;

end;

function TFrmTabela_Indice_Tecnico_Producao.Valida: boolean;
begin
  Result:= false;
  if (EdtProduto.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    abort;
  end;
  Result:= true;
end;

procedure TFrmTabela_Indice_Tecnico_Producao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

end.
