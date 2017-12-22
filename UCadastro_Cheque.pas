unit UCadastro_Cheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls;

type
  TFrmCadastro_Cheque = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    MEdtData_Cadastro: TMaskEdit;
    LblData_Cadastro: TLabel;
    LblMarca: TLabel;
    EdtEmitente: TEdit;
    BBtnPesquisar: TToolButton;
    RadioGroup1: TRadioGroup;
    LblN_Banco: TLabel;
    LblAgencia: TLabel;
    EdtCodigo_Banco: TEdit;
    EdtAgencia: TEdit;
    EdtBanco: TEdit;
    LblN_Cheque: TLabel;
    LblData_Vencimento: TLabel;
    LblValor: TLabel;
    LblData_Saida: TLabel;
    EdtN_Cheque: TEdit;
    MEdtData_Vencimento: TMaskEdit;
    EdtValor: TEdit;
    MEdtData_Saida: TMaskEdit;
    Label1: TLabel;
    EdtTitular: TEdit;
    Label47: TLabel;
    MmoObservacoes: TMemo;
    Label2: TLabel;
    EdtFavorecido: TEdit;
    Panel2: TPanel;
    Label3: TLabel;
    EdtOrigem: TEdit;
    BBtnNovo: TToolButton;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtData_CadastroEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure EdtCodigo_BancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtValorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValorExit(Sender: TObject);
    procedure MEdtData_VencimentoExit(Sender: TObject);
    procedure MEdtData_SaidaExit(Sender: TObject);
    procedure EdtAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure MmoObservacoesKeyPress(Sender: TObject; var Key: Char);
    procedure EdtBancoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_BancoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_BancoDblClick(Sender: TObject);
    procedure BBtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
  private
    Cheque: URegistro.TCheque;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Cheque: TFrmCadastro_Cheque;
implementation

uses UDM, UChama_Banco, UChama_Cheque, UDeclaracao;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Cheque.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Cheque);
  Util.Desabilita_Campos(FrmCadastro_Cheque);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmCadastro_Cheque.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    Cheque.Excluir(Cheque);
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU CHEQUE ' + EdtN_Cheque.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Cheque);
  end;
end;

procedure TFrmCadastro_Cheque.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Cheque.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
  begin
    if (Confira = true) then
    begin
      Cheque.Inserir(Cheque);
      UDeclaracao.Insere_Historico(usuario, 'CADASTROU CHEQUE ' + EdtN_Cheque.Text + '.', TimeToStr(time), insercao, date);
    end
    else
      exit;
  end
  else
  begin
    if (Confira = true) then
    BEGIN
      Cheque.Alterar(Cheque);
      UDeclaracao.Insere_Historico(usuario, 'ALTEROU CHEQUE ' + EdtN_Cheque.Text + '.', TimeToStr(time), alteracao, date);
    END
    else
      exit;
  end;
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
  Util.Desabilita_Campos(FrmCadastro_Cheque);
end;

procedure TFrmCadastro_Cheque.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Cheque);
  Util.Limpa_Campos(FrmCadastro_Cheque);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  achei:= false;
  MEdtData_Cadastro.Text:= DateToStr(date);
  EdtEmitente.SetFocus;
  EdtValor.Text:= '0,00';
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);

end;

function TFrmCadastro_Cheque.Confira: boolean;
begin
    Confira:= false;
    if EdtEmitente.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtEmitente.SetFocus;
        abort;
      end;

    if EdtCodigo_Banco.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Banco.SetFocus;
        abort;
      end;

    if EdtN_Cheque.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtN_Cheque.SetFocus;
        abort;
      end;

    if (EdtValor.Text = '') or (EdtValor.Text = '0,00') then
      begin
        Mensagem_Falta_Dados;
        EdtValor.SetFocus;
        abort;
      end;

      Confira:= true;
end;

procedure TFrmCadastro_Cheque.EdtAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', '-',#08]) then
    key := #0
end;

procedure TFrmCadastro_Cheque.EdtBancoKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cheque.EdtCodigo_BancoDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Banco, FrmChama_Banco);
  FrmChama_Banco.ShowModal;
  FrmChama_Banco.Free;
end;

procedure TFrmCadastro_Cheque.EdtCodigo_BancoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Banco, FrmChama_Banco);
      FrmChama_Banco.ShowModal;
      FrmChama_Banco.Free;
    end;
end;

procedure TFrmCadastro_Cheque.EdtCodigo_BancoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Cheque.EdtValorExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtValor, StrToFloat(EdtValor.Text));
end;

procedure TFrmCadastro_Cheque.EdtValorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Cheque.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Cheque.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Cheque.Free;
        FrmCadastro_Cheque:= Nil;
      end;
end;

procedure TFrmCadastro_Cheque.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Cheque);
  Util.Limpa_Campos(FrmCadastro_Cheque);
  Util.Desabilita_Campos(FrmCadastro_Cheque);
  EdtValor.Text:= '0,00';
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Cheque.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Cheque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Cheque.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Cheque.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = False) then
    MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Cheque.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Cheque.MEdtData_SaidaExit(Sender: TObject);
begin
  if (MEdtData_Saida.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Saida);
end;

procedure TFrmCadastro_Cheque.MEdtData_VencimentoExit(Sender: TObject);
begin
  if (MEdtData_Vencimento.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Vencimento);
end;

procedure TFrmCadastro_Cheque.MmoObservacoesKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := AnsiUpperCase( Key )[1];
end;

procedure TFrmCadastro_Cheque.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Cheque, FrmChama_Cheque);
  FrmChama_Cheque.ShowModal;
  FrmChama_Cheque.Release;
end;

end.
