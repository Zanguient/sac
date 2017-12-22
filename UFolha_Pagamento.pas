unit UFolha_Pagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  ExtCtrls, Provider, DBClient, RSPrint, Buttons, StrUtils;

type
  TFrmFolha_Pagamento = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ImgImagens_Comandos: TImageList;
    LblCodigo: TLabel;
    EdtCodigo: TEdit;
    MEdtMes_Ano: TMaskEdit;
    LblData_Cadastro: TLabel;
    Label2: TLabel;
    MEdtData_Fechamento: TMaskEdit;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Label5: TLabel;
    EdtCodigo_Item: TEdit;
    EdtItem: TEdit;
    Label6: TLabel;
    EdtNatureza: TEdit;
    Label8: TLabel;
    EdtValor: TEdit;
    Edit2: TEdit;
    EdtEntradas: TEdit;
    EdtSaidas: TEdit;
    Edit4: TEdit;
    EdtDesconto: TEdit;
    Edit8: TEdit;
    Edit5: TEdit;
    EdtSalario: TEdit;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    BalloonHint1: TBalloonHint;
    qryfolha: TADOQuery;
    qryfolhaCodigo: TAutoIncField;
    qryfolhaN_Pedido: TStringField;
    qryfolhaCodigo_Cliente: TIntegerField;
    qryfolhaCodigo_Condicao_Pagamento: TIntegerField;
    qryfolhaOutras_Despesas: TFloatField;
    qryfolhaTipo_Frete: TStringField;
    qryfolhaValor_Frete: TFloatField;
    qryfolhaData_Venda: TDateTimeField;
    qryfolhaData_Previsao_Entrega: TDateTimeField;
    qryfolhaQtde_Itens: TIntegerField;
    qryfolhaTotal_Produtos: TFloatField;
    qryfolhaPeso_Total: TFloatField;
    qryfolhaDesconto: TFloatField;
    qryfolhaTotal_Pedido: TFloatField;
    qryfolhaObservacoes: TStringField;
    qryfolhaTipo: TStringField;
    qryfolhaStatus: TStringField;
    qryfolhaHora_Entrega: TStringField;
    qAux: TADOQuery;
    qAux2: TADOQuery;
    rs: TRSPrinter;
    LblCPF: TLabel;
    LblEndereco: TLabel;
    LblSetor: TLabel;
    LblTelefone: TLabel;
    LblCidade: TLabel;
    LblUF: TLabel;
    LblTipo_Logradouro: TLabel;
    LblNumero: TLabel;
    BBtnImprimir: TToolButton;
    Label10: TLabel;
    MmoObservacao: TMemo;
    Label14: TLabel;
    EdtCodigo_Funcionario: TEdit;
    EdtFuncionario: TEdit;
    LblPedido: TLabel;
    qryitens_folha: TADOQuery;
    ds_qry_itens_compra: TDataSource;
    Edit1: TEdit;
    EdtComissao: TEdit;
    qryitens_folhaCodigo: TIntegerField;
    qryitens_folhaCodigo_Item: TIntegerField;
    qryitens_folhaValor: TFloatField;
    qryitens_folhaDescricao: TStringField;
    qryitens_folhaNatureza: TStringField;
    Edit3: TEdit;
    EdtQuantidade_Itens: TEdit;
    BBtnPesquisar: TToolButton;
    Label1: TLabel;
    EdtCodigo_Empresa: TEdit;
    EdtEmpresa: TEdit;
    BbtnNovo: TToolButton;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure MEdtMes_AnoEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Escreve_Texto;
    procedure MEdtData_FechamentoEnter(Sender: TObject);
    procedure EdtCodigo_ItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Gera_N_Pedido(Conexao: TADOConnection);
    procedure Limpa_Menor;
    procedure Calcula_Total;
    procedure Calcula_Total_Deletado;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function Chama_Folha: boolean;
    procedure Ver_Folha;
    procedure EdtCodigo_FuncionarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtDescontoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EdtCodigo_FuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ItemKeyPress(Sender: TObject; var Key: Char);
    procedure EdtItemKeyPress(Sender: TObject; var Key: Char);
    procedure EdtNaturezaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtValorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_ItemDblClick(Sender: TObject);
    procedure EdtCodigo_FuncionarioDblClick(Sender: TObject);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure EdtCodigo_EmpresaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BbtnNovoClick(Sender: TObject);
  private
    Folha: URegistro.TFolha_Pagamento;
    Itens_Folha: URegistro.TItens_Folha_Pagamento;
    Util: TUtil;
    qtde_itens: integer;

    procedure Inicia_Query_Conexao(Conexao: TADOConnection);
    var
      codigo: integer;
  public
    ativo, achei: boolean;
    tipo: string;
    Conexao: TADOConnection;

    procedure Cria_Conexao;
    procedure Atualiza_Dados;
  protected
    function Confira_Folha: boolean;
    function Confira_Itens_Folha: boolean;
  end;

