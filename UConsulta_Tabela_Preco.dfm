object FrmConsulta_Tabela_Preco: TFrmConsulta_Tabela_Preco
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Tabela de Pre'#231'os'
  ClientHeight = 495
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
    Left = 489
    Top = 22
    Width = 38
    Height = 13
    Caption = 'Tabela'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 489
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
    Left = 549
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
    Top = 140
    Width = 838
    Height = 149
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
    OnCellClick = DBGrid1CellClick
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 253
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Title.Caption = 'Data Cadastro'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Validade'
        Title.Caption = 'Data Validade'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo_Calculo'
        Title.Caption = 'Tipo Calculo'
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
      'Tabela'
      'Data Cadastro'
      'Data Validade')
    TabOrder = 5
  end
  object EdtTabela: TEdit
    Left = 546
    Top = 39
    Width = 269
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
    OnKeyDown = EdtTabelaKeyDown
  end
  object RGOrdena_Por: TRadioGroup
    Left = 240
    Top = 0
    Width = 114
    Height = 107
    Caption = 'Ordenar Pesquisa:'
    ItemIndex = 0
    Items.Strings = (
      'Tabela'
      'Data Cadastro'
      'Data Validade')
    TabOrder = 6
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 102
    Height = 495
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
    TabOrder = 7
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
  object EdtCodigo_Tabela: TEdit
    Left = 489
    Top = 39
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
    OnKeyDown = EdtCodigo_TabelaKeyDown
    OnKeyPress = EdtCodigo_TabelaKeyPress
  end
  object RGTipo: TRadioGroup
    Left = 360
    Top = 0
    Width = 114
    Height = 107
    Caption = 'Tipo de Tabela'
    ItemIndex = 0
    Items.Strings = (
      'Vigente'
      'Vencida')
    TabOrder = 8
  end
  object MEdtData_Inicial: TMaskEdit
    Left = 489
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
    Left = 549
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
  object Panel1: TPanel
    Left = 113
    Top = 113
    Width = 838
    Height = 24
    BorderStyle = bsSingle
    Caption = 'Tabela(s) de Produto(s)'
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 9
  end
  object DBGrid2: TDBGrid
    Left = 113
    Top = 318
    Width = 838
    Height = 176
    BorderStyle = bsNone
    DataSource = DataSource1
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid2DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = False
      end
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
        Width = 287
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Produto'
        Visible = False
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
        FieldName = 'Percentual_Lucro_Vista'
        Title.Caption = '% V.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Percentual_Lucro_Prazo'
        Title.Caption = '% P.'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 113
    Top = 294
    Width = 838
    Height = 24
    BorderStyle = bsSingle
    Caption = 'Itens da Tabela(s) de Produto(s) selecionada'
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 11
  end
  object qryconsulta_tabela: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select TP.* from Tabela_Preco TP')
    Left = 453
    Top = 168
    object qryconsulta_tabelaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryconsulta_tabelaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qryconsulta_tabelaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qryconsulta_tabelaData_Validade: TDateTimeField
      FieldName = 'Data_Validade'
    end
    object qryconsulta_tabelaTipo: TStringField
      FieldName = 'Tipo'
    end
    object qryconsulta_tabelaCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qryconsulta_tabelaTipo_Calculo: TStringField
      FieldName = 'Tipo_Calculo'
    end
    object qryconsulta_tabelaPercentual_Vista: TFloatField
      FieldName = 'Percentual_Vista'
    end
    object qryconsulta_tabelaPercentual_Prazo: TFloatField
      FieldName = 'Percentual_Prazo'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_tabela
    Left = 485
    Top = 168
  end
  object qryitens_tabela: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select ITP.*, P.Codigo_Venda, P.Descricao from Itens_Tabela_Prec' +
        'o ITP'
      'left join Produto P on (ITP.Codigo_Produto = P.Codigo)')
    Left = 453
    Top = 240
    object qryitens_tabelaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryitens_tabelaCodigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object qryitens_tabelaPreco_Vista: TFloatField
      FieldName = 'Preco_Vista'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_tabelaPreco_Prazo: TFloatField
      FieldName = 'Preco_Prazo'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_tabelaPercentual_Desconto_Vista: TFloatField
      FieldName = 'Percentual_Desconto_Vista'
    end
    object qryitens_tabelaPercentual_Desconto_Prazo: TFloatField
      FieldName = 'Percentual_Desconto_Prazo'
    end
    object qryitens_tabelaCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qryitens_tabelaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qryitens_tabelaCodigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ReadOnly = True
    end
    object qryitens_tabelaPercentual_Lucro_Vista: TFloatField
      FieldName = 'Percentual_Lucro_Vista'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_tabelaPercentual_Lucro_Prazo: TFloatField
      FieldName = 'Percentual_Lucro_Prazo'
      DisplayFormat = '#0.0,0'
    end
  end
  object DataSource1: TDataSource
    DataSet = qryitens_tabela
    Left = 485
    Top = 240
  end
end
