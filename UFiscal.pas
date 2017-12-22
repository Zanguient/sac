unit UFiscal;

interface


uses
  Windows, Forms, Dialogs, variants, classes, db, dbtables, sysutils,
  Messages, Graphics, Controls, StdCtrls, ExtCtrls;
type
  TType = (cnBamatech, cnDaruma, cnUnknown);
  IFiscal = interface
    ['{A3146022-FC43-475D-9DAA-FB7AF73A994A}']
    //funções do cupom fiscal
    function AbrirCupom(lcCpfCnpj: string): integer;
    function VendeItem( Codigo: String; Descricao: String; Aliquota: String; TipoQuantidade: String; Quantidade: String; CasasDecimais: Integer; ValorUnitario: String; TipoDesconto: String; Desconto: String): Integer;
    function VendeItemDepartamento( Codigo: String; Descricao: String; Aliquota: String; ValorUnitario: String; Quantidade: String; Acrescimo: String; Desconto: String; IndiceDepartamento: String; UnidadeMedida: String): Integer;
    function CancelaItemAnterior: Integer;
    function CancelaItemGenerico(NumeroItem: String ): Integer;
    function CancelaCupom: Integer;
    function EspacoEntreLinhas( Dots: Integer ): Integer;

    function IniciaFechamentoCupom(AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String ): Integer;
    function FechaCupom( FormaPagamento: String; AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String; ValorPago: String; Mensagem: String): Integer;
    function TerminaFechamentoCupom( Mensagem: String): Integer;

    function AlteraSimboloMoeda( SimboloMoeda: String ): Integer;
    function ProgramaHorarioVerao: Integer;
    function ProgramaAliquota( Aliquota: String; ICMS_ISS: Integer ): Integer;
    function ProgramaArredondamento: Integer;
    function ProgramaTruncamento: Integer;
    function EfetuaFormaPagamento( FormaPagamento: String; ValorFormaPagamento: String ): Integer;
    function EfetuaFormaPagamentoDescricaoForma( FormaPagamento: string; ValorFormaPagamento: string; DescricaoFormaPagto: string ): integer;
    function ResetaImpressora: Integer;
    function UsaUnidadeMedida( UnidadeMedida: String ): Integer;
    function AumentaDescricaoItem( Descricao: String ): Integer;
    function FlagsFiscais( Flag : integer ): Integer;
    function FlagsFiscaisStr( Flag : integer ): Integer;
    function NumeroSerie( NumeroSerie : string ): Integer;
    function NumeroSerieCriptografado( NumeroSerie : string ): Integer;
    function GrandeTotal( GrandeTotal : string ): Integer;

    //relatório fiscal
    function LeituraX: Integer;
    function ReducaoZ( Data: String; Hora: String ): Integer;
    function RelatorioGerencial( Texto: String ): Integer;
    function FechaRelatorioGerencial: Integer;
    function LeituraMemoriaFiscalData( DataInicial: String; DataFinal: String ):Integer;
    function LeituraMemoriaFiscalReducao( ReducaoInicial: String; ReducaoFinal: String ): Integer;
    function LeituraMemoriaFiscalSerialData( DataInicial: String; DataFinal: String ): Integer;
    function MemoriaFiscalSerialReducao( ReducaoInicial: String; ReducaoFinal: String ): Integer;

    //operações não fiscais
    function RecebimentoNaoFiscal( IndiceTotalizador: String; Valor: String; FormaPagamento: String ): Integer;
    function AbreComprovanteNaoFiscalVinculado( FormaPagamento: String; Valor: String; NumeroCupom: String ): Integer;
    function UsaComprovanteNaoFiscalVinculado( Texto: String ): Integer;
    function UsaComprovanteNaoFiscalVinculadoTEF( Texto: String ): Integer;
    function FechaComprovanteNaoFiscalVinculado: Integer;
    function Sangria( Valor: String ): Integer;
    function Suprimento( Valor: String; FormaPagamento: String ): Integer;

    //funções para paf-ecf
    function AbreDocumentoAuxiliarVenda( cIndice: String; cTitulo: String; cNumeroDAV: String; cNomeEmitente: String; cCNPJ_CPFEmitente: String; cNomeDestinatario: String; CNPJ_CPFDestinatario:  String): Integer;
    function UsaDocumentoAuxiliarVenda( cMercadoria: String; cValorUnitario: String; cValorTotal: String ): Integer;
    function FechaDocumentoAuxiliarVenda( cTotal: String ): Integer;
    function TerminaFechamentoCupomPreVenda( cMD5: String; cNumeroPreVenda: String; cMensagemPromocional: String ): Integer;
    function DAVEmitidosRelatorioGerencial( cIndice: String; cDataInicial: String; cDataFinal:  String): Integer;
    function DAVEmitidosArquivo( cNomeArquivo: String; cDataInicial: String; cDataFinal: String; cChavePublica: String; cChavePrivada: String ): Integer;
    function LeituraMemoriaFiscalSerialDataPAFECF( cDataInicial: String; cDataFinal: String; cFlagLeitura: String; cChavePublica: String; cChavePrivada: String ): Integer;
    function LeituraMemoriaFiscalSerialReducaoPAFECF( cCRZInicial: String; cCRZFinal: String; cFlagLeitura: String; cChavePublica: String; cChavePrivada: String ): Integer;
    function EspelhoMFD( cNomeArquivoDestino: String; cDadoInicial: String; cDadoFinal: String; cTipoDownload: String; cUsuario: String; cChavePublica: String; cChavePrivada: String ): Integer;
    function ArquivoMFD( cNomeArquivoOrigem: String; cDadoInicial: String; cDadoFinal: String; cTipoDownload: String; cUsuario: String; iTipoGeracao: integer; cChavePublica: String; cChavePrivada: String; iUnicoArquivo: integer ): Integer;
    function IdentificacaoPAFECF( cIndice: String; cNumeroLaudo: String; cCNPJDesenvolvedor: String; cRazaoSocial: String; cEndereco: String; cTelefone: String; cContato: String; cNomeComercial: String; cVersao: String; cPrincipalExecutavel: String; cMD5PrincipalExecutavel: String; cDemaisArquivos: String; cMD5DemaisArquivos: String; cNumerosFabricacao: String ): Integer;
    function GrandeTotalCriptografado( cGTCriptografado: String ): Integer;
    function GrandeTotalDescriptografado( cGTCriptografado: String; cGTDescriptografado: String ): Integer;
    function AbreRelatorioMeiosPagamaneto( cIndice: String ): Integer;
    function UsaRelatorioMeiosPagamaneto ( cIdentificacao: String; cTipoDocumento: String; cValorAcumulado: String; cData: String ): Integer;
    function FechaRelatorioMeiosPagamento: Integer;
    function NomeiaRelatorioMeiosDePagamento: Integer;
    function NomeiaRelatorioDocumentoAuxiliarDeVenda: Integer;
    function NomeiaRelatorioDAVEmitidos: Integer;
    function NomeiaRelatorioIdentificacaoPAFECF: Integer;
    function NomeiaRelatoriosPAFECF: Integer;
    function NomeiaRelatorioGerencialMFD (Indice, Descricao : string): Integer;

    //outras funções
    function AbrePortaSerial: Integer;
    function RetornoImpressora(): Integer;
    function RetornaRetorno(Var ACK: Integer; Var ST1: Integer; Var ST2: Integer): Integer;
    function FechaPortaSerial: Integer;
    function MapaResumo:Integer;
    function AberturaDoDia( ValorCompra: string; FormaPagamento: string ): Integer;
    function FechamentoDoDia: Integer;
    function ImprimeConfiguracoesImpressora:Integer;
    function ImprimeDepartamentos: Integer;
    function RelatorioTipo60Analitico: Integer;
    function RelatorioTipo60Mestre: Integer;
    function VerificaImpressoraLigada: Integer;
    function ImpressaoCarne( Titulo, Percelas, Datas: string; Quantidade: integer; Texto, Cliente, RG_CPF, Cupom: string; Vias, Assina: integer ): Integer;
    function InfoBalanca( Porta: string; Modelo: integer; Peso, PrecoKilo, Total: string ): Integer;
    function DadosSintegra( DataInicio: string; DataFinal: string ): Integer;
    function IniciaModoTEF: Integer;
    function FinalizaModoTEF: Integer;
    function VersaoDll( Versao: String ): Integer;
    function RegistrosTipo60: Integer;
    function LeArquivoRetorno( Retorno: String ): Integer;
    function GeraRegistrosCAT52MFD( cArquivo: String; cData: String ): Integer;
    function GeraRegistrosCAT52MFDEx( cArquivo: String; cData: String; cArqDestino: String): Integer;
    function Analisa_iRetorno(): Integer;
    function GetRetorno: Integer;
    procedure SetRetorno(const Value: Integer);

    property Retorno: Integer read GetRetorno write SetRetorno;

    //assinatura digital
    function genkkey( cChavePublica: String; cChavePrivada: String ): integer;
    function setLibType( iTipo: integer ): integer;
    function generateEAD( cNomeArquivo: String; cChavePublica: String; cChavePrivada: String; cEAD:String; iSign: Integer): integer;
    function validateFile( cNomeArquivo: String; cChavePublica: String; cChavePrivada: String ): integer;
    function md5FromFile( NomeArq: String; MD5: String ): integer;

    //funções para impressora MFD
    function AbreCupomMFD(CGC: string; Nome: string; Endereco : string): Integer;
    function LeituraMemoriaFiscalDataMFD(DataInicial, DataFinal, FlagLeitura : string): Integer;
    function LeituraMemoriaFiscalReducaoMFD(ReducaoInicial, ReducaoFinal, FlagLeitura : string): Integer;
    function LeituraMemoriaFiscalSerialDataMFD(DataInicial, DataFinal, FlagLeitura : string): Integer;
    function LeituraMemoriaFiscalSerialReducaoMFD(ReducaoInicial, ReducaoFinal, FlagLeitura : string): Integer;
    function DownloadMFD( Arquivo: String; TipoDownload: String; ParametroInicial: String; ParametroFinal: String; UsuarioECF: String ): Integer;
    function ProgramaIDAplicativoMFD( Aplicativo: String): Integer;
    function HabilitaDesabilitaRetornoEstendidoMFD(FlagRetorno : string): Integer;
    function RetornoImpressoraMFD( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer; Var ST3: Integer ): Integer;
    
    //informações da impressora
    function NumeroCupom( NumeroCupom: String ): Integer;
 end;

  TBematech = class(TInterfacedObject, IFiscal)    //Bematech
  private
    lnRetorno: Integer;
    function GetRetorno: Integer;
    procedure SetRetorno(const Value: Integer);

    property Retorno: Integer read GetRetorno write SetRetorno;
  protected
    //funções do cupom fiscal
    function AbrirCupom(lcCpfCnpj: string): Integer;
    function VendeItem( Codigo: String; Descricao: String; Aliquota: String; TipoQuantidade: String; Quantidade: String; CasasDecimais: Integer; ValorUnitario: String; TipoDesconto: String; Desconto: String): Integer;
    function VendeItemDepartamento( Codigo: String; Descricao: String; Aliquota: String; ValorUnitario: String; Quantidade: String; Acrescimo: String; Desconto: String; IndiceDepartamento: String; UnidadeMedida: String): Integer;
    function CancelaItemAnterior: integer;
    function CancelaItemGenerico(NumeroItem: String ): Integer;
    function CancelaCupom: Integer;
    function EspacoEntreLinhas( Dots: Integer ): Integer;

    function IniciaFechamentoCupom(AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String ): Integer;
    function FechaCupom( FormaPagamento: String; AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String; ValorPago: String; Mensagem: String): Integer;
    function TerminaFechamentoCupom( Mensagem: String): Integer;

    function AlteraSimboloMoeda( SimboloMoeda: String ): Integer;
    function ProgramaHorarioVerao: Integer;
    function ProgramaAliquota( Aliquota: String; ICMS_ISS: Integer ): Integer;
    function ProgramaArredondamento: Integer;
    function ProgramaTruncamento: Integer;
    function EfetuaFormaPagamento( FormaPagamento: String; ValorFormaPagamento: String ): Integer;
    function EfetuaFormaPagamentoDescricaoForma( FormaPagamento: string; ValorFormaPagamento: string; DescricaoFormaPagto: string ): integer;
    function ResetaImpressora: Integer;
    function UsaUnidadeMedida( UnidadeMedida: String ): Integer;
    function AumentaDescricaoItem( Descricao: String ): Integer;
    function FlagsFiscais( Flag : integer ): Integer;
    function FlagsFiscaisStr( Flag : integer ): Integer;
    function NumeroSerie( NumeroSerie : string ): Integer;
    function GrandeTotal( GrandeTotal : string ): Integer;
    function NumeroSerieCriptografado( NumeroSerie : string ): Integer;

    //relatórios fiscais
    function LeituraX: Integer;
    function ReducaoZ( Data: String; Hora: String ): Integer;
    function RelatorioGerencial( Texto: String ): Integer;
    function FechaRelatorioGerencial: Integer;
    function LeituraMemoriaFiscalData( DataInicial: String; DataFinal: String ):Integer;
    function LeituraMemoriaFiscalReducao( ReducaoInicial: String; ReducaoFinal: String ): Integer;
    function LeituraMemoriaFiscalSerialData( DataInicial: String; DataFinal: String ): Integer;
    function MemoriaFiscalSerialReducao( ReducaoInicial: String; ReducaoFinal: String ): Integer;

    //operações não fiscais
    function RecebimentoNaoFiscal( IndiceTotalizador: String; Valor: String; FormaPagamento: String ): Integer;
    function AbreComprovanteNaoFiscalVinculado( FormaPagamento: String; Valor: String; NumeroCupom: String ): Integer;
    function UsaComprovanteNaoFiscalVinculado( Texto: String ): Integer;
    function UsaComprovanteNaoFiscalVinculadoTEF( Texto: String ): Integer;
    function FechaComprovanteNaoFiscalVinculado: Integer;
    function Sangria( Valor: String ): Integer;
    function Suprimento( Valor: String; FormaPagamento: String ): Integer;

    //funções para paf-ecf
    function AbreDocumentoAuxiliarVenda( cIndice: String; cTitulo: String; cNumeroDAV: String; cNomeEmitente: String; cCNPJ_CPFEmitente: String; cNomeDestinatario: String; CNPJ_CPFDestinatario:  String): Integer;
    function UsaDocumentoAuxiliarVenda( cMercadoria: String; cValorUnitario: String; cValorTotal: String ): Integer;
    function FechaDocumentoAuxiliarVenda( cTotal: String ): Integer;
    function TerminaFechamentoCupomPreVenda( cMD5: String; cNumeroPreVenda: String; cMensagemPromocional: String ): Integer;
    function DAVEmitidosRelatorioGerencial( cIndice: String; cDataInicial: String; cDataFinal:  String): Integer;
    function DAVEmitidosArquivo( cNomeArquivo: String; cDataInicial: String; cDataFinal: String; cChavePublica: String; cChavePrivada: String ): Integer;
    function LeituraMemoriaFiscalSerialDataPAFECF( cDataInicial: String; cDataFinal: String; cFlagLeitura: String; cChavePublica: String; cChavePrivada: String ): Integer;
    function LeituraMemoriaFiscalSerialReducaoPAFECF( cCRZInicial: String; cCRZFinal: String; cFlagLeitura: String; cChavePublica: String; cChavePrivada: String ): Integer;
    function EspelhoMFD( cNomeArquivoDestino: String; cDadoInicial: String; cDadoFinal: String; cTipoDownload: String; cUsuario: String; cChavePublica: String; cChavePrivada: String ): Integer;
    function ArquivoMFD( cNomeArquivoOrigem: String; cDadoInicial: String; cDadoFinal: String; cTipoDownload: String; cUsuario: String; iTipoGeracao: integer; cChavePublica: String; cChavePrivada: String; iUnicoArquivo: integer ): Integer;
    function IdentificacaoPAFECF( cIndice: String; cNumeroLaudo: String; cCNPJDesenvolvedor: String; cRazaoSocial: String; cEndereco: String; cTelefone: String; cContato: String; cNomeComercial: String; cVersao: String; cPrincipalExecutavel: String; cMD5PrincipalExecutavel: String; cDemaisArquivos: String; cMD5DemaisArquivos: String; cNumerosFabricacao: String ): Integer;
    function GrandeTotalCriptografado( cGTCriptografado: String ): Integer;
    function GrandeTotalDescriptografado( cGTCriptografado: String; cGTDescriptografado: String ): Integer;
    function AbreRelatorioMeiosPagamaneto( cIndice: String ): Integer;
    function UsaRelatorioMeiosPagamaneto ( cIdentificacao: String; cTipoDocumento: String; cValorAcumulado: String; cData: String ): Integer;
    function FechaRelatorioMeiosPagamento: Integer;
    function NomeiaRelatorioMeiosDePagamento: Integer;
    function NomeiaRelatorioDocumentoAuxiliarDeVenda: Integer;
    function NomeiaRelatorioDAVEmitidos: Integer;
    function NomeiaRelatorioIdentificacaoPAFECF: Integer;
    function NomeiaRelatoriosPAFECF: Integer;
    function NomeiaRelatorioGerencialMFD (Indice, Descricao : string): Integer;

    //outras funções
    function AbrePortaSerial: Integer;
    function RetornoImpressora(): Integer;
    function RetornaRetorno(Var ACK: Integer; Var ST1: Integer; Var ST2: Integer): Integer;
    function FechaPortaSerial: Integer;
    function MapaResumo:Integer;
    function AberturaDoDia( ValorCompra: string; FormaPagamento: string ): Integer;
    function FechamentoDoDia: Integer;
    function ImprimeConfiguracoesImpressora:Integer;
    function ImprimeDepartamentos: Integer;
    function RelatorioTipo60Analitico: Integer;
    function RelatorioTipo60Mestre: Integer;
    function VerificaImpressoraLigada: Integer;
    function ImpressaoCarne( Titulo, Percelas, Datas: string; Quantidade: integer; Texto, Cliente, RG_CPF, Cupom: string; Vias, Assina: integer ): Integer;
    function InfoBalanca( Porta: string; Modelo: integer; Peso, PrecoKilo, Total: string ): Integer;
    function DadosSintegra( DataInicio: string; DataFinal: string ): Integer;
    function IniciaModoTEF: Integer;
    function FinalizaModoTEF: Integer;
    function VersaoDll( Versao: String ): Integer;
    function RegistrosTipo60: Integer;
    function LeArquivoRetorno( Retorno: String ): Integer;
    function GeraRegistrosCAT52MFD( cArquivo: String; cData: String ): Integer;
    function GeraRegistrosCAT52MFDEx( cArquivo: String; cData: String; cArqDestino: String): Integer;
    function Analisa_iRetorno(): Integer;

    //assinatura digital
    function genkkey( cChavePublica: String; cChavePrivada: String ): integer;
    function setLibType( iTipo: integer ): integer;
    function generateEAD( cNomeArquivo: String; cChavePublica: String; cChavePrivada: String; cEAD:String; iSign: Integer): integer;
    function validateFile( cNomeArquivo: String; cChavePublica: String; cChavePrivada: String ): integer;
    function md5FromFile( NomeArq: String; MD5: String ): integer; 

    //funções para impressora MFD
    function AbreCupomMFD(CGC: string; Nome: string; Endereco : string): Integer;
    function LeituraMemoriaFiscalDataMFD(DataInicial, DataFinal, FlagLeitura : string): Integer;
    function LeituraMemoriaFiscalReducaoMFD(ReducaoInicial, ReducaoFinal, FlagLeitura : string): Integer;
    function LeituraMemoriaFiscalSerialDataMFD(DataInicial, DataFinal, FlagLeitura : string): Integer;
    function LeituraMemoriaFiscalSerialReducaoMFD(ReducaoInicial, ReducaoFinal, FlagLeitura : string): Integer;
    function DownloadMFD( Arquivo: String; TipoDownload: String; ParametroInicial: String; ParametroFinal: String; UsuarioECF: String ): Integer;
    function ProgramaIDAplicativoMFD( Aplicativo: String): Integer;
    function HabilitaDesabilitaRetornoEstendidoMFD(FlagRetorno : string): Integer;
    function RetornoImpressoraMFD( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer; Var ST3: Integer ): Integer;

    //informações da impressora
    function NumeroCupom( NumeroCupom: String ): Integer;
  public
    constructor Create;
  end;

  TDaruma = class(TInterfacedObject, IFiscal)     //Daruma
  private
    lnRetorno: Integer;
    function GetRetorno: Integer;
    procedure SetRetorno(const Value: Integer);

    property Retorno: Integer read GetRetorno write SetRetorno;
  protected
    //funções do cupom fiscal
    function AbrirCupom(lcCpfCnpj: string): Integer;
    function VendeItem( Codigo: String; Descricao: String; Aliquota: String; TipoQuantidade: String; Quantidade: String; CasasDecimais: Integer; ValorUnitario: String; TipoDesconto: String; Desconto: String): Integer;
    function VendeItemDepartamento( Codigo: String; Descricao: String; Aliquota: String; ValorUnitario: String; Quantidade: String; Acrescimo: String; Desconto: String; IndiceDepartamento: String; UnidadeMedida: String): Integer;
    function CancelaItemAnterior: integer;
    function CancelaItemGenerico(NumeroItem: String ): Integer;
    function CancelaCupom: Integer;
    function EspacoEntreLinhas( Dots: Integer ): Integer;

    function IniciaFechamentoCupom(AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String ): Integer;
    function FechaCupom( FormaPagamento: String; AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String; ValorPago: String; Mensagem: String): Integer;
    function TerminaFechamentoCupom( Mensagem: String): Integer;

    function AlteraSimboloMoeda( SimboloMoeda: String ): Integer;
    function ProgramaHorarioVerao: Integer;
    function ProgramaAliquota( Aliquota: String; ICMS_ISS: Integer ): Integer;
    function ProgramaArredondamento: Integer;
    function ProgramaTruncamento: Integer;
    function EfetuaFormaPagamento( FormaPagamento: String; ValorFormaPagamento: String ): Integer;
    function EfetuaFormaPagamentoDescricaoForma( FormaPagamento: string; ValorFormaPagamento: string; DescricaoFormaPagto: string ): integer;
    function ResetaImpressora: Integer;
    function UsaUnidadeMedida( UnidadeMedida: String ): Integer;
    function AumentaDescricaoItem( Descricao: String ): Integer;
    function FlagsFiscais( Flag : integer ): Integer;
    function FlagsFiscaisStr( Flag : integer ): Integer;
    function NumeroSerie( NumeroSerie : string ): Integer;
    function GrandeTotal( GrandeTotal : string ): Integer;
    function NumeroSerieCriptografado( NumeroSerie : string ): Integer;

    //relatórios fiscais
    function LeituraX: Integer;
    function ReducaoZ( Data: String; Hora: String ): Integer;
    function RelatorioGerencial( Texto: String ): Integer;
    function FechaRelatorioGerencial: Integer;
    function LeituraMemoriaFiscalData( DataInicial: String; DataFinal: String ):Integer;
    function LeituraMemoriaFiscalReducao( ReducaoInicial: String; ReducaoFinal: String ): Integer;
    function LeituraMemoriaFiscalSerialData( DataInicial: String; DataFinal: String ): Integer;
    function MemoriaFiscalSerialReducao( ReducaoInicial: String; ReducaoFinal: String ): Integer;

    //operações não fiscais
    function RecebimentoNaoFiscal( IndiceTotalizador: String; Valor: String; FormaPagamento: String ): Integer;
    function AbreComprovanteNaoFiscalVinculado( FormaPagamento: String; Valor: String; NumeroCupom: String ): Integer;
    function UsaComprovanteNaoFiscalVinculado( Texto: String ): Integer;
    function UsaComprovanteNaoFiscalVinculadoTEF( Texto: String ): Integer;
    function FechaComprovanteNaoFiscalVinculado: Integer;
    function Sangria( Valor: String ): Integer;
    function Suprimento( Valor: String; FormaPagamento: String ): Integer;

    //funções para paf-ecf
    function AbreDocumentoAuxiliarVenda( cIndice: String; cTitulo: String; cNumeroDAV: String; cNomeEmitente: String; cCNPJ_CPFEmitente: String; cNomeDestinatario: String; CNPJ_CPFDestinatario:  String): Integer;
    function UsaDocumentoAuxiliarVenda( cMercadoria: String; cValorUnitario: String; cValorTotal: String ): Integer;
    function FechaDocumentoAuxiliarVenda( cTotal: String ): Integer;
    function TerminaFechamentoCupomPreVenda( cMD5: String; cNumeroPreVenda: String; cMensagemPromocional: String ): Integer;
    function DAVEmitidosRelatorioGerencial( cIndice: String; cDataInicial: String; cDataFinal:  String): Integer;
    function DAVEmitidosArquivo( cNomeArquivo: String; cDataInicial: String; cDataFinal: String; cChavePublica: String; cChavePrivada: String ): Integer;
    function LeituraMemoriaFiscalSerialDataPAFECF( cDataInicial: String; cDataFinal: String; cFlagLeitura: String; cChavePublica: String; cChavePrivada: String ): Integer;
    function LeituraMemoriaFiscalSerialReducaoPAFECF( cCRZInicial: String; cCRZFinal: String; cFlagLeitura: String; cChavePublica: String; cChavePrivada: String ): Integer;
    function EspelhoMFD( cNomeArquivoDestino: String; cDadoInicial: String; cDadoFinal: String; cTipoDownload: String; cUsuario: String; cChavePublica: String; cChavePrivada: String ): Integer;
    function ArquivoMFD( cNomeArquivoOrigem: String; cDadoInicial: String; cDadoFinal: String; cTipoDownload: String; cUsuario: String; iTipoGeracao: integer; cChavePublica: String; cChavePrivada: String; iUnicoArquivo: integer ): Integer;
    function IdentificacaoPAFECF( cIndice: String; cNumeroLaudo: String; cCNPJDesenvolvedor: String; cRazaoSocial: String; cEndereco: String; cTelefone: String; cContato: String; cNomeComercial: String; cVersao: String; cPrincipalExecutavel: String; cMD5PrincipalExecutavel: String; cDemaisArquivos: String; cMD5DemaisArquivos: String; cNumerosFabricacao: String ): Integer;
    function GrandeTotalCriptografado( cGTCriptografado: String ): Integer;
    function GrandeTotalDescriptografado( cGTCriptografado: String; cGTDescriptografado: String ): Integer;
    function AbreRelatorioMeiosPagamaneto( cIndice: String ): Integer;
    function UsaRelatorioMeiosPagamaneto ( cIdentificacao: String; cTipoDocumento: String; cValorAcumulado: String; cData: String ): Integer;
    function FechaRelatorioMeiosPagamento: Integer;
    function NomeiaRelatorioMeiosDePagamento: Integer;
    function NomeiaRelatorioDocumentoAuxiliarDeVenda: Integer;
    function NomeiaRelatorioDAVEmitidos: Integer;
    function NomeiaRelatorioIdentificacaoPAFECF: Integer;
    function NomeiaRelatoriosPAFECF: Integer;
    function NomeiaRelatorioGerencialMFD (Indice, Descricao : string): Integer;

    //outras funções
    function AbrePortaSerial: Integer;
    function RetornoImpressora(): Integer;
    function RetornaRetorno(Var ACK: Integer; Var ST1: Integer; Var ST2: Integer): Integer;
    function FechaPortaSerial: Integer;
    function MapaResumo:Integer;
    function AberturaDoDia( ValorCompra: string; FormaPagamento: string ): Integer;
    function FechamentoDoDia: Integer;
    function ImprimeConfiguracoesImpressora:Integer;
    function ImprimeDepartamentos: Integer;
    function RelatorioTipo60Analitico: Integer;
    function RelatorioTipo60Mestre: Integer;
    function VerificaImpressoraLigada: Integer;
    function ImpressaoCarne( Titulo, Percelas, Datas: string; Quantidade: integer; Texto, Cliente, RG_CPF, Cupom: string; Vias, Assina: integer ): Integer;
    function InfoBalanca( Porta: string; Modelo: integer; Peso, PrecoKilo, Total: string ): Integer;
    function DadosSintegra( DataInicio: string; DataFinal: string ): Integer;
    function IniciaModoTEF: Integer;
    function FinalizaModoTEF: Integer;
    function VersaoDll( Versao: String ): Integer;
    function RegistrosTipo60: Integer;
    function LeArquivoRetorno( Retorno: String ): Integer;
    function GeraRegistrosCAT52MFD( cArquivo: String; cData: String ): Integer;
    function GeraRegistrosCAT52MFDEx( cArquivo: String; cData: String; cArqDestino: String): Integer;
    function Analisa_iRetorno(): Integer;

    //assinatura digital
    function genkkey( cChavePublica: String; cChavePrivada: String ): integer;
    function setLibType( iTipo: integer ): integer; 
    function generateEAD( cNomeArquivo: String; cChavePublica: String; cChavePrivada: String; cEAD:String; iSign: Integer): integer;
    function validateFile( cNomeArquivo: String; cChavePublica: String; cChavePrivada: String ): integer;
    function md5FromFile( NomeArq: String; MD5: String ): integer; 

    //funções para impressora MFD
    function AbreCupomMFD(CGC: string; Nome: string; Endereco : string): Integer;
    function LeituraMemoriaFiscalDataMFD(DataInicial, DataFinal, FlagLeitura : string): Integer;
    function LeituraMemoriaFiscalReducaoMFD(ReducaoInicial, ReducaoFinal, FlagLeitura : string): Integer;
    function LeituraMemoriaFiscalSerialDataMFD(DataInicial, DataFinal, FlagLeitura : string): Integer;
    function LeituraMemoriaFiscalSerialReducaoMFD(ReducaoInicial, ReducaoFinal, FlagLeitura : string): Integer;
    function DownloadMFD( Arquivo: String; TipoDownload: String; ParametroInicial: String; ParametroFinal: String; UsuarioECF: String ): Integer;
    function ProgramaIDAplicativoMFD( Aplicativo: String): Integer;
    function HabilitaDesabilitaRetornoEstendidoMFD(FlagRetorno : string): Integer;
    function RetornoImpressoraMFD( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer; Var ST3: Integer ): Integer;

    //informações da impressora
    function NumeroCupom( NumeroCupom: String ): Integer;
  end;

