object FrmConsulta_Cheque: TFrmConsulta_Cheque
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Cheques'
  ClientHeight = 536
  ClientWidth = 952
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object LblMarca: TLabel
    Left = 576
    Top = 35
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
  object Label7: TLabel
    Left = 644
    Top = 75
    Width = 20
    Height = 13
    Caption = 'Fim'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 576
    Top = 75
    Width = 31
    Height = 13
    Caption = 'Inicio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 114
    Top = 110
    Width = 837
    Height = 426
    BorderStyle = bsNone
    DataSource = ds_qry_consulta_padrao
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'N_Cheque'
        Title.Caption = 'Cheque'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Vencimento'
        Title.Caption = 'Data Vencimento'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Saida'
        Title.Caption = 'Data Sa'#237'da'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Title.Caption = 'Data Cadastro'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Emitente'
        Width = 210
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Favorecido'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Origem'
        Width = 186
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo_Banco'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Caption = 'Banco'
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Agencia'
        Title.Caption = 'Ag'#234'ncia'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Titular'
        Width = 228
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Observacoes'
        Title.Caption = 'Observa'#231#245'es'
        Visible = True
      end>
  end
  object RGConsulta_Por: TRadioGroup
    Left = 114
    Top = 0
    Width = 239
    Height = 107
    Caption = 'Consulta por:'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Emitente'
      'Titular'
      'Cheque'
      'Data Vencimento'
      'Data Sa'#237'da'
      'Emitente/Data Venc.'
      'Emitente/Data Sa'#237'da')
    TabOrder = 4
  end
  object EdtConsulta: TEdit
    Left = 576
    Top = 52
    Width = 269
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    OnKeyDown = EdtConsultaKeyDown
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 102
    Height = 536
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 98
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
    Images = DM.ImgImagens_Consulta
    List = True
    ParentFont = False
    ShowCaptions = True
    TabOrder = 5
    object BBtnFiltrar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Clique para pesquisar'
      Caption = '&Pesquisar'
      ImageIndex = 1
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnFiltrarClick
    end
    object BBtnLimpar: TToolButton
      Left = 0
      Top = 38
      Cursor = crHandPoint
      Hint = 'Clique para limpar a pesquisa realizada e iniciar outra'
      Caption = 'Li&mpar'
      Enabled = False
      ImageIndex = 2
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnLimparClick
    end
    object BBtnImprimir: TToolButton
      Left = 0
      Top = 76
      Cursor = crHandPoint
      Hint = 'Clique para imprimir a pesquisa realizada'
      Caption = 'Imp&rimir'
      Enabled = False
      ImageIndex = 3
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnImprimirClick
    end
    object BBtnFechar: TToolButton
      Left = 0
      Top = 114
      Cursor = crHandPoint
      Hint = 'Clique para fechar a janela'
      Caption = '&Fechar'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object RGTipo_Cheque: TRadioGroup
    Left = 359
    Top = 0
    Width = 122
    Height = 107
    Caption = 'Tipo de Cheque'
    ItemIndex = 0
    Items.Strings = (
      'Emitido'
      'Recebido')
    TabOrder = 6
  end
  object MEdtData_Final: TMaskEdit
    Left = 644
    Top = 90
    Width = 63
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 2
    Text = '  /  /    '
  end
  object MEdtData_Inicial: TMaskEdit
    Left = 576
    Top = 90
    Width = 65
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 1
    Text = '  /  /    '
  end
  object RGStatus: TRadioGroup
    Left = 487
    Top = 0
    Width = 84
    Height = 107
    Caption = 'Status'
    ItemIndex = 0
    Items.Strings = (
      'Pendente'
      'Baixado')
    TabOrder = 7
  end
  object qryconsulta_cheque: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select Che.*, B.Nome from Cheque Che'
      'inner join Banco B on (Che.Codigo_Banco = B.Codigo)')
    Left = 470
    Top = 272
    object qryconsulta_chequeCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qryconsulta_chequeTipo: TStringField
      FieldName = 'Tipo'
      Size = 8
    end
    object qryconsulta_chequeEmitente: TStringField
      FieldName = 'Emitente'
      Size = 50
    end
    object qryconsulta_chequeFavorecido: TStringField
      FieldName = 'Favorecido'
      Size = 50
    end
    object qryconsulta_chequeOrigem: TStringField
      FieldName = 'Origem'
      Size = 50
    end
    object qryconsulta_chequeCodigo_Banco: TIntegerField
      FieldName = 'Codigo_Banco'
    end
    object qryconsulta_chequeAgencia: TStringField
      FieldName = 'Agencia'
    end
    object qryconsulta_chequeTitular: TStringField
      FieldName = 'Titular'
      Size = 50
    end
    object qryconsulta_chequeN_Cheque: TStringField
      FieldName = 'N_Cheque'
    end
    object qryconsulta_chequeValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#0.0,0'
    end
    object qryconsulta_chequeData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qryconsulta_chequeData_Vencimento: TDateTimeField
      FieldName = 'Data_Vencimento'
      OnGetText = qryconsulta_chequeData_VencimentoGetText
    end
    object qryconsulta_chequeData_Saida: TDateTimeField
      FieldName = 'Data_Saida'
      OnGetText = qryconsulta_chequeData_SaidaGetText
    end
    object qryconsulta_chequeObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 200
    end
    object qryconsulta_chequeStatus: TStringField
      FieldName = 'Status'
    end
    object qryconsulta_chequeNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qryconsulta_cheque
    Left = 502
    Top = 272
  end
end
