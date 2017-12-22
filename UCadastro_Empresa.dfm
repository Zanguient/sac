object FrmCadastro_Empresa: TFrmCadastro_Empresa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Empresas'
  ClientHeight = 420
  ClientWidth = 911
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
    Width = 786
    Height = 420
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
        Top = 57
        Width = 83
        Height = 13
        Caption = 'Nome Fantasia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 0
        Top = 94
        Width = 71
        Height = 13
        Caption = 'Raz'#227'o Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 0
        Top = 131
        Width = 68
        Height = 13
        Caption = 'Propriet'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label33: TLabel
        Left = 684
        Top = 93
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
      object Label34: TLabel
        Left = 684
        Top = 130
        Width = 53
        Height = 13
        Caption = 'Custo Op.'
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
      object EdtNome: TEdit
        Left = 0
        Top = 72
        Width = 260
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 2
      end
      object EdtRazao_Social: TEdit
        Left = 0
        Top = 109
        Width = 260
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 3
      end
      object GroupBox1: TGroupBox
        Left = 264
        Top = 24
        Width = 505
        Height = 66
        Caption = 'Documenta'#231#227'o'
        TabOrder = 5
        object Label22: TLabel
          Left = 120
          Top = 17
          Width = 78
          Height = 13
          Caption = 'Insc. Estadual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 14
          Top = 17
          Width = 27
          Height = 13
          Caption = 'CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 210
          Top = 17
          Width = 83
          Height = 13
          Caption = 'Insc. Municipal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 300
          Top = 17
          Width = 48
          Height = 13
          Caption = 'Suframa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 404
          Top = 17
          Width = 62
          Height = 13
          Caption = 'CNAE Fiscal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdtInsc_Estadual: TEdit
          Left = 120
          Top = 33
          Width = 91
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          MaxLength = 20
          TabOrder = 1
          OnKeyPress = EdtInsc_EstadualKeyPress
        end
        object EdtCNPJ: TMaskEdit
          Left = 14
          Top = 33
          Width = 107
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditMask = '!99\.999\.999\/9999\-99;0'
          MaxLength = 18
          TabOrder = 0
          OnExit = EdtCNPJExit
        end
        object EdtInsc_Municipal: TEdit
          Left = 210
          Top = 33
          Width = 91
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          MaxLength = 20
          TabOrder = 2
          OnKeyPress = EdtInsc_MunicipalKeyPress
        end
        object EdtSuframa: TEdit
          Left = 300
          Top = 33
          Width = 105
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          MaxLength = 30
          TabOrder = 3
          OnKeyPress = EdtInsc_MunicipalKeyPress
        end
        object EdtCNAE: TEdit
          Left = 404
          Top = 33
          Width = 91
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 4
          OnKeyPress = EdtInsc_MunicipalKeyPress
        end
      end
      object EdtProprietario: TEdit
        Left = 0
        Top = 146
        Width = 260
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 4
      end
      object RGRegime_Tributario: TRadioGroup
        Left = 264
        Top = 92
        Width = 305
        Height = 72
        Caption = 'Regime Tribut'#225'rio'
        ItemIndex = 0
        Items.Strings = (
          'Simples Nacional'
          'Simples Nacional - excesso de sublimite de receita bruta'
          'Regime Normal')
        TabOrder = 6
      end
      object RGEnquadramento: TRadioGroup
        Left = 575
        Top = 92
        Width = 106
        Height = 72
        Caption = 'Enquadramento'
        ItemIndex = 0
        Items.Strings = (
          'E.N'
          'E.P.P'
          'M.E')
        TabOrder = 7
      end
      object EdtAliquota: TEdit
        Left = 684
        Top = 109
        Width = 73
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        MaxLength = 5
        TabOrder = 8
        OnKeyPress = EdtAliquotaKeyPress
      end
      object EdtCusto_OP: TEdit
        Left = 684
        Top = 146
        Width = 73
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 9
        OnKeyPress = EdtCusto_OPKeyPress
      end
      object PageControl2: TPageControl
        Left = 0
        Top = 169
        Width = 763
        Height = 224
        Cursor = crHandPoint
        ActivePage = TabSheet3
        Style = tsFlatButtons
        TabOrder = 10
        object TabSheet2: TTabSheet
          Caption = 'Dados da Empresa'
          object Label11: TLabel
            Left = 255
            Top = 90
            Width = 49
            Height = 13
            Caption = 'Telefone'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 0
            Top = 90
            Width = 45
            Height = 13
            Caption = 'Contato'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 406
            Top = 1
            Width = 79
            Height = 13
            Caption = 'Complemento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 560
            Top = 45
            Width = 22
            Height = 13
            Caption = 'Site'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label47: TLabel
            Left = 498
            Top = 90
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
          object Label8: TLabel
            Left = 417
            Top = 90
            Width = 20
            Height = 13
            Caption = 'Fax'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 336
            Top = 90
            Width = 62
            Height = 13
            Caption = 'T. Empresa'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblEmail: TLabel
            Left = 0
            Top = 132
            Width = 34
            Height = 13
            Caption = 'E-Mail'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 256
            Top = 45
            Width = 38
            Height = 13
            Caption = 'Cidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 0
            Top = 45
            Width = 31
            Height = 13
            Caption = 'Setor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 0
            Top = 1
            Width = 52
            Height = 13
            Caption = 'Endere'#231'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblUF: TLabel
            Left = 512
            Top = 45
            Width = 14
            Height = 13
            Caption = 'UF'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 334
            Top = 1
            Width = 20
            Height = 13
            Caption = 'CEP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblNumero: TLabel
            Left = 286
            Top = 1
            Width = 13
            Height = 13
            Caption = 'N'#186
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label35: TLabel
            Left = 169
            Top = 132
            Width = 35
            Height = 13
            Caption = 'Senha'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label36: TLabel
            Left = 309
            Top = 132
            Width = 31
            Height = 13
            Caption = 'SMTP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label37: TLabel
            Left = 417
            Top = 132
            Width = 31
            Height = 13
            Caption = 'Porta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object MmoObservacoes: TMemo
            Left = 498
            Top = 107
            Width = 231
            Height = 27
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            MaxLength = 200
            ScrollBars = ssVertical
            TabOrder = 14
            OnKeyPress = MmoObservacoesKeyPress
          end
          object MEdtTelefone_Contato: TMaskEdit
            Left = 255
            Top = 107
            Width = 82
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!\(99\)9999-9999;1;_'
            MaxLength = 13
            TabOrder = 11
            Text = '(  )    -    '
          end
          object EdtContato: TEdit
            Left = 0
            Top = 107
            Width = 256
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            MaxLength = 50
            TabOrder = 10
          end
          object EdtComplemento: TEdit
            Left = 406
            Top = 18
            Width = 173
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            MaxLength = 50
            TabOrder = 3
          end
          object EdtSite: TEdit
            Left = 560
            Top = 62
            Width = 184
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            MaxLength = 50
            TabOrder = 9
          end
          object MEdtFax: TMaskEdit
            Left = 417
            Top = 107
            Width = 82
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!\(99\)9999-9999;1;_'
            MaxLength = 13
            TabOrder = 13
            Text = '(  )    -    '
          end
          object MEdtTelefone: TMaskEdit
            Left = 336
            Top = 107
            Width = 82
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!\(99\)9999-9999;1;_'
            MaxLength = 13
            TabOrder = 12
            Text = '(  )    -    '
          end
          object EdtEmail: TEdit
            Left = 0
            Top = 149
            Width = 170
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            MaxLength = 100
            TabOrder = 15
          end
          object EdtCodigo_Cidade: TEdit
            Left = 256
            Top = 62
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
            OnDblClick = EdtCodigo_CidadeDblClick
            OnKeyDown = EdtCodigo_CidadeKeyDown
            OnKeyPress = EdtCodigo_CidadeKeyPress
          end
          object EdtCodigo_Setor: TEdit
            Left = 0
            Top = 62
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
            OnDblClick = EdtCodigo_SetorDblClick
            OnKeyDown = EdtCodigo_SetorKeyDown
            OnKeyPress = EdtCodigo_SetorKeyPress
          end
          object EdtUF: TEdit
            Left = 513
            Top = 62
            Width = 48
            Height = 17
            TabStop = False
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 8
            OnKeyPress = EdtUFKeyPress
          end
          object EdtCidade: TEdit
            Left = 316
            Top = 62
            Width = 197
            Height = 17
            TabStop = False
            BevelEdges = [beTop, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            ParentShowHint = False
            ReadOnly = True
            ShowHint = False
            TabOrder = 7
            OnKeyPress = EdtCidadeKeyPress
          end
          object EdtSetor: TEdit
            Left = 60
            Top = 62
            Width = 197
            Height = 17
            TabStop = False
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            ParentShowHint = False
            ReadOnly = True
            ShowHint = False
            TabOrder = 5
            OnKeyPress = EdtSetorKeyPress
          end
          object EdtCEP: TEdit
            Left = 333
            Top = 18
            Width = 74
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 2
          end
          object EdtNumero: TEdit
            Left = 286
            Top = 18
            Width = 48
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 5
            TabOrder = 1
          end
          object EdtEndereco: TEdit
            Left = 0
            Top = 18
            Width = 287
            Height = 17
            TabStop = False
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
          end
          object EdtSenha: TEdit
            Left = 169
            Top = 149
            Width = 141
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            MaxLength = 30
            PasswordChar = '*'
            TabOrder = 16
          end
          object EdtSMTP: TEdit
            Left = 309
            Top = 149
            Width = 109
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            MaxLength = 50
            TabOrder = 17
          end
          object EdtPorta: TEdit
            Left = 417
            Top = 149
            Width = 109
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            MaxLength = 10
            TabOrder = 18
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'Dados do Contabilista'
          ImageIndex = 1
          object Label17: TLabel
            Left = 0
            Top = 2
            Width = 32
            Height = 13
            Caption = 'Nome'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label20: TLabel
            Left = 430
            Top = 38
            Width = 79
            Height = 13
            Caption = 'Complemento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label23: TLabel
            Left = 0
            Top = 38
            Width = 52
            Height = 13
            Caption = 'Endere'#231'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label24: TLabel
            Left = 358
            Top = 38
            Width = 20
            Height = 13
            Caption = 'CEP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label26: TLabel
            Left = 310
            Top = 38
            Width = 13
            Height = 13
            Caption = 'N'#186
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label27: TLabel
            Left = 222
            Top = 156
            Width = 49
            Height = 13
            Caption = 'Telefone'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label28: TLabel
            Left = 0
            Top = 156
            Width = 34
            Height = 13
            Caption = 'E-Mail'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label29: TLabel
            Left = 0
            Top = 76
            Width = 31
            Height = 13
            Caption = 'Setor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label30: TLabel
            Left = 0
            Top = 114
            Width = 38
            Height = 13
            Caption = 'Cidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label31: TLabel
            Left = 257
            Top = 114
            Width = 14
            Height = 13
            Caption = 'UF'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtNome_Contador: TEdit
            Left = 0
            Top = 17
            Width = 311
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 0
          end
          object GroupBox2: TGroupBox
            Left = 322
            Top = 86
            Width = 340
            Height = 62
            Caption = 'Documenta'#231#227'o'
            TabOrder = 10
            object Label18: TLabel
              Left = 16
              Top = 17
              Width = 27
              Height = 13
              Caption = 'CNPJ'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label21: TLabel
              Left = 122
              Top = 17
              Width = 20
              Height = 13
              Caption = 'CPF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label19: TLabel
              Left = 224
              Top = 17
              Width = 22
              Height = 13
              Caption = 'CRC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object MEdtCNPJ_Contador: TMaskEdit
              Left = 16
              Top = 32
              Width = 107
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99\.999\.999\/9999\-99;0'
              MaxLength = 18
              TabOrder = 0
              OnExit = EdtCNPJExit
            end
            object MEdtCPF_Contador: TMaskEdit
              Left = 122
              Top = 32
              Width = 103
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!999\.999\.999\-99;0;_'
              MaxLength = 14
              TabOrder = 1
            end
            object EdtCRC: TEdit
              Left = 224
              Top = 32
              Width = 91
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 2
              OnKeyPress = EdtInsc_EstadualKeyPress
            end
          end
          object EdtComplemento_Contador: TEdit
            Left = 430
            Top = 55
            Width = 173
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 50
            TabOrder = 4
          end
          object EdtCEP_Contador: TEdit
            Left = 357
            Top = 55
            Width = 74
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 3
          end
          object EdtNumero_Contador: TEdit
            Left = 310
            Top = 55
            Width = 48
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 5
            TabOrder = 2
          end
          object EdtEndereco_Contador: TEdit
            Left = 0
            Top = 55
            Width = 311
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 200
            ParentShowHint = False
            ShowHint = False
            TabOrder = 1
          end
          object MEdtTelefone_Contador: TMaskEdit
            Left = 222
            Top = 170
            Width = 82
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!\(99\)9999-9999;1;_'
            MaxLength = 13
            TabOrder = 12
            Text = '(  )    -    '
          end
          object EdtEmail_Contador: TEdit
            Left = 0
            Top = 170
            Width = 223
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            MaxLength = 100
            TabOrder = 11
          end
          object EdtCodigo_Setor_Contador: TEdit
            Left = 0
            Top = 93
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
            TabOrder = 5
            OnDblClick = EdtCodigo_Setor_ContadorDblClick
            OnKeyDown = EdtCodigo_Setor_ContadorKeyDown
            OnKeyPress = EdtCodigo_Setor_ContadorKeyPress
          end
          object EdtSetor_Contador: TEdit
            Left = 60
            Top = 93
            Width = 245
            Height = 17
            TabStop = False
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            ParentShowHint = False
            ReadOnly = True
            ShowHint = False
            TabOrder = 6
            OnKeyPress = EdtSetor_ContadorKeyPress
          end
          object EdtCodigo_Cidade_Contador: TEdit
            Left = 0
            Top = 131
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
            TabOrder = 7
            OnDblClick = EdtCodigo_Cidade_ContadorDblClick
            OnKeyDown = EdtCodigo_Cidade_ContadorKeyDown
            OnKeyPress = EdtCodigo_Cidade_ContadorKeyPress
          end
          object EdtCidade_Contador: TEdit
            Left = 60
            Top = 131
            Width = 197
            Height = 17
            TabStop = False
            BevelEdges = [beTop, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            ParentShowHint = False
            ReadOnly = True
            ShowHint = False
            TabOrder = 8
            OnKeyPress = EdtCidade_ContadorKeyPress
          end
          object EdtUF_Contador: TEdit
            Left = 257
            Top = 131
            Width = 48
            Height = 17
            TabStop = False
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            ReadOnly = True
            TabOrder = 9
            OnKeyPress = EdtUF_ContadorKeyPress
          end
        end
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 420
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
