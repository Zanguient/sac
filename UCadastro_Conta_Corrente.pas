unit UCadastro_Conta_Corrente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro;

type
  TFrmCadastro_Conta_Corrente = class(TForm)
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
    BBtnPesquisar: TToolButton;
    Label1: TLabel;
    MEdtData_Abertura: TMaskEdit;
    LblCC: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EdtConta_Corrente: TEdit;
    EdtAgencia: TEdit;
    EdtNome_Agencia: TEdit;
    EdtNome_Correntista: TEdit;
    EdtSaldo_Inicial: TEdit;
    EdtSaldo_Atual: TEdit;
    EdtLimite: TEdit;
    Label8: TLabel;
    EdtCodigo_Banco: TEdit;
    EdtBanco: TEdit;
    BBtnNovo: TToolButton;
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
    procedure EdtSaldo_InicialKeyPress(Sender: TObject; var Key: Char);
    procedure EdtLimiteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSaldo_AtualKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSaldo_InicialExit(Sender: TObject);
    procedure EdtLimiteExit(Sender: TObject);
    procedure EdtSaldo_AtualExit(Sender: TObject);
    procedure EdtConta_CorrenteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAgenciaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_BancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_BancoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_BancoDblClick(Sender: TObject);
    procedure BBtnNovoClick(Sender: TObject);
    procedure MEdtData_AberturaEnter(Sender: TObject);
    procedure MEdtData_CadastroEnter(Sender: TObject);
    procedure MEdtData_AberturaExit(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
    procedure EdtBancoKeyPress(Sender: TObject; var Key: Char);
  private
    Conta: URegistro.TConta_Corrente;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Conta_Corrente: TFrmCadastro_Conta_Corrente;
implementation

uses UDM, UChama_Banco, UChama_Conta_Corrente, UDeclaracao;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Conta_Corrente.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Conta_Corrente);
  Util.Desabilita_Campos(FrmCadastro_Conta_Corrente);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:=  true;
end;

procedure TFrmCadastro_Conta_Corrente.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  BEGIN
    Conta.Excluir(Conta);
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU CONTA CORRENTE ' + EdtConta_Corrente.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:=  true;
    Util.Desabilita_Campos(FrmCadastro_Conta_Corrente);
  END;
end;

procedure TFrmCadastro_Conta_Corrente.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Conta_Corrente.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Conta_Corrente);
  Util.Limpa_Campos(FrmCadastro_Conta_Corrente);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:=  false;
  achei:= false;
  MEdtData_Cadastro.Text:= DateToStr(date);
  EdtConta_Corrente.SetFocus;
  EdtSaldo_Inicial.Text:= '0,00';
  EdtLimite.Text:= '0,00';
  EdtSaldo_Atual.Text:= '0,00';

end;

procedure TFrmCadastro_Conta_Corrente.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Conta.Inserir(Conta);
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU CONTA CORRENTE ' + EdtConta_Corrente.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Conta.Alterar(Conta);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU CONTA CORRENTE ' + EdtConta_Corrente.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:=  true;
    Util.Desabilita_Campos(FrmCadastro_Conta_Corrente);
end;

function TFrmCadastro_Conta_Corrente.Confira: boolean;
begin
    Confira:= false;
    if EdtConta_Corrente.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtConta_Corrente.SetFocus;
        abort;
      end;

    if EdtAgencia.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtAgencia.SetFocus;
        abort;
      end;

    if EdtCodigo_Banco.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Banco.SetFocus;
        abort;
      end;

    if EdtConta_Corrente.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtConta_Corrente.SetFocus;
        abort;
      end;

      Confira:= true;
end;

procedure TFrmCadastro_Conta_Corrente.EdtAgenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', '-',#08]) then
    key := #0
end;

procedure TFrmCadastro_Conta_Corrente.EdtBancoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Conta_Corrente.EdtCodigo_BancoDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Banco, FrmChama_Banco);
  FrmChama_Banco.ShowModal;
  FrmChama_Banco.Free;
end;

procedure TFrmCadastro_Conta_Corrente.EdtCodigo_BancoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Banco, FrmChama_Banco);
      FrmChama_Banco.ShowModal;
      FrmChama_Banco.Free;
    end;
end;

procedure TFrmCadastro_Conta_Corrente.EdtCodigo_BancoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Conta_Corrente.EdtConta_CorrenteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', '-',#08]) then
    key := #0
end;

procedure TFrmCadastro_Conta_Corrente.EdtLimiteExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtLimite, StrToFloat(EdtLimite.Text));
end;

procedure TFrmCadastro_Conta_Corrente.EdtLimiteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', ',',#08]) then
    key := #0
end;

procedure TFrmCadastro_Conta_Corrente.EdtSaldo_AtualExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtSaldo_Atual, StrToFloat(EdtSaldo_Atual.Text));
end;

procedure TFrmCadastro_Conta_Corrente.EdtSaldo_AtualKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', ',',#08]) then
    key := #0
end;

procedure TFrmCadastro_Conta_Corrente.EdtSaldo_InicialExit(Sender: TObject);
begin
  Util.FormataFloat(2, EdtSaldo_Inicial, StrToFloat(EdtSaldo_Inicial.Text));
end;

procedure TFrmCadastro_Conta_Corrente.EdtSaldo_InicialKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', ',',#08]) then
    key := #0
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Conta_Corrente.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Conta_Corrente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Conta_Corrente.Free;
        FrmCadastro_Conta_Corrente:= Nil;
      end;
end;

procedure TFrmCadastro_Conta_Corrente.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Conta_Corrente);
  Util.Limpa_Campos(FrmCadastro_Conta_Corrente);
  Util.Desabilita_Campos(FrmCadastro_Conta_Corrente);
  EdtSaldo_Inicial.Text:= '0,00';
  EdtLimite.Text:= '0,00';
  EdtSaldo_Atual.Text:= '0,00';
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Conta_Corrente.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Conta_Corrente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Conta_Corrente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Conta_Corrente.MEdtData_AberturaEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Abertura.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Conta_Corrente.MEdtData_AberturaExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Abertura);
end;

procedure TFrmCadastro_Conta_Corrente.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Conta_Corrente.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Conta_Corrente.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Conta_Corrente, FrmChama_Conta_Corrente);
  FrmChama_Conta_Corrente.ShowModal;
  FrmChama_Conta_Corrente.Release;
end;

end.
