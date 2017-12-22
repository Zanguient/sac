object FrmEnvia_SMS: TFrmEnvia_SMS
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Enviar SMS'
  ClientHeight = 302
  ClientWidth = 574
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
  OnDeactivate = FormDeactivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 267
    Top = 7
    Width = 24
    Height = 13
    Caption = 'DDD'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 308
    Top = 7
    Width = 49
    Height = 13
    Caption = 'Telefone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl5: TLabel
    Left = 8
    Top = 232
    Width = 62
    Height = 13
    Caption = 'Mensagem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblSetor: TLabel
    Left = 8
    Top = 7
    Width = 39
    Height = 13
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn1: TButton
    Left = 287
    Top = 275
    Width = 75
    Height = 25
    Caption = 'Enviar'
    TabOrder = 4
    OnClick = btn1Click
  end
  object EdtDDD: TEdit
    Left = 267
    Top = 22
    Width = 42
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    MaxLength = 140
    TabOrder = 1
  end
  object EdtTelefone: TEdit
    Left = 308
    Top = 22
    Width = 81
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    MaxLength = 140
    TabOrder = 2
    OnExit = EdtTelefoneExit
  end
  object MMOMensagem: TMemo
    Left = 8
    Top = 251
    Width = 273
    Height = 49
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object EdtCliente: TEdit
    Left = 8
    Top = 22
    Width = 260
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clCream
    TabOrder = 0
    OnKeyDown = EdtClienteKeyDown
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 45
    Width = 558
    Height = 181
    Hint = 'Pressione Delete para remover o item selecionado'
    BorderStyle = bsNone
    DataSource = DataSource1
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DDD'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefone'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 368
    Top = 275
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 5
    OnClick = Button1Click
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 384
    Top = 240
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Clientes.xml'
    Params = <>
    Left = 416
    Top = 240
    object ClientDataSet1Nome: TStringField
      DisplayWidth = 47
      FieldName = 'Nome'
      Size = 50
    end
    object ClientDataSet1DDD: TStringField
      FieldName = 'DDD'
      Size = 5
    end
    object ClientDataSet1Telefone: TStringField
      FieldName = 'Telefone'
    end
  end
end
