unit DadosEmissaoNFE;

interface
uses
  System.Generics.Collections, DadosEmissaoNFEPagamento, DadosEmissaoNFEItens, DadosEmissaoNFERecebimento;
type
  TDadosEmissaoNFE = class
  private
    FCFOP: AnsiString;
    FFormaPagamento: Integer; //0-A Vista 1-A Prazo 2-Outros
    FModelo: AnsiString;
    FSerie: AnsiString;
    FNNF: Integer;
    FDataSaida: AnsiString;
    FHoraSaida: AnsiString;
    FDataEmissao: AnsiString;
    FTipoOperacao: Integer; //0-Entrada 1-Saida
    FFormaEmissao: AnsiString;
    FAmbiente: AnsiString;
    FVersaoEXE: AnsiString;
    FDestinatarioNome: AnsiString;
    FDestinatarioCNPJ: AnsiString;
    FDestinatarioRazaoSocial: AnsiString;
    FDestinatarioEndereco: AnsiString;
    FDestinatarioNumero: AnsiString;
    FDestinatarioComplemento: AnsiString;
    FDestinatarioSetor: AnsiString;
    FDestinatarioCodigoMunicipio: AnsiString;
    FDestinatarioMunicipio: AnsiString;
    FDestinatarioUF: AnsiString;
    FDestinatarioTelefone: AnsiString;
    FDestinatarioIE: AnsiString;
    FDestinatarioIM: AnsiString;
    FDestinatarioCEP: AnsiString;
    FDestinatarioEmail: AnsiString;
    FDestinatarioSuframa: AnsiString;
    FDestinatarioEnquadramento: AnsiString;
    FFinalidade: AnsiString;
    FImpostoTotalBC: Double;
    FImpostoTotalICMS: Double;
    FImpostoTotalBCST: Double;
    FImpostoTotalST: Double;
    FImpostoTotalVProduto: Double;
    FImpostoTotalVFrete: Double;
    FImpostoTotalVSeguro: Double;
    FImpostoTotalVDesc: Double;
    FImpostoTotalVIPI: Double;
    FImpostoTotalVPIS: Double;
    FImpostoTotalVCOFINS: Double;
    FImpostoTotalVOutros: Double;
    FImpostoTotalVNF: Double;
    FImpostoTotalVServico: Double;
    FImpostoTotalBCServico: Double;
    FImpostoTotalVISS: Double;
    FTipoFrete: integer; // 0-Emitente 1-Destinatario 2-Terceiros 3-Sem Frete
    FTransportadoraCNPJ: AnsiString;
    FTransportadoraNome: AnsiString;
    FTransportadoraIE: AnsiString;
    FTransportadoraEndereco: AnsiString;
    FTransportadoraMunicipio: AnsiString;
    FTransportadoraUF: AnsiString;
    FVeiculoPlaca: AnsiString;
    FVeiculoUF: AnsiString;
    FVeiculoRNTC: AnsiString;
    FReboquePlaca: AnsiString;
    FReboqueUF: AnsiString;
    FReboqueRNTC: AnsiString;
    FVolumeQtTransportada: AnsiString;
    FVolumeEspecie: AnsiString;
    FVolumeMarca: AnsiString;
    FVolumeNVolume: AnsiString;
    FVolumePesoL: AnsiString;
    FVolumePesoB: AnsiString;
    FInformacoesAdicionais: AnsiString;
    FPagamentos: TObjectList<TDadosEmissaoNFEPagamento>;
    FItens: TObjectList<TDadosEmissaoNFEItens>;
    FRecebimentos: TObjectList<TDadosEmissaoNFERecebimento>;

    procedure SetAmbiente(const Value: AnsiString);
    procedure SetCFOP(const Value: AnsiString);
    procedure SetDataEmissao(const Value: AnsiString);
    procedure SetDataSaida(const Value: AnsiString);
    procedure SetDestinatarioCEP(const Value: AnsiString);
    procedure SetDestinatarioCNPJ(const Value: AnsiString);
    procedure SetDestinatarioCodigoMunicipio(const Value: AnsiString);
    procedure SetDestinatarioComplemento(const Value: AnsiString);
    procedure SetDestinatarioEmail(const Value: AnsiString);
    procedure SetDestinatarioEndereco(const Value: AnsiString);
    procedure SetDestinatarioEnquadramento(const Value: AnsiString);
    procedure SetDestinatarioIE(const Value: AnsiString);
    procedure SetDestinatarioIM(const Value: AnsiString);
    procedure SetDestinatarioMunicipio(const Value: AnsiString);
    procedure SetDestinatarioNome(const Value: AnsiString);
    procedure SetDestinatarioNumero(const Value: AnsiString);
    procedure SetDestinatarioRazaoSocial(const Value: AnsiString);
    procedure SetDestinatarioSetor(const Value: AnsiString);
    procedure SetDestinatarioSuframa(const Value: AnsiString);
    procedure SetDestinatarioTelefone(const Value: AnsiString);
    procedure SetDestinatarioUF(const Value: AnsiString);
    procedure SetFinalidade(const Value: AnsiString);
    procedure SetFormaEmissao(const Value: AnsiString);
    procedure SetFormaPagamento(const Value: Integer);
    procedure SetHoraSaida(const Value: AnsiString);
    procedure SetImpostoTotalBC(const Value: Double);
    procedure SetImpostoTotalBCServico(const Value: Double);
    procedure SetImpostoTotalBCST(const Value: Double);
    procedure SetImpostoTotalICMS(const Value: Double);
    procedure SetImpostoTotalST(const Value: Double);
    procedure SetImpostoTotalVCOFINS(const Value: Double);
    procedure SetImpostoTotalVDesc(const Value: Double);
    procedure SetImpostoTotalVFrete(const Value: Double);
    procedure SetImpostoTotalVIPI(const Value: Double);
    procedure SetImpostoTotalVISS(const Value: Double);
    procedure SetImpostoTotalVNF(const Value: Double);
    procedure SetImpostoTotalVOutros(const Value: Double);
    procedure SetImpostoTotalVPIS(const Value: Double);
    procedure SetImpostoTotalVProduto(const Value: Double);
    procedure SetImpostoTotalVSeguro(const Value: Double);
    procedure SetImpostoTotalVServico(const Value: Double);
    procedure SetInformacoesAdicionais(const Value: AnsiString);
    procedure SetItens(const Value: TObjectList<TDadosEmissaoNFEItens>);
    procedure SetModelo(const Value: AnsiString);
    procedure SetNNF(const Value: Integer);
    procedure SetPagamentos(
      const Value: TObjectList<TDadosEmissaoNFEPagamento>);
    procedure SetReboquePlaca(const Value: AnsiString);
    procedure SetReboqueRNTC(const Value: AnsiString);
    procedure SetReboqueUF(const Value: AnsiString);
    procedure SetSerie(const Value: AnsiString);
    procedure SetTipoFrete(const Value: integer);
    procedure SetTipoOperacao(const Value: Integer);
    procedure SetTransportadoraCNPJ(const Value: AnsiString);
    procedure SetTransportadoraEndereco(const Value: AnsiString);
    procedure SetTransportadoraIE(const Value: AnsiString);
    procedure SetTransportadoraMunicipio(const Value: AnsiString);
    procedure SetTransportadoraNome(const Value: AnsiString);
    procedure SetTransportadoraUF(const Value: AnsiString);
    procedure SetVeiculoPlaca(const Value: AnsiString);
    procedure SetVeiculoRNTC(const Value: AnsiString);
    procedure SetVeiculoUF(const Value: AnsiString);
    procedure SetVersaoEXE(const Value: AnsiString);
    procedure SetVolumeEspecie(const Value: AnsiString);
    procedure SetVolumeMarca(const Value: AnsiString);
    procedure SetVolumeNVolume(const Value: AnsiString);
    procedure SetVolumePesoB(const Value: AnsiString);
    procedure SetVolumePesoL(const Value: AnsiString);
    procedure SetVolumeQtTransportada(const Value: AnsiString);
    procedure SetRecebimentos(
      const Value: TObjectList<TDadosEmissaoNFERecebimento>);
  public
    property CFOP: AnsiString read FCFOP write SetCFOP;
    property FormaPagamento: Integer read FFormaPagamento write SetFormaPagamento; //0-A Vista 1-A Prazo 2-Outros
    property Modelo: AnsiString read FModelo write SetModelo;
    property Serie: AnsiString read FSerie write SetSerie;
    property NNF: Integer read FNNF write SetNNF;
    property DataSaida: AnsiString read FDataSaida write SetDataSaida;
    property HoraSaida: AnsiString read FHoraSaida write SetHoraSaida;
    property DataEmissao: AnsiString read FDataEmissao write SetDataEmissao;
    property TipoOperacao: Integer read FTipoOperacao write SetTipoOperacao; //0-Entrada 1-Saida
    property FormaEmissao: AnsiString read FFormaEmissao write SetFormaEmissao;
    property Ambiente: AnsiString read FAmbiente write SetAmbiente;
    property VersaoEXE: AnsiString read FVersaoEXE write SetVersaoEXE;
    property DestinatarioNome: AnsiString read FDestinatarioNome write SetDestinatarioNome;
    property DestinatarioCNPJ: AnsiString read FDestinatarioCNPJ write SetDestinatarioCNPJ;
    property DestinatarioRazaoSocial: AnsiString read FDestinatarioRazaoSocial write SetDestinatarioRazaoSocial;
    property DestinatarioEndereco: AnsiString read FDestinatarioEndereco write SetDestinatarioEndereco;
    property DestinatarioNumero: AnsiString read FDestinatarioNumero write SetDestinatarioNumero;
    property DestinatarioComplemento: AnsiString read FDestinatarioComplemento write SetDestinatarioComplemento;
    property DestinatarioSetor: AnsiString read FDestinatarioSetor write SetDestinatarioSetor;
    property DestinatarioCodigoMunicipio: AnsiString read FDestinatarioCodigoMunicipio write SetDestinatarioCodigoMunicipio;
    property DestinatarioMunicipio: AnsiString read FDestinatarioMunicipio write SetDestinatarioMunicipio;
    property DestinatarioUF: AnsiString read FDestinatarioUF write SetDestinatarioUF;
    property DestinatarioTelefone: AnsiString read FDestinatarioTelefone write SetDestinatarioTelefone;
    property DestinatarioIE: AnsiString read FDestinatarioIE write SetDestinatarioIE;
    property DestinatarioIM: AnsiString read FDestinatarioIM write SetDestinatarioIM;
    property DestinatarioCEP: AnsiString read FDestinatarioCEP write SetDestinatarioCEP;
    property DestinatarioEmail: AnsiString read FDestinatarioEmail write SetDestinatarioEmail;
    property DestinatarioSuframa: AnsiString read FDestinatarioSuframa write SetDestinatarioSuframa;
    property DestinatarioEnquadramento: AnsiString read FDestinatarioEnquadramento write SetDestinatarioEnquadramento;
    property Finalidade: AnsiString read FFinalidade write SetFinalidade;
    property ImpostoTotalBC: Double read FImpostoTotalBC write SetImpostoTotalBC;
    property ImpostoTotalICMS: Double read FImpostoTotalICMS write SetImpostoTotalICMS;
    property ImpostoTotalBCST: Double read FImpostoTotalBCST write SetImpostoTotalBCST;
    property ImpostoTotalST: Double read FImpostoTotalST write SetImpostoTotalST;
    property ImpostoTotalVProduto: Double read FImpostoTotalVProduto write SetImpostoTotalVProduto;
    property ImpostoTotalVFrete: Double read FImpostoTotalVFrete write SetImpostoTotalVFrete;
    property ImpostoTotalVSeguro: Double read FImpostoTotalVSeguro write SetImpostoTotalVSeguro;
    property ImpostoTotalVDesc: Double read FImpostoTotalVDesc write SetImpostoTotalVDesc;
    property ImpostoTotalVIPI: Double read FImpostoTotalVIPI write SetImpostoTotalVIPI;
    property ImpostoTotalVPIS: Double read FImpostoTotalVPIS write SetImpostoTotalVPIS;
    property ImpostoTotalVCOFINS: Double read FImpostoTotalVCOFINS write SetImpostoTotalVCOFINS;
    property ImpostoTotalVOutros: Double read FImpostoTotalVOutros write SetImpostoTotalVOutros;
    property ImpostoTotalVNF: Double read FImpostoTotalVNF write SetImpostoTotalVNF;
    property ImpostoTotalVServico: Double read FImpostoTotalVServico write SetImpostoTotalVServico;
    property ImpostoTotalBCServico: Double read FImpostoTotalBCServico write SetImpostoTotalBCServico;
    property ImpostoTotalVISS: Double read FImpostoTotalVISS write SetImpostoTotalVISS;
    property TipoFrete: integer read FTipoFrete write SetTipoFrete; // 0-Emitente 1-Destinatario 2-Terceiros 3-Sem Frete
    property TransportadoraCNPJ: AnsiString read FTransportadoraCNPJ write SetTransportadoraCNPJ;
    property TransportadoraNome: AnsiString read FTransportadoraNome write SetTransportadoraNome;
    property TransportadoraIE: AnsiString read FTransportadoraIE write SetTransportadoraIE;
    property TransportadoraEndereco: AnsiString read FTransportadoraEndereco write SetTransportadoraEndereco;
    property TransportadoraMunicipio: AnsiString read FTransportadoraMunicipio write SetTransportadoraMunicipio;
    property TransportadoraUF: AnsiString read FTransportadoraUF write SetTransportadoraUF;
    property VeiculoPlaca: AnsiString read FVeiculoPlaca write SetVeiculoPlaca;
    property VeiculoUF: AnsiString read FVeiculoUF write SetVeiculoUF;
    property VeiculoRNTC: AnsiString read FVeiculoRNTC write SetVeiculoRNTC;
    property ReboquePlaca: AnsiString read FReboquePlaca write SetReboquePlaca;
    property ReboqueUF: AnsiString read FReboqueUF write SetReboqueUF;
    property ReboqueRNTC: AnsiString read FReboqueRNTC write SetReboqueRNTC;
    property VolumeQtTransportada: AnsiString read FVolumeQtTransportada write SetVolumeQtTransportada;
    property VolumeEspecie: AnsiString read FVolumeEspecie write SetVolumeEspecie;
    property VolumeMarca: AnsiString read FVolumeMarca write SetVolumeMarca;
    property VolumeNVolume: AnsiString read FVolumeNVolume write SetVolumeNVolume;
    property VolumePesoL: AnsiString read FVolumePesoL write SetVolumePesoL;
    property VolumePesoB: AnsiString read FVolumePesoB write SetVolumePesoB;
    property InformacoesAdicionais: AnsiString read FInformacoesAdicionais write SetInformacoesAdicionais;
    property Pagamentos: TObjectList<TDadosEmissaoNFEPagamento> read FPagamentos write SetPagamentos;
    property Itens: TObjectList<TDadosEmissaoNFEItens> read FItens write SetItens;
    property Recebimentos: TObjectList<TDadosEmissaoNFERecebimento> read FRecebimentos write SetRecebimentos;
    constructor Create;
  end;