implementation

uses UPDV;


{TBematech}

function TBematech.AberturaDoDia(ValorCompra, FormaPagamento: string): Integer;
begin

end;

function TBematech.AbreComprovanteNaoFiscalVinculado(FormaPagamento, Valor,
  NumeroCupom: String): Integer;
type
  TMethod = function(const FormaPagamento, Valor, NumeroCupom: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_AbreComprovanteNaoFiscalVinculado');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            //lnRetorno := DllMethod(pChar(lcCpfCnpj));
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.AbreComprovanteNaoFiscalVinculado entre em contato com o suporte');
     end;
  end
end;

function TBematech.AbreCupomMFD(CGC, Nome, Endereco: string): Integer;
type
  TMethod = function(const CGC, Nome, Endereco: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_AbreCupomMFD');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(pChar(CGC), pchar(Nome), pchar(Endereco));
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.AbreCupomMFD entre em contato com o suporte');
     end;
  end
end;

function TBematech.AbreDocumentoAuxiliarVenda(cIndice, cTitulo, cNumeroDAV,
  cNomeEmitente, cCNPJ_CPFEmitente, cNomeDestinatario,
  CNPJ_CPFDestinatario: String): Integer;
type
  TMethod = function(const cIndice, cTitulo, cNumeroDAV, cNomeEmitente, cCNPJ_CPFEmitente, cNomeDestinatario,
                           CNPJ_CPFDestinatario: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_AbreDocumentoAuxiliarVenda');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            //lnRetorno := DllMethod(pChar(lcCpfCnpj));
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.AbreDocumentoAuxiliarVenda entre em contato com o suporte');
     end;
  end
end;

function TBematech.AbrePortaSerial: Integer;
begin

end;

function TBematech.AbreRelatorioMeiosPagamaneto(cIndice: String): Integer;
type
  TMethod = function(const cIndice: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_AbreRelatorioMeiosPagamaneto');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            //lnRetorno := DllMethod(pChar(lcCpfCnpj));
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.AbreRelatorioMeiosPagamaneto entre em contato com o suporte');
     end;
  end
end;

function TBematech.AbrirCupom(lcCpfCnpj: string): Integer;
type
  TMethod = function(const lcCpfCnpj: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_AbreCupom');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(pChar(lcCpfCnpj));
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.AbrirCupom entre em contato com o suporte');
     end;
  end
end;

function TBematech.IdentificacaoPAFECF(cIndice, cNumeroLaudo,
  cCNPJDesenvolvedor, cRazaoSocial, cEndereco, cTelefone, cContato,
  cNomeComercial, cVersao, cPrincipalExecutavel, cMD5PrincipalExecutavel,
  cDemaisArquivos, cMD5DemaisArquivos, cNumerosFabricacao: String): Integer;
type
  TMethod = function(const cIndice, cNumeroLaudo, cCNPJDesenvolvedor, cRazaoSocial, cEndereco, cTelefone, cContato,
                    cNomeComercial, cVersao, cPrincipalExecutavel, cMD5PrincipalExecutavel,
                    cDemaisArquivos, cMD5DemaisArquivos, cNumerosFabricacao: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_IdentificacaoPAFECF');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(pChar(cIndice), pChar(cNumeroLaudo), pChar(cCNPJDesenvolvedor), pChar(cRazaoSocial), pChar(cEndereco),
            pChar(cTelefone), pChar(cContato), pChar(cNomeComercial), pChar(cVersao), pChar(cPrincipalExecutavel), pChar(cMD5PrincipalExecutavel),
            pChar(cDemaisArquivos), pChar(cMD5DemaisArquivos), pChar(cNumerosFabricacao));
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.IdentificacaoPAFECF entre em contato com o suporte');
     end;
  end
end;

function TBematech.ImpressaoCarne(Titulo, Percelas, Datas: string;
  Quantidade: integer; Texto, Cliente, RG_CPF, Cupom: string; Vias,
  Assina: integer): Integer;
begin

end;

function TBematech.ImprimeConfiguracoesImpressora: Integer;
begin

end;

function TBematech.ImprimeDepartamentos: Integer;
begin

end;

function TBematech.InfoBalanca(Porta: string; Modelo: integer; Peso, PrecoKilo,
  Total: string): Integer;
begin

end;

function TBematech.IniciaFechamentoCupom(AcrescimoDesconto,
  TipoAcrescimoDesconto, ValorAcrescimoDesconto: String): Integer;
type
  TMethod = function(const AcrescimoDesconto, TipoAcrescimoDesconto, ValorAcrescimoDesconto: String):
                    Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_IniciaFechamentoCupom');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(AcrescimoDesconto, TipoAcrescimoDesconto, ValorAcrescimoDesconto); //passar os parametros
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.IniciaFechamentoCupom entre em contato com o suporte');
     end;
  end
end;

function TBematech.IniciaModoTEF: Integer;
begin

end;

function TBematech.LeArquivoRetorno(Retorno: String): Integer;
begin

end;

function TBematech.LeituraMemoriaFiscalData(DataInicial,
  DataFinal: String): Integer;
type
  TMethod = function(DataInicial, DataFinal: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_LeituraMemoriaFiscalData');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            //lnRetorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.LeituraMemoriaFiscalData entre em contato com o suporte');
     end;
  end
end;

function TBematech.LeituraMemoriaFiscalDataMFD(DataInicial, DataFinal,
  FlagLeitura: string): Integer;
type
  TMethod = function(DataInicial, DataFinal, FlagLeitura: string): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_LeituraMemoriaFiscalDataMFD');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(DataInicial, DataFinal, FlagLeitura);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.LeituraMemoriaFiscalDataMFD entre em contato com o suporte');
     end;
  end
end;

function TBematech.LeituraMemoriaFiscalReducao(ReducaoInicial,
  ReducaoFinal: String): Integer;
type
  TMethod = function(ReducaoInicial, ReducaoFinal: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_LeituraMemoriaFiscalReducao');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(ReducaoInicial, ReducaoFinal);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.LeituraMemoriaFiscalReducao entre em contato com o suporte');
     end;
  end
end;

function TBematech.LeituraMemoriaFiscalReducaoMFD(ReducaoInicial, ReducaoFinal,
  FlagLeitura: string): Integer;
type
  TMethod = function(ReducaoInicial, ReducaoFinal, FlagLeitura: string): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_LeituraMemoriaFiscalReducaoMFD');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(ReducaoInicial, ReducaoFinal, FlagLeitura);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.LeituraMemoriaFiscalReducaoMFD entre em contato com o suporte');
     end;
  end
end;

function TBematech.LeituraMemoriaFiscalSerialData(DataInicial,
  DataFinal: String): Integer;
type
  TMethod = function(): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_LeituraMemoriaFiscalSerialData');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            lnRetorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.LeituraMemoriaFiscalSerialData entre em contato com o suporte');
     end;
  end
end;

function TBematech.LeituraMemoriaFiscalSerialDataMFD(DataInicial, DataFinal,
  FlagLeitura: string): Integer;
type
  TMethod = function(const DataInicial, DataFinal, FlagLeitura: string): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_LeituraMemoriaFiscalSerialDataMFD');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(pchar(DataInicial), pchar(DataFinal), pchar(FlagLeitura));
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.LeituraMemoriaFiscalSerialDataMFD entre em contato com o suporte');
     end;
  end
end;

function TBematech.LeituraMemoriaFiscalSerialDataPAFECF(cDataInicial,
  cDataFinal, cFlagLeitura, cChavePublica, cChavePrivada: String): Integer;
type
  TMethod = function(const cDataInicial, cDataFinal, cFlagLeitura, cChavePublica, cChavePrivada: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_LeituraMemoriaFiscalSerialDataPAFECF');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(pChar(cDataInicial), pchar(cDataFinal), pchar(cFlagLeitura),
                                 pchar(cChavePublica), pchar(cChavePrivada));
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.LeituraMemoriaFiscalSerialDataPAFECF entre em contato com o suporte');
     end;
  end
end;

function TBematech.LeituraMemoriaFiscalSerialReducaoMFD(ReducaoInicial,
  ReducaoFinal, FlagLeitura: string): Integer;
type
  TMethod = function(const ReducaoInicial, ReducaoFinal, FlagLeitura: string): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_LeituraMemoriaFiscalSerialReducaoMFD');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(pchar(ReducaoInicial), pchar(ReducaoFinal), pchar(FlagLeitura));
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.LeituraMemoriaFiscalSerialReducaoMFD entre em contato com o suporte');
     end;
  end
end;

function TBematech.LeituraMemoriaFiscalSerialReducaoPAFECF(cCRZInicial,
  cCRZFinal, cFlagLeitura, cChavePublica, cChavePrivada: String): Integer;
type
  TMethod = function(const cCRZInicial, cCRZFinal, cFlagLeitura, cChavePublica, cChavePrivada: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_LeituraMemoriaFiscalSerialReducaoPAFECF');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(pChar(cCRZInicial), pchar(cCRZFinal), pchar(cFlagLeitura),
                                 pchar(cChavePublica), pchar(cChavePrivada));
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.LeituraMemoriaFiscalSerialReducaoPAFECF entre em contato com o suporte');
     end;
  end
end;

function TBematech.LeituraX: Integer;
type
  TMethod = function(): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(Application.ExeName) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_LeituraX');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod();
          end;
      finally
        FreeLibrary(loHInst);
      end;
  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.LeituraX entre em contato com o suporte');
     end;
  end
end;

function TBematech.MapaResumo: Integer;
begin

end;

function TBematech.md5FromFile(NomeArq, MD5: String): integer;
type
  TMethod = function(const NomeArq, MD5: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'sign_bema.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'md5FromFile');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(NomeArq, MD5);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.md5FromFile entre em contato com o suporte');
     end;
  end
end;

function TBematech.MemoriaFiscalSerialReducao(ReducaoInicial,
  ReducaoFinal: String): Integer;
type
  TMethod = function(const ReducaoInicial, ReducaoFinal: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_LeituraMemoriaFiscalSerialReducao');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            //lnRetorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.MemoriaFiscalSerialReducao entre em contato com o suporte');
     end;
  end
end;

function TBematech.NomeiaRelatorioDAVEmitidos: Integer;
type
  TMethod = function(): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_NomeiaRelatorioDAVEmitidos');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            lnRetorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.NomeiaRelatorioDAVEmitidos entre em contato com o suporte');
     end;
  end
end;

function TBematech.NomeiaRelatorioDocumentoAuxiliarDeVenda: Integer;
type
  TMethod = function(): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_NomeiaRelatorioDocumentoAuxiliarDeVenda');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            lnRetorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.NomeiaRelatorioDocumentoAuxiliarDeVenda entre em contato com o suporte');
     end;
  end
