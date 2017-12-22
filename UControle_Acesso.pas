unit UControle_Acesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, Registry, ImgList, ADODB, DB,
  UAtualizacao, ShellAPI;

type
  threadFTP = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    procedure conectarftp;
  end;

  TFrmControle_Acesso = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    EdtLogin: TEdit;
    EdtSenha: TEdit;
    btOK: TBitBtn;
    BtCancela: TBitBtn;
    StatusBar: TStatusBar;
    BalloonHint1: TBalloonHint;
    ImageList1: TImageList;
    qrychama_perfil: TADOQuery;
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
    Label3: TLabel;
    Label4: TLabel;
    EdtChave: TEdit;
    EdtContrachave: TEdit;
    BitBtn1: TBitBtn;
    qrychama_perfilCadastro_Etiqueta: TIntegerField;
    qrychama_perfilGera_Etiqueta_Cliente: TIntegerField;
    qrychama_perfilGera_Etiqueta_Produto: TIntegerField;
    qrychama_perfilInventario_Estoque: TIntegerField;
    qrychama_empresa: TADOQuery;
    qrychama_perfilAgenda_Telefonica: TIntegerField;
    qrychama_perfilAlteracao_Produto: TIntegerField;
    qrychama_perfilContagem_Estoque: TIntegerField;
    Image2: TImage;
    LblAtualizacao: TLabel;
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
    qrychama_empresaCodigo: TIntegerField;
    qrychama_empresaNome_Fantasia: TStringField;
    qrychama_empresaRazao_Social: TStringField;
    qrychama_empresaProprietario: TStringField;
    qrychama_empresaCNPJ: TStringField;
    qrychama_empresaInsc_Estadual: TStringField;
    qrychama_empresaInsc_Municipal: TStringField;
    qrychama_empresaSuframa: TStringField;
    qrychama_empresaCNAE: TStringField;
    qrychama_empresaRegime_Tributario: TIntegerField;
    qrychama_empresaEnquadramento: TStringField;
    qrychama_empresaAliquota: TStringField;
    qrychama_empresaCusto_OP: TFloatField;
    qrychama_empresaNumero: TStringField;
    qrychama_empresaComplemento: TStringField;
    qrychama_empresaCodigo_Setor: TIntegerField;
    qrychama_empresaCodigo_Cidade: TIntegerField;
    qrychama_empresaTelefone: TStringField;
    qrychama_empresaFax: TStringField;
    qrychama_empresaEmail: TStringField;
    qrychama_empresaSenha: TStringField;
    qrychama_empresaSMTP: TStringField;
    qrychama_empresaPorta: TStringField;
    qrychama_empresaSite: TStringField;
    qrychama_empresaData_Cadastro: TDateTimeField;
    qrychama_empresaObservacoes: TStringField;
    qrychama_empresaContato: TStringField;
    qrychama_empresaTelefone_Contato: TStringField;
    qrychama_empresaEndereco: TStringField;
    qrychama_empresaCEP: TStringField;
    qrychama_empresaCidade: TStringField;
    qrychama_empresaUF: TStringField;
    qrychama_empresaCodigo_Municipio: TStringField;
    qrychama_empresaSetor: TStringField;
    qrychama_perfilOcorrencia_Cobranca: TIntegerField;
    procedure btOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtCancelaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    function RemoveChar(Const Texto: String): String;
    Function SerialNum(FDrive: String): String;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Image2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    tentativas: integer;
    qAux, qAux2, qAux3: TADOQuery;
    Atualizacoes: TAtualizacoes;
    procedure Chama_Usuario;
    procedure Chama_Funcionario(Codigo: integer);
    procedure Chama_Itens;
    procedure Chama_Perfil(perfil: integer);
    procedure Verifica_Rede;
    procedure Atribui_Variaveis;
    procedure Variaveis_Empresa;
    procedure Habilita_Timer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmControle_Acesso: TFrmControle_Acesso;
  Raiz: String = 'Software\Microsoft\Windows\CurrentVersion\Explorer\VOut';
  Registro: TRegistry;
  hd: string;
  Fi: double = 1.6180339887;
  Pii: double = 3.1415926535;
  numero: double;

implementation

uses UDM, UMenu_Geral, UChama_Empresa_Inicial, UDeclaracao, UGeral, Util.TLog;
{$R *.dfm}

