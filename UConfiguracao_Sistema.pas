unit UConfiguracao_Sistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, Mask, StdCtrls, ADODB, DB, Grids, DBGrids, UGeral, URegistro,
  IniFiles, ExtCtrls, Buttons, ACBrNFe,
  Modelo.Dominio.TConfiguracoesECFDominio,
  Modelo.Entidade.TConfiguracoesECFEntidade, ACBrBase, ACBrETQ, ACBrDFe;

type
  TFrmConfiguracao_Sistema = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TlbFerramentas: TToolBar;
    BBtnSalvar: TToolButton;
    BBtnExcluir: TToolButton;
    BBtnCancelar: TToolButton;
    BBtnFechar: TToolButton;
    BBtnPesquisar: TToolButton;
    Label1: TLabel;
    EdtMensagem_Cupom: TEdit;
    OpenDialog1: TOpenDialog;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    EdtPerfil: TEdit;
    EdtCodigo_Tipo_Atividade: TEdit;
    Label4: TLabel;
    EdtTipo_Atividade: TEdit;
    Label5: TLabel;
    EdtVersao_EFD: TEdit;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Label40: TLabel;
    EdtTabela_Preco: TEdit;
    EdtCodigo_Tabela_Preco: TEdit;
    TabSheet13: TTabSheet;
    GroupBox1: TGroupBox;
    CBTabela_Preco: TCheckBox;
    CBLancamento_Financeiro: TCheckBox;
    CBCheque: TCheckBox;
    CBPedido_Compra: TCheckBox;
    CBAniversario_Cliente: TCheckBox;
    CBAniversario_Funcionario: TCheckBox;
    Label41: TLabel;
    EdtDias_Avisar: TEdit;
    CBProduto_Vencido: TCheckBox;
    CBConta_Fixa: TCheckBox;
    CBCotacao_Preco: TCheckBox;
    Label42: TLabel;
    EdtISSQN: TEdit;
    Label43: TLabel;
    GroupBox2: TGroupBox;
    Label44: TLabel;
    EdtTipo_Documento: TEdit;
    EdtCodigo_Tipo_Documento: TEdit;
    Label45: TLabel;
    Label46: TLabel;
    EdtHistorico: TEdit;
    EdtDepartamento: TEdit;
    EdtCodigo_Departamento: TEdit;
    Label47: TLabel;
    EdtPlano: TEdit;
    EdtCodigo_Plano: TEdit;
    GroupBox3: TGroupBox;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    EdtTipo_Documento_Pagar: TEdit;
    EdtCodigo_Tipo_Documento_Pagar: TEdit;
    EdtHistorico_Pagar: TEdit;
    EdtDepartamento_Pagar: TEdit;
    EdtCodigo_Departamento_Pagar: TEdit;
    EdtPlano_Pagar: TEdit;
    EdtCodigo_Plano_Pagar: TEdit;
    Label52: TLabel;
    EdtTempo_Atualizacao: TEdit;
    TabSheet14: TTabSheet;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    GBConfiguracao_NFE: TGroupBox;
    Label9: TLabel;
    Label6: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    RGAmbiente: TRadioGroup;
    RGDanfe: TRadioGroup;
    RGForma_Emissao: TRadioGroup;
    EdtLogomarca: TEdit;
    EdtSalva_XML: TEdit;
    Button1: TButton;
    Button2: TButton;
    EdtN_Certificado: TEdit;
    EdtSenha_Certificado: TEdit;
    Button3: TButton;
    ACBrNFe1: TACBrNFe;
    Label53: TLabel;
    EdtCaminho_Schema: TEdit;
    Button4: TButton;
    RGEAN: TRadioGroup;
    Label54: TLabel;
    RGGerar_Financeiro: TRadioGroup;
    Label55: TLabel;
    EdtDias_Orcamento_Vencido: TEdit;
    CBFechar_Caixa: TCheckBox;
    CBCalcula_Juro: TCheckBox;
    CBOrcamento_Vencido: TCheckBox;
    RGConsulta_Produto_Por: TRadioGroup;
    RGTipoDesc_Acr_Fechamento: TRadioGroup;
    RGGerar_Estoque: TRadioGroup;
    TabSheet15: TTabSheet;
    GroupBox4: TGroupBox;
    CBCliente_Nome: TCheckBox;
    CBCliente_Razao_Social: TCheckBox;
    CBCliente_CPF: TCheckBox;
    CBCliente_RG: TCheckBox;
    CBCliente_CNPJ: TCheckBox;
    CBCliente_Insc_Estadual: TCheckBox;
    CBCliente_Endereco: TCheckBox;
    CBCliente_Cidade: TCheckBox;
    CBCliente_Setor: TCheckBox;
    CBCliente_Numero: TCheckBox;
    CBCliente_Email: TCheckBox;
    CBCliente_Telefone: TCheckBox;
    CBCliente_Data_Nascimento: TCheckBox;
    CBBloqueia_Cliente: TCheckBox;
    CBBackup: TCheckBox;
    TabSheet6: TTabSheet;
    Label7: TLabel;
    EdtCaminho_PDF_Pedido: TEdit;
    Button5: TButton;
    RGUsar_Comissao: TRadioGroup;
    RGImpressao_Pedido: TRadioGroup;
    RGTamanho_Impressao: TRadioGroup;
    Label8: TLabel;
    EdtQtde_Copias: TEdit;
    Label10: TLabel;
    EdtCaminho_PDF_Carne: TEdit;
    Button6: TButton;
    Label11: TLabel;
    MmoObservacoes_Carne: TMemo;
    RGTipo_Dias: TRadioGroup;
    TabSheet7: TTabSheet;
    GBGerar: TGroupBox;
    cbPre_Venda: TCheckBox;
    cbOS: TCheckBox;
    cbDAV: TCheckBox;
    cbNFe: TCheckBox;
    lbl1: TLabel;
    edtQuantidade_Maquinas: TEdit;
    dbgrd1: TDBGrid;
    qryconfiguracao_ecf: TADOQuery;
    ds1: TDataSource;
    qryconfiguracao_ecfCodigo: TAutoIncField;
    strngfld_ecfN_Fabricacao: TStringField;
    qryconfiguracao_ecfGT: TFloatField;
    strngfld_ecfPorta: TStringField;
    strngfld_ecfMarca: TStringField;
    strngfld_ecfCIECF: TStringField;
    strngfld_ecfMD5: TStringField;
    qryconfiguracao_ecfData_Ativacao: TDateTimeField;
    edtN_Fabricacao: TEdit;
    lbl2: TLabel;
    edtGT: TEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    edtPorta: TEdit;
    lbl5: TLabel;
    edtCIECF: TEdit;
    lbl6: TLabel;
    edtMD5: TEdit;
    lbl7: TLabel;
    pnl1: TPanel;
    cbModelo: TComboBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    RGTipo_OS: TRadioGroup;
    ACBrETQ1: TACBrETQ;
    Panel3: TPanel;
    GroupBox5: TGroupBox;
    Label12: TLabel;
    CBLimpar_Memoria: TCheckBox;
    Label13: TLabel;
    EdtAvanco_Etiqueta: TEdit;
    Label14: TLabel;
    EdtPorta_Impressora_Etiqueta: TEdit;
    Label15: TLabel;
    EdtTemperatura_Impressora_Etiqueta: TEdit;
    CBDPI_Impressora_Etiqueta: TComboBox;
    CBModelo_Etiqueta: TComboBox;
    Label16: TLabel;
    Label2: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label56: TLabel;
    cmbBalanca: TComboBox;
    EdtPorta_Balanca: TEdit;
    cmbBaudRate: TComboBox;
    cmbDataBits: TComboBox;
    cmbParity: TComboBox;
    cmbStopBits: TComboBox;
    cmbHandShaking: TComboBox;
    EdtTimeOut_Balanca: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    CBOpcao_Servico_Marcada: TCheckBox;
    CBDesbloqueia_Cliente: TCheckBox;
    CBControla_Credito: TCheckBox;
    RGBusca_Parametros_Calcular_Preco: TRadioGroup;
    cbCupomFiscal: TCheckBox;
    CBGera_Codigo_EAN: TCheckBox;
    Label74: TLabel;
    EdtCodigo_CFOP: TEdit;
    EdtCFOP: TEdit;
    CBTrazer_Cond_Pag_ECF: TCheckBox;
    Label17: TLabel;
    EdtModelo: TEdit;
    Label18: TLabel;
    EdtN_Caixa: TEdit;
    qryconfiguracao_ecfCodigo_Empresa: TIntegerField;
    Label19: TLabel;
    EdtIdCSC: TEdit;
    Label20: TLabel;
    EdtNumero_CSC: TEdit;
    procedure BBtnSalvarClick(Sender: TObject);
    procedure BBtnPesquisarClick(Sender: TObject);
    procedure BBtnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BBtnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BBtnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure BBtnCaminhoClick(Sender: TObject);
    procedure BBtnSalvar_ItemClick(Sender: TObject);
    procedure SBtnInserirClick(Sender: TObject);
    procedure SBtnExcluirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure EdtWebService_UF_1_ProducaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure EdtWebService_UF_1_HomologacaoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtWebService_UF_2_ProducaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtWebService_UF_2_HomologacaoKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure EdtCodigo_Tabela_PrecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Tipo_DocumentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Tipo_DocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTipo_DocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_DepartamentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDepartamentoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_PlanoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtPlanoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_DepartamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_PlanoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCodigo_Tipo_Documento_PagarKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtTipo_Documento_PagarKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Departamento_PagarKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure EdtDepartamento_PagarKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Plano_PagarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtPlano_PagarKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Plano_PagarKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Tipo_Documento_PagarKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtCodigo_Departamento_PagarKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtDias_AvisarKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTempo_AtualizacaoKeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
    procedure EdtCFOP_V_DKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCFOP_V_FKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCFOP_V_D_PKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtCFOP_V_F_PKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure dbgrd1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbOSClick(Sender: TObject);
    procedure EdtAvanco_EtiquetaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTemperatura_Impressora_EtiquetaKeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress(Sender: TObject;
      var Key: Char);
    procedure EdtISSQNKeyPress(Sender: TObject; var Key: Char);
    procedure EdtLargura_Barra_LargaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtHorizontal_BarraKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CFOPKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCFOPKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_Tabela_PrecoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtTabela_PrecoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCodigo_CFOPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    Configuracao: URegistro.TConfiguracao_Sistema;
    WebService1_Producao: URegistro.TWebService_1_Producao;
    WebService1_Homologacao: URegistro.TWebService_1_Homologacao;
    WebService2_Producao: URegistro.TWebService_2_Producao;
    WebService2_Homologacao: URegistro.TWebService_2_Homologacao;
    Util: TUtil;
    qAuxProd: TAdoQuery;
    oConfigECF: TConfiguracoesECFEntidade;
    oConfigECFDominio: TConfiguracoesECFDominio;

    procedure Atribui_Variaveis;
    procedure Altera_INI;
    procedure Pega_WebService_1_Producao;
    procedure Pega_WebService_2_Producao;
    procedure Pega_WebService_1_Homologacao;
    procedure Pega_WebService_2_Homologacao;
    procedure Habilita_Timer;
    procedure Atualiza_Produtos;
    procedure Atualiza_CFOP;
    procedure Atualiza_NCM;
    procedure Pega_Produtos;

  public
    ativo, altera_web, achei, receber: boolean;
    cfop: integer;
    procedure Inicia_Page;
  protected
    function Confira: boolean; virtual;
  end;