end;

function TBematech.NomeiaRelatorioGerencialMFD(Indice, Descricao: string): Integer;
type
  TMethod = function(Indice, Descricao: string): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_NomeiaRelatorioGerencialMFD');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(pChar(Indice), pChar(Descricao));
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.NomeiaRelatorioGerencialMFD entre em contato com o suporte');
     end;
  end
end;

function TBematech.NomeiaRelatorioIdentificacaoPAFECF: Integer;
type
  TMethod = function(): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_NomeiaRelatorioIdentificacaoPAFECF');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.NomeiaRelatorioIdentificacaoPAFECF entre em contato com o suporte');
     end;
  end
end;

function TBematech.NomeiaRelatorioMeiosDePagamento: Integer;
type
  TMethod = function(): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_NomeiaRelatorioMeiosDePagamento');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            lnRetorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.NomeiaRelatorioMeiosDePagamento entre em contato com o suporte');
     end;
  end
end;

function TBematech.NomeiaRelatoriosPAFECF: Integer;
type
  TMethod = function(): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_NomeiaRelatoriosPAFECF');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            lnRetorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.NomeiaRelatoriosPAFECF entre em contato com o suporte');
     end;
  end
end;

function TBematech.NumeroCupom(NumeroCupom: String): Integer;
type
  TMethod = function(NumeroCupom: string): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_NumeroCupom');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(NumeroCupom);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.NumeroCupom entre em contato com o suporte');
     end;
  end
