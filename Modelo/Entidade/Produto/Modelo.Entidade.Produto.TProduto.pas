unit Modelo.Entidade.Produto.TProduto;

interface
  type
    TipoProdutoEnum = (PRODUTO, SERVICO);
    StatusEnum = (ATIVO, INATIVO);
    PrecisaoEnum  = (TRUNCAMENTO, ARREDONDAMENTO);
    ProducaoPropriaEnum = (TERCEIROS, PROPRIA);
    EmEstoqueMaximoEnum = (PERMITIR_VENDA, EXIBIR_MENSAGEM_DE_ALERTA);

    TProdutoEntidade = class
      private
        FCodigo                       : Integer;
        FTipoProduto                  : TipoProdutoEnum;
        FEmpresaCodigo                : Integer;
        FStatus                       : StatusEnum;
        FGeraComicssao                : String;
        FAceitaDevolucao              : String;
        FPrecisao                     : PrecisaoEnum;
        FProducaoPropria              : ProducaoPropriaEnum;
        FCodigoOriginal               : string;
        FCodigoVenda                  : string;
        FDescricao                    : string;
        FCodigoBaras                  : string;
        FFornecedorCodigo             : Integer;
        FFabricanteCodigo             : Integer;
        FMarcaCodigo                  : Integer;
        FUnidadeMedidaCodigo          : Integer;
        FGrupoCodigo                  : Integer;
        FGrupoTributacaoCodigo        : Integer;
        FGrupoTributacaoIPICodigo     : Integer;
        FGrupoTributacaoPISCodigo     : Integer;
        FGrupoTributacaoCOFINSCodigo  : Integer;
        FGrupoTributacaoISSQNCodigo   : Integer;
        FCodigoLocal                  : Integer;
        FDataFabricacao               : TDate;
        FDataValidade                 : TDate;
        FUltima_Compra                : TDate;
        FValorCompra                  : Double;
        FValorMedio                   : Double;
        FSaldoEstoque                 : Double;
        FValorUltimaCompra            : Double;
        FEstoqueMinimo                : Double;
        FEstoqueMaximo                : Double;
        FEstoque                      : Double;
        FEstoqueReservado             : Double;
        FVolume                       : Double;
        FVolumeTotal                  : Double;
        FEmEstoqueMaximo              : EmEstoqueMaximoEnum;
        FDataCadastro                 : TDateTime;
        FDataAtualizacaoEstoque       : TDateTime;
        FStatusEstoque                : string;
        FNCM                          : string;
        FAplicacao                    : string;
        FCodigoSimilar                : string;
        FValorCompraUnitario          : Double;
        FValorUltimaCompraUnitario    : Double;
        FMD5                          : AnsiString;

        procedure SetAceitaDevolucao(const Value: String);
        procedure SetAplicacao(const Value: string);
        procedure SetCodigo(const Value: Integer);
        procedure SetCodigoBaras(const Value: string);
        procedure SetCodigoLocal(const Value: Integer);
        procedure SetCodigoOriginal(const Value: string);
        procedure SetCodigoSimilar(const Value: string);
        procedure SetCodigoVenda(const Value: string);
        procedure SetDataAtualizacaoEstoque(const Value: TDateTime);
        procedure SetDataCadastro(const Value: TDateTime);
        procedure SetDataFabricacao(const Value: TDate);
        procedure SetDataValidade(const Value: TDate);
        procedure SetDescricao(const Value: string);
        procedure SetEmEstoqueMaximo(const Value: EmEstoqueMaximoEnum);
        procedure SetEmpresaCodigo(const Value: Integer);
        procedure SetEstoque(const Value: Double);
        procedure SetEstoqueMaximo(const Value: Double);
        procedure SetEstoqueMinimo(const Value: Double);
        procedure SetEstoqueReservado(const Value: Double);
        procedure SetFabricanteCodigo(const Value: Integer);
        procedure SetFornecedorCodigo(const Value: Integer);
        procedure SetGeraComicssao(const Value: String);
        procedure SetGrupoCodigo(const Value: Integer);
        procedure SetGrupoTributacaoCodigo(const Value: Integer);
        procedure SetGrupoTributacaoCOFINSCodigo(const Value: Integer);
        procedure SetGrupoTributacaoIPICodigo(const Value: Integer);
        procedure SetGrupoTributacaoISSQNCodigo(const Value: Integer);
        procedure SetGrupoTributacaoPISCodigo(const Value: Integer);
        procedure SetMarcaCodigo(const Value: Integer);
        procedure SetNCM(const Value: string);
        procedure SetPrecisao(const Value: PrecisaoEnum);
        procedure SetProducaoPropria(const Value: ProducaoPropriaEnum);
        procedure SetSaldoEstoque(const Value: Double);
        procedure SetStatus(const Value: StatusEnum);
        procedure SetStatusEstoque(const Value: string);
        procedure SetTipoProduto(const Value: TipoProdutoEnum);
        procedure SetUltima_Compra(const Value: TDate);
        procedure SetUnidadeMedidaCodigo(const Value: Integer);
        procedure SetValorCompra(const Value: Double);
        procedure SetValorCompraUnitario(const Value: Double);
        procedure SetValorMedio(const Value: Double);
        procedure SetValorUltimaCompra(const Value: Double);
        procedure SetValorUltimaCompraUnitario(const Value: Double);
        procedure SetVolume(const Value: Double);
        procedure SetVolumeTotal(const Value: Double);
    procedure SetMD5(const Value: AnsiString);

      public
        property Codigo                       : Integer read FCodigo write SetCodigo;
        property MD5                          : AnsiString read FMD5 write SetMD5;
        property TipoProduto                  : TipoProdutoEnum read FTipoProduto write SetTipoProduto;
        property EmpresaCodigo                : Integer read FEmpresaCodigo write SetEmpresaCodigo;
        property Status                       : StatusEnum read FStatus write SetStatus;
        property GeraComicssao                : String read FGeraComicssao write SetGeraComicssao;
        property AceitaDevolucao              : String read FAceitaDevolucao write SetAceitaDevolucao;
        property Precisao                     : PrecisaoEnum read FPrecisao write SetPrecisao;
        property ProducaoPropria              : ProducaoPropriaEnum read FProducaoPropria write SetProducaoPropria;
        property CodigoOriginal               : string read FCodigoOriginal write SetCodigoOriginal;
        property CodigoVenda                  : string read FCodigoVenda write SetCodigoVenda;
        property Descricao                    : string read FDescricao write SetDescricao;
        property CodigoBaras                  : string read FCodigoBaras write SetCodigoBaras;
        property FornecedorCodigo             : Integer read FFornecedorCodigo write SetFornecedorCodigo;
        property FabricanteCodigo             : Integer read FFabricanteCodigo write SetFabricanteCodigo;
        property MarcaCodigo                  : Integer read FMarcaCodigo write SetMarcaCodigo;
        property UnidadeMedidaCodigo          : Integer read FUnidadeMedidaCodigo write SetUnidadeMedidaCodigo;
        property GrupoCodigo                  : Integer read FGrupoCodigo write SetGrupoCodigo;
        property GrupoTributacaoCodigo        : Integer read FGrupoTributacaoCodigo write SetGrupoTributacaoCodigo;
        property GrupoTributacaoIPICodigo     : Integer read FGrupoTributacaoIPICodigo write SetGrupoTributacaoIPICodigo;
        property GrupoTributacaoPISCodigo     : Integer read FGrupoTributacaoPISCodigo write SetGrupoTributacaoPISCodigo;
        property GrupoTributacaoCOFINSCodigo  : Integer read FGrupoTributacaoCOFINSCodigo write SetGrupoTributacaoCOFINSCodigo;
        property GrupoTributacaoISSQNCodigo   : Integer read FGrupoTributacaoISSQNCodigo write SetGrupoTributacaoISSQNCodigo;
        property CodigoLocal                  : Integer read FCodigoLocal write SetCodigoLocal;
        property DataFabricacao               : TDate read FDataFabricacao write SetDataFabricacao;
        property DataValidade                 : TDate read FDataValidade write SetDataValidade;
        property Ultima_Compra                : TDate read FUltima_Compra write SetUltima_Compra;
        property ValorCompra                  : Double read FValorCompra write SetValorCompra;
        property ValorMedio                   : Double read FValorMedio write SetValorMedio;
        property SaldoEstoque                 : Double read FSaldoEstoque write SetSaldoEstoque;
        property ValorUltimaCompra            : Double read FValorUltimaCompra write SetValorUltimaCompra;
        property EstoqueMinimo                : Double read FEstoqueMinimo write SetEstoqueMinimo;
        property EstoqueMaximo                : Double read FEstoqueMaximo write SetEstoqueMaximo;
        property Estoque                      : Double read FEstoque write SetEstoque;
        property EstoqueReservado             : Double read FEstoqueReservado write SetEstoqueReservado;
        property Volume                       : Double read FVolume write SetVolume;
        property VolumeTotal                  : Double read FVolumeTotal write SetVolumeTotal;
        property EmEstoqueMaximo              : EmEstoqueMaximoEnum read FEmEstoqueMaximo write SetEmEstoqueMaximo;
        property DataCadastro                 : TDateTime read FDataCadastro write SetDataCadastro;
        property DataAtualizacaoEstoque       : TDateTime read FDataAtualizacaoEstoque write SetDataAtualizacaoEstoque;
        property StatusEstoque                : string read FStatusEstoque write SetStatusEstoque;
        property NCM                          : string read FNCM write SetNCM;
        property Aplicacao                    : string read FAplicacao write SetAplicacao;
        property CodigoSimilar                : string read FCodigoSimilar write SetCodigoSimilar;
        property ValorCompraUnitario          : Double read FValorCompraUnitario write SetValorCompraUnitario;
        property ValorUltimaCompraUnitario    : Double read FValorUltimaCompraUnitario write SetValorUltimaCompraUnitario;
      end;

