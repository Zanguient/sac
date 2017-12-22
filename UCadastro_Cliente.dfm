object FrmCadastro_Cliente: TFrmCadastro_Cliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Cliente'
  ClientHeight = 490
  ClientWidth = 952
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
  Scaled = False
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
    Width = 827
    Height = 490
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
        Width = 121
        Height = 13
        Caption = 'Nome/Nome Fantasia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 272
        Top = 59
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
        Top = 74
        Width = 273
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 4
      end
      object CBTipo: TCheckBox
        Left = 168
        Top = 21
        Width = 97
        Height = 17
        Caption = 'Fisico'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = CBTipoClick
      end
      object EdtRazao_Social: TEdit
        Left = 272
        Top = 74
        Width = 265
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 5
        OnEnter = EdtRazao_SocialEnter
      end
      object GroupBox2: TGroupBox
        Left = 372
        Top = 97
        Width = 434
        Height = 66
        Caption = 'Cliente Jur'#237'dico'
        TabOrder = 7
        object Label22: TLabel
          Left = 122
          Top = 17
          Width = 50
          Height = 13
          Caption = 'Insc. Est.'
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
        object Label26: TLabel
          Left = 302
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
        object Label34: TLabel
          Left = 212
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
        object EdtInsc_Estadual: TEdit
          Left = 122
          Top = 33
          Width = 91
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          MaxLength = 15
          TabOrder = 1
          OnKeyPress = EdtInsc_EstadualKeyPress
        end
        object EdtCNPJ: TMaskEdit
          Left = 14
          Top = 33
          Width = 109
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditMask = '!99\.999\.999\/9999\-99;0'
          MaxLength = 18
          TabOrder = 0
          OnExit = EdtCNPJExit
        end
        object EdtSuframa: TEdit
          Left = 301
          Top = 33
          Width = 91
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          MaxLength = 20
          TabOrder = 3
        end
        object EdtInsc_Municipal: TEdit
          Left = 212
          Top = 33
          Width = 91
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          MaxLength = 15
          TabOrder = 2
        end
      end
      object PageControl2: TPageControl
        Left = 0
        Top = 169
        Width = 818
        Height = 290
        Cursor = crHandPoint
        ActivePage = TabSheet4
        Style = tsFlatButtons
        TabOrder = 8
        object TabSheet2: TTabSheet
          Caption = 'Inf. Principais'
          object LblNumero: TLabel
            Left = 300
            Top = 0
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
          object Label13: TLabel
            Left = 348
            Top = 0
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
          object LblUF: TLabel
            Left = 255
            Top = 89
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
          object Label23: TLabel
            Left = 401
            Top = 0
            Width = 114
            Height = 13
            Caption = 'Ponto de Referencia'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 0
            Top = 0
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
          object Label3: TLabel
            Left = 0
            Top = 44
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
          object Label4: TLabel
            Left = 0
            Top = 89
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
          object LblEmail: TLabel
            Left = 243
            Top = 44
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
          object Label5: TLabel
            Left = 0
            Top = 134
            Width = 34
            Height = 13
            Caption = 'Grupo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblProfissao: TLabel
            Left = 246
            Top = 134
            Width = 52
            Height = 13
            Caption = 'Profiss'#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 540
            Top = 134
            Width = 64
            Height = 13
            Caption = 'Estado Civil'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblData_Nasc: TLabel
            Left = 437
            Top = 134
            Width = 96
            Height = 13
            Caption = 'Data Nascimento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 0
            Top = 179
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
          object Label8: TLabel
            Left = 81
            Top = 179
            Width = 39
            Height = 13
            Caption = 'Celular'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 162
            Top = 179
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
          object Label10: TLabel
            Left = 384
            Top = 179
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
          object Label11: TLabel
            Left = 469
            Top = 44
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
          object Label24: TLabel
            Left = 566
            Top = 0
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
          object Label40: TLabel
            Left = 302
            Top = 89
            Width = 90
            Height = 13
            Caption = 'Tabela de Pre'#231'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtEndereco: TEdit
            Left = 0
            Top = 17
            Width = 301
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 200
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            OnExit = EdtEnderecoExit
            OnKeyUp = EdtEnderecoKeyUp
          end
          object EdtNumero: TEdit
            Left = 300
            Top = 17
            Width = 48
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            MaxLength = 5
            TabOrder = 1
          end
          object EdtCEP: TEdit
            Left = 347
            Top = 17
            Width = 55
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 2
          end
          object EdtSetor: TEdit
            Left = 60
            Top = 61
            Width = 184
            Height = 17
            TabStop = False
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 40
            ParentShowHint = False
            ReadOnly = True
            ShowHint = False
            TabOrder = 6
            OnExit = EdtSetorExit
            OnKeyPress = EdtSetorKeyPress
            OnKeyUp = EdtSetorKeyUp
          end
          object EdtCidade: TEdit
            Left = 60
            Top = 106
            Width = 196
            Height = 17
            TabStop = False
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 30
            ParentShowHint = False
            ReadOnly = True
            ShowHint = False
            TabOrder = 10
            OnExit = EdtCidadeExit
            OnKeyPress = EdtCidadeKeyPress
            OnKeyUp = EdtCidadeKeyUp
          end
          object EdtUF: TEdit
            Left = 255
            Top = 106
            Width = 48
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 2
            TabOrder = 11
          end
          object EdtReferencia: TEdit
            Left = 401
            Top = 17
            Width = 166
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 70
            TabOrder = 3
          end
          object EdtCodigo_Setor: TEdit
            Left = 0
            Top = 61
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
            OnDblClick = EdtCodigo_SetorDblClick
            OnKeyDown = EdtCodigo_SetorKeyDown
            OnKeyPress = EdtCodigo_SetorKeyPress
          end
          object EdtCodigo_Cidade: TEdit
            Left = 0
            Top = 106
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
            OnDblClick = EdtCodigo_CidadeDblClick
            OnKeyDown = EdtCodigo_CidadeKeyDown
            OnKeyPress = EdtCodigo_CidadeKeyPress
          end
          object EdtEmail: TEdit
            Left = 243
            Top = 61
            Width = 227
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            MaxLength = 100
            TabOrder = 7
          end
          object EdtGrupo: TEdit
            Left = 60
            Top = 151
            Width = 187
            Height = 17
            TabStop = False
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ParentShowHint = False
            ReadOnly = True
            ShowHint = False
            TabOrder = 15
            OnKeyPress = EdtGrupoKeyPress
          end
          object EdtCodigo_Grupo: TEdit
            Left = 0
            Top = 151
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
            TabOrder = 14
            OnDblClick = EdtCodigo_GrupoDblClick
            OnKeyDown = EdtCodigo_GrupoKeyDown
            OnKeyPress = EdtCodigo_GrupoKeyPress
          end
          object EdtProfissao: TEdit
            Left = 246
            Top = 151
            Width = 192
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 30
            ParentShowHint = False
            ShowHint = False
            TabOrder = 16
          end
          object CmbEstado_Civil: TComboBox
            Left = 540
            Top = 151
            Width = 142
            Height = 21
            BevelInner = bvNone
            BevelKind = bkFlat
            CharCase = ecUpperCase
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 20
            ParentFont = False
            TabOrder = 18
            Items.Strings = (
              'SOLTEIRO (A)'
              'CASADO (A)'
              'NOIVO (A)'
              'DIVORCIADO (A)'
              'VI'#218'VO (A)'
              'OUTROS (A)')
          end
          object MEdtData_Nascimento: TMaskEdit
            Left = 437
            Top = 151
            Width = 94
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!99/99/9999;1;_'
            MaxLength = 10
            TabOrder = 17
            Text = '  /  /    '
            OnExit = MEdtData_NascimentoExit
          end
          object MEdtTelefone: TMaskEdit
            Left = 0
            Top = 196
            Width = 82
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!\(99\)99999-9999;1;_'
            MaxLength = 14
            TabOrder = 19
            Text = '(  )     -    '
          end
          object MEdtCelular: TMaskEdit
            Left = 81
            Top = 196
            Width = 82
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!\(99\)99999-9999;1;_'
            MaxLength = 14
            TabOrder = 20
            Text = '(  )     -    '
          end
          object EdtContato: TEdit
            Left = 162
            Top = 196
            Width = 223
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 21
          end
          object MEdtTelefone_Contato: TMaskEdit
            Left = 384
            Top = 196
            Width = 83
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!\(99\)99999-9999;1;_'
            MaxLength = 14
            TabOrder = 22
            Text = '(  )     -    '
          end
          object EdtSite: TEdit
            Left = 469
            Top = 61
            Width = 222
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            MaxLength = 50
            TabOrder = 8
          end
          object EdtComplemento: TEdit
            Left = 566
            Top = 17
            Width = 125
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 50
            TabOrder = 4
          end
          object EdtTabela_Preco: TEdit
            Left = 367
            Top = 106
            Width = 149
            Height = 17
            TabStop = False
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 13
            OnKeyPress = EdtTabela_PrecoKeyPress
          end
          object EdtCodigo_Tabela_Preco: TEdit
            Left = 302
            Top = 106
            Width = 65
            Height = 17
            BevelEdges = [beLeft, beTop, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            Color = clMenu
            TabOrder = 12
            OnDblClick = EdtCodigo_Tabela_PrecoDblClick
            OnKeyDown = EdtCodigo_Tabela_PrecoKeyDown
            OnKeyPress = EdtCodigo_Tabela_PrecoKeyPress
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Endere'#231'os'
          ImageIndex = 2
          object Label27: TLabel
            Left = 257
            Top = 0
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
          object Label29: TLabel
            Left = 305
            Top = 0
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
          object Label30: TLabel
            Left = 0
            Top = 0
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
          object Label31: TLabel
            Left = 735
            Top = -23
            Width = 79
            Height = 13
            Caption = 'Tipo Endere'#231'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label32: TLabel
            Left = 359
            Top = 0
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
          object Label33: TLabel
            Left = 399
            Top = 40
            Width = 79
            Height = 13
            Caption = 'Tipo Endere'#231'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label39: TLabel
            Left = 3
            Top = 40
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
          object lbl1: TLabel
            Left = 184
            Top = 40
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
          object EdtEndereco_Outros: TEdit
            Left = 0
            Top = 17
            Width = 261
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 200
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            OnExit = EdtEndereco_OutrosExit
            OnKeyPress = EdtEndereco_OutrosKeyPress
            OnKeyUp = EdtEndereco_OutrosKeyUp
          end
          object EdtNumero_Outros: TEdit
            Left = 257
            Top = 17
            Width = 48
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            MaxLength = 5
            TabOrder = 1
          end
          object EdtCEP_Outros: TEdit
            Left = 304
            Top = 17
            Width = 55
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 10
            TabOrder = 2
          end
          object DBGrid1: TDBGrid
            Left = 0
            Top = 80
            Width = 783
            Height = 178
            Hint = 'Para excluir, selecione um registro e pressione Delete'
            DataSource = DataSource1
            DrawingStyle = gdsGradient
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 10
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = DBGrid1DrawColumnCell
            OnDblClick = DBGrid1DblClick
            OnKeyDown = DBGrid1KeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'Codigo_Cliente'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'Codigo_Endereco'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'Endereco'
                Title.Caption = 'Endere'#231'o'
                Width = 256
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Numero'
                Title.Caption = 'N'#250'mero'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CEP'
                Width = 66
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Complemento'
                Width = 152
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NomeCidade'
                Title.Caption = 'Cidade'
                Width = 155
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Setor'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'SetorLookUp'
                Title.Caption = 'Setor'
                Width = 189
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Tipo_Endereco'
                Title.Caption = 'Tipo'
                Width = 136
                Visible = True
              end>
          end
          object EdtTipo_Endereco: TEdit
            Left = 398
            Top = 57
            Width = 95
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 30
            TabOrder = 8
          end
          object EdtComplemento_Outros: TEdit
            Left = 358
            Top = 17
            Width = 135
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 30
            TabOrder = 3
          end
          object EdtSetor_Outros: TEdit
            Left = 63
            Top = 57
            Width = 122
            Height = 17
            TabStop = False
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ParentShowHint = False
            ReadOnly = True
            ShowHint = False
            TabOrder = 5
            OnExit = EdtSetor_OutrosExit
            OnKeyPress = EdtSetor_OutrosKeyPress
            OnKeyUp = EdtSetor_OutrosKeyUp
          end
          object EdtCodigo_Setor_Outros: TEdit
            Left = 3
            Top = 57
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
            OnKeyDown = EdtCodigo_Setor_OutrosKeyDown
            OnKeyPress = EdtCodigo_Setor_OutrosKeyPress
          end
          object BitBtn1: TBitBtn
            Left = 499
            Top = 55
            Width = 67
            Height = 21
            Hint = 
              'Clique para inserir o produto selecionado.'#13#10'Os campos que podem ' +
              'ser editados s'#227'o: descri'#231#227'o do produto, CFOP, quantidade e valor' +
              ' unit'#225'rio.'
            Caption = 'Inserir'
            Glyph.Data = {
              3E020000424D3E0200000000000036000000280000000D0000000D0000000100
              18000000000008020000C40E0000C40E00000000000000000000FFFFFF229222
              1C8F1C23912324932422972220A0201AA81A17AA1713AC130DAA0D169F16FFFF
              FF0018A5181CA91C29AE292EB02E2FB32F2CB62C22BE221BCB1B1AD11A10D410
              07D10700BE000A970A0021B2212CB62C38BA383EBC3E39BC3954CA54D0F2D06B
              E66B13DE131AE41A0DE10D05D1050CA80C002AB52A38BA3845BE4549BF4942C0
              425BCD5BEBF9EBFDFFFD5CEB5C11E61114E5140BD40B13AC130035B83543BE43
              47BE4749BF4946C0463BC13B4ED14ED8F7D8FFFFFF55EB5508DE0814D11418AA
              180042BD4252C35278CF787FD37F7BD17B77D37764D46478E078FFFFFFFBFEFB
              5EDE5E1CC51C22A422004CC04C57C457FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF20BC20289F280054C35467CA6785D48586D4867FD3
              7F77D07760C96075D275FFFFFFFBFEFB64CE6427B5272B9B2B005CC65C76CF76
              6BCB6B60C76055C55542BD424DC14DD7F1D7FFFFFF5CC85C1CB31C2FB32F2C97
              2C0066C96683D3837BD17B6FCD6F5DC75D69CB69EAF8EAFCFEFC66C96624B324
              32B83232B1322C972C0071CC7197DB978DD78D7CD07C6BCB6B79D079DCF3DC86
              D4863CBA3C45BE453CBA3C32B1322693260077CF77A1DEA195DA9582D38278D0
              786FCD6F63C8635BC55B5BC55B51C15142BD422EB02E20912000FFFFFF7BD17B
              6DCC6D61C86159C55955C55552C3524CC04C47BE4740BC4035B83532B032FFFF
              FF00}
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            OnClick = BitBtn1Click
          end
          object txtEdtCidadeOutros: TEdit
            Left = 244
            Top = 57
            Width = 155
            Height = 17
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 200
            ParentShowHint = False
            ReadOnly = True
            ShowHint = False
            TabOrder = 7
            OnKeyPress = txtEdtCidadeOutrosKeyPress
          end
          object txtEdtCodCidadeOutros: TEdit
            Left = 184
            Top = 57
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
            OnKeyDown = txtEdtCodCidadeOutrosKeyDown
            OnKeyPress = txtEdtCodCidadeOutrosKeyPress
          end
        end
        object TabSheet7: TTabSheet
          Caption = 'Telefones'
          ImageIndex = 5
          object Label41: TLabel
            Left = 0
            Top = 2
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
          object Label42: TLabel
            Left = 81
            Top = 2
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
          object DBGrid4: TDBGrid
            Left = 0
            Top = 34
            Width = 293
            Height = 225
            Hint = 'Para excluir, selecione um registro e pressione Delete'
            DataSource = DataSource4
            DrawingStyle = gdsGradient
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = DBGrid4DrawColumnCell
            OnDblClick = DBGrid4DblClick
            OnKeyDown = DBGrid4KeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'Codigo_Cliente'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'Telefone'
                Width = 107
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Tipo'
                Width = 105
                Visible = True
              end>
          end
          object MEdtTelefone_Adicional: TMaskEdit
            Left = 0
            Top = 19
            Width = 82
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!\(99\)99999-9999;1;_'
            MaxLength = 14
            TabOrder = 0
            Text = '(  )     -    '
          end
          object CmbTipo_Telefone: TComboBox
            Left = 81
            Top = 15
            Width = 142
            Height = 21
            BevelInner = bvNone
            BevelKind = bkFlat
            CharCase = ecUpperCase
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 20
            ParentFont = False
            TabOrder = 1
            Items.Strings = (
              'PESSOAL'
              'RESIDENCIAL'
              'COMERCIAL'
              'COBRAN'#199'A'
              'ENTREGA'
              'OUTROS')
          end
          object BitBtn4: TBitBtn
            Left = 226
            Top = 14
            Width = 67
            Height = 20
            Hint = 
              'Clique para inserir o produto selecionado.'#13#10'Os campos que podem ' +
              'ser editados s'#227'o: descri'#231#227'o do produto, CFOP, quantidade e valor' +
              ' unit'#225'rio.'
            Caption = 'Inserir'
            Glyph.Data = {
              3E020000424D3E0200000000000036000000280000000D0000000D0000000100
              18000000000008020000C40E0000C40E00000000000000000000FFFFFF229222
              1C8F1C23912324932422972220A0201AA81A17AA1713AC130DAA0D169F16FFFF
              FF0018A5181CA91C29AE292EB02E2FB32F2CB62C22BE221BCB1B1AD11A10D410
              07D10700BE000A970A0021B2212CB62C38BA383EBC3E39BC3954CA54D0F2D06B
              E66B13DE131AE41A0DE10D05D1050CA80C002AB52A38BA3845BE4549BF4942C0
              425BCD5BEBF9EBFDFFFD5CEB5C11E61114E5140BD40B13AC130035B83543BE43
              47BE4749BF4946C0463BC13B4ED14ED8F7D8FFFFFF55EB5508DE0814D11418AA
              180042BD4252C35278CF787FD37F7BD17B77D37764D46478E078FFFFFFFBFEFB
              5EDE5E1CC51C22A422004CC04C57C457FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFF20BC20289F280054C35467CA6785D48586D4867FD3
              7F77D07760C96075D275FFFFFFFBFEFB64CE6427B5272B9B2B005CC65C76CF76
              6BCB6B60C76055C55542BD424DC14DD7F1D7FFFFFF5CC85C1CB31C2FB32F2C97
              2C0066C96683D3837BD17B6FCD6F5DC75D69CB69EAF8EAFCFEFC66C96624B324
              32B83232B1322C972C0071CC7197DB978DD78D7CD07C6BCB6B79D079DCF3DC86
              D4863CBA3C45BE453CBA3C32B1322693260077CF77A1DEA195DA9582D38278D0
              786FCD6F63C8635BC55B5BC55B51C15142BD422EB02E20912000FFFFFF7BD17B
              6DCC6D61C86159C55955C55552C3524CC04C47BE4740BC4035B83532B032FFFF
              FF00}
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = BitBtn4Click
          end
        end
        object TabSheet6: TTabSheet
          Caption = 'Dados adicionais'
          ImageIndex = 4
          object PageControl3: TPageControl
            Left = -2
            Top = 0
            Width = 810
            Height = 259
            Cursor = crHandPoint
            ActivePage = TabSheet8
            Style = tsFlatButtons
            TabOrder = 0
            object TabSheet8: TTabSheet
              Caption = 'Insc. Estadual'
              object Label38: TLabel
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
              object Label37: TLabel
                Left = 241
                Top = 2
                Width = 52
                Height = 13
                Caption = 'Inscri'#231#227'o'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label12: TLabel
                Left = 574
                Top = 2
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
              object Label28: TLabel
                Left = 622
                Top = 2
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
              object Label52: TLabel
                Left = 342
                Top = 2
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
              object Label53: TLabel
                Left = 676
                Top = 2
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
              object Label54: TLabel
                Left = 0
                Top = 38
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
              object Label55: TLabel
                Left = 181
                Top = 38
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
              object EdtEmpresa: TEdit
                Left = 0
                Top = 19
                Width = 242
                Height = 16
                BevelInner = bvNone
                BevelKind = bkFlat
                BorderStyle = bsNone
                CharCase = ecUpperCase
                MaxLength = 70
                TabOrder = 0
              end
              object DBGrid3: TDBGrid
                Left = 0
                Top = 71
                Width = 800
                Height = 157
                Hint = 'Para excluir, selecione um registro e pressione Delete'
                DataSource = DataSource3
                DrawingStyle = gdsGradient
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
                ParentShowHint = False
                ShowHint = True
                TabOrder = 11
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDrawColumnCell = DBGrid3DrawColumnCell
                OnKeyDown = DBGrid3KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'Codigo_Cliente'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'Empresa'
                    Title.Caption = 'Nome'
                    Width = 203
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Inscricao'
                    Title.Caption = 'Inscri'#231#227'o'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Endereco'
                    Title.Caption = 'Endere'#231'o'
                    Width = 201
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Numero'
                    Title.Caption = 'N'#186
                    Width = 45
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Setor'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'SetorLookUp'
                    Title.Caption = 'Setor'
                    Width = 180
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CidadeLookUp'
                    Title.Caption = 'Cidade'
                    Width = 176
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CEP'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'Complemento'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Codigo_Setor'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'Codigo_Cidade'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'Codigo_Registro'
                    Visible = False
                  end>
              end
              object EdtInscricao_Empresa: TEdit
                Left = 241
                Top = 19
                Width = 102
                Height = 16
                BevelInner = bvNone
                BevelKind = bkFlat
                BorderStyle = bsNone
                CharCase = ecUpperCase
                MaxLength = 20
                TabOrder = 1
              end
              object EdtEndereco_DAC: TEdit
                Left = 342
                Top = 19
                Width = 233
                Height = 16
                BevelInner = bvNone
                BevelKind = bkFlat
                BorderStyle = bsNone
                CharCase = ecUpperCase
                MaxLength = 200
                ParentShowHint = False
                ShowHint = False
                TabOrder = 2
                OnExit = EdtEndereco_OutrosExit
                OnKeyPress = EdtEndereco_OutrosKeyPress
                OnKeyUp = EdtEndereco_OutrosKeyUp
              end
              object EdtNumero_DAC: TEdit
                Left = 574
                Top = 19
                Width = 48
                Height = 16
                BevelInner = bvNone
                BevelKind = bkFlat
                BorderStyle = bsNone
                MaxLength = 5
                TabOrder = 3
              end
              object EdtCEP_DAC: TEdit
                Left = 621
                Top = 19
                Width = 55
                Height = 16
                BevelInner = bvNone
                BevelKind = bkFlat
                BorderStyle = bsNone
                CharCase = ecUpperCase
                MaxLength = 10
                TabOrder = 4
              end
              object EdtComplemento_DAC: TEdit
                Left = 675
                Top = 19
                Width = 108
                Height = 16
                BevelInner = bvNone
                BevelKind = bkFlat
                BorderStyle = bsNone
                CharCase = ecUpperCase
                MaxLength = 30
                TabOrder = 5
              end
              object EdtSetor_DAC: TEdit
                Left = 60
                Top = 55
                Width = 122
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
                OnKeyPress = EdtSetor_DACKeyPress
              end
              object EdtCodigo_Setor_DAC: TEdit
                Left = 0
                Top = 55
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
                OnKeyDown = EdtCodigo_Setor_DACKeyDown
                OnKeyPress = EdtCodigo_Setor_DACKeyPress
              end
              object EdtCidade_DAC: TEdit
                Left = 241
                Top = 55
                Width = 121
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
                OnKeyPress = EdtCidade_DACKeyPress
              end
              object EdtCodigo_Cidade_DAC: TEdit
                Left = 181
                Top = 55
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
                OnKeyDown = EdtCodigo_Cidade_DACKeyDown
                OnKeyPress = EdtCodigo_Cidade_DACKeyPress
              end
              object BitBtn2: TBitBtn
                Left = 368
                Top = 50
                Width = 67
                Height = 20
                Hint = 
                  'Clique para inserir o produto selecionado.'#13#10'Os campos que podem ' +
                  'ser editados s'#227'o: descri'#231#227'o do produto, CFOP, quantidade e valor' +
                  ' unit'#225'rio.'
                Caption = 'Inserir'
                Glyph.Data = {
                  3E020000424D3E0200000000000036000000280000000D0000000D0000000100
                  18000000000008020000C40E0000C40E00000000000000000000FFFFFF229222
                  1C8F1C23912324932422972220A0201AA81A17AA1713AC130DAA0D169F16FFFF
                  FF0018A5181CA91C29AE292EB02E2FB32F2CB62C22BE221BCB1B1AD11A10D410
                  07D10700BE000A970A0021B2212CB62C38BA383EBC3E39BC3954CA54D0F2D06B
                  E66B13DE131AE41A0DE10D05D1050CA80C002AB52A38BA3845BE4549BF4942C0
                  425BCD5BEBF9EBFDFFFD5CEB5C11E61114E5140BD40B13AC130035B83543BE43
                  47BE4749BF4946C0463BC13B4ED14ED8F7D8FFFFFF55EB5508DE0814D11418AA
                  180042BD4252C35278CF787FD37F7BD17B77D37764D46478E078FFFFFFFBFEFB
                  5EDE5E1CC51C22A422004CC04C57C457FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF20BC20289F280054C35467CA6785D48586D4867FD3
                  7F77D07760C96075D275FFFFFFFBFEFB64CE6427B5272B9B2B005CC65C76CF76
                  6BCB6B60C76055C55542BD424DC14DD7F1D7FFFFFF5CC85C1CB31C2FB32F2C97
                  2C0066C96683D3837BD17B6FCD6F5DC75D69CB69EAF8EAFCFEFC66C96624B324
                  32B83232B1322C972C0071CC7197DB978DD78D7CD07C6BCB6B79D079DCF3DC86
                  D4863CBA3C45BE453CBA3C32B1322693260077CF77A1DEA195DA9582D38278D0
                  786FCD6F63C8635BC55B5BC55B51C15142BD422EB02E20912000FFFFFF7BD17B
                  6DCC6D61C86159C55955C55552C3524CC04C47BE4740BC4035B83532B032FFFF
                  FF00}
                ParentShowHint = False
                ShowHint = True
                TabOrder = 10
                OnClick = BitBtn2Click
              end
            end
            object TabSheet12: TTabSheet
              Caption = 'Autorizados'
              ImageIndex = 2
              object Label50: TLabel
                Left = 3
                Top = 3
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
              object Label51: TLabel
                Left = 285
                Top = 3
                Width = 29
                Height = 13
                Caption = 'C.P.F.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object EdtNome_Autorizado: TEdit
                Left = 3
                Top = 15
                Width = 296
                Height = 16
                BevelInner = bvNone
                BevelKind = bkFlat
                BorderStyle = bsNone
                CharCase = ecUpperCase
                MaxLength = 100
                TabOrder = 0
              end
              object DBGrid5: TDBGrid
                Left = 3
                Top = 30
                Width = 486
                Height = 191
                Hint = 'Para excluir, selecione um registro e pressione Delete'
                DataSource = DataSource5
                DrawingStyle = gdsGradient
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDrawColumnCell = DBGrid5DrawColumnCell
                OnKeyDown = DBGrid5KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'Codigo'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'Codigo_Cliente'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'Nome_Autorizado'
                    Title.Caption = 'Nome'
                    Width = 317
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CPF_Autorizado'
                    Title.Caption = 'CPF'
                    Visible = True
                  end>
              end
              object EdtCPF_Autorizado: TEdit
                Left = 285
                Top = 15
                Width = 102
                Height = 16
                BevelInner = bvNone
                BevelKind = bkFlat
                BorderStyle = bsNone
                CharCase = ecUpperCase
                MaxLength = 20
                TabOrder = 1
              end
              object BitBtn3: TBitBtn
                Left = 389
                Top = 10
                Width = 67
                Height = 20
                Hint = 
                  'Clique para inserir o produto selecionado.'#13#10'Os campos que podem ' +
                  'ser editados s'#227'o: descri'#231#227'o do produto, CFOP, quantidade e valor' +
                  ' unit'#225'rio.'
                Caption = 'Inserir'
                Glyph.Data = {
                  3E020000424D3E0200000000000036000000280000000D0000000D0000000100
                  18000000000008020000C40E0000C40E00000000000000000000FFFFFF229222
                  1C8F1C23912324932422972220A0201AA81A17AA1713AC130DAA0D169F16FFFF
                  FF0018A5181CA91C29AE292EB02E2FB32F2CB62C22BE221BCB1B1AD11A10D410
                  07D10700BE000A970A0021B2212CB62C38BA383EBC3E39BC3954CA54D0F2D06B
                  E66B13DE131AE41A0DE10D05D1050CA80C002AB52A38BA3845BE4549BF4942C0
                  425BCD5BEBF9EBFDFFFD5CEB5C11E61114E5140BD40B13AC130035B83543BE43
                  47BE4749BF4946C0463BC13B4ED14ED8F7D8FFFFFF55EB5508DE0814D11418AA
                  180042BD4252C35278CF787FD37F7BD17B77D37764D46478E078FFFFFFFBFEFB
                  5EDE5E1CC51C22A422004CC04C57C457FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFF20BC20289F280054C35467CA6785D48586D4867FD3
                  7F77D07760C96075D275FFFFFFFBFEFB64CE6427B5272B9B2B005CC65C76CF76
                  6BCB6B60C76055C55542BD424DC14DD7F1D7FFFFFF5CC85C1CB31C2FB32F2C97
                  2C0066C96683D3837BD17B6FCD6F5DC75D69CB69EAF8EAFCFEFC66C96624B324
                  32B83232B1322C972C0071CC7197DB978DD78D7CD07C6BCB6B79D079DCF3DC86
                  D4863CBA3C45BE453CBA3C32B1322693260077CF77A1DEA195DA9582D38278D0
                  786FCD6F63C8635BC55B5BC55B51C15142BD422EB02E20912000FFFFFF7BD17B
                  6DCC6D61C86159C55955C55552C3524CC04C47BE4740BC4035B83532B032FFFF
                  FF00}
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnClick = BitBtn3Click
              end
            end
            object TabSheet9: TTabSheet
              Caption = 'Outros'
              ImageIndex = 1
              object Label43: TLabel
                Left = 0
                Top = 0
                Width = 17
                Height = 13
                Caption = 'Pai'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label44: TLabel
                Left = 0
                Top = 35
                Width = 24
                Height = 13
                Caption = 'M'#227'e'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label45: TLabel
                Left = 0
                Top = 71
                Width = 46
                Height = 13
                Caption = 'C'#244'njuge'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label46: TLabel
                Left = 257
                Top = 35
                Width = 72
                Height = 13
                Caption = 'Naturalidade'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label48: TLabel
                Left = 257
                Top = 71
                Width = 78
                Height = 13
                Caption = 'Nacionalidade'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label49: TLabel
                Left = 257
                Top = 0
                Width = 102
                Height = 13
                Caption = 'Grau de Instru'#231#227'o'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object EdtPai: TEdit
                Left = 0
                Top = 15
                Width = 237
                Height = 17
                BevelInner = bvNone
                BevelKind = bkFlat
                BorderStyle = bsNone
                CharCase = ecUpperCase
                MaxLength = 100
                TabOrder = 0
              end
              object EdtMae: TEdit
                Left = 0
                Top = 50
                Width = 237
                Height = 17
                BevelInner = bvNone
                BevelKind = bkFlat
                BorderStyle = bsNone
                CharCase = ecUpperCase
                MaxLength = 100
                TabOrder = 1
              end
              object EdtConjuge: TEdit
                Left = 0
                Top = 86
                Width = 237
                Height = 17
                BevelInner = bvNone
                BevelKind = bkFlat
                BorderStyle = bsNone
                CharCase = ecUpperCase
                MaxLength = 100
                TabOrder = 2
              end
              object EdtNaturalidade: TEdit
                Left = 257
                Top = 50
                Width = 237
                Height = 17
                BevelInner = bvNone
                BevelKind = bkFlat
                BorderStyle = bsNone
                CharCase = ecUpperCase
                MaxLength = 100
                TabOrder = 4
              end
              object EdtNacionalidade: TEdit
                Left = 257
                Top = 90
                Width = 237
                Height = 17
                BevelInner = bvNone
                BevelKind = bkFlat
                BorderStyle = bsNone
                CharCase = ecUpperCase
                MaxLength = 100
                TabOrder = 5
              end
              object EdtGrau_Instrucao: TEdit
                Left = 257
                Top = 15
                Width = 237
                Height = 17
                BevelInner = bvNone
                BevelKind = bkFlat
                BorderStyle = bsNone
                CharCase = ecUpperCase
                MaxLength = 100
                TabOrder = 3
              end
            end
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'Financeiro / Obs.:'
          ImageIndex = 1
          object Label14: TLabel
            Left = 0
            Top = 39
            Width = 96
            Height = 13
            Caption = 'Limite de Cr'#233'dito'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 102
            Top = 0
            Width = 90
            Height = 13
            Caption = 'Acima do Limite'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label17: TLabel
            Left = 102
            Top = 39
            Width = 85
            Height = 13
            Caption = 'Limite de Desc.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label18: TLabel
            Left = 470
            Top = 31
            Width = 90
            Height = 13
            Caption = 'Acima do Limite'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object Label47: TLabel
            Left = 0
            Top = 85
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
          object Label25: TLabel
            Left = 0
            Top = 0
            Width = 41
            Height = 13
            Caption = 'Cr'#233'dito'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtLimite_Credito: TEdit
            Left = 0
            Top = 56
            Width = 96
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
            OnExit = EdtLimite_CreditoExit
            OnKeyPress = EdtLimite_CreditoKeyPress
          end
          object CmbAcima_Limite_Credito: TComboBox
            Left = 102
            Top = 17
            Width = 141
            Height = 21
            BevelInner = bvNone
            BevelKind = bkFlat
            CharCase = ecUpperCase
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 30
            ParentFont = False
            TabOrder = 1
            Items.Strings = (
              'PERMITIR VENDA'
              'BLOQUEAR VENDA'
              'EXIBIR MENSAGEM DE ALERTA'
              'SOLICITAR ADM.')
          end
          object EdtLimite_Desconto: TEdit
            Left = 102
            Top = 56
            Width = 96
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ParentShowHint = False
            ShowHint = False
            TabOrder = 3
            OnExit = EdtLimite_DescontoExit
            OnKeyPress = EdtLimite_DescontoKeyPress
          end
          object CmbAcima_Limite_Desconto: TComboBox
            Left = 470
            Top = 50
            Width = 141
            Height = 21
            BevelInner = bvNone
            BevelKind = bkFlat
            CharCase = ecUpperCase
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            Visible = False
            Items.Strings = (
              'PERMITIR DESCONTO'
              'BLOQUEAR DESCONTO'
              'EXIBIR MENSAGEM DE ALERTA'
              'SOLICITAR ADM.')
          end
          object MmoObservacoes: TMemo
            Left = 0
            Top = 103
            Width = 763
            Height = 156
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            MaxLength = 800
            ScrollBars = ssVertical
            TabOrder = 4
            OnKeyPress = MmoObservacoesKeyPress
          end
          object EdtCredito: TEdit
            Left = 0
            Top = 17
            Width = 96
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            OnExit = EdtLimite_CreditoExit
            OnKeyPress = EdtLimite_CreditoKeyPress
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'Hist'#243'rico de Compras'
          ImageIndex = 3
          object Label35: TLabel
            Left = 88
            Top = 8
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
          object Label36: TLabel
            Left = 166
            Top = 8
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
          object MEdtData_Inicial: TMaskEdit
            Left = 88
            Top = 23
            Width = 79
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!99/99/9999;1;_'
            MaxLength = 10
            TabOrder = 1
            Text = '  /  /    '
            OnEnter = MEdtData_InicialEnter
            OnExit = MEdtData_InicialExit
          end
          object MEdtData_Final: TMaskEdit
            Left = 166
            Top = 23
            Width = 79
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!99/99/9999;1;_'
            MaxLength = 10
            TabOrder = 2
            Text = '  /  /    '
            OnEnter = MEdtData_FinalEnter
            OnExit = MEdtData_FinalExit
          end
          object RGTipo: TRadioGroup
            Left = 0
            Top = -1
            Width = 85
            Height = 42
            Caption = 'Tipo'
            ItemIndex = 1
            Items.Strings = (
              'Venda'
              'Or'#231'amento')
            TabOrder = 0
          end
          object cxgrd1: TcxGrid
            Left = 0
            Top = 42
            Width = 671
            Height = 217
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            LookAndFeel.NativeStyle = False
            object cxgrdbtblvwGrid1DBTableView1: TcxGridDBTableView
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
              FilterBox.Position = fpTop
              FilterBox.Visible = fvNever
              DataController.DataSource = DataSource2
              DataController.Filter.Active = True
              DataController.KeyFieldNames = 'Codigo'
              DataController.Summary.DefaultGroupSummaryItems = <
                item
                  Format = '#0.0,0'
                  Kind = skSum
                  Position = spFooter
                end>
              DataController.Summary.FooterSummaryItems = <
                item
                  Kind = skSum
                  FieldName = 'Total_Pedido'
                end>
              DataController.Summary.SummaryGroups = <>
              DateTimeHandling.DateFormat = 'DD/MM/YYYY'
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
              OptionsView.GroupFooterMultiSummaries = True
              OptionsView.GroupFooters = gfAlwaysVisible
              OptionsView.GroupSummaryLayout = gslAlignWithColumns
              OptionsView.Indicator = True
              Preview.Visible = True
              Styles.ContentEven = DM.cxStyle1
              Styles.Footer = DM.cxStyle2
              Styles.GroupSummary = DM.cxStyle2
              Styles.Header = DM.cxStyle2
              object cxgrdbclmnGrid1DBTableView1Codigo: TcxGridDBColumn
                Caption = 'C'#243'digo'
                DataBinding.FieldName = 'Codigo'
                Options.Editing = False
                Width = 41
              end
              object cxgrdbclmnGrid1DBTableView1N_Pedido: TcxGridDBColumn
                Caption = 'N'#186' Pedido'
                DataBinding.FieldName = 'N_Pedido'
                Options.Editing = False
                Width = 94
              end
              object cxgrdbclmnGrid1DBTableView1N_Pre_Venda: TcxGridDBColumn
                Caption = 'N'#186' Venda'
                DataBinding.FieldName = 'N_Pre_Venda'
                Options.Editing = False
                Width = 90
              end
              object cxgrdbclmnGrid1DBTableView1Total_Pedido: TcxGridDBColumn
                Caption = 'Total Pedido'
                DataBinding.FieldName = 'Total_Pedido'
                Options.Editing = False
                Width = 102
              end
              object cxgrdbclmnGrid1DBTableView1Data_Venda: TcxGridDBColumn
                Caption = 'Data Venda'
                DataBinding.FieldName = 'Data_Venda'
                Options.Editing = False
                Width = 87
              end
            end
            object cxgrd1TableView1: TcxGridTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              object cxgrd1TableView1Column1: TcxGridColumn
              end
            end
            object cxgrdbtblvwcxgrd1DBTableView2: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              FilterBox.Visible = fvNever
              DataController.DetailKeyFieldNames = 'Codigo'
              DataController.KeyFieldNames = 'Codigo_Registro'
              DataController.MasterKeyFieldNames = 'Codigo'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Kind = skSum
                  FieldName = 'Sub_Total'
                  Column = cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Sub_Total
                end
                item
                  Kind = skSum
                  FieldName = 'Valor_ICMS_ST'
                  Column = cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Valor_ICMS_ST
                end>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnHiding = True
              OptionsCustomize.ColumnsQuickCustomization = True
              OptionsCustomize.DataRowSizing = True
              OptionsView.Footer = True
              OptionsView.GroupFooterMultiSummaries = True
              OptionsView.GroupFooters = gfAlwaysVisible
              OptionsView.GroupSummaryLayout = gslAlignWithColumns
              OptionsView.Indicator = True
              object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Codigo: TcxGridDBColumn
                Caption = 'C'#243'digo'
                DataBinding.FieldName = 'Codigo'
                Options.Editing = False
              end
              object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Codigo_Produto: TcxGridDBColumn
                Caption = 'C'#243'digo Sistema'
                DataBinding.FieldName = 'Codigo_Produto'
                Options.Editing = False
                Width = 80
              end
              object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Codigo_Venda: TcxGridDBColumn
                Caption = 'C'#243'digo Venda'
                DataBinding.FieldName = 'Codigo_Venda'
                Options.Editing = False
              end
              object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Descricao: TcxGridDBColumn
                Caption = 'Descri'#231#227'o'
                DataBinding.FieldName = 'Descricao'
                Options.Editing = False
                Width = 312
              end
              object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2UN: TcxGridDBColumn
                Caption = 'Un.'
                DataBinding.FieldName = 'UN'
                Options.Editing = False
              end
              object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Qtde: TcxGridDBColumn
                Caption = 'Qtde.'
                DataBinding.FieldName = 'Qtde'
                Options.Editing = False
              end
              object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Valor_Original: TcxGridDBColumn
                Caption = 'Valor Tabela'
                DataBinding.FieldName = 'Valor_Original'
                Options.Editing = False
                Width = 100
              end
              object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Desc_Acr: TcxGridDBColumn
                Caption = 'Desconto'
                DataBinding.FieldName = 'Desc_Acr'
                Options.Editing = False
                Width = 100
              end
              object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Valor_Unitario: TcxGridDBColumn
                Caption = 'Valor Unit'#225'rio'
                DataBinding.FieldName = 'Valor_Unitario'
                Options.Editing = False
                Width = 100
              end
              object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Valor_Compra: TcxGridDBColumn
                Caption = 'Custo'
                DataBinding.FieldName = 'Valor_Compra'
                Visible = False
                Options.Editing = False
                Width = 100
              end
              object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Sub_Total: TcxGridDBColumn
                Caption = 'Sub Total'
                DataBinding.FieldName = 'Sub_Total'
                Options.Editing = False
                Width = 100
              end
              object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView2Valor_ICMS_ST: TcxGridDBColumn
                Caption = 'Valor Imposto S.T.'
                DataBinding.FieldName = 'Valor_ICMS_ST'
                Options.Editing = False
              end
            end
            object cxgrdbtblvwcxgrd1DBTableView1: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
            end
            object cxgrdbtblvwcxgrd1DBTableView3: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.DataSource = ds1
              DataController.DetailKeyFieldNames = 'Codigo'
              DataController.KeyFieldNames = 'Codigo_Registro'
              DataController.MasterKeyFieldNames = 'Codigo'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsView.GroupByBox = False
              object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView3Codigo_Registro: TcxGridDBColumn
                Caption = 'Codigo Registro'
                DataBinding.FieldName = 'Codigo_Registro'
                Visible = False
                Options.Editing = False
              end
              object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView3Codigo: TcxGridDBColumn
                Caption = 'C'#243'digo'
                DataBinding.FieldName = 'Codigo'
                Options.Editing = False
              end
              object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView3Codigo_Venda: TcxGridDBColumn
                Caption = 'C'#243'digo Venda'
                DataBinding.FieldName = 'Codigo_Venda'
                Options.Editing = False
                Width = 103
              end
              object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView3Descricao: TcxGridDBColumn
                Caption = 'Descri'#231#227'o'
                DataBinding.FieldName = 'Descricao'
                Options.Editing = False
                Width = 300
              end
              object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView3Qtde: TcxGridDBColumn
                Caption = 'Quantidade'
                DataBinding.FieldName = 'Qtde'
                Options.Editing = False
                Width = 71
              end
              object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView3Valor_Unitario: TcxGridDBColumn
                Caption = 'Valor Unit'#225'rio'
                DataBinding.FieldName = 'Valor_Unitario'
                Options.Editing = False
                Width = 92
              end
              object cxgrdbclmncxgrdbtblvwcxgrd1DBTableView3Sub_Total: TcxGridDBColumn
                Caption = 'Sub Total'
                DataBinding.FieldName = 'Sub_Total'
                Options.Editing = False
                Width = 81
              end
            end
            object cxgrdlvlcxgrd1Level1: TcxGridLevel
              GridView = cxgrdbtblvwGrid1DBTableView1
              object cxgrdlvlcxgrd1Level2: TcxGridLevel
                GridView = cxgrdbtblvwcxgrd1DBTableView3
              end
            end
          end
          object rgPeriodoVenda: TRadioGroup
            Left = 675
            Top = 36
            Width = 135
            Height = 99
            Caption = 'Per'#237'odo da Venda'
            ItemIndex = 0
            Items.Strings = (
              'Todos'
              'Primeira'
              'Ultima')
            TabOrder = 4
            OnClick = rgPeriodoVendaClick
          end
        end
        object TabSheet11: TTabSheet
          Caption = 'Ocorr'#234'ncias'
          ImageIndex = 7
          object cxGrid1: TcxGrid
            Left = 0
            Top = 0
            Width = 810
            Height = 259
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            LookAndFeel.NativeStyle = False
            object cxGridDBTableView1: TcxGridDBTableView
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
              FilterBox.Position = fpTop
              FilterBox.Visible = fvNever
              DataController.DataSource = DataSource6
              DataController.Filter.Active = True
              DataController.Summary.DefaultGroupSummaryItems = <
                item
                  Format = '#0.0,0'
                  Kind = skSum
                  Position = spFooter
                end>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              DateTimeHandling.DateFormat = 'DD/MM/YYYY'
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
              OptionsView.GroupFooterMultiSummaries = True
              OptionsView.GroupFooters = gfAlwaysVisible
              OptionsView.GroupSummaryLayout = gslAlignWithColumns
              OptionsView.Indicator = True
              Preview.Visible = True
              Styles.ContentEven = DM.cxStyle1
              Styles.Footer = DM.cxStyle2
              Styles.GroupSummary = DM.cxStyle2
              Styles.Header = DM.cxStyle2
              object cxGridDBTableView1Data_Cadastro: TcxGridDBColumn
                Caption = 'Cadastro'
                DataBinding.FieldName = 'Data_Cadastro'
                Options.Editing = False
                Width = 68
              end
              object cxGridDBTableView1Data_Cobranca: TcxGridDBColumn
                Caption = 'Cobran'#231'a'
                DataBinding.FieldName = 'Data_Cobranca'
                Options.Editing = False
                Width = 124
              end
              object cxGridDBTableView1Responsavel_Atendimento: TcxGridDBColumn
                Caption = 'Respons'#225'vel'
                DataBinding.FieldName = 'Responsavel_Atendimento'
                Options.Editing = False
                Width = 210
              end
              object cxGridDBTableView1Origem_Atendimento: TcxGridDBColumn
                Caption = 'Origem'
                DataBinding.FieldName = 'Origem_Atendimento'
                Options.Editing = False
                Width = 84
              end
              object cxGridDBTableView1Codigo_Lancamento_Financeiro: TcxGridDBColumn
                Caption = 'C'#243'd. Lan. Fin.'
                DataBinding.FieldName = 'Codigo_Lancamento_Financeiro'
                Options.Editing = False
                Width = 88
              end
              object cxGridDBTableView1N_Documento: TcxGridDBColumn
                Caption = 'N'#186' Documento'
                DataBinding.FieldName = 'N_Documento'
                Options.Editing = False
                Width = 93
              end
              object cxGridDBTableView1Observacoes: TcxGridDBColumn
                Caption = 'Observa'#231#245'es'
                DataBinding.FieldName = 'Observacoes'
                Options.Editing = False
                Width = 300
              end
            end
            object cxGridTableView1: TcxGridTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              object cxGridColumn1: TcxGridColumn
              end
            end
            object cxGridDBTableView2: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              FilterBox.Visible = fvNever
              DataController.DetailKeyFieldNames = 'Codigo'
              DataController.KeyFieldNames = 'Codigo_Registro'
              DataController.MasterKeyFieldNames = 'Codigo'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <
                item
                  Kind = skSum
                  FieldName = 'Sub_Total'
                  Column = cxGridDBColumn16
                end
                item
                  Kind = skSum
                  FieldName = 'Valor_ICMS_ST'
                  Column = cxGridDBColumn17
                end>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnHiding = True
              OptionsCustomize.ColumnsQuickCustomization = True
              OptionsCustomize.DataRowSizing = True
              OptionsView.Footer = True
              OptionsView.GroupFooterMultiSummaries = True
              OptionsView.GroupFooters = gfAlwaysVisible
              OptionsView.GroupSummaryLayout = gslAlignWithColumns
              OptionsView.Indicator = True
              object cxGridDBColumn6: TcxGridDBColumn
                Caption = 'C'#243'digo'
                DataBinding.FieldName = 'Codigo'
                Options.Editing = False
              end
              object cxGridDBColumn7: TcxGridDBColumn
                Caption = 'C'#243'digo Sistema'
                DataBinding.FieldName = 'Codigo_Produto'
                Options.Editing = False
                Width = 80
              end
              object cxGridDBColumn8: TcxGridDBColumn
                Caption = 'C'#243'digo Venda'
                DataBinding.FieldName = 'Codigo_Venda'
                Options.Editing = False
              end
              object cxGridDBColumn9: TcxGridDBColumn
                Caption = 'Descri'#231#227'o'
                DataBinding.FieldName = 'Descricao'
                Options.Editing = False
                Width = 312
              end
              object cxGridDBColumn10: TcxGridDBColumn
                Caption = 'Un.'
                DataBinding.FieldName = 'UN'
                Options.Editing = False
              end
              object cxGridDBColumn11: TcxGridDBColumn
                Caption = 'Qtde.'
                DataBinding.FieldName = 'Qtde'
                Options.Editing = False
              end
              object cxGridDBColumn12: TcxGridDBColumn
                Caption = 'Valor Tabela'
                DataBinding.FieldName = 'Valor_Original'
                Options.Editing = False
                Width = 100
              end
              object cxGridDBColumn13: TcxGridDBColumn
                Caption = 'Desconto'
                DataBinding.FieldName = 'Desc_Acr'
                Options.Editing = False
                Width = 100
              end
              object cxGridDBColumn14: TcxGridDBColumn
                Caption = 'Valor Unit'#225'rio'
                DataBinding.FieldName = 'Valor_Unitario'
                Options.Editing = False
                Width = 100
              end
              object cxGridDBColumn15: TcxGridDBColumn
                Caption = 'Custo'
                DataBinding.FieldName = 'Valor_Compra'
                Visible = False
                Options.Editing = False
                Width = 100
              end
              object cxGridDBColumn16: TcxGridDBColumn
                Caption = 'Sub Total'
                DataBinding.FieldName = 'Sub_Total'
                Options.Editing = False
                Width = 100
              end
              object cxGridDBColumn17: TcxGridDBColumn
                Caption = 'Valor Imposto S.T.'
                DataBinding.FieldName = 'Valor_ICMS_ST'
                Options.Editing = False
              end
            end
            object cxGridDBTableView3: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
            end
            object cxGridLevel1: TcxGridLevel
              GridView = cxGridDBTableView1
            end
          end
        end
        object TabSheet10: TTabSheet
          Caption = 'Fotos'
          ImageIndex = 6
          object Img1: TImage
            Left = 0
            Top = 0
            Width = 259
            Height = 259
            Center = True
          end
          object SpeedButton2: TSpeedButton
            Left = 265
            Top = 225
            Width = 127
            Height = 34
            Cursor = crHandPoint
            Caption = 'Carregar Imagem'
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0EEE08FC0913B8D3F25
              7A292577293B853F8FB991E0EBE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFB5D9B7318F3542A05287CA9A9BD3AB9BD2AB83C7963D974C307C34B5D0
              B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5DBBA258F2A6DBE83A8DBB587CC9866
              BC7D64BA7C86CB98A5D9B466B77D247227B5D1B6FFFFFFFFFFFFFFFFFFE1F2E4
              33A14472C287A8DBB260BC775CBA7359B87059B56F58B56F5BB774A5D9B369B8
              7F317F35E1ECE1FFFFFFFFFFFF90D29F4CB064AADDB464C1795FBE7175C585D4
              ECD98ACD9956B66C58B56E5CB774A6DAB4419B4E8EBC90FFFFFFFFFFFF3FB55D
              91D29F8DD49A64C37479C987F2FAF4FFFFFFFDFEFD86CB9657B76D5BB97285CC
              9787C79A3B8B3FFFFFFFFFFFFF27B049A6DCAF70CA7F73CA80F0F9F1FFFFFFEB
              F7EDFFFFFFFBFDFC88CD965BB97167BE7DA0D7AF237F26FFFFFFFFFFFF2EB751
              A7DDB172CC8066C773B0E1B7D2EED663C170B8E3BFFFFFFFFBFDFC8CD09969C1
              7EA1D7AE238426FFFFFFFFFFFF4BC56C95D7A191D79B69C97664C66F61C46E61
              C36F61C26FB9E4C0FFFFFFE3F4E68BD1998BCE9D3C993FFFFFFFFFFFFF9BDFAD
              57BF70AFE1B76DCC7A68C87265C77063C56E62C46E63C471B6E3BE6FC77EACDF
              B548A95E8FC894FFFFFFFFFFFFE5F7E949C5667FCE90AEE1B56DCC7A6ACA7668
              C87268C87468C8756BC979ACDFB476C48933A142E1F1E3FFFFFFFFFFFFFFFFFF
              BFECCB3DC35C7FCE90AFE1B792D89D77CE8377CE8392D89DAEE1B578C88B27A1
              3BB5DFBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0EDCB4AC86959C27496D7A3A5
              DCAEA5DCAE95D6A150B96A35B355B6E3C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFE5F8E99FE3B055CB723BC05C37BE5A49C36A97DCAAE1F5E7FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            OnClick = SpeedButton2Click
          end
          object SpeedButton6: TSpeedButton
            Left = 265
            Top = 185
            Width = 127
            Height = 34
            Cursor = crHandPoint
            Caption = 'Excluir Imagem'
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF95B0E3235CC20543BC1F59C186A6DDFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8CABE12866CA2177E605
              79EA0164DD074FBE86A6DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF1F59C1639DF4187FFF0076F80076EE0368E11E59C0FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0543BCAECDFEFFFFFFFF
              FFFFFFFFFF187FEF0543BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF255DC28DB5F64D92FF1177FF2186FF408AEB245CC2FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF96B1E33D76D28DB5F7B8
              D6FE72A8F52F6DCC94AFE2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF95B0E32A62C70543BC205AC188A7DEFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            OnClick = SpeedButton6Click
          end
          object SpeedButton1: TSpeedButton
            Left = 663
            Top = 185
            Width = 127
            Height = 34
            Cursor = crHandPoint
            Caption = 'Excluir Imagem'
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF95B0E3235CC20543BC1F59C186A6DDFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8CABE12866CA2177E605
              79EA0164DD074FBE86A6DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF1F59C1639DF4187FFF0076F80076EE0368E11E59C0FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0543BCAECDFEFFFFFFFF
              FFFFFFFFFF187FEF0543BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF255DC28DB5F64D92FF1177FF2186FF408AEB245CC2FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF96B1E33D76D28DB5F7B8
              D6FE72A8F52F6DCC94AFE2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF95B0E32A62C70543BC205AC188A7DEFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            OnClick = SpeedButton1Click
          end
          object SpeedButton3: TSpeedButton
            Left = 663
            Top = 225
            Width = 127
            Height = 34
            Cursor = crHandPoint
            Caption = 'Carregar Imagem'
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0EEE08FC0913B8D3F25
              7A292577293B853F8FB991E0EBE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFB5D9B7318F3542A05287CA9A9BD3AB9BD2AB83C7963D974C307C34B5D0
              B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5DBBA258F2A6DBE83A8DBB587CC9866
              BC7D64BA7C86CB98A5D9B466B77D247227B5D1B6FFFFFFFFFFFFFFFFFFE1F2E4
              33A14472C287A8DBB260BC775CBA7359B87059B56F58B56F5BB774A5D9B369B8
              7F317F35E1ECE1FFFFFFFFFFFF90D29F4CB064AADDB464C1795FBE7175C585D4
              ECD98ACD9956B66C58B56E5CB774A6DAB4419B4E8EBC90FFFFFFFFFFFF3FB55D
              91D29F8DD49A64C37479C987F2FAF4FFFFFFFDFEFD86CB9657B76D5BB97285CC
              9787C79A3B8B3FFFFFFFFFFFFF27B049A6DCAF70CA7F73CA80F0F9F1FFFFFFEB
              F7EDFFFFFFFBFDFC88CD965BB97167BE7DA0D7AF237F26FFFFFFFFFFFF2EB751
              A7DDB172CC8066C773B0E1B7D2EED663C170B8E3BFFFFFFFFBFDFC8CD09969C1
              7EA1D7AE238426FFFFFFFFFFFF4BC56C95D7A191D79B69C97664C66F61C46E61
              C36F61C26FB9E4C0FFFFFFE3F4E68BD1998BCE9D3C993FFFFFFFFFFFFF9BDFAD
              57BF70AFE1B76DCC7A68C87265C77063C56E62C46E63C471B6E3BE6FC77EACDF
              B548A95E8FC894FFFFFFFFFFFFE5F7E949C5667FCE90AEE1B56DCC7A6ACA7668
              C87268C87468C8756BC979ACDFB476C48933A142E1F1E3FFFFFFFFFFFFFFFFFF
              BFECCB3DC35C7FCE90AFE1B792D89D77CE8377CE8392D89DAEE1B578C88B27A1
              3BB5DFBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0EDCB4AC86959C27496D7A3A5
              DCAEA5DCAE95D6A150B96A35B355B6E3C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFE5F8E99FE3B055CB723BC05C37BE5A49C36A97DCAAE1F5E7FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            OnClick = SpeedButton3Click
          end
          object Img2: TImage
            Left = 398
            Top = 0
            Width = 259
            Height = 259
            Center = True
          end
        end
      end
      object CBBloqueado: TCheckBox
        Left = 168
        Top = 36
        Width = 77
        Height = 17
        Caption = 'Bloqueado'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 97
        Width = 366
        Height = 66
        Caption = 'Cliente F'#237'sico'
        TabOrder = 6
        object LblRG: TLabel
          Left = 115
          Top = 17
          Width = 16
          Height = 13
          Caption = 'RG'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 195
          Top = 17
          Width = 60
          Height = 13
          Caption = 'Org'#227'o Exp.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 280
          Top = 17
          Width = 76
          Height = 13
          Caption = 'Data Emiss'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 13
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
        object EdtRG: TEdit
          Left = 107
          Top = 33
          Width = 90
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          MaxLength = 15
          TabOrder = 1
          OnKeyPress = EdtRGKeyPress
        end
        object EdtOrgao_Expedidor: TEdit
          Left = 195
          Top = 33
          Width = 86
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          MaxLength = 10
          TabOrder = 2
        end
        object EdtData_Emissao: TMaskEdit
          Left = 280
          Top = 33
          Width = 79
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 3
          Text = '  /  /    '
          OnExit = EdtData_EmissaoExit
        end
        object EdtCPF: TMaskEdit
          Left = 6
          Top = 33
          Width = 103
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          EditMask = '!999\.999\.999\-99;0;_'
          MaxLength = 14
          TabOrder = 0
          OnExit = EdtCPFExit
        end
      end
      object RGEnquadramento: TRadioGroup
        Left = 251
        Top = 6
        Width = 114
        Height = 47
        Caption = 'Enquadramento'
        ItemIndex = 1
        Items.Strings = (
          'Contribuinte'
          'N'#227'o Contribuinte')
        TabOrder = 9
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 490
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
    object BBtnImprimir: TToolButton
      Left = 0
      Top = 152
      Cursor = crHandPoint
      Caption = '&Imprimir'
      Enabled = False
      ImageIndex = 6
      Wrap = True
      OnClick = BBtnImprimirClick
    end
    object BBtnCancelar: TToolButton
      Left = 0
      Top = 190
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
      Top = 228
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
      
        'select EC.*, S.Descricao as Setor, C.Descricao as NomeCidade, C.' +
        'Codigo as Codigo_Cidade from Endereco_Cliente EC'
      'left join Setor S on (S.Codigo = EC.Codigo_Setor)'
      'left join Cidade C on (C.Codigo = EC.Codigo_Cidade)')
    Left = 864
    Top = 104
    object ADOQuery1Codigo_Cliente: TIntegerField
      FieldName = 'Codigo_Cliente'
    end
    object ADOQuery1Codigo_Setor: TIntegerField
      FieldName = 'Codigo_Setor'
    end
    object ADOQuery1Numero: TStringField
      FieldName = 'Numero'
      Size = 5
    end
    object ADOQuery1Complemento: TStringField
      FieldName = 'Complemento'
      Size = 30
    end
    object ADOQuery1Tipo_Endereco: TStringField
      FieldName = 'Tipo_Endereco'
      Size = 30
    end
    object ADOQuery1Endereco: TStringField
      FieldName = 'Endereco'
      Size = 200
    end
    object ADOQuery1CEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object ADOQuery1Codigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ReadOnly = True
    end
    object ADOQuery1Setor: TStringField
      FieldName = 'Setor'
      Size = 40
    end
    object ADOQuery1SetorLookUp: TStringField
      FieldKind = fkLookup
      FieldName = 'SetorLookUp'
      LookupDataSet = DM.qrysetor
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Codigo_Setor'
      Size = 50
      Lookup = True
    end
    object ADOQuery1NomeCidade: TStringField
      FieldName = 'NomeCidade'
      Size = 30
    end
    object ADOQuery1Codigo_Cidade: TAutoIncField
      FieldName = 'Codigo_Cidade'
      ReadOnly = True
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 896
    Top = 104
  end
  object DataSource2: TDataSource
    DataSet = qryPedido
    Left = 448
    Top = 344
  end
  object qryPedido: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select P.Codigo, P.N_Pedido, P.N_Pre_Venda, P.Total_Pedido,P.Dat' +
        'a_Venda,'
      'C.Nome_Nome_Fantasia from Pedido P'
      'left join Cliente C on (P.Codigo_Cliente = C.Codigo)')
    Left = 416
    Top = 344
    object intgrfldPedidoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object strngfldPedidoN_Pedido: TStringField
      FieldName = 'N_Pedido'
      Size = 13
    end
    object strngfldPedidoN_Pre_Venda: TStringField
      FieldName = 'N_Pre_Venda'
      Size = 10
    end
    object qryPedidoTotal_Pedido: TFloatField
      FieldName = 'Total_Pedido'
      DisplayFormat = '#0.0,0'
    end
    object strngfldPedidoNome_Nome_Fantasia: TStringField
      FieldName = 'Nome_Nome_Fantasia'
      Size = 50
    end
    object qryPedidoData_Venda: TDateTimeField
      FieldName = 'Data_Venda'
    end
  end
  object qrydados_adicionais: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select DAC.*, S.Descricao as Setor, C.Descricao as Cidade from D' +
        'ados_Adicionais_Cliente DAC'
      'left join Setor S on (DAC.Codigo_Setor = S.Codigo)'
      'left join Cidade C on (DAC.Codigo_Cidade = C.Codigo)')
    Left = 808
    Top = 384
    object qrydados_adicionaisCodigo_Cliente: TIntegerField
      FieldName = 'Codigo_Cliente'
    end
    object qrydados_adicionaisEmpresa: TStringField
      FieldName = 'Empresa'
      Size = 70
    end
    object qrydados_adicionaisInscricao: TStringField
      FieldName = 'Inscricao'
    end
    object qrydados_adicionaisEndereco: TStringField
      FieldName = 'Endereco'
      Size = 200
    end
    object qrydados_adicionaisNumero: TStringField
      FieldName = 'Numero'
      Size = 5
    end
    object qrydados_adicionaisCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object qrydados_adicionaisComplemento: TStringField
      FieldName = 'Complemento'
      Size = 50
    end
    object qrydados_adicionaisCodigo_Setor: TIntegerField
      FieldName = 'Codigo_Setor'
    end
    object qrydados_adicionaisCodigo_Cidade: TIntegerField
      FieldName = 'Codigo_Cidade'
    end
    object qrydados_adicionaisCodigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ReadOnly = True
    end
    object qrydados_adicionaisSetor: TStringField
      FieldName = 'Setor'
      Size = 40
    end
    object qrydados_adicionaisCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object qrydados_adicionaisSetorTeste: TStringField
      FieldKind = fkLookup
      FieldName = 'SetorLookUp'
      LookupDataSet = DM.qrysetor
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Codigo_Setor'
      Size = 50
      Lookup = True
    end
    object qrydados_adicionaisCidadeLookUp: TStringField
      FieldKind = fkLookup
      FieldName = 'CidadeLookUp'
      LookupDataSet = DM.qrycidade
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Codigo_Cidade'
      Size = 50
      Lookup = True
    end
  end
  object DataSource3: TDataSource
    DataSet = qrydados_adicionais
    Left = 840
    Top = 384
  end
  object ADOQuery4: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select IP.* from Itens_Pedido IP')
    Left = 912
    Top = 8
    object ADOQuery4Codigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ReadOnly = True
    end
    object ADOQuery4Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object ADOQuery4N_Item: TStringField
      FieldName = 'N_Item'
      Size = 10
    end
    object ADOQuery4Codigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object ADOQuery4Codigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object ADOQuery4Descricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object ADOQuery4NCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object ADOQuery4Origem: TStringField
      FieldName = 'Origem'
      Size = 1
    end
    object ADOQuery4CFOP: TStringField
      FieldName = 'CFOP'
      Size = 10
    end
    object ADOQuery4UN: TStringField
      FieldName = 'UN'
      Size = 10
    end
    object ADOQuery4Tipo_Calculo_BC_ICMS: TStringField
      FieldName = 'Tipo_Calculo_BC_ICMS'
      Size = 50
    end
    object ADOQuery4Tipo_Recolhimento: TStringField
      FieldName = 'Tipo_Recolhimento'
      Size = 10
    end
    object ADOQuery4ICMS: TStringField
      FieldName = 'ICMS'
      Size = 10
    end
    object ADOQuery4CST: TStringField
      FieldName = 'CST'
      Size = 10
    end
    object ADOQuery4CSOSN: TStringField
      FieldName = 'CSOSN'
      Size = 5
    end
    object ADOQuery4Base_Reduzida: TStringField
      FieldName = 'Base_Reduzida'
      Size = 5
    end
    object ADOQuery4Base_Acrescida: TStringField
      FieldName = 'Base_Acrescida'
      Size = 5
    end
    object ADOQuery4BC: TStringField
      FieldName = 'BC'
      Size = 10
    end
    object ADOQuery4Valor_ICMS: TStringField
      FieldName = 'Valor_ICMS'
    end
    object ADOQuery4Tipo_Calculo_BC_ICMS_ST: TStringField
      FieldName = 'Tipo_Calculo_BC_ICMS_ST'
      Size = 50
    end
    object ADOQuery4MVAST: TStringField
      FieldName = 'MVAST'
      Size = 10
    end
    object ADOQuery4ICMS_ST: TStringField
      FieldName = 'ICMS_ST'
      Size = 10
    end
    object ADOQuery4CST_ST: TStringField
      FieldName = 'CST_ST'
      Size = 10
    end
    object ADOQuery4Base_Reduzida_ST: TStringField
      FieldName = 'Base_Reduzida_ST'
      Size = 5
    end
    object ADOQuery4Base_Acrescida_ST: TStringField
      FieldName = 'Base_Acrescida_ST'
      Size = 5
    end
    object ADOQuery4BC_ST: TStringField
      FieldName = 'BC_ST'
      Size = 10
    end
    object ADOQuery4Valor_ICMS_ST: TStringField
      FieldName = 'Valor_ICMS_ST'
    end
    object ADOQuery4Aliquota_Calculo_Credito: TStringField
      FieldName = 'Aliquota_Calculo_Credito'
      Size = 10
    end
    object ADOQuery4Credito_ICMS: TStringField
      FieldName = 'Credito_ICMS'
    end
    object ADOQuery4Tipo_Calculo_IPI: TStringField
      FieldName = 'Tipo_Calculo_IPI'
    end
    object ADOQuery4IPI: TStringField
      FieldName = 'IPI'
      Size = 10
    end
    object ADOQuery4CST_IPI: TStringField
      FieldName = 'CST_IPI'
      Size = 10
    end
    object ADOQuery4Base_Reduzida_IPI: TStringField
      FieldName = 'Base_Reduzida_IPI'
      Size = 10
    end
    object ADOQuery4Base_Acrescida_IPI: TStringField
      FieldName = 'Base_Acrescida_IPI'
      Size = 10
    end
    object ADOQuery4BC_IPI: TStringField
      FieldName = 'BC_IPI'
      Size = 10
    end
    object ADOQuery4Valor_IPI: TFloatField
      FieldName = 'Valor_IPI'
    end
    object ADOQuery4Tipo_Calculo_PIS: TStringField
      FieldName = 'Tipo_Calculo_PIS'
    end
    object ADOQuery4PIS: TStringField
      FieldName = 'PIS'
      Size = 10
    end
    object ADOQuery4CST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 10
    end
    object ADOQuery4Base_Reduzida_PIS: TStringField
      FieldName = 'Base_Reduzida_PIS'
      Size = 10
    end
    object ADOQuery4Base_Acrescida_PIS: TStringField
      FieldName = 'Base_Acrescida_PIS'
      Size = 10
    end
    object ADOQuery4BC_PIS: TStringField
      FieldName = 'BC_PIS'
      Size = 10
    end
    object ADOQuery4Valor_PIS: TFloatField
      FieldName = 'Valor_PIS'
    end
    object ADOQuery4Tipo_Calculo_COFINS: TStringField
      FieldName = 'Tipo_Calculo_COFINS'
    end
    object ADOQuery4COFINS: TStringField
      FieldName = 'COFINS'
      Size = 10
    end
    object ADOQuery4CST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 10
    end
    object ADOQuery4Base_Reduzida_COFINS: TStringField
      FieldName = 'Base_Reduzida_COFINS'
      Size = 10
    end
    object ADOQuery4Base_Acrescida_COFINS: TStringField
      FieldName = 'Base_Acrescida_COFINS'
      Size = 10
    end
    object ADOQuery4BC_COFINS: TStringField
      FieldName = 'BC_COFINS'
      Size = 10
    end
    object ADOQuery4Valor_COFINS: TFloatField
      FieldName = 'Valor_COFINS'
    end
    object ADOQuery4Qtde: TFloatField
      FieldName = 'Qtde'
    end
    object ADOQuery4Qtde_Entregue: TFloatField
      FieldName = 'Qtde_Entregue'
    end
    object ADOQuery4Qtde_Restante: TFloatField
      FieldName = 'Qtde_Restante'
    end
    object ADOQuery4Qtde_S_Previsao: TFloatField
      FieldName = 'Qtde_S_Previsao'
    end
    object ADOQuery4Valor_Compra: TFloatField
      FieldName = 'Valor_Compra'
    end
    object ADOQuery4Valor_Original: TFloatField
      FieldName = 'Valor_Original'
    end
    object ADOQuery4Valor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
    end
    object ADOQuery4Desc_Acr: TFloatField
      FieldName = 'Desc_Acr'
    end
    object ADOQuery4Desc_Acr_P: TFloatField
      FieldName = 'Desc_Acr_P'
    end
    object ADOQuery4Tipo_Desc_Acr: TStringField
      FieldName = 'Tipo_Desc_Acr'
      Size = 1
    end
    object ADOQuery4dOUa: TStringField
      FieldName = 'dOUa'
      Size = 1
    end
    object ADOQuery4Valor_Frete: TFloatField
      FieldName = 'Valor_Frete'
    end
    object ADOQuery4Valor_Seguro: TFloatField
      FieldName = 'Valor_Seguro'
    end
    object ADOQuery4Outras_Despesas: TFloatField
      FieldName = 'Outras_Despesas'
    end
    object ADOQuery4Sub_Total: TFloatField
      FieldName = 'Sub_Total'
    end
    object ADOQuery4Sub_Total_Liquido: TFloatField
      FieldName = 'Sub_Total_Liquido'
    end
    object ADOQuery4Cancelado: TStringField
      FieldName = 'Cancelado'
      Size = 1
    end
    object ADOQuery4Indica_Valor_Total: TStringField
      FieldName = 'Indica_Valor_Total'
      Size = 1
    end
    object ADOQuery4Data_Entrega: TDateTimeField
      FieldName = 'Data_Entrega'
    end
    object ADOQuery4Hora_Entrega: TStringField
      FieldName = 'Hora_Entrega'
      Size = 8
    end
    object ADOQuery4Tipo_Entrega: TStringField
      FieldName = 'Tipo_Entrega'
      Size = 1
    end
    object ADOQuery4Tipo_Calculo_BC_ICMS_NF: TStringField
      FieldName = 'Tipo_Calculo_BC_ICMS_NF'
      Size = 50
    end
    object ADOQuery4Tipo_Recolhimento_NF: TStringField
      FieldName = 'Tipo_Recolhimento_NF'
      Size = 10
    end
    object ADOQuery4ICMS_NF: TStringField
      FieldName = 'ICMS_NF'
      Size = 10
    end
    object ADOQuery4CST_NF: TStringField
      FieldName = 'CST_NF'
      Size = 10
    end
    object ADOQuery4CSOSN_NF: TStringField
      FieldName = 'CSOSN_NF'
      Size = 5
    end
    object ADOQuery4Base_Reduzida_NF: TStringField
      FieldName = 'Base_Reduzida_NF'
      Size = 5
    end
    object ADOQuery4Base_Acrescida_NF: TStringField
      FieldName = 'Base_Acrescida_NF'
      Size = 5
    end
    object ADOQuery4BC_NF: TStringField
      FieldName = 'BC_NF'
      Size = 10
    end
    object ADOQuery4Valor_ICMS_NF: TStringField
      FieldName = 'Valor_ICMS_NF'
    end
    object ADOQuery4Tipo_Venda: TStringField
      FieldName = 'Tipo_Venda'
      Size = 1
    end
    object ADOQuery4Comissao: TFloatField
      FieldName = 'Comissao'
    end
    object ADOQuery4Perc_Desc_Vista: TFloatField
      FieldName = 'Perc_Desc_Vista'
    end
    object ADOQuery4Perc_Desc_Prazo: TFloatField
      FieldName = 'Perc_Desc_Prazo'
    end
    object ADOQuery4Permite_Credito: TIntegerField
      FieldName = 'Permite_Credito'
    end
    object ADOQuery4Codigo_Obs_Fiscal: TIntegerField
      FieldName = 'Codigo_Obs_Fiscal'
    end
    object ADOQuery4Qtde_Estoque_Atual: TFloatField
      FieldName = 'Qtde_Estoque_Atual'
    end
    object ADOQuery4Valor_Compra_Nota: TFloatField
      FieldName = 'Valor_Compra_Nota'
    end
  end
  object qrytelefone: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select TC.* from Telefone_Cliente TC')
    Left = 848
    Top = 8
    object qrytelefoneCodigo_Cliente: TIntegerField
      FieldName = 'Codigo_Cliente'
    end
    object qrytelefoneTelefone: TStringField
      FieldName = 'Telefone'
      Size = 50
    end
    object qrytelefoneTipo: TStringField
      FieldName = 'Tipo'
    end
    object qrytelefoneCodigo_Telefone: TIntegerField
      FieldName = 'Codigo_Telefone'
    end
  end
  object DataSource4: TDataSource
    DataSet = qrytelefone
    Left = 880
    Top = 8
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 912
    Top = 48
  end
  object qryautorizados: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select CA.* from Cliente_Autorizados CA')
    Left = 648
    Top = 392
    object qryautorizadosCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryautorizadosCodigo_Cliente: TIntegerField
      FieldName = 'Codigo_Cliente'
    end
    object qryautorizadosNome_Autorizado: TStringField
      FieldName = 'Nome_Autorizado'
      Size = 100
    end
    object qryautorizadosCPF_Autorizado: TStringField
      FieldName = 'CPF_Autorizado'
    end
  end
  object DataSource5: TDataSource
    DataSet = qryautorizados
    Left = 680
    Top = 392
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    UseAppManager = True
    Left = 20
    Top = 5
  end
  object ds1: TDataSource
    DataSet = qryItensPedido
    Left = 680
    Top = 312
  end
  object qryItensPedido: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT I.Codigo_Registro,I.Codigo,I.Codigo_Venda, I.Descricao, I' +
        '.Qtde, I.Valor_Unitario, I.Sub_Total'
      'FROM Itens_Pedido I '
      'ORDER BY I.Codigo')
    Left = 648
    Top = 312
    object qryItensPedidoCodigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ReadOnly = True
    end
    object intgrfldItensPedidoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object strngfldItensPedidoCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object strngfldItensPedidoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 300
    end
    object qryItensPedidoQtde: TFloatField
      FieldName = 'Qtde'
    end
    object qryItensPedidoValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
    end
    object qryItensPedidoSub_Total: TFloatField
      FieldName = 'Sub_Total'
    end
  end
  object qryocorrencia: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select T.Data_Cadastro, T.Data_Cobranca, T.Responsavel_Atendimen' +
        'to, T.Origem_Atendimento,'
      
        'T.Codigo_Lancamento_Financeiro, T.N_Documento, T.Observacoes fro' +
        'm Lancamento_Financeiro_Ocorrencia_Cobranca T')
    Left = 240
    Top = 280
    object qryocorrenciaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qryocorrenciaData_Cobranca: TDateTimeField
      FieldName = 'Data_Cobranca'
    end
    object qryocorrenciaResponsavel_Atendimento: TStringField
      FieldName = 'Responsavel_Atendimento'
      Size = 50
    end
    object qryocorrenciaOrigem_Atendimento: TIntegerField
      FieldName = 'Origem_Atendimento'
      OnGetText = qryocorrenciaOrigem_AtendimentoGetText
    end
    object qryocorrenciaCodigo_Lancamento_Financeiro: TIntegerField
      FieldName = 'Codigo_Lancamento_Financeiro'
    end
    object qryocorrenciaN_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object qryocorrenciaObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 800
    end
  end
  object DataSource6: TDataSource
    DataSet = qryocorrencia
    Left = 272
    Top = 280
  end
end
