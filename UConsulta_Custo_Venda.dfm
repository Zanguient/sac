object FrmConsulta_Custo_Venda: TFrmConsulta_Custo_Venda
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderStyle = bsSingle
  Caption = 'Consulta Custo x Venda'
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
    Left = 327
    Top = 74
    Width = 90
    Height = 13
    Caption = 'Tabela de Pre'#231'o'
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
    Height = 426
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo_Venda'
        Title.Caption = 'Codigo Venda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sigla'
        Title.Caption = 'UN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Estoque'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Medio'
        Title.Caption = 'Custo M'#233'dio'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Saldo_Estoque'
        Title.Caption = 'Saldo Estoque'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Preco_Vista'
        Title.Caption = 'Pre'#231'o Unit'#225'rio'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Total'
        Title.Caption = 'Valor Total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Diferenca'
        Title.Caption = 'Diferen'#231'a'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Perc_Real'
        Title.Caption = '% Real'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Percentual_Lucro_Vista'
        Title.Caption = '% Lucro'
        Visible = True
      end>
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
    TabOrder = 1
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
  object RGOrdena_Por: TRadioGroup
    Left = 113
    Top = 2
    Width = 208
    Height = 106
    Caption = 'Ordena Por'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Codigo Venda'
      'Descri'#231#227'o'
      'Estoque'
      'Custo M'#233'dio'
      'Saldo'
      'Pre'#231'o Vista'
      'Valor Total'
      'Diferen'#231'a'
      '% Lucro')
    TabOrder = 2
  end
  object EdtTabela_Preco: TEdit
    Left = 392
    Top = 91
    Width = 313
    Height = 17
    BevelEdges = [beTop, beRight, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    TabOrder = 3
    OnKeyPress = EdtTabela_PrecoKeyPress
  end
  object EdtCodigo_Tabela_Preco: TEdit
    Left = 327
    Top = 91
    Width = 65
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
    OnKeyDown = EdtCodigo_Tabela_PrecoKeyDown
    OnKeyPress = EdtCodigo_Tabela_PrecoKeyPress
  end
  object qryconsulta_custo_venda: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select P.Codigo_Venda, P.Descricao, P.Estoque, P.Valor_Medio, P.' +
        'Saldo_Estoque, ITP.Preco_Vista, (P.Estoque * ITP.Preco_Vista) as' +
        ' Valor_Total, '
      
        '(P.Saldo_Estoque - (P.Estoque * ITP.Preco_Vista)) as Diferenca, ' +
        '(P.Saldo_Estoque / (P.Estoque * ITP.Preco_Vista)) as Perc_Real, ' +
        'ITP.Percentual_Lucro_Vista, UM.Sigla from Produto P'
      
        'inner join Itens_Tabela_Preco ITP on (P.Codigo = ITP.Codigo_Prod' +
        'uto)'
      'inner join Tabela_Preco TP on (ITP.Codigo = TP.Codigo)'
      
        'inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Co' +
        'digo)')
    Left = 469
    Top = 272
    object qryconsulta_custo_vendaCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qryconsulta_custo_vendaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qryconsulta_custo_vendaEstoque: TFloatField
      FieldName = 'Estoque'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_custo_vendaValor_Medio: TFloatField
      FieldName = 'Valor_Medio'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_custo_vendaSaldo_Estoque: TFloatField
      FieldName = 'Saldo_Estoque'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_custo_vendaPreco_Vista: TFloatField
      FieldName = 'Preco_Vista'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_custo_vendaValor_Total: TFloatField
      FieldName = 'Valor_Total'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_custo_vendaDiferenca: TFloatField
      FieldName = 'Diferenca'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_custo_vendaSigla: TStringField
      FieldName = 'Sigla'
      Size = 5
    end
    object qryconsulta_custo_vendaPerc_Real: TFloatField
      FieldName = 'Perc_Real'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_custo_vendaPercentual_Lucro_Vista: TFloatField
      FieldName = 'Percentual_Lucro_Vista'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_custo_venda
    Left = 501
    Top = 272
  end
end
