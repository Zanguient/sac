object FrmChama_Patrimonio: TFrmChama_Patrimonio
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Patrim'#244'nios'
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
  PixelsPerInch = 96
  TextHeight = 13
  object LblMarca: TLabel
    Left = 127
    Top = 40
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
        FieldName = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'N_Bem'
        Title.Caption = 'N'#186' Bem'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'N_Identificacao'
        Title.Caption = 'N'#186' Identifica'#231#227'o'
        Width = 173
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 278
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Marca'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Modelo'
        Width = 201
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Tipo_Bem'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Local_Bem'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Aquisicao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Baixa'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Valor_Bem'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Status'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Observacao'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Marca'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Tipo_Bem'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Local'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Status'
        Visible = False
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
      'C'#243'digo'
      'N'#186' Bem'
      'N'#186' Identifica'#231#227'o'
      'Descri'#231#227'o')
    TabOrder = 2
  end
  object EdtConsulta: TEdit
    Left = 127
    Top = 56
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
  object qrychama_bem: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select P.*, M.Descricao as Marca, TBP.Descricao as Tipo_Bem, LP.' +
        'Local, CS.Descricao as Status'
      'from Patrimonio P'
      'left join Marca M on (P.Codigo_Marca = M.Codigo)'
      
        'left join Tipo_Bem_Patrimonial TBP on (P.Codigo_Tipo_Bem = TBP.C' +
        'odigo)'
      
        'left join Localidade_Produto LP on (P.Codigo_Local_Bem = LP.Codi' +
        'go)'
      'left join Cadastro_Status CS on (P.Codigo_Status = CS.Codigo)')
    Left = 464
    Top = 272
    object qrychama_bemCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrychama_bemN_Bem: TStringField
      FieldName = 'N_Bem'
      Size = 50
    end
    object qrychama_bemN_Identificacao: TStringField
      FieldName = 'N_Identificacao'
      Size = 50
    end
    object qrychama_bemDescricao: TStringField
      FieldName = 'Descricao'
      Size = 300
    end
    object qrychama_bemCodigo_Marca: TIntegerField
      FieldName = 'Codigo_Marca'
    end
    object qrychama_bemModelo: TStringField
      FieldName = 'Modelo'
      Size = 100
    end
    object qrychama_bemCodigo_Tipo_Bem: TIntegerField
      FieldName = 'Codigo_Tipo_Bem'
    end
    object qrychama_bemCodigo_Local_Bem: TIntegerField
      FieldName = 'Codigo_Local_Bem'
    end
    object qrychama_bemData_Aquisicao: TDateTimeField
      FieldName = 'Data_Aquisicao'
    end
    object qrychama_bemData_Baixa: TDateTimeField
      FieldName = 'Data_Baixa'
    end
    object qrychama_bemValor_Bem: TFloatField
      FieldName = 'Valor_Bem'
    end
    object qrychama_bemCodigo_Status: TIntegerField
      FieldName = 'Codigo_Status'
    end
    object qrychama_bemObservacao: TStringField
      FieldName = 'Observacao'
      Size = 500
    end
    object qrychama_bemData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_bemMarca: TStringField
      FieldName = 'Marca'
      Size = 30
    end
    object qrychama_bemTipo_Bem: TStringField
      FieldName = 'Tipo_Bem'
      Size = 50
    end
    object qrychama_bemLocal: TStringField
      FieldName = 'Local'
    end
    object qrychama_bemStatus: TStringField
      FieldName = 'Status'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_bem
    Left = 496
    Top = 272
  end
end
