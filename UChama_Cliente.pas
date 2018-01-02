unit UChama_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, ToolWin, ImgList, DB,
  UGeral,
  ADODB, UConsulta, UCadastro_Cliente, Provider, DBClient;

type
  TFrmChama_Cliente = class(TForm)
    DBGrid1: TDBGrid;
    RGConsulta_Por: TRadioGroup;
    EdtConsulta: TEdit;
    ImgImagens: TImageList;
    LblMarca: TLabel;
    qrychama_cliente_outros: TADOQuery;
    ds_qry_consulta_padrao: TDataSource;
    Timer1: TTimer;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    qryendereco_cliente: TADOQuery;
    DataSource1: TDataSource;
    qrychama_cliente_outrosCodigo: TIntegerField;
    qrychama_cliente_outrosNome_Pai: TStringField;
    qrychama_cliente_outrosNome_Mae: TStringField;
    qrychama_cliente_outrosNacionalidade: TStringField;
    qrychama_cliente_outrosNaturalidade: TStringField;
    qrychama_cliente_outrosConjuge: TStringField;
    qrychama_cliente_outrosGrau_Instrucao: TStringField;
    Panel1: TPanel;
    DBGrid3: TDBGrid;
    ToolBar1: TToolBar;
    BBtnFiltrar: TToolButton;
    BBtnFechar: TToolButton;
    qryendereco_clienteCodigo_Cliente: TIntegerField;
    qryendereco_clienteCodigo_Setor: TIntegerField;
    qryendereco_clienteNumero: TStringField;
    qryendereco_clienteComplemento: TStringField;
    qryendereco_clienteTipo_Endereco: TStringField;
    qryendereco_clienteEndereco: TStringField;
    qryendereco_clienteCEP: TStringField;
    qryendereco_clienteCodigo_Registro: TAutoIncField;
    qryendereco_clienteSetor: TStringField;
    dbgrd1: TDBGrid;
    pnl1: TPanel;
    procedure BBtnFiltrarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure EdtConsultaChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrd1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure Pega_Endereco;
    procedure Pega_Cliente_Outros;
    procedure Pega_Autorizados;
    procedure Pega_Dados_Adicionais;
    procedure ColocaHintInput;
  public
    { Public declarations }
  end;

var
  FrmChama_Cliente: TFrmChama_Cliente;
  Util: TUtil;
  Consulta: TConsulta;

implementation

uses UDM, ULancamento_Financeiro, UChama_Lancamentos_Financeiros,
  UFechamento_Venda_PDV, UPDV, UDeclaracao, UPedido_Venda, UGera_Ordem_Entrega,
  UMovimentacao_Manual, UCadastro_Veiculo, UOS, UPre_Venda,
  UConsulta_Lancamentos_Financeiros, UConsulta_OS, UConsulta_Venda,
  UGera_Etiqueta_Cliente, USMS, UNFE, UInformar_Cliente_PDV,
  UConsulta_Ficha_Cliente, UGerar_Documentos,
  Conexao.TConexao;
{$R *.dfm}

procedure TFrmChama_Cliente.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmChama_Cliente.BBtnFiltrarClick(Sender: TObject);
begin
  Consulta.Chama_Cliente(EdtConsulta.Text);
end;

procedure TFrmChama_Cliente.ColocaHintInput;
begin
  FrmPedido_Venda.EdtCliente.Hint := FrmPedido_Venda.LblEndereco.Caption + #13 +
    'Nº.: ' + FrmPedido_Venda.LblNumero.Caption + #13 + 'Setor: ' +
    FrmPedido_Venda.LblSetor.Caption + FrmPedido_Venda.LblInscricao_Estadual.Caption;
end;

