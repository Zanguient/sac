object FrmRegra_PIS: TFrmRegra_PIS
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Regras de PIS'
  ClientHeight = 258
  ClientWidth = 686
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
  object LblCargo: TLabel
    Left = 272
    Top = 5
    Width = 29
    Height = 13
    Caption = 'Cargo'
  end
  object PageControl1: TPageControl
    Left = 125
    Top = 0
    Width = 561
    Height = 258
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    ExplicitHeight = 234
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      ExplicitHeight = 203
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
        Left = 176
        Top = 63
        Width = 47
        Height = 13
        Caption = 'Aliquota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 263
        Top = 121
        Width = 58
        Height = 13
        Caption = '% BC Red.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 431
        Top = 121
        Width = 55
        Height = 13
        Caption = '% BC Acr.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = -1
        Top = 164
        Width = 108
        Height = 13
        Caption = 'Situa'#231#227'o Tribut'#225'ria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 0
        Top = 63
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
      object Label84: TLabel
        Left = 231
        Top = 63
        Width = 70
        Height = 13
        Caption = 'Tipo de Calc.'
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
      object EdtAliquota: TEdit
        Left = 176
        Top = 78
        Width = 56
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 5
        TabOrder = 3
      end
      object RGTipo_Recolhimento: TRadioGroup
        Left = 0
        Top = 101
        Width = 153
        Height = 52
        Caption = 'Tipo de Recolhimento'
        ItemIndex = 0
        Items.Strings = (
          'Normal'
          'Substitui'#231#227'o Tribut'#225'ria')
        TabOrder = 4
      end
      object RGBase_Reduzida: TRadioGroup
        Left = 159
        Top = 101
        Width = 98
        Height = 52
        Caption = 'Base Reduzida'
        ItemIndex = 0
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 5
      end
      object EdtPercentual_Base_Calculo_Reduzida: TEdit
        Left = 263
        Top = 136
        Width = 56
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 5
        TabOrder = 6
      end
      object RGBase_Acrescida: TRadioGroup
        Left = 327
        Top = 101
        Width = 98
        Height = 52
        Caption = 'Base Acrescida'
        ItemIndex = 0
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 7
      end
      object EdtPercentual_Base_Calculo_Acrescida: TEdit
        Left = 431
        Top = 136
        Width = 56
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 5
        TabOrder = 8
      end
      object EdtCodigo_Situacao_Tributaria: TEdit
        Left = 0
        Top = 179
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
        TabOrder = 9
        OnDblClick = EdtCodigo_Situacao_TributariaDblClick
        OnKeyDown = EdtCodigo_Situacao_TributariaKeyDown
        OnKeyPress = EdtCodigo_Situacao_TributariaKeyPress
      end
      object EdtSituacao_Tributaria: TEdit
        Left = 60
        Top = 179
        Width = 408
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 10
        OnKeyPress = EdtSituacao_TributariaKeyPress
      end
      object EdtDescricao: TEdit
        Left = 0
        Top = 78
        Width = 177
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 2
      end
      object CBTipo_Calculo: TComboBox
        Left = 231
        Top = 78
        Width = 147
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 20
        TabOrder = 11
        Items.Strings = (
          'PERCENTUAL'
          'VALOR')
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 258
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
      ParentShowHint = False
      Wrap = True
      ShowHint = True
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
end
