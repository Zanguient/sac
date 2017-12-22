object FrmInforma_Forma_Pagamento: TFrmInforma_Forma_Pagamento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informe a Condi'#231#227'o de Pagamento'
  ClientHeight = 87
  ClientWidth = 247
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
  object EdtCondicao: TEdit
    Left = 56
    Top = 40
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
  end
end
