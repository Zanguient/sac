unit UCadastro_Grupo_Produto_Tributacao_IPI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro;

type
  TFrmCadastro_Grupo_Produto_Tributacao_IPI = class(TForm)
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
    EdtCodigo_Tratamento_IPI: TEdit;
    EdtTratamento_IPI: TEdit;
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
    procedure EdtCodigo_Tratamento_IPIKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Tratamento_IPIKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTratamento_IPIKeyPress(Sender: TObject; var Key: Char);
  private
    Grupo_Produto_Tributacao_IPI: URegistro.TCadastro_Grupo_Produto_Tributacao_IPI;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Grupo_Produto_Tributacao_IPI: TFrmCadastro_Grupo_Produto_Tributacao_IPI;
implementation

uses UDM, UDeclaracao, UChama_Tratamento_IPI,
  UChama_Grupo_Produto_Tributacao_IPI;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Grupo_Produto_Tributacao_IPI.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Grupo_Produto_Tributacao_IPI);
  Util.Desabilita_Campos(FrmCadastro_Grupo_Produto_Tributacao_IPI);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_IPI.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  BEGIN
    Grupo_Produto_Tributacao_IPI.Excluir(Grupo_Produto_Tributacao_IPI);
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU GRUPO DE TRIBUTAÇÃO DE IPI ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Grupo_Produto_Tributacao_IPI);
  END;
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_IPI.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_IPI.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Grupo_Produto_Tributacao_IPI.Inserir(Grupo_Produto_Tributacao_IPI);
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU GRUPO DE TRIBUTAÇÃO DE IPI ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Grupo_Produto_Tributacao_IPI.Alterar(Grupo_Produto_Tributacao_IPI);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU GRUPO DE TRIBUTAÇÃO DE IPI ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Grupo_Produto_Tributacao_IPI);
end;

function TFrmCadastro_Grupo_Produto_Tributacao_IPI.Confira: boolean;
begin
    Confira:= false;
    if EdtDescricao.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtDescricao.SetFocus;
        abort;
      end;

    if EdtCodigo_Tratamento_IPI.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtCodigo_Tratamento_IPI.SetFocus;
        abort;
      end;

      Confira:= true;
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_IPI.EdtCodigo_Tratamento_IPIKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      Application.CreateForm(TFrmChama_Tratamento_IPI, FrmChama_Tratamento_IPI);
      FrmChama_Tratamento_IPI.ShowModal;
      FrmChama_Tratamento_IPI.Free;
    end;
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_IPI.EdtCodigo_Tratamento_IPIKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_IPI.EdtTratamento_IPIKeyPress(
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

procedure TFrmCadastro_Grupo_Produto_Tributacao_IPI.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_IPI.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Grupo_Produto_Tributacao_IPI.Free;
        FrmCadastro_Grupo_Produto_Tributacao_IPI:= Nil;
      end;
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_IPI.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Grupo_Produto_Tributacao_IPI);
  Util.Limpa_Campos(FrmCadastro_Grupo_Produto_Tributacao_IPI);
  Util.Desabilita_Campos(FrmCadastro_Grupo_Produto_Tributacao_IPI);
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_IPI.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_IPI.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Grupo_Produto_Tributacao_IPI);
      Util.Limpa_Campos(FrmCadastro_Grupo_Produto_Tributacao_IPI);
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

procedure TFrmCadastro_Grupo_Produto_Tributacao_IPI.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_IPI.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Grupo_Produto_Tributacao_IPI.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Grupo_Produto_Tributacao_IPI, FrmChama_Grupo_Produto_Tributacao_IPI);
  FrmChama_Grupo_Produto_Tributacao_IPI.ShowModal;
  FrmChama_Grupo_Produto_Tributacao_IPI.Release;
end;

end.
