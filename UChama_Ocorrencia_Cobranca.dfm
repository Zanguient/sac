object FrmChama_Ocorrencia_Cobranca: TFrmChama_Ocorrencia_Cobranca
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Ocorr'#234'ncias de Cobran'#231'a'
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
    Top = 41
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
        FieldName = 'Data_Cadastro'
        Title.Caption = 'Cadastro'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cobranca'
        Title.Caption = 'Cobran'#231'a'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Responsavel_Atendimento'
        Title.Caption = 'Respons'#225'vel pelo Atendimento'
        Width = 231
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Origem_Atendimento'
        Title.Caption = 'Origem'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Lancamento_Financeiro'
        Title.Caption = 'C'#243'digo Lan. Fin.'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'N_Documento'
        Title.Caption = 'N'#186' Documento'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observacoes'
        Title.Caption = 'Observa'#231#245'es'
        Width = 231
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
      'N'#186' Documento'
      'Data Ocorr'#234'ncia'
      'Observa'#231#227'o')
    TabOrder = 2
  end
  object EdtConsulta: TEdit
    Left = 127
    Top = 57
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
  object qrychama_ocorrencia: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select LFOC.* from Lancamento_Financeiro_Ocorrencia_Cobranca LFO' +
        'C')
    Left = 464
    Top = 272
    object qrychama_ocorrenciaCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrychama_ocorrenciaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_ocorrenciaData_Cobranca: TDateTimeField
      FieldName = 'Data_Cobranca'
    end
    object qrychama_ocorrenciaResponsavel_Atendimento: TStringField
      FieldName = 'Responsavel_Atendimento'
      Size = 50
    end
    object qrychama_ocorrenciaOrigem_Atendimento: TIntegerField
      FieldName = 'Origem_Atendimento'
    end
    object qrychama_ocorrenciaCodigo_Lancamento_Financeiro: TIntegerField
      FieldName = 'Codigo_Lancamento_Financeiro'
    end
    object qrychama_ocorrenciaN_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object qrychama_ocorrenciaObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 800
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_ocorrencia
    Left = 464
    Top = 320
  end
end
