object FrmPDV: TFrmPDV
  Left = 183
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cupom Fiscal'
  ClientHeight = 547
  ClientWidth = 940
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
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 799
    Top = 117
    Width = 14
    Height = 13
    Caption = 'IPI'
    Visible = False
  end
  object Label5: TLabel
    Left = 799
    Top = 131
    Width = 36
    Height = 13
    Caption = 'CST IPI'
    Visible = False
  end
  object Label11: TLabel
    Left = 799
    Top = 144
    Width = 70
    Height = 13
    Caption = 'Base Reduzida'
    Visible = False
  end
  object Label15: TLabel
    Left = 799
    Top = 159
    Width = 72
    Height = 13
    Caption = 'Base Acrescida'
    Visible = False
  end
  object Label16: TLabel
    Left = 799
    Top = 173
    Width = 63
    Height = 13
    Caption = 'Base_Calculo'
    Visible = False
  end
  object Label14: TLabel
    Left = 686
    Top = 0
    Width = 66
    Height = 16
    Caption = 'Operador:'
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label13: TLabel
    Left = 716
    Top = 16
    Width = 36
    Height = 16
    Caption = 'Data:'
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Shape2: TShape
    Left = 8
    Top = 0
    Width = 934
    Height = 37
    Brush.Color = clNavy
    Pen.Color = clNavy
    Shape = stRoundRect
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 940
    Height = 547
    Align = alClient
    BorderStyle = bsSingle
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      936
      543)
    object Shape7: TShape
      Left = 1
      Top = 505
      Width = 934
      Height = 37
      Align = alBottom
      Brush.Color = clNavy
      Pen.Color = clNavy
      Shape = stRoundRect
      ExplicitTop = 506
    end
    object LblST: TLabel
      Left = 552
      Top = 121
      Width = 7
      Height = 29
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object Shape8: TShape
      Left = 1
      Top = 465
      Width = 934
      Height = 37
      Brush.Color = clNavy
      Pen.Color = clNavy
      Shape = stRoundRect
    end
    object Label1: TLabel
      Left = 8
      Top = 508
      Width = 933
      Height = 13
      Caption = 
        '<F2>-Abre Cupom  <F3>-Buscar Produtos  <F4>-ADM.TEF  <F5>-Cap. B' +
        'alan'#231'a  <F6>-Desc./Acr.  <F7>-Altera Tabela  <F9>-Cupom Nominal ' +
        ' <Delete>-Remove Item'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 525
      Width = 304
      Height = 13
      Caption = '<F10 ou ENTER>-Fecha Cupom <F12>-Cancela Cupom'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object LblCodigo: TLabel
      Left = 728
      Top = 82
      Width = 33
      Height = 13
      Caption = 'Codigo'
    end
    object LblNCM: TLabel
      Left = 767
      Top = 40
      Width = 22
      Height = 13
      Caption = 'NCM'
      Visible = False
    end
    object LblCFOP: TLabel
      Left = 795
      Top = 40
      Width = 27
      Height = 13
      Caption = 'CFOP'
      Visible = False
    end
    object DBGrid1: TDBGrid
      Left = 232
      Top = 122
      Width = 463
      Height = 320
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      BorderStyle = bsNone
      DataSource = DM.ds_itens_venda
      DrawingStyle = gdsGradient
      FixedColor = clWindowText
      GradientEndColor = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnKeyDown = DBGrid1KeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'N_Item'
          Title.Caption = 'Item'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Codigo_Venda'
          Title.Caption = 'C'#243'digo'
          Width = 138
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          Title.Caption = 'Descri'#231#227'o'
          Width = 355
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Codigo'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Codigo_Venda'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'UN'
          Title.Caption = 'Un.'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ICMS'
          Title.Caption = 'ST.'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Valor_Unitario'
          Title.Caption = 'Val. Unit.'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Qtde'
          Title.Caption = 'Qtde.'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Tipo_Desconto'
          Title.Caption = 'T. Desconto'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Desc_Acr'
          Title.Caption = 'Desc./Acr.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Acrecimo'
          Title.Caption = 'Acr.'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Sub_Total'
          Title.Caption = 'Valor Total'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cancelado'
          Visible = False
        end>
    end
    object Panel2: TPanel
      Left = 6
      Top = 468
      Width = 927
      Height = 34
      BevelOuter = bvNone
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      object LblStatus: TLabel
        Left = 4
        Top = -1
        Width = 237
        Height = 37
        Caption = 'EM OPERA'#199#195'O'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -32
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object Panel5: TPanel
        Left = 612
        Top = 0
        Width = 315
        Height = 34
        Align = alRight
        BevelOuter = bvNone
        Caption = 'Panel5'
        TabOrder = 0
        object Label7: TLabel
          Left = 29
          Top = -2
          Width = 136
          Height = 37
          Caption = 'N'#186' NFCe:'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -32
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
        object LblNVenda: TLabel
          Left = 169
          Top = -2
          Width = 9
          Height = 37
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -32
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 103
      Width = 221
      Height = 362
      Align = alCustom
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 2
      DesignSize = (
        221
        362)
      object Shape5: TShape
        Left = 1
        Top = 187
        Width = 217
        Height = 60
        Brush.Color = clNavy
        Pen.Color = clNavy
        Shape = stRoundRect
      end
      object Shape6: TShape
        Left = 1
        Top = 0
        Width = -571
        Height = 38
        Anchors = [akLeft, akTop, akRight]
        Brush.Color = clNavy
        Shape = stRoundRect
        ExplicitWidth = -648
      end
      object Label10: TLabel
        Left = 2
        Top = 273
        Width = 72
        Height = 19
        Caption = 'Sub Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 1
        Top = 83
        Width = 88
        Height = 19
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Shape3: TShape
        Left = 1
        Top = 104
        Width = 217
        Height = 60
        Brush.Color = clNavy
        Pen.Color = clNavy
        Shape = stRoundRect
      end
      object Label6: TLabel
        Left = 2
        Top = 2
        Width = 103
        Height = 19
        Caption = 'Valor Unit'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Shape4: TShape
        Left = 1
        Top = 19
        Width = 217
        Height = 60
        Brush.Color = clNavy
        Pen.Color = clNavy
        Shape = stRoundRect
      end
      object Label8: TLabel
        Left = 2
        Top = 168
        Width = 80
        Height = 19
        Caption = 'Valor Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Shape9: TShape
        Left = 1
        Top = 291
        Width = 217
        Height = 60
        Brush.Color = clNavy
        Pen.Color = clNavy
        Shape = stRoundRect
      end
      object LblSub_Total: TLabel
        Left = 4
        Top = 295
        Width = 210
        Height = 50
        AutoSize = False
        Caption = '10000,00'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -43
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object EdtQuantidade: TEdit
        Left = 4
        Top = 106
        Width = 211
        Height = 53
        BiDiMode = bdLeftToRight
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -43
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        MaxLength = 6
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 0
        Text = '0'
        OnExit = EdtQuantidadeExit
        OnKeyDown = EdtQuantidadeKeyDown
        OnKeyPress = EdtQuantidadeKeyPress
      end
      object EdtValor_Unitario: TEdit
        Left = 4
        Top = 22
        Width = 211
        Height = 53
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -43
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Text = '0,00'
        OnExit = EdtValor_UnitarioExit
        OnKeyDown = EdtValor_UnitarioKeyDown
        OnKeyPress = EdtValor_UnitarioKeyPress
      end
      object EdtValor_Total: TEdit
        Left = 4
        Top = 188
        Width = 211
        Height = 53
        BiDiMode = bdLeftToRight
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -43
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 2
        Text = '0,00'
        OnExit = EdtQuantidadeExit
        OnKeyDown = EdtQuantidadeKeyDown
        OnKeyPress = EdtQuantidadeKeyPress
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 934
      Height = 103
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object Shape1: TShape
        Left = 0
        Top = 0
        Width = 934
        Height = 102
        Align = alTop
        Anchors = [akLeft, akTop, akRight, akBottom]
        Brush.Color = clNavy
        Pen.Color = clWindow
        Shape = stRoundRect
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 932
      end
      object LblProduto: TLabel
        Left = 7
        Top = 54
        Width = 654
        Height = 39
        Caption = 'PRODUTO DE TESTE PARA USAR NO PDV'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -32
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object EdtCodigo_Produto: TEdit
        Left = 7
        Top = 9
        Width = 301
        Height = 41
        BevelEdges = []
        BevelInner = bvNone
        BevelKind = bkFlat
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -32
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        MaxLength = 13
        ParentFont = False
        TabOrder = 0
        Text = '2002154558775'
        OnKeyDown = EdtCodigo_ProdutoKeyDown
        OnKeyPress = EdtCodigo_ProdutoKeyPress
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 512
    Top = 65528
  end
end
