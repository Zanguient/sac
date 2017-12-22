object FrmChama_DAV_Converter: TFrmChama_DAV_Converter
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Vendas'
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LblMarca: TLabel
    Left = 127
    Top = 39
    Width = 61
    Height = 13
    Caption = 'Par'#226'metro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblStatus: TLabel
    Left = 421
    Top = 36
    Width = 37
    Height = 13
    Caption = 'Status'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 80
    Width = 941
    Height = 473
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'N_Pedido'
        Title.Caption = 'N'#186' Pedido'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome_Nome_Fantasia'
        Title.Caption = 'Cliente'
        Width = 285
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Venda'
        Title.Caption = 'Data'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total_Pedido'
        Title.Caption = 'Total Pedido'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Placa'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Veiculo'
        Title.Caption = 'Ve'#237'culo'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'StatusOS'
        Title.Caption = 'Status OS'
        Width = 96
        Visible = True
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 0
    Top = 0
    Width = 121
    Height = 73
    Caption = 'Consulta por:'
    ItemIndex = 1
    Items.Strings = (
      'N'#186' DAV'
      'Cliente'
      'Placa'
      'Status OS')
    TabOrder = 2
  end
  object EdtConsulta: TEdit
    Left = 127
    Top = 55
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
    Left = 751
    Top = 31
    Width = 190
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
    TabOrder = 3
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
  object CmbStatus: TDBLookupComboBox
    Left = 422
    Top = 52
    Width = 134
    Height = 21
    KeyField = 'Codigo'
    ListField = 'Descricao'
    ListSource = DM.DataSource9
    TabOrder = 4
  end
  object qrychama_dav: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select P.N_Pedido, P.Data_Venda, C.Nome_Nome_Fantasia, P.Total_P' +
        'edido, '
      'V.Placa, V.Veiculo, CS.Descricao as StatusOS from Pedido P'
      'left join Cliente C on (P.Codigo_Cliente = C.Codigo)'
      'left join Veiculo V on (V.Codigo_Cliente = C.Codigo)'
      'left join Cadastro_Status CS on (P.Status_OS = CS.Codigo)')
    Left = 464
    Top = 272
    object qrychama_davN_Pedido: TStringField
      FieldName = 'N_Pedido'
      Size = 13
    end
    object qrychama_davData_Venda: TDateTimeField
      FieldName = 'Data_Venda'
    end
    object qrychama_davNome_Nome_Fantasia: TStringField
      FieldName = 'Nome_Nome_Fantasia'
      Size = 50
    end
    object qrychama_davTotal_Pedido: TFloatField
      FieldName = 'Total_Pedido'
      DisplayFormat = '#0.0,0'
    end
    object qrychama_davPlaca: TStringField
      FieldName = 'Placa'
      Size = 10
    end
    object qrychama_davVeiculo: TStringField
      FieldName = 'Veiculo'
      Size = 50
    end
    object qrychama_davStatusOS: TStringField
      FieldName = 'StatusOS'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_dav
    Left = 496
    Top = 272
  end
end