procedure TFrmChama_Cliente.dbgrd1DblClick(Sender: TObject);
begin
  if (FrmPDV <> nil) and (FrmPDV.ativo = true) then
  begin
    if (dm.qrychama_clienteBloqueado.AsString = 'SIM') then
    begin
      Mensagem_Cliente_Bloqueado;
      abort;
    end;

    FrmPDV.Codigo_Cliente := dm.qrychama_clienteCodigo.AsInteger;
    FrmPDV.Nome := dm.qrychama_clienteNome_Nome_Fantasia.AsString;

    if (dm.qrychama_clienteTipo.AsString = 'FÍSICO') then
    begin
      FrmPDV.CPF := dm.qrychama_clienteCPF.AsString;
      cnpj_destinatario:=dm.qrychama_clienteCPF.AsString;
    end
    else
    begin
      FrmPDV.CPF := dm.qrychama_clienteCNPJ.AsString;
      cnpj_destinatario:=dm.qrychama_clienteCNPJ.AsString;
    end;

    ie_destinatario:= dm.qrychama_clienteInsc_Estadual.AsString;
    razao_social_destinatario:= dm.qrychama_clienteRazao_Social.AsString;
    telefone_destinatario:= dm.qrychama_clienteTelefone.AsString;
    cep_destinatario:= dm.qrychama_clienteCEP.AsString;
    endereco_destinatario:= dm.qrychama_clienteEndereco.AsString;
    numero_destinatario:= dm.qrychama_clienteNumero.AsString;
    complemento_destinatario:= dm.qrychama_clienteComplemento.AsString;
    setor_destinatario:= dm.qrychama_clienteSetor.AsString;
    codigo_municipio_destinatario:= dm.qrychama_clienteCodigo_Municipio.AsString;
    municipio_destinatario:= dm.qrychama_clienteCidade.AsString;
    uf_destinatario:= dm.qrychama_clienteUF.AsString;

    FrmPDV.cli_end := dm.qryendereco_clienteEndereco.AsString;
    FrmPDV.cli_num := dm.qryendereco_clienteNumero.AsString;
    FrmPDV.cli_set := dm.qryendereco_clienteSetor.AsString;
    FrmPDV.cli_cid := dm.qrychama_clienteCidade.AsString;
    FrmPDV.cli_uf := dm.qrychama_clienteUF.AsString;
    FrmPDV.cli_cod_mun := dm.qrychama_clienteCodigo_Municipio.AsString;
    FrmPDV.cli_cep := dm.qryendereco_clienteCEP.AsString;
    FrmPDV.cli_tel := dm.qrychama_clienteTelefone.AsString;
    FrmPDV.cli_comp := dm.qryendereco_clienteComplemento.AsString;

    FrmInformar_Cliente_PDV.EdtCodigo_Cliente.Text := dm.qrychama_clienteCodigo.AsString;
    FrmInformar_Cliente_PDV.EdtNome.Text := dm.qrychama_clienteNome_Nome_Fantasia.AsString;

    if (dm.qrychama_clienteTipo.AsString = 'FÍSICO') then
      FrmInformar_Cliente_PDV.EdtCPF_CNPJ.Text := dm.qrychama_clienteCPF.AsString
    else
      FrmInformar_Cliente_PDV.EdtCPF_CNPJ.Text := dm.qrychama_clienteCNPJ.AsString;

    FrmInformar_Cliente_PDV.EdtEndereco.Text := dm.qryendereco_clienteEndereco.AsString + ', ' + dm.qryendereco_clienteNumero.AsString;

    FrmPDV.Tipo_Cliente := dm.qrychama_clienteTipo.AsString;
    FrmPDV.Endereco := dm.qryendereco_clienteEndereco.AsString + ', ' + dm.qryendereco_clienteNumero.AsString + ', Setor ' +
      dm.qryendereco_clienteSetor.AsString;

    FrmChama_Cliente.close;
  end
  else if (FrmPedido_Venda <> nil) and (FrmPedido_Venda.ativo = true) then
  begin
    if (dm.qrychama_clienteBloqueado.AsString = 'SIM') then
    begin
      Mensagem_Cliente_Bloqueado;
      abort;
    end;

    // DESCONTOS
    credito_cliente := dm.qrychama_clienteCredito.AsFloat;
    desconto_cliente := dm.qrychama_clienteLimite_Desconto.AsFloat;
    FrmPedido_Venda.EdtDesc_Acr.Text :=
      dm.qrychama_clienteLimite_Desconto.AsString;

    if (desconto_cliente <> 0) then
      FrmPedido_Venda.RGTipoDesc.ItemIndex := 0
    else
      FrmPedido_Venda.RGTipoDesc.ItemIndex := tipo_desc_acr_padrao;

    acima_limite_credito_cliente :=
      dm.qrychama_clienteAcima_Limite_Credito.AsString;

    ColocaHintInput;

    if (dm.qrychama_clienteCodigo_Tabela_Preco.AsInteger <> 0) then
    begin
      Atualiza_Codigo_Tabela_Padrao
        (dm.qrychama_clienteCodigo_Tabela_Preco.AsInteger);
    end
    else
    begin
      Atualiza_Codigo_Tabela_Padrao(codigo_tabela_preco_padrao);
    end;

    FrmPedido_Venda.EdtCodigo_Forma_Pagamento.SetFocus;
    FrmChama_Cliente.close;

    FrmPedido_Venda.EdtCodigo_Cliente.Text :=
      dm.qrychama_clienteCodigo.AsString;
    FrmPedido_Venda.EdtCliente.Text := dm.qrychama_clienteRazao_Social.AsString;

    if (dm.qrychama_clienteCPF.AsString <> '') then
      FrmPedido_Venda.LblCPF.Caption := dm.qrychama_clienteCPF.AsString
    else if (dm.qrychama_clienteCNPJ.AsString <> '') then
      FrmPedido_Venda.LblCPF.Caption := dm.qrychama_clienteCNPJ.AsString
    else
      FrmPedido_Venda.LblCPF.Caption := '';

    FrmPedido_Venda.LblCidade.Caption := dm.qrydados_adicionaisCidade.AsString;
    FrmPedido_Venda.LblSetor.Caption := dm.qrydados_adicionaisSetor.AsString;
    FrmPedido_Venda.LblEndereco.Caption :=
      dm.qrydados_adicionaisEndereco.AsString;
    FrmPedido_Venda.LblUF.Caption := dm.qrydados_adicionaisUF.AsString;
    FrmPedido_Venda.LblTelefone.Caption := dm.qrychama_clienteTelefone.AsString;
    FrmPedido_Venda.LblNumero.Caption := dm.qrydados_adicionaisNumero.AsString;
    FrmPedido_Venda.LblCEP.Caption := dm.qrydados_adicionaisCEP.AsString;
    FrmPedido_Venda.LblInscricao_Estadual.Caption :=
      dm.qrydados_adicionaisInscricao.AsString;
    FrmPedido_Venda.EdtCliente.Hint :=
      FrmPedido_Venda.LblTipo_Logradouro.Caption + ' ' +
      FrmPedido_Venda.LblEndereco.Caption + #13 + 'Nº.: ' +
      FrmPedido_Venda.LblNumero.Caption + #13 + 'Setor: ' +
      FrmPedido_Venda.LblSetor.Caption;

    FrmPedido_Venda.LblCodigo_Municipio.Caption :=
      dm.qrydados_adicionaisCodigo_Municipio.AsString;
    FrmPedido_Venda.LblComplemento.Caption :=
      dm.qrydados_adicionaisComplemento.AsString;

    permissao_desconto := dm.qrychama_clienteAcima_Limite_Desconto.AsString;

    FrmChama_Cliente.close;
  end;
end;

procedure TFrmChama_Cliente.DBGrid1CellClick(Column: TColumn);
begin
  Pega_Endereco;
  Pega_Cliente_Outros;
  Pega_Autorizados;
  Pega_Dados_Adicionais;
end;

procedure TFrmChama_Cliente.DBGrid1DblClick(Sender: TObject);
var
  telefone, ddd: AnsiString;