var
  FrmFolha_Pagamento: TFrmFolha_Pagamento;
implementation

Uses UDM, UDeclaracao, UChama_Funcionario, UChama_Itens_Folha,
  URel_Folha_Pagamento, UChama_Folha_Pagamento, UChama_Empresa;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmFolha_Pagamento.Atualiza_Dados;
begin
  with qryitens_folha, sql do
  begin
    close;
    clear;
    add('select IFP.*, IFF.Descricao, IFF.Natureza from Itens_Folha_Pagamento IFP');
    add('inner join Itens_Folha IFF on (IFP.Codigo_Item = IFF.Codigo)');
    add('where IFP.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;
end;

procedure TFrmFolha_Pagamento.BBtnCancelarClick(Sender: TObject);
begin
  //if (qryitens_folha.IsEmpty = false) then
    //Itens_Folha.Excluir_Tudo(Itens_Folha);

  Util.Limpa_Campos(FrmFolha_Pagamento);
  Escreve_Texto;
  Util.Desabilita_Campos(FrmFolha_Pagamento);
  Cancela_Transacao(Conexao);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  BBtnCancelar.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnNovo.Enabled:= true;
end;

procedure TFrmFolha_Pagamento.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    Folha.Excluir(Folha, Conexao);
    Itens_Folha.Excluir_Tudo(Itens_Folha, Conexao);
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU FOLHA DE PAGAMENTO.', TimeToStr(time), exclusao, date);
    Confirma_Transacao(Conexao);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnImprimir.Enabled:= false;
    BBtnCancelar.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmFolha_Pagamento);
  end;
end;

procedure TFrmFolha_Pagamento.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmFolha_Pagamento.BBtnImprimirClick(Sender: TObject);
begin
  FrmRel_Folha_Pagamento:= TFrmRel_Folha_Pagamento.Create(self);
  FrmRel_Folha_Pagamento.Release;
  FrmRel_Folha_Pagamento:= Nil;
end;

procedure TFrmFolha_Pagamento.BbtnNovoClick(Sender: TObject);
begin
  Cria_Conexao;
  qryitens_folha.Close;
  Util.Habilita_Campos(FrmFolha_Pagamento);
  Util.Limpa_Campos(FrmFolha_Pagamento);
  Escreve_Texto;
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnImprimir.Enabled:= false;
  BBtnCancelar.Enabled:= true;
  BBtnPesquisar.Enabled:= false;
  BBtnNovo.Enabled:= false;
  achei:= false;
  Gera_N_Pedido(Conexao);
  PageControl2.TabIndex:= 0;
  MEdtMes_Ano.SetFocus;
  EdtCodigo_Empresa.Text:= IntToStr(codigo_empresa);
  EdtEmpresa.Text:= nome_fantasia;
  //MEdtData_Cadastro.SetFocus;
end;

procedure TFrmFolha_Pagamento.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Folha_Pagamento, FrmChama_Folha_Pagamento);
  FrmChama_Folha_Pagamento.ShowModal;
  FrmChama_Folha_Pagamento.Release;
end;