procedure TFrmControle_Acesso.Atribui_Variaveis;
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('select * from Configuracao_Sistema where Codigo_Empresa = :Codigo');
      Parameters.ParamByName('Codigo').Value := UDeclaracao.codigo_empresa;
      open;
    end;

    mensagem := qAux.FieldByName('Mensagem_Cupom').AsString;
    perfil_arquivo := qAux.FieldByName('Perfil_Arquivo_Fiscal').AsString;
    versao_efd := qAux.FieldByName('Versao_EFD').AsString;
    tipo_atividade := qAux.FieldByName('Codigo_Tipo_Atividade').AsString;
    codigo_tabela_preco_padrao := qAux.FieldByName('Codigo_Tabela_Preco_Padrao')
      .AsInteger;
    codigo_tabela_preco_ativo := qAux.FieldByName('Codigo_Tabela_Preco_Padrao')
      .AsInteger;

    avisa_tabela_preco := qAux.FieldByName('Avisa_Tabela_Preco').AsString;
    avisa_lancamento_financeiro := qAux.FieldByName
      ('Avisa_Lancamento_Financeiro').AsString;
    avisa_cheque := qAux.FieldByName('Avisa_Cheque').AsString;
    avisa_pedido_compra := qAux.FieldByName('Avisa_Pedido_Compra_Pendente')
      .AsString;
    avisa_aniversario_cliente := qAux.FieldByName('Avisa_Aniversario_Cliente')
      .AsString;
    avisa_aniversario_funcionario := qAux.FieldByName
      ('Avisa_Aniversario_Funcionario').AsString;
    avisa_produto_vencido := qAux.FieldByName('Avisa_Produto_Vencido').AsString;
    fazer_backup := qAux.FieldByName('Fazer_Backup').AsString;
    avisa_conta_fixa := qAux.FieldByName('Avisa_Conta_Fixa').AsString;
    avisa_cotacao_preco := qAux.FieldByName('Avisa_Cotacao_Preco').AsString;
    dias_aviso := qAux.FieldByName('Dias_Aviso').AsInteger;
    dias_orcamento_vencido := qAux.FieldByName('Dias_Orcamento_Vencido').AsInteger;
    tempo_atualizacao := qAux.FieldByName('Tempo_Atualizacao').AsInteger;
    issqnn := qAux.FieldByName('ISSQN').AsString;
    codigo_tipo_documento := qAux.FieldByName('Codigo_Tipo_Documento')
      .AsInteger;
    codigo_departamento := qAux.FieldByName('Codigo_Departamento').AsInteger;
    codigo_plano_financeiro := qAux.FieldByName('Codigo_Plano_Financeiro')
      .AsInteger;
    historico_conta := qAux.FieldByName('Historico').AsString;

    codigo_tipo_documento_pagar := qAux.FieldByName
      ('Codigo_Tipo_Documento_Pagar').AsInteger;
    codigo_departamento_pagar := qAux.FieldByName('Codigo_Departamento_Pagar')
      .AsInteger;
    codigo_plano_financeiro_pagar := qAux.FieldByName
      ('Codigo_Plano_Financeiro_Pagar').AsInteger;
    historico_conta_pagar := qAux.FieldByName('Historico_Pagar').AsString;

    ambiente := qAux.FieldByName('Ambiente').AsString;
    impressao_danfe := qAux.FieldByName('Tipo_Impressao').AsString;
    forma_emissao := qAux.FieldByName('Tipo_Emissao').AsString;
    salva_xml := qAux.FieldByName('Salvar_XML').AsString;
    caminho_schema := qAux.FieldByName('Caminho_Schema').AsString;
    logomarca := qAux.FieldByName('Logomarca').AsString;
    n_certificado := qAux.FieldByName('N_Certificado').AsString;
    senha_certificado := qAux.FieldByName('Senha_Certificado').AsString;
    idcsc:= qAux.FieldByName('IdCSC').AsString;
    numerocsc:= qAux.FieldByName('NumeroCSC').AsString;
    ean_balanca := qAux.FieldByName('EAN_Balanca').AsInteger;
    gerar_financeiro:= qAux.FieldByName('Gerar_Financeiro').AsInteger;

    fechar_caixa_sair_sistema:= qAux.FieldByName('Fechar_Caixa').AsInteger;
    calcula_juro:= qAux.FieldByName('Calcula_Juro').AsInteger;
    atualiza_or_vencido:= qAux.FieldByName('Atualiza_Orcamento_Vencido').AsInteger;
    consulta_padrao_produto:= qAux.FieldByName('Consulta_Padrao_Produto').AsInteger;
    tipo_desc_acr_padrao:= qAux.FieldByName('Tipo_Desc_Acr_Padrao').AsInteger;
    gerar_estoque:= qAux.FieldByName('Gerar_Estoque').AsInteger;
    usar_comissao:= qAux.FieldByName('Usar_Comissao').AsInteger;
    tipo_dias:= qAux.FieldByName('Tipo_Dias').AsInteger;

    Ob_Cliente_Nome:= qAux.FieldByName('Ob_Cliente_Nome').AsInteger;
    Ob_Cliente_Razao_Social:= qAux.FieldByName('Ob_Cliente_Razao_Social').AsInteger;
    Ob_Cliente_CPF:= qAux.FieldByName('Ob_Cliente_CPF').AsInteger;
    Ob_Cliente_RG:= qAux.FieldByName('Ob_Cliente_RG').AsInteger;
    Ob_Cliente_CNPJ:= qAux.FieldByName('Ob_Cliente_CNPJ').AsInteger;
    Ob_Cliente_Insc_Estadual:= qAux.FieldByName('Ob_Cliente_Insc_Estadual').AsInteger;
    Ob_Cliente_Endereco:= qAux.FieldByName('Ob_Cliente_Endereco').AsInteger;
    Ob_Cliente_Numero:= qAux.FieldByName('Ob_Cliente_Numero').AsInteger;
    Ob_Cliente_Setor:= qAux.FieldByName('Ob_Cliente_Setor').AsInteger;
    Ob_Cliente_Email:= qAux.FieldByName('Ob_Cliente_Email').AsInteger;
    Ob_Cliente_Cidade:= qAux.FieldByName('Ob_Cliente_Cidade').AsInteger;
    Ob_Cliente_Data_Nascimento:= qAux.FieldByName('Ob_Cliente_Data_Nascimento').AsInteger;
    Ob_Cliente_Telefone:= qAux.FieldByName('Ob_Cliente_Telefone').AsInteger;
    bloq_cliente:= qAux.FieldByName('Bloqueia_Cliente').AsString;
    desbloq_cliente:= qAux.FieldByName('Desbloqueia_Cliente').AsString;
    caminho_pedido_pdf := qAux.FieldByName('Caminho_PDF_Pedido').AsString;
    tipo_impressao_pedido := qAux.FieldByName('Tipo_Impressao_Pedido').AsInteger;
    tamanho_impressao := qAux.FieldByName('Tamanho_Impressao').AsInteger;
    qtde_copias := qAux.FieldByName('Qtde_Copias').AsInteger;
    caminho_pdf_carne := qAux.FieldByName('Caminho_PDF_Carne').AsString;
    observacoes_carne := qAux.FieldByName('Observacoes_Carne').AsString;
    gera_pre_venda:= qAux.FieldByName('Gera_Pre_Venda').AsString;
    gera_os:= qAux.FieldByName('Gera_OS').AsString;
    gera_dav:= qAux.FieldByName('Gera_DAV').AsString;
    gera_nfe:= qAux.FieldByName('Gera_NFE').AsString;
    qtde_mac:= qAux.FieldByName('Qtde_Maq').AsString;
    tipo_os:= qAux.FieldByName('Tipo_OS').AsInteger;


    Modelo_Etiqueta:= qAux.FieldByName('Modelo_Etiqueta').AsInteger;
    DPI_Impressora_Etiqueta:= qAux.FieldByName('DPI_Impressora_Etiqueta').AsInteger;
    Avanco_Impressora_Etiqueta:= qAux.FieldByName('Avanco_Impressora_Etiqueta').AsInteger;
    Porta_Impressora_Etiqueta:= qAux.FieldByName('Porta_Impressora_Etiqueta').AsString;
    Temperatura_Impressora_Etiqueta:= qAux.FieldByName('Temperatura_Impressora_Etiqueta').AsInteger;
    Limpar_Memoria_Impressora_Etiqueta:= qAux.FieldByName('Limpar_Memoria_Impressora_Etiqueta').AsInteger;;