implementation

{ TProdutoEntidade }

procedure TProdutoEntidade.SetAceitaDevolucao(const Value: String);
begin
  FAceitaDevolucao := Value;
end;

procedure TProdutoEntidade.SetAplicacao(const Value: string);
begin
  FAplicacao := Value;
end;

procedure TProdutoEntidade.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TProdutoEntidade.SetCodigoBaras(const Value: string);
begin
  FCodigoBaras := Value;
end;

procedure TProdutoEntidade.SetCodigoLocal(const Value: Integer);
begin
  FCodigoLocal := Value;
end;

procedure TProdutoEntidade.SetCodigoOriginal(const Value: string);
begin
  FCodigoOriginal := Value;
end;

procedure TProdutoEntidade.SetCodigoSimilar(const Value: string);
begin
  FCodigoSimilar := Value;
end;

procedure TProdutoEntidade.SetCodigoVenda(const Value: string);
begin
  FCodigoVenda := Value;
end;

procedure TProdutoEntidade.SetDataAtualizacaoEstoque(const Value: TDateTime);
begin
  FDataAtualizacaoEstoque := Value;
end;

procedure TProdutoEntidade.SetDataCadastro(const Value: TDateTime);
begin
  FDataCadastro := Value;
end;

procedure TProdutoEntidade.SetDataFabricacao(const Value: TDate);
begin
  FDataFabricacao := Value;
