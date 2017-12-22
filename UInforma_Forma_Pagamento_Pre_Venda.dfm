object FrmInforma_Forma_Pagamento_Pre_Venda: TFrmInforma_Forma_Pagamento_Pre_Venda
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Informe a Condi'#231#227'o de Pagamento'
  ClientHeight = 304
  ClientWidth = 325
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 8
    Top = 13
    Width = 121
    Height = 13
    Caption = 'Forma de Pagamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EdtCondicao: TEdit
    Left = 135
    Top = 10
    Width = 121
    Height = 17
    Hint = 'Digite o '#237'ndice da condi'#231#227'o de pagamento e pressione Enter'
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnKeyDown = EdtCondicaoKeyDown
    OnKeyPress = EdtCondicaoKeyPress
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 60
    Width = 311
    Height = 237
    Caption = 'Formas de Pagamento Dispon'#237'veis'
    TabOrder = 2
    object ListBox1: TListBox
      Left = 1
      Top = 18
      Width = 307
      Height = 214
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
    end
  end
  object EdtForma_Pagamento: TEdit
    Left = 8
    Top = 35
    Width = 311
    Height = 25
    BevelInner = bvNone
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object Button1: TButton
    Left = 273
    Top = 1
    Width = 43
    Height = 25
    Caption = '&OK'
    Enabled = False
    TabOrder = 1
    OnClick = Button1Click
  end
end
