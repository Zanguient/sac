unit UAgenda_Telefonica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, ExtCtrls,
  URegistro, UGeral;

type
  TFrmAgenda_Telefonica = class(TForm)
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
    EdtNome: TEdit;
    BBtnPesquisar: TToolButton;
    Label7: TLabel;
    Label8: TLabel;
    MEdtTelefone1: TMaskEdit;
    MEdtTelefone2: TMaskEdit;
    Label1: TLabel;
    MEdtTelefone3: TMaskEdit;
    BbtnNovo: TToolButton;
    procedure BBtnSalvarClick(Sender: TObject);
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
    procedure MEdtData_CadastroExit(Sender: TObject);
    procedure EdtSetorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure BbtnNovoClick(Sender: TObject);
  private
    Util: TUtil;
    Agenda: TAgenda_Telefonica;
    function Confira: boolean; virtual;
    procedure Gera_Codigo;
  public
    ativo, enderec, achei: boolean;
  protected
  end;

var
  FrmAgenda_Telefonica: TFrmAgenda_Telefonica;
implementation

uses UDM, UChama_Agenda_Telefonica, UDeclaracao;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmAgenda_Telefonica.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmAgenda_Telefonica);
  Util.Desabilita_Campos(FrmAgenda_Telefonica);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmAgenda_Telefonica.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao = true) then
  begin
    try
      Agenda.Excluir;
      UDeclaracao.Insere_Historico(usuario, 'EXCLUIU CONTATO TELEFÔNICO ' + EdtNome.Text + '.', TimeToStr(time), exclusao, date);
    except
      Impossivel_Excluir_Registro;
    end;

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmAgenda_Telefonica);
  end;
end;

procedure TFrmAgenda_Telefonica.BBtnFecharClick(Sender: TObject);
begin
  if BBtnSalvar.Enabled = true then
    begin
      Cancele;
    end
  else
    Close;
end;

procedure TFrmAgenda_Telefonica.BbtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmAgenda_Telefonica);
  Util.Limpa_Campos(FrmAgenda_Telefonica);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BbtnNovo.Enabled:= false;
  achei:= false;
  EdtNome.SetFocus;
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);

end;

procedure TFrmAgenda_Telefonica.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Agenda_Telefonica, FrmChama_Agenda_Telefonica);
  FrmChama_Agenda_Telefonica.ShowModal;
  FrmChama_Agenda_Telefonica.Free;
end;

procedure TFrmAgenda_Telefonica.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Gera_Codigo;
        try
          Agenda.Inserir;
          UDeclaracao.Insere_Historico(usuario, 'CADASTROU CONTATO TELEFÔNICO ' + EdtNome.Text + '.', TimeToStr(time), insercao, date);
        except
          Impossivel_Excluir_Registro;
        end;
      end
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      begin
      try
        Agenda.Alterar;
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU CONTATO TELEFÔNICO ' + EdtNome.Text + '.', TimeToStr(time), alteracao, date);
      except
        Impossivel_Excluir_Registro;
      end;
      end
      else
        exit;
    end;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmAgenda_Telefonica);
end;

function TFrmAgenda_Telefonica.Confira: boolean;
begin
  Confira:= false;

  if EdtNome.Text = '' then
     begin
       Mensagem_Falta_Dados;
       EdtNome.SetFocus;
       abort;
      end;

  Confira:= true;
end;

procedure TFrmAgenda_Telefonica.EdtCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmAgenda_Telefonica.EdtCodigo_CidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmAgenda_Telefonica.EdtSetorKeyPress(Sender: TObject; var Key: Char);
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

procedure TFrmAgenda_Telefonica.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmAgenda_Telefonica.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmAgenda_Telefonica.Free;
        FrmAgenda_Telefonica:= Nil;
      end;
end;

procedure TFrmAgenda_Telefonica.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmAgenda_Telefonica);
  Util.Limpa_Campos(FrmAgenda_Telefonica);
  Util.Desabilita_Campos(FrmAgenda_Telefonica);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmAgenda_Telefonica.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmAgenda_Telefonica.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin

    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmAgenda_Telefonica.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmAgenda_Telefonica.Gera_Codigo;
var
  qAux: TADOQuery;
  codigo: integer;
begin
  try
    qAux:= TADOQuery.Create(nil);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select max(Codigo) as codigo from Agenda_Telefonica');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmAgenda_Telefonica.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmAgenda_Telefonica.MEdtData_CadastroExit(Sender: TObject);
begin
  if (MEdtData_Cadastro.Text = '  /  /    ') then
    abort
  else
    Util.Verifica_Data(MEdtData_Cadastro);
end;

end.