end;

procedure TProdutoEntidade.SetDataValidade(const Value: TDate);
begin
  FDataValidade := Value;
end;

procedure TProdutoEntidade.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProdutoEntidade.SetEmEstoqueMaximo(const Value: EmEstoqueMaximoEnum);
begin
  FEmEstoqueMaximo := Value;
end;

procedure TProdutoEntidade.SetEmpresaCodigo(const Value: Integer);
begin
  FEmpresaCodigo := Value;
end;

procedure TProdutoEntidade.SetEstoque(const Value: Double);
begin
  FEstoque := Value;
end;

procedure TProdutoEntidade.SetEstoqueMaximo(const Value: Double);
begin
  FEstoqueMaximo := Value;
end;

procedure TProdutoEntidade.SetEstoqueMinimo(const Value: Double);
begin
  FEstoqueMinimo := Value;
end;

procedure TProdutoEntidade.SetEstoqueReservado(const Value: Double);
begin
  FEstoqueReservado := Value;
end;

procedure TProdutoEntidade.SetFabricanteCodigo(const Value: Integer);
begin
  FFabricanteCodigo := Value;
end;

procedure TProdutoEntidade.SetFornecedorCodigo(const Value: Integer);
begin
  FFornecedorCodigo := Value;
end;

procedure TProdutoEntidade.SetGeraComicssao(const Value: String);
begin
  FGeraComicssao := Value;
