object FrmMeios_Pagamento: TFrmMeios_Pagamento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Meios de Pagamento'
  ClientHeight = 132
  ClientWidth = 399
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
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 168
    Top = 47
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
  object Label2: TLabel
    Left = 248
    Top = 47
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
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 132
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 121
    DoubleBuffered = True
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
    ParentDoubleBuffered = False
    ParentFont = False
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = False
    TabOrder = 0
    object BBtnSalvar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Clique para Enviar o relat'#243'rio para a impressora fiscal'
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
    Left = 248
    Top = 61
    Width = 62
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
    Left = 168
    Top = 61
    Width = 64
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
    TabOrder = 2
    Text = '  /  /    '
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
    Left = 280
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
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'D2'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'N'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select  R05.Data_movimento Datamov,'
      '            R05.Totalizador_Parcial,'
      
        '            sum(convert(float, replace(R05.Quantidade, '#39','#39', '#39'.'#39')' +
        ') * convert(float, replace(R05.Valor_Unitario, '#39','#39', '#39'.'#39'))) as va' +
        'lor_venda,'
      
        '            (select  sum(convert(float, replace(R05.Quantidade, ' +
        #39','#39', '#39'.'#39')) * convert(float, replace(R05.Valor_Unitario, '#39','#39', '#39'.'#39 +
        '))) from R05'
      
        'where R05.Data_Movimento = :D1 and R05.Totalizador_Parcial like ' +
        #39'S%'#39') as iss'
      'from R05'
      
        'where R05.Data_Movimento = :D2 and R05.N_Fabricacao = :N and (R0' +
        '5.Totalizador_Parcial = '#39'N1'#39' or R05.Totalizador_Parcial = '#39'I1'#39' o' +
        'r R05.Totalizador_Parcial = '#39'F1'#39')'
      'group by R05.Data_Movimento,'
      '               R05.Totalizador_Parcial')
    Left = 248
    object ADOQuery3Datamov: TDateTimeField
      FieldName = 'Datamov'
    end
    object ADOQuery3Totalizador_Parcial: TStringField
      FieldName = 'Totalizador_Parcial'
      Size = 7
    end
    object ADOQuery3valor_venda: TFloatField
      FieldName = 'valor_venda'
      ReadOnly = True
    end
    object ADOQuery3iss: TFloatField
      FieldName = 'iss'
      ReadOnly = True
    end
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
      'select  R05.Data_movimento Datamov,'
      '            R02.Caixa, '
      '            R02.CRZ,'
      '            R02.COO,'
      
        '            sum(convert(float, replace(R05.Quantidade, '#39','#39', '#39'.'#39')' +
        ') * convert(float, replace(R05.Valor_Unitario, '#39','#39', '#39'.'#39'))) as va' +
        'lor_venda,'
      
        '            sum(convert(float, replace(R05.Desconto, '#39','#39', '#39'.'#39')))' +
        ' as Desconto'
      'from R05'
      'left join R02 on (R05.Data_Movimento = R02.Data_Movimento)'
      
        'where R05.Data_Movimento between :D1 and :D2 and R05.N_Fabricaca' +
        'o = :N'
      'group by R05.Data_movimento,'
      '               R02.Caixa,'
      '               R02.CRZ,'
      '               R02.COO'
      'order by R05.Data_Movimento')
    Left = 216
    object ADOQueryPDatamov: TDateTimeField
      FieldName = 'Datamov'
    end
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
    object ADOQueryPvalor_venda: TFloatField
      FieldName = 'valor_venda'
      ReadOnly = True
    end
    object ADOQueryPDesconto: TFloatField
      FieldName = 'Desconto'
      ReadOnly = True
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
      'select  R05.Data_Movimento,'
      '            R05.Totalizador_Parcial,'
      
        '            sum(convert(float, replace(R05.Quantidade, '#39','#39', '#39'.'#39')' +
        ') * convert(float, replace(R05.Valor_Unitario, '#39','#39', '#39'.'#39'))) as va' +
        'lor_venda'
      'from R05'
      
        'where R05.Data_Movimento = :D and R05.N_Fabricacao = :N and R05.' +
        'Totalizador_Parcial not like '#39'S%'#39' and'
      
        '(R05.Totalizador_Parcial <> '#39'N1'#39' and R05.Totalizador_Parcial <> ' +
        #39'I1'#39' and R05.Totalizador_Parcial <> '#39'F1'#39')'
      'group by R05.Data_Movimento,'
      '               R05.Totalizador_Parcial')
    Left = 184
    object ADOQuery2Totalizador_Parcial: TStringField
      FieldName = 'Totalizador_Parcial'
      Size = 7
    end
    object ADOQuery2Data_Movimento: TDateTimeField
      FieldName = 'Data_Movimento'
    end
    object ADOQuery2valor_venda: TFloatField
      FieldName = 'valor_venda'
      ReadOnly = True
    end
  end
end
