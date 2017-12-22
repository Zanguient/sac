unit UCadastro_Cidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids,
  DBGrids, UGeral, URegistro,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFrmCadastro_Cidade = class(TForm)
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
    EdtCidade: TEdit;
    BBtnPesquisar: TToolButton;
    Label1: TLabel;
    CmbUF: TComboBox;
    Label2: TLabel;
    EdtDDD: TEdit;
    Label3: TLabel;
    EdtCodigo_Cidade: TEdit;
    Label25: TLabel;
    EdtPais: TEdit;
    EdtCodigo_Pais: TEdit;
    BBtnNovo: TToolButton;
    btnBuscarCodMun: TButton;
    IdHTTP1: TIdHTTP;
    Memo1: TMemo;
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
    procedure EdtCodigo_PaisKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPaisKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_PaisKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_PaisDblClick(Sender: TObject);
    // procedure ToolButton1Click(Sender: TObject);
    procedure BBtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
    procedure btnBuscarCodMunClick(Sender: TObject);
  private
    Cidade: URegistro.TCidade;
    Util: TUtil;
  public
    ativo, achei: Boolean;
  protected
    function Confira: Boolean; virtual;
  end;

var
  FrmCadastro_Cidade: TFrmCadastro_Cidade;

implementation

uses UDM, UChama_Cidade, UDeclaracao, UChama_Pais;

{$R *.dfm}
{ TFrmPadrao }

procedure TFrmCadastro_Cidade.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmCadastro_Cidade);
  Util.Desabilita_Campos(FrmCadastro_Cidade);
  BBtnSalvar.Enabled := false;
  BBtnExcluir.Enabled := false;
  BBtnPesquisar.Enabled := true;
  BBtnCancelar.Enabled := false;
  BBtnNovo.Enabled := true;
end;

procedure TFrmCadastro_Cidade.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    Cidade.Excluir(Cidade);
    Cria_Arquivo_Atualiza_Dados('DCid');
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU CIDADE ' + EdtCidade.Text +
      '.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled := false;
    BBtnExcluir.Enabled := false;
    BBtnPesquisar.Enabled := true;
    BBtnCancelar.Enabled := false;
    BBtnNovo.Enabled := true;
    Util.Desabilita_Campos(FrmCadastro_Cidade);
  end;
end;

procedure TFrmCadastro_Cidade.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Cidade.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
  begin
    if (Confira = true) then
    begin
      Cidade.Inserir(Cidade);
      Cria_Arquivo_Atualiza_Dados('ICid');
      UDeclaracao.Insere_Historico(usuario, 'CADASTROU CIDADE ' + EdtCidade.Text
        + '.', TimeToStr(time), insercao, date);
    end
    else
      exit;
  end
  else
  begin
    if (Confira = true) then
    begin
      Cidade.Alterar(Cidade);
      Cria_Arquivo_Atualiza_Dados('ACid');
      UDeclaracao.Insere_Historico(usuario, 'ALTEROU CIDADE ' + EdtCidade.Text +
        '.', TimeToStr(time), alteracao, date);
    end
    else
      exit;
  end;
  BBtnSalvar.Enabled := false;
  BBtnExcluir.Enabled := false;
  BBtnPesquisar.Enabled := true;
  BBtnCancelar.Enabled := false;
  BBtnNovo.Enabled := true;
  Util.Desabilita_Campos(FrmCadastro_Cidade);
end;

procedure TFrmCadastro_Cidade.btnBuscarCodMunClick(Sender: TObject);
var
  pagina, lista, compara, Cidade: string;
begin
  pagina := IdHTTP1.Get
    ('http://www.ibge.gov.br/home/geociencias/areaterritorial/area.php?nome=jata%ED&codigo=&submit.x=0&submit.y=0');
  lista := Copy(pagina, Pos('<tr>', pagina), Length(pagina));
  lista := Copy(lista, 1, Pos('</table>', pagina) + Length('</table>') - 1);
   Memo1.Lines.Text := lista;
                     { TODO : INSERIR SERVICE WEB }


  // cidade := EdtCidade.Text;
//  while Pos('<td ', lista) <> 0 do
//  begin
//    lista := Copy(lista, Pos('<td ', lista), Length(lista));
////    lista := Copy(lista, Pos('</td> ', lista), Length(lista));
//    lista := Copy(lista, 1, Pos('</td> ', lista)-1);
//  end;
//  Memo1.Lines.Text := lista;
end;

function TFrmCadastro_Cidade.Confira: Boolean;
begin
  Confira := false;
  if CmbUF.Text = '' then
  begin
    Mensagem_Falta_Dados;
    CmbUF.SetFocus;
    abort;
  end;

  if EdtCidade.Text = '' then
  begin
    Mensagem_Falta_Dados;
    EdtCidade.SetFocus;
    abort;
  end;

  if EdtCodigo_Pais.Text = '' then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Pais.SetFocus;
    abort;
  end;

  Confira := true;
end;

procedure TFrmCadastro_Cidade.EdtCodigo_PaisDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Pais, FrmChama_Pais);
  FrmChama_Pais.ShowModal;
  FrmChama_Pais.Free;
end;

procedure TFrmCadastro_Cidade.EdtCodigo_PaisKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Pais, FrmChama_Pais);
    FrmChama_Pais.ShowModal;
    FrmChama_Pais.Free;
  end;
end;

procedure TFrmCadastro_Cidade.EdtCodigo_PaisKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Cidade.EdtPaisKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

{ procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
  begin
  case llEstado of
  Inserir: Habilita_Botao([false, true, false, true]);
  //Alterar: Habilita_Botao([false, true, false, true]);
  Consultar: Habilita_Botao([false, true, true, true]);
  end;
  end; }

procedure TFrmCadastro_Cidade.FormActivate(Sender: TObject);
begin
  ativo := true;
end;

procedure TFrmCadastro_Cidade.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
  begin
    Cancele;
    abort;
  end
  else
  begin
    FrmCadastro_Cidade.Free;
    FrmCadastro_Cidade := NIl;
  end;
end;

procedure TFrmCadastro_Cidade.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Cidade);
  Util.Limpa_Campos(FrmCadastro_Cidade);
  Util.Desabilita_Campos(FrmCadastro_Cidade);
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar,
    BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Cidade.FormDeactivate(Sender: TObject);
begin
  ativo := false;
end;

procedure TFrmCadastro_Cidade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_f2) then
  begin

  end;
  if (Key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Cidade.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0; // anula todas as teclas
    SelectNext(ActiveControl, true, true);
  end;
end;

procedure TFrmCadastro_Cidade.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text := DateToStr(date);
end;

procedure TFrmCadastro_Cidade.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Cidade.BBtnNovoClick;
begin
  Util.Habilita_Campos(FrmCadastro_Cidade);
  Util.Limpa_Campos(FrmCadastro_Cidade);
  BBtnSalvar.Enabled := true;
  BBtnExcluir.Enabled := false;
  BBtnPesquisar.Enabled := false;
  BBtnCancelar.Enabled := true;
  BBtnNovo.Enabled := false;
  achei := false;
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);
  EdtCidade.SetFocus;
end;

procedure TFrmCadastro_Cidade.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Cidade, FrmChama_Cidade);
  FrmChama_Cidade.ShowModal;
  FrmChama_Cidade.Release;
end;

end.