end;

function TBematech.NumeroSerie(NumeroSerie: string): Integer;
type
  TMethod = function(const NumeroSerie: string): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_NumeroSerie');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(NumeroSerie);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.NumeroSerie entre em contato com o suporte');
     end;
  end
end;

function TBematech.NumeroSerieCriptografado(NumeroSerie: string): Integer;
type
  TMethod = function(const NumeroSerie: string): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_NumeroSerieCriptografado');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(NumeroSerie);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.NumeroSerieCriptografado entre em contato com o suporte');
     end;
  end
end;

function TBematech.ProgramaAliquota(Aliquota: String;
  ICMS_ISS: Integer): Integer;
type
  TMethod = function(const Aliquota: string; ICMS_ISS: Integer): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_ProgramaAliquota');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(Aliquota, ICMS_ISS);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.ProgramaAliquota entre em contato com o suporte');
     end;
  end
end;

function TBematech.ProgramaArredondamento: Integer;
type
  TMethod = function(): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_ProgramaArredondamento');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.ProgramaArredondamento entre em contato com o suporte');
     end;
  end
end;

function TBematech.ProgramaHorarioVerao: Integer;
type
  TMethod = function(): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_ProgramaHorarioVerao');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            //lnRetorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.ProgramaHorarioVerao entre em contato com o suporte');
     end;
  end
