unit UReceita;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids,
  DBGrids, UGeral, URegistro,
  ExtCtrls, Provider, DBClient, RSPrint, Buttons, StrUtils;

type
  TFrmCadastro_Receita = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ImgImagens_Comandos: TImageList;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    LblNome: TLabel;
    EdtProduto: TEdit;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnFechar: TToolButton;
    qryitens_receita: TADOQuery;
    ds_qry_itens_venda: TDataSource;
    qryreceita: TADOQuery;
    qryreceitaCodigo: TIntegerField;
    qryreceitaCodigo_Empresa: TIntegerField;
    qryreceitaCodigo_Funcionario: TIntegerField;
    qryreceitaCodigo_Cliente: TIntegerField;
    qryreceitaData_Emissao: TDateTimeField;
    qryreceitaN_Ordem: TStringField;
    qryreceitaModelo: TStringField;
    qryreceitaN_Serie: TStringField;
    qryreceitaCaixa: TStringField;
    qryreceitaNome_Nome_Fantasia: TStringField;
    qryreceitaNome: TStringField;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LblInsumo: TLabel;
    DBGrid1: TDBGrid;
    EdtInsumo: TEdit;
    EdtUnidade: TEdit;
    EdtQuantidade: TEdit;
    LblProd: TLabel;
    LblEstoque: TLabel;
    BBtnCancelar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnPesquisar: TToolButton;
    qryitens_receitaCodigo: TIntegerField;
    qryitens_receitaCodigo_Insumo: TIntegerField;
    qryitens_receitaUnidade: TStringField;
    qryitens_receitaQtde: TFloatField;
    qryitens_receitaDescricao: TStringField;
    qryitens_receitaEstoque: TFloatField;
    LblData_Cadastro: TLabel;
    MEdtData_Cadastro: TMaskEdit;
    LblTipo_Producao: TLabel;
    LblTipo_Producao2: TLabel;
    BbtnNovo: TToolButton;
    EdtIdProduto: TEdit;
    EdtIdInsumo: TEdit;
    BitBtn1: TBitBtn;
    qryitens_receitaCodigo_Produto: TAutoIncField;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Limpa_Menor;
    procedure EdtQuantidadeExit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Atualiza_Dados;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_FuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtQuantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ToolButton1Click(Sender: TObject);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure MEdtData_CadastroEnter(Sender: TObject);
    procedure BbtnNovoClick(Sender: TObject);
    procedure MEdtData_CadastroExit(Sender: TObject);
    procedure EdtIdProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtIdProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtIdInsumoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtIdInsumoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
  private
    R: URegistro.TReceita;
    IR: URegistro.TItens_Receita;
    Util: TUtil;
    qtde_itens: Integer;
    pode: Boolean;
    procedure Gera_Codigo;
    procedure Verifica_Produto_Lancado;
    procedure Verifica_Receita;
  public
    ativo, achei, iniciado, produto: Boolean;
    sequencial: Integer;
    Conexao: TADOConnection;
  protected
    function Confira_Pedido: Boolean;
    function Confira_Itens_Pedido: Boolean;
  end;

var
  FrmCadastro_Receita: TFrmCadastro_Receita;

implementation

uses UDM, UChama_Produto, UDeclaracao, URel_Fabricacao_Propria, UChama_Receita,
  Conexao.TConexao, Util.Mensagens, Util.TLog;

{$R *.dfm}
{ TFrmPadrao }

