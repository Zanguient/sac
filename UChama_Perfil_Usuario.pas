unit UChama_Perfil_Usuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB, UGeral,
  ADODB, UConsulta, UCadastro_Cliente;

type
  TFrmChama_Perfil_Usuario = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    RGOrdena_Por: TRadioGroup;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    LblMarca: TLabel;
    qrychama_perfil: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    qrychama_perfilCodigo: TIntegerField;
    qrychama_perfilPerfil: TStringField;
    qrychama_perfilCodigo_Empresa: TIntegerField;
    qrychama_perfilAdicao_Aliquota_Tributaria: TIntegerField;
    qrychama_perfilAltera_Simbolo_Moeda: TIntegerField;
    qrychama_perfilHorario_Verao: TIntegerField;
    qrychama_perfilPrograma_Arredondamento: TIntegerField;
    qrychama_perfilPrograma_Truncamento: TIntegerField;
    qrychama_perfilCadastro_Empresa: TIntegerField;
    qrychama_perfilCadastro_Produto: TIntegerField;
    qrychama_perfilCadastro_Grupo_Produto: TIntegerField;
    qrychama_perfilCadastro_Unidade_Medida: TIntegerField;
    qrychama_perfilCadastro_Localidade: TIntegerField;
    qrychama_perfilCadastro_Tabela_Preco: TIntegerField;
    qrychama_perfilCadastro_Receita: TIntegerField;
    qrychama_perfilCadastro_Fornecedor: TIntegerField;
    qrychama_perfilCadastro_Transportadora: TIntegerField;
    qrychama_perfilCadastro_CFOP: TIntegerField;
    qrychama_perfilCadastro_Situacao_Tributaria: TIntegerField;
    qrychama_perfilCadastro_Cliente: TIntegerField;
    qrychama_perfilCadastro_Grupo_Cliente: TIntegerField;
    qrychama_perfilCadastro_Funcionario: TIntegerField;
    qrychama_perfilCadastro_Cargo: TIntegerField;
    qrychama_perfilCadastro_Departamento: TIntegerField;
    qrychama_perfilCadastro_Tipo_Documento: TIntegerField;
    qrychama_perfilCadastro_Plano_Financeiro: TIntegerField;
    qrychama_perfilCadastro_Banco: TIntegerField;
    qrychama_perfilCadastro_Conta_Corrente: TIntegerField;
    qrychama_perfilCadastro_Operacao_Bancaria: TIntegerField;
    qrychama_perfilCadastro_Condicao_Pagamento: TIntegerField;
    qrychama_perfilCadastro_Itens_Folha_Pagamento: TIntegerField;
    qrychama_perfilCadastro_Cidade: TIntegerField;
    qrychama_perfilCadastro_Setor: TIntegerField;
    qrychama_perfilCadastro_Logradouro: TIntegerField;
    qrychama_perfilCadastro_Pais: TIntegerField;
    qrychama_perfilCadastro_Veiculo: TIntegerField;
    qrychama_perfilCadastro_Marca: TIntegerField;
    qrychama_perfilCadastro_Regra_ICMS: TIntegerField;
    qrychama_perfilCadastro_Tratamento_ICMS: TIntegerField;
    qrychama_perfilCadastro_Observacao_Fiscal: TIntegerField;
    qrychama_perfilCadastro_Regra_PIS: TIntegerField;
    qrychama_perfilCadastro_Tratamento_PIS: TIntegerField;
    qrychama_perfilCadastro_Regra_COFINS: TIntegerField;
    qrychama_perfilCadastro_Tratamento_COFINS: TIntegerField;
    qrychama_perfilCadastro_Regra_IPI: TIntegerField;
    qrychama_perfilCadastro_Tratamento_IPI: TIntegerField;
    qrychama_perfilCadastro_NCM: TIntegerField;
    qrychama_perfilCadastro_Regra_ISSQN: TIntegerField;
    qrychama_perfilCadastro_Perfil_Usuario: TIntegerField;
    qrychama_perfilMov_Entrada_Produto: TIntegerField;
    qrychama_perfilMov_Pedido_Producao: TIntegerField;
    qrychama_perfilMov_Fechamento_Estoque: TIntegerField;
    qrychama_perfilMov_Lancamento_Manual: TIntegerField;
    qrychama_perfilMov_Cupom_Fiscal: TIntegerField;
    qrychama_perfilMov_Gerar_DAV: TIntegerField;
    qrychama_perfilMov_Reimpressao_DAV: TIntegerField;
    qrychama_perfilAbertura_Caixa: TIntegerField;
    qrychama_perfilSuprimento: TIntegerField;
    qrychama_perfilSangria: TIntegerField;
    qrychama_perfilRecebimento: TIntegerField;
    qrychama_perfilLancamento_Financeiro: TIntegerField;
    qrychama_perfilBaixar_Titulo: TIntegerField;
    qrychama_perfilLancamento_Bancario: TIntegerField;
    qrychama_perfilConciliacao: TIntegerField;
    qrychama_perfilCheque: TIntegerField;
    qrychama_perfilBaixar_Cheque: TIntegerField;
    qrychama_perfilFolha_Pagamento: TIntegerField;
    qrychama_perfilConsulta_Posicao_Estoque: TIntegerField;
    qrychama_perfilConsulta_Reposicao_Estoque: TIntegerField;
    qrychama_perfilConsulta_Saldo_Estoque: TIntegerField;
    qrychama_perfilConsulta_Entrada: TIntegerField;
    qrychama_perfilConsulta_Venda: TIntegerField;
    qrychama_perfilConsulta_Ordem_Servico: TIntegerField;
    qrychama_perfilConsulta_Lancamento_Financeiro: TIntegerField;
    qrychama_perfilConsulta_Conta_Fixa: TIntegerField;
    qrychama_perfilConsulta_Folha_Pagamento: TIntegerField;
    qrychama_perfilConsulta_Lancamento_Bancario: TIntegerField;
    qrychama_perfilConsulta_Cheque: TIntegerField;
    qrychama_perfilConsulta_Saldo_Bancario: TIntegerField;
    qrychama_perfilConsulta_Acerto_Caixa: TIntegerField;
    qrychama_perfilConfiguracao_Sistema: TIntegerField;
    qrychama_perfilHistorico: TIntegerField;
    qrychama_perfilAcerto_Caixa: TIntegerField;
    qrychama_perfilAltera_Caixa: TIntegerField;
    qrychama_perfilConsulta_Fechamento_Caixa: TIntegerField;
    qrychama_perfilRevalida_Sistema: TIntegerField;
    qrychama_perfilConsulta_Lucro_Produto: TIntegerField;
    qrychama_perfilConsulta_Lucro_Grupo: TIntegerField;
    qrychama_perfilConsulta_Lucro_Marca: TIntegerField;
    qrychama_perfilMapa_Resumo: TIntegerField;
    qrychama_perfilCadastro_Etiqueta: TIntegerField;
    qrychama_perfilGera_Etiqueta_Cliente: TIntegerField;
    qrychama_perfilGera_Etiqueta_Produto: TIntegerField;
    qrychama_perfilInventario_Estoque: TIntegerField;
    qrychama_perfilAgenda_Telefonica: TIntegerField;
    qrychama_perfilAlteracao_Produto: TIntegerField;
    qrychama_perfilContagem_Estoque: TIntegerField;
    qrychama_perfilConsulta_Historico_Movimentacao: TIntegerField;
    qrychama_perfilMov_NFe: TIntegerField;
    qrychama_perfilCadastro_Status: TIntegerField;
    qrychama_perfilCadastro_Tipo_Ocorrencia: TIntegerField;
    qrychama_perfilRegistro_Ocorrencia: TIntegerField;
    qrychama_perfilConsulta_Ocorrencia: TIntegerField;
    qrychama_perfilCadastro_Tipo_Bem: TIntegerField;
    qrychama_perfilCadastro_Patrimonio: TIntegerField;
    qrychama_perfilConsulta_Patrimonio: TIntegerField;
    qrychama_perfilConsulta_Ficha_Cliente: TIntegerField;
    qrychama_perfilConsulta_Tabela_Preco: TIntegerField;
    qrychama_perfilOcorrencia_Cobranca: TIntegerField;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure Chama_Itens;
  public
    { Public declarations }
  end;

