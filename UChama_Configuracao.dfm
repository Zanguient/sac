object FrmChama_Configuracao: TFrmChama_Configuracao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Configura'#231#245'es do Sistema'
  ClientHeight = 553
  ClientWidth = 942
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 52
    Width = 941
    Height = 501
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo_Empresa'
        Title.Caption = 'Codigo Empresa'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Caminho_ECF'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Mensagem_Cupom'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Porta_Comunicacao'
        Visible = False
      end>
  end
  object ToolBar1: TToolBar
    Left = 751
    Top = 4
    Width = 190
    Height = 42
    Align = alCustom
    ButtonHeight = 38
    ButtonWidth = 93
    Caption = 'ToolBar1'
    DrawingStyle = dsGradient
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esLowered
    EdgeOuter = esRaised
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    GradientEndColor = clWindow
    HotTrackColor = clMenu
    Images = DM.ImgImagens_Chama
    List = True
    ParentFont = False
    ShowCaptions = True
    TabOrder = 1
    object BBtnFiltrar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      AutoSize = True
      Caption = '&Localizar'
      ImageIndex = 1
      OnClick = BBtnFiltrarClick
    end
    object BBtnFechar: TToolButton
      Left = 97
      Top = 0
      Cursor = crHandPoint
      AutoSize = True
      Caption = '&Fechar'
      ImageIndex = 0
      OnClick = BBtnFecharClick
    end
  end
  object qrychama_configuracao: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select CS.*, TP.Descricao, (CFOP.CFOP + '#39' - '#39' + CFOP.Descricao) ' +
        'as CFOP,'
      ''
      
        'TD1.Descricao as Tipo_Documento, D1.Descricao as Departamento, P' +
        'F1.Descricao as Plano,'
      
        'TD2.Descricao as Tipo_Documento, D2.Descricao as Departamento, P' +
        'F2.Descricao as Plano '
      ''
      'from Configuracao_Sistema CS'
      ''
      ''
      
        'left join Tabela_Preco TP on (CS.Codigo_Tabela_Preco_Padrao = TP' +
        '.Codigo)'
      ''
      
        'left join Tipo_Documento TD1 on (CS.Codigo_Tipo_Documento = TD1.' +
        'Codigo)'
      
        'left join Departamento D1 on (CS.Codigo_Departamento = D1.Codigo' +
        ')'
      
        'left join Plano_Financeiro PF1 on (CS.Codigo_Plano_Financeiro = ' +
        'PF1.Codigo)'
      ''
      
        'left join Tipo_Documento TD2 on (CS.Codigo_Tipo_Documento_Pagar ' +
        '= TD2.Codigo)'
      
        'left join Departamento D2 on (CS.Codigo_Departamento_Pagar = D2.' +
        'Codigo)'
      
        'left join Plano_Financeiro PF2 on (CS.Codigo_Plano_Financeiro_Pa' +
        'gar = PF2.Codigo)'
      
        'left join Cadastro_CFOP CFOP on (CS.Codigo_CFOP_Padrao = CFOP.Co' +
        'digo)')
    Left = 464
    Top = 272
    object qrychama_configuracaoCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qrychama_configuracaoCaminho_ECF: TStringField
      FieldName = 'Caminho_ECF'
      Size = 500
    end
    object qrychama_configuracaoMensagem_Cupom: TStringField
      FieldName = 'Mensagem_Cupom'
      Size = 100
    end
    object qrychama_configuracaoPorta_Comunicacao: TStringField
      FieldName = 'Porta_Comunicacao'
      Size = 10
    end
    object qrychama_configuracaoPerfil_Arquivo_Fiscal: TStringField
      FieldName = 'Perfil_Arquivo_Fiscal'
      Size = 10
    end
    object qrychama_configuracaoVersao_EFD: TStringField
      FieldName = 'Versao_EFD'
      Size = 5
    end
    object qrychama_configuracaoCodigo_Tipo_Atividade: TStringField
      FieldName = 'Codigo_Tipo_Atividade'
      Size = 1
    end
    object qrychama_configuracaoTipo_Atividade: TStringField
      FieldName = 'Tipo_Atividade'
      Size = 50
    end
    object qrychama_configuracaoAmbiente: TStringField
      FieldName = 'Ambiente'
      Size = 15
    end
    object qrychama_configuracaoTipo_Impressao: TStringField
      FieldName = 'Tipo_Impressao'
    end
    object qrychama_configuracaoTipo_Emissao: TStringField
      FieldName = 'Tipo_Emissao'
    end
    object qrychama_configuracaoLogomarca: TStringField
      FieldName = 'Logomarca'
      Size = 300
    end
    object qrychama_configuracaoSalvar_XML: TStringField
      FieldName = 'Salvar_XML'
      Size = 300
    end
    object qrychama_configuracaoCodigo_Tabela_Preco_Padrao: TIntegerField
      FieldName = 'Codigo_Tabela_Preco_Padrao'
    end
    object qrychama_configuracaoAvisa_Tabela_Preco: TStringField
      FieldName = 'Avisa_Tabela_Preco'
      Size = 3
    end
    object qrychama_configuracaoAvisa_Lancamento_Financeiro: TStringField
      FieldName = 'Avisa_Lancamento_Financeiro'
      Size = 3
    end
    object qrychama_configuracaoAvisa_Cheque: TStringField
      FieldName = 'Avisa_Cheque'
      Size = 3
    end
    object qrychama_configuracaoAvisa_Pedido_Compra_Pendente: TStringField
      FieldName = 'Avisa_Pedido_Compra_Pendente'
      Size = 3
    end
    object qrychama_configuracaoAvisa_Aniversario_Cliente: TStringField
      FieldName = 'Avisa_Aniversario_Cliente'
      Size = 3
    end
    object qrychama_configuracaoAvisa_Aniversario_Funcionario: TStringField
      FieldName = 'Avisa_Aniversario_Funcionario'
      Size = 3
    end
    object qrychama_configuracaoAvisa_Produto_Vencido: TStringField
      FieldName = 'Avisa_Produto_Vencido'
      Size = 3
    end
    object qrychama_configuracaoFazer_Backup: TStringField
      FieldName = 'Fazer_Backup'
      Size = 3
    end
    object qrychama_configuracaoAvisa_Conta_Fixa: TStringField
      FieldName = 'Avisa_Conta_Fixa'
      Size = 3
    end
    object qrychama_configuracaoAvisa_Cotacao_Preco: TStringField
      FieldName = 'Avisa_Cotacao_Preco'
      Size = 3
    end
    object qrychama_configuracaoDias_Aviso: TIntegerField
      FieldName = 'Dias_Aviso'
    end
    object qrychama_configuracaoTempo_Atualizacao: TIntegerField
      FieldName = 'Tempo_Atualizacao'
    end
    object qrychama_configuracaoISSQN: TStringField
      FieldName = 'ISSQN'
      Size = 15
    end
    object qrychama_configuracaoCodigo_Tipo_Documento: TIntegerField
      FieldName = 'Codigo_Tipo_Documento'
    end
    object qrychama_configuracaoCodigo_Departamento: TIntegerField
      FieldName = 'Codigo_Departamento'
    end
    object qrychama_configuracaoCodigo_Plano_Financeiro: TIntegerField
      FieldName = 'Codigo_Plano_Financeiro'
    end
    object qrychama_configuracaoHistorico: TStringField
      FieldName = 'Historico'
      Size = 50
    end
    object qrychama_configuracaoCodigo_Tipo_Documento_Pagar: TIntegerField
      FieldName = 'Codigo_Tipo_Documento_Pagar'
    end
    object qrychama_configuracaoCodigo_Departamento_Pagar: TIntegerField
      FieldName = 'Codigo_Departamento_Pagar'
    end
    object qrychama_configuracaoCodigo_Plano_Financeiro_Pagar: TIntegerField
      FieldName = 'Codigo_Plano_Financeiro_Pagar'
    end
    object qrychama_configuracaoHistorico_Pagar: TStringField
      FieldName = 'Historico_Pagar'
      Size = 50
    end
    object qrychama_configuracaoN_Certificado: TStringField
      FieldName = 'N_Certificado'
      Size = 100
    end
    object qrychama_configuracaoSenha_Certificado: TStringField
      FieldName = 'Senha_Certificado'
      Size = 50
    end
    object qrychama_configuracaoCaminho_Schema: TStringField
      FieldName = 'Caminho_Schema'
      Size = 300
    end
    object qrychama_configuracaoEAN_Balanca: TIntegerField
      FieldName = 'EAN_Balanca'
    end
    object qrychama_configuracaoGerar_Financeiro: TIntegerField
      FieldName = 'Gerar_Financeiro'
    end
    object qrychama_configuracaoDias_Orcamento_Vencido: TIntegerField
      FieldName = 'Dias_Orcamento_Vencido'
    end
    object qrychama_configuracaoFechar_Caixa: TIntegerField
      FieldName = 'Fechar_Caixa'
    end
    object qrychama_configuracaoCalcula_Juro: TIntegerField
      FieldName = 'Calcula_Juro'
    end
    object qrychama_configuracaoAtualiza_Orcamento_Vencido: TIntegerField
      FieldName = 'Atualiza_Orcamento_Vencido'
    end
    object qrychama_configuracaoConsulta_Padrao_Produto: TIntegerField
      FieldName = 'Consulta_Padrao_Produto'
    end
    object qrychama_configuracaoTipo_Desc_Acr_Padrao: TIntegerField
      FieldName = 'Tipo_Desc_Acr_Padrao'
    end
    object qrychama_configuracaoGerar_Estoque: TIntegerField
      FieldName = 'Gerar_Estoque'
    end
    object qrychama_configuracaoOb_Cliente_Nome: TIntegerField
      FieldName = 'Ob_Cliente_Nome'
    end
    object qrychama_configuracaoOb_Cliente_Razao_Social: TIntegerField
      FieldName = 'Ob_Cliente_Razao_Social'
    end
    object qrychama_configuracaoOb_Cliente_CPF: TIntegerField
      FieldName = 'Ob_Cliente_CPF'
    end
    object qrychama_configuracaoOb_Cliente_RG: TIntegerField
      FieldName = 'Ob_Cliente_RG'
    end
    object qrychama_configuracaoOb_Cliente_CNPJ: TIntegerField
      FieldName = 'Ob_Cliente_CNPJ'
    end
    object qrychama_configuracaoOb_Cliente_Insc_Estadual: TIntegerField
      FieldName = 'Ob_Cliente_Insc_Estadual'
    end
    object qrychama_configuracaoOb_Cliente_Endereco: TIntegerField
      FieldName = 'Ob_Cliente_Endereco'
    end
    object qrychama_configuracaoOb_Cliente_Numero: TIntegerField
      FieldName = 'Ob_Cliente_Numero'
    end
    object qrychama_configuracaoOb_Cliente_Setor: TIntegerField
      FieldName = 'Ob_Cliente_Setor'
    end
    object qrychama_configuracaoOb_Cliente_Email: TIntegerField
      FieldName = 'Ob_Cliente_Email'
    end
    object qrychama_configuracaoOb_Cliente_Cidade: TIntegerField
      FieldName = 'Ob_Cliente_Cidade'
    end
    object qrychama_configuracaoOb_Cliente_Data_Nascimento: TIntegerField
      FieldName = 'Ob_Cliente_Data_Nascimento'
    end
    object qrychama_configuracaoOb_Cliente_Telefone: TIntegerField
      FieldName = 'Ob_Cliente_Telefone'
    end
    object qrychama_configuracaoBloqueia_Cliente: TStringField
      FieldName = 'Bloqueia_Cliente'
      Size = 3
    end
    object qrychama_configuracaoTipo_Impressao_Pedido: TIntegerField
      FieldName = 'Tipo_Impressao_Pedido'
    end
    object qrychama_configuracaoCaminho_PDF_Pedido: TStringField
      FieldName = 'Caminho_PDF_Pedido'
      Size = 500
    end
    object qrychama_configuracaoUsar_Comissao: TIntegerField
      FieldName = 'Usar_Comissao'
    end
    object qrychama_configuracaoTamanho_Impressao: TIntegerField
      FieldName = 'Tamanho_Impressao'
    end
    object qrychama_configuracaoQtde_Copias: TIntegerField
      FieldName = 'Qtde_Copias'
    end
    object qrychama_configuracaoCaminho_PDF_Carne: TStringField
      FieldName = 'Caminho_PDF_Carne'
      Size = 500
    end
    object qrychama_configuracaoObservacoes_Carne: TStringField
      FieldName = 'Observacoes_Carne'
      Size = 500
    end
    object qrychama_configuracaoTipo_Dias: TIntegerField
      FieldName = 'Tipo_Dias'
    end
    object qrychama_configuracaoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qrychama_configuracaoTipo_Documento: TStringField
      FieldName = 'Tipo_Documento'
      Size = 30
    end
    object qrychama_configuracaoDepartamento: TStringField
      FieldName = 'Departamento'
      Size = 30
    end
    object qrychama_configuracaoPlano: TStringField
      FieldName = 'Plano'
      Size = 300
    end
    object qrychama_configuracaoTipo_Documento_1: TStringField
      FieldName = 'Tipo_Documento_1'
      Size = 30
    end
    object qrychama_configuracaoDepartamento_1: TStringField
      FieldName = 'Departamento_1'
      Size = 30
    end
    object qrychama_configuracaoPlano_1: TStringField
      FieldName = 'Plano_1'
      Size = 300
    end
    object qrychama_configuracaoGera_Pre_Venda: TStringField
      FieldName = 'Gera_Pre_Venda'
      Size = 4
    end
    object qrychama_configuracaoGera_OS: TStringField
      FieldName = 'Gera_OS'
      Size = 4
    end
    object qrychama_configuracaoGera_DAV: TStringField
      FieldName = 'Gera_DAV'
      Size = 4
    end
    object qrychama_configuracaoGera_NFE: TStringField
      FieldName = 'Gera_NFE'
      Size = 4
    end
    object qrychama_configuracaoQtde_Maq: TIntegerField
      FieldName = 'Qtde_Maq'
    end
    object qrychama_configuracaoTipo_OS: TIntegerField
      FieldName = 'Tipo_OS'
    end
    object qrychama_configuracaoModelo_Etiqueta: TIntegerField
      FieldName = 'Modelo_Etiqueta'
    end
    object qrychama_configuracaoDPI_Impressora_Etiqueta: TIntegerField
      FieldName = 'DPI_Impressora_Etiqueta'
    end
    object qrychama_configuracaoAvanco_Impressora_Etiqueta: TIntegerField
      FieldName = 'Avanco_Impressora_Etiqueta'
    end
    object qrychama_configuracaoPorta_Impressora_Etiqueta: TStringField
      FieldName = 'Porta_Impressora_Etiqueta'
      Size = 50
    end
    object qrychama_configuracaoLimpar_Memoria_Impressora_Etiqueta: TIntegerField
      FieldName = 'Limpar_Memoria_Impressora_Etiqueta'
    end
    object qrychama_configuracaoTemperatura_Impressora_Etiqueta: TIntegerField
      FieldName = 'Temperatura_Impressora_Etiqueta'
    end
    object qrychama_configuracaoOpcao_Servico_Padrao: TIntegerField
      FieldName = 'Opcao_Servico_Padrao'
    end
    object qrychama_configuracaoDesbloqueia_Cliente: TStringField
      FieldName = 'Desbloqueia_Cliente'
    end
    object qrychama_configuracaoControla_Credito_Cliente: TIntegerField
      FieldName = 'Controla_Credito_Cliente'
    end
    object qrychama_configuracaoBusca_Parametro_Calculo_Preco: TIntegerField
      FieldName = 'Busca_Parametro_Calculo_Preco'
    end
    object qrychama_configuracaoGera_Cupom_Fiscal: TStringField
      FieldName = 'Gera_Cupom_Fiscal'
      Size = 4
    end
    object qrychama_configuracaoGera_Codigo_EAN_Valido: TIntegerField
      FieldName = 'Gera_Codigo_EAN_Valido'
    end
    object qrychama_configuracaoCodigo_CFOP_Padrao: TIntegerField
      FieldName = 'Codigo_CFOP_Padrao'
    end
    object qrychama_configuracaoCFOP: TStringField
      FieldName = 'CFOP'
      ReadOnly = True
      Size = 513
    end
    object qrychama_configuracaoTrazer_Somente_Cond_Pag_ECF: TIntegerField
      FieldName = 'Trazer_Somente_Cond_Pag_ECF'
    end
    object qrychama_configuracaoIdCSC: TStringField
      FieldName = 'IdCSC'
    end
    object qrychama_configuracaoNumeroCSC: TStringField
      FieldName = 'NumeroCSC'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_configuracao
    Left = 496
    Top = 272
  end
  object qrychama_webservice_1_producao: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select WebService_1_Producao.* from WebService_1_Producao')
    Left = 464
    Top = 328
    object qrychama_webservice_1_producaoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_webservice_1_producaoWebService_UF: TStringField
      FieldName = 'WebService_UF'
      Size = 300
    end
    object qrychama_webservice_1_producaoRecepcao: TStringField
      FieldName = 'Recepcao'
      Size = 300
    end
    object qrychama_webservice_1_producaoRetorno: TStringField
      FieldName = 'Retorno'
      Size = 300
    end
    object qrychama_webservice_1_producaoStatus: TStringField
      FieldName = 'Status'
      Size = 300
    end
    object qrychama_webservice_1_producaoCancelamento: TStringField
      FieldName = 'Cancelamento'
      Size = 300
    end
    object qrychama_webservice_1_producaoInutilizacao: TStringField
      FieldName = 'Inutilizacao'
      Size = 300
    end
    object qrychama_webservice_1_producaoConsulta: TStringField
      FieldName = 'Consulta'
      Size = 300
    end
    object qrychama_webservice_1_producaoConsulta_Cadastro: TStringField
      FieldName = 'Consulta_Cadastro'
      Size = 300
    end
  end
  object qrychama_webservice_2_producao: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select WebService_2_Producao.* from WebService_2_Producao')
    Left = 496
    Top = 328
    object qrychama_webservice_2_producaoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_webservice_2_producaoWebService_UF: TStringField
      FieldName = 'WebService_UF'
      Size = 300
    end
    object qrychama_webservice_2_producaoRecepcao: TStringField
      FieldName = 'Recepcao'
      Size = 300
    end
    object qrychama_webservice_2_producaoRetorno: TStringField
      FieldName = 'Retorno'
      Size = 300
    end
    object qrychama_webservice_2_producaoStatus: TStringField
      FieldName = 'Status'
      Size = 300
    end
    object qrychama_webservice_2_producaoCancelamento: TStringField
      FieldName = 'Cancelamento'
      Size = 300
    end
    object qrychama_webservice_2_producaoInutilizacao: TStringField
      FieldName = 'Inutilizacao'
      Size = 300
    end
    object qrychama_webservice_2_producaoConsulta: TStringField
      FieldName = 'Consulta'
      Size = 300
    end
    object qrychama_webservice_2_producaoConsulta_Cadastro: TStringField
      FieldName = 'Consulta_Cadastro'
      Size = 300
    end
  end
  object qrychama_webservice_1_homologacao: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select WebService_1_Homologacao.* from WebService_1_Homologacao')
    Left = 528
    Top = 328
    object qrychama_webservice_1_homologacaoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_webservice_1_homologacaoWebService_UF: TStringField
      FieldName = 'WebService_UF'
      Size = 300
    end
    object qrychama_webservice_1_homologacaoRecepcao: TStringField
      FieldName = 'Recepcao'
      Size = 300
    end
    object qrychama_webservice_1_homologacaoRetorno: TStringField
      FieldName = 'Retorno'
      Size = 300
    end
    object qrychama_webservice_1_homologacaoStatus: TStringField
      FieldName = 'Status'
      Size = 300
    end
    object qrychama_webservice_1_homologacaoCancelamento: TStringField
      FieldName = 'Cancelamento'
      Size = 300
    end
    object qrychama_webservice_1_homologacaoInutilizacao: TStringField
      FieldName = 'Inutilizacao'
      Size = 300
    end
    object qrychama_webservice_1_homologacaoConsulta: TStringField
      FieldName = 'Consulta'
      Size = 300
    end
    object qrychama_webservice_1_homologacaoConsulta_Cadastro: TStringField
      FieldName = 'Consulta_Cadastro'
      Size = 300
    end
  end
  object qrychama_webservice_2_homologacao: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select WebService_2_Homologacao.* from WebService_2_Homologacao')
    Left = 560
    Top = 328
    object qrychama_webservice_2_homologacaoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_webservice_2_homologacaoWebService_UF: TStringField
      FieldName = 'WebService_UF'
      Size = 300
    end
    object qrychama_webservice_2_homologacaoRecepcao: TStringField
      FieldName = 'Recepcao'
      Size = 300
    end
    object qrychama_webservice_2_homologacaoRetorno: TStringField
      FieldName = 'Retorno'
      Size = 300
    end
    object qrychama_webservice_2_homologacaoStatus: TStringField
      FieldName = 'Status'
      Size = 300
    end
    object qrychama_webservice_2_homologacaoCancelamento: TStringField
      FieldName = 'Cancelamento'
      Size = 300
    end
    object qrychama_webservice_2_homologacaoInutilizacao: TStringField
      FieldName = 'Inutilizacao'
      Size = 300
    end
    object qrychama_webservice_2_homologacaoConsulta: TStringField
      FieldName = 'Consulta'
      Size = 300
    end
    object qrychama_webservice_2_homologacaoConsulta_Cadastro: TStringField
      FieldName = 'Consulta_Cadastro'
      Size = 300
    end
  end
  object qryECF: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Configuracao_ECF')
    Left = 152
    Top = 160
    object qryECFCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryECFCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qryECFN_Fabricacao: TStringField
      FieldName = 'N_Fabricacao'
      Size = 30
    end
    object qryECFGT: TFloatField
      FieldName = 'GT'
    end
    object qryECFPorta: TStringField
      FieldName = 'Porta'
      Size = 5
    end
    object qryECFMarca: TStringField
      FieldName = 'Marca'
    end
    object qryECFCIECF: TStringField
      FieldName = 'CIECF'
      Size = 10
    end
    object qryECFMD5: TStringField
      FieldName = 'MD5'
      Size = 50
    end
    object qryECFData_Ativacao: TDateTimeField
      FieldName = 'Data_Ativacao'
    end
  end
end
