unit UDeclaracao;

interface

uses
  Windows, SysUtils, Forms, Dialogs, ExtCtrls, DateUtils, Classes, URegistro,
  ADODB, DBClient, UGeral, IniFiles, StdCtrls, Registry, Mask, ShellAPI,
  Controls, Graphics,
  WinInet, ComCtrls, DBGrids, SHDocVw, ACBrUtil, ACBrNFe, Math, Printers,
  Consts, UImpressora_Fiscal,
  StrUtils, ACBrECF, Variants, Types, Grids, DB, TLoggerUnit, ACBrBAL,
  ACBrDevice, IdHashMessageDigest, ACBrPAFRegistros, System.Generics.Collections,
  ACBrDANFCeFortesFr, ACBrNFeDANFeRLClass, pcnConversao, DadosEmissaoNFE;

{ ===============================================================================
  ********************************************************************************

  DECLARAÇÃO DAS FUNÇÕES DO TEF

  ********************************************************************************
  =============================================================================== }

function VerificaGerenciadorPadrao: boolean;
function ImprimeTransacaoTEF(pTipoRel, pVias: Integer; pValor, pCOO: AnsiString;
  IndiceImp: AnsiString): boolean;
function ConfirmaTransacao: boolean;
function ConsultaCheque: boolean;
function NaoConfirmaTransacao: boolean;
function CancelaTransacaoTEF(cNSU: string; cValor: string; cNomeRede: string;
  cNumeroDOC: string; cData: string; cHora: string; iVezes: Integer): boolean;
function FuncaoAdministrativaTEF: boolean;
function VerificaRetornoFuncaoImpressora(iRetorno: Integer): boolean;
function VerificaArquivoSTS: boolean;
function AnalizaArquivoRetorno(var Aprovado: boolean;
  var Mensagem: String): boolean;
procedure ExibeMensagem(Tempo: Integer; Mensagem: String);
procedure ExibeMensagemSemTempo(Msg: String);
function Verifica_Status_Impressora_NF(var Status: Boolean; Porta: AnsiString): Boolean;
procedure ApagaArquivosTEF;
function FuncaoVendaTEF: boolean;

{ procedure VERIFICA_GP;
  procedure VERIFICA_TEF_PENDENTE;

  function REALIZA_TRANSACAO( cIdentificacao: TDateTime; cNumeroCupom : string; cValorPago: string ): integer;
  function IMPRIMI_TRANSACAO( cFormaPGTO: string; cValorPago: string; cCOO: string; cIdentificacao: TDateTime): boolean;
  function CONFIRMA_TRANSACAO: boolean;
  function NAO_CONFIRMA_TRANSACAO: boolean;
  function CANCELA_TRANSACAO_TEF( cNSU: string; cValor: string; cNomeRede: string; cNumeroDOC: string; cData: string; cHora: string ): boolean;
  function ADMINISTRATIVO: boolean;
  function FUNCAO_ADMINISTRATIVA_TEF( cIdentificacao: TDateTime ): integer; }

{ ===============================================================================
  ********************************************************************************

  DECLARAÇÃO DAS FUNÇÕES DA BEMAFI32.DLL

  ********************************************************************************
  =============================================================================== }

// Funções de Inicialização
function Bematech_FI_AlteraSimboloMoeda(SimboloMoeda: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ProgramaAliquota(Aliquota: AnsiString; ICMS_ISS: Integer)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ProgramaHorarioVerao: Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_NomeiaDepartamento(Indice: Integer;
  Departamento: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NomeiaTotalizadorNaoSujeitoIcms(Indice: Integer;
  Totalizador: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ProgramaArredondamento: Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_ProgramaTruncamento: Integer; StdCall;
  External 'BEMAFI32.DLL' Name 'Bematech_FI_ProgramaTruncamento';
function Bematech_FI_LinhasEntreCupons(Linhas: Integer): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_EspacoEntreLinhas(Dots: Integer): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_ForcaImpactoAgulhas(ForcaImpacto: Integer): Integer;
  StdCall; External 'BEMAFI32.DLL';

// Funções do Cupom Fiscal
function Bematech_FI_AbreCupom(CGC_CPF: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_VendeItem(Codigo: AnsiString; Descricao: AnsiString;
  Aliquota: AnsiString; TipoQuantidade: AnsiString; Quantidade: AnsiString;
  CasasDecimais: Integer; ValorUnitario: AnsiString; TipoDesconto: AnsiString;
  Desconto: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VendeItemDepartamento(Codigo: AnsiString;
  Descricao: AnsiString; Aliquota: AnsiString; ValorUnitario: AnsiString;
  Quantidade: AnsiString; Acrescimo: AnsiString; Desconto: AnsiString;
  IndiceDepartamento: AnsiString; UnidadeMedida: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_CancelaItemAnterior: Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_CancelaItemGenerico(NumeroItem: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaCupom: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechaCupomResumido(FormaPagamento: AnsiString;
  Mensagem: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechaCupom(FormaPagamento: AnsiString;
  AcrescimoDesconto: AnsiString; TipoAcrescimoDesconto: AnsiString;
  ValorAcrescimoDesconto: AnsiString; ValorPago: AnsiString;
  Mensagem: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ResetaImpressora: Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_IniciaFechamentoCupom(AcrescimoDesconto: AnsiString;
  TipoAcrescimoDesconto: AnsiString; ValorAcrescimoDesconto: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EfetuaFormaPagamento(FormaPagamento: AnsiString;
  ValorFormaPagamento: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EfetuaFormaPagamentoDescricaoForma(FormaPagamento
  : AnsiString; ValorFormaPagamento: AnsiString;
  DescricaoFormaPagto: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_TerminaFechamentoCupom(Mensagem: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EstornoFormasPagamento(FormaOrigem: AnsiString;
  FormaDestino: AnsiString; Valor: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_UsaUnidadeMedida(UnidadeMedida: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AumentaDescricaoItem(Descricao: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';

// Funções dos Relatórios Fiscais
function Bematech_FI_LeituraX: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ReducaoZ(Data: AnsiString; Hora: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RelatorioGerencial(Texto: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_RelatorioGerencialTEF(Texto: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_FechaRelatorioGerencial: Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalData(DataInicial: AnsiString;
  DataFinal: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalReducao(ReducaoInicial: AnsiString;
  ReducaoFinal: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalSerialData(DataInicial: AnsiString;
  DataFinal: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalSerialReducao(ReducaoInicial
  : AnsiString; ReducaoFinal: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';

// Funções das Operações Não Fiscais
function Bematech_FI_RecebimentoNaoFiscal(IndiceTotalizador: AnsiString;
  Valor: AnsiString; FormaPagamento: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_AbreComprovanteNaoFiscalVinculado(FormaPagamento
  : AnsiString; Valor: AnsiString; NumeroCupom: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_UsaComprovanteNaoFiscalVinculado(Texto: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_UsaComprovanteNaoFiscalVinculadoTEF(Texto: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechaComprovanteNaoFiscalVinculado: Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_Sangria(Valor: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_Suprimento(Valor: AnsiString; FormaPagamento: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';

// Funções de Informações da Impressora
function Bematech_FI_NumeroSerie(NumeroSerie: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_NumeroSerieCriptografado(NumeroSerie: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroSerieDescriptografado(NumeroSerieCriptografado
  : AnsiString; NumeroSerieDescriptografado: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_SubTotal(SubTotal: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_NumeroCupom(NumeroCupom: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_LeituraXSerial: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VersaoFirmware(VersaoFirmware: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CGC_IE(CGC: AnsiString; IE: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_GrandeTotal(GrandeTotal: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_Cancelamentos(ValorCancelamentos: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_Descontos(ValorDescontos: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_NumeroOperacoesNaoFiscais(NumeroOperacoes: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroCuponsCancelados(NumeroCancelamentos: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroIntervencoes(NumeroIntervencoes: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroReducoes(NumeroReducoes: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroSubstituicoesProprietario(NumeroSubstituicoes
  : AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_UltimoItemVendido(NumeroItem: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ClicheProprietario(Cliche: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_NumeroCaixa(NumeroCaixa: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_NumeroLoja(NumeroLoja: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_SimboloMoeda(SimboloMoeda: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_MinutosLigada(Minutos: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_MinutosImprimindo(Minutos: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_VerificaModoOperacao(Modo: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_VerificaEpromConectada(Flag: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_FlagsFiscais(Var Flag: Integer): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_ValorPagoUltimoCupom(ValorCupom: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DataHoraImpressora(Data: AnsiString; Hora: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ContadoresTotalizadoresNaoFiscais(Contadores: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaTotalizadoresNaoFiscais(Totalizadores: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DataHoraReducao(Data: AnsiString; Hora: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DataMovimento(Data: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_VerificaTruncamento(Flag: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_Acrescimos(ValorAcrescimos: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_ContadorBilhetePassagem(ContadorPassagem: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaAliquotasIss(Flag: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_VerificaFormasPagamento(Formas: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaRecebimentoNaoFiscal(Recebimentos: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaDepartamentos(Departamentos: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaTipoImpressora(Var TipoImpressora: Integer)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaTotalizadoresParciais(Totalizadores: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RetornoAliquotas(Aliquotas: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_VerificaEstadoImpressora(Var ACK: Integer;
  Var ST1: Integer; Var ST2: Integer): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_DadosUltimaReducao(DadosReducao: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_MonitoramentoPapel(Var Linhas: Integer): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_VerificaIndiceAliquotasIss(Flag: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ValorFormaPagamento(FormaPagamento: AnsiString;
  Valor: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ValorTotalizadorNaoFiscal(Totalizador: AnsiString;
  Valor: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_TotalIcmsCupom(ValorIcms: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_DataHoraGravacaoUsuarioSWBasicoMFAdicional
  (dataUsuario: AnsiString; dataSoftwareBasico: AnsiString;
  letraAdicional: AnsiString): Integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_VendaBruta(Valor: AnsiString): Integer; stdcall;
  external 'BEMAFI32.DLL';

// Funções de Autenticação e Gaveta de Dinheiro
function Bematech_FI_Autenticacao: Integer; StdCall;
  External 'BEMAFI32.DLL' Name 'Bematech_FI_Autenticacao';
function Bematech_FI_ProgramaCaracterAutenticacao(Parametros: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AcionaGaveta: Integer; StdCall;
  External 'BEMAFI32.DLL' Name 'Bematech_FI_AcionaGaveta';
function Bematech_FI_VerificaEstadoGaveta(Var EstadoGaveta: Integer): Integer;
  StdCall; External 'BEMAFI32.DLL';

// Funções para a Impressora Restaurante
function Bematech_FIR_AbreCupomRestaurante(Mesa: AnsiString;
  CGC_CPF: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_RegistraVenda(Mesa: AnsiString; Codigo: AnsiString;
  Descricao: AnsiString; Aliquota: AnsiString; Quantidade: AnsiString;
  ValorUnitario: AnsiString; FlagAcrescimoDesconto: AnsiString;
  ValorAcrescimoDesconto: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FIR_CancelaVenda(Mesa: AnsiString; Codigo: AnsiString;
  Descricao: AnsiString; Aliquota: AnsiString; Quantidade: AnsiString;
  ValorUnitario: AnsiString; FlagAcrescimoDesconto: AnsiString;
  ValorAcrescimoDesconto: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FIR_ConferenciaMesa(Mesa: AnsiString;
  FlagAcrescimoDesconto: AnsiString; TipoAcrescimoDesconto: AnsiString;
  ValorAcrescimoDesconto: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FIR_AbreConferenciaMesa(Mesa: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FIR_FechaConferenciaMesa(FlagAcrescimoDesconto: AnsiString;
  TipoAcrescimoDesconto: AnsiString; ValorAcrescimoDesconto: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_TransferenciaMesa(MesaOrigem: AnsiString;
  MesaDestino: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_ContaDividida(NumeroCupons: AnsiString;
  ValorPago: AnsiString; CGC_CPF: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FIR_FechaCupomContaDividida(NumeroCupons: AnsiString;
  FlagAcrescimoDesconto: AnsiString; TipoAcrescimoDesconto: AnsiString;
  ValorAcrescimoDesconto: AnsiString; FormasPagamento: AnsiString;
  ValorFormasPagamento: AnsiString; ValorPagoCliente: AnsiString;
  CGC_CPF: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_TransferenciaItem(MesaOrigem: AnsiString;
  Codigo: AnsiString; Descricao: AnsiString; Aliquota: AnsiString;
  Quantidade: AnsiString; ValorUnitario: AnsiString;
  FlagAcrescimoDesconto: AnsiString; ValorAcrescimoDesconto: AnsiString;
  MesaDestino: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_RelatorioMesasAbertas(TipoRelatorio: Integer): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_ImprimeCardapio: Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FIR_RelatorioMesasAbertasSerial: Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FIR_CardapioPelaSerial: Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FIR_RegistroVendaSerial(Mesa: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FIR_VerificaMemoriaLivre(Bytes: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FIR_FechaCupomRestaurante(FormaPagamento: AnsiString;
  FlagAcrescimoDesconto: AnsiString; TipoAcrescimoDesconto: AnsiString;
  ValorAcrescimoDesconto: AnsiString; ValorFormaPagto: AnsiString;
  Mensagem: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FIR_FechaCupomResumidoRestaurante(FormaPagamento: AnsiString;
  Mensagem: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';

// Função para a Impressora Bilhete de Passagem
function Bematech_FI_AbreBilhetePassagem(ImprimeValorFinal: AnsiString;
  ImprimeEnfatizado: AnsiString; Embarque: AnsiString; Destino: AnsiString;
  Linha: AnsiString; Prefixo: AnsiString; Agente: AnsiString;
  Agencia: AnsiString; Data: AnsiString; Hora: AnsiString; Poltrona: AnsiString;
  Plataforma: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';

// Funções de Impressão de Cheques
function Bematech_FI_ProgramaMoedaSingular(MoedaSingular: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ProgramaMoedaPlural(MoedaPlural: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaImpressaoCheque: Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_VerificaStatusCheque(Var StatusCheque: Integer): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ImprimeCheque(Banco: AnsiString; Valor: AnsiString;
  Favorecido: AnsiString; Cidade: AnsiString; Data: AnsiString;
  Mensagem: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_IncluiCidadeFavorecido(Cidade: AnsiString;
  Favorecido: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ImprimeCopiaCheque: Integer; StdCall;
  External 'BEMAFI32.DLL' Name 'Bematech_FI_ImprimeCopiaCheque';

// Outras Funções
//Funcoes do GerarRegistrOpafEcf
    function ValidaIntervalo: Boolean;
    procedure Assina_Arquivo;
    procedure Carrega_Dados_Meios_PagamentoA2(datai, dataf : string);
    procedure Carrega_Dados_ProdutosP2;
    procedure Carrega_Dados_EstoqueE2(FormAberto: AnsiString);
    procedure Carrega_Dados_ECFE3(datai, dataf : string);
    procedure Carrega_Dados_D2(datai, dataf : string);
    procedure Carrega_Dados_D3(datai, dataf : string);
    procedure Carrega_Dados_D4;
    procedure Carrega_Dados_R01;
    procedure Carrega_Dados_R02(datai, dataf : string);
    procedure Carrega_Dados_R03(datai, dataf : string);
    procedure Carrega_Dados_R04(datai, dataf : string);
    procedure Carrega_Dados_R05(datai, dataf : string);
    procedure Carrega_Dados_R07(qrOnde, datai, dataf : String);
    procedure Carrega_Dados_R06(datai, dataf : string);
    procedure PreencherHeader(Header: TRegistroX1);

// Fim Funcoes
function Bematech_FI_AbrePortaSerial: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RetornoImpressora(Var ACK: Integer; Var ST1: Integer;
  Var ST2: Integer): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechaPortaSerial: Integer; StdCall;
  External 'BEMAFI32.DLL' Name 'Bematech_FI_FechaPortaSerial';
function Bematech_FI_MapaResumo: Integer; StdCall;
  External 'BEMAFI32.DLL' Name 'Bematech_FI_MapaResumo';
function Bematech_FI_AberturaDoDia(ValorCompra: AnsiString;
  FormaPagamento: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechamentoDoDia: Integer; StdCall;
  External 'BEMAFI32.DLL' Name 'Bematech_FI_FechamentoDoDia';
function Bematech_FI_ImprimeConfiguracoesImpressora: Integer; StdCall;
  External 'BEMAFI32.DLL' Name 'Bematech_FI_ImprimeConfiguracoesImpressora';
function Bematech_FI_ImprimeDepartamentos: Integer; StdCall;
  External 'BEMAFI32.DLL' Name 'Bematech_FI_ImprimeDepartamentos';
function Bematech_FI_RelatorioTipo60Analitico: Integer; StdCall;
  External 'BEMAFI32.DLL' Name 'Bematech_FI_RelatorioTipo60Analitico';
function Bematech_FI_RelatorioTipo60Mestre: Integer; StdCall;
  External 'BEMAFI32.DLL' Name 'Bematech_FI_RelatorioTipo60Mestre';
function Bematech_FI_VerificaImpressoraLigada: Integer; StdCall;
  External 'BEMAFI32.DLL' Name 'Bematech_FI_VerificaImpressoraLigada';
function Bematech_FI_ImpressaoCarne(Titulo, Percelas, Datas: AnsiString;
  Quantidade: Integer; Texto, Cliente, RG_CPF, Cupom: AnsiString;
  Vias, Assina: Integer): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_InfoBalanca(Porta: AnsiString; Modelo: Integer;
  Peso, PrecoKilo, Total: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_BaudRateBalanca(BaudRate: Integer): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_DadosSintegra(DataInicio: AnsiString;
  DataFinal: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_IniciaModoTEF: Integer; StdCall;
  External 'BEMAFI32.DLL' Name 'Bematech_FI_IniciaModoTEF';
function Bematech_FI_FinalizaModoTEF: Integer; StdCall;
  External 'BEMAFI32.DLL' Name 'Bematech_FI_FinalizaModoTEF';
function Bematech_FI_VersaoDll(Versao: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_RegistrosTipo60: Integer; StdCall;
  External 'BEMAFI32.DLL' Name 'Bematech_FI_RegistrosTipo60';
function Bematech_FI_LeArquivoRetorno(Retorno: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_GeraRegistrosCAT52MFD(cArquivo: AnsiString;
  cData: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_GeraRegistrosCAT52MFDEx(cArquivo: AnsiString;
  cData: AnsiString; cArqDestino: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';

// Funções da Impressora Fiscal MFD
function Bematech_FI_AbreCupomMFD(CGC: AnsiString; Nome: AnsiString;
  Endereco: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaCupomMFD(CGC, Nome, Endereco: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ProgramaFormaPagamentoMFD(FormaPagto,
  OperacaoTef: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EfetuaFormaPagamentoMFD(FormaPagamento,
  ValorFormaPagamento, Parcelas, DescricaoFormaPagto: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CupomAdicionalMFD(): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_AcrescimoDescontoItemMFD(Item, AcrescimoDesconto,
  TipoAcrescimoDesconto, ValorAcrescimoDesconto: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_NomeiaRelatorioGerencialMFD(Indice, Descricao: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AutenticacaoMFD(Linhas, Texto: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AbreComprovanteNaoFiscalVinculadoMFD(FormaPagamento, Valor,
  NumeroCupom, CGC, Nome, Endereco: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_ReimpressaoNaoFiscalVinculadoMFD(): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_AbreRecebimentoNaoFiscalMFD(CGC, Nome,
  Endereco: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EfetuaRecebimentoNaoFiscalMFD(IndiceTotalizador,
  ValorRecebimento: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_IniciaFechamentoRecebimentoNaoFiscalMFD(AcrescimoDesconto,
  TipoAcrescimoDesconto, ValorAcrescimo, ValorDesconto: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechaRecebimentoNaoFiscalMFD(Mensagem: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaRecebimentoNaoFiscalMFD(CGC, Nome,
  Endereco: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AbreRelatorioGerencialMFD(Indice: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_UsaRelatorioGerencialMFD(Texto: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_UsaRelatorioGerencialMFDTEF(Texto: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_SegundaViaNaoFiscalVinculadoMFD(): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_EstornoNaoFiscalVinculadoMFD(CGC, Nome,
  Endereco: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroSerieMFD(NumeroSerie: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_VersaoFirmwareMFD(VersaoFirmware: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CNPJMFD(CNPJ: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_InscricaoEstadualMFD(InscricaoEstadual: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_InscricaoMunicipalMFD(InscricaoMunicipal: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_TempoOperacionalMFD(TempoOperacional: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_MinutosEmitindoDocumentosFiscaisMFD(Minutos: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ContadoresTotalizadoresNaoFiscaisMFD
  (Contadores: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaTotalizadoresNaoFiscaisMFD(Totalizadores
  : AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaFormasPagamentoMFD(FormasPagamento: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaRecebimentoNaoFiscalMFD(Recebimentos: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaRelatorioGerencialMFD(Relatorios: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ContadorComprovantesCreditoMFD(Comprovantes: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ContadorOperacoesNaoFiscaisCanceladasMFD
  (OperacoesCanceladas: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ContadorRelatoriosGerenciaisMFD(Relatorios: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ContadorCupomFiscalMFD(CuponsEmitidos: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ContadorFitaDetalheMFD(ContadorFita: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ComprovantesNaoFiscaisNaoEmitidosMFD
  (Comprovantes: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroSerieMemoriaMFD(NumeroSerieMFD: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_MarcaModeloTipoImpressoraMFD(Marca, Modelo,
  Tipo: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ReducoesRestantesMFD(Reducoes: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaTotalizadoresParciaisMFD(Totalizadores: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DadosUltimaReducaoMFD(DadosReducao: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalDataMFD(DataInicial, DataFinal,
  FlagLeitura: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalReducaoMFD(ReducaoInicial,
  ReducaoFinal, FlagLeitura: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalSerialDataMFD(DataInicial, DataFinal,
  FlagLeitura: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalSerialReducaoMFD(ReducaoInicial,
  ReducaoFinal, FlagLeitura: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_LeituraChequeMFD(CodigoCMC7: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_ImprimeChequeMFD(NumeroBanco, Valor, Favorecido, Cidade,
  Data, Mensagem, ImpressaoVerso, Linhas: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_HabilitaDesabilitaRetornoEstendidoMFD
  (FlagRetorno: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RetornoImpressoraMFD(Var ACK: Integer; Var ST1: Integer;
  Var ST2: Integer; Var ST3: Integer): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_AbreBilhetePassagemMFD(Embarque, Destino, Linha, Agencia,
  Data, Hora, Poltrona, Plataforma, TipoPassagem, RGCliente, NomeCliente,
  EnderecoCliente, UFDetino: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_CancelaAcrescimoDescontoItemMFD(cFlag, cItem: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_SubTotalizaCupomMFD: Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_SubTotalizaRecebimentoMFD: Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_TotalLivreMFD(cMemoriaLivre: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_TamanhoTotalMFD(cTamanhoMFD: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_AcrescimoDescontoSubtotalRecebimentoMFD(cFlag, cTipo,
  cValor: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AcrescimoDescontoSubtotalMFD(cFlag, cTipo,
  cValor: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaAcrescimoDescontoSubtotalMFD(cFlag: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaAcrescimoDescontoSubtotalRecebimentoMFD
  (cFlag: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_TotalizaCupomMFD: Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_TotalizaRecebimentoMFD: Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_PercentualLivreMFD(cMemoriaLivre: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DataHoraUltimoDocumentoMFD(cDataHora: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_MapaResumoMFD: Integer; StdCall;
  External 'BEMAFI32.DLL' Name 'Bematech_FI_MapaResumoMFD';
function Bematech_FI_RelatorioTipo60AnaliticoMFD: Integer; StdCall;
  External 'BEMAFI32.DLL' Name 'Bematech_FI_RelatorioTipo60AnaliticoMFD';
function Bematech_FI_ValorFormaPagamentoMFD(FormaPagamento: AnsiString;
  Valor: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ValorTotalizadorNaoFiscalMFD(Totalizador: AnsiString;
  Valor: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaEstadoImpressoraMFD(Var ACK: Integer;
  Var ST1: Integer; Var ST2: Integer; Var ST3: Integer): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_IniciaFechamentoCupomMFD(AcrescimoDesconto: AnsiString;
  TipoAcrescimoDesconto: AnsiString; ValorAcrescimo: AnsiString;
  ValorDesconto: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_TerminaFechamentoCupomCodigoBarrasMFD
  (cMensagem: AnsiString; cTipoCodigo: AnsiString; cCodigo: AnsiString;
  iAltura: Integer; iLargura: Integer; iPosicaoCaracteres: Integer;
  iFonte: Integer; iMargem: Integer; iCorrecaoErros: Integer; iColunas: Integer)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaItemNaoFiscalMFD(NumeroItem: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AcrescimoItemNaoFiscalMFD(NumeroItem: AnsiString;
  AcrescimoDesconto: AnsiString; TipoAcrescimoDesconto: AnsiString;
  ValorAcrescimoDesconto: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_CancelaAcrescimoNaoFiscalMFD(NumeroItem: AnsiString;
  AcrescimoDesconto: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ImprimeClicheMFD: Integer; StdCall;
  External 'BEMAFI32.DLL' Name 'Bematech_FI_ImprimeClicheMFD';
function Bematech_FI_ImprimeInformacaoChequeMFD(Posicao: Integer;
  Linhas: Integer; Mensagem: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_RelatorioSintegraMFD(iRelatorios: Integer;

  cArquivo: AnsiString;

  cMes: AnsiString;

  cAno: AnsiString;

  cRazaoSocial: AnsiString;

  cEndereco: AnsiString;

  cNumero: AnsiString;

  cComplemento: AnsiString;

  cBairro: AnsiString;

  cCidade: AnsiString;

  cCEP: AnsiString;

  cTelefone: AnsiString;

  cFax: AnsiString;

  cContato: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_GeraRelatorioSintegraMFD(iRelatorios: Integer;

  cArquivoOrigem: AnsiString;

  cArquivoDestino: AnsiString;

  cMes: AnsiString;

  cAno: AnsiString;

  cRazaoSocial: AnsiString;

  cEndereco: AnsiString;

  cNumero: AnsiString;

  cComplemento: AnsiString;

  cBairro: AnsiString;

  cCidade: AnsiString;

  cCEP: AnsiString;

  cTelefone: AnsiString;

  cFax: AnsiString;

  cContato: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DownloadMF(Arquivo: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_DownloadMFD(Arquivo: AnsiString; TipoDownload: AnsiString;
  ParametroInicial: AnsiString; ParametroFinal: AnsiString;
  UsuarioECF: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FormatoDadosMFD(ArquivoOrigem: AnsiString;
  ArquivoDestino: AnsiString; TipoFormato: AnsiString; TipoDownload: AnsiString;
  ParametroInicial: AnsiString; ParametroFinal: AnsiString;
  UsuarioECF: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';

// Funções disponíveis somente na impressora fiscal MP-2000 TH FI versão 01.01.01 ou 01.00.02
function Bematech_FI_AtivaDesativaVendaUmaLinhaMFD(iFlag: Integer): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AtivaDesativaAlinhamentoEsquerdaMFD(iFlag: Integer)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AtivaDesativaCorteProximoMFD(): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_AtivaDesativaTratamentoONOFFLineMFD(iFlag: Integer)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_StatusEstendidoMFD(Var iStatus: Integer): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_VerificaFlagCorteMFD(Var iStatus: Integer): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_TempoRestanteComprovanteMFD(cTempo: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_UFProprietarioMFD(cUF: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_GrandeTotalUltimaReducaoMFD(cGT: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DataMovimentoUltimaReducaoMFD(cData: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_SubTotalComprovanteNaoFiscalMFD(cSubTotal: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_InicioFimCOOsMFD(cCOOIni, cCOOFim: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_InicioFimGTsMFD(cGTIni, cGTFim: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';

// Função para Configuração dos Códigos de Barras
function Bematech_FI_ConfiguraCodigoBarrasMFD(Altura: Integer; Largura: Integer;
  PosicaoCaracteres: Integer; Fonte: Integer; Margem: Integer): Integer;
  StdCall; External 'BEMAFI32.DLL';

// Funções para Impressão dos Códigos de Barras
function Bematech_FI_CodigoBarrasUPCAMFD(Codigo: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasUPCEMFD(Codigo: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasEAN13MFD(Codigo: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasEAN8MFD(Codigo: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasCODE39MFD(Codigo: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasCODE93MFD(Codigo: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasCODE128MFD(Codigo: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasITFMFD(Codigo: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasCODABARMFD(Codigo: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasISBNMFD(Codigo: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasMSIMFD(Codigo: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasPLESSEYMFD(Codigo: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CodigoBarrasPDF417MFD(NivelCorrecaoErros: Integer;
  Altura: Integer; Largura: Integer; Colunas: Integer; Codigo: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';

// Funções para o PAF-ECF
function Bematech_FI_AbreDocumentoAuxiliarVenda(cIndice: AnsiString;
  cTitulo: AnsiString; cNumeroDAV: AnsiString; cNomeEmitente: AnsiString;
  cCNPJ_CPFEmitente: AnsiString; cNomeDestinatario: AnsiString;
  CNPJ_CPFDestinatario: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_UsaDocumentoAuxiliarVenda(cMercadoria: AnsiString;
  cValorUnitario: AnsiString; cValorTotal: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_FechaDocumentoAuxiliarVenda(cTotal: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_TerminaFechamentoCupomPreVenda(cMD5: AnsiString;
  cNumeroPreVenda: AnsiString; cMensagemPromocional: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DAVEmitidosRelatorioGerencial(cIndice: AnsiString;
  cDataInicial: AnsiString; cDataFinal: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_DAVEmitidosArquivo(cNomeArquivo: AnsiString;
  cDataInicial: AnsiString; cDataFinal: AnsiString; cChavePublica: AnsiString;
  cChavePrivada: AnsiString): Integer; StdCall; External ' BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalSerialDataPAFECF
  (cDataInicial: AnsiString; cDataFinal: AnsiString; cFlagLeitura: AnsiString;
  cChavePublica: AnsiString; cChavePrivada: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalSerialReducaoPAFECF
  (cCRZInicial: AnsiString; cCRZFinal: AnsiString; cFlagLeitura: AnsiString;
  cChavePublica: AnsiString; cChavePrivada: AnsiString): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_EspelhoMFD(cNomeArquivoDestino: AnsiString;
  cDadoInicial: AnsiString; cDadoFinal: AnsiString; cTipoDownload: AnsiString;
  cUsuario: AnsiString; cChavePublica: AnsiString; cChavePrivada: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ArquivoMFD(cNomeArquivoOrigem: AnsiString;
  cDadoInicial: AnsiString; cDadoFinal: AnsiString; cTipoDownload: AnsiString;
  cUsuario: AnsiString; iTipoGeracao: Integer; cChavePublica: AnsiString;
  cChavePrivada: AnsiString; iUnicoArquivo: Integer): Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_IdentificacaoPAFECF(cIndice: AnsiString;
  cNumeroLaudo: AnsiString; cCNPJDesenvolvedor: AnsiString;
  cRazaoSocial: AnsiString; cEndereco: AnsiString; cTelefone: AnsiString;
  cContato: AnsiString; cNomeComercial: AnsiString; cVersao: AnsiString;
  cPrincipalExecutavel: AnsiString; cMD5PrincipalExecutavel: AnsiString;
  cDemaisArquivos: AnsiString; cMD5DemaisArquivos: AnsiString;
  cNumerosFabricacao: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_GrandeTotalCriptografado(cGTCriptografado: AnsiString)
  : Integer; StdCall; External ' BEMAFI32.DLL';
function Bematech_FI_GrandeTotalDescriptografado(cGTCriptografado: AnsiString;
  cGTDescriptografado: AnsiString): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AbreRelatorioMeiosPagamento(cIndice: AnsiString): Integer;
  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_UsaRelatorioMeiosPagamento(cIdentificacao: AnsiString;
  cTipoDocumento: AnsiString; cValorAcumulado: AnsiString; cData: AnsiString)
  : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechaRelatorioMeiosPagamento: Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_NomeiaRelatorioMeiosDePagamento: Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_NomeiaRelatorioDocumentoAuxiliarDeVenda: Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_NomeiaRelatorioDAVEmitidos: Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_NomeiaRelatorioIdentificacaoPAFECF: Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_NomeiaRelatoriosPAFECF: Integer; StdCall;
  External 'BEMAFI32.DLL';
function Bematech_FI_AcionaGuilhotinaMFD(TipoAcionamento: Integer): Integer;
  StdCall; External 'BEMAFI32.DLL';

  

// certificações e validações
function genkkey(cChavePublica: AnsiString; cChavePrivada: AnsiString): Integer;
  stdcall; external 'sign_bema.dll';
function setLibType(iTipo: Integer): Integer; stdcall; external 'sign_bema.dll';
function generateEAD(cNomeArquivo: AnsiString; cChavePublica: AnsiString;
  cChavePrivada: AnsiString; cEAD: AnsiString; iSign: Integer): Integer;
  stdcall; external 'sign_bema.dll';
function validateFile(cNomeArquivo: AnsiString; cChavePublica: AnsiString;
  cChavePrivada: AnsiString): Integer; stdcall; external 'sign_bema.dll';
function md5FromFile(NomeArq: AnsiString; MD5: AnsiString): Integer; stdcall;
  external 'sign_bema.dll';

/// epson
function EPSON_RelatorioFiscal_LeituraX: Word StdCall;
  External 'InterfaceEpson.DLL';
function EPSON_Serial_Abrir_PortaEX: Word StdCall;
  External 'InterfaceEpson.DLL';
function EPSON_Fiscal_Abrir_Cupom(CPF_CNPJ, Nome, End1, End2,
  Posicao: AnsiString): Word StdCall; External 'InterfaceEpson.DLL';
function EPSON_Obter_Estado_ImpressoraEX(Estado_Impressora: array of PAnsiChar;
  Estado_Fiscal: array of PAnsiChar; Retorno_Comando: array of PAnsiChar;
  MsgErro: array of PAnsiChar): Word StdCall; External 'InterfaceEpson.DLL';

procedure Analisa_iRetorno();
procedure Retorno_Impressora;
function Verifica_Reducao: boolean;

// mensagens
procedure Mensagem_Falta_Dados;
procedure Mensagem_Codigo_Barra;
procedure Mensagem_Erro_Rede;
procedure Mensagem_Fim_Pesquisa;
procedure Mensagem_Item_Inserido;
function Confirma_Cancelar_Item_Generico: boolean;
function Confirma_Exclusao: boolean;
function Confirma_Devolucao: boolean;
function Confirma_Cancalamento_Cupom: boolean;
function Confirma_Pre_Venda: boolean;
function Cancela_DAV: boolean;
function Confirma_Delete: boolean;
procedure Registro_Nao_Selecionado;
procedure Item_Ja_Cancelado;
procedure Erro_Atualizar_Itens_Venda;
function Caixa_Operacao(Msg: Integer): string;
procedure Valor_Invalido;
procedure Nao_Selecionado;
procedure DAV_Cancelado;
procedure Item_Nao_Selecionado;
procedure Nao_Ha_Registro;
procedure Multiplos_Cartoes;
procedure Arquivo_Gerado(Caminho: string);
procedure Espelho_MFD;
procedure Arquivo_MFD;
procedure Processo_Concluido;
procedure Pre_Venda_Gerada;
procedure Erro_Processo;
procedure Cancele;
procedure Salve;
procedure Cupom_Encontrado;
procedure Nao_Fecha_Cupom;
procedure Pedido_Gerado;
procedure Impressora_Desligada;
procedure Mensagem_Erro;
procedure Acesso_Nao_Permitido;
function Cupom_Nominal: Integer;
procedure Erro_Comunicacao_Servidor;
procedure Erro_Comunicacao_Servidor_2;
procedure Erro_Comunicacao_Servidor_Local;
function Impressora_Nao_Responde_TEF: boolean;
procedure Gerenciador_Padrao;
procedure Item_Selecionado_DBGrid;
function Confirma_Processo: boolean;
procedure Impossivel_Excluir_Registro;
procedure Mensagem_Erro_Com_Except(Mensagem: String);
procedure Operacao_Nao_Completada(ErroEspecifico: String);
procedure Mensagem_Erro_Entrada(Texto: AnsiString);
procedure Mensagem_Venda_Andamento;
procedure Mensagem_NCN_TEF;
procedure Mensagem_Cotacao_Existente;
procedure Mensagem_Produto_Nao_Encontrado;
procedure Mensagem_Troco_TEF;
procedure Produto_Ja_Lancamento_Venda;
procedure Mensagem_Venda_Produto_Peso;
procedure Mensagem_Produto_Inserido;
procedure Mensagem_Ja_Houve_Reducao;
procedure Mensagem_Faca_Reducao;
procedure Mensagem_Nao_E_PP;
procedure Mensagem_Cupom_Cancelado;
procedure Mensagem_Ja_Cupom_Cancelado;
procedure Mensagem_Tributacao_Incorreta;
procedure Mensagem_Operacao_Nao_Permitida;
procedure Mensagem_Cliente_Bloqueado;
procedure Mensagem_Impossivel_Abrir_Form;

// -------------------------fim mensagens------------------//

function Local_Arquivo(Local: Integer): string;
function Dias_Uteis(DataI, DataF: TDateTime): Integer;
function Primeiro_Dia(Data: TDateTime): TDateTime;
function UltimoDia(fData: TDateTime): TDateTime;
function AnoBis(Data: TDateTime): boolean;
procedure Centraliza_Form(Form: TForm);
procedure Centraliza_Form_Full_Screen(Form: TForm);
// procedure Dados_Principais_ECF;
// procedure Versao_Impressora;
procedure Captura_Chave;
procedure GeraChave;
procedure Abre_Form_Modal(Form: TForm);
procedure Abre_Form(Frm: TFormClass);
function Alinha_Centro(Texto: String; Tamanho: Integer): Integer;
function Alinha_Centro_Texto(Texto: String; Posicao_Inicial: Integer;
  Tamanho: Integer): Integer;
function Criptografa(Texto: string; chave: Byte): String;
procedure GeraArquivoNPAFECF;
function GeraMD5PAFECF: AnsiString;
procedure GeraArqMD5;
procedure GerarRegistroPafEcf(datai, dataf, FormAberto : string);
function Retorna_Interrogacao_Espaco_Branco(Texto: AnsiString; QtdeCaracter: integer): AnsiString;
function GeraMD5(Valores: array of AnsiString): AnsiString;
procedure AtualizaMD5(Tabela, MD5, CampoCondicao, ValorCondicao: String; Conexao: TADOConnection);
procedure InserirE3(num_fab, mf_adicional, tipo_ecf, marca_ecf, modelo_ecf, md5 : String; dt_estoque : TDate; hr_estoque: AnsiString);
//procedure CapturaContadoresECF;
procedure InserirNaTabelaDeMD5Geral(var codProduto: Integer; MD5: AnsiString);
procedure AtualizarMD52(codProduto: Integer; MD5: AnsiString);
function BuscaCamposProdutoMD5(var codProduto: Integer): AnsiString;
procedure AtualizarQuantidadeRegistro(tabela, campo: String);
function PegaQtdeRegistroTabela(tabela: AnsiString): Integer;
function PegaQtdeRegistroPAFQuantidadeRegistros(campo: AnsiString): Integer;
function RetornaUltimoIdProduto(): Integer;
function BuscaCodigoProduto(codProduto: Integer): AnsiString;
function RetornaValoresCamposGerarMD5(tabela: string): AnsiString;
procedure InserirOuAtualizarMD5(tabela: string);
procedure AtualizaMD51(codProduto: Integer; MD5: AnsiString);
// procedure CapturaContadoresECF;
procedure Busca_Dados_SoftwareHouse;
procedure Busca_ECFS;
procedure Busca_Arquivos_PAF;
procedure CarregaMD5_Principal;
// procedure Captura_Numero_Caixa;
// procedure Captura_Ultimo_Item;
// procedure Captura_Sub_Total;
// procedure Captura_Data_Hora_Documento;
// procedure Captura_Data_Inicio_Documento;
// procedure Captura_Data_Movimento;
// procedure Captura_Venda_Bruta;
// procedure Captura_Data_Hora_Reducao;
procedure Coleta_Dados_R06;
procedure Registra_R06;
// procedure Totalizador_Parcial;
procedure AlteraGT(GT: Double; N_Fabricacao: AnsiString);
function Gera_Codigo_Cadastro(Tabela: AnsiString): Integer;
function Gera_Codigo_Indetity(Tabela: AnsiString): Integer;
procedure Gera_N_Pedido(var Conexao: TADOConnection);
procedure SetUncommitted(Conexao: TADOConnection);
procedure Gera_N_Pre_Venda(var Conexao: TADOConnection);
procedure Gera_Codigo_Lancamento(var Conexao: TADOConnection);
procedure Gera_Codigo_Lancamento_Local;
procedure Gera_Codigo_Lancamento_Sem_Inserir;
function ZeroEsquerda(fTermo: String; fQuant: Integer): String;
function AlinhaTXT(pTexto: String; pAlinha, pTamanho: Integer): String;
function FiltraNumero(fAux: String): string;
procedure Rede_Disponivel;
// procedure COO_INI_FIN;
// procedure Grande_Total;
// procedure Verifica_Impressora_Ligada;
// function Verifica_Impressora_Ligada_Sem_Mensagem: boolean;
// procedure Verifica_Pouco_Papel;
// procedure Verifica_Fim_Papel;
// function Verifica_Fim_Papel_Sem_Mensagem: boolean;
procedure Verifica_Status_Impressora;
// procedure Verifica_Cupom_Aberto;
procedure Inicializa_Dados_Principais_Movimentacao(Arquivo: Integer;
  DataSet: TADOQuery);
procedure Carrega_Dados_Servidor;
procedure Cria_Arquivos;
procedure Atualiza_Estoque(var Conexao: TADOConnection; Valor: Double; Codigo: Integer);
procedure Atualiza_Estoque_Reservado(Valor: Double; Codigo: Integer);
procedure Atualiza_Volume(var Conexao: TADOConnection; Valor: Double; Codigo: Integer);
function Verifica_Produto_Saida(Qtde: Double): boolean;
function Verifica_Produto_Entrada(Qtde: Double): boolean;
function Verifica_Desconto(Valor: Double): boolean;
function Verifica_Credito(Valor: Double): boolean;
function Carrega_Tipo_Local: Integer;
procedure Habilita_Ctrl_Alt_Del(YesNo: boolean);
procedure Habilita_Outras_Teclas(Form: TForm; YesNo: boolean);
procedure Altera_MD5_Arquivos(Valor: AnsiString);
procedure Deleta_Arquivos_Temp;
procedure Criptografa_Arquivo_Configuracao_Estacao;
procedure Bloqueia_Arquivos;
procedure Cancela_Pre_Venda;
function Gera_N_NFCe: integer;
function Gera_N_NFe: integer;
function Grava_N_NFCe(N_NFCe: integer): integer;
function Grava_N_NFe(N_NFe: integer): integer;
procedure GerarNFe(var TemAlertas: boolean; MemoAlertas: TMemo; DadosEmissaoNFe: TDadosEmissaoNFE; var ACBrNFe: TACBrNFe; var ACBrDanfeNFe: TACBrNFeDANFeRL; var ACBrDanfeNFCe: TACBrNFeDANFCeFortes);
procedure Escreve_Alertas(Memo: TMemo; Alerta: AnsiString);
procedure Escreve_Alerta_Geral(Memo: TMemo);
procedure Escreve_Alerta_Principal(Memo: TMemo);
procedure Grava_Pedido_Informacoes_ECF(CodigoPedido: integer; NFabricacaoECF, MFAdicional, TipoECF, MarcaECF,
ModeloECF, COO, COOVin, NSequencia, MD5: AnsiString; Conexao: TADOConnection);
procedure Calcula_Estoque_Fabricacao(Produto: integer; Qtde_Produzida: double;
  Data_Fabricacao: TDate; Conexao: TADOConnection);
// function Reducao_Z_Pendente: boolean;
function Movimento_Fechado: boolean;
// procedure Data_Hora_GravacaoSWBasicoMFAdicional;
procedure Inicializa_Variaveis_TEF;

function Pega_ICMS_NC(Grupo: Integer; var Conexao: TADOConnection): boolean;
function Pega_ICMS_NC_Outro(Grupo: Integer; Origem, Destino: AnsiString;
  Conexao: TADOConnection): boolean;
function Pega_ICMS_Saida(Grupo: Integer; UF1, UF2: AnsiString;
  Conexao: TADOConnection): boolean;
procedure Pega_ICMS_Qualquer(Grupo: Integer; UF1, UF2: AnsiString;
  var Conexao: TADOConnection);
procedure Pega_ICMS_Entrada(Grupo: Integer; Origem, Destino: AnsiString);

procedure Pega_ISS(Grupo: Integer);

procedure Pega_IPI_NC(Grupo: Integer);
procedure Pega_IPI_Saida(Grupo: Integer; var Conexao: TADOConnection);
procedure Pega_IPI_Entrada(Grupo: Integer);

procedure Pega_PIS_NC(Grupo: Integer);
procedure Pega_PIS_Saida(Grupo: Integer; var Conexao: TADOConnection);
procedure Pega_PIS_Entrada(Grupo: Integer);

procedure Pega_COFINS_NC(Grupo: Integer);
procedure Pega_COFINS_Saida(Grupo: Integer; var Conexao: TADOConnection);
procedure Pega_COFINS_Entrada(Grupo: Integer);

procedure Inicia_Dados_Cadastros;
procedure Mensagens(Form: TForm; Lbl: TLabel; Mensagem: AnsiString); overload;
procedure Mensagens(Form: TForm; Stb: TStatusBar;
  Mensagem: AnsiString); overload;

procedure Atualiza_Impostos(Valor_Total: Double);
function Retorna_Aliquota_NCM(NCM, Origem: AnsiString;
  var Conexao: TADOConnection): Double;

procedure Busca_Cadastro(EdtCodigo, EdtDescricao: TEdit; Tipo: Integer;
  Tabela: AnsiString);
procedure Busca_Cadastro_Fornecedor(EdtCodigo, EdtDescricao: TEdit;
  UF: AnsiString);
procedure Busca_Cadastro_CFOP(EdtCodigo, EdtDescricao, EdtDescricao2: TEdit);
function Busca_CFOP(CodigoCFOP: integer): AnsiString;
procedure Busca_Cadastro_Grupo(EdtCodigo, EdtDescricao, EdtCICMS, EdtICMS,
  EdtCIPI, EdtIPI, EdtCPIS, EdtPIS, EdtCCOFINS, EdtCOFINS, EdtDescVista,
  EdtDescPrazo, EdtComisVista, EdtComisPrazo: TEdit);
procedure Atualiza_Produto(CampoPesquisa: Integer; TextoPesquisa: AnsiString);
procedure Pega_Tabela_Preco(Tabela, Produto: Integer);
function Pega_Total_Produto(Pedido: Integer;
  var Conexao: TADOConnection): Double;
function Pega_Total_Pedido(Pedido: Integer;
  var Conexao: TADOConnection): Double;
function Pega_Total_Desconto(Pedido: Integer;
  var Conexao: TADOConnection): Double;
function Pega_Total_Impostos(Pedido: Integer;
  var Conexao: TADOConnection): Double;
procedure Chama_Mensagem;
procedure Pega_Endereco(Edt: TEdit);
procedure Pega_Setor(Edt: TEdit);
procedure Pega_Cidade(Edt: TEdit);
procedure Cadastra_Setor(Descricao: AnsiString; Data_Cadastro: TDate);
procedure Cadastra_Cidade(Descricao, UF, DDD: AnsiString; Data_Cadastro: TDate;
  Codigo_Municipio: AnsiString; Codigo_Pais: Integer);
procedure Cadastra_Logradouro(Descricao, Tipo_Logradouro, CEP: AnsiString;
  Data_Cadastro: TDate);
procedure Atualiza_Orcamento_Vencido;
procedure Procura_Parcelas_Vencida;
procedure Atualiza_Parcelas_Vencida(Valor: Double; Codigo, Parcela: Integer;
  Data: TDate);
function Calcula_Valor_Porcentagem(Desconto: Double;
  Valor_Produto: Double): Double;
procedure Bloqueia_Funcoes;
procedure Verifica_Arquivos_PAF;
function Verifica_Atualizacao_Sistema(pathatua: String): boolean;
function GetTmpFileName(ext: AnsiString): AnsiString;
function GetTmpDir: AnsiString;
procedure Pega_INI_Conexao;
procedure Pega_INI_Balanca;
function Verifica_Status_Rede(IP: AnsiString): boolean;
procedure Insere_Tratamento_ICMS;
function Conecta_Balanca(Balanca: TACBrBal): boolean;
procedure ForceForegroundWindow(hwnd: THandle);
Function VersaoExe: String;
procedure Foco_Aplicacao;
function Verifica_Gerenciador_Padrao_Ativo: boolean;
procedure Backup_Config;
procedure Copia_Config;
function Verifica_Permissao_Impressora: Boolean;
function ConverteACBr(cmd: String): String;
procedure Insere_Historico(Usuario, Historico, Hora, Tipo_Operacao: AnsiString;
  Data: TDate);
procedure Insere_Movimentacao_Estoque(Codigo_Empresa, Codigo_Produto: Integer;
  Codigo_Venda, Descricao, Natureza: AnsiString; Data: TDate;
  Estoque_Atual, Quantidade, Valor_Compra, Valor_Total, Custo_Medio,
  Saldo_Quantidade, Saldo_Valor: Double; Codigo_Funcionario: Integer);
procedure Atualiza_Estoque_Itens_Pedido(Produto, Codigo_Venda: Integer;
  Qtde: Double; Conexao: TADOConnection);
procedure Atualiza_Saldo_Estoque(var Conexao: TADOConnection; Codigo: Integer; Saldo: Double);
procedure Atualiza_Nota_Cancelada(Nota: AnsiString; Codigo: Integer);
procedure Atualiza_Custo_Produto(Codigo: Integer; Custo_Medio: Double);

function Pega_Codigo_Produto_Fornecedor(Fornecedor: Integer; Produto: Integer)
  : AnsiString;
procedure Atualiza_Codigo_Produto_Fornecedor(Codigo_Fornecedor: AnsiString;
  Fornecedor: Integer; Produto: Integer);

procedure Atualiza_R04(Pedido: Integer);
procedure Atualiza_R04_Sem_Rede(Pedido: Integer);
procedure Atualiza_R04_Aux(Pedido: Integer);
procedure Atualiza_Status_Pedido(var Conexao: TADOConnection;Pedido: Integer; Status: AnsiString);
// procedure Atualiza_Status_Fechamento_Venda(Pedido: Integer; Status: AnsiString);
procedure Atualiza_Status_Pedido_Sem_Rede(Pedido: Integer; Status: AnsiString);
procedure Atualiza_Status_NFe(Pedido: Integer; Status, Tipo: AnsiString);
procedure Verifica_Valor_Negativo(Valor: Double; Edit: TEdit);
procedure Verifica_Edit_Branco(Edit: TEdit);
procedure Verifica_Valor_Negativo_Desconto(Valor: Double; Edit: TEdit);

procedure Insere_Produto_Aux;
procedure Delete_Produto_Aux;

procedure Insere_Tabela_Aux;
procedure Insere_Itens_Tabela_Aux;
procedure Delete_Tabela_Aux;
procedure Delete_Itens_Tabela_Aux;
function ValidaGT: Boolean;
function ValidaSN: Boolean;
procedure Verifica_Erros_Ao_Gerar_Cupom;

procedure Atualiza_Cheque(Data, Status: AnsiString; N_Cheque: Integer);
procedure Atualiza_Conta(Codigo, Parcela: Integer;
  Data_Pagamento, Status, Codigo_Conta, Codigo_Cheque: AnsiString;
  Valor_Pagar, Desconto, Acrescimo, Valor_Restante, Valor_Pago: Double;
  Codigo_Forma_Pagamento: Integer);
procedure Atualiza_Saldo_Bancario(Codigo: Integer; Saldo: Double);
procedure Deleta_Lancamento_Bancario(N_Documento: Integer);
procedure Verifica_Validade_Sistema;
procedure Atualiza_Validade_Sistema(Data_Ativacao, Data_Validade,
  Ultimo_Acesso: TDate);
procedure Atualiza_Ultimo_Acesso;
procedure Verifica_Ultimo_Acesso;
procedure Cria_Arquivo_Controle_Validade(chave: string);
procedure Cria_Arquivo_Atualiza_Produto;
procedure Cria_Arquivo_Atualiza_Dados(Qual: AnsiString);
procedure Cria_Arquivo_Qualquer(Qual: AnsiString);
procedure Cria_Arquivo_Atualiza_CondPag;
procedure Verifica_Arquivos_Validacao;
procedure Verifica_Chave;
procedure Insere_Pedido_Aux(N_Pedido, COO: AnsiString; Data: TDate;
  Valor: Double);
procedure Altera_Pedido_Aux(N_Pedido, COO: AnsiString);
procedure Pega_Caixa;
procedure Pega_Caixa_Pendente;
procedure Atualiza_Caixa_Movimento;
function obterMenuNivel1(arvore: TTreeView; Texto: string): TTreeNode;
function Calcula_Valor(Valor: AnsiString): Double;
function Calcula_Valor2(Valor: Double): Double;
function Calcula_Valor_Tres_Casas(Valor: AnsiString): Double;
function Truncar(Valor: Double; Decimal: Integer): Double;
procedure Pega_Bandeira(Bandeira: AnsiString);
function Pega_Bandeira_Pendente: AnsiString;
procedure Deleta_Bandeira_Pendente;
procedure Pega_Atalho_Tabela(Atalho: Char);
procedure Mapa_Resumo;
procedure LoadXML(MyMemo: TMemo; MyWebBrowser: TWebBrowser);
procedure Pega_Certificado_Digital(ACBr: TACBrNFe);
procedure Verifica_Form_Aberto(Form: TForm);
function Calcula_Juro_Composto(Principal, Taxa: Double; Meses: Integer): Double;
function Retorna_Juro_Composto(Principal, Taxa: Double; Meses: Integer): Double;
procedure SetDefaultPrinter(PrinterName: AnsiString);
procedure Gera_Codigo_Lancamento_Financeiro;
procedure Deleta_Lancamento_Financeiro();
procedure Zebra_DBGrid(Query: TADOQuery; Grid: TDBGrid);
procedure Bloqueia_Cliente();
procedure BloqDesbloqCliente(Bloqueado: AnsiString; Cliente: Integer);
function CalculaDigEAN13(Cod: String): String;
procedure Inicia_Impressora;
function Remove_Zero_Esquerda(Texto: AnsiString): AnsiString;
function Remove_Virgula(Texto: AnsiString): AnsiString;
procedure GravarINI(tabela_ini, campo_ini, valor_ini: string);
function LerINI(tabela_ini, campo_ini: string): string;
procedure Verifica_Atualizacao_FTP();
procedure Limpa_Tributos;
function Pega_Credito_Cliente(Cliente: Integer): Double;
procedure Atualiza_Abertura;
procedure Atualiza_Fechamento;
procedure Limpa_Dados_N_Pedido;
procedure Atualiza_Codigo_Tabela_Padrao(Codigo_Tabela_Padrao: Integer);
procedure Atualiza_Estoque_Acima(var Conexao: TADOConnection);
procedure Verifica_Data(Componente: TMaskEdit);
procedure SetupGridPickList(Grid: TDBGrid; FieldName, SQL: AnsiString);
procedure ValidaCampos(DataSet: TDataSet; Grid: TDBGrid);
procedure Inicia_Transacao(Conexao: TADOConnection);
procedure Confirma_Transacao(Conexao: TADOConnection);
procedure Cancela_Transacao(Conexao: TADOConnection);
function Verifica_NCM_Ja_Existe(Codigo_NCM: AnsiString;
  var Conexao: TADOConnection): boolean;
procedure Atualiza_NFe_Banco(chave, Protocolo, Nota_Fiscal, Tipo,
  Status: AnsiString; Codigo: Integer; Data: TDateTime; var Conexao: TADOConnection);
procedure Atualiza_NFCe_Banco(chave, Protocolo, Nota_Fiscal, Tipo,
  Status: AnsiString; Codigo: Integer; Data: TDateTime; var Conexao: TADOConnection);
function Retorna_Tipo_Pedido(Codigo: Integer): AnsiString;
procedure AtualizaEstoqueConsultaNFE(numPedido : Integer);
function Retorna_Codigo_Pedido_Pelo_N_Pedido(N_Pedido: AnsiString): Integer;
function Retorna_Data_Formatada(Data, Formato: AnsiString): AnsiString;
function Retorna_Hora_Formatada(Hora: AnsiString): AnsiString;
function Retorna_Aliquota(AliquotaSemFormatacao: AnsiString): Integer;
procedure Analisa_Lista_Unidade(var ListaUnidades:TList<AnsiString>; UN: AnsiString);
function Retorna_Descricao_Unidade(UNSigla: AnsiString): AnsiString;
// function SetStatementFromQuery(CDS: TClientDataSet): String;

var
  R06: URegistro.TR06;
  R03: URegistro.TR03;
  Util: TUtil;
  iRetorno, iTransacao: Integer;
  Reducao, Habilitado, ECF_Bloqueado, Houve_Reducao, Gerencial,
    impressora_ligada: boolean;
  Codigo_Empresa, Flag, codigo_caixa: Integer;

  razao_social, nome_fantasia, proprietario, CNPJ, insc_estadual, aliquota_sn,
    enquadramento_empresa, insc_municipal, Endereco, tipo_endereco, Cidade, UF,
    complemento, email, senhaemail, smtp, portasmtp, cod_municipio, suframa,
    contato, telefone_contato, CEP, cnae, setor, numero, nu_serie,
    nu_serie_inteiro, mf, data_usu, data_gra, Marca, Tipo, sModelo, n_usuario,
    d_ab, h_ab, DataF, telefone, versao_sb, perfil_arquivo, versao_efd,
    tipo_atividade, cdc, COO, gnf, grg, ccf, crz, cro, sequencia, versao_er_paf,
    cnpj_usu, insc_est_usu, DataMovimento, Data, pMD5, pMD5_Arquivos,
    cChavePublica, cChavePrivada, registroEAD, n_item, NomeArquivo, cBuffer,
    cTotalizador, cAliquota, SubTotal, dados_reducao, n_serie, mfad, modeloecf,
    n_usu, meio_pagamento, Valor_Pago, estorno, valor_estornado, d_ini, d_fim,
    data_movimento, data_reducao, hora_reducao, venda_bruta_diaria, issqn,
    desconto_subtotal, indicador_tipo_desc, acreci, indicador_tipo_acreci,
    valor_can_acre, Valor_Total, indicador_cancelamento, indicador_desc_acre,
    adquirente, cnpj_adquirente, data_emissao, cod_prod, Descricao, Qtde, unid,
    valor_un, desc_item, acre_item, valor_total_item, tot_par,
    indicador_cancelamento_item, qtde_cancelada, valor_cancelado, can_acre, IAT,
    IPPT, casa_decimal_qtde, casa_decimal_val_un, denominacao,
    data_final_emissao, hora_final_emissao, acre, tipo_acre, valor_canc_acre,
    den_op, Mensagem, tipo_venda, COOInicial, COOFinal, GrandeTotal, md5_alt,
    n_laudo, issqnn, cfop_v_d, cfop_v_f, cfop_v_d_p, cfop_v_f_p,
    caminho_pdf_carne, observacoes_carne: AnsiString;

  n_cupom: AnsiString;

  custo_op: Double;


 // // // // Vars do registro paf ecf // // // //
// var
  RegistroR02 : TR02;
  verificaModeloECF : Boolean;
  hora, fdata, sAliquota, data2: AnsiString;
  MD5E3, aux1, aux2, aux3, aux4, MD5E3Gerado, MD5D2, MD5D2Gerado, MD5E2,
    MD5E2Gerado,MD5R01, MD5R02, MD5P2, MD5R3, MD5R4, MD5R5, MD5R6, MD5R7, MD5P2Gerado, MD5A2, MD5A2Gerado: AnsiString;
  qAux, qAux2: TADOQuery;
  DataAuxDate: TDate;
  data_red1, data_red2, data_red3, data_movimentopaf, CNPJ_DESENV, DataAux, HoraAux: AnsiString;
  qMeiosPagamento, qP2, qE2, qE3, qD2, qD3, qD4, qR1, qR2, qR3, qR4, qR5, qR6,
      qR7: TADOQuery;
    caix, MD5D3Gerado, MD5D3: AnsiString;



 // / / / / / / / / / / / /

  // credito de aproveitamento do icms aliquota_sn * credito_icms/100
  credito_icms: AnsiString;

  iRelatorio, iIndex, iInTotalizador, iTotal, iConta, flagf, Aberto,
    Cupom: Integer;

  // arquivo TEF
  cArquivo: TextFile;
  Imprime_Transacao: boolean;

  // dav e pré-venda
  Codigo, N_Pedido, codigo_pre_venda, n_pre_venda: Integer;
  codigo_pedido, Pedido, codigo_pre, pre_venda: String;

  // dados da softwarehouse
  tel_des, cont_des, cnpj_des, insc_est_des, insc_mun_des, deno_des, nome_paf,
    versao_paf, end_des, nome_exe: AnsiString;

  // arquivos_paf
  arquivos_paf, arquivos_paf_aux1, arquivos_paf_aux2, arquivos_paf_aux3
    : AnsiString;

  // ECF's autorizados
  ecf1, ecf2, ecf3, ecf4, ecf5, ecf6, ecf7, ecf8, ecf9, ecf10, ecf11, ecf12,
    ecf13, ecf14, ecf15: AnsiString;

  // tef
  pNSU, pIdentifica, pNomeRede, pValor, pData, pHora, pTransacao, pNumeroCupom,
    pOperacao, pFinalizacao: AnsiString;
  gerenciadorPadrao: String;
  Tipo_Rel: Integer;
  gerenciador: boolean;

  ArqTemp: string;
  aAprovado: boolean;

  // limites para os produtos
  permissao_venda, permissao_compra: AnsiString;
  qtde_estoque, estoque_minimo, estoque_maximo, comissao_produto, saldo_estoque,
    volume_atual: Double;

  // limite para os clientes
  permissao_desconto, permissao_credito, acima_limite_credito_cliente
    : AnsiString;
  credito_cliente, limite_credito_cliente, desconto_cliente: Double;

  // armazenar última venda
  ultima_venda: Integer;

  // dados da balança
  Peso, preco, total_peso, Porta: AnsiString;

  // verifica status da rede
  sem_rede: boolean;

  // foco da aplicação
  hwnd: THandle;

  // pdv
  item_cancelamento: AnsiString;

  // controle dos arquivos do paf
  iauxpaf: Integer;

  // controle de exibição de mensagens do ecf
  ipouco_papel, iimpressora_ligada, ifim_papel: Integer;

  // recebe o CIECF (codigo) da impr. fiscal
  CIECF: AnsiString;
  // --------------------------------------inicio configurações sistema-----------------------------------------

  // configurações do sistema
  gera_pre_venda, pdv, gera_os, gera_dav, gera_nfe, gera_cupom_fiscal, maq,
    qtde_mac, modelo_dav, modelo_os, forma_emissao, ambiente, finalidade,
    impressao_danfe, logomarca, salva_xml, caminho_schema, n_certificado,
    senha_certificado, idcsc, numerocsc,

    webservice_1_producao, recepcao_1_producao, retorno_1_producao,
    status_1_producao, cancelamento_1_producao, inutilizacao_1_producao,
    consulta_1_producao, consulta_cadastro_1_producao,

    webservice_2_producao, recepcao_2_producao, retorno_2_producao,
    status_2_producao, cancelamento_2_producao, inutilizacao_2_producao,
    consulta_2_producao, consulta_cadastro_2_producao,

    webservice_1_homologacao, recepcao_1_homologacao, retorno_1_homologacao,
    status_1_homologacao, cancelamento_1_homologacao,
    inutilizacao_1_homologacao, consulta_1_homologacao,
    consulta_cadastro_1_homologacao,

    webservice_2_homologacao, recepcao_2_homologacao, retorno_2_homologacao,
    status_2_homologacao, cancelamento_2_homologacao,
    inutilizacao_2_homologacao, consulta_2_homologacao,
    consulta_cadastro_2_homologacao,

    avisa_tabela_preco, avisa_lancamento_financeiro, avisa_cheque,
    avisa_pedido_compra, avisa_aniversario_cliente,
    avisa_aniversario_funcionario, avisa_produto_vencido, fazer_backup,
    avisa_conta_fixa, avisa_cotacao_preco, porta_ecf, bloq_cliente,
    desbloq_cliente, caminho_pedido_pdf: AnsiString;

  tabela_preco, lancamento_financeiro, pedido_pendente, cheque, pedido_compra,
    aniversario_cliente, aniversario_funcionario, produto_vencido, conta_fixa,
    cotacao_preco, historico_conta, historico_conta_pagar, separacao, compra,
    entrega, recibo, orcamento_vencido: AnsiString;

  conta_mensagem, tempo_atualizacao, gerar_financeiro, tipo_impressao_pedido,
    tipo_dias: Integer;

  codigo_tabela_preco_padrao, codigo_tabela_preco_ativo, dias_aviso,
    codigo_tipo_documento, codigo_departamento, codigo_plano_financeiro,
    codigo_tipo_documento_pagar, codigo_departamento_pagar,
    codigo_plano_financeiro_pagar, dias_orcamento_vencido,
    fechar_caixa_sair_sistema, calcula_juro, atualiza_or_vencido,
    consulta_padrao_produto, tipo_desc_acr_padrao, gerar_estoque, usar_comissao,
    usar_desconto, tamanho_impressao, qtde_copias, tipo_os: Integer;


  tecla: Char;

  codigo_lancamento_financeiro, teste_ecf: Integer;
  qAux_Lancamento_Financeiro: TADOQuery;

  ean_balanca: Integer;

  Ob_Cliente_Nome, Ob_Cliente_Razao_Social, Ob_Cliente_CPF, Ob_Cliente_RG,
    Ob_Cliente_CNPJ, Ob_Cliente_Insc_Estadual, Ob_Cliente_Endereco,
    Ob_Cliente_Numero, Ob_Cliente_Setor, Ob_Cliente_Email, Ob_Cliente_Cidade,
    Ob_Cliente_Data_Nascimento, Ob_Cliente_Telefone: Integer;

    razSocialEspacoBranco : AnsiString;


  opcao_servico_marcada, controla_credito_cliente,
    busca_parametro_calculo_preco, gera_codigo_ean, codigo_cfop_padrao,
    trazer_somente_cond_pag_ecf: Integer;

  modelo_etiqueta, dpi_impressora_etiqueta, Avanco_Impressora_Etiqueta,
    Temperatura_Impressora_Etiqueta, Limpar_Memoria_Impressora_Etiqueta,
    Orientacao_Impressao_Texto_Etiqueta, Tamanho_Fonte_Texto_Etiqueta_Campo_1,
    Multiplicador_V_Texto_Etiqueta_Campo_1,
    Multiplicador_H_Texto_Etiqueta_Campo_1, Horizontal_Texto_Etiqueta_Campo_1,
    Vertical_Texto_Etiqueta_Campo_1, Tamanho_Fonte_Texto_Etiqueta_Campo_2,
    Multiplicador_V_Texto_Etiqueta_Campo_2,
    Multiplicador_H_Texto_Etiqueta_Campo_2, Horizontal_Texto_Etiqueta_Campo_2,
    Vertical_Texto_Etiqueta_Campo_2, Largura_Barra_Larga, Largura_Barra_Fina,
    Horizontal_Barra_Etiqueta, Vertical_Barra_Etiqueta, Altura_Barra,

    Tamanho_Fonte_Texto_Etiqueta_Campo_3,
    Multiplicador_V_Texto_Etiqueta_Campo_3,
    Multiplicador_H_Texto_Etiqueta_Campo_3, Horizontal_Texto_Etiqueta_Campo_3,
    Vertical_Texto_Etiqueta_Campo_3,

    Tamanho_Fonte_Texto_Etiqueta_Campo_4,
    Multiplicador_V_Texto_Etiqueta_Campo_4,
    Multiplicador_H_Texto_Etiqueta_Campo_4, Horizontal_Texto_Etiqueta_Campo_4,
    Vertical_Texto_Etiqueta_Campo_4,

    Tamanho_Fonte_Texto_Etiqueta_Campo_5,
    Multiplicador_V_Texto_Etiqueta_Campo_5,
    Multiplicador_H_Texto_Etiqueta_Campo_5, Horizontal_Texto_Etiqueta_Campo_5,
    Vertical_Texto_Etiqueta_Campo_5,

    Distancia_Horizontal_Etiqueta, Distancia_Vertical_Etiqueta,

    Balanca_Modelo, Balanca_BaudRate, Balanca_DataBits, Balanca_Parity,
    Balanca_StopBits, Balanca_Hand, Balanca_TimeOut: Integer;

  Tipo_Barra_Etiqueta, Porta_Impressora_Etiqueta, Balanca_Porta: AnsiString;

  // configuracao do INI Configuração
  tipo_local, versao_bd_cliente: AnsiString;
  // ------------------------------------------fim configurações------------------------------
  // variaveis para gerar o arquivo R07
  indicador_estorno, valor_estorno, forma_pg, valor_pag: AnsiString;

  // forma de pagamento usada
  Texto: AnsiString;

  // pegar dados de tributação do ICMS, IPI, PIS, COFINS
  qAux_ICMS, qAux_ICMS_Qualquer, qAux_ICMS_Entrada, qAux_ISS, qAux_IPI,
    qAux_IPI_Entrada, qAux_PIS, qAux_PIS_Entrada, qAux_COFINS,
    qAux_COFINS_Entrada: TADOQuery;

  // Tabela de preço
  qAux_Tabela_Preco: TADOQuery;

  // usuários
  Usuario, login, usu_adm: AnsiString;
  codigo_usu: Integer;
  limite_desc_ven, comissao_ven: Double;

  // escolha da bandeira de cartão
  PathReq, PathResp: String;
  aborta_escolha_bandeira: boolean;


  // variaveis para controlar se foi liberado pelo ADM fazer tais operações
  liberado_analise_venda, libera_alterar_usuario_caixa, liberado_desconto,
    liberado_cliente_acima_limite, libera_alterar_atendente_pedido,
    libera_visualizar_comissao_servico: boolean;


  // atualizar via ftp
  STime: TDateTime;
  tempo_medio: Double;
  bytes_transf: longword;
  tamanho_arquivo: longword;

  qAux_Produto, qAux_Endereco, qAux_Setor, qAux_Cidade: TADOQuery;

  /// /tributos
  ///
  grupo_produto_tributacao_icms, tipo_calculo_bc_icms, tipo_recolhimento_icms,
    icms, cst_icms, csosn, br_icms, bc_icms, valor_icms, Origem: AnsiString;

  tipo_calculo_bc_icms_st, mvast, icms_st, cst_icms_st, csosn_st, br_icms_st,
    ba_icms_st, bc_icms_st, valor_icms_st: AnsiString;
  tipo_calculo_bc_ipi, ipi, cst_ipi, br_ipi, ba_ipi, bc_ipi,
    valor_ipi: AnsiString;
  tipo_calculo_bc_pis, pis, cst_pis, br_pis, ba_pis, bc_pis,
    valor_pis: AnsiString;
  tipo_calculo_bc_cofins, cofins, cst_cofins, br_cofins, ba_cofins, bc_cofins,
    valor_cofins: AnsiString;

  permite_credito, codigo_obs_fiscal: Integer;

  sub_total_liquido: AnsiString;

  ECF: IImpressora_Fiscal;
  Imp_Fiscal_Escolhida: AnsiString;

  ascendente: boolean;

  valor_imposto_lei: Double;

  //NFe e NFCe
  encontrou_alertas: Boolean;
  // transportadora
  cnpj_trans, insc_trans, cpf_trans, rg_trans, endereco_trans,
    municipio_trans, uf_trans, inscricao_estadual_trans, antt, antt_reboque,
    telefone_transportadora, placa_transportadora: AnsiString;

  // emitente
  cnpj_emitente, endereco_emitente, numero_emitente, complemento_emitente,
    setor_emitente, codigo_municipio_emitente, municipio_emitente,
    uf_emitente, razao_social_emitente, telefone_emitente, cep_emitente,
    cnae_fiscal_emitente, ie_emitente, im_emitente, regime_tributario_emitente: AnsiString;

  // destinatario
  cnpj_destinatario, endereco_destinatario, numero_destinatario,
    complemento_destinatario, setor_destinatario,
    codigo_municipio_destinatario, municipio_destinatario, uf_destinatario,
    razao_social_destinatario, telefone_destinatario, cep_destinatario,
    cod_pais_destinatario, pais_destinatario, ie_destinatario,
    im_destinatario, email_destinatario, suframa_destinatario,
    enquadramento: AnsiString;

  // Dados do CFOP
    cfop: AnsiString;
    gera_fi, mostra_imposto, controla_estoque, estoque: integer;

type
  TNumeroStr = string;

function NumeroParaExtenso(parmNumero: Real): string;
function ConversaoRecursiva(N: longword): string;
function BlockInput(fBlockIt: boolean): boolean; StdCall; External 'User32.dll';

const
  insercao = 'INSERÇÃO';
  alteracao = 'ALTERAÇÃO';
  exclusao = 'EXCLUSÃO';
  consu = 'CONSULTA';
  Fi: Double = 1.6180339887;
  Pii: Double = 3.1415926535;

  Unidades: array [1 .. 19] of TNumeroStr = ('UM', 'DOIS', 'TRÊS', 'QUATRO',
    'CINCO', 'SEIS', 'SETE', 'OITO', 'NOVE', 'DEZ', 'ONZE', 'DOZE', 'TREZE',
    'QUATORZE', 'QUINZE', 'DEZESSEIS', 'DEZESSETE', 'DEZOITO', 'DEZENOVE');
  Dezenas: array [1 .. 9] of TNumeroStr = ('DEZ', 'VINTE', 'TRINTA', 'QUARENTA',
    'CINQUENTA', 'SESSENTA', 'SETENTA', 'OITENTA', 'NOVENTA');
  Centenas: array [1 .. 9] of TNumeroStr = ('CEM', 'DUZENTOS', 'TREZENTOS',
    'QUATROCENTOS', 'QUINHENTOS', 'SEISCENTOS', 'SETECENTOS', 'OITOCENTOS',
    'NOVECENTOS');
  ErrorString = 'VALOR FORA DA FAIXA';
  Min = 0.01;
  Max = 4294967295.99;
  Moeda = ' REAL ';
  Moedas = ' REAIS ';
  Centesimo = ' CENTAVO ';
  Centesimos = ' CENTAVOS ';

  { Fim da Declaração }

implementation

uses UMenu_Geral, UDAV_Emitidos, MD5, UMemoria_Fita_Detalhe, UDM, UPedido_Venda,
  UPDV, UFechamento_Venda_PDV, UEntrada_Produtos, UMensagem_Sistema,
  UMensagem_TEF, UMensagem_Erro_Gerenciador_TEF, UPre_Venda, USenha_ADM,
  UBaixar_Titulo, UBematech, UChama_Produto, UCadastro_Produto,
  UControle_Acesso, Modelo.Dominio.TConfiguracoesECFDominio, Util.Mensagens,
  Util.TLog, IdIcmpClient, UPAFECF_Registros_PAF, pcnConversaoNFe, pcnNFe,
  ACBrPosPrinter;

function NumeroParaExtenso(parmNumero: Real): string;
begin
  if (parmNumero >= Min) and (parmNumero <= Max) then
  begin
    { Tratar reais }
    Result := ConversaoRecursiva(Round(Int(parmNumero)));
    if Round(Int(parmNumero)) = 1 then
      Result := Result + Moeda
    else if Round(Int(parmNumero)) <> 0 then
      Result := Result + Moedas;
    { Tratar centavos }
    if not(Frac(parmNumero) = 0.00) then
    begin
      if Round(Int(parmNumero)) <> 0 then
        Result := Result + ' E ';
      Result := Result + ConversaoRecursiva(Round(Frac(parmNumero) * 100));
      if (Round(Frac(parmNumero) * 100) = 1) then
        Result := Result + Centesimo
      else
        Result := Result + Centesimos;
    end;
  end
  else
    raise ERangeError.CreateFmt('%g ' + ErrorString + ' %g..%g',
      [parmNumero, Min, Max]);

end;

procedure GravarINI(tabela_ini, campo_ini, valor_ini: string);
var
  ServerIni: TIniFile;
begin
  ServerIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) +
    'Atualizador.ini');
  ServerIni.WriteString(tabela_ini, campo_ini, valor_ini);
  ServerIni.UpdateFile;
  ServerIni.Free;
end;

function LerINI(tabela_ini, campo_ini: string): string;
var
  ServerIni: TIniFile;
begin
  ServerIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) +
    'Atualizador.ini');
  Result := ServerIni.ReadString(tabela_ini, campo_ini, '');
  ServerIni.Free;
end;

procedure Verifica_Atualizacao_FTP();
var
  data_serv, data_local: AnsiString;
begin
  with DM do
  begin
    ftpupdate.Host := LerINI('CONEXAO', 'FTP');
    ftpupdate.Username := LerINI('CONEXAO', 'USUARIO');
    ftpupdate.Password := LerINI('CONEXAO', 'SENHA');
    if LerINI('CONEXAO', 'PASSIVO') = 'S' then
      ftpupdate.Passive := true
    else
      ftpupdate.Passive := false;

    try
      ftpupdate.Connect;
    except
      on E: Exception do
      begin
        FrmControle_Acesso.LblAtualizacao.Caption := 'Host não encontrado';
        Mensagens(FrmControle_Acesso, FrmControle_Acesso.StatusBar,
          'Host não encontrado');
        ShowMessage(E.Message);
      end;
    end;

    ftpupdate.changedir(LerINI('CONEXAO', 'DIRETORIOSERVIDORFTP'));
    tamanho_arquivo := ftpupdate.Size(LerINI('CONEXAO', 'ARQUIVO'));

    if FileExists(LerINI('CONEXAO', 'DIRETORIOCLIENTE') + '\' +
      LerINI('CONEXAO', 'ARQUIVO')) then
    begin
      data_local := FormatDateTime('dd/mm/yyyy HH:mm',
        FileDateToDateTime(FileAge(LerINI('CONEXAO', 'DIRETORIOCLIENTE') + '\' +
        LerINI('CONEXAO', 'ARQUIVO'))));
      ftpupdate.list(nil);
      data_serv := FormatDateTime('dd/mm/yyyy HH:mm',
        ftpupdate.DirectoryListing.Items[0].ModifiedDate);
      if data_serv <> data_local then
      begin
        FrmControle_Acesso.Image2.Visible := true;
        FrmControle_Acesso.LblAtualizacao.Visible := true;
        Mensagens(FrmControle_Acesso, FrmControle_Acesso.StatusBar,
          'Atualização disponível!');
        FrmControle_Acesso.LblAtualizacao.Caption :=
          'Atualização disponível. Clique na imagem para atualizar!';
      end
      else
      begin
        Mensagens(FrmControle_Acesso, FrmControle_Acesso.StatusBar,
          'Não há atualizações!');
        FrmControle_Acesso.Image2.Visible := false;
        FrmControle_Acesso.LblAtualizacao.Visible := false;
      end;
    end
    else
    begin
      FrmControle_Acesso.LblAtualizacao.Caption :=
        'Arquivo de atualização não encontrado na pasta cliente';
    end;
  end;
end;

function ConversaoRecursiva(N: longword): string;
begin
  case N of
    1 .. 19:
      Result := Unidades[N];
    20, 30, 40, 50, 60, 70, 80, 90:
      Result := Dezenas[N div 10] + ' ';
    21 .. 29, 31 .. 39, 41 .. 49, 51 .. 59, 61 .. 69, 71 .. 79,
      81 .. 89, 91 .. 99:
      Result := Dezenas[N div 10] + ' E ' + ConversaoRecursiva(N mod 10);
    100, 200, 300, 400, 500, 600, 700, 800, 900:
      Result := Centenas[N div 100] + ' ';
    101 .. 199:
      Result := ' CENTO E ' + ConversaoRecursiva(N mod 100);
    201 .. 299, 301 .. 399, 401 .. 499, 501 .. 599, 601 .. 699, 701 .. 799,
      801 .. 899, 901 .. 999:
      Result := Centenas[N div 100] + ' E ' + ConversaoRecursiva(N mod 100);
    1000 .. 999999:
      Result := ConversaoRecursiva(N div 1000) + ' MIL ' +
        ConversaoRecursiva(N mod 1000);
    1000000 .. 1999999:
      Result := ConversaoRecursiva(N div 1000000) + ' MILHÃO ' +
        ConversaoRecursiva(N mod 1000000);
    2000000 .. 999999999:
      Result := ConversaoRecursiva(N div 1000000) + ' MILHÕES ' +
        ConversaoRecursiva(N mod 1000000);
    1000000000 .. 1999999999:
      Result := ConversaoRecursiva(N div 1000000000) + ' BILHÃO ' +
        ConversaoRecursiva(N mod 1000000000);
    2000000000 .. 4294967295:
      Result := ConversaoRecursiva(N div 1000000000) + ' BILHÕES ' +
        ConversaoRecursiva(N mod 1000000000);
  end;

end;

procedure Pega_Bandeira(Bandeira: AnsiString);
begin
  if (Bandeira = 'TEF DIAL') then
  begin
    PathReq := 'C:\Tef_Dial\Req\';
    PathResp := 'C:\Tef_Dial\Resp\';
  end
  else if (Bandeira = 'PAYGO') then
  begin
    PathReq := 'C:\Tef_Dial\Req\';
    PathResp := 'C:\Tef_Dial\Resp\';
  end
  else if (Bandeira = 'TEF DISC') then
  begin
    PathReq := 'C:\TEF_DISC\Req\';
    PathResp := 'C:\TEF_DISC\Resp\';
  end;
end;

function CalculaDigEAN13(Cod: String): String;
  function Par(Cod: Integer): boolean;
  begin
    Result := Cod Mod 2 = 0;
  end;

var
  i, SomaPar, SomaImpar: Integer;
begin
  SomaPar := 0;
  SomaImpar := 0;
  for i := 1 to 12 do
    if Par(i) then
      SomaPar := SomaPar + StrToInt(Cod[i])
    else
      SomaImpar := SomaImpar + StrToInt(Cod[i]);
  SomaPar := SomaPar * 3;
  i := 0;
  while i < (SomaPar + SomaImpar) do
    Inc(i, 10);
  Result := IntToStr(i - (SomaPar + SomaImpar));
end;

procedure Zebra_DBGrid(Query: TADOQuery; Grid: TDBGrid);
var
  GridColumn: TColumn;
  State: TGridDrawState;
  Rect: TRect;
begin
  if odd(Query.RecNo) then
  begin
    Grid.Canvas.Brush.Color := clSilver;
    Grid.Canvas.FillRect(Rect);
    Grid.DefaultDrawDataCell(Rect, GridColumn.Field, State);
    if gdFocused in State then
    begin
      Grid.Canvas.Brush.Color := clSilver;
      Grid.Canvas.FillRect(Rect);
      Grid.DefaultDrawDataCell(Rect, GridColumn.Field, State);
    end;
  end;
end;

procedure Bloqueia_Cliente();
var
  qAux2: TADOQuery;
begin
  qAux2 := TADOQuery.Create(nil);
  try
    with qAux2, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select LF.Codigo_Cli_For from Lancamento_Financeiro LF');

      add('left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)');
      add('where LF.Tipo = :Tipo and PL.Status = :Status and PL.Data_Vencimento < :data');
      Parameters.ParamByName('Tipo').Value := 'RECEBER';
      Parameters.ParamByName('Status').Value := 'PENDENTE';
      Parameters.ParamByName('data').Value := date;
      open;
    end;

    if (qAux2.IsEmpty = false) then
    begin
      qAux2.First;
      while not qAux2.Eof do
      begin
        BloqDesbloqCliente('SIM', qAux2.FieldByName('Codigo_Cli_For')
          .AsInteger);
        qAux2.Next;
      end;
      // Cria_Arquivo_Atualiza_Dados('ACli');
    end;
  finally
    FreeAndNil(qAux2);
  end;
end;

procedure Limpa_Tributos;
begin
  icms := '';
  cst_icms := '';
  br_icms := '';
  bc_icms := '';
  valor_icms := '';
  tipo_calculo_bc_icms := '';
  tipo_recolhimento_icms := '';
  csosn := '';

  Origem := '';
  grupo_produto_tributacao_icms := '';

  icms_st := '';
  cst_icms_st := '';
  br_icms_st := '';
  ba_icms_st := '';
  bc_icms_st := '';
  valor_icms_st := '';
  tipo_calculo_bc_icms_st := '';

  tipo_calculo_bc_ipi := '';
  ipi := '';
  cst_ipi := '';
  br_ipi := '';
  ba_ipi := '';
  bc_ipi := '';
  valor_ipi := '';

  tipo_calculo_bc_pis := '';
  pis := '';
  cst_pis := '';
  br_pis := '';
  ba_pis := '';
  bc_pis := '';
  valor_pis := '';

  tipo_calculo_bc_cofins := '';
  cofins := '';
  cst_cofins := '';
  br_cofins := '';
  ba_cofins := '';
  bc_cofins := '';
  valor_cofins := '';

  sub_total_liquido := '';
end;

procedure Limpa_Dados_N_Pedido;
begin
  UDeclaracao.Pedido := '';
  UDeclaracao.pre_venda := '';
  UDeclaracao.COO := '';
  UDeclaracao.ccf := '';
end;

procedure InserirE3(num_fab, mf_adicional, tipo_ecf, marca_ecf, modelo_ecf, md5 : String; dt_estoque : TDate; hr_estoque: AnsiString);
var
  qAux: TADOQuery;
begin
  try
    // DM.ADOConnection1.BeginTrans;
    try
      qAux := TADOQuery.Create(nil);
      begin
        with qAux, SQL do
        begin
          close;
          clear;
          Connection := DM.ADOConnection1;
          add('Insert into PAFE3 (num_fab, mf_adicional, tipo_ecf, marca_ecf, modelo_ecf, md5, dt_estoque, hr_estoque)');
          add(' values (:num_fab, :mf_adicional, :tipo_ecf, :marca_ecf,');
          add(':modelo_ecf, :md5, :dt_estoque, :hr_estoque)');
          Parameters.ParamByName('num_fab').Value := num_fab;
          Parameters.ParamByName('mf_adicional').Value := mf_adicional;
          Parameters.ParamByName('tipo_ecf').Value := tipo_ecf;
          Parameters.ParamByName('marca_ecf').Value := marca_ecf;
          Parameters.ParamByName('modelo_ecf').Value := modelo_ecf;
          Parameters.ParamByName('md5').Value := md5;
          Parameters.ParamByName('dt_estoque').Value := dt_estoque;
          Parameters.ParamByName('hr_estoque').Value := hr_estoque;
          ExecSQL;
        end;
      end;
    finally
      qAux.close;
      FreeAndNil(qAux);
    end;

  except
    on E: Exception do
    begin
      // DM.ADOConnection1.RollbackTrans;
      Operacao_Nao_Completada(E.Message);
    end;
  end;
end;


procedure Atualiza_Abertura;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update Abertura_Caixa set Acerto = :Acerto_Caixa');
      add('where Data_Abertura = :Dat and Codigo_Caixa = :Caixa and Acerto = :Acerto and Codigo_Usuario = :Usuario');
      Parameters.ParamByName('Acerto_Caixa').Value := 1;

      if (tipo_local = '0101') then
        Parameters.ParamByName('Dat').Value := DataF
      else
        Parameters.ParamByName('Dat').Value := date;

      Parameters.ParamByName('Caixa').Value := UDeclaracao.codigo_caixa;
      Parameters.ParamByName('Acerto').Value := 0;
      Parameters.ParamByName('Usuario').Value := UDeclaracao.codigo_usu;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Atualiza_Fechamento;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update Fechamento_Venda set Acerto = :Acerto_Caixa');
      add('where Codigo_Empresa = :Empresa and Codigo_Caixa = :Caixa and Data = :Dat and Status = :Pago');
      add('and Acerto = :Acerto and Codigo_Usuario = :Usuario and Movimenta = :Movimenta');
      Parameters.ParamByName('Acerto_Caixa').Value := 1;
      Parameters.ParamByName('Empresa').Value := UDeclaracao.Codigo_Empresa;
      Parameters.ParamByName('Caixa').Value := UDeclaracao.codigo_caixa;

      if (tipo_local = '0101') then
        Parameters.ParamByName('Dat').Value := DataF
      else
        Parameters.ParamByName('Dat').Value := date;

      Parameters.ParamByName('Pago').Value := 'PAGO';
      Parameters.ParamByName('Acerto').Value := 0;
      Parameters.ParamByName('Usuario').Value := UDeclaracao.codigo_usu;
      Parameters.ParamByName('Movimenta').Value := '0';
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure BloqDesbloqCliente(Bloqueado: AnsiString; Cliente: Integer);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update Cliente set Bloqueado = :Bloqueado');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Bloqueado').Value := Bloqueado;
      Parameters.ParamByName('Codigo').Value := Cliente;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;
procedure AtualizaEstoqueConsultaNFE(numPedido : Integer);
var
  qtdeEstoque: double;
  qAux : TADOQuery;
begin
//  try
//    try
//      qAux := TADOQuery.Create(nil);
//      with qAux, SQL do
//      begin
//        close;
//        Connection := DM.ADOConnection1;
//        clear;
//
//        add('select P.Codigo, IP.*, Cli.Codigo as Cod_Cli, PEC.Inscricao_Estadual, Cli.Insc_Municipal, Cli.Email, Cli.Suframa, Cli.Enquadramento,');
//        add('PEC.Cidade, PEC.Nome, PEC.CPF_CNPJ, PEC.UF, PEC.Codigo_Municipio, PEC.Setor, PEC.Endereco as Log, PEC.CEP, PEC.Numero, PEC.Complemento, PEC.Telefone,');
//        Add('PPD.Forma_Pagamento, PPD.Qtde_Parcela, PPD.Prazo, PPD.Taxa, PPD.Codigo_Forma_Pagamento, PPD.Forma_Pagamento, ' +
//            'PPD.Tipo_Pagamento, Pro.Estoque, Pro.Volume, Pro.Valor_Compra as Valor_Compra_Atual from Itens_Pedido IP ' +
//            'left join Pedido P on (IP.Codigo = P.Codigo) ' +
//            'left join Cliente Cli on (P.Codigo_Cliente = Cli.Codigo) ' +
//            'left join Pedido_Endereco_Cliente PEC on (P.Codigo = PEC.Codigo) ' +
//            'left join Pedido_Pagamento_DAV PPD on (P.Codigo = PPD.Codigo) ' +
//            'left join Produto Pro on (IP.Codigo_Produto = Pro.Codigo) '+
//            'WHERE P.Codigo = :codigo ');
//      Parameters.ParamByName('codigo').Value = numPedido;
//        Open;
//      end;
//    except
//      on E: Exception do
//        TLog.Error('AtualizaEstoqueConsultaNFE() - ' + E.Message);
//    end;
//
//
//
//    try
//      TLog.Info('--- MÉTODO GERA_ESTOQUE ---');
//      TLog.Debug('Variável gerar_estoque: ' + IntToStr(gerar_estoque));
//      TLog.Debug('Variável controla_estoque: ' + IntToStr(controla_estoque));
//      TLog.Debug('Variável estoque: ' + IntToStr(estoque));
//      if (gerar_estoque = 1) and (controla_estoque = 0) then
//      // gerar_estoque é da config. sistema. controla_estoque é do cfop
//      begin
//        qAux.First;
//        while not qAux.Eof do
//        begin
//          if (estoque = 1) then // variavel estoque vem do CFOP
//            qtdeEstoque := qAux.FieldByName('Estoque').AsFloat - qryitens_nfQtde.AsFloat
//          else
//            qtdeEstoque := qryitens_nfEstoque.AsFloat + qryitens_nfQtde.AsFloat;
//
//          TLog.Debug('');
//          TLog.Debug('Produto: ' + qryitens_nfDescricao.AsString);
//          TLog.Debug('Estoque Atual: ' + qryitens_nfEstoque.AsString);
//          TLog.Debug('Quantidade: ' + qryitens_nfQtde.AsString);
//          TLog.Debug('Novo Estoque: ' + FloatToStr(qtdeEstoque));
//
//          Atualiza_Saldo_Estoque(qryitens_nfCodigo_Produto.AsInteger,
//            qryitens_nfValor_Compra_Atual.AsFloat * qtdeEstoque);
//          Atualiza_Estoque(qtdeEstoque, qryitens_nfCodigo_Produto.AsInteger);
//          Atualiza_Volume(qtdeEstoque * qryitens_nfVolume.AsFloat,
//            qryitens_nfCodigo_Produto.AsInteger);
//
//         //******MD51
//         AtualizaMD51(qryitens_nfCodigo_Produto.AsInteger,
//             GeraMD5([BuscaCodigoProduto(qryitens_nfCodigo_Produto.AsInteger),
//             qryitens_nfDescricao.AsAnsiString,
//             FloatToStr(qtdeEstoque),
//             qryitens_nfCodigo_Produto.AsAnsiString, cChavePrivada]));
//             ///**fIM
//
//
//          qryitens_nf.Edit;
//          qryitens_nfQtde_Estoque_Atual.AsFloat := qryitens_nfEstoque.AsFloat;
//          qryitens_nf.Post;
//
//          qryitens_nf.next;
//        end;
//
//        Cria_Arquivo_Atualiza_Dados('AProd');
//        UDeclaracao.Atualiza_Produto(4, '');
//      end;
//      TLog.Info('--- FIM MÉTODO GERA_ESTOQUE ---');
//    except
//      on E: Exception do
//        TLog.Error(Self.ClassName + ' - Gera_Estoque - ' + E.Message);
//    end;
//  finally
//
//      FreeAndNil(qAux);
//
//  end;
end;

function Pega_Credito_Cliente(Cliente: Integer): Double;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select C.Credito from Cliente C');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value := Cliente;
      open;
      Result := FieldByName('Credito').AsFloat;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Inicia_Impressora;
begin
  // Imp_Fiscal_Escolhida:= 'BEMATECH';
  // if (Imp_Fiscal_Escolhida = 'BEMATECH') then

  if (Imp_Fiscal_Escolhida = 'BEMATECH') then
  begin
    DM.ACBrECF1.Modelo := TACBrECFModelo(2);
    TLog.Debug('Impressora fiscal escolhida: ' + Imp_Fiscal_Escolhida);
  end;

  if (Imp_Fiscal_Escolhida = 'SWEDA') then
  begin
    DM.ACBrECF1.Modelo := TACBrECFModelo(3);
    TLog.Debug('Impressora fiscal escolhida: ' + Imp_Fiscal_Escolhida);
  end;

  if (Imp_Fiscal_Escolhida = 'DARUMA') then
    DM.ACBrECF1.Modelo := TACBrECFModelo(4);

  if (Imp_Fiscal_Escolhida = 'SCHALTER') then
    DM.ACBrECF1.Modelo := TACBrECFModelo(5);

  if (Imp_Fiscal_Escolhida = 'MECAF') then
    DM.ACBrECF1.Modelo := TACBrECFModelo(6);

  if (Imp_Fiscal_Escolhida = 'YANCO') then
    DM.ACBrECF1.Modelo := TACBrECFModelo(7);

  if (Imp_Fiscal_Escolhida = 'DATAREGIS') then
    DM.ACBrECF1.Modelo := TACBrECFModelo(8);

  if (Imp_Fiscal_Escolhida = 'URANO') then
    DM.ACBrECF1.Modelo := TACBrECFModelo(9);

  if (Imp_Fiscal_Escolhida = 'ICASH') then
    DM.ACBrECF1.Modelo := TACBrECFModelo(10);

  if (Imp_Fiscal_Escolhida = 'QUATTRO') then
    DM.ACBrECF1.Modelo := TACBrECFModelo(11);

  if (Imp_Fiscal_Escolhida = 'FISCNET') then
    DM.ACBrECF1.Modelo := TACBrECFModelo(12);

  if (Imp_Fiscal_Escolhida = 'EPSON') then
    DM.ACBrECF1.Modelo := TACBrECFModelo(13);

  if (Imp_Fiscal_Escolhida = 'NCR') then
    DM.ACBrECF1.Modelo := TACBrECFModelo(14);

  if (Imp_Fiscal_Escolhida = 'SWEDASTX') then
    DM.ACBrECF1.Modelo := TACBrECFModelo(15);

  // TLog.Debug('Impressora fiscal escolhida: '+Imp_Fiscal_Escolhida);
  Mensagens(FrmControle_Acesso, FrmControle_Acesso.StatusBar,
    'Encontrando porta do ECF');
  TLog.Debug('Encontrando porta do ECF');
  if not(DM.ACBrECF1.AcharECF(false, true)) then
  begin
    TMensagens.MensagemErro('ECF não encontrado.');
    TLog.Debug('ECF não encontrado.');
    abort;
  end
  else
  begin
    porta_ecf := DM.ACBrECF1.Porta;
    TLog.Debug('ECF encontrado na porta ' + porta_ecf + '.');
  end;

  Mensagens(FrmControle_Acesso, FrmControle_Acesso.StatusBar,
    'Abrindo porta da Impressora Fiscal na ' + porta_ecf);
  ECF.Abre_Porta;
  TLog.Debug('Abriu porta do ECF');

  Mensagens(FrmControle_Acesso, FrmControle_Acesso.StatusBar,
    'Ativando Impressora Fiscal');
  ECF.Ativa_ACBr;
  TLog.Debug('Ativou porta do ECF');
end;

procedure Deleta_Lancamento_Financeiro();
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('Delete from Lancamento_Financeiro where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value := codigo_lancamento_financeiro;
      ExecSQL;
    end;

    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('Delete from Parcelas_Lancamentos where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value := codigo_lancamento_financeiro;
      ExecSQL;
    end;

  finally
    FreeAndNil(qAux);
  end;
end;

procedure Gera_Codigo_Lancamento_Financeiro;
begin
  try
    qAux_Lancamento_Financeiro := TADOQuery.Create(nil);
    with qAux_Lancamento_Financeiro, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select max(Codigo) as Codigo from Lancamento_Financeiro');
      open;
      codigo_lancamento_financeiro := qAux_Lancamento_Financeiro.FieldByName
        ('Codigo').AsInteger + 1;
    end;
  finally
    FreeAndNil(qAux_Lancamento_Financeiro);
  end;
end;

procedure Pega_Certificado_Digital(ACBr: TACBrNFe);
begin
  ACBr.Configuracoes.Certificados.NumeroSerie := n_certificado;
  ACBr.Configuracoes.Certificados.Senha := senha_certificado;
end;

procedure Mapa_Resumo;
var
  Arq: TextFile;
  Arquivo: TStringlist;
  Nome, Valor, Linha: String;
  x, y: Integer;
  ar: array of string;
  qAux: TADOQuery;
begin
  Arquivo := TStringlist.Create;
  Arquivo.LoadFromFile(Local_Arquivo(14) + 'Retorno.txt');
  Nome := Local_Arquivo(14) + 'Retorno.txt';
  AssignFile(Arq, Nome);
  Reset(Arq);
  Readln(Arq, Linha);
  y := 0;
  while not Eof(Arq) do
  begin
    SetLength(ar, Arquivo.Count - 1);
    for x := 0 to Length(Linha) do
    begin
      if (Linha[x] <> ':') then
        Continue
      else
      begin
        Valor := copy(Linha, x + 1, 20);
        ar[y] := Valor;
        Inc(y);
        Readln(Arq, Linha);
      end;
    end;
  end;

  // ----------- grava na tabela de mapa resumo os resultados do arquivo Retorno.txt

  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('INSERT INTO Mapa_Resumo');
      add('           (Data_Movimento');
      add('           ,N_Caixa');
      add('           ,CRZ');
      add('           ,N_Serie');
      add('           ,COO');
      add('           ,Venda_Bruta');
      add('           ,Venda_Liquida');
      add('           ,Cancelamento_ICMS');
      add('           ,Cancelamento_ISS');
      add('           ,Acrescimo_ICMS');
      add('           ,Acrescimo_ISS');
      add('           ,Desconto_ICMS');
      add('           ,Desconto_ISS');
      add('           ,ISS');
      add('           ,Substituicao_ICMS');
      add('           ,Substituicao_ISS');
      add('           ,Isencao_ICMS');
      add('           ,Isencao_ISS');
      add('           ,Nao_Incidencia_ICMS');
      add('           ,Nao_Incidencia_ISS)');
      add('     VALUES');
      add('           (:Data_Movimento');
      add('           ,:N_Caixa');
      add('           ,:CRZ');
      add('           ,:N_Serie');
      add('           ,:COO');
      add('           ,:Venda_Bruta');
      add('           ,:Venda_Liquida');
      add('           ,:Cancelamento_ICMS');
      add('           ,:Cancelamento_ISS');
      add('           ,:Acrescimo_ICMS');
      add('           ,:Acrescimo_ISS');
      add('           ,:Desconto_ICMS');
      add('           ,:Desconto_ISS');
      add('           ,:ISS');
      add('           ,:Substituicao_ICMS');
      add('           ,:Substituicao_ISS');
      add('           ,:Isencao_ICMS');
      add('           ,:Isencao_ISS');
      add('           ,:Nao_Incidencia_ICMS');
      add('           ,:Nao_Incidencia_ISS)');

      Parameters.ParamByName('Data_Movimento').Value := 0;
      // StrToDateTime(dataf);;
      Parameters.ParamByName('N_Caixa').Value :=
        StringOfChar('0', 4 - Length(UDeclaracao.sequencia)) +
        UDeclaracao.sequencia;;
      Parameters.ParamByName('CRZ').Value := trim(ar[0]);
      Parameters.ParamByName('N_Serie').Value := nu_serie;
      Parameters.ParamByName('COO').Value := trim(ar[1]);
      Parameters.ParamByName('Venda_Bruta').Value := trim(ar[2]);
      Parameters.ParamByName('Venda_Liquida').Value := trim(ar[3]);
      Parameters.ParamByName('Cancelamento_ICMS').Value := trim(ar[4]);
      Parameters.ParamByName('Cancelamento_ISS').Value := trim(ar[5]);
      Parameters.ParamByName('Acrescimo_ICMS').Value := trim(ar[6]);
      Parameters.ParamByName('Acrescimo_ISS').Value := trim(ar[7]);
      Parameters.ParamByName('Desconto_ICMS').Value := trim(ar[8]);
      Parameters.ParamByName('Desconto_ISS').Value := trim(ar[9]);
      Parameters.ParamByName('ISS').Value := trim(ar[10]);
      Parameters.ParamByName('Isencao_ICMS').Value := trim(ar[11]);
      Parameters.ParamByName('Isencao_ISS').Value := trim(ar[12]);
      Parameters.ParamByName('Nao_Incidencia_ICMS').Value := trim(ar[13]);
      Parameters.ParamByName('Nao_Incidencia_ISS').Value := trim(ar[14]);
      Parameters.ParamByName('Substituicao_ICMS').Value := trim(ar[15]);
      Parameters.ParamByName('Substituicao_ISS').Value := trim(ar[16]);
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;

  CloseFile(Arq);

end;

function Calcula_Juro_Composto(Principal, Taxa: Double; Meses: Integer): Double;
begin
  Result := Principal * power((1 + Taxa), Meses);
end;

function Retorna_Juro_Composto(Principal, Taxa: Double; Meses: Integer): Double;
var
  aux: Double;
begin
  aux := Principal * power((1 + Taxa), Meses);
  Result := aux - Principal;
end;

function Pega_Bandeira_Pendente: AnsiString;
var
  Arq: TextFile;
  Nome: String;
begin
  Nome := Local_Arquivo(14) + 'Bandeira.txt';
  if not(FileExists(Nome)) then
  begin
    AssignFile(Arq, Nome);
    Rewrite(Arq);
    writeln(Arq, 'TEF DIAL');
    CloseFile(Arq);
  end
  else
  begin
    AssignFile(Arq, Nome);
    Reset(Arq);
    Read(Arq, Result);
    CloseFile(Arq);
  end;

  if (Result = 'TEF DIAL') then
  begin
    PathReq := 'C:\Tef_Dial\Req\';
    PathResp := 'C:\Tef_Dial\Resp\';
  end
  else if (Result = 'PAYGO') then
  begin
    PathReq := 'C:\Tef_Dial\Req\';
    PathResp := 'C:\Tef_Dial\Resp\';
  end
  else if (Result = 'TEF DISC') then
  begin
    PathReq := 'C:\TEF_DISC\Req\';
    PathResp := 'C:\TEF_DISC\Resp\';
  end;
end;

procedure Deleta_Bandeira_Pendente;
begin
  // if FileExists(Local_Arquivo(14) + 'Bandeira.txt') then
  // DeleteFile(Local_Arquivo(14) + 'Bandeira.txt');
end;

procedure Verifica_Valor_Negativo(Valor: Double; Edit: TEdit);
begin
  if (Edit.Text <> '') then
  begin
    if (Valor <= 0) then
    // estava configurado como <=, tirei o = pra "testar" o funcionamento
    begin // da Qtde_Entregue = 0 no Pedido de Venda
      Mensagem_Falta_Dados;
      Edit.SetFocus;
      abort;
    end;
  end;
end;

procedure Verifica_Edit_Branco(Edit: TEdit);
begin
  if (Edit.Text = '') then
  begin
    Mensagem_Falta_Dados;
    Edit.SetFocus;
    abort;
  end;
end;

procedure LoadXML(MyMemo: TMemo; MyWebBrowser: TWebBrowser);
begin
  MyMemo.Lines.SaveToFile(PathWithDelim(ExtractFileDir(application.ExeName)) +
    'temp.xml');
  MyWebBrowser.Navigate(PathWithDelim(ExtractFileDir(application.ExeName)) +
    'temp.xml');
end;

function Verifica_NCM_Ja_Existe(Codigo_NCM: AnsiString;
  var Conexao: TADOConnection): boolean;
var
  qAux: TADOQuery;
begin
  try
    Result := false;
    qAux := TADOQuery.Create(nil);
    begin
      with qAux, SQL do
      begin
        close;
        clear;
        Connection := Conexao;
        add('select Codigo, Codigo_NCM from NCM');
        add('where Codigo_NCM = :Codigo_NCM');
        Parameters.ParamByName('Codigo_NCM').Value := Codigo_NCM;
        open;

        if (IsEmpty = false) then
        begin
          Result := true;
        end;
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

function Calcula_Valor(Valor: AnsiString): Double;
var
  i: Integer;
  val, val2: AnsiString;
begin
  TLog.Info('--- MÉTODO Calcula_Valor ---');
  for i := 1 to Length(Valor) do
  begin
    val := val + Valor[i];

    if (val <> '-') then
      Result := StrToFloat(val);
    if (Valor[i] = ',') or (Valor[i] = '') then
    begin
      val2 := val + Valor[i + 1];
      val2 := val2 + Valor[i + 2];
      // Result := StrToFloat(val2);
      // val2 := FormatFloat('#0.0,00', StrToFloat(val2));
      // val2 := StringReplace(val2, ThousandSeparator, '', [rfReplaceAll]);
      Result := StrToFloat(val2);
      break;
    end;
  end;

  TLog.Info('--- FIM MÉTODO Calcula_Valor ---');

end;

function Calcula_Valor2(Valor: Double): Double;
var
  i: Integer;
  val, val2: Double;
begin
  { for i := 1 to Length(FloatToStr(Valor)) do
    begin
    val := val + Valor[i];

    if (val <> '-') then
    Result:= StrToFloat(val);
    if (Valor[i] = ',') or (Valor[i] = '') then
    begin
    val2 := val + Valor[i + 1];
    val2 := val2 + Valor[i + 2];
    //Result := StrToFloat(val2);
    //val2 := FormatFloat('#0.0,00', StrToFloat(val2));
    //val2 := StringReplace(val2, ThousandSeparator, '', [rfReplaceAll]);
    Result := StrToFloat(val2);
    break;
    end;
    end; }
end;

function Truncar(Valor: Double; Decimal: Integer): Double;
var
  aux: string;
begin
  Valor := Valor * 100000;
  aux := FormatFloat('00000000000000000000', Valor);
  aux := copy(aux, 1, 15) + copy(aux, 16, Decimal);
  case Decimal of
    2:
      Valor := StrToFloat(aux) / 10;
    3:
      Valor := StrToFloat(aux) / 100;
    4:
      Valor := StrToFloat(aux) / 1000;
    5:
      Valor := StrToFloat(aux) / 10000;
  end;
  Result := Valor;
end;

function Calcula_Valor_Tres_Casas(Valor: AnsiString): Double;
var
  i: Integer;
  val, val2: AnsiString;
begin
  for i := 1 to Length(Valor) do
  begin
    val := val + Valor[i];

    if (val <> '-') then
      Result := StrToFloat(val);
    if Valor[i] = ',' then
    begin
      val2 := val + Valor[i + 1];
      val2 := val2 + Valor[i + 2];
      val2 := val2 + Valor[i + 3];
      Result := StrToFloat(val2);
      break;
    end;
  end;
end;

procedure Cria_Arquivo_Atualiza_Produto;
var
  Arquivo: TextFile;
  Nome: AnsiString;
  i: Integer;
begin
  for i := 1 to StrToInt(qtde_mac) do
  begin
    Nome := caminho_servidor + 'Prod' + IntToStr(i) + '.txt';

    AssignFile(Arquivo, Nome);
    Rewrite(Arquivo);
    write(Arquivo, '');
    CloseFile(Arquivo);
  end;
end;

procedure Cria_Arquivo_Atualiza_Dados(Qual: AnsiString);
var
  Arquivo: TextFile;
  Nome: AnsiString;
  i: Integer;
begin
  TLog.Info('--- MÉTODO Cria_Arquivo_Atualiza_Dados ---');
  for i := 1 to StrToInt(qtde_mac) do
  begin
    Nome := caminho_servidor + '\Atualizações\' + Qual + IntToStr(i) + '.txt';

    AssignFile(Arquivo, Nome);
    Rewrite(Arquivo);
    write(Arquivo, '');
    CloseFile(Arquivo);
  end;
  TLog.Info('---FIM MÉTODO Cria_Arquivo_Atualiza_Dados ---');
end;

procedure Cria_Arquivo_Qualquer(Qual: AnsiString);
var
  Arquivo: TextFile;
  Nome: AnsiString;
  i: Integer;
begin
  Nome := caminho_servidor + '\Atualizações\' + Qual + '.txt';

  AssignFile(Arquivo, Nome);
  Rewrite(Arquivo);
  write(Arquivo, '');
  CloseFile(Arquivo);
end;

procedure Cria_Arquivo_Atualiza_CondPag;
var
  Arquivo: TextFile;
  Nome: AnsiString;
  i: Integer;
begin
  for i := 1 to StrToInt(qtde_mac) do
  begin
    Nome := caminho_servidor + 'CondPag' + IntToStr(i) + '.txt';

    AssignFile(Arquivo, Nome);
    Rewrite(Arquivo);
    write(Arquivo, '');
    CloseFile(Arquivo);
  end;
end;

procedure Cria_Arquivo_Controle_Validade(chave: string);
var
  Arquivo: TextFile;
  Nome, dir: AnsiString;
begin
  dir := 'C:\Windows\System32\f-config\config\';
  Nome := 'C:\Windows\System32\f-config\config\cfav.txt';

  if not DirectoryExists(dir) then
    ForceDirectories(dir);

  if FileExists(Nome) then
    DeleteFile(Nome);

  AssignFile(Arquivo, Nome);
  Rewrite(Arquivo);
  write(Arquivo, chave);
  CloseFile(Arquivo);
end;

procedure Verifica_Chave;
begin

end;

procedure Verifica_Arquivos_Validacao;
var
  Nome, dir: AnsiString;
begin
  dir := 'C:\Windows\System32\f-config\config\';
  Nome := 'C:\Windows\System32\f-config\config\cfav.txt';

  if not DirectoryExists(dir) then
  begin
    application.MessageBox
      ('O diretório de configuração do sistema não foi encontrado. Por favor, ative o sistema.',
      'Diretório não encontrado', MB_OK + MB_ICONHAND);
    application.Terminate;
    abort;
  end;

  if not FileExists(Nome) then
  begin
    application.MessageBox
      ('O arquivo de configuração do sistema não foi encontrado. Por favor, ative o sistema.',
      'Arquivo não encontrado', MB_OK + MB_ICONHAND);
    application.Terminate;
    abort;
  end;

end;

procedure SetupGridPickList(Grid: TDBGrid; FieldName, SQL: AnsiString);
var
  slPickList: TStringlist;
  Query: TADOQuery;
  i: Integer;
begin
  slPickList := TStringlist.Create;
  Query := TADOQuery.Create(nil);
  try
    Query.Connection := DM.ADOConnection1;
    Query.SQL.Text := SQL;
    Query.open;

    // Preencher o string list
    while not Query.Eof do
    begin
      slPickList.add(Query.Fields[0].AsString);
      Query.Next;
    end;

    // colocar a lista na coluna correta
    for i := 0 to Grid.Columns.Count - 1 do
    begin
      if Grid.Columns[i].FieldName = FieldName then
      begin
        Grid.Columns[i].PickList := slPickList;
        break;
      end;
    end;
  finally
    slPickList.Free;
    Query.Free;
  end;
end;

procedure Verifica_Ultimo_Acesso;
var
  qAux: TADOQuery;
  Nome, dir: AnsiString;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select * from Controla_Validade_Sistema');
      open;
    end;

    if (qAux.FieldByName('Ultimo_Acesso').AsDateTime > date) then
    begin
      application.MessageBox
        ('A data do último acesso é maior que a da data configurada no computador. Por favor, verifique a data, antes de continuar.',
        'Data inválida', MB_OK + MB_ICONHAND);
      application.Terminate;
      abort;
    end
    else
      Atualiza_Ultimo_Acesso;

  finally
    FreeAndNil(qAux);
  end;
end;

procedure Verifica_Validade_Sistema;
var
  qAux: TADOQuery;
  i: Integer;
  Data_Ativacao, data_ativacao2, Ultimo_Acesso, ultimo_acesso2, Data_Validade,
    data_validade2, separa, fim, mes: String;
  aux1, aux2, aux3, chave: string;
begin
  qAux := TADOQuery.Create(nil);
  with qAux, SQL do
  begin
    close;
    Connection := DM.ADOConnection1;
    clear;
    add('select * from Controla_Validade_Sistema');
    open;
  end;

  i := trunc(qAux.FieldByName('Data_Validade').AsDateTime) - trunc(date);

  if (i <= 10) and (i > 0) then
  begin
    application.MessageBox(Pchar('O sistema expira em ' + IntToStr(i) +
      ' dia(s)'), 'Aviso', MB_OK + MB_ICONEXCLAMATION);
  end
  else if (i = 0) then
  begin
    application.MessageBox(Pchar('O sistema expira hoje, dia ' + DateToStr(date)
      + '.'), 'Aviso', MB_OK + MB_ICONEXCLAMATION);
  end
  else if (i < 0) then
  begin
    Data_Ativacao := FormatDateTime('DDMMYYYY',
      qAux.FieldByName('Data_Ativacao').AsDateTime);
    Ultimo_Acesso := FormatDateTime('DDMMYYYY',
      qAux.FieldByName('Ultimo_Acesso').AsDateTime);
    Data_Validade := FormatDateTime('DDMMYYYY',
      qAux.FieldByName('Data_Validade').AsDateTime);
    separa := ',';

    Data_Ativacao := Criptografa(Data_Ativacao, 15);
    Ultimo_Acesso := Criptografa(Ultimo_Acesso, 15);
    Data_Validade := Criptografa(Data_Validade, 15);
    separa := Criptografa(separa, 15);

    fim := Data_Ativacao + separa + Ultimo_Acesso + separa + Data_Validade;

    mes := InputBox('Aviso',
      'O sistema expirou. Entre em contato com o suporte técnico da FAV e informe o seguinte código. Após informar o código, aguarde para digitar na caixa abaixo, uma contrachave gerada pela FAV.'
      + #13 + #10 + #13 + #10 + 'Chave de licença:      ' + fim + '', '');

    if (mes = '') or (Length(mes) <> 26) then
    begin
      Mensagem_Falta_Dados;
      application.Terminate;
      abort;
    end
    else
    begin
      Data_Ativacao := copy(Criptografa(mes, 15), 1, 8);
      Ultimo_Acesso := copy(Criptografa(mes, 15), 10, 8);
      Data_Validade := copy(Criptografa(mes, 15), 19, 8);

      data_ativacao2 := copy(mes, 1, 8);
      ultimo_acesso2 := copy(mes, 10, 8);
      data_validade2 := copy(mes, 19, 8);

      chave := data_ativacao2 + separa + ultimo_acesso2 + separa +
        data_validade2;

      aux1 := copy(Data_Ativacao, 1, 2);
      aux2 := copy(Data_Ativacao, 3, 2);
      aux3 := copy(Data_Ativacao, 5, 4);
      Data_Ativacao := aux1 + '/' + aux2 + '/' + aux3;

      aux1 := copy(Ultimo_Acesso, 1, 2);
      aux2 := copy(Ultimo_Acesso, 3, 2);
      aux3 := copy(Ultimo_Acesso, 5, 4);
      Ultimo_Acesso := aux1 + '/' + aux2 + '/' + aux3;

      aux1 := copy(Data_Validade, 1, 2);
      aux2 := copy(Data_Validade, 3, 2);
      aux3 := copy(Data_Validade, 5, 4);
      Data_Validade := aux1 + '/' + aux2 + '/' + aux3;

      Atualiza_Validade_Sistema(StrToDate(Data_Ativacao),
        StrToDate(Data_Validade), StrToDate(Ultimo_Acesso));
      Cria_Arquivo_Controle_Validade(chave);
      application.Terminate;
      abort;
    end;
  end;

end;

procedure Atualiza_Ultimo_Acesso;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update Controla_Validade_Sistema set Ultimo_Acesso = :Ultimo_Acesso');
      Parameters.ParamByName('Ultimo_Acesso').Value := date;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Atualiza_Validade_Sistema(Data_Ativacao, Data_Validade,
  Ultimo_Acesso: TDate);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('Delete from Controla_Validade_Sistema');
      ExecSQL;
    end;

    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('Insert into Controla_Validade_Sistema (Data_Ativacao, Data_Validade, Ultimo_Acesso) values');
      add('(:Data_Ativacao, :Data_Validade, :Ultimo_Acesso)');
      Parameters.ParamByName('Data_Ativacao').Value := Data_Ativacao;
      Parameters.ParamByName('Data_Validade').Value := Data_Validade;
      Parameters.ParamByName('Ultimo_Acesso').Value := Ultimo_Acesso;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Verifica_Valor_Negativo_Desconto(Valor: Double; Edit: TEdit);
begin
  if (Valor < 0) then
  begin
    Mensagem_Falta_Dados;
    Edit.SetFocus;
    abort;
  end;
end;

function obterMenuNivel1(arvore: TTreeView; Texto: string): TTreeNode;
var
  menu: TTreeNode;
  i: Integer;
begin
  menu := nil;

  // vamos obter o menu informado
  for i := 0 to arvore.Items.Count - 1 do
  begin
    if arvore.Items[i].level > 0 then
      Continue;

    if arvore.Items[i].Text = Texto then
    begin
      menu := arvore.Items[i];
      break;
    end;
  end;

  Result := menu;
end;

procedure Altera_Pedido_Aux(N_Pedido, COO: AnsiString);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('Update Pedido_Aux set COO = :COO');
      add('where N_Pedido = :Pedido');
      Parameters.ParamByName('Pedido').Value := N_Pedido;
      Parameters.ParamByName('COO').Value := COO;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Insere_Pedido_Aux(N_Pedido, COO: AnsiString; Data: TDate;
  Valor: Double);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('Insert into Pedido_Aux (N_Pedido, COO, Data, Valor) values ');
      add('(:N_Pedido, :COO, :Data, :Valor)');
      Parameters.ParamByName('N_Pedido').Value := N_Pedido;
      Parameters.ParamByName('COO').Value := COO;
      Parameters.ParamByName('Data').Value := Data;
      Parameters.ParamByName('Valor').Value := Valor;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Delete_Produto_Aux;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('Drop Table Produto_Aux');
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Atualiza_Caixa_Movimento;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update Abertura_Caixa set Acerto = :Acerto');
      add('where Data_Abertura = :Dat and Codigo_Usuario = :Usuario');

      Parameters.ParamByName('Dat').Value := DataF;
      Parameters.ParamByName('Acerto').Value := 0;
      Parameters.ParamByName('Usuario').Value := UDeclaracao.codigo_usu;
      ExecSQL;
    end;

    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update Fechamento_Venda set Acerto = :Acerto');
      add('where Data = :Dat and Codigo_Usuario = :Usuario');

      Parameters.ParamByName('Dat').Value := DataF;
      Parameters.ParamByName('Acerto').Value := 0;
      Parameters.ParamByName('Usuario').Value := UDeclaracao.codigo_usu;
      ExecSQL;
    end;

  finally
    FreeAndNil(qAux);
  end;
end;

procedure Pega_Caixa_Pendente;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select CU.Nome, AC.Codigo_Caixa from Abertura_Caixa AC');
      add('left join Cadastro_Usuario CU on (AC.Codigo_Caixa = CU.Codigo)');
      add('where AC.Data_Abertura = :Dat and (AC.Acerto = :Acerto1 or AC.Acerto = :Acerto2) and AC.Codigo_Usuario = :Usuario');

      Parameters.ParamByName('Dat').Value := DataF;
      Parameters.ParamByName('Acerto1').Value := 1;
      Parameters.ParamByName('Acerto2').Value := 0;
      Parameters.ParamByName('Usuario').Value := UDeclaracao.codigo_usu;
      open;
    end;

    if (qAux.IsEmpty = true) then
    begin
      UDeclaracao.codigo_caixa := 0;
      { if (tipo_local = '0101') then
        begin
        Application.MessageBox('Por favor, entre com o usuário que fez a última abertura do caixa, para que possa capturar as informações do dia pendente.', 'Atenção', MB_OK+MB_ICONHAND);
        Application.Terminate;
        end; }

      FrmMenu_Geral.StbStatus.Panels[5].Text := 'Caixa - NÃO IDENTIFICADO';
    end
    else
    begin
      UDeclaracao.codigo_caixa := qAux.FieldByName('Codigo_Caixa').AsInteger;
      FrmMenu_Geral.StbStatus.Panels[5].Text := 'Caixa - ' +
        qAux.FieldByName('Nome').AsString;
    end;

  finally
    FreeAndNil(qAux);
  end;
end;

procedure Pega_Caixa;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    { if (tipo_local = '0101') then
      ECF.Pega_Data_Movimento
      else
      DataF:= DateToStr(date); }

    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select CU.Nome, AC.Codigo_Caixa from Abertura_Caixa AC');
      add('left join Cadastro_Usuario CU on (AC.Codigo_Caixa = CU.Codigo)');
      add('where AC.Data_Abertura = :Dat and AC.Acerto = :Acerto and AC.Codigo_Usuario = :Usuario');

      if (tipo_local = '0101') then
        Parameters.ParamByName('Dat').Value := DataF
      else
        Parameters.ParamByName('Dat').Value := date;

      Parameters.ParamByName('Acerto').Value := 0;
      Parameters.ParamByName('Usuario').Value := UDeclaracao.codigo_usu;
      open;
    end;

    if (qAux.IsEmpty = true) then
    begin
      UDeclaracao.codigo_caixa := 0;
      if (tipo_local = '0101') then
        application.MessageBox
          ('Por favor, abra o caixa. Menu Caixa > Abertura de Caixa',
          'Abra o caixa', MB_OK + MB_ICONEXCLAMATION);

      FrmMenu_Geral.StbStatus.Panels[5].Text := 'Caixa - NÃO IDENTIFICADO';
    end
    else
    begin
      UDeclaracao.codigo_caixa := qAux.FieldByName('Codigo_Caixa').AsInteger;
      FrmMenu_Geral.StbStatus.Panels[5].Text := 'Caixa - ' +
        qAux.FieldByName('Nome').AsString;
    end;

  finally
    FreeAndNil(qAux);
  end;
end;

procedure Insere_Produto_Aux;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('SELECT * INTO Produto_Aux FROM Produto WHERE 1=1');
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Insere_Tabela_Aux;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('SELECT * INTO Tabela_Preco_Aux FROM Tabela_Preco WHERE 1=1');
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Insere_Itens_Tabela_Aux;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('SELECT * INTO Itens_Tabela_Preco_Aux FROM Itens_Tabela_Preco WHERE 1=1');
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Delete_Tabela_Aux;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('Drop Table Tabela_Preco_Aux');
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Delete_Itens_Tabela_Aux;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('Drop Table Itens_Tabela_Preco_Aux');
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Insere_Historico(Usuario, Historico, Hora, Tipo_Operacao: AnsiString;
  Data: TDate);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('Insert into Historico (Usuario, Historico, Data, Hora, Tipo_Operacao) values ');
      add('(:Usuario, :Historico, :Data, :Hora, :Tipo_Operacao)');
      Parameters.ParamByName('Usuario').Value := Usuario;
      Parameters.ParamByName('Historico').Value := Historico;
      Parameters.ParamByName('Data').Value := Data;
      Parameters.ParamByName('Hora').Value := Hora;
      Parameters.ParamByName('Tipo_Operacao').Value := Tipo_Operacao;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Atualiza_R04(Pedido: Integer);
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update R04 set Cancelamento = :Can where N_Pedido = :N_Pedido');
      Parameters.ParamByName('Can').Value := 'S';
      Parameters.ParamByName('N_Pedido').Value := Pedido;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Atualiza_R04_Sem_Rede(Pedido: Integer);
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnectionLocal;
      clear;
      add('update R04 set Cancelamento = :Can where N_Pedido = :N_Pedido');
      Parameters.ParamByName('Can').Value := 'S';
      Parameters.ParamByName('N_Pedido').Value := Pedido;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Atualiza_R04_Aux(Pedido: Integer);
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update R04_Aux set Cancelamento = :Can where N_Pedido = :N_Pedido');
      Parameters.ParamByName('Can').Value := 'S';
      Parameters.ParamByName('N_Pedido').Value := Pedido;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Atualiza_Status_Pedido(var Conexao: TADOConnection; Pedido: Integer; Status: AnsiString);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := Conexao;
      clear;
      add('update Pedido set Status = :Status');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Status').Value := Status;
      Parameters.ParamByName('Codigo').Value := Pedido;
      ExecSQL;
    end;

    with qAux, SQL do
    begin
      close;
      Connection := Conexao;
      clear;
      add('update Fechamento_Venda set Status = :Status');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Status').Value := 'CANCELADO';
      Parameters.ParamByName('Codigo').Value := Pedido;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

{ procedure Deleta_Fechamento_Venda(Pedido: Integer; Status: AnsiString);
  var
  qAux: TADOQuery;
  begin
  qAux := TADOQuery.Create(nil);
  try
  with qAux, sql do
  begin
  close;
  Connection := dm.ADOConnection1;
  clear;
  add('update Fechamento_Venda set Status = :Status');
  add('where Codigo = :Codigo');
  Parameters.ParamByName('Status').Value := 'CANCELADO';
  Parameters.ParamByName('Codigo').Value := Pedido;
  ExecSQL;
  end;
  finally
  FreeAndNil(qAux);
  end;
  end; }

procedure Atualiza_Status_Pedido_Sem_Rede(Pedido: Integer; Status: AnsiString);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnectionLocal;
      clear;
      add('update Pedido set Status = :Status');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Status').Value := Status;
      Parameters.ParamByName('Codigo').Value := Pedido;
      ExecSQL;
    end;

    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnectionLocal;
      clear;
      add('update Fechamento_Venda set Status = :Status');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Status').Value := 'CANCELADO';
      Parameters.ParamByName('Codigo').Value := Pedido;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Atualiza_Status_NFe(Pedido: Integer; Status, Tipo: AnsiString);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update Pedido set Status = :Status, Tipo = :Tipo');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Status').Value := Status;
      Parameters.ParamByName('Tipo').Value := Tipo;
      Parameters.ParamByName('Codigo').Value := Pedido;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Atualiza_Estoque_Itens_Pedido(Produto, Codigo_Venda: Integer;
  Qtde: Double; Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := Conexao;
      clear;
      add('Update Itens_Pedido set Qtde_Estoque_Atual = :Qtde where Codigo = :Codigo and Codigo_Produto = :Produto');
      Parameters.ParamByName('Qtde').Value := Qtde;
      Parameters.ParamByName('Codigo').Value := Codigo_Venda;
      Parameters.ParamByName('Produto').Value := Produto;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Insere_Movimentacao_Estoque(Codigo_Empresa, Codigo_Produto: Integer;
  Codigo_Venda, Descricao, Natureza: AnsiString; Data: TDate;
  Estoque_Atual, Quantidade, Valor_Compra, Valor_Total, Custo_Medio,
  Saldo_Quantidade, Saldo_Valor: Double; Codigo_Funcionario: Integer);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('Insert into Movimentacao_Estoque (Codigo_Empresa, Codigo_Produto, Codigo_Venda, Descricao, Natureza, Data, Estoque_Atual,');
      add('Quantidade, Valor_Compra, Valor_Total, Custo_Medio, Saldo_Quantidade, Saldo_Valor, Codigo_Funcionario) values ');
      add('(:Codigo_Empresa, :Codigo_Produto, :Codigo_Venda, :Descricao, :Natureza, :Data, :Estoque_Atual,');
      add(':Quantidade, :Valor_Compra, :Valor_Total, :Custo_Medio, :Saldo_Quantidade, :Saldo_Valor, :Codigo_Funcionario)');
      Parameters.ParamByName('Codigo_Empresa').Value := Codigo_Empresa;
      Parameters.ParamByName('Codigo_Produto').Value := Codigo_Produto;
      Parameters.ParamByName('Codigo_Venda').Value := Codigo_Venda;
      Parameters.ParamByName('Descricao').Value := Descricao;
      Parameters.ParamByName('Natureza').Value := Natureza;
      Parameters.ParamByName('Data').Value := Data;
      Parameters.ParamByName('Estoque_Atual').Value := Estoque_Atual;
      Parameters.ParamByName('Quantidade').Value := Quantidade;
      Parameters.ParamByName('Valor_Compra').Value := Valor_Compra;
      Parameters.ParamByName('Valor_Total').Value := Valor_Total;
      Parameters.ParamByName('Custo_Medio').Value := Custo_Medio;
      Parameters.ParamByName('Saldo_Quantidade').Value := Saldo_Quantidade;
      Parameters.ParamByName('Saldo_Valor').Value := Saldo_Valor;
      Parameters.ParamByName('Codigo_Funcionario').Value := Codigo_Funcionario;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Atualiza_Saldo_Estoque(var Conexao: TADOConnection; Codigo: Integer; Saldo: Double);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update Produto set Saldo_Estoque = :Saldo');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Saldo').Value := Saldo;
      Parameters.ParamByName('Codigo').Value := Codigo;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Atualiza_Nota_Cancelada(Nota: AnsiString; Codigo: Integer);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update Entrada_Produtos set Status = :Status');
      add('where Codigo = :Codigo and N_Nota_Fiscal = :Nota');
      Parameters.ParamByName('Status').Value := 'S';
      Parameters.ParamByName('Codigo').Value := Codigo;
      Parameters.ParamByName('Nota').Value := Nota;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

function Pega_Codigo_Produto_Fornecedor(Fornecedor: Integer; Produto: Integer)
  : AnsiString;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select PCF.Codigo_Produto_Fornecedor from Produto_Codigo_Fornecedor PCF');
      add('where Codigo_Produto_Inteiro = :Produto and Codigo_Fornecedor = :Fornecedor');
      Parameters.ParamByName('Produto').Value := Produto;
      Parameters.ParamByName('Fornecedor').Value := Fornecedor;
      open;
      Result := qAux.FieldByName('Codigo_Produto_Fornecedor').AsString;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Atualiza_Codigo_Produto_Fornecedor(Codigo_Fornecedor: AnsiString;
  Fornecedor: Integer; Produto: Integer);
var
  qAux, qAux2: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  qAux2 := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select PCF.Codigo_Produto_Fornecedor from Produto_Codigo_Fornecedor PCF');
      add('where Codigo_Produto_Inteiro = :Produto and Codigo_Fornecedor = :Fornecedor');
      Parameters.ParamByName('Produto').Value := Produto;
      Parameters.ParamByName('Fornecedor').Value := Fornecedor;
      open;
    end;

    if (qAux.IsEmpty) then
    begin
      with qAux2, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('insert into Produto_Codigo_Fornecedor (Codigo_Produto_Fornecedor, Codigo_Produto_Inteiro, Codigo_Fornecedor)values');
        add('(:Codigo_Produto_Fornecedor, :Codigo_Produto_Inteiro, :Codigo_Fornecedor)');
        Parameters.ParamByName('Codigo_Produto_Fornecedor').Value :=
          Codigo_Fornecedor;
        Parameters.ParamByName('Codigo_Produto_Inteiro').Value := Produto;
        Parameters.ParamByName('Codigo_Fornecedor').Value := Fornecedor;
        ExecSQL;
      end;
    end
    else
    begin
      with qAux2, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('update Produto_Codigo_Fornecedor set ');
        add('Codigo_Produto_Fornecedor = :Codigo_Produto_Fornecedor');
        add('where Codigo_Produto_Inteiro = :Codigo_Produto_Inteiro and Codigo_Fornecedor = :Codigo_Fornecedor');
        Parameters.ParamByName('Codigo_Produto_Fornecedor').Value :=
          Codigo_Fornecedor;
        Parameters.ParamByName('Codigo_Produto_Inteiro').Value := Produto;
        Parameters.ParamByName('Codigo_Fornecedor').Value := Fornecedor;
        ExecSQL;
      end;
    end;
  finally
    FreeAndNil(qAux);
    FreeAndNil(qAux2);
  end;
end;

procedure Atualiza_Custo_Produto(Codigo: Integer; Custo_Medio: Double);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update Produto set Valor_Medio = :Valor');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value := Codigo;
      Parameters.ParamByName('Valor').Value := Custo_Medio;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Copia_Config;
begin
  CopyFile(PWideChar(Local_Arquivo(14) + 'ConfigBackup.txt'),
    PWideChar(Local_Arquivo(14) + 'Config.txt'), false);
end;

procedure Backup_Config;
begin
  CopyFile(PWideChar(Local_Arquivo(14) + 'Config.txt'),
    PWideChar(Local_Arquivo(14) + 'ConfigBackup.txt'), false);
end;

function ConverteACBr(cmd: String): String;
var A : Integer ;
begin
  Result := '' ;
  For A := 1 to length( cmd ) do
  begin
     if (Ord(cmd[A]) < 32) or (Ord(cmd[A]) > 127) then
        Result := Result + '#' + IntToStr(ord( cmd[A] ))
     else
        Result := Result + cmd[A] ;
  end ;
end;

function Verifica_Permissao_Impressora: Boolean;
begin
  {try
    dm.ACBrECF1.TestaPodeAbrirCupom;
    //dm.ACBrECF1.Desativar;
    //dm.ACBrECF1.Ativar;
    Result:= true;
  except
    ShowMessage(DM.ACBrECF1.RespostaComando);
    Result:= false;
  end;}

  Verifica_Status_Impressora;
  { if (FrmMenu_Geral.ValidaGT = true) then
    Habilitado := true
    else
    Habilitado := false;

    if (FrmMenu_Geral.ValidaSN = true) then
    Habilitado := true
    else
    Habilitado := false; }
end;

function Retorna_Interrogacao_Espaco_Branco(Texto: AnsiString; QtdeCaracter: integer): AnsiString;
var
  TextoAuxiliar: AnsiString;
begin
  TextoAuxiliar := Texto;
  TextoAuxiliar := TextoAuxiliar + StringOfChar(' ', QtdeCaracter - Length(Texto));
  TextoAuxiliar := StringReplace(TextoAuxiliar, ' ', '?', [rfReplaceAll]);
  Result:= TextoAuxiliar;
end;

procedure GerarRegistroPafEcf(datai, dataf, FormAberto: string);
var
  EAD, serie, dataformatada: AnsiString;
  QtdeDAV, QtdeDAVPAFQtdeRegistros: integer;
  QtdeItensDAV, QtdeItensDAVPAFQtdeRegistros: integer;
  QtdeProduto, QtdeProdutoPAFQtdeRegistros: integer;
  QtdeProdutoEst, QtdeProdutoEstPAFQtdeRegistros: integer;
  QtdeECF, QtdeECFPAFQtdeRegistros: integer;
  QtdeR01, QtdeR01PAFQtdeRegistros: integer;
  QtdeR02, QtdeR02PAFQtdeRegistros: integer;
  QtdeR03, QtdeR03PAFQtdeRegistros: integer;
  QtdeR04, QtdeR04PAFQtdeRegistros: integer;
  QtdeR05, QtdeR05PAFQtdeRegistros: integer;
  QtdeR06, QtdeR06PAFQtdeRegistros: integer;
  QtdeR07, QtdeR07PAFQtdeRegistros: integer;
  QtdeMeiosPag, QtdeMeiosPagPAFQtdeRegistros: integer;
  QtdeE3, QtdeE3PAFQtdeRegistros: integer;
  i, C3, C5, C6: integer;
begin
  TLog.Info('--- MÉTODO GerarRegistroPafEcf ---');
// U1


  // ACBrPAF := DM.ACBrECF1.Create(nil);
  // DM.ACBrECF1.PAF_U.RegistroU1.CNPJ := cnpj_emitente;
  // DM.ACBrECF1.PAF_U.RegistroU1.IE := insc_estadual;
  // DM.ACBrECF1.PAF_U.RegistroU1.IM := insc_municipal;
  //
  //
  // DM.ACBrECF1.PAF_U.RegistroU1.RAZAOSOCIAL := razao_social;
  //
  //
  // DM.ACBrECF1.PAF_U.RegistroU1.InclusaoExclusao := true;

  QtdeDAV:= PegaQtdeRegistroTabela('Pedido');
  QtdeDAVPAFQtdeRegistros:= PegaQtdeRegistroPAFQuantidadeRegistros('QtdeDAV');

  TLog.Debug('Qtde. DAV Gerado Agora: '+IntToStr(QtdeDAV));
  TLog.Debug('Qtde. DAV Consultado na Tabela de QtdeRegistros: '+IntToStr(QtdeDAVPAFQtdeRegistros));

  QtdeItensDAV:= PegaQtdeRegistroTabela('Itens_Pedido');
  QtdeItensDAVPAFQtdeRegistros:= PegaQtdeRegistroPAFQuantidadeRegistros('QtdeItensDAV');

  TLog.Debug('Qtde. Itens do DAV Gerado Agora: '+IntToStr(QtdeItensDAV));
  TLog.Debug('Qtde. Itens do DAV Consultado na Tabela de QtdeRegistros: '+IntToStr(QtdeItensDAVPAFQtdeRegistros));

  QtdeProduto:= PegaQtdeRegistroTabela('Produto');
  QtdeProdutoPAFQtdeRegistros:= PegaQtdeRegistroPAFQuantidadeRegistros('QtdeProduto');

  QtdeProdutoEst:= PegaQtdeRegistroTabela('Produto');
  QtdeProdutoEstPAFQtdeRegistros:= PegaQtdeRegistroPAFQuantidadeRegistros('QtdeProdutoEstoque');

  QtdeECF:= PegaQtdeRegistroTabela('Configuracao_ECF');
  QtdeECFPAFQtdeRegistros:= PegaQtdeRegistroPAFQuantidadeRegistros('QtdeECF');

  QtdeR01:= PegaQtdeRegistroTabela('R01');
  QtdeR01PAFQtdeRegistros:= PegaQtdeRegistroPAFQuantidadeRegistros('QtdeR01');

  QtdeR02:= PegaQtdeRegistroTabela('R02');
  QtdeR02PAFQtdeRegistros:= PegaQtdeRegistroPAFQuantidadeRegistros('QtdeR02');

  QtdeR03:= PegaQtdeRegistroTabela('R03');
  QtdeR03PAFQtdeRegistros:= PegaQtdeRegistroPAFQuantidadeRegistros('QtdeR03');

  QtdeR04:= PegaQtdeRegistroTabela('R04');
  QtdeR04PAFQtdeRegistros:= PegaQtdeRegistroPAFQuantidadeRegistros('QtdeR04');

  QtdeR05:= PegaQtdeRegistroTabela('R05');
  QtdeR05PAFQtdeRegistros:= PegaQtdeRegistroPAFQuantidadeRegistros('QtdeR05');

  QtdeR06:= PegaQtdeRegistroTabela('R06');
  QtdeR06PAFQtdeRegistros:= PegaQtdeRegistroPAFQuantidadeRegistros('QtdeR06');

  QtdeR07:= PegaQtdeRegistroTabela('R07');
  QtdeR07PAFQtdeRegistros:= PegaQtdeRegistroPAFQuantidadeRegistros('QtdeR07');

  QtdeMeiosPag:= PegaQtdeRegistroTabela('Fechamento_Venda');
  QtdeMeiosPagPAFQtdeRegistros:= PegaQtdeRegistroPAFQuantidadeRegistros('QtdeMeiosPagamento');

  QtdeE3:= PegaQtdeRegistroTabela('Pedido_Informacoes_ECF');
  QtdeE3PAFQtdeRegistros:= PegaQtdeRegistroPAFQuantidadeRegistros('QtdeDAVRegD2');

  C6:= 0;
  dm.ACBrPAF1.PAF_U.RegistroU1.Create;
  with dm.ACBrPAF1.PAF_U.RegistroU1 do
  begin


    CNPJ := cnpj;
    IE := insc_estadual;
    IM := insc_municipal;


    //razSocialEspacoBranco := razao_social;
    //razSocialEspacoBranco := razSocialEspacoBranco + StringOfChar(' ', 50 - Length(razao_social));

    if (QtdeDAV = QtdeDAVPAFQtdeRegistros) and
       (QtdeItensDAV = QtdeItensDAVPAFQtdeRegistros) and
       (QtdeProduto = QtdeProdutoPAFQtdeRegistros) and
       (QtdeProdutoEst = QtdeProdutoEstPAFQtdeRegistros) and
       (QtdeECF = QtdeECFPAFQtdeRegistros) and
       (QtdeR01 = QtdeR01PAFQtdeRegistros) and
       (QtdeR02 = QtdeR02PAFQtdeRegistros) and
       (QtdeR03 = QtdeR03PAFQtdeRegistros) and
       (QtdeR04 = QtdeR04PAFQtdeRegistros) and
       (QtdeR05 = QtdeR05PAFQtdeRegistros) and
       (QtdeR06 = QtdeR06PAFQtdeRegistros) and
       (QtdeR07 = QtdeR07PAFQtdeRegistros) and
       (QtdeE3 = QtdeE3PAFQtdeRegistros) and
       (QtdeMeiosPag = QtdeMeiosPagPAFQtdeRegistros)
     then
      RAZAOSOCIAL := razao_social
    else
      RAZAOSOCIAL:= Retorna_Interrogacao_Espaco_Branco(razao_social, 50);//StringReplace(razSocialEspacoBranco, ' ', '?', [rfReplaceAll]);

    InclusaoExclusao := false;
  end;


  // A2
  dm.ACBrPAF1.PAF_A.RegistroA2.clear;
  Carrega_Dados_Meios_PagamentoA2(datai, dataf);
  while not(qMeiosPagamento.Eof) do
  begin
    MD5A2Gerado := qMeiosPagamento.FieldByName('MD5').AsString;
    MD5A2 := GeraMD5([qMeiosPagamento.FieldByName('Tipo_Documento').AsString,qMeiosPagamento.FieldByName('Valor_Fechamento').AsString]);
    with dm.ACBrPAF1.PAF_A.RegistroA2.New do
    begin
      DT := qMeiosPagamento.FieldByName('Data_Fechamento').AsDateTime;
      if (MD5A2 <> MD5A2Gerado) then
        MEIO_PGTO := Retorna_Interrogacao_Espaco_Branco(qMeiosPagamento.FieldByName('Forma_Pagamento').AsString, 25)
      else
        MEIO_PGTO := qMeiosPagamento.FieldByName('Forma_Pagamento').AsString;

      if (qMeiosPagamento.FieldByName('Tipo_Documento')
        .AsString = 'CUPOM FISCAL') then
        TIPO_DOC := '1'
      else
        TIPO_DOC := '2';
      VL := qMeiosPagamento.FieldByName('Valor_Fechamento').AsFloat;
      RegistroValido := true;
      qMeiosPagamento.Next;
    end;
  end;

  // P1
  PreencherHeader(dm.ACBrPAF1.PAF_P.RegistroP1);
  // P2
  dm.ACBrPAF1.PAF_P.RegistroP2.clear;
  Carrega_Dados_ProdutosP2;
  while not(qP2.Eof) do
  begin
    MD5P2 := qP2.FieldByName('MD52').AsString;
    MD5P2Gerado := GeraMD5([qP2.FieldByName('Codigo_Venda').AsString,
      qP2.FieldByName('Descricao').AsString,
      qP2.FieldByName('Tipo_Recolhimento').AsString,
      qP2.FieldByName('ICMS').AsString,
      qP2.FieldByName('Preco_Vista').AsString]);

    with dm.ACBrPAF1.PAF_P.RegistroP2.New do
    begin
      COD_MERC_SERV := qP2.FieldByName('Codigo_Venda').AsString;
      DESC_MERC_SERV := qP2.FieldByName('Descricao').AsString;

      if (MD5P2 = MD5P2Gerado) then
        UN_MED := qP2.FieldByName('Sigla').AsString
      else
        UN_MED := Retorna_Interrogacao_Espaco_Branco(qP2.FieldByName('Sigla').AsString, 6);

      IAT := qP2.FieldByName('Arred_Trunc').AsString;
      IPPT := qP2.FieldByName('Producao_Propria').AsString;

      if (qP2.FieldByName('Tipo').AsString = '0') then
      begin
        if (qP2.FieldByName('Tipo_Recolhimento').AsString = 'TRIBUTADO') then
          ST := 'T'
        else if (qP2.FieldByName('Tipo_Recolhimento').AsString = 'I') then
          ST := 'I'
        else if (qP2.FieldByName('Tipo_Recolhimento').AsString = 'NT') then
          ST := 'N'
        else if (qP2.FieldByName('Tipo_Recolhimento').AsString = 'ST') then
          ST := 'F';
      end
      else
      begin
        ST := 'S';
      end;

      if (qP2.FieldByName('Tipo').AsString = '0') then
      begin
        if (qP2.FieldByName('Tipo_Recolhimento').AsString = 'TRIBUTADO') then
        begin
          if Length(qP2.FieldByName('ICMS').AsString) = 1 then
            sAliquota := '0' + qP2.FieldByName('ICMS').AsString + '00' // 0700
          else if Length(qP2.FieldByName('ICMS').AsString) = 2 then
            sAliquota := qP2.FieldByName('ICMS').AsString + '00' // 1200
          else if Length(qP2.FieldByName('ICMS').AsString) = 3 then
            sAliquota := '0' + qP2.FieldByName('ICMS').AsString + '0' // 0840
          else if Length(qP2.FieldByName('ICMS').AsString) = 4 then
            sAliquota := qP2.FieldByName('ICMS').AsString + '0'; // 1320
          ALIQ := StrToFloat(sAliquota);
        end
        else
          ALIQ := 0;
      end
      else
      begin
        if Length(qP2.FieldByName('ISS').AsString) = 1 then
          sAliquota := '0' + qP2.FieldByName('ISS').AsString + '00' // 0700
        else if Length(qP2.FieldByName('ISS').AsString) = 2 then
          sAliquota := qP2.FieldByName('ISS').AsString + '00' // 1200
        else if Length(qP2.FieldByName('ISS').AsString) = 3 then
          sAliquota := '0' + qP2.FieldByName('ISS').AsString + '0' // 0840
        else if Length(qP2.FieldByName('ISS').AsString) = 4 then
          sAliquota := qP2.FieldByName('ISS').AsString + '0'; // 1320
        ALIQ := StrToFloat(sAliquota);
      end;

      VL_UNIT := qP2.FieldByName('Preco_Vista').AsFloat;
    end;
    qP2.Next;
  end;

  // E1
  PreencherHeader(dm.ACBrPAF1.PAF_E.RegistroE1);
  // E2
  dm.ACBrPAF1.PAF_E.RegistroE2.clear;
  if (FormAberto = 'Geral') then
  begin
    Carrega_Dados_EstoqueE2('Geral');
    while not(qE2.Eof) do
    begin
      MD5E2 := qE2.FieldByName('MD5').AsString;
      MD5E2Gerado := GeraMD5([qE2.FieldByName('Codigo_Venda').AsString,
                              qE2.FieldByName('Descricao').AsString,
                              qE2.FieldByName('Estoque').AsString]);

      with (dm.ACBrPAF1.PAF_E.RegistroE2.New) do
      begin
        COD_MERC := qE2.FieldByName('Codigo_Venda').AsString;
        DESC_MERC := qE2.FieldByName('Descricao').AsString;

        if (MD5E2 = MD5E2Gerado) then
          UN_MED := qE2.FieldByName('Sigla').AsString
        else
          UN_MED := Retorna_Interrogacao_Espaco_Branco(qE2.FieldByName('Sigla').AsString, 6);

        QTDE_EST := qE2.FieldByName('Estoque').AsCurrency;
        RegistroValido := true;
      end;
      qE2.Next;
    end;
  end
  else if (FormAberto = 'RegPAF') then
  begin
    if (FrmPAFECF_Registros_PAF.RGTipoEstoque.ItemIndex = 0) then
    begin
      FrmPAFECF_Registros_PAF.qE2.First;
      while not(FrmPAFECF_Registros_PAF.qE2.Eof) do
      begin
        {if (FrmPAFECF_Registros_PAF.qE2.FieldByName('Codigo_Venda').AsString = '0000000002738') then
        begin
          ShowMessage('1');
        end; }

        MD5E2 := FrmPAFECF_Registros_PAF.qE2.FieldByName('MD5').AsString;
        MD5E2Gerado := GeraMD5([FrmPAFECF_Registros_PAF.qE2.FieldByName('Codigo_Venda').AsString,
                                FrmPAFECF_Registros_PAF.qE2.FieldByName('Descricao').AsString,
                                FrmPAFECF_Registros_PAF.qE2.FieldByName('Estoque').AsString]);

        with (dm.ACBrPAF1.PAF_E.RegistroE2.New) do
        begin
          COD_MERC := FrmPAFECF_Registros_PAF.qE2.FieldByName('Codigo_Venda').AsString;
          DESC_MERC := FrmPAFECF_Registros_PAF.qE2.FieldByName('Descricao').AsString;

          if (MD5E2 = MD5E2Gerado) then
            UN_MED := FrmPAFECF_Registros_PAF.qE2.FieldByName('Sigla').AsString
          else
            UN_MED := Retorna_Interrogacao_Espaco_Branco(FrmPAFECF_Registros_PAF.qE2.FieldByName('Sigla').AsString, 6);

          QTDE_EST := FrmPAFECF_Registros_PAF.qE2.FieldByName('Estoque').AsCurrency;
          RegistroValido := true;
        end;
      FrmPAFECF_Registros_PAF.qE2.Next;
      end;
    end
    else
    begin
      for i := 1 to FrmPAFECF_Registros_PAF.DBGrid2.SelectedRows.Count do
      //if (FrmPAFECF_Registros_PAF.DBGrid2.SelectedRows.CurrentRowSelected) then
      begin
        FrmPAFECF_Registros_PAF.qE2.GotoBookmark(Pointer(FrmPAFECF_Registros_PAF.DBGrid2.SelectedRows.Items[i-1]));
        MD5E2 := FrmPAFECF_Registros_PAF.qE2.FieldByName('MD5').AsString;
        MD5E2Gerado := GeraMD5([FrmPAFECF_Registros_PAF.qE2.FieldByName('Codigo_Venda').AsString,
                                FrmPAFECF_Registros_PAF.qE2.FieldByName('Descricao').AsString,
                                FrmPAFECF_Registros_PAF.qE2.FieldByName('Estoque').AsString]);

        with (dm.ACBrPAF1.PAF_E.RegistroE2.New) do
        begin
          COD_MERC := FrmPAFECF_Registros_PAF.qE2.FieldByName('Codigo_Venda').AsString;
          DESC_MERC := FrmPAFECF_Registros_PAF.qE2.FieldByName('Descricao').AsString;

          if (MD5E2 = MD5E2Gerado) then
            UN_MED := FrmPAFECF_Registros_PAF.qE2.FieldByName('Sigla').AsString
          else
            UN_MED := Retorna_Interrogacao_Espaco_Branco(FrmPAFECF_Registros_PAF.qE2.FieldByName('Sigla').AsString, 6);

          QTDE_EST := FrmPAFECF_Registros_PAF.qE2.FieldByName('Estoque').AsCurrency;
          RegistroValido := true;
        end;
      end;
      //FrmPAFECF_Registros_PAF.qE2.Next;
    end;
  end;


  // E3
  Carrega_Dados_ECFE3(datai, dataf); //tabela R06
  while not(qE3.Eof) do
  begin
    MD5E3 := qE3.FieldByName('md5').AsString;

    MD5E3Gerado := GeraMD5([qE3.FieldByName('dt_estoque').AsString,
                            qE3.FieldByName('hr_estoque').AsString,
                            qE3.FieldByName('num_fab').AsString]);

    with (dm.ACBrPAF1.PAF_E.RegistroE3) do
    begin

      NUM_FAB := qE3.FieldByName('num_fab').AsString;
      MF_ADICIONAL := qE3.FieldByName('mf_adicional').AsString;
      TIPO_ECF := 'ECF-IF';
      MARCA_ECF := 'BEMATECH';

      if (MD5E3 = MD5E3Gerado) then
        MODELO_ECF := qE3.FieldByName('modelo_ecf').AsString
      else
        MODELO_ECF := Retorna_Interrogacao_Espaco_Branco(qE3.FieldByName('modelo_ecf').AsString, 20);

      aux1 := qE3.FieldByName('dt_estoque').AsString;
      aux2 := qE3.FieldByName('hr_estoque').AsString;

      DT_EST := StrToDateTime(aux1 +' '+ aux2);

      RegistroValido := true;
    end;
    qE3.Next;
  end;

  // D1
  PreencherHeader(dm.ACBrPAF1.PAF_D.RegistroD1);
  // D2
  Carrega_Dados_D2(datai, dataf);

  dm.ACBrPAF1.PAF_D.RegistroD2.clear;



  while not(qD2.Eof) do
  begin

  MD5D2 := qD2.FieldByName('MD5_Pedido').AsString;
  ////erro aqui
  ////o MD5 está pegando os dados corretos, mas na hora de gerar o novo MD5 deve estar pegando um valor
  ////com virgula ou algum outro sinal que está deixando divergente algum dado

  MD5D2Gerado := GeraMD5([qD2.FieldByName('COO').AsString,
                          qD2.FieldByName('N_Pedido').AsString,
                          qD2.FieldByName('N_Sequencia').AsString,
                          qD2.FieldByName('Nome_Nome_Fantasia').AsString,
                          qD2.FieldByName('CPF').AsString,
                          qD2.FieldByName('Data_Venda').AsString,
                          qD2.FieldByName('Total_Pedido').AsString]);


    with dm.ACBrPAF1.PAF_D.RegistroD2.New do
    begin
      NUM_FAB := qD2.FieldByName('N_Fabricacao_ECF').AsString;
      MF_ADICIONAL := qD2.FieldByName('MF_Adicional').AsString;
      TIPO_ECF := qD2.FieldByName('Tipo_ECF').AsString;
      MARCA_ECF := qD2.FieldByName('Marca_ECF').AsString;
      MODELO_ECF := qD2.FieldByName('Modelo_ECF').AsString;
      COO := qD2.FieldByName('COO').AsString;
      NUM_DAV := qD2.FieldByName('N_Pedido').AsString;
      DT_DAV := qD2.FieldByName('Data_Venda').AsDateTime;
      TIT_DAV := 'Orçamento';
      VLT_DAV := qD2.FieldByName('Total_Pedido').AsFloat;
      COO_DFV := qD2.FieldByName('COO_Vin').AsString;
      NUMERO_ECF := qD2.FieldByName('N_Sequencia').AsString;
      NOME_CLIENTE := qD2.FieldByName('Nome_Nome_Fantasia').AsString;

      if (MD5D2 = MD5D2Gerado) then
        MODELO_ECF := qD2.FieldByName('Modelo_ECF').AsString
      else
        MODELO_ECF := Retorna_Interrogacao_Espaco_Branco(qD2.FieldByName('Modelo_ECF').AsString, 20);;

      if (qD2.FieldByName('CPF').AsString = '') then
        CPF_CNPJ := qD2.FieldByName('CNPJ').AsString
      else
        CPF_CNPJ := qD2.FieldByName('CPF').AsString;

      RegistroValido := true; // diz quando o registro foi modificado no banco

      // REGISTRO D3
      Carrega_Dados_D3(datai, dataf);
      while not(qD3.Eof) do
      begin
        MD5D3 := qD3.FieldByName('MD5').AsString;
        MD5D3Gerado := GeraMD5([qD3.FieldByName('N_Pedido').AsString,
                                qD3.FieldByName('Data_Venda').AsString,
                                qD3.FieldByName('N_Item').AsString,
                                qD3.FieldByName('Codigo_Produto').AsString,
                                qD3.FieldByName('Descricao').AsString,
                                qD3.FieldByName('Qtde').AsString,
                                qD3.FieldByName('UN').AsString,
                                qD3.FieldByName('Valor_Unitario').AsString,
                                qD3.FieldByName('Desc_Acr').AsString,
                                qD3.FieldByName('Desc_Acr').AsString,
                                qD3.FieldByName('Sub_Total').AsString,
                                qD3.FieldByName('Tipo_Recolhimento').AsString,
                                qD3.FieldByName('ICMS').AsString,
                                qD3.FieldByName('Cancelado').AsString]);


        with RegistroD3.New do
        begin
          DT_INCLUSAO := qD3.FieldByName('Data_Venda').AsDateTime;
          NUM_ITEM := qD3.FieldByName('N_Item').AsInteger;
          COD_ITEM := qD3.FieldByName('Codigo').AsString;

          if (MD5D3 = MD5D3Gerado) then
          begin
            DESC_ITEM := qD3.FieldByName('Descricao').AsString
          end
          else
          begin
            DESC_ITEM := Retorna_Interrogacao_Espaco_Branco(qD3.FieldByName('Descricao').AsString, 100);
          end;

          QTDE_ITEM := qD3.FieldByName('Qtde').AsFloat;
          UNI_ITEM := qD3.FieldByName('UN').AsString;
          VL_UNIT := qD3.FieldByName('Valor_Unitario').AsFloat;
          VL_DESCTO := qD3.FieldByName('Desc_Acr').AsFloat;
          VL_ACRES := qD3.FieldByName('Desc_Acr').AsFloat;
          VL_TOTAL := qD3.FieldByName('Sub_Total').AsFloat;

          if (qD3.FieldByName('Tipo_Recolhimento').AsString = 'TRIBUTADO') then
            SIT_TRIB := 'T'; // T, S, I, N, F
          SIT_TRIB := 'N'; // T, S, I, N, F

          ALIQ := qD3.FieldByName('ICMS').AsFloat;; // SOMENTE QUANDO T E S

          if (qD3.FieldByName('Cancelado').AsString = 'N') then
            IND_CANC := 'N';
          IND_CANC := 'S';

          DEC_QTDE_ITEM := 2;
          DEC_VL_UNIT := 2;

          RegistroValido := true;
        end;
        qD3.Next;
      end;

      Carrega_Dados_D4;

      while not(qD4.Eof) do
      begin
        with RegistroD4.New do
        begin
          NUM_DAV := qD4.FieldByName('N_Pedido').AsString;
          DT_ALT := qD4.FieldByName('dtAlteracao').AsDateTime;
          COD_ITEM := qD4.FieldByName('Codigo_Registro').AsString;
          DESC_ITEM := qD4.FieldByName('Descricao').AsString;
          QTDE_ITEM := qD4.FieldByName('Qtde').AsFloat;
          UNI_ITEM := qD4.FieldByName('UN').AsString;
          VL_UNIT := qD4.FieldByName('Valor_Unitario').AsFloat;
          VL_DESCTO := qD4.FieldByName('Desc_Acr').AsFloat;
          VL_ACRES := qD4.FieldByName('Desc_Acr').AsFloat;
          VL_TOTAL := qD4.FieldByName('Sub_Total').AsFloat;
          SIT_TRIB := qD4.FieldByName('CST').AsString;
          ALIQ := qD4.FieldByName('ICMS').AsFloat;

          //if (qD4.FieldByName('Cancelado').AsString = 'N') then
            //IND_CANC := 'N';  ////porque vc colocou essa verificação, se o próprio
          //IND_CANC := 'S';    ////retorno já traz S ou N??????????
          IND_CANC:= qD4.FieldByName('Cancelado').AsString;

          DEC_QTDE_ITEM := 2;
          DEC_VL_UNIT := 2;
          TIP_ALT := qD4.FieldByName('tipo_alteracao').AsString;

          RegistroValido := true;
        end;
        qD4.Next;
      end;

    end;
    qD2.Next;
  end;

  // data2 := FormatDateTime('YYYYMMDD', StrToDateTime(fdata));
  // hora  := FormatDateTime('HHMMSS', StrToTime(hora));
  // hora := '      ';
  // Data := DateToStr(date);
  // d_ini:= FormatDateTime('YYYYMMDD', Data);
  // d_fim:= FormatDateTime('YYYYMMDD', Data);

  // Registro R1 - Identificação do ECF, do Usuário, do PAF-ECF e da Empresa Desenvolvedora e Dados do Arquivo


//      Carrega_Dados_R01;
//        MD5R01 := GeraMD5([
//                          qR1.FieldByName('CNPJ').AsAnsiString
//                        , qR1.FieldByName('N_Fabricacao').AsAnsiString
//                        , qR1.FieldByName('Codigo').AsAnsiString
//                        ]);
//
//    Carrega_Dados_R02(datai, dataf);
//      MD5R02 := GeraMD5([
//                          qR2.FieldByName('N_Fabricacao').AsString
//                        , qR2.FieldByName('CRZ').AsString
//                        , qR2.FieldByName('CRO').AsString
//                        , qR2.FieldByName('COO').AsString
//                        , qR2.FieldByName('Data_Movimento').AsString
//                        , qR2.FieldByName('Data_Emissao').AsString
//                        , qR2.FieldByName('Hora_Emissao').AsString
//                        , qR2.FieldByName('Venda_Bruta_Diaria').AsString
//                        ]);
//
//
//
//      Carrega_Dados_R03(datai, dataf);
//        MD5R3 := GeraMD5([qR3.FieldByName('N_Fabricacao').AsString
//                  ,       qR3.FieldByName('CRZ').AsString
//                  ,       qR3.FieldByName('Totalizador_Parcial').AsString
//                  ,       qR3.FieldByName('Valor_Acumulado').AsString]);
//
//      Carrega_Dados_R04(datai, dataf);
//        MD5R4 := GeraMD5([qR4.FieldByName('N_Fabricacao').AsString
//                , qR4.FieldByName('CCF').AsString
//                , qR4.FieldByName('COO').AsString
//                , qR4.FieldByName('Valor_Total').AsString
//                , qR4.FieldByName('Cancelamento').AsString]);
//
//
//              Carrega_Dados_R05(datai, dataf);
//
//              MD5R5 := GeraMD5([
//                                qR5.FieldByName('N_Fabricacao').asstring
//                              , qR5.FieldByName('CCF').asstring
//                              , qR5.FieldByName('COO').asstring
//                              , qR5.FieldByName('Codigo_Produto').asstring //Ou codigo produto inteiro
//                              , qR5.FieldByName('Quantidade').asstring
//                              , qR5.FieldByName('Valor_Unitario').asstring
//                              , qR5.FieldByName('Valor_Total').asstring
//                              , qR5.FieldByName('Totalizador_Parcial').asstring
//                              , qR5.FieldByName('Cancelamento').asstring
//                              ]);
//
//
//
//
//      Carrega_Dados_R06(datai, dataf);
//      MD5R6 := GeraMD5([
//                          qR6.FieldByName('N_Fabricacao').asstring
//                        , qR6.FieldByName('COO').asstring
//                        , qR6.FieldByName('GNF').asstring //Ou codigo produto inteiro
//                        , qR6.FieldByName('CDC').asstring
//                        , qR6.FieldByName('Denominacao').asstring
//                        , qR6.FieldByName('Data_Final_Emissao').asstring
//                        ]);
//
//      Carrega_Dados_R07('qR6', datai, dataf);
//      MD5R7 := GeraMD5([qR7.FieldByName('N_Fabricacao').asstring
//                            , qR7.FieldByName('COO').asstring
//                            , qR7.FieldByName('GNF').asstring
//                            ]);

    {verificaModeloECF := False;
    if MD5R01 <> qR1.fieldbyname('MD5').asstring  then
    begin
      verificaModeloECF := true;
    end;

    TLog.Debug('MD5 R01 Gerado Agora: '+MD5R01);
    TLog.Debug('MD5 R01 Consultado na qR1: '+qR1.fieldbyname('MD5').asstring);

    if (MD5R02 <> qR2.fieldbyname('MD5').asstring) then
    begin
      verificaModeloECF := true;
    end;

    TLog.Debug('MD5 R02 Gerado Agora: '+MD5R02);
    TLog.Debug('MD5 R02 Consultado na qR2: '+qR2.fieldbyname('MD5').asstring);

    if (MD5R3 <> qR3.fieldbyname('MD5').asstring) then
    begin
      verificaModeloECF := true;
    end;

    TLog.Debug('MD5 R03 Gerado Agora: '+MD5R3);
    TLog.Debug('MD5 R03 Consultado na qR3: '+qR3.fieldbyname('MD5').asstring);

    if (MD5R4 <> qR4.fieldbyname('MD5').asstring)then
    begin
      verificaModeloECF := true;
    end;

    TLog.Debug('MD5 R04 Gerado Agora: '+MD5R4);
    TLog.Debug('MD5 R04 Consultado na qR4: '+qR4.fieldbyname('MD5').asstring);

    if (MD5R5 <> qR5.fieldbyname('MD5').asstring) then
    begin
      verificaModeloECF := true;
    end;

    TLog.Debug('MD5 R05 Gerado Agora: '+MD5R5);
    TLog.Debug('MD5 R05 Consultado na qR5: '+qR5.fieldbyname('MD5').asstring);

    if (MD5R6 <> qR6.fieldbyname('MD5').asstring) then
    begin
      verificaModeloECF := true;
    end;

    TLog.Debug('MD5 R06 Gerado Agora: '+MD5R6);
    TLog.Debug('MD5 R06 Consultado na qR6: '+qR6.fieldbyname('MD5').asstring);

    if (MD5R7 <> qR7.fieldbyname('MD5').asstring) then
    begin
      verificaModeloECF := true;
    end;

    TLog.Debug('MD5 R07 Gerado Agora: '+MD5R7);
    TLog.Debug('MD5 R07 Consultado na qR7: '+qR7.fieldbyname('MD5').asstring); }


  with dm.ACBrPAF1.PAF_R.RegistroR01.New do
  begin
    NUM_FAB := nu_serie_inteiro;
    MF_ADICIONAL := mf;
    TIPO_ECF := tipo;
    MARCA_ECF := marca;

    verificaModeloECF:= false;

    Carrega_Dados_R01;
    MD5R01 := GeraMD5([qR1.FieldByName('CNPJ').AsString
                      ,qR1.FieldByName('N_Fabricacao').AsString]);

    TLog.Debug('MD5 R01 Gerado Agora: '+MD5R01);
    TLog.Debug('MD5 R01 Consultado na qR1: '+qR1.fieldbyname('MD5').asstring);

    if (MD5R01 <> qR1.FieldByName('MD5').AsString) then
    begin
      verificaModeloECF:= true;
    end;

    VERSAO_SB := versao_sb;
    DT_INST_SB := StrToDateTime(data_gra);
//    DT_INST_SB := 05052015;
    HR_INST_SB := 010230;
    NUM_SEQ_ECF := StrToInt(Copy(sequencia, 2,3));
    CNPJ := cnpj;
    IE := insc_estadual;

    CNPJ_DESENV:= StringReplace(cnpj_des, '.', '', [rfReplaceAll]);
    CNPJ_DESENV:= StringReplace(CNPJ_DESENV, '/', '', [rfReplaceAll]);
    CNPJ_DESENV:= StringReplace(CNPJ_DESENV, '-', '', [rfReplaceAll]);

    CNPJ_SH := CNPJ_DESENV;
    IE_SH := insc_est_des;
    IM_SH := insc_mun_des;
    NOME_SH := deno_des;
    NOME_PAF := NOME_PAF;
    versao_paf:= StringReplace(versao_paf, '.', '', [rfReplaceAll]);

    VER_PAF := versao_paf;
    COD_MD5 := pMD5;
    DT_INI := StrToDateTime(datai);
    DT_FIN := StrToDateTime(datai);

    versao_er_paf:= StringReplace(versao_er_paf, '.', '', [rfReplaceAll]);
    ER_PAF_ECF := versao_er_paf;

    InclusaoExclusao := False;
    RegistroValido := true;

    /// / BANCO R02
    ///
    try
      Carrega_Dados_R02(datai, dataf);
      while not qR2.Eof do
      begin
        MD5R02 := GeraMD5([
                          qR2.FieldByName('N_Fabricacao').AsString
                        , qR2.FieldByName('CRZ').AsString
                        , qR2.FieldByName('CRO').AsString
                        , qR2.FieldByName('COO').AsString
                        , Retorna_Data_Formatada(qR2.FieldByName('Data_Movimento').AsString, 'DD/MM/YYYY')
                        , qR2.FieldByName('Data_Emissao').AsString
                        , qR2.FieldByName('Hora_Emissao').AsString
                        , qR2.FieldByName('Venda_Bruta_Diaria').AsString
                        ]);

        TLog.Debug('MD5 R02 Gerado Agora: '+MD5R02);
        TLog.Debug('MD5 R02 Consultado na qR2: '+qR2.fieldbyname('MD5').asstring);
        TLog.Debug('R02 Data: '+qR2.fieldbyname('Data_Movimento').asstring);

        // n_serie := qR2.FieldByName('N_Fabricacao').AsString;
        // mfad := qR2.FieldByName('MF_Adicional').AsString;
        // modeloecf := qR2.FieldByName('Modelo_ECF').AsString;
        data_red1 := copy(qR2.FieldByName('Data_Emissao').Value, 1, 2);
        data_red1 := data_red1 + '/';
        data_red2 := copy(qR2.FieldByName('Data_Emissao').Value, 3, 2);
        data_red2 := data_red1 + data_red2 + '/';
        data_red3 := copy(qR2.FieldByName('Data_Emissao').Value, 5, 2);
        data_red3 := data_red2 + data_red3;

        venda_bruta_diaria := qR2.FieldByName('Venda_Bruta_Diaria').AsString;
        // modeloecf := StringReplace(modeloecf, '-', '', [rfReplaceAll]);
        // Registro R02 - Relação de Reduções Z
        // e R03 - Detalhe da Redução Z

        with RegistroR02.New do
        begin
          NUM_USU := qR2.FieldByName('N_Usuario').AsInteger;
          CRZ := qR2.FieldByName('CRZ').AsInteger;
          COO := qR2.FieldByName('COO').AsInteger;
          cro := qR2.FieldByName('CRO').AsInteger;

          if (MD5R02 <> qR2.fieldbyname('MD5').asstring) then
          begin
            verificaModeloECF:= true;
          end;

          //DataAux:= StringReplace(qR2.FieldByName('Data_Movimento').AsString, '-', '/', [rfReplaceAll]);
          DataAux:= Retorna_Data_Formatada(qR2.FieldByName('Data_Movimento').AsString, 'DD/MM/YYYY');//StrToDateTime(FormatDateTime('DD/MM/YYYY',StrToDate(DataAux)));
          DT_MOV :=  StrToDate(DataAux);//StrToDateTime(FormatDateTime('YYYYMMDD',StrToDate( DataAux)));
          //DataAux:= Retorna_Data_Formatada(data_red3, 'DD/MM/YYYY');
          DT_EMI := StrToDateTime(FormatDateTime('DD/MM/YYYY', StrToDate(data_red3)));//StrToDate(DataAux);

          HoraAux:= Retorna_Hora_Formatada(qR2.FieldByName('Hora_Emissao').AsString);
          HR_EMI := StrToTime(HoraAux);
          VL_VBD := StrToFloat(venda_bruta_diaria);
          PAR_ECF := qR2.FieldByName('Parametro_ECF').AsString;;

          // indo no banco R03
          try
            Carrega_Dados_R03(datai, dataf);
            //if (C3 = 0) then
            //begin
              while not qR3.Eof do
              begin
                // n_serie := qR3.FieldByName('N_Fabricacao').AsString;
                // mfad := qR3.FieldByName('MF_Adicional').AsString;
                // modeloecf := qR3.FieldByName('Modelo_ECF').AsString;
                // modeloecf := StringReplace(modeloecf, '-', '', [rfReplaceAll]);
                // n_usu := qR3.FieldByName('N_Usuario').AsString;
                // crz := qR3.FieldByName('CRZ').AsInteger;

                MD5R3 := GeraMD5([qR3.FieldByName('N_Fabricacao').AsString
                          ,       qR3.FieldByName('CRZ').AsString
                          ,       qR3.FieldByName('Totalizador_Parcial').AsString
                          ,       qR3.FieldByName('Valor_Acumulado').AsString]);


                TLog.Debug('MD5 R03 Gerado Agora: '+MD5R3);
                TLog.Debug('MD5 R03 Consultado na qR3: '+qR3.fieldbyname('MD5').asstring);
                TLog.Debug('R03 Data: '+qR3.fieldbyname('Data_Movimento').asstring);

                cTotalizador := qR3.FieldByName('Valor_Acumulado').AsString;
                with RegistroR03.New do
                begin
                  TOT_PARCIAL := 'TOT ' + qR3.FieldByName
                    ('Totalizador_Parcial').AsString;
                  VL_ACUM := StrToFloat(cTotalizador);

                  if (MD5R3 <> qR3.FieldByName('MD5').AsString) then
                  begin
                    verificaModeloECF:= true;
                  end;

                  //CRZ:= qR3.FieldByName('CRZ').AsInteger;
                  { TODO -oOwner -cGeneral : FAZER O RESTANTE
                    PARA PREENCHER AQUI TODOS ATRIBUTOS PEGANDO A QR2 DIRETAMENTE COMO PARAMETRO }
                end;

                qR3.Next;
              end;
              //Inc(C3);
            //end;
          finally
            //FreeAndNil(qR3);
          end;

        end;
        qR2.Next;
      end;
    finally
      FreeAndNil(qR2);
    end;

    try
      Carrega_Dados_R04(datai, dataf);
      while not qR4.Eof do
      begin
        MD5R4 := GeraMD5([qR4.FieldByName('N_Fabricacao').AsString
                , qR4.FieldByName('CCF').AsString
                , qR4.FieldByName('COO').AsString
                , qR4.FieldByName('Valor_Total').AsString
                , qR4.FieldByName('Cancelamento').AsString]);



        n_serie := qR4.FieldByName('N_Fabricacao').AsString;
        mfad := qR4.FieldByName('MF_Adicional').AsString;
        modeloecf := qR4.FieldByName('Modelo_ECF').AsString;
        modeloecf := StringReplace(modeloecf, '-', '', [rfReplaceAll]);

        if (qR4.FieldByName('Data_Inicio_Emissao').Value = '') then
          data_emissao := ''
        else
        begin
          data_red1 := copy(qR4.FieldByName('Data_Inicio_Emissao').Value, 1, 2);
          data_red1 := data_red1 + '/';
          data_red2 := copy(qR4.FieldByName('Data_Inicio_Emissao').Value, 3, 2);
          data_red2 := data_red1 + data_red2 + '/';
          data_red3 := copy(qR4.FieldByName('Data_Inicio_Emissao').Value, 5, 2);
          data_red3 := data_red2 + data_red3;
          data_emissao := FormatDateTime('DD/MM/YYYY', StrToDate(data_red3));
        end;

        indicador_tipo_acreci := qR4.FieldByName('Tipo_Acrecimo').AsString;

        valor_total := StringReplace(qR4.FieldByName('Valor_Total').AsString,
          ',', '', [rfReplaceAll]);
        valor_total := StringReplace(valor_total, '.', '', [rfReplaceAll]);

        valor_can_acre:= StringReplace(qR4.FieldByName('Valor_Cancelamento_Acrecimo').AsString,
          ',', '', [rfReplaceAll]);

        // Registro R04 - Cupom Fiscal, Nota Fiscal de Venda a Consumidor ou Bilhete de Passagem
        // e R05 - Detalhe do Cupom Fiscal, Nota Fiscal de Venda a Consumidor ou Bilhete de Passagem
        // e R07 - Detalhe do Cupom Fiscal e do Documento Não Fiscal - Meio de Pagamento

        with RegistroR04.New do
        begin
          NUM_USU := qR4.FieldByName('N_Usuario').AsInteger;
          NUM_CONT := qR4.FieldByName('CCF').AsInteger; // Esse daqui é o CCF!!
          COO := qR4.FieldByName('COO').AsInteger;

          if (MD5R4 <> qR4.FieldByName('MD5').AsString) then
          begin
            verificaModeloECF:= true;
          end;

          TLog.Debug('MD5 R04 Gerado Agora: '+MD5R4);
          TLog.Debug('MD5 R04 Consultado na qR4: '+qR4.fieldbyname('MD5').asstring);

          DT_INI := StrToDateTime(data_emissao); // StrToDateTime(data_emissao);
          SUB_DOCTO :=
            StrToFloat(StringReplace(qR4.FieldByName('Sub_Total_Documento')
            .AsString, ',', '', [rfReplaceAll]));
          SUB_DESCTO :=
            StrToFloat(StringReplace(qR4.FieldByName('Desconto').AsString, ',',
            '', [rfReplaceAll]));
          TP_DESCTO := 'V';
          SUB_ACRES :=
            StrToFloat(StringReplace(qR4.FieldByName('Acrecimo').AsString, ',',
            '', [rfReplaceAll]));
          TP_ACRES := 'V';
          VL_TOT := StrToFloat(valor_total);
          CANC := qR4.FieldByName('Cancelamento').AsString;
          VL_CA := StrToFloat(valor_can_acre);
          ORDEM_DA := 'D';
          NOME_CLI := 'CLIENTE' + qR4.FieldByName('Adquirente').AsString;
          CNPJ_CPF := qR4.FieldByName('CPF_CNPJ').AsString;

          try
            Carrega_Dados_R05(datai, dataf);
            //if (C5 = 0) then
            //begin
              while not qR5.Eof do
              begin
                // n_serie := qR5.FieldByName('N_Fabricacao').AsString;
                // mfad := qR5.'FieldByName('MF_Adicional').AsString;
                // modeloecf := qR5.FieldByName('Modelo_ECF').AsString;
                // modeloecf := StringReplace(modeloecf, '-', '', [rfReplaceAll]);
                // n_usu := qR5.FieldByName('N_Usuario').AsString;
                // COO := qR5.FieldByName('COO').AsInteger;
                // ccf := qR5.FieldByName('CCF').AsString;
                n_item := qR5.FieldByName('N_Item').AsString;

                MD5R5 := GeraMD5([
                                  qR5.FieldByName('N_Fabricacao').asstring
                                , qR5.FieldByName('CCF').asstring
                                , qR5.FieldByName('COO').asstring
                                , qR5.FieldByName('Codigo_Produto').asstring //Ou codigo produto inteiro
                                , qR5.FieldByName('Quantidade').asstring
                                , qR5.FieldByName('Valor_Unitario').asstring
                                , qR5.FieldByName('Valor_Total').asstring
                                , qR5.FieldByName('Totalizador_Parcial').asstring
                                , qR5.FieldByName('Cancelamento').asstring
                                ]);

                // Registro R05 - FILHO
                with RegistroR05.New do
                begin
                  NUM_ITEM := StrToInt(n_item);
                  COD_ITEM := qR5.FieldByName('Codigo_Produto').AsString;
                  // Código do produto ou Serviço
                  DESC_ITEM := 'DESCRICAO ' + qR5.FieldByName('Descricao')
                    .AsString + ' FIM';
                  QTDE_ITEM :=
                    StrToFloat(StringReplace(qR5.FieldByName('Quantidade')
                    .AsString, ',', '', [rfReplaceAll]));
                  UN_MED := qR5.FieldByName('Unidade').AsString;
                  VL_UNIT :=
                    StrToFloat(StringReplace(qR5.FieldByName('Valor_Unitario')
                    .AsString, ',', '', [rfReplaceAll]));
                  DESCTO_ITEM :=
                    StrToFloat(StringReplace(qR5.FieldByName('Desconto').AsString,
                    ',', '', [rfReplaceAll]));
                  ACRES_ITEM :=
                    StrToFloat(StringReplace(qR5.FieldByName('Acrecimo').AsString,
                    ',', '', [rfReplaceAll]));
                  VL_TOT_ITEM :=
                    StrToFloat(StringReplace(qR5.FieldByName('Valor_Total')
                    .AsString, ',', '', [rfReplaceAll])); // GerarDados('I', 2);
                  COD_TOT_PARC :=
                    AnsiToUtf8(qR5.FieldByName('Totalizador_Parcial').AsString);
                  IND_CANC := qR5.FieldByName('Cancelamento').AsString;

                  if (MD5R5 <> qR5.FieldByName('MD5').AsString)  then
                  begin
                    verificaModeloECF:= true;
                  end;

                  TLog.Debug('MD5 R05 Gerado Agora: '+MD5R5);
                  TLog.Debug('MD5 R05 Consultado na qR5: '+qR5.fieldbyname('MD5').asstring);

                  if (qR5.FieldByName('Quantidade_Cancelada')
                    .AsString = '') then
                    QTDE_CANC:= 0
                  else
                    QTDE_CANC :=StrToFloat(StringReplace(qR5.FieldByName('Quantidade_Cancelada')
                      .AsString, ',', '', [rfReplaceAll]));

                  if (qR5.FieldByName('Valor_Cancelado')
                    .AsString = '') then
                    VL_CANC:= 0
                  else
                    VL_CANC :=                    StrToFloat(StringReplace(qR5.FieldByName('Valor_Cancelado').AsString, ',', '', [rfReplaceAll]));

                  VL_CANC_ACRES :=
                    StrToFloat
                    (StringReplace(qR5.FieldByName('Valor_Cancelamento_Acrecimo')
                    .AsString, ',', '', [rfReplaceAll]));
                  IAT := qR5.FieldByName('IAT').AsString;
                  IPPT := qR5.FieldByName('IPPT').AsString;
                  QTDE_DECIMAL := StrToInt(qR5.FieldByName('Casas_Decimais_Qtde')
                    .AsString);
                  VL_DECIMAL :=
                    StrToInt(qR5.FieldByName('Casas_Decimais_Valor_Unitario')
                    .AsString);
                end;

                qR5.Next;
              end;
              //Inc(C5);
            //end;
          finally
            //FreeAndNil(qR5);
          end;


//          try
////            Carrega_Dados_R07('qR4');
//
//            while not qR7.Eof do
//            begin
//
////            MD5R7 := GeraMD5([
////                              qR7.FieldByName('N_Fabricacao').asstring
////                            , qR7.FieldByName('COO').asstring
////                            , qR7.FieldByName('GNF').asstring
////                            ]);
//
//              // Registro R07 - FILHO
//              with RegistroR07.New do
//              begin
//                if (qR7.FieldByName('CCF').AsString = '') then
//                  CCF:= 0
//                else
//                  CCF := qR7.FieldByName('CCF').AsInteger;
//
//                // GerarDados('I',3); //Pega do R04
//                MP := qR7.FieldByName('Meio_Pagamento').AsString;
//                // + GerarDados('S', 6);
//                VL_PAGTO :=
//                  StrToFloat(StringReplace(qR7.FieldByName('Valor_Pago')
//                  .AsString, ',', '', [rfReplaceAll]));
//                IND_EST := AnsiToUtf8(qR7.FieldByName('Estorno').AsString);
//                VL_EST := StrToFloat
//                  (StringReplace(qR7.FieldByName('Valor_Estorno').AsString, ',',
//                  '', [rfReplaceAll]));
//
//              end;
//
//              qR7.Next;
//            end;
//          finally
//            FreeAndNil(qR7);
//          end;


        end;

        qR4.Next;
      end;
    finally
      //FreeAndNil(qR4);
    end;

    Carrega_Dados_R06(datai, dataf);

    while not qR6.Eof do
    begin

      MD5R6 := GeraMD5([
                          qR6.FieldByName('N_Fabricacao').asstring
                        , qR6.FieldByName('COO').asstring
                        , qR6.FieldByName('GNF').asstring //Ou codigo produto inteiro
                        , qR6.FieldByName('CDC').asstring
                        , qR6.FieldByName('Denominacao').asstring
                        , qR6.FieldByName('Data_Final_Emissao').asstring
                        ]);
      // ver data final emissão
      aux1 := copy(qR6.FieldByName('Data_Final_Emissao').AsString, 1, 2);
      aux2 := copy(qR6.FieldByName('Data_Final_Emissao').AsString, 3, 2);
      aux3 := copy(qR6.FieldByName('Data_Final_Emissao').AsString, 5, 2);
      aux4 := aux1 + '/' + aux2 + '/' + aux3;

      data_final_emissao := FormatDateTime('DD/MM/YYYY', StrToDate(aux4));
      //hora_final_emissao := qR6.FieldByName('Hora_Final_Emissao').AsString;


      // Registro R06 - Demais documentos emitidos pelo ECF
      // e R07 - Detalhe do Cupom Fiscal e do Documento Não Fiscal - Meio de Pagamento

      with RegistroR06.New do
      begin

        NUM_USU := StrToInt(qR6.FieldByName('N_Usuario').AsString);
        COO := qR6.FieldByName('COO').AsInteger; // GerarDados('I',3);
        GNF := qR6.FieldByName('GNF').AsInteger;
        if (qR6.FieldByName('GRG').AsString = '') then
          GRG:= 0
        else
          GRG := qR6.FieldByName('GRG').AsInteger;

        if (qR6.FieldByName('CDC').AsString = '') then
          CDC:= 0
        else
          CDC := qR6.FieldByName('CDC').AsInteger;

          if (MD5R6 <> qR6.FieldByName('MD5').AsString) then
          begin
            verificaModeloECF:= true;
          end;

          TLog.Debug('MD5 R06 Gerado Agora: '+MD5R6);
          TLog.Debug('MD5 R06 Consultado na qR6: '+qR6.fieldbyname('MD5').asstring);

        DENOM := qR6.FieldByName('Denominacao').AsString;
        DT_FIN := StrToDateTime(data_final_emissao);
        HR_FIN := StrToDateTime(Retorna_Hora_Formatada(qR6.FieldByName('Hora_Final_Emissao').AsString));

        Carrega_Dados_R07('qR6', datai, dataf);
        if (C6 = 0) then
        begin
          while not qR7.Eof do
          begin

            MD5R7 := GeraMD5([qR7.FieldByName('N_Fabricacao').asstring
                                  , qR7.FieldByName('COO').asstring
                                  , qR7.FieldByName('GNF').asstring
                                  ]);
            with RegistroR07.New do
            begin
              if (MD5R7 <> qR7.FieldByName('MD5').AsString) then
              begin
                verificaModeloECF:= true;
              end;

              TLog.Debug('MD5 R07 Gerado Agora: '+MD5R7);
              TLog.Debug('MD5 R07 Consultado na qR7: '+qR7.fieldbyname('MD5').asstring);

              COO := qR7.FieldByName('CCF').AsInteger;
              if (qR7.FieldByName('CCF').AsString = '') then
                CCF:= 0
              else
                CCF := qR7.FieldByName('CCF').AsInteger;

              // GerarDados('I',3); //Pega do R04
              MP := qR7.FieldByName('Meio_Pagamento').AsString;
              // + GerarDados('S', 6);
              VL_PAGTO := qR7.FieldByName('Valor_Pago').AsFloat;
              IND_EST := AnsiToUtf8(qR7.FieldByName('Estorno').AsString);
              VL_EST := qR7.FieldByName('Valor_Estorno').AsFloat;

            end;
            qR7.Next;
          end;
          Inc(C6);
        end;
      end;

      qR6.Next;
    end;


    if verificaModeloECF then
    begin
      MODELO_ECF := Retorna_Interrogacao_Espaco_Branco(sModelo, 20);
    end
    else
    begin
      MODELO_ECF := sModelo;
    end;
  end;

  verificaModeloECF:= false;
  serie:= Copy(nu_serie,7,14);
  dataformatada:= FormatDateTime('DDMMYYYY', StrToDateTime(dataf));
  NomeArquivo := Local_Arquivo(14) + CIECF + serie + dataformatada + '.txt';

  SetLength(EAD, 256);
  dm.ACBrPAF1.SaveToFile_RegistrosPAF(NomeArquivo);
  generateEAD(NomeArquivo, cChavePublica, cChavePrivada, EAD, 1);

  Processo_Concluido;
end;

function Verifica_Gerenciador_Padrao_Ativo: boolean;
begin
  gerenciador := false;
  while not gerenciador do
  begin
    if not VerificaGerenciadorPadrao then
    begin
      gerenciador := false;
      Result := false;
      shellexecute(0, 'open', (Pchar(gerenciadorPadrao)), '', nil,
        SW_SHOWNORMAL);
      Sleep(1000);
      application.CreateForm(TFrmMensagem_Erro_Gerenciador_TEF,
        FrmMensagem_Erro_Gerenciador_TEF);
      FrmMensagem_Erro_Gerenciador_TEF.ShowModal;
      FrmMensagem_Erro_Gerenciador_TEF.Free;
    end
    else
    begin
      Result := true;
      gerenciador := true;
    end;
  end;
end;

procedure Foco_Aplicacao;
begin
  // ShowMessage('foco');
  hwnd := GetActiveWindow;
  if hwnd <> 0 then
  begin
    SetForegroundWindow(hwnd);
    // Application.Restore;
  end;
  { if (FrmFechamento_Venda_PDV <> nil) then
    FrmFechamento_Venda_PDV.LblHnde.Caption:= IntToStr(Hwnd); }
end;

Function VersaoExe: String;
type
  PFFI = ^vs_FixedFileInfo;
var
  F: PFFI;
  Handle: Dword;
  Len: Longint;
  Data: Pchar;
  Buffer: Pointer;
  Tamanho: Dword;
  Parquivo: Pchar;
  Arquivo: String;
begin
  Arquivo := application.ExeName;
  Parquivo := StrAlloc(Length(Arquivo) + 1);
  StrPcopy(Parquivo, Arquivo);
  Len := GetFileVersionInfoSize(Parquivo, Handle);
  Result := '';
  if Len > 0 then
  begin
    Data := StrAlloc(Len + 1);
    if GetFileVersionInfo(Parquivo, Handle, Len, Data) then
    begin
      VerQueryValue(Data, '\', Buffer, Tamanho);
      F := PFFI(Buffer);
      Result := Format('%d.%d.%d.%d', [HiWord(F^.dwFileVersionMs),
        LoWord(F^.dwFileVersionMs), HiWord(F^.dwFileVersionLs),
        LoWord(F^.dwFileVersionLs)]);
    end;
    StrDispose(Data);
  end;
  StrDispose(Parquivo);
end;

function Conecta_Balanca(Balanca: TACBrBal): boolean;
var
  iConta: Integer;
begin
  try
    if Balanca.Ativo then
      Balanca.Desativar;

    // configura porta de comunicação
    Balanca.Modelo := TACBrBALModelo(Balanca_Modelo);
    Balanca.Device.HandShake := TACBrHandShake(Balanca_Hand);
    Balanca.Device.Parity := TACBrSerialParity(Balanca_Parity);
    Balanca.Device.Stop := TACBrSerialStop(Balanca_StopBits);
    Balanca.Device.Data := Balanca_DataBits;
    Balanca.Device.Baud := Balanca_BaudRate;
    Balanca.Device.Porta := Balanca_Porta;

    // Conecta com a balança
    Balanca.Ativar;
    Result := true;
    TLog.Debug('Balança Conectada!');
  except
    on E: Exception do
    begin
      TLog.Error('Erro ao ativar balança: ' + E.Message);
      application.MessageBox(Pchar('Erro ao ativar balança: ' + E.Message),
        'Erro ao tentar ativar balança', MB_OK + MB_ICONHAND);
      Result := false;
    end;
  end;

  { Porta := 'COM1';
    for iConta := 1 to 6 do
    begin
    Peso := Peso + ' ';
    preco := preco + ' ';
    total_peso := total_peso + ' ';
    end;
    //dm.ACBrBAL1.
    iRetorno := Bematech_FI_BaudRateBalanca(9600);
    iRetorno := Bematech_FI_InfoBalanca(pAnsiChar(Porta), 4, Peso, preco,
    total_peso); }

end;

function Verifica_Status_Rede(IP: AnsiString): boolean;
var
  ABuffer: AnsiString;
begin

  DM.IdICMPClient1.Host := IP;
  ABuffer := IP + StringOfChar(' ', 255);
  DM.IdICMPClient1.ReceiveTimeout := 1000;
  DM.IdIcmpClient1.PacketSize:= 32;

  try
    DM.IdICMPClient1.Ping(ABuffer);
    if (DM.IdICMPClient1.ReplyStatus.ReplyStatusType = rsEcho) then
      Result := true
    else
      Result := false;
  except
    Result := false;
  end;
end;

procedure Insere_Tratamento_ICMS;
var
  qAux2: TADOQuery;
  serv: AnsiString;
begin
  if (eservidor = '1') then
    serv := servidor + '.' + Banco
  else
    serv := Banco;

  try
    qAux2 := TADOQuery.Create(nil);
    with qAux2, SQL do
    begin
      close;
      Connection := DM.ADOConnectionLocal;
      clear;
      add('Delete from Itens_Tratamento_ICMS');
      ExecSQL;
    end;

    with qAux2, SQL do
    begin
      close;
      Connection := DM.ADOConnectionLocal;
      clear;
      add('Insert into Itens_Tratamento_ICMS select * from ' + serv +
        '.dbo.Itens_Tratamento_ICMS T');
      add('where T.Codigo not in(select Itens_Tratamento_ICMS.Codigo from Itens_Tratamento_ICMS)');
      ExecSQL;
    end;

  finally
    FreeAndNil(qAux2);
  end;
end;

procedure Inicializa_Variaveis_TEF;
begin
  pIdentifica := '';
  pNomeRede := '';
  pData := '';
  pHora := '';
  pTransacao := '';
  pNumeroCupom := '';
  pOperacao := '';
  pFinalizacao := '';
  pTransacao := '';
  pValor := '';
  pNSU := '';
end;

procedure Pega_INI_Conexao;
var
  ArqIni: TIniFile;
  Usuario, base, servidor: String;
begin
  try
    ArqIni := TIniFile.Create(ExtractFilePath(application.ExeName) +
      'Conexao.ini');
    Usuario := ArqIni.ReadString('conecta', 'usuario', '');
    base := ArqIni.ReadString('conecta', 'base', '');
    servidor := ArqIni.ReadString('conecta', 'servidor', '');
    caminho_servidor := ArqIni.ReadString('conecta', 'caminho', '');
  finally
    ArqIni.Free;
  end;
end;

procedure Pega_INI_Balanca;
var
  ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create(ExtractFilePath(application.ExeName) +
    'Balanca.ini');

  if (ArqIni.ReadString('Balanca', 'Modelo', '') = '') then
    Balanca_Modelo := 0
  else if (ArqIni.ReadString('Balanca', 'Modelo', '') = 'Filizola') then
    Balanca_Modelo := 1
  else if (ArqIni.ReadString('Balanca', 'Modelo', '') = 'Toledo') then
    Balanca_Modelo := 2
  else if (ArqIni.ReadString('Balanca', 'Modelo', '') = 'Toledo2180') then
    Balanca_Modelo := 3
  else if (ArqIni.ReadString('Balanca', 'Modelo', '') = 'Urano') then
    Balanca_Modelo := 4
  else if (ArqIni.ReadString('Balanca', 'Modelo', '') = 'LucasTec') then
    Balanca_Modelo := 5
  else if (ArqIni.ReadString('Balanca', 'Modelo', '') = 'Magna') then
    Balanca_Modelo := 6
  else if (ArqIni.ReadString('Balanca', 'Modelo', '') = 'Digitron') then
    Balanca_Modelo := 7
  else if (ArqIni.ReadString('Balanca', 'Modelo', '') = 'Magellan') then
    Balanca_Modelo := 8
  else if (ArqIni.ReadString('Balanca', 'Modelo', '') = 'UranoPOP') then
    Balanca_Modelo := 9
  else if (ArqIni.ReadString('Balanca', 'Modelo', '') = 'Lider') then
    Balanca_Modelo := 10;

  Balanca_Porta := ArqIni.ReadString('Balanca', 'Porta', '');
  Balanca_BaudRate := StrToInt(ArqIni.ReadString('Balanca', 'BaudRate', ''));
  Balanca_DataBits := StrToInt(ArqIni.ReadString('Balanca', 'DataBits', ''));

  if (ArqIni.ReadString('Balanca', 'Parity', '') = 'none') then
    Balanca_Parity := 0
  else if (ArqIni.ReadString('Balanca', 'Parity', '') = 'odd') then
    Balanca_Parity := 1
  else if (ArqIni.ReadString('Balanca', 'Parity', '') = 'even') then
    Balanca_Parity := 2
  else if (ArqIni.ReadString('Balanca', 'Parity', '') = 'mark') then
    Balanca_Parity := 3
  else if (ArqIni.ReadString('Balanca', 'Parity', '') = 'space') then
    Balanca_Parity := 4;

  if (ArqIni.ReadString('Balanca', 'StopBits', '') = 's1') then
    Balanca_StopBits := 0
  else if (ArqIni.ReadString('Balanca', 'StopBits', '') = 's1,5') then
    Balanca_StopBits := 1
  else if (ArqIni.ReadString('Balanca', 'StopBits', '') = 's2') then
    Balanca_StopBits := 2;

  if (ArqIni.ReadString('Balanca', 'Hand', '') = 'Nenhum') then
    Balanca_Hand := 0
  else if (ArqIni.ReadString('Balanca', 'Hand', '') = 'XON/XOFF') then
    Balanca_Hand := 1
  else if (ArqIni.ReadString('Balanca', 'Hand', '') = 'RTS/CTS') then
    Balanca_Hand := 2
  else if (ArqIni.ReadString('Balanca', 'Hand', '') = 'DTR/DSR') then
    Balanca_Hand := 3;

  Balanca_TimeOut := StrToInt(ArqIni.ReadString('Balanca', 'TimeOut', ''));
end;

procedure ForceForegroundWindow(hwnd: THandle);
// (W) 2001 Daniel Rolf
// http://www.finecode.de
// rolf@finecode.de
var
  hlp: TForm;
begin
  hlp := TForm.Create(nil);
  try
    hlp.BorderStyle := bsNone;
    hlp.SetBounds(0, 0, 1, 1);
    hlp.FormStyle := fsStayOnTop;
    hlp.Show;
    mouse_event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
    mouse_event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
    SetForegroundWindow(hwnd);
  finally
    hlp.Free;
  end;
end;

function Verifica_Atualizacao_Sistema(pathatua: String): boolean;
var
  data_serv, data_local, path_local, arq_servidor: AnsiString;
  tempFile, NomeExe, batchName, NomeDos: AnsiString;
  lista: TStringlist;
  existe: boolean;
begin
  Result := false;
  // lista := TStringList.Create;
  path_local := ExtractFilePath(application.ExeName) +
    ExtractFileName(application.ExeName);

  if not DirectoryExists(pathatua) then
  begin
    application.MessageBox(Pchar('A pasta de atualização não existe!!!' + #13 +
      pathatua), 'Pasta de Atualização', MB_ICONERROR + MB_OK);
    exit;
  end;

  arq_servidor := pathatua + ExtractFileName(application.ExeName);
  if not FileExists(arq_servidor) then
  begin
    application.MessageBox(Pchar('Não há arquivo na pasta de atualização!!!'),
      'Arquivo de Atualização', MB_ICONERROR + MB_OK);
    exit;
  end;

  data_serv := FormatDateTime('dd/mm/yyyy HH:mm',
    FileDateToDateTime(FileAge(arq_servidor)));
  data_local := FormatDateTime('dd/mm/yyyy HH:mm',
    FileDateToDateTime(FileAge(path_local)));

  if StrToDateTime(data_serv) > StrToDateTime(data_local) then
  begin
    Result := true;
    application.MessageBox
      ('Uma versão do sistema foi detectada. O sistema será finalizado para a atualização.',
      'Nova versão', MB_OK + MB_ICONQUESTION);
    application.Terminate;
    shellexecute(0, 'open', PWideChar(Local_Arquivo(14) + 'Atualiza.exe'), nil,
      nil, SW_NORMAL);
  end;
end;

function GetTmpFileName(ext: AnsiString): AnsiString;
var
  pc: PWideChar;
begin
  pc := StrAlloc(MAX_PATH + 1);
  GetTempFileName(PWideChar(GetTmpDir), 'EZC', 0, pc);
  Result := AnsiString(pc);
  Result := ChangeFileExt(Result, ext);
  StrDispose(pc);
end;

function GetTmpDir: AnsiString; // Get the windows temporary directory
var
  pc: PWideChar;
begin
  pc := StrAlloc(MAX_PATH + 1);
  GetTempPath(MAX_PATH, pc);
  Result := AnsiString(pc);
  StrDispose(pc);
end;

procedure Verifica_Erros_Ao_Gerar_Cupom;
begin
  if (Carrega_Tipo_Local = 0) then
  begin
    if (Houve_Reducao = false) then
    begin
      //arquivos paf
      Verifica_Arquivos_PAF;
      if (Habilitado = false) then
      begin
        FrmMenu_Geral.acLancamento_Manual.Enabled:= true;
        abort;
      end
      else
        FrmMenu_Geral.acLancamento_Manual.Enabled:= false;


      //impressora desligada, sem papel, sem comunicação e etc
      Verifica_Permissao_Impressora;
      if (Habilitado = false) then
      begin
        FrmMenu_Geral.acLancamento_Manual.Enabled:= true;
        abort;
      end
      else
        FrmMenu_Geral.acLancamento_Manual.Enabled:= false;


      //verifica GT
      if (ValidaGT = true) then
      begin
        Habilitado := true;
        FrmMenu_Geral.acLancamento_Manual.Enabled:= false;
      end
      else
      begin
        Habilitado := false;
        FrmMenu_Geral.acLancamento_Manual.Enabled:= true;

        abort;
      end;

      //verifica SN
      if (ValidaSN = true) then
      begin
        Habilitado := true;
        FrmMenu_Geral.acLancamento_Manual.Enabled:= false;
      end
      else
      begin
        Habilitado := false;
        FrmMenu_Geral.acLancamento_Manual.Enabled:= true;
        abort;
      end;
    end;
  end;
end;

function ValidaGT: Boolean;
var
  arquivo: TStringList;
  i, iConta, iaux: integer;
  letra, GrandeTotalCrip, Grande, msg1, msg2: Ansistring;
  achou_gt: boolean;
begin
  arquivo := TStringList.Create;
  achou_gt:= false;
  TLog.Info('--- MÉTODO ValidaGT ---');
  //for iConta := 1 to 18 do
    //GrandeTotal := GrandeTotal + ' ';
  i := 0;
  try
    arquivo.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Config.txt');
    for i := 0 to arquivo.Count - 1 do
    begin
      letra := Copy((arquivo[i]), 1, 5);
      if letra = 'GT - ' then // GT
      begin
        try
          achou_gt:= true;
          GrandeTotalCrip := Copy((arquivo[i]), 6, 18);
          //Bematech_FI_GrandeTotal(GrandeTotal);
          ECF.Pega_Grande_Total;
          Grande := (Criptografa(GrandeTotal,15));
        finally
          TLog.Debug('GrandeTotalCrip: '+GrandeTotalCrip);
          TLog.Debug('Grande: '+Grande);
          if (GrandeTotalCrip = Grande) then
          begin
            ValidaGT := true;
            iaux:= 0;
          end
          else
          begin
            inc(iaux);
            ValidaGT := false;
            if (iaux = 1) then
              Mensagem_Erro_Entrada('Grande Total do ECF foi alterado ou removido');
          end;
        end;
        break;
      end;
    end;
    TLog.Info('--- FIM MÉTODO ValidaGT ---');
  finally
    if (achou_gt = false) then
    begin
      ValidaGT := false;
      Mensagem_Erro_Entrada('arquivo de configuração do ECF foi alterado parcialmente OU não está devidamente configurado');
    end;
    FreeAndNil(arquivo);
  end;
end;

function ValidaSN: Boolean;
var
  arquivo: TStringList;
  i, iConta, iaux2: integer;
  letra, NumeroCrip, Numero, NumeroSerie: Ansistring;
  achou_sn: boolean;
begin
  arquivo := TStringList.Create;
  achou_sn:= false;
  for iConta := 1 to 20 do
    NumeroSerie := NumeroSerie + ' ';
  i := 0;
  try
    arquivo.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Config.txt');
    for i := 0 to arquivo.Count - 1 do
    begin
      letra := Copy((arquivo[i]), 1, 7);
      if letra = 'ECF1 - ' then // número de serie (sempre por em primeiro lugar o que está ligado no pc)
      begin
        try
          achou_sn:= true;
          NumeroCrip := Copy((arquivo[i]), 8, 20);
          //Bematech_FI_NumeroSerieMFD(NumeroSerie);
          NumeroSerie := dm.ACBrECF1.NumSerie;
          Numero := (Criptografa(NumeroSerie,15));
          //Edit1.Text:= numero;
        finally
          if (NumeroCrip = Numero) then
          begin
            ValidaSN := true;
            iaux2:= 0;
          end
          else
          begin
            inc(iaux2);
            ValidaSN := false;
            if (iaux2 = 1) then
              Mensagem_Erro_Entrada('Número de Serie do ECF foi alterado ou removido');
          end;
        end;
        break;
      end;
    end;
  finally
    if (achou_sn = false) then
    begin
      ValidaSN := false;
      Mensagem_Erro_Entrada('arquivo de configuração do ECF foi alterado parcialmente OU não está devidamente configurado');
    end;

    FreeAndNil(arquivo);
  end;
end;

procedure Verifica_Arquivos_PAF;
var
  Arquivo: TStringlist;
begin
  /// verificar se os arquivos existem
  if not(FileExists(Local_Arquivo(14) + 'Config.txt')) then
  begin
    Inc(iauxpaf);

    if (iauxpaf = 1) then
      Mensagem_Erro_Entrada
        ('arquivo de configuração do ECF não foi encontrado');
    Habilitado := false;
    exit;
  end
  else
    Habilitado := true;

  if not(FileExists(Local_Arquivo(14) + 'ConfigBackup.txt')) then
  begin
    Inc(iauxpaf);

    if (iauxpaf = 1) then
      Mensagem_Erro_Entrada
        ('arquivo de backup de configuração do ECF não foi encontrado');
    Habilitado := false;
    exit;
  end
  else
    Habilitado := true;

  if not(FileExists(Local_Arquivo(14) + 'Software House.txt')) then
  begin
    Inc(iauxpaf);

    if (iauxpaf = 1) then
      Mensagem_Erro_Entrada
        ('arquivo de identificação da FAV não foi encontrado');
    Habilitado := false;
    exit;
  end
  else
    Habilitado := true;

  if not(FileExists(Local_Arquivo(14) + 'ArqMD5.txt')) then
  begin
    Inc(iauxpaf);

    if (iauxpaf = 1) then
      Mensagem_Erro_Entrada('arquivo ArqMD5 não foi encontrado');
    Habilitado := false;
    exit;
  end
  else
    Habilitado := true;

  { if not(FileExists(Local_Arquivo(14) + 'Configura_Estacao.ini')) then
    begin
    inc(iauxpaf);

    if (iauxpaf = 1) then
    Mensagem_Erro_Entrada(
    'arquivo de configuração do local não foi encontrado');
    Habilitado := false;
    exit;
    end
    else
    Habilitado := true; }

  if not FileExists(Local_Arquivo(14) + 'Conexao.ini') then
  begin
    Inc(iauxpaf);

    if (iauxpaf = 1) then
      Mensagem_Erro_Entrada
        ('arquivo de configuração do banco de dados não foi encontrado');
    Habilitado := false;
    exit;
  end
  else
    Habilitado := true;

  /// verifica se os arquivos estão vazios
  { try
    Arquivo := TStringList.Create;
    Arquivo.LoadFromFile(Local_Arquivo(14) + 'Config.txt');
    if (Arquivo.count = 0) then
    begin
    inc(iauxpaf);

    if (iauxpaf = 1) then
    Mensagem_Erro_Entrada('arquivo de configuração do ECF está vazio');
    Habilitado := false;
    exit;
    end
    else
    Habilitado := true;
    finally
    FreeAndNil(Arquivo);
    end;

    try
    Arquivo := TStringList.Create;
    Arquivo.LoadFromFile(Local_Arquivo(14) + 'Software House.txt');
    if (Arquivo.count = 0) then
    begin
    inc(iauxpaf);

    if (iauxpaf = 1) then
    Mensagem_Erro_Entrada('arquivo de identificação da FAV está vazio');
    Habilitado := false;
    exit;
    end
    else
    Habilitado := true;
    finally
    FreeAndNil(Arquivo);
    end;

    try
    Arquivo := TStringList.Create;
    Arquivo.LoadFromFile(Local_Arquivo(14) + 'Configura_Estacao.ini');
    if (Arquivo.count = 0) then
    begin
    inc(iauxpaf);

    if (iauxpaf = 1) then
    Mensagem_Erro_Entrada('arquivo de configuração do local está vazio');
    Habilitado := false;
    exit;
    end
    else
    Habilitado := true;
    finally
    FreeAndNil(Arquivo);
    end;

    try
    Arquivo := TStringList.Create;
    Arquivo.LoadFromFile(Local_Arquivo(14) + 'Conexao.ini');
    if (Arquivo.count = 0) then
    begin
    inc(iauxpaf);

    if (iauxpaf = 1) then
    Mensagem_Erro_Entrada(
    'arquivo de configuração do banco de dados está vazio');
    Habilitado := false;
    exit;
    end
    else
    Habilitado := true;
    finally
    FreeAndNil(Arquivo);
    end;

    if Habilitado = true then
    iauxpaf := 0; }

end;

function Calcula_Valor_Porcentagem(Desconto: Double;
  Valor_Produto: Double): Double;
begin
  try
    Desconto := Desconto / Valor_Produto;
  finally
    Result := Desconto * 100;
  end;
end;

procedure Bloqueia_Funcoes;
begin
  if (gera_pre_venda = '0101') then
  begin
    FrmMenu_Geral.acRecebimento_Caixa.Enabled := true;
  end
  else
  begin
    FrmMenu_Geral.acRecebimento_Caixa.Enabled := false;
  end;

  if (gera_nfe = '0101'  ) then
  begin
    FrmMenu_Geral.acNFE.Enabled := true;
    {TODO -oOwner -cGeneral : VER QUESTAO DO PERFIL}
  end
  else
  begin
    FrmMenu_Geral.acNFE.Enabled := false;
  end;

  if (gera_os = '0101') then
  begin
    // FrmMenu_Geral.acOrdem_Servico.Enabled := true;
    // FrmMenu_Geral.acDAV_Emitidos.Enabled := true;
  end
  else
  begin
    // FrmMenu_Geral.acOrdem_Servico.Enabled := false;
    // FrmMenu_Geral.acDAV_Emitidos.Enabled := false;
  end;

  if ((gera_dav = '0101') or (gera_pre_venda = '0101') or (gera_nfe = '0101') or
    (gera_os = '0101')) then
  begin
    FrmMenu_Geral.acVenda_Orcamento.Enabled := true;
    FrmMenu_Geral.acReimpressao_DAV.Enabled := true;
    FrmMenu_Geral.acRecebimento_Caixa.Enabled := true;
    // FrmMenu_Geral.acDAV_Emitidos.Enabled := true;
  end
  else if ((gera_dav = '0202') and (gera_pre_venda = '0202') and
    (gera_nfe = '0202') and (gera_os = '0202')) then
  begin
    FrmMenu_Geral.acVenda_Orcamento.Enabled := false;
    FrmMenu_Geral.acReimpressao_DAV.Enabled := false;
    FrmMenu_Geral.acRecebimento_Caixa.Enabled := false;
    // FrmMenu_Geral.acDAV_Emitidos.Enabled := false;
  end;

  if (Habilitado = false) then
    FrmMenu_Geral.acLancamento_Manual.Enabled := true
  else
    FrmMenu_Geral.acLancamento_Manual.Enabled := false;
end;

procedure Atualiza_Saldo_Bancario(Codigo: Integer; Saldo: Double);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update Conta_Corrente set Saldo_Atual = :Saldo_Atual ');

      add('where Codigo = :Codigo');

      Parameters.ParamByName('Saldo_Atual').Value := Saldo;
      Parameters.ParamByName('Codigo').Value := Codigo;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Deleta_Lancamento_Bancario(N_Documento: Integer);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('delete from Lancamento_Bancario ');

      add('where N_Documento = :N_Documento');

      Parameters.ParamByName('N_Documento').Value := N_Documento;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Atualiza_Conta(Codigo, Parcela: Integer;
  Data_Pagamento, Status, Codigo_Conta, Codigo_Cheque: AnsiString;
  Valor_Pagar, Desconto, Acrescimo, Valor_Restante, Valor_Pago: Double;
  Codigo_Forma_Pagamento: Integer);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update Parcelas_Lancamentos set Status = :Status, ');
      add('Data_Pagamento = :Data_Pagamento, ');
      add('Codigo_Conta = :Codigo_Conta,');
      add('Codigo_Cheque = :Codigo_Cheque,');
      add('Valor_Pagar = :Valor_Pagar,');
      add('Codigo_Forma_Pagamento_Parcela = :Codigo_Forma_Pagamento_Parcela,');
      add('Valor_Restante = :Valor_Restante,');
      add('Desconto = :Desconto,');
      add('Acrescimo = :Acrescimo,');
      add('Valor_Pago = :Valor_Pago');

      add('where Codigo = :Codigo and Parcela = :Parcela');

      Parameters.ParamByName('Status').Value := Status;

      if (Data_Pagamento = '') then
        Parameters.ParamByName('Data_Pagamento').Value := NULL
      else
        Parameters.ParamByName('Data_Pagamento').Value :=
          StrToDateTime(Data_Pagamento);

      if (Codigo_Conta = '') then
        Parameters.ParamByName('Codigo_Conta').Value := 0
      else
        Parameters.ParamByName('Codigo_Conta').Value := StrToInt(Codigo_Conta);

      if (Codigo_Cheque = '') then
        Parameters.ParamByName('Codigo_Cheque').Value := 0
      else
        Parameters.ParamByName('Codigo_Cheque').Value :=
          StrToInt(Codigo_Cheque);

      Parameters.ParamByName('Codigo').Value := Codigo;
      Parameters.ParamByName('Parcela').Value := Parcela;
      Parameters.ParamByName('Valor_Pagar').Value := Valor_Pagar;
      Parameters.ParamByName('Codigo_Forma_Pagamento_Parcela').Value :=
        Codigo_Forma_Pagamento;
      Parameters.ParamByName('Valor_Restante').Value := Valor_Restante;
      Parameters.ParamByName('Desconto').Value := Desconto;
      Parameters.ParamByName('Acrescimo').Value := Acrescimo;
      Parameters.ParamByName('Valor_Pago').Value := Valor_Pago;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Atualiza_Cheque(Data, Status: AnsiString; N_Cheque: Integer);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update Cheque set Data_Saida = :Data_Saida, Status = :Status');
      add('where Codigo = :Numero');
      // Parameters.ParamByName('Enviado').Value:= EdtEnviado_A.Text;

      if (Data = '') then
        Parameters.ParamByName('Data_Saida').Value := NULL
      else
        Parameters.ParamByName('Data_Saida').Value := StrToDateTime(Data);

      Parameters.ParamByName('Status').Value := Status;
      Parameters.ParamByName('Numero').Value := N_Cheque;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Procura_Parcelas_Vencida;
var
  qAux: TADOQuery;
  Taxa, valaux, Valor: Double;
  valor_parcela: AnsiString;
  dias_venc: Integer;
begin
  qAux := TADOQuery.Create(nil);
  Taxa := 0;
  valaux := 0;

  with qAux, SQL do
  begin
    close;
    Connection := DM.ADOConnection1;
    clear;
    add('select PL.Codigo, PL.Parcela, PL.Valor, PL.Data_Vencimento, CP.Taxa, CP.Tipo_Juro from Parcelas_Lancamentos PL');
    add('left join Lancamento_Financeiro LF on (PL.Codigo = LF.Codigo)');
    add('left join Condicao_Pagamento CP on (LF.Codigo_Forma_Pagamento = CP.Codigo)');
    add('where LF.Tipo = ' + QuotedStr('RECEBER') +
      ' and PL.Data_Vencimento < :Data1 and PL.Status = ' +
      QuotedStr('PENDENTE') +
      ' and ( PL.Data_Atualizacao <> :Data2 or PL.Data_Atualizacao is null )');
    Parameters.ParamByName('Data1').Value := date;
    Parameters.ParamByName('Data2').Value := date;
    open;

    if (qAux.IsEmpty = false) then
    begin

      qAux.First;
      while not qAux.Eof do
      begin
        Taxa := (qAux.FieldByName('Taxa').AsFloat / 100);
        Valor := Calcula_Valor(qAux.FieldByName('Valor').AsString);
        dias_venc := DaysBetween(date, qAux.FieldByName('Data_Vencimento')
          .AsDateTime);

        if (qAux.FieldByName('Tipo_Juro').AsString = 'C') then
        begin
          valaux := (Retorna_Juro_Composto(Valor, Taxa, 1)) / 30;
        end
        else
        begin
          valaux := (Valor * Taxa) / 30;
        end;

        valor_parcela := FormatFloat('#0.0,0', Valor + (valaux * dias_venc));
        valor_parcela := StringReplace(valor_parcela, ThousandSeparator, '',
          [rfReplaceAll]);

        Atualiza_Parcelas_Vencida(StrToFloat(valor_parcela),
          qAux.FieldByName('Codigo').AsInteger, qAux.FieldByName('Parcela')
          .AsInteger, date);
        qAux.Next;
      end;
    end;

  end;
end;

procedure Atualiza_Parcelas_Vencida(Valor: Double; Codigo, Parcela: Integer;
  Data: TDate);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update Parcelas_Lancamentos set Data_Atualizacao = :Data_Atualizacao, Valor_Pagar = :Valor_Pagar');
      add('where Codigo = :Codigo and Parcela = :Parcela');
      Parameters.ParamByName('Data_Atualizacao').Value := Data;
      Parameters.ParamByName('Valor_Pagar').Value := Valor;
      Parameters.ParamByName('Codigo').Value := Codigo;
      Parameters.ParamByName('Parcela').Value := Parcela;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Atualiza_Orcamento_Vencido;
var
  qAuxPedido, qAuxPreco, qAuxItens: TADOQuery;
  Itens_Pedido: URegistro.TItens_Pedido;
  Pedido: URegistro.TPedido;
  preco, sub_total: Double;
begin
  qAuxPedido := TADOQuery.Create(nil);
  qAuxPreco := TADOQuery.Create(nil);
  qAuxItens := TADOQuery.Create(nil);
  try
    with qAuxPedido, SQL do
    begin
      close; // pegando os pedidos pendentes
      Connection := DM.ADOConnection1;
      clear;
      add('select P.* from Pedido P');
      add('where P.Codigo_Empresa = :Empresa and P.Data_Vencimento < GETDATE() and P.Status = :Status and P.Tipo = :Tipo');
      add('and P.Atualizou_Orcamento_Vencido = :At');
      Parameters.ParamByName('Empresa').Value := UDeclaracao.Codigo_Empresa;
      Parameters.ParamByName('Status').Value := 'PENDENTE';
      Parameters.ParamByName('Tipo').Value := 'DAV';
      Parameters.ParamByName('At').Value := '0';
      open;
      First;
    end;

    if (qAuxPedido.IsEmpty = false) then
    begin

      while not qAuxPedido.Eof do // percorre todos os pedidos encontrados
      begin
        sub_total := 0;

        with qAuxItens, SQL do
        begin
          close;
          Connection := DM.ADOConnection1;
          clear;
          add('select IP.* from Itens_Pedido IP');
          // pega os itens do pedido atual
          add('where IP.Codigo = :Codigo');
          Parameters.ParamByName('Codigo').Value :=
            qAuxPedido.FieldByName('Codigo').AsInteger;
          open;
          First;
        end;

        while not qAuxItens.Eof do
        begin
          // percorre todos os itens
          with qAuxPreco, SQL do
          begin
            close;
            Connection := DM.ADOConnection1;
            clear; // pega os preços atuais na tabela de preço
            add('select ITP.Codigo, ITP.Codigo_Produto, ITP.Preco_Vista from Itens_Tabela_Preco ITP');
            add('where ITP.Codigo = :Codigo and ITP.Codigo_Produto = :Codigo_Produto');
            Parameters.ParamByName('Codigo').Value :=
              codigo_tabela_preco_padrao;
            Parameters.ParamByName('Codigo_Produto').Value :=
              qAuxItens.FieldByName('Codigo_Produto').AsInteger;
            open;

            preco := FieldByName('Preco_Vista').AsFloat;
          end;

          Itens_Pedido.Salva_Banco(DM.ADOConnection1, 'S', 'A',
            qAuxItens.FieldByName('Codigo').AsInteger,
            qAuxItens.FieldByName('N_Item').AsString,
            qAuxItens.FieldByName('Codigo_Produto').AsInteger,
            qAuxItens.FieldByName('Codigo_Venda').AsString,
            qAuxItens.FieldByName('Descricao').AsString,
            qAuxItens.FieldByName('NCM').AsString,
            qAuxItens.FieldByName('Origem').AsString,
            qAuxItens.FieldByName('CFOP').AsString, qAuxItens.FieldByName('UN')
            .AsString, qAuxItens.FieldByName('Tipo_Calculo_BC_ICMS').AsString,
            qAuxItens.FieldByName('Tipo_Recolhimento').AsString,
            qAuxItens.FieldByName('ICMS').AsString, qAuxItens.FieldByName('CST')
            .AsString, qAuxItens.FieldByName('CSOSN').AsString,
            qAuxItens.FieldByName('Base_Reduzida').AsString,
            qAuxItens.FieldByName('BC').AsString,
            qAuxItens.FieldByName('Valor_ICMS').AsString,
            qAuxItens.FieldByName('Tipo_Calculo_BC_ICMS_ST').AsString,
            qAuxItens.FieldByName('MVAST').AsString,
            qAuxItens.FieldByName('ICMS_ST').AsString,
            qAuxItens.FieldByName('CST_ST').AsString,
            qAuxItens.FieldByName('Base_Reduzida_ST').AsString,
            qAuxItens.FieldByName('Base_Acrescida_ST').AsString,
            qAuxItens.FieldByName('BC_ST').AsString,
            qAuxItens.FieldByName('Valor_ICMS_ST').AsFloat,
            qAuxItens.FieldByName('Aliquota_Calculo_Credito').AsString,
            qAuxItens.FieldByName('Credito_ICMS').AsString,
            qAuxItens.FieldByName('Tipo_Calculo_IPI').AsString,
            qAuxItens.FieldByName('IPI').AsString,
            qAuxItens.FieldByName('CST_IPI').AsString,
            qAuxItens.FieldByName('Base_Reduzida_IPI').AsString,
            qAuxItens.FieldByName('Base_Acrescida_IPI').AsString,
            qAuxItens.FieldByName('BC_IPI').AsString,
            qAuxItens.FieldByName('Valor_IPI').AsFloat,
            qAuxItens.FieldByName('Tipo_Calculo_PIS').AsString,
            qAuxItens.FieldByName('PIS').AsString,
            qAuxItens.FieldByName('CST_PIS').AsString,
            qAuxItens.FieldByName('Base_Reduzida_PIS').AsString,
            qAuxItens.FieldByName('Base_Acrescida_PIS').AsString,
            qAuxItens.FieldByName('BC_PIS').AsString,
            qAuxItens.FieldByName('Valor_PIS').AsFloat,
            qAuxItens.FieldByName('Tipo_Calculo_COFINS').AsString,
            qAuxItens.FieldByName('COFINS').AsString,
            qAuxItens.FieldByName('CST_COFINS').AsString,
            qAuxItens.FieldByName('Base_Reduzida_COFINS').AsString,
            qAuxItens.FieldByName('Base_Acrescida_COFINS').AsString,
            qAuxItens.FieldByName('BC_COFINS').AsString,
            qAuxItens.FieldByName('Valor_COFINS').AsFloat,
            qAuxItens.FieldByName('Qtde').AsFloat,
            qAuxItens.FieldByName('Qtde_Entregue').AsFloat,
            qAuxItens.FieldByName('Qtde_Restante').AsFloat,
            qAuxItens.FieldByName('Qtde_S_Previsao').AsFloat,
            qAuxItens.FieldByName('Valor_Compra').AsFloat, preco, preco, 0, 0,
            '$', 'D', qAuxItens.FieldByName('Valor_Frete').AsFloat,
            qAuxItens.FieldByName('Valor_Seguro').AsFloat,
            qAuxItens.FieldByName('Outras_Despesas').AsFloat,
            (preco * qAuxItens.FieldByName('Qtde').AsFloat),
            (preco * qAuxItens.FieldByName('Qtde').AsFloat),
            qAuxItens.FieldByName('Cancelado').AsString,
            qAuxItens.FieldByName('Indica_Valor_Total').AsString,
            qAuxItens.FieldByName('Data_Entrega').AsDateTime,
            qAuxItens.FieldByName('Hora_Entrega').AsString,
            qAuxItens.FieldByName('Tipo_Venda').AsString,
            qAuxItens.FieldByName('Tipo_Entrega').AsString,
            qAuxItens.FieldByName('Comissao').AsFloat,
            qAuxItens.FieldByName('Perc_Desc_Vista').AsFloat,
            qAuxItens.FieldByName('Perc_Desc_Prazo').AsFloat,
            qAuxItens.FieldByName('Permite_Credito').AsInteger,
            qAuxItens.FieldByName('Codigo_Obs_Fiscal').AsInteger,
            qAuxItens.FieldByName('Qtde_Estoque_Atual').AsFloat,
            qAuxItens.FieldByName('Valor_Compra_Nota').AsFloat);

          sub_total := sub_total +
            (preco * qAuxItens.FieldByName('Qtde').AsFloat);

          qAuxItens.Next;
        end;

        Pedido.Salva_Banco('S', 'A', qAuxPedido.FieldByName('Codigo').AsInteger,
          qAuxPedido.FieldByName('N_Pedido').AsString,
          qAuxPedido.FieldByName('N_Pre_Venda').AsString,
          qAuxPedido.FieldByName('COO').AsString,
          qAuxPedido.FieldByName('COO_Vin').AsString,
          qAuxPedido.FieldByName('CCF').AsString,
          qAuxPedido.FieldByName('Codigo_Cliente').AsInteger,
          qAuxPedido.FieldByName('Codigo_Empresa').AsInteger,
          qAuxPedido.FieldByName('Codigo_Veiculo').AsInteger,
          qAuxPedido.FieldByName('Codigo_Funcionario').AsInteger,
          qAuxPedido.FieldByName('Codigo_Tabela_Preco').AsInteger,
          qAuxPedido.FieldByName('Codigo_Forma_Pag').AsInteger,
          qAuxPedido.FieldByName('Data_Venda').AsDateTime,
          qAuxPedido.FieldByName('Data_Vencimento').AsDateTime,
          qAuxPedido.FieldByName('Qtde_Itens').AsInteger,
          qAuxPedido.FieldByName('Qtde_Servicos').AsInteger, sub_total,
          qAuxPedido.FieldByName('Total_Servicos').AsFloat, 0, 0, '$',
          sub_total, qAuxPedido.FieldByName('Tipo').AsString,
          qAuxPedido.FieldByName('Status').AsString,
          qAuxPedido.FieldByName('Status_OS').AsString, 0, 0,
          qAuxPedido.FieldByName('Mesclada').AsInteger,
          qAuxPedido.FieldByName('Problema_Reclamado').AsString,
          qAuxPedido.FieldByName('Problema_Constatado').AsString,
          qAuxPedido.FieldByName('Solucao').AsString,
          qAuxPedido.FieldByName('DAVC').AsString,
          qAuxPedido.FieldByName('DAVAnt').AsString,
          qAuxPedido.FieldByName('Chave_NFe').AsString,
          qAuxPedido.FieldByName('Protocolo_NFe').AsString,
          qAuxPedido.FieldByName('N_Nota_Fiscal').AsInteger,
          qAuxPedido.FieldByName('Observacao').AsString,
          qAuxPedido.FieldByName('Hora_Venda').AsString, 1,
          qAuxPedido.FieldByName('Data_Previsao_Entrega').AsDateTime,
          qAuxPedido.FieldByName('Data_Entrega').AsDateTime,
          qAuxPedido.FieldByName('Kilometragem').AsFloat,
          qAuxPedido.FieldByName('ECF').AsString,
          qAuxPedido.FieldByName('Codigo_CFOP').AsInteger,
          qAuxPedido.FieldByName('Total_Impostos').AsFloat,
          qAuxPedido.FieldByName('Data_Emissao_NFe').AsDateTime,
          DM.ADOConnection1);

        qAuxPedido.Next;
      end;
    end;

  finally
    FreeAndNil(qAuxPedido);
    FreeAndNil(qAuxItens);
    FreeAndNil(qAuxPreco);
  end;
end;

procedure Pega_Endereco(Edt: TEdit);
var
  Posicao, aux: Integer;
begin
  if (qAux_Endereco = Nil) then
    qAux_Endereco := TADOQuery.Create(nil);
  try
    with qAux_Endereco, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select L.* from Logradouro L');
      add('where L.Descricao like ''' + Edt.Text + '%'' order by L.Descricao');
      open;
    end;

    If qAux_Endereco.FieldByName('Descricao').AsString <> '' then
    begin
      Posicao := Length(Edt.Text);
      For aux := Length(Edt.Text) +
        1 to Length(qAux_Endereco.FieldByName('Descricao').AsString) do
      begin
        Edt.Text := Edt.Text + qAux_Endereco.FieldByName('Descricao')
          .AsString[aux];
      end;
      Edt.SelStart := Posicao;
      Edt.SelLength := Length(Edt.Text);
    end;
  finally
    // FreeAndNil(qAux_Produto);
  end;
end;

procedure Pega_Setor(Edt: TEdit);
var
  Posicao, aux: Integer;
begin
  if (qAux_Setor = Nil) then
    qAux_Setor := TADOQuery.Create(nil);
  try
    with qAux_Setor, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select L.Codigo, L.Descricao from Setor L');
      add('where L.Descricao like ''' + Edt.Text + '%'' order by L.Descricao');
      open;
    end;

    If qAux_Setor.FieldByName('Descricao').AsString <> '' then
    begin
      Posicao := Length(Edt.Text);
      For aux := Length(Edt.Text) +
        1 to Length(qAux_Setor.FieldByName('Descricao').AsString) do
      begin
        Edt.Text := Edt.Text + qAux_Setor.FieldByName('Descricao')
          .AsString[aux];
      end;
      Edt.SelStart := Posicao;
      Edt.SelLength := Length(Edt.Text);
    end;
  finally
    // FreeAndNil(qAux_Produto);
  end;
end;

procedure ValidaCampos(DataSet: TDataSet; Grid: TDBGrid);
var
  campo: Integer;
begin
  for campo := 0 to pred(DataSet.FieldCount) do
  begin
    if DataSet.Fields[campo].Required then
    begin
      if ((DataSet.Fields[campo].AsString = '')) then
      // or (DataSet.Fields[campo].AsInteger = 0)
      begin
        application.MessageBox
          (Pchar('Campo ' + Grid.Columns.Items[campo].Title.Caption +
          ' não pode ser nulo.'), 'Campo nulo', MB_OK + MB_ICONHAND);
        DataSet.Fields[campo].FocusControl;
        abort;
      end;
    end;
  end;
end;

procedure Pega_Cidade(Edt: TEdit);
var
  Posicao, aux: Integer;
begin
  if (qAux_Cidade = Nil) then
    qAux_Cidade := TADOQuery.Create(nil);
  try
    with qAux_Cidade, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select L.* from Cidade L');
      add('where L.Descricao like ''' + Edt.Text + '%'' order by L.Descricao');
      open;
    end;

    If qAux_Cidade.FieldByName('Descricao').AsString <> '' then
    begin
      Posicao := Length(Edt.Text);
      For aux := Length(Edt.Text) +
        1 to Length(qAux_Cidade.FieldByName('Descricao').AsString) do
      begin
        Edt.Text := Edt.Text + qAux_Cidade.FieldByName('Descricao')
          .AsString[aux];
      end;
      Edt.SelStart := Posicao;
      Edt.SelLength := Length(Edt.Text);
    end;
  finally
    // FreeAndNil(qAux_Produto);
  end;
end;

procedure Cadastra_Setor(Descricao: AnsiString; Data_Cadastro: TDate);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('Insert into Setor');
      add('(Descricao,');
      add('Data_Cadastro)');

      add('values');

      add('(:Descricao,');
      add(':Data_Cadastro)');

      Parameters.ParamByName('Descricao').Value := Descricao;
      Parameters.ParamByName('Data_Cadastro').Value := Data_Cadastro;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Cadastra_Cidade(Descricao, UF, DDD: AnsiString; Data_Cadastro: TDate;
  Codigo_Municipio: AnsiString; Codigo_Pais: Integer);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('Insert into Cidade');
      add('(Descricao,');
      add('UF,');
      add('DDD,');
      add('Data_Cadastro,');
      add('Codigo_Municipio,');
      add('Codigo_Pais)');

      add('values');

      add('(:Descricao,');
      add(':UF,');
      add(':DDD,');
      add(':Data_Cadastro,');
      add(':Codigo_Municipio,');
      add(':Codigo_Pais)');

      Parameters.ParamByName('Descricao').Value := Descricao;
      Parameters.ParamByName('UF').Value := UF;
      Parameters.ParamByName('DDD').Value := DDD;
      Parameters.ParamByName('Data_Cadastro').Value := Data_Cadastro;
      Parameters.ParamByName('Codigo_Municipio').Value := Codigo_Municipio;
      Parameters.ParamByName('Codigo_Pais').Value := Codigo_Pais;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Cadastra_Logradouro(Descricao, Tipo_Logradouro, CEP: AnsiString;
  Data_Cadastro: TDate);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('Insert into Logradouro');
      add('(Descricao,');
      add('Tipo_Logradouro,');
      add('CEP,');
      add('Data_Cadastro)');

      add('values');

      add('(:Descricao,');
      add(':Tipo_Logradouro,');
      add(':CEP,');
      add(':Data_Cadastro)');

      Parameters.ParamByName('Descricao').Value := Descricao;
      Parameters.ParamByName('Tipo_Logradouro').Value := Tipo_Logradouro;
      Parameters.ParamByName('CEP').Value := CEP;
      Parameters.ParamByName('Data_Cadastro').Value := Data_Cadastro;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Chama_Mensagem;
var
  qAux: TADOQuery;
  ano, mes, dia: Word;
begin
  try
    conta_mensagem := 0;
    qAux := TADOQuery.Create(nil);
    if (avisa_tabela_preco = 'SIM') then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select TP.Codigo, TP.Data_Validade, TP.Descricao, datediff(day, :data1, TP.Data_Validade) as dias from Tabela_Preco TP');
        add('where TP.Codigo_Empresa = :Empresa and datediff(day, :data2, TP.Data_Validade) <= :dias and');
        add('datediff(day, :data3, TP.Data_Validade) > 0');
        Parameters.ParamByName('Empresa').Value := UDeclaracao.Codigo_Empresa;
        Parameters.ParamByName('data1').Value := date;
        Parameters.ParamByName('dias').Value := dias_aviso;
        Parameters.ParamByName('data2').Value := date;
        Parameters.ParamByName('data3').Value := date;
        open;
        if (IsEmpty = false) then
        begin
          FrmMenu_Geral.Label1.Visible := true;
          FrmMenu_Geral.Label2.Visible := true;
          qAux.First;
          while not qAux.Eof do
          begin
            tabela_preco := tabela_preco + 'A Tabela de Preço ' +
              qAux.FieldByName('Descricao').AsString + ', vencerá em ' +
              qAux.FieldByName('Dias').AsString + ' dias.' + #13;
            Inc(conta_mensagem);
            qAux.Next;
          end;
        end;
      end;
    end;

    if (avisa_lancamento_financeiro = 'SIM') then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select LF.Codigo_Empresa, PL.N_Documento, PL.Data_Vencimento, PL.Status, datediff(day, :data1, PL.Data_Vencimento) as dias from Parcelas_Lancamentos PL');
        add('inner join Lancamento_Financeiro LF on (PL.Codigo = LF.Codigo)');
        add('where LF.Codigo_Empresa = :Empresa and datediff(day, :data2, PL.Data_Vencimento) <= :dias and');
        add('datediff(day, :data3, PL.Data_Vencimento) > 0 and PL.Status = :Status');
        Parameters.ParamByName('Empresa').Value := UDeclaracao.Codigo_Empresa;
        Parameters.ParamByName('data1').Value := date;
        Parameters.ParamByName('dias').Value := dias_aviso;
        Parameters.ParamByName('data2').Value := date;
        Parameters.ParamByName('data3').Value := date;
        Parameters.ParamByName('Status').Value := 'PENDENTE';
        open;
        if (IsEmpty = false) then
        begin
          FrmMenu_Geral.Label1.Visible := true;
          FrmMenu_Geral.Label2.Visible := true;
          qAux.First;
          while not qAux.Eof do
          begin
            lancamento_financeiro := lancamento_financeiro +
              'O Lançamento Financeiro com o número ' +
              qAux.FieldByName('N_Documento').AsString + ', vencerá em ' +
              qAux.FieldByName('Dias').AsString + ' dias.' + #13;
            Inc(conta_mensagem);
            qAux.Next;
          end;
        end;
      end;
    end;

    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select P.Data_Vencimento, P.N_Pedido, C.Nome_Nome_Fantasia, datediff(day, :data1, P.Data_Vencimento) as dias from Pedido P');
      add('left join Cliente C on (P.Codigo_Cliente = C.Codigo)');
      add('where P.Codigo_Empresa = :Empresa and datediff(day, :data2, P.Data_Vencimento) <= :dias and');
      add('datediff(day, :data3, P.Data_Vencimento) > 0 and P.Status = :Status and P.Tipo = :Tipo');
      Parameters.ParamByName('Empresa').Value := UDeclaracao.Codigo_Empresa;
      Parameters.ParamByName('data1').Value := date;
      Parameters.ParamByName('dias').Value := dias_aviso;
      Parameters.ParamByName('data2').Value := date;
      Parameters.ParamByName('data3').Value := date;
      Parameters.ParamByName('Status').Value := 'PENDENTE';
      Parameters.ParamByName('Tipo').Value := 'DAV';
      open;
      if (IsEmpty = false) then
      begin
        FrmMenu_Geral.Label1.Visible := true;
        FrmMenu_Geral.Label2.Visible := true;
        qAux.First;
        while not qAux.Eof do
        begin
          pedido_pendente := pedido_pendente + 'O Orçamento nº ' +
            qAux.FieldByName('N_Pedido').AsString +
            ', que foi solicitado pelo cliente ' +
            qAux.FieldByName('Nome_Nome_Fantasia').AsString + ', vencerá em ' +
            qAux.FieldByName('Dias').AsString + ' dias.' + #13;
          Inc(conta_mensagem);
          qAux.Next;
        end;
      end;
    end;

    if (avisa_cheque = 'SIM') then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select CC.Codigo, CC.Emitente, CC.N_Cheque, CC.Data_Vencimento, CC.Valor, datediff(day, :data1, CC.Data_Vencimento) as dias from Cheque CC');
        add('where CC.Codigo_Empresa = :Empresa and datediff(day, :data2, CC.Data_Vencimento) <= :dias and');
        add('datediff(day, :data3, CC.Data_Vencimento) > 0 and CC.Status = :Status');
        Parameters.ParamByName('Empresa').Value := UDeclaracao.Codigo_Empresa;
        Parameters.ParamByName('data1').Value := date;
        Parameters.ParamByName('dias').Value := dias_aviso;
        Parameters.ParamByName('data2').Value := date;
        Parameters.ParamByName('data3').Value := date;
        Parameters.ParamByName('Status').Value := 'PENDENTE';
        open;
        if (IsEmpty = false) then
        begin
          FrmMenu_Geral.Label1.Visible := true;
          FrmMenu_Geral.Label2.Visible := true;
          qAux.First;
          while not qAux.Eof do
          begin
            cheque := cheque + 'O Cheque com o número ' +
              qAux.FieldByName('N_Cheque').AsString + ', emitido por ' +
              qAux.FieldByName('Emitente').AsString + ', com o valor de R$' +
              qAux.FieldByName('Valor').AsString + ', vencerá em ' +
              qAux.FieldByName('Dias').AsString + ' dias.' + #13;
            Inc(conta_mensagem);
            qAux.Next;
          end;
        end;
      end;
    end;

    if (avisa_pedido_compra = 'SIM') then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select Com.N_Pedido, Com.Data_Pedido, Com.Codigo_Funcionario, Com.Codigo_Fornecedor, Com.Status, ');
        add('Fun.Nome, Forn.Nome_Fantasia, ');
        add('datediff(day, :data1, Com.Data_Previsao_Entrega) as dias from Compra Com');
        add('left join Funcionario Fun on(Com.Codigo_Funcionario = Fun.Codigo)');
        add('left join Fornecedor Forn on(Com.Codigo_Fornecedor = Forn.Codigo)');
        add('where Com.Codigo_Empresa = :Empresa and datediff(day, :data2, Com.Data_Previsao_Entrega) <= :dias and');
        add('datediff(day, :data3, Com.Data_Previsao_Entrega) > 0 and Com.Status = :Status');
        Parameters.ParamByName('Empresa').Value := UDeclaracao.Codigo_Empresa;
        Parameters.ParamByName('data1').Value := date;
        Parameters.ParamByName('dias').Value := dias_aviso;
        Parameters.ParamByName('data2').Value := date;
        Parameters.ParamByName('data3').Value := date;
        Parameters.ParamByName('Status').Value := 'PENDENTE';
        open;
        if (IsEmpty = false) then
        begin
          FrmMenu_Geral.Label1.Visible := true;
          FrmMenu_Geral.Label2.Visible := true;
          qAux.First;
          while not qAux.Eof do
          begin
            pedido_compra := pedido_compra +
              'Há um registro de Pedido de Compra, com o número ' +
              qAux.FieldByName('N_Pedido').AsString +
              ', solicitado para o fornecedor ' +
              qAux.FieldByName('Nome_Fantasia').AsString + ', no dia ' +
              qAux.FieldByName('Data_Pedido').AsString + ' pelo funcionário ' +
              qAux.FieldByName('Nome').AsString +
              ', está previsto para ser entregue em ' + qAux.FieldByName('Dias')
              .AsString + ' dias.' + #13;
            Inc(conta_mensagem);
            qAux.Next;
          end;
        end;
      end;
    end;

    if (avisa_produto_vencido = 'SIM') then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select P.Descricao, P.Data_Validade, datediff(day, :data1, P.Data_Validade) as dias from Produto P');
        add('where P.Codigo_Empresa = :Empresa and datediff(day, :data2, P.Data_Validade) <= :dias and');
        add('datediff(day, :data3, P.Data_Validade) > 0');
        Parameters.ParamByName('Empresa').Value := UDeclaracao.Codigo_Empresa;
        Parameters.ParamByName('data1').Value := date;
        Parameters.ParamByName('dias').Value := dias_aviso;
        Parameters.ParamByName('data2').Value := date;
        Parameters.ParamByName('data3').Value := date;
        open;
        if (IsEmpty = false) then
        begin
          FrmMenu_Geral.Label1.Visible := true;
          FrmMenu_Geral.Label2.Visible := true;
          qAux.First;
          while not qAux.Eof do
          begin
            produto_vencido := produto_vencido + 'O Produto ' +
              qAux.FieldByName('Descricao').AsString + ', vencerá em ' +
              qAux.FieldByName('Dias').AsString + ' dias.' + #13;
            Inc(conta_mensagem);
            qAux.Next;
          end;
        end;
      end;
    end;

    if (avisa_conta_fixa = 'SIM') then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select CF.Descricao, CF.Dia_Vencimento, (CF.Dia_Vencimento - datepart(day, :data1)) as dias from Conta_Fixa CF');
        add('where CF.Codigo_Empresa = :Empresa and (CF.Dia_Vencimento - datepart(day, :data2)) <= :dias and');
        add('(CF.Dia_Vencimento - datepart(day, :data3)) > 0');
        Parameters.ParamByName('data1').Value := date;
        Parameters.ParamByName('Empresa').Value := UDeclaracao.Codigo_Empresa;
        Parameters.ParamByName('data2').Value := date;
        Parameters.ParamByName('dias').Value := dias_aviso;
        Parameters.ParamByName('data3').Value := date;
        open;
        if (IsEmpty = false) then
        begin
          FrmMenu_Geral.Label1.Visible := true;
          FrmMenu_Geral.Label2.Visible := true;
          qAux.First;
          while not qAux.Eof do
          begin
            conta_fixa := conta_fixa + 'A Conta fixa ' +
              qAux.FieldByName('Descricao').AsString + ', vencerá em ' +
              qAux.FieldByName('Dias').AsString + ' dias.' + #13;
            Inc(conta_mensagem);
            qAux.Next;
          end;
        end;
      end;
    end;

    if (avisa_aniversario_cliente = 'SIM') then
    begin
      DecodeDate(date, ano, mes, dia);
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select C.Nome_Nome_Fantasia, C.Data_Nascimento from Cliente C');
        add('where datepart(day, C.Data_Nascimento) = :dia and datepart(month, C.Data_Nascimento) = :mes');
        Parameters.ParamByName('dia').Value := dia;
        Parameters.ParamByName('mes').Value := mes;
        open;
        if (IsEmpty = false) then
        begin
          FrmMenu_Geral.Label1.Visible := true;
          FrmMenu_Geral.Label2.Visible := true;
          qAux.First;
          while not qAux.Eof do
          begin
            aniversario_cliente := aniversario_cliente + 'O(A) Cliente ' +
              qAux.FieldByName('Nome_Nome_Fantasia').AsString +
              ', está fazendo aniversário hoje.' + #13;
            Inc(conta_mensagem);
            qAux.Next;
          end;
        end;
      end;
    end;

    if (avisa_aniversario_funcionario = 'SIM') then
    begin
      DecodeDate(date, ano, mes, dia);
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select F.Nome, F.Data_Nascimento from Funcionario F');
        add('where datepart(day, F.Data_Nascimento) = :dia and datepart(month, F.Data_Nascimento) = :mes');
        Parameters.ParamByName('dia').Value := dia;
        Parameters.ParamByName('mes').Value := mes;
        open;
        if (IsEmpty = false) then
        begin
          FrmMenu_Geral.Label1.Visible := true;
          FrmMenu_Geral.Label2.Visible := true;
          qAux.First;
          while not qAux.Eof do
          begin
            aniversario_funcionario := aniversario_funcionario +
              'O(A) Funcionário(a) ' + qAux.FieldByName('Nome').AsString +
              ', está fazendo aniversário hoje.' + #13;
            Inc(conta_mensagem);
            qAux.Next;
          end;
        end;
      end;
    end;

    if (avisa_cotacao_preco = 'SIM') then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select CPP.N_Cotacao, CPP.Codigo_Funcionario, CPP.Data_Cotacao, CPP.Data_Vencimento, Fun.Nome, ');
        add('datediff(day, :data1, CPP.Data_Vencimento) as dias from Cotacao_Preco_Produto CPP');
        add('left join Funcionario Fun on(CPP.Codigo_Funcionario = Fun.Codigo)');
        add('where CPP.Codigo_Empresa = :Empresa and datediff(day, :data2, CPP.Data_Vencimento) <= :dias and');
        add('datediff(day, :data3, CPP.Data_Vencimento) > 0');
        Parameters.ParamByName('Empresa').Value := UDeclaracao.Codigo_Empresa;
        Parameters.ParamByName('data1').Value := date;
        Parameters.ParamByName('dias').Value := dias_aviso;
        Parameters.ParamByName('data2').Value := date;
        Parameters.ParamByName('data3').Value := date;
        open;
        if (IsEmpty = false) then
        begin
          FrmMenu_Geral.Label1.Visible := true;
          FrmMenu_Geral.Label2.Visible := true;
          qAux.First;
          while not qAux.Eof do
          begin
            cotacao_preco := cotacao_preco +
              'Há um registro de Cotação de Preços de Produtos, com o número ' +
              qAux.FieldByName('N_Cotacao').AsString + ', solicitado no dia ' +
              qAux.FieldByName('Data_Cotacao').AsString + ', pelo funcionário '
              + qAux.FieldByName('Nome').AsString + ' que vencerá em ' +
              qAux.FieldByName('Dias').AsString + ' dias.' + #13;
            Inc(conta_mensagem);
            qAux.Next;
          end;
        end;
      end;
    end;

  finally
    FreeAndNil(qAux);
  end;
end;

{ function Reducao_Z_Pendente: boolean;
  var
  data_movimento, data_atual: AnsiString;
  d, m, a: AnsiString;
  begin
  Result := false;
  for iConta := 1 to 6 do
  data_movimento := data_movimento + ' ';
  iRetorno := Bematech_FI_DataMovimento(data_movimento);

  d := copy(data_movimento, 1, 2);
  m := copy(data_movimento, 3, 2);
  a := copy(data_movimento, 5, 2);
  data_movimento := d + '/' + m + '/' + a;

  data_movimento := FormatDateTime('DD/MM/YYYY', StrToDateTime(data_movimento));
  data_atual := FormatDateTime('DD/MM/YYYY', date);

  if (StrToDateTime(data_movimento) < StrToDateTime(data_atual)) then
  begin
  Habilitado := false;
  FrmMenu_Geral.acLancamento_Manual.Visible:= true;
  Result := true;
  end
  else if (StrToDateTime(data_movimento) > StrToDateTime(data_atual)) then
  begin
  Habilitado := false;
  FrmMenu_Geral.acLancamento_Manual.Visible:= true;
  Result := true;
  end
  else
  begin
  Habilitado:= true;
  FrmMenu_Geral.acLancamento_Manual.Visible:= false;
  end;
  end; }

function Movimento_Fechado: boolean;
var
  data_movimento: AnsiString;
begin
  Result := false;
  for iConta := 1 to 6 do
    data_movimento := data_movimento + ' ';
  iRetorno := Bematech_FI_DataMovimento(data_movimento);

  if (data_movimento = '000000') then
  begin
    application.MessageBox
      ('O movimento do dia atual está fechado. Aguarde o próximo dia para a reabertura',
      'Movimento Fechado', MB_OK + MB_ICONHAND);
    Result := true;
  end;
end;

procedure Atualiza_Estoque(var Conexao: TADOConnection; Valor: Double; Codigo: Integer);
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update Produto set Estoque = :Estoque, Data_Atualizacao_Estoque = :Data, Status_Estoque_Data = :Status');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Estoque').Value := Valor;
      Parameters.ParamByName('Data').Value := date;
      if (Valor >= 0) then
        Parameters.ParamByName('Status').Value := '+'
      else
        Parameters.ParamByName('Status').Value := '-';
      Parameters.ParamByName('Codigo').Value := Codigo;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Atualiza_Estoque_Reservado(Valor: Double; Codigo: Integer);
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update Produto set Estoque_Reservado = :Estoque_Reservado');
      add('where Codigo = :Codigo');

      Parameters.ParamByName('Estoque_Reservado').Value := Valor;
      Parameters.ParamByName('Codigo').Value := Codigo;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Atualiza_Volume(var Conexao: TADOConnection; Valor: Double; Codigo: Integer);
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update Produto set Volume_Total = :Volume_Total');
      add('where Codigo = :Codigo');
      Parameters.ParamByName('Volume_Total').Value := Valor;
      Parameters.ParamByName('Codigo').Value := Codigo;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

function Alinha_Centro(Texto: String; Tamanho: Integer): Integer;
begin
  Result := ((Tamanho - Length(Texto)) div 2);
end;

function Alinha_Centro_Texto(Texto: String; Posicao_Inicial: Integer;
  Tamanho: Integer): Integer;
begin
  Result := ((Length(Texto) - Tamanho) div 2) + Posicao_Inicial;
end;

procedure Verifica_Status_Impressora;
begin
  ECF.Verifica_Impressora_Ligada;
  //ECF.Verifica_Fim_Papel;
  //ECF.Verifica_Pouco_Papel;
end;

function Verifica_Produto_Entrada(Qtde: Double): boolean;
begin
  Result := true;

  if (permissao_compra = 'PERMITIR ENTRADA') then
    exit;

  if (permissao_compra = 'BLOQUEAR ENTRADA') then
  begin
    if ((qtde_estoque + Qtde) > estoque_maximo) then
    begin
      application.MessageBox
        ('Produto bloqueado para entrada. A quantidade maxima exigida no estoque para esse produto, será extrapolado.',
        'Bloqueado', MB_OK + MB_ICONHAND);
      FrmEntrada_Produtos.Limpa_Menor;
      Result := false;
      exit;
    end;
  end;

  if (permissao_compra = 'EXIBIR MENSAGEM DE ALERTA') then
  begin
    if ((qtde_estoque + Qtde) > estoque_maximo) then
    begin
      if application.MessageBox
        ('A quantidade maxima exigida no estoque para esse produto, será extrapolado. Deseja continuar?',
        'Atenção', MB_YESNO + MB_ICONHAND) = idno then
      begin
        FrmEntrada_Produtos.Limpa_Menor;
        Result := false;
        exit;
      end;
    end;
  end;
end;

procedure Cancela_Pre_Venda;
var
  sCodigo, sDescricao, sTipoQtde, sQtde, sValor, sTipo, sDesconto, tipo_desc,
    valor_desc, unid_med, sAcrecimo, aux1, aux3, Aux4, Aux5, sdesc_acr, dOUa,
    aliquotacupom, saliquota: AnsiString;
  iConta: Integer;
  estoque, estoque_reservado, valor_unitario, Aliquota, DescontoTotal,
    ValorCupom: Double;
  qPedido, qDadosPedidoVenda: TADOQuery;
begin
  if (Habilitado = false) then
  begin
    Mensagem_Erro;
    abort;
  end;

  valor_unitario := 0;
  valor_imposto_lei := 0;
  Aliquota := 0;
  DescontoTotal := 0;
  ValorCupom := 0;

  qPedido := TADOQuery.Create(nil);
  qDadosPedidoVenda := TADOQuery.Create(nil);
  // Verifica_Permissao;
  // Atualiza_Dados;
  // Cancela_Pre_Venda;
  TLog.Info('---CANCELAR PRE-VENDA PENDENTE DO DIA ANTERIOR---');
  try
    // Cria_Conexao;

    TLog.Debug('Data do movimento: ' + DataF);
    TLog.Debug('Data do movimento - 1: ' + DateToStr(StrToDate(DataF) - 1));

    with qPedido, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select Ped.Codigo, Ped.N_Pre_Venda, Ped.Data_Venda from Pedido Ped');
      add('where Ped.Data_Venda = :Data and Ped.Tipo = :Pre and Ped.Status = :Status');
      Parameters.ParamByName('Data').Value := StrToDate(DataF) - 1;
      Parameters.ParamByName('Pre').Value := 'PRÉ-VENDA';
      Parameters.ParamByName('Status').Value := 'PENDENTE';
      open;
    end;

    TLog.Debug('Quantidade de pedidos para cancelar: ' +
      IntToStr(qPedido.RecordCount));
    if (qPedido.IsEmpty = false) then
    begin
      TLog.Debug
        ('Vai percorrer a Query de pedidos. Moveu pro primeiro registro.');
      qPedido.First;
      while not(qPedido.Eof) do
      begin
        ValorCupom := 0;
        TLog.Debug('Código do pedido: ' + qPedido.FieldByName('Codigo')
          .AsString);
        TLog.Debug('Nº da Pre-Venda: ' + qPedido.FieldByName('N_Pre_Venda')
          .AsString);

        with qDadosPedidoVenda, SQL do
        begin
          close;
          Connection := DM.ADOConnection1;
          clear;
          add('select IP.* from Itens_Pedido IP');
          add('inner join Pedido Ped on (IP.Codigo = Ped.Codigo)');
          add('where IP.Codigo = :Codigo');
          Parameters.ParamByName('Codigo').Value :=
            qPedido.FieldByName('Codigo').AsString;
          open;
          First;
        end;
        TLog.Debug('Carregou os produtos.');

        ECF.Abrir_Cupom;
        TLog.Debug('Abriu cupom normal.');

        TLog.Debug('Quantidade de produtos: ' +
          IntToStr(qDadosPedidoVenda.RecordCount));
        while not(qDadosPedidoVenda.Eof) do
        begin
          TLog.Debug('');
          TLog.Debug('DADOS DOS PRODUTOS:');

          sCodigo := StringOfChar('0',
            12 - Length(qDadosPedidoVenda.FieldByName('Codigo_Venda').AsString))
            + qDadosPedidoVenda.FieldByName('Codigo_Venda').AsString;
          sCodigo := copy(sCodigo, 1, 12);
          TLog.Debug('Código do produto: ' + sCodigo);
          sDescricao := copy(qDadosPedidoVenda.FieldByName('Descricao')
            .AsString, 1, 29);
          TLog.Debug('Descrição do produto: ' + sDescricao);
          TLog.Debug('Tipo do recolhimento: ' + qDadosPedidoVenda.FieldByName
            ('Tipo_Recolhimento').AsString);

          if (qDadosPedidoVenda.FieldByName('Tipo_Recolhimento').AsString = 'I')
          then
          begin
            saliquota := 'I1';
            aliquotacupom := 'II';
          end
          else if (qDadosPedidoVenda.FieldByName('Tipo_Recolhimento')
            .AsString = 'NT') then
          begin
            saliquota := 'N1';
            aliquotacupom := 'NN';
          end
          else if (qDadosPedidoVenda.FieldByName('Tipo_Recolhimento')
            .AsString = 'ST') then
          begin
            saliquota := 'F1';
            aliquotacupom := 'FF';
          end
          else if (qDadosPedidoVenda.FieldByName('Tipo_Recolhimento')
            .AsString = 'TRIBUTADO') then
          begin
            saliquota := qDadosPedidoVenda.FieldByName('ICMS').AsString;
            aliquotacupom := StringReplace(saliquota, '0', '', [rfReplaceAll]);
          end
          else
          begin
            if (qDadosPedidoVenda.FieldByName('ICMS').AsString = '0') then
            begin
              saliquota := 'F1';
              aliquotacupom := 'FF';
            end
            else
            begin
              saliquota := qDadosPedidoVenda.FieldByName('ICMS').AsString;
              aliquotacupom := StringReplace(saliquota, '0', '',
                [rfReplaceAll]);
            end;
          end;

          TLog.Debug('Aliquota do produto: ' + saliquota);
          TLog.Debug('Aliquota do cupom: ' + aliquotacupom);
          sTipoQtde := 'I';
          sQtde := FormatFloat('#0.0,00',
            qDadosPedidoVenda.FieldByName('Qtde').AsFloat);
          sQtde := StringReplace(sQtde, ThousandSeparator, '', [rfReplaceAll]);
          TLog.Debug('Quantidade: ' + sQtde);
          // sValor     := FormatFloat('#0.0,00', qAux2.FieldByName('Valor_Unitario').AsFloat);
          sValor := FormatFloat('#0.0,00',
            qDadosPedidoVenda.FieldByName('Valor_Original').AsFloat);
          sValor := StringReplace(sValor, ThousandSeparator, '',
            [rfReplaceAll]);
          TLog.Debug('Valor: ' + sValor);
          sTipo := '$';
          DescontoTotal := (qDadosPedidoVenda.FieldByName('Qtde').AsFloat *
            qDadosPedidoVenda.FieldByName('Desc_Acr').AsFloat) -
            qDadosPedidoVenda.FieldByName('Outras_Despesas').AsFloat;
          { sDesconto:= '0';
            sAcrecimo:= '0';
            if (qAux2.FieldByName('dOUa').AsString = 'D') then
            begin }
          sDesconto := FormatFloat('#0.0,0', DescontoTotal);
          sDesconto := StringReplace(sDesconto, ThousandSeparator, '',
            [rfReplaceAll]);
          // sDesconto:= FormatFloat('#0.0,0', qAux2.FieldByName('Desc_Acr').AsFloat * StrToFloat(sQtde));
          sAcrecimo := '0';
          sdesc_acr := sDesconto;
          dOUa := 'D';
          { end
            else
            begin
            sAcrecimo:= FormatFloat('#0.0,0', qAux2.FieldByName('Desc_Acr').AsFloat);
            //sAcrecimo:= FormatFloat('#0.0,0', qAux2.FieldByName('Desc_Acr').AsFloat * StrToFloat(sQtde));
            sDesconto:= '0';
            sdesc_acr:= sAcrecimo;
            dOUa:= 'A';
            end; }
          // TLog.Debug('Acréscimo: '+sAcrecimo);
          TLog.Debug('Desconto: ' + sDesconto);
          TLog.Debug('Variável sdesc_acr: ' + sdesc_acr);
          TLog.Debug('dOUa: ' + dOUa);

          unid_med := qDadosPedidoVenda.FieldByName('UN').AsString;
          TLog.Debug('Unidade de medida: ' + unid_med);
          if (ECF.Vende_Item(sCodigo, sDescricao, aliquotacupom, sQtde, sValor,
            sdesc_acr, sTipo, unid_med, dOUa)) then
          begin
            // CapturaContadoresECF;
            // ECF.Pega_Contadores;
            // ECF.Pega_Numero_Caixa;
            // Captura_Ultimo_Item;
            // ECF.Pega_Ultimo_Item;
            // Captura_Totalizador;

            // R05.Alterar(R05);
            // R05.Alterar_Aux(R05);

            // R05.Alterar_Item(R05);
            // R05.Alterar_Item_Aux(R05);

            { if (qryitens_venda.Locate('Codigo; Codigo_Produto', VarArrayOf([qrycarrega_caixaCodigo.AsInteger, qAux.FieldByName('Codigo').AsInteger]), [])) then
              begin
              TLog.Debug('Vai atualizar dados do N_Item');
              qryitens_venda.Edit;
              qryitens_vendaN_Item.AsString:= UDeclaracao.N_Item;
              qryitens_venda.Post;
              TLog.Debug('Atualizou dados do N_Item');
              end;

              if (FrmCarrega_Pedido_Caixa.quero_cancelar = false) and (qAux2.FieldByName('Cancelado').AsString = 'N') and (gerar_estoque = 0) then
              begin
              if (qryitens_venda.Locate('Codigo; Codigo_Produto', VarArrayOf([qrycarrega_caixaCodigo.AsInteger, qAux.FieldByName('Codigo').AsInteger]), [])) then
              begin
              TLog.Debug('Vai atualizar dados da Qtde_Estoque_Atual');
              qryitens_venda.Edit;
              qryitens_vendaQtde_Estoque_Atual.AsFloat:= qAux.FieldByName('Estoque').AsFloat;
              qryitens_venda.Post;
              TLog.Debug('Atualizou dados da Qtde_Estoque_Atual');
              end;

              estoque:= qAux.FieldByName('Estoque').AsFloat - qAux2.FieldByName('Qtde_Entregue').AsFloat;
              estoque_reservado:= qAux.FieldByName('Estoque_Reservado').AsFloat + qAux2.FieldByName('Qtde_Restante').AsFloat;
              TLog.Debug('Estoque: '+FloatToStr(estoque));

              Atualiza_Saldo_Estoque(qAux.FieldByName('Codigo').AsInteger, (qAux.FieldByName('Valor_Compra').AsFloat * estoque));
              TLog.Debug('Atualizou saldo do estoque.');
              Atualiza_Estoque(estoque, qAux.FieldByName('Codigo').AsInteger);
              TLog.Debug('Atualizou estoque.');
              Atualiza_Volume(estoque * qAux.FieldByName('Volume').AsFloat, qAux.FieldByName('Codigo').AsInteger);
              TLog.Debug('Atualizou volume.');
              end; }

            Aliquota := Retorna_Aliquota_NCM
              (qDadosPedidoVenda.FieldByName('NCM').AsString,
              qDadosPedidoVenda.FieldByName('Origem').AsString,
              DM.ADOConnection1);
            valor_unitario := qDadosPedidoVenda.FieldByName
              ('Valor_Unitario').AsFloat;
            TLog.Debug('Aliquota do NCM: ' + FloatToStr(Aliquota));
            TLog.Debug('Valor Unitário: ' + FloatToStr(valor_unitario));

            valor_imposto_lei := valor_imposto_lei +
              (valor_unitario * (Aliquota / 100));
            valor_imposto_lei := Calcula_Valor(FloatToStr(valor_imposto_lei));
            TLog.Debug('Valor Imposto Lei: ' + FloatToStr(valor_imposto_lei));
            ValorCupom := ValorCupom +
              (qDadosPedidoVenda.FieldByName('Valor_Unitario').AsFloat *
              qDadosPedidoVenda.FieldByName('Qtde').AsFloat);
          end;
          qDadosPedidoVenda.Next;
        end;

        ECF.Inicia_Fechamento_Cupom(PAnsiChar('+0'), '');
        ECF.Fecha_Cupom('01', FloatToStr(ValorCupom), false);
        ECF.Termina_Fechamento_Cupom(Mensagem, pMD5_Arquivos, '', '', '');
        ECF.Cancela_Cupom;
        ECF.Pega_Grande_Total;
        AlteraGT(StrToFloat(UDeclaracao.GrandeTotal), nu_serie);
        Atualiza_Status_Pedido(dm.ADOConnection1, qPedido.FieldByName('Codigo').AsInteger,
          'CANCELADO');
        qPedido.Next;
      end;

    end;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao cancelar cupom fiscal: ' + E.Message);
      TLog.Error('Erro ao cancelar cupom fiscal: ' + E.Message);
      // Cancela_Transacao;
      abort;
    end;
  end;
  TLog.Info('---FIM CANCELAR PRE-VENDA PENDENTE DO DIA ANTERIOR---');
end;

function Verifica_Produto_Saida(Qtde: Double): boolean;
begin
  Result := true;
  if (permissao_venda = 'PERMITIR VENDA') then
    exit;

  if (permissao_venda = 'BLOQUEAR VENDA') then
  begin
    if ((qtde_estoque - Qtde) < estoque_minimo) then
    begin
      application.MessageBox
        ('Produto bloqueado para venda. A quantidade mínima exigida no estoque para esse produto, será extrapolado.',
        'Bloqueado', MB_OK + MB_ICONHAND);
      if (FrmPedido_Venda <> nil) then
        FrmPedido_Venda.Limpa_Menor
      else if (FrmPDV <> NIL) then
        FrmPDV.Limpa_Menor;
      Result := false;
      exit;
    end;
  end;

  if (permissao_venda = 'EXIBIR MENSAGEM DE ALERTA') then
  begin
    if ((qtde_estoque - Qtde) < estoque_minimo) then
    begin
      if application.MessageBox
        ('A quantidade mínima exigida no estoque para esse produto, será extrapolado. Deseja continuar?',
        'Atenção', MB_YESNO + MB_ICONHAND) = idno then
      begin
        if (FrmPedido_Venda <> nil) then
          FrmPedido_Venda.Limpa_Menor
        else if (FrmPDV <> NIL) then
          FrmPDV.Limpa_Menor;
        Result := false;
        exit;
      end;
    end;
  end;
end;

function Verifica_Desconto(Valor: Double): boolean;
begin
  Result := true;
  if (permissao_desconto = 'PERMITIR DESCONTO') then
    exit;

  if (permissao_desconto = 'BLOQUEAR DESCONTO') then
  begin
    if (Valor < 0) then
    begin
      application.MessageBox('Foi bloqueado desconto acima do limite.',
        'Bloqueado', MB_OK + MB_ICONHAND);
      Result := false;
    end;
  end;

  if (permissao_desconto = 'EXIBIR MENSAGEM DE ALERTA') then
  begin
    if (Valor < 0) then
    begin
      if application.MessageBox
        ('Limite de desconto não configurado no sistema. Deseja continuar?',
        'Atenção', MB_YESNO + MB_ICONHAND) = idno then
        Result := false;
    end;
  end;

  if (permissao_desconto = 'SOLICITAR ADM.') then
  begin
    if (Valor < 0) then
    begin
      if application.MessageBox
        ('Limite de desconto não configurado no sistema. Para continuar, deseja chamar o ADM.?',
        'Atenção', MB_YESNO + MB_ICONHAND) = idno then
        Result := false
      else
      begin
        application.CreateForm(TFrmSenha_ADM, FrmSenha_ADM);
        FrmSenha_ADM.ShowModal;
        FrmSenha_ADM.Free;
      end;
    end;
  end;

end;

procedure Atualiza_Estoque_Acima(var Conexao: TADOConnection);
var
  qtde_estoque: Double;
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection := Conexao;
      clear;
      add('select IP.*, Pro.Estoque, Pro.Valor_Medio, Pro.Volume from Itens_Pedido IP');
      add('left join Produto Pro on (IP.Codigo_Produto = Pro.Codigo)');
      add('where IP.Codigo = :Codigo and IP.Cancelado = :N');
      Parameters.ParamByName('Codigo').Value := UDeclaracao.Codigo;
      Parameters.ParamByName('N').Value := 'N';
      open;
      First;
    end;
  finally
    // FreeAndNil(qAux);
  end;

  while not qAux.Eof do
  begin
    qtde_estoque := qAux.FieldByName('Estoque').AsFloat +
      qAux.FieldByName('Qtde').AsFloat;
    Atualiza_Estoque(Conexao, qtde_estoque, qAux.FieldByName('Codigo_Produto')
      .AsInteger);
    Atualiza_Saldo_Estoque(Conexao, qAux.FieldByName('Codigo_Produto').AsInteger,
      (qtde_estoque * qAux.FieldByName('Valor_Medio').AsFloat));
    Atualiza_Volume(Conexao, (qtde_estoque * qAux.FieldByName('Volume').AsFloat),
      qAux.FieldByName('Codigo_Produto').AsInteger);
    qAux.Next;
  end;

  Cria_Arquivo_Atualiza_Dados('AProd');
  Atualiza_Produto(4, '');
end;

function Verifica_Credito(Valor: Double): boolean;
begin
  Result := true;
  if (permissao_credito = 'PERMITIR VENDA') then
    exit;

  if (permissao_credito = 'BLOQUEAR VENDA') then
  begin
    if (Valor < 0) then
    begin
      application.MessageBox('Foi bloqueado a venda. Venda acima do limite.',
        'Bloqueado', MB_OK + MB_ICONHAND);
      Result := false;
    end;
  end;

  if (permissao_credito = 'EXIBIR MENSAGEM DE ALERTA') then
  begin
    if (Valor < 0) then
    begin
      if application.MessageBox('Venda acima do limite. Deseja continuar?',
        'Atenção', MB_YESNO + MB_ICONHAND) = idno then
        Result := false;
    end;
  end;

  if (permissao_credito = 'SOLICITAR ADM.') then
  begin
    if (Valor < 0) then
    begin
      if application.MessageBox
        ('Limite de crédito não configurado no sistema. Para continuar, deseja chamar o ADM.?',
        'Atenção', MB_YESNO + MB_ICONHAND) = idno then
        Result := false
      else
      begin
        application.CreateForm(TFrmSenha_ADM, FrmSenha_ADM);
        FrmSenha_ADM.ShowModal;
        FrmSenha_ADM.Free;
      end;
    end;
  end;
end;

procedure Verifica_Form_Aberto(Form: TForm);
begin
  if (Form <> nil) then
  begin
    application.MessageBox('Janela já aberta', 'Aviso', MB_OK + MB_ICONHAND);
    abort;
  end;
end;

procedure Cria_Arquivos;
begin
  if not(FilesExists(caminho_servidor + 'ICST' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('ICST'); // cadastro situação tributaria

  if not(FilesExists(caminho_servidor + 'ICid' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('ICid'); // cidade

  if not(FilesExists(caminho_servidor + 'ICli' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('ICli'); // cliente

  if not(FilesExists(caminho_servidor + 'ICondPag' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('ICondPag'); // condicao de pagamento

  if not(FilesExists(caminho_servidor + 'IGCli' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('IGCli'); // grupo cliente

  if not(FilesExists(caminho_servidor + 'IGProd' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('IGProd'); // grupo produto

  if not(FilesExists(caminho_servidor + 'IGPT' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('IGPT'); // grupo_produto_tributacao

  if not(FilesExists(caminho_servidor + 'IGPTC' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('IGPTC'); // grupo_produto_tributacao_cofins

  if not(FilesExists(caminho_servidor + 'IGPTI' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('IGPTI'); // grupo_produto_tributacao_ipi

  if not(FilesExists(caminho_servidor + 'IGPTP' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('IGPTP'); // grupo_produto_tributacao_pis

  if not(FilesExists(caminho_servidor + 'IITPr' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('IITPr'); // itens_tabela_preco

  if not(FilesExists(caminho_servidor + 'IITCOFINS' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('IITCOFINS'); // itens_tratamento_cofins

  if not(FilesExists(caminho_servidor + 'IITICMS' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('IITICMS'); // itens_tratamento_icms

  if not(FilesExists(caminho_servidor + 'IITIPI' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('IITIPI'); // itens_tratamento_ipi

  if not(FilesExists(caminho_servidor + 'IITPIS' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('IITPIS'); // itens_tratamento_pis

  if not(FilesExists(caminho_servidor + 'ILP' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('ILP'); // localidade_produto

  if not(FilesExists(caminho_servidor + 'ILog' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('ILog'); // logradouro

  if not(FilesExists(caminho_servidor + 'IM' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('IM'); // marca

  if not(FilesExists(caminho_servidor + 'IProd' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('IProd'); // produto

  if not(FilesExists(caminho_servidor + 'IRCOFINS' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('IRCOFINS'); // regra_cofins

  if not(FilesExists(caminho_servidor + 'IRICMS' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('IRICMS'); // regra_icms

  if not(FilesExists(caminho_servidor + 'IRIPI' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('IRIPI'); // regra_ipi

  if not(FilesExists(caminho_servidor + 'IRISS' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('IRISS'); // regra_iss

  if not(FilesExists(caminho_servidor + 'IRPIS' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('IRPIS'); // regra_pis

  if not(FilesExists(caminho_servidor + 'ISet' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('ISet'); // setor

  if not(FilesExists(caminho_servidor + 'ITPr' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('ITPr'); // tabela_preco

  if not(FilesExists(caminho_servidor + 'ITCOFINS' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('ITCOFINS'); // tratamento_cofins

  if not(FilesExists(caminho_servidor + 'ITICMS' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('ITICMS'); // tratamento_icms

  if not(FilesExists(caminho_servidor + 'ITIPI' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('ITIPI'); // tratamento_ipi

  if not(FilesExists(caminho_servidor + 'ITPIS' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('ITPIS'); // tratamento_pis

  if not(FilesExists(caminho_servidor + 'IUM' + maq + '.txt')) then
    Cria_Arquivo_Atualiza_Dados('IUM'); // unidade_medida
end;

procedure Carrega_Dados_Servidor;
var
  qAux: TADOQuery;
  serv: AnsiString;
BEGIN

  qAux := TADOQuery.Create(nil);
  // SetUncommitted(qAux);
  SetUncommitted(DM.ADOConnectionLocal);
  SetUncommitted(DM.ADOConnection1);

  if (eservidor = '1') then
    serv := servidor + '.' + Banco
  else
    serv := Banco;

  try
    // Cadastro_Situacao_Tributaria
    if (FileExists(caminho_servidor + '\Atualizações\ICST' + maq + '.txt')) then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Cadastro_Situacao_Tributaria from '+serv+'.dbo.Cadastro_Situacao_Tributaria');
        add('SET IDENTITY_INSERT Cadastro_Situacao_Tributaria ON');
        ExecSQL;
        add('Insert into Cadastro_Situacao_Tributaria(Codigo, Origem, Codigo_Situacao, Descricao, Codigo_CSOSN, ');
        add('Descricao_CSOSN, Data_Cadastro, Permite_Credito, Codigo_Obs_Fiscal) select * from '
          + serv + '.dbo.Cadastro_Situacao_Tributaria T');
        add('where T.Codigo not in(select Cadastro_Situacao_Tributaria.Codigo from Cadastro_Situacao_Tributaria)');
        ExecSQL;
        add('SET IDENTITY_INSERT Cadastro_Situacao_Tributaria OFF');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ICST' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\ACST' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Cadastro_Situacao_Tributaria set Origem = T.Origem, Codigo_Situacao = T.Codigo_Situacao, ');
        add('Descricao = T.Descricao, Codigo_CSOSN = T.Codigo_CSOSN, Descricao_CSOSN = T.Descricao_CSOSN,');
        add('Permite_Credito = T.Permite_Credito, Codigo_Obs_Fiscal = T.Codigo_Obs_Fiscal');
        add('from ' + serv + '.dbo.Cadastro_Situacao_Tributaria T'); // servidor
        add('where T.Codigo = Cadastro_Situacao_Tributaria.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ACST' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DCST' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Cadastro_Situacao_Tributaria');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Cadastro_Situacao_Tributaria T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DCST' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro ICST: ' + E.Message);
    end;
  end;

  try
    // Cidade
    if (FileExists(caminho_servidor + '\Atualizações\ICid' + maq + '.txt')) then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Cidade from '+serv+'.dbo.Cidade');
        add('SET IDENTITY_INSERT Cidade ON');
        ExecSQL;
        add('Insert into Cidade(Codigo, Descricao, UF, DDD, Data_Cadastro, Codigo_Municipio, Codigo_Pais)');
        add(' select * from ' + serv + '.dbo.Cidade T');
        add('where T.Codigo not in(select Cidade.Codigo from Cidade)');
        ExecSQL;
        add('SET IDENTITY_INSERT Cidade OFF');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ICid' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\ACid' + maq + '.txt')) then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Cidade set Descricao = T.Descricao, UF = T.UF, DDD = T.DDD, ');
        add('Codigo_Municipio = T.Codigo_Municipio, Codigo_Pais = T.Codigo_Pais');
        add('from ' + serv + '.dbo.Cidade T'); // servidor
        add('where T.Codigo = Cidade.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ACid' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DCid' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Cidade');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Cidade T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DCid' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Cidade: ' + E.Message);
    end;
  end;

  try
    // Fornecedor
    if (FileExists(caminho_servidor + '\Atualizações\IForn' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Cidade from '+serv+'.dbo.Cidade');
        add('SET IDENTITY_INSERT Fornecedor ON');
        ExecSQL;
        add('Insert into Fornecedor(Codigo, Codigo_Empresa, Tipo, Nome_Fantasia, Razao_Social, CPF, RG, Orgao_Expedidor,');
        add('Data_Emissao_RG, CNPJ, Insc_Estadual_Municipal, Numero, Referencia, Codigo_Setor, Codigo_Cidade,');
        add('Telefone, Celular, Email, Site, Data_Cadastro, Observacoes, Endereco, CEP)');
        add(' select * from ' + serv + '.dbo.Fornecedor T');
        add('where T.Codigo not in(select Fornecedor.Codigo from Fornecedor)');
        ExecSQL;
        add('SET IDENTITY_INSERT Fornecedor OFF');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\IForn' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\AForn' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Fornecedor set Codigo_Empresa = T.Codigo_Empresa, Tipo = T.Tipo, Nome_Fantasia = T.Nome_Fantasia, ');
        add('Razao_Social = T.Razao_Social, CPF = T.CPF, RG = T.RG, Orgao_Expedidor = T.Orgao_Expedidor, ');
        add('Data_Emissao_RG = T.Data_Emissao_RG, CNPJ = T.CNPJ, Insc_Estadual_Municipal = T.Insc_Estadual_Municipal,');
        add('Numero = T.Numero, Referencia = T.Referencia, ');
        add('Codigo_Setor = T.Codigo_Setor, Codigo_Cidade = T.Codigo_Cidade, Telefone = T.Telefone,');
        add('Celular = T.Celular, Email = T.Email, Site = T.Site, Data_Cadastro = T.Data_Cadastro, Observacoes = T.Observacoes,');
        add('Endereco = T.Endereco, CEP = T.CEP');
        add('from ' + serv + '.dbo.Fornecedor T'); // servidor
        add('where T.Codigo = Fornecedor.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\AForn' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DForn' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Fornecedor');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Fornecedor T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DForn' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Fornecedor: ' + E.Message);
    end;
  end;

  try
    // Grupo_Cliente
    if (FileExists(caminho_servidor + '\Atualizações\IGCli' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Grupo_Cliente from '+serv+'.dbo.Grupo_Cliente');
        // ExecSQL;
        add('SET IDENTITY_INSERT Grupo_Cliente ON');
        ExecSQL;
        add('Insert into Grupo_Cliente(Codigo, Descricao, Data_Cadastro)');
        add(' select * from ' + serv + '.dbo.Grupo_Cliente T');
        add('where T.Codigo not in(select Grupo_Cliente.Codigo from Grupo_Cliente)');
        ExecSQL;
        add('SET IDENTITY_INSERT Grupo_Cliente OFF');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\IGCli' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\AGCli' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Grupo_Cliente set Descricao = T.Descricao');
        add('from ' + serv + '.dbo.Grupo_Cliente T'); // servidor
        add('where T.Codigo = Grupo_Cliente.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\AGCli' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DGCli' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Grupo_Cliente');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Grupo_Cliente T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DGCli' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Grupo_Cliente: ' + E.Message);
    end;
  end;

  try
    // Localidade_Produto
    if (FileExists(caminho_servidor + '\Atualizações\ILP' + maq + '.txt')) then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Localidade_Produto from '+serv+'.dbo.Localidade_Produto');
        // ExecSQL;
        add('SET IDENTITY_INSERT Localidade_Produto ON');
        ExecSQL;
        add('Insert into Localidade_Produto(Codigo, Codigo_Empresa, Local, Data_Cadastro)');
        add(' select * from ' + serv + '.dbo.Localidade_Produto T');
        add('where T.Codigo not in(select Localidade_Produto.Codigo from Localidade_Produto)');
        ExecSQL;
        add('SET IDENTITY_INSERT Localidade_Produto OFF');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ILP' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\ALP' + maq + '.txt')) then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Localidade_Produto set Codigo_Empresa = T.Codigo_Empresa, Local = T.Local');
        add('from ' + serv + '.dbo.Localidade_Produto T'); // servidor
        add('where T.Codigo = Localidade_Produto.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ALP' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DLP' + maq + '.txt')) then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Localidade_Produto');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Localidade_Produto T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DLP' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Localidade_Produto: ' + E.Message);
    end;
  end;

  try
    // Logradouro
    if (FileExists(caminho_servidor + '\Atualizações\ILog' + maq + '.txt')) then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Logradouro from '+serv+'.dbo.Logradouro');
        // ExecSQL;
        add('SET IDENTITY_INSERT Logradouro ON');
        ExecSQL;
        add('Insert into Logradouro(Codigo, Descricao, Tipo_Logradouro, CEP, Data_Cadastro)');
        add(' select * from ' + serv + '.dbo.Logradouro T');
        add('where T.Codigo not in(select Logradouro.Codigo from Logradouro)');
        ExecSQL;
        add('SET IDENTITY_INSERT Logradouro OFF');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ILog' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\ALog' + maq + '.txt')) then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Logradouro set Descricao = T.Descricao, Tipo_Logradouro = T.Tipo_Logradouro, CEP = T.CEP');
        add('from ' + serv + '.dbo.Logradouro T'); // servidor
        add('where T.Codigo = Logradouro.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ALog' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DLog' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Logradouro');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Logradouro T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DLog' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Logradouro: ' + E.Message);
    end;
  end;

  try
    // Marca
    if (FileExists(caminho_servidor + '\Atualizações\IM' + maq + '.txt')) then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Marca from '+serv+'.dbo.Marca');
        // ExecSQL;
        add('SET IDENTITY_INSERT Marca ON');
        ExecSQL;
        add('Insert into Marca(Codigo, Descricao, Data_Cadastro)');
        add(' select * from ' + serv + '.dbo.Marca T');
        add('where T.Codigo not in(select Marca.Codigo from Marca)');
        ExecSQL;
        add('SET IDENTITY_INSERT Marca OFF');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\IM' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\AM' + maq + '.txt')) then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Marca set Descricao = T.Descricao');
        add('from ' + serv + '.dbo.Marca T'); // servidor
        add('where T.Codigo = Marca.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\AM' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DM' + maq + '.txt')) then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Marca');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Marca T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DM' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Marca: ' + E.Message);
    end;
  end;

  try
    // Regra_COFINS
    if (FileExists(caminho_servidor + '\Atualizações\IRCOFINS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Regra_COFINS from '+serv+'.dbo.Regra_COFINS');
        // ExecSQL;
        add('SET IDENTITY_INSERT Regra_COFINS ON');
        ExecSQL;
        add('Insert into Regra_COFINS(Codigo, Data_Cadastro, Descricao, Aliquota, Tipo_Calculo, Tipo_Recolhimento, ');
        add('Base_Reduzida, Percentual_BC_Reduzida, Base_Acrescida, Percentual_BC_Acrescida, Codigo_Situacao_Tributaria)');
        add(' select * from ' + serv + '.dbo.Regra_COFINS T');
        add('where T.Codigo not in(select Regra_COFINS.Codigo from Regra_COFINS)');
        ExecSQL;
        add('SET IDENTITY_INSERT Regra_COFINS OFF');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\IRCOFINS' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\ARCOFINS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Regra_COFINS set Descricao = T.Descricao, Aliquota = T.Aliquota, Tipo_Calculo = T.Tipo_Calculo,');
        add('Tipo_Recolhimento = T.Tipo_Recolhimento, Base_Reduzida = T.Base_Reduzida, Percentual_BC_Reduzida = T.Percentual_BC_Reduzida,');
        add('Base_Acrescida = T.Base_Acrescida, Percentual_BC_Acrescida = T.Percentual_BC_Acrescida, Codigo_Situacao_Tributaria = T.Codigo_Situacao_Tributaria');
        add('from ' + serv + '.dbo.Regra_COFINS T'); // servidor
        add('where T.Codigo = Regra_COFINS.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ARCOFINS' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DRCOFINS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Regra_COFINS');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Regra_COFINS T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DRCOFINS' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Regra_Cofins: ' + E.Message);
    end;
  end;

  try
    // RICMS
    if (FileExists(caminho_servidor + '\Atualizações\IRICMS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Regra_ICMS from '+serv+'.dbo.Regra_ICMS');
        // ExecSQL;
        add('SET IDENTITY_INSERT Regra_ICMS ON');
        ExecSQL;
        add('Insert into Regra_ICMS(Codigo, Data_Cadastro, Descricao, Aliquota, Tipo_Recolhimento, Tipo_Calculo_BC_ICMS,');
        add('Tipo_Calculo_BC_ICMS_ST, Base_Reduzida, Percentual_BC_Reduzida, Base_Acrescida, Percentual_BC_Acrescida, Codigo_Situacao_Tributaria,');
        add('CFOP_D, CFOP_F)');
        add(' select * from ' + serv + '.dbo.Regra_ICMS T');
        add('where T.Codigo not in(select Regra_ICMS.Codigo from Regra_ICMS)');
        ExecSQL;
        add('SET IDENTITY_INSERT Regra_ICMS OFF');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\IRICMS' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\ARICMS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Regra_ICMS set Descricao = T.Descricao, Aliquota = T.Aliquota, Tipo_Recolhimento = T.Tipo_Recolhimento, Tipo_Calculo_BC_ICMS = T.Tipo_Calculo_BC_ICMS,');
        add('Tipo_Calculo_BC_ICMS_ST = T.Tipo_Calculo_BC_ICMS_ST, Base_Reduzida = T.Base_Reduzida, Percentual_BC_Reduzida = T.Percentual_BC_Reduzida,');
        add('Base_Acrescida = T.Base_Acrescida, Percentual_BC_Acrescida = T.Percentual_BC_Acrescida, Codigo_Situacao_Tributaria = T.Codigo_Situacao_Tributaria,');
        add('CFOP_D = T.CFOP_D, CFOP_F = T.CFOP_F');
        add('from ' + serv + '.dbo.Regra_ICMS T'); // servidor
        add('where T.Codigo = Regra_ICMS.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ARICMS' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DRICMS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Regra_ICMS');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Regra_ICMS T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DRICMS' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Regra_ICMS: ' + E.Message);
    end;
  end;

  try
    // Regra_IPI
    if (FileExists(caminho_servidor + '\Atualizações\IRIPI' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Regra_IPI from '+serv+'.dbo.Regra_IPI');
        // ExecSQL;
        add('SET IDENTITY_INSERT Regra_IPI ON');
        ExecSQL;
        add('Insert into Regra_IPI(Codigo, Data_Cadastro, Descricao, Aliquota, Tipo_Calculo, Tipo_Recolhimento, ');
        add('Base_Reduzida, Percentual_BC_Reduzida, Base_Acrescida, Percentual_BC_Acrescida, Codigo_Situacao_Tributaria)');
        add(' select * from ' + serv + '.dbo.Regra_IPI T');
        add('where T.Codigo not in(select Regra_IPI.Codigo from Regra_IPI)');
        ExecSQL;
        add('SET IDENTITY_INSERT Regra_IPI OFF');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\IRIPI' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\ARIPI' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Regra_IPI set Descricao = T.Descricao, Aliquota = T.Aliquota, Tipo_Calculo = T.Tipo_Calculo,');
        add('Tipo_Recolhimento = T.Tipo_Recolhimento, Base_Reduzida = T.Base_Reduzida, Percentual_BC_Reduzida = T.Percentual_BC_Reduzida,');
        add('Base_Acrescida = T.Base_Acrescida, Percentual_BC_Acrescida = T.Percentual_BC_Acrescida, Codigo_Situacao_Tributaria = T.Codigo_Situacao_Tributaria');
        add('from ' + serv + '.dbo.Regra_IPI T'); // servidor
        add('where T.Codigo = Regra_IPI.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ARIPI' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DRIPI' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Regra_IPI');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Regra_IPI T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DRIPI' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Regra_IPI: ' + E.Message);
    end;
  end;

  try
    // Regra_ISS
    if (FileExists(caminho_servidor + '\Atualizações\IRISS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Regra_ISSQN from '+serv+'.dbo.Regra_ISSQN');
        // ExecSQL;
        add('SET IDENTITY_INSERT Regra_ISSQN ON');
        ExecSQL;
        add('Insert into Regra_ISSQN(Codigo, Data_Cadastro, Descricao, Aliquota, Tributacao,  ');
        add('Base_Reduzida, Percentual_BC_Reduzida, Base_Acrescida, Percentual_BC_Acrescida, Codigo_Situacao_Tributaria)');
        add(' select * from ' + serv + '.dbo.Regra_ISSQN T');
        add('where T.Codigo not in(select Regra_ISSQN.Codigo from Regra_ISSQN)');
        ExecSQL;
        add('SET IDENTITY_INSERT Regra_ISSQN OFF');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\IRISS' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\ARISS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Regra_ISSQN set Descricao = T.Descricao, Aliquota = T.Aliquota, Tributacao = T.Tributacao,');
        add('Base_Reduzida = T.Base_Reduzida, Percentual_BC_Reduzida = T.Percentual_BC_Reduzida,');
        add('Base_Acrescida = T.Base_Acrescida, Percentual_BC_Acrescida = T.Percentual_BC_Acrescida, Codigo_Situacao_Tributaria = T.Codigo_Situacao_Tributaria');
        add('from ' + serv + '.dbo.Regra_ISSQN T'); // servidor
        add('where T.Codigo = Regra_ISSQN.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ARISS' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DRISS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Regra_ISSQN');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Regra_ISSQN T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DRISS' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Regra_ISSQN: ' + E.Message);
    end;
  end;

  try
    // Regra_PIS
    if (FileExists(caminho_servidor + '\Atualizações\IRPIS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Regra_PIS from '+serv+'.dbo.Regra_PIS');
        // ExecSQL;
        add('SET IDENTITY_INSERT Regra_PIS ON');
        ExecSQL;
        add('Insert into Regra_PIS(Codigo, Data_Cadastro, Descricao, Aliquota, Tipo_Calculo, Tipo_Recolhimento,');
        add('Base_Reduzida, Percentual_BC_Reduzida, Base_Acrescida, Percentual_BC_Acrescida, Codigo_Situacao_Tributaria)');
        add(' select * from ' + serv + '.dbo.Regra_PIS T');
        add('where T.Codigo not in(select Regra_PIS.Codigo from Regra_PIS)');
        ExecSQL;
        add('SET IDENTITY_INSERT Regra_PIS OFF');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\IRPIS' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\ARPIS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Regra_PIS set Descricao = T.Descricao, Aliquota = T.Aliquota, Tipo_Calculo = T.Tipo_Calculo,');
        add('Tipo_Recolhimento = T.Tipo_Recolhimento, Base_Reduzida = T.Base_Reduzida, Percentual_BC_Reduzida = T.Percentual_BC_Reduzida,');
        add('Base_Acrescida = T.Base_Acrescida, Percentual_BC_Acrescida = T.Percentual_BC_Acrescida, Codigo_Situacao_Tributaria = T.Codigo_Situacao_Tributaria');
        add('from ' + serv + '.dbo.Regra_PIS T'); // servidor
        add('where T.Codigo = Regra_PIS.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ARPIS' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DRPIS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Regra_PIS');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Regra_PIS T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DRPIS' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Regra_PIS: ' + E.Message);
    end;
  end;

  try
    // Setor
    if (FileExists(caminho_servidor + '\Atualizações\ISet' + maq + '.txt')) then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Setor from '+serv+'.dbo.Setor');
        // ExecSQL;
        add('SET IDENTITY_INSERT Setor ON');
        ExecSQL;
        add('Insert into Setor(Codigo, Descricao, Data_Cadastro)');
        add(' select * from ' + serv + '.dbo.Setor T');
        add('where T.Codigo not in(select Setor.Codigo from Setor)');
        ExecSQL;
        add('SET IDENTITY_INSERT Setor OFF');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ISet' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\ASet' + maq + '.txt')) then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Setor set Descricao = T.Descricao');
        add('from ' + serv + '.dbo.Setor T'); // servidor
        add('where T.Codigo = Setor.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ASet' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DSet' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Setor');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Setor T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DSet' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Setor: ' + E.Message);
    end;
  end;

  try
    // Tabela_Preco
    if (FileExists(caminho_servidor + '\Atualizações\ITPr' + maq + '.txt')) then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Insert into Tabela_Preco select * from ' + serv +
          '.dbo.Tabela_Preco T');
        add('where T.Codigo not in(select Tabela_Preco.Codigo from Tabela_Preco)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ITPr' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\ATPr' + maq + '.txt')) then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Tabela_Preco set Codigo_Empresa = T.Codigo_Empresa, Descricao = T.Descricao, Data_Validade = T.Data_Validade,');
        add('Tipo = T.Tipo, Tipo_Calculo = T.Tipo_Calculo, Percentual_Vista = T.Percentual_Vista, Percentual_Prazo = T.Percentual_Prazo,');
        add('Atalho = T.Atalho, Tipo_Valor = T.Tipo_Valor');
        add('from ' + serv + '.dbo.Tabela_Preco T'); // servidor
        add('where T.Codigo = Tabela_Preco.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ATPr' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DTPr' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Tabela_Preco');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Tabela_Preco T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DTPr' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Tabela_Preco: ' + E.Message);
    end;
  end;

  try
    // Itens_Tabela_Preco

    if (FileExists(caminho_servidor + '\Atualizações\IITPr' + maq + '.txt'))
    then
    begin
      if (FrmChama_Produto = nil) then
      begin
        with qAux, SQL do
        begin
          close;
          Connection := DM.ADOConnectionLocal;
          clear;
          // add('select * into Itens_Tabela_Preco from '+serv+'.dbo.Itens_Tabela_Preco');
          // ExecSQL;
          add('SET IDENTITY_INSERT Itens_Tabela_Preco ON');
          ExecSQL;
          { add('Insert into Itens_Tabela_Preco(Codigo_Registro, Codigo, Codigo_Produto, Preco_Vista, Preco_Prazo, Percentual_Desconto_Vista,');
            add('Percentual_Desconto_Prazo, Percentual_Lucro_Vista, Percentual_Lucro_Prazo) select * from '+serv+'.dbo.Itens_Tabela_Preco as T');  //atualiza os produtos que estão no servidor

            add('where ( CONVERT(varchar(5), T.Codigo) + CONVERT(varchar(5), T.Codigo_Produto) ) ');
            add('not in (select CONVERT(varchar(5), T.Codigo) + CONVERT(varchar(5), T.Codigo_Produto) from Itens_Tabela_Preco T)');
          }
          add('Insert into Itens_Tabela_Preco(Codigo_Registro, Codigo, Codigo_Produto, Preco_Vista, Preco_Prazo, Percentual_Desconto_Vista,');
          add('Percentual_Desconto_Prazo, Percentual_Lucro_Vista, Percentual_Lucro_Prazo, Percentual_Comissao_Vista, Percentual_Comissao_Prazo) select * from '
            + serv + '.dbo.Itens_Tabela_Preco as T');
          // atualiza os produtos que estão no servidor
          add('where not exists (select J.Codigo from Itens_Tabela_Preco J where T.Codigo = J.Codigo and T.Codigo_Produto = J.Codigo_Produto)');

          // add('where P.Codigo_Produto not in (select Itens_Tabela_Preco.Codigo_Produto from Itens_Tabela_Preco) ');  //para a estação

          ExecSQL;
          add('SET IDENTITY_INSERT Itens_Tabela_Preco OFF');
          ExecSQL;
        end;
        DeleteFile(caminho_servidor + '\Atualizações\IITPr' + maq + '.txt');
        Atualiza_Produto(4, '');
      end;
    end;

    if (FileExists(caminho_servidor + '\Atualizações\AITPr' + maq + '.txt'))
    then
    begin
      if (FrmChama_Produto = nil) then
      begin
        with qAux, SQL do
        begin
          close;
          Connection := DM.ADOConnectionLocal;
          clear;
          add('update Itens_Tabela_Preco set Preco_Vista = T.Preco_Vista, Preco_Prazo = T.Preco_Prazo, Percentual_Desconto_Vista = T.Percentual_Desconto_Vista,');
          add('Percentual_Desconto_Prazo = T.Percentual_Desconto_Prazo, Percentual_Lucro_Vista = T.Percentual_Lucro_Vista, Percentual_Lucro_Prazo = T.Percentual_Lucro_Prazo,');
          add('Percentual_Comissao_Vista = T.Percentual_Comissao_Vista, Percentual_Comissao_Prazo = T.Percentual_Comissao_Prazo');
          add('from ' + serv + '.dbo.Itens_Tabela_Preco T'); // servidor
          add('where T.Codigo = Itens_Tabela_Preco.Codigo and T.Codigo_Produto = Itens_Tabela_Preco.Codigo_Produto');
          ExecSQL;
        end;
        DeleteFile(caminho_servidor + '\Atualizações\AITPr' + maq + '.txt');
        Atualiza_Produto(4, '');
      end;
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DITPr' + maq + '.txt'))
    then
    begin
      if (FrmChama_Produto = nil) then
      begin
        with qAux, SQL do
        begin
          close;
          /// /voltar aqui e conferir
          Connection := DM.ADOConnectionLocal;
          clear;
          add('Delete from Itens_Tabela_Preco');
          add('where ( CONVERT(varchar(3), Codigo) + (CONVERT(varchar(3), Codigo_Produto))) not in( select CONVERT(varchar(3), T.Codigo) + CONVERT(varchar(3), T.Codigo_Produto) from '
            + serv + '.dbo.Itens_Tabela_Preco T)');
          ExecSQL;
        end;
        DeleteFile(caminho_servidor + '\Atualizações\DITPr' + maq + '.txt');
        Atualiza_Produto(4, '');
      end;
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Itens_Tabela_Preco: ' + E.Message);
    end;
  end;

  try
    // Tratamento_COFINS
    if (FileExists(caminho_servidor + '\Atualizações\ITCOFINS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Insert into Tratamento_COFINS select * from ' + serv +
          '.dbo.Tratamento_COFINS T');
        add('where T.Codigo not in(select Tratamento_COFINS.Codigo from Tratamento_COFINS)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ITCOFINS' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\ATCOFINS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Tratamento_COFINS set Descricao = T.Descricao');
        add('from ' + serv + '.dbo.Tratamento_COFINS T'); // servidor
        add('where T.Codigo = Tratamento_COFINS.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ATCOFINS' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DTCOFINS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Tratamento_COFINS');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Tratamento_COFINS T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DTCOFINS' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Tratamento_COFINS: ' + E.Message);
    end;
  end;

  try
    // Itens_Tratamento_COFINS
    if (FileExists(caminho_servidor + '\Atualizações\IITCOFINS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Insert into Itens_Tratamento_COFINS select * from ' + serv +
          '.dbo.Itens_Tratamento_COFINS T');
        add('where T.Codigo not in(select Itens_Tratamento_COFINS.Codigo from Itens_Tratamento_COFINS)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\IITCOFINS' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\AITCOFINS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Itens_Tratamento_COFINS set Entrada_Regra_EN = T.Entrada_Regra_EN, Entrada_Regra_EPP = T.Entrada_Regra_EPP,');
        add('Entrada_Regra_ME = T.Entrada_Regra_ME, Saida_Regra_EN = T.Saida_Regra_EN, Saida_Regra_EPP = T.Saida_Regra_EPP, Saida_Regra_ME = T.Saida_Regra_ME');
        add('from ' + serv + '.dbo.Itens_Tratamento_COFINS T'); // servidor
        add('where T.Codigo = Itens_Tratamento_COFINS.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\AITCOFINS' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DITCOFINS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Itens_Tratamento_COFINS');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Itens_Tratamento_COFINS T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DITCOFINS' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Itens_Tratamento_COFINS: ' + E.Message);
    end;
  end;

  try
    // Tratamento_ICMS
    if (FileExists(caminho_servidor + '\Atualizações\ITICMS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Insert into Tratamento_ICMS select * from ' + serv +
          '.dbo.Tratamento_ICMS T');
        add('where T.Codigo not in(select Tratamento_ICMS.Codigo from Tratamento_ICMS)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ITICMS' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\ATICMS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Tratamento_ICMS set Descricao = T.Descricao');
        add('from ' + serv + '.dbo.Tratamento_ICMS T'); // servidor
        add('where T.Codigo = Tratamento_ICMS.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ATICMS' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DTICMS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Tratamento_ICMS');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Tratamento_ICMS T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DTICMS' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Tratamento_ICMS: ' + E.Message);
    end;
  end;

  try
    // Itens_Tratamento_ICMS
    if (FileExists(caminho_servidor + '\Atualizações\IITICMS' + maq + '.txt'))
    then
    begin
      { with qAux, sql do
        begin
        close;
        Connection:= dm.ADOConnectionLocal;
        clear;
        add('Insert into Itens_Tratamento_ICMS select * from '+serv+'.dbo.Itens_Tratamento_ICMS T');
        add('where T.Codigo not in(select Itens_Tratamento_ICMS.Codigo from Itens_Tratamento_ICMS)');
        ExecSQL;
        end; }
      Insere_Tratamento_ICMS;
      DeleteFile(caminho_servidor + '\Atualizações\IITICMS' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\AITICMS' + maq + '.txt'))
    then
    begin
      { with qAux, sql do
        begin
        close;
        Connection:= dm.ADOConnectionLocal;
        clear;
        add('update Itens_Tratamento_ICMS set Origem = T.Origem, Destino = T.Destino, Entrada_Regra_EN = T.Entrada_Regra_EN, Entrada_Regra_EPP = T.Entrada_Regra_EPP,');
        add('Entrada_Regra_ME = T.Entrada_Regra_ME, Saida_Regra_EN = T.Saida_Regra_EN, Saida_Regra_EPP = T.Saida_Regra_EPP, Saida_Regra_ME = T.Saida_Regra_ME');
        add('from '+serv+'.dbo.Itens_Tratamento_ICMS T');          //servidor
        add('where T.Codigo = Itens_Tratamento_ICMS.Codigo and T.Origem = Itens_Tratamento_ICMS.Origem and T.Destino = Itens_Tratamento_ICMS.Destino');
        ExecSQL;
        end; }
      Insere_Tratamento_ICMS;
      DeleteFile(caminho_servidor + '\Atualizações\AITICMS' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DITICMS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close; // voltar e conferir
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Itens_Tratamento_ICMS');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Itens_Tratamento_ICMS T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DITICMS' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Itens_Tratamento_ICMS: ' + E.Message);
    end;
  end;

  try
    // Tratamento_IPI
    if (FileExists(caminho_servidor + '\Atualizações\ITIPI' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Insert into Tratamento_IPI select * from ' + serv +
          '.dbo.Tratamento_IPI T');
        add('where T.Codigo not in(select Tratamento_IPI.Codigo from Tratamento_IPI)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ITIPI' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\ATIPI' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Tratamento_IPI set Descricao = T.Descricao');
        add('from ' + serv + '.dbo.Tratamento_IPI T'); // servidor
        add('where T.Codigo = Tratamento_IPI.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ATIPI' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DTIPI' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Tratamento_IPI');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Tratamento_IPI T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DTIPI' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Tratamento_IPI: ' + E.Message);
    end;
  end;

  try
    // Itens_Tratamento_IPI
    if (FileExists(caminho_servidor + '\Atualizações\IITIPI' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Insert into Itens_Tratamento_IPI select * from ' + serv +
          '.dbo.Itens_Tratamento_IPI T');
        add('where T.Codigo not in(select Itens_Tratamento_IPI.Codigo from Itens_Tratamento_IPI)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\IITIPI' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\AITIPI' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Itens_Tratamento_IPI set Entrada_Regra_EN = T.Entrada_Regra_EN, Entrada_Regra_EPP = T.Entrada_Regra_EPP,');
        add('Entrada_Regra_ME = T.Entrada_Regra_ME, Saida_Regra_EN = T.Saida_Regra_EN, Saida_Regra_EPP = T.Saida_Regra_EPP, Saida_Regra_ME = T.Saida_Regra_ME');
        add('from ' + serv + '.dbo.Itens_Tratamento_IPI T'); // servidor
        add('where T.Codigo = Itens_Tratamento_IPI.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\AITIPI' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DITIPI' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Itens_Tratamento_IPI');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Itens_Tratamento_IPI T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DITIPI' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Itens_Tratamento_IPI: ' + E.Message);
    end;
  end;

  try
    // Tratamento_PIS
    if (FileExists(caminho_servidor + '\Atualizações\ITPIS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Insert into Tratamento_PIS select * from ' + serv +
          '.dbo.Tratamento_PIS T');
        add('where T.Codigo not in(select Tratamento_PIS.Codigo from Tratamento_PIS)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ITPIS' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\ATPIS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Tratamento_PIS set Descricao = T.Descricao');
        add('from ' + serv + '.dbo.Tratamento_PIS T'); // servidor
        add('where T.Codigo = Tratamento_PIS.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\ATPIS' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DTPIS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Tratamento_PIS');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Tratamento_PIS T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DTPIS' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Tratamento_PIS: ' + E.Message);
    end;
  end;

  try
    // Itens_Tratamento_PIS
    if (FileExists(caminho_servidor + '\Atualizações\IITPIS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Insert into Itens_Tratamento_PIS select * from ' + serv +
          '.dbo.Itens_Tratamento_PIS T');
        add('where T.Codigo not in(select Itens_Tratamento_PIS.Codigo from Itens_Tratamento_PIS)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\IITPIS' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\AITPIS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Itens_Tratamento_PIS set Entrada_Regra_EN = T.Entrada_Regra_EN, Entrada_Regra_EPP = T.Entrada_Regra_EPP,');
        add('Entrada_Regra_ME = T.Entrada_Regra_ME, Saida_Regra_EN = T.Saida_Regra_EN, Saida_Regra_EPP = T.Saida_Regra_EPP, Saida_Regra_ME = T.Saida_Regra_ME');
        add('from ' + serv + '.dbo.Itens_Tratamento_PIS T'); // servidor
        add('where T.Codigo = Itens_Tratamento_PIS.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\AITPIS' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DITPIS' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Itens_Tratamento_PIS');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Itens_Tratamento_PIS T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DITPIS' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Itens_Tratamento_PIS: ' + E.Message);
    end;
  end;

  try
    // Unidade_Medida
    if (FileExists(caminho_servidor + '\Atualizações\IUM' + maq + '.txt')) then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // ExecSQL;
        add('SET IDENTITY_INSERT Unidade_Medida ON');
        ExecSQL;
        add('Insert into Unidade_Medida(Codigo, Sigla, Descricao, Data_Cadastro)');
        add(' select * from ' + serv + '.dbo.Unidade_Medida T');
        add('where T.Codigo not in(select Unidade_Medida.Codigo from Unidade_Medida)');
        ExecSQL;
        add('SET IDENTITY_INSERT Unidade_Medida OFF');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\IUM' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\AUM' + maq + '.txt')) then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Unidade_Medida set Sigla = T.Sigla, Descricao = T.Descricao');
        add('from ' + serv + '.dbo.Unidade_Medida T'); // servidor
        add('where T.Codigo = Unidade_Medida.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\AUM' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DUM' + maq + '.txt')) then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Unidade_Medida');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Unidade_Medida T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DUM' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Unidade_Medida: ' + E.Message);
    end;
  end;

  try
    // Grupo_Produto
    if (FileExists(caminho_servidor + '\Atualizações\IGProd' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Unidade_Medida from '+serv+'.dbo.Unidade_Medida');
        // ExecSQL;
        add('SET IDENTITY_INSERT Grupo_Produto ON');
        ExecSQL;
        add('Insert into Grupo_Produto(Codigo, Descricao, Codigo_Grupo_ICMS, Codigo_Grupo_IPI, Codigo_Grupo_PIS, Codigo_Grupo_COFINS, ');
        add('Percentual_Vista, Percentual_Prazo, Percentual_Desconto_Vista, Percentual_Desconto_Prazo, Data_Cadastro, Codigo_Sub_Grupo, Sub_Grupo, Codigo_Pai, Percentual_Comissao_Vista, Percentual_Comissao_Prazo)');
        add(' select * from ' + serv + '.dbo.Grupo_Produto T');
        add('where T.Codigo not in(select Grupo_Produto.Codigo from Grupo_Produto)');
        ExecSQL;
        add('SET IDENTITY_INSERT Grupo_Produto OFF');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\IGProd' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\AGProd' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Grupo_Produto set Descricao = T.Descricao, Codigo_Grupo_ICMS = T.Codigo_Grupo_ICMS, Codigo_Grupo_IPI = T.Codigo_Grupo_IPI,');
        add('Codigo_Grupo_PIS = T.Codigo_Grupo_PIS, Codigo_Grupo_COFINS = T.Codigo_Grupo_COFINS, Percentual_Vista = T.Percentual_Vista,');
        add('Percentual_Prazo = T.Percentual_Prazo, Percentual_Desconto_Vista = T.Percentual_Desconto_Vista, Percentual_Desconto_Prazo = T.Percentual_Desconto_Prazo, ');
        add('Codigo_Sub_Grupo = T.Codigo_Sub_Grupo, Sub_Grupo = T.Sub_Grupo, Codigo_Pai = T.Codigo_Pai, Percentual_Comissao_Vista = T.Percentual_Comissao_Vista, Percentual_Comissao_Prazo = T.Percentual_Comissao_Prazo');
        add('from ' + serv + '.dbo.Grupo_Produto T'); // servidor
        add('where T.Codigo = Grupo_Produto.Codigo');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\AGProd' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DGProd' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Grupo_Produto');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Grupo_Produto T)');
        ExecSQL;
      end;
      DeleteFile(caminho_servidor + '\Atualizações\DGProd' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Grupo_Produto: ' + E.Message);
    end;
  end;

  try
    // Produto
    if (FileExists(caminho_servidor + '\Atualizações\IProd' + maq + '.txt'))
    then
    begin
      if (FrmChama_Produto = nil) then
      begin
        with qAux, SQL do
        begin
          close;
          Connection := DM.ADOConnectionLocal;
          clear;
          add('Insert into Produto select * from ' + serv +
            '.dbo.Produto as P'); // atualiza os produtos que estão no servidor
          add('where P.Codigo not in (select Produto.Codigo from Produto) ');
          // para a estação
          ExecSQL;
        end;

        Atualiza_Produto(4, '');

        DeleteFile(caminho_servidor + '\Atualizações\IProd' + maq + '.txt');
      end;
    end;

    if (FileExists(caminho_servidor + '\Atualizações\AProd' + maq + '.txt'))
    then
    begin
      if (FrmChama_Produto = nil) then
      begin
        with qAux, SQL do
        begin
          close;
          Connection := DM.ADOConnectionLocal;
          clear;
          add('update Produto set Tipo = T.Tipo, Codigo_Empresa = T.Codigo_Empresa, Status = T.Status, ');
          add('Gera_Comissao = T.Gera_Comissao, Aceita_Devolucao = T.Aceita_Devolucao, Arred_Trunc = T.Arred_Trunc, Producao_Propria = T.Producao_Propria, ');
          add('Codigo_Original = T.Codigo_Original, Codigo_Venda = T.Codigo_Venda, Descricao = T.Descricao, Codigo_Barra = T.Codigo_Barra, ');
          add('Codigo_Fornecedor = T.Codigo_Fornecedor, Codigo_Fabricante = T.Codigo_Fabricante, Codigo_Marca = T.Codigo_Marca, ');
          add('Codigo_Unidade_Medida = T.Codigo_Unidade_Medida, Codigo_Unidade_Volume = T.Codigo_Unidade_Volume,');
          add('Codigo_Grupo = T.Codigo_Grupo, Codigo_Grupo_Tributacao = T.Codigo_Grupo_Tributacao, ');
          add('Codigo_Grupo_Tributacao_IPI = T.Codigo_Grupo_Tributacao_IPI,');
          add('Codigo_Grupo_Tributacao_PIS = T.Codigo_Grupo_Tributacao_PIS,');
          add('Codigo_Grupo_Tributacao_COFINS = T.Codigo_Grupo_Tributacao_COFINS,');
          add('Codigo_Grupo_Tributacao_ISSQN = T.Codigo_Grupo_Tributacao_ISSQN,');
          add('Codigo_Local = T.Codigo_Local, Data_Fabricacao = T.Data_Fabricacao,');
          add('Data_Validade = T.Data_Validade, Ultima_Compra = T.Ultima_Compra, Ultima_Venda = T.Ultima_Venda,');
          add('Valor_Compra = T.Valor_Compra, Valor_Medio = T.Valor_Medio, Saldo_Estoque = T.Saldo_Estoque, ');
          add('Valor_Ultima_Compra = T.Valor_Ultima_Compra, ');
          add('Estoque_Maximo = T.Estoque_Maximo, Estoque_Minimo = T.Estoque_Minimo, Estoque = T.Estoque, Estoque_Reservado = T.Estoque_Reservado, Volume = T.Volume, Volume_Total = T.Volume_Total, ');
          add('Em_Estoque_Maximo = T.Em_Estoque_Maximo, Em_Estoque_Minimo = T.Em_Estoque_Minimo, Data_Cadastro = T.Data_Cadastro, Data_Atualizacao_Estoque = T.Data_Atualizacao_Estoque,');
          add('Status_Estoque_Data = T.Status_Estoque_Data, NCM = T.NCM, Aplicacao = T.Aplicacao, Codigo_Similar = T.Codigo_Similar,');
          add('Valor_Compra_Unitario = T.Valor_Compra_Unitario, Valor_Ultima_Compra_Unitario = T.Valor_Ultima_Compra_Unitario, MD5 = T.MD5, MD52 = T.MD52');
          add('from ' + serv + '.dbo.Produto T'); // servidor
          add('where T.Codigo = Produto.Codigo');
          ExecSQL;
        end;

        Atualiza_Produto(4, '');

        DeleteFile(caminho_servidor + '\Atualizações\AProd' + maq + '.txt');
      end;
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DProd' + maq + '.txt'))
    then
    begin
      if (FrmChama_Produto = nil) then
      begin
        with qAux, SQL do
        begin
          close;
          Connection := DM.ADOConnectionLocal;
          clear;
          add('Delete from Produto');
          add('where Codigo not in( select T.Codigo from ' + serv +
            '.dbo.Produto T)');
          ExecSQL;
        end;
        Atualiza_Produto(4, '');

        DeleteFile(caminho_servidor + '\Atualizações\DProd' + maq + '.txt');
      end;
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Produto: ' + E.Message);
    end;
  end;

  { try
    //Cliente
    if (FileExists(caminho_servidor + '\Atualizações\ICli' + maq + '.txt')) then
    begin
    with qAux, sql do
    begin
    close;
    Connection:= dm.ADOConnectionLocal;
    clear;
    add('Insert into Cliente select * from '+serv+'.dbo.Cliente as T');
    add('where T.Codigo not in (select Cliente.Codigo from Cliente)');
    ExecSQL;
    end;

    dm.qrychama_cliente.Close;
    dm.qrychama_cliente.Open;

    DeleteFile(caminho_servidor + '\Atualizações\ICli' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\ACli' + maq + '.txt')) then
    begin
    with qAux, sql do
    begin
    close;
    Connection:= dm.ADOConnectionLocal;
    clear;
    add('update Cliente set Tipo = T.Tipo, Enquadramento = T.Enquadramento, Nome_Nome_Fantasia = T.Nome_Nome_Fantasia, ');
    add('Razao_Social = T.Razao_Social, CPF = T.CPF, RG = T.RG, Orgao_Expedidor = T.Orgao_Expedidor, ');
    add('Data_Emissao_RG = T.Data_Emissao_RG, CNPJ = T.CNPJ, Insc_Estadual = T.Insc_Estadual, Insc_Municipal = T.Insc_Municipal,');
    add('Numero = T.Numero, Complemento = T.Complemento, Referencia = T.Referencia, ');
    add('Codigo_Setor = T.Codigo_Setor, Codigo_Cidade = T.Codigo_Cidade, Codigo_Grupo = T.Codigo_Grupo, Suframa = T.Suframa,');
    add('Telefone = T.Telefone, Celular = T.Celular, Contato = T.Contato, Telefone_Contato = T.Telefone_Contato, Email = T.Email, ');
    add('Site = T.Site, Profissao = T.Profissao, Data_Nascimento = T.Data_Nascimento, Estado_Civil = T.Estado_Civil,');
    add('Data_Cadastro = T.Data_Cadastro, Credito = T.Credito, Limite_Credito = T.Limite_Credito, Acima_Limite_Credito = T.Acima_Limite_Credito,');
    add('Limite_Desconto = T.Limite_Desconto, Acima_Limite_Desconto = T.Acima_Limite_Desconto, Observacoes = T.Observacoes, ');
    add('Codigo_Tabela_Preco = T.Codigo_Tabela_Preco, Bloqueado = T.Bloqueado, Codigo_Usuario = T.Codigo_Usuario,');
    add('Endereco = T.Endereco, CEP = T.CEP ');
    add('from '+serv+'.dbo.Cliente T');          //servidor
    add('where T.Codigo = Cliente.Codigo');
    ExecSQL;
    end;

    dm.qrychama_cliente.Close;
    dm.qrychama_cliente.Open;

    DeleteFile(caminho_servidor + '\Atualizações\ACli' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DCli' + maq + '.txt')) then
    begin
    with qAux, sql do
    begin
    close;
    Connection:= dm.ADOConnectionLocal;
    clear;
    add('Delete from Cliente');
    add('where Codigo not in( select T.Codigo from '+serv+'.dbo.Cliente T)');
    ExecSQL;
    end;

    dm.qrychama_cliente.Close;
    dm.qrychama_cliente.Open;

    DeleteFile(caminho_servidor + '\Atualizações\DCli' + maq + '.txt');
    end;

    except on e:Exception do
    begin
    ShowMessage('Erro Cliente: '+ e.Message);
    end;
    end; }

  { try
    //Endereco_Cliente
    if (FileExists(caminho_servidor + '\Atualizações\IECli' + maq + '.txt')) then
    begin
    with qAux, sql do
    begin
    close;
    Connection:= dm.ADOConnectionLocal;
    clear;
    add('Insert into Endereco_Cliente select * from '+serv+'.dbo.Endereco_Cliente as T');
    add('where ( CONVERT(varchar(3), T.Codigo_Cliente) + (CONVERT(varchar(3), T.Codigo_Endereco)) + (CONVERT(varchar(3), T.Numero)) ) ');
    add('not in (select CONVERT(varchar(3), Endereco_Cliente.Codigo_Cliente) + CONVERT(varchar(3), Endereco_Cliente.Codigo_Endereco) + CONVERT(varchar(3), Endereco_Cliente.Numero) from Endereco_Cliente)');
    ExecSQL;
    end;
    DeleteFile(caminho_servidor + '\Atualizações\IECli' + maq + '.txt');
    end; }

  { if (FileExists(caminho_servidor + '\Atualizações\AECli' + maq + '.txt')) then
    begin
    with qAux, sql do
    begin
    close;
    Connection:= dm.ADOConnectionLocal;
    clear;
    add('update Endereco_Cliente set Codigo_Setor = T.Codigo_Setor');
    add('      ,Numero = T.Numero');
    add('      ,Complemento = T.Complemento');
    add('      ,Tipo_Endereco = T.Tipo_Endereco,');
    add('      ,Endereco = T.Endereco,');
    add('      ,CEP = T.CEP');
    add('from '+serv+'.dbo.Endereco_Cliente T');          //servidor
    add('where T.Codigo_Registro = Endereco_Cliente.Codigo_Registro');
    ExecSQL;
    end;
    DeleteFile(caminho_servidor + '\Atualizações\AECli' + maq + '.txt');
    end; }

  { if (FilesExists(caminho_servidor + '\Atualizações\DECli' + maq + '.txt')) then
    begin
    with qAux, sql do
    begin
    close;
    Connection:= dm.ADOConnectionLocal;
    clear;
    add('Delete from Endereco_Cliente');
    add('where ( CONVERT(varchar(3), Codigo_Cliente) + (CONVERT(varchar(3), Codigo_Endereco)) + (CONVERT(varchar(3), Numero)) ) not in( select CONVERT(varchar(3), T.Codigo_Cliente) + CONVERT(varchar(3), T.Codigo_Endereco) + CONVERT(varchar(3), T.Numero) from '+serv+'.dbo.Endereco_Cliente T)');
    ExecSQL;
    end;

    DeleteFile(caminho_servidor + '\Atualizações\DECli' + maq + '.txt');
    end;

    except on e:Exception do
    begin
    ShowMessage('Erro Endereco_Cliente: '+ e.Message);
    end;
    end; }

  { try
    //Telefone_Cliente
    if (FileExists(caminho_servidor + '\Atualizações\ITCli' + maq + '.txt')) then
    begin
    with qAux, sql do
    begin
    close;
    Connection:= dm.ADOConnectionLocal;
    clear;
    add('Insert into Telefone_Cliente select * from '+serv+'.dbo.Telefone_Cliente as T');
    add('where ( CONVERT(varchar(3), T.Codigo_Cliente) + (CONVERT(varchar(3), T.Codigo_Telefone)) + (CONVERT(varchar(3), T.Telefone)) ) ');
    add('not in (select CONVERT(varchar(3), Telefone_Cliente.Codigo_Cliente) + CONVERT(varchar(3), Telefone_Cliente.Codigo_Telefone) + CONVERT(varchar(3), Telefone_Cliente.Telefone) from Telefone_Cliente)');
    ExecSQL;
    end;
    DeleteFile(caminho_servidor + '\Atualizações\ITCli' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\ATCli' + maq + '.txt')) then
    begin
    with qAux, sql do
    begin
    close;
    Connection:= dm.ADOConnectionLocal;
    clear;
    add('update Telefone_Cliente set Telefone = T.Telefone');
    add('      ,Tipo = T.Tipo');
    add('from '+serv+'.dbo.Telefone_Cliente T');          //servidor
    add('where T.Codigo_Cliente = Telefone_Cliente.Codigo_Cliente and T.Codigo_Telefone = Telefone_Cliente.Codigo_Telefone');
    ExecSQL;
    end;
    DeleteFile(caminho_servidor + '\Atualizações\ATCli' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DTCli' + maq + '.txt')) then
    begin
    with qAux, sql do
    begin
    close;
    Connection:= dm.ADOConnectionLocal;
    clear;
    add('Delete from Telefone_Cliente');
    add('where ( CONVERT(varchar(3), Codigo_Cliente) + (CONVERT(varchar(3), Codigo_Telefone)) + (CONVERT(varchar(3), Telefone)) ) not in( select CONVERT(varchar(3), T.Codigo_Cliente) + CONVERT(varchar(3), T.Codigo_Telefone) + CONVERT(varchar(3), T.Telefone) from '+serv+'.dbo.Telefone_Cliente T)');
    ExecSQL;
    end;

    DeleteFile(caminho_servidor + '\Atualizações\DTCli' + maq + '.txt');
    end;

    except on e:Exception do
    begin
    ShowMessage('Erro Telefone_Cliente: '+ e.Message);
    end;
    end; }

  try
    // Condicao_Pagamento
    if (FileExists(caminho_servidor + '\Atualizações\ICondPag' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Insert into Condicao_Pagamento select * from ' + serv +
          '.dbo.Condicao_Pagamento T');
        add('where T.Codigo not in (select Condicao_Pagamento.Codigo from Condicao_Pagamento)');
        ExecSQL;
      end;

      DM.qrychama_condicao.close;
      DM.qrychama_condicao.open;

      DeleteFile(caminho_servidor + '\Atualizações\ICondPag' + maq + '.txt');
    end;

    if (FileExists(caminho_servidor + '\Atualizações\ACondPag' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('update Condicao_Pagamento set Status = T.Status, Descricao = T.Descricao, Parcela = T.Parcela,');
        add('Prazo = T.Prazo, Taxa = T.Taxa, Indice = T.Indice, Tipo_Pagamento = T.Tipo_Pagamento, Forma_Negociacao = T.Forma_Negociacao, ');
        add('TEF = T.TEF, Cheque = T.Cheque, Bandeira = T.Bandeira, Tipo_Juro = T.Tipo_Juro, Programa_Impressora = T.Programa_Impressora');
        add('from ' + serv + '.dbo.Condicao_Pagamento T'); // servidor
        add('where T.Codigo = Condicao_Pagamento.Codigo');
        ExecSQL;
      end;

      DM.qrychama_condicao.close;
      DM.qrychama_condicao.open;

      DeleteFile(caminho_servidor + '\Atualizações\ACondPag' + maq + '.txt');
    end;

    if (FilesExists(caminho_servidor + '\Atualizações\DCondPag' + maq + '.txt'))
    then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Delete from Condicao_Pagamento');
        add('where Codigo not in( select T.Codigo from ' + serv +
          '.dbo.Condicao_Pagamento T)');
        ExecSQL;
      end;

      DM.qrychama_condicao.close;
      DM.qrychama_condicao.open;

      DeleteFile(caminho_servidor + '\Atualizações\DCondPag' + maq + '.txt');
    end;

  except
    on E: Exception do
    begin
      ShowMessage('Erro Condicao_Pagamento: ' + E.Message);
    end;
  end;

end;

procedure Atualiza_Produto(CampoPesquisa: Integer; TextoPesquisa: AnsiString);
begin
  TLog.Info('--- MÉTODO ATUALIZA_PRODUTO');
  { with dm.qrychama_produto, sql do
    begin
    close;
    clear;
    add('select Pro.Codigo, Pro.Tipo, Pro.Codigo_Empresa, Pro.Status, Pro.Gera_Comissao, Pro.Aceita_Devolucao, Pro.Arred_Trunc, Pro.Producao_Propria, Pro.Codigo_Original, Pro.Codigo_Venda, Pro.Descricao,');
    add('Pro.Codigo_Barra, Pro.Codigo_Similar, Pro.Codigo_Fornecedor, Pro.Codigo_Fabricante, Pro.Codigo_Marca, Pro.Codigo_Unidade_Medida, Pro.Codigo_Unidade_Volume, Pro.Codigo_Grupo, Pro.Codigo_Grupo_Tributacao,');
    add('Pro.Codigo_Grupo_Tributacao_IPI, Pro.Codigo_Grupo_Tributacao_PIS, Pro.Codigo_Grupo_Tributacao_COFINS, Pro.Codigo_Grupo_Tributacao_ISSQN, Pro.Codigo_Local, Pro.Data_Fabricacao,');
    add('Pro.Data_Validade, Pro.Ultima_Compra, Pro.Ultima_Venda, Pro.Valor_Compra, Pro.Valor_Compra_Unitario, Pro.Valor_Ultima_Compra_Unitario, Pro.Valor_Medio, Pro.Saldo_Estoque, Pro.Valor_Ultima_Compra, Pro.Estoque_Maximo, Pro.Estoque_Minimo, Pro.Estoque,');
    add('Pro.Estoque_Reservado, Pro.Volume, Pro.Volume_Total, Pro.Em_Estoque_Maximo, Pro.Em_Estoque_Minimo, Pro.Data_Cadastro, Pro.Data_Atualizacao_Estoque, Pro.Status_Estoque_Data,');
    add('NCM, Pro.Aplicacao, Forn.Nome_Fantasia, Forn2.Nome_Fantasia as Fabricante, Mar.Descricao as Marca, UM.Sigla, UM2.Sigla as Sigla2, Gru.Descricao as Grupo_Produto, Gru.Codigo_Sub_Grupo, Gru.Codigo_Pai, ');
    add('Gru.Percentual_Vista as PVistaG, Gru.Percentual_Prazo as PPrazoG, Gru.Percentual_Desconto_Vista as PDesVistaG, Gru.Percentual_Desconto_Prazo as PDesPrazoG, TI.Descricao as Descricao_TICMS, TIPI.Descricao as Descricao_TIPI, LP.Local,');
    add('TPIS.Descricao as Descricao_TPIS, TCO.Descricao as Descricao_TCO, ITP.Preco_Vista, ITP.Preco_Prazo, ITP.Percentual_Desconto_Vista, ITP.Percentual_Desconto_Prazo,');
    add('ITP.Percentual_Lucro_Vista, ITP.Percentual_Lucro_Prazo, ITP.Percentual_Comissao_Vista, ITP.Percentual_Comissao_Prazo, RI.Aliquota, RI2.Aliquota as Aliquota_NF, RISS.Aliquota as ISS from Produto Pro');

    add('left join Fornecedor Forn on (Pro.Codigo_Fornecedor = Forn.Codigo)');
    add('left join Fornecedor Forn2 on (Pro.Codigo_Fabricante = Forn2.Codigo)');
    add('left join Marca Mar on (Pro.Codigo_Marca = Mar.Codigo)');
    add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
    add('left join Unidade_Medida UM2 on (Pro.Codigo_Unidade_Volume = UM2.Codigo)');
    add('left join Grupo_Produto Gru on (Pro.Codigo_Grupo = Gru.Codigo)');

    add('left join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
    add('left join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');

    if (enquadramento_empresa = 'EN') then
    add('left join Regra_ICMS RI on (ITI.Saida_Regra_EN = RI.Codigo)')
    else if (enquadramento_empresa = 'EPP') then
    add('left join Regra_ICMS RI on (ITI.Saida_Regra_EPP = RI.Codigo)')
    else if (enquadramento_empresa = 'ME') then
    add('left join Regra_ICMS RI on (ITI.Saida_Regra_ME = RI.Codigo)');

    add('left join Regra_ICMS RI2 on (ITI.Regra_Nao_Contribuinte = RI2.Codigo)');

    add('left join Tratamento_IPI TIPI on (Pro.Codigo_Grupo_Tributacao_IPI = TIPI.Codigo)');
    add('left join Itens_Tratamento_IPI ITIPI on (TIPI.Codigo = ITIPI.Codigo)');

    if (enquadramento_empresa = 'EN') then
    add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_EN = RIPI.Codigo)')
    else if (enquadramento_empresa = 'EPP') then
    add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_EPP = RIPI.Codigo)')
    else if (enquadramento_empresa = 'ME') then
    add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_ME = RIPI.Codigo)');

    add('left join Tratamento_COFINS TCO on (Pro.Codigo_Grupo_Tributacao_COFINS = TCO.Codigo)');
    add('left join Tratamento_PIS TPIS on (Pro.Codigo_Grupo_Tributacao_PIS = TPIS.Codigo)');

    add('left join Localidade_Produto LP on (Pro.Codigo_Local = LP.Codigo)');

    add('left join Regra_ISSQN RISS on (Pro.Codigo_Grupo_Tributacao_ISSQN = RISS.Codigo)');

    add('left join Itens_Tabela_Preco ITP on (Pro.Codigo = ITP.Codigo_Produto)');
    add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
    add('where TP.Codigo = :Codigo and Pro.Status = :Ativo order by Pro.Descricao');
    Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_ativo;
    Parameters.ParamByName('GO1').Value := uf;
    Parameters.ParamByName('GO2').Value := uf;
    Parameters.ParamByName('Ativo').Value := 'ATIVO';
    open;
    end; }
  try
    with DM.qrychama_produto, SQL do
    begin
      close;
      //Connection:= dm.ADOConnectionLocal;
      clear;
      add('select * from fProduto(:Status, :Origem, :Destino, :Tabela, :CampoPesquisa, :TextoPesquisa)');
      Parameters.ParamByName('Status').Value := 'ATIVO';
      Parameters.ParamByName('Origem').Value := UF;
      Parameters.ParamByName('Destino').Value := UF;
      Parameters.ParamByName('Tabela').Value := codigo_tabela_preco_ativo;
      Parameters.ParamByName('CampoPesquisa').Value := CampoPesquisa;
      Parameters.ParamByName('TextoPesquisa').Value := TextoPesquisa;
      open;
    end;
  except on E:Exception do
  begin
    ShowMessage('Erro em Atualiza_Produto: '+E.Message);
  end;
  end;
  TLog.Info('--- FIM MÉTODO ATUALIZA_PRODUTO');
end;

procedure Atualiza_Codigo_Tabela_Padrao(Codigo_Tabela_Padrao: Integer);
begin
  codigo_tabela_preco_ativo := Codigo_Tabela_Padrao;
  // Atualiza_Produto;
end;

function Busca_CFOP(CodigoCFOP: integer): AnsiString;
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select CFOP from Cadastro_CFOP T');

      add('where T.Codigo = :Codigo');
      Parameters.ParamByName('Codigo').Value := CodigoCFOP;
      open;
    end;
    Result:= qAux.FieldByName('CFOP').AsString;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Busca_Cadastro_CFOP(EdtCodigo, EdtDescricao, EdtDescricao2: TEdit);
var
  qAux: TADOQuery;
begin
  try
    if (EdtCodigo.Text <> '') then
    begin
      qAux := TADOQuery.Create(nil);
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select CFOP, Descricao as Campo from Cadastro_CFOP T');

        add('where T.Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
        open;

        if (IsEmpty) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
      end;

      if (qAux.IsEmpty = false) then
      begin
        EdtDescricao.Text := qAux.FieldByName('CFOP').AsString + ' - ' +
          qAux.FieldByName('Campo').AsString;
        EdtDescricao2.Text := qAux.FieldByName('CFOP').AsString;
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Busca_Cadastro_Fornecedor(EdtCodigo, EdtDescricao: TEdit;
  UF: AnsiString);
var
  qAux: TADOQuery;
begin
  try
    if (EdtCodigo.Text <> '') then
    begin
      qAux := TADOQuery.Create(nil);
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select F.Nome_Fantasia as Campo, Cid.UF as Campo2 from Fornecedor F');
        add('left join Cidade Cid on (F.Codigo_Cidade = Cid.Codigo)');

        add('where F.Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
        open;

        if (IsEmpty) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
      end;

      if (qAux.IsEmpty = false) then
      begin
        EdtDescricao.Text := qAux.FieldByName('Campo').AsString;
        FrmEntrada_Produtos.uf_destino := qAux.FieldByName('Campo2').AsString;
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Busca_Cadastro(EdtCodigo, EdtDescricao: TEdit; Tipo: Integer;
  Tabela: AnsiString);
var
  qAux: TADOQuery;
begin
  try
    if (EdtCodigo.Text <> '') then
    begin
      qAux := TADOQuery.Create(nil);
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        if (Tipo = 0) then // geral
          add('select Descricao as Campo from ' + Tabela + '')
        else if (Tipo = 1) then // cliente
          add('select Nome_Nome_Fantasia as Campo from ' + Tabela + '')
        else if (Tipo = 2) then // fornecedor
          add('select Nome_Fantasia as Campo from ' + Tabela + '')
        else if (Tipo = 3) then // local_produto
          add('select Local as Campo from ' + Tabela + '');

        add('where Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
        open;

        if (IsEmpty) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
      end;

      if (qAux.IsEmpty = false) then
      begin
        EdtDescricao.Text := qAux.FieldByName('Campo').AsString;
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Busca_Cadastro_Grupo(EdtCodigo, EdtDescricao, EdtCICMS, EdtICMS,
  EdtCIPI, EdtIPI, EdtCPIS, EdtPIS, EdtCCOFINS, EdtCOFINS, EdtDescVista,
  EdtDescPrazo, EdtComisVista, EdtComisPrazo: TEdit);
var
  qAux: TADOQuery;
begin
  try
    if (EdtCodigo.Text <> '') then
    begin
      qAux := TADOQuery.Create(nil);
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select GP.Descricao, GP.Codigo_Grupo_ICMS, GP.Codigo_Grupo_IPI, GP.Codigo_Grupo_PIS, GP.Codigo_Grupo_COFINS,');
        add('TICMS.Descricao as DICMS, TIPI.Descricao as DIPI, TPIS.Descricao as DPIS, TCO.Descricao as DCO,');
        add('GP.Percentual_Vista, GP.Percentual_Prazo, GP.Percentual_Desconto_Vista, GP.Percentual_Desconto_Prazo,');
        add('GP.Percentual_Comissao_Vista, GP.Percentual_Comissao_Prazo');
        add('from Grupo_Produto GP');
        add('left join Tratamento_ICMS TICMS on (GP.Codigo_Grupo_ICMS = TICMS.Codigo)');
        add('left join Tratamento_IPI TIPI on (GP.Codigo_Grupo_IPI = TIPI.Codigo)');
        add('left join Tratamento_PIS TPIS on (GP.Codigo_Grupo_PIS = TPIS.Codigo)');
        add('left join Tratamento_COFINS TCO on (GP.Codigo_Grupo_COFINS = TCO.Codigo)');
        add('where GP.Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
        open;

        if (IsEmpty) then
        begin
          Mensagem_Fim_Pesquisa;
          abort;
        end;
      end;

      if (qAux.IsEmpty = false) then
      begin
        EdtDescricao.Text := qAux.FieldByName('Descricao').AsString;

        EdtCICMS.Text := qAux.FieldByName('Codigo_Grupo_ICMS').AsString;
        EdtICMS.Text := qAux.FieldByName('DICMS').AsString;

        EdtCIPI.Text := qAux.FieldByName('Codigo_Grupo_IPI').AsString;
        EdtIPI.Text := qAux.FieldByName('DIPI').AsString;

        EdtCPIS.Text := qAux.FieldByName('Codigo_Grupo_PIS').AsString;
        EdtPIS.Text := qAux.FieldByName('DPIS').AsString;

        EdtCCOFINS.Text := qAux.FieldByName('Codigo_Grupo_COFINS').AsString;
        EdtCOFINS.Text := qAux.FieldByName('DCO').AsString;

        EdtDescVista.Text := qAux.FieldByName
          ('Percentual_Desconto_Vista').AsString;
        EdtDescPrazo.Text := qAux.FieldByName
          ('Percentual_Desconto_Prazo').AsString;
        EdtComisVista.Text :=
          qAux.FieldByName('Percentual_Comissao_Vista').AsString;
        EdtComisPrazo.Text :=
          qAux.FieldByName('Percentual_Comissao_Prazo').AsString;

        FrmCadastro_Produto.p_vista :=
          qAux.FieldByName('Percentual_Vista').AsFloat;
        FrmCadastro_Produto.p_prazo :=
          qAux.FieldByName('Percentual_Prazo').AsFloat;
        FrmCadastro_Produto.p_des_vista :=
          qAux.FieldByName('Percentual_Desconto_Vista').AsFloat;
        FrmCadastro_Produto.p_des_prazo :=
          qAux.FieldByName('Percentual_Desconto_Prazo').AsFloat;
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Mensagens(Form: TForm; Stb: TStatusBar; Mensagem: AnsiString);
begin
  Form.Refresh;
  Stb.Panels[4].Text := Mensagem;
  Form.Refresh;
  Sleep(100);
end;

procedure Mensagens(Form: TForm; Lbl: TLabel; Mensagem: AnsiString);
begin
  Form.Refresh;
  Lbl.Caption := Mensagem;
  Form.Refresh;
  Sleep(100);
end;

procedure Inicia_Dados_Cadastros;
var
  qAux: TADOQuery;
  serv: AnsiString;
begin
  qAux := TADOQuery.Create(nil);

  if (eservidor = '1') then
    serv := servidor + '.' + Banco
  else
    serv := Banco;

  try
    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Cadastro_Situacao_Tributaria from '+serv+'.dbo.Cadastro_Situacao_Tributaria');
        add('SET IDENTITY_INSERT Cadastro_Situacao_Tributaria ON');
        ExecSQL;
        add('Insert into Cadastro_Situacao_Tributaria(Codigo, Origem, Codigo_Situacao, Descricao, Codigo_CSOSN, ');
        add('Descricao_CSOSN, Data_Cadastro, Permite_Credito, Codigo_Obs_Fiscal) select * from '
          + serv + '.dbo.Cadastro_Situacao_Tributaria T');
        add('where T.Codigo not in(select Cadastro_Situacao_Tributaria.Codigo from Cadastro_Situacao_Tributaria)');
        ExecSQL;
        add('SET IDENTITY_INSERT Cadastro_Situacao_Tributaria OFF');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        ShowMessage('Erro em Cadastro de Situação Tributária: ' + E.Message);
      end;
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Cidade from '+serv+'.dbo.Cidade');
        add('SET IDENTITY_INSERT Cidade ON');
        ExecSQL;
        add('Insert into Cidade(Codigo, Descricao, UF, DDD, Data_Cadastro, Codigo_Municipio, Codigo_Pais)');
        add(' select * from ' + serv + '.dbo.Cidade T');
        add('where T.Codigo not in(select Cidade.Codigo from Cidade)');
        ExecSQL;
        add('SET IDENTITY_INSERT Cidade OFF');
        ExecSQL;
      end;
    except
      application.MessageBox('Erro em Cadastro de Cidade', 'Erro',
        MB_OK + MB_ICONHAND);
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Cidade from '+serv+'.dbo.Cidade');
        add('SET IDENTITY_INSERT Fornecedor ON');
        ExecSQL;
        add('Insert into Fornecedor(Codigo, Codigo_Empresa, Tipo, Nome_Fantasia, Razao_Social, CPF, RG, Orgao_Expedidor,');
        add('Data_Emissao_RG, CNPJ, Insc_Estadual_Municipal, Numero, Referencia, Codigo_Setor, Codigo_Cidade,');
        add('Telefone, Celular, Email, Site, Data_Cadastro, Observacoes, Endereco, CEP)');
        add(' select * from ' + serv + '.dbo.Fornecedor T');
        add('where T.Codigo not in(select Fornecedor.Codigo from Fornecedor)');
        ExecSQL;
        add('SET IDENTITY_INSERT Fornecedor OFF');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        application.MessageBox(PWideChar('Erro em Cadastro de Fornecedor: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
      end;
    end;

    { try
      with qAux, sql do
      begin
      close;
      Connection:= dm.ADOConnectionLocal;
      clear;
      //add('select * into Grupo_Cliente from '+serv+'.dbo.Grupo_Cliente');
      //ExecSQL;
      add('SET IDENTITY_INSERT Grupo_Cliente ON');
      ExecSQL;
      add('Insert into Grupo_Cliente(Codigo, Descricao, Data_Cadastro)');
      add(' select * from '+serv+'.dbo.Grupo_Cliente T');
      add('where T.Codigo not in(select Grupo_Cliente.Codigo from Grupo_Cliente)');
      ExecSQL;
      add('SET IDENTITY_INSERT Grupo_Cliente OFF');
      ExecSQL;
      end;
      except
      Application.MessageBox('Erro em Cadastro de Grupo de Cliente', 'Erro', MB_OK+MB_ICONHAND);
      end; }

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Localidade_Produto from '+serv+'.dbo.Localidade_Produto');
        // ExecSQL;
        add('SET IDENTITY_INSERT Localidade_Produto ON');
        ExecSQL;
        add('Insert into Localidade_Produto(Codigo, Codigo_Empresa, Local, Data_Cadastro)');
        add(' select * from ' + serv + '.dbo.Localidade_Produto T');
        add('where T.Codigo not in(select Localidade_Produto.Codigo from Localidade_Produto)');
        ExecSQL;
        add('SET IDENTITY_INSERT Localidade_Produto OFF');
        ExecSQL;
      end;
    except
      application.MessageBox('Erro em Cadastro de Localidade de Produto',
        'Erro', MB_OK + MB_ICONHAND);
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Logradouro from '+serv+'.dbo.Logradouro');
        // ExecSQL;
        add('SET IDENTITY_INSERT Logradouro ON');
        ExecSQL;
        add('Insert into Logradouro(Codigo, Descricao, Tipo_Logradouro, CEP, Data_Cadastro)');
        add(' select * from ' + serv + '.dbo.Logradouro T');
        add('where T.Codigo not in(select Logradouro.Codigo from Logradouro)');
        ExecSQL;
        add('SET IDENTITY_INSERT Logradouro OFF');
        ExecSQL;
      end;
    except
      application.MessageBox('Erro em Cadastro de Logradouro', 'Erro',
        MB_OK + MB_ICONHAND);
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Marca from '+serv+'.dbo.Marca');
        // ExecSQL;
        add('SET IDENTITY_INSERT Marca ON');
        ExecSQL;
        add('Insert into Marca(Codigo, Descricao, Data_Cadastro)');
        add(' select * from ' + serv + '.dbo.Marca T');
        add('where T.Codigo not in(select Marca.Codigo from Marca)');
        ExecSQL;
        add('SET IDENTITY_INSERT Marca OFF');
        ExecSQL;
      end;
    except
      application.MessageBox('Erro em Cadastro de Marca', 'Erro',
        MB_OK + MB_ICONHAND);
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Regra_COFINS from '+serv+'.dbo.Regra_COFINS');
        // ExecSQL;
        add('SET IDENTITY_INSERT Regra_COFINS ON');
        ExecSQL;
        add('Insert into Regra_COFINS(Codigo, Data_Cadastro, Descricao, Aliquota, Tipo_Calculo, Tipo_Recolhimento, ');
        add('Base_Reduzida, Percentual_BC_Reduzida, Base_Acrescida, Percentual_BC_Acrescida, Codigo_Situacao_Tributaria)');
        add(' select * from ' + serv + '.dbo.Regra_COFINS T');
        add('where T.Codigo not in(select Regra_COFINS.Codigo from Regra_COFINS)');
        ExecSQL;
        add('SET IDENTITY_INSERT Regra_COFINS OFF');
        ExecSQL;
      end;
    except
      application.MessageBox('Erro em Regras de COFINS', 'Erro',
        MB_OK + MB_ICONHAND);
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Regra_ICMS from '+serv+'.dbo.Regra_ICMS');
        // ExecSQL;
        add('SET IDENTITY_INSERT Regra_ICMS ON');
        ExecSQL;
        add('Insert into Regra_ICMS(Codigo, Data_Cadastro, Descricao, Aliquota, Tipo_Recolhimento, Tipo_Calculo_BC_ICMS,');
        add('Tipo_Calculo_BC_ICMS_ST, Base_Reduzida, Percentual_BC_Reduzida, Base_Acrescida, Percentual_BC_Acrescida, Codigo_Situacao_Tributaria,');
        add('CFOP_D, CFOP_F)');
        add(' select * from ' + serv + '.dbo.Regra_ICMS T');
        add('where T.Codigo not in(select Regra_ICMS.Codigo from Regra_ICMS)');
        ExecSQL;
        add('SET IDENTITY_INSERT Regra_ICMS OFF');
        ExecSQL;
      end;
    except
      application.MessageBox('Erro em Regras de ICMS', 'Erro',
        MB_OK + MB_ICONHAND);
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Regra_IPI from '+serv+'.dbo.Regra_IPI');
        // ExecSQL;
        add('SET IDENTITY_INSERT Regra_IPI ON');
        ExecSQL;
        add('Insert into Regra_IPI(Codigo, Data_Cadastro, Descricao, Aliquota, Tipo_Calculo, Tipo_Recolhimento, ');
        add('Base_Reduzida, Percentual_BC_Reduzida, Base_Acrescida, Percentual_BC_Acrescida, Codigo_Situacao_Tributaria)');
        add(' select * from ' + serv + '.dbo.Regra_IPI T');
        add('where T.Codigo not in(select Regra_IPI.Codigo from Regra_IPI)');
        ExecSQL;
        add('SET IDENTITY_INSERT Regra_IPI OFF');
        /// aqui que está o erro
        ExecSQL;
      end;
    except
      application.MessageBox('Erro em Regras de IPI', 'Erro',
        MB_OK + MB_ICONHAND);
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Regra_ISSQN from '+serv+'.dbo.Regra_ISSQN');
        // ExecSQL;
        add('SET IDENTITY_INSERT Regra_ISSQN ON');
        ExecSQL;
        add('Insert into Regra_ISSQN(Codigo, Data_Cadastro, Descricao, Aliquota, Tributacao,  ');
        add('Base_Reduzida, Percentual_BC_Reduzida, Base_Acrescida, Percentual_BC_Acrescida, Codigo_Situacao_Tributaria)');
        add(' select * from ' + serv + '.dbo.Regra_ISSQN T');
        add('where T.Codigo not in(select Regra_ISSQN.Codigo from Regra_ISSQN)');
        ExecSQL;
        add('SET IDENTITY_INSERT Regra_ISSQN OFF');
        ExecSQL;
      end;
    except
      application.MessageBox('Erro em Regras de ISSQN', 'Erro',
        MB_OK + MB_ICONHAND);
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Regra_PIS from '+serv+'.dbo.Regra_PIS');
        // ExecSQL;
        add('SET IDENTITY_INSERT Regra_PIS ON');
        ExecSQL;
        add('Insert into Regra_PIS(Codigo, Data_Cadastro, Descricao, Aliquota, Tipo_Calculo, Tipo_Recolhimento,');
        add('Base_Reduzida, Percentual_BC_Reduzida, Base_Acrescida, Percentual_BC_Acrescida, Codigo_Situacao_Tributaria)');
        add(' select * from ' + serv + '.dbo.Regra_PIS T');
        add('where T.Codigo not in(select Regra_PIS.Codigo from Regra_PIS)');
        ExecSQL;
        add('SET IDENTITY_INSERT Regra_PIS OFF');
        ExecSQL;
      end;
    except
      application.MessageBox('Erro em Regras de PIS', 'Erro',
        MB_OK + MB_ICONHAND);
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Setor from '+serv+'.dbo.Setor');
        // ExecSQL;
        add('SET IDENTITY_INSERT Setor ON');
        ExecSQL;
        add('Insert into Setor(Codigo, Descricao, Data_Cadastro)');
        add(' select * from ' + serv + '.dbo.Setor T');
        add('where T.Codigo not in(select Setor.Codigo from Setor)');
        ExecSQL;
        add('SET IDENTITY_INSERT Setor OFF');
        ExecSQL;
      end;
    except
      application.MessageBox('Erro em Cadastro de Setor', 'Erro',
        MB_OK + MB_ICONHAND);
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Insert into Tabela_Preco select * from ' + serv +
          '.dbo.Tabela_Preco T');
        add('where T.Codigo not in(select Tabela_Preco.Codigo from Tabela_Preco)');
        ExecSQL;
      end;
    except
      application.MessageBox('Erro em Tabela de Preço', 'Erro',
        MB_OK + MB_ICONHAND);
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Itens_Tabela_Preco from '+serv+'.dbo.Itens_Tabela_Preco');
        // ExecSQL;
        add('SET IDENTITY_INSERT Itens_Tabela_Preco ON');
        ExecSQL;
        add('Insert into Itens_Tabela_Preco(Codigo_Registro, Codigo, Codigo_Produto, Preco_Vista, Preco_Prazo, Percentual_Desconto_Vista,');
        add('Percentual_Desconto_Prazo, Percentual_Lucro_Vista, Percentual_Lucro_Prazo, Percentual_Comissao_Vista, Percentual_Comissao_Prazo) select * from '
          + serv + '.dbo.Itens_Tabela_Preco as T');
        // atualiza os produtos que estão no servidor
        add('where not exists (select J.Codigo from Itens_Tabela_Preco J where T.Codigo = J.Codigo and T.Codigo_Produto = J.Codigo_Produto)');
        // add('where P.Codigo_Produto not in (select Itens_Tabela_Preco.Codigo_Produto from Itens_Tabela_Preco) ');
        ExecSQL;
        add('SET IDENTITY_INSERT Itens_Tabela_Preco OFF');
        ExecSQL;
      end;
    except
      application.MessageBox('Erro em Itens Tabela de Preço', 'Erro',
        MB_OK + MB_ICONHAND);
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Insert into Tratamento_COFINS select * from ' + serv +
          '.dbo.Tratamento_COFINS T');
        add('where T.Codigo not in(select Tratamento_COFINS.Codigo from Tratamento_COFINS)');
        ExecSQL;
      end;
    except
      application.MessageBox('Erro em Tratamento de COFINS', 'Erro',
        MB_OK + MB_ICONHAND);
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Insert into Itens_Tratamento_COFINS select * from ' + serv +
          '.dbo.Itens_Tratamento_COFINS T');
        add('where T.Codigo not in(select Itens_Tratamento_COFINS.Codigo from Itens_Tratamento_COFINS)');
        ExecSQL;
      end;
    except
      application.MessageBox('Erro em Itens Tratamento de COFINS', 'Erro',
        MB_OK + MB_ICONHAND);
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Insert into Tratamento_ICMS select * from ' + serv +
          '.dbo.Tratamento_ICMS T');
        add('where T.Codigo not in(select Tratamento_ICMS.Codigo from Tratamento_ICMS)');
        ExecSQL;
      end;
    except
      application.MessageBox('Erro em Tratamento de ICMS', 'Erro',
        MB_OK + MB_ICONHAND);
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Insert into Itens_Tratamento_ICMS select * from ' + serv +
          '.dbo.Itens_Tratamento_ICMS T');
        add('where T.Codigo not in(select Itens_Tratamento_ICMS.Codigo from Itens_Tratamento_ICMS)');
        ExecSQL;
      end;
    except
      application.MessageBox('Erro em Itens Tratamento de ICMS', 'Erro',
        MB_OK + MB_ICONHAND);
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Insert into Tratamento_IPI select * from ' + serv +
          '.dbo.Tratamento_IPI T');
        add('where T.Codigo not in(select Tratamento_IPI.Codigo from Tratamento_IPI)');
        ExecSQL;
      end;
    except
      application.MessageBox('Erro em Tratamento de IPI', 'Erro',
        MB_OK + MB_ICONHAND);
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Insert into Itens_Tratamento_IPI select * from ' + serv +
          '.dbo.Itens_Tratamento_IPI T');
        add('where T.Codigo not in(select Itens_Tratamento_IPI.Codigo from Itens_Tratamento_IPI)');
        ExecSQL;
      end;
    except
      application.MessageBox('Erro em Itens Tratamento de IPI', 'Erro',
        MB_OK + MB_ICONHAND);
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Insert into Tratamento_PIS select * from ' + serv +
          '.dbo.Tratamento_PIS T');
        add('where T.Codigo not in(select Tratamento_PIS.Codigo from Tratamento_PIS)');
        ExecSQL;
      end;
    except
      application.MessageBox('Erro em Tratamento de PIS', 'Erro',
        MB_OK + MB_ICONHAND);
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Insert into Itens_Tratamento_PIS select * from ' + serv +
          '.dbo.Itens_Tratamento_PIS T');
        add('where T.Codigo not in(select Itens_Tratamento_PIS.Codigo from Itens_Tratamento_PIS)');
        ExecSQL;
      end;
    except
      application.MessageBox('Erro em Itens Tratamento de PIS', 'Erro',
        MB_OK + MB_ICONHAND);
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // ExecSQL;
        add('SET IDENTITY_INSERT Unidade_Medida ON');
        ExecSQL;
        add('Insert into Unidade_Medida(Codigo, Sigla, Descricao, Data_Cadastro)');
        add(' select * from ' + serv + '.dbo.Unidade_Medida T');
        add('where T.Codigo not in(select Unidade_Medida.Codigo from Unidade_Medida)');
        ExecSQL;
        add('SET IDENTITY_INSERT Unidade_Medida OFF');
        ExecSQL;
      end;
    except
      application.MessageBox('Erro em Cadastro de Unidade de Medida', 'Erro',
        MB_OK + MB_ICONHAND);
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        // add('select * into Unidade_Medida from '+serv+'.dbo.Unidade_Medida');
        // ExecSQL;
        add('SET IDENTITY_INSERT Grupo_Produto ON');
        ExecSQL;
        add('Insert into Grupo_Produto(Codigo, Descricao, Codigo_Grupo_ICMS, Codigo_Grupo_IPI, Codigo_Grupo_PIS, Codigo_Grupo_COFINS, ');
        add('Percentual_Vista, Percentual_Prazo, Percentual_Desconto_Vista, Percentual_Desconto_Prazo, Data_Cadastro, Codigo_Sub_Grupo, Sub_Grupo, Codigo_Pai,');
        add('Percentual_Comissao_Vista, Percentual_Comissao_Prazo)');
        add('select * from ' + serv + '.dbo.Grupo_Produto T');
        add('where T.Codigo not in(select Grupo_Produto.Codigo from Grupo_Produto)');
        ExecSQL;
        add('SET IDENTITY_INSERT Grupo_Produto OFF');
        ExecSQL;
      end;
    except
      on E: Exception do
      begin
        application.MessageBox(Pchar('Erro em Cadastro de Grupo de Produto.' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
      end;
    end;

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Insert into Produto select * from ' + serv + '.dbo.Produto as P');
        // atualiza os produtos que estão no servidor
        add('where P.Codigo not in (select Produto.Codigo from Produto) ');
        // para a estação
//        ShowMessage('Vou exec sql');
        ExecSQL;
      end;
      Atualiza_Produto(4, '');
    except
      on E: Exception do
        application.MessageBox(PWideChar('Erro em Cadastro de Produto: ' +
          E.Message), 'Erro', MB_OK + MB_ICONHAND);
    end;

    { try
      with qAux, sql do
      begin
      close;
      Connection:= dm.ADOConnectionLocal;
      clear;
      add('Insert into Cliente select * from '+serv+'.dbo.Cliente as T');
      add('where T.Codigo not in (select Cliente.Codigo from Cliente)');
      ExecSQL;
      end;

      dm.qrychama_cliente.Close;
      dm.qrychama_cliente.Open;
      except on E:Exception do
      begin
      Application.MessageBox(PWideChar('Erro em Cadastro de Cliente: '+E.Message), 'Erro', MB_OK+MB_ICONHAND);
      end;
      end; }

    { try
      with qAux, sql do
      begin
      close;
      Connection:= dm.ADOConnectionLocal;
      clear;
      add('Insert into Endereco_Cliente select * from '+serv+'.dbo.Endereco_Cliente as T');
      add('where ( CONVERT(varchar(3), T.Codigo_Cliente) + (CONVERT(varchar(3), T.Codigo_Endereco)) + (CONVERT(varchar(3), T.Numero)) ) ');
      add('not in (select CONVERT(varchar(3), Endereco_Cliente.Codigo_Cliente) + CONVERT(varchar(3), Endereco_Cliente.Codigo_Endereco) + CONVERT(varchar(3), Endereco_Cliente.Numero) from Endereco_Cliente)');
      ExecSQL;
      end;
      except
      Application.MessageBox('Erro em Cadastro de Endereços de Cliente', 'Erro', MB_OK+MB_ICONHAND);
      end; }

    try
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnectionLocal;
        clear;
        add('Insert into Condicao_Pagamento select * from ' + serv +
          '.dbo.Condicao_Pagamento T');
        add('where T.Codigo not in (select Condicao_Pagamento.Codigo from Condicao_Pagamento)');
        ExecSQL;
      end;

      DM.qrychama_condicao.close;
      DM.qrychama_condicao.open;
    except
      application.MessageBox('Erro em Cadastro de Condições de Pagamentos',
        'Erro', MB_OK + MB_ICONHAND);
    end;
  finally
    FreeAndNil(qAux);
  end;

end;

procedure Inicializa_Dados_Principais_Movimentacao(Arquivo: Integer;
  DataSet: TADOQuery);
var
  qAux: TADOQuery;
  serv: AnsiString;
begin
  qAux := TADOQuery.Create(nil);

  if (eservidor = '1') then // não é servidor
    serv := servidor + '.' + Banco
  else
    serv := Banco;

  if Arquivo = 0 then // produto
  begin
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnectionLocal;
      clear;
      add('Insert into Produto select * from ' + serv + '.dbo.Produto as P');
      // atualiza os produtos que estão no servidor
      add('where P.Codigo not in (select Produto.Codigo from Produto) ');
      // para a estação
      ExecSQL;
    end;

    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnectionLocal;
      clear;
      add('SET IDENTITY_INSERT Itens_Tabela_Preco ON');
      ExecSQL;
      add('Insert into Itens_Tabela_Preco(Codigo_Registro, Codigo, Codigo_Produto, Preco_Vista, Preco_Prazo, Percentual_Desconto_Vista,');
      add('Percentual_Desconto_Prazo, Percentual_Lucro_Vista, Percentual_Lucro_Prazo, Percentual_Comissao_Vista, Percentual_Comissao_Prazo) select * from '
        + serv + '.dbo.Itens_Tabela_Preco as P');
      // atualiza os produtos que estão no servidor
      add('where P.Codigo_Produto not in (select Itens_Tabela_Preco.Codigo_Produto from Itens_Tabela_Preco) ');
      // para a estação
      ExecSQL;
      add('SET IDENTITY_INSERT Itens_Tabela_Preco OFF');
      ExecSQL;
    end;

    with DataSet, SQL do
    begin
      close;
      Connection := DM.ADOConnectionLocal;
      clear;
      add('select Pro.Codigo, Pro.Tipo, Pro.Codigo_Empresa, Pro.Status, Pro.Gera_Comissao, Pro.Aceita_Devolucao, Pro.Arred_Trunc, Pro.Producao_Propria, Pro.Codigo_Original, Pro.Codigo_Venda, Pro.Descricao,');
      add('Pro.Codigo_Barra, Pro.Codigo_Fornecedor, Pro.Codigo_Fabricante, Pro.Codigo_Marca, Pro.Codigo_Unidade_Medida, Pro.Codigo_Unidade_Volume, Pro.Codigo_Grupo, Pro.Codigo_Grupo_Tributacao,');
      add('Pro.Codigo_Grupo_Tributacao_IPI, Pro.Codigo_Grupo_Tributacao_PIS, Pro.Codigo_Grupo_Tributacao_COFINS, Pro.Codigo_Grupo_Tributacao_ISSQN, Pro.Codigo_Local, Pro.Data_Fabricacao,');
      add('Pro.Data_Validade, Pro.Ultima_Compra, Pro.Ultima_Venda, Pro.Valor_Compra, Pro.Valor_Medio, Pro.Saldo_Estoque, Pro.Valor_Ultima_Compra, Pro.Estoque_Maximo, Pro.Estoque_Minimo, Pro.Estoque,');
      add('Pro.Estoque_Reservado, Pro.Volume, Pro.Volume_Total, Pro.Em_Estoque_Maximo, Pro.Em_Estoque_Minimo, Pro.Data_Cadastro, Pro.Data_Atualizacao_Estoque, Pro.Status_Estoque_Data,');
      add('NCM, Forn.Nome_Fantasia, Forn2.Nome_Fantasia, Mar.Descricao, UM.Sigla, UM2.Sigla, Gru.Descricao, TI.Descricao as Descricao_TICMS, TIPI.Descricao as Descricao_TIPI, LP.Local,');
      add('TPIS.Descricao as Descricao_TPIS, TCO.Descricao as Descricao_TCO, ITP.Preco_Vista, ITP.Preco_Prazo, ITP.Percentual_Desconto_Vista, ITP.Percentual_Desconto_Prazo,');
      add('ITP.Percentual_Lucro_Vista, ITP.Percentual_Lucro_Prazo, RI.Aliquota, RI2.Aliquota as Aliquota_NF, RISS.Aliquota as ISS from Produto Pro');

      add('left join Fornecedor Forn on (Pro.Codigo_Fornecedor = Forn.Codigo)');
      add('left join Fornecedor Forn2 on (Pro.Codigo_Fabricante = Forn2.Codigo)');
      add('left join Marca Mar on (Pro.Codigo_Marca = Mar.Codigo)');
      add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
      add('left join Unidade_Medida UM2 on (Pro.Codigo_Unidade_Volume = UM2.Codigo)');
      add('left join Grupo_Produto Gru on (Pro.Codigo_Grupo = Gru.Codigo)');

      add('left join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
      add('left join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');

      if (enquadramento_empresa = 'EN') then
        add('left join Regra_ICMS RI on (ITI.Saida_Regra_EN = RI.Codigo)')
      else if (enquadramento_empresa = 'EPP') then
        add('left join Regra_ICMS RI on (ITI.Saida_Regra_EPP = RI.Codigo)')
      else if (enquadramento_empresa = 'ME') then
        add('left join Regra_ICMS RI on (ITI.Saida_Regra_ME = RI.Codigo)');

      add('left join Regra_ICMS RI2 on (ITI.Regra_Nao_Contribuinte = RI2.Codigo)');

      add('left join Tratamento_IPI TIPI on (Pro.Codigo_Grupo_Tributacao_IPI = TIPI.Codigo)');
      add('left join Itens_Tratamento_IPI ITIPI on (TIPI.Codigo = ITIPI.Codigo)');

      if (enquadramento_empresa = 'EN') then
        add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_EN = RIPI.Codigo)')
      else if (enquadramento_empresa = 'EPP') then
        add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_EPP = RIPI.Codigo)')
      else if (enquadramento_empresa = 'ME') then
        add('left join Regra_IPI RIPI on (ITIPI.Saida_Regra_ME = RIPI.Codigo)');

      add('left join Tratamento_COFINS TCO on (Pro.Codigo_Grupo_Tributacao_COFINS = TCO.Codigo)');
      add('left join Tratamento_PIS TPIS on (Pro.Codigo_Grupo_Tributacao_PIS = TPIS.Codigo)');

      add('left join Localidade_Produto LP on (Pro.Codigo_Local = LP.Codigo)');

      add('left join Regra_ISSQN RISS on (Pro.Codigo_Grupo_Tributacao_ISSQN = RISS.Codigo)');

      add('left join Itens_Tabela_Preco ITP on (Pro.Codigo = ITP.Codigo_Produto)');
      add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
      add('where TP.Codigo = :Codigo and Pro.Status = :Ativo order by Pro.Descricao');
      // and Pro.Tipo = 0');
      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_ativo;
      Parameters.ParamByName('GO1').Value := UF;
      Parameters.ParamByName('GO2').Value := UF;
      // Parameters.ParamByName('GO3').Value := uf;
      // Parameters.ParamByName('GO4').Value := uf;
      Parameters.ParamByName('Ativo').Value := 'ATIVO';
      open;
    end;
  end
  else if Arquivo = 1 then // cliente
  begin
    { if (FileExists(Local_Arquivo(9))) then
      DeleteFile(Local_Arquivo(9));

      if (Client.Active = false) then
      Client.open;
      Client.EmptyDataSet;
      Client.close;
      Client.open; }

    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnectionLocal;
      clear;
      add('Insert into Cliente select * from ' + serv + '.dbo.Cliente as T');
      add('where T.Codigo not in (select Cliente.Codigo from Cliente)');
      ExecSQL;
    end;

    DataSet.close;
    DataSet.open;
    // Client.SaveToFile(Local_Arquivo(9), dfXMLUTF8);
  end
  else if Arquivo = 2 then // condição de pagamento
  begin

    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnectionLocal;
      clear;
      add('Insert into Condicao_Pagamento select * from ' + serv +
        '.dbo.Condicao_Pagamento T');
      add('where T.Codigo not in (select Condicao_Pagamento.Codigo from Condicao_Pagamento)');
      ExecSQL;
    end;

    DataSet.close;
    DataSet.open;
  end
  else if Arquivo = 3 then // veículo
  begin
    { if (FileExists(Local_Arquivo(16))) then
      DeleteFile(Local_Arquivo(16));

      if not Client.Active then
      Client.open;
      Client.EmptyDataSet;
      Client.close;
      Client.open; }

    with DataSet, SQL do
    begin
      close;
      clear;
      add('select V.*, M.Descricao, C.Nome_Nome_Fantasia from Veiculo V');
      add('left join Marca M on (V.Codigo_Marca = M.Codigo)');
      add('left join Cliente C on (V.Codigo_Cliente = C.Codigo)');
      open;
    end;
    // Client.SaveToFile(Local_Arquivo(16), dfXMLUTF8);
  end
  else if Arquivo = 4 then // serviço
  begin
    { if (FileExists(Local_Arquivo(17))) then
      DeleteFile(Local_Arquivo(17));

      if not Client.Active then
      Client.open;
      Client.EmptyDataSet;
      Client.close;
      Client.open; }

    with DataSet, SQL do
    begin
      close;
      clear;
      add('select P.*, RISS.Aliquota, RISS.Tributacao, UM.Sigla, ITP.Preco_Vista, ITP.Percentual_Desconto_Vista, ITP.Percentual_Desconto_Prazo from Produto P');
      add('inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
      add('left join Regra_ISSQN RISS on (P.Codigo_Grupo_Tributacao_ISSQN = RISS.Codigo)');
      add('left join Itens_Tabela_Preco ITP on (P.Codigo = ITP.Codigo_Produto)');
      add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
      add('where TP.Codigo = :Codigo and P.Tipo = 1');
      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_ativo;
      open;
    end;
    { Client.close;
      Client.open;
      Client.SaveToFile(Local_Arquivo(17), dfXMLUTF8); }
  end
  else if Arquivo = 5 then // Venda
  begin
    { if (FileExists(Local_Arquivo(1))) then
      DeleteFile(Local_Arquivo(1));

      if not Client.Active then
      Client.open;
      Client.EmptyDataSet; }
    DataSet.close;
    DataSet.open;
  end
  else if Arquivo = 6 then // Itens_Venda
  begin
    { if (FileExists(Local_Arquivo(2))) then
      DeleteFile(Local_Arquivo(2));

      if not Client.Active then
      Client.open;
      Client.EmptyDataSet; }
    DataSet.close;
    DataSet.open;
  end
  else if Arquivo = 7 then
  begin
    { if (FileExists(Local_Arquivo(8))) then // R05
      DeleteFile(Local_Arquivo(8));

      if not Client.Active then
      Client.open;
      Client.EmptyDataSet; }
    DataSet.close;
    DataSet.open;
  end
  else if Arquivo = 8 then
  begin
    { if (FileExists(Local_Arquivo(15))) then // Itens_OS
      DeleteFile(Local_Arquivo(15));

      if not Client.Active then
      Client.open;
      Client.EmptyDataSet; }
    DataSet.close;
    DataSet.open;
  end
  else if Arquivo = 9 then // controla_codigo
  begin
    { if (FileExists(Local_Arquivo(18))) then
      DeleteFile(Local_Arquivo(18));

      if not Client.Active then
      Client.open;
      Client.EmptyDataSet; }
    DataSet.close;
    DataSet.open;
  end
  else if Arquivo = 10 then // fechamento_venda
  begin
    { if (FileExists(Local_Arquivo(4))) then
      DeleteFile(Local_Arquivo(4));

      if not Client.Active then
      Client.open;
      Client.EmptyDataSet; }
    DataSet.close;
    DataSet.open;
  end
  else if Arquivo = 11 then // r04
  begin
    { if (FileExists(Local_Arquivo(6))) then
      DeleteFile(Local_Arquivo(6));

      if not Client.Active then
      Client.open;
      Client.EmptyDataSet; }
    DataSet.close;
    DataSet.open;
  end
  else if Arquivo = 12 then // r07
  begin
    { if (FileExists(Local_Arquivo(7))) then
      DeleteFile(Local_Arquivo(7));

      if not Client.Active then
      Client.open;
      Client.EmptyDataSet; }
    DataSet.close;
    DataSet.open;
  end
  else if Arquivo = 13 then // r06
  begin
    { if (FileExists(Local_Arquivo(13))) then
      DeleteFile(Local_Arquivo(13));

      if not Client.Active then
      Client.open;
      Client.EmptyDataSet; }
    DataSet.close;
    DataSet.open;
  end
  else if Arquivo = 14 then // fechamento venda aux
  begin
    { if (FileExists(Local_Arquivo(19))) then
      DeleteFile(Local_Arquivo(19));

      if not Client.Active then
      Client.open;
      Client.EmptyDataSet; }
    DataSet.close;
    DataSet.open;
  end
  else if Arquivo = 15 then // Itens_Venda_Aux
  begin
    { if (FileExists(Local_Arquivo(3))) then
      DeleteFile(Local_Arquivo(3));

      if not Client.Active then
      Client.open;
      Client.EmptyDataSet; }
    DataSet.close;
    DataSet.open;
  end
  else if Arquivo = 16 then // cadastro_produto
  begin
    { if (FileExists(Local_Arquivo(5))) then
      DeleteFile(Local_Arquivo(5));
      if (Client.Active = false) then
      Client.open;
      Client.EmptyDataSet;
      Client.close;
      Client.open; }

    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnectionLocal;
      clear;
      add('Insert into Produto select * from ' + serv + '.dbo.Produto as P');
      add('where P.Codigo not in (select Produto.Codigo from Produto) ');
      ExecSQL;
    end;

    with DataSet, SQL do
    begin
      close;
      clear;
      add('select Pro.Codigo, Pro.Tipo, Pro.Codigo_Empresa, Pro.Status, Pro.Gera_Comissao, Pro.Aceita_Devolucao, Pro.Arred_Trunc, Pro.Producao_Propria, Pro.Codigo_Original, Pro.Codigo_Venda, Pro.Descricao,');
      add('Pro.Codigo_Barra, Pro.Codigo_Fornecedor, Pro.Codigo_Fabricante, Pro.Codigo_Marca, Pro.Codigo_Unidade_Medida, Pro.Codigo_Unidade_Volume, Pro.Codigo_Grupo, Pro.Codigo_Grupo_Tributacao,');
      add('Pro.Codigo_Grupo_Tributacao_IPI, Pro.Codigo_Grupo_Tributacao_PIS, Pro.Codigo_Grupo_Tributacao_COFINS, Pro.Codigo_Grupo_Tributacao_ISSQN, Pro.Codigo_Local, Pro.Data_Fabricacao,');
      add('Pro.Data_Validade, Pro.Ultima_Compra, Pro.Ultima_Venda, Pro.Valor_Compra, Pro.Valor_Medio, Pro.Saldo_Estoque, Pro.Valor_Ultima_Compra, Pro.Estoque_Maximo, Pro.Estoque_Minimo, Pro.Estoque,');
      add('Pro.Estoque_Reservado, Pro.Volume, Pro.Volume_Total, Pro.Em_Estoque_Maximo, Pro.Em_Estoque_Minimo, Pro.Data_Cadastro, Pro.Data_Atualizacao_Estoque, Pro.Status_Estoque_Data,');
      add('NCM, Forn.Nome_Fantasia, Forn2.Nome_Fantasia, Mar.Descricao, UM.Sigla, UM2.Sigla, Gru.Descricao, GPT.Descricao as Descricao_GPT, GPTC.Descricao as Descricao_GPTC, LP.Local,');
      add('GPTI.Descricao as Descricao_GPTI, GPTP.Descricao as Descricao_GPTP, ITP.Preco_Vista, ITP.Preco_Prazo, ITP.Percentual_Desconto_Vista, ITP.Percentual_Desconto_Prazo, ');
      add('ITP.Percentual_Lucro_Vista, ITP.Percentual_Lucro_Prazo, RI.Aliquota, RISS.Aliquota as ISS');
      add(' from Produto Pro');
      add('left join Fornecedor Forn on (Pro.Codigo_Fornecedor = Forn.Codigo)');
      add('left join Fornecedor Forn2 on (Pro.Codigo_Fabricante = Forn2.Codigo)');
      add('left join Marca Mar on (Pro.Codigo_Marca = Mar.Codigo)');
      add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
      add('left join Unidade_Medida UM2 on (Pro.Codigo_Unidade_Volume = UM2.Codigo)');
      add('left join Grupo_Produto Gru on (Pro.Codigo_Grupo = Gru.Codigo)');
      add('left join Grupo_Produto_Tributacao GPT on (Pro.Codigo_Grupo_Tributacao = GPT.Codigo)');
      add('left join Grupo_Produto_Tributacao_COFINS GPTC on (Pro.Codigo_Grupo_Tributacao_COFINS = GPTC.Codigo)');
      add('left join Grupo_Produto_Tributacao_IPI GPTI on (Pro.Codigo_Grupo_Tributacao_IPI = GPTI.Codigo)');
      add('left join Grupo_Produto_Tributacao_PIS GPTP on (Pro.Codigo_Grupo_Tributacao_PIS = GPTP.Codigo)');
      add('left join Localidade_Produto LP on (Pro.Codigo_Local = LP.Codigo)');
      add('left join Tratamento_ICMS TI on (GPT.Codigo_Tratamento_ICMS = TI.Codigo)');
      add('left join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
      add('left join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Codigo)');
      add('left join Regra_ISSQN RISS on (Pro.Codigo_Grupo_Tributacao_ISSQN = RISS.Codigo)');

      add('left join Itens_Tabela_Preco ITP on (Pro.Codigo = ITP.Codigo_Produto)');
      add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
      add('where ITP.Codigo = :Codigo and Pro.Status = :Ativo order by Pro.Descricao');
      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_ativo;
      Parameters.ParamByName('GO1').Value := UF;
      Parameters.ParamByName('GO2').Value := UF;
      Parameters.ParamByName('Ativo').Value := 'ATIVO';
      open;
    end;
    { Client.close;
      Client.open;
      Client.SaveToFile(Local_Arquivo(5), dfXMLUTF8); }
  end
  else if Arquivo = 17 then // controla_codigo_sem_rede
  begin
    { if (FileExists(Local_Arquivo(18))) then
      DeleteFile(Local_Arquivo(18));

      if not Client.Active then
      Client.open;
      Client.EmptyDataSet;
      Client.close;
      Client.open; }

    with DataSet, SQL do
    begin
      close;
      clear;
      add('select max(Codigo + 1) as Codigo from Controla_Codigo  ');
      open;
    end;
    { Client.close;
      Client.open;
      Client.SaveToFile(Local_Arquivo(18), dfXMLUTF8); }
  end
  else if Arquivo = 18 then // icms
  begin
    { if (FileExists(Local_Arquivo(20))) then
      DeleteFile(Local_Arquivo(20));

      if not Client.Active then
      Client.open;
      Client.EmptyDataSet;
      Client.close;
      Client.open; }

    with DataSet, SQL do
    begin
      close;
      // Connection := dm.ADOConnection1;
      clear;
      add('select RI.Codigo, RI.Aliquota, RI.CFOP_D, RI.CFOP_F, RI.Tipo_Recolhimento, RI.Tipo_Calculo_BC_ICMS, RI.Tipo_Calculo_BC_ICMS_ST, RI.Base_Reduzida, RI.Base_Acrescida, RI.Percentual_BC_Reduzida, RI.Percentual_BC_Acrescida,');
      add('CST.Codigo_Situacao, CST.Codigo_CSOSN, Pro.Codigo_Grupo_Tributacao from Produto Pro');
      add('inner join Grupo_Produto_Tributacao GPT on (Pro.Codigo_Grupo_Tributacao = GPT.Codigo)');
      add('inner join Tratamento_ICMS TI on (GPT.Codigo_Tratamento_ICMS = TI.Codigo)');
      add('inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
      add('inner join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Codigo)');
      add('inner join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');
      // add('where Pro.Codigo_Grupo_Tributacao = :Grupo');
      Parameters.ParamByName('GO1').Value := UF;
      Parameters.ParamByName('GO2').Value := UF;
      // Parameters.ParamByName('Grupo').Value:= 2;
      open;
    end;
    // Client.close;
    // Client.open;
    // Client.SaveToFile(Local_Arquivo(20), dfXMLUTF8);
  end
  else if Arquivo = 19 then // iss
  begin
    { if (FileExists(Local_Arquivo(21))) then
      DeleteFile(Local_Arquivo(21));

      if not Client.Active then
      Client.open;
      Client.EmptyDataSet;
      Client.close;
      Client.open; }

    with DataSet, SQL do
    begin
      close;
      // Connection := dm.ADOConnection1;
      clear;
      add('select RISS.Codigo, RISS.Aliquota, RISS.Tributacao, RISS.Base_Reduzida, RISS.Base_Acrescida, RISS.Percentual_BC_Reduzida, RISS.Percentual_BC_Acrescida,');
      add('Pro.Codigo_Grupo_Tributacao_ISSQN from Produto Pro');
      add('inner join Regra_ISSQN RISS on (Pro.Codigo_Grupo_Tributacao_ISSQN = RISS.Codigo)');
      // add('where Pro.Codigo_Grupo_Tributacao_ISSQN = :Grupo');
      // Parameters.ParamByName('Grupo').Value:= Grupo;
      open;
    end;
    { Client.close;
      Client.open;
      Client.SaveToFile(Local_Arquivo(21), dfXMLUTF8); }
  end
  else if Arquivo = 20 then // ipi
  begin
    { if (FileExists(Local_Arquivo(22))) then
      DeleteFile(Local_Arquivo(22));

      if not Client.Active then
      Client.open;
      Client.EmptyDataSet;
      Client.close;
      Client.open; }

    if (enquadramento_empresa = 'EN') then
    begin
      with DataSet, SQL do
      begin
        close;
        // Connection := dm.ADOConnectionLocal;
        clear;
        add('select RIPI.Codigo, RIPI.Aliquota, RIPI.Tipo_Calculo, RIPI.Base_Reduzida, RIPI.Base_Acrescida, RIPI.Percentual_BC_Reduzida, RIPI.Percentual_BC_Acrescida,');
        add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_IPI from Produto Pro');
        add('inner join Tratamento_IPI TIPI on (Pro.Codigo_Grupo_Tributacao_IPI = TIPI.Codigo)');
        add('inner join Itens_Tratamento_IPI ITIPI on (TIPI.Codigo = ITIPI.Codigo)');
        add('inner join Regra_IPI RIPI on (ITIPI.Saida_Regra_EN = RIPI.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RIPI.Codigo_Situacao_Tributaria = CST.Codigo)');
        open;
      end;
    end
    else if (enquadramento_empresa = 'EPP') then
    begin
      with DataSet, SQL do
      begin
        close;
        // Connection := dm.ADOConnection1;
        clear;
        add('select RIPI.Codigo, RIPI.Aliquota, RIPI.Tipo_Calculo, RIPI.Base_Reduzida, RIPI.Base_Acrescida, RIPI.Percentual_BC_Reduzida, RIPI.Percentual_BC_Acrescida,');
        add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_IPI from Produto Pro');
        add('inner join Tratamento_IPI TIPI on (Pro.Codigo_Grupo_Tributacao_IPI = TIPI.Codigo)');
        add('inner join Itens_Tratamento_IPI ITIPI on (TIPI.Codigo = ITIPI.Codigo)');
        add('inner join Regra_IPI RIPI on (ITIPI.Saida_Regra_EPP = RIPI.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RIPI.Codigo_Situacao_Tributaria = CST.Codigo)');
        open;
      end;
    end
    else if (enquadramento_empresa = 'ME') then
    begin
      with DataSet, SQL do
      begin
        close;
        // Connection := dm.ADOConnection1;
        clear;
        add('select RIPI.Codigo, RIPI.Aliquota, RIPI.Tipo_Calculo, RIPI.Base_Reduzida, RIPI.Base_Acrescida, RIPI.Percentual_BC_Reduzida, RIPI.Percentual_BC_Acrescida,');
        add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_IPI from Produto Pro');
        add('inner join Tratamento_IPI TIPI on (Pro.Codigo_Grupo_Tributacao_IPI = TIPI.Codigo)');
        add('inner join Itens_Tratamento_IPI ITIPI on (TIPI.Codigo = ITIPI.Codigo)');
        add('inner join Regra_IPI RIPI on (ITIPI.Saida_Regra_ME = RIPI.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RIPI.Codigo_Situacao_Tributaria = CST.Codigo)');
        open;
      end;
    end;

    { Client.close;
      Client.open;
      Client.SaveToFile(Local_Arquivo(22), dfXMLUTF8); }
  end
  else if Arquivo = 21 then // pis
  begin
    { if (FileExists(Local_Arquivo(23))) then
      DeleteFile(Local_Arquivo(23));

      if not Client.Active then
      Client.open;
      Client.EmptyDataSet;
      Client.close;
      Client.open; }

    if (enquadramento_empresa = 'EN') then
    begin
      with DataSet, SQL do
      begin
        close;
        // Connection := dm.ADOConnection1;
        clear;
        add('select RPIS.Codigo, RPIS.Aliquota, RPIS.Tipo_Calculo, RPIS.Base_Reduzida, RPIS.Base_Acrescida, RPIS.Percentual_BC_Reduzida, RPIS.Percentual_BC_Acrescida,');
        add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_PIS from Produto Pro');
        add('inner join Tratamento_PIS TPIS on (Pro.Codigo_Grupo_Tributacao_PIS = TPIS.Codigo)');
        add('inner join Itens_Tratamento_PIS ITPIS on (TPIS.Codigo = ITPIS.Codigo)');
        add('inner join Regra_PIS RPIS on (ITPIS.Saida_Regra_EN = RPIS.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RPIS.Codigo_Situacao_Tributaria = CST.Codigo)');
        open;
      end;
    end
    else if (enquadramento_empresa = 'EPP') then
    begin
      with DataSet, SQL do
      begin
        close;
        // Connection := dm.ADOConnection1;
        clear;
        add('select RPIS.Codigo, RPIS.Aliquota, RPIS.Tipo_Calculo, RPIS.Base_Reduzida, RPIS.Base_Acrescida, RPIS.Percentual_BC_Reduzida, RPIS.Percentual_BC_Acrescida,');
        add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_PIS from Produto Pro');
        add('inner join Tratamento_PIS TPIS on (Pro.Codigo_Grupo_Tributacao_PIS = TPIS.Codigo)');
        add('inner join Itens_Tratamento_PIS ITPIS on (TPIS.Codigo = ITPIS.Codigo)');
        add('inner join Regra_PIS RPIS on (ITPIS.Saida_Regra_EPP = RPIS.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RPIS.Codigo_Situacao_Tributaria = CST.Codigo)');
        open;
      end;
    end
    else if (enquadramento_empresa = 'ME') then
    begin
      with DataSet, SQL do
      begin
        close;
        // Connection := dm.ADOConnection1;
        clear;
        add('select RPIS.Codigo, RPIS.Aliquota, RPIS.Tipo_Calculo, RPIS.Base_Reduzida, RPIS.Base_Acrescida, RPIS.Percentual_BC_Reduzida, RPIS.Percentual_BC_Acrescida,');
        add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_PIS from Produto Pro');
        add('inner join Tratamento_PIS TPIS on (Pro.Codigo_Grupo_Tributacao_PIS = TPIS.Codigo)');
        add('inner join Itens_Tratamento_PIS ITPIS on (TPIS.Codigo = ITPIS.Codigo)');
        add('inner join Regra_PIS RPIS on (ITPIS.Saida_Regra_ME = RPIS.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RPIS.Codigo_Situacao_Tributaria = CST.Codigo)');
        open;
      end;
    end;
    { Client.close;
      Client.open;
      Client.SaveToFile(Local_Arquivo(23), dfXMLUTF8); }
  end
  else if Arquivo = 22 then // cofins
  begin
    { if (FileExists(Local_Arquivo(24))) then
      DeleteFile(Local_Arquivo(24));

      if not Client.Active then
      Client.open;
      Client.EmptyDataSet;
      Client.close;
      Client.open; }

    if (enquadramento_empresa = 'EN') then
    begin
      with DataSet, SQL do
      begin
        close;
        // Connection := dm.ADOConnection1;
        clear;
        add('select RCOFINS.Codigo, RCOFINS.Aliquota, RCOFINS.Tipo_Calculo, RCOFINS.Base_Reduzida, RCOFINS.Base_Acrescida, RCOFINS.Percentual_BC_Reduzida, RCOFINS.Percentual_BC_Acrescida,');
        add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_COFINS from Produto Pro');
        add('inner join Tratamento_COFINS TCOFINS on (Pro.Codigo_Grupo_Tributacao_COFINS = TCOFINS.Codigo)');
        add('inner join Itens_Tratamento_COFINS ITCOFINS on (TCOFINS.Codigo = ITCOFINS.Codigo)');
        add('inner join Regra_COFINS RCOFINS on (ITCOFINS.Saida_Regra_EN = RCOFINS.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RCOFINS.Codigo_Situacao_Tributaria = CST.Codigo)');
        open;
      end;
    end
    else if (enquadramento_empresa = 'EPP') then
    begin
      with DataSet, SQL do
      begin
        close;
        // Connection := dm.ADOConnection1;
        clear;
        add('select RCOFINS.Codigo, RCOFINS.Aliquota, RCOFINS.Tipo_Calculo, RCOFINS.Base_Reduzida, RCOFINS.Base_Acrescida, RCOFINS.Percentual_BC_Reduzida, RCOFINS.Percentual_BC_Acrescida,');
        add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_COFINS from Produto Pro');
        add('inner join Tratamento_COFINS TCOFINS on (Pro.Codigo_Grupo_Tributacao_COFINS = TCOFINS.Codigo)');
        add('inner join Itens_Tratamento_COFINS ITCOFINS on (TCOFINS.Codigo = ITCOFINS.Codigo)');
        add('inner join Regra_COFINS RCOFINS on (ITCOFINS.Saida_Regra_EPP = RCOFINS.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RCOFINS.Codigo_Situacao_Tributaria = CST.Codigo)');
        open;
      end;
    end
    else if (enquadramento_empresa = 'ME') then
    begin
      with DataSet, SQL do
      begin
        close;
        // Connection := dm.ADOConnection1;
        clear;
        add('select RCOFINS.Codigo, RCOFINS.Aliquota, RCOFINS.Tipo_Calculo, RCOFINS.Base_Reduzida, RCOFINS.Base_Acrescida, RCOFINS.Percentual_BC_Reduzida, RCOFINS.Percentual_BC_Acrescida,');
        add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_COFINS from Produto Pro');
        add('inner join Tratamento_COFINS TCOFINS on (Pro.Codigo_Grupo_Tributacao_COFINS = TCOFINS.Codigo)');
        add('inner join Itens_Tratamento_COFINS ITCOFINS on (TCOFINS.Codigo = ITCOFINS.Codigo)');
        add('inner join Regra_COFINS RCOFINS on (ITCOFINS.Saida_Regra_ME = RCOFINS.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RCOFINS.Codigo_Situacao_Tributaria = CST.Codigo)');
        open;
      end;
    end;

    { Client.close;
      Client.open;
      Client.SaveToFile(Local_Arquivo(24), dfXMLUTF8); }
  end;
end;

procedure Pega_PIS_NC(Grupo: Integer);
begin
  try
    qAux_PIS := TADOQuery.Create(nil);
    with qAux_PIS, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select RPIS.Codigo, RPIS.Aliquota, RPIS.Tipo_Calculo, RPIS.Base_Reduzida, RPIS.Base_Acrescida, RPIS.Percentual_BC_Reduzida, RPIS.Percentual_BC_Acrescida,');
      add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_PIS from Produto Pro');
      add('inner join Tratamento_PIS TPIS on (Pro.Codigo_Grupo_Tributacao_PIS = TPIS.Codigo)');
      add('inner join Itens_Tratamento_PIS ITPIS on (TPIS.Codigo = ITPIS.Codigo and ITPIS.Origem = :GO1 and ITPIS.Destino = :GO2)');
      add('inner join Regra_PIS RPIS on (ITPIS.Regra_Nao_Contribuinte = RPIS.Codigo)');
      add('inner join Cadastro_Situacao_Tributaria CST on (RPIS.Codigo_Situacao_Tributaria = CST.Codigo)');
      add('where Pro.Codigo_Grupo_Tributacao_PIS = :Grupo');
      Parameters.ParamByName('GO1').Value := UF;
      Parameters.ParamByName('GO2').Value := UF;
      Parameters.ParamByName('Grupo').Value := Grupo;
      open;
    end;
  finally
    // FreeAndNil(qAux_ICMS);
  end;
end;

procedure Pega_PIS_Saida(Grupo: Integer; var Conexao: TADOConnection);
begin
  try
    qAux_PIS := TADOQuery.Create(nil);
    if (enquadramento_empresa = 'EN') then
    begin
      with qAux_PIS, SQL do
      begin
        close;
        Connection := Conexao;
        clear;
        add('select RPIS.Codigo, RPIS.Aliquota, RPIS.Tipo_Calculo, RPIS.Base_Reduzida, RPIS.Base_Acrescida, RPIS.Percentual_BC_Reduzida, RPIS.Percentual_BC_Acrescida,');
        add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_PIS from Produto Pro');
        add('inner join Tratamento_PIS TPIS on (Pro.Codigo_Grupo_Tributacao_PIS = TPIS.Codigo)');
        add('inner join Itens_Tratamento_PIS ITPIS on (TPIS.Codigo = ITPIS.Codigo)');
        add('inner join Regra_PIS RPIS on (ITPIS.Saida_Regra_EN = RPIS.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RPIS.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao_PIS = :Grupo');
        // Parameters.ParamByName('GO1').Value := Origem;
        // Parameters.ParamByName('GO2').Value := Destino;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end
    else if (enquadramento_empresa = 'EPP') then
    begin
      with qAux_PIS, SQL do
      begin
        close;
        Connection := Conexao;
        clear;
        add('select RPIS.Codigo, RPIS.Aliquota, RPIS.Tipo_Calculo, RPIS.Base_Reduzida, RPIS.Base_Acrescida, RPIS.Percentual_BC_Reduzida, RPIS.Percentual_BC_Acrescida,');
        add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_PIS from Produto Pro');
        add('inner join Tratamento_PIS TPIS on (Pro.Codigo_Grupo_Tributacao_PIS = TPIS.Codigo)');
        add('inner join Itens_Tratamento_PIS ITPIS on (TPIS.Codigo = ITPIS.Codigo)');
        add('inner join Regra_PIS RPIS on (ITPIS.Saida_Regra_EPP = RPIS.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RPIS.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao_PIS = :Grupo');
        // Parameters.ParamByName('GO1').Value := Origem;
        // Parameters.ParamByName('GO2').Value := Destino;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end
    else if (enquadramento_empresa = 'ME') then
    begin
      with qAux_PIS, SQL do
      begin
        close;
        Connection := Conexao;
        clear;
        add('select RPIS.Codigo, RPIS.Aliquota, RPIS.Tipo_Calculo, RPIS.Base_Reduzida, RPIS.Base_Acrescida, RPIS.Percentual_BC_Reduzida, RPIS.Percentual_BC_Acrescida,');
        add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_PIS from Produto Pro');
        add('inner join Tratamento_PIS TPIS on (Pro.Codigo_Grupo_Tributacao_PIS = TPIS.Codigo)');
        add('inner join Itens_Tratamento_PIS ITPIS on (TPIS.Codigo = ITPIS.Codigo)');
        add('inner join Regra_PIS RPIS on (ITPIS.Saida_Regra_ME = RPIS.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RPIS.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao_PIS = :Grupo');
        // Parameters.ParamByName('GO1').Value := Origem;
        // Parameters.ParamByName('GO2').Value := Destino;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end;
  finally
    // FreeAndNil(qAux_ICMS);
  end;
end;

procedure Pega_PIS_Entrada(Grupo: Integer);
begin
  try
    qAux_PIS_Entrada := TADOQuery.Create(nil);
    if (enquadramento_empresa = 'EN') then
    begin
      with qAux_PIS_Entrada, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select RPIS.Codigo, RPIS.Aliquota, RPIS.Tipo_Calculo, RPIS.Base_Reduzida, RPIS.Base_Acrescida, RPIS.Percentual_BC_Reduzida, RPIS.Percentual_BC_Acrescida,');
        add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_PIS from Produto Pro');
        add('inner join Tratamento_PIS TPIS on (Pro.Codigo_Grupo_Tributacao_PIS = TPIS.Codigo)');
        add('inner join Itens_Tratamento_PIS ITPIS on (TPIS.Codigo = ITPIS.Codigo)');
        add('inner join Regra_PIS RPIS on (ITPIS.Entrada_Regra_EN = RPIS.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RPIS.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao_PIS = :Grupo');
        // Parameters.ParamByName('GO1').Value := Origem;
        // Parameters.ParamByName('GO2').Value := Destino;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end
    else if (enquadramento_empresa = 'EPP') then
    begin
      with qAux_PIS_Entrada, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select RPIS.Codigo, RPIS.Aliquota, RPIS.Tipo_Calculo, RPIS.Base_Reduzida, RPIS.Base_Acrescida, RPIS.Percentual_BC_Reduzida, RPIS.Percentual_BC_Acrescida,');
        add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_PIS from Produto Pro');
        add('inner join Tratamento_PIS TPIS on (Pro.Codigo_Grupo_Tributacao_PIS = TPIS.Codigo)');
        add('inner join Itens_Tratamento_PIS ITPIS on (TPIS.Codigo = ITPIS.Codigo)');
        add('inner join Regra_PIS RPIS on (ITPIS.Entrada_Regra_EPP = RPIS.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RPIS.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao_PIS = :Grupo');
        // Parameters.ParamByName('GO1').Value := Origem;
        // Parameters.ParamByName('GO2').Value := Destino;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end
    else if (enquadramento_empresa = 'ME') then
    begin
      with qAux_PIS_Entrada, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select RPIS.Codigo, RPIS.Aliquota, RPIS.Tipo_Calculo, RPIS.Base_Reduzida, RPIS.Base_Acrescida, RPIS.Percentual_BC_Reduzida, RPIS.Percentual_BC_Acrescida,');
        add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_PIS from Produto Pro');
        add('inner join Tratamento_PIS TPIS on (Pro.Codigo_Grupo_Tributacao_PIS = TPIS.Codigo)');
        add('inner join Itens_Tratamento_PIS ITPIS on (TPIS.Codigo = ITPIS.Codigo)');
        add('inner join Regra_PIS RPIS on (ITPIS.Entrada_Regra_ME = RPIS.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RPIS.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao_PIS = :Grupo');
        // Parameters.ParamByName('GO1').Value := Origem;
        // Parameters.ParamByName('GO2').Value := Destino;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end;
  finally
    // FreeAndNil(qAux_ICMS);
  end;
end;

procedure Pega_COFINS_NC(Grupo: Integer);
begin
  try
    qAux_COFINS := TADOQuery.Create(nil);
    with qAux_COFINS, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select RCOFINS.Codigo, RCOFINS.Aliquota, RCOFINS.Tipo_Calculo, RCOFINS.Base_Reduzida, RCOFINS.Base_Acrescida, RCOFINS.Percentual_BC_Reduzida, RCOFINS.Percentual_BC_Acrescida,');
      add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_COFINS from Produto Pro');
      add('inner join Tratamento_COFINS TCOFINS on (Pro.Codigo_Grupo_Tributacao_COFINS = TCOFINS.Codigo)');
      add('inner join Itens_Tratamento_COFINS ITCOFINS on (TCOFINS.Codigo = ITCOFINS.Codigo and ITCOFINS.Origem = :GO1 and ITCOFINS.Destino = :GO2)');
      add('inner join Regra_COFINS RCOFINS on (ITCOFINS.Regra_Nao_Contribuinte = RCOFINS.Codigo)');
      add('inner join Cadastro_Situacao_Tributaria CST on (RCOFINS.Codigo_Situacao_Tributaria = CST.Codigo)');
      add('where Pro.Codigo_Grupo_Tributacao_COFINS = :Grupo');
      Parameters.ParamByName('GO1').Value := UF;
      Parameters.ParamByName('GO2').Value := UF;
      Parameters.ParamByName('Grupo').Value := Grupo;
      open;
    end;
  finally
    // FreeAndNil(qAux_ICMS);
  end;
end;

procedure Pega_COFINS_Saida(Grupo: Integer; var Conexao: TADOConnection);
begin
  try
    qAux_COFINS := TADOQuery.Create(nil);
    if (enquadramento_empresa = 'EN') then
    begin
      with qAux_COFINS, SQL do
      begin
        close;
        Connection := Conexao;
        clear;
        add('select RCOFINS.Codigo, RCOFINS.Aliquota, RCOFINS.Tipo_Calculo, RCOFINS.Base_Reduzida, RCOFINS.Base_Acrescida, RCOFINS.Percentual_BC_Reduzida, RCOFINS.Percentual_BC_Acrescida,');
        add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_COFINS from Produto Pro');
        add('inner join Tratamento_COFINS TCOFINS on (Pro.Codigo_Grupo_Tributacao_COFINS = TCOFINS.Codigo)');
        add('inner join Itens_Tratamento_COFINS ITCOFINS on (TCOFINS.Codigo = ITCOFINS.Codigo)');
        add('inner join Regra_COFINS RCOFINS on (ITCOFINS.Saida_Regra_EN = RCOFINS.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RCOFINS.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao_COFINS = :Grupo');
        // Parameters.ParamByName('GO1').Value := Origem;
        // Parameters.ParamByName('GO2').Value := Destino;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end
    else if (enquadramento_empresa = 'EPP') then
    begin
      with qAux_COFINS, SQL do
      begin
        close;
        Connection := Conexao;
        clear;
        add('select RCOFINS.Codigo, RCOFINS.Aliquota, RCOFINS.Tipo_Calculo, RCOFINS.Base_Reduzida, RCOFINS.Base_Acrescida, RCOFINS.Percentual_BC_Reduzida, RCOFINS.Percentual_BC_Acrescida,');
        add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_COFINS from Produto Pro');
        add('inner join Tratamento_COFINS TCOFINS on (Pro.Codigo_Grupo_Tributacao_COFINS = TCOFINS.Codigo)');
        add('inner join Itens_Tratamento_COFINS ITCOFINS on (TCOFINS.Codigo = ITCOFINS.Codigo)');
        add('inner join Regra_COFINS RCOFINS on (ITCOFINS.Saida_Regra_EPP = RCOFINS.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RCOFINS.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao_COFINS = :Grupo');
        // Parameters.ParamByName('GO1').Value := Origem;
        // Parameters.ParamByName('GO2').Value := Destino;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end
    else if (enquadramento_empresa = 'ME') then
    begin
      with qAux_COFINS, SQL do
      begin
        close;
        Connection := Conexao;
        clear;
        add('select RCOFINS.Codigo, RCOFINS.Aliquota, RCOFINS.Tipo_Calculo, RCOFINS.Base_Reduzida, RCOFINS.Base_Acrescida, RCOFINS.Percentual_BC_Reduzida, RCOFINS.Percentual_BC_Acrescida,');
        add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_COFINS from Produto Pro');
        add('inner join Tratamento_COFINS TCOFINS on (Pro.Codigo_Grupo_Tributacao_COFINS = TCOFINS.Codigo)');
        add('inner join Itens_Tratamento_COFINS ITCOFINS on (TCOFINS.Codigo = ITCOFINS.Codigo)');
        add('inner join Regra_COFINS RCOFINS on (ITCOFINS.Saida_Regra_ME = RCOFINS.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RCOFINS.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao_COFINS = :Grupo');
        // Parameters.ParamByName('GO1').Value := Origem;
        // Parameters.ParamByName('GO2').Value := Destino;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end;
  finally
    // FreeAndNil(qAux_ICMS);
  end;
end;

procedure Pega_COFINS_Entrada(Grupo: Integer);
begin
  try
    qAux_COFINS_Entrada := TADOQuery.Create(nil);
    if (enquadramento_empresa = 'EN') then
    begin
      with qAux_COFINS_Entrada, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select RCOFINS.Codigo, RCOFINS.Aliquota, RCOFINS.Tipo_Calculo, RCOFINS.Base_Reduzida, RCOFINS.Base_Acrescida, RCOFINS.Percentual_BC_Reduzida, RCOFINS.Percentual_BC_Acrescida,');
        add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_COFINS from Produto Pro');
        add('inner join Tratamento_COFINS TCOFINS on (Pro.Codigo_Grupo_Tributacao_COFINS = TCOFINS.Codigo)');
        add('inner join Itens_Tratamento_COFINS ITCOFINS on (TCOFINS.Codigo = ITCOFINS.Codigo)');
        add('inner join Regra_COFINS RCOFINS on (ITCOFINS.Entrada_Regra_EN = RCOFINS.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RCOFINS.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao_COFINS = :Grupo');
        // Parameters.ParamByName('GO1').Value := Origem;
        // Parameters.ParamByName('GO2').Value := Destino;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end
    else if (enquadramento_empresa = 'EPP') then
    begin
      with qAux_COFINS_Entrada, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select RCOFINS.Codigo, RCOFINS.Aliquota, RCOFINS.Tipo_Calculo, RCOFINS.Base_Reduzida, RCOFINS.Base_Acrescida, RCOFINS.Percentual_BC_Reduzida, RCOFINS.Percentual_BC_Acrescida,');
        add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_COFINS from Produto Pro');
        add('inner join Tratamento_COFINS TCOFINS on (Pro.Codigo_Grupo_Tributacao_COFINS = TCOFINS.Codigo)');
        add('inner join Itens_Tratamento_COFINS ITCOFINS on (TCOFINS.Codigo = ITCOFINS.Codigo)');
        add('inner join Regra_COFINS RCOFINS on (ITCOFINS.Entrada_Regra_EPP = RCOFINS.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RCOFINS.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao_COFINS = :Grupo');
        // Parameters.ParamByName('GO1').Value := Origem;
        // Parameters.ParamByName('GO2').Value := Destino;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end
    else if (enquadramento_empresa = 'ME') then
    begin
      with qAux_COFINS_Entrada, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select RCOFINS.Codigo, RCOFINS.Aliquota, RCOFINS.Tipo_Calculo, RCOFINS.Base_Reduzida, RCOFINS.Base_Acrescida, RCOFINS.Percentual_BC_Reduzida, RCOFINS.Percentual_BC_Acrescida,');
        add('CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao_COFINS from Produto Pro');
        add('inner join Tratamento_COFINS TCOFINS on (Pro.Codigo_Grupo_Tributacao_COFINS = TCOFINS.Codigo)');
        add('inner join Itens_Tratamento_COFINS ITCOFINS on (TCOFINS.Codigo = ITCOFINS.Codigo)');
        add('inner join Regra_COFINS RCOFINS on (ITCOFINS.Entrada_Regra_ME = RCOFINS.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RCOFINS.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao_COFINS = :Grupo');
        // Parameters.ParamByName('GO1').Value := Origem;
        // Parameters.ParamByName('GO2').Value := Destino;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end;
  finally
    // FreeAndNil(qAux_ICMS);
  end;
end;

function Pega_ICMS_NC(Grupo: Integer; var Conexao: TADOConnection): boolean;
begin
  try
    Result := false;
    qAux_ICMS := TADOQuery.Create(nil);
    with qAux_ICMS, SQL do
    begin
      close;
      Connection := Conexao;
      clear;
      add('select RI.Codigo, RI.Aliquota, RI.CFOP_D, RI.CFOP_F, RI.Tipo_Recolhimento, RI.Tipo_Calculo_BC_ICMS, RI.Tipo_Calculo_BC_ICMS_ST, RI.Base_Reduzida, RI.Base_Acrescida, RI.Percentual_BC_Reduzida, RI.Percentual_BC_Acrescida,');
      add('CST.Origem, CST.Codigo_Situacao, CST.Codigo_CSOSN, CST.Permite_Credito, CST.Codigo_Obs_Fiscal, Pro.Codigo_Grupo_Tributacao from Produto Pro');
      add('inner join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
      add('inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
      add('inner join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Codigo)');
      add('inner join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');
      add('where Pro.Codigo_Grupo_Tributacao = :Grupo');
      Parameters.ParamByName('GO1').Value := UF;
      Parameters.ParamByName('GO2').Value := UF;
      Parameters.ParamByName('Grupo').Value := Grupo;
      open;
      if not(IsEmpty) then
      begin
        Result := true;
      end;
    end;
  finally
    // FreeAndNil(qAux_ICMS);
  end;
end;

function Pega_ICMS_NC_Outro(Grupo: Integer; Origem, Destino: AnsiString;
  Conexao: TADOConnection): boolean;
begin
  try
    Result := false;
    qAux_ICMS := TADOQuery.Create(nil);
    with qAux_ICMS, SQL do
    begin
      close;
      Connection := Conexao;
      clear;
      add('select RI.Codigo, RI.Aliquota, RI.CFOP_D, RI.CFOP_F, RI.Tipo_Recolhimento, RI.Tipo_Calculo_BC_ICMS, RI.Tipo_Calculo_BC_ICMS_ST, RI.Base_Reduzida, RI.Base_Acrescida, RI.Percentual_BC_Reduzida, RI.Percentual_BC_Acrescida,');
      add('CST.Origem, CST.Codigo_Situacao, CST.Codigo_CSOSN, CST.Permite_Credito, CST.Codigo_Obs_Fiscal, Pro.Codigo_Grupo_Tributacao from Produto Pro');
      add('inner join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
      add('inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
      add('inner join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Codigo)');
      add('inner join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');
      add('where Pro.Codigo_Grupo_Tributacao = :Grupo');
      Parameters.ParamByName('GO1').Value := Origem;
      Parameters.ParamByName('GO2').Value := Destino;
      Parameters.ParamByName('Grupo').Value := Grupo;
      open;
      if not(IsEmpty) then
      begin
        Result := true;
      end;
    end;
  finally
    // FreeAndNil(qAux_ICMS);
  end;
end;

function Pega_ICMS_Saida(Grupo: Integer; UF1, UF2: AnsiString;
  Conexao: TADOConnection): boolean;
begin
  try
    Result := false;
    qAux_ICMS := TADOQuery.Create(nil);
    if (enquadramento_empresa = 'EN') then
    begin
      with qAux_ICMS, SQL do
      begin
        close;
        Connection := Conexao;
        clear;
        add('select RI.Codigo, RI.Aliquota, RI.CFOP_D, RI.CFOP_F, RI.Tipo_Recolhimento, RI.Tipo_Calculo_BC_ICMS, RI.Tipo_Calculo_BC_ICMS_ST, RI.Base_Reduzida, RI.Base_Acrescida, RI.Percentual_BC_Reduzida, RI.Percentual_BC_Acrescida,');
        add('CST.Origem, CST.Codigo_Situacao, CST.Codigo_CSOSN, CST.Permite_Credito, CST.Codigo_Obs_Fiscal, Pro.Codigo_Grupo_Tributacao from Produto Pro');
        add('inner join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
        add('inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
        add('inner join Regra_ICMS RI on (ITI.Saida_Regra_EN = RI.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao = :Grupo');
        Parameters.ParamByName('GO1').Value := UF1;
        Parameters.ParamByName('GO2').Value := UF2;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
        if not(IsEmpty) then
        begin
          Result := true;
        end;
      end;
    end
    else if (enquadramento_empresa = 'EPP') then
    begin
      with qAux_ICMS, SQL do
      begin
        close;
        Connection := Conexao;
        clear;
        add('select RI.Codigo, RI.Aliquota, RI.CFOP_D, RI.CFOP_F, RI.Tipo_Recolhimento, RI.Tipo_Calculo_BC_ICMS, RI.Tipo_Calculo_BC_ICMS_ST, RI.Base_Reduzida, RI.Base_Acrescida, RI.Percentual_BC_Reduzida, RI.Percentual_BC_Acrescida,');
        add('CST.Origem, CST.Codigo_Situacao, CST.Codigo_CSOSN, CST.Permite_Credito, CST.Codigo_Obs_Fiscal, Pro.Codigo_Grupo_Tributacao from Produto Pro');
        add('inner join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
        add('inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
        add('inner join Regra_ICMS RI on (ITI.Saida_Regra_EPP = RI.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao = :Grupo');
        Parameters.ParamByName('GO1').Value := UF1;
        Parameters.ParamByName('GO2').Value := UF2;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
        if not(IsEmpty) then
        begin
          Result := true;
        end;
      end;
    end
    else if (enquadramento_empresa = 'ME') then
    begin
      with qAux_ICMS, SQL do
      begin
        close;
        Connection := Conexao;
        clear;
        add('select RI.Codigo, RI.Aliquota, RI.CFOP_D, RI.CFOP_F, RI.Tipo_Recolhimento, RI.Tipo_Calculo_BC_ICMS, RI.Tipo_Calculo_BC_ICMS_ST, RI.Base_Reduzida, RI.Base_Acrescida, RI.Percentual_BC_Reduzida, RI.Percentual_BC_Acrescida,');
        add('CST.Origem, CST.Codigo_Situacao, CST.Codigo_CSOSN, CST.Permite_Credito, CST.Codigo_Obs_Fiscal, Pro.Codigo_Grupo_Tributacao from Produto Pro');
        add('inner join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
        add('inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
        add('inner join Regra_ICMS RI on (ITI.Saida_Regra_ME = RI.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao = :Grupo');
        Parameters.ParamByName('GO1').Value := UF1;
        Parameters.ParamByName('GO2').Value := UF2;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
        if not(IsEmpty) then
        begin
          Result := true;
        end;
      end;
    end;
  finally
    // FreeAndNil(qAux_ICMS);
  end;
end;

procedure Pega_ICMS_Qualquer(Grupo: Integer; UF1, UF2: AnsiString;
  var Conexao: TADOConnection);
begin
  try
    qAux_ICMS_Qualquer := TADOQuery.Create(nil);
    if (enquadramento_empresa = 'EN') then
    begin
      with qAux_ICMS_Qualquer, SQL do
      begin
        close;
        Connection := Conexao;
        clear;
        add('select RI.Codigo, RI.Aliquota, RI.CFOP_D, RI.CFOP_F, RI.Tipo_Recolhimento, RI.Tipo_Calculo_BC_ICMS, RI.Tipo_Calculo_BC_ICMS_ST, RI.Base_Reduzida, RI.Base_Acrescida, RI.Percentual_BC_Reduzida, RI.Percentual_BC_Acrescida,');
        add('CST.Origem, CST.Codigo_Situacao, CST.Codigo_CSOSN, CST.Permite_Credito, CST.Codigo_Obs_Fiscal, Pro.Codigo_Grupo_Tributacao from Produto Pro');
        add('inner join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
        add('inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
        add('inner join Regra_ICMS RI on (ITI.Saida_Regra_EN = RI.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao = :Grupo');
        Parameters.ParamByName('GO1').Value := UF1;
        Parameters.ParamByName('GO2').Value := UF2;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end
    else if (enquadramento_empresa = 'EPP') then
    begin
      with qAux_ICMS_Qualquer, SQL do
      begin
        close;
        Connection := Conexao;
        clear;
        add('select RI.Codigo, RI.Aliquota, RI.CFOP_D, RI.CFOP_F, RI.Tipo_Recolhimento, RI.Tipo_Calculo_BC_ICMS, RI.Tipo_Calculo_BC_ICMS_ST, RI.Base_Reduzida, RI.Base_Acrescida, RI.Percentual_BC_Reduzida, RI.Percentual_BC_Acrescida,');
        add('CST.Origem, CST.Codigo_Situacao, CST.Codigo_CSOSN, CST.Permite_Credito, CST.Codigo_Obs_Fiscal, Pro.Codigo_Grupo_Tributacao from Produto Pro');
        add('inner join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
        add('inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
        add('inner join Regra_ICMS RI on (ITI.Saida_Regra_EPP = RI.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao = :Grupo');
        Parameters.ParamByName('GO1').Value := UF1;
        Parameters.ParamByName('GO2').Value := UF2;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end
    else if (enquadramento_empresa = 'ME') then
    begin
      with qAux_ICMS_Qualquer, SQL do
      begin
        close;
        Connection := Conexao;
        clear;
        add('select RI.Codigo, RI.Aliquota, RI.CFOP_D, RI.CFOP_F, RI.Tipo_Recolhimento, RI.Tipo_Calculo_BC_ICMS, RI.Tipo_Calculo_BC_ICMS_ST, RI.Base_Reduzida, RI.Base_Acrescida, RI.Percentual_BC_Reduzida, RI.Percentual_BC_Acrescida,');
        add('CST.Origem, CST.Codigo_Situacao, CST.Codigo_CSOSN, CST.Permite_Credito, CST.Codigo_Obs_Fiscal, Pro.Codigo_Grupo_Tributacao from Produto Pro');
        add('inner join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
        add('inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
        add('inner join Regra_ICMS RI on (ITI.Saida_Regra_ME = RI.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao = :Grupo');
        Parameters.ParamByName('GO1').Value := UF1;
        Parameters.ParamByName('GO2').Value := UF2;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end;
  finally
    // FreeAndNil(qAux_ICMS_Qualquer);
  end;
end;

procedure Pega_ICMS_Entrada(Grupo: Integer; Origem, Destino: AnsiString);
begin
  try
    qAux_ICMS_Entrada := TADOQuery.Create(nil);
    if (enquadramento_empresa = 'EN') then
    begin
      with qAux_ICMS_Entrada, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select RI.Codigo, RI.Aliquota, RI.Tipo_Recolhimento, RI.Base_Reduzida, RI.Base_Acrescida, RI.Percentual_BC_Reduzida, RI.Percentual_BC_Acrescida,');
        add('CST.Origem, CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao from Produto Pro');
        add('inner join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
        add('inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
        add('inner join Regra_ICMS RI on (ITI.Entrada_Regra_EN = RI.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao = :Grupo');
        Parameters.ParamByName('GO1').Value := Origem;
        Parameters.ParamByName('GO2').Value := Destino;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end
    else if (enquadramento_empresa = 'EPP') then
    begin
      with qAux_ICMS_Entrada, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select RI.Codigo, RI.Aliquota, RI.Tipo_Recolhimento, RI.Base_Reduzida, RI.Base_Acrescida, RI.Percentual_BC_Reduzida, RI.Percentual_BC_Acrescida,');
        add('CST.Origem, CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao from Produto Pro');
        add('inner join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
        add('inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
        add('inner join Regra_ICMS RI on (ITI.Entrada_Regra_EPP = RI.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao = :Grupo');
        Parameters.ParamByName('GO1').Value := Origem;
        Parameters.ParamByName('GO2').Value := Destino;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end
    else if (enquadramento_empresa = 'ME') then
    begin
      with qAux_ICMS_Entrada, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select RI.Codigo, RI.Aliquota, RI.Tipo_Recolhimento, RI.Base_Reduzida, RI.Base_Acrescida, RI.Percentual_BC_Reduzida, RI.Percentual_BC_Acrescida,');
        add('CST.Origem, CST.Codigo_Situacao, Pro.Codigo_Grupo_Tributacao from Produto Pro');
        add('inner join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
        add('inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
        add('inner join Regra_ICMS RI on (ITI.Entrada_Regra_ME = RI.Codigo)');
        add('inner join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao = :Grupo');
        Parameters.ParamByName('GO1').Value := Origem;
        Parameters.ParamByName('GO2').Value := Destino;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end;
  finally
    // FreeAndNil(qAux_ICMS);
  end;
end;

procedure Pega_IPI_NC(Grupo: Integer);
begin
  try
    qAux_IPI := TADOQuery.Create(nil);
    with qAux_IPI, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select RIPI.Descricao as Descricao_IPI, RIPI.Aliquota, RIPI.Tipo_Calculo, RIPI.Tipo_Recolhimento,');
      add('RIPI.Base_Reduzida, RIPI.Percentual_BC_Reduzida, RIPI.Base_Acrescida,');
      add('RIPI.Percentual_BC_Acrescida, CST.Codigo_Situacao, CST.Descricao as Descricao_ST');
      add('from Produto Pro');
      add('inner join Tratamento_IPI TI on (Pro.Codigo_Grupo_Tributacao_IPI = TI.Codigo)');
      add('inner join Itens_Tratamento_IPI ITIPI on (TI.Codigo = ITIPI.Codigo)');
      add('inner join Regra_IPI RIPI on (ITIPI.Regra_Nao_Contribuinte = RIPI.Codigo and ITIPI.Origem = :GO1 and ITIPI.Destino = :GO2)');
      add('left join Cadastro_Situacao_Tributaria CST on (RIPI.Codigo_Situacao_Tributaria = CST.Codigo)');
      add('where Pro.Codigo_Grupo_Tributacao_IPI = :Grupo');
      Parameters.ParamByName('GO1').Value := UF;
      Parameters.ParamByName('GO2').Value := UF;
      Parameters.ParamByName('Grupo').Value := Grupo;
      open;
    end;
  finally
    // FreeAndNil(qAux_ICMS);
  end;
end;

procedure Pega_IPI_Saida(Grupo: Integer; var Conexao: TADOConnection);
begin
  try
    qAux_IPI := TADOQuery.Create(nil);
    if (enquadramento_empresa = 'EN') then
    begin
      with qAux_IPI, SQL do
      begin
        close;
        Connection := Conexao;
        clear;
        add('select RIPI.Descricao as Descricao_IPI, RIPI.Aliquota, RIPI.Tipo_Calculo, RIPI.Tipo_Recolhimento,');
        add('RIPI.Base_Reduzida, RIPI.Percentual_BC_Reduzida, RIPI.Base_Acrescida,');
        add('RIPI.Percentual_BC_Acrescida, CST.Codigo_Situacao, CST.Descricao as Descricao_ST');
        add('from Produto Pro');
        add('inner join Tratamento_IPI TI on (Pro.Codigo_Grupo_Tributacao_IPI = TI.Codigo)');
        add('inner join Itens_Tratamento_IPI ITIPI on (TI.Codigo = ITIPI.Codigo)');
        add('inner join Regra_IPI RIPI on (ITIPI.Saida_Regra_EN = RIPI.Codigo)');
        add('left join Cadastro_Situacao_Tributaria CST on (RIPI.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao_IPI = :Grupo');
        // Parameters.ParamByName('GO1').Value := Origem;
        // Parameters.ParamByName('GO2').Value := Destino;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end
    else if (enquadramento_empresa = 'EPP') then
    begin
      with qAux_IPI, SQL do
      begin
        close;
        Connection := Conexao;
        clear;
        add('select RIPI.Descricao as Descricao_IPI, RIPI.Aliquota, RIPI.Tipo_Calculo, RIPI.Tipo_Recolhimento,');
        add('RIPI.Base_Reduzida, RIPI.Percentual_BC_Reduzida, RIPI.Base_Acrescida,');
        add('RIPI.Percentual_BC_Acrescida, CST.Codigo_Situacao, CST.Descricao as Descricao_ST');
        add('from Produto Pro');
        add('inner join Tratamento_IPI TI on (Pro.Codigo_Grupo_Tributacao_IPI = TI.Codigo)');
        add('inner join Itens_Tratamento_IPI ITIPI on (TI.Codigo = ITIPI.Codigo)');
        add('inner join Regra_IPI RIPI on (ITIPI.Saida_Regra_EPP = RIPI.Codigo)');
        add('left join Cadastro_Situacao_Tributaria CST on (RIPI.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao_IPI = :Grupo');
        // Parameters.ParamByName('GO1').Value := Origem;
        // Parameters.ParamByName('GO2').Value := Destino;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end
    else if (enquadramento_empresa = 'ME') then
    begin
      with qAux_IPI, SQL do
      begin
        close;
        Connection := Conexao;
        clear;
        add('select RIPI.Descricao as Descricao_IPI, RIPI.Aliquota, RIPI.Tipo_Calculo, RIPI.Tipo_Recolhimento,');
        add('RIPI.Base_Reduzida, RIPI.Percentual_BC_Reduzida, RIPI.Base_Acrescida,');
        add('RIPI.Percentual_BC_Acrescida, CST.Codigo_Situacao, CST.Descricao as Descricao_ST');
        add('from Produto Pro');
        add('inner join Tratamento_IPI TI on (Pro.Codigo_Grupo_Tributacao_IPI = TI.Codigo)');
        add('inner join Itens_Tratamento_IPI ITIPI on (TI.Codigo = ITIPI.Codigo)');
        add('inner join Regra_IPI RIPI on (ITIPI.Saida_Regra_ME = RIPI.Codigo)');
        add('left join Cadastro_Situacao_Tributaria CST on (RIPI.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao_IPI = :Grupo');
        // Parameters.ParamByName('GO1').Value := Origem;
        // Parameters.ParamByName('GO2').Value := Destino;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end;
  finally
    // FreeAndNil(qAux_ICMS);
  end;
end;

procedure Pega_IPI_Entrada(Grupo: Integer);
begin
  try
    qAux_IPI_Entrada := TADOQuery.Create(nil);
    if (enquadramento_empresa = 'EN') then
    begin
      with qAux_IPI_Entrada, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select RIPI.Descricao as Descricao_IPI, RIPI.Aliquota, RIPI.Tipo_Recolhimento,');
        add('RIPI.Base_Reduzida, RIPI.Percentual_BC_Reduzida, RIPI.Base_Acrescida,');
        add('RIPI.Percentual_BC_Acrescida, CST.Codigo_Situacao, CST.Descricao as Descricao_ST');
        add('from Produto Pro');

        add('inner join Tratamento_IPI TI on (Pro.Codigo_Grupo_Tributacao_IPI = TI.Codigo)');
        add('inner join Itens_Tratamento_IPI ITIPI on (TI.Codigo = ITIPI.Codigo)');
        add('inner join Regra_IPI RIPI on (ITIPI.Entrada_Regra_EN = RIPI.Codigo)');
        add('left join Cadastro_Situacao_Tributaria CST on (RIPI.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao_IPI = :Grupo');
        // Parameters.ParamByName('GO1').Value := Origem;
        // Parameters.ParamByName('GO2').Value := Destino;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end
    else if (enquadramento_empresa = 'EPP') then
    begin
      with qAux_IPI_Entrada, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select RIPI.Descricao as Descricao_IPI, RIPI.Aliquota, RIPI.Tipo_Recolhimento,');
        add('RIPI.Base_Reduzida, RIPI.Percentual_BC_Reduzida, RIPI.Base_Acrescida,');
        add('RIPI.Percentual_BC_Acrescida, CST.Codigo_Situacao, CST.Descricao as Descricao_ST');
        add('from Produto Pro');

        add('inner join Tratamento_IPI TI on (Pro.Codigo_Grupo_Tributacao_IPI = TI.Codigo)');
        add('inner join Itens_Tratamento_IPI ITIPI on (TI.Codigo = ITIPI.Codigo)');
        add('inner join Regra_IPI RIPI on (ITIPI.Entrada_Regra_EPP = RIPI.Codigo)');
        add('left join Cadastro_Situacao_Tributaria CST on (RIPI.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao_IPI = :Grupo');
        // Parameters.ParamByName('GO1').Value := Origem;
        // Parameters.ParamByName('GO2').Value := Destino;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end
    else if (enquadramento_empresa = 'ME') then
    begin
      with qAux_IPI_Entrada, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select RIPI.Descricao as Descricao_IPI, RIPI.Aliquota, RIPI.Tipo_Recolhimento,');
        add('RIPI.Base_Reduzida, RIPI.Percentual_BC_Reduzida, RIPI.Base_Acrescida,');
        add('RIPI.Percentual_BC_Acrescida, CST.Codigo_Situacao, CST.Descricao as Descricao_ST');
        add('from Produto Pro');

        add('inner join Tratamento_IPI TI on (Pro.Codigo_Grupo_Tributacao_IPI = TI.Codigo)');
        add('inner join Itens_Tratamento_IPI ITIPI on (TI.Codigo = ITIPI.Codigo)');
        add('inner join Regra_IPI RIPI on (ITIPI.Entrada_Regra_ME = RIPI.Codigo)');
        add('left join Cadastro_Situacao_Tributaria CST on (RIPI.Codigo_Situacao_Tributaria = CST.Codigo)');
        add('where Pro.Codigo_Grupo_Tributacao_IPI = :Grupo');
        // Parameters.ParamByName('GO1').Value := Origem;
        // Parameters.ParamByName('GO2').Value := Destino;
        Parameters.ParamByName('Grupo').Value := Grupo;
        open;
      end;
    end;

  finally
    // FreeAndNil(qAux_ICMS);
  end;
end;

procedure Pega_ISS(Grupo: Integer);
begin
  try
    qAux_ISS := TADOQuery.Create(nil);
    with qAux_ISS, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select RISS.Codigo, RISS.Aliquota, RISS.Tributacao, RISS.Base_Reduzida, RISS.Base_Acrescida, RISS.Percentual_BC_Reduzida, RISS.Percentual_BC_Acrescida,');
      add('Pro.Codigo_Grupo_Tributacao_ISSQN from Produto Pro');
      add('inner join Regra_ISSQN RISS on (Pro.Codigo_Grupo_Tributacao_ISSQN = RISS.Codigo)');
      add('where Pro.Codigo_Grupo_Tributacao_ISSQN = :Grupo');
      Parameters.ParamByName('Grupo').Value := Grupo;
      open;
    end;
  finally
    // FreeAndNil(qAux_ISS);
  end;
end;

procedure Atualiza_Impostos(Valor_Total: Double);
var
  BC_Aux, BCST: Double;
begin
  // calcula icms, caso for preciso do cupom fiscal

  icms_st := '0';
  valor_icms_st := '0';
  bc_icms_st := '0';
  ba_icms_st := '0';
  valor_icms_st := '0';

  // -------------------------------- icms
  // if (regime_tributario_emitente = '2') then
  // begin

  // end
  // else
  // begin

  if (csosn = '101') then
  begin
    UDeclaracao.credito_icms := FloatToStr((StrToFloat(aliquota_sn) / 100) *
      Valor_Total);
  end
  else if (csosn = '102') or (csosn = '103') then
  begin
    UDeclaracao.credito_icms := '0';
  end
  else if (csosn = '201') or (csosn = '202') or (csosn = '203') or
    (csosn = '500') then
  begin

    if (csosn = '201') then
      UDeclaracao.credito_icms := FloatToStr((StrToFloat(aliquota_sn) / 100) *
        Valor_Total)
    else if (csosn = '202') or (csosn = '203') or (csosn = '500') then
      UDeclaracao.credito_icms := '0';
  end
  else if (csosn = '101') or (csosn = '102') or (csosn = '103') or
    (csosn = '300') or (csosn = '400') then
  begin
    icms_st := '0';
    valor_icms_st := '0';
    bc_icms_st := '0';
  end;

  if (csosn <> '900') then
  begin
    // bc_icms_nf:= '0';
    // valor_icms_nf:= '0';
  end;

  { valor_icms_st:= '0';
    icms_st:= '0';
    bc_icms_st:= '0'; }

  /// /// ------------------------------ fim ICMS

  /// /// -----------------IPI

  if (ipi = '') then
    ipi := '0';

  if (br_ipi <> '') then
  begin
    BC_Aux := (StrToFloat(br_ipi) / 100) * Valor_Total;
    bc_ipi := FloatToStr(Valor_Total - BC_Aux);
    bc_ipi := FloatToStr(Calcula_Valor(bc_ipi));
  end
  else if (ba_ipi <> '') then
  begin
    BC_Aux := (StrToFloat(ba_ipi) / 100) * Valor_Total;
    bc_ipi := FloatToStr(Valor_Total + BC_Aux);
    bc_ipi := FloatToStr(Calcula_Valor(bc_ipi));
  end
  else
  begin
    bc_ipi := FloatToStr(Valor_Total);
    bc_ipi := FloatToStr(Calcula_Valor(bc_ipi));
  end;

  if (ipi = 'I') or (ipi = 'N') or (ipi = 'F') or (ipi = '0') then
  begin
    valor_ipi := '0';
    bc_ipi := '0';
  end
  else
  begin
    valor_ipi := FloatToStr((StrToFloat(ipi) / 10000) * StrToFloat(bc_ipi));
    valor_ipi := FloatToStr(Calcula_Valor(valor_ipi));
  end;

  /// /////////----------------- fim IPI-----------------------//////////

  /// /// -----------------PIS

  if (pis = '') then
    pis := '0';

  if (br_pis <> '') then
  begin
    BC_Aux := (StrToFloat(br_pis) / 100) * Valor_Total;
    bc_pis := FloatToStr(Valor_Total - BC_Aux);
    bc_pis := FloatToStr(Calcula_Valor(bc_pis));
  end
  else if (ba_pis <> '') then
  begin
    BC_Aux := (StrToFloat(ba_pis) / 100) * Valor_Total;
    bc_pis := FloatToStr(Valor_Total + BC_Aux);
    bc_pis := FloatToStr(Calcula_Valor(bc_pis));
  end
  else
  begin
    bc_pis := FloatToStr(Valor_Total);
    bc_pis := FloatToStr(Calcula_Valor(bc_pis));
  end;

  if (pis = 'I') or (pis = 'N') or (pis = 'F') or (pis = '0') then
  begin
    valor_pis := '0';
    bc_pis := '0';
  end
  else
  begin
    valor_pis := FloatToStr((StrToFloat(pis) / 10000) * StrToFloat(bc_pis));
    valor_pis := FloatToStr(Calcula_Valor(valor_pis));
  end;

  /// /////////----------------- fim IPI-----------------------//////////

  /// /// -----------------COFINS

  if (cofins = '') then
    cofins := '0';

  if (br_cofins <> '') then
  begin
    BC_Aux := (StrToFloat(br_cofins) / 100) * Valor_Total;
    bc_cofins := FloatToStr(Valor_Total - BC_Aux);
    bc_cofins := FloatToStr(Calcula_Valor(bc_cofins));
  end
  else if (ba_cofins <> '') then
  begin
    BC_Aux := (StrToFloat(ba_cofins) / 100) * Valor_Total;
    bc_cofins := FloatToStr(Valor_Total + BC_Aux);
    bc_cofins := FloatToStr(Calcula_Valor(bc_cofins));
  end
  else
  begin
    bc_cofins := FloatToStr(Valor_Total);
    bc_cofins := FloatToStr(Calcula_Valor(bc_cofins));
  end;

  if (cofins = 'I') or (cofins = 'N') or (cofins = 'F') or (cofins = '0') then
  begin
    valor_cofins := '0';
    bc_cofins := '0';
  end
  else
  begin
    valor_cofins := FloatToStr((StrToFloat(cofins) / 10000) *
      StrToFloat(bc_cofins));
    valor_cofins := FloatToStr(Calcula_Valor(valor_cofins));
  end;

  /// /////////----------------- fim COFINS-----------------------//////////

  sub_total_liquido := FloatToStr(Valor_Total);

end;

procedure Pega_Tabela_Preco(Tabela, Produto: Integer);
begin
  try
    qAux_Tabela_Preco := TADOQuery.Create(nil);
    with qAux_Tabela_Preco, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select TP.*, ITP.* from Tabela_Preco TP');
      add('inner join Itens_Tabela_Preco ITP on (TP.Codigo = ITP.Codigo)');
      add('where TP.Codigo = :Tabela and ITP.Codigo_Produto = :Produto');
      Parameters.ParamByName('Tabela').Value := Tabela;
      Parameters.ParamByName('Produto').Value := Produto;
      open;
    end;
  finally
    // FreeAndNil(qAux_ISS);
  end;
end;

function Pega_Total_Pedido(Pedido: Integer;
  var Conexao: TADOConnection): Double;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := Conexao;
      clear;
      add('select sum(IP.Qtde * (IP.Valor_Original - IP.Desc_Acr) ) as Total_Pedido from Itens_Pedido IP');
      add('where IP.Codigo = :Codigo and IP.Cancelado = :N');
      Parameters.ParamByName('Codigo').Value := Pedido;
      Parameters.ParamByName('N').Value := 'N';
      open;
      Result := qAux.FieldByName('Total_Pedido').AsFloat;
    end;
  finally

  end;
end;

function Pega_Total_Impostos(Pedido: Integer;
  var Conexao: TADOConnection): Double;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := Conexao;
      clear;
      add('select sum(IP.Valor_ICMS_ST) as Total_Impostos from Itens_Pedido IP');
      add('where IP.Codigo = :Codigo and IP.Cancelado = :N');
      Parameters.ParamByName('Codigo').Value := Pedido;
      Parameters.ParamByName('N').Value := 'N';
      open;
      Result := qAux.FieldByName('Total_Impostos').AsFloat;
    end;
  finally

  end;
end;

function Pega_Total_Desconto(Pedido: Integer;
  var Conexao: TADOConnection): Double;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := Conexao;
      clear;
      add('select sum(IP.Qtde * IP.Desc_Acr) as Total_Desconto from Itens_Pedido IP');
      add('where IP.Codigo = :Codigo and IP.Cancelado = :N');
      Parameters.ParamByName('Codigo').Value := Pedido;
      Parameters.ParamByName('N').Value := 'N';
      open;
      Result := qAux.FieldByName('Total_Desconto').AsFloat;
    end;
  finally

  end;
end;

procedure Carrega_Dados_D2(datai, dataf : string);
begin
  qD2 := TADOQuery.Create(nil);
  with qD2, SQL do
  begin
    close;
    Connection := dm.ADOConnection1;
    clear;
    add('select PIECF.N_Sequencia, PIECF.N_Fabricacao_ECF, P.N_Pedido, ');
    add('PIECF.MF_Adicional, PIECF.Tipo_ECF, PIECF.Marca_ECF, PIECF.Modelo_ECF, PIECF.COO_Vin, ');
    Add('P.Hora_Venda, P.COO, P.Codigo as codPedido, P.Data_Venda, ');
    add('P.Total_Pedido, P.MD5 as MD5_Pedido, C.Nome_Nome_Fantasia, C.CPF, C.CNPJ ');
    add('from Pedido_Informacoes_ECF PIECF');
    add('inner join Pedido P on (PIECF.Codigo_Pedido = P.Codigo)');
    add('inner join Cliente C on (P.Codigo_Cliente = C.Codigo)');
    add('where P.Data_Venda between :DI and :DF');
    Parameters.ParamByName('DI').Value := datai;
    Parameters.ParamByName('DF').Value := dataf;
    open;
    First;
  end;
end;

procedure Carrega_Dados_D3(datai, dataf : string);
begin
  qD3 := TADOQuery.Create(nil);
  with qD3, SQL do
  begin
    close;
    Connection := dm.ADOConnection1;
    clear;
    add('select P.N_Pedido, P.Data_Venda, I.N_Item, I.Codigo, I.Codigo_Produto,');
    add('I.Descricao, I.Qtde, I.UN, I.Valor_Unitario, I.MD5,');
    add('I.Desc_Acr, I.Desc_Acr, I.Sub_Total, I.Tipo_Recolhimento, I.ICMS, I.Cancelado ');
    add('from Itens_Pedido I');
    add('inner join Pedido P on (I.Codigo = P.Codigo)');
    Add('where I.Codigo = :q2codigo');
    Parameters.ParamByName('q2codigo').Value := qD2.FieldByName('codPedido').AsInteger;
    open;
    First;
  end;
end;

procedure Carrega_Dados_D4;
begin

  qD4 := TADOQuery.Create(nil);
  with qD4, SQL do
  begin
    close;
    Connection := dm.ADOConnection1;
    clear;
    add('select L.N_Pedido, L.Codigo_Registro, L.Codigo_Produto, L.dtAlteracao, ');
    add('L.hrAlteracao, L.tipo_alteracao, I.Cancelado, I.Descricao, I.Qtde, ');
    add('I.UN, I.Valor_Unitario, I.Desc_Acr, I.Sub_Total, I.Tipo_Recolhimento, ');
    Add('I.ICMS, I.CST from LogItensPedido L ');
    add('INNER JOIN Itens_Pedido I on(I.Codigo_Registro = L.Codigo_Registro)');
//    add('where L.dtAlteracao between :DI and :DF');
    add('where L.N_Pedido = :npedido');
    Parameters.ParamByName('npedido').Value := qD2.FieldByName('codPedido').AsInteger;
//    Parameters.ParamByName('DI').Value := MEdtData_Inicial.Text;
//    Parameters.ParamByName('DF').Value := MEdtData_Final.Text;
    open;
    First;
  end;

end;

procedure Carrega_Dados_ECFE3(datai, dataf : string);
begin
  qE3 := TADOQuery.Create(nil);
  with qE3, SQL do
  begin
    close;
    Connection := dm.ADOConnection1;
    clear;
    add('select * from PAFE3 where dt_estoque between :DI and :DF');
    Parameters.ParamByName('DI').Value := StrToDate(datai);
    Parameters.ParamByName('DF').Value := StrToDate(dataf);
    open;
    First;
  end;
end;

procedure Carrega_Dados_EstoqueE2(FormAberto: AnsiString);
begin
  if (FormAberto = 'Geral') then
  begin
    qE2 := TADOQuery.Create(nil);
    with qE2, SQL do
    begin
      close;
      Connection := dm.ADOConnection1;
      clear;
      add('select P.Codigo_Venda,P.MD5, P.Descricao, P.Status_Estoque_Data, P.Estoque, UM.Sigla from Produto P');
      add('left join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
      // Add('where Status = ATIVO');
      // Parameters.ParamByName('Status').Value := 'ATIVO';
      // Parameters.ParamByName('Tipo').Value := 0;
      open;
      First;
    end;
  end
  else if (FormAberto = 'RegPAF') then
  begin
    with FrmPAFECF_Registros_PAF.qE2, SQL do
    begin
      close;
      //Connection := dm.ADOConnection1;
      clear;
      add('select P.Codigo_Venda,P.MD5, P.Descricao, P.Status_Estoque_Data, P.Estoque, UM.Sigla from Produto P');
      add('left join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Codigo)');
      // Add('where Status = ATIVO');
      // Parameters.ParamByName('Status').Value := 'ATIVO';
      // Parameters.ParamByName('Tipo').Value := 0;
      open;
      First;
    end;
  end;
end;

procedure Carrega_Dados_Meios_PagamentoA2(datai, dataf : string);
begin
  qMeiosPagamento := TADOQuery.Create(nil);
  with qMeiosPagamento, SQL do
  begin
    close;
    clear;
    Connection := dm.ADOConnection1;
    add('select * from Fechamento_Caixa where Data_Fechamento between :DI and :DF');
    Parameters.ParamByName('DI').Value := StrToDateTime(datai);
    Parameters.ParamByName('DF').Value := StrToDateTime(dataf);
//    Parameters.ParamByName('Status').Value := 'PAGO';
//    Parameters.ParamByName('Tipo1').Value := 'CUPOM FISCAL';
//    Parameters.ParamByName('Tipo2').Value := 'SUPRIMENTO';
//    Parameters.ParamByName('Tipo3').Value := 'SANGRIA';
    open;
    First;
  end;
end;

procedure Carrega_Dados_ProdutosP2;
begin
  qP2 := TADOQuery.Create(nil);
  with qP2, SQL do
  begin
    close;
    Connection := dm.ADOConnection1;
    clear;
    add('select ITP.Preco_Vista,');
    add('Pro.Codigo, Pro.Tipo, Pro.Codigo_Venda, Pro.Descricao, Pro.Producao_Propria, Pro.Arred_Trunc, Pro.MD52,');
    add('UM.Sigla, RI.Aliquota as ICMS, RI.Tipo_Recolhimento, RISS.Aliquota as ISS, CST.Codigo_Situacao, ITI.Origem, ITI.Destino from Produto Pro');

    add('left join Itens_Tabela_Preco ITP on (ITP.Codigo_Produto = Pro.Codigo)');
    add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
    add('left join Unidade_Medida UM on (Pro.Codigo_Unidade_Medida = UM.Codigo)');
    add('left join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
    add('left join Itens_Tratamento_ICMS ITI on (ITI.Codigo = TI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
    add('left join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Codigo)');
    add('left join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');
    add('left join Regra_ISSQN RISS on (Pro.Codigo_Grupo_Tributacao_ISSQN = RISS.Codigo)');
    add('where Pro.Status = :Status and TP.Codigo = :Codigo ');
    // and Pro.Codigo = :Produto');
    Parameters.ParamByName('Status').Value := 'ATIVO';
    Parameters.ParamByName('GO1').Value := uf;
    Parameters.ParamByName('GO2').Value := uf;
    Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_ativo;
    // Parameters.ParamByName('Produto').Value:= qryconsulta_produtoCodigo.AsInteger;
    open;
    First;
  end;
end;

procedure Carrega_Dados_R02(datai, dataf : string);
begin
  qR2 := TADOQuery.Create(nil);
  with qR2, SQL do
  begin
    close;
    Connection := dm.ADOConnection1;
    clear;
    add('select * from R02 where Data_Movimento between :DI and :DF and Caixa = :Caixa');
    Parameters.ParamByName('DI').Value := StrToDate(datai);
    Parameters.ParamByName('DF').Value := StrToDate(dataf);
    Parameters.ParamByName('Caixa').Value := UDeclaracao.Sequencia;
    open;
  end;
  qR2.First;
end;

procedure Carrega_Dados_R01;
begin
  qR1 := TADOQuery.Create(nil);
  with qR1, SQL do
  begin
    close;
    Connection := DM.ADOConnection1;
    clear;
    add('select R.Codigo, R.codigo_empresa, R.MD5, E.Codigo, E.CNPJ, CE.Codigo_Empresa, CE.N_Fabricacao from R01 R');
    add('inner join Empresa E on (R.codigo_Empresa = E.Codigo)');
    add('inner join Configuracao_ECF CE on (E.Codigo = CE.Codigo_Empresa)');
    add('where E.Codigo = :Codempresa');
    Parameters.ParamByName('Codempresa').Value := 1;
    open;
  end;
  qR1.First;
end;

procedure Carrega_Dados_R03(datai, dataf : string);
var
  D: TDate;
begin
  qR3 := TADOQuery.Create(nil);
  D:= StrToDate(Retorna_Data_Formatada(qR2.FieldByName('Data_Movimento')
      .AsString, 'DD/MM/YYYY'));
  with qR3, SQL do
  begin
    close;
    Connection := dm.ADOConnection1;
    clear;
    add('select * from R03 where CRZ = :CRZ');
    //Parameters.ParamByName('DI').Value := datai; // Data;
    //Parameters.ParamByName('DF').Value := dataf; // Data;
    Parameters.ParamByName('CRZ').Value := qR2.FieldByName('CRZ').AsInteger;
    open;
  end;
  qR3.First;
end;

procedure Carrega_Dados_R04(datai, dataf : string);
begin
  qR4 := TADOQuery.Create(nil);
  with qR4, SQL do
  begin
    close;
    Connection := dm.ADOConnection1;
    clear;
    add('select * from R04 where Data_Movimento between :datai and :dataf and Caixa = :Caixa');
    Parameters.ParamByName('datai').Value := datai; // Data;
    Parameters.ParamByName('dataf').Value := dataf; // Data;
    Parameters.ParamByName('Caixa').Value := UDeclaracao.Sequencia;
    open;
  end;
  qR4.First;
end;

procedure Carrega_Dados_R05(datai, dataf : string);
begin
  qR5 := TADOQuery.Create(nil);
  with qR5, SQL do
  begin
    close;
    Connection := dm.ADOConnection1;
    clear;
    add('select * from R05 where N_Pedido = :N_Pedido');
    { TODO -oOwner -cGeneral : DATA IGUAL R4 }
//    Parameters.ParamByName('DI').Value := datai; // Data;
//    Parameters.ParamByName('DF').Value := dataf; // Data;
    Parameters.ParamByName('N_Pedido').Value := qR4.FieldByName('N_Pedido').AsInteger;
    open;
  end;
  qR5.First;
end;

procedure Carrega_Dados_R06(datai, dataf : string);
begin
  qR6 := TADOQuery.Create(nil);
  with qR6, SQL do
  begin
    close;
    Connection := dm.ADOConnection1;
    clear;
    add('select * from R06 where Data_Movimento between :datai and :dataf and Caixa = :Caixa');
    Parameters.ParamByName('datai').Value := datai;
    Parameters.ParamByName('dataf').Value := dataf;
    Parameters.ParamByName('Caixa').Value := UDeclaracao.Sequencia;
    open;
  end;
  qR6.First;
end;

procedure Carrega_Dados_R07(qrOnde, datai, dataf : String);
begin
  qR7 := TADOQuery.Create(nil);
  with qR7, SQL do
  begin
    close;
    Connection := dm.ADOConnection1;
    clear;
    if qrOnde = 'qR4' then
    begin
      add('select * from R07 where Data_Movimento = :D and Caixa = :Caixa');
      Parameters.ParamByName('D').Value := qR4.FieldByName('Data_Movimento').AsDateTime;
    end else
    begin
      add('select * from R07 where Data_Movimento between :DI and :DF and Caixa = :Caixa');
      Parameters.ParamByName('DI').Value := StrToDate(datai);
      Parameters.ParamByName('DF').Value := StrToDate(dataf);
    end;
    Parameters.ParamByName('Caixa').Value := UDeclaracao.Sequencia;
    open;
  end;
  qR7.First;
end;

procedure Assina_Arquivo;
var
  arquivo: TStringList;
  caminho, registroEAD: AnsiString;
begin
  // GeraChave;
  setlength(registroEAD, 256);
  caminho := Local_Arquivo(14) + 'Retorno.txt';
  // arquivo:= TStringList.Create;
  // arquivo.LoadFromFile(caminho);
  generateEAD(caminho, cChavePublica, cChavePrivada, registroEAD, 1);
  // arquivo.SaveToFile(caminho);
  // arquivo.Add('EAD'+registroEAD);
  // arquivo.Free;
  Arquivo_Gerado(caminho);
end;


procedure PreencherHeader(Header: TRegistroX1);
begin
  // o header dos relatórios PAF a maioria são todos iguais
  Header.uf := uf;
  Header.CNPJ := cnpj_emitente;
  Header.IE := insc_estadual;
  Header.IM := insc_municipal;
  Header.RAZAOSOCIAL := razao_social;
end;

function ValidaIntervalo: Boolean;
begin
  Result := False;

  Result := true;
end;


function Retorna_Descricao_Unidade(UNSigla: AnsiString): AnsiString;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(nil);
  with qAux, sql do
  begin
    close;
    Connection:= dm.ADOConnection1;
    clear;
    add('select UM.Descricao as Unidade from Unidade_Medida UM');
    Add('where UM.Sigla = '+QuotedStr(UNSigla)+'');
    Open;
  end;
  Result:= qAux.FieldByName('Unidade').AsString;
end;

procedure Analisa_Lista_Unidade(var ListaUnidades:TList<AnsiString>; UN: AnsiString);
var
  i: Integer;
  encontrou: Boolean;
begin
  encontrou:= false;
  for i := 0 to ListaUnidades.Count-1 do
  begin
    if (ListaUnidades.Items[i] = UN) then
    begin
      encontrou:= true;
      Break;
    end;
  end;

  if not (encontrou) then
  begin
    ListaUnidades.Add(UN);
  end;
end;

function Retorna_Aliquota_NCM(NCM, Origem: AnsiString;
  var Conexao: TADOConnection): Double;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := Conexao;
      clear;
      add('select NCM.Aliquota_Nacional, NCM.Aliquota_Importada from NCM ');
      add('where NCM.Codigo_NCM = :Codigo_NCM and NCM.Tabela = :Tabela');
      Parameters.ParamByName('Codigo_NCM').Value := NCM;
      Parameters.ParamByName('Tabela').Value := 0;
      open;

      if (qAux.IsEmpty) then
        Result := 0
      else
      begin
        if (Origem = '0') then
          Result := qAux.FieldByName('Aliquota_Nacional').AsFloat
        else
          Result := qAux.FieldByName('Aliquota_Importada').AsFloat;
      end;
    end;
  finally

  end;
end;

function Pega_Total_Produto(Pedido: Integer;
  var Conexao: TADOConnection): Double;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := Conexao;
      clear;
      add('select sum(IP.Qtde * IP.Valor_Original) as Total_Produto from Itens_Pedido IP');
      add('where IP.Codigo = :Codigo and IP.Cancelado = :N');
      Parameters.ParamByName('Codigo').Value := Pedido;
      Parameters.ParamByName('N').Value := 'N';
      open;
      Result := qAux.FieldByName('Total_Produto').AsFloat;
    end;
  finally

  end;
end;

procedure Pega_Atalho_Tabela(Atalho: Char);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(Nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select TP.Codigo from Tabela_Preco TP');
      add('where TP.Atalho = :Atalho');
      Parameters.ParamByName('Atalho').Value := Atalho;
      open;
      if (IsEmpty = false) then
      begin
        codigo_tabela_preco_ativo := qAux.FieldByName('Codigo').AsInteger;
        // Inicializa_Dados_Principais_Movimentacao(0, dm.qrychama_produto);
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

{ procedure Verifica_Pouco_Papel;
  var
  iACK, iST1, iST2, iST3: Integer;
  begin
  iACK := 0;
  iST1 := 0;
  iST2 := 0;
  iST3 := 0;
  iRetorno := Bematech_FI_RetornoImpressora(iACK, iST1, iST2);
  IF iST1 >= 64 Then
  begin
  inc(ipouco_papel);
  if (ipouco_papel = 30) then
  begin
  iST1 := iST1 - 64;
  Application.MessageBox('Pouco Papel.', 'Atenção', MB_OK + MB_ICONHAND);
  ipouco_papel := 0;
  end;
  end
  else
  ipouco_papel := 0;
  end; }

{ procedure Verifica_Fim_Papel;
  var
  iACK, iST1, iST2, iST3: Integer;
  begin
  iACK := 0;
  iST1 := 0;
  iST2 := 0;
  iST3 := 0;
  iRetorno := Bematech_FI_RetornoImpressora(iACK, iST1, iST2);
  IF iST1 >= 128 Then
  begin
  inc(ifim_papel);
  if (ifim_papel = 10) then
  begin
  Habilitado := false;
  iST1 := iST1 - 128;
  Application.MessageBox(
  'Fim do Papel. Por favor, coloque uma nova bobina para continuar.',
  'Fim do Papel', MB_OK + MB_ICONHAND);
  ifim_papel := 0;
  end
  else
  Habilitado := false;
  end
  else
  begin
  Habilitado := true;
  ifim_papel := 0;
  end;
  end; }

{ function Verifica_Fim_Papel_Sem_Mensagem: boolean;
  var
  iACK, iST1, iST2, iST3: Integer;
  begin
  iACK := 0;
  iST1 := 0;
  iST2 := 0;
  iST3 := 0;
  iRetorno := Bematech_FI_RetornoImpressora(iACK, iST1, iST2);
  IF iST1 >= 128 Then
  begin
  iST1 := iST1 - 128;
  Result := true;
  end
  else
  Result := false;
  end; }

{ procedure Verifica_Cupom_Aberto;
  var
  iACK, iST1, iST2, iST3: Integer;
  begin
  iACK := 0;
  iST1 := 0;
  iST2 := 0;
  iST3 := 0;
  iRetorno := Bematech_FI_FlagsFiscais(flagf);
  IF (flagf = 1) or (flagf = 33) or (flagf = 35) or (flagf = 37) Then
  begin
  // iST1 := iST1 - 2;
  Application.MessageBox(
  'Foi detectado que um cupom fiscal está em aberto. Será cancelado automaticamente o cupom.', 'Cupom Aberto', MB_OK + MB_ICONHAND);
  iRetorno := Bematech_FI_CancelaCupom;
  Analisa_iRetorno;
  AlteraGT;
  DeleteFile(Local_Arquivo(1));
  DeleteFile(Local_Arquivo(2));
  DeleteFile(Local_Arquivo(3));
  DeleteFile(Local_Arquivo(4));
  DeleteFile(Local_Arquivo(5));
  DeleteFile(Local_Arquivo(6));
  DeleteFile(Local_Arquivo(7));
  DeleteFile(Local_Arquivo(8));
  DeleteFile(Local_Arquivo(9));
  DeleteFile(Local_Arquivo(12));
  DeleteFile(Local_Arquivo(13));
  DeleteFile(Local_Arquivo(15));
  DeleteFile(Local_Arquivo(16));
  DeleteFile(Local_Arquivo(17));
  DeleteFile(Local_Arquivo(18));
  DeleteFile(Local_Arquivo(19));
  end;
  end; }

procedure Habilita_Ctrl_Alt_Del(YesNo: boolean);
const
  sRegPolices = 'Software\Microsoft\Windows\CurrentVersion\Policies';
begin
  with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      if OpenKey(sRegPolices + '\System\', true) then
      begin
        case YesNo of
          false:
            begin
              WriteInteger('DisableTaskMgr', 1);
            end;
          true:
            begin
              WriteInteger('DisableTaskMgr', 0);
            end;
        end;
      end;
      CloseKey;
    finally
      Free;
    end;
end;

procedure Habilita_Outras_Teclas(Form: TForm; YesNo: boolean);
begin
  case YesNo of
    false:
      begin
        RegisterHotkey(Form.Handle, 1, MOD_ALT, VK_ESCAPE);
        RegisterHotkey(Form.Handle, 2, MOD_ALT, VK_f4);
        RegisterHotkey(Form.Handle, 3, MOD_ALT, VK_TAB)
      end;

    true:
      begin
        UnRegisterHotkey(Form.Handle, 1);
        UnRegisterHotkey(Form.Handle, 2);
        UnRegisterHotkey(Form.Handle, 3);
      end;
  end;
end;

procedure Deleta_Arquivos_Temp;
begin
  DeleteFile(Local_Arquivo(1));
  DeleteFile(Local_Arquivo(2));
  DeleteFile(Local_Arquivo(3));
  DeleteFile(Local_Arquivo(4));
  DeleteFile(Local_Arquivo(5));
  DeleteFile(Local_Arquivo(6));
  DeleteFile(Local_Arquivo(7));
  DeleteFile(Local_Arquivo(8));
  DeleteFile(Local_Arquivo(9));
  DeleteFile(Local_Arquivo(10));
  DeleteFile(Local_Arquivo(11));
  DeleteFile(Local_Arquivo(12));
  DeleteFile(Local_Arquivo(13));
  DeleteFile(Local_Arquivo(15));
  DeleteFile(Local_Arquivo(16));
  DeleteFile(Local_Arquivo(17));
  DeleteFile(Local_Arquivo(18));
  DeleteFile(Local_Arquivo(19));
end;

{ procedure Verifica_Impressora_Ligada;
  begin
  iRetorno := Bematech_FI_VerificaImpressoraLigada;
  if (iRetorno <> 1) then
  begin
  inc(iimpressora_ligada);
  if (iimpressora_ligada = 10) then
  begin
  Habilitado := false;
  Mensagem_Erro_Entrada(
  'arquivo de configuração da impressora não foi encontrado OU a impressora está desligada OU desconectada.');
  iimpressora_ligada := 0;
  end
  else
  Habilitado := false;
  end
  else
  begin
  iimpressora_ligada := 0;
  Habilitado := true;
  end;
  end; }

procedure Bloqueia_Arquivos;
var
  Arquivo: TextFile;
  lcArq: String;
begin
  { if (FileExists(Local_Arquivo(14) + 'Config.txt')) then
    begin
    lcArq := Local_Arquivo(14) + 'Config.Txt';
    AssignFile(Arquivo, lcArq);
    Reset(Arquivo);
    end;

    if (FileExists(Local_Arquivo(14) + 'Software House.txt')) then
    begin
    lcArq := Local_Arquivo(14) + 'Software House.Txt';
    AssignFile(Arquivo, lcArq);
    Reset(Arquivo);
    end;

    if (FileExists(Local_Arquivo(14) + 'ArqMD5.txt')) then
    begin
    lcArq := Local_Arquivo(14) + 'ArqMD5.Txt';
    AssignFile(Arquivo, lcArq);
    Reset(Arquivo);
    end; }

end;

procedure Abre_Form_Modal(Form: TForm);
begin
  application.CreateForm(TForm, Form);
  Form.ShowModal;
  Form.Free;
end;

procedure Abre_Form(Frm: TFormClass);
var
  Form: TForm;
begin
  Form := Frm.Create(application.MainForm);
  Form.Show;
  Centraliza_Form(Form);
end;

{ function Verifica_Impressora_Ligada_Sem_Mensagem: boolean;
  begin
  iRetorno := Bematech_FI_VerificaImpressoraLigada;
  if (iRetorno <> 1) then
  Result := false
  else
  Result := true;
  end; }

function ZeroEsquerda(fTermo: String; fQuant: Integer): String;
var
  aux: String;
  i: Integer;
begin
  Result := '';
  aux := trim(fTermo);
  for i := 1 to fQuant - Length(aux) do
  begin
    Result := Result + '0';
  end;
  Result := Result + aux;
end;

function AlinhaTXT(pTexto: String; pAlinha, pTamanho: Integer): String;
var
  i, aux: Integer;
begin
  // pAlinha 0 = Esquerdo
  // 1 = Direito
  Result := pTexto;
  aux := pTamanho - Length(pTexto);
  for i := 1 to aux do
  begin
    if pAlinha = 0 then
      Result := ' ' + Result
    else if pAlinha = 1 then
      Result := Result + ' ';
  end;

end;

procedure Rede_Disponivel;
begin
  // Abre_Conexao(dm.ADOConnection1);
end;

function FiltraNumero(fAux: String): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(fAux) do
  begin
    if (copy(fAux, i, 1) = '1') or (copy(fAux, i, 1) = '2') or
      (copy(fAux, i, 1) = '3') or (copy(fAux, i, 1) = '4') or
      (copy(fAux, i, 1) = '5') or (copy(fAux, i, 1) = '6') or
      (copy(fAux, i, 1) = '7') or (copy(fAux, i, 1) = '8') or
      (copy(fAux, i, 1) = '9') or (copy(fAux, i, 1) = '0') then
    begin
      Result := Result + copy(fAux, i, 1);
    end;
  end;
end;

function Gera_N_NFe: integer;
var
  qAux, qAux2: TADOQuery;
  NFE: Integer;
begin
  try
    qAux := TADOQuery.create(nil);
    with qAux, sql do
    begin
      Close;
      Connection := dm.ADOConnection1;
      Clear;
      Add('select max(N_Nota_Fiscal) as N_Nota_Fiscal from Controla_N_NFe ');
      open;
    end;
    Result := qAux.FieldByName('N_Nota_Fiscal').AsInteger + 1;
  finally
    FreeAndNil(qAux);
  end;
end;

function Gera_N_NFCe: integer;
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.create(nil);
    with qAux, sql do
    begin
      Close;
      Connection := dm.ADOConnection1;
      Clear;
      Add('select max(N_NFCe) as N_NFCe from Controla_N_NFCe ');
      open;
    end;
    Result := qAux.FieldByName('N_NFCe').AsInteger + 1;
  finally
    FreeAndNil(qAux);
  end;
end;

function Grava_N_NFCe(N_NFCe: integer): integer;
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.create(nil);
    with qAux, sql do
    begin
      Close;
      Connection := dm.ADOConnection1;
      Clear;
      Add('Insert into Controla_N_NFCe (N_NFCe) values (:N_NFCe)');
      Parameters.ParamByName('N_NFCe').Value := N_NFCe;
      Result:= ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

function Grava_N_NFe(N_NFe: integer): integer;
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.create(nil);
    with qAux, sql do
    begin
      Close;
      Connection := dm.ADOConnection1;
      Clear;
      Add('Insert into Controla_N_NFe (N_Nota_Fiscal) values (:N_Nota_Fiscal)');
      Parameters.ParamByName('N_Nota_Fiscal').Value := N_NFe;
      Result:= ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Escreve_Alertas(Memo: TMemo; Alerta: AnsiString);
begin
  Memo.Lines.Add(Alerta);
end;

procedure Escreve_Alerta_Geral(Memo: TMemo);
begin
  Memo.Lines.Clear;
  Memo.Lines.Add('ALERTAS GERAIS');
  Memo.Lines.Add('');
end;

procedure Escreve_Alerta_Principal(Memo: TMemo);
begin
  Memo.Lines.Add('');
  Memo.Lines.Add('');
  Memo.Lines.Add('ALERTAS DE PRODUTOS');
  Memo.Lines.Add('');
end;

procedure GerarNFe(var TemAlertas: boolean; MemoAlertas: TMemo; DadosEmissaoNFe: TDadosEmissaoNFE; var ACBrNFe: TACBrNFe; var ACBrDanfeNFe: TACBrNFeDANFeRL; var ACBrDanfeNFCe: TACBrNFeDANFCeFortes);
var
  data_emissao, data_saida, valaux2, va: AnsiString;
  data_vencim: TDate;
  valaux, valor_un: double;
  i, item: Integer;
begin
  TLog.Info('--- MÉTODO GERAR NFE---');
  TemAlertas:= false;
  razao_social_emitente := razao_social;
  cnpj_emitente := CNPJ;
  endereco_emitente := endereco;
  numero_emitente := numero;
  complemento_emitente := complemento;
  setor_emitente := setor;
  codigo_municipio_emitente := cod_municipio;
  municipio_emitente := cidade;
  uf_emitente := uf;
  telefone_emitente := telefone;
  cep_emitente := cep;
  cnae_fiscal_emitente := cnae;
  ie_emitente := insc_estadual;
  im_emitente := insc_municipal;
  Escreve_Alerta_Geral(MemoAlertas);

  if (impressao_danfe = 'RETRATO') then
    ACBrDanfeNFe.TipoDANFE := tiRetrato
  else
    ACBrDanfeNFe.TipoDANFE := tiPaisagem;

  ACBrDanfeNFCe.TipoDANFE := tiNFCe;

  if (logomarca <> '') then
  begin
    ACBrDanfeNFe.Logo := logomarca;
    ACBrDanfeNFCe.Logo:= logomarca;
  end;

  // if (email <> '') then
  ACBrDanfeNFe.email := email;

  with ACBrNFe.NotasFiscais.Add.NFE do
  begin
    // Ide.cNF       := ; //Caso não seja preenchido será gerado um número aleatório pelo componente

    if (DadosEmissaoNFe.CFOP <> '') then
      Ide.natOp := DadosEmissaoNFe.CFOP
    else
    begin
      Escreve_Alertas(MemoAlertas, 'Informe o CFOP da Nota Fiscal' + #13);
      encontrou_alertas := true;
    end;

    case DadosEmissaoNFe.FormaPagamento of
      0:
        Ide.indPag := pcnConversao.ipVista;
      1:
        Ide.indPag := pcnConversao.ipPrazo;
      2:
        Ide.indPag := pcnConversao.ipOutras;
    end;

    if (DadosEmissaoNFe.Modelo <> '') then
      Ide.Modelo := StrToInt(DadosEmissaoNFe.Modelo)
    else
    begin
      Escreve_Alertas(MemoAlertas, 'Informe o Modelo da Nota Fiscal' + #13);
      encontrou_alertas := true;
    end;

    if (DadosEmissaoNFe.Modelo = '65') then
    begin
      Ide.tpImp     := tiNFCe;
      Ide.indFinal  := cfConsumidorFinal;
      Ide.indPres   := pcPresencial;
    end;

    if (DadosEmissaoNFe.Serie <> '') then
      Ide.serie := StrToInt(DadosEmissaoNFe.Serie)
    else
    begin
      Escreve_Alertas(MemoAlertas, 'Informe a Série da Nota Fiscal' + #13);
      encontrou_alertas := true;
    end;

    if (IntToStr(DadosEmissaoNFe.NNF) <> '') then
      Ide.nNF := DadosEmissaoNFe.NNF
    else
    begin
      Escreve_Alertas(MemoAlertas, 'Informe o Nº da Nota Fiscal' + #13);
      encontrou_alertas := true;
    end;

    if (DadosEmissaoNFe.DataSaida <> '  /  /    ') then
    begin
      if (DadosEmissaoNFe.HoraSaida <> '  :  ') then
        data_saida := DadosEmissaoNFe.DataSaida + ' ' +
          DadosEmissaoNFe.HoraSaida
      else
        data_saida := DadosEmissaoNFe.DataSaida +
          FormatDateTime('hh:mm', now);
      Ide.dSaiEnt := StrToDateTime(data_saida);
    end
    else
    begin
      Escreve_Alertas(MemoAlertas, 'Informe Data da Saída da Nota Fiscal' + #13);
      encontrou_alertas := true;
    end;

    if (StrToDateTime(data_saida) < StrToDateTime(DadosEmissaoNFe.DataEmissao)) then
    begin
      Escreve_Alertas(MemoAlertas, 'Data de saída menor que a data de emissão.' + #13);
      encontrou_alertas := true;
    end
    else
    begin
      Ide.dEmi := StrToDateTime(DadosEmissaoNFe.DataEmissao);
    end;

    if (DadosEmissaoNFe.TipoOperacao = 0) then
      Ide.tpNF := tnEntrada
    else
      Ide.tpNF := tnSaida;

    if (DadosEmissaoNFe.FormaEmissao = 'NORMAL') then
      Ide.tpEmis := teNormal
    else if (DadosEmissaoNFe.FormaEmissao = 'CONTINGÊNCIA') then
      Ide.tpEmis := teContingencia
    else if (DadosEmissaoNFe.FormaEmissao = 'SCAN') then
      Ide.tpEmis := teSCAN
    else if (DadosEmissaoNFe.FormaEmissao = 'DPEC') then
      Ide.tpEmis := teDPEC
    else if (DadosEmissaoNFe.FormaEmissao = 'FSDA') then
      Ide.tpEmis := teFSDA;

    if (ambiente = 'PRODUÇÃO') then
      Ide.TpAmb := taProducao
    else if (ambiente = 'HOMOLOGAÇÃO') then
      Ide.TpAmb := taHomologacao;

    Ide.verProc := VersaoExe; // Versão do seu sistema

    //Verifica_Nota_Ja_Emitida;

    // identificar se é consumidor final
    if (DadosEmissaoNFe.Modelo='65') then
    begin
      Ide.indFinal := cfConsumidorFinal;
      Ide.indPres := pcPresencial;
      TLog.Debug('Não Contribuinte');
    end
    else
    begin
      if (ie_destinatario <> '') and (Length(cnpj_destinatario) = 14) then
      begin
        Ide.indFinal := cfNao;
        Ide.indPres   := pcNao;
        TLog.Debug('Contribuinte');
      end
      else
      begin
        Ide.indFinal := cfConsumidorFinal;
        Ide.indPres := pcPresencial;
        TLog.Debug('Não Contribuinte');
      end;
    end;

    if (uf_emitente <> '') then
    begin
      Ide.cUF := UFtoCUF(uf_emitente);
      TLog.Debug('UF Emitente: ' + uf_emitente);
    end
    else
    begin
      Escreve_Alertas(MemoAlertas, 'Informe a UF do Emitente' + #13);
      encontrou_alertas := true;
    end;

    if (DadosEmissaoNFe.Modelo='65') then
    begin
      Ide.idDest := doInterna;
    end
    else
    begin
      if (uf_emitente = uf_destinatario) then
      begin
        Ide.idDest := doInterna;
        TLog.Debug('Operação Interna');
      end
      else
      begin
        Ide.idDest := doInterestadual;
        TLog.Debug('Operação Interestadual');
      end;
    end;

    if (codigo_municipio_emitente <> '') then
      Ide.cMunFG := StrToInt(codigo_municipio_emitente)
    else
    begin
      Escreve_Alertas(MemoAlertas, 'Informe o Código do Município do Emitente' + #13);
      encontrou_alertas := true;
    end;

    if (DadosEmissaoNFe.Finalidade = 'NORMAL') then
      Ide.finNFe := fnNormal
    else if (DadosEmissaoNFe.Finalidade = 'COMPLEMENTAR') then
      Ide.finNFe := fnComplementar
    else if (DadosEmissaoNFe.Finalidade = 'AJUSTE') then
      Ide.finNFe := fnAjuste
    else if (DadosEmissaoNFe.Finalidade = 'DEVOLUÇÃO') then
    begin
      Ide.finNFe := fnDevolucao;
      //adicionarReferenciaDevolucaoACBR(Ide.NFref);
    end;

    // Para NFe referenciada use os campos abaixo

    {if (MMOCOO.Text <> '') then
      begin
        with Ide.NFref.Add do
        begin
          RefECF.Modelo := ECFModRef2D; // |                      ////////////////conferir
          RefECF.nECF := nu_serie; // |- Cupom Fiscal
          RefECF.nCOO := MMOCOO.Text; // |
        end;
      end;}

    //EdtEmitente.Text := nome_fantasia;
    //EdtCodigo_Emitente.Text := IntToStr(codigo_empresa);

    if (cnpj_emitente <> '') then
    begin
      Emit.CNPJCPF := cnpj_emitente;
      TLog.Debug('CNPJ Emitente: ' + cnpj_emitente);
    end
    else
    begin
      Escreve_Alertas(MemoAlertas, 'Informe o CNPJ do Emitente' + #13);
      encontrou_alertas := true;
    end;

    if (ie_emitente <> '') then
    begin
      Emit.IE := ie_emitente;
      TLog.Debug('IE Emitente: ' + ie_emitente);
      TLog.Debug('IE Emitente: ' + insc_estadual);
    end
    else
    begin
      Escreve_Alertas(MemoAlertas, 'Informe a Insc. Estadual do Emitente' + #13);
      encontrou_alertas := true;
    end;

    if (razao_social_emitente <> '') then
      Emit.xNome := razao_social_emitente
    else
    begin
      Escreve_Alertas(MemoAlertas, 'Informe a Razão Social do Emitente' + #13);
      encontrou_alertas := true;
    end;

    if (nome_fantasia <> '') then
      Emit.xFant := nome_fantasia
    else
    begin
      Escreve_Alertas(MemoAlertas, 'Informe o Nome Fantasia do Emitente' + #13);
      encontrou_alertas := true;
    end;

    Emit.EnderEmit.fone := telefone_emitente;
    cep_emitente := StringReplace(cep_emitente, '-', '', [rfReplaceAll]);

    if (cep_emitente <> '') then
      Emit.EnderEmit.cep := StrToInt(cep_emitente)
    else
    begin
      Escreve_Alertas(MemoAlertas, 'Informe o CEP do Emitente' + #13);
      encontrou_alertas := true;
    end;

    if (endereco_emitente <> '') then
      Emit.EnderEmit.xLgr := endereco_emitente
    else
    begin
      Escreve_Alertas(MemoAlertas, 'Informe o Endereço do Emitente' + #13);
      encontrou_alertas := true;
    end;

    if (numero_emitente <> '') then
      Emit.EnderEmit.nro := numero_emitente
    else
    begin
      Escreve_Alertas(MemoAlertas, 'Informe o Nº do estabelecimento do Emitente' + #13);
      encontrou_alertas := true;
    end;

    Emit.EnderEmit.xCpl := complemento_emitente;

    if (setor_emitente <> '') then
      Emit.EnderEmit.xBairro := setor_emitente
    else
    begin
      Escreve_Alertas(MemoAlertas, 'Informe o Setor do Emitente' + #13);
      encontrou_alertas := true;
    end;

    if (codigo_municipio_emitente <> '') then
      Emit.EnderEmit.cMun := StrToInt(codigo_municipio_emitente)
    else
    begin
      Escreve_Alertas(MemoAlertas, 'Informe o Código do Município do Emitente' + #13);
      encontrou_alertas := true;
    end;

    if (municipio_emitente <> '') then
      Emit.EnderEmit.xMun := municipio_emitente
    else
    begin
      Escreve_Alertas(MemoAlertas, 'Informe a Cidade do Emitente' + #13);
      encontrou_alertas := true;
    end;

    if (uf_emitente <> '') then
      Emit.EnderEmit.uf := uf_emitente
    else
    begin
      Escreve_Alertas(MemoAlertas, 'Informe a UF do Emitente' + #13);
      encontrou_alertas := true;
    end;

    Emit.EnderEmit.cPais := 1058;
    Emit.EnderEmit.xPais := 'BRASIL';

    // Emit.IEST              := ie_emitente;
    Emit.IM := im_emitente; // Preencher no caso de existir serviços na nota
    Emit.cnae := cnae_fiscal_emitente;
    // Verifique na cidade do emissor da NFe se é permitido
    // a inclusão de serviços na NFe

    TLog.Debug('Variável regime_tributario_emitente: ' +
      regime_tributario_emitente);
    if regime_tributario_emitente = '0' then
    begin
      Emit.CRT := crtSimplesNacional;
      TLog.Debug('Regime Tributário: Simples Nacional');
    end
    else if regime_tributario_emitente = '1' then
    begin
      Emit.CRT := crtSimplesExcessoReceita;
      TLog.Debug('Regime Tributário: Simples Excesso Receita Bruta');
    end
    else if regime_tributario_emitente = '2' then
    begin
      Emit.CRT := crtRegimeNormal;
      TLog.Debug('Regime Tributário: Regime Normal');
    end;

    /// /////////////--------------------- Destinatario -----------------///////////////////
    TLog.Debug('CNPJ/CPF do destinatário: '+cnpj_destinatario);
    if (cnpj_destinatario <> '') then
      Dest.CNPJCPF := cnpj_destinatario
    else
    begin
      if (DadosEmissaoNFe.Modelo = '55') then
      begin
        Escreve_Alertas(MemoAlertas, 'Informe o CNPJ/CPF do Destinatário' + #13);
        encontrou_alertas := true;
      end;
    end;

    TLog.Debug('IE do destinatário: '+ie_destinatario);
    Dest.IE := ie_destinatario;
    // else
    // Mensagem_Erro('Insc. Estadual do destinatário');
    Dest.ISUF := '';
    TLog.Debug('Razão Social do destinatário: '+razao_social_destinatario);
    if (razao_social_destinatario <> '') then
      Dest.xNome := razao_social_destinatario
    else
    begin
      if (DadosEmissaoNFe.Modelo = '55') then
      begin
        Escreve_Alertas(MemoAlertas, 'Informe o Nome/Razão Social do Destinatário' + #13);
        encontrou_alertas := true;
      end;
    end;
    TLog.Debug('Telefone do destinatário: '+telefone_destinatario);
    // if (telefone_destinatario <> '') then
    Dest.EnderDest.fone := telefone_destinatario;
    // else
    // Mensagem_Erro('Telefone do destinatário');

    TLog.Debug('CEP do destinatário: '+cep_destinatario);
    if (cep_destinatario <> '') then
    begin
      cep_destinatario := StringReplace(cep_destinatario, '-', '',
        [rfReplaceAll]);
      Dest.EnderDest.cep := StrToInt(cep_destinatario);
    end
    else
    begin
      if (DadosEmissaoNFe.Modelo = '55') then
      begin
        Escreve_Alertas(MemoAlertas, 'Informe o CEP do Destinatário' + #13);
        encontrou_alertas := true;
      end;
    end;
    TLog.Debug('Endereço do destinatário: '+endereco_destinatario);
    if (endereco_destinatario <> '') then
      Dest.EnderDest.xLgr := endereco_destinatario
    else
    begin
      if (DadosEmissaoNFe.Modelo = '55') then
      begin
        Escreve_Alertas(MemoAlertas, 'Informe o Endereço do Destinatário' + #13);
        encontrou_alertas := true;
      end;
    end;

    if (Length(endereco_destinatario) = 1) and (DadosEmissaoNFe.Modelo = '55') then
    begin
      Escreve_Alertas
        (MemoAlertas, 'Informe o Endereço do Destinatário com no mínimo dois caracteres' +
        #13);
      encontrou_alertas := true;
    end
    else
    begin
      Dest.EnderDest.xLgr := endereco_destinatario
    end;

    if (numero_destinatario <> '') then
      Dest.EnderDest.nro := numero_destinatario
    else
    begin
      if (DadosEmissaoNFe.Modelo = '55') then
      begin
        Escreve_Alertas(MemoAlertas, 'Informe o Nº da Casa do Destinatário' + #13);
        encontrou_alertas := true;
      end;
    end;

    Dest.EnderDest.xCpl := complemento_destinatario;

    if (setor_destinatario <> '') then
      Dest.EnderDest.xBairro := setor_destinatario
    else
    begin
      if (DadosEmissaoNFe.Modelo = '55') then
      begin
        Escreve_Alertas(MemoAlertas, 'Informe o Setor do Destinatário' + #13);
        encontrou_alertas := true;
      end;
    end;

    if (codigo_municipio_destinatario <> '') then
      Dest.EnderDest.cMun := StrToInt(codigo_municipio_destinatario)
    else
    begin
      if (DadosEmissaoNFe.Modelo = '55') then
      begin
        Escreve_Alertas(MemoAlertas, 'Informe o Código do Município do Destinatário' + #13);
        encontrou_alertas := true;
      end;
    end;

    if (municipio_destinatario <> '') then
      Dest.EnderDest.xMun := municipio_destinatario
    else
    begin
      if (DadosEmissaoNFe.Modelo = '55') then
      begin
        Escreve_Alertas(MemoAlertas, 'Informe o Município do Destinatário' + #13);
        encontrou_alertas := true;
      end;
    end;

//    if (municipio_destinatario <> '') then
//    begin
//      Ide.NFref.Add.RefECF.nCOO := edtNcoo.Text;
//      Ide.NFref.Add.RefECF.nECF := nu_serie;
//    end;





    if (uf_destinatario <> '') then
      Dest.EnderDest.uf := uf_destinatario
    else
    begin
      if (DadosEmissaoNFe.Modelo = '55') then
      begin
        Escreve_Alertas(MemoAlertas, 'Informe a UF do Destinatário' + #13);
        encontrou_alertas := true;
      end;
    end;


    if Trim(ie_destinatario) <> '' then
      Dest.indIEDest := inContribuinte
    else
      Dest.indIEDest := inNaoContribuinte;

    Dest.EnderDest.cPais := 1058;
    Dest.EnderDest.xPais := 'BRASIL';

    // Use os campos abaixo para informar o endereço de retirada quando for diferente do Remetente/Destinatário

    { if (CBRetirada.Checked = false) then
      begin
      Retirada.CNPJCPF := cnpj_emitente;
      Retirada.xLgr := endereco_emitente;
      Retirada.nro := numero_emitente;
      Retirada.xCpl := complemento_emitente;
      Retirada.xBairro := setor_emitente;
      Retirada.cMun := StrToInt(codigo_municipio_emitente);
      Retirada.xMun := municipio_emitente;
      Retirada.uf := uf_emitente;
      end; }

    // Use os campos abaixo para informar o endereço de entrega quando for diferente do Remetente/Destinatário

    { if (CBEntrega.Checked = false) then
      begin
      Entrega.CNPJCPF := cnpj_destinatario;
      Entrega.xLgr := endereco_destinatario;
      Entrega.nro := numero_destinatario;
      Entrega.xCpl := complemento_destinatario;
      Entrega.xBairro := setor_destinatario;
      Entrega.cMun := StrToInt(codigo_municipio_destinatario);
      Entrega.xMun := municipio_destinatario;
      Entrega.uf := uf_destinatario;
      end; }

    // Adicionando Produtos
    item := 0;
    Escreve_Alerta_Principal(MemoAlertas);

    //qryitens_nf.First;
    //while not qryitens_nf.Eof do
    for i := 0 to DadosEmissaoNFe.Itens.Count-1 do
    begin

      if (DadosEmissaoNFe.Itens.Items[i].NCM = '') then
      begin
        Escreve_Alertas(MemoAlertas, 'O produto ' + DadosEmissaoNFe.Itens.Items[i].DescricaoProduto +
          ', não tem NCM.' + #13);
        encontrou_alertas := true;
      end;

      if (Length(DadosEmissaoNFe.Itens.Items[i].NCM) < 8) or
        (Length(DadosEmissaoNFe.Itens.Items[i].NCM) > 8) then
      begin
        Escreve_Alertas(MemoAlertas, 'O produto ' + DadosEmissaoNFe.Itens.Items[i].DescricaoProduto +
          ', tem NCM com quantidade de caracteres diferente de 8.' + #13);
        encontrou_alertas := true;
      end;

      if (DadosEmissaoNFe.Itens.Items[i].CodigoVenda = '') then
      // or (Length( qryitens_nfCodigo_Venda.AsString ) < 13) then
      begin
        Escreve_Alertas(MemoAlertas, 'O produto ' + DadosEmissaoNFe.Itens.Items[i].DescricaoProduto +
          ', está com o Código de Venda em branco ou formato inválido.' + #13);
        encontrou_alertas := true;
      end;

      if (DadosEmissaoNFe.Itens.Items[i].CSOSN = '') then
      begin
        Escreve_Alertas(MemoAlertas, 'O produto ' + DadosEmissaoNFe.Itens.Items[i].DescricaoProduto +
          ', está com o CSOSN em branco.' + #13);
        encontrou_alertas := true;
      end;

      if (DadosEmissaoNFe.Itens.Items[i].CST = '') then
      begin
        Escreve_Alertas(MemoAlertas, 'O produto ' + DadosEmissaoNFe.Itens.Items[i].DescricaoProduto +
          ', está com o CST em branco.' + #13);
        encontrou_alertas := true;
      end;
    end;

    if (encontrou_alertas = true) then
    begin
      //PageControl1.TabIndex := 5;                          ////consertar
      //PageControl2.TabIndex := 5;
      TemAlertas:= true;
      exit;
    end;

    //qryitens_nf.First;
    //while not qryitens_nf.Eof do
    for i := 0 to DadosEmissaoNFe.Itens.Count-1 do
    begin
      va := FormatFloat('#0.0,0', DadosEmissaoNFe.Itens.Items[i].ValorUnitario);
      va := StringReplace(va, ThousandSeparator, '', [rfReplaceAll]);
      valor_un := StrToFloat(va);

      Inc(item);
      with Det.Add do
      begin
        Prod.nItem := item;
        Prod.cProd := DadosEmissaoNFe.Itens.Items[i].CodigoVenda;
        Prod.cEAN := '';
        Prod.xProd := DadosEmissaoNFe.Itens.Items[i].DescricaoProduto;
        Prod.NCM := DadosEmissaoNFe.Itens.Items[i].NCM;
        Prod.EXTIPI := '';
        Prod.CFOP := StringReplace(DadosEmissaoNFe.Itens.Items[i].CFOP, '.', '',
          [rfReplaceAll]);
        Prod.uCom := DadosEmissaoNFe.Itens.Items[i].Unidade;
        Prod.qCom := DadosEmissaoNFe.Itens.Items[i].Quantidade;
        Prod.vUnCom := DadosEmissaoNFe.Itens.Items[i].ValorOriginal;
        Prod.vProd := Calcula_Valor
          (FloatToStr(DadosEmissaoNFe.Itens.Items[i].Quantidade *
          DadosEmissaoNFe.Itens.Items[i].ValorOriginal));
        // qryitens_nfSub_Total.AsFloat;//Calcula_Valor(FloatToStr(qryitens_nfQtde.AsFloat * qryitens_nfValor_Unitario.AsFloat));
        { TODO -oOwner -cGeneral : VERIFDICAR SE PRECISA ALTERAR AQUI }
        Prod.cEANTrib := '';
        Prod.uTrib := DadosEmissaoNFe.Itens.Items[i].Unidade;
        Prod.qTrib := DadosEmissaoNFe.Itens.Items[i].Quantidade;
        Prod.vUnTrib := DadosEmissaoNFe.Itens.Items[i].ValorOriginal;
        // Calcula_Valor(FloatToStr(qryitens_nfQtde.AsFloat * qryitens_nfValor_Unitario.AsFloat));   //voltei valor_unitario, mas para ficar "correto",
        // mostrando todos os descontos e todos os acrescimos,
        Prod.vFrete := DadosEmissaoNFe.Itens.Items[i].ValorFrete;
        // deve colocar Valor_Original
        Prod.vSeg := DadosEmissaoNFe.Itens.Items[i].ValorSeguro;

        if (DadosEmissaoNFe.Itens.Items[i].DouA = 'D') then
        begin
          Prod.vDesc := (DadosEmissaoNFe.Itens.Items[i].DescAcr * DadosEmissaoNFe.Itens.Items[i].Quantidade) -
            DadosEmissaoNFe.Itens.Items[i].OutrasDespesas;
        end
        else if (DadosEmissaoNFe.Itens.Items[i].DouA = 'A') then          //comentei aqui para não precisar computar desconto,
          Prod.vOutro     := DadosEmissaoNFe.Itens.Items[i].DescAcr       //pois o mesmo já está no valor unitário.
        else
          Prod.vDesc     := 0;

        // infAdProd      := '';//ADOQuery3Descricao_2.AsString;         /////informações adicionais produto

        with Imposto do
        begin
          with ICMS do
          begin

            if (regime_tributario_emitente = '0') or (mostra_imposto = 1) then
            begin

              if (DadosEmissaoNFe.Itens.Items[i].CSOSN = '101') then
              begin
                csosn := csosn101;
                pCredSN := DadosEmissaoNFe.Itens.Items[i].AliquotaCalculoCredito;
                vCredICMSSN := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].CreditoICMS);
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CSOSN = '102') then
              begin
                csosn := csosn102;
                pCredSN := 0;
                vCredICMSSN := 0;
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CSOSN = '103') then
              begin
                csosn := csosn103;
                pCredSN := 0;
                vCredICMSSN := 0;
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CSOSN = '201') then
              begin
                csosn := csosn201;
                if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Preço Tabelado ou Máximo Sugerido') then
                  modBCST := dbisPrecoTabelado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Lista Negativa') then
                  modBCST := dbisListaNegativa
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Lista Positiva') then
                  modBCST := dbisListaPositiva
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Lista Neutra') then
                  modBCST := dbisListaNeutra
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Margem Valor Agregado (%)') then
                  modBCST := dbisMargemValorAgregado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Pauta(valor)') then
                  modBCST := dbisPauta;

                if (DadosEmissaoNFe.Itens.Items[i].MVAST <> '') then
                  pMVAST := StrToFloat(DadosEmissaoNFe.Itens.Items[i].MVAST);

                vBCST := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].BCST);
                // pICMSST:= qryitens_nfICMS_ST.AsFloat;
                vICMSST := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].ValorICMSST);

                pCredSN := DadosEmissaoNFe.Itens.Items[i].AliquotaCalculoCredito;
                vCredICMSSN := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].CreditoICMS);
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CSOSN = '202') then
              begin
                csosn := csosn202;
                if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Preço Tabelado ou Máximo Sugerido') then
                  modBCST := dbisPrecoTabelado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Lista Negativa') then
                  modBCST := dbisListaNegativa
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Lista Positiva') then
                  modBCST := dbisListaPositiva
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Lista Neutra') then
                  modBCST := dbisListaNeutra
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Margem Valor Agregado (%)') then
                  modBCST := dbisMargemValorAgregado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Pauta(valor)') then
                  modBCST := dbisPauta;

                if (DadosEmissaoNFe.Itens.Items[i].MVAST <> '') then
                  pMVAST := StrToFloat(DadosEmissaoNFe.Itens.Items[i].MVAST);

                vBCST := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].BCST);
                pICMSST := StrToFloat(DadosEmissaoNFe.Itens.Items[i].ICMSST);
                vICMSST := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].ValorICMSST);

                pCredSN := 0;
                vCredICMSSN := 0;
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CSOSN = '203') then
              begin
                csosn := csosn203;

                if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Preço Tabelado ou Máximo Sugerido') then
                  modBCST := dbisPrecoTabelado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Lista Negativa') then
                  modBCST := dbisListaNegativa
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Lista Positiva') then
                  modBCST := dbisListaPositiva
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Lista Neutra') then
                  modBCST := dbisListaNeutra
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Margem Valor Agregado (%)') then
                  modBCST := dbisMargemValorAgregado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Pauta(valor)') then
                  modBCST := dbisPauta;

                if (DadosEmissaoNFe.Itens.Items[i].MVAST <> '') then
                  pMVAST := StrToFloat(DadosEmissaoNFe.Itens.Items[i].MVAST);

                vBCST := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].BCST);
                pICMSST := StrToFloat(DadosEmissaoNFe.Itens.Items[i].ICMSST);
                vICMSST := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].ValorICMSST);

                pCredSN := 0;
                vCredICMSSN := 0;
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CSOSN = '300') then
              begin
                csosn := csosn300;
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CSOSN = '400') then
              begin
                csosn := csosn400;
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CSOSN = '500') then
              begin
                csosn := csosn500;

                vBCST := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].BCST);
                // pMVAST:= qryitens_nfMVAST.AsFloat;
                // pICMSST:= StrToFloat(DadosEmissaoNFe.Itens.Items[i].ICMSST);
                vICMSST := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].ValorICMSST);

                // if (DadosEmissaoNFe.Itens.Items[i].BCST <> '') then
                // vBCSTRet:= Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].BCST);

                // if (DadosEmissaoNFe.Itens.Items[i].ValorICMSST <> '') then
                // vICMSSTRet:= Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].ValorICMSST);

              end
              else if (DadosEmissaoNFe.Itens.Items[i].CSOSN = '900') then
              begin
                csosn := csosn900;

                if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Preço Tabelado ou Máximo Sugerido') then
                  modBCST := dbisPrecoTabelado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Lista Negativa') then
                  modBCST := dbisListaNegativa
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Lista Positiva') then
                  modBCST := dbisListaPositiva
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Lista Neutra') then
                  modBCST := dbisListaNeutra
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Margem Valor Agregado (%)') then
                  modBCST := dbisMargemValorAgregado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Pauta(valor)') then
                  modBCST := dbisPauta;

                if (DadosEmissaoNFe.Itens.Items[i].MVAST <> '') then
                  pMVAST := StrToFloat(DadosEmissaoNFe.Itens.Items[i].MVAST);

                if (DadosEmissaoNFe.Itens.Items[i].BCST <> '') then
                  vBCST := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].BCST);

                if (DadosEmissaoNFe.Itens.Items[i].ICMSST <> '') then
                  pICMSST := StrToFloat(DadosEmissaoNFe.Itens.Items[i].ICMSST);

                if (DadosEmissaoNFe.Itens.Items[i].ValorICMSST <> '') then
                  vICMSST := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].ValorICMSST);

                if (FloatToStr(DadosEmissaoNFe.Itens.Items[i].AliquotaCalculoCredito) <> '') then
                  pCredSN := DadosEmissaoNFe.Itens.Items[i].AliquotaCalculoCredito;

                if (DadosEmissaoNFe.Itens.Items[i].CreditoICMS <> '') then
                  vCredICMSSN :=
                    Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].CreditoICMS);

                if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Margem Valor Agregado') then
                  ICMS.modBC := dbiMargemValorAgregado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Paula (valor)') then
                  ICMS.modBC := dbiPauta
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Preço Tabelado Máx. (valor)') then
                  ICMS.modBC := dbiPrecoTabelado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Valor da Operação') then
                  ICMS.modBC := dbiValorOperacao;

                if (DadosEmissaoNFe.Itens.Items[i].BCReduzida <> '') then
                  ICMS.pRedBC := StrToFloat(DadosEmissaoNFe.Itens.Items[i].BCReduzida);

                if (DadosEmissaoNFe.Itens.Items[i].BC <> '') then
                  ICMS.vBC := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].BC);

                if (DadosEmissaoNFe.Itens.Items[i].ICMS <> '') then
                  ICMS.pICMS := StrToFloat(DadosEmissaoNFe.Itens.Items[i].ICMS);

                if (DadosEmissaoNFe.Itens.Items[i].ValorICMS <> '') then
                  ICMS.vICMS := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].ValorICMS);

                if (DadosEmissaoNFe.Itens.Items[i].IPI <> '') then
                  IPI.pIPI := StrToFloat(DadosEmissaoNFe.Itens.Items[i].IPI);

                if (DadosEmissaoNFe.Itens.Items[i].ValorIPI <> '') then
                  IPI.vIPI := StrToFloat(DadosEmissaoNFe.Itens.Items[i].ValorIPI);

              end;

              case DadosEmissaoNFe.Itens.Items[i].Origem of
                0:
                  ICMS.orig := oeNacional;
                1:
                  ICMS.orig := oeEstrangeiraImportacaoDireta;
                2:
                  ICMS.orig := oeEstrangeiraAdquiridaBrasil;
              end;
            end
            else if ((regime_tributario_emitente = '1') or
              (regime_tributario_emitente = '2')) or (mostra_imposto = 0) then
            begin
              if (DadosEmissaoNFe.Itens.Items[i].CSOSN = '101') then
              begin
                csosn := csosn101;
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CSOSN = '102') then
              begin
                csosn := csosn102;
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CSOSN = '103') then
              begin
                csosn := csosn103;
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CSOSN = '201') then
              begin
                csosn := csosn201;
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CSOSN = '202') then
              begin
                csosn := csosn202;
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CSOSN = '203') then
              begin
                csosn := csosn203;
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CSOSN = '300') then
              begin
                csosn := csosn300;
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CSOSN = '400') then
              begin
                csosn := csosn400;
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CSOSN = '500') then
              begin
                csosn := csosn500;
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CSOSN = '900') then
              begin
                csosn := csosn900;

                if (FloatToStr(DadosEmissaoNFe.Itens.Items[i].AliquotaCalculoCredito) <> '') then
                  pCredSN := 0;

                if (DadosEmissaoNFe.Itens.Items[i].CreditoICMS <> '') then
                  vCredICMSSN := 0;
              end;
              // se for tributação normal

              // case AnsiIndexStr(AnsiUpperCase(qryitens_nfCST.AsString) ,[qryitens_nfCST.AsString]) of case com string
              if (DadosEmissaoNFe.Itens.Items[i].CST = '00') then
              begin
                CST := cst00;
                if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Margem Valor Agregado') then
                  ICMS.modBC := dbiMargemValorAgregado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Paula (valor)') then
                  ICMS.modBC := dbiPauta
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Preço Tabelado Máx. (valor)') then
                  ICMS.modBC := dbiPrecoTabelado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Valor da Operação') then
                  ICMS.modBC := dbiValorOperacao;

                // ICMS.pRedBC  := qryitens_nfBase_Reduzida.AsFloat;
                ICMS.vBC := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].BC);
                ICMS.pICMS := StrToFloat(DadosEmissaoNFe.Itens.Items[i].ICMS) / 100;
                ICMS.vICMS := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].ValorICMS);
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CST = '10') then
              begin
                CST := cst10;

                // icms normal
                if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Margem Valor Agregado') then
                  ICMS.modBC := dbiMargemValorAgregado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Paula (valor)') then
                  ICMS.modBC := dbiPauta
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Preço Tabelado Máx. (valor)') then
                  ICMS.modBC := dbiPrecoTabelado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Valor da Operação') then
                  ICMS.modBC := dbiValorOperacao;

                ICMS.vBC := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].BC);
                ICMS.pICMS := StrToFloat(DadosEmissaoNFe.Itens.Items[i].ICMS) / 100;
                ICMS.vICMS := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].ValorICMS);

                // icms ST
                if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Preço Tabelado ou Máximo Sugerido') then
                  ICMS.modBCST := dbisPrecoTabelado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Lista Negativa') then
                  ICMS.modBCST := dbisListaNegativa
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Lista Positiva') then
                  ICMS.modBCST := dbisListaPositiva
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Lista Neutra') then
                  ICMS.modBCST := dbisListaNeutra
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Margem Valor Agregado (%)') then
                  ICMS.modBCST := dbisMargemValorAgregado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Pauta(valor)') then
                  ICMS.modBCST := dbisPauta;

                ICMS.vBCST := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].BCST);
                // ICMS.pICMSST   := StrToFloat(DadosEmissaoNFe.Itens.Items[i].ICMSST);
                ICMS.vICMSST :=
                  Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].ValorICMSST);
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CST = '20') then
              begin
                CST := cst20;

                if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Margem Valor Agregado') then
                  ICMS.modBC := dbiMargemValorAgregado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Paula (valor)') then
                  ICMS.modBC := dbiPauta
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Preço Tabelado Máx. (valor)') then
                  ICMS.modBC := dbiPrecoTabelado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Valor da Operação') then
                  ICMS.modBC := dbiValorOperacao;

                ICMS.vBC := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].BC);
                ICMS.pRedBC := StrToFloat(DadosEmissaoNFe.Itens.Items[i].BCReduzida);
                ICMS.pICMS := StrToFloat(DadosEmissaoNFe.Itens.Items[i].ICMS);
                ICMS.vICMS := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].ValorICMS);
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CST = '30') then
              begin
                CST := cst30;

                if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Preço Tabelado ou Máximo Sugerido') then
                  ICMS.modBCST := dbisPrecoTabelado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Lista Negativa') then
                  ICMS.modBCST := dbisListaNegativa
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Lista Positiva') then
                  ICMS.modBCST := dbisListaPositiva
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Lista Neutra') then
                  ICMS.modBCST := dbisListaNeutra
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Margem Valor Agregado (%)') then
                  ICMS.modBCST := dbisMargemValorAgregado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Pauta(valor)') then
                  ICMS.modBCST := dbisPauta;

                ICMS.vBCST := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].BCST);
                // ICMS.pICMSST   := StrToFloat(DadosEmissaoNFe.Itens.Items[i].ICMSST);
                ICMS.vICMSST :=
                  Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].ValorICMSST);
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CST = '40') or
                (DadosEmissaoNFe.Itens.Items[i].CST = '41') or
                (DadosEmissaoNFe.Itens.Items[i].CST = '50') then
              begin
                if (DadosEmissaoNFe.Itens.Items[i].CST = '40') then
                  CST := cst40
                else if (DadosEmissaoNFe.Itens.Items[i].CST = '41') then
                  CST := cst41
                else if (DadosEmissaoNFe.Itens.Items[i].CST = '50') then
                  CST := cst50;

                ICMS.vBC := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].BC);
                ICMS.pICMS := StrToFloat(DadosEmissaoNFe.Itens.Items[i].ICMS) / 100;
                ICMS.vICMS := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].ValorICMS);
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CST = '51') then
              begin
                CST := cst51;
                if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Margem Valor Agregado') then
                  ICMS.modBC := dbiMargemValorAgregado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Paula (valor)') then
                  ICMS.modBC := dbiPauta
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Preço Tabelado Máx. (valor)') then
                  ICMS.modBC := dbiPrecoTabelado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Valor da Operação') then
                  ICMS.modBC := dbiValorOperacao;

                ICMS.pRedBC := StrToFloat(DadosEmissaoNFe.Itens.Items[i].BCReduzida);
                ICMS.vBC := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].BC);
                ICMS.pICMS := StrToFloat(DadosEmissaoNFe.Itens.Items[i].ICMS) / 100;
                ICMS.vICMS := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].ValorICMS);
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CST = '60') then
              begin
                CST := cst60;

                if (DadosEmissaoNFe.Itens.Items[i].BCST <> '') then
                  vBCSTRet := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].BCST);

                if (DadosEmissaoNFe.Itens.Items[i].ValorICMSST <> '') then
                  vICMSSTRet :=
                    Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].ValorICMSST);
              end
              else if (DadosEmissaoNFe.Itens.Items[i].CST = '70') then
              begin
                CST := cst70;

                // icms normal
                if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Margem Valor Agregado') then
                  ICMS.modBC := dbiMargemValorAgregado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Paula (valor)') then
                  ICMS.modBC := dbiPauta
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Preço Tabelado Máx. (valor)') then
                  ICMS.modBC := dbiPrecoTabelado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMS =
                  'Valor da Operação') then
                  ICMS.modBC := dbiValorOperacao;

                ICMS.vBC := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].BC);
                ICMS.pRedBC := StrToFloat(DadosEmissaoNFe.Itens.Items[i].BCReduzida);
                ICMS.pICMS := StrToFloat(DadosEmissaoNFe.Itens.Items[i].ICMS) / 100;
                ICMS.vICMS := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].ValorICMS);

                // icms ST
                if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Preço Tabelado ou Máximo Sugerido') then
                  ICMS.modBCST := dbisPrecoTabelado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Lista Negativa') then
                  ICMS.modBCST := dbisListaNegativa
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Lista Positiva') then
                  ICMS.modBCST := dbisListaPositiva
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Lista Neutra') then
                  ICMS.modBCST := dbisListaNeutra
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Margem Valor Agregado (%)') then
                  ICMS.modBCST := dbisMargemValorAgregado
                else if (DadosEmissaoNFe.Itens.Items[i].TipoCalculoBCICMSST =
                  'Pauta(valor)') then
                  ICMS.modBCST := dbisPauta;

                ICMS.vBCST := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].BCST);
                // ICMS.pICMSST   := StrToFloat(DadosEmissaoNFe.Itens.Items[i].ICMSST);
                ICMS.vICMSST :=
                  Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].ValorICMSST);
              end;
              case DadosEmissaoNFe.Itens.Items[i].Origem of
                0:
                  ICMS.orig := oeNacional;
                1:
                  ICMS.orig := oeEstrangeiraImportacaoDireta;
                2:
                  ICMS.orig := oeEstrangeiraAdquiridaBrasil;
              end;
            end;
          end;

         with ICMSUFDest do
          begin
            vBCUFDest      := 0.00;
            pFCPUFDest     := 0.00;
            pICMSUFDest    := 0.00;
            pICMSInter     := 0.00;
            pICMSInterPart := 0.00;
            vFCPUFDest     := 0.00;
            vICMSUFDest    := 0.00;
            vICMSUFRemet   := 0.00;
          end;


          with IPI do
          begin
            case AnsiIndexStr(AnsiUpperCase(DadosEmissaoNFe.Itens.Items[i].CSTIPI),
              [DadosEmissaoNFe.Itens.Items[i].CSTIPI]) of
              00:
                CST := ipi00;
              01:
                CST := ipi01;
              02:
                CST := ipi02;
              03:
                CST := ipi03;
              04:
                CST := ipi04;
              05:
                CST := ipi05;
              49:
                CST := ipi49;
              50:
                CST := ipi50;
              51:
                CST := ipi51;
              52:
                CST := ipi52;
              53:
                CST := ipi53;
              54:
                CST := ipi54;
              55:
                CST := ipi55;
              99:
                CST := ipi99;
            end;

            clEnq := '';
            CNPJProd := '';
            cSelo := '';
            qSelo := 0;
            cEnq := '';

            if (DadosEmissaoNFe.Itens.Items[i].BCIPI <> '') then
              vBC := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].BCIPI);

            qUnid := 0;
            vUnid := 0;

            if (DadosEmissaoNFe.Itens.Items[i].IPI <> '') and
              (DadosEmissaoNFe.Itens.Items[i].IPI <> 'I') then
              pIPI := StrToFloat(DadosEmissaoNFe.Itens.Items[i].IPI);

            if (DadosEmissaoNFe.Itens.Items[i].ValorIPI <> '') and
              (DadosEmissaoNFe.Itens.Items[i].ValorIPI <> '0') then
              vIPI := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].ValorIPI);
          end;

          with II do
          begin
            vBC := 0;
            vDespAdu := 0;
            vII := 0;
            vIOF := 0;
          end;

          with pis do
          begin
            case AnsiIndexStr(AnsiUpperCase(DadosEmissaoNFe.Itens.Items[i].CSTPIS),
              [DadosEmissaoNFe.Itens.Items[i].CSTPIS]) of
              01:
                CST := pis01;
              02:
                CST := pis02;
              03:
                CST := pis03;
              04:
                CST := pis04;
              05:
                CST := pis05;
              06:
                CST := pis06;
              07:
                CST := pis07;
              08:
                CST := pis08;
              09:
                CST := pis09;
              49:
                CST := pis49;
              50:
                CST := pis50;
              51:
                CST := pis51;
              52:
                CST := pis52;
              53:
                CST := pis53;
              54:
                CST := pis54;
              55:
                CST := pis55;
              56:
                CST := pis56;
              60:
                CST := pis60;
              61:
                CST := pis61;
              62:
                CST := pis62;
              63:
                CST := pis63;
              64:
                CST := pis64;
              65:
                CST := pis65;
              66:
                CST := pis66;
              67:
                CST := pis67;
              70:
                CST := pis70;
              71:
                CST := pis71;
              72:
                CST := pis72;
              73:
                CST := pis73;
              74:
                CST := pis74;
              75:
                CST := pis75;
              98:
                CST := pis98;
              99:
                CST := pis99;
            end;

            if (regime_tributario_emitente <> '0') then
            begin
              if (DadosEmissaoNFe.Itens.Items[i].BCPIS <> '') then
                pis.vBC := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].BCPIS);

              if (DadosEmissaoNFe.Itens.Items[i].PIS <> '') and
                (DadosEmissaoNFe.Itens.Items[i].PIS <> 'I') then
                pis.pPIS := StrToFloat(DadosEmissaoNFe.Itens.Items[i].PIS);

              if (DadosEmissaoNFe.Itens.Items[i].ValorPIS <> '') and
                (DadosEmissaoNFe.Itens.Items[i].ValorPIS <> '0') then
                pis.vPIS := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].ValorPIS);
            end
            else
            begin
              pis.vBC := 0;

              pis.pPIS := 0;

              pis.vPIS := 0;
            end;

            { PIS.qBCProd   := 0;
              PIS.vAliqProd := 0;
              PIS.vPIS      := 0; }
          end;

          with PISST do
          begin
            vBC := 0;
            pPIS := 0;
            qBCProd := 0;
            vAliqProd := 0;
            vPIS := 0;
          end;

          with cofins do
          begin
            case AnsiIndexStr(AnsiUpperCase(DadosEmissaoNFe.Itens.Items[i].CSTCOFINS),
              [DadosEmissaoNFe.Itens.Items[i].CSTCOFINS]) of
              01:
                CST := cof01;
              02:
                CST := cof02;
              03:
                CST := cof03;
              04:
                CST := cof04;
              05:
                CST := cof05;
              06:
                CST := cof06;
              07:
                CST := cof07;
              08:
                CST := cof08;
              09:
                CST := cof09;
              49:
                CST := cof49;
              50:
                CST := cof50;
              51:
                CST := cof51;
              52:
                CST := cof52;
              53:
                CST := cof53;
              54:
                CST := cof54;
              55:
                CST := cof55;
              56:
                CST := cof56;
              60:
                CST := cof60;
              61:
                CST := cof61;
              62:
                CST := cof62;
              63:
                CST := cof63;
              64:
                CST := cof64;
              65:
                CST := cof65;
              66:
                CST := cof66;
              67:
                CST := cof67;
              70:
                CST := cof70;
              71:
                CST := cof71;
              72:
                CST := cof72;
              73:
                CST := cof73;
              74:
                CST := cof74;
              75:
                CST := cof75;
              98:
                CST := cof98;
              99:
                CST := cof99;
            end;

            if (regime_tributario_emitente <> '0') then
            begin
              if (DadosEmissaoNFe.Itens.Items[i].BCCOFINS <> '') then
                cofins.vBC := Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].BCCOFINS);

              if (DadosEmissaoNFe.Itens.Items[i].COFINS <> '') and
                (DadosEmissaoNFe.Itens.Items[i].COFINS <> 'I') then
                cofins.pCOFINS := StrToFloat(DadosEmissaoNFe.Itens.Items[i].COFINS);

              if (DadosEmissaoNFe.Itens.Items[i].ValorCOFINS <> '') and
                (DadosEmissaoNFe.Itens.Items[i].ValorCOFINS <> '0') then
                cofins.vCOFINS :=
                  Calcula_Valor(DadosEmissaoNFe.Itens.Items[i].ValorCOFINS);
            end
            else
            begin
              cofins.vBC := 0;

              cofins.pCOFINS := 0;

              cofins.vCOFINS := 0;
            end;

            { COFINS.qBCProd   := 0;
              COFINS.vAliqProd := 0; }
          end;

          with COFINSST do
          begin
            vBC := 0;
            pCOFINS := 0;
            qBCProd := 0;
            vAliqProd := 0;
            vCOFINS := 0;
          end;
          // Grupo para serviços
          { with ISSQN do
            begin
            vBC       := 0;
            vAliq     := 0;
            vISSQN    := 0;
            cMunFG    := 0;
            cListServ := 0; // Preencha este campo usando a tabela disponível
            // em http://www.planalto.gov.br/Ccivil_03/LEIS/LCP/Lcp116.htm
            end; }
        end;
      end;
      //qryitens_nf.next;
    end;

    total.ICMSTot.vBC := (DadosEmissaoNFe.ImpostoTotalBC);
    total.ICMSTot.vICMS := (DadosEmissaoNFe.ImpostoTotalICMS);
    total.ICMSTot.vBCST := (DadosEmissaoNFe.ImpostoTotalBCST);
    total.ICMSTot.vST := (DadosEmissaoNFe.ImpostoTotalST);
    total.ICMSTot.vProd := (DadosEmissaoNFe.ImpostoTotalVProduto);
    total.ICMSTot.vFrete := (DadosEmissaoNFe.ImpostoTotalVFrete);
    total.ICMSTot.vSeg := (DadosEmissaoNFe.ImpostoTotalVSeguro);
    total.ICMSTot.vDesc := (DadosEmissaoNFe.ImpostoTotalVDesc);
    // Total.ICMSTot.vII     := 0;
    total.ICMSTot.vIPI := (DadosEmissaoNFe.ImpostoTotalVIPI);
    total.ICMSTot.vPIS := (DadosEmissaoNFe.ImpostoTotalVPIS);
    total.ICMSTot.vCOFINS := (DadosEmissaoNFe.ImpostoTotalVCOFINS);
    total.ICMSTot.vOutro := (DadosEmissaoNFe.ImpostoTotalVOutros);
    total.ICMSTot.vNF := (DadosEmissaoNFe.ImpostoTotalVNF);

    total.ISSQNtot.vServ := (DadosEmissaoNFe.ImpostoTotalVServico);
    total.ISSQNtot.vBC := (DadosEmissaoNFe.ImpostoTotalBCServico);
    total.ISSQNtot.vISS := (DadosEmissaoNFe.ImpostoTotalVISS);
    total.ISSQNtot.vPIS := 0;
    total.ISSQNtot.vCOFINS := 0;

    total.retTrib.vRetPIS := 0;
    total.retTrib.vRetCOFINS := 0;
    total.retTrib.vRetCSLL := 0;
    total.retTrib.vBCIRRF := 0;
    total.retTrib.vIRRF := 0;
    total.retTrib.vBCRetPrev := 0;
    total.retTrib.vRetPrev := 0;

    case DadosEmissaoNFe.TipoFrete of
      0:
        Transp.modFrete := mfContaEmitente;
      1:
        Transp.modFrete := mfContaDestinatario;
      2:
        Transp.modFrete := mfContaTerceiros;
      3:
        Transp.modFrete := mfSemFrete;
    end;

    if (DadosEmissaoNFe.Modelo = '55') then
    begin
      if (DadosEmissaoNFe.TransportadoraCNPJ <> '') then
      begin
        if (cnpj_trans <> '') then
          Transp.Transporta.CNPJCPF := cnpj_trans
        else if (cpf_trans <> '') then
          Transp.Transporta.CNPJCPF := cpf_trans;

        Transp.Transporta.xNome := DadosEmissaoNFe.TransportadoraNome;
        Transp.Transporta.IE := DadosEmissaoNFe.TransportadoraIE;
        Transp.Transporta.xEnder := DadosEmissaoNFe.TransportadoraEndereco;
        Transp.Transporta.xMun := DadosEmissaoNFe.TransportadoraMunicipio;
        Transp.Transporta.uf := DadosEmissaoNFe.TransportadoraUF;

        Transp.retTransp.vServ := 0;
        Transp.retTransp.vBCRet := 0;
        Transp.retTransp.pICMSRet := 0;
        Transp.retTransp.vICMSRet := 0;
        Transp.retTransp.CFOP := '';
        Transp.retTransp.cMunFG := 0;
      end;
    end;

    if (DadosEmissaoNFe.Modelo = '55') then
    begin
      if (DadosEmissaoNFe.VeiculoPlaca <> '') then
      begin
        Transp.veicTransp.placa := DadosEmissaoNFe.VeiculoPlaca;
        Transp.veicTransp.uf := DadosEmissaoNFe.VeiculoUF;
        Transp.veicTransp.RNTC := DadosEmissaoNFe.VeiculoRNTC;
      end;
    end;

    // Dados do Reboque
    if (DadosEmissaoNFe.Modelo = '55') then
    begin
      if (DadosEmissaoNFe.ReboquePlaca <> '') then
      begin
        with Transp.Reboque.Add do
        begin
          placa := DadosEmissaoNFe.ReboquePlaca;
          uf := DadosEmissaoNFe.ReboqueUF;
          RNTC := DadosEmissaoNFe.ReboqueRNTC;
        end;
      end;
    end;

    if (DadosEmissaoNFe.Modelo = '55') then
    begin
      with Transp.Vol.Add do
      begin
        qVol := StrToInt(DadosEmissaoNFe.VolumeQtTransportada);
        esp := DadosEmissaoNFe.VolumeEspecie;
        marca := DadosEmissaoNFe.VolumeMarca;
        nVol := DadosEmissaoNFe.VolumeNVolume;
        pesoL := StrToFloat(DadosEmissaoNFe.VolumePesoL);
        pesoB := StrToFloat(DadosEmissaoNFe.VolumePesoB);

        // Lacres do volume. Pode ser adicionado vários
        // Lacres.Add.nLacre := '';
      end;
    end;

    { if (MEdtData_Primeiro_Vencimento.Text <> '  /  /    ') then
      begin
      data_vencim := StrToDateTime(MEdtData_Primeiro_Vencimento.Text);
      for I := 1 to qryitens_nfQtde_Parcela.AsInteger do
      begin
      with Cobr.Dup.Add do
      begin
      nDup := EdtN_Nota_Fiscal.Text + ' - ' + IntToStr(I);
      dVenc := data_vencim;
      valaux := (StrToFloat(EdtValor_Total_Nota.Text) /
      qryitens_nfQtde_Parcela.AsInteger);
      valaux := valaux + (valaux * (qryitens_nfTaxa.AsFloat / 100));
      valaux2 := FormatFloat('#0.0,0', valaux);
      valaux2 := StringReplace(valaux2, ThousandSeparator, '',
      [rfReplaceAll]);
      vDup := StrToFloat(valaux2);
      data_vencim := IncDay(data_vencim, qryitens_nfPrazo.AsInteger);
      end;
      end;
      end; }

    //if (ClientDataSet1.Active) then
    //begin
      //ClientDataSet1.First;
    if (DadosEmissaoNFe.Modelo = '55') then
    begin
      for i := 0 to DadosEmissaoNFe.Pagamentos.Count-1 do
      begin
        with Cobr.Dup.Add do
        begin
          nDup := DadosEmissaoNFe.Pagamentos.Items[i].NDocumento;
          dVenc := DadosEmissaoNFe.Pagamentos.Items[i].DataVencimento;
          vDup := DadosEmissaoNFe.Pagamentos.Items[i].Valor;
        end;
      end;
    end;

    if (DadosEmissaoNFe.Modelo = '65') then
    begin
      for i := 0 to DadosEmissaoNFe.Recebimentos.Count-1 do
      begin
        with pag.Add do
        begin
          if (DadosEmissaoNFe.Recebimentos.Items[i].TipoRecebimento = 'DINHEIRO') then
            tpag:= fpDinheiro
          else if (DadosEmissaoNFe.Recebimentos.Items[i].TipoRecebimento = 'CARTÃO CREDITO') then
          begin
            tpag:= fpCartaoCredito;
            if (DadosEmissaoNFe.Recebimentos.Items[i].PosOuTEF = 'SIM') then
              tpIntegra:= tiPagIntegrado
            else
              tpIntegra:= tiPagNaoIntegrado;
            CNPJ:= DadosEmissaoNFe.Recebimentos.Items[i].CNPJ_Operadora;
            cAut:= DadosEmissaoNFe.Recebimentos.Items[i].NAut;

             if UpperCase(DadosEmissaoNFe.Recebimentos.Items[i].NomeRede) = 'VISA' then
                tBand := bcVisa
             else if UpperCase(DadosEmissaoNFe.Recebimentos.Items[i].NomeRede) = 'CIELO' then
                tBand := bcVisa
             else if UpperCase(DadosEmissaoNFe.Recebimentos.Items[i].NomeRede) = 'MASTERCARD' then
                tBand := bcMasterCard
             else if UpperCase(DadosEmissaoNFe.Recebimentos.Items[i].NomeRede) = 'REDECARD' then
                tBand := bcMasterCard
             else if UpperCase(DadosEmissaoNFe.Recebimentos.Items[i].NomeRede) = 'AMEX' then
                tBand := bcAmericanExpress
             else if UpperCase(DadosEmissaoNFe.Recebimentos.Items[i].NomeRede) = 'SOROCRED' then
                tBand := bcSorocred
             else
                tBand := bcOutros;
          end
          else if (DadosEmissaoNFe.Recebimentos.Items[i].TipoRecebimento = 'CARTÃO DEBITO') then
          begin
            tpag:= fpCartaoDebito;
            if (DadosEmissaoNFe.Recebimentos.Items[i].PosOuTEF = 'SIM') then
              tpIntegra:= tiPagIntegrado
            else
              tpIntegra:= tiPagNaoIntegrado;
            CNPJ:= DadosEmissaoNFe.Recebimentos.Items[i].CNPJ_Operadora;
            cAut:= DadosEmissaoNFe.Recebimentos.Items[i].NAut;

             if UpperCase(DadosEmissaoNFe.Recebimentos.Items[i].NomeRede) = 'VISA' then
                tBand := bcVisa
             else if UpperCase(DadosEmissaoNFe.Recebimentos.Items[i].NomeRede) = 'CIELO' then
                tBand := bcVisa
             else if UpperCase(DadosEmissaoNFe.Recebimentos.Items[i].NomeRede) = 'MASTERCARD' then
                tBand := bcMasterCard
             else if UpperCase(DadosEmissaoNFe.Recebimentos.Items[i].NomeRede) = 'REDECARD' then
                tBand := bcMasterCard
             else if UpperCase(DadosEmissaoNFe.Recebimentos.Items[i].NomeRede) = 'AMEX' then
                tBand := bcAmericanExpress
             else if UpperCase(DadosEmissaoNFe.Recebimentos.Items[i].NomeRede) = 'SOROCRED' then
                tBand := bcSorocred
             else
                tBand := bcOutros;

          end
          else if (DadosEmissaoNFe.Recebimentos.Items[i].TipoRecebimento = 'CHEQUE') then
            tpag:= fpCheque
          else if (DadosEmissaoNFe.Recebimentos.Items[i].TipoRecebimento = 'CREDITO LOJA') then
            tpag:= fpCreditoLoja
          else if (DadosEmissaoNFe.Recebimentos.Items[i].TipoRecebimento = 'OUTROS') then
            tpag:= fpOutro;
          vPag:= DadosEmissaoNFe.Recebimentos.Items[i].ValorRecebimento;

        end;
      end;
    end;

    if (DadosEmissaoNFe.InformacoesAdicionais <> '') then
      InfAdic.infCpl := DadosEmissaoNFe.InformacoesAdicionais;

    // if (MMOInformacao_Adicional.Text <> '') then
    // InfAdic.infAdFisco :=  MMOInformacao_Adicional.Text;

    { with InfAdic.obsCont.Add do
      begin
      xCampo := 'Observação';
      xTexto := MMOObservacao.Text;
      end;

      with InfAdic.obsFisco.Add do
      begin
      xCampo := 'ObsFisco';
      xTexto := '';
      end; }

    // Processo referenciado
    { with InfAdic.procRef.Add do
      begin
      nProc := '';
      indProc := ipSEFAZ;
      end; }

    exporta.UFembarq := '';;
    exporta.xLocEmbarq := '';

    compra.xNEmp := '';
    compra.xPed := '';
    compra.xCont := '';
  end;
  TLog.Info('--- FIM MÉTODO GERAR NFE---');
end;
{ procedure Grande_Total;
  var
  iConta: Integer;
  begin
  for iConta := 1 to 18 do
  GrandeTotal := GrandeTotal + ' ';
  iRetorno := Bematech_FI_GrandeTotal(GrandeTotal);
  Analisa_iRetorno;
  end; }

{ procedure COO_INI_FIN;
  var
  iConta: Integer;
  begin
  for iConta := 1 to 6 do
  begin
  COOInicial := COOInicial + ' ';
  COOFinal := COOFinal + ' ';
  end;
  iRetorno := Bematech_FI_InicioFimCOOsMFD(COOInicial, COOFinal);
  Analisa_iRetorno;
  end; }

procedure Busca_Dados_SoftwareHouse;
var
  Arquivo: TStringlist;
  i, iConta, Tamanho: Integer;
  letra, NumeroCrip, numero, NumeroSerie: string;
begin
  Arquivo := TStringlist.Create;
  i := 0;
  try
    Arquivo.LoadFromFile(ExtractFilePath(application.ExeName) +
      'Software House.txt');
    for i := 0 to Arquivo.Count - 1 do
    begin
      letra := copy((Arquivo[i]), 1, 2);

      if letra = '0.' then // laudo
      begin
        n_laudo := copy((Arquivo[i]), 4, 44);
        n_laudo := Criptografa(n_laudo, 15);
      end
      else if letra = '1.' then // denominação
      begin
        deno_des := copy((Arquivo[i]), 4, 44);
        deno_des := Criptografa(deno_des, 15);
      end
      else if letra = '2.' then // cnpj
      begin
        cnpj_des := copy((Arquivo[i]), 4, 19);
        cnpj_des := Criptografa(cnpj_des, 15);
      end
      else if letra = '3.' then // insc_est
      begin
        insc_est_des := copy((Arquivo[i]), 4, 19);
        insc_est_des := Criptografa(insc_est_des, 15);
      end
      else if letra = '4.' then // insc_mun
      begin
        insc_mun_des := copy((Arquivo[i]), 4, 19);
        insc_mun_des := Criptografa(insc_mun_des, 15);
      end
      else if letra = '5.' then // nome_paf
      begin
        end_des := copy((Arquivo[i]), 4, 80);
        end_des := Criptografa(end_des, 15);
      end
      else if letra = '6.' then // telefone
      begin
        tel_des := copy((Arquivo[i]), 4, 44);
        tel_des := Criptografa(tel_des, 15);
      end
      else if letra = '7.' then // contato
      begin
        cont_des := copy((Arquivo[i]), 4, 44);
        cont_des := Criptografa(cont_des, 15);
      end
      else if letra = '8.' then // nome_paf
      begin
        nome_paf := copy((Arquivo[i]), 4, 44);
        nome_paf := Criptografa(nome_paf, 15);
      end
      else if letra = '9.' then // versão
      begin
        nome_exe := copy((Arquivo[i]), 4, 40);
        nome_exe := Criptografa(nome_exe, 15);
      end
      else if letra = '10' then // versão
      begin
        versao_paf := copy((Arquivo[i]), 5, 14);
        versao_paf := Criptografa(versao_paf, 15);
      end
      else if letra = '11' then // versão da especificação de requisitos
      begin
        versao_er_paf := copy((Arquivo[i]), 5, 8);
        versao_er_paf := Criptografa(versao_er_paf, 15);
      end
      else if letra = '12' then // md5
      begin
        pMD5 := copy((Arquivo[i]), 5, 36);
        pMD5 := Criptografa(pMD5, 15);
      end;
    end;
  finally
    FreeAndNil(Arquivo);
  end;
end;

procedure Inicia_Transacao(Conexao: TADOConnection);
begin
  Conexao.BeginTrans;
end;

procedure Confirma_Transacao(Conexao: TADOConnection);
begin
  Conexao.CommitTrans;
end;

procedure Cancela_Transacao(Conexao: TADOConnection);
begin
  Conexao.RollbackTrans;
end;

procedure Busca_ECFS;
var
  Arquivo: TStringlist;
  F: TextFile;
  i: Integer;
  letra: AnsiString;
begin
  i := 1;
  try
    letra := '';
    ecf1 := '';
    ecf2 := '';
    ecf3 := '';
    ecf4 := '';
    ecf5 := '';
    ecf6 := '';
    ecf7 := '';
    ecf8 := '';
    ecf9 := '';
    ecf10 := '';
    ecf11 := '';
    ecf12 := '';
    ecf13 := '';
    ecf14 := '';
    ecf15 := '';
    Arquivo := TStringlist.Create;
    Arquivo.LoadFromFile(ExtractFilePath(application.ExeName) + 'Config.txt');

    for i := 0 to Arquivo.Count - 1 do
    begin
      letra := copy((Arquivo[i]), 1, 7);

      if (letra = 'ECF1 - ') then
        ecf1 := copy(Criptografa(Arquivo[i], 15), 8, 20);

      if letra = 'ECF2 - ' then
        ecf2 := copy(Criptografa(Arquivo[i], 15), 8, 20);

      if (letra = 'ECF3 - ') then
        ecf3 := copy(Criptografa(Arquivo[i], 15), 8, 20);

      if (letra = 'ECF4 - ') then
        ecf4 := copy(Criptografa(Arquivo[i], 15), 8, 20);

      if (letra = 'ECF5 - ') then
        ecf5 := copy(Criptografa(Arquivo[i], 15), 8, 20);

      if (letra = 'ECF6 - ') then
        ecf6 := copy(Criptografa(Arquivo[i], 15), 8, 20);

      if (letra = 'ECF7 - ') then
        ecf7 := copy(Criptografa(Arquivo[i], 15), 8, 20);

      if (letra = 'ECF8 - ') then
        ecf8 := copy(Criptografa(Arquivo[i], 15), 8, 20);

      if (letra = 'ECF9 - ') then
        ecf9 := copy(Criptografa(Arquivo[i], 15), 8, 20);

      if (letra = 'ECF10 - ') then
        ecf10 := copy(Criptografa(Arquivo[i], 15), 8, 20);

      if (letra = 'ECF11 - ') then
        ecf11 := copy(Criptografa(Arquivo[i], 15), 8, 20);

      if (letra = 'ECF12 - ') then
        ecf12 := copy(Criptografa(Arquivo[i], 15), 8, 20);

      if (letra = 'ECF13 - ') then
        ecf13 := copy(Criptografa(Arquivo[i], 15), 8, 20);

      if (letra = 'ECF14 - ') then
        ecf14 := copy(Criptografa(Arquivo[i], 15), 8, 20);

      if (letra = 'ECF15 - ') then
        ecf15 := copy(Criptografa(Arquivo[i], 15), 8, 20);

    end;
  finally
    FreeAndNil(Arquivo);
  end;
end;

procedure Busca_Arquivos_PAF;
var
  Arquivo: TStringlist;
  i, j: Integer;
  Arq: AnsiString;
begin
  j := 0;
  arquivos_paf_aux1 := '';
  arquivos_paf_aux2 := '';
  arquivos_paf_aux3 := '';
  arquivos_paf := '';
  Arquivo := TStringlist.Create;
  Arquivo.LoadFromFile(ExtractFilePath(application.ExeName) + 'ArqMD5.txt');
  try
    for i := 0 to Arquivo.Count - 1 do
    begin
      Arq := Arquivo[i];
      arquivos_paf := arquivos_paf + Arq + #13 + #10;
      Inc(j);

      if (j <= 8) then
        arquivos_paf_aux1 := arquivos_paf_aux1 + Arq + #13 + #10
      else if (j <= 15) and (j > 8) then
        arquivos_paf_aux2 := arquivos_paf_aux2 + Arq + #13 + #10
      else
        arquivos_paf_aux3 := arquivos_paf_aux3 + Arq + #13 + #10;
    end;
  finally
    FreeAndNil(Arquivo);
  end;
end;

procedure CarregaMD5_Principal;
var
  Arquivo: TStringlist;
  Data: string;
  F: TextFile;
  letra: String;
  i: Integer;
begin
  Arquivo := TStringlist.Create;
  Data := FormatDateTime('DDMMYY', date);

  Arquivo.LoadFromFile(ExtractFilePath(application.ExeName) + 'Config.txt');
  try
    for i := 0 to Arquivo.Count - 1 do
    begin
      letra := copy((Arquivo[i]), 1, 6);
      if (letra = 'MD5 - ') then
      begin
        pMD5_Arquivos := copy(Arquivo[i], 7, 36);
        pMD5_Arquivos := Criptografa(pMD5_Arquivos, 15);
        break;
      end;
    end;
  finally
    FreeAndNil(Arquivo);
  end;
end;

function Remove_Zero_Esquerda(Texto: AnsiString): AnsiString;
begin
  while Texto[1] = '0' do
  begin
    Texto := copy(Texto, 2, Length(Texto));
  end;

  Result := Texto;
end;

function Remove_Virgula(Texto: AnsiString): AnsiString;
begin
  Result := StringReplace(Texto, ',', '', [rfReplaceAll]);
end;

{ procedure Totalizador_Parcial;
  var
  i: Integer;
  begin
  for i := 1 to 1278 do
  dados_reducao := dados_reducao + ' ';
  iRetorno := Bematech_FI_DadosUltimaReducaoMFD(dados_reducao);

  iRelatorio := 0;
  iIndex := 1208;
  iInTotalizador := 335;
  iConta := 0;
  iTotal := 0;
  While (iRelatorio = 0) do
  begin
  cAliquota := copy(dados_reducao, iIndex, 4);
  If (cAliquota <> '0000') then
  begin
  cTotalizador := '';
  cBuffer := '';
  cTotalizador := copy(dados_reducao, iInTotalizador, 14);
  if (cAliquota = issqnn) then
  cBuffer := cBuffer + FormatFloat('00', iConta + 1) + 'S' + cAliquota
  else
  cBuffer := cBuffer + FormatFloat('00', iConta + 1) + 'T' + cAliquota;
  iInTotalizador := iInTotalizador + 14;
  R03.Inserir(R03);
  R03.Inserir_Aux(R03);
  end
  Else
  begin
  iInTotalizador := 560;
  If (iInTotalizador = 560) then
  begin
  cTotalizador := '';
  cBuffer := '';
  cTotalizador := copy(dados_reducao, iInTotalizador, 14);
  cBuffer := cBuffer + 'I1';
  iInTotalizador := iInTotalizador + 15;
  iRelatorio := 1;
  R03.Inserir(R03);
  R03.Inserir_Aux(R03);
  end;
  If (iInTotalizador = 575) then
  begin
  cTotalizador := '';
  cBuffer := '';
  cTotalizador := copy(dados_reducao, iInTotalizador, 14);
  cBuffer := cBuffer + 'N1';
  iInTotalizador := iInTotalizador + 15;
  iRelatorio := 1;
  R03.Inserir(R03);
  R03.Inserir_Aux(R03);
  end;
  If (iInTotalizador = 590) then
  begin
  cTotalizador := '';
  cBuffer := '';
  cTotalizador := copy(dados_reducao, iInTotalizador, 14);
  cBuffer := cBuffer + 'F1';
  iInTotalizador := iInTotalizador + 15;
  iRelatorio := 1;
  R03.Inserir(R03);
  R03.Inserir_Aux(R03);
  end;
  If (iInTotalizador = 605) then
  begin
  cTotalizador := '';
  cBuffer := '';
  cTotalizador := copy(dados_reducao, iInTotalizador, 14);
  cBuffer := cBuffer + 'IS1';
  iInTotalizador := iInTotalizador + 15;
  iRelatorio := 1;
  R03.Inserir(R03);
  R03.Inserir_Aux(R03);
  end;
  If (iInTotalizador = 620) then
  begin
  cTotalizador := '';
  cBuffer := '';
  cTotalizador := copy(dados_reducao, iInTotalizador, 14);
  cBuffer := cBuffer + 'NS1';
  iInTotalizador := iInTotalizador + 15;
  iRelatorio := 1;
  R03.Inserir(R03);
  R03.Inserir_Aux(R03);
  end;
  If (iInTotalizador = 635) then
  begin
  cTotalizador := '';
  cBuffer := '';
  cTotalizador := copy(dados_reducao, iInTotalizador, 14);
  cBuffer := cBuffer + 'FS1';
  iInTotalizador := iInTotalizador + 15;
  iRelatorio := 1;
  R03.Inserir(R03);
  R03.Inserir_Aux(R03);
  end;
  If (iInTotalizador = 650) then
  begin
  cTotalizador := '';
  cBuffer := '';
  cTotalizador := copy(dados_reducao, iInTotalizador, 14);
  cBuffer := cBuffer + 'DT';
  iInTotalizador := iInTotalizador + 15;
  iRelatorio := 1;
  R03.Inserir(R03);
  R03.Inserir_Aux(R03);
  end;
  If (iInTotalizador = 665) then
  begin
  cTotalizador := '';
  cBuffer := '';
  cTotalizador := copy(dados_reducao, iInTotalizador, 14);
  cBuffer := cBuffer + 'DS';
  iInTotalizador := iInTotalizador + 15;
  iRelatorio := 1;
  R03.Inserir(R03);
  R03.Inserir_Aux(R03);
  end;
  If (iInTotalizador = 680) then
  begin
  cTotalizador := '';
  cBuffer := '';
  cTotalizador := copy(dados_reducao, iInTotalizador, 14);
  cBuffer := cBuffer + 'AT';
  iInTotalizador := iInTotalizador + 15;
  iRelatorio := 1;
  R03.Inserir(R03);
  R03.Inserir_Aux(R03);
  end;
  If (iInTotalizador = 695) then
  begin
  cTotalizador := '';
  cBuffer := '';
  cTotalizador := copy(dados_reducao, iInTotalizador, 14);
  cBuffer := cBuffer + 'AS';
  iInTotalizador := iInTotalizador + 15;
  iRelatorio := 1;
  R03.Inserir(R03);
  R03.Inserir_Aux(R03);
  end;
  If (iInTotalizador = 710) then
  begin
  cTotalizador := '';
  cBuffer := '';
  cTotalizador := copy(dados_reducao, iInTotalizador, 14);
  cBuffer := cBuffer + 'Can-T';
  iInTotalizador := iInTotalizador + 15;
  iRelatorio := 1;
  R03.Inserir(R03);
  R03.Inserir_Aux(R03);
  end;
  If (iInTotalizador = 725) then
  begin
  cTotalizador := '';
  cBuffer := '';
  cTotalizador := copy(dados_reducao, iInTotalizador, 14);
  cBuffer := cBuffer + 'Can-S';
  iInTotalizador := iInTotalizador + 15;
  iRelatorio := 1;
  R03.Inserir(R03);
  R03.Inserir_Aux(R03);
  end;
  If (iInTotalizador = 740) then
  begin
  While (iInTotalizador < 1132) do
  begin
  cTotalizador := '';
  cBuffer := '';
  cTotalizador := copy(dados_reducao, iInTotalizador, 14);
  iTotal := iTotal + StrToInt(cTotalizador);
  iInTotalizador := iInTotalizador + 14;
  iRelatorio := 1;
  end;
  iInTotalizador := iInTotalizador + 1;
  cTotalizador := copy(dados_reducao, iInTotalizador, 14);
  iTotal := iTotal + StrToInt(cTotalizador);
  iInTotalizador := iInTotalizador + 15;
  cTotalizador := copy(dados_reducao, iInTotalizador, 14);
  iTotal := iTotal + StrToInt(cTotalizador);
  cBuffer := cBuffer + 'OPNF';
  // cBuffer := cBuffer + FormatFloat('0000000000000',iTotal);
  iInTotalizador := iInTotalizador + 15;
  R03.Inserir(R03);
  R03.Inserir_Aux(R03);
  end;
  end;
  iConta := iConta + 1;
  iIndex := iIndex + 4;
  end;
  end; }

procedure SetUncommitted(Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection := Conexao;
      clear;
      add('set transaction isolation level read uncommitted');
      // add('ALTER DATABASE db_proj_fav SET READ_COMMITTED_SNAPSHOT ON');
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Gera_N_Pedido(var Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection := Conexao;
      clear;
      add('select max(N_Pedido) as Pedido from Controla_Pedido ');
      open;
    end;
    N_Pedido := qAux.FieldByName('Pedido').AsInteger + 1;
    Pedido := StringOfChar('0', 12 - Length(IntToStr(N_Pedido))) +
      IntToStr(N_Pedido);
    // qAux.Close;
    // qAux.Post;

    with qAux, SQL do
    begin
      close;
      Connection := Conexao;
      clear;
      add('Insert into Controla_Pedido (N_Pedido) values (:N_Pedido)');
      Parameters.ParamByName('N_Pedido').Value := N_Pedido;
      ExecSQL;
    end;

  finally
    // FreeAndNil(qAux);
  end;
end;

procedure Gera_Codigo_Lancamento(var Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection := Conexao;
      clear;
      add('select max(Codigo) as Codigo from Controla_Codigo ');
      open;
    end;
    UDeclaracao.Codigo := qAux.FieldByName('Codigo').AsInteger + 1;

    with qAux, SQL do
    begin
      close;
      Connection := Conexao;
      clear;
      add('Insert into Controla_Codigo (Codigo) values (:Codigo)');
      Parameters.ParamByName('Codigo').Value := UDeclaracao.Codigo;
      ExecSQL;
    end;
  finally
    // FreeAndNil(qAux);
  end;
end;

function Gera_Codigo_Cadastro(Tabela: AnsiString): Integer;
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select max(Codigo) as Codigo from ' + (Tabela) + '');
      open;
      Result := qAux.FieldByName('Codigo').AsInteger + 1;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

function Gera_Codigo_Indetity(Tabela: AnsiString): Integer;
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select IDENT_CURRENT(' + QuotedStr(Tabela) + ') as Codigo');
      open;
      Result := qAux.FieldByName('Codigo').AsInteger + 1;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Gera_Codigo_Lancamento_Local;
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnectionLocal;
      clear;
      add('select max(Codigo) as Codigo from Controla_Codigo ');
      open;
    end;
    UDeclaracao.Codigo := qAux.FieldByName('Codigo').AsInteger + 1;
    FrmPDV.LblCodigo.Caption := IntToStr(UDeclaracao.Codigo);

    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnectionLocal;
      clear;
      add('Insert into Controla_Codigo (Codigo) values (:Codigo)');
      Parameters.ParamByName('Codigo').Value := UDeclaracao.Codigo;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Gera_Codigo_Lancamento_Sem_Inserir;
var
  qAux: TADOQuery;
begin
  try
    qAux := TADOQuery.Create(nil);
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select max(Codigo) as Codigo from Controla_Codigo ');
      open;
    end;
    // FrmPDV.LblCodigo_Sem_Rede.Caption := qAux.FieldByName('Codigo').AsString;
    // UDeclaracao.ultima_venda:= qAux.FieldByName('Codigo').AsInteger;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Gera_N_Pre_Venda(var Conexao: TADOConnection);
var
  qAux, qAux2: TADOQuery;
begin
  try
    try
      qAux := TADOQuery.Create(nil);
      with qAux, SQL do
      begin
        close;
        Connection := Conexao;
        clear;
        add('select max(N_Pre_Venda) as Pre_Venda from Controla_Pre_Venda ');
        open;
      end;
      n_pre_venda := qAux.FieldByName('Pre_Venda').AsInteger + 1;
      pre_venda := StringOfChar('0', 10 - Length(IntToStr(n_pre_venda))) +
        IntToStr(n_pre_venda);

      with qAux, SQL do
      begin
        close;
        Connection := Conexao;
        clear;
        add('Insert into Controla_Pre_Venda (N_Pre_Venda) values (:N_Pre_Venda)');
        Parameters.ParamByName('N_Pre_Venda').Value := n_pre_venda;
        ExecSQL;
      end;
      { if (FrmPedido_Venda <> nil) then
        begin
        if (FrmPedido_Venda.ativo = true) then
        Pre_Venda_Gerada;
        end; }
    except
      ShowMessage('Erro ao gerar Pré-Venda');
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Registra_R06;
var
  MD5Gerado: AnsiString;
begin
  Coleta_Dados_R06;
  //MD5Gerado := GeraMD5([nu_serie, UDeclaracao.COO,
                        //UDeclaracao.GNF, UDeclaracao.CDC, 'RG', UDeclaracao.Data_Final_Emissao]);

  //AtualizaMD5('R06', MD5Gerado, );
  //AtualizarQuantidadeRegistro('R06','QtdeR06');

  R06.Inserir_Outros(R06);
  //R06.Inserir_Outros_Aux(R06);
end;

{ procedure Captura_Data_Movimento;
  var
  d, m, a: String;
  iConta: Integer;
  begin
  for iConta := 1 to 6 do
  data_movimento := data_movimento + ' ';

  iRetorno := Bematech_FI_DataMovimento(data_movimento);
  Analisa_iRetorno;
  d := copy(data_movimento, 1, 2);
  m := copy(data_movimento, 3, 2);
  a := copy(data_movimento, 5, 2);
  Data := d + '/' + m + '/' + a;

  if (Data = '00/00/00') then
  DataF := '00/00/0000'
  else
  DataF := FormatDateTime('DD/MM/YYYY', StrToDate(Data));

  end; }

procedure Coleta_Dados_R06;
begin
  // CapturaContadoresECF;
  ECF.Pega_Contadores;
  // Captura_Data_Movimento;
  ECF.Pega_Data_Movimento;
  // Captura_Data_Hora_Documento;
  ECF.Pega_Data_Hora_Documento;
end;

{ procedure Captura_Data_Inicio_Documento;
  var
  iConta: Integer;
  begin
  for iConta := 1 to 6 do
  d_ab := d_ab + ' ';
  for iConta := 1 to 6 do
  h_ab := h_ab + ' ';

  iRetorno := Bematech_FI_DataHoraImpressora(d_ab, h_ab);
  Analisa_iRetorno;
  end; }

{ procedure Captura_Data_Hora_Documento;
  var
  iConta: Integer;
  Data: AnsiString;
  begin
  for iConta := 1 to 12 do
  Data := Data + ' ';

  iRetorno := Bematech_FI_DataHoraUltimoDocumentoMFD(Data);
  Analisa_iRetorno;

  data_final_emissao := copy(Data, 1, 6);
  hora_final_emissao := copy(Data, 7, 6);
  // data_final_emissao:= FormatDateTime('YYYYMMDD', StrToDateTime(data_final_emissao));
  end; }

{ procedure Captura_Data_Hora_Reducao;
  var
  iConta: Integer;
  begin
  for iConta := 1 to 6 do
  data_reducao := data_reducao + ' ';
  for iConta := 1 to 6 do
  hora_reducao := hora_reducao + ' ';

  iRetorno := Bematech_FI_DataHoraReducao(data_reducao, hora_reducao);
  Analisa_iRetorno;
  end; }

{ procedure Captura_Sub_Total;
  begin
  SetLength(SubTotal, 14);

  iRetorno := Bematech_FI_SubTotal(SubTotal);
  Analisa_iRetorno;
  end; }

{ procedure Captura_Venda_Bruta;
  var
  iConta: Integer;
  begin
  for iConta := 1 to 18 do
  venda_bruta_diaria := venda_bruta_diaria + ' ';

  iRetorno := Bematech_FI_VendaBruta(venda_bruta_diaria);
  Analisa_iRetorno;
  end; }

{ procedure Captura_Numero_Caixa;
  var
  iConta: Integer;
  begin
  for iConta := 1 to 4 do
  UDeclaracao.sequencia := UDeclaracao.sequencia + ' ';

  iRetorno := Bematech_FI_NumeroCaixa(UDeclaracao.sequencia);
  Analisa_iRetorno;
  UDeclaracao.sequencia := copy(UDeclaracao.sequencia, 1, 4);
  end; }

{ procedure Captura_Ultimo_Item;
  var
  iConta: Integer;
  begin
  UDeclaracao.n_item := '';
  for iConta := 1 to 4 do
  UDeclaracao.n_item := UDeclaracao.n_item + ' ';

  iRetorno := Bematech_FI_UltimoItemVendido(UDeclaracao.n_item);
  Analisa_iRetorno;
  end; }

procedure Criptografa_Arquivo_Configuracao_Estacao;
var
  ArqIni: TIniFile;
  Porta, path: String;
  i: Integer;
begin
  try
    ArqIni := TIniFile.Create(ExtractFilePath(application.ExeName) +
      'Configura_Estacao.ini');

    { tipo_local:= ArqIni.ReadString('Sistema', 'Tipo', tipo_local);
      gera_pre_venda:= ArqIni.ReadString('Sistema', 'Pré-Venda', gera_pre_venda);
      gera_os:= ArqIni.ReadString('Sistema', 'OS', gera_os);
      gera_dav:= ArqIni.ReadString('Sistema', 'DAV', gera_dav);
      modelo_dav:= ArqIni.ReadString('Modelo Relatórios', 'ModeloDAV', modelo_dav);
      modelo_os:= ArqIni.ReadString('Modelo Relatórios', 'ModeloOS', modelo_os); }

    ArqIni.WriteString('Sistema', 'Tipo', Criptografa(tipo_local, 15));
    ArqIni.WriteString('Sistema', 'Pré-Venda', Criptografa(gera_pre_venda, 15));
    ArqIni.WriteString('Sistema', 'OS', Criptografa(gera_os, 15));
    ArqIni.WriteString('Sistema', 'DAV', Criptografa(gera_dav, 15));
    ArqIni.WriteString('Modelo Relatórios', 'ModeloDAV',
      Criptografa(modelo_dav, 15));
    ArqIni.WriteString('Modelo Relatórios', 'ModeloOS',
      Criptografa(modelo_os, 15));

  finally
    FreeAndNil(ArqIni);
  end;
end;

function Carrega_Tipo_Local: Integer;
var
  ArqIni, ArqIni2: TIniFile;
  Porta, path: String;
  i: Integer;
begin
  try
    ArqIni := TIniFile.Create(ExtractFilePath(application.ExeName) +
      'Configura_Estacao.ini');
    ArqIni2 := TIniFile.Create(caminho_servidor + 'Configura_Estacao.ini');
    tipo_local := ArqIni.ReadString('Sistema', 'Tipo', tipo_local);
    tipo_local := Criptografa(tipo_local, 15);
    // se for 0101 então é caixa... se for 0202, é estação
    if (tipo_local = '0101') then
      Result := 0
    else if (tipo_local = '0202') then
      Result := 1;

    // gera_pre_venda := ArqIni.ReadString('Sistema', 'Pré-Venda', gera_pre_venda);
    // gera_os := ArqIni.ReadString('Sistema', 'OS', gera_os);
    // gera_dav := ArqIni.ReadString('Sistema', 'DAV', gera_dav);
    // gera_nfe := ArqIni.ReadString('Sistema', 'NFE', gera_nfe);
    maq := ArqIni.ReadString('Sistema', 'Maq', maq);
    // modelo_dav := ArqIni.ReadString('Modelo Relatórios', 'ModeloDAV', modelo_dav);
    // modelo_os := ArqIni.ReadString('Modelo Relatórios', 'ModeloOS', modelo_os);
    // separacao := ArqIni.ReadString('Impressao', 'Separacao', separacao);
    // entrega := ArqIni.ReadString('Impressao', 'Entrega', entrega);
    // compra := ArqIni.ReadString('Impressao', 'Compra', compra);
    // recibo := ArqIni.ReadString('Impressao', 'Recibo', recibo);
    Imp_Fiscal_Escolhida := ArqIni.ReadString('ECF', 'Impressora',
      Imp_Fiscal_Escolhida);
    porta_ecf := ArqIni.ReadString('ECF', 'Porta', porta_ecf);
    // versao_bd_cliente := ArqIni.ReadString('Configuracao', 'Versao_BD', versao_bd_cliente);
    // qtde_mac := ArqIni2.ReadString('Sistema', 'QtdeMaq', qtde_mac);

    // gera_pre_venda := Criptografa(gera_pre_venda, 15);
    // gera_os := Criptografa(gera_os, 15);
    // gera_dav := Criptografa(gera_dav, 15);
    // gera_nfe := Criptografa(gera_nfe, 15);
    maq := Criptografa(maq, 15);
    // qtde_mac := Criptografa(qtde_mac, 15);
    // modelo_dav := Criptografa(modelo_dav, 15);
    // modelo_os := Criptografa(modelo_os, 15);
    // separacao := Criptografa(separacao, 15);
    // entrega := Criptografa(entrega, 15);
    // compra := Criptografa(compra, 15);
    // recibo := Criptografa(recibo, 15);
    Imp_Fiscal_Escolhida := Criptografa(Imp_Fiscal_Escolhida, 15);
    //porta_ecf := Criptografa(porta_ecf, 15);

  finally
    FreeAndNil(ArqIni);
  end;
end;

procedure Calcula_Estoque_Fabricacao(Produto: integer; Qtde_Produzida: double;
  Data_Fabricacao: TDate; Conexao: TADOConnection);
var
  qAux2, qAux3, qAux_Pega_Receita: TADOQuery;
  Qtde, custo, custo_aux: double;
begin
  qAux_Pega_Receita := TADOQuery.Create(nil);
  qAux2 := TADOQuery.Create(nil);
  qAux3 := TADOQuery.Create(nil);

  try
    with qAux_Pega_Receita, SQL do
    begin
      close;
      Connection := Conexao;
      clear;
      add('select R.Codigo_Produto, IR.Codigo_Insumo, IR.Unidade as Unidade_Receita, IR.Qtde as Qtde_Receita,');
      add('	   P.Estoque as Estoque_Insumo, P.Valor_Compra, P2.Estoque');
      add('	   from Itens_Receita IR');
      add('	   inner join Receita R on (IR.Codigo = R.Codigo)');
      add('	   inner join Produto P on (IR.Codigo_Insumo = P.Codigo)');
      add('    inner join Produto P2 on (R.Codigo_Produto = P2.Codigo)');
      add('    where R.Codigo_Produto = :Produto');
      Parameters.ParamByName('Produto').Value := Produto;
      open;
      First;
    end;

    if (qAux_Pega_Receita.IsEmpty = false) then
    begin
      while not (qAux_Pega_Receita.Eof) do
      begin
        Qtde := (qAux_Pega_Receita.FieldByName('Qtde_Receita').AsFloat * Qtde_Produzida);
        custo_aux := qAux_Pega_Receita.FieldByName('Valor_Compra').AsFloat / Qtde;    //
        custo := custo + custo_aux;

        ////estoque dos ingredientes
        with qAux2, SQL do
        begin
          close;
          Connection := Conexao;
          clear;
          add('update Produto set Estoque = :Estoque where Codigo = :Codigo');
          Parameters.ParamByName('Codigo').Value := qAux_Pega_Receita.FieldByName('Codigo_Insumo').AsInteger;
          Parameters.ParamByName('Estoque').Value :=  (qAux_Pega_Receita.FieldByName('Estoque_Insumo').AsFloat - (Qtde));
          ExecSQL;
        end;
        qAux_Pega_Receita.Next;
      end;

      with qAux3, SQL do
      begin
        close;
        Connection := Conexao;
        clear;
        add('update Produto set Valor_Compra = :Valor_Compra, Ultima_Venda = :Ultima_Venda where Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value := Produto;
        Parameters.ParamByName('Valor_Compra').Value := custo;
        Parameters.ParamByName('Ultima_Venda').Value := Data_Fabricacao;
        ExecSQL;
      end;


      ////estoque do produto fabricado
      {with qAux3, SQL do
      begin
        close;
        Connection := Conexao;
        clear;
        add('update Produto set Estoque = :Estoque where Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value := qAux_Pega_Receita.FieldByName('Codigo_Produto').AsInteger;
        Parameters.ParamByName('Estoque').Value :=  (qAux_Pega_Receita.FieldByName('Estoque').AsFloat - (Qtde));
        ExecSQL;
      end;}
    end;
  finally
    FreeAndNil(qAux2);
    FreeAndNil(qAux_Pega_Receita);
  end;
end;

procedure Grava_Pedido_Informacoes_ECF(CodigoPedido: integer; NFabricacaoECF, MFAdicional, TipoECF, MarcaECF,
ModeloECF, COO, COOVin, NSequencia, MD5: AnsiString; Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(nil);
  with qAux, sql do
  begin
    close;
    Connection:= Conexao;
    clear;
    Add('Insert Into Pedido_Informacoes_ECF ');
    Add('(Codigo_Pedido,');
    Add('N_Fabricacao_ECF,');
    Add('MF_Adicional,');
    Add('Tipo_ECF, ');
    Add('Marca_ECF,');
    Add('Modelo_ECF, ');
    Add('COO, ');
    Add('COO_Vin, ');
    Add('N_Sequencia, ');
    Add('MD5) ');
    Add('values ');
    Add('(:Codigo_Pedido,');
    Add(':N_Fabricacao_ECF,');
    Add(':MF_Adicional,');
    Add(':Tipo_ECF, ');
    Add(':Marca_ECF,');
    Add(':Modelo_ECF, ');
    Add(':COO, ');
    Add(':COO_Vin, ');
    Add(':N_Sequencia, ');
    Add(':MD5) ');

    Parameters.ParamByName('Codigo_Pedido').Value:= CodigoPedido;
    Parameters.ParamByName('N_Fabricacao_ECF').Value:= NFabricacaoECF;
    Parameters.ParamByName('MF_Adicional').Value:= MFAdicional;
    Parameters.ParamByName('Tipo_ECF').Value:= TipoECF;
    Parameters.ParamByName('Marca_ECF').Value:= MarcaECF;
    Parameters.ParamByName('Modelo_ECF').Value:= ModeloECF;
    Parameters.ParamByName('COO').Value:= COO;
    Parameters.ParamByName('COO_Vin').Value:= COOVin;
    Parameters.ParamByName('N_Sequencia').Value:= NSequencia;
    Parameters.ParamByName('MD5').Value:= MD5;
    ExecSQL;
  end;
end;

procedure SetDefaultPrinter(PrinterName: AnsiString);
var
  i: Integer;
  Device: Pchar;
  Driver: Pchar;
  Port: Pchar;
  HdeviceMode: THandle;
  aPrinter: TPrinter;
begin
  Printer.PrinterIndex := -1;
  getmem(Device, 255);
  getmem(Driver, 255);
  getmem(Port, 255);
  aPrinter := TPrinter.Create;
  for i := 0 to Printer.Printers.Count - 1 do
  begin
    if Printer.Printers[i] = PrinterName then
    begin
      aPrinter.PrinterIndex := i;
      aPrinter.getprinter(Device, Driver, Port, HdeviceMode);
      StrCat(Device, ',');
      StrCat(Device, Driver);
      StrCat(Device, Port);
      WriteProfileString('windows', 'device', Device);
      StrCopy(Device, 'windows');
      // SendMessage(HWND_BROADCAST, WM_WININICHANGE, 0, Longint(@Device));
    end;
  end;
  Freemem(Device, 255);
  Freemem(Driver, 255);
  Freemem(Port, 255);
  aPrinter.Free;
end;

{ procedure CapturaContadoresECF;
  var
  aContador: AnsiString;
  i: Integer;
  begin
  // CDC
  aContador := '';
  for i := 1 to 4 do
  aContador := aContador + ' ';
  iRetorno := Bematech_FI_ContadorComprovantesCreditoMFD(aContador);
  if iRetorno <> 1 then
  showmessage('Erro ao comunicar com o ECF, ao capturar o CDC!!!')
  else
  cdc := (aContador);
  // COO
  aContador := '';
  for i := 1 to 6 do
  aContador := aContador + ' ';
  iRetorno := Bematech_FI_NumeroCupom(aContador);
  if iRetorno <> 1 then
  showmessage('Erro ao comunicar com o ECF, ao capturar o COO!!!')
  else
  COO := (aContador);
  // GNF
  aContador := '';
  for i := 1 to 6 do
  aContador := aContador + ' ';
  iRetorno := Bematech_FI_NumeroOperacoesNaoFiscais(aContador);
  if iRetorno <> 1 then
  showmessage('Erro ao comunicar com o ECF, ao capturar o GNF!!!')
  else
  gnf := (aContador);
  // GRG
  aContador := '';
  for i := 1 to 6 do
  aContador := aContador + ' ';
  iRetorno := Bematech_FI_ContadorRelatoriosGerenciaisMFD(aContador);
  if iRetorno <> 1 then
  showmessage('Erro ao comunicar com o ECF, ao capturar o GRG!!!')
  else
  grg := (aContador);
  // CCF
  aContador := '';
  for i := 1 to 6 do
  aContador := aContador + ' ';
  iRetorno := Bematech_FI_ContadorCupomFiscalMFD(aContador);
  if iRetorno <> 1 then
  showmessage('Erro ao comunicar com o ECF, ao capturar o CCF!!!')
  else
  ccf := (aContador);
  // CRZ
  aContador := '';
  for i := 1 to 4 do
  aContador := aContador + ' ';
  iRetorno := Bematech_FI_NumeroReducoes(aContador);
  if iRetorno <> 1 then
  showmessage('Erro ao comunicar com o ECF, ao capturar o CCF!!!')
  else
  crz := (aContador);
  // CRO
  aContador := '';
  for i := 1 to 4 do
  aContador := aContador + ' ';
  iRetorno := Bematech_FI_NumeroIntervencoes(aContador);
  if iRetorno <> 1 then
  showmessage('Erro ao comunicar com o ECF, ao capturar o CCF!!!')
  else
  cro := (aContador);
  end; }
procedure Verifica_Data(Componente: TMaskEdit);
begin
  try
    StrToDate(Componente.Text);
  except
    on EConvertError do
    begin
      application.MessageBox('Data inválida.', 'Erro', MB_OK + MB_ICONHAND);
      Componente.SetFocus;
      Componente.Text := DateToStr(date);
      abort;
    end;

  end;
end;

procedure AlteraGT(GT: Double; N_Fabricacao: AnsiString);
var
  Arquivo: TStringlist;
  i, iConta: Integer;
  letra, Crip: AnsiString;
  Arq: string;
  qAux: TADOQuery;
begin
  {qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update Configuracao_ECF set GT = :GT where N_Fabricacao = :N_Fabricacao');
      Parameters.ParamByName('GT').Value := GT;
      Parameters.ParamByName('N_Fabricacao').Value := N_Fabricacao;
      ExecSQL;
    end;
    TLog.Debug('Alterou Grande Total.');
  except
    on E: Exception do
    begin
      TLog.Error('Erro ao alterar GT: ' + E.Message);
    end;

  end;}
  Arquivo := TStringList.Create;
  //for iConta := 1 to 18 do
  //GrandeTotal := GrandeTotal + ' ';
  try
    Arquivo.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Config.txt');
    for i := 0 to Arquivo.count - 1 do
    begin
      letra := copy((Arquivo[i]), 1, 5);
      if letra = 'GT - ' then
      begin
        try
          //Bematech_FI_GrandeTotal(GrandeTotal);
          ECF.Pega_Grande_Total;
          Crip := (Criptografa(GrandeTotal, 15));
          finally
            Arquivo[i] := 'GT - ' + Crip;
            Arquivo.SaveToFile(ExtractFilePath(Application.ExeName)
            + 'Config.txt');
        end;
      end;
    end;
  finally
  FreeAndNil(Arquivo);
  // Backup_Config;
  end;
end;

procedure Cupom_Encontrado;
begin
  application.MessageBox
    ('Foi encontrado um cupom em aberto. Será dado continuidade em sua emissão',
    'Atenção', MB_OK + MB_ICONQUESTION);
end;

procedure Captura_Chave;
var
  Arquivo: TStringlist;
  i, iConta: Integer;
  letra: AnsiString;
begin
  Arquivo := TStringlist.Create;
  i := 0;
  try
    Arquivo.LoadFromFile(ExtractFilePath(application.ExeName) + 'Chave.txt');
    for i := 0 to Arquivo.Count - 1 do
    begin
      letra := copy((Arquivo[i]), 1, 1);
      if letra = '1' then // pública
        cChavePublica := copy((Arquivo[i]), 4, 256)
      else if letra = '2' then // privada
        cChavePrivada := copy((Arquivo[i]), 4, 256)
    end;
  finally
    FreeAndNil(Arquivo);
  end;
end;

procedure GeraChave;
begin
  SetLength(cChavePublica, 256);
  SetLength(cChavePrivada, 256);

  iRetorno := genkkey(cChavePublica, cChavePrivada);

  Analisa_iRetorno;
end;

function GeraMD5PAFECF: AnsiString;
var
  Arquivo: TextFile;
  ArqTexto, aMD5, teste: AnsiString;
  NomeArq: AnsiString;
  F: TSearchRec;
  Ret: Integer;
begin
  Result := '';
  try
    // Apaga arquivo anterior
    ArqTexto := Local_Arquivo(14) + 'PAF_N.txt';
    {if FileExists(ArqTexto) then
      DeleteFile(ArqTexto);
    // cria o arquivo TXT na mesma pasta do sistema
    AssignFile(Arquivo, ArqTexto);
    Rewrite(Arquivo);
    // lista todos os arquivo exe da pasta do aplicativo e gera o MD5
    Ret := FindFirst(Local_Arquivo(14) + '\*.exe', faAnyFile, F);
    try
      while Ret = 0 do
      begin
        if F.Attr and faDirectory <> faDirectory then
        begin
          NomeArq := Local_Arquivo(14) + '\' + F.Name;
          aMD5 := MD5Print(MD5File(NomeArq));
          writeln(Arquivo, F.Name + ' - ' + aMD5);
        end;
        Ret := FindNext(F);
      end;
    finally
      FindClose(F);
    end;

    Ret := FindFirst(Local_Arquivo(14) + '*.dll', faAnyFile, F);
    try
      while Ret = 0 do
      begin
        if (F.Attr and faDirectory) <> faDirectory then
        begin
          NomeArq := Local_Arquivo(14) + '\' + F.Name;
          aMD5 := MD5Print(MD5File(NomeArq));
          writeln(Arquivo, F.Name + ' - ' + aMD5);
        end;
        Ret := FindNext(F);
      end;
    finally
      FindClose(F);
    end;
    CloseFile(Arquivo);}

    // gera MD5 do arquivo texto
  finally
    Result := MD5Print(MD5File(ArqTexto));
    md5_alt := Result;
  end;
end;

procedure GeraArqMD5;
var
  Arquivo: TextFile;
  ArqTexto, aMD5, teste: AnsiString;
  NomeArq: AnsiString;
  F: TSearchRec;
  Ret: Integer;
begin
  // Apaga arquivo anterior
  ArqTexto := Local_Arquivo(14) + 'ArqMD5.txt';
  if FileExists(ArqTexto) then
    DeleteFile(ArqTexto);
  // cria o arquivo TXT na mesma pasta do sistema
  AssignFile(Arquivo, ArqTexto);
  Rewrite(Arquivo);
  // lista todos os arquivo exe da pasta do aplicativo e gera o MD5
  Ret := FindFirst(Local_Arquivo(14) + '\*.exe', faAnyFile, F);
  try
    while Ret = 0 do
    begin
      if F.Attr and faDirectory <> faDirectory then
      begin
        NomeArq := Local_Arquivo(14) + '\' + F.Name;
        aMD5 := MD5Print(MD5File(NomeArq));
        writeln(Arquivo, F.Name + ' - ' + aMD5);
      end;
      Ret := FindNext(F);
    end;
  finally
    FindClose(F);
  end;

  Ret := FindFirst(Local_Arquivo(14) + '*.dll', faAnyFile, F);
  try
    while Ret = 0 do
    begin
      if (F.Attr and faDirectory) <> faDirectory then
      begin
        NomeArq := Local_Arquivo(14) + '\' + F.Name;
        aMD5 := MD5Print(MD5File(NomeArq));
        writeln(Arquivo, F.Name + ' - ' + aMD5);
      end;
      Ret := FindNext(F);
    end;
  finally
    FindClose(F);
  end;
  CloseFile(Arquivo);


end;


function BuscaCodigoProduto(codProduto: Integer): AnsiString;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try

    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select P.Codigo_Venda from Produto P');

      // add('left join Itens_Entrada IE on (P.Codigo = IE.Codigo_Produto)');
      add('where P.Codigo = :codProduto');
      Parameters.ParamByName('codProduto').Value := codProduto;
      open;
      Result := FieldByName('Codigo_Venda').AsAnsiString;
    end;

  finally
    FreeAndNil(qAux);
  end;
end;


function RetornaValoresCamposGerarMD5(tabela: string): AnsiString;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    if tabela = 'R01' then
    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select R.Codigo, R.codigo_empresa, R.MD5, E.Codigo, E.CNPJ, CE.Codigo_Empresa, CE.N_Fabricacao from R01 R');
        add('inner join Empresa E on (R.codigo_Empresa = E.Codigo)');
        add('inner join Configuracao_ECF CE on (E.Codigo = CE.Codigo_Empresa)');
        add('where E.Codigo = :Codempresa');
        Parameters.ParamByName('Codempresa').Value := 1;
        open;
        Result := GeraMD5([FieldByName('CNPJ').AsString,
                           FieldByName('N_Fabricacao').AsString]);
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;



procedure InserirOuAtualizarMD5(tabela: string);
var
  qAux: TADOQuery;
  MD5 : AnsiString ;
begin
  qAux := TADOQuery.Create(nil);
  MD5 := '';
  MD5 := RetornaValoresCamposGerarMD5(tabela);
  try
//    if (tabela = 'R01') and (MD5 <> '') then
//    begin
//      with qAux, SQL do
//      begin
//        close;
//        Connection := DM.ADOConnection1;
//        clear;
//        add('INSERT INTO R01 (MD5)VALUES(:MD5)');
//        Parameters.ParamByName('MD5').Value := MD5;
//        ExecSQL;
//      end;
//    end else
//    begin
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('UPDATE R01 SET MD5 = :MD5 WHERE codigo_empresa = 1');
        Parameters.ParamByName('MD5').Value := MD5;
        ExecSQL;
      end;

//    end;
  finally
    FreeAndNil(qAux);
  end;
end;


procedure AtualizaMD51(codProduto: Integer; MD5: AnsiString);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update Produto set MD5 = :MD5');
      add('where Produto.Codigo = :codProduto');
      Parameters.ParamByName('codProduto').Value := codProduto;
      Parameters.ParamByName('MD5').Value := MD5;
      ExecSQL;
    end;
  finally
    FreeAndNil(qAux);
  end;
end;


function RetornaUltimoIdProduto(): Integer;
var
  qAux: TADOQuery;
  Retorno: Integer;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select max(P.Codigo) as Codigo from Produto P');

      open;
      First;
      Retorno := FieldByName('Codigo').AsInteger;
      
      Result := Retorno;
    end;

  finally
    FreeAndNil(qAux);
  end;
end;

function BuscaCamposProdutoMD5(var codProduto: Integer): AnsiString;
var
  qAux: TADOQuery;
  Retorno: AnsiString;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select ITP.Preco_Vista,');
      add('Pro.Codigo, Pro.Tipo, Pro.Codigo_Venda, Pro.Descricao, ');
      add('RI.Aliquota as ICMS, RI.Tipo_Recolhimento, CST.Codigo_Situacao, ITI.Origem, ITI.Destino from Produto Pro');

      add('left join Itens_Tabela_Preco ITP on (ITP.Codigo_Produto = Pro.Codigo)');
      add('left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)');
      add('left join Tratamento_ICMS TI on (Pro.Codigo_Grupo_Tributacao = TI.Codigo)');
      add('left join Itens_Tratamento_ICMS ITI on (ITI.Codigo = TI.Codigo and ITI.Origem = :GO1 and ITI.Destino = :GO2)');
      add('left join Regra_ICMS RI on (ITI.Regra_Nao_Contribuinte = RI.Codigo)');
      add('left join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situacao_Tributaria = CST.Codigo)');

      add('where Pro.Status = :Status and TP.Codigo = :Codigo and Pro.Codigo = :Produto');
      Parameters.ParamByName('Status').Value := 'ATIVO';
      Parameters.ParamByName('GO1').Value := UF;
      Parameters.ParamByName('GO2').Value := UF;
      Parameters.ParamByName('Codigo').Value := codigo_tabela_preco_ativo;
      Parameters.ParamByName('Produto').Value := codProduto;
      open;
      Retorno := FieldByName('Codigo').AsAnsiString;
      Retorno := Retorno + FieldByName('Codigo_Venda').AsAnsiString;
      Retorno := Retorno + FieldByName('Descricao').AsAnsiString;
      Retorno := Retorno + FieldByName('Codigo_Situacao').AsAnsiString;
      Retorno := Retorno + FieldByName('ICMS').AsAnsiString;
      Retorno := Retorno + FieldByName('Preco_Vista').AsAnsiString;
      Result := Retorno;
    end;

  finally
    FreeAndNil(qAux);
  end;
end;

procedure InserirNaTabelaDeMD5Geral(var codProduto: Integer; MD5: AnsiString);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('if not exists(select 1 from syscolumns where Codigo_Produto = object_id('
        + QuotedStr('PAFQuantidadeRegistros') + '))');

      add('insert into PAFMD5Tabelas(Codigo_Produto, MD5) values (:Codigo_Produto, :MD5)');

      add('left join Itens_Entrada IE on (P.Codigo = IE.Codigo_Produto)');
      add('where P.Codigo = :codProduto');
      Parameters.ParamByName('codProduto').Value := codProduto;
      Parameters.ParamByName('MD5').Value := MD5;
      open;
    end;

  finally
    FreeAndNil(qAux);
  end;
end;

function PegaQtdeRegistroTabela(tabela: AnsiString): Integer;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select count(*) as Qtde from '+tabela+'');
      open;
    end;
    Result:= qAux.FieldByName('Qtde').AsInteger;
  finally
    FreeAndNil(qAux);
  end;
end;

function PegaQtdeRegistroPAFQuantidadeRegistros(campo: AnsiString): Integer;
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('select '+campo+' as Qtde from PAFQuantidadeRegistros');
      open;
    end;
    Result:= qAux.FieldByName('Qtde').AsInteger;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure AtualizarQuantidadeRegistro(tabela, campo: String);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update PAFQuantidadeRegistros set '+campo+' = (select count(*) from '+tabela+' )');
      ExecSQL;
    end;

  finally
    FreeAndNil(qAux);
  end;
end;

procedure AtualizarMD52(codProduto: Integer; MD5: AnsiString);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  try
    with qAux, SQL do
    begin
      close;
      Connection := DM.ADOConnection1;
      clear;
      add('update Produto set MD52 = :MD5');
      add(' WHERE Codigo = :codProduto');
      Parameters.ParamByName('codProduto').Value := codProduto;
      Parameters.ParamByName('MD5').Value := MD5;
      ExecSQL;
    end;

  finally
    FreeAndNil(qAux);
  end;
end;

function GeraMD5(Valores: array of AnsiString): AnsiString;
var
  Vals, MD5: AnsiString;
  idmd5: TIdHashMessageDigest5;
  i: Integer;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    Vals := '';
    for i := 0 to High(Valores) do
    begin
      Vals := Vals + Valores[i];
    end;
    // MD5:= MD5Print(MD5File(Vals));
    Result := idmd5.HashStringAsHex(Vals);
  finally
    idmd5.Free;
  end;
  { var
    Vals, MD5: AnsiString;
    i: integer;
    begin
    Vals:= '';
    for I := 0 to High(Valores) do
    begin
    Vals:= Vals+Valores[i];
    end;
    MD5:= MD5Print(MD5File(Vals));
    Result:= MD5; }
end;


procedure AtualizaMD5(Tabela, MD5, CampoCondicao, ValorCondicao: String; Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  qAux := TADOQuery.Create(nil);
  with qAux, SQL do
  begin
    close;
    Connection := Conexao;
    clear;
    Add('Update '+Tabela+' set MD5 = '+QuotedStr(MD5)+' where '+CampoCondicao+' = '+ValorCondicao);
    ExecSQL;
  end;
end;

procedure Altera_MD5_Arquivos(Valor: AnsiString);
var
  Arquivo: TStringlist;
  letra, Crip: AnsiString;
  i: Integer;
begin
  try
    Arquivo := TStringlist.Create;
    Arquivo.LoadFromFile(ExtractFilePath(application.ExeName) + 'Config.txt');
    for i := 0 to Arquivo.Count - 1 do
    begin
      letra := copy((Arquivo[i]), 1, 6);
      if letra = 'MD5 - ' then
      begin
        Arquivo[i] := 'MD5 - ' + (Criptografa(Valor, 15));
        Arquivo.SaveToFile(ExtractFilePath(application.ExeName) + 'Config.txt');
      end;
    end;
  finally
    FreeAndNil(Arquivo);
  end;
end;

function Criptografa(Texto: string; chave: Byte): String;
var
  Buffer: array of Byte;
  i: Integer;
  resultado: String;
begin
  resultado := '';
  SetLength(Buffer, Length(Texto));
  for i := 1 to Length(Texto) do
  begin
    Buffer[i - 1] := ord(Texto[i]);
    Buffer[i - 1] := Buffer[i - 1] xor chave;
    resultado := resultado + chr(Buffer[i - 1]);
  end;
  Result := resultado;
end;

procedure GeraArquivoNPAFECF;
var
  Arquivo: TextFile;
  MD5Arq, NomeArquivo, Linha, cDes, InscEDes, InscMDes, Vers: string;
  F: TextFile;
  letra: String;
  i, qtdeArquivos: Integer;
begin
  Busca_Dados_SoftwareHouse;
  cDes:= StringReplace(cnpj_des, '.', '', [rfReplaceAll]);
  cDes:= StringReplace(cDes, '\', '', [rfReplaceAll]);
  cDes:= StringReplace(cDes, '/', '', [rfReplaceAll]);
  cDes:= StringReplace(cDes, '-', '', [rfReplaceAll]);
  InscEDes:= StringReplace(insc_est_des, '-', '', [rfReplaceAll]);
  InscEDes:= StringReplace(InscEDes, '.', '', [rfReplaceAll]);
  InscMDes:= StringReplace(insc_mun_des, '-', '', [rfReplaceAll]);
  InscMDes:= StringReplace(InscMDes, '.', '', [rfReplaceAll]);
  Vers:= StringReplace(versao_paf, '.', '', [rfReplaceAll]);

  //N1
  with dm.ACBrPAF1.PAF_N.RegistroN1 do
  begin
    CNPJ:= cDes;
    IE:= InscEDes;
    IM:= InscMDes;
    RAZAOSOCIAL:= deno_des;
  end;

  //N2
  with dm.ACBrPAF1.PAF_N.RegistroN2 do
  begin
    LAUDO:= n_laudo;
    NOME:= nome_paf;
    VERSAO:= Vers;
  end;

  //N3
  NomeArquivo:= '';
  letra:= '';
  Linha:= '';
  qtdeArquivos:= 0;
  AssignFile(Arquivo, ExtractFilePath(application.ExeName) + 'ArqMD5.txt');
  Reset(Arquivo);
  try
    while not (Eof(Arquivo)) do
    begin
      Readln(Arquivo, Linha);
      for i := 1 to Length(Linha) do
      begin
        letra := copy(Linha, i, 1);
        if (letra <> '-') then
        begin
          NomeArquivo := NomeArquivo + letra;
        end
        else
        begin
          with DM.ACBrPAF1.PAF_N.RegistroN3.New do
          begin
            MD5Arq:= copy(Linha, i+2, 32);
            MD5Arq:= Trim(MD5Arq);
            NomeArquivo:= Trim(NomeArquivo);
            NOME_ARQUIVO:= NomeArquivo;
            MD5:= MD5Arq;
            NomeArquivo:= '';
            MD5Arq:= '';
            Break;
          end;
        end;
      end;
    end;
  finally
    CloseFile(Arquivo);
  end;

  //N9
  {with dm.ACBrPAF1.PAF_N.RegistroN9 do
  begin
    TOT_REG:= qtdeArquivos;
    //:= insc_est_des;
    //IM:= insc_mun_des;
    //RAZAOSOCIAL:= deno_des;
  end;}

  dm.ACBrPAF1.SaveToFile_N(ExtractFilePath(Application.ExeName)+'\PAF_N.TXT');
end;

function Primeiro_Dia(Data: TDateTime): TDateTime;
var
  dia, mes, ano, Hora, Min, Seg, Mseg: Word;
begin
  DecodeDate(Data, ano, mes, dia);
  Result := EncodeDate(ano, mes, 01);
end;

function UltimoDia(fData: TDateTime): TDateTime;
var
  dia, mes, ano, Hora, Min, Seg, Mseg: Word;
  Bis: boolean;
begin
  Bis := AnoBis(fData);
  DecodeDateTime(fData, ano, mes, dia, Hora, Min, Seg, Mseg);
  case mes of
    01:
      dia := 31;
    02:
      begin
        if Bis then
          dia := 29
        else
          dia := 28;
      end;
    03:
      dia := 31;
    04:
      dia := 30;
    05:
      dia := 31;
    06:
      dia := 30;
    07:
      dia := 31;
    08:
      dia := 31;
    09:
      dia := 30;
    10:
      dia := 31;
    11:
      dia := 30;
    12:
      dia := 31;
  end;
  Result := EncodeDateTime(ano, mes, dia, Hora, Min, Seg, Mseg);
end;

function AnoBis(Data: TDateTime): boolean;
var
  dia, mes, ano: Word;
begin
  DecodeDate(Data, ano, mes, dia);
  if ano mod 4 <> 0 then
    AnoBis := false
  else if ano mod 100 <> 0 then
    AnoBis := true
  else if ano mod 400 <> 0 then
    AnoBis := false
  else
    AnoBis := true;

end;

{ procedure Dados_Principais_ECF;
  var
  iConta: Integer;
  begin
  for iConta := 1 to 20 do
  nu_serie := nu_serie + ' ';
  for iConta := 1 to 20 do
  nu_serie_inteiro := nu_serie_inteiro + ' ';
  for iConta := 1 to 15 do
  Marca := Marca + ' ';
  for iConta := 1 to 20 do
  Modelo := Modelo + ' ';
  for iConta := 1 to 7 do
  Tipo := Tipo + ' ';
  for iConta := 1 to 4 do
  n_usuario := n_usuario + ' ';
  mf := ' ';

  iRetorno := Bematech_FI_NumeroSerieMFD(nu_serie);
  Analisa_iRetorno;

  iRetorno := Bematech_FI_NumeroSerieMFD(nu_serie_inteiro);
  Analisa_iRetorno;

  iRetorno := Bematech_FI_MarcaModeloTipoImpressoraMFD(Marca, Modelo, Tipo);
  Analisa_iRetorno;
  iRetorno := Bematech_FI_NumeroSubstituicoesProprietario(n_usuario);
  if (iRetorno = 1) then
  n_usuario := copy(n_usuario, 3, 2);
  Analisa_iRetorno;
  end; }

{ procedure Data_Hora_GravacaoSWBasicoMFAdicional;
  begin
  SetLength(data_usu, 20);
  SetLength(data_gra, 20);
  mf := ' ';
  iRetorno := Bematech_FI_DataHoraGravacaoUsuarioSWBasicoMFAdicional(data_usu,
  data_gra, mf);
  end; }

{ procedure Versao_Impressora;
  var
  iConta: Integer;
  begin
  for iConta := 1 to 4 do
  versao_sb := versao_sb + ' ';
  iRetorno := Bematech_FI_VersaoFirmware(versao_sb);
  Analisa_iRetorno;
  end; }

procedure Centraliza_Form(Form: TForm);
begin
  Form.Left := (GetSystemMetrics(SM_CXSCREEN) - Form.Width) div 2;
  Form.Top := (FrmMenu_Geral.Height - Form.Height - FrmMenu_Geral.Ribbon1.Height
    - FrmMenu_Geral.StbStatus.Height) div 2;
  Form.Refresh;
  // Result:= ((Tamanho-Length(texto)) div 2);
end;

procedure Centraliza_Form_Full_Screen(Form: TForm);
begin
  Form.Left := 0;
  Form.Top := 0;

  Form.Width := Screen.Width - 10;
  Form.Height := Screen.Height - FrmMenu_Geral.Ribbon1.Height -
    FrmMenu_Geral.StbStatus.Height - 38;

  Form.Refresh;
end;

function Dias_Uteis(DataI, DataF: TDateTime): Integer;
var
  contador: Integer;
begin
  if DataI > DataF then
  begin
    Result := 0;
    exit
  end;
  contador := 0;
  while (DataI <= DataF) do
  begin
    if ((DayOfWeek(DataI) <> 1) and (DayOfWeek(DataI) <> 7)) then
      Inc(contador);
    DataI := DataI + 1
  end;
  Result := contador;
end;

function Cupom_Nominal: Integer;
var
  id: Integer;
begin
  id := application.MessageBox('Cupom fiscal nominal?', 'Escolha uma opção',
    MB_YESNOCANCEL + MB_ICONQUESTION);
  Cupom := id;
end;

procedure Arquivo_Gerado(Caminho: string);
begin
  application.MessageBox(Pchar('Arquivo gerado com sucesso, no caminho:' + #13 +
    #13 + Caminho), 'Arquivo Gerado', MB_OK + MB_ICONQUESTION);
end;

procedure Espelho_MFD;
begin
  application.MessageBox(Pchar('Espelho gerado com sucesso, no caminho:' + #13 +
    #13 + FrmMemoria_Fita_Detalhe.cArquivoOrigem), 'Arquivo Gerado',
    MB_OK + MB_ICONQUESTION);
end;

procedure Arquivo_MFD;
begin
  application.MessageBox(Pchar('Arquivo gerado com sucesso, no caminho:' + #13 +
    #13 + Local_Arquivo(14)), 'Arquivo Gerado', MB_OK + MB_ICONQUESTION);
end;

procedure Pedido_Gerado;
begin
  application.MessageBox('Pedido gerado com sucesso', 'Pedido Gerado',
    MB_OK + MB_ICONQUESTION);
end;

procedure Nao_Fecha_Cupom;
begin
  application.MessageBox('Totalize a compra para fechar o cupom', 'Atenção',
    MB_OK + MB_ICONHAND);
end;

procedure Mensagem_Codigo_Barra;
begin
  application.MessageBox
    ('Execute este procedimento pelo leitor de código de barras.', 'Erro',
    MB_OK + MB_ICONHAND);
end;

procedure Nao_Selecionado;
begin
  application.MessageBox('Item não encontrado. Por favor, verifique', 'Erro',
    MB_OK + MB_ICONHAND);
end;

procedure Item_Nao_Selecionado;
begin
  application.MessageBox
    ('Por favor, selecione pelo menos um item para continuar.',
    'Impossível Continuar', MB_ICONHAND + MB_OK);
end;

procedure Nao_Ha_Registro;
begin
  application.MessageBox('Não há registros para serem manipulados',
    'Impossível Continuar', MB_ICONHAND + MB_OK);
end;

procedure Multiplos_Cartoes;
begin
  application.MessageBox('Não é permitido pagamento com múltiplos cartões',
    'Impossível Continuar', MB_ICONHAND + MB_OK);
end;

procedure Mensagem_Nao_E_PP;
begin
  application.MessageBox
    ('Produto não encontrado. Verifique se foi cadastrado a receita deste produto ou se o mesmo é de Produção Própria.',
    'Produto não encontrado', MB_OK + MB_ICONHAND);
end;

procedure Cancele;
begin
  application.MessageBox
    ('Há uma operação em andamento. Por favor, Salve ou Cancele a operação para fechar a janela',
    'Impossível Fechar', MB_ICONHAND + MB_OK);
end;

procedure Salve;
begin
  application.MessageBox
    ('Há uma operação em andamento. Por favor, Salve a operação para fechar a janela',
    'Impossível Fechar', MB_ICONHAND + MB_OK);
end;

procedure Erro_Processo;
begin
  application.MessageBox('Erro ao tentar executar esse processo', 'Erro',
    MB_OK + MB_ICONHAND);
end;

procedure DAV_Cancelado;
begin
  application.MessageBox('DAV Cancelado', 'DAV Cancelado',
    MB_OK + MB_ICONQUESTION);
end;

procedure Processo_Concluido;
begin
  application.MessageBox('Processo concluído com exito', 'Relatório enviado',
    MB_OK + MB_ICONQUESTION);
end;

procedure Pre_Venda_Gerada;
begin
  application.MessageBox(Pchar('Pré-Venda gerada com sucesso' + #13 +
    'O número da Pré-Venda gerada é: ' + pre_venda), 'Relatório enviado',
    MB_OK + MB_ICONQUESTION);
end;

procedure Erro_Comunicacao_Servidor;
begin
  application.MessageBox
    ('Não foi possível a comunicação com o servidor. Verifique o IP do servidor.',
    'Erro de comunicação', MB_OK + MB_ICONHAND);
end;

procedure Erro_Comunicacao_Servidor_2;
begin
  application.MessageBox
    ('Não foi possível a comunicação com o servidor. Verifique o nome da instância do SQL Server.',
    'Erro de comunicação', MB_OK + MB_ICONHAND);
end;

procedure Erro_Comunicacao_Servidor_Local;
begin
  application.MessageBox('Não foi possível a comunicação com o servidor local',
    'Erro de comunicação', MB_OK + MB_ICONHAND);
end;

procedure Mensagem_Fim_Pesquisa;
begin
  application.MessageBox('Dados não encontrados', 'Fim da Pesquisa',
    MB_OK + MB_ICONEXCLAMATION);
end;

procedure Mensagem_Item_Inserido;
begin
  application.MessageBox('Item inserido com sucesso', 'Item Inserido',
    MB_OK + MB_ICONQUESTION);
end;

procedure Valor_Invalido;
begin
  application.MessageBox('Valor inválido. Por favor, verifique.',
    'Valor inválido', MB_OK + MB_ICONHAND);
end;

procedure Mensagem_Faca_Reducao;
begin
  application.MessageBox
    ('Por favor, faça a redução Z. Menu Caixa > Acerto de Caixa.',
    'Redução Z Pendente', MB_OK + MB_ICONHAND);
end;

procedure Produto_Ja_Lancamento_Venda;
begin
  application.MessageBox('Produto já lançado nessa venda',
    'Escolha outro produto', MB_OK + MB_ICONHAND);
end;

procedure Mensagem_Operacao_Nao_Permitida;
begin
  application.MessageBox('Operação não permitida no momento. Verifique',
    'Atenção', MB_OK + MB_ICONHAND);
end;

procedure Mensagem_Cliente_Bloqueado;
begin
  application.MessageBox
    ('Cliente Bloqueado. Para continuar, verifique o financeiro.', 'Atenção',
    MB_OK + MB_ICONHAND);
end;

procedure Mensagem_Impossivel_Abrir_Form;
begin
  application.MessageBox
    ('Não é permitido abrir essa janela com a janela de PDV aberta',
    'Não pode abrir', MB_OK + MB_ICONHAND);
end;

procedure Impressora_Desligada;
begin
  application.MessageBox('Por favor, ligue a impressora',
    'Impressora desligada', MB_OK + MB_ICONHAND);
end;

procedure Mensagem_Falta_Dados;
begin
  application.MessageBox('Há dados incorretos que não foram preenchidos',
    'Erro', MB_OK + MB_ICONHAND);
end;

procedure Mensagem_Tributacao_Incorreta;
begin
  application.MessageBox('Tributação informada incorretamente', 'Erro',
    MB_OK + MB_ICONHAND);
end;

procedure Mensagem_Erro_Rede;
begin
  application.MessageBox
    ('Foi detectado que o computador está fora da rede. Os dados da venda e o estoque será atualizado na próxima venda E se a rede já estiver funcionando',
    'Erro na rede', MB_OK + MB_ICONHAND);
end;

procedure Mensagem_Cupom_Cancelado;
begin
  application.MessageBox
    ('Comande o fechamento do cupom em andamento. Seu cancelamento será efetuado posteriormente e automaticamente após o término do fechamento.',
    'Cupom Cancelado', MB_OK + MB_ICONHAND);
end;

procedure Mensagem_Ja_Cupom_Cancelado;
begin
  application.MessageBox
    ('Cupom fiscal já cancelado. É permitido cancelar apenas o último cupom emitido.',
    'Cupom Cancelado', MB_OK + MB_ICONHAND);
end;

function Confirma_Cancelar_Item_Generico: boolean;
begin
  if application.MessageBox('Deseja realmente cancelar o item informado?',
    'Atenção', MB_YESNO + MB_ICONQUESTION) = idyes then
    Result := true
  else
    Result := false;
end;

procedure Mensagem_Erro_Entrada(Texto: AnsiString);
begin
  application.MessageBox(PWideChar('O ' + QuotedStr(Texto) +
    '. O sistema parou de funcionar temporariamente. Entre em contato com o administrador, pelo telefone '
    + QuotedStr(telefone_contato_fav)), 'FAV Sistemas', MB_OK + MB_ICONHAND);
end;

procedure Item_Selecionado_DBGrid;
begin

end;

procedure Mensagem_Ja_Houve_Reducao;
begin
  application.MessageBox
    (Pchar('Movimento fechado. As funções do aplicativo foram desabilitadas.' +
    #13 + 'Caso queira abrir movimento do dia atual, vá até o menu Caixa > Abertura de Caixa.'),
    'Movimento Fechado', MB_OK + MB_ICONEXCLAMATION);
end;

procedure Mensagem_Venda_Produto_Peso;
begin
  application.MessageBox('Campo acessível somente em produto vendido a peso',
    'Campo inacessível', MB_OK + MB_ICONHAND);
end;

function Confirma_Processo: boolean;
begin
  if (application.MessageBox
    ('Confirma o procedimento com os registros selecionados?', 'Confirmação',
    MB_YESNO + MB_ICONQUESTION)) = idyes then
    Result := true
  else
    Result := false;
end;

procedure Impossivel_Excluir_Registro;
begin
  application.MessageBox('Operação não completada. ', 'Impossível Operação',
    MB_OK + MB_ICONHAND);
end;

procedure Mensagem_Erro_Com_Except(Mensagem: String);
begin
  application.MessageBox(PWideChar('Operação não completada: ' + Mensagem),
    'Erro ao executar operação', MB_OK + MB_ICONHAND);
end;

procedure Operacao_Nao_Completada(ErroEspecifico: String);
begin
  application.MessageBox(PWideChar('Operação não completada. ' +
    ErroEspecifico), 'Erro encontrado', MB_OK + MB_ICONHAND);
end;

procedure Mensagem_Venda_Andamento;
begin
  application.MessageBox('Já existe uma venda em andamento',
    'Impossível Operação', MB_OK + MB_ICONHAND);
end;

procedure Mensagem_Erro;
begin
  application.MessageBox('Acesso negado', 'Acesso negado', MB_OK + MB_ICONHAND);
end;

procedure Acesso_Nao_Permitido;
begin
  application.MessageBox('Acesso não permitido para esse tipo de configuração',
    'Acesso negado', MB_OK + MB_ICONHAND);
end;

function Impressora_Nao_Responde_TEF: boolean;
begin
  Foco_Aplicacao;
  if MessageDlg('IMPRESSORA NÃO RESPONDE. TENTAR NOVAMENTE?', mtConfirmation,
    [mbyes, mbno], 0) = mrYes then
    Result := true
  else
    Result := false;
end;

procedure Gerenciador_Padrao;
begin
  Foco_Aplicacao;
  ShowMessage('O Gerenciador Padrão não está ativo');
  // Será ativado automaticamente');
  // shellexecute(0, 'open', (PWideChar('C:\tef_dial\tef_dial.exe')), '', nil,SW_HIDE);
  // Sleep(1000);
end;

function Confirma_Exclusao: boolean;
begin
  if application.MessageBox('Deseja realmente excluir o registro selecionado?',
    'Atenção', MB_YESNO + MB_ICONQUESTION) = idyes then
    Result := true
  else
    Result := false;
end;

function Confirma_Devolucao: boolean;
begin
  if application.MessageBox
    ('Deseja realmente voltar o Pedido selecionado para o vendedor?', 'Atenção',
    MB_YESNO + MB_ICONQUESTION) = idyes then
    Result := true
  else
    Result := false;
end;

function Confirma_Cancalamento_Cupom: boolean;
begin
  if application.MessageBox('Deseja realmente cancelar a última venda?',
    'Atenção', MB_YESNO + MB_ICONQUESTION) = idyes then
    Result := true
  else
    Result := false;
end;

procedure Mensagem_Produto_Inserido;
begin
  application.MessageBox('Produto inserido com sucesso', 'Produto Inserido',
    MB_OK + MB_ICONQUESTION);
end;

function Confirma_Pre_Venda: boolean;
begin
  if application.MessageBox('Confirma a conversão deste DAV em Pré-Venda?',
    'Atenção', MB_YESNO + MB_ICONQUESTION) = idyes then
    Result := true
  else
    Result := false;
end;

function Confirma_Delete: boolean;
begin
  if application.MessageBox('Deseja realmente excluir o ítem selecionado?',
    'Atenção', MB_YESNO + MB_ICONQUESTION) = idyes then
    Result := true
  else
    Result := false;
end;

function Cancela_DAV: boolean;
begin
  if application.MessageBox('Deseja realmente cancelar o DAV selecionado?',
    'Atenção', MB_YESNO + MB_ICONQUESTION) = idyes then
    Result := true
  else
    Result := false;
end;

procedure Registro_Nao_Selecionado;
begin
  application.MessageBox
    ('Por favor, selecione pelo menos um item para cancelar',
    'Impossível cancelar', MB_OK + MB_ICONHAND);
end;

function Caixa_Operacao(Msg: Integer): string;
begin
  if Msg = 0 then
  begin
    Caixa_Operacao := 'CAIXA LIVRE';
    FrmPDV.LblStatus.Font.Color := clWhite;
    // FrmPDV.LblUsuario.Font.Color := clGreen;
    // FrmPDV.LblData.Font.Color := clGreen;
  end
  else if Msg = 1 then
  begin
    Caixa_Operacao := 'EM OPERAÇÃO';
    FrmPDV.LblStatus.Font.Color := clRed;
    // FrmPDV.LblUsuario.Font.Color := clRed;
    // FrmPDV.LblData.Font.Color := clRed;
  end;
end;

procedure Item_Ja_Cancelado;
begin
  application.MessageBox('Ítem já cancelado. Por favor, escolha outro ítem.',
    'Impossível cancelar', MB_OK + MB_ICONHAND);
end;

procedure Erro_Atualizar_Itens_Venda;
begin
  application.MessageBox('Erro ao atualizar o ítem da venda',
    'Impossível atualizar', MB_OK + MB_ICONHAND);
end;

procedure Mensagem_Troco_TEF;
begin
  application.MessageBox('Não é permitido troco com venda TEF', 'Erro',
    MB_OK + MB_ICONHAND);
end;

procedure Mensagem_NCN_TEF;
begin
  if (pNSU = '') and (pValor = '') then
  begin
    MessageDlg('Cancelada a Transação' + #13 + #13 + 'Rede:   ' + pNomeRede,
      mtWarning, [mbOK], 0)
  end
  else if (pNSU <> '') and (pValor <> '') then
  begin
    MessageDlg('Cancelada a Transação' + #13 + #13 + 'Rede:   ' + pNomeRede +
      #13 + 'NSU:    ' + pNSU + #13 + 'Valor:  ' + FormatFloat('#0.0,0',
      StrToFloat(pValor) / 100), mtWarning, [mbOK], 0);
  end
  else if (pNSU <> '') and (pValor = '') then
  begin
    MessageDlg('Cancelada a Transação' + #13 + #13 + 'Rede:   ' + pNomeRede +
      #13 + 'NSU:    ' + pNSU, mtWarning, [mbOK], 0);
  end
  else if (pNSU = '') and (pValor <> '') then
  begin
    MessageDlg('Cancelada a Transação' + #13 + #13 + 'Rede:   ' + pNomeRede +
      #13 + 'Valor:  ' + FormatFloat('#0.0,0', StrToFloat(pValor) / 100),
      mtWarning, [mbOK], 0);
  end;
end;

procedure Mensagem_Cotacao_Existente;
begin
  application.MessageBox
    ('A cotação selecionada já se encontra lançada para esse fornecedor',
    'Cotação já realizada', MB_OK + MB_ICONHAND);
end;

procedure Mensagem_Produto_Nao_Encontrado;
begin
  application.MessageBox
    ('Produto não encontrado OU não cadastrado OU não configurado seu Codigo de Venda',
    'Produto não encontrado', MB_OK + MB_ICONHAND);
end;

function Local_Arquivo(Local: Integer): string;
var
  L: AnsiString;
begin
  case Local of
    0:
      Local_Arquivo := (ExtractFilePath(application.ExeName) + '\Fiscal');
    1:
      Local_Arquivo := (ExtractFilePath(application.ExeName) +
        '\XML\Venda.xml');
    2:
      Local_Arquivo := (ExtractFilePath(application.ExeName) +
        '\XML\Itens_Venda.xml');
    3:
      Local_Arquivo := (ExtractFilePath(application.ExeName) +
        '\XML\Itens_Venda_Ultimo.xml');
    4:
      Local_Arquivo := (ExtractFilePath(application.ExeName) +
        '\XML\Fechamento_Venda.xml');
    5:
      Local_Arquivo := (ExtractFilePath(application.ExeName) +
        '\XML\Produto.xml');
    6:
      Local_Arquivo := (ExtractFilePath(application.ExeName) + '\XML\R04.xml');
    7:
      Local_Arquivo := (ExtractFilePath(application.ExeName) + '\XML\R07.xml');
    8:
      Local_Arquivo := (ExtractFilePath(application.ExeName) + '\XML\R05.xml');
    9:
      Local_Arquivo := (ExtractFilePath(application.ExeName) +
        '\XML\Cliente.xml');
    10:
      Local_Arquivo := (ExtractFilePath(application.ExeName) +
        '\XML\Pedido.xml');
    11:
      Local_Arquivo := (ExtractFilePath(application.ExeName) +
        '\XML\Itens_Pedido.xml');
    12:
      Local_Arquivo := (ExtractFilePath(application.ExeName) +
        '\XML\Condicao_Pagamento.xml');
    13:
      Local_Arquivo := (ExtractFilePath(application.ExeName) + '\XML\R06.xml');
    14:
      Local_Arquivo := (ExtractFilePath(application.ExeName));
    15:
      Local_Arquivo := (ExtractFilePath(application.ExeName) +
        '\XML\Itens_OS.xml');
    16:
      Local_Arquivo := (ExtractFilePath(application.ExeName) +
        '\XML\Veiculo.xml');
    17:
      Local_Arquivo := (ExtractFilePath(application.ExeName) +
        '\XML\Servico.xml');
    18:
      Local_Arquivo := (ExtractFilePath(application.ExeName) +
        '\XML\Controla_Codigo.xml');
    19:
      Local_Arquivo := (ExtractFilePath(application.ExeName) +
        '\XML\Fechamento_Venda_Ultimo.xml');
    20:
      Local_Arquivo := (ExtractFilePath(application.ExeName) + '\XML\ICMS.xml');
    21:
      Local_Arquivo := (ExtractFilePath(application.ExeName) + '\XML\ISS.xml');
    22:
      Local_Arquivo := (ExtractFilePath(application.ExeName) + '\XML\IPI.xml');
    23:
      Local_Arquivo := (ExtractFilePath(application.ExeName) + '\XML\PIS.xml');
    24:
      Local_Arquivo := (ExtractFilePath(application.ExeName) +
        '\XML\COFINS.xml');
  end;
end;

function Verifica_Reducao: boolean;
var
  iConta: Integer;
begin
  Result := false;
  DataMovimento := '';
  for iConta := 1 to 6 do
    DataMovimento := DataMovimento + ' ';
  iRetorno := Bematech_FI_DataMovimento(DataMovimento);
  if (DataMovimento = '000000') then
  begin
    Result := true;
    Habilitado := false;
    FrmMenu_Geral.acLancamento_Manual.Visible := true;
    DataF := '00/00/0000';
  end
  else
  begin
    Habilitado := true;
    FrmMenu_Geral.acLancamento_Manual.Visible := false;
  end;
  DataF := DateToStr(date);
  { data1:= copy(DataMovimento, 1,2);
    data2:= copy(DataMovimento, 3,2);
    data3:= copy(DataMovimento, 5,2);
    datafor:= data1 + '/' + data2 + '/' + data3;
    dataf:= FormatDateTime('DD/MM/YYYY', StrToDate(datafor)); }
end;

Procedure Retorno_Impressora;
Var
  iACK, iST1, iST2, iST3: Integer;
Begin
  iACK := 0;
  iST1 := 0;
  iST2 := 0;
  iST3 := 0;
  try
    iRetorno := Bematech_FI_RetornoImpressoraMFD(iACK, iST1, iST2, iST3);

    If iACK = 21 Then
    BEGIN
      application.MessageBox
        ('A Impressora retornou NAK. O programa será abortado!', 'Erro',
        MB_ICONERROR + MB_OK);
      application.Terminate;
      exit;
    End
    else If (iACK = 6) then
    BEGIN

      // Verifica ST1
      IF iST1 >= 128 Then
      BEGIN
        iST1 := iST1 - 128;
        ShowMessage('Fim de Papel');
      END;
      IF iST1 >= 64 Then
      BEGIN
        iST1 := iST1 - 64;
        ShowMessage('Pouco Papel');
      END;
      IF iST1 >= 32 Then
      BEGIN
        iST1 := iST1 - 32;
        ShowMessage('Erro no Relógio');
      END;
      IF iST1 >= 16 Then
      BEGIN
        iST1 := iST1 - 16;
        ShowMessage('Impressora em ERRO');
      END;
      IF iST1 >= 8 Then
      BEGIN
        iST1 := iST1 - 8;
        ShowMessage('CMD não iniciado com ESC');
      END;
      IF iST1 >= 4 Then
      BEGIN
        iST1 := iST1 - 4;
        ShowMessage('Comando Inexistente');
      END;
      IF iST1 >= 2 Then
      BEGIN
        iST1 := iST1 - 2;
        ShowMessage('Cupom Aberto');
      END;
      IF iST1 >= 1 Then
      BEGIN
        iST1 := iST1 - 1;
        ShowMessage('Nº de Parâmetros Inválidos');
      END;

      // Verifica ST2
      IF iST2 >= 128 Then
      BEGIN
        iST2 := iST2 - 128;
        ShowMessage('Tipo de Parâmetro Inválido');
      END;
      IF iST2 >= 64 Then
      BEGIN
        iST2 := iST2 - 64;
        ShowMessage('Memória Fiscal Lotada');
      END;
      IF iST2 >= 32 Then
      BEGIN
        iST2 := iST2 - 32;
        ShowMessage('CMOS não Volátil');
      END;
      IF iST2 >= 16 Then
      BEGIN
        iST2 := iST2 - 16;
        ShowMessage('Alíquota Não Programada');
      END;
      IF iST2 >= 8 Then
      BEGIN
        iST2 := iST2 - 8;
        ShowMessage('Alíquotas lotadas');
      END;
      IF iST2 >= 4 Then
      BEGIN
        iST2 := iST2 - 4;
        ShowMessage('Cancelamento não Permitido');
      END;
      IF iST2 >= 2 Then
      BEGIN
        iST2 := iST2 - 2;
        ShowMessage('CGC/IE não Programados');
      END;
      IF iST2 >= 1 Then
      BEGIN
        iST2 := iST2 - 1;
        ShowMessage('Comando não Executado');
      END;
    END;
  except
    on E: Exception do
    begin
      ShowMessage('Error ' + E.Message +
        ' Unidade: UFiscal  Rotina: TBematech.RetornoImpressora entre em contato com o suporte');
    end;
  end
End;

Procedure Analisa_iRetorno();
Begin
  if iRetorno = 0 then
  begin
    application.MessageBox('Erro de Comunicação !', 'Erro',
      MB_ICONERROR + MB_OK);
    abort;
  end;

  If iRetorno = -1 Then
    application.MessageBox('Erro de Execução na Função. Verifique!', 'Erro',
      MB_ICONERROR + MB_OK);

  if iRetorno = -2 then
    application.MessageBox('Parâmetro Inválido !', 'Erro',
      MB_ICONERROR + MB_OK);

  if iRetorno = -3 then
    application.MessageBox('Alíquota não programada !', 'Atenção',
      MB_IconInformation + MB_OK);

  If iRetorno = -4 Then
    application.MessageBox('Arquivo BemaFI32.INI não encontrado. Verifique!',
      'Atenção', MB_IconInformation + MB_OK);

  If iRetorno = -5 Then
    application.MessageBox('Erro ao Abrir a Porta de Comunicação', 'Erro',
      MB_ICONERROR + MB_OK);

  If iRetorno = -6 Then
    application.MessageBox('Impressora Desligada ou Desconectada', 'Atenção',
      MB_IconInformation + MB_OK);

  If iRetorno = -7 Then
    application.MessageBox('Banco Não Cadastrado no Arquivo BemaFI32.ini',
      'Atenção', MB_IconInformation + MB_OK);

  If iRetorno = -8 Then
    application.MessageBox
      ('Erro ao Criar ou Gravar no Arquivo Retorno.txt ou Status.txt', 'Erro',
      MB_ICONERROR + MB_OK);

  if iRetorno = -18 then
    application.MessageBox('Não foi possível abrir arquivo INTPOS.001 !',
      'Atenção', MB_IconInformation + MB_OK);

  if iRetorno = -19 then
    application.MessageBox('Parâmetro diferentes !', 'Atenção',
      MB_IconInformation + MB_OK);

  if iRetorno = -20 then
    application.MessageBox('Transação cancelada pelo Operador !', 'Atenção',
      MB_IconInformation + MB_OK);

  if iRetorno = -21 then
    application.MessageBox('A Transação não foi aprovada !', 'Atenção',
      MB_IconInformation + MB_OK);

  if iRetorno = -22 then
    application.MessageBox('Não foi possível terminal a Impressão !', 'Atenção',
      MB_IconInformation + MB_OK);

  if iRetorno = -23 then
    application.MessageBox('Não foi possível terminal a Operação !', 'Atenção',
      MB_IconInformation + MB_OK);

  if iRetorno = -24 then
    application.MessageBox('Forma de pagamento não programada.', 'Atenção',
      MB_IconInformation + MB_OK);

  if iRetorno = -25 then
    application.MessageBox('Totalizador não fiscal não programado.', 'Atenção',
      MB_IconInformation + MB_OK);

  if iRetorno = -26 then
    application.MessageBox('Transação já Efetuada !', 'Atenção',
      MB_IconInformation + MB_OK);

  if iRetorno = -28 then
    application.MessageBox('Não há Informações para serem Impressas !',
      'Atenção', MB_IconInformation + MB_OK);
End;

// verifica se o gerenciador padrão está ativo
function VerificaGerenciadorPadrao: boolean;
var
  cConteudoArquivo: string;
  // cArquivo : TextFile;
begin
  // if not (DirectoryExists(PathRespPay)) then
  // begin
  Result := true;
  pIdentifica := '';
  pIdentifica := FormatDateTime('hhmmss', Time);
  cConteudoArquivo := '000-000 = ATV' + #13 + #10 + '001-000 = ' + pIdentifica +
    #13 + #10 + '999-999 = 0';
  AssignFile(cArquivo, PathReq + 'IntPos.tmp');
  Rewrite(cArquivo);
  writeln(cArquivo, cConteudoArquivo);
  CloseFile(cArquivo);
  RenameFile(PathReq + 'IntPos.tmp', PathReq + 'IntPos.001');
  Sleep(1000); // estava 3 segundos
  //
  if not VerificaArquivoSTS then
    Result := false;
  { end
    else
    begin
    result := true;
    pIdentifica:= '';
    pIdentifica := FormatDateTime('hhmmss',Time);
    cConteudoArquivo := '000-000 = ATV' + #13 + #10 +
    '001-000 = ' + pIdentifica + #13 + #10 +
    '999-999 = 0';
    AssignFile( cArquivo, PathReqPay+'IntPos.tmp');
    ReWrite( cArquivo );
    WriteLn( cArquivo, cConteudoArquivo );
    CloseFile( cArquivo );
    RenameFile(PathReqPay+'IntPos.tmp',PathReqPay+'IntPos.001');
    Sleep(3000);
    //
    if not VerificaArquivoSTS then
    result := False;
    end; }

end;

// apaga arquivos que é utilizado na trazação tef
procedure ApagaArquivosTEF;
begin
  // if not (DirectoryExists(PathRespPay)) then
  // begin

  if (FileExists(PathResp + 'INTPOS.STS')) then
  begin
    DeleteFile(PathResp + 'INTPOS.STS');
    TLog.Debug('Apagou arquivos TEF: ' + PathResp + 'INTPOS.STS');
  end;

  if (FileExists(PathResp + 'INTPOS.001')) then
  begin
    DeleteFile(PathResp + 'INTPOS.001');
    TLog.Debug('Apagou arquivos TEF: ' + PathResp + 'INTPOS.001');
  end;

  if (FileExists(PathReq + 'INTPOS.001')) then
  begin
    DeleteFile(PathReq + 'INTPOS.001');
    TLog.Debug('Apagou arquivos TEF: ' + PathReq + 'INTPOS.001');
  end;
  { end
    else
    begin
    if (FileExists(PathRespPay+'INTPOS.STS')) then
    DeleteFile(PathRespPay+'INTPOS.STS');
    if (FileExists(PathRespPay+'INTPOS.001')) then
    DeleteFile(PathRespPay+'INTPOS.001');
    if (FileExists(PathReqPay+'INTPOS.001')) then
    DeleteFile(PathReqPay+'INTPOS.001');
    end; }
end;

// imprime a trasação do tef

function ImprimeTransacaoTEF(pTipoRel, pVias: Integer; pValor, pCOO: AnsiString;
  IndiceImp: AnsiString): boolean;
var
  cLinhaArquivo, aTextoLinha, aux: String;
  // cArquivo  : TextFile;
  i, via: Integer;
  TextoImprimir: TStringList;
begin
  // pTipoRel = 0 - Comprovante de Credito
  // 1 - Relatorio Gerencial
  try
    TextoImprimir:= TStringList.Create;
    Result := true;

    TLog.Debug('Entrou no método ImprimeTransacaoTEF');
    TLogger.GetInstance.Debug('Índice da forma de pagamento: ' + IndiceImp +
      '. ' + DateTimeToStr(now));
    TLogger.GetInstance.Debug('COO do cupom: ' + pCOO + '. ' +
      DateTimeToStr(now));
    TLogger.GetInstance.Debug('Valor do cupom: ' + pValor + '. ' +
      DateTimeToStr(now));
    TLogger.GetInstance.Debug('Variável Aberto: ' + IntToStr(Aberto) + '. ' +
      DateTimeToStr(now));
    TLogger.GetInstance.Debug('Variável pTipoRel: ' + IntToStr(pTipoRel) + '. '
      + DateTimeToStr(now));

    if FileExists(ArqTemp) then
    begin
      BlockInput(true);
      TLogger.GetInstance.Debug
        ('Entrou no arquivo TEF armazenado na pasta da aplicação.');
      //FrmMensagem_TEF.LblMensagem.Caption := 'Imprimindo Cupom TEF';
      //FrmMensagem_TEF.LblMensagem.Refresh;

      if (Aberto = 1) then
      begin
        if not(ECF.Fecha_Relatorio) then
        begin
          Result := false;
          FrmMensagem_TEF.close;
          exit;
        end;
        pTipoRel := 1;
      end;

      if pTipoRel = 0 then
      begin
        if (Aberto = 0) then
        begin
          if not(ECF.Abre_Comprovante_Vinculado(pCOO, IndiceImp, pValor)) then
          begin
            Result := false;
            FrmMensagem_TEF.close;
            exit;
          end;
          Aberto := 1;
        end;
      end;

      //via := 2;
      //for i := 1 to pVias do
      //begin
        //if via = 2 then
        //begin
          {aux := #13 + #10 + #13 + #10 + #13 + #10 + #13 + #10 + #13 + #10 +
            #13 + #10;
          TextoImprimir.Add(aux);
          if pTipoRel = 0 then
          begin
            if not(ECF.Imprime_Comprovante_Vinculado(aux)) then
            begin
              Result := false;
              FrmMensagem_TEF.close;
              exit;
            end;}
          {end
          else if pTipoRel = 1 then
          begin
            if not(ECF.Imprime_Relatorio_Gerencial(TextoImprimir)) then
            begin
              Result := false;
              FrmMensagem_TEF.close;
              exit;
            end;
            Aberto := 1;}
          //end;

          // exibe mensagem
          // iRetorno := Bematech_FI_AcionaGuilhotinaMFD(0);
          {if not(ECF.Corta_Papel) then
          begin
            Result := false;
            FrmMensagem_TEF.close;
            exit;
          end;}
          //FrmMensagem_TEF.LblMensagem.Caption := 'Por favor, destaque a 1ª Via';
          //FrmMensagem_TEF.LblMensagem.Refresh;
          //Sleep(3000);
          //FrmMensagem_TEF.LblMensagem.Caption := 'Imprimindo Cupom TEF';
          //FrmMensagem_TEF.LblMensagem.Refresh;
        //end;

        // abre o arquivo e imprime dados
        TLogger.GetInstance.Debug('Vai atribuiu arquivo ArqTemp. ' +
          DateTimeToStr(now));
        AssignFile(cArquivo, ArqTemp);
        TLogger.GetInstance.Debug('Atribuiu arquivo ArqTemp. ' +
          DateTimeToStr(now));
        Reset(cArquivo);
        TLogger.GetInstance.Debug('Abriu arquivo ArqTemp para leitura. ' +
          DateTimeToStr(now));
        while not System.Eof(cArquivo) do
        begin
          Readln(cArquivo, cLinhaArquivo);
          if StrToInt(copy(cLinhaArquivo, 1, 3)) = 29 then
          begin
            aTextoLinha := '';
            aTextoLinha := copy(cLinhaArquivo, 11, Length(cLinhaArquivo) - 10);
            aTextoLinha := StringReplace(aTextoLinha, '"', '', [rfReplaceAll]);
            aTextoLinha := aTextoLinha + #13 + #10;
            TextoImprimir.Add(aTextoLinha);
            TLogger.GetInstance.Debug(aTextoLinha);
            if pTipoRel = 0 then
            begin
              if not(ECF.Imprime_Comprovante_Vinculado(aTextoLinha)) then
              begin
                Result := false;
                FrmMensagem_TEF.close;
                CloseFile(cArquivo);
                exit;
              end;
            {end
            else if pTipoRel = 1 then
            begin
              if not(ECF.Imprime_Relatorio_Gerencial(TextoImprimir)) then
              begin
                Result := false;
                FrmMensagem_TEF.close;
                CloseFile(cArquivo);
                exit;
              end;
              Aberto := 1;}
            end;
          end;
          //via := 2;
        end;
        CloseFile(cArquivo);
      //end;

      if not(ECF.Imprime_Relatorio_Gerencial(TextoImprimir)) then
      begin
        Result := false;
        FrmMensagem_TEF.close;
        CloseFile(cArquivo);
        exit;
      end;

      if pTipoRel = 0 then
      begin
        if not(ECF.Fecha_Relatorio) then
        begin
          Result := false;
          FrmMensagem_TEF.close;
          CloseFile(cArquivo);
          exit;
        end;
        Aberto := 0;
      end
      else if pTipoRel = 1 then
      begin
        {if not(ECF.Fecha_Relatorio) then
        begin
          Result := false;
          FrmMensagem_TEF.close;
          CloseFile(cArquivo);
          exit;
        end;}
        Aberto := 0;
      end;

      //Sleep(1000);
      //FrmMensagem_TEF.LblMensagem.Caption :=
      //  'Finalizando Operação. Por favor, aguarde!';
      //FrmMensagem_TEF.LblMensagem.Refresh;
    end
    else if (FileExists(PathResp + 'INTPOS.001')) then
    begin

      TLogger.GetInstance.Debug
        ('Entrou no arquivo TEF armazenado no TEF_DIAL.');
      FrmMensagem_TEF.LblMensagem.Caption := 'Imprimindo Cupom TEF';
      FrmMensagem_TEF.LblMensagem.Refresh;
      BlockInput(true);

      if (Aberto = 1) then
      begin
        if pTipoRel = 0 then
        begin
          if not(ECF.Fecha_Relatorio) then
          begin
            Result := false;
            FrmMensagem_TEF.close;
            exit;
          end;
          pTipoRel := 1;
        {end
        else if pTipoRel = 1 then
        begin
          if not(ECF.Fecha_Relatorio) then
          begin
            Result := false;
            FrmMensagem_TEF.close;
            exit;
          end;
          pTipoRel := 1;}
        end;
      end;

      if pTipoRel = 0 then
      begin
        if (Aberto = 0) then
        begin
          if not(ECF.Abre_Comprovante_Vinculado(pCOO, IndiceImp, pValor)) then
          begin
            Result := false;
            FrmMensagem_TEF.close;
            CloseFile(cArquivo);
            exit;
          end;
          Aberto := 1;
        end;
      end;

      via := 1;
      for i := 1 to pVias do
      begin
        if via = 2 then
        begin
          aux := #13 + #10 + #13 + #10 + #13 + #10 + #13 + #10 + #13 + #10 +
            #13 + #10;
            TextoImprimir.Add(aux);
          if pTipoRel = 0 then
          begin
            if not(ECF.Imprime_Comprovante_Vinculado(aux)) then
            begin
              Result := false;
              FrmMensagem_TEF.close;
              exit;
            end;
          end
          else if pTipoRel = 1 then
          begin
            if not(ECF.Imprime_Relatorio_Gerencial(TextoImprimir)) then
            begin
              Result := false;
              FrmMensagem_TEF.close;
              exit;
            end;
            Aberto := 1;
          end;

          {if not(ECF.Corta_Papel) then
          begin
            Result := false;
            FrmMensagem_TEF.close;
            exit;
          end;}
          FrmMensagem_TEF.LblMensagem.Caption := 'Por favor, destaque a 1ª Via';
          FrmMensagem_TEF.LblMensagem.Refresh;
          Sleep(3000); // estava 5000
          FrmMensagem_TEF.LblMensagem.Caption := 'Imprimindo Cupom TEF';
          FrmMensagem_TEF.LblMensagem.Refresh;
        end;

        // abre o arquivo e impreme dados
        AssignFile(cArquivo, ArqTemp);
        Reset(cArquivo);
        while not System.Eof(cArquivo) do
        begin
          Readln(cArquivo, cLinhaArquivo);
          if StrToInt(copy(cLinhaArquivo, 1, 3)) = 29 then
          begin
            aTextoLinha := '';
            aTextoLinha := copy(cLinhaArquivo, 11, Length(cLinhaArquivo) - 10);
            aTextoLinha := StringReplace(aTextoLinha, '"', '', [rfReplaceAll]);
            aTextoLinha := aTextoLinha + #13 + #10;
            TextoImprimir.Add(aTextoLinha);
            TLogger.GetInstance.Debug(aTextoLinha);
            if pTipoRel = 0 then
            begin
              if not(ECF.Imprime_Comprovante_Vinculado(aTextoLinha)) then
              begin
                Result := false;
                FrmMensagem_TEF.close;
                CloseFile(cArquivo);
                exit;
              end;
            end
            else if pTipoRel = 1 then
            begin
              if not(ECF.Imprime_Relatorio_Gerencial(TextoImprimir)) then
              begin
                Result := false;
                FrmMensagem_TEF.close;
                CloseFile(cArquivo);
                exit;
              end;
              Aberto := 1;
            end;
          end;
          via := 2;
        end;
        CloseFile(cArquivo);
      end;
      if pTipoRel = 0 then
      begin
        if not(ECF.Fecha_Relatorio) then
        begin
          Result := false;
          FrmMensagem_TEF.close;
          CloseFile(cArquivo);
          exit;
        end;
        Aberto := 0;
      end
      else if pTipoRel = 1 then
      begin
        {if not(ECF.Fecha_Relatorio) then
        begin
          Result := false;
          FrmMensagem_TEF.close;
          CloseFile(cArquivo);
          exit;
        end;}
        Aberto := 0;
      end;

      Sleep(1000); // estava 2000
      FrmMensagem_TEF.LblMensagem.Caption :=
        'Finalizando Operação. Por favor, aguarde!';
      FrmMensagem_TEF.LblMensagem.Refresh;
    end;
  except
    on E: Exception do
    begin
      TLog.Error('Erro em ImprimeTransacaoTEF: ' + E.Message);
    end;

  end;
end;

function Verifica_Status_Impressora_NF(var Status: Boolean; Porta: AnsiString): Boolean;
Var
  portHandle: Integer;
  Ret: Boolean;
  PrnStatus: TACBrPosPrinterStatus;
begin
  Ret:= true;
  Status:= true;
  PrnStatus := dm.ACBrPosPrinter1.LerStatusImpressora;

  if (PrnStatus <> []) then
  begin
    Ret:= false;
    Status:= false;
  end;
  {portHandle := 0;
  portHandle := CreateFile(Pchar(Porta), GENERIC_READ or GENERIC_WRITE, 0, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if (portHandle > 0) or (portGerarNFeHandle < 0) then
  begin
    Status:= false;
    Ret:= false;
  end;}
end;

procedure ExibeMensagem(Tempo: Integer; Mensagem: String);
begin
  if (FrmFechamento_Venda_PDV <> nil) and (FrmFechamento_Venda_PDV.Ativo = true)
  then
  begin
    TLog.Debug('Vai colocar a mensagem no label LblFechamento');
    FrmFechamento_Venda_PDV.LblFechamento.Caption := Mensagem;
    FrmFechamento_Venda_PDV.LblFechamento.Refresh;
    FrmFechamento_Venda_PDV.Refresh;
    TLog.Debug('Vai colocar a mensagem no label LblFechamento');
  end
  else if (FrmPDV <> nil) and (FrmPDV.Ativo = true) then
  begin
    TLog.Debug('Vai colocar a mensagem no label LblStatus');
    FrmPDV.LblStatus.Caption := Mensagem;
    FrmPDV.LblStatus.Refresh;
    FrmPDV.Refresh;
    TLog.Debug('Colocou a mensagem no label LblStatus');
  end;

  TLog.Debug('Tempo de exibição da mensagem: ' + IntToStr(Tempo));
  if Tempo <> 0 then
  begin
    TLog.Debug('Entrou no método que deixa a mensagem visivel.');
    Tempo := Tempo * 1000;
    Sleep(Tempo);
  end;
  TLog.Debug('Saiu do método que deixa a mensagem visivel.');

  TLog.Debug('Vai executar o método Application.ProcessMessages');
  BlockInput(false);
  TLog.Debug
    ('Desbloqueou teclado/mouse para executar o método Application.ProcessMessages.');
  // Application.ProcessMessages;
  TLog.Debug('Executou o método Application.ProcessMessages');
  BlockInput(true);
  TLog.Debug
    ('Bloqueou teclado/mouse para executar o método Application.ProcessMessages.');
end;

procedure ExibeMensagemSemTempo(Msg: String);
begin
  FrmMensagem_TEF.LblMensagem.Caption := Msg;
end;

// confirma a trazação do tef
function ConfirmaTransacao: boolean;
var
  cLinhaArquivo, cConteudo, cCampoArquivo: string;
  // cArquivo: TextFile;
begin
  Result := false;
  cLinhaArquivo := '';
  cConteudo := '';
  Inicializa_Variaveis_TEF;
  pIdentifica := FormatDateTime('hhmmss', Time);

  try
    if FileExists(ArqTemp) then
    begin
      Result := true;
      AssignFile(cArquivo, ArqTemp);
      Reset(cArquivo);
      while not System.Eof(cArquivo) do
      begin
        Readln(cArquivo, cLinhaArquivo);
        cCampoArquivo := copy(cLinhaArquivo, 1, 3);
        // Captura tipo de transacao
        if cCampoArquivo = '000' then
          pTransacao := copy(cLinhaArquivo, 11, Length(cLinhaArquivo) - 10);

        if (copy(cLinhaArquivo, 1, 3) = '001') then
          cConteudo := '001-000 = ' + pIdentifica + #13 + #10;

        // carrega NCU para confirmação de dados
        if cCampoArquivo = '012' then
          pNSU := copy(cLinhaArquivo, 11, Length(cLinhaArquivo) - 10);

        // carrega informações para confirmação
        if (copy(cLinhaArquivo, 1, 3) = '002') or
          (copy(cLinhaArquivo, 1, 3) = '010') or
          (copy(cLinhaArquivo, 1, 3) = '012') or
          (copy(cLinhaArquivo, 1, 3) = '027') then
          cConteudo := cConteudo + cLinhaArquivo + #13 + #10;

        // verifica final de verificação
        if (copy(cLinhaArquivo, 1, 3) = '999') then
          cConteudo := cConteudo + cLinhaArquivo;

      end;
      // fecha o arquivo TEF
      CloseFile(cArquivo);
      Sleep(2000); // estava 3000  //tinha mudado para 1000

      // completa informações para confirmação
      cConteudo := '000-000 = CNF' + #13 + #10 + cConteudo;

      // verifica gerenciador padrão
      // Verifica_Gerenciador_Padrao_Ativo;

      // grava arquivo de confirmação
      AssignFile(cArquivo, PathReq + 'IntPos.tmp');
      Rewrite(cArquivo);
      writeln(cArquivo, cConteudo);
      CloseFile(cArquivo);
      RenameFile(PathReq + 'IntPos.tmp', PathReq + 'IntPos.001');
      Sleep(2000); // estava 2000
      while not FileExists(PathResp + 'INTPOS.STS') do
        Sleep(1000);
      DeleteFile(PathResp + 'INTPOS.STS');
    end
    else if (FileExists(PathResp + 'INTPOS.001')) then
    begin
      Result := true;
      AssignFile(cArquivo, PathResp + 'INTPOS.001');
      Reset(cArquivo);
      while not System.Eof(cArquivo) do
      begin
        Readln(cArquivo, cLinhaArquivo);
        cCampoArquivo := copy(cLinhaArquivo, 1, 3);
        // Captura tipo de transacao
        if cCampoArquivo = '000' then
          pTransacao := copy(cLinhaArquivo, 11, Length(cLinhaArquivo) - 10);

        if (copy(cLinhaArquivo, 1, 3) = '001') then
          cConteudo := '001-000 = ' + pIdentifica + #13 + #10;

        // carrega NCU para confirmação de dados
        if cCampoArquivo = '012' then
          pNSU := copy(cLinhaArquivo, 11, Length(cLinhaArquivo) - 10);

        // carrega informações para confirmação
        if (copy(cLinhaArquivo, 1, 3) = '002') or
          (copy(cLinhaArquivo, 1, 3) = '010') or
          (copy(cLinhaArquivo, 1, 3) = '012') or
          (copy(cLinhaArquivo, 1, 3) = '027') then
          cConteudo := cConteudo + cLinhaArquivo + #13 + #10;

        // verifica final de verificação
        if (copy(cLinhaArquivo, 1, 3) = '999') then
          cConteudo := cConteudo + cLinhaArquivo;

      end;
      // fecha o arquivo TEF
      CloseFile(cArquivo);
      Sleep(2000); // estava 3000

      // completa informações para confirmação
      cConteudo := '000-000 = CNF' + #13 + #10 + cConteudo;

      // verifica gerenciador padrão
      // Verifica_Gerenciador_Padrao_Ativo;

      // grava arquivo de confirmação
      AssignFile(cArquivo, PathReq + 'IntPos.tmp');
      Rewrite(cArquivo);
      writeln(cArquivo, cConteudo);
      CloseFile(cArquivo);
      RenameFile(PathReq + 'IntPos.tmp', PathReq + 'IntPos.001');
      Sleep(2000); // estava 2000
      while not FileExists(PathResp + 'INTPOS.STS') do
        Sleep(1000);
      DeleteFile(PathResp + 'INTPOS.STS');
    end;
  except
    on E: Exception do
    begin
      TLog.Error('Erro ao confirmar transação:' + E.Message);
    end;
  end;

end;

function VerificaArquivoSTS: boolean;
var
  i: Integer;
begin
  // if not (DirectoryExists(PathRespPay)) then
  // begin
  Result := false;
  for i := 1 to 7 do
  begin
    if FileExists(PathResp + 'INTPOS.STS') then
    begin
      Result := true;
      DeleteFile(PathResp + 'INTPOS.STS');
      break;
    end;
    Sleep(1000);
    if (i = 7) then
    begin
      Result := false;
      break;
    end;
  end;
  { end
    else
    begin
    Result := false;
    for i := 1 to 7 do
    begin
    if FileExists(PathRespPay+'INTPOS.STS') then
    begin
    Result := True;
    DeleteFile(PathRespPay+'INTPOS.STS');
    break;
    end;
    Sleep(1000);
    if (i = 7) then
    begin
    result := False;
    Break;
    end;
    end;
    end; }
end;

// verifica a não confirmação da transação
function NaoConfirmaTransacao: boolean;
var
  cLinhaArquivo, cConteudo, cCampoArquivo: string;
begin
  // zera variáveis
  cLinhaArquivo := '';
  cConteudo := '';
  Result := false;
  pIdentifica := FormatDateTime('hhmmss', Time);
  // carrega arquivo com dados pendentes para não confirmação

  // if not (DirectoryExists(PathRespPay)) then
  // begin
  if FileExists(ArqTemp) then
  begin
    AssignFile(cArquivo, ArqTemp);
    Result := true;
    cConteudo := '000-000 = NCN' + #13 + #10;
    Reset(cArquivo);
    while not System.Eof(cArquivo) do
    begin
      Readln(cArquivo, cLinhaArquivo);
      cCampoArquivo := copy(cLinhaArquivo, 1, 3);
      case StrToInt(cCampoArquivo) of
        0:
          pTransacao := copy(cLinhaArquivo, 11, Length(cLinhaArquivo) - 10);

        1:
          cConteudo := cConteudo + '001-000 = ' + pIdentifica + #13 + #10;

        // 1: cConteudo := cConteudo + cLinhaArquivo + #13 + #10;
        3:
          pValor := copy(cLinhaArquivo, 11, Length(cLinhaArquivo) - 10);

        10:
          begin
            cConteudo := cConteudo + cLinhaArquivo + #13 + #10;
            pNomeRede := copy(cLinhaArquivo, 11, Length(cLinhaArquivo) - 10);
          end;

        12:
          begin
            cConteudo := cConteudo + cLinhaArquivo + #13 + #10;
            pNSU := copy(cLinhaArquivo, 11, Length(cLinhaArquivo) - 10);
          end;

        27:
          cConteudo := cConteudo + cLinhaArquivo + #13 + #10;

        999:
          cConteudo := cConteudo + cLinhaArquivo;
      end;
    end;
    CloseFile(cArquivo);
    Sleep(2000); // estava 3000

    // verifica gerenciador padrão

    // Verifica_Gerenciador_Padrao_Ativo;
    Mensagem_NCN_TEF;

    AssignFile(cArquivo, PathReq + 'IntPos.tmp');
    Rewrite(cArquivo);
    writeln(cArquivo, cConteudo);
    CloseFile(cArquivo);
    Sleep(2000); // estava 3000
    RenameFile(PathReq + 'IntPos.tmp', PathReq + 'IntPos.001');
    Sleep(2000);
    while not FileExists(PathResp + 'INTPOS.STS') do
      Sleep(1000);
    DeleteFile(PathResp + 'INTPOS.STS');

    // Foco_Aplicacao;
    // SetForegroundWindow(FindWindow(nil, PWideChar('Warning')));

  end
  else if (FileExists(PathResp + 'INTPOS.001')) then
  begin
    AssignFile(cArquivo, PathResp + 'INTPOS.001');
    Result := true;
    cConteudo := '000-000 = NCN' + #13 + #10;
    Reset(cArquivo);
    while not System.Eof(cArquivo) do
    begin
      Readln(cArquivo, cLinhaArquivo);
      cCampoArquivo := copy(cLinhaArquivo, 1, 3);
      case StrToInt(cCampoArquivo) of
        0:
          pTransacao := copy(cLinhaArquivo, 11, Length(cLinhaArquivo) - 10);

        1:
          cConteudo := cConteudo + '001-000 = ' + pIdentifica + #13 + #10;

        // 1: cConteudo := cConteudo + cLinhaArquivo + #13 + #10;
        3:
          pValor := copy(cLinhaArquivo, 11, Length(cLinhaArquivo) - 10);

        10:
          begin
            cConteudo := cConteudo + cLinhaArquivo + #13 + #10;
            pNomeRede := copy(cLinhaArquivo, 11, Length(cLinhaArquivo) - 10);
          end;

        12:
          begin
            cConteudo := cConteudo + cLinhaArquivo + #13 + #10;
            pNSU := copy(cLinhaArquivo, 11, Length(cLinhaArquivo) - 10);
          end;

        27:
          cConteudo := cConteudo + cLinhaArquivo + #13 + #10;

        999:
          cConteudo := cConteudo + cLinhaArquivo;
      end;
    end;
    CloseFile(cArquivo);
    Sleep(2000);

    // verifica gerenciador padrão

    // Verifica_Gerenciador_Padrao_Ativo;
    Mensagem_NCN_TEF;

    AssignFile(cArquivo, PathReq + 'IntPos.tmp');
    Rewrite(cArquivo);
    writeln(cArquivo, cConteudo);
    CloseFile(cArquivo);
    Sleep(2000);
    RenameFile(PathReq + 'IntPos.tmp', PathReq + 'IntPos.001');
    Sleep(2000);
    while not FileExists(PathResp + 'INTPOS.STS') do
      Sleep(1000);
    DeleteFile(PathResp + 'INTPOS.STS');

    // Foco_Aplicacao;
    // SetForegroundWindow(FindWindow(nil, PWideChar('Warning')));
  end;
  { end
    else
    begin
    if FileExists(ArqTemp) then
    begin
    AssignFile(cArquivo,ArqTemp);
    Result := true;
    cConteudo := '000-000 = NCN' + #13 + #10;
    Reset(cArquivo);
    while not System.EOF(cArquivo) do
    begin
    ReadLn(cArquivo,cLinhaArquivo);
    cCampoArquivo := copy( cLinhaArquivo, 1, 3 );
    case StrToInt( cCampoArquivo ) of
    0: pTransacao := copy( cLinhaArquivo, 11, Length( cLinhaArquivo ) - 10 );

    1: cConteudo:= cConteudo + '001-000 = ' + pIdentifica + #13 + #10;

    //1: cConteudo := cConteudo + cLinhaArquivo + #13 + #10;
    3: pValor := copy( cLinhaArquivo, 11, Length( cLinhaArquivo ) - 10 );

    10: begin
    cConteudo := cConteudo + cLinhaArquivo + #13 + #10;
    pNomeRede := copy( cLinhaArquivo, 11, Length( cLinhaArquivo ) - 10 );
    end;

    12: begin
    cConteudo := cConteudo + cLinhaArquivo + #13 + #10;
    pNSU := copy( cLinhaArquivo, 11, Length( cLinhaArquivo ) - 10 );
    end;

    27:  cConteudo := cConteudo + cLinhaArquivo + #13 + #10;

    999: cConteudo := cConteudo + cLinhaArquivo;
    end;
    end;
    CloseFile(cArquivo);
    Sleep(3000);

    // verifica gerenciador padrão

    Verifica_Gerenciador_Padrao_Ativo;
    Mensagem_NCN_TEF;

    AssignFile(cArquivo,PathReqPay+'IntPos.tmp' );
    ReWrite( cArquivo );
    WriteLn( cArquivo, cConteudo );
    CloseFile( cArquivo );
    Sleep(3000);
    RenameFile(PathReqPay+'IntPos.tmp',PathReqPay+'IntPos.001');
    sleep(2000);
    while not FileExists(PathRespPay+'INTPOS.STS' ) do
    sleep(1000);
    DeleteFile(PathRespPay+'INTPOS.STS' );

    //Foco_Aplicacao;
    //SetForegroundWindow(FindWindow(nil, PWideChar('Warning')));

    end
    else if (FileExists(PathRespPay + 'INTPOS.001')) then
    begin
    AssignFile(cArquivo,PathRespPay + 'INTPOS.001');
    Result := true;
    cConteudo := '000-000 = NCN' + #13 + #10;
    Reset(cArquivo);
    while not System.EOF(cArquivo) do
    begin
    ReadLn(cArquivo,cLinhaArquivo);
    cCampoArquivo := copy( cLinhaArquivo, 1, 3 );
    case StrToInt( cCampoArquivo ) of
    0: pTransacao := copy( cLinhaArquivo, 11, Length( cLinhaArquivo ) - 10 );

    1: cConteudo:= cConteudo + '001-000 = ' + pIdentifica + #13 + #10;

    //1: cConteudo := cConteudo + cLinhaArquivo + #13 + #10;
    3: pValor := copy( cLinhaArquivo, 11, Length( cLinhaArquivo ) - 10 );

    10: begin
    cConteudo := cConteudo + cLinhaArquivo + #13 + #10;
    pNomeRede := copy( cLinhaArquivo, 11, Length( cLinhaArquivo ) - 10 );
    end;

    12: begin
    cConteudo := cConteudo + cLinhaArquivo + #13 + #10;
    pNSU := copy( cLinhaArquivo, 11, Length( cLinhaArquivo ) - 10 );
    end;

    27:  cConteudo := cConteudo + cLinhaArquivo + #13 + #10;

    999: cConteudo := cConteudo + cLinhaArquivo;
    end;
    end;
    CloseFile(cArquivo);
    Sleep(3000);

    // verifica gerenciador padrão

    Verifica_Gerenciador_Padrao_Ativo;
    Mensagem_NCN_TEF;

    AssignFile(cArquivo,PathReqPay+'IntPos.tmp' );
    ReWrite( cArquivo );
    WriteLn( cArquivo, cConteudo );
    CloseFile( cArquivo );
    Sleep(3000);
    RenameFile(PathReqPay+'IntPos.tmp',PathReqPay+'IntPos.001');
    sleep(2000);
    while not FileExists(PathRespPay+'INTPOS.STS' ) do
    sleep(1000);
    DeleteFile(PathRespPay+'INTPOS.STS' );

    //Foco_Aplicacao;
    //SetForegroundWindow(FindWindow(nil, PWideChar('Warning')));
    end;
    end; }

end;

// cancela transação do tef
function CancelaTransacaoTEF(cNSU: string; cValor: string; cNomeRede: string;
  cNumeroDOC: string; cData: string; cHora: string; iVezes: Integer): boolean;
var
  cConteudo, Mensagem: string;
  // cArquivo: TextFile;
begin
  Result := true;
  cConteudo := '';
  pIdentifica := '';
  cConteudo := '000-000 = CNC' + #13 + #10 + '001-000 = ' + pIdentifica + #13 +
    #10 + '003-000 = ' + pValor + #13 + #10 + '010-000 = ' + pNomeRede + #13 +
    #10 + '012-000 = ' + pNSU + #13 + #10 + '022-000 = ' + pData + #13 + #10 +
    '023-000 = ' + pHora + #13 + #10 + '999-999 = 0';
  AssignFile(cArquivo, PathReq + 'INTPOS.001');
  Rewrite(cArquivo);
  writeln(cArquivo, cConteudo);
  CloseFile(cArquivo);
  Sleep(1000);
  // função para analize do arquivo de retorno TEF
  if not AnalizaArquivoRetorno(aAprovado, Mensagem) then
  begin
    Result := false;
  end;
end;

// chama o módulo administrativo das bandeiras
function FuncaoAdministrativaTEF: boolean;
var
  cConteudoArquivo: string;
  // cArquivo : TextFile;
begin
  // if not (DirectoryExists(PathRespPay)) then
  // begin
  Result := true;
  // Prepara arquivo de comunicacao
  pIdentifica := FormatDateTime('hhmmss', Time);
  cConteudoArquivo := '';
  cConteudoArquivo := '000-000 = ADM' + #13 + #10 + '001-000 = ' + pIdentifica +
    #13 + #10 + '999-999 = 0';
  AssignFile(cArquivo, PathReq + 'IntPos.tmp');
  Rewrite(cArquivo);
  writeln(cArquivo, cConteudoArquivo);
  CloseFile(cArquivo);
  RenameFile(PathReq + 'IntPos.tmp', PathReq + 'IntPos.001');
  Sleep(2000);
  { end
    else
    begin
    Result := true;
    // Prepara arquivo de comunicacao
    pIdentifica := FormatDateTime('hhmmss',Time);
    cConteudoArquivo := '';
    cConteudoArquivo := '000-000 = ADM'+#13+#10+
    '001-000 = ' +pIdentifica+#13+#10+
    '999-999 = 0';
    AssignFile(cArquivo,PathReqPay+'IntPos.tmp');
    ReWrite(cArquivo);
    WriteLn(cArquivo,cConteudoArquivo);
    CloseFile(cArquivo);
    RenameFile(PathReqPay+'IntPos.tmp',PathReqPay+'IntPos.001');
    Sleep(2000);
    end; }
end;

function FuncaoVendaTEF: boolean;
var
  cConteudoArquivo: string;
  // cArquivo  : TextFile;
begin
  try
    BlockInput(false);
    TLog.Debug
      ('Desbloqueou teclado/mouse para executar o método FuncaoVendaTEF.');

    Result := true;
    pIdentifica := FormatDateTime('hhmmss', Time);
    cConteudoArquivo := '';
    cConteudoArquivo := '000-000 = CRT' + #13 + #10 + '001-000 = ' + pIdentifica
      + #13 + #10 + '002-000 = ' + pNumeroCupom + #13 + #10 + '003-000 = ' +
      pValor + #13 + #10 + '004-000 = 0' + #13 + #10 + '999-999 = 0';
    AssignFile(cArquivo, PathReq + 'IntPos.tmp');
    Rewrite(cArquivo);
    writeln(cArquivo, cConteudoArquivo);
    CloseFile(cArquivo);
    RenameFile(PathReq + 'IntPos.tmp', PathReq + 'IntPos.001');
    TLog.Debug('Executou função: FuncaoVendaTEF');
    Sleep(4000); // estava 5000        //tinha mudado para 2000
  except
    on E: Exception do
    begin
      TLog.Error('Erro FuncaoVendaTEF: ' + E.Message);
      BlockInput(false);
      TLog.Debug('Desbloqueou teclado/mouse pois deu erro em FuncaoVendaTEF');
    end;
  end;
end;

function ConsultaCheque: boolean;
var
  cConteudoArquivo: string;
  // cArquivo  : TextFile;
begin
  // if not (DirectoryExists(PathRespPay)) then
  // begin
  Result := true;
  pIdentifica := FormatDateTime('hhmmss', Time);
  cConteudoArquivo := '';
  cConteudoArquivo := '000-000 = CHQ' + #13 + #10 + '001-000 = ' + pIdentifica +
    #13 + #10 + '002-000 = ' + pNumeroCupom + #13 + #10 + '003-000 = ' + pValor
    + #13 + #10 + '004-000 = 0' + #13 + #10 + '999-999 = 0';
  AssignFile(cArquivo, PathReq + 'IntPos.tmp');
  Rewrite(cArquivo);
  writeln(cArquivo, cConteudoArquivo);
  CloseFile(cArquivo);
  RenameFile(PathReq + 'IntPos.tmp', PathReq + 'IntPos.001');
  Sleep(5000);
  { end
    else
    begin
    Result := true;
    pIdentifica := FormatDateTime('hhmmss',Time);
    cConteudoArquivo := '';
    cConteudoArquivo := '000-000 = CHQ' + #13 + #10+
    '001-000 = ' + pIdentifica  + #13 + #10 +
    '002-000 = ' + pNumeroCupom + #13 + #10 +
    '003-000 = ' + pValor + #13 + #10 +
    '004-000 = 0' + #13 + #10 +
    '999-999 = 0';
    AssignFile(cArquivo,PathReqPay+'IntPos.tmp');
    ReWrite(cArquivo);
    WriteLn(cArquivo,cConteudoArquivo);
    CloseFile(cArquivo);
    RenameFile(PathReqPay+'IntPos.tmp',PathReqPay+'IntPos.001');
    Sleep(5000);
    end; }
end;

/// /////////////////////////////////////////////////////////////////////////////
//
// Função:
// VerificaRetornoFuncaoImpressora
// Objetivo:
// Verificar o retorno da impressora e da função utilizada
// Retorno:
// True para OK
// False para não OK
//
/// /////////////////////////////////////////////////////////////////////////////
function VerificaRetornoFuncaoImpressora(iRetorno: Integer): boolean;
var
  cMSGErro: string;
  iACK, iST1, iST2: Integer;
begin
  iACK := 0;
  iST1 := 0;
  iST2 := 0;
  cMSGErro := '';
  Result := false;
  case iRetorno of
    0:
      cMSGErro := 'Erro de Comunicação !';
    -1:
      cMSGErro := 'Erro de execução na Função !';
    -2:
      cMSGErro := 'Parâmetro inválido na Função !';
    -3:
      cMSGErro := 'Alíquota não Programada !';
    -4:
      cMSGErro := 'Arquivo BEMAFI32.INI não Encontrado !';
    -5:
      cMSGErro := 'Erro ao abrir a Porta de Comunicação !';
    -6:
      cMSGErro := 'Impressora Desligada ou Cabo de Comunicação Desconectado !';
    -7:
      cMSGErro := 'Código do Banco não encontrado no arquivo BEMAFI32.INI !';
    -8:
      cMSGErro := 'Erro ao criar ou gravar arquivo STATUS.TXT ou RETORNO.TXT !';
    -27:
      cMSGErro := 'Status diferente de 6, 0, 0 !';
    -30:
      cMSGErro := 'Função incompatível com a impressora fiscal YANCO !';
  end;

  cMSGErro := '';
  if (iRetorno = 1) then
  begin
    Bematech_FI_RetornoImpressora(iACK, iST1, iST2);
    if (iACK = 21) then
    begin
      Bematech_FI_FinalizaModoTEF();
      application.MessageBox('A Impressora retornou NAK !' + #13 +
        'Erro de Protocolo de Comunicação !', 'Atenção', MB_ICONERROR + MB_OK);
      Result := false;
    end
    else if (iST1 <> 0) or (iST2 <> 0) then
    begin

      // Analisa ST1
      if (iST1 >= 128) then
      begin
        iST1 := iST1 - 128;
        cMSGErro := cMSGErro + 'Fim de Papel' + #13;
      end;
      if (iST1 >= 64) then
      begin
        iST1 := iST1 - 64;
        cMSGErro := cMSGErro + 'Pouco Papel' + #13;
      end;
      if (iST1 >= 32) then
      begin
        iST1 := iST1 - 32;
        cMSGErro := cMSGErro + 'Erro no Relógio' + #13;
      end;
      if (iST1 >= 16) then
      begin
        iST1 := iST1 - 16;
        cMSGErro := cMSGErro + 'Impressora em Erro' + #13;
      end;
      if (iST1 >= 8) then
      begin
        iST1 := iST1 - 8;
        cMSGErro := cMSGErro + 'Primeiro Dado do Comando não foi ESC' + #13;
      end;
      if iST1 >= 4 then
      begin
        iST1 := iST1 - 4;
        cMSGErro := cMSGErro + 'Comando Inexistente' + #13;
      end;
      if iST1 >= 2 then
      begin
        iST1 := iST1 - 2;
        cMSGErro := cMSGErro + 'Cupom Fiscal Aberto' + #13;
      end;
      if iST1 >= 1 then
      begin
        iST1 := iST1 - 1;
        cMSGErro := cMSGErro + 'Número de Parâmetros Inválidos' + #13;
      end;

      // Analisa ST2
      if iST2 >= 128 then
      begin
        iST2 := iST2 - 128;
        cMSGErro := cMSGErro + 'Tipo de Parâmetro de Comando Inválido' + #13;
      end;
      if iST2 >= 64 then
      begin
        iST2 := iST2 - 64;
        cMSGErro := cMSGErro + 'Memória Fiscal Lotada' + #13;
      end;
      if iST2 >= 32 then
      begin
        iST2 := iST2 - 32;
        cMSGErro := cMSGErro + 'Erro na CMOS' + #13;
      end;
      if iST2 >= 16 then
      begin
        iST2 := iST2 - 16;
        cMSGErro := cMSGErro + 'Alíquota não Programada' + #13;
      end;
      if iST2 >= 8 then
      begin
        iST2 := iST2 - 8;
        cMSGErro := cMSGErro +
          'Capacidade de Alíquota Programáveis Lotada' + #13;
      end;
      if iST2 >= 4 then
      begin
        iST2 := iST2 - 4;
        cMSGErro := cMSGErro + 'Cancelamento não permitido' + #13;
      end;
      if iST2 >= 2 then
      begin
        iST2 := iST2 - 2;
        cMSGErro := cMSGErro + 'CGC/IE do Proprietário não Programados' + #13;
      end;
      if iST2 >= 1 then
      begin
        iST2 := iST2 - 1;
        cMSGErro := cMSGErro + 'Comando não executado' + #13;
      end;
      if (cMSGErro <> '') then
      begin
        Bematech_FI_FinalizaModoTEF();
        application.MessageBox(Pchar(cMSGErro), 'Atenção',
          MB_ICONERROR + MB_OK);
        Result := false;
      end;
    end
    else
      Result := true;
  end;
end;

function AnalizaArquivoRetorno(var Aprovado: boolean;
  var Mensagem: String): boolean;
var
  cLinhaArquivo, cCampoArquivo: string;
  // cArquivo  : TextFile;
  Verifica: boolean;
  aux: LongBool;
begin
  // if not DirectoryExists(PathRespPay) then
  // begin
  try
    TLog.Debug('Entrou no método AnalizaArquivoRetorno');
    Result := false;
    Verifica := false;
    if FileExists(PathResp + 'INTPOS.STS') then
    begin
      while not Verifica do
      begin
        if FileExists(PathResp + 'INTPOS.001') then
        begin
          BlockInput(true);
          TLog.Debug('Bloqueou teclado/mouse ao encontrar ' + PathResp +
            'INTPOS.001');
          Verifica := true;
          Aprovado := true;
          Sleep(500);
          AssignFile(cArquivo, PathResp + 'INTPOS.001');
          TLog.Debug('Colocou o arquivo ' + PathResp + 'INTPOS.001' +
            ' dentro do objeto cArquivo do sistema.');
          Reset(cArquivo);
          TLog.Debug('Abriu o arquivo para leitura através do método Reset.');
          while not System.Eof(cArquivo) do
          begin
            Readln(cArquivo, cLinhaArquivo);
            // TLog.Debug('Leu uma linha do arquivo através do método ReadLn.');
            cCampoArquivo := copy(cLinhaArquivo, 1, 3);
            // TLog.Debug('Copiou os 3 primeiros caracteres da linha: '+cCampoArquivo);
            case StrToInt(cCampoArquivo) of
              0:
                begin
                  pOperacao := copy(cLinhaArquivo, 11,
                    Length(cLinhaArquivo) - 10);
                  TLog.Debug('Encontrou cCampoArquivo = 0: ' + pOperacao);
                end;
              1:
                begin
                  if (copy(cLinhaArquivo, 11, Length(cLinhaArquivo) - 10) <>
                    pIdentifica) then
                  begin
                    TLog.Debug('Encontrou cCampoArquivo = 1. ');
                    CloseFile(cArquivo);
                    TLog.Debug('Fechou o arquivo cArquivo. ');
                    DeleteFile(PathResp + 'INTPOS.001');
                    TLog.Debug('Deletou o arquivo: ' + PathResp + 'INTPOS.001');
                    Result := false;
                    Verifica := false;
                    Sleep(5000);
                    break;
                  end;
                end;
              9:
                begin
                  if copy(cLinhaArquivo, 11, Length(cLinhaArquivo) - 10) <> '0'
                  then
                    Aprovado := false;

                  TLog.Debug('Encontrou cCampoArquivo = 9. ');
                end;
              10:
                begin
                  if Aprovado then
                    pNomeRede := copy(cLinhaArquivo, 11,
                      Length(cLinhaArquivo) - 10);
                  TLog.Debug('Encontrou cCampoArquivo = 10: ' + pNomeRede);
                end;
              12:
                begin
                  if Aprovado then
                    pNSU := copy(cLinhaArquivo, 11, Length(cLinhaArquivo) - 10);
                  TLog.Debug('Encontrou cCampoArquivo = 12: ' + pNSU);
                end;
              22:
                begin
                  if Aprovado then
                    pData := copy(cLinhaArquivo, 11,
                      Length(cLinhaArquivo) - 10);
                  TLog.Debug('Encontrou cCampoArquivo = 22: ' + pData);
                end;
              23:
                begin
                  if Aprovado then
                    pHora := copy(cLinhaArquivo, 11,
                      Length(cLinhaArquivo) - 10);
                  TLog.Debug('Encontrou cCampoArquivo = 23: ' + pHora);
                end;
              25:
                begin
                  if Aprovado then
                    pTransacao := copy(cLinhaArquivo, 11,
                      Length(cLinhaArquivo) - 10);
                  TLog.Debug('Encontrou cCampoArquivo = 25: ' + pTransacao);
                end;
              27:
                begin
                  if Aprovado then
                    pFinalizacao := copy(cLinhaArquivo, 11,
                      Length(cLinhaArquivo) - 10);
                  TLog.Debug('Encontrou cCampoArquivo = 27: ' + pFinalizacao);
                end;
              28:
                begin
                  if (StrToInt(copy(cLinhaArquivo, 11, Length(cLinhaArquivo) -
                    10)) > 0) and (Aprovado) then
                  begin
                    TLog.Debug
                      ('Entrou no campo 28 (Dados a serem impressos) do método AnalizaArquivoRetorno');
                    CopyFile(PWideChar(PathResp + 'INTPOS.001'),
                      PWideChar(ArqTemp), aux);
                    Imprime_Transacao := true;
                  end
                  else if (StrToInt(copy(cLinhaArquivo, 11,
                    Length(cLinhaArquivo) - 10)) = 0) and (Aprovado) then
                  begin
                    TLog.Debug
                      ('Entrou no campo 28 (NÃO há dados para imprimir) do método AnalizaArquivoRetorno');
                    Imprime_Transacao := false;
                  end;
                end;
              30:
                begin
                  TLog.Debug
                    ('Entrou no campo 30 (Mensagem) do método AnalizaArquivoRetorno');
                  Mensagem := copy(cLinhaArquivo, 11,
                    Length(cLinhaArquivo) - 10);
                  TLog.Debug('Mensagem da transação TEF: ' + Mensagem);
                end;
            end;
          end;
        end;
      end;
    end;
    CloseFile(cArquivo);
  except
    on E: Exception do
    begin
      TLog.Error('Erro em AnalizaArquivoRetorno: ' + E.Message);
      BlockInput(false);
      TLog.Debug
        ('Desbloqueou teclado/mouse pois deu erro em AnalizaArquivoRetorno');
    end;

  end;
  { end
    else
    begin
    result := false;
    Verifica := false;
    if FileExists(PathRespPay+'INTPOS.STS') then
    begin
    while not Verifica do
    begin
    if FileExists(PathRespPay+'INTPOS.001') then
    begin
    Verifica := true;
    Aprovado := true;
    Sleep(500);
    AssignFile(cArquivo,PathRespPay+'INTPOS.001');
    Reset(cArquivo);
    while not System.EOF(cArquivo) do
    begin
    ReadLn(cArquivo,cLinhaArquivo);
    cCampoArquivo := copy(cLinhaArquivo,1,3);
    case StrToInt(cCampoArquivo) of
    0: pOperacao := copy( cLinhaArquivo, 11, Length( cLinhaArquivo ) - 10);
    1: begin
    if (copy(cLinhaArquivo,11,Length(cLinhaArquivo )-10) <> pIdentifica) then
    begin
    CloseFile( cArquivo );
    DeleteFile(PathRespPay+'INTPOS.001');
    Result := false;
    Verifica := false;
    Sleep(5000);
    break;
    end;
    end;
    9: begin
    if copy( cLinhaArquivo, 11, Length( cLinhaArquivo ) - 10) <> '0' then
    Aprovado := false;
    end;
    10: begin
    if Aprovado then
    pNomeRede := copy( cLinhaArquivo, 11, Length( cLinhaArquivo ) - 10);
    end;
    12: begin
    if Aprovado then
    pNSU := copy( cLinhaArquivo, 11, Length( cLinhaArquivo ) - 10);
    end;
    22: begin
    if Aprovado then
    pData := copy( cLinhaArquivo, 11, Length( cLinhaArquivo ) - 10);
    end;
    23: begin
    if Aprovado then
    pHora := copy( cLinhaArquivo, 11, Length( cLinhaArquivo ) - 10);
    end;
    25: begin
    if Aprovado then
    pTransacao := copy( cLinhaArquivo, 11, Length( cLinhaArquivo ) - 10);
    end;
    27: begin
    if Aprovado then
    pFinalizacao := copy( cLinhaArquivo, 11, Length( cLinhaArquivo ) - 10);
    end;
    28: begin
    if (StrToInt(copy(cLinhaArquivo,11,Length(cLinhaArquivo)-10)) > 0) and (Aprovado) then
    begin
    CopyFile(PWideChar(PathRespPay+'INTPOS.001'),PWideChar(ArqTemp),aux);
    end;
    end;
    30: begin
    Mensagem := copy( cLinhaArquivo, 11, Length( cLinhaArquivo ) - 10 );
    end;
    end;
    end;
    end;
    end;
    end;
    CloseFile( cArquivo );
    end; }

end;

procedure Atualiza_NFe_Banco(chave, Protocolo, Nota_Fiscal, Tipo,
  Status: AnsiString; Codigo: Integer; Data: TDateTime; var Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  try
    try
      qAux := TADOQuery.Create(nil);
      with qAux, SQL do
      begin
        close;
        Connection := Conexao;
        clear;
        add('update Pedido set Chave_NFe = :Chave_NFe, Protocolo_NFe = :Protocolo_NFe, N_Nota_Fiscal = :N_Nota_Fiscal,');
        add('Tipo = :Tipo, Status = :Status, Data_Emissao_NFe = :Data_Emissao_NFe');
        add('where Codigo = :Codigo');
        Parameters.ParamByName('Chave_NFe').Value := chave;
        Parameters.ParamByName('Protocolo_NFe').Value := Protocolo;
        Parameters.ParamByName('N_Nota_Fiscal').Value := Nota_Fiscal;
        Parameters.ParamByName('Codigo').Value := Codigo;
        Parameters.ParamByName('Tipo').Value := Tipo;
        Parameters.ParamByName('Status').Value := Status;
        Parameters.ParamByName('Data_Emissao_NFe').Value := Data;
        ExecSQL;
      end;
    except
      on E: Exception do
        TLog.Error('Atualiza_NFe_Banco - ' + E.Message);
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

procedure Atualiza_NFCe_Banco(chave, Protocolo, Nota_Fiscal, Tipo,
  Status: AnsiString; Codigo: Integer; Data: TDateTime; var Conexao: TADOConnection);
var
  qAux: TADOQuery;
begin
  try
    try
      qAux := TADOQuery.Create(nil);
      with qAux, SQL do
      begin
        close;
        Connection := Conexao;
        clear;
        add('update Pedido set Chave_NFCe = :Chave_NFCe, Protocolo_NFCe = :Protocolo_NFCe, N_NFCE = :N_NFCE,');
        add('Tipo = :Tipo, Status = :Status, Data_Emissao_NFCe = :Data_Emissao_NFCe');
        add('where Codigo = :Codigo');
        Parameters.ParamByName('Chave_NFCe').Value := chave;
        Parameters.ParamByName('Protocolo_NFCe').Value := Protocolo;
        Parameters.ParamByName('N_NFCE').Value := Nota_Fiscal;
        Parameters.ParamByName('Codigo').Value := Codigo;
        Parameters.ParamByName('Tipo').Value := Tipo;
        Parameters.ParamByName('Status').Value := Status;
        Parameters.ParamByName('Data_Emissao_NFCe').Value := Data;
        ExecSQL;
      end;
    except
      on E: Exception do
        TLog.Error('Atualiza_NFCe_Banco - ' + E.Message);
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

function Retorna_Tipo_Pedido(Codigo: Integer): AnsiString;
var
  qAux: TADOQuery;
begin
  try
    try
      qAux := TADOQuery.Create(nil);
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('Select Tipo from Pedido ');
        add('where Codigo = :Codigo');
        Parameters.ParamByName('Codigo').Value := Codigo;
        Open;
        Result:= qAux.FieldByName('Tipo').AsString;
      end;
    except
      on E: Exception do
        TLog.Error('Retorna_Tipo_Pedido - ' + E.Message);
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

function Retorna_Hora_Formatada(Hora: AnsiString): AnsiString;
var
  HoraAux1, HoraAux2, HoraAux3, HoraFinal: AnsiString;
begin
  HoraAux1:= Copy(Hora, 1,2);
  HoraAux2:= Copy(Hora, 3,2);
  HoraAux3:= Copy(Hora, 5,2);
  HoraFinal:= HoraAux1+':'+HoraAux2+':'+HoraAux3;
  Result:= HoraFinal;
end;

function Retorna_Aliquota(AliquotaSemFormatacao: AnsiString): Integer;
var
  i: integer;
  aAux, i2, Aliquota: AnsiString;
begin
  {aAux:= '';
  Aliquota:= '';
  for i := 1 to Length(AliquotaSemFormatacao) do
  begin
    aAux:= AliquotaSemFormatacao[i];
    if (aAux <> '0') then
    begin
      Aliquota:= Aliquota + IntToStr(StrToInt(aAux));
    end
    else
    begin
      if (i = 1) then
      begin
        i2:= copy(AliquotaSemFormatacao, 1,2);
        if (i2 <> '00') then
        
      end;
        break;
    end;
  end;}
  Aliquota:= StringReplace(AliquotaSemFormatacao, '0', '', [rfReplaceAll]);
  Result:= StrToInt(Aliquota);
end;

function Retorna_Data_Formatada(Data, Formato: AnsiString): AnsiString;
var
  DataAux, DataAux2, DataAux3, DataAux4, DataAux5, DataFinal: AnsiString;
begin
  DataAux:= StringReplace(Data, '-', '', [rfReplaceAll]);
  DataAux:= StringReplace(DataAux, '/', '', [rfReplaceAll]);
  DataAux2:= Copy(DataAux, 1,4);
  DataAux3:= Copy(DataAux, 5,2);
  DataAux4:= Copy(DataAux, 7,2);
  DataAux5:= DataAux4 + '/' + DataAux3 + '/' + DataAux2;
  DataFinal:= FormatDateTime(Formato, StrToDate(DataAux5));
  Result:= DataFinal;
end;

function Retorna_Codigo_Pedido_Pelo_N_Pedido(N_Pedido: AnsiString): Integer;
var
  qAux: TADOQuery;
begin
  try
    try
      qAux := TADOQuery.Create(nil);
      with qAux, SQL do
      begin
        close;
        Connection := DM.ADOConnection1;
        clear;
        add('select Codigo from Pedido');
        add('where N_Pedido = :N_Pedido');
        Parameters.ParamByName('N_Pedido').Value := N_Pedido;
        open;
        Result := qAux.FieldByName('Codigo').AsInteger;
      end;
    except
      on E: Exception do
        TLog.Error('Retorna_Codigo_Pedido_Pelo_N_Pedido - ' + E.Message);
    end;
  finally
    FreeAndNil(qAux);
  end;
end;

end.
