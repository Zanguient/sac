unit UCadastro_Tipo_Bem_Patrimonial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro;

type
  TFrmCadastro_Tipo_Bem_Patrimonial = class(TForm)
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
    procedure BBtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
  private
    Tipo_Bem_Patrimonial: URegistro.TCadastro_Tipo_Bem_Patrimonial;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Tipo_Bem_Patrimonial: TFrmCadastro_Tipo_Bem_Patrimonial;
implementation

uses UDM, UDeclaracao, UChama_Tipo_Bem_Patrimonial;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Tipo_Bem_Patrimonial.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Tipo_Bem_Patrimonial);
  Util.Desabilita_Campos(FrmCadastro_Tipo_Bem_Patrimonial);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmCadastro_Tipo_Bem_Patrimonial.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    Tipo_Bem_Patrimonial.Excluir;
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU TIPO DE BEM PATRIMONIAL ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Tipo_Bem_Patrimonial);
  end;
end;

procedure TFrmCadastro_Tipo_Bem_Patrimonial.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Tipo_Bem_Patrimonial.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Tipo_Bem_Patrimonial);
  Util.Limpa_Campos(FrmCadastro_Tipo_Bem_Patrimonial);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  achei:= false;
  MEdtData_Cadastro.Text:= DateToStr(date);
  EdtDescricao.SetFocus;
end;

procedure TFrmCadastro_Tipo_Bem_Patrimonial.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Tipo_Bem_Patrimonial.Inserir;
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU TIPO DE BEM PATRIMONIAL ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      end
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      begin
        Tipo_Bem_Patrimonial.Alterar;
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU TIPO DE BEM PATRIMONIAL ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      end
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Tipo_Bem_Patrimonial);
end;

function TFrmCadastro_Tipo_Bem_Patrimonial.Confira: boolean;
begin
  Confira:= false;
  if EdtDescricao.Text = '' then
  begin
    Mensagem_Falta_Dados;
    EdtDescricao.SetFocus;
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

procedure TFrmCadastro_Tipo_Bem_Patrimonial.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Tipo_Bem_Patrimonial.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Tipo_Bem_Patrimonial.Free;
        FrmCadastro_Tipo_Bem_Patrimonial:= Nil;
      end;
end;

procedure TFrmCadastro_Tipo_Bem_Patrimonial.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Tipo_Bem_Patrimonial);
  Util.Limpa_Campos(FrmCadastro_Tipo_Bem_Patrimonial);
  Util.Desabilita_Campos(FrmCadastro_Tipo_Bem_Patrimonial);
end;

procedure TFrmCadastro_Tipo_Bem_Patrimonial.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Tipo_Bem_Patrimonial.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Tipo_Bem_Patrimonial.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Tipo_Bem_Patrimonial.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = False) then
    MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Tipo_Bem_Patrimonial.MEdtData_CadastroExit(
  Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Tipo_Bem_Patrimonial.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Tipo_Bem_Patrimonial, FrmChama_Tipo_Bem_Patrimonial);
  FrmChama_Tipo_Bem_Patrimonial.ShowModal;
  FrmChama_Tipo_Bem_Patrimonial.Release;
end;

end.