var
  FrmConfiguracao_Sistema: TFrmConfiguracao_Sistema;
implementation

uses UDM, UDeclaracao, UChama_Configuracao, UMenu_Geral, UChama_Tabela_Preco,
  UChama_Tipo_Documento, UChama_Departamento, UChama_Plano_Financeiro,
  UChama_CFOP, Util.Mensagens;

{$R *.dfm}

{ TFrmPadrao }

procedure TFrmConfiguracao_Sistema.Pega_Produtos;
begin
  qAuxProd:= TADOQuery.Create(self);
  try
    with qAuxProd, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select Pro.Codigo, Pro.Codigo_Original, Pro.Codigo_Venda from Produto Pro');
      Open;
      First;
    end;
  finally

  end;
end;

procedure TFrmConfiguracao_Sistema.Atualiza_CFOP;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  Pega_Produtos;
  try
    while not qAuxProd.Eof do
    begin
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('update Produto set CFOP_D = :CFOP_D, CFOP_F = :CFOP_F');
        add('where Codigo = :Codigo');
        //Parameters.ParamByName('CFOP_D').Value := EdtCFOP_D.Text;
        //Parameters.ParamByName('CFOP_F').Value := EdtCFOP_F.Text;
        Parameters.ParamByName('Codigo').Value := qAuxProd.FieldByName('Codigo').AsInteger;
        ExecSQL;
      end;
      qAuxProd.Next;
    end;

  finally
    FreeAndNil(qAux);
    FreeAndNil(qAuxProd);
  end;

end;

procedure TFrmConfiguracao_Sistema.Atualiza_NCM;
var
  qAux: TADOQuery;
begin
  qAux:= TADOQuery.Create(self);
  Pega_Produtos;
  try
    while not qAuxProd.Eof do
    begin
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('update Produto set NCM = :NCM');
        add('where Codigo = :Codigo');
        //Parameters.ParamByName('NCM').Value := EdtNCM.Text;
        Parameters.ParamByName('Codigo').Value := qAuxProd.FieldByName('Codigo').AsInteger;
        ExecSQL;
      end;
      qAuxProd.Next;
    end;

  finally
    FreeAndNil(qAux);
    FreeAndNil(qAuxProd);
  end;

end;

procedure TFrmConfiguracao_Sistema.Atualiza_Produtos;
var
  qAux: TADOQuery;
  aux, aux2, codor, codve: AnsiString;
  i: integer;
begin
  qAux:= TADOQuery.Create(self);
  Pega_Produtos;
  try
    while not qAuxProd.Eof do
    begin
      //atualiza o codigo original

      aux2:= '';
      aux:= '';
      aux := qAuxProd.FieldByName('Codigo_Original').AsString;

      for i := 1 to Length(aux) do
      begin
        if (Length(aux2) < 12) then
        begin
          if ( aux[i] in ['0'..'9'] ) then
          begin
            aux2:= aux2 + aux[i];
          end;
        end;
      end;

      codor := aux2;
      aux2:= '';
      aux:= '';
      aux2 := StringOfChar('0', 12 - Length(codor)) + codor;
      aux := CalculaDigEAN13(aux2);
      codor:= aux2 + aux;


      //atualiza o codigo de venda

      aux2:= '';
      aux:= '';
      aux := qAuxProd.FieldByName('Codigo_Venda').AsString;

      for i := 1 to Length(aux) do
      begin
        if (Length(aux2) < 12) then
        begin
          if ( aux[i] in ['0'..'9'] ) then
          begin
            aux2:= aux2 + aux[i];
          end;
        end;
      end;

      codve := aux2;
      aux2:= '';
      aux:= '';
      aux2 := StringOfChar('0', 12 - Length(codve)) + codve;
      aux := CalculaDigEAN13(aux2);
      codve:= aux2 + aux;


      //atualiza os códigos novos na tabela
      with qAux, sql do
      begin
        close;
        Connection := dm.ADOConnection1;
        clear;
        add('update Produto set Codigo_Original = :Codigo_Original, Codigo_Venda = :Codigo_Venda');
        add('where Codigo = :Codigo');
        Parameters.ParamByName('Codigo_Original').Value := codor;
        Parameters.ParamByName('Codigo_Venda').Value := codve;
        Parameters.ParamByName('Codigo').Value := qAuxProd.FieldByName('Codigo').AsInteger;
        ExecSQL;
      end;

      qAuxProd.Next;
    end;

  finally
    FreeAndNil(qAux);
    FreeAndNil(qAuxProd);
  end;

end;

procedure TFrmConfiguracao_Sistema.Altera_INI;
var
  ArqIni: TIniFile;
  porta, path:String;
  i: integer;
begin
  {porta:= EdtPorta_Comunicacao.Text;
  path:= EdtCaminho_ECF.Text;
  try
    ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'BemaFI32.ini');
    ArqIni.WriteString('Sistema', 'Porta', porta);
    ArqIni.WriteString('Sistema', 'Path', path);
  finally
    FreeAndNil(ArqIni);
  end;}
end;

procedure TFrmConfiguracao_Sistema.Habilita_Timer;
begin
  FrmMenu_Geral.Timer3.Interval:= tempo_atualizacao;
  FrmMenu_Geral.Enabled:= true;