implementation

{ TDadosEmissaoNFE }

constructor TDadosEmissaoNFE.Create;
begin
  FItens := TObjectList<TDadosEmissaoNFEItens>.Create;
  FPagamentos := TObjectList<TDadosEmissaoNFEPagamento>.Create;
  FRecebimentos := TObjectList<TDadosEmissaoNFERecebimento>.Create;
end;

procedure TDadosEmissaoNFE.SetAmbiente(const Value: AnsiString);
begin
  FAmbiente := Value;
end;

procedure TDadosEmissaoNFE.SetCFOP(const Value: AnsiString);
begin
  FCFOP := Value;
end;

procedure TDadosEmissaoNFE.SetDataEmissao(const Value: AnsiString);
begin
  FDataEmissao := Value;
end;

procedure TDadosEmissaoNFE.SetDataSaida(const Value: AnsiString);
begin
  FDataSaida := Value;
end;

procedure TDadosEmissaoNFE.SetDestinatarioCEP(const Value: AnsiString);
begin
  FDestinatarioCEP := Value;
end;

procedure TDadosEmissaoNFE.SetDestinatarioCNPJ(const Value: AnsiString);
begin
  FDestinatarioCNPJ := Value;
end;

procedure TDadosEmissaoNFE.SetDestinatarioCodigoMunicipio(
  const Value: AnsiString);
