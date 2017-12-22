object FrmCadastro_Etiqueta: TFrmCadastro_Etiqueta
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Etiquetas'
  ClientHeight = 420
  ClientWidth = 804
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
    Width = 679
    Height = 420
    ActivePage = TabSheet4
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Etiqueta Simples'
      object LblCodigo: TLabel
        Left = 0
        Top = 2
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
        Top = 2
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
        Left = 3
        Top = 46
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
      object GroupBox1: TGroupBox
        Left = -4
        Top = 85
        Width = 589
        Height = 236
        Caption = 'Dimens'#245'es'
        TabOrder = 0
        object GroupBox2: TGroupBox
          Left = 16
          Top = 24
          Width = 177
          Height = 105
          Caption = 'Margem'
          TabOrder = 0
          object LblNumero: TLabel
            Left = 6
            Top = 22
            Width = 48
            Height = 13
            Caption = 'Superior'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label1: TLabel
            Left = 6
            Top = 59
            Width = 43
            Height = 13
            Caption = 'Inferior'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 78
            Top = 22
            Width = 52
            Height = 13
            Caption = 'Esquerda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 78
            Top = 59
            Width = 38
            Height = 13
            Caption = 'Direita'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtMargem_Superior: TEdit
            Left = 6
            Top = 37
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 0
            Text = '0,00'
            OnKeyPress = EdtMargem_SuperiorKeyPress
          end
          object EdtMargem_Inferior: TEdit
            Left = 6
            Top = 74
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 1
            Text = '0,00'
            OnKeyPress = EdtMargem_InferiorKeyPress
          end
          object EdtMargem_Esquerda: TEdit
            Left = 78
            Top = 37
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 2
            Text = '0,00'
            OnKeyPress = EdtMargem_EsquerdaKeyPress
          end
          object EdtMargem_Direita: TEdit
            Left = 78
            Top = 74
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 3
            Text = '0,00'
            OnKeyPress = EdtMargem_DireitaKeyPress
          end
        end
        object GroupBox3: TGroupBox
          Left = 199
          Top = 24
          Width = 177
          Height = 105
          Caption = 'Dist'#226'ncia entre Etiquetas'
          TabOrder = 1
          object Label4: TLabel
            Left = 16
            Top = 38
            Width = 58
            Height = 13
            Caption = 'Horizontal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 88
            Top = 38
            Width = 43
            Height = 13
            Caption = 'Vertical'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtDistancia_Horizontal: TEdit
            Left = 16
            Top = 53
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 0
            Text = '0,00'
            OnKeyPress = EdtDistancia_HorizontalKeyPress
          end
          object EdtDistancia_Vertical: TEdit
            Left = 88
            Top = 53
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 1
            Text = '0,00'
            OnKeyPress = EdtDistancia_VerticalKeyPress
          end
        end
        object GroupBox4: TGroupBox
          Left = 382
          Top = 24
          Width = 177
          Height = 105
          Caption = 'Tamanho Etiquetas'
          TabOrder = 2
          object Label5: TLabel
            Left = 16
            Top = 38
            Width = 35
            Height = 13
            Caption = 'Altura'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 88
            Top = 38
            Width = 44
            Height = 13
            Caption = 'Largura'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtAltura_Etiqueta: TEdit
            Left = 16
            Top = 53
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 0
            Text = '0,00'
            OnKeyPress = EdtAltura_EtiquetaKeyPress
          end
          object EdtLargura_Etiqueta: TEdit
            Left = 88
            Top = 53
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 1
            Text = '0,00'
            OnKeyPress = EdtLargura_EtiquetaKeyPress
          end
        end
        object GroupBox5: TGroupBox
          Left = 16
          Top = 135
          Width = 177
          Height = 105
          Caption = 'P'#225'gina'
          TabOrder = 3
          object Label8: TLabel
            Left = 16
            Top = 38
            Width = 35
            Height = 13
            Caption = 'Altura'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 88
            Top = 38
            Width = 44
            Height = 13
            Caption = 'Largura'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtAltura_Pagina: TEdit
            Left = 16
            Top = 53
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 0
            Text = '0,00'
            OnKeyPress = EdtAltura_PaginaKeyPress
          end
          object EdtLargura_Pagina: TEdit
            Left = 88
            Top = 53
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 1
            Text = '0,00'
            OnKeyPress = EdtLargura_PaginaKeyPress
          end
        end
        object GroupBox6: TGroupBox
          Left = 199
          Top = 135
          Width = 247
          Height = 105
          Caption = 'Geral'
          TabOrder = 4
          object Label10: TLabel
            Left = 16
            Top = 38
            Width = 68
            Height = 13
            Caption = 'Etiq. por Lin.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 88
            Top = 38
            Width = 68
            Height = 13
            Caption = 'Lin. por P'#225'g.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 160
            Top = 38
            Width = 63
            Height = 13
            Caption = 'Tam. Fonte'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdtEtiqueta_Linha: TEdit
            Left = 16
            Top = 53
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 0
            Text = '0,00'
            OnKeyPress = EdtEtiqueta_LinhaKeyPress
          end
          object EdtLinha_Pagina: TEdit
            Left = 88
            Top = 53
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 1
            Text = '0,00'
            OnKeyPress = EdtLinha_PaginaKeyPress
          end
          object EdtTamanho_Fonte: TEdit
            Left = 160
            Top = 53
            Width = 70
            Height = 17
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 2
            Text = '0'
            OnKeyPress = EdtTamanho_FonteKeyPress
          end
        end
      end
      object EdtCodigo: TEdit
        Left = 0
        Top = 21
        Width = 56
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        Color = clBtnFace
        TabOrder = 1
      end
      object MEdtData_Cadastro: TMaskEdit
        Left = 55
        Top = 21
        Width = 79
        Height = 17
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 2
        Text = '  /  /    '
        OnEnter = MEdtData_CadastroEnter
        OnExit = MEdtData_CadastroExit
      end
      object EdtDescricao: TEdit
        Left = 3
        Top = 62
        Width = 257
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 3
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Etiquetadora'
      ImageIndex = 1
      object Label13: TLabel
        Left = 0
        Top = 2
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
      object Label14: TLabel
        Left = 55
        Top = 2
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
      object Label72: TLabel
        Left = 4
        Top = 155
        Width = 60
        Height = 13
        Caption = 'Dist. Horiz.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label73: TLabel
        Left = 68
        Top = 155
        Width = 55
        Height = 13
        Caption = 'Dist. Vert.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 0
        Top = 46
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
      object edtCodCompleta: TEdit
        Left = 0
        Top = 21
        Width = 56
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        Color = clBtnFace
        TabOrder = 0
      end
      object edtDataCompleta: TMaskEdit
        Left = 55
        Top = 21
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
      object EdtDescricaoCompleta: TEdit
        Left = 0
        Top = 62
        Width = 257
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 2
      end
      object GroupBox7: TGroupBox
        Left = 416
        Top = 85
        Width = 244
        Height = 261
        Caption = 'Impress'#227'o do texto na etiqueta'
        TabOrder = 3
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
        end
      end
      object GroupBox8: TGroupBox
        Left = -4
        Top = 85
        Width = 383
        Height = 68
        Caption = 'Impress'#227'o da barra na etiqueta'
        TabOrder = 4
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
          Left = 208
          Top = 19
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
          Left = 261
          Top = 19
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
          Left = 314
          Top = 19
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
          Left = 208
          Top = 35
          Width = 54
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 3
        end
        object EdtVertical_Barra: TEdit
          Left = 261
          Top = 35
          Width = 54
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 4
        end
        object EdtLargura_Barra_Larga: TEdit
          Left = 72
          Top = 35
          Width = 69
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 1
        end
        object EdtLargura_Barra_Fina: TEdit
          Left = 140
          Top = 35
          Width = 69
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 2
        end
        object EdtAltura_Codigo: TEdit
          Left = 314
          Top = 35
          Width = 54
          Height = 17
          BevelInner = bvNone
          BevelKind = bkFlat
          BevelOuter = bvRaised
          BorderStyle = bsNone
          CharCase = ecUpperCase
          TabOrder = 5
        end
      end
      object EdtDistHoriz: TEdit
        Left = 4
        Top = 174
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
        TabOrder = 5
      end
      object EdtDistVert: TEdit
        Left = 68
        Top = 174
        Width = 69
        Height = 17
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 6
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