procedure TFrmCadastro_Receita.Atualiza_Dados;
begin
  with qryitens_receita, sql do
  begin
    close;
    clear;
    add('select IR.*, P.Codigo as Codigo_Produto, P.Descricao, P.Estoque from Itens_Receita IR');
    add('inner join Produto P on (IR.Codigo_Insumo = P.Codigo)');
    add('where IR.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value := EdtCodigo.Text;
    open;
  end;
end;

procedure TFrmCadastro_Receita.BBtnCancelarClick(Sender: TObject);
begin
  if (achei = false) then
    IR.Excluir_Tudo(IR, Conexao);
  Atualiza_Dados;
  Util.Limpa_Campos(FrmCadastro_Receita);
  Util.Desabilita_Campos(FrmCadastro_Receita);
  BBtnSalvar.Enabled := false;
  BBtnExcluir.Enabled := false;
  BBtnPesquisar.Enabled := true;
  BBtnCancelar.Enabled := false;
  BbtnNovo.Enabled := true;
  iniciado := false;
end;

procedure TFrmCadastro_Receita.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    R.Excluir(R, Conexao);
    IR.Excluir(IR, Conexao);
    BBtnSalvar.Enabled := false;
    Util.Desabilita_Campos(FrmCadastro_Receita);
  end;
end;

procedure TFrmCadastro_Receita.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmCadastro_Receita.BbtnNovoClick(Sender: TObject);
begin
  if (iniciado = true) then
  begin
    Mensagem_Venda_Andamento;
    abort;
  end;
  Util.Habilita_Campos(FrmCadastro_Receita);
  Util.Limpa_Campos(FrmCadastro_Receita);


  iniciado := true;
  BBtnSalvar.Enabled := true;
  BBtnExcluir.Enabled := false;
  BBtnPesquisar.Enabled := false;
  BBtnCancelar.Enabled := true;
  BbtnNovo.Enabled := false;
  achei := false;
  PageControl2.TabIndex := 0;

  Conexao := TConexao.NovaConexao(Conexao);
  TConexao.IniciaQuerys([qryitens_receita], Conexao);

  Gera_Codigo;
  EdtIdProduto.SetFocus;
  qryitens_receita.close;
  LblEstoque.Caption := '';
  Util.Inicia_Data(MEdtData_Cadastro, MEdtData_Cadastro);
end;

procedure TFrmCadastro_Receita.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Receita, FrmChama_Receita);
  FrmChama_Receita.ShowModal;
  FrmChama_Receita.Release;
end;

procedure TFrmCadastro_Receita.BBtnSalvarClick(Sender: TObject);
begin
  try
    Verifica_Receita;
    if (achei = false) then
    begin
      if (Confira_Pedido = true) then
      begin
        R.Inserir(R, Conexao);
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU RECEITA DO PRODUTO ' +
          EdtProduto.Text + '.', TimeToStr(time), insercao, date);
      end
      else
        exit;
    end
    else
    begin
      if (Confira_Pedido = true) then
      begin
        R.Alterar(R, Conexao);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU RECEITA DO PRODUTO ' +
          EdtProduto.Text + '.', TimeToStr(time), alteracao, date);
      end
      else
        exit;
    end;
    TConexao.ConfirmaConexao(Conexao);
    BBtnSalvar.Enabled := false;
    BBtnExcluir.Enabled := false;
    BBtnPesquisar.Enabled := true;
    BBtnCancelar.Enabled := false;
    BbtnNovo.Enabled := false;
    iniciado := false;
    Util.Desabilita_Campos(FrmCadastro_Receita);
  except
    on E: Exception do
    begin
      TMensagens.MensagemErro('Erro ao gravar receita: ' + E.Message);
      TLog.Error('Método BBtnSalvarClick Receita: ' + E.Message);
      TConexao.CancelaConexao(Conexao);
    end;
  end;

end;

procedure TFrmCadastro_Receita.BitBtn1Click(Sender: TObject);
begin
  Conexao := TConexao.NovaConexao(Conexao);
//  TConexao.IniciaQuerys([qryitens_receita], Conexao);
if (LblTipo_Producao2.Caption <> 'T') then
    begin
      Application.MessageBox
        ('Verifique se o insumo que deseja lançar é produzido por Terceiros',
        'Produto não encontrado', MB_OK + MB_ICONHAND);
      EdtIdInsumo.SetFocus;
      abort;
    end;

    Verifica_Produto_Lancado;
    if (Confira_Itens_Pedido) then
    begin
      IR.Inserir(IR, Conexao);
      Atualiza_Dados;
      Limpa_Menor;
      BBtnSalvar.Enabled := true;
    end;
end;

