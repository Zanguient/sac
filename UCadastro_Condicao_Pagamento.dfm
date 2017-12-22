object FrmCadastro_Condicao_Pagamento: TFrmCadastro_Condicao_Pagamento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Condi'#231#227'o de Pagamento'
  ClientHeight = 265
  ClientWidth = 598
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
    Width = 473
    Height = 265
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
      object LblParcelas: TLabel
        Left = 134
        Top = 59
        Width = 28
        Height = 13
        Caption = 'Parc.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblDias: TLabel
        Left = 184
        Top = 59
        Width = 32
        Height = 13
        Caption = 'Prazo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 232
        Top = 59
        Width = 28
        Height = 13
        Caption = 'Taxa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 288
        Top = 59
        Width = 64
        Height = 13
        Caption = #205'ndice Imp.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblCNPJ_Operadora: TLabel
        Left = 2
        Top = 150
        Width = 90
        Height = 13
        Caption = 'CNPJ Operadora'
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
        OnKeyPress = EdtCodigoKeyPress
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
        Width = 136
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 30
        TabOrder = 4
      end
      object EdtParcela: TEdit
        Left = 135
        Top = 74
        Width = 49
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BiDiMode = bdLeftToRight
        BorderStyle = bsNone
        ParentBiDiMode = False
        TabOrder = 5
        OnKeyPress = EdtParcelaKeyPress
      end
      object EdtPrazo: TEdit
        Left = 183
        Top = 74
        Width = 49
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 6
        OnKeyPress = EdtPrazoKeyPress
      end
      object EdtTaxa_Juros: TEdit
        Left = 231
        Top = 74
        Width = 57
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 7
        OnExit = EdtTaxa_JurosExit
        OnKeyPress = EdtTaxa_JurosKeyPress
      end
      object GroupBox4: TGroupBox
        Left = 2
        Top = 97
        Width = 138
        Height = 46
        Caption = 'Tipo Pagamento'
        TabOrder = 9
        object RBA_Vista: TRadioButton
          Left = 8
          Top = 19
          Width = 53
          Height = 17
          Caption = 'A Vista'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object RBA_PRazo: TRadioButton
          Left = 75
          Top = 19
          Width = 55
          Height = 17
          Caption = 'A Prazo'
          TabOrder = 1
        end
      end
      object RGTEF: TRadioGroup
        Left = 249
        Top = 97
        Width = 103
        Height = 46
        Caption = 'Usado no TEF?'
        ItemIndex = 1
        Items.Strings = (
          'Sim'
          'N'#227'o')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
      end
      object RGCheque: TRadioGroup
        Left = 369
        Top = 97
        Width = 96
        Height = 121
        Hint = 
          'Se a op'#231#227'o Tipo estiver marcado como Cart'#227'o Credito ou Cart'#227'o De' +
          'bito, a op'#231#227'o Usado no TEF? ser'#225' habilitada.'#13#10#13#10'Se a op'#231#227'o Usado' +
          ' no TEF? estiver configurada como Sim, indica que o sistema util' +
          'izar'#225' o TEF como forma de pagamento'#13#10'no cart'#227'o; se estiver confi' +
          'gurado como N'#227'o, indica que o sistema utilizar'#225' o POS como forma' +
          ' de pagamento no cart'#227'o.'#13#10'Al'#233'm disso, caso a forma de pagamento ' +
          'for configurada para cart'#227'o, '#233' obrigat'#243'rio informar o CNPJ da op' +
          'eradora do cart'#227'o.'
        Caption = 'Tipo'
        ItemIndex = 0
        Items.Strings = (
          'Dinheiro'
          'Cart'#227'o Credito'
          'Cart'#227'o Debito'
          'Cheque'
          'Credito Loja'
          'Outros')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnClick = RGChequeClick
      end
      object CBStatus: TCheckBox
        Left = 156
        Top = 36
        Width = 53
        Height = 17
        Caption = 'Ativo'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object CBPrograma: TCheckBox
        Left = 215
        Top = 36
        Width = 130
        Height = 17
        Caption = 'Programa Impressora'
        TabOrder = 3
      end
      object RGTipo_Juro: TRadioGroup
        Left = 146
        Top = 97
        Width = 97
        Height = 46
        Caption = 'Tipo Juro'
        ItemIndex = 0
        Items.Strings = (
          'Simples'
          'Composto')
        TabOrder = 12
      end
      object EdtIndice: TEdit
        Left = 287
        Top = 74
        Width = 57
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        MaxLength = 10
        TabOrder = 8
        OnKeyPress = EdtIndiceKeyPress
      end
      object EdtCNPJ_Operadora: TEdit
        Left = 2
        Top = 165
        Width = 136
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 15
        TabOrder = 13
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 265
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 121
    DoubleBuffered = False
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
    ParentDoubleBuffered = False
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