end;

function TBematech.ProgramaIDAplicativoMFD(Aplicativo: String): Integer;
type
  TMethod = function(Aplicativo: string): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_ProgramaIdAplicativoMFD');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(Aplicativo);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.ProgramaIDAplicativoMFD entre em contato com o suporte');
     end;
  end
end;

function TBematech.ProgramaTruncamento: Integer;
type
  TMethod = function(): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_ProgramaTruncamento');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.ProgramaTruncamento entre em contato com o suporte');
     end;
  end
end;

function TBematech.RecebimentoNaoFiscal(IndiceTotalizador, Valor,
  FormaPagamento: String): Integer;
type
  TMethod = function(IndiceTotalizador, Valor, FormaPagamento: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_RecebimentoNaoFiscal');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            //lnRetorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.RecebimentoNaoFiscal entre em contato com o suporte');
     end;
  end
end;

function TBematech.ReducaoZ(Data, Hora: String): Integer;
type
  TMethod = function(Data, Hora: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_ReducaoZ');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(Data, Hora);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.ReducaoZ entre em contato com o suporte');
     end;
  end
end;

function TBematech.RegistrosTipo60: Integer;
begin

end;

function TBematech.RelatorioGerencial(Texto: String): Integer;
type
  TMethod = function(const Texto: string): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_RelatorioGerencial');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(pChar(Texto));
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.RelatorioGerencial entre em contato com o suporte');
     end;
  end
end;

function TBematech.RelatorioTipo60Analitico: Integer;
begin

end;

function TBematech.RelatorioTipo60Mestre: Integer;
begin

end;

function TBematech.ResetaImpressora: Integer;
type
  TMethod = function(): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_ResetaImpressora');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            lnRetorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.ResetaImpressora entre em contato com o suporte');
     end;
  end
end;

function TBematech.RetornaRetorno(var ACK, ST1, ST2: Integer): Integer;
type
  TMethod = function(var ACK, ST1, ST2: Integer): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_RetornoImpressora');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(ACK, ST1, ST2);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.RetornaRetorno entre em contato com o suporte');
     end;
  end
end;

function TBematech.RetornoImpressora(): Integer;
var
  ACK, ST1, ST2, ST3: integer;
begin
  ACK := 0; ST1 := 0; ST2 := 0; ST3 := 0;
  try
    RetornaRetorno(ACK, ST1, ST2);
    If ACK = 6 then BEGIN
      // Verifica ST1
      IF ST1 >= 128 Then BEGIN ST1 := ST1 - 128; ShowMessage('Fim de Papel'); 					END;
      IF ST1 >= 64  Then BEGIN ST1 := ST1 - 64;  ShowMessage('Pouco Papel');  					END;
      IF ST1 >= 32  Then BEGIN ST1 := ST1 - 32;  ShowMessage('Erro no Relógio'); 				END;
      IF ST1 >= 16  Then BEGIN ST1 := ST1 - 16;  ShowMessage('Impressora em ERRO'); 			END;
      IF ST1 >= 8   Then BEGIN ST1 := ST1 - 8;   ShowMessage('CMD não iniciado com ESC'); 	END;
      IF ST1 >= 4   Then BEGIN ST1 := ST1 - 4;   ShowMessage('Comando Inexistente'); 			END;
      IF ST1 >= 2   Then BEGIN ST1 := ST1 - 2;   ShowMessage('Cupom Aberto'); 					END;
      IF ST1 >= 1   Then BEGIN ST1 := ST1 - 1;   ShowMessage('Nº de Parâmetros Inválidos'); END;

      // Verifica ST2
      IF ST2 >= 128 Then BEGIN ST2 := ST2 - 128; ShowMessage('Tipo de Parâmetro Inválido'); END;
      IF ST2 >= 64  Then BEGIN ST2 := ST2 - 64;  ShowMessage('Memória Fiscal Lotada'); 		END;
      IF ST2 >= 32  Then BEGIN ST2 := ST2 - 32;  ShowMessage('CMOS não Volátil'); 				END;
      IF ST2 >= 16  Then BEGIN ST2 := ST2 - 16;  ShowMessage('Alíquota Não Programada'); 	END;
      IF ST2 >= 8   Then BEGIN ST2 := ST2 - 8;   ShowMessage('Alíquotas lotadas'); 			END;
      IF ST2 >= 4   Then BEGIN ST2 := ST2 - 4;   ShowMessage('Cancelamento não Permitido'); END;
      IF ST2 >= 2   Then BEGIN ST2 := ST2 - 2;   ShowMessage('CGC/IE não Programados'); 		END;
      IF ST2 >= 1   Then BEGIN ST2 := ST2 - 1;   ShowMessage('Comando não Executado'); 		END;
    END;
    
    If ACK = 21 Then BEGIN
       showmessage( 'Atenção!!!' + #13 + #10 +
                    'A Impressora retornou NAK. O programa será abortado.');
       Application.Terminate;
       Exit;
    End;
  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.RetornoImpressora entre em contato com o suporte');
     end;
  end

end;

function TBematech.RetornoImpressoraMFD(var ACK, ST1, ST2, ST3: Integer): Integer;
type
  TMethod = function(var ACK, ST1, ST2, ST3: Integer): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_RetornoImpressoraMFD');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(ACK, ST1, ST2, ST3);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.RetornoImpressoraMFD entre em contato com o suporte');
     end;
  end
end;

function TBematech.Sangria(Valor: String): Integer;
type
  TMethod = function(Valor: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_Sangria');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(pchar(Valor));
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.Sangria entre em contato com o suporte');
     end;
  end
end;

function TBematech.setLibType(iTipo: integer): integer;
type
  TMethod = function(iTipo: integer): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'sign_bema.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'setLibType');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(iTipo);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.setLibType entre em contato com o suporte');
     end;
  end
end;

procedure TBematech.SetRetorno(const Value: Integer);
begin
  lnRetorno:= Value;
end;

function TBematech.Suprimento(Valor, FormaPagamento: String): Integer;
type
  TMethod = function(Valor, FormaPagamento: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_Suprimento');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(pchar(Valor), pchar(FormaPagamento));
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.Suprimento entre em contato com o suporte');
     end;
  end
end;

function TBematech.TerminaFechamentoCupom(Mensagem: String): Integer;
type
  TMethod = function(const Mensagem: string): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_TerminaFechamentoCupom');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(Mensagem);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.TerminaFechamentoCupom entre em contato com o suporte');
     end;
  end
end;

function TBematech.TerminaFechamentoCupomPreVenda(cMD5, cNumeroPreVenda,
  cMensagemPromocional: String): Integer;
type
  TMethod = function(cMD5, cNumeroPreVenda, cMensagemPromocional: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_TerminaFechamentoCupomPreVenda');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            //lnRetorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.TerminaFechamentoCupomPreVenda entre em contato com o suporte');
     end;
  end
end;

function TBematech.UsaComprovanteNaoFiscalVinculado(Texto: String): Integer;
type
  TMethod = function(const Texto: string): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_UsaComprovanteNaoFiscalVinculado');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            //lnRetorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.UsaComprovanteNaoFiscalVinculado entre em contato com o suporte');
     end;
  end
