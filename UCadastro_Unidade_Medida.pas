unit UCadastro_Unidade_Medida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro;

type
  TFrmCadastro_Unidade_Medida = class(TForm)
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
    EdtDescricao: TEdit;
    BBtnPesquisar: TToolButton;
    Label1: TLabel;
    EdtSigla: TEdit;
    BbtnNovo: TToolButton;
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
    procedure BbtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
  private
    Unidade_Medida: URegistro.TUnidade_Medida;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Unidade_Medida: TFrmCadastro_Unidade_Medida;
implementation

uses UChama_Unidade, UDM, UDeclaracao;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Unidade_Medida.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Unidade_Medida);
  Util.Desabilita_Campos(FrmCadastro_Unidade_Medida);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmCadastro_Unidade_Medida.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  BEGIN
    Unidade_Medida.Excluir(Unidade_Medida);
    Cria_Arquivo_Atualiza_Dados('DUM');
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU UNIDADE DE MEDIDA ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Unidade_Medida);
  END;
end;

procedure TFrmCadastro_Unidade_Medida.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Unidade_Medida.BbtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Unidade_Medida);
  Util.Limpa_Campos(FrmCadastro_Unidade_Medida);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= False;
  achei:= false;
  EdtSigla.SetFocus;
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);
end;

procedure TFrmCadastro_Unidade_Medida.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Unidade_Medida.Inserir(Unidade_Medida);
        Cria_Arquivo_Atualiza_Dados('IUM');
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU UNIDADE DE MEDIDA ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Unidade_Medida.Alterar(Unidade_Medida);
        Cria_Arquivo_Atualiza_Dados('AUM');
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU UNIDADE DE MEDIDA ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Unidade_Medida);
end;

function TFrmCadastro_Unidade_Medida.Confira: boolean;
begin
    Confira:= false;
    if EdtSigla.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtSigla.SetFocus;
        abort;
      end;

      Confira:= true;
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Unidade_Medida.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Unidade_Medida.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Unidade_Medida.Free;
        FrmCadastro_Unidade_Medida:= Nil;
      end;
end;

procedure TFrmCadastro_Unidade_Medida.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Unidade_Medida);
  Util.Limpa_Campos(FrmCadastro_Unidade_Medida);
  Util.Desabilita_Campos(FrmCadastro_Unidade_Medida);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Unidade_Medida.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Unidade_Medida.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin

    end;
  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Unidade_Medida.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Unidade_Medida.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Unidade_Medida.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Unidade_Medida.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Unidade, FrmChama_Unidade);
  FrmChama_Unidade.ShowModal;
  FrmChama_Unidade.Release;
end;

end.
