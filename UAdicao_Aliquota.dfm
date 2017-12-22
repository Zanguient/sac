object FrmAdicao_Aliquota: TFrmAdicao_Aliquota
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Adi'#231#227'o de aliquota tribut'#225'ria'
  ClientHeight = 134
  ClientWidth = 227
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
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 135
    Top = 49
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
  object RGTipo: TRadioGroup
    Left = 16
    Top = 8
    Width = 113
    Height = 73
    Caption = 'Situa'#231#227'o'
    ItemIndex = 0
    Items.Strings = (
      'ICMS'
      'ISS')
    TabOrder = 0
  end
  object EdtValor: TEdit
    Left = 135
    Top = 64
    Width = 76
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 1
    Text = '0'
  end
  object Button1: TButton
    Left = 72
    Top = 101
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 2
    OnClick = Button1Click
  end
end
