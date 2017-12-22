unit UCadastro_Grupo_Produto_Tributacao_PIS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro;

type
  TFrmCadastro_Grupo_Produto_Tributacao_PIS = class(TForm)
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
    Label19: TLabel;
    EdtCodigo_Tratamento_PIS: TEdit;
    EdtTratamento_PIS: TEdit;
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
    procedure EdtCodigo_Tratamento_PISKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Tratamento_PISKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTratamento_PISKeyPress(Sender: TObject; var Key: Char);
  private
    Grupo_Produto_Tributacao_PIS: URegistro.TCadastro_Grupo_Produto_Tributacao_PIS;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Grupo_Produto_Tributacao_PIS: TFrmCadastro_Grupo_Produto_Tributacao_PIS;
implementation

uses UDM, UDeclaracao, UChama_Grupo_Produto_Tributacao_PIS, UChama_Tratamento_PIS;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Grupo_Produto_Tributacao_PIS.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Grupo_Produto_Tributacao_PIS);
  Util.Desabilita_Campos(FrmCadastro_Grupo_Produto_Tributacao_PIS);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_PIS.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  BEGIN
    Grupo_Produto_Tributacao_PIS.Excluir(Grupo_Produto_Tributacao_PIS);
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU GRUPO DE TRIBUTAÇÃO DE PIS ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Grupo_Produto_Tributacao_PIS);
  END;
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_PIS.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_PIS.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Grupo_Produto_Tributacao_PIS.Inserir(Grupo_Produto_Tributacao_PIS);
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU GRUPO DE TRIBUTAÇÃO DE PIS ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Grupo_Produto_Tributacao_PIS.Alterar(Grupo_Produto_Tributacao_PIS);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU GRUPO DE TRIBUTAÇÃO DE PIS ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Grupo_Produto_Tributacao_PIS);
end;

function TFrmCadastro_Grupo_Produto_Tributacao_PIS.Confira: boolean;
begin
    Confira:= false;
    if EdtDescricao.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtDescricao.SetFocus;
        abort;
      end;

    if EdtCodigo_Tratamento_PIS.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Tratamento_PIS.SetFocus;
        abort;
      end;

      Confira:= true;
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_PIS.EdtCodigo_Tratamento_PISKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Tratamento_PIS, FrmChama_Tratamento_PIS);
      FrmChama_Tratamento_PIS.ShowModal;
      FrmChama_Tratamento_PIS.Free;
    end;
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_PIS.EdtCodigo_Tratamento_PISKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_PIS.EdtTratamento_PISKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Grupo_Produto_Tributacao_PIS.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_PIS.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Grupo_Produto_Tributacao_PIS.Free;
        FrmCadastro_Grupo_Produto_Tributacao_PIS:= Nil;
      end;
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_PIS.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Grupo_Produto_Tributacao_PIS);
  Util.Limpa_Campos(FrmCadastro_Grupo_Produto_Tributacao_PIS);
  Util.Desabilita_Campos(FrmCadastro_Grupo_Produto_Tributacao_PIS);
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_PIS.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_PIS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Grupo_Produto_Tributacao_PIS);
      Util.Limpa_Campos(FrmCadastro_Grupo_Produto_Tributacao_PIS);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      achei:= false;
      MEdtData_Cadastro.SetFocus;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_PIS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_PIS.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_PIS.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Grupo_Produto_Tributacao_PIS, FrmChama_Grupo_Produto_Tributacao_PIS);
  FrmChama_Grupo_Produto_Tributacao_PIS.ShowModal;
  FrmChama_Grupo_Produto_Tributacao_PIS.Release;
end;

end.
