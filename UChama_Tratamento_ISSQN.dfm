object FrmChama_Tratamento_ISSQN: TFrmChama_Tratamento_ISSQN
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Tratamentos de ISSQN'
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
    TabOrder = 0
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
        FieldName = 'Descricao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Origem'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Destino'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Entrada_Regra_EN'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Entrada_Regra_EPP'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Entrada_Regra_ME'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Saida_Regra_EN'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Saida_Regra_EPP'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Saida_Regra_ME'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Regra_Nao_Contribuinte'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao_1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao_2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao_3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao_4'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao_5'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao_6'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Descricao_7'
        Visible = False
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
    TabOrder = 1
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
    TabOrder = 2
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
      
        'select TISS.*, RISS1.Descricao, RISS2.Descricao, RISS3.Descricao' +
        ', RISS4.Descricao, RISS5.Descricao, RISS6.Descricao, RISS7.Descr' +
        'icao from Tratamento_ISSQN TISS'
      
        'inner join Regra_ISSQN RISS1 on (TISS.Entrada_Regra_EN = RISS1.C' +
        'odigo)'
      
        'inner join Regra_ISSQN RISS2 on (TISS.Entrada_Regra_EPP = RISS2.' +
        'Codigo)'
      
        'inner join Regra_ISSQN RISS3 on (TISS.Entrada_Regra_ME = RISS3.C' +
        'odigo)'
      
        'inner join Regra_ISSQN RISS4 on (TISS.Saida_Regra_EN = RISS4.Cod' +
        'igo)'
      
        'inner join Regra_ISSQN RISS5 on (TISS.Saida_Regra_EPP = RISS5.Co' +
        'digo)'
      
        'inner join Regra_ISSQN RISS6 on (TISS.Saida_Regra_ME = RISS6.Cod' +
        'igo)'
      
        'inner join Regra_ISSQN RISS7 on (TISS.Regra_Nao_Contribuinte = R' +
        'ISS7.Codigo)')
    Left = 464
    Top = 272
    object qrychama_tratamentoCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrychama_tratamentoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qrychama_tratamentoOrigem: TStringField
      FieldName = 'Origem'
      Size = 2
    end
    object qrychama_tratamentoDestino: TStringField
      FieldName = 'Destino'
      Size = 2
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
    object qrychama_tratamentoRegra_Nao_Contribuinte: TIntegerField
      FieldName = 'Regra_Nao_Contribuinte'
    end
    object qrychama_tratamentoData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
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
    object qrychama_tratamentoDescricao_7: TStringField
      FieldName = 'Descricao_7'
      Size = 50
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_tratamento
    Left = 496
    Top = 272
  end
end
