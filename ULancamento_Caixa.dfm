object FrmLancamento_Caixa: TFrmLancamento_Caixa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Lan'#231'amentos no Caixa'
  ClientHeight = 259
  ClientWidth = 590
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
  object lbl1: TLabel
    Left = 96
    Top = 17
    Width = 60
    Height = 13
    Caption = 'Atendente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PageControl1: TPageControl
    Left = 125
    Top = 0
    Width = 465
    Height = 259
    ActivePage = TabSheet1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object Label8: TLabel
        Left = 55
        Top = 0
        Width = 70
        Height = 13
        Caption = 'Lan'#231'amento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 0
        Top = 76
        Width = 29
        Height = 13
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 0
        Top = 40
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
      object LblCodigo: TLabel
        Left = 0
        Top = 0
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
      object lbl2: TLabel
        Left = 65
        Top = 76
        Width = 60
        Height = 13
        Caption = 'Atendente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object MEdtData_Lancamento: TMaskEdit
        Left = 55
        Top = 19
        Width = 80
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
        TabOrder = 1
        Text = '  /  /    '
        OnEnter = MEdtData_LancamentoEnter
        OnExit = MEdtData_LancamentoExit
      end
      object EdtValor: TEdit
        Left = 0
        Top = 91
        Width = 64
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Text = '0,00'
        OnExit = EdtValorExit
        OnKeyPress = EdtValorKeyPress
      end
      object EdtDescricao: TEdit
        Left = 0
        Top = 55
        Width = 245
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 4
      end
      object RGTipoMovimento: TRadioGroup
        Left = 160
        Top = 3
        Width = 85
        Height = 46
        Caption = 'Tipo'
        ItemIndex = 1
        Items.Strings = (
          'Cr'#233'dito'
          'D'#233'bito')
        TabOrder = 2
      end
      object GBOutra_Conta: TGroupBox
        Left = 2
        Top = 227
        Width = 389
        Height = 75
        Caption = 'Transfer'#234'ncia para esta conta'
        TabOrder = 10
        object Label4: TLabel
          Left = 9
          Top = 18
          Width = 33
          Height = 13
          Caption = 'Conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdtConta_Destino: TEdit
          Left = 62
          Top = 35
          Width = 76
          Height = 17
          TabStop = False
          BevelEdges = [beTop, beRight, beBottom]
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
        end
        object EdtCodigo_Conta_Destino: TEdit
          Left = 9
          Top = 35
          Width = 53
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
          TabOrder = 1
        end
      end
      object RGCondPag: TRadioGroup
        Left = 251
        Top = 3
        Width = 85
        Height = 59
        Caption = 'Cond. Pag.'
        ItemIndex = 0
        Items.Strings = (
          'Dinheiro'
          'Cheque'
          'Cart'#227'o')
        TabOrder = 3
      end
      object CBTransferencia: TCheckBox
        Left = 251
        Top = 68
        Width = 97
        Height = 17
        Hint = 
          'Se marcar a op'#231#227'o transfer'#234'ncia, o status do lan'#231'amento ser'#225' aut' +
          'omaticamente informado como Liberado'
        Caption = 'Transfer'#234'ncia'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = CBTransferenciaClick
      end
      object GBTransferencia: TGroupBox
        Left = 65
        Top = 118
        Width = 391
        Height = 109
        Caption = 'Movimenta'#231#227'o banc'#225'ria para esta conta'
        TabOrder = 9
        Visible = False
        object Label1: TLabel
          Left = 9
          Top = 14
          Width = 33
          Height = 13
          Caption = 'Conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 129
          Top = 14
          Width = 54
          Height = 13
          Caption = 'Opera'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 9
          Top = 52
          Width = 92
          Height = 13
          Caption = 'Plano Financeiro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdtConta: TEdit
          Left = 62
          Top = 31
          Width = 68
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
          OnKeyPress = EdtContaKeyPress
        end
        object EdtCodigo_Conta: TEdit
          Left = 9
          Top = 31
          Width = 53
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
          OnKeyDown = EdtCodigo_ContaKeyDown
          OnKeyPress = EdtCodigo_ContaKeyPress
        end
        object EdtCodigo_Operacao: TEdit
          Left = 129
          Top = 31
          Width = 53
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
          OnKeyDown = EdtCodigo_OperacaoKeyDown
          OnKeyPress = EdtCodigo_OperacaoKeyPress
        end
        object EdtOperacao_Bancaria: TEdit
          Left = 182
          Top = 31
          Width = 132
          Height = 17
          TabStop = False
          BevelEdges = [beTop, beBottom]
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          OnKeyPress = EdtOperacao_BancariaKeyPress
        end
        object EdtTipo_Operacao: TEdit
          Left = 314
          Top = 31
          Width = 57
          Height = 17
          TabStop = False
          BevelEdges = [beTop, beRight, beBottom]
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          ReadOnly = True
          TabOrder = 4
          OnKeyPress = EdtTipo_OperacaoKeyPress
        end
        object EdtPlano: TEdit
          Left = 62
          Top = 69
          Width = 309
          Height = 17
          TabStop = False
          BevelEdges = [beTop, beRight, beBottom]
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          ParentShowHint = False
          ShowHint = False
          TabOrder = 6
          OnKeyPress = EdtContaKeyPress
        end
        object EdtCodigo_Plano: TEdit
          Left = 9
          Top = 69
          Width = 53
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
          TabOrder = 5
          OnKeyDown = EdtCodigo_PlanoKeyDown
          OnKeyPress = EdtCodigo_PlanoKeyPress
        end
        object EdtCodigo_Lancamento_Banco: TEdit
          Left = 9
          Top = 94
          Width = 53
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 7
          Visible = False
        end
      end
      object EdtCodigo: TEdit
        Left = 0
        Top = 19
        Width = 56
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
      object txtEdtCodigo_Atendente: TEdit
        Left = 63
        Top = 91
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
        TabOrder = 6
        OnDblClick = txtEdtCodigo_AtendenteDblClick
        OnKeyDown = txtEdtCodigo_AtendenteKeyDown
      end
      object txtEdtAtendente: TEdit
        Left = 125
        Top = 91
        Width = 140
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 259
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
end
