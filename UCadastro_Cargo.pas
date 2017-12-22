unit UCadastro_Cargo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro;

type
  TFrmCadastro_Cargo = class(TForm)
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
    LblCargo: TLabel;
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
    Cargo: URegistro.TCargo;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Cargo: TFrmCadastro_Cargo;
implementation

uses UDM, UChama_Cargo, UDeclaracao;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Cargo.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Cargo);
  Util.Desabilita_Campos(FrmCadastro_Cargo);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= True;
end;

procedure TFrmCadastro_Cargo.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    Cargo.Excluir(Cargo);
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU CARGO ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled := True;
    Util.Desabilita_Campos(FrmCadastro_Cargo)
  end;
end;

procedure TFrmCadastro_Cargo.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Cargo.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Cargo);
  Util.Limpa_Campos(FrmCadastro_Cargo);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled := false;
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);
  EdtDescricao.SetFocus;
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;


procedure TFrmCadastro_Cargo.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Cargo.Inserir(Cargo);
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU CARGO ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      end
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      begin
        Cargo.Alterar(Cargo);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU CARGO ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      end
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Cargo);
end;

function TFrmCadastro_Cargo.Confira: boolean;
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

procedure TFrmCadastro_Cargo.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Cargo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Cargo.Free;
        FrmCadastro_Cargo:= Nil;
      end;
end;

procedure TFrmCadastro_Cargo.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Cargo);
  Util.Limpa_Campos(FrmCadastro_Cargo);
  Util.Desabilita_Campos(FrmCadastro_Cargo);
end;

procedure TFrmCadastro_Cargo.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Cargo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin

    end;  
  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Cargo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Cargo.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Cargo.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Cargo.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Cargo, FrmChama_Cargo);
  FrmChama_Cargo.ShowModal;
  FrmChama_Cargo.Release;
end;

end.
