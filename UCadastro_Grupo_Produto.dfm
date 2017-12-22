object FrmCadastro_Grupo_Produto: TFrmCadastro_Grupo_Produto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Grupo de Produtos'
  ClientHeight = 389
  ClientWidth = 998
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 125
    Top = 0
    Width = 873
    Height = 389
    Cursor = crHandPoint
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object LblCodigo: TLabel
        Left = 0
        Top = 13
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblData_Cadastro: TLabel
        Left = 55
        Top = 13
        Width = 81
        Height = 13
        Caption = 'Data Cadastro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblMarca: TLabel
        Left = 0
        Top = 59
        Width = 55
        Height = 13
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 0
        Top = 139
        Width = 100
        Height = 13
        Caption = 'Tratamento ICMS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 0
        Top = 177
        Width = 88
        Height = 13
        Caption = 'Tratamento IPI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 0
        Top = 216
        Width = 90
        Height = 13
        Caption = 'Tratamento PIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 0
        Top = 258
        Width = 111
        Height = 13
        Caption = 'Tratamento COFINS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 0
        Top = 99
        Width = 58
        Height = 13
        Caption = 'Sub Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 192
        Top = 59
        Width = 99
        Height = 13
        Caption = 'C'#243'digo Sub Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdtCodigo: TEdit
        Left = 0
        Top = 32
        Width = 56
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        Color = clBtnFace
        TabOrder = 0
      end
      object MEdtData_Cadastro: TMaskEdit
        Left = 55
        Top = 32
        Width = 79
        Height = 17
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
        OnEnter = MEdtData_CadastroEnter
        OnExit = MEdtData_CadastroExit
      end
      object EdtDescricao: TEdit
        Left = 0
        Top = 74
        Width = 193
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 300
        TabOrder = 2
        OnExit = EdtDescricaoExit
      end
      object EdtCodigo_Grupo_ICMS: TEdit
        Left = 0
        Top = 155
        Width = 60
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
        TabOrder = 6
        OnDblClick = EdtCodigo_Grupo_ICMSDblClick
        OnKeyDown = EdtCodigo_Grupo_ICMSKeyDown
        OnKeyPress = EdtCodigo_Grupo_ICMSKeyPress
      end
      object EdtGrupo_ICMS: TEdit
        Left = 60
        Top = 155
        Width = 181
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 7
        OnKeyPress = EdtGrupo_ICMSKeyPress
      end
      object EdtCodigo_Grupo_IPI: TEdit
        Left = 0
        Top = 193
        Width = 60
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
        TabOrder = 8
        OnDblClick = EdtCodigo_Grupo_IPIDblClick
        OnKeyDown = EdtCodigo_Grupo_IPIKeyDown
        OnKeyPress = EdtCodigo_Grupo_IPIKeyPress
      end
      object EdtGrupo_IPI: TEdit
        Left = 60
        Top = 193
        Width = 181
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 9
        OnKeyPress = EdtGrupo_IPIKeyPress
      end
      object EdtCodigo_Grupo_PIS: TEdit
        Left = 0
        Top = 232
        Width = 60
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
        TabOrder = 10
        OnDblClick = EdtCodigo_Grupo_PISDblClick
        OnKeyDown = EdtCodigo_Grupo_PISKeyDown
        OnKeyPress = EdtCodigo_Grupo_PISKeyPress
      end
      object EdtGrupo_PIS: TEdit
        Left = 60
        Top = 232
        Width = 181
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 11
        OnKeyPress = EdtGrupo_PISKeyPress
      end
      object EdtCodigo_Grupo_COFINS: TEdit
        Left = 0
        Top = 274
        Width = 60
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
        TabOrder = 12
        OnDblClick = EdtCodigo_Grupo_COFINSDblClick
        OnKeyDown = EdtCodigo_Grupo_COFINSKeyDown
        OnKeyPress = EdtCodigo_Grupo_COFINSKeyPress
      end
      object EdtGrupo_COFINS: TEdit
        Left = 60
        Top = 274
        Width = 181
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 13
        OnKeyPress = EdtGrupo_COFINSKeyPress
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 297
        Width = 108
        Height = 51
        Caption = 'Valor de Venda'
        TabOrder = 14
        object Label5: TLabel
          Left = 5
          Top = 16
          Width = 26
          Height = 13
          Caption = '% V.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 53
          Top = 16
          Width = 26
          Height = 13
          Caption = '% P.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdtPercentual_Vista: TEdit
          Left = 5
          Top = 29
          Width = 49
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 0
          OnKeyPress = EdtPercentual_VistaKeyPress
        end
        object EdtPercentual_Prazo: TEdit
          Left = 53
          Top = 29
          Width = 49
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 1
          OnKeyPress = EdtPercentual_PrazoKeyPress
        end
      end
      object GroupBox4: TGroupBox
        Left = 111
        Top = 297
        Width = 109
        Height = 51
        Caption = 'Descontos'
        TabOrder = 15
        object Label8: TLabel
          Left = 6
          Top = 16
          Width = 26
          Height = 13
          Caption = '% V.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 54
          Top = 16
          Width = 26
          Height = 13
          Caption = '% P.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdtPercentual_Desconto_Prazo: TEdit
          Left = 54
          Top = 29
          Width = 49
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 1
          OnKeyPress = EdtPercentual_Desconto_PrazoKeyPress
        end
        object EdtPercentual_Desconto_Vista: TEdit
          Left = 6
          Top = 29
          Width = 49
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 0
          OnKeyPress = EdtPercentual_Desconto_VistaKeyPress
        end
      end
      object EdtCodigo_Sub_Grupo: TEdit
        Left = 0
        Top = 115
        Width = 60
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
        TabOrder = 4
        OnDblClick = EdtCodigo_Sub_GrupoDblClick
        OnKeyDown = EdtCodigo_Sub_GrupoKeyDown
        OnKeyPress = EdtCodigo_Sub_GrupoKeyPress
      end
      object EdtSub: TEdit
        Left = 60
        Top = 115
        Width = 181
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 5
        OnKeyPress = EdtGrupo_ICMSKeyPress
      end
      object EdtSub_Grupo: TEdit
        Left = 192
        Top = 74
        Width = 130
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 3
        OnEnter = EdtSub_GrupoEnter
      end
      object GroupBox6: TGroupBox
        Left = 223
        Top = 297
        Width = 109
        Height = 51
        Caption = 'Comiss'#245'es'
        TabOrder = 16
        object Label12: TLabel
          Left = 6
          Top = 16
          Width = 26
          Height = 13
          Caption = '% V.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 54
          Top = 16
          Width = 26
          Height = 13
          Caption = '% P.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdtPercentual_Comissao_Prazo: TEdit
          Left = 54
          Top = 29
          Width = 49
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 1
          OnKeyPress = EdtPercentual_Comissao_PrazoKeyPress
        end
        object EdtPercentual_Comissao_Vista: TEdit
          Left = 6
          Top = 29
          Width = 49
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 0
          OnKeyPress = EdtPercentual_Comissao_VistaKeyPress
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Produtos no Grupo Selecionado'
      ImageIndex = 1
      object GroupBox1: TGroupBox
        Left = 2
        Top = 0
        Width = 647
        Height = 357
        Caption = 'Produtos no Grupo'
        TabOrder = 0
        object Label14: TLabel
          Left = 504
          Top = 13
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
        object Label15: TLabel
          Left = 564
          Top = 13
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
          Left = 8
          Top = 51
          Width = 633
          Height = 301
          BorderStyle = bsNone
          DataSource = DataSource1
          DrawingStyle = gdsGradient
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
          TabOrder = 4
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
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Codigo_Venda'
              Title.Caption = 'Codigo Venda'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Descricao'
              Title.Caption = 'Descri'#231#227'o'
              Width = 222
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Valor_Compra'
              Title.Caption = 'Valor Compra'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Preco_Vista'
              Title.Caption = 'Pre'#231'o Vista'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Preco_Prazo'
              Title.Caption = 'Pre'#231'o Prazo'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Ultima_Compra'
              Title.Caption = #218'lt. Compra'
              Width = 88
              Visible = True
            end>
        end
        object EdtConsulta: TEdit
          Left = 276
          Top = 28
          Width = 222
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 1
          OnChange = EdtConsultaChange
        end
        object RGPesquisar_Por: TRadioGroup
          Left = 8
          Top = 15
          Width = 262
          Height = 35
          Caption = 'Pesquisar por'
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'C'#243'd. Sistema'
            'Descri'#231#227'o'
            #218'ltima Entr.')
          TabOrder = 0
        end
        object MEdtData_Inicial: TMaskEdit
          Left = 504
          Top = 28
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
          OnEnter = MEdtData_InicialEnter
          OnExit = MEdtData_InicialExit
        end
        object MEdtData_Final: TMaskEdit
          Left = 564
          Top = 28
          Width = 61
          Height = 17
          Hint = 'Para executar a consulta, pressione a tecla TAB ou Enter'
          BevelInner = bvNone
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Text = '  /  /    '
          OnEnter = MEdtData_FinalEnter
          OnExit = MEdtData_FinalExit
        end
      end
      object GroupBox2: TGroupBox
        Left = 655
        Top = 190
        Width = 210
        Height = 74
        Caption = 'Transferir para o grupo informado abaixo'
        TabOrder = 1
        object Label7: TLabel
          Left = 7
          Top = 21
          Width = 80
          Height = 13
          Caption = 'Grupo Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdtCodigo_Grupo_Destino: TEdit
          Left = 7
          Top = 37
          Width = 60
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
          OnDblClick = EdtCodigo_Grupo_DestinoDblClick
          OnKeyDown = EdtCodigo_Grupo_DestinoKeyDown
          OnKeyPress = EdtCodigo_Grupo_ICMSKeyPress
        end
        object EdtGrupo_Destino: TEdit
          Left = 67
          Top = 37
          Width = 142
          Height = 17
          TabStop = False
          BevelEdges = [beTop, beRight, beBottom]
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          OnKeyPress = EdtGrupo_ICMSKeyPress
        end
      end
      object GroupBox5: TGroupBox
        Left = 655
        Top = 0
        Width = 197
        Height = 130
        Caption = 'Atualiza'#231#245'es'
        TabOrder = 2
        object CBAtualiza_Preco: TCheckBox
          Left = 12
          Top = 13
          Width = 89
          Height = 17
          Caption = 'Atualiza Pre'#231'o'
          TabOrder = 0
          OnClick = CBAtualiza_PrecoClick
        end
        object RGTipo_Calculo: TRadioGroup
          Left = 87
          Top = 64
          Width = 104
          Height = 48
          Caption = 'Tipo de Calc.'
          ItemIndex = 0
          Items.Strings = (
            'Margem Bruta'
            'Margem L'#237'quida')
          TabOrder = 3
        end
        object CBAtualiza_Desconto: TCheckBox
          Left = 12
          Top = 28
          Width = 115
          Height = 17
          Caption = 'Atualiza Desconto'
          TabOrder = 1
        end
        object RGItens: TRadioGroup
          Left = 12
          Top = 64
          Width = 70
          Height = 48
          Caption = 'Itens'
          ItemIndex = 0
          Items.Strings = (
            'Tudo'
            'Sel.')
          TabOrder = 2
        end
        object CBAtualiza_Comissao: TCheckBox
          Left = 12
          Top = 43
          Width = 115
          Height = 17
          Caption = 'Atualiza Comiss'#227'o'
          TabOrder = 4
        end
      end
      object RGChamar_Produtos: TRadioGroup
        Left = 655
        Top = 130
        Width = 98
        Height = 54
        Hint = 
          'Com a op'#231#227'o Mesmo Grupo selecionado, ser'#227'o listados apenas os pr' +
          'odutos desse grupo, por exemplo: um produto X est'#225' em um grupo e' +
          ' esse grupo cont'#233'm subgrupos. Ser'#227'o listados apenas os produtos ' +
          'do grupo, ignorando os produtos dos subgrupos.'#13#10'Com a op'#231#227'o Mesm' +
          'o Pai selecionado, ser'#227'o listados os produtos desse grupo e tamb' +
          #233'm de seus subgrupos, por exemplo: um produto X est'#225' em um grupo' +
          ' e esse grupo cont'#233'm subgrupos. Ser'#227'o listados todos os produtos' +
          ' do grupo e dos subgrupos.'
        Caption = 'Chamar Produtos'
        ItemIndex = 0
        Items.Strings = (
          'Mesmo Grupo'
          'Mesmo Pai')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object RGAumentar: TRadioGroup
        Left = 756
        Top = 130
        Width = 96
        Height = 54
        Hint = 
          'Atualizar pre'#231'o de venda baseado no Custo de Compra ou Valor de ' +
          'Venda'
        Caption = 'Aumentar em'
        ItemIndex = 0
        Items.Strings = (
          'Valor Compra'
          'Valor Venda')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
      end
      object BBtnInativar: TButton
        Left = 655
        Top = 301
        Width = 105
        Height = 25
        Caption = 'Desativar Produtos'
        TabOrder = 5
      end
      object BtnTransferir: TButton
        Left = 655
        Top = 332
        Width = 104
        Height = 25
        Caption = 'Transferir Produtos'
        TabOrder = 6
        OnClick = BtnTransferirClick
      end
      object BBtnAtualizar_Preco: TButton
        Left = 655
        Top = 270
        Width = 210
        Height = 25
        Hint = 
          'Clique para atualizar o pre'#231'o, desconto e/ou comiss'#227'o.'#13#10'O sistem' +
          'a verifica se as op'#231#245'es Atualiza Pre'#231'o e/ou Atualiza Desconto e/' +
          'ou Atualiza Comiss'#227'o est'#227'o marcados e atualiza cada item separad' +
          'amente.'
        Caption = 'Atualiza Pre'#231'o/Desconto/Comiss'#227'o'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = BBtnAtualizar_PrecoClick
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 389
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 121
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
    Images = DM.ImgImagens_Comandos
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
      Caption = '&Novo'
      ImageIndex = 0
      Wrap = True
      OnClick = BBtnNovoClick
    end
    object BBtnSalvar: TToolButton
      Left = 0
      Top = 38
      Cursor = crHandPoint
      Hint = 'Clique para Salvar/Alterar o registro'
      Caption = '&Salvar'
      Enabled = False
      ImageIndex = 1
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnSalvarClick
    end
    object BBtnExcluir: TToolButton
      Left = 0
      Top = 76
      Cursor = crHandPoint
      Hint = 'Clique para Excluir o registro selecionado'
      Caption = '&Excluir'
      Enabled = False
      ImageIndex = 2
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnExcluirClick
    end
    object BBtnPesquisar: TToolButton
      Left = 0
      Top = 114
      Cursor = crHandPoint
      Hint = 'Clique para pesquisar um registro desejado'
      Caption = '&Pesquisar'
      ImageIndex = 5
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnPesquisarClick
    end
    object BBtnCancelar: TToolButton
      Left = 0
      Top = 152
      Cursor = crHandPoint
      Hint = 'Clique para Cancelar a Inser'#231#227'o ou Altera'#231#227'o de um registro'
      Caption = '&Cancelar'
      Enabled = False
      ImageIndex = 4
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnCancelarClick
    end
    object BBtnFechar: TToolButton
      Left = 0
      Top = 190
      Cursor = crHandPoint
      Hint = 'Clique para Fechar a Janela Ativa'
      Caption = '&Fechar Janela'
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select P.Codigo, P.Codigo_Venda, P.Descricao, P.Valor_Compra, P.' +
        'Ultima_Compra, ITP.Preco_Vista, ITP.Preco_Prazo from Produto P'
      
        'left join Itens_Tabela_Preco ITP on (P.Codigo = ITP.Codigo_Produ' +
        'to)'
      'where P.Codigo_Grupo = '#39'2'#39)
    Left = 912
    Top = 8
    object ADOQuery1Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object ADOQuery1Codigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object ADOQuery1Descricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object ADOQuery1Valor_Compra: TFloatField
      FieldName = 'Valor_Compra'
      DisplayFormat = '#0.0,0'
    end
    object ADOQuery1Preco_Vista: TFloatField
      FieldName = 'Preco_Vista'
      DisplayFormat = '#0.0,0'
    end
    object ADOQuery1Preco_Prazo: TFloatField
      FieldName = 'Preco_Prazo'
      DisplayFormat = '#0.0,0'
    end
    object ADOQuery1Ultima_Compra: TDateTimeField
      FieldName = 'Ultima_Compra'
      OnGetText = ADOQuery1Ultima_CompraGetText
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 944
    Top = 8
  end
end
