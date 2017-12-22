object FrmInforma_NNF: TFrmInforma_NNF
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'N'#250'mero da nota fiscal'
  ClientHeight = 111
  ClientWidth = 228
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object LblCodigo: TLabel
    Left = 8
    Top = 29
    Width = 87
    Height = 13
    Caption = 'Nota de Origem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 123
    Top = 29
    Width = 89
    Height = 13
    Caption = 'Nota de Destino'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EdtNota_Origem: TEdit
    Left = 8
    Top = 48
    Width = 97
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object EdtNota_Destino: TEdit
    Left = 123
    Top = 48
    Width = 97
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object Button1: TButton
    Left = 92
    Top = 84
    Width = 43
    Height = 25
    Caption = '&OK'
    TabOrder = 2
    OnClick = Button1Click
  end
end