//    Orientacao_Impressao_Texto_Etiqueta:= qAux.FieldByName('Orientacao_Impressao_Texto_Etiqueta').AsInteger;;

//    Tamanho_Fonte_Texto_Etiqueta_Campo_1:= qAux.FieldByName('Tamanho_Fonte_Texto_Etiqueta_Campo_1').AsInteger;;
//    Multiplicador_V_Texto_Etiqueta_Campo_1:= qAux.FieldByName('Multiplicador_V_Texto_Etiqueta_Campo_1').AsInteger;;
//    Multiplicador_H_Texto_Etiqueta_Campo_1:= qAux.FieldByName('Multiplicador_H_Texto_Etiqueta_Campo_1').AsInteger;;
//    Horizontal_Texto_Etiqueta_Campo_1:= qAux.FieldByName('Horizontal_Texto_Etiqueta_Campo_1').AsInteger;;
//    Vertical_Texto_Etiqueta_Campo_1:= qAux.FieldByName('Vertical_Texto_Etiqueta_Campo_1').AsInteger;;
//
//    Tamanho_Fonte_Texto_Etiqueta_Campo_2:= qAux.FieldByName('Tamanho_Fonte_Texto_Etiqueta_Campo_2').AsInteger;;
//    Multiplicador_V_Texto_Etiqueta_Campo_2:= qAux.FieldByName('Multiplicador_V_Texto_Etiqueta_Campo_2').AsInteger;;
//    Multiplicador_H_Texto_Etiqueta_Campo_2:= qAux.FieldByName('Multiplicador_H_Texto_Etiqueta_Campo_2').AsInteger;;
//    Horizontal_Texto_Etiqueta_Campo_2:= qAux.FieldByName('Horizontal_Texto_Etiqueta_Campo_2').AsInteger;;
//    Vertical_Texto_Etiqueta_Campo_2:= qAux.FieldByName('Vertical_Texto_Etiqueta_Campo_2').AsInteger;;
//
//    Tamanho_Fonte_Texto_Etiqueta_Campo_3:= qAux.FieldByName('Tamanho_Fonte_Texto_Etiqueta_Campo_3').AsInteger;;
//    Multiplicador_V_Texto_Etiqueta_Campo_3:= qAux.FieldByName('Multiplicador_V_Texto_Etiqueta_Campo_3').AsInteger;;
//    Multiplicador_H_Texto_Etiqueta_Campo_3:= qAux.FieldByName('Multiplicador_H_Texto_Etiqueta_Campo_3').AsInteger;;
//    Horizontal_Texto_Etiqueta_Campo_3:= qAux.FieldByName('Horizontal_Texto_Etiqueta_Campo_3').AsInteger;;
//    Vertical_Texto_Etiqueta_Campo_3:= qAux.FieldByName('Vertical_Texto_Etiqueta_Campo_3').AsInteger;;
//
//    Tamanho_Fonte_Texto_Etiqueta_Campo_4:= qAux.FieldByName('Tamanho_Fonte_Texto_Etiqueta_Campo_4').AsInteger;;
//    Multiplicador_V_Texto_Etiqueta_Campo_4:= qAux.FieldByName('Multiplicador_V_Texto_Etiqueta_Campo_4').AsInteger;;
//    Multiplicador_H_Texto_Etiqueta_Campo_4:= qAux.FieldByName('Multiplicador_H_Texto_Etiqueta_Campo_4').AsInteger;;
//    Horizontal_Texto_Etiqueta_Campo_4:= qAux.FieldByName('Horizontal_Texto_Etiqueta_Campo_4').AsInteger;;
//    Vertical_Texto_Etiqueta_Campo_4:= qAux.FieldByName('Vertical_Texto_Etiqueta_Campo_4').AsInteger;;
//
//    Tamanho_Fonte_Texto_Etiqueta_Campo_5:= qAux.FieldByName('Tamanho_Fonte_Texto_Etiqueta_Campo_5').AsInteger;;
//    Multiplicador_V_Texto_Etiqueta_Campo_5:= qAux.FieldByName('Multiplicador_V_Texto_Etiqueta_Campo_5').AsInteger;;
//    Multiplicador_H_Texto_Etiqueta_Campo_5:= qAux.FieldByName('Multiplicador_H_Texto_Etiqueta_Campo_5').AsInteger;;
//    Horizontal_Texto_Etiqueta_Campo_5:= qAux.FieldByName('Horizontal_Texto_Etiqueta_Campo_5').AsInteger;;
//    Vertical_Texto_Etiqueta_Campo_5:= qAux.FieldByName('Vertical_Texto_Etiqueta_Campo_5').AsInteger;;
//
//    Distancia_Horizontal_Etiqueta:= qAux.FieldByName('Distancia_Horizontal_Etiqueta').AsInteger;
//    Distancia_Vertical_Etiqueta:= qAux.FieldByName('Distancia_Vertical_Etiqueta').AsInteger;;
//
//    Tipo_Barra_Etiqueta:= qAux.FieldByName('Tipo_Barra_Etiqueta').AsString;
//    Largura_Barra_Larga:= qAux.FieldByName('Largura_Barra_Larga').AsInteger;;
//    Largura_Barra_Fina:= qAux.FieldByName('Largura_Barra_Fina').AsInteger;;
//    Horizontal_Barra_Etiqueta:= qAux.FieldByName('Horizontal_Barra_Etiqueta').AsInteger;;
//    Vertical_Barra_Etiqueta:= qAux.FieldByName('Vertical_Barra_Etiqueta').AsInteger;;
//    Altura_Barra:= qAux.FieldByName('Altura_Barra').AsInteger;
    opcao_servico_marcada:= qAux.FieldByName('Opcao_Servico_Padrao').AsInteger;
    controla_credito_cliente:= qAux.FieldByName('Controla_Credito_Cliente').AsInteger;
    busca_parametro_calculo_preco:= qAux.FieldByName('Busca_Parametro_Calculo_Preco').AsInteger;
    gera_cupom_fiscal:= qAux.FieldByName('Gera_Cupom_Fiscal').AsString;
    gera_codigo_ean:= qAux.FieldByName('Gera_Codigo_EAN_Valido').AsInteger;
    codigo_cfop_padrao:= qAux.FieldByName('Codigo_CFOP_Padrao').AsInteger;
    trazer_somente_cond_pag_ecf:= qAux.FieldByName('Trazer_Somente_Cond_Pag_ECF').AsInteger;
  finally
    {on E: Exception do
      ShowMessage(E.Message);}

    FreeAndNil(qAux);
  end;
