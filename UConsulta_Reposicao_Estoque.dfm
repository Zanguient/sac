object FrmConsulta_Reposicao_Estoque: TFrmConsulta_Reposicao_Estoque
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Reposi'#231#227'o de Estoque'
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
    Left = 351
    Top = 72
    Width = 35
    Height = 13
    Caption = 'Op'#231#227'o'
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
    object BBtnExportar: TToolButton
      Left = 0
      Top = 114
      Cursor = crHandPoint
      Caption = '&Exp. XLS'
      Enabled = False
      ImageIndex = 8
      Wrap = True
      OnClick = BBtnExportarClick
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
  object RGConsulta_Por: TRadioGroup
    Left = 113
    Top = 2
    Width = 120
    Height = 105
    Caption = 'Consulta por'
    ItemIndex = 0
    Items.Strings = (
      'Tudo'
      'Grupo'
      'Marca'
      'Bloq. na Venda')
    TabOrder = 1
    OnClick = RGConsulta_PorClick
  end
  object EdtDescricao: TEdit
    Left = 408
    Top = 89
    Width = 192
    Height = 17
    BevelEdges = [beTop, beRight, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    OnKeyPress = EdtDescricaoKeyPress
  end
  object EdtCodigo: TEdit
    Left = 351
    Top = 89
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
    TabOrder = 3
    OnKeyDown = EdtCodigoKeyDown
    OnKeyPress = EdtCodigoKeyPress
  end
  object RGEstoque_Minimo: TRadioGroup
    Left = 239
    Top = 2
    Width = 105
    Height = 105
    Caption = 'Estoque M'#237'nimo'
    ItemIndex = 0
    Items.Strings = (
      'Tudo'
      'Igual ou abaixo')
    TabOrder = 4
    OnClick = RGEstoque_MinimoClick
  end
  object cxGrid1: TcxGrid
    Left = 113
    Top = 110
    Width = 836
    Height = 426
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
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
          Format = '#0.0,0'
          Kind = skSum
          FieldName = 'Valor_Compra'
          Column = cxGrid1DBTableView1Valor_Compra
        end
        item
          Format = '#0.0,0'
          Kind = skSum
          FieldName = 'Estoque'
          Column = cxGrid1DBTableView1Estoque
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#0.0,0'
          Kind = skSum
          FieldName = 'Valor_Compra'
          Column = cxGrid1DBTableView1Valor_Compra
        end
        item
          Format = '#0.0,0'
          Kind = skSum
          FieldName = 'Estoque'
          Column = cxGrid1DBTableView1Estoque
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
      end
      object cxGrid1DBTableView1Codigo_Venda: TcxGridDBColumn
        Caption = 'C'#243'd. Venda'
        DataBinding.FieldName = 'Codigo_Venda'
      end
      object cxGrid1DBTableView1Codigo_Original: TcxGridDBColumn
        Caption = 'C'#243'd. Original'
        DataBinding.FieldName = 'Codigo_Original'
        Options.Editing = False
      end
      object cxGrid1DBTableView1Codigo_Similar: TcxGridDBColumn
        Caption = 'C'#243'd. Similar'
        DataBinding.FieldName = 'Codigo_Similar'
        Options.Editing = False
      end
      object cxGrid1DBTableView1Descricao: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'Descricao'
        Options.Editing = False
        Width = 258
      end
      object cxGrid1DBTableView1Sigla: TcxGridDBColumn
        Caption = 'Un.'
        DataBinding.FieldName = 'Sigla'
        Options.Editing = False
      end
      object cxGrid1DBTableView1Estoque: TcxGridDBColumn
        DataBinding.FieldName = 'Estoque'
        Options.Editing = False
      end
      object cxGrid1DBTableView1Estoque_Minimo: TcxGridDBColumn
        Caption = 'M'#237'nimo'
        DataBinding.FieldName = 'Estoque_Minimo'
        Options.Editing = False
      end
      object cxGrid1DBTableView1Em_Estoque_Minimo: TcxGridDBColumn
        DataBinding.FieldName = 'Em_Estoque_Minimo'
        Visible = False
        Options.Editing = False
      end
      object cxGrid1DBTableView1Valor_Ultima_Compra: TcxGridDBColumn
        Caption = 'Custo '#218'lt. Compra'
        DataBinding.FieldName = 'Valor_Ultima_Compra'
        Options.Editing = False
        Width = 112
      end
      object cxGrid1DBTableView1Valor_Compra_Unitario: TcxGridDBColumn
        Caption = 'Valor Compra'
        DataBinding.FieldName = 'Valor_Compra_Unitario'
        Options.Editing = False
        Width = 90
      end
      object cxGrid1DBTableView1Valor_Compra: TcxGridDBColumn
        Caption = 'Custo Total'
        DataBinding.FieldName = 'Valor_Compra'
        Options.Editing = False
        Width = 87
      end
      object cxGrid1DBTableView1Ultima_Compra: TcxGridDBColumn
        Caption = #218'lt. Compra'
        DataBinding.FieldName = 'Ultima_Compra'
        Options.Editing = False
        Width = 82
      end
      object cxGrid1DBTableView1Preco_Vista: TcxGridDBColumn
        Caption = 'Pre'#231'o Vista'
        DataBinding.FieldName = 'Preco_Vista'
        Options.Editing = False
        Width = 84
      end
      object cxGrid1DBTableView1Preco_Prazo: TcxGridDBColumn
        Caption = 'Pre'#231'o Prazo'
        DataBinding.FieldName = 'Preco_Prazo'
        Options.Editing = False
        Width = 84
      end
      object cxGrid1DBTableView1Grupo: TcxGridDBColumn
        DataBinding.FieldName = 'Grupo'
        Options.Editing = False
        Width = 150
      end
      object cxGrid1DBTableView1Marca: TcxGridDBColumn
        DataBinding.FieldName = 'Marca'
        Options.Editing = False
        Width = 150
      end
      object cxGrid1DBTableView1Local: TcxGridDBColumn
        DataBinding.FieldName = 'Local'
        Options.Editing = False
        Width = 150
      end
      object cxGrid1DBTableView1Data_Validade: TcxGridDBColumn
        Caption = 'Data de Validade'
        DataBinding.FieldName = 'Data_Validade'
        Options.Editing = False
        Width = 104
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
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object qryconsulta_reposicao: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select P.Data_Validade, P.Codigo, P.Codigo_Original, P.Codigo_Si' +
        'milar, P.Codigo_Venda, P.Descricao, UM.Sigla, P.Estoque, P.Estoq' +
        'ue_Minimo, P.Em_Estoque_Minimo, P.Valor_Ultima_Compra, '
      
        'P.Ultima_Compra, P.Valor_Compra, P.Valor_Compra_Unitario, GP.Des' +
        'cricao as Grupo, M.Descricao as Marca, LP.Local, ITP.Preco_Vista' +
        ', ITP.Preco_Prazo from Produto P'
      
        'left join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Cod' +
        'igo)'
      'left join Grupo_Produto GP on (P.Codigo_Grupo = GP.Codigo)'
      'left join Marca M on (P.Codigo_Marca = M.Codigo)'
      'left join Localidade_Produto LP on (P.Codigo_Local = LP.Codigo)'
      
        'left join Itens_Tabela_Preco ITP on (P.Codigo = ITP.Codigo_Produ' +
        'to)'
      
        'group by P.Data_Validade, P.Codigo, P.Codigo_Original, P.Codigo_' +
        'Similar, P.Codigo_Venda, P.Descricao, UM.Sigla, P.Estoque, P.Est' +
        'oque_Minimo, P.Em_Estoque_Minimo, P.Valor_Ultima_Compra, '
      
        'P.Ultima_Compra, P.Valor_Compra, P.Valor_Compra_Unitario, GP.Des' +
        'cricao, M.Descricao, LP.Local, ITP.Preco_Vista, ITP.Preco_Prazo')
    Left = 469
    Top = 272
    object qryconsulta_reposicaoCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryconsulta_reposicaoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qryconsulta_reposicaoSigla: TStringField
      FieldName = 'Sigla'
      Size = 5
    end
    object qryconsulta_reposicaoEstoque: TFloatField
      FieldName = 'Estoque'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_reposicaoEstoque_Minimo: TFloatField
      FieldName = 'Estoque_Minimo'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_reposicaoEm_Estoque_Minimo: TStringField
      FieldName = 'Em_Estoque_Minimo'
      Size = 30
    end
    object qryconsulta_reposicaoValor_Ultima_Compra: TFloatField
      FieldName = 'Valor_Ultima_Compra'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_reposicaoUltima_Compra: TDateTimeField
      FieldName = 'Ultima_Compra'
      OnGetText = qryconsulta_reposicaoUltima_CompraGetText
    end
    object qryconsulta_reposicaoValor_Compra_Unitario: TFloatField
      FieldName = 'Valor_Compra_Unitario'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_reposicaoGrupo: TStringField
      FieldName = 'Grupo'
      Size = 200
    end
    object qryconsulta_reposicaoMarca: TStringField
      FieldName = 'Marca'
      Size = 30
    end
    object qryconsulta_reposicaoValor_Compra: TFloatField
      FieldName = 'Valor_Compra'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_reposicaoCodigo_Original: TStringField
      FieldName = 'Codigo_Original'
    end
    object qryconsulta_reposicaoCodigo_Similar: TStringField
      FieldName = 'Codigo_Similar'
    end
    object qryconsulta_reposicaoLocal: TStringField
      FieldName = 'Local'
    end
    object qryconsulta_reposicaoPreco_Vista: TFloatField
      FieldName = 'Preco_Vista'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_reposicaoPreco_Prazo: TFloatField
      FieldName = 'Preco_Prazo'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_reposicaoCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qryconsulta_reposicaoData_Validade: TDateTimeField
      FieldName = 'Data_Validade'
      OnGetText = qryconsulta_reposicaoData_ValidadeGetText
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_reposicao
    Left = 501
    Top = 272
  end
  object qrycompra: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select IC.Qtde, IC.Qtde_Recebida, IC.Qtde_Restante, C.Data_Previ' +
        'sao_Entrega,'
      'P.Codigo_Original, P.Descricao from Itens_Compra IC'
      'left join Compra C on (IC.N_Pedido = C.N_Pedido)'
      'left join Produto P on (IC.Codigo_Produto = P.Codigo)')
    Left = 472
    Top = 464
    object qrycompraQtde: TFloatField
      FieldName = 'Qtde'
    end
    object qrycompraQtde_Recebida: TFloatField
      FieldName = 'Qtde_Recebida'
    end
    object qrycompraQtde_Restante: TFloatField
      FieldName = 'Qtde_Restante'
    end
    object qrycompraData_Previsao_Entrega: TDateTimeField
      FieldName = 'Data_Previsao_Entrega'
    end
    object qrycompraCodigo_Original: TStringField
      FieldName = 'Codigo_Original'
    end
    object qrycompraDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = qrycompra
    Left = 504
    Top = 464
  end
  object cxPropertiesStore1: TcxPropertiesStore
    Components = <
      item
        Component = cxGrid1DBTableView1Codigo
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Codigo_Original
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Codigo_Similar
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Codigo_Venda
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
        Component = cxGrid1DBTableView1Em_Estoque_Minimo
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Estoque
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Estoque_Minimo
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Grupo
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Local
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Marca
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Preco_Prazo
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Preco_Vista
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Sigla
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Ultima_Compra
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Valor_Compra
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Valor_Compra_Unitario
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Valor_Ultima_Compra
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end>
    StorageName = 'ConfiguraGrid'
    Left = 824
    Top = 16
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = dxComponentPrinter1Link1
    PreviewOptions.Caption = 'Visualiza'#231#227'o de relat'#243'rio'
    PreviewOptions.WindowState = wsMaximized
    PrintTitle = 'Impress'#227'o de relat'#243'rio'
    Version = 0
    Left = 856
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
      ReportTitle.Text = 'Estoque de Produtos'
      OptionsOnEveryPage.Footers = False
      OptionsOnEveryPage.FilterBar = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
  end
end