begin
  FDestinatarioCodigoMunicipio := Value;
end;

procedure TDadosEmissaoNFE.SetDestinatarioComplemento(const Value: AnsiString);
begin
  FDestinatarioComplemento := Value;
end;

procedure TDadosEmissaoNFE.SetDestinatarioEmail(const Value: AnsiString);
begin
  FDestinatarioEmail := Value;
end;

procedure TDadosEmissaoNFE.SetDestinatarioEndereco(const Value: AnsiString);
begin
  FDestinatarioEndereco := Value;
end;

procedure TDadosEmissaoNFE.SetDestinatarioEnquadramento(
  const Value: AnsiString);
begin
  FDestinatarioEnquadramento := Value;
end;

procedure TDadosEmissaoNFE.SetDestinatarioIE(const Value: AnsiString);
begin
  FDestinatarioIE := Value;
end;

procedure TDadosEmissaoNFE.SetDestinatarioIM(const Value: AnsiString);
begin
  FDestinatarioIM := Value;
end;

procedure TDadosEmissaoNFE.SetDestinatarioMunicipio(const Value: AnsiString);
begin
  FDestinatarioMunicipio := Value;
end;

procedure TDadosEmissaoNFE.SetDestinatarioNome(const Value: AnsiString);
begin
  FDestinatarioNome := Value;