end;

procedure TFrmConfiguracao_Sistema.Atribui_Variaveis;
begin
  mensagem:= EdtMensagem_Cupom.Text;
  perfil_arquivo:= EdtPerfil.Text;
  versao_efd:= EdtVersao_EFD.Text;
  tipo_atividade:= EdtCodigo_Tipo_Atividade.Text;
  caminho_pedido_pdf:= EdtCaminho_PDF_Pedido.Text;
  caminho_pdf_carne:= EdtCaminho_PDF_Carne.Text;
  observacoes_carne:= MmoObservacoes_Carne.Text;
  tipo_impressao_pedido:= RGImpressao_Pedido.ItemIndex;
  tipo_dias:= RGTipo_Dias.ItemIndex;

  if (RGAmbiente.ItemIndex = 0) then
    ambiente:= 'PRODUÇÃO'
  else
    ambiente:= 'HOMOLOGAÇÃO';

  if (RGDanfe.ItemIndex = 0) then
    impressao_danfe:= 'RETRATO'
  else
    impressao_danfe:= 'PAISAGEM';

  if (RGForma_Emissao.ItemIndex = 0) then
    forma_emissao:= 'NORMAL'
  else if (RGForma_Emissao.ItemIndex = 1) then
    forma_emissao:= 'CONTINGÊNCIA'
  else if (RGForma_Emissao.ItemIndex = 2) then
    forma_emissao:= 'SCAN'
  else if (RGForma_Emissao.ItemIndex = 3) then
    forma_emissao:= 'DPEC'
  else if (RGForma_Emissao.ItemIndex = 4) then
    forma_emissao:= 'FSDA';

  salva_xml:= EdtSalva_XML.Text;
  caminho_schema:= EdtCaminho_Schema.Text;
  logomarca:= EdtLogomarca.Text;
  n_certificado:= EdtN_Certificado.Text;
  senha_certificado:= EdtSenha_Certificado.Text;
  idcsc:= EdtIdCSC.Text;
  numerocsc:= EdtNumero_CSC.Text;
  issqnn:= EdtISSQN.Text;
  tempo_atualizacao:= StrToInt(EdtTempo_Atualizacao.Text);

  {webservice_1_producao:= EdtWebService_UF_1_Producao.Text;
  recepcao_1_producao:= EdtRecepcao_1_Producao.Text;
  retorno_1_producao:= EdtRetorno_1_Producao.Text;
  status_1_producao:= EdtStatus_1_Producao.Text;
  cancelamento_1_producao:= EdtCancelamento_1_Producao.Text;
  inutilizacao_1_producao:= EdtInutilizacao_1_Producao.Text;
  consulta_1_producao:= EdtConsulta_1_Producao.Text;
  consulta_cadastro_1_producao:= EdtConsulta_Cadastro_1_Producao.Text;

  webservice_2_producao:= EdtWebService_UF_2_Producao.Text;
  recepcao_2_producao:= EdtRecepcao_2_Producao.Text;
  retorno_2_producao:= EdtRetorno_2_Producao.Text;
  status_2_producao:= EdtStatus_2_Producao.Text;
  cancelamento_2_producao:= EdtCancelamento_2_Producao.Text;
  inutilizacao_2_producao:= EdtInutilizacao_2_Producao.Text;
  consulta_2_producao:= EdtConsulta_2_Producao.Text;
  consulta_cadastro_2_producao:= EdtConsulta_Cadastro_2_Producao.Text;

  webservice_1_Homologacao:= EdtWebService_UF_1_Homologacao.Text;
  recepcao_1_Homologacao:= EdtRecepcao_1_Homologacao.Text;
  retorno_1_Homologacao:= EdtRetorno_1_Homologacao.Text;
  status_1_Homologacao:= EdtStatus_1_Homologacao.Text;
  cancelamento_1_Homologacao:= EdtCancelamento_1_Homologacao.Text;
  inutilizacao_1_Homologacao:= EdtInutilizacao_1_Homologacao.Text;
  consulta_1_Homologacao:= EdtConsulta_1_Homologacao.Text;
  consulta_cadastro_1_Homologacao:= EdtConsulta_Cadastro_1_Homologacao.Text;

  webservice_2_Homologacao:= EdtWebService_UF_2_Homologacao.Text;
  recepcao_2_Homologacao:= EdtRecepcao_2_Homologacao.Text;
  retorno_2_Homologacao:= EdtRetorno_2_Homologacao.Text;
  status_2_Homologacao:= EdtStatus_2_Homologacao.Text;
  cancelamento_2_Homologacao:= EdtCancelamento_2_Homologacao.Text;
  inutilizacao_2_Homologacao:= EdtInutilizacao_2_Homologacao.Text;
  consulta_2_Homologacao:= EdtConsulta_2_Homologacao.Text;
  consulta_cadastro_2_Homologacao:= EdtConsulta_Cadastro_2_Homologacao.Text;}

  codigo_tabela_preco_padrao:= StrToInt(EdtCodigo_Tabela_Preco.Text);

  if (CBTabela_Preco.Checked = true) then
    avisa_tabela_preco:= 'SIM'
  else
    avisa_tabela_preco:= 'NÃO';

  if (CBLancamento_Financeiro.Checked = true) then
    avisa_lancamento_financeiro:= 'SIM'
  else
    avisa_lancamento_financeiro:= 'NÃO';

  if (CBCheque.Checked = true) then
    avisa_cheque:= 'SIM'
  else
    avisa_cheque:= 'NÃO';

  if (CBPedido_Compra.Checked = true) then
    avisa_pedido_compra:= 'SIM'
  else
    avisa_pedido_compra:= 'NÃO';

  if (CBAniversario_Cliente.Checked = true) then
    avisa_aniversario_cliente:= 'SIM'
  else
    avisa_aniversario_cliente:= 'NÃO';

  if (CBAniversario_Funcionario.Checked = true) then
    avisa_aniversario_funcionario:= 'SIM'
  else
    avisa_aniversario_funcionario:= 'NÃO';

  if (CBProduto_Vencido.Checked = true) then
    avisa_produto_vencido:= 'SIM'
  else
    avisa_produto_vencido:= 'NÃO';

  if (CBBackup.Checked = true) then
    fazer_backup:= 'SIM'
  else
    fazer_backup:= 'NÃO';

  if (CBConta_Fixa.Checked = true) then
    avisa_conta_fixa:= 'SIM'
  else
    avisa_conta_fixa:= 'NÃO';

  if (CBCotacao_Preco.Checked = true) then
    avisa_cotacao_preco:= 'SIM'
  else
    avisa_cotacao_preco:= 'NÃO';

  dias_aviso:= StrToInt(EdtDias_Avisar.Text);

  if (EdtCodigo_Tipo_Documento.Text = '') then
    codigo_tipo_documento:= 0
  else
    codigo_tipo_documento:= StrToInt(EdtCodigo_Tipo_Documento.Text);

  if (EdtCodigo_Departamento.Text = '') then
    codigo_departamento:= 0
  else
    codigo_departamento:= StrToInt(EdtCodigo_Departamento.Text);

  if (EdtCodigo_Plano.Text = '') then
    codigo_plano_financeiro:= 0
  else
    codigo_plano_financeiro:= StrToInt(EdtCodigo_Plano.Text);

  historico_conta:= EdtHistorico.Text;




  if (EdtCodigo_Tipo_Documento_Pagar.Text = '') then
    codigo_tipo_documento_pagar:= 0
  else
    codigo_tipo_documento_pagar:= StrToInt(EdtCodigo_Tipo_Documento_Pagar.Text);

  if (EdtCodigo_Departamento_Pagar.Text = '') then
    codigo_departamento_pagar:= 0
  else
    codigo_departamento_pagar:= StrToInt(EdtCodigo_Departamento_Pagar.Text);

  if (EdtCodigo_Plano_Pagar.Text = '') then
    codigo_plano_financeiro_pagar:= 0
  else
    codigo_plano_financeiro_pagar:= StrToInt(EdtCodigo_Plano_Pagar.Text);

  historico_conta_pagar:= EdtHistorico_Pagar.Text;
  gerar_financeiro:= RGGerar_Financeiro.ItemIndex;

  if (CBFechar_Caixa.Checked) then
    fechar_caixa_sair_sistema:= 0
  else
    fechar_caixa_sair_sistema:= 1;

  if (CBCalcula_Juro.Checked) then
    calcula_juro:= 0
  else
    calcula_juro:= 1;

  if (CBOrcamento_Vencido.Checked) then
    atualiza_or_vencido:= 0
  else
    atualiza_or_vencido:= 1;

  consulta_padrao_produto:= RGConsulta_Produto_Por.ItemIndex;
  tipo_desc_acr_padrao:= RGTipoDesc_Acr_Fechamento.ItemIndex;
  gerar_estoque:= RGGerar_Estoque.ItemIndex;
  usar_comissao:= RGUsar_Comissao.ItemIndex;

  if (CBCliente_Nome.Checked) then
    Ob_Cliente_Nome:= 0
  else
    Ob_Cliente_Nome:= 1;

  if (CBCliente_Razao_Social.Checked) then
    Ob_Cliente_Razao_Social:= 0
  else
    Ob_Cliente_Razao_Social:= 1;

  if (CBCliente_CPF.Checked) then
    Ob_Cliente_CPF:= 0
  else
    Ob_Cliente_CPF:= 1;

  if (CBCliente_RG.Checked) then
    Ob_Cliente_RG:= 0
  else
    Ob_Cliente_RG:= 1;

  if (CBCliente_CNPJ.Checked) then
    Ob_Cliente_CNPJ:= 0
  else
    Ob_Cliente_CNPJ:= 1;

  if (CBCliente_Insc_Estadual.Checked) then
    Ob_Cliente_Insc_Estadual:= 0
  else
    Ob_Cliente_Insc_Estadual:= 1;

  if (CBCliente_Endereco.Checked) then
    Ob_Cliente_Endereco:= 0
  else
    Ob_Cliente_Endereco:= 1;

  if (CBCliente_Numero.Checked) then
    Ob_Cliente_Numero:= 0
  else
    Ob_Cliente_Numero:= 1;

  if (CBCliente_Setor.Checked) then
    Ob_Cliente_Setor:= 0
  else
    Ob_Cliente_Setor:= 1;

  if (CBCliente_Email.Checked) then
    Ob_Cliente_Email:= 0
  else
    Ob_Cliente_Email:= 1;

  if (CBCliente_Cidade.Checked) then
    Ob_Cliente_Cidade:= 0
  else
    Ob_Cliente_Cidade:= 1;

  if (CBCliente_Data_Nascimento.Checked) then
    Ob_Cliente_Data_Nascimento:= 0
  else
    Ob_Cliente_Data_Nascimento:= 1;

  if (CBCliente_Telefone.Checked) then
    Ob_Cliente_Telefone:= 0
  else
    Ob_Cliente_Telefone:= 1;

  if (CBBloqueia_Cliente.Checked = true) then
    bloq_cliente:= 'SIM'
  else
    bloq_cliente:= 'NÃO';

  if (CBDesbloqueia_Cliente.Checked = true) then
    desbloq_cliente:= 'SIM'
  else
    desbloq_cliente:= 'NÃO';

  tamanho_impressao:= RGTamanho_Impressao.ItemIndex;
  tipo_os:= RGTipo_OS.ItemIndex;
  qtde_copias:= StrToInt(EdtQtde_Copias.Text);

  if (cbPre_Venda.Checked = true) then
    gera_pre_venda:= '0101'
  else
    gera_pre_venda:= '0202';

  if (cbOS.Checked = true) then
    gera_os:= '0101'
  else
    gera_os:= '0202';

  if (cbDAV.Checked = true) then
    gera_dav:= '0101'
  else
    gera_dav:= '0202';

  if (cbNFe.Checked = true) then
    gera_nfe:= '0101'
  else
    gera_nfe:= '0202';

  if (cbCupomFiscal.Checked = true) then
    gera_cupom_fiscal:= '0101'
  else
    gera_cupom_fiscal:= '0202';

  qtde_mac:= edtQuantidade_Maquinas.Text;

  Modelo_Etiqueta:= CBModelo_Etiqueta.ItemIndex;
  DPI_Impressora_Etiqueta:= CBDPI_Impressora_Etiqueta.ItemIndex;
  Avanco_Impressora_Etiqueta:= StrToInt(EdtAvanco_Etiqueta.Text);
  Porta_Impressora_Etiqueta:= EdtPorta_Impressora_Etiqueta.Text;
  Temperatura_Impressora_Etiqueta:= StrToInt(EdtTemperatura_Impressora_Etiqueta.Text);

  if (CBLimpar_Memoria.Checked) then
    Limpar_Memoria_Impressora_Etiqueta:= 0
  else
    Limpar_Memoria_Impressora_Etiqueta:= 1;