end;

procedure TFrmControle_Acesso.BitBtn1Click(Sender: TObject);
begin
  if (EdtContrachave.Text = '') then
  begin
    Application.MessageBox('Por favor, digite uma chave válida', '',
      MB_OK + MB_ICONHAND);
    EdtContrachave.SetFocus;
    abort;
  end;

  if EdtContrachave.Text = floattostr(StrToFloat(EdtChave.Text) * Pii) then
  begin
    Registro.OpenKey(Raiz, True);
    FrmControle_Acesso.Height := 190;
    btOK.Visible := True;
    BtCancela.Visible := True;
    EdtLogin.SetFocus;
    Application.MessageBox('Sistema desbloqueado', '', MB_OK + MB_ICONQUESTION);
  end
  else
  begin
    btOK.Visible := false;
    BtCancela.Visible := false;
    Application.MessageBox(
      'Chave inválida. Por favor, verifique e tente novamente', '',
      MB_OK + MB_ICONHAND);
    FrmControle_Acesso.Height := 290;
  end;
end;

procedure TFrmControle_Acesso.BtCancelaClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmControle_Acesso.Chama_Funcionario(Codigo: integer);
begin
  try
    qAux3 := TADOQuery.Create(self);
    with qAux3, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('select F.Comissao, F.Desconto from Funcionario F');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value := Codigo;
      open;
    end;
  finally

  end;
end;

