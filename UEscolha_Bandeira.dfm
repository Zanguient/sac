object FrmEscolha_Bandeira: TFrmEscolha_Bandeira
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Escolha '
  ClientHeight = 413
  ClientWidth = 318
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BBtnTEF_Dial: TBitBtn
    Left = 32
    Top = 8
    Width = 261
    Height = 74
    Cursor = crHandPoint
    Caption = '&1                                    TEF DIAL'
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 0
    OnClick = BBtnTEF_DialClick
  end
  object BBtnTEF_Disc: TBitBtn
    Left = 32
    Top = 88
    Width = 261
    Height = 74
    Cursor = crHandPoint
    Caption = '&2                                    TEF DISC'
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 1
    OnClick = BBtnTEF_DiscClick
  end
  object BBtnPayGO: TBitBtn
    Left = 32
    Top = 168
    Width = 261
    Height = 74
    Cursor = crHandPoint
    Caption = '&3                                       PAY GO'
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 2
    OnClick = BBtnPayGOClick
  end
  object BitBtn4: TBitBtn
    Left = 32
    Top = 336
    Width = 261
    Height = 74
    Cursor = crHandPoint
    Caption = '&9                                      FECHAR'
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn4Click
  end
end