//  Orientacao_Impressao_Texto_Etiqueta:= CBOrientacao.ItemIndex;

//  Tamanho_Fonte_Texto_Etiqueta_Campo_1:= StrToInt(EdtTamanho_Fonte_Etiqueta_Campo_1.Text);
//  Multiplicador_V_Texto_Etiqueta_Campo_1:= StrToInt(EdtMultiplicador_V_Campo_1.Text);
//  Multiplicador_H_Texto_Etiqueta_Campo_1:= StrToInt(EdtMultiplicador_H_Campo_1.Text);
//  Horizontal_Texto_Etiqueta_Campo_1:= StrToInt(EdtHorizontal_Texto_Campo_1.Text);
//  Vertical_Texto_Etiqueta_Campo_1:= StrToInt(EdtVertical_Texto_Campo_1.Text);
//
//  Tamanho_Fonte_Texto_Etiqueta_Campo_2:= StrToInt(EdtTamanho_Fonte_Etiqueta_Campo_2.Text);
//  Multiplicador_V_Texto_Etiqueta_Campo_2:= StrToInt(EdtMultiplicador_V_Campo_2.Text);
//  Multiplicador_H_Texto_Etiqueta_Campo_2:= StrToInt(EdtMultiplicador_H_Campo_2.Text);
//  Horizontal_Texto_Etiqueta_Campo_2:= StrToInt(EdtHorizontal_Texto_Campo_2.Text);
//  Vertical_Texto_Etiqueta_Campo_2:= StrToInt(EdtVertical_Texto_Campo_2.Text);

