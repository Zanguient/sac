object FrmConsulta_Preco_Produto: TFrmConsulta_Preco_Produto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Pre'#231'o de Produtos'
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 361
    Top = 21
    Width = 45
    Height = 13
    Caption = 'Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 641
    Top = 21
    Width = 48
    Height = 13
    Caption = 'Tabela 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 641
    Top = 61
    Width = 48
    Height = 13
    Caption = 'Tabela 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 361
    Top = 75
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
  object Label4: TLabel
    Left = 421
    Top = 75
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
    Width = 838
    Height = 425
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 8
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
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Tabela'
        Width = 218
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Produto'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Venda'
        Title.Caption = 'Codigo Venda'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao_1'
        Title.Caption = 'Descri'#231#227'o'
        Width = 296
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Title.Caption = 'Data Cadastro'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Validade'
        Title.Caption = 'Data Validade'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Preco_Vista'
        Title.Caption = 'Pre'#231'o Vista'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Preco_Prazo'
        Title.Caption = 'Pre'#231'o Prazo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Percentual_Desconto_Vista'
        Title.Caption = '% Desconto Vista'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Percentual_Desconto_Prazo'
        Title.Caption = '% Desconto Prazo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Percentual_Lucro'
        Title.Caption = '% Lucro'
        Visible = True
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 113
    Top = 0
    Width = 122
    Height = 107
    Caption = 'Consulta por:'
    ItemIndex = 0
    Items.Strings = (
      'Tudo'
      'Produto'
      'Tabela')
    TabOrder = 9
  end
  object EdtProduto: TEdit
    Left = 418
    Top = 38
    Width = 218
    Height = 17
    BevelEdges = [beTop, beRight, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    OnKeyDown = EdtProdutoKeyDown
    OnKeyPress = EdtProdutoKeyPress
  end
  object RGOrdena_Por: TRadioGroup
    Left = 240
    Top = 0
    Width = 114
    Height = 54
    Caption = 'Ordenar Pesquisa:'
    ItemIndex = 0
    Items.Strings = (
      'Produto'
      'Tabela')
    TabOrder = 10
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 102
    Height = 536
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 98
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
    TabOrder = 11
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
    object BBtnFechar: TToolButton
      Left = 0
      Top = 114
      Cursor = crHandPoint
      Hint = 'Clique para fechar a janela'
      Caption = '&Fechar'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object EdtCodigo_Produto: TEdit
    Left = 361
    Top = 38
    Width = 57
    Height = 17
    Hint = 'Pressione F3 para consultar'
    BevelEdges = [beLeft, beTop, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clCream
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnKeyDown = EdtCodigo_ProdutoKeyDown
    OnKeyPress = EdtCodigo_ProdutoKeyPress
  end
  object RGTipo: TRadioGroup
    Left = 240
    Top = 54
    Width = 114
    Height = 53
    Caption = 'Tipo Tabela:'
    ItemIndex = 0
    Items.Strings = (
      'Vigente'
      'Vencida')
    TabOrder = 12
  end
  object EdtTabela1: TEdit
    Left = 698
    Top = 38
    Width = 232
    Height = 17
    BevelEdges = [beTop, beRight, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 5
    OnKeyDown = EdtProdutoKeyDown
    OnKeyPress = EdtTabela1KeyPress
  end
  object EdtCodigo_Tabela1: TEdit
    Left = 641
    Top = 38
    Width = 57
    Height = 17
    Hint = 'Pressione F3 para consultar'
    BevelEdges = [beLeft, beTop, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clCream
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnKeyDown = EdtCodigo_Tabela1KeyDown
    OnKeyPress = EdtCodigo_Tabela1KeyPress
  end
  object EdtTabela2: TEdit
    Left = 698
    Top = 78
    Width = 232
    Height = 17
    BevelEdges = [beTop, beRight, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 7
    OnKeyDown = EdtProdutoKeyDown
    OnKeyPress = EdtTabela2KeyPress
  end
  object EdtCodigo_Tabela2: TEdit
    Left = 641
    Top = 78
    Width = 57
    Height = 17
    Hint = 'Pressione F3 para consultar'
    BevelEdges = [beLeft, beTop, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clCream
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnKeyDown = EdtCodigo_Tabela2KeyDown
    OnKeyPress = EdtCodigo_Tabela2KeyPress
  end
  object MEdtData_Inicial: TMaskEdit
    Left = 361
    Top = 90
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
    Left = 421
    Top = 90
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
  object qryconsulta_preco: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select ITP.*, TP.Descricao, TP.Data_Cadastro, TP.Data_Validade, ' +
        'P.Codigo_Venda, P.Descricao from Itens_Tabela_Preco ITP'
      'inner join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)'
      'left join Produto P on (ITP.Codigo_Produto = P.Codigo)'
      'where TP.Data_Cadastro = '#39'23/11/2010'#39' and ITP.Codigo_Produto = 2')
    Left = 469
    Top = 272
    object qryconsulta_precoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryconsulta_precoCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qryconsulta_precoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qryconsulta_precoCodigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object qryconsulta_precoDescricao_1: TStringField
      FieldName = 'Descricao_1'
      Size = 50
    end
    object qryconsulta_precoPreco_Vista: TFloatField
      FieldName = 'Preco_Vista'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_precoPreco_Prazo: TFloatField
      FieldName = 'Preco_Prazo'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_precoPercentual_Desconto_Vista: TFloatField
      FieldName = 'Percentual_Desconto_Vista'
    end
    object qryconsulta_precoPercentual_Desconto_Prazo: TFloatField
      FieldName = 'Percentual_Desconto_Prazo'
    end
    object qryconsulta_precoData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qryconsulta_precoData_Validade: TDateTimeField
      FieldName = 'Data_Validade'
    end
    object qryconsulta_precoPercentual_Lucro_Vista: TFloatField
      FieldName = 'Percentual_Lucro_Vista'
    end
    object qryconsulta_precoPercentual_Lucro_Prazo: TFloatField
      FieldName = 'Percentual_Lucro_Prazo'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_preco
    Left = 501
    Top = 272
  end
end
