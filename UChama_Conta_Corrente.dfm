object FrmChama_Conta_Corrente: TFrmChama_Conta_Corrente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Conta Corrente'
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
        FieldName = 'Data_Abertura'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Data_Cadastro'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Conta'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Caption = 'Banco'
        Width = 193
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Agencia'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Codigo_Banco'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Nome_Agencia'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Nome_Correntista'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Saldo_Inicial'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Limite'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Saldo_Atual'
        Title.Caption = 'Saldo Atual'
        Width = 116
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
      'Conta')
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
      'Conta')
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
  object qrychama_conta: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select CC.*, B.Nome from Conta_Corrente CC'
      'inner join Banco B on (CC.Codigo_Banco = B.Codigo)')
    Left = 464
    Top = 272
    object qrychama_contaCodigo: TAutoIncField
      FieldName = 'Codigo'
      ReadOnly = True
    end
    object qrychama_contaData_Abertura: TDateTimeField
      FieldName = 'Data_Abertura'
    end
    object qrychama_contaData_Cadastro: TDateTimeField
      FieldName = 'Data_Cadastro'
    end
    object qrychama_contaConta: TStringField
      FieldName = 'Conta'
    end
    object qrychama_contaAgencia: TStringField
      FieldName = 'Agencia'
      Size = 30
    end
    object qrychama_contaCodigo_Banco: TIntegerField
      FieldName = 'Codigo_Banco'
    end
    object qrychama_contaNome_Agencia: TStringField
      FieldName = 'Nome_Agencia'
      Size = 30
    end
    object qrychama_contaNome_Correntista: TStringField
      FieldName = 'Nome_Correntista'
      Size = 50
    end
    object qrychama_contaSaldo_Inicial: TFloatField
      FieldName = 'Saldo_Inicial'
    end
    object qrychama_contaLimite: TFloatField
      FieldName = 'Limite'
    end
    object qrychama_contaSaldo_Atual: TFloatField
      FieldName = 'Saldo_Atual'
      currency = True
    end
    object qrychama_contaNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
  end
  object ds_qry_consulta_padrao: TDataSource
    DataSet = qrychama_conta
    Left = 496
    Top = 272
  end
end