//  Tamanho_Fonte_Texto_Etiqueta_Campo_3:= StrToInt(EdtTamanho_Fonte_Etiqueta_Campo_3.Text);
//  Multiplicador_V_Texto_Etiqueta_Campo_3:= StrToInt(EdtMultiplicador_V_Campo_3.Text);
//  Multiplicador_H_Texto_Etiqueta_Campo_3:= StrToInt(EdtMultiplicador_H_Campo_3.Text);
//  Horizontal_Texto_Etiqueta_Campo_3:= StrToInt(EdtHorizontal_Texto_Campo_3.Text);
//  Vertical_Texto_Etiqueta_Campo_3:= StrToInt(EdtVertical_Texto_Campo_3.Text);
//
//  Tamanho_Fonte_Texto_Etiqueta_Campo_4:= StrToInt(EdtTamanho_Fonte_Etiqueta_Campo_4.Text);
//  Multiplicador_V_Texto_Etiqueta_Campo_4:= StrToInt(EdtMultiplicador_V_Campo_4.Text);
//  Multiplicador_H_Texto_Etiqueta_Campo_4:= StrToInt(EdtMultiplicador_H_Campo_4.Text);
//  Horizontal_Texto_Etiqueta_Campo_4:= StrToInt(EdtHorizontal_Texto_Campo_4.Text);
//  Vertical_Texto_Etiqueta_Campo_4:= StrToInt(EdtVertical_Texto_Campo_4.Text);
//
//  Tamanho_Fonte_Texto_Etiqueta_Campo_5:= StrToInt(EdtTamanho_Fonte_Etiqueta_Campo_5.Text);
//  Multiplicador_V_Texto_Etiqueta_Campo_5:= StrToInt(EdtMultiplicador_V_Campo_5.Text);
//  Multiplicador_H_Texto_Etiqueta_Campo_5:= StrToInt(EdtMultiplicador_H_Campo_5.Text);
//  Horizontal_Texto_Etiqueta_Campo_5:= StrToInt(EdtHorizontal_Texto_Campo_5.Text);
//  Vertical_Texto_Etiqueta_Campo_5:= StrToInt(EdtVertical_Texto_Campo_5.Text);
//
//  Tipo_Barra_Etiqueta:= EdtTipo_Barra.Text;
//  Largura_Barra_Larga:= StrToInt(EdtLargura_Barra_Larga.Text);
//  Largura_Barra_Fina:= StrToInt(EdtLargura_Barra_Fina.Text);
//  Horizontal_Barra_Etiqueta:= StrToInt(EdtHorizontal_Barra.Text);
//  Vertical_Barra_Etiqueta:= StrToInt(EdtVertical_Barra.Text);
//  Altura_Barra:= StrToInt(EdtAltura_Codigo.Text);
//
//  Distancia_Horizontal_Etiqueta:= StrToInt(EdtDistancia_Horizontal.Text);
//  Distancia_Vertical_Etiqueta:= StrToInt(EdtDistancia_Vertical.Text);

  if (CBOpcao_Servico_Marcada.Checked) then
    opcao_servico_marcada:= 0
  else
    opcao_servico_marcada:= 1;

  if (CBControla_Credito.Checked) then
    controla_credito_cliente:= 0
  else
    controla_credito_cliente:= 1;

  busca_parametro_calculo_preco:= RGBusca_Parametros_Calcular_Preco.ItemIndex;

  if (CBGera_Codigo_EAN.Checked) then
    gera_codigo_ean:= 0
  else
    gera_codigo_ean:= 1;

  if (CBTrazer_Cond_Pag_ECF.Checked) then
    trazer_somente_cond_pag_ecf:= 0
  else
    trazer_somente_cond_pag_ecf:= 1;

  codigo_cfop_padrao:= StrToInt(EdtCodigo_CFOP.Text);
  {Balanca_Modelo := FrmConfiguracao_Sistema.cmbBalanca.ItemIndex;
  Balanca_Porta := FrmConfiguracao_Sistema.EdtPorta_Balanca.Text;
  Balanca_BaudRate := FrmConfiguracao_Sistema.cmbBaudRate.ItemIndex;
  Balanca_DataBits := FrmConfiguracao_Sistema.cmbDataBits.ItemIndex;
  Balanca_Parity := FrmConfiguracao_Sistema.cmbParity.ItemIndex;
  Balanca_StopBits := FrmConfiguracao_Sistema.cmbStopBits.ItemIndex;
  Balanca_Hand := FrmConfiguracao_Sistema.cmbHandShaking.ItemIndex;
  Balanca_TimeOut := StrToInt(FrmConfiguracao_Sistema.EdtTimeOut_Balanca.Text);}


end;

procedure TFrmConfiguracao_Sistema.BBtnCaminhoClick(Sender: TObject);
begin
  OpenDialog1.InitialDir:= Local_Arquivo(14);
  OpenDialog1.Filter:= '';
  OpenDialog1.FileName:= '';
  OpenDialog1.Execute;
  //EdtCaminho_ECF.Text:= ExtractFilePath(OpenDialog1.FileName);
end;

procedure TFrmConfiguracao_Sistema.BBtnCancelarClick(Sender: TObject);
begin
  Util.Limpa_Campos(FrmConfiguracao_Sistema);
  Util.Desabilita_Campos(FrmConfiguracao_Sistema);
  BBtnSalvar.Enabled:= false;
  BBtnExcluir.Enabled:= false;
  BBtnPesquisar.Enabled:= true;
  BBtnCancelar.Enabled:= false;
end;

procedure TFrmConfiguracao_Sistema.BBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
  begin
    WebService1_Producao.Excluir(WebService1_Producao);
    WebService1_Homologacao.Excluir(WebService1_Homologacao);
    WebService2_Producao.Excluir(WebService2_Producao);
    WebService2_Homologacao.Excluir(WebService2_Homologacao);
    Configuracao.Excluir(Configuracao);
    UDeclaracao.Insere_Historico(usuario, 'EXCLUIU CONFIGURAÇÃO DO SISTEMA.', TimeToStr(time), exclusao, date);
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmConfiguracao_Sistema);
  end;
end;

procedure TFrmConfiguracao_Sistema.BBtnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TFrmConfiguracao_Sistema.BBtnSalvarClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        Configuracao.Inserir(Configuracao);
        Atribui_Variaveis;
        UDeclaracao.Insere_Historico(usuario, 'REALIZOU CONFIGURAÇÃO DO SISTEMA.', TimeToStr(time), insercao, date);
      end
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      begin
        Configuracao.Alterar(Configuracao);
        Atribui_Variaveis;
        UDeclaracao.Insere_Historico(usuario, 'ALTEROU CONFIGURAÇÃO DO SISTEMA.', TimeToStr(time), alteracao, date);
      end
      else
        exit;
    end;
    Habilita_Timer;
    BBtnSalvar.Enabled:= false;
    BBtnExcluir.Enabled:= false;
    BBtnPesquisar.Enabled:= true;
    BBtnCancelar.Enabled:= false;
    Util.Desabilita_Campos(FrmConfiguracao_Sistema);
end;

procedure TFrmConfiguracao_Sistema.BBtnSalvar_ItemClick(Sender: TObject);
begin
  if (achei = false) then
    begin
      if (Confira = true) then
      begin
        WebService1_Producao.Inserir(WebService1_Producao);
        WebService1_Homologacao.Inserir(WebService1_Homologacao);
        WebService2_Producao.Inserir(WebService2_Producao);
        WebService2_Homologacao.Inserir(WebService2_Homologacao);
      end
      else
        exit;
    end
    else
    begin
      if (Confira = true) then
      begin
        WebService1_Producao.Alterar(WebService1_Producao);
        WebService1_Homologacao.Alterar(WebService1_Homologacao);
        WebService2_Producao.Alterar(WebService2_Producao);
        WebService2_Homologacao.Alterar(WebService2_Homologacao);
      end
      else
        exit;
    end;
end;

procedure TFrmConfiguracao_Sistema.Button1Click(Sender: TObject);
begin
  OpenDialog1.Filter:= '';
  OpenDialog1.FileName:= '';
  OpenDialog1.Execute;
  EdtLogomarca.Text:= OpenDialog1.FileName;
end;

procedure TFrmConfiguracao_Sistema.Button2Click(Sender: TObject);
begin
  OpenDialog1.Filter:= '';
  OpenDialog1.FileName:= '';
  OpenDialog1.Execute;
  EdtSalva_XML.Text:= ExtractFilePath(OpenDialog1.FileName);
end;

procedure TFrmConfiguracao_Sistema.Button3Click(Sender: TObject);
begin
  EdtN_Certificado.Text := ACBrNFe1.SSL.SelecionarCertificado;
  EdtSenha_Certificado.Text := ACBrNFe1.Configuracoes.Certificados.Senha;
end;

procedure TFrmConfiguracao_Sistema.Button4Click(Sender: TObject);
begin
  OpenDialog1.Filter:= '';
  OpenDialog1.FileName:= '';
  OpenDialog1.Execute;
  EdtCaminho_Schema.Text:= ExtractFilePath(OpenDialog1.FileName);
end;

procedure TFrmConfiguracao_Sistema.Button5Click(Sender: TObject);
begin
  OpenDialog1.Filter:= '';
  OpenDialog1.FileName:= '';
  OpenDialog1.Execute;
  EdtCaminho_PDF_Pedido.Text:= ExtractFilePath(OpenDialog1.FileName);
    {if (RGOpcao.ItemIndex = 0) then
    Atualiza_Produtos
  else if (RGOpcao.ItemIndex = 1) then
    Atualiza_CFOP
  else if (RGOpcao.ItemIndex = 2) then
    Atualiza_NCM;

  Processo_Concluido;}
end;

procedure TFrmConfiguracao_Sistema.Button6Click(Sender: TObject);
begin
  OpenDialog1.Filter:= '';
  OpenDialog1.FileName:= '';
  OpenDialog1.Execute;
  EdtCaminho_PDF_Carne.Text:= ExtractFilePath(OpenDialog1.FileName);
end;

procedure TFrmConfiguracao_Sistema.cbOSClick(Sender: TObject);
begin
  if cbOS.Checked then
  begin
    RGTipo_OS.ItemIndex:= 0;
    RGTipo_OS.Enabled:= true;
  end
  else
  begin
    RGTipo_OS.ItemIndex:= 2;
    RGTipo_OS.Enabled:= false;
  end;
end;