end;

procedure TProdutoEntidade.SetGrupoCodigo(const Value: Integer);
begin
  FGrupoCodigo := Value;
end;

procedure TProdutoEntidade.SetGrupoTributacaoCodigo(const Value: Integer);
begin
  FGrupoTributacaoCodigo := Value;
end;

procedure TProdutoEntidade.SetGrupoTributacaoCOFINSCodigo(const Value: Integer);
begin
  FGrupoTributacaoCOFINSCodigo := Value;
end;

procedure TProdutoEntidade.SetGrupoTributacaoIPICodigo(const Value: Integer);
begin
  FGrupoTributacaoIPICodigo := Value;
end;

procedure TProdutoEntidade.SetGrupoTributacaoISSQNCodigo(const Value: Integer);
begin
  FGrupoTributacaoISSQNCodigo := Value;
end;

procedure TProdutoEntidade.SetGrupoTributacaoPISCodigo(const Value: Integer);
begin
  FGrupoTributacaoPISCodigo := Value;
end;

procedure TProdutoEntidade.SetMarcaCodigo(const Value: Integer);
begin
  FMarcaCodigo := Value;
end;

procedure TProdutoEntidade.SetMD5(const Value: AnsiString);
begin
  FMD5 := Value;
end;

procedure TProdutoEntidade.SetNCM(const Value: string);
begin
  FNCM := Value;
end;

procedure TProdutoEntidade.SetPrecisao(const Value: PrecisaoEnum);
begin
  FPrecisao := Value;
end;

procedure TProdutoEntidade.SetProducaoPropria(const Value: ProducaoPropriaEnum);
begin
  FProducaoPropria := Value;
end;

procedure TProdutoEntidade.SetSaldoEstoque(const Value: Double);
begin
  FSaldoEstoque := Value;
end;

procedure TProdutoEntidade.SetStatus(const Value: StatusEnum);
begin
  FStatus := Value;
end;

procedure TProdutoEntidade.SetStatusEstoque(const Value: string);
begin
  FStatusEstoque := Value;
end;

procedure TProdutoEntidade.SetTipoProduto(const Value: TipoProdutoEnum);
begin
  FTipoProduto := Value;
end;

procedure TProdutoEntidade.SetUltima_Compra(const Value: TDate);
begin
  FUltima_Compra := Value;
end;

procedure TProdutoEntidade.SetUnidadeMedidaCodigo(const Value: Integer);
begin
  FUnidadeMedidaCodigo := Value;
end;

procedure TProdutoEntidade.SetValorCompra(const Value: Double);
begin
  FValorCompra := Value;
end;

procedure TProdutoEntidade.SetValorCompraUnitario(const Value: Double);
begin
  FValorCompraUnitario := Value;
end;

procedure TProdutoEntidade.SetValorMedio(const Value: Double);
begin
  FValorMedio := Value;
end;

procedure TProdutoEntidade.SetValorUltimaCompra(const Value: Double);
begin
  FValorUltimaCompra := Value;
end;

procedure TProdutoEntidade.SetValorUltimaCompraUnitario(const Value: Double);
begin
  FValorUltimaCompraUnitario := Value;
end;

procedure TProdutoEntidade.SetVolume(const Value: Double);
begin
  FVolume := Value;
end;

procedure TProdutoEntidade.SetVolumeTotal(const Value: Double);
begin
  FVolumeTotal := Value;
end;

end.
