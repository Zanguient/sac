unit UImpressora_Fiscal;

interface

uses
  Classes;


type
  IImpressora_Fiscal = Interface
    function Abrir_Cupom: boolean;
    function Abrir_Cupom_Nominal(CPF, Nome, Endereco: AnsiString): boolean;
    function Vende_Item(Codigo, Descricao, Aliquota, Qtde, Valor, Desc_Acr, Tipo_Desc_Acr, Unidade, dOUa: AnsiString): boolean;
    procedure Cancela_Item(Item: Integer);
    //procedure Cancela_Item_Anterior;
    procedure Cancela_Cupom;

    //inicia fechamento
    function Inicia_Fechamento_Cupom(): boolean; overload;
    function Inicia_Fechamento_Cupom(P1: AnsiString): boolean; overload;
    function Inicia_Fechamento_Cupom(P1, P2: AnsiString): boolean; overload;
    function Inicia_Fechamento_Cupom(P1, P2, P3: AnsiString): boolean; overload;
    function Inicia_Fechamento_Cupom(P1, P2, P3, P4: AnsiString): boolean; overload;
    function Inicia_Fechamento_Cupom(P1, P2, P3, P4, P5: AnsiString): boolean; overload;

    //fecha cupom
    function Fecha_Cupom(cFormaPgto, cvalor: AnsiString; permite_tef: boolean): boolean; overload;

    //termina fechamento cupom
    function Termina_Fechamento_Cupom(Obs, MD5, DAV, DAVOS, PreVenda: AnsiString): boolean; overload;

    //pega
    procedure Pega_Contadores;
    procedure Pega_Numero_Cupom;
    procedure Pega_Data_Movimento;
    procedure Pega_Data_Hora_Documento;
    procedure Pega_Ultimo_Item;
    procedure Pega_Numero_Caixa;
    procedure Pega_Venda_Bruta_Diaria;
    procedure Pega_Sub_Total;
    procedure Pega_Data_Hora_Reducao;
    procedure Pega_Data_Inicio_Documento;
    procedure Pega_Grande_Total;
    procedure Pega_COO_Inicial_Final;
    procedure Pega_Totalizador_Parcial;
    procedure Pega_Data_Hora_GravacaoSWBasicoMFAdicional;
    procedure Pega_Versao_Impressora;
    procedure Pega_Dados_Principais_ECF;

    //verificações
    function Verifica_Impressora_Ligada_Sem_Mensagem: boolean;
    procedure Verifica_Impressora_Ligada;
    procedure Verifica_Cupom_Aberto;
    function Verifica_Fim_Papel_Sem_Mensagem: boolean;
    procedure Verifica_Fim_Papel;
    function Verifica_Pouco_Papel: boolean;

    function Reducao_Z_Pendente: boolean;
    function Verifica_Requer_X: boolean;
    function Verifica_ECF_Bloqueado: Boolean;
    function Verifica_ECF_Livre: Boolean;

    procedure Abre_Movimento; overload;
    procedure Abre_Movimento(P1: AnsiString); overload;
    procedure Abre_Movimento(P1, P2: AnsiString); overload;

    procedure Efetua_Reducao_Z(P1: TDateTime); overload;
    procedure Efetua_Reducao_Z(P1, P2: AnsiString); overload;
    procedure Efetua_Reducao_Z(P1, P2, P3: AnsiString); overload;
    procedure LeituraX;
    procedure Abre_Porta;
    procedure Ativa_ACBr;

    procedure Programa_Forma_PG(Descricao: String; TEF: boolean);
    procedure Suprimento(P1, P2: AnsiString);
    procedure Sangria(P1, P2: AnsiString);

    function Abre_Comprovante_Vinculado(COO, FormaPG, Valor: AnsiString): boolean;
    function Imprime_Comprovante_Vinculado(P1: AnsiString): boolean;
    function Corta_Papel: boolean;
    function Fecha_Relatorio: boolean;
    function Imprime_Relatorio_Gerencial(P1: AnsiString): boolean;overload;
    function Imprime_Relatorio_Gerencial(var P1: TStringList): boolean;overload;
    function Acha_RG_Descricao(Descricao: AnsiString): AnsiString;
    procedure Horario_Verao;
end;

implementation

end.
