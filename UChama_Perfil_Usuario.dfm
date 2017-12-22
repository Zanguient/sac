object FrmChama_Perfil_Usuario: TFrmChama_Perfil_Usuario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Perfil de Usu'#225'rio'
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
  object LblMarca: TLabel
    Left = 252
    Top = 40
    Width = 61
    Height = 13
    Caption = 'Par'#226'metro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 80
    Width = 941
    Height = 473
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
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
        FieldName = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Perfil'
        Width = 414
        Visible = True
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 0
    Top = 0
    Width = 121
    Height = 73
    Caption = 'Consulta por:'
    ItemIndex = 1
    Items.Strings = (
      'C'#243'digo'
      'Descri'#231#227'o')
    TabOrder = 2
  end
  object EdtConsulta: TEdit
    Left = 252
    Top = 56
    Width = 289
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    TabOrder = 0
    OnKeyDown = EdtConsultaKeyDown
  end
  object RGOrdena_Por: TRadioGroup
    Left = 127
    Top = 0
    Width = 121
    Height = 73
    Caption = 'Ordenar Pesquisa:'
    ItemIndex = 1
    Items.Strings = (
      'C'#243'digo'
      'Descri'#231#227'o')
    TabOrder = 3
  end
  object ToolBar1: TToolBar
    Left = 751
    Top = 31
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
    TabOrder = 4
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
  object qrychama_perfil: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Perfil_Usuario')
    Left = 464
    Top = 272
    object qrychama_perfilCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_perfilPerfil: TStringField
      FieldName = 'Perfil'
      Size = 30
    end
    object qrychama_perfilCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qrychama_perfilAdicao_Aliquota_Tributaria: TIntegerField
      FieldName = 'Adicao_Aliquota_Tributaria'
    end
    object qrychama_perfilAltera_Simbolo_Moeda: TIntegerField
      FieldName = 'Altera_Simbolo_Moeda'
    end
    object qrychama_perfilHorario_Verao: TIntegerField
      FieldName = 'Horario_Verao'
    end
    object qrychama_perfilPrograma_Arredondamento: TIntegerField
      FieldName = 'Programa_Arredondamento'
    end
    object qrychama_perfilPrograma_Truncamento: TIntegerField
      FieldName = 'Programa_Truncamento'
    end
    object qrychama_perfilCadastro_Empresa: TIntegerField
      FieldName = 'Cadastro_Empresa'
    end
    object qrychama_perfilCadastro_Produto: TIntegerField
      FieldName = 'Cadastro_Produto'
    end
    object qrychama_perfilCadastro_Grupo_Produto: TIntegerField
      FieldName = 'Cadastro_Grupo_Produto'
    end
    object qrychama_perfilCadastro_Unidade_Medida: TIntegerField
      FieldName = 'Cadastro_Unidade_Medida'
    end
    object qrychama_perfilCadastro_Localidade: TIntegerField
      FieldName = 'Cadastro_Localidade'
    end
    object qrychama_perfilCadastro_Tabela_Preco: TIntegerField
      FieldName = 'Cadastro_Tabela_Preco'
    end
    object qrychama_perfilCadastro_Receita: TIntegerField
      FieldName = 'Cadastro_Receita'
    end
    object qrychama_perfilCadastro_Fornecedor: TIntegerField
      FieldName = 'Cadastro_Fornecedor'
    end
    object qrychama_perfilCadastro_Transportadora: TIntegerField
      FieldName = 'Cadastro_Transportadora'
    end
    object qrychama_perfilCadastro_CFOP: TIntegerField
      FieldName = 'Cadastro_CFOP'
    end
    object qrychama_perfilCadastro_Situacao_Tributaria: TIntegerField
      FieldName = 'Cadastro_Situacao_Tributaria'
    end
    object qrychama_perfilCadastro_Cliente: TIntegerField
      FieldName = 'Cadastro_Cliente'
    end
    object qrychama_perfilCadastro_Grupo_Cliente: TIntegerField
      FieldName = 'Cadastro_Grupo_Cliente'
    end
    object qrychama_perfilCadastro_Funcionario: TIntegerField
      FieldName = 'Cadastro_Funcionario'
    end
    object qrychama_perfilCadastro_Cargo: TIntegerField
      FieldName = 'Cadastro_Cargo'
    end
    object qrychama_perfilCadastro_Departamento: TIntegerField
      FieldName = 'Cadastro_Departamento'
    end
    object qrychama_perfilCadastro_Tipo_Documento: TIntegerField
      FieldName = 'Cadastro_Tipo_Documento'
    end
    object qrychama_perfilCadastro_Plano_Financeiro: TIntegerField
      FieldName = 'Cadastro_Plano_Financeiro'
    end
    object qrychama_perfilCadastro_Banco: TIntegerField
      FieldName = 'Cadastro_Banco'
    end
    object qrychama_perfilCadastro_Conta_Corrente: TIntegerField
      FieldName = 'Cadastro_Conta_Corrente'
    end
    object qrychama_perfilCadastro_Operacao_Bancaria: TIntegerField
      FieldName = 'Cadastro_Operacao_Bancaria'
    end
    object qrychama_perfilCadastro_Condicao_Pagamento: TIntegerField
      FieldName = 'Cadastro_Condicao_Pagamento'
    end
    object qrychama_perfilCadastro_Itens_Folha_Pagamento: TIntegerField
      FieldName = 'Cadastro_Itens_Folha_Pagamento'
    end
    object qrychama_perfilCadastro_Cidade: TIntegerField
      FieldName = 'Cadastro_Cidade'
    end
    object qrychama_perfilCadastro_Setor: TIntegerField
      FieldName = 'Cadastro_Setor'
    end
    object qrychama_perfilCadastro_Logradouro: TIntegerField
      FieldName = 'Cadastro_Logradouro'
    end
    object qrychama_perfilCadastro_Pais: TIntegerField
      FieldName = 'Cadastro_Pais'
    end
    object qrychama_perfilCadastro_Veiculo: TIntegerField
      FieldName = 'Cadastro_Veiculo'
    end
    object qrychama_perfilCadastro_Marca: TIntegerField
      FieldName = 'Cadastro_Marca'
    end
    object qrychama_perfilCadastro_Regra_ICMS: TIntegerField
      FieldName = 'Cadastro_Regra_ICMS'
    end
    object qrychama_perfilCadastro_Tratamento_ICMS: TIntegerField
      FieldName = 'Cadastro_Tratamento_ICMS'
    end
    object qrychama_perfilCadastro_Observacao_Fiscal: TIntegerField
      FieldName = 'Cadastro_Observacao_Fiscal'
    end
    object qrychama_perfilCadastro_Regra_PIS: TIntegerField
      FieldName = 'Cadastro_Regra_PIS'
    end
    object qrychama_perfilCadastro_Tratamento_PIS: TIntegerField
      FieldName = 'Cadastro_Tratamento_PIS'
    end
    object qrychama_perfilCadastro_Regra_COFINS: TIntegerField
      FieldName = 'Cadastro_Regra_COFINS'
    end
    object qrychama_perfilCadastro_Tratamento_COFINS: TIntegerField
      FieldName = 'Cadastro_Tratamento_COFINS'
    end
    object qrychama_perfilCadastro_Regra_IPI: TIntegerField
      FieldName = 'Cadastro_Regra_IPI'
    end
    object qrychama_perfilCadastro_Tratamento_IPI: TIntegerField
      FieldName = 'Cadastro_Tratamento_IPI'
    end
    object qrychama_perfilCadastro_NCM: TIntegerField
      FieldName = 'Cadastro_NCM'
    end
    object qrychama_perfilCadastro_Regra_ISSQN: TIntegerField
      FieldName = 'Cadastro_Regra_ISSQN'
    end
    object qrychama_perfilCadastro_Perfil_Usuario: TIntegerField
      FieldName = 'Cadastro_Perfil_Usuario'
    end
    object qrychama_perfilMov_Entrada_Produto: TIntegerField
      FieldName = 'Mov_Entrada_Produto'
    end
    object qrychama_perfilMov_Pedido_Producao: TIntegerField
      FieldName = 'Mov_Pedido_Producao'
    end
    object qrychama_perfilMov_Fechamento_Estoque: TIntegerField
      FieldName = 'Mov_Fechamento_Estoque'
    end
    object qrychama_perfilMov_Lancamento_Manual: TIntegerField
      FieldName = 'Mov_Lancamento_Manual'
    end
    object qrychama_perfilMov_Cupom_Fiscal: TIntegerField
      FieldName = 'Mov_Cupom_Fiscal'
    end
    object qrychama_perfilMov_Gerar_DAV: TIntegerField
      FieldName = 'Mov_Gerar_DAV'
    end
    object qrychama_perfilMov_Reimpressao_DAV: TIntegerField
      FieldName = 'Mov_Reimpressao_DAV'
    end
    object qrychama_perfilAbertura_Caixa: TIntegerField
      FieldName = 'Abertura_Caixa'
    end
    object qrychama_perfilSuprimento: TIntegerField
      FieldName = 'Suprimento'
    end
    object qrychama_perfilSangria: TIntegerField
      FieldName = 'Sangria'
    end
    object qrychama_perfilRecebimento: TIntegerField
      FieldName = 'Recebimento'
    end
    object qrychama_perfilLancamento_Financeiro: TIntegerField
      FieldName = 'Lancamento_Financeiro'
    end
    object qrychama_perfilBaixar_Titulo: TIntegerField
      FieldName = 'Baixar_Titulo'
    end
    object qrychama_perfilLancamento_Bancario: TIntegerField
      FieldName = 'Lancamento_Bancario'
    end
    object qrychama_perfilConciliacao: TIntegerField
      FieldName = 'Conciliacao'
    end
    object qrychama_perfilCheque: TIntegerField
      FieldName = 'Cheque'
    end
    object qrychama_perfilBaixar_Cheque: TIntegerField
      FieldName = 'Baixar_Cheque'
    end
    object qrychama_perfilFolha_Pagamento: TIntegerField
      FieldName = 'Folha_Pagamento'
    end
    object qrychama_perfilConsulta_Posicao_Estoque: TIntegerField
      FieldName = 'Consulta_Posicao_Estoque'
    end
    object qrychama_perfilConsulta_Reposicao_Estoque: TIntegerField
      FieldName = 'Consulta_Reposicao_Estoque'
    end
    object qrychama_perfilConsulta_Saldo_Estoque: TIntegerField
      FieldName = 'Consulta_Saldo_Estoque'
    end
    object qrychama_perfilConsulta_Entrada: TIntegerField
      FieldName = 'Consulta_Entrada'
    end
    object qrychama_perfilConsulta_Venda: TIntegerField
      FieldName = 'Consulta_Venda'
    end
    object qrychama_perfilConsulta_Ordem_Servico: TIntegerField
      FieldName = 'Consulta_Ordem_Servico'
    end
    object qrychama_perfilConsulta_Lancamento_Financeiro: TIntegerField
      FieldName = 'Consulta_Lancamento_Financeiro'
    end
    object qrychama_perfilConsulta_Conta_Fixa: TIntegerField
      FieldName = 'Consulta_Conta_Fixa'
    end
    object qrychama_perfilConsulta_Folha_Pagamento: TIntegerField
      FieldName = 'Consulta_Folha_Pagamento'
    end
    object qrychama_perfilConsulta_Lancamento_Bancario: TIntegerField
      FieldName = 'Consulta_Lancamento_Bancario'
    end
    object qrychama_perfilConsulta_Cheque: TIntegerField
      FieldName = 'Consulta_Cheque'
    end
    object qrychama_perfilConsulta_Saldo_Bancario: TIntegerField
      FieldName = 'Consulta_Saldo_Bancario'
    end
    object qrychama_perfilConsulta_Acerto_Caixa: TIntegerField
      FieldName = 'Consulta_Acerto_Caixa'
    end
    object qrychama_perfilConfiguracao_Sistema: TIntegerField
      FieldName = 'Configuracao_Sistema'
    end
    object qrychama_perfilHistorico: TIntegerField
      FieldName = 'Historico'
    end
    object qrychama_perfilAcerto_Caixa: TIntegerField
      FieldName = 'Acerto_Caixa'
    end
    object qrychama_perfilAltera_Caixa: TIntegerField
      FieldName = 'Altera_Caixa'
    end
    object qrychama_perfilConsulta_Fechamento_Caixa: TIntegerField
      FieldName = 'Consulta_Fechamento_Caixa'
    end
    object qrychama_perfilRevalida_Sistema: TIntegerField
      FieldName = 'Revalida_Sistema'
    end
    object qrychama_perfilConsulta_Lucro_Produto: TIntegerField
      FieldName = 'Consulta_Lucro_Produto'
    end
    object qrychama_perfilConsulta_Lucro_Grupo: TIntegerField
      FieldName = 'Consulta_Lucro_Grupo'
    end
    object qrychama_perfilConsulta_Lucro_Marca: TIntegerField
      FieldName = 'Consulta_Lucro_Marca'
    end
    object qrychama_perfilMapa_Resumo: TIntegerField
      FieldName = 'Mapa_Resumo'
    end
    object qrychama_perfilCadastro_Etiqueta: TIntegerField
      FieldName = 'Cadastro_Etiqueta'
    end
    object qrychama_perfilGera_Etiqueta_Cliente: TIntegerField
      FieldName = 'Gera_Etiqueta_Cliente'
    end
    object qrychama_perfilGera_Etiqueta_Produto: TIntegerField
      FieldName = 'Gera_Etiqueta_Produto'
    end
    object qrychama_perfilInventario_Estoque: TIntegerField
      FieldName = 'Inventario_Estoque'
    end
    object qrychama_perfilAgenda_Telefonica: TIntegerField
      FieldName = 'Agenda_Telefonica'
    end
    object qrychama_perfilAlteracao_Produto: TIntegerField
      FieldName = 'Alteracao_Produto'
    end
    object qrychama_perfilContagem_Estoque: TIntegerField
      FieldName = 'Contagem_Estoque'
    end
    object qrychama_perfilConsulta_Historico_Movimentacao: TIntegerField
      FieldName = 'Consulta_Historico_Movimentacao'
    end
    object qrychama_perfilMov_NFe: TIntegerField
      FieldName = 'Mov_NFe'
    end
    object qrychama_perfilCadastro_Status: TIntegerField
      FieldName = 'Cadastro_Status'
    end
    object qrychama_perfilCadastro_Tipo_Ocorrencia: TIntegerField
      FieldName = 'Cadastro_Tipo_Ocorrencia'
    end
    object qrychama_perfilRegistro_Ocorrencia: TIntegerField
      FieldName = 'Registro_Ocorrencia'
    end
    object qrychama_perfilConsulta_Ocorrencia: TIntegerField
      FieldName = 'Consulta_Ocorrencia'
    end
    object qrychama_perfilCadastro_Tipo_Bem: TIntegerField
      FieldName = 'Cadastro_Tipo_Bem'
    end
    object qrychama_perfilCadastro_Patrimonio: TIntegerField
      FieldName = 'Cadastro_Patrimonio'
    end
    object qrychama_perfilConsulta_Patrimonio: TIntegerField
      FieldName = 'Consulta_Patrimonio'
    end
    object qrychama_perfilConsulta_Ficha_Cliente: TIntegerField
      FieldName = 'Consulta_Ficha_Cliente'
    end
    object qrychama_perfilConsulta_Tabela_Preco: TIntegerField
      FieldName = 'Consulta_Tabela_Preco'
    end
    object qrychama_perfilOcorrencia_Cobranca: TIntegerField
      FieldName = 'Ocorrencia_Cobranca'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_perfil
    Left = 496
    Top = 272
  end
end