procedure TFrmControle_Acesso.Chama_Itens;
begin
  // Funções ECF
  if (qrychama_perfilAdicao_Aliquota_Tributaria.AsInteger = 1) then
  begin
    FrmMenu_Geral.acAdicao_Aliquota_Tributaria.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acAdicao_Aliquota_Tributaria.Enabled := false;
  end;

  if (qrychama_perfilAltera_Simbolo_Moeda.AsInteger = 1) then
  begin
    FrmMenu_Geral.acAlterar_Simbolo_Moeda.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acAlterar_Simbolo_Moeda.Enabled := false;
  end;

  if (qrychama_perfilHorario_Verao.AsInteger = 1) then
  begin
    FrmMenu_Geral.acHorario_Verao.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acHorario_Verao.Enabled := false;
  end;

  if (qrychama_perfilPrograma_Arredondamento.AsInteger = 1) then
  begin
    FrmMenu_Geral.acPrograma_Arredondamento.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acPrograma_Arredondamento.Enabled := false;
  end;

  if (qrychama_perfilPrograma_Truncamento.AsInteger = 1) then
  begin
    FrmMenu_Geral.acPrograma_Truncamento.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acPrograma_Truncamento.Enabled := false;
  end;

  if (qrychama_perfilMapa_Resumo.AsInteger = 1) then
  begin
    FrmMenu_Geral.acMapa_Resumo.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acMapa_Resumo.Enabled := false;
  end;

  // Cadastros
  if (qrychama_perfilCadastro_Empresa.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Empresa.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Empresa.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Produto.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Produtos.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Produtos.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Grupo_Produto.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Grupo_Produto.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Grupo_Produto.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Unidade_Medida.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Unidade_Medida.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Unidade_Medida.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Localidade.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Local_Produto.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Local_Produto.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Tabela_Preco.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Tabela_Preco.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Tabela_Preco.Enabled := false;
  end;

  if (qrychama_perfilAlteracao_Produto.AsInteger = 1) then
  begin
    FrmMenu_Geral.acAlteracao_Produto.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acAlteracao_Produto.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Receita.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Receita.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Receita.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Fornecedor.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Fornecedor.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Fornecedor.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Transportadora.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Transportadora.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Transportadora.Enabled := false;
  end;

  if (qrychama_perfilCadastro_CFOP.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_CFOP.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_CFOP.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Situacao_Tributaria.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Situacao_Tributaria.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Situacao_Tributaria.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Cliente.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Cliente.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Cliente.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Grupo_Cliente.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Grupo_Cliente.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Grupo_Cliente.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Funcionario.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Funcionario.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Funcionario.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Cargo.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Cargo.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Cargo.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Departamento.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Departamento.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Departamento.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Tipo_Documento.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Tipo_Documento.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Tipo_Documento.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Plano_Financeiro.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Plano_Financeiro.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Plano_Financeiro.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Banco.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Banco.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Banco.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Conta_Corrente.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Conta_Corrente.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Conta_Corrente.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Operacao_Bancaria.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Operacao_Bancaria.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Operacao_Bancaria.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Condicao_Pagamento.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Condicao_Pagamento.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Condicao_Pagamento.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Itens_Folha_Pagamento.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Itens_Folha_Pagamento.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Itens_Folha_Pagamento.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Cidade.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Cidade.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Cidade.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Setor.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Setor.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Setor.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Logradouro.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Logradouro.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Logradouro.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Pais.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Pais.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Pais.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Veiculo.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Veiculo.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Veiculo.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Marca.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Marca.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Marca.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Etiqueta.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Etiqueta.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Etiqueta.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Status.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Status.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Status.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Tipo_Ocorrencia.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Tipo_Ocorrencia.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Tipo_Ocorrencia.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Regra_ICMS.AsInteger = 1) then
  begin
    FrmMenu_Geral.acRegra_ICMS.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acRegra_ICMS.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Tratamento_ICMS.AsInteger = 1) then
  begin
    FrmMenu_Geral.acTratamento_ICMS.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acTratamento_ICMS.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Observacao_Fiscal.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Observacao_Fiscal.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Observacao_Fiscal.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Regra_PIS.AsInteger = 1) then
  begin
    FrmMenu_Geral.acRegra_PIS.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acRegra_PIS.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Tratamento_PIS.AsInteger = 1) then
  begin
    FrmMenu_Geral.acTratamento_PIS.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acTratamento_PIS.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Regra_COFINS.AsInteger = 1) then
  begin
    FrmMenu_Geral.acRegra_COFINS.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acRegra_COFINS.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Tratamento_COFINS.AsInteger = 1) then
  begin
    FrmMenu_Geral.acTratamento_COFINS.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acTratamento_COFINS.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Regra_IPI.AsInteger = 1) then
  begin
    FrmMenu_Geral.acRegra_IPI.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acRegra_IPI.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Tratamento_IPI.AsInteger = 1) then
  begin
    FrmMenu_Geral.acTratamento_IPI.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acTratamento_IPI.Enabled := false;
  end;

  if (qrychama_perfilCadastro_NCM.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_NCM.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_NCM.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Regra_ISSQN.AsInteger = 1) then
  begin
    FrmMenu_Geral.acRegra_ISSQN.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acRegra_ISSQN.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Perfil_Usuario.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Perfil_Usuario.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Perfil_Usuario.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Tipo_Bem.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Tipo_Bem_Patrimonial.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Tipo_Bem_Patrimonial.Enabled := false;
  end;

  if (qrychama_perfilCadastro_Patrimonio.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Patrimonio.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Patrimonio.Enabled := false;
  end;


  // movimentação

  if (qrychama_perfilMov_Entrada_Produto.AsInteger = 1) then
  begin
    FrmMenu_Geral.acEntrada_Produtos.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acEntrada_Produtos.Enabled := false;
  end;

  if (qrychama_perfilMov_Pedido_Producao.AsInteger = 1) then
  begin
    FrmMenu_Geral.acFabricacao_Propria.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acFabricacao_Propria.Enabled := false;
  end;

  if (qrychama_perfilMov_Fechamento_Estoque.AsInteger = 1) then
  begin
    FrmMenu_Geral.acFechamento_Estoque.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acFechamento_Estoque.Enabled := false;
  end;

  if (qrychama_perfilMov_Lancamento_Manual.AsInteger = 1) then
  begin
    FrmMenu_Geral.acLancamento_Manual.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acLancamento_Manual.Enabled := false;
  end;

  if (qrychama_perfilMov_Cupom_Fiscal.AsInteger = 1) then
  begin
    FrmMenu_Geral.acPDV.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acPDV.Enabled := false;
  end;

  if (qrychama_perfilMov_Gerar_DAV.AsInteger = 1) then
  begin
    FrmMenu_Geral.acVenda_Orcamento.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acVenda_Orcamento.Enabled := false;
  end;

  if (qrychama_perfilMov_NFe.AsInteger = 1) then
  begin
    FrmMenu_Geral.acNFe.Enabled := True;
    FrmMenu_Geral.acNFe_ADM.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acNFe_ADM.Enabled := false;
    FrmMenu_Geral.acNFe.Enabled := false;
  end;

  if (qrychama_perfilMov_Reimpressao_DAV.AsInteger = 1) then
  begin
    FrmMenu_Geral.acReimpressao_DAV.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acReimpressao_DAV.Enabled := false;
  end;

  if (qrychama_perfilRegistro_Ocorrencia.AsInteger = 1) then
  begin
    FrmMenu_Geral.acRegistro_Ocorrencia.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acRegistro_Ocorrencia.Enabled := false;
  end;

  // caixa
  if (qrychama_perfilAbertura_Caixa.AsInteger = 1) then
  begin
    FrmMenu_Geral.acAbertura_Caixa.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acAbertura_Caixa.Enabled := false;
  end;

  if (qrychama_perfilAcerto_Caixa.AsInteger = 1) then
  begin
    FrmMenu_Geral.acAcerto_Caixa.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acAcerto_Caixa.Enabled := false;
  end;

  if (qrychama_perfilAltera_Caixa.AsInteger = 1) then
  begin
    FrmMenu_Geral.acAltera_Caixa.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acAltera_Caixa.Enabled := false;
  end;

  if (qrychama_perfilSuprimento.AsInteger = 1) then
  begin
    FrmMenu_Geral.acSuprimento.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acSuprimento.Enabled := false;
  end;

  if (qrychama_perfilSangria.AsInteger = 1) then
  begin
    FrmMenu_Geral.acSangria.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acSangria.Enabled := false;
  end;

  if (qrychama_perfilRecebimento.AsInteger = 1) then
  begin
    FrmMenu_Geral.acRecebimento_Caixa.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acRecebimento_Caixa.Enabled := false;
  end;


  // financeiro

  if (qrychama_perfilLancamento_Financeiro.AsInteger = 1) then
  begin
    FrmMenu_Geral.acLancamento_Financeiro.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acLancamento_Financeiro.Enabled := false;
  end;

  if (qrychama_perfilBaixar_Titulo.AsInteger = 1) then
  begin
    FrmMenu_Geral.acBaixar_Titulos.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acBaixar_Titulos.Enabled := false;
  end;

  if (qrychama_perfilLancamento_Bancario.AsInteger = 1) then
  begin
    FrmMenu_Geral.acLancamento_Bancario.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acLancamento_Bancario.Enabled := false;
  end;

  if (qrychama_perfilConciliacao.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConciliacao_Bancaria.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConciliacao_Bancaria.Enabled := false;
  end;

  if (qrychama_perfilCheque.AsInteger = 1) then
  begin
    FrmMenu_Geral.acCadastro_Cheque.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acCadastro_Cheque.Enabled := false;
  end;

  if (qrychama_perfilBaixar_Cheque.AsInteger = 1) then
  begin
    FrmMenu_Geral.acBaixar_Cheque.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acBaixar_Cheque.Enabled := false;
  end;

  if (qrychama_perfilFolha_Pagamento.AsInteger = 1) then
  begin
    FrmMenu_Geral.acFolha_Pagamento.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acFolha_Pagamento.Enabled := false;
  end;

  if (qrychama_perfilOcorrencia_Cobranca.AsInteger = 1) then
  begin
    FrmMenu_Geral.acOcorrencia_Cobranca.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acOcorrencia_Cobranca.Enabled := false;
  end;

  // Consulta

  if (qrychama_perfilConsulta_Posicao_Estoque.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConsulta_Posicao_Estoque.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConsulta_Posicao_Estoque.Enabled := false;
  end;

  if (qrychama_perfilConsulta_Reposicao_Estoque.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConsulta_Recompor_Estoque.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConsulta_Recompor_Estoque.Enabled := false;
  end;

  if (qrychama_perfilConsulta_Saldo_Estoque.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConsulta_Saldo_Estoque.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConsulta_Saldo_Estoque.Enabled := false;
  end;

  if (qrychama_perfilContagem_Estoque.AsInteger = 1) then
  begin
    FrmMenu_Geral.acContagem_Estoque.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acContagem_Estoque.Enabled := false;
  end;

  if (qrychama_perfilConsulta_Historico_Movimentacao.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConsulta_Historico_Movimentacao.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConsulta_Historico_Movimentacao.Enabled := false;
  end;

  if (qrychama_perfilConsulta_Tabela_Preco.AsInteger = 1) then
  begin
    FrmMenu_Geral.acTabela_Preco.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acTabela_Preco.Enabled := false;
  end;

  if (qrychama_perfilConsulta_Lucro_Produto.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConsulta_Lucro_Produto.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConsulta_Lucro_Produto.Enabled := false;
  end;

  if (qrychama_perfilConsulta_Lucro_Grupo.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConsulta_Lucro_Grupo.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConsulta_Lucro_Grupo.Enabled := false;
  end;

  if (qrychama_perfilConsulta_Lucro_Marca.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConsulta_Lucro_Marca.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConsulta_Lucro_Marca.Enabled := false;
  end;

  if (qrychama_perfilConsulta_Entrada.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConsulta_Entrada.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConsulta_Entrada.Enabled := false;
  end;

  if (qrychama_perfilConsulta_Venda.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConsulta_PreVenda_DAV.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConsulta_PreVenda_DAV.Enabled := false;
  end;

  if (qrychama_perfilConsulta_Ordem_Servico.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConsulta_Ordem_Servico.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConsulta_Ordem_Servico.Enabled := false;
  end;

  if (qrychama_perfilConsulta_Ocorrencia.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConsulta_Ocorrencia.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConsulta_Ocorrencia.Enabled := false;
  end;

  if (qrychama_perfilConsulta_Lancamento_Financeiro.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConsulta_Lancamentos_Financeiros.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConsulta_Lancamentos_Financeiros.Enabled := false;
  end;

  if (qrychama_perfilConsulta_Conta_Fixa.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConsulta_Custo_Empresa.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConsulta_Custo_Empresa.Enabled := false;
  end;

  if (qrychama_perfilConsulta_Folha_Pagamento.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConsulta_Folha_Pagamento.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConsulta_Folha_Pagamento.Enabled := false;
  end;

  if (qrychama_perfilConsulta_Lancamento_Bancario.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConsulta_Lancamento_Bancario.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConsulta_Lancamento_Bancario.Enabled := false;
  end;

  if (qrychama_perfilConsulta_Cheque.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConsulta_Cheque.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConsulta_Cheque.Enabled := false;
  end;

  if (qrychama_perfilConsulta_Saldo_Bancario.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConsulta_Saldo_Bancario.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConsulta_Saldo_Bancario.Enabled := false;
  end;

  if (qrychama_perfilConsulta_Acerto_Caixa.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConsulta_Acerto_Caixa.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConsulta_Acerto_Caixa.Enabled := false;
  end;

  if (qrychama_perfilConsulta_Fechamento_Caixa.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConsulta_Fechamento_Caixa.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConsulta_Fechamento_Caixa.Enabled := false;
  end;

  if (qrychama_perfilConsulta_Patrimonio.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConsulta_Patrimonio.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConsulta_Patrimonio.Enabled := false;
  end;

  if (qrychama_perfilConsulta_Ficha_Cliente.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConsulta_Ficha_Funcionario.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConsulta_Ficha_Funcionario.Enabled := false;
  end;

  // Ferramentas

  if (qrychama_perfilConfiguracao_Sistema.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConfiguracao_Sistema.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConfiguracao_Sistema.Enabled := false;
  end;

  if (qrychama_perfilHistorico.AsInteger = 1) then
  begin
    FrmMenu_Geral.acConsulta_Historico_Log.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acConsulta_Historico_Log.Enabled := false;
  end;

  if (qrychama_perfilRevalida_Sistema.AsInteger = 1) then
  begin
    FrmMenu_Geral.acRevalidar_Sistema.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acRevalidar_Sistema.Enabled := false;
  end;

  if (qrychama_perfilGera_Etiqueta_Cliente.AsInteger = 1) then
  begin
    FrmMenu_Geral.acGera_Etiqueta_Cliente.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acGera_Etiqueta_Cliente.Enabled := false;
  end;

  if (qrychama_perfilGera_Etiqueta_Produto.AsInteger = 1) then
  begin
    FrmMenu_Geral.acGera_Etiqueta_Produto.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acGera_Etiqueta_Produto.Enabled := false;
  end;

  if (qrychama_perfilInventario_Estoque.AsInteger = 1) then
  begin
    FrmMenu_Geral.acInventario_Estoque.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acInventario_Estoque.Enabled := false;
  end;

  if (qrychama_perfilAgenda_Telefonica.AsInteger = 1) then
  begin
    FrmMenu_Geral.acAgenda_Telefonica.Enabled := True;
  end
  else
  begin
    FrmMenu_Geral.acAgenda_Telefonica.Enabled := false;
  end;

end;

procedure TFrmControle_Acesso.btOKClick(Sender: TObject);
var
  login, senha: AnsiString;
  perfil, i: integer;
  qAux2: TADOQuery;
  serv: AnsiString;
begin
  mvast:= '35';
  StatusBar.Panels[1].Text := IntToStr(tentativas);
  login := EdtLogin.Text;
  senha := EdtSenha.Text;
  Mensagens(FrmControle_Acesso, StatusBar, 'Verificando Permissão de Usuário');
  Chama_Usuario;
  if not qAux.Locate('Login;Senha', VarArrayOf([login, senha]), []) then
  begin
    Application.MessageBox('Usuário não encontrado', 'Usuário inválido',
      MB_OK + MB_ICONHAND);
    EdtLogin.SetFocus;
    inc(tentativas);
    StatusBar.Panels[1].Text := IntToStr(tentativas);
    if (tentativas = 3) then
    begin
      Application.MessageBox('Você não tem permissão para acessar o sistema.',
        'Fechando...', MB_OK + MB_ICONHAND);
      close;
      Application.Terminate;
    end;

  end
  else
  begin
    {if (tipo_local = '0101') then
    begin
      Insere_Tratamento_ICMS;
    end;}

    Mensagens(FrmControle_Acesso, StatusBar, 'Verificando Atualizações no Banco de Dados');
    Atualizacoes.Verifica_Atualizacoes;

    Mensagens(FrmControle_Acesso, StatusBar, 'Verificando Configurações da Empresa');
    Variaveis_Empresa;

    usuario := qAux.FieldByName('Nome').AsString;
    usu_adm := qAux.FieldByName('Administrador').AsString;
    codigo_usu := qAux.FieldByName('Codigo').AsInteger;
    perfil := qAux.FieldByName('Codigo_Perfil').AsInteger;

    Mensagens(FrmControle_Acesso, StatusBar, 'Inicializando Dados do Usuário');
    Chama_Funcionario(codigo_usu);
    limite_desc_ven := qAux3.FieldByName('Desconto').AsFloat;
    comissao_ven := qAux3.FieldByName('Comissao').AsFloat;

    Mensagens(FrmControle_Acesso, StatusBar, 'Validando Perfil do Usuário');
    Chama_Perfil(perfil);

    //if (qAux.FieldByName('Bloqueia_Cliente').AsString = 'SIM') then
    if (bloq_cliente = 'SIM') then
      Bloqueia_Cliente;

    if (calcula_juro = 0) then
    begin
      Mensagens(FrmControle_Acesso, StatusBar, 'Verificando Contas a Receber Vencidas');
      Procura_Parcelas_Vencida;
    end;

    if (atualiza_or_vencido = 0) then
    begin
      Mensagens(FrmControle_Acesso, StatusBar, 'Verificando Orçamentos Vencidos');
      Atualiza_Orcamento_Vencido;
    end;

    //if (qAux.FieldByName('Atualiza_Preco_Orcamento').AsString = 'SIM') then
      //Bloqueia_Cliente;

    Mensagens(FrmControle_Acesso, StatusBar, 'Abrindo a Janela Principal');
    Application.CreateForm(TFrmMenu_Geral, FrmMenu_Geral);

    Mensagens(FrmControle_Acesso, StatusBar, 'Verificando Mensagens do Sistema');
    Chama_Mensagem;

    Mensagens(FrmControle_Acesso, StatusBar, 'Inicializando Cadastros');
    TLog.Info('Entrando em verifica rede');
    Verifica_Rede;


    InserirOuAtualizarMD5('R01');  {TODO -oOwner -cGeneral : RETORMAR DAQUI}
    AtualizarQuantidadeRegistro('Configuracao_ECF','QtdeECF');
    AtualizarQuantidadeRegistro('R01','QtdeR01');

    FrmMenu_Geral.Show;

    Bloqueia_Funcoes;
    Chama_Itens;

    Habilita_Timer;
    FrmMenu_Geral.StbStatus.Panels[0].Text := 'Empresa: ' + nome_fantasia;
    FrmMenu_Geral.StbStatus.Panels[1].Text := 'Usuário: ' + usuario;


    FrmControle_Acesso.close;

  end;
end;

procedure TFrmControle_Acesso.Chama_Usuario;
begin
  try
    qAux := TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('select * from Cadastro_Usuario');
      open;
    end;
  except on E:Exception do
  begin
    ShowMessage('Erro ao capturar dados do usuário: '+e.Message);
  end;
  end;
end;

procedure TFrmControle_Acesso.Chama_Perfil(perfil: integer);
begin
  with qrychama_perfil, sql do
  begin
    close;
    Connection := dm.ADOConnection1;
    clear;
    add('select * from Perfil_Usuario where Codigo = :Codigo');
    Parameters.ParamByName('Codigo').Value := perfil;
    open;
  end;
end;

procedure TFrmControle_Acesso.FormActivate(Sender: TObject);
begin
  if (eservidor = '0') then
  begin
    Mensagens(FrmControle_Acesso, StatusBar, 'Verificando Atualizações do Sistema!');
    //Verifica_Atualizacao_FTP;
  end;
end;

procedure TFrmControle_Acesso.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  // FrmControle_Acesso.Free;
  FrmControle_Acesso := nil;
end;

procedure TFrmControle_Acesso.FormCreate(Sender: TObject);
begin
  tentativas := 0;
  Registro := TRegistry.Create;
  Registro.RootKey := HKEY_CURRENT_USER;
  if Registro.KeyExists(
    'Software\Microsoft\Windows\CurrentVersion\Explorer\VOut') then
  begin
    FrmControle_Acesso.Height := 190;
    btOK.Visible := True;
    BtCancela.Visible := True;
  end
  else
  begin
    btOK.Visible := false;
    BtCancela.Visible := false;
    hd := SerialNum('C');
    //ShowMessage('Número do HD: '+hd);
    if (RemoveChar(hd) = '') then
      hd:= '2'
    else
      numero := strtoint(RemoveChar(hd)) * Fi;

    EdtChave.Text := floattostr(numero);
    FrmControle_Acesso.Height := 290;
  end;
end;

procedure TFrmControle_Acesso.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0; // anula todas as teclas
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TFrmControle_Acesso.Habilita_Timer;
begin
  FrmMenu_Geral.Timer3.Interval := tempo_atualizacao;
  FrmMenu_Geral.Timer2.Interval := tempo_atualizacao;
  FrmMenu_Geral.Timer5.Interval := 1000;
  FrmMenu_Geral.Timer5.Enabled:= true;
  FrmMenu_Geral.Enabled := True;
end;

procedure TFrmControle_Acesso.Image2Click(Sender: TObject);
begin
  shellexecute(handle, 'open', PChar(Local_Arquivo(14)+'\update.exe'), '', nil,sw_shownormal);
  Application.Terminate;
end;

function TFrmControle_Acesso.RemoveChar(const Texto: String): String;
var
  i: integer;
  S: string;
begin
  S := '';
  for i := 1 To Length(Texto) Do
  begin
    if (Texto[i] in ['0' .. '9']) then
    begin
      S := S + Copy(Texto, i, 1);
    end;
  end;
  result := S;
end;

function TFrmControle_Acesso.SerialNum(FDrive: String): String;
Var
  Serial: DWord;
  DirLen, Flags: DWord;
  DLabel: Array [0 .. 11] of Char;
begin
  Try
    GetVolumeInformation(PChar(FDrive + ':\'), DLabel, 12, @Serial, DirLen,
      Flags, nil, 0);
    result := IntToHex(Serial, 8);
  Except
    result := '';
  end;
end;

procedure TFrmControle_Acesso.Variaveis_Empresa;
begin

  with qrychama_empresa do
  begin
    close;
    open;
  end;

  codigo_empresa := qrychama_empresaCodigo.AsInteger;
  nome_fantasia := qrychama_empresaNome_Fantasia.AsString;
  razao_social := qrychama_empresaRazao_Social.AsString;
  proprietario := qrychama_empresaProprietario.AsString;
  cnae := qrychama_empresaCNAE.AsString;
  aliquota_sn := qrychama_empresaAliquota.AsString;
  custo_op := qrychama_empresaCusto_OP.AsFloat;
  regime_tributario_emitente := qrychama_empresaRegime_Tributario.AsString;
  cnpj := qrychama_empresaCNPJ.AsString;
  insc_estadual := qrychama_empresaInsc_Estadual.AsString;
  insc_municipal := qrychama_empresaInsc_Municipal.AsString;
  telefone := qrychama_empresaTelefone.AsString;
  endereco := qrychama_empresaEndereco.AsString;
  //tipo_endereco := qrychama_empresaTipo_Logradouro.AsString;
  UDeclaracao.numero := qrychama_empresaNumero.AsString;
  cidade := qrychama_empresaCidade.AsString;
  complemento := qrychama_empresaComplemento.AsString;
  contato := qrychama_empresaContato.AsString;
  telefone_contato := qrychama_empresaTelefone_Contato.AsString;
  cep := qrychama_empresaCEP.AsString;
  uf := qrychama_empresaUF.AsString;
  setor := qrychama_empresaSetor.AsString;
  email := qrychama_empresaEMail.AsString;
  senhaemail := qrychama_empresaSenha.AsString;
  smtp := qrychama_empresaSMTP.AsString;
  portasmtp := qrychama_empresaPorta.AsString;
  cod_municipio := qrychama_empresaCodigo_Municipio.AsString;
  suframa := qrychama_empresaSuframa.AsString;
  enquadramento_empresa := qrychama_empresaEnquadramento.AsString;
  Atribui_Variaveis;
end;

procedure TFrmControle_Acesso.Verifica_Rede;
begin
  TLog.Info('--- MÉTODO Verifica_Rede ---');
  // if (Verifica_Status_rede) then
  // begin
  // DeleteFile(Local_Arquivo(4));
  // inicializa dados para começar uma nova venda
  // Carrega_Dados_Servidor;
  {TLog.Debug('Tipo do local: '+tipo_local);
  if (tipo_local = '0101') then
  begin
    dm.qrychama_produto.Connection:= dm.ADOConnectionLocal;
    dm.qrychama_condicao.Connection:= dm.ADOConnectionLocal;
    dm.qrychama_veiculo.Connection:= dm.ADOConnectionLocal;
    dm.qrychama_produto_similar.Connection:= dm.ADOConnectionLocal;
    dm.qrychama_servico.Connection:= dm.ADOConnectionLocal;
    TLog.Debug('Vai executar Inicia_Dados_Cadastros');
    Inicia_Dados_Cadastros;
    //Atualiza_Produto(4, '');
  // Cria_Arquivos;
  // Inicializa_Dados_Principais_Movimentacao(0,dm.qrychama_produto);
  // Inicializa_Dados_Principais_Movimentacao(1,dm.qrychama_cliente);
  // Inicializa_Dados_Principais_Movimentacao(2,dm.qrychama_condicao);
    Inicializa_Dados_Principais_Movimentacao(5, dm.qryvenda);
    Inicializa_Dados_Principais_Movimentacao(6, dm.qryitens_venda);
    Inicializa_Dados_Principais_Movimentacao(9, dm.qrycontrola_codigo);
    Inicializa_Dados_Principais_Movimentacao(7, dm.qryr05);
    Inicializa_Dados_Principais_Movimentacao(11, dm.qryr04);
    Inicializa_Dados_Principais_Movimentacao(12, dm.qryr07);
    Inicializa_Dados_Principais_Movimentacao(13, dm.qryR06);
    Inicializa_Dados_Principais_Movimentacao(14, dm.qryfechamento_venda_aux);
  end
  else
  begin
    dm.qrychama_produto.Connection:= dm.ADOConnection1;
    dm.qrychama_condicao.Connection:= dm.ADOConnection1;
    dm.qrychama_veiculo.Connection:= dm.ADOConnection1;
    dm.qrychama_produto_similar.Connection:= dm.ADOConnection1;
    dm.qrychama_servico.Connection:= dm.ADOConnection1;
    Atualiza_Produto(4, '');
  end;}
  Atualiza_Produto(4, '');
  TLog.Info('--- FIM MÉTODO Verifica_Rede ---');
  // Inicializa_Dados_Principais_Movimentacao(15,dm.qryitens_venda_aux);
  // Inicializa_Dados_Principais_Movimentacao(18,dm.qryicms);
  // Inicializa_Dados_Principais_Movimentacao(19,dm.qryiss);
  // Inicializa_Dados_Principais_Movimentacao(20,dm.qryipi);
  // Inicializa_Dados_Principais_Movimentacao(21,dm.qrypis);
  // Inicializa_Dados_Principais_Movimentacao(22,dm.qrycofins);
  // Inicializa_Dados_Principais_Movimentacao(23,dm.qrycofins);
  // Gera_Codigo_Lancamento_Sem_Inserir;
  // end
  // else
  // Mensagem_Erro_Rede;
end;

{ threadFTP }

procedure threadFTP.conectarftp;
begin

end;

procedure threadFTP.Execute;
var
  data_serv, data_local: AnsiString;
begin
  with DM do
  begin
    try
      ftpupdate.get(lerini('CONEXAO','ARQUIVO'),lerini('CONEXAO','DIRETORIOCLIENTE')
      +'\'+lerini('CONEXAO','ARQUIVO'),true);
      FileSetDate(lerini('CONEXAO','DIRETORIOCLIENTE')
      +'\'+lerini('CONEXAO','ARQUIVO'),
      DateTimeToFileDate(ftpupdate.DirectoryListing.Items[0].ModifiedDate));
    finally
      ftpupdate.Disconnect;
      //FrmMenu_Geral.GBAtualizacao.Visible:= false;
    end;
  end;
end;

end.
