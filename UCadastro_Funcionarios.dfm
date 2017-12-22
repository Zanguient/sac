object FrmCadastro_Funcionarios: TFrmCadastro_Funcionarios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Funcion'#225'rios'
  ClientHeight = 455
  ClientWidth = 907
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
    Width = 782
    Height = 455
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
      object LblMarca: TLabel
        Left = 0
        Top = 53
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
      object EdtNome: TEdit
        Left = 0
        Top = 68
        Width = 329
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 1
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 91
        Width = 372
        Height = 66
        Caption = 'Documenta'#231#227'o'
        TabOrder = 2
        object LblRG: TLabel
          Left = 122
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
          Left = 208
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
          Left = 279
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
          Left = 18
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
          Left = 122
          Top = 33
          Width = 87
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          MaxLength = 15
          TabOrder = 1
          OnKeyPress = EdtRGKeyPress
        end
        object EdtOrgao_Expedidor: TEdit
          Left = 208
          Top = 33
          Width = 72
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          CharCase = ecUpperCase
          MaxLength = 10
          TabOrder = 2
        end
        object EdtData_Emissao: TMaskEdit
          Left = 279
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
          Left = 20
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
      object GroupBox2: TGroupBox
        Left = 378
        Top = 91
        Width = 389
        Height = 66
        Caption = 'Valores'
        TabOrder = 3
        object Label11: TLabel
          Left = 16
          Top = 17
          Width = 39
          Height = 13
          Caption = 'Sal'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 108
          Top = 17
          Width = 86
          Height = 13
          Caption = 'Comiss'#227'o Prod.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 292
          Top = 17
          Width = 69
          Height = 13
          Caption = '% Desconto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label50: TLabel
          Left = 200
          Top = 17
          Width = 86
          Height = 13
          Caption = 'Comiss'#227'o Serv.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EdtSalario: TEdit
          Left = 16
          Top = 33
          Width = 93
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 0
          Text = '0,00'
          OnExit = EdtSalarioExit
          OnKeyPress = EdtSalarioKeyPress
        end
        object EdtComissao_Produto: TEdit
          Left = 108
          Top = 33
          Width = 93
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 1
          Text = '0,00'
          OnExit = EdtComissao_ProdutoExit
          OnKeyPress = EdtComissao_ProdutoKeyPress
        end
        object EdtDesconto: TEdit
          Left = 292
          Top = 33
          Width = 93
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 3
          Text = '0,00'
          OnExit = EdtComissao_ProdutoExit
          OnKeyPress = EdtComissao_ProdutoKeyPress
        end
        object EdtComissao_Servico: TEdit
          Left = 200
          Top = 33
          Width = 93
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BorderStyle = bsNone
          TabOrder = 2
          Text = '0,00'
          OnExit = EdtComissao_ProdutoExit
          OnKeyPress = EdtComissao_ProdutoKeyPress
        end
      end
      object PageControl2: TPageControl
        Left = 0
        Top = 168
        Width = 774
        Height = 252
        Cursor = crHandPoint
        ActivePage = TabSheet2
        Style = tsFlatButtons
        TabOrder = 4
        object TabSheet2: TTabSheet
          Caption = 'Dados Principais'
          object LblNumero: TLabel
            Left = 285
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
          object Label13: TLabel
            Left = 333
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
          object LblUF: TLabel
            Left = 255
            Top = 84
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
            Left = 405
            Top = 1
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
          object Label3: TLabel
            Left = 0
            Top = 42
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
            Top = 84
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
            Left = 255
            Top = 42
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
            Left = 302
            Top = 84
            Width = 33
            Height = 13
            Caption = 'Cargo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 481
            Top = 42
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
          object Label7: TLabel
            Left = 0
            Top = 126
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
            Top = 126
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
            Top = 126
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
            Top = 126
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
          object Label1: TLabel
            Left = 536
            Top = 84
            Width = 42
            Height = 13
            Caption = 'Depart.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label47: TLabel
            Left = 0
            Top = 167
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
          object EdtEndereco: TEdit
            Left = 0
            Top = 18
            Width = 286
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 200
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
          end
          object EdtNumero: TEdit
            Left = 285
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
          object EdtCEP: TEdit
            Left = 332
            Top = 18
            Width = 74
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
            Top = 59
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
          object EdtCidade: TEdit
            Left = 60
            Top = 101
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
            TabOrder = 9
            OnKeyPress = EdtCidadeKeyPress
          end
          object EdtUF: TEdit
            Left = 255
            Top = 101
            Width = 48
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            ReadOnly = True
            TabOrder = 10
            OnKeyPress = EdtUFKeyPress
          end
          object EdtReferencia: TEdit
            Left = 405
            Top = 18
            Width = 218
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
            Top = 59
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
          object EdtCodigo_Cidade: TEdit
            Left = 0
            Top = 101
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
            OnDblClick = EdtCodigo_CidadeDblClick
            OnKeyDown = EdtCodigo_CidadeKeyDown
            OnKeyPress = EdtCodigo_CidadeKeyPress
          end
          object EdtEmail: TEdit
            Left = 255
            Top = 59
            Width = 227
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 6
          end
          object EdtCargo: TEdit
            Left = 362
            Top = 101
            Width = 176
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
            TabOrder = 12
            OnKeyPress = EdtCargoKeyPress
          end
          object EdtCodigo_Cargo: TEdit
            Left = 302
            Top = 101
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
            OnDblClick = EdtCodigo_CargoDblClick
            OnKeyDown = EdtCodigo_CargoKeyDown
            OnKeyPress = EdtCodigo_CargoKeyPress
          end
          object CmbEstado_Civil: TComboBox
            Left = 481
            Top = 55
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
            TabOrder = 7
            Items.Strings = (
              'SOLTEIRO (A)'
              'CASADO (A)'
              'NOIVO (A)'
              'DIVORCIADO (A)'
              'VI'#218'VO (A)'
              'OUTROS (A)')
          end
          object MEdtTelefone: TMaskEdit
            Left = 0
            Top = 143
            Width = 82
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!\(99\)9999-9999;1;_'
            MaxLength = 13
            TabOrder = 15
            Text = '(  )    -    '
          end
          object MEdtCelular: TMaskEdit
            Left = 81
            Top = 143
            Width = 82
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!\(99\)9999-9999;1;_'
            MaxLength = 13
            TabOrder = 16
            Text = '(  )    -    '
          end
          object EdtContato: TEdit
            Left = 162
            Top = 143
            Width = 223
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            MaxLength = 50
            TabOrder = 17
          end
          object MEdtTelefone_Contato: TMaskEdit
            Left = 384
            Top = 143
            Width = 82
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            EditMask = '!\(99\)9999-9999;1;_'
            MaxLength = 13
            TabOrder = 18
            Text = '(  )    -    '
          end
          object EdtDepartamento: TEdit
            Left = 596
            Top = 101
            Width = 167
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
            TabOrder = 14
            OnKeyPress = EdtDepartamentoKeyPress
          end
          object EdtCodigo_Departamento: TEdit
            Left = 536
            Top = 101
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
            TabOrder = 13
            OnDblClick = EdtCodigo_DepartamentoDblClick
            OnKeyDown = EdtCodigo_DepartamentoKeyDown
            OnKeyPress = EdtCodigo_DepartamentoKeyPress
          end
          object MmoObservacoes: TMemo
            Left = 0
            Top = 183
            Width = 466
            Height = 38
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            MaxLength = 200
            ScrollBars = ssVertical
            TabOrder = 19
            OnKeyPress = MmoObservacoesKeyPress
          end
          object GroupBox3: TGroupBox
            Left = 477
            Top = 138
            Width = 286
            Height = 83
            Caption = 'Datas'
            TabOrder = 20
            object Label16: TLabel
              Left = 140
              Top = 25
              Width = 55
              Height = 13
              Caption = 'Admiss'#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label24: TLabel
              Left = 206
              Top = 25
              Width = 55
              Height = 13
              Caption = 'Demiss'#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LblData_Cadastro: TLabel
              Left = 8
              Top = 25
              Width = 51
              Height = 13
              Caption = 'Cadastro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LblData_Nasc: TLabel
              Left = 74
              Top = 25
              Width = 43
              Height = 13
              Caption = 'Nascim.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object MEdtData_Admissao: TMaskEdit
              Left = 140
              Top = 42
              Width = 67
              Height = 17
              BevelInner = bvNone
              BevelOuter = bvRaised
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 2
              Text = '  /  /    '
              OnExit = MEdtData_AdmissaoExit
            end
            object MEdtData_Demissao: TMaskEdit
              Left = 206
              Top = 42
              Width = 67
              Height = 17
              BevelInner = bvNone
              BevelOuter = bvRaised
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 3
              Text = '  /  /    '
              OnExit = MEdtData_DemissaoExit
            end
            object MEdtData_Cadastro: TMaskEdit
              Left = 8
              Top = 42
              Width = 67
              Height = 17
              BevelInner = bvNone
              BevelOuter = bvRaised
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 0
              Text = '  /  /    '
              OnExit = MEdtData_CadastroExit
            end
            object MEdtData_Nascimento: TMaskEdit
              Left = 74
              Top = 42
              Width = 67
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 1
              Text = '  /  /    '
              OnExit = MEdtData_NascimentoExit
            end
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Dados Adicionais'
          ImageIndex = 2
          object GroupBox4: TGroupBox
            Left = 0
            Top = 0
            Width = 196
            Height = 64
            Caption = 'C.T.P.S'
            TabOrder = 0
            object Label25: TLabel
              Left = 10
              Top = 17
              Width = 44
              Height = 13
              Caption = 'N'#250'mero'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label26: TLabel
              Left = 96
              Top = 17
              Width = 29
              Height = 13
              Caption = 'S'#233'rie'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object EdtCTPS_N: TEdit
              Left = 10
              Top = 34
              Width = 87
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 0
            end
            object EdtCTPS_Serie: TEdit
              Left = 96
              Top = 34
              Width = 89
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 1
            end
          end
          object GroupBox5: TGroupBox
            Left = 202
            Top = 0
            Width = 367
            Height = 64
            Caption = 'T'#237'tulo de Eleitor'
            TabOrder = 1
            object Label27: TLabel
              Left = 10
              Top = 17
              Width = 44
              Height = 13
              Caption = 'N'#250'mero'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label28: TLabel
              Left = 96
              Top = 17
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
            object Label29: TLabel
              Left = 238
              Top = 17
              Width = 28
              Height = 13
              Caption = 'Zona'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label30: TLabel
              Left = 282
              Top = 17
              Width = 34
              Height = 13
              Caption = 'Se'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object EdtTitulo_N: TEdit
              Left = 10
              Top = 34
              Width = 87
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 0
            end
            object EdtTitulo_Cidade: TEdit
              Left = 96
              Top = 34
              Width = 143
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 1
            end
            object EdtTitulo_Zona: TEdit
              Left = 238
              Top = 34
              Width = 45
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 2
            end
            object EdtTitulo_Secao: TEdit
              Left = 282
              Top = 34
              Width = 45
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 3
            end
          end
          object GroupBox6: TGroupBox
            Left = 0
            Top = 76
            Width = 288
            Height = 64
            Caption = 'Certificado Militar'
            TabOrder = 2
            object Label31: TLabel
              Left = 10
              Top = 17
              Width = 44
              Height = 13
              Caption = 'N'#250'mero'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label32: TLabel
              Left = 96
              Top = 17
              Width = 29
              Height = 13
              Caption = 'S'#233'rie'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label33: TLabel
              Left = 184
              Top = 17
              Width = 55
              Height = 13
              Caption = 'Categoria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object EdtCertificado_Militar_N: TEdit
              Left = 10
              Top = 34
              Width = 87
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 0
            end
            object EdtCertificado_Militar_Serie: TEdit
              Left = 96
              Top = 34
              Width = 89
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 1
            end
            object EdtCertificado_Militar_Categoria: TEdit
              Left = 184
              Top = 34
              Width = 89
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 2
            end
          end
          object GroupBox7: TGroupBox
            Left = 294
            Top = 76
            Width = 275
            Height = 64
            Caption = 'C.N.H'
            TabOrder = 3
            object Label34: TLabel
              Left = 10
              Top = 17
              Width = 44
              Height = 13
              Caption = 'N'#250'mero'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label35: TLabel
              Left = 96
              Top = 17
              Width = 55
              Height = 13
              Caption = 'Categoria'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label36: TLabel
              Left = 157
              Top = 17
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
            object EdtCNH_N: TEdit
              Left = 10
              Top = 34
              Width = 87
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 0
            end
            object EdtCNH_Categoria: TEdit
              Left = 96
              Top = 34
              Width = 62
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 1
            end
            object EdtCNH_Cidade: TEdit
              Left = 157
              Top = 34
              Width = 108
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 2
            end
          end
          object GroupBox8: TGroupBox
            Left = 0
            Top = 157
            Width = 569
            Height = 64
            Caption = 'P.I.S'
            TabOrder = 4
            object Label37: TLabel
              Left = 10
              Top = 17
              Width = 44
              Height = 13
              Caption = 'N'#250'mero'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label38: TLabel
              Left = 272
              Top = 17
              Width = 61
              Height = 13
              Caption = 'C'#243'd. Banco'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label39: TLabel
              Left = 162
              Top = 17
              Width = 34
              Height = 13
              Caption = 'Banco'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label40: TLabel
              Left = 96
              Top = 17
              Width = 51
              Height = 13
              Caption = 'Cadastro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label41: TLabel
              Left = 337
              Top = 17
              Width = 45
              Height = 13
              Caption = 'C'#243'd. Ag.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label42: TLabel
              Left = 402
              Top = 17
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
            object EdtPIS_N: TEdit
              Left = 10
              Top = 34
              Width = 87
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 0
            end
            object EdtPIS_Codigo_Banco: TEdit
              Left = 272
              Top = 34
              Width = 66
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 3
            end
            object EdtPIS_Banco: TEdit
              Left = 162
              Top = 34
              Width = 111
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 2
            end
            object MEdtPIS_Cadastro: TMaskEdit
              Left = 96
              Top = 34
              Width = 67
              Height = 17
              BevelInner = bvNone
              BevelOuter = bvRaised
              BevelKind = bkFlat
              BorderStyle = bsNone
              EditMask = '!99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 1
              Text = '  /  /    '
              OnExit = MEdtPIS_CadastroExit
            end
            object EdtPIS_Codigo_Agencia: TEdit
              Left = 337
              Top = 34
              Width = 66
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 4
            end
            object EdtPIS_Endereco_Agencia: TEdit
              Left = 402
              Top = 34
              Width = 157
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 5
            end
          end
          object GroupBox9: TGroupBox
            Left = 574
            Top = 0
            Width = 192
            Height = 221
            Caption = 'Dados Gerais'
            TabOrder = 5
            object Label43: TLabel
              Left = 9
              Top = 19
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
              Left = 9
              Top = 53
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
              Left = 9
              Top = 118
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
            object Label46: TLabel
              Left = 9
              Top = 155
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
            object Label48: TLabel
              Left = 9
              Top = 86
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
            object Label49: TLabel
              Left = 9
              Top = 188
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
            object EdtNome_Pai: TEdit
              Left = 9
              Top = 34
              Width = 173
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 0
            end
            object EdtNome_Mae: TEdit
              Left = 9
              Top = 68
              Width = 173
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 1
            end
            object EdtNaturalidade: TEdit
              Left = 9
              Top = 135
              Width = 173
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 3
            end
            object EdtNacionalidade: TEdit
              Left = 9
              Top = 170
              Width = 173
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 4
            end
            object EdtNome_Conjuge: TEdit
              Left = 9
              Top = 101
              Width = 173
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 2
            end
            object EdtGrau_Instrucao: TEdit
              Left = 9
              Top = 203
              Width = 173
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 5
            end
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'Outros'
          ImageIndex = 3
          object PageControl3: TPageControl
            Left = 0
            Top = 0
            Width = 766
            Height = 221
            Cursor = crHandPoint
            ActivePage = TabSheet7
            Style = tsFlatButtons
            TabOrder = 0
            object TabSheet6: TTabSheet
              Caption = 'Altera'#231#227'o Salarial'
              object DBGrid1: TDBGrid
                Left = 0
                Top = 0
                Width = 758
                Height = 190
                Hint = 'Selecione o registro a ser excluido e pressione Delete'
                DataSource = DataSource4
                DrawingStyle = gdsGradient
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDrawColumnCell = DBGrid1DrawColumnCell
                OnKeyDown = DBGrid1KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'Codigo'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'Data'
                    Width = 73
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'Salario'
                    Title.Caption = 'Sal'#225'rio'
                    Width = 133
                    Visible = True
                  end>
              end
            end
            object TabSheet7: TTabSheet
              Caption = 'Altera'#231#227'o de Cargo'
              ImageIndex = 1
              object DBGrid2: TDBGrid
                Left = 0
                Top = 0
                Width = 758
                Height = 190
                Hint = 'Selecione o registro a ser excluido e pressione Delete'
                DataSource = DataSource1
                DrawingStyle = gdsGradient
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDrawColumnCell = DBGrid2DrawColumnCell
                OnKeyDown = DBGrid2KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'Codigo'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'Data'
                    Width = 73
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Cargo'
                    Width = 309
                    Visible = True
                  end>
              end
            end
            object TabSheet8: TTabSheet
              Caption = 'Contribui'#231#227'o Social'
              ImageIndex = 2
              object DBGrid5: TDBGrid
                Left = 0
                Top = 0
                Width = 758
                Height = 190
                Hint = 'Selecione o registro a ser excluido e pressione Delete'
                DataSource = DataSource5
                DrawingStyle = gdsGradient
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
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
                    FieldName = 'Codigo_Registro'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'Codigo'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'N_Guia'
                    Title.Caption = 'N'#186' Guia'
                    Width = 134
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Data'
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Sindicato'
                    Width = 256
                    Visible = True
                  end>
              end
            end
            object TabSheet9: TTabSheet
              Caption = 'Ocorr'#234'ncias'
              ImageIndex = 3
              object DBGrid4: TDBGrid
                Left = 0
                Top = 0
                Width = 758
                Height = 190
                Hint = 'Selecione o registro a ser excluido e pressione Delete'
                DataSource = DataSource3
                DrawingStyle = gdsGradient
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDrawColumnCell = DBGrid4DrawColumnCell
                OnKeyDown = DBGrid4KeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'Tipo_Ocorrencia'
                    Title.Caption = 'Tipo de Ocorr'#234'ncia'
                    Width = 204
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Codigo'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'Codigo_Funcionario'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'Codigo_Tipo_Ocorrencia'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'Data_Ocorrencia'
                    Title.Caption = 'Ocorr'#234'ncia'
                    Width = 70
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Data_Cadastro'
                    Title.Caption = 'Cadastro'
                    Width = 70
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Observacao'
                    Title.Caption = 'Observa'#231#227'o'
                    Width = 356
                    Visible = True
                  end>
              end
            end
            object TabSheet10: TTabSheet
              Caption = 'F'#233'rias'
              ImageIndex = 4
              object DBGrid3: TDBGrid
                Left = 0
                Top = 0
                Width = 758
                Height = 190
                Hint = 'Selecione o registro a ser excluido e pressione Delete'
                DataSource = DataSource2
                DrawingStyle = gdsGradient
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
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
                    FieldName = 'Codigo_Registro'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'Codigo'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'Ferias_De'
                    Title.Caption = 'F'#233'rias De'
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Ferias_Ate'
                    Title.Caption = 'F'#233'rias At'#233
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Periodo_De'
                    Title.Caption = 'Per'#237'odo De'
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Periodo_Ate'
                    Title.Caption = 'Per'#237'odo At'#233
                    Width = 80
                    Visible = True
                  end>
              end
            end
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'Acesso ao Sistema'
          ImageIndex = 1
          object Label17: TLabel
            Left = 0
            Top = 0
            Width = 30
            Height = 13
            Caption = 'Login'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label18: TLabel
            Left = 0
            Top = 38
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
          object Label22: TLabel
            Left = 0
            Top = 76
            Width = 29
            Height = 13
            Caption = 'Perfil'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtLogin: TEdit
            Left = 0
            Top = 15
            Width = 136
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 0
          end
          object EdtSenha: TEdit
            Left = 0
            Top = 53
            Width = 136
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            PasswordChar = '*'
            TabOrder = 1
          end
          object EdtPerfil: TEdit
            Left = 56
            Top = 91
            Width = 201
            Height = 17
            TabStop = False
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 3
            OnKeyPress = EdtPerfilKeyPress
          end
          object EdtCodigo_Perfil: TEdit
            Left = 0
            Top = 91
            Width = 56
            Height = 17
            Hint = 'Pressione F3 para consultar'
            BevelEdges = [beLeft, beTop, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            Color = clMenu
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnDblClick = EdtCodigo_PerfilDblClick
            OnKeyDown = EdtCodigo_PerfilKeyDown
            OnKeyPress = EdtCodigo_PerfilKeyPress
          end
          object CBADM: TCheckBox
            Left = 142
            Top = 11
            Width = 97
            Height = 17
            Caption = 'Administrador'
            Checked = True
            State = cbChecked
            TabOrder = 4
          end
          object CBAtualiza_Preco_Orcamento: TCheckBox
            Left = 142
            Top = 30
            Width = 122
            Height = 17
            Caption = 'Atualiza Pre'#231'os Or'#231'.'
            Checked = True
            State = cbChecked
            TabOrder = 5
          end
          object GBCaixa: TGroupBox
            Left = 275
            Top = 3
            Width = 126
            Height = 70
            Caption = 'Dados do Caixa'
            TabOrder = 6
            object Label12: TLabel
              Left = 16
              Top = 17
              Width = 64
              Height = 13
              Caption = 'Saldo Atual'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object EdtSaldo_Atual: TEdit
              Left = 16
              Top = 33
              Width = 93
              Height = 17
              BevelInner = bvNone
              BevelKind = bkFlat
              BorderStyle = bsNone
              TabOrder = 0
              Text = '0,00'
              OnExit = EdtSalarioExit
              OnKeyPress = EdtSalarioKeyPress
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
    Height = 455
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
      DragCursor = crHandPoint
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
      Hint = 'Clique para imprimir a ficha do funcion'#225'rio selecionado'
      Caption = '&Imprimir'
      Enabled = False
      ImageIndex = 6
      ParentShowHint = False
      Wrap = True
      ShowHint = True
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
  object ImageList1: TImageList
    Left = 840
    Top = 80
    Bitmap = {
      494C010102000400D00010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
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
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000008080800040404000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      400000000000FFFFFF0000000000000000000000000080808000404040004040
      4000404040004040400040404000404040004040400040404000404040004040
      400000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000FFFFFF0000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      800080808000FFFFFF0000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFFFF00000000
      8003800300000000BFFBBFFB00000000800B800B00000000800B800B00000000
      800B800B00000000800B800B00000000800B800B00000000800B800B00000000
      800B800B00000000800B800B00000000800B800B00000000800B800B00000000
      8003800300000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object qryalteracao_salarial: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    AfterScroll = qryalteracao_salarialAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from Funcionario_Alteracao_Salarial')
    Left = 352
    Top = 24
    object qryalteracao_salarialCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryalteracao_salarialData: TDateTimeField
      FieldName = 'Data'
      EditMask = '!99/99/9999;1;_'
    end
    object qryalteracao_salarialSalario: TFloatField
      FieldName = 'Salario'
      currency = True
    end
  end
  object DataSource4: TDataSource
    DataSet = qryalteracao_salarial
    Left = 384
    Top = 24
  end
  object qryalteracao_cargo: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    AfterScroll = qryalteracao_cargoAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from Funcionario_Alteracao_Cargo')
    Left = 568
    Top = 24
    object qryalteracao_cargoCodigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ReadOnly = True
    end
    object qryalteracao_cargoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryalteracao_cargoData: TDateTimeField
      FieldName = 'Data'
      EditMask = '!99/99/9999;1;_'
    end
    object qryalteracao_cargoCodigo_Cargo: TIntegerField
      FieldName = 'Codigo_Cargo'
    end
    object qryalteracao_cargoCargo: TStringField
      FieldKind = fkLookup
      FieldName = 'Cargo'
      LookupDataSet = DM.qrychama_cargo
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Codigo_Cargo'
      Lookup = True
    end
  end
  object DataSource1: TDataSource
    DataSet = qryalteracao_cargo
    Left = 616
    Top = 24
  end
  object qryferias: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    AfterScroll = qryferiasAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from Funcionario_Ferias')
    Left = 656
    Top = 24
    object qryferiasCodigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ReadOnly = True
    end
    object qryferiasCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryferiasFerias_De: TDateTimeField
      FieldName = 'Ferias_De'
      EditMask = '!99/99/9999;1;_'
    end
    object qryferiasFerias_Ate: TDateTimeField
      FieldName = 'Ferias_Ate'
      EditMask = '!99/99/9999;1;_'
    end
    object qryferiasPeriodo_De: TDateTimeField
      FieldName = 'Periodo_De'
      EditMask = '!99/99/9999;1;_'
    end
    object qryferiasPeriodo_Ate: TDateTimeField
      FieldName = 'Periodo_Ate'
      EditMask = '!99/99/9999;1;_'
    end
  end
  object DataSource2: TDataSource
    DataSet = qryferias
    Left = 688
    Top = 24
  end
  object qryocorrencia: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    BeforePost = qryocorrenciaBeforePost
    AfterScroll = qryocorrenciaAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select O.* from Ocorrencia O')
    Left = 448
    Top = 24
    object qryocorrenciaTipo_Ocorrencia: TStringField
      FieldKind = fkLookup
      FieldName = 'Tipo_Ocorrencia'
      LookupDataSet = DM.qrychama_tipo_ocorrencia
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Codigo_Tipo_Ocorrencia'
      Size = 100
      Lookup = True
    end
    object qryocorrenciaCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryocorrenciaCodigo_Funcionario: TIntegerField
      FieldName = 'Codigo_Funcionario'
    end
    object qryocorrenciaCodigo_Tipo_Ocorrencia: TIntegerField
      FieldName = 'Codigo_Tipo_Ocorrencia'
    end
    object qryocorrenciaData_Ocorrencia: TDateTimeField
      FieldName = 'Data_Ocorrencia'
      Required = True
      EditMask = '!99/99/9999;1;_'
    end
    object qryocorrenciaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
      Required = True
      EditMask = '!99/99/9999;1;_'
    end
    object qryocorrenciaObservacao: TStringField
      FieldName = 'Observacao'
      Size = 500
    end
  end
  object DataSource3: TDataSource
    DataSet = qryocorrencia
    Left = 480
    Top = 24
  end
  object qrycontribuicao_social: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    AfterScroll = qrycontribuicao_socialAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from Funcionario_Contribuicao_Social')
    Left = 760
    Top = 24
    object qrycontribuicao_socialCodigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ReadOnly = True
    end
    object qrycontribuicao_socialCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrycontribuicao_socialN_Guia: TStringField
      FieldName = 'N_Guia'
      Size = 100
    end
    object qrycontribuicao_socialData: TDateTimeField
      FieldName = 'Data'
      EditMask = '!99/99/9999;1;_'
    end
    object qrycontribuicao_socialSindicato: TStringField
      FieldName = 'Sindicato'
      Size = 100
    end
  end
  object DataSource5: TDataSource
    DataSet = qrycontribuicao_social
    Left = 792
    Top = 24
  end
end
