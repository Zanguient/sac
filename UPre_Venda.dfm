object FrmPre_Venda: TFrmPre_Venda
  Left = 225
  Top = 20
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pr'#233'-Venda'
  ClientHeight = 531
  ClientWidth = 929
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
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
    Left = 134
    Top = 0
    Width = 787
    Height = 531
    ActivePage = TabSheet1
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Lan'#231'amento da Pr'#233'-Venda'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object LblData_Cadastro: TLabel
        Left = 1
        Top = 95
        Width = 35
        Height = 13
        Caption = 'Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblNome: TLabel
        Left = 1
        Top = 57
        Width = 39
        Height = 13
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 66
        Top = 95
        Width = 53
        Height = 13
        Caption = 'Prev. Ent.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 1
        Top = 17
        Width = 59
        Height = 13
        Caption = 'Pr'#233'-Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 130
        Top = 95
        Width = 27
        Height = 13
        Caption = 'Hora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblCPF: TLabel
        Left = 170
        Top = 0
        Width = 53
        Height = 13
        Caption = 'CPF/CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object LblEndereco: TLabel
        Left = 151
        Top = 19
        Width = 52
        Height = 13
        Caption = 'Endere'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object LblSetor: TLabel
        Left = 313
        Top = 19
        Width = 31
        Height = 13
        Caption = 'Setor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object LblTelefone: TLabel
        Left = 364
        Top = 0
        Width = 49
        Height = 13
        Caption = 'Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object LblCidade: TLabel
        Left = 261
        Top = 0
        Width = 38
        Height = 13
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object LblUF: TLabel
        Left = 327
        Top = 0
        Width = 14
        Height = 13
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object LblTipo_Logradouro: TLabel
        Left = 209
        Top = 19
        Width = 92
        Height = 13
        Caption = 'Tipo Logradouro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object LblNumero: TLabel
        Left = 364
        Top = 19
        Width = 7
        Height = 13
        Caption = 'N'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object LblBase_Acrescida_IPI: TLabel
        Left = 344
        Top = 83
        Width = 72
        Height = 13
        Caption = 'Base Acrescida'
        Visible = False
      end
      object LblIPI: TLabel
        Left = 344
        Top = 41
        Width = 14
        Height = 13
        Caption = 'IPI'
        Visible = False
      end
      object LblCST_IPI: TLabel
        Left = 344
        Top = 55
        Width = 36
        Height = 13
        Caption = 'CST IPI'
        Visible = False
      end
      object LblBC_IPI: TLabel
        Left = 344
        Top = 97
        Width = 63
        Height = 13
        Caption = 'Base_Calculo'
        Visible = False
      end
      object LblPIS: TLabel
        Left = 420
        Top = 41
        Width = 16
        Height = 13
        Caption = 'PIS'
        Visible = False
      end
      object LblCST_PIS: TLabel
        Left = 420
        Top = 55
        Width = 38
        Height = 13
        Caption = 'CST PIS'
        Visible = False
      end
      object LblBase_Reduzida_PIS: TLabel
        Left = 420
        Top = 68
        Width = 70
        Height = 13
        Caption = 'Base Reduzida'
        Visible = False
      end
      object LblBase_Acrescida_PIS: TLabel
        Left = 420
        Top = 83
        Width = 72
        Height = 13
        Caption = 'Base Acrescida'
        Visible = False
      end
      object LblBC_PIS: TLabel
        Left = 420
        Top = 97
        Width = 63
        Height = 13
        Caption = 'Base_Calculo'
        Visible = False
      end
      object LblCOFINS: TLabel
        Left = 500
        Top = 41
        Width = 38
        Height = 13
        Caption = 'COFINS'
        Visible = False
      end
      object LblCST_COFINS: TLabel
        Left = 500
        Top = 55
        Width = 60
        Height = 13
        Caption = 'CST COFINS'
        Visible = False
      end
      object LblBase_Reduzida_COFINS: TLabel
        Left = 500
        Top = 68
        Width = 70
        Height = 13
        Caption = 'Base Reduzida'
        Visible = False
      end
      object LblBase_Acrescida_COFINS: TLabel
        Left = 500
        Top = 83
        Width = 72
        Height = 13
        Caption = 'Base Acrescida'
        Visible = False
      end
      object LblBC_COFINS: TLabel
        Left = 500
        Top = 97
        Width = 63
        Height = 13
        Caption = 'Base_Calculo'
        Visible = False
      end
      object LblICMS: TLabel
        Left = 583
        Top = 40
        Width = 25
        Height = 13
        Caption = 'ICMS'
        Visible = False
      end
      object LblCST: TLabel
        Left = 583
        Top = 54
        Width = 19
        Height = 13
        Caption = 'CST'
        Visible = False
      end
      object LblBase_Reduzida: TLabel
        Left = 583
        Top = 67
        Width = 70
        Height = 13
        Caption = 'Base Reduzida'
        Visible = False
      end
      object LblBase_Acrescida: TLabel
        Left = 583
        Top = 82
        Width = 72
        Height = 13
        Caption = 'Base Acrescida'
        Visible = False
      end
      object LblBC: TLabel
        Left = 583
        Top = 96
        Width = 63
        Height = 13
        Caption = 'Base_Calculo'
        Visible = False
      end
      object LblBase_Reduzida_IPI: TLabel
        Left = 344
        Top = 68
        Width = 70
        Height = 13
        Caption = 'Base Reduzida'
        Visible = False
      end
      object LblValor_ICMS: TLabel
        Left = 583
        Top = 110
        Width = 52
        Height = 13
        Caption = 'Valor ICMS'
        Visible = False
      end
      object LblValor_COFINS: TLabel
        Left = 500
        Top = 110
        Width = 65
        Height = 13
        Caption = 'Valor COFINS'
        Visible = False
      end
      object LblValor_PIS: TLabel
        Left = 420
        Top = 110
        Width = 43
        Height = 13
        Caption = 'Valor PIS'
        Visible = False
      end
      object LblValor_IPI: TLabel
        Left = 344
        Top = 110
        Width = 41
        Height = 13
        Caption = 'Valor IPI'
        Visible = False
      end
      object LblSub_Total_Liquido: TLabel
        Left = 690
        Top = 110
        Width = 81
        Height = 13
        Caption = 'Sub Total Liquido'
        Visible = False
      end
      object EdtCodigo: TEdit
        Left = 1
        Top = 32
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
      object MEdtData_Venda: TMaskEdit
        Left = 1
        Top = 110
        Width = 62
        Height = 17
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 4
        Text = '  /  /    '
        OnEnter = MEdtData_VendaEnter
      end
      object EdtCodigo_Cliente: TEdit
        Left = 1
        Top = 72
        Width = 62
        Height = 17
        Hint = 'Pressione F3 para consultar'
        BevelEdges = [beLeft, beTop, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clCream
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnKeyDown = EdtCodigo_ClienteKeyDown
        OnKeyPress = EdtCodigo_ClienteKeyPress
      end
      object EdtCliente: TEdit
        Left = 62
        Top = 72
        Width = 279
        Height = 17
        TabStop = False
        BevelEdges = [beTop, beRight, beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        CharCase = ecUpperCase
        TabOrder = 3
        OnKeyPress = EdtClienteKeyPress
      end
      object MEdtData_Previsao_Entrega: TMaskEdit
        Left = 66
        Top = 110
        Width = 61
        Height = 17
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 5
        Text = '  /  /    '
        OnEnter = MEdtData_Previsao_EntregaEnter
      end
      object PageControl2: TPageControl
        Left = 0
        Top = 133
        Width = 785
        Height = 369
        Cursor = crHandPoint
        ActivePage = TabSheet2
        HotTrack = True
        Style = tsFlatButtons
        TabOrder = 7
        object TabSheet2: TTabSheet
          Caption = 'Itens da Pr'#233'-Venda'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label5: TLabel
            Left = 0
            Top = 1
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
            Left = 336
            Top = 1
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
          object Label7: TLabel
            Left = 413
            Top = 1
            Width = 27
            Height = 13
            Caption = 'Qtde'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 461
            Top = 1
            Width = 50
            Height = 13
            Caption = 'Valor Un.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 651
            Top = 1
            Width = 61
            Height = 13
            Caption = 'Valor Total'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblProduto: TLabel
            Left = 119
            Top = 1
            Width = 45
            Height = 13
            Caption = 'Produto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object Label13: TLabel
            Left = 531
            Top = 1
            Width = 30
            Height = 13
            Caption = 'Desc.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 591
            Top = 1
            Width = 29
            Height = 13
            Caption = 'Acre.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 377
            Top = 1
            Width = 17
            Height = 13
            Caption = 'S.T'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblBase_Reducao: TLabel
            Left = 737
            Top = 178
            Width = 37
            Height = 13
            Caption = 'LblTotal'
            Visible = False
          end
          object LblTipo: TLabel
            Left = 183
            Top = 1
            Width = 24
            Height = 13
            Caption = 'Tipo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object DBGrid1: TDBGrid
            Left = 0
            Top = 33
            Width = 773
            Height = 233
            Hint = 'Pressione Delete para remover o item selecionado'
            BorderStyle = bsNone
            DataSource = ds_itens_venda
            DrawingStyle = gdsGradient
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 19
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
                FieldName = 'N_Pedido'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'Codigo_Produto'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'Codigo_Venda'
                Title.Caption = 'Codigo Produto'
                Width = 88
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Descricao'
                Title.Caption = 'Descri'#231#227'o'
                Width = 227
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UN'
                Title.Caption = 'Un.'
                Width = 47
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ICMS'
                Title.Caption = 'ST.'
                Width = 43
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Qtde'
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Valor_Unitario'
                Title.Caption = 'Valor Unit'#225'rio'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Desconto'
                Width = 51
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Acrecimo'
                Title.Caption = 'Acr'#233'scimo'
                Width = 55
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Tipo_Desconto'
                Title.Caption = 'Tipo'
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Sub_Total'
                Title.Caption = 'Sub Total'
                Width = 62
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Cancelado'
                Title.Caption = 'Can.'
                Visible = False
              end>
          end
          object EdtCodigo_Produto: TEdit
            Left = 0
            Top = 16
            Width = 113
            Height = 17
            Hint = 'Pressione F3 para consultar'
            BevelEdges = [beLeft, beTop, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            Color = clCream
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnKeyDown = EdtCodigo_ProdutoKeyDown
            OnKeyPress = EdtCodigo_ProdutoKeyPress
          end
          object EdtProduto: TEdit
            Left = 113
            Top = 16
            Width = 225
            Height = 17
            TabStop = False
            BevelEdges = [beTop, beRight, beBottom]
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 1
            OnKeyPress = EdtProdutoKeyPress
          end
          object EdtUnidade: TEdit
            Left = 336
            Top = 16
            Width = 42
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ReadOnly = True
            TabOrder = 2
          end
          object EdtQuantidade: TEdit
            Left = 413
            Top = 16
            Width = 49
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 4
            OnExit = EdtQuantidadeExit
            OnKeyPress = EdtQuantidadeKeyPress
          end
          object EdtValor_Unitario: TEdit
            Left = 461
            Top = 16
            Width = 71
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 5
            Text = '0,00'
            OnExit = EdtValor_UnitarioExit
            OnKeyPress = EdtValor_UnitarioKeyPress
          end
          object EdtValor_Total: TEdit
            Left = 651
            Top = 16
            Width = 75
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ReadOnly = True
            TabOrder = 8
            Text = '0,00'
            OnEnter = EdtValor_TotalEnter
            OnExit = EdtValor_TotalExit
            OnKeyDown = EdtValor_TotalKeyDown
            OnKeyPress = EdtValor_TotalKeyPress
          end
          object Edit2: TEdit
            Left = 0
            Top = 268
            Width = 73
            Height = 17
            TabStop = False
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BiDiMode = bdLeftToRight
            BorderStyle = bsNone
            Color = clMenu
            Ctl3D = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 20
            Text = 'Qtde Itens'
          end
          object EdtQuantidade_Itens: TEdit
            Left = 0
            Top = 284
            Width = 73
            Height = 17
            Alignment = taRightJustify
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            DoubleBuffered = False
            ParentDoubleBuffered = False
            ReadOnly = True
            TabOrder = 9
            Text = '0'
          end
          object EdtTotal_Produtos: TEdit
            Left = 72
            Top = 284
            Width = 95
            Height = 17
            Alignment = taRightJustify
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            DoubleBuffered = False
            ParentDoubleBuffered = False
            ReadOnly = True
            TabOrder = 10
            Text = '0,00'
          end
          object Edit4: TEdit
            Left = 72
            Top = 268
            Width = 95
            Height = 17
            TabStop = False
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 21
            Text = 'Total Produtos'
          end
          object Edit3: TEdit
            Left = 396
            Top = 268
            Width = 95
            Height = 17
            TabStop = False
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 22
            Text = 'Limite de Com.'
          end
          object EdtLimite_Compra: TEdit
            Left = 396
            Top = 284
            Width = 95
            Height = 17
            Alignment = taRightJustify
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            DoubleBuffered = False
            ParentDoubleBuffered = False
            ReadOnly = True
            TabOrder = 12
            Text = '0,00'
          end
          object Edit6: TEdit
            Left = 490
            Top = 268
            Width = 95
            Height = 17
            TabStop = False
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 23
            Text = 'Limite Disp.'
          end
          object EdtLimite_Compra_Disponivel: TEdit
            Left = 490
            Top = 284
            Width = 95
            Height = 17
            Alignment = taRightJustify
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            DoubleBuffered = False
            ParentDoubleBuffered = False
            ReadOnly = True
            TabOrder = 13
            Text = '0,00'
          end
          object EdtPeso_Total: TEdit
            Left = 166
            Top = 284
            Width = 73
            Height = 17
            Alignment = taRightJustify
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            DoubleBuffered = False
            ParentDoubleBuffered = False
            ReadOnly = True
            TabOrder = 11
            Text = '0,00'
          end
          object Edit7: TEdit
            Left = 166
            Top = 268
            Width = 73
            Height = 17
            TabStop = False
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 24
            Text = 'Peso Total'
          end
          object EdtDesconto: TEdit
            Left = 584
            Top = 321
            Width = 95
            Height = 17
            Alignment = taRightJustify
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            DoubleBuffered = False
            ParentDoubleBuffered = False
            TabOrder = 17
            Text = '0,00'
            OnExit = EdtDescontoExit
          end
          object Edit8: TEdit
            Left = 584
            Top = 305
            Width = 95
            Height = 17
            TabStop = False
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 25
            Text = 'Desconto'
          end
          object Edit5: TEdit
            Left = 678
            Top = 305
            Width = 95
            Height = 17
            TabStop = False
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 26
            Text = 'Total do Pedido'
          end
          object EdtTotal_Pedido: TEdit
            Left = 678
            Top = 321
            Width = 95
            Height = 17
            Alignment = taRightJustify
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            DoubleBuffered = False
            ParentDoubleBuffered = False
            ReadOnly = True
            TabOrder = 18
            Text = '0,00'
            OnEnter = EdtTotal_PedidoEnter
          end
          object Edit1: TEdit
            Left = 584
            Top = 268
            Width = 95
            Height = 17
            TabStop = False
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 27
            Text = 'Limite de Desc.'
          end
          object EdtLimite_Desconto: TEdit
            Left = 584
            Top = 284
            Width = 95
            Height = 17
            Alignment = taRightJustify
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            DoubleBuffered = False
            ParentDoubleBuffered = False
            ReadOnly = True
            TabOrder = 14
            Text = '0,00'
          end
          object Edit10: TEdit
            Left = 678
            Top = 268
            Width = 95
            Height = 17
            TabStop = False
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 28
            Text = 'Limite Disp.'
          end
          object EdtLimite_Desconto_Disponivel: TEdit
            Left = 678
            Top = 284
            Width = 95
            Height = 17
            Alignment = taRightJustify
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            DoubleBuffered = False
            ParentDoubleBuffered = False
            ReadOnly = True
            TabOrder = 15
            Text = '0,00'
          end
          object EdtDesconto_Item: TEdit
            Left = 531
            Top = 16
            Width = 61
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 6
            Text = '0,00'
            OnEnter = EdtDesconto_ItemEnter
            OnExit = EdtDesconto_ItemExit
            OnKeyPress = EdtDesconto_ItemKeyPress
          end
          object EdtAcrecimo: TEdit
            Left = 591
            Top = 16
            Width = 61
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            TabOrder = 7
            Text = '0,00'
            OnEnter = EdtAcrecimoEnter
            OnExit = EdtAcrecimoExit
            OnKeyPress = EdtAcrecimoKeyPress
          end
          object EdtST: TEdit
            Left = 377
            Top = 16
            Width = 37
            Height = 17
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            ReadOnly = True
            TabOrder = 3
          end
          object EdtAcrecimo_Total: TEdit
            Left = 490
            Top = 321
            Width = 95
            Height = 17
            Alignment = taRightJustify
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            DoubleBuffered = False
            ParentDoubleBuffered = False
            ReadOnly = True
            TabOrder = 16
            Text = '0,00'
            OnExit = EdtAcrecimo_TotalExit
          end
          object Edit11: TEdit
            Left = 490
            Top = 305
            Width = 95
            Height = 17
            TabStop = False
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 29
            Text = 'Acr'#233'scimo'
          end
          object EdtTotal_Acrecimo: TEdit
            Left = 0
            Top = 321
            Width = 95
            Height = 17
            Alignment = taRightJustify
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            DoubleBuffered = False
            ParentDoubleBuffered = False
            ReadOnly = True
            TabOrder = 30
            Text = '0,00'
          end
          object Edit13: TEdit
            Left = 0
            Top = 305
            Width = 95
            Height = 17
            TabStop = False
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 31
            Text = 'Total Acr.'
          end
          object Edit9: TEdit
            Left = 94
            Top = 305
            Width = 95
            Height = 17
            TabStop = False
            Alignment = taCenter
            BevelInner = bvNone
            BevelKind = bkFlat
            BorderStyle = bsNone
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 32
            Text = 'Total Desc.'
          end
          object EdtTotal_Desconto: TEdit
            Left = 94
            Top = 321
            Width = 95
            Height = 17
            Alignment = taRightJustify
            BevelInner = bvNone
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            CharCase = ecUpperCase
            DoubleBuffered = False
            ParentDoubleBuffered = False
            ReadOnly = True
            TabOrder = 33
            Text = '0,00'
          end
        end
      end
      object EdtN_Pedido: TEdit
        Left = 1
        Top = 32
        Width = 85
        Height = 17
        Hint = 'Digite o n'#250'mero da Pr'#233'-Venda e pressionar Enter'
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnKeyDown = EdtN_PedidoKeyDown
      end
      object MEdtHora_Entrega: TMaskEdit
        Left = 130
        Top = 110
        Width = 41
        Height = 17
        BevelInner = bvNone
        BevelOuter = bvRaised
        BevelKind = bkFlat
        BorderStyle = bsNone
        EditMask = '!99:99;1;_'
        MaxLength = 5
        TabOrder = 6
        Text = '  :  '
        OnEnter = MEdtHora_EntregaEnter
      end
      object CBVerifica: TCheckBox
        Left = 187
        Top = 109
        Width = 66
        Height = 17
        Caption = #192' Vista'
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
    end
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 133
    Height = 531
    Align = alLeft
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
    TabOrder = 1
    object BBtnOrcamento: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Caption = '&Salvar'
      Enabled = False
      ImageIndex = 0
      ParentShowHint = False
      Wrap = True
      ShowHint = False
      OnClick = BBtnOrcamentoClick
    end
    object BBtnCopiar_Pedido: TToolButton
      Left = 0
      Top = 38
      Cursor = crHandPoint
      Hint = 'Clique para Mesclar duas ou mais Pr'#233'-Vendas em uma nova'
      Caption = 'Cop&iar Pedido'
      Enabled = False
      ImageIndex = 8
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnCopiar_PedidoClick
    end
    object BBtnFechar: TToolButton
      Left = 0
      Top = 76
      Cursor = crHandPoint
      Caption = 'Fechar Janela'
      ImageIndex = 5
      OnClick = BBtnFecharClick
    end
  end
  object ImgImagens_Comandos: TImageList
    AllocBy = 0
    Height = 32
    Width = 32
    Left = 640
    Top = 8
    Bitmap = {
      494C01010A000C00900220002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000008000000060000000010020000000000000C0
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F8F7F900F9F7F700F9F9F900FBF8FA00000000000000
      000000000000F8F7F90000000000FAF8F800FAF8F800FAF8F700FCF8F700FCF8
      F700FDF8F500FDF9F400FEFAF500EDE7E200D1C8BF00B8ADA500EEE9E6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FAF8F800F7F7F700F8F7F900F3F7F800EAF7
      FF00B3DEF300B0DDF200E6F7FF00F5F6FA00F8F7F900FBF9F900FAF8F8000000
      0000F9F9F9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FAF8F800F7F7F70000000000F8F9F700FAF8F700FCF9
      F500FDF8F500FDF8F500F7F1EC00EAE2DB00CEC5BC00BBAEA600AD9F9300A699
      8900AE9E8D00B59F8D00B9A09000B6A08E00B79F8D00B9A89500D8D0C9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0F6FB00D7F6FF0065AD
      CF001D93C7000E86B4004892AE0058686E00B2B2B200E8E8E800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8F7F90000000000000000000000
      0000FAF9F500FBF8F400FCF7F400FEF8F300EBE2DE00D2C8C100BFB6AD00AB9F
      95009F8F8200A18E7F00A5918000A48E7C00B0988600B0978700B2988700B79F
      8900B79F8B00B8A08E00B9A09000B9A09000BEA79100BCA89600D2C9C000F7F7
      F700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F8F9F700F6F8F800E1F7FF009BD1EA0037A3D2002DB4
      E800158BBE001998C500006F9700000918000000000000000100000000007777
      7700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F8F9F700000000000000
      000094887E008F7F7200938071009580710096817200947F7000927F70008A78
      670083706300826F60007C685D009280750096817200AE988600B7A08A00B89F
      8B00B9A09000B9A18F00BAA08F00C2A79300C0A89000C7B09A00BEB1A9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F3F8FB00DAF7FF0048A6D10027AEE4001AB0DF0019AF
      DE000E84B7000C8DBA0025A7D2003287A7000000000000000000020001000000
      000010101000F7F7F700F7F7F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6F8F80000000000F6F8F8000000
      0000A1918400C5B1A600E3D1C600F2E0D500F9E8DF00F2E2D600F2E0D900EFDB
      D600EED8D200EDD8D000E5D0C800CAB8B100D5C0B80089776C00A5917F00B79F
      8D00BAA18D00C0A89200C1A99100C1A99100BFA89200C5AF9D00ACA298000000
      00000000000000000000000000000000000000000000F8F9F70000000000FAF8
      F8000000000000000000F6F8F800000000000000000000000000F9F9F900F9F9
      F900ECF8FC00A8DFFE0046A6D4002EAFE00016B0E10010B0E00010B1DE0015B0
      DE00057CAD001890BA001DA9D8001396C1000021360001020000000000000000
      00000000000000000000DADADA00F9F9F9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F6F8F800000000000000
      0000B0A09400FDE8E000F6E0DA00F5E0D800F3E0D800F1DFD800F2DDDB00F3DA
      D800F0D9D100EFD8D000E2CFC700BFAFA800D8C0BA00DCC6C000846E6300A790
      8000C1A89400C1A99100C3A89300C3A99800C5A89900CAB0A200A5989000FAF8
      F8000000000000000000000000000000000000000000F6F8F800000000000000
      000000000000FAF8F800F8F7F900FAF7F90000000000F9F7F700F9F8FA00E6F6
      FF0055ACD80032B1E4001CAEE20014AFE00013B0E20010B0E00010AFE10015AF
      E0000176A9001A90BA000A91BD001DAFDF002F89AC0000000700000000000000
      000000000000000000006A6A6A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B3A79B00FCE8DD00F7E0D800F2DFD800EEDED700EED9D700EDD7D200F0D9
      D100ECD7CF00E9D8CF00E2CFC700C2AFA800D4BFB700D4BFB700D9C7C000836F
      6400B1998700C0A89200C2A89700C2A99500CAAE9D00C7B19F009B9187000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F6F8F800F6F8F80000000000EDF8FC00C8F4FF0047A6
      D20025B6EA0014AFE60012B0E5000EAFE3000FAFDF0011AFDF0010B1DE0013B0
      DC000075A4001C95BC001091B80017B1E200006F940000091F00000000000001
      0000000000000000010090909000F9F9F9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFB0A700F0DBD300F3E0D900F2DED900F0D9D700EFD6D200EFD7D100EFD8
      D000E9D8CF00E9D7D000E2CFC700C1AFA800D3C0B900D9C7C000DDC7C100E4CF
      C7009B887B00B7A18F00C2A89700C8AF9B00C8B09800C7B19F0097887F00F9F9
      F90000000000000000000000000000000000FAF8F80000000000000000000000
      000000000000F9F9F90000000000FAF8F800D6F7FF004AA4D30033B1E1001FB6
      E90014B7E80012B6EA0012B6EB000FB1E5000FB0E40010AFE10010B0E00014B0
      DE000074A7001B96BC001997BA0019AFDE001AA8D7003697BD0000000E000000
      0000000000003638390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C1B8AE00EAD7CF00F4DED900F0DAD500EDD8D000EDD8D000EBD8D000E6D6
      CF00ECD7CF00E5D0C800E2CEC900BFAFA900DCC9C100DEC7BF00DCC8BD00E2CF
      C700E2CFC7008E786C00A4907F00C1A89400C8B09A00C7B19F00716559000000
      0000000000000000000000000000000000000000000000000000F8F7F900F8F7
      F900F5F7F800EDF7FE00D7F6FF005FADD10027B5EA0018B7E90011B6E70010B8
      E8000FB7E7000FB7E70010B8E80010B8E80011B5E90010B0E6000FAEE00014AF
      E0000075A7001B97C0001998BE000A98C10019B7E700007FAE002B87AA001E28
      2800F7F7F700F7F6F80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DED8CB00E0D0C400EDD7D100EED7CF00EED9D100E9D8CF00E9D7D000E3D0
      C800E7D0C800E4CEC800E0CAC400C0AEA700DDC8C000DCC7BF00E1CEC600E1CF
      C800E3D0C800E3D0C800A18F8400AA968500C7AF9B00C7B0A0006D6254000000
      00000000000000000000000000000000000000000000FAF8F80000000000F6F8
      F800DCF6FF0079BAD90038ABDD0022B7E90014B8E70010B8E7000EB9E7000EB9
      E7000EB9E7000DB8E6000EB9E70010B8E80010B8E80012B6EA000FB0E60012AF
      E1000076A4001A98C1001798BF001197BF0012B8E70017B0DD0004709200CCF7
      FF00F7F7F700F7F7F700F8F9F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F8F7
      F900DFD7D000E0CEC300EDD8D000EDD8D000E9D8CF00EAD8D100EAD7D000E4CF
      C700E7D0C800E2CFC800DBC8C000C1AEA900E2CFC700E1CFC800E1CFC800E8D1
      C900E7D0C800E4CFC700EAD7D000A9978C00B5A09100C5B1A0006D615700F9F9
      F900000000000000000000000000000000000000000000000000F4F7FB00DDF7
      FF0044A3D4002BB5E9001AB8E80012B7E8000EB9E70012C0EB0010BFEA000FC0
      EB0012C1EC0010BFEA000EB9E7000EB8E80011B9E80012B7E80012B6EB0017B0
      E7000076A6001998BF001998BE001798BF0014B7E80014B6E6000A8FBB0076C1
      E100F6F8F8000000000000000000FAF8F8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FAF7F900000000000000
      0000F3E9E200D1C0B700EBD8D000E9D7D000EAD7D000E5D0C800E6CFC700E5D0
      C800E1CEC700DAC7BF00DAC7BF00C1AEA900DFCFC800DECEC700E2CFC700E2CF
      C700E5D0C800E2CFC800E7D7D000E8D6CF0089776C00BDA998006D615500FAF8
      F70000000000000000000000000000000000F7F7F700F7F7F700E5F8FF005CB4
      DD001DB6E90014B7E80010B8E80010B8E80011BFEA0011BFED0010C0EF0010C0
      EF0010C0EF0010C0EF0012C1EC0011BFEA0010B8E80010B7EA0010B7EA0012B1
      E3000076A600229EC00000708F001B99BC001EB7E40012B7E80019B0E2000D72
      9800EDF8FC0000000000F7F7F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FAF8F80000000000FAF8
      F800FFF8F100CAB7AF00EBD8D000E5D0C800E7D0C800E5CFC900E2CFC800E3D0
      C800E0C9C100DEC9C100DDC8C000CAB7B000B7A7A000B9A6A100BAA8A100B9A6
      A100B9A6A100BBA7A200BBA59F00C3AFAA00CEB9B100AE9E8D0078685C00FAF8
      F80000000000000000000000000000000000F4FCF500C8C7C900E3F7FF0069CE
      FB0012B7E80012B7E80012B6EA000EB9E70012C0EF0010C0EF0010C0EF0010C0
      EF0010C0EF0010C0EF0010C0EF0011C2EF0011B9E80010B7EA0013B7EB0017B6
      E8000074A8002D908E000B5B66002A9EBF00109EC70012B7E80013B6E700129F
      D00095D0EA00EDF8FC00F9F9F900F9F9F9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFF9F400BDAEA500E5D0C800E7D1C600E1CFC800DECFC600E1D0C700DDC8
      C000DDC7C100D9C7C000D9C8BF00D3C0B800D3C0B800D1C0B700CDBAB500CCB6
      B000CCB6B000CDB7B100CCB7AF00CBB8B100CBB8B000AD9E8E007E716300FAF8
      F70000000000000000000000000000000000B7D6B90083A283007A8F97006AC9
      F1000FB7E7000EB8E8000EB8E80011BEEC000DBFEE000DC0ED000FC1F00010C1
      EE0010C0EF0010C0EF000EC0EF0011C2EF0010BEE90010B7EA0010B8E80015A7
      D70021A0CD0032997E00004239002492AC000F98BE0015B8E5000FB6E90015B0
      E1003191B500E4F7FF00F8F9F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6F8F80000000000F8F9F7000000
      0000FCF8F700B7A59E00E6D1C900E3D0C900E1D0C700DDC7C100DDC8C000DDC8
      C000DAC7C000DCC7BF00D7C0B800D7BFB900D4C1BA00D1BFB800D4BEB800CFB8
      B000CFB8B000CFB7B100CDB7B100CAB7B000CBB8B000A9978C00675A4C00FCF8
      F70000000000000000000000000000000000E3FFE4004DA34F0050805C001F62
      77001EB6E50012B7E80010B8E80010BDEB0010C0EF000FBFEE0010C0EF0013C1
      F0000FBFEE0010C0EF0010C0EF0011BFEE0011BEEC0010B8E80019B7E700007A
      A600199CC7002F967000003D250011748800159EC4001BB7E50011B8EB0013B1
      E600006E9B00C7EFFF00F4F7FB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FAF8
      F800FCF8F700B2A09900E2D1C800E2CFC800DEC9C100E0C9C100DDCAC300DAC8
      C100DAC7BF00D5C0B800D6C0BA00D4C1BA00D3C0B900CCB9B100CDB8B000D0B9
      B100CEBAAF00CAB7B000CCB6B000C6B1A900CDB8B000AA998C0076695B00FCF9
      F50000000000000000000000000000000000EAFFEB0073D1730071D173001C6E
      390000536A002DAED50016B9E60012BFED000FBEF00010C0EF000DBFF00010C0
      EF0012C0EF0010C1EE0010C0EF0011C1F00011BFE90018B8E800159ECF001D97
      CB001CA1C60024835700114E2A00005C6D0011A0C60014B8E70010B8E8000FB1
      E50019A0CE0054A7C600E7F9FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F8F9
      F700F7F8F400A5968D00DFC8C000DFC8C000DAC7BF00D9C7C000DAC7C000D5C0
      B800D7C0B800D1BEB600D1BFB800CBB8B000CFB8B000CDB8B000CFB9AE00CAB7
      B000C3B0A900C4AEA800C7B0A800C4B0A500C5B1A600A696890083766800FCF9
      F50000000000000000000000000000000000F0FFEF0082CD810068D9670067D8
      660053B75D0010643A00086157000064730029BFE7001FC0EC0017C0EC0012C0
      EF0010C0EF0010C0EF0013C1F0001AC0EF00008CBF001C9CD100199DCC0015A1
      C60027A9AE00237445001C552E000057660010B8E80010B8E80012B7E8000FB1
      E50015AFE0000077A2007DBEDA00ECF8FC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7F7F700AA9D9500DDC8C000DAC7BF00DAC7C000D4C1BA00D5C0B800D5C0
      B800D4BEB800D2BFB800CBB8B000CEB7AF00CDB8B000CDB8B000CAB7B000C5AF
      A900C6AFA700C7B0A800C5B0A800C2AFA700C2AFA7009F8F83008D7F7300FDF9
      F40000000000000000000000000000000000F1FDF1009BDB990068D9670063D6
      61005FD25D005CCC5E005BBB60001B703C000A605A000056670002829F0027BD
      E2001EBFEB0019C0EC0019B6E8000084B8001C9DCE0017A0C700149FC6001AA0
      C80033A6920026713D00225C33000064740010B8E80010B8E70012B6EA0011B1
      E70010B0E0001CA6D4000E78A100DBF7FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F6F9F700A4988E00D9C8BF00D3C0B800D5BFB900D5C0B800D5C0B800D2BF
      B800CDB8B000CEB7AF00CEB7AF00CFB8B000CAB7AF00C6B3AC00C5AFA900C7B0
      A800C5B0A800C2AFA700C2B0A900C1AFA800BBA8A00097877A0094877700FDF8
      F50000000000000000000000000000000000F4FDF300ABE4AD0067DA650063D6
      610059CE590058C858005AC75A0058BF56004BA34F001B6A39000B5942000B5F
      5B0000546F00007EA8000888BB001C9DCA001BA0C600199FC90015A0C70015A1
      C600288E65002A723600225C33000063750010B8E80010B8E8000FB1E50010B0
      E60010B0E00014B0DE000180AD008EC9E3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A99F9500D2C0B500D6BFB700D5C0B800D1C0B700D2BFB700CFB8
      B000CEB8AD00CEB8AD00CAB4AE00C6B3AC00C5AFA900C7AFA900C7B0A800C5B0
      A800C0AEA700C1AFA800C3B0A900BCA79F00BEA79F00928174009D908000FDF9
      F40000000000000000000000000000000000F3FBF400B7EDB80063DB640060D6
      5F0059CE590058C8580057C1560050B74E004EAF4F0048A756003A9B5D003394
      6C00107D9300219AC6001E9DC3001D9DC0001DA0C70018A0CA000EA0CA0029C2
      E1001B7645002F7136001D563000006B810010B8E80012B7E8000FB1E5000EAF
      E10010B0E00010B0E00021A6D2002F8EB9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FAF8F800B3A69E00D5C0B800D2BFB800D4C0B500CCB7AF00CFB8B000CCB7
      AF00CAB7B000C6B3AC00C5AFA900C7B0A800C5B0A800C2AFA800C1AFA800C1AF
      A800BDA8A000BFA8A000BFA8A000BDA8A000BAA79F00907F7200ACA08E00FFF9
      F40000000000000000000000000000000000F4FAF500C2F2C2005CD95E005DD3
      5C0057C9570058C85A0057C1560051B84F0010642A0007696F0029B9DC001BAF
      DE00209AC800219FC10021A0BF001FA0C10016A9D10015B6E80017BAE00026AC
      A6002C7138002D683500104B2F000F8DA6000EB0E40010B1E5000FAEE0000FAF
      DF0010B0E00015B0E1001298C20082C2DB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDB0A800D2BFB800CDB8B000CFB8B000CFB8B000CDB8B000CAB7
      B000C5AFA900C7AFA900C7B0A800C5AFA900BFAFA800BFAFA800C2AFA800BDA8
      A000BFA8A000BDA8A000BDA7A100B7A7A000B7A7A000947F7700B6A79700FFF8
      F50000000000000000000000000000000000F5FCF500BEF1BF005DD95E005DD2
      5D0057C9580057C1560059C0570053B75100499B52000E564900005E7F000F86
      B3001D96C200239EC20021A0BF001F9FC20014B8E70012B8E7002BBED2001A76
      470034703A0030683700003C280029AED00010B0E60010AFE10010B0E00010B0
      E00017AFDE000491C4003392BA00DDF7FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7F7F700C1B8AF00D1BEB600CFB8B000CEB9B100CBB8B100CBB8B100C5B0
      A800C7AFA900C7B0A800C4B1A900C1AEA600C2B0A900BEA9A100C0A8A200BFA8
      A000BAA7A000B9A89F00B8A8A100BAA9A000B3A09800927F7200BEB09E00FFF9
      F40000000000000000000000000000000000F3FBF400B5EEB7005FD85E005CCF
      5A0058C8580057C0570052B950004EB14F0051A852002B763800145748000044
      6000259ABF001F98BF0022A0C300129AC40015B8E9002ABDD700198160002D71
      380032703C0031683700003E37002BB7DE0011B0E20010B0E00010B0E00016B1
      DF000F8AB6007CC1DC00DDF9FF00F3F8FB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FAF8F8000000
      0000F8F9F700D4CAC300D1C0B700CDB8B000C7B4AD00C6B1A900C6B1A900C7B0
      A800C6B1A900C1B0A700C0B0A900BDA8A000BDA8A000C0A9A100BDA8A000B6A6
      9F00B7A7A000B7A7A000B5A09800B5A09800B3A098008A7A6E00BFB0A000FEF8
      F10000000000000000000000000000000000F1FCF200A1DFA3005AD25B0052C5
      64004BC6660054C3570052B950004EB14F0051A850004C9E4C00438A4B00124F
      3300014C5C002E88A700329EC00033AFD7002497A100207952002E733A002E6F
      37002E693700306435000C545B0035B8E00012B0DE0013B1DF0014A8D6000B82
      AF00CAF1FF00EDF9FF00F7F9FA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8F7F9000000000000000000F8F7
      F900F8F7F900E7E0D700C9B0A60069423400684132006A433400734C3E007653
      46008A675A0099776A00A3817400B4948900BEA09500C2A79D00BEA89D00BFA9
      9E00BBA09600BBA09600BCA19700BBA09600B7A196007C685D00AC998A00F7F1
      EC0000000000000000000000000000000000EFFFEE0083CC840055B763005BC5
      BE001BB7CE0033B673004DB7540051AF50004CA24A00479946004B964A004790
      480042834500236236001B5B37003274430037783A0039783A00337036003170
      38003068370025432600B2D9E10061B2D3003CB1DE001D90BD0075BFE100E3F7
      FF000000000000000000F7F7F700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F6F8F8000000
      0000F9F9F900EEE8E100C9B8AF008358450094604900935F4800935F4800915F
      4800946049009660470096604700955F4600966049008F5E4800905F49008C5D
      4700865944007B503D00754A39007F57450098796A007B685B00B7A79700F2EB
      E20000000000000000000000000000000000EDFFED0075BA77008DCDB0005AC5
      EA0010AFE10027BDC30039B06C004AAA50004A9F4A0047994700469145004790
      47003E8840003F8840003F823F003B80430037773B0034723600317136003071
      3A00306736004D5F4E00F6F9F700F3F8FB00CDF8FF00D6F7FF00F6F8F9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F8F7F900000000000000
      000000000000F3F0EB00C4B5AC00C4A2920093614A00955F4800955F48009660
      49009B664B0099674900966748009A684A009E694E009C694F009B684E009C69
      4F009F6F53009E6E52009F705100A16E5400B2918100836F6400C1B1A100E7E1
      DA0000000000000000000000000000000000EEFDEF009DC6A000CCE9F7005AC4
      ED0018ADDF001698C7002E938B004CA55C004A9F4A0049974A00469147004790
      48003F884000418643003F8140003C7E430039783A00337036002F7038002F70
      39002D593200CAD3C90000000000F8F9F700F7F7F700F8F9F700F9F9F9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F8F7F9000000
      000000000000FCF7F400C1AF9E00C2A695009E725B00A4705900A76F5600A870
      5700A7715800A56F5600A6705900A26D5200A46E5500A46E5500A16F5100A16F
      5100A3715300A3705600A47059009D6F5D00B49F970089776C00C8B6A500E7DF
      D80000000000000000000000000000000000F6F9F700F4F9F700DAF0FC006EC6
      EF001781B0009AD7F700E4F6FF00DFFFE3004A9E4C004A984B00478F49004790
      48003F874100418140003F7F430039793E003B773A0035703600316F39003168
      37003B513E00F5F8F600F7F7F700F9F9F9000000000000000000F9F9F9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FCF7F800B7A99D00C6B1A200C7B0A100C3A99800C9A89400BF90
      7A00C9907600C8917600C6927400C8927400C58D7400C68E7500C0886F00BE89
      6E00BA887100B1887200C0A28F00BEA69200C9B0A000D3BAAA00DCC8B600DAD1
      C80000000000000000000000000000000000F8F7F900F8F7F900F4F7FB00E8F8
      FF00ECF7FF00F6F8F900FAF7F90000000000E8FFEA00619C6200449344003F89
      410040864000418140003C7E430037773B00367236002F703800316F3B002A53
      2E00F4FAF5000000000000000000000000000000000000000000FAF8F800F8F7
      F900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F8F9F700000000000000
      000000000000F9F7F700FCF8F700FFF8F500FDF8F500FDF9F400F8F1EE00F0E0
      D900D8AF9600DAA88A00D7A28700D7A08500CE987F00CD9B7F00C6988000BD9A
      8600BD9F8C00C3AA9600CBB1A000D1B9A500DCC1AD00E0C8B200DFC9B700C9BF
      B500000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6FAF500F0FFF100BCE2BE00488D
      4A00418441003F8042003B7B400039783A0037723800346F3C00305C3500F1FC
      F200F8F9F700000000000000000000000000FAF8F80000000000FAF8F8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8F9F7000000000000000000F8F9
      F70000000000F8F9F70000000000F9F9F9000000000000000000F7F9F900FBF9
      F800FFEFE800D0A79100DAA88C00D9A28700D19F8800AA867400FFF7F100F2EA
      E300D3C9C200BCB0A400C0B0A300CEBEB100DBC7B500DDC7B500DBCAB700AAA1
      980000000000000000000000000000000000000000000000000000000000F6F8
      F800F6F8F80000000000000000000000000000000000F9F9F900F4FAF500EDFF
      EC005D935E003A804100357C3A0037793800386C3D0067866B00EFFDF200F7F9
      F900F9F9F900000000000000000000000000F6F8F800F6F8F800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700000000000000
      0000F9F7F700FFF8F400D5C0B800A98A7B00AA908400FFF8F40000000000FAF8
      F800FBF9F800FBF7F600FBF8F400FCF9F500FDF8F500FDF9F400FDF8F500FAF8
      F7000000000000000000000000000000000000000000F6F8F800000000000000
      0000F8F7F900000000000000000000000000F8F9F70000000000F8F7F900F6F9
      F700F1FDF100EDFFEE00D3EAD400C0D7C100F0FBF100F4FAF500F6F8F8000000
      00000000000000000000FAF8F7000000000000000000F6F9F700FAF8F8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFE
      FE000000000000000000FFFEFF00FFFEFF0000000000FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE00000000000000000000000000FEFEFE0000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EDF2F500E2E3E300EBEBEC00F2F2F100FBFB
      FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0013131300131313006E6E6E008585
      8500858585008585850085858500858585008585850085858500858585008585
      8500858585008585850085858500858585008585850085858500858585008585
      8500858585008585850085858500858585008585850085858500858585008585
      8500858585006D6D6D001313130013131300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFE
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFE00FFFDFF00FFF1
      F500D3BEC100A48D91008C7175007F61660077575C0079575D00876369009B7B
      8000C6A9B200ECD7DF00FFF9FC00FFFEFF00000000000000000000000000FFFE
      FE000000000000000000FFFEFF00FFFEFF000000000000000000FFFEFF00FAFB
      FF00EFF1F900E4E6F100DBDDE800D8DAE500D7D9E400DADBE500E3E3E900EDEE
      F200F8F7F900FEFEFE000000000000000000FEFEFE0000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F9F9F90002629C0002629C00015C9100145B87001E5F
      85002A607F004F6B7B005F747D00828D930095989A00AEAEB200B9BAB900D9DA
      D900DEDFDF00F2F2F100FFFFFF00FFFFFF0013131300131313006E6E6E008585
      8500858585008585850085858500858585008585850085858500858585008585
      8500858585008585850085858500858585008585850085858500858585008585
      8500858585008585850085858500858585008585850085858500858585008585
      8500858585006D6D6D001313130013131300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFE
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00D7CED1009789
      8D00998B8D00B09DA000C5B0B300D1B8BC00D0B2B700C3A4A700B08E94009472
      780077595E007D666B00BCABAF00FAEFF200FFFFFE00FFFFFE00000000000000
      000000000000000000000000000000000000FCFEFE00F6F8F900E6E7EB00CCCE
      D900AEB2CB009398B9008187AC00797FA400787FA0008084A0009496A800A9AA
      B400C2C3C700DCDCDC00F0F0F000FCFCFC000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E2EEF500005D9B00005D9B0001609600016096000160
      96000160960002629C0001609600015C9100145B87001E5F85002A607F004F6B
      7B005F747D009B9D9E00E2E3E300FFFFFF006D6D6D006D6D6D0083838300F1F1
      F100F1F1F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0F0
      F000F0F0F000838383006D6D6D006D6D6D00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFEFF00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFEFF00FFFEFF00FEFDFF00FFFEFF00FFFEFF00CEC6C700A29A9B00D4CC
      CD00E6E0E100E7E1E200E4D9DB00DFD1D300DDC7C900BDA3A300B99A9D00CBA9
      AA00C5A0A2009673770072535A00BFA4AD00FFFFFE00FFFFFE00000000000000
      00000000000000000000FDFEFF00F6F7FF00E0E4F700BBC0DF008E94BF006F76
      AD005A65A9004955A300414D9F00414D9F00424E9C00535DA3005C649F00585E
      8D006065860083869B00B0B2BD00D8D8DE00F4F3F500FEFEFE00000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00015C9100015C9100015C
      9100015C9100015C9100015C91000968A6001C79C7001F80CF001F80CF001F80
      CF001E7CCE001C79C7001C79C7001570BF001570BF00126EB9000968A600105D
      A80002629C001E5F8500AEAEB200FFFFFF006D6D6D006D6D6D0083838300F1F1
      F100F1F1F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0F0
      F000F0F0F000838383006D6D6D006D6D6D00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFEFF00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFEFF00FFFEFF00FFFEFF00FFFFFF00FFFEFF00B1A9AA00E8E2E300F0EB
      EC00E9E7E700E4E2E200DFDADB00DFD5D500CBB9BA00CCB2B200B8999A00A27D
      7F00BF979800D5ADAF00987278008C676F000000000000000000000000000000
      000000000000FCFEFF00F2F3FD00CDD0EC008D95D0005864BC001A299D001023
      A8001226B400162ABD001629C000162ABF000D22B3000D20AB000B1B9D001220
      91003E49A30050599900575D8200888A9C00C0C0C600EAEAEA00F9FBFB00FDFF
      FF0000000000FEFEFE00FFFFFE00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00015C9100094C7B000F3E
      68000F3E68000F3E68000C4470000E6BB1001E7CCE002184D1002588D3002184
      D1002184D1002184D1001F80CF001F80CF001F80CF001E7CCE001E7CCE001C79
      C7001570BF00145B8700A5A8A700FFFFFF008585850085858500F1F1F1008585
      850085858500E9E9E900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E8E8E8008585
      850085858500F1F1F1008484840084848400FFFFFF00FFFFFF00FFFEFF00FFFE
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFDFF00FFFEFF00FFFFFF00FFFFFF00FFFEFF00CCC7C600F3F1F100F0F0
      F000F0F0F000EAEAEA00E4E2E200DFD7D700C5B0B200DDC1C100B4929200AA84
      8400BB939400D5ADAF00BA919800916B7100000000000000000000000000FDFF
      FF00FCFCFF00E9EDFF00BAC0EB006A73BC002936A2001F31BA001F36D8001E35
      E8001C34EC001932EC001932EE001932EC001B33EB001D34E7001B30DF001429
      C8000B1EA90012209000434D9B004E5586006C708900ABADB700E1E2E600F8FA
      FA000000000000000000FFFFFE00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A5A8A700EEEEEE00016096000C4470001338
      6000133860001033530006642800126EB9002588D3002A91D800268CD5002A91
      D800288FD700288FD700268CD500278DD600268CD500258AD500258AD5002184
      D1001E7CCE00145B87009B9D9E00FFFFFF008585850085858500F1F1F1008585
      850085858500E9E9E900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E8E8E8008585
      850085858500F1F1F1008484840084848400FFFFFF00FFFFFF00FFFEFF00FFFE
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
      FE00E8E7E900CECDCF00B3B3B300A3A1A100A29E9D008E8A8900C2C0C000E0DE
      DE00FEF9F800F9F4F300ECE6E700E2D6D600C7ADAD00D1ADAD00AC808100AC7E
      7D00BD919200D6AEB000B6939700B08E9400000000000000000000000000FBFE
      FF00F0F1FF00B3B9EE004856C0002135C3002238DD001B35E7001932EE001731
      F0001530F200152FF300152FF300152FF3001530F2001731F0001731F0001933
      EB001D35E5001329C800091CA300202E9400525B9A005F648300A8AAB400E7E7
      E700FDFDFD00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F6F6F6006F926F0059785900E7E7E700016096000C4470001338
      60001033530002521400269051001570BF00258AD5002D94DA00258AD5002C92
      D9002C92D9002C92D900228AD5002A91D800288FD700288FD700258AD500228A
      D5002184D100145B870095989A00FFFFFF008585850085858500FFFFFF00E9E9
      E900E9E9E90084848400EFEFEF00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00EFEFEF0084848400E9E9
      E900E9E9E900FFFFFF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00DFDFDF00B0B0
      B0009999990099999900999999009B9999009E999A0079737400958D8E00A195
      9500AE9A9900CBB7B600F9E9EA00DDC8CA00CFABAB00C5959400B2767600B274
      7400C18D8D00D7AFB000B2979A00F2DDE00000000000FFFEFF00FDFEFF00F2F5
      FF00BCC3FA004552B4002638D1001B33EB001530F200142EF600142FF5001530
      F2001932EE001B33EB001B33E9001B33EB001731EF001530F200132EF400142F
      F500152FF3001932EC001A32DE000A1EAC0015238900555E9D00686B8700B9B8
      C100F1F0F200000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00CDCDCC000C94110038C34B0059785900A5A8A7000C44700009213500056E
      0A0025982A0090E5A2005FB69E001977B9002D8ED8003097DB00258AD5003097
      DB003097DB003097DB00258AD5002D94DA002C92D9002C92D900268CD500288F
      D700258AD500145B8700828D9300FFFFFF008585850085858500FFFFFF00E9E9
      E900E9E9E90084848400EFEFEF00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00EFEFEF0084848400E9E9
      E900E9E9E900FFFFFF008484840084848400FFFFFF00FFFFFF00FFFEFF00FFFE
      FF00FFFEFF00FFFEFF00FFFEFF00FFFEFF00FFFDFE00C7C5C50099999900B1B1
      B100D3D1D100F4F2F200FDFDFD00FEFEFE00FDFBFB00F5EFF000CEC3C500A591
      8C00BA998500D3AD9500C3A39000CFADA000CE9E9800BB7E7C00BA707000B66D
      6F00B6808000C8A3A500F4DFE100FFFDFF0000000000FDFEFF00FAFAFF00D6DC
      FF005C6BD900273BD6001D34E8001530F200142FF500142FF5001530F2001B33
      E9002239DB00273CD300293DD200283CD7002037E1001B33EB001530F200142E
      F600142FF5001630F4001731EF001B33DF000B1EAF00202D970050558C007E7F
      9400CFCED700FBF9F9000000000000000000FFFFFF00FFFFFF00FFFFFF00A5A8
      A700168125002ABE3C0038C34B00056E0A002C772D00056E0A001D8D220055C0
      63007BD8920090E5A20045A286001C79C7002D8ED8003097DB00228AD5003399
      DD003097DB003097DB00268CD5003097DB002D94DA002D94DA00278DD6002A91
      D800268CD500015C910081888D00FFFFFF008585850085858500FFFFFF00E9E9
      E900E9E9E90084848400EFEFEF00EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00EFEFEF0084848400E9E9
      E900E9E9E900FFFFFF008484840084848400FFFFFF00FFFEFF00FDF2F500CDBE
      C2009F8E920085717600796368006C585D0051444600807A7B00D7D4D600FFFE
      FF00FFFEFF00FFFEFF00FFFFFF00FFFFFF00FFFEFF00FFFEFF00FFFDFF00EDD4
      C000D5A16500EFB16A00F2BB8200E0A98200C4867400B66D6900BA646400B465
      6800915B6000E7C8CB00FFFDFF00FFFEFF0000000000FAFCFF00E6E9FF008A95
      E700293DD2001831EB00152FF3001530F2001B33E9002037E000273CD400475A
      DF007787F800A0AEFF00A7B4FF009EABFF007483FD003D51DF001E36E2001731
      EF00152FF500142EF600142FF5001731EF001B33E1000C1DA900313B9200494E
      7B009E9EAE00ECEAEA000000000000000000FFFFFF00F6F6F6006F926F0012AA
      1E0024BA35002ABE3C0034BC440043C556004CC960005CCE710062CF76006FD3
      84007BD8920025982A00054A2F001F80CF003295DC00389CDE00228AD500389C
      DE003399DD003399DD00278DD6003399DD003399DD003399DD002A91D8002D94
      DA002D8ED800015C91006D7C8400FFFFFF008585850085858500FFFFFF00FFFF
      FF00FFFFFF00F0F0F0008484840084848400E9E9E900E9E9E900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E8E8E800E8E8E8008484840084848400F0F0F000FFFF
      FF00FFFFFF00FFFFFF008484840084848400FFFEFF00D7CFD00097898D009B8A
      8E00AF9BA000C4AEB300CFB8BD00A4909500C7BABC00FFFEFF00FFFEFF00F1E6
      E800C1B3B500D1C4C600FAF4F500FFFFFF00FFFEFF00FFFEFF00FFFDFB00EACA
      AD00D6974600E89E3800EAA54E00F2AF6A00FAB78600E4997900D47F6900B466
      5600864F4800B9939100E8D3D200FFF4F60000000000F1F4FF00ADB8FF00394B
      CE001E36E200152FF300142EF6001B33EB00293DD2005E6CDC00CDD6FF00ECF2
      FF00EFF4FF00F1F6FF00F3F5FF00F1F5FF00EBF1FF00D0DBFF00788BFF001E36
      E2001731F000142EF600142EF600142EF2001931EF001A30D5000D1D9800515B
      A90070748D00D0D0D000FBFAFC00FFFEFF00FFFFFF0075AB7500068B090018B8
      290018B829002ABE3C0034BC440043C556004CC960005CCE710062CF760074D6
      8B006FD38400025214000C4470002184D1003295DC00389CDE002588D300389C
      DE00379EE100379EE100278DD600379EE1003399DD003399DD002C92D9003295
      DC002C92D900015C91006D7C8400FFFFFF008585850085858500FFFFFF00FFFF
      FF00FFFFFF00F0F0F0008484840084848400E9E9E900E9E9E900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E8E8E800E8E8E8008484840084848400F0F0F000FFFF
      FF00FFFFFF00FFFFFF008484840084848400D4C6C700A69A9A00D4CCCD00E6E0
      E100E9E0E300E3DADD00CBC0C200D0C8C900FFFEFF00FFFBFB00E4D2D300C3A9
      A900927376006F545800B8A7AA00FFFDFF00FFFFFF00FFFFFC00FFEEE700D6B0
      8D00DE9F4500F7AB3A00F4AC3D00F2AB4300EFAA4900FBB56100FDB47000E6A0
      6B00BD7E5C00915B4A008B5E5B00B28A8F00FBFBFF00DFE5FF005A6AE2002238
      DE001932EE00142EF2001B32EC00253BD7008F9DFF00E4EEFF00F6F8FF00FCFD
      FF00FFFEFF0000000000FFFEFF00FBFCFF00F4F7FF00D7E0FF004051D6001E36
      E2001731F000142EF600152FF700142EF600152FF5001B33E9001325BE00202D
      970052567F00AFB2B700F1F0F400FFFEFF00FFFFFF00FFFFFF00CDE3CD0012AA
      1E0024BA35002ABE3C0034BC440043C556004CC960005CCE71005CCE71001D8D
      2200054A2F0013386000094C7B002588D300389CDE00175B9A000D4D8F00164A
      75001E5F85003BA1E300288FD7003BA1E300379EE100379EE1002D94DA00389C
      DE003399DD00016096005F747D00FFFFFF008585850085858500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EAEAEA00EAEAEA008787870087878700EEEEEE00FFFF
      FF00FFFFFF00E9E9E90089898900898989008C8C8C008C8C8C00EAEAEA00FFFF
      FF00FFFFFF00EEEEEE008585850085858500EAEAEA00EAEAEA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008484840084848400B9A9AA00EEE2E200F0EBEC00E9E7
      E700E4E1E300DDDADC00D0CBCC00FFFEFF00F7F2F100C2B4B5009B7F7F00BC98
      9800D5ADAF0096737700806B6E00FFFDFF00FFFEFF00FFFFFB00F2DACE00D8AE
      8400E6A84A00FEB64000FEB84200FFBA4500F9BA4A00EDAF4900EAAC5200EFB1
      6300EFAE7100E1A17800B97E6B007E464100F3F5FF00BAC4FF002B3DD0001932
      EE00152FF3001B33EB00273BD600818FFF00E8EFFF00F6FAFF00FBFDFF00FFFE
      FF0000000000FFFEFF00FFFEFF00F4F6FF00BAC4FF004959D4002339DF001731
      EF00142EF400142EF600142EF600142EF600142EF6001931EF001D34DE000D1C
      9B0058609B008E92A400E1E1E70000000000FFFFFF00FFFFFF00FFFFFF004A8F
      4A000E9D16002ABE3C0034BC440038C34B0034BC440034A83C001D8D2200054A
      2F001338600013386000094C7B002D8ED8002F8BCB00105DA800126EB9000D53
      9B000F3E68003BA1E3002A91D8003BA1E3003BA1E3003BA1E3003097DB00379E
      E1003399DD0002629C004F6B7B00FFFFFF008585850085858500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EAEAEA00EAEAEA008787870087878700EEEEEE00FFFF
      FF00FFFFFF00E9E9E90089898900898989008C8C8C008C8C8C00EAEAEA00FFFF
      FF00FFFFFF00EEEEEE008585850085858500EAEAEA00EAEAEA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008484840084848400D1C7C700F5F0EF00F2F0F000F0F0
      F000EBEBEB00DDDDDD00FFFEFE00FFFAFA00D9CAC800AC929200A6848400BB93
      9400D6ACAD00B8939500846D7100FFFDFF00FFFEFF00FFFFFB00E5CBBB00D7AD
      8000EDB45700FEBF4C00FFC15100FCC25900EFBC6000B4832D00CD984100F0B9
      5E00F4B85800F4B36200E6A37600A15F4200E6EEFF007884E2002238DD00132D
      F500142EF6001E36E4003545C000D5DEFF00F4F8FF0000000000000000000000
      0000FFFEFF00FAFCFF00F3F7FF00BEC7FF003040BB002239DB001932EE00152F
      F3001731F0001932EC001B33EB001932EE00152FF3001530F2001B33EB001425
      B4004D58A200767A9700D6D7E10000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F7FBF7001D8D220024AD31005978590058839B00084E8200133860001338
      60001338600013386000084E82002D8ED8001563A8001F80CF002184D1001C79
      C700105DA8003794CC002C92D9003FA5E5003FA5E5003FA5E5003399DD003BA1
      E300379EE1000968A6004F6B7B00FFFFFF008585850085858500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1F100F1F1F10089898900D8D8
      D800D8D8D80084848400EBEBEB00EBEBEB00EDEDED00EDEDED0089898900D9D9
      D900D9D9D90085858500F0F0F000F0F0F000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008484840084848400D3CBCB00FAF5F400FFFCFC00FFFE
      FF00F6F4F400EEECEC00FFFEFF00D4C8C800C8AEAE00A5818100AA7E7D00BF91
      9000D8AFAD00B4949500A4919400FFFEFF00FFFEFF00FFFFF800E4C9B400D6AD
      7C00F2BD6200FFC75A00FDC76200F6C87000DEBB7700AD8A4A00A9813600EABB
      6000FAC45900FABE5E00E2A16A00AC684300DAE5FF003E4FC4001E36E200132D
      F500152FF5002439DB006772CE00EDF3FF00FAFBFF000000000000000000FFFE
      FF00FDFEFF00F3F6FF00B8C3FF002E40BD002238DD001932EE00152FF3001731
      EF001E36E4002D43E300556AFF002439DB001932EE00152FF3001731EF00182C
      C70037439B0062689100CDCFDA00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CDE3CD00359736006F926F004C7CA100094C7B00133860001338
      60001338600013386000035789003092DB00105DA800469BD900469BD9002F8B
      CB00105DA8003E9BD1002C92D90042A8E6003FA5E5003FA5E500379EE1003FA5
      E500379EE1000968A6003B647B00FFFFFF008585850085858500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1F100F1F1F10089898900D8D8
      D800D8D8D80084848400EBEBEB00EBEBEB00EDEDED00EDEDED0089898900D9D9
      D900D9D9D90085858500F0F0F000F0F0F000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008484840084848400CBC1C100F8ECEC00FFEDEE00B6A6
      A700B7AFB000FFFDFE00FFF5F500917F7E008B69690084565500AA717000C38D
      8C00D7AFB000B0989800E8DDDF00FFFEFF00FFFFFE00FFFFF200E0C4A600D8B0
      7B00F6C66E00FECD6B00FBCF7600E7C68100FFF8CF00D8C5A200997E4600BF9B
      4F00F8CA6B00FAC46F00D79C6E00AB6F5200B2C2FF002E41C8001C33E600142F
      F5001530F2001F34CC0098A2E800F6F8FF00FBFDFF0000000000FFFEFF00FAFC
      FF00F1F6FF00BCC7FF002E40BD002238DE001932EE00152FF5001731F0002037
      E1003649D0008293FF00B1C1FF002C3FCA001D34E800142FF500152FF3001F35
      D500172585005D639200C9CCDB00FFFFFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F6F8FA003280B2000F3E6800133860001338
      60001338600013386000035789003BA1E3002F8BCB00D3CFF200E2EEF5006E9F
      C0001563A80048AEEB002A91D80045AAEA0042A8E60045AAEA003BA1E3003FA5
      E5003FA5E5000B6CA9003B647B00FFFFFF008585850085858500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D6006666
      660066666600EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1F1006969
      690069696900D5D5D500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008484840084848400FDF5F500DBCFCF00C4B0AF00927E
      7D00ADA5A500FFFEFF00D4CACA00735F5E00724C4C008E585800B06E6F00BB7F
      8000C7A2A400F1DFE000FFFEFF00FFFFFE00FFFFFC00F6EBDD00DEC3A100DDB8
      7E00F7CD7A00FCD47C00F5D58E00ECD6A600FFFFF000FFFAE700A3906A00A084
      4700E2BD6900F9CB7E00CA957000AD756200A4B4FF002B3DD0001B33E900152F
      F3001731EF00192CBD00B4BDFC00F8FBFF00FDFDFF00FFFEFF00FDFEFF00F3F7
      FF00B8C5FF002E40BD002137DC001932EE00152FF3001731F0001E36E400374A
      D100C2CCFF00D5DCFF00DBE6FF004F5FD7001E36E200142EF600142FF5002238
      DD00172388005B629400C9CCDB0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EDF2F5002A74A4000F3E6800133860001338
      6000133860000F3E6800035789003BA1E30042A8E600498BB30074ACD4001977
      B90049A3D90048AEEB002D94DA0048AEEB0045AAEA0048AEEB003FA5E50042A8
      E6003FA5E5001273B4002A607F00FFFFFF008585850085858500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6D6006666
      660066666600EFEFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1F1F1006969
      690069696900D5D5D500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008484840084848400FFFFFF00FFFFFE00EBDFDB00EEE2
      DE00F1ECEB00FFFFFE00EFE9EA00DFCDCE00EAC2C300AB717200AF6569009A5A
      5F00E7C8CB00FFFDFF00FFFEFF00FFFFFE00FFFFFB00EBDECE00DBC09B00E5C3
      8800F9D48400F9D98D00E0CA9A00FFFEE300FFFFF700FFFFF700E3D8BC009985
      5600B2944D00F6D08F00BB8B6F00B27D7300798AFF00273CD4001C34EC00152F
      F3001932EC001226B300B4BDFC00F8FAFF00FBFDFF00FAFCFF00F3F7FF00BEC7
      FF002E40BD002038DE001732EE00152FF3001731F0002037E100374AD100BDC8
      FF00F1F5FF00F4F5FF00E8EDFF005E6BD7002037E000152FF700142EF6002238
      DE001723880061689900CCCFDE0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D9E7F0000C64980013386000133860001338
      6000133860000F3E6800015C91003FA5E50045AAEA00379EE100379EE1004BB1
      EE004BB1EE004BB1EE002D94DA004BB1EE0048AEEB0048AEEB0045AAEA0045AA
      EA0042A8E6001977B9001E5F8500FFFFFF008585850085858500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EEEEEE00EEEEEE0084848400EBEB
      EB00EBEBEB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDED
      ED00EDEDED0089898900EEEEEE00EEEEEE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008484840084848400FFFFFF00FFFAF700E1D1C500FFFF
      F500FFFFFB00FFFFFE00FFFFFC00FFFFF700F5CAB500BF836D00AF6658008F4E
      4600B9939100E5D3D400FFF4F600FFFFFE00FFFFFB00E6DAC800DBC29A00E9CB
      9000F8D88F00F6DD9D00FAEECC00FFFFF500FFFFFB00FFFFFB00FFFFEF00CEC1
      9B00C4AB6B00F7D59A00AA7F6A00BB8C8800788AFF00273BD6001B33EB00152F
      F3001932EC001024B2008C96DC00F4F7FF00FAFBFF00F3F6FF00B8C3FF002E40
      BD002238DD001732EE00152FF3001731EF001E36E400374AD100C2CCFF00F1F5
      FF00FBFBFF00F8F9FF00E9EDFF00606DD7002237E000142FF500152FF7002238
      DD00172585007379A600D4D7E60000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C9DDEA000160960013386000103353001338
      6000133860000C447000015C910045AAEA0048AEEB00379EE1003BA1E3004EB5
      F0004BB1EE004EB5F0002D94DA004EB5F0004BB1EE004BB1EE0048AEEB0042A8
      E60048AEEB001977B900145B8700FFFFFE008585850085858500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EEEEEE00EEEEEE0084848400EBEB
      EB00EBEBEB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDED
      ED00EDEDED0089898900EEEEEE00EEEEEE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008484840084848400FFFEFF00FAEFE700C6AB9100FFE4
      CA00FFFFF700FFFFFC00FFFFF800FFF6DA00E6B77900F5B77100E4A06B00C07E
      5B00925B4C00875E5B00A58D8F00FFFDFF00FFFFFC00EAE0CF00DAC49B00EDD2
      9A00F8DF9F00FFEFBA00FFFFEB00FFFFF800FFFFFC00FFFFFB00FFFFF500FFFF
      E100F9E1A500F7D69E00A1796700C298990098A9FF00293CD3001B33EB001630
      F4001732EE001429C0005963BA00EAF1FF00ECF2FF00BFC9FF002E3FBE002339
      DF001932EE00152FF3001731F0002037E100374AD100BDC8FF00F1F5FF00FDFD
      FF00FFFEFF00F8F9FF00E0E6FF005B69DA002037E100142FF5001530F600243A
      DA00404CA4008E94B900E2E4EF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B9D1DD0002629C0006642800056E0A000921
      3500103353000C4470000160960045AAEA004BB1EE0049A3D9005CB2E80073BB
      E6007AC1E70086C2E40074ACD4009AC9DC009AC9DC009AC9DC00A7C8D700A7C8
      D70084BEDE001F81C600145B8700F9F9F9008585850085858500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E8E8E800E8E8E8008484840084848400F0F0F000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2F2F2008A8A8A008A8A8A00E8E8E800E8E8E800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008484840084848400FFFEFF00ECDBCE00D2AE8600D3B0
      8500FFFFEA00FFFFF200FFFFEB00E8CA9900E5B35B00EFB25000F3B26100EFAF
      6E00E3A27600B68067006B484400FFFCFF00FFFEFE00E3DAD000C7B59800CFBB
      9200E0CDA000FEEEC900FFFAE700FEFBF300FFFFFC00F6F4EC00F2EDDE00FFFA
      DA00FEE6AC00F0D19C009A776900CBA6A800A6B6FF002D40CB001B34E800142F
      F5001531F000152BD00012209000C2CDFF00B1BFFF003447C8002238DE001932
      EE001630F4001731EF001E36E400374AD100C2CDFF00F1F5FF00FAFBFF00FFFE
      FF0000000000F3F6FF00C0CBFF003042C5001C34E4001530F600152FF3002438
      D3005861AB00B1B5CE00F1F3FB0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A9BCC700015893000252140034BC44000252
      1400092135000C4470000160960042ACF10084BEDE00F1E3CF00F3E8D300FDEC
      D300FDECD300FDECD300FFF5D700FFF5D700FFF9D800F9F2D700FFF5D700FDEC
      D300FCE5C7001F81C60003578900F9F9F9008585850085858500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E8E8E800E8E8E8008484840084848400F0F0F000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F2F2F2008A8A8A008A8A8A00E8E8E800E8E8E800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF008484840084848400FFFEFE00E0CCBA00DAB17A00D8AD
      6E00FBE2BA00FFFFE300FFF9C600E2BC7400F4C16100FAC05700F9BB5500F7B8
      5600F5B55D00E2A96B00875F4D00FFFBFF00FFFEFF00E3DEDB00CCC1B900B7AA
      9C00B7A99700B8AA9800B9AFA500D2CAC300FFFFFB00D9D5CA00F0E4CC00FCE9
      C300FFEAB400E8CB9E0093736800D7B8BB00D8E4FF003445BE001E36E400142F
      F5001430F3001D34E7000B1CAB003B4CD1002B40D7001F36E0001731EF00152F
      F3001731F0002037E100374AD100BDC8FF00F1F5FF00FDFDFF00FFFEFF00FDFF
      FF00FBFDFF00E1E7FF00828FFB00253BD6001B33EB00152FF3001B32EC002032
      BF00727AB600D4D4E400FCFCFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B9BAB9006F926F0012841400189B1F0045B24D0062CF76007BD8
      920034A83C0009485200005D9B005CB2E800E7E2D3005D58F200544EF1006762
      F3003E39EF00FFFFFE00544EF1003E39EF00211BED00EEEEFD00B6B3F800E9E4
      F300FFF4DC002184D10003578900F6F6F6008585850085858500FFFFFF00FFFF
      FF00FFFFFF00EFEFEF008484840084848400EAEAEA00EAEAEA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00ECECEC00ECECEC008989890089898900EFEFEF00FFFF
      FF00FFFFFF00FFFFFF008484840084848400FFFEFC00E1CBB200DCB27100E8BA
      6D00E7C78C00FFFFCD00FFDC9600F0C67300FBC96900FFCB6100FFC95C00FEC5
      5800FFC05800E2A95E008E675100FFFBFF00FFFEFF00FEFCFC00F7F2F300DDD5
      D500D9D0CD00D1C6C200AFA7A000E5DFDA00FFFFFC00BDB6AD00B8AA9400C9B4
      9500D9BF9A00CAAE9000886E6700E1C8CC00E4EDFF006D7ADC002339DF00142E
      F600142FF5001731F0001128D800162EDC001B33E9001731EF00152FF3001731
      EF001E36E400374AD100C2CDFF00F1F5FF00FAFBFF00FEFDFF0000000000FBFD
      FF00F4F8FF00A4ADF1003D50DB001C34EA001730F2001931EF002237E0003A4A
      C2009FA4D100ECECF200FFFEFF00FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7E7E70012841400189B1F0043C5560055CA690062CF760067D17C0074D6
      8B0083DC9A000F785300005D9B005CB2E800EFEDD7000F08ED00544EF100A6A2
      F600544EF100BDBBFA00211BED00BDBBFA002B24EE00FFFFFE00B6B3F800EAE6
      F900FFF4DC002685C900015C9100F2F2F1008585850085858500FFFFFF00FFFF
      FF00FFFFFF00EFEFEF008484840084848400EAEAEA00EAEAEA00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00ECECEC00ECECEC008989890089898900EFEFEF00FFFF
      FF00FFFFFF00FFFFFF008484840084848400FFFCF500DAC4A800DCB57100F3C5
      7100EFC87900FFD98B00F7D27E00FBD37B00FFD57800FFD27100FFD06C00FDCA
      6900FFC66B00D7A26300906F5C00FFFBFF00FFFEFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFE00E1DDDC00C0BCBB00FFFFFE00F7F2F100CCC3C000BFAFA900BBA5
      9A00C1A79B00B1988E009A868500F8E7EA00EFF5FF00AFBAFF00293CD3001731
      F000152FF500142FF500152FF300152FF300142FF500142FF500142EF2001D34
      E7003447D800B9C5FF00EFF3FF00FBFBFF00FBFCFF00FAFCFF00F8F9FF00EFF5
      FF00D8E0FF004B58C6002238DE00152FF300152FF5001D34E7002B3DC6006C78
      D000CFD2F100FBFAFC00FFFEFF00FFFEFF00FFFFFF00FFFFFF00FFFFFF004A8F
      4A000E9D160034BC440034BC440043C556004CC960005CCE710067D17C0074D6
      8B007BD89200338E9500005D9B0068BBEC00F9F2D700211BED007974F500BDBB
      FA00FFFFFE000F08ED00B6B3F800D6D5FC002B27F000FFFFFE00B6B3F800E6E5
      FC00FFFBE400288FD700015C9100EEEEEE008585850085858500FFFFFF00E8E8
      E800E8E8E80084848400F1F1F100F1F1F100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3F3F300F3F3F30089898900E8E8
      E800E8E8E800FFFFFF008484840084848400FAE9E000DAC2A400E2BB7600FBCF
      7600FCD47C00FFD98100FFDA8500FFDD8700FFDC8600FEDB8100FFD77B00FFD1
      7900FFCB7B00CA9B650094776800FFFCFF00FFFEFF00FFFFFF00FFFFFF00F6F6
      F600D3D3D300AFAFAF00F5F5F500FFFFFF00FEF9FA00FBF3F400F8ECEC00F8E8
      E900E7D2D400CEBCBD00E2D5D700FFFEFF00FAFCFF00EAF1FF004454D6001E35
      E5001832F100142EF600142FF500142FF500142EF600152FF3001731EF002D43
      E300B6C4FF00E4EDFF00F3F5FF00F8F9FF00F4F8FF00EFF5FF00E8EEFF00919C
      F6002C3DC2002238DE001932EE00152FF500152FF5002439DB005B67C700B5BB
      E800EFF2FF0000000000FEFEFE0000000000FFFFFF00FFFFFF00FFFFFF000E9D
      160024BA35002ABE3C0038C34B0043C556004CC960005CCE710067D17C0074D6
      8B007BD89200338E9500005D9B0068BBEC00F9F2D7000F08ED003D36EF00BDBB
      FA00FFFFFE000F08ED008681F500DFDDFB00312AEE00FFFFFE00B6B3F800AEAE
      B200C8B7A4002D94DA0001609600EEEEEE008585850085858500FFFFFF00E8E8
      E800E8E8E80084848400F1F1F100F1F1F100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3F3F300F3F3F30089898900E8E8
      E800E8E8E800FFFFFF008484840084848400EEDCD100D6BF9F00EAC68000FED6
      7E00FFDB8700FFDF8C00FFE29300FFE49400FFE49400FFE29100FFDE8A00FED8
      8600FFD08C00BD916200987E7200EBDDE100E4E2E200D7D9D900C7C7C700A5A5
      A500A9A9A900ECECEC00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFEFF00FFFE
      FF00FFFEFF00FFFEFF00FFFEFF00FFFFFF0000000000F3F6FF00B3BEFF002D3F
      CC001D35E500152FF300142FF500142EF600142EF6001630F400162FEB00041A
      B9003544B2007F89D700A7B0F000B6BDFC008E96DC00646FC30024319D002133
      BC001E36E400152FF300142FF5001731F0001E36E4004052D5009CA4E000E5E9
      FC00FCFCFF00000000000000000000000000FFFFFF00FFFFFF0075AB750018B8
      290024BA350024BA350024AD310025982A00168125001D8D220055C063007BD8
      920045B24D00005774000968A6007AC1E700FFF5D7000F08ED004942F1006F6A
      F400322DF000FFFFFE00544EF100544EF1004942F1006F6AF4007469E800F4E5
      D50086C2E4003097DB0001609600E2E3E3008585850085858500FFFFFF00E8E8
      E800E8E8E80084848400F1F1F100F1F1F100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F3F3F300F3F3F30089898900E8E8
      E800E8E8E800FFFFFF008484840084848400E9D8CB00D7C0A000EFCE8900FFDB
      8700FFE19200FFE79B00FFEAA200FEECA500FDECA300FFEA9F00FDE39600FEDE
      9300FFD49700AE855E009C857D00A0979A009B99990097999900A1A1A100C4C4
      C400F6F6F600FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FAFBFF00EDF3FF008D98
      F200273CD4001732EE00152FF300142EF600142EF600152FF500142EED000C23
      D600071DB9000B1DAA000719A2000E20A9001225B600182DC5002437DE001E34
      E7001731F000142FF500142EF6001E36E6003042C5008590E400D7DCFD00F8FB
      FF00FFFEFF00000000000000000000000000FFFFFF00E2EDE2001D8D220018B8
      290018B829001D8D22004A8F4A00296F8C00035789000664280055C063002598
      2A0002521400035789000B6CA90086C2E400F9F2D7006762F3008681F500B6B3
      F800BDBBFA00FFFFFE00F4F6FB00F4F6FB00FBFBFC00FFFFFE00FFFBED009AC9
      DC0051BCF900389CDE0002629C00DEDFDF008585850085858500F0F0F0008484
      840084848400EAEAEA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECECEC008989
      890089898900F0F0F0008484840084848400EFDFCF00D6C1A100F0D49400FFE3
      9600FFE99E00FFEFA800FEF2B000FFF5B500FEF5B200FEF1AD00FFECA300FFE3
      A000FCD49F00A37D5D00AC999100C1BABD00C4C2C200DADADA00F7F7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFF
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FDFEFF00FAFBFF00EAF1
      FF006F80EF00253BD6001D34E7001731F000142FF500142FF500152FF3001731
      EF001B33EB001D34E8001D34E8001D33E9001B32EC001731EF00152FF500152E
      F600152FF5001731EF001E36E4002D3FCC00828CE400CFD5FF00F6F6FF000000
      000000000000000000000000000000000000FFFFFF008BC38B000C9411004A8F
      4A00D4D5D100FFFFFF00FFFFFF001B6D9F00015C910006642800056E0A001338
      600013386000035789001271AC0086C2E400FCE5C700FEF6EA00FEF6EA00FFF3
      E200FFF3E200FFEFDB00FFEFDB00FDECD300FAE7D500F1E3CF00D9DAD9004CB7
      F40055B8F500389CDE0002629C00D9DAD9008585850085858500F0F0F0008484
      840084848400EAEAEA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECECEC008989
      890089898900F0F0F0008484840084848400E6DACE00C3B39C00D3BC8E00E7D0
      9800F7E3AC00FFF3BE00FFF9C700FFFDCB00FFFBC700FFF7BD00FFF0B100FFE6
      AA00F5CEA2009D7A6000DACAC300FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFF
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFEFF00FDFEFF00F6F9
      FF00EAF1FF00828FEB002B3FCD001D35E5001531F000142EF600142FF500142E
      F400152FF3001730F2001730F2001730F200152FF300152FF300142EF600152F
      F5001731F0001F36DF003A4CC9008A95E700D9DDFF00F6F6FF00FDFDFF000000
      000000000000000000000000000000000000FFFFFF008BC38B00068B0900E2E3
      E300FFFFFF00FFFFFF00FFFFFF001B6D9F00015C910009485200094852000F3E
      680013386000035789001271AC0068BBEC00E7DCCA00FCE5C700F4E5D500E7DC
      CA00D4D5D100B9D1DD00A7C8D7007AC1E70068BBEC0055B8F5004CB7F4004EB5
      F0004EB5F0003092DB0002629C00D9DAD9006C6C6C006C6C6C0082828200F3F3
      F300F3F3F300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4F4
      F400F4F4F400888888006C6C6C006C6C6C00E3DEDB00C9C1BA00B9AB9900BBAA
      9500BBAB9400C2B29B00D3C4AA00E2D4B700F5E6C500FFF0C600FFEDBA00FFE8
      B900EDC7A50096756200E6D7D400FFFEFF00FFFEFF00FFFEFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FDFD
      FF00F8FBFF00EBF1FF00A9B5FF004254D700253BD6001E37E1001E35E8001B33
      EB001931EF001731F0001731F0001731F0001932EE001B33E9001E35E5002238
      DE00293CD3005465DD00AFB9FF00E4E8FF00F9FAFF0000000000000000000000
      000000000000000000000000000000000000FFFFFF0094C894004A8F4A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A7C8D700498BB300498BB300498BB300498B
      B300498BB300016096001271AC0045AAEA0042ACF1003CA4EA00379EE1003293
      D4002F8BCB001F81C6001273B4000968A6000C649800015C9100015C91000158
      9300015C91001B6D9F004283AB00FFFFFF006C6C6C006C6C6C0082828200F3F3
      F300F3F3F300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4F4
      F400F4F4F400888888006C6C6C006C6C6C00FCFBFD00F5F3F300DDD5D500DBD0
      CC00D2C6C000BFB2AA00BEAFA600BAAA9D00B6A69500BCAB9100C9B49400D7BE
      9E00CDAA96008D6F6400D8CBC900FFFEFF00FFFEFF00FFFEFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFEFF0000000000FFFE
      FF00FCFCFF00F8FBFF00F1F6FF00DCE5FF0099A4F8004859C8002E41C800273B
      D6002238DE001E36E4001E34E7001F37E5002439DB00293DD2003242C4006170
      D700BAC3FF00DEE4FF00F1F4FF00FAFBFF00FDFEFF0000000000000000000000
      000000000000000000000000000000000000FFFFFF00ECF5EC00CDE3CD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF001B6D9F0002629C001271AC000968A6000160960001609600015C
      910002629C00015C9100005D9B000C6498000C6498004E8FB7006E9FC000B9D1
      DD00D9E7F000F6F8FA00FFFFFE00FFFFFF0012121200121212006A6A6A008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080006C6C6C001313130013131300FFFFFF00FFFFFF00FFFFFF00FFFF
      FE00F1ECE900E5DEDB00E1D8D500D8CDC900CEC0BA00C1AFA800B9A59A00BEA5
      9B00B39691009D868400F3E9E900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFEFF00000000000000
      00000000000000000000FDFEFF00F6FAFF00EAF1FF00DCE9FF00B2C1FF008194
      FF007286FF00475DFF00475BFF005167FF007487FF008EA0FF00BFCDFF00E1EA
      FF00F1F6FF00FBFDFF00FDFEFF0000000000FDFFFF00FDFFFF00000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008CB9D1004283AB0089A3B200A9BCC700E4EBEE00F9F9F900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0012121200121212006A6A6A008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080006C6C6C001313130013131300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFE00FFFFFE00FFFEFF00FFFEFF00FFF3F300FBEBEC00FDE7E900EAD2
      D400D5BABD00E9D4D600FFFEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003333
      3300333333003333330033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000066666600666666006666
      6600666666006666660066666600666666006666660066666600666666000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006067600060676000606760006067
      6000606760006067600060676000606760006067600060676000606760006067
      6000606760006067600060676000606760006067600060676000606760006067
      6000606760006067600060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000929292007979790092929200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000333333003333
      3300333333003333330033333300333333003333330033333300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000066666600D0D0B700EBEBCD00FFFE
      DD00FFFEDD00F3F3D500D0D0B700B9B9A5009C9C8D0083837B00666666006666
      6600666666006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0A79000DFA79F00D09F9000CF979000CF97
      9000CF979000CF979000CF979000C0979000C0978F00C0978F00C0978F00C097
      8F00C0978F00C0978F00C0978F00C0978F00C0978F00C0978F00C0978F00C097
      8F00C0979000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000089898900484848004A4A4A003939390045454500585858007979
      7900929292000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000656565009655
      170086380A0066381A0049352A00393838003333330033333300333333003333
      3300333333000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFF2CD00FFFEDD00FEF9D600FFF2CD00FEEC
      C500FFE9C100FFE9C100FEEEC900FEF5D100FEFAD800FFFEDD00F3F3D500C5C5
      AF00919185006666660066666600666666000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0AFAF00FFD8C000FFD8C000FFD8C000FFD8
      C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8
      C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8C000FFD8
      C000FFD09F00DF978F0060676000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008E8E8E007373
      73004F4F4F0054545400A9A9A900C1B9B900BD9E9E00877373004B4545003D3D
      3D004F4F4F006565650092929200000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000065656500B853
      0100A13C01009A3601009A36010089280000732D0A0053362500443A3400443A
      3400333333003333330033333300333333000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FBF9DA00FFFEDD00FFF2CD00FEECC500FEE8BE00FEE4
      B900FEE0B500FEDEB100FEDEB100FEEEC900FEE6BC00FEE4B900FEECC500FEF5
      D100FFFEDD00F3F3D500B9B9A500666666006666660066666600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CFB7AF00E0E8E000FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFE0C000FFD8C000FFD8C000FFD8
      BF00FFD8BF00FFD8BF00FFD8BF00FFD8B000FFD8B000FFD8B000FFD0B000FFD0
      B000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000008E8E8E0063636300575757009797
      97008887870086868600ABABAB00B0A6A600BB9F9F00C8A7A700D5B0B000A78C
      8C007666660039393900474747005B5B5B007F7F7F0000000000000000000000
      000000000000000000000000000000000000000000000000000065656500B457
      1900A13C0100C77B4700E5B99600D5976500B4643900A94402009A3601007E30
      080066381A0049352A0039383800333333003333330033333300333333000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FBF9DA00FEF9D600FEEEC900FFE9C100FEE4B900FEE0
      B500FFDCAF00FED8A900FEE0B500EFF8D800FEFCE500FDE0B300FCE6C000FEEE
      C900FFEFCE00FEF5D100FEFCDA00FFFEDD00A5A5940066666600666666000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0B7AF00E0E8E000FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFE0C000FFD8
      C000FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8B000FFD8B000FFD8
      B000FFD8C000DF978F0060676000000000000000000000000000000000000000
      000000000000000000008E8E8E00585858006B6B6B00ACACAC00DCDCDC00D7D7
      D7006363630080808000A0A0A000AFA6A600938282007D737300BAA3A300BEA4
      A400CEB8B800D8B3B3009A8181004E4848003F3F3F0050505000686868009292
      920000000000000000000000000000000000000000000000000065656500C769
      18009A360100C88A6500FFF0DB00FFE5CA00FDDBB700F5CCA600E7AC8200C77B
      4700B4571900A94402009A360100732D0A0053362500443A3400333333003333
      3300333333003333330000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FEFAD800FEF5D100FEECC500FEE8BE00FEE4B900FEDE
      B100FFDAAC00FFD4A400FEDEB100BFE6AC008FD28300FFFFF000FFFEF500FFFF
      FC00FFFFFC00FFFEF500FEFAD800FEF9D600FFFEDD00DBDBC100666666006666
      6600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0B7AF00E0E8EF00FFE8D000FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFD8
      C000FFD8C000FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8
      B000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000828282005C5C5C0082828200CACACA00DBDBDB00D7D7D700D0D0D000CACA
      CA00C6C6C6007A7A7A00979797009B96960072686800000000000E0E0E002726
      260000000000454545008A7E7E00D6B8B800BE9D9D007C6A6A00474343004848
      48005B5B5B00808080000000000000000000000000000000000065656500C769
      18009A360100C9835600FEEAD400FEE2C300FEE2C300FEE2C300FEE2C300FDE7
      B900FDDBB700EBB78800D5976500C6733900B45719009A3601007E3008006638
      1A0049352A003333330033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EDEBD500FBEBC000F8E0AE00FFF2CD00FEE8BE00FEE0B500FEDE
      B100FED8A900FED1A100FEE6BC00BFE6AC000099000060BF5B00009900000099
      00000099000060BF5B00DFF2D300FEF9DE00FEFCDA00FFFEDD00AAAA9A006666
      6600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0B7B000EFE8EF00FFE8D000FFE8D000FFE8
      D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0
      C000FFE0C000FFD8C000FFD8C000FFD8BF00FFD8BF00FFD8BF00FFD8BF00FFD8
      B000FFD8C000DF978F0060676000000000000000000000000000717171006565
      6500A0A0A000D4D4D400D9D9D900D4D4D400CFCFCF00CACACA00C4C4C400BDBD
      BD00B7B6B600737373008C8C8C008A8989007570700079717100554E4E002421
      210000000000000000000000000037373700DBC0C000E6BBBB00E5B9B900AF91
      91005D535300404040005C5C5C009F9F9F00000000000000000065656500C769
      1800A13C0100D79B7400FEEAD400FFE5CA00FEE2C300FEE2C300FDDBB700FDDB
      B700FDDBB700FDDBB700FDE7B900FFD5AC00F9CA9300E4AC7200DC915100B65B
      22009A360100443A340033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8EFCF00F5D09700EDB26A00F6D9A400FEF0CA00FEE6BC00FEDE
      B100FED8A900FED1A100FFE9C100BFE6AC000099000000990000009900000099
      00000099000000990000109F0F00CFEBC200FFFEDD00FFFEDD00E6E6C9006666
      6600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0BFB000EFE8EF00FFE8D000FFE8D000FFE8
      D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0
      C000FFE0C000FFE0C000FFD8C000FFD8C000FFD8C000FFD8BF00FFD8BF00FFD8
      BF00FFD8C000DF978F0060676000000000000000000084848400A0A0A000DCDC
      DC00D9D9D900D3D3D300CDCDCD00C8C8C800C3C3C300BABABA00B7B6B600B1B1
      B100A9A9A90079797900AEAEAE00BDBDBD00757575006B696900777171006961
      610000000000000000000000000010101000292929007D737300D0B4B400E6BB
      BB00F3C4C400D7AEAE004040400092929200000000000000000065656500C769
      1800A13C0100D8A78800FEEAD400FFE5CA00FFE5CA00FEE2C300FEE2C300FDDB
      B700FDDBB700FDDBB700FDDBB700FDDBB700FBD19C00FEC27500FCC48700E5A8
      6800A944020049352A0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEF4CE00F6C08200F0B56F00F0B56F00F2BE7D00F8DAA700FEF0
      CA00FFE9C100FFDAAC00FFE9C100BFE6AC000099000000990000009900000099
      000030AC3000109F10000099000030AC2D00FEFCE500FFFEDD00FFFEDD006666
      6600666666000000000000000000000000000000000000000000C05750009077
      7F006F676F000000000000000000D0BFB000EFE8EF00FFE8D000FFE8D000FFE8
      D000FFE8D000FFE8D000FFE0D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0
      CF00FFE0C000FFE0C000FFE0C000FFE0C000FFD8C000FFD8BF00FFD8BF00FFD8
      BF00FFD8C000DF978F006067600000000000A9A9A900BDBDBD008E8E8E00D0D0
      D000CDCDCD00C6C6C600C0C0C000BABABA00B4B4B400AEAEAE00A9A9A900BEBE
      BE00DCDCDC00EFEFEF00A4A4A4006666660098989800B9B9B900A0A0A0007A78
      7800706A6A00514B4B002B27270088878700685B5B00352E2E0069616100CFAC
      AC00DBB4B400E8BDBD004040400092929200000000000000000065656500C96D
      20009A360100D8A78800FFF0DB00FEE6D100FFE5CA00FFE5CA00FEE2C300E7DA
      C800D8D2BE00FDDBB700FDDBB700FDDBB700FCC48700FFB65700FEC27500E29E
      5600A944020049352A0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EEEADC00FEECC500F2B97600F2B97600F2B97600F2B97600F2B97600F2B9
      7600F5C68A00F9DCAC00FEF6D400AFDD9D0000990000009900000099000060BF
      5B00FFFFFC00EFF8E30070C66A00009900009FD89300F9DCAC00FFFEDD008383
      7B006666660000000000000000000000000000000000AF5750007F878F009F77
      9F00CF879F00705F6F0000000000DFBFB000EFE8EF00FFE8DF00FFE8DF00FFE8
      D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFD8C000FFD8C000FFD8
      BF00FFD8C000DF978F006067600000000000A9A9A900D0D0D000CACACA00C6C6
      C600BEBEBE00B9B9B900B3B3B300ACACAC00B7B6B600D4D4D400EAEAEA00E9E9
      E900E1E1E100DEDEDE00DCDCDC00D0D0D0009B9B9B0068686800656565009797
      9700B7B6B600A5A3A300837E7E00857B7B0093848400574D4D00AC9595008A76
      760041554200AC8E8E004040400092929200000000000000000065656500C877
      2900A13C0100E5B99600FFF0DB00FEEAD400FEE6D100FFE5CA00FEE2C30046AD
      CB0073B9C700FDE7B900FDDBB700FDDBB700FFB65700FFAA3300FEC27500E5A8
      6800A9440200443A340033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0E1CB00F9DCAC00F4BD7D00F4BD7D00F4BD7D00F4BD7D00F4BD7D00F4BD
      7D00F4BD7D00F6C08200FEEEC90080CC7200009900000099000000990000109F
      1000CFECCB00FEFEE800FEF9E2009FD8930030AC2D00FEF6D400FEF5D1009595
      890066666600000000000000000000000000000000007F776F003077D0005F67
      A000A08FA000D08F9F00705F6000DFBFB000EFF0EF00FFE8DF00FFE8DF00FFE8
      DF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFD8C000FFD8
      C000FFD8C000DF978F006067600000000000ABABAB00C4C4C400BDBDBD00B9B9
      B900B1B1B100B4B4B400CACACA00E3E3E300EDEDED00EAEAEA00E9E9E900C4C4
      C400C6C6C600CACACA00CFCFCF00D0D0D000D7D7D700DBDBDB00CFCFCF009B9B
      9B00666666006565650097979700B7B6B600A4A1A100878080008D7F7F007769
      69003AA45D005E4F4F0040404000929292000000000000000000846B5100C96D
      2000A13C0100EBD5B700FEF1E300FEEAD400FEEAD400FEEAD40089C2CC000098
      CB0046ADCB00FDDBB700FDDBB700FFD5AC00FFAA2800FFB65700FDDBB700E7AC
      8200984A0B00443A340033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FBE9C500FBD19D00F6C18400F6C18400F6C18400F6C18400F6C18400F6C1
      8400F6C18400FBD19D00EFF9D200BFE6AC0060BF5B0040B33C0030AC2D000099
      000030AC2D00FFFEF500FBF4CF00FEF9E20050B94A00EFF9D200FFF2CD00A5A5
      940066666600000000000000000000000000000000005FBFFF0030A7FF003077
      D0005F67A000A08FA000CF879F00706F6F00EFF0EF00FFF0DF00FFE8DF00FFE8
      DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0
      CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0C000FFE0
      C000FFD8C000DF978F006067600000000000ABABAB00B7B6B600B3B3B300C0C0
      C000DBDBDB00EDEDED00F1F1F100F1F1F100EFEFEF00EDEDED00BDBDBD00CC80
      8000935353007B555500686868008A898900B1B1B100C6C6C600D0D0D000D7D7
      D700DBDBDB00D9D9D900A3A3A300717171006E6E6E0094949400B1B1B100A7A3
      A300867E7E00917F7F0053535300929292000000000000000000846B5100C96D
      2000A13C0100E6C9B700FEF1E300FFF0DB00FEEAD400ABD1D4000098CB001EA2
      CD00109DCC00E7DAC800FFE5CA00FEC27500DFA24B00C4BDAC00D9B69B00DC91
      5100A94402003938380033333300000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EEE3
      D100FFE9C100FBC99200FAC48B00FAC48B00FAC48B00FAC48B00FAC48B00FAC4
      8B00FAC48B00FBD19D00BFE6A800DFF1CC00FEF9DE00FEFCE500FFFEF500CFEC
      CB00FFFFFC00FFFFFC00FFFFF000FFFCEC00CFECBC00BFE6A800FEF4CE00D1D1
      B80066666600000000000000000000000000000000007F87B00060D8FF003FAF
      FF003077CF005F6FAF00A08FA000CF879F008F778F00FFF0E000FFF0DF00FFE8
      DF00FFE8DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8
      D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0C000FFE0C000FFE0
      C000FFD8C000DF978F006067600000000000A0A0A000CFCFCF00EAEAEA00F3F3
      F300FAFAFA00F8F8F800F6F6F600F4F4F400F3F3F300F1F1F100C0C0C000FF9C
      9C00CC666600CC66660089707000E4E4E400A0A0A0008B8B8B0086868600A0A0
      A000C3C3C300CFCFCF00D7D7D700DBDBDB00D9D9D900A3A3A3006E6E6E006E6E
      6E009494940094949400A3A3A300000000000000000000000000866B4800C877
      2900A13C0100EBD5B700FEF5EA00FEF1E300ABD1D4000098CB004AB0CE00D5D9
      D3000098CB00ACCAC500FEEAD400997754001E43530050909C00B4732C00D982
      2A00B85301006B45220033333300333333003333330000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EEE3
      D100FEE4B900FDC99300FDC99300FDC99300FDC99300FDC99300FDC99300FDC9
      9300FDC99300FED1A100CFECB70050B94A00FEFCE500FEF9D600FFFFF00050B9
      4A00009900000099000040B33C0040B33C00CFECBC00EFF5D000FEE6BC00DBDB
      C1006666660000000000000000000000000000000000000000008F87B0005FD0
      FF0040AFFF003077D0005F67A000A08FA000CF879F00706F7000FFF0E000FFF0
      DF00FFE8DF00FFE8DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8D000FFE8
      D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0
      C000FFD8C000DF978F00606760000000000000000000A0A0A000C3C3C300C4C4
      C400EAEAEA00FAFAFA00FAFAFA00F8F8F800F6F6F600F4F4F400C3C3C300FFA0
      A000CC666600CC66660081686800DCC3C300E5B9B900EDE1E100E7E7E700B1B1
      B1008E8E8E00827B7B008A898900BABABA00CFCFCF00BABABA0094949400A0A0
      A000A0A0A000000000000000000000000000000000006565650099775400C96D
      2000A9440200FEF1E300FEF5EA00BCD7D9000098CB0046ADCB00F6ECDB00FEE6
      D10030A8CE0046ADCB00FFE5CA00E6C9B700517C8F0079785600FCC48700FFD5
      AC00F2B77700E28D3A00BF6A1400855628003333330033333300333333000000
      000000000000000000000000000000000000000000000000000000000000F3E2
      C400FEDEB100FECC9900FECC9900FECC9900FECC9900FECC9900FECC9900FECC
      9900FECC9900FECC9900FEFAD80020A61D009FD89300FEFEE800FEFCE500EFF8
      E90020A62000009900000099000000990000BFE6AC00FFDAAC00FED8A900FFFE
      DD00666666000000000000000000000000000000000000000000000000008F87
      AF0050BFFF003FA7FF003087EF005F67A000A08FA000CF879F00706F7000FFF0
      E000FFF0E000FFF0DF00FFE8DF00FFE8DF00FFE8DF00FFE8D000FFE8D000FFE8
      D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0CF00FFE0CF00FFE0CF00FFE0
      CF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000A0A0A000A0A0A000B7B6B600D3D3D300FAFAFA00F8F8F800C6C6C600FFA2
      A200CC666600CC666600765D5D00B8858500BE585800E2AFAF00F4F4F400E7E7
      E700D9D9D900CD9A9A00804D4D00935353006D4747004D4D4D00000000000000
      0000000000000000000000000000000000000000000065656500A67D5400C769
      1800A9440200FEF5EA00FEF5EA0085C5D50046ADCB00EDE6D700FFF0DB00FEEA
      D40085C5D5000098CB00E7DAC800FFE5CA00EDE6D700BC8A5800E5A86800FEE2
      C300FEEAD400FDDBB700FCC48700E4964600C769180096551700755639003333
      330033333300000000000000000000000000000000000000000000000000F8E0
      BA00FFDAAC00FED1A100FED1A100FED1A100FED1A100FED1A100FED1A100FED1
      A100FED1A100FED1A100FFE9C10080CC72000099000070C66A00EFF8E300FFFF
      FC008FD28D00009900000099000000990000BFE6AC00FEDEB100FFDAAC00FFFE
      DD00666666006666660000000000000000000000000000000000000000000000
      00008F87AF0060E0FF003FAFFF003077CF005F6FAF00A08FA000D087A000FFF0
      E000CFBFBF00BFAFAF00BFAFAF00BFAFAF00BFAFAF00C0A7AF00BFAFAF00FFE8
      D000FFE8D000FFE8D000FFE8D000FFE8D000FFE8CF00FFE0CF00FFE0CF00FFE0
      CF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000A0A0A000B4B4B400BDBDBD008B8B8B00FFA6
      A600CC666600CC66660079606000A7747400B44E4E00D6A3A300FDFDFD00F4F4
      F400E7E7E700D5A2A200804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000065656500A67D5400C96D
      2000A9440200FEF5EA00FEF6F000FEF5EA00FEF1E300FEF1E300FFF0DB00FFF0
      DB00CCD9D2000098CB0099C6C900FFE5CA00FFE5CA00FEE2C300E5A86800D887
      3600E29E5600FDDBB700FFE5CA00FEE2C300FCC48700E29E5600D77D24008556
      280056555400333333003333330000000000000000000000000000000000FEE0
      B500FFDAAC00FED8A900FED8A900FED8A900FED8A900FED8A900FED8A900FED8
      A900FED8A900FED8A900FFDAAC00EFF5D00020A61D00009900000099000030AC
      2D0000990000009900000099000000990000BFE6AC00FEE0B500FED8A900FFFE
      DD0083837B006666660000000000000000000000000000000000000000000000
      0000000000008F87B0005FD0FF00309FFF003077D00050677F00706F90008F87
      7F00AF878F00A07F7F00A07F7F00A0676F00B0878F00AF779000906760009F6F
      8F00E0D0CF00FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0CF00FFE0
      CF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFA9
      A900CC666600CC666600866C6C00BA878700A9434300BF8C8C00E7E7E700FDFD
      FD00F4F4F400DBA8A800804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000065656500BC8A5800C769
      1800B65B2200FEF9F500FEF9F500FEF6F000FEF5EA00FEF5EA00FEF1E300FFF0
      DB00FEEDDC0020A3CD0046ADCB00FEE6D100FFE5CA00FFE5CA00FEEAD400D28A
      5700A13C010096551700DC915100EAC79400FFE5CA00FEE2C300BFA18300A6A9
      A6007B7A9C001819870031326B00333333000000000000000000F1DDC400FEE0
      B500FEDEB100FEDEB100FEDEB100FEDEB100FEDEB100FEDEB100FEDEB100FEDE
      B100FEDEB100FEDEB100FEDEB100FEE6BC00CFEBC200109F0F00009900000099
      000000990000009900000099000000990000BFE6AC00FEE8BE00FEDEB100FEFC
      DA00959589006666660000000000000000000000000000000000000000000000
      000000000000000000008F87AF005FD0FF0060A7FF00908FAF00A08FA000AF8F
      9F00BF7F7F00E0C8A000FFF0C000FFFFD000FFFFDF00FFFFD000EFD0BF00BF87
      7F00A07F8F00EFD0C000FFE8D000FFE8D000FFE8D000FFE8D000FFE8D000FFE0
      CF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFAC
      AC00CC666600CC6666008B727200CA9797009F393900A5727200C3C3C300E7E7
      E700FDFDFD00E1AEAE00804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000065656500CA936900C769
      1800B4643900FEF9F500FEF9F500FEF6F000FEF6F000FEF5EA00FEF5EA00FEF1
      E300FEF1E3007FC3D400109DCC00D5D9D300FEEAD400FFE5CA00FEEAD400D28A
      570086380A005A48370033333300D8873600D8873600E8B67D00988D8000E7E9
      F1004A54C5000F48D0000C29B6004A4A7B000000000000000000F1DDC400FDE0
      B300FEE4B900FEE4B900FEE4B900FEE4B900FEE4B900FEE4B900FEE4B900FEE4
      B900FEE4B900FEE4B900FEE4B900FEE4B900FEEEC900DFF1CC0060BF5B000099
      000000990000109F0F0080CC7E00109F0F00BFE6AC00FFEAC400FEE4B900FEF9
      D600A8A897006666660000000000000000000000000000000000000000000000
      000000000000000000000000000090C8EF00D0D8EF00D0C8D00090776F00E0A7
      9000FFF0B000FFFFDF00FFFFD000FFFFDF00FFFFDF00FFFFDF00FFFFE000FFFF
      E000C08F90009F6F8F00E0D0CF00FFE8CF00FFE8D000FFE8D000FFE8D000FFE8
      D000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFAF
      AF00CC666600CC666600876E6E00DCC3C300C58C8C00B58E8E00A3A3A300C3C3
      C300E7E7E700E4B1B100804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000065656500CA936900C769
      1800B4643900FEFEFD00FEFEFD00FEF9F500FEF6F000FEF6F000FEF5EA00FEF5
      EA00FEF1E300EDE6D7000098CB0085C5D500FEEAD400FEE6D100FFF0DB00D28A
      57009A3601003F414400333333000000000000000000DC915100DC9151008687
      9B002A37B2002377EC000C29B6004A4A7B000000000000000000F3DCBA00FEE4
      B900FEECC500FEECC500FEECC500FEECC500FEECC500FEECC500FEECC500FEEC
      C500FEECC500FEECC500FEECC500FEECC500FEECC500FEEEC900FFF9E400FFFE
      F500FFFFFC00FFFBEC00FEF9E200BFE5B400BFE6AC00FFF2CD00FEECC500FEF9
      D600B1B19F006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000EFD0C000FFF8FF00C0A7AF00EFB79000FFE8
      BF00FFF8CF00FFF8CF00FFFFD000FFFFD000FFFFEF00FFFFEF00FFFFFF00FFFF
      FF00FFFFF000B07F7F0070576F00DFC8C000FFE8DF00FFE8D000FFE8D000FFE8
      D000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFB3
      B300CC666600CC6666005B4F4F0098989800C6C6C600F4F4F400C6C6C600A3A3
      A300C3C3C300D4A1A100804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000065656500D5976500B853
      0100BC714700FEFEFD00FEFEFD00FEFEFD00FEF9F500FEF6F000FEF6F000FEF5
      EA00FEF5EA00FEF1E30054B6D3001EA2CD00FEEAD400FEEAD400FEF1E300D28A
      57009A3601003F41440033333300000000000000000000000000000000002A37
      B2002A37B2002A37B2002A37B200000000000000000000000000FAD9AF00FEE8
      BE00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FFF2
      CD00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FFF2CD00FEF4CE00FEF5D100FEF5
      D100FEF5D100FEF5D100FFF2CD00FEF9E200FEFCE500FEF5D100FFF2CD00FEF9
      D600D1D1B8006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000F0D8C000FFF8FF00DFAFAF00FFE8B000FFFF
      D000FFE8B000FFF8CF00FFFFD000FFFFE000FFFFEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF8D0009F5F6F00C0A7AF00FFE8DF00FFE8DF00FFE8D000FFE8
      D000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFB6
      B600CC666600CC666600CC666600B96060009C565600804D4D00796060006D66
      66006B6B6B00A370700076494900CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000065656500DCA87800B44C
      0000C88A6500FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEF9F500FEF6F000FEF6
      F000FEF5EA00FEF5EA00BCD7D9000098CB009ECDD600FEEAD400FEF1E300D28A
      57009A3601003F41440033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDD6A900FEF0
      CA00FEF9D600FEF9D600FEF9D600FEF9D600FEF9D600FEF9D600FEF9D600FEF9
      D600FEF9D600FEF9D600FFF2CD00FFF2CD00FEF5D100FEF0CA00F6E3BB00F6E3
      BB00FEFCDA00FFFEDD00FFFEDD00FEFCDA00FEFAD800FEF9D600FEF9D600FEFC
      DA00D0D0B7006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000F0D8C000EFC8DF00FFC8AF00FFF8D000FFE8
      BF00FFE8B000FFFFCF00FFFFD000FFFFE000FFFFEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFE000FFFFDF00B0877F007F677000FFE8DF00FFE8DF00FFE8DF00FFE8
      D000FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFB9
      B900CC666600CC66660089505000A6595900C2636300CC666600CC666600CC66
      6600B9606000A6595900804D4D00CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000065656500DCA87800B44C
      0000C88A6500FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEF9F500FEF6
      F000FEF6F000FEF5EA00FEF1E30032ABD00032ABD000FEEDDC00FFF0DB00C77B
      47008C44050048494A0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFD4A400FEF5
      D100FFFEDD00F3DDB500F3DDB500FFFEDD00FFFEDD00FFFEDD00FFFEDD00FFFE
      DD00FEF5D100FEECC500F8DDB300E6AF7D00DB935A00DE996100E19C6400E19C
      6400E4A26A00ECAF7800F3CA9A00F3DDB500FFFEDD00FFFEDD00FFFEDD00FFFE
      DD00F3F3D5006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000F0D8BF00DF9F9F00FFD0AF00FFF8CF00FFD8
      A000FFE8B000FFF8CF00FFFFD000FFFFE000FFFFE000FFFFF000FFFFFF00FFFF
      E000FFFFEF00FFFFDF00DFB7AF007F5F6F00FFE8DF00FFE8DF00FFE8DF00FFE8
      DF00FFD8C000DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFBC
      BC00CC666600CC666600735F5F00C0C0C0009F9F9F00918B8B008A7171008C59
      590093535300A6595900CC666600CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000065656500DCA87800B44C
      0000C88A6500FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEF9
      F500FEF6F000FEF6F000FEF5EA00C9E2E200C9E2E200FEF1E300FEEDDC00C77B
      47008C44050048494A0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FED1A100FEF0
      CA00D3905900CA793D00CC7C4000E5B48200FFFEDD00FFFEDD00FFFEDD00FEF0
      CA00FFE9C100EBBB8B00DB935A00DB935A00DE996100E19C6400E19C6400E4A2
      6A00E6A46D00E7A77000E9A97200EAAC7500EEB47F00F8DDB300FFFEDD00FFFE
      DD00FFFEDD006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000EFD0C000FFC8B000FFE8C000FFF8C000FFD8
      A000FFE0B000FFF8BF00FFFFD000FFFFD000FFFFE000FFFFE000FFFFE000FFFF
      EF00FFFFDF00FFFFD000EFD0A000705F6000FFF0E000FFF0DF00FFE8DF00FFE8
      DF00FFD8C000DF8F7F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFBF
      BF00CC666600CC666600876E6E00CDCDCD00DBDBDB00E3E3E300F6F6F600F8F8
      F800EFEFEF00CACACA0066666600CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000065656500E5A86800B853
      0100B9612400C9835600CC998000E6C9B700EEDED200FEFEFD00FEFEFD00FEFE
      FD00FEFEFD00FEFEFD00FEF9F500FEF6F000FEF5EA00FEF5EA00FEF1E300C77B
      47008C44050048494A0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FED1A100ECC1
      9200CA793D00C8834E00CA8E6200D3A77D00FFFEDD00FFFEDD00FEECC500FEE4
      B900DB935A00DB935A00DB935A00DE996100E19C6400E19C6400E4A26A00E6A4
      6D00E7A77000E9A97200EAAC7500ECAF7800EEB17C00F0B37E00F4C59500FEFA
      D800FFFEDD006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000F0D8C000FFD0BF00FFE0C000FFF8C000FFD8
      AF00FFF0C000FFF0BF00FFF8CF00FFFFD000FFFFDF00FFFFDF00FFFFDF00FFFF
      DF00FFFFD000FFFFDF00DFB790007F676F00FFF0E000FFB7B000FFAFB000FF9F
      A000FF9F9F00DF978F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFC2
      C200CC666600CC666600866C6C00D0D0D000CDCDCD00C4C4C400B4B4B400BDBD
      BD00B1B1B100D7D7D70098989800CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000065656500E4AC7200C45C
      0000B8530100B44C0000B44C0000B8530100B8530100B65B2200BF7C5900CA95
      7500E5C0A900E7DAC800F3E5DE00FEF5EA00FEFEFD00FEFEFD00FEF5EA00D687
      42008C44050048494A0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FBD19D00CDB2
      9300000000000000000000000000DBDBC100FFFEDD00FFE9C100FEE0B5006666
      66000000000000000000E19C6400E19C6400E19C6400E4A26A00E6A46D00E7A7
      7000E9A97200EAAC7500ECAF7800EEB17C00F0B37E00F2B68100F3BA8400F8CD
      9E00FEEEC9006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000FFE0CF00E0C8C000FFE0B000FFFFDF00FFF0
      C000FFE0B000FFE0AF00FFF0C000FFF8CF00FFFFCF00FFFFD000FFFFDF00FFF8
      C000FFFFCF00FFF8CF00CF9F9000D0B7B000EFB79000F09F4000EF973000E08F
      3000DF873000BF8F6F0060676000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFC5
      C500CC666600CC666600866C6C00CACACA00B7B6B600B9B9B900B4B4B400BABA
      BA00C8C8C800E1E1E10097979700CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000065656500E8B67D00C45C
      0000C45C0000C45C0000C45C0000C45C0000C45C0000C45C0000C45C0000B44C
      0000B44C0000B44C0000B9612400C77B4700C88A6500D8A78800E5C0A900C673
      39008C44050048494A0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FED1A100F3DC
      BA006666660066666600EBEBCD00FEFCDA00FEE6BC00FEDEB100666666000000
      000000000000000000000000000000000000E6A46D00E6A46D00E7A77000E9A9
      7200EAAC7500ECAF7800EEB17C00F0B37E00F2B68100EDBE9300F5BD8A00F8C1
      8D00F8C18D006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000FFE0CF00F0E8DF00E0BFA000FFFFDF00FFFF
      F000FFF8EF00FFE8CF00FFD8A000FFF0C000FFE8B000FFF0C000FFF0C000FFF0
      C000FFF8D000FFE0B0009F5F6F00E0C8D000EFBFA000FFBF5F00FFA72F00FFA7
      1F00CF8F4F006067600000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8C8C800FFC9
      C900CC666600CC666600856B6B00C8C8C800AEAEAE00BDBDBD00C3C3C300DBDB
      DB00C6C6C600E4E4E40094949400CC666600CC6666004A4A4A00000000000000
      0000000000000000000000000000000000000000000065656500E8B67D00E496
      4600D4761800D26C0900C7610000C45C0000C45C0000C45C0000C45C0000C45C
      0000C7610000C7610000C45C0000B8530100B44C0000B44C0000B8530100B853
      0100984A0B0048494A0033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FED1A100FED8
      A900FEFCDA00FEF9D600FEECC500FED8A900FDD6A90066666600000000000000
      0000000000000000000000000000000000000000000000000000E9A97200EAAC
      7500ECAF7800EEB17C00E6AF7D00AF988400000000000000000000000000F4C5
      9500FBC690006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000FFE8CF00FFFFFF00CF979F00FFE8C000FFFF
      FF00FFFFFF00FFF8EF00FFD8B000FFE0BF00FFE0AF00FFD8A000FFE0AF00FFFF
      CF00FFF8BF00CF9F8F009F6F8F00FFF0EF00EFC8AF00FFD08F00FFB75000D09F
      6000606760000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CACACA00FFCB
      CB00CC666600CC666600856B6B00E1E1E100E3E3E300E7E7E700D4D4D400D3D3
      D300C4C4C400D0D0D00094949400CC666600CC6666004F4F4F00000000000000
      000000000000000000000000000000000000000000006565650065656500EAA8
      5800C9AE7900DBC29000EDC68600F2B77700EAA85800E0953F00D9822A00D26C
      0900C45C0000C45C0000C45C0000C45C0000C7610000C7610000C7610000C761
      00007E4A1A005655540033333300000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FECF
      A000FBD19D00FED1A100FBD2A400FBD2A4000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ECAF
      7800EEB17C00F0B37E00A082670070707000000000000000000000000000E5BA
      9000FDC895006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000FFE8D000FFFFFF00FFFFFF00EFA7B000FFFF
      F000FFFFFF00FFF8F000FFFFD000FFE8BF00FFE0A000FFF0BF00FFFFDF00FFE0
      AF00E0AF8F00C08F7F00FFF8EF00FFF0EF00F0D0B000FFD89F00CF976F006067
      6000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8C1
      C100EDBBBB00C6999900DEDEDE00C4C4C400E7E7E700F3F3F300EFEFEF00EFEF
      EF00EDEDED00EFEFEF0094949400CC666600CC66660075757500000000000000
      0000000000000000000000000000000000000000000000000000000000006565
      650065656500656565006565650065656500EAA85800C9AE7900C9AE7900DBC2
      9000EAC79400E8B67D00E5A86800DF963F00D9822A00D4761800D26C0900D26C
      09007E4A1A006565650033333300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0B37E00F2B68100DAAB80008A7A6B008A7A6B0092817100D2AB8400FDC8
      950083837B006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000FFE8D000FFFFFF00FFFFFF00FFFFFF00BF77
      8F00F0D8BF00FFF0C000FFFFD000FFFFD000FFFFD000FFF0CF00FFD8A000CF97
      9F00C0978F00EFE8EF00E0E8EF00E0E8E000F0D0B000D0AF8F00606760000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D9D9D900EFEFEF00E3E3
      E300E1E1E100FAFAFA00AF9F9F00E1AEAE00C78E8E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006565650065656500656565006565
      6500656565006565650065656500EAA85800C9AE7900C9AE7900C9AE7900D2A6
      6300866B48006565650000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F3BA8400F5BD8A00F8C18D00F8C18D00FBC69000FDC89500A8A8
      9700666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFD8B000FFE0BF00FFD8BF00FFD8BF00F0D0
      B000DFAFAF00DF9F9F00C0977F00CF977F00DFAFA000F0B7BF00E0B7A000DFAF
      A000EFBFAF00E0BFAF00E0BFAF00E0BFAF00EFC8AF00AF9F9000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000656565006565650065656500656565006565
      6500656565000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FBC69000FBC69000FACA9900A8A897006666
      6600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000600000000100010000000000000600000000000000000000
      000000000000000000000000FFFFFF00FC3A001FFFFE00170000000000000000
      FC80001FFFFF803F00000000000000007000000FFFFC000F0000000000000000
      B000001FFFFC000100000000000000005000001FADC000000000000000000000
      B000000FB88000010000000000000000F000001FFC8000000000000000000000
      F000000F7A0000030000000000000000F000001FC00000030000000000000000
      F000001FA00000010000000000000000E000000FC00000060000000000000000
      B000000F000000050000000000000000A000000F000000000000000000000000
      F000000F0000000100000000000000005000000F000000010000000000000000
      E000000F000000010000000000000000E000000F000000000000000000000000
      F000000F000000000000000000000000F000000F000000000000000000000000
      F800000F000000000000000000000000F000000F000000000000000000000000
      F800000F000000000000000000000000F000000F000000000000000000000000
      D000000F0000000100000000000000006000000F0000000D0000000000000000
      D000000F0000001F0000000000000000B800000F0000021F0000000000000000
      D800000F000000DF0000000000000000F800000F010007CF0000000000000000
      B800000FFF00075F00000000000000006AC0000FE780073F0000000000000000
      FFB0200FB7401D9F0000000000000000ECBFF77F000000000000000000000000
      ECC0037F0000000000000000000000003F0000FF000000000000000000000000
      3C00003F000000000000000000000000F8000008000000000000000000000000
      E000000C000000000000000000000000E0000007000000000000000000000000
      8000000700000000000000000000000080000003000000000000000000000000
      8000000300000000000000000000000080000000000000000000000000000000
      0004000000000000000000000000000000080001000000000000000000000000
      0070000100000000000000000000000000600000000000000000000000000000
      0040000000000000000000000000000000000001000000000000000000000000
      0000000100000000000000000000000000000001000000000000000000000000
      0000000100000000000000000000000000000801000000000000000000000000
      0000000100000000000000000000000000002000000000000000000000000000
      0000000000000000000000000000000000000005000000000000000000000000
      8000000700000000000000000000000080000007000000000000000000000000
      8000001F0000000000000000000000008000001F000000000000000000000000
      E000007F0000000000000000000000002000007F000000000000000000000000
      3C00013F000000000000000000000000FFFFFFFFE1FFFFFFFF801FFFFF000001
      FFFE3FFFC03FFFFFFF0003FFFE000001FFF807FFC007FFFFFE0000FFFE000001
      FFC001FFC000FFFFFC00003FFE000001FF00007FC0001FFFFC00001FFE000001
      FC00000FC00003FFFC00000FFE000001F0000003C00001FFF800000FFE000001
      C0000000C00001FFF800000FFE00000180000000C00001FFF8000007C6000001
      00000000C00001FFF00000078200000100000000C00001FFF000000780000001
      00000000C00001FFF00000078000000100000000C00001FFE000000780000001
      00000001C000007FE0000007C0000001800000078000001FE0000007E0000001
      F000003F80000007E0000003F0000001FE00003F80000001E0000003F8000001
      FFC0003F80000000C0000003FC000001FFC0003F80000000C0000003FE000001
      FFC0003F80000180C0000003FE000001FFC0003F800001E1C0000003FE000001
      FFC0003F800001FFC0000003FE000001FFC0003F800001FFC0000003FE000001
      FFC0003F800001FFC0000003FE000001FFC0003F800001FFC0000003FE000001
      FFC0003F800001FFCE0C0003FE000001FFC0003F800001FFC01F0003FE000003
      FFC0003F800001FFC03FC0E3FE000007FFC0003F800001FFE0FFE0E3FE00000F
      FFE0003FE00001FFFFFFF003FE00001FFFFF807FFF0003FFFFFFF807FE00003F
      FFFFFFFFFFFE07FFFFFFFE0FFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object BalloonHint1: TBalloonHint
    Images = ImgImagens_Comandos
    Left = 672
    Top = 8
  end
  object qAux: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 784
    Top = 8
  end
  object qAux2: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 752
    Top = 8
  end
  object rs: TRSPrinter
    PageSize = pzLetter
    PageLength = 0
    FastPrinter = Epson_LX
    FastFont = [Compress]
    FastPort = 'USB'
    SaveConfToRegistry = False
    Zoom = zHeight
    Preview = ppYes
    Title = 'Pedido'
    Left = 608
    Top = 8
  end
  object ds_itens_venda: TDataSource
    DataSet = qryitens_venda
    Left = 464
    Top = 328
  end
  object qryitens_venda: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select IP.*, P.Codigo_Venda, P.Descricao from Itens_Pedido IP'
      'inner join Produto P on(IP.Codigo_Produto = P.Codigo)')
    Left = 496
    Top = 328
    object qryitens_vendaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryitens_vendaN_Item: TStringField
      FieldName = 'N_Item'
      Size = 10
    end
    object qryitens_vendaCodigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object qryitens_vendaUN: TStringField
      FieldName = 'UN'
      Size = 10
    end
    object qryitens_vendaICMS: TStringField
      FieldName = 'ICMS'
      Size = 10
    end
    object qryitens_vendaCST: TStringField
      FieldName = 'CST'
      Size = 10
    end
    object qryitens_vendaBase_Reduzida: TStringField
      FieldName = 'Base_Reduzida'
      Size = 5
    end
    object qryitens_vendaBase_Acrescida: TStringField
      FieldName = 'Base_Acrescida'
      Size = 5
    end
    object qryitens_vendaBC: TStringField
      FieldName = 'BC'
      Size = 10
    end
    object qryitens_vendaIPI: TStringField
      FieldName = 'IPI'
      Size = 10
    end
    object qryitens_vendaCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Size = 10
    end
    object qryitens_vendaBase_Reduzida_IPI: TStringField
      FieldName = 'Base_Reduzida_IPI'
      Size = 10
    end
    object qryitens_vendaBase_Acrescida_IPI: TStringField
      FieldName = 'Base_Acrescida_IPI'
      Size = 10
    end
    object qryitens_vendaBC_IPI: TStringField
      FieldName = 'BC_IPI'
      Size = 10
    end
    object qryitens_vendaPIS: TStringField
      FieldName = 'PIS'
      Size = 10
    end
    object qryitens_vendaCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 10
    end
    object qryitens_vendaBase_Reduzida_PIS: TStringField
      FieldName = 'Base_Reduzida_PIS'
      Size = 10
    end
    object qryitens_vendaBase_Acrescida_PIS: TStringField
      FieldName = 'Base_Acrescida_PIS'
      Size = 10
    end
    object qryitens_vendaBC_PIS: TStringField
      FieldName = 'BC_PIS'
      Size = 10
    end
    object qryitens_vendaCOFINS: TStringField
      FieldName = 'COFINS'
      Size = 10
    end
    object qryitens_vendaCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 10
    end
    object qryitens_vendaBase_Reduzida_COFINS: TStringField
      FieldName = 'Base_Reduzida_COFINS'
      Size = 10
    end
    object qryitens_vendaBase_Acrescida_COFINS: TStringField
      FieldName = 'Base_Acrescida_COFINS'
      Size = 10
    end
    object qryitens_vendaBC_COFINS: TStringField
      FieldName = 'BC_COFINS'
      Size = 10
    end
    object qryitens_vendaQtde: TFloatField
      FieldName = 'Qtde'
    end
    object qryitens_vendaQtde_Entregue: TFloatField
      FieldName = 'Qtde_Entregue'
    end
    object qryitens_vendaQtde_Restante: TFloatField
      FieldName = 'Qtde_Restante'
    end
    object qryitens_vendaValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_vendaDesconto: TFloatField
      FieldName = 'Desconto'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_vendaTipo_Desconto: TStringField
      FieldName = 'Tipo_Desconto'
      Size = 1
    end
    object qryitens_vendaAcrecimo: TFloatField
      FieldName = 'Acrecimo'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_vendaTipo_Acrecimo: TStringField
      FieldName = 'Tipo_Acrecimo'
      Size = 1
    end
    object qryitens_vendaSub_Total: TFloatField
      FieldName = 'Sub_Total'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_vendaCancelado: TStringField
      FieldName = 'Cancelado'
      Size = 1
    end
    object qryitens_vendaCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qryitens_vendaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
  end
  object qryvenda: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select P.*, C.Nome_Nome_Fantasia, C.CPF, CP.Descricao from Pedid' +
        'o P'
      'inner join Cliente C on (C.Codigo = P.Codigo_Cliente)'
      
        'inner join Condicao_Pagamento CP on (CP.Codigo = P.Codigo_Condic' +
        'ao_Pagamento)')
    Left = 432
    Top = 328
    object qryvendaCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryvendaN_Pedido: TStringField
      FieldName = 'N_Pedido'
      Size = 13
    end
    object qryvendaCOO: TStringField
      FieldName = 'COO'
      Size = 6
    end
    object qryvendaCOO_Vin: TStringField
      FieldName = 'COO_Vin'
      Size = 6
    end
    object qryvendaCodigo_Cliente: TIntegerField
      FieldName = 'Codigo_Cliente'
    end
    object qryvendaCodigo_Condicao_Pagamento: TIntegerField
      FieldName = 'Codigo_Condicao_Pagamento'
    end
    object qryvendaCodigo_Empresa: TIntegerField
      FieldName = 'Codigo_Empresa'
    end
    object qryvendaOutras_Despesas: TFloatField
      FieldName = 'Outras_Despesas'
    end
    object qryvendaTipo_Frete: TStringField
      FieldName = 'Tipo_Frete'
      Size = 3
    end
    object qryvendaValor_Frete: TFloatField
      FieldName = 'Valor_Frete'
    end
    object qryvendaData_Venda: TDateTimeField
      FieldName = 'Data_Venda'
    end
    object qryvendaData_Previsao_Entrega: TDateTimeField
      FieldName = 'Data_Previsao_Entrega'
    end
    object qryvendaHora_Entrega: TStringField
      FieldName = 'Hora_Entrega'
      Size = 10
    end
    object qryvendaQtde_Itens: TIntegerField
      FieldName = 'Qtde_Itens'
    end
    object qryvendaTotal_Produtos: TFloatField
      FieldName = 'Total_Produtos'
    end
    object qryvendaPeso_Total: TFloatField
      FieldName = 'Peso_Total'
    end
    object qryvendaDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object qryvendaTipo_Desconto: TStringField
      FieldName = 'Tipo_Desconto'
      Size = 1
    end
    object qryvendaTotal_Pedido: TFloatField
      FieldName = 'Total_Pedido'
    end
    object qryvendaTipo: TStringField
      FieldName = 'Tipo'
      Size = 10
    end
    object qryvendaStatus: TStringField
      FieldName = 'Status'
      Size = 10
    end
    object qryvendaValor_Recebido: TFloatField
      FieldName = 'Valor_Recebido'
    end
    object qryvendaTroco: TFloatField
      FieldName = 'Troco'
    end
    object qryvendaObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 300
    end
    object qryvendaNome_Nome_Fantasia: TStringField
      FieldName = 'Nome_Nome_Fantasia'
      Size = 50
    end
    object qryvendaCPF: TStringField
      FieldName = 'CPF'
    end
    object qryvendaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object qryvendaCCF: TStringField
      FieldName = 'CCF'
      Size = 6
    end
    object qryvendaCodigo_Veiculo: TIntegerField
      FieldName = 'Codigo_Veiculo'
    end
    object qryvendaTotal_Servicos: TFloatField
      FieldName = 'Total_Servicos'
    end
    object qryvendaQtde_Servicos: TIntegerField
      FieldName = 'Qtde_Servicos'
    end
    object qryvendaAcrecimo: TFloatField
      FieldName = 'Acrecimo'
    end
    object qryvendaTipo_Acrecimo: TStringField
      FieldName = 'Tipo_Acrecimo'
      Size = 1
    end
    object qryvendaTotal_Desconto: TFloatField
      FieldName = 'Total_Desconto'
    end
    object qryvendaTotal_Acrecimo: TFloatField
      FieldName = 'Total_Acrecimo'
    end
  end
  object DataSource1: TDataSource
    DataSet = qryitens_os
    Left = 368
    Top = 328
  end
  object qryitens_os: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select IOS.*, P.Codigo_Venda, P.Descricao from Itens_OS IOS'
      'inner join Produto P on(IOS.Codigo_Servico = P.Codigo)'
      '')
    Left = 400
    Top = 328
    object qryitens_osCodigo_Servico: TIntegerField
      FieldName = 'Codigo_Servico'
    end
    object qryitens_osValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
    end
    object qryitens_osDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object qryitens_osTipo_Desconto: TStringField
      FieldName = 'Tipo_Desconto'
      Size = 1
    end
    object qryitens_osSub_Total: TFloatField
      FieldName = 'Sub_Total'
    end
    object qryitens_osCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qryitens_osDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qryitens_osCodigo: TIntegerField
      FieldName = 'Codigo'
    end
  end
  object qAux3: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 720
    Top = 8
  end
end
