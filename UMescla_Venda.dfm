object FrmMescla_Venda: TFrmMescla_Venda
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informe o N'#250'mero da Pr'#233'-Venda'
  ClientHeight = 497
  ClientWidth = 425
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 0
    Width = 409
    Height = 449
    BorderStyle = bsNone
    DataSource = DataSource1
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'N_Pre_Venda'
        Title.Caption = 'N. Pr'#233'-Venda'
        Width = 139
        Visible = True
      end>
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 455
    Width = 425
    Height = 42
    Align = alBottom
    ButtonHeight = 38
    ButtonWidth = 81
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
    HideClippedButtons = True
    HotTrackColor = clMenu
    Images = DM.ImgImagens_PAF
    List = True
    ParentFont = False
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = False
    TabOrder = 1
    object BBtnOK: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Caption = '&OK'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = False
      OnClick = BBtnOKClick
    end
    object BBtnFechar: TToolButton
      Left = 81
      Top = 0
      Cursor = crHandPoint
      Caption = '&Fechar'
      ImageIndex = 1
      OnClick = BBtnFecharClick
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select Ped.Codigo, Ped.N_Pre_Venda, Ped.Status from Pedido Ped')
    Left = 224
    Top = 168
    object ADOQuery1N_Pre_Venda: TStringField
      FieldName = 'N_Pre_Venda'
      Size = 10
    end
    object ADOQuery1Status: TStringField
      FieldName = 'Status'
      Size = 10
    end
    object ADOQuery1Codigo: TIntegerField
      FieldName = 'Codigo'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 256
    Top = 168
  end
end
