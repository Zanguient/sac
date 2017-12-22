object FrmConsulta_Lucratividade_Produto: TFrmConsulta_Lucratividade_Produto
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderStyle = bsSingle
  Caption = 'Consulta Lucratividade por Produto'
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
  object Label7: TLabel
    Left = 279
    Top = 76
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
  object Label8: TLabel
    Left = 215
    Top = 76
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
    TabOrder = 0
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
  object MEdtData_Final: TMaskEdit
    Left = 279
    Top = 91
    Width = 63
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 1
    Text = '  /  /    '
    OnExit = MEdtData_FinalExit
  end
  object MEdtData_Inicial: TMaskEdit
    Left = 215
    Top = 91
    Width = 65
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 2
    Text = '  /  /    '
    OnExit = MEdtData_InicialExit
  end
  object RGTipo: TRadioGroup
    Left = 113
    Top = 2
    Width = 96
    Height = 106
    Caption = 'Tipo de Venda'
    ItemIndex = 0
    Items.Strings = (
      'Tudo'
      'Cupom Fiscal'
      'NFe')
    TabOrder = 3
  end
  object cxGrid1: TcxGrid
    Left = 113
    Top = 111
    Width = 826
    Height = 425
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    LookAndFeel.NativeStyle = False
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      FilterBox.CustomizeButtonAlignment = fbaLeft
      FilterBox.Position = fpTop
      FilterBox.Visible = fvNever
      DataController.DataSource = ds_qry_consulta_padrao
      DataController.Filter.Active = True
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skSum
        end
        item
          Kind = skSum
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          FieldName = 'Total_vendido'
          Column = cxGrid1DBTableView1Total_vendido
        end
        item
          Kind = skSum
          FieldName = 'Qtde'
          Column = cxGrid1DBTableView1Qtde
        end
        item
          Kind = skSum
          FieldName = 'Custo_total'
          Column = cxGrid1DBTableView1Custo_total
        end>
      DataController.Summary.SummaryGroups = <>
      DateTimeHandling.DateFormat = 'DD/MM/YYYY'
      FilterRow.InfoText = 'Clique para definir um filtro'
      FilterRow.Visible = True
      NewItemRow.InfoText = 'Clique para adicionar uma nova linha'
      NewItemRow.SeparatorColor = clMenu
      OptionsBehavior.ColumnHeaderHints = False
      OptionsCustomize.ColumnHiding = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsCustomize.DataRowSizing = True
      OptionsSelection.MultiSelect = True
      OptionsView.NoDataToDisplayInfoText = 'N'#227'o h'#225' dados para visualizar'
      OptionsView.Footer = True
      OptionsView.GroupFooterMultiSummaries = True
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.GroupSummaryLayout = gslAlignWithColumns
      OptionsView.Indicator = True
      Preview.Visible = True
      Styles.ContentEven = cxStyle1
      object cxGrid1DBTableView1Codigo_venda: TcxGridDBColumn
        Caption = 'Codigo Venda'
        DataBinding.FieldName = 'Codigo_venda'
        Options.Editing = False
        Width = 123
      end
      object cxGrid1DBTableView1Descricao: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'Descricao'
        Options.Editing = False
        Width = 197
      end
      object cxGrid1DBTableView1Qtde: TcxGridDBColumn
        Caption = 'Qtde.'
        DataBinding.FieldName = 'Qtde'
        Options.Editing = False
        Width = 82
      end
      object cxGrid1DBTableView1Total_vendido: TcxGridDBColumn
        Caption = 'Total Vendido'
        DataBinding.FieldName = 'Total_vendido'
        Options.Editing = False
        Width = 95
      end
      object cxGrid1DBTableView1Custo_total: TcxGridDBColumn
        Caption = 'Custo Total'
        DataBinding.FieldName = 'Custo_total'
        Options.Editing = False
        Width = 89
      end
      object cxGrid1DBTableView1lucratividade: TcxGridDBColumn
        Caption = 'Lucratividade'
        DataBinding.FieldName = 'lucratividade'
        Options.Editing = False
        Width = 102
      end
      object cxGrid1DBTableView1percentual: TcxGridDBColumn
        Caption = '%'
        DataBinding.FieldName = 'percentual'
        Options.Editing = False
        Width = 45
      end
      object cxGrid1DBTableView1lucratividade_unitaria: TcxGridDBColumn
        Caption = 'L. Unit'#225'ria'
        DataBinding.FieldName = 'lucratividade_unitaria'
        Options.Editing = False
        Width = 79
      end
      object cxGrid1DBTableView1Data_Validade: TcxGridDBColumn
        Caption = 'Data de Validade'
        DataBinding.FieldName = 'Data_Validade'
        Options.Editing = False
      end
      object cxGrid1DBTableView1Data_Fabricacao: TcxGridDBColumn
        Caption = 'Data de Fabrica'#231#227'o'
        DataBinding.FieldName = 'Data_Fabricacao'
        Options.Editing = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object qryconsulta_lucro: TADOQuery
    Active = True
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select          Y.Codigo_venda,'
      #9'   Y.Descricao,'
      #9'   Y.Qtde,'
      #9'   Y.Total_vendido,'
      #9'   Y.Custo_total,'
      '                   Y.Data_Validade,'
      '                   Y.Data_Fabricacao,'
      
        '                   (Y.Total_vendido - Y.Custo_total) as lucrativ' +
        'idade,'
      #9'   ((Y.custo_total / Y.totalgeral)*100) as percentual,'
      
        '                   ((Y.Total_vendido - Y.Custo_total) / Y.Qtde) ' +
        'as lucratividade_unitaria'
      'from('
      'select Pro.Codigo_Venda AS CODIGO_VENDA, '
      '          Pro.Descricao AS DESCRICAO, '
      '          Pro.Data_Validade,'
      '          Pro.Data_Fabricacao,'
      '          sum(IP.Qtde) as Qtde, '
      '          sum(IP.Sub_Total_Liquido) as Total_Vendido, '
      '          (Pro.Valor_Medio * sum(IP.Qtde)) as Custo_Total,'
      ''
      '          (select sum(t.Sub_Total_Liquido) from Itens_Pedido t '
      '          left join Pedido Ped on (t.Codigo = Ped.Codigo)'
      
        '          where Ped.Data_Venda between '#39'01/01/2011'#39' and '#39'05/05/2' +
        '015'#39') as totalgeral '
      ''
      'from Itens_Pedido IP'
      'left join Produto Pro on (Pro.Codigo = IP.Codigo_Produto)'
      'left join Pedido Ped on (IP.Codigo = Ped.Codigo)'
      ''
      'where Ped.Data_Venda between '#39'01/01/2011'#39' and '#39'05/05/2015'#39
      
        'group by Pro.Codigo_Venda, Pro.Descricao, Pro.Valor_Medio,  Pro.' +
        'Data_Validade,  Pro.Data_Fabricacao) Y'
      'order by percentual desc')
    Left = 797
    Top = 24
    object qryconsulta_lucroCodigo_venda: TStringField
      FieldName = 'Codigo_venda'
    end
    object qryconsulta_lucroDescricao: TStringField
      FieldName = 'Descricao'
      Size = 200
    end
    object qryconsulta_lucroQtde: TFloatField
      FieldName = 'Qtde'
      ReadOnly = True
      DisplayFormat = '#0.0,00'
    end
    object qryconsulta_lucroTotal_vendido: TFloatField
      FieldName = 'Total_vendido'
      ReadOnly = True
      DisplayFormat = '#0.0,00'
    end
    object qryconsulta_lucroCusto_total: TFloatField
      FieldName = 'Custo_total'
      ReadOnly = True
      DisplayFormat = '#0.0,00'
    end
    object qryconsulta_lucrolucratividade: TFloatField
      FieldName = 'lucratividade'
      ReadOnly = True
      DisplayFormat = '#0.0,00'
    end
    object qryconsulta_lucropercentual: TFloatField
      FieldName = 'percentual'
      ReadOnly = True
      DisplayFormat = '#0.0,00'
    end
    object qryconsulta_lucrolucratividade_unitaria: TFloatField
      FieldName = 'lucratividade_unitaria'
      ReadOnly = True
      DisplayFormat = '#0.0,00'
    end
    object qryconsulta_lucroData_Fabricacao: TDateTimeField
      FieldName = 'Data_Fabricacao'
    end
    object qryconsulta_lucroData_Validade: TDateTimeField
      FieldName = 'Data_Validade'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_lucro
    Left = 829
    Top = 24
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = dxComponentPrinter1Link1
    PreviewOptions.Caption = 'Pr'#233'-visualiza'#231#227'o'
    PreviewOptions.WindowState = wsMaximized
    PrintTitle = 'Impress'#227'o FAV'
    Version = 0
    Left = 304
    Top = 16
    object dxComponentPrinter1Link1: TdxGridReportLink
      Component = cxGrid1
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportTitle.Text = 'Lucratividade por Produto'
      BuiltInReportLink = True
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 632
    Top = 40
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clMenu
    end
  end
  object cxPropertiesStore1: TcxPropertiesStore
    Components = <
      item
        Component = cxGrid1DBTableView1
        Properties.Strings = (
          'OptionsCustomize.ColumnMoving'
          'OptionsCustomize.ColumnSorting'
          'OptionsCustomize.ColumnsQuickCustomization')
      end
      item
        Component = cxGrid1DBTableView1Codigo_venda
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Custo_total
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Descricao
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1lucratividade
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1lucratividade_unitaria
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1percentual
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Qtde
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Total_vendido
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end>
    StorageName = 'ConfiguraGrid'
    Left = 272
    Top = 16
  end
end
