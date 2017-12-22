object frmconfiguracao: Tfrmconfiguracao
  Left = 499
  Top = 216
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#227'o do FTP'
  ClientHeight = 215
  ClientWidth = 289
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 11
    Width = 87
    Height = 13
    Caption = 'Endere'#231'o do FTP:'
  end
  object Label2: TLabel
    Left = 62
    Top = 35
    Width = 39
    Height = 13
    Caption = 'Usu'#225'rio:'
  end
  object Label3: TLabel
    Left = 67
    Top = 61
    Width = 34
    Height = 13
    Caption = 'Senha:'
  end
  object Label4: TLabel
    Left = 51
    Top = 87
    Width = 50
    Height = 13
    Caption = 'Salvar em:'
  end
  object Label5: TLabel
    Left = 2
    Top = 113
    Width = 99
    Height = 13
    Caption = 'Diretorio do Servidor:'
  end
  object Label6: TLabel
    Left = 62
    Top = 138
    Width = 39
    Height = 13
    Caption = 'Arquivo:'
  end
  object edftp: TEdit
    Left = 102
    Top = 8
    Width = 183
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 0
  end
  object edusuario: TEdit
    Left = 102
    Top = 32
    Width = 184
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 1
  end
  object edsenha: TEdit
    Left = 102
    Top = 58
    Width = 184
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 2
  end
  object edsalvar: TEdit
    Left = 102
    Top = 84
    Width = 184
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 3
  end
  object eddiretorio: TEdit
    Left = 102
    Top = 110
    Width = 184
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 4
  end
  object edarquivo: TEdit
    Left = 102
    Top = 135
    Width = 184
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 5
  end
  object BitBtn1: TBitBtn
    Left = 105
    Top = 185
    Width = 75
    Height = 25
    DoubleBuffered = True
    Kind = bkOK
    ParentDoubleBuffered = False
    TabOrder = 6
    OnClick = BitBtn1Click
  end
  object CheckBox1: TCheckBox
    Left = 104
    Top = 160
    Width = 97
    Height = 17
    Caption = 'Modo Passivo'
    TabOrder = 7
  end
end
