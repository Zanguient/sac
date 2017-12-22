unit UEscolha_Impressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, ComCtrls, ToolWin;

type
  TFrmEscolha_Impressao = class(TForm)
    RGTipo: TRadioGroup;
    TlbFerramentas: TToolBar;
    BBtnOK: TToolButton;
    ImgImagens_Comandos: TImageList;
    BBtnSair: TToolButton;
    procedure BBtnSairClick(Sender: TObject);
    procedure imprime(pForm: TForm);
    procedure visualiza_impressao(pForm: TForm);
  private
    { Private declarations }
  public
    { Public declarations }
    var
      preview: boolean;
  end;

var
  FrmEscolha_Impressao: TFrmEscolha_Impressao;

implementation

uses UChama_Lancamentos_Financeiros, URel_Lancamento_Contas,
  UConciliacao_Bancaria, URel_Conciliacao_Bancaria,
  URel_Lancamento_Contas_Agrupado, UConsulta_Cheque, URel_Consulta_Cheque,
  URel_Consulta_Lancamento_Banco, UConsulta_Lancamento_Banco,
  UConsulta_Saldo_Bancario, URel_Consulta_Saldo_Bancario, UTabela_Produto,
  URel_Tabela_Preco, URel_Movimentacao_Saida, UMovimentacao_Saida,
  UEstoque_Produto, URel_Estoque_Produto;

{$R *.dfm}

procedure TFrmEscolha_Impressao.BBtnSairClick(Sender: TObject);
begin
  FrmEscolha_Impressao.Free;
  FrmEscolha_Impressao:= Nil;
end;

procedure TFrmEscolha_Impressao.imprime(pForm: TForm);
begin
  pForm:= TForm.Create(self);
  pForm.Print;
  pForm.Release;
  pForm:= Nil;
end;

procedure TFrmEscolha_Impressao.visualiza_impressao(pForm: TForm);
begin
  pForm:= FrmConsulta_Lancamento_Banco;
  pForm:= pForm.Create(self);
  pForm.Release;
  pForm:= Nil;
end;

end.
