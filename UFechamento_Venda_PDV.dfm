object FrmFechamento_Venda_PDV: TFrmFechamento_Venda_PDV
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fechamento Venda'
  ClientHeight = 484
  ClientWidth = 814
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
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object LblSubTotal: TLabel
    Left = 123
    Top = 91
    Width = 53
    Height = 13
    Caption = 'Sub Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblDesAcr: TLabel
    Left = 227
    Top = 91
    Width = 58
    Height = 13
    Caption = 'Desc./Acr.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 3
    Top = 148
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
    Left = 322
    Top = 384
    Width = 84
    Height = 13
    Caption = 'Total Recebido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 520
    Top = 384
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
  object Shape1: TShape
    Left = 3
    Top = 3
    Width = 802
    Height = 72
    Brush.Color = clNavy
    Pen.Color = clNavy
    Pen.Width = 2
    Shape = stRoundRect
  end
  object LblFechamento: TLabel
    Left = 8
    Top = 47
    Width = 797
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label6: TLabel
    Left = 195
    Top = 148
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
  object LblData_Pedido: TLabel
    Left = 696
    Top = 201
    Width = 74
    Height = 13
    Caption = 'LblData_Pedido'
    Visible = False
  end
  object LblN_Pedido: TLabel
    Left = 681
    Top = 208
    Width = 58
    Height = 13
    Caption = 'LblN_Pedido'
    Visible = False
  end
  object Label7: TLabel
    Left = 3
    Top = 204
    Width = 121
    Height = 13
    Caption = 'Forma de Pagamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCodigo: TLabel
    Left = 76
    Top = 129
    Width = 3
    Height = 13
  end
  object Shape7: TShape
    Left = 3
    Top = 446
    Width = 802
    Height = 37
    Brush.Color = clNavy
    Shape = stRoundRect
  end
  object LblHnde: TLabel
    Left = 420
    Top = 186
    Width = 3
    Height = 13
    Visible = False
  end
  object LblFecha: TLabel
    Left = 8
    Top = 8
    Width = 784
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = 'FECHAMENTO DA VENDA'
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label8: TLabel
    Left = 8
    Top = 458
    Width = 797
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = '<Enter>-Fechamento do Cupom Fiscal '
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label9: TLabel
    Left = 578
    Top = 236
    Width = 97
    Height = 13
    Caption = 'Dados adicionais '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 387
    Top = 91
    Width = 183
    Height = 13
    Caption = 'Mensagens da emiss'#227'o da NFC-e'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 322
    Top = 236
    Width = 203
    Height = 13
    Caption = 'Formas de pagamento selecionadas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 129
    Width = 65
    Height = 13
    Caption = 'C'#243'd. Venda:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EdtSub_Total: TEdit
    Left = 123
    Top = 106
    Width = 105
    Height = 17
    TabStop = False
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnExit = EdtSub_TotalExit
  end
  object EdtDesconto: TEdit
    Left = 227
    Top = 106
    Width = 89
    Height = 17
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = '0,00'
    OnEnter = EdtDescontoEnter
    OnExit = EdtDescontoExit
    OnKeyPress = EdtDescontoKeyPress
  end
  object EdtTotal_Venda: TEdit
    Left = 3
    Top = 162
    Width = 193
    Height = 40
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    Text = '0,00'
    OnEnter = EdtTotal_VendaEnter
    OnExit = EdtTotal_VendaExit
  end
  object EdtValor_Recebido: TEdit
    Left = 322
    Top = 398
    Width = 199
    Height = 40
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 10
    Text = '0,00'
    OnKeyPress = EdtValor_RecebidoKeyPress
  end
  object EdtTroco: TEdit
    Left = 520
    Top = 398
    Width = 149
    Height = 40
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 11
    Text = '0,00'
    OnKeyPress = EdtTrocoKeyPress
  end
  object DBGrid1: TDBGrid
    Left = 322
    Top = 255
    Width = 256
    Height = 126
    BorderStyle = bsNone
    DataSource = DM.ds_fechamento_Venda
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
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
        Width = 131
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
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo_Documento'
        Visible = False
      end>
  end
  object GroupBox1: TGroupBox
    Left = 3
    Top = 244
    Width = 313
    Height = 194
    Caption = 'Formas de Pagamento para o Cupom Fiscal'
    TabOrder = 12
    object ListBox1: TListBox
      Left = 1
      Top = 20
      Width = 264
      Height = 165
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
      OnClick = ListBox1Click
    end
  end
  object EdtValor: TEdit
    Left = 195
    Top = 162
    Width = 192
    Height = 40
    Hint = 
      'Informe o valor recebido para a condi'#231#227'o de pagamento escolhida ' +
      'e pressione a tecla ENTER'
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = '0,00'
    OnEnter = EdtValorEnter
    OnExit = EdtValorExit
    OnKeyDown = EdtValorKeyDown
    OnKeyPress = EdtValorKeyPress
  end
  object EdtForma_Pagamento: TEdit
    Left = 3
    Top = 219
    Width = 313
    Height = 25
    BevelInner = bvNone
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnKeyPress = EdtValor_RecebidoKeyPress
  end
  object RGTipo: TRadioGroup
    Left = 3
    Top = 81
    Width = 54
    Height = 42
    Hint = 'Desconto ou Acrescimo'
    Caption = 'D/A'
    ItemIndex = 1
    Items.Strings = (
      '+'
      '-')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TabStop = True
    OnClick = RGTipoClick
  end
  object RGDesc_Acr: TRadioGroup
    Left = 63
    Top = 81
    Width = 54
    Height = 42
    Hint = 'Tipo do desconto ou acrescimo. Percentual ou Valor'
    Caption = 'Tipo D/A'
    ItemIndex = 1
    Items.Strings = (
      '%'
      'R$')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TabStop = True
    OnClick = RGDesc_AcrClick
  end
  object MmoDados_Adicionais: TMemo
    Left = 578
    Top = 250
    Width = 227
    Height = 131
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    ScrollBars = ssVertical
    TabOrder = 9
  end
  object MemoNFCe: TMemo
    Left = 387
    Top = 106
    Width = 418
    Height = 124
    Hint = 
      'Esse campo '#233' utilizado apenas para exibir mensagens durante a em' +
      'iss'#227'o da NFC-e.'
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    ParentShowHint = False
    ReadOnly = True
    ScrollBars = ssVertical
    ShowHint = True
    TabOrder = 6
  end
  object cbVisualizarDANFE: TCheckBox
    Left = 387
    Top = 75
    Width = 183
    Height = 17
    Caption = 'Visulizar DANFCE ao gerar NFCe?'
    TabOrder = 13
  end
  object BtnGerarNFCe: TButton
    Left = 576
    Top = 78
    Width = 75
    Height = 25
    Caption = 'Gerar NFCe'
    TabOrder = 14
    Visible = False
    OnClick = BtnGerarNFCeClick
  end
  object BtnEnviarNFCe: TButton
    Left = 657
    Top = 78
    Width = 75
    Height = 25
    Caption = 'Enviar NFCe'
    TabOrder = 15
    Visible = False
    OnClick = BtnEnviarNFCeClick
  end
  object BtnEdita_Itens: TButton
    Left = 738
    Top = 78
    Width = 75
    Height = 25
    Caption = 'Editar Itens'
    TabOrder = 16
    Visible = False
    OnClick = BtnEdita_ItensClick
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select PL.N_Documento, PL.Data_Vencimento, PL.Valor from Parcela' +
        's_Lancamentos PL')
    Left = 376
    Top = 79
    object ADOQuery1N_Documento: TIntegerField
      FieldName = 'N_Documento'
    end
    object ADOQuery1Data_Vencimento: TDateTimeField
      FieldName = 'Data_Vencimento'
    end
    object ADOQuery1Valor: TFloatField
      FieldName = 'Valor'
    end
  end
  object qryitens_venda: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select IP.*, M.Descricao as Marca from Itens_Pedido IP'
      'left join Produto P on (IP.Codigo_Produto = P.Codigo)'
      'left join Marca M on (P.Codigo_Marca = M.Codigo)')
    Left = 344
    Top = 90
    object qryitens_vendaCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qryitens_vendaN_Item: TStringField
      FieldName = 'N_Item'
      Size = 10
    end
    object qryitens_vendaCodigo_Produto: TIntegerField
      FieldName = 'Codigo_Produto'
    end
    object qryitens_vendaCodigo_Venda: TStringField
      FieldName = 'Codigo_Venda'
    end
    object qryitens_vendaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qryitens_vendaNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object qryitens_vendaOrigem: TStringField
      FieldName = 'Origem'
      Size = 1
    end
    object qryitens_vendaCFOP: TStringField
      FieldName = 'CFOP'
      Size = 10
    end
    object qryitens_vendaUN: TStringField
      FieldName = 'UN'
      Size = 10
    end
    object qryitens_vendaTipo_Calculo_BC_ICMS: TStringField
      FieldName = 'Tipo_Calculo_BC_ICMS'
      Size = 50
    end
    object qryitens_vendaTipo_Recolhimento: TStringField
      FieldName = 'Tipo_Recolhimento'
      Size = 10
    end
    object qryitens_vendaICMS: TStringField
      FieldName = 'ICMS'
      Size = 10
    end
    object qryitens_vendaCST: TStringField
      FieldName = 'CST'
      Size = 10
    end
    object qryitens_vendaCSOSN: TStringField
      FieldName = 'CSOSN'
      Size = 5
    end
    object qryitens_vendaBase_Reduzida: TStringField
      FieldName = 'Base_Reduzida'
      Size = 5
    end
    object qryitens_vendaBase_Acrescida: TStringField
      FieldName = 'Base_Acrescida'
      Size = 5
    end
    object qryitens_vendaBC: TStringField
      FieldName = 'BC'
      Size = 10
    end
    object qryitens_vendaValor_ICMS: TStringField
      FieldName = 'Valor_ICMS'
    end
    object qryitens_vendaTipo_Calculo_BC_ICMS_ST: TStringField
      FieldName = 'Tipo_Calculo_BC_ICMS_ST'
      Size = 50
    end
    object qryitens_vendaMVAST: TStringField
      FieldName = 'MVAST'
      Size = 10
    end
    object qryitens_vendaICMS_ST: TStringField
      FieldName = 'ICMS_ST'
      Size = 10
    end
    object qryitens_vendaCST_ST: TStringField
      FieldName = 'CST_ST'
      Size = 10
    end
    object qryitens_vendaBase_Reduzida_ST: TStringField
      FieldName = 'Base_Reduzida_ST'
      Size = 5
    end
    object qryitens_vendaBase_Acrescida_ST: TStringField
      FieldName = 'Base_Acrescida_ST'
      Size = 5
    end
    object qryitens_vendaBC_ST: TStringField
      FieldName = 'BC_ST'
      Size = 10
    end
    object qryitens_vendaValor_ICMS_ST: TStringField
      FieldName = 'Valor_ICMS_ST'
    end
    object qryitens_vendaAliquota_Calculo_Credito: TStringField
      FieldName = 'Aliquota_Calculo_Credito'
      Size = 10
    end
    object qryitens_vendaCredito_ICMS: TStringField
      FieldName = 'Credito_ICMS'
    end
    object qryitens_vendaTipo_Calculo_IPI: TStringField
      FieldName = 'Tipo_Calculo_IPI'
    end
    object qryitens_vendaIPI: TStringField
      FieldName = 'IPI'
      Size = 10
    end
    object qryitens_vendaCST_IPI: TStringField
      FieldName = 'CST_IPI'
      Size = 10
    end
    object qryitens_vendaBase_Reduzida_IPI: TStringField
      FieldName = 'Base_Reduzida_IPI'
      Size = 10
    end
    object qryitens_vendaBase_Acrescida_IPI: TStringField
      FieldName = 'Base_Acrescida_IPI'
      Size = 10
    end
    object qryitens_vendaBC_IPI: TStringField
      FieldName = 'BC_IPI'
      Size = 10
    end
    object qryitens_vendaValor_IPI: TFloatField
      FieldName = 'Valor_IPI'
    end
    object qryitens_vendaTipo_Calculo_PIS: TStringField
      FieldName = 'Tipo_Calculo_PIS'
    end
    object qryitens_vendaPIS: TStringField
      FieldName = 'PIS'
      Size = 10
    end
    object qryitens_vendaCST_PIS: TStringField
      FieldName = 'CST_PIS'
      Size = 10
    end
    object qryitens_vendaBase_Reduzida_PIS: TStringField
      FieldName = 'Base_Reduzida_PIS'
      Size = 10
    end
    object qryitens_vendaBase_Acrescida_PIS: TStringField
      FieldName = 'Base_Acrescida_PIS'
      Size = 10
    end
    object qryitens_vendaBC_PIS: TStringField
      FieldName = 'BC_PIS'
      Size = 10
    end
    object qryitens_vendaValor_PIS: TFloatField
      FieldName = 'Valor_PIS'
    end
    object qryitens_vendaTipo_Calculo_COFINS: TStringField
      FieldName = 'Tipo_Calculo_COFINS'
    end
    object qryitens_vendaCOFINS: TStringField
      FieldName = 'COFINS'
      Size = 10
    end
    object qryitens_vendaCST_COFINS: TStringField
      FieldName = 'CST_COFINS'
      Size = 10
    end
    object qryitens_vendaBase_Reduzida_COFINS: TStringField
      FieldName = 'Base_Reduzida_COFINS'
      Size = 10
    end
    object qryitens_vendaBase_Acrescida_COFINS: TStringField
      FieldName = 'Base_Acrescida_COFINS'
      Size = 10
    end
    object qryitens_vendaBC_COFINS: TStringField
      FieldName = 'BC_COFINS'
      Size = 10
    end
    object qryitens_vendaValor_COFINS: TFloatField
      FieldName = 'Valor_COFINS'
    end
    object qryitens_vendaQtde: TFloatField
      Alignment = taCenter
      FieldName = 'Qtde'
    end
    object qryitens_vendaValor_Unitario: TFloatField
      Alignment = taCenter
      FieldName = 'Valor_Unitario'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_vendaValor_Frete: TFloatField
      FieldName = 'Valor_Frete'
    end
    object qryitens_vendaValor_Seguro: TFloatField
      FieldName = 'Valor_Seguro'
    end
    object qryitens_vendaOutras_Despesas: TFloatField
      FieldName = 'Outras_Despesas'
    end
    object qryitens_vendaSub_Total: TFloatField
      Alignment = taCenter
      FieldName = 'Sub_Total'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_vendaSub_Total_Liquido: TFloatField
      FieldName = 'Sub_Total_Liquido'
    end
    object qryitens_vendaCancelado: TStringField
      FieldName = 'Cancelado'
      Size = 1
    end
    object qryitens_vendaIndica_Valor_Total: TStringField
      FieldName = 'Indica_Valor_Total'
      Size = 1
    end
    object qryitens_vendaDesc_Acr: TFloatField
      Alignment = taCenter
      FieldName = 'Desc_Acr'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_vendaTipo_Desc_Acr: TStringField
      FieldName = 'Tipo_Desc_Acr'
      Size = 1
    end
    object qryitens_vendaCodigo_Registro: TAutoIncField
      FieldName = 'Codigo_Registro'
      ProviderFlags = [pfInUpdate, pfInWhere, pfHidden]
      ReadOnly = True
    end
    object qryitens_vendaMarca: TStringField
      FieldName = 'Marca'
      Size = 30
    end
    object qryitens_vendaValor_Original: TFloatField
      FieldName = 'Valor_Original'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_vendaValor_Compra: TFloatField
      FieldName = 'Valor_Compra'
      DisplayFormat = '#0.0,0'
    end
    object qryitens_vendaQtde_Estoque_Atual: TFloatField
      FieldName = 'Qtde_Estoque_Atual'
    end
    object qryitens_vendaTipo_Calculo_BC_ICMS_NF: TStringField
      FieldName = 'Tipo_Calculo_BC_ICMS_NF'
      Size = 50
    end
    object qryitens_vendaTipo_Recolhimento_NF: TStringField
      FieldName = 'Tipo_Recolhimento_NF'
      Size = 10
    end
    object qryitens_vendaICMS_NF: TStringField
      FieldName = 'ICMS_NF'
      Size = 10
    end
    object qryitens_vendaCST_NF: TStringField
      FieldName = 'CST_NF'
      Size = 10
    end
    object qryitens_vendaCSOSN_NF: TStringField
      FieldName = 'CSOSN_NF'
      Size = 5
    end
    object qryitens_vendaBase_Reduzida_NF: TStringField
      FieldName = 'Base_Reduzida_NF'
      Size = 5
    end
    object qryitens_vendaBase_Acrescida_NF: TStringField
      FieldName = 'Base_Acrescida_NF'
      Size = 5
    end
    object qryitens_vendaBC_NF: TStringField
      FieldName = 'BC_NF'
      Size = 10
    end
    object qryitens_vendaValor_ICMS_NF: TStringField
      FieldName = 'Valor_ICMS_NF'
    end
    object qryitens_vendaQtde_Entregue: TFloatField
      FieldName = 'Qtde_Entregue'
    end
    object qryitens_vendaQtde_Restante: TFloatField
      FieldName = 'Qtde_Restante'
    end
    object qryitens_vendaQtde_S_Previsao: TFloatField
      FieldName = 'Qtde_S_Previsao'
    end
    object qryitens_vendaDesc_Acr_P: TFloatField
      FieldName = 'Desc_Acr_P'
    end
    object qryitens_vendadOUa: TStringField
      FieldName = 'dOUa'
      Size = 1
    end
    object qryitens_vendaData_Entrega: TDateTimeField
      FieldName = 'Data_Entrega'
    end
    object qryitens_vendaHora_Entrega: TStringField
      FieldName = 'Hora_Entrega'
      Size = 8
    end
    object qryitens_vendaTipo_Venda: TStringField
      FieldName = 'Tipo_Venda'
      Size = 1
    end
    object qryitens_vendaTipo_Entrega: TStringField
      FieldName = 'Tipo_Entrega'
      Size = 1
    end
    object qryitens_vendaComissao: TFloatField
      FieldName = 'Comissao'
    end
    object qryitens_vendaPerc_Desc_Vista: TFloatField
      FieldName = 'Perc_Desc_Vista'
    end
    object qryitens_vendaPerc_Desc_Prazo: TFloatField
      FieldName = 'Perc_Desc_Prazo'
    end
    object qryitens_vendaPermite_Credito: TIntegerField
      FieldName = 'Permite_Credito'
    end
    object qryitens_vendaCodigo_Obs_Fiscal: TIntegerField
      FieldName = 'Codigo_Obs_Fiscal'
    end
    object qryitens_vendaValor_Compra_Nota: TFloatField
      FieldName = 'Valor_Compra_Nota'
    end
    object qryitens_vendaFicha_Estoque_Codigo: TIntegerField
      FieldName = 'Ficha_Estoque_Codigo'
    end
  end
  object ACBrEnterTab1: TACBrEnterTab
    EnterAsTab = True
    Left = 384
    Top = 66
  end
  object rs: TRSPrinter
    PageSize = pzLegal
    PageLength = 0
    FastPrinter = Epson_FX
    FastFont = []
    FastPort = 'LPT1'
    SaveConfToRegistry = False
    Preview = ppYes
    Left = 456
    Top = 131
  end
end
