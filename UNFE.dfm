object FrmNFE: TFrmNFE
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Emiss'#227'o de NFe/NFCe'
  ClientHeight = 467
  ClientWidth = 951
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 137
    Top = 0
    Width = 814
    Height = 467
    Cursor = crHandPoint
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Identifica'#231#227'o da NFe'
      object LblData_Cadastro: TLabel
        Left = 88
        Top = 18
        Width = 46
        Height = 13
        Caption = 'Emiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblMarca: TLabel
        Left = 0
        Top = 18
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
      object LblData_Compra: TLabel
        Left = 148
        Top = 18
        Width = 47
        Height = 13
        Caption = 'Ent./Sai.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 309
        Top = 96
        Width = 29
        Height = 13
        Caption = 'Serie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 0
        Top = 57
        Width = 37
        Height = 13
        Caption = 'C.F.O.P'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 246
        Top = 96
        Width = 41
        Height = 13
        Caption = 'Modelo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 372
        Top = 95
        Width = 78
        Height = 13
        Caption = 'Chave Acesso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 95
        Top = 95
        Width = 104
        Height = 13
        Caption = 'Forma Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label83: TLabel
        Left = 0
        Top = 95
        Width = 24
        Height = 13
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblStatus: TLabel
        Left = 439
        Top = 52
        Width = 55
        Height = 13
        Caption = 'Status OS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object EdtCodigo_Pedido: TEdit
        Left = 184
        Top = 34
        Width = 65
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        NumbersOnly = True
        TabOrder = 4
        OnKeyDown = EdtN_Nota_FiscalKeyDown
        OnKeyPress = EdtN_Nota_FiscalKeyPress
      end
      object MEdtData_Emissao: TMaskEdit
        Left = 88
        Top = 34
        Width = 61
        Height = 17
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
        OnEnter = MEdtData_EmissaoEnter
        OnExit = MEdtData_EmissaoExit
      end
      object EdtN_Nota_Fiscal: TEdit
        Left = 0
        Top = 34
        Width = 89
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        NumbersOnly = True
        TabOrder = 0
        OnKeyDown = EdtN_Nota_FiscalKeyDown
        OnKeyPress = EdtN_Nota_FiscalKeyPress
      end
      object MEdtData_Entrada_Saida: TMaskEdit
        Left = 148
        Top = 34
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
        OnEnter = MEdtData_Entrada_SaidaEnter
        OnExit = MEdtData_Entrada_SaidaExit
      end
      object EdtSerie: TEdit
        Left = 309
        Top = 111
        Width = 64
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 12
      end
      object EdtCodigo_CFOP: TEdit
        Left = 0
        Top = 72
        Width = 62
        Height = 17
        Hint = 'Pressione F3 para consultar'
        BevelEdges = [beLeft, beTop, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clMenu
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnKeyDown = EdtCodigo_CFOPKeyDown
        OnKeyPress = EdtCodigo_CFOPKeyPress
      end
      object EdtCFOP: TEdit
        Left = 60
        Top = 72
        Width = 372
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 8
        OnKeyPress = EdtCFOPKeyPress
      end
      object MEdtHora_Entrada_Saida: TMaskEdit
        Left = 208
        Top = 34
        Width = 41
        Height = 17
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 3
        Text = '  :  '
        OnDblClick = MEdtHora_Entrada_SaidaDblClick
        OnEnter = MEdtHora_Entrada_SaidaEnter
      end
      object EdtModelo: TEdit
        Left = 246
        Top = 111
        Width = 64
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 11
      end
      object EdtChave_Acesso: TEdit
        Left = 372
        Top = 111
        Width = 413
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 13
        OnKeyDown = EdtN_Nota_FiscalKeyDown
      end
      object RGTipo_Operacao: TRadioGroup
        Left = 336
        Top = 19
        Width = 97
        Height = 47
        Caption = 'Tipo de Opera'#231#227'o'
        ItemIndex = 1
        Items.Strings = (
          '0 - Entrada'
          '1 - Saida')
        TabOrder = 5
      end
      object CmbForma_Pagamento: TComboBox
        Left = 95
        Top = 111
        Width = 145
        Height = 18
        BevelInner = bvNone
        BevelKind = bkFlat
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 20
        ParentFont = False
        TabOrder = 10
        Items.Strings = (
          'PAGAMENTO '#192' VISTA'
          'PAGAMENTO '#192' PRAZO'
          'OUTROS')
      end
      object CMBTipo_Nota: TComboBox
        Left = 0
        Top = 111
        Width = 89
        Height = 21
        BevelInner = bvNone
        BevelKind = bkFlat
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 9
        OnChange = CMBTipo_NotaChange
        Items.Strings = (
          'NF-E'
          'NFC-E')
      end
      object CmbStatus: TDBLookupComboBox
        Left = 440
        Top = 68
        Width = 145
        Height = 21
        KeyField = 'Codigo'
        ListField = 'Descricao'
        ListSource = DM.DataSource9
        TabOrder = 14
        Visible = False
      end
      object RGFinalidade: TRadioGroup
        Left = 600
        Top = 27
        Width = 185
        Height = 78
        Caption = 'Finalidade'
        ItemIndex = 0
        Items.Strings = (
          '1- NF-e Normal'
          '2- NF-e Complementar'
          '3- NF-e de ajuste'
          '4- Devolu'#231#227'o de Mercadoria')
        TabOrder = 15
        OnClick = RGFinalidadeClick
      end
      object cbVisualizarDANFE: TCheckBox
        Left = 439
        Top = 34
        Width = 161
        Height = 17
        Caption = 'Visulizar DANFE ao gerar NFe?'
        TabOrder = 6
      end
      object PageControl3: TPageControl
        Left = 0
        Top = 135
        Width = 808
        Height = 301
        Cursor = crHandPoint
        ActivePage = TabSheet12
        Style = tsFlatButtons
        TabOrder = 16
        object TabSheet12: TTabSheet
          Caption = 'Pedidos para Emiss'#227'o da NFe/NFCe'
          object Label17: TLabel
            Left = 0
            Top = 248
            Width = 790
            Height = 22
            Caption = 
              'Para emitir uma NFe contemplando apenas UM PEDIDO, d'#234' duplo cliq' +
              'ue no pedido desejado.'#13#10'Para emitir uma NFe contemplando V'#193'RIOS ' +
              'PEDIDOS, utilize os filtros de cada campo para filtrar os pedido' +
              's desejados e clique no bot'#227'o Confirmar Pedido(s).'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object cxGrid1: TcxGrid
            Left = 0
            Top = 0
            Width = 682
            Height = 246
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            LookAndFeel.NativeStyle = False
            object cxGrid1DBTableView1: TcxGridDBTableView
              OnDblClick = cxGrid1DBTableView1DblClick
              OnKeyDown = cxGrid1DBTableView1KeyDown
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
              FilterBox.CustomizeDialog = False
              FilterBox.Position = fpTop
              FilterBox.Visible = fvAlways
              DataController.DataModeController.SmartRefresh = True
              DataController.DataSource = DataSource3
              DataController.Filter.OnChanged = cxGrid1DBTableView1DataControllerFilterChanged
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Kind = skCount
                  FieldName = 'Codigo'
                  Column = cxGrid1DBTableView1Codigo
                end>
              DataController.Summary.SummaryGroups = <>
              DateTimeHandling.DateFormat = 'DD/MM/YYYY'
              Filtering.ColumnFilteredItemsList = True
              Filtering.ColumnPopup.MaxDropDownItemCount = 20
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
              OptionsView.GroupByBox = False
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
                Width = 56
              end
              object cxGrid1DBTableView1N_Pedido: TcxGridDBColumn
                Caption = 'N'#186' Pedido'
                DataBinding.FieldName = 'N_Pedido'
                FooterAlignmentHorz = taCenter
                Options.Editing = False
                SortIndex = 0
                SortOrder = soDescending
                Width = 89
              end
              object cxGrid1DBTableView1Data_Venda: TcxGridDBColumn
                Caption = 'Data Venda'
                DataBinding.FieldName = 'Data_Venda'
                Options.Editing = False
                Width = 77
              end
              object cxGrid1DBTableView1Total_Pedido: TcxGridDBColumn
                Caption = 'Total Pedido'
                DataBinding.FieldName = 'Total_Pedido'
                Options.Editing = False
                Width = 87
              end
              object cxGrid1DBTableView1CodCli: TcxGridDBColumn
                DataBinding.FieldName = 'CodCli'
                Visible = False
                Options.Editing = False
              end
              object cxGrid1DBTableView1Nome_Nome_Fantasia: TcxGridDBColumn
                Caption = 'Cliente'
                DataBinding.FieldName = 'Nome_Nome_Fantasia'
                Options.Editing = False
                SortIndex = 1
                SortOrder = soAscending
                Width = 178
              end
              object cxGrid1DBTableView1Razao_Social: TcxGridDBColumn
                DataBinding.FieldName = 'Razao_Social'
                Visible = False
                Options.Editing = False
              end
              object cxGrid1DBTableView1Email: TcxGridDBColumn
                DataBinding.FieldName = 'Email'
                Visible = False
                Options.Editing = False
              end
              object cxGrid1DBTableView1Endereco: TcxGridDBColumn
                DataBinding.FieldName = 'Endereco'
                Visible = False
                Options.Editing = False
              end
              object cxGrid1DBTableView1Status: TcxGridDBColumn
                DataBinding.FieldName = 'Status'
                Options.Editing = False
                Width = 77
              end
              object cxGrid1DBTableView1Tipo: TcxGridDBColumn
                DataBinding.FieldName = 'Tipo'
                Visible = False
                Options.Editing = False
                Width = 87
              end
              object cxGrid1DBTableView1CPF: TcxGridDBColumn
                DataBinding.FieldName = 'CPF'
                Visible = False
                Options.Editing = False
              end
              object cxGrid1DBTableView1CNPJ: TcxGridDBColumn
                DataBinding.FieldName = 'CNPJ'
                Visible = False
                Options.Editing = False
              end
              object cxGrid1DBTableView1Codigo_Municipio: TcxGridDBColumn
                DataBinding.FieldName = 'Codigo_Municipio'
                Visible = False
                Options.Editing = False
              end
              object cxGrid1DBTableView1Total_Produtos: TcxGridDBColumn
                DataBinding.FieldName = 'Total_Produtos'
                Visible = False
                Options.Editing = False
              end
              object cxGrid1DBTableView1Desc_Acr: TcxGridDBColumn
                DataBinding.FieldName = 'Desc_Acr'
                Visible = False
                Options.Editing = False
              end
              object cxGrid1DBTableView1TipoVenda: TcxGridDBColumn
                Caption = 'Tipo'
                DataBinding.FieldName = 'TipoVenda'
                Options.Editing = False
                Width = 69
              end
              object cxGrid1DBTableView1COO: TcxGridDBColumn
                DataBinding.FieldName = 'COO'
                Options.Editing = False
                Width = 79
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
          object BtnConfirmar: TcxButton
            Left = 683
            Top = 0
            Width = 117
            Height = 25
            Hint = 
              '*Confirma os pedidos selecionados nesta grade.'#13#10'*Essa op'#231#227'o s'#243' '#233 +
              ' permitida quando emitir v'#225'rios produtos de v'#225'rios pedidos em um' +
              'a '#250'nica NFe.'
            Caption = 'Confirmar Pedido(s)'
            Enabled = False
            OptionsImage.ImageIndex = 3
            OptionsImage.Images = DM.ImageList1
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = BtnConfirmarClick
          end
          object BtnAnular: TcxButton
            Left = 683
            Top = 31
            Width = 117
            Height = 25
            Hint = 
              '*Permite ocultar o pedido selecionado na emiss'#227'o da NFe.'#13#10'*O ped' +
              'ido ocultado n'#227'o ser'#225' exclu'#237'do do sistema, apenas ocultado desta' +
              ' grade de visualiza'#231#227'o.'
            Caption = 'Anular Pedido'
            OptionsImage.ImageIndex = 5
            OptionsImage.Images = DM.ImageList1
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = BtnAnularClick
          end
        end
        object TabSheet13: TTabSheet
          Caption = 'Informa'#231#245'es do(s) Pedido(s)'
          ImageIndex = 1
          object Label9: TLabel
            Left = -1
            Top = -1
            Width = 54
            Height = 13
            Caption = 'Pedido(s)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 713
            Top = 27
            Width = 51
            Height = 13
            Caption = 'Obs. Fisc.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 209
            Top = -1
            Width = 39
            Height = 13
            Caption = 'COO(s)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblValor: TLabel
            Left = 537
            Top = 102
            Width = 3
            Height = 13
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblValorParcelas: TLabel
            Left = 425
            Top = 102
            Width = 106
            Height = 13
            Caption = 'Valor das parcelas:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtCodigo_Obs_Fiscal: TEdit
            Left = 713
            Top = 46
            Width = 62
            Height = 17
            Hint = 'Pressione F3 para consultar'
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            Color = clMenu
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnDblClick = EdtCodigo_Obs_FiscalDblClick
            OnExit = EdtCodigo_Obs_FiscalExit
            OnKeyDown = EdtCodigo_Obs_FiscalKeyDown
            OnKeyPress = EdtCodigo_CFOPKeyPress
          end
          object MMOPedido: TMemo
            Left = 0
            Top = 12
            Width = 210
            Height = 58
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object DBGrid4: TDBGrid
            Left = 0
            Top = 71
            Width = 419
            Height = 199
            DataSource = DataSource4
            TabOrder = 5
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnKeyDown = DBGrid4KeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'NDoc'
                ReadOnly = True
                Title.Caption = 'N'#186' Doc.'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Data'
                Title.Caption = 'Vencimento'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DataPagamento'
                Title.Caption = 'Pagamento'
                Width = 68
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Valor'
                Width = 91
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Status'
                PickList.Strings = (
                  'PAGO'
                  'PENDENTE')
                Width = 71
                Visible = True
              end>
          end
          object BtnGerarParcela: TcxButton
            Left = 421
            Top = 71
            Width = 117
            Height = 25
            Hint = 
              '*A op'#231#227'o Gerar Parcela(s) estar'#225' dispon'#237'vel se, nas configura'#231#245'e' +
              's do sistema, estiver configurado para gerar financeiro na emiss' +
              #227'o da NFe'#13#10'e o CFOP permitir gerar financeiro.'
            Caption = 'Gerar Parcela(s)'
            OptionsImage.ImageIndex = 4
            OptionsImage.Images = DM.ImageList1
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = BtnGerarParcelaClick
          end
          object Memo1: TMemo
            Left = 216
            Top = 13
            Width = 97
            Height = 55
            TabOrder = 6
            Visible = False
          end
          object MMOCOO: TMemo
            Left = 209
            Top = 12
            Width = 210
            Height = 58
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ScrollBars = ssVertical
            TabOrder = 1
          end
          object BtnExcluirParcela: TcxButton
            Left = 581
            Top = 198
            Width = 117
            Height = 25
            Hint = 
              '*A op'#231#227'o Excluir Parcela(s) estar'#225' dispon'#237'vel se existirem parce' +
              'las para serem exclu'#237'das e satisfazer as condi'#231#245'es do bot'#227'o Gera' +
              'r Parcela(s)'
            Caption = 'Excluir Parcela(s)'
            OptionsImage.ImageIndex = 5
            OptionsImage.Images = DM.ImageList1
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            Visible = False
            OnClick = BtnExcluirParcelaClick
          end
          object GroupBox2: TGroupBox
            Left = 422
            Top = 6
            Width = 283
            Height = 64
            Caption = 'Informa'#231#245'es do Financeiro'
            TabOrder = 7
            object Label12: TLabel
              Left = 201
              Top = 21
              Width = 62
              Height = 13
              Caption = 'Prim. Venc.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label16: TLabel
              Left = 3
              Top = 21
              Width = 58
              Height = 13
              Caption = 'Cond. Pag.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object MEdtData_Primeiro_Vencimento: TMaskEdit
              Left = 201
              Top = 40
              Width = 69
              Height = 17
              BevelInner = bvNone
              BevelOuter = bvRaised
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 0
              Text = '  /  /    '
              OnEnter = MEdtData_EmissaoEnter
            end
            object EdtCodigo_Condicao_Pagamento: TEdit
              Left = 3
              Top = 40
              Width = 62
              Height = 17
              Hint = 'Pressione F3 para consultar'
              BevelEdges = [beLeft, beTop, beBottom]
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              Color = clMenu
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 1
              OnDblClick = EdtCodigo_Condicao_PagamentoDblClick
              OnExit = EdtCodigo_Condicao_PagamentoExit
              OnKeyDown = EdtCodigo_Condicao_PagamentoKeyDown
            end
            object EdtCondicao_Pagamento: TEdit
              Left = 65
              Top = 40
              Width = 137
              Height = 17
              TabStop = False
              BevelEdges = [beTop, beRight, beBottom]
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              ReadOnly = True
              TabOrder = 2
              OnKeyPress = EdtCFOPKeyPress
            end
          end
          object GBInformarPagamento: TGroupBox
            Left = 544
            Top = 69
            Width = 253
            Height = 165
            Caption = 'Informar Pagamento NFCe'
            TabOrder = 8
            Visible = False
            object BtnInformar_Pagamento: TButton
              Left = 3
              Top = 23
              Width = 115
              Height = 25
              Caption = 'Informar Pagamentos'
              TabOrder = 0
              OnClick = BtnInformar_PagamentoClick
            end
            object DBGrid2: TDBGrid
              Left = 3
              Top = 54
              Width = 238
              Height = 103
              BorderStyle = bsNone
              DataSource = DM.ds_fechamento_Venda
              DrawingStyle = gdsGradient
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
              TabOrder = 1
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
                  FieldName = 'Forma_Pagamento'
                  Title.Caption = 'Forma de Pagamento'
                  Width = 117
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Data'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'Valor'
                  Width = 83
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Tipo_Documento'
                  Visible = False
                end>
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Emitente/Destinat'#225'rio - Retirada/Entrega'
      ImageIndex = 1
      object Label81: TLabel
        Left = 0
        Top = 3
        Width = 51
        Height = 13
        Caption = 'Emitente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label82: TLabel
        Left = 0
        Top = 176
        Width = 70
        Height = 13
        Caption = 'Destinat'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdtCodigo_Emitente: TEdit
        Left = 0
        Top = 21
        Width = 51
        Height = 17
        Hint = 'Pressione F3 para consultar'
        BevelEdges = [beLeft, beTop, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clMenu
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = EdtCodigo_EmitenteDblClick
        OnKeyDown = EdtCodigo_EmitenteKeyDown
        OnKeyPress = EdtCodigo_EmitenteKeyPress
      end
      object EdtEmitente: TEdit
        Left = 51
        Top = 21
        Width = 208
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 1
        OnKeyPress = EdtEmitenteKeyPress
      end
      object EdtCodigo_Destinatario: TEdit
        Left = 0
        Top = 194
        Width = 51
        Height = 17
        Hint = 'Pressione F3 para consultar'
        BevelEdges = [beLeft, beTop, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clMenu
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnDblClick = EdtCodigo_DestinatarioDblClick
        OnKeyDown = EdtCodigo_DestinatarioKeyDown
        OnKeyPress = EdtCodigo_DestinatarioKeyPress
      end
      object EdtDestinatario: TEdit
        Left = 51
        Top = 194
        Width = 208
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 3
        OnKeyPress = EdtDestinatarioKeyPress
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Itens NFe'
      ImageIndex = 5
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 803
        Height = 436
        DataSource = DataSource2
        DragCursor = crHandPoint
        DrawingStyle = gdsGradient
        ParentShowHint = False
        ShowHint = True
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
            FieldName = 'Codigo'
            Title.Caption = 'C'#243'digo'
            Width = 58
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
            Width = 211
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UN'
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NCM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CFOP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CST'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CSOSN'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Frete'
            Title.Caption = 'Vlr. Frete'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ICMS'
            Title.Caption = '% ICMS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Base_Reduzida'
            Title.Caption = '% BC. Reduzida'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BC'
            Title.Caption = 'BC. ICMS'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_ICMS'
            Title.Caption = 'Valor ICMS'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ICMS_ST'
            Title.Caption = '% ICMS ST.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BC_ST'
            Title.Caption = 'BC. ST'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_ICMS_ST'
            Title.Caption = 'Valor ICMS ST.'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BC_IPI'
            Title.Caption = 'BC. IPI'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IPI'
            Title.Caption = '% IPI'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_IPI'
            Title.Caption = 'Valor IPI'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Qtde'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Unitario'
            ReadOnly = True
            Title.Caption = 'Valor Unit'#225'rio'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dOUa'
            ReadOnly = True
            Title.Caption = 'D. A'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Desc_Acr'
            ReadOnly = True
            Title.Caption = 'Valor Desc. Acr.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sub_Total'
            ReadOnly = True
            Title.Caption = 'Sub Total'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Title.Caption = 'Cliente'
            Width = 231
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF_CNPJ'
            Title.Caption = 'CPF/CNPJ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Inscricao_Estadual'
            Title.Caption = 'Insc. Estadual'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Log'
            Title.Caption = 'Endere'#231'o'
            Width = 214
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Numero'
            Title.Caption = 'N'#186
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Setor'
            Width = 168
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cidade'
            Width = 131
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UF'
            Width = 26
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Telefone'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CEP'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Codigo_Municipio'
            Title.Caption = 'C'#243'd. Municipio'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Complemento'
            Width = 173
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Insc_Municipal'
            Title.Caption = 'Insc. Municipal'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Email'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Suframa'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Enquadramento'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Forma_Pagamento'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Qtde_Parcela'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Prazo'
            Visible = False
          end>
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Impostos/Transporte'
      ImageIndex = 5
      object Label59: TLabel
        Left = 0
        Top = 47
        Width = 82
        Height = 13
        Caption = 'Base Cal. ICMS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label62: TLabel
        Left = 93
        Top = 47
        Width = 61
        Height = 13
        Caption = 'Valor ICMS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label63: TLabel
        Left = 185
        Top = 47
        Width = 115
        Height = 13
        Caption = 'Base Cal. ICMS Subs.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label64: TLabel
        Left = 315
        Top = 47
        Width = 94
        Height = 13
        Caption = 'Valor ICMS Subs.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label65: TLabel
        Left = 416
        Top = 47
        Width = 115
        Height = 13
        Caption = 'Valor Total Produtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label66: TLabel
        Left = 0
        Top = 87
        Width = 62
        Height = 13
        Caption = 'Valor Frete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label67: TLabel
        Left = 93
        Top = 87
        Width = 72
        Height = 13
        Caption = 'Valor Seguro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label68: TLabel
        Left = 558
        Top = 87
        Width = 95
        Height = 13
        Caption = 'Outras Despesas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label69: TLabel
        Left = 279
        Top = 87
        Width = 49
        Height = 13
        Caption = 'Valor IPI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label70: TLabel
        Left = 669
        Top = 87
        Width = 90
        Height = 13
        Caption = 'Valor Total Nota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label71: TLabel
        Left = 0
        Top = 237
        Width = 89
        Height = 13
        Caption = 'Transportadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label72: TLabel
        Left = 0
        Top = 277
        Width = 40
        Height = 13
        Caption = 'Ve'#237'culo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label73: TLabel
        Left = 0
        Top = 317
        Width = 65
        Height = 13
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label74: TLabel
        Left = 93
        Top = 317
        Width = 42
        Height = 13
        Caption = 'Esp'#233'cie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label75: TLabel
        Left = 186
        Top = 317
        Width = 35
        Height = 13
        Caption = 'Marca'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label76: TLabel
        Left = 0
        Top = 351
        Width = 44
        Height = 13
        Caption = 'N'#250'mero'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label77: TLabel
        Left = 93
        Top = 351
        Width = 61
        Height = 13
        Caption = 'Peso Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label78: TLabel
        Left = 186
        Top = 351
        Width = 70
        Height = 13
        Caption = 'Peso L'#237'quido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 120
        Top = 159
        Width = 112
        Height = 13
        Caption = 'Valor Total Servi'#231'os'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 240
        Top = 159
        Width = 87
        Height = 13
        Caption = 'Base Cal. ISSQN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 370
        Top = 159
        Width = 66
        Height = 13
        Caption = 'Valor ISSQN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 0
        Top = 159
        Width = 88
        Height = 13
        Caption = 'Inscr. Municipal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 186
        Top = 87
        Width = 53
        Height = 13
        Caption = 'Desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label29: TLabel
        Left = 372
        Top = 87
        Width = 51
        Height = 13
        Caption = 'Valor PIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label30: TLabel
        Left = 465
        Top = 87
        Width = 72
        Height = 13
        Caption = 'Valor COFINS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label48: TLabel
        Left = 159
        Top = 277
        Width = 50
        Height = 13
        Caption = 'Reboque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdtBase_Calculo_ICMS: TEdit
        Left = 0
        Top = 62
        Width = 94
        Height = 17
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 0
        Text = '0,00'
        OnKeyPress = EdtBase_Calculo_ICMSKeyPress
      end
      object EdtValor_ICMS: TEdit
        Left = 93
        Top = 62
        Width = 93
        Height = 17
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 1
        Text = '0,00'
        OnKeyPress = EdtValor_ICMSKeyPress
      end
      object EdtBase_Calculo_ICMS_Substituicao: TEdit
        Left = 185
        Top = 62
        Width = 131
        Height = 17
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 2
        Text = '0,00'
        OnKeyPress = EdtBase_Calculo_ICMS_SubstituicaoKeyPress
      end
      object EdtValor_ICMS_Substituicao: TEdit
        Left = 315
        Top = 62
        Width = 102
        Height = 17
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 3
        Text = '0,00'
        OnKeyPress = EdtValor_ICMS_SubstituicaoKeyPress
      end
      object EdtValor_Total_Produtos: TEdit
        Left = 416
        Top = 62
        Width = 129
        Height = 17
        Hint = 'C'#225'lculo: Valor de Tabela * Quantidade'
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Text = '0,00'
        OnKeyPress = EdtValor_Total_ProdutosKeyPress
      end
      object EdtValor_Frete: TEdit
        Left = 0
        Top = 102
        Width = 94
        Height = 17
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 5
        Text = '0,00'
        OnKeyPress = EdtValor_FreteKeyPress
      end
      object EdtValor_Seguro: TEdit
        Left = 93
        Top = 102
        Width = 94
        Height = 17
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 6
        Text = '0,00'
        OnKeyPress = EdtValor_SeguroKeyPress
      end
      object EdtOutras_Despesas: TEdit
        Left = 558
        Top = 102
        Width = 112
        Height = 17
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 11
        Text = '0,00'
        OnKeyPress = EdtOutras_DespesasKeyPress
      end
      object EdtValor_Total_IPI: TEdit
        Left = 279
        Top = 102
        Width = 94
        Height = 17
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 8
        Text = '0,00'
        OnKeyPress = EdtValor_Total_IPIKeyPress
      end
      object EdtValor_Total_Nota: TEdit
        Left = 669
        Top = 102
        Width = 123
        Height = 17
        Hint = 'C'#225'lculo: Valor Total de Produtos - Desconto'
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        Text = '0,00'
        OnKeyPress = EdtValor_Total_NotaKeyPress
      end
      object Panel1: TPanel
        Left = 0
        Top = 11
        Width = 799
        Height = 25
        BorderStyle = bsSingle
        Caption = 'Calculo do Imposto'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 32
      end
      object Panel2: TPanel
        Left = 0
        Top = 205
        Width = 799
        Height = 25
        BorderStyle = bsSingle
        Caption = 'Transportador/Volumes Transportados'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 33
      end
      object EdtTransportadora: TEdit
        Left = 60
        Top = 253
        Width = 259
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 18
        OnKeyPress = EdtTransportadoraKeyPress
      end
      object EdtCodigo_Transportadora: TEdit
        Left = 0
        Top = 253
        Width = 60
        Height = 17
        TabStop = False
        BevelEdges = [beLeft, beTop, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clMenu
        TabOrder = 17
        OnDblClick = EdtCodigo_TransportadoraDblClick
        OnKeyDown = EdtCodigo_TransportadoraKeyDown
      end
      object RGFrete: TRadioGroup
        Left = 325
        Top = 236
        Width = 207
        Height = 51
        Caption = 'Frete'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          '1- Emitente'
          '2- Dest./Rem.'
          '3- Terceiros'
          '4- Sem Frete')
        TabOrder = 19
      end
      object EdtVeiculo: TEdit
        Left = 60
        Top = 293
        Width = 60
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 21
        OnKeyPress = EdtVeiculoKeyPress
      end
      object EdtCodigo_Veiculo: TEdit
        Left = 0
        Top = 293
        Width = 60
        Height = 17
        TabStop = False
        BevelEdges = [beLeft, beTop, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clMenu
        TabOrder = 20
        OnDblClick = EdtCodigo_VeiculoDblClick
        OnKeyDown = EdtCodigo_VeiculoKeyDown
      end
      object EdtUF_Veiculo: TEdit
        Left = 120
        Top = 293
        Width = 40
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 22
        OnKeyPress = EdtUF_VeiculoKeyPress
      end
      object EdtQuantidade_Transportada: TEdit
        Left = 0
        Top = 332
        Width = 94
        Height = 17
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 26
        Text = '0'
        OnKeyPress = EdtQuantidade_TransportadaKeyPress
      end
      object EdtEspecie: TEdit
        Left = 93
        Top = 332
        Width = 94
        Height = 17
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 27
      end
      object EdtMarca: TEdit
        Left = 186
        Top = 332
        Width = 94
        Height = 17
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 28
      end
      object EdtNumero_Transportado: TEdit
        Left = 0
        Top = 366
        Width = 94
        Height = 17
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 29
      end
      object EdtPeso_Bruto: TEdit
        Left = 93
        Top = 366
        Width = 94
        Height = 17
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 30
        Text = '0,00'
        OnExit = EdtPeso_BrutoExit
        OnKeyPress = EdtPeso_BrutoKeyPress
      end
      object EdtPeso_Liquido: TEdit
        Left = 186
        Top = 366
        Width = 94
        Height = 17
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 31
        Text = '0,00'
        OnExit = EdtPeso_LiquidoExit
        OnKeyPress = EdtPeso_LiquidoKeyPress
      end
      object Panel3: TPanel
        Left = 0
        Top = 128
        Width = 799
        Height = 25
        BorderStyle = bsSingle
        Caption = 'Calculo do ISSQN'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 34
      end
      object EdtValor_Total_Servicos: TEdit
        Left = 120
        Top = 174
        Width = 121
        Height = 17
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 14
        Text = '0,00'
        OnKeyPress = EdtValor_Total_ServicosKeyPress
      end
      object EdtBase_Calculo_ISSQN: TEdit
        Left = 240
        Top = 174
        Width = 131
        Height = 17
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 15
        Text = '0,00'
        OnKeyPress = EdtBase_Calculo_ISSQNKeyPress
      end
      object EdtValor_ISSQN: TEdit
        Left = 370
        Top = 174
        Width = 102
        Height = 17
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 16
        Text = '0,00'
        OnKeyPress = EdtValor_ISSQNKeyPress
      end
      object EdtInscricao_Municipal: TEdit
        Left = 0
        Top = 174
        Width = 121
        Height = 17
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 13
      end
      object EdtDesconto_Nota: TEdit
        Left = 186
        Top = 102
        Width = 94
        Height = 17
        Hint = 'C'#225'lculo: (Desconto unit'#225'rio * Quantidade) - ou+ Outras Despesas'
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        Text = '0,00'
        OnKeyPress = EdtDesconto_NotaKeyPress
      end
      object EdtValor_Total_PIS: TEdit
        Left = 372
        Top = 102
        Width = 94
        Height = 17
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 9
        Text = '0,00'
        OnKeyPress = EdtValor_Total_PISKeyPress
      end
      object EdtValor_Total_COFINS: TEdit
        Left = 465
        Top = 102
        Width = 94
        Height = 17
        TabStop = False
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 10
        Text = '0,00'
        OnKeyPress = EdtValor_Total_COFINSKeyPress
      end
      object EdtReboque: TEdit
        Left = 219
        Top = 293
        Width = 60
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 24
        OnKeyPress = EdtReboqueKeyPress
      end
      object EdtCodigo_Reboque: TEdit
        Left = 159
        Top = 293
        Width = 60
        Height = 17
        TabStop = False
        BevelEdges = [beLeft, beTop, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clMenu
        TabOrder = 23
        OnDblClick = EdtCodigo_ReboqueDblClick
        OnKeyDown = EdtCodigo_ReboqueKeyDown
      end
      object EdtUF_Reboque: TEdit
        Left = 279
        Top = 293
        Width = 40
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 25
        OnKeyPress = EdtUF_ReboqueKeyPress
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Observa'#231#245'es'
      ImageIndex = 4
      object Label49: TLabel
        Left = 0
        Top = 7
        Width = 73
        Height = 13
        Caption = 'Observa'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label51: TLabel
        Left = 0
        Top = 132
        Width = 30
        Height = 13
        Caption = 'Email'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MMOObservacao: TMemo
        Left = 0
        Top = 25
        Width = 794
        Height = 103
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object EdtEmail: TEdit
        Left = 0
        Top = 148
        Width = 241
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 1
        OnKeyDown = EdtN_Nota_FiscalKeyDown
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 178
        Width = 601
        Height = 173
        Caption = 'Refer'#234'ncia'
        TabOrder = 2
        object btnLocalizar: TButton
          Left = 7
          Top = 15
          Width = 75
          Height = 25
          Caption = 'Adicionar'
          Enabled = False
          TabOrder = 0
          OnClick = btnLocalizarClick
        end
        object DBGridReferenciaDevolucao: TDBGrid
          Left = 7
          Top = 44
          Width = 589
          Height = 121
          BorderStyle = bsNone
          DataSource = dtReferenciaDevolucao
          DrawingStyle = gdsGradient
          Enabled = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnKeyDown = DBGridReferenciaDevolucaoKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'Codigo'
              Title.Caption = 'C'#243'digo'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Numero'
              Title.Caption = 'N'#250'mero'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Modelo'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Serie'
              Title.Caption = 'S'#233'rie'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Caixa_ECF'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Valor'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Codigo_Pedido'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Codigo_Entrada_Produto'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Data_Emissao'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Chave'
              Visible = False
            end>
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Respostas NFe'
      ImageIndex = 5
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 797
        Height = 436
        ActivePage = TabSheet10
        Style = tsFlatButtons
        TabOrder = 0
        object TabSheet7: TTabSheet
          Caption = 'Respostas'
          object MemoResp: TMemo
            Left = 0
            Top = 0
            Width = 789
            Height = 405
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object TabSheet8: TTabSheet
          Caption = 'XML Resposta'
          ImageIndex = 1
          object WBResposta: TWebBrowser
            Left = 0
            Top = 0
            Width = 789
            Height = 405
            Align = alClient
            TabOrder = 0
            ExplicitWidth = 556
            ExplicitHeight = 332
            ControlData = {
              4C0000008C510000DC2900000000000000000000000000000000000000000000
              000000004C000000000000000000000001000000E0D057007335CF11AE690800
              2B2E126208000000000000004C0000000114020000000000C000000000000046
              8000000000000000000000000000000000000000000000000000000000000000
              00000000000000000100000000000000000000000000000000000000}
          end
        end
        object TabSheet9: TTabSheet
          Caption = 'Log'
          ImageIndex = 2
          object memoLog: TMemo
            Left = 0
            Top = 0
            Width = 789
            Height = 405
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object TabSheet10: TTabSheet
          Caption = 'NFe'
          ImageIndex = 3
          object trvwNFe: TTreeView
            Left = 0
            Top = 0
            Width = 789
            Height = 405
            Align = alClient
            Indent = 19
            TabOrder = 0
          end
        end
        object TabSheet11: TTabSheet
          Caption = 'Retorno Completo WS'
          ImageIndex = 4
          object memoRespWS: TMemo
            Left = 0
            Top = 0
            Width = 789
            Height = 405
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object Dados: TTabSheet
          Caption = 'Dados'
          ImageIndex = 5
          object MemoDados: TMemo
            Left = 0
            Top = 34
            Width = 786
            Height = 184
            Align = alCustom
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object Panel5: TPanel
            Left = 0
            Top = 9
            Width = 786
            Height = 25
            BorderStyle = bsSingle
            Caption = 'Resposta do Sefaz'
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
          end
          object MemoDadosSistema: TMemo
            Left = 0
            Top = 246
            Width = 786
            Height = 159
            Align = alCustom
            ScrollBars = ssVertical
            TabOrder = 2
          end
          object Panel4: TPanel
            Left = 0
            Top = 221
            Width = 786
            Height = 25
            BorderStyle = bsSingle
            Caption = 'Resposta do Sistema'
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 3
          end
        end
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 137
    Height = 467
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 133
    DockSite = True
    DragCursor = crHandPoint
    DragKind = dkDock
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
    HideClippedButtons = True
    HotTrackColor = clMenu
    Images = ImgImagens_Comandos
    List = True
    ParentFont = False
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = False
    TabOrder = 1
    object BBtnNovo: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Clique para gerar uma nova nota fiscal'
      Caption = '&Novo'
      ImageIndex = 9
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnNovoClick
    end
    object BBtnGerarNFe: TToolButton
      Left = 0
      Top = 38
      Cursor = crHandPoint
      Caption = '&Gerar '
      Enabled = False
      ImageIndex = 7
      Wrap = True
      OnClick = BBtnGerarNFeClick
    end
    object BBtnSalvar: TToolButton
      Left = 0
      Top = 76
      Cursor = crHandPoint
      Hint = 
        'Clique para enviar a NFe. Automaticamente ser'#225' validada e assina' +
        'da.'
      Caption = '&Enviar '
      Enabled = False
      ImageIndex = 7
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnSalvarClick
    end
    object BBtnImprimir_NFe: TToolButton
      Left = 0
      Top = 114
      Cursor = crHandPoint
      Caption = '&Imprimir '
      Enabled = False
      ImageIndex = 7
      Wrap = True
      OnClick = BBtnImprimir_NFeClick
    end
    object BBtnEmail: TToolButton
      Left = 0
      Top = 152
      Cursor = crHandPoint
      Caption = 'E&nviar por Email'
      Enabled = False
      ImageIndex = 7
      Wrap = True
      OnClick = BBtnEmailClick
    end
    object BBtnConsultar: TToolButton
      Left = 0
      Top = 190
      Caption = '&Consultar'
      Enabled = False
      ImageIndex = 7
      Wrap = True
      OnClick = BBtnConsultarClick
    end
    object BBtnComprovante_Entrega: TToolButton
      Left = 0
      Top = 228
      Cursor = crHandPoint
      Caption = 'Comp. Entrega'
      Enabled = False
      ImageIndex = 8
      Wrap = True
      OnClick = BBtnComprovante_EntregaClick
    end
    object BBtnGerar_Carne: TToolButton
      Left = 0
      Top = 266
      Cursor = crHandPoint
      Caption = 'Gerar Docs.'
      Enabled = False
      ImageIndex = 6
      Wrap = True
      Visible = False
      OnClick = BBtnGerar_CarneClick
    end
    object BBtnFechar: TToolButton
      Left = 0
      Top = 304
      Cursor = crHandPoint
      Hint = 'Clique para Fechar a Janela Ativa'
      Caption = '&Fechar Janela'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object ImgImagens_Comandos: TImageList
    AllocBy = 0
    Height = 32
    Width = 32
    Left = 864
    Top = 16
    Bitmap = {
      494C01010A000D00100020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000008000000060000000010020000000000000C0
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003333
      3300333333003333330033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000333333003333
      3300333333003333330033333300333333003333330033333300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000656565009655
      170086380A0066381A0049352A00393838003333330033333300333333003333
      3300333333000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000008080800000000000000000000000
      000000000000000000000000000000000000000000000000000065656500B853
      0100A13C01009A3601009A36010089280000732D0A0053362500443A3400443A
      3400333333003333330033333300333333000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000008080800000000000000000000000
      000000000000000000000000000000000000000000000000000065656500B457
      1900A13C0100C77B4700E5B99600D5976500B4643900A94402009A3601007E30
      080066381A0049352A0039383800333333003333330033333300333333000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000008080800000000000000000000000
      000000000000000000000000000000000000000000000000000065656500C769
      18009A360100C88A6500FFF0DB00FFE5CA00FDDBB700F5CCA600E7AC8200C77B
      4700B4571900A94402009A360100732D0A0053362500443A3400333333003333
      3300333333003333330000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000008080800080808000808080008080
      800080808000808080008080800080808000000000000000000065656500C769
      18009A360100C9835600FEEAD400FEE2C300FEE2C300FEE2C300FEE2C300FDE7
      B900FDDBB700EBB78800D5976500C6733900B45719009A3601007E3008006638
      1A0049352A003333330033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000080808000000000000000000065656500C769
      1800A13C0100D79B7400FEEAD400FFE5CA00FEE2C300FEE2C300FDDBB700FDDB
      B700FDDBB700FDDBB700FDE7B900FFD5AC00F9CA9300E4AC7200DC915100B65B
      22009A360100443A340033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF0000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000080808000000000000000000065656500C769
      1800A13C0100D8A78800FEEAD400FFE5CA00FFE5CA00FEE2C300FEE2C300FDDB
      B700FDDBB700FDDBB700FDDBB700FDDBB700FBD19C00FEC27500FCC48700E5A8
      6800A944020049352A0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000080808000000000000000000065656500C96D
      20009A360100D8A78800FFF0DB00FEE6D100FFE5CA00FFE5CA00FEE2C300E7DA
      C800D8D2BE00FDDBB700FDDBB700FDDBB700FCC48700FFB65700FEC27500E29E
      5600A944020049352A0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF0000000000C0C0C000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000080808000000000000000000065656500C877
      2900A13C0100E5B99600FFF0DB00FEEAD400FEE6D100FFE5CA00FEE2C30046AD
      CB0073B9C700FDE7B900FDDBB700FDDBB700FFB65700FFAA3300FEC27500E5A8
      6800A9440200443A340033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000808080000000000000000000846B5100C96D
      2000A13C0100EBD5B700FEF1E300FEEAD400FEEAD400FEEAD40089C2CC000098
      CB0046ADCB00FDDBB700FDDBB700FFD5AC00FFAA2800FFB65700FDDBB700E7AC
      8200984A0B00443A340033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C00000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000808080000000000000000000846B5100C96D
      2000A13C0100E6C9B700FEF1E300FFF0DB00FEEAD400ABD1D4000098CB001EA2
      CD00109DCC00E7DAC800FFE5CA00FEC27500DFA24B00C4BDAC00D9B69B00DC91
      5100A94402003938380033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000808080000000000000000000866B4800C877
      2900A13C0100EBD5B700FEF5EA00FEF1E300ABD1D4000098CB004AB0CE00D5D9
      D3000098CB00ACCAC500FEEAD400997754001E43530050909C00B4732C00D982
      2A00B85301006B45220033333300333333003333330000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000080808000000000006565650099775400C96D
      2000A9440200FEF1E300FEF5EA00BCD7D9000098CB0046ADCB00F6ECDB00FEE6
      D10030A8CE0046ADCB00FFE5CA00E6C9B700517C8F0079785600FCC48700FFD5
      AC00F2B77700E28D3A00BF6A1400855628003333330033333300333333000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000808080000000000065656500A67D5400C769
      1800A9440200FEF5EA00FEF5EA0085C5D50046ADCB00EDE6D700FFF0DB00FEEA
      D40085C5D5000098CB00E7DAC800FFE5CA00EDE6D700BC8A5800E5A86800FEE2
      C300FEEAD400FDDBB700FCC48700E4964600C769180096551700755639003333
      3300333333000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000808080000000000065656500A67D5400C96D
      2000A9440200FEF5EA00FEF6F000FEF5EA00FEF1E300FEF1E300FFF0DB00FFF0
      DB00CCD9D2000098CB0099C6C900FFE5CA00FFE5CA00FEE2C300E5A86800D887
      3600E29E5600FDDBB700FFE5CA00FEE2C300FCC48700E29E5600D77D24008556
      2800565554003333330033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000808080000000000065656500BC8A5800C769
      1800B65B2200FEF9F500FEF9F500FEF6F000FEF5EA00FEF5EA00FEF1E300FFF0
      DB00FEEDDC0020A3CD0046ADCB00FEE6D100FFE5CA00FFE5CA00FEEAD400D28A
      5700A13C010096551700DC915100EAC79400FFE5CA00FEE2C300BFA18300A6A9
      A6007B7A9C001819870031326B00333333000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000808080000000000065656500CA936900C769
      1800B4643900FEF9F500FEF9F500FEF6F000FEF6F000FEF5EA00FEF5EA00FEF1
      E300FEF1E3007FC3D400109DCC00D5D9D300FEEAD400FFE5CA00FEEAD400D28A
      570086380A005A48370033333300D8873600D8873600E8B67D00988D8000E7E9
      F1004A54C5000F48D0000C29B6004A4A7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000808080000000000065656500CA936900C769
      1800B4643900FEFEFD00FEFEFD00FEF9F500FEF6F000FEF6F000FEF5EA00FEF5
      EA00FEF1E300EDE6D7000098CB0085C5D500FEEAD400FEE6D100FFF0DB00D28A
      57009A3601003F414400333333000000000000000000DC915100DC9151008687
      9B002A37B2002377EC000C29B6004A4A7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000808080000000000065656500D5976500B853
      0100BC714700FEFEFD00FEFEFD00FEFEFD00FEF9F500FEF6F000FEF6F000FEF5
      EA00FEF5EA00FEF1E30054B6D3001EA2CD00FEEAD400FEEAD400FEF1E300D28A
      57009A3601003F41440033333300000000000000000000000000000000002A37
      B2002A37B2002A37B2002A37B200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000808080000000000065656500DCA87800B44C
      0000C88A6500FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEF9F500FEF6F000FEF6
      F000FEF5EA00FEF5EA00BCD7D9000098CB009ECDD600FEEAD400FEF1E300D28A
      57009A3601003F41440033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000808080000000000065656500DCA87800B44C
      0000C88A6500FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEF9F500FEF6
      F000FEF6F000FEF5EA00FEF1E30032ABD00032ABD000FEEDDC00FFF0DB00C77B
      47008C44050048494A0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000808080000000000065656500DCA87800B44C
      0000C88A6500FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEF9
      F500FEF6F000FEF6F000FEF5EA00C9E2E200C9E2E200FEF1E300FEEDDC00C77B
      47008C44050048494A0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000808080000000000065656500E5A86800B853
      0100B9612400C9835600CC998000E6C9B700EEDED200FEFEFD00FEFEFD00FEFE
      FD00FEFEFD00FEFEFD00FEF9F500FEF6F000FEF5EA00FEF5EA00FEF1E300C77B
      47008C44050048494A0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000808080000000000065656500E4AC7200C45C
      0000B8530100B44C0000B44C0000B8530100B8530100B65B2200BF7C5900CA95
      7500E5C0A900E7DAC800F3E5DE00FEF5EA00FEFEFD00FEFEFD00FEF5EA00D687
      42008C44050048494A0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000808080000000000065656500E8B67D00C45C
      0000C45C0000C45C0000C45C0000C45C0000C45C0000C45C0000C45C0000B44C
      0000B44C0000B44C0000B9612400C77B4700C88A6500D8A78800E5C0A900C673
      39008C44050048494A0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000808080000000000065656500E8B67D00E496
      4600D4761800D26C0900C7610000C45C0000C45C0000C45C0000C45C0000C45C
      0000C7610000C7610000C45C0000B8530100B44C0000B44C0000B8530100B853
      0100984A0B0048494A0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000080808000000000006565650065656500EAA8
      5800C9AE7900DBC29000EDC68600F2B77700EAA85800E0953F00D9822A00D26C
      0900C45C0000C45C0000C45C0000C45C0000C7610000C7610000C7610000C761
      00007E4A1A005655540033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000808080000000000000000000000000006565
      650065656500656565006565650065656500EAA85800C9AE7900C9AE7900DBC2
      9000EAC79400E8B67D00E5A86800DF963F00D9822A00D4761800D26C0900D26C
      09007E4A1A006565650033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000808080000000000000000000000000000000
      0000000000000000000000000000000000006565650065656500656565006565
      6500656565006565650065656500EAA85800C9AE7900C9AE7900C9AE7900D2A6
      6300866B48006565650000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000656565006565650065656500656565006565
      6500656565000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFE
      FE000000000000000000FFFEFF00FFFEFF0000000000FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00000000000000000000000000FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006067600060676000606760006067
      6000606760006067600060676000606760006067600060676000606760006067
      6000606760006067600060676000606760006067600060676000606760006067
      6000606760006067600060676000000000000000000000000000FBFBFB00ECEC
      EC00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEB
      EB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEB
      EB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEBEB00EBEB
      EB00EBEBEB00EFEFEF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFE
      FE000000000000000000FFFEFF00FFFEFF000000000000000000FFFEFF00FAFB
      FF00EFF1F900E4E6F100DBDDE800D8DAE500D7D9E400DADBE500E3E3E900EDEE
      F200F8F7F900FEFEFE000000000000000000FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0A79000DFA79F00D09F9000CF979000CF97
      9000CF979000CF979000CF979000C0979000C0978F00C0978F00C0978F00C097
      8F00C0978F00C0978F00C0978F00C0978F00C0978F00C0978F00C0978F00C097
      8F00C0979000DF978F0060676000000000000000000000000000908B8800766C
      6700776D6800776D6700776D6700776D6700776D6700776D6700776D6700776D
      6700776D6700776D6700776D6700776D6700776C6700776C6700776C6700776C
      6700776C6700776C6700776C6700776C6700776C6700776C6700776C6700776C
      6700766C66006F696600CBCBCB0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6EEEC00FDF4DD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00000000000000
      000000000000000000000000000000000000FCFEFE00F6F8F900E6E7EB00CCCE
      D900AEB2CB009398B9008187AC00797FA400787FA0008084A0009496A800A9AA
      B400C2C3C700DCDCDC00F0F0F000FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0AFAF00FFD8C000FFD8C000FFD8C000FFD8
      C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8
      C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8
      C000FFD09F00DF978F00606760000000000000000000FAFAF900ECE2DA00FEFA
      F300FEFBF400FFFBF400FFFBF500FFFCF500FFFCF600FFFDF700FFFDF700FFFD
      F800FFFEFA00FFFEFB00FFFFFB00FFFFFC00FFFFFD00FFFFFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFE5E000B2B2B20000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6EEEC00E8B54B00FFFEF900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00000000000000
      00000000000000000000FDFEFF00F6F7FF00E0E4F700BBC0DF008E94BF006F76
      AD005A65A9004955A300414D9F00414D9F00424E9C00535DA3005C649F00585E
      8D006065860083869B00B0B2BD00D8D8DE00F4F3F500FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CFB7AF00E0E8E000FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFE0C000FFD8C000FFD8C000FFD8
      BF00FFD8BF00FFD8BF00FFD8BF00FFD8B000FFD8B000FFD8B000FFD0B000FFD0
      B000FFD8C000DF978F00606760000000000000000000FAFAFA00EFE6DD00F9F4
      ED00F9F5EE00FAF5EE00FAF5EF00FAF6EF00FAF6F000FAF7F100FBF7F100FBF7
      F200FBF8F300FBF8F400FCF9F4000000000000000000FFFDFA00FDFBF800FDFB
      F800FFFFFE00000000000000000000000000FEFDFC00FEFEFD00FEFEFD00FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFD00FEFEFD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F6EEEC00EDCAAD00F4CDA800E2AF7600DCA45F00FEFA
      EC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FCFEFF00F2F3FD00CDD0EC008D95D0005864BC001A299D001023
      A8001226B400162ABD001629C000162ABF000D22B3000D20AB000B1B9D001220
      91003E49A30050599900575D8200888A9C00C0C0C600EAEAEA00F9FBFB00FDFF
      FF0000000000FEFEFE00FFFFFE00FFFFFE000000000000000000000000000000
      0000000000000000000000000000D0B7AF00E0E8E000FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFE0C000FFD8
      C000FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8B000FFD8B000FFD8
      B000FFD8C000DF978F00606760000000000000000000FAFAFA00EFE6DD00F9F4
      ED00F9F5EE00FAF5EE00FAF5EF00FAF6EF00FAF6F000FAF7F100FBF7F100FBF7
      F20009B42800FFFBFC00FFFFFB000606070000000000CDCBCA00FDFBF8000000
      0000000000000000000000000000000000002324230000000000FEFEFD00FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFEFEF00BFC4B800A8B59C00B7C3AE00968D86008982
      7C00A19FA000CAB7A800F5D1AD00F1CDAA00F1CDAA00F2CEAB00F3D3B600D995
      2B00FEFEFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FDFF
      FF00FCFCFF00E9EDFF00BAC0EB006A73BC002936A2001F31BA001F36D8001E35
      E8001C34EC001932EC001932EE001932EC001B33EB001D34E7001B30DF001429
      C8000B1EA90012209000434D9B004E5586006C708900ABADB700E1E2E600F8FA
      FA000000000000000000FFFFFE00FFFFFE000000000000000000000000000000
      0000000000000000000000000000D0B7AF00E0E8EF00FFE8D000FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFD8
      C000FFD8C000FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8
      B000FFD8C000DF978F00606760000000000000000000FAFAFA00EFE6DD00F9F4
      ED00F9F5EE00FAF5EE00FAF5EF00FAF6EF00FAF6F000FAF7F100FBF7F100FBF7
      F20019B5300019B43000FEFFFD000000000000000000CBC9C800FFFDFA004646
      45000000000012121200A1A0A0000A0A09000000000076767500FFFFFE00FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00AAC88F00A7C78B00B5CA8F00A7C78B0096B67A0092B0
      8E008FADB600C5C6C700D4C3B700F4CFAC00F4CFAC00F1CEAA00EEC8A600E6BD
      9E00F6DDA000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FBFE
      FF00F0F1FF00B3B9EE004856C0002135C3002238DD001B35E7001932EE001731
      F0001530F200152FF300152FF300152FF3001530F2001731F0001731F0001933
      EB001D35E5001329C800091CA300202E9400525B9A005F648300A8AAB400E7E7
      E700FDFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0B7B000EFE8EF00FFE8D000FFE8D000FFE8
      D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0
      C000FFE0C000FFD8C000FFD8C000FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8
      B000FFD8C000DF978F00606760000000000000000000FAFAFA00EFE6DD00F9F4
      ED00FBF5F000FCF5F000FCF5F100FCF6F000FCF6F100FCF7F200FDF7F200FDF7
      F30024BB360033BD3F0021BA3200F5F8F500F9F8F600FCFAF700000000000000
      00000000000000000000FEFDFB0000000000000000000000000000000000FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F6F9F400B8CFA000C9CEC500FFFFFF0080EFFF0094DBE700F9FAF900D6E4
      CA00B4CF990074AF8F0059A19E00B1C5CB00B6ACA400E6BD9E00E9C0A000F0CC
      AE00F1CC7C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFEFF00FDFEFF00F2F5
      FF00BCC3FA004552B4002638D1001B33EB001530F200142EF600142FF5001530
      F2001932EE001B33EB001B33E9001B33EB001731EF001530F200132EF400142F
      F500152FF3001932EC001A32DE000A1EAC0015238900555E9D00686B8700B9B8
      C100F1F0F2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0BFB000EFE8EF00FFE8D000FFE8D000FFE8
      D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0
      C000FFE0C000FFE0C000FFD8C000FFD8C000FFD8C000FFD8BF00FFD8BF00FFD8
      BF00FFD8C000DF978F00606760000000000000000000FAFAFA00EFE6DD00E2F0
      DC005FD0690062D16B0065D16F0067D270006AD374006BD374006DD5770070D5
      7A003DC5440043C6470043C6470037C33C00FFFEFF00FCFAF700D6D5D2000000
      000033333300FFFFFD00FEFDFB00000000000000000000000000F4F4F300FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E4EDDB00ADCE9600E5E4E400FEFEFD00A2EBF900CACDCF00FFFFFF00FFFF
      FF00E4EDDB00B5CA8F0096B67A004F8C9C007A706600E6BD9E00EFCAA800E8C2
      A900E8B54B00FEFBF300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FDFEFF00FAFAFF00D6DC
      FF005C6BD900273BD6001D34E8001530F200142FF500142FF5001530F2001B33
      E9002239DB00273CD300293DD200283CD7002037E1001B33EB001530F200142E
      F600142FF5001630F4001731EF001B33DF000B1EAF00202D970050558C007E7F
      9400CFCED700FBF9F90000000000000000000000000000000000C05750009077
      7F006F676F000000000000000000D0BFB000EFE8EF00FFE8D000FFE8D000FFE8
      D000FFE8D000FFE8D000FFE0D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0
      CF00FFE0C000FFE0C000FFE0C000FFE0C000FFD8C000FFD8BF00FFD8BF00FFD8
      BF00FFD8C000DF978F00606760000000000000000000FAFAFA00EFE6DD00D4EC
      D1005BD454005BD454005BD454005BD454005BD454005BD454005BD454005BD4
      54005BD454005BD454005BD454005BD4540054D24E00B4E9BC00ABAAA9000000
      00009B9A9A00FDFCFA00FEFDFB00FFFFFD000000000000000000CECECD00FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C8DAB700AAC88F00E0DFE000E9F8FC00D6F6FA00E0DFE000FEFEFD00FFFF
      FF00FFFFFF00FFFFFF00EEF4E900A7C78B009CAC69008C756600907B6800E6BD
      9E00F0CCAE00DCA45F00F1CC7C00F7E5B700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FAFCFF00E6E9FF008A95
      E700293DD2001831EB00152FF3001530F2001B33E9002037E000273CD400475A
      DF007787F800A0AEFF00A7B4FF009EABFF007483FD003D51DF001E36E2001731
      EF00152FF500142EF600142FF5001731EF001B33E1000C1DA900313B9200494E
      7B009E9EAE00ECEAEA00000000000000000000000000AF5750007F878F009F77
      9F00CF879F00705F6F0000000000DFBFB000EFE8EF00FFE8DF00FFE8DF00FFE8
      D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFD8C000FFD8C000FFD8
      BF00FFD8C000DF978F00606760000000000000000000FAFAFA00EFE6DD00D2EC
      D0006CDE5C006CDE5C006CDE5C006CDE5C006CDE5C006CDE5C006CDE5C006CDE
      5C006CDE5C006CDE5C006CDE5C006CDE5C0053D64F00F9FAF800A7A6A5000000
      0000A3A2A200FDFCFA00FEFDFB00FFFEFD000000000000000000CACAC900FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C8DAB700ADCE9600DAD9D900DBF0F500D6F6FA00E9E9E900FBFCFB00FFFF
      FF00FFFFFF00FFFFFF00FEFBF300B5CA8F00ADCE96009F9467008C756600BDA1
      8700F5D1AD00F3D3B600E2AF7600D9952B00F5D89400F6DDA000FEFEFD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F1F4FF00ADB8FF00394B
      CE001E36E200152FF300142EF6001B33EB00293DD2005E6CDC00CDD6FF00ECF2
      FF00EFF4FF00F1F6FF00F3F5FF00F1F5FF00EBF1FF00D0DBFF00788BFF001E36
      E2001731F000142EF600142EF600142EF2001931EF001A30D5000D1D9800515B
      A90070748D00D0D0D000FBFAFC00FFFEFF00000000007F776F003077D0005F67
      A000A08FA000D08F9F00705F6000DFBFB000EFF0EF00FFE8DF00FFE8DF00FFE8
      DF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFD8C000FFD8
      C000FFD8C000DF978F00606760000000000000000000FAFAFA00EFE6DD00D1EB
      CF0068E1570069E158006AE259006BE259006CE359006EE35A006FE45A006FE4
      5B007CE766007CE665007BE665007CE86200FFFCFF00FCFAF700BABAB8000000
      000081817F00FDFCFA00FEFDFB00000000000000000000000000D9D9D800FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EEF4E900AACC9300D6D5D400CDD9DC00BEF6FF00FBFCFB00E9E9E900FFFF
      FF00F8F6F500E0BC9900D8BDA500B6ACA400968D8600AAC88F009CBF7B006B5C
      4E00C6AA8E00E9C0A000F1CEAA00F2CEAD00EAC4AD00EAC4AD00DA900A00FDF7
      E400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFBFF00DFE5FF005A6AE2002238
      DE001932EE00142EF2001B32EC00253BD7008F9DFF00E4EEFF00F6F8FF00FCFD
      FF00FFFEFF0000000000FFFEFF00FBFCFF00F4F7FF00D7E0FF004051D6001E36
      E2001731F000142EF600152FF700142EF600152FF5001B33E9001325BE00202D
      970052567F00AFB2B700F1F0F400FFFEFF00000000005FBFFF0030A7FF003077
      D0005F67A000A08FA000CF879F00706F6F00EFF0EF00FFF0DF00FFE8DF00FFE8
      DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFE0
      C000FFD8C000DF978F00606760000000000000000000FAFAFA00EFE6DD00FBF5
      EE00FFF7F700FFF7F700FFF7F700FFF7F700FFF7F700FFF8F700FFF7F600FFF7
      F70073E85F008CF06D0086EF6600CDEED400FCFAF600FCFAF700EBEAE7000000
      00001010100000000000FEFDFB00000000000000000000000000FDFDFC00FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFD00BBD2A600D6D5D400D3D1D20098F2FF00F9FBFD00D3D1D200FEFE
      FD00F8F7F700F8F7F700FEFEFD00FFFFFF00FEFEFD00D6E4CA00B4CF99005363
      300053453A00AC917800F2CEAB00F1CDAA00F4CFAC00E7BEA100E1A43A00ECBF
      6100FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3F5FF00BAC4FF002B3DD0001932
      EE00152FF3001B33EB00273BD600818FFF00E8EFFF00F6FAFF00FBFDFF00FFFE
      FF0000000000FFFEFF00FFFEFF00F4F6FF00BAC4FF004959D4002339DF001731
      EF00142EF400142EF600142EF600142EF600142EF6001931EF001D34DE000D1C
      9B0058609B008E92A400E1E1E70000000000000000007F87B00060D8FF003FAF
      FF003077CF005F6FAF00A08FA000CF879F008F778F00FFF0E000FFF0DF00FFE8
      DF00FFE8DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8
      D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0
      C000FFD8C000DF978F00606760000000000000000000FAFAFA00EFE6DD00F9F4
      ED00F9F5EE00FAF5EE00FAF5EF00FAF6EF00FAF6F000FAF7F100FBF7F100FBF7
      F2008AF46A0062DB6C00FFFBFC00FCF9F500FCFAF600FCFAF700FFFEFA003D3C
      3C000000000012121100C3C3C20019191900000000004E4E4E00FFFFFE00FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EEF4E900B2CA9900DAD9D90078D6E900BEF6FF00D3D1D200DCDC
      DC00FFFFFF00D6D5D400A9A19800F3D3B600F3D3B600E9CFC200FCEEE200B2CA
      990090905700907B6800D9B89800F5D1AD00F1CDAA00F2CEAB00E8C2A900D99B
      4400FFFFFF00FFFFFF00FFFFFF00FFFFFF00E6EEFF007884E2002238DD00132D
      F500142EF6001E36E4003545C000D5DEFF00F4F8FF0000000000000000000000
      0000FFFEFF00FAFCFF00F3F7FF00BEC7FF003040BB002239DB001932EE00152F
      F3001731F0001932EC001B33EB001932EE00152FF3001530F2001B33EB001425
      B4004D58A200767A9700D6D7E1000000000000000000000000008F87B0005FD0
      FF0040AFFF003077D0005F67A000A08FA000CF879F00706F7000FFF0E000FFF0
      DF00FFE8DF00FFE8DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8D000FFE8
      D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0
      C000FFD8C000DF978F00606760000000000000000000FAFAFA00EFE6DD00F9F4
      ED00F9F5EE00FAF5EE00FAF5EF00FAF6EF00FAF6F000FAF7F100FBF7F100FBF7
      F20078DD8500FFFAFB00FCF9F400FCF9F500FCFAF600FCFAF700FDFBF8000000
      0000000000000000000000000000000000000504040000000000FEFEFD00FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00AAC88F00BBD2A600A1B6BE0078D6E900FEFEFD00EFEF
      EF00FEFEFD005E514200D2AB9000E4BA9C00E2B79700F5D1AD00F1CDAA00F9CF
      AE00ADCE960089B3630087716200A68B7300F4CFAC00F1CDAA00E4BA9C00EDCA
      AD00F7E5B700FFFFFF00FFFFFF00FFFFFF00DAE5FF003E4FC4001E36E200132D
      F500152FF5002439DB006772CE00EDF3FF00FAFBFF000000000000000000FFFE
      FF00FDFEFF00F3F6FF00B8C3FF002E40BD002238DD001932EE00152FF3001731
      EF001E36E4002D43E300556AFF002439DB001932EE00152FF3001731EF00182C
      C70037439B0062689100CDCFDA00FFFFFE000000000000000000000000008F87
      AF0050BFFF003FA7FF003087EF005F67A000A08FA000CF879F00706F7000FFF0
      E000FFF0E000FFF0DF00FFE8DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8
      D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0
      CF00FFD8C000DF978F00606760000000000000000000FAFAFA00EFE6DD00F9F4
      ED00F9F5EE00FAF5EE00FAF5EF00FAF6EF00FAF6F000FAF7F100FBF7F100FBF7
      F200FCF8F400FBF8F400FCF9F400FCF9F500FCFAF600FCFAF700FDFBF800FDFB
      F800FDFDFB006B6A6A001D1D1D004444430000000000FEFEFD00FEFEFD00FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B8CFA000A3C48600CACDCF0075BAC800F2FBFD00FFFF
      FF00EFEFEF006B5C4E00E3C1A000F6D2AE00F5D1AD00F0CCA800F4CFAC00F4CF
      AC00D4C39400ADCE96009E8B690087716200F2CEAB00F4CFAC00E6BD9E00EAC4
      AD00F6DDA000FFFFFF00FFFFFF00FFFFFF00B2C2FF002E41C8001C33E600142F
      F5001530F2001F34CC0098A2E800F6F8FF00FBFDFF0000000000FFFEFF00FAFC
      FF00F1F6FF00BCC7FF002E40BD002238DE001932EE00152FF5001731F0002037
      E1003649D0008293FF00B1C1FF002C3FCA001D34E800142FF500152FF3001F35
      D500172585005D639200C9CCDB00FFFFFE000000000000000000000000000000
      00008F87AF0060E0FF003FAFFF003077CF005F6FAF00A08FA000D087A000FFF0
      E000CFBFBF00BFAFAF00BFAFAF00BFAFAF00BFAFAF00C0A7AF00BFAFAF00FFE8
      D000FFE8D000FFE8D000FFE8D000FFE8D000FFE8CF00FFE0CF00FFE0CF00FFE0
      CF00FFD8C000DF978F00606760000000000000000000FAFAFA00EFE6DD00F9F4
      ED00F9F5EE00FAF5EE00FAF5EF00FAF6EF00FAF6F000FAF7F100FBF7F100FBF7
      F200FBF8F300FBF8F400FCF9F400FCF9F500FCFAF600FCFAF700FDFBF800FDFB
      F800FDFCF900FEFDFB0000000000FFFFFE00FEFDFC00FEFEFD00FEFEFD00FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C1D5AC00D6DCCF00D6D8DB0094DBE700F2F3
      F400F8F6F500B6ACA400B6B1AE00B8B6B300B8B6B300BEBCBA00BEBCBA00CBC6
      C300CBC6C3006B5C4E009EC58300909057008C756600D9B89800F5D1AD00F3D1
      B200F7E5B700FFFFFF00FFFFFF00FFFFFF00A4B4FF002B3DD0001B33E900152F
      F3001731EF00192CBD00B4BDFC00F8FBFF00FDFDFF00FFFEFF00FDFEFF00F3F7
      FF00B8C5FF002E40BD002137DC001932EE00152FF3001731F0001E36E400374A
      D100C2CCFF00D5DCFF00DBE6FF004F5FD7001E36E200142EF600142FF5002238
      DD00172388005B629400C9CCDB00000000000000000000000000000000000000
      0000000000008F87B0005FD0FF00309FFF003077D00050677F00706F90008F87
      7F00AF878F00A07F7F00A07F7F00A0676F00B0878F00AF779000906760009F6F
      8F00E0D0CF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0
      CF00FFD8C000DF978F00606760000000000000000000FAFAFA00EFE6DD00F9F4
      ED00F9F5EE00FAF5EE00FAF5EF00FAF6EF00FAF6F000FAF7F100FBF7F100FBF7
      F200FBF8F300FBF8F400FCF9F400FCF9F500FCFAF600FCFAF700FDFBF800FDFB
      F800FDFCF900FDFCFA00FEFDFB00FEFDFC00FEFDFC00FEFEFD00FEFEFD00FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EEF4E900B2CA9900DBDBD200A2834D00FDF4
      ED00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00847B7500B2CA990089B3630087716200B3987E00F4CFAC00F0CE
      B300F6DDA000FFFFFF00FFFFFF00FFFFFF00798AFF00273CD4001C34EC00152F
      F3001932EC001226B300B4BDFC00F8FAFF00FBFDFF00FAFCFF00F3F7FF00BEC7
      FF002E40BD002038DE001732EE00152FF3001731F0002037E100374AD100BDC8
      FF00F1F5FF00F4F5FF00E8EDFF005E6BD7002037E000152FF700142EF6002238
      DE001723880061689900CCCFDE00000000000000000000000000000000000000
      000000000000000000008F87AF005FD0FF0060A7FF00908FAF00A08FA000AF8F
      9F00BF7F7F00E0C8A000FFF0C000FFFFD000FFFFDF00FFFFD000EFD0BF00BF87
      7F00A07F8F00EFD0C000FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0
      CF00FFD8C000DF978F00606760000000000000000000FAFAFA00EFE6DD00F9F4
      ED00F9F5EE00FAF5EE00FAF5EF00FAF6EE00F5F2ED009C9A9700A2A09D00F7F5
      F200FBF8F200FBF8F400FCF9F400F3F2EF00F3F2F000FBF9F600FDFBF800FDFB
      F80000000000BCBCBB0098979600DDDCDB00FFFEFD00FEFEFD00FEFEFD00FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00FFFFFF00FFFFFF00FEFE
      FD00FEFBF300FFFFFF00FEFEFD00F2E0D800A9BE8100A7C78B008C7566009A86
      7400FFFFFF0053453A006B5C4E00F6D2AE00F1CDAA00F2CDAA00EAC4A200F5DB
      C300FFFFFF00A9A19800B3987E00CCD1A400909057008C756600EAC5A400F5D1
      AD00E2B58300F1CC7C00FEFEFD00FFFFFF00788AFF00273BD6001B33EB00152F
      F3001932EC001024B2008C96DC00F4F7FF00FAFBFF00F3F6FF00B8C3FF002E40
      BD002238DD001732EE00152FF3001731EF001E36E400374AD100C2CCFF00F1F5
      FF00FBFBFF00F8F9FF00E9EDFF00606DD7002237E000142FF500152FF7002238
      DD00172585007379A600D4D7E600000000000000000000000000000000000000
      000000000000000000000000000090C8EF00D0D8EF00D0C8D00090776F00E0A7
      9000FFF0B000FFFFDF00FFFFD000FFFFDF00FFFFDF00FFFFDF00FFFFE000FFFF
      E000C08F90009F6F8F00E0D0CF00FFE8CF00FFE8D000FFE8D000FFE8D000FFE8
      D000FFD8C000DF978F00606760000000000000000000FAFAFA00EFE6DD00F9F4
      ED00F9F5EE00FAF5EE00FAF5EE00E5E4E1000000000000000000000000000000
      0000E8E7E600FBF8F400FFFFFC000000000000000000D7D5D300FDFBF8000000
      0000000000000000000000000000000000007979790000000000FEFEFD00FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00FFFFFF00FFFEF900ECBF
      6100E8B54B00F6DDA000F3E8E200EFCAA800D4C39400A3C486009E8B69007A68
      5600F9FBFD0089827C0048393100D9B89800FAD4B100F5D1AD00EBC3A300F5DB
      C300FFFFFF009E989100C5A58900E5C49C0089B363009E8B6900C5A58900F4CF
      AC00EAC4AD00DA900A00F6DFAB00FFFFFF0098A9FF00293CD3001B33EB001630
      F4001732EE001429C0005963BA00EAF1FF00ECF2FF00BFC9FF002E3FBE002339
      DF001932EE00152FF3001731F0002037E100374AD100BDC8FF00F1F5FF00FDFD
      FF00FFFEFF00F8F9FF00E0E6FF005B69DA002037E100142FF5001530F600243A
      DA00404CA4008E94B900E2E4EF00000000000000000000000000000000000000
      0000000000000000000000000000EFD0C000FFF8FF00C0A7AF00EFB79000FFE8
      BF00FFF8CF00FFF8CF00FFFFD000FFFFD000FFFFEF00FFFFEF00FFFFFF00FFFF
      FF00FFFFF000B07F7F0070576F00DFC8C000FFE8DF00FFE8D000FFE8D000FFE8
      D000FFD8C000DF978F00606760000000000000000000FAFAFA00EFE6DD00F9F4
      ED00F9F5EE00FAF5EE00FFFEFA000202020000000000131312001E1D1D000000
      00000000000000000000FFFFFC000304040000000000D8D6D400FEFCF9006767
      66000000000000000000414141000000000000000000B3B3B200FEFEFD00FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00EDC6A100DCA45F00F7D8
      B900EAC4AD00DEB29300DCA45F00EDC7A600F6D2AE00EEC8A600AACC93009CAC
      6900907B6800FFFFFF00F9FAF9007A68560053453A0087705A00A68B7300FEFE
      FD00E8E6E5005E514200EBC3A300FAD4B100B2CA990089B363007A685600BDA1
      8700DFB49900EAC4AD00DCA14E00FBEACA00A6B6FF002D40CB001B34E800142F
      F5001531F000152BD00012209000C2CDFF00B1BFFF003447C8002238DE001932
      EE001630F4001731EF001E36E400374AD100C2CDFF00F1F5FF00FAFBFF00FFFE
      FF0000000000F3F6FF00C0CBFF003042C5001C34E4001530F600152FF3002438
      D3005861AB00B1B5CE00F1F3FB00000000000000000000000000000000000000
      0000000000000000000000000000F0D8C000FFF8FF00DFAFAF00FFE8B000FFFF
      D000FFE8B000FFF8CF00FFFFD000FFFFE000FFFFEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF8D0009F5F6F00C0A7AF00FFE8DF00FFE8DF00FFE8D000FFE8
      D000FFD8C000DF978F00606760000000000000000000FAFAFA00EFE6DD00F9F4
      ED00F9F5EE00FAF5EE00878582000000000099989500FAF7F000FBF7F100CBC9
      C6000000000039383700FEFBF6000000000000000000FEFCF800F6F5F3000000
      00000404040000000000FEFDFB0000000000000000000000000000000000FFFE
      FE0000000000F3EBE700B2B2B20000000000E9CFC200E6BD9E00E6BD9E00F0CC
      A800F2CEAB00F1CDAA00F2CEAB00F2CEAB00E6BD9E00EFCAA800D4C39400A3C4
      860090905700907B6800D4C3B700FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9FA
      F900B3987E00DFB49900E4BA9C00EEC8A600F0CCA800CCD1A40087705A008771
      6200EEC8A600E4BA9C00EACAB300E8B54B00D8E4FF003445BE001E36E400142F
      F5001430F3001D34E7000B1CAB003B4CD1002B40D7001F36E0001731EF00152F
      F3001731F0002037E100374AD100BDC8FF00F1F5FF00FDFDFF00FFFEFF00FDFF
      FF00FBFDFF00E1E7FF00828FFB00253BD6001B33EB00152FF3001B32EC002032
      BF00727AB600D4D4E400FCFCFF00000000000000000000000000000000000000
      0000000000000000000000000000F0D8C000EFC8DF00FFC8AF00FFF8D000FFE8
      BF00FFE8B000FFFFCF00FFFFD000FFFFE000FFFFEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFE000FFFFDF00B0877F007F677000FFE8DF00FFE8DF00FFE8DF00FFE8
      D000FFD8C000DF978F00606760000000000000000000FAFAFA00EFE6DD00F9F4
      ED00F9F5EE00FFFAF3001716150000000000E7E3DE00FAF7F100FBF7F100FFFF
      FE000000000003030400FFFFFD00FCF9F500FCFAF600FCFAF700C1C0BE000000
      000061626100FEFDFB00FEFDFB00000000000000000000000000F2F2F200FFFE
      FE0000000000F3EBE700B2B2B20000000000E9CFC200EFCAA800F1CDAA00F2CE
      AB00F1CDAA00F1CDAA00F1CDAA00F1CDAA00F2CEAB00F2CEAB00F9CFAE00C7BC
      8A009CBF7B00907B68008C756600F5DBC300FAE8D800FBF0E500FBF0E500D8BD
      A500EBC3A300EDC7A600EAC5A400E7BEA100EEC8A600D9CBA100799148008771
      6200E1B79B00E6BD9E00E8C2A900F3D38800E4EDFF006D7ADC002339DF00142E
      F600142FF5001731F0001128D800162EDC001B33E9001731EF00152FF3001731
      EF001E36E400374AD100C2CDFF00F1F5FF00FAFBFF00FEFDFF0000000000FBFD
      FF00F4F8FF00A4ADF1003D50DB001C34EA001730F2001931EF002237E0003A4A
      C2009FA4D100ECECF200FFFEFF00FFFEFF000000000000000000000000000000
      0000000000000000000000000000F0D8BF00DF9F9F00FFD0AF00FFF8CF00FFD8
      A000FFE8B000FFF8CF00FFFFD000FFFFE000FFFFE000FFFFF000FFFFFF00FFFF
      E000FFFFEF00FFFFDF00DFB7AF007F5F6F00FFE8DF00FFE8DF00FFE8DF00FFE8
      DF00FFD8C000DF978F00606760000000000000000000FAFAFA00EFE6DD00F9F4
      ED00F9F5EE00FFFCF5000708080000000000FDFAF500FAF7F100FBF7F1000000
      0000000000000000000000000000FCF9F500FCFAF600FCFAF700A3A3A2000000
      0000A6A5A500FDFCFA00FEFDFB00FFFFFE000000000000000000D9D9D800FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00E5C49C00E0BC9900EEC8
      A600F2CEAB00EDC6A100D3B08E00D9B89800F2CEAB00EEC8A600D9B89800EAC5
      A400C7BC8A009CBF7B00A3A06D008C756600C6AA8E00F4CDAB00F0CCA800F2CE
      AB00E1B79B00EFCAA800F1CDAA00F1CDAA00E4BA9C00F3CAA9009CBF7B007991
      4800C5A58900EACAB300D8BDA500FFFFFF00EFF5FF00AFBAFF00293CD3001731
      F000152FF500142FF500152FF300152FF300142FF500142FF500142EF2001D34
      E7003447D800B9C5FF00EFF3FF00FBFBFF00FBFCFF00FAFCFF00F8F9FF00EFF5
      FF00D8E0FF004B58C6002238DE00152FF300152FF5001D34E7002B3DC6006C78
      D000CFD2F100FBFAFC00FFFEFF00FFFEFF000000000000000000000000000000
      0000000000000000000000000000EFD0C000FFC8B000FFE8C000FFF8C000FFD8
      A000FFE0B000FFF8BF00FFFFD000FFFFD000FFFFE000FFFFE000FFFFE000FFFF
      EF00FFFFDF00FFFFD000EFD0A000705F6000FFF0E000FFF0DF00FFE8DF00FFE8
      DF00FFD8C000DF8F7F00606760000000000000000000FAFAFA00EFE6DD00F9F4
      ED00F9F5EE00FFFDF6000606060000000000FFFFFA00FAF7F100FBF7F1000000
      0000000000000000000000000000FCF9F500FCFAF600FCFAF700A1A1A0000000
      0000B9B8B700FDFCFA00FEFDFB00FFFFFE000000000000000000D3D3D200FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00D7CBC500968D8600AC91
      7800F5D1AD00E7C8AF0089827C006B5C4E00FAD4B100E7C8AF007A706600907B
      6800F9CFAE00A3C486009CBF7B00907B680087716200EFCAA800F4CFAC00F2CE
      AB00E4BA9C00F0CCA800F1CDAA00F2CEAB00E4BA9C00F4CDAB00ADCE96007991
      4800B3987E00F2F3F400CBCACA00FFFFFF00FAFCFF00EAF1FF004454D6001E35
      E5001832F100142EF600142FF500142FF500142EF600152FF3001731EF002D43
      E300B6C4FF00E4EDFF00F3F5FF00F8F9FF00F4F8FF00EFF5FF00E8EEFF00919C
      F6002C3DC2002238DE001932EE00152FF500152FF5002439DB005B67C700B5BB
      E800EFF2FF0000000000FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000F0D8C000FFD0BF00FFE0C000FFF8C000FFD8
      AF00FFF0C000FFF0BF00FFF8CF00FFFFD000FFFFDF00FFFFDF00FFFFDF00FFFF
      DF00FFFFD000FFFFDF00DFB790007F676F00FFF0E000FFB7B000FFAFB000FF9F
      A000FF9F9F00DF978F00606760000000000000000000FAFAFA00EFE6DD00F9F4
      ED00F9F5EE00FFFAF3001312120000000000EFEBE600FAF7F100FBF7F100FFFE
      FD000000000001010200FFFFFE00FCF9F500FCFAF600FCFAF700BDBCBA000000
      000076767500FEFCFA00FEFDFB00000000000000000000000000ECECEB00FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00FFFFFF00FFFFFF007A68
      5600FAE8D800FFFFFF00FFFFFF00B6ACA400F0C9A400FBF0E500E9E9E9007A68
      5600FAD4B100EFC0A300C7BC8A00A3C486009CAC6900877162009A867400F5D1
      AD00F4CFAC00E9C0A000F6D2AE00E2B58300EACAB300E9CFC200D3DCBF0082A9
      5900B1C5CB00DBF0F500D6D5D400FEFEFD0000000000F3F6FF00B3BEFF002D3F
      CC001D35E500152FF300142FF500142EF600142EF6001630F400162FEB00041A
      B9003544B2007F89D700A7B0F000B6BDFC008E96DC00646FC30024319D002133
      BC001E36E400152FF300142FF5001731F0001E36E4004052D5009CA4E000E5E9
      FC00FCFCFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFE0CF00E0C8C000FFE0B000FFFFDF00FFF0
      C000FFE0B000FFE0AF00FFF0C000FFF8CF00FFFFCF00FFFFD000FFFFDF00FFF8
      C000FFFFCF00FFF8CF00CF9F9000D0B7B000EFB79000F09F4000EF973000E08F
      3000DF873000BF8F6F00606760000000000000000000FAFAFA00EFE6DD00F9F4
      ED00F9F5EE00FAF5EE0081807C0000000000A3A19E00FAF7F000FBF7F100CCCA
      C7000000000024232300FFFDF700FCF9F500FCFAF600FCFAF700F5F3F1000000
      00000606060000000000FEFDFB0000000000000000000000000000000000FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00FFFFFF00FFFFFF007A70
      6600FEFBF300FFFFFF00FFFFFF00D6D5D400E0BC9900FAE8D800F9FAF9007A70
      6600E9C0A000DEB29300F5CAAC00A9BE8100A4CA8F009E8B690087716200A283
      4D00FAD4B100F4CDA800EAC4A200F3E8E200FFFFFF00FFFFFF00D6E4CA0089B3
      6300C1D0D800B5E5EF00D3D1D200FFFFFF0000000000FAFBFF00EDF3FF008D98
      F200273CD4001732EE00152FF300142EF600142EF600152FF500142EED000C23
      D600071DB9000B1DAA000719A2000E20A9001225B600182DC5002437DE001E34
      E7001731F000142FF500142EF6001E36E6003042C5008590E400D7DCFD00F8FB
      FF00FFFEFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFE0CF00F0E8DF00E0BFA000FFFFDF00FFFF
      F000FFF8EF00FFE8CF00FFD8A000FFF0C000FFE8B000FFF0C000FFF0C000FFF0
      C000FFF8D000FFE0B0009F5F6F00E0C8D000EFBFA000FFBF5F00FFA72F00FFA7
      1F00CF8F4F0060676000000000000000000000000000FAFAFA00EFE6DD00F9F4
      ED00F9F5EE00FAF5EE00FEFCF6000000000000000000DEDDDB00F6F6F4000000
      000000000000E2E0DD00FCF9F400FCF9F500FCFAF600FCFAF700FFFFFD001515
      14000000000065656400FBFAF90063636200000000003737370000000000FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00FFFFFF00FFFFFF00968D
      8600FFFFFF00CBC6C300FFFFFF00FEFEFD009B826C00F0CCAE00FFFFFF00F8F7
      F700EBECEC00B6B1AE0087705A00FAD4B100EDC6A100A4CA8F009EC583008D87
      6B00407F9000B1C5CB00FBFCFB00E5E4E400D3D1D200E9E9E900D6E4CA0082A9
      5900D3E4EA008EBDC800E0DFE000FFFFFF0000000000FDFEFF00FAFBFF00EAF1
      FF006F80EF00253BD6001D34E7001731F000142FF500142FF500152FF3001731
      EF001B33EB001D34E8001D34E8001D33E9001B32EC001731EF00152FF500152E
      F600152FF5001731EF001E36E4002D3FCC00828CE400CFD5FF00F6F6FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFE8CF00FFFFFF00CF979F00FFE8C000FFFF
      FF00FFFFFF00FFF8EF00FFD8B000FFE0BF00FFE0AF00FFD8A000FFE0AF00FFFF
      CF00FFF8BF00CF9F8F009F6F8F00FFF0EF00EFC8AF00FFD08F00FFB75000D09F
      60006067600000000000000000000000000000000000FAFAFA00EFE6DD00F9F4
      ED00F9F5EE00FAF5EE00FCF6F000666563000000000000000000000000000000
      000030302F00FEFDFB00FCF9F400FCF9F500FCFAF600FCFAF700FDFBF800EEED
      ED000000000000000000000000000000000000000000FEFEFE00FEFEFD00FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00FFFFFF00FFFFFF00CBCA
      CA00FFFFFF00A9A19800FFFFFF00FFFFFF007A685600EEC8A600FFFFFF00FBFC
      FB00FEFBF300FBF0E500E3C1A000F4CFAC00E7BEA100D4C39400ADC385009CBF
      7B0072AAB1004F8C9C00B1C5CB00EBECEC00DAD9D900C3C2C300BBD2A6007991
      4800AFE2ED00CDD9DC00FBFCFB00FFFFFF0000000000FFFEFF00FDFEFF00F6F9
      FF00EAF1FF00828FEB002B3FCD001D35E5001531F000142EF600142FF500142E
      F400152FF3001730F2001730F2001730F200152FF300152FF300142EF600152F
      F5001731F0001F36DF003A4CC9008A95E700D9DDFF00F6F6FF00FDFDFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFE8D000FFFFFF00FFFFFF00EFA7B000FFFF
      F000FFFFFF00FFF8F000FFFFD000FFE8BF00FFE0A000FFF0BF00FFFFDF00FFE0
      AF00E0AF8F00C08F7F00FFF8EF00FFF0EF00F0D0B000FFD89F00CF976F006067
      60000000000000000000000000000000000000000000FAFAFA00EFE6DD00F9F4
      ED00F9F5EE00FAF5EE00FAF5EF00FAF6EF00FFFEF900C3C1BD00B3B1AD00E8E5
      E100FBF8F300FBF8F400FCF9F400FCF9F500FCFAF600FCFAF700FDFBF800FDFB
      F80000000000DCDBDA00B1B1B000CDCDCC00FFFFFE00FEFEFD00FEFEFD00FFFE
      FE0000000000F3EBE700B2B2B20000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CBCACA00E9E9E900FFFFFF00FFFFFF006B5C4E00D3B08E00FEFEFD00FEFE
      FD00BEBCBA00ADAFAE0089827C00EDD7CB00F2E0D800F3D1B200E2AF7600FBFC
      FB00B8CFA000B4CF9900A0C48C0092B08E0074AF8F00A0C48C0082A959008AE0
      E50090EDFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FDFD
      FF00F8FBFF00EBF1FF00A9B5FF004254D700253BD6001E37E1001E35E8001B33
      EB001931EF001731F0001731F0001731F0001932EE001B33E9001E35E5002238
      DE00293CD3005465DD00AFB9FF00E4E8FF00F9FAFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFE8D000FFFFFF00FFFFFF00FFFFFF00BF77
      8F00F0D8BF00FFF0C000FFFFD000FFFFD000FFFFD000FFF0CF00FFD8A000CF97
      9F00C0978F00EFE8EF00E0E8EF00E0E8E000F0D0B000D0AF8F00606760000000
      00000000000000000000000000000000000000000000FAFAFA00F0E7DE00F9F4
      ED00F9F5EE00FAF5EE00FAF5EF00FAF6EF00FAF6F000FAF7F100FBF7F100FBF7
      F200FBF8F300FBF8F400FCF9F400FCF9F500FCFAF600FCFAF700FDFBF800FDFB
      F800FDFCF900FDFCFA00FEFDFB00FEFDFC00FEFDFC00FEFEFD00FEFEFD00FFFE
      FE0000000000F4EDE800BCBCBC0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFD00FFFFFF00FFFFFF00F5F1F000F3E8E200E9CFC200F5DBC300F5DB
      C300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0E3E000F6EEEC00FFFF
      FF00FFFFFF00FFFFFF00F9FAF900EEF4E900E4EDDB00F6F9F400F9FEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFEFF0000000000FFFE
      FF00FCFCFF00F8FBFF00F1F6FF00DCE5FF0099A4F8004859C8002E41C800273B
      D6002238DE001E36E4001E34E7001F37E5002439DB00293DD2003242C4006170
      D700BAC3FF00DEE4FF00F1F4FF00FAFBFF00FDFEFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFD8B000FFE0BF00FFD8BF00FFD8BF00F0D0
      B000DFAFAF00DF9F9F00C0977F00CF977F00DFAFA000F0B7BF00E0B7A000DFAF
      A000EFBFAF00E0BFAF00E0BFAF00E0BFAF00EFC8AF00AF9F9000000000000000
      0000000000000000000000000000000000000000000000000000C9B4A800E5D7
      CD00E5D7CE00E6D7CE00E6D7CE00E6D8CE00E6D8CF00E6D9CF00E7D9CF00E7D9
      D000E7D9D000E7D9D100E7DAD100E7DAD200E7DBD200E7DBD300E7DBD300E7DB
      D300E7DBD400E7DBD500E7DBD500E7DBD500E7DBD500E7DBD500E7DBD500E7DB
      D600EBE0DA00C5AEA3000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDD7CB00F3E8
      E200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFEFF00000000000000
      00000000000000000000FDFEFF00F6FAFF00EAF1FF00DCE9FF00B2C1FF008194
      FF007286FF00475DFF00475BFF005167FF007487FF008EA0FF00BFCDFF00E1EA
      FF00F1F6FF00FBFDFF00FDFEFF0000000000FDFFFF00FDFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EDF2F500E2E3E300EBEBEC00F2F2F100FBFB
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000066666600666666006666
      6600666666006666660066666600666666006666660066666600666666000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F9F9F90002629C0002629C00015C9100145B87001E5F
      85002A607F004F6B7B005F747D00828D930095989A00AEAEB200B9BAB900D9DA
      D900DEDFDF00F2F2F10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000929292007979790092929200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000066666600D0D0B700EBEBCD00FFFE
      DD00FFFEDD00F3F3D500D0D0B700B9B9A5009C9C8D0083837B00666666006666
      6600666666006666660000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FFFF0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF0000FF00
      0000FFFF0000FF000000FFFF0000FF000000FFFF0000FF000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E2EEF500005D9B00005D9B0001609600016096000160
      96000160960002629C0001609600015C9100145B87001E5F85002A607F004F6B
      7B005F747D009B9D9E00E2E3E300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000089898900484848004A4A4A003939390045454500585858007979
      7900929292000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFF2CD00FFFEDD00FEF9D600FFF2CD00FEEC
      C500FFE9C100FFE9C100FEEEC900FEF5D100FEFAD800FFFEDD00F3F3D500C5C5
      AF00919185006666660066666600666666000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF
      0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF000000000000FFFF
      0000FFFF000000000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000015C9100015C9100015C
      9100015C9100015C9100015C91000968A6001C79C7001F80CF001F80CF001F80
      CF001E7CCE001C79C7001C79C7001570BF001570BF00126EB9000968A600105D
      A80002629C001E5F8500AEAEB200000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008E8E8E007373
      73004F4F4F0054545400A9A9A900C1B9B900BD9E9E00877373004B4545003D3D
      3D004F4F4F006565650092929200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FBF9DA00FFFEDD00FFF2CD00FEECC500FEE8BE00FEE4
      B900FEE0B500FEDEB100FEDEB100FEEEC900FEE6BC00FEE4B900FEECC500FEF5
      D100FFFEDD00F3F3D500B9B9A500666666006666660066666600000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FFFF0000FF000000FFFF0000FF000000FFFF0000FF00
      0000FFFF0000FF000000FFFF0000FF000000FFFF0000FF00000000000000FFFF
      0000FFFF00008080000000000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000015C9100094C7B000F3E
      68000F3E68000F3E68000C4470000E6BB1001E7CCE002184D1002588D3002184
      D1002184D1002184D1001F80CF001F80CF001F80CF001E7CCE001E7CCE001C79
      C7001570BF00145B8700A5A8A700000000000000000000000000000000000000
      0000000000000000000000000000000000008E8E8E0063636300575757009797
      97008887870086868600ABABAB00B0A6A600BB9F9F00C8A7A700D5B0B000A78C
      8C007666660039393900474747005B5B5B007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FBF9DA00FEF9D600FEEEC900FFE9C100FEE4B900FEE0
      B500FFDCAF00FED8A900FEE0B500EFF8D800FEFCE500FDE0B300FCE6C000FEEE
      C900FFEFCE00FEF5D100FEFCDA00FFFEDD00A5A5940066666600666666000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FFFF0000FF000000FFFF0000FF000000FFFF
      0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF000000000000FFFF
      0000FFFF0000808000008080000000000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000A5A8A700EEEEEE00016096000C4470001338
      6000133860001033530006642800126EB9002588D3002A91D800268CD5002A91
      D800288FD700288FD700268CD500278DD600268CD500258AD500258AD5002184
      D1001E7CCE00145B87009B9D9E00000000000000000000000000000000000000
      000000000000000000008E8E8E00585858006B6B6B00ACACAC00DCDCDC00D7D7
      D7006363630080808000A0A0A000AFA6A600938282007D737300BAA3A300BEA4
      A400CEB8B800D8B3B3009A8181004E4848003F3F3F0050505000686868009292
      9200000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFAD800FEF5D100FEECC500FEE8BE00FEE4B900FEDE
      B100FFDAAC00FFD4A400FEDEB100BFE6AC008FD28300FFFFF000FFFEF500FFFF
      FC00FFFFFC00FFFEF500FEFAD800FEF9D600FFFEDD00DBDBC100666666006666
      66000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FFFF0000FF000000FFFF0000FF00
      0000FFFF0000FF000000FFFF0000FF000000FFFF0000FF00000000000000FFFF
      0000FFFF000080800000808000008080000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      000000000000F6F6F6006F926F0059785900E7E7E700016096000C4470001338
      60001033530002521400269051001570BF00258AD5002D94DA00258AD5002C92
      D9002C92D9002C92D900228AD5002A91D800288FD700288FD700258AD500228A
      D5002184D100145B870095989A00000000000000000000000000000000000000
      0000828282005C5C5C0082828200CACACA00DBDBDB00D7D7D700D0D0D000CACA
      CA00C6C6C6007A7A7A00979797009B96960072686800000000000E0E0E002726
      260000000000454545008A7E7E00D6B8B800BE9D9D007C6A6A00474343004848
      48005B5B5B008080800000000000000000000000000000000000000000000000
      000000000000EDEBD500FBEBC000F8E0AE00FFF2CD00FEE8BE00FEE0B500FEDE
      B100FED8A900FED1A100FEE6BC00BFE6AC000099000060BF5B00009900000099
      00000099000060BF5B00DFF2D300FEF9DE00FEFCDA00FFFEDD00AAAA9A006666
      66000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FFFF0000FF000000FFFF
      0000FF000000FFFF0000FF000000FFFF0000FF000000FFFF000000000000FFFF
      0000FFFF00008080000080800000808000008080000000000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000CDCDCC000C94110038C34B0059785900A5A8A7000C44700009213500056E
      0A0025982A0090E5A2005FB69E001977B9002D8ED8003097DB00258AD5003097
      DB003097DB003097DB00258AD5002D94DA002C92D9002C92D900268CD500288F
      D700258AD500145B8700828D9300000000000000000000000000717171006565
      6500A0A0A000D4D4D400D9D9D900D4D4D400CFCFCF00CACACA00C4C4C400BDBD
      BD00B7B6B600737373008C8C8C008A8989007570700079717100554E4E002421
      210000000000000000000000000037373700DBC0C000E6BBBB00E5B9B900AF91
      91005D535300404040005C5C5C009F9F9F000000000000000000000000000000
      000000000000F8EFCF00F5D09700EDB26A00F6D9A400FEF0CA00FEE6BC00FEDE
      B100FED8A900FED1A100FFE9C100BFE6AC000099000000990000009900000099
      00000099000000990000109F0F00CFEBC200FFFEDD00FFFEDD00E6E6C9006666
      6600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF
      0000FFFF00008080000080800000808000008080000080800000000000000000
      000000000000000000000000000000000000000000000000000000000000A5A8
      A700168125002ABE3C0038C34B00056E0A002C772D00056E0A001D8D220055C0
      63007BD8920090E5A20045A286001C79C7002D8ED8003097DB00228AD5003399
      DD003097DB003097DB00268CD5003097DB002D94DA002D94DA00278DD6002A91
      D800268CD500015C910081888D00000000000000000084848400A0A0A000DCDC
      DC00D9D9D900D3D3D300CDCDCD00C8C8C800C3C3C300BABABA00B7B6B600B1B1
      B100A9A9A90079797900AEAEAE00BDBDBD00757575006B696900777171006961
      610000000000000000000000000010101000292929007D737300D0B4B400E6BB
      BB00F3C4C400D7AEAE0040404000929292000000000000000000000000000000
      000000000000FEF4CE00F6C08200F0B56F00F0B56F00F2BE7D00F8DAA700FEF0
      CA00FFE9C100FFDAAC00FFE9C100BFE6AC000099000000990000009900000099
      000030AC3000109F10000099000030AC2D00FEFCE500FFFEDD00FFFEDD006666
      6600666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF
      0000FFFF00008080000080800000808000008080000080800000000000008080
      80000000000000000000000000000000000000000000F6F6F6006F926F0012AA
      1E0024BA35002ABE3C0034BC440043C556004CC960005CCE710062CF76006FD3
      84007BD8920025982A00054A2F001F80CF003295DC00389CDE00228AD500389C
      DE003399DD003399DD00278DD6003399DD003399DD003399DD002A91D8002D94
      DA002D8ED800015C91006D7C840000000000A9A9A900BDBDBD008E8E8E00D0D0
      D000CDCDCD00C6C6C600C0C0C000BABABA00B4B4B400AEAEAE00A9A9A900BEBE
      BE00DCDCDC00EFEFEF00A4A4A4006666660098989800B9B9B900A0A0A0007A78
      7800706A6A00514B4B002B27270088878700685B5B00352E2E0069616100CFAC
      AC00DBB4B400E8BDBD0040404000929292000000000000000000000000000000
      0000EEEADC00FEECC500F2B97600F2B97600F2B97600F2B97600F2B97600F2B9
      7600F5C68A00F9DCAC00FEF6D400AFDD9D0000990000009900000099000060BF
      5B00FFFFFC00EFF8E30070C66A00009900009FD89300F9DCAC00FFFEDD008383
      7B00666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000FFFF
      0000FFFF00008080000080800000808000008080000080800000000000008080
      8000000000000000000000000000000000000000000075AB7500068B090018B8
      290018B829002ABE3C0034BC440043C556004CC960005CCE710062CF760074D6
      8B006FD38400025214000C4470002184D1003295DC00389CDE002588D300389C
      DE00379EE100379EE100278DD600379EE1003399DD003399DD002C92D9003295
      DC002C92D900015C91006D7C840000000000A9A9A900D0D0D000CACACA00C6C6
      C600BEBEBE00B9B9B900B3B3B300ACACAC00B7B6B600D4D4D400EAEAEA00E9E9
      E900E1E1E100DEDEDE00DCDCDC00D0D0D0009B9B9B0068686800656565009797
      9700B7B6B600A5A3A300837E7E00857B7B0093848400574D4D00AC9595008A76
      760041554200AC8E8E0040404000929292000000000000000000000000000000
      0000F0E1CB00F9DCAC00F4BD7D00F4BD7D00F4BD7D00F4BD7D00F4BD7D00F4BD
      7D00F4BD7D00F6C08200FEEEC90080CC7200009900000099000000990000109F
      1000CFECCB00FEFEE800FEF9E2009FD8930030AC2D00FEF6D400FEF5D1009595
      8900666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF00008080000080800000808000008080000080800000000000008080
      8000000000000000000000000000000000000000000000000000CDE3CD0012AA
      1E0024BA35002ABE3C0034BC440043C556004CC960005CCE71005CCE71001D8D
      2200054A2F0013386000094C7B002588D300389CDE00175B9A000D4D8F00164A
      75001E5F85003BA1E300288FD7003BA1E300379EE100379EE1002D94DA00389C
      DE003399DD00016096005F747D0000000000ABABAB00C4C4C400BDBDBD00B9B9
      B900B1B1B100B4B4B400CACACA00E3E3E300EDEDED00EAEAEA00E9E9E900C4C4
      C400C6C6C600CACACA00CFCFCF00D0D0D000D7D7D700DBDBDB00CFCFCF009B9B
      9B00666666006565650097979700B7B6B600A4A1A100878080008D7F7F007769
      69003AA45D005E4F4F0040404000929292000000000000000000000000000000
      0000FBE9C500FBD19D00F6C18400F6C18400F6C18400F6C18400F6C18400F6C1
      8400F6C18400FBD19D00EFF9D200BFE6AC0060BF5B0040B33C0030AC2D000099
      000030AC2D00FFFEF500FBF4CF00FEF9E20050B94A00EFF9D200FFF2CD00A5A5
      9400666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000808080008080800080808000808080008080800000000000FFFF
      0000FFFF00008080000080800000808000008080000080800000000000008080
      8000000000000000000000000000000000000000000000000000000000004A8F
      4A000E9D16002ABE3C0034BC440038C34B0034BC440034A83C001D8D2200054A
      2F001338600013386000094C7B002D8ED8002F8BCB00105DA800126EB9000D53
      9B000F3E68003BA1E3002A91D8003BA1E3003BA1E3003BA1E3003097DB00379E
      E1003399DD0002629C004F6B7B0000000000ABABAB00B7B6B600B3B3B300C0C0
      C000DBDBDB00EDEDED00F1F1F100F1F1F100EFEFEF00EDEDED00BDBDBD00CC80
      8000935353007B555500686868008A898900B1B1B100C6C6C600D0D0D000D7D7
      D700DBDBDB00D9D9D900A3A3A300717171006E6E6E0094949400B1B1B100A7A3
      A300867E7E00917F7F005353530092929200000000000000000000000000EEE3
      D100FFE9C100FBC99200FAC48B00FAC48B00FAC48B00FAC48B00FAC48B00FAC4
      8B00FAC48B00FBD19D00BFE6A800DFF1CC00FEF9DE00FEFCE500FFFEF500CFEC
      CB00FFFFFC00FFFFFC00FFFFF000FFFCEC00CFECBC00BFE6A800FEF4CE00D1D1
      B800666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000808080008080800080808000808080008080800000000000FFFF
      0000FFFF00008080000080800000808000008080000080800000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000F7FBF7001D8D220024AD31005978590058839B00084E8200133860001338
      60001338600013386000084E82002D8ED8001563A8001F80CF002184D1001C79
      C700105DA8003794CC002C92D9003FA5E5003FA5E5003FA5E5003399DD003BA1
      E300379EE1000968A6004F6B7B0000000000A0A0A000CFCFCF00EAEAEA00F3F3
      F300FAFAFA00F8F8F800F6F6F600F4F4F400F3F3F300F1F1F100C0C0C000FF9C
      9C00CC666600CC66660089707000E4E4E400A0A0A0008B8B8B0086868600A0A0
      A000C3C3C300CFCFCF00D7D7D700DBDBDB00D9D9D900A3A3A3006E6E6E006E6E
      6E009494940094949400A3A3A30000000000000000000000000000000000EEE3
      D100FEE4B900FDC99300FDC99300FDC99300FDC99300FDC99300FDC99300FDC9
      9300FDC99300FED1A100CFECB70050B94A00FEFCE500FEF9D600FFFFF00050B9
      4A00009900000099000040B33C0040B33C00CFECBC00EFF5D000FEE6BC00DBDB
      C100666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080800000000000000000
      000080808000808080008080800080808000808080008080800000000000FFFF
      0000FFFF00008080000080800000808000008080000080800000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000CDE3CD00359736006F926F004C7CA100094C7B00133860001338
      60001338600013386000035789003092DB00105DA800469BD900469BD9002F8B
      CB00105DA8003E9BD1002C92D90042A8E6003FA5E5003FA5E500379EE1003FA5
      E500379EE1000968A6003B647B000000000000000000A0A0A000C3C3C300C4C4
      C400EAEAEA00FAFAFA00FAFAFA00F8F8F800F6F6F600F4F4F400C3C3C300FFA0
      A000CC666600CC66660081686800DCC3C300E5B9B900EDE1E100E7E7E700B1B1
      B1008E8E8E00827B7B008A898900BABABA00CFCFCF00BABABA0094949400A0A0
      A000A0A0A000000000000000000000000000000000000000000000000000F3E2
      C400FEDEB100FECC9900FECC9900FECC9900FECC9900FECC9900FECC9900FECC
      9900FECC9900FECC9900FEFAD80020A61D009FD89300FEFEE800FEFCE500EFF8
      E90020A62000009900000099000000990000BFE6AC00FFDAAC00FED8A900FFFE
      DD00666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080800000808000000000
      000080808000808080008080800080808000808080008080800000000000FFFF
      0000FFFF00008080000000000000000000008080000080800000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F6F8FA003280B2000F3E6800133860001338
      60001338600013386000035789003BA1E3002F8BCB00D3CFF200E2EEF5006E9F
      C0001563A80048AEEB002A91D80045AAEA0042A8E60045AAEA003BA1E3003FA5
      E5003FA5E5000B6CA9003B647B00000000000000000000000000000000000000
      0000A0A0A000A0A0A000B7B6B600D3D3D300FAFAFA00F8F8F800C6C6C600FFA2
      A200CC666600CC666600765D5D00B8858500BE585800E2AFAF00F4F4F400E7E7
      E700D9D9D900CD9A9A00804D4D00935353006D4747004D4D4D00000000000000
      000000000000000000000000000000000000000000000000000000000000F8E0
      BA00FFDAAC00FED1A100FED1A100FED1A100FED1A100FED1A100FED1A100FED1
      A100FED1A100FED1A100FFE9C10080CC72000099000070C66A00EFF8E300FFFF
      FC008FD28D00009900000099000000990000BFE6AC00FEDEB100FFDAAC00FFFE
      DD00666666006666660000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000808000008080
      000000000000808080008080800080808000808080008080800000000000FFFF
      0000FFFF00000000000080808000000000008080000080800000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EDF2F5002A74A4000F3E6800133860001338
      6000133860000F3E6800035789003BA1E30042A8E600498BB30074ACD4001977
      B90049A3D90048AEEB002D94DA0048AEEB0045AAEA0048AEEB003FA5E50042A8
      E6003FA5E5001273B4002A607F00000000000000000000000000000000000000
      0000000000000000000000000000A0A0A000B4B4B400BDBDBD008B8B8B00FFA6
      A600CC666600CC66660079606000A7747400B44E4E00D6A3A300FDFDFD00F4F4
      F400E7E7E700D5A2A200804D4D00CC666600CC6666004A4A4A00000000000000
      000000000000000000000000000000000000000000000000000000000000FEE0
      B500FFDAAC00FED8A900FED8A900FED8A900FED8A900FED8A900FED8A900FED8
      A900FED8A900FED8A900FFDAAC00EFF5D00020A61D00009900000099000030AC
      2D0000990000009900000099000000990000BFE6AC00FEE0B500FED8A900FFFE
      DD0083837B006666660000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF00008080
      000080800000000000008080800080808000808080008080800000000000FFFF
      0000FFFF000000000000FFFFFF00000000008080000080800000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D9E7F0000C64980013386000133860001338
      6000133860000F3E6800015C91003FA5E50045AAEA00379EE100379EE1004BB1
      EE004BB1EE004BB1EE002D94DA004BB1EE0048AEEB0048AEEB0045AAEA0045AA
      EA0042A8E6001977B9001E5F8500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFA9
      A900CC666600CC666600866C6C00BA878700A9434300BF8C8C00E7E7E700FDFD
      FD00F4F4F400DBA8A800804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000F1DDC400FEE0
      B500FEDEB100FEDEB100FEDEB100FEDEB100FEDEB100FEDEB100FEDEB100FEDE
      B100FEDEB100FEDEB100FEDEB100FEE6BC00CFEBC200109F0F00009900000099
      000000990000009900000099000000990000BFE6AC00FEE8BE00FEDEB100FEFC
      DA00959589006666660000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      000080800000808000000000000080808000808080008080800000000000FFFF
      0000FFFF00008080000000000000000000008080000080800000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C9DDEA000160960013386000103353001338
      6000133860000C447000015C910045AAEA0048AEEB00379EE1003BA1E3004EB5
      F0004BB1EE004EB5F0002D94DA004EB5F0004BB1EE004BB1EE0048AEEB0042A8
      E60048AEEB001977B900145B8700FFFFFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFAC
      AC00CC666600CC6666008B727200CA9797009F393900A5727200C3C3C300E7E7
      E700FDFDFD00E1AEAE00804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000F1DDC400FDE0
      B300FEE4B900FEE4B900FEE4B900FEE4B900FEE4B900FEE4B900FEE4B900FEE4
      B900FEE4B900FEE4B900FEE4B900FEE4B900FEEEC900DFF1CC0060BF5B000099
      000000990000109F0F0080CC7E00109F0F00BFE6AC00FFEAC400FEE4B900FEF9
      D600A8A897006666660000000000000000000000000080800000808000008080
      00008080000080800000808000008080000080800000FFFF0000FFFF0000FFFF
      0000FFFF0000808000008080000000000000808080008080800000000000FFFF
      0000FFFF00008080000080800000808000008080000080800000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B9D1DD0002629C0006642800056E0A000921
      3500103353000C4470000160960045AAEA004BB1EE0049A3D9005CB2E80073BB
      E6007AC1E70086C2E40074ACD4009AC9DC009AC9DC009AC9DC00A7C8D700A7C8
      D70084BEDE001F81C600145B8700F9F9F9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFAF
      AF00CC666600CC666600876E6E00DCC3C300C58C8C00B58E8E00A3A3A300C3C3
      C300E7E7E700E4B1B100804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000F3DCBA00FEE4
      B900FEECC500FEECC500FEECC500FEECC500FEECC500FEECC500FEECC500FEEC
      C500FEECC500FEECC500FEECC500FEECC500FEECC500FEEEC900FFF9E400FFFE
      F500FFFFFC00FFFBEC00FEF9E200BFE5B400BFE6AC00FFF2CD00FEECC500FEF9
      D600B1B19F0066666600000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF00008080000080800000000000008080800000000000FFFF
      0000FFFF00008080000080800000808000008080000080800000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A9BCC700015893000252140034BC44000252
      1400092135000C4470000160960042ACF10084BEDE00F1E3CF00F3E8D300FDEC
      D300FDECD300FDECD300FFF5D700FFF5D700FFF9D800F9F2D700FFF5D700FDEC
      D300FCE5C7001F81C60003578900F9F9F9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFB3
      B300CC666600CC6666005B4F4F0098989800C6C6C600F4F4F400C6C6C600A3A3
      A300C3C3C300D4A1A100804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FAD9AF00FEE8
      BE00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FFF2
      CD00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FEF4CE00FEF5D100FEF5
      D100FEF5D100FEF5D100FFF2CD00FEF9E200FEFCE500FEF5D100FFF2CD00FEF9
      D600D1D1B80066666600000000000000000000000000FFFF0000FFFF0000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFF0000FFFF000080800000000000008080800000000000FFFF
      0000FFFF00008080000080800000808000008080000080800000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000B9BAB9006F926F0012841400189B1F0045B24D0062CF76007BD8
      920034A83C0009485200005D9B005CB2E800E7E2D3005D58F200544EF1006762
      F3003E39EF00FFFFFE00544EF1003E39EF00211BED00EEEEFD00B6B3F800E9E4
      F300FFF4DC002184D10003578900F6F6F6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFB6
      B600CC666600CC666600CC666600B96060009C565600804D4D00796060006D66
      66006B6B6B00A370700076494900CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FDD6A900FEF0
      CA00FEF9D600FEF9D600FEF9D600FEF9D600FEF9D600FEF9D600FEF9D600FEF9
      D600FEF9D600FEF9D600FFF2CD00FFF2CD00FEF5D100FEF0CA00F6E3BB00F6E3
      BB00FEFCDA00FFFEDD00FFFEDD00FEFCDA00FEFAD800FEF9D600FEF9D600FEFC
      DA00D0D0B70066666600000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      FF00FFFF0000FFFF00008080000000000000808080008080800000000000FFFF
      0000FFFF00008080000080800000808000008080000080800000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000E7E7E70012841400189B1F0043C5560055CA690062CF760067D17C0074D6
      8B0083DC9A000F785300005D9B005CB2E800EFEDD7000F08ED00544EF100A6A2
      F600544EF100BDBBFA00211BED00BDBBFA002B24EE00FFFFFE00B6B3F800EAE6
      F900FFF4DC002685C900015C9100F2F2F1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFB9
      B900CC666600CC66660089505000A6595900C2636300CC666600CC666600CC66
      6600B9606000A6595900804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FFD4A400FEF5
      D100FFFEDD00F3DDB500F3DDB500FFFEDD00FFFEDD00FFFEDD00FFFEDD00FFFE
      DD00FEF5D100FEECC500F8DDB300E6AF7D00DB935A00DE996100E19C6400E19C
      6400E4A26A00ECAF7800F3CA9A00F3DDB500FFFEDD00FFFEDD00FFFEDD00FFFE
      DD00F3F3D5006666660000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFFFF00FFFF
      0000FFFF0000808000000000000080808000808080008080800000000000FFFF
      0000FFFF00008080000080800000808000008080000080800000000000008080
      8000000000000000000000000000000000000000000000000000000000004A8F
      4A000E9D160034BC440034BC440043C556004CC960005CCE710067D17C0074D6
      8B007BD89200338E9500005D9B0068BBEC00F9F2D700211BED007974F500BDBB
      FA00FFFFFE000F08ED00B6B3F800D6D5FC002B27F000FFFFFE00B6B3F800E6E5
      FC00FFFBE400288FD700015C9100EEEEEE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFBC
      BC00CC666600CC666600735F5F00C0C0C0009F9F9F00918B8B008A7171008C59
      590093535300A6595900CC666600CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FED1A100FEF0
      CA00D3905900CA793D00CC7C4000E5B48200FFFEDD00FFFEDD00FFFEDD00FEF0
      CA00FFE9C100EBBB8B00DB935A00DB935A00DE996100E19C6400E19C6400E4A2
      6A00E6A46D00E7A77000E9A97200EAAC7500EEB47F00F8DDB300FFFEDD00FFFE
      DD00FFFEDD006666660000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF0000FFFF
      000080800000000000008080800080808000808080008080800000000000FFFF
      0000FFFF00008080000080800000808000008080000080800000000000008080
      8000000000000000000000000000000000000000000000000000000000000E9D
      160024BA35002ABE3C0038C34B0043C556004CC960005CCE710067D17C0074D6
      8B007BD89200338E9500005D9B0068BBEC00F9F2D7000F08ED003D36EF00BDBB
      FA00FFFFFE000F08ED008681F500DFDDFB00312AEE00FFFFFE00B6B3F800AEAE
      B200C8B7A4002D94DA0001609600EEEEEE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFBF
      BF00CC666600CC666600876E6E00CDCDCD00DBDBDB00E3E3E300F6F6F600F8F8
      F800EFEFEF00CACACA0066666600CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FED1A100ECC1
      9200CA793D00C8834E00CA8E6200D3A77D00FFFEDD00FFFEDD00FEECC500FEE4
      B900DB935A00DB935A00DB935A00DE996100E19C6400E19C6400E4A26A00E6A4
      6D00E7A77000E9A97200EAAC7500ECAF7800EEB17C00F0B37E00F4C59500FEFA
      D800FFFEDD006666660000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFF00008080
      000000000000808080008080800080808000808080008080800000000000FFFF
      0000FFFF00008080000080800000808000008080000080800000000000008080
      800000000000000000000000000000000000000000000000000075AB750018B8
      290024BA350024BA350024AD310025982A00168125001D8D220055C063007BD8
      920045B24D00005774000968A6007AC1E700FFF5D7000F08ED004942F1006F6A
      F400322DF000FFFFFE00544EF100544EF1004942F1006F6AF4007469E800F4E5
      D50086C2E4003097DB0001609600E2E3E3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFC2
      C200CC666600CC666600866C6C00D0D0D000CDCDCD00C4C4C400B4B4B400BDBD
      BD00B1B1B100D7D7D70098989800CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FBD19D00CDB2
      9300000000000000000000000000DBDBC100FFFEDD00FFE9C100FEE0B5006666
      66000000000000000000E19C6400E19C6400E19C6400E4A26A00E6A46D00E7A7
      7000E9A97200EAAC7500ECAF7800EEB17C00F0B37E00F2B68100F3BA8400F8CD
      9E00FEEEC9006666660000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000808000000000
      000080808000808080008080800080808000808080008080800000000000FFFF
      FF00FFFF00008080000080800000808000008080000080800000000000008080
      80000000000000000000000000000000000000000000E2EDE2001D8D220018B8
      290018B829001D8D22004A8F4A00296F8C00035789000664280055C063002598
      2A0002521400035789000B6CA90086C2E400F9F2D7006762F3008681F500B6B3
      F800BDBBFA00FFFFFE00F4F6FB00F4F6FB00FBFBFC00FFFFFE00FFFBED009AC9
      DC0051BCF900389CDE0002629C00DEDFDF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFC5
      C500CC666600CC666600866C6C00CACACA00B7B6B600B9B9B900B4B4B400BABA
      BA00C8C8C800E1E1E10097979700CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FED1A100F3DC
      BA006666660066666600EBEBCD00FEFCDA00FEE6BC00FEDEB100666666000000
      000000000000000000000000000000000000E6A46D00E6A46D00E7A77000E9A9
      7200EAAC7500ECAF7800EEB17C00F0B37E00F2B68100EDBE9300F5BD8A00F8C1
      8D00F8C18D006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080800000000000000000
      0000808080008080800080808000808080008080800080808000808080000000
      0000FFFFFF00FFFF000080800000808000008080000080800000000000008080
      800000000000000000000000000000000000000000008BC38B000C9411004A8F
      4A00D4D5D10000000000000000001B6D9F00015C910006642800056E0A001338
      600013386000035789001271AC0086C2E400FCE5C700FEF6EA00FEF6EA00FFF3
      E200FFF3E200FFEFDB00FFEFDB00FDECD300FAE7D500F1E3CF00D9DAD9004CB7
      F40055B8F500389CDE0002629C00D9DAD9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFC9
      C900CC666600CC666600856B6B00C8C8C800AEAEAE00BDBDBD00C3C3C300DBDB
      DB00C6C6C600E4E4E40094949400CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FED1A100FED8
      A900FEFCDA00FEF9D600FEECC500FED8A900FDD6A90066666600000000000000
      0000000000000000000000000000000000000000000000000000E9A97200EAAC
      7500ECAF7800EEB17C00E6AF7D00AF988400000000000000000000000000F4C5
      9500FBC690006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      800000000000FFFFFF00FFFF0000808000008080000080800000000000008080
      800000000000000000000000000000000000000000008BC38B00068B0900E2E3
      E3000000000000000000000000001B6D9F00015C910009485200094852000F3E
      680013386000035789001271AC0068BBEC00E7DCCA00FCE5C700F4E5D500E7DC
      CA00D4D5D100B9D1DD00A7C8D7007AC1E70068BBEC0055B8F5004CB7F4004EB5
      F0004EB5F0003092DB0002629C00D9DAD9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CACACA00FFCB
      CB00CC666600CC666600856B6B00E1E1E100E3E3E300E7E7E700D4D4D400D3D3
      D300C4C4C400D0D0D00094949400CC666600CC6666004F4F4F00000000000000
      000000000000000000000000000000000000000000000000000000000000FECF
      A000FBD19D00FED1A100FBD2A400FBD2A4000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ECAF
      7800EEB17C00F0B37E00A082670070707000000000000000000000000000E5BA
      9000FDC895006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      80008080800000000000FFFFFF00FFFF00008080000080800000000000008080
      8000000000000000000000000000000000000000000094C894004A8F4A000000
      0000000000000000000000000000A7C8D700498BB300498BB300498BB300498B
      B300498BB300016096001271AC0045AAEA0042ACF1003CA4EA00379EE1003293
      D4002F8BCB001F81C6001273B4000968A6000C649800015C9100015C91000158
      9300015C91001B6D9F004283AB00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8C1
      C100EDBBBB00C6999900DEDEDE00C4C4C400E7E7E700F3F3F300EFEFEF00EFEF
      EF00EDEDED00EFEFEF0094949400CC666600CC66660075757500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0B37E00F2B68100DAAB80008A7A6B008A7A6B0092817100D2AB8400FDC8
      950083837B006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800000000000FFFFFF00FFFF000080800000000000008080
      80000000000000000000000000000000000000000000ECF5EC00CDE3CD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001B6D9F0002629C001271AC000968A6000160960001609600015C
      910002629C00015C9100005D9B000C6498000C6498004E8FB7006E9FC000B9D1
      DD00D9E7F000F6F8FA00FFFFFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D9D9D900EFEFEF00E3E3
      E300E1E1E100FAFAFA00AF9F9F00E1AEAE00C78E8E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F3BA8400F5BD8A00F8C18D00F8C18D00FBC69000FDC89500A8A8
      9700666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      800080808000808080008080800000000000FFFFFF00FFFF0000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008CB9D1004283AB0089A3B200A9BCC700E4EBEE00F9F9F9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FBC69000FBC69000FACA9900A8A897006666
      6600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000600000000100010000000000000600000000000000000000
      000000000000000000000000FFFFFF008000007FE1FFFFFF0000000000000000
      0000007FC03FFFFF00000000000000000000007FC007FFFF0000000000000000
      0000007FC000FFFF00000000000000000000007FC0001FFF0000000000000000
      0000007FC00003FF000000000000000000000000C00001FF0000000000000000
      00000000C00001FF000000000000000000000000C00001FF0000000000000000
      00000000C00001FF000000000000000000000000C00001FF0000000000000000
      00000000C00001FF000000000000000000000000C00001FF0000000000000000
      80000000C000007F0000000000000000E00000008000001F0000000000000000
      F8000000800000070000000000000000FE000000800000010000000000000000
      FF800000800000000000000000000000FFC00000800000000000000000000000
      FFC00000800001800000000000000000FFC00000800001E10000000000000000
      FFC00000800001FF0000000000000000FFC00000800001FF0000000000000000
      FFC00000800001FF0000000000000000FFC00000800001FF0000000000000000
      FFC00000800001FF0000000000000000FFC00000800001FF0000000000000000
      FFC00000800001FF0000000000000000FFC00000800001FF0000000000000000
      FFC00000E00001FF0000000000000000FFC00000FF0003FF0000000000000000
      FFC00001FFFE07FF0000000000000000ECBFF77FFF000001C000000300000000
      ECC0037FFE000001C0000001000000003F0000FFFE00000180003FF900000000
      3C00003FFE0000018001870900000000F8000008FE0000018000104900000000
      E000000CFE0000018000000900000000E0000007FE0000018000252900000000
      80000007FE000001800001090000000080000003C60000018000000900000000
      8000000382000001800000090000000080000000800000018000010900000000
      0004000080000001800005090000000000080001800000018000000900000000
      00700001C0000001800010490000000000600000E00000018000008900000000
      00400000F0000001800002090000000000000001F80000018000000900000000
      00000001FC000001800008090000000000000001FE0000018000104900000000
      00000001FE000001800400090000000000000801FE0000018001852900000000
      00000001FE000001800001090000000000002000FE0000018012000900000000
      00000000FE000001801200090000000000000005FE0000018000010900000000
      80000007FE000001800005290000000080000007FE0000038000002900000000
      8000001FFE00000780000009000000008000001FFE00000F8000080900000000
      E000007FFE00001F80000009000000002000007FFE00003FC000000300000000
      3C00013FFFFFFFFFFFFFFFFF00000000FFFE0FFFFFFFFFFFFF801FFF00000000
      FFFC0003FFFE3FFFFF0003FF00000000FFFC0001FFF807FFFE0000FF00000000
      FF800001FFC001FFFC00003F00000000FF800001FF00007FFC00001F00000000
      FE000001FC00000FFC00000F00000000F8000001F0000003F800000F00000000
      F0000001C0000000F800000F00000000E000000180000000F8000007FFE0000F
      8000000100000000F0000007FFE0000F8000000100000000F0000007FFE0000F
      C000000100000000F0000007FF60000FE000000100000000E0000007FF20000F
      F000000100000001E0000007FF00000FF800000180000007E0000007FF00000F
      FE000001F000003FE0000003FF00000FFE000001FE00003FE0000003FF00000F
      FE000001FFC0003FC00000030000000FFE000000FFC0003FC00000030000000F
      FE000000FFC0003FC00000030000000FFE000000FFC0003FC00000030000000F
      F8000000FFC0003FC00000030000000FF0000000FFC0003FC00000030000000F
      E0000000FFC0003FC0000003FF00000FE0000000FFC0003FC0000003FF00000F
      C0000000FFC0003FCE0C0003FF00000F80000000FFC0003FC01F0003FF00000F
      86000000FFC0003FC03FC0E3FF20000F8E000000FFC0003FE0FFE0E3FFE0000F
      9E000001FFE0003FFFFFF003FFE0000F9FF80001FFFF807FFFFFF807FFE0000F
      FFF81FFFFFFFFFFFFFFFFE0FFFE0001F00000000000000000000000000000000
      000000000000}
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select EC.*, L.Descricao, L.Tipo_Logradouro, L.CEP from Endereco' +
        '_Cliente EC'
      'inner join Logradouro L on (L.Codigo = EC.Codigo_Endereco)')
    Left = 880
    Top = 66
    object ADOQuery1Codigo_Cliente: TIntegerField
      FieldName = 'Codigo_Cliente'
    end
    object ADOQuery1Codigo_Endereco: TIntegerField
      FieldName = 'Codigo_Endereco'
    end
    object ADOQuery1Numero: TStringField
      FieldName = 'Numero'
      Size = 5
    end
    object ADOQuery1Descricao: TStringField
      FieldName = 'Descricao'
      Size = 70
    end
    object ADOQuery1Tipo_Logradouro: TStringField
      FieldName = 'Tipo_Logradouro'
    end
    object ADOQuery1CEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object ADOQuery1Tipo_Endereco: TStringField
      FieldName = 'Tipo_Endereco'
      Size = 30
    end
    object ADOQuery1Complemento: TStringField
      FieldName = 'Complemento'
      Size = 30
    end
    object ADOQuery1Codigo_Setor: TIntegerField
      FieldName = 'Codigo_Setor'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 912
    Top = 66
  end
  object DataSource2: TDataSource
    DataSet = qryitens_nf
    Left = 912
    Top = 130
  end
  object qryitens_nf: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    AfterEdit = qryitens_nfAfterEdit
    Parameters = <>
    SQL.Strings = (
      'select IP.*, '
      
        'Cli.Codigo as Cod_Cli, PEC.Inscricao_Estadual, Cli.Insc_Municipa' +
        'l, Cli.Email, Cli.Suframa, Cli.Enquadramento, '
      'PEC.Cidade, PEC.Nome, PEC.CPF_CNPJ, '
      
        'PEC.UF, PEC.Codigo_Municipio, PEC.Setor, PEC.Endereco as Log, PE' +
        'C.CEP, PEC.Numero, PEC.Complemento, PEC.Telefone,'
      
        'PPD.Forma_Pagamento, PPD.Qtde_Parcela, PPD.Prazo, PPD.Taxa, PPD.' +
        'Codigo_Forma_Pagamento, PPD.Forma_Pagamento,'
      
        'PPD.Tipo_Pagamento, Pro.Estoque, Pro.Volume, Pro.Valor_Compra as' +
        ' Valor_Compra_Atual from Itens_Pedido IP'
      'left join Pedido P on (IP.Codigo = P.Codigo)'
      'left join Cliente Cli on (P.Codigo_Cliente = Cli.Codigo)'
      'left join Pedido_Endereco_Cliente PEC on (P.Codigo = PEC.Codigo)'
      'left join Pedido_Pagamento_DAV PPD on (P.Codigo = PPD.Codigo)'
      'left join Produto Pro on (IP.Codigo_Produto = Pro.Codigo)')
    Left = 896
    Top = 258
    object qryitens_nfCodigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ReadOnly = True
    end
    object qryitens_nfCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryitens_nfN_Item: TStringField
      FieldName = 'N_Item'
      Size = 10
    end
    object qryitens_nfCodigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object qryitens_nfCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qryitens_nfNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object qryitens_nfOrigem: TStringField
      FieldName = 'Origem'
      Size = 1
    end
    object qryitens_nfCFOP: TStringField
      FieldName = 'CFOP'
      Size = 10
    end
    object qryitens_nfUN: TStringField
      FieldName = 'UN'
      Size = 10
    end
    object qryitens_nfTipo_Calculo_BC_ICMS: TStringField
      FieldName = 'Tipo_Calculo_BC_ICMS'
      Size = 50
    end
    object qryitens_nfTipo_Recolhimento: TStringField
      FieldName = 'Tipo_Recolhimento'
      Size = 10
    end
    object qryitens_nfICMS: TStringField
      FieldName = 'ICMS'
      Size = 10
    end
    object qryitens_nfCST: TStringField
      FieldName = 'CST'
      Size = 10
    end
    object qryitens_nfBase_Reduzida: TStringField
      FieldName = 'Base_Reduzida'
      Size = 5
    end
    object qryitens_nfBC: TStringField
      FieldName = 'BC'
      Size = 10
    end
    object qryitens_nfValor_ICMS: TStringField
      FieldName = 'Valor_ICMS'
    end
    object qryitens_nfTipo_Calculo_BC_ICMS_ST: TStringField
      FieldName = 'Tipo_Calculo_BC_ICMS_ST'
      Size = 50
    end
    object qryitens_nfMVAST: TStringField
      FieldName = 'MVAST'
      Size = 10
    end
    object qryitens_nfICMS_ST: TStringField
      FieldName = 'ICMS_ST'
      Size = 10
    end
    object qryitens_nfCST_ST: TStringField
      FieldName = 'CST_ST'
      Size = 10
    end
    object qryitens_nfBase_Reduzida_ST: TStringField
      FieldName = 'Base_Reduzida_ST'
      Size = 5
    end
    object qryitens_nfBase_Acrescida_ST: TStringField
      FieldName = 'Base_Acrescida_ST'
      Size = 5
    end
    object qryitens_nfBC_ST: TStringField
      FieldName = 'BC_ST'
      Size = 10
    end
    object qryitens_nfAliquota_Calculo_Credito: TStringField
      FieldName = 'Aliquota_Calculo_Credito'
      Size = 10
    end
    object qryitens_nfCredito_ICMS: TStringField
      FieldName = 'Credito_ICMS'
    end
    object qryitens_nfTipo_Calculo_IPI: TStringField
      FieldName = 'Tipo_Calculo_IPI'
    end
    object qryitens_nfIPI: TStringField
      FieldName = 'IPI'
      Size = 10
    end
    object qryitens_nfCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Size = 10
    end
    object qryitens_nfBase_Reduzida_IPI: TStringField
      FieldName = 'Base_Reduzida_IPI'
      Size = 10
    end
    object qryitens_nfBase_Acrescida_IPI: TStringField
      FieldName = 'Base_Acrescida_IPI'
      Size = 10
    end
    object qryitens_nfBC_IPI: TStringField
      FieldName = 'BC_IPI'
      Size = 10
    end
    object qryitens_nfValor_IPI: TFloatField
      FieldName = 'Valor_IPI'
    end
    object qryitens_nfTipo_Calculo_PIS: TStringField
      FieldName = 'Tipo_Calculo_PIS'
    end
    object qryitens_nfPIS: TStringField
      FieldName = 'PIS'
      Size = 10
    end
    object qryitens_nfCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 10
    end
    object qryitens_nfBase_Reduzida_PIS: TStringField
      FieldName = 'Base_Reduzida_PIS'
      Size = 10
    end
    object qryitens_nfBase_Acrescida_PIS: TStringField
      FieldName = 'Base_Acrescida_PIS'
      Size = 10
    end
    object qryitens_nfBC_PIS: TStringField
      FieldName = 'BC_PIS'
      Size = 10
    end
    object qryitens_nfValor_PIS: TFloatField
      FieldName = 'Valor_PIS'
    end
    object qryitens_nfTipo_Calculo_COFINS: TStringField
      FieldName = 'Tipo_Calculo_COFINS'
    end
    object qryitens_nfCOFINS: TStringField
      FieldName = 'COFINS'
      Size = 10
    end
    object qryitens_nfCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 10
    end
    object qryitens_nfBase_Reduzida_COFINS: TStringField
      FieldName = 'Base_Reduzida_COFINS'
      Size = 10
    end
    object qryitens_nfBase_Acrescida_COFINS: TStringField
      FieldName = 'Base_Acrescida_COFINS'
      Size = 10
    end
    object qryitens_nfBC_COFINS: TStringField
      FieldName = 'BC_COFINS'
      Size = 10
    end
    object qryitens_nfValor_COFINS: TFloatField
      FieldName = 'Valor_COFINS'
    end
    object qryitens_nfQtde: TFloatField
      FieldName = 'Qtde'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_nfQtde_Entregue: TFloatField
      FieldName = 'Qtde_Entregue'
    end
    object qryitens_nfQtde_Restante: TFloatField
      FieldName = 'Qtde_Restante'
    end
    object qryitens_nfQtde_S_Previsao: TFloatField
      FieldName = 'Qtde_S_Previsao'
    end
    object qryitens_nfValor_Original: TFloatField
      FieldName = 'Valor_Original'
    end
    object qryitens_nfValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_nfDesc_Acr: TFloatField
      FieldName = 'Desc_Acr'
    end
    object qryitens_nfDesc_Acr_P: TFloatField
      FieldName = 'Desc_Acr_P'
    end
    object qryitens_nfTipo_Desc_Acr: TStringField
      FieldName = 'Tipo_Desc_Acr'
      Size = 1
    end
    object qryitens_nfdOUa: TStringField
      FieldName = 'dOUa'
      Size = 1
    end
    object qryitens_nfValor_Frete: TFloatField
      FieldName = 'Valor_Frete'
    end
    object qryitens_nfValor_Seguro: TFloatField
      FieldName = 'Valor_Seguro'
    end
    object qryitens_nfOutras_Despesas: TFloatField
      FieldName = 'Outras_Despesas'
    end
    object qryitens_nfSub_Total: TFloatField
      FieldName = 'Sub_Total'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_nfSub_Total_Liquido: TFloatField
      FieldName = 'Sub_Total_Liquido'
    end
    object qryitens_nfCancelado: TStringField
      FieldName = 'Cancelado'
      Size = 1
    end
    object qryitens_nfIndica_Valor_Total: TStringField
      FieldName = 'Indica_Valor_Total'
      Size = 1
    end
    object qryitens_nfData_Entrega: TDateTimeField
      FieldName = 'Data_Entrega'
    end
    object qryitens_nfHora_Entrega: TStringField
      FieldName = 'Hora_Entrega'
      Size = 8
    end
    object qryitens_nfTipo_Venda: TStringField
      FieldName = 'Tipo_Venda'
      Size = 1
    end
    object qryitens_nfTipo_Entrega: TStringField
      FieldName = 'Tipo_Entrega'
      Size = 1
    end
    object qryitens_nfComissao: TFloatField
      FieldName = 'Comissao'
    end
    object qryitens_nfInsc_Municipal: TStringField
      FieldName = 'Insc_Municipal'
      Size = 15
    end
    object qryitens_nfEmail: TStringField
      FieldName = 'Email'
      Size = 100
    end
    object qryitens_nfSuframa: TStringField
      FieldName = 'Suframa'
    end
    object qryitens_nfEnquadramento: TStringField
      FieldName = 'Enquadramento'
      Size = 3
    end
    object qryitens_nfCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object qryitens_nfUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object qryitens_nfCodigo_Municipio: TStringField
      FieldName = 'Codigo_Municipio'
    end
    object qryitens_nfSetor: TStringField
      FieldName = 'Setor'
      Size = 30
    end
    object qryitens_nfLog: TStringField
      FieldName = 'Log'
      Size = 50
    end
    object qryitens_nfCEP: TStringField
      FieldName = 'CEP'
    end
    object qryitens_nfNumero: TStringField
      FieldName = 'Numero'
      Size = 10
    end
    object qryitens_nfComplemento: TStringField
      FieldName = 'Complemento'
      Size = 50
    end
    object qryitens_nfTelefone: TStringField
      FieldName = 'Telefone'
    end
    object qryitens_nfForma_Pagamento: TStringField
      FieldName = 'Forma_Pagamento'
      Size = 50
    end
    object qryitens_nfQtde_Parcela: TIntegerField
      FieldName = 'Qtde_Parcela'
    end
    object qryitens_nfPrazo: TIntegerField
      FieldName = 'Prazo'
    end
    object qryitens_nfTaxa: TFloatField
      FieldName = 'Taxa'
    end
    object qryitens_nfCodigo_Forma_Pagamento: TIntegerField
      FieldName = 'Codigo_Forma_Pagamento'
    end
    object qryitens_nfForma_Pagamento_1: TStringField
      FieldName = 'Forma_Pagamento_1'
      Size = 50
    end
    object qryitens_nfNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object qryitens_nfCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object qryitens_nfCod_Cli: TIntegerField
      FieldName = 'Cod_Cli'
    end
    object qryitens_nfPerc_Desc_Vista: TFloatField
      FieldName = 'Perc_Desc_Vista'
    end
    object qryitens_nfPerc_Desc_Prazo: TFloatField
      FieldName = 'Perc_Desc_Prazo'
    end
    object qryitens_nfPermite_Credito: TIntegerField
      FieldName = 'Permite_Credito'
    end
    object qryitens_nfCodigo_Obs_Fiscal: TIntegerField
      FieldName = 'Codigo_Obs_Fiscal'
    end
    object qryitens_nfEstoque: TFloatField
      FieldName = 'Estoque'
    end
    object qryitens_nfVolume: TFloatField
      FieldName = 'Volume'
    end
    object qryitens_nfDescricao: TStringField
      FieldName = 'Descricao'
      Size = 300
    end
    object qryitens_nfQtde_Estoque_Atual: TFloatField
      FieldName = 'Qtde_Estoque_Atual'
    end
    object qryitens_nfValor_Compra_Nota: TFloatField
      FieldName = 'Valor_Compra_Nota'
    end
    object qryitens_nfFicha_Estoque_Codigo: TIntegerField
      FieldName = 'Ficha_Estoque_Codigo'
    end
    object qryitens_nfTipo_Pagamento: TStringField
      FieldName = 'Tipo_Pagamento'
    end
    object qryitens_nfValor_Compra_Atual: TFloatField
      FieldName = 'Valor_Compra_Atual'
    end
    object qryitens_nfValor_ICMS_ST: TFloatField
      FieldName = 'Valor_ICMS_ST'
      LookupDataSet = ADOQuery1
    end
    object qryitens_nfCSOSN: TStringField
      FieldName = 'CSOSN'
      Size = 5
    end
    object qryitens_nfInscricao_Estadual: TStringField
      FieldName = 'Inscricao_Estadual'
    end
  end
  object ADOQuery2: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select RI1.Codigo, RI1.Aliquota, RI1.Base_Reduzida, RI1.Base_Acr' +
        'escida, RI1.Percentual_BC_Reduzida, RI1.Percentual_BC_Acrescida,'
      
        'RI2.Codigo, RI2.Aliquota, RI2.Base_Reduzida, RI2.Base_Acrescida,' +
        ' RI2.Percentual_BC_Reduzida, RI2.Percentual_BC_Acrescida,'
      
        'RI3.Codigo, RI3.Aliquota, RI3.Base_Reduzida, RI3.Base_Acrescida,' +
        ' RI3.Percentual_BC_Reduzida, RI3.Percentual_BC_Acrescida,'
      
        'RI4.Codigo, RI4.Aliquota, RI4.Base_Reduzida, RI4.Base_Acrescida,' +
        ' RI4.Percentual_BC_Reduzida, RI4.Percentual_BC_Acrescida,'
      
        'RI5.Codigo, RI5.Aliquota, RI5.Base_Reduzida, RI5.Base_Acrescida,' +
        ' RI5.Percentual_BC_Reduzida, RI5.Percentual_BC_Acrescida,'
      
        'RI6.Codigo, RI6.Aliquota, RI6.Base_Reduzida, RI6.Base_Acrescida,' +
        ' RI6.Percentual_BC_Reduzida, RI6.Percentual_BC_Acrescida,'
      
        'RI7.Codigo, RI7.Aliquota, RI7.Base_Reduzida, RI7.Base_Acrescida,' +
        ' RI6.Percentual_BC_Reduzida, RI7.Percentual_BC_Acrescida, GPT.*,' +
        ' TI.*,'
      
        'COF1.Descricao, COF2.Descricao, COF3.Descricao, COF4.Descricao, ' +
        'COF5.Descricao, COF6.Descricao, COF7.Descricao,'
      
        'CST1.Codigo_Situacao, CST1.Origem, CST2.Codigo_Situacao, CST3.Co' +
        'digo_Situacao, CST4.Codigo_Situacao, CST5.Codigo_Situacao, CST6.' +
        'Codigo_Situacao, CST7.Codigo_Situacao,'
      'P.Codigo_Grupo_Tributacao from Produto P'
      ''
      
        'inner join Grupo_Produto_Tributacao GPT on (P.Codigo_Grupo_Tribu' +
        'tacao = GPT.Codigo)'
      
        'inner join Tratamento_ICMS TI on (GPT.Codigo_Tratamento_ICMS = T' +
        'I.Codigo)'
      'inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo)'
      ''
      
        'inner join Regra_ICMS RI1 on (ITI .Entrada_Regra_EN = RI1.Codigo' +
        ')'
      
        'inner join Regra_ICMS RI2 on (ITI .Entrada_Regra_EPP = RI2.Codig' +
        'o)'
      
        'inner join Regra_ICMS RI3 on (ITI .Entrada_Regra_ME = RI3.Codigo' +
        ')'
      'inner join Regra_ICMS RI4 on (ITI .Saida_Regra_EN = RI4.Codigo)'
      'inner join Regra_ICMS RI5 on (ITI .Saida_Regra_EPP = RI5.Codigo)'
      'inner join Regra_ICMS RI6 on (ITI .Saida_Regra_ME = RI6.Codigo)'
      
        'inner join Regra_ICMS RI7 on (ITI .Regra_Nao_Contribuinte = RI7.' +
        'Codigo)'
      ''
      
        'inner join Cadastro_Observacao_Fiscal COF1 on (RI1.Codigo_Observ' +
        'acao_Fiscal = COF1.Codigo)'
      
        'inner join Cadastro_Observacao_Fiscal COF2 on (RI2.Codigo_Observ' +
        'acao_Fiscal = COF2.Codigo)'
      
        'inner join Cadastro_Observacao_Fiscal COF3 on (RI3.Codigo_Observ' +
        'acao_Fiscal = COF3.Codigo)'
      
        'inner join Cadastro_Observacao_Fiscal COF4 on (RI4.Codigo_Observ' +
        'acao_Fiscal = COF4.Codigo)'
      
        'inner join Cadastro_Observacao_Fiscal COF5 on (RI5.Codigo_Observ' +
        'acao_Fiscal = COF5.Codigo)'
      
        'inner join Cadastro_Observacao_Fiscal COF6 on (RI6.Codigo_Observ' +
        'acao_Fiscal = COF6.Codigo)'
      
        'inner join Cadastro_Observacao_Fiscal COF7 on (RI7.Codigo_Observ' +
        'acao_Fiscal = COF7.Codigo)'
      ''
      
        'inner join Cadastro_Situacao_Tributaria CST1 on (RI1.Codigo_Situ' +
        'acao_Tributaria = CST1.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST2 on (RI2.Codigo_Situ' +
        'acao_Tributaria = CST2.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST3 on (RI3.Codigo_Situ' +
        'acao_Tributaria = CST3.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST4 on (RI4.Codigo_Situ' +
        'acao_Tributaria = CST4.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST5 on (RI5.Codigo_Situ' +
        'acao_Tributaria = CST5.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST6 on (RI6.Codigo_Situ' +
        'acao_Tributaria = CST6.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST7 on (RI7.Codigo_Situ' +
        'acao_Tributaria = CST7.Codigo)')
    Left = 865
    Top = 386
    object ADOQuery2Codigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object ADOQuery2Aliquota: TStringField
      FieldName = 'Aliquota'
      Size = 5
    end
    object ADOQuery2Base_Reduzida: TStringField
      FieldName = 'Base_Reduzida'
      Size = 3
    end
    object ADOQuery2Base_Acrescida: TStringField
      FieldName = 'Base_Acrescida'
      Size = 3
    end
    object ADOQuery2Percentual_BC_Reduzida: TStringField
      FieldName = 'Percentual_BC_Reduzida'
      Size = 5
    end
    object ADOQuery2Percentual_BC_Acrescida: TStringField
      FieldName = 'Percentual_BC_Acrescida'
      Size = 5
    end
    object ADOQuery2Codigo_1: TAutoIncField
      FieldName = 'Codigo_1'
      ReadOnly = True
    end
    object ADOQuery2Aliquota_1: TStringField
      FieldName = 'Aliquota_1'
      Size = 5
    end
    object ADOQuery2Base_Reduzida_1: TStringField
      FieldName = 'Base_Reduzida_1'
      Size = 3
    end
    object ADOQuery2Base_Acrescida_1: TStringField
      FieldName = 'Base_Acrescida_1'
      Size = 3
    end
    object ADOQuery2Percentual_BC_Reduzida_1: TStringField
      FieldName = 'Percentual_BC_Reduzida_1'
      Size = 5
    end
    object ADOQuery2Percentual_BC_Acrescida_1: TStringField
      FieldName = 'Percentual_BC_Acrescida_1'
      Size = 5
    end
    object ADOQuery2Codigo_2: TAutoIncField
      FieldName = 'Codigo_2'
      ReadOnly = True
    end
    object ADOQuery2Aliquota_2: TStringField
      FieldName = 'Aliquota_2'
      Size = 5
    end
    object ADOQuery2Base_Reduzida_2: TStringField
      FieldName = 'Base_Reduzida_2'
      Size = 3
    end
    object ADOQuery2Base_Acrescida_2: TStringField
      FieldName = 'Base_Acrescida_2'
      Size = 3
    end
    object ADOQuery2Percentual_BC_Reduzida_2: TStringField
      FieldName = 'Percentual_BC_Reduzida_2'
      Size = 5
    end
    object ADOQuery2Percentual_BC_Acrescida_2: TStringField
      FieldName = 'Percentual_BC_Acrescida_2'
      Size = 5
    end
    object ADOQuery2Codigo_3: TAutoIncField
      FieldName = 'Codigo_3'
      ReadOnly = True
    end
    object ADOQuery2Aliquota_3: TStringField
      FieldName = 'Aliquota_3'
      Size = 5
    end
    object ADOQuery2Base_Reduzida_3: TStringField
      FieldName = 'Base_Reduzida_3'
      Size = 3
    end
    object ADOQuery2Base_Acrescida_3: TStringField
      FieldName = 'Base_Acrescida_3'
      Size = 3
    end
    object ADOQuery2Percentual_BC_Reduzida_3: TStringField
      FieldName = 'Percentual_BC_Reduzida_3'
      Size = 5
    end
    object ADOQuery2Percentual_BC_Acrescida_3: TStringField
      FieldName = 'Percentual_BC_Acrescida_3'
      Size = 5
    end
    object ADOQuery2Codigo_4: TAutoIncField
      FieldName = 'Codigo_4'
      ReadOnly = True
    end
    object ADOQuery2Aliquota_4: TStringField
      FieldName = 'Aliquota_4'
      Size = 5
    end
    object ADOQuery2Base_Reduzida_4: TStringField
      FieldName = 'Base_Reduzida_4'
      Size = 3
    end
    object ADOQuery2Base_Acrescida_4: TStringField
      FieldName = 'Base_Acrescida_4'
      Size = 3
    end
    object ADOQuery2Percentual_BC_Reduzida_4: TStringField
      FieldName = 'Percentual_BC_Reduzida_4'
      Size = 5
    end
    object ADOQuery2Percentual_BC_Acrescida_4: TStringField
      FieldName = 'Percentual_BC_Acrescida_4'
      Size = 5
    end
    object ADOQuery2Codigo_5: TAutoIncField
      FieldName = 'Codigo_5'
      ReadOnly = True
    end
    object ADOQuery2Aliquota_5: TStringField
      FieldName = 'Aliquota_5'
      Size = 5
    end
    object ADOQuery2Base_Reduzida_5: TStringField
      FieldName = 'Base_Reduzida_5'
      Size = 3
    end
    object ADOQuery2Base_Acrescida_5: TStringField
      FieldName = 'Base_Acrescida_5'
      Size = 3
    end
    object ADOQuery2Percentual_BC_Reduzida_5: TStringField
      FieldName = 'Percentual_BC_Reduzida_5'
      Size = 5
    end
    object ADOQuery2Percentual_BC_Acrescida_5: TStringField
      FieldName = 'Percentual_BC_Acrescida_5'
      Size = 5
    end
    object ADOQuery2Codigo_6: TAutoIncField
      FieldName = 'Codigo_6'
      ReadOnly = True
    end
    object ADOQuery2Aliquota_6: TStringField
      FieldName = 'Aliquota_6'
      Size = 5
    end
    object ADOQuery2Base_Reduzida_6: TStringField
      FieldName = 'Base_Reduzida_6'
      Size = 3
    end
    object ADOQuery2Base_Acrescida_6: TStringField
      FieldName = 'Base_Acrescida_6'
      Size = 3
    end
    object ADOQuery2Percentual_BC_Reduzida_6: TStringField
      FieldName = 'Percentual_BC_Reduzida_6'
      Size = 5
    end
    object ADOQuery2Percentual_BC_Acrescida_6: TStringField
      FieldName = 'Percentual_BC_Acrescida_6'
      Size = 5
    end
    object ADOQuery2Codigo_7: TAutoIncField
      FieldName = 'Codigo_7'
      ReadOnly = True
    end
    object ADOQuery2Descricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object ADOQuery2Codigo_Tratamento_ICMS: TIntegerField
      FieldName = 'Codigo_Tratamento_ICMS'
    end
    object ADOQuery2Data_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object ADOQuery2Codigo_8: TIntegerField
      FieldName = 'Codigo_8'
    end
    object ADOQuery2Descricao_1: TStringField
      FieldName = 'Descricao_1'
      Size = 50
    end
    object ADOQuery2Data_Cadastro_1: TDateTimeField
      FieldName = 'Data_Cadastro_1'
    end
    object ADOQuery2Descricao_2: TStringField
      FieldName = 'Descricao_2'
      Size = 50
    end
    object ADOQuery2Descricao_3: TStringField
      FieldName = 'Descricao_3'
      Size = 50
    end
    object ADOQuery2Descricao_4: TStringField
      FieldName = 'Descricao_4'
      Size = 50
    end
    object ADOQuery2Descricao_5: TStringField
      FieldName = 'Descricao_5'
      Size = 50
    end
    object ADOQuery2Descricao_6: TStringField
      FieldName = 'Descricao_6'
      Size = 50
    end
    object ADOQuery2Descricao_7: TStringField
      FieldName = 'Descricao_7'
      Size = 50
    end
    object ADOQuery2Descricao_8: TStringField
      FieldName = 'Descricao_8'
      Size = 50
    end
    object ADOQuery2Codigo_Situacao: TStringField
      FieldName = 'Codigo_Situacao'
      Size = 5
    end
    object ADOQuery2Codigo_Situacao_1: TStringField
      FieldName = 'Codigo_Situacao_1'
      Size = 5
    end
    object ADOQuery2Codigo_Situacao_2: TStringField
      FieldName = 'Codigo_Situacao_2'
      Size = 5
    end
    object ADOQuery2Codigo_Situacao_3: TStringField
      FieldName = 'Codigo_Situacao_3'
      Size = 5
    end
    object ADOQuery2Codigo_Situacao_4: TStringField
      FieldName = 'Codigo_Situacao_4'
      Size = 5
    end
    object ADOQuery2Codigo_Situacao_5: TStringField
      FieldName = 'Codigo_Situacao_5'
      Size = 5
    end
    object ADOQuery2Codigo_Situacao_6: TStringField
      FieldName = 'Codigo_Situacao_6'
      Size = 5
    end
    object ADOQuery2Codigo_Grupo_Tributacao: TIntegerField
      FieldName = 'Codigo_Grupo_Tributacao'
    end
    object ADOQuery2Origem: TIntegerField
      FieldName = 'Origem'
    end
  end
  object ADOQuery3: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select RI.*, CST.Codigo_Situacao, CST.Descricao, CST.Origem, COF' +
        '.Descricao from Regra_ICMS RI'
      
        'left join Cadastro_Situacao_Tributaria CST on (RI.Codigo_Situaca' +
        'o_Tributaria = CST.Codigo)'
      
        'left join Cadastro_Observacao_Fiscal COF on (RI.Codigo_Observaca' +
        'o_Fiscal = COF.Codigo)')
    Left = 866
    Top = 354
    object ADOQuery3Codigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object ADOQuery3Data_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object ADOQuery3Descricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object ADOQuery3Aliquota: TStringField
      FieldName = 'Aliquota'
      Size = 5
    end
    object ADOQuery3Tipo_Recolhimento: TStringField
      FieldName = 'Tipo_Recolhimento'
      Size = 30
    end
    object ADOQuery3Base_Reduzida: TStringField
      FieldName = 'Base_Reduzida'
      Size = 3
    end
    object ADOQuery3Percentual_BC_Reduzida: TStringField
      FieldName = 'Percentual_BC_Reduzida'
      Size = 5
    end
    object ADOQuery3Base_Acrescida: TStringField
      FieldName = 'Base_Acrescida'
      Size = 3
    end
    object ADOQuery3Percentual_BC_Acrescida: TStringField
      FieldName = 'Percentual_BC_Acrescida'
      Size = 5
    end
    object ADOQuery3Codigo_Situacao_Tributaria: TIntegerField
      FieldName = 'Codigo_Situacao_Tributaria'
    end
    object ADOQuery3Codigo_Observacao_Fiscal: TIntegerField
      FieldName = 'Codigo_Observacao_Fiscal'
    end
    object ADOQuery3Dispositivo_Legal: TStringField
      FieldName = 'Dispositivo_Legal'
      Size = 300
    end
    object ADOQuery3Codigo_Situacao: TStringField
      FieldName = 'Codigo_Situacao'
      Size = 5
    end
    object ADOQuery3Origem: TIntegerField
      FieldName = 'Origem'
    end
    object ADOQuery3Descricao_1: TStringField
      FieldName = 'Descricao_1'
      Size = 50
    end
    object ADOQuery3Descricao_2: TStringField
      FieldName = 'Descricao_2'
      Size = 50
    end
  end
  object ADOQuery4: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select RIPI1.Descricao as Descricao_IPI_1, RIPI1.Aliquota as Ali' +
        'quota_IPI_1, NCM1.Codigo_NCM as Codigo_NCM_1, NCM1.Descricao as ' +
        'Descricao_NCM_1, RIPI1.Tipo_Recolhimento as Tipo_Recolhimento_IP' +
        'I_1,'
      
        'RIPI1.Base_Reduzida as Base_Reduzida_IPI_1, RIPI1.Percentual_BC_' +
        'Reduzida as Percentual_BC_Reduzida_IPI_1, RIPI1.Base_Acrescida a' +
        's Base_Acrescida_IPI_1,'
      
        'RIPI1.Percentual_BC_Acrescida as Percentual_BC_Acrescida_IPI_1, ' +
        'CST2_1.Codigo_Situacao as Codigo_ST_IPI2_1, CST2_1.Descricao as ' +
        'Descricao_ST_IPI2_1,'
      ''
      
        'RIPI2.Descricao as Descricao_IPI_2, RIPI2.Aliquota as Aliquota_I' +
        'PI_2, NCM2.Codigo_NCM as Codigo_NCM_2, NCM2.Descricao as Descric' +
        'ao_NCM_2, RIPI2.Tipo_Recolhimento as Tipo_Recolhimento_IPI_2,'
      
        'RIPI2.Base_Reduzida as Base_Reduzida_IPI_2, RIPI2.Percentual_BC_' +
        'Reduzida as Percentual_BC_Reduzida_IPI_2, RIPI2.Base_Acrescida a' +
        's Base_Acrescida_IPI_2,'
      
        'RIPI2.Percentual_BC_Acrescida as Percentual_BC_Acrescida_IPI_2, ' +
        'CST2_2.Codigo_Situacao as Codigo_ST_IPI2_2, CST2_2.Descricao as ' +
        'Descricao_ST_IPI2_2,'
      ''
      
        'RIPI3.Descricao as Descricao_IPI_3, RIPI3.Aliquota as Aliquota_I' +
        'PI_3, NCM3.Codigo_NCM as Codigo_NCM_3, NCM3.Descricao as Descric' +
        'ao_NCM_3, RIPI3.Tipo_Recolhimento as Tipo_Recolhimento_IPI_3,'
      
        'RIPI3.Base_Reduzida as Base_Reduzida_IPI_3, RIPI3.Percentual_BC_' +
        'Reduzida as Percentual_BC_Reduzida_IPI_3, RIPI3.Base_Acrescida a' +
        's Base_Acrescida_IPI_3,'
      
        'RIPI3.Percentual_BC_Acrescida as Percentual_BC_Acrescida_IPI_3, ' +
        'CST2_3.Codigo_Situacao as Codigo_ST_IPI2_3, CST2_3.Descricao as ' +
        'Descricao_ST_IPI2_3,'
      ''
      
        'RIPI4.Descricao as Descricao_IPI_4, RIPI4.Aliquota as Aliquota_I' +
        'PI_4, NCM4.Codigo_NCM as Codigo_NCM_4, NCM4.Descricao as Descric' +
        'ao_NCM_4, RIPI4.Tipo_Recolhimento as Tipo_Recolhimento_IPI_4,'
      
        'RIPI4.Base_Reduzida as Base_Reduzida_IPI_4, RIPI4.Percentual_BC_' +
        'Reduzida as Percentual_BC_Reduzida_IPI_4, RIPI4.Base_Acrescida a' +
        's Base_Acrescida_IPI_4,'
      
        'RIPI4.Percentual_BC_Acrescida as Percentual_BC_Acrescida_IPI_4, ' +
        'CST2_4.Codigo_Situacao as Codigo_ST_IPI2_4, CST2_4.Descricao as ' +
        'Descricao_ST_IPI2_4,'
      ''
      
        'RIPI5.Descricao as Descricao_IPI_5, RIPI5.Aliquota as Aliquota_I' +
        'PI_5, NCM5.Codigo_NCM as Codigo_NCM_5, NCM5.Descricao as Descric' +
        'ao_NCM_5, RIPI5.Tipo_Recolhimento as Tipo_Recolhimento_IPI_5,'
      
        'RIPI5.Base_Reduzida as Base_Reduzida_IPI_5, RIPI5.Percentual_BC_' +
        'Reduzida as Percentual_BC_Reduzida_IPI_5, RIPI5.Base_Acrescida a' +
        's Base_Acrescida_IPI_5,'
      
        'RIPI5.Percentual_BC_Acrescida as Percentual_BC_Acrescida_IPI_5, ' +
        'CST2_5.Codigo_Situacao as Codigo_ST_IPI2_5, CST2_5.Descricao as ' +
        'Descricao_ST_IPI2_5,'
      ''
      
        'RIPI6.Descricao as Descricao_IPI_6, RIPI6.Aliquota as Aliquota_I' +
        'PI_6, NCM6.Codigo_NCM as Codigo_NCM_6, NCM6.Descricao as Descric' +
        'ao_NCM_6, RIPI6.Tipo_Recolhimento as Tipo_Recolhimento_IPI_6,'
      
        'RIPI6.Base_Reduzida as Base_Reduzida_IPI_6, RIPI6.Percentual_BC_' +
        'Reduzida as Percentual_BC_Reduzida_IPI_6, RIPI6.Base_Acrescida a' +
        's Base_Acrescida_IPI_6,'
      
        'RIPI6.Percentual_BC_Acrescida as Percentual_BC_Acrescida_IPI_6, ' +
        'CST2_6.Codigo_Situacao as Codigo_ST_IPI2_6, CST2_6.Descricao as ' +
        'Descricao_ST_IPI2_6,'
      ''
      
        'RIPI7.Descricao as Descricao_IPI_7, RIPI7.Aliquota as Aliquota_I' +
        'PI_7, NCM7.Codigo_NCM as Codigo_NCM_7, NCM7.Descricao as Descric' +
        'ao_NCM_7, RIPI7.Tipo_Recolhimento as Tipo_Recolhimento_IPI_7,'
      
        'RIPI7.Base_Reduzida as Base_Reduzida_IPI_7, RIPI7.Percentual_BC_' +
        'Reduzida as Percentual_BC_Reduzida_IPI_7, RIPI7.Base_Acrescida a' +
        's Base_Acrescida_IPI_7,'
      
        'RIPI7.Percentual_BC_Acrescida as Percentual_BC_Acrescida_IPI_7, ' +
        'CST2_7.Codigo_Situacao as Codigo_ST_IPI2_7, CST2_7.Descricao as ' +
        'Descricao_ST_IPI2_7'
      'from Produto Pro'
      ''
      
        'inner join Grupo_Produto_Tributacao_IPI GPTI on (GPTI.Codigo = P' +
        'ro.Codigo_Grupo_Tributacao_IPI)'
      
        'inner join Tratamento_IPI TI on (GPTI.Codigo_Tratamento_IPI = TI' +
        '.Codigo)'
      
        'inner join Itens_Tratamento_IPI ITIPI on (TI.Codigo = ITIPI.Codi' +
        'go)'
      
        'inner join Regra_IPI RIPI1 on (ITIPI.Entrada_Regra_EN = RIPI1.Co' +
        'digo)'
      
        'inner join Regra_IPI RIPI2 on (ITIPI.Entrada_Regra_EPP = RIPI2.C' +
        'odigo)'
      
        'inner join Regra_IPI RIPI3 on (ITIPI.Entrada_Regra_ME = RIPI3.Co' +
        'digo)'
      
        'inner join Regra_IPI RIPI4 on (ITIPI.Saida_Regra_EN = RIPI4.Codi' +
        'go)'
      
        'inner join Regra_IPI RIPI5 on (ITIPI.Saida_Regra_EPP = RIPI5.Cod' +
        'igo)'
      
        'inner join Regra_IPI RIPI6 on (ITIPI.Saida_Regra_ME = RIPI6.Codi' +
        'go)'
      
        'inner join Regra_IPI RIPI7 on (ITIPI.Regra_Nao_Contribuinte = RI' +
        'PI7.Codigo)'
      ''
      
        'inner join Cadastro_Situacao_Tributaria CST2_1 on (RIPI1.Codigo_' +
        'Situacao_Tributaria = CST2_1.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST2_2 on (RIPI2.Codigo_' +
        'Situacao_Tributaria = CST2_2.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST2_3 on (RIPI3.Codigo_' +
        'Situacao_Tributaria = CST2_3.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST2_4 on (RIPI4.Codigo_' +
        'Situacao_Tributaria = CST2_4.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST2_5 on (RIPI5.Codigo_' +
        'Situacao_Tributaria = CST2_5.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST2_6 on (RIPI6.Codigo_' +
        'Situacao_Tributaria = CST2_6.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST2_7 on (RIPI7.Codigo_' +
        'Situacao_Tributaria = CST2_7.Codigo)'
      ''
      'inner join NCM NCM1 on (RIPI1.Codigo_NCM = NCM1.Codigo)'
      'inner join NCM NCM2 on (RIPI2.Codigo_NCM = NCM2.Codigo)'
      'inner join NCM NCM3 on (RIPI3.Codigo_NCM = NCM3.Codigo)'
      'inner join NCM NCM4 on (RIPI4.Codigo_NCM = NCM4.Codigo)'
      'inner join NCM NCM5 on (RIPI5.Codigo_NCM = NCM5.Codigo)'
      'inner join NCM NCM6 on (RIPI6.Codigo_NCM = NCM6.Codigo)'
      'inner join NCM NCM7 on (RIPI7.Codigo_NCM = NCM7.Codigo)')
    Left = 705
    Top = 66
    object ADOQuery4Descricao_IPI_1: TStringField
      FieldName = 'Descricao_IPI_1'
      Size = 50
    end
    object ADOQuery4Aliquota_IPI_1: TStringField
      FieldName = 'Aliquota_IPI_1'
      Size = 5
    end
    object ADOQuery4Codigo_NCM_1: TStringField
      FieldName = 'Codigo_NCM_1'
      Size = 10
    end
    object ADOQuery4Descricao_NCM_1: TStringField
      FieldName = 'Descricao_NCM_1'
      Size = 100
    end
    object ADOQuery4Tipo_Recolhimento_IPI_1: TStringField
      FieldName = 'Tipo_Recolhimento_IPI_1'
      Size = 30
    end
    object ADOQuery4Base_Reduzida_IPI_1: TStringField
      FieldName = 'Base_Reduzida_IPI_1'
      Size = 3
    end
    object ADOQuery4Percentual_BC_Reduzida_IPI_1: TStringField
      FieldName = 'Percentual_BC_Reduzida_IPI_1'
      Size = 5
    end
    object ADOQuery4Base_Acrescida_IPI_1: TStringField
      FieldName = 'Base_Acrescida_IPI_1'
      Size = 3
    end
    object ADOQuery4Percentual_BC_Acrescida_IPI_1: TStringField
      FieldName = 'Percentual_BC_Acrescida_IPI_1'
      Size = 5
    end
    object ADOQuery4Codigo_ST_IPI2_1: TStringField
      FieldName = 'Codigo_ST_IPI2_1'
      Size = 5
    end
    object ADOQuery4Descricao_ST_IPI2_1: TStringField
      FieldName = 'Descricao_ST_IPI2_1'
      Size = 50
    end
    object ADOQuery4Descricao_IPI_2: TStringField
      FieldName = 'Descricao_IPI_2'
      Size = 50
    end
    object ADOQuery4Aliquota_IPI_2: TStringField
      FieldName = 'Aliquota_IPI_2'
      Size = 5
    end
    object ADOQuery4Codigo_NCM_2: TStringField
      FieldName = 'Codigo_NCM_2'
      Size = 10
    end
    object ADOQuery4Descricao_NCM_2: TStringField
      FieldName = 'Descricao_NCM_2'
      Size = 100
    end
    object ADOQuery4Tipo_Recolhimento_IPI_2: TStringField
      FieldName = 'Tipo_Recolhimento_IPI_2'
      Size = 30
    end
    object ADOQuery4Base_Reduzida_IPI_2: TStringField
      FieldName = 'Base_Reduzida_IPI_2'
      Size = 3
    end
    object ADOQuery4Percentual_BC_Reduzida_IPI_2: TStringField
      FieldName = 'Percentual_BC_Reduzida_IPI_2'
      Size = 5
    end
    object ADOQuery4Base_Acrescida_IPI_2: TStringField
      FieldName = 'Base_Acrescida_IPI_2'
      Size = 3
    end
    object ADOQuery4Percentual_BC_Acrescida_IPI_2: TStringField
      FieldName = 'Percentual_BC_Acrescida_IPI_2'
      Size = 5
    end
    object ADOQuery4Codigo_ST_IPI2_2: TStringField
      FieldName = 'Codigo_ST_IPI2_2'
      Size = 5
    end
    object ADOQuery4Descricao_ST_IPI2_2: TStringField
      FieldName = 'Descricao_ST_IPI2_2'
      Size = 50
    end
    object ADOQuery4Descricao_IPI_3: TStringField
      FieldName = 'Descricao_IPI_3'
      Size = 50
    end
    object ADOQuery4Aliquota_IPI_3: TStringField
      FieldName = 'Aliquota_IPI_3'
      Size = 5
    end
    object ADOQuery4Codigo_NCM_3: TStringField
      FieldName = 'Codigo_NCM_3'
      Size = 10
    end
    object ADOQuery4Descricao_NCM_3: TStringField
      FieldName = 'Descricao_NCM_3'
      Size = 100
    end
    object ADOQuery4Tipo_Recolhimento_IPI_3: TStringField
      FieldName = 'Tipo_Recolhimento_IPI_3'
      Size = 30
    end
    object ADOQuery4Base_Reduzida_IPI_3: TStringField
      FieldName = 'Base_Reduzida_IPI_3'
      Size = 3
    end
    object ADOQuery4Percentual_BC_Reduzida_IPI_3: TStringField
      FieldName = 'Percentual_BC_Reduzida_IPI_3'
      Size = 5
    end
    object ADOQuery4Base_Acrescida_IPI_3: TStringField
      FieldName = 'Base_Acrescida_IPI_3'
      Size = 3
    end
    object ADOQuery4Percentual_BC_Acrescida_IPI_3: TStringField
      FieldName = 'Percentual_BC_Acrescida_IPI_3'
      Size = 5
    end
    object ADOQuery4Codigo_ST_IPI2_3: TStringField
      FieldName = 'Codigo_ST_IPI2_3'
      Size = 5
    end
    object ADOQuery4Descricao_ST_IPI2_3: TStringField
      FieldName = 'Descricao_ST_IPI2_3'
      Size = 50
    end
    object ADOQuery4Descricao_IPI_4: TStringField
      FieldName = 'Descricao_IPI_4'
      Size = 50
    end
    object ADOQuery4Aliquota_IPI_4: TStringField
      FieldName = 'Aliquota_IPI_4'
      Size = 5
    end
    object ADOQuery4Codigo_NCM_4: TStringField
      FieldName = 'Codigo_NCM_4'
      Size = 10
    end
    object ADOQuery4Descricao_NCM_4: TStringField
      FieldName = 'Descricao_NCM_4'
      Size = 100
    end
    object ADOQuery4Tipo_Recolhimento_IPI_4: TStringField
      FieldName = 'Tipo_Recolhimento_IPI_4'
      Size = 30
    end
    object ADOQuery4Base_Reduzida_IPI_4: TStringField
      FieldName = 'Base_Reduzida_IPI_4'
      Size = 3
    end
    object ADOQuery4Percentual_BC_Reduzida_IPI_4: TStringField
      FieldName = 'Percentual_BC_Reduzida_IPI_4'
      Size = 5
    end
    object ADOQuery4Base_Acrescida_IPI_4: TStringField
      FieldName = 'Base_Acrescida_IPI_4'
      Size = 3
    end
    object ADOQuery4Percentual_BC_Acrescida_IPI_4: TStringField
      FieldName = 'Percentual_BC_Acrescida_IPI_4'
      Size = 5
    end
    object ADOQuery4Codigo_ST_IPI2_4: TStringField
      FieldName = 'Codigo_ST_IPI2_4'
      Size = 5
    end
    object ADOQuery4Descricao_ST_IPI2_4: TStringField
      FieldName = 'Descricao_ST_IPI2_4'
      Size = 50
    end
    object ADOQuery4Descricao_IPI_5: TStringField
      FieldName = 'Descricao_IPI_5'
      Size = 50
    end
    object ADOQuery4Aliquota_IPI_5: TStringField
      FieldName = 'Aliquota_IPI_5'
      Size = 5
    end
    object ADOQuery4Codigo_NCM_5: TStringField
      FieldName = 'Codigo_NCM_5'
      Size = 10
    end
    object ADOQuery4Descricao_NCM_5: TStringField
      FieldName = 'Descricao_NCM_5'
      Size = 100
    end
    object ADOQuery4Tipo_Recolhimento_IPI_5: TStringField
      FieldName = 'Tipo_Recolhimento_IPI_5'
      Size = 30
    end
    object ADOQuery4Base_Reduzida_IPI_5: TStringField
      FieldName = 'Base_Reduzida_IPI_5'
      Size = 3
    end
    object ADOQuery4Percentual_BC_Reduzida_IPI_5: TStringField
      FieldName = 'Percentual_BC_Reduzida_IPI_5'
      Size = 5
    end
    object ADOQuery4Base_Acrescida_IPI_5: TStringField
      FieldName = 'Base_Acrescida_IPI_5'
      Size = 3
    end
    object ADOQuery4Percentual_BC_Acrescida_IPI_5: TStringField
      FieldName = 'Percentual_BC_Acrescida_IPI_5'
      Size = 5
    end
    object ADOQuery4Codigo_ST_IPI2_5: TStringField
      FieldName = 'Codigo_ST_IPI2_5'
      Size = 5
    end
    object ADOQuery4Descricao_ST_IPI2_5: TStringField
      FieldName = 'Descricao_ST_IPI2_5'
      Size = 50
    end
    object ADOQuery4Descricao_IPI_6: TStringField
      FieldName = 'Descricao_IPI_6'
      Size = 50
    end
    object ADOQuery4Aliquota_IPI_6: TStringField
      FieldName = 'Aliquota_IPI_6'
      Size = 5
    end
    object ADOQuery4Codigo_NCM_6: TStringField
      FieldName = 'Codigo_NCM_6'
      Size = 10
    end
    object ADOQuery4Descricao_NCM_6: TStringField
      FieldName = 'Descricao_NCM_6'
      Size = 100
    end
    object ADOQuery4Tipo_Recolhimento_IPI_6: TStringField
      FieldName = 'Tipo_Recolhimento_IPI_6'
      Size = 30
    end
    object ADOQuery4Base_Reduzida_IPI_6: TStringField
      FieldName = 'Base_Reduzida_IPI_6'
      Size = 3
    end
    object ADOQuery4Percentual_BC_Reduzida_IPI_6: TStringField
      FieldName = 'Percentual_BC_Reduzida_IPI_6'
      Size = 5
    end
    object ADOQuery4Base_Acrescida_IPI_6: TStringField
      FieldName = 'Base_Acrescida_IPI_6'
      Size = 3
    end
    object ADOQuery4Percentual_BC_Acrescida_IPI_6: TStringField
      FieldName = 'Percentual_BC_Acrescida_IPI_6'
      Size = 5
    end
    object ADOQuery4Codigo_ST_IPI2_6: TStringField
      FieldName = 'Codigo_ST_IPI2_6'
      Size = 5
    end
    object ADOQuery4Descricao_ST_IPI2_6: TStringField
      FieldName = 'Descricao_ST_IPI2_6'
      Size = 50
    end
    object ADOQuery4Descricao_IPI_7: TStringField
      FieldName = 'Descricao_IPI_7'
      Size = 50
    end
    object ADOQuery4Aliquota_IPI_7: TStringField
      FieldName = 'Aliquota_IPI_7'
      Size = 5
    end
    object ADOQuery4Codigo_NCM_7: TStringField
      FieldName = 'Codigo_NCM_7'
      Size = 10
    end
    object ADOQuery4Descricao_NCM_7: TStringField
      FieldName = 'Descricao_NCM_7'
      Size = 100
    end
    object ADOQuery4Tipo_Recolhimento_IPI_7: TStringField
      FieldName = 'Tipo_Recolhimento_IPI_7'
      Size = 30
    end
    object ADOQuery4Base_Reduzida_IPI_7: TStringField
      FieldName = 'Base_Reduzida_IPI_7'
      Size = 3
    end
    object ADOQuery4Percentual_BC_Reduzida_IPI_7: TStringField
      FieldName = 'Percentual_BC_Reduzida_IPI_7'
      Size = 5
    end
    object ADOQuery4Base_Acrescida_IPI_7: TStringField
      FieldName = 'Base_Acrescida_IPI_7'
      Size = 3
    end
    object ADOQuery4Percentual_BC_Acrescida_IPI_7: TStringField
      FieldName = 'Percentual_BC_Acrescida_IPI_7'
      Size = 5
    end
    object ADOQuery4Codigo_ST_IPI2_7: TStringField
      FieldName = 'Codigo_ST_IPI2_7'
      Size = 5
    end
    object ADOQuery4Descricao_ST_IPI2_7: TStringField
      FieldName = 'Descricao_ST_IPI2_7'
      Size = 50
    end
  end
  object ADOQuery5: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select RPIS1.Descricao as Descricao_PIS1, RPIS1.Aliquota as Aliq' +
        'uota_PIS1, RPIS1.Tipo_Recolhimento as Tipo_Recolhimento_PIS1,'
      
        'RPIS1.Base_Reduzida as Base_Reduzida_PIS1, RPIS1.Percentual_BC_R' +
        'eduzida as Percentual_BC_Reduzida_PIS1, RPIS1.Base_Acrescida as ' +
        'Base_Acrescida_PIS1,'
      
        'RPIS1.Percentual_BC_Acrescida as Percentual_BC_Acrescida_PIS1, C' +
        'ST3_1.Codigo_Situacao as Codigo_ST_PIS3_1, CST3_1.Descricao as D' +
        'escricao_ST_PIS3_1,'
      ''
      
        'RPIS2.Descricao as Descricao_PIS2, RPIS2.Aliquota as Aliquota_PI' +
        'S2, RPIS2.Tipo_Recolhimento as Tipo_Recolhimento_PIS2,'
      
        'RPIS2.Base_Reduzida as Base_Reduzida_PIS2, RPIS2.Percentual_BC_R' +
        'eduzida as Percentual_BC_Reduzida_PIS2, RPIS2.Base_Acrescida as ' +
        'Base_Acrescida_PIS2,'
      
        'RPIS2.Percentual_BC_Acrescida as Percentual_BC_Acrescida_PIS2, C' +
        'ST3_2.Codigo_Situacao as Codigo_ST_PIS3_2, CST3_2.Descricao as D' +
        'escricao_ST_PIS3_2,'
      ''
      
        'RPIS3.Descricao as Descricao_PIS3, RPIS3.Aliquota as Aliquota_PI' +
        'S3, RPIS3.Tipo_Recolhimento as Tipo_Recolhimento_PIS3,'
      
        'RPIS3.Base_Reduzida as Base_Reduzida_PIS3, RPIS3.Percentual_BC_R' +
        'eduzida as Percentual_BC_Reduzida_PIS3, RPIS3.Base_Acrescida as ' +
        'Base_Acrescida_PIS3,'
      
        'RPIS3.Percentual_BC_Acrescida as Percentual_BC_Acrescida_PIS3, C' +
        'ST3_3.Codigo_Situacao as Codigo_ST_PIS3_3, CST3_3.Descricao as D' +
        'escricao_ST_PIS3_3,'
      ''
      
        'RPIS4.Descricao as Descricao_PIS4, RPIS4.Aliquota as Aliquota_PI' +
        'S4, RPIS4.Tipo_Recolhimento as Tipo_Recolhimento_PIS4,'
      
        'RPIS4.Base_Reduzida as Base_Reduzida_PIS4, RPIS4.Percentual_BC_R' +
        'eduzida as Percentual_BC_Reduzida_PIS4, RPIS4.Base_Acrescida as ' +
        'Base_Acrescida_PIS4,'
      
        'RPIS4.Percentual_BC_Acrescida as Percentual_BC_Acrescida_PIS4, C' +
        'ST3_4.Codigo_Situacao as Codigo_ST_PIS3_4, CST3_4.Descricao as D' +
        'escricao_ST_PIS3_4,'
      ''
      
        'RPIS5.Descricao as Descricao_PIS5, RPIS5.Aliquota as Aliquota_PI' +
        'S5, RPIS5.Tipo_Recolhimento as Tipo_Recolhimento_PIS5,'
      
        'RPIS5.Base_Reduzida as Base_Reduzida_PIS5, RPIS5.Percentual_BC_R' +
        'eduzida as Percentual_BC_Reduzida_PIS5, RPIS5.Base_Acrescida as ' +
        'Base_Acrescida_PIS5,'
      
        'RPIS5.Percentual_BC_Acrescida as Percentual_BC_Acrescida_PIS5, C' +
        'ST3_5.Codigo_Situacao as Codigo_ST_PIS3_5, CST3_5.Descricao as D' +
        'escricao_ST_PIS3_5,'
      ''
      ''
      
        'RPIS6.Descricao as Descricao_PIS6, RPIS6.Aliquota as Aliquota_PI' +
        'S6, RPIS6.Tipo_Recolhimento as Tipo_Recolhimento_PIS6,'
      
        'RPIS6.Base_Reduzida as Base_Reduzida_PIS6, RPIS6.Percentual_BC_R' +
        'eduzida as Percentual_BC_Reduzida_PIS6, RPIS6.Base_Acrescida as ' +
        'Base_Acrescida_PIS6,'
      
        'RPIS6.Percentual_BC_Acrescida as Percentual_BC_Acrescida_PIS6, C' +
        'ST3_6.Codigo_Situacao as Codigo_ST_PIS3_6, CST3_6.Descricao as D' +
        'escricao_ST_PIS3_6,'
      ''
      
        'RPIS7.Descricao as Descricao_PIS7, RPIS7.Aliquota as Aliquota_PI' +
        'S7, RPIS7.Tipo_Recolhimento as Tipo_Recolhimento_PIS7,'
      
        'RPIS7.Base_Reduzida as Base_Reduzida_PIS7, RPIS7.Percentual_BC_R' +
        'eduzida as Percentual_BC_Reduzida_PIS7, RPIS7.Base_Acrescida as ' +
        'Base_Acrescida_PIS7,'
      
        'RPIS7.Percentual_BC_Acrescida as Percentual_BC_Acrescida_PIS7, C' +
        'ST3_7.Codigo_Situacao as Codigo_ST_PIS3_7, CST3_7.Descricao as D' +
        'escricao_ST_PIS3_7'
      'from Produto Pro'
      ''
      
        'inner join Grupo_Produto_Tributacao_PIS GPTP on (GPTP.Codigo = P' +
        'ro.Codigo_Grupo_Tributacao_PIS)'
      
        'inner join Tratamento_PIS TP on (GPTP.Codigo_Tratamento_PIS = TP' +
        '.Codigo)'
      
        'inner join Itens_Tratamento_PIS ITPIS on (TP.Codigo = ITPIS.Codi' +
        'go)'
      
        'inner join Regra_PIS RPIS1 on (ITPIS.Entrada_Regra_EN = RPIS1.Co' +
        'digo)'
      
        'inner join Regra_PIS RPIS2 on (ITPIS.Entrada_Regra_EPP = RPIS2.C' +
        'odigo)'
      
        'inner join Regra_PIS RPIS3 on (ITPIS.Entrada_Regra_ME = RPIS3.Co' +
        'digo)'
      
        'inner join Regra_PIS RPIS4 on (ITPIS.Saida_Regra_EN = RPIS4.Codi' +
        'go)'
      
        'inner join Regra_PIS RPIS5 on (ITPIS.Saida_Regra_EPP = RPIS5.Cod' +
        'igo)'
      
        'inner join Regra_PIS RPIS6 on (ITPIS.Saida_Regra_ME = RPIS6.Codi' +
        'go)'
      
        'inner join Regra_PIS RPIS7 on (ITPIS.Regra_Nao_Contribuinte = RP' +
        'IS7.Codigo)'
      ''
      
        'inner join Cadastro_Situacao_Tributaria CST3_1 on (RPIS1.Codigo_' +
        'Situacao_Tributaria = CST3_1.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST3_2 on (RPIS2.Codigo_' +
        'Situacao_Tributaria = CST3_2.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST3_3 on (RPIS3.Codigo_' +
        'Situacao_Tributaria = CST3_3.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST3_4 on (RPIS4.Codigo_' +
        'Situacao_Tributaria = CST3_4.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST3_5 on (RPIS5.Codigo_' +
        'Situacao_Tributaria = CST3_5.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST3_6 on (RPIS6.Codigo_' +
        'Situacao_Tributaria = CST3_6.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST3_7 on (RPIS7.Codigo_' +
        'Situacao_Tributaria = CST3_7.Codigo)')
    Left = 657
    Top = 50
    object ADOQuery5Descricao_PIS1: TStringField
      FieldName = 'Descricao_PIS1'
      Size = 50
    end
    object ADOQuery5Aliquota_PIS1: TStringField
      FieldName = 'Aliquota_PIS1'
      Size = 5
    end
    object ADOQuery5Tipo_Recolhimento_PIS1: TStringField
      FieldName = 'Tipo_Recolhimento_PIS1'
      Size = 30
    end
    object ADOQuery5Base_Reduzida_PIS1: TStringField
      FieldName = 'Base_Reduzida_PIS1'
      Size = 3
    end
    object ADOQuery5Percentual_BC_Reduzida_PIS1: TStringField
      FieldName = 'Percentual_BC_Reduzida_PIS1'
      Size = 5
    end
    object ADOQuery5Base_Acrescida_PIS1: TStringField
      FieldName = 'Base_Acrescida_PIS1'
      Size = 3
    end
    object ADOQuery5Percentual_BC_Acrescida_PIS1: TStringField
      FieldName = 'Percentual_BC_Acrescida_PIS1'
      Size = 5
    end
    object ADOQuery5Codigo_ST_PIS3_1: TStringField
      FieldName = 'Codigo_ST_PIS3_1'
      Size = 5
    end
    object ADOQuery5Descricao_ST_PIS3_1: TStringField
      FieldName = 'Descricao_ST_PIS3_1'
      Size = 50
    end
    object ADOQuery5Descricao_PIS2: TStringField
      FieldName = 'Descricao_PIS2'
      Size = 50
    end
    object ADOQuery5Aliquota_PIS2: TStringField
      FieldName = 'Aliquota_PIS2'
      Size = 5
    end
    object ADOQuery5Tipo_Recolhimento_PIS2: TStringField
      FieldName = 'Tipo_Recolhimento_PIS2'
      Size = 30
    end
    object ADOQuery5Base_Reduzida_PIS2: TStringField
      FieldName = 'Base_Reduzida_PIS2'
      Size = 3
    end
    object ADOQuery5Percentual_BC_Reduzida_PIS2: TStringField
      FieldName = 'Percentual_BC_Reduzida_PIS2'
      Size = 5
    end
    object ADOQuery5Base_Acrescida_PIS2: TStringField
      FieldName = 'Base_Acrescida_PIS2'
      Size = 3
    end
    object ADOQuery5Percentual_BC_Acrescida_PIS2: TStringField
      FieldName = 'Percentual_BC_Acrescida_PIS2'
      Size = 5
    end
    object ADOQuery5Codigo_ST_PIS3_2: TStringField
      FieldName = 'Codigo_ST_PIS3_2'
      Size = 5
    end
    object ADOQuery5Descricao_ST_PIS3_2: TStringField
      FieldName = 'Descricao_ST_PIS3_2'
      Size = 50
    end
    object ADOQuery5Descricao_PIS3: TStringField
      FieldName = 'Descricao_PIS3'
      Size = 50
    end
    object ADOQuery5Aliquota_PIS3: TStringField
      FieldName = 'Aliquota_PIS3'
      Size = 5
    end
    object ADOQuery5Tipo_Recolhimento_PIS3: TStringField
      FieldName = 'Tipo_Recolhimento_PIS3'
      Size = 30
    end
    object ADOQuery5Base_Reduzida_PIS3: TStringField
      FieldName = 'Base_Reduzida_PIS3'
      Size = 3
    end
    object ADOQuery5Percentual_BC_Reduzida_PIS3: TStringField
      FieldName = 'Percentual_BC_Reduzida_PIS3'
      Size = 5
    end
    object ADOQuery5Base_Acrescida_PIS3: TStringField
      FieldName = 'Base_Acrescida_PIS3'
      Size = 3
    end
    object ADOQuery5Percentual_BC_Acrescida_PIS3: TStringField
      FieldName = 'Percentual_BC_Acrescida_PIS3'
      Size = 5
    end
    object ADOQuery5Codigo_ST_PIS3_3: TStringField
      FieldName = 'Codigo_ST_PIS3_3'
      Size = 5
    end
    object ADOQuery5Descricao_ST_PIS3_3: TStringField
      FieldName = 'Descricao_ST_PIS3_3'
      Size = 50
    end
    object ADOQuery5Descricao_PIS4: TStringField
      FieldName = 'Descricao_PIS4'
      Size = 50
    end
    object ADOQuery5Aliquota_PIS4: TStringField
      FieldName = 'Aliquota_PIS4'
      Size = 5
    end
    object ADOQuery5Tipo_Recolhimento_PIS4: TStringField
      FieldName = 'Tipo_Recolhimento_PIS4'
      Size = 30
    end
    object ADOQuery5Base_Reduzida_PIS4: TStringField
      FieldName = 'Base_Reduzida_PIS4'
      Size = 3
    end
    object ADOQuery5Percentual_BC_Reduzida_PIS4: TStringField
      FieldName = 'Percentual_BC_Reduzida_PIS4'
      Size = 5
    end
    object ADOQuery5Base_Acrescida_PIS4: TStringField
      FieldName = 'Base_Acrescida_PIS4'
      Size = 3
    end
    object ADOQuery5Percentual_BC_Acrescida_PIS4: TStringField
      FieldName = 'Percentual_BC_Acrescida_PIS4'
      Size = 5
    end
    object ADOQuery5Codigo_ST_PIS3_4: TStringField
      FieldName = 'Codigo_ST_PIS3_4'
      Size = 5
    end
    object ADOQuery5Descricao_ST_PIS3_4: TStringField
      FieldName = 'Descricao_ST_PIS3_4'
      Size = 50
    end
    object ADOQuery5Descricao_PIS5: TStringField
      FieldName = 'Descricao_PIS5'
      Size = 50
    end
    object ADOQuery5Aliquota_PIS5: TStringField
      FieldName = 'Aliquota_PIS5'
      Size = 5
    end
    object ADOQuery5Tipo_Recolhimento_PIS5: TStringField
      FieldName = 'Tipo_Recolhimento_PIS5'
      Size = 30
    end
    object ADOQuery5Base_Reduzida_PIS5: TStringField
      FieldName = 'Base_Reduzida_PIS5'
      Size = 3
    end
    object ADOQuery5Percentual_BC_Reduzida_PIS5: TStringField
      FieldName = 'Percentual_BC_Reduzida_PIS5'
      Size = 5
    end
    object ADOQuery5Base_Acrescida_PIS5: TStringField
      FieldName = 'Base_Acrescida_PIS5'
      Size = 3
    end
    object ADOQuery5Percentual_BC_Acrescida_PIS5: TStringField
      FieldName = 'Percentual_BC_Acrescida_PIS5'
      Size = 5
    end
    object ADOQuery5Codigo_ST_PIS3_5: TStringField
      FieldName = 'Codigo_ST_PIS3_5'
      Size = 5
    end
    object ADOQuery5Descricao_ST_PIS3_5: TStringField
      FieldName = 'Descricao_ST_PIS3_5'
      Size = 50
    end
    object ADOQuery5Descricao_PIS6: TStringField
      FieldName = 'Descricao_PIS6'
      Size = 50
    end
    object ADOQuery5Aliquota_PIS6: TStringField
      FieldName = 'Aliquota_PIS6'
      Size = 5
    end
    object ADOQuery5Tipo_Recolhimento_PIS6: TStringField
      FieldName = 'Tipo_Recolhimento_PIS6'
      Size = 30
    end
    object ADOQuery5Base_Reduzida_PIS6: TStringField
      FieldName = 'Base_Reduzida_PIS6'
      Size = 3
    end
    object ADOQuery5Percentual_BC_Reduzida_PIS6: TStringField
      FieldName = 'Percentual_BC_Reduzida_PIS6'
      Size = 5
    end
    object ADOQuery5Base_Acrescida_PIS6: TStringField
      FieldName = 'Base_Acrescida_PIS6'
      Size = 3
    end
    object ADOQuery5Percentual_BC_Acrescida_PIS6: TStringField
      FieldName = 'Percentual_BC_Acrescida_PIS6'
      Size = 5
    end
    object ADOQuery5Codigo_ST_PIS3_6: TStringField
      FieldName = 'Codigo_ST_PIS3_6'
      Size = 5
    end
    object ADOQuery5Descricao_ST_PIS3_6: TStringField
      FieldName = 'Descricao_ST_PIS3_6'
      Size = 50
    end
    object ADOQuery5Descricao_PIS7: TStringField
      FieldName = 'Descricao_PIS7'
      Size = 50
    end
    object ADOQuery5Aliquota_PIS7: TStringField
      FieldName = 'Aliquota_PIS7'
      Size = 5
    end
    object ADOQuery5Tipo_Recolhimento_PIS7: TStringField
      FieldName = 'Tipo_Recolhimento_PIS7'
      Size = 30
    end
    object ADOQuery5Base_Reduzida_PIS7: TStringField
      FieldName = 'Base_Reduzida_PIS7'
      Size = 3
    end
    object ADOQuery5Percentual_BC_Reduzida_PIS7: TStringField
      FieldName = 'Percentual_BC_Reduzida_PIS7'
      Size = 5
    end
    object ADOQuery5Base_Acrescida_PIS7: TStringField
      FieldName = 'Base_Acrescida_PIS7'
      Size = 3
    end
    object ADOQuery5Percentual_BC_Acrescida_PIS7: TStringField
      FieldName = 'Percentual_BC_Acrescida_PIS7'
      Size = 5
    end
    object ADOQuery5Codigo_ST_PIS3_7: TStringField
      FieldName = 'Codigo_ST_PIS3_7'
      Size = 5
    end
    object ADOQuery5Descricao_ST_PIS3_7: TStringField
      FieldName = 'Descricao_ST_PIS3_7'
      Size = 50
    end
  end
  object ADOQuery6: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Grupo'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select RC1.Descricao as Descricao_COFINS1, RC1.Aliquota as Aliqu' +
        'ota_COFINS1, RC1.Tipo_Recolhimento as Tipo_Recolhimento_COFINS1,'
      
        'RC1.Base_Reduzida as Base_Reduzida_COFINS1, RC1.Percentual_BC_Re' +
        'duzida as Percentual_BC_Reduzida_COFINS1, RC1.Base_Acrescida as ' +
        'Base_Acrescida_COFINS1,'
      
        'RC1.Percentual_BC_Acrescida as Percentual_BC_Acrescida_COFINS1, ' +
        'CST4_1.Codigo_Situacao as Codigo_ST_COFINS1, CST4_1.Descricao as' +
        ' Descricao_ST_COFINS1,'
      ''
      
        'RC2.Descricao as Descricao_COFINS2, RC2.Aliquota as Aliquota_COF' +
        'INS2, RC2.Tipo_Recolhimento as Tipo_Recolhimento_COFINS2,'
      
        'RC2.Base_Reduzida as Base_Reduzida_COFINS2, RC2.Percentual_BC_Re' +
        'duzida as Percentual_BC_Reduzida_COFINS2, RC2.Base_Acrescida as ' +
        'Base_Acrescida_COFINS2,'
      
        'RC2.Percentual_BC_Acrescida as Percentual_BC_Acrescida_COFINS2, ' +
        'CST4_2.Codigo_Situacao as Codigo_ST_COFINS2, CST4_2.Descricao as' +
        ' Descricao_ST_COFINS2,'
      ''
      
        'RC3.Descricao as Descricao_COFINS3, RC3.Aliquota as Aliquota_COF' +
        'INS3, RC3.Tipo_Recolhimento as Tipo_Recolhimento_COFINS3,'
      
        'RC3.Base_Reduzida as Base_Reduzida_COFINS3, RC3.Percentual_BC_Re' +
        'duzida as Percentual_BC_Reduzida_COFINS3, RC3.Base_Acrescida as ' +
        'Base_Acrescida_COFINS3,'
      
        'RC3.Percentual_BC_Acrescida as Percentual_BC_Acrescida_COFINS3, ' +
        'CST4_3.Codigo_Situacao as Codigo_ST_COFINS3, CST4_3.Descricao as' +
        ' Descricao_ST_COFINS3,'
      ''
      
        'RC4.Descricao as Descricao_COFINS4, RC4.Aliquota as Aliquota_COF' +
        'INS4, RC4.Tipo_Recolhimento as Tipo_Recolhimento_COFINS4,'
      
        'RC4.Base_Reduzida as Base_Reduzida_COFINS4, RC4.Percentual_BC_Re' +
        'duzida as Percentual_BC_Reduzida_COFINS4, RC4.Base_Acrescida as ' +
        'Base_Acrescida_COFINS4,'
      
        'RC4.Percentual_BC_Acrescida as Percentual_BC_Acrescida_COFINS4, ' +
        'CST4_4.Codigo_Situacao as Codigo_ST_COFINS4, CST4_4.Descricao as' +
        ' Descricao_ST_COFINS4,'
      ''
      
        'RC5.Descricao as Descricao_COFINS5, RC5.Aliquota as Aliquota_COF' +
        'INS5, RC5.Tipo_Recolhimento as Tipo_Recolhimento_COFINS5,'
      
        'RC5.Base_Reduzida as Base_Reduzida_COFINS5, RC5.Percentual_BC_Re' +
        'duzida as Percentual_BC_Reduzida_COFINS5, RC5.Base_Acrescida as ' +
        'Base_Acrescida_COFINS5,'
      
        'RC5.Percentual_BC_Acrescida as Percentual_BC_Acrescida_COFINS5, ' +
        'CST4_5.Codigo_Situacao as Codigo_ST_COFINS5, CST4_5.Descricao as' +
        ' Descricao_ST_COFINS5,'
      ''
      
        'RC6.Descricao as Descricao_COFINS6, RC6.Aliquota as Aliquota_COF' +
        'INS6, RC6.Tipo_Recolhimento as Tipo_Recolhimento_COFINS6,'
      
        'RC6.Base_Reduzida as Base_Reduzida_COFINS6, RC6.Percentual_BC_Re' +
        'duzida as Percentual_BC_Reduzida_COFINS6, RC6.Base_Acrescida as ' +
        'Base_Acrescida_COFINS6,'
      
        'RC6.Percentual_BC_Acrescida as Percentual_BC_Acrescida_COFINS6, ' +
        'CST4_6.Codigo_Situacao as Codigo_ST_COFINS6, CST4_6.Descricao as' +
        ' Descricao_ST_COFINS6,'
      ''
      
        'RC7.Descricao as Descricao_COFINS7, RC7.Aliquota as Aliquota_COF' +
        'INS7, RC7.Tipo_Recolhimento as Tipo_Recolhimento_COFINS7,'
      
        'RC7.Base_Reduzida as Base_Reduzida_COFINS7, RC7.Percentual_BC_Re' +
        'duzida as Percentual_BC_Reduzida_COFINS7, RC7.Base_Acrescida as ' +
        'Base_Acrescida_COFINS7,'
      
        'RC7.Percentual_BC_Acrescida as Percentual_BC_Acrescida_COFINS7, ' +
        'CST4_7.Codigo_Situacao as Codigo_ST_COFINS7, CST4_7.Descricao as' +
        ' Descricao_ST_COFINS7'
      ''
      'from Produto Pro'
      ''
      
        'inner join Grupo_Produto_Tributacao_COFINS GPTC on (GPTC.Codigo ' +
        '= Pro.Codigo_Grupo_Tributacao_COFINS)'
      
        'inner join Tratamento_COFINS TC on (GPTC.Codigo_Tratamento_COFIN' +
        'S = TC.Codigo)'
      
        'inner join Itens_Tratamento_COFINS ITCOFINS on (TC.Codigo = ITCO' +
        'FINS.Codigo)'
      
        'inner join Regra_COFINS RC1 on (ITCOFINS.Entrada_Regra_EN = RC1.' +
        'Codigo)'
      
        'inner join Regra_COFINS RC2 on (ITCOFINS.Entrada_Regra_EPP = RC2' +
        '.Codigo)'
      
        'inner join Regra_COFINS RC3 on (ITCOFINS.Entrada_Regra_ME = RC3.' +
        'Codigo)'
      
        'inner join Regra_COFINS RC4 on (ITCOFINS.Saida_Regra_EN = RC4.Co' +
        'digo)'
      
        'inner join Regra_COFINS RC5 on (ITCOFINS.Saida_Regra_EPP = RC5.C' +
        'odigo)'
      
        'inner join Regra_COFINS RC6 on (ITCOFINS.Saida_Regra_ME = RC6.Co' +
        'digo)'
      
        'inner join Regra_COFINS RC7 on (ITCOFINS.Regra_Nao_Contribuinte ' +
        '= RC7.Codigo)'
      ''
      
        'inner join Cadastro_Situacao_Tributaria CST4_1 on (RC1.Codigo_Si' +
        'tuacao_Tributaria = CST4_1.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST4_2 on (RC2.Codigo_Si' +
        'tuacao_Tributaria = CST4_2.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST4_3 on (RC3.Codigo_Si' +
        'tuacao_Tributaria = CST4_3.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST4_4 on (RC4.Codigo_Si' +
        'tuacao_Tributaria = CST4_4.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST4_5 on (RC5.Codigo_Si' +
        'tuacao_Tributaria = CST4_5.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST4_6 on (RC6.Codigo_Si' +
        'tuacao_Tributaria = CST4_6.Codigo)'
      
        'inner join Cadastro_Situacao_Tributaria CST4_7 on (RC7.Codigo_Si' +
        'tuacao_Tributaria = CST4_7.Codigo)'
      'where Pro.Codigo_Grupo_Tributacao_COFINS = :Grupo')
    Left = 881
    Top = 130
    object ADOQuery6Descricao_COFINS1: TStringField
      FieldName = 'Descricao_COFINS1'
      Size = 50
    end
    object ADOQuery6Aliquota_COFINS1: TStringField
      FieldName = 'Aliquota_COFINS1'
      Size = 5
    end
    object ADOQuery6Tipo_Recolhimento_COFINS1: TStringField
      FieldName = 'Tipo_Recolhimento_COFINS1'
      Size = 30
    end
    object ADOQuery6Base_Reduzida_COFINS1: TStringField
      FieldName = 'Base_Reduzida_COFINS1'
      Size = 3
    end
    object ADOQuery6Percentual_BC_Reduzida_COFINS1: TStringField
      FieldName = 'Percentual_BC_Reduzida_COFINS1'
      Size = 5
    end
    object ADOQuery6Base_Acrescida_COFINS1: TStringField
      FieldName = 'Base_Acrescida_COFINS1'
      Size = 3
    end
    object ADOQuery6Percentual_BC_Acrescida_COFINS1: TStringField
      FieldName = 'Percentual_BC_Acrescida_COFINS1'
      Size = 5
    end
    object ADOQuery6Codigo_ST_COFINS1: TStringField
      FieldName = 'Codigo_ST_COFINS1'
      Size = 5
    end
    object ADOQuery6Descricao_ST_COFINS1: TStringField
      FieldName = 'Descricao_ST_COFINS1'
      Size = 50
    end
    object ADOQuery6Descricao_COFINS2: TStringField
      FieldName = 'Descricao_COFINS2'
      Size = 50
    end
    object ADOQuery6Aliquota_COFINS2: TStringField
      FieldName = 'Aliquota_COFINS2'
      Size = 5
    end
    object ADOQuery6Tipo_Recolhimento_COFINS2: TStringField
      FieldName = 'Tipo_Recolhimento_COFINS2'
      Size = 30
    end
    object ADOQuery6Base_Reduzida_COFINS2: TStringField
      FieldName = 'Base_Reduzida_COFINS2'
      Size = 3
    end
    object ADOQuery6Percentual_BC_Reduzida_COFINS2: TStringField
      FieldName = 'Percentual_BC_Reduzida_COFINS2'
      Size = 5
    end
    object ADOQuery6Base_Acrescida_COFINS2: TStringField
      FieldName = 'Base_Acrescida_COFINS2'
      Size = 3
    end
    object ADOQuery6Percentual_BC_Acrescida_COFINS2: TStringField
      FieldName = 'Percentual_BC_Acrescida_COFINS2'
      Size = 5
    end
    object ADOQuery6Codigo_ST_COFINS2: TStringField
      FieldName = 'Codigo_ST_COFINS2'
      Size = 5
    end
    object ADOQuery6Descricao_ST_COFINS2: TStringField
      FieldName = 'Descricao_ST_COFINS2'
      Size = 50
    end
    object ADOQuery6Descricao_COFINS3: TStringField
      FieldName = 'Descricao_COFINS3'
      Size = 50
    end
    object ADOQuery6Aliquota_COFINS3: TStringField
      FieldName = 'Aliquota_COFINS3'
      Size = 5
    end
    object ADOQuery6Tipo_Recolhimento_COFINS3: TStringField
      FieldName = 'Tipo_Recolhimento_COFINS3'
      Size = 30
    end
    object ADOQuery6Base_Reduzida_COFINS3: TStringField
      FieldName = 'Base_Reduzida_COFINS3'
      Size = 3
    end
    object ADOQuery6Percentual_BC_Reduzida_COFINS3: TStringField
      FieldName = 'Percentual_BC_Reduzida_COFINS3'
      Size = 5
    end
    object ADOQuery6Base_Acrescida_COFINS3: TStringField
      FieldName = 'Base_Acrescida_COFINS3'
      Size = 3
    end
    object ADOQuery6Percentual_BC_Acrescida_COFINS3: TStringField
      FieldName = 'Percentual_BC_Acrescida_COFINS3'
      Size = 5
    end
    object ADOQuery6Codigo_ST_COFINS3: TStringField
      FieldName = 'Codigo_ST_COFINS3'
      Size = 5
    end
    object ADOQuery6Descricao_ST_COFINS3: TStringField
      FieldName = 'Descricao_ST_COFINS3'
      Size = 50
    end
    object ADOQuery6Descricao_COFINS4: TStringField
      FieldName = 'Descricao_COFINS4'
      Size = 50
    end
    object ADOQuery6Aliquota_COFINS4: TStringField
      FieldName = 'Aliquota_COFINS4'
      Size = 5
    end
    object ADOQuery6Tipo_Recolhimento_COFINS4: TStringField
      FieldName = 'Tipo_Recolhimento_COFINS4'
      Size = 30
    end
    object ADOQuery6Base_Reduzida_COFINS4: TStringField
      FieldName = 'Base_Reduzida_COFINS4'
      Size = 3
    end
    object ADOQuery6Percentual_BC_Reduzida_COFINS4: TStringField
      FieldName = 'Percentual_BC_Reduzida_COFINS4'
      Size = 5
    end
    object ADOQuery6Base_Acrescida_COFINS4: TStringField
      FieldName = 'Base_Acrescida_COFINS4'
      Size = 3
    end
    object ADOQuery6Percentual_BC_Acrescida_COFINS4: TStringField
      FieldName = 'Percentual_BC_Acrescida_COFINS4'
      Size = 5
    end
    object ADOQuery6Codigo_ST_COFINS4: TStringField
      FieldName = 'Codigo_ST_COFINS4'
      Size = 5
    end
    object ADOQuery6Descricao_ST_COFINS4: TStringField
      FieldName = 'Descricao_ST_COFINS4'
      Size = 50
    end
    object ADOQuery6Descricao_COFINS5: TStringField
      FieldName = 'Descricao_COFINS5'
      Size = 50
    end
    object ADOQuery6Aliquota_COFINS5: TStringField
      FieldName = 'Aliquota_COFINS5'
      Size = 5
    end
    object ADOQuery6Tipo_Recolhimento_COFINS5: TStringField
      FieldName = 'Tipo_Recolhimento_COFINS5'
      Size = 30
    end
    object ADOQuery6Base_Reduzida_COFINS5: TStringField
      FieldName = 'Base_Reduzida_COFINS5'
      Size = 3
    end
    object ADOQuery6Percentual_BC_Reduzida_COFINS5: TStringField
      FieldName = 'Percentual_BC_Reduzida_COFINS5'
      Size = 5
    end
    object ADOQuery6Base_Acrescida_COFINS5: TStringField
      FieldName = 'Base_Acrescida_COFINS5'
      Size = 3
    end
    object ADOQuery6Percentual_BC_Acrescida_COFINS5: TStringField
      FieldName = 'Percentual_BC_Acrescida_COFINS5'
      Size = 5
    end
    object ADOQuery6Codigo_ST_COFINS5: TStringField
      FieldName = 'Codigo_ST_COFINS5'
      Size = 5
    end
    object ADOQuery6Descricao_ST_COFINS5: TStringField
      FieldName = 'Descricao_ST_COFINS5'
      Size = 50
    end
    object ADOQuery6Descricao_COFINS6: TStringField
      FieldName = 'Descricao_COFINS6'
      Size = 50
    end
    object ADOQuery6Aliquota_COFINS6: TStringField
      FieldName = 'Aliquota_COFINS6'
      Size = 5
    end
    object ADOQuery6Tipo_Recolhimento_COFINS6: TStringField
      FieldName = 'Tipo_Recolhimento_COFINS6'
      Size = 30
    end
    object ADOQuery6Base_Reduzida_COFINS6: TStringField
      FieldName = 'Base_Reduzida_COFINS6'
      Size = 3
    end
    object ADOQuery6Percentual_BC_Reduzida_COFINS6: TStringField
      FieldName = 'Percentual_BC_Reduzida_COFINS6'
      Size = 5
    end
    object ADOQuery6Base_Acrescida_COFINS6: TStringField
      FieldName = 'Base_Acrescida_COFINS6'
      Size = 3
    end
    object ADOQuery6Percentual_BC_Acrescida_COFINS6: TStringField
      FieldName = 'Percentual_BC_Acrescida_COFINS6'
      Size = 5
    end
    object ADOQuery6Codigo_ST_COFINS6: TStringField
      FieldName = 'Codigo_ST_COFINS6'
      Size = 5
    end
    object ADOQuery6Descricao_ST_COFINS6: TStringField
      FieldName = 'Descricao_ST_COFINS6'
      Size = 50
    end
    object ADOQuery6Descricao_COFINS7: TStringField
      FieldName = 'Descricao_COFINS7'
      Size = 50
    end
    object ADOQuery6Aliquota_COFINS7: TStringField
      FieldName = 'Aliquota_COFINS7'
      Size = 5
    end
    object ADOQuery6Tipo_Recolhimento_COFINS7: TStringField
      FieldName = 'Tipo_Recolhimento_COFINS7'
      Size = 30
    end
    object ADOQuery6Base_Reduzida_COFINS7: TStringField
      FieldName = 'Base_Reduzida_COFINS7'
      Size = 3
    end
    object ADOQuery6Percentual_BC_Reduzida_COFINS7: TStringField
      FieldName = 'Percentual_BC_Reduzida_COFINS7'
      Size = 5
    end
    object ADOQuery6Base_Acrescida_COFINS7: TStringField
      FieldName = 'Base_Acrescida_COFINS7'
      Size = 3
    end
    object ADOQuery6Percentual_BC_Acrescida_COFINS7: TStringField
      FieldName = 'Percentual_BC_Acrescida_COFINS7'
      Size = 5
    end
    object ADOQuery6Codigo_ST_COFINS7: TStringField
      FieldName = 'Codigo_ST_COFINS7'
      Size = 5
    end
    object ADOQuery6Descricao_ST_COFINS7: TStringField
      FieldName = 'Descricao_ST_COFINS7'
      Size = 50
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 904
    Top = 16
  end
  object qrypedido_pendente: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    AfterEdit = qryitens_nfAfterEdit
    Parameters = <>
    SQL.Strings = (
      
        'select P.Codigo, P.N_Pedido, P.Data_Venda, P.Total_Pedido, P.Tip' +
        'o as TipoVenda, P.COO, Cli.Codigo as CodCli, Cli.Nome_Nome_Fanta' +
        'sia, '
      
        'Cli.Razao_Social, Cli.Email, Cli.Endereco, P.Status,  Cli.Tipo, ' +
        'Cli.CPF, Cli.CNPJ, Ci.Codigo_Municipio,'
      'P.Total_Produtos, P.Desc_Acr'
      'from Pedido P'
      'left join Cliente Cli on (P.Codigo_Cliente = Cli.Codigo)'
      'left join Pedido_Endereco_Cliente pec on pec.N_Pedido = p.Codigo'
      'left join Cidade Ci on Ci.Codigo = Cli.Codigo_Cidade')
    Left = 744
    Top = 149
    object qrypedido_pendenteCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrypedido_pendenteN_Pedido: TStringField
      FieldName = 'N_Pedido'
      Size = 13
    end
    object qrypedido_pendenteData_Venda: TDateTimeField
      FieldName = 'Data_Venda'
    end
    object qrypedido_pendenteTotal_Pedido: TFloatField
      FieldName = 'Total_Pedido'
      DisplayFormat = '#0.0,0'
    end
    object qrypedido_pendenteCodCli: TIntegerField
      FieldName = 'CodCli'
    end
    object qrypedido_pendenteNome_Nome_Fantasia: TStringField
      FieldName = 'Nome_Nome_Fantasia'
      Size = 50
    end
    object qrypedido_pendenteRazao_Social: TStringField
      FieldName = 'Razao_Social'
      Size = 50
    end
    object qrypedido_pendenteEmail: TStringField
      FieldName = 'Email'
      Size = 100
    end
    object qrypedido_pendenteEndereco: TStringField
      FieldName = 'Endereco'
      Size = 200
    end
    object qrypedido_pendenteStatus: TStringField
      FieldName = 'Status'
      Size = 10
    end
    object qrypedido_pendenteTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object qrypedido_pendenteCPF: TStringField
      FieldName = 'CPF'
    end
    object qrypedido_pendenteCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 15
    end
    object qrypedido_pendenteCodigo_Municipio: TStringField
      FieldName = 'Codigo_Municipio'
    end
    object qrypedido_pendenteTotal_Produtos: TFloatField
      FieldName = 'Total_Produtos'
    end
    object qrypedido_pendenteDesc_Acr: TFloatField
      FieldName = 'Desc_Acr'
    end
    object qrypedido_pendenteTipoVenda: TStringField
      FieldName = 'TipoVenda'
      Size = 10
    end
    object qrypedido_pendenteCOO: TStringField
      FieldName = 'COO'
      Size = 6
    end
  end
  object DataSource3: TDataSource
    DataSet = qrypedido_pendente
    Left = 784
    Top = 149
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 832
    Top = 16
  end
  object dtReferenciaDevolucao: TDataSource
    Left = 736
    Top = 64
  end
  object DataSource4: TDataSource
    DataSet = ClientDataSet1
    Left = 872
    Top = 168
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    BeforePost = ClientDataSet1BeforePost
    AfterPost = ClientDataSet1AfterPost
    Left = 904
    Top = 168
    object ClientDataSet1NDoc: TStringField
      FieldName = 'NDoc'
    end
    object ClientDataSet1Data: TDateField
      FieldName = 'Data'
      EditMask = '!99/99/9999;1;_'
    end
    object ClientDataSet1Valor: TFloatField
      FieldName = 'Valor'
      currency = True
    end
    object ClientDataSet1Status: TStringField
      FieldName = 'Status'
      Size = 10
    end
    object ClientDataSet1DataPagamento: TDateField
      FieldName = 'DataPagamento'
      OnGetText = ClientDataSet1DataPagamentoGetText
      EditMask = '!99/99/9999;1;_'
    end
    object ClientDataSet1ValorTeste: TAggregateField
      FieldName = 'ValorTeste'
      Active = True
      currency = True
      DisplayFormat = '#0.0,0'
      Expression = 'Sum(Valor)'
    end
  end
  object cxPropertiesStore1: TcxPropertiesStore
    Components = <>
    StorageName = 'ConfiguraGrid'
    Left = 784
    Top = 16
  end
  object cxEditRepository1: TcxEditRepository
    Left = 712
    Top = 144
    object cxEditRepository1CheckBoxItem1: TcxEditRepositoryCheckBoxItem
    end
  end
end
