unit UCadastro_Veiculo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls;

type
  TFrmCadastro_Veiculo = class(TForm)
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
    EdtVeiculo: TEdit;
    BBtnPesquisar: TToolButton;
    Label1: TLabel;
    EdtCodigo_Marca: TEdit;
    EdtMarca: TEdit;
    Label2: TLabel;
    EdtModelo: TEdit;
    Label3: TLabel;
    EdtAno_Fabricacao: TEdit;
    Label4: TLabel;
    EdtPlaca: TEdit;
    EdtRenavam: TEdit;
    Label5: TLabel;
    EdtChassi: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    EdtCodigo_Cliente: TEdit;
    EdtCliente: TEdit;
    Label8: TLabel;
    EdtUF: TEdit;
    Label9: TLabel;
    EdtANTT: TEdit;
    RGTipo: TRadioGroup;
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
    procedure EdtCodigo_ClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_MarcaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_ClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtClienteKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_MarcaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtMarcaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_MarcaDblClick(Sender: TObject);
    procedure EdtCodigo_ClienteDblClick(Sender: TObject);
    procedure BBtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
  private
    Veiculo: URegistro.TVeiculo;
    Util: TUtil;
  public
    ativo, achei: boolean;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Veiculo: TFrmCadastro_Veiculo;
implementation

uses UDM, UDeclaracao, UChama_Cliente, UChama_Veiculo, UChama_Marca;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Veiculo.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Veiculo);
  Util.Desabilita_Campos(FrmCadastro_Veiculo);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmCadastro_Veiculo.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    Veiculo.Excluir(Veiculo);
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU VEÍCULO ' + EdtVeiculo.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Veiculo);
  end;
end;

procedure TFrmCadastro_Veiculo.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Veiculo.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Veiculo);
  Util.Limpa_Campos(FrmCadastro_Veiculo);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  achei:= false;
  EdtVeiculo.SetFocus;
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);
end;

procedure TFrmCadastro_Veiculo.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Veiculo.Inserir(Veiculo);
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU VEÍCULO ' + EdtVeiculo.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Veiculo.Alterar(Veiculo);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU VEÍCULO ' + EdtVeiculo.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Veiculo);
end;

function TFrmCadastro_Veiculo.Confira: boolean;
begin
    Confira:= false;
    if EdtVeiculo.Text = '' then
      begin
        Mensagem_Falta_Dados;;
        EdtVeiculo.SetFocus;
        abort;
      end;

    if EdtCodigo_Cliente.Text = '' then
      begin
        Mensagem_Falta_Dados;;
        EdtCodigo_Cliente.SetFocus;
        abort;
      end;

    if EdtCodigo_Marca.Text = '' then
      begin
        Mensagem_Falta_Dados;;
        EdtCodigo_Marca.SetFocus;
        abort;
      end;

    if EdtModelo.Text = '' then
      begin
        Mensagem_Falta_Dados;;
        EdtModelo.SetFocus;
        abort;
      end;

    if EdtAno_Fabricacao.Text = '' then
      begin
        Mensagem_Falta_Dados;;
        EdtAno_Fabricacao.SetFocus;
        abort;
      end;

    if EdtPlaca.Text = '' then
      begin
        Mensagem_Falta_Dados;;
        EdtPlaca.SetFocus;
        abort;
      end;

    if EdtChassi.Text = '' then
      begin
        Mensagem_Falta_Dados;;
        EdtChassi.SetFocus;
        abort;
      end;

      Confira:= true;
end;

procedure TFrmCadastro_Veiculo.EdtClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Veiculo.EdtCodigo_ClienteDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
  FrmChama_Cliente.ShowModal;
  FrmChama_Cliente.Free;
end;

procedure TFrmCadastro_Veiculo.EdtCodigo_ClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Cliente, FrmChama_Cliente);
    FrmChama_Cliente.ShowModal;
    FrmChama_Cliente.Free;
  end;
end;

procedure TFrmCadastro_Veiculo.EdtCodigo_ClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Veiculo.EdtCodigo_MarcaDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Marca, FrmChama_Marca);
  FrmChama_Marca.ShowModal;
  FrmChama_Marca.Free;
end;

procedure TFrmCadastro_Veiculo.EdtCodigo_MarcaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Marca, FrmChama_Marca);
    FrmChama_Marca.ShowModal;
    FrmChama_Marca.Free;
  end;
end;

procedure TFrmCadastro_Veiculo.EdtCodigo_MarcaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Veiculo.EdtMarcaKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmCadastro_Veiculo.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Veiculo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Veiculo.Free;
        FrmCadastro_Veiculo:= Nil;
      end;
end;

procedure TFrmCadastro_Veiculo.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Veiculo);
  Util.Limpa_Campos(FrmCadastro_Veiculo);
  Util.Desabilita_Campos(FrmCadastro_Veiculo);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Veiculo.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Veiculo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin

    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Veiculo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Veiculo.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Veiculo.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Veiculo.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Veiculo, FrmChama_Veiculo);
  FrmChama_Veiculo.ShowModal;
  FrmChama_Veiculo.Release;
end;

end.