function TFrmConfiguracao_Sistema.Confira: boolean;
begin
    Confira:= false;

    if EdtMensagem_Cupom.Text = '' then
    begin
      PageControl1.TabIndex:= 1;
      Mensagem_Falta_Dados;
      EdtMensagem_Cupom.SetFocus;
      abort;
    end;

    if EdtTempo_Atualizacao.Text = '' then
    begin
      PageControl1.TabIndex:= 0;
      Mensagem_Falta_Dados;
      EdtTempo_Atualizacao.SetFocus;
      abort;
    end;

    if EdtDias_Avisar.Text = '' then
    begin
      PageControl1.TabIndex:= 0;
      Mensagem_Falta_Dados;
      EdtDias_Avisar.SetFocus;
      abort;
    end;

    if EdtDias_Orcamento_Vencido.Text = '' then
    begin
      PageControl1.TabIndex:= 0;
      Mensagem_Falta_Dados;
      EdtDias_Orcamento_Vencido.SetFocus;
      abort;
    end;

    if (EdtQtde_Copias.Text = '') then
    begin
      PageControl1.TabIndex:= 4;
      PageControl2.TabIndex:= 1;
      Mensagem_Falta_Dados;
      EdtQtde_Copias.SetFocus;
      abort;
    end;

    if (edtQuantidade_Maquinas.Text = '') then
    begin
      PageControl1.TabIndex:= 6;
      Mensagem_Falta_Dados;
      edtQuantidade_Maquinas.SetFocus;
      abort;
    end;

    if (EdtCodigo_Tabela_Preco.Text = '') then
    begin
      PageControl1.TabIndex:= 3;
      Mensagem_Falta_Dados;
      EdtCodigo_Tabela_Preco.SetFocus;
      abort;
    end;

    if (EdtCodigo_CFOP.Text = '') then
    begin
      PageControl1.TabIndex:= 3;
      Mensagem_Falta_Dados;
      EdtCodigo_CFOP.SetFocus;
      abort;
    end;

//    if (EdtMultiplicador_H_Campo_1.Text = '') then
//    begin
//      TMensagens.MensagemErro('Informe um valor.');
//      EdtMultiplicador_H_Campo_1.SetFocus;
//      abort;
//    end;
//
//    if (EdtMultiplicador_V_Campo_1.Text = '') then
//    begin
//      TMensagens.MensagemErro('Informe um valor.');
//      EdtMultiplicador_V_Campo_1.SetFocus;
//      abort;
//    end;
//
//    if (EdtMultiplicador_H_Campo_2.Text = '') then
//    begin
//      TMensagens.MensagemErro('Informe um valor.');
//      EdtMultiplicador_H_Campo_2.SetFocus;
//      abort;
//    end;
//
//    if (EdtMultiplicador_V_Campo_2.Text = '') then
//    begin
//      TMensagens.MensagemErro('Informe um valor.');
//      EdtMultiplicador_V_Campo_2.SetFocus;
//      abort;
//    end;
//
//    if (EdtHorizontal_Texto_Campo_1.Text = '') then
//    begin
//      TMensagens.MensagemErro('Informe um valor.');
//      EdtHorizontal_Texto_Campo_1.SetFocus;
//      abort;
//    end;
//
//    if (EdtHorizontal_Texto_Campo_2.Text = '') then
//    begin
//      TMensagens.MensagemErro('Informe um valor.');
//      EdtHorizontal_Texto_Campo_2.SetFocus;
//      abort;
//    end;
//
//    if (EdtHorizontal_Barra.Text = '') then
//    begin
//      TMensagens.MensagemErro('Informe um valor.');
//      EdtHorizontal_Barra.SetFocus;
//      abort;
//    end;
//
//    if (EdtTamanho_Fonte_Etiqueta_Campo_1.Text = '') then
//    begin
//      TMensagens.MensagemErro('Informe um valor.');
//      EdtTamanho_Fonte_Etiqueta_Campo_1.SetFocus;
//      abort;
//    end;
//
//    if (EdtTamanho_Fonte_Etiqueta_Campo_2.Text = '') then
//    begin
//      TMensagens.MensagemErro('Informe um valor.');
//      EdtTamanho_Fonte_Etiqueta_Campo_2.SetFocus;
//      abort;
//    end;
//
//    if (EdtTipo_Barra.Text = '') then
//    begin
//      TMensagens.MensagemErro('Informe um valor.');
//      EdtTipo_Barra.SetFocus;
//      abort;
//    end;
//
//    if (EdtLargura_Barra_Larga.Text = '') then
//    begin
//      TMensagens.MensagemErro('Informe um valor.');
//      EdtLargura_Barra_Larga.SetFocus;
//      abort;
//    end;
//
//    if (EdtLargura_Barra_Fina.Text = '') then
//    begin
//      TMensagens.MensagemErro('Informe um valor.');
//      EdtLargura_Barra_Fina.SetFocus;
//      abort;
//    end;
//
//    if (EdtVertical_Texto_Campo_1.Text = '') then
//    begin
//      TMensagens.MensagemErro('Informe um valor.');
//      EdtVertical_Texto_Campo_1.SetFocus;
//      abort;
//    end;
//
//    if (EdtVertical_Texto_Campo_2.Text = '') then
//    begin
//      TMensagens.MensagemErro('Informe um valor.');
//      EdtVertical_Texto_Campo_2.SetFocus;
//      abort;
//    end;
//
//    if (EdtVertical_Barra.Text = '') then
//    begin
//      TMensagens.MensagemErro('Informe um valor.');
//      EdtVertical_Barra.SetFocus;
//      abort;
//    end;
//
//    if (EdtAltura_Codigo.Text = '') then
//    begin
//      TMensagens.MensagemErro('Informe um valor.');
//      EdtAltura_Codigo.SetFocus;
//      abort;
//    end;

    if (EdtAvanco_Etiqueta.Text = '') then
    begin
      TMensagens.MensagemErro('Informe um valor.');
      EdtAvanco_Etiqueta.SetFocus;
      abort;
    end;

    if (EdtTemperatura_Impressora_Etiqueta.Text = '') then
    begin
      TMensagens.MensagemErro('Informe um valor.');
      EdtTemperatura_Impressora_Etiqueta.SetFocus;
      abort;
    end;

    Confira:= true;
end;

procedure TFrmConfiguracao_Sistema.dbgrd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) then
  begin
    qryconfiguracao_ecf.Delete;
    Consulta.Chama_Configuracao_ECF;
  end;
end;

procedure TFrmConfiguracao_Sistema.EdtAvanco_EtiquetaKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmConfiguracao_Sistema.EdtCFOPKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConfiguracao_Sistema.EdtCFOP_V_DKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    cfop:= 1;
    Application.CreateForm(TFrmChama_CFOP, FrmChama_CFOP);
    FrmChama_CFOP.ShowModal;
    FrmChama_CFOP.Free;
  end;
end;

procedure TFrmConfiguracao_Sistema.EdtCFOP_V_D_PKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    cfop:= 3;
    Application.CreateForm(TFrmChama_CFOP, FrmChama_CFOP);
    FrmChama_CFOP.ShowModal;
    FrmChama_CFOP.Free;
  end;

end;

procedure TFrmConfiguracao_Sistema.EdtCFOP_V_FKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    cfop:= 2;
    Application.CreateForm(TFrmChama_CFOP, FrmChama_CFOP);
    FrmChama_CFOP.ShowModal;
    FrmChama_CFOP.Free;
  end;

end;

procedure TFrmConfiguracao_Sistema.EdtCFOP_V_F_PKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_F3) then
  begin
    cfop:= 4;
    Application.CreateForm(TFrmChama_CFOP, FrmChama_CFOP);
    FrmChama_CFOP.ShowModal;
    FrmChama_CFOP.Free;
  end;
end;

procedure TFrmConfiguracao_Sistema.EdtCodigo_CFOPKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_CFOP, FrmChama_CFOP);
    FrmChama_CFOP.ShowModal;
    FrmChama_CFOP.Free;
  end;
end;

procedure TFrmConfiguracao_Sistema.EdtCodigo_CFOPKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConfiguracao_Sistema.EdtCodigo_DepartamentoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      receber:= true;
      Application.CreateForm(TFrmChama_Departamento, FrmChama_Departamento);
      FrmChama_Departamento.ShowModal;
      FrmChama_Departamento.Free;
    end;
end;