procedure TFrmFolha_Pagamento.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira_Folha = true) then
      BEGIN
        Folha.Inserir(Folha, Conexao);
        UDeclaracao.Insere_Historico(usuario, 'CADASTROU FOLHA DE PAGAMENTO.', TimeToStr(time), insercao, date);
      END
      else
        exit;
    end
    else
    begin
      if (Confira_Folha = true) then
      BEGIN
        Folha.Alterar(Folha, Conexao);
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU FOLHA DE PAGAMENTO.', TimeToStr(time), alteracao, date);
      END
      else
        exit;
    end;
    Confirma_Transacao(Conexao);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnImprimir.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnNovo.Enabled:= true;
    Util.Desabilita_Campos(FrmFolha_Pagamento);
end;

procedure TFrmFolha_Pagamento.Calcula_Total;
var
  sub_total, entradas, saidas, comissao, desconto, salario, fim: double;
begin
  sub_total:= StrToFloat(EdtValor.Text);
  entradas:= StrToFloat(EdtEntradas.Text);
  saidas:= StrToFloat(EdtSaidas.Text);
  comissao:= StrToFloat(EdtComissao.Text);
  desconto:= StrToFloat(EdtDesconto.Text);
  salario:= StrToFloat(EdtSalario.Text);

  qtde_itens:= StrToInt(EdtQuantidade_Itens.Text);
  Inc(qtde_itens);
  EdtQuantidade_Itens.Text:= IntToStr(qtde_itens);

  if (EdtNatureza.Text = 'ENTRADA') then
  begin
    entradas:= entradas + sub_total;
    salario:= salario + sub_total;

    EdtSalario.Text:= FormatFloat('#0.0,0', salario);
    EdtSalario.Text:= StringReplace(EdtSalario.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtEntradas.Text:= FormatFloat('#0.0,0', entradas);
    EdtEntradas.Text:= StringReplace(EdtEntradas.Text, ThousandSeparator, '', [rfReplaceAll]);
  end
  else
  begin
    saidas:= saidas + sub_total;
    salario:= salario - sub_total;

    EdtSalario.Text:= FormatFloat('#0.0,0', salario);
    EdtSalario.Text:= StringReplace(EdtSalario.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtSaidas.Text:= FormatFloat('#0.0,0', saidas);
    EdtSaidas.Text:= StringReplace(EdtSaidas.Text, ThousandSeparator, '', [rfReplaceAll]);
  end;

end;

procedure TFrmFolha_Pagamento.Calcula_Total_Deletado;
var
  sub_total, entradas, saidas, comissao, desconto, salario, fim: double;
begin
  sub_total:= qryitens_folhaValor.AsFloat;
  entradas:= StrToFloat(EdtEntradas.Text);
  saidas:= StrToFloat(EdtSaidas.Text);
  comissao:= StrToFloat(EdtComissao.Text);
  desconto:= StrToFloat(EdtDesconto.Text);
  salario:= StrToFloat(EdtSalario.Text);

  qtde_itens:= StrToInt(EdtQuantidade_Itens.Text);
  Dec(qtde_itens);
  EdtQuantidade_Itens.Text:= IntToStr(qtde_itens);

  if (qryitens_folhaNatureza.AsString = 'ENTRADA') then
  begin
    entradas:= entradas - sub_total;
    salario:= salario - sub_total;

    EdtSalario.Text:= FormatFloat('#0.0,0', salario);
    EdtSalario.Text:= StringReplace(EdtSalario.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtEntradas.Text:= FormatFloat('#0.0,0', entradas);
    EdtEntradas.Text:= StringReplace(EdtEntradas.Text, ThousandSeparator, '', [rfReplaceAll]);
  end
  else
  begin
    saidas:= saidas - sub_total;
    salario:= salario + sub_total;

    EdtSalario.Text:= FormatFloat('#0.0,0', salario);
    EdtSalario.Text:= StringReplace(EdtSalario.Text, ThousandSeparator, '', [rfReplaceAll]);

    EdtSaidas.Text:= FormatFloat('#0.0,0', saidas);
    EdtSaidas.Text:= StringReplace(EdtSaidas.Text, ThousandSeparator, '', [rfReplaceAll]);
  end;

end;

function TFrmFolha_Pagamento.Chama_Folha: boolean;
begin
  with qAux, sql do
  begin
    close;
    clear;
    add('Select FP.*, Fun.Nome from Folha_Pagamento FP');
    add('inner join Funcionario Fun on (FP.Codigo_Funcionario = Fun.Codigo)');
    add('where FP.Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value:= StrToInt(EdtCodigo.Text);
    open;
  end;

  if (qAux.IsEmpty = false) then
    Result:= true
  else
    Result:= false;
end;

function TFrmFolha_Pagamento.Confira_Itens_Folha: boolean;
begin
  Confira_Itens_Folha:= false;

  if (EdtCodigo_Item.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Item.SetFocus;
    abort;
  end;

  if (EdtValor.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtValor.SetFocus;
    abort;
  end;

  Confira_Itens_Folha:= true;
end;

procedure TFrmFolha_Pagamento.Cria_Conexao;
begin
  try
    Conexao:= TADOConnection.Create(self);
    UGeral.Abre_Conexao(Conexao);
    SetUncommitted(Conexao);
    Inicia_Transacao(Conexao);
    Inicia_Query_Conexao(Conexao);
  except on e:Exception do
  begin
    ShowMessage('Erro ao abrir conexão com banco de dados. '+e.Message);
    abort;
  end;
  end;
end;

procedure TFrmFolha_Pagamento.Inicia_Query_Conexao(Conexao: TADOConnection);
begin
  qryfolha.Connection:= Conexao;
  qryitens_folha.Connection:= Conexao;
  qAux.Connection:= Conexao;
  qAux2.Connection:= Conexao;
end;

function TFrmFolha_Pagamento.Confira_Folha: boolean;
begin
  Confira_Folha:= false;

  if (EdtCodigo.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo.SetFocus;
    abort;
  end;

  if (EdtCodigo_Empresa.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Empresa.SetFocus;
    abort;
  end;

  if (MEdtMes_Ano.Text = '  /    ') then
  begin
    Mensagem_Falta_Dados;
    MEdtMes_Ano.SetFocus;
    abort;
  end;

  if (MEdtData_Fechamento.Text = '  /  /    ') then
  begin
    Mensagem_Falta_Dados;
    MEdtData_Fechamento.SetFocus;
    abort;
  end;

  if (EdtCodigo_Funcionario.Text = '') then
  begin
    Mensagem_Falta_Dados;
    EdtCodigo_Funcionario.SetFocus;
    abort;
  end;

  Confira_Folha:= true;
end;

procedure TFrmFolha_Pagamento.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= cor_fonte_dbgrid; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:= cor_linha_dbgrid; //aqui é definida a cor do fundo
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State)

end;

procedure TFrmFolha_Pagamento.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_delete) then
  begin
    if (Confirma_Delete = true) then
      begin
        Itens_Folha.Excluir(Itens_Folha, Conexao);
        Calcula_Total_Deletado;
        Atualiza_Dados;
      end;
  end;
end;

procedure TFrmFolha_Pagamento.EdtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    if (Chama_Folha) then
    begin
      Ver_Folha;
      Atualiza_Dados;
      achei:= true;
    end
    else
    begin
      Nao_Selecionado;
      EdtCodigo.SetFocus;
      achei:= false;
    end;
  end;
end;

procedure TFrmFolha_Pagamento.EdtCodigo_EmpresaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Empresa, FrmChama_Empresa);
    FrmChama_Empresa.ShowModal;
    FrmChama_Empresa.Free;
  end;
end;

procedure TFrmFolha_Pagamento.EdtCodigo_FuncionarioDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Funcionario, FrmChama_Funcionario);
  FrmChama_Funcionario.ShowModal;
  FrmChama_Funcionario.Free;
end;

procedure TFrmFolha_Pagamento.EdtCodigo_FuncionarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Funcionario, FrmChama_Funcionario);
    FrmChama_Funcionario.ShowModal;
    FrmChama_Funcionario.Free;
  end;
end;

procedure TFrmFolha_Pagamento.EdtCodigo_FuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmFolha_Pagamento.EdtCodigo_ItemDblClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Itens_Folha, FrmChama_Itens_Folha);
  FrmChama_Itens_Folha.ShowModal;
  FrmChama_Itens_Folha.Free;
end;

procedure TFrmFolha_Pagamento.EdtCodigo_ItemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    Application.CreateForm(TFrmChama_Itens_Folha, FrmChama_Itens_Folha);
    FrmChama_Itens_Folha.ShowModal;
    FrmChama_Itens_Folha.Free;
  end;
end;

procedure TFrmFolha_Pagamento.EdtCodigo_ItemKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmFolha_Pagamento.EdtDescontoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  desconto, salario: double;
begin
  if (key = vk_return) then
  begin
    salario:= StrToFloat(EdtSalario.Text);
    desconto:= salario - desconto;
    EdtSalario.Text:= FormatFloat('#0.0,0', desconto);
    EdtSalario.Text:= StringReplace(EdtSalario.Text, ThousandSeparator, '', [rfReplaceAll]);
  end;
end;

procedure TFrmFolha_Pagamento.EdtFuncionarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmFolha_Pagamento.EdtItemKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmFolha_Pagamento.EdtNaturezaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmFolha_Pagamento.EdtValorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    if (EdtValor.Text = '') or (EdtValor.Text = '0') or (EdtValor.Text = '0,00') then
    begin
      Mensagem_Falta_Dados;
      EdtValor.SetFocus;
      abort;
    end;
    EdtValor.Text:= FormatFloat('#0.0,0', StrToFloat(EdtValor.Text));
    EdtValor.Text:= StringReplace(EdtValor.Text, ThousandSeparator, '', [rfReplaceAll]);

    if (Confira_Itens_Folha) then
    begin
      Itens_Folha.Inserir(Itens_Folha, Conexao);
      Atualiza_Dados;
      Calcula_Total;
      Limpa_Menor;
      BBtnSalvar.Enabled:= true;
      BBtnCancelar.Enabled:= true;
    end;
  end;
end;

procedure TFrmFolha_Pagamento.Escreve_Texto;
begin
  Edit3.Text:= 'Qtde. Itens';
  Edit2.Text:= 'Entradas';
  Edit4.Text:= 'Saidas';
  Edit1.Text:= 'Comissão';
  Edit8.Text:= 'Desconto';
  Edit5.Text:= 'Salário';
  EdtQuantidade_Itens.Text:= '0';
  EdtEntradas.Text:= '0,00';
  EdtSaidas.Text:= '0,00';
  EdtComissao.Text:= '0,00';
  EdtDesconto.Text:= '0,00';
  EdtSalario.Text:= '0,00';
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmFolha_Pagamento.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmFolha_Pagamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmFolha_Pagamento.Free;
        FrmFolha_Pagamento:= Nil;
      end;
end;

procedure TFrmFolha_Pagamento.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmFolha_Pagamento);
  Util.Limpa_Campos(FrmFolha_Pagamento);
  Escreve_Texto;
  qtde_itens:= 0;
  Util.Desabilita_Campos(FrmFolha_Pagamento);
  PageControl2.TabIndex:= 0;
  qryitens_folha.Close;
  Util.IniciaHint(BBtnNovo, BBtnSalvar, BBtnExcluir, BBtnPesquisar, BBtnCancelar, BBtnFechar);

  //Centraliza_Form(FrmCompra);
end;

procedure TFrmFolha_Pagamento.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmFolha_Pagamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin

    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmFolha_Pagamento.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmFolha_Pagamento.Gera_N_Pedido(Conexao: TADOConnection);
var
  qAux, qAux2: TADOQuery;
  n_pedido: integer;
begin
  try
    qAux:= TADOQuery.Create(self);
    qAux2:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= Conexao;
      clear;
      add('select max(Codigo) as Codigo from Folha_Pagamento ');
      open;
    end;
    codigo:= qAux.FieldByName('Codigo').AsInteger + 1;
    EdtCodigo.Text:= IntToStr(codigo);
  finally
    FreeAndNil(qAux);
  end;
end;

procedure TFrmFolha_Pagamento.Limpa_Menor;
begin
  EdtCodigo_Item.Clear;
  EdtItem.Clear;
  EdtNatureza.Clear;
  EdtValor.Clear;
  EdtCodigo_Item.SetFocus;
end;

procedure TFrmFolha_Pagamento.MEdtData_FechamentoEnter(Sender: TObject);
begin
  MEdtData_Fechamento.Text:= DateToStr(date);
end;

procedure TFrmFolha_Pagamento.MEdtMes_AnoEnter(Sender: TObject);
begin
  MEdtMes_Ano.Text:= FormatDateTime('MM/YYYY', date);
end;

procedure TFrmFolha_Pagamento.Ver_Folha;
begin
  EdtCodigo.Text:= qAux.FieldByName('Codigo').AsString;

  MEdtMes_Ano.Text:= qAux.FieldByName('Mes_Ano').AsString;
  MEdtData_Fechamento.Text:= qAux.FieldByName('Data_Fechamento').AsString;

  EdtCodigo_Funcionario.Text:= qAux.FieldByName('Codigo_Funcionario').AsString;
  EdtFuncionario.Text:= qAux.FieldByName('Nome').AsString;
  MMOObservacao.Text:= qAux.FieldByName('Observacao').AsString;

  EdtQuantidade_Itens.Text:= qAux.FieldByName('Quantidade_Itens').AsString;

  EdtEntradas.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Entradas').AsFloat);
  EdtEntradas.Text:= StringReplace(EdtEntradas.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtSaidas.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Saidas').AsFloat);
  EdtSaidas.Text:= StringReplace(EdtSaidas.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtComissao.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Comissao').AsFloat);
  EdtComissao.Text:= StringReplace(EdtComissao.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtDesconto.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Desconto').AsFloat);
  EdtDesconto.Text:= StringReplace(EdtDesconto.Text, ThousandSeparator, '', [rfReplaceAll]);

  EdtSalario.Text:= FormatFloat('#0.0,0', qAux.FieldByName('Salario').AsFloat);
  EdtSalario.Text:= StringReplace(EdtSalario.Text, ThousandSeparator, '', [rfReplaceAll]);

  with qAux2, sql do
  begin
    close;
    clear;
    add('select Fun.*, Ci.Descricao, Ci.UF, Se.Descricao, Car.Descricao, Dep.Descricao, L.Descricao, L.Tipo_Logradouro, L.CEP from Funcionario Fun');
    add('left join Cidade Ci on (Fun.Codigo_Cidade = Ci.Codigo)');
    add('left join Setor Se on (Fun.Codigo_Setor = Se.Codigo)');
    add('left join Cargo Car on (Fun.Codigo_Cargo = Car.Codigo)');
    add('left join Departamento Dep on (Fun.Codigo_Departamento = Dep.Codigo)');
    add('left join Logradouro L on (Fun.Codigo_Logradouro = L.Codigo)');
    add('where Fun.Codigo = :Funcionario');
    Parameters.ParamByName('Funcionario').Value:= StrToInt(EdtCodigo_Funcionario.Text);
    open;
  end;

  LblCPF.Caption:= qAux2.FieldByName('CPF').AsString;
  LblCidade.Caption:= qAux2.FieldByName('Descricao').AsString;
  LblSetor.Caption:= qAux2.FieldByName('Descricao_1').AsString;
  LblEndereco.Caption:= qAux2.FieldByName('Descricao_4').AsString;
  LblUF.Caption:= qAux2.FieldByName('UF').AsString;
  LblTipo_Logradouro.Caption:= qAux2.FieldByName('Tipo_Logradouro').AsString;
  LblNumero.Caption:= qAux2.FieldByName('Numero').AsString;
  LblTelefone.Caption:= qAux2.FieldByName('Telefone').AsString;

  BBtnSalvar.Enabled:= true;
  BBtnImprimir.Enabled:= true;
  BBtnExcluir.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmFolha_Pagamento.EdtValorKeyPress(Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero_Virgula(key);
end;

end.
