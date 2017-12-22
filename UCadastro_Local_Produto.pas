unit UCadastro_Local_Produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro;

type
  TFrmCadastro_Local_Produto = class(TForm)
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
    EdtLocal: TEdit;
    BBtnPesquisar: TToolButton;
    Label1: TLabel;
    EdtDetalhe: TEdit;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    EdtConsulta: TEdit;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    EdtCodigo_Local_Destino: TEdit;
    EdtLocal_Destino: TEdit;
    BtnTransferir: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1Codigo: TIntegerField;
    ADOQuery1Codigo_Venda: TStringField;
    ADOQuery1Descricao: TStringField;
    ADOQuery1Valor_Compra: TFloatField;
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
    procedure EdtCodigo_Local_DestinoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtLocal_DestinoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Local_DestinoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnTransferirClick(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure BBtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
  private
    Local: URegistro.TLocalidade_Produto;
    Util: TUtil;
    procedure Atualiza_Local;
    procedure UpdateLocal(Produto: Integer);
  public
    ativo, achei: boolean;
    loc: integer;
    procedure Pega_Produto_Local;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmCadastro_Local_Produto: TFrmCadastro_Local_Produto;
implementation

uses UDM, UChama_Local_Produto, UDeclaracao;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmCadastro_Local_Produto.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Local_Produto);
  Util.Desabilita_Campos(FrmCadastro_Local_Produto);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmCadastro_Local_Produto.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  BEGIN
    Local.Excluir(Local);
    Cria_Arquivo_Atualiza_Dados('DLP');
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU LOCAL DE PRODUTO ' + EdtLocal.Text + '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Local_Produto);
    Util.Limpa_Campos(FrmCadastro_Local_Produto);
  END;
end;

procedure TFrmCadastro_Local_Produto.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Local_Produto.BBtnNovoClick(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Local_Produto);
  Util.Limpa_Campos(FrmCadastro_Local_Produto);
  BBtnSalvar.Enabled:= true;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnNovo.Enabled:= false;
  MEdtData_Cadastro.Text:= DateToStr(date);
  achei:= false;
  EdtLocal.SetFocus;
end;

procedure TFrmCadastro_Local_Produto.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      BEGIN
        Local.Inserir(Local);
        Cria_Arquivo_Atualiza_Dados('ILP');
        Util.Limpa_Campos(FrmCadastro_Local_Produto);
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU LOCAL DE PRODUTO ' + EdtLocal.Text + '.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      BEGIN
        Local.Alterar(Local);
        Cria_Arquivo_Atualiza_Dados('ALP');
        Util.Limpa_Campos(FrmCadastro_Local_Produto);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU LOCAL DE PRODUTO ' + EdtLocal.Text + '.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;

    Cria_Arquivo_Atualiza_Dados('AProd');

    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmCadastro_Local_Produto);
end;

procedure TFrmCadastro_Local_Produto.BtnTransferirClick(Sender: TObject);
begin
  Atualiza_Local;
  Pega_Produto_Local;
end;

procedure TFrmCadastro_Local_Produto.Atualiza_Local;
begin
  if (EdtCodigo_Local_Destino.Text = '') then
  begin
    Application.MessageBox('Informe pelo menos um local, para transferir', 'Grupo não encontrado', MB_OK+MB_ICONHAND);
    EdtCodigo_Local_Destino.SetFocus;
    abort;
  end;

  if (DBGrid1.SelectedRows.Count = 0) then
  begin
    Application.MessageBox('É necessário informar pelo menos um item', 'Dados não encontrados', MB_OK+MB_ICONHAND);
    abort;
  end;

  if (Application.MessageBox('Confirma a transferência dos produtos selecionados para o novo local?', 'Confirmação', MB_YESNO+MB_ICONQUESTION)) = IDYES then
  begin
    ADOQuery1.First;
    while not ADOQuery1.Eof do
    begin
      if (DBGrid1.SelectedRows.CurrentRowSelected) then
      begin
        UpdateLocal(ADOQuery1Codigo.AsInteger);
      end;
      ADOQuery1.Next;
    end;
    Processo_Concluido;
  end;
end;

procedure TFrmCadastro_Local_Produto.UpdateLocal(Produto: Integer);
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('update Produto set Codigo_Local = :Codigo_Local');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Codigo_Local').Value:= StrToInt(EdtCodigo_Local_Destino.Text);
      Parameters.ParamByName('Codigo').Value:= Produto;
      ExecSQL;
    end;

    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnectionLocal;
      clear;
      add('update Produto set Codigo_Local = :Codigo_Local');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Codigo_Local').Value:= StrToInt(EdtCodigo_Local_Destino.Text);
      Parameters.ParamByName('Codigo').Value:= Produto;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

function TFrmCadastro_Local_Produto.Confira: boolean;
begin
    Confira:= false;
    if EdtLocal.Text = '' then
      begin
        Mensagem_Falta_Dados;
        EdtLocal.SetFocus;
        abort;
      end;

//    if EdtDetalhe.Text = '' then
//      begin
//        Mensagem_Falta_Dados;
//        EdtDetalhe.SetFocus;
//        abort;
//      end;

      Confira:= true;
end;

procedure TFrmCadastro_Local_Produto.Pega_Produto_Local;
begin
  with ADOQuery1, sql do
  begin
    close;
    clear;
    add('select P.Codigo, P.Codigo_Venda, P.Descricao, P.Valor_Compra from Produto P');
    add('left join Grupo_Produto GP on(P.Codigo_Grupo = GP.Codigo)');

    add('where P.Codigo_Local = :Local and P.Descricao like '''+ EdtConsulta.Text +'%'' order by P.Descricao');
    Parameters.ParamByName('Local').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmCadastro_Local_Produto.EdtCodigo_Local_DestinoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    loc:= 1;
    Application.CreateForm(TFrmChama_Local_Produto, FrmChama_Local_Produto);
    FrmChama_Local_Produto.ShowModal;
    FrmChama_Local_Produto.Release;
  end;
end;

procedure TFrmCadastro_Local_Produto.EdtCodigo_Local_DestinoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmCadastro_Local_Produto.EdtConsultaChange(Sender: TObject);
begin
  if (achei = true) then
    Pega_Produto_Local;
end;

procedure TFrmCadastro_Local_Produto.EdtLocal_DestinoKeyPress(Sender: TObject;
  var Key: Char);
begin
  util.Somente_Apaga(key);
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmCadastro_Local_Produto.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmCadastro_Local_Produto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmCadastro_Local_Produto.Free;
        FrmCadastro_Local_Produto:= Nil;
      end;
end;

procedure TFrmCadastro_Local_Produto.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Local_Produto);
  Util.Limpa_Campos(FrmCadastro_Local_Produto);
  Util.Desabilita_Campos(FrmCadastro_Local_Produto);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Local_Produto.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmCadastro_Local_Produto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Local_Produto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmCadastro_Local_Produto.MEdtData_CadastroEnter(Sender: TObject);
begin
  if (achei = false) then
    MEdtData_Cadastro.Text:= DateToStr(date);
end;

procedure TFrmCadastro_Local_Produto.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Local_Produto.BBtnPesquisarClick(Sender: TObject);
begin
  loc:= 0;
  Application.CreateForm(TFrmChama_Local_Produto, FrmChama_Local_Produto);
  FrmChama_Local_Produto.ShowModal;
  FrmChama_Local_Produto.Release;
end;

end.
