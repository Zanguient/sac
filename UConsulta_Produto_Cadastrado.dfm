object FrmConsulta_Produto_Cadastrado: TFrmConsulta_Produto_Cadastrado
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderStyle = bsSingle
  Caption = 'Consulta Produtos'
  ClientHeight = 536
  ClientWidth = 952
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  DesignSize = (
    952
    536)
  PixelsPerInch = 96
  TextHeight = 13
  object Label40: TLabel
    Left = 440
    Top = 70
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
  object Label1: TLabel
    Left = 747
    Top = 71
    Width = 31
    Height = 13
    Caption = 'Inicio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 807
    Top = 71
    Width = 20
    Height = 13
    Caption = 'Fim'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 113
    Top = 110
    Width = 833
    Height = 426
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Title.Caption = 'C'#243'digo'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Original'
        Title.Caption = 'C'#243'd. Original'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Similar'
        Title.Caption = 'C'#243'd. Similar'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Venda'
        Title.Caption = 'C'#243'd. Venda'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 258
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Compra'
        Title.Caption = 'Valor Compra'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Preco_Vista'
        Title.Caption = 'Pre'#231'o Vista'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Preco_Prazo'
        Title.Caption = 'Pre'#231'o Prazo'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome_Fantasia'
        Title.Caption = 'Fornecedor'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Grupo_Produto'
        Title.Caption = 'Grupo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Marca'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Local'
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Detalhe'
        Width = 460
        Visible = True
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 112
    Height = 536
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 108
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
    Images = DM.ImgImagens_Consulta
    List = True
    ParentFont = False
    ShowCaptions = True
    TabOrder = 5
    object BBtnFiltrar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Clique para pesquisar'
      Caption = '&Pesquisar'
      ImageIndex = 1
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnFiltrarClick
    end
    object BBtnLimpar: TToolButton
      Left = 0
      Top = 38
      Cursor = crHandPoint
      Hint = 'Clique para limpar a pesquisa realizada e iniciar outra'
      Caption = 'Li&mpar'
      Enabled = False
      ImageIndex = 2
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnLimparClick
    end
    object BBtnImprimir: TToolButton
      Left = 0
      Top = 76
      Cursor = crHandPoint
      Hint = 'Clique para imprimir a pesquisa realizada'
      Caption = 'Imp&rimir'
      Enabled = False
      ImageIndex = 3
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnImprimirClick
    end
    object BBtnImprimir_Lista_Preco: TToolButton
      Left = 0
      Top = 114
      Cursor = crHandPoint
      Caption = 'Imp. Lis. Pr.'
      Enabled = False
      ImageIndex = 3
      Wrap = True
      OnClick = BBtnImprimir_Lista_PrecoClick
    end
    object BBtnFechar: TToolButton
      Left = 0
      Top = 152
      Cursor = crHandPoint
      Hint = 'Clique para fechar a janela'
      Caption = '&Fechar'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object EdtDescricao: TEdit
    Left = 505
    Top = 86
    Width = 243
    Height = 17
    BevelEdges = [beTop, beRight, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    TabOrder = 1
    OnKeyPress = EdtDescricaoKeyPress
  end
  object EdtCodigo: TEdit
    Left = 440
    Top = 86
    Width = 65
    Height = 17
    Hint = 'Pressione F3 para consultar'
    BevelEdges = [beLeft, beTop, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clMenu
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnDblClick = EdtCodigoDblClick
    OnKeyDown = EdtCodigoKeyDown
    OnKeyPress = EdtCodigoKeyPress
  end
  object RGConsulta_Por: TRadioGroup
    Left = 113
    Top = -1
    Width = 104
    Height = 106
    Caption = 'Consulta Por'
    ItemIndex = 0
    Items.Strings = (
      'Tudo'
      'Grupo'
      'Marca'
      'Local'
      'Fornecedor'
      'Data Validade')
    TabOrder = 6
  end
  object RGOrdena_Por: TRadioGroup
    Left = 223
    Top = -1
    Width = 104
    Height = 106
    Caption = 'Ordena Por'
    ItemIndex = 0
    Items.Strings = (
      'Descri'#231#227'o'
      'Grupo'
      'Marca'
      'Local'
      'Fornecedor'
      'Data Validade')
    TabOrder = 7
  end
  object MEdtData_Inicial: TMaskEdit
    Left = 747
    Top = 86
    Width = 61
    Height = 17
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 2
    Text = '  /  /    '
  end
  object MEdtData_Final: TMaskEdit
    Left = 807
    Top = 86
    Width = 61
    Height = 17
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 3
    Text = '  /  /    '
  end
  object RGStatus: TRadioGroup
    Left = 333
    Top = -1
    Width = 104
    Height = 106
    Caption = 'Status'
    ItemIndex = 0
    Items.Strings = (
      'Ativo'
      'Inativo')
    TabOrder = 8
  end
  object qryconsulta: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Codigo_V' +
        'enda, P.Descricao, P.Data_Fabricacao, P.Data_Validade, P.Valor_C' +
        'ompra, ITP.Preco_Vista, ITP.Preco_Prazo, '
      'GP.Descricao as Grupo_Produto, M.Descricao as Marca, '
      'LP.Local, LP.Detalhe, F.Nome_Fantasia from Produto P'
      'left join Grupo_Produto GP on (P.Codigo_Grupo = GP.Codigo)'
      'left join Marca M on (P.Codigo_Marca = M.Codigo)'
      'left join Localidade_Produto LP on (P.Codigo_Local = LP.Codigo)'
      'left join Fornecedor F on (P.Codigo_Fornecedor = F.Codigo)'
      
        'left join Itens_Tabela_Preco ITP on (P.Codigo = ITP.Codigo_Produ' +
        'to)'
      'left join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)')
    Left = 469
    Top = 272
    object qryconsultaCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qryconsultaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qryconsultaData_Fabricacao: TDateTimeField
      FieldName = 'Data_Fabricacao'
      OnGetText = qryconsultaData_FabricacaoGetText
    end
    object qryconsultaData_Validade: TDateTimeField
      FieldName = 'Data_Validade'
      OnGetText = qryconsultaData_ValidadeGetText
    end
    object qryconsultaValor_Compra: TFloatField
      FieldName = 'Valor_Compra'
      DisplayFormat = '#0.0,0'
    end
    object qryconsultaPreco_Vista: TFloatField
      FieldName = 'Preco_Vista'
      DisplayFormat = '#0.0,0'
    end
    object qryconsultaGrupo_Produto: TStringField
      FieldName = 'Grupo_Produto'
      Size = 30
    end
    object qryconsultaMarca: TStringField
      FieldName = 'Marca'
      Size = 30
    end
    object qryconsultaLocal: TStringField
      FieldName = 'Local'
    end
    object qryconsultaDetalhe: TStringField
      FieldName = 'Detalhe'
      Size = 70
    end
    object qryconsultaNome_Fantasia: TStringField
      FieldName = 'Nome_Fantasia'
      Size = 50
    end
    object qryconsultaCodigo_Original: TStringField
      FieldName = 'Codigo_Original'
    end
    object qryconsultaCodigo_Similar: TStringField
      FieldName = 'Codigo_Similar'
    end
    object qryconsultaCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryconsultaPreco_Prazo: TFloatField
      FieldName = 'Preco_Prazo'
      DisplayFormat = '#0.0,0'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta
    Left = 501
    Top = 272
  end
end
