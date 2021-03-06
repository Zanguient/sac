object FrmConsulta_Contagem_Estoque: TFrmConsulta_Contagem_Estoque
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Contagem de Estoque'
  ClientHeight = 536
  ClientWidth = 953
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
  object PageControl1: TPageControl
    Left = 113
    Top = 0
    Width = 834
    Height = 536
    ActivePage = TabSheet1
    Style = tsFlatButtons
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Contagem'
      ExplicitHeight = 441
      object cxgrd1: TcxGrid
        Left = 0
        Top = 0
        Width = 826
        Height = 505
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object cxgrdbtblvwGrid1DBTableView1: TcxGridDBTableView
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
              Format = '#0.0,0'
              Kind = skSum
              Position = spFooter
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
              FieldName = 'Total_Pedido'
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
          object cxgrdbclmnGrid1DBTableView1Codigo_Venda: TcxGridDBColumn
            Caption = 'C'#243'digo Venda'
            DataBinding.FieldName = 'Codigo_Venda'
            Options.Editing = False
            Width = 106
          end
          object cxgrdbclmnGrid1DBTableView1Descricao: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'Descricao'
            Options.Editing = False
            Width = 237
          end
          object cxgrdbclmnGrid1DBTableView1Estoque: TcxGridDBColumn
            DataBinding.FieldName = 'Estoque'
            Options.Editing = False
            Width = 92
          end
          object cxgrdbclmnGrid1DBTableView1Local: TcxGridDBColumn
            DataBinding.FieldName = 'Local'
            Options.Editing = False
            Width = 166
          end
          object cxgrdbclmnGrid1DBTableView1Marca: TcxGridDBColumn
            DataBinding.FieldName = 'Marca'
            Options.Editing = False
            Width = 146
          end
          object cxgrdbclmnGrid1DBTableView1Grupo: TcxGridDBColumn
            DataBinding.FieldName = 'Grupo'
            Options.Editing = False
            Width = 215
          end
          object cxgrdbclmnGrid1DBTableView1Nome_Fantasia: TcxGridDBColumn
            Caption = 'Fornecedor'
            DataBinding.FieldName = 'Nome_Fantasia'
            Options.Editing = False
            Width = 244
          end
          object cxgrdbclmnGrid1DBTableView1Column1: TcxGridDBColumn
            Caption = 'Contagem'
            Options.Editing = False
            Width = 73
          end
        end
        object cxgrd1TableView1: TcxGridTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          object cxgrd1TableView1Column1: TcxGridColumn
          end
        end
        object cxgrdlvlcxgrd1Level1: TcxGridLevel
          GridView = cxgrdbtblvwGrid1DBTableView1
        end
      end
    end
  end
  object qryconsulta: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select P.Codigo_Venda, P.Descricao, P.Estoque, L.Local,G.Descric' +
        'ao as Grupo, M.Descricao as Marca, F.Nome_Fantasia from Produto ' +
        'P'
      'left join Marca M on (P.Codigo_Marca = M.Codigo)'
      'left join Fornecedor F on (P.Codigo_Fornecedor = F.Codigo)'
      'left join Localidade_Produto L on (P.Codigo_Local = L.Codigo)'
      'left join Grupo_Produto G on (P.Codigo_Grupo = G.Codigo)')
    Left = 469
    Top = 272
    object qryconsultaCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qryconsultaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qryconsultaEstoque: TFloatField
      FieldName = 'Estoque'
      DisplayFormat = '#0.0,0'
    end
    object qryconsultaMarca: TStringField
      FieldName = 'Marca'
      Size = 30
    end
    object qryconsultaNome_Fantasia: TStringField
      FieldName = 'Nome_Fantasia'
      Size = 50
    end
    object strngfldLocal: TStringField
      FieldName = 'Local'
    end
    object strngfldGrupo: TStringField
      FieldName = 'Grupo'
      Size = 300
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta
    Left = 501
    Top = 272
  end
  object qrybalanco: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select P.Codigo_Venda, P.Descricao, P.Estoque, P.Valor_Compra, '
      
        'UM.Sigla as Unidade, sum(P.Estoque * P.Valor_Compra) as Total fr' +
        'om Produto P'
      
        'left join Unidade_Medida UM on(P.Codigo_Unidade_Medida = UM.Codi' +
        'go)'
      
        'group by P.Codigo_Venda, P.Descricao, P.Estoque, P.Valor_Compra,' +
        ' UM.Sigla')
    Left = 685
    Top = 136
    object qrybalancoCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qrybalancoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qrybalancoEstoque: TFloatField
      FieldName = 'Estoque'
      DisplayFormat = '#0.0,0'
    end
    object qrybalancoValor_Compra: TFloatField
      FieldName = 'Valor_Compra'
      DisplayFormat = '#0.0,0'
    end
    object qrybalancoTotal: TFloatField
      FieldName = 'Total'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
    object qrybalancoUnidade: TStringField
      FieldName = 'Unidade'
      Size = 5
    end
  end
  object DataSource1: TDataSource
    DataSet = qrybalanco
    Left = 717
    Top = 136
  end
  object cxPropertiesStore1: TcxPropertiesStore
    Components = <
      item
        Component = cxgrdbclmnGrid1DBTableView1Codigo_Venda
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxgrdbclmnGrid1DBTableView1Descricao
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxgrdbclmnGrid1DBTableView1Estoque
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxgrdbclmnGrid1DBTableView1Grupo
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxgrdbclmnGrid1DBTableView1Local
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxgrdbclmnGrid1DBTableView1Marca
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxgrdbclmnGrid1DBTableView1Nome_Fantasia
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end>
    StorageName = 'ConfiguraGrid'
    Left = 816
    Top = 136
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = dxComponentPrinter1Link1
    PreviewOptions.Caption = 'Visualiza'#231#227'o de relat'#243'rio'
    PreviewOptions.WindowState = wsMaximized
    PrintTitle = 'Impress'#227'o de relat'#243'rio'
    Version = 0
    Left = 856
    Top = 136
    object dxComponentPrinter1Link1: TdxGridReportLink
      Component = cxgrd1
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
      ReportTitle.Text = 'Contagem de Estoque'
      OptionsOnEveryPage.Footers = False
      OptionsOnEveryPage.FilterBar = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
  end
end