end;

function TBematech.UsaComprovanteNaoFiscalVinculadoTEF(Texto: String): Integer;
type
  TMethod = function(const Texto: string): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_UsaComprovanteNaoFiscalVinculadoTEF');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            //lnRetorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.UsaComprovanteNaoFiscalVinculadoTEF entre em contato com o suporte');
     end;
  end
end;

function TBematech.UsaDocumentoAuxiliarVenda(cMercadoria, cValorUnitario,
  cValorTotal: String): Integer;
type
  TMethod = function(cMercadoria, cValorUnitario, cValorTotal: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_UsaDocumentoAuxiliarVenda');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            //lnRetorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.UsaDocumentoAuxiliarVenda entre em contato com o suporte');
     end;
  end
end;

function TBematech.UsaRelatorioMeiosPagamaneto(cIdentificacao, cTipoDocumento,
  cValorAcumulado, cData: String): Integer;
type
  TMethod = function(cIdentificacao, cTipoDocumento, cValorAcumulado, cData: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_UsaRelatorioMeiosPagamaneto ');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            //lnRetorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.UsaRelatorioMeiosPagamaneto entre em contato com o suporte');
     end;
  end
end;

function TBematech.UsaUnidadeMedida(UnidadeMedida: String): Integer;
type
  TMethod = function(const UnidadeMedida: string): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_UsaUnidadeMedida');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(pchar(UnidadeMedida));
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.UsaUnidadeMedida entre em contato com o suporte');
     end;
  end
end;

function TBematech.validateFile(cNomeArquivo, cChavePublica,
  cChavePrivada: String): integer;
type
  TMethod = function(const cNomeArquivo, cChavePublica, cChavePrivada: String): Integer; stdcall;
var                        
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'sign_bema.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'validateFile');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(cNomeArquivo, cChavePublica, cChavePrivada);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.validateFile entre em contato com o suporte');
     end;
  end
end;

function TBematech.AlteraSimboloMoeda(SimboloMoeda: String): Integer;
type
  TMethod = function(const SimboloMoeda: string): Integer; stdcall;
var                        
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_AlteraSimboloMoeda');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(SimboloMoeda);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.AlteraSimboloMoeda entre em contato com o suporte');
     end;
  end
end;

function TBematech.Analisa_iRetorno: Integer;
begin
  if Retorno = 0 then
     Application.MessageBox( 'Erro de Comunicação !', 'Erro',
                              MB_IconError + MB_OK);

  If Retorno = -1 Then
     Application.MessageBox( 'Erro de Execução na Função. Verifique!', 'Erro',
                              MB_IconError + MB_OK);

  if Retorno = -2  then
     Application.MessageBox( 'Parâmetro Inválido !', 'Erro',
                              MB_IconError + MB_OK);

  if Retorno = -3  then
     Application.MessageBox( 'Alíquota não programada !', 'Atenção',
                              MB_IconInformation + MB_OK);

  If Retorno = -4 Then
     Application.MessageBox( 'Arquivo BemaFI32.INI não encontrado. Verifique!', 'Atenção',
                              MB_IconInformation + MB_OK);

  If Retorno = -5 Then
     Application.MessageBox( 'Erro ao Abrir a Porta de Comunicação', 'Erro',
                              MB_IconError + MB_OK);

  If Retorno = -6 Then
     Application.MessageBox( 'Impressora Desligada ou Desconectada', 'Atenção',
                              MB_IconInformation + MB_OK);

  If Retorno = -7 Then
     Application.MessageBox( 'Banco Não Cadastrado no Arquivo BemaFI32.ini', 'Atenção',
                              MB_IconInformation + MB_OK);

  If Retorno = -8 Then
     Application.MessageBox( 'Erro ao Criar ou Gravar no Arquivo Retorno.txt ou Status.txt', 'Erro',
                              MB_IconError + MB_OK);

  if Retorno = -18 then
     Application.MessageBox( 'Não foi possível abrir arquivo INTPOS.001 !', 'Atenção',
                              MB_IconInformation + MB_OK);

  if Retorno = -19 then
     Application.MessageBox( 'Parâmetro Diferentes !', 'Atenção',
                              MB_IconInformation + MB_OK);

  if Retorno = -20 then
     Application.MessageBox( 'Transação Cancelada pelo Operador !', 'Atenção',
                              MB_IconInformation + MB_OK);

  if Retorno = -21 then
     Application.MessageBox( 'A Transação não foi Aprovada !', 'Atenção',
                              MB_IconInformation + MB_OK);

  if Retorno = -22 then
     Application.MessageBox( 'Não foi Possível Terminar a Impressão !', 'Atenção',
                              MB_IconInformation + MB_OK);

  if Retorno = -23 then
     Application.MessageBox( 'Não foi Possível Terminar a Operação !', 'Atenção',
                              MB_IconInformation + MB_OK);

  if Retorno = -24 then
     Application.MessageBox( 'Forma de Pagamento não Programada.', 'Atenção',
                              MB_IconInformation + MB_OK);

  if Retorno = -25 then
     Application.MessageBox( 'Totalizador não Fiscal não Programado.', 'Atenção',
                              MB_IconInformation + MB_OK);

  if Retorno = -26 then
     Application.MessageBox( 'Transação já Efetuada !', 'Atenção',
                              MB_IconInformation + MB_OK);

  if Retorno = -28 then
     Application.MessageBox( 'Não há Informações para Serem Impressas !', 'Atenção',
                              MB_IconInformation + MB_OK);
end;

function TBematech.ArquivoMFD(cNomeArquivoOrigem, cDadoInicial, cDadoFinal,
  cTipoDownload, cUsuario: String; iTipoGeracao: integer; cChavePublica,
  cChavePrivada: String; iUnicoArquivo: integer): Integer;
type
  TMethod = function(cNomeArquivoOrigem, cDadoInicial, cDadoFinal,
                     cTipoDownload, cUsuario: String; iTipoGeracao: integer; cChavePublica,
                     cChavePrivada: String; iUnicoArquivo: integer): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_ArquivoMFD');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(pchar(cNomeArquivoOrigem), pchar(cDadoInicial), pchar(cDadoFinal),
                     pchar(cTipoDownload), pchar(cUsuario), iTipoGeracao, pchar(cChavePublica),
                     pchar(cChavePrivada), iUnicoArquivo);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.ArquivoMFD entre em contato com o suporte');
     end;
  end
end;

function TBematech.AumentaDescricaoItem(Descricao: String): Integer;
type
  TMethod = function(Descricao: String): Integer; stdcall;
var                        //como o CancelaCupom é somente integer, oq eu coloco no const????
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_AumentaDescricaoItem');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            //lnRetorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.AumentaDescricaoItem entre em contato com o suporte');
     end;
  end
end;


function TBematech.CancelaCupom: Integer;
type
  TMethod = function(): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_CancelaCupom');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod();
          end;
      finally
        FreeLibrary(loHInst);
      end;
  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.CancelaCupom entre em contato com o suporte');
     end;
  end
end;

function TBematech.CancelaItemGenerico(NumeroItem: String): Integer;
type
  TMethod = function(const NumeroItem: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_CancelaItemGenerico');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(pChar(NumeroItem)); // alimentar os parametros
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.CancelaItemGenerico entre em contato com o suporte');
     end;
  end
end;

constructor TBematech.Create;
begin
  inherited Create;
end;

function TBematech.DadosSintegra(DataInicio, DataFinal: string): Integer;
begin

end;

function TBematech.DAVEmitidosArquivo(cNomeArquivo, cDataInicial, cDataFinal,
  cChavePublica, cChavePrivada: String): Integer;
type
  TMethod = function(cNomeArquivo, cDataInicial, cDataFinal,
                     cChavePublica, cChavePrivada: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_DAVEmitidosArquivo ');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            //lnRetorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.DAVEmitidosArquivo entre em contato com o suporte');
     end;
  end
end;

function TBematech.DAVEmitidosRelatorioGerencial(cIndice, cDataInicial,
  cDataFinal: String): Integer;
type
  TMethod = function(cIndice, cDataInicial, cDataFinal: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_DAVEmitidosRelatorioGerencial ');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            //lnRetorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.DAVEmitidosRelatorioGerencial entre em contato com o suporte');
     end;
  end
end;

function TBematech.DownloadMFD(Arquivo, TipoDownload, ParametroInicial,
  ParametroFinal, UsuarioECF: String): Integer;
type
  TMethod = function(Arquivo, TipoDownload, ParametroInicial, ParametroFinal, UsuarioECF: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_EfetuaFormaPagamento');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(Arquivo, TipoDownload, ParametroInicial, ParametroFinal, UsuarioECF);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.DownloadMFD entre em contato com o suporte');
     end;
  end
end;

function TBematech.EfetuaFormaPagamento(FormaPagamento,
  ValorFormaPagamento: String): Integer;
type
  TMethod = function(FormaPagamento, ValorFormaPagamento: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_EfetuaFormaPagamento');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(FormaPagamento, ValorFormaPagamento);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.EfetuaFormaPagamento entre em contato com o suporte');
     end;
  end
end;

function TBematech.EfetuaFormaPagamentoDescricaoForma(FormaPagamento,
  ValorFormaPagamento, DescricaoFormaPagto: string): integer;
type
  TMethod = function(FormaPagamento, ValorFormaPagamento, DescricaoFormaPagto: string): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_EfetuaFormaPagamentoDescricaoForma');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(pChar(FormaPagamento), pChar(ValorFormaPagamento), pChar(DescricaoFormaPagto));
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.EfetuaFormaPagamentoDescricaoForma entre em contato com o suporte');
     end;
  end
end;

function TBematech.EspacoEntreLinhas(Dots: Integer): Integer;
type
  TMethod = function(Dots: integer): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_EspacoEntreLinhas');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(Dots);
          end;
      finally
        FreeLibrary(loHInst);
      end;
  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.EspacoEntreLinhas entre em contato com o suporte');
     end;
  end
end;

function TBematech.EspelhoMFD(cNomeArquivoDestino, cDadoInicial, cDadoFinal,
  cTipoDownload, cUsuario, cChavePublica, cChavePrivada: String): Integer;
type
  TMethod = function(cNomeArquivoDestino, cDadoInicial, cDadoFinal,
                     cTipoDownload, cUsuario, cChavePublica, cChavePrivada: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_EspelhoMFD');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(pchar(cNomeArquivoDestino), pchar(cDadoInicial), pchar(cDadoFinal),
                                 pchar(cTipoDownload), pchar(cUsuario), pchar(cChavePublica), pchar(cChavePrivada));
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.EspelhoMFD entre em contato com o suporte');
     end;
  end
end;

function TBematech.FechaComprovanteNaoFiscalVinculado: Integer;
type
  TMethod = function(): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_FechaComprovanteNaoFiscalVinculado');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            lnRetorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.FechaComprovanteNaoFiscalVinculado entre em contato com o suporte');
     end;
  end
