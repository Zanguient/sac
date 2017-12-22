object FrmCadastro_Marca: TFrmCadastro_Marca
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Marcas'
  ClientHeight = 401
  ClientWidth = 919
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
    Width = 794
    Height = 401
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
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Text = '  /  /    '
        OnEnter = MEdtData_CadastroEnter
        OnExit = MEdtData_CadastroExit
      end
      object EdtDescricao: TEdit
        Left = 0
        Top = 74
        Width = 241
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 30
        TabOrder = 2
      end
      object GroupBox1: TGroupBox
        Left = 296
        Top = 0
        Width = 490
        Height = 370
        Caption = 'Produtos'
        TabOrder = 4
        object DBGrid1: TDBGrid
          Left = 7
          Top = 32
          Width = 474
          Height = 328
          BorderStyle = bsNone
          DataSource = DataSource1
          DrawingStyle = gdsGradient
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'Codigo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Codigo_Venda'
              Title.Caption = 'C'#243'd. Venda'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Codigo_Original'
              Title.Caption = 'C'#243'd. Original'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Codigo_Similar'
              Title.Caption = 'C'#243'd. Similar'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Descricao'
              Title.Caption = 'Descri'#231#227'o'
              Width = 182
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
            end>
        end
        object EdtConsulta: TEdit
          Left = 7
          Top = 16
          Width = 474
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 1
          OnChange = EdtConsultaChange
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 148
        Width = 293
        Height = 91
        Caption = 'Transfer'#234'ncia para esta marca'
        TabOrder = 3
        object Label7: TLabel
          Left = 7
          Top = 21
          Width = 81
          Height = 13
          Caption = 'Marca Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdtCodigo_Marca_Destino: TEdit
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
          OnKeyDown = EdtCodigo_Marca_DestinoKeyDown
          OnKeyPress = EdtCodigo_Marca_DestinoKeyPress
        end
        object EdtMarca_Destino: TEdit
          Left = 67
          Top = 37
          Width = 214
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
          OnKeyPress = EdtMarca_DestinoKeyPress
        end
        object BtnTransferir: TButton
          Left = 214
          Top = 61
          Width = 75
          Height = 25
          Caption = 'Transferir'
          TabOrder = 2
          OnClick = BtnTransferirClick
        end
      end
      object RGTipo_Calculo: TRadioGroup
        Left = 92
        Top = 248
        Width = 115
        Height = 57
        Caption = 'Tipo de Calc.'
        ItemIndex = 0
        Items.Strings = (
          'Margem Bruta'
          'Margem L'#237'quida')
        TabOrder = 5
        Visible = False
      end
      object CBAtualiza_Preco: TCheckBox
        Left = 0
        Top = 251
        Width = 90
        Height = 17
        Caption = 'Atualiza Pre'#231'o'
        TabOrder = 6
        OnClick = CBAtualiza_PrecoClick
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 97
        Width = 121
        Height = 49
        Caption = 'Valor de Venda'
        TabOrder = 7
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
        end
      end
      object GroupBox4: TGroupBox
        Left = 127
        Top = 97
        Width = 114
        Height = 49
        Caption = 'Descontos'
        TabOrder = 8
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
        end
      end
      object RGAumentar: TRadioGroup
        Left = 92
        Top = 307
        Width = 115
        Height = 56
        Caption = 'Aumentar em'
        ItemIndex = 0
        Items.Strings = (
          'Valor Compra'
          'Valor Venda')
        TabOrder = 9
        Visible = False
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 401
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
    object BbtnNovo: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Caption = '&Novo'
      ImageIndex = 0
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BbtnNovoClick
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
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 544
    Top = 112
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select P.Codigo, P.Codigo_Original, P.Codigo_Similar, P.Codigo_V' +
        'enda, P.Descricao, P.Valor_Compra, ITP.Preco_Vista, ITP.Preco_Pr' +
        'azo from Produto P'
      
        'left join Itens_Tabela_Preco ITP on (P.Codigo = ITP.Codigo_Produ' +
        'to)'
      'where P.Codigo_Marca = '#39'2'#39)
    Left = 584
    Top = 112
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
    object ADOQuery1Codigo_Original: TStringField
      FieldName = 'Codigo_Original'
    end
    object ADOQuery1Codigo_Similar: TStringField
      FieldName = 'Codigo_Similar'
    end
    object ADOQuery1Preco_Vista: TFloatField
      FieldName = 'Preco_Vista'
      DisplayFormat = '#0.0,0'
    end
    object ADOQuery1Preco_Prazo: TFloatField
      FieldName = 'Preco_Prazo'
      DisplayFormat = '#0.0,0'
    end
  end
end
