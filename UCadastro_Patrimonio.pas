unit UCadastro_Patrimonio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro;

type
  TFrmCadastro_Patrimonio = class(TForm)
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
    EdtN_Bem: TEdit;
    EdtN_Identificacao: TEdit;
    Label2: TLabel;
    Label7: TLabel;
    EdtCodigo_Marca: TEdit;
    EdtMarca: TEdit;
    Label3: TLabel;
    EdtModelo: TEdit;
    Label4: TLabel;
    EdtCodigo_Tipo_Bem: TEdit;
    EdtTipo_Bem: TEdit;
    Label5: TLabel;
    EdtCodigo_Local: TEdit;
    EdtLocal: TEdit;
    Label6: TLabel;
    MEdtData_Aquisicao: TMaskEdit;
    Label8: TLabel;
    MEdtData_Baixa: TMaskEdit;
    Label9: TLabel;
    EdtValor: TEdit;
    Label10: TLabel;
    EdtCodigo_Status: TEdit;
    EdtStatus: TEdit;
    Label47: TLabel;
    MmoObservacoes: TMemo;
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
    procedure EdtCodigo_MarcaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Tipo_BemKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_LocalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_StatusKeyPress(Sender: TObject; var Key: Char);
    procedure EdtMarcaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTipo_BemKeyPress(Sender: TObject; var Key: Char);
    procedure EdtLocalKeyPress(Sender: TObject; var Key: Char);
    procedure EdtStatusKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_MarcaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Tipo_BemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_LocalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_StatusKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtValorExit(Sender: TObject);
    procedure MEdtData_AquisicaoExit(Sender: TObject);
    procedure MEdtData_BaixaExit(Sender: TObject);
    procedure BBtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
    procedure EdtValorKeyPress(Sender: TObject; var Key: Char);
  private
    Patrimonio: URegistro.TPatrimonio;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Patrimonio: TFrmCadastro_Patrimonio;
implementation

uses UDM, UDeclaracao, UChama_Tipo_Bem_Patrimonial, UChama_Marca,
  UChama_Local_Produto, UChama_Status, UChama_Patrimonio;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Patrimonio.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Patrimonio);
  Util.Desabilita_Campos(FrmCadastro_Patrimonio);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmCadastro_Patrimonio.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    Patrimonio.Excluir;
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU PATRIMONIO ' + EdtDescricao.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Patrimonio);
  end;
end;

procedure TFrmCadastro_Patrimonio.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Patrimonio.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Patrimonio);
  Util.Limpa_Campos(FrmCadastro_Patrimonio);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  achei:= false;
  EdtValor.Text:= '0,00';
  MEdtData_Cadastro.Text:= DateToStr(date);
  EdtN_Bem.SetFocus;
end;

procedure TFrmCadastro_Patrimonio.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Patrimonio.Inserir;
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU PATRIMONIO ' + EdtDescricao.Text + '.', TimeToStr(time), insercao, date);
      end
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      begin
        Patrimonio.Alterar;
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU PATRIMONIO ' + EdtDescricao.Text + '.', TimeToStr(time), alteracao, date);
      end
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Patrimonio);
end;

function TFrmCadastro_Patrimonio.Confira: boolean;
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

procedure TFrmCadastro_Patrimonio.EdtCodigo_LocalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Local_Produto, FrmChama_Local_Produto);
    FrmChama_Local_Produto.ShowModal;
    FrmChama_Local_Produto.Release;
  end;
end;

procedure TFrmCadastro_Patrimonio.EdtCodigo_LocalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Patrimonio.EdtCodigo_MarcaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Marca, FrmChama_Marca);
    FrmChama_Marca.ShowModal;
    FrmChama_Marca.Release;
  end;
end;

procedure TFrmCadastro_Patrimonio.EdtCodigo_MarcaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Patrimonio.EdtCodigo_StatusKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Status, FrmChama_Status);
    FrmChama_Status.ShowModal;
    FrmChama_Status.Release;
  end;
end;

procedure TFrmCadastro_Patrimonio.EdtCodigo_StatusKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Patrimonio.EdtCodigo_Tipo_BemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Tipo_Bem_Patrimonial, FrmChama_Tipo_Bem_Patrimonial);
    FrmChama_Tipo_Bem_Patrimonial.ShowModal;
    FrmChama_Tipo_Bem_Patrimonial.Release;
  end;
end;

procedure TFrmCadastro_Patrimonio.EdtCodigo_Tipo_BemKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Patrimonio.EdtLocalKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Patrimonio.EdtMarcaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Patrimonio.EdtStatusKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Patrimonio.EdtTipo_BemKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Patrimonio.EdtValorExit(Sender: TObject);
begin
  if (EdtValor.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtValor.SetFocus;
    abort;
  end;

  Util.FormataFloat(2, EdtValor, StrToFloat(EdtValor.Text));
end;

procedure TFrmCadastro_Patrimonio.EdtValorKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TFrmCadastro_Patrimonio.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Patrimonio.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Patrimonio.Free;
        FrmCadastro_Patrimonio:= Nil;
      end;
end;

procedure TFrmCadastro_Patrimonio.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Patrimonio);
  Util.Limpa_Campos(FrmCadastro_Patrimonio);
  Util.Desabilita_Campos(FrmCadastro_Patrimonio);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Patrimonio.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Patrimonio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Patrimonio.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Patrimonio.MEdtData_AquisicaoExit(Sender: TObject);
begin
    Util.Verifica_Data(MEdtData_Aquisicao);
end;

procedure TFrmCadastro_Patrimonio.MEdtData_BaixaExit(Sender: TObject);
begin
    Util.Verifica_Data(MEdtData_Baixa);
end;

procedure TFrmCadastro_Patrimonio.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Patrimonio.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Patrimonio.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Patrimonio, FrmChama_Patrimonio);
  FrmChama_Patrimonio.ShowModal;
  FrmChama_Patrimonio.Release;
end;

end.
