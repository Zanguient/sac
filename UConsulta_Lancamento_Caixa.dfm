object FrmConsulta_Lancamento_Caixa: TFrmConsulta_Lancamento_Caixa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Lan'#231'amentos no Caixa'
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
    Left = 495
    Top = 8
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
    Left = 431
    Top = 8
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
    Left = 114
    Top = 6
    Width = 43
    Height = 13
    Caption = 'Usu'#225'rio'
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
    TabOrder = 4
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
    Left = 495
    Top = 23
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
    TabOrder = 3
    Text = '  /  /    '
    OnExit = MEdtData_FinalExit
  end
  object MEdtData_Inicial: TMaskEdit
    Left = 431
    Top = 23
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
  object EdtUsuario: TEdit
    Left = 163
    Top = 23
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
    OnKeyPress = EdtUsuarioKeyPress
  end
  object EdtCodigo_Usuario: TEdit
    Left = 114
    Top = 23
    Width = 50
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
    OnKeyDown = EdtCodigo_UsuarioKeyDown
    OnKeyPress = EdtCodigo_UsuarioKeyPress
  end
  object cxGrid1: TcxGrid
    Left = 114
    Top = 40
    Width = 834
    Height = 496
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
          FieldName = 'Valor'
          DisplayText = 'Total'
        end>
      DataController.Summary.FooterSummaryItems = <>
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
      object cxGrid1DBTableView1Codigo_Registro: TcxGridDBColumn
        Caption = 'C'#243'd.'
        DataBinding.FieldName = 'Codigo_Registro'
        Options.Editing = False
        Width = 51
      end
      object cxGrid1DBTableView1Usuario: TcxGridDBColumn
        Caption = 'Usu'#225'rio'
        DataBinding.FieldName = 'Usuario'
        Options.Editing = False
        Width = 170
      end
      object cxGrid1DBTableView1N_Documento: TcxGridDBColumn
        Caption = 'Documento'
        DataBinding.FieldName = 'N_Documento'
        Options.Editing = False
        Width = 76
      end
      object cxGrid1DBTableView1Data: TcxGridDBColumn
        Caption = 'Data Movimento'
        DataBinding.FieldName = 'Data'
        Options.Editing = False
        Width = 105
      end
      object cxGrid1DBTableView1Forma_Pagamento: TcxGridDBColumn
        Caption = 'Cond. Pag.'
        DataBinding.FieldName = 'Forma_Pagamento'
        Options.Editing = False
        Width = 158
      end
      object cxGrid1DBTableView1Tipo_Documento: TcxGridDBColumn
        Caption = 'Tipo Conta'
        DataBinding.FieldName = 'Tipo_Documento'
        Options.Editing = False
      end
      object cxGrid1DBTableView1Status: TcxGridDBColumn
        DataBinding.FieldName = 'Status'
        Options.Editing = False
        Width = 78
      end
      object cxGrid1DBTableView1Descricao: TcxGridDBColumn
        Caption = 'Hist'#243'rico'
        DataBinding.FieldName = 'Descricao'
        Options.Editing = False
        Width = 287
      end
      object cxGrid1DBTableView1Saldo_Anterior: TcxGridDBColumn
        Caption = 'Saldo Anterior'
        DataBinding.FieldName = 'Saldo_Anterior'
        Options.Editing = False
        Width = 93
      end
      object cxGrid1DBTableView1Valor: TcxGridDBColumn
        Caption = 'Valor Opera'#231#227'o'
        DataBinding.FieldName = 'Valor'
        Options.Editing = False
        Width = 94
      end
      object cxGrid1DBTableView1Saldo_Atual: TcxGridDBColumn
        Caption = 'Saldo Atual'
        DataBinding.FieldName = 'Saldo_Atual'
        Options.Editing = False
        Width = 82
      end
      object cxGrid1DBTableView1Tipo: TcxGridDBColumn
        Caption = '+/-'
        DataBinding.FieldName = 'Tipo'
        Options.Editing = False
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
  object qryconsulta_lancamento: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select FV.*, CU.Nome as Usuario from Fechamento_Venda FV'
      'left join Cadastro_Usuario CU on (FV.Codigo_Usuario = CU.Codigo)')
    Left = 460
    Top = 272
    object qryconsulta_lancamentoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryconsulta_lancamentoCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qryconsulta_lancamentoCodigo_Caixa: TIntegerField
      FieldName = 'Codigo_Caixa'
    end
    object qryconsulta_lancamentoCodigo_Usuario: TIntegerField
      FieldName = 'Codigo_Usuario'
    end
    object qryconsulta_lancamentoForma_Pagamento: TStringField
      FieldName = 'Forma_Pagamento'
      Size = 50
    end
    object qryconsulta_lancamentoValor: TFloatField
      FieldName = 'Valor'
      currency = True
    end
    object qryconsulta_lancamentoTroco: TFloatField
      FieldName = 'Troco'
    end
    object qryconsulta_lancamentoData: TDateTimeField
      FieldName = 'Data'
    end
    object qryconsulta_lancamentoTipo_Documento: TStringField
      FieldName = 'Tipo_Documento'
      Size = 15
    end
    object qryconsulta_lancamentoStatus: TStringField
      FieldName = 'Status'
      Size = 15
    end
    object qryconsulta_lancamentoAcerto: TIntegerField
      FieldName = 'Acerto'
    end
    object qryconsulta_lancamentoTipo: TStringField
      FieldName = 'Tipo'
      Size = 5
    end
    object qryconsulta_lancamentoMovimenta: TIntegerField
      FieldName = 'Movimenta'
    end
    object qryconsulta_lancamentoN_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object qryconsulta_lancamentoParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object qryconsulta_lancamentoCodigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ReadOnly = True
    end
    object qryconsulta_lancamentoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object qryconsulta_lancamentoTransferencia: TIntegerField
      FieldName = 'Transferencia'
    end
    object qryconsulta_lancamentoCodigo_Conta: TIntegerField
      FieldName = 'Codigo_Conta'
    end
    object qryconsulta_lancamentoCodigo_Operacao: TIntegerField
      FieldName = 'Codigo_Operacao'
    end
    object qryconsulta_lancamentoCodigo_Lancamento_Banco: TIntegerField
      FieldName = 'Codigo_Lancamento_Banco'
    end
    object qryconsulta_lancamentoSaldo_Anterior: TFloatField
      FieldName = 'Saldo_Anterior'
      currency = True
    end
    object qryconsulta_lancamentoSaldo_Atual: TFloatField
      FieldName = 'Saldo_Atual'
      currency = True
    end
    object qryconsulta_lancamentoUsuario: TStringField
      FieldName = 'Usuario'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_lancamento
    Left = 492
    Top = 272
  end
  object cxPropertiesStore1: TcxPropertiesStore
    Components = <
      item
        Component = cxGrid1DBTableView1Codigo_Registro
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Data
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
        Component = cxGrid1DBTableView1Forma_Pagamento
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1N_Documento
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Saldo_Anterior
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Saldo_Atual
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Status
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Tipo
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Tipo_Documento
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Usuario
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Valor
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
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
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
      ReportTitle.Text = 'Lan'#231'amentos Financeiros'
      BuiltInReportLink = True
    end
  end
end