end;

function TBematech.FechaCupom(FormaPagamento, AcrescimoDesconto,
  TipoAcrescimoDesconto, ValorAcrescimoDesconto, ValorPago,
  Mensagem: String): Integer;
type
  TMethod = function(FormaPagamento, AcrescimoDesconto,
                     TipoAcrescimoDesconto, ValorAcrescimoDesconto, ValorPago,
                     Mensagem: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_FechaCupom');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            lnRetorno := DllMethod(FormaPagamento, AcrescimoDesconto, TipoAcrescimoDesconto, ValorAcrescimoDesconto, ValorPago,
                                   Mensagem);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.FechaCupom entre em contato com o suporte');
     end;
  end
end;

function TBematech.FechaDocumentoAuxiliarVenda(cTotal: String): Integer;
type
  TMethod = function(cTotal: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_FechaDocumentoAuxiliarVenda ');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            //lnRetorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.FechaDocumentoAuxiliarVenda entre em contato com o suporte');
     end;
  end
end;

function TBematech.FechamentoDoDia: Integer;
begin

end;

function TBematech.FechaPortaSerial: Integer;
begin

end;

function TBematech.FechaRelatorioGerencial: Integer;
type
  TMethod = function(): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_FechaRelatorioGerencial');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            lnRetorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.FechaRelatorioGerencial entre em contato com o suporte');
     end;
  end
end;

function TBematech.FechaRelatorioMeiosPagamento: Integer;
type
  TMethod = function(): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_FechaRelatorioMeiosPagamento');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.FechaRelatorioMeiosPagamento entre em contato com o suporte');
     end;
  end
end;

function TBematech.FinalizaModoTEF: Integer;
begin

end;

function TBematech.FlagsFiscais( Flag: integer): Integer;
type
  TMethod = function(var Flag: Integer): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_FlagsFiscais');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod( Flag );
          end;
      finally
        FreeLibrary(loHInst);
      end;
  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.FlagsFiscais entre em contato com o suporte');
     end;
  end
end;

function TBematech.FlagsFiscaisStr(Flag: integer): Integer;
type
  TMethod = function(var Flag: Integer): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_FlagsFiscaisStr');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(Flag);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.FlagsFiscaisStr entre em contato com o suporte');
     end;
  end
end;

function TBematech.generateEAD(cNomeArquivo, cChavePublica, cChavePrivada,
  cEAD: String; iSign: Integer): integer;
type
  TMethod = function(cNomeArquivo, cChavePublica, cChavePrivada, cEAD: String; iSign: Integer): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'sign_bema.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'generateEAD');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(cNomeArquivo, cChavePublica, cChavePrivada, cEAD, iSign);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.generateEAD entre em contato com o suporte');
     end;
  end
end;

function TBematech.genkkey(cChavePublica, cChavePrivada: String): integer;
type
  TMethod = function(cChavePublica, cChavePrivada: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'sign_bema.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'genkkey');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(cChavePublica, cChavePrivada);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.genkkey entre em contato com o suporte');
     end;
  end
end;

function TBematech.GeraRegistrosCAT52MFD(cArquivo, cData: String): Integer;
begin

end;

function TBematech.GeraRegistrosCAT52MFDEx(cArquivo, cData,
  cArqDestino: String): Integer;
begin

end;

function TBematech.GetRetorno: Integer;
begin
  Result:= lnRetorno;
end;

function TBematech.GrandeTotal(GrandeTotal: string): Integer;
type
  TMethod = function(GrandeTotal: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_GrandeTotal');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(GrandeTotal);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.GrandeTotal entre em contato com o suporte');
     end;
  end
end;

