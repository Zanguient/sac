object FrmFechamento_Pedido: TFrmFechamento_Pedido
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fechamento de Pedido'
  ClientHeight = 325
  ClientWidth = 602
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 7
    Width = 67
    Height = 13
    Caption = 'Total Venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 195
    Top = 7
    Width = 84
    Height = 13
    Caption = 'Valor Recebido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 395
    Top = 3
    Width = 32
    Height = 13
    Caption = 'Troco'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 57
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
  object EdtTotal_Venda: TEdit
    Left = 8
    Top = 21
    Width = 188
    Height = 30
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    Text = '0,00'
  end
  object EdtValor_Recebido: TEdit
    Left = 195
    Top = 21
    Width = 201
    Height = 30
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Text = '0,00'
    OnExit = EdtValor_RecebidoExit
    OnKeyPress = EdtValor_RecebidoKeyPress
  end
  object EdtTroco: TEdit
    Left = 395
    Top = 21
    Width = 201
    Height = 30
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    Text = '0,00'
  end
  object DBGrid1: TDBGrid
    Left = 199
    Top = 107
    Width = 396
    Height = 214
    BorderStyle = bsNone
    DataSource = ds_qry_formas_pagamento
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Forma_Pagamento'
        Title.Caption = 'Forma de Pagamento'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Data'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo_Documento'
        Visible = False
      end>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 107
    Width = 185
    Height = 214
    Caption = 'Formas de Pagamento Dispon'#237'veis'
    TabOrder = 5
    object ListBox1: TListBox
      Left = 1
      Top = 16
      Width = 182
      Height = 196
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
  object EdtValor: TEdit
    Left = 8
    Top = 71
    Width = 177
    Height = 30
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Text = '0,00'
    OnEnter = EdtValorEnter
    OnKeyDown = EdtValorKeyDown
  end
  object qryfechamento_pedido: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from fechamento_venda')
    Left = 400
    Top = 232
    object qryfechamento_pedidoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryfechamento_pedidoN_Pedido: TStringField
      FieldName = 'N_Pedido'
      Size = 13
    end
    object qryfechamento_pedidoForma_Pagamento: TStringField
      FieldName = 'Forma_Pagamento'
      Size = 50
    end
    object qryfechamento_pedidoValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#0.0,0'
    end
    object qryfechamento_pedidoData: TDateTimeField
      FieldName = 'Data'
    end
    object qryfechamento_pedidoTipo_Documento: TStringField
      FieldName = 'Tipo_Documento'
      Size = 10
    end
  end
  object ds_qry_formas_pagamento: TDataSource
    DataSet = qryfechamento_pedido
    Left = 464
    Top = 232
  end
end
