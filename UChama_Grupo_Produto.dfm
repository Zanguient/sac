object FrmChama_Grupo_Produto: TFrmChama_Grupo_Produto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Grupo de Produtos'
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 251
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sub_Grupo'
        Title.Caption = 'Sub Grupo'
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Percentual_Vista'
        Title.Caption = '% Vista'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Percentual_Prazo'
        Title.Caption = '% Prazo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Percentual_Desconto_Vista'
        Title.Caption = '% D. Vista'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Percentual_Desconto_Prazo'
        Title.Caption = '% D. Prazo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ICMS'
        Width = 187
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IPI'
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
  object qrychama_grupo: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select GP.*, GP1.Descricao as Sub, TI.Descricao as ICMS, TCO.Des' +
        'cricao as COFINS,'
      
        'TIPI.Descricao as IPI, TPIS.Descricao as PIS from Grupo_Produto ' +
        'GP'
      
        'left join Tratamento_ICMS TI on (GP.Codigo_Grupo_ICMS = TI.Codig' +
        'o)'
      
        'left join Tratamento_COFINS TCO on (GP.Codigo_Grupo_COFINS= TCO.' +
        'Codigo)'
      
        'left join Tratamento_IPI TIPI on (GP.Codigo_Grupo_IPI = TIPI.Cod' +
        'igo)'
      
        'left join Tratamento_PIS TPIS on (GP.Codigo_Grupo_PIS = TPIS.Cod' +
        'igo)'
      'left join Grupo_Produto GP1 on(GP.Codigo_Sub_Grupo = GP1.Codigo)')
    Left = 464
    Top = 272
    object qrychama_grupoCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrychama_grupoCodigo_Grupo_ICMS: TIntegerField
      FieldName = 'Codigo_Grupo_ICMS'
    end
    object qrychama_grupoCodigo_Grupo_IPI: TIntegerField
      FieldName = 'Codigo_Grupo_IPI'
    end
    object qrychama_grupoCodigo_Grupo_PIS: TIntegerField
      FieldName = 'Codigo_Grupo_PIS'
    end
    object qrychama_grupoCodigo_Grupo_COFINS: TIntegerField
      FieldName = 'Codigo_Grupo_COFINS'
    end
    object qrychama_grupoData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_grupoICMS: TStringField
      FieldName = 'ICMS'
      Size = 50
    end
    object qrychama_grupoCOFINS: TStringField
      FieldName = 'COFINS'
      Size = 50
    end
    object qrychama_grupoIPI: TStringField
      FieldName = 'IPI'
      Size = 50
    end
    object qrychama_grupoPIS: TStringField
      FieldName = 'PIS'
      Size = 50
    end
    object qrychama_grupoPercentual_Vista: TFloatField
      FieldName = 'Percentual_Vista'
      DisplayFormat = '#0.0,0'
    end
    object qrychama_grupoPercentual_Prazo: TFloatField
      FieldName = 'Percentual_Prazo'
      DisplayFormat = '#0.0,0'
    end
    object qrychama_grupoPercentual_Desconto_Vista: TFloatField
      FieldName = 'Percentual_Desconto_Vista'
      DisplayFormat = '#0.0,0'
    end
    object qrychama_grupoPercentual_Desconto_Prazo: TFloatField
      FieldName = 'Percentual_Desconto_Prazo'
      DisplayFormat = '#0.0,0'
    end
    object qrychama_grupoCodigo_Sub_Grupo: TIntegerField
      FieldName = 'Codigo_Sub_Grupo'
    end
    object qrychama_grupoSub_Grupo: TStringField
      FieldName = 'Sub_Grupo'
      Size = 100
    end
    object qrychama_grupoSub: TStringField
      FieldName = 'Sub'
      Size = 30
    end
    object qrychama_grupoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 200
    end
    object qrychama_grupoCodigo_Pai: TIntegerField
      FieldName = 'Codigo_Pai'
    end
    object qrychama_grupoPercentual_Comissao_Vista: TFloatField
      FieldName = 'Percentual_Comissao_Vista'
    end
    object qrychama_grupoPercentual_Comissao_Prazo: TFloatField
      FieldName = 'Percentual_Comissao_Prazo'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_grupo
    Left = 496
    Top = 272
  end
end
