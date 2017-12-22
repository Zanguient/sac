object FrmChama_Cheque: TFrmChama_Cheque
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Cheque'
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
    Left = 253
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
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Title.Caption = 'Cadastro'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Vencimento'
        Title.Caption = 'Vencimento'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Saida'
        Title.Caption = 'Sa'#237'da'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'N_Cheque'
        Title.Caption = 'N'#186' Cheque'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Caption = 'Banco'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Emitente'
        Width = 164
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Origem'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Favorecido'
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Banco'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Agencia'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Titular'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Observacoes'
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
      'N Cheque'
      'Emitente'
      'Favorecido')
    TabOrder = 2
  end
  object EdtConsulta: TEdit
    Left = 253
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
  object RGTipo_Cheque: TRadioGroup
    Left = 127
    Top = 0
    Width = 121
    Height = 73
    Caption = 'Tipo do Cheque'
    ItemIndex = 0
    Items.Strings = (
      'Pendente'
      'Baixado')
    TabOrder = 3
  end
  object qrychama_cheque: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select Che.*, B.Nome from Cheque Che'
      'inner join Banco B on (Che.Codigo_Banco = B.Codigo)')
    Left = 464
    Top = 272
    object qrychama_chequeCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrychama_chequeEmitente: TStringField
      FieldName = 'Emitente'
      Size = 50
    end
    object qrychama_chequeFavorecido: TStringField
      FieldName = 'Favorecido'
      Size = 50
    end
    object qrychama_chequeOrigem: TStringField
      FieldName = 'Origem'
      Size = 50
    end
    object qrychama_chequeCodigo_Banco: TIntegerField
      FieldName = 'Codigo_Banco'
    end
    object qrychama_chequeAgencia: TStringField
      FieldName = 'Agencia'
    end
    object qrychama_chequeTitular: TStringField
      FieldName = 'Titular'
      Size = 50
    end
    object qrychama_chequeN_Cheque: TStringField
      FieldName = 'N_Cheque'
    end
    object qrychama_chequeValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#0.0,0'
    end
    object qrychama_chequeData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_chequeData_Vencimento: TDateTimeField
      FieldName = 'Data_Vencimento'
    end
    object qrychama_chequeData_Saida: TDateTimeField
      FieldName = 'Data_Saida'
      OnGetText = qrychama_chequeData_SaidaGetText
    end
    object qrychama_chequeObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 200
    end
    object qrychama_chequeStatus: TStringField
      FieldName = 'Status'
    end
    object qrychama_chequeNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object qrychama_chequeTipo: TStringField
      FieldName = 'Tipo'
      Size = 8
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_cheque
    Left = 496
    Top = 272
  end
end
