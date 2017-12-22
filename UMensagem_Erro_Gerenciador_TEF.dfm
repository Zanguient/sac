object FrmMensagem_Erro_Gerenciador_TEF: TFrmMensagem_Erro_Gerenciador_TEF
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 89
  ClientWidth = 479
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LblMensagem: TLabel
    Left = 0
    Top = 24
    Width = 473
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'O Gerenciador padr'#227'o N'#195'O est'#225' ativo.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 200
    Top = 61
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 0
    OnClick = Button1Click
  end
end
