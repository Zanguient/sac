unit UCadastro_Pais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro;

type
  TFrmCadastro_Pais = class(TForm)
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
    EdtCodigo_Pais: TEdit;
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
    Pais: URegistro.TPais;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Pais: TFrmCadastro_Pais;
implementation

uses UDM, UDeclaracao, UChama_Pais;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Pais.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Pais);
  Util.Desabilita_Campos(FrmCadastro_Pais);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= True;
end;

procedure TFrmCadastro_Pais.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  BEGIN
    Pais.Excluir(Pais);
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU PAIS ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= True;
    Util.Desabilita_Campos(FrmCadastro_Pais);
  END;
end;

procedure TFrmCadastro_Pais.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Pais.BbtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Pais);
  Util.Limpa_Campos(FrmCadastro_Pais);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  achei:= false;
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);
  EdtCodigo_Pais.SetFocus;
end;

procedure TFrmCadastro_Pais.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Pais.Inserir(Pais);
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU PAIS ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Pais.Alterar(Pais);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU PAIS ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BbtnNovo.Enabled:= false;
    Util.Desabilita_Campos(FrmCadastro_Pais);
end;

function TFrmCadastro_Pais.Confira: boolean;
begin
    Confira:= false;
    if EdtDescricao.Text = '' then
      begin
        Mensagem_Falta_Dados;;
        EdtDescricao.SetFocus;
        abort;
      end;

    if EdtCodigo_Pais.Text = '' then
      begin
        Mensagem_Falta_Dados;;
        EdtCodigo_Pais.SetFocus;
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

procedure TFrmCadastro_Pais.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Pais.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Pais.Free;
        FrmCadastro_Pais:= Nil;
      end;
end;

procedure TFrmCadastro_Pais.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Pais);
  Util.Limpa_Campos(FrmCadastro_Pais);
  Util.Desabilita_Campos(FrmCadastro_Pais);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Pais.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Pais.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmCadastro_Pais);
      Util.Limpa_Campos(FrmCadastro_Pais);
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

procedure TFrmCadastro_Pais.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Pais.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Pais.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Pais.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Pais, FrmChama_Pais);
  FrmChama_Pais.ShowModal;
  FrmChama_Pais.Release;
end;

end.