function TBematech.GrandeTotalCriptografado(cGTCriptografado: String): Integer;
type
  TMethod = function(var cGTCriptografado: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_GrandeTotalCriptografado');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(cGTCriptografado);
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.GrandeTotalCriptografado entre em contato com o suporte');
     end;
  end
end;

function TBematech.GrandeTotalDescriptografado(cGTCriptografado, cGTDescriptografado: String): Integer;
type
  TMethod = function(cGTCriptografado, cGTDescriptografado: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_GrandeTotalDescriptografado');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(cGTCriptografado, pchar(cGTDescriptografado));
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.GrandeTotalDescriptografado entre em contato com o suporte');
     end;
  end
end;

function TBematech.HabilitaDesabilitaRetornoEstendidoMFD(FlagRetorno: string): Integer;
type
  TMethod = function(FlagRetorno: string): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_HabilitaDesabilitaRetornoEstendidoMFD');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(pChar(FlagRetorno));
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.HabilitaDesabilitaRetornoEstendidoMFD entre em contato com o suporte');
     end;
  end
end;

function TBematech.CancelaItemAnterior: integer;
type
  TMethod = function(): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
  //Carrega addl
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
      //Cahma o metodo em questao
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_CancelaItemAnterior');
        //se adll foi encontrada ele carrega o metodo se nao nao faz nada pq ele destroy o obj
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            lnRetorno := DllMethod();
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.CancelaItemAnterior entre em contato com o suporte');
     end;
  end
end;

function TBematech.VendeItem(Codigo, Descricao, Aliquota, TipoQuantidade, Quantidade: String; CasasDecimais: Integer; ValorUnitario, TipoDesconto, Desconto: String): Integer;
type
  TMethod = function(Codigo: String; Descricao: String; Aliquota: String; TipoQuantidade: String; Quantidade: String; CasasDecimais: Integer; ValorUnitario: String; TipoDesconto: String; Desconto: String):  Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_VendeItem');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            lnRetorno := DllMethod(pChar(Codigo), pchar(Descricao), pchar(Aliquota), pchar(TipoQuantidade), pchar(Quantidade), 2, pchar(ValorUnitario), pchar(TipoDesconto), pchar(Desconto));
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.VendeItem entre em contato com o suporte');
     end;
  end
end;

function TBematech.VendeItemDepartamento(Codigo, Descricao, Aliquota, ValorUnitario, Quantidade, Acrescimo, Desconto, IndiceDepartamento, UnidadeMedida: String): Integer;
type
  TMethod = function(Codigo: String; Descricao: String; Aliquota: String; ValorUnitario: String; Quantidade: String; Acrescimo: String; Desconto: String; IndiceDepartamento: String; UnidadeMedida: String): Integer; stdcall;
var
  loHInst  : THandle;
  FPointer : TFarProc;
  DllMethod: TMethod;
begin
  try
    loHInst := SafeLoadLibrary(ExtractFilePath(ParamStr(0)) + 'BEMAFI32.dll');
    if loHInst > 0 then
      try
        FPointer :=GetProcAddress(loHInst, 'Bematech_FI_VendeItemDepartamento');
        if FPointer <> nil then
          begin
            DllMethod := TMethod(FPointer);
            Retorno := DllMethod(pChar(Codigo), pChar(Descricao), pChar(Aliquota), pChar(ValorUnitario), pChar(Quantidade), pChar(Acrescimo), pChar(Desconto), pChar(IndiceDepartamento), pChar(UnidadeMedida));
          end;

      finally
        FreeLibrary(loHInst);
      end;

  except
    on E: Exception do
      begin
        ShowMessage('Error ' +  E.Message + ' Unidade: UFiscal  Rotina: TBematech.VendeItemDepartamento entre em contato com o suporte');
     end;
  end
end;

function TBematech.VerificaImpressoraLigada: Integer;
begin

end;

function TBematech.VersaoDll(Versao: String): Integer;
begin

end;

{ TDaruma }

function TDaruma.AberturaDoDia(ValorCompra, FormaPagamento: string): Integer;
begin

end;

function TDaruma.AbreComprovanteNaoFiscalVinculado(FormaPagamento, Valor,
  NumeroCupom: String): Integer;
begin

end;

function TDaruma.AbreCupomMFD(CGC, Nome, Endereco: string): Integer;
begin

end;

function TDaruma.AbreDocumentoAuxiliarVenda(cIndice, cTitulo, cNumeroDAV,
  cNomeEmitente, cCNPJ_CPFEmitente, cNomeDestinatario,
  CNPJ_CPFDestinatario: String): Integer;
begin

end;

function TDaruma.AbrePortaSerial: Integer;
begin

end;

function TDaruma.AbreRelatorioMeiosPagamaneto(cIndice: String): Integer;
begin

end;

function TDaruma.AbrirCupom(lcCpfCnpj: string): Integer;
begin

end;

function TDaruma.AlteraSimboloMoeda(SimboloMoeda: String): Integer;
begin

end;

function TDaruma.Analisa_iRetorno: Integer;
begin

end;

function TDaruma.ArquivoMFD(cNomeArquivoOrigem, cDadoInicial, cDadoFinal,
  cTipoDownload, cUsuario: String; iTipoGeracao: integer; cChavePublica,
  cChavePrivada: String; iUnicoArquivo: integer): Integer;
begin

end;

function TDaruma.AumentaDescricaoItem(Descricao: String): Integer;
begin

end;

function TDaruma.CancelaCupom: Integer;
begin

end;

function TDaruma.CancelaItemAnterior: integer;
begin

end;

function TDaruma.CancelaItemGenerico(NumeroItem: String): Integer;
begin

end;

function TDaruma.DadosSintegra(DataInicio, DataFinal: string): Integer;
begin

end;

function TDaruma.DAVEmitidosArquivo(cNomeArquivo, cDataInicial, cDataFinal,
  cChavePublica, cChavePrivada: String): Integer;
begin

end;

function TDaruma.DAVEmitidosRelatorioGerencial(cIndice, cDataInicial,
  cDataFinal: String): Integer;
begin

end;

function TDaruma.DownloadMFD(Arquivo, TipoDownload, ParametroInicial,
  ParametroFinal, UsuarioECF: String): Integer;
begin

end;

function TDaruma.EfetuaFormaPagamento(FormaPagamento,
  ValorFormaPagamento: String): Integer;
begin

end;

function TDaruma.EfetuaFormaPagamentoDescricaoForma(FormaPagamento,
  ValorFormaPagamento, DescricaoFormaPagto: string): integer;
begin

end;

function TDaruma.EspacoEntreLinhas(Dots: Integer): Integer;
begin

end;

function TDaruma.EspelhoMFD(cNomeArquivoDestino, cDadoInicial, cDadoFinal,
  cTipoDownload, cUsuario, cChavePublica, cChavePrivada: String): Integer;
begin

end;

function TDaruma.FechaComprovanteNaoFiscalVinculado: Integer;
begin

end;

function TDaruma.FechaCupom(FormaPagamento, AcrescimoDesconto,
  TipoAcrescimoDesconto, ValorAcrescimoDesconto, ValorPago,
  Mensagem: String): Integer;
begin

end;

function TDaruma.FechaDocumentoAuxiliarVenda(cTotal: String): Integer;
begin

end;

function TDaruma.FechamentoDoDia: Integer;
begin

end;

function TDaruma.FechaPortaSerial: Integer;
begin

end;

function TDaruma.FechaRelatorioGerencial: Integer;
begin

end;

function TDaruma.FechaRelatorioMeiosPagamento: Integer;
begin

end;

function TDaruma.FinalizaModoTEF: Integer;
begin

end;

function TDaruma.FlagsFiscais( Flag: integer): Integer;
begin

end;

function TDaruma.FlagsFiscaisStr(Flag: integer): Integer;
begin

end;

function TDaruma.generateEAD(cNomeArquivo, cChavePublica, cChavePrivada,
  cEAD: String; iSign: Integer): integer;
begin

end;

function TDaruma.genkkey(cChavePublica, cChavePrivada: String): integer;
begin

end;

function TDaruma.GeraRegistrosCAT52MFD(cArquivo, cData: String): Integer;
begin

end;

function TDaruma.GeraRegistrosCAT52MFDEx(cArquivo, cData,
  cArqDestino: String): Integer;
begin

end;

function TDaruma.GetRetorno: Integer;
begin

end;

function TDaruma.GrandeTotal(GrandeTotal: string): Integer;
begin

end;

function TDaruma.GrandeTotalCriptografado(cGTCriptografado: String): Integer;
begin

end;

function TDaruma.GrandeTotalDescriptografado(cGTCriptografado,
  cGTDescriptografado: String): Integer;
begin

end;

function TDaruma.HabilitaDesabilitaRetornoEstendidoMFD(
  FlagRetorno: string): Integer;
begin

end;

function TDaruma.IdentificacaoPAFECF(cIndice, cNumeroLaudo, cCNPJDesenvolvedor,
  cRazaoSocial, cEndereco, cTelefone, cContato, cNomeComercial, cVersao,
  cPrincipalExecutavel, cMD5PrincipalExecutavel, cDemaisArquivos,
  cMD5DemaisArquivos, cNumerosFabricacao: String): Integer;
begin

end;

function TDaruma.ImpressaoCarne(Titulo, Percelas, Datas: string;
  Quantidade: integer; Texto, Cliente, RG_CPF, Cupom: string; Vias,
  Assina: integer): Integer;
begin

end;

function TDaruma.ImprimeConfiguracoesImpressora: Integer;
begin

end;

function TDaruma.ImprimeDepartamentos: Integer;
begin

end;

function TDaruma.InfoBalanca(Porta: string; Modelo: integer; Peso, PrecoKilo,
  Total: string): Integer;
begin

end;

function TDaruma.IniciaFechamentoCupom(AcrescimoDesconto, TipoAcrescimoDesconto,
  ValorAcrescimoDesconto: String): Integer;
begin

end;

function TDaruma.IniciaModoTEF: Integer;
begin

end;

function TDaruma.LeArquivoRetorno(Retorno: String): Integer;
begin

end;

function TDaruma.LeituraMemoriaFiscalData(DataInicial,
  DataFinal: String): Integer;
begin

end;

function TDaruma.LeituraMemoriaFiscalDataMFD(DataInicial, DataFinal,
  FlagLeitura: string): Integer;
begin

end;

function TDaruma.LeituraMemoriaFiscalReducao(ReducaoInicial,
  ReducaoFinal: String): Integer;
begin

end;

function TDaruma.LeituraMemoriaFiscalReducaoMFD(ReducaoInicial, ReducaoFinal,
  FlagLeitura: string): Integer;
begin

end;

function TDaruma.LeituraMemoriaFiscalSerialData(DataInicial,
  DataFinal: String): Integer;
begin

end;

function TDaruma.LeituraMemoriaFiscalSerialDataMFD(DataInicial, DataFinal,
  FlagLeitura: string): Integer;
begin

end;

function TDaruma.LeituraMemoriaFiscalSerialDataPAFECF(cDataInicial, cDataFinal,
  cFlagLeitura, cChavePublica, cChavePrivada: String): Integer;
begin

end;

function TDaruma.LeituraMemoriaFiscalSerialReducaoMFD(ReducaoInicial,
  ReducaoFinal, FlagLeitura: string): Integer;
begin

end;

function TDaruma.LeituraMemoriaFiscalSerialReducaoPAFECF(cCRZInicial, cCRZFinal,
  cFlagLeitura, cChavePublica, cChavePrivada: String): Integer;
begin

end;

function TDaruma.LeituraX: Integer;
begin

end;

function TDaruma.MapaResumo: Integer;
begin

end;

function TDaruma.md5FromFile(NomeArq, MD5: String): integer;
begin

end;

function TDaruma.MemoriaFiscalSerialReducao(ReducaoInicial,
  ReducaoFinal: String): Integer;
begin

end;

function TDaruma.NomeiaRelatorioDAVEmitidos: Integer;
begin

end;

function TDaruma.NomeiaRelatorioDocumentoAuxiliarDeVenda: Integer;
begin

end;

function TDaruma.NomeiaRelatorioGerencialMFD(Indice,
  Descricao: string): Integer;
begin

end;

function TDaruma.NomeiaRelatorioIdentificacaoPAFECF: Integer;
begin

end;

function TDaruma.NomeiaRelatorioMeiosDePagamento: Integer;
begin

end;

function TDaruma.NomeiaRelatoriosPAFECF: Integer;
begin

end;

function TDaruma.NumeroCupom(NumeroCupom: String): Integer;
begin

end;

function TDaruma.NumeroSerie(NumeroSerie: string): Integer;
begin

end;

function TDaruma.NumeroSerieCriptografado(NumeroSerie: string): Integer;
begin

end;

function TDaruma.ProgramaAliquota(Aliquota: String; ICMS_ISS: Integer): Integer;
begin

end;

function TDaruma.ProgramaArredondamento: Integer;
begin

end;

function TDaruma.ProgramaHorarioVerao: Integer;
begin

end;

function TDaruma.ProgramaIDAplicativoMFD(Aplicativo: String): Integer;
begin

end;

function TDaruma.ProgramaTruncamento: Integer;
begin

end;

function TDaruma.RecebimentoNaoFiscal(IndiceTotalizador, Valor,
  FormaPagamento: String): Integer;
begin

end;

function TDaruma.ReducaoZ(Data, Hora: String): Integer;
begin

end;

function TDaruma.RegistrosTipo60: Integer;
begin

end;

function TDaruma.RelatorioGerencial(Texto: String): Integer;
begin

end;

function TDaruma.RelatorioTipo60Analitico: Integer;
begin

end;

function TDaruma.RelatorioTipo60Mestre: Integer;
begin

end;

function TDaruma.ResetaImpressora: Integer;
begin

end;

function TDaruma.RetornaRetorno(var ACK, ST1, ST2: Integer): Integer;
begin

end;

function TDaruma.RetornoImpressora(): Integer;
begin

end;

function TDaruma.RetornoImpressoraMFD(var ACK, ST1, ST2, ST3: Integer): Integer;
begin

end;

function TDaruma.Sangria(Valor: String): Integer;
begin

end;

function TDaruma.setLibType(iTipo: integer): integer;
begin

end;

procedure TDaruma.SetRetorno(const Value: Integer);
begin

end;

function TDaruma.Suprimento(Valor, FormaPagamento: String): Integer;
begin

end;

function TDaruma.TerminaFechamentoCupom(Mensagem: String): Integer;
begin

end;

function TDaruma.TerminaFechamentoCupomPreVenda(cMD5, cNumeroPreVenda,
  cMensagemPromocional: String): Integer;
begin

end;

function TDaruma.UsaComprovanteNaoFiscalVinculado(Texto: String): Integer;
begin

end;

function TDaruma.UsaComprovanteNaoFiscalVinculadoTEF(Texto: String): Integer;
begin

end;

function TDaruma.UsaDocumentoAuxiliarVenda(cMercadoria, cValorUnitario,
  cValorTotal: String): Integer;
begin

end;

function TDaruma.UsaRelatorioMeiosPagamaneto(cIdentificacao, cTipoDocumento,
  cValorAcumulado, cData: String): Integer;
begin

end;

function TDaruma.UsaUnidadeMedida(UnidadeMedida: String): Integer;
begin

end;

function TDaruma.validateFile(cNomeArquivo, cChavePublica,
  cChavePrivada: String): integer;
begin

end;

function TDaruma.VendeItem(Codigo, Descricao, Aliquota, TipoQuantidade,
  Quantidade: String; CasasDecimais: Integer; ValorUnitario, TipoDesconto,
  Desconto: String): Integer;
begin

end;

function TDaruma.VendeItemDepartamento(Codigo, Descricao, Aliquota,
  ValorUnitario, Quantidade, Acrescimo, Desconto, IndiceDepartamento,
  UnidadeMedida: String): Integer;
begin

end;

function TDaruma.VerificaImpressoraLigada: Integer;
begin

end;

function TDaruma.VersaoDll(Versao: String): Integer;
begin

end;

end.