end;

procedure TDadosEmissaoNFE.SetDestinatarioNumero(const Value: AnsiString);
begin
  FDestinatarioNumero := Value;
end;

procedure TDadosEmissaoNFE.SetDestinatarioRazaoSocial(const Value: AnsiString);
begin
  FDestinatarioRazaoSocial := Value;
end;

procedure TDadosEmissaoNFE.SetDestinatarioSetor(const Value: AnsiString);
begin
  FDestinatarioSetor := Value;
end;

procedure TDadosEmissaoNFE.SetDestinatarioSuframa(const Value: AnsiString);
begin
  FDestinatarioSuframa := Value;
end;

procedure TDadosEmissaoNFE.SetDestinatarioTelefone(const Value: AnsiString);
begin
  FDestinatarioTelefone := Value;
end;

procedure TDadosEmissaoNFE.SetDestinatarioUF(const Value: AnsiString);
begin
  FDestinatarioUF := Value;
end;

procedure TDadosEmissaoNFE.SetFinalidade(const Value: AnsiString);
begin
  FFinalidade := Value;
end;

procedure TDadosEmissaoNFE.SetFormaEmissao(const Value: AnsiString);
begin
  FFormaEmissao := Value;
end;

procedure TDadosEmissaoNFE.SetFormaPagamento(const Value: Integer);
begin
  FFormaPagamento := Value;