procedure TFrmConfiguracao_Sistema.EdtCodigo_DepartamentoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConfiguracao_Sistema.EdtCodigo_Departamento_PagarKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      receber:= false;
      Application.CreateForm(TFrmChama_Departamento, FrmChama_Departamento);
      FrmChama_Departamento.ShowModal;
      FrmChama_Departamento.Free;
    end;
end;

procedure TFrmConfiguracao_Sistema.EdtCodigo_Departamento_PagarKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConfiguracao_Sistema.EdtCodigo_PlanoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      receber:= true;
      Application.CreateForm(TFrmChama_Plano_Financeiro, FrmChama_Plano_Financeiro);
      FrmChama_Plano_Financeiro.ShowModal;
      FrmChama_Plano_Financeiro.Free;
    end;
end;

procedure TFrmConfiguracao_Sistema.EdtCodigo_PlanoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConfiguracao_Sistema.EdtCodigo_Plano_PagarKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      receber:= false;
      Application.CreateForm(TFrmChama_Plano_Financeiro, FrmChama_Plano_Financeiro);
      FrmChama_Plano_Financeiro.ShowModal;
      FrmChama_Plano_Financeiro.Free;
    end;
end;

procedure TFrmConfiguracao_Sistema.EdtCodigo_Plano_PagarKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConfiguracao_Sistema.EdtCodigo_Tabela_PrecoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
  begin
    Application.CreateForm(TFrmChama_Tabela_Preco, FrmChama_Tabela_Preco);
    FrmChama_Tabela_Preco.ShowModal;
    FrmChama_Tabela_Preco.Free;
  end;
end;

procedure TFrmConfiguracao_Sistema.EdtCodigo_Tabela_PrecoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConfiguracao_Sistema.EdtCodigo_Tipo_DocumentoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      receber:= true;
      Application.CreateForm(TFrmChama_Tipo_Documento, FrmChama_Tipo_Documento);
      FrmChama_Tipo_Documento.ShowModal;
      FrmChama_Tipo_Documento.Free;
    end;
end;

procedure TFrmConfiguracao_Sistema.EdtCodigo_Tipo_DocumentoKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConfiguracao_Sistema.EdtCodigo_Tipo_Documento_PagarKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_f3) then
    begin
      receber:= false;
      Application.CreateForm(TFrmChama_Tipo_Documento, FrmChama_Tipo_Documento);
      FrmChama_Tipo_Documento.ShowModal;
      FrmChama_Tipo_Documento.Free;
    end;
end;

procedure TFrmConfiguracao_Sistema.EdtCodigo_Tipo_Documento_PagarKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConfiguracao_Sistema.EdtDepartamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConfiguracao_Sistema.EdtDepartamento_PagarKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConfiguracao_Sistema.EdtDias_AvisarKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmConfiguracao_Sistema.EdtHorizontal_BarraKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmConfiguracao_Sistema.EdtISSQNKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmConfiguracao_Sistema.EdtLargura_Barra_LargaKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmConfiguracao_Sistema.EdtPlanoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConfiguracao_Sistema.EdtPlano_PagarKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConfiguracao_Sistema.EdtTabela_PrecoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConfiguracao_Sistema.EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmConfiguracao_Sistema.EdtTemperatura_Impressora_EtiquetaKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmConfiguracao_Sistema.EdtTempo_AtualizacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Numero(key);
end;

procedure TFrmConfiguracao_Sistema.EdtTipo_DocumentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConfiguracao_Sistema.EdtTipo_Documento_PagarKeyPress(
  Sender: TObject; var Key: Char);
begin
  Util.Somente_Apaga(key);
end;

procedure TFrmConfiguracao_Sistema.EdtWebService_UF_1_HomologacaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Pega_WebService_1_Homologacao;
  end;
end;

procedure TFrmConfiguracao_Sistema.EdtWebService_UF_1_ProducaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Pega_WebService_1_Producao;
  end;
end;

procedure TFrmConfiguracao_Sistema.EdtWebService_UF_2_HomologacaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Pega_WebService_2_Homologacao;
  end;
end;

procedure TFrmConfiguracao_Sistema.EdtWebService_UF_2_ProducaoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = vk_return) then
  begin
    Pega_WebService_2_Producao;
  end;
end;

{procedure TFrmCadastro_Logradouro.Estado(const llEstado: Controle);
begin
  case llEstado of
    Inserir: Habilita_Botao([false, true, false, true]);
    //Alterar: Habilita_Botao([false, true, false, true]);
    Consultar: Habilita_Botao([false, true, true, true]);
  end;
end;}

procedure TFrmConfiguracao_Sistema.FormActivate(Sender: TObject);
begin
  ativo:= true;
end;

procedure TFrmConfiguracao_Sistema.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (BBtnCancelar.Enabled = true) then
    begin
      Cancele;
      Abort;
    end
    else
      begin
        FrmConfiguracao_Sistema.Free;
        FrmConfiguracao_Sistema:= Nil;
      end;
end;

procedure TFrmConfiguracao_Sistema.FormCreate(Sender: TObject);
begin
  Util.Habilita_Campos(FrmConfiguracao_Sistema);
  Util.Limpa_Campos(FrmConfiguracao_Sistema);
  Util.Desabilita_Campos(FrmConfiguracao_Sistema);
  Inicia_Page;
  EdtPorta_Balanca.Text:= 'COM1';
  EdtTimeOut_Balanca.Text:= '1000';
  ACBrNFe1.Configuracoes.WebServices.UF:= uf;
  ACBrNFe1.Configuracoes.Arquivos.PathSalvar:= salva_xml;
end;

procedure TFrmConfiguracao_Sistema.FormDeactivate(Sender: TObject);
begin
  ativo:= false;
end;

procedure TFrmConfiguracao_Sistema.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_f2) then
    begin
      Util.Habilita_Campos(FrmConfiguracao_Sistema);
      Util.Limpa_Campos(FrmConfiguracao_Sistema);
      BBtnSalvar.Enabled:= true;
      BBtnExcluir.Enabled:= false;
      BBtnPesquisar.Enabled:= false;
      BBtnCancelar.Enabled:= true;
      Inicia_Page;
      achei:= false;
      altera_web:= false;
    end;

  if (key = vk_escape) then
    close;
end;

procedure TFrmConfiguracao_Sistema.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    begin
      key:=#0; //anula todas as teclas
      SelectNext(ActiveControl, true, true);
    end;
end;

procedure TFrmConfiguracao_Sistema.Inicia_Page;
begin
  PageControl1.TabIndex:= 0;
  PageControl2.TabIndex:= 0;
  //PageControl3.TabIndex:= 0;
  //PageControl4.TabIndex:= 0;
  //PageControl5.TabIndex:= 0;
end;

procedure TFrmConfiguracao_Sistema.Pega_WebService_1_Homologacao;
var
  qAux: TADOQuery;
begin
  {try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select * from WebService_1_Homologacao where Codigo = :Codigo and WebService_UF = :Web');
      Parameters.ParamByName('Codigo').Value:= codigo_empresa;
      Parameters.ParamByName('Web').Value:= EdtWebService_UF_1_Homologacao.Text;
      open;

      if (IsEmpty = false) then
      begin
        EdtRecepcao_1_Homologacao.Text:= qAux.FieldByName('Recepcao').AsString;
        EdtRetorno_1_Homologacao.Text:= qAux.FieldByName('Retorno').AsString;
        EdtStatus_1_Homologacao.Text:= qAux.FieldByName('Status').AsString;
        EdtCancelamento_1_Homologacao.Text:= qAux.FieldByName('Cancelamento').AsString;
        EdtInutilizacao_1_Homologacao.Text:= qAux.FieldByName('Inutilizacao').AsString;
        EdtConsulta_1_Homologacao.Text:= qAux.FieldByName('Consulta').AsString;
        EdtConsulta_Cadastro_1_Homologacao.Text:= qAux.FieldByName('Consulta_Cadastro').AsString;
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;}
end;

procedure TFrmConfiguracao_Sistema.Pega_WebService_1_Producao;
var
  qAux: TADOQuery;
