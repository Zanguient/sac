object FrmInforma_DAV: TFrmInforma_DAV
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informe o N'#250'mero do DAV'
  ClientHeight = 108
  ClientWidth = 228
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
  PixelsPerInch = 96
  TextHeight = 13
  object EdtPedido: TEdit
    Left = 48
    Top = 83
    Width = 121
    Height = 17
    Hint = 'Digite o n'#250'mero do DAV desejado e pressione Enter'
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnKeyDown = EdtPedidoKeyDown
  end
  object RGTipo: TRadioGroup
    Left = 58
    Top = 8
    Width = 95
    Height = 49
    Caption = 'Tipo'
    ItemIndex = 0
    Items.Strings = (
      'DAV'
      'DAV-OS')
    TabOrder = 1
  end
  object Button1: TButton
    Left = 58
    Top = 52
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    Visible = False
    OnClick = Button1Click
  end
  object RS: TRSPrinter
    PageSize = pzLetter
    PageLength = 0
    FastPrinter = Epson_LX
    FastFont = [Compress]
    FastPort = 'LPT1'
    Mode = pmWindows
    SaveConfToRegistry = False
    Zoom = zHeight
    Preview = ppYes
    Left = 192
    Top = 8
  end
end
