object FrmRel_Consulta_Lucratividade_Produto: TFrmRel_Consulta_Lucratividade_Produto
  Left = 0
  Top = 0
  BorderIcons = []
  ClientHeight = 533
  ClientWidth = 1109
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Scaled = False
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = 0
    Top = 0
    Width = 1123
    Height = 794
    BeforePrint = QuickRep1BeforePrint
    DataSet = FrmConsulta_Lucratividade_Produto.qryconsulta_lucro
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poLandscape
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PrevInitialZoom = qrZoomOther
    PreviewDefaultSaveType = stPDF
    PreviewLeft = 0
    PreviewTop = 0
    object PageHeaderBand1: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 115
      Frame.DrawBottom = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        304.270833333333400000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRLabel9: TQRLabel
        Left = 10
        Top = 20
        Width = 213
        Height = 23
        Size.Values = (
          60.854166666666680000
          26.458333333333330000
          52.916666666666670000
          563.562500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Lucratividade por Produto'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRLabel23: TQRLabel
        Left = 886
        Top = 15
        Width = 32
        Height = 17
        Size.Values = (
          44.979166666666670000
          2344.208333333333000000
          39.687500000000000000
          84.666666666666680000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabel24: TQRLabel
        Left = 886
        Top = 39
        Width = 33
        Height = 17
        Size.Values = (
          44.979166666666670000
          2344.208333333333000000
          103.187500000000000000
          87.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Hora:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabeldata: TQRLabel
        Left = 922
        Top = 15
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          2439.458333333333000000
          39.687500000000000000
          193.145833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QRLabeldata'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRLabelHora: TQRLabel
        Left = 922
        Top = 39
        Width = 75
        Height = 17
        Size.Values = (
          44.979166666666670000
          2439.458333333333000000
          103.187500000000000000
          198.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QRLabelHora'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRHRule2: TQRHRule
        Left = 10
        Top = 43
        Width = 207
        Size.Values = (
          26.458333333333330000
          26.458333333333330000
          113.770833333333300000
          547.687500000000000000)
        XLColumn = 0
        VertAdjust = 0
      end
      object LblEmpresa_Cabecalho: TQRLabel
        Left = 10
        Top = 51
        Width = 111
        Height = 17
        Size.Values = (
          44.979166666666670000
          26.458333333333330000
          134.937500000000000000
          293.687500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'LblEmpresa_Cabecalho'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object LblEmpresa: TQRLabel
        Left = 225
        Top = 20
        Width = 655
        Height = 23
        Size.Values = (
          60.854166666666680000
          595.312500000000000000
          52.916666666666670000
          1733.020833333333000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'EMPRESA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 12
      end
      object QRLabel15: TQRLabel
        Left = 124
        Top = 95
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          328.083333333333400000
          251.354166666666700000
          148.166666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Descri'#231#227'o'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 637
        Top = 95
        Width = 32
        Height = 17
        Size.Values = (
          44.979166666666670000
          1685.395833333333000000
          251.354166666666700000
          84.666666666666680000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Lucro'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 732
        Top = 95
        Width = 14
        Height = 17
        Size.Values = (
          44.979166666666670000
          1936.750000000000000000
          251.354166666666700000
          37.041666666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '%'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 539
        Top = 95
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          1426.104166666667000000
          251.354166666666700000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Custo Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 438
        Top = 95
        Width = 78
        Height = 17
        Size.Values = (
          44.979166666666670000
          1158.875000000000000000
          251.354166666666700000
          206.375000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Vendido'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 768
        Top = 95
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          2032.000000000000000000
          251.354166666666700000
          211.666666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Lucro Unit'#225'rio'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 10
        Top = 95
        Width = 77
        Height = 17
        Size.Values = (
          44.979166666666670000
          26.458333333333330000
          251.354166666666700000
          203.729166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Codigo Venda'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 379
        Top = 95
        Width = 31
        Height = 17
        Size.Values = (
          44.979166666666670000
          1002.770833333333000000
          251.354166666666700000
          82.020833333333340000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Qtde.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object DetailBand1: TQRBand
      Left = 38
      Top = 153
      Width = 1047
      Height = 21
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.562500000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBN_Nota_Fiscal: TQRDBText
        Left = 124
        Top = 2
        Width = 253
        Height = 17
        Size.Values = (
          44.979166666666670000
          328.083333333333400000
          5.291666666666667000
          669.395833333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = FrmConsulta_Lucratividade_Produto.qryconsulta_lucro
        DataField = 'Descricao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 438
        Top = 2
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          1158.875000000000000000
          5.291666666666667000
          256.645833333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = FrmConsulta_Lucratividade_Produto.qryconsulta_lucro
        DataField = 'Total_vendido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Mask = '#0.0,0'
        OnPrint = QRDBText2Print
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 732
        Top = 2
        Width = 33
        Height = 17
        Size.Values = (
          44.979166666666670000
          1936.750000000000000000
          5.291666666666667000
          87.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = FrmConsulta_Lucratividade_Produto.qryconsulta_lucro
        DataField = 'percentual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Mask = '#0.0,0'
        OnPrint = QRDBText3Print
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 539
        Top = 2
        Width = 95
        Height = 17
        Size.Values = (
          44.979166666666670000
          1426.104166666667000000
          5.291666666666667000
          251.354166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = FrmConsulta_Lucratividade_Produto.qryconsulta_lucro
        DataField = 'Custo_total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Mask = '#0.0,0'
        OnPrint = QRDBText4Print
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 637
        Top = 2
        Width = 91
        Height = 17
        Size.Values = (
          44.979166666666670000
          1685.395833333333000000
          5.291666666666667000
          240.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = FrmConsulta_Lucratividade_Produto.qryconsulta_lucro
        DataField = 'lucratividade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Mask = '#0.0,0'
        OnPrint = QRDBText5Print
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 768
        Top = 2
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          2032.000000000000000000
          5.291666666666667000
          211.666666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = FrmConsulta_Lucratividade_Produto.qryconsulta_lucro
        DataField = 'lucratividade_unitaria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Mask = '#0.0,0'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 10
        Top = 2
        Width = 108
        Height = 17
        Size.Values = (
          44.979166666666670000
          26.458333333333330000
          5.291666666666667000
          285.750000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = FrmConsulta_Lucratividade_Produto.qryconsulta_lucro
        DataField = 'Codigo_Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBText11: TQRDBText
        Left = 379
        Top = 2
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          1002.770833333333000000
          5.291666666666667000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = FrmConsulta_Lucratividade_Produto.qryconsulta_lucro
        DataField = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Mask = '#0.0,0'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object QRBand4: TQRBand
      Left = 38
      Top = 297
      Width = 1047
      Height = 24
      Frame.DrawTop = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object LblEmpresa_Rodape: TQRLabel
        Left = 5
        Top = 4
        Width = 136
        Height = 17
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          10.583333333333330000
          359.833333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FAV Sistemas e Consultoria'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object LblTelefone_Rodape: TQRLabel
        Left = 957
        Top = 4
        Width = 86
        Height = 17
        Size.Values = (
          44.979166666666670000
          2532.062500000000000000
          10.583333333333330000
          227.541666666666700000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Fone.: 8406-8000'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel25: TQRLabel
        Left = 517
        Top = 4
        Width = 37
        Height = 17
        Size.Values = (
          44.979166666666670000
          1367.895833333333000000
          10.583333333333330000
          97.895833333333320000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'P'#225'gina:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRExpr2: TQRExpr
        Left = 565
        Top = 5
        Width = 68
        Height = 15
        Size.Values = (
          39.687500000000000000
          1494.895833333333000000
          13.229166666666670000
          179.916666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        Expression = 'PAGENUMBER'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 174
      Width = 1047
      Height = 123
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        325.437500000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel12: TQRLabel
        Left = 5
        Top = 29
        Width = 110
        Height = 17
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          76.729166666666680000
          291.041666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Valor Total Vendido'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 50
        Top = 52
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          132.291666666666700000
          137.583333333333300000
          171.979166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Custo Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 51
        Top = 75
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          134.937500000000000000
          198.437500000000000000
          169.333333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Lucro Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 69
        Top = 98
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          182.562500000000000000
          259.291666666666700000
          121.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '% Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object LblValor_Total_Vendido: TQRLabel
        Left = 121
        Top = 29
        Width = 93
        Height = 17
        Size.Values = (
          44.979166666666670000
          320.145833333333400000
          76.729166666666680000
          246.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Valor Total Vendido'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object LblCusto_Medio_Total: TQRLabel
        Left = 121
        Top = 52
        Width = 93
        Height = 17
        Size.Values = (
          44.979166666666670000
          320.145833333333400000
          137.583333333333300000
          246.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Valor Total Vendido'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object LblLucro_Total: TQRLabel
        Left = 121
        Top = 75
        Width = 93
        Height = 17
        Size.Values = (
          44.979166666666670000
          320.145833333333400000
          198.437500000000000000
          246.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Valor Total Vendido'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object LblP_Total: TQRLabel
        Left = 121
        Top = 98
        Width = 93
        Height = 17
        Size.Values = (
          44.979166666666670000
          320.145833333333400000
          259.291666666666700000
          246.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Valor Total Vendido'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
  end
  object QRPDFFilter1: TQRPDFFilter
    CompressionOn = True
    TextEncoding = ASCIIEncoding
    Codepage = '1252'
    Left = 432
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select Y.Codigo_venda,'
      #9'   Y.Descricao,'
      #9'   Y.Qtde,'
      #9'   Y.Total_vendido,'
      #9'   Y.Custo_total,'
      
        '                   (Y.Total_vendido - Y.Custo_total) as lucrativ' +
        'idade,'
      #9'   ((Y.custo_total / Y.totalgeral)*100) as percentual,'
      
        '                   ((Y.Total_vendido - Y.Custo_total) / Y.Qtde) ' +
        'as lucratividade_unitaria'
      'from('
      'select Pro.Codigo_Venda AS CODIGO_VENDA, '
      '          Pro.Descricao AS DESCRICAO, '
      '          sum(IP.Qtde) as Qtde, '
      '          sum(IP.Sub_Total_Liquido) as Total_Vendido, '
      '          (Pro.Valor_Medio * sum(IP.Qtde)) as Custo_Total, '
      
        #9'   (select sum(t.Sub_Total_Liquido) from Itens_Pedido t) as tot' +
        'algeral '
      '/*where ... aqui tdepois vc poes as regras where'
      
        '   /*(sum(IP.Sub_Total_Liquido) - (Pro.Valor_Medio * sum(IP.Qtde' +
        '))) as Lucratividade_Bruto, '
      
        '(sum(IP.Sub_Total_Liquido) - (Pro.Valor_Medio * sum(IP.Qtde))) /' +
        ' (sum(IP.Sub_Total_Liquido) - (Pro.Valor_Medio * sum(IP.Qtde))) ' +
        'as Porcentagem,'
      
        '(sum(IP.Sub_Total_Liquido) - (Pro.Valor_Medio * sum(IP.Qtde))) /' +
        ' sum(IP.Qtde) as Lucro_Medio_Unitario */'
      '*/'
      'from Itens_Pedido IP'
      'left join Pedido Ped on (IP.Codigo = Ped.Codigo)'
      'left join Produto Pro on (Pro.Codigo = IP.Codigo_Produto)'
      'group by Pro.Codigo_Venda, Pro.Descricao, Pro.Valor_Medio) Y'
      'order by Total_vendido desc')
    Left = 400
    Top = 8
    object ADOQuery1Codigo_venda: TStringField
      FieldName = 'Codigo_venda'
    end
    object ADOQuery1Descricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object ADOQuery1Qtde: TFloatField
      FieldName = 'Qtde'
      ReadOnly = True
    end
    object ADOQuery1Total_vendido: TFloatField
      FieldName = 'Total_vendido'
      ReadOnly = True
    end
    object ADOQuery1Custo_total: TFloatField
      FieldName = 'Custo_total'
      ReadOnly = True
    end
    object ADOQuery1lucratividade: TFloatField
      FieldName = 'lucratividade'
      ReadOnly = True
    end
    object ADOQuery1percentual: TFloatField
      FieldName = 'percentual'
      ReadOnly = True
    end
    object ADOQuery1lucratividade_unitaria: TFloatField
      FieldName = 'lucratividade_unitaria'
      ReadOnly = True
    end
  end
end
