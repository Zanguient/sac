object FrmChama_Pedido: TFrmChama_Pedido
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Itens de DAV/Pr'#233'-Venda'
  ClientHeight = 553
  ClientWidth = 942
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object LblMarca: TLabel
    Left = 2
    Top = 15
    Width = 88
    Height = 13
    Caption = 'DAV/Pr'#233'-Venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 2
    Top = 48
    Width = 939
    Height = 505
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
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
        FieldName = 'Codigo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'N_Pedido'
        Title.Caption = 'Pedido'
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
        Title.Caption = 'Codigo Venda'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sigla'
        Title.Caption = 'Un.'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtde'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor_Unitario'
        Title.Caption = 'Valor Unit'#225'rio'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Desconto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo_Desconto'
        Title.Caption = 'Tipo'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sub_Total'
        Title.Caption = 'Sub Total'
        Width = 92
        Visible = True
      end>
  end
  object EdtConsulta: TEdit
    Left = 2
    Top = 31
    Width = 289
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    TabOrder = 0
    OnKeyDown = EdtConsultaKeyDown
  end
  object ToolBar1: TToolBar
    Left = 746
    Top = 6
    Width = 186
    Height = 42
    Align = alCustom
    ButtonHeight = 38
    ButtonWidth = 93
    Caption = 'ToolBar1'
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
    HotTrackColor = clMenu
    Images = DM.ImgImagens_Chama
    List = True
    ParentFont = False
    ShowCaptions = True
    TabOrder = 2
    object BBtnFiltrar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      AutoSize = True
      Caption = '&Localizar'
      ImageIndex = 1
      OnClick = BBtnFiltrarClick
    end
    object BBtnFechar: TToolButton
      Left = 97
      Top = 0
      Cursor = crHandPoint
      AutoSize = True
      Caption = '&Fechar'
      ImageIndex = 0
      OnClick = BBtnFecharClick
    end
  end
  object qrychama_pedido: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select IP.*, P.Codigo_Venda, P.Descricao, UM.Sigla, P.ICMS from ' +
        'Itens_Pedido IP'
      'inner join Produto P on (IP.Codigo_Produto = P.Codigo)'
      
        'inner join Unidade_Medida UM on (P.Codigo_Unidade_Medida = UM.Co' +
        'digo)')
    Left = 464
    Top = 272
    object qrychama_pedidoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_pedidoN_Pedido: TStringField
      FieldName = 'N_Pedido'
      Size = 13
    end
    object qrychama_pedidoCodigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object qrychama_pedidoQtde: TFloatField
      FieldName = 'Qtde'
      DisplayFormat = '#0.0,0'
    end
    object qrychama_pedidoValor_Unitario: TFloatField
      FieldName = 'Valor_Unitario'
      DisplayFormat = '#0.0,0'
    end
    object qrychama_pedidoDesconto: TFloatField
      FieldName = 'Desconto'
      DisplayFormat = '#0.0,0'
    end
    object qrychama_pedidoTipo_Desconto: TStringField
      FieldName = 'Tipo_Desconto'
      Size = 1
    end
    object qrychama_pedidoSub_Total: TFloatField
      FieldName = 'Sub_Total'
      DisplayFormat = '#0.0,0'
    end
    object qrychama_pedidoCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qrychama_pedidoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qrychama_pedidoSigla: TStringField
      FieldName = 'Sigla'
      Size = 5
    end
    object qrychama_pedidoICMS: TIntegerField
      FieldName = 'ICMS'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_pedido
    Left = 496
    Top = 272
  end
end
