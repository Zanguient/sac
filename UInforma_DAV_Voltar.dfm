object FrmInforma_DAV_Voltar: TFrmInforma_DAV_Voltar
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informe o N'#250'mero do DAV'
  ClientHeight = 69
  ClientWidth = 228
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
  PixelsPerInch = 96
  TextHeight = 13
  object EdtPedido: TEdit
    Left = 48
    Top = 27
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
end
