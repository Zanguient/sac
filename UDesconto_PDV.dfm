object FrmDesconto_PDV: TFrmDesconto_PDV
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Desc./Acr.'
  ClientHeight = 134
  ClientWidth = 227
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 63
    Width = 29
    Height = 13
    Caption = 'Valor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RGAcr_Desc: TRadioGroup
    Left = 32
    Top = 3
    Width = 69
    Height = 54
    Caption = 'Acr./Desc.'
    ItemIndex = 1
    Items.Strings = (
      '+'
      '-')
    TabOrder = 2
  end
  object EdtValor: TEdit
    Left = 72
    Top = 78
    Width = 76
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 0
    Text = '0,00'
    OnKeyPress = EdtValorKeyPress
  end
  object Button1: TButton
    Left = 72
    Top = 101
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 1
    OnClick = Button1Click
  end
  object RGTipo: TRadioGroup
    Left = 128
    Top = 3
    Width = 57
    Height = 54
    Caption = 'Tipo'
    ItemIndex = 1
    Items.Strings = (
      '%'
      'R$')
    TabOrder = 3
  end
end
