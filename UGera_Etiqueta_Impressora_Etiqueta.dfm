object FrmGera_Etiqueta_Impressora_Etiqueta: TFrmGera_Etiqueta_Impressora_Etiqueta
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gerar etiquetas com impressora de etiquetas'
  ClientHeight = 436
  ClientWidth = 624
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
  object Label5: TLabel
    Left = 132
    Top = 65
    Width = 45
    Height = 13
    Caption = 'Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 416
    Top = 65
    Width = 62
    Height = 13
    Caption = 'C'#243'd. Venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 504
    Top = 65
    Width = 76
    Height = 13
    Caption = 'Pre'#231'o de Tab.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 382
    Top = 205
    Width = 37
    Height = 13
    Caption = 'C'#243'pias'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 375
    Top = 65
    Width = 18
    Height = 13
    Caption = 'Un.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 453
    Top = 205
    Width = 44
    Height = 13
    Caption = 'Colunas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label13: TLabel
    Left = 524
    Top = 205
    Width = 36
    Height = 13
    Caption = 'Linhas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 382
    Top = 240
    Width = 20
    Height = 13
    Caption = '+ H'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 453
    Top = 240
    Width = 19
    Height = 13
    Caption = '+ V'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label14: TLabel
    Left = 132
    Top = 6
    Width = 47
    Height = 13
    Caption = 'Etiqueta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 436
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 121
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
    TabOrder = 10
    object BBtnSalvar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Clique para enviar a etiqueta para a impressora'
      Caption = '&Confirma'
      ImageIndex = 1
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnSalvarClick
    end
    object BBtnFechar: TToolButton
      Left = 0
      Top = 38
      Cursor = crHandPoint
      Hint = 'Clique para Fechar a Janela Ativa'
      Caption = '&Fechar Janela'
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object EdtCodigo_Produto: TEdit
    Left = 132
    Top = 80
    Width = 57
    Height = 17
    Hint = 'Pressione F3 para consultar'
    BevelEdges = [beLeft, beTop, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clMenu
    MaxLength = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnKeyDown = EdtCodigo_ProdutoKeyDown
  end
  object EdtProduto: TEdit
    Left = 189
    Top = 80
    Width = 187
    Height = 17
    TabStop = False
    BevelEdges = [beTop, beRight, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 1
  end
  object EdtCodigo_Venda: TEdit
    Left = 416
    Top = 80
    Width = 89
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 3
  end
  object EdtPreco: TEdit
    Left = 504
    Top = 80
    Width = 73
    Height = 17
    Hint = 
      'Pre'#231'o de venda na tabela de pre'#231'o. '#13#10'Em casos de produtos vendid' +
      'os por peso, considere o pre'#231'o do kilo. '#13#10'O sistema pegar'#225' esse ' +
      'campo APENAS para informar o pre'#231'o por unidade de medida.'
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnKeyPress = EdtPrecoKeyPress
  end
  object GroupBox7: TGroupBox
    Left = 382
    Top = 103
    Width = 238
    Height = 104
    Caption = 'Impress'#227'o da barra na etiqueta'
    TabOrder = 5
    object Label24: TLabel
      Left = 8
      Top = 19
      Width = 58
      Height = 13
      Caption = 'Tipo Barra'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label27: TLabel
      Left = 8
      Top = 57
      Width = 32
      Height = 13
      Caption = 'Horiz.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label28: TLabel
      Left = 72
      Top = 57
      Width = 27
      Height = 13
      Caption = 'Vert.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label23: TLabel
      Left = 72
      Top = 19
      Width = 66
      Height = 13
      Caption = 'Barra Larga'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label29: TLabel
      Left = 140
      Top = 19
      Width = 57
      Height = 13
      Caption = 'Barra Fina'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label25: TLabel
      Left = 140
      Top = 57
      Width = 46
      Height = 13
      Caption = 'Alt. C'#243'd.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtTipo_Barra: TEdit
      Left = 8
      Top = 35
      Width = 65
      Height = 17
      Hint = 'Dados para formatar o tamanho e posi'#231#227'o do c'#243'digo de barra.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object EdtHorizontal_Barra: TEdit
      Left = 8
      Top = 73
      Width = 65
      Height = 17
      Hint = 'Dados para formatar o tamanho e posi'#231#227'o do c'#243'digo de barra.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnKeyPress = EdtHorizontal_BarraKeyPress
    end
    object EdtVertical_Barra: TEdit
      Left = 72
      Top = 73
      Width = 69
      Height = 17
      Hint = 'Dados para formatar o tamanho e posi'#231#227'o do c'#243'digo de barra.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnKeyPress = EdtVertical_BarraKeyPress
    end
    object EdtLargura_Barra_Larga: TEdit
      Left = 72
      Top = 35
      Width = 69
      Height = 17
      Hint = 'Dados para formatar o tamanho e posi'#231#227'o do c'#243'digo de barra.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnKeyPress = EdtLargura_Barra_LargaKeyPress
    end
    object EdtLargura_Barra_Fina: TEdit
      Left = 140
      Top = 35
      Width = 69
      Height = 17
      Hint = 'Dados para formatar o tamanho e posi'#231#227'o do c'#243'digo de barra.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnKeyPress = EdtLargura_Barra_FinaKeyPress
    end
    object EdtAltura_Codigo: TEdit
      Left = 140
      Top = 73
      Width = 69
      Height = 17
      Hint = 'Dados para formatar o tamanho e posi'#231#227'o do c'#243'digo de barra.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnKeyPress = EdtAltura_CodigoKeyPress
    end
  end
  object EdtCopias: TEdit
    Left = 382
    Top = 221
    Width = 65
    Height = 17
    Hint = 'Quantidade de c'#243'pias do mesmo produto.'
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnKeyPress = EdtCopiasKeyPress
  end
  object EdtUnidade: TEdit
    Left = 375
    Top = 80
    Width = 42
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 132
    Top = 368
    Width = 290
    Height = 61
    Caption = 'Produtos vendidos por peso'
    TabOrder = 6
    object Label4: TLabel
      Left = 72
      Top = 19
      Width = 70
      Height = 13
      Caption = 'Pre'#231'o Venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 146
      Top = 19
      Width = 56
      Height = 13
      Caption = 'Un. Venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 210
      Top = 19
      Width = 48
      Height = 13
      Caption = 'Validade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 8
      Top = 19
      Width = 30
      Height = 13
      Caption = 'Qtde.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtPreco_Venda: TEdit
      Left = 72
      Top = 36
      Width = 75
      Height = 17
      Hint = 
        'Pre'#231'o final do produto. '#13#10'Independente se o produto for vendido ' +
        'por peso ou n'#227'o, o sistema pegar'#225' esse valor para imprimir o pre' +
        #231'o final do produto na etiqueta.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnKeyPress = EdtPreco_VendaKeyPress
    end
    object EdtUnidade_Venda: TEdit
      Left = 146
      Top = 36
      Width = 65
      Height = 17
      Hint = 'Unidade em que '#233' vendido o kilo do produto.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      MaxLength = 3
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object MEdtData_Validade: TMaskEdit
      Left = 210
      Top = 36
      Width = 68
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
    object EdtQuantidade: TEdit
      Left = 8
      Top = 36
      Width = 65
      Height = 17
      Hint = 
        'Peso do produto. Caso o produto N'#195'O for vendido por peso, DEIXE ' +
        'EM BRANCO.'#13#10#13#10'Caso queira ler o peso direto da balan'#231'a, pression' +
        'e F5.'#13#10'Obs.: nesse instante, a balan'#231'a j'#225' deve estar configurada' +
        ' no sistema.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = EdtQuantidadeExit
      OnKeyDown = EdtQuantidadeKeyDown
      OnKeyPress = EdtQuantidadeKeyPress
    end
  end
  object EdtColunas: TEdit
    Left = 453
    Top = 221
    Width = 65
    Height = 17
    Hint = 'Quantidade de c'#243'pias do mesmo produto.'
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnKeyPress = EdtCopiasKeyPress
  end
  object EdtLinhas: TEdit
    Left = 524
    Top = 221
    Width = 65
    Height = 17
    Hint = 'Quantidade de c'#243'pias do mesmo produto.'
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnKeyPress = EdtCopiasKeyPress
  end
  object GroupBox6: TGroupBox
    Left = 132
    Top = 103
    Width = 244
    Height = 261
    Caption = 'Impress'#227'o do texto na etiqueta'
    TabOrder = 11
    object Label17: TLabel
      Left = 8
      Top = 14
      Width = 62
      Height = 13
      Caption = 'Orienta'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 184
      Top = 54
      Width = 32
      Height = 13
      Caption = 'Fonte'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 8
      Top = 54
      Width = 39
      Height = 13
      Caption = 'Mult. H'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 52
      Top = 54
      Width = 41
      Height = 13
      Caption = 'Mult. V.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label21: TLabel
      Left = 96
      Top = 54
      Width = 32
      Height = 13
      Caption = 'Horiz.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 140
      Top = 54
      Width = 27
      Height = 13
      Caption = 'Vert.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label26: TLabel
      Left = 8
      Top = 92
      Width = 39
      Height = 13
      Caption = 'Mult. H'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label30: TLabel
      Left = 52
      Top = 92
      Width = 41
      Height = 13
      Caption = 'Mult. V.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label31: TLabel
      Left = 96
      Top = 92
      Width = 32
      Height = 13
      Caption = 'Horiz.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label32: TLabel
      Left = 140
      Top = 92
      Width = 27
      Height = 13
      Caption = 'Vert.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label33: TLabel
      Left = 184
      Top = 92
      Width = 32
      Height = 13
      Caption = 'Fonte'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label57: TLabel
      Left = 8
      Top = 131
      Width = 39
      Height = 13
      Caption = 'Mult. H'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label58: TLabel
      Left = 52
      Top = 131
      Width = 41
      Height = 13
      Caption = 'Mult. V.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label59: TLabel
      Left = 96
      Top = 131
      Width = 32
      Height = 13
      Caption = 'Horiz.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label60: TLabel
      Left = 140
      Top = 131
      Width = 27
      Height = 13
      Caption = 'Vert.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label61: TLabel
      Left = 184
      Top = 131
      Width = 32
      Height = 13
      Caption = 'Fonte'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label62: TLabel
      Left = 184
      Top = 172
      Width = 32
      Height = 13
      Caption = 'Fonte'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label63: TLabel
      Left = 140
      Top = 172
      Width = 27
      Height = 13
      Caption = 'Vert.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label64: TLabel
      Left = 96
      Top = 172
      Width = 32
      Height = 13
      Caption = 'Horiz.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label65: TLabel
      Left = 52
      Top = 172
      Width = 41
      Height = 13
      Caption = 'Mult. V.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label66: TLabel
      Left = 8
      Top = 172
      Width = 39
      Height = 13
      Caption = 'Mult. H'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label67: TLabel
      Left = 184
      Top = 214
      Width = 32
      Height = 13
      Caption = 'Fonte'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label68: TLabel
      Left = 140
      Top = 214
      Width = 27
      Height = 13
      Caption = 'Vert.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label69: TLabel
      Left = 96
      Top = 214
      Width = 32
      Height = 13
      Caption = 'Horiz.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label70: TLabel
      Left = 52
      Top = 214
      Width = 41
      Height = 13
      Caption = 'Mult. V.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label71: TLabel
      Left = 8
      Top = 214
      Width = 39
      Height = 13
      Caption = 'Mult. H'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CBOrientacao: TComboBox
      Left = 8
      Top = 30
      Width = 84
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        'Normal'
        '270'
        '180'
        '90')
    end
    object EdtTamanho_Fonte_Etiqueta_Campo_1: TEdit
      Left = 184
      Top = 70
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto do nome do produto.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtMultiplicador_H_Campo_1: TEdit
      Left = 8
      Top = 70
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto do nome do produto.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtMultiplicador_V_Campo_1: TEdit
      Left = 52
      Top = 70
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto do nome do produto.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtHorizontal_Texto_Campo_1: TEdit
      Left = 96
      Top = 70
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto do nome do produto.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtVertical_Texto_Campo_1: TEdit
      Left = 140
      Top = 70
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto do nome do produto.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtMultiplicador_H_Campo_2: TEdit
      Left = 8
      Top = 108
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto do pre'#231'o por unidade.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtMultiplicador_V_Campo_2: TEdit
      Left = 52
      Top = 108
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto do pre'#231'o por unidade.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtHorizontal_Texto_Campo_2: TEdit
      Left = 96
      Top = 108
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto do pre'#231'o por unidade.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtVertical_Texto_Campo_2: TEdit
      Left = 140
      Top = 108
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto do pre'#231'o por unidade.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtTamanho_Fonte_Etiqueta_Campo_2: TEdit
      Left = 184
      Top = 108
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto do pre'#231'o por unidade.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtMultiplicador_H_Campo_3: TEdit
      Left = 8
      Top = 147
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto da quantidade.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtMultiplicador_V_Campo_3: TEdit
      Left = 52
      Top = 147
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto da quantidade.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtHorizontal_Texto_Campo_3: TEdit
      Left = 96
      Top = 147
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto da quantidade.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtVertical_Texto_Campo_3: TEdit
      Left = 140
      Top = 147
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto da quantidade.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtTamanho_Fonte_Etiqueta_Campo_3: TEdit
      Left = 184
      Top = 147
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto da quantidade.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtMultiplicador_V_Campo_4: TEdit
      Left = 52
      Top = 188
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto da validade.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtTamanho_Fonte_Etiqueta_Campo_4: TEdit
      Left = 184
      Top = 188
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto da validade.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 20
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtVertical_Texto_Campo_4: TEdit
      Left = 140
      Top = 188
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto da validade.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 19
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtHorizontal_Texto_Campo_4: TEdit
      Left = 96
      Top = 188
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto da validade.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 18
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtMultiplicador_H_Campo_4: TEdit
      Left = 8
      Top = 188
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto da validade.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 16
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtMultiplicador_V_Campo_5: TEdit
      Left = 52
      Top = 230
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto do pre'#231'o final.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 22
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtTamanho_Fonte_Etiqueta_Campo_5: TEdit
      Left = 184
      Top = 230
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto do pre'#231'o final.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 25
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtVertical_Texto_Campo_5: TEdit
      Left = 140
      Top = 230
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto do pre'#231'o final.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 24
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtHorizontal_Texto_Campo_5: TEdit
      Left = 96
      Top = 230
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto do pre'#231'o final.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 23
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
    object EdtMultiplicador_H_Campo_5: TEdit
      Left = 8
      Top = 230
      Width = 45
      Height = 17
      Hint = 'Dados para formatar o texto do pre'#231'o final.'
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      CharCase = ecUpperCase
      ParentShowHint = False
      ShowHint = True
      TabOrder = 21
      OnKeyPress = EdtTamanho_Fonte_Etiqueta_Campo_1KeyPress
    end
  end
  object EdtDistancia_Horizontal: TEdit
    Left = 382
    Top = 256
    Width = 65
    Height = 17
    Hint = 'Quantidade de c'#243'pias do mesmo produto.'
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnKeyPress = EdtCopiasKeyPress
  end
  object EdtDistancia_Vertical: TEdit
    Left = 453
    Top = 256
    Width = 65
    Height = 17
    Hint = 'Quantidade de c'#243'pias do mesmo produto.'
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnKeyPress = EdtCopiasKeyPress
  end
  object EdtCodEtiquetadora: TEdit
    Left = 132
    Top = 21
    Width = 57
    Height = 17
    Hint = 'Pressione F3 para consultar'
    BevelEdges = [beLeft, beTop, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clMenu
    MaxLength = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    OnKeyDown = EdtCodEtiquetadoraKeyDown
  end
  object EdtDescricaoEtiquetadora: TEdit
    Left = 189
    Top = 21
    Width = 187
    Height = 17
    TabStop = False
    BevelEdges = [beTop, beRight, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 15
  end
  object ImgImagens_Comandos: TImageList
    AllocBy = 0
    Height = 32
    Width = 32
    Left = 588
    Top = 72
    Bitmap = {
      494C010106000C00A80020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000004000000001002000000000000080
      000000000000000000000000000000000000000000000000000000000000FFFE
      FE000000000000000000FFFEFF00FFFEFF0000000000FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00000000000000000000000000FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006067600060676000606760006067
      6000606760006067600060676000606760006067600060676000606760006067
      6000606760006067600060676000606760006067600060676000606760006067
      6000606760006067600060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFE
      FE000000000000000000FFFEFF00FFFEFF000000000000000000FFFEFF00FAFB
      FF00EFF1F900E4E6F100DBDDE800D8DAE500D7D9E400DADBE500E3E3E900EDEE
      F200F8F7F900FEFEFE000000000000000000FEFEFE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0A79000DFA79F00D09F9000CF979000CF97
      9000CF979000CF979000CF979000C0979000C0978F00C0978F00C0978F00C097
      8F00C0978F00C0978F00C0978F00C0978F00C0978F00C0978F00C0978F00C097
      8F00C0979000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFE00FFFFFE00000000000000
      000000000000000000000000000000000000FCFEFE00F6F8F900E6E7EB00CCCE
      D900AEB2CB009398B9008187AC00797FA400787FA0008084A0009496A800A9AA
      B400C2C3C700DCDCDC00F0F0F000FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0AFAF00FFD8C000FFD8C000FFD8C000FFD8
      C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8
      C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8
      C000FFD09F00DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFE00FFFFFE00000000000000
      00000000000000000000FDFEFF00F6F7FF00E0E4F700BBC0DF008E94BF006F76
      AD005A65A9004955A300414D9F00414D9F00424E9C00535DA3005C649F00585E
      8D006065860083869B00B0B2BD00D8D8DE00F4F3F500FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CFB7AF00E0E8E000FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFE0C000FFD8C000FFD8C000FFD8
      BF00FFD8BF00FFD8BF00FFD8BF00FFD8B000FFD8B000FFD8B000FFD0B000FFD0
      B000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FCFEFF00F2F3FD00CDD0EC008D95D0005864BC001A299D001023
      A8001226B400162ABD001629C000162ABF000D22B3000D20AB000B1B9D001220
      91003E49A30050599900575D8200888A9C00C0C0C600EAEAEA00F9FBFB00FDFF
      FF0000000000FEFEFE00FFFFFE00FFFFFE000000000000000000000000000000
      0000000000000000000000000000D0B7AF00E0E8E000FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFE0C000FFD8
      C000FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8B000FFD8B000FFD8
      B000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFF
      FF00FCFCFF00E9EDFF00BAC0EB006A73BC002936A2001F31BA001F36D8001E35
      E8001C34EC001932EC001932EE001932EC001B33EB001D34E7001B30DF001429
      C8000B1EA90012209000434D9B004E5586006C708900ABADB700E1E2E600F8FA
      FA000000000000000000FFFFFE00FFFFFE000000000000000000000000000000
      0000000000000000000000000000D0B7AF00E0E8EF00FFE8D000FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFD8
      C000FFD8C000FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8
      B000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFE
      FF00F0F1FF00B3B9EE004856C0002135C3002238DD001B35E7001932EE001731
      F0001530F200152FF300152FF300152FF3001530F2001731F0001731F0001933
      EB001D35E5001329C800091CA300202E9400525B9A005F648300A8AAB400E7E7
      E700FDFDFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0B7B000EFE8EF00FFE8D000FFE8D000FFE8
      D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0
      C000FFE0C000FFD8C000FFD8C000FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8
      B000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFEFF00FDFEFF00F2F5
      FF00BCC3FA004552B4002638D1001B33EB001530F200142EF600142FF5001530
      F2001932EE001B33EB001B33E9001B33EB001731EF001530F200132EF400142F
      F500152FF3001932EC001A32DE000A1EAC0015238900555E9D00686B8700B9B8
      C100F1F0F2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0BFB000EFE8EF00FFE8D000FFE8D000FFE8
      D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0
      C000FFE0C000FFE0C000FFD8C000FFD8C000FFD8C000FFD8BF00FFD8BF00FFD8
      BF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFEFF00FAFAFF00D6DC
      FF005C6BD900273BD6001D34E8001530F200142FF500142FF5001530F2001B33
      E9002239DB00273CD300293DD200283CD7002037E1001B33EB001530F200142E
      F600142FF5001630F4001731EF001B33DF000B1EAF00202D970050558C007E7F
      9400CFCED700FBF9F90000000000000000000000000000000000C05750009077
      7F006F676F000000000000000000D0BFB000EFE8EF00FFE8D000FFE8D000FFE8
      D000FFE8D000FFE8D000FFE0D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0
      CF00FFE0C000FFE0C000FFE0C000FFE0C000FFD8C000FFD8BF00FFD8BF00FFD8
      BF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FAFCFF00E6E9FF008A95
      E700293DD2001831EB00152FF3001530F2001B33E9002037E000273CD400475A
      DF007787F800A0AEFF00A7B4FF009EABFF007483FD003D51DF001E36E2001731
      EF00152FF500142EF600142FF5001731EF001B33E1000C1DA900313B9200494E
      7B009E9EAE00ECEAEA00000000000000000000000000AF5750007F878F009F77
      9F00CF879F00705F6F0000000000DFBFB000EFE8EF00FFE8DF00FFE8DF00FFE8
      D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFD8C000FFD8C000FFD8
      BF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F1F4FF00ADB8FF00394B
      CE001E36E200152FF300142EF6001B33EB00293DD2005E6CDC00CDD6FF00ECF2
      FF00EFF4FF00F1F6FF00F3F5FF00F1F5FF00EBF1FF00D0DBFF00788BFF001E36
      E2001731F000142EF600142EF600142EF2001931EF001A30D5000D1D9800515B
      A90070748D00D0D0D000FBFAFC00FFFEFF00000000007F776F003077D0005F67
      A000A08FA000D08F9F00705F6000DFBFB000EFF0EF00FFE8DF00FFE8DF00FFE8
      DF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFD8C000FFD8
      C000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBFBFF00DFE5FF005A6AE2002238
      DE001932EE00142EF2001B32EC00253BD7008F9DFF00E4EEFF00F6F8FF00FCFD
      FF00FFFEFF0000000000FFFEFF00FBFCFF00F4F7FF00D7E0FF004051D6001E36
      E2001731F000142EF600152FF700142EF600152FF5001B33E9001325BE00202D
      970052567F00AFB2B700F1F0F400FFFEFF00000000005FBFFF0030A7FF003077
      D0005F67A000A08FA000CF879F00706F6F00EFF0EF00FFF0DF00FFE8DF00FFE8
      DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFE0
      C000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F3F5FF00BAC4FF002B3DD0001932
      EE00152FF3001B33EB00273BD600818FFF00E8EFFF00F6FAFF00FBFDFF00FFFE
      FF0000000000FFFEFF00FFFEFF00F4F6FF00BAC4FF004959D4002339DF001731
      EF00142EF400142EF600142EF600142EF600142EF6001931EF001D34DE000D1C
      9B0058609B008E92A400E1E1E70000000000000000007F87B00060D8FF003FAF
      FF003077CF005F6FAF00A08FA000CF879F008F778F00FFF0E000FFF0DF00FFE8
      DF00FFE8DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8
      D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0
      C000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E6EEFF007884E2002238DD00132D
      F500142EF6001E36E4003545C000D5DEFF00F4F8FF0000000000000000000000
      0000FFFEFF00FAFCFF00F3F7FF00BEC7FF003040BB002239DB001932EE00152F
      F3001731F0001932EC001B33EB001932EE00152FF3001530F2001B33EB001425
      B4004D58A200767A9700D6D7E1000000000000000000000000008F87B0005FD0
      FF0040AFFF003077D0005F67A000A08FA000CF879F00706F7000FFF0E000FFF0
      DF00FFE8DF00FFE8DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8D000FFE8
      D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0
      C000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DAE5FF003E4FC4001E36E200132D
      F500152FF5002439DB006772CE00EDF3FF00FAFBFF000000000000000000FFFE
      FF00FDFEFF00F3F6FF00B8C3FF002E40BD002238DD001932EE00152FF3001731
      EF001E36E4002D43E300556AFF002439DB001932EE00152FF3001731EF00182C
      C70037439B0062689100CDCFDA00FFFFFE000000000000000000000000008F87
      AF0050BFFF003FA7FF003087EF005F67A000A08FA000CF879F00706F7000FFF0
      E000FFF0E000FFF0DF00FFE8DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8
      D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0
      CF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B2C2FF002E41C8001C33E600142F
      F5001530F2001F34CC0098A2E800F6F8FF00FBFDFF0000000000FFFEFF00FAFC
      FF00F1F6FF00BCC7FF002E40BD002238DE001932EE00152FF5001731F0002037
      E1003649D0008293FF00B1C1FF002C3FCA001D34E800142FF500152FF3001F35
      D500172585005D639200C9CCDB00FFFFFE000000000000000000000000000000
      00008F87AF0060E0FF003FAFFF003077CF005F6FAF00A08FA000D087A000FFF0
      E000CFBFBF00BFAFAF00BFAFAF00BFAFAF00BFAFAF00C0A7AF00BFAFAF00FFE8
      D000FFE8D000FFE8D000FFE8D000FFE8D000FFE8CF00FFE0CF00FFE0CF00FFE0
      CF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4B4FF002B3DD0001B33E900152F
      F3001731EF00192CBD00B4BDFC00F8FBFF00FDFDFF00FFFEFF00FDFEFF00F3F7
      FF00B8C5FF002E40BD002137DC001932EE00152FF3001731F0001E36E400374A
      D100C2CCFF00D5DCFF00DBE6FF004F5FD7001E36E200142EF600142FF5002238
      DD00172388005B629400C9CCDB00000000000000000000000000000000000000
      0000000000008F87B0005FD0FF00309FFF003077D00050677F00706F90008F87
      7F00AF878F00A07F7F00A07F7F00A0676F00B0878F00AF779000906760009F6F
      8F00E0D0CF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0
      CF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000798AFF00273CD4001C34EC00152F
      F3001932EC001226B300B4BDFC00F8FAFF00FBFDFF00FAFCFF00F3F7FF00BEC7
      FF002E40BD002038DE001732EE00152FF3001731F0002037E100374AD100BDC8
      FF00F1F5FF00F4F5FF00E8EDFF005E6BD7002037E000152FF700142EF6002238
      DE001723880061689900CCCFDE00000000000000000000000000000000000000
      000000000000000000008F87AF005FD0FF0060A7FF00908FAF00A08FA000AF8F
      9F00BF7F7F00E0C8A000FFF0C000FFFFD000FFFFDF00FFFFD000EFD0BF00BF87
      7F00A07F8F00EFD0C000FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0
      CF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000788AFF00273BD6001B33EB00152F
      F3001932EC001024B2008C96DC00F4F7FF00FAFBFF00F3F6FF00B8C3FF002E40
      BD002238DD001732EE00152FF3001731EF001E36E400374AD100C2CCFF00F1F5
      FF00FBFBFF00F8F9FF00E9EDFF00606DD7002237E000142FF500152FF7002238
      DD00172585007379A600D4D7E600000000000000000000000000000000000000
      000000000000000000000000000090C8EF00D0D8EF00D0C8D00090776F00E0A7
      9000FFF0B000FFFFDF00FFFFD000FFFFDF00FFFFDF00FFFFDF00FFFFE000FFFF
      E000C08F90009F6F8F00E0D0CF00FFE8CF00FFE8D000FFE8D000FFE8D000FFE8
      D000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000098A9FF00293CD3001B33EB001630
      F4001732EE001429C0005963BA00EAF1FF00ECF2FF00BFC9FF002E3FBE002339
      DF001932EE00152FF3001731F0002037E100374AD100BDC8FF00F1F5FF00FDFD
      FF00FFFEFF00F8F9FF00E0E6FF005B69DA002037E100142FF5001530F600243A
      DA00404CA4008E94B900E2E4EF00000000000000000000000000000000000000
      0000000000000000000000000000EFD0C000FFF8FF00C0A7AF00EFB79000FFE8
      BF00FFF8CF00FFF8CF00FFFFD000FFFFD000FFFFEF00FFFFEF00FFFFFF00FFFF
      FF00FFFFF000B07F7F0070576F00DFC8C000FFE8DF00FFE8D000FFE8D000FFE8
      D000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A6B6FF002D40CB001B34E800142F
      F5001531F000152BD00012209000C2CDFF00B1BFFF003447C8002238DE001932
      EE001630F4001731EF001E36E400374AD100C2CDFF00F1F5FF00FAFBFF00FFFE
      FF0000000000F3F6FF00C0CBFF003042C5001C34E4001530F600152FF3002438
      D3005861AB00B1B5CE00F1F3FB00000000000000000000000000000000000000
      0000000000000000000000000000F0D8C000FFF8FF00DFAFAF00FFE8B000FFFF
      D000FFE8B000FFF8CF00FFFFD000FFFFE000FFFFEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF8D0009F5F6F00C0A7AF00FFE8DF00FFE8DF00FFE8D000FFE8
      D000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E4FF003445BE001E36E400142F
      F5001430F3001D34E7000B1CAB003B4CD1002B40D7001F36E0001731EF00152F
      F3001731F0002037E100374AD100BDC8FF00F1F5FF00FDFDFF00FFFEFF00FDFF
      FF00FBFDFF00E1E7FF00828FFB00253BD6001B33EB00152FF3001B32EC002032
      BF00727AB600D4D4E400FCFCFF00000000000000000000000000000000000000
      0000000000000000000000000000F0D8C000EFC8DF00FFC8AF00FFF8D000FFE8
      BF00FFE8B000FFFFCF00FFFFD000FFFFE000FFFFEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFE000FFFFDF00B0877F007F677000FFE8DF00FFE8DF00FFE8DF00FFE8
      D000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E4EDFF006D7ADC002339DF00142E
      F600142FF5001731F0001128D800162EDC001B33E9001731EF00152FF3001731
      EF001E36E400374AD100C2CDFF00F1F5FF00FAFBFF00FEFDFF0000000000FBFD
      FF00F4F8FF00A4ADF1003D50DB001C34EA001730F2001931EF002237E0003A4A
      C2009FA4D100ECECF200FFFEFF00FFFEFF000000000000000000000000000000
      0000000000000000000000000000F0D8BF00DF9F9F00FFD0AF00FFF8CF00FFD8
      A000FFE8B000FFF8CF00FFFFD000FFFFE000FFFFE000FFFFF000FFFFFF00FFFF
      E000FFFFEF00FFFFDF00DFB7AF007F5F6F00FFE8DF00FFE8DF00FFE8DF00FFE8
      DF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFF5FF00AFBAFF00293CD3001731
      F000152FF500142FF500152FF300152FF300142FF500142FF500142EF2001D34
      E7003447D800B9C5FF00EFF3FF00FBFBFF00FBFCFF00FAFCFF00F8F9FF00EFF5
      FF00D8E0FF004B58C6002238DE00152FF300152FF5001D34E7002B3DC6006C78
      D000CFD2F100FBFAFC00FFFEFF00FFFEFF000000000000000000000000000000
      0000000000000000000000000000EFD0C000FFC8B000FFE8C000FFF8C000FFD8
      A000FFE0B000FFF8BF00FFFFD000FFFFD000FFFFE000FFFFE000FFFFE000FFFF
      EF00FFFFDF00FFFFD000EFD0A000705F6000FFF0E000FFF0DF00FFE8DF00FFE8
      DF00FFD8C000DF8F7F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FAFCFF00EAF1FF004454D6001E35
      E5001832F100142EF600142FF500142FF500142EF600152FF3001731EF002D43
      E300B6C4FF00E4EDFF00F3F5FF00F8F9FF00F4F8FF00EFF5FF00E8EEFF00919C
      F6002C3DC2002238DE001932EE00152FF500152FF5002439DB005B67C700B5BB
      E800EFF2FF0000000000FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000F0D8C000FFD0BF00FFE0C000FFF8C000FFD8
      AF00FFF0C000FFF0BF00FFF8CF00FFFFD000FFFFDF00FFFFDF00FFFFDF00FFFF
      DF00FFFFD000FFFFDF00DFB790007F676F00FFF0E000FFB7B000FFAFB000FF9F
      A000FF9F9F00DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F3F6FF00B3BEFF002D3F
      CC001D35E500152FF300142FF500142EF600142EF6001630F400162FEB00041A
      B9003544B2007F89D700A7B0F000B6BDFC008E96DC00646FC30024319D002133
      BC001E36E400152FF300142FF5001731F0001E36E4004052D5009CA4E000E5E9
      FC00FCFCFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFE0CF00E0C8C000FFE0B000FFFFDF00FFF0
      C000FFE0B000FFE0AF00FFF0C000FFF8CF00FFFFCF00FFFFD000FFFFDF00FFF8
      C000FFFFCF00FFF8CF00CF9F9000D0B7B000EFB79000F09F4000EF973000E08F
      3000DF873000BF8F6F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FAFBFF00EDF3FF008D98
      F200273CD4001732EE00152FF300142EF600142EF600152FF500142EED000C23
      D600071DB9000B1DAA000719A2000E20A9001225B600182DC5002437DE001E34
      E7001731F000142FF500142EF6001E36E6003042C5008590E400D7DCFD00F8FB
      FF00FFFEFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFE0CF00F0E8DF00E0BFA000FFFFDF00FFFF
      F000FFF8EF00FFE8CF00FFD8A000FFF0C000FFE8B000FFF0C000FFF0C000FFF0
      C000FFF8D000FFE0B0009F5F6F00E0C8D000EFBFA000FFBF5F00FFA72F00FFA7
      1F00CF8F4F006067600000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFEFF00FAFBFF00EAF1
      FF006F80EF00253BD6001D34E7001731F000142FF500142FF500152FF3001731
      EF001B33EB001D34E8001D34E8001D33E9001B32EC001731EF00152FF500152E
      F600152FF5001731EF001E36E4002D3FCC00828CE400CFD5FF00F6F6FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFE8CF00FFFFFF00CF979F00FFE8C000FFFF
      FF00FFFFFF00FFF8EF00FFD8B000FFE0BF00FFE0AF00FFD8A000FFE0AF00FFFF
      CF00FFF8BF00CF9F8F009F6F8F00FFF0EF00EFC8AF00FFD08F00FFB75000D09F
      6000606760000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFEFF00FDFEFF00F6F9
      FF00EAF1FF00828FEB002B3FCD001D35E5001531F000142EF600142FF500142E
      F400152FF3001730F2001730F2001730F200152FF300152FF300142EF600152F
      F5001731F0001F36DF003A4CC9008A95E700D9DDFF00F6F6FF00FDFDFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFE8D000FFFFFF00FFFFFF00EFA7B000FFFF
      F000FFFFFF00FFF8F000FFFFD000FFE8BF00FFE0A000FFF0BF00FFFFDF00FFE0
      AF00E0AF8F00C08F7F00FFF8EF00FFF0EF00F0D0B000FFD89F00CF976F006067
      6000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FDFD
      FF00F8FBFF00EBF1FF00A9B5FF004254D700253BD6001E37E1001E35E8001B33
      EB001931EF001731F0001731F0001731F0001932EE001B33E9001E35E5002238
      DE00293CD3005465DD00AFB9FF00E4E8FF00F9FAFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFE8D000FFFFFF00FFFFFF00FFFFFF00BF77
      8F00F0D8BF00FFF0C000FFFFD000FFFFD000FFFFD000FFF0CF00FFD8A000CF97
      9F00C0978F00EFE8EF00E0E8EF00E0E8E000F0D0B000D0AF8F00606760000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFF00FFFEFF0000000000FFFE
      FF00FCFCFF00F8FBFF00F1F6FF00DCE5FF0099A4F8004859C8002E41C800273B
      D6002238DE001E36E4001E34E7001F37E5002439DB00293DD2003242C4006170
      D700BAC3FF00DEE4FF00F1F4FF00FAFBFF00FDFEFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFD8B000FFE0BF00FFD8BF00FFD8BF00F0D0
      B000DFAFAF00DF9F9F00C0977F00CF977F00DFAFA000F0B7BF00E0B7A000DFAF
      A000EFBFAF00E0BFAF00E0BFAF00E0BFAF00EFC8AF00AF9F9000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFF00FFFEFF00000000000000
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
      0000000000000000000000000000000000000000000066666600666666006666
      6600666666006666660066666600666666006666660066666600666666000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EDF2F500E2E3E300EBEBEC00F2F2F100FBFB
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000929292007979790092929200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000066666600D0D0B700EBEBCD00FFFE
      DD00FFFEDD00F3F3D500D0D0B700B9B9A5009C9C8D0083837B00666666006666
      6600666666006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F9F9F90002629C0002629C00015C9100145B87001E5F
      85002A607F004F6B7B005F747D00828D930095989A00AEAEB200B9BAB900D9DA
      D900DEDFDF00F2F2F10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000089898900484848004A4A4A003939390045454500585858007979
      7900929292000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFF2CD00FFFEDD00FEF9D600FFF2CD00FEEC
      C500FFE9C100FFE9C100FEEEC900FEF5D100FEFAD800FFFEDD00F3F3D500C5C5
      AF00919185006666660066666600666666000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E2EEF500005D9B00005D9B0001609600016096000160
      96000160960002629C0001609600015C9100145B87001E5F85002A607F004F6B
      7B005F747D009B9D9E00E2E3E300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008E8E8E007373
      73004F4F4F0054545400A9A9A900C1B9B900BD9E9E00877373004B4545003D3D
      3D004F4F4F006565650092929200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FBF9DA00FFFEDD00FFF2CD00FEECC500FEE8BE00FEE4
      B900FEE0B500FEDEB100FEDEB100FEEEC900FEE6BC00FEE4B900FEECC500FEF5
      D100FFFEDD00F3F3D500B9B9A500666666006666660066666600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000015C9100015C9100015C
      9100015C9100015C9100015C91000968A6001C79C7001F80CF001F80CF001F80
      CF001E7CCE001C79C7001C79C7001570BF001570BF00126EB9000968A600105D
      A80002629C001E5F8500AEAEB200000000000000000000000000000000000000
      0000000000000000000000000000000000006F6F6F006F6F6F006F6F6F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008E8E8E0063636300575757009797
      97008887870086868600ABABAB00B0A6A600BB9F9F00C8A7A700D5B0B000A78C
      8C007666660039393900474747005B5B5B007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FBF9DA00FEF9D600FEEEC900FFE9C100FEE4B900FEE0
      B500FFDCAF00FED8A900FEE0B500EFF8D800FEFCE500FDE0B300FCE6C000FEEE
      C900FFEFCE00FEF5D100FEFCDA00FFFEDD00A5A5940066666600666666000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000015C9100094C7B000F3E
      68000F3E68000F3E68000C4470000E6BB1001E7CCE002184D1002588D3002184
      D1002184D1002184D1001F80CF001F80CF001F80CF001E7CCE001E7CCE001C79
      C7001570BF00145B8700A5A8A700000000000000000000000000000000000000
      00000000000000000000000000008C827A004A3F37003B3B3B003D3E3F004A4A
      4A006F6F6F006F6F6F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008E8E8E00585858006B6B6B00ACACAC00DCDCDC00D7D7
      D7006363630080808000A0A0A000AFA6A600938282007D737300BAA3A300BEA4
      A400CEB8B800D8B3B3009A8181004E4848003F3F3F0050505000686868009292
      9200000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFAD800FEF5D100FEECC500FEE8BE00FEE4B900FEDE
      B100FFDAAC00FFD4A400FEDEB100BFE6AC008FD28300FFFFF000FFFEF500FFFF
      FC00FFFFFC00FFFEF500FEFAD800FEF9D600FFFEDD00DBDBC100666666006666
      6600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A5A8A700EEEEEE00016096000C4470001338
      6000133860001033530006642800126EB9002588D3002A91D800268CD5002A91
      D800288FD700288FD700268CD500278DD600268CD500258AD500258AD5002184
      D1001E7CCE00145B87009B9D9E00000000000000000000000000000000000000
      00000000000000000000A5A29F008E582700A53F020080300900612B10004731
      26003D3937003C3C3D0041414200595959006F6F6F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000828282005C5C5C0082828200CACACA00DBDBDB00D7D7D700D0D0D000CACA
      CA00C6C6C6007A7A7A00979797009B96960072686800000000000E0E0E002726
      260000000000454545008A7E7E00D6B8B800BE9D9D007C6A6A00474343004848
      48005B5B5B008080800000000000000000000000000000000000000000000000
      000000000000EDEBD500FBEBC000F8E0AE00FFF2CD00FEE8BE00FEE0B500FEDE
      B100FED8A900FED1A100FEE6BC00BFE6AC000099000060BF5B00009900000099
      00000099000060BF5B00DFF2D300FEF9DE00FEFCDA00FFFEDD00AAAA9A006666
      6600000000000000000000000000000000000000000000000000000000000000
      000000000000F6F6F6006F926F0059785900E7E7E700016096000C4470001338
      60001033530002521400269051001570BF00258AD5002D94DA00258AD5002C92
      D9002C92D9002C92D900228AD5002A91D800288FD700288FD700258AD500228A
      D5002184D100145B870095989A00000000000000000000000000000000000000
      00000000000000000000A5A29F00915B2600AE430100D28A5F00D28A5F00B560
      2D00953E100075321000552E1900403530003B3B3B003D3E3F004D4D4D006F6F
      6F006F6F6F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000717171006565
      6500A0A0A000D4D4D400D9D9D900D4D4D400CFCFCF00CACACA00C4C4C400BDBD
      BD00B7B6B600737373008C8C8C008A8989007570700079717100554E4E002421
      210000000000000000000000000037373700DBC0C000E6BBBB00E5B9B900AF91
      91005D535300404040005C5C5C009F9F9F000000000000000000000000000000
      000000000000F8EFCF00F5D09700EDB26A00F6D9A400FEF0CA00FEE6BC00FEDE
      B100FED8A900FED1A100FFE9C100BFE6AC000099000000990000009900000099
      00000099000000990000109F0F00CFEBC200FFFEDD00FFFEDD00E6E6C9006666
      6600000000000000000000000000000000000000000000000000000000000000
      0000CDCDCC000C94110038C34B0059785900A5A8A7000C44700009213500056E
      0A0025982A0090E5A2005FB69E001977B9002D8ED8003097DB00258AD5003097
      DB003097DB003097DB00258AD5002D94DA002C92D9002C92D900268CD500288F
      D700258AD500145B8700828D9300000000000000000000000000000000000000
      00000000000000000000A5A29F009E5D2500AB400100E8BC9C00FFF2D700FEDB
      B900F3C59900E19E6D00C8764400A9522200843B0E0064311700483226003B39
      37003E3D3C004343430000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400A0A0A000DCDC
      DC00D9D9D900D3D3D300CDCDCD00C8C8C800C3C3C300BABABA00B7B6B600B1B1
      B100A9A9A90079797900AEAEAE00BDBDBD00757575006B696900777171006961
      610000000000000000000000000010101000292929007D737300D0B4B400E6BB
      BB00F3C4C400D7AEAE0040404000929292000000000000000000000000000000
      000000000000FEF4CE00F6C08200F0B56F00F0B56F00F2BE7D00F8DAA700FEF0
      CA00FFE9C100FFDAAC00FFE9C100BFE6AC000099000000990000009900000099
      000030AC3000109F10000099000030AC2D00FEFCE500FFFEDD00FFFEDD006666
      660066666600000000000000000000000000000000000000000000000000A5A8
      A700168125002ABE3C0038C34B00056E0A002C772D00056E0A001D8D220055C0
      63007BD8920090E5A20045A286001C79C7002D8ED8003097DB00228AD5003399
      DD003097DB003097DB00268CD5003097DB002D94DA002D94DA00278DD6002A91
      D800268CD500015C910081888D00000000000000000000000000000000000000
      00000000000000000000A5A29F009E5D2500AF460600E8BC9C00FFEACE00FFE3
      C600FFE2C200FFE4C100FFE0BB00FAD0A500F3BA8600DC905A00C06930009F4A
      180069371A003C3C3D0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A9A9A900BDBDBD008E8E8E00D0D0
      D000CDCDCD00C6C6C600C0C0C000BABABA00B4B4B400AEAEAE00A9A9A900BEBE
      BE00DCDCDC00EFEFEF00A4A4A4006666660098989800B9B9B900A0A0A0007A78
      7800706A6A00514B4B002B27270088878700685B5B00352E2E0069616100CFAC
      AC00DBB4B400E8BDBD0040404000929292000000000000000000000000000000
      0000EEEADC00FEECC500F2B97600F2B97600F2B97600F2B97600F2B97600F2B9
      7600F5C68A00F9DCAC00FEF6D400AFDD9D0000990000009900000099000060BF
      5B00FFFFFC00EFF8E30070C66A00009900009FD89300F9DCAC00FFFEDD008383
      7B006666660000000000000000000000000000000000F6F6F6006F926F0012AA
      1E0024BA35002ABE3C0034BC440043C556004CC960005CCE710062CF76006FD3
      84007BD8920025982A00054A2F001F80CF003295DC00389CDE00228AD500389C
      DE003399DD003399DD00278DD6003399DD003399DD003399DD002A91D8002D94
      DA002D8ED800015C91006D7C8400000000000000000000000000000000000000
      00000000000000000000A5A29F00A5602200AF4B0E00EECBB200FFEBD300FFE3
      C600FFE0C200FFDFBC00FFDDB700FFDAB200FFDDB700FFD59B00FFCB7C00ECA1
      5F00903D0C003C3B3A0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A9A9A900D0D0D000CACACA00C6C6
      C600BEBEBE00B9B9B900B3B3B300ACACAC00B7B6B600D4D4D400EAEAEA00E9E9
      E900E1E1E100DEDEDE00DCDCDC00D0D0D0009B9B9B0068686800656565009797
      9700B7B6B600A5A3A300837E7E00857B7B0093848400574D4D00AC9595008A76
      760041554200AC8E8E0040404000929292000000000000000000000000000000
      0000F0E1CB00F9DCAC00F4BD7D00F4BD7D00F4BD7D00F4BD7D00F4BD7D00F4BD
      7D00F4BD7D00F6C08200FEEEC90080CC7200009900000099000000990000109F
      1000CFECCB00FEFEE800FEF9E2009FD8930030AC2D00FEF6D400FEF5D1009595
      8900666666000000000000000000000000000000000075AB7500068B090018B8
      290018B829002ABE3C0034BC440043C556004CC960005CCE710062CF760074D6
      8B006FD38400025214000C4470002184D1003295DC00389CDE002588D300389C
      DE00379EE100379EE100278DD600379EE1003399DD003399DD002C92D9003295
      DC002C92D900015C91006D7C8400000000000000000000000000000000000000
      00000000000000000000A5A29F00AF672800AF4B0E00EECBB200FFEEDA00FFE6
      CE00FFE6C600D5D9CA00CCD0C000FFDDB700FFDAB200FFBF7100FFBB5A00ECA1
      5F008A4013003B3B3B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ABABAB00C4C4C400BDBDBD00B9B9
      B900B1B1B100B4B4B400CACACA00E3E3E300EDEDED00EAEAEA00E9E9E900C4C4
      C400C6C6C600CACACA00CFCFCF00D0D0D000D7D7D700DBDBDB00CFCFCF009B9B
      9B00666666006565650097979700B7B6B600A4A1A100878080008D7F7F007769
      69003AA45D005E4F4F0040404000929292000000000000000000000000000000
      0000FBE9C500FBD19D00F6C18400F6C18400F6C18400F6C18400F6C18400F6C1
      8400F6C18400FBD19D00EFF9D200BFE6AC0060BF5B0040B33C0030AC2D000099
      000030AC2D00FFFEF500FBF4CF00FEF9E20050B94A00EFF9D200FFF2CD00A5A5
      9400666666000000000000000000000000000000000000000000CDE3CD0012AA
      1E0024BA35002ABE3C0034BC440043C556004CC960005CCE71005CCE71001D8D
      2200054A2F0013386000094C7B002588D300389CDE00175B9A000D4D8F00164A
      75001E5F85003BA1E300288FD7003BA1E300379EE100379EE1002D94DA00389C
      DE003399DD00016096005F747D00000000000000000000000000000000000000
      00000000000000000000A5A29F00AF672800B4561B00F2DBCA00FFEEDA00FFEB
      D300F5E4CC002AA5CB0070B8C700FFE2BF00FFDAB200FFB33D00FFCB7C00EFB2
      82008A4013003A3B3C0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ABABAB00B7B6B600B3B3B300C0C0
      C000DBDBDB00EDEDED00F1F1F100F1F1F100EFEFEF00EDEDED00BDBDBD00CC80
      8000935353007B555500686868008A898900B1B1B100C6C6C600D0D0D000D7D7
      D700DBDBDB00D9D9D900A3A3A300717171006E6E6E0094949400B1B1B100A7A3
      A300867E7E00917F7F005353530092929200000000000000000000000000EEE3
      D100FFE9C100FBC99200FAC48B00FAC48B00FAC48B00FAC48B00FAC48B00FAC4
      8B00FAC48B00FBD19D00BFE6A800DFF1CC00FEF9DE00FEFCE500FFFEF500CFEC
      CB00FFFFFC00FFFFFC00FFFFF000FFFCEC00CFECBC00BFE6A800FEF4CE00D1D1
      B800666666000000000000000000000000000000000000000000000000004A8F
      4A000E9D16002ABE3C0034BC440038C34B0034BC440034A83C001D8D2200054A
      2F001338600013386000094C7B002D8ED8002F8BCB00105DA800126EB9000D53
      9B000F3E68003BA1E3002A91D8003BA1E3003BA1E3003BA1E3003097DB00379E
      E1003399DD0002629C004F6B7B00000000000000000000000000000000000000
      00000000000000000000A5A29F00BA6D2B00B4561B00F7E1D100FFF4E100FDEC
      D7005FB6CE000F99CC003EABCA00FFE4C900F3C28700CA9A5800C9BEA400DE95
      5500843B0E003E3D3C0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A0A0A000CFCFCF00EAEAEA00F3F3
      F300FAFAFA00F8F8F800F6F6F600F4F4F400F3F3F300F1F1F100C0C0C000FF9C
      9C00CC666600CC66660089707000E4E4E400A0A0A0008B8B8B0086868600A0A0
      A000C3C3C300CFCFCF00D7D7D700DBDBDB00D9D9D900A3A3A3006E6E6E006E6E
      6E009494940094949400A3A3A30000000000000000000000000000000000EEE3
      D100FEE4B900FDC99300FDC99300FDC99300FDC99300FDC99300FDC99300FDC9
      9300FDC99300FED1A100CFECB70050B94A00FEFCE500FEF9D600FFFFF00050B9
      4A00009900000099000040B33C0040B33C00CFECBC00EFF5D000FEE6BC00DBDB
      C100666666000000000000000000000000000000000000000000000000000000
      0000F7FBF7001D8D220024AD31005978590058839B00084E8200133860001338
      60001338600013386000084E82002D8ED8001563A8001F80CF002184D1001C79
      C700105DA8003794CC002C92D9003FA5E5003FA5E5003FA5E5003399DD003BA1
      E300379EE1000968A6004F6B7B00000000000000000000000000000000000000
      00000000000000000000A5A29F00BA6D2B00B85E2300FAECDF00F3F1E40059B6
      D1002AA6CD00CBD8D10028A5CD00D5D9CA00C8A48400255B7100988C6600E09A
      4C00C17227007C4F220051453900545454007777770000000000000000000000
      00000000000000000000000000000000000000000000A0A0A000C3C3C300C4C4
      C400EAEAEA00FAFAFA00FAFAFA00F8F8F800F6F6F600F4F4F400C3C3C300FFA0
      A000CC666600CC66660081686800DCC3C300E5B9B900EDE1E100E7E7E700B1B1
      B1008E8E8E00827B7B008A898900BABABA00CFCFCF00BABABA0094949400A0A0
      A000A0A0A000000000000000000000000000000000000000000000000000F3E2
      C400FEDEB100FECC9900FECC9900FECC9900FECC9900FECC9900FECC9900FECC
      9900FECC9900FECC9900FEFAD80020A61D009FD89300FEFEE800FEFCE500EFF8
      E90020A62000009900000099000000990000BFE6AC00FFDAAC00FED8A900FFFE
      DD00666666000000000000000000000000000000000000000000000000000000
      000000000000CDE3CD00359736006F926F004C7CA100094C7B00133860001338
      60001338600013386000035789003092DB00105DA800469BD900469BD9002F8B
      CB00105DA8003E9BD1002C92D90042A8E6003FA5E5003FA5E500379EE1003FA5
      E500379EE1000968A6003B647B00000000000000000000000000000000000000
      00000000000000000000A9A49F00C46F2900B5602D00FFFDF100B4D8DF002BA8
      D000DFE4DA00FFF2D7004AB1CE007EBECB00FFEBCB00AEAFA100CA9A5800FDE2
      C200FFDEB500F4B26F00CA7C2D008F561E005D47340044444400777777000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A0A0A000A0A0A000B7B6B600D3D3D300FAFAFA00F8F8F800C6C6C600FFA2
      A200CC666600CC666600765D5D00B8858500BE585800E2AFAF00F4F4F400E7E7
      E700D9D9D900CD9A9A00804D4D00935353006D4747004D4D4D00000000000000
      000000000000000000000000000000000000000000000000000000000000F8E0
      BA00FFDAAC00FED1A100FED1A100FED1A100FED1A100FED1A100FED1A100FED1
      A100FED1A100FED1A100FFE9C10080CC72000099000070C66A00EFF8E300FFFF
      FC008FD28D00009900000099000000990000BFE6AC00FEDEB100FFDAAC00FFFE
      DD00666666006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000F6F8FA003280B2000F3E6800133860001338
      60001338600013386000035789003BA1E3002F8BCB00D3CFF200E2EEF5006E9F
      C0001563A80048AEEB002A91D80045AAEA0042A8E60045AAEA003BA1E3003FA5
      E5003FA5E5000B6CA9003B647B00000000000000000000000000000000000000
      000000000000000000009C968E00C7742C00B5602D00FFFAF700F3F2EC00F4ED
      E500FFF2E300FFF2DC0097CAD30034A9CC00FFE6CE00FFEBCB00EDC29900DE95
      5500E5AA7300FBD9B600FFDFBC00F3BA8600DD8C3C00865E3300484850003E3E
      4400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A0A0A000B4B4B400BDBDBD008B8B8B00FFA6
      A600CC666600CC66660079606000A7747400B44E4E00D6A3A300FDFDFD00F4F4
      F400E7E7E700D5A2A200804D4D00CC666600CC6666004A4A4A00000000000000
      000000000000000000000000000000000000000000000000000000000000FEE0
      B500FFDAAC00FED8A900FED8A900FED8A900FED8A900FED8A900FED8A900FED8
      A900FED8A900FED8A900FFDAAC00EFF5D00020A61D00009900000099000030AC
      2D0000990000009900000099000000990000BFE6AC00FEE0B500FED8A900FFFE
      DD0083837B006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000EDF2F5002A74A4000F3E6800133860001338
      6000133860000F3E6800035789003BA1E30042A8E600498BB30074ACD4001977
      B90049A3D90048AEEB002D94DA0048AEEB0045AAEA0048AEEB003FA5E50042A8
      E6003FA5E5001273B4002A607F00000000000000000000000000000000000000
      000000000000000000009C968E00D0762900BE754800FFFDFD00FFF8F200FFF7
      EC00FFF3E700FFF2E300EBE6D9001FA3CE00CBD8D100FFEACE00FFF1DA00DE9B
      6A0088390200915B2600E5A56D00FAD0A500D6BB9F00B9BABD004B55AF001521
      930039394E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFA9
      A900CC666600CC666600866C6C00BA878700A9434300BF8C8C00E7E7E700FDFD
      FD00F4F4F400DBA8A800804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000F1DDC400FEE0
      B500FEDEB100FEDEB100FEDEB100FEDEB100FEDEB100FEDEB100FEDEB100FEDE
      B100FEDEB100FEDEB100FEDEB100FEE6BC00CFEBC200109F0F00009900000099
      000000990000009900000099000000990000BFE6AC00FEE8BE00FEDEB100FEFC
      DA00959589006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000D9E7F0000C64980013386000133860001338
      6000133860000F3E6800015C91003FA5E50045AAEA00379EE100379EE1004BB1
      EE004BB1EE004BB1EE002D94DA004BB1EE0048AEEB0048AEEB0045AAEA0045AA
      EA0042A8E6001977B9001E5F8500000000000000000000000000000000000000
      00000000000000000000968C8200D57A2D00BE754800FFFFFF00FFFAF700FFF8
      F200FFF7EC00FFF3E700FFF4E30053B5D20070BCCF00FFEDD300FFF1DA00DE9B
      6A006F3509004643400000000000EDC29900C69765009594AC002A55D200144E
      D1005E5E94000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFAC
      AC00CC666600CC6666008B727200CA9797009F393900A5727200C3C3C300E7E7
      E700FDFDFD00E1AEAE00804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000F1DDC400FDE0
      B300FEE4B900FEE4B900FEE4B900FEE4B900FEE4B900FEE4B900FEE4B900FEE4
      B900FEE4B900FEE4B900FEE4B900FEE4B900FEEEC900DFF1CC0060BF5B000099
      000000990000109F0F0080CC7E00109F0F00BFE6AC00FFEAC400FEE4B900FEF9
      D600A8A897006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000C9DDEA000160960013386000103353001338
      6000133860000C447000015C910045AAEA0048AEEB00379EE1003BA1E3004EB5
      F0004BB1EE004EB5F0002D94DA004EB5F0004BB1EE004BB1EE0048AEEB0042A8
      E60048AEEB001977B900145B8700FFFFFE000000000000000000000000000000
      00000000000000000000968C8200D3762500C4815800FFFFFF00FFFEFC00FFFA
      F700FFF8F200FFF7EC00FFF7E800B4D8DF0024A5CE00EBE6D900FFF4E100E19E
      6D0078380800424344000000000000000000000000007077BF007077BF006E74
      CB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFAF
      AF00CC666600CC666600876E6E00DCC3C300C58C8C00B58E8E00A3A3A300C3C3
      C300E7E7E700E4B1B100804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000F3DCBA00FEE4
      B900FEECC500FEECC500FEECC500FEECC500FEECC500FEECC500FEECC500FEEC
      C500FEECC500FEECC500FEECC500FEECC500FEECC500FEEEC900FFF9E400FFFE
      F500FFFFFC00FFFBEC00FEF9E200BFE5B400BFE6AC00FFF2CD00FEECC500FEF9
      D600B1B19F006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000B9D1DD0002629C0006642800056E0A000921
      3500103353000C4470000160960045AAEA004BB1EE0049A3D9005CB2E80073BB
      E6007AC1E70086C2E40074ACD4009AC9DC009AC9DC009AC9DC00A7C8D700A7C8
      D70084BEDE001F81C600145B8700F9F9F9000000000000000000000000000000
      000000000000000000009E928300CF712200C98F6C00FFFFFF00FFFFFF00FFFE
      FB00FFFAF700FFF8F200FFF7EC00FBF2E6002EA9D10080C3D200FFF8E400DE9B
      6A00763A0A004F51510000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFB3
      B300CC666600CC6666005B4F4F0098989800C6C6C600F4F4F400C6C6C600A3A3
      A300C3C3C300D4A1A100804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FAD9AF00FEE8
      BE00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FFF2
      CD00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FEF4CE00FEF5D100FEF5
      D100FEF5D100FEF5D100FFF2CD00FEF9E200FEFCE500FEF5D100FFF2CD00FEF9
      D600D1D1B8006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000A9BCC700015893000252140034BC44000252
      1400092135000C4470000160960042ACF10084BEDE00F1E3CF00F3E8D300FDEC
      D300FDECD300FDECD300FFF5D700FFF5D700FFF9D800F9F2D700FFF5D700FDEC
      D300FCE5C7001F81C60003578900F9F9F9000000000000000000000000000000
      000000000000000000009B8D7E00CF712200C98F6C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFB00FFF8F200FFF7EC00B4D8DF00AAD3DC00FFF5E500D891
      5B00693B14005253530000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFB6
      B600CC666600CC666600CC666600B96060009C565600804D4D00796060006D66
      66006B6B6B00A370700076494900CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FDD6A900FEF0
      CA00FEF9D600FEF9D600FEF9D600FEF9D600FEF9D600FEF9D600FEF9D600FEF9
      D600FEF9D600FEF9D600FFF2CD00FFF2CD00FEF5D100FEF0CA00F6E3BB00F6E3
      BB00FEFCDA00FFFEDD00FFFEDD00FEFCDA00FEFAD800FEF9D600FEF9D600FEFC
      DA00D0D0B7006666660000000000000000000000000000000000000000000000
      000000000000B9BAB9006F926F0012841400189B1F0045B24D0062CF76007BD8
      920034A83C0009485200005D9B005CB2E800E7E2D3005D58F200544EF1006762
      F3003E39EF00FFFFFE00544EF1003E39EF00211BED00EEEEFD00B6B3F800E9E4
      F300FFF4DC002184D10003578900F6F6F6000000000000000000000000000000
      00000000000000000000A8968100D3762500B85E2300CA8A5F00D7A98E00E5CA
      BC00F1E4E000F8F3F200FFFFFF00FFFFFF00FFFFF700FFFDF100FFFAEE00DA95
      5F006A3C15005353540000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFB9
      B900CC666600CC66660089505000A6595900C2636300CC666600CC666600CC66
      6600B9606000A6595900804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FFD4A400FEF5
      D100FFFEDD00F3DDB500F3DDB500FFFEDD00FFFEDD00FFFEDD00FFFEDD00FFFE
      DD00FEF5D100FEECC500F8DDB300E6AF7D00DB935A00DE996100E19C6400E19C
      6400E4A26A00ECAF7800F3CA9A00F3DDB500FFFEDD00FFFEDD00FFFEDD00FFFE
      DD00F3F3D5006666660000000000000000000000000000000000000000000000
      0000E7E7E70012841400189B1F0043C5560055CA690062CF760067D17C0074D6
      8B0083DC9A000F785300005D9B005CB2E800EFEDD7000F08ED00544EF100A6A2
      F600544EF100BDBBFA00211BED00BDBBFA002B24EE00FFFFFE00B6B3F800EAE6
      F900FFF4DC002685C900015C9100F2F2F1000000000000000000000000000000
      00000000000000000000A3947C00D77C2500BF500000BD500000BC520000B951
      0000B9590F00C1703500C8855800D19D7D00E3BFAA00F2DBCA00F4EDE500D893
      5F006C3D15005253530000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFBC
      BC00CC666600CC666600735F5F00C0C0C0009F9F9F00918B8B008A7171008C59
      590093535300A6595900CC666600CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FED1A100FEF0
      CA00D3905900CA793D00CC7C4000E5B48200FFFEDD00FFFEDD00FFFEDD00FEF0
      CA00FFE9C100EBBB8B00DB935A00DB935A00DE996100E19C6400E19C6400E4A2
      6A00E6A46D00E7A77000E9A97200EAAC7500EEB47F00F8DDB300FFFEDD00FFFE
      DD00FFFEDD006666660000000000000000000000000000000000000000004A8F
      4A000E9D160034BC440034BC440043C556004CC960005CCE710067D17C0074D6
      8B007BD89200338E9500005D9B0068BBEC00F9F2D700211BED007974F500BDBB
      FA00FFFFFE000F08ED00B6B3F800D6D5FC002B27F000FFFFFE00B6B3F800E6E5
      FC00FFFBE400288FD700015C9100EEEEEE000000000000000000000000000000
      00000000000000000000A9A08700F3B06000D8791D00D06D0D00CB620000C759
      0000C7590000C2550000BF500000BD500000BC520000B8540600BD672800C362
      170070451D005C5D5E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFBF
      BF00CC666600CC666600876E6E00CDCDCD00DBDBDB00E3E3E300F6F6F600F8F8
      F800EFEFEF00CACACA0066666600CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FED1A100ECC1
      9200CA793D00C8834E00CA8E6200D3A77D00FFFEDD00FFFEDD00FEECC500FEE4
      B900DB935A00DB935A00DB935A00DE996100E19C6400E19C6400E4A26A00E6A4
      6D00E7A77000E9A97200EAAC7500ECAF7800EEB17C00F0B37E00F4C59500FEFA
      D800FFFEDD006666660000000000000000000000000000000000000000000E9D
      160024BA35002ABE3C0038C34B0043C556004CC960005CCE710067D17C0074D6
      8B007BD89200338E9500005D9B0068BBEC00F9F2D7000F08ED003D36EF00BDBB
      FA00FFFFFE000F08ED008681F500DFDDFB00312AEE00FFFFFE00B6B3F800AEAE
      B200C8B7A4002D94DA0001609600EEEEEE000000000000000000000000000000
      00000000000000000000A5A5A200A69F8600B8A98700C7AA7900D7AE7100DBA5
      5E00E09A4C00DD8D3400D8791D00D4710F00D0670100CB5C0000C7590000CB5C
      0000644325006262620000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFC2
      C200CC666600CC666600866C6C00D0D0D000CDCDCD00C4C4C400B4B4B400BDBD
      BD00B1B1B100D7D7D70098989800CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FBD19D00CDB2
      9300000000000000000000000000DBDBC100FFFEDD00FFE9C100FEE0B5006666
      66000000000000000000E19C6400E19C6400E19C6400E4A26A00E6A46D00E7A7
      7000E9A97200EAAC7500ECAF7800EEB17C00F0B37E00F2B68100F3BA8400F8CD
      9E00FEEEC900666666000000000000000000000000000000000075AB750018B8
      290024BA350024BA350024AD310025982A00168125001D8D220055C063007BD8
      920045B24D00005774000968A6007AC1E700FFF5D7000F08ED004942F1006F6A
      F400322DF000FFFFFE00544EF100544EF1004942F1006F6AF4007469E800F4E5
      D50086C2E4003097DB0001609600E2E3E3000000000000000000000000000000
      000000000000000000000000000000000000000000009D9D94009D9D94009D9D
      94009D9D94009A988B00A69F8600B5A07800C3A06A00D4A56100E09A4C00DD8D
      34006F593E005C5D5E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFC5
      C500CC666600CC666600866C6C00CACACA00B7B6B600B9B9B900B4B4B400BABA
      BA00C8C8C800E1E1E10097979700CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FED1A100F3DC
      BA006666660066666600EBEBCD00FEFCDA00FEE6BC00FEDEB100666666000000
      000000000000000000000000000000000000E6A46D00E6A46D00E7A77000E9A9
      7200EAAC7500ECAF7800EEB17C00F0B37E00F2B68100EDBE9300F5BD8A00F8C1
      8D00F8C18D0066666600000000000000000000000000E2EDE2001D8D220018B8
      290018B829001D8D22004A8F4A00296F8C00035789000664280055C063002598
      2A0002521400035789000B6CA90086C2E400F9F2D7006762F3008681F500B6B3
      F800BDBBFA00FFFFFE00F4F6FB00F4F6FB00FBFBFC00FFFFFE00FFFBED009AC9
      DC0051BCF900389CDE0002629C00DEDFDF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009D9D94009D9D9400A5A5A2009A98
      8B009D9D94000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFC9
      C900CC666600CC666600856B6B00C8C8C800AEAEAE00BDBDBD00C3C3C300DBDB
      DB00C6C6C600E4E4E40094949400CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000FED1A100FED8
      A900FEFCDA00FEF9D600FEECC500FED8A900FDD6A90066666600000000000000
      0000000000000000000000000000000000000000000000000000E9A97200EAAC
      7500ECAF7800EEB17C00E6AF7D00AF988400000000000000000000000000F4C5
      9500FBC69000666666000000000000000000000000008BC38B000C9411004A8F
      4A00D4D5D10000000000000000001B6D9F00015C910006642800056E0A001338
      600013386000035789001271AC0086C2E400FCE5C700FEF6EA00FEF6EA00FFF3
      E200FFF3E200FFEFDB00FFEFDB00FDECD300FAE7D500F1E3CF00D9DAD9004CB7
      F40055B8F500389CDE0002629C00D9DAD9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CACACA00FFCB
      CB00CC666600CC666600856B6B00E1E1E100E3E3E300E7E7E700D4D4D400D3D3
      D300C4C4C400D0D0D00094949400CC666600CC6666004F4F4F00000000000000
      000000000000000000000000000000000000000000000000000000000000FECF
      A000FBD19D00FED1A100FBD2A400FBD2A4000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ECAF
      7800EEB17C00F0B37E00A082670070707000000000000000000000000000E5BA
      9000FDC89500666666000000000000000000000000008BC38B00068B0900E2E3
      E3000000000000000000000000001B6D9F00015C910009485200094852000F3E
      680013386000035789001271AC0068BBEC00E7DCCA00FCE5C700F4E5D500E7DC
      CA00D4D5D100B9D1DD00A7C8D7007AC1E70068BBEC0055B8F5004CB7F4004EB5
      F0004EB5F0003092DB0002629C00D9DAD9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8C1
      C100EDBBBB00C6999900DEDEDE00C4C4C400E7E7E700F3F3F300EFEFEF00EFEF
      EF00EDEDED00EFEFEF0094949400CC666600CC66660075757500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0B37E00F2B68100DAAB80008A7A6B008A7A6B0092817100D2AB8400FDC8
      950083837B006666660000000000000000000000000094C894004A8F4A000000
      0000000000000000000000000000A7C8D700498BB300498BB300498BB300498B
      B300498BB300016096001271AC0045AAEA0042ACF1003CA4EA00379EE1003293
      D4002F8BCB001F81C6001273B4000968A6000C649800015C9100015C91000158
      9300015C91001B6D9F004283AB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D9D9D900EFEFEF00E3E3
      E300E1E1E100FAFAFA00AF9F9F00E1AEAE00C78E8E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F3BA8400F5BD8A00F8C18D00F8C18D00FBC69000FDC89500A8A8
      97006666660000000000000000000000000000000000ECF5EC00CDE3CD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001B6D9F0002629C001271AC000968A6000160960001609600015C
      910002629C00015C9100005D9B000C6498000C6498004E8FB7006E9FC000B9D1
      DD00D9E7F000F6F8FA00FFFFFE00000000000000000000000000000000000000
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
      0000000000000000000000000000FBC69000FBC69000FACA9900A8A897006666
      6600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008CB9D1004283AB0089A3B200A9BCC700E4EBEE00F9F9F9000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000400000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF00ECBFF77FFF0000010000000000000000
      ECC0037FFE00000100000000000000003F0000FFFE0000010000000000000000
      3C00003FFE0000010000000000000000F8000008FE0000010000000000000000
      E000000CFE0000010000000000000000E0000007FE0000010000000000000000
      80000007FE000001000000000000000080000003C60000010000000000000000
      8000000382000001000000000000000080000000800000010000000000000000
      0004000080000001000000000000000000080001800000010000000000000000
      00700001C0000001000000000000000000600000E00000010000000000000000
      00400000F0000001000000000000000000000001F80000010000000000000000
      00000001FC000001000000000000000000000001FE0000010000000000000000
      00000001FE000001000000000000000000000801FE0000010000000000000000
      00000001FE000001000000000000000000002000FE0000010000000000000000
      00000000FE000001000000000000000000000005FE0000010000000000000000
      80000007FE000001000000000000000080000007FE0000030000000000000000
      8000001FFE00000700000000000000008000001FFE00000F0000000000000000
      E000007FFE00001F00000000000000002000007FFE00003F0000000000000000
      3C00013FFFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFF801FFFFFFE0FFF
      FFFFFFFFFFFE3FFFFF0003FFFFFC0003FFFFFFFFFFF807FFFE0000FFFFFC0001
      FFFFFFFFFFC001FFFC00003FFF800001FF1FFFFFFF00007FFC00001FFF800001
      FE03FFFFFC00000FFC00000FFE000001FC007FFFF0000003F800000FF8000001
      FC0007FFC0000000F800000FF0000001FC0003FF80000000F8000007E0000001
      FC0003FF00000000F000000780000001FC0003FF00000000F000000780000001
      FC0003FF00000000F0000007C0000001FC0003FF00000000E0000007E0000001
      FC0003FF00000001E0000007F0000001FC00007F80000007E0000007F8000001
      FC00001FF000003FE0000003FE000001FC00000FFE00003FE0000003FE000001
      FC000007FFC0003FC0000003FE000001FC000207FFC0003FC0000003FE000000
      FC00038FFFC0003FC0000003FE000000FC0003FFFFC0003FC0000003FE000000
      FC0003FFFFC0003FC0000003F8000000FC0003FFFFC0003FC0000003F0000000
      FC0003FFFFC0003FC0000003E0000000FC0003FFFFC0003FC0000003E0000000
      FC0003FFFFC0003FCE0C0003C0000000FF8003FFFFC0003FC01F000380000000
      FFFF07FFFFC0003FC03FC0E386000000FFFFFFFFFFC0003FE0FFE0E38E000000
      FFFFFFFFFFE0003FFFFFF0039E000001FFFFFFFFFFFF807FFFFFF8079FF80001
      FFFFFFFFFFFFFFFFFFFFFE0FFFF81FFF00000000000000000000000000000000
      000000000000}
  end
  object ACBrETQ: TACBrETQ
    Porta = 'LPT1'
    Left = 554
    Top = 70
  end
end
