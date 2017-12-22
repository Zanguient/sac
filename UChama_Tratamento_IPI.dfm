object FrmChama_Tratamento_IPI: TFrmChama_Tratamento_IPI
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Tratamentos de IPI'
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
        Visible = True
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 0
    Top = 0
    Width = 121
    Height = 73
    Caption = 'Consulta por:'
    ItemIndex = 0
    Items.Strings = (
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
    ItemIndex = 0
    Items.Strings = (
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
  object qrychama_tratamento: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select TIPI.*, ITIPI.*, RI1.Descricao, RI2.Descricao, RI3.Descri' +
        'cao, RI4.Descricao, RI5.Descricao, RI6.Descricao from Tratamento' +
        '_IPI TIPI'
      
        'inner join Itens_Tratamento_IPI ITIPI on (TIPI.Codigo = ITIPI.Co' +
        'digo)'
      
        'inner join Regra_IPI RI1 on (ITIPI.Entrada_Regra_EN = RI1.Codigo' +
        ')'
      
        'inner join Regra_IPI RI2 on (ITIPI.Entrada_Regra_EPP = RI2.Codig' +
        'o)'
      
        'inner join Regra_IPI RI3 on (ITIPI.Entrada_Regra_ME = RI3.Codigo' +
        ')'
      'inner join Regra_IPI RI4 on (ITIPI.Saida_Regra_EN = RI4.Codigo)'
      'inner join Regra_IPI RI5 on (ITIPI.Saida_Regra_EPP = RI5.Codigo)'
      'inner join Regra_IPI RI6 on (ITIPI.Saida_Regra_ME = RI6.Codigo)')
    Left = 464
    Top = 272
    object qrychama_tratamentoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qrychama_tratamentoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qrychama_tratamentoData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_tratamentoCodigo_1: TIntegerField
      FieldName = 'Codigo_1'
    end
    object qrychama_tratamentoEntrada_Regra_EN: TIntegerField
      FieldName = 'Entrada_Regra_EN'
    end
    object qrychama_tratamentoEntrada_Regra_EPP: TIntegerField
      FieldName = 'Entrada_Regra_EPP'
    end
    object qrychama_tratamentoEntrada_Regra_ME: TIntegerField
      FieldName = 'Entrada_Regra_ME'
    end
    object qrychama_tratamentoSaida_Regra_EN: TIntegerField
      FieldName = 'Saida_Regra_EN'
    end
    object qrychama_tratamentoSaida_Regra_EPP: TIntegerField
      FieldName = 'Saida_Regra_EPP'
    end
    object qrychama_tratamentoSaida_Regra_ME: TIntegerField
      FieldName = 'Saida_Regra_ME'
    end
    object qrychama_tratamentoDescricao_1: TStringField
      FieldName = 'Descricao_1'
      Size = 50
    end
    object qrychama_tratamentoDescricao_2: TStringField
      FieldName = 'Descricao_2'
      Size = 50
    end
    object qrychama_tratamentoDescricao_3: TStringField
      FieldName = 'Descricao_3'
      Size = 50
    end
    object qrychama_tratamentoDescricao_4: TStringField
      FieldName = 'Descricao_4'
      Size = 50
    end
    object qrychama_tratamentoDescricao_5: TStringField
      FieldName = 'Descricao_5'
      Size = 50
    end
    object qrychama_tratamentoDescricao_6: TStringField
      FieldName = 'Descricao_6'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_tratamento
    Left = 496
    Top = 272
  end
end
