object FrmChama_Regra_PIS: TFrmChama_Regra_PIS
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Regras de PIS'
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
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 202
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Aliquota'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo_Recolhimento'
        Title.Caption = 'Tipo Rec.'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Base_Reduzida'
        Title.Caption = 'Base Reduzida'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Percentual_BC_Reduzida'
        Title.Caption = '% BC Reduzida'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Base_Acrescida'
        Title.Caption = 'Base Acrescida'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Percentual_BC_Acrescida'
        Title.Caption = '% BC Acrescida'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Situacao_Tributaria'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Situacao'
        Title.Caption = 'Sit. Tribut.'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Title.Caption = 'Data Cadastro'
        Width = 88
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
      'Descri'#231#227'o'
      'Aliquota')
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
      'Descri'#231#227'o'
      'Aliquota')
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
  object qrychama_regra: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select RPIS.*, CST.Descricao as Situacao, CST.Codigo_Situacao fr' +
        'om Regra_PIS RPIS'
      
        'inner join Cadastro_Situacao_Tributaria CST on (RPIS.Codigo_Situ' +
        'acao_Tributaria = CST.Codigo)')
    Left = 464
    Top = 272
    object qrychama_regraCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrychama_regraData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_regraDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qrychama_regraAliquota: TStringField
      FieldName = 'Aliquota'
      Size = 5
    end
    object qrychama_regraTipo_Recolhimento: TStringField
      FieldName = 'Tipo_Recolhimento'
      Size = 30
    end
    object qrychama_regraBase_Reduzida: TStringField
      FieldName = 'Base_Reduzida'
      Size = 3
    end
    object qrychama_regraPercentual_BC_Reduzida: TStringField
      FieldName = 'Percentual_BC_Reduzida'
      Size = 5
    end
    object qrychama_regraBase_Acrescida: TStringField
      FieldName = 'Base_Acrescida'
      Size = 3
    end
    object qrychama_regraPercentual_BC_Acrescida: TStringField
      FieldName = 'Percentual_BC_Acrescida'
      Size = 5
    end
    object qrychama_regraCodigo_Situacao_Tributaria: TIntegerField
      FieldName = 'Codigo_Situacao_Tributaria'
    end
    object qrychama_regraCodigo_Situacao: TStringField
      FieldName = 'Codigo_Situacao'
      Size = 5
    end
    object qrychama_regraSituacao: TStringField
      FieldName = 'Situacao'
      Size = 50
    end
    object qrychama_regraTipo_Calculo: TStringField
      FieldName = 'Tipo_Calculo'
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_regra
    Left = 496
    Top = 272
  end
end