end;

procedure TDadosEmissaoNFE.SetHoraSaida(const Value: AnsiString);
begin
  FHoraSaida := Value;
end;

procedure TDadosEmissaoNFE.SetImpostoTotalBC(const Value: Double);
begin
  FImpostoTotalBC := Value;
end;

procedure TDadosEmissaoNFE.SetImpostoTotalBCServico(const Value: Double);
begin
  FImpostoTotalBCServico := Value;
end;

procedure TDadosEmissaoNFE.SetImpostoTotalBCST(const Value: Double);
begin
  FImpostoTotalBCST := Value;
end;

procedure TDadosEmissaoNFE.SetImpostoTotalICMS(const Value: Double);
begin
  FImpostoTotalICMS := Value;
end;

procedure TDadosEmissaoNFE.SetImpostoTotalST(const Value: Double);
begin
  FImpostoTotalST := Value;
end;

procedure TDadosEmissaoNFE.SetImpostoTotalVCOFINS(const Value: Double);
begin
  FImpostoTotalVCOFINS := Value;
end;

procedure TDadosEmissaoNFE.SetImpostoTotalVDesc(const Value: Double);
begin
  FImpostoTotalVDesc := Value;
end;

procedure TDadosEmissaoNFE.SetImpostoTotalVFrete(const Value: Double);
begin
  FImpostoTotalVFrete := Value;
end;

procedure TDadosEmissaoNFE.SetImpostoTotalVIPI(const Value: Double);
begin
  FImpostoTotalVIPI := Value;
end;

procedure TDadosEmissaoNFE.SetImpostoTotalVISS(const Value: Double);
begin
  FImpostoTotalVISS := Value;
end;

procedure TDadosEmissaoNFE.SetImpostoTotalVNF(const Value: Double);
begin
  FImpostoTotalVNF := Value;
end;

procedure TDadosEmissaoNFE.SetImpostoTotalVOutros(const Value: Double);
begin
  FImpostoTotalVOutros := Value;
end;

procedure TDadosEmissaoNFE.SetImpostoTotalVPIS(const Value: Double);
begin
  FImpostoTotalVPIS := Value;
end;

procedure TDadosEmissaoNFE.SetImpostoTotalVProduto(const Value: Double);
begin
  FImpostoTotalVProduto := Value;
end;

procedure TDadosEmissaoNFE.SetImpostoTotalVSeguro(const Value: Double);
begin
  FImpostoTotalVSeguro := Value;
