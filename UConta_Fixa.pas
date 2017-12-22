unit UConta_Fixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls;

type
  TFrmConta_Fixa = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ImgImagens_Comandos: TImageList;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    BBtnPesquisar: TToolButton;
    LblMarca: TLabel;
    EdtDescricao: TEdit;
    RGTipo: TRadioGroup;
    Label6: TLabel;
    EdtPlano: TEdit;
    EdtCodigo_Plano: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    MEdtData_Lancamento: TMaskEdit;
    EdtValor: TEdit;
    LblObservacoes: TLabel;
    MmoObservacoes: TMemo;
    Label1: TLabel;
    EdtDia: TEdit;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtCodigo_PlanoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MEdtData_LancamentoEnter(Sender: TObject);
    procedure EdtValorExit(Sender: TObject);
    procedure MEdtData_LancamentoExit(Sender: TObject);
    procedure MmoObservacoesKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_PlanoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPlanoKeyPress(Sender: TObject; var Key: Char);
  private
    Conta_Fixa: URegistro.TConta_Fixa;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmConta_Fixa: TFrmConta_Fixa;
implementation

uses UDM, UChama_Plano_Financeiro, UChama_Conta_Fixa, UDeclaracao;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmConta_Fixa.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmConta_Fixa);
  Util.Desabilita_Campos(FrmConta_Fixa);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmConta_Fixa.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  BEGIN
    Conta_Fixa.Excluir(Conta_Fixa);
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU CONTA FIXA ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmConta_Fixa);
  END;
end;

procedure TFrmConta_Fixa.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConta_Fixa.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Conta_Fixa.Inserir(Conta_Fixa);
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU CONTA FIXA ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Conta_Fixa.Alterar(Conta_Fixa);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU CONTA FIXA ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmConta_Fixa);
end;

function TFrmConta_Fixa.Confira: boolean;
begin
    Confira:= false;
    if EdtDescricao.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtDescricao.SetFocus;
        abort;
      end;

    if (EdtValor.Text = '') or (EdtValor.Text = '0,00') or (EdtValor.Text = '0') then
      begin
        Mensagem_Falta_Dados;
        EdtValor.SetFocus;
        abort;
      end;

    if EdtDia.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtDia.SetFocus;
        abort;
      end;

      Confira:= true;
end;

procedure TFrmConta_Fixa.EdtCodigo_PlanoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Plano_Financeiro, FrmChama_Plano_Financeiro);
      FrmChama_Plano_Financeiro.ShowModal;
      FrmChama_Plano_Financeiro.Free;
    end;
end;

procedure TFrmConta_Fixa.EdtCodigo_PlanoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConta_Fixa.EdtPlanoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConta_Fixa.EdtValorExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtValor, StrToFloat(EdtValor.Text));
end;

procedure TFrmConta_Fixa.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConta_Fixa.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmConta_Fixa.Free;
        FrmConta_Fixa:= Nil;
      end;
end;

procedure TFrmConta_Fixa.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmConta_Fixa);
  Util.Limpa_Campos(FrmConta_Fixa);
  Util.Desabilita_Campos(FrmConta_Fixa);
  EdtValor.Text:= '0,00';
end;

procedure TFrmConta_Fixa.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConta_Fixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmConta_Fixa);
      Util.Limpa_Campos(FrmConta_Fixa);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      MEdtData_Lancamento.SetFocus;
      EdtValor.Text:= '0,00';
      RGTipo.ItemIndex:= 0;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmConta_Fixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmConta_Fixa.MEdtData_LancamentoEnter(Sender: TObject);
begin
  MEdtData_Lancamento.Text:= DateToStr(date);
end;

procedure TFrmConta_Fixa.MEdtData_LancamentoExit(Sender: TObject);
begin
  if (MEdtData_Lancamento.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Lancamento);
end;

procedure TFrmConta_Fixa.MmoObservacoesKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];
end;

procedure TFrmConta_Fixa.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Conta_Fixa, FrmChama_Conta_Fixa);
  FrmChama_Conta_Fixa.ShowModal;
  FrmChama_Conta_Fixa.Release;
end;

end.
