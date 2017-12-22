object FrmMapa_Resumo: TFrmMapa_Resumo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Mapa Resumo'
  ClientHeight = 135
  ClientWidth = 352
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
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 217
    Top = 45
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
  object Label8: TLabel
    Left = 153
    Top = 45
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
  object Label4: TLabel
    Left = 153
    Top = 87
    Width = 19
    Height = 13
    Caption = 'ECF'
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
    Height = 135
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
    Images = DM.ImgImagens_PAF
    List = True
    ParentFont = False
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = False
    TabOrder = 3
    object BBtnSalvar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Clique para Salvar/Alterar o registro'
      Caption = '&Enviar'
      Enabled = False
      ImageIndex = 0
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
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object MEdtData_Final: TMaskEdit
    Left = 217
    Top = 64
    Width = 63
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
  end
  object MEdtData_Inicial: TMaskEdit
    Left = 153
    Top = 64
    Width = 65
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
    TabOrder = 0
    Text = '  /  /    '
  end
  object EdtN_Serie: TEdit
    Left = 153
    Top = 102
    Width = 157
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
  end
  object rs: TRSPrinter
    PageSize = pzLetter
    PageLength = 0
    FastPrinter = Epson_LX
    FastFont = [Compress]
    FastPort = 'LPT1'
    Mode = pmWindows
    SaveConfToRegistry = False
    Zoom = zHeight
    Preview = ppNo
    Left = 288
    Top = 56
  end
  object ADOQueryP: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'D1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'D2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'N'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 40
        Value = Null
      end>
    SQL.Strings = (
      'select  R02.Data_movimento Datamov,'
      '            R02.Caixa, '
      '            R02.CRZ,'
      '            R02.COO from R02'
      
        'where R02.Data_Movimento between :D1 and :D2 and R02.N_Fabricaca' +
        'o = :N'
      'group by R02.Data_movimento,'
      '               R02.Caixa,'
      '               R02.CRZ,'
      '               R02.COO'
      'order by R02.Data_Movimento')
    Left = 184
    object ADOQueryPCaixa: TStringField
      FieldName = 'Caixa'
      Size = 4
    end
    object ADOQueryPCRZ: TStringField
      FieldName = 'CRZ'
      Size = 4
    end
    object ADOQueryPCOO: TStringField
      FieldName = 'COO'
      Size = 6
    end
    object ADOQueryPDatamov: TWideStringField
      FieldName = 'Datamov'
      Size = 10
    end
  end
  object ADOQuery2: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'D'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'N'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 40
        Value = Null
      end>
    SQL.Strings = (
      'select  R03.Data_Movimento,'
      '            R03.Totalizador_Parcial,'
      '            (R03.Valor_Acumulado) as valor_venda'
      'from R03'
      'left join R02 on (R03.Data_Movimento = R02.Data_Movimento)'
      
        'where R03.Data_Movimento = :D and Substring(R03.Totalizador_Parc' +
        'ial, 3,1) = '#39'T'#39' and R02.N_Fabricacao = :N'
      'group by R03.Data_Movimento,'
      '            R03.Totalizador_Parcial,'
      '            R03.Valor_Acumulado')
    Left = 152
    object ADOQuery2Data_Movimento: TDateTimeField
      FieldName = 'Data_Movimento'
    end
    object ADOQuery2Totalizador_Parcial: TStringField
      FieldName = 'Totalizador_Parcial'
      Size = 85
    end
    object ADOQuery2valor_venda: TStringField
      FieldName = 'valor_venda'
      Size = 15
    end
  end
  object ADOQuery4: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'D'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'select  sum(P.Desconto) as Desconto from Pedido P'
      'where P.Data_Venda = :D')
    Left = 248
    object ADOQuery4Desconto: TFloatField
      FieldName = 'Desconto'
      ReadOnly = True
    end
  end
  object ADOQuery3: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'D1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'D2'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = Null
      end
      item
        Name = 'D3'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 85
        Value = Null
      end
      item
        Name = 'D4'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 85
        Value = Null
      end
      item
        Name = 'D5'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 85
        Value = Null
      end
      item
        Name = 'D6'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 85
        Value = Null
      end
      item
        Name = 'N1'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 40
        Value = Null
      end
      item
        Name = 'D7'
        Size = -1
        Value = Null
      end
      item
        Name = 'N2'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select  R03.Data_Movimento,'
      '            R03.Totalizador_Parcial,'
      '            (R03.Valor_Acumulado) as valor_venda,'
      
        '            (select (R03.Valor_Acumulado) from R03 where R03.Dat' +
        'a_Movimento = :D1 and substring(R03.Totalizador_Parcial,3,1) = '#39 +
        'S'#39') as iss,'
      
        '            (select (R03.Valor_Acumulado) from R03 where R03.Dat' +
        'a_Movimento = :D2 and R03.Totalizador_Parcial = '#39'DT'#39') as DT,'
      
        '            (select (R03.Valor_Acumulado) from R03 where R03.Dat' +
        'a_Movimento = :D3 and R03.Totalizador_Parcial = '#39'DS'#39') as DS,'
      
        '            (select (R03.Valor_Acumulado) from R03 where R03.Dat' +
        'a_Movimento = :D4 and R03.Totalizador_Parcial = '#39'Can-T'#39') as Cant' +
        ','
      
        '            (select (R03.Valor_Acumulado) from R03 where R03.Dat' +
        'a_Movimento = :D5 and R03.Totalizador_Parcial = '#39'Can-S'#39') as Cans' +
        ','
      
        '            (select sum(convert(float, Replace(R03.Valor_Acumula' +
        'do, '#39','#39', '#39'.'#39'))) from R03 where R03.Data_Movimento  = :D6 and R03' +
        '.N_Fabricacao = :N1 and '
      
        '            (substring(R03.Totalizador_Parcial, 3,1) = '#39'T'#39' or su' +
        'bstring(R03.Totalizador_Parcial, 3,1) = '#39'S'#39' or '
      
        '            R03.Totalizador_Parcial = '#39'I1'#39' or R03.Totalizador_Pa' +
        'rcial = '#39'N1'#39' or R03.Totalizador_Parcial = '#39'F1'#39' or R03.Totalizado' +
        'r_Parcial = '#39'DT'#39
      
        '             or R03.Totalizador_Parcial = '#39'DS'#39' or R03.Totalizado' +
        'r_Parcial = '#39'Can-T'#39' or R03.Totalizador_Parcial = '#39'Can-S'#39')) as ve' +
        'nda_bruta'
      'from R03'
      
        'where R03.Data_Movimento = :D7 and R03.N_Fabricacao = :N2 and (R' +
        '03.Totalizador_Parcial = '#39'I1'#39' or R03.Totalizador_Parcial = '#39'N1'#39' ' +
        'or R03.Totalizador_Parcial = '#39'F1'#39')'
      ''
      'group by R03.Data_Movimento,'
      '            R03.Totalizador_Parcial,'
      '            R03.Valor_Acumulado,'
      '            R03.N_Fabricacao')
    Left = 216
    object ADOQuery3Data_Movimento: TDateTimeField
      FieldName = 'Data_Movimento'
    end
    object ADOQuery3Totalizador_Parcial: TStringField
      FieldName = 'Totalizador_Parcial'
      Size = 85
    end
    object ADOQuery3valor_venda: TStringField
      FieldName = 'valor_venda'
      Size = 15
    end
    object ADOQuery3iss: TStringField
      FieldName = 'iss'
      ReadOnly = True
      Size = 15
    end
    object ADOQuery3DT: TStringField
      FieldName = 'DT'
      ReadOnly = True
      Size = 15
    end
    object ADOQuery3DS: TStringField
      FieldName = 'DS'
      ReadOnly = True
      Size = 15
    end
    object ADOQuery3Cant: TStringField
      FieldName = 'Cant'
      ReadOnly = True
      Size = 15
    end
    object ADOQuery3Cans: TStringField
      FieldName = 'Cans'
      ReadOnly = True
      Size = 15
    end
    object ADOQuery3venda_bruta: TFloatField
      FieldName = 'venda_bruta'
      ReadOnly = True
    end
  end
end
