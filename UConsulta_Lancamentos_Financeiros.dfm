object FrmConsulta_Lancamentos_Financeiros: TFrmConsulta_Lancamentos_Financeiros
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Contas a Pagas/Recebidas'
  ClientHeight = 523
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
    Width = 97
    Height = 523
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 93
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
      Caption = '&Localizar'
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
    object BBtnImprimir_Sintetico: TToolButton
      Left = 0
      Top = 76
      Cursor = crHandPoint
      Caption = '&Imprimir'
      Enabled = False
      ImageIndex = 3
      Wrap = True
      OnClick = BBtnImprimir_SinteticoClick
    end
    object BBtnExportar: TToolButton
      Left = 0
      Top = 114
      Cursor = crHandPoint
      Caption = 'Exp. XLS'
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
  object PageControl1: TPageControl
    Left = 97
    Top = 0
    Width = 855
    Height = 523
    Cursor = crHandPoint
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    object TabSheet9: TTabSheet
      Caption = 'Configura'#231#227'o do Relat'#243'rio'
      ImageIndex = 4
      object Label7: TLabel
        Left = 457
        Top = 94
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
        Left = 393
        Top = 94
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
      object Label2: TLabel
        Left = 178
        Top = 94
        Width = 72
        Height = 13
        Caption = 'Cli./Forn./P.F'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RGConsulta_Lancamento: TRadioGroup
        Left = 174
        Top = 0
        Width = 201
        Height = 89
        Caption = 'Consulta Lan'#231'amentos'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Tudo'
          'Documento'
          'Cli./Forn.'
          'Plano Financeiro'
          'Departamento'
          'Forma de Pag.')
        TabOrder = 2
      end
      object EdtConsulta: TEdit
        Left = 240
        Top = 109
        Width = 154
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
        OnKeyDown = EdtConsultaKeyDown
      end
      object RGData: TRadioGroup
        Left = 377
        Top = 0
        Width = 129
        Height = 89
        Hint = 
          'Marcando a op'#231#227'o Data de Vencimento ou Data de Pagamento, n'#227'o '#233' ' +
          'necess'#225'rio escolher Status'
        Caption = 'Datas'
        ItemIndex = 0
        Items.Strings = (
          'Data de Lan'#231'amento'
          'Data de Vencimento'
          'Data de Pagamento')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = RGDataClick
      end
      object RGTipo_Conta: TRadioGroup
        Left = 85
        Top = 0
        Width = 87
        Height = 89
        Caption = 'Tipo de Conta'
        ItemIndex = 0
        Items.Strings = (
          'Tudo'
          'Pagar'
          'Receber')
        TabOrder = 1
      end
      object MEdtData_Final: TMaskEdit
        Left = 457
        Top = 109
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
        TabOrder = 9
        Text = '  /  /    '
      end
      object MEdtData_Inicial: TMaskEdit
        Left = 393
        Top = 109
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
        TabOrder = 8
        Text = '  /  /    '
      end
      object EdtCodigo_Cli_For: TEdit
        Left = 178
        Top = 109
        Width = 62
        Height = 17
        Hint = 
          'Pressione F3 para consultar Cliente ou Fornecedor. Os demais par' +
          #226'metros, digite-os.'
        BevelEdges = [beLeft, beTop, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clMenu
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        OnKeyDown = EdtCodigo_Cli_ForKeyDown
        OnKeyPress = EdtCodigo_Cli_ForKeyPress
      end
      object RGTipo_Relatorio: TRadioGroup
        Left = 0
        Top = 0
        Width = 83
        Height = 89
        Caption = 'Tipo de Rel.'
        ItemIndex = 0
        Items.Strings = (
          'Analitico'
          'Agrupado')
        TabOrder = 0
        OnClick = RGTipo_RelatorioClick
      end
      object RGStatus: TRadioGroup
        Left = 0
        Top = 88
        Width = 83
        Height = 65
        Caption = 'Status'
        ItemIndex = 0
        Items.Strings = (
          'Tudo'
          'Pago'
          'Pendente')
        TabOrder = 4
      end
      object RGConta_Fixa: TRadioGroup
        Left = 85
        Top = 88
        Width = 87
        Height = 65
        Caption = 'Conta Fixa'
        ItemIndex = 0
        Items.Strings = (
          'Tudo'
          'Fixas'
          'Variadas')
        TabOrder = 5
      end
      object CBMostrar_Historico: TCheckBox
        Left = 178
        Top = 132
        Width = 167
        Height = 17
        Caption = 'Mostrar hist'#243'rico das parcelas'
        TabOrder = 10
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Analitico'
      ImageIndex = 1
      object cxGrid1: TcxGrid
        Left = 2
        Top = 0
        Width = 847
        Height = 492
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
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
          DataController.DataSource = DataSource1
          DataController.Filter.Active = True
          DataController.KeyFieldNames = 'Codigo'
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = '#0.0,0'
              Kind = skSum
              FieldName = 'Valor'
              Column = cxGrid1DBTableView1Valor
            end
            item
              Format = '#0.0,0'
              Kind = skSum
              FieldName = 'Valor_Pagar'
              Column = cxGrid1DBTableView1Valor_Pagar
            end
            item
              Format = '#0.0,0'
              Kind = skSum
              FieldName = 'Valor_Pago'
              Column = cxGrid1DBTableView1Valor_Pago
            end
            item
              Format = '#0.0,0'
              Kind = skSum
              FieldName = 'Valor_Restante'
              Column = cxGrid1DBTableView1Valor_Restante
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '#0.0,0'
              Kind = skSum
              FieldName = 'Valor'
              Column = cxGrid1DBTableView1Valor
              DisplayText = 'Valor Bruto'
            end
            item
              Format = '#0.0,0'
              Kind = skSum
              FieldName = 'Valor_Pagar'
              Column = cxGrid1DBTableView1Valor_Pagar
              DisplayText = 'Valor Pagar'
            end
            item
              Format = '#0.0,0'
              Kind = skSum
              FieldName = 'Valor_Pago'
              Column = cxGrid1DBTableView1Valor_Pago
              DisplayText = 'Valor J'#225' Pago'
            end
            item
              Format = '#0.0,0'
              Kind = skSum
              FieldName = 'Valor_Restante'
              Column = cxGrid1DBTableView1Valor_Restante
              DisplayText = 'Valor Restante'
            end
            item
              Kind = skCount
              FieldName = 'Codigo'
              Column = cxGrid1DBTableView1Codigo
              DisplayText = 'Qtde.'
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
          object cxGrid1DBTableView1N_Documento: TcxGridDBColumn
            Caption = 'N'#186' Documento'
            DataBinding.FieldName = 'N_Documento'
            Options.Editing = False
            Width = 91
          end
          object cxGrid1DBTableView1Nome: TcxGridDBColumn
            DataBinding.FieldName = 'Nome'
            Options.Editing = False
            Width = 159
          end
          object cxGrid1DBTableView1Historico: TcxGridDBColumn
            Caption = 'Hist'#243'rico'
            DataBinding.FieldName = 'Historico'
            Options.Editing = False
            Width = 161
          end
          object cxGrid1DBTableView1Cond_Pag: TcxGridDBColumn
            Caption = 'Cond. Pag.'
            DataBinding.FieldName = 'Cond_Pag'
            Options.Editing = False
            Width = 159
          end
          object cxGrid1DBTableView1Data_Lancamento: TcxGridDBColumn
            Caption = 'Lan'#231'amento'
            DataBinding.FieldName = 'Data_Lancamento'
            Options.Editing = False
            Width = 79
          end
          object cxGrid1DBTableView1Data_Vencimento: TcxGridDBColumn
            Caption = 'Vencimento'
            DataBinding.FieldName = 'Data_Vencimento'
            Options.Editing = False
            Width = 76
          end
          object cxGrid1DBTableView1Data_Pagamento: TcxGridDBColumn
            Caption = 'Pagamento'
            DataBinding.FieldName = 'Data_Pagamento'
            Options.Editing = False
            Width = 74
          end
          object cxGrid1DBTableView1Dias_Venc: TcxGridDBColumn
            Caption = 'Dias Venc.'
            DataBinding.FieldName = 'Dias_Venc'
            Options.Editing = False
            Width = 68
          end
          object cxGrid1DBTableView1Valor: TcxGridDBColumn
            Caption = 'Valor Bruto'
            DataBinding.FieldName = 'Valor'
            Options.Editing = False
            Width = 87
          end
          object cxGrid1DBTableView1Valor_Pagar: TcxGridDBColumn
            Caption = 'Valor Pagar'
            DataBinding.FieldName = 'Valor_Pagar'
            Options.Editing = False
            Width = 77
          end
          object cxGrid1DBTableView1Valor_Pago: TcxGridDBColumn
            Caption = 'Valor Pago'
            DataBinding.FieldName = 'Valor_Pago'
            Options.Editing = False
            Width = 81
          end
          object cxGrid1DBTableView1Valor_Restante: TcxGridDBColumn
            Caption = 'Valor Restante'
            DataBinding.FieldName = 'Valor_Restante'
            Options.Editing = False
            Width = 90
          end
          object cxGrid1DBTableView1N_Cheque: TcxGridDBColumn
            Caption = 'N'#186' Cheque'
            DataBinding.FieldName = 'N_Cheque'
            Options.Editing = False
            Width = 92
          end
          object cxGrid1DBTableView1Conta: TcxGridDBColumn
            Caption = 'N'#186' Conta'
            DataBinding.FieldName = 'Conta'
            Options.Editing = False
            Width = 101
          end
          object cxGrid1DBTableView1Tipo_Pagamento: TcxGridDBColumn
            Caption = 'Tipo Pag.'
            DataBinding.FieldName = 'Tipo_Pagamento'
            Options.Editing = False
          end
          object cxGrid1DBTableView1Tipo: TcxGridDBColumn
            Caption = 'Tipo Conta'
            DataBinding.FieldName = 'Tipo'
            Options.Editing = False
          end
          object cxGrid1DBTableView1Status: TcxGridDBColumn
            DataBinding.FieldName = 'Status'
            Options.Editing = False
          end
          object cxGrid1DBTableView1Plano_Financeiro: TcxGridDBColumn
            Caption = 'Plano Financeiro'
            DataBinding.FieldName = 'Plano_Financeiro'
            Options.Editing = False
          end
          object cxGrid1DBTableView1Departamento: TcxGridDBColumn
            DataBinding.FieldName = 'Departamento'
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
        object cxGrid1DBTableView2: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          FilterBox.Visible = fvNever
          DataController.DataSource = DataSource9
          DataController.DetailKeyFieldNames = 'N_Documento'
          DataController.KeyFieldNames = 'Codigo'
          DataController.MasterKeyFieldNames = 'N_Documento'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsCustomize.DataRowSizing = True
          object cxGrid1DBTableView2Codigo: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'Codigo'
            Options.Editing = False
          end
          object cxGrid1DBTableView2Data_Cadastro: TcxGridDBColumn
            Caption = 'Cadastro'
            DataBinding.FieldName = 'Data_Cadastro'
            Options.Editing = False
            Width = 97
          end
          object cxGrid1DBTableView2Data_Cobranca: TcxGridDBColumn
            Caption = 'Cobran'#231'a'
            DataBinding.FieldName = 'Data_Cobranca'
            Options.Editing = False
            Width = 132
          end
          object cxGrid1DBTableView2Responsavel_Atendimento: TcxGridDBColumn
            Caption = 'Respons'#225'vel Atendimento'
            DataBinding.FieldName = 'Responsavel_Atendimento'
            Options.Editing = False
            Width = 256
          end
          object cxGrid1DBTableView2Origem_Atendimento: TcxGridDBColumn
            Caption = 'Origem Atendimento'
            DataBinding.FieldName = 'Origem_Atendimento'
            Options.Editing = False
            Width = 112
          end
          object cxGrid1DBTableView2Codigo_Lancamento_Financeiro: TcxGridDBColumn
            Caption = 'C'#243'd. Lanc. Fin.'
            DataBinding.FieldName = 'Codigo_Lancamento_Financeiro'
            Options.Editing = False
            Width = 83
          end
          object cxGrid1DBTableView2N_Documento: TcxGridDBColumn
            Caption = 'N'#186' Documento'
            DataBinding.FieldName = 'N_Documento'
            Options.Editing = False
            Width = 88
          end
          object cxGrid1DBTableView2Observacoes: TcxGridDBColumn
            Caption = 'Observa'#231#245'es'
            DataBinding.FieldName = 'Observacoes'
            Options.Editing = False
            Width = 600
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
    object TabSheet1: TTabSheet
      Caption = 'Agrupado'
      ImageIndex = 2
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 824
        Height = 492
        Cursor = crHandPoint
        ActivePage = TabSheet5
        Style = tsFlatButtons
        TabOrder = 0
        object TabSheet4: TTabSheet
          Caption = 'Cliente/Fornecedor'
          object DBGrid2: TDBGrid
            Left = 0
            Top = 0
            Width = 721
            Height = 461
            DataSource = DataSource5
            DrawingStyle = gdsGradient
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = DBGrid1CellClick
            OnDrawColumnCell = DBGrid1DrawColumnCell
            OnTitleClick = DBGrid2TitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'Mes'
                Title.Caption = 'M'#234's/Ano'
                Width = 55
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Nome'
                Width = 415
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Valor_Total'
                Title.Caption = 'Valor Total'
                Width = 110
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Percentual'
                Title.Caption = '%'
                Width = 54
                Visible = True
              end>
          end
          object BitBtn2: TBitBtn
            Left = 727
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
        object TabSheet5: TTabSheet
          Caption = 'Plano Financeiro'
          ImageIndex = 1
          object DBGrid1: TDBGrid
            Left = 0
            Top = 0
            Width = 721
            Height = 457
            DataSource = DataSource4
            DrawingStyle = gdsGradient
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = DBGrid1CellClick
            OnDrawColumnCell = DBGrid1DrawColumnCell
            OnTitleClick = DBGrid1TitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'Mes'
                Title.Caption = 'M'#234's/Ano'
                Width = 55
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Descricao'
                Title.Caption = 'Plano'
                Width = 415
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Valor_Total'
                Title.Caption = 'Valor Total'
                Width = 110
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Percentual'
                Title.Caption = '%'
                Width = 54
                Visible = True
              end>
          end
          object BitBtn1: TBitBtn
            Left = 727
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
        object TabSheet7: TTabSheet
          Caption = 'Departamento'
          ImageIndex = 2
          object DBGrid7: TDBGrid
            Left = 0
            Top = 0
            Width = 721
            Height = 461
            DataSource = DataSource7
            DrawingStyle = gdsGradient
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = DBGrid1CellClick
            OnDrawColumnCell = DBGrid1DrawColumnCell
            OnTitleClick = DBGrid7TitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'Mes'
                Title.Caption = 'M'#234's/Ano'
                Width = 55
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Descricao'
                Title.Caption = 'Departamento'
                Width = 415
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Valor_Total'
                Title.Caption = 'Valor Total'
                Width = 110
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Percentual'
                Title.Caption = '%'
                Width = 54
                Visible = True
              end>
          end
          object BitBtn3: TBitBtn
            Left = 727
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
          Caption = 'Formas de Pagamento'
          ImageIndex = 3
          object DBGrid8: TDBGrid
            Left = 0
            Top = 0
            Width = 721
            Height = 461
            DataSource = DataSource8
            DrawingStyle = gdsGradient
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = DBGrid1CellClick
            OnDrawColumnCell = DBGrid1DrawColumnCell
            OnTitleClick = DBGrid8TitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'Mes'
                Title.Caption = 'M'#234's/Ano'
                Width = 55
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Descricao'
                Title.Caption = 'Forma de Pagamento'
                Width = 415
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Valor_Total'
                Title.Caption = 'Valor Total'
                Width = 110
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'Percentual'
                Title.Caption = '%'
                Width = 54
                Visible = True
              end>
          end
          object BitBtn4: TBitBtn
            Left = 727
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
      end
    end
  end
  object qryconsulta_lancamento: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select LF.*, CH.N_Cheque, CC.Conta, Forn.Nome_Fantasia as Nome, ' +
        'CP.Descricao, TD.Descricao, D.Descricao, PF.Plano, Nome = case w' +
        'hen (LF.Tipo = '#39#39') then'
      
        '(select Forn.Nome_Fantasia from Fornecedor Forn where LF.Codigo_' +
        'Cli_For = Forn.Codigo)'
      'when (LF.Tipo = '#39#39') then'
      
        '(select Cli.Nome_Nome_Fantasia from Cliente Cli where LF.Codigo_' +
        'Cli_For = Cli.Codigo) end from Lancamento_Financeiro LF'
      'left join Fornecedor Forn on(LF.Codigo_Cli_For = Forn.Codigo)'
      
        'left join Condicao_Pagamento CP on(LF.Codigo_Forma_Pagamento = C' +
        'P.Codigo)'
      
        'left join Tipo_Documento TD on(LF.Codigo_Tipo_Documento = TD.Cod' +
        'igo)'
      'left join Departamento D on(LF.Codigo_Departamento = D.Codigo)'
      'left join Plano_Financeiro PF on(LF.Codigo_Plano = PF.Codigo)'
      'left join Cheque CH on (PL.Codigo_Cheque = CH.Codigo)'
      'left join Conta_Corrente CC on (PL.Codigo_Conta = CC.Codigo)')
    Left = 751
    Top = 321
    object qryconsulta_lancamentoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryconsulta_lancamentoTipo: TStringField
      FieldName = 'Tipo'
      Size = 7
    end
    object qryconsulta_lancamentoN_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object qryconsulta_lancamentoCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qryconsulta_lancamentoCodigo_Forma_Pagamento: TIntegerField
      FieldName = 'Codigo_Forma_Pagamento'
    end
    object qryconsulta_lancamentoCodigo_Cli_For: TIntegerField
      FieldName = 'Codigo_Cli_For'
    end
    object qryconsulta_lancamentoCodigo_Tipo_Documento: TIntegerField
      FieldName = 'Codigo_Tipo_Documento'
    end
    object qryconsulta_lancamentoHistorico: TStringField
      FieldName = 'Historico'
      Size = 70
    end
    object qryconsulta_lancamentoCodigo_Departamento: TIntegerField
      FieldName = 'Codigo_Departamento'
    end
    object qryconsulta_lancamentoCodigo_Plano: TIntegerField
      FieldName = 'Codigo_Plano'
    end
    object qryconsulta_lancamentoData_Lancamento: TDateTimeField
      FieldName = 'Data_Lancamento'
    end
    object qryconsulta_lancamentoData_Vencimento: TDateTimeField
      FieldName = 'Data_Vencimento'
    end
    object qryconsulta_lancamentoValor_Documento: TFloatField
      FieldName = 'Valor_Documento'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_lancamentoDesconto: TFloatField
      FieldName = 'Desconto'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_lancamentoMulta: TFloatField
      FieldName = 'Multa'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_lancamentoValor_Cobrado: TFloatField
      FieldName = 'Valor_Cobrado'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_lancamentoObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 200
    end
    object qryconsulta_lancamentoStatus: TStringField
      FieldName = 'Status'
      Size = 15
    end
    object qryconsulta_lancamentoNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qryconsulta_lancamentoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object qryconsulta_lancamentoDescricao_1: TStringField
      FieldName = 'Descricao_1'
      Size = 30
    end
    object qryconsulta_lancamentoDescricao_2: TStringField
      FieldName = 'Descricao_2'
      Size = 30
    end
    object qryconsulta_lancamentoPlano: TStringField
      FieldName = 'Plano'
      Size = 100
    end
    object qryconsulta_lancamentoNome_1: TStringField
      FieldName = 'Nome_1'
      ReadOnly = True
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_lancamento
    Left = 711
    Top = 353
  end
  object ds_qry_consulta_parcelas: TDataSource
    DataSet = qryconsulta_parcelas
    Left = 847
    Top = 320
  end
  object qryconsulta_parcelas: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select PL.*, MC.Dinheiro, MC.Cheque_Vista, MC.Cheque_Prazo, MC.C' +
        'artao, MC.Juros, MC.Desconto from Parcelas_Lancamentos PL '
      
        'left join Movimento_Caixa MC on (PL.N_Documento = MC.N_Documento' +
        ')')
    Left = 815
    Top = 320
    object qryconsulta_parcelasCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryconsulta_parcelasN_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object qryconsulta_parcelasData_Vencimento: TDateTimeField
      FieldName = 'Data_Vencimento'
    end
    object qryconsulta_parcelasData_Pagamento: TDateTimeField
      FieldName = 'Data_Pagamento'
    end
    object qryconsulta_parcelasParcela: TIntegerField
      FieldName = 'Parcela'
    end
    object qryconsulta_parcelasStatus: TStringField
      FieldName = 'Status'
      Size = 8
    end
    object qryconsulta_parcelasValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_parcelasDinheiro: TFloatField
      FieldName = 'Dinheiro'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_parcelasCheque_Vista: TFloatField
      FieldName = 'Cheque_Vista'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_parcelasCheque_Prazo: TFloatField
      FieldName = 'Cheque_Prazo'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_parcelasCartao: TFloatField
      FieldName = 'Cartao'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_parcelasJuros: TFloatField
      FieldName = 'Juros'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_parcelasDesconto: TFloatField
      FieldName = 'Desconto'
      DisplayFormat = '#0.0,0'
    end
  end
  object qryconsulta_lancamento_sintetico: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select CH.N_Cheque, CC.Conta, PL.Codigo, PL.N_Documento, LF.Codi' +
        'go_Empresa, LF.Tipo, LF.Codigo_Cli_For, '
      
        'LF.Historico, LF.Data_Lancamento, PL.Data_Vencimento, PL.Data_Pa' +
        'gamento, PL.Valor, PL.Valor_Pagar, '
      
        'PL.Valor_Pago, PL.Valor_Restante, PL.Status, datediff(day, getDa' +
        'te(), PL.Data_Vencimento) as Dias_Venc,'
      'Nome = case when (LF.Tipo = '#39'PAGAR'#39') then'
      
        '(select Forn.Nome_Fantasia from Fornecedor Forn where LF.Codigo_' +
        'Cli_For = Forn.Codigo)'
      'when (LF.Tipo = '#39'RECEBER'#39') then'
      
        '(select Cli.Nome_Nome_Fantasia from Cliente Cli where LF.Codigo_' +
        'Cli_For = Cli.Codigo) end,'
      
        'CP.Descricao as Cond_Pag, CP.Tipo_Pagamento, PF.Descricao as Pla' +
        'no_Financeiro, Dep.Descricao as Departamento'
      'from Lancamento_Financeiro LF'
      'left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)'
      'left join Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo)'
      'left join Cheque CH on (PL.Codigo_Cheque = CH.Codigo)'
      'left join Conta_Corrente CC on (PL.Codigo_Conta = CC.Codigo)'
      
        'left join Condicao_Pagamento CP on (PL.Codigo_Forma_Pagamento_Pa' +
        'rcela = CP.Codigo)'
      'left join Plano_Financeiro PF on (LF.Codigo_Plano = PF.Codigo)'
      
        'left join Departamento Dep on (LF.Codigo_Departamento = Dep.Codi' +
        'go)')
    Left = 567
    Top = 425
    object qryconsulta_lancamento_sinteticoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryconsulta_lancamento_sinteticoN_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object qryconsulta_lancamento_sinteticoCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qryconsulta_lancamento_sinteticoTipo: TStringField
      FieldName = 'Tipo'
      Size = 7
    end
    object qryconsulta_lancamento_sinteticoCodigo_Cli_For: TIntegerField
      FieldName = 'Codigo_Cli_For'
    end
    object qryconsulta_lancamento_sinteticoHistorico: TStringField
      FieldName = 'Historico'
      Size = 70
    end
    object qryconsulta_lancamento_sinteticoData_Lancamento: TDateTimeField
      FieldName = 'Data_Lancamento'
    end
    object qryconsulta_lancamento_sinteticoData_Vencimento: TDateTimeField
      FieldName = 'Data_Vencimento'
    end
    object qryconsulta_lancamento_sinteticoValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_lancamento_sinteticoStatus: TStringField
      FieldName = 'Status'
      Size = 8
    end
    object qryconsulta_lancamento_sinteticoNome: TStringField
      FieldName = 'Nome'
      ReadOnly = True
      Size = 50
    end
    object qryconsulta_lancamento_sinteticoN_Cheque: TStringField
      FieldName = 'N_Cheque'
    end
    object qryconsulta_lancamento_sinteticoConta: TStringField
      FieldName = 'Conta'
    end
    object qryconsulta_lancamento_sinteticoData_Pagamento: TDateTimeField
      FieldName = 'Data_Pagamento'
      OnGetText = qryconsulta_lancamento_sinteticoData_PagamentoGetText
    end
    object qryconsulta_lancamento_sinteticoValor_Pagar: TFloatField
      FieldName = 'Valor_Pagar'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_lancamento_sinteticoDias_Venc: TIntegerField
      FieldName = 'Dias_Venc'
      ReadOnly = True
    end
    object qryconsulta_lancamento_sinteticoCond_Pag: TStringField
      FieldName = 'Cond_Pag'
      Size = 30
    end
    object qryconsulta_lancamento_sinteticoValor_Pago: TFloatField
      FieldName = 'Valor_Pago'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_lancamento_sinteticoValor_Restante: TFloatField
      FieldName = 'Valor_Restante'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_lancamento_sinteticoTipo_Pagamento: TStringField
      FieldName = 'Tipo_Pagamento'
    end
    object qryconsulta_lancamento_sinteticoPlano_Financeiro: TStringField
      FieldName = 'Plano_Financeiro'
      Size = 300
    end
    object qryconsulta_lancamento_sinteticoDepartamento: TStringField
      FieldName = 'Departamento'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = qryconsulta_lancamento_sintetico
    Left = 599
    Top = 425
  end
  object qrypagar_agrupado: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select CH.N_Cheque, CC.Conta, PL.Codigo, PL.N_Documento, LF.Hist' +
        'orico, '
      'LF.Data_Lancamento, PL.Data_Vencimento, PL.Data_Pagamento, '
      
        'PL.Valor, PL.Valor_Pagar, PL.Valor_Pago, PL.Valor_Restante, PL.S' +
        'tatus, Forn.Nome_Fantasia'
      'from Lancamento_Financeiro LF'
      'left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)'
      'left join Fornecedor Forn on(LF.Codigo_Cli_For = Forn.Codigo)'
      'left join Cheque CH on (PL.Codigo_Cheque = CH.Codigo)'
      'left join Conta_Corrente CC on (PL.Codigo_Conta = CC.Codigo)')
    Left = 823
    Top = 409
    object qrypagar_agrupadoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrypagar_agrupadoN_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object qrypagar_agrupadoHistorico: TStringField
      FieldName = 'Historico'
      Size = 70
    end
    object qrypagar_agrupadoData_Lancamento: TDateTimeField
      FieldName = 'Data_Lancamento'
    end
    object qrypagar_agrupadoData_Vencimento: TDateTimeField
      FieldName = 'Data_Vencimento'
    end
    object qrypagar_agrupadoData_Pagamento: TDateTimeField
      FieldName = 'Data_Pagamento'
    end
    object qrypagar_agrupadoValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#0.0,0'
    end
    object qrypagar_agrupadoStatus: TStringField
      FieldName = 'Status'
      Size = 8
    end
    object qrypagar_agrupadoNome_Fantasia: TStringField
      FieldName = 'Nome_Fantasia'
      Size = 50
    end
    object qrypagar_agrupadoN_Cheque: TStringField
      FieldName = 'N_Cheque'
    end
    object qrypagar_agrupadoConta: TStringField
      FieldName = 'Conta'
    end
    object qrypagar_agrupadoValor_Pagar: TFloatField
      FieldName = 'Valor_Pagar'
      DisplayFormat = '#0.0,0'
    end
    object qrypagar_agrupadoValor_Pago: TFloatField
      FieldName = 'Valor_Pago'
      DisplayFormat = '#0.0,0'
    end
    object qrypagar_agrupadoValor_Restante: TFloatField
      FieldName = 'Valor_Restante'
      DisplayFormat = '#0.0,0'
    end
  end
  object DataSource2: TDataSource
    DataSet = qrypagar_agrupado
    Left = 815
    Top = 449
  end
  object DataSource3: TDataSource
    DataSet = qryreceber_agrupado
    Left = 855
    Top = 449
  end
  object qryreceber_agrupado: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select CH.N_Cheque, CC.Conta, PL.Codigo, PL.N_Documento, LF.Hist' +
        'orico, '
      'LF.Data_Lancamento, PL.Data_Vencimento, PL.Data_Pagamento, '
      
        'PL.Valor, PL.Valor_Pagar, PL.Valor_Pago, PL.Valor_Restante, PL.S' +
        'tatus, Cli.Nome_Nome_Fantasia'
      'from Lancamento_Financeiro LF'
      'left join Parcelas_Lancamentos PL on (LF.Codigo = PL.Codigo)'
      'left join Cliente Cli on(LF.Codigo_Cli_For = Cli.Codigo)'
      'left join Cheque CH on (PL.Codigo_Cheque = CH.Codigo)'
      'left join Conta_Corrente CC on (PL.Codigo_Conta = CC.Codigo)')
    Left = 855
    Top = 401
    object qryreceber_agrupadoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryreceber_agrupadoN_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object qryreceber_agrupadoHistorico: TStringField
      FieldName = 'Historico'
      Size = 70
    end
    object qryreceber_agrupadoData_Lancamento: TDateTimeField
      FieldName = 'Data_Lancamento'
    end
    object qryreceber_agrupadoData_Vencimento: TDateTimeField
      FieldName = 'Data_Vencimento'
    end
    object qryreceber_agrupadoData_Pagamento: TDateTimeField
      FieldName = 'Data_Pagamento'
    end
    object qryreceber_agrupadoValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#0.0,0'
    end
    object qryreceber_agrupadoStatus: TStringField
      FieldName = 'Status'
      Size = 8
    end
    object qryreceber_agrupadoNome_Nome_Fantasia: TStringField
      FieldName = 'Nome_Nome_Fantasia'
      Size = 50
    end
    object qryreceber_agrupadoN_Cheque: TStringField
      FieldName = 'N_Cheque'
    end
    object qryreceber_agrupadoConta: TStringField
      FieldName = 'Conta'
    end
    object qryreceber_agrupadoValor_Pagar: TFloatField
      FieldName = 'Valor_Pagar'
      DisplayFormat = '#0.0,0'
    end
    object qryreceber_agrupadoValor_Pago: TFloatField
      FieldName = 'Valor_Pago'
      DisplayFormat = '#0.0,0'
    end
    object qryreceber_agrupadoValor_Restante: TFloatField
      FieldName = 'Valor_Restante'
      DisplayFormat = '#0.0,0'
    end
  end
  object QRCompositeReport1: TQRCompositeReport
    Options = []
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrinterSettings.Orientation = poPortrait
    PrinterSettings.PaperSize = Letter
    PageCount = 0
    Left = 725
    Top = 280
  end
  object DataSource4: TDataSource
    DataSet = qryagrupado_plano
    Left = 815
    Top = 369
  end
  object qryagrupado_plano: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select Y.Mes,'
      '       Y.Descricao,'
      #9'   Y.Valor_Total,'
      #9'   (Y.Valor_Total / Y.Total_Geral) * 100 as Percentual'
      'from('
      #9'   select'
      #9'   case when grouping(PF.Descricao) = 0 then PF.Descricao '
      #9#9#9'when grouping(PF.Descricao) = 1  then '#39'TOTAL------>'#39' '
      #9'   end as Descricao, '
      ''
      '       sum(tip.Valor_Pagar) as Valor_Total,'
      
        #9'   convert(varchar(2),month(tip.Data_Vencimento)) + '#39'/'#39' + conve' +
        'rt(varchar(4),year(tip.Data_Vencimento)) as Mes,'
      '      (select sum(tip.Valor_Pagar) from Parcelas_Lancamentos tip'
      
        '      left join Lancamento_Financeiro t on (tip.Codigo = t.Codig' +
        'o)'
      
        '      where tip.Data_Vencimento between '#39'01/01/2013'#39' and '#39'31/05/' +
        '2013'#39' and tip.Status = '#39'PAGO'#39') as Total_Geral '
      '       '
      '        from Parcelas_Lancamentos tip'
      'left join Lancamento_Financeiro t on (tip.Codigo = t.Codigo)'
      'left join Plano_Financeiro PF on (t.Codigo_Plano = PF.Codigo)'
      
        'where tip.Data_Vencimento between '#39'01/01/2013'#39' and '#39'31/05/2013'#39' ' +
        'and tip.Status = '#39'PAGO'#39
      
        'group by convert(varchar(2),month(tip.Data_Vencimento)) + '#39'/'#39' + ' +
        'convert(varchar(4),year(tip.Data_Vencimento)), PF.Codigo_SubNive' +
        'l, PF.Descricao'
      'with RollUP) Y ')
    Left = 815
    Top = 289
    object qryagrupado_planoMes: TStringField
      FieldName = 'Mes'
      ReadOnly = True
      Size = 7
    end
    object qryagrupado_planoDescricao: TStringField
      FieldName = 'Descricao'
      ReadOnly = True
      Size = 300
    end
    object qryagrupado_planoValor_Total: TFloatField
      FieldName = 'Valor_Total'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
    object qryagrupado_planoPercentual: TFloatField
      FieldName = 'Percentual'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
  end
  object qryagrupado_cli_forn: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select Y.Mes,'
      '       Y.Nome,'
      #9'   Y.Valor_Total,'
      #9'   (Y.Valor_Total / Y.Total_Geral) * 100 as Percentual'
      'from('
      #9'   select'
      #9#9'case when (t.Tipo = '#39'PAGAR'#39') then'
      
        #9#9'(select Forn.Nome_Fantasia from Fornecedor Forn where t.Codigo' +
        '_Cli_For = Forn.Codigo)'
      #9#9'when (t.Tipo = '#39'RECEBER'#39') then'
      
        #9#9'(select Cli.Nome_Nome_Fantasia from Cliente Cli where t.Codigo' +
        '_Cli_For = Cli.Codigo) end as Nome,'
      #9'   '
      '       sum(tip.Valor_Pagar) as Valor_Total,'
      
        #9'   convert(varchar(2),month(tip.Data_Vencimento)) + '#39'/'#39' + conve' +
        'rt(varchar(4),year(tip.Data_Vencimento)) as Mes,'
      '      (select sum(tip.Valor_Pagar) from Parcelas_Lancamentos tip'
      
        '      left join Lancamento_Financeiro t on (tip.Codigo = t.Codig' +
        'o)'
      
        '      where tip.Data_Vencimento between '#39'01/01/2013'#39' and '#39'31/05/' +
        '2013'#39' and tip.Status = '#39'PENDENTE'#39' and t.Tipo = '#39'PAGAR'#39') as Total' +
        '_Geral '
      '       '
      '        from Parcelas_Lancamentos tip'
      'left join Lancamento_Financeiro t on (tip.Codigo = t.Codigo)'
      'left join Plano_Financeiro PF on (t.Codigo_Plano = PF.Codigo)'
      
        'where tip.Data_Vencimento between '#39'01/01/2013'#39' and '#39'31/05/2013'#39' ' +
        'and tip.Status = '#39'PENDENTE'#39' and t.Tipo = '#39'PAGAR'#39
      
        'group by t.Tipo, convert(varchar(2),month(tip.Data_Vencimento)) ' +
        '+ '#39'/'#39' + convert(varchar(4),year(tip.Data_Vencimento)), t.Codigo_' +
        'Cli_For'
      'with rollup ) Y ')
    Left = 855
    Top = 289
    object qryagrupado_cli_fornMes: TStringField
      FieldName = 'Mes'
      ReadOnly = True
      Size = 7
    end
    object qryagrupado_cli_fornNome: TStringField
      FieldName = 'Nome'
      ReadOnly = True
      Size = 50
    end
    object qryagrupado_cli_fornValor_Total: TFloatField
      FieldName = 'Valor_Total'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
    object qryagrupado_cli_fornPercentual: TFloatField
      FieldName = 'Percentual'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
  end
  object DataSource5: TDataSource
    DataSet = qryagrupado_cli_forn
    Left = 887
    Top = 369
  end
  object qryconsulta_lancamento_sintetico2: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select Y.Tipo_Pagamento,'
      '       Y.Nome,'
      #9'   Y.Valor_Total,'
      #9'   (Y.Valor_Total / Y.Total_Geral) * 100 as Percentual'
      'from('
      #9'   select'
      #9#9'case when (t.Tipo = '#39'PAGAR'#39') then'
      
        #9#9'(select Forn.Nome_Fantasia from Fornecedor Forn where t.Codigo' +
        '_Cli_For = Forn.Codigo)'
      #9#9'when (t.Tipo = '#39'RECEBER'#39') then'
      
        #9#9'(select Cli.Nome_Nome_Fantasia from Cliente Cli where t.Codigo' +
        '_Cli_For = Cli.Codigo) end as Nome,'
      #9'   '
      '       sum(tip.Valor_Pagar) as Valor_Total,'
      '       '
      
        '       case when GROUPING(CP.Tipo_Pagamento) = 0 then CP.Tipo_Pa' +
        'gamento'
      
        #9#9#9'when GROUPING(CP.Tipo_Pagamento) = 1 then '#39'TOTAL--->'#39' end as ' +
        'Tipo_Pagamento,'
      #9#9#9
      '      (select sum(tip.Valor_Pagar) from Parcelas_Lancamentos tip'
      
        '      left join Lancamento_Financeiro t on (tip.Codigo = t.Codig' +
        'o)'
      
        '      where tip.Data_Vencimento between '#39'01/01/2013'#39' and '#39'07/07/' +
        '2013'#39' and tip.Status = '#39'PENDENTE'#39' and t.Tipo = '#39'PAGAR'#39') as Total' +
        '_Geral '
      '       '
      '        from Parcelas_Lancamentos tip'
      'left join Lancamento_Financeiro t on (tip.Codigo = t.Codigo)'
      
        'left join Condicao_Pagamento CP on (t.Codigo_Forma_Pagamento = C' +
        'P.Codigo)'
      
        'where tip.Data_Vencimento between '#39'01/01/2013'#39' and '#39'07/07/2013'#39' ' +
        'and tip.Status = '#39'PENDENTE'#39' and t.Tipo = '#39'PAGAR'#39
      'group by t.Tipo, CP.Tipo_Pagamento, t.Codigo_Cli_For'
      'with rollup ) Y ')
    Left = 703
    Top = 425
    object qryconsulta_lancamento_sintetico2Tipo_Pagamento: TStringField
      FieldName = 'Tipo_Pagamento'
      ReadOnly = True
    end
    object qryconsulta_lancamento_sintetico2Nome: TStringField
      FieldName = 'Nome'
      ReadOnly = True
      Size = 50
    end
    object qryconsulta_lancamento_sintetico2Valor_Total: TFloatField
      Alignment = taCenter
      FieldName = 'Valor_Total'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_lancamento_sintetico2Percentual: TFloatField
      Alignment = taCenter
      FieldName = 'Percentual'
      ReadOnly = True
      DisplayFormat = '#0.0,0'
    end
  end
  object DataSource6: TDataSource
    DataSet = qryconsulta_lancamento_sintetico2
    Left = 735
    Top = 425
  end
  object qryagrupado_departamento: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select Y.Mes,'
      '       Y.Descricao,'
      #9'   Y.Valor_Total,'
      #9'   (Y.Valor_Total / Y.Total_Geral) * 100 as Percentual'
      'from('
      #9'   select'
      #9'   case when grouping(D.Descricao) = 0 then D.Descricao '
      #9#9#9'when grouping(D.Descricao) = 1  then '#39'TOTAL------>'#39' '
      #9'   end as Descricao, '
      ''
      '       sum(tip.Valor_Pagar) as Valor_Total,'
      
        #9'   convert(varchar(2),month(tip.Data_Vencimento)) + '#39'/'#39' + conve' +
        'rt(varchar(4),year(tip.Data_Vencimento)) as Mes,'
      '      (select sum(tip.Valor_Pagar) from Parcelas_Lancamentos tip'
      
        '      left join Lancamento_Financeiro t on (tip.Codigo = t.Codig' +
        'o)'
      
        '      where tip.Data_Vencimento between '#39'01/01/2013'#39' and '#39'31/05/' +
        '2013'#39' and tip.Status = '#39'PAGO'#39') as Total_Geral '
      '       '
      '        from Parcelas_Lancamentos tip'
      'left join Lancamento_Financeiro t on (tip.Codigo = t.Codigo)'
      'left join Departamento D on (t.Codigo_Departamento = D.Codigo)'
      
        'where tip.Data_Vencimento between '#39'01/01/2013'#39' and '#39'31/05/2013'#39' ' +
        'and tip.Status = '#39'PAGO'#39
      
        'group by convert(varchar(2),month(tip.Data_Vencimento)) + '#39'/'#39' + ' +
        'convert(varchar(4),year(tip.Data_Vencimento)), D.Descricao'
      'with RollUP) Y ')
    Left = 895
    Top = 289
    object qryagrupado_departamentoMes: TStringField
      FieldName = 'Mes'
      ReadOnly = True
      Size = 7
    end
    object qryagrupado_departamentoDescricao: TStringField
      FieldName = 'Descricao'
      ReadOnly = True
      Size = 30
    end
    object qryagrupado_departamentoValor_Total: TFloatField
      FieldName = 'Valor_Total'
      ReadOnly = True
      DisplayFormat = 'R$ #0.0,0'
      currency = True
    end
    object qryagrupado_departamentoPercentual: TFloatField
      FieldName = 'Percentual'
      ReadOnly = True
      DisplayFormat = '#0.0,0 %'
    end
  end
  object DataSource7: TDataSource
    DataSet = qryagrupado_departamento
    Left = 903
    Top = 337
  end
  object qryagrupado_forma_pagamento: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select Y.Mes,'
      '       Y.Descricao,'
      #9'   Y.Valor_Total,'
      #9'   (Y.Valor_Total / Y.Total_Geral) * 100 as Percentual'
      'from('
      #9'   select'
      #9'   case when grouping(CP.Descricao) = 0 then CP.Descricao '
      #9#9#9'when grouping(CP.Descricao) = 1  then '#39'TOTAL------>'#39' '
      #9'   end as Descricao, '
      ''
      '       sum(tip.Valor_Pagar) as Valor_Total,'
      
        #9'   convert(varchar(2),month(tip.Data_Vencimento)) + '#39'/'#39' + conve' +
        'rt(varchar(4),year(tip.Data_Vencimento)) as Mes,'
      '      (select sum(tip.Valor_Pagar) from Parcelas_Lancamentos tip'
      
        '      left join Lancamento_Financeiro t on (tip.Codigo = t.Codig' +
        'o)'
      
        '      where tip.Data_Vencimento between '#39'01/01/2013'#39' and '#39'31/05/' +
        '2013'#39' and tip.Status = '#39'PAGO'#39') as Total_Geral '
      '       '
      '        from Parcelas_Lancamentos tip'
      'left join Lancamento_Financeiro t on (tip.Codigo = t.Codigo)'
      
        'left join Condicao_Pagamento CP on (tip.Codigo_Forma_Pagamento_P' +
        'arcela = CP.Codigo)'
      
        'where tip.Data_Vencimento between '#39'01/01/2013'#39' and '#39'31/05/2013'#39' ' +
        'and tip.Status = '#39'PAGO'#39
      
        'group by convert(varchar(2),month(tip.Data_Vencimento)) + '#39'/'#39' + ' +
        'convert(varchar(4),year(tip.Data_Vencimento)), CP.Descricao'
      'with RollUP) Y ')
    Left = 903
    Top = 249
    object qryagrupado_forma_pagamentoMes: TStringField
      FieldName = 'Mes'
      ReadOnly = True
      Size = 7
    end
    object qryagrupado_forma_pagamentoDescricao: TStringField
      FieldName = 'Descricao'
      ReadOnly = True
      Size = 30
    end
    object qryagrupado_forma_pagamentoValor_Total: TFloatField
      FieldName = 'Valor_Total'
      ReadOnly = True
      DisplayFormat = 'R$ #0.0,0'
    end
    object qryagrupado_forma_pagamentoPercentual: TFloatField
      FieldName = 'Percentual'
      ReadOnly = True
      DisplayFormat = '#0.0,0 %'
    end
  end
  object DataSource8: TDataSource
    DataSet = qryagrupado_forma_pagamento
    Left = 927
    Top = 385
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
        Component = cxGrid1DBTableView1Cond_Pag
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Conta
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Data_Lancamento
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Data_Pagamento
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Data_Vencimento
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Departamento
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Dias_Venc
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Historico
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Nome
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1N_Cheque
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
        Component = cxGrid1DBTableView1Plano_Financeiro
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
        Component = cxGrid1DBTableView1Tipo_Pagamento
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
      end
      item
        Component = cxGrid1DBTableView1Valor_Pagar
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Valor_Pago
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView1Valor_Restante
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
        Component = cxGrid1DBTableView2Codigo_Lancamento_Financeiro
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Data_Cadastro
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Data_Cobranca
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2N_Documento
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Observacoes
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Origem_Atendimento
        Properties.Strings = (
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGrid1DBTableView2Responsavel_Atendimento
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
      PrinterPage.GrayShading = True
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
  object qryconsulta_ocorrencia: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Lancamento_Financeiro_Ocorrencia_Cobranca'
      'order by Codigo, Codigo_Lancamento_Financeiro, N_Documento')
    Left = 303
    Top = 369
    object qryconsulta_ocorrenciaCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryconsulta_ocorrenciaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qryconsulta_ocorrenciaData_Cobranca: TDateTimeField
      FieldName = 'Data_Cobranca'
    end
    object qryconsulta_ocorrenciaResponsavel_Atendimento: TStringField
      FieldName = 'Responsavel_Atendimento'
      Size = 50
    end
    object qryconsulta_ocorrenciaOrigem_Atendimento: TIntegerField
      FieldName = 'Origem_Atendimento'
      OnGetText = qryconsulta_ocorrenciaOrigem_AtendimentoGetText
    end
    object qryconsulta_ocorrenciaCodigo_Lancamento_Financeiro: TIntegerField
      FieldName = 'Codigo_Lancamento_Financeiro'
    end
    object qryconsulta_ocorrenciaN_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object qryconsulta_ocorrenciaObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 800
    end
  end
  object DataSource9: TDataSource
    DataSet = qryconsulta_ocorrencia
    Left = 335
    Top = 369
  end
end