begin
  if (FrmCadastro_Cliente <> NIL) and (FrmCadastro_Cliente.ativo = true) then
  begin
    FrmCadastro_Cliente.EdtCodigo.Text := dm.qrychama_clienteCodigo.AsString;
    if (dm.qrychama_clienteTipo.AsString = 'FÍSICO') then
      FrmCadastro_Cliente.CBTipo.Checked := true
    else
      FrmCadastro_Cliente.CBTipo.Checked := false;

    FrmCadastro_Cliente.EdtNome.Text :=
      dm.qrychama_clienteNome_Nome_Fantasia.AsString;
    FrmCadastro_Cliente.EdtRazao_Social.Text :=
      dm.qrychama_clienteRazao_Social.AsString;
    FrmCadastro_Cliente.EdtCPF.Text := dm.qrychama_clienteCPF.AsString;
    FrmCadastro_Cliente.EdtRG.Text := dm.qrychama_clienteRG.AsString;
    FrmCadastro_Cliente.EdtOrgao_Expedidor.Text :=
      dm.qrychama_clienteOrgao_Expedidor.AsString;

    if (dm.qrychama_clienteData_Emissao_RG.AsString = '30/12/1899') then
      FrmCadastro_Cliente.EdtData_Emissao.Clear
    else
      FrmCadastro_Cliente.EdtData_Emissao.Text :=
        dm.qrychama_clienteData_Emissao_RG.AsString;

    FrmCadastro_Cliente.EdtInsc_Estadual.Text :=
      dm.qrychama_clienteInsc_Estadual.AsString;
    FrmCadastro_Cliente.EdtInsc_Municipal.Text :=
      dm.qrychama_clienteInsc_Municipal.AsString;
    FrmCadastro_Cliente.EdtCNPJ.Text := dm.qrychama_clienteCNPJ.AsString;
    FrmCadastro_Cliente.EdtSuframa.Text := dm.qrychama_clienteSuframa.AsString;
    FrmCadastro_Cliente.EdtComplemento.Text :=
      dm.qrychama_clienteComplemento.AsString;

    if (dm.qrychama_clienteEnquadramento.AsString = '0') then
      FrmCadastro_Cliente.RGEnquadramento.ItemIndex := 0
    else
      FrmCadastro_Cliente.RGEnquadramento.ItemIndex := 1;

    FrmCadastro_Cliente.EdtEndereco.Text :=
      dm.qrychama_clienteEndereco.AsString;
    FrmCadastro_Cliente.EdtCEP.Text := dm.qrychama_clienteCEP.AsString;
    FrmCadastro_Cliente.achou_endereco := true;

    FrmCadastro_Cliente.EdtNumero.Text := dm.qrychama_clienteNumero.AsString;
    if (dm.qrychama_clienteCodigo_Setor.AsString = '0') then
    begin
      FrmCadastro_Cliente.EdtCodigo_Setor.Text := '';
      FrmCadastro_Cliente.EdtSetor.Text := '';
      FrmCadastro_Cliente.achou_setor := false;
    end
    else
    begin
      FrmCadastro_Cliente.EdtCodigo_Setor.Text :=
        dm.qrychama_clienteCodigo_Setor.AsString;
      FrmCadastro_Cliente.EdtSetor.Text := dm.qrychama_clienteSetor.AsString;
      FrmCadastro_Cliente.achou_setor := true;
    end;

    if (dm.qrychama_clienteCodigo_Cidade.AsString = '0') then
    begin
      FrmCadastro_Cliente.EdtCodigo_Cidade.Text := '';
      FrmCadastro_Cliente.EdtCidade.Text := '';
      FrmCadastro_Cliente.EdtUF.Text := '';
      FrmCadastro_Cliente.achou_cidade := false;
    end
    else
    begin
      FrmCadastro_Cliente.EdtCodigo_Cidade.Text :=
        dm.qrychama_clienteCodigo_Cidade.AsString;
      FrmCadastro_Cliente.EdtCidade.Text := dm.qrychama_clienteCidade.AsString;
      FrmCadastro_Cliente.EdtUF.Text := dm.qrychama_clienteUF.AsString;
      FrmCadastro_Cliente.achou_cidade := true;
    end;

    FrmCadastro_Cliente.EdtReferencia.Text :=
      dm.qrychama_clienteReferencia.AsString;
    FrmCadastro_Cliente.EdtEmail.Text := dm.qrychama_clienteEmail.AsString;

    if (dm.qrychama_clienteCodigo_Grupo.AsString = '0') then
    begin
      FrmCadastro_Cliente.EdtCodigo_Grupo.Text := '';
      FrmCadastro_Cliente.EdtGrupo.Text := '';
    end
    else
    begin
      FrmCadastro_Cliente.EdtCodigo_Grupo.Text :=
        dm.qrychama_clienteCodigo_Grupo.AsString;
      FrmCadastro_Cliente.EdtGrupo.Text := dm.qrychama_clienteGrupo.AsString;
    end;

    FrmCadastro_Cliente.EdtProfissao.Text :=
      dm.qrychama_clienteProfissao.AsString;
    FrmCadastro_Cliente.EdtContato.Text := dm.qrychama_clienteContato.AsString;
    FrmCadastro_Cliente.EdtSite.Text := dm.qrychama_clienteSite.AsString;

    FrmCadastro_Cliente.EdtCredito.Text :=
      FormatFloat('#0.0,0', dm.qrychama_clienteCredito.AsFloat);
    FrmCadastro_Cliente.EdtCredito.Text :=
      StringReplace(FrmCadastro_Cliente.EdtCredito.Text, ThousandSeparator, '',
      [rfReplaceAll]);

    FrmCadastro_Cliente.EdtLimite_Credito.Text :=
      FormatFloat('#0.0,0', dm.qrychama_clienteLimite_Credito.AsFloat);
    FrmCadastro_Cliente.EdtLimite_Credito.Text :=
      StringReplace(FrmCadastro_Cliente.EdtLimite_Credito.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Cliente.EdtLimite_Desconto.Text :=
      FormatFloat('#0.0,0', dm.qrychama_clienteLimite_Desconto.AsFloat);
    FrmCadastro_Cliente.EdtLimite_Desconto.Text :=
      StringReplace(FrmCadastro_Cliente.EdtLimite_Desconto.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmCadastro_Cliente.CmbEstado_Civil.Text :=
      dm.qrychama_clienteEstado_Civil.AsString;
    FrmCadastro_Cliente.CmbAcima_Limite_Credito.Text :=
      dm.qrychama_clienteAcima_Limite_Credito.AsString;
    FrmCadastro_Cliente.CmbAcima_Limite_Desconto.Text :=
      dm.qrychama_clienteAcima_Limite_Desconto.AsString;

    if (dm.qrychama_clienteData_Cadastro.AsString = '30/12/1899') then
      FrmCadastro_Cliente.MEdtData_Cadastro.Clear
    else
      FrmCadastro_Cliente.MEdtData_Cadastro.Text :=
        dm.qrychama_clienteData_Cadastro.AsString;

    if (dm.qrychama_clienteData_Nascimento.AsString = '30/12/1899') then
      FrmCadastro_Cliente.MEdtData_Nascimento.Clear
    else
      FrmCadastro_Cliente.MEdtData_Nascimento.Text :=
        dm.qrychama_clienteData_Nascimento.AsString;

    FrmCadastro_Cliente.MEdtTelefone.Text :=
      dm.qrychama_clienteTelefone.AsString;
    FrmCadastro_Cliente.MEdtCelular.Text := dm.qrychama_clienteCelular.AsString;
    FrmCadastro_Cliente.MEdtTelefone_Contato.Text :=
      dm.qrychama_clienteTelefone_Contato.AsString;
    FrmCadastro_Cliente.MmoObservacoes.Text :=
      dm.qrychama_clienteObservacoes.AsString;

    FrmCadastro_Cliente.EdtPai.Text := qrychama_cliente_outrosNome_Pai.AsString;
    FrmCadastro_Cliente.EdtMae.Text := qrychama_cliente_outrosNome_Mae.AsString;
    FrmCadastro_Cliente.EdtNacionalidade.Text :=
      qrychama_cliente_outrosNacionalidade.AsString;
    FrmCadastro_Cliente.EdtNaturalidade.Text :=
      qrychama_cliente_outrosNaturalidade.AsString;
    FrmCadastro_Cliente.EdtConjuge.Text :=
      qrychama_cliente_outrosConjuge.AsString;
    FrmCadastro_Cliente.EdtGrau_Instrucao.Text :=
      qrychama_cliente_outrosGrau_Instrucao.AsString;

    if (dm.qrychama_clienteBloqueado.AsString = 'SIM') then
      FrmCadastro_Cliente.CBBloqueado.Checked := true
    else
      FrmCadastro_Cliente.CBBloqueado.Checked := false;

    if (dm.qrychama_clienteCodigo_Tabela_Preco.AsInteger <> 0) then
    begin
      FrmCadastro_Cliente.EdtCodigo_Tabela_Preco.Text :=
        dm.qrychama_clienteCodigo_Tabela_Preco.AsString;
      FrmCadastro_Cliente.EdtTabela_Preco.Text :=
        dm.qrychama_clienteTabela_Preco.AsString;
    end
    else
    begin
      FrmCadastro_Cliente.EdtCodigo_Tabela_Preco.Text := '';
      FrmCadastro_Cliente.EdtTabela_Preco.Text := '';
    end;

    FrmCadastro_Cliente.Conexao := TConexao.NovaConexao
      (FrmCadastro_Cliente.Conexao);
    TConexao.IniciaQuerys([FrmCadastro_Cliente.ADOQuery1,
      FrmCadastro_Cliente.qryPedido, FrmCadastro_Cliente.ADOQuery4,
      FrmCadastro_Cliente.qrytelefone, FrmCadastro_Cliente.qrydados_adicionais,
      FrmCadastro_Cliente.qryautorizados], FrmCadastro_Cliente.Conexao);
    // if (Verifica_Status_Rede(ipservidor)) then
    // begin
    FrmCadastro_Cliente.Atualiza_Dados; // mexi aqui status rede
    FrmCadastro_Cliente.Atualiza_Dados_Adicionais;
    FrmCadastro_Cliente.Atualiza_Dados_Telefone;
    FrmCadastro_Cliente.Atualiza_Dados_Autorizados;
    FrmCadastro_Cliente.Atualiza_Dados_Ocorrencia;
    FrmCadastro_Cliente.Chama_Imagens;
    // end;

    FrmCadastro_Cliente.PageControl2.TabIndex := 0;
    FrmCadastro_Cliente.PageControl3.TabIndex := 0;
    FrmChama_Cliente.close;
    FrmCadastro_Cliente.BBtnSalvar.Enabled := true;
    FrmCadastro_Cliente.BBtnExcluir.Enabled := true;
    FrmCadastro_Cliente.BBtnPesquisar.Enabled := true;
    FrmCadastro_Cliente.BBtnCancelar.Enabled := true;
    FrmCadastro_Cliente.BBtnImprimir.Enabled := true;
    FrmCadastro_Cliente.BBtnNovo.Enabled := false;
    FrmCadastro_Cliente.BBtnNovo.Enabled := false;

    Util.Habilita_Campos(FrmCadastro_Cliente);
    FrmCadastro_Cliente.achei := true;
  end
  else if (FrmLancamento_Financeiro <> NIl) and
    (FrmLancamento_Financeiro.ativo = true) then
  begin
    FrmLancamento_Financeiro.EdtCodigo_Cli_Forn.Text :=
      dm.qrychama_clienteCodigo.AsString;
    FrmLancamento_Financeiro.EdtCli_Forn.Text :=
      dm.qrychama_clienteNome_Nome_Fantasia.AsString;
    FrmChama_Cliente.close;
  end
  else if (FrmChama_Lancamentos_Financeiros <> Nil) and
    (FrmChama_Lancamentos_Financeiros.ativo = true) then
  begin
    FrmChama_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text :=
      dm.qrychama_clienteCodigo.AsString;
    FrmChama_Lancamentos_Financeiros.EdtConsulta.Text :=
      dm.qrychama_clienteNome_Nome_Fantasia.AsString;
    FrmChama_Cliente.close;
  end
  else if (FrmPDV <> nil) and (FrmPDV.ativo = true) then
  begin

    if (dm.qrychama_clienteBloqueado.AsString = 'SIM') then
    begin
      Mensagem_Cliente_Bloqueado;
      abort;
    end;

    FrmPDV.Codigo_Cliente := dm.qrychama_clienteCodigo.AsInteger;
    FrmPDV.Nome := dm.qrychama_clienteRazao_Social.AsString;

    if (dm.qrychama_clienteTipo.AsString = 'FÍSICO') then
    begin
      FrmPDV.CPF := dm.qrychama_clienteCPF.AsString;
      cnpj_destinatario:=dm.qrychama_clienteCPF.AsString;
      razao_social_destinatario:= dm.qrychama_clienteNome_Nome_Fantasia.AsString;
    end
    else
    begin
      FrmPDV.CPF := dm.qrychama_clienteCNPJ.AsString;
      cnpj_destinatario:=dm.qrychama_clienteCNPJ.AsString;
      razao_social_destinatario:= dm.qrychama_clienteRazao_Social.AsString;
    end;

    ie_destinatario:= dm.qrychama_clienteInsc_Estadual.AsString;
    telefone_destinatario:= dm.qrychama_clienteTelefone.AsString;
    cep_destinatario:= dm.qrychama_clienteCEP.AsString;
    endereco_destinatario:= dm.qrychama_clienteEndereco.AsString;
    numero_destinatario:= dm.qrychama_clienteNumero.AsString;
    complemento_destinatario:= dm.qrychama_clienteComplemento.AsString;
    setor_destinatario:= dm.qrychama_clienteSetor.AsString;
    codigo_municipio_destinatario:= dm.qrychama_clienteCodigo_Municipio.AsString;
    municipio_destinatario:= dm.qrychama_clienteCidade.AsString;
    uf_destinatario:= dm.qrychama_clienteUF.AsString;

    FrmPDV.Tipo_Cliente := dm.qrychama_clienteTipo.AsString;
    FrmPDV.Endereco := dm.qrychama_clienteEndereco.AsString + ', ' +
    dm.qrychama_clienteNumero.AsString;

    // FrmPDV.cli_tipo_end:= DM.qrychama_clienteTipo_Logradouro.AsString;
    FrmPDV.cli_end := dm.qrychama_clienteEndereco.AsString;
    FrmPDV.cli_num := dm.qrychama_clienteNumero.AsString;
    FrmPDV.cli_set := dm.qrychama_clienteSetor.AsString;
    FrmPDV.cli_cid := dm.qrychama_clienteCidade.AsString;
    FrmPDV.cli_uf := dm.qrychama_clienteUF.AsString;
    FrmPDV.cli_cod_mun := dm.qrychama_clienteCodigo_Municipio.AsString;
    FrmPDV.cli_cep := dm.qrychama_clienteCEP.AsString;
    FrmPDV.cli_tel := dm.qrychama_clienteTelefone.AsString;
    FrmPDV.cli_comp := dm.qrychama_clienteComplemento.AsString;

    FrmInformar_Cliente_PDV.EdtCodigo_Cliente.Text :=
      dm.qrychama_clienteCodigo.AsString;

    if (dm.qrychama_clienteRazao_Social.AsString = '') then
      FrmInformar_Cliente_PDV.EdtNome.Text :=
        dm.qrychama_clienteNome_Nome_Fantasia.AsString
    else
      FrmInformar_Cliente_PDV.EdtNome.Text :=
        dm.qrychama_clienteRazao_Social.AsString;

    if (dm.qrychama_clienteTipo.AsString = 'FÍSICO') then
      FrmInformar_Cliente_PDV.EdtCPF_CNPJ.Text :=
        dm.qrychama_clienteCPF.AsString
    else
      FrmInformar_Cliente_PDV.EdtCPF_CNPJ.Text :=
        dm.qrychama_clienteCNPJ.AsString;

    FrmInformar_Cliente_PDV.EdtEndereco.Text :=
      dm.qrychama_clienteEndereco.AsString + ', ' +
      dm.qrychama_clienteNumero.AsString;
    FrmChama_Cliente.close;
  end
  else if (FrmPedido_Venda <> nil) and (FrmPedido_Venda.ativo = true) then
  begin
    if (dm.qrychama_clienteBloqueado.AsString = 'SIM') then
    begin
      Mensagem_Cliente_Bloqueado;
      abort;
    end;

    FrmPedido_Venda.EdtCodigo_Cliente.Text :=
      dm.qrychama_clienteCodigo.AsString;
    FrmPedido_Venda.EdtCliente.Text := dm.qrychama_clienteRazao_Social.AsString;

    if (dm.qrychama_clienteCPF.AsString <> '') then
      FrmPedido_Venda.LblCPF.Caption := dm.qrychama_clienteCPF.AsString
    else if (dm.qrychama_clienteCNPJ.AsString <> '') then
      FrmPedido_Venda.LblCPF.Caption := dm.qrychama_clienteCNPJ.AsString
    else
      FrmPedido_Venda.LblCPF.Caption := '';

    FrmPedido_Venda.LblCidade.Caption := dm.qrychama_clienteCidade.AsString;
    FrmPedido_Venda.LblInscricao_Estadual.Caption :=
      dm.qrychama_clienteInsc_Estadual.AsString;
    FrmPedido_Venda.LblSetor.Caption := dm.qrychama_clienteSetor.AsString;
    FrmPedido_Venda.LblEndereco.Caption := dm.qrychama_clienteEndereco.AsString;
    // FrmPedido_Venda.LblTipo_Logradouro.Caption := dm.qrychama_clienteTipo_Logradouro.AsString;
    FrmPedido_Venda.LblUF.Caption := dm.qrychama_clienteUF.AsString;
    FrmPedido_Venda.LblTelefone.Caption := dm.qrychama_clienteTelefone.AsString;
    FrmPedido_Venda.LblNumero.Caption := dm.qrychama_clienteNumero.AsString;
    FrmPedido_Venda.LblCEP.Caption := dm.qrychama_clienteCEP.AsString;
    FrmPedido_Venda.LblCodigo_Municipio.Caption :=
      dm.qrychama_clienteCodigo_Municipio.AsString;
    FrmPedido_Venda.LblComplemento.Caption :=
      dm.qrychama_clienteComplemento.AsString;
    permissao_desconto := dm.qrychama_clienteAcima_Limite_Desconto.AsString;
    limite_credito_cliente := dm.qrychama_clienteLimite_Credito.AsFloat;
    credito_cliente := dm.qrychama_clienteCredito.AsFloat;
    desconto_cliente := dm.qrychama_clienteLimite_Desconto.AsFloat;
    FrmPedido_Venda.EdtDesc_Acr.Text :=
      dm.qrychama_clienteLimite_Desconto.AsString;

    if (desconto_cliente <> 0) then
      FrmPedido_Venda.RGTipoDesc.ItemIndex := 0
    else
      FrmPedido_Venda.RGTipoDesc.ItemIndex := tipo_desc_acr_padrao;

    acima_limite_credito_cliente :=
      dm.qrychama_clienteAcima_Limite_Credito.AsString;

    ColocaHintInput;

    if (dm.qrychama_clienteCodigo_Tabela_Preco.AsInteger <> 0) then
    begin
      Atualiza_Codigo_Tabela_Padrao
        (dm.qrychama_clienteCodigo_Tabela_Preco.AsInteger);
    end
    else
    begin
      Atualiza_Codigo_Tabela_Padrao(codigo_tabela_preco_padrao);
    end;

    FrmPedido_Venda.EdtCodigo_Forma_Pagamento.SetFocus;
    FrmChama_Cliente.close;
  end
  else if (FrmGera_Ordem_Entrega <> nil) and (FrmGera_Ordem_Entrega.ativo = true)
  then
  begin
    FrmGera_Ordem_Entrega.EdtCodigo_Cliente.Text :=
      dm.qrychama_clienteCodigo.AsString;
    FrmGera_Ordem_Entrega.EdtCliente.Text :=
      dm.qrychama_clienteNome_Nome_Fantasia.AsString;
    FrmChama_Cliente.close;
  end
  else if (FrmMovimentacao_Manual <> nil) and
    (FrmMovimentacao_Manual.ativo = true) then
  begin
    FrmMovimentacao_Manual.EdtCodigo_Cliente.Text :=
      dm.qrychama_clienteCodigo.AsString;
    FrmMovimentacao_Manual.EdtCliente.Text :=
      dm.qrychama_clienteNome_Nome_Fantasia.AsString;
    FrmChama_Cliente.close;
  end
  else if (FrmCadastro_Veiculo <> nil) and (FrmCadastro_Veiculo.ativo = true)
  then
  begin
    FrmCadastro_Veiculo.EdtCodigo_Cliente.Text :=
      dm.qrychama_clienteCodigo.AsString;
    FrmCadastro_Veiculo.EdtCliente.Text :=
      dm.qrychama_clienteNome_Nome_Fantasia.AsString;
    FrmChama_Cliente.close;
  end
  else if (FrmOS <> nil) and (FrmOS.ativo = true) then
  begin
    FrmOS.EdtCodigo_Cliente.Text := dm.qrychama_clienteCodigo.AsString;
    FrmOS.EdtCliente.Text := dm.qrychama_clienteNome_Nome_Fantasia.AsString;
    if (dm.qrychama_clienteCPF.AsString <> '') then
      FrmOS.LblCPF.Caption := dm.qrychama_clienteCPF.AsString
    else if (dm.qrychama_clienteCNPJ.AsString <> '') then
      FrmOS.LblCPF.Caption := dm.qrychama_clienteCNPJ.AsString
    else
      FrmOS.LblCPF.Caption := '';

    FrmOS.LblCidade.Caption := dm.qrychama_clienteCidade.AsString;
    FrmOS.LblSetor.Caption := dm.qrychama_clienteSetor.AsString;
    FrmOS.LblEndereco.Caption := dm.qrychama_clienteEndereco.AsString;
    // FrmOS.LblTipo_Logradouro.Caption := dm.qrychama_clienteTipo_Logradouro.AsString;
    FrmOS.LblUF.Caption := dm.qrychama_clienteUF.AsString;
    FrmOS.LblTelefone.Caption := dm.qrychama_clienteTelefone.AsString;
    FrmOS.LblNumero.Caption := dm.qrychama_clienteNumero.AsString;

    FrmOS.EdtLimite_Compra.Text := FormatFloat('#0.0,0',
      dm.qrychama_clienteLimite_Credito.AsFloat);
    FrmOS.EdtLimite_Compra.Text := StringReplace(FrmOS.EdtLimite_Compra.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmOS.EdtLimite_Compra_Disponivel.Text :=
      FormatFloat('#0.0,0', dm.qrychama_clienteLimite_Credito.AsFloat);
    FrmOS.EdtLimite_Compra_Disponivel.Text :=
      StringReplace(FrmOS.EdtLimite_Compra_Disponivel.Text, ThousandSeparator,
      '', [rfReplaceAll]);

    FrmOS.EdtLimite_Desconto.Text := FormatFloat('#0.0,0',
      dm.qrychama_clienteLimite_Desconto.AsFloat);
    FrmOS.EdtLimite_Desconto.Text :=
      StringReplace(FrmOS.EdtLimite_Desconto.Text, ThousandSeparator, '',
      [rfReplaceAll]);

    FrmOS.EdtLimite_Desconto_Disponivel.Text :=
      FormatFloat('#0.0,0', dm.qrychama_clienteLimite_Desconto.AsFloat);
    FrmOS.EdtLimite_Desconto_Disponivel.Text :=
      StringReplace(FrmOS.EdtLimite_Desconto.Text, ThousandSeparator, '',
      [rfReplaceAll]);

    permissao_desconto := dm.qrychama_clienteAcima_Limite_Desconto.AsString;
    permissao_credito := dm.qrychama_clienteAcima_Limite_Credito.AsString;
    FrmChama_Cliente.close;
  end
  else if (FrmPre_Venda <> nil) and (FrmPre_Venda.ativo = true) then
  begin
    FrmPre_Venda.EdtCodigo_Cliente.Text := dm.qrychama_clienteCodigo.AsString;
    FrmPre_Venda.EdtCliente.Text :=
      dm.qrychama_clienteNome_Nome_Fantasia.AsString;
    if (dm.qrychama_clienteCPF.AsString <> '') then
      FrmPre_Venda.LblCPF.Caption := dm.qrychama_clienteCPF.AsString
    else if (dm.qrychama_clienteCNPJ.AsString <> '') then
      FrmPre_Venda.LblCPF.Caption := dm.qrychama_clienteCNPJ.AsString
    else
      FrmPre_Venda.LblCPF.Caption := '';

    FrmPre_Venda.LblCidade.Caption := dm.qrychama_clienteCidade.AsString;
    FrmPre_Venda.LblSetor.Caption := dm.qrychama_clienteSetor.AsString;
    FrmPre_Venda.LblEndereco.Caption := dm.qrychama_clienteEndereco.AsString;
    // FrmPre_Venda.LblTipo_Logradouro.Caption := dm.qrychama_clienteTipo_Logradouro.AsString;
    FrmPre_Venda.LblUF.Caption := dm.qrychama_clienteUF.AsString;
    FrmPre_Venda.LblTelefone.Caption := dm.qrychama_clienteTelefone.AsString;
    FrmPre_Venda.LblNumero.Caption := dm.qrychama_clienteNumero.AsString;

    FrmPre_Venda.EdtLimite_Compra.Text :=
      FormatFloat('#0.0,0', dm.qrychama_clienteLimite_Credito.AsFloat);
    FrmPre_Venda.EdtLimite_Compra.Text :=
      StringReplace(FrmPre_Venda.EdtLimite_Compra.Text, ThousandSeparator, '',
      [rfReplaceAll]);

    FrmPre_Venda.EdtLimite_Compra_Disponivel.Text :=
      FormatFloat('#0.0,0', dm.qrychama_clienteLimite_Credito.AsFloat);
    FrmPre_Venda.EdtLimite_Compra_Disponivel.Text :=
      StringReplace(FrmPre_Venda.EdtLimite_Compra_Disponivel.Text,
      ThousandSeparator, '', [rfReplaceAll]);

    FrmPre_Venda.EdtLimite_Desconto.Text :=
      FormatFloat('#0.0,0', dm.qrychama_clienteLimite_Desconto.AsFloat);
    FrmPre_Venda.EdtLimite_Desconto.Text :=
      StringReplace(FrmPre_Venda.EdtLimite_Desconto.Text, ThousandSeparator, '',
      [rfReplaceAll]);

    FrmPre_Venda.EdtLimite_Desconto_Disponivel.Text :=
      FormatFloat('#0.0,0', dm.qrychama_clienteLimite_Desconto.AsFloat);
    FrmPre_Venda.EdtLimite_Desconto_Disponivel.Text :=
      StringReplace(FrmPre_Venda.EdtLimite_Desconto.Text, ThousandSeparator, '',
      [rfReplaceAll]);

    permissao_desconto := dm.qrychama_clienteAcima_Limite_Desconto.AsString;
    permissao_credito := dm.qrychama_clienteAcima_Limite_Credito.AsString;
    FrmChama_Cliente.close;
  end
  else if (FrmConsulta_Lancamentos_Financeiros <> nil) and
    (FrmConsulta_Lancamentos_Financeiros.ativo = true) then
  begin
    FrmConsulta_Lancamentos_Financeiros.EdtCodigo_Cli_For.Text :=
      dm.qrychama_clienteCodigo.AsString;
    FrmConsulta_Lancamentos_Financeiros.EdtConsulta.Text :=
      dm.qrychama_clienteNome_Nome_Fantasia.AsString;
    FrmChama_Cliente.close;
  end
  else if (FrmConsulta_OS <> nil) and (FrmConsulta_OS.ativo = true) then
  begin
    FrmConsulta_OS.EdtCodigo_Cliente.Text := dm.qrychama_clienteCodigo.AsString;
    FrmConsulta_OS.EdtCliente.Text :=
      dm.qrychama_clienteNome_Nome_Fantasia.AsString;
    FrmChama_Cliente.close;
  end
  else if (FrmGerar_Documentos <> NIl) and (FrmGerar_Documentos.ativo = true)
  then
  begin
    FrmGerar_Documentos.EdtCodigo_Cliente.Text :=
      dm.qrychama_clienteCodigo.AsString;
    FrmGerar_Documentos.EdtCliente.Text :=
      dm.qrychama_clienteNome_Nome_Fantasia.AsString;
    FrmChama_Cliente.close;
  end
  else if (FrmNFE <> nil) and (FrmNFE.ativo = true) then
  begin
    FrmNFE.EdtCodigo_Destinatario.Text := dm.qrychama_clienteCodigo.AsString;
    FrmNFE.EdtDestinatario.Text :=
      dm.qrychama_clienteNome_Nome_Fantasia.AsString;

    if (dm.qrychama_clienteCNPJ.AsString <> '') then
      cnpj_destinatario := dm.qrychama_clienteCNPJ.AsString
    else if (dm.qrychama_clienteCPF.AsString <> '') then
      cnpj_destinatario := dm.qrychama_clienteCPF.AsString;

    razao_social_destinatario :=
      dm.qrychama_clienteRazao_Social.AsString;
    endereco_destinatario := dm.qrychama_clienteEndereco.AsString;
    numero_destinatario := dm.qrychama_clienteNumero.AsString;
    complemento_destinatario := dm.qrychama_clienteComplemento.AsString;
    setor_destinatario := dm.qrychama_clienteSetor.AsString;
    codigo_municipio_destinatario :=
      dm.qrychama_clienteCodigo_Municipio.AsString;
    municipio_destinatario := dm.qrychama_clienteCidade.AsString;
    uf_destinatario := dm.qrychama_clienteUF.AsString;
    telefone_destinatario := dm.qrychama_clienteTelefone.AsString;
    ie_destinatario := dm.qrychama_clienteInsc_Estadual.AsString;
    im_destinatario := dm.qrychama_clienteInsc_Municipal.AsString;
    cep_destinatario := dm.qrychama_clienteCEP.AsString;
    email_destinatario := dm.qrychama_clienteEmail.AsString;
    suframa_destinatario := dm.qrychama_clienteSuframa.AsString;
    enquadramento := dm.qrychama_clienteEnquadramento.AsString;
    FrmChama_Cliente.close;
  end
  else if (FrmConsulta_Venda <> NIl) and (FrmConsulta_Venda.ativo = true) then
  begin
    FrmConsulta_Venda.EdtCodigo.Text := dm.qrychama_clienteCodigo.AsString;
    FrmConsulta_Venda.EdtConsulta.Text :=
      dm.qrychama_clienteNome_Nome_Fantasia.AsString;
    FrmChama_Cliente.close;
  end
  else if (FrmGera_Etiqueta <> NIl) and (FrmGera_Etiqueta.ativo = true) then
  begin
    FrmGera_Etiqueta.EdtCliente.Text :=
      dm.qrychama_clienteNome_Nome_Fantasia.AsString;
    FrmGera_Etiqueta.EdtEndereco.Text := dm.qrychama_clienteEndereco.AsString;
    FrmGera_Etiqueta.EdtNumero_Cliente.Text :=
      dm.qrychama_clienteNumero.AsString;
    FrmGera_Etiqueta.EdtSetor_Cliente.Text := dm.qrychama_clienteSetor.AsString;
    FrmGera_Etiqueta.EdtCEP.Text := dm.qrychama_clienteCEP.AsString;
    FrmChama_Cliente.close;
  end
  else if (FrmEnvia_SMS <> NIl) and (FrmEnvia_SMS.ativo = true) then
  begin
    FrmEnvia_SMS.EdtCliente.Text :=
      dm.qrychama_clienteNome_Nome_Fantasia.AsString;
    ddd := copy(dm.qrychama_clienteCelular.AsString, 1, 4);
    ddd := StringReplace(ddd, '(', '', [rfReplaceAll]);
    ddd := StringReplace(ddd, ')', '', [rfReplaceAll]);

    FrmEnvia_SMS.EdtDDD.Text := ddd;

    telefone := copy(dm.qrychama_clienteCelular.AsString, 5, 10);
    telefone := StringReplace(telefone, '-', '', [rfReplaceAll]);
    telefone := StringReplace(telefone, '(', '', [rfReplaceAll]);
    telefone := StringReplace(telefone, ')', '', [rfReplaceAll]);

    FrmEnvia_SMS.EdtTelefone.Text := telefone;
    FrmChama_Cliente.close;
  end
  else if (FrmConsulta_Ficha_Cliente <> NIl) and
    (FrmConsulta_Ficha_Cliente.ativo = true) then
  begin
    FrmConsulta_Ficha_Cliente.EdtCodigo.Text :=
      dm.qrychama_clienteCodigo.AsString;
    FrmConsulta_Ficha_Cliente.EdtDescricao.Text :=
      dm.qrychama_clienteNome_Nome_Fantasia.AsString;
    FrmChama_Cliente.close;
  end;
end;

procedure TFrmChama_Cliente.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid1 do
  begin
    if Odd(DataSource.DataSet.RecNo) then
      Canvas.Brush.Color := clMenu
    else
      Canvas.Brush.Color := clWindow;

    Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.font.Color := clBlack;

    if gdSelected in State then
      with (Sender as TDBGrid).Canvas do
      begin
        Brush.Color := clSilver;
        FillRect(Rect);
      end;

    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFrmChama_Cliente.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_return) then
  begin
    DBGrid1DblClick(self);
  end;

  if (Key = VK_UP) then
  begin
    Pega_Endereco;
    Pega_Cliente_Outros;
    Pega_Autorizados;
    Pega_Dados_Adicionais;
  end
  else if (Key = VK_DOWN) then
  begin
    Pega_Endereco;
    Pega_Cliente_Outros;
    Pega_Autorizados;
    Pega_Dados_Adicionais;
  end;
end;

procedure TFrmChama_Cliente.DBGrid1TitleClick(Column: TColumn);
begin
  Util.Ordena_Grid(dm.qrychama_cliente, Column);
end;

procedure TFrmChama_Cliente.DBGrid2DblClick(Sender: TObject);
begin
  if (FrmPDV <> nil) and (FrmPDV.ativo = true) then
  begin
    if (dm.qrychama_clienteBloqueado.AsString = 'SIM') then
    begin
      Mensagem_Cliente_Bloqueado;
      abort;
    end;

    FrmPDV.Codigo_Cliente := dm.qrychama_clienteCodigo.AsInteger;
    FrmPDV.Nome := dm.qrychama_clienteNome_Nome_Fantasia.AsString;

    if (dm.qrychama_clienteTipo.AsString = 'FÍSICO') then
    begin
      FrmPDV.CPF := dm.qrychama_clienteCPF.AsString;
      cnpj_destinatario:=dm.qrychama_clienteCPF.AsString;
      razao_social_destinatario:= dm.qrychama_clienteNome_Nome_Fantasia.AsString;
    end
    else
    begin
      FrmPDV.CPF := dm.qrychama_clienteCNPJ.AsString;
      cnpj_destinatario:=dm.qrychama_clienteCNPJ.AsString;
      razao_social_destinatario:= dm.qrychama_clienteRazao_Social.AsString;
    end;

    ie_destinatario:= dm.qrychama_clienteInsc_Estadual.AsString;
    razao_social_destinatario:= dm.qrychama_clienteRazao_Social.AsString;
    telefone_destinatario:= dm.qrychama_clienteTelefone.AsString;
    cep_destinatario:= dm.qrychama_clienteCEP.AsString;
    endereco_destinatario:= dm.qrychama_clienteEndereco.AsString;
    numero_destinatario:= dm.qrychama_clienteNumero.AsString;
    complemento_destinatario:= dm.qrychama_clienteComplemento.AsString;
    setor_destinatario:= dm.qrychama_clienteSetor.AsString;
    codigo_municipio_destinatario:= dm.qrychama_clienteCodigo_Municipio.AsString;
    municipio_destinatario:= dm.qrychama_clienteCidade.AsString;
    uf_destinatario:= dm.qrychama_clienteUF.AsString;

    FrmPDV.cli_end := dm.qryendereco_clienteEndereco.AsString;
    FrmPDV.cli_num := dm.qryendereco_clienteNumero.AsString;
    FrmPDV.cli_set := dm.qryendereco_clienteSetor.AsString;
    FrmPDV.cli_cid := dm.qrychama_clienteCidade.AsString;
    FrmPDV.cli_uf := dm.qrychama_clienteUF.AsString;
    FrmPDV.cli_cod_mun := dm.qrychama_clienteCodigo_Municipio.AsString;
    FrmPDV.cli_cep := dm.qryendereco_clienteCEP.AsString;
    FrmPDV.cli_tel := dm.qrychama_clienteTelefone.AsString;
    FrmPDV.cli_comp := dm.qryendereco_clienteComplemento.AsString;

    FrmInformar_Cliente_PDV.EdtCodigo_Cliente.Text :=
      dm.qrychama_clienteCodigo.AsString;
    FrmInformar_Cliente_PDV.EdtNome.Text :=
      dm.qrychama_clienteNome_Nome_Fantasia.AsString;

    if (dm.qrychama_clienteTipo.AsString = 'FÍSICO') then
      FrmInformar_Cliente_PDV.EdtCPF_CNPJ.Text :=
        dm.qrychama_clienteCPF.AsString
    else
      FrmInformar_Cliente_PDV.EdtCPF_CNPJ.Text :=
        dm.qrychama_clienteCNPJ.AsString;

    FrmInformar_Cliente_PDV.EdtEndereco.Text :=
      dm.qryendereco_clienteEndereco.AsString + ', ' +
      dm.qryendereco_clienteNumero.AsString;

    FrmPDV.Tipo_Cliente := dm.qrychama_clienteTipo.AsString;
    FrmPDV.Endereco := dm.qryendereco_clienteEndereco.AsString + ', ' +
      dm.qryendereco_clienteNumero.AsString + ', Setor ' +
      dm.qryendereco_clienteSetor.AsString;

    FrmChama_Cliente.close;
  end
  else if (FrmPedido_Venda <> nil) and (FrmPedido_Venda.ativo = true) then
  begin
    if (dm.qrychama_clienteBloqueado.AsString = 'SIM') then
    begin
      Mensagem_Cliente_Bloqueado;
      abort;
    end;

    // DESCONTOS
    credito_cliente := dm.qrychama_clienteCredito.AsFloat;
    desconto_cliente := dm.qrychama_clienteLimite_Desconto.AsFloat;
    FrmPedido_Venda.EdtDesc_Acr.Text :=
      dm.qrychama_clienteLimite_Desconto.AsString;

    if (desconto_cliente <> 0) then
      FrmPedido_Venda.RGTipoDesc.ItemIndex := 0
    else
      FrmPedido_Venda.RGTipoDesc.ItemIndex := tipo_desc_acr_padrao;

    acima_limite_credito_cliente :=
      dm.qrychama_clienteAcima_Limite_Credito.AsString;

    ColocaHintInput;

    if (dm.qrychama_clienteCodigo_Tabela_Preco.AsInteger <> 0) then
    begin
      Atualiza_Codigo_Tabela_Padrao
        (dm.qrychama_clienteCodigo_Tabela_Preco.AsInteger);
    end
    else
    begin
      Atualiza_Codigo_Tabela_Padrao(codigo_tabela_preco_padrao);
    end;

    FrmPedido_Venda.EdtCodigo_Forma_Pagamento.SetFocus;
    FrmChama_Cliente.close;
    /// ////

    FrmPedido_Venda.EdtCodigo_Cliente.Text :=
      dm.qrychama_clienteCodigo.AsString;
    FrmPedido_Venda.EdtCliente.Text := dm.qrychama_clienteRazao_Social.AsString;

    if (dm.qrychama_clienteCPF.AsString <> '') then
      FrmPedido_Venda.LblCPF.Caption := dm.qrychama_clienteCPF.AsString
    else if (dm.qrychama_clienteCNPJ.AsString <> '') then
      FrmPedido_Venda.LblCPF.Caption := dm.qrychama_clienteCNPJ.AsString
    else
      FrmPedido_Venda.LblCPF.Caption := '';

    FrmPedido_Venda.LblCidade.Caption := dm.qryendereco_clienteCidade.AsString;
    FrmPedido_Venda.LblSetor.Caption := dm.qryendereco_clienteSetor.AsString;
    FrmPedido_Venda.LblEndereco.Caption :=
      dm.qryendereco_clienteEndereco.AsString;
    FrmPedido_Venda.LblUF.Caption := dm.qryendereco_clienteUF.AsString;
    FrmPedido_Venda.LblTelefone.Caption := dm.qrychama_clienteTelefone.AsString;
    FrmPedido_Venda.LblNumero.Caption := dm.qryendereco_clienteNumero.AsString;
    FrmPedido_Venda.LblCEP.Caption := dm.qryendereco_clienteCEP.AsString;
    FrmPedido_Venda.LblInscricao_Estadual.Caption :=
      dm.qrychama_clienteInsc_Estadual.AsString;
    FrmPedido_Venda.EdtCliente.Hint :=
      FrmPedido_Venda.LblTipo_Logradouro.Caption + ' ' +
      FrmPedido_Venda.LblEndereco.Caption + #13 + 'Nº.: ' +
      FrmPedido_Venda.LblNumero.Caption + #13 + 'Setor: ' +
      FrmPedido_Venda.LblSetor.Caption;

    FrmPedido_Venda.LblCodigo_Municipio.Caption :=
      dm.qryendereco_clienteCodigo_Municipio.AsString;
    FrmPedido_Venda.LblComplemento.Caption :=
      dm.qryendereco_clienteComplemento.AsString;

    permissao_desconto := dm.qrychama_clienteAcima_Limite_Desconto.AsString;

    FrmChama_Cliente.close;
  end;
end;

procedure TFrmChama_Cliente.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid2 do
  begin
    if Odd(DataSource.DataSet.RecNo) then
      Canvas.Brush.Color := clMenu
    else
      Canvas.Brush.Color := clWindow;

    Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.font.Color := clBlack;

    if gdSelected in State then
      with (Sender as TDBGrid).Canvas do
      begin
        Brush.Color := clSilver;
        FillRect(Rect);
      end;

    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFrmChama_Cliente.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid3 do
  begin
    if Odd(DataSource.DataSet.RecNo) then
      Canvas.Brush.Color := clMenu
    else
      Canvas.Brush.Color := clWindow;

    Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.font.Color := clBlack;

    if gdSelected in State then
      with (Sender as TDBGrid).Canvas do
      begin
        Brush.Color := clSilver;
        FillRect(Rect);
      end;

    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFrmChama_Cliente.EdtConsultaChange(Sender: TObject);
begin
  Consulta.Chama_Cliente(EdtConsulta.Text);
end;

procedure TFrmChama_Cliente.EdtConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_return) then
  begin
    Consulta.Chama_Cliente(EdtConsulta.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFrmChama_Cliente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FrmChama_Cliente.Release;
end;

procedure TFrmChama_Cliente.Pega_Autorizados;
begin
  with dm.qryautorizados, sql do
  begin
    close;
    Clear;
    add('select CA.* from Cliente_Autorizados CA');
    add('where CA.Codigo_Cliente = :Cliente');
    Parameters.ParamByName('Cliente').Value :=
      dm.qrychama_clienteCodigo.AsInteger;
    Open;
  end;
end;

procedure TFrmChama_Cliente.Pega_Cliente_Outros;
begin
  with qrychama_cliente_outros, sql do
  begin
    close;
    Parameters.ParamByName('Codigo').Value :=
      dm.qrychama_clienteCodigo.AsInteger;
    Open;
  end;
end;

procedure TFrmChama_Cliente.FormCreate(Sender: TObject);
begin
  // dm.qrychama_cliente.LoadFromFile(Local_Arquivo(9));
  dm.qrychama_cliente.close;
  dm.qrychama_cliente.Open;
  dm.qryendereco_cliente.close;
  dm.qryautorizados.close;
  DBGrid1.DataSource:= dm.DataSource3;
end;

procedure TFrmChama_Cliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_escape) then
    close;
end;

procedure TFrmChama_Cliente.FormShow(Sender: TObject);
begin
  dm.qrychama_cliente.close;
  dm.qrychama_cliente.Open;
end;

procedure TFrmChama_Cliente.Pega_Endereco;
begin
  with dm.qryendereco_cliente, sql do
  begin
    close;
    Clear;
    add('select EC.*, S.Descricao as Setor, C.Descricao as Cidade, C.UF, C.Codigo_Municipio from Endereco_Cliente EC');
    add('left join Setor S on (EC.Codigo_Setor = S.Codigo)');
    add('left join Cidade C on (EC.Codigo_Cidade =  C.Codigo)');
    add('where EC.Codigo_Cliente = :Cliente');
    Parameters.ParamByName('Cliente').Value :=
      dm.qrychama_clienteCodigo.AsInteger;
    Open;
  end;
end;

procedure TFrmChama_Cliente.Pega_Dados_Adicionais;
begin
  with dm.qrydados_adicionais, sql do
  begin
    close;
    Clear;
    add('select DA.*, CI.UF, CI.Descricao as Cidade, S.Descricao as Setor, CI.Codigo_Municipio from Dados_Adicionais_Cliente DA');
    // add('left join Cliente C on (DA.Codigo_Cliente = C.Codigo)');
    add('left join Cidade CI on (DA.Codigo_Cidade = CI.Codigo)');
    add('left join Setor S on (DA.Codigo_Setor = S.Codigo)');
    add('where DA.Codigo_Cliente = :Cliente');
    Parameters.ParamByName('Cliente').Value :=
      dm.qrychama_clienteCodigo.AsInteger;
    Open;
  end;
end;

end.
