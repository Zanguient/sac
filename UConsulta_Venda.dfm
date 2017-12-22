object FrmConsulta_Venda: TFrmConsulta_Venda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Vendas'
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
    object BBtnExporta_XLS: TToolButton
      Left = 0
      Top = 114
      Cursor = crHandPoint
      Caption = '&Exp. XLS'
      Enabled = False
      ImageIndex = 8
      Wrap = True
      OnClick = BBtnExporta_XLSClick
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
  object PageControl1: TPageControl
    Left = 102
    Top = 0
    Width = 850
    Height = 536
    Cursor = crHandPoint
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Filtro'
      object LblEscolha: TLabel
        Left = 0
        Top = 120
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
        Left = 0
        Top = 162
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
        Left = 60
        Top = 162
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
        Left = 127
        Top = 162
        Width = 88
        Height = 13
        Caption = 'Pr'#233'-Venda/DAV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RGConsulta_Por: TRadioGroup
        Left = 120
        Top = 0
        Width = 145
        Height = 107
        Caption = 'Consulta por:'
        ItemIndex = 0
        Items.Strings = (
          'Tudo'
          'N'#250'mero DAV'
          'N'#250'mero Pr'#233'-Venda'
          'Cliente'
          'Vendedor'
          'Tabela')
        TabOrder = 5
        OnClick = RGConsulta_PorClick
      end
      object EdtConsulta: TEdit
        Left = 57
        Top = 137
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
        Left = 271
        Top = 0
        Width = 114
        Height = 107
        Caption = 'Ordenar Pesquisa:'
        ItemIndex = 0
        Items.Strings = (
          'DAV'
          'Data Venda'
          'Cliente'
          'Funcion'#225'rio')
        TabOrder = 6
      end
      object EdtCodigo: TEdit
        Left = 0
        Top = 137
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
        OnKeyDown = EdtCodigoKeyDown
        OnKeyPress = EdtCodigoKeyPress
      end
      object MEdtData_Inicial: TMaskEdit
        Left = 0
        Top = 177
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
        Left = 60
        Top = 177
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
        Left = 391
        Top = 0
        Width = 90
        Height = 107
        Caption = 'Status'
        ItemIndex = 0
        Items.Strings = (
          'Pago'
          'Pendente')
        TabOrder = 7
      end
      object EdtPedido: TEdit
        Left = 127
        Top = 177
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
        OnKeyDown = EdtCodigoKeyDown
      end
      object RGTipo_Relatorio: TRadioGroup
        Left = 0
        Top = 0
        Width = 114
        Height = 107
        Caption = 'Tipo Relat'#243'rio'
        ItemIndex = 0
        Items.Strings = (
          'Anal'#237'tico'
          'Sint'#233'tico'
          'Lucratividade'
          'Dados Fiscais'
          'Dados Agrupados')
        TabOrder = 8
        OnClick = RGTipo_RelatorioClick
      end
      object GBLucratividade: TGroupBox
        Left = 487
        Top = 0
        Width = 114
        Height = 107
        Caption = 'Lucratividade'
        Enabled = False
        TabOrder = 9
        object CBGeral: TCheckBox
          Left = 16
          Top = 17
          Width = 77
          Height = 17
          Caption = 'Geral'
          TabOrder = 0
        end
        object CBVendedor: TCheckBox
          Left = 16
          Top = 34
          Width = 77
          Height = 17
          Caption = 'Vendedor'
          TabOrder = 1
        end
        object CBCliente: TCheckBox
          Left = 16
          Top = 51
          Width = 77
          Height = 17
          Caption = 'Cliente'
          TabOrder = 2
        end
        object CBGrupo: TCheckBox
          Left = 16
          Top = 69
          Width = 77
          Height = 17
          Caption = 'Grupo'
          TabOrder = 3
        end
      end
      object RGOpcao_Impressao: TRadioGroup
        Left = 607
        Top = 0
        Width = 90
        Height = 107
        Caption = 'Impress'#227'o Sint.'
        ItemIndex = 0
        Items.Strings = (
          'Por Cliente'
          'Por Data')
        TabOrder = 10
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Anal'#237'tico'
      ImageIndex = 2
      object Panel3: TPanel
        Left = 835
        Top = 3
        Width = 817
        Height = 25
        BorderStyle = bsSingle
        Caption = 'Venda(s)'
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
        Left = 826
        Top = 24
        Width = 817
        Height = 215
        BorderStyle = bsNone
        DataSource = DataSource4
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
        OnCellClick = DBGrid3CellClick
        OnDrawColumnCell = DBGrid3DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'N_Pedido'
            Title.Caption = 'DAV'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome_Nome_Fantasia'
            Title.Caption = 'Cliente'
            Width = 204
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cond_Pag'
            Title.Caption = 'Cond. Pag.'
            Width = 121
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Title.Caption = 'Vendedor'
            Width = 169
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Venda'
            Title.Caption = 'Venda'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Qtde_Itens'
            Title.Caption = 'Qtde. Itens'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Qtde_Servicos'
            Visible = False
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Total_Pedido'
            Title.Caption = 'Total Pedido'
            Width = 87
            Visible = True
          end>
      end
      object Panel4: TPanel
        Left = 835
        Top = 249
        Width = 817
        Height = 25
        BorderStyle = bsSingle
        Caption = 'Item(s) da Venda'
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
      object DBGrid4: TDBGrid
        Left = 826
        Top = 280
        Width = 817
        Height = 222
        BorderStyle = bsNone
        DataSource = ds_consulta_itens_folha
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
        OnDrawColumnCell = DBGrid4DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'N_Item'
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
            Title.Caption = 'Codigo Venda'
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Title.Caption = 'Descri'#231#227'o'
            Width = 260
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UN'
            Title.Caption = 'Un.'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Qtde'
            Title.Caption = 'Qtde.'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Valor_Unitario'
            Title.Caption = 'Valor Unit'#225'rio'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Compra'
            Title.Caption = 'Custo Unit'#225'rio'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Compra_Nota'
            Title.Caption = 'Valor Compra Nota'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Sub_Total'
            Title.Caption = 'Valor Total'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cancelado'
            Visible = True
          end>
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 842
        Height = 505
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
          DataController.DataSource = DataSource4
          DataController.Filter.Active = True
          DataController.KeyFieldNames = 'Codigo'
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = '#0.0,0'
              Kind = skSum
              Position = spFooter
              Column = cxGrid1DBTableView1Total_Pedido
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
              FieldName = 'Total_Pedido'
              Column = cxGrid1DBTableView1Total_Pedido
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
          object cxGrid1DBTableView1N_Pedido: TcxGridDBColumn
            Caption = 'N'#186' Pedido'
            DataBinding.FieldName = 'N_Pedido'
            Options.Editing = False
          end
          object cxGrid1DBTableView1Data_Venda: TcxGridDBColumn
            Caption = 'Data Venda'
            DataBinding.FieldName = 'Data_Venda'
            Options.Editing = False
            Width = 84
          end
          object cxGrid1DBTableView1Data_Emissao_NFe: TcxGridDBColumn
            Caption = 'Data Emiss'#227'o NFe'
            DataBinding.FieldName = 'Data_Emissao_NFe'
            Options.Editing = False
          end
          object cxGrid1DBTableView1Total_Pedido: TcxGridDBColumn
            Caption = 'Total Pedido'
            DataBinding.FieldName = 'Total_Pedido'
            Options.Editing = False
            Width = 84
          end
          object cxGrid1DBTableView1Nome_Nome_Fantasia: TcxGridDBColumn
            Caption = 'Cliente'
            DataBinding.FieldName = 'Nome_Nome_Fantasia'
            Options.Editing = False
            Width = 164
          end
          object cxGrid1DBTableView1Funcionario: TcxGridDBColumn
            Caption = 'Funcion'#225'rio'
            DataBinding.FieldName = 'Funcionario'
            Options.Editing = False
            Width = 197
          end
          object cxGrid1DBTableView1Cond_Pag: TcxGridDBColumn
            Caption = 'Cond. Pag.'
            DataBinding.FieldName = 'Cond_Pag'
            Options.Editing = False
            Width = 141
          end
          object cxGrid1DBTableView1CFOP: TcxGridDBColumn
            DataBinding.FieldName = 'CFOP'
            Options.Editing = False
            Width = 48
          end
          object cxGrid1DBTableView1Status: TcxGridDBColumn
            DataBinding.FieldName = 'Status'
            Options.Editing = False
            Width = 85
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
          DataController.DataSource = ds_consulta_itens_folha
          DataController.DetailKeyFieldNames = 'Codigo'
          DataController.KeyFieldNames = 'Codigo_Registro'
          DataController.MasterKeyFieldNames = 'Codigo'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
              FieldName = 'Sub_Total'
              Column = cxGrid1DBTableView2Sub_Total
            end
            item
              Kind = skSum
              FieldName = 'Valor_ICMS_ST'
              Column = cxGrid1DBTableView2Valor_ICMS_ST
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsCustomize.DataRowSizing = True
          OptionsView.Footer = True
          OptionsView.GroupFooterMultiSummaries = True
          OptionsView.GroupFooters = gfAlwaysVisible
          OptionsView.GroupSummaryLayout = gslAlignWithColumns
          OptionsView.Indicator = True
          object cxGrid1DBTableView2Codigo: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'Codigo'
            Options.Editing = False
          end
          object cxGrid1DBTableView2Codigo_Produto: TcxGridDBColumn
            Caption = 'C'#243'digo Sistema'
            DataBinding.FieldName = 'Codigo_Produto'
            Options.Editing = False
            Width = 80
          end
          object cxGrid1DBTableView2Codigo_Venda: TcxGridDBColumn
            Caption = 'C'#243'digo Venda'
            DataBinding.FieldName = 'Codigo_Venda'
            Options.Editing = False
          end
          object cxGrid1DBTableView2Descricao: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'Descricao'
            Options.Editing = False
            Width = 312
          end
          object cxGrid1DBTableView2UN: TcxGridDBColumn
            Caption = 'Un.'
            DataBinding.FieldName = 'UN'
            Options.Editing = False
          end
          object cxGrid1DBTableView2Qtde: TcxGridDBColumn
            Caption = 'Qtde.'
            DataBinding.FieldName = 'Qtde'
            Options.Editing = False
          end
          object cxGrid1DBTableView2Valor_Original: TcxGridDBColumn
            Caption = 'Valor Tabela'
            DataBinding.FieldName = 'Valor_Original'
            Options.Editing = False
            Width = 100
          end
          object cxGrid1DBTableView2Desc_Acr: TcxGridDBColumn
            Caption = 'Desconto'
            DataBinding.FieldName = 'Desc_Acr'
            Options.Editing = False
            Width = 100
          end
          object cxGrid1DBTableView2Valor_Unitario: TcxGridDBColumn
            Caption = 'Valor Unit'#225'rio'
            DataBinding.FieldName = 'Valor_Unitario'
            Options.Editing = False
            Width = 100
          end
          object cxGrid1DBTableView2Valor_Compra: TcxGridDBColumn
            Caption = 'Custo'
            DataBinding.FieldName = 'Valor_Compra'
            Visible = False
            Options.Editing = False
            Width = 100
          end
          object cxGrid1DBTableView2Sub_Total: TcxGridDBColumn
            Caption = 'Sub Total'
            DataBinding.FieldName = 'Sub_Total'
            Options.Editing = False
            Width = 100
          end
          object cxGrid1DBTableView2Valor_ICMS_ST: TcxGridDBColumn
            Caption = 'Valor Imposto S.T.'
            DataBinding.FieldName = 'Valor_ICMS_ST'
            Options.Editing = False
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
          object cxGrid1Level2: TcxGridLevel
            GridView = cxGrid1DBTableView2
          end
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Vendas por Produto'
      ImageIndex = 3
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 817
        Height = 25
        BorderStyle = bsSingle
        Caption = 'Venda(s)'
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
      object DBGrid5: TDBGrid
        Left = 0
        Top = 30
        Width = 817
        Height = 464
        BorderStyle = bsNone
        DataSource = DataSource3
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
        OnDrawColumnCell = DBGrid5DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Data_Venda'
            Title.Caption = 'Data'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Codigo_Venda'
            Title.Caption = 'Codigo Venda'
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Title.Caption = 'Descri'#231#227'o'
            Width = 246
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UN'
            Title.Caption = 'UN.'
            Width = 41
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Qtde'
            Title.Caption = 'Qtde. Total'
            Width = 74
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Valor_Total'
            Title.Caption = 'Valor Total'
            Width = 82
            Visible = True
          end>
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Lucros'
      ImageIndex = 4
      object PageControl2: TPageControl
        Left = 3
        Top = 0
        Width = 839
        Height = 505
        Cursor = crHandPoint
        ActivePage = TabSheet9
        Style = tsFlatButtons
        TabOrder = 0
        object TabSheet2: TTabSheet
          Caption = 'Geral'
          object DBGrid6: TDBGrid
            Left = 0
            Top = 0
            Width = 545
            Height = 474
            DataSource = DataSource1
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
            OnDrawColumnCell = DBGrid5DrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'Mes'
                Title.Caption = 'M'#234's/Ano'
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Custo_Total'
                Title.Caption = 'Custo Total'
                Width = 90
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Venda_Total'
                Title.Caption = 'Valor Venda'
                Width = 90
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Percentual'
                Title.Caption = '%'
                Width = 70
                Visible = True
              end>
          end
          object BitBtn4: TBitBtn
            Left = 560
            Top = 0
            Width = 75
            Height = 25
            Caption = 'Imprimir'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E6E6DCCFCED5C4C6B4AF
              B1E2E4E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DCDBDBB5B5B4BB
              BABAD3C8C5E1C9B8E3E3B2A9CD93A390848A7274C8C4C6FFFFFFFFFFFFFFFFFF
              F3F3F3D9D8D8D1D0D0D8D7D7B0B0AF8C7872DEAD94E6C8B45CAE6F41BF5C80D4
              84CECAA9BCA59DEDEAE9FFFEFEDDDDDCCFCECDE2E1E1F5F4F4F1F0F0CACACAAD
              8E827F63582A67932890D97BAB967DC462E3E8BCFFEBDFF6F2EFF0EFEFDDDCDB
              F7F7F7F5F4F4ECEAEBE7E6E5D9D8D8C1BAB79C8D895C5F6A79717AD4A993ECC2
              B0F5E5E0FEFDFDFFFFFFECECEBE4E3E2F0EFEFE8E6E6E1E0DFE3E1E1DEDEDED2
              D8DACDD1D2C2B3ACAF8A7B7E605B8A8382E9ECEDFFFFFFFFFFFFEDEDECDCDADA
              E6E5E4DDDBDADCDBDAEBEEEDDDD3D1C9917ECDB9B1D2DADDC6C9CAABA4A49D9C
              9BE7E6E6FFFFFFFFFFFFF5F5F5D5D3D2DFDDDCE0DEDDECECF2E8EAF4EEB5A0DE
              643AC65A34C58C78D1CBC9D2D7D6B3B1B0E5E4E4FFFFFFFFFFFFFFFFFFC8C7C6
              CACACAE5EAE6E7ECE8EBCCC5FEB48DFCA17CF0845FD55E35C3603ECEACA1BFC1
              C1EDEDEDFFFFFFFFFFFFFFFFFFD0D1D1CCBBB5CEB7A9E0B090FFC299FFCCA5FE
              C39DFEB18CFA9B76E9744AD19E8CC6CACBFDFDFDFFFFFFFFFFFFFFFFFFF1F3F4
              EFC5B2F9D7C2E5C4AFDDA78CF3B08DFFC9A0FFCBA2FFBB92FDC5ADCCCAC9E5E6
              E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD8C5FEE9DAFFF2E1F3DCC7DEB9A4E1
              A68AF3BC9AF3D9C2DADAD8DEE0E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FEE4D1FEE8D7FFF9F3FFF4E8FFEEDCDAC4B8D8D0CEDADBDDEDEDEEFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8FFEAD9FEE5D1FFF2E7FFF8F2E6
              D6CDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFF5EDFFE7D2FFE7D4E9DACFFDFDFDFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEFE3FC
              F6F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            TabOrder = 1
            OnClick = BitBtn4Click
          end
        end
        object TabSheet7: TTabSheet
          Caption = 'Vendedor'
          ImageIndex = 1
          object DBGrid7: TDBGrid
            Left = 0
            Top = 0
            Width = 658
            Height = 474
            DataSource = DataSource2
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
            OnDrawColumnCell = DBGrid5DrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'Mes'
                Title.Caption = 'M'#234's/Ano'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Nome'
                Title.Caption = 'Funcion'#225'rio'
                Width = 310
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Custo_Total'
                Title.Caption = 'Custo Total'
                Width = 90
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Venda_Total'
                Title.Caption = 'Venda Total'
                Width = 90
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Percentual'
                Title.Caption = '%'
                Width = 70
                Visible = True
              end>
          end
          object BitBtn3: TBitBtn
            Left = 664
            Top = 0
            Width = 75
            Height = 25
            Caption = 'Imprimir'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E6E6DCCFCED5C4C6B4AF
              B1E2E4E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DCDBDBB5B5B4BB
              BABAD3C8C5E1C9B8E3E3B2A9CD93A390848A7274C8C4C6FFFFFFFFFFFFFFFFFF
              F3F3F3D9D8D8D1D0D0D8D7D7B0B0AF8C7872DEAD94E6C8B45CAE6F41BF5C80D4
              84CECAA9BCA59DEDEAE9FFFEFEDDDDDCCFCECDE2E1E1F5F4F4F1F0F0CACACAAD
              8E827F63582A67932890D97BAB967DC462E3E8BCFFEBDFF6F2EFF0EFEFDDDCDB
              F7F7F7F5F4F4ECEAEBE7E6E5D9D8D8C1BAB79C8D895C5F6A79717AD4A993ECC2
              B0F5E5E0FEFDFDFFFFFFECECEBE4E3E2F0EFEFE8E6E6E1E0DFE3E1E1DEDEDED2
              D8DACDD1D2C2B3ACAF8A7B7E605B8A8382E9ECEDFFFFFFFFFFFFEDEDECDCDADA
              E6E5E4DDDBDADCDBDAEBEEEDDDD3D1C9917ECDB9B1D2DADDC6C9CAABA4A49D9C
              9BE7E6E6FFFFFFFFFFFFF5F5F5D5D3D2DFDDDCE0DEDDECECF2E8EAF4EEB5A0DE
              643AC65A34C58C78D1CBC9D2D7D6B3B1B0E5E4E4FFFFFFFFFFFFFFFFFFC8C7C6
              CACACAE5EAE6E7ECE8EBCCC5FEB48DFCA17CF0845FD55E35C3603ECEACA1BFC1
              C1EDEDEDFFFFFFFFFFFFFFFFFFD0D1D1CCBBB5CEB7A9E0B090FFC299FFCCA5FE
              C39DFEB18CFA9B76E9744AD19E8CC6CACBFDFDFDFFFFFFFFFFFFFFFFFFF1F3F4
              EFC5B2F9D7C2E5C4AFDDA78CF3B08DFFC9A0FFCBA2FFBB92FDC5ADCCCAC9E5E6
              E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD8C5FEE9DAFFF2E1F3DCC7DEB9A4E1
              A68AF3BC9AF3D9C2DADAD8DEE0E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FEE4D1FEE8D7FFF9F3FFF4E8FFEEDCDAC4B8D8D0CEDADBDDEDEDEEFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8FFEAD9FEE5D1FFF2E7FFF8F2E6
              D6CDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFF5EDFFE7D2FFE7D4E9DACFFDFDFDFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEFE3FC
              F6F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            TabOrder = 1
            OnClick = BitBtn3Click
          end
        end
        object TabSheet8: TTabSheet
          Caption = 'Cliente'
          ImageIndex = 2
          object DBGrid2: TDBGrid
            Left = 0
            Top = 0
            Width = 658
            Height = 474
            DataSource = DataSource6
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
            OnDrawColumnCell = DBGrid5DrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'Mes'
                Title.Caption = 'M'#234's/Ano'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Nome_Nome_Fantasia'
                Title.Caption = 'Cliente'
                Width = 362
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Valor_Total'
                Title.Caption = 'Valor Total'
                Width = 90
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Percentual'
                Title.Caption = '%'
                Width = 70
                Visible = True
              end>
          end
          object BitBtn2: TBitBtn
            Left = 664
            Top = 0
            Width = 75
            Height = 25
            Caption = 'Imprimir'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E6E6DCCFCED5C4C6B4AF
              B1E2E4E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DCDBDBB5B5B4BB
              BABAD3C8C5E1C9B8E3E3B2A9CD93A390848A7274C8C4C6FFFFFFFFFFFFFFFFFF
              F3F3F3D9D8D8D1D0D0D8D7D7B0B0AF8C7872DEAD94E6C8B45CAE6F41BF5C80D4
              84CECAA9BCA59DEDEAE9FFFEFEDDDDDCCFCECDE2E1E1F5F4F4F1F0F0CACACAAD
              8E827F63582A67932890D97BAB967DC462E3E8BCFFEBDFF6F2EFF0EFEFDDDCDB
              F7F7F7F5F4F4ECEAEBE7E6E5D9D8D8C1BAB79C8D895C5F6A79717AD4A993ECC2
              B0F5E5E0FEFDFDFFFFFFECECEBE4E3E2F0EFEFE8E6E6E1E0DFE3E1E1DEDEDED2
              D8DACDD1D2C2B3ACAF8A7B7E605B8A8382E9ECEDFFFFFFFFFFFFEDEDECDCDADA
              E6E5E4DDDBDADCDBDAEBEEEDDDD3D1C9917ECDB9B1D2DADDC6C9CAABA4A49D9C
              9BE7E6E6FFFFFFFFFFFFF5F5F5D5D3D2DFDDDCE0DEDDECECF2E8EAF4EEB5A0DE
              643AC65A34C58C78D1CBC9D2D7D6B3B1B0E5E4E4FFFFFFFFFFFFFFFFFFC8C7C6
              CACACAE5EAE6E7ECE8EBCCC5FEB48DFCA17CF0845FD55E35C3603ECEACA1BFC1
              C1EDEDEDFFFFFFFFFFFFFFFFFFD0D1D1CCBBB5CEB7A9E0B090FFC299FFCCA5FE
              C39DFEB18CFA9B76E9744AD19E8CC6CACBFDFDFDFFFFFFFFFFFFFFFFFFF1F3F4
              EFC5B2F9D7C2E5C4AFDDA78CF3B08DFFC9A0FFCBA2FFBB92FDC5ADCCCAC9E5E6
              E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD8C5FEE9DAFFF2E1F3DCC7DEB9A4E1
              A68AF3BC9AF3D9C2DADAD8DEE0E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FEE4D1FEE8D7FFF9F3FFF4E8FFEEDCDAC4B8D8D0CEDADBDDEDEDEEFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8FFEAD9FEE5D1FFF2E7FFF8F2E6
              D6CDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFF5EDFFE7D2FFE7D4E9DACFFDFDFDFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEFE3FC
              F6F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            TabOrder = 1
            OnClick = BitBtn2Click
          end
        end
        object TabSheet9: TTabSheet
          Caption = 'Grupo'
          ImageIndex = 3
          object DBGrid8: TDBGrid
            Left = 0
            Top = 0
            Width = 634
            Height = 474
            DataSource = DataSource7
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
            OnDrawColumnCell = DBGrid5DrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'Mes'
                Title.Caption = 'M'#234's/Ano'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Descricao'
                Title.Caption = 'Grupo'
                Width = 378
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Venda_Total'
                Title.Caption = 'Venda Total'
                Width = 79
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Percentual'
                Title.Caption = '%'
                Width = 72
                Visible = True
              end>
          end
          object BitBtn1: TBitBtn
            Left = 640
            Top = 0
            Width = 75
            Height = 25
            Caption = 'Imprimir'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E6E6DCCFCED5C4C6B4AF
              B1E2E4E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DCDBDBB5B5B4BB
              BABAD3C8C5E1C9B8E3E3B2A9CD93A390848A7274C8C4C6FFFFFFFFFFFFFFFFFF
              F3F3F3D9D8D8D1D0D0D8D7D7B0B0AF8C7872DEAD94E6C8B45CAE6F41BF5C80D4
              84CECAA9BCA59DEDEAE9FFFEFEDDDDDCCFCECDE2E1E1F5F4F4F1F0F0CACACAAD
              8E827F63582A67932890D97BAB967DC462E3E8BCFFEBDFF6F2EFF0EFEFDDDCDB
              F7F7F7F5F4F4ECEAEBE7E6E5D9D8D8C1BAB79C8D895C5F6A79717AD4A993ECC2
              B0F5E5E0FEFDFDFFFFFFECECEBE4E3E2F0EFEFE8E6E6E1E0DFE3E1E1DEDEDED2
              D8DACDD1D2C2B3ACAF8A7B7E605B8A8382E9ECEDFFFFFFFFFFFFEDEDECDCDADA
              E6E5E4DDDBDADCDBDAEBEEEDDDD3D1C9917ECDB9B1D2DADDC6C9CAABA4A49D9C
              9BE7E6E6FFFFFFFFFFFFF5F5F5D5D3D2DFDDDCE0DEDDECECF2E8EAF4EEB5A0DE
              643AC65A34C58C78D1CBC9D2D7D6B3B1B0E5E4E4FFFFFFFFFFFFFFFFFFC8C7C6
              CACACAE5EAE6E7ECE8EBCCC5FEB48DFCA17CF0845FD55E35C3603ECEACA1BFC1
              C1EDEDEDFFFFFFFFFFFFFFFFFFD0D1D1CCBBB5CEB7A9E0B090FFC299FFCCA5FE
              C39DFEB18CFA9B76E9744AD19E8CC6CACBFDFDFDFFFFFFFFFFFFFFFFFFF1F3F4
              EFC5B2F9D7C2E5C4AFDDA78CF3B08DFFC9A0FFCBA2FFBB92FDC5ADCCCAC9E5E6
              E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD8C5FEE9DAFFF2E1F3DCC7DEB9A4E1
              A68AF3BC9AF3D9C2DADAD8DEE0E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FEE4D1FEE8D7FFF9F3FFF4E8FFEEDCDAC4B8D8D0CEDADBDDEDEDEEFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8FFEAD9FEE5D1FFF2E7FFF8F2E6
              D6CDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFF5EDFFE7D2FFE7D4E9DACFFDFDFDFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEFE3FC
              F6F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            TabOrder = 1
            OnClick = BitBtn1Click
          end
        end
      end
    end
    object TabSheet10: TTabSheet
      Caption = 'Dados agrupados'
      ImageIndex = 5
      object PageControl3: TPageControl
        Left = 0
        Top = 0
        Width = 842
        Height = 505
        ActivePage = TabSheet11
        Style = tsFlatButtons
        TabOrder = 0
        object TabSheet12: TTabSheet
          Caption = 'Cliente'
          ImageIndex = 1
          object DBGrid10: TDBGrid
            Left = 0
            Top = 0
            Width = 747
            Height = 474
            BorderStyle = bsNone
            DataSource = DataSource9
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
            OnDrawColumnCell = DBGrid5DrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'Nome_Nome_Fantasia'
                Title.Caption = 'Cliente'
                Width = 163
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Codigo'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'Data_Venda'
                Title.Caption = 'Data Venda'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Codigo_Venda'
                Title.Caption = 'C'#243'digo Venda'
                Width = 95
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Descricao'
                Title.Caption = 'Descri'#231#227'o'
                Width = 147
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'UN'
                Title.Caption = 'Un.'
                Width = 45
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Qtde'
                Title.Caption = 'Qtde.'
                Width = 55
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Valor_Unitario'
                Title.Caption = 'Valor Unit'#225'rio'
                Width = 97
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Sub_Total'
                Title.Caption = 'Sub Total'
                Width = 88
                Visible = True
              end>
          end
          object BitBtn6: TBitBtn
            Left = 752
            Top = 0
            Width = 75
            Height = 25
            Caption = 'Imprimir'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E6E6DCCFCED5C4C6B4AF
              B1E2E4E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DCDBDBB5B5B4BB
              BABAD3C8C5E1C9B8E3E3B2A9CD93A390848A7274C8C4C6FFFFFFFFFFFFFFFFFF
              F3F3F3D9D8D8D1D0D0D8D7D7B0B0AF8C7872DEAD94E6C8B45CAE6F41BF5C80D4
              84CECAA9BCA59DEDEAE9FFFEFEDDDDDCCFCECDE2E1E1F5F4F4F1F0F0CACACAAD
              8E827F63582A67932890D97BAB967DC462E3E8BCFFEBDFF6F2EFF0EFEFDDDCDB
              F7F7F7F5F4F4ECEAEBE7E6E5D9D8D8C1BAB79C8D895C5F6A79717AD4A993ECC2
              B0F5E5E0FEFDFDFFFFFFECECEBE4E3E2F0EFEFE8E6E6E1E0DFE3E1E1DEDEDED2
              D8DACDD1D2C2B3ACAF8A7B7E605B8A8382E9ECEDFFFFFFFFFFFFEDEDECDCDADA
              E6E5E4DDDBDADCDBDAEBEEEDDDD3D1C9917ECDB9B1D2DADDC6C9CAABA4A49D9C
              9BE7E6E6FFFFFFFFFFFFF5F5F5D5D3D2DFDDDCE0DEDDECECF2E8EAF4EEB5A0DE
              643AC65A34C58C78D1CBC9D2D7D6B3B1B0E5E4E4FFFFFFFFFFFFFFFFFFC8C7C6
              CACACAE5EAE6E7ECE8EBCCC5FEB48DFCA17CF0845FD55E35C3603ECEACA1BFC1
              C1EDEDEDFFFFFFFFFFFFFFFFFFD0D1D1CCBBB5CEB7A9E0B090FFC299FFCCA5FE
              C39DFEB18CFA9B76E9744AD19E8CC6CACBFDFDFDFFFFFFFFFFFFFFFFFFF1F3F4
              EFC5B2F9D7C2E5C4AFDDA78CF3B08DFFC9A0FFCBA2FFBB92FDC5ADCCCAC9E5E6
              E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD8C5FEE9DAFFF2E1F3DCC7DEB9A4E1
              A68AF3BC9AF3D9C2DADAD8DEE0E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FEE4D1FEE8D7FFF9F3FFF4E8FFEEDCDAC4B8D8D0CEDADBDDEDEDEEFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8FFEAD9FEE5D1FFF2E7FFF8F2E6
              D6CDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFF5EDFFE7D2FFE7D4E9DACFFDFDFDFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEFE3FC
              F6F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            TabOrder = 1
            OnClick = BitBtn6Click
          end
        end
        object TabSheet11: TTabSheet
          Caption = 'Grupo'
          object DBGrid9: TDBGrid
            Left = 0
            Top = 0
            Width = 747
            Height = 474
            BorderStyle = bsNone
            DataSource = DataSource8
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
            OnDrawColumnCell = DBGrid5DrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'Grupo'
                Width = 163
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Data_Venda'
                Title.Caption = 'Data Venda'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Codigo'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'Codigo_Venda'
                Title.Caption = 'C'#243'digo Venda'
                Width = 95
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Descricao'
                Title.Caption = 'Descri'#231#227'o'
                Width = 147
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'UN'
                Title.Caption = 'Un.'
                Width = 45
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Qtde'
                Title.Caption = 'Qtde.'
                Width = 55
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Valor_Unitario'
                Title.Caption = 'Valor Unit'#225'rio'
                Width = 97
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Sub_Total'
                Title.Caption = 'Sub Total'
                Width = 88
                Visible = True
              end>
          end
          object BitBtn5: TBitBtn
            Left = 752
            Top = 0
            Width = 75
            Height = 25
            Caption = 'Imprimir'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E6E6DCCFCED5C4C6B4AF
              B1E2E4E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DCDBDBB5B5B4BB
              BABAD3C8C5E1C9B8E3E3B2A9CD93A390848A7274C8C4C6FFFFFFFFFFFFFFFFFF
              F3F3F3D9D8D8D1D0D0D8D7D7B0B0AF8C7872DEAD94E6C8B45CAE6F41BF5C80D4
              84CECAA9BCA59DEDEAE9FFFEFEDDDDDCCFCECDE2E1E1F5F4F4F1F0F0CACACAAD
              8E827F63582A67932890D97BAB967DC462E3E8BCFFEBDFF6F2EFF0EFEFDDDCDB
              F7F7F7F5F4F4ECEAEBE7E6E5D9D8D8C1BAB79C8D895C5F6A79717AD4A993ECC2
              B0F5E5E0FEFDFDFFFFFFECECEBE4E3E2F0EFEFE8E6E6E1E0DFE3E1E1DEDEDED2
              D8DACDD1D2C2B3ACAF8A7B7E605B8A8382E9ECEDFFFFFFFFFFFFEDEDECDCDADA
              E6E5E4DDDBDADCDBDAEBEEEDDDD3D1C9917ECDB9B1D2DADDC6C9CAABA4A49D9C
              9BE7E6E6FFFFFFFFFFFFF5F5F5D5D3D2DFDDDCE0DEDDECECF2E8EAF4EEB5A0DE
              643AC65A34C58C78D1CBC9D2D7D6B3B1B0E5E4E4FFFFFFFFFFFFFFFFFFC8C7C6
              CACACAE5EAE6E7ECE8EBCCC5FEB48DFCA17CF0845FD55E35C3603ECEACA1BFC1
              C1EDEDEDFFFFFFFFFFFFFFFFFFD0D1D1CCBBB5CEB7A9E0B090FFC299FFCCA5FE
              C39DFEB18CFA9B76E9744AD19E8CC6CACBFDFDFDFFFFFFFFFFFFFFFFFFF1F3F4
              EFC5B2F9D7C2E5C4AFDDA78CF3B08DFFC9A0FFCBA2FFBB92FDC5ADCCCAC9E5E6
              E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD8C5FEE9DAFFF2E1F3DCC7DEB9A4E1
              A68AF3BC9AF3D9C2DADAD8DEE0E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FEE4D1FEE8D7FFF9F3FFF4E8FFEEDCDAC4B8D8D0CEDADBDDEDEDEEFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8FFEAD9FEE5D1FFF2E7FFF8F2E6
              D6CDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFF5EDFFE7D2FFE7D4E9DACFFDFDFDFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEFE3FC
              F6F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            TabOrder = 1
            OnClick = BitBtn5Click
          end
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Dados Fiscais'
      ImageIndex = 5
      object Panel1: TPanel
        Left = 3
        Top = 9
        Width = 817
        Height = 25
        BorderStyle = bsSingle
        Caption = 'Dados Fiscais de Vendas'
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
      object DBGrid1: TDBGrid
        Left = 3
        Top = 39
        Width = 817
        Height = 464
        BorderStyle = bsNone
        DataSource = DataSource5
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid5DrawColumnCell
        OnTitleClick = DBGrid1TitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Nome_Nome_Fantasia'
            Title.Caption = 'Cliente'
            Width = 217
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data_Venda'
            Title.Caption = 'Data Venda'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'N_Pedido'
            Title.Caption = 'N'#186' Pedido'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COO'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COO_Vin'
            Title.Caption = 'COO Vin.'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'N_Nota_Fiscal'
            Title.Caption = 'N'#186' Nota Fiscal'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Chave_NFe'
            Title.Caption = 'Chave NFe'
            Width = 293
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Protocolo_NFe'
            Title.Caption = 'Protocolo'
            Width = 303
            Visible = True
          end>
      end
    end
  end
  object ds_consulta_folha: TDataSource
    Left = 822
    Top = 232
  end
  object qryitens_venda: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select IP.Codigo_Produto, IP.Codigo, IP.Codigo_Venda, IP.Descric' +
        'ao, IP.UN, IP.Qtde, '
      
        'IP.Valor_Original, IP.Desc_Acr,IP.Valor_Unitario, IP.Valor_Compr' +
        'a, IP.Sub_Total, IP.Valor_ICMS_ST, IP.Codigo_Registro from Itens' +
        '_Pedido IP'
      'order by IP.Codigo')
    Left = 697
    Top = 26
    object qryitens_vendaCodigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object qryitens_vendaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryitens_vendaCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qryitens_vendaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 300
    end
    object qryitens_vendaUN: TStringField
      FieldName = 'UN'
      Size = 10
    end
    object qryitens_vendaQtde: TFloatField
      FieldName = 'Qtde'
    end
    object qryitens_vendaValor_Original: TFloatField
      FieldName = 'Valor_Original'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_vendaDesc_Acr: TFloatField
      FieldName = 'Desc_Acr'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_vendaValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_vendaValor_Compra: TFloatField
      FieldName = 'Valor_Compra'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_vendaSub_Total: TFloatField
      FieldName = 'Sub_Total'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_vendaValor_ICMS_ST: TFloatField
      FieldName = 'Valor_ICMS_ST'
    end
    object qryitens_vendaCodigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ReadOnly = True
    end
  end
  object ds_consulta_itens_folha: TDataSource
    DataSet = qryitens_venda
    Left = 723
    Top = 26
  end
  object DataSource1: TDataSource
    DataSet = qrylucratividade_geral
    Left = 822
    Top = 336
  end
  object DataSource2: TDataSource
    DataSet = qrylucratividade_vendedor
    Left = 910
    Top = 176
  end
  object qryconsulta_sintetico_produto: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     P.Data_Venda, IP.Codigo_Venda, IP.Descricao, IP.UN, I' +
        'P.Qtde, IP.Valor_Original, IP.Valor_Unitario, IP.Desconto, IP.Su' +
        'b_Total,'
      ''
      'FROM         Itens_Pedido IP '
      'LEFT JOIN Pedido P on (IP.Codigo = P.Codigo)'
      'WHERE     (P.Data_Venda BETWEEN '#39'01/12/2012'#39' AND '#39'30/12/2012'#39') '
      'GROUP BY IP.Codigo_Venda, IP.Descricao, IP.UN, P.Data_Venda'
      'ORDER BY P.Data_Venda')
    Left = 774
    Top = 280
    object qryconsulta_sintetico_produtoData_Venda: TDateTimeField
      FieldName = 'Data_Venda'
    end
    object qryconsulta_sintetico_produtoCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qryconsulta_sintetico_produtoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qryconsulta_sintetico_produtoUN: TStringField
      FieldName = 'UN'
      Size = 10
    end
    object qryconsulta_sintetico_produtoQtde: TFloatField
      FieldName = 'Qtde'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_sintetico_produtoValor_Total: TFloatField
      FieldName = 'Valor_Total'
      ReadOnly = True
      currency = True
    end
  end
  object DataSource3: TDataSource
    DataSet = qryconsulta_sintetico_produto
    Left = 806
    Top = 280
  end
  object qryconsulta_sintetico_1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select Ped.Codigo, Ped.N_Pedido, Ped.Data_Venda, Ped.Data_Emissa' +
        'o_NFe, Ped.Total_Pedido, CP.Descricao as Cond_Pag,'
      
        'Cli.Nome_Nome_Fantasia, Fun.Nome as Funcionario, CFOP.CFOP, Ped.' +
        'Status, Ped.Total_Impostos from Pedido Ped'
      'left join Cliente Cli on (Ped.Codigo_Cliente = Cli.Codigo)'
      
        'left join Funcionario Fun on (Ped.Codigo_Funcionario = Fun.Codig' +
        'o)'
      
        'left join Condicao_Pagamento CP on (Ped.Codigo_Forma_Pag = CP.Co' +
        'digo)'
      'left join Cadastro_CFOP CFOP on (Ped.Codigo_CFOP = CFOP.Codigo)')
    Left = 614
    object qryconsulta_sintetico_1Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryconsulta_sintetico_1N_Pedido: TStringField
      FieldName = 'N_Pedido'
      Size = 13
    end
    object qryconsulta_sintetico_1Data_Venda: TDateTimeField
      FieldName = 'Data_Venda'
    end
    object qryconsulta_sintetico_1Total_Pedido: TFloatField
      FieldName = 'Total_Pedido'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_sintetico_1Cond_Pag: TStringField
      FieldName = 'Cond_Pag'
      Size = 30
    end
    object qryconsulta_sintetico_1Nome_Nome_Fantasia: TStringField
      FieldName = 'Nome_Nome_Fantasia'
      Size = 50
    end
    object qryconsulta_sintetico_1Funcionario: TStringField
      FieldName = 'Funcionario'
      Size = 50
    end
    object qryconsulta_sintetico_1CFOP: TStringField
      FieldName = 'CFOP'
      Size = 10
    end
    object qryconsulta_sintetico_1Status: TStringField
      FieldName = 'Status'
      Size = 10
    end
    object qryconsulta_sintetico_1Total_Impostos: TFloatField
      FieldName = 'Total_Impostos'
    end
    object qryconsulta_sintetico_1Data_Emissao_NFe: TDateTimeField
      FieldName = 'Data_Emissao_NFe'
      OnGetText = qryconsulta_sintetico_1Data_Emissao_NFeGetText
    end
  end
  object DataSource4: TDataSource
    DataSet = qryconsulta_sintetico_1
    Left = 646
  end
  object qryconsulta_venda_tributo: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select C.Nome_Nome_Fantasia, P.Data_Venda, P.N_Pedido, P.COO, P.' +
        'COO_Vin, '
      'P.N_Nota_Fiscal, P.Chave_NFe, P.Protocolo_NFe from Pedido P'
      'left join Cliente C on (P.Codigo_Cliente = C.Codigo)'
      'where P.Data_Venda between '#39'01/12/2012'#39' and '#39'12/12/2012'#39)
    Left = 846
    Top = 280
    object qryconsulta_venda_tributoData_Venda: TDateTimeField
      FieldName = 'Data_Venda'
    end
    object qryconsulta_venda_tributoN_Pedido: TStringField
      FieldName = 'N_Pedido'
      Size = 13
    end
    object qryconsulta_venda_tributoCOO: TStringField
      FieldName = 'COO'
      Size = 6
    end
    object qryconsulta_venda_tributoCOO_Vin: TStringField
      FieldName = 'COO_Vin'
      Size = 6
    end
    object qryconsulta_venda_tributoN_Nota_Fiscal: TIntegerField
      FieldName = 'N_Nota_Fiscal'
    end
    object qryconsulta_venda_tributoChave_NFe: TStringField
      FieldName = 'Chave_NFe'
      Size = 100
    end
    object qryconsulta_venda_tributoProtocolo_NFe: TStringField
      FieldName = 'Protocolo_NFe'
      Size = 100
    end
    object qryconsulta_venda_tributoNome_Nome_Fantasia: TStringField
      FieldName = 'Nome_Nome_Fantasia'
      Size = 50
    end
  end
  object DataSource5: TDataSource
    DataSet = qryconsulta_venda_tributo
    Left = 878
    Top = 280
  end
  object qrylucratividade_cliente: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select Y.Mes,'
      #9'   Y.Nome_Nome_Fantasia,'
      #9'   Y.Valor_Total,'
      '       ( Y.Valor_Total / Y.Total_Geral) * 100 as Percentual'
      'from('
      '          select C.Nome_Nome_Fantasia, '
      #9#9#9#9' sum(IP.Valor_Unitario * IP.Qtde) as Valor_Total,'
      
        #9#9#9#9' convert(varchar(2),month(P.Data_Venda)) + '#39'/'#39' + convert(var' +
        'char(4),year(P.Data_Venda)) as Mes,'
      #9#9#9#9' '#9#9#9' '#9#9' '
      
        '          (select sum(tip.Valor_Unitario * tip.Qtde) from Itens_' +
        'Pedido tip'
      '          left join Pedido t on (tip.Codigo = t.Codigo)'
      
        '          where t.Data_Venda between '#39'05/03/2013'#39' and '#39'05/04/201' +
        '3'#39' and t.Status = '#39'PAGO'#39') as Total_Geral '
      #9#9'  '
      #9#9'  from Itens_Pedido IP'
      #9#9'  left join Pedido P on(IP.Codigo = P.Codigo)'
      #9#9'  left join Cliente C on (P.Codigo_Cliente = C.Codigo)'
      
        '          where P.Data_Venda between '#39'05/03/2013'#39' and '#39'05/04/201' +
        '3'#39' and P.Status = '#39'PAGO'#39
      
        '          group by C.Nome_Nome_Fantasia, convert(varchar(2),mont' +
        'h(P.Data_Venda)) + '#39'/'#39' + convert(varchar(4),year(P.Data_Venda)))' +
        ' Y'
      'order by mes, percentual desc')
    Left = 862
    Top = 336
    object qrylucratividade_clienteMes: TStringField
      FieldName = 'Mes'
      ReadOnly = True
      Size = 7
    end
    object qrylucratividade_clienteNome_Nome_Fantasia: TStringField
      FieldName = 'Nome_Nome_Fantasia'
      Size = 50
    end
    object qrylucratividade_clienteValor_Total: TFloatField
      FieldName = 'Valor_Total'
      ReadOnly = True
      currency = True
    end
    object qrylucratividade_clientePercentual: TFloatField
      FieldName = 'Percentual'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
  end
  object DataSource6: TDataSource
    DataSet = qrylucratividade_cliente
    Left = 894
    Top = 336
  end
  object qrylucratividade_vendedor: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select Y.Mes,'
      #9'   Y.Nome,'
      #9'   Y.Custo_Total,'
      #9'   Y.Venda_Total,'
      
        '       ( (Y.Venda_Total - Y.Custo_Total) / Y.Venda_Total) * 100 ' +
        'as Percentual'
      'from('
      '          select F.Nome, '
      #9#9#9#9' sum(IP.Valor_Unitario * IP.Qtde) as Venda_Total,'
      #9#9#9#9' sum(IP.Valor_Compra * IP.Qtde) as Custo_Total,'
      
        #9#9#9#9' convert(varchar(2),month(P.Data_Venda)) + '#39'/'#39' + convert(var' +
        'char(4),year(P.Data_Venda)) as Mes'
      #9#9#9#9' '#9#9#9' '
      #9#9'  '
      #9#9'  from Itens_Pedido IP'
      #9#9'  left join Pedido P on(IP.Codigo = P.Codigo)'
      #9#9'  left join Funcionario F on (P.Codigo_Funcionario = F.Codigo)'
      
        '          where P.Data_Venda between '#39'05/03/2013'#39' and '#39'05/04/201' +
        '3'#39' and P.Status = '#39'PAGO'#39
      
        '          group by F.Nome, convert(varchar(2),month(P.Data_Venda' +
        ')) + '#39'/'#39' + convert(varchar(4),year(P.Data_Venda))) Y'
      'order by mes, percentual desc')
    Left = 880
    Top = 176
    object qrylucratividade_vendedorMes: TStringField
      FieldName = 'Mes'
      ReadOnly = True
      Size = 7
    end
    object qrylucratividade_vendedorNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qrylucratividade_vendedorCusto_Total: TFloatField
      FieldName = 'Custo_Total'
      ReadOnly = True
      currency = True
    end
    object qrylucratividade_vendedorVenda_Total: TFloatField
      FieldName = 'Venda_Total'
      ReadOnly = True
      currency = True
    end
    object qrylucratividade_vendedorPercentual: TFloatField
      FieldName = 'Percentual'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
  end
  object qrylucratividade_geral: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ''
      'select Y.Mes,'
      #9'   Y.Custo_Total,'
      #9'   Y.Venda_Total,'
      
        '       ( (Y.Venda_Total - Y.Custo_Total) / Y.Venda_Total) * 100 ' +
        'as Percentual'
      'from('
      
        '          select sum(IP.Valor_Unitario * IP.Qtde) as Venda_Total' +
        ','
      #9#9#9#9' sum(IP.Valor_Compra * IP.Qtde) as Custo_Total,'
      
        #9#9#9#9' convert(varchar(2),month(P.Data_Venda)) + '#39'/'#39' + convert(var' +
        'char(4),year(P.Data_Venda)) as Mes'
      #9#9#9#9' '#9#9#9' '#9#9' '
      #9#9'  from Itens_Pedido IP'
      #9#9'  left join Pedido P on(IP.Codigo = P.Codigo)'
      
        '          where P.Data_Venda between '#39'31/03/2013'#39' and '#39'05/04/201' +
        '3'#39' and P.Status = '#39'PAGO'#39
      
        '          group by convert(varchar(2),month(P.Data_Venda)) + '#39'/'#39 +
        ' + convert(varchar(4),year(P.Data_Venda))) Y'
      'order by mes, percentual desc')
    Left = 792
    Top = 336
    object qrylucratividade_geralMes: TStringField
      FieldName = 'Mes'
      ReadOnly = True
      Size = 7
    end
    object qrylucratividade_geralCusto_Total: TFloatField
      FieldName = 'Custo_Total'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
    object qrylucratividade_geralVenda_Total: TFloatField
      FieldName = 'Venda_Total'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
    object qrylucratividade_geralPercentual: TFloatField
      FieldName = 'Percentual'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
  end
  object DataSource7: TDataSource
    DataSet = qrylucratividade_grupo
    Left = 894
    Top = 232
  end
  object qrylucratividade_grupo: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select Y.Mes,'
      '       Y.Descricao,'
      #9'   Y.Venda_Total,'
      #9'   (Y.Venda_Total / Y.Total_Geral) * 100 as Percentual'
      'from('
      #9'   select'
      #9'   --GP.Descricao,'
      #9'   case when grouping(GP.Descricao) = 0 then GP.Descricao '
      #9#9#9'when grouping(GP.Descricao) = 1  then '#39'TOTAL------>'#39' '
      #9'   end as Descricao, '
      ''
      '       sum(tip.Valor_Unitario * tip.Qtde) as Venda_Total,'
      
        #9'   convert(varchar(2),month(t.Data_Venda)) + '#39'/'#39' + convert(varc' +
        'har(4),year(t.Data_Venda)) as Mes,'
      
        '      (select sum(tip.Valor_Unitario * tip.Qtde) from Itens_Pedi' +
        'do tip'
      '      left join Pedido t on (tip.Codigo = t.Codigo)'
      
        '      where t.Data_Venda between '#39'05/03/2013'#39' and '#39'05/04/2013'#39' a' +
        'nd t.Status = '#39'PAGO'#39') as Total_Geral '
      '       '
      '        from Itens_Pedido tip'
      'left join Pedido t on (tip.Codigo = t.Codigo)'
      'left join Produto Pro on (tip.Codigo_Produto = Pro.Codigo)'
      'left join Grupo_Produto GP on (Pro.Codigo_Grupo = GP.Codigo)'
      
        'where t.Data_Venda between '#39'05/03/2013'#39' and '#39'05/04/2013'#39' and t.S' +
        'tatus = '#39'PAGO'#39
      
        'group by convert(varchar(2),month(t.Data_Venda)) + '#39'/'#39' + convert' +
        '(varchar(4),year(t.Data_Venda)), GP.Codigo_Pai, GP.Descricao'
      'with RollUP) Y ')
    Left = 864
    Top = 232
    object qrylucratividade_grupoMes: TStringField
      FieldName = 'Mes'
      ReadOnly = True
      Size = 7
    end
    object qrylucratividade_grupoDescricao: TStringField
      FieldName = 'Descricao'
      ReadOnly = True
      Size = 200
    end
    object qrylucratividade_grupoVenda_Total: TFloatField
      FieldName = 'Venda_Total'
      ReadOnly = True
      currency = True
    end
    object qrylucratividade_grupoPercentual: TFloatField
      FieldName = 'Percentual'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
  end
  object qrydados_agrupados_grupo: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select GP.Codigo as CodGrupo, GP.Descricao as Grupo, IP.Codigo, ' +
        'IP.Codigo_Venda, IP.Descricao, IP.UN, IP.Qtde,'
      
        'IP.Valor_Unitario, IP.Sub_Total, Ped.Data_Venda from Itens_Pedid' +
        'o IP'
      'left join Pedido Ped on (IP.Codigo = Ped.Codigo)'
      'left join Produto P on (IP.Codigo_Produto = P.Codigo)'
      'left join Grupo_Produto GP on (P.Codigo_Grupo = GP.Codigo)')
    Left = 451
    Top = 394
    object qrydados_agrupados_grupoGrupo: TStringField
      FieldName = 'Grupo'
      Size = 300
    end
    object qrydados_agrupados_grupoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrydados_agrupados_grupoCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qrydados_agrupados_grupoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 300
    end
    object qrydados_agrupados_grupoUN: TStringField
      FieldName = 'UN'
      Size = 10
    end
    object qrydados_agrupados_grupoQtde: TFloatField
      FieldName = 'Qtde'
    end
    object qrydados_agrupados_grupoValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
    end
    object qrydados_agrupados_grupoSub_Total: TFloatField
      FieldName = 'Sub_Total'
    end
    object qrydados_agrupados_grupoCodGrupo: TAutoIncField
      FieldName = 'CodGrupo'
      ReadOnly = True
    end
    object qrydados_agrupados_grupoData_Venda: TDateTimeField
      FieldName = 'Data_Venda'
    end
  end
  object DataSource8: TDataSource
    DataSet = qrydados_agrupados_grupo
    Left = 483
    Top = 394
  end
  object qrydados_agrupados_cliente: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select C.Codigo as CodCliente, C.Nome_Nome_Fantasia, C.Razao_Soc' +
        'ial, IP.Codigo, IP.Codigo_Venda, IP.Descricao, IP.UN, IP.Qtde,'
      
        'IP.Valor_Unitario, IP.Sub_Total, Ped.Data_Venda from Itens_Pedid' +
        'o IP'
      'left join Pedido Ped on (IP.Codigo = Ped.Codigo)'
      'left join Produto P on (IP.Codigo_Produto = P.Codigo)'
      'left join Cliente C on (Ped.Codigo_Cliente = C.Codigo)')
    Left = 451
    Top = 330
    object qrydados_agrupados_clienteCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object qrydados_agrupados_clienteNome_Nome_Fantasia: TStringField
      FieldName = 'Nome_Nome_Fantasia'
      Size = 50
    end
    object qrydados_agrupados_clienteRazao_Social: TStringField
      FieldName = 'Razao_Social'
      Size = 50
    end
    object qrydados_agrupados_clienteCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrydados_agrupados_clienteCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qrydados_agrupados_clienteDescricao: TStringField
      FieldName = 'Descricao'
      Size = 300
    end
    object qrydados_agrupados_clienteUN: TStringField
      FieldName = 'UN'
      Size = 10
    end
    object qrydados_agrupados_clienteQtde: TFloatField
      FieldName = 'Qtde'
    end
    object qrydados_agrupados_clienteValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
    end
    object qrydados_agrupados_clienteSub_Total: TFloatField
      FieldName = 'Sub_Total'
    end
    object qrydados_agrupados_clienteData_Venda: TDateTimeField
      FieldName = 'Data_Venda'
    end
  end
  object DataSource9: TDataSource
    DataSet = qrydados_agrupados_cliente
    Left = 483
    Top = 330
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
        Component = cxGrid1DBTableView1Cond_Pag
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Data_Emissao_NFe
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Data_Venda
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Funcionario
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Nome_Nome_Fantasia
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1N_Pedido
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
        Component = cxGrid1DBTableView1Total_Pedido
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
        Component = cxGrid1DBTableView2Codigo_Venda
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
        Component = cxGrid1DBTableView2Desc_Acr
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Qtde
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Sub_Total
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2UN
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Valor_Compra
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Valor_ICMS_ST
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Valor_Original
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
      end>
    StorageName = 'ConfiguraGrid'
    Left = 880
    Top = 88
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = dxComponentPrinter1Link1
    PreviewOptions.Caption = 'Visualiza'#231#227'o de relat'#243'rio'
    PreviewOptions.WindowState = wsMaximized
    PrintTitle = 'Impress'#227'o de relat'#243'rio'
    Version = 0
    Left = 912
    Top = 88
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
end