begin
  {try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select * from WebService_1_Producao where Codigo = :Codigo and WebService_UF = :Web');
      Parameters.ParamByName('Codigo').Value:= codigo_empresa;
      Parameters.ParamByName('Web').Value:= EdtWebService_UF_1_Producao.Text;
      open;

      if (IsEmpty = false) then
      begin
        EdtRecepcao_1_Producao.Text:= qAux.FieldByName('Recepcao').AsString;
        EdtRetorno_1_Producao.Text:= qAux.FieldByName('Retorno').AsString;
        EdtStatus_1_Producao.Text:= qAux.FieldByName('Status').AsString;
        EdtCancelamento_1_Producao.Text:= qAux.FieldByName('Cancelamento').AsString;
        EdtInutilizacao_1_Producao.Text:= qAux.FieldByName('Inutilizacao').AsString;
        EdtConsulta_1_Producao.Text:= qAux.FieldByName('Consulta').AsString;
        EdtConsulta_Cadastro_1_Producao.Text:= qAux.FieldByName('Consulta_Cadastro').AsString;
      end;
    end;
  finally
    FreeAndNil(qAux);
  end; }
end;

procedure TFrmConfiguracao_Sistema.Pega_WebService_2_Homologacao;
var
  qAux: TADOQuery;
begin
  {try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select * from WebService_2_Homologacao where Codigo = :Codigo and WebService_UF = :Web');
      Parameters.ParamByName('Codigo').Value:= codigo_empresa;
      Parameters.ParamByName('Web').Value:= EdtWebService_UF_2_Homologacao.Text;
      open;

      if (IsEmpty = false) then
      begin
        EdtRecepcao_2_Homologacao.Text:= qAux.FieldByName('Recepcao').AsString;
        EdtRetorno_2_Homologacao.Text:= qAux.FieldByName('Retorno').AsString;
        EdtStatus_2_Homologacao.Text:= qAux.FieldByName('Status').AsString;
        EdtCancelamento_2_Homologacao.Text:= qAux.FieldByName('Cancelamento').AsString;
        EdtInutilizacao_2_Homologacao.Text:= qAux.FieldByName('Inutilizacao').AsString;
        EdtConsulta_2_Homologacao.Text:= qAux.FieldByName('Consulta').AsString;
        EdtConsulta_Cadastro_2_Homologacao.Text:= qAux.FieldByName('Consulta_Cadastro').AsString;
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;}
end;

procedure TFrmConfiguracao_Sistema.Pega_WebService_2_Producao;
var
  qAux: TADOQuery;
begin
  {try
    qAux:= TADOQuery.Create(self);
    with qAux, sql do
    begin
      close;
      Connection:= dm.ADOConnection1;
      clear;
      add('select * from WebService_2_Producao where Codigo = :Codigo and WebService_UF = :Web');
      Parameters.ParamByName('Codigo').Value:= codigo_empresa;
      Parameters.ParamByName('Web').Value:= EdtWebService_UF_2_Producao.Text;
      open;

      if (IsEmpty = false) then
      begin
        EdtRecepcao_2_Producao.Text:= qAux.FieldByName('Recepcao').AsString;
        EdtRetorno_2_Producao.Text:= qAux.FieldByName('Retorno').AsString;
        EdtStatus_2_Producao.Text:= qAux.FieldByName('Status').AsString;
        EdtCancelamento_2_Producao.Text:= qAux.FieldByName('Cancelamento').AsString;
        EdtInutilizacao_2_Producao.Text:= qAux.FieldByName('Inutilizacao').AsString;
        EdtConsulta_2_Producao.Text:= qAux.FieldByName('Consulta').AsString;
        EdtConsulta_Cadastro_2_Producao.Text:= qAux.FieldByName('Consulta_Cadastro').AsString;
      end;
    end;
  finally
    FreeAndNil(qAux);
  end;}
end;

procedure TFrmConfiguracao_Sistema.SBtnExcluirClick(Sender: TObject);
begin
  if (Confirma_Exclusao) then
    WebService1_Producao.Excluir_Item(WebService1_Producao);
end;

procedure TFrmConfiguracao_Sistema.SBtnInserirClick(Sender: TObject);
begin
  WebService1_Producao.Inserir(WebService1_Producao);
end;

procedure TFrmConfiguracao_Sistema.SpeedButton10Click(Sender: TObject);
begin
  WebService2_Homologacao.Alterar(WebService2_Homologacao);
end;

procedure TFrmConfiguracao_Sistema.SpeedButton1Click(Sender: TObject);
begin
  edtN_Fabricacao.Text:= dm.ACBrECF1.NumSerie;
  edtGT.Text:= FloatToStr(dm.ACBrECF1.GrandeTotal);
  EdtModelo.Text:= sModelo;
  EdtN_Caixa.Text:= Copy(UDeclaracao.sequencia, 2,3);
end;

procedure TFrmConfiguracao_Sistema.SpeedButton2Click(Sender: TObject);
begin
  if cbModelo.ItemIndex = 0 then
  begin
    if not (dm.ACBrECF1.AcharECF(true,False)) then
    begin
       TMensagens.MensagemErro('ECF não encontrado') ;
       abort ;
    end
    else
    begin
      edtPorta.Text:= dm.ACBrECF1.Porta;
    end;
  end
  else
  begin
    TMensagens.MensagemErro('Para procurar uma impressora, escolha o modelo.');
    cbModelo.SetFocus;
  end;
end;

procedure TFrmConfiguracao_Sistema.SpeedButton3Click(Sender: TObject);
begin
  if (edtN_Fabricacao.Text = '') then
  begin
    TMensagens.MensagemErro('Nº do ECF em branco.');
    edtN_Fabricacao.SetFocus;
    abort;
  end;

  if (edtGT.Text = '') then
  begin
    TMensagens.MensagemErro('Grande total em branco.');
    edtGT.SetFocus;
    abort;
  end;

  if (edtPorta.Text = '') then
  begin
    TMensagens.MensagemErro('Porta do ECF em branco.');
    edtPorta.SetFocus;
    abort;
  end;

  if (cbModelo.ItemIndex = -1) then
  begin
    TMensagens.MensagemErro('Modelo do ECF não definido.');
    cbModelo.SetFocus;
    abort;
  end;

  if (EdtModelo.Text = '') then
  begin
    TMensagens.MensagemErro('Modelo em branco.');
    EdtModelo.SetFocus;
    abort;
  end;

  if (EdtN_Caixa.Text = '') then
  begin
    TMensagens.MensagemErro('Nº do Caixa em branco.');
    EdtN_Caixa.SetFocus;
    abort;
  end;

  oConfigECF:= TConfiguracoesECFEntidade.Create;
  oConfigECFDominio:= TConfiguracoesECFDominio.Create(dm.ADOConnection1);

  oConfigECF.CodigoEmpresa:= 1;
  oConfigECF.NFabricacao := edtN_Fabricacao.Text;
  oConfigECF.GT:= StrToFloat(edtGT.Text);
  oConfigECF.Porta:= edtPorta.Text;
  oConfigECF.Marca:= cbModelo.Text;
  oConfigECF.CIECF:= edtCIECF.Text;
  oConfigECF.MD5:= edtMD5.Text;
  oConfigECF.DataAtivacao:= date;
  oConfigECF.ModeloECF:= EdtModelo.Text;
  oConfigECF.NCaixa:= EdtN_Caixa.Text;
  oConfigECFDominio.gravaConfiguracoesECF(oConfigECF);
  Consulta.Chama_Configuracao_ECF;

end;

procedure TFrmConfiguracao_Sistema.SpeedButton4Click(Sender: TObject);
begin
  if (Confirma_Exclusao) then
    WebService2_Producao.Excluir(WebService2_Producao);
end;

procedure TFrmConfiguracao_Sistema.SpeedButton5Click(Sender: TObject);
begin
  if (Confirma_Exclusao) then
    WebService2_Homologacao.Excluir(WebService2_Homologacao);
end;

procedure TFrmConfiguracao_Sistema.SpeedButton6Click(Sender: TObject);
begin
  WebService2_Homologacao.Inserir(WebService2_Homologacao);
end;

procedure TFrmConfiguracao_Sistema.SpeedButton7Click(Sender: TObject);
begin
  WebService1_Producao.Alterar(WebService1_Producao);
end;

procedure TFrmConfiguracao_Sistema.SpeedButton8Click(Sender: TObject);
begin
  WebService1_Homologacao.Alterar(WebService1_Homologacao);
end;

procedure TFrmConfiguracao_Sistema.SpeedButton9Click(Sender: TObject);
begin
  WebService2_Producao.Alterar(WebService2_Producao);
end;

procedure TFrmConfiguracao_Sistema.BBtnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TFrmChama_Configuracao, FrmChama_Configuracao);
  FrmChama_Configuracao.ShowModal;
  FrmChama_Configuracao.Release;
end;

end.
