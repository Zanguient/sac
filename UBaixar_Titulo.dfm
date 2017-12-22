object FrmBaixar_Titulo: TFrmBaixar_Titulo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Baixar T'#237'tulos a Pagar/Receber'
  ClientHeight = 159
  ClientWidth = 546
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object LblValor: TLabel
    Left = 281
    Top = 39
    Width = 74
    Height = 13
    Caption = 'Valor Parcela'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblN_Nota_Fiscal: TLabel
    Left = 142
    Top = 38
    Width = 65
    Height = 13
    Caption = 'Documento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblData_Vencimento: TLabel
    Left = 368
    Top = 38
    Width = 60
    Height = 13
    Caption = 'Data Venc.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblParcela: TLabel
    Left = 222
    Top = 39
    Width = 42
    Height = 13
    Caption = 'Parcela'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblData_Pagamento: TLabel
    Left = 432
    Top = 38
    Width = 54
    Height = 13
    Caption = 'Data Pag.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 255
    Top = 77
    Width = 75
    Height = 13
    Caption = 'Valor '#224' Pagar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 142
    Top = 167
    Width = 33
    Height = 13
    Caption = 'Conta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 263
    Top = 167
    Width = 42
    Height = 13
    Caption = 'Cheque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 142
    Top = 205
    Width = 54
    Height = 13
    Caption = 'Opera'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 335
    Top = 77
    Width = 52
    Height = 13
    Caption = 'Cond. PG.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 142
    Top = 77
    Width = 30
    Height = 13
    Caption = 'Desc.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 198
    Top = 77
    Width = 22
    Height = 13
    Caption = 'Acr.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 222
    Top = 117
    Width = 61
    Height = 13
    Caption = 'Valor Rest.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 142
    Top = 117
    Width = 70
    Height = 13
    Caption = 'Valor Receb.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 302
    Top = 117
    Width = 60
    Height = 13
    Caption = 'Valor Pago'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 142
    Top = 240
    Width = 50
    Height = 13
    Caption = 'Hist'#243'rico'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EdtValor_Parcela: TEdit
    Left = 281
    Top = 54
    Width = 88
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    ReadOnly = True
    TabOrder = 2
    OnExit = EdtValor_ParcelaExit
  end
  object EdtN_Documento: TEdit
    Left = 142
    Top = 54
    Width = 81
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    ReadOnly = True
    TabOrder = 0
  end
  object MEdtData_Vencimento: TMaskEdit
    Left = 368
    Top = 54
    Width = 65
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    ReadOnly = True
    TabOrder = 3
    Text = '  /  /    '
  end
  object EdtParcela: TEdit
    Left = 222
    Top = 54
    Width = 60
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    ReadOnly = True
    TabOrder = 1
  end
  object MEdtData_Pagamento: TMaskEdit
    Left = 432
    Top = 54
    Width = 69
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 4
    Text = '  /  /    '
    OnEnter = MEdtData_PagamentoEnter
  end
  object EdtValor_Pagar: TEdit
    Left = 255
    Top = 93
    Width = 81
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 7
    Text = '0,00'
    OnEnter = EdtValor_PagarEnter
    OnExit = EdtValor_PagarExit
    OnKeyPress = EdtValor_PagarKeyPress
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 159
    Align = alLeft
    AutoSize = True
    ButtonHeight = 38
    ButtonWidth = 121
    DockSite = True
    DragCursor = crHandPoint
    DragKind = dkDock
    DrawingStyle = dsGradient
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esLowered
    EdgeOuter = esRaised
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    GradientEndColor = clWindow
    HideClippedButtons = True
    HotTrackColor = clMenu
    Images = DM.ImgImagens_Comandos
    List = True
    ParentFont = False
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = False
    TabOrder = 20
    object BBtnSalvar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Clique para Salvar o registro'
      Caption = '&Salvar'
      ImageIndex = 1
      ParentShowHint = False
      Wrap = True
      ShowHint = True
      OnClick = BBtnSalvarClick
    end
    object BBtnFechar: TToolButton
      Left = 0
      Top = 38
      Cursor = crHandPoint
      Hint = 'Clique para Fechar a Janela Ativa'
      Caption = '&Fechar Janela'
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object EdtOperacao_Bancaria: TEdit
    Left = 194
    Top = 219
    Width = 209
    Height = 17
    TabStop = False
    BevelEdges = [beLeft, beTop, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 18
    OnKeyPress = EdtOperacao_BancariaKeyPress
  end
  object EdtTipo_Operacao: TEdit
    Left = 402
    Top = 219
    Width = 38
    Height = 17
    TabStop = False
    BevelEdges = [beTop, beRight, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    TabOrder = 19
    OnKeyPress = EdtTipo_OperacaoKeyPress
  end
  object EdtConta: TEdit
    Left = 194
    Top = 182
    Width = 70
    Height = 17
    TabStop = False
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 14
    OnKeyPress = EdtContaKeyPress
  end
  object RGStatus: TRadioGroup
    Left = 441
    Top = 176
    Width = 93
    Height = 60
    Caption = 'Status'
    ItemIndex = 0
    Items.Strings = (
      'Bloqueado'
      'Liberado')
    TabOrder = 21
  end
  object EdtCheque: TEdit
    Left = 315
    Top = 182
    Width = 125
    Height = 17
    TabStop = False
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    OnKeyPress = EdtChequeKeyPress
  end
  object EdtCodigo_Conta: TEdit
    Left = 142
    Top = 182
    Width = 53
    Height = 17
    Hint = 'Pressione F3 para consultar'
    BevelEdges = [beLeft, beTop, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clMenu
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnDblClick = EdtCodigo_ContaDblClick
    OnKeyDown = EdtCodigo_ContaKeyDown
    OnKeyPress = EdtCodigo_ContaKeyPress
  end
  object EdtCodigo_Cheque: TEdit
    Left = 263
    Top = 182
    Width = 53
    Height = 17
    Hint = 'Pressione F3 para consultar'
    BevelEdges = [beLeft, beTop, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clMenu
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
    OnDblClick = EdtCodigo_ChequeDblClick
    OnKeyDown = EdtCodigo_ChequeKeyDown
    OnKeyPress = EdtCodigo_ChequeKeyPress
  end
  object EdtCodigo_Operacao: TEdit
    Left = 142
    Top = 219
    Width = 53
    Height = 17
    Hint = 'Pressione F3 para consultar'
    BevelEdges = [beLeft, beTop, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clMenu
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
    OnDblClick = EdtCodigo_OperacaoDblClick
    OnKeyDown = EdtCodigo_OperacaoKeyDown
    OnKeyPress = EdtCodigo_OperacaoKeyPress
  end
  object CBBanco: TCheckBox
    Left = 142
    Top = 8
    Width = 97
    Height = 17
    Caption = 'Banco'
    TabOrder = 23
    OnClick = CBBancoClick
  end
  object EdtCondicao_Pagamento: TEdit
    Left = 395
    Top = 93
    Width = 106
    Height = 17
    TabStop = False
    BevelEdges = [beTop, beRight, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = False
    TabOrder = 9
    OnKeyPress = EdtCondicao_PagamentoKeyPress
  end
  object EdtCodigo_Condicao_Pagamento: TEdit
    Left = 335
    Top = 93
    Width = 60
    Height = 17
    Hint = 'Pressione F3 para consultar'
    BevelEdges = [beLeft, beTop, beBottom]
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Color = clMenu
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnDblClick = EdtCodigo_Condicao_PagamentoDblClick
    OnKeyDown = EdtCodigo_Condicao_PagamentoKeyDown
    OnKeyPress = EdtCodigo_Condicao_PagamentoKeyPress
  end
  object EdtDesconto: TEdit
    Left = 142
    Top = 93
    Width = 57
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 5
    Text = '0,00'
    OnExit = EdtDescontoExit
    OnKeyPress = EdtValor_PagoKeyPress
  end
  object EdtAcrescimo: TEdit
    Left = 198
    Top = 93
    Width = 58
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 6
    Text = '0,00'
    OnExit = EdtAcrescimoExit
    OnKeyPress = EdtValor_PagoKeyPress
  end
  object EdtValor_Restante: TEdit
    Left = 222
    Top = 133
    Width = 81
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 11
    Text = '0,00'
    OnEnter = EdtValor_RestanteEnter
    OnExit = EdtValor_RestanteExit
    OnKeyPress = EdtValor_PagoKeyPress
  end
  object EdtValor_Recebido: TEdit
    Left = 142
    Top = 133
    Width = 81
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 10
    Text = '0,00'
    OnExit = EdtValor_RecebidoExit
    OnKeyPress = EdtValor_PagoKeyPress
  end
  object EdtValor_Pago: TEdit
    Left = 302
    Top = 133
    Width = 81
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 12
    Text = '0,00'
    OnEnter = EdtValor_PagoEnter
    OnExit = EdtValor_PagoExit
    OnKeyPress = EdtValor_PagoKeyPress
  end
  object EdtHistorico: TEdit
    Left = 142
    Top = 256
    Width = 298
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    MaxLength = 50
    TabOrder = 22
  end
  object SPAtualiza_Status_Conta: TADOStoredProc
    Connection = DM.ADOConnection1
    ProcedureName = 'Atualiza_Status_Contas;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Codigo'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Parcela'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Status'
        Attributes = [paNullable]
        DataType = ftString
        Size = 8
        Value = Null
      end
      item
        Name = '@Data_Pagamento'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 468
  end
  object SPAtualiza_Status_Conta_Tudo: TADOStoredProc
    Connection = DM.ADOConnection1
    ProcedureName = 'Atualiza_Status_Contas_Tudo;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@Codigo_Cli_For'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Status'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@Data_Pagamento'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end>
    Left = 500
  end
  object SPAtualiza_Saldo_Bancario: TADOStoredProc
    Connection = DM.ADOConnection1
    ProcedureName = 'Atualiza_Saldo_Bancario;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@Codigo'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Saldo_Atual'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end>
    Left = 440
  end
end