function TFrmCadastro_Receita.Confira_Itens_Pedido: Boolean;
begin
  Confira_Itens_Pedido := false;

  if (EdtIdInsumo.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtIdInsumo.SetFocus;
    abort;
  end;

  if (EdtQuantidade.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtQuantidade.SetFocus;
    abort;
  end;

  if (EdtUnidade.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtUnidade.SetFocus;
    abort;
  end;

  Confira_Itens_Pedido := true;
end;

function TFrmCadastro_Receita.Confira_Pedido: Boolean;
begin
  Confira_Pedido := false;

  if (EdtCodigo.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo.SetFocus;
    abort;
  end;

  if (EdtIdProduto.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtIdProduto.SetFocus;
    abort;
  end;

  if (MEdtData_Cadastro.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    MEdtData_Cadastro.SetFocus;
    abort;
  end;

  Confira_Pedido := true;
end;

procedure TFrmCadastro_Receita.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDBGrid(Sender).Canvas.font.Color := cor_fonte_dbgrid;
  // aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := cor_linha_dbgrid; // aqui é definida a cor do fundo
      FillRect(Rect);
    end;

  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[DataCol]
    .field, State)
end;

procedure TFrmCadastro_Receita.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_delete) then
  begin
    if (Confirma_Delete = true) then
    begin
      IR.Excluir(IR, Conexao);
      Atualiza_Dados;
      Limpa_Menor;
    end;
  end;
end;

procedure TFrmCadastro_Receita.EdtProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Receita.EdtIdProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_F3) then
  begin
    produto := true;
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free;
  end;
end;

procedure TFrmCadastro_Receita.EdtIdProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Receita.EdtIdInsumoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = vk_F3) then
  begin
    produto := false;
    Application.CreateForm(TFrmChama_Produto, FrmChama_Produto);
    FrmChama_Produto.ShowModal;
    FrmChama_Produto.Free;
  end;
end;

procedure TFrmCadastro_Receita.EdtIdInsumoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Receita.EdtCodigo_FuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(Key);
end;

procedure TFrmCadastro_Receita.EdtQuantidadeExit(Sender: TObject);
begin
  if (EdtQuantidade.Text = '') then
  begin
    Valor_Invalido;
    EdtQuantidade.SetFocus;
    abort;
  end
  else
  begin
    EdtQuantidade.Text := FormatFloat('#0.0,0', StrToFloat(EdtQuantidade.Text));
    EdtQuantidade.Text := StringReplace(EdtQuantidade.Text, ThousandSeparator,
      '', [rfReplaceAll]);
  end;
end;

procedure TFrmCadastro_Receita.EdtQuantidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    if (LblTipo_Producao2.Caption <> 'T') then
    begin
      Application.MessageBox
        ('Verifique se o insumo que deseja lançar é produzido por Terceiros',
        'Produto não encontrado', MB_OK + MB_ICONHAND);
      EdtIdInsumo.SetFocus;
      abort;
    end;

    Verifica_Produto_Lancado;
    if (Confira_Itens_Pedido) then
    begin
      IR.Inserir(IR, Conexao);
      Atualiza_Dados;
      Limpa_Menor;
      BBtnSalvar.Enabled := true;
    end;
  end;
end;

procedure TFrmCadastro_Receita.Verifica_Produto_Lancado;
begin
  if not qryitens_receita.IsEmpty then
  begin
    if (qryitens_receita.Locate('Codigo;Codigo_Insumo',
      VarArrayOf([StrToInt(EdtIdProduto.Text), StrToInt(EdtIdInsumo.text)]), []))
    then
    begin
      Produto_Ja_Lancamento_Venda;
      Limpa_Menor;
      EdtIdInsumo.SetFocus;
      abort;
    end;
  end;
end;

procedure TFrmCadastro_Receita.Verifica_Receita;
var
  qAux: TADOQuery;
begin
  if (LblTipo_Producao.Caption <> 'P') then
  begin
    Application.MessageBox
      ('Verifique se o produção que deseja produzir é de Produção Própria',
      'Produto não encontrado', MB_OK + MB_ICONHAND);
    EdtIdProduto.SetFocus;
    abort;
  end;

  qAux := TADOQuery.Create(self);
  try
    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('select R.Codigo, R.Codigo_Produto from Receita R');
      add('where R.Codigo_Produto = :Produto');
      Parameters.ParamByName('Produto').Value := StrToInt(LblProd.Caption);
      open;

      if (IsEmpty = false) then
      begin
        Application.MessageBox
          ('Já existe uma receita cadastrada para esse produto. Por favor, verifique.',
          'Receita encontrada', MB_OK + MB_ICONHAND);
        EdtIdProduto.SetFocus;
        abort;
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Receita.FormActivate(Sender: TObject);
begin
  ativo := true;
end;

procedure TFrmCadastro_Receita.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (iniciado = false) then
  begin
    FrmCadastro_Receita.Free;
    FrmCadastro_Receita := Nil;
  end
  else
  begin
    Salve;
    abort;
  end;
end;

procedure TFrmCadastro_Receita.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmCadastro_Receita);
  Util.Limpa_Campos(FrmCadastro_Receita);
  qtde_itens := 0;
  Util.Desabilita_Campos(FrmCadastro_Receita);
  PageControl2.TabIndex := 0;
  Centraliza_Form(FrmCadastro_Receita);
  qryitens_receita.close;
  LblEstoque.Caption := '';
  Util.IniciaHint(BbtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar,
    BBtnCancelar, BBtnFechar);
end;

procedure TFrmCadastro_Receita.FormDeactivate(Sender: TObject);
begin
  ativo := false;
end;

procedure TFrmCadastro_Receita.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_f2) then
  begin
    if (iniciado = true) then
    begin
      Mensagem_Venda_Andamento;
      abort;
    end;
    Util.Habilita_Campos(FrmCadastro_Receita);
    Util.Limpa_Campos(FrmCadastro_Receita);
    iniciado := true;
    BBtnSalvar.Enabled := true;
    BBtnExcluir.Enabled := false;
    BBtnPesquisar.Enabled := false;
    BBtnCancelar.Enabled := true;
    achei := false;
    PageControl2.TabIndex := 0;
    Gera_Codigo;
    MEdtData_Cadastro.SetFocus;
    qryitens_receita.close;
    LblEstoque.Caption := '';
  end;

  if (Key = vk_escape) then
    close;
