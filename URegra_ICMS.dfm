object FrmRegra_ICMS: TFrmRegra_ICMS
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Regras de ICMS'
  ClientHeight = 236
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
    Height = 236
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
        Left = 160
        Top = 60
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
        Left = 315
        Top = 61
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
        Left = 471
        Top = 61
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
        Left = 101
        Top = 146
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
        Top = 60
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
      object Label21: TLabel
        Left = 101
        Top = 108
        Width = 122
        Height = 13
        Caption = 'Mod. de Det. BC. ICMS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 298
        Top = 108
        Width = 139
        Height = 13
        Caption = 'Mod. de Det. BC. ICMS ST'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label53: TLabel
        Left = 389
        Top = 146
        Width = 49
        Height = 13
        Caption = 'CFOP V.D'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label54: TLabel
        Left = 454
        Top = 145
        Width = 47
        Height = 13
        Caption = 'CFOP V.F'
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
        Left = 160
        Top = 75
        Width = 56
        Height = 17
        Hint = 'Se a al'#237'quota for ST, NT ou I, coloque o valor 0 (zero).'
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 5
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object RGTipo_Recolhimento: TRadioGroup
        Left = 0
        Top = 93
        Width = 95
        Height = 85
        Hint = 
          'Tipo de recolhimento do ICMS.'#13#10'Tributado ou Substitui'#231#227'o Tribut'#225 +
          'ria.'
        Caption = 'Tipo de Rec.'
        ItemIndex = 0
        Items.Strings = (
          'Tributado'
          'Subst. Trib.'
          'N. T.'
          'Isento')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = RGTipo_RecolhimentoClick
      end
      object RGBase_Reduzida: TRadioGroup
        Left = 222
        Top = 41
        Width = 88
        Height = 52
        Caption = 'Base Reduzida'
        ItemIndex = 0
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 4
      end
      object EdtPercentual_Base_Calculo_Reduzida: TEdit
        Left = 315
        Top = 76
        Width = 56
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 5
        TabOrder = 5
      end
      object RGBase_Acrescida: TRadioGroup
        Left = 379
        Top = 41
        Width = 88
        Height = 52
        Caption = 'Base Acrescida'
        ItemIndex = 0
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 6
      end
      object EdtPercentual_Base_Calculo_Acrescida: TEdit
        Left = 471
        Top = 76
        Width = 56
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 5
        TabOrder = 7
      end
      object EdtCodigo_Situacao_Tributaria: TEdit
        Left = 101
        Top = 161
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
        TabOrder = 11
        OnDblClick = EdtCodigo_Situacao_TributariaDblClick
        OnKeyDown = EdtCodigo_Situacao_TributariaKeyDown
        OnKeyPress = EdtCodigo_Situacao_TributariaKeyPress
      end
      object EdtSituacao_Tributaria: TEdit
        Left = 161
        Top = 161
        Width = 229
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = False
        TabOrder = 12
        OnKeyPress = EdtSituacao_TributariaKeyPress
      end
      object EdtDescricao: TEdit
        Left = 0
        Top = 75
        Width = 161
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 2
      end
      object CBModalidade_BC_ICMS: TComboBox
        Left = 101
        Top = 122
        Width = 191
        Height = 21
        TabOrder = 9
        Items.Strings = (
          'Margem Valor Agregado'
          'Paula (valor)'
          'Pre'#231'o Tabelado M'#225'x. (valor)'
          'Valor da Opera'#231#227'o')
      end
      object CBModalidade_BC_ICMS_ST: TComboBox
        Left = 298
        Top = 122
        Width = 170
        Height = 21
        TabOrder = 10
        Visible = False
        Items.Strings = (
          'Pre'#231'o Tabelado ou M'#225'ximo Sugerido'
          'Lista Negativa'
          'Lista Positiva'
          'Lista Neutra'
          'Margem Valor Agregado (%)'
          'Pauta(valor)')
      end
      object EdtCFOP_V_D: TEdit
        Left = 389
        Top = 161
        Width = 66
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 10
        TabOrder = 13
      end
      object EdtCFOP_V_F: TEdit
        Left = 454
        Top = 161
        Width = 66
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 10
        TabOrder = 14
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 236
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
    ShowHint = True
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