end;

procedure TDadosEmissaoNFE.SetImpostoTotalVServico(const Value: Double);
begin
  FImpostoTotalVServico := Value;
end;

procedure TDadosEmissaoNFE.SetInformacoesAdicionais(const Value: AnsiString);
begin
  FInformacoesAdicionais := Value;
end;

procedure TDadosEmissaoNFE.SetItens(
  const Value: TObjectList<TDadosEmissaoNFEItens>);
begin
  FItens := Value;
end;

procedure TDadosEmissaoNFE.SetModelo(const Value: AnsiString);
begin
  FModelo := Value;
end;

procedure TDadosEmissaoNFE.SetNNF(const Value: Integer);
begin
  FNNF := Value;
end;

procedure TDadosEmissaoNFE.SetPagamentos(
  const Value: TObjectList<TDadosEmissaoNFEPagamento>);
begin
  FPagamentos := Value;
end;

procedure TDadosEmissaoNFE.SetReboquePlaca(const Value: AnsiString);
begin
  FReboquePlaca := Value;
end;

procedure TDadosEmissaoNFE.SetReboqueRNTC(const Value: AnsiString);
begin
  FReboqueRNTC := Value;
end;

procedure TDadosEmissaoNFE.SetReboqueUF(const Value: AnsiString);
begin
  FReboqueUF := Value;
end;

procedure TDadosEmissaoNFE.SetRecebimentos(
  const Value: TObjectList<TDadosEmissaoNFERecebimento>);
begin
  FRecebimentos := Value;
end;

procedure TDadosEmissaoNFE.SetSerie(const Value: AnsiString);
begin
  FSerie := Value;
end;

procedure TDadosEmissaoNFE.SetTipoFrete(const Value: integer);
begin
  FTipoFrete := Value;
end;

procedure TDadosEmissaoNFE.SetTipoOperacao(const Value: Integer);
begin
  FTipoOperacao := Value;
end;

procedure TDadosEmissaoNFE.SetTransportadoraCNPJ(const Value: AnsiString);
begin
  FTransportadoraCNPJ := Value;
end;

procedure TDadosEmissaoNFE.SetTransportadoraEndereco(const Value: AnsiString);
begin
  FTransportadoraEndereco := Value;
end;

procedure TDadosEmissaoNFE.SetTransportadoraIE(const Value: AnsiString);
begin
  FTransportadoraIE := Value;
end;

procedure TDadosEmissaoNFE.SetTransportadoraMunicipio(const Value: AnsiString);
begin
  FTransportadoraMunicipio := Value;
end;

procedure TDadosEmissaoNFE.SetTransportadoraNome(const Value: AnsiString);
begin
  FTransportadoraNome := Value;
end;

procedure TDadosEmissaoNFE.SetTransportadoraUF(const Value: AnsiString);
begin
  FTransportadoraUF := Value;
end;

procedure TDadosEmissaoNFE.SetVeiculoPlaca(const Value: AnsiString);
begin
  FVeiculoPlaca := Value;
end;

procedure TDadosEmissaoNFE.SetVeiculoRNTC(const Value: AnsiString);
begin
  FVeiculoRNTC := Value;
end;

procedure TDadosEmissaoNFE.SetVeiculoUF(const Value: AnsiString);
begin
  FVeiculoUF := Value;
end;

procedure TDadosEmissaoNFE.SetVersaoEXE(const Value: AnsiString);
begin
  FVersaoEXE := Value;
end;

procedure TDadosEmissaoNFE.SetVolumeEspecie(const Value: AnsiString);
begin
  FVolumeEspecie := Value;
end;

procedure TDadosEmissaoNFE.SetVolumeMarca(const Value: AnsiString);
begin
  FVolumeMarca := Value;
end;

procedure TDadosEmissaoNFE.SetVolumeNVolume(const Value: AnsiString);
begin
  FVolumeNVolume := Value;
end;

procedure TDadosEmissaoNFE.SetVolumePesoB(const Value: AnsiString);
begin
  FVolumePesoB := Value;
end;

procedure TDadosEmissaoNFE.SetVolumePesoL(const Value: AnsiString);
begin
  FVolumePesoL := Value;
end;

procedure TDadosEmissaoNFE.SetVolumeQtTransportada(const Value: AnsiString);
begin
  FVolumeQtTransportada := Value;
end;

end.