end;

procedure TFrmCadastro_Receita.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0; // anula todas as teclas
    SelectNext(ActiveControl, true, true);
  end;
end;

procedure TFrmCadastro_Receita.Gera_Codigo;
var
  qAux: TADOQuery;
  codigo: Integer;
begin
  try
    qAux := TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('select max(Codigo) as Codigo from Receita');
      open;
    end;
    codigo := qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text := IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmCadastro_Receita.Limpa_Menor;
begin
  EdtIdInsumo.clear;
  EdtInsumo.clear;
  EdtUnidade.clear;
  EdtQuantidade.clear;
  LblInsumo.Caption := '';

  EdtIdInsumo.SetFocus;
end;

procedure TFrmCadastro_Receita.MEdtData_CadastroEnter(Sender: TObject);
begin
  MEdtData_Cadastro.Text := DateToStr(date);
end;

procedure TFrmCadastro_Receita.MEdtData_CadastroExit(Sender: TObject);
begin
  Util.Verifica_Data(MEdtData_Cadastro);
end;

procedure TFrmCadastro_Receita.ToolButton1Click(Sender: TObject);
begin
  try
    if (Confirma_Exclusao) then
    begin
      R.Excluir(R, Conexao);
      IR.Excluir_Tudo(IR, Conexao);
      UDeclaracao.Insere_Historico(usuario, 'EXCLUIU RECEITA DO PRODUTO ' +
        EdtProduto.Text + '.', TimeToStr(time), exclusao, date);
      TConexao.ConfirmaConexao(Conexao);
      BBtnSalvar.Enabled := false;
      BBtnExcluir.Enabled := false;
      BBtnPesquisar.Enabled := true;
      BBtnCancelar.Enabled := false;
      BbtnNovo.Enabled := true;
      Util.Desabilita_Campos(FrmCadastro_Receita);
    end;
  except
    on E: Exception do
    begin
      TMensagens.MensagemErro('Erro ao excluir receita.' + E.Message);
      TLog.Error('Método BBtnExcluirClick Excluir Cliente: ' + E.Message);
      TConexao.CancelaConexao(Conexao);
    end;
  end;

end;

end.
