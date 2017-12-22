object FrmTratamento_ICMS: TFrmTratamento_ICMS
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Tratamento do ICMS'
  ClientHeight = 440
  ClientWidth = 934
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
    Width = 809
    Height = 440
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
      object Label1: TLabel
        Left = 235
        Top = 59
        Width = 41
        Height = 13
        Caption = 'Origem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 289
        Top = 59
        Width = 43
        Height = 13
        Caption = 'Destino'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
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
      object CmbOrigem: TComboBox
        Left = 235
        Top = 74
        Width = 48
        Height = 21
        BevelInner = bvNone
        BevelKind = bkFlat
        CharCase = ecUpperCase
        MaxLength = 2
        TabOrder = 3
        Items.Strings = (
          'AC'
          'AL'
          'AP'
          'AM'
          'BA'
          'CE'
          'DF'
          'GO'
          'ES'
          'MA'
          'MT'
          'MS'
          'MG'
          'PA'
          'PB'
          'PR'
          'PE'
          'PI'
          'RJ'
          'RN'
          'RS'
          'RO'
          'RR'
          'SP'
          'SC'
          'SE'
          'TO')
      end
      object CmbDestino: TComboBox
        Left = 289
        Top = 74
        Width = 48
        Height = 21
        BevelInner = bvNone
        BevelKind = bkFlat
        CharCase = ecUpperCase
        MaxLength = 2
        TabOrder = 4
        OnClick = CmbDestinoClick
        Items.Strings = (
          'AC'
          'AL'
          'AP'
          'AM'
          'BA'
          'CE'
          'DF'
          'GO'
          'ES'
          'MA'
          'MT'
          'MS'
          'MG'
          'PA'
          'PB'
          'PR'
          'PE'
          'PI'
          'RJ'
          'RN'
          'RS'
          'RO'
          'RR'
          'SP'
          'SC'
          'SE'
          'TO')
      end
      object EdtDescricao: TEdit
        Left = 0
        Top = 78
        Width = 233
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 2
      end
      object PageControl2: TPageControl
        Left = 0
        Top = 101
        Width = 790
        Height = 305
        Cursor = crHandPoint
        ActivePage = TabSheet3
        Style = tsFlatButtons
        TabOrder = 5
        object TabSheet2: TTabSheet
          Caption = 'Entradas'
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 521
            Height = 91
            Caption = 'Regra ICMS para E.N'
            TabOrder = 0
            object Label3: TLabel
              Left = 16
              Top = 24
              Width = 34
              Height = 13
              Caption = 'Regra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object EdtRegra_ICMS_EN_Entrada: TEdit
              Left = 76
              Top = 39
              Width = 421
              Height = 17
              BevelEdges = [beTop, beRight, beBottom]
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              ParentShowHint = False
              ShowHint = False
              TabOrder = 1
              OnKeyPress = EdtRegra_ICMS_EN_EntradaKeyPress
            end
            object EdtCodigo_Regra_ICMS_EN_Entrada: TEdit
              Left = 16
              Top = 39
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
              OnDblClick = EdtCodigo_Regra_ICMS_EN_EntradaDblClick
              OnKeyDown = EdtCodigo_Regra_ICMS_EN_EntradaKeyDown
              OnKeyPress = EdtCodigo_Regra_ICMS_EN_EntradaKeyPress
            end
          end
          object GroupBox2: TGroupBox
            Left = 0
            Top = 91
            Width = 521
            Height = 91
            Caption = 'Regra ICMS para EPP'
            TabOrder = 1
            object Label4: TLabel
              Left = 16
              Top = 19
              Width = 34
              Height = 13
              Caption = 'Regra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object EdtRegra_ICMS_EPP_Entrada: TEdit
              Left = 76
              Top = 35
              Width = 421
              Height = 17
              BevelEdges = [beTop, beRight, beBottom]
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              ParentShowHint = False
              ShowHint = False
              TabOrder = 1
              OnKeyPress = EdtRegra_ICMS_EPP_EntradaKeyPress
            end
            object EdtCodigo_Regra_ICMS_EPP_Entrada: TEdit
              Left = 16
              Top = 35
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
              OnDblClick = EdtCodigo_Regra_ICMS_EPP_EntradaDblClick
              OnKeyDown = EdtCodigo_Regra_ICMS_EPP_EntradaKeyDown
              OnKeyPress = EdtCodigo_Regra_ICMS_EPP_EntradaKeyPress
            end
          end
          object GroupBox3: TGroupBox
            Left = 0
            Top = 184
            Width = 521
            Height = 91
            Caption = 'Regra ICMS para M.E'
            TabOrder = 2
            object Label5: TLabel
              Left = 16
              Top = 22
              Width = 34
              Height = 13
              Caption = 'Regra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object EdtRegra_ICMS_ME_Entrada: TEdit
              Left = 76
              Top = 37
              Width = 421
              Height = 17
              BevelEdges = [beTop, beRight, beBottom]
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              ParentShowHint = False
              ShowHint = False
              TabOrder = 1
              OnKeyPress = EdtRegra_ICMS_ME_EntradaKeyPress
            end
            object EdtCodigo_Regra_ICMS_ME_Entrada: TEdit
              Left = 16
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
              OnDblClick = EdtCodigo_Regra_ICMS_ME_EntradaDblClick
              OnKeyDown = EdtCodigo_Regra_ICMS_ME_EntradaKeyDown
              OnKeyPress = EdtCodigo_Regra_ICMS_ME_EntradaKeyPress
            end
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'Contribuintes'
          ImageIndex = 1
          object GroupBox4: TGroupBox
            Left = 0
            Top = 0
            Width = 521
            Height = 91
            Caption = 'Regra ICMS para E.N'
            TabOrder = 0
            object Label6: TLabel
              Left = 16
              Top = 24
              Width = 34
              Height = 13
              Caption = 'Regra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object EdtCodigo_Regra_ICMS_EN_Saida: TEdit
              Left = 16
              Top = 39
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
              OnDblClick = EdtCodigo_Regra_ICMS_EN_SaidaDblClick
              OnKeyDown = EdtCodigo_Regra_ICMS_EN_SaidaKeyDown
              OnKeyPress = EdtCodigo_Regra_ICMS_EN_SaidaKeyPress
            end
            object EdtRegra_ICMS_EN_Saida: TEdit
              Left = 76
              Top = 39
              Width = 421
              Height = 17
              BevelEdges = [beTop, beRight, beBottom]
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              ParentShowHint = False
              ShowHint = False
              TabOrder = 1
              OnKeyPress = EdtRegra_ICMS_EN_SaidaKeyPress
            end
          end
          object GroupBox5: TGroupBox
            Left = 0
            Top = 91
            Width = 521
            Height = 91
            Caption = 'Regra ICMS para EPP'
            TabOrder = 1
            object Label7: TLabel
              Left = 16
              Top = 20
              Width = 34
              Height = 13
              Caption = 'Regra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object EdtCodigo_Regra_ICMS_EPP_Saida: TEdit
              Left = 16
              Top = 35
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
              OnDblClick = EdtCodigo_Regra_ICMS_EPP_SaidaDblClick
              OnKeyDown = EdtCodigo_Regra_ICMS_EPP_SaidaKeyDown
              OnKeyPress = EdtCodigo_Regra_ICMS_EPP_SaidaKeyPress
            end
            object EdtRegra_ICMS_EPP_Saida: TEdit
              Left = 76
              Top = 35
              Width = 421
              Height = 17
              BevelEdges = [beTop, beRight, beBottom]
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              ParentShowHint = False
              ShowHint = False
              TabOrder = 1
              OnKeyPress = EdtRegra_ICMS_EPP_SaidaKeyPress
            end
          end
          object GroupBox6: TGroupBox
            Left = 0
            Top = 184
            Width = 521
            Height = 91
            Caption = 'Regra ICMS para M.E'
            TabOrder = 2
            object Label8: TLabel
              Left = 16
              Top = 22
              Width = 34
              Height = 13
              Caption = 'Regra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object EdtCodigo_Regra_ICMS_ME_Saida: TEdit
              Left = 16
              Top = 38
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
              OnDblClick = EdtCodigo_Regra_ICMS_ME_SaidaDblClick
              OnKeyDown = EdtCodigo_Regra_ICMS_ME_SaidaKeyDown
              OnKeyPress = EdtCodigo_Regra_ICMS_ME_SaidaKeyPress
            end
            object EdtRegra_ICMS_ME_Saida: TEdit
              Left = 76
              Top = 38
              Width = 421
              Height = 17
              BevelEdges = [beTop, beRight, beBottom]
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              ParentShowHint = False
              ShowHint = False
              TabOrder = 1
              OnKeyPress = EdtRegra_ICMS_ME_SaidaKeyPress
            end
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'N'#227'o Contribuintes'
          ImageIndex = 2
          object GroupBox7: TGroupBox
            Left = 0
            Top = 0
            Width = 521
            Height = 91
            Caption = 'N'#227'o Contribuintes'
            TabOrder = 0
            object Label10: TLabel
              Left = 16
              Top = 24
              Width = 34
              Height = 13
              Caption = 'Regra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object EdtCodigo_Regra_ICMS_Nao_Contribuinte: TEdit
              Left = 16
              Top = 39
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
              OnDblClick = EdtCodigo_Regra_ICMS_Nao_ContribuinteDblClick
              OnKeyDown = EdtCodigo_Regra_ICMS_Nao_ContribuinteKeyDown
              OnKeyPress = EdtCodigo_Regra_ICMS_Nao_ContribuinteKeyPress
            end
            object EdtRegra_ICMS_Nao_Contribuinte: TEdit
              Left = 76
              Top = 39
              Width = 421
              Height = 17
              BevelEdges = [beTop, beRight, beBottom]
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              ParentShowHint = False
              ShowHint = False
              TabOrder = 1
              OnKeyPress = EdtRegra_ICMS_Nao_ContribuinteKeyPress
            end
          end
        end
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 440
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
    object BBtnSalvar_Itens: TToolButton
      Left = 0
      Top = 76
      Cursor = crHandPoint
      Hint = 'Clique para salvar um item configurado.'
      Caption = '&Salvar Itens'
      Enabled = False
      ImageIndex = 1
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnSalvar_ItensClick
    end
    object BBtnExcluir: TToolButton
      Left = 0
      Top = 114
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
    object BBtnExcluir_Item: TToolButton
      Left = 0
      Top = 152
      Cursor = crHandPoint
      Hint = 'Clique para excluir um item selecionado.'
      Caption = 'E&xcluir Item'
      Enabled = False
      ImageIndex = 2
      Wrap = True
      OnClick = BBtnExcluir_ItemClick
    end
    object BBtnPesquisar: TToolButton
      Left = 0
      Top = 190
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
      Top = 228
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
      Top = 266
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
      
        'select ITI.*, RI1.Descricao, RI2.Descricao, RI3.Descricao, RI4.D' +
        'escricao, RI5.Descricao, RI6.Descricao, RI7.Descricao from Trata' +
        'mento_ICMS TI'
      'inner join Itens_Tratamento_ICMS ITI on (TI.Codigo = ITI.Codigo)'
      'inner join Regra_ICMS RI1 on (ITI.Entrada_Regra_EN = RI1.Codigo)'
      
        'inner join Regra_ICMS RI2 on (ITI.Entrada_Regra_EPP = RI2.Codigo' +
        ')'
      'inner join Regra_ICMS RI3 on (ITI.Entrada_Regra_ME = RI3.Codigo)'
      'inner join Regra_ICMS RI4 on (ITI.Saida_Regra_EN = RI4.Codigo)'
      'inner join Regra_ICMS RI5 on (ITI.Saida_Regra_EPP = RI5.Codigo)'
      'inner join Regra_ICMS RI6 on (ITI.Saida_Regra_ME = RI6.Codigo)'
      
        'inner join Regra_ICMS RI7 on (ITI.Regra_Nao_Contribuinte = RI7.C' +
        'odigo) ')
    Left = 528
    Top = 56
    object ADOQuery1Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object ADOQuery1Origem: TStringField
      FieldName = 'Origem'
      Size = 2
    end
    object ADOQuery1Destino: TStringField
      FieldName = 'Destino'
      Size = 2
    end
    object ADOQuery1Entrada_Regra_EN: TIntegerField
      FieldName = 'Entrada_Regra_EN'
    end
    object ADOQuery1Entrada_Regra_EPP: TIntegerField
      FieldName = 'Entrada_Regra_EPP'
    end
    object ADOQuery1Entrada_Regra_ME: TIntegerField
      FieldName = 'Entrada_Regra_ME'
    end
    object ADOQuery1Saida_Regra_EN: TIntegerField
      FieldName = 'Saida_Regra_EN'
    end
    object ADOQuery1Saida_Regra_EPP: TIntegerField
      FieldName = 'Saida_Regra_EPP'
    end
    object ADOQuery1Saida_Regra_ME: TIntegerField
      FieldName = 'Saida_Regra_ME'
    end
    object ADOQuery1Regra_Nao_Contribuinte: TIntegerField
      FieldName = 'Regra_Nao_Contribuinte'
    end
    object ADOQuery1Descricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object ADOQuery1Descricao_1: TStringField
      FieldName = 'Descricao_1'
      Size = 50
    end
    object ADOQuery1Descricao_2: TStringField
      FieldName = 'Descricao_2'
      Size = 50
    end
    object ADOQuery1Descricao_3: TStringField
      FieldName = 'Descricao_3'
      Size = 50
    end
    object ADOQuery1Descricao_4: TStringField
      FieldName = 'Descricao_4'
      Size = 50
    end
    object ADOQuery1Descricao_5: TStringField
      FieldName = 'Descricao_5'
      Size = 50
    end
    object ADOQuery1Descricao_6: TStringField
      FieldName = 'Descricao_6'
      Size = 50
    end
  end
end
