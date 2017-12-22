object FrmChama_NCM: TFrmChama_NCM
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta NCM'
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
    Left = 252
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
        FieldName = 'Codigo_NCM'
        Title.Caption = 'Codigo'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 289
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Aliquota_Nacional'
        Title.Caption = 'Nacional'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Aliquota_Importada'
        Title.Caption = 'Importada'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Aliquota_Estadual'
        Title.Caption = 'Estadual'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Aliquota_Municipal'
        Title.Caption = 'Municipal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vigencia_Inicio'
        Title.Caption = 'Vig'#234'ncia Inicio'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vigencia_Fim'
        Title.Caption = 'Vig'#234'ncia Fim'
        Width = 82
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
      'C'#243'digo'
      'Descri'#231#227'o')
    TabOrder = 2
  end
  object EdtConsulta: TEdit
    Left = 252
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
  object RGOrdena_Por: TRadioGroup
    Left = 127
    Top = 0
    Width = 121
    Height = 73
    Caption = 'Ordenar Pesquisa:'
    ItemIndex = 1
    Items.Strings = (
      'C'#243'digo'
      'Descri'#231#227'o')
    TabOrder = 3
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
    TabOrder = 4
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
  object qrychama_ncm: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT Codigo'
      '      ,Codigo_NCM'
      '      ,Descricao'
      '      ,Data_Cadastro'
      '      ,Ex'
      '      ,Aliquota_Nacional'
      '      ,Aliquota_Importada'
      '      ,Versao'
      '      ,Tabela'
      '      ,Aliquota_Estadual'
      '      ,Aliquota_Municipal'
      '      ,CONVERT(varchar,Vigencia_Inicio,103) as Vigencia_Inicio'
      '      ,CONVERT(varchar,Vigencia_Fim,103) as Vigencia_Fim'
      '     ,IVA'
      '  FROM NCM'
      '')
    Left = 464
    Top = 272
    object qrychama_ncmCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrychama_ncmCodigo_NCM: TStringField
      FieldName = 'Codigo_NCM'
      Size = 10
    end
    object qrychama_ncmDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object qrychama_ncmData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_ncmEx: TStringField
      FieldName = 'Ex'
      Size = 10
    end
    object qrychama_ncmAliquota_Nacional: TFloatField
      FieldName = 'Aliquota_Nacional'
    end
    object qrychama_ncmAliquota_Importada: TFloatField
      FieldName = 'Aliquota_Importada'
    end
    object qrychama_ncmVersao: TStringField
      FieldName = 'Versao'
      Size = 30
    end
    object qrychama_ncmTabela: TIntegerField
      FieldName = 'Tabela'
    end
    object qrychama_ncmAliquota_Estadual: TFloatField
      FieldName = 'Aliquota_Estadual'
    end
    object qrychama_ncmAliquota_Municipal: TFloatField
      FieldName = 'Aliquota_Municipal'
    end
    object qrychama_ncmVigencia_Inicio: TStringField
      FieldName = 'Vigencia_Inicio'
      ReadOnly = True
      Size = 30
    end
    object qrychama_ncmVigencia_Fim: TStringField
      FieldName = 'Vigencia_Fim'
      ReadOnly = True
      Size = 30
    end
    object qrychama_ncmIVA: TFloatField
      FieldName = 'IVA'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_ncm
    Left = 496
    Top = 272
  end
end
