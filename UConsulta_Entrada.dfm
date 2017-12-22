object FrmConsulta_Entrada: TFrmConsulta_Entrada
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Entradas'
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
    Left = 505
    Top = 18
    Width = 64
    Height = 13
    Caption = 'Fornecedor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 505
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
    Left = 565
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
  object Label4: TLabel
    Left = 625
    Top = 71
    Width = 60
    Height = 13
    Caption = 'Nota Fiscal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblPerc: TLabel
    Left = 736
    Top = 71
    Width = 13
    Height = 13
    Caption = '%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RGConsulta_Por: TRadioGroup
    Left = 235
    Top = -3
    Width = 145
    Height = 107
    Caption = 'Consulta por:'
    ItemIndex = 0
    Items.Strings = (
      'Nota Fiscal'
      'Data Emiss'#227'o'
      'Data Entrada'
      'Fornecedor'
      'Data Emiss'#227'o/Forn.'
      'Data Entrada/Forn.')
    TabOrder = 7
  end
  object EdtFornecedor: TEdit
    Left = 562
    Top = 35
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
  end
  object RGOrdena_Por: TRadioGroup
    Left = 384
    Top = -3
    Width = 114
    Height = 107
    Caption = 'Ordenar Pesquisa:'
    ItemIndex = 0
    Items.Strings = (
      'Data Emiss'#227'o'
      'Data Entrada'
      'Fornecedor')
    TabOrder = 8
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
    TabOrder = 9
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
    object BBtnAtualiza_Produto: TToolButton
      Left = 0
      Top = 76
      Cursor = crHandPoint
      Caption = 'At. Prod.'
      Enabled = False
      ImageIndex = 6
      Wrap = True
      OnClick = BBtnAtualiza_ProdutoClick
    end
    object BBtnImprimir: TToolButton
      Left = 0
      Top = 114
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
    object BBtnExportar_XLS: TToolButton
      Left = 0
      Top = 152
      Cursor = crHandPoint
      Caption = '&Exp. XLS'
      Enabled = False
      ImageIndex = 8
      Wrap = True
      OnClick = BBtnExportar_XLSClick
    end
    object BBtnFechar: TToolButton
      Left = 0
      Top = 190
      Cursor = crHandPoint
      Hint = 'Clique para fechar a janela'
      Caption = '&Fechar'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object EdtCodigo_Fornecedor: TEdit
    Left = 505
    Top = 35
    Width = 57
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
    OnKeyDown = EdtCodigo_FornecedorKeyDown
    OnKeyPress = EdtCodigo_FornecedorKeyPress
  end
  object MEdtData_Inicial: TMaskEdit
    Left = 505
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
    Left = 565
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
  object EdtNota_Fiscal: TEdit
    Left = 625
    Top = 86
    Width = 112
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
    OnKeyDown = EdtCodigo_FornecedorKeyDown
  end
  object PageControl1: TPageControl
    Left = 116
    Top = 110
    Width = 833
    Height = 423
    Cursor = crHandPoint
    ActivePage = TabSheet1
    MultiLine = True
    Style = tsFlatButtons
    TabOrder = 10
    object TabSheet1: TTabSheet
      Caption = 'Anal'#237'tico'
      object DBGrid1: TDBGrid
        Left = 816
        Top = 15
        Width = 822
        Height = 148
        BorderStyle = bsNone
        DataSource = ds_consulta_entrada
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
        Visible = False
        OnCellClick = DBGrid1CellClick
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'N_Nota_Fiscal'
            Title.Caption = 'Nota Fiscal'
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome_Fantasia'
            Title.Caption = 'Fornecedor'
            Width = 323
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Modelo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Serie'
            Title.Caption = 'S'#233'rie'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Emissao'
            Title.Caption = 'Data Emiss'#227'o'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Hora_Emissao'
            Title.Caption = 'Hora Emiss'#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Entrada'
            Title.Caption = 'Data Entrada'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Hora_Entrada'
            Title.Caption = 'Hora Entrada'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Codigo_Fornecedor'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Codigo_CFOP'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'CFOP'
            Title.Caption = 'C.F.O.P.'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantidade_Itens'
            Title.Caption = 'Qtde. Itens'
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Peso_Total'
            Title.Caption = 'Peso Total'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Codigo_1'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'N_Nota_Fiscal_1'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Total_Produtos'
            Title.Caption = 'Total Produtos'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Custo_Total'
            Title.Caption = 'Custo Total'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Base_ICMS'
            Title.Caption = 'Base ICMS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_ICMS'
            Title.Caption = 'Valor ICMS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Base_ICMS_Subs'
            Title.Caption = 'Base ICMS Subs.'
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_ICMS_Subs'
            Title.Caption = 'Valor ICMS Subs.'
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Frete'
            Title.Caption = 'Valor Frete'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Seguro'
            Title.Caption = 'Valor Seguro'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Outras_Despesas'
            Title.Caption = 'Outras Despesas'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total_IPI'
            Title.Caption = 'Total IPI'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Desconto'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total_Nota'
            Title.Caption = 'Total Nota'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Observacao'
            Title.Caption = 'Observa'#231#227'o'
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 816
        Top = -11
        Width = 825
        Height = 25
        BorderStyle = bsSingle
        Caption = 'Entrada(s)'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        Visible = False
      end
      object DBGrid2: TDBGrid
        Left = 816
        Top = 197
        Width = 822
        Height = 184
        BorderStyle = bsNone
        DataSource = ds_consulta_itens_entrada
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Visible = False
        OnDrawColumnCell = DBGrid2DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'N_Nota_Fiscal'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Codigo_Produto'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Codigo_Venda'
            Title.Caption = 'Codigo Produto do XML'
            Width = 102
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Title.Caption = 'Descri'#231#227'o do XML'
            Width = 297
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NCM'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Unidade'
            Title.Caption = 'Un'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ST'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Unitario'
            Title.Caption = 'Valor Unit'#225'rio'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Ultima_Compra'
            Title.Caption = #218'lt. Compra'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantidade'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Total'
            Title.Caption = 'Valor Total'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Aliquota_ICMS'
            Title.Caption = 'ICMS'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Aliquota_IPI'
            Title.Caption = 'IPI'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IVA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_IPI'
            Title.Caption = 'Valor IPI'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Frete_Unitario'
            Title.Caption = 'Valor Desp.'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantidade_Volume'
            Title.Caption = 'Qtde. Vol.'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CFOP'
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BC_ICMS'
            Title.Caption = 'BC. ICMS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_ICMS_Unitario'
            Title.Caption = 'Val. ICMS Unit.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Custo_Unitario'
            Title.Caption = 'Custo Unit'#225'rio'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Estoque'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Percentual_Lucro_Vista'
            Title.Caption = '% V.'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Vista'
            Title.Caption = 'Pre'#231'o Vista'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Percentual_Lucro_Prazo'
            Title.Caption = '% P.'
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Prazo'
            Title.Caption = 'Pre'#231'o Prazo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Codigo_Venda'
            Title.Caption = 'C'#243'digo Venda'
            Width = 113
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Title.Caption = 'Descri'#231#227'o'
            Width = 543
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 816
        Top = 166
        Width = 825
        Height = 25
        BorderStyle = bsSingle
        Caption = 'Item(s) da Entrada'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
        Visible = False
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 825
        Height = 392
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
          DataController.DataSource = ds_consulta_entrada
          DataController.KeyFieldNames = 'Codigo'
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = '#0.0,0'
              Kind = skSum
              Position = spFooter
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
              FieldName = 'Total_Nota'
              Column = cxGrid1DBTableView1Total_Nota
            end
            item
              Format = 'Total: #'
              Kind = skCount
              FieldName = 'Codigo'
              Column = cxGrid1DBTableView1Codigo
            end>
          DataController.Summary.SummaryGroups = <>
          DateTimeHandling.DateFormat = 'DD/MM/YYYY'
          FilterRow.InfoText = 'Clique para definir um filtro'
          FilterRow.Visible = True
          NewItemRow.InfoText = 'Clique para adicionar uma nova linha'
          NewItemRow.SeparatorColor = clMenu
          OptionsBehavior.GoToNextCellOnEnter = True
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
          Styles.ContentEven = DM.cxStyle1
          Styles.Footer = DM.cxStyle2
          Styles.GroupSummary = DM.cxStyle2
          Styles.Header = DM.cxStyle2
          object cxGrid1DBTableView1Codigo: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'Codigo'
            Options.Editing = False
            Width = 37
          end
          object cxGrid1DBTableView1N_Nota_Fiscal: TcxGridDBColumn
            Caption = 'N'#186' Nota Fiscal'
            DataBinding.FieldName = 'N_Nota_Fiscal'
            Options.Editing = False
            Width = 103
          end
          object cxGrid1DBTableView1Nome_Fantasia: TcxGridDBColumn
            Caption = 'Fornecedor'
            DataBinding.FieldName = 'Nome_Fantasia'
            Options.Editing = False
            Width = 319
          end
          object cxGrid1DBTableView1Modelo: TcxGridDBColumn
            DataBinding.FieldName = 'Modelo'
            Options.Editing = False
          end
          object cxGrid1DBTableView1Serie: TcxGridDBColumn
            DataBinding.FieldName = 'Serie'
            Options.Editing = False
          end
          object cxGrid1DBTableView1Data_Emissao: TcxGridDBColumn
            Caption = 'Emiss'#227'o'
            DataBinding.FieldName = 'Data_Emissao'
            Options.Editing = False
            Width = 86
          end
          object cxGrid1DBTableView1Hora_Emissao: TcxGridDBColumn
            Caption = 'Hora Emiss'#227'o'
            DataBinding.FieldName = 'Hora_Emissao'
            Options.Editing = False
            Width = 90
          end
          object cxGrid1DBTableView1Data_Entrada: TcxGridDBColumn
            Caption = 'Entrada'
            DataBinding.FieldName = 'Data_Entrada'
            Options.Editing = False
            Width = 85
          end
          object cxGrid1DBTableView1Hora_Entrada: TcxGridDBColumn
            Caption = 'Hora Entrada'
            DataBinding.FieldName = 'Hora_Entrada'
            Options.Editing = False
            Width = 81
          end
          object cxGrid1DBTableView1Quantidade_Itens: TcxGridDBColumn
            Caption = 'Qtde. Itens'
            DataBinding.FieldName = 'Quantidade_Itens'
            Options.Editing = False
            Width = 74
          end
          object cxGrid1DBTableView1Total_Produtos: TcxGridDBColumn
            Caption = 'Total Produtos'
            DataBinding.FieldName = 'Total_Produtos'
            Options.Editing = False
            Width = 98
          end
          object cxGrid1DBTableView1Total_Nota: TcxGridDBColumn
            Caption = 'Total Nota'
            DataBinding.FieldName = 'Total_Nota'
            Options.Editing = False
            Width = 93
          end
          object cxGrid1DBTableView1Custo_Total: TcxGridDBColumn
            Caption = 'Custo Total'
            DataBinding.FieldName = 'Custo_Total'
            Options.Editing = False
            Width = 93
          end
          object cxGrid1DBTableView1CFOP: TcxGridDBColumn
            DataBinding.FieldName = 'CFOP'
            Options.Editing = False
            Width = 74
          end
          object cxGrid1DBTableView1Observacao: TcxGridDBColumn
            Caption = 'Observa'#231#245'es'
            DataBinding.FieldName = 'Observacao'
            Options.Editing = False
            Width = 400
          end
        end
        object cxGrid1TableView1: TcxGridTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          object cxGrid1TableView1Column1: TcxGridColumn
          end
        end
        object cxGrid1DBTableView2: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          FilterBox.Visible = fvNever
          DataController.DataSource = ds_consulta_itens_entrada
          DataController.DetailKeyFieldNames = 'Codigo'
          DataController.KeyFieldNames = 'Codigo_Registro'
          DataController.MasterKeyFieldNames = 'Codigo'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsCustomize.DataRowSizing = True
          OptionsView.Footer = True
          OptionsView.GroupFooterMultiSummaries = True
          OptionsView.GroupFooters = gfAlwaysVisible
          OptionsView.GroupSummaryLayout = gslAlignWithColumns
          OptionsView.Indicator = True
          Preview.Visible = True
          Styles.ContentEven = DM.cxStyle1
          Styles.Footer = DM.cxStyle2
          Styles.GroupSummary = DM.cxStyle2
          Styles.Header = DM.cxStyle2
          object cxGrid1DBTableView2Codigo: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'Codigo'
            Options.Editing = False
          end
          object cxGrid1DBTableView2N_Item: TcxGridDBColumn
            Caption = 'N'#186' Item'
            DataBinding.FieldName = 'N_Item'
            Options.Editing = False
            Width = 53
          end
          object cxGrid1DBTableView2N_Nota_Fiscal: TcxGridDBColumn
            Caption = 'N'#186' Nota Fiscal'
            DataBinding.FieldName = 'N_Nota_Fiscal'
            Options.Editing = False
            Width = 94
          end
          object cxGrid1DBTableView2Codigo_Produto: TcxGridDBColumn
            Caption = 'C'#243'digo Produto'
            DataBinding.FieldName = 'Codigo_Produto'
            Options.Editing = False
            Width = 101
          end
          object cxGrid1DBTableView2Codigo_Produto_Fornecedor: TcxGridDBColumn
            Caption = 'C'#243'd. Prod. Forn.'
            DataBinding.FieldName = 'Codigo_Produto_Fornecedor'
            Options.Editing = False
          end
          object cxGrid1DBTableView2Descricao_Produto: TcxGridDBColumn
            Caption = 'Desc. Prod. Forn.'
            DataBinding.FieldName = 'Descricao_Produto'
            Options.Editing = False
            Width = 277
          end
          object cxGrid1DBTableView2Codigo_Venda: TcxGridDBColumn
            Caption = 'C'#243'd. Venda Sistema'
            DataBinding.FieldName = 'Codigo_Venda'
            Options.Editing = False
            Width = 124
          end
          object cxGrid1DBTableView2Descricao: TcxGridDBColumn
            Caption = 'Descri'#231#227'o Sistema'
            DataBinding.FieldName = 'Descricao'
            Options.Editing = False
            Width = 318
          end
          object cxGrid1DBTableView2Unidade: TcxGridDBColumn
            Caption = 'Un.'
            DataBinding.FieldName = 'Unidade'
            Options.Editing = False
          end
          object cxGrid1DBTableView2NCM: TcxGridDBColumn
            DataBinding.FieldName = 'NCM'
            Options.Editing = False
            Width = 61
          end
          object cxGrid1DBTableView2CFOP: TcxGridDBColumn
            DataBinding.FieldName = 'CFOP'
            Options.Editing = False
            Width = 68
          end
          object cxGrid1DBTableView2ST: TcxGridDBColumn
            DataBinding.FieldName = 'ST'
            Options.Editing = False
          end
          object cxGrid1DBTableView2Valor_Ultima_Compra: TcxGridDBColumn
            Caption = #218'lt. Compra'
            DataBinding.FieldName = 'Valor_Ultima_Compra'
            Options.Editing = False
            Width = 80
          end
          object cxGrid1DBTableView2Valor_Unitario: TcxGridDBColumn
            Caption = 'Valor Unit'#225'rio'
            DataBinding.FieldName = 'Valor_Unitario'
            Options.Editing = False
            Width = 82
          end
          object cxGrid1DBTableView2Quantidade: TcxGridDBColumn
            Caption = 'Qtde.'
            DataBinding.FieldName = 'Quantidade'
            Options.Editing = False
          end
          object cxGrid1DBTableView2Valor_Total: TcxGridDBColumn
            Caption = 'Valor Total'
            DataBinding.FieldName = 'Valor_Total'
            Options.Editing = False
            Width = 90
          end
          object cxGrid1DBTableView2IVA: TcxGridDBColumn
            DataBinding.FieldName = 'IVA'
            Options.Editing = False
            Width = 53
          end
          object cxGrid1DBTableView2BC_ICMS: TcxGridDBColumn
            Caption = 'BC. ICMS'
            DataBinding.FieldName = 'BC_ICMS'
            Options.Editing = False
          end
          object cxGrid1DBTableView2Valor_ICMS_Unitario: TcxGridDBColumn
            Caption = 'Valor ICMS'
            DataBinding.FieldName = 'Valor_ICMS_Unitario'
            Options.Editing = False
            Width = 88
          end
          object cxGrid1DBTableView2Aliquota_ICMS: TcxGridDBColumn
            Caption = 'ICMS'
            DataBinding.FieldName = 'Aliquota_ICMS'
            Options.Editing = False
          end
          object cxGrid1DBTableView2Aliquota_IPI: TcxGridDBColumn
            Caption = 'IPI'
            DataBinding.FieldName = 'Aliquota_IPI'
            Options.Editing = False
          end
          object cxGrid1DBTableView2Valor_IPI: TcxGridDBColumn
            Caption = 'Valor IPI'
            DataBinding.FieldName = 'Valor_IPI'
            Options.Editing = False
            Width = 76
          end
          object cxGrid1DBTableView2Quantidade_Volume: TcxGridDBColumn
            Caption = 'Qtde. Volume'
            DataBinding.FieldName = 'Quantidade_Volume'
            Options.Editing = False
            Width = 73
          end
          object cxGrid1DBTableView2Valor_Frete_Unitario: TcxGridDBColumn
            Caption = 'Valor Desp.'
            DataBinding.FieldName = 'Valor_Frete_Unitario'
            Options.Editing = False
            Width = 78
          end
          object cxGrid1DBTableView2Custo_Unitario: TcxGridDBColumn
            Caption = 'Custo Unit'#225'rio'
            DataBinding.FieldName = 'Custo_Unitario'
            Options.Editing = False
            Width = 80
          end
          object cxGrid1DBTableView2Percentual_Lucro_Vista: TcxGridDBColumn
            Caption = '% Lucro Vista'
            DataBinding.FieldName = 'Percentual_Lucro_Vista'
            Options.Editing = False
            Width = 77
          end
          object cxGrid1DBTableView2Valor_Vista: TcxGridDBColumn
            Caption = 'Valor Vista'
            DataBinding.FieldName = 'Valor_Vista'
            Options.Editing = False
            Width = 83
          end
          object cxGrid1DBTableView2Percentual_Lucro_Prazo: TcxGridDBColumn
            Caption = '% Lucro Prazo'
            DataBinding.FieldName = 'Percentual_Lucro_Prazo'
            Options.Editing = False
            Width = 84
          end
          object cxGrid1DBTableView2Valor_Prazo: TcxGridDBColumn
            Caption = 'Valor Prazo'
            DataBinding.FieldName = 'Valor_Prazo'
            Options.Editing = False
            Width = 86
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
          Options.DetailTabsPosition = dtpTop
          object cxGrid1Level2: TcxGridLevel
            Caption = 'Itens de Entrada'
            GridView = cxGrid1DBTableView2
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Sint'#233'tico 1'
      ImageIndex = 2
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 825
        Height = 25
        BorderStyle = bsSingle
        Caption = 'Entrada(s)'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object DBGrid4: TDBGrid
        Left = 0
        Top = 27
        Width = 822
        Height = 148
        BorderStyle = bsNone
        DataSource = DataSource2
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = DBGrid4CellClick
        OnDrawColumnCell = DBGrid4DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'N_Nota_Fiscal'
            Title.Caption = 'Nota Fiscal'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Emissao'
            Title.Caption = 'Data Emiss'#227'o'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Entrada'
            Title.Caption = 'Data Entrada'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome_Fantasia'
            Title.Caption = 'Nome Fantasia'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Custo_Total'
            Title.Caption = 'Custo Total'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total_Produtos'
            Title.Caption = 'Total Produtos'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total_Nota'
            Title.Caption = 'Total Nota'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            Visible = True
          end>
      end
      object Panel5: TPanel
        Left = 0
        Top = 177
        Width = 825
        Height = 25
        BorderStyle = bsSingle
        Caption = 'Item(s) da Entrada'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
      object DBGrid5: TDBGrid
        Left = 0
        Top = 208
        Width = 822
        Height = 184
        BorderStyle = bsNone
        DataSource = DataSource3
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ShowHint = False
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid2DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'N_Item'
            Title.Caption = 'Item'
            Width = 40
            Visible = True
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
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Unidade'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Unitario'
            Title.Caption = 'Valor Unit'#225'rio'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantidade'
            Title.Caption = 'Qtde'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Total'
            Title.Caption = 'Valor Total'
            Width = 71
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Sint'#233'tico 2'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 825
        Height = 25
        BorderStyle = bsSingle
        Caption = 'Entrada(s)'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object DBGrid3: TDBGrid
        Left = 0
        Top = 26
        Width = 822
        Height = 366
        BorderStyle = bsNone
        DataSource = DataSource1
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
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
            FieldName = 'N_Nota_Fiscal'
            Title.Caption = 'Nota Fiscal'
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome_Fantasia'
            Title.Caption = 'Fornecedor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Emissao'
            Title.Caption = 'Emiss'#227'o'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Entrada'
            Title.Caption = 'Entrada'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Custo_Total'
            Title.Caption = 'Custo Total'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total_Produtos'
            Title.Caption = 'Total Produtos'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total_Nota'
            Title.Caption = 'Total Nota'
            Width = 83
            Visible = True
          end>
      end
    end
  end
  object RGTipo: TRadioGroup
    Left = 116
    Top = -3
    Width = 114
    Height = 107
    Caption = 'Tipo Rel.'
    ItemIndex = 0
    Items.Strings = (
      'Anal'#237'tico'
      'Sint'#233'tico 1'
      'Sint'#233'tico 2')
    TabOrder = 11
  end
  object EdtPerc: TEdit
    Left = 736
    Top = 86
    Width = 69
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    TabOrder = 5
  end
  object RGPerc: TRadioGroup
    Left = 811
    Top = 57
    Width = 59
    Height = 47
    Caption = 'Tipo'
    ItemIndex = 0
    Items.Strings = (
      '+'
      '-')
    TabOrder = 6
  end
  object qryconsulta_entrada: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select EP.*, IE.*, Forn.Nome_Fantasia, CFOP.CFOP, CFOP.Descricao' +
        ' from Entrada_Produtos EP'
      'left join Impostos_Entrada IE on (EP.Codigo = IE.Codigo)'
      
        'left join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codigo' +
        ')'
      'left join Cadastro_CFOP CFOP on (EP.Codigo_CFOP = CFOP.Codigo)')
    Left = 322
    Top = 101
    object qryconsulta_entradaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryconsulta_entradaN_Nota_Fiscal: TStringField
      FieldName = 'N_Nota_Fiscal'
    end
    object qryconsulta_entradaModelo: TStringField
      FieldName = 'Modelo'
      Size = 10
    end
    object qryconsulta_entradaSerie: TStringField
      FieldName = 'Serie'
      Size = 10
    end
    object qryconsulta_entradaData_Emissao: TDateTimeField
      FieldName = 'Data_Emissao'
    end
    object qryconsulta_entradaHora_Emissao: TStringField
      FieldName = 'Hora_Emissao'
      Size = 10
    end
    object qryconsulta_entradaData_Entrada: TDateTimeField
      FieldName = 'Data_Entrada'
    end
    object qryconsulta_entradaHora_Entrada: TStringField
      FieldName = 'Hora_Entrada'
      Size = 10
    end
    object qryconsulta_entradaTipo_Frete: TStringField
      FieldName = 'Tipo_Frete'
    end
    object qryconsulta_entradaTipo_Pagamento: TStringField
      FieldName = 'Tipo_Pagamento'
    end
    object qryconsulta_entradaCodigo_Fornecedor: TIntegerField
      FieldName = 'Codigo_Fornecedor'
    end
    object qryconsulta_entradaCodigo_CFOP: TIntegerField
      FieldName = 'Codigo_CFOP'
    end
    object qryconsulta_entradaCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qryconsulta_entradaQuantidade_Itens: TIntegerField
      FieldName = 'Quantidade_Itens'
    end
    object qryconsulta_entradaObservacao: TStringField
      FieldName = 'Observacao'
      Size = 300
    end
    object qryconsulta_entradaStatus: TStringField
      FieldName = 'Status'
    end
    object qryconsulta_entradaCodigo_Funcionario: TIntegerField
      FieldName = 'Codigo_Funcionario'
    end
    object qryconsulta_entradaChave_NFe_Entrada: TStringField
      FieldName = 'Chave_NFe_Entrada'
      Size = 50
    end
    object qryconsulta_entradaCaixa_ECF: TIntegerField
      FieldName = 'Caixa_ECF'
    end
    object qryconsulta_entradaFinalizada: TIntegerField
      FieldName = 'Finalizada'
    end
    object qryconsulta_entradaCodigo_1: TIntegerField
      FieldName = 'Codigo_1'
    end
    object qryconsulta_entradaN_Nota_Fiscal_1: TStringField
      FieldName = 'N_Nota_Fiscal_1'
    end
    object qryconsulta_entradaTotal_Produtos: TFloatField
      FieldName = 'Total_Produtos'
    end
    object qryconsulta_entradaBase_ICMS: TFloatField
      FieldName = 'Base_ICMS'
    end
    object qryconsulta_entradaValor_ICMS: TFloatField
      FieldName = 'Valor_ICMS'
    end
    object qryconsulta_entradaIsento_ICMS: TFloatField
      FieldName = 'Isento_ICMS'
    end
    object qryconsulta_entradaOutros_ICMS: TFloatField
      FieldName = 'Outros_ICMS'
    end
    object qryconsulta_entradaBase_ICMS_Subs: TFloatField
      FieldName = 'Base_ICMS_Subs'
    end
    object qryconsulta_entradaValor_ICMS_Subs: TFloatField
      FieldName = 'Valor_ICMS_Subs'
    end
    object qryconsulta_entradaAliquota: TFloatField
      FieldName = 'Aliquota'
    end
    object qryconsulta_entradaValor_Frete: TFloatField
      FieldName = 'Valor_Frete'
    end
    object qryconsulta_entradaValor_Seguro: TFloatField
      FieldName = 'Valor_Seguro'
    end
    object qryconsulta_entradaOutras_Despesas: TFloatField
      FieldName = 'Outras_Despesas'
    end
    object qryconsulta_entradaTotal_IPI: TFloatField
      FieldName = 'Total_IPI'
    end
    object qryconsulta_entradaIsento_IPI: TFloatField
      FieldName = 'Isento_IPI'
    end
    object qryconsulta_entradaOutros_IPI: TFloatField
      FieldName = 'Outros_IPI'
    end
    object qryconsulta_entradaDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object qryconsulta_entradaTotal_Nota: TFloatField
      FieldName = 'Total_Nota'
    end
    object qryconsulta_entradaCusto_Total: TFloatField
      FieldName = 'Custo_Total'
    end
    object qryconsulta_entradaNome_Fantasia: TStringField
      FieldName = 'Nome_Fantasia'
      Size = 50
    end
    object qryconsulta_entradaCFOP: TStringField
      FieldName = 'CFOP'
      Size = 10
    end
    object qryconsulta_entradaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 500
    end
  end
  object ds_consulta_entrada: TDataSource
    DataSet = qryconsulta_entrada
    Left = 354
    Top = 101
  end
  object qryitens_entrada: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select IEE.*, P.Codigo_Venda, P.Descricao from Itens_Entrada IEE'
      'left join Produto P on (IEE.Codigo_Produto = P.Codigo)'
      'order by IEE.Codigo, IEE.N_Item')
    Left = 399
    Top = 103
    object qryitens_entradaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryitens_entradaN_Item: TStringField
      FieldName = 'N_Item'
      Size = 3
    end
    object qryitens_entradaN_Nota_Fiscal: TStringField
      FieldName = 'N_Nota_Fiscal'
    end
    object qryitens_entradaCodigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object qryitens_entradaUnidade: TStringField
      FieldName = 'Unidade'
      Size = 5
    end
    object qryitens_entradaST: TStringField
      FieldName = 'ST'
      Size = 5
    end
    object qryitens_entradaValor_Ultima_Compra: TFloatField
      FieldName = 'Valor_Ultima_Compra'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_entradaValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_entradaQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object qryitens_entradaValor_Total: TFloatField
      FieldName = 'Valor_Total'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_entradaAliquota_ICMS: TStringField
      FieldName = 'Aliquota_ICMS'
      Size = 5
    end
    object qryitens_entradaAliquota_IPI: TStringField
      FieldName = 'Aliquota_IPI'
      Size = 5
    end
    object qryitens_entradaCFOP: TStringField
      FieldName = 'CFOP'
    end
    object qryitens_entradaValor_IPI: TFloatField
      FieldName = 'Valor_IPI'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_entradaNCM: TStringField
      FieldName = 'NCM'
    end
    object qryitens_entradaQuantidade_Volume: TFloatField
      FieldName = 'Quantidade_Volume'
    end
    object qryitens_entradaValor_Frete_Unitario: TFloatField
      FieldName = 'Valor_Frete_Unitario'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_entradaPercentual_Lucro_Vista: TFloatField
      FieldName = 'Percentual_Lucro_Vista'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_entradaValor_Vista: TFloatField
      FieldName = 'Valor_Vista'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_entradaPercentual_Lucro_Prazo: TFloatField
      FieldName = 'Percentual_Lucro_Prazo'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_entradaValor_Prazo: TFloatField
      FieldName = 'Valor_Prazo'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_entradaCusto_Unitario: TFloatField
      FieldName = 'Custo_Unitario'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_entradaBC_ICMS: TFloatField
      FieldName = 'BC_ICMS'
    end
    object qryitens_entradaIVA: TFloatField
      FieldName = 'IVA'
    end
    object qryitens_entradaValor_ICMS_Unitario: TFloatField
      FieldName = 'Valor_ICMS_Unitario'
    end
    object qryitens_entradaCodigo_Produto_Fornecedor: TStringField
      FieldName = 'Codigo_Produto_Fornecedor'
    end
    object qryitens_entradaDescricao_Produto: TStringField
      FieldName = 'Descricao_Produto'
      Size = 300
    end
    object qryitens_entradaCodigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ReadOnly = True
    end
    object qryitens_entradaQuantidade_Restante: TFloatField
      FieldName = 'Quantidade_Restante'
    end
    object qryitens_entradaValor_Vista_Ultimo: TFloatField
      FieldName = 'Valor_Vista_Ultimo'
    end
    object qryitens_entradaValor_Prazo_Ultimo: TFloatField
      FieldName = 'Valor_Prazo_Ultimo'
    end
    object qryitens_entradaBC_ICMS_ST: TFloatField
      FieldName = 'BC_ICMS_ST'
    end
    object qryitens_entradaValor_ICMS_ST: TFloatField
      FieldName = 'Valor_ICMS_ST'
    end
    object qryitens_entradaChecado: TStringField
      FieldName = 'Checado'
      Size = 1
    end
    object qryitens_entradaValor_Ultima_Compra_Unitario: TFloatField
      FieldName = 'Valor_Ultima_Compra_Unitario'
    end
    object qryitens_entradaQtde_Estoque_Atual: TFloatField
      FieldName = 'Qtde_Estoque_Atual'
    end
    object qryitens_entradaFicha_Estoque_Codigo: TIntegerField
      FieldName = 'Ficha_Estoque_Codigo'
    end
    object qryitens_entradaData_Validade: TDateTimeField
      FieldName = 'Data_Validade'
    end
    object qryitens_entradaCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qryitens_entradaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 300
    end
  end
  object ds_consulta_itens_entrada: TDataSource
    DataSet = qryitens_entrada
    Left = 431
    Top = 103
  end
  object qryconsulta_entrada_sintetico: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select EP.N_Nota_Fiscal, EP.Data_Emissao, EP.Data_Entrada, IE.To' +
        'tal_Produtos, IE.Custo_Total, Total_Nota,'
      'Forn.Nome_Fantasia from Entrada_Produtos EP'
      
        'inner join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_' +
        'Fiscal)'
      
        'inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codig' +
        'o)')
    Left = 866
    Top = 189
    object qryconsulta_entrada_sinteticoN_Nota_Fiscal: TStringField
      FieldName = 'N_Nota_Fiscal'
    end
    object qryconsulta_entrada_sinteticoData_Emissao: TDateTimeField
      FieldName = 'Data_Emissao'
    end
    object qryconsulta_entrada_sinteticoData_Entrada: TDateTimeField
      FieldName = 'Data_Entrada'
    end
    object qryconsulta_entrada_sinteticoTotal_Produtos: TFloatField
      FieldName = 'Total_Produtos'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_entrada_sinteticoTotal_Nota: TFloatField
      FieldName = 'Total_Nota'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_entrada_sinteticoNome_Fantasia: TStringField
      FieldName = 'Nome_Fantasia'
      Size = 50
    end
    object qryconsulta_entrada_sinteticoCusto_Total: TFloatField
      FieldName = 'Custo_Total'
      DisplayFormat = '#0.0,0'
    end
  end
  object DataSource1: TDataSource
    DataSet = qryconsulta_entrada_sintetico
    Left = 913
    Top = 192
  end
  object qryconsulta_entrada_sintetico_1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select EP.N_Nota_Fiscal, EP.Data_Emissao, EP.Data_Entrada, Forn.' +
        'Nome_Fantasia,'
      
        'IE.Total_Produtos, IE.Total_Nota, IE.Custo_Total  from Entrada_P' +
        'rodutos EP'
      
        'inner join Impostos_Entrada IE on (EP.N_Nota_Fiscal = IE.N_Nota_' +
        'Fiscal)'
      
        'inner join Fornecedor Forn on (EP.Codigo_Fornecedor = Forn.Codig' +
        'o)')
    Left = 458
    Top = 213
    object qryconsulta_entrada_sintetico_1N_Nota_Fiscal: TStringField
      FieldName = 'N_Nota_Fiscal'
    end
    object qryconsulta_entrada_sintetico_1Data_Emissao: TDateTimeField
      FieldName = 'Data_Emissao'
    end
    object qryconsulta_entrada_sintetico_1Data_Entrada: TDateTimeField
      FieldName = 'Data_Entrada'
    end
    object qryconsulta_entrada_sintetico_1Nome_Fantasia: TStringField
      FieldName = 'Nome_Fantasia'
      Size = 50
    end
    object qryconsulta_entrada_sintetico_1Total_Produtos: TFloatField
      FieldName = 'Total_Produtos'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_entrada_sintetico_1Total_Nota: TFloatField
      FieldName = 'Total_Nota'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_entrada_sintetico_1Custo_Total: TFloatField
      FieldName = 'Custo_Total'
      DisplayFormat = '#0.0,0'
    end
  end
  object DataSource2: TDataSource
    DataSet = qryconsulta_entrada_sintetico_1
    Left = 498
    Top = 213
  end
  object qryitens_entrada_sintetico: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'N_Nota_Fiscal'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      
        'select IE.N_Item, IE.Unidade, IE.Valor_Unitario, IE.Quantidade, ' +
        'IE.Valor_Total, '
      'P.Codigo_Venda, P.Descricao from Itens_Entrada IE'
      'inner join Produto P on(IE.Codigo_Produto = P.Codigo)'
      'where IE.N_Nota_Fiscal = :N_Nota_Fiscal')
    Left = 711
    Top = 119
    object qryitens_entrada_sinteticoN_Item: TStringField
      FieldName = 'N_Item'
      Size = 3
    end
    object qryitens_entrada_sinteticoUnidade: TStringField
      FieldName = 'Unidade'
      Size = 5
    end
    object qryitens_entrada_sinteticoValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_entrada_sinteticoQuantidade: TFloatField
      FieldName = 'Quantidade'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_entrada_sinteticoValor_Total: TFloatField
      FieldName = 'Valor_Total'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_entrada_sinteticoCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qryitens_entrada_sinteticoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
  end
  object DataSource3: TDataSource
    DataSet = qryitens_entrada_sintetico
    Left = 743
    Top = 119
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = dxComponentPrinter1Link1
    PreviewOptions.Caption = 'Visualiza'#231#227'o de relat'#243'rio'
    PreviewOptions.WindowState = wsMaximized
    PrintTitle = 'Impress'#227'o de relat'#243'rio'
    Version = 0
    Left = 912
    Top = 64
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
      PrinterPage.PageFooter.CenterTitle.Strings = (
        '[Date Printed]')
      PrinterPage.PageFooter.LeftTitle.Strings = (
        'P'#225'gina [Page #] de [Total Pages]')
      PrinterPage.PageFooter.RightTitle.Strings = (
        '[Time Printed]')
      PrinterPage.PageHeader.CenterTitle.Strings = (
        'FAV Sistemas')
      PrinterPage.PageHeader.LeftTitle.Strings = (
        'SAC - Sistema de Acompanhamento Comercial')
      PrinterPage.PageHeader.RightTitle.Strings = (
        '(64)3631-1926 / (64)9958-7272')
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'Novo documento'
      ReportDocument.CreationDate = 42210.495096122690000000
      ReportDocument.Description = 'Teste de novo documento'
      ReportFootnotes.Font.Charset = ANSI_CHARSET
      ReportFootnotes.Font.Color = clBlack
      ReportFootnotes.Font.Height = -16
      ReportFootnotes.Font.Name = 'Tahoma'
      ReportFootnotes.Font.Style = [fsBold]
      ReportFootnotes.Mode = fnmOnLastPage
      ReportFootnotes.Text = 'Fim do Relat'#243'rio'
      ReportTitle.Font.Charset = ANSI_CHARSET
      ReportTitle.Font.Color = clBlack
      ReportTitle.Font.Height = -19
      ReportTitle.Font.Name = 'Tahoma'
      ReportTitle.Font.Style = [fsBold]
      ReportTitle.Text = 'Vendas'
      OptionsOnEveryPage.Footers = False
      OptionsOnEveryPage.FilterBar = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
  end
  object cxPropertiesStore1: TcxPropertiesStore
    Components = <
      item
        Component = cxGrid1DBTableView1CFOP
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Codigo
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Custo_Total
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Data_Emissao
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Data_Entrada
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Hora_Emissao
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Hora_Entrada
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Modelo
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Nome_Fantasia
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1N_Nota_Fiscal
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Observacao
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Quantidade_Itens
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Serie
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Total_Nota
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Total_Produtos
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Aliquota_ICMS
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Aliquota_IPI
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2BC_ICMS
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2CFOP
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Codigo
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Codigo_Produto
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Codigo_Produto_Fornecedor
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Codigo_Venda
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Custo_Unitario
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Descricao
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Descricao_Produto
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2IVA
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2NCM
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2N_Item
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2N_Nota_Fiscal
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Percentual_Lucro_Prazo
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Percentual_Lucro_Vista
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Quantidade
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Quantidade_Volume
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2ST
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Unidade
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Valor_Frete_Unitario
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Valor_ICMS_Unitario
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Valor_IPI
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Valor_Prazo
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Valor_Total
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Valor_Ultima_Compra
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Valor_Unitario
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Valor_Vista
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end>
    StorageName = 'ConfiguraGrid'
    Left = 891
    Top = 64
  end
end