var
  FrmChama_Perfil_Usuario: TFrmChama_Perfil_Usuario;
  Util: TUtil;
  Consulta: TConsulta;
implementation

uses UDM, UCadastro_Perfil_Usuario, UDeclaracao, UMenu_Geral, UCadastro_Usuario,
  UCadastro_Funcionarios;

{$R *.dfm}

procedure TFrmChama_Perfil_Usuario.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Perfil_Usuario.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Perfil_Usuario;
end;

procedure TFrmChama_Perfil_Usuario.Chama_Itens;
var
  i: integer;
begin
  //Funções ECF
  if (qrychama_perfilAdicao_Aliquota_Tributaria.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Funções ECF').Item[0].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.treeview1, 'Funções ECF').Item[0].StateIndex := 2;
  end;

  if (qrychama_perfilAltera_Simbolo_Moeda.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Funções ECF').Item[1].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Funções ECF').Item[1].StateIndex := 2;
  end;

  if (qrychama_perfilHorario_Verao.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Funções ECF').Item[2].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Funções ECF').Item[2].StateIndex := 2;
  end;

  if (qrychama_perfilPrograma_Arredondamento.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Funções ECF').Item[3].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Funções ECF').Item[3].StateIndex := 2;
  end;

  if (qrychama_perfilPrograma_Truncamento.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Funções ECF').Item[4].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Funções ECF').Item[4].StateIndex := 2;
  end;

  if (qrychama_perfilMapa_Resumo.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Funções ECF').Item[5].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Funções ECF').Item[5].StateIndex := 2;
  end;



  //Cadastros
  if (qrychama_perfilCadastro_Empresa.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[0].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[0].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Produto.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[1].Item[0].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[1].Item[0].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Grupo_Produto.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[1].Item[1].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[1].Item[1].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Unidade_Medida.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[1].Item[2].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[1].Item[2].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Localidade.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[1].Item[3].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[1].Item[3].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Tabela_Preco.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[1].Item[4].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[1].Item[4].StateIndex := 2;
  end;

  if (qrychama_perfilAlteracao_Produto.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[1].Item[5].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[1].Item[5].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Receita.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[2].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[2].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Fornecedor.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[3].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[3].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Transportadora.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[4].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[4].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_CFOP.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[5].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[5].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Situacao_Tributaria.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[6].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[6].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Cliente.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[7].Item[0].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[7].Item[0].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Grupo_Cliente.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[7].Item[1].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[7].Item[1].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Funcionario.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[8].Item[0].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[8].Item[0].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Cargo.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[8].Item[1].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[8].Item[1].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Departamento.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[8].Item[2].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[8].Item[2].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Tipo_Documento.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[9].Item[0].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[9].Item[0].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Plano_Financeiro.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[9].Item[1].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[9].Item[1].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Banco.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[9].Item[2].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[9].Item[2].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Conta_Corrente.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[9].Item[3].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[9].Item[3].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Operacao_Bancaria.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[9].Item[4].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[9].Item[4].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Condicao_Pagamento.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[9].Item[5].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[9].Item[5].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Itens_Folha_Pagamento.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[9].Item[6].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[9].Item[6].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Cidade.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[10].Item[0].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[10].Item[0].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Setor.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[10].Item[1].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[10].Item[1].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Logradouro.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[10].Item[2].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[10].Item[2].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Pais.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[10].Item[3].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[10].Item[3].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Veiculo.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[10].Item[4].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[10].Item[4].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Marca.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[10].Item[5].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[10].Item[5].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Etiqueta.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[10].Item[6].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[10].Item[6].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Status.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[10].Item[7].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[10].Item[7].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Tipo_Ocorrencia.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[10].Item[8].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[10].Item[8].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Regra_ICMS.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[11].Item[0].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[11].Item[0].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Tratamento_ICMS.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[11].Item[1].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[11].Item[1].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Observacao_Fiscal.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[11].Item[2].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[11].Item[2].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Regra_PIS.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[12].Item[0].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[12].Item[0].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Tratamento_PIS.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[12].Item[1].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[12].Item[1].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Regra_COFINS.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[13].Item[0].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[13].Item[0].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Tratamento_COFINS.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[13].Item[1].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[13].Item[1].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Regra_IPI.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[14].Item[0].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[14].Item[0].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Tratamento_IPI.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[14].Item[1].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[14].Item[1].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_NCM.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[14].Item[2].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[14].Item[2].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Regra_ISSQN.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[15].Item[0].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[15].Item[0].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Perfil_Usuario.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[16].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[16].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Tipo_Bem.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[17].Item[0].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[17].Item[0].StateIndex := 2;
  end;

  if (qrychama_perfilCadastro_Patrimonio.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[17].Item[1].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Cadastros').Item[17].Item[1].StateIndex := 2;
  end;


  //movimentação

  if (qrychama_perfilMov_Entrada_Produto.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[0].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[0].StateIndex := 2;
  end;

  if (qrychama_perfilMov_Pedido_Producao.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[1].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[1].StateIndex := 2;
  end;

  if (qrychama_perfilMov_Fechamento_Estoque.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[2].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[2].StateIndex := 2;
  end;

  if (qrychama_perfilMov_Lancamento_Manual.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[3].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[3].StateIndex := 2;
  end;

  if (qrychama_perfilMov_Cupom_Fiscal.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[4].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[4].StateIndex := 2;
  end;

  if (qrychama_perfilMov_Gerar_DAV.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[5].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[5].StateIndex := 2;
  end;

  if (qrychama_perfilMov_NFe.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[6].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[6].StateIndex := 2;
  end;

  if (qrychama_perfilMov_Reimpressao_DAV.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[7].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[7].StateIndex := 2;
  end;

  if (qrychama_perfilRegistro_Ocorrencia.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[8].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Movimentação').Item[8].StateIndex := 2;
  end;


  //caixa
  if (qrychama_perfilAbertura_Caixa.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Caixa').Item[0].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Caixa').Item[0].StateIndex := 2;
  end;

  if (qrychama_perfilAcerto_Caixa.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Caixa').Item[1].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Caixa').Item[1].StateIndex := 2;
  end;

  if (qrychama_perfilAltera_Caixa.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Caixa').Item[2].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Caixa').Item[2].StateIndex := 2;
  end;

  if (qrychama_perfilSuprimento.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Caixa').Item[3].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Caixa').Item[3].StateIndex := 2;
  end;

  if (qrychama_perfilSangria.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Caixa').Item[4].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Caixa').Item[4].StateIndex := 2;
  end;

  if (qrychama_perfilRecebimento.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Caixa').Item[5].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Caixa').Item[5].StateIndex := 2;
  end;


  //financeiro

  if (qrychama_perfilLancamento_Financeiro.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Financeiro').Item[0].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Financeiro').Item[0].StateIndex := 2;
  end;

  if (qrychama_perfilBaixar_Titulo.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Financeiro').Item[1].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Financeiro').Item[1].StateIndex := 2;
  end;

  if (qrychama_perfilLancamento_Bancario.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Financeiro').Item[2].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Financeiro').Item[2].StateIndex := 2;
  end;

  if (qrychama_perfilConciliacao.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Financeiro').Item[3].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Financeiro').Item[3].StateIndex := 2;
  end;

  if (qrychama_perfilCheque.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Financeiro').Item[4].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Financeiro').Item[4].StateIndex := 2;
  end;

  if (qrychama_perfilBaixar_Cheque.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Financeiro').Item[5].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Financeiro').Item[5].StateIndex := 2;
  end;

  if (qrychama_perfilFolha_Pagamento.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Financeiro').Item[6].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Financeiro').Item[6].StateIndex := 2;
  end;

  if (qrychama_perfilOcorrencia_Cobranca.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Financeiro').Item[7].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Financeiro').Item[7].StateIndex := 2;
  end;

  //Consulta
  i:= 0;
  if (qrychama_perfilConsulta_Posicao_Estoque.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;
  inc(i);
  if (qrychama_perfilConsulta_Reposicao_Estoque.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;
  inc(i);
  if (qrychama_perfilConsulta_Saldo_Estoque.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;
  inc(i);
  if (qrychama_perfilContagem_Estoque.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;
  inc(i);
  if (qrychama_perfilConsulta_Historico_Movimentacao.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;
  inc(i);
  if (qrychama_perfilConsulta_Tabela_Preco.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;
  inc(i);
  if (qrychama_perfilConsulta_Lucro_Produto.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;
  inc(i);
  if (qrychama_perfilConsulta_Lucro_Grupo.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;
  inc(i);
  if (qrychama_perfilConsulta_Lucro_Marca.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;
  inc(i);
  if (qrychama_perfilConsulta_Entrada.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;
  inc(i);
  if (qrychama_perfilConsulta_Venda.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;
  inc(i);
  if (qrychama_perfilConsulta_Ordem_Servico.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;
  inc(i);
  if (qrychama_perfilConsulta_Ocorrencia.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;
  inc(i);
  if (qrychama_perfilConsulta_Lancamento_Financeiro.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
    FrmMenu_Geral.acConsulta_Lancamentos_Financeiros.Enabled:= true;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;
  inc(i);
  if (qrychama_perfilConsulta_Conta_Fixa.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;
  inc(i);
  if (qrychama_perfilConsulta_Folha_Pagamento.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;
  inc(i);
  if (qrychama_perfilConsulta_Lancamento_Bancario.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;
  inc(i);
  if (qrychama_perfilConsulta_Cheque.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;
  inc(i);
  if (qrychama_perfilConsulta_Saldo_Bancario.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;
  inc(i);
  if (qrychama_perfilConsulta_Acerto_Caixa.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;
  inc(i);
  if (qrychama_perfilConsulta_Fechamento_Caixa.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;
  inc(i);
  if (qrychama_perfilConsulta_Patrimonio.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;
  inc(i);
  if (qrychama_perfilConsulta_Ficha_Cliente.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Relatórios').Item[i].StateIndex := 2;
  end;


  //Ferramentas

  if (qrychama_perfilConfiguracao_Sistema.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Ferramentas').Item[0].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Ferramentas').Item[0].StateIndex := 2;
  end;

  if (qrychama_perfilHistorico.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Ferramentas').Item[1].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Ferramentas').Item[1].StateIndex := 2;
  end;

  if (qrychama_perfilRevalida_Sistema.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Ferramentas').Item[2].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Ferramentas').Item[2].StateIndex := 2;
  end;

  if (qrychama_perfilGera_Etiqueta_Cliente.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Ferramentas').Item[3].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Ferramentas').Item[3].StateIndex := 2;
  end;

  if (qrychama_perfilGera_Etiqueta_Produto.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Ferramentas').Item[4].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Ferramentas').Item[4].StateIndex := 2;
  end;

  if (qrychama_perfilInventario_Estoque.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Ferramentas').Item[5].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Ferramentas').Item[5].StateIndex := 2;
  end;

  if (qrychama_perfilAgenda_Telefonica.AsInteger = 1) then
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Ferramentas').Item[6].StateIndex := 1;
  end
  else
  begin
    obterMenuNivel1(FrmCadastro_Perfil_Usuario.TreeView1, 'Ferramentas').Item[6].StateIndex := 2;
  end;

end;

procedure TFrmChama_Perfil_Usuario.DBGrid1DblClick(Sender: TObject);
begin
  if (FrmCadastro_Perfil_Usuario <> Nil) and (FrmCadastro_Perfil_Usuario.ativo = true) then
  begin
    FrmCadastro_Perfil_Usuario.EdtCodigo.Text:= qrychama_perfilCodigo.AsString;
    FrmCadastro_Perfil_Usuario.EdtPerfil.Text:= qrychama_perfilPerfil.AsString;
    Chama_Itens;
    FrmChama_Perfil_Usuario.Close;
    FrmCadastro_Perfil_Usuario.BBtnSalvar.Enabled:= true;
    FrmCadastro_Perfil_Usuario.BBtnExcluir.Enabled:= true;
    FrmCadastro_Perfil_Usuario.BBtnPesquisar.Enabled:= true;
    FrmCadastro_Perfil_Usuario.BBtnCancelar.Enabled:= true;
    FrmCadastro_Perfil_Usuario.BBtnNovo.Enabled:= false;
    Util.Habilita_Campos(FrmCadastro_Perfil_Usuario);
    FrmCadastro_Perfil_Usuario.achei:= true;
  end
  else if (FrmCadastro_Usuario <> nil) and (FrmCadastro_Usuario.ativo = true) then
  begin
    FrmCadastro_Usuario.EdtCodigo_Perfil.Text:= qrychama_perfilCodigo.AsString;
    FrmCadastro_Usuario.EdtPerfil.Text:= qrychama_perfilPerfil.AsString;
    FrmChama_Perfil_Usuario.Close;
  end
  else if (FrmCadastro_Funcionarios <> nil) and (FrmCadastro_Funcionarios.ativo = true) then
  begin
    FrmCadastro_Funcionarios.EdtCodigo_Perfil.Text:= qrychama_perfilCodigo.AsString;
    FrmCadastro_Funcionarios.EdtPerfil.Text:= qrychama_perfilPerfil.AsString;
    FrmChama_Perfil_Usuario.Close;
  end;
end;

procedure TFrmChama_Perfil_Usuario.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFrmChama_Perfil_Usuario.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
    begin
      DBGrid1DblClick(self);
    end;
end;

procedure TFrmChama_Perfil_Usuario.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Consulta.Chama_Perfil_Usuario;
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Perfil_Usuario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Perfil_Usuario.Release;
end;

procedure TFrmChama_Perfil_Usuario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_escape) then
    close;
end;

end.
