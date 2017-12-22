object FrmVendas_Periodo: TFrmVendas_Periodo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Vendas do Per'#237'odo'
  ClientHeight = 172
  ClientWidth = 411
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 168
    Top = 47
    Width = 31
    Height = 13
    Caption = 'Inicio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 272
    Top = 47
    Width = 20
    Height = 13
    Caption = 'Fim'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblMarca: TLabel
    Left = 168
    Top = 86
    Width = 19
    Height = 13
    Caption = 'ECF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TlbFerramentas: TToolBar
    Left = 0
    Top = 0
    Width = 125
    Height = 172
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
    Images = DM.ImgImagens_PAF
    List = True
    ParentFont = False
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = False
    TabOrder = 4
    object BBtnSalvar: TToolButton
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Hint = 'Clique para Enviar o relat'#243'rio para a impressora fiscal'
      Caption = '&Enviar'
      Enabled = False
      ImageIndex = 0
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
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = BBtnFecharClick
    end
  end
  object MEdtData_Final: TMaskEdit
    Left = 272
    Top = 61
    Width = 64
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 1
    Text = '  /  /    '
    OnExit = MEdtData_FinalExit
  end
  object MEdtData_Inicial: TMaskEdit
    Left = 168
    Top = 61
    Width = 66
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    EditMask = '!99/99/9999;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 0
    Text = '  /  /    '
    OnExit = MEdtData_InicialExit
  end
  object CBConvenio: TCheckBox
    Left = 195
    Top = 129
    Width = 143
    Height = 17
    Caption = 'Conv'#234'nio 57/95 - Sintegra'
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object CBAto_Cotepe: TCheckBox
    Left = 195
    Top = 147
    Width = 182
    Height = 17
    Caption = 'Ato Cotepe/ICMS 09/08 - SPED'
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object EdtECF: TEdit
    Left = 168
    Top = 102
    Width = 223
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    CharCase = ecUpperCase
    TabOrder = 5
  end
  object CdsRegistros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 232
    Top = 8
    object CdsRegistrosRegistro: TStringField
      FieldName = 'Registro'
      Size = 2
    end
    object CdsRegistrosTotal: TIntegerField
      FieldName = 'Total'
    end
  end
  object ControleLinhaBloco: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 8
    object ControleLinhaBlocoBLOCO: TStringField
      FieldName = 'BLOCO'
      Size = 4
    end
    object ControleLinhaBlocoQUANT: TIntegerField
      FieldName = 'QUANT'
    end
  end
  object CdsClienteAux: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 8
    object CdsClienteAuxID: TStringField
      FieldName = 'ID'
      Size = 10
    end
    object CdsClienteAuxDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object CdsClienteAuxCNPJCPF: TStringField
      FieldName = 'CNPJCPF'
      Size = 18
    end
  end
  object DataSetProvider1: TDataSetProvider
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 152
    Top = 8
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Teste.xml'
    Params = <>
    Left = 312
    Top = 8
    object ClientDataSet1Valor: TFloatField
      FieldName = 'Valor'
    end
    object ClientDataSet1Aliquota: TFloatField
      FieldName = 'Aliquota'
    end
    object ClientDataSet1CFOP: TStringField
      FieldName = 'CFOP'
    end
    object ClientDataSet1Registro: TIntegerField
      FieldName = 'Registro'
    end
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 352
    Top = 8
    object ClientDataSet2Aliquota: TFloatField
      FieldName = 'Aliquota'
    end
    object ClientDataSet2CFOP: TStringField
      FieldName = 'CFOP'
      Size = 5
    end
    object ClientDataSet2ST: TStringField
      FieldName = 'ST'
      Size = 3
    end
    object ClientDataSet2Valor_Operacao: TFloatField
      FieldName = 'Valor_Operacao'
    end
    object ClientDataSet2BC_ICMS: TFloatField
      FieldName = 'BC_ICMS'
    end
    object ClientDataSet2Valor_ICMS: TFloatField
      FieldName = 'Valor_ICMS'
    end
    object ClientDataSet2BC_ICMS_ST: TFloatField
      FieldName = 'BC_ICMS_ST'
    end
    object ClientDataSet2Valor_ICMS_ST: TFloatField
      FieldName = 'Valor_ICMS_ST'
    end
    object ClientDataSet2Valor_Red_BC: TFloatField
      FieldName = 'Valor_Red_BC'
    end
    object ClientDataSet2Valor_IPI: TFloatField
      FieldName = 'Valor_IPI'
    end
  end
  object ClientDataSet3: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Teste.xml'
    Params = <>
    Left = 352
    Top = 56
    object ClientDataSet3Aliquota: TStringField
      FieldName = 'Aliquota'
      Size = 5
    end
    object ClientDataSet3CFOP: TStringField
      FieldName = 'CFOP'
      Size = 10
    end
    object ClientDataSet3ST: TStringField
      FieldName = 'ST'
      Size = 5
    end
    object ClientDataSet3Valor_Operacao: TFloatField
      FieldName = 'Valor_Operacao'
    end
    object ClientDataSet3BC_ICMS: TFloatField
      FieldName = 'BC_ICMS'
    end
    object ClientDataSet3Valor_ICMS: TFloatField
      FieldName = 'Valor_ICMS'
    end
  end
  object ACBrSintegra: TACBrSintegra
    VersaoValidador = vv524
    Informa88SME = False
    Informa88SMS = False
    Informa88EAN = False
    Informa88C = False
    InformaSapiMG = False
    Left = 272
  end
  object ACBrSPEDFiscal1: TACBrSPEDFiscal
    Path = 'C:\Program Files\Embarcadero\RAD Studio\9.0\bin\'
    Delimitador = '|'
    TrimString = True
    CurMascara = '#0.00'
    Left = 240
    Top = 64
  end
end
